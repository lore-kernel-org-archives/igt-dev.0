Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B9C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A581810E67D;
	Mon, 20 May 2024 19:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5WFK/oV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D2B10E67D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716232038; x=1747768038;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=a9RIhFZ4mq0f8Nb6x0Ssls75gDSYFHo0Hbv7NZ00UVM=;
 b=V5WFK/oV5ybKKPmfYr5RiLjkcS+pNxJHpHUH1+PFNIo+4pkjQAU6ijMr
 gXZeeaQOyFTjdvarHZYrNV+vu0Qe9CGZmQW6EbbC6Td1bSVNzWZN1n5PC
 q+VMu8MQ2KdV3s7wkMrWuHRWrZZ8Touh05pS4LPG8UQjZE1EUROa41Dv5
 dGnKvCmbV4S8jg4xim6TD/JY8FU3gMVHN74wsz+DQRa8/rYFUVZrKalgo
 ZGucnbWzOvkmeXT02ZXGGzA+xm3ERI5QB7ky3h/cJCjsj9o2J2XsReVhs
 Gl0ieRfcdQPyxs+b4gF/p+PifQcdsnm08LH4VBw6j9Wu6bulKDmJG6pxv A==;
X-CSE-ConnectionGUID: 8RFfLTUMQ9WG30sVY2OBbQ==
X-CSE-MsgGUID: Rwu/zHxVTH6vA4GNPJNjwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34901250"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34901250"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:07:17 -0700
X-CSE-ConnectionGUID: H6pNWbQPQ4iFgjt63/xABw==
X-CSE-MsgGUID: WGal3w9XRMyZdpRDocS05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37162738"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:07:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:07:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:07:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:07:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgovoTN9ZHP3rRZBtqZJIREbWRANbhs5VMKs6Cz+mT6YUX+8+oiNq7p7X9CKGCOEKpgTYra0M+BSSOppdFtTff7SOjwDtDaGeqTwZ4t5pXcDoQIwpMYjkK5CZJwoiwcnAMLA0cQxAoP1MbNU5nlKeRAdkC+44xEbPXmmEBOg+wPytUsbTTMU4eDKWukRA1ex9PAkuznCmH5DVsTRBx5zctfR9Sk3sXRkfb1VUa+3Bs2A5G0mutPVUHXgp6EKUgLsrIe2YwUcyEKHYyZ+wI8cXpFKNhtyIjSsfwD0a/f2bVcwJQim3V0Mn8yGKxNHsJOAO1xP1dFuSvLaw/Kq6VF6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d725AtIDLs+jhvI05q2rdE9rCGdGWd2t1xxru/SX6N8=;
 b=GuXwnQyEwE7xmqqBdvPeGUQPEFm3VwEvJbBlAawsDCL95QzS86VX+a5SYhbiEBdXB4cHmfEKMzupe4V+KC/Hw70Xl/o1VWWJdE3gIy3qg/1VpSuTZ9EPJT6Jh4UU0TBzkHKHbpRn6EC+LtTnUcZL7deYF1L5/QCJGJnHUfqR3QIx8AVLKn7inHIiGs4dETeQRE3/YL35y0dhTekVzyddv1tvxmMIyoe+36VbRePSE8fh39DFwU+CKE4FLiiihWxIM01RwKdYi2wQCpMsfFxL3L/Us6ZHuOVuK91UnwqAEDz3WKXUz3fQfgMPFljasCXJDLo1r9F3aRN8oOMAJ2un8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:07:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:07:02 +0000
