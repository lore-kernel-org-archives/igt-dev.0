Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A49CDE03D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 21:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83710E199;
	Thu, 26 Sep 2024 21:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P7p4KF37";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A2910E199
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 21:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZf5VXyVupjNq8YxfvyvFjY7AD86LUDoN9kGoSU/PeFSL8Dcz1vxJWSKLMwr+u4gnbQkEd7vAsGyKfUhPsTpEAYYbu2ejxzTXCxvb+J78yaPv7zuzEzrBsbIyGQfTVfiFvEbwbOOOzIurcHScJBjV7XyvC3TIGCIBcjPhiWzOD5anF8NqzGRUpzpc0zS5a0P5EOAhYNqnOjeemEFhKG+cogKjPs7QHBtjiwEmQDzMcbiuMyOkOlc/ivp2cLYlCOEnrcDcpl+pWO5KViEoUxEaG4RgOcSqdIxBWnB9xNd82fQpK8ey+6aaZWetO+3D1nV9JR2rUGa011e47gNaIpjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcyjKa64J0m+eCgmJiXzKkwzRWrBSPyZMjLi+Y2DxlI=;
 b=eWGD466BlroPgU5r8iPgyyUJzy4SPPo4t1u2A+QOsTJsTYxGLufH8Xw+4jQ2D8HH1kfiRb6Svcup1h+GyNJIMCzDdvlXUto3U8qk9Wkv4CIgxiZ7Io69Ie7X6EZFfqyy1Eg/O3B6HxkteoqP97lZmJXdso1h8Sfw6v5hPORUk8ETzwRQfLuQ/8CzzJWwnTt+MLs1ZB2tz7d9eDMP92SBSG27GhsTj5nTgroHy3O1DrVf/T6gOgXuBbSpR3dGzzFWRnu46mo9NXYNkm7KxBUWksiI0F1Eo8gIvePJmrwwLqhRa/PHhidhnxPo6Zs5ogzFaQMbHKA3vGYtmdS8adMrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcyjKa64J0m+eCgmJiXzKkwzRWrBSPyZMjLi+Y2DxlI=;
 b=P7p4KF37K/6ODVyisPad2cdSu2OxxYOcmrPlDDPUUk3U57h73LwX1qFc0F8SxaxIEGVxvzZYEbf6S9yUCEOb/IPgWsU3TLSsDjE9IsKsqklev1UpXD+qu6AotC8Yqlve6pVBiAuaf7i3jsr6i0VmITxs/FkAG304PO+y7Bgz+og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 21:59:30 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 21:59:30 +0000
