Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C70F531CE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 22:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459F810E15E;
	Mon, 13 Apr 2026 22:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdDu4VMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6033A10E15E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 22:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118494; x=1807654494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wWcUxON/frkKq+TMUBg2uCJUrza3XFUn1mHEjjb+z00=;
 b=bdDu4VMzNCoym3JJigCK57DaDL4BzuyAGYXaysG3Zrjyoy66My5Oo9ih
 HDc3A6ZxSPuHAAvXcOqjuFdHcZqM54FcskDLrtlSqLR8lCf9FoHk6OnS4
 g7clSLhBAzaY6c10YklVz4EW79kxmhrycHf+JZY+xoZPQQ2yWAs1x88IM
 3dcgx2LlVPrtx6Atm0gnLklOX+pEUxtB3NgCd3CqEqSF8CHRwpfo44I1m
 Zcssp5+2kaqavmghrd+xq4GvXNPtZ05/3S1JDr+0YpwmLr0/JQcF4wzog
 D2ZSsngKTKIUAdqsp0wiE/KLsW4tiS+Q9eRtjMbza8p8wjR2rpfAHX/uH g==;
X-CSE-ConnectionGUID: +dQ6k3UyQval3bAVzURb9g==
X-CSE-MsgGUID: nnlmxQPnQ8uEl0fg53cPAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80950525"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="80950525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:14:54 -0700
X-CSE-ConnectionGUID: PoeXlL5yTvSfHZKhNBsJYg==
X-CSE-MsgGUID: hd8HjovzRcSOY5EkDeX+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="226744064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:14:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:14:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:14:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7iJ/qvYtoUkNlbR2KD4e6T6J0KQXTGcY0x7qzeI70NPFj6Iy6Lj3y/3G8t/qY8I0cxn1vy4eC7PxYIXYfko633wLhMlhaCrTD2H8OySBpu10ENo44FjosLA/+sx8VdbJ2j1CemQS7a4D5UsYRGdr/spqwQfWyDvW+5LRC+E+F7GpvL+uLQSGYYKkHcgrO5Ut59q7xBPw2R5beT1pLWGunrSrk3mUA1RBhFmd1HHIDwq93/OsoD0kmM2LXUTf3n38d3NN+vFiu87YiDFw6Dgg0c0SRmaEyGceQNGDWvx1PyD1x48syn5BxMs5YJdaioRBc48PM04Nd4UNs3EXFSvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7OrFkKzjjOqRAHX9RH/26dXvwdI6NExKs9Q3uA6p/I=;
 b=iRpafG080KuQX0edmcQV/MOR83Nw1esFV7qZH5KvwfFrCgGi0DhYO9640oQqqZu2KWVinOFKCuJco01yhPewhghcvKsvKjIJJDHrNHucq9q444DLNoI7NuAI8GE9ovjO3MWcRonrpo4x/X+YRTMR/DC2Wx7CI+qIlddxcQZsMTXBpCVY4F6MRv7s/+DQi4Ivp9GndzlVTkPIKjO0vlVeuda1byl1oEWIW2li7PQzvZ0kuTwaZKsdJpJDDWTeHPNrg+rKAoD4EhxnV9/VE/0n4hDWj3g6qWUYM72a2GMgkelFNVsl/7co46BnPNWTdI7WpH6cHX64zPL8Q+FqvvQdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:14:51 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.014; Mon, 13 Apr 2026
 22:14:51 +0000
