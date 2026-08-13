Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B0EC5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 09:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652A10F272;
	Thu, 13 Aug 2026 09:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0w5Q3Bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA1410F272
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786614344; x=1818150344;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=76UPLkD0Ur/8GEw2Upcdpl5MPezw+CqTkB0i7y8BFFE=;
 b=E0w5Q3BhjtyONPpJGzIWzYtZfgVtEK63res6UvtInliH/8ZkeoTF8GIu
 GbNArybgY3IKzpwHdZAGpAMECvI9bXOOM5kMUzcogzI3Lo6Vw2qlyIsC6
 6mFXNXoYBHw6Oqgvh9U1rLyuugjdxWxK9g2CDNCjKyIbCp/neIj8FrIPd
 fXRG/IYUEV8njEvbh5vxItftDTFZTLxzYeGlYt7TboGomZO+LntwWHi3T
 djm/P+hvxFEV5XktwKk+QTw6UaGn9kx+ZcbPTTeIpy4erpl9T/Jb4b+WO
 7478HEYkGaa4L2wizRdyhydPAHOj3OLFaTx5l73wiIAZ/orlkdFhyqoLR g==;
X-CSE-ConnectionGUID: mEVPAPvGTUGTfARGTff+bg==
X-CSE-MsgGUID: 80u//y4BSS2tPUr269iPPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87400440"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87400440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:45:42 -0700
X-CSE-ConnectionGUID: 2zysqe39QX2tTpBdOIgieg==
X-CSE-MsgGUID: CqLNl2AXSmaDCCjjfr96XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260083768"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:45:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:45:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 02:45:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azXLKO9m9lXQahs8gKAuaPib6wT2vc2kWsCBykDZPGELB/VnSLF9F1TRjujIcanHv0z+fz7WJEr9L401jLYSYqY8MMYf33cR/bMVQWVGEYUji4khwK+xEADgUjiLL44bDDkfbxKyzzYoIa7x2/on207XORXuLxwB8VyqNZOsyOksIGT9rGdwbK/ZmVe3JBzG0F0IpWqeGy90sni5ZZlDV6n+f8rt5QR6E35r6BWDUgrx8O77gjxFj3+SPnEin8mfmw5Em/Qx4R/eLtemHld0mj4GsGFFxa06sWiYYQOFOIzusD6H4QWZWbxrZY8szkAtrDT7Bh5HjyByAiJC3X+P0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8tPqG/a/WJibqWVt2n0E+HBN0yj5v/KXf4tf+ZQEbA=;
 b=b+Se7lrmo9wikmjVHzeBI8GzubmYsGCdGzgzHSnw+f8TaAv0De/A2KV4deEIXJGwfAnQB+tNrlsjczOfwbgoBkJrAwIie7a4rM4utJW7G0Bi1qoU9WmSr9238ZvHm6P5wQdUvdJICXcEQ0dxc0MSz0B+yEhZlcdcqA/npiYqwDfC+nlAK//UWbUr6A904XLUgs0vQtEfYnI1t5vArOT2s8S3Pxe3uWJmZ6o5ndjlJVVQ68aFs7sSeJFGNFb5tszW5etSHIBl8iooBsqGCm/7FC0P+IF62qTSjjXhrrn4DdLjC6yBP+16Uv2wEG+F3zsxsl0WdzmBb/A5qFLDUovgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 09:43:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 09:43:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Aug 2026 11:44:59 +0200
