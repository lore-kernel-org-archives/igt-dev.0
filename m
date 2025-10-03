Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEABCCAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 00:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7293910E025;
	Fri,  3 Oct 2025 00:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JAZoP0QD";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87A10E025
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 00:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ql+zRyQjqGVA0fxNO/CnfOf/LyYFEqLf28GHj546X29vReyT+gCSoHWrkCm+TjBDNEKOx+qWpewnZWynai1wDImET4wEllZKls0Qc4CfPG3MZ0Pe+eMV8FoQESTkN+4UnUcNIv2a9qzaiER14InL610Mo/LDqI/ho1kWzZY+ZQjPTGywDxIeCaLCDXzxFmMMWFGptgdFgqhl+c1OyNJzfxvv396EakdoShvLgWAOZVzv2mHBLouDYVhgqjpAWCDlRchoNBN7q7gnHx5rVt6UlMePdz1/1T5XFMZWBskCnAsKtXN1MXh2nBANKTi0vKgDY2BeBvUMYoZtoPrQ42CF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD/WCMZFpn1F7hKlnkgdxvNLF/gPkfa9ZVf7jQ3KwK8=;
 b=BRNduPQdjnIzpmAG7cVlQsThBTUzouzduz8aflVkn6iaMrgfXzT0EnQMjo47MiIMITPZzFsYPK6CXOPOnreu6CDOVZwUaZFB5f7ucCwVC+0r6Co5BdG3Hn3zRNt3xk4RltHB2sXKpgVaTlLNFJXcCM7uRKGi26YjfndKwpSPCCuiz8shxUf37jUMaFOwbEfdEMYH8r54rjjU18T05SuE7p799/Uii6ZGrNXI004RRd1qaBGtHZJ+icb2O8DvxoPoRwxgrGFj1Rbh3I49OJnncAMEBS6iUl6dQ0urmiyy5kfkwdSxFeIGhEH5EcX0iholEXvQABCsE15+6hz30IkRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD/WCMZFpn1F7hKlnkgdxvNLF/gPkfa9ZVf7jQ3KwK8=;
 b=JAZoP0QD7Hgb61GWiJLE2d1lelu3GssDMxpSRw78/WvMvBmXLJlcffmCTZ2N8wxtaeqRc1k/saBXRbcA2+NFFTY1wmxp6CS5qJsiRucSko2V/6rq7kPgCtgb8AEAqfBorjr+Sk3doWXQxMA7Akr01/cF5O3ifVPH2WhwGX6PGN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 00:50:14 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:50:14 +0000
