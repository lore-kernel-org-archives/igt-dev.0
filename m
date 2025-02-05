Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF74C02194
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 14:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA0810E19D;
	Wed,  5 Feb 2025 14:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJGEJCL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7710E19D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738765963; x=1770301963;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=nmQckRXK30nxiElcP3VMx0YhORF39UroMiqkk24IzMk=;
 b=RJGEJCL3UC2LMqROkRM2H+5OvDmbzCuDA7t2bKvrylGxx+f4N6PHc8wj
 Q9H/VorhSMkDCGY81MNCLfWenWNRQFfo5GYxXeKxa1ZZxAha1HUnrPyTG
 hee7cSlrXv6zvwclwkNhomx1T2ZUA0q0sgq5PlzYe0Dli/434H2ERsiGn
 5btmclFftxh8M/whNm23XlvElebreskCsxaHGATd2dvYfcvs8/adw62zV
 FWfpMOYMWqZlZvD/vxvkpkFK869fVkW3LelRfKRYcTc15MPDfCdcPFS8k
 B9t/wLH0ZtFLjlxbVRyJl0d5QEHBSOGTks6D20I59kmLVETMzurZp/Olu w==;
X-CSE-ConnectionGUID: VgMG2hclTr2YEGOw0U+ZUw==
X-CSE-MsgGUID: 45pPgK4KQ/SltEZecy45qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39228563"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39228563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 06:32:43 -0800
X-CSE-ConnectionGUID: hLsxn+XOSPWhU0I+YvGdhQ==
X-CSE-MsgGUID: ppysQFE2QPKMSphM7R4cyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111802472"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 06:32:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 06:32:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 06:32:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 06:32:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKbFErKbTsTPws38I6p6HRl5uLZVgZTunMN4Mt8YNMRMmg6DR5MSNNgG6ItfyRyOGJR7yLRlg0LmSeu0ayJtL4grSer31VR3LqRblgR4g5sUniGH1QxM4Icsxi8VVhmCgr+UKDCSbOdE5TUXh6GALQjugUBof9YN9PiaXQxROhajx3lFzozNM9GeKn8jwHGFChfla/ThapSxYyfvaRSxO+ynhy5TVawpkzN/BC7N6e3Y7tUHf7Q4CKnWAhfnr5A+wg77UTLPunbLAM3dYPaa07qcUc13HxOoKMCPHaeYS7PJFy6Q9KEG1Hh34tvfPGRsY0QC4G1tgmfLfDUnCPAIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sj6ytoeeRazzADr2y6NF52OQhSDDWgvSwdsP0+Ke350=;
 b=EME79EQ1pQEu+lPzMceIhe8FWx1xf0tBSioX1t0PwGbf9qtPFI6wjaxXrVC0GR9MuccoGyzwYrpSLZQs0lcyVHihNtL+zAP1lzYfQIA8uEEuJiC0hwCKWZLRqEhxZ6KThoudE6ts60uOgZb3rGn13XWEJ5N0k6GvYSv3sjv2kHQbvOLP39MXb20EDrCxM+m4mcFgTna7h2xtoSCveJSF96LyYaGzf+bmO7+teCi4Gq/6q1azBRcQLtTitOJWuWKdKLzHef1nfU/rY2BMSvE7kYoU4iNlp6rmnVDKYHjbPEEZmQJ4z1t1/YloVJHZQvaiPw473ccU7CiqNtpORs9Yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7911.namprd11.prod.outlook.com (2603:10b6:208:40e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 14:32:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 14:32:37 +0000
Date: Wed, 5 Feb 2025 08:32:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/igt_kmod: Stop unloading drm
Message-ID: <lgil762ebybeacirrznsiybsp2xh5pl7wsy3pvvc6vguqp743u@dwakn7u5n2nh>
References: <20250205030948.1965423-1-lucas.demarchi@intel.com>
 <173872973303.1251215.1742521374984006120@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <173872973303.1251215.1742521374984006120@b555e5b46a47>
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d59e0-9785-483b-19bc-08dd45f1f006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1fcj27tk/9oZy6Mzf1ZpSmRMWoKMpJ5Q64dLiQzPGunbrrOF1i1RQsa8qa52?=
 =?us-ascii?Q?iYujruAyXe5rfWVD5y+YKXQarj5tkh2uozH81ouoPCNPmprjIvbBKrfvmStc?=
 =?us-ascii?Q?hASC0BPN3HRdZy8TW2l5fK9HvUiC3RontpxpwE+n01wyqQqPIIRzi2eQNxVw?=
 =?us-ascii?Q?PSFkeXGteimlBpA0I46ZNy8G4vJ2Rtr/FWwmd6M/PrWbaJYAX9LsQHAsaJJA?=
 =?us-ascii?Q?TS0o+kWTvGBXtgASxHZRVKplBb+9zUDprVLT1m8W/uVKwiCRt/lJeJ4saQlH?=
 =?us-ascii?Q?Fxq76wA548CczM4FR9Ut5Iw3slYG0omoFa5jJpwuZKjfBOzsviVlxJZ2dmKI?=
 =?us-ascii?Q?VeF5K+Gqo0L8dTacQ9Yf+cM7v+qobo0iPlgiR+DmOEKbWQcyCB5WSEZAeG/t?=
 =?us-ascii?Q?oXLUs0l3rZbqGXUUE26hY34SuxNx8IsgGCIFmzFMiZrL6s22R4z3VZohwIRg?=
 =?us-ascii?Q?gIt75Ju7Ede7y627oUf6/vp9SZ+luymlIxy3HnkbQAgN/YTI93FdjNEl/G+G?=
 =?us-ascii?Q?45A6HN3ASRBsUWioSCgNxjpz8BWMj/pzwPBhWFBZpObh5XsyAkmAvFxKnDl/?=
 =?us-ascii?Q?v1k6yTHEpaCRmpFyvQpJuwy8SzgG+edGoXs2B/RAYhZNlhz0j0gpsSM1Yqju?=
 =?us-ascii?Q?tkKUi5QBm6aoQJlOGlWZznEsHG8wiYZW3xfzpdceOvT9uE8GrsC9WqS2j14c?=
 =?us-ascii?Q?dVn4j+pcGZl168N81dnTfecDQ2ip11PFaStOyvTB7fW1QXKoQFz5AgNXE2S1?=
 =?us-ascii?Q?SznJ1DRJOKSuGZ2nDaOxGKmJjJ2KI4DpjF32FQXI3bQhvF+86kVoiGaRVRoN?=
 =?us-ascii?Q?r5YiRbFo2zrc2oLj3YxCQIIC5n/g+P5zNf1ROVIyCKUtpoQEIAi+oQaPue1M?=
 =?us-ascii?Q?IioCcNAJW3XaFCT2jsOTqzE6hj8T51WskpyQ3cY0jzGfrF0xwyg9HHHmDTHK?=
 =?us-ascii?Q?3fOXsYcU6glZSI2XWACKiobXOV0uQvhbD6fQvES1ZzczZHnDWKVjtWDgfRw1?=
 =?us-ascii?Q?m8JvqoXIsPFXEawIwvozTlNphfk4nki2NRhDVjLHDzXwbXG4EAfTHTd6dxad?=
 =?us-ascii?Q?EHEgssmNtlZRiQ9yy1wGFwM+FmnNwI/t/pSP+Ojw3kJ1utKl9qQccZmOCvEk?=
 =?us-ascii?Q?KOm9k5cX7He+GzALSeSvUz6LGMx9fFZdf2DDu9R/vpTTBwbFXjxk20r4Tt0p?=
 =?us-ascii?Q?M/NRtmlnRqWeJGwYhy9VC0p7v2SjFAIN1dkHytkCGTIFu9UKydpdINuOZRdo?=
 =?us-ascii?Q?SCigVqf+ugJ5FJOdbgUrfd8Y5eyzqFuuNPFoFlmNrFMMu83DGTSV9q0U1OQQ?=
 =?us-ascii?Q?aSjS8tHTj1msMC3KYh4V/7nzQDC4ll+ewVB8TfKz4DE3HQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJdSUvrK9WeI87WaQwAI2k5IJAdshABPetdIgdb9Yan/L+5Hy1M1xCcI4inM?=
 =?us-ascii?Q?G6El27ZeooIrwt+vERkHM7UnPd4NMptaGGa+PmEQWK77hF/bK1rYJ69/+tX1?=
 =?us-ascii?Q?Rxdh2bghFXy4oM/JFNSG1F0vgNfNA8jxlH3hFKFf/kqYA+jT6jRTRSzzGaBx?=
 =?us-ascii?Q?mXMQoo+EFvOm8zgAmkdJlHcvby2OhTvDWcXpclPSZxbW8uJ5t6M1I7ZrDf/d?=
 =?us-ascii?Q?EercfkK3KV1lGKmWjiUQDPGSRJEZKCe1rG0OqtdD+Yb/zmO3pPZX/HW5srPF?=
 =?us-ascii?Q?o3/9iIpQMKyiuevwN2xn6PNfgxwZ6XIIfW43ha3JMoL3Oc9E0Jx+OuN99htE?=
 =?us-ascii?Q?0qjNdUGcu+gG3YyrtrbvjC0Q2tHrqGxnmn+lfIABVL6kGiBEFocwUdK+3MzC?=
 =?us-ascii?Q?kph+g0lHwoV8nBOxdolptkKQdl1aXRvCOwOdzcbbkbhR3qZDISl4loIDPM9w?=
 =?us-ascii?Q?nHEk/hitWNCZJCd4x8vKtakh7q2dwxMXI+ALPK/qJa0FVitpvr354+fQHOAj?=
 =?us-ascii?Q?MBLI2OvyofzM18N+xoxIAy4HkYSQ8bGjJfoeXtXP/nb3QysPeYgPAovxfLBW?=
 =?us-ascii?Q?TKzjJlzeSjFlElmnDHy2d5BMSyMd2LfujM+xKHkQCHH44mF7tFdRFQV+0AJL?=
 =?us-ascii?Q?QvpxMEv7x/sFqHVzkZw1B0UVJ0BV+7HJX2GHFYydfaNHwOgsfpLXAM89Clrd?=
 =?us-ascii?Q?pIvVzK4BNO0Ag9sCf7S9kfpquJM3JnpnuMENjjiIFPG3uAfpaVyfsJZudnmQ?=
 =?us-ascii?Q?cZ0BDn3vIdlIKdRAWAtvnv/tqADGAycGu05nasZldEAPbBPeaVyNEEyB7bOp?=
 =?us-ascii?Q?nnsu96kV+JHSt17RPdZmjdXM1gHcMaynzsBnDkrqxEi1vaktAX4AXEPlfhrN?=
 =?us-ascii?Q?w/MYOSNtPEIHBzmQkA+k2QTTGDsCserT+BCIW5CKbEbxOstMD0t4EzpGtU04?=
 =?us-ascii?Q?QzhvMwskmxxzduD5y0qEnQfPV7VQWk16hL1/nBW58tqJhrzLMlyphpBla5pj?=
 =?us-ascii?Q?etiXvZzr3gNowka4fLadR5mwaIk5Z8iG4/G6AQXOPH2H0hXaxlcuxnOKYqog?=
 =?us-ascii?Q?LX1LkDEtg87eSsIXDIHz+KOTbTqOEvyqYrFHnCGIE+Oxx0e/i5D/epahwKAZ?=
 =?us-ascii?Q?7YZ/8BLLUotWHKzayirvfSTxOYL94iPtAipU/7L7tT5aMMuPtVrJfY+60RVf?=
 =?us-ascii?Q?1yWODGSUniuO23+y5fidbfFXLx83f8GPA/Kts7aCiYaKVAppTjdPScarRTNy?=
 =?us-ascii?Q?3h2VXYShgywN7AlUu6UmEe/wgYiKtAKULZn7Fj8FoK/UEOYmxMQL0h02YMK1?=
 =?us-ascii?Q?+5bHWkCLXgIK7y9HZj3Fu2tIh90J+QqT1ddDsLwdeUc8pYWqhTMMqA8IjMN1?=
 =?us-ascii?Q?AFeGsEtRRa/vQFzEoVsZlLovGSRiYwRdatMd38fjjPF0viYtI387v+75Yepz?=
 =?us-ascii?Q?6dvPf3eizdKSQUuo//hi0NBW99omo6/AKkzcEnTQqPlE1PWqvXRTeGuxN/w6?=
 =?us-ascii?Q?FPH81fH8VhCq89kXg8oV5mwS+SGN4GNGA+YahvfnRFq9CzPfDhk/tB8qxYLF?=
 =?us-ascii?Q?r+MqKHdv/sCQbH9k33JHEYR815adEI8k2P+zVtFX7PY6jSwAoDFCzZOc2H1S?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d59e0-9785-483b-19bc-08dd45f1f006
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 14:32:37.3971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2iyD7V3b/ciPHqYKPZ9qJ5Ebsg1bEFDbXMjnMteIGBqp9bpHglfti+Y+tCKr/snEgUh69vk+XafDT06AeraV7klYElw05acD2RdYHP6quw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7911
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

On Wed, Feb 05, 2025 at 04:28:53AM +0000, Patchwork wrote:
>#### Possible regressions ####
>
>  * igt@i915_selftest@live@mman:
>    - bat-atsm-1:         NOTRUN -> [ABORT][1] +1 other test abort
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12545/bat-atsm-1/igt@i915_selftest@live@mman.html

unrelated
...

>#### Possible fixes ####
>
>  * igt@i915_module_load@reload:
>    - bat-atsm-1:         [ABORT][8] ([i915#13292]) -> [PASS][9]
>   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8223/bat-atsm-1/igt@i915_module_load@reload.html
>   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12545/bat-atsm-1/igt@i915_module_load@reload.html

great, it indeed fixes it, or at least doesn't stress test other
modules' insert/remove cycle.

Lucas De Marchi
