Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B0C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 04:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E83210F5C4;
	Wed, 13 Mar 2024 04:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSTxOmDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0410F5C4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710305525; x=1741841525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Rj3UpMqrOBY/gS5UpUEUedhrr0mWy0pbY4hA+NNhAE=;
 b=NSTxOmDCyyMIdQMvAQsFmebrMc/sILBIbsyqKUNuXX5xvqRbYAzzf3hk
 /brLAMJLOldaITULlp7vXJ+DvAhs5/pNxIzaxON7m2S23lYfdc3Im/87j
 pX8jrgVRzXpNiLeGugBeMO2egWqeNF9hhcRHwLkuAqg32t+0TjWkwqgx7
 Sfusf8h6/dVyuxXxCs9DCp8HEhWadR7ExNor5L8ZS1YtWNuM2XiGkA5Ng
 K1U+Bt408VwX/2xr9ugGt+EA1W3FX6QjO6AgU2Y+XcgbxgfwypZ7DF2nd
 MfrT6qPTfohQwEK8Zwsz0K8KX7Ywo5yyR6hT4C6LbPO696gZEEhD176Yn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8868321"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8868321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 21:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="34920572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 21:52:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 21:52:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 21:52:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 21:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0aJRcjYqWGqgy8dJ3uIGSWnbCdnH+iPPuexCYmEufaGD4CsKtR46FTeHCo0DyzdPuEj2fwU6RlkcGhfZVPk9HmIGudW0IXFhVRNxzF42E8LjKvNn/z2ww9ZMifgoPnaAAFp9wVk8obwBFiu96KH7LBeCKAbo2J/VkM0l8YL26HeQZBm4BG1qp8l+8F0O4akWPm4p8ALAqKSq7h77PcVaJksEQDReIkONJJCFEA9CpxwxNp+4pnnQ4cSZukW4Pb4tSMkr7kKjI7Ob0LVZPFThRZz+d7C71nisRKA6Pnr5dwZh3d+HamStRhNP4TioN/syJmkFtEnTNpPdVsD2Ja1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohN1n9bkF/gbTHZrps6C9BjiGHC5woy/W3+jQzg0YDs=;
 b=LuP7HkXr3wrAHjW31PM8ykPk+uvlaTDJPAzd0lYX4OHpvwFb3heeX9Iitkcy3O1xZ6Z0KWFVoDZcePw8DxPUnBYnAh2YC809APrxmDrwGnQ8mhUVNWW6NkKRMm+4Pj2mI1vR2A8Ep8PTFG2J6EM9YstoY46rcG87jLfdQ2I9L90Iox9JRTBk81DS+JVTS4ZYCXACoPCUFSFZgZyGi9GvaaR5A8iyfCGtSIroy0S5ytSf5Md8AIfb97c0942+9I8+d6M3/dQ5Ps9v6I6o1Ab+BNn+iX5gEsy48IzOGTpJz8VRXYfXf2Cr75jhnGy7U0VXjdgeWuPqO6DbqCCmGd+loQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 04:52:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 04:52:01 +0000
