Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB5BC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 15:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5D10F1DE;
	Fri, 21 Jun 2024 15:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrW4RNNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927D010F1DC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718982058; x=1750518058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VlWVV4ohgjNHlHSG1DFO/fj+LC2pZjsXER2hkLQ2GWc=;
 b=KrW4RNNEXy6UaGM1H8efQupwB+BeYe0TVTfKA7KN2KXhjLbliq/vhQNF
 C1/EVQkVL1sU9dwClp83FO926Uo9IUF2rp8h4sdSuQNwtJv86Ji8db+CJ
 d39MsCbkFWctUOkwZ/PcxtYd81RtotT7V1dv/EPB/EJfgoH262UgmOxpm
 Jwc1PmSunST5NuMOMPr8NgUliYXHSO47ZmSszhLBjpD/1biubQtZFKme5
 kw57CVav7rsaLQ6zlNvjI8Wsi9NjsOwMIHIRkUtVgINQt4mcMqx2kIrZx
 Y1VySc4hovIcVxJ9b8cDXQ9jdWKbp+Usogg0OJ+VOsibsl5bQOGSizi/a w==;
X-CSE-ConnectionGUID: fJFbxheITsakYYCoejfcTA==
X-CSE-MsgGUID: 1KeVLlavRFK8cJlw2K0tIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26705126"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="26705126"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 08:00:57 -0700
X-CSE-ConnectionGUID: atUcGR9YTF6bv6MJ3guwtQ==
X-CSE-MsgGUID: JH/T7sm1SWucbQ8IOVW2YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42720512"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 08:00:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 08:00:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 08:00:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 08:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NN5zQp0cWBLqcyFJ8oOwqH3EIMXaItkrZLPWW6DS8ijp2A6RYkFfxejprUR/5VELXYuIDv4L38TNly3dnE/sdKJF5GTVijMhrAQVVE3YTn97mF19R8+3U6tIiFPjAU4l0fLFCxhLnuB8XiZnl8ZOhffP1wTGtql9Bv0Z/YTJqRPvPMsoFsZJYXuH3IsNY2Z1CsAV3LZy95CCzq0/SGZR/4J2AIZLyN2xJnYMkw1F42k8w6ZZNsoNdNRVSJazJKXd+YMfm+/8NIsumUu5vIKi3EEWcdowjBbOJ11tnrL8dQ79OHFL2LD+RhInZM/2CnwsdrhJmvLlUW14bGNZM9Oqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/w9qIkdOjG4oteb91l1/i6gnPVo0rBb5UdQn6spSe4=;
 b=AJlmtXJq7IKlbmdAXVOLYjzrtnGN5FrUvXVBy6d57xr+A75JFKa9g9Dwdzo3nSt8WezNVe7STXnGZPh6C/qGyiOd15aExFtueWks52EE+Teq+UFmZ7rcxF1uMVFunQVIM+68Xc0EZlswRy2XSMWc28UpnPom+NKkvcmwDLCLU/aMGhws9ihefsbvFpRS7qWdqAJlcdavcBkvyvsGiN7KnmWWKjMLiGQplD3axD0dtj2WYTAN81xDNMly2pejVuZLUho5R9tlr9jMoV6ixfoYLzWe6dF8ygJSfdFlov8GpP9pddC5sdSvsNEPwxwAFmdeQhebj1lA9fcZetF/nYudrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Fri, 21 Jun
 2024 15:00:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 15:00:53 +0000
Date: Fri, 21 Jun 2024 17:00:46 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_spin_batch: Check duration of
 preempter execution
