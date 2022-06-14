// const { google } = require('googleapis')
// const path = require('path')
// const fs = require('fs')

import {google} from 'googleapis'
import fs from 'fs'

const client_id = '951046508386-1a1imphf1jihp3ghhin191gjg3dghu00.apps.googleusercontent.com'
const client_secret = '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'
const redirect_uri = 'https://developers.google.com/oauthplayground'
const refresh_token = '1//047dfNN40Y3uZCgYIARAAGAQSNwF-L9IrnHjQA8MjLKYvTzVlzFntSHO1sBJGdspCIOlBew9nSJGES-Y7MEidEtnDbYgm3M18GA4'

const oauth2client = new google.auth.OAuth2(
    client_id,
    client_secret,
    redirect_uri
)
oauth2client.setCredentials({refresh_token: refresh_token})

const drive = google.drive({
    version:'v3',
    auth:oauth2client
})

var dataFile = {}

async function saveToDrive(file,path){
    try {
        //mengupload file ke drive
        const fileUpload =  await drive.files.create({
            requestBody:{
                name:file,
                mimeType: 'image/jpg',
                parents:['1Oe1A9J0aS0U20N6_b6u4rq-UQ-VYl7Kn']
            },
            media:{
                mimeType: 'image/jpg',
                body: fs.createReadStream(path)
            }
        })
        const fileID = fileUpload.data['id']

        // mengubah permision dari file di drive menjadi public
        await drive.permissions.create({
            fileId: fileID,
            requestBody:{
                role: 'reader',
                type: 'anyone'
            }
        })

        // mengambil link file di drive
        const permision = await drive.files.get({
            fileId: fileID,
            fields:'webContentLink'
        })
        const linkFile = permision.data['webContentLink']

        dataFile = {id: fileID, link: linkFile}
        return {id: fileID, link: linkFile}

    } catch (error) {
        console.log(error.message)
    }
}

async function deleteFileDrive(id){
    try {
        const status = await drive.files.delete({
            fileId:id
        })
        console.log(status.status)
    } catch (error) {
        console.log(error.message)
    }
}
const file = 'shenhe.jpg'
const pathFile = 'C:/Users/wahyupurnama/Ngoding/BaliCraft/Microservices/shenhe.jpg'

deleteFileDrive('17AtvYuC2BWRBPHVKKoeHnnAyu1U59m41')