Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8141AF99368
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152310E312;
	Thu, 23 Apr 2026 10:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSG8AvRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D880010E312
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776940153; x=1808476153;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zwsdOHkevWSOTxPnTc7aXUW9fDnR9AolhlcEF2nscLY=;
 b=fSG8AvRt+lVitjFax9SnetOnGPGZ9QoBC9N5KxXrLql9LDv0ltaN1AZ+
 HJEb5khkfen01LtD3DGdrtKMzYLBBsSnzwDpMB5kIIm/6L6KGL0hu/AEL
 7rAABBstk64UxY9g7DebVvIyVFL+fFo3xIWEQ3BGnU5dt20+ilvqcZPcy
 g0izg7hw+UcFe4zcPWegpDDiz+N5Tg7rBrd7JUrCeoDmwDvbiOv0ZIugL
 luOETiCM3gpOg0/Xr7yS1Bj6OuAvLl/LwtMdjPXA5UVXM1pyrYn2Ivpv1
 2rDTFdMmXyhiTlxGlbJEc8Fe85j3yDh9+9KD4QufXKoEOCMdXyJnBXHU0 w==;
X-CSE-ConnectionGUID: hkdisIDkTD6m4F2oTB5Rhg==
X-CSE-MsgGUID: MyShm2oWQFybGdUVxY+9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78095371"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="78095371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:29:12 -0700
X-CSE-ConnectionGUID: 1amPxjVfSAek/MCUOVCEyw==
X-CSE-MsgGUID: gRBS7J8BQ1+PlFe6L/aX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="236990637"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:29:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:29:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 03:29:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwirNW6rGDoVzDjSulwPw2W/2lWnS7dOX/3H1G2gLGJSs3z8fBqwp3XOBrCGhF+M5sARF4ZcAsfU3+/qZQmKxq/gmUE5hAmqsSGjujh6RGVUSvZiQmICJ24IS87ERVJ8bvkduDvDKNrUQ5NxbExwNq/zQKJaYBoKSsZc2z4wK3W39u13n5N7ik1ph+KwJX2Fxg27B6SoBqDQIbaLNquf2sojQ7tF40ehTFptmym3O7xt17b1U6j3nYFPMq+f03E9j/vlnDzRpfEEMoGlmC0kIrxXQms2it2pBX9yD+3L2GcRAd5cMGJG1ydfT3KSjQQwgf9V5+RsKtk3HvdfMLD1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjTCDrM+G9XXpj6CPer/84plWk1+45n+loRW5f7PpZs=;
 b=EGmPrsuNvGJ6qwKAQzqMk65ZJ4S5COg0vEFNxAxe1X0AodDlQF6OYp0vTRunS+0TZ3dEzGDZiHtNj24CA5hVNQaxCMlWyMsBzD9WnyWAK0iEoEEC8z9FHOv+BMkXrrR4TyH21yMbs2H/WhomQtmLOSC7nHyvNONXUjsjQGZvJpDgHjq+MemU0ef9vi4pXSnmbqjS8rzppKbl55PyLqhj66a33yg7zWVW2vzndxL08Wi6WmdzNDi9tEyzX6DAlsoCKxZuZzmoga0xJXQfwrTNyhcHHqN3tQ/E005LjkTVZOuKws08Lw34r/CNpe7ELN3+fvCB5eud2gjzpODenMl51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:29:08 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:29:08 +0000
Message-ID: <664a9c92-c7eb-4c9f-8bc9-774afae310b3@intel.com>
Date: Thu, 23 Apr 2026 15:59:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/5] tests/prime_udl: Rename into i915_prime_udl
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
 <20260422154423.141908-6-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422154423.141908-6-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 89626baf-6fa7-4097-89c8-08dea12326a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: W7uaTM991tVXJ2vwumKVm7nYhvwldvM1cJg2yq81NM1LWIPKTPgoNwu+k4paWi8D7BEI3C+dMUKepH26D23cT14lVE97sBQUnupRWWtALDlTxWy2x6WNpnbEUBKk7kOh/hUrkhBh1Iv9C0gERDEmpFD8bBWcV8LZzvF89iXyX4vthsnN5yvzEABk+BQPF9UiDDUlUeFqf63M7Lmu1u71AqROySxv42LJx6vy/4E4CSgUJU2sqxmcaNxDkZ4TUtJEzoYK6BRIQHfdvcjwWuAvWrVgd7CdWYUR11nTplyijwpb3OGeDHpZM0OlqyMzVcA0chEfOYFQ2tv16mBtAochuIMMsOxssSlFQO6xYs7nISgJq1bnVpXL0LExJmJNH9Cx0aGe5SSu/KIKTf0l8eR6FG9SX4uL5wDtJAr31CCLC744sUHJJbx8HrknbFbgxHpjFBgapoTN3Jo4xkwomcONsp/PMIQi3CwiQT2nLTxOoaDHZXrLXrJEkWgMpvRgFxFGxrKN6s15QsUfHvuFXw1Boyh/rhtUS//OkSQ52O5iBpmtSiyrZlziZ+ZYZhkqONzly52JI+Li9dDcIixN2yR46z6S6glKrNV9ol8LMWKUQO9T8HWCI6DSEcP/bpOwulkNRW03h22uEbiOVlcD6a9PG0U+yC/bwbk2MaiGeUXMfmocMHnIVlqV7L/wWoO63Ewm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtjSzBjdlNyRE5ZN0tjYjBMV3pjck1ReVFIeDZFMkN5RzV3VnJEWWVzeTAw?=
 =?utf-8?B?OTcyT2pEZlV3RTNhcFVxZTBYZmpkY2k1RHJNdXRLSlVQZW1qQ08zSlJZU2Qz?=
 =?utf-8?B?NTM1Y3Jibk4wUlJ5anI4ZDBkWUZLSEpDeExvSlRGNWM5a2V2SGJpNnBpMGIy?=
 =?utf-8?B?d2I3a3MyNGdleUs2UU40STF0dnhUeTYxMXovRmYvaFVvazEwQTdVUm9laEVy?=
 =?utf-8?B?bkVJRDNkV0dhdllEV0hIMzBaektJaHpaNGVhbGRSbi9SVDEySTgyUUdKT2kw?=
 =?utf-8?B?NG8rbnJHYXlKREJPZEdMRFdHZ0ZpZjRveTRmZ1NxVyt2YnEwRGFGaWlJVXF6?=
 =?utf-8?B?M1J5aGYrY05zcUVyMGI5NVFPN1dmcStlbVJ4SDdVeTNqN3NPOEk3SlN2eHpk?=
 =?utf-8?B?bFlObktpUzh2VjdoeDg5aVZpNTVlVHZsOXZWRUpqbHhrWGhWdWd0OVdYVHFB?=
 =?utf-8?B?MmdTZ3lseU5GbWlLcTZDNS81RXA1TWUrN0NCUkxDd1BFYlp3WmcxN1FBK3V5?=
 =?utf-8?B?aFFaV2JOZUJYaVRRazlkR3ByeVpYdDd4U3h2VnoxMER6cDhlb1MrQXRWV1Ey?=
 =?utf-8?B?RlRrRm56anN0VGZTVnNRQURPRnNCajlLU3VidUw5cGxBMVptYm5HendPU1E2?=
 =?utf-8?B?UXYzdXNlUzhnMkk5NkRMUjI5MTNubDZyd0tDR0JXS25iUzZyQldOOVBrc2l1?=
 =?utf-8?B?cEVCdTZkQzNnamRTZzZ1V3djcCtRNFdTSVgxckF4cExvcFBlTGZmSmdhKzY1?=
 =?utf-8?B?K29jdlFyY2M1d0FJTDZqV3FVb3pnaFNEY1VNQjVQd2g3YVRDc1NYb0pyaDQ5?=
 =?utf-8?B?NHJoMW9Wdi96cFIwRDdBbFBFVm1qcThMSVNLeDg0SUM5emg4VkxScTB2ZExn?=
 =?utf-8?B?aUJaRUdXOHRhc2RhODNROFhQb2dGbXVaWFFoMmUxNkVwd1hSOVRJQ2hxK2c2?=
 =?utf-8?B?dVRiYndWQnhxd0pkV2ZBTFdwN1AraDlxS0x4RHFLOWh0K1IzZ1EzdjVJTnky?=
 =?utf-8?B?eFJUdDU2akdiR1lERnduOXZqWDdsdTVGdktmWktqUnYvV055L05qK1lKdHBS?=
 =?utf-8?B?M1ZJK1VDUTVtV2ZuYTcyZGxIbTVNeUpTS2RSZ250L2VUT1FRZ3dUWm0wL2VW?=
 =?utf-8?B?OUVlemltOU9UQW41eHhUQUxNTHlNYi9KVFplUmk1dVo2Z09xQUl1ZFhGZGVM?=
 =?utf-8?B?clFBalp4bTBQeGxHYlZ1YnJPTzVaL2NicUVscUgyQUsxWnBLR3JiYTRCcUJM?=
 =?utf-8?B?dFQ0ZDlDeGdYYTBNRG84NUFyQlJZdkpibUVOdE9iTlUrbGFiTkRZY2J6YVYw?=
 =?utf-8?B?V0RDa25NUHJJNFlKcDFDcTlQVUVhVTBKUSt6OUltb2c3RElEMEZybkVyb2x4?=
 =?utf-8?B?UmlPM2pNMXI1K1FTbnNCOGRJUytTUG8wQVFZbHBONjBQUnpkOUNoUnVXTE1n?=
 =?utf-8?B?RllQVjBwZ0poQVV6MWVaMWQ4aWhyQXFMMXo1Q0JWZExKU01JaS9vSTByUTN1?=
 =?utf-8?B?SEQ2Q1NzZmp4UW5yY3QzbThUc0hqdktlQUl3NFZNei9UQnlUY1VoZzdvQlV6?=
 =?utf-8?B?dkl6L0hGNFo1S1E0N2Z2bHM1VGYrZmVpelJrekRhSS9GdS9Md1VsT2lHRlhT?=
 =?utf-8?B?Sk03MnU3SURKdkpTcm1aWERIWEtJQmtCZW5JQkFPQVFVLzF5aEZDcFRtalNr?=
 =?utf-8?B?dWlQTHlzU21FbjZaTlRsbVFjMUVDZml6S3ZXMVJIRURHenFKSS9zL2FmTjVj?=
 =?utf-8?B?NkUweC9tSEpmTkFpY3BCeTZHbndPL04zMTBFbXBRcVdZZ2ZZS244NklVaDdr?=
 =?utf-8?B?cDBWN09zVTViZ3RtL3lsNTBLY0NFYlpSVjlKM3JmYm91dXVMMXdVYzN6Q3Bp?=
 =?utf-8?B?bDBUczNubmJMS21IaFFjZUtCUjdFVHhzc0N3WVhwVlQzTFJtK21obmtpK2p0?=
 =?utf-8?B?VnltT2s0WlVXcUVKa2VtNXZacjJWMW9CNTAvV3A0WDV2eXNGL0FWY2dWS3Jn?=
 =?utf-8?B?RUppalJwQmtQYnBTZ2RrVGxNNy83SDdzZVlkaEU1VCtzNVU5NFJHT2l1QmZz?=
 =?utf-8?B?bzM2MFM0Y3VFN3dMZTFuM05oOXZ0YlJzbUYxT1M0d3dDVGJyQUlrWWQyaU1N?=
 =?utf-8?B?Myt0cXlsTzB6R1oybE9DTng4WjlQN09YeURSZk5wT1U0clltWm1LVEpySkVH?=
 =?utf-8?B?MFhiMVRBYXMzSmo5Q0hGRGNvK2lrOEE5M0M0d3dpVjlBZHV5MjM2NVhsOEJ3?=
 =?utf-8?B?cjZVRkhXbW83a0ZnSkttaXVrb3F6dTYwQ1ZnZndjQ1o4QUV1NmtKanM5WjRr?=
 =?utf-8?B?YXE1eUVuNzBRNDBabHlWalFDcldaQjdEd3JZSHBDdmtRZDNNV3pSUT09?=