Message-ID: <e64727e3-3eff-472b-bd4b-191ff9c61d88@intel.com>
Date: Mon, 13 Apr 2026 15:14:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] tests/xe: Add random page reclaim subtest
To: Brian Nguyen <brian3.nguyen@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <20260406184226.1294486-8-brian3.nguyen@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260406184226.1294486-8-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ec8236-7bfc-4374-7ffd-08de99aa14e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z2wqv/D8djXdiSc47LAYnLXXfXVGgiYXwHg8Ye1F1HXFt7SV2ZHk3TFEH6TlSb4g3bzamB0hi2UB0g1tXtobkfg14VpQ3ZxoVukvJHOQqpNYUQOjpPjCC8xsoXFA7irSjr86fjo5NOsV2uVcu6ytyxipIYXdJyaCGJVxjnt19qztFmQ2cpouQSnhB45wDIXb6th45vVvEiQjXSy31Ppi//G4DHtK4Fft3pwUdG2mERBidRgSwsPlFS1yWrBWTZckAYEqbMNx92Xg5VHxUCvwbLjPhmrgc8CHURD+tCoBw1ncZW/DbhhcsLmwPqfiaMHhCsKqxNdFdGV2btqcbILO38CUt77Pf5Q9sfxD3O7N/xEZaEW/sTPV6m7O6RR1Zi0BIvo940k8EBpbQAQMRcCgtNuqhxZDqpnkI1LkKBCQsCgPioProtVpStZYtuV5KPmPd4kN6Izx9ZKvxpaVPOFg3T8pD0WrrJ8VBnE5OhGcSBo4E23lRYx/C1Z03bKt/+1B3C0br5Xfx+7VTA7VVbSOFtPFuowqsHibu/gUVBaqzrVS/P/TfdmHnZ5psOi8H9u2TNZx/ipHEKgUaAi8hgR2pk2xf4aQx3wc/Bepge58/To6qRB/Qw6QJZAZBs5tdhsY5W+SfYkiiPaj1p0NDU6vIIFSXURbdkXKNNhvG/bQXrJWn1Kj8ZX9PEC/OTOIDHWS8fXixLzA5SxEoObZ+hyLPsttnpbMsCh1l7AAXGZpe1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNDUWJReGw1V0NpRnRCc3kwNk9vV2lqV2I3ZmFISmFTMEZrNWxrOGJ1QndC?=
 =?utf-8?B?RjdHU29TRzA5WVdXVGMxOWo3aFZXWmFkamtUbXp3b0ROOHhFajdoeTZFVFls?=
 =?utf-8?B?RndCakZtS05BdnMxYVVIQ092NVZDeGlpekZIZXNtOFVpTVdadFhNeGtZWEtu?=
 =?utf-8?B?THIwcmF2bml3SGNnRWJaWStNeFcxM0NkNWNVRUpPcWhPUGNIYzhsMXE3MEl0?=
 =?utf-8?B?MHVpaG9tQTdwbUtveFRBT3JjUktUWGo3OFd1ZllJYUIxKy9kcVQ5QTYvNTE0?=
 =?utf-8?B?WmI0c2RsODhHemZja2FPT0xUSlkwcGo3N1dnL0VmT0ltNG5XOU1URFBiTHdF?=
 =?utf-8?B?Vi9wM3h1Qm0yTDU2cnVQOGpuS0VLNTFHNW5NUjBTeW12T1Vqd1JEcmMzS1o3?=
 =?utf-8?B?akVHNHE5dzd1c1BISnRnKy9IU2V1d2hrb1M0Y0lWM055SExRcTlWZlA0K2xn?=
 =?utf-8?B?SDlOb3RtOHgyV3pwSHJFWlNGcjl0Qk1mWDdXMTMxek13dnk5bnBYelRobEY0?=
 =?utf-8?B?Z2F2RVVsaHVQUTZYZmQvQnNVMTlkT2dKanFteVFiT3NiZURPWWpidkFhb0w5?=
 =?utf-8?B?TVJxelQ3ZWlyWGYrNnRLdEdCU1Q0ZUNyL1FpZTJ0T2lPU00zWGpNTm1CWWVY?=
 =?utf-8?B?cDl3M0pHQS9oSGdlQTVZaXlRcG1hTWFkalRRS1RmcENoTnlqTnJMa3kxRlpw?=
 =?utf-8?B?dVNqdHBHY2dIVHBPVmdpYko5Z3BnTWlSZzYrbmE3d0poTk9CZzMxMUZ3Z1ZW?=
 =?utf-8?B?MVlOb3B2OWFua3pVaHExWi8rcWdjdkRmVW5ZKzAxMVpXNUp5UDk5azMyS1FQ?=
 =?utf-8?B?U3E4eklSdmNvYVI1RCs1bnFEZEhlVVIxTkJ2c29qblBXRlZjTXl4ZnpEOTJy?=
 =?utf-8?B?VUFEMFVqL3FIZGhJbXdQaHByRXZwQ1I1MU9qbzlodGRQTy9IZ0RBQVlHbVlx?=
 =?utf-8?B?T1RnSS9wVGxaWHM4NkJrNDJXQURBb0FlRkd6clZMeWpXeDN4eXl1Q0ZROGJY?=
 =?utf-8?B?QktQYVF3ak5yK1IreVkwOGhsWUpVTWxjblZIU3hxaW1RdUdDWG5nQ2VCb0or?=
 =?utf-8?B?QkI1UExtUFdFdG5ub0hTdUM4QkhZeGxXdGtSenR6R2ZxRUtZdVJvczNLV3Mr?=
 =?utf-8?B?SS83ZTlFRDgrNnBFV3BQYU9EQmh5K1V6WHNTM29CZEJpQ0xCQ1dtZVBnbWtZ?=
 =?utf-8?B?ZUIrMGthQnplcXdHNy83dEFtYUY5SnZRR25lZGdXYy96ZHk5akMxL25icFFo?=
 =?utf-8?B?Wmd1cGhQTFh0OStvaFNhY0pWMTN4YkZ6dThUOXlkcUpFcGs3MVVWWm9ESVly?=
 =?utf-8?B?TWJnbURGdjBHcnJ0TjJoVHVHR3dJVGNTbW0vL1JpOGdZMzhQWlU2OE15TGJw?=
 =?utf-8?B?Q041aEhhMkJwRWUwNHlUeUoramZhNjZScTl3M2gyTUdRNFVhazR5dDFVLzRn?=
 =?utf-8?B?TkNVdm1UcDYzeCtOSDlDdnZCbXdYaHZoNWtFNklmSENRMkNSMXA5ZWZvSlVD?=
 =?utf-8?B?T3dCcG50SzZNd01odHF2SThDZGhhczZpQ2F2L0t5NmNtSVlJUE1YZWRpYmxM?=
 =?utf-8?B?STFPbm5DcXpDTk5vb0FyZ1JmV0pzeVEvZ055OCtTVFFYSWd2WDJUN1N2OS9t?=
 =?utf-8?B?V3JjcWVvVW1sY0MrMXRvU25PWllGMGxKSy9sdXFjenJzelV3VlA5ampCdTE1?=
 =?utf-8?B?VVhWUHBNRFVXODVqRTlNYmxxTG9NR0xyWklrV3pCbjM1QktPQVloM1F2Qk1Y?=
 =?utf-8?B?dUZvckg5MGxzL09ibEdMS1hnMWpwQUZTTGhkSWtsNVRKcC9wZi9ScGJVVFBu?=
 =?utf-8?B?bzZ0N2ZCMWEzc3g4N2FyaU5LSHZlSjhVNVVLQ1BkdnczQ1FablpkV254eVZw?=
 =?utf-8?B?NVBOckpwTSt4a1NacEJ5NmwxeC9ZUzh5Q2tvSFJ0UlI5Tjl0R0pPUytmemtX?=
 =?utf-8?B?WHVPekUzYU9EeEUxNW5UdzlJNnRqemMxVHlQK1JZaWIvY2x2TmlEY3ErRnBt?=
 =?utf-8?B?M3NKTmpFeFpnTFFKVEYzTFViZk55SG1CV0F6Q2RDQ3BjMWozZm1aSVVRRWov?=
 =?utf-8?B?dTNmRnIzMW9YVzRjbHI1ZHBibWd5V2RodU5CdHdIRVhJblJhN2NlYUdma1Vq?=
 =?utf-8?B?QzJUdEF6aytiMGZLQW04NXoybnJidDA2SVRLYmZvbTMweXhjT3hHNHZtb0Ri?=
 =?utf-8?B?WGsrTXpCbDFydUJrMnMvMDZrK0RVMGcvSDQ5K1hTTTBMVkQ2VHNtbXhuZEt3?=
 =?utf-8?B?Sm1tcUxlOFFpdVRCaTNxODkxVkhoZzYvdFluMUNtRFEvN2FheXRRRjhzcGo4?=
 =?utf-8?B?WXdhUUxSd2tmNnpNWHczSXRHLzFHeXpQVXMxUjZZaVJLNFdKcXdrUT09?=
