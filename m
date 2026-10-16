Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B1CCCF2C3
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 18:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B310E379;
	Fri, 16 Oct 2026 18:16:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EC610E1EC
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792174558; x=1823710558;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r00k6fxffiez5sXzOQaaoLS08fLBPc+Pi0CUT5+5JQo=;
 b=Td1ig9EphXetzVxQjtfaKTBWTwfbnYsQzElj7DoQTHuiT3Usj1Sm5o4k
 BVZB6FZCM9Gs2bnVORrx1EIghxjecYqe8veac+fPTa1BBvVJfNffNHsya
 3Jts+H2UJcG4H+QbI7li83fRepzNh0FMMOdcrTdkC6mKs3Eyl0+2+dp0R
 +p7p39dV2aPeZO0MEAQvhB5f0ZK+WrhgI5k6HuqLW4vX9S3XnkFPBgb2H
 Okk0rgUCilbIru4003gJ9LGbP0jY6k1Lmu0zp9Q6SYKT9A7bwdzeVEGg2
 Q9NjEsH8NhHDZDrfPzrWb3bIFOnFq5i6MOJbIHIsUwGFh7ljh3yKybxFm Q==;
X-CSE-ConnectionGUID: zUnftxAOQqCuIH5oVe3Y5w==
X-CSE-MsgGUID: rX/FZYhzQ92AuAIZojKX3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="865260"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="865260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:15:58 -0700
X-CSE-ConnectionGUID: 7GR4xo8gT0GG1ahRnYSKEw==
X-CSE-MsgGUID: u//iqEwBSCSQ5FZXSooNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2256475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:15:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:15:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:15:57 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcoA041M9f7zxwVdCGXeNNhlcF3Ldj7988v2ETi/36ixtG/HG+XGTOfIijBgdgLuvaMpFeXnZVUdnIZgFd0R4EGOSPchukVc1IcBlOhpkLr4/cXM8FuC6GQChVFTJDaLAGK0t8JEXfHzpAa3Ln4gK1gGI8uFOfr/5wRMZEXtMNe26rmxgQkrFS0DuJqhOSH2GcnLc+oLCICJ//wbfjp2Nm+jL10BgKpAuvNAZOq6UkGKcQOWnRPvaa8WdMYnljNWwiRSO9m9JnOO8KcYnknwNsnuYDzz8YLVSQGhKFmy4cHr0Kv9UyZQpFVxlFwDVHIPMavMoARZF4vmkfFEBdxmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QyAvEWDdNchIWWqY7SM6wrcFIjMRdh04toXFSjKzw4=;
 b=yP/71yoGGqN86kbduuoSNW7m9/pBSI9PtPuIgIwLo7NMBWaYOTVt657KAwZThy1yQBMW+R9TYsU4BbWIJ1Qpdu9/KYhg/vuYVkrmWnO803cJF2BPxKhgJT/GUvn5BClTG8VHbJndok2HU1tKXnCFYO7o67rxKOGCyz0GJUlTZvn4/U+YpdVkou6Z/lRMq7ymcopntt1o0QNAtGAZFACq+DgEHLLtVDkOj/u2EKSpjl1D30lpuywIFZ0PSBAnYECIoAZTC84DnLq2mHOsOcPaduW61RVEMReXEGFe0Rggiqy8sopMrSkBZBYW94hVLG5t8COWCude3oNKqrofEZiTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 by SA1PR11MB9802.namprd11.prod.outlook.com (2603:10b6:806:4d9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 18:15:50 +0000
Received: from SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638]) by SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638%5]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 18:15:50 +0000
Message-ID: <f5e47f10-cd27-495b-8a85-86a9928d867b@intel.com>
Date: Fri, 16 Oct 2026 23:45:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel: Add helper to dump GT debug state on C6
 wait failures
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20261016095145.330496-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261016095145.330496-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To SA1PR11MB5803.namprd11.prod.outlook.com
 (2603:10b6:806:23e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5803:EE_|SA1PR11MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: a349ac82-a07e-45bd-66e2-08df2bb18228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|261009223027099003|10067099003|11063799006|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: fuCCcykZ53CnKBrVy2Ij72f0omab4R6N7CVPUAyds5yDHEGvv24EUhCQihw6cIsdCtFJiVgS7JfqKLm4mtcG9927b63t0C05MGn5puszpCP/LhKAB8tVsIOYKHl4aX621xhbowghjBf47Pc4mQV6H5H++6WGLXvRjZ5kqfdkbsQnY13Zc0XMpKWbNakk3aadh7b2cnbk12w8uITsv/aoP772y0BWvnY1tqQ0lYQdAWrB7A0e5IwaShidgTYt3ftVvSwONPFJhefcN+kUoNbJfZelj6mkPyqMYZQs2WibNVK+ecF6IcfXOHqHiF0DgWAotseVCiCSZ0rQw/uL5pO9sG4Dc4fVjh/tUkpn/Gu1tOwAtIh/a2+ESvjPmsqJufpcOdn9uT5Pwfhg5bRDs7p3KCkVYTlxdFPo83ScYsyW13L+R5r4SnHy1kwZrItNTVD8BUyo9uFFTntxbp0miHvOqg1Sec4C9LuNsA7LkIefkUh+KyJa0Uhf1sHDryzzDMJHJ9trl6YHQ6Kkg4r7jBIpOOSR51tCvrKHfJPdrlWdWyk+UdyUu+rGR1a2Xq6Ooh8WY9f64nqsxPrTOJRCqcssagtW45FJ/MHj7Ojky2IJX16uO1WHeQaugMsysP6/d0Qw8rwW9cZN557YIe8/ZD3x4zzYMFFkOIN+l1+Lfj9w1wM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5803.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(261009223027099003)(10067099003)(11063799006)(56012099006)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1UwY1NQMS96RUxwdmxYL3lKdVNYRFVMUVVpUXNma3k3VE5mcWJYTG9GOC94?=
 =?utf-8?B?blNkTmpxUGpaKzhmazhRa2xZRlUvLzQ3R3NoaFBpbW5qbEVjaGJsVjcrRElz?=
 =?utf-8?B?REZWVmoxTVFjbUp6cDlRR2o4M0NZSERaZys1NGpmcEJ6LzhCeGZ1blhhbXhs?=
 =?utf-8?B?ZUY0RE5OMWpEdDBuQitkYWhxSXkrRFZ2bDJTYjgzVWFJTDlJNkZCT2VzSUp1?=
 =?utf-8?B?QWcwQmZTU25sSzRQa2pvSitURXhvZ3JlNHNuOVJHLzRhWHhGR0JiNjNtVVRp?=
 =?utf-8?B?ZTArTHRxNnhLaFNiSU9QNHlVSGxRckFpQ241ZkN4VURveGZET0kxTzJCNk0y?=
 =?utf-8?B?YldlWW5iVHFxNTh1blIvVjNuMHV6OVJHL0xHaDBTREswZWdCWFU4aEdXT0FL?=
 =?utf-8?B?NzhlWkdvUW5qdHgrR1V5Rm9JQXJ4L2F6VFdlZmlpa2s0NmwyRDZ4eG1wWTUy?=
 =?utf-8?B?bEY2c2JtclJVRzdqcjJNdnhMU3JJRWpJV2g5c2xKM0ZLczgrTGI0QXdHRUhJ?=
 =?utf-8?B?YTlmdkRKdERWUjYrMlNMNlFaZUxrb1NrdEVkY1dlbCt3S1ROSmZ0VSt3Q2xp?=
 =?utf-8?B?cVNXVVBIMk5vZStZU0swQkx5YTRJd2NQZEs2R1dnQ3c2K0ZBN3JwVGdYSFpr?=
 =?utf-8?B?WlRlV2o5cUsyYVIzdUd3ODBpaEd3cXlWVGVDM0NlKzRITzdZbEQzcFYzRFly?=
 =?utf-8?B?UGdRdk43cytXUjF2NUl4d2dKbFpPNlBuY2VVYnlpT09naHJNTkRvTmtkUGsz?=
 =?utf-8?B?cHV5TlNXRTc0V0dUTW1FWlJ6eFFZTk5pV0d1NEtSdzUxWE9FWDhjU2VWRTVi?=
 =?utf-8?B?SHBFeExWUXZJRFMyUnhBc3Mxb0xubVN6VzNnWXk4bmtKZkl5cHAzSnM1L3VT?=
 =?utf-8?B?Rjc1eUQzMWhrMkRORHp3WGg5MmZNVTR3cnFjbWthQWFDc28rMTl4bk1mdVZL?=
 =?utf-8?B?czRhV2Z1aytmYkZ1UnVzRWZqam1jbEpkazdhejVnOUVTQi91bnFwaVdFeGlE?=
 =?utf-8?B?TURyUVFzL3Z3Z2FwdnFUeTJhZ0JUa1VLdkhmSTY3NWxaOXE5ZG1zekVudlZD?=
 =?utf-8?B?aDN6TDdXcU1WOVU2OXpzM2NkWjBFTndrU2UxSzJwOEg2QnorR0d6Zk1ENVUz?=
 =?utf-8?B?NVdsZDhDQ3lkMzhPbFJkaVlSNlpGZlJJTTJxaEs3b0JRYklIUWE5UGhNeUd5?=
 =?utf-8?B?NEQ2ZGhtWXYzNzY0aE1tNUh3a0ZxTTlTZGdZWExTNTN5K0hhK2NyT2ZkU0k3?=
 =?utf-8?B?MG50Mk1XTllCbmtPNk16WnViZy9vYU1VSDl0MHZuWmxUN1Y0ajdJT3V0Ulgv?=
 =?utf-8?B?UHAxcW5nWk0vU1NySlQvT2lVRVFUU2JBN2tSN1R3OThQWldLanNLU2tBUDhN?=
 =?utf-8?B?aEc4WWNmc1RxRzBqRm1xTkxrYXpXSjdTNGZld3VGS0RuNGRNNXNMUkx6bUla?=
 =?utf-8?B?eXp6S0dyNEkwMG1xeldXc3h1RGRZcVlSNUg1eFk1clRPYWM3MGdMemxuVExh?=
 =?utf-8?B?ZHEwK3gxYUFSYTdLVzZhaDZod1ViYnEvSC8veFBEZ3VpOGF5SlR5a09JSVRO?=
 =?utf-8?B?VGZFZjBaLzlkRjBMZTBaTUJUZkY2ZG5Sd0dLaTZ1WURQSHJXYUFZVzJ1Vzgz?=
 =?utf-8?B?UDB1U1A3N2JZUGtyWERETFV0MEFPQllyVTV1dWdEcGxVOStZcTRtQ3djZ0g1?=
 =?utf-8?B?VTVuMm5MVzRjTVpQTmlIRTlXK1ZEWCszQmtUQlJBUnJ5L3BObFF6azFWTXRH?=
 =?utf-8?B?c3BjMG9ndUIrMWZEdUNkNUhZTmxVTXFXb3FuOFUzMkhYbUxjdDJCeDh0TDRs?=
 =?utf-8?B?MnZwNzM4bjF4cDRnME1IZjFTQlRIQmFNNHd0RlVqaCs5a1ZWdzk3QWJsMStP?=
 =?utf-8?B?YW1ycExpMHEvVDROc0FqNUpna3JwajJqaVI0c2JibmUwL3cxYUQ5RHR5dFB4?=
 =?utf-8?B?ZkN2VnAvOWhJMXNQc3dCNy81M1RUWWNVREhxK1o5cXJ5WldDQjZHNFJKTnNM?=
 =?utf-8?B?Y2pNVW8vSHI2M1h3TlN6ejNxanhvdWZ0SERGbGttRWJxbzVJaFVJM05EN2NT?=
 =?utf-8?B?ank2UVE1c3gxaHprUzJXdXhiU20yOFJMTkRMTmV6YTRicDVRRWJqYkwrZHZH?=
 =?utf-8?B?QjZqeUxiZmp4UjEyclZ0TTZaMTRwTXZIelBpenI0UWloMnhqRmZEN25tK0th?=
 =?utf-8?B?b0oxN1FWbHUrUzlqQ244VUk5SnNKMWc1NjI5ZnlwNVVOV3VEN09tRUJVWUZ2?=
 =?utf-8?B?S0VvcVc5dWtReGhsbHo4dzNabTVGRHRhZ0RsZG9qcmRMYVFRWExBcE9RbGFh?=
 =?utf-8?B?U2YrVWloWFFMSnJzbXYzNFN4MWVlUm1SUytjREhFOWJuUEFwdFZqamROWTJm?=
 =?utf-8?Q?f0/ilzaD38MfmKrg=3D?=
X-Exchange-RoutingPolicyChecked: Ms7LZoz2Qy++5RYk71Jd3XdditkR2FEmS3W1liwZdKw5O5mYAKLEs7Ikc0zAdB0BXuCB6hjk2gv63PbdppE9pQXxqkNZ7EXqgQxAKg7xvHBNo98HvCLFgy8yafEayhWV8SkzBsV5anURp6NJjR+p8majzMWLz41DfEvB4iTyo6FwxS0WHvZ1k8m1FfxuPb/ouW8L4yn/0VGeJNsMKVzTTKMtBUKtMpmZOZ1oqJUMU6DAIgFKchR2+BpVAKRzxjgJI0n6pK8x48tIEyB+3Pt0SQHm6Q9mTpAx2hVgO4D4fLZ8qFzELO50wXzIGNTNK/e0CiOVGqXZgxLY5zX5YcwxRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a349ac82-a07e-45bd-66e2-08df2bb18228
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5803.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:15:50.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVDGQuXIPsR+Im6ql1h/ZIHjIS0qWqzs8Dp3yJWVpPqS/e3BkpndQ0gMWIarJlVI5v/PQOQGcd7ztENwIUH8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9802
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

Hi Anirban,

On 16-10-2026 15:21, Sk Anirban wrote:
> GT C6 assertions currently only print GT state on failure, giving
> no insight into what kept the GT busy.
> Add a helper that prints both hw_engines and powergate_info whenever
> a GT C6 check fails or is skipped.
>
> v2: Inlcude NULL check & cosmetic changes (Soham)
typo: "Inlcude" -> "Include"
>
> Assisted-by: LLM
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   lib/xe/xe_gt.c                | 37 +++++++++++++++++++++++++++++++++++
>   lib/xe/xe_gt.h                |  1 +
>   tests/intel/xe_gt_freq.c      | 21 +++++++++++++-------
>   tests/intel/xe_pm_residency.c | 13 ++++++++----
>   tests/intel/xe_pmu.c          |  4 +++-
>   5 files changed, 64 insertions(+), 12 deletions(-)
>
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 3d8b4f68a..2c9778dd8 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>   #include <sys/stat.h>
>   
>   #include "igt_core.h"
> +#include "igt_debugfs.h"
>   #include "igt_sysfs.h"
>   #include "lib/intel_chipset.h"
>   #include "xe_gt.h"
> @@ -229,6 +230,42 @@ bool xe_gt_is_in_c6(int fd, int gt)
>   	return false;
>   }
>   
> +/**
> + * xe_gt_dump_debug_info:
> + * @fd: pointer to xe drm fd
fd is an int, not a pointer.
> + * @gt: gt number
> + *
> + * Dumps the hw_engines and powergate_info debugfs entries for @gt via
> + * igt_info, so they are printed unconditionally on both FAIL and SKIP paths.
> + * Always returns false, so it can be OR'd with the result of an igt_wait()
> + * condition to dump state only when the wait fails.
Use a Returns: tag.
> + */
> +bool xe_gt_dump_debug_info(int fd, int gt)
> +{
> +	char *info;
> +	int dir;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	if (dir < 0)
> +		return false;
> +
> +	info = igt_sysfs_get(dir, "hw_engines");
> +	if (info) {
> +		igt_info("GT%d hw_engines:\n%s\n", gt, info);
> +		free(info);
> +	}
> +
> +	info = igt_sysfs_get(dir, "powergate_info");
> +	if (info) {
> +		igt_info("GT%d powergate_info:\n%s\n", gt, info);

Is it really necessary to print the same gt value twice ?

Thanks,
Soham

> +		free(info);
> +	}
> +
> +	close(dir);
> +
> +	return false;
> +}
> +
>   /**
>    * xe_gt_fill_engines_by_class:
>    * @fd: pointer to xe drm fd
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 93525ea35..9ef15d7dd 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
>   int xe_gt_stats_get_count(int fd, int gt, const char *stat);
>   
>   bool xe_gt_is_in_c6(int fd, int gt);
> +bool xe_gt_dump_debug_info(int fd, int gt);
>   
>   int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>   				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 886537862..ab1c30ea1 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>   	char *throttle_reasons;
>   	int gt_fd;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +		     xe_gt_dump_debug_info(fd, gt_id),
>   		     "GT %d should be in C6\n", gt_id);
>   
>   	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> @@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	if (gt_idle) {
>   		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	}
> @@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -412,7 +417,8 @@ int igt_main()
>   
>   	igt_subtest("freq_fixed_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_fixed(fd, gt, true);
>   		}
> @@ -430,7 +436,8 @@ int igt_main()
>   
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_range(fd, gt, true);
>   		}
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index e976048a9..c5240378a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>   	unsigned long elapsed_ms, residency_start, residency_end;
>   	struct timespec ts_start, ts_end;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +		     xe_gt_dump_debug_info(fd, gt),
> +		     "GT %d not in C6\n", gt);
>   
>   	if (flag == TEST_S2IDLE) {
>   		clock_gettime(CLOCK_BOOTTIME, &ts_start);
> @@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
>   		close(fw_handle);
>   		/* check if all gts are in C6 after forcewake is released */
>   		xe_for_each_gt(fd, gt)
> -			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +				     xe_gt_dump_debug_info(fd, gt),
>   				     "Forcewake released, GT %d should be in C6\n", gt);
>   
>   		if (n == NUM_REPS)
> @@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt)
> -		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +		igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				xe_gt_dump_debug_info(fd, gt)),
>   			      "GT %d is not in C6\n", gt);
>   
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -581,7 +585,8 @@ int igt_main()
>   	igt_subtest_with_dynamic("gt-c6-on-idle") {
>   		xe_for_each_gt(fd, gt)
>   			igt_dynamic_f("gt%u", gt)
> -				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +					     xe_gt_dump_debug_info(fd, gt),
>   					     "GT %d not in C6\n", gt);
>   	}
>   
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 1dc102a7b..de07c2236 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -878,7 +878,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>   
>   	pmu_fd = open_pmu(xe, pmu_config);
>   
> -	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
> +	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
> +		      xe_gt_dump_debug_info(xe, gt),
> +		      "GT %d should be in C6\n", gt);
>   
>   	/* While idle check full RC6. */
>   	start = read_idle_residency(xe, gt);