X-Exchange-RoutingPolicyChecked: MdxLZatfQtG0+x6+0h0ntuMD59vMu2NuIKk+eIwuJBEsM/4mBSwdjaeALuFFAvMESxEafLMsKQvuWPE25qlFkSbiYEcNGU86DxUbcJA3wgHYs8WGhabqIqtzmBNp+pV4HnREngObJg8Yx7DT7XnRPiB6z7aBTOkNojAEGDcXuoMC37tTaQvSO2I7E1hQsKhw6YKo0ukXOSGsRsAYWiU5l9j4oMWJjK+VCb6qQ3DZ719A/9WXe2xktTalaLwKtP98v3130nugK3T/FHqdQopqngmgQVWwwN0JUFQ0VfIwQi++ra9SJBABbAtscXkSYsxkRFcOOvuN8nooEmA6Wo3CkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89626baf-6fa7-4097-89c8-08dea12326a2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:29:08.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAs0kekpg2dhXvcjOiR5e3BgZ3d1xGiGf2IzcbsIa1z6EfkDk0uG5VyNOi+eF4/3aL2lORZP1+2rpxQHJhKF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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

Hi Kamil,

On 4/22/2026 9:14 PM, Kamil Konieczny wrote:
> This is an i915 test so rename it and move it to tests/intel/.
> Add documentation so build will not become broken.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Suggested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/{prime_udl.c => intel/i915_prime_udl.c} | 17 +++++++++++++++++
>   tests/meson.build                             |  2 +-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   rename tests/{prime_udl.c => intel/i915_prime_udl.c} (88%)
>
> diff --git a/tests/prime_udl.c b/tests/intel/i915_prime_udl.c
> similarity index 88%
> rename from tests/prime_udl.c
> rename to tests/intel/i915_prime_udl.c
> index db83152fc..0f2dd50c0 100644
> --- a/tests/prime_udl.c
> +++ b/tests/intel/i915_prime_udl.c
> @@ -13,6 +13,23 @@
>   
>   #include "i915/gem_create.h"
>   
> +/**
> + * TEST: i915 prime udl
> + * Category: Display
Since this is display test, could it be name kms_*?
> + * Description: Basic set of prime tests between Intel and DisplayLink.
> + * Driver requirement: i915
> + * Mega feature: General Display Features
> + * Sub-category: Memory management tests
> + * Functionality: prime import/export
> + * Test category: GEM_Legacy
> + * Feature: prime

And then we could only keep upto Mega feature as other fields aren't 
used for display.

https://patchwork.freedesktop.org/patch/636176/?series=144584&rev=1

Regards,
Karthik.B.S
> + *
> + * SUBTEST: share-import
> + *
> + * SUBTEST: share-import-addfb
> + *
> + */
> +
>   IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
>   
>   int intel_fd = -1, udl_fd = -1;
> diff --git a/tests/meson.build b/tests/meson.build
> index 4c1a39e9e..196fff8ca 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -72,7 +72,6 @@ test_progs = [
>   	'kms_vrr',
>   	'kms_writeback',
>   	'meta_test',
> -	'prime_udl',
>   	'prime_vgem',
>   	'sriov_basic',
>   	'syncobj_basic',
> @@ -231,6 +230,7 @@ intel_i915_progs = [
>   	'i915_pm_rps',
>   	'i915_pm_sseu',
>   	'i915_power',
> +	'i915_prime_udl',
>   	'i915_query',
>   	'i915_selftest',
>   	'i915_suspend',
