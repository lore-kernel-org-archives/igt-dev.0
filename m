Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922D0C3DA63
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 18:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD5710E0B5;
	Tue, 23 Jul 2024 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIYxpVlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1810E0B5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721760199; x=1753296199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yBfWDeeVuVnu4BXoqy+bMjDMYp749dSdOR+oAdPagMw=;
 b=IIYxpVlwgx9MX/RPZHT+SRj0mTXR2VLimdbAlGow3yL36DOY8ZoZBNwa
 Vf5lRzqLYWZasdEt5lVNswRe1d00ea71WvGz8bOPi8BTuXQ/nzk1hNfr1
 LIQQd3taaOUJOWA4BPXqLCEqUJYvdF6X8uB4KE+G4pCIxMutfrs+fHZdJ
 2QrzsYOQRPG8zL1c2U7n+3eEiPOcybanShXfkuPxB0/htJYmraHlq69GI
 Z92VzaLu8g9ur5cj0LJbXx14Iet59TbDSJUYA5uGCSiNTKdET52wASqCW
 X+PlwHQxlsHTx60UdGRbfh/aHsQj/oGXgnxhX6B53cFritcXBGVQ3g6dU w==;
X-CSE-ConnectionGUID: 37QW+xXDQpGiLBeYMC9qvw==
X-CSE-MsgGUID: pUwPM+pzTdSv752NviSGHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19255360"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="19255360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 11:42:30 -0700
X-CSE-ConnectionGUID: vG06XsuaReixrUH8nD+Ynw==
X-CSE-MsgGUID: Q9XliNv9Ttu5tWK8wJpPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52221259"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 11:42:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 11:42:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 11:42:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 11:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8+cGSj7DVGdMReOAOSuo81MNPOpyB8pBrQWYSEXbgdjp9GODckX2EtegNPM24637gQVzW6BNDDnK6f/syoUmlUF7VLnpFN8FxdnHj8+7uCK31a6Les+d5m3Xqy9Uaf2H4oxyt/Y7JQCPHQNW1KBcjEdL7I2XsQ6eoV/7cIBdc/S0H+bG2sj2Kbh8TSapmO5/ENsxIqH3aKbCJ8Xqg15fTfqXCDCaCu0uKPrdC6lw+NAr76egGI8oPvG9EVzX6aUHXzqSmWvjebtes7TkHzZOCClJPbX9jeBL7aburgLtIuDf2iQHNVPoQyZWE6R4GZd/duFcdavte5t1CGXIEoD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWpsGJeDTf/yCirG8mP1ez/w+lNAfLAcD/AZ8Qgx+jo=;
 b=tScrYcYCMHl+FhMSAR26tKBVpmxG4hHoi8sLCG0grNMS+2ekN/08Soj5vJWOW+gXeNFueCvS851ouSTVHDS0gV039VbVVdFeKky3mqSlYcJkiSvRC3sgYTZ7/HTBYdPY+f3N4ExJ0j10lu8bvS98ofZHusoTSKvMX2Y9tHFH9ojOJ/Zypnix9cYN11J4ve1cy6KGEeV/8N4u4tk51PC+JewcFDRqMNtobc0VcQnQtAH1TkrSQDamPm38F0eS3TzEn3Oz+aIfL/OX3rOruLomtKn1Ume4ZOP5ktTFSQAuyrNqNe1EhXLq+UQocNhA8j+8Ew383sV3V6H2m9E1lw2U0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 18:42:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 18:42:27 +0000
Date: Tue, 23 Jul 2024 18:41:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] tests/xe/xe_vm: Add section to test zero number
 of VM binds
