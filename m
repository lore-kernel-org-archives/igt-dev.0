Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4CAC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 23:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ADD10E0D6;
	Tue,  1 Apr 2025 23:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Se/bZTTS";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5AC10E0FF
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 23:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXSxXy9GMoIhAul7nW6XFaUHTWlbyoq14PDVz1QGqR4wx/qM+ogf9Lz0B713t4ENJttDaWDa6k1Ke25usAUIR6A7LohbK5rkr7Kb+gTTttuyiLv7kI02jSKgHlki7CbEREKb2/KJ4cNOaq/lpXWiNaDt2ojHPNoOedp9Tc+NMRq1fP1Zq17X7L+GdnZdKCy5u7WLaHaEGOp580HHy8AuntRSJJFk0OSfShThP6+eb17aRuCxMmPDVER6rO2V+h/7bUBHmP3zVgBGKYAAzA8jwAw5t2N+FGyVzW2pKV/e5r0fP3SsTiiudHGfYR6YsAlYQe3lD71G37O+aDhTWNNf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Eim8S0txCiOEHc8sTvltEQkRf54wTtbwWNAGpOm8x0=;
 b=yMSmYSu95WQArxM4aBz6KD4O5ivmE15DM82visFkxejzaP/oVM2jJu1xUNXQT41V4Ts00aHdoBx4HR7zi9OmYE2mzkAt4alAuAnubtTxBm7j+Y9X0fg3cnmQQPBWysN42jOiLoz4k8KBsZ3lWWOPM1569Namt+I+M9qebO2jFTvtKefxytfkmGaxZt2mwun7iJsCaszjkva7prxXNAlni0EIBwgwtgII5xDk0UERe1whfPldbPkfEaGabMlNHZy2sji3gFDH1qmrsULjO9o/4o0/mXcTDpqqcFGBJHEAShYH91EyQmoK+z4zxasGg7bG6y0vaUj7voU2ue4uoI8drA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Eim8S0txCiOEHc8sTvltEQkRf54wTtbwWNAGpOm8x0=;
 b=Se/bZTTSS9hKSsyPsmm4XCAD0aesgIdbOvsUUW2i2CIPPqgKpOyaHCMtF/F6P8o8IIgUlSL2T4NhTBZ7wDFtAoB8U+CBZ9uFbNU5lraDW8Qf2vGcvlP58VRXUpVL8yx6Bt3up+CWXkCz0gHV6LIUxTIU0lgc3Ore4dLIsiudzT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 1 Apr
 2025 23:46:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 23:46:49 +0000
