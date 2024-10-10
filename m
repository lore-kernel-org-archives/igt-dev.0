Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD234D24442
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 19:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9810E9C1;
	Thu, 10 Oct 2024 19:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WMH6oGBL";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1C10E9C1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 19:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0yxJ/fr/glXjyQFZMGRpz7/NZJbe8lhMYYha8tZTZa/9Z4hL0XAY+Q2bRd2GOTwPvfqNpIoZqlKc+LOr89VD7T9GXD5DpaJee2+Zh2pKpDRHZpcvo76yL7H6bvm7xBGVV72KBChfc5+cZnJk+OfpVWX1eczCDO1n6mFBIyBagYToo0dPMJ2BfGf0hfVCRXs2SPVH1z4mcmx4UFEeEhqKgYxNtnOaepBAO+8gZa4bmN6kbAES2XQIRUaYIuQvk8BRLzr0OVxaMbYx+2VOanf4I9RGphmmgfU/xvY0hJ/QMf64E19HVzKEPLrVfMxpE+FSbTKZWMo500FOhYsvxDZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02VHfLdC2uRQaC3oaopzA7iJ0CjSAwgYr/dAaVxBjWY=;
 b=guPor3C63VJdXObUhmN3rJv92JDQKlnvvZ3e/0hQxd2cgX1BlnpNTPshvUHKawuOyXrY6b7Kvio4h3WEMCV7NYyNVU4mrwGrXF5XhhLxb7GvTHPZ4bxalMasjb5vtVEU9agS/vR7mrQvljv4iMAQLjWtRuc9ga8zKh3XOYgso4qTEyhrmXJBC/mZbFZk6ONghw59JliKx6B2hSIgBMNImulD4OUdTGP8OwMF8NObS5+1IGun0Qa3g/5g7RKVLbFKiFOYE+80wm0OK7W+HPqqf9Ih/U1JcZprau1iC7x4hxiUWoHFrCHHfjbvcb4KFBgvGmwDaOxrSJZVxOWZMZ060g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02VHfLdC2uRQaC3oaopzA7iJ0CjSAwgYr/dAaVxBjWY=;
 b=WMH6oGBLMOXx/LSDRrWfR9ZrjWGDhcxcL9kaFtO4ycOZlne3dRcSOFHb6rmeCeU05RVqLRfAVvVF8M4XQgM1YQtByOUjCfNJYTSmfoGA96qMiytqQR8MEJPVdwRVU8Ob1kqJIQbDs0ZplMieXKbAit0cSzCTD3FrIHxN2l6Y23w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.25; Thu, 10 Oct
 2024 19:53:00 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 19:53:00 +0000
