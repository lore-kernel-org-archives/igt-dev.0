Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C6FD26D71
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 16:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006D010E901;
	Fri,  9 Jan 2026 16:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ii0+L+Ai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F3710E901
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767975435; x=1799511435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3fuwhUvzmjTQ6woqCmThtenkscUXli/C0c5Ssv8q+Ao=;
 b=Ii0+L+AizPAHOeGDGgR7AS67MBlSxxtiAFoU5S8Kl4C3kuQiZ8IBDFlM
 JLFwMuZOVpj5gqMdxtMnE8S+4+Xp/++7Iu4kGZdvX5fvA1EQDqPt9HZsg
 5sdog/fUtprtX1VHf7uT01bSjnRadKnu3fdao8F8HXSTkIvSiLPMEzHj9
 SMM0R2Kg71egD25U1mWEOMaGNwOD8FZarC2uXhtb+BCIF15C3zCaUi1UZ
 mWhwUDrgYODERsVdk59rz8D8W9Q+8JHg+Ahh8wxJ4hwmH7/eAqdgiaJrG
 c22iub9ukZhZFM1HeDl3BLGaWDp21RnmVBvAsgzWxv9qSlNqQAv4OFr8W g==;
X-CSE-ConnectionGUID: FUDNrAItSjmSi3UlZeIELQ==
X-CSE-MsgGUID: vLGz7p2UR7SQX76eiM6jsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94831550"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="94831550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:17:15 -0800
X-CSE-ConnectionGUID: CbUciJdvQU+Gie9Dhz+uPg==
X-CSE-MsgGUID: xlcT26h0QLWrkX4ACnMy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="208030826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:17:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:17:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:17:14 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:17:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxs0T/osgzrUAs7fC7DHDi1FkC7R+SeNrGixn33FJ56rkGrNHENe+oEpzDcTxdR52Z2xu8IQtD85Gi9twqr9aLUUCPhl3YpRyhi9xzjsz8ydu/voQSUS1cSSGJAWzdS01mt9RuOz+OuXj1S9nS7fU6DzZRDLwDfJ4IFCevY6g+k3zXXYZyNjnHVfGBQdKvYUcAC+P6JDBOOGJ5PVySq4YmL40XPnv9Nl66FcVCxP49F/E/rz0zAjr5KnSJ532dX+as6A9St841qAYgDUPPK/bfyKWyI9/LVSftfvJajaX4x9yeV/QW5RABqRY/niNqns74nVFjEMDusB1OjG+U5aYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIWjaclYjs1jLQo8M+POi58XdyGtTcg7K3A2a78TKhg=;
 b=kZztkV3yfgAJdiYDMKl0dC/d7RwCXHeUG4BMwd+U0j5slqWU20pCIoeonrO9tJCzMlbaskeo0by989aLp0MO52sbKn7nsK5KqC/dUy0h61vqbY680dcpSiUTGWszN2V715O5Qx9jse0g1L/NbuAeiW4TRL+P1ECfibTlfbBSsEAlgOYakFclSxxx/NJs7GPlNShY8Ufbc4JwcDe2GvamoaDoS2UgIpGnIE/ipPXqv4Yg/1Ux89W8SHPOckTci80BCEZj+y4RDZYXDm2Rp91dN2JvRHvVvnjQmegBcVA/GC3OuIVKkpGs+e9iV4gktj9k2KEJVWuWlCw45TFt7s/VXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 16:17:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:17:06 +0000
Date: Fri, 9 Jan 2026 11:17:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <satyanarayana.k.v.p@intel.com>, <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Skip subtests using
 wedged_mode=2 in SR-IOV cases
