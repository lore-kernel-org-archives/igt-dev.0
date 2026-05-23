Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A568BCD5BB1
	for <igt-dev@archiver.kernel.org>; Sat, 23 May 2026 05:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62F10E2DA;
	Sat, 23 May 2026 05:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nya+XM8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40310E2DA
 for <igt-dev@lists.freedesktop.org>; Sat, 23 May 2026 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779514940; x=1811050940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a01bMlV4OoQHQ73JdyvQ7dFdAWjm8WXz38HNOLpVvkc=;
 b=nya+XM8g3wAesQX69uXZXFiPa//AF2HsCNigEt7spCvhynp1BE6QnK+H
 1SfDyvtytRhkM4u4r46ETIhfhqRfeVEHoTAG/80LKX1H7JnRs9tA9QDE/
 gcZkw7Bc1wvb9kn0aoinJFbPgA4aiOf4h40I7slZn4kLbjn7SflHcjE2Q
 J7WX1ExujT3LRtQ2i/IZyrPzxza6hJskepfiszZ8hSeuMqgvfKZMpeqhp
 a9ONOT7dKL94Ro82bnrqqzv3BnHDYxRUVhMQjc6eVDsRBIMEW+DyG+0yl
 RDdLluE9in6Xca1Y6M1lmYRH+tylXP1sJIRVggOQEnQPwz7hqU9iFF5fu g==;
X-CSE-ConnectionGUID: giWbu8GaT5WRf0QIElMiHw==
X-CSE-MsgGUID: jSYs2ynkQJezEdPmLf9tRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="103112119"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="103112119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 22:42:19 -0700
X-CSE-ConnectionGUID: UDss/qgmSVO4uUY4PpMpaQ==
X-CSE-MsgGUID: k/5Tk61IQWeACacvoNc8Sw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 22:42:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 22:42:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 22:42:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 22:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4JR9nGl4+hM1ybs+kan/1iPKuHqefOhU4EdXtsuQpV35rmpvMW+MrSCczc7d2RIobDdAdVo9AYNP1Ub3Y3zrHRD2BF9IeKtvhXE4fYvq++SYHUUFKYpSWuH9Uuhdbi9BL9AF+qncjaSOdJ7M4uTXwSLMW3pP7/P40tbX5Gs6gaQx8s70KAiya5hzLSDyXvGqBNl3T/wId2wZEvx2dARJyU4YJUM6BCkz8uVIX8w2sgZ0g9/BJ4MRQH8wcQfdnlPxB0brtd6Y7D1gjW4OcS+gLMjoZ+ialCbduqadNU+RrDB2YO4rTnfiKKMACCMPEsyoIed4Y9nCpWMnQ1q9NBgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5qzWWsnNQjtlpdmmzgVxm9VIJ2V2Qkkw+6LAzfeolo=;
 b=FIyqjqgWBDz+o0EGeXE5+N1IqrKC+rVojP83Rv3SBVLzwZ3NZ0yD42DvQazjrcN6xv3xTbZiGD1sTBtWv71a+6R0lPc1GsGgFVfD+t4ZB6nfvTzVqwii73rjNJoMwNW+LULK/Q6v0w7ig7/UNCBOYnNIDHPmZrwWadDau6FeK8I+YkV+bco2N7y6MKLpFFoPGO1a9kwCxNUOaCu50w12n2DSzOrIL/zqEmtvSYL8VtTLXIsiWMq/AoJe/mB0QDkJ5lyqFARgSX9OMkZ1jO0JLwJCRiZV1QAb8kDEv2SjIiH9GzhGi/JfB7zngwyfX+vb1DMicoqSdHNhP52YAkRXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 05:42:13 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 05:42:13 +0000