Message-ID: <0294f1ed-5024-48a8-94cb-6a76d2d63afb@amd.com>
Date: Thu, 10 Oct 2024 15:52:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/amdgpu: enhance sdma test for deadlock
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241010045810.491920-1-jesse.zhang@amd.com>
 <20241010045810.491920-2-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20241010045810.491920-2-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 200b3565-cfd7-4cf2-816d-08dce96524ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2VVZGZ1SUlrc1JhQmVLWDlVODVUcW8vRnpYb3BhbVB3TEtwYldHMUt5aWxX?=
 =?utf-8?B?aFJHcGM4TmxDVU9YejlIcG43MXZibWwyMzJoTkI2cTRRL1dwTTlDckp3c3Jj?=
 =?utf-8?B?M3B4aFFneG9SMU83UG9sdmdhbGQwT1RiemFLY0p0cU1vWVNFVStFeWJwRHlD?=
 =?utf-8?B?ZnBITGhGb2NZVm1ISzQyRzZqVis2N0VLTTg0NHc4WStxdTh1cjliWmpCUVhE?=
 =?utf-8?B?dmp1SmFYT2VEYzkvVXVRZWFDTzVPQVhpNndWVUxVWUQ1dUdLc00rdEZtU3Nx?=
 =?utf-8?B?NjRzejZzUWRSTjJOSDc3VDgxczhJOVhWUVd5dlhXdlZPSG94c2ExMmtYOTVU?=
 =?utf-8?B?OWRtYWFzVWtuUGdCcVMzRU9tSURJY3dSVFF2VTlHK09aa2VvNjc5ajlvQ1Bh?=
 =?utf-8?B?dkM5amRrNWhBT3k5dnY4WWhWQ0ZKb0FEc1RvR3JWKzE5MzlUQzlCRTVENU5Q?=
 =?utf-8?B?QmhzS0E4MmpudURBa093RmR5aHN4NDZpVlBENjBXTG8yVHExeWhxaStYTVNj?=
 =?utf-8?B?dU5ldm5QQ1ByZC9RT0JsS0tUYzEyOFNDRllBbmlPNTNCZEwvN0xWL0tOMTVK?=
 =?utf-8?B?UVV2S3M5SC96MkVnbDY0eDFsdStqSmlYSndYL216bFVXTnJDZEFWZEZGay91?=
 =?utf-8?B?Q1Y2VFREcm1UdzFrVHZNSWo5OHg2dmhMbXVqL0ZmenMvc0UvSW0vR0RVVzMv?=
 =?utf-8?B?M1BYbnJ4UFJ0cENnRHQrelQxNzFhaitNcnpUOWFjbGF5bE5WMUF1KzFTT3N4?=
 =?utf-8?B?OUF5dFNJcFRFcElydWdQaHZXMENJM0ttQUhYT3prMmU1ZDNlV2tZakprMk1C?=
 =?utf-8?B?MkU3MmVKOHNrV1g3Y3hrRFlrRzQvSkxROVk4SlhIenF3KzV0NWw4MW1kVkQy?=
 =?utf-8?B?VjJYTy9SWmZMUGNSZlRqcFMzcHNsTTk5ZHJqZTJyazNGUkJ4T0pRSjRhcTNI?=
 =?utf-8?B?SGk1aUtuZXZmcXFjQnlMeXEzUlhXemRwKzJ2VGRtL09Qa3pRVmk1VUpIZU9u?=
 =?utf-8?B?L3VWWDBkWVk4bk9PdW1uamhuSlhuKzFLZkkwbWFXaVZHaXh2MS90REJTbUt3?=
 =?utf-8?B?ay9QWE5aSG1ZRlhzZ2hJKzVFRXFLNlNnVFJQUUtKbGp0TnI3cVRDMW1QUWs3?=
 =?utf-8?B?Z0U0SHJ0YnA2VHJ2MjZncjRadDlsblNsbkZIbDVCQXp3d3dmNnZGOXh3ekFH?=
 =?utf-8?B?TmVWUDRQRXZYR1YvUTU2Y3k3SW51UXFkYSt5ZnM2OHhOVlYySDR6OHJ2NEUz?=
 =?utf-8?B?dUVWOXZsMnlDanE0WE1hOWNESmd3Tm4vRzhWbmJ0aDdhWXppbTc3UytXR0J3?=
 =?utf-8?B?RlhOTTZ5K0YxRjJmVWJSZVdVOEFHTVkwZFR5MmRMWVFYR3d4cGlNcXJTYkJJ?=
 =?utf-8?B?RTFQb25XUTE0REdtbE14eFJ1a3FtSkQ5QzM1UFVHQ0xQcm9tRGFaNmlwOHVZ?=
 =?utf-8?B?bEU0MnlOYWpoeC9Ba25CZk52ZW1sRXhuODdxNlpzNlBKckRmY2w1c1ppeGx3?=
 =?utf-8?B?QnI0OWFUV0pmOWRxbXNTQ3Y5R2pRMnRkYWlLYW44MXVjc2YxV21jVTh4Tnpq?=
 =?utf-8?B?SnhrQUJ1Y2pXTXRudVdrVXBiaDhmL1VMOTAvaHhibXcrMHBCV09xZGVQRFEy?=
 =?utf-8?B?N0hVYUxQTWdVY292ZFh6TzIwV1ZQSUJTbEtYZVhybWQwZHIvOTRBR3NsbTYr?=
 =?utf-8?B?QWZpamQvTjNpVllycG13bFY0bDNFeFdVRWEvblgxaXJ2R0lPS2RSTmpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNnSzlEWHRmaUpqN096cVM0bldERHd3Uk8vSFRPcHIzMytLTDFiNG4wNW5G?=
 =?utf-8?B?RG9QS1dYajBoZ21GQVRqM2ZDZFZrSFlLTlFraFhHTGhCZmc2c1RUM3V4dnEw?=
 =?utf-8?B?U0lYSFljWkgzeEZJWVpxMDNSZ2JHaE5nYnQ5QytPa0JJcmliNEQwazUwL2tl?=
 =?utf-8?B?bUF6VmdqcVJnOUlnb0dUOGZZck9WTGVNOUk0WTZVdERlL3MzcHF1OEtVM2pK?=
 =?utf-8?B?WlA3UjRRYW5SRjl1MGtFeXZ1OUZPTGcwRjMwdWFGM2J6Z2tEVjA1WEkyUlhv?=
 =?utf-8?B?VS9ldTdZWmNDN0lNY1hnZkJMRCtWS1FHZlNzcEpqVkFzUkd1dmdpdHNOQ2Ir?=
 =?utf-8?B?QjRialhaRzJ1ZnVsYlRJODFpdzRXc0JHYWh0QkJQOEhSWjE1TFNpbDRLQnBw?=
 =?utf-8?B?b1psOFMyam5GeXFIeklHS2NWY2dkZDBSWTJCdnpLVTREczl6d0Y2ZWRjT2FC?=
 =?utf-8?B?S25ydk9tZkUreW8xeHhBR3dRSXIwQ0RsUDcvY24ySHMxZXRNMzVsK3N3UWNn?=
 =?utf-8?B?MGFaUFZsYVFMb0xwcjNMd0tPdlphRnJTQVh4YS9aQ3I4VXBwdnFBUVZtZWlH?=
 =?utf-8?B?RUR0SnRDWEl6TitKaVZ0YWhEU2hoV3JEb3N0ZWxOODRVN3UyeGN6SE9mdndj?=
 =?utf-8?B?QmNkNStlMy9CNlRTUmtScUpVeUJhWmZJejRhT1B4REFPcUdEZk0vcm0wZjFH?=
 =?utf-8?B?WERGQ2VicU5Kb3lyWXRtdUs3bHZhd3BEK2JBaGNLeVBEaGNBekpBUS94ZS9y?=
 =?utf-8?B?RzJqS01TL3o5MENaRnkzVVZMWkZiVk9LYzJOSHBTaGNwSjlsM09Yd0hxS0N0?=
 =?utf-8?B?ZkVJVnptZWh4Z0FWNDIyQVRPdW1yY29DWXZlbmd0blEweWJQN2FYVk0zaWFV?=
 =?utf-8?B?RmV2RXVFTHBVOW5laVg0MGlEZzRRUHRhSzl5ZGNRTENPcEJ6eFlxdE1VZzZp?=
 =?utf-8?B?eFRhSkNBVGNjR1RFNmFQUVZ2UytTT0ZEWVplY0Y0TExJMlFZZk1DbEdncVJV?=
 =?utf-8?B?KzMxQVpmOGU2ZGIyNzQ5Sml0Qmw4WWZTQ0h0ei9VeFdqVG5jcG1JeDNEWk1G?=
 =?utf-8?B?eld5WHZHYmVVcndQYjZZNkZoUG5oc2habjk2VUpiZWRPMmhaSTBPL29QMU9Q?=
 =?utf-8?B?dHdmS3pTbEpJZUJTWHVHY2t6Y0hIZDU1RGsvTFJTK2RMQThGbnhsdVdQLzN5?=
 =?utf-8?B?K0NaY0Zzd0ZWU1FYVDVDSWZWVzN0NStsRnZ1QkFEZnF3WFJobFdSa2pxQ3ZZ?=
 =?utf-8?B?R3BwL3h2dkJsdUhwckRIRm5EcW9ZUDEzNTNicVp1aGxPS3FKOEFwbytmWm9a?=
 =?utf-8?B?VkZEZmYrYTd6VWFKRlFjMGRmdlZURHZ6MVdjeWNOQjdlTEVQMk5uNnZDbmZN?=
 =?utf-8?B?SkxYcFJDelZIeDNza3UzaVVWZytZZFFxSXQ3Q1J0S0tWOHV1eERXdStoVi9w?=
 =?utf-8?B?OHhYNXRiZTh2TFdQR2FSV1pKamhQMEZSN0tzS0RaYms4M0t4d245UHQ0TjE0?=
 =?utf-8?B?MHRSSm1SQnF4NFRQSWFjbUZPM1c1SEVzM2dTQ0U0ckVLeHRrMmo0eTJHVTgw?=
 =?utf-8?B?N1ZZQTY1eGFuejYyMk1UOWlqNVRJaDVteWJYOUtjVjZoaGRiWjJRRStWaE5E?=
 =?utf-8?B?VFdKWTJTRUt2Q3k5dk0reDBLVUhCME9rMi9xNlBYaVdkdWhjNXg4WUgzN2t2?=
 =?utf-8?B?YzJXb3U3ZVh6bHR4S3pSc3RMdkpGZlhFTTcvTitTS3daZkZ3Z3ZlUjRBRVVG?=
 =?utf-8?B?NTlqNWZ3N0xFd1BISVVBUFdsT011bXJVclRzZUhVSmR0aFdxajNZTzRUQ2pl?=
 =?utf-8?B?bTRrQUgvdS9mcTY2Zi84SWVvY3BtSjNPOFRweUVORjh6UUQ5WlhqSUY4TWhu?=
 =?utf-8?B?MGNQblpFSmhQWUExTHZxZyszMTRWTlNBQjBxUEZLeWgwVTQyOXZ0SGtzditB?=
 =?utf-8?B?QWlUUTNMd08rM256K0g1dEovSnJuUXgvM0VWeUx3SVBmdkxxZXg0VkJBUE4x?=
 =?utf-8?B?SkRibDNXMENDREFlc2pyRy9taEVaY1d3VEZ3WnRnTlFrTHd5ZFVkQkl4WC9l?=
 =?utf-8?B?bjNiZjRGZkgzVEZkNkxwUVJMM2ZpTlJ4a1FzY2tDbUZ4VE1weTVHSThHZVpm?=
 =?utf-8?Q?PrdG+m7eQ/bPgVFB1yPhqb/ls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200b3565-cfd7-4cf2-816d-08dce96524ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 19:53:00.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiFSO/hZRs7t5vVclFs4PPr6W1Uz75HwiePvaubnymwHg9NefExVyNYSHdNIlcqBHvY+eGAyTVM1aL2QGsmDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958
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