Message-ID: <ZnWVnoPjhDdrVNNy@fdugast-desk>
References: <20240621115303.1772645-1-francois.dugast@intel.com>
 <ZnWODQqe4o8vhXaJ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnWODQqe4o8vhXaJ@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c4add3-de4e-4399-b260-08dc9202f258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oBoEymlvgcfTHRU9Eg7q/uXW22fgngEaF68x8e8hqYbHBMTTvtMgxNUJPeCq?=
 =?us-ascii?Q?uUQW2v7LNUTwPH/heov38ZLUVEs5MKcMWq+WZr6gS53iZhFMCSmr2IeNSP3d?=
 =?us-ascii?Q?tGlfh/xthpFM1W1B0DqX7ZMzRH7fmJ1Mx/kci7dOunhkicPu3anCuw9OYCk1?=
 =?us-ascii?Q?k4l2C+xcN0hBbESOQgPyvLiEHSUqlwBjaQEYbYmIiDwnA6CUUmirFGVTK6Vh?=
 =?us-ascii?Q?F+ijx6250D3fJ7BZmLCZvhUInlckURAOkgwE0FAXwEVFALi+Ls3Q32AtM8te?=
 =?us-ascii?Q?mGCWqh1EEW2aEcbbWyECATeohkl11WQawU703F7f7IjAsZmfsg3uR4jad+Ax?=
 =?us-ascii?Q?oEARsKaUHLvAomKmTmkaRPPdbML7kYyU11TK5wYRteI+gB3phVzsyB7OCg30?=
 =?us-ascii?Q?TVhDAjAjIW4ypG1Tw+kpCkbke4M5cgmB0NIJExoPd1BzIGIkcLSQ2gRJO6Iw?=
 =?us-ascii?Q?J/aC4DilPWsJpP2ROvUsIuXEe0uVHQ93mfEb/LV7jMWjhOLnBO5daEXHtKBJ?=
 =?us-ascii?Q?lQYiDeCJ1flvJ7bRVL2vrpXj8PSoD8jJ84GV2x0qZRJHlloi/i01TLNZ7mrD?=
 =?us-ascii?Q?Burpp+Ibz/kw4XnTmSH1FLDZIiopuhZGFw9tEGZ/FEi6zQXPzgn3lu3ZODfR?=
 =?us-ascii?Q?DwyF+Od6560VyOb4jKMUk+rr+Fx3YheUGaUmbecWRTHC1CEiyjkNykIdiMWk?=
 =?us-ascii?Q?bRTEcTvchW35S8H3EPaOOmCQcnylKSSlPxpnyo7mVu2hTo8eUBmtBp2SmU9y?=
 =?us-ascii?Q?GwIFbHyY2vNrTjJElTmHqtHXWEVrjxGZw7YaqySm9/AvrWpQgGeTcbqlTqkH?=
 =?us-ascii?Q?1ac0hriAS7J01OjS/0joUhdvG37K6U3qML1TwkM/8pFKfsIH2DOZE+6brTvM?=
 =?us-ascii?Q?+DasctiIQSeSURXV8fbWi3JneifS3ePlCCbi7mJwoirjWmTcm8Du0EJc72g9?=
 =?us-ascii?Q?/vGTXIRuKa9gx0F77MEzQpyprHJViHVSeHKNNDbwaAVH0E4rFaBNx1NpSNBh?=
 =?us-ascii?Q?0l6lu8HLwGhD6hHXkTtpE208vUAZUxP1etmAQ5PHOmmj8SdufAH/YMFYjAmB?=
 =?us-ascii?Q?mKz96K8qNop6+BVRHM9pSZIEMMXk7i8jou4Huo2ClHeq/9OI/dfL8H/G5xTT?=
 =?us-ascii?Q?CWfOR8qvxWqkHGYLQIQhYrUGQaVchOugsnG8JX1kwpdMda5HLoAtFWtUS2k2?=
 =?us-ascii?Q?ttPgoPvoGKm+dbamUxgwIOsPedXvhLpVIv2UmSKJJst1FVZhRWPP7bSmpi4N?=
 =?us-ascii?Q?B+YmyTGb7hH72Slus/mMBlvQizY3E1AWLybAHxUpjgapTKmyohnnS8O0Ibc8?=
 =?us-ascii?Q?HmfybuY/zfq/2FpjGzx/AUYD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJjy5CcnQLiFQ4mxQ03QMGfUEsJXB+JpiBNsF6qivi5WrHMtjKXCr7P/dGos?=
 =?us-ascii?Q?MUcFyurYo+DLLCb0K7E03MWwDJgcVRUD8PiuEuH+UUduuWzc0IJoFUXtsnxF?=
 =?us-ascii?Q?qmTpVbjsNp6pA8+DhEo5CA7nm3VN8774GNqaGjHa+3gv/Kg/s5TujPI6LnnB?=
 =?us-ascii?Q?UBvEtkUE0dyeqyxHCHaMx9C1/I0NVEjTB/MK3p81AXh2GDBSTcM0GCueY8bb?=
 =?us-ascii?Q?Qv+bNdoLq7tMvM6erjb39yEDuS7BUrDiYvEDECbF+r0Nmm3EgUrjx5+MOR4z?=
 =?us-ascii?Q?eJGfe1ayzgaCof2Tv0czuX8FMkgmO9G2uFCXAvYEFqafBF8QiDq5/oAFiL8G?=
 =?us-ascii?Q?6bb7nkfOesmMAq5+qjde6vNju60Nig6wDtgtKk0C2ud9TWm3TSfWbbv5D0zf?=
 =?us-ascii?Q?rw2OxkRZhlV9CdrUfYJW9IrF3R202WJaeRP9jeiI+joqu/72LdL5oiIiqL2R?=
 =?us-ascii?Q?91XvWHlIVRNWX5HoWFYf1j/G0KcuVNeDxj4EynNz2OKFMkGqlgkVkzs76ZPC?=
 =?us-ascii?Q?5+9NYnUuv63m4PZQl3E0e2yykBB6BPedR7Q7W3YbTne/6L7OcOKhtKG8OWIt?=
 =?us-ascii?Q?z/yvPfnctKDIvwtndjedI03WHICW3dEs6zsLyeUSbTnC4v8WVkGfsEe87qIS?=
 =?us-ascii?Q?N69MIwlhw7gbK+SYxYBwmNZcf7ITkcrHE3akiVVA2tBn5IhhPn072JJ1ZQEC?=
 =?us-ascii?Q?mdkTRQyyU/+FDrDIO3/tITQzvciMTboCkhQ26viDOTGxb3gNqkx9Oj01vBfg?=
 =?us-ascii?Q?lYVsxp2Ha1LLm1wSnAI609U3NxQunZfj1U/1Xa1XN9rxD9Gy4lgqmzFDxGgY?=
 =?us-ascii?Q?rLKiCADESWvG2iGMys4ucwAyxck1jbZVvpb9L/QvOXh04mHnIWLHSV6jtISw?=
 =?us-ascii?Q?+7x+mPaAYoZ1el7ej+bUeWRWSiG1LkfKVGvAYiL+cOWhvTcJHVxTSt6u0B63?=
 =?us-ascii?Q?f6AvkQn316gGqjuDsEeVMKNsCOE/Qt/d7FoaG0DidIsvJFjnmBSqoCV25v9d?=
 =?us-ascii?Q?WK3Bbfd1MS+kqXEd/CcjHBP/NX0oLVL0Hp26WLOnfnQMvxP1nf3VoeoVlcx/?=
 =?us-ascii?Q?ZHqZng3jjvhxvElofqwpWcw/JnqOkRiUSbQhcFurx3mluU33PnGatuP0Zbsw?=
 =?us-ascii?Q?S7b/oQ/dM6PqSzG9HcX7SCs/OC9wGdhhudl9b9T8eT7wv8Zev8TeqQAoizUR?=
 =?us-ascii?Q?PkPTthJrAKjP1rYGfRjo06JO0KXrggFw4iFH4rhtugYgOj+UioHz7zd1Y8+Y?=
 =?us-ascii?Q?9QDnnBmqIJEeiqPqQ2WIpwzO1knHqWnAozSGejRqDGv1L4FsTiRkTTjZdCdD?=
 =?us-ascii?Q?O7jDu6Z6bQgUxcheMce0PYfjfoi92aDQlghvYXeC9bUpjNLdxXh6io3YCLsC?=
 =?us-ascii?Q?tyAb9TnB4aNoxNqfkaLnysDoOSfeFU/u576IqrvF1Wf7Yev2ns1nb7uijsd6?=
 =?us-ascii?Q?YLC+kFZx7ljmN/sEhYogXjmDWO85aoJzOb/n+UY0sAmA2jD/c0Sns+dGCgVB?=
 =?us-ascii?Q?m157yKOzMRwu91iHDnLypnTTaGUmWpfDosKMbxZlJIhdPXZ1EjmzJ9i1ekv0?=
 =?us-ascii?Q?+Pr/YHam/0rDXL0yzFDCLJVYMKqp5XesEfs0llZREnSN6N+Tt/Da/y+X+SPo?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c4add3-de4e-4399-b260-08dc9202f258
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 15:00:53.4775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSp5KffgJBdesZAHk1Ci9spe9Tff/8JZ0fgfWCk1IBjkEsleXodmjJgKg7EDpkMRegBgw3ibGunq/7urm5DlnV8E7toxarvtrMBfCvv68uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
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