Date: Mon, 20 May 2024 15:06:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <francois.dugast@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <ZkufUrMCRCjAfpv2@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
 <20240517151319.zu5ldkk6i3uopnmk@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517151319.zu5ldkk6i3uopnmk@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 733d5cc6-294a-4f7f-07c4-08dc790007de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c6NF3ljgOxSuzUJ4HAFvVKuoni6K8Ik38sc9qu96cSLKlEP9TtZmM9nMUAbE?=
 =?us-ascii?Q?EELHZ3xCKwY9hDqD0KF49uiK8FFlioqeiZz5mVvHB/VfAaSZWRTgPSeXyMsd?=
 =?us-ascii?Q?rKlLJ7mk4O5eGi8+n/aIiwHkVd635c8h5OGV1aXF57GVxxkysR/a2c1On62+?=
 =?us-ascii?Q?FGKeG2nphgoyOCwjEeyVMY5DtlxzY3J6HM0PvU0NuS3XXZKgijKWe6zwpjf9?=
 =?us-ascii?Q?mNqddNUUX/lVKZxKU1aUVRMf3E2JcXsEmlVosDLwEKK5dcH9HMJBWEpHjMs9?=
 =?us-ascii?Q?54AAmmhCWenJ6g1ltEVInKG3YrQI0b6dTMSTgTE4UPLYc4oCKUcpr0FNGorW?=
 =?us-ascii?Q?qrc9Hc+0cu/Cew1wUwu6TZ/t+dEF9clltKiquLuBiq2eIKL1ivuR9RMenvGV?=
 =?us-ascii?Q?D3jTmek7c5hcM1AucNkKm1VKHrbviAAAm4IarwaogprIsslR5ExL4opW04yf?=
 =?us-ascii?Q?U50VJAqTcfBe8Vec6J6qHvo5y3/T4T01W09oOugR7opxWJdpA99qN+mlVZ23?=
 =?us-ascii?Q?dGSY6HP4HKzroSsyGhJzb++7bPIlU/kUY4IGQJhJzVc1/qVhjWTeOHsdmUV2?=
 =?us-ascii?Q?zK4xn8VhQzMnM4V+hO8nGt+Y7++6JRBTcb/FyRdjyO08omtPz1nIpcHJ7lYN?=
 =?us-ascii?Q?gHh0chBvue+kAwD6esre47XolwuFk2nNl/lLLi6XLon+0S4pDof1kKbO0709?=
 =?us-ascii?Q?duNzTVSXh+gH5Yb4l/TqQuQ8FsG2ih6F3CYNa5J+izLckkq5wMxADoc2sIn4?=
 =?us-ascii?Q?52UEfcrdHy4TaUPYe61a/+PFz1viFZjvYG8atRAV0OfcjaQoQlRz4a3oDOAo?=
 =?us-ascii?Q?SWSa584VlLveQsi9vj1qmQfE7UKSV50zHR8FADaLyR+R+FEsVXdJxxCHBDWD?=
 =?us-ascii?Q?N/IEEkQA2AFT+FMQ3Itq4WKCz9uEwOM28iwsu5CSRwnO6HM3KWXFY7l4tUdc?=
 =?us-ascii?Q?SYXf3F3YmR7X7Lm3UttB4NNv1/nRLT1k19ad2TwBUDDdLPXlnGvWcqK21rbX?=
 =?us-ascii?Q?N2iIrI6KPJS+filt8yDbhl6XD8/hrXEro4FRoSu6bWM6pCavj54Tr8bI/M3/?=
 =?us-ascii?Q?782B6AAhfhbesrRhp/y1/oO5qZq7P9DPWXdUlLGq3gNuIVzgIglp/LZdxoHO?=
 =?us-ascii?Q?yPZw9WfZHdC1/TDTVMj1yWWLHUPk2PgpvogyNM1EnUpAXMw/CWYYb5lD2ZcH?=
 =?us-ascii?Q?T/KgNbBAUhTb00KLjRax8Xr884VCeQhwz2129g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/BNJhVeswNgeI27CdgIPywTZ93farUOlmh9IJ3uv9ibxS4sOT+ltTBxZPFTx?=
 =?us-ascii?Q?8ccxr+GOXh9W4EEApUxXwoDMFMZN3e4s7kv9VxT3llZjm2VImfS3MDaRQqHl?=
 =?us-ascii?Q?foFDOQVfWWHErA/tM8Sek7vCMdrG7eiWSurivG14vZs4JdLyWxlCl+VNcHfC?=
 =?us-ascii?Q?YW/9Ycm/7KxI/ga9NpEfQFn1l3+8rcyWDsFcUEw+AedRvo9mo8KUeNzc90sh?=
 =?us-ascii?Q?Xl6aqjQx1t8V4hnOQ0Dzyviq0J5pRqUIdYdBMUwzCICug6uS3r3dT/8ftLVQ?=
 =?us-ascii?Q?ZHeacNRICIPfvQQcTug1B9dswJNO9dRyUOs0LCYH6MJ2JFJqv8vwfSw5eXN4?=
 =?us-ascii?Q?s78R01uO/N7g627HIAhlg/bYS7g5pTEV5JDDPvGjIh4gYWNtZ6Dee8HUsG95?=
 =?us-ascii?Q?WIt7gkT3zWIEQ+6N19NG4DfoZZEkA5UYZbATbxi9/ReulsX0VXhFLoaBwPfW?=
 =?us-ascii?Q?ZAHr7gspxYltna3Gnn1oo9swlKNHj5xRSIZF6tvVPNGNqOFHcSsdJRFFg2p7?=
 =?us-ascii?Q?0RFZrjZVujBbdejjKuMH2wwyFTVn7EavJ2f+C8bfGXMNMHfIzPWOY/YIlkeb?=
 =?us-ascii?Q?iWi1531U3yWoaKzxDKCZvxBHGo6jqqf13hk3De7VGHzCJ4OPGCoWRTKX8jZP?=
 =?us-ascii?Q?9IDj/+Wi1tipuoKfOwkFA53qxo1PuZXgAIPTANpDW4uW27s3KQy8UPjJKK5S?=
 =?us-ascii?Q?P+G8h5IVEqRd8PMCaIDJcx85/ZOHmKYC7VJ1lMO8ZUVP7AARg04iYo/R0CPu?=
 =?us-ascii?Q?OczUlhzbh//nxsCZgrZQxuBFwepBzqDgcBzQaLe5JeY0k2aBCRNXmpiJxR1w?=
 =?us-ascii?Q?H+6/jOIxQP8xKiKRSwDHnVEOfoEW0CYsuPUwcl2rLai+eSTlXEBPFGnLSN4j?=
 =?us-ascii?Q?IRpN0qo4iILs4e+61U6bZAaaHRQnf9sSP2SsMRPPkHB3mKQy9Fuoswzm89+Y?=
 =?us-ascii?Q?3GLTyNRXbEb5nJ/QS1IrWDm7cj2dvWDF/Jc+emS8s2uOWsI0sq4uMI34bNV8?=
 =?us-ascii?Q?iBTOT9BUJPyki/fH/okJmByzc6TBX/8itUkGmdrqjT6uO/II9D9UmQ0z4NYr?=
 =?us-ascii?Q?+f0QbWqpQbRGUgppvKvaW5PWQUCHYdbqnbUhq/8zj/yy9Tj/rWaYjs0fgzro?=
 =?us-ascii?Q?wrJqpvoL2stgq6n3kvEPkk0u2ISwIw7FetDLwjxDy9Dzz4UJztNSbBJ8aCTq?=
 =?us-ascii?Q?OFqA7tJQEBIy6tq3BY53r9TDvjmepPVZpTueKWOSMOqf/AT7HOmlQfyZ+OSR?=
 =?us-ascii?Q?dtwO2ApzmMi648fMLukRPnRAgOjESGCWGeX9JzamHNyQfNfBAtAGJO1x8PXx?=
 =?us-ascii?Q?dOn/tmJI3fUc/RfdITB0kx0gK4RVwGD6JoPqc+3uNOgWhvq+51L6DTelEd3m?=
 =?us-ascii?Q?coQ8zzaCfib1mQy1Ea7QS6iO1DhCeXa86N7GKI0Ofum3u76cji08YpWO3zdi?=
 =?us-ascii?Q?bZBZTw1wJjWjIhfBn4acyHFym6u6Oj3KRg0hOMSIDJuqG4FFgqrfuOsvpCyU?=
 =?us-ascii?Q?Tj6gzZ6V5y5p536G/wkkepUo8Ut85liwp0GYcNMbCupqNCONTgcPrrYGYriR?=
 =?us-ascii?Q?zyfk0F7sNDV1vilZPho8YQBQh2W4Yt/FzkCDq+892nMI3dKOm0jN4Mzu2SVO?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 733d5cc6-294a-4f7f-07c4-08dc790007de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:07:02.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyEMJaj4vSMlmaBidYBWd579QLrG1UeYzDeaUF7F1SnspOpnts3rufS8E42A74Cbqx5i9rZxE6DA4xwTjIacIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

