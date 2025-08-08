Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E8C87FDA
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 18:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0832710E0A6;
	Fri,  8 Aug 2025 18:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpGIerhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A23A10E0A6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Aug 2025 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754677299; x=1786213299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=roi7mNCUehq0AS8tV6P6WshwAZMSyZUVbuxtTT0Vt7w=;
 b=fpGIerhREVHCG5Dvssn0lRPNe13Z6QcpCDAVZQ14ztjd/k3MOaQXc7Qw
 Rz8yhmKwJo7M/mAGkrXEZhPPCdWTEKZZJCYgY1ESKneQOj4bV2b3U5yKp
 rHXCf6PwmQwPPSrnuUUds4tu4kxFec5FIYyPjiHrzGKv1NaJ8VVLDdHbX
 S7gLgs9EoQw/BAdt29zOXrzJk6GMuy9hdJeGbRfeKM3ZSzd/fAtyL1cj4
 kI0vvd/IVnR/3vCmKg1FoUdFUkfJSLeo9kmVdjKWlTa1Et03oXQ2TcIYC
 z9KGvS6mNs75YyFFQlZxqHxz4uqkESqRvjLaEuPYxPL5YPF77t/HAb4AO A==;
X-CSE-ConnectionGUID: UY1a9AhnTu+Vt351AiWItw==
X-CSE-MsgGUID: uSdN0jIITfaHkKA2GlsHSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67301403"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67301403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:21:38 -0700
X-CSE-ConnectionGUID: U8rRWf2gSlmTNKJ9HIO4VQ==
X-CSE-MsgGUID: cSRzRsvbQoqCI9gPZHZT2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169509682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:21:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 11:21:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 11:21:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 11:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7Xm7Q/rQvkPx/mF602Lcg92FT8vdcHMpA2ES8Sy3Yh3zzfWO+kDabxNO4Pw6OAstUMEbJjOfcwTMJHaLExvzKejHgqRHtz2BIxiDuH+fjpCHTmz0vKQILigITUXCqi05AnqJaw5cGlgmJ4h7E+oPYBEM3hyQ+8/yhpGnRqtBb3WBZZ5b+TbLferGslQXwOdY8fWM64XzUMi/fzG8ULGQQCUcGvPZRfYaQC7boaZpAVM9DdartKv6/Z7GUptqsSDWL6rmM75w2edk8U33FcFOERwESRiRQT0oWEnAj3epWSd8lpT/UPMUE4xGNEpDxZtVcXcihlME0RBc2aZQ//sSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGCH1bxWBgfKajz5rlIT3Sov0ZCEq6JhJt0+q/nWp+s=;
 b=F/SLJrIQjp5CB9CIk1Z/H9Kazm19+BGtCDBhIBhr5iBIXXVJ5hLFIEZ84fOBM6ooYMwD7O8rTj3RfvFLK+LxID9n39w7+iI2mZDBe7N6u4LEGQc7x8uhl2XP+Eak0jPyZymSWE2PssnMn6icyozMgawCRGB5nxlm6IyGd0CCsWfqp3zbdi2Cp+PFWTuDl73EiJ/4bQeUdkB/YpXkpLKyaVzsgyILB0dPOgW6MuugO9/riuxzBqUqwl07td4eZIoupU5TxPm8SMguz63bhN3I8cmbXWmo2R6PFZDWmhvvTaRyoACn/n4RdU9Z75XdqZgypvNMnafClqc2jCloKXBw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 18:21:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 18:21:34 +0000
Date: Fri, 8 Aug 2025 11:21:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Add
 prefetch-sys-benchmark
