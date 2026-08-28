Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AF2C61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 15:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2010E14B;
	Fri, 28 Aug 2026 15:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yLuKo8iz";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215FD10E14B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 15:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBTzONuVehAddujiBnZDTNInBAuSCMadN/M11sALJ6R82jwlp1TgiXhXUeMWXo412RvzfHTsOKgwRF66eMt8HcP9hb0na75W1ACkSG1ggmiRFbN2Z7J0Zih+qVR5CVlbgPHBubtDIXm3dQtSFoEAjibIWZBGS60J/lBk8qRMTGqRC2WPnmg/cdrf6SP7/W3UFlU/tqz/GS5Myl0u1d11pFSk4w9DMOUni723gQo6ORuxt0R8SQLgKVYn/g5hu/rCfVhlBT7ZusTyniSJ2LKm0NdEjDsYHid8k11zmdN28WvIwH4LQIuen7DTiOhPUSJ9YqK5mZAbtysLBHf9E3XDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81u8OOmGpw5nYHOToJgGkKCXmmlxXN1s0Dp0byu0jkQ=;
 b=OAqqiyHpnRtkWRw0RyG8y8WPQeQ35erKkifEcRpm/pDpWmHu+eAjDOo2QkeDXLQSzHXdT0fiIJlKSk43IqdUYxJSawLiOc8GXMAbnRSTS1C+WUsdMEfzcQY6dyughFQXR/DSsHnpPxD0gib73r4Pb5Ut2weFPNunFsQOOVNlKX3mGRrauTeni8wJsgzqAtURCHdcWO0Fg+D5dLn0S4sIdjpM4SFldaspVEl3gOLf6OltI/2Z+ytzAEqT19YcBmWZDf4zOg0OMZl85P+8MQhJyVmhpQNz7BjDpoV6GKm1wTNTL/sC6DhO6Su+2WNRaxIMVqrq/J7FiVdZ93WjCZXp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81u8OOmGpw5nYHOToJgGkKCXmmlxXN1s0Dp0byu0jkQ=;
 b=yLuKo8iz3+vtzmXkzA3yY1e7o/CsbabiNcI5XmlM/qgKiLoF4RqYJr/XMO/QxJubo8zUcT9syWlpTiOhCb573wt2CUP1SgjZHfE7I1vC1/Sl0GumwjC7yHNBKOF3Ms5KLePCisbVSYN+iBVvFRNJI70LIqWNMdSopjLz1yF2fQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:32:43 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:32:42 +0000
