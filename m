Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8BDC5CFCF
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 16:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90AF10E50A;
	Thu, 13 Aug 2026 16:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3kb4Fc4Y";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013025.outbound.protection.outlook.com
 [40.93.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360B10F425
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 16:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnPM+OpBEPbWB4BcYrH9w74wyAB6OK2r8DGExUkudsE+k1UWZIlQVLBCwMf8xMgjkDUiVsHcY5fwjdzN0cdNHoxt4QG1SB6ocLcn1eAXJc0GmS69M7jEz1ljN7wYHvidldLnWA3rHnm0SUQdyJexrlSyhy7aElYG+OPbU5CkFsAIYcMqxstFag34pz5R0e/+AD9Es9kSCxsXHajOi1Sua4mfYG8ypgtK54/BDtRo/Zap+FlvARWWNnR7At1W5Tz+facobqakK48Y2a86CMZskeMbpCXFx+aJY0ApxlAs+vVg9Ksag8DxgDxgWAlu45uZTopiDjMC7ZrhoIjV43sXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vGMxL8+s9EmwuJKVyeNrN1VasSLbxGJsfqP1JwpFyk=;
 b=hvScpJh4cxfpsDupqemCvzsvhn9AlLMaMIk4pd4aNrpkktmWwqRBjIBdKFMpl7qFX+tykCpRXNu+luDr6p9u8bvtRo9Gn3cwdHfTlKungdxwX9z2T+ybgblvvNNdNc02SH2xXkzjNp9HAzvQOEkYerna4TjdL/GQPvlU/qNAEP/8Ol3Ouz0suseutm/d6+LoZvpQE0q9Mkj9Shqw3k2T6FDydJIRhuWHSlKZyW94pZFPQLYiKfep1j+AdhBqbIrulEQi6NzGIVtiIjgo/zJ2HdlmYKrteHVAg2BSKPsNPmQOzOJpy7y6V1SOZ8lMCoZVuAYVCIeSTUzTvGU68SPGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vGMxL8+s9EmwuJKVyeNrN1VasSLbxGJsfqP1JwpFyk=;
 b=3kb4Fc4YhRDSd+URFz+V5eatKOJxAAH7wvomFkix4wz8pXPoDkI2Bt/iM8CpsTPnF/k8nAcy6bDFDeOyt5nGgNg9Sk9ezNI+reWEZosuFNm+7owrGEvZq66/drc5pukHDX5xBWwoPGRnX7+rnUmeAIEllf5kZBevCXn8AfGIhlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 13 Aug
 2026 16:30:30 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:30:30 +0000
Content-Type: multipart/alternative;
 boundary="------------As89iYaG9vjSV83o9SGDqasb"
Message-ID: <1b077dbd-99ce-4b48-92d4-dbe6d2eeb138@amd.com>
Date: Thu, 13 Aug 2026 12:30:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add platform filtering framework for IGT tests
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, pawel.sikora@intel.com,
 jani.nikula@linux.intel.com, jesse.zhang@amd.com
References: <20260805202856.147163-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260805202856.147163-1-vitaly.prosyak@amd.com>
X-ClientProxiedBy: YT4PR01CA0244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::17) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: 89faab5b-b41a-4e74-d5be-08def9583057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: RvAuvkne40RUIMRWRDuKxWIIdtc3viASJDkxQzzT4jBnSi9n8MvStrL7mMm7NttD0S6RpCkBAk6fDBeacPA16gm0Wnrx1os7W9MizhNlEE2YoE0vcNzbEbbi36mTevp7b1clECuASM3+v47mavcO3MNabORymdQMVXKxILm1zaqCud6L6Z313u4cJusdpAChn06oAXj2wMUMM1I/tZG5n03tNFZwBNJKAXp3ThetJkTHP41hiuTk/yg0d91TTPDCXEeZooAO8vOyNKvqEl2Hr2BDxV9FnitHXwlhN4KRdQp7P05ufB/TU9k3ciZAKuT6TH1Y22EDCptQ4bCSBn6GRjMIla8soYoNFaVpmwdNoqcJkZPVukV13bFc8s/WxaMzWXYktgVCkCcd0Zz9ScBxYJ+zXpEuFejEW5/bISHxj2lt6S5o+JX11ZCQn9IZrud+PIwmWHfOKDukTGe6XSpDgnPJ7WQw+0Q/DHRIWM6qtrhkQcBLkAZxhkQxEUA2QPy31wsb72nJfEzJJT8ipgliskMoLdTrRcpgxE/yMX3UbqUlF8D5dxfbEXHEs6e/BxkNX8iW1wlDUSz/7h32T3/yZoiJ4OreVgGQBZpq3mHT4FvY2Tr9aHw69TImp6HntsQn7xnVABMhBhwmMHXHON/K88Yk2sUkDQYz7I56wWTc0Sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHMvdlN1alZ4R01nL051Q1lrQjREQStWU25ibEtVT2ZJb3VkQnFNNXRyVzFR?=
 =?utf-8?B?NTFEc29xWGM2Zi84UUhvRnZXbkhHaVQwMkdqUVg5SVN4L1BLUCtvZEpMbVNG?=
 =?utf-8?B?SG5LaDdQLzlzRG43c04zWW9aRXBqR1l4ZHpGWHB4blo5VlFWaSs5aHl2enQy?=
 =?utf-8?B?S1dKNWFESVNVZEtvd3FmUklpK1ZpcUhXeWx3aVFwM2RZK1lybVRPU29nZUVC?=
 =?utf-8?B?bEpNdXFiSnRpbXdnLzBkU2ttYnJVeXFpV0RaS1BSeTBXaXYya091b3RiZzFu?=
 =?utf-8?B?cTVLVGhhOW1DWE1KbGJqeFd2dUtEdnpOR0krM0lES2Jua25qdGMxdTN6NFZY?=
 =?utf-8?B?T3pSbHhMcUEyaGNQaXpkeDFvbitkeS81ZkowcUJmZ2I2eG5EMkhwektCZFNo?=
 =?utf-8?B?UVFVKzNrTkw0RFZVVEdkWlRPQm9GSG9rTnJERS82R24rUTRhOVN0Z2RxcE1t?=
 =?utf-8?B?T3JWK1dqQ3JIK3FITG5mckRnZU5UNFQzRW0ycnNkVGhiM2Q3cmNQak0rOFpy?=
 =?utf-8?B?b3ZidzR5N3k5SVBzVSs0Mi8rMWxIMnBSU0FzZW1OVTRGcGNFVjNBUG1hQmRY?=
 =?utf-8?B?WDJGdU5XRHBDaG9zZFU0L2NCdlZ5TnpHZE1Lbm1FNjQ5VDI1MEIyakZrVzZH?=
 =?utf-8?B?MHMzR0RmNVlKNmoyS3F3Snd2UktiQTR0UW1DMzlGQTZNTXZxck5RQ1RHbTQ3?=
 =?utf-8?B?YUhXS3RnSktoOVRkQjJya2J6blcyaFJma1p3ZCthL3k1WkpBVTZhdmY5Q0tZ?=
 =?utf-8?B?VjZzQmZxV0NjZE5GbDFMMTVPWUhJTnFxOFBsQ2JzV2F0OGwvMXMwb04ySndY?=
 =?utf-8?B?WStHcXpNQXN0eFJ0YzloOU83VVEvdVpzMWJzK3VZRjcrWU9UQzJSclYraHAv?=
 =?utf-8?B?ZjBMVldRMjZGeHc5bDFETGdZVUtEcGc2UlFVWWplWGk4Ymc1TDh0cUZYTWNE?=
 =?utf-8?B?ZVpzT1d0TXFnL1FVRnFlYkFIUStSRzFETEplOG9vSzIxS0NFRC9udklMOXFS?=
 =?utf-8?B?SnQ5WTBBUS9MM2RlcGFNMkQxdWltMDNHSlYyRU1vTitJNWZPejBmZmRqYXVr?=
 =?utf-8?B?M2IvblQ1UmVWUUpKWTdwYkRJbng2ZmJndnF6MHp1Qms2VnZTTjhqMTgzN3J4?=
 =?utf-8?B?TG5JVFFEb2FiZXJEZXRYaDhIQmd3V1k3TTVGKzNWNVVwRWRQNnpTMW9lamUw?=
 =?utf-8?B?YlByczFsbU1MalFEc28rZ2dzdW9iU0RrTWFpaDBFZ01HOGFGc0NVdnVuaUlQ?=
 =?utf-8?B?aFRHRFNiaS9MczZ3RVBtN09uakYvMWNLQ0FxbjV1blEyVVF6aFQrQTQ1OW55?=
 =?utf-8?B?bjBPd1hmV0xqY3A2N0NJYWYvdldhUmxoUllpUWIxTEY5M2QyK0dJZ3IyZStV?=
 =?utf-8?B?U3BIYXhzcEIyR3d4ZGtVUlBMQTFrdjMvN0I3V1hRRzhlN251OTZyblY3bThO?=
 =?utf-8?B?K1JQKzFzME9VTkNndVpHKzR5TnpOZXBGbUpuRzJ1SUk3Skg1d20yeU0vV052?=
 =?utf-8?B?d0xTT1BWWXRRVjEyT0VjckFGbUtLbHAyeEdmUlZ2Ty9xdUs5ZGV4QitKWEty?=
 =?utf-8?B?c1Z4MVRIUk1sL2RvMUpmUzZYUkg0YkVabG9lQXVqVUJQaDROUjFwb3VZay9w?=
 =?utf-8?B?ak4xVHZwSVBDdi9kZUhWRnF6STljenFoUVhoMmcvTmVKMlBpZUJxVzlFNjF4?=
 =?utf-8?B?MjU3Wm9pYVJjY1kwNDA3UXRQOGRVZkNsY1ZiUkVqMEo2TWdhS3JjWDJhWG1z?=
 =?utf-8?B?OHJkbEROTnhiOTZlRU1wWE94YzNVRnRlL0hES0NHak5tbENtTU4yY2NLb2g0?=
 =?utf-8?B?bmhjTGhLTFF2cHI4TFB1TVUyYjFYNytYVzBIUVRPOEZGZkh4bUQ3R0MwY01u?=
 =?utf-8?B?aVQ0UFRvUEJIRS9DeWloc0p3aGFnMFFkSXpyZlZmcFVSa0MrU2hFaDAyWUQx?=
 =?utf-8?B?aTRBcDJPREhVaXZENGJqVW9XL0szN1dzYkhpRGRZSXE3dWVnQmdvSWZ2bm50?=
 =?utf-8?B?aDJxdU9tVUs5MUNzRjRDZjNZOWtNbUdLamI5Z0QyMGFBSnRydUtFaUVJeTNz?=
 =?utf-8?B?NE42TmtHejZoNW0wRzJQZ0tsTHJqQnRVL09yWVA0MjRNTnJmbWM1MWMyTStz?=
 =?utf-8?B?NGJaTmZraXFuSm15YUFoWDFpOW9uanVLNjFBZzlZSFd6OU92djdXTjhGeWRF?=
 =?utf-8?B?SWdOUit4a3dBWDlPTTRreG4yaGR1c0VwcFl3ZHd1NlhtKzI1ZWdXVWFDTjBr?=
 =?utf-8?B?ZzJYV3UrbzBIRE1oODAxNmN5VXZkY1dzRUVxWTZLazNVZCswSnhtVEpoYnFv?=
 =?utf-8?B?ZFNpUlhIbVZVb0phelgrN25pR0VnN3JzU1pRZkhjQTFEYVJ0RUNOQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89faab5b-b41a-4e74-d5be-08def9583057
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:30:29.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBZOzA8+8u0vbvAqN2KaOW1tEaLczV3jnVxm1pZfqJoUnyhZ7u4JtPgMRUcca5Zc9DWSz2w1M2fzTJTiD39tsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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