Message-ID: <DKNPWUA9CF93.HAQDPIZBBQZT@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260812144331.41158-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260812144331.41158-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8522fb-31bf-461a-f946-08def91f5505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zlr7F2Uzfy8BFbxb1yLXTC0SQaSKr/6eFtrW2vKlUIiHJAmhXMGJqrM6Hy8oJag7GtQ9wn3OXCtiyand9JSzX/C0Ww1zSk5n8I0Tgsd6xWo4K1hYqt9l+4CASSYSzUF8qEgXcYK0vVtPn4ZMt2Pth1RAnbFuKPNiBBO4x61kb4fHItLrUbJd5SO9rsevOZpIs/XWbXiklWquXP1888CvByJ/4sL4m9esSRsaJ9byltBHbYypt1abRh9j0+xAP6Pyk8U4lx+zndwepEVPKGThvcOYCK1YlQXsfbtUvf5wqwVo4Yt5Wedhai5kiusvhZeNDgL8jEV7n74oJ+Dbo+0bxJGWsSegmqON732enf1H2sci5s86k4ZFOzs48yhdva/uVTAMq3svrzOpf3KZiTkBV/8Br3oW6045hWrkK4nGqCW9Rn0mS/V+WSqDBMtp+wzAVqxYZRsMvl+bIggREZIAdZvHhsWNQkSrtZTA/+8g8eMTMnCsdj790AFU7ACp8aq6ko0IgJPMyHW8iAva6ML6vug9iMLbWMcKgpc9w9WT3JsysbcvtsIirzHHlCnSeowsnM1XcNpPn8SnxMfCfQ2Ei74E/wZ4X/F+GglysvbhIp8rIRQQJQCw+XbupyZSkoWNEfiMt3S6yPYe75DO3Uyd/Oq38+LZb7FoMpWzw5m1PXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unp2cmUrcVA1alVpWURXZUE3OCs2ZGM4YnJMb0VkeUc3aE8vVW8yOXk4OUlv?=
 =?utf-8?B?bXl6dHl3ZG9sNHBZQUR0QkZVUjhXMTF2TUVyeWdsc1ZaYmNHRS9WWjBTMDUw?=
 =?utf-8?B?aU13SDhiZm9TdFNqZ3ZOcXpFK2ZhL0xQK3FSVmprR29EUlJFNjB5SzJjUUFu?=
 =?utf-8?B?UEVWemhsRW5YbXRPTWhJRFdQeG01ekdRcG5pbjdKbTNDenlqMFBlQVkvQjJi?=
 =?utf-8?B?d3FrOHlvUllmTDJ5a1ptUGNxV2V0eFdVV2dRaTl5WklBVnIyaTRLc2xYRTVK?=
 =?utf-8?B?YzFNcUdNYmdhRVFPVGtqWUlmTlZMdEpxSHh6QUZ5NlVlT1gzZVgzdEVNUGlN?=
 =?utf-8?B?K1lha29wdGhrc0pza0ZYdEF0bGJVU0tFTy90L3U3VWs2WWlGRG5wSW92c2U0?=
 =?utf-8?B?a3JsYkQrc3BUVFBVMkgzNk9zUmNoMFRFODhscXc4NndVYkw4aEY3RStydkJG?=
 =?utf-8?B?RUZyTHNMUk43TkRaRkpuYUtqaWtFYlRNQjZMMnhwWWdxL3BGS0NTNDRQZjI4?=
 =?utf-8?B?dVJCNFdEVHJ0Q2F2VXREWnNETDNEZlF6NGh0SGJZL1lMUEJKQWZiTGRIQ1pw?=
 =?utf-8?B?ZFBpVDR1eVAwS3AvQklkZnFUUGVFeXh6bnhBOUdpMnp3OUw2VVJMTW5LYzFY?=
 =?utf-8?B?MjlnVlZhRmFuZGdHYXIwVWRxQTVmRW5CaEpRNWV2YjBjMTVRTFdpUEFlQXJm?=
 =?utf-8?B?OWtXYldOcWRWbVV5S252UmFQME5IZmJ5KzVkenhTQUpPcm5pTmo2NVpUU3FI?=
 =?utf-8?B?aTF4dE1DS1lrcHArVVdrZTFBNVpGWE9VODAzakg1S1k2cjJrbk1zUC9IU3Fm?=
 =?utf-8?B?N2pmT2wrTHNSODJVUm5LQ0U1VmdTNVM1RHlBZk1NZlg2TndrWCtQczBOb2lG?=
 =?utf-8?B?WVZqaHVTK2pKcmt6TlI5bVowSnNLb1BZV041MmRsanhlNFhxMmVmQUVFQTQv?=
 =?utf-8?B?bU1VcmF2OTdhT2p0aFViejErbTFRVE1TSy90amx5UlF3SGpnelVTVnRrRXda?=
 =?utf-8?B?YmdpZkFrQ1VCL01PenhoZ3VNTkRzTmZTZEtYZVkzNW9iMGttSFFCQmRUcERN?=
 =?utf-8?B?K0N4WTdjZitzanorWFpwQ2hyR2dtVzh2Q0J6Y05OcHRzK21HcXJlTlZkcUE1?=
 =?utf-8?B?NDJIQ1loQWxPV0lENGg5QlZEdndWRkJWdEhnZkd6a3lQUG53djlSNkFHMDg1?=
 =?utf-8?B?dk9oSUQ1Z1E4VWlRM0FjQjZnS1k4WEZhTi9PUWVrVnZKMkNiOGlqalJ0TFFF?=
 =?utf-8?B?SDlsTmJOQ1Y1WEhnQmlUSld0QlJGVUpGR00wQUdLM0wxaUE4TmJvd3lNUVVM?=
 =?utf-8?B?b2VmeUF1U0lnUnpQNzNGVEpVWEJTMTRJazRlL0lLTUFkOWtMOW92OGFFY3Bs?=
 =?utf-8?B?RE92YVhTOVNwN2ltU1M2TWhxb292akZyQ1lscUR5MEowK2RRdDBYeGlTdDZl?=
 =?utf-8?B?b3gxYUJzT1I3WWkxMFZrRmtGQlF3Vmg0b0hxdzdjWWl3QS8yTHR4U1dTdHBM?=
 =?utf-8?B?VGtqSk5vbjdWM3FMcFFJcHQvMjUxaXBhaWo3MjRyUmxBSytxaHc5Y1FsaUlD?=
 =?utf-8?B?MElVZWRuWnpkM0hSMzJQNHJXQ05ROHBHZ2huWEZXMUtLc3JUZHJsd1JkNi81?=
 =?utf-8?B?WVh3R0NaYzFIaFlhMlJOYjgvcTdpWENScVkwL0lqblRSRE1LT1piUXdqM2N6?=
 =?utf-8?B?Znlya0JtRlp3ZHp5QkNtdjFPMlhWS0ZFU0RuZDE0cHRyYzg1MDdqajhlQW5Q?=
 =?utf-8?B?amZCenV1dU51YXpGNUw3U1pYcXNPc1RaZStjSjZUQ293cUZpQ0ZuOFdWeXQ1?=
 =?utf-8?B?NjNKSExoN0d6Ty9VVHJSVFQ0ZkhtdHp2MzJCdzlYTXBaSUtLK2R6TGdjUEg4?=
 =?utf-8?B?V01uOEN3VEtvdFExck9sMU45SUtVM1k3NkMwdGl1UFNzMjhleGVDT2RrTVh1?=
 =?utf-8?B?Uy8vZnpiK2h4VDBhNkJ0bzRyT2ltT2lyV1FMVTdZRHB1a0txdWpJQmRGZG1Y?=
 =?utf-8?B?Y1NlNE5CT05FSjFLMjFBVHNhWkJnN3V0ZDJ1UzNWY3BhVTlMbEVXdjVFM21r?=
 =?utf-8?B?b1dyYVdkTFZIUHdadHJUeDNlVHMrM0NOUTVPeEVaRCtTTzlrKzRQT0lZd0g0?=
 =?utf-8?B?VExiSE9xdVl2SGYyc1VVNW9Da0Z5ZGY2ZkhEWWVubS9BSGw0TUdleVVJei90?=
 =?utf-8?B?MFRFYlFEQnhGVGlaNDN2QVJYTk93eStxa2JVS2czZ3MzR3ZIc2ZrNjBySTdJ?=
 =?utf-8?B?c3lPRWJKb0FMYURUMStWaEQzdTVYT1NZY3FLZVR2aDBqYVd6aGV5MDA0MmtJ?=
 =?utf-8?B?b1RPSitYTVFrR3h6d29PZU5tK3JiMWtNUHFUT0tteHFoQUhXaWF5VXBMUFVI?=
 =?utf-8?Q?Y1IgIi8GY/xJShUw=3D?=