On Fri, Jun 21, 2024 at 10:28:29AM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 21, 2024 at 01:53:03PM +0200, Francois Dugast wrote:
> > The preempter is expected to execute without waiting, in a short
> > time. The synchronous call takes roughly 1 ms under normal
> > conditions.
> 
> is this true for any platform?
> 
> I'm asking this because sometimes we add things like this and this
> becomes a 'committed KPI' and later when things start failing on
> a platform we have regressions and escalations on a thing that
> may be normal on that platform.

The batch is minimalistic but I agree with your objection, magic
values for duration and synchronization are not a good idea. Let
us drop this patch.

> 
>  This duration will be higher if the preempter is
> > waiting. For example if the priorities are reversed in this test
> > then this duration will be close to duration_ns (currently set
> > to 100 ms) which was undetected by the test without this change.
> 
> Okay, so the goal of this change is to actually ensure that we
> do not mess up with the test order itself? Any link reference
> to this undetected case mentioned?

The goal of this check was an extra verification of the order of
completion of the 2 tasks. This would have been preparation work
to extend this test later but it makes more sense to create a
separate test, which I do now.

> 
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_spin_batch.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> > index 4e95060d3..e57318801 100644
> > --- a/tests/intel/xe_spin_batch.c
> > +++ b/tests/intel/xe_spin_batch.c
> > @@ -253,7 +253,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
> >  	uint64_t ext = 0;
> >  	size_t bo_size;
> >  	struct xe_spin *spin;
> > -	struct timespec tv;
> > +	struct timespec tv, tv_preempter;
> >  	double elapsed_ms;
> >  	igt_stats_t stats;
> >  	int i;
> > @@ -289,9 +289,11 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
> >  		igt_gettime(&tv);
> >  		xe_exec(fd, &exec);
> >  		xe_spin_wait_started(spin);
> > -		if (flags & SPIN_FIX_DURATION_PREEMPT)
> > +		if (flags & SPIN_FIX_DURATION_PREEMPT) {
> > +			igt_gettime(&tv_preempter);
> >  			preempter(fd, hwe);
> > -
> > +			igt_assert(igt_nsec_elapsed(&tv_preempter) * 1e-6 < 10);
> > +		}
> >  		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> >  		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
> >  		syncobj_reset(fd, &sync.handle, 1);
> > -- 
> > 2.43.0
> > 
