Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3DBC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 19:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89D610E079;
	Mon, 17 Mar 2025 19:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMM7Ia77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFCD10E079
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 19:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742238429; x=1773774429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fqMH6PdRIoEbuFk6WiqEcObEVOtRp7oFftfPvmCEP3E=;
 b=LMM7Ia77KBschhEsSdMGIfthDzf+5Z842YNYMibcI8B3PDib2TzSb/Nx
 +AFB3HH+ts5rMdN6rVKyj0yYub9WZFNlgIXVvnKswKjanOj7u+kbwAQ0c
 A0+rVQ+NJ/ZCyrqT/+PHqImk8EuDlL/XqKr1OmQ0Q5V1e4sAsIzYNho9G
 2s+JdYplQ2OWZXwA8f+29NQty4vNv9u5b1v+V9d1LDqnVQrXLUwDQjRIh
 QS/zjtl29HJBT6rLxaK64VfJreyCckNjzSD5Qn/StG2Esl+pigcq93BqQ
 0lyVjhoM6a8ngX+emccjQ+nxm07pqmJ8a+7elDaoayH3/zmIYvzkBOpJ+ Q==;
X-CSE-ConnectionGUID: P481oPfoSHCbjtZqdek+jw==
X-CSE-MsgGUID: GkIa/reFSoyTYVj/qjV8Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="65814453"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="65814453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 12:06:56 -0700
X-CSE-ConnectionGUID: 5FXgP7ebTqitNvESXJD6Wg==
X-CSE-MsgGUID: rM+EsQSQS927JjbNyQhHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122979932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 12:06:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 12:06:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 12:06:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 12:06:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAxrhb4lDS4Yei79nf5BhiaDkaad0yYSTe/hnRwkS4Ui3v5uQxU80SMq9kylrX/O/wjkHcTCa0u8V7zpZVxWp1FJw3vxmvhLZkKYtcBVG9VA7nzb8h0azYRRUn7SXR4znwku75h1xZ2HneHXYlTDSVAJGKGSyiouLUwFlME+pRNIboiIiGgWfBaBvUlaAjdQo9KcxaVv+4Zyy918eWPlvZeqoWW5mq8LIOQniDLmENCRcBNsTlqR2np2H38Lwr1bUqVFUkW75PRLlh0NL5ZXS0thPCMOtO3Hrnp7ICD0JjQpO8E+H95n2uv/U+ULDcsiO4cjT52idkLDFPnJhttlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ9lqHdn0dNyL2xZaZHqXICN5aTdSLz9miXIXxPl+yc=;
 b=xV50mNmvtOm5hjx957wN7XrqvAW+T4Sz1y/pp8boBw5C9a1gBW05ZY6VPlc6CIls4B9aLy+Oe0Rcd/HYcksqL+4jFF6uG7kaAN1g2RI8dD7R5OeAWswkIG/X2lDXbsVCRWdTkgdLg3a5zdnvtumUuekf9I5chXQZBmiDF6mJkjxikVt7a4NZJ0VLXGrTmXk3GtmM8GpJreFcmEJ4PF4w5urdeN1BREhmMwrYzp1Vvt25V2hbwRFxFFQmmHQFvQoJqcK3Vbl0BJCXT4r+1qXRzM9Pdj4yXbHXbJNZflaHo2J8hTahz7xKMq1VTh6kb3QKmHuV/I10rqSbKdSZtEfU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:06:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 19:06:37 +0000
Date: Mon, 17 Mar 2025 12:07:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>,
 <ashutosh.dixit@intel.com>, <juha-pekka.heikkila@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [i-g-t v6 4/4] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Message-ID: <Z9hzA7jrIrwt7Ayp@lstrano-desk.jf.intel.com>
