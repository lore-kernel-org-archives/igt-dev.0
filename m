Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08016C9833F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 12:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A245910E8A1;
	Mon, 28 Sep 2026 12:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK/Ds484";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409310E874
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790599834; x=1822135834;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p87q9YBdKGQU6raXveuFYH580c1aK8H9kL4sv4QeoVg=;
 b=ZK/Ds484M9ds7DV4U/T8OwWXsIWX7ofd/jXy0FGDkDTku/JJ0Jd8TRq1
 X3e0IH6VxfG2Gfc3Mqtk2uVt8cAmvMJRi7cIdvBpwoFz8L15kxeQC5ve7
 0JspkgGVjvd9OUwHeu3zQxjdAkcJHoYqi81i/c2zVq5wpV/rK8R/UQHqx
 UllPxHVFQVO3sUCJjEh53xs6FG2Wm16+F2JC4NEBYqL4xiIIhI4sq2b42
 Gs/O/10422a1hII9QoY17Is1J+urR319n/9imu3TrmTTkGp8AcuUBeuMS
 WX2fE5kelg3BoqZLFJxkhcpjR1sxx2BwsGn6euHd0rqy/AmUBtW6BlbKP g==;
X-CSE-ConnectionGUID: Kc5ETtb0ShOYWGwCIY5dOw==
X-CSE-MsgGUID: wRHiE8SBQV60aL4Y0RgRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102668467"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="102668467"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:50:34 -0700
X-CSE-ConnectionGUID: CLaxWj2lRgmCT0XN6P4sgw==
X-CSE-MsgGUID: O5ecRIByRHeC7SMLAMM9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="312961029"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:50:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:50:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:50:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBwf/hLNNv4ajFxpOoa4+noSdgpFqtlDrSIZ7rvtWk5BVC1TrawEtmNS57DP7mg0ftqj+F8hUT+UccCpGODuHF/Y/YPRl6IiaUqTnk6Yrqenl6eprjbjYyvlsT2BWKiBlIVc+QE+U55rgpMwq7rP7FjZfd2pHrS9daldyF1EuoJ8kG0qjjTCaeqJApRCmXGfYwgzx+DYqbUGi/C0u6l6UHMBDYgdYkRZDS60teIw4I+Mg9pn9CeN72f7Bf5r7fExsA5KWTMvWvPC18S4VS9kV4aCQV9v8TN3B6xe6F0C8/DYDnBlonIwXhKQD9h3hGpudx6w/3N3E9RvfNU1xH02jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duN8pzCuE2EvphBqeeozuQzFkrRqq8G6NUGbfN5+B8Q=;
 b=dCowUd0OCDRefZy64PDDqRiPkeplTspXhjeuSJYQsULc4FajUB3oEkPn6sUcdY03ALw/29ez2ySJYytheyVVs9QXK34WnfuUKnwgQkcxtcP34uKgWyVA2IxNmQKB31gPlZ9ncLhIVg4VNFTBDG5hBYo0ab6Jkb5M1U/HJhOOfhxGznIm2gNrbFArPeFeTO1us3Smj0Z9FPeV1fVxgLP3mL5ksC1L5bVX1JHF/BB6YH4f/dkZA6n8auXu2ZJSeWOgCaTFqnRgvsv92MT7238dFHJshdbIyJZf8sP/04is/ZNJoU8NNaq5KYgJbFw9l/InmpPeKDugGP6+kumc0H7ZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:50:29 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 12:50:29 +0000