Date: Wed, 13 Mar 2024 04:51:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Message-ID: <ZfEwubqzjQ+Onvec@DUT025-TGLU.fm.intel.com>
References: <20240313043221.2240088-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240313043221.2240088-1-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fc629d-9703-49bd-a638-08dc43195269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kGGQYFIlMxwtlzQnf6Sg9n3auN5wdBXAX79x+frdvwDwAD9e0xmj+Ju7DjUmScgLURqwaCU6TKn2/2haRsDAzz4RnQr0znmgnWW3M/M1R/ina1bxIkJgdKW0tNXeLhAy3p96+l0Ikh88IEZK8HbGEWRD5oR9ah00ExYxAVhSfyIKcrOYe+V7SOVwpsk7nHnTZ2PciqVFWYRQJSIRyIQdrMA1AJWFYyUL5ecn4g5J8rDp3Qq7FZf00PQasXuw8TfVbFZP62yvW4Q8bSTTIT2823MJY9W33iW9V54GsQtDpZO62IFw5iYJkB6zr/lHsAxFyOz/MduTZqFhq6u9WAuIAXlm8x68pttPK0EVsZVz+BW6CVxn1lpxB+aHWsKF5WjMFvvGTpqVEyCOzusSRPSV794df2TYsPFTKJ6im56XI2n7UkBcZSjoOYmDdqJHoehBaAhqT2fT2XgIEb/nw5jt/0clrfher4vUxusDZ7Na2W8F17+6e5+tNDV81T9ITIrsazZ+I/qTdUTpLRnCY1HO6PdTTGqeYEidBvbAo4h7qAP3ig1ANheNQ8ij70w4nlvRfLAFoApD8805FBVnhSAQ/MjBpYRZa9yG2lCl+iEBX9SvWfE9sC9aW4sBUTp3DOyOuNdsNZ8K8EihlXEvDIfHbRglT3uY9CCF9iekTJ/XdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qvt0oKlHjKEn+yS3XYV07sdaN3UANOAU3BB3gGG6hH3kMg89i8iMV+xdsqUR?=
 =?us-ascii?Q?Qi4Y6UTDuveY+9z98mip9OXQOEI7P5ehh+W3m70WBBGjpXTBMPaWU8o2je98?=
 =?us-ascii?Q?50MVoUpkSD6vEjf8uH4M8yutPaN+EtR4qcy8DkSCjya0CwvB1KRGeuWzP7NF?=
 =?us-ascii?Q?OqATpQl70SofAdhxRkhD6xxwvXsgiRg0Tuno4EQLPribxzs+ajOE14tYzrtE?=
 =?us-ascii?Q?rpYIM6WMX5cLSlyegGeTIy7iWRaIdOH1+75yljBKDZyNMnOXk6tHb2al1bMX?=
 =?us-ascii?Q?AFzBQcLVT6+D95vfv8GR2R7il4HL0m3vQv68YmbdMydbP2ErdUr4pwE7amNF?=
 =?us-ascii?Q?gWdkQCH+9rKdPz1/z5fsYN1AjvLDHXTKo/jKHAVnGCtNvCYGJ2Z802eC8esI?=
 =?us-ascii?Q?+WMksB3QUBe87BFmPAFnLgaNCctercFV3DTJ7HiqJr09KYqp+KcJYNcwLcqX?=
 =?us-ascii?Q?Yv+Eq58vcjIhRUWQnwcGV/XxAXme6LKTLrW7HEdxsFvqhIf1MT86jce0Re3+?=
 =?us-ascii?Q?qSzApeEMY4tVyT42irNLzWsNRS8c3nUUjLEMzzwlekT7GYS/D298oewqLuAH?=
 =?us-ascii?Q?XzkjSJhH7NxX0vjTnncekriTr2xOvY5j0/8lrjBsaFeXWPqHS/pvJyq1tEEx?=
 =?us-ascii?Q?p1Rc1EnyrtJzwUBU8F6CflBeZMb4NFqTp0c8Q15zexP/KbuDZEiH+VWtKhPj?=
 =?us-ascii?Q?nMoj4xtaMAp3YiqLPJL9ALknCGPRsYuNK+4jI2d8Kr9Ry4WF9/UlhG229t9u?=
 =?us-ascii?Q?nntxZ9F5jeOLrehlanFoGYLkS8VETXDxHP1PO7tsv0N25wUxryKgwnTExNWm?=
 =?us-ascii?Q?n5tpGZD5KSzu8IVC6NKB1rZBxrqtvCo+C+GUpYtuYW1HSpccwRhga4l7KFCg?=
 =?us-ascii?Q?IjbhRu2ASQEcDYYbTGBLU3KkqeSV9PTeUeQd5+vvlv9YGdwf1RmMdi9QKtdY?=
 =?us-ascii?Q?CaqepxcJOFYEOwUGJp7hf38LgBfJ8so4BGzP9hynzu/yFG3OieDkqcZoUo0H?=
 =?us-ascii?Q?QrRXTEzmaP9V+eCMJjjZW0QjZ41WsLNY0BAMB6AVnmcJ/2sXKS7sTn9tOzS/?=
 =?us-ascii?Q?vGPNAJ2xNqOsccF1hlnMdEyc9lzTHWfeTro0N5BnyiKZaLo8ct2Lud9FjP8h?=
 =?us-ascii?Q?A+T0r/uNDdYUAn5N3Au2mNixHZ/fIEyaiXjDYWuzWh/Skf8FgX2kwqUSTkmL?=
 =?us-ascii?Q?HmXhn3Dwcl1PeiC0UFsDWTWThGOQC4+l/eJuHMej5udq5wrq3Ru2/NfMvVlU?=
 =?us-ascii?Q?5oSL6zwsHVApgccg+0QxLM3MNHLXmrNOtdwnzBx8O+JoY937bAL/3zdVHAHc?=
 =?us-ascii?Q?MYuFFwHSPTmpoZJRSEpcym0bpe6eEqD8Z9Uhq+MyGh7JMlIiIj3ce/gaMCcY?=
 =?us-ascii?Q?0J7oQJY2E6esv/u6/jMZ2ITk2rfXKZWItahOy7xXgbeLo1KvS5dKVCsdY3XM?=
 =?us-ascii?Q?i+MgsW30F+Blj+MGY19/y69eAcamHC5rntyLuxmyOOAHan9JOgfr0z9sBtZi?=
 =?us-ascii?Q?4IUP3uLbnWNXfMQMzayec+o5kCQYiJBeOaBKI/6t7MyvKJFn8Q4L2O3gLkp7?=
 =?us-ascii?Q?t6MQqfoa0ZSvyproQM0Qvk3mTmaQDqu/tI9TGmg6CmTbBPW1vK5zGhT3j+nh?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fc629d-9703-49bd-a638-08dc43195269
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 04:52:01.7022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZgFgxCKO+/PdtzjXc2hLujckJQP3AQXRxnpC/ihNGF/ohBPL9McHf2GKiWYWcV+0zEpbFk0rvOov72K09nqrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

On Wed, Mar 13, 2024 at 10:02:21AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Currently the tests are failing with OOO memory error.
> Test requires SRAM to be as big as VRAM. For example, small-cm creates
> (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
> simplicity ensure the SRAM size >= VRAM before running this test.
> Added code to skip the test if the system memory size is less than local
> memory size.
> 
> v2: Added memory size in the skip print.(kamil)
> Also added reason as a comment for the skip.(Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_evict.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 4de82c3bd..43e20ef6c 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -754,6 +754,14 @@ igt_main
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);
>  
> +		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
> +		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
> +		 * simplicity ensure the SRAM size >= VRAM before running this test.
> +		 */
> +		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
> +			      "System memory %lu MiB is less than local memory %lu MiB\n",
> +			      igt_get_avail_ram_mb(), vram_size >> 20);
> +
>  		xe_for_each_engine(fd, hwe)
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
>  				break;
> -- 
> 2.25.1
> 