References: <20250224174010.594192-1-oak.zeng@intel.com>
 <20250224174010.594192-5-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224174010.594192-5-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: e5784f6a-3f26-4edb-8b9d-08dd6586d7a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jggfm+DXcRMvqTnOkY317mTGoIPGDpRKwA2tsxoTpRNwYstjj75TND5jMSt3?=
 =?us-ascii?Q?+n85WF2rZep3IjX/V996FNOJ2PpIsipJ4INLtkIz098sTqPXMnjZc5XveJqQ?=
 =?us-ascii?Q?/hCreI5sSrIcVnoGKUgFDNCn21aAEe7gpw2TUDbvUHrZESojzrHhyGsLz1Yl?=
 =?us-ascii?Q?aOHBJGSe02PTFiamrGc/lQVZh9MLp4ctuV/bL1vEXzcKq/4ys/aUBVtM0AOV?=
 =?us-ascii?Q?XTpGYOgrLd0a6DDYZRbf5BYRSflmEoyddtNtzNZ1CVWCVyCEilqG9FPxJ7JU?=
 =?us-ascii?Q?56cw14eSNuanCJDoiCIv1Tsd1VnlBmew7ZvI5bBIyxaKy7DssfuAt5xbpxED?=
 =?us-ascii?Q?P03KH5ShRqaAxzAYwroh844Ql98ND3ZSmPpaEJt92xdKUJT5rkbL3NJmholS?=
 =?us-ascii?Q?9hgjwKHin8dcBlp86pmTZoLl+8UiNTu3eLDL2llaLXtTZROUE/fRn35cQHte?=
 =?us-ascii?Q?N6zFOcPKGv8UZIY6MBM3bsn/H2apxfYYQ5lNPAXU6U6to3K4kSTK26V5b2BA?=
 =?us-ascii?Q?Hxv/vhZNWCi7vDflWqIiHNTZFZgkjsiptitJjAHlIhBzicFdUiDg+bcxk4Da?=
 =?us-ascii?Q?pQILWjtBsdcIRjrLgBdbv+FX1NBaO2EmUmyfhqErXaNM4jWIrGl4oU+9EPjM?=
 =?us-ascii?Q?ENLRtdN0Ncx9tdtt/H3+R++8vYlQAMs82L1K2EHi1z4PuHtyaKqSj230tEKO?=
 =?us-ascii?Q?IE/mat3ebBUCX8oDEDcxWQ/SWTeBhrPsagJtjJrj9Oq+4eSDi1gFnfsymkXL?=
 =?us-ascii?Q?Q4dtcCORok2eWFbhSMzHt33GohAzXNioCv0yav/h1/dUd3koLoFWuzzlUuod?=
 =?us-ascii?Q?yD+cQmWG7EPCygDfsKcyu+zEpp9q8AVH3JBEu60/WxWt/e5+0YPMB3ODSKoq?=
 =?us-ascii?Q?58TvDbfOysuyqNkShhI/sGse4/T10+ATBnJDzMyBQDQy8J/oDuydax2FXWTF?=
 =?us-ascii?Q?oEhjvEgHHPidyGmhmFmZPpq+e3RW88F4MH71N4nJciHDdeh/R8jScAY3gsp5?=
 =?us-ascii?Q?vtO2Tva2hr3G/EldDz5DIUAbn9nhBhdpL8ce60yksoEglwVRsyeWRB3crshE?=
 =?us-ascii?Q?LvQhuQW2n7L4xK9lBOkt1RaCl2JsV2g89Epfth4o1uN5e0LUVzi/VUMSoa0P?=
 =?us-ascii?Q?+BSg3kL/s9DO8y7uRZny9JYbJPq/DqmWQipLnx5AA3UANAf2pMTqf5UiJzlM?=
 =?us-ascii?Q?WUI/AnTbYCQONFa3hAiqKi2lv/iYzPF8nSu8LlK8TpiHGGJUEYUMKeRNm7PM?=
 =?us-ascii?Q?E7xtEz/vgGoBPa5Pcl8z9eU++Za2iL9HiM2jIZjtRnuXSBQPmizkCU27rzWu?=
 =?us-ascii?Q?Ym+5Ko8Y85piC8hrqUXCe8xoI2mnfW1Ktj5sXvbrFEOdUbd7aNUljhib8WQi?=
 =?us-ascii?Q?uTk1mO/Um1X2CgUOBWDG6M0gnXjU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nqJwp+tZwR4yoGIs4U6MzJR+ruPzeNrC+zyDHgcrkAEevVzS9DdM3Iyvkyo?=
 =?us-ascii?Q?jo+u2R0NlWIuJ+ow9MHRdZEbc2SsJaqocAlw+0mWy4k/pNGc1CU7ZsX+rpWC?=
 =?us-ascii?Q?yqkgU0fuLADc5NBeBX+9D10ZxRCzocHBx+RPAIwxhVsfrcuFec94/ehs/EXk?=
 =?us-ascii?Q?/6fUyS229OBaACDictf+VOAQJr7uNfc91PW05p9upEMeDZugzjXJRQEh5cTf?=
 =?us-ascii?Q?BgvHKKLtyyC7j3sugou4vh8b7xTHYr+oW8LPnmT0lgcrtU1IISvH8rHsrxQg?=
 =?us-ascii?Q?2xkYucjoY777/KEZyy2c7pife9HrVAbScgIidwpBRTrzarw7PaFE1jDcihjp?=
 =?us-ascii?Q?ULzQ9nCpyh4DQBdpAFTGCzS2OS0QrseLjYlmP9UBHhBgrXGN6lY2Vpkg6dTH?=
 =?us-ascii?Q?+qD3jvLiToLxAmTgD7P6J3SAP1LFVc/vIAFDhtD1O16XkO8ftd16mJAYZc0e?=
 =?us-ascii?Q?ZI1CsNX+MotRmrqBvg687a0r2q5jlLgZC69rQLYL9Eh7QYuTd4cqVsPziTJa?=
 =?us-ascii?Q?Pe+px0R4ZPAmplDYewQH8iMYlHx0Pj4W/pr/muAOQxQxD16ettizPNJsCWHa?=
 =?us-ascii?Q?8/EPj7b3tkSfadtRZrGUGhAVNg4/Rc8ZDTouBq9KTB2HDRRlK3VfXFf9Zl7k?=
 =?us-ascii?Q?QUAYzCrVST24j/czcwgn6ZxdSQNxzSnln2QuRw50tqlabS6ZaKWp/smrp+KR?=
 =?us-ascii?Q?QUuoPjIx91LAdsueN+UvMXtrT8wS6CQRjoM59Q6+2AxisC1dASWWUGh5+kPP?=
 =?us-ascii?Q?s6/0ZZFyw1NGFBO4x2FZKJGxSzgK0hy5kxg8mRN/Vl3uARoueQIwR100pj6l?=
 =?us-ascii?Q?GuSwANgkx5JNO0HGTiSTmoqh/O9xj3qwO3CbUCfJ3jKHopYAn7KUyRXJDH0t?=
 =?us-ascii?Q?6Fth3FwhHEQ/WpFfv9Yf0UrZWvyXeduMmPF+WeNYWLWfXDz0BsxoHQPe5Ywg?=
 =?us-ascii?Q?Y7d1Etkz53vCHlTRuyOGMoaQJVRCEfiOL2mRlY6T3zPjBfF8SEkEdbBr4azo?=
 =?us-ascii?Q?Ao1mNgI2jpYZpuPEefbsaw3/DCGBMAyo+OC/KcbAkxVwcsE0neCXXabLZ/QF?=
 =?us-ascii?Q?Ztv+/cyBxrlS2W0WqpWQ6XcG7gciwz5Yz2/bZA3KXx2T3W9CrzB//qRsIhkY?=
 =?us-ascii?Q?M2wQO8CHeY9JOaPi+xir49qP4FfElSdQtktcZjqF6tEtUqqYp726k+pUcs7R?=
 =?us-ascii?Q?MkC/bDd5Cfc2CUNvUdbrYEoGMEbV3Z6yYTf3MZLmuTvjKvOzTREIQNTkD+e9?=
 =?us-ascii?Q?/OcMOVhVGYPfBqcOHlaoBddabh7oMBCt4ks5CT7InRa/78vt9/PV8Ex5RNVi?=
 =?us-ascii?Q?ng8vHorEInuyy8jNNBkDdCbsUqknXi6/ujRcrP0UsSIq8bt6+qDt/JE84dCd?=
 =?us-ascii?Q?syf+4+KD7cYkeAfW8CDd4smNoWoIhbx/vlbw7xrOhrvFD0/P15dO7/uHmgTv?=
 =?us-ascii?Q?eIVuy0LC7DEH5OJ8AAIzTHCSZzcQUlloSHpSRdYFqMe3sd8n2we4jRMgITt4?=
 =?us-ascii?Q?nP1jjdj+GHpT0faIROJcjZdLYHmi8DiPVpmQb2tfD7Z4Pz8soJgaqnQ/QkiH?=
 =?us-ascii?Q?0yRRkv8UQsleC0qj6kdQcoMJqnkdd3corqFcul7A7zlXoINvuZWAZh2SbfCg?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5784f6a-3f26-4edb-8b9d-08dd6586d7a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 19:06:37.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zt4PNxIAIHp9fuF62hL3jgxlvmnTnTA21jXrlrlvWrq1lF8cK6YRb5OOzG7p3C2xiA21GhN0HNKq2TBkcqMzMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Mon, Feb 24, 2025 at 12:40:10PM -0500, Oak Zeng wrote:
> On certain HW (such as lunarlake and battlemage), driver now allows
> scratch page be enabled under fault mode. Test this functionality
> 
> v1: Move the test to separate function.
>     Write to scratch page before rebind (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_fault_mode.c | 68 ++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index ae40e099b..6cc27102a 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -17,6 +17,7 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include "xe_drm.h"
>  
>  #include "xe/xe_ioctl.h"
> @@ -36,6 +37,64 @@
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
>  
> +
> +/**
> + * SUBTEST: scratch-fault
> + * Description: Test scratch page functionality
> + * Test category: functionality test
> + */
> +static void test_scratch(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	size_t bb_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t vm;
> +
> +	struct xe_buffer dst_buf = {
> +		.fd = fd,
> +		.size = bb_size,
> +		.gpu_addr = 0x1a0000,
> +		.placement = vram_if_possible(fd, eci->gt_id),
> +		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	struct xe_cmdbuf cmdbuf = {
> +		.buf = {
> +			.fd = fd,
> +			.gpu_addr = 0x10a0000,
> +			.placement = vram_if_possible(fd, eci->gt_id),
> +			.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		},
> +		.cmd_size = bb_size,
> +	};
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	dst_buf.vm = vm;
> +	cmdbuf.buf.vm = vm;
> +	/* Submit a command to write 0x1a0000
> +	 * Since 0x1a0000 is mapped scratch page, cmd execution should still
> +	 * be successful. Write is either be dropped by HW (NULL PTE case) or
> +	 * written to scratch page.
> +	 */
> +	xe_cmdbuf_create(&cmdbuf, eci);
> +	xe_cmdbuf_insert_store(&cmdbuf, dst_buf.gpu_addr, 0xc0ffee);
> +	xe_cmdbuf_insert_bbe(&cmdbuf);
> +	xe_cmdbuf_submit(&cmdbuf);
> +
> +	/* Create a buffer object, vm_bind it to 0x1a0000, then re-submit
> +	 * the command buffer. This should write to the buffer object.
> +	 * Check the buffer object to see if the write was successful.
> +	 */
> +	xe_buffer_create(&dst_buf);
> +	xe_cmdbuf_submit(&cmdbuf);
> +	igt_assert_eq(*(uint64_t *)dst_buf.cpu_addr, 0xc0ffee);
> +
> +	xe_cmdbuf_destroy(&cmdbuf);
> +	xe_buffer_destroy(&dst_buf);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> @@ -458,6 +517,7 @@ igt_main
>  		{ NULL },
>  	};
>  	int fd;
> +	uint32_t dev_id;
>  
>  	igt_fixture {
>  		struct timespec tv = {};
> @@ -466,6 +526,7 @@ igt_main
>  		int timeout = igt_run_in_simulation() ? 20 : 2;
>  
>  		fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(fd);
>  		do {
>  			if (ret)
>  				usleep(5000);
> @@ -508,6 +569,13 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
>  
> +	igt_describe("Check if scratch page works under fault mode");
> +	igt_subtest("scratch-fault") {
> +		igt_skip_on(!IS_LUNARLAKE(dev_id) && !IS_BATTLEMAGE(dev_id));
> +		xe_for_each_engine(fd, hwe)
> +			test_scratch(fd, hwe);
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.26.3
> 
