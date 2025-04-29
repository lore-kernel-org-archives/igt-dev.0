Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A7C3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDB410E2EC;
	Tue, 29 Apr 2025 19:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgBtNI4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3AB10E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745955454; x=1777491454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DbIrCe1/Dd16n9iG6vE3Pu0L0MG8eT04V1AWr0Eixyc=;
 b=hgBtNI4p+3q2ybND5LOqj4P3JHgLKeClQldsQQUeGFvLQBAnNmyqEPbx
 hNUi0ou/WWQI/SmR/xU39aVj76GvaOBNIYXQKW3p/5Kc3a/2JYb6xKWAG
 b3ddG0XXxnph+/+TYnV8aQPbZ7I9l+T7WPo/fHMcTx0f/rm+2IUF7ehup
 qe8LbvfI0OFoivZCG25d3EjGIuDIO7uzJmc3BZNkJcj2i7Er8gSVvnw1T
 YBqEOpOpvDtiEiDeyN7povRhaSARheCmTA6PvENXP51Kle2a/CFEqC148
 wCsWEhlVjIg/HgxX+Y0IfZuiz8Da+jBP7x24xBhR5ecc5TmeWKocPD6ox w==;
X-CSE-ConnectionGUID: ZRLywgSiTc+PMKNLDmpUyQ==
X-CSE-MsgGUID: saqx+xJjQFS+6t70HAeLFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72978689"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72978689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:37:33 -0700
X-CSE-ConnectionGUID: IKaLNAtCS+W1+PFanSz5Mw==
X-CSE-MsgGUID: vclYrqI1QBKVcv3vlaeU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134415121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:37:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 12:37:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 12:37:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 12:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnejOKLdLIun8l4voSePUI+/Oj7aj0qXtlIabxh3xtRIIYVuUifni9fTalkDeXsbIYqlY8/gG3Wxo+VeeNMm34Pngwf9H3HoE9sC/Eoh9ojvOibJvGkxpEPDPEp3WWNrUWO1UFocbJo53e87plmzUDnGWjXUBlegCB/RovHtRQl98t+fP81lghLvTko7Ey0xw0Hx9IoubyxluoY0kQlBRGCX7JlR4NAyXpBY2C4z4igcXdFkfm6B10WLJ3bLrj9k0ClcWwRDGotc/npmpTlatVPdR9mXK5iKXWVw+Qsiinukpzp5oX06xZFZ1ynpWMrYte7b+5piyJGj4eD3TVyQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUkGNkNII4aEBOpnEjWcc8OXljuL5D2mrgkPt17KJ8c=;
 b=s97LtF9agQjY943P9LHfPVkvnqhN/xTj7vWTXNseYk/SJwOcRLafDArdr7z2JYOO1AMqH86MfqFX+BFMhDL+xiTR69Jfjd2DAG9rJ1kbYwlrw4lJB3UCJfJmaedgKmGRnX8s4+DuYbtdOKG0bUpHvAfLrzEGu8TkfcqqSfKYyFd7jcov4EVSKEswQDaH+4XItOrEwNim5n/sbWFjM9V0Th0bzKnTf+9U3D5j88SBGFHdAW5sgXKJdyCzZ+vJUP/W11Y3SK+9t25YzcGIOEu91LGBBclTbsIIiVY3JruIgBAS2CD9qVO0b8liRkLnTngMcMNfdP3rcIdyfY6ra7QcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 19:37:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 19:37:02 +0000
