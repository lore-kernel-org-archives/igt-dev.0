Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B9BC79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 08:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6410EFC6;
	Wed,  9 Sep 2026 08:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Adsa/TyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8710E12E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788942193; x=1820478193;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gU0UoPa0z+qI8jDCzZe7rOvpMRTTC39byJY+je/9kAk=;
 b=Adsa/TyWHlQGzAl2tRoTLJv9oZ4u0q3bcYIlgcrE6bI5nfsnAHqo/zOe
 v/Fm8qs9d8o3uEASakIsP+QUssLi+5Obd+RP5EUTliKJ/G6Nk1MD/lkbk
 OqdxjkEg/GOsDIWQrCpuBGOCI3oiK5ll25RqBcaa7z4ZZKe88dmC/WmGX
 6TZaF+hv1iLgPhCISqsypMUZp4Tz2y7nbznHLgXuB/zvO05prltCVc20T
 JQtLcx5aXHL4fAXLuJM2bMz0zKr0dwnmKwON1/AK8BVSVuDoR+UqyuYUS
 Olh2stGZH181ijjr8PItGSy3QvQgHZg+qCZoLnFxySrB59HRYteXndSC/ g==;
X-CSE-ConnectionGUID: 2N//cv/wTVWnYaHXzXD/Vw==
X-CSE-MsgGUID: x9FSFDcaT2KpCUhoxXG9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89377065"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89377065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:23:13 -0700
X-CSE-ConnectionGUID: lUYBkYdsR8iuC+T480Hwzw==
X-CSE-MsgGUID: pR/CJ/LwTL2Wauf2RKTzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="271237219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:23:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:23:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 01:23:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vra5PSsYKJoMs5KzAoZIzF1ioOHgspabeDIUre87askLlmE5XbeY9PBz4SsUA7ECkVUQzn/8Vj+GuwNPAEwDYaTN3o37Qb3olyIgVS9t9Z6Yk+Q5htcPjR49OQqiV3E4WOOyh5RUp0cXCmPm27Yiiu7kol1IGEzh2KGVOT+4n+QC/DJm5hjtHkjrC+dJTq/oVaLcchPqiUhFJgjAu9YscP9OVZ91R8KN7jJL9TtB+Oad8xLswPpP4ZuzI/vb9PqYjst7dGvas3ZEGyqd+Ys2VAE2K1/kEKgQvK9sMKAyuD49IyR4keXSIbyvxfytlNeU7FugIGn5A+WWtKll1crwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WWmTHewRIIx7zyOc2hepDGYJtkWxnzP2qE9ePt4TmE=;
 b=BDGTTs4OannLHRAe9I+fuJ4FByjWMKpFmcXwVWxWaRM2X4/F6pwy86iquwotPuzp0Vbpvn9bCxSfO6lPkN2zQ/EDt4kbo1y5vkgl+bdtohcHK9OLtGNFrNl2HSkAf+LjrZfBUt5RSGbFQAkq2S3Ohs728EG9/IArMnOHBJmVAKIqHqMT4hI7uHLsrUiC3U5KlA7cNPiCBeUukF2jRwCF3kBe4AIbnDVfjL9hY2j4EDoVb83as889wuh9PHhOUN8zUBOv0yX0XpxWmoWqIsZwhfUQ3Si9k7pFqHedwmaAo8emlL45xWf0WbmNr6j/PS9sc828txmcAJMdVCcw43Le2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:23:08 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:23:08 +0000