Message-ID: <3e260977-b461-4ce3-8dd8-39c06905089a@intel.com>
Date: Fri, 22 May 2026 22:42:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/igt_power: Fix crash on Xe devices by
 initializing xe_device cache
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>
References: <0d96fafa9f1d2aec54eb79ac96ea101bf9762c7c.1779363474.git.sebastian.brzezinka@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <0d96fafa9f1d2aec54eb79ac96ea101bf9762c7c.1779363474.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f591660-673d-485c-1d61-08deb88e0a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|18002099003|22082099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: pAe4+BvbZVpZZImrTcRTbmZaByWclpcA8rpFhUPozNxc+IrCP/BA2qjE6l3/t2FeSYXKwamdZaVZegTmuT60GzTT65CyRhTTCpPRToI4qaqrFOygHYp/a2TChO4+4h5jDs4t8KLAN7jQoygzxPupHRJiP/IA890nJ8V4rayFtQwZOjGG7SnxsA6IHV3NZHBU5Izm5ohwGWx0b/2pTzsSAIJTwA+b7MSArnXwfBvUipH/xj0xziy9Si8xZerIO29AfFRN+k+pqeSj/FJGiyaA6rKlChFAiyZVDFs+bRQU/82BKKGYP9s6U3v58JMPRIb0cycv/UCj6iJ9l7t+U8gpm3wO6q8507PXlxWLu+Gl5r9/CbHK/+Wg2SCYxeQfLQxysZfCGA6r0g6IDKSW249UWo+KYUZPqlL5iq3ajhEmBM4AT2hc6lKKcl4ygfegILnZvsIOXkAHbToSazXMBA95RGYPWfTjHM/V19mgTl4wuQnCLef85NSX58Z+xa2OgU6iMz5kh0W4oirEkwTHbnUKq9qxWVIG2pWZQpIpYavIcWObaRiw+8KVYOqFjwFDXC9KK7mz7wH/bKecX2rOnndFtVdpd1cIaAvwnsihBFFwKHW1TLPZJlpGjwxqZ1YF51FgaVWk6ps0NNlAYUOKCSgFZjMDaqbr7xpxivt3SOK1LTomp024P2SEdTpSln8z9Zpr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2EzTHJXL1d5Z3lIUE4vSlV3dGh5Q2lyanpnTURVb1J1Tm56VERPWDZjMXI4?=
 =?utf-8?B?VHRJMFRYZnlwa0JjY1l6RUgrSHVmV3MyVSt6d2hGekVuVWtFcnB0QVhMSVY0?=
 =?utf-8?B?MjZzMFdJZzREZUwzMFR1QkFQU1FTUzh6dWhuSC9yYU5SaTIraFVqQWNsempv?=
 =?utf-8?B?cnpxOEdzbGJqS25CUUIwcGkvaTI1NDV3a211OUNVaUNGRDE2Z3hpN1RveWdY?=
 =?utf-8?B?bldtN3pHaTl2VlREWnYrZG01T0M5YXh4NkhLajU3RFBSekVaR0dBVGpTbFFM?=
 =?utf-8?B?VnBYK2pmV3FPTE5Hd2hjV3RDVXZnTDBFU01zb0pJa2ZzVXJqMEpRbUk5WUJF?=
 =?utf-8?B?a3NQQTJEQmtOR25rTHBGeE9rcnNuT1BuTnhJSDE4Y2J4cWZZM2R5Z3JhSzdx?=
 =?utf-8?B?cFlNUDl1aTZkRHJPZytLa1BLZFVsYkFqMVRiSUlBVThYbEM2Zmkwb1BON2VB?=
 =?utf-8?B?RUZlWTN2dnJYbG04RGVDMkhQUHhZcVlCUlVlVVVQaHp6U2w0cVJVTXRscjNh?=
 =?utf-8?B?Zm0yOW9DL1g3STFaSHNJN1E0VU9tVFBEZkVKN1VLMFV6MkkwRktGWk9KenJS?=
 =?utf-8?B?SXR0SjJ6UDhxeTRMaEg1WjVVd21MNWI3cFZEQzYxdnd2bHJ3NHA1OGNHMWg2?=
 =?utf-8?B?RFhkWk9TWEVGR2xpWWNPczNYWW5mKzlybm90b2p0b1UvY0RuVnF4eXcvNEhF?=
 =?utf-8?B?OVozTGhwM3BjTHVhR09JUkV0VWtVYSs4TjFiVXp2TG5vQ25vcU5yTlF4aWZ4?=
 =?utf-8?B?TnRlSVAwYnFERFVHcmhIY3BOWXR1NS9BOTZ2QmJwbzdiN2RDVG9NT2Y1Ynkr?=
 =?utf-8?B?ZGVBRzQ1Wkt4ZmJSQ0VIeXZkc0xId1hodEs3MGVTeTRXVldHRmtSdm40ZFVD?=
 =?utf-8?B?ZEZYZHkza3g1OHV0bVEvelU4eFRDTEc3MDJKZEdFUlBHTE9QcC9iZFBGeXpi?=
 =?utf-8?B?eHVSK3BxSVRiby9Rb2FzcmVYUXhlNlY1ZnpyTk16RCtwcTgrNTFLK2pLVFNI?=
 =?utf-8?B?eFZBcEJqSkhwWmo1VkdsdE90M0M1ZjNCNklUUGFqMmhvODFVbWhYUnNSQUFs?=
 =?utf-8?B?L1FRSmZqK3hVU3JsT0dLVVZsTkpmS0NsS2lxenlNaFBxMmp4N2VQRmIweTlG?=
 =?utf-8?B?ZU5vdllKcFRCQWdkR3lXUGxsMlArWmIyUGkrd2xZQ2xSS0dabHU0cUxhc2RE?=
 =?utf-8?B?QTFYc3JybDlvVXpnc2hwcndkQndicWNKSjNOU3JEK2wrTVpoRUZXSGpLVW1X?=
 =?utf-8?B?L1FEQzYrWkZVRloxcFVaU2ExamVsSkorYjQ0azAzWHd5bFJjMVpDTTE4UWxY?=
 =?utf-8?B?TzhheGpzSTRCZ24zWjBtVFJ3cVJ1aE5IN3F5eVByQ0Zkd0ZGV3c3UlBXdmY3?=
 =?utf-8?B?MWZtb2h4YUk4TlRxazJEeTQyU1c4TEpNMERuNFcrczJkQU1TQWluUGVuVHFR?=
 =?utf-8?B?cTk0blc1ZUNUOGFSVVRwYUhTY1o0Wmt6MW9TV3hNMGJEZUszTDJnbjdkOEl5?=
 =?utf-8?B?TVR3bGhvTGpJK1FwZFh2V1BHRGNnd0hwbkdxYXA2ZXlRaTM0RUE3K2lydFR3?=
 =?utf-8?B?bzRlbDN3VUg4OTd1cS96VmhJaldLZS9OejZreGdKZFQvLzYwMVUxcFNPMlJo?=
 =?utf-8?B?VHF0c0pRenRkc1J3VFVyVW5Ud1V3UWpGeEdoTzY5VlVEWExJc28vUndnS0hE?=
 =?utf-8?B?N3NOMEVYRitqQlkvOFJyTVJQSGg3dWY4QmtDTFNOWmRrNS8wSFMyemR0a3g2?=
 =?utf-8?B?WnVCZjNQY1B6MjRYS25OZnU3ZlZwQzIveCtYMVJmQXBCT3dyYldoZGhIMnhY?=
 =?utf-8?B?YW12RW1YMGlSNnV0Y0RJdXFwaEhJWlJYYUxuTFlCb01TR3JiUDZYVXRtUDYy?=
 =?utf-8?B?MjQ1b2dkWG5ucmZaQ0dmTEhZdHhBckYzUUlXWm9OTi9Ncm5ESkdEajQ1Yi9o?=
 =?utf-8?B?cHBVZWxCMklIQTIwRXJvdlJEeDQvOWRqWWVEU20yemVqeGpoTlYyNy9JS2px?=
 =?utf-8?B?aXFzMEZRSTE4b25UNFVETjMwYU9oempRRmt2eTN6QkhjenJ4NnNLeGY0ODdL?=
 =?utf-8?B?c3dqRmQ0aE53UGdlbndMSjhrS1BHQlhjSWtxOWZpYnArbjBWZkNDblozdktx?=
 =?utf-8?B?NmhVOGU1TEUvMTRrVCtJcE45aFlFWjd2SjAvaVJKK3RiS0I2S2pMRlFkZWQ5?=
 =?utf-8?B?K1VTcE0zWlRQZG1ZZ0ZTWjhZL2VpVEFsY0c4eWxMc0tWTkl0R2NLRUoyYW4z?=
 =?utf-8?B?ZDU3WFE3TVVGSnZ1bWFJbWt3S3Q2SU9vOHQ0TG9GMUlzVWhUalEzcnNHSDFQ?=
 =?utf-8?B?QmxoeFJLYVNDV29CeUhFNzNHdDZQczlvSjh0bTVyQk52NFN5SjVCdz09?=