Message-ID: <aJZAKtl+M/G9nlQ4@lstrano-desk.jf.intel.com>
References: <20250808032402.1652099-1-matthew.brost@intel.com>
 <aJXYNY9lzk70l0c6@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aJXYNY9lzk70l0c6@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:303:b8::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 456ac29f-84ab-419e-584f-08ddd6a867f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J8TKDuqiyWPQ2/rYQBYQftfS9Cgd7pu4HUf6jm2mK/CoNJ7czCq4dcc//BmW?=
 =?us-ascii?Q?e8CZMEF35sqXZb5/cCtOyW++c5ct0Gr+MKWqm3nPP9mQwPHTZKB4xqWEtwp6?=
 =?us-ascii?Q?ToJHo3emz0IWpeILBoR2umEY7JZNdLaGAUYReRoIcKVKUPFl9TiJe3JD5yOf?=
 =?us-ascii?Q?p1YL2r/scptcz7z5a4/0Zvc408HsQbSCaWD626AR3vLUu0xB8Y9b86j9IyuS?=
 =?us-ascii?Q?t+Or8LQ0KvYW/+lM8++r/IMUwdrMG/1VJqV1YhBJBWMoz4sYGhxGU7N7RdXj?=
 =?us-ascii?Q?n4dsGFB1ulFB1FvUpZF7JsefLmHt/NCgIcL8KRF2mhHoe/iSVMb8tFUEcIm+?=
 =?us-ascii?Q?vkxhbZ70iX7lRAiBcR1rtcDmav32reu1ODn9usDJDipoHqrbuiuALgijB1mV?=
 =?us-ascii?Q?9O1idoDUHGI27FYD5O2qPwQhUO4NvCUbBrSF3o4LjiWuWPRRBSF9B4m4GF9I?=
 =?us-ascii?Q?u/fXYERTKyAAVw271kXRXQklgXgCVsrlKS8Y09SNiRWHZzClwJjjvrD9TsKL?=
 =?us-ascii?Q?r1FUZy1Ocdk122oNiTJ6AXtGtktgi2Oh8097Pf0xkI1SJtTIII02yRHOCsyN?=
 =?us-ascii?Q?wV7Ppa9dhrkFRqtAgMweV0FIYUNtEyQguQeCOTl+m2FCQSuz/5QWSEzGhLQd?=
 =?us-ascii?Q?Aah8Bu0c4nlgnLqJ1fbA9toryC7Ec/h0IXSOmreHNDPn/taUIs+/loH/ACgZ?=
 =?us-ascii?Q?NNMYTFXSuIwyQzWkNrQgSdRfvAVGh8u4pZf8eJigDU9JXO4p3+LTZC1DI2S4?=
 =?us-ascii?Q?CZLSOFB9fT41vdCizWePilEtgxtl8CmAwbRo2DQX/VJoBSh7/xXUDgqb1QDw?=
 =?us-ascii?Q?suR3BPWFPfSJMJppvsx7Fk7hl5kDFqFiiaYOKrkhIQzaiLa0ogsgL4SxJ21Y?=
 =?us-ascii?Q?4LlY5BVylcmFQSJ6uD+ozUeodYatfxFSxR4vkPV0Wsz5ZSrc3ytHsZjhQykF?=
 =?us-ascii?Q?S1ZsrWW6vw1svoOs8ZAQN2opl+Bqr+I+JXxMiYsrK7C0iW2Il4r5sKDGdAun?=
 =?us-ascii?Q?6XziwBa9fQG3uBRJHMJPffuR0j4p2Qb24ssULB59+D9HMDSepNWNapC+PRY7?=
 =?us-ascii?Q?+ZqhJvhQ6zLPgOay23n+zxakGfI1enNvqkbxrHVrFimq42hFxuxy0pQU+b2z?=
 =?us-ascii?Q?tvcw8QLQ1i63tGLNIavZhM4Y9QpbVK1p00V/bSZKWtpVYIKj6CFNyfTCDiAL?=
 =?us-ascii?Q?n3MV7rBIqX9PuaSSJvQWoUUYjoZjcvUlhShG5tSrHA4qflmsIJnFxiw7kkJ/?=
 =?us-ascii?Q?iXmhbyfSKdGgDSk7l2PDqdLF2TRqlSH3roWDl6EdR8+fBruCHFdICtBCYP0S?=
 =?us-ascii?Q?cDUPpLwcLF/LYBpWNrIhVfekTS7QEAaVhYgjYiQoM6Jq32ExfjhaeVgLUlfZ?=
 =?us-ascii?Q?jtuTUhpdOUwxqMZo2417IJnXETdD5PZWYi4g11dFJN0yzC1UJ7rqUDiQwnqO?=
 =?us-ascii?Q?YRtEbSW2sp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJiPUxLfsE8JeV5ZIrGVbJooK7BWPQySZGrP0Nrdxd/iqWMpITQ/g/mBCHO8?=
 =?us-ascii?Q?5W9804y3LOelce8hjzM9SjVKRHmwFBKLncXgmqKJqZ37slcv624tEaytvhbA?=
 =?us-ascii?Q?saSPlzrvAsiJOfnFzlwKrxqvah8JzTze1kf1hr1UkbYpR9jplP9DjyKrtQqL?=
 =?us-ascii?Q?hQBoKtjciZVOTRJpmhkDW5KkRIJxI2K0fR6c9KZ2Z3Rly+cuGl9gtXdq8nkV?=
 =?us-ascii?Q?XMV/0xJxm+pP5DvZwZW5vFzWTuvFVIV1a85I6+E3Ttbqtwbm/Fv3gPrcs/Gn?=
 =?us-ascii?Q?wxHPe/ar+N8BBCXu+H+8d4qGJq1e/fbe1WsKEYWWy8UZQT0qi6G643/B25ug?=
 =?us-ascii?Q?kfUITCgLieaKWZwHeWsz0XlLIWhSXmJuvlY05oFJTsBWwSLyRqgaKL5ta2ex?=
 =?us-ascii?Q?fJg10hFXl8/Xw8aSiavFoAAUUNYMuooXyhmVYAKqMjhSSXxGG6QCrGseZGvi?=
 =?us-ascii?Q?kBp4dYitE36GdurYJsTSHi3sgPWpVfkXGPjxcxDWRyMrNYYQc1M/yH66wRgt?=
 =?us-ascii?Q?6eO9RwxUbiIMCC3DZ/XbA9/xhnON2+levyHTY9tZ60IG0mm3xFwN/5mLV09t?=
 =?us-ascii?Q?uN1ecS5qr/X5EIOPSOmPsfFdv7/O9hZ8so7Ue2wx+1Z1dsnhCgYWsjLsZ+JA?=
 =?us-ascii?Q?I4yMvex1bpQ5ySiXlHmq2W4R1kEiiz86RGbPpE5JQUeLBVdFW9c89xc+roa/?=
 =?us-ascii?Q?LUyy6aDgH885K1HkL5Luz7gfApUv9+dZlSAzanugEIWLFQmx1kNUcMjaXTBw?=
 =?us-ascii?Q?btQxu3xNSMk3ZxQF+qqZL3f+BSV44jKKqJvFSPpQpd57XWU3vn4wq1bPtOt+?=
 =?us-ascii?Q?MzG5cSjPY5R6N4pNBBh7Xao7XJFN8C7nq+3N9vefMb5lDZVNK3Qp8tUwU9qc?=
 =?us-ascii?Q?LeYcE7xnC0wZQzcsrROgp4ToT/cvARl6+LD6+zbQzTlkqY0lAwiUOtnRurUe?=
 =?us-ascii?Q?X27xG2L+791iZRx6JlXmSEIA5FG5bC/6Uz+ICO9BqltfBmgJ/yPm0+r840Nk?=
 =?us-ascii?Q?tBLTj2jRitr/tASCFksJauRHRA3okQy3+LgXb9bgQNhT+JVTU/6VGIHCt2SP?=
 =?us-ascii?Q?HpZntyVDb3PYL56joLnTan8iP47DOVZCb3jP3Tq3VSojizO0z8DfX1ZsX688?=
 =?us-ascii?Q?cwxHb6oFYmUKAJnu/UM6Bk6JLgn6hSNKk5R2s04gLNfu1GV08XucDaxQc/z3?=
 =?us-ascii?Q?DZTgkiK396CDg1JO/YLPF+J1bYq4QHskBxobtecrmdelDAMqK6PRfcKLf1xw?=
 =?us-ascii?Q?F2TsCqhnq3JEKiABimxMgJSgZ6FvT8/O5qYc046E/b2zERvJM1J4v6JFVpZo?=
 =?us-ascii?Q?dANnNaNV7leUKgtC7DpVpv1PWDBDiH9R2ShAhPViEfG7eIXCo3cmirzAQ6jl?=
 =?us-ascii?Q?Dwur8L2uClp6oGal/YLmKHeXnTmwcR3AASmj6dIMcqUlNZHLqfpny6RQicp4?=
 =?us-ascii?Q?9PcxQN/Yuu+fi0yg54TtBPdB4/FWYlXgSLx8AfvKklp5PDL03GvNJBPyNa8j?=
 =?us-ascii?Q?gRKbznPUtSoWYQd0gsniehD2lyKmx/NDyQ/pJqVNctKZJNWBluUojYHshzaQ?=
 =?us-ascii?Q?Hnq+aEdDIJiIwAsNYjkV7GpwWo8JQ1r0cgvexYGv8Si0p+9SoNSZSzxgsjVF?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 456ac29f-84ab-419e-584f-08ddd6a867f9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 18:21:34.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+BGPB2yw8g+t+T58ntxQwPDT8pWLDJwKkGbOO0Ccccw6s3WGnGqKQMt0E0jIrF+ez8+/Jah2ZgXX7fQrnpzRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Fri, Aug 08, 2025 at 12:57:57PM +0200, Francois Dugast wrote:
> On Thu, Aug 07, 2025 at 08:24:02PM -0700, Matthew Brost wrote:
> > Add prefetch-sys-benchmark to uses prefetch to system rather than
> > faulting it back and measures prefetch to system bandwidth in GB/s.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 42 +++++++++++++++++++++++---
> >  1 file changed, 38 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index dd5303855d..2703b7f1e1 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -775,6 +775,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >  #define THREADS			(0x1 << 23)
> >  #define PROCESSES		(0x1 << 24)
> >  #define PREFETCH_BENCHMARK	(0x1 << 25)
> > +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> 
> Nits: It could help keep things unambiguous to use the same term here and
> in printf() for SYS/SRAM, and also to rename PREFETCH_BENCHMARK to add the
> direction.
>

Let me clean this up at merge.
 
> Besides, test_exec() is becoming huge. This code section might be a good
> candidate to extract as helper as it is almost a duplicate. Anyway, this
> larger refactoring would be for a follow-up, so:
> 

I agree. Let me take a pass at cleaning up this function, I want to
retain the functionality of one large data path called in many different
ways, but clean it up for readablity.

Matt

> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> >  
> >  #define N_MULTI_FAULT		4
> >  
> > @@ -955,6 +956,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> >   * Test category: performance test
> >   *
> > + * SUBTEST: prefetch-sys-benchmark
> > + * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch in both directions
> > + * Test category: performance test
> > + *
> >   * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> >   * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
> >   * Test category: stress test
> > @@ -1022,7 +1027,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  	struct aligned_alloc_type aligned_alloc_type;
> >  	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
> >  	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> > -	uint64_t prefetch_ns = 0;
> > +	uint64_t prefetch_ns = 0, prefetch_system_ns = 0;
> >  	const char *pf_count_stat = "svm_pagefault_count";
> >  
> >  	if (flags & MULTI_FAULT) {
> > @@ -1350,8 +1355,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  				} else {
> >  					igt_assert_eq(data[idx].data,
> >  						      READ_VALUE(&data[idx]));
> > -					if (flags & PREFETCH_BENCHMARK)
> > +					if (flags & PREFETCH_SYS_BENCHMARK) {
> > +						struct timespec tv = {};
> > +						u64 start, end;
> > +
> > +						sync[0].addr = to_user_pointer(bind_ufence);
> > +
> > +						start = igt_nsec_elapsed(&tv);
> > +						xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> > +								     1, 0);
> > +						end = igt_nsec_elapsed(&tv);
> > +
> > +						xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> > +							       FIVE_SEC);
> > +						bind_ufence[0] = 0;
> > +
> > +						prefetch_system_ns += (end - start);
> > +					} else if (flags & PREFETCH_BENCHMARK) {
> >  						memset(data, 5, bo_size);
> > +					}
> >  
> >  					if (flags & MULTI_FAULT) {
> >  						for (j = 1; j < N_MULTI_FAULT; ++j) {
> > @@ -1438,11 +1460,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  		prev_idx = idx;
> >  	}
> >  
> > -	if (flags & PREFETCH_BENCHMARK)
> > -		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> > +	if (flags & PREFETCH_BENCHMARK) {
> > +		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
> >  			 1e-6 * prefetch_ns,
> >  			 bo_size * n_execs  / (float)prefetch_ns);
> >  
> > +		if (flags & PREFETCH_SYS_BENCHMARK)
> > +			igt_info("Prefetch SRAM execution took %.3fms, %.1f5 GB/s\n",
> > +				 1e-6 * prefetch_system_ns,
> > +				 bo_size * n_execs  / (float)prefetch_system_ns);
> > +	}
> > +
> >  	if (!(flags & FAULT) && flags & PREFETCH &&
> >  	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
> >  		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> > @@ -1917,6 +1945,12 @@ igt_main
> >  			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> >  				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> >  
> > +	igt_subtest_f("prefetch-sys-benchmark")
> > +		xe_for_each_engine(fd, hwe)
> > +			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> > +				  NULL, PREFETCH | PREFETCH_BENCHMARK |
> > +				  PREFETCH_SYS_BENCHMARK);
> > +
> >  	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> >  		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> >  
> > -- 
> > 2.34.1
> > 
