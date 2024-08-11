Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BDC3DA7F
	for <igt-dev@archiver.kernel.org>; Sun, 11 Aug 2024 02:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A210E052;
	Sun, 11 Aug 2024 02:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yQShkwCv";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6FA10E052
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Aug 2024 02:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFT91S9TgqPhCMB0Jtyu1fFHLr08cA384wvn9onJu46miHNVmHge7pG3ACwyYpi7EvOOaWMwQPoThHOhX91lpw+tWTB8bszt0hlHcDqt+dYf5sbThQ7JVcMFFWm8uE2U3jDfzAmNG5R4IE+LcE+Afb21ySB3UdZ4hebzpVPVI9/raEyOy0S/4NCRTGGSmlz9uVHzzywRqu3txxnx/XziY55L+SMcwxwEDJNN5tzw/PErsLfQQsJVLOGi3vX9s6RK2p8PDf1iseWVDhKzseG1VyX4QJKsULXlHPrrwc1l8p6XtNcjNnWfW7Lm6cdB+zCjK0zvjHENPXuaulXzokYIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppzV5q6d40VOE50z5mI2mx4a6L+eyTTaBnpG3SU6tic=;
 b=L1LkjGS4ypEB/fD5MSAWeG6+pSvWXzN8pj1MpdU8g7W27e1fht9Ru2GONBt+e5zKsG7WgWRQdBiPD+yxSgF4mEHA9ZSEaXhuU48ftBcKufUZYX6XPAc7HgnqMcHglCRJPN5G7G/LLv861L09lWJLvCiOYbVdEaTEephUaWEbuwkmyzI4hi57exGkC5XY4N7MeeJ8Z1x5QE0UDR21lcik8Iddd+APmtqZwm058uFFyEOt5EGHci9S0eWXJjGSIHYt2hZSxFTVBCPn7ROzSP/GAd7fbcx2njHCYOJ25I83msJmSHoxUOyT1hthW32NVCWRBI3v27E2uqUAaBmkvswyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppzV5q6d40VOE50z5mI2mx4a6L+eyTTaBnpG3SU6tic=;
 b=yQShkwCvwhNvIrr7GHmYwuPRIeJfdvmrvMosl04rHBxdZ/LXEVNR4KHD7fCCB7dAOeP+UYpSCxSRDRWEtcKgI41MSd9h6ceq+LrfYjoljlZiF/xGeaeqQ5ZdUcPUByeZv/2fluTi582FOttEM94Ccx1G0V7NQ4NRbEKCKVtUjEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sun, 11 Aug
 2024 02:18:27 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7849.018; Sun, 11 Aug 2024
 02:18:26 +0000