X-Exchange-RoutingPolicyChecked: gVF+jsD3rZxdeW+af7Qw/xlfAtSETfCKHDsAZ1pYrYRBa9/ZaMisCbf3Hg5uF0D6G7UNFO1CqGvqWlglZNu7ASfxZWFqAHLJXhinroEWWp7jFGjGuzhTqUg8Gs9cDTuE5Q2PvERHQA+CW6GvpptdQJsLRXBfO/bMUafxeragLt8+PRU226BXb0PPeWljh4x7PLgJJljF77tTKgdre5tfZiypEiZ8bx0QuQVfc4qLkvx9Tx/OEDP2nkrUIWDQkQz0J7pdo7BdHDJd6PQ+O4bgUvSqaHdcC3Z3wRQYGa2XGyznOmSH7Yasnc+c19nNelyLy3SPWaWxfumO1pnapLPuPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8522fb-31bf-461a-f946-08def91f5505
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:43:30.0852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZaUsxMs4SL7Lci03mQztM3QGYpY+1TqDpkvxNJr6Uj+YHkPfphLGDOLcnK4t8U1vQxRCXDMzo2BIRyP6O1Uz+dT8gOeQEq/B8ErDNaZcng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

Hi Krzysztof,
On Wed Aug 12, 2026 at 4:43 PM CEST, Krzysztof Niemiec wrote:
> Add coverage for the case where the batch start offset is invalid with
> multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffe=
r")
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel/gem_exec_params.c | 48 +++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.=
c
> index 3ba4c530b..757115a21 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -85,6 +85,8 @@
>   *
>   * SUBTEST: invalid-flag
>   *
> + * SUBTEST: invalid-offset-multiple-buffers
> + *
>   * SUBTEST: invalid-ring
>   *
>   * SUBTEST: invalid-ring2
> @@ -404,6 +406,49 @@ static void test_invalid_batch_start(int fd)
>  	gem_close(fd, exec.handle);
>  }
> =20
> +/*
> + * this test is checking for a NULL deref in eb_release_vmas()
> + * (see 4fe2bd195435 for kernel fix).
> + *
> + * this is always going to fail with an EINVAL but will trigger a crash
> + * in the kernel on affected systems.
> + */
> +
> +static void test_invalid_offset_multiple_buffers(int fd)
> +{
> +	struct drm_i915_gem_exec_object2 exec[2];
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	const intel_ctx_t *ctx;
> +	uint32_t size =3D 0x1000;
> +
> +	/*
> +	 * clear out junk from the argument structs, since it makes the ioctl
> +	 * fail due to invalid flags, which is not the failure we want to
> +	 * invoke here.
> +	 */
I think you can omit this comment.

> +	memset(exec, 0, sizeof(exec));
> +	memset(&execbuf, 0, sizeof(execbuf));
> +
> +	ctx =3D intel_ctx_create_all_physical(fd);
intel_ctx_destroy(i915, ctx) may be missing. I was looking at usage in
gem_test_all_engines, lib/i915/gem_submission.c so it may be diffrent
usecase.

> +	exec[0].handle =3D batch_create_size(fd, size);
> +	exec[1].handle =3D batch_create_size(fd, size);
> +
> +	/* this triggers a fail precisely in eb_add_vma() */
This may be a good place to explain how exactly you trigger this bug

> +	execbuf.buffers_ptr =3D to_user_pointer(exec);
> +	execbuf.buffer_count =3D 2;
> +	execbuf.batch_start_offset =3D size;
> +	execbuf.rsvd2 =3D ctx->id;
Most tests use execbuf.rsvd1=C2=A0to store ctx->id, is that part of the
bug reproduction?

BR
Seba

> +
> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> +
> +	gem_sync(fd, exec[0].handle);
> +	gem_sync(fd, exec[1].handle);
> +
> +	gem_close(fd, exec[0].handle);
> +	gem_close(fd, exec[1].handle);
> +}
> +
>  static void test_larger_than_life_batch(int fd)
>  {
>  	const struct intel_execution_engine2 *e;
> @@ -705,6 +750,9 @@ int igt_main()
>  	igt_subtest("larger-than-life-batch")
>  		test_larger_than_life_batch(fd);
> =20
> +	igt_subtest("invalid-offset-multiple-buffers")
> +		test_invalid_offset_multiple_buffers(fd);
> +
>  #define DIRT(name) \
>  	igt_subtest(#name "-dirt") { \
>  		execbuf.flags =3D 0; \





--=20
Best regards,
Sebastian

