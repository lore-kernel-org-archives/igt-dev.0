Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFEED3A661
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 16:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C319810E2A0;
	Tue, 29 Oct 2024 16:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IXwW2iji";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4422010E2A0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 16:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExjzTkWA5ag3vv33suSrSMGNqGbQEhRDVhYs62ZAsl/WwE5aKZ0duyRTUjJnkI9nIhcp9wvI42OUSYBZiPkOLpwyGD0ptxU7qwD+y+HfdjfOGWTvT8khDLxv55VrewLzkDb5psYBX1WfKMUKp/xPGklgo8z+3qsNj03T7zmoPlxZ27cIykLW/VWUFmKI0GtBP5N+m4L2+srwEF7jJmTjMpUoKWxtsMpvogNCJTzcxJDFglCXQNh+AOc0Pv05xyKsN4IAgJPytq4xHWFpmCuj3R/lZ2wTzH2U/jFwbf/cF0V15c3OoScozxYAjtRhlWlpmctecjhev0ADdyVy0BVDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o8vSVzbU2s/ir8JnvuR237QFpmhdhiop69mKELuZtg=;
 b=Y2lfjiTYdLfIzlbbZOU3Z0c8MIftkMTWrf+92QEP8heIyXZR5pAIFkNhPVivU8A32Sg2ltcMqzPTte8WnEO51Ts/S69s7xQaPZRscZgdGqwKxA/oUiBIAn0NdDZqBzAqOEAxyAG84ufAcqr4CSLbJzVm2j2XrJF13JLsQFAzI4lqhEgn5GX+UFSExZ+8RZkjs2/aqhA+Ksw7h8mFyiJ5VnLKTpwO6hFw+SRlk0QZJaRi3CZcMrMnTR8Ie89fzerDjmrK1v3il7tXrzzkU/ht9NhuyA7EBYj7eklZFn7vtwHfp/bURVY9CpW6Q8ncfl5myFWfqKX0XmoXYceQo8qqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o8vSVzbU2s/ir8JnvuR237QFpmhdhiop69mKELuZtg=;
 b=IXwW2ijiwCwTrp7bEZaTnjy4E9wd8wr7iVQy0AHwxpApOhw0dUUJEd++BsRsyLakTn3vIT9LxcFcXeyNCvGV7qYt3I0LvZC7mesbcHEyNVXPQOLUzm34VbbaRnGpws6owdPm8nmOlYbt8FWc7q0KYaFs5uOtb1n7/ZCaV6aXgcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.19; Tue, 29 Oct
 2024 16:04:45 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 16:04:45 +0000