Message-ID: <65549f20-033b-42a5-b40c-824e67b24bc7@amd.com>
Date: Sat, 10 Aug 2024 22:18:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/amdgpu: add KGQ test in queue reset
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240809041449.2740836-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240809041449.2740836-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::26) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: e027d060-2719-41b7-6862-08dcb9abe209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2pMbERwb0tZbVN4VHRuTzF6QTBMZC9qNDdCZkxONHdkMnhYdG40VWRUWVZz?=
 =?utf-8?B?c1NFZFl5eWdwb0JhUStScW5tS3ZpcnFldlpxNll1S2hRcUJiWk5Cd0ZYSDF3?=
 =?utf-8?B?eFFySXZkR0l6VW1NMTFjY1BLd2dKN2dML2tCRXRvS3k2bzkxRUtmT21GVXhr?=
 =?utf-8?B?MklDN1NGbGVlMjdyMTl5aEh3eXpvSkxBeFNWNDYreXF3NGNaTHM3WG1iTmxi?=
 =?utf-8?B?NE8xdUdxRXhJbTZ2RlA0a3ZnYVovUm1qUFYzc1V6UGxpVW9ZVmFybG9zM2JL?=
 =?utf-8?B?NERsQnB3bHdRSDJNVVc2MU5Dd0lWZVoramVjek1NUzlObkxlREdmdXAvTXdT?=
 =?utf-8?B?bXlNZWYyQkhwM0NSMmphSFpCRkprQVVBQ2pEek1hUFhMN01FeUxoTU1KSW5N?=
 =?utf-8?B?bHczY0ZaTmQ4cWhKaXp6ZTFNa1UwWE5OM1I1THNtcHZoaGdIV1ZBc0ZhS1Yx?=
 =?utf-8?B?WlFaQzFTNFUxdldrUTR4Qm1tak4ydFVtUGdsZ2gzWmlRSG8xYVoraDBVN3lh?=
 =?utf-8?B?eHBLaDNhRmdRL3VrZUtDZkRkdXQ0NUdjdkMyYm1sVzJYMGdvaWNaL3RnUEhS?=
 =?utf-8?B?RzJXMldoUGY5L1YvcGdWcDNWdlNUdkNqNFhoUDNFWTVNaThLZVNJOFN5OGgw?=
 =?utf-8?B?b1RkeHdmWVNMdDFJNUZwR2NoVk8wSEdRdWltMTRQcTFsbkgwY0NyMWx5N2oy?=
 =?utf-8?B?YlkzN2E1YXNSVFhzUXZQQUZLTU04dkpVVHplTXcxeklndFpuckoxdkw2bXkz?=
 =?utf-8?B?R2ZsSGliVC9NRlVQNHlqNkluaUxzZHAwc3ZuS1kzb1hISFg3VngvcjJxeFhi?=
 =?utf-8?B?YThSK2lXUlR5M1AvZ0lzckxJTExtYXg1UWNPVWc1eFd3L0E1dFFqK1kyanRy?=
 =?utf-8?B?SzAwNFRkLzhWOXBlN1IzcHRNeGlVU1VLVTlwYnNGS1NkWXBQUFhVcHlvSU1I?=
 =?utf-8?B?K3JIVmdZdStiWHNKUVhvZytTVHlvOTJsMDUxUEMxVjJMaEFTRGlncDliNXBm?=
 =?utf-8?B?T0s1VWltSWJIbmVXRVJyRVI3QWNLNDU0aWZtb0FGa0VobUpQVVFWYUM3TDdI?=
 =?utf-8?B?NG1OK1haY0lDeXlNUXlkTFpPblNRMVhoK29LRTNYMXdFRFp3UFZFN0hZeCta?=
 =?utf-8?B?UVdsak5INDNJa3ZQekZESWV1clR2Mmo1K2ZLdEdGQmlFZ1Y1OUZNdkNGU0k2?=
 =?utf-8?B?eXkreEx3ZHFaMStVRS9OYWd6allveWMxK0RZTDBMOC9JZElhWis4YlpnczZ1?=
 =?utf-8?B?TFI3a3VTNEFxR1FUR0hleDVtblpaSEJxU0dHc2liTUoxZFE1eW4vNGxMc2pV?=
 =?utf-8?B?bEZPNTVXZHlkYkRYUXhpdi9MZy82OThyaVBjbVljTzZFTURzVTVXS0tGdlhn?=
 =?utf-8?B?YUwwOHpnUmFBY0ZMOWNSNXF4eHROMjVxc0EyNnRMeUpVU2Z3bWVONVBCMXAy?=
 =?utf-8?B?dnRsQU9vS3hjM3FNZHZxUDY4c0tOQXcxWlZQa1IyS29xNXdEVzBYTURPT1po?=
 =?utf-8?B?V0QzUGpqNlU5am04Zis3VDgxUFVqMlV3VFVIY3pIZ3JsQ3NiTEJBR1lITGwy?=
 =?utf-8?B?Ym9PWkUwalU4MTJzM3pWMlo1bnVndTR6Qlk3cFdHeWY4OW5zT0xtbU1IZmtF?=
 =?utf-8?B?QzdTckludDhaS1Q3THFGb0dqbU1qamJrbFpaT1p3NEZreGhlYlNhNndqOTBE?=
 =?utf-8?B?cndrSlliQTVqdUhjcGRDRFJLd0tXdGh1Y2dqYTIzQ2hVMTVoaXZhc25xV2o0?=
 =?utf-8?B?L21ZeDRZRFRxYlhvczQzYmkxK2R1cnVGOTFEeXFPWVVScExQRU5GcWZCMGps?=
 =?utf-8?B?bHptcG50eHVia2x4MlRSQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNxYlI5NXp4WDlQTHRybncwSklneDhNcVFQQVpYbUNTRGI0L1dIK1RBQmZU?=
 =?utf-8?B?U1FlMVJ2WmU5N2RWd1dpQU5ZaVA1eHVvTittYTcwWEc2U2dEWG53MWp3NlBE?=
 =?utf-8?B?MnZpaG1aMEZnQXpaTk1hdWFCRXNBQkVTdzNGa0JBWUlaSFVVUDN4U3RVbmJn?=
 =?utf-8?B?SmxMUXo0dnYwWllLNm5PQm9PWkxHUGJwbnowTjQvVlgxYWkwUjJvY3N1SGtN?=
 =?utf-8?B?KzZsUlpiTFNBMnpkeGdQb1ROeWxINDh3K1pWVHoybnd1clQyM1VTc2JSbWJ6?=
 =?utf-8?B?bnVvUUIxNVk1Y1M5WXJsa0RvQ3JuZTUvU1g0TURjeHRIS0ZYczRuTCtnbjhi?=
 =?utf-8?B?SlNSZ1FUWXhhQTl0eW9SN2h1MDNmZDVVYkEwUzVNbFgxYkpDYjFQaHArdzZi?=
 =?utf-8?B?UEt0Z21tcGZoNXd1L0xSd1BIemVQUGlxVkZSSVp0NDJXSWtGdXVZYUhBcU1x?=
 =?utf-8?B?cU1KWllxcGxzYjdCWVh6dlI2NTVrM244NHo1cnVubGhMdHpzbks1eFg5T0Ew?=
 =?utf-8?B?QWNLWHVBbUt5alVwQlVpdHV6cjZOZmFBeUNPNUVWbFYxaGJtelJEZ1VOSWV6?=
 =?utf-8?B?SHBuMk9lVXY0WHNXb1lDWU5NdCt0YlhBcG1KRGxaUlA2SGcvN1B1RjBJV2cw?=
 =?utf-8?B?RlFNOXBTWjFwcXdlRWV5OHNxOWxUT0ZoNTQ1T1V4NDd1YzB3emJwbDVCaWNz?=
 =?utf-8?B?VWlEMW83eElEV1RGVUY1cWgxeVo2Ujg0bWtwUHU3MVNWUUhpTTBUKzRuRCs1?=
 =?utf-8?B?cHdkSnh5RjZ5QktTSlZWd3hXODhaUWJyK29QRUdET3ZJV2l3VWZPdFcrSmU2?=
 =?utf-8?B?L084Z1I5MG9TNkswRVp2dTlaK0x6TzhGeDA4RDhPUVd1WnJ3SE5kSDhyWFVX?=
 =?utf-8?B?M05tbjZ3OWZzMFRoRlVPRmVZT3M2N09laHI2YVVyQklDakZsVGVCZUxpWXZp?=
 =?utf-8?B?MWtHUG1kNEFKaHBrTXNha0hyMjlUZUpaanErY1krSnY0endrVmNkNHJZT2Vx?=
 =?utf-8?B?dFpPdEZoa1RER25rdWd2Z2czZkh3aXNaWk13VWg5bDh0SHVldzZVZUxYTWJx?=
 =?utf-8?B?TDRtajNtcUNTMGZtc2w5SFMwMCt4YUFwYzJQTUtpK0VYMVpJY2U3aUUwMEJ2?=
 =?utf-8?B?ZHJUQktiR3VlVGtaMFM4Z1FzcFJudTZLKzljeXFOMWlhYUpEM3dzZjBBWXBO?=
 =?utf-8?B?UDRlalp1RlpFN3dVQk0yRVpac0FhUWdJeXU3cDRYVXBHYWQvdHJsa01YaWxH?=
 =?utf-8?B?ZzF2T1VGN3pydEx4anczOTlEcDkxTUxwbFlPOGRNaEo2Z3FKUTJaZUZKTmxI?=
 =?utf-8?B?bU1sOS82MG16Ym82L0RXSHZ4UUJkWENnWjdWWmgrVXhGYW9JeWhnQURNVWpp?=
 =?utf-8?B?M0poTGN1RW01enpqWWo2U3h0clo0a3VRZEJCZ1dRa2xFeHFDUlFCalo2NnFB?=
 =?utf-8?B?d1ZhOW5lZkdQUmxXNURpQTJqWFltZHlCM2pmTzRqY2ZWeGhETGhmM0VZWkkx?=
 =?utf-8?B?L01rSWVmanNHUnJsWDN0TXRDdDl2dDB6ckxYMlUyM0Rpa1NwNGVuOUMwYmRi?=
 =?utf-8?B?YkE5a1E5V04xOVlETy8yNUFXWit4eFpQcjVnVGRVVjNJR25LY29oaHFSMENI?=
 =?utf-8?B?TWQ2VWoreGtQcnJKSEZsbC9GdXFzUHNZUlordU4rWW1USUVUbWhGYmFzQlox?=
 =?utf-8?B?UzZrbW9PSnlLeUxMRjJmUlV3bGV2Z1l3NVY2UFpTRksvSmlCZXNIcTdReXhV?=
 =?utf-8?B?UWI3U1YyKy9wY3l6eTNWaFFRbnQ0Uk16YURsdmQ3SkZMK1cyejlHY2k5NUtE?=
 =?utf-8?B?MC9rQWU4eUFjWmNyNU1oN0gzcGdxeGhtY2pBRFFLQjFRa2IyQlJES2xmYzJq?=
 =?utf-8?B?RFdaMzdhRlphcW82NWczOFZQODdhZUdzNW1WMElvb1VXcmJ5dWIxWVZIZFR3?=
 =?utf-8?B?NDAvUEhHUTc3Y2RWaXd1a1EwazEzdTlRVnJ4TEdlaFFiR2F3MHQ2djlxdWdY?=
 =?utf-8?B?ekxzR1ZSUnhhNmFoUHBlT3ptMyt1alNneVRUR2E0YW1pY3h3RkJMNXFZa1RV?=
 =?utf-8?B?RVhId0hHVXBhWnBhS1lpRW5mektVT21CTkFOeHh1QUxKcUNCS0lxV3Urc20z?=
 =?utf-8?Q?xOxDoGEfVpprP5dKaKcmp5yGG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e027d060-2719-41b7-6862-08dcb9abe209
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 02:18:26.4751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9cs9IB5R3rosw/RimgG/T1CPbN0VZLKKsoOWP2zJWK/vPyBTOCNKRDUcNIYCIfoDUsipzUNnfiSuvzPT2gfBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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