--------------As89iYaG9vjSV83o9SGDqasb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kamil,
I wanted to gently ping this patch thread to see if you've had a chance to look it over. Introducing this filtering feature is quite important for our workflow.
Thanks ,Vitaly


On 2026-08-05 16:28, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> This series introduces a generic platform filtering framework for IGT tests,
> allowing tests to be skipped based on platform characteristics without modifying
> test source code. Three filtering methods are supported with priority ordering:
> built-in rules (highest), config file (recommended), and environment variable
> (lowest).
>
> v5 addresses review feedback from Kamil Konieczny:
> - Replaced emoji with ASCII equivalents in documentation
> - Removed Gerrit Change-Id metadata
> - Restructured commit message per upstream standards
> - Added Pawel Sikora to Cc list
>
> Vitaly Prosyak (4):
>   lib: Add generic platform filtering framework
>   lib/amdgpu: Add AMD platform filtering backend
>   lib/igt_core: Enable automatic platform filtering in subtest execution
>   docs: Update platform filtering documentation per review feedback
>
>  docs/platform_filtering.md | 351 +++++++++++++++++++++++
>  lib/amdgpu/amd_platform.c  | 328 +++++++++++++++++++++
>  lib/amdgpu/amd_platform.h  |  53 ++++
>  lib/igt_core.c             |  18 +-
>  lib/igt_platform_filter.c  | 574 +++++++++++++++++++++++++++++++++++++
>  lib/igt_platform_filter.h  | 124 ++++++++
>  lib/meson.build            |   2 +
>  mkdocs.yml                 |   1 +
>  8 files changed, 1450 insertions(+), 1 deletion(-)
>  create mode 100644 docs/platform_filtering.md
>  create mode 100644 lib/amdgpu/amd_platform.c
>  create mode 100644 lib/amdgpu/amd_platform.h
>  create mode 100644 lib/igt_platform_filter.c
>  create mode 100644 lib/igt_platform_filter.h
>
--------------As89iYaG9vjSV83o9SGDqasb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil,</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I
      wanted to gently ping this patch thread to see if you've had a
      chance to look it over. Introducing this filtering feature is
      quite important for our workflow.</div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAICRAC" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thanks
      ,Vitaly</div>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-08-05 16:28,
      <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260805202856.147163-1-vitaly.prosyak@amd.com">
      <pre wrap="" class="moz-quote-pre">From: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

