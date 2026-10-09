Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1368FCA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 08:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DC310FF77;
	Fri,  9 Oct 2026 08:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww7KgvXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B158110EA6C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791533691; x=1823069691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rJZ179+2TubvGpsPwtTm0OA9fqROGsLBMj0125islbo=;
 b=Ww7KgvXbrbUNJc7kl2/W7XI81/ziWPNla18tykn8+y1KHVauIVfqxAsB
 VEk5mU3onSLVqA7j8D0PjwE3queaxLXokzz2zp8IN1PAazUUKCT8wKjmn
 P5vEgxlgUlCpTyiBy1gW7RLURglIe6qGV6099s9P2BEXlgY2LfA5EB0fT
 AnYluOOb4DY3ahm3Vzf6Jda+PbFZnemgf9Q/P/rOUaIW2yljV3Rr8IyLL
 rz/tnX7q0qom/VP1lYWveSVk86suJty5qZUKModTC14PzHk55D3oAjKu/
 g1sTvunYJXy70lsbx2l7nPp5l2BqqJ/3NikjnigWaxtpdhlUsNGPuAi1W g==;
X-CSE-ConnectionGUID: eLuKyyysSG+pd37HMZGnoA==
X-CSE-MsgGUID: cClkQGmeReWMVg+Oc3yt7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="334066"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="334066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:14:49 -0700
X-CSE-ConnectionGUID: J2LGUXfBSIOAHDP14G2leA==
X-CSE-MsgGUID: vtS4jBktT7m4ATYic36S7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="597122"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:14:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:14:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 01:14:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZK3h8/MLz9tBPMUtHCik5l08BPbPmPDWD6tMwtLYZjhwFisVJTv2Z0qQePq01X92I7JlCafe/QAlIsQtc6avqtJaLZYO9HgCTLZH0NK/ay53SN1uYsS0GxPVOnwMIohVocLwYt7bRK5wLumERJPc88HcNDgbYPBNZtjGuZIp6pQX7qsBjNt+pkSYu/4s2Z6gzNvs8s5Sp7I4uiVeULK4/NY+lCIDhJYt+PrpfSW3Dlf6Sg4Z1IbeaXvz93ms2HXaBqIkxmp0MlbrY3kxDvLYYjD739UoCWbo15ZnsnP5ZG/xK4HF9TMOGb9D5tPF0IMQk2c+6zgcakcSvgnW/42Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBGWLSCdtYK9pVa0LiGcGdbNSDXBRrst0i7M8h2oHJM=;
 b=UdZ2dcC39xG42Sq81mmm+Y//oy4nr54+hxS9NNu6ZQrVFlPlvBRKl6xA7AZZpbqhBq9yCHaADwtjVfWrjuEgyROPRcbPmpaNl3NkYzh9+bXd7UWxTB/Y6zMsLClJtjeoQE5dRKdu0YrtUMXiEOE/W5NOm6ojEdE7tCxcBwDwkDfqnhdH/SHRPeSBvK7Qdrm7diTt+loZuZBQx0O3eDwMbQzCbPBHR/6Icof8MbB8T59k8P+RolyorszOQ2JBsmXyipEdlLQ4P/6nwP4tAUFuC6hI6cFR812Xre2vtCj8MmkgJdC7ewQeFSRbPWqwrxqGRug5Qe4e2J7FPlpe8e86hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 LV2PR11MB148960.namprd11.prod.outlook.com (2603:10b6:408:40f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 08:14:40 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:14:39 +0000
