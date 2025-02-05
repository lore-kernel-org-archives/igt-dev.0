Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78615C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 23:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85510E22D;
	Wed,  5 Feb 2025 23:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyKCEhrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DD710E22D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 23:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738798293; x=1770334293;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z6Xp99dscGGIBgf8ITFAhDWZZtjX6ump1cacwvMgS9I=;
 b=XyKCEhrV17SCqOaQtPkFe7be94HaR3bA9LLpe7h43bA4qiMbsZsD7YWY
 OcTSiQPAYl3w1Wu0/oYDTRIX4vcyH2MyxQYPPRkwpix+mvPyZoOiwrt0v
 qX6fKo3L645Q2C72F+zXufWiQwCpF2DuN8Gsm0JSMzXkw9zfo+la7nzoT
 XkXdiOwMl6AoBgxaJ8cX5KgW7uKxXr8/VkoAKtC5BdYE1BKHCULWKdoIs
 IYGQLAAY7M0kyvRmxjmmD7N+P5iHH2nwjqZOAN2CMlXr0IkWBYM5W3pMg
 r039Bk4EthnkAETQBc4cOj3qLIK0slzf0Wx1PE5vVAT9x0pQs0wKLlGA3 Q==;
X-CSE-ConnectionGUID: RpVw1FxgTfuOMt7cpptINg==
X-CSE-MsgGUID: E+plW+5pSfqj8cfmdicMFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43309861"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43309861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 15:31:31 -0800
X-CSE-ConnectionGUID: WyKlf5pSTeupD9/w7m3t0w==
X-CSE-MsgGUID: dC+Z6JwkR7i+YM4dEIqnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111626457"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 15:31:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 15:31:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 15:31:30 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 15:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSkCB0Y7gbltRgJIK9nJrdS5TZzSHDRGfTcm0OAWyTH69T2W/3pJqOV1GlsbWiGRBHLKVm8tGqkVWlkSH8pRvnN02w14qNxcMwJ8bYBENwQMPE70+d9+jlQYQMZaODtChoJRoX3XApA7RSODsZ71poJ/iZv/mS8bxEXKbZSa1wbg79sARoE4i/v5QU9I4uQYT4J7LTfbfg8nXS03zJQ4J/UGPNweMFnAro3Zs1xP+pLDs5zNi2j59X4IpYM5LqSwyopyJ8QwA3ctf6n77bF6GsYyrYr/jDXUOhIPr1sfzPFO468soDhk17+bkeNdGeYqK8vlFdQWRk6FTZPiltxhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zosNQebq6cURIXoPlYKA0CfSY77ivjfhtP8NzjlA6w=;
 b=Lm35Z6qdN8q1ljKxOzfIU2yChJFQd04NYklH0KNdXV3xUj4Ur1oLKk4NPlT2ba/hwNBLnU8UowUXfGP3PC/2NLOHemNZQizC9tST7Z8VOQZ7dBoBEMeU7JoCsyN4HYhbgFqAp3NW2V1pCBknoZs/fVdzSSiGIQzLMBvZJ/oC/CuFYuZ3t5jaXg2bjiRpkOZ6jdtub3Bx+HDnGnnjVFdwrINMkrTdkuBeGU/+jeyYrSK6JQzFHr0lX2FpiF/6iDNZ7Dhsq4/QsJNNaRJ/SQnx+RNf4gWZXB7iJo/r4xxXUVtPsu69WIcxmEUuYgejlVfUzjNpn6y4363RlYcp4aI7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 23:30:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 23:30:58 +0000
