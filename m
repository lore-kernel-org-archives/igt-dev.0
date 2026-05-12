Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC6BCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 15:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6339910E599;
	Tue, 12 May 2026 15:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JEqnoMkv";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FC10EA5B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 15:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whFSMlTYGtQ44bFtUUVb4n/nR3NNdZQ3KHT+pEF8j7V52t7v8QFufL/0FXGaxUVqD9jvF/Yie71Jv2boF2Ujb6l1Fku6E+T/Ym4R7ALktvPvGeNT8U/UG6GZ0fYUmVD3POVvzBozXORtyjisua3w5f6NizguW9MPdnMqYLSMhfZZTMvAMIeVCPwRzYgnv2PN/fDBZEPB57N/yKWj8qRGagSAH6FUlxlEZEmiPkCbz+3zE/EfSiYbZDBLsunspFukPXBrgYGwUVySzDmN7plOLePVWzZMBLWvNiXt0782tg1t+v5yzaJ3PBG9f0j6HrcflE63jNqx+BwQqkplQFA+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Jbe03Vxon4oQbPsD+1qZJ1y82PXxNJ4Okd2OGhdEig=;
 b=aCbhsZS/OxY0D9MNw+Ua6aubJuJMQl8YJN1CeJ9M0+853w2jQK0jXFbPJgJwEXqfA8CDMahEzCDh/S0nzqh8Nwk7d1fDw6NBUjujsYzkUOymhPRozLbt7QkvKjZKvzpWIIgkC4D7LFPOPtxoZghRjL8PpL4G/f14hGbHB9wj+68qc3vtpEFOC7uBrGQYyNLaJhCbX/EL+7puBT+69YrpWgwftTMfX0ptMjI2SAJnF4eb/zAPSs+M3R6EM4k115ast+0FYwcIKbSMnv/xEALPqfnYRAc1Soy8Pyzga4eBFEysqRHuBy/CWj5jFwET1/oHSknwxj8sB68fCXHt431ABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jbe03Vxon4oQbPsD+1qZJ1y82PXxNJ4Okd2OGhdEig=;
 b=JEqnoMkvOBex/0lT8swxB4s61L36WAOVJCNZ9pOjwYmSUNQB52RvRmB6ouSmshXcFcNT33sbvsRp6Vf3i81i7thl7p8EOvc5qBHqQtAAh7TyN7rmeIbC65yOiHxeJtqG2f/kU6npvXz/4lywJi9Qfay5KoNrEAg1oFBfB6I7yJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA3PR12MB7829.namprd12.prod.outlook.com (2603:10b6:806:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:31:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 15:31:33 +0000
Message-ID: <e56ff7b0-85e5-4edc-b7af-1a14fc82a412@amd.com>
Date: Tue, 12 May 2026 09:31:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu/amd_replay: fix operator
 precedence and typos
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com, chiahsuan.chung@amd.com
References: <20260512080213.3457271-1-ray.wu@amd.com>
 <20260512080213.3457271-2-ray.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260512080213.3457271-2-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA3PR12MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: f76d49b5-6580-4912-dee8-08deb03b8bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: een1dvoT38dKzvfC6nVAq4XsDBnHZFVcvfAtWIsajvl9xdW2YwpFwTGFAMF8y4SoG83JjyaidJpvN3n5Rm9163OEKR+/DGwhg/YoiyH1Ylbkr+4yxRYmSTCDKkACCb2P6Dip5KXRkaXKwzHtR5BrSNaOz9jCW/L+2oLaLUR81voThuXY6SjqAN+m6MSgPnfhE2aYe4JurfL2KOqUQmFz7m1FkGyfT3OX9lVL0OYYEpMe6dCefsxPYctdBqxXxq+oGEmMT7cL1rFfSXOj4WWhePdOyVRiT1RCRzgOy8r4ZOH7XqmemW7hI2uEjbB6PckoAEy8vtwIRW5/TH+M197WykHfSZNm9Cn0XH51TLSOSH0MBd03qoIgQmX6Cy7QGwav2ZXwcTff6RhwiKWMoOcbaoSFO+c61xv++POg2tQSHHS0NBdJG4es9M603nIiMUkfGUeNW329D1WSKLwvPEMj4wjeWOEMW/BMAeMxkRxbV2BCPAPQtoZzXRg9WIx3w+2phlel/WmjKFw9moNkg1UlAmQKNTf2J5AYM7Eo2G/z7YVulIu9u3vr6uwFaBvimxqPqjCU3sfJ+2252yLB/FJDx9DdqdD/4GPk6Huil4unUvDIk+cSbUKnfSK3mEsYaosx1HelQIQllOEqXKG6V4xV48qKPoEh0WDEfCe+PEjXdQzNHje9UkBGXT8n+fDS8ZR/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXA4a3Zlc2Z5VTRZNGpRRklUbkRyeGJFMEp2MWNWOXdjKzZIUk9QWXcvUUlQ?=
 =?utf-8?B?TVN5S0kva3p3UVJialJzV3RzVnpRWWY1dWh0TUN1OGptVzkxeWVBMVI1UzlP?=
 =?utf-8?B?cEp1VGgxSkdKNlE3SVdha05MWjM4TXY4eU9NRDJ1NWdzaTUwWWRuUkVpcGp0?=
 =?utf-8?B?Wlc0MUZ3Q013QVZMQllYaEFBY1RLRlpnbnhQUTMrRDlmNXExMW5zNmRkcUFH?=
 =?utf-8?B?MmRRVU1mSzlXRGdlOVBRS2lCZlBBMHNpUmU1aExFRGxZWmlCOFhTTVRtSlAx?=
 =?utf-8?B?eUw3YVgxYnRCSDI4RmgwWFBNckJNMlRYSFpsMXVuQ05GWlcyTDFBZHVGTUVx?=
 =?utf-8?B?VEJGdml6Wnc3RENYVWhpaXpmd0YvcFlidmg2M1V0RnRFQ3R6WFRhVVRZN1Fw?=
 =?utf-8?B?RHNYRVNKcG5rUkhhQWR4bVlZSFdwVjZ2SWRKWXhSaGcycEZBSXBhREcwSWFX?=
 =?utf-8?B?S3c3b3BLQjlnUzZiNDNkRmNoM3VTNmJIU1FGWDFVUks0L0lObHpLOHUxN3NP?=
 =?utf-8?B?Q0p0YnZPM2MrT09LSldBZVI2SlVzSDdCTTFncS84cEg0QW8zc3p2aThwdk1v?=
 =?utf-8?B?dmhwNUlXdjRsanFablg0RThzT1A2TGRadjVhSG9JWXNpU1RaL1hHUnNTa3BG?=
 =?utf-8?B?dk9lQ2VtM0VwZUxRaUhLV3NQZnBnc3Y2QTJkc1U5WldtL0RnMlNGejIwSnVI?=
 =?utf-8?B?T3VleDhhTVVlRm1qMkE2WDdGUDRhMXRRdnpjRHN5S3Y0WjI2Y252NkF0Wk54?=
 =?utf-8?B?UkxVeTRpalI2ZkRhRDJkM3EzRWlLNXpzbHgrYVI1UXdSajJBNnR0dTRMZDIy?=
 =?utf-8?B?V1lMcVI0d0cxMDIwK2o2M1BWS0w0bU9KR1A5REJrb2gwR1hzRTZLSWxIeFF5?=
 =?utf-8?B?MTJBaUZPZktmb2VzSStoTk1EU0N4Um9QcnVIR1gxaXZzMWFoOU5ZVmk4V0Zn?=
 =?utf-8?B?aG5ubUowUEwyRGE3Z1NnNE0wOGdicmh4NTNoZjdwczFJWWtmbVk4M1BTYUgx?=
 =?utf-8?B?ZEp4SnNwTDVkKzlwcXNlZFhYamR3dXdWZWlmSldNMWxRcGplOW5IM2tyNXZO?=
 =?utf-8?B?OXB3MEFUdXZSa3dYbVNRSnoyWXQ5UENnd3dmS2VKTFl3eFduNGtzcGwzdm9P?=
 =?utf-8?B?WkZKOXJlQXBib01heXZqdGZiMFFMVlpwRk1SVi9HUVlQVmpBZ2tsaTA4Wllu?=
 =?utf-8?B?eUZVdTBrM2V5VzNRYWZFbmVCakllcTJsMGNuUk01aC9KTVJoWmpUNzRubXB6?=
 =?utf-8?B?RVZjaGo5NmJPMGpsakVwdXo0NHJ1a2ZiRTA1NnEyS1c4VUNicHhRNjBEMjlz?=
 =?utf-8?B?SVllT09UL3JQTnMvZnBrOVZEaUl3bGRacmgrTktmYlZxS3ZxNWp5dWdvRzEv?=
 =?utf-8?B?K2IvK3k3MFg1clNpcUhyS3dyd0pOeVJjQUdwd2ZxVk5vKy9LK29WVUZGZW1v?=
 =?utf-8?B?NlZnN2ZGRnpYVEhiZFptUC9DVFY0NE10U29xRU1kRVg0SmhDSythaGo4YTdv?=
 =?utf-8?B?TThsRlVaN3NOdkQyUTYrS1JjSlRxWFFTNGlnbTM5R3RpYVBGVkhScmUxRTY3?=
 =?utf-8?B?K1RmamtrQVJqd0dmVFlnSnFKd3k5dmlCZlUxMXZ1ZXhBYXlhMytkRS9HWjMy?=
 =?utf-8?B?cjZZUzUxdDhad3BkNnEzY2RsMnBNRnh2ckFpUUhOdXBIMlNEOXNjLy9NMUVT?=
 =?utf-8?B?ZTA0bmJpNUVjaFUvMzBDN2ovZHBJZmZmU25QWHJJMERYTWxYR211aHV2aENs?=
 =?utf-8?B?ODhUQXJtbGNmaXJVRkZPWVYxeStVVkhFSUxZZmRTNi9pR1lwcjB0cFo4Skxj?=
 =?utf-8?B?dWZtb0JuRk9sUVh4YTlEZjJrbjBuWGY2aEZlbDhCMUVBVkdmQjNSQjZDbkNt?=
 =?utf-8?B?eHhwbmIzT3FyWmp4K2tZdDR2LzFtZ01oZklmdXdCbFVuUHNsY21ETnVJeWNs?=
 =?utf-8?B?TkhkYTlSL2NNbDZsRE4ydDd3ZXBnVnlDVHYvRmJWTHhINGlLRGlwdENSaVhI?=
 =?utf-8?B?ZGdEelo3ek41MVp1OVRFNElQQzZ0MnZYZUR5WjdpZHZReWhhcTVmNkVZZ3Rs?=
 =?utf-8?B?UC83R256RUc3WHV4THFMRERpVDYvWG90a0JCRmJvTmNvQWdmcytJYzd5Tk1w?=
 =?utf-8?B?NUVNRGYrMkxGYlV5TVZVSmRtelhndVlYZG5nS2NwMTh5YitrYlREVW9BdzBq?=
 =?utf-8?B?ZWg4RmdmdXhhaWdkUmxid212aitLS1MyU01WTCttUG0yV2wwdzlwK3ZCNlR3?=
 =?utf-8?B?UjcxeTh1ZTVQQ0I3aWpoeDloR3JnYTl6SEtyZ0FLQlFOY0l5M1R6YStQeVF2?=
 =?utf-8?B?L0psaXkyQjAxa0dZc1djRzZKRy83Y1I1R1Nmc2oxblFPL3VjK0hIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76d49b5-6580-4912-dee8-08deb03b8bdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:31:33.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSN2095WzAehQ26vh8uXxyrjkrx+2p7LvQVUwQyQ3C6ptMvyT48d/RTmoIyG+ZIw6GP05qQ1nR4u/ViHmo492Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7829
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

Reviewed-by: Alex Hung <alex.hung@amd.com>


On 5/12/26 01:59, Ray Wu wrote:
> [Why]
> Several existing replay subtests had logic bugs that silently disabled
> their state checks:
> 
>    - `test_mode == (A || B)` and `test_mode == A || B` do not check
>      whether test_mode matches A or B; both evaluate to a constant
>      truthy expression, so the guarded code always ran.
>    - Three igt_fail_on_f() range checks were written as
>      `state < N && state >= N+1`, which can never be true; the
>      assertions never fired regardless of replay_state.
> 
> Two "mdoe" typos in igt_describe() strings were also present.
> 
> [How]
>    - Rewrite the conditionals as `(test_mode == A) || (test_mode == B)`.
>    - Replace `&&` with `||` in the three range assertions so they fail
>      when state is outside the expected range.
>    - Fix the two typos.
> 
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>   tests/amdgpu/amd_replay.c | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 775bed190..4b795f5ba 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -236,14 +236,17 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
>   		igt_require(ret == 0);
>   		kmstest_wait_for_pageflip(data->fd);
>   
> -		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> -				&& frame_count > 5) {
> +		if ((test_mode == TEST_MODE_CONSTANT_LIVE ||
> +		     test_mode == TEST_MODE_INTERMITTENT_LIVE) &&
> +		    frame_count > 5) {
>   			/* Panel Replay state needs few frame to enter the live mode */
>   			replay_state = igt_amd_read_replay_state(data->fd, output->name);
>   			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>   			igt_debug("replay_state live mode = 0x%X\n", replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> -					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +			igt_fail_on_f(replay_state < REPLAY_STATE_4 ||
> +				      replay_state >= REPLAY_STATE_5,
> +				      "State should be REPLAY_STATE_4 "
> +				      "(Active with single frame update)\n");
>   			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
>   		}
>   
> @@ -302,15 +305,17 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>   		page_flip_test(data, output, test_mode, 20);
>   
>   		/* Check Panel Replay state in static screen */
> -		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +		if (test_mode == TEST_MODE_STATIC_SCREEN ||
> +		    test_mode == TEST_MODE_INTERMITTENT_LIVE) {
>   			/* Panel Replay state takes some time to settle its value on static screen */
>   			sleep(1);
>   
>   			replay_state = igt_amd_read_replay_state(data->fd, output->name);
>   			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>   			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> -				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 ||
> +				      replay_state >= REPLAY_STATE_4,
> +				      "State should be REPLAY_STATE_3 (Active)\n");
>   			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
>   		}
>   
> @@ -325,8 +330,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>   			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>   			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
>   				 replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> -				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 ||
> +				      replay_state >= REPLAY_STATE_4,
> +				      "State should be REPLAY_STATE_3 (Active)\n");
>   			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
>   		}
>   
> @@ -439,10 +445,10 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Test whether Panel Replay can be enabled with static screen");
>   	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
>   
> -	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mode");
>   	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
>   
> -	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mode");
>   	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
>   
>   	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");