Message-ID: <Zp/5XP8eoNJ1CUyw@DUT025-TGLU.fm.intel.com>
References: <20240719194107.1549306-1-matthew.brost@intel.com>
 <20240723124611.fdk6rvshlgnckrkc@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240723124611.fdk6rvshlgnckrkc@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb99832-196b-4610-21af-08dcab473359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yZOMxQokej43NGMeO79ayu2FwX/fOWZPY2vyv0sIWYtVmH0kr5C/jqyiIuOK?=
 =?us-ascii?Q?zV2ghMhLun8nkXPk3SSItZiKd3LLcdu/OL53h8i1yaknaUgalxbGbe0gyoHl?=
 =?us-ascii?Q?U5MJzJAuoMuoxr9T8bhqlFn/MeFZ70XfYv0A5OHKStbuNvqpwJDxXNdDgu2Z?=
 =?us-ascii?Q?qZlbbeVs1K68UOdx6HgkC2Wns/SeWJ5SCUI2v2sLDmcRWKoCObi4AXQc12Pg?=
 =?us-ascii?Q?yVeiNJ5TlGR2xq3bCqGafza4BVANrpHKuH+OO0lBCkOl1TOK+Hh9BJCitKz2?=
 =?us-ascii?Q?JXR8gbAkbyrSz+lWf6lurju0S0MTLnkR7KsCoKuEHOhembWuJ3oBs+rEhdmO?=
 =?us-ascii?Q?h0IEahecTXliJ6OfARmY10EPmyOc6cl10unFK6yCPuGRXk84GxWGDEFw08vO?=
 =?us-ascii?Q?kZqlgXIQADvw7ynyUImp7SPsTlzS/1dR/AVuf5faEq9IfsKo/pcKsEvfSstR?=
 =?us-ascii?Q?jTUm34PlGlkY6+/Oq/dQgKcf2lTYTCoQmqkacRYJH8QCIOZyA8JTVt4C2nAF?=
 =?us-ascii?Q?g0z3GdJd3LQTFU+uu2IQWVeePmbULnEYUgVBSIqluChXj1PZrVL6nT3/4l6G?=
 =?us-ascii?Q?YSKNcIpnZ6ndsaGAcGyo5vw/75Go9L47+8afWBctXFYUE4JJ9zHakK0pid4r?=
 =?us-ascii?Q?rg4SqprkoVP1cwa8gXMST0LVBOe5WVAt1MDRWfhAbk93yc8gtmROPbK9F9Bg?=
 =?us-ascii?Q?Rh7FzxIc5mKMtFXCbo5X2XFV1gxoA9egvqTIGNH0rba9IKEjHIx9O/5Stegd?=
 =?us-ascii?Q?mt0sYGBK78QA8QbG4O6eSkky0nT58b62Sd+Ym5Rdi7wrSyB7/hdbU4TLFY9Z?=
 =?us-ascii?Q?eaMjGGZHcKsWspUqgYiwbj14jPRCpCy49QK5AYB2Dw15x3WOMgdAitnkpLJ1?=
 =?us-ascii?Q?uRX47L5q9y8RwQ4LipAsxRBvU11/OHJSyzLSBJYtHoTH1hkSJFqOPYT9/vr2?=
 =?us-ascii?Q?nVlmDW5TAMWhfA5VWOy9cbSNh1dpDzCIH5TyEwrY1k8XWSOLW8OhOamn3fa3?=
 =?us-ascii?Q?/zh5sWxst6s7+F0TCTUuNZcQdJ472cX1GpO2USUXRXWhga+OatebS8Rk72XR?=
 =?us-ascii?Q?1heh6XYLD1hvzaU862z7irfnhiP++KvReNT9m/CPXfSlY7hbgXYOZm2IGzyL?=
 =?us-ascii?Q?Ca5Lq/N2iTvjTV2LhtlmXo7kSdlQ1wA/MLjHWISYDJjFifLZXVC7Vc9tr4L2?=
 =?us-ascii?Q?+TRppP5sLZHy6VrQJADrgNQWfD2au1z8t3KfB2tqCMrq5/4ZxxDu1r49Xgcl?=
 =?us-ascii?Q?9gaCBMP9sdk85yDsWoJQIuvFg5ldAXPheqgf21i1uTs26/brJUgUUT3K181P?=
 =?us-ascii?Q?LtJns2R7rA+6V5v3hv8c/lfYJs25LyCNPNO2Q85waG14OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yyPndkP6xS4CbYfvQ9k/GcxHbcsJuOMr+nTVQYXrBQjqW4Uv7AQDpOenA+zd?=
 =?us-ascii?Q?nKL5DTBpvUufWVcLKc1y/8oJQ9ZZ6X3nFLv3j2lfVMy4dVxuYe1oargrrzHc?=
 =?us-ascii?Q?xgUve2mouR/EdoVCUXT191fZ1ohVPEoYEcVCZkFH+uZ1qUJHyJcCJt3QDdhM?=
 =?us-ascii?Q?y4Hd7pSrxzRXrnRHkw8+pcTUgBJBCRxauUi4Yil6gVUuUZGlVaHRr4O3bKMQ?=
 =?us-ascii?Q?ABvvNyh0MG95lyBwyw4472Vu3cDWNkSl8VR6/XPInd4wz7YNiO2uDVpW9v4H?=
 =?us-ascii?Q?rAL8nuMxwUA8Yz8wrSZyeKHrhUIElW5gzSkP+Hi+tL/n5YRB7+hbhFuOw8hQ?=
 =?us-ascii?Q?x+jl2vzV/2LklbB2ethv/2srim9pJMK9wCIdvlJTOpCai/dsbsC1Gsx4hxKd?=
 =?us-ascii?Q?2n1PK34tzRORZ1TYhujqQaoml+Q+YNu3VxU9Iw0WJasLkJUxOuHql+VumGgt?=
 =?us-ascii?Q?CqBqGydE8fsj9U3WeJLi4FgxWPZUJveUw83wy18a3IwF+WtbawOteo94fJ7k?=
 =?us-ascii?Q?IZ6AOKpNDPakje9Hjq6N4Xnm+zgcBK1f3xR1IcXXPuCr+NOYcuCtFc/BMzej?=
 =?us-ascii?Q?v7KBH4wrTIlJMehCcc6Gtl44N7DQQ3V+sIM1+lSNyt+OPAV4D8s1OvEBCiL0?=
 =?us-ascii?Q?rxO5HUPP2+SYzUmgv3lxCihMJpJDJaVafvGtfi35ceiPHJuAqAnxlm0tfYOt?=
 =?us-ascii?Q?pyoFGAgLdILNKBpfx/i3XdgL+1AFo5sSVsXutCLXH+Mg6XnGLveWArWKI/tb?=
 =?us-ascii?Q?59LB62kpnFJixBKZmufJN4rpRJ9vD6zbK9bPa9fPu42LLxkGBfThHafHNVTF?=
 =?us-ascii?Q?FE4hqpTXP9vBKc1fa/Q9muhbdcSjF+V4/wURYQ9nAX1OqMw+iSlV3j8VSipP?=
 =?us-ascii?Q?k61TD+5NVGpRxmIgfROuwIOutBNaiK41FVeTaJ2NHYK2C/BLX9p7/5pSgvYf?=
 =?us-ascii?Q?0HzznI9lrWwaaNroW2eDVdjVGjcFs7XaxEA6r22zOH5o9lbZpTmMHsWJp5UF?=
 =?us-ascii?Q?UhNgu28HqvITgcICFAzic6FxWiAPtnq+btP0vRDc5vvk+lwh+Ws2qk9esoHf?=
 =?us-ascii?Q?FVpJoC4eBDGj4qhd1nWKYxXgAdAnz5jMVIYmudzIJVB50rMRabQuzBvkjVti?=
 =?us-ascii?Q?fdV/0iOYgr7cygjsdg23elLn0YOngSkBZnb3GU7/1NXRDBYP+o8ny+MxRoJx?=
 =?us-ascii?Q?lo9n9Ja7IzUqhFtqOXRtqr45JCQYl1PVGp2HIkKth68IMZlfb+ZtvET071Z7?=
 =?us-ascii?Q?9zp8DW+3rI2rR7aI4YmlPiDUXNcyUeNWOxncQkaAbUM2FwUJPvh3SPxxKfzY?=
 =?us-ascii?Q?SwKqV5v0m5CWzXjbsVRHbqHghJmDfFImQvamyMZAGGKTRt4jbY2+qEPVtUsz?=
 =?us-ascii?Q?vsS+6n2aysmXmqlzGQy1UJjSr3SjjdReXh7W2PDr0IGlP/GlAuJlAOI2/qTA?=
 =?us-ascii?Q?Ky+kCPy+naC5/jH0DSDAHH4Lv9lvR3Q601zvz0FVApCdqPc5Ws/i3VX7cPFE?=
 =?us-ascii?Q?UmilkpnFJqPv+h+1Ed0Y5REOVhzTzwVjd3y6uBLORIrpByzEXsNb9ecjKR3u?=
 =?us-ascii?Q?HfY5gfjokVgit6EPq3s+pQWTtOhWucBifTAYYMNbQwpYoWJDdsiEGc5SKBGV?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb99832-196b-4610-21af-08dcab473359
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:42:27.3126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC/+6Ao+YR0Y8M2z+tdLdyN8kCsxWHm76LtjXiRQ3mjBO45XgFhgnswDsb4OSbLlOeX9GP5hqAllLUoh/4HBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