Message-ID: <f44c8754-32da-4535-85bf-e6014a83d1fc@amd.com>
Date: Thu, 26 Sep 2024 17:59:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: fix sdma linear copy command
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240926073533.3583336-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240926073533.3583336-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0036.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::38) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fd3bc0-942e-48b0-dc67-08dcde767f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkttOStIcDZTcThTREkvRGwxcDc3QkNaOExpb1U4NHRnN2RjMkhOUmpyVEZX?=
 =?utf-8?B?RjBsWVpHVW10RDNpS3pIcnRVcHBZMzFmSjg1dG4zN2lVR0tubW1uVDd6TnlQ?=
 =?utf-8?B?bXhiam52a0Y2UVlJKy9nTjBTVHlkWEZBMDJkWC91cTgyM0hCRzBJMkpiZ0k3?=
 =?utf-8?B?OUlIN3NVd2t3Y2lkY0VGVTAvWnBZQ1NoTjZZTVFjb0lMWFB2akR1V2tkM01k?=
 =?utf-8?B?OTIrcXlvV05ueEFGKzlXUHFyci9adkdCVW5NR1I0MFNyZ1dtYlo1ZTRoK09R?=
 =?utf-8?B?dDgzRzJlZG9lRSt1ZGJrQWgvS2xXcGhTRzVORzNLdGdUWnBBei9tZnAyN0Vx?=
 =?utf-8?B?TFkvbStMUWN0aGFKeDdYK041eksrZ2FSa21iL2ZyeDM3bno1QWZNcWNVdG8y?=
 =?utf-8?B?Z2twalF1TjI1ZmRXYVM0V0RIdm0zR0ROZHZQdEFKTC9ETDZMZWZwa3NmNzNj?=
 =?utf-8?B?eDZqQm9sWnNSVGpiNERiWEJxTVVrQ0R5QjFtQjRzQlpyNDc2L2t4L2RHSlV4?=
 =?utf-8?B?bFAydXdrckZwMG5ubGVzcGd6MnFpckdTVlpiSko5OEIycTlkOHc3MGd5QVdC?=
 =?utf-8?B?elZZZVQ5b0xhNERJRVV1aExad1RzMzB0bGkzRlJBcTUyekdIUER5cUdXNFkr?=
 =?utf-8?B?L3dXTk1Tek12VG1IMUFwaHREd2grL1IzNTZydU1VcjN3ZmFMdFk5N2RBMUk0?=
 =?utf-8?B?R21rS2JLVHVpQXg3QXZVK0twYkxCUWp0b2xjaGQwYUJCUzNhR3Z5SFFwMXpL?=
 =?utf-8?B?Y2REalF4YWc1V0NoT0Q1aGhvdngvNFBDL2V0eWgrTHdyQ1M4SlpIMnVPbDZF?=
 =?utf-8?B?cGZMTG01bWZOK1E2QU5Ldm1xUHpOaCtISEJha3p3bzcwK1FSUkhpZTVEVDlJ?=
 =?utf-8?B?dTVTcHV6ODMwc05EUmhmMXdNSkp2cXRaTThOZ1VabFJQdDRXclU3QmFpV0Fz?=
 =?utf-8?B?T0d6NSs0OFNYbzJ5VjNCdEEyRy9NRng5S0VpUzE5WjNRS0M1Wnp5cG9VMEJK?=
 =?utf-8?B?ck1zdUlzV21qWWhRSVU5cU5mY1dVUHdlcndNbGZuYXdNUHpHV1ZFYUJKSUpq?=
 =?utf-8?B?ODBtbjdESnRsQVEwZnVIQ0ZYenZlQ0wyL2ZXTWN5emJkR1RxUWJpQkRaU1o2?=
 =?utf-8?B?ODNFUVN6Vm1yaFhqa2NzTTVSWTUrTmZsNDVqSmxJVHdTS0JXeGI5TFRDbHlo?=
 =?utf-8?B?dnJwOURyZnM3S2xnWmxncWxYWFJFUy9oUUNSY3R6c09ZY2o3ajFqVlI0a1ow?=
 =?utf-8?B?eUQ0Z1ZlNlZvcE9CNEFIWDBWeDlsV0lvQW1CSWVleGV1aW4rdWVDbXpHOGZv?=
 =?utf-8?B?RHpRU1cvQ3RLektMMDBXTm5Va1NyTWFvdEV2ZDdDUGh4MlZ6UnQwWndSUUph?=
 =?utf-8?B?YTd4NjVacW5RLzFRdXBWNVFFWm1XVXhhYnhwcmExZUppdnFlNHFtTlp0ZTBC?=
 =?utf-8?B?ai9ZcjRzQVFjUmhHb0paN0ZVY2ZLSXpWTlU4OFgwQStoeEFtVjZGSHlMMktZ?=
 =?utf-8?B?eDNDaE41Z0VBSXRBcHJaa1ZZMm1ZYzd0TEhjNUdYZ2g3b3I1VXFscGd0STk3?=
 =?utf-8?B?YW1CWUJRRnRJcDBmdlcwNmRHNk5oOE5WSWJ0RWFOQURza3NQZlZkd2I1bkE0?=
 =?utf-8?B?eE9FSGJ6MDVvMGpqWUtmZTN4VlhwaXQrdnRjcmhxdDRTQWhXckJFenNFaXhS?=
 =?utf-8?B?SFdzaWM1dkxTWFZ1aE9nN0I4eTJreWJkcXpmaHJGa3B6b3lKSnBSY3lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVqek90TnZrU1NTbW9OYStOQXBBcFprV1JxTkt4bEFmdUY0bHRIVmg2WTdE?=
 =?utf-8?B?Y1htWGlBYjhPVnFZdnlyNDVHd1RMMzR6MzkyL2FobjJxVGRSSkZiMndKLzBm?=
 =?utf-8?B?aXFPSDhzbmNISDZUaDZvSS8weHhuT1JrdVl4VkJudWhBK3BHM2swRUNMRmJP?=
 =?utf-8?B?MGFIYTdERXF1Sk84NlN2ZG1oTmtWSWdjOXpaL0p6RXhQU05hWW9NODBXbjVp?=
 =?utf-8?B?V2x3M2NZN0Nhb3pQU3hVR1JUbXAwaU1URkxjYkxJVVQrOUpST0lEUjE0QlRG?=
 =?utf-8?B?UDRDcEQxS3krMWxSSGVxeC8yRUQ3OWI5TEdJT1RTalBJNnZJNnVxZUQ4R0JK?=
 =?utf-8?B?UHBrSU10THpGTUE0djhENjNmMmtGaitUc29SeEQyeEg2cTREWVltY2hDYnNP?=
 =?utf-8?B?MkwvRUt1aDUvVm5ocXN2K25KT2RkZFdra0EyNEQremdXQUlWdXJkVUVXMER3?=
 =?utf-8?B?V0FmcDF3cnRHUzRKWEFOZWdjbFhVbi83Tm9nRk4wa0phdkVuaVV2U05LeW0z?=
 =?utf-8?B?QzNURVlhWHFDL2tSKy9yZC9ubGl1T2VFWHNWOENDN3M4VHVLR1NJOXZmZkVk?=
 =?utf-8?B?dUtKMkVEVEJtTlJZYXVnZG04TTFvcnVwY3JCT0xLWERld3NQK2hPSk0wQU85?=
 =?utf-8?B?dHBxdGw2Z2RwU2o4REdsbjJzMnQwU2I4dGUrRHU4dFhPUDdNbXE1Y2szS3ho?=
 =?utf-8?B?ZXVUUUgzb0JPOE81U0pSZFRGSGFLOE1JYjl2WDRuZnlBdVNjbkpSVllQOW5P?=
 =?utf-8?B?Z0FoSXdEUmNGTGtxL2E1cmwrdElXNFhyZnNSQjNVbnZvSmZjRGg4UERyZXVL?=
 =?utf-8?B?NXhIdmo3Ny9sQ0loMUFUaXpJeVl4bWVGQzVMMHNjc1UwaGZMY0sxUHZGb1JL?=
 =?utf-8?B?cG0rNUdUWUhJTHRoejFVUWIxMm1XK3BRYVlqRnM4MDF4bjRCaFZjT1oyWDFN?=
 =?utf-8?B?TUw3Zk9Ia0VKVUt6UnVpQXU3NStZWWVyN3BmSDhHL2prUGh1VVA1WnEwNS9z?=
 =?utf-8?B?b0VRVDVvVWtLNWtnWFcreUZ5ZDllV0dkeS9kRjRIblR2UTNCb3hIRVdPV2hh?=
 =?utf-8?B?MFZmZFlOMzd4OERaTkNWTHNxSnd4RnF4V0hSeFd3ZjBQM1dKZnF5a0VOK3Zl?=
 =?utf-8?B?Mm5CeWJoNHpoSWEvNm9ta0pQeHVCalFPUDV0UDJjSVVzOU1RRTBDMUJidGdL?=
 =?utf-8?B?YnJLRFZoSmFJNXpDbWtyUnVzTkM0TTVqR3ZDTFlDbVJUYmhXckFkcVZzWHFF?=
 =?utf-8?B?YTg2bXlZN1dDS3Q5RXpkd01TMGhaZVVWYUxsYjE5MXZ1SUwvWHc5Ui9vc0tJ?=
 =?utf-8?B?YjYzV1JqODdTaS9qSmJlSXF5ay9OOW5Nb2lhWW5OeTBZakxUZjRuaEE5SE94?=
 =?utf-8?B?T3ZhSTZqMDk1ZndsTlBGLy9qQ0RmNlJDL2tFZ2dPeVFyekNZWTVDNlNYMi9Q?=
 =?utf-8?B?cnFCcDVqVGN6MkpQSEk1ZXdWWFljeldDZXQ5Q3lWTENiZzhxL21RdVN3NnFa?=
 =?utf-8?B?SFJBYWZiYUlvY2tlUlB5b1Z0SnZEWk9nbVdqMUNDMTVnR3BNZGtCdlpZOVFK?=
 =?utf-8?B?Z1FqdEoyb2xVdjBhNHdGYVpLU3RDN2RXc3VGZG9IVGUya1d4a2IzSmpNUVVt?=
 =?utf-8?B?YnZzMUFMUEFyR0w2OHRGemVJNk5DQ0JoV3ZNMnUwUWd5UlRlaTFLL1hpU1hO?=
 =?utf-8?B?eTNmVUdQYTR5TXpYOTRIRUZacFZ5QU53RisyNXZ2dmdJaXl2V3NoTEs0NnVQ?=
 =?utf-8?B?bU1nK2VVb0Jhak03ZER2S0F3cmhyRWRBelVjcWp6eHRHR3NPSmVBOGo3bHRK?=
 =?utf-8?B?QW5qalpCWmhhclBlSjl2QTA2NWM5S0lqZXJxYnNDcGlqMmtqR2Q5RWxXQ0ZK?=
 =?utf-8?B?cDJ5NDJPSWVGcWx6QmxWRVpLQzZGN2RMemdLY1RaMXA0Vm5KdXBSdHhtY3Nl?=
 =?utf-8?B?QXlwdzh3eWk2eENuMVVJV2pRT0JIa0VURGhacWp4a3REZ01DclFaUGQyK2Zh?=
 =?utf-8?B?RXBpT3M3SzRxZG4xVWNZWmdXbEdHSnBuR3RYK2d5QklUZDJLTDVQNDRHaUdh?=
 =?utf-8?B?Z3pIV0pGeU8zcnNXT0kvcEFBcmRCYkdrbHJoZTVqN3BWOXFLVEtVTFU5UlR6?=
 =?utf-8?Q?2A0lA8jACNcVkO7SHkMvsfKnC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd3bc0-942e-48b0-dc67-08dcde767f2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 21:59:30.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfFKURLflpEwrr8pFlB1msR9PWs6T9fUe7Uuv+z0DSQ7hKlEzyxI1W13fycr2cizorMNCRFqUet/jhCaPRbDtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