On Fri, May 17, 2024 at 05:13:19PM +0200, Kamil Konieczny wrote:
> Hi Rodrigo,
> On 2024-05-16 at 14:10:11 -0400, Rodrigo Vivi wrote:
> > Xe is no longer holding a runtime pm reference for the life
> > of a VM or exec_queue.
> > 
> > Also, IGT changes autosuspend time to a minimal time, so we
> > cannot guarantee that rpm is still suspended after the execution
> > has finished.
> > 
> > So, the reference usage is not a reliable reference.
> > 
> > Hence, start using runtime_active_time as the indicator
> > that runtime_pm resumed upon our actions.
> > 
> > v2: Usage of runtime_active_pm and inclusion of mmap tests.
> > v3: Add doc for the exported lib function (Kamil)
> > 
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  lib/igt_pm.c        | 24 ++++++++++++++
> >  lib/igt_pm.h        |  1 +
> >  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
> >  3 files changed, 53 insertions(+), 49 deletions(-)
> > 
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > index fe7692960..928b72685 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -1412,6 +1412,30 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
> >  	return -1;
> >  }
> >  
> > +/**
> > + * igt_pm_get_runtime_active_time:
> > + * @pci_dev: PCI device struct
> > + *
> > + * Return: The total time that the device has been active.
> > + */
> > +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> -- ^^^
> 
> > +{
> > +	char time_str[64];
> > +	int time, time_fd;
> > +
> 
> Is the time in seconds or miliseconds? From str size it looks
> like miliseconds, so why not uint64 for time?

you are absolutely right. it should be u64 like in the kernel.
I'm sorry for having missed this comment here.

I just sent a new version of this patch addressing your comment,
and also a new patch in the series addressing the old code that was
already in place from where I had blindly copied it:

https://lore.kernel.org/all/20240520190347.242249-6-rodrigo.vivi@intel.com/

> 
> Regards,
> Kamil
> 
> > +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> > +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> > +		igt_assert(sscanf(time_str, "%d", &time) > 0);
> > +
> > +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
> > +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> > +
> > +		return time;
> > +	}
> > +
> > +	return -1;
> > +}
> > +
> >  /**
> >   * igt_pm_get_runtime_usage:
> >   * @pci_dev: pci device
> > diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> > index 91ee05cd1..b71f7c440 100644
> > --- a/lib/igt_pm.h
> > +++ b/lib/igt_pm.h
> > @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
> >  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
> >  bool i915_is_slpc_enabled(int drm_fd);
> >  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> > +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
> >  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
> >  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> >  
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index 9cb00c7f1..9e1f1723d 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
> >  	return true;
> >  }
> >  
> > -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> > -{
> > -	uint16_t val;
> > -
> > -	/* Runtime resume needs to be immediate action without any wait */
> > -	if (runtime_usage_available(device.pci_xe) &&
> > -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> > -		return false;
> > -
> > -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> > -		return false;
> > -
> > -	switch (state) {
> > -	case IGT_ACPI_D3Hot:
> > -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> > -						      &val, 0xd4), 0);
> > -		return (val & 0x3) == 0;
> > -	case IGT_ACPI_D3Cold:
> > -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> > -			IGT_ACPI_D0;
> > -	default:
> > -		igt_info("Invalid D3 State\n");
> > -		igt_assert(0);
> > -	}
> > -
> > -	return true;
> > -}
> > -
> >  static void close_fw_handle(int sig)
> >  {
> >  	if (fw_handle < 0)
> > @@ -323,27 +295,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		uint64_t pad;
> >  		uint32_t data;
> >  	} *data;
> > -	int i, b, rpm_usage;
> > +	int i, b, active_time;
> >  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> >  			  d_state == IGT_ACPI_D3Cold);
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  	igt_assert(n_execs > 0);
> >  
> > -	if (check_rpm)
> > +	if (check_rpm) {
> >  		igt_assert(in_d3(device, d_state));
> > +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +	}
> >  
> >  	vm = xe_vm_create(device.fd_xe, 0, 0);
> >  
> >  	if (check_rpm)
> > -		igt_assert(out_of_d3(device, d_state));
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	bo_size = sizeof(*data) * n_execs;
> >  	bo_size = xe_bb_size(device.fd_xe, bo_size);
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> > -
> >  	if (flags & USERPTR) {
> >  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> >  		memset(data, 0, bo_size);
> > @@ -381,8 +353,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> >  				     bo_size, sync, 1, 0);
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> > +	if (check_rpm) {
> > +		igt_assert(in_d3(device, d_state));
> > +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +	}
> >  
> >  	for (i = 0; i < n_execs; i++) {
> >  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > @@ -426,9 +400,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> >  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> >  				NULL));
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> > -
> >  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> >  	if (n_vmas > 1)
> >  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> > @@ -456,15 +427,13 @@ NULL));
> >  		free(data);
> >  	}
> >  
> > -	if (check_rpm && runtime_usage_available(device.pci_xe))
> > -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> > -	if (check_rpm)
> > -		igt_assert(out_of_d3(device, d_state));
> > -
> >  	xe_vm_destroy(device.fd_xe, vm);
> >  
> > -	if (check_rpm)
> > +	if (check_rpm) {
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  		igt_assert(in_d3(device, d_state));
> > +	}
> >  }
> >  
> >  /**
> > @@ -558,10 +527,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  	size_t bo_size = 8192;
> >  	uint32_t *map = NULL;
> >  	uint32_t bo;
> > -	int i;
> > +	int i, active_time;
> >  
> >  	igt_require_f(placement, "Device doesn't support such memory region\n");
> >  
> > +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +
> >  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> >  
> >  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> > @@ -572,7 +544,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> >  
> >  	igt_assert(fw_handle >= 0);
> > -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +		   active_time);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		map[i] = MAGIC_1;
> > @@ -582,22 +555,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> >  
> >  	/* Runtime suspend and validate the pattern and changed the pattern */
> >  	close(fw_handle);
> > +	sleep(1);
> > +
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		igt_assert(map[i] == MAGIC_1);
> >  
> >  	/* dgfx page-fault on mmaping should wake the gpu */
> >  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> > -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> >  
> >  	for (i = 0; i < bo_size / sizeof(*map); i++)
> >  		map[i] = MAGIC_2;
> >  
> >  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> > -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +			   active_time);
> >  
> >  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> >  
> > -- 
> > 2.44.0
> > 