Date: Tue, 29 Apr 2025 12:38:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH 1/2] lib/igt_os: Add igt_get_meminfo
Message-ID: <aBEqsZNAiY3sJz6l@lstrano-desk.jf.intel.com>
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
 <20250429192956.275280-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429192956.275280-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: c38405b9-dff3-454c-d1c2-08dd87553728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kzIIrc7SWgQO5Mtv9z/KZ+xE7Zt/nSLT/SD/NoNdmRWO4UNta94jnFVc8+iI?=
 =?us-ascii?Q?YcZG/lz3orqWGfpqcRkyqNMm8YwIvgQhFNUQWHYcOXj2Z+gyRg0ammrUNzE9?=
 =?us-ascii?Q?yl+IdCRNsFaIlrn1Y3SRYwaWz557uH8tJQVwjlRVe0+VzAdD6W7auTnjGf91?=
 =?us-ascii?Q?CuPGlkq3vMuHUI4i9OOq0M2in9tWeMTdJo0ZTa+hR0i5JFZah0GHi0LRDOEa?=
 =?us-ascii?Q?xrUu9NVn1JcvmvmaGirzhJ8ktxRcHvUJrJ4LDResoZ48/g8ue2Lo6jbXpn/o?=
 =?us-ascii?Q?w9YYZIW0iygOe2msEHfjjKlvbB2MNLIVc0NWKK+2n5hf2D7WH3AhrZJoanNO?=
 =?us-ascii?Q?NaseZPgOK/gquDlASVI4sNdnSmDn+ISpYPtqCYopyM5ews9XsSxacTrvT4Ow?=
 =?us-ascii?Q?ZNWrrpiDvaV9GaTeFmM1jU3svgu8RjumBwZrJJAf6hpXCgDRdY97KVuD3XXh?=
 =?us-ascii?Q?eU4ZSlwpSyzxTNopIW6G28tQ2I8eMCroc3fcKTFDVweIdD0DHQVmFGJiWDTY?=
 =?us-ascii?Q?Vd7CgRHlOP/uCFtgZdlcwNwrxzFh+u3hiIKkeu+4OSrq0FGcEOuFQCdTw0BV?=
 =?us-ascii?Q?uqQQ4aT6zi8Z+y1MsmBcpG7/X9lfRKB720vQZnlVTBK3yx0ZxGkLPlB/IKuT?=
 =?us-ascii?Q?o31dggzF2RJZGLd85H0Ke5K325b5PTQUDgvZiQ8wIseVWWuYlDClcgxbuV30?=
 =?us-ascii?Q?YViFCl9bF3Wid1w/oNmYgoZpXsuj9d1JotlynXfUZvtb3bHf2pXMl1SFYCIr?=
 =?us-ascii?Q?43ta9EEEjiztavcMOAFS0I/b3duRG/IE7vp1z16y9RgCQkiGHSTGre+nlsDm?=
 =?us-ascii?Q?GKcRjRsQBsDWFRtRaJbiYh2w/n3Nwnc5JWiXVjRtoxCwnh/S2JimFm5f5117?=
 =?us-ascii?Q?+7UkvzmArnYuxeZqFIi5tip+gcnpe4joDMXVhF2rPnK399Z800Q8dGDOOYhg?=
 =?us-ascii?Q?62ZYQLzg+3FYQqO/+HL3/YK8gJxwt+u6Afqtx3Spx2W6wqrMd43ZIsn/vYsE?=
 =?us-ascii?Q?OUCb5+SofW44yZwq39z9eA3JS5d7zNFKt6YrWjrDyg4b9+uv5ocPRln/7Y3r?=
 =?us-ascii?Q?yG532+erk4COEyTaQFSxXnMX+9UEKHlKlEz6H8uAXQ+NLUqN1mwzzMQschyd?=
 =?us-ascii?Q?nv08jAkDQrnY591vjI0+WXeR5Lg1X28h/VLoAScOisTAGk7hPAbU+PInPypo?=
 =?us-ascii?Q?gfAN4Si2wUeoSKXMzn7glzIAsp1IVoy8ZvGWkVlZT4D5WvPrnvVI+RCSOk3c?=
 =?us-ascii?Q?wlkj/LLc4SPBX1uV0xiRUuLzRhx09qj5IWw0bkn2qlwyj7XfGbPy5OcYhmMm?=
 =?us-ascii?Q?jrFh9+et7iDX2l/rHLqyVy1SXeTJMlihQVEQN7LT/NQaakboX3mnPGQJ3qBe?=
 =?us-ascii?Q?zev+JDUcWyn39htHWBzT/tnR0RlLE8gIebikDn890/yKzMHbke/fmkuko79z?=
 =?us-ascii?Q?RYtZ4YCGtD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/UTp+PirMupvqaM//EPHvzDbB4sJlDjeu7PPcgf0t48q+MqO4BEr+RgXVuJ?=
 =?us-ascii?Q?cV46R1daLgVmahlkzCyP2sGdVel67zd4svxc4YsbRkYD061GVeeYM/zM9jRE?=
 =?us-ascii?Q?8dYFNiRbVKFYosvuOJznAQ0ed/7APB0RMjGmo7351FWn+UiQ2Mj4/IFstPZI?=
 =?us-ascii?Q?/PoBwwFwSCQCWDVGWWYb/gtmnRbWy45dG3Y7Ik4XmczjSlvNalm0+801C9hU?=
 =?us-ascii?Q?n/6V2AGlQQTV4QGbzelJNpSy+HCjtdl9D1qTa4IuSv9aAyy/TLXC0caF1XB+?=
 =?us-ascii?Q?l2I35VOs1NskaiYTLeS+OPlt2oqp3aiHUFhnUOogVnisvk0uo/DvUEO1OUZd?=
 =?us-ascii?Q?k4efJpG3lK13I9zOyzc7rlU39Le28NcFRcs4iNG3M8ZPkZ4GarlD4M+N8cft?=
 =?us-ascii?Q?AsqQKdK6v5bEF6flshTLAchnGbrb8u6OZ3ykK5Ql7RWmyzax30r9adDiMuEg?=
 =?us-ascii?Q?YonZG/nhrhgPlyWFO1upkrnlKvFmTjwWq5g8EQejjGqkns3sD6ffoRdpPWd4?=
 =?us-ascii?Q?Ec3d3WMMB7IAhZV3HFsvMspVGI/swzSPPCQzh5MNgZdC32OZ4+7nEaxkyFTf?=
 =?us-ascii?Q?VFCcl6cvUcQU0FlA48niIMGGhz2V9ZczG/QF3AU1hYwa5NZ25DtTBx3Isr8K?=
 =?us-ascii?Q?MlUXbiLfGQwThYJ0WssJzgbwtsNTx/RF+TkQnCsYqFcJMe1g8NIf7+ghgjlA?=
 =?us-ascii?Q?ppOfS7j09n2tEn1E790H70peoWbk+E7T6kxngn4A7qYvDmzm/mQmFwAeLNiS?=
 =?us-ascii?Q?ISKlZV8dVYHMrWqFLT7Xd+VTmp2iBZ3IK8rD3kpC6r128LAgRkMXUqRARoyc?=
 =?us-ascii?Q?PXnyIT3aOnXL8IUQIYzq70B8vpyZ3p3FSHo0zHJl/+Iqdar2AeE+qOclt/zM?=
 =?us-ascii?Q?LyUpt1ML3OSX5SLtnuyZQBo29tPy1Mrz3CVtLQuFctQJEh92Ulh0ujKnXHPN?=
 =?us-ascii?Q?sHRI/Rwf/z+h5UEYbfS5ZQmnUO4ZWXuSnLrOEPW4oVi9w4KmCOFZcaNVWJed?=
 =?us-ascii?Q?DiAREEyzoOrpmj3kBp4jKdqm5u2eV4YunJRVcDzTaKTP1H/XkpEaTg4qeKzT?=
 =?us-ascii?Q?OXNt11KFNHYHxfNTwRU5B3jw1HEmymKWL8GcWpMZ9tA5cXpc+sRj7RG7YqbT?=
 =?us-ascii?Q?0HNn7OwPH22t2TSfamFIGDuv03R+NsNI54H35YUcPq8CG9xREY9pBG2+rXbn?=
 =?us-ascii?Q?hQWgWcOuV3eh8lOoYMCL1MoEmq51HApkF1Ek5huw7gx0c0BUriJabLwC94aV?=
 =?us-ascii?Q?Fr3IguGXXINmSmfI2vlawZdJaAkGStYH0y0CFmXYhxuMyJ4y8rFxDFSujs3t?=
 =?us-ascii?Q?/vho1nPr2RtYxcETKyU02vSITznuY3tvpK86U6wYH7rkX7TFZmxOW3WdD8wX?=
 =?us-ascii?Q?nGXud/cN+nzWrnvt5sDwyFeAt2miVM6rYwGoRCPzapnxAcQvUhcqhUPS3DBU?=
 =?us-ascii?Q?NdQ7RMJe3L3GTzTdHEnoTo+k12AJywWjH9amzJXm8cLVreg0sqq0qr/Sywjn?=
 =?us-ascii?Q?QEBGVZnOly9P9aaEbffVOLVI8xCpiSg1huJID+vNGVs7xLJIAcNaYmWKCnnn?=
 =?us-ascii?Q?XX8apoxyRKNqX8hQjPvcTH51Lg/wne2j0iD/7wgyg0l6hCrko4k4VS8poguS?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c38405b9-dff3-454c-d1c2-08dd87553728
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 19:37:02.5407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVaQC+1/xqRl9/yotrsQUpRIvTvnL3IvuCpo/nCkg23k9B69r3Yl/KoH2q3c9aXc6BLnfqpcl5Auix5EcbUiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