On Tue, Jul 23, 2024 at 02:46:11PM +0200, Kamil Konieczny wrote:
> Hi Matthew,
> On 2024-07-19 at 12:41:06 -0700, Matthew Brost wrote:
> 
> a nit about a subject, you wrote:
> 
> [PATCH v2 1/2] tests/xe/xe_vm: Add section to test zero number of VM binds
> 
> imho this could be:
> 
> [PATCH v2 1/2] tests/intel/xe_vm: Test zero number of VM binds
> 

Will fix.

> > Verify the bind queue ordering works wrt out-sync signaling when zero
> > number of binds passed to VM bind IOCTL.
> > 
> > v2:
> >  - Fix build error
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  lib/xe/xe_ioctl.c   | 13 ++++++++++
> >  lib/xe/xe_ioctl.h   |  2 ++
> >  tests/intel/xe_vm.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 78 insertions(+)
> > 
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index ae43ffd15e..27a4a4e70d 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -154,6 +154,19 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> >  			    num_syncs, 0, 0);
> >  }
> >  
> 
> You should document each new public lib function.
> 
> > +void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
> > +		     struct drm_xe_sync *sync, uint32_t num_syncs)
> > +{
> > +	struct drm_xe_vm_bind bind = {
> > +		.vm_id = vm,
> > +		.num_syncs = num_syncs,
> > +		.syncs = (uintptr_t)sync,
> > +		.exec_queue_id = exec_queue,
> > +	};
> > +
> > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
> > +}
> > +
> 
> Why new lib function? Why not just using __xe_vm_bind?
>