Message-ID: <d8e6c33f-e04a-44d0-b99b-29eb0734bd90@intel.com>
Date: Mon, 28 Sep 2026 14:50:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,4/4] intel-ci: Block igt@sriov_pci_config.*
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260921143707.2117970-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260921143707.2117970-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008C2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::690) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5fbf3c-15ac-4c80-7e57-08df1d5f1340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: QhjZyeHNPmqJAykxaRRb5Xih0tZjodE5ls4D3l/qDRRVynIi55qggr5iaKbU5iEhUGDDilVyQ6HN/nZEUyjPvvywN7hYpF56Jw/ZXi2TUBjPaxR2DCU7TBg+6p+w9he+PMLYZLoKfO28q76ht9mIMAaGGOcTXdb+c9vBnmIpdhJcPGBuGu2GD2SCyT9gLMw9reBugh8hneulcFohna+OUuKYW4nf3PY8JrhFaoRixiUg03IwxUKHnrwTaha9FHtNL1lOPYH9vXA5qd3IFkXDq4tCoa7lQT0NOWq58ge7R5plo7AJR2nWquOkMjCYSuFT4vkGVETvmC4IQtWw9bYk0QVbsZ2yKjX38hN8Lw6BHUG6Sv5SdRwOQEbMKAk8IlRgOBZ2uUgyzMHKBz4vi5+csjCQfJKPVKZgYorMw8qIav/4ZctPhZ7CVxu2U0fiY639I0lpzHVGAM5WXAEt8uWDNu5J7WRV51SaFHo+9/LLRx7sTzdDZcKW3AEpHGdGG1h2zwE5kKCJVsS0Yz2r7RuP94PJlOflWNJ7+8T3ETcV9qHJpSCrH0IiPmLOCR/kYUPgGzV63KGlSLOnrbcnvUQOCask3ayaGXYw6YT5opz7XtkwEQx5MJoFaXSpv9tQanmXoNJM3uPbf47SAswXjtRXQQwUEomvt0KrAu9hhL2DAWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FtMmZWMHpEOW4wU1hxV1VxV0pZVTRRbTJJZXVXRU9iaEZucUIrQXZGdUNo?=
 =?utf-8?B?SVBjVGZXYkw1UWk1SHRzMnlGSmYrRksyRndTMFpxZWlrQUE2ZDJFQmFscHFz?=
 =?utf-8?B?S2RIWENPV0lVcVA5NUF0NWhOdDF0U3hPRS9UUHFNUFM3QTJ3eTRVY0l1MUs1?=
 =?utf-8?B?Ykp4M3R6NFRrTlFCdXVKWUtEUkxKUFZOdUZ5TXcvYjk4a2ZnVGIwRm42dlVs?=
 =?utf-8?B?V3NvVnd2QXdybmVudmF4WEJRSlB6Yk54RE8wTkl2OVVZWm9VTDlXcjIxNnBu?=
 =?utf-8?B?Y1NYd2xoQ3hiUjJ4UElMNmtUdUpuVk9mTU9EV3JNQkk0NDQwRzE0OElCazdB?=
 =?utf-8?B?MUc5MEZvOEFMK3JVNloySDJURlVUZlIvdzJCYjRsUU1PSEVWaVZvZ1NYT0l6?=
 =?utf-8?B?VjNhckN0WDlTK25mbGplVlBsbXBUNWlJSkxVZkl2NnMvWWpHdlNJSm9qK2k5?=
 =?utf-8?B?Qnp4ZG9aQTlYNHVIbUhqVFI3MzkzMUhGVGNyZ2tZOU1UUFBCdVBiVGV4T0pn?=
 =?utf-8?B?S2ZVUVI5MElsNXFwMnBTcjNrZTBRMTA3WmVaSmdkUGlERWJtWlZTRWR2bnBH?=
 =?utf-8?B?OTZKR1psczVualBpZzB0Q2JpMWxlN2tyMjhWcFRiRk15S1hqYzBGdklISjRu?=
 =?utf-8?B?YkplZXhiVXk1clI3R1JGdnNiczM1aDF4Mm1oZ01iMDNQb1lUS2dId2YvTTJT?=
 =?utf-8?B?cFdqd3liQ09nNi9pd09hSHJNVWJ5TnhGWXpkajB0aUdtRVN6cGRVeU1adFpF?=
 =?utf-8?B?YW5VSDlDalRMejdXZm53Sm5oNFh6OFFrckpKRUxkTitma3p1OUdXNkVTUFo5?=
 =?utf-8?B?OFpxZHNSRmtHUGJadk1QTWQxWWRMVnBra29aVFc5enU3T1NNWWdzMy9kaDNl?=
 =?utf-8?B?a0xoOFVmNi9wbzIrcnFDRUpnaldncjI5L3hLL3hrVWdybWZGeFBXZ0ZLVXIx?=
 =?utf-8?B?d2VJSmZkWndaQ2g1RGgzcVpCNWFYMnZqVERXc0h0aTdhZHNBUTM0aUZOSGZD?=
 =?utf-8?B?SVVKdUpETkphaGJzMWxkU0hvSC95bE8raWd4VkF5TWZXSmpwNjhwcU1JVEZz?=
 =?utf-8?B?bElGMmY1amtRdG0vVjZid05ZUFdDRTJxVS9uT1ArejIvdldyQzlmaTQrcXdF?=
 =?utf-8?B?ZVJpSjh3THFWR2VydHE2M200SWQ3dHNZZkhLVWpTTHY4WEpqdkM2U014cTFo?=
 =?utf-8?B?UE84ZE02QkdoQWQ0ZTFPUjlEemlZdzczbzVNalJJZ1N4dnJJQkR0NjFtc00y?=
 =?utf-8?B?L2RDVE9yNHlaRlQ1R3M2ODAxNlMvUmJTNUdscTJjMVFPYVhJNFdZMmZiaFpH?=
 =?utf-8?B?Sk9VNUJnN3pHOU9PYUNQQTh1SlE4ZStSbEViNGFDZFFVWDJscjVXaXdyWFI1?=
 =?utf-8?B?NnVsdmJRSWtrK1E0WFZ1U08veUNYUGFPaC9xalVXSTA5d2pOUkJVaE9VNys3?=
 =?utf-8?B?eXZxdVlMZ2QyamNQUEUyWWhhWFVzZVRKTE9WeVVmeXNiQmdEaG12alJkYWo5?=
 =?utf-8?B?eStQdFRkeUJKZ3BqNy84TXloR1BXUUkyaUdDRE1veWRKWVVUZWlPaUVxYzBp?=
 =?utf-8?B?QjNVU2NHSjU0Q1NkeEZkOE9LQzhNeHZ0VmNuaGJ3RXNsR3R5ckk3K1FxdlVI?=
 =?utf-8?B?MmlHeXFQbFV3enFKdTFnL1YxYVBWSituTWNPY29RdWFncnFTU0FNamh1MS85?=
 =?utf-8?B?SmxNbmFkWTRjMERabHV6V3hqM2tTNVZtR2tCeHdsSlExZG43cSsrdUtHVWhK?=
 =?utf-8?B?Q3c2bXM4cjBsaUdrNHkxZWFDNHFjZUE5VTBiNUVlQ0FxOWFsOFpWSUFRZ0Fl?=
 =?utf-8?B?MEtqdHFla243eXc2VW1nWjlJMWlwQmE4dFp3d0xGQnVVcU9oekRwb3IyY3hK?=
 =?utf-8?B?ZlVCcENOSlgrL2Uva1dNOWJiVnRtZTAveG1LWDdET1dUUHBmVnU1WkZQbzRj?=
 =?utf-8?B?UkVzRzVPOHVkR0l4eEpyRElLOGNIWlZZMGRRQUg4aDNOeGRmall1bmVZKzBN?=
 =?utf-8?B?WkV3Z0QwTTF1WmZ6MGk1akx5ZGRJVnVOZHRzTEsycVVEcnY5QzhCVjVVdVlI?=
 =?utf-8?B?RTV0ajN6ZTlvSGt3eElPdXVjOEdKclkrbTVTMCtGMitzTzk2SzBLd3l0Tytk?=
 =?utf-8?B?S3FiTm12WE8wUktGV1IzSm1Vc3ZRMFcxOXVJbDVOMXJ4cEdWSmtJZkUrSVMz?=
 =?utf-8?B?cjB1VnpXMVVhdFp0bmRrZ3d1Snd3RkJtRlpucit5bXExaHlqdTROdm56VzFK?=
 =?utf-8?B?TVU5K3hSeEJSOFBiZ3lRYUNwcm9ROEJMcDRhV0FYYUlDNmxDUW5RYUFzNnM1?=
 =?utf-8?B?U2xqNE9yUHc2bnNHTEtBMWNHc3BzSnZtTjg4SWxoU3VEb3VieWhJQT09?=