Message-ID: <1affbace-2be9-4d39-aed8-106d2b63e55e@amd.com>
Date: Thu, 2 Oct 2025 18:50:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 05/30] tests/kms_properties: Add colorop properties
 test
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-6-alex.hung@amd.com>
 <9e9c017d-aae9-4af7-8941-254edee40e6c@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <9e9c017d-aae9-4af7-8941-254edee40e6c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab65ddd-c4fd-4a2c-b4fc-08de0216d03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2hyeURlZzNrQmVMUDAvOE9XWDRrM1RZbkxVT0VaUUs5eDNNZjJjWEg2R2Qv?=
 =?utf-8?B?NUZnU0FHUWtXQjRpNlJ0MDIrV0lvVzc1TUczdlIyL0FVTDlDamdaL1hXd3Qx?=
 =?utf-8?B?b3R1S2lTcUo5Z1UyTkNoSEduR0doVGpOakJlMElRZHBQd1BVbjl1YWYxWmx2?=
 =?utf-8?B?SFJmeXpiVDE0Qm1QV0Q0VTZvUVAxKzNjUjF1d2tMOVJGc1VaV3lzcVQ3TFZq?=
 =?utf-8?B?L0htUHdiNXQrdGlJa2FwN3o4Q0tYVlRLY3NVSDlzd1dPUXU0Y2hsTnV5ZlpK?=
 =?utf-8?B?aEZyQk8wOVYyQVAwOGpwZVNsejNyVCs4Z1p2Yk1SYXllMmF6dEF5RXg4Uy9u?=
 =?utf-8?B?c05mNGhkdE5yYjRVU3pscTk2cUJoSG80djNoRlJLZkRMR2hrOTFQWWxLRVA1?=
 =?utf-8?B?VEl1NEx6UGpxYkhXYXZlRE9QU0ZhNUQ1dkc5RmNJYmQwaVBrdGJTMm44Unlv?=
 =?utf-8?B?Rms0bjRYbFlDK2NBeTRBcC9DaUphTW54UE1oNGFmTGJIb0FzVFhhdUZ0emVv?=
 =?utf-8?B?R2Q0aVhxTEcrVGxrSDZBUWpXajVVUmZXM3pHWnJNS09qdG9EVnBIME1lNENi?=
 =?utf-8?B?ek94QXZSdG9aRGIrOC85clRwb2ZCTXVEZ0hkR3BoVUhWc0tBaWFOam9aMGs0?=
 =?utf-8?B?bHU2M3liM09RNHdLUnlaVEkvL2I0RS9EbTNoYnYwQkdQNHlFeFRMR1Q4ZzAz?=
 =?utf-8?B?ZytmaURLQ3gyemFpWjF5TnZiQVZHOHI1UlFjU0RZRjRjTTN1ck94dzdocy90?=
 =?utf-8?B?Q0RmSnVjWkRUb1RzTjZKcFVYVmdNMStUQUtoU3RETjNjZkVEc0drNkVIbGFB?=
 =?utf-8?B?bkZYRnJyU1g0VjdGdm9wUEFscFhlWjNncnRwQ1QyVVZnRy9wQXMwOGt3MVUy?=
 =?utf-8?B?Y0kyN0twVzNMc0VHQkQ5TmovK3RBc25EMFljUWNDRkIyWENKbC9taTNJOXRv?=
 =?utf-8?B?L05SblhUUkhhdnZhekorWmdTZWNGRmdIV3R4eGhMdllGWlkxV05OdkVpcjda?=
 =?utf-8?B?NFVyVmgxazQ0THFwbmQyTFhaRDVtUjJ5VVE5NjVLaGhUUHRHL2g5RmhoSnll?=
 =?utf-8?B?ZElMYlFVSGEwV0NVZ2cyNEVNbzlyelUxUU9NaXpKTGtEcjh0ZEl5UnROdUs1?=
 =?utf-8?B?a1NIRjJnbHRWVWV0ZkV0dXVwdXZtcGh5SURGNmo4dUt2UHRWMFdiMTBPZkRu?=
 =?utf-8?B?NDdrR1laTFNseVpDWk8wdkh5Q0VneGxJSnR4UytWd2o5SGhVcmR3TDY2dlFK?=
 =?utf-8?B?WUFPUlNzZVdEbHFHMzVkK2R2Ym9KaGo5Y1EzWVRYbnZYcWxyZExKa2xUcnp2?=
 =?utf-8?B?MjNKZ2NDYWczUkhXWmlxclJzaTRGS25ndkM4bEJCSWlqMjNBdFhnOEJSTGRm?=
 =?utf-8?B?dDIvSnVtbCsxbVNrcFpQaFFyNGQzR0Fqb0FFZGhHb21KOHZFd0RRRVRYZmM3?=
 =?utf-8?B?dm1YTGp2YUVXR3JPMlJVenNRVXRpelNvUXJza3JROEdyTEhqTVNQdkUrRlc0?=
 =?utf-8?B?RDhESXh3MStmb0dleGtSV0JqR3ZiR3ZXeCs4Ky9WU3dLQmRuNVFuWm1XaXdR?=
 =?utf-8?B?ZWNVWlpPa093WXI5T3hKai9NakRSUlE3ZWFXUDA2SjF3bkcrZVpWRUc4aDFZ?=
 =?utf-8?B?bHpaT0hhclhhK3J6ZzJWS3ZadEV1d2oxTVAvMy9xc012MGJOOHZ3TS9Kd0Nz?=
 =?utf-8?B?eGNyaTI2cVpielc5cnJLRzlhRStkMjRzYnQyNmpudmFGb050YnFvRmhCRCs1?=
 =?utf-8?B?UzNGYis2eVhZbDc4QWpxV1p2OHR0dTZYaGZ2YWdQNCs3Yzc3N0dPTU9RemRl?=
 =?utf-8?B?bUdEcUJQOXZhMkZacnZJMjg2V0U2YkxyQ3QwNHBpdGprbG4vTnNXZmtJYVM2?=
 =?utf-8?B?ZENkc2xNeG5scXI4WTE2RkduSlY4a0lDRDk2a1N1Z2ZxSEl5K3h3M0w3UkFS?=
 =?utf-8?Q?bfA3/9oOnru2i9/S+ZP9J38HCkXWv12q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzY0MDg4TW81THF1VW4xM0o5Z2Q2S2N2bjdJVnZGeERXVnRSY1F2b252Tk9t?=
 =?utf-8?B?UlcrUkNwSFA5V2o2cURtSnJFWEtvdUZ0eEszanczR3Jkc3JrZVIwUjF4T0xt?=
 =?utf-8?B?OWtWQjkwcGZwUFJ2dmFSQzBsaEtzU1ZNemZUKzZvb1RXQm1qUkM3UDdOUXl5?=
 =?utf-8?B?aWpUYmlRNlBqMWdTalhzZkZHZzNERlIzSnlwN1BjSUU3QkpjRDJHaVYwMUZJ?=
 =?utf-8?B?Ym5UMDJoa1VyTCtIcnhuV2JBYm5PSCtOcHZxOFJialFkK0k4QUFaOEt0TGEy?=
 =?utf-8?B?V1plRTU5cVNXNlRMdnFxYWJiV0RkdVptcjgvTUsrd2pyQ296K3d5cnRWdWxq?=
 =?utf-8?B?S0FWWHBZWU1UazZGYXpEdnEwalM2RFFvNWt0RzZHZ05OajFXcmRONjVIam9Y?=
 =?utf-8?B?OFRzVEVYSXllRmNLNWJ2UDhYMzNsS25CL1Y1VHY0NGh6bHA4dUxpTTZKaTZR?=
 =?utf-8?B?YjNpRFNIWVo2VTZEV3YyejZvWGZNU3c2TTZ2UklCTS9rOVF5azloS3paN2s0?=
 =?utf-8?B?cmNPRGV4T2JZWSt0dTBPUWRJcGRRcXJBZTBJSzFFS0oxT1AvMThSdVB2T1Fl?=
 =?utf-8?B?Y255TWJBa3U0NGxBcUd6dW5Sb3k5dFBSQWhuNW0vdW02V0gzcmw2Mis4cThT?=
 =?utf-8?B?aDZlMTBhOWpjRUZHbmgzNlk2bEhDSVRZcXQyRnBaTk4vb2lVMVJRcDFWVnVR?=
 =?utf-8?B?Vlh6N2JiVkRMcHdGWnlrVU1ZamU1YnpxNWMxWHplTmI1eEI3L0U5VXdiMzdh?=
 =?utf-8?B?MmFJNWNoUHJMVnp1TGVQU1hFa1NiRHMrNldDK2k0dU9RS0dYV0tMdkRHWE1E?=
 =?utf-8?B?c0dmNGtpYnZFZDJDMjZYQ3l5Vk83Vk4rZDJPNVU2RkJtU1R6Z1I2Mk1xU3Bl?=
 =?utf-8?B?bXB3Yy9aVDlFUHFWSEJ1KzdURUZGZm5Dd0hhcXBJS0RiczMreFhzV1hYcU5J?=
 =?utf-8?B?R1I3UEg4ZzAxL1Fud2pLOUVqczJJNzE1N0wvZUtkZXNpZnJDWndPazliN2pY?=
 =?utf-8?B?eGJGRVdvenowdWk5Y2p1VFpkbDlFUmpucFFFWHFmTFpLRE1ZdXJVYTdVM2Vx?=
 =?utf-8?B?dU5OaWFobGF2L2tVbkVQRnduLzdjY3VXbklhTDRCdmx2N1M0Yng1MmM5d0Mv?=
 =?utf-8?B?NlNiTDJUWmdQSXVQSmFoc3NHTS82eHlkYktSQkIrY1pEVWdvTE9hdnhqK2s0?=
 =?utf-8?B?biswQmd3RHVFZFQxbkhIbVhyWWRMTVlISm1adjM5UWNBUWVQUCtuWWVPZnk2?=
 =?utf-8?B?TjJkWG9kM0RaOFZkSmg1ZUdIUTBOejRpUVBpUXd1REg3SHhnSEtzOUhGRVZ5?=
 =?utf-8?B?c3JwM1RoRkQ4VzgyTVBVMURpcjlLaTNxbk5SMDdhYkJpQmwzalFQMXJaamx3?=
 =?utf-8?B?OEk3SUQydjNxRVpOc3RKbUNRS2x6VDJLTDdoMFkyUU5pVERUbm5BeFBSN0Vv?=
 =?utf-8?B?b3pvNGY1N20rS0FrWm9CS25vUVQyaWlma0hYNXpKbEhwa1MvRHlrUVpHYmsz?=
 =?utf-8?B?S2Q4UFp5WjBMMjJybGozaDVNa216akR2eU15NVZVbHMxRUZ5a0R6UjdKdWFE?=
 =?utf-8?B?Sm1pcXlZVWR5Y0tJNWc3NHRNUFQwa3o2WVBvZFowTUJUaWNYWDhjdFpGQzdv?=
 =?utf-8?B?RlUwUVRxU0JrajFSU1pjbW9sN1B4WFRXRXpwa3Nub0dsVzQvZmovUHdYSHNC?=
 =?utf-8?B?Kyt4anVWNDN3ZHRIaFhwQlU5eXJIVnNVNngzenFYMnlENmFpQWRGOTkrVHJv?=
 =?utf-8?B?NW5vRDRrYldRcnhIV0QwaFpXMlRVWUJJQmRGWk80bk9rVm1Qc2oyMnZOSERC?=
 =?utf-8?B?b2krQmUvS1VSV1RaWEJjcEd3dTFmbzlTazdqTWUxMnZ3OXdSa1dENXVVRmMz?=
 =?utf-8?B?WHZ4WlpGRWErNjNQM2xNZE5aQmEzMkdqbGp1RGtvdHdXWmtIOW5CYWZWL241?=
 =?utf-8?B?T0pOZkhaNnozZ3B1S1NCQXBNRnRqam9hdGhndm9ZSkp5WHlBVU1kZEtHZnMx?=
 =?utf-8?B?WGdsbVlmTk0xNXE3Rjd6a3pibXhuN1lXb3VnWEhVc3pPZXcvbUJmWFZnUFN1?=
 =?utf-8?B?bWs2VnRLb3B1OWhsdzdnVjFsQ3pUZDhiYmpicDI1bmhrbk1jTmtPSWRER2Zq?=
 =?utf-8?Q?U1FWoFecdxK+neNX6UhBsPKQt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab65ddd-c4fd-4a2c-b4fc-08de0216d03a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:50:14.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f3m3u80w4yMeqlVs/55JOwNm0nEspubSh/3LOO+NPoW3EesQS6UVJ9jEXD2G1WwULQhWiz+r4lXXoCxLn1sww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 9/30/25 04:36, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 06:06, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> We've introduced the concept of a new DRM core object, the