Message-ID: <bd2f0e68-f11a-4a1d-bb86-9f8d3dff01ca@intel.com>
Date: Fri, 9 Oct 2026 13:44:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Purkait Soham <soham.purkait@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
 <c3988e7c-9d95-40e8-afc7-d524bed046e3@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <c3988e7c-9d95-40e8-afc7-d524bed046e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::12) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|LV2PR11MB148960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e16e9de-40b9-4b1a-fd0c-08df25dd5d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: KjP+Lr/jpI/uMVP1QMOjt59EOXFkGs8LVPhl5jiD9vzd/7ynXJ2Hd1CFzkWWyZf7tV1w4M15OHRWHC3mz6Ud1qUaBtoyShK0M2m328DB9gmCQDWcg6ZzvJaf5ULjyBKAnnDpFTeVCHzgzZPxybzgIZu5wm5l+r5T6ik0/FLGioV24BI3Qp+sPvXvlHTe7INLJQUU0Kooo0icZz/YfgEDaQlbxRqL5AbAQXEnrryDezW4JBQ+yEBmdeH1GmBMKVP5OR1Nu27owarX0oa4RJjYBIZtS9w2qCNy9K1QRPDkEVEPzRQCCk3l0VWNZn6JgdnS/k1fj9c5GwpCO6FpOyn4SacORYWzTqQ+FLTsqujF2eK7FXTgaX6eB7QF6lNJaOniS7f4jUWU/VKLgo618YrhLPSidaDb4EA9EkBXc70xJ+C1zHWU0oMhSArqNu7LRQWcif4QhWYQyT+tmcYQvabEQ0+lw00FsLyzOs3mSoCG9WOeCcJXhGQVYdwNmq2OOrTVnGwVhQcwXXRyYLHeD08LY5hHJM+FIvsRqNU3H436Jj6dMJEN/VEyXW667cEFaAlXYAAFY7eqMHvz7T/rv0kroQlC77Zyzg9psMSk6SUQP447uUJE5srG9cAjuG6/9T0wkeNusaYx/avJadJVfDnF2HYaJxVYL9jrXxMsvrI7jr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDFyZjd1THJTZEtVYkU5ZGcyVVA2ekIrYnMyODA1blc5M3FpT3lzNzRpTW1D?=
 =?utf-8?B?Rk44S0VDRWFkeUVIalN5UG5JamtGeDZDZWRaMXphbHFhOGVsalJCckh3QVdK?=
 =?utf-8?B?Nk42WmlyNkFNd3NBLzE5VUlnSng5aVRHbWgzYTJ3RTVhVUQ4bkpFd0FvU2dh?=
 =?utf-8?B?NXdlamhVNUxEZkE2a0Fic05FamJiWDJ0M25CT3FQaVRzd2VPSXFvMzVmS2Vj?=
 =?utf-8?B?V1FkRGRKWmtLK3lrYm05Y1lLV1NRZS8rTjJndm5PTGdPMnlHUWFBejNieGJI?=
 =?utf-8?B?djk4RmFvRjMvSnVDRXpZTG15MHNsUmFIeG4zZElxMWVrdWxNVVAzWHBDRHdB?=
 =?utf-8?B?R01kQUZBU1czTWQ4YjdTcUR0YzdyZnU0QWU5SUJMWW96dDB5UXd3ZkQ1anpv?=
 =?utf-8?B?VCtqT1BzMmhFNE5QbEJFcTRLWHhDdzB2c2NZRWhkR0llUG92cng0eWdPRzFO?=
 =?utf-8?B?UHdzaHdCSEIwQ2doQVR0R2pJSC9aQmtJVXNjenNtYjlhbEo2Z0tOK0IrMzBn?=
 =?utf-8?B?OXJ3dWl0NnA0K2pHMmY3Rk1tWXlROVJyZk1Pa3JCNTM1NDVBTDBXTDJ4VU5q?=
 =?utf-8?B?VnUydzdKLzJGM3hGN0xvOGxaSk1HRTRGMFJLMmFkcllsbTFpZlBQZmcwblB1?=
 =?utf-8?B?WGY2LzBFZFFVQjJaRUQ2Y200Y0hiUGM1ajRHTEFZVG5KdUlYTExScDVTb2U2?=
 =?utf-8?B?TTh5ajFpRWsrNDNRL0VhZldHRTVja0hGYW1QL0JVTGQrakhIcHVYR0h1dlp2?=
 =?utf-8?B?SVVaYzJYWnFEck1EVXhTaDMvOHFBaWFmTHVzOTRweXRJMnNPVUtCOXBYTGtV?=
 =?utf-8?B?NGNTOFNMQVZSWElhaVBMU2w2Tkk0Q0prakZHSDJaSVVHN3lMSXBwYmhuQVJR?=
 =?utf-8?B?a1REUEFyNmwxVFZLb1htcEVoN2RZbHFqMWVYY3NxZGlGL2xPbUNZc0RsTkxw?=
 =?utf-8?B?QzZKdjJwQllvd2dCUFc3blUwbEZMODdUNEFhV253T242YkRoL1VHSmJYNzJr?=
 =?utf-8?B?UURMbjJ0Uzlrc1F6YUd6Vm0yeU5KaDhUck54d20zWWVxTThJemxkcU9SRTJs?=
 =?utf-8?B?TXYwQjRRNllrV2x2bHFmUmFaYVBaKy80T3dJbENZbTBNeC9ObmREUGZYQ0Nq?=
 =?utf-8?B?MU5HY1FmcVFnc24ra1FsUnZBc0RqUTFIRFZKVWJTZmFHY00vRVlOY1c3blpa?=
 =?utf-8?B?aEtCLzBoSGtJcW5OT1NCbm45R09lZGFSRlVpWmg1dGYzQXZjZjdDQ0NGZXlQ?=
 =?utf-8?B?MEtLeERpaTQxQWRiaW90NGVpaHBKVisyVk8rTytmS0V1aEZrKzZSSlUySC9z?=
 =?utf-8?B?NU5TZGRTZmxSamsvQm8rZE8zRThnSXZETzBmd3M0eUtBZ0JzK1NydHhsbW9K?=
 =?utf-8?B?UW1tSExpWUxBZXh0S09VS3VnS0k3cDhMM3c0OGJidkdlL3M3K3NFMkRqTUZH?=
 =?utf-8?B?TjR6dndYRWxaKzdFS0NjWVR4NDZDZi81UElWUVhseWF5anFyLzNYWkhjeTFP?=
 =?utf-8?B?eFd0eno5T3E5VFFUTi8wK2ZGak92QmpBdGhlcUNpaDBGY1hFR3cwbzh1bW5G?=
 =?utf-8?B?Q0p4YTA4azRkVElsTGs1Z3dzVzd3MklaTi9OUGw4azdQUXlDNEVLNFFlRGhl?=
 =?utf-8?B?QXAzdHNCQ0xDeHZ1Zi84TCtua2VzZU5TdEY5aTR6eTdWL1BxNVFOcVByTERD?=
 =?utf-8?B?MUNkbzcrS2pYOHNRaTZoYWlJeW1NdDdxZWw3RGxGajhSRXptTVdsbXAzMlZi?=
 =?utf-8?B?Rk9WbjJhZExaY0FRbDBKMG9CWWdSVG5JZnFEeC9Rd1BSUkpKU0hvZVhWZnFp?=
 =?utf-8?B?Qi9CVmdsVi84R3FZMm5SamoweGRBQUtrVldvTy9nNFMvbjF1Z0kvRng5SVhn?=
 =?utf-8?B?eE4raEVNQTV2TkduK0dvNkV6VmdMclpFazlQQ25uQTNUUGJCRXovdFV0M3NI?=
 =?utf-8?B?OEwwZUM5UGREY2FidUJObnArYzVIdkEyT3Q5NStsbVV4dVBjaVA0TTJXeW9s?=
 =?utf-8?B?dk9sYk4rNVQ0NTRyT3RHY1pJR0xOeEphNkQvY0N5MHlvS1AyZEZZc0wvMEZC?=
 =?utf-8?B?ZFNPTys4eUZuczJ4bDBYeW5Vay9xWTNpRXBkM3E3cVZGa01BamU1UDBERTB4?=
 =?utf-8?B?cFk1eElJUnUrMUtxYUdXMFVPSDVMeEdTV3AzOSsvUDhvaTN3TlpnUWlOQmFq?=
 =?utf-8?B?b1ZyTkRkam1ZanRmS05yd2xtY2tucnp6c1JYcWpUcitZQldVMGdubGpBWEJV?=
 =?utf-8?B?STduaEd0ZlpTWW8zWFVZNU9EWXR2NW43ZkI3WTYwMjNDd2ltMlJVbG1qVlJK?=
 =?utf-8?B?bWcvazFBZmIzUFpUdVFMdzhnL1Y2YWd2ZEhzcmFyU01vM1FGOE0yNmhQNGlt?=
 =?utf-8?Q?afQv2d8bRO6ioI6sAlQYorMOnfit/80BPMmhp?=