Message-ID: <a10ae5f1-e2e8-496b-91af-34eebb48720f@amd.com>
Date: Fri, 28 Aug 2026 09:32:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
 <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
 <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: a75aad3c-ed40-4e19-422d-08df051999db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|11063799006|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: N9xG3avBn636CEt479NuXXqhVTcPVEZDZnLRSnPuMb8T84XawQwMMfAOgob9nPAf9vQR0Xsa3G/QpsKD2d3HZqFFfCPvIR0G89cVbvLZHbk0id8IY2KbU9qqsAfILckD8nppq99F1hBfblzV8XV/AgDku+bu1J9vFg3hljQa6CvvNemJrH5wB7K/GpYYSOCvOIkM00lPk2YncYg9swRUhEWzzMBYiGSLaF2MfZP4jK3n3v86jcIGuANHjIbsYp9B0diJFPuAXOsx14uQVUQpJhQxFmKUbGOhsfotfbjFFHa/tuACC8UFa/x+oPvad7wUMJmPruycjzlqxdcfI/RUSZ3k1nmDK7xui61f+TCQSpl7eV+C1K/2AbTb+oO6LUKZdBqJ22OYq2VAut1canAtRFfnwEnsetNknG3SxnVAADooTFJ3JxWz/1JFV8+mCs4PtfDo+WvAuyyBG7hujNCe78aexits77EGJzmipVMC6TI19utz+H3QSuGL8FcxtFXS7q9M+cMm9LGHzEwOD/TF+JIX2fimgsVnyoqUW8Rp/j+fU8zeu+O5JZct8oischLTztVVD1DL0J8K/c68OQ5D7DVoJWaF5nahuOProl4i4XNKXQuS6PzGsyhg6hWJbq3E5eLd8+VWJ8cvcGZV34HWyCmsBRRrV1JYl0b9yX/EuFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(11063799006)(18002099003)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGwrTGdDY3lFY3dFNXFXY3VIYW1sOEU2dEpZc0xyWnl4aENTdW5Fajh5VTgr?=
 =?utf-8?B?TkVMdXFIUFg0V05rWVNwUzJVMEZISlYzcVdPYmliWUx3SWdVZ2pQUFdCQWRG?=
 =?utf-8?B?UUMvbTVvZFZ4dENDV1ZsOFRmNTYvUlFEUXBwakJRS25QSFg0RXNIWWJSRi9T?=
 =?utf-8?B?dTRVcXpiU09DRFVXeVRicStzUkwzMlRTNkxmVWJXdXk3VjRWTDMraHFBY1Rw?=
 =?utf-8?B?Vi8vSnFLRnlEaEtjUlRBTzhiblFVMGU2N3pwM1dPOGtaS20raGUxY2FjTEM2?=
 =?utf-8?B?Kys5WG5rYVhhTVNwdXlVdU1aTkpOdy9aOXBjUjFFUVVKcFc0aWFHREFVbWZz?=
 =?utf-8?B?NEdOYVRpcjBnM0R1TTdBWWlZOC8yRHExbGR6ZE9TSy84MUxrc0lDSUZjcTBa?=
 =?utf-8?B?eGg1NWhDWHhZTk40bUhqRlgyOFlma0VuNWZhcW1zMUo3Z1pNWEZKcHlVUkV5?=
 =?utf-8?B?MlZteHBwOTdTVTlHbVo0UGpWdldNV1d6OU96d05yL1V0R1lkTkZDZDMyQnNM?=
 =?utf-8?B?V1Fnd0NHTWQzaFpHd01td1hFdE5DQ1NZQktlTWhOQlRlQVVFMktvOVF3K2pN?=
 =?utf-8?B?T29remw3dTV6bzYwSmUycWdWayt4dis2S3R1SEVoQks2K2JtTXZoMXpUbVlw?=
 =?utf-8?B?WEpUZmpqemVQRUwzekRvMURla2JuNndZRlN1RW9INW5MT0dhS1lJblhYVmRx?=
 =?utf-8?B?d1c5bnBHcm4zekg0cW5XMmlRS2gxNHNwMVMyNnhZVjNaeGJ3VWlRMlhmbFdI?=
 =?utf-8?B?d2tLOEQ2SGxWNXlKS1hMTUJORWJUMGlES0lGeWlIRHU1amkxMUN6aTFvcUJj?=
 =?utf-8?B?S3p6YjBPc1BjNm5Sb1NGREhUcEd3bi9Qb3M5eS9HbndVYURpakk2bmNIS1I4?=
 =?utf-8?B?akZyNXlmdnFub1NLWVNRazcxRUEvMEdsQzlYeG5laUVSZGtSU0FseURZQm80?=
 =?utf-8?B?ekg0UDVjZUJodHN5eEVsNXVISERabE8xYlhSQ1lhWnlKbnpKVFM2Z01QeXR0?=
 =?utf-8?B?K2ZxTXlyZlFLT2lEMEFBeW1rZTlwSDZCVnZtUDY1VUV4YmJQaGZZQXJBU3I3?=
 =?utf-8?B?eStqYktiaDNWeGtYb3A1Zk5VR1VzUzB4YzRUWm1kdjRJajZ1ci9iZ3R4dlJI?=
 =?utf-8?B?NldTN2ZtQjVrd0VTRmVzU2t4Z3loRHRyREo4NFlyVlpmTnFSTDRuaVBUcEEy?=
 =?utf-8?B?OUtrUThseVJSMll4c3ltU2M3NUZFa1dZVGZpbTh6VG15V21JRXMvb1ZObFR3?=
 =?utf-8?B?TFJYZXpLU3FObUZoa25hM2ptUHl5a2N2Q0YzK09EenoxYmN4OWU2aEJOb1JI?=
 =?utf-8?B?RTB0OEZUd1NueW4xMXFnMVM0WEFHUjlraGRacmNKb0tXSERqdU04Kzg2Zm12?=
 =?utf-8?B?SjVPK21XYkVKSkNhR3YrYWVkNEYrckdBUFB6ZVh5cWpmSUpBNVVMRkZsemRK?=
 =?utf-8?B?QUFZTUd3YlR2R0EvYmdGS3RUYWZ6V2F4WGZjL3c2aG4yL3ZETEVIZjErWkR2?=
 =?utf-8?B?NnhEZE1Hd2x4NTdRVjczblZXdzFXTWhYWkVlaHFIbjdqeFRCWDdBVHVEY2Rw?=
 =?utf-8?B?Y0FZVEwyR1JFVGpVVEpCUDRZTXc5RUFSNFcrTytER1kwRDJnRE1sRFBVakJz?=
 =?utf-8?B?THd6UWI0MHUvVDZQS3hVZXhtQSt0bGZKVCsveDhVblUxdGw0QXNIM0hFM0lV?=
 =?utf-8?B?ZHVySTdZaVBrWThRRlVQV0ZQV1FBYjVvMDdlbndrWDhXWjJTQmsrSjFWemVm?=
 =?utf-8?B?VFZ0Z3lVbjJtbWw2KzJlamZzV0tzMzJLN0pDTVYyYWQyaWltNVIwR0lTQlBx?=
 =?utf-8?B?MStkNkVjU3gyZTF6ZE96M0M1S3pZWnRpZEpQOFY4TkpPQjBGZkZrQ3FzaVdJ?=
 =?utf-8?B?ZS9mdFVwYngvRjNFRUR4MElvTno2eFJpeUpMQ1E2Qml2T0RLUm8rQnVLT3ZH?=
 =?utf-8?B?bjBqQnVMR2Q4SVpxYWZMS1lGOTUvK3RoaHgvNFU2eEw3dEdJMHlMODBOSVFr?=
 =?utf-8?B?L3hiQ3h6RjAvajc2Yk1JY2tERGhpWVc0TzNXdFBjVDd0RFBPa1hSZ1FUa0tE?=
 =?utf-8?B?NXFnRVBZdG9kaXZ6TVJDWE8yeURjYjc2bVFDVS9KdzJGTzBWZk5hamdBQU9O?=
 =?utf-8?B?NlRKeTJ3bnhuNHZFSEt4dGp6VjNKak9uQVRSTXI1YTdKQlhHSkt0OTFuZU12?=
 =?utf-8?B?WWJsT1B1SU1Ta3gxSTdUblo2Vmh6ODNWMHZXbjZsYXRSS2VMV3M5Q2RaTmRj?=
 =?utf-8?B?Zm5UaXFCWlFzSWtNRUdhR1pJMjNBQjg2RVJqVExpUmZ3QzBaL01kbFBFMThY?=
 =?utf-8?Q?8Z4JQ3cs210ykYYk+/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75aad3c-ed40-4e19-422d-08df051999db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:32:42.5874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTIguOwqV3V21ORByip6SGROvffdWCGKEoxgYhSph7qFW9fsRccFj7kYQ8OOUGmfiuDiOQOS6LDRvyZ2SPeO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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