X-Exchange-RoutingPolicyChecked: dWkF3WPSJkx9WHMoSuMRHeB8++VCnl1HJAF9S7KQn7zw8cHJ3GZ4baECtgS0ijwG84RSfCxL6xBEAbu5epeDC30nihrTpJM6jRayPz5MTYOp9oO1gTYfXbybqS4EsR20Ce9UbZe5f8OVYYwO7JsgYUkFKre/uDoFhQVqPqd0UVbdOc5AvWuj/qlvUpBPDqr2lPq87dD6fIr+yQ7ynil680Bfr3Zv8eOa4+MjqJ/pGRTzfxRsZMqOfZSkx7nFxLWRFAzBw2AM0YswAcv8FCKDApY7wZevs/JWMDuPBVxOj6DDdO8qbiZvbkM8vf+IYzzn2wfLTZ9TWbm4SVwZjQHsuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5fbf3c-15ac-4c80-7e57-08df1d5f1340
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:50:29.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5Ij07RuOoIct1O1BXVT7UOEoQF2YfSWSQiwN2F6d1FxseKGjz7C7bHEca2QciwNkrqn/yUV8+/jfp/E+jskzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
X-OriginatorOrg: intel.com
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


On 9/21/2026 16:37, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> This test is intended for HW verification and does not need to run in
> recurring CI runs.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel-ci/xe.blocklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 0f68df95d5..0a7e63c5ec 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -116,6 +116,7 @@ igt@sriov_basic@bind-unbind-vf$
>   ##################################################################
>   # SR-IOV tests for HW checkout, not suited for recurring CI runs
>   ##################################################################
> +igt@sriov_pci_config.*
>   igt@xe_sriov_ggtt.*
>   ##################################################################
>   # Chamelium V1 HDMI receiver supports a maximum resolution