Date: Wed, 5 Feb 2025 15:30:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204175302.18147-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: edc0dc77-9dfa-42cb-c949-08dd463d248d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9K9DpepDmnTLIuqVvGhDSgjQK8y3vEdMNGxdx2XGmxOz3t+4m8Czax/7g1lK?=
 =?us-ascii?Q?3NnQcMTmy3EnuxsNIhsyAlfBksfdpo6mTiVv1OgBd+1iOBAHQj7Lf7Ez69vx?=
 =?us-ascii?Q?4+TOosaI1cLz9u6y4ghMYORhOKcDENfUksdi0IC6Ug7fGfxmAQqdIDze9EgC?=
 =?us-ascii?Q?pvrISeIWFBd4Q0R3QLOTY94n1fgPYH451UZGoZ5jNl5AMksdc7amqegndT1q?=
 =?us-ascii?Q?YCudEVb3GfNypLQho0IgMsFxpRiz6D29VwF0qU8quKkWRbMlAo6J1x2BH3S1?=
 =?us-ascii?Q?QcR18AP9JMVOAJr0eznmJ6BMMT9RDS59x0TU1UXckOM/9r0lPucvcdrBPsPF?=
 =?us-ascii?Q?y2JroV7POCSzkGwRRDhOqcsEjYu9VomDvtMKEut4S3/eJg9WJJQJTq89UM7V?=
 =?us-ascii?Q?UAFtf1Ol+ke5g622xb0IevHbIy8owE11sI+NPhY9FfH8b6s6M1Lc+OS07CmO?=
 =?us-ascii?Q?1NGq27Rfo79SUG1Dg4j4yGcweM6vt7+z8bZR0ftwadgqLg8XFN6p4kzfxMKP?=
 =?us-ascii?Q?hoLFsHgpNL7Cla+vRYnUEiUgFNbVgVdy9qjAw6h+yHhsDIv1JlHLbi5avo2K?=
 =?us-ascii?Q?bXREPH5ID+Kf6xO80vWCdje7W36dSUZrJ8oD7TM5eFIlQSfZFOdkhELXO4RV?=
 =?us-ascii?Q?SSiAFS9hAxs0LHG4YkWfd5NcZSZUxPMXWNBPmFdzOKwIFgfdOMtlWZf0WLdN?=
 =?us-ascii?Q?/7R0EH/lNe4G6Ir2PWNeg1f6W+NBgd40pckUOdAJM/Myb0qnQ5hwmnY0eIhC?=
 =?us-ascii?Q?0pNEvSlrVd3jcNFXwfy0OtOyTvslIKdUg++4JL2BLberz+Q9wKL9w+Nink13?=
 =?us-ascii?Q?b7XSvKHAk6EKecN9+QdNkpkNCY3lEIiwoNFkB+mcmsyKLFa/2PmrgS2Dacqd?=
 =?us-ascii?Q?dlG2VFcbBxCD5rjHaHden9K0KtAWgupeyMmAfITa/3/pQF/78zQP7ppxfSC8?=
 =?us-ascii?Q?wk9VEALvn5G3pKehdowZinK9+48leU9o8FrXHqqurkpldjyO7JIto4dpYmZs?=
 =?us-ascii?Q?NiV/0abKllBwpiO4SLTltaEKbWfoCbYE8IyBdjVmcSnYyqOd+9CFV+X/2DYS?=
 =?us-ascii?Q?5vdH9cwOFfLbWGGmsTNKhA0h4My+K5ZSl5SLPmTvS7mnBnhrKflmd40GAhRd?=
 =?us-ascii?Q?QBhBVoMERFIwYtYsIIKxjhTBmHyIEeYSA5N6ZpxagibrwfFeevB1INK0g7fz?=
 =?us-ascii?Q?PciXJyWgf3IPZJZYU9h1voQicqgXdlsb+lBbZ5vVsujuPjbEFDfbsgkgWuO7?=
 =?us-ascii?Q?eat9ccM5yQSB0IAi5nyXkG40fZGqX6uOIZLCb9Lc+3/Md8CJeR3LX1EBs3im?=
 =?us-ascii?Q?8a6BZovtdsH/uZvRRz+JCYipaQ+YCOEmdE184cUNmql9JOaAA6V8akc0WBlu?=
 =?us-ascii?Q?KVtktbarwfFGSJ17gANxdtZoN5N1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jb09/t37R5lwR2N8JhIZYliHGXTPM3SueyeuhyhzDhY2HhQYpvbpPARZI94a?=
 =?us-ascii?Q?IMZ2NiMRpCmLVB5kYti3dHnwqsrDjUnqP9feKy8RCBZNQdxnIIEbwEaH4BVJ?=
 =?us-ascii?Q?rOeuFrSMrDToUlHcVxGsCJnLVPhd+yzhzlMW7h2ymzq/I5/iARm1ZfdJBwlh?=
 =?us-ascii?Q?PkNrLAL2I8mxI7XWS4vis4Zfz9VCZmb0eJyV0yayKNXu46GMR0rmR+gAQXPV?=
 =?us-ascii?Q?UKvxoNrqiUyJkDwxCKJov/qlPannLKWj5zaGJnIt0ipZMWPXK56lY9Cp7Wa0?=
 =?us-ascii?Q?bosHY27d35aHvT34vM+h/IncmGdnKue14NXdx4MHXCaitKEpK6CruTSCxJhN?=
 =?us-ascii?Q?WvUv7BkMX8M1GnRQ/Xh1MJCTQhr2bs5D2Xha8krOPpIe4GWkQfjbnVeIX0nX?=
 =?us-ascii?Q?O/Ea51X9XQCtofmBV0WhZqEozYXlSN4jAm7cQGG6WkPMfp/f+meCx3BV/QZT?=
 =?us-ascii?Q?DP6yHKUClHx7eUcvQWxLFLwF1G1RerWoKizkbMih4mbF8yO84DG1DKl/aXGq?=
 =?us-ascii?Q?JqChkcVcpIh0zb43zZK6ZaSplmJ8ourSaWKdDI1hno8lRkwuyrCyVpwCCdyi?=
 =?us-ascii?Q?DTE4IWvcrXq+XyhShcvpQdy9qGFZHPIvp0EtafoIriPx4R4uIMgI7pl/IANW?=
 =?us-ascii?Q?orTdSAug8P2YRoZIx+CnbM2Il5Cg/N5YrPSHc46YAS3Bi7PlPxZPEKwyz96N?=
 =?us-ascii?Q?fdZjbpX01wrJpfbgdh78HHa13a9OqRzgDvyRh/AGzt/DtpkZlQix+/zuH0QA?=
 =?us-ascii?Q?Gj6AJEs7cQgGFhFfhEb/uHD4zfxscRgWOqfSJ4URkjl1GVpNsgxGgp2YX27t?=
 =?us-ascii?Q?eveoIyeMyNRYaPA8vCudRVZI0kzrNABFtQegWbp4TS6dLsVLLt2vDIIu/K9C?=
 =?us-ascii?Q?TAbIPrzFh31RftzLON6AQEAU7Z9Ky+TbR4x5jR39DLcIowwBy/ZeJpCNldgA?=
 =?us-ascii?Q?yfFpsOgjgkZtWjT0A9J5Ea+SMjkR21VP8Fq4y2X98C+D18h7fRWcDeiCpx/7?=
 =?us-ascii?Q?IiRowiqa6mJ03bpziNyZ8TCzq5q9EtH82CwPGiTBCswnVxVkfRWbrAnX331H?=
 =?us-ascii?Q?Qtxo5WfZiAWOAG1Okhkd6eGyeBPN1IFZABR2uFSbJnBqotkz0KiEoJI+1Ft5?=
 =?us-ascii?Q?9IakQtvzpmlGrlVMLEuzTtweVMTYo/6Ycsp30DfrUTLVEcxCGI4s6ewvyB/F?=
 =?us-ascii?Q?ZKwcSIX/OVkgBXtCv6jkU67etO7qAIAadQcT5PTSkPvjGaNb+Y9iIlsEM+QK?=
 =?us-ascii?Q?1yUTX/PVaYYVys/Q25Z92vEnjJJgajKWPa0FQPteU1oJCtAwK7xEmv6FQEg4?=
 =?us-ascii?Q?tHaBDo3mvxBw+hFzn0fX4C1s0WjT4U8lvGOMmBw1MHmXjQ+Ezop+BHIf1iad?=
 =?us-ascii?Q?Ca5YBoZR3kRZvBNGPqH7S679YPf0p+bKcAw49eB6anKFtfxHQshcBf4z01HM?=
 =?us-ascii?Q?nUskj2sQHpXTGxfn89xFuzCORb1YQmDbmmpl4SfVIYV+JuC7iOvyyhLUyeAf?=
 =?us-ascii?Q?7iuQlNnwrJvEhoBg1BiEh8RM+hdfpU6rf+8zg60azOFQxeu1kQTLgm008ipd?=
 =?us-ascii?Q?la1wqsiGcKEN2oJpAm0K6H79oGBSMb0/LP0Q7FTc/i6tmv6vvomHcpV0SXsG?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc0dc77-9dfa-42cb-c949-08dd463d248d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 23:30:57.9012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKt59LcNAX+uqvGjH9EbLbX8+v4/6Ez2XcHGbZRkdHZfaKH/8vwibNkbow+gM4TYjSZ7Bcg/Gbw6KkeQUmqMjR7MrD0BYYiewGbGVwbFeYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> There have been several changes to pciids upstream that need to be