Maybe I'll just move this to xe_vm.c as a static function as I don't any
other test would use this.

Matt
 
> Regards,
> Kamil
> 
> >  void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> >  			    uint64_t offset, uint64_t addr, uint64_t size,
> >  			    struct drm_xe_sync *sync, uint32_t num_syncs,
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index b27c0053f0..6dfed1b330 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -35,6 +35,8 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue,
> >  void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> >  		      uint64_t offset, uint64_t addr, uint64_t size,
> >  		      struct drm_xe_sync *sync, uint32_t num_syncs);
> > +void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
> > +		     struct drm_xe_sync *sync, uint32_t num_syncs);
> >  void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
> >  			      uint64_t userptr, uint64_t addr, uint64_t size,
> >  			      struct drm_xe_sync *sync, uint32_t num_syncs);
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index a088bd5db8..ede75f72aa 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -868,6 +868,63 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
> >  	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, err);
> >  }
> >  
> > +/**
> > + * SUBTEST: zero-binds
> > + * Description: Test zero binds in IOCTL
> > + * Functionality: bind engines
> > + * Run type: BAT
> > + */
> > +
> > +static void test_zero_binds(int fd, struct drm_xe_engine_class_instance *eci)
> > +{
> > +	uint32_t vm;
> > +	uint64_t addr = 0x1a0000;
> > +	struct drm_xe_sync sync[1] = {
> > +		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	size_t bo_size;
> > +	uint32_t bo = 0;
> > +	struct xe_cork cork;
> > +
> > +	vm = xe_vm_create(fd, 0, 0);
> > +	bo_size = ALIGN(xe_cs_prefetch_size(fd),
> > +			xe_get_default_alignment(fd));
> > +	bo = xe_bo_create(fd, vm, bo_size,
> > +			  vram_if_possible(fd, eci->gt_id),
> > +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +
> > +	xe_cork_init(fd, eci, &cork);
> > +	xe_cork_wait_started(&cork);
> > +
> > +	/* Initial bind behind cork */
> > +	sync[0].handle = cork.syncobj;
> > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> > +
> > +	/* Bind /w num_binds == 0 */
> > +	sync[0].handle = syncobj_create(fd, 0);
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	xe_vm_bind_zero(fd, vm, 0, sync, 1);
> > +
> > +	/* Let jobs runs for a bit */
> > +	usleep(100000);
> > +
> > +	/* both binds are waiting */
> > +	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
> > +
> > +	/* Release cork */
> > +	xe_cork_end(&cork);
> > +	xe_cork_wait_done(&cork);
> > +	xe_cork_fini(&cork);
> > +
> > +	/* both binds are done */
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	syncobj_destroy(fd, sync[0].handle);
> > +	gem_close(fd, bo);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> >  #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
> >  #define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
> >  
> > @@ -2416,6 +2473,12 @@ igt_main
> >  		xe_for_each_engine(fd, hwe)
> >  			test_bind_execqueues_independent(fd, hwe, CONFLICT);
> >  
> > +	igt_subtest("zero-binds")
> > +		xe_for_each_engine(fd, hwe) {
> > +			test_zero_binds(fd, hwe);
> > +			break;
> > +		}
> > +
> >  	igt_subtest("bind-array-twice")
> >  		xe_for_each_engine(fd, hwe)
> >  			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
> > -- 
> > 2.34.1
> > 