Both changes looks good to me. Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2024-10-10 00:58, Jesse.zhang@amd.com wrote:
> Test all sdma rings and ensure
> all rings can be recovered by sdma queue reset.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 696fac2eb..b5d053663 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -73,7 +73,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-illegal-reg-access")
> -			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
>  					AMDGPU_HW_IP_GFX);
>  		}
>  	}
> @@ -82,7 +82,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-illegal-mem-access")
> -			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
>  					AMDGPU_HW_IP_GFX);
>  		}
>  	}
> @@ -99,7 +99,7 @@ igt_main
>  	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
>  	igt_subtest("amdgpu-compute-illegal-mem-access") {
>  		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
> -		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
>  				AMDGPU_HW_IP_COMPUTE);
>  	}
>  
> @@ -115,7 +115,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
> -			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
> +			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
>  		}
>  	}
>  
> @@ -123,7 +123,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
> -			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
> +			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
>  		}
>  	}
>  
> @@ -131,7 +131,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
> -			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
> +			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
>  					AMDGPU_HW_IP_DMA);
>  		}
>  	}
> @@ -140,7 +140,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
> -			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
>  					AMDGPU_HW_IP_DMA);
>  		}
>  	}
> @@ -149,7 +149,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
> -			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
>  					AMDGPU_HW_IP_DMA);
>  		}
>  	}
> @@ -158,7 +158,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
> -			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> +			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
>  					AMDGPU_HW_IP_DMA);
>  		}
>  	}