Message-ID: <4f1d523b-27be-48bb-b0c0-740b99a19a1f@amd.com>
Date: Tue, 1 Apr 2025 19:46:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/19] drm-uapi/amdgpu: sync with drm-next
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0009.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::7) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d35abae-4886-46df-5ca8-08dd71777826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWRKUHpwdjZXQUVoV0pJcWgzU0xPcEp3Q3l3OTdZTS9oaVl3R2MxemxUVHVO?=
 =?utf-8?B?M2xwdnVzZXJYd2ZQLzhMeHhZWVptMTRCbG9mekhxamNpWFVtTkVpRk00K09D?=
 =?utf-8?B?Ym9TaWNlR0c1dGExRjhHbEtudHF3aHA3MHhFTk1ENzNaQk9OSG5PeG8ySVBW?=
 =?utf-8?B?bFd2aDdPakRUNjJaQWppVm56aFdhR2haLzBla1NEUzF4alVydVREZU9oRStU?=
 =?utf-8?B?MXJqbi9jUDA5T1VKbnNteDZKYlA4R1huVENYd2pzM2ZyR3J6YTJoV3hvZmJz?=
 =?utf-8?B?VlhEV3NvbTUyS2w2dXV3SkdmSmVRSGRXM2RTQmJBZXllWXBaVXBRMnVTcHMw?=
 =?utf-8?B?d2ZBZFRLSy8vRUNCMi9Sem1GMGtqUllscU5TOStZTE9JeGVUbzd0TWZQb1FQ?=
 =?utf-8?B?L1NaT0VHY1c4SXZkWVEwWkg5ell1Y1F6M0JrbVBzVEVZYWRNb2taRGt3cnpa?=
 =?utf-8?B?QzZjcnhBdXpUMTc5S3diM041RmhaWmgyZzJ5UVF1ZVZDSFA1ZUF6T1hRSStW?=
 =?utf-8?B?dW5BbEs5UEV0QXc1TVUvVDN1WGpHOWE3MjVYREVtSll0TTU3b2dIa2p5Rlln?=
 =?utf-8?B?Y0xka1d3UXljNm1YV2tCT1lVZFI3dVFhVitDQlh2eXVCaTl0a0V0UkdvV3VI?=
 =?utf-8?B?YVVaZDg0eE1HVzFsQzQ0QWVGV2VIcWJhZmV0RDgrWll5NHZwR1dYV1R3bG91?=
 =?utf-8?B?R2pqY0ZQMyt4b2o2YWZlUDZaUTd5bE4xMnNNYVhyNzhCWVhHdm1yVTZ4M2hT?=
 =?utf-8?B?K1dabzJGc29HTVRNc29DcEpqb0NSc1ZkdU5mRkNHdjd6dFRoOThFWFA3dnNu?=
 =?utf-8?B?WGxOYk1QenpmcWZSRDNiSkNwd2ZjU2FDaTNqU2JSZkZwT1lhMnNXbUpJZG9p?=
 =?utf-8?B?d0NoVWZXMnhucVJpVFlYNFpGbTBQUVpoZ1hwUHB4dStzY1FHN05sVHJUV05Z?=
 =?utf-8?B?Y3Vsc3V1QXlnR1ZMeTFKOWxnNnpmYnJTOWdld05zWk5ISGw4YVQzTnpmUlRi?=
 =?utf-8?B?Q1IxS016OUpjMS9xSWNpeEFGREZZMTRwUVM3anRUTHViSUJpV1FydUdWNzZ1?=
 =?utf-8?B?VkVhTUhoMUNHbmJrRWc5WUFxbmpubGYvbElDTmUreUFNQkh0SG9LUm9jY2V6?=
 =?utf-8?B?L1o3Tk9ESkliNXdlL3dHaVJlQ01WWHFXcGtwaWF6L3VKOE9hRm9rMmRZWnFY?=
 =?utf-8?B?UngrcnNSN0ROb3E1RWVGZmRGTTdxSmdUSkJnL1BBUklpMkpmdnd4bFVLWHJj?=
 =?utf-8?B?NGJmOUppeGRKTTd5VlNoL1pDdDhYZGV2QW9jWjBKSzdkT3NjakwzOFVXZUxE?=
 =?utf-8?B?d2xxOVM5clN1RjVuL0RhSkV5aGZjR2Eva2hGTUdWWGhHSlg4dGVnUEFidEFU?=
 =?utf-8?B?OGhLS2VocmxydnNTM0M2My8wbUxBazc4QXhkZDArbXhOdnlrT3dycGFJTTZi?=
 =?utf-8?B?OGJicVJCZHVWYkJDTkI4UGZzaC8xZ0RqQVFUVVNpNkhxQ3ltS3JpK2szaktm?=
 =?utf-8?B?cTlVcGtKV2FUSG5LZkhPVk1iNUN6N1RjZWdqY3BQTG1tRXhrN0UwenUzbnZt?=
 =?utf-8?B?S0FxVmwzbkszZk5nSy9iUUZmNHN1YU1pV0VZdmUwbTFUUXdXWjRNSVNRY0dP?=
 =?utf-8?B?ZjJkU1F0Lyt5cEU5L2lraDU2aWRPRksrK0lrWnRnL0k0d1kvUHc0SjR1cSsr?=
 =?utf-8?B?MTRZMGJyVWtEMy8vUERHUVViMUpLMFBBUzR3NXQ3OWU5dU5HakVsRXhLallr?=
 =?utf-8?B?ZWVFNHlpV3EwR3V5eXRmZmQzN21QZkNjMWdaQWtYaWNkZ3lFR3djcDhkSXZu?=
 =?utf-8?B?NEo0Z3poVkFySy9FVEZjS2l1bmZNc0dSZ3hlTjZMaWt2VEo1N3FOTjFCQnMx?=
 =?utf-8?Q?Olw+Vwgz8Z+Xe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHR1UWxDQjdqUm9DNmplNlAwVFAreFNudjBVNVYxN2Z5dXpnWE9rTnVpcnYx?=
 =?utf-8?B?OXRYQkIwSzdINk9DdFZWbkhJSWV2dzRMZkZYbmlUdUZxYjhHTkJGZE5ub1hw?=
 =?utf-8?B?d1NqaXVUSzBBYkhwUGRqRXArQ0VPMlJDN2hmS0lvRElFVGxVR0F4blpLVGM0?=
 =?utf-8?B?SGNVZW5OZUtROXVtOXFlRE9mKzVxYlczK2RTVXZvL2NDd0NpUVZpS0FuZ01H?=
 =?utf-8?B?MjI4RzE5VUlCWnNlTVRmTmNMZVZyVlVUNHBZYyszeGpkQzVZblUyU3MrTm1E?=
 =?utf-8?B?TUVnNldBMStBMjNXUWdxTHJQcWNGRXBHK0hrRXA1YkVWaXQwWURtaHk3Z3JL?=
 =?utf-8?B?VDVNNDgvTG1FSDk5VHo5ay8zUUVFTzJMSXg2OUg4Y0hvMmZGUTRSRFgxeHFP?=
 =?utf-8?B?dVhnUVA2QlR4MlBiTzlMdTVrWWJPVW5aRm5wcFQySWFhd3hBZTVHVGUrREY5?=
 =?utf-8?B?Z3NVYlNNYzB6TUhpSGVkcUdjTWcwdXV2VmpQMWNQRDFSNlpNaThZVzdabWhk?=
 =?utf-8?B?S2d0bmNncmVOWldpT1pHZmJTeGpBU3UzK2RrSVBQajFucWRTRi9IZ2pIMkNK?=
 =?utf-8?B?RVd3MVVEcmZ4QmowWHBLVG5UNHViV01xU0JZSm5JdUc3UjQ3OXNwVDVFcTRH?=
 =?utf-8?B?SEV3NUJIQ0xHRURxb09ZcWVvUC80bFdWcmhDZjdpSmJra3lDMjZRUTdYdHJB?=
 =?utf-8?B?aEN2bk53cnRxMDNwenFJUFVKYU1xYVNIa2FFbDlKTytoQXU0YTg3SlhEZnIr?=
 =?utf-8?B?dktINDZrLzJWQ2piOXJsZVNjUXpVYzUrRHhYaGhhSUpPeUR4Z1MxcmRpQU5U?=
 =?utf-8?B?YTNRTE55cmYxbTA0QXZQQVROQ3VmMFVBdy9YVkI4Qk5oQVBqQkphZ3FsNVJ1?=
 =?utf-8?B?K2lMTHFYamxZa28rM0xNb3htT3gzSWlZczN0a2xqWFpnUkxMSXlNaXBmelJ5?=
 =?utf-8?B?eUtCRXRlOTdXZGJSczRPbXBUSmFEMVNmR1ErRUhYbzhsNDJ5dUMxcXRxR2E0?=
 =?utf-8?B?T1pTcGIzNjljUkpsOVhqSlVhMTUrQk1oMTh1azZhcVluL2JOSGdjeUZaR3Bi?=
 =?utf-8?B?Q1lrZTRXMGh2bWdJQ3cxMHgzZk85dENNWnRnVW9DMmhQc2FMS0hraUY2Wkl1?=
 =?utf-8?B?djZaeFJyMElpM1o0Nys3SGxNT3M4dytsWmsyeS9mdmhUODJuNldPTDNGMlhq?=
 =?utf-8?B?Q3BLdGNmNEgwTXFzUXQxSjA4NjBhUXNPL3prdEFHc0VhUkptMDg5QXVQdXJV?=
 =?utf-8?B?UjlxS3FzWStrYmdyd2Q1WFpQOWFtcHdhQzlQKzhSU1h6cVkyWkMybXF6UHpV?=
 =?utf-8?B?bmFKcEpwQWhWMjVPc1hIRzJ4c3NoZk9OSnl6WWs1cGJjZVBaOEY5ZCtlTjVv?=
 =?utf-8?B?WGpGZDREQ1owT2NteGVDWGYvNkFYQitDZmNJTFhiYlllWTRMZ1NlV1Y1UHFO?=
 =?utf-8?B?Nk5BNHBlUW5sbXg4Vk5JVkJKVWVkbWdOY29zN29mdituWitldyszaDhuSCt1?=
 =?utf-8?B?aVVnTnU1TUlsM2p3eGIrLyswK1F6SGRxckNRa3p4Ny9aVW1VcXRrRU95NHVQ?=
 =?utf-8?B?N1A3RFFDR25PeHZ6VWtrUlE3Z3JoQWVTWWErWGd4VzdCTGo1enp0RHE0bXhZ?=
 =?utf-8?B?cjIzNFVJNzNzVDNCTlZyWFhGUHhpY1p5VHR1YUVKTmhCQkVsZitFUzRaVVVi?=
 =?utf-8?B?WUNhaGgxY3dMeXJSMWRheFhiK05yVWdmM3djZkROcHVrVXluRURsTUVYSWNw?=
 =?utf-8?B?cVB2QjdwK1lQVlR3TXFtaHVyZDk1VG54QUk3MnVoa1B5dU5tZjROcW1iWWNI?=
 =?utf-8?B?bzlVUzhGaDNWWXRFMkFJRzRvVTAwbVpJMFIrK3dPaGlOdTJWcDVMTHQ3ZFR4?=
 =?utf-8?B?OWZxT09WdGorcW5nalZNcDV3RllFazUwUk1zWXk0ZFQ1RjhUQ2Q3RFR3U2RU?=
 =?utf-8?B?KzNZMFk4SnhDZEdWUFJySUlncmdwL1d5NUh6a1NIbDBOQjVNK1J6VVlNa1Fj?=
 =?utf-8?B?RWo2ZFBhMjRpWGJEMFUwK1lCRktZMU1ENHVuRkhPMFcvSElTZVFMbEZPNWV4?=
 =?utf-8?B?RGRoL3Y0OHA4WTA2T3RhNnM1MjYzbFZjZlU4NXN1U1Y0djVkVUowWWwwSzZP?=
 =?utf-8?Q?0jrqmY+3d2Q64ty7LTLJugaJU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d35abae-4886-46df-5ca8-08dd71777826
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 23:46:49.0305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT9nkGQLSktOQdBWOFVz9MAXa1hhP66QiBtQVGuLOHnFQr/1PAQhSF59blK5XGy0Tl/QYgZFgiELZHXK4sUMUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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