Message-ID: <1b77f2c2-1826-4656-bb45-bf62747cae0a@intel.com>
Date: Wed, 9 Sep 2026 13:53:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/perf_pmu: Fix double free of drpc in test_rc6
To: <krishnaveni.palanisamy@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>
References: <20260909062954.52564-1-krishnaveni.palanisamy@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260909062954.52564-1-krishnaveni.palanisamy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0335.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::10) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 32abd82c-2332-44fa-5181-08df0e4b9419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1dC55muAmyRTiOvCaC7eXDAVVM9ArN2dbLiKMNPPhiAG79Z9NIhn71XbwZ+rbhSj/pgm5vrpqUQcZ90V7GM56JRffNSzCsgEDk1FTGr1OJjeTDt2GQNvACHWikaIB2ut5XibDt0F+0SrreBmh2pB5Ft6ZujJ2m9ip52Wk0keARWrCKHCcqFqq0Kf8oLSeoHmkGMAl0aWQjl8FiyRy3A+iktFe1FDwnKKssnUoueR/0SB/4ET+sK4MByXs8LOelNARempBQR7532wK858bjtam/3Ba/0fJTq67ypwdMTwfG0LBObO/0BxLk8+nC6YOEPEnyO1L8QDN/pju+HzJAoXmyom1nD5UsbXxJra51GuG8XJxX/2GxyMzSA3B2zJkT0eHJip8EyjsJSLDlBD1SrTLbSGGYebGYEENTFZ/ppju72cKJR2PB6EWzJDuubAyCsb4Dctz+akDOWyKwCiG13sDjOEFRK2VUXPZ7TyQR71+52Ne90Ee/su+zZD5GQODsZOeuwmEEDU/sDF6WuwlIJ4HzCjcWMlXQ8AzLJiFbunJKB7cJEwq+q711V+71s19W5uFXTeMt5W7dqqP+BGhY4TLDrs9ObdWSuKlxa1DrSCd5yHnzu9PA7s6YI3rwd0526BMEf1gttBqwND3TntbBo0wZIHx4wMBgmd/y1FYzdDGDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtSZGFHYkV5UCtOMkl3UnBRMW9HQThHTlJ1VWFqOXVwSmgrZDFzb2xIMzRx?=
 =?utf-8?B?ZFM5a1dCcEwvUkx0eWJoa2RGTjAxMmJENXpCYlJJZFJGS1piMDBLRCtRWGhU?=
 =?utf-8?B?K3dtcnNobDVmejBVQ3RDWGlLSUZxa29UZE0vbXFXRFlyNkVIM3VQbnU4TEZV?=
 =?utf-8?B?VVVTbmxsRUpJMEZCdVJYY3NocGJzUU1QUHptTmU0dE83dW81SG9jRUlBM1BZ?=
 =?utf-8?B?U3ZhbERJZFlXZ0phdVYzWjNXUTlHM3AzK1A1WU1lOVFRekVEcTdyOUMxSytY?=
 =?utf-8?B?am1GbG1EWC84ak5iQkxYeTFmN1dTaW1TOEp5bVBGbVFQMy9aME4vZEJhMElx?=
 =?utf-8?B?SmtjYk1MUXF4OVRCR2ZNdSt0dld5bnN3MnB2d2FqOEtpc1NzU2IvUlQyVGIx?=
 =?utf-8?B?LytsdFlSZDM2WXh5Z05hSnA0MGZZaE1HVkxMSmRSdWZkRXNjSjZMU3c1YnRz?=
 =?utf-8?B?ZkJ0Y1NpaStyNDEzMDRPN0RtbU1aQzdNa0NJeGtwRVFmb29WWHlTYkZNY0pa?=
 =?utf-8?B?cktpcEZJNC9Qc3JMYTgreG9EbGFjdWd4MDhBMm4rMkwvelNKeDFITUNkVnB0?=
 =?utf-8?B?c0NjM2Nma25EZzNzaDZvQVQ0R08yM2ZnZVNnM0l3dERLU2o0NTFoZWVUcHhD?=
 =?utf-8?B?WUt2NlZJblQxaWZwSmlIWFdIVE55OEFHS24rV09SYlhBS28rcXNPSDlTb1dZ?=
 =?utf-8?B?QjU2N01Cam9HYVYxM1ZRMXYxVmdvYzlyNUxDRklsK0xLcjF0eW9kM0hnbXl5?=
 =?utf-8?B?ekwrZUlxYjJnUlN0Rm14TWhwejgwT2tsN0I4dGpYVlY0VWk1YnRHY2lwdVlF?=
 =?utf-8?B?ZlhzUFdaamlsdDJIMHVqRGVDdFhDZmRxRXJvOVpnSVNPQ1A5b1lsTFFCcVpN?=
 =?utf-8?B?MVBMVlJrMU1IeVMzdkhEeDZmcW51dEVKN1RmUGgzQXJGS3lJQ1pBUzErMEV6?=
 =?utf-8?B?N242Smd4bFBBL2lqbTFNakVBQVQ4VW5URVhTcHd2S051NG4vbHlsaDVuNW1q?=
 =?utf-8?B?dlVFK0xUZWYvQjV1Q1EzRTZreTBuaktncU5XOFRTS1VTdTl6N2k3Q1JaTUxC?=
 =?utf-8?B?ZG4vQ1NmTGZzaEZjeUFnSVZaWmVybEFnL2k2eFFaUUdneUpCeTZucyt2N2o1?=
 =?utf-8?B?QnRkaGZONXdUQ0JxdDVWa1V3YVlmeHF5cWdOamEwelZjVEg1d0JLeXFsQkRY?=
 =?utf-8?B?aVpZZnFqbHRZQ2IyWmtEUXdNY21lbG1LZ3VWOFo4SzA2ZXlITmhPcDB5WEVB?=
 =?utf-8?B?Um83M2JLcEhrOUlGZk1yd3cxTXdvT3BtK3l1MlVkYnFpZnFXalJVUlExVFpQ?=
 =?utf-8?B?cGdQYitiY3YyTnBlcmZlUEJ0Nzl1blVkWVhiZW9rQXZNaDdZSDdJWTlnVnA4?=
 =?utf-8?B?VTVlKy8xcVhvVUxKcHovaEVqL1lJbE5panQxRm1FaWtxL3VDd2d0TVV0TTN1?=
 =?utf-8?B?eCsvN1FSbGNZb2Y3SFlQSjMxR2lnUTV2dHNRTER1RG12bDN6cWtkZEc1V09o?=
 =?utf-8?B?UnYzRFVWUWtMNjBDUHRlbDR1QWpQQ2MzOTBTeUQyWDFrei9OU2dnMWoyOGtB?=
 =?utf-8?B?ZFZCekc4Q01KdGRSNmNzM0w1QVhqNGxMMkFvaDVYbVIrTnNZZ1RHMkZxSWxz?=
 =?utf-8?B?Z0hraityTDNLZ0V0VnBtbGgwZC8rMjJkTUxPSWExUUZRM000dVZpeFdVbE5U?=
 =?utf-8?B?b2JVMzJtVTg5cS9xTE9GdVF2MEtIelBMMXh4NEgrVmZDM1J3T0hPVWVZL3py?=
 =?utf-8?B?Z0k5L1Z5ZmJBVjZYSHVMc3VKclhFWjB4MXBQNXZ4UjZhSlErRzZWSngwRGpp?=
 =?utf-8?B?UGllUy95K0hKS2Y1QkhoVFJwbnN6d25PazVDUXIycDVWRmRrSm5Hb3FLKzJ4?=
 =?utf-8?B?eklWaWJUdW4xLzVnT2paVGhLUGliM3RuRDQydzBOZ1A0V0QwWElHT1hTb1p1?=
 =?utf-8?B?STVQMHNPVVNrcW9iQ0VucTVUcXo5cVMrQUp3REZJenZzWElaa3RrK3hUdDBP?=
 =?utf-8?B?U1pVcTFJMG5odEFkSHNqTDY0ekNCbTBQZXRUS0dPVjhHcHcxSk5HaUh3ZE5F?=
 =?utf-8?B?NTlZdGpLUVdTUDZIYnVvTmJxZzhqUGlsUXZUbGsyZ1d1WDl2YXJLeWhLRWVp?=
 =?utf-8?B?d0NwUGlnZytMb1dYL24yZ1RUZGRUSndXUFM5ZjZFcTdLMnhzTk5ablVUV0ZU?=
 =?utf-8?B?a2E2ZUd0QVlCSDc3OTZsdFZLaXhtRktHcW1xSXlvSFh0MUg5RDZ2L3NTd0hF?=
 =?utf-8?B?S3pndEd3c3dNU1l2OE02eG1yNmxGUzBFdHhHd0dWdHpiR3hieTZpVmNNVTd4?=
 =?utf-8?B?VjZUc3hmc2FaVEJRRWd5Z2hqTHg5Zm1kYW45ekYzc3lBN0VIOUNJQT09?=