On Tue, Apr 29, 2025 at 07:29:55PM +0000, Jonathan Cavitt wrote:
> Add a function, igt_get_meminfo, that allows IGT to query the value of a
> specific meminfo param.  This can have practical use later, E.G. for
> determining if a test can run given the current meminfo settings.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/igt_os.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_os.h |  2 ++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/lib/igt_os.c b/lib/igt_os.c
> index ac8960f8b0..0fa10ee750 100644
> --- a/lib/igt_os.c
> +++ b/lib/igt_os.c
> @@ -99,6 +99,49 @@ static uint64_t get_meminfo(const char *info, const char *tag)
>  	return 0;
>  }
>  
> +/**
> + * igt_get_meminfo:
> + * @field: name of meminfo field to get the value of
> + *
> + * Returns:
> + * The value of the meminfo field @field
> + */
> +uint64_t igt_get_meminfo(const char *field)
> +{
> +	uint64_t retval;
> +	char *info;
> +	char *query;
> +	int fd;
> +
> +	fd = open("/proc", O_RDONLY);
> +	info = igt_sysfs_get(fd, "meminfo");
> +	close(fd);
> +
> +	if (!info) {
> +		igt_warn("Could not open /proc/meminfo");
> +		return 0;
> +	}
> +
> +	/*
> +	 * In get_meminfo, it is expected that the provided tag ends in a colon (:).
> +	 * If the colon is missing, the search will fail to find the meminfo field.
> +	 * Userspace should not be required to provide this extra colon in the
> +	 * meminfo field name, so append it silently to the provided name before
> +	 * passing it to get_meminfo.
> +	 */
> +	query = malloc(strlen(field) + 1);
> +	if (!query) {
> +		igt_warn("Failed to alloc search query");
> +		return 0;
> +	}
> +	sprintf(query, "%s:", field);
> +
> +	retval = get_meminfo(info, query);
> +	free(query);
> +
> +	return retval;
> +}
> +
>  /**
>   * igt_get_avail_ram_mb:
>   *
> diff --git a/lib/igt_os.h b/lib/igt_os.h
> index b9af0a4b7c..415895f76a 100644
> --- a/lib/igt_os.h
> +++ b/lib/igt_os.h
> @@ -28,6 +28,8 @@
>  #include <stddef.h>
>  #include <stdint.h>
>  
> +uint64_t igt_get_meminfo(const char *field);
> +
>  /* These are separate to allow easier testing when porting, see the comment at
>   * the bottom of intel_os.c. */
>  uint64_t igt_get_total_ram_mb(void);
> -- 
> 2.43.0
> 
