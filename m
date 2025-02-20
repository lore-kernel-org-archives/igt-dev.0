Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D9C021B2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 19:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2910E061;
	Thu, 20 Feb 2025 19:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyJdRQVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60B10E061
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740081360; x=1771617360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2jd0UxhQQvPozW5UpherKk3lVvAdVayangRgWILpxqQ=;
 b=jyJdRQVfkROHNy2PsT1hwiY1TVbtgBEYQFnY5QmJ/sQUNFFn1xQVlceL
 YEx7d3odabipo8fqzeG4s6SrYIDw71Nq8cTT63NA/1KR68c1Bsuo+L7/v
 mTslXVxnU5OSx64r+az2ytsxnDOLCbuAYZB4MuLPOWOmvEnBBbNoHyJE6
 oFN8r/cPgVHTV2nPcTjaduOlrSymx9fnbz6lI3BElJnzFGuF+5WkUMO+g
 J5jNyu2E5jFqUNlXF2pnJ7wW6Sx4BZD3qPEZ4cHDxGSwAvwLK0p6oiXMt
 np4ELHva/JtwQ0+Etzs6b58tR4PTOr66L+JY3biO1q58LqpLuoMyFdi2W Q==;
X-CSE-ConnectionGUID: T4QinqBtRdyPKJbFBih6DA==
X-CSE-MsgGUID: D/evYi/rRouc+qQcp8W1uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44528690"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44528690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:56:00 -0800
X-CSE-ConnectionGUID: 7Yae63eDTESFaiAvTjoPig==
X-CSE-MsgGUID: sH0Q5yivQfCCwNLCodbaEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119258821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:55:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 11:55:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 11:55:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 11:55:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWMm/4Gt/AyQI3ESl6/+GXe/KPI84R+kMeQW4DVzVouDwjnNdQJBOGdXKBH0uZklEXGqxsc0RNFRR8mHg/eO7hPNe6ueq44KAxY37iraY+rUZJMqRrb86aP3T2i9F9/idf6soAYaOcElqALHH9+EWR/0/IkS2v8YsCYnO8cjkevVzoK7TcRDaGKmm4xHaVbLEmm6CCuwYhP48PbNhv4MxlAP18XeS7nnl4z+GAK2E+OX8ruPo8fqKOwt2j13EyUSkkL2aWqgUacmR0GMnP/6GXtpuckoPIxNAbdJZVKnmTSragipevsLWsFC5Ks+uEr+TlzKL/KtADUx9v0oRyAZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrXG5pvWzoocjusgYbfAnuhaY5n4OjAi6+MQnet0N68=;
 b=i4MfKNyiAv3Fg87vDu0av4QFR0eOJ1/gP3u+M7gj6EbXcBvXNtk1Cvu0U4qd+oVM6qjsA5TMmjmmgzDfLY9deJbh5pn/G+gVQ2sO04uVvVyoT2qIVbjgg/Sm5TBx8YOdZurvAYyuVgHJC22SgVF3NlHNSMGJLAjV1wrw6mejjIA2J+zUk2riavgxNTSsuGPQ9sFPp6oBKs9ZRt6BsLtWdEdpqFRIKUulINEPVelZSzw6CodXSskfJ8zjkFJ3cz+NHNKS097+G3xhXTxiDs8XGLt/3TApYze0sNFFb8mOLGuv2fVVA8FMBCPiBCBns7lA+TKhJKqy9FJPdFKp/H32pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 19:55:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 19:55:55 +0000
Date: Thu, 20 Feb 2025 20:55:46 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_fault_injection: Inject error for
 xe_sync_entry_parse