X-Exchange-RoutingPolicyChecked: uI5NdbY+NlgteJkewk+I+B9NJ3tTnjVXxZxYfWpTRG2sqC+i2B9F757pCphujQvXaOzPrQNGLhWUF00jv4xmf3pC5F1KvfasnD3CB0WEAa7xlqgzqvcYjKOt/BlBMphnkcEh2/ZfLhcQAXfEJrfG2f2ZuEAMMqmHOH3pWD2zR+DGMVixnDbNZMAwDPObi/Vd6w4wH2QVrWqiTFBP3e+pXBYoU+KwMltWwQE8qoAlkQpfpdHBCBSAofwnbAk3BbqJ3lUhjbe/rlrOCwVGC8EyL8Wm23I+pY63nbRBceagm6ZA5sN+UwmrhKedgxY7WZpAuAgwEJbOcrqt1wi1IvxtRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e16e9de-40b9-4b1a-fd0c-08df25dd5d5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:14:39.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E7Yi+1RODrg89uQvZRANRImsj6XoXBHVloyWwRWpIpce9VKPnfDWYDMXOQK+JhuAg4nLEeIj7S3yALOmSnm0vE7s8h/npCaxJBPQ4F6EqMZA070saN4366DGdgYjH/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB148960
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

Hi Riana,