X-Exchange-RoutingPolicyChecked: JibTSgGqhBF86nDQY3ZTVT8HOy4BAVMYpZG+X0nO753yJpzKykKmRfGs/TrsLPRBlrLuQOnG9jyLmTO03gWdtd7Q/LwWbKZD4Wyx2+JvcBxyeudgGvUZXkxFwOmILD5UzITeBvnpxAWq0eLa75KCjF6Ajt+VDToAaIPkpI1x9ZCfjT4738oaXXZmgVv7bv5Lt8FfhzfF8EqU1/wDTW0Yn+fftDvZAtD9L1Hbhfa6+inlUjO8kNdxHG4YcgrUBSjQqSibNIMMIsLrPqV28/BzsPM+Waiat4xxUES3TDiKif3EoUHkcMHyLZItYyauLcE+xwGdbz/p+o04WTHpJCDryw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec8236-7bfc-4374-7ffd-08de99aa14e9
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:14:50.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2fyVymJmfJE1mepZFLl7T5Jm3LHrHUG4Y4sYwaRbstGSKqlIGAuNVoGAe42g1CWFcw8kEoSC/knaPDzgZqKiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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


On 4/6/2026 11:42, Brian Nguyen wrote:
> Add a subtest case providing a random distribution in both page sizes
> and page ordering to increase coverage of random pages. To ensure the
> page size chosen are properly used in PRL, filler pages are added in
> between the random chosen to provide proper alignment.
>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_page_reclaim.c | 151 ++++++++++++++++++++++++++++++++++
>   1 file changed, 151 insertions(+)
>
> diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
> index acc237d43..7741063d2 100644
> --- a/tests/intel/xe_page_reclaim.c
> +++ b/tests/intel/xe_page_reclaim.c
> @@ -164,6 +164,153 @@ static void test_vma_ranges_basic_mixed(int fd)
>   	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
>   }
>   
> +/* Helper to calculate alignment filler pages needed */
> +struct alignment_fillers {
> +	uint64_t gap_to_64k;
> +	uint64_t remaining_gap;
> +};
> +
> +static struct alignment_fillers calculate_alignment_fillers(uint64_t start_addr,
> +							    uint64_t current_offset,
> +							    uint64_t page_size)
> +{
> +	struct alignment_fillers fillers = {0};
> +	uint64_t current_addr = start_addr + current_offset;
> +	uint64_t misalignment = current_addr % page_size;
> +	uint64_t gap, misalignment_64k;
> +
> +	if (!misalignment)
> +		return fillers;
> +
> +	gap = page_size - misalignment;
> +
> +	/*
> +	 * Fill the alignment gap using a two-level strategy to match the
> +	 * GPU page table hierarchy (4K → 64K → page_size):
> +	 * 1. Use 4K pages to reach the next 64K boundary (if the current
> +	 *    address is not already 64K-aligned).
> +	 * 2. Use 64K pages for the remaining gap up to page_size alignment
> +	 *    (this remainder is always a multiple of 64K).
> +	 */
> +	misalignment_64k = current_addr % SZ_64K;
> +	if (misalignment_64k) {
> +		/* Not 64K aligned, fill with 4K pages up to next 64K boundary */
> +		fillers.gap_to_64k = SZ_64K - misalignment_64k;
> +		if (fillers.gap_to_64k > gap)
> +			fillers.gap_to_64k = gap;
> +	}
> +
> +	fillers.remaining_gap = gap - fillers.gap_to_64k;
> +	return fillers;
> +}
> +
> +/**
> + * SUBTEST: random
> + * Description: Create a random mix of page sizes (4K, 64K, 2M) with
> + *      proper alignment handling. Larger pages are aligned by inserting
> + *      filler pages (64K and 4K) as needed to test random page size
> + *      combinations in page reclamation.
> + */
> +static void test_vma_range_random(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	const int num_random_pages = 10; /* Total number of random pages to generate */
> +	struct alignment_fillers fillers;
> +	uint64_t *sizes;
> +	uint64_t *random_pages;
> +	uint64_t start_addr = 1ull << 30; /* Start at 1GB aligned */
> +	int count_4k = 0, count_64k = 0, count_2m = 0;
> +	uint64_t current_offset = 0;
> +	uint64_t remainder, j;
> +	int idx = 0;
> +	int i, rand_val;
> +
> +	/* Generate random page sizes */
> +	random_pages = calloc(num_random_pages, sizeof(uint64_t));
> +	igt_assert(random_pages);
> +
> +	for (i = 0; i < num_random_pages; i++) {
> +		rand_val = random() % 100;
> +
> +		/* Weight the distribution: 50% 4K, 30% 64K, 20% 2M */
> +		if (rand_val < 50)
> +			random_pages[i] = SZ_4K;
> +		else if (rand_val < 80)
> +			random_pages[i] = SZ_64K;
> +		else
> +			random_pages[i] = SZ_2M;
> +	}
> +
> +	/* Over-allocate: worst case is 47 pages per random page (15×4K + 31×64K + 1×2M) */
> +	sizes = calloc(num_random_pages * 47, sizeof(uint64_t));
> +	igt_assert(sizes);
> +
> +	/* Populate sizes array in a single pass while tracking counts */
> +	for (i = 0; i < num_random_pages; i++) {
> +		fillers = calculate_alignment_fillers(start_addr,
> +						      current_offset,
> +						      random_pages[i]);
> +
> +		if (fillers.gap_to_64k || fillers.remaining_gap) {
> +			/* Fill gap to 64K boundary with 4K pages */
> +			for (j = 0; j < fillers.gap_to_64k; j += SZ_4K) {
> +				sizes[idx++] = SZ_4K;
> +				current_offset += SZ_4K;
> +				count_4k++;
> +			}
> +
> +			/* Fill remainder with 64K pages */
> +			remainder = fillers.remaining_gap;
> +			while (remainder >= SZ_64K) {
> +				sizes[idx++] = SZ_64K;
> +				current_offset += SZ_64K;
> +				remainder -= SZ_64K;
> +				count_64k++;
> +			}
> +
> +			/* After 64K alignment, remainder should always be 0 */
> +			igt_assert_eq(remainder, 0);
> +		}
> +
> +		sizes[idx++] = random_pages[i];
> +		current_offset += random_pages[i];
> +
> +		switch (random_pages[i]) {
> +		case SZ_4K:
> +			count_4k++;
> +			break;
> +		case SZ_64K:
> +			count_64k++;
> +			break;
> +		case SZ_2M:
> +			count_2m++;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(idx < OVERFLOW_PRL_SIZE,
> +		     "Random test generated %d entries, exceeds PRL limit %d\n",
> +		     idx, OVERFLOW_PRL_SIZE);
> +
> +	/* Set expected stats based on tracked counts */
> +	expected_stats.prl_4k_entry_count = count_4k;
> +	expected_stats.prl_64k_entry_count = count_64k;
> +	expected_stats.prl_2m_entry_count = count_2m;
> +	expected_stats.prl_issued_count = 1;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	igt_debug("Random test generated: %d total pages (%d 4K, %d 64K, %d 2M)\n",
> +		  idx, count_4k, count_64k, count_2m);
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, sizes, idx, start_addr);
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	free(random_pages);
> +	free(sizes);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
>   /**
>    * SUBTEST: prl-invalidate-full
>    * Description: Create 512 4K page entries at the maximum page reclaim list
> @@ -410,11 +557,15 @@ int igt_main()
>   
>   		igt_require_f(xe_gt_stats_get_count(fd, 0, "prl_4k_entry_count") >= 0,
>   			      "gt_stats is required for Page Reclamation tests.\n");
> +		igt_srandom();
>   	}
>   
>   	igt_subtest("basic-mixed")
>   		test_vma_ranges_basic_mixed(fd);
>   
> +	igt_subtest("random")
> +		test_vma_range_random(fd);
> +
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	igt_subtest("prl-invalidate-full")
>   		test_vma_ranges_prl_entries(fd, OVERFLOW_PRL_SIZE, 0, 1);
>   