Message-ID: <Z7eIwhjplr2feVr8@fdugast-desk>
References: <20250212090448.3068963-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212090448.3068963-1-priyanka.dandamudi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR07CA0159.eurprd07.prod.outlook.com
 (2603:10a6:802:16::46) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6998e472-51f4-40d8-44e3-08dd51e89632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rz4aFDfeB9PiueBMJ2z0+atU59O3b6O5tW7iaZUVCrkwF76TaWwtfx/r5t/o?=
 =?us-ascii?Q?eNq8Z8o9u1MmKU6EQznH+PdfWzmpU0a++KGmbYTfVCTei+XHck5814oAS7CZ?=
 =?us-ascii?Q?81Rt514KkvfcIjEaemw+JtswltVa7VBgZ3Ds1n2UJjInuRvH3xEww17XsxFt?=
 =?us-ascii?Q?gUCuU3pzzL75wCdc7LL/YEC8xD6J3hncd7uOMxNZR9wPL0jFE+caWVb0pCeh?=
 =?us-ascii?Q?lt6FmRnxJ8DaGNG5R5eictJKrEwpCBYK9BwOlt4CpfSrYQtynPzAXyVP4jNo?=
 =?us-ascii?Q?KCuHcJ+oiDQdsly0zBLgSPsyx2GeMVPPZgP/a4ddmG7FzDqgOqEnDpPZEk/a?=
 =?us-ascii?Q?EuzWHqKO9RQt7uP66GtqnrvCiIHUZKH9AVyIMDWHJEsLBogGKD4fY55MM+EL?=
 =?us-ascii?Q?pS+5qwIXE7K+IpRHVwZ+zmsMHxudVqS8LlzrpYg3Y3nXGRW0VLTi80ZuD4yc?=
 =?us-ascii?Q?hd2YxmkIoyPs1ngCg9+/xfPRBzE/fzGgEcTBrbl8edAF/gsUwAxQrirRH6f0?=
 =?us-ascii?Q?2Y2jgDNQJ/WLAEAi1yzLS3No0Gh+JABaQu5x1mRW//1iP2H4Ql9s7td0Qg8o?=
 =?us-ascii?Q?91/wuQ0vO/bkP1MwpRy+bJbmgiPTX/US3j/lTJTvl6ysbWXFl4XVAKxyn9//?=
 =?us-ascii?Q?niPGGjK6hZoZt680ZZnRY6d8JXaq/6PVR/L6tWlxVvXa57AZR0f1wf5T8kH7?=
 =?us-ascii?Q?+qHxqI6xn2bW+b2NOeqZLrr2Kl4Q67apmO3VIyxDkj82IjGaWfyYr/XnAzjY?=
 =?us-ascii?Q?08EQU4k0cvnvhYRo95Y+hK5UeqOCHiwh1IJ61e5OOv8XC/MFgzWzbZV/4/xr?=
 =?us-ascii?Q?wHUvXqjL0wiYaeBw29oMfUnTzUz37/SxV9wyVHCLHIP3gx/Wc7p1RgkD91F4?=
 =?us-ascii?Q?BRshyupZrfhpJIzvjMOd3a8TSA6upf1PLOCLobV9k+fHGZXdNBwj2lqRzBP2?=
 =?us-ascii?Q?1I4pxCHqPC8cd47U0iP9K+Fx87WGt6RTx7470Jfx16e7h1QgevfNJmnUpEap?=
 =?us-ascii?Q?RrDTE5VVaInKuxNa/dA0GHSolqsBaCn5XlEy7+c+0dzkP9alIbxyxJr2lN9X?=
 =?us-ascii?Q?q9w/YMnpP7jqjq9cWEbDzeneMgeJZva17f1iDzo1c54XZSkKhNSR0dfnqdpZ?=
 =?us-ascii?Q?2jTPjvOQ2i8p1dLfJVZ0xCizvtJLMenrQXsu+c7QpA6YKUrGqya541gizzy2?=
 =?us-ascii?Q?EEHp2IQF8n4HCPpxTdZ9RgzLWT8sdDqrMYCbAmdA8ON85lzBuoz8v4iQrnqY?=
 =?us-ascii?Q?7yESyhoxpQMuslM81D8eUS19hV3HEnOUpskoQUMcnrbJ/zW56mMcvTht7jsG?=
 =?us-ascii?Q?VtMGGvuDrWPc0F0acJ80XADfcB7cYoRSVkPNvp8fSO/Ku6fv3CI6re6I3Gfe?=
 =?us-ascii?Q?xYxUU5T1W+Hn1NAJpH/6ThD1Y4VT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/DlDFOxPkzgSX/x2RuWQ+cuq40oUP1U2rG3BLZA7oPCbM+Y5E+yKJQc8Orn2?=
 =?us-ascii?Q?/i608ho/YXRTeK4pL6oAq9vawwjm9MRgKKx0gbSL2KYI6AykjFeD9VE2l+cc?=
 =?us-ascii?Q?w7qUGegzuoPa45hSjLo+8SDv18tRLPuEJkY6Bj7oSfHYHfEvZS7OWXii0UyE?=
 =?us-ascii?Q?3QNij7aAu7EEMa6t4SU2RhSgoAXR/JEOJlkrT772cJ+wbzJN6eFx53lHG0+j?=
 =?us-ascii?Q?L0RQoCwum5vpx2vr+GDAmHMYcUADvgpyTLBMVMRdMyXuBIZmYNeCHXuz5yDg?=
 =?us-ascii?Q?/S8ldIFoHrVutqIbb9hHAvgmfepsD5UixvqwChkdNGdmBYfpL8E2FolUAu9s?=
 =?us-ascii?Q?xqhuGrUIVeD8Cg2DjGGqxt5BeRPxOk6NVzUBtu0og5PrVDsi7Z8Y5WTE7PGB?=
 =?us-ascii?Q?CEJJN+Vz8ydI7OdGgcqp8USkWh3L2BedB3VrgTIlCNoEZ/3of5kiItkZxlNp?=
 =?us-ascii?Q?iEqVeuZav84vZpA8mc0eXC6148USdA48Cjl1WcZFRNJjGBA2ENuCm7nSAMj8?=
 =?us-ascii?Q?E4KZ+9wTCiqV+gLN84mKYwnEEcoIezhXYIsS4ggFkot3M0afZqQJdzPl2LXE?=
 =?us-ascii?Q?FJNpBXGoOyYrEnQ86k3u+z/3QISW4eZQ0JWq6Urmf25qXHRKRlkFFtbuwbpo?=
 =?us-ascii?Q?mRC2daaTLw4/baeDgYGf0ZUfXpWE9HL1ZBZpBaj72uEtN80ocLFkJYZc2IUz?=
 =?us-ascii?Q?3Ulp0UafAmUqll7q65oT8mZQOhDQ7PgwIptqFSPlYyTcr4gMhqtWB4pmDkwF?=
 =?us-ascii?Q?xHHFKBAgpOqCfKovc2Fx8d7bQ5OM7LA+MbgAUOlUsY4BUBF9jFNVOzZfwCMy?=
 =?us-ascii?Q?LTp3cHUkKp0hvtT4+y/lx1gKN15HqcyluTVpK6f2TF7/n4Y0Yv38sqTJCv5d?=
 =?us-ascii?Q?A1oBGBhFgq60yJ5M/nWogrKNQ8+mg5EkGFLAgd8TKQocslOgOyhykSZxasIE?=
 =?us-ascii?Q?h/Fqxq7iJyHcfWUSru7OmGGIJ908/9n2wysv5R4CAoK5LqrOV81v38leE3YI?=
 =?us-ascii?Q?tQzog38JL+hxbnDLIOZILZqzS+duwYGlfJxOtl3/KPjWPmP2tvsXFZuYCGOJ?=
 =?us-ascii?Q?SaQDMJh2Vy71kNioLwpERmHtuy+rRW+hPyV4D9y13RYdhuxt+yWr87x8luiD?=
 =?us-ascii?Q?8aTjbGDhUED4uhB4eSQFN++kmqRRyt8EKv1TTCbEBKyuPvgmAWq2o5ESz6Mp?=
 =?us-ascii?Q?12fiHCm6J+Q6EeqE73ZLjbO2gCvxgeeNPwTfcKyERMAVIH8Mzsy9ePwb7uqs?=
 =?us-ascii?Q?uIcI3g8vEDbY/p7UengzhjXoa5HNtx1ambWWseB/3RUKMlSR/x66ayCLmW5W?=
 =?us-ascii?Q?8Gxkwg1VUb/rP6Ut09X2n22ETkWJ1eGy5uAfTsBOo+6kEw/RDWE2+sPnsnMB?=
 =?us-ascii?Q?kT/Ph6h7noTxomhNczMHmFJKlyAvtTvhiWOv2kSxiEKI+RD90Icp/iluCkC3?=
 =?us-ascii?Q?lji2lzT3olMh9NA9Ve3Ut04HPjEksXhdgNf0Ttenrikrl9CEp4UiVorzgfsE?=
 =?us-ascii?Q?Y/68LQg1LaH1dHFa8RFRbuqfgLfj1CmD6Uo03FsiAwO5JhqC+Z476LO/Enie?=
 =?us-ascii?Q?McMDNnEv8htQUnIX2ZmfWNRID0zC3vDt76TP4RuaHZSYKEBDpwW4cwzwHGny?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6998e472-51f4-40d8-44e3-08dd51e89632
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 19:55:55.1710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNzzHC+cuMBK4U06N9KtdyISWsWI9hd47U8Fa7O4SWiryQPddEVc142zvamQmZAmDzcNcPNvsOOYNS9VJXpVT/nwv08mICtIHPoNDB0TPEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
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

On Wed, Feb 12, 2025 at 09:04:48AM +0000, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> This will make xe_sync_entry_parse function fail to cover the unexplored
> path while executing xe_vm_create_ioctl().
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..ede483535 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -263,6 +263,7 @@ simple_vm_bind(int fd, uint32_t vm)
>   * @xe_pt_update_ops_prepare:		xe_pt_update_ops_prepare
>   * @xe_pt_update_ops_run:		xe_pt_update_ops_run
>   * @xe_vma_ops_alloc:			xe_vma_ops_alloc
> + * @xe_sync_entry_parse:		xe_sync_entry_parse
>   */
>  static void
>  vm_bind_fail(int fd, const char function_name[])
> @@ -315,6 +316,7 @@ igt_main
>  		{ "xe_pt_update_ops_prepare" },
>  		{ "xe_pt_update_ops_run" },
>  		{ "xe_vma_ops_alloc" },
> +		{ "xe_sync_entry_parse" },
>  		{ }
>  	};
>  
> -- 
> 2.34.1
> 
