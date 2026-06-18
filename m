Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AAECD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 17:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FAF10EE37;
	Thu, 18 Jun 2026 17:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OdcWsDME";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012037.outbound.protection.outlook.com
 [40.93.195.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDCC10EE37
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 17:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ajr+pzEUf/4gSYPyBa25vpdRnNMPrGMMtzo4GZD8jpkraRs9fdUKizvzpy95gnrQ7rIZQG5d8GyDx7jx/JV/8wyZtsslwujnpjotr2a1qcTmHojwI2VgaIOdu6S+5p4cINBG087AMBaV12ns+x9BRjSB/uOtgpNxLtrc69PcL/TiNMvwa4vVANh97AHzRK1zK7g8P4Muexwqgxd9mkrX3dawzWkCxnTtBaMUstIqLA7NdaBECoZBMnR+DfVZG2/akOlHR06/tkDCmLy0dLFBl3DowhLJC5OSUpxaVgILLqOx1BEZFBndpt4ckRRmzBy6abv4ivP1IKcGpMaIwCv7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTToSVKCOWI5Gy0VjFuoVMLW/EIMoxs5Zdq5xeggGa0=;
 b=e4Qwxs00/6e55gVG7TLNp1hTfhHt71/pmLOFPgxbLG8j3NyVZnq/rMgm8vVpqOahNMy10E0CqA26R/0Y5Z171ogwSkHx0WOZfFuTqDJmHirtKz9bVSCeQvm/H6ncPVipCQ8mGtYNA+Uc8ntxlvffZJc4s+uMrMaNjcn4Dy4fIWCndKG2wH5/mTOouc0tLbVj3pleuaSlWZFFfhvohqLyuoYCfvWIk8PminXfAfOioEwps/4HoYVIQHxkn3sTBBBeKw+YfFCF87PPo2zEmDGbPNbUrXx/VM9k3bEhlOV/BxHh6ynbwG2UF02ldDQMuEg5FUj9bsTN/9xHav7WZoCemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTToSVKCOWI5Gy0VjFuoVMLW/EIMoxs5Zdq5xeggGa0=;
 b=OdcWsDMExDItlPR3c12Jp3tuzuaihHejL4Tb7wbqOD7Wv0gZPS3rd9fbi7N1pGSzL5R5jWfGoiMa3Dt1qgjx7CoF5ZFGjASLWwrdnwr81V3gw84eGvP7sYMmJSxN+/OCk1u6gs5GRBQr1vB+vBikumMfiwHNd3YGJisoXGqhnlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Thu, 18 Jun
 2026 17:47:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:47:44 +0000
Message-ID: <5733344c-9f5f-412a-9efb-040b7f7f10b0@amd.com>
Date: Thu, 18 Jun 2026 11:47:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tests/amdgpu: Fix for HDMI Compliance Automation
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, Christian.Koenig@amd.com
Cc: Mark Broadworth <Mark.Broadworth@amd.com>
References: <20260617192449.4166-1-Jerry.Zuo@amd.com>
 <20260617192449.4166-2-Jerry.Zuo@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260617192449.4166-2-Jerry.Zuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f03d6d-f7b5-4139-5aa2-08decd61b3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Vq8VX5ZlyU4aCGY96JwyvHnF3MHPD2t6wRlEJyEtU3DBi8AMpUEyoHozXWxZ2mdv2EhxfeD+bV07BzWKYtNjyrjPOZI9p+eyPQ2GUvgbqrXHiEU06leRF63InAE2TGX5YMn03VkHyRDBid5W98arz8tzEgLfKI9QzCzUZ2LNQ3qgFR3sEzN4FVasvLJPIF4gFUGWX+cS/1h6jpJagkb4/nBDEIE2S8MjRsZQd9csWBygnzc98qOUIjJyT+JcPrSXTxddN8wSpO500cgcsjrzLxdE7gi54oTQHzJD4DobIHE69LSDh/1Z1qVSYbc4Zq6JZN+pAUfnDcEh5966enKuKyJvrY01R8rxGX04J+HYN5gzblVIKdsxEw95rR24grKEtWxp0MSp3/ehgmKREKFY1+/2IVFWDJ4eDHEWVH2LSuMeggwXGy2MgTwJJOAGBtPSYWf7/BtwCunyh2KjA0WKC/xGqAW2WAJm8cftcKdW0M8yH8JAl46+PGVvwLch1IvaXyhl7dPzN/+AaOs901MMqmnCpXE4og3SuAem4EPxJt3vcoEvYqCmP6eWp0JSipqybzJyqj2yvUTQLmTOoZquRJDTmYItDCR+SPsEOkgGohGmarZT+w9NERazhwoMNkleTuykJb/+BD9o4uFaDpQ+f3hiYgdhVw7c9FvHu4hX940zRlegdy1LjaZnxcYQFbla
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdva1V1bHpRNm1FcjNuR3daVkxNNDlra0pNZk01c2w1MVI4d2dmWFN3MW9T?=
 =?utf-8?B?TkhHcko4VTJDOFlqT3prNXhlQzdmc3Vzd29VME1iWEtBTFExVjg2Y3J5RkNz?=
 =?utf-8?B?eHhPV2VkbDBwWElIbEJSV2F5eUhBKzlIMTROaGZUTk11djY0K2RWVmhlcXl2?=
 =?utf-8?B?TjZuM1p1YUZqZStPekFKaFJSQXdGU2lQMllNYTUyTE00V296TkpSTGtSVHRm?=
 =?utf-8?B?ZVEwRnJQRzBVdEprRnN3SE53ZzdRNHlJakJiK3NLR1NyemQwWjdBR05aRFpF?=
 =?utf-8?B?aHk3c3dwV2JLak9LYkFEakhlbUVKTlhsaTA0ck1WQWJLWVloUm5US3BOOEps?=
 =?utf-8?B?TU9Sb0FuTGsxai9KaklqMkFqNDdBUFZ1b3pvWHNucHhtcUNyVEdwY2xHQVE4?=
 =?utf-8?B?N1FyTTlaZFhFeXBhbUVRaTVIUDdWUjg1R2V2RllMVXdHNGJSQ0Z5djRTWWo3?=
 =?utf-8?B?RmhIY0I3N0EvMFVHZGVnemJOa2ozQW5Kd0FnWFUvSG5mN05PZEpZeE5MSjNm?=
 =?utf-8?B?TmJzTkRaa2hhTm5zSysxbHQ2SzQ2ZndDckNZU29yRUppQjl3VjNhQmY5ZEZh?=
 =?utf-8?B?U1VPRDdMRkhtWWFNcFcyZmpjNkIvTFowcXpQMEVqbkNyOGdyb3A5Q0xrVHhq?=
 =?utf-8?B?VFlma3hNRFRScGdZb2l3dWNuUDZJTVFaK29RTDB0cnltVSttN09DSFV1Z2g0?=
 =?utf-8?B?Z3RzRlpqYmdET1h1Qk5CQUFKMXlKb0hDTlFPajJRYlYzRjRCcjBZZ3BodlJT?=
 =?utf-8?B?dFlpU09RTXNHck05a24wSCtPVDhDTFhLWmgvNUN3bXprRGlrYlRaR2kwQldv?=
 =?utf-8?B?eVB2Tms2NVBEVU1kZmcrMk1hc052ZHNhTUkzQURxYk9SWUkwQjQrc1FabzBW?=
 =?utf-8?B?cEhZaGdya1hGQnhMWjg5NkZNdlh1NndzMlk0NHFEVUUwaW1LUEpvM0ZXem1m?=
 =?utf-8?B?eDhQVlpjZFdDdW81QkRaT1lWK2M1MUU5KzlidXhSOTd3aERoZzcreTNxdjVa?=
 =?utf-8?B?LzJHUGFNbTFPeTJacEZEOTR1czhaNlA4anZvZTJuRHQvbjBhY1poVHd0YVE3?=
 =?utf-8?B?M0I0YjFqb1lCU3pBQzFkby9wYlBjQlBHSFp1RjB1eHZRT210R2FLelRxQUhh?=
 =?utf-8?B?cW5zT0JpODBUVXFMY3hyNzYwVzRGUlBjY0xKVGN4MVZnaFdEVGR0M2N3MTFH?=
 =?utf-8?B?emRxaUdmeURUNjQrV3h4VGlqNWYwSm9YdzBTanVQbkRpaXY0WlFyamdDeUJJ?=
 =?utf-8?B?dFhuVUYzbkZNWitVZWpqd0Q5bFU0bmdPYXZGSzNuS1ZERXVnYmZOWWxSTjRv?=
 =?utf-8?B?ckIzY09nSm5rdFR6eE15SUJoTlNpYUt1L1N3Q3p1VUVaWXRDUDQ5TnNqd3lo?=
 =?utf-8?B?dFJrUWFrYUsyNlNud0VSQzZwaVZvcFFEOFBHVzdiYzN1dmRGR1IwSldSd0xw?=
 =?utf-8?B?WWU5Y1RKUmlwRXlka241cjhieS9CV1lVWHNwbUNhU3BYN2NLbW1xQ0hXcmF1?=
 =?utf-8?B?V1JDYWl6c0ZaNSs4dmFSNkZwVHdLOGw2eDNVeUY4WDR3MitGVi9xM0JoR2s2?=
 =?utf-8?B?T3BRTFRjRzBoUUhqeWNESFByU2syTjZtRVZxSzg5ckR3TUJqTGkvQnV1LzVq?=
 =?utf-8?B?a2JSQm5lL2k0WnowU0pxQXhmaWlIa0IyU2tzSk11aUhBZDIyVjhCcHpzRStG?=
 =?utf-8?B?ai8yUUxXYW1xd0MxTEtqY1c4a2x5VmlKSlV0Yy9aTFN4NE5nZWFqeUZkSDRR?=
 =?utf-8?B?d29tZ2pTSzUxUklTUlBvVm1hbkt6VWl2UEZUMjZWRHV6TFlMZWhJUGZBY0F1?=
 =?utf-8?B?TGhBdGV2NCtzNTRvWTM1dTcyWGJUTFROWFJhdWdxM2RPTEw3dGhjZDIwdnB0?=
 =?utf-8?B?d3Nyendmbll2clcrYlE1QTNvZDVmUnRJclRNdkZEMG1vMU9VTjJVMDl1TXVL?=
 =?utf-8?B?ZmNaQk5hdSsyZXo4MTVDZzlaYTRGSHA2TDJ1MzRZaTBCN2I1TDMwNVBvOHQ4?=
 =?utf-8?B?WkUraG9OQXJ1QU9mL1ZabWRPVTRnR2ttWjBWbGQ5VlMyM1Q0K0lDamdjSG10?=
 =?utf-8?B?bU9vOTBNQmtTYTVYU0FTWTV3NExxbndnVDhmemEzUlF3VlIxV0xmMlREUzhn?=
 =?utf-8?B?MytUK1FzY3B4NFErQzlnbUVCY014blBucGFpTW9GQ1NnQWRKdk9IelF0TTlB?=
 =?utf-8?B?Q29HeG1MeGFvR1FJbWxicllYUEp3a1Bqb2hnWDlxTmZFSWFUeVB1SHJySHMy?=
 =?utf-8?B?UG95YjQ1RkRUdy8vM0FJcjVZT093OEhjeXpHNlowK0Q2L2tMVU0zNTNKMEw0?=
 =?utf-8?B?WkEzTVhkVDhJc3dFdzVZa29CanozUWk0T0xMbExEYnJCTnVhdVNJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f03d6d-f7b5-4139-5aa2-08decd61b3de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:47:44.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeYh5V9tj8ETHSD8rtNZoXzinrR4GqJ70CO5g6oGB15B6nuCH+xyObV8CBLR7pNhQx8qcigxk7IOom/B1ALbog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269
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

The subject should be "tools/amd_hdmi_compliance: ..." as it touches
files in tools/ directory

On 6/17/26 13:24, Fangzhi Zuo wrote:
> From: Mark Broadworth <Mark.Broadworth@amd.com>
> 
> It is to fix hand shaking issue between DUT and the box.
> Need to block until SIGNALRM triggered.
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>

Author is Mark, so he should sign off this patch, i.e.,
"Signed-off-by: Mark Broadworth <Mark.Broadworth@amd.com>"

> ---
>   tools/amd_hdmi_compliance.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index dc24430dd..14f455320 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -915,8 +915,12 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
>   	igt_plane_set_fb(data->primary, &afb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> -	igt_info("Press [Enter] to finish\n");
> -	wait_for_keypress();
> +	if (data->timeout_seconds > 0)
> +		pause(); /* block until SIGALRM fires (works when detached) */
> +	else {
> +		igt_info("Press [Enter] to finish\n");
> +		wait_for_keypress();
> +	}
>   
>   	test_fini(data);
>   }