>> drm_colorop, to represent a color operation as part of a
>> color pipeline.
>>
>> Add new tests to kms_properties to test the properties of
>> a drm_colorop object.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   tests/kms_properties.c | 69 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index 3bdf23aad..a4d73fe1b 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -47,6 +47,7 @@
>>    * @crtc:            CRTC
>>    * @plane:           Plane
>>    * @invalid:         Invalid (connector/crtc/plane)
>> + * @colorop:         Colorop
>>    *
>>    * arg[2]:
>>    *
>> @@ -230,6 +231,39 @@ static void test_properties(int fd, uint32_t 
>> type, uint32_t id, bool atomic, boo
>>       }
>>   }
>> +static void run_colorop_property_tests(igt_display_t *display, enum 
>> pipe pipe, igt_output_t *output, bool atomic)
>> +{
>> +    struct igt_fb fb;
>> +    igt_plane_t *plane;
>> +    igt_colorop_t *colorop;
>> +    int i;
>> +    int colorop_id = 0;
>> +
>> +    prepare_pipe(display, pipe, output, &fb);
>> +
>> +    for_each_plane_on_pipe(display, pipe, plane) {
>> +        igt_info("Testing colorop properties on plane %s.#%d-%s 
>> (output: %s)\n",
>> +             kmstest_pipe_name(pipe), plane->index, 
>> kmstest_plane_type_name(plane->type), output->name);
>> +
>> +        /* iterate over all color pipelines on plane */
>> +        for (i = 0; i < plane->num_color_pipelines; ++i) {
>> +            /* iterate over all colorops in pipeline*/
>> +            colorop = plane->color_pipelines[i];
>> +            while (colorop) {
>> +                igt_info("Testing colorop properties on %s.#%d.#%d-%s 
>> (output: %s)\n",
>> +                    kmstest_pipe_name(pipe), plane->index, colorop- 
>> >id, kmstest_plane_type_name(plane->type), output->name);
>> +                test_properties(display->drm_fd, 
>> DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);
> 
> Same as a previous patch, why do you pass false and not display- 
>  >has_plane_color_pipeline?

Thanks. I will fix it.

> 
>> +
>> +                colorop_id = igt_colorop_get_prop(display, colorop,
>> +                                IGT_COLOROP_NEXT);
>> +                colorop = igt_find_colorop(display, colorop_id);
>> +            }
>> +        }
>> +    }
>> +
>> +    cleanup_pipe(display, pipe, output, &fb);
>> +}
>> +
>>   static void run_plane_property_tests(igt_display_t *display, enum 
>> pipe pipe, igt_output_t *output, bool atomic)
>>   {
>>       struct igt_fb fb;
>> @@ -275,6 +309,37 @@ static void 
>> run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>>           cleanup_pipe(display, pipe, output, &fb);
>>   }
>> +static void colorop_properties(igt_display_t *display, bool atomic)
>> +{
>> +    bool found_any = false, found;
>> +    igt_output_t *output;
>> +    enum pipe pipe;
>> +
>> +    /* colorops are only available with atomic */
>> +    igt_skip_on(!display->is_atomic);
>> +
>> +    for_each_pipe(display, pipe) {
>> +        found = false;
>> +
>> +        for_each_valid_output_on_pipe(display, pipe, output) {
>> +            igt_display_reset(display);
>> +
>> +            igt_output_set_pipe(output, pipe);
>> +            if (!intel_pipe_output_combo_valid(display))
>> +                continue;
>> +
>> +            found_any = found = true;
>> +
>> +            igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
>> +                igt_output_name(output)) {
>> +                run_colorop_property_tests(display, pipe, output, 
>> atomic);
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_skip_on(!found_any);
>> +}
>> +
>>   static void plane_properties(igt_display_t *display, bool atomic)
>>   {
>>       igt_output_t *output;
>> @@ -853,6 +918,10 @@ igt_main
>>             "Tests connector properties with legacy commit" },
>>           { "connector-properties-atomic", connector_properties, true,
>>             "Tests connector properties with atomic commit" },
>> +        { "colorop-properties-legacy", colorop_properties, false,
>> +          "Tests colorop properties with legacy commit" },
>> +        { "colorop-properties-atomic", colorop_properties, true,
>> +          "Tests colorop properties with atomic commit" },
>>       };
>>       igt_fixture {
> 