X-Exchange-RoutingPolicyChecked: RD3697v/+iK10g49Ps7Zcjyo+OWezjuzkQk/SEKHQmHu++UXthkDL31Ilbt3fOhrKzzZ/DagPiEowMAF6syyB+VPZKSiGM6SbkoLTZwfCybtMnVR4eN3raaf4479x5iezCDI0BnNSNrIfSoInUnkPbBCnd0eGYa52pcEbGa6NPbrNrjiJTtMfyZQuo7XxLRo1XViZzmiy4qop2cyiVu9N5FPZiJlSW4S38l++r2ZqnB+rQOcyTuccmaUWnSKkOXUBqRjP8RqOGpgE3TLRWYnN2QbGIQjI6eLpisZVXiNV1BrYrk8wiqUEKW5Qr3uO71w6TE6XagCBaIiyLRYn13R/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f591660-673d-485c-1d61-08deb88e0a7f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 05:42:13.5453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi9+5rgkQkFpIMeXaHmXONf/yEMVKmrPki1z9yntLaycLYIToU602W2+avOWCpiqYGVRzjboDrqVLjz/v8oV5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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



On 5/21/2026 05:18, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
> it uses find_in_cache() which asserts the cache entry exists, causing
> a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
>
> Fix this by opening the device with O_RDWR and routing path-based DRM
> opens through drmtest helpers that pair Xe cache setup and teardown with
> the fd lifecycle, keeping igt_power free of Xe-specific handling.
>
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v1 -> v2:
> - move Xe cache setup/teardown out of igt_power code
> - add drm_open_driver_path() and use __drm_close_driver()
> - drop the direct xe/xe_query dependency from igt_power
> ---
>   lib/drmtest.c     | 24 ++++++++++++++++++++++++
>   lib/drmtest.h     |  1 +
>   tools/igt_power.c |  8 +++++---
>   3 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..9bec3673a 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -379,6 +379,30 @@ err:
>   	return -1;
>   }
>   
> +/**
> + * drm_open_driver_path:
> + * @path: DRM device node path
> + *
> + * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
> + *
> + * Returns: DRM file descriptor or -1 on error
> + */
> +int drm_open_driver_path(const char *path)
> +{
> +	int fd;
> +
> +	fd = open(path, O_RDWR);
> +	if (fd < 0)
> +		return -1;
> +
> +	log_opened_device_path(path);
> +
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
> +}
> +
>   static struct {
>   	int fd;
>   	struct stat stat;
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..19d3d1e76 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
>   int drm_open_driver(int chipset);
>   int drm_open_driver_master(int chipset);
>   int drm_open_driver_render(int chipset);
> +int drm_open_driver_path(const char *path);
>   int __drm_open_driver_another(int idx, int chipset);
>   int __drm_open_driver(int chipset);
>   int __drm_open_driver_render(int chipset);
> diff --git a/tools/igt_power.c b/tools/igt_power.c
> index 6dd180d34..c2bf8d92d 100644
> --- a/tools/igt_power.c
> +++ b/tools/igt_power.c
> @@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
>   		int ret, fd = -1;
>   
>   		if (m->drm_device) {
> -			fd = open(m->drm_device, O_RDONLY);
> +			fd = drm_open_driver_path(m->drm_device);
>   			if (fd < 0) {
>   				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>   					m->drm_device, -errno);
> @@ -54,12 +54,14 @@ static bool prepare(struct measurement *m)
>   			else
>   				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>   					m->rapl_domain, ret);
> -			close(fd);
> +			if (fd >= 0)
> +				__drm_close_driver(fd);
>   
>   			return false;
>   		}
>   
> -		close(fd);
> +		if (fd >= 0)
> +			__drm_close_driver(fd);
The if (fd >= 0) guards on both call sites are redundant.
__drm_close_driver() already handles invalid fds internally
via is_valid_fd() and returns -1 without side effects.
Both can be simplified to a direct call:
__drm_close_driver(fd);

With the nit above fixed:
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	}
>   
>   	return true;