Message-ID: <aWEp_0V17tT7PRte@intel.com>
References: <20260109154834.24523-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260109154834.24523-1-lukasz.laguna@intel.com>
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bf8207-a572-488f-49fa-08de4f9a8833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uL6k3rOjJmMSSFq22iHkF9LEGH9J7yTyufeQsQnAwpejUDFuP+wa3mC3sfyd?=
 =?us-ascii?Q?FnKy4QgkzNPn7Idlb73jgBvGqBYonfuB6esbWrRQtXdD0eEECSwRCFwizZmM?=
 =?us-ascii?Q?xgFrYnAhpWKDadI4QR0Lr1GwdOE+p9S+T15Ppw6ihSNon3oUfmjaTz6yD3HL?=
 =?us-ascii?Q?3hPkwki0tVll70Tg8Mb9MkaJY764ciA7JhkV3W/LqH916MRMMxB8jddEFPii?=
 =?us-ascii?Q?cRXc5JRMDAlnsAC68Xa+OIxvZ9mt4pw20c5Ckuj3AIPrVq9r7zutR+AqlYJx?=
 =?us-ascii?Q?ToxHqlbsm4PPm2jQs2dQG0i3cQe0bzobqUYxupM/pSDQRiy6iOajyP7poPxN?=
 =?us-ascii?Q?cfrd9pQ9eSehhw182OqtX4tSXWlxGJa4laQhIkQMgmfjJYRFGFHfO4+SlRLz?=
 =?us-ascii?Q?cD8LtL8t3QUsSL+4aMyOstSHGSTH6iYi8iPY9txFnUV8MILvD2hq0SPI+Ukz?=
 =?us-ascii?Q?853K/1ojE3cp7j64TuVeJS+jQ4pLlsMYpLz/PRMe11ESv5YG/h1r6egRmbn2?=
 =?us-ascii?Q?cHakfYU84kIsEPWBkYgUYE7OPFs/ly/a3+DrtEBQt6HWCUs/F6lHKLBsfr29?=
 =?us-ascii?Q?yKGZHuzY462GK/JnEwJi3yoxtqiqUJReyJrr3YrwaB+rEIOjg2vkTzPY5QPW?=
 =?us-ascii?Q?mJN4pVAMDUOgH3a6cfzqoKBsSVCZtmIP5ZoGgZV9t17ToXIi/701n+vaAQ5A?=
 =?us-ascii?Q?TYa8/dHGIkcvK7IE18Vy8NoOA4h96KSA4drDVrT90AnzO0Iu5iXKpmwnpOau?=
 =?us-ascii?Q?fuG0aWhRnsFpJD4t1P5zH0U7xgzM+8R8XnE4ZswOh2KP4yCxXtigLArOL9BK?=
 =?us-ascii?Q?D8NPSC0vRQ6x/V8lGcaoLQJYiJYi1+Pxiak+JRIOIi8Fr+PhdUNgRkEvMhA4?=
 =?us-ascii?Q?DJwpr9X7E7hpX7IDTonNIKUoZi54xIKPOrS/x5PvIZY/oUK5o1RLWMU6XOcy?=
 =?us-ascii?Q?iFYsMJZ4gmLCYYpYKod022RmrabBSg+xMYJ0s310DOka1U2cLPa8X+LZIjyF?=
 =?us-ascii?Q?oTkNUFyqr6YX1dkUBSHZHXVjNQtlUUx0McEgRgiuywyqSpoCtrZwsdS9xDnx?=
 =?us-ascii?Q?3tvOi1u2X5Q3PDRIQ7N5ES9YPiYXtk5vBVkAuH+4WYQAc4YuJb8q/W7+EVT0?=
 =?us-ascii?Q?POpMHNJ3SuLaUKvo5gfA8IoEq47mkbE2f4OJEEKg/i0TSFhIaVhfOTFiA3xX?=
 =?us-ascii?Q?aHmG+1RVzm/Z14dOCo4324MGmEKGF3uWX+cOvTSdx1mk4PpLh0k8JjrKwiZQ?=
 =?us-ascii?Q?urVinCmj0albiV5q3e2S3SVJdSDvzbOYRoUouCnGMEUmLqAGfCjn2kg9sn87?=
 =?us-ascii?Q?XG0ziIiXLLn/PVad5mLdJRJYn5lBBYaKFdJs8hL4BVYy+daQKfvc47hc1s6c?=
 =?us-ascii?Q?kxwFCwLdaz/VuP6KEbkioxedIZCYwu3q8W3kLbVaphxqvOPxgRccL5l1qhP9?=
 =?us-ascii?Q?2DviXtE9R2tCnJn6eEv1oIz6aEU12P6PSlHnr3uLrdU9pV9WGwCkzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oxz0SITjDLPRd0guqujv5nEckDEMcArszsc9al6icHBHa9Is6ct9SC84uESi?=
 =?us-ascii?Q?7cNVL8Q+N56f5EpwB2xaIuCNHC1qJ6B3PMwJjxRLwxrePf+EdLmX5Q/Asey/?=
 =?us-ascii?Q?Uv9yaM8ehhy/njMRzS8jRojcGshylpreEYdamv49nKXLicwAAfNVWAxOu+b8?=
 =?us-ascii?Q?FNaSlRvfA+fqNcSIY3pT7PnjWYCg3AdJ9+fiyVqCDD5jAqDvrcTrqyzCBZ++?=
 =?us-ascii?Q?9l5qMGHpRB2ADnNavddSJDT+yt51ebQTSRzFjDUAL0LWUP5dVgSbz7nNJfbM?=
 =?us-ascii?Q?0/RRAwImh5aUEsVxY8WMyqlwzd8htdoDrVvz6g3Pd6s5SHc+U/iYIbAoxEfX?=
 =?us-ascii?Q?tIQIueK3i/EtQ+nRnAHbv5/QIfHmaKHQdaDnFPQbmTbGjMVExhXnOGV5SL2L?=
 =?us-ascii?Q?/KLbQ1vRiIRVvveJDx3TUni3B+RVMrm0uwKTDDiNAnFpOdfYAoURFMKhJ8rq?=
 =?us-ascii?Q?/tfVS+8YaRYpGY8fNnUb1/H38ZGKwvXFqrZrP76phMs1485vh1D2EGCOal+R?=
 =?us-ascii?Q?dt6DilsGgpPBWeTPB7AFD/eeaV8vcxLeOzCZsTv60B6DcMPGPSRXmVGs+Pj5?=
 =?us-ascii?Q?eSqFqFj2qLjpYiw54d/lEenkgxUoIEGN9TucNv3NkL+3ks/D5YxDysjH/AzJ?=
 =?us-ascii?Q?C4V1NXgownXSHODUV3lpGpe21bu1/ZOoyjlmK7xwEx35OEq2JPyi1xeNKa2x?=
 =?us-ascii?Q?3knA2niFWim4LWn0lWKZvlGtG6LvtvKMcAsm9tyCT8Uh0m9P4AcL87EIri3Q?=
 =?us-ascii?Q?3D+XlAAJYEIGiLwXCUYmdw2cJTxd8arSSwY1DsPV3o5HZql98548V+QE2AhH?=
 =?us-ascii?Q?7oDLKFLpONRYcYeIuKMe2Dok94SuhTvviWm6qsD4JHNsUxDV0756cpTy0aPT?=
 =?us-ascii?Q?Zvc7Zj2RsTLPtGzoZKj9UKmG1CGNCOaVN/eFPt7aKYOqUW/qrurlr2lGJTip?=
 =?us-ascii?Q?45YEl5gGqFW2tqRAZXbjrnNijKnQ0oBGrJJLq5+xaQvObgIj0x+zBzl8UoAR?=
 =?us-ascii?Q?HtT3X8K/2VbQcherkO3NsV6fa2YiuKTGUKqK8DntxTPQo+c4BPCvVn53wPdm?=
 =?us-ascii?Q?vLsXmR0j8+Io5uwesWD+tAtIHWAlh7j8FdPEXK8YdbZCr2nBNYBytCVLvI1C?=
 =?us-ascii?Q?8P0ADN46beSn9t3NizUAuaWMvsFAHqBBWJNzsNzDodPFtuMSYCrx3+4n9A/e?=
 =?us-ascii?Q?INMq6RgWkTm3YKNoAd/srFhRl64fh0gUtpFETWeA/sFp5mYPo5MQH8WX9R53?=
 =?us-ascii?Q?wqXaeQBMrAykGfXUsHXF+JwYJ1Xf/FzS8eQamVY8foiq3rbMAiRDMw7EE+wm?=
 =?us-ascii?Q?47PDVvem4uQjTkfZZtFV/lOi7IljIB7iLDTwnO92pzrSCThlbW3cmArYvsjw?=
 =?us-ascii?Q?4+wxX9rg5EiQWOdnYQ9XyjaGIrJOFD66+DrE/0Xf43SKlO3oVySFuL6lxTo6?=
 =?us-ascii?Q?CfwVyVXr+0KBxNxV5StMaJuxqlIYhroSuWwX4cwjMNZQjgibkZt08LfOzzTX?=
 =?us-ascii?Q?hGoWZabyL4zU0oH3gQ7XKaNnPU+E6A42h2MlFoBMTOvgjiv6E6x+uToQ02Uy?=
 =?us-ascii?Q?UZ/9xAddHVtZ0/n37sPk3ndFHSu4c88JBSgXNe5fJ3GCK3rAAWCuFUzdqJlq?=
 =?us-ascii?Q?iHWXYGiDhscmImWAmPeWf4c1ioeh+zNKwLe50nQDsmbb3eATnte4obHOh9HA?=
 =?us-ascii?Q?J5C604KkQA1ekZBeKNkxbst1EizEpegag7W8aGZdO+kczXz3p0M3zENj95FV?=
 =?us-ascii?Q?XdcbwEEEkA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bf8207-a572-488f-49fa-08de4f9a8833
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:17:06.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgjgYDFcjrsWvByxuznt9/srESTU7sM+SkjVDdBOw3yKTzY7QDT3o8xXOFwsc7gWS8u1yT53DuoedDK1dJeI9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