The entire series of 19 patches looks very good to me—thanks for the great work!

There are a few to-do items, such as making amdgpu_user_queue_submit an ASIC-specific hook due to the new parameters for futures ASIC's , and adding another function accordingly. 

Additionally, there are some hacks in amdgpu-disable-check-for-IP-presence-with-no-kernel-queue.patch.

However, given the urgency and the need to unblock Jesse for additional tests, I’d like to proceed with merging your patches.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-03-28 04:23, Sunil Khatri wrote:
> Sync with drm-next commit ("e0400bf7d91ed477b827a674e5d64406c78ffd48")
>
> This patch introduces new UAPI/IOCTL for usermode graphics
> queue. IGT test cases fill this structure and request
> the graphics driver to add a graphics work queue for it.
> The output of this UAPI is a queue id.
>
> This UAPI maps the queue into GPU, so the graphics app can start
> submitting work to the queue as soon as the call returns.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 123 ++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index efe5de6ce..d780e1f2a 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -54,6 +54,7 @@ extern "C" {
>  #define DRM_AMDGPU_VM			0x13
>  #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
>  #define DRM_AMDGPU_SCHED		0x15
> +#define DRM_AMDGPU_USERQ		0x16
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -71,6 +72,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_VM		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
> +#define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  
>  /**
>   * DOC: memory domains
> @@ -319,6 +321,127 @@ union drm_amdgpu_ctx {
>  	union drm_amdgpu_ctx_out out;
>  };
>  
> +/* user queue IOCTL operations */
> +#define AMDGPU_USERQ_OP_CREATE	1
> +#define AMDGPU_USERQ_OP_FREE	2
> +
> +/*
> + * This structure is a container to pass input configuration
> + * info for all supported userqueue related operations.
> + * For operation AMDGPU_USERQ_OP_CREATE: user is expected
> + *  to set all fields, excep the parameter 'queue_id'.
> + * For operation AMDGPU_USERQ_OP_FREE: the only input parameter expected
> + *  to be set is 'queue_id', eveything else is ignored.
> + */
> +struct drm_amdgpu_userq_in {
> +	/** AMDGPU_USERQ_OP_* */
> +	__u32	op;
> +	/** Queue id passed for operation USERQ_OP_FREE */
> +	__u32	queue_id;
> +	/** the target GPU engine to execute workload (AMDGPU_HW_IP_*) */
> +	__u32   ip_type;
> +	/**
> +	 * @doorbell_handle: the handle of doorbell GEM object
> +	 * associated with this userqueue client.
> +	 */
> +	__u32   doorbell_handle;
> +	/**
> +	 * @doorbell_offset: 32-bit offset of the doorbell in the doorbell bo.
> +	 * Kernel will generate absolute doorbell offset using doorbell_handle
> +	 * and doorbell_offset in the doorbell bo.
> +	 */
> +	__u32   doorbell_offset;
> +	__u32 _pad;
> +	/**
> +	 * @queue_va: Virtual address of the GPU memory which holds the queue
> +	 * object. The queue holds the workload packets.
> +	 */
> +	__u64   queue_va;
> +	/**
> +	 * @queue_size: Size of the queue in bytes, this needs to be 256-byte
> +	 * aligned.
> +	 */
> +	__u64   queue_size;
> +	/**
> +	 * @rptr_va : Virtual address of the GPU memory which holds the ring RPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 */
> +	__u64   rptr_va;
> +	/**
> +	 * @wptr_va : Virtual address of the GPU memory which holds the ring WPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 *
> +	 * Queue, RPTR and WPTR can come from the same object, as long as the size
> +	 * and alignment related requirements are met.
> +	 */
> +	__u64   wptr_va;
> +	/**
> +	 * @mqd: MQD (memory queue descriptor) is a set of parameters which allow
> +	 * the GPU to uniquely define and identify a usermode queue.
> +	 *
> +	 * MQD data can be of different size for different GPU IP/engine and
> +	 * their respective versions/revisions, so this points to a __u64 *
> +	 * which holds IP specific MQD of this usermode queue.
> +	 */
> +	__u64 mqd;
> +	/**
> +	 * @size: size of MQD data in bytes, it must match the MQD structure
> +	 * size of the respective engine/revision defined in UAPI for ex, for
> +	 * gfx11 workloads, size = sizeof(drm_amdgpu_userq_mqd_gfx11).
> +	 */
> +	__u64 mqd_size;
> +};
> +
> +/* The structure to carry output of userqueue ops */
> +struct drm_amdgpu_userq_out {
> +	/**
> +	 * For operation AMDGPU_USERQ_OP_CREATE: This field contains a unique
> +	 * queue ID to represent the newly created userqueue in the system, otherwise
> +	 * it should be ignored.
> +	 */
> +	__u32	queue_id;
> +	__u32 _pad;
> +};
> +
> +union drm_amdgpu_userq {
> +	struct drm_amdgpu_userq_in in;
> +	struct drm_amdgpu_userq_out out;
> +};
> +
> +/* GFX V11 IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_gfx11 {
> +	/**
> +	 * @shadow_va: Virtual address of the GPU memory to hold the shadow buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   shadow_va;
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 SDMA IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_sdma_gfx11 {
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 Compute IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_compute_gfx11 {
> +	/**
> +	 * @eop_va: Virtual address of the GPU memory to hold the EOP buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   eop_va;
> +};
> +
>  /* vm ioctl */
>  #define AMDGPU_VM_OP_RESERVE_VMID	1
>  #define AMDGPU_VM_OP_UNRESERVE_VMID	2