Message-ID: <3ac45196-2c9a-4298-8453-fb916ccc388a@amd.com>
Date: Tue, 29 Oct 2024 10:04:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools/amd_hdmi_compliance: Support VIC 91 and 92
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241024210345.511501-1-alex.hung@amd.com>
 <20241024210345.511501-4-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241024210345.511501-4-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: abc70dcb-248b-4b12-c8b6-08dcf8336837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0tzRVp5YjVMZGVUT2ZKdFpBZUFRckV5U1AxMGk1MjZkejdtM1ZSM3FOS1hV?=
 =?utf-8?B?SDhXbDZEakZhWXo1b1RrVTBvOU9SbTBldSswQ2c1OUJ5aUcxOGdHN3d4ZElo?=
 =?utf-8?B?OC85RGdLcWplU21rbVA3eERjR0xPQ3JzMGFCUDB6M21jZGJBdTF0dU4xeExP?=
 =?utf-8?B?TFFCNkxaVnp3OGswU2FlUS9MakFUK0poeUdMaGNKN2xpZTdDMkNzVHk0SWhm?=
 =?utf-8?B?RzI1cmJVYnRmS1dPN1VGMHdjRjV4TSttaW14SjErcmUvUzc3UEkvZGJ6YlY0?=
 =?utf-8?B?MldrZThDUy9KdzVjOThIMUhHWjNIRTZoaWw0M1FoUXhmaVhTZlc1V2Noekw3?=
 =?utf-8?B?U0gwRVhBbUFobElQaHpadHc5VE5mZlBONHhrWFVFSFpHMy80WVBNZzNPalND?=
 =?utf-8?B?QStDZjhCNEo3ZVkrU1ZUNkU4ZWtmVTl0VTRRbFdiZ2tRaDlmSnB1M0p5RmxK?=
 =?utf-8?B?UUR6aDdZZ2hHYjIrREVnMlUyZE9qcWp5OURIQ2tYOFV2Uno1QmcxNXBCUi9Z?=
 =?utf-8?B?ekdsNmVJQTMrajRYTVV1Z1BiU0FrV3A1NXJIa0VhMEN3Yi9mNEkrakVidDJ0?=
 =?utf-8?B?UlM2VGc2ZGE2WGZZWTkxcmVEeHQrQ1YwT21IdUVqd0VGOWtRZ2pISmc0Mm1z?=
 =?utf-8?B?QzgzOUJabTdzYkJINTNici9TUGQySzFqWlZCRmZOSEpwR29BcGdZOCtzSFlN?=
 =?utf-8?B?VUZyeHAvRGdUcVFzbHhkanlsYWtOYWxENmwzeEJCZHhtRE5EU2xRQ2YvZEVz?=
 =?utf-8?B?L2sxQW1MUEFCaHNZN2FnZmRneGEvV3JVd21tbjB4U1p6bldSa1RQZjhUTnk1?=
 =?utf-8?B?OE1aa3p5SFNRTmRQa0xaYzFyRDBPdlNudGI5QUsrUHZuT2FFZXM4Q1RqdW11?=
 =?utf-8?B?N0JGS3Y0RXd5d1ovWGFwbXpiUkJkMHJieWRMYTB6UTc2L1VLUFJEQmxIU1Rs?=
 =?utf-8?B?dWpjeHBQTDNtZlJ6MjIvWEFtNWpyRDNZa3dnRjNlUzZoMUw5dDJCaGNoVHY5?=
 =?utf-8?B?ZEtuV2d4NU0vM0hFT1pCWWhFN2pwb1ZNSDJpU1RxcXZzN0Irek9qOWZGS2ht?=
 =?utf-8?B?eXlqaTZIZy8xZGk0Tk5lNXpBS29MdEdMNkJUN05nd3ZkaEpOTklIWHRJeC82?=
 =?utf-8?B?VDVxcGIraEZNTllJVEVLZUc0R1NPZDJ2anVMU2J4OXlhdlZndHFCREdNYW5x?=
 =?utf-8?B?Vi94dkdEZFhZdkhBT3hsUkhlOUNRb3hUYjQxS0lSaVRCek5NbHdnd1VlRWxT?=
 =?utf-8?B?aFdJcGtzTWlicU41TkVjRWVEOE1sa3p5YkdEN3h2OVk1YUpHQkIzSmZQMGVJ?=
 =?utf-8?B?K1NvMWc2d0hsaGlWbldTT0ltQTZOWmQ2WWdHL1BsWDdpbzVZRXd6UHVFRVVS?=
 =?utf-8?B?Smk2TXp6V1MycXA1bVdadEM5VFh0QmJLWVc1bXduSHFQSWE0MzI1UzFDMExs?=
 =?utf-8?B?M3Qxc1h2QmxCNm5XckJpRExweldtd3N1Wmo5cE9CeU9Zcnh0c3VoN3h2dlpo?=
 =?utf-8?B?SFl6MFIyUFFyNDBFT3ZNK2pmK3hkU3piSUxjTk5wTlZCTWI1ZVFMVzc4ZGln?=
 =?utf-8?B?VExIODFqNTFVMjNXN3JWZVNTb3VHS0I5aHFzaGVFUkwzRzVMdlhTcXVhQWNS?=
 =?utf-8?B?aEhDN29FYmhxdUY5N29JY0pUdDdmdWYyQnM4cmFYTG1YZkR1VnVRS0EzTU5i?=
 =?utf-8?B?QXRQdTZvRjlQaTdFZ0V4UWRlNzl1UmxzMXpsUENKcCt0NS9ka0doZCtmbzZw?=
 =?utf-8?Q?aLODfAe0HKJDCmndm1Up4kt3RsHVzIMrBniFbsM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czRWMC83UG96U2lwWjhVT1VwdWNMOWpwUkR4aENycUJNN3BhdlZHbW90Q1Vr?=
 =?utf-8?B?MWJ3ek5JRUlvSDZFZjkyVXYwalJ2TmlJYlNWNFczNytUYkJ2SjN0TitHejQ2?=
 =?utf-8?B?MTJxamkvdmh6ZjBPWDVtM2htd0ZXNkQ5RVp0Y1U0TUVENTVFaXIvWHZBWnNC?=
 =?utf-8?B?ZGZpQlE4a3ZmaCtqcTR6L3VYZ3VOenYxVHBFN21KdWNNZ0JFeTdMcGF4YkN2?=
 =?utf-8?B?VjNsMkc0NCtaUWlHSklRdEwwb1oyek13b0ZaNGVUandGSmkrcUI1QTdQMUF0?=
 =?utf-8?B?M2FpdFV5K2NKNGpqeUQxK1p3UWJLNTdxWHA1Zm1sM05qZHppZjMvZGtkWjRY?=
 =?utf-8?B?VXlaeDlXRTJaWTRaOWdjTnMveVVZUUhVcnlVbFo1U3dyTHlFSWpjMjdGVEow?=
 =?utf-8?B?N01QRFp5ZXBESVpURlJiRnp2YlVkQ0JZUnRza091alVuZE9ZRXI1b3lmUFZZ?=
 =?utf-8?B?b0UveGRWbFZSYTRIbFlERHhJck1STSt6andGTTIyZk1WTjZ0ZjFESlpVKzYx?=
 =?utf-8?B?YXVFQVNIczN3WFRCQjNtOU1MRXVrQmROV0Y5eTlEWlRNaVIyeG5yTWtTdHNY?=
 =?utf-8?B?bElUaDczZGpsb0cyT3VHem5oWWEraUgxMGE2UGpGNmJmSG9vUzdlQzFlWUxC?=
 =?utf-8?B?cDR5UXBYSDRsaDlQK1ZYWWo4YVcyWTJIZy9odzkxUCt0M2pTaUdMQTdCQVVB?=
 =?utf-8?B?Vm52MUFXRlMySHh5c2R6UnV6czdXUFhiRldJbWZVaHFXVjhMWHQ0TlRJZ3RQ?=
 =?utf-8?B?ZzBmcWRRaHZYWXEyRk44b1oxZ09YMnRWN1BTcGxCaFZBTWNwRGJTTzBURU9C?=
 =?utf-8?B?R0FkdUZaVVVzR3pCNldkU3F5OGRFZDdWV0tjdW90bkxVSVhLTnd0Ri9weVQ3?=
 =?utf-8?B?MDU1SnJBSEZnR1BaMFd5MEFMdXV5V1d5dUpWOW02emlhMTZMSEVibk4zUjZp?=
 =?utf-8?B?YnB6cDhkNlR4OTc3UjNpdHRTZHJkMkxvMjVQVWFVSWc4YUlaOVc4U1lQM1Np?=
 =?utf-8?B?NDRpOUZjcndtcEJYODZ1eWsrZjc5VUIvLy9OM2JzQklVRXM4MVBkcXhPblV3?=
 =?utf-8?B?OTkrU0tyMmFaMzUwMkExWm0zbVlubHpIWXVSd0JVdjA5RTE1SU1zZ0tmWTM5?=
 =?utf-8?B?VVdxUEoxTzExbThEUXF5cHFoanhJT3NNaml6QmtPTU5iZXVzZDVFVVpyWGJW?=
 =?utf-8?B?WXl4ZTM4dmZnZDVBdS9RekNZTDlkTVJFaWxTNGFEdytXaXFxSmhPYUFJbkNx?=
 =?utf-8?B?Y3JTaTBvQ0IvZ3duRTFVU0NEUW1pbUJISGdZVElMZ2UwUXk2ZkhzZmJwS0Fo?=
 =?utf-8?B?MHdBbkVuaDgzM2Y0dmRCd2F3YXpVeCtWVUxMTUUralNtb1FnZk05N0JoN2l3?=
 =?utf-8?B?TXpUUjFvSFE5NmpBOEF0bkwycGNCTXYraGFKUWRMbGZIaS9xVSs5VDd3MEhT?=
 =?utf-8?B?TkFvbDNjaHVXTkc5SEJpeGdMRWFvSDRUK24wNWVmUTFQVUdidm4yenZPOU11?=
 =?utf-8?B?TmR2RG5hQXFNaEtVQnFudnBkcFQzU21ZQmxlMlR3dUZUN200cnlXaFk4UDhX?=
 =?utf-8?B?ZEtPMWNZNWhIV1AwQlBjRlpuMzUyL0RqbVBIZ1lvMUQyS1JScHpBZFZ5RTkv?=
 =?utf-8?B?SXlLcURWTldyM2pkT29COGhVQzRuTHVyd0hNK1dDS2V4bDg1d2UzYjJIT2tM?=
 =?utf-8?B?VnB5T292ZVBHUmhBYVk0VmY5MzNVQUI1SjJ5VkhCVFNjU3NLOWxEbEd3WUpm?=
 =?utf-8?B?aUxtQVZQOTVyNVhIc2hmMW1rUThzZkY2eXpMTXVKWTdhNXNVMWJzcFowb3hC?=
 =?utf-8?B?QS9lNDlnVWVsMXVHd3orVURpZE9DRDkxK0VXR3ROcXpxejNrenpLcGZuazIz?=
 =?utf-8?B?OWhkdDBObG1YR25IT2hobCtwL3dpTHhHNlZpRUZzTkErMDF4SnphcXpQRUE1?=
 =?utf-8?B?RVNpZUZqYzhlTVZZbDd5OTNabzk0UXdUd0VlRTZIWEwvZHFLRW96bmJvOFdj?=
 =?utf-8?B?SitQaG0wbkpJWHFDc0JKNTBrU3dkMmhmTlFNNGduY3J3L3RmcXRmMUFqWncy?=
 =?utf-8?B?YlkrWlloMHhSVjBwN3M2WHNaV2JNUWQ2TmdUVkE4Z1ZhSGFzNEFIRURWdE5z?=
 =?utf-8?Q?M+uEU1HL90xx6YVFuiHgbNiYP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc70dcb-248b-4b12-c8b6-08dcf8336837
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:04:45.7340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChXF9bxb3scOw/6HYeYR7ADcp8FnBtP0r0J3lpXPwoW9oomtqOitbd3+W7URCTW5Eg9FssDopL2ZfLmq9ZR2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328
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



On 10/24/24 3:03 PM, Alex Hung wrote:
> From: Stylon Wang <stylon.wang@amd.com>
> 
> VIC: 91, 92 are supported timings by DUT. Add these timings
> to pass few CTS items
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index f06af72b0..49fc21d5a 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -266,6 +266,18 @@ static drmModeModeInfo test_modes[] = {
>   		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
>   		0x40, "2560x1080",	/* VIC 90 */
>   	},
> +	[91] = { 371250,
> +		2560, 2778, 2822, 2970, 0,
> +		1080, 1084, 1089, 1250, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 91 */
> +	},
> +	[92] = { 495000,
> +		2560, 3108, 3152, 3300, 0,
> +		1080, 1084, 1089, 1250, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 92 */
> +	},

I also think this commit should be squashed in the first commit.

>   	[93] = { 297000,
>   		3840, 5116, 5204, 5500, 0,
>   		2160, 2168, 2178, 2250, 0,