This series introduces a generic platform filtering framework for IGT tests,
allowing tests to be skipped based on platform characteristics without modifying
test source code. Three filtering methods are supported with priority ordering:
built-in rules (highest), config file (recommended), and environment variable
(lowest).

v5 addresses review feedback from Kamil Konieczny:
- Replaced emoji with ASCII equivalents in documentation
- Removed Gerrit Change-Id metadata
- Restructured commit message per upstream standards
- Added Pawel Sikora to Cc list

Vitaly Prosyak (4):
  lib: Add generic platform filtering framework
  lib/amdgpu: Add AMD platform filtering backend
  lib/igt_core: Enable automatic platform filtering in subtest execution
  docs: Update platform filtering documentation per review feedback

 docs/platform_filtering.md | 351 +++++++++++++++++++++++
 lib/amdgpu/amd_platform.c  | 328 +++++++++++++++++++++
 lib/amdgpu/amd_platform.h  |  53 ++++
 lib/igt_core.c             |  18 +-
 lib/igt_platform_filter.c  | 574 +++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h  | 124 ++++++++
 lib/meson.build            |   2 +
 mkdocs.yml                 |   1 +
 8 files changed, 1450 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform_filtering.md
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

</pre>
    </blockquote>
  </body>
</html>

--------------As89iYaG9vjSV83o9SGDqasb--