> sync'd into igt.
> 
> Sync with the following kernel commits:
> f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> ranges")
> e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")

The updates below look correct (they match the kernel header), but the
commit message here is confusing.  IGT updates to this file generally
specify which actual kernel commit you're synchronizing against; none of
the four listed above match the content you've copied here because there
are additional changes not present in those.


Matt

> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 23f349f65..4736ea525 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -717,37 +717,66 @@
>  	MACRO__(0xA7AB, ## __VA_ARGS__)
>  
>  /* DG2 */
> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> -	MACRO__(0x5690, ## __VA_ARGS__), \
> -	MACRO__(0x5691, ## __VA_ARGS__), \
> -	MACRO__(0x5692, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A0, ## __VA_ARGS__), \
>  	MACRO__(0x56A1, ## __VA_ARGS__), \
> -	MACRO__(0x56A2, ## __VA_ARGS__), \
> +	MACRO__(0x56A2, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BE, ## __VA_ARGS__), \
>  	MACRO__(0x56BF, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> -	MACRO__(0x5693, ## __VA_ARGS__), \
> -	MACRO__(0x5694, ## __VA_ARGS__), \
> -	MACRO__(0x5695, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5690, ## __VA_ARGS__), \
> +	MACRO__(0x5691, ## __VA_ARGS__), \
> +	MACRO__(0x5692, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A5, ## __VA_ARGS__), \
>  	MACRO__(0x56A6, ## __VA_ARGS__), \
>  	MACRO__(0x56B0, ## __VA_ARGS__), \
> -	MACRO__(0x56B1, ## __VA_ARGS__), \
> +	MACRO__(0x56B1, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BA, ## __VA_ARGS__), \
>  	MACRO__(0x56BB, ## __VA_ARGS__), \
>  	MACRO__(0x56BC, ## __VA_ARGS__), \
>  	MACRO__(0x56BD, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> -	MACRO__(0x5696, ## __VA_ARGS__), \
> -	MACRO__(0x5697, ## __VA_ARGS__), \
> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5693, ## __VA_ARGS__), \
> +	MACRO__(0x5694, ## __VA_ARGS__), \
> +	MACRO__(0x5695, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A3, ## __VA_ARGS__), \
>  	MACRO__(0x56A4, ## __VA_ARGS__), \
>  	MACRO__(0x56B2, ## __VA_ARGS__), \
>  	MACRO__(0x56B3, ## __VA_ARGS__)
>  
> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5696, ## __VA_ARGS__), \
> +	MACRO__(0x5697, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> +
>  #define INTEL_DG2_IDS(MACRO__, ...) \
>  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> @@ -782,9 +811,12 @@
>  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* MTL */
> -#define INTEL_MTL_IDS(MACRO__, ...) \
> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>  	MACRO__(0x7D40, ## __VA_ARGS__), \
> -	MACRO__(0x7D45, ## __VA_ARGS__), \
> +	MACRO__(0x7D45, ## __VA_ARGS__)
> +
> +#define INTEL_MTL_IDS(MACRO__, ...) \
> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>  	MACRO__(0x7D55, ## __VA_ARGS__), \
>  	MACRO__(0x7D60, ## __VA_ARGS__), \
>  	MACRO__(0x7DD5, ## __VA_ARGS__)
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