On 21-09-2026 10:39, Tauro, Riana wrote:
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v4:
>>    - Added Steer Semaphore for disabling and enabling multicast
>>      operation(soham)
>>    - Increased device recovery check timeout from 5secs to 10secs
>>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>>      Jani & Kamil)
>> ---
>>   tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  31 +++
>>   tests/meson.build              |   1 +
>>   3 files changed, 374 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..683994d1c
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,342 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +    RECOVERY_SUCCESS = 1,
>> +    RECOVERY_FAILED,
>> +    RECOVERY_TIMEOUT,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +
>> +    if (state == POST_ARMING_INJECTION_WL)
>> +        igt_info("Running compute-square on all engines post 
>> injection\n");
>> +    else if (state == POST_RECOVERY_WL)
>> +        igt_info("Running compute-square on all engines post 
>> recovery\n");
> Single message should be sufficient. Won't the other info messages 
> indicate if recovery is done or is it during injection?
ok. will update
>> +
>> +    xe_for_each_engine(fd, hwe) {
>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +            continue;
>> +
>> +        igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, 
>> NULL,
>> +                                    EXECENV_PREF_SYSTEM),
>> +                                    "GPU does not support "
>> +                                    "compute on engine\n");
>> +    }
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t 
>> value)
>> +{
>> +    xe_mmio_write32(mmio, reg, value);
>> +}
> Unnecessary wrapper
Will remove the wrapper and use xe_mmio_write32 directly
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +               uint32_t bit_mask, bool set)
>> +{
>> +    uint32_t regval;
>> +
>> +    regval = xe_mmio_read32(mmio, reg_addr);
>> +    if (set)
>> +        regval |= bit_mask;
>> +    else
>> +        regval &= ~bit_mask;
>> +
>> +    xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    uint32_t regval;
>> +
>> +    while (true) {
>> +        regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
>> +        if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
>> +            xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
>> +            return;
>> +        }
>> +    }
>
>
> Are we expecting the single write not to work? Why a while loop?
Here, I am accessing the steering semaphore. As, it does not have 
explicit wait and signal functions, I am busy waiting on the semaphore 
until its value becomes 1. So, while(true) is used here.
>
>
>> +}
>> +
>> +static void release_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
>> +            STEER_SEMAPHORE_MGSR_3D_VALUE);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +    int fw_handle;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +    return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +    if (fw_handle >= 0)
>> +        close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +    struct app_context ctx;
>> +    int ret;
>> +    uint32_t error_value = UINT32_MAX;
>> +
>> +    ret = igt_drm_netlink_init(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to initialize netlink socket for error 
>> command (ret=%d)\n", ret);
>> +        return error_value;
>> +    }
>> +
>> +    ctx.node_id = node_id;
>> +    ctx.error_id = error_id;
>> +
>> +    ret = igt_drm_netlink_get_error_counter(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("get_error_counter failed from error command path 
>> (ret=%d)\n", ret);
>> +    } else {
>> +        error_value = ctx.error_value;
>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>> +    }
>> +
>> +    igt_drm_netlink_cleanup(&ctx);
>> +
>> +    return error_value;
>> +}
>> +
>> +static int check_dmesg(const char *marker, int elapsed_secs)
>> +{
>> +    static const char * const recovery_messages[] = {
>> +        "AER: device recovery successful",
>> +        "AER: device recovery failed",
>> +    };
>> +    char *buff = NULL;
>> +    size_t buff_size = 0;
>> +    size_t i;
>> +    ssize_t line_len;
>> +    FILE *fp;
>> +    bool marker_seen = false;
>> +
>> +    fp = popen("dmesg", "r");
>> +    if (!fp) {
>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>> +        return -1;
>> +    }
>> +
>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +        if (!marker_seen) {
>> +            if (strstr(buff, marker))
>> +                marker_seen = true;
>> +            continue;
>> +        }
>> +
>> +        for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
>> +            if (!strstr(buff, recovery_messages[i]))
>> +                continue;
>> +
>> +            igt_debug("Found \"%s\" in dmesg after %d secs\n",
>> +                  recovery_messages[i], elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_SUCCESS + i;
>> +        }
>> +    }
>> +
>> +    free(buff);
>> +    pclose(fp);
>> +    return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 10 * 60; /* 10 secs */
>> +    int time_interval = 30;
>> +    time_t elapsed_time;
>> +    int status;
>> +    char marker[128];
>> +
>> +    snprintf(marker, sizeof(marker),
>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +         getpid(), (long long)start_time);
>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>
> Why kmsg?
This is to print a marker message in dmesg, so that while checking for 
the device recovery (AER), it starts searching for the recovery status 
messages after this marker message to avoid fetching the previous run's 
recovery messages. BTW, planning to use aer uevents to fetch the 
recovery status in the next patch series instead of relying on dmesg.
>
>> +
>> +    while (1) {
>> +        elapsed_time = time(NULL) - start_time;
>> +        status = check_dmesg(marker, elapsed_time);
>> +        if (status < 0) {
>> +            igt_warn("Failed to query dmesg for recovery status\n");
>> +            return RECOVERY_FAILED;
>> +        }
>> +        if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +            return status;
>> +
>> +        if (elapsed_time >= timeout) {
>> +            igt_warn("Timed out while waiting for error recovery\n");
>> +            return RECOVERY_TIMEOUT;
>> +        }
>> +
>> +        sleep(time_interval);
>> +    }
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>
> Let's not rely on dmesg. use uevent.
Sure. it is planned in the future patch series.
>
>> +{
>> +    int recovery_ret;
>> +
>> +    recovery_ret = check_err_recovery();
>> +    igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +             "AER error recovery timed out\n");
>> +    igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +             "AER device recovery failed\n");
>> +    if (recovery_ret == RECOVERY_SUCCESS)
>> +        igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +    if (val)
>> +        igt_info("Injection: %s Success\n", err_name);
>> +    else
>> +        igt_info("Injection: %s Failed\n", err_name);
>
> Use ternary operator instead of new  function.
will update
>
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error 
>> injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +    int fw_handle;
>> +    uint32_t error_counter_before_inj;
>> +    uint32_t error_counter_after_inj;
>
> Use shorter names.
will update
>
>> +    /** TODO
>> +     *  Fetching node_id and error_id dynamically is pending to 
>> implement.
>> +     *  For now, using
>> +     *  node_id=1 (uncorrectable_errors) and
>> +     *  error_id=1 (core_compute)
>> +     */
>> +    uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
>> +    uint32_t error_id = ERROR_ID_CORE_COMPUTE;
>
> This will fail on multi-gpu.  This has to be dynamic. I don't think 
> TODO will work
Sure. this is in plan for the future patch series. for now, it supports 
only single gpu.
>
>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +    acquire_steering_semaphore(mmio);
>> +    /* Arm the injection sequence. */
>> +    write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>
> why not use mmio_write directly?
will update
>
>> +    modify_reg_bit(mmio,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +               true);
>> +    modify_reg_bit(mmio,
>> +               MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +               MC_PKT_CTRL_MGSR_3D_VALUE,
>> +               true);
>> +    release_steering_semaphore(mmio);
>> +    igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity 
>> error\n");
>> +
>> +    run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>
> If there is an assert or skip in the above function. All forcewakes 
> and registers need to be restored.
> Add a exit handler.
will update
>
>> +
>> +    release_forcewake(fw_handle);
>> +    print_aer_recovery_status();
>> +    error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +    igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +             error_counter_after_inj != UINT32_MAX,
>> +             "Failed to fetch valid error counters: before=%u 
>> after=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_info("error counter: before injection=%u after injection=%u\n",
>> +         error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +             "GT Uncorrectable Unicast Walker Cmd parity error 
>> injection "
>> +             "failed: before injection=%u after injection=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +    igt_info("GT Uncorrectable Unicast Walker Cmd parity error 
>> injection successful\n");
>> +    gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio 
>> *mmio, int fd)
>> +{
>> +    igt_info("Starting Error Injection test: %s\n", injection);
>> +    if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") 
>> == 0)
>> +        wkr_cmd_parity_err_injection(mmio, fd);
>> +    else if (strcmp(injection, 
>> "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +    else
>> +        igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error 
>> injection.
>> + * Functionality: workload validation
>> + */
> Add all descriptions at start of the file if we don't have a function 
> per test
will update
>> +
>> +int igt_main()
>> +{
>> +    int fd;
>> +    struct xe_mmio mmio;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>
> Add the reason for skip. use igt_require_f
will add
>
>> +        xe_mmio_access_init(fd, &mmio);
>> +        igt_require(xe_mmio_is_initialized(&mmio));
>
> Same
will add
>
>> +    }
>> +
>> +    igt_describe("Inject GT uncorrectable unicast worker command 
>> parity error.");
>> +    igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>> +        inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, 
>> fd);
>
> Use enums instead of string comparison.
will update
>
>> +
>> +    igt_describe("Run post-recovery workload after GT parity error 
>> injection test.");
>> + 
>> igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +        igt_require_f(gt_uc_wkr_parity_recovered,
>> +                  "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>
> shouldn't every test be independent.  If there is a dependency make it 
> a dynamic subtest
will update
>
>> + 
>> inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", 
>> &mmio, fd);
>> +    }
>> +
>> +    igt_fixture() {
>> +        xe_mmio_access_fini(&mmio);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/intel/xe_err_injection.h 
>> b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..a70e6af22
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* Steering Control Register (MC_PKT_CTRL) */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>
> Start names with XE_. Also are we expecting other files to use this?
> If not, move it to .c
will update
>
> Thanks
> Riana
>
>
>> +
>> +/* GT Uncorrectable worker command parity error injection */
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +/* STEER_SEMAPHORE_MGSR_3D */
>> +#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
>> +#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>> +
>> +/* Node types for error counters*/
>> +#define NODE_ID_UNCORRECTABLE_ERROR 1
>> +
>> +/* Error types for error counter */
>> +#define ERROR_ID_CORE_COMPUTE 1
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> +
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>       'xe_debugfs',
>>       'xe_dma_buf_sync',
>>       'xe_drm_fdinfo',
>> +    'xe_err_injection',
>>       'xe_eu_stall',
>>       'xe_evict',
>>       'xe_evict_ccs',