On Fri, Jan 09, 2026 at 04:48:34PM +0100, Lukasz Laguna wrote:
> In upon-any-hang-no-reset (2) wedged mode, engine resets need to be
> disabled, which requires changing the GuC reset policy.
> 
> VFs are not permitted to modify this policy, so the driver now rejects
> attempts to set wedged_mode=2 on a VF.
> 
> On the PF, modifying the reset policy is allowed, but the change is
> global and affects all VFs. To prevent unintended cross-VF impact, the
> driver permits wedged_mode=2 on the PF only when the driver is built
> with the debug config. Otherwise, the operation fails with -EPERM.
> 
> Update the affected subtests to skip in such cases to avoid false
> failures.
> 
> Link: https://lore.kernel.org/all/20260107174741.29163-4-lukasz.laguna@intel.com/
> Link: https://lore.kernel.org/all/20260107174741.29163-5-lukasz.laguna@intel.com/
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_wedged.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index bcd78b49d7..e1ac629ca7 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -18,6 +18,7 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_kmod.h"
> +#include "igt_sriov_device.h"
>  #include "igt_syncobj.h"
>  #include "igt_sysfs.h"
>  
> @@ -247,11 +248,16 @@ int igt_main()
>  		int err;
>  
>  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> +		igt_require(!intel_is_vf_device(fd));
> +
> +		igt_debugfs_write(fd, "wedged_mode", "2");
> +		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
> +			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
> +
>  		ignore_wedged_in_dmesg();
>  
>  		hang_sync.handle = syncobj_create(fd, 0);
>  
> -		igt_debugfs_write(fd, "wedged_mode", "2");
>  		simple_hang(fd, &hang_sync);
>  
>  		/*
> @@ -282,8 +288,12 @@ int igt_main()
>  
>  	igt_subtest_f("wedged-mode-toggle") {
>  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> +		igt_require(!intel_is_vf_device(fd));
>  
>  		igt_debugfs_write(fd, "wedged_mode", "2");
> +		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
> +			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
> +
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		igt_debugfs_write(fd, "wedged_mode", "1");
>  		ignore_wedged_in_dmesg();
> -- 
> 2.40.0
> 