The changed looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-08-09 00:14, Jesse.zhang@amd.com wrote:
> Enhance the queue reset, add KGQ test.
>
> V2:
>   Some improvements regarding the selection of testing ring (Vitaly)
> V3:
>  Fix calculation of number of constant tests.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.h     |   7 ++
>  tests/amdgpu/amd_queue_reset.c | 145 ++++++++++++++-------------------
>  2 files changed, 69 insertions(+), 83 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 7fd883608..1b39d9945 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -45,6 +45,13 @@ enum  cmd_error_type {
>  	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
>  };
>  
> +struct dynamic_test{
> +	enum cmd_error_type test;
> +	const char *name;
> +	const char *describe;
> +};
> +#define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
> +
>  /* aux struct to hold misc parameters for convenience to maintain */
>  struct amdgpu_ring_context {
>  
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 9ea0a1f24..bc8414c23 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -846,25 +846,36 @@ free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
>  	}
>  }
>  
> -/* TODO add logic to iterate for all */
>  static bool
> -get_next_rings(unsigned int ring_begin, unsigned int available_rings,
> -		unsigned int *next_ring, unsigned int *next_next_ring)
> +get_next_rings(unsigned int ring_begin, struct drm_amdgpu_info_hw_ip info[],
> +		unsigned int *good_job_ring, unsigned int *bad_job_ring,  unsigned int order)
>  {
> -	bool ret = false;
>  	unsigned int ring_id;
>  
> -	for (ring_id = ring_begin; (1 << ring_id) & available_rings; ring_id++) {
> -		*next_ring = ring_id;
> -		*next_next_ring = ring_id + 1;
> +	/* Check good job ring is available. By default good job run on compute ring */
> +	for (ring_id = ring_begin; (1 << ring_id) & info[0].available_rings; ring_id++) {
> +		if ((1 << *good_job_ring) & info[0].available_rings) {
> +			*good_job_ring = ring_id;
> +			/* check bad job ring is available */
> +			for (ring_id = ring_begin; (1 << ring_id) & info[order].available_rings; ring_id++) {
> +				/* if order is 0, bad job run on compute ring,
> +				 * It should skip good ring and find next ring to run bad job.
> +				 */
> +				if (!order)
> +					*bad_job_ring = *good_job_ring + 1;
> +				else
> +					*bad_job_ring = ring_id;
> +				if ((1 << *bad_job_ring) & info[order].available_rings) {
> +					return true;
> +				}
> +			}
>  
> -		if ((*next_ring  & available_rings) && (*next_next_ring & available_rings)) {
> -			ret = true;
> -			break;
>  		}
>  	}
> -	return ret;
> +
> +	return false;
>  }
> +
>  igt_main
>  {
>  	char cmdline[2048];
> @@ -878,7 +889,7 @@ igt_main
>  	posix_spawn_file_actions_t action;
>  	amdgpu_device_handle device;
>  	struct amdgpu_gpu_info gpu_info = {0};
> -	struct drm_amdgpu_info_hw_ip info = {0};
> +	struct drm_amdgpu_info_hw_ip info[2] = {0};
>  	int fd = -1;
>  	int fd_shm = -1;
>  	struct shmbuf *sh_mem = NULL;
> @@ -888,7 +899,7 @@ igt_main
>  	unsigned int ring_id_good = 0;
>  	unsigned int ring_id_bad = 1;
>  
> -	enum amd_ip_block_type ip_test = AMD_IP_COMPUTE;
> +	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
>  	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
>  
>  	amdgpu_context_handle *arr_context_handle = NULL;
> @@ -897,14 +908,27 @@ igt_main
>  	 * which are shared between child processes ( test/monitor/main and
>  	 *  separate for background
>  	 */
> -	unsigned int arr_err[] = {
> -			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> -			CMD_STREAM_EXEC_INVALID_OPCODE,
> -			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
> -			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
> -			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
> -			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
> -			BACKEND_SE_GC_SHADER_INVALID_USER_DATA
> +	struct dynamic_test arr_err[] = {
> +			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
> +				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes"},
> +			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
> +				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes"},
> +			//TODO  not job timeout, debug why for n31.
> +			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
> +			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
> +			//TODO amdgpu: device lost from bus! for n31
> +			//{CMD_STREAM_TRANS_BAD_REG_ADDRESS,"CMD_STREAM_TRANS_BAD_REG_ADDRESS",
> +			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
> +			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
> +				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
> +			//TODO  KGQ cannot revocer by queue reset, it maybe need a fw bugfix on naiv31
> +			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
> +			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
> +			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
> +				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
> +			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
> +				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
> +			{}
>  	};
>  
>  	int const_num_of_tests;
> @@ -921,7 +945,7 @@ igt_main
>  		if (is_run_subtest_parameter_found(argc, argv))
>  			const_num_of_tests = 1;
>  		else
> -			const_num_of_tests = ARRAY_SIZE(arr_err);
> +			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
>  
>  		if (!is_background_parameter_found(argc, argv)) {
>  			add_background_parameter(&argc, argv);
> @@ -943,8 +967,11 @@ igt_main
>  
>  		r = amdgpu_query_gpu_info(device, &gpu_info);
>  		igt_assert_eq(r, 0);
> -		 r = amdgpu_query_hw_ip_info(device, ip_test, 0, &info);
> -		igt_assert_eq(r, 0);
> +		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
> +			r = amdgpu_query_hw_ip_info(device, ip_tests[i], 0, &info[i]);
> +			igt_assert_eq(r, 0);
> +		}
> +
>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>  		igt_assert_eq(r, 0);
>  
> @@ -959,68 +986,20 @@ igt_main
>  		igt_require(sh_mem != NULL);
>  
>  		run_all(device, arr_context_handle,
> -			process, sh_mem, const_num_of_tests, info.hw_ip_version_major,
> +			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
>  			&monitor_child, &test_child);
>  	}
>  
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
> -	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> -		}
> -	}
> -
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes");
> -	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> -		}
> -	}
> -
> -	/* TODO  not job timeout, debug why for nv32
> -	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
> -	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
> -	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
> -	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,
> -	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
> -	 *	}
> -	 */
> -
> -	/* TODO  amdgpu: device lost from bus! for nv32
> -	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
> -	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
> -	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
> -	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> -	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
> -	 *	}
> -	 */
> -
> -	//amdgpu_ring_soft_recovery
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> -	igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> -		}
> -	}
> -
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> -	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> -		}
> -	}
> -
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> -	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> +	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
> +		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
> +			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
> +			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "compute":"gfx", it->name) {
> +				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
> +					igt_dynamic_f("amdgpu-%s", it->name);
> +					set_next_test_to_run(sh_mem, it->test,
> +							ip_background, ip_tests[i], ring_id_good, ring_id_bad);
> +				}
> +			}
>  		}
>  	}
>  