X-Exchange-RoutingPolicyChecked: EA4qVfXT3LkTxJRYlyw4nE8/Ev1J7nIl7uqvZEw65vABoIicM8yEanPFQGRsqmvJKR7jzwhqyLAT6N6jqrcojGsx72UaNDfY5Oi/TKhhvmlT30KEA7049AbanZMcF+HFMjvSmH2hiRn0L/jhvmRR2H+Fax3z6GLutQAfopqZ7uPFq7alpBpSIs68SV3vhmgEK9OVxCI9PoNjqfKzsWhePci9dvr5t54CWOTZoYw8wMIFiaE0DxirlQZq3tGXXzDljJ4rVapd48XDuE2dcddHR252xTqvyPvBEOpBUNHhO9Gzbrd+DiRdXASMLBQ7KLysbbHycqr6nCTOTRXeK0oZRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32abd82c-2332-44fa-5181-08df0e4b9419
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:23:08.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLOhsVJo2RQnmdfX42Weir2tEkgsFlpPLFK1N9xNGJSz/e2r/D1kJe2fbqFY/0HW0Y1sB2uoIszLk1xW9Th8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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

Hi Krishnaveni,

On 09-09-2026 11:59 am, krishnaveni.palanisamy@intel.com wrote:
> From: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
>
> test_rc6() frees the 'drpc' buffer returned by igt_sysfs_get() at the
> end of each phase (initial wakeup, post-S3, post-idle) but leaves the
> pointer dangling. If a subsequent phase is skipped or returns early,
> the same pointer could be freed again, resulting in a
> "double free detected in tcache" abort from glibc when the test exits.
>
> Set drpc to NULL after each free() so the pointer cannot be reused
> accidentally.
>
> Signed-off-by: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
> ---
>   tests/intel/perf_pmu.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 1e389958f..f48e1af57 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1766,6 +1766,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   					    ts[1] - ts[0],
>   					    tolerance, drpc);
>   		free(drpc);
> +		drpc=NULL;
spaces required around that '='
>   	}
>   
>   	if (flags & TEST_S3) {
> @@ -1806,6 +1807,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   					    ts[1] - ts[0],
>   					    tolerance, drpc);
>   		free(drpc);
> +		drpc=NULL;
same
>   	}
>   
>   	/* Wake up device and check no RC6. */
> @@ -1847,6 +1849,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   						    ts[1] - ts[0],
>   						    tolerance, drpc);
>   		free(drpc);
> +		drpc=NULL;

same here.

Thanks,
Anirban

>   	}
>   }
>   