the change looks good to me

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-26 03:35, Jesse.zhang@amd.com wrote:
> Fix page fault when using sdma linear copy:
> [ 4606.313448] amdgpu 0000:1a:00.0: amdgpu: [mmhub0] no-retry page fault (src_id:0 ring:24 vmid:1 pasid:32772)
> [ 4606.313463] amdgpu 0000:1a:00.0: amdgpu:  for process amd_deadlock pid 4440 thread amd_deadlock pid 4440)
> [ 4606.313475] amdgpu 0000:1a:00.0: amdgpu:   in page starting at address 0x0000000000001000 from IH client 0x12 (VMC)
> [ 4606.313490] amdgpu 0000:1a:00.0: amdgpu: VM_L2_PROTECTION_FAULT_STATUS:0x00120231
> [ 4606.313501] amdgpu 0000:1a:00.0: amdgpu:      Faulty UTCL2 client ID: SDMA1 (0x101)
> [ 4606.313511] amdgpu 0000:1a:00.0: amdgpu:      MORE_FAULTS: 0x1
> [ 4606.313519] amdgpu 0000:1a:00.0: amdgpu:      WALKER_ERROR: 0x0
> [ 4606.313527] amdgpu 0000:1a:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
> [ 4606.313535] amdgpu 0000:1a:00.0: amdgpu:      MAPPING_ERROR: 0x0
> [ 4606.313543] amdgpu 0000:1a:00.0: amdgpu:      RW: 0x0
>
> For old AI asics, the sdma copy count is shorter than newer ones.
> So add count check in case the max range is exceeded.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 3f8f28483..f22a322e5 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -189,10 +189,17 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
>  				       SDMA_COPY_SUB_OPCODE_LINEAR,
>  					context->secure ? 0x4 : 0);
> -		if (func->family_id >= AMDGPU_FAMILY_AI)
> -			context->pm4[i++] = context->write_length - 1;
> -		else
> +		if (func->family_id >= AMDGPU_FAMILY_AI) {
> +			/* For FAMILY AI, the maximum copy range supported by sdma is 4MB */
> +			if (func->family_id >= AMDGPU_FAMILY_AI && context->write_length > 0x3fffff) {
> +				context->pm4[i++] = 0x3fffff;
> +				igt_warn("sdma copy count exceeds the maximum limit of 4MB\n");
> +			} else {
> +				context->pm4[i++] = context->write_length - 1;
> +			}
> +		} else {
>  			context->pm4[i++] = context->write_length;
> +		}
>  		context->pm4[i++] = 0;
>  		context->pm4[i++] = lower_32_bits(context->bo_mc);
>  		context->pm4[i++] = upper_32_bits(context->bo_mc);
