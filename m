Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10982CD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 02:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCBF112599;
	Thu,  4 Jun 2026 02:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hf6yXZUk";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB5A11259B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 02:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkpezHv/feMyakYspoTq1d443ytsnqt/5o8q0PjCv/AzoW2AJ83ns44NTJ/byBHMnbhWrxPo06V84eECgdhTyEv6FOMupLa86DQgL3WaY0wvSCFXYKiCpWwu3+IU65Gu7pZjMc+cCllwiAl8tiEAmvRtGN7jp4FoYieZflccpYf64NBP5+rZVpATILfS5MSFiDYZV8EiLYKO+XsU4jeFUH/svArDnDgaTq/DKFkILxg01pnsM0BNnGLJjOQFpkaSXlU62NF8CaGUm0fT8Z/L9Gff5Sc3gnHprHs8mma0xY3QBVWl3OUMNZmuaLAJsmDtLaBtDCXcOfbC2XFs2aPSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMIVY3bvY8XqsSOxSwklxxnMPjzKMBFw8tzuT6PVhRY=;
 b=Tf34zd2Rvpj1hX7hisFG5R6buuTmaa7rJjbyVVaj6ghgF7Ha8NNfkVzbvMYxiGncQs9RB68A2+NlWqQyTCqrZIMkUwnWakUdyLqyksEoy4q4nmf9tIDLrVItAHLqiWPxca6bSOIshNq2YeNu5OmmZcVBdsdQITdS7/k3A6QG5NiZsg+lSK5mIjQedsDok8wA5wHuRRwqt+6n8dxpWT6EpR0SKXbOCdnh9+er+7Ewe5vdPg21YaDv/PP8rdzKAWTObwvl6WbWRWbj8txEOmQK9gOsnXaIcG6ljkm9MfXfw19Lt6XtJ9hhuc2cy5qL4s7VEi7jBQ0AJM/v0EvCvzYXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMIVY3bvY8XqsSOxSwklxxnMPjzKMBFw8tzuT6PVhRY=;
 b=Hf6yXZUknKIAp1D5aiiP4a0kfKVQvNU7iojcubXnod/7pp5YbqM6d9niMyb5b9VZXuGbj6kh4CxlO1pVww0ss+MT3IZnrJZ2TU0ku0JRemdVR+iGMnhKzyl+zuf7oeX4wUJUd0Vhpq5yO33W7bZKoCwEMoF1rq9Bc1gLgYbvOFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by PH0PR12MB8006.namprd12.prod.outlook.com (2603:10b6:510:28d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Thu, 4 Jun 2026
 02:31:46 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:31:46 +0000
Message-ID: <1c5f751f-94f4-40ac-8f58-75dc5480d913@amd.com>
Date: Thu, 4 Jun 2026 10:31:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_legacy: disable AMD Panel
 Replay during test
Content-Language: en-US
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260602064543.58586-1-ray.wu@amd.com>
 <20260602064543.58586-3-ray.wu@amd.com>
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260602064543.58586-3-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|PH0PR12MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: d72ca09a-557d-40cb-2491-08dec1e16bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799007|18002099003|11063799006|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: IHqzFt8/IxtJn84ZhcaerYzxTcuzO9Tg0Zbqk+53zey2hohkhiKKTQ1RE93WlNQJV7+4dM2+2An+MsOUG4MUj1pzigeVYbcS6mFi5LjJtOO9zoS6/VIWXjqyWUi6bW3OVu9S+biJVy5pCYJdgj3JkkFmjygixW0LvhakMIbPBi11My23l20YDcLYbfiN2Wz9Bzd/tjuZnGWDUYySZRwlqgFQklKi24EHnsaNIXKGqmSp8qca9xqcAeo4yuQR1IHxoA3aeRJLqac2ku1HBF9q7V3TydEcvxiT6u9qPps5lYWm3CipBwLPSE6879nUpJbAFsWiuhdNMdakm3FqwJrq34W7BHNGjJRKy9rINk9JzbuvNkoMIIWOkXo4ZkxzhAATBvYfyZGcQqaWGQ5OCyPGfTiRvE7oOmhtkEJqBzOLOSHw96uhwDwWp2JONsOY35RtPQ7AElRMP3GGERYHlZ8hG1VSVDc1j5q8kD3B/KFG0TwY7FrJlY+wP3uRQvdR9HrL6tEQwLNSYH7Ni/xgF/tim1O249gfThsFtET8Xa0rLNCsdjX8GwHln7mcCNAzkP71c9dEaCn0Y6b42iTYq0Cwpm6AILCzVFQZdDQrAYASzH+r7GnTyUhkSECyS2W7Z8+piC6e9lQDnJD3hY729xCndSptZNLRDou6V5rwH7PZt+cu915NPDcET/jXFuYv0hXn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(11063799006)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFJWFp4SnFBSGpNcXBjdGM5c2gxdEZiV3d4ck9qdGxBY2NnTjdDaG85M1ds?=
 =?utf-8?B?cmdQNGpUZ3JJMjhBNThnVGU3cUhUQ3JtMnBndW94R2trT0U5bGJmWFRnb2gr?=
 =?utf-8?B?ZXhOUmZJRmZ1N0ZQL2lJS1ZsNWhwdm1hbVlUSmZ4NUlnTXlUQ2g2WE9LWHdL?=
 =?utf-8?B?TFdFQnAyMlh5dUxKZ1ZLd2luWlRmNFBGd2p1UXJ0c1BSWVBlQXNTYXhUemM5?=
 =?utf-8?B?clZNSlJNRDl3MHMwbVhod2hNRm1LeGF1Ykpma1V2bC9Rd29LcVp4Nk15eUdG?=
 =?utf-8?B?S1lidGt4MCs3QzE2VncwRndpa0FNSGJYcHM4ZUZWKzYzN2pxYnEvbStsc3R5?=
 =?utf-8?B?dmlINk5CVUx2eXVlVUdURVEzVG5OclVLaWlQRVBoV0ptN1ljZFFtNlB6Q1dp?=
 =?utf-8?B?NldwQmtpcm1MQVVRVkhzeEZCZFhESUtTTUVOMFRhM3FvVFg1ZHpyR1RUTkZB?=
 =?utf-8?B?bWk4QmYwQ2VPcG05ZEhER29CZGlTWGlBM1lKQVlVbFdVN0RqQmRRWmZJS0dn?=
 =?utf-8?B?OFRDMFN5U2NFZDkzOWxBaXN4VkhkUS9nbThIdk1nWUZiaEQ5UGxIVjNzWG9Q?=
 =?utf-8?B?OGZkcXh6UFgxVE9kNnp2enorV1o1RmQyZnV1VlRFVFBqellKYnBIVXpPSjZw?=
 =?utf-8?B?OXdvQllZRlBmYXRrcVRSd1VHTVRsNUQ1TTh1VElpbys1OG14VHp6OTZsdjYv?=
 =?utf-8?B?K1V1ZlhXZnVEK2o1dmRMSjVQcTQ3Z0oxTDZFMjZkU0JpMzk3YlBvUGJCQWxt?=
 =?utf-8?B?LytIeVhXZ2o5K3pDS2JYbVZxWko2c0NnRDg1R3pRRHRMeFJLR05CYkt0Sjh2?=
 =?utf-8?B?Q3hNRjJqbG8rSThsNjJmdlJUd0F6VkE1TWxwRUZZWUZkaG0zL05WMFlnL0Q2?=
 =?utf-8?B?WWZOZHYxRjZLNVdxdFpyaFljWlpNTWhCV0U1dlFTbjNYMnZ2UUJLS1p0Ujd6?=
 =?utf-8?B?ZHBUN0tYaS9lNEZmMzliN1d0VDExSmZxTGtScWpuMDBtOTdDc2h5cDhhZ2h6?=
 =?utf-8?B?RWFuZTlCYmZLV2lXMmNjZENzeS9Tc0FBQmFMMTBjV1RXTzVvMEVNOGVZWVVx?=
 =?utf-8?B?WjFsNUNoK1hUenZrRVk0bXNmRWRPclpYZnhxTlNzMWFMRXkrdXY1RVdxamlt?=
 =?utf-8?B?cW54M3J2cUR6SDVUWlhPMkU0TVpySVR6QTVuSEpRdEgxTzBjQkZGTTJLUzBo?=
 =?utf-8?B?Y2pnaU56dHZDV1B1R2E1RklHMWN1TVdMblNsckxqaXRoMTE3UnFQRU5YMzhy?=
 =?utf-8?B?OWRPUlIyVFlXcVp5bjNNR0FPUFVjdTlDbkM1ZXloeVRmakhLSkZLajdjSEk1?=
 =?utf-8?B?MmVaTnNuNTRFenFFUVc3VDh0RjBhNlJjRVM3ckEwWXphdG1UcGhZRy9VZ1k3?=
 =?utf-8?B?MHVNanp1MmN3VUpEeWlrWG04TGxCQTlZblY5Y1dKVjV5eDNva2VPclBzemN5?=
 =?utf-8?B?UGo2cyt2MUNxZi9wcW5YYnZ2Y0pjVnp4c2Y1Y3lsMXUrU0h6SUxrQklscW5n?=
 =?utf-8?B?TjhONVduTEZlTkZIUzFvRFBlL3lPaU1oenRHSjlYdFFST3BmckJ0dDROQVE0?=
 =?utf-8?B?SXdxQXJoMzNrZ1RyYkdrTGpwbzg0TWx0bHRteFNnYTdQZWV2YnQrRHRQR2t2?=
 =?utf-8?B?YmtkV2dKaFhZODNxcXhOdjIyKzFyeWhtUGF1S0w2STFFaDZ1a0txZGx1eS9y?=
 =?utf-8?B?MUVHMzVRVVh5cnRNQ0RRZzBGd3JCeWpud1FHMFRUWjFvdEdjeng2T1VYZTJC?=
 =?utf-8?B?MklXRGlIRWxwZ0dkV2IxYjdPUzRpcmsvL0RIVmZ6YTUvVXhqYzNHN0JPZ3dO?=
 =?utf-8?B?WG1kRVo4TWpkQytReHhtZitVa2p1ZmRhSW5vZDh5Zll4V0NsMm94SHF2REIy?=
 =?utf-8?B?TnkvS0YyMXRkSFowVUNzOTFaQUJyRXdVMWQxTlBWVkRmMU1GdVZja01GY3RO?=
 =?utf-8?B?S21UWHNQSnhCYmVkVXRtS3d6RFYzbnhLVko2Y0dDeVBtK2JNNFVjTytGWldz?=
 =?utf-8?B?c0RKQzN0eklXb04rZ2E1V010SVFJM0pIVHQ1Tm93TFBOQ0pMVnF4cDdmVG1l?=
 =?utf-8?B?anBGVnoyV3BFelZFRG1VamNlMHorQzF4WEpPUk80Um5yRWxXaStZbEcwMXI3?=
 =?utf-8?B?aG9xNmNFT2Q4dVFaQS9SWlNRMzV5MDBEUE9VR0ZOWjF3MUhYVWxpaDM1VVFj?=
 =?utf-8?B?MVVVWld6S0RETUNjdEZVUFZBOTcwUDhNLzFRanNsaWVuSUtvc0Y4Z3d5bFpW?=
 =?utf-8?B?dFpxcEIxbW4zdGtldTArRjlDdHJsTkNOcHZURTE4dU9IbWFOS3Z1WFhCMlN1?=
 =?utf-8?B?RjVJZUxORFR0WXBvRDRUK21xb0wyNElvSEpYeHJuVFR0Y1hBSzduUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72ca09a-557d-40cb-2491-08dec1e16bf1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:31:46.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MRTaR5Gn96au7EmCQ8AHdEHuffTI/trfTNYDmysOSbY29c2YDku6VTk88fVTH04DQC7I1DfvU999vCobhxE1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8006
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 6/2/2026 2:41 PM, Ray Wu wrote:
> [Why]
> On AMD, cursor updates can occasionally be delayed when Panel
> Replay is active, causing intermittent timeouts in the cursor
> legacy subtests.
>
> [How]
> Call igt_amd_disallow_replay_on_all_edp() in the setup fixture to
> disable Panel Replay entry on any eDP that currently has it
> enabled, and restore it in the teardown fixture.
>
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>   tests/kms_cursor_legacy.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 4d597af79..62339855e 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -35,6 +35,7 @@
>   
>   #include "i915/gem.h"
>   #include "igt.h"
> +#include "igt_amd.h"
>   #include "igt_psr.h"
>   #include "igt_rand.h"
>   #include "igt_stats.h"
> @@ -1875,6 +1876,7 @@ int igt_main()
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>   	igt_display_t display = { .drm_fd = -1 };
>   	bool intel_psr2_restore = false;
> +	bool amd_replay_restore = false;
>   	int i;
>   	const char *modes[flip_test_last+1] = {
>   		"legacy",
> @@ -1898,6 +1900,14 @@ int igt_main()
>   		 */
>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>   
> +		/*
> +		 * On AMD, when Panel Replay is enabled the HW cannot guarantee
> +		 * that all required cursor updates land within a single vblank,
> +		 * so disable Panel Replay (if any eDP output has it on) for the
> +		 * duration of this test and restore it on teardown.
> +		 */
> +		amd_replay_restore = igt_amd_disallow_replay_on_all_edp(display.drm_fd, &display, true);
> +
>   		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   		update_debug_mask_if_ci(debug_mask_if_ci);
>   	}
> @@ -2128,6 +2138,8 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> +		if (amd_replay_restore)
> +			igt_amd_disallow_replay_on_all_edp(display.drm_fd, &display, false);
>   		if (intel_psr2_restore)
>   			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
>   		igt_display_fini(&display);