On 8/28/26 04:04, Borah, Chaitanya Kumar wrote:
> 
> 
> On 8/28/2026 5:45 AM, Alex Hung wrote:
>>
>>
>> On 8/26/26 23:31, Sharma, Swati2 wrote:
>>> Hi Chaitanya
>>>
>>> Patch LGTM
>>>
>>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>>>
>>> Also, it seems we have duplicate igt_display_require(&display, 
>>> display.drm_fd);
>>>
>>> It is required once. Anyways, its a separate patch.
>>>
>>> Alex,
>>>
>>> Can you please test on AMD driver with above change?
>>
>> yes it ran fine. Some inline comments below.
>>
>>>
>>> On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
>>>> Following the pattern in kms_color_pipeline, set
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>>>> local variable, then propagate it to display->has_plane_color_pipeline
>>>> after the final igt_display_require() (which reinitializes the display
>>>> state). This avoids calling drmSetClientCap() twice.
>>>>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Alex Hung <alex.hung@amd.com>
>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> ---
>>>>   tests/kms_colorop.c | 9 +++++----
>>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>>> index 16db0b8ad..d573d2ceb 100644
>>>> --- a/tests/kms_colorop.c
>>>> +++ b/tests/kms_colorop.c
>>>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, 
>>>> opt_handler, NULL)
>>>>       igt_display_t display;
>>>>       int i, j, ret;
>>>> +    int has_plane_color_pipeline = 0;
>> can this be bool?
>>
>>>>       igt_fixture() {
>>>>           display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, 
>>>> opt_handler, NULL)
>>>>           igt_require_f(!ret, "error setting 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>> -        igt_display_require(&display, display.drm_fd);
>>>>           if (drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> -            display.has_plane_color_pipeline = 1;
>>>> +            has_plane_color_pipeline = 1;
>>>> +
>>>> +        igt_display_require(&display, display.drm_fd);
>> is this igt_display_require() necessary?
>>
> 
> Swati flagged this too and this is probably unnecessary. However, I 
> thought of handling it in a separate patch. What do you think?

Sure. This is not a blocker

Reviewed-by: Alex Hung <alex.hung@amd.com>

> 
>>>>           kmstest_set_vt_graphics_mode();
>>>>           igt_display_require(&display, display.drm_fd);
>>>> -        if (drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> -            display.has_plane_color_pipeline = 1;
>>>> +        display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>           igt_require(display.is_atomic);
>>>>       }
>>
> 

