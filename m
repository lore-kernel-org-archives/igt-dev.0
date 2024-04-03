Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4070CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 09:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793B610E86C;
	Wed,  3 Apr 2024 09:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvAZt/x5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8BC10E86C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712138256; x=1743674256;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZtVu1A31UgcZlOpjyuLhoGMjBZ7Aq5BqszqagAV+u14=;
 b=PvAZt/x5Y20UGZ8Ut1ULIYseAhDfDtRrYmyX8MQjIADllSC6xlylT9Gw
 izgCKsERqNP7goZjaGDNvVsgwldHVCMg6tikMUEGTWf/FXaklQNBLaMbq
 E6G8UTuT2w1UKOSG/eQImRYe8kwAWVaCA/5BNYXANtx9+VuDIaQLL+WtE
 2GH4LsQKfEwWz9Q08NSiSVDC6KfbqvuohKQM0GAaBDRpFCFmBCQp55Rqm
 DCBFWZkYTIMX631mB1i6MnDWUz9hhlAZMl+YVy8jU0NCtof9RklSPrlFK
 lSKmWyA7al8tD5m+byibd9FtIUr8sDO8U8CHIEWsGrrmPkTn6TsE48HQk Q==;
X-CSE-ConnectionGUID: VbAGZCnWSQ+D+ljzEseZHQ==
X-CSE-MsgGUID: 5KmkmrVQRTyJQiMcyPsALg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18803697"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18803697"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:57:36 -0700
X-CSE-ConnectionGUID: 7gMS7A8nQfme8cMGYHkmYg==
X-CSE-MsgGUID: zmKfrOWaS/6howqY8TtsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="22858952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 02:57:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 02:57:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 02:57:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 02:57:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 02:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfzk2+TLVFBNAp5xZItNguQwOz97dXaqkbUuj8ViT5dqXUmZq6p4X5dI8dlB492LGBzh7zWnDIwQJ448Q/IOb+zeAKAC0ae7sMe1zfRvdBd/VarLXlP1cqCAlqMJdnJtfkw6be8hqBGYkrkQabnEIr7H/YQa4gaOFLL8n6WDylVwrHq+pIIYg5dQDrB9ImyJ5BTIJXoI41VylcreVXax92WGKyh+tIzOp7xoB4pdWAkjNfHBN64xKT252+uoB9v6Uq9tI+nr1hST5jFqvqZRRtyZYD4M/y5anzbPZkNTyMG68XRW6DfaYzA29AakweCx5DMgkzyME/xQKOp+VLSNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NVjAQ6BswbtlT9aISUdmLLB/c2Ov+IxU+cghlggVMI=;
 b=LDeeNEk3S60ErQeH9YQL7bDR4UdbeXK0nV/ph84ieGYwRZNUYW74rzCKtH7JJ6MVzbawM+/CIXYIpDyDNFeg7AxtWi0VNDcKzKRhOqKMen970Rbp213BWujjZjrB4Z4trKqwO3IrogVmzEaZQ+YgnAEc70AD4aFTsOLYpMjlKBJwC0BQhDWnBtMEp26OYyJfizR4XMy4nmXOVBPo5S8CaTR6bgFMp+SIoNW9/3a0xquhSVSketyMJzg2u+zO0j4xmCG7CVHfwgMVBdJU/9pkU011JKHlp9awBovSvbnsdeoAPGM7p1g1UL0SyAtOjpun41NKGseHKZKDpQDaNZ91oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 09:57:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 09:57:31 +0000
Date: Wed, 3 Apr 2024 11:57:29 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,2/2] lib/xe_mmio: Introduce Xe MMIO lib
Message-ID: <20240403095729.ksd64tly6fwkbzds@intel.com>
References: <20240326100921.3539141-3-piotr.piorkowski@intel.com>
 <0319a99a-171a-4215-a568-672ae4049a56@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0319a99a-171a-4215-a568-672ae4049a56@intel.com>
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB4905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbtPuu9PSFkafocyzl2iu2OXLYzGDPokTmK+6ZOirfZ0770aOb5qAY1cIjib95/4DDiDIvtdhQXjfgA8AxA50w3V5ORGKBWmdmOQygpZ9QflUbAAIovNgdlydQ9SxwcJxA1muLRITM/9vOAb47adIicbZXLwqSAlRqcxaou3O/ASzdmokVWj0TcFAF/tL12UOYGpY8nCj5KolTZHnueO9xUAiA+0aKFCzGSyhN14S60j86IhmETRtvn8//8HX5iFhh1aYyFqH4ALqpJM/OSQTI8NxbqZZ8XuMyBsReeWEr39nVzoHcLrH1ZUesKQqhhkNVaU3s5862oWqmpJsPMeml+oNcM4+yssslo47BqzcIW0pSp29G+gfvBPaofEZiwxdaPGUG/JZ2TXir5y7hiaUKs3MXQO2jQIrjhN9JY/Hnge4yJix5BBpiNi5nobx+mWQNj3VdEDSIM6tUV/XGjDpY1KAulTjgJLY5KZq/kNEK7P+BFNVxwttoBpNGgToKv1/W+gneOISKv+XR+JKMA0nclQLB8dwFhtRtLEe5mP0WDLy+cv1zfAX/O6cibJIGk5gX6Bfl4VzbFBav4hymc0OUDBQFORcTzG0YOdCgu3Eoy0yMkE7d4AtvaxUlad3gTvq5XjxrIyW27NqRRdEktfu5WDjLnU7zRJTtlApocgDJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGkzMWVST0Ftc3MwVmkwNzlRZ1JndkN6Ly93K1Y4eUhHeHU3QVduYTQ5YlFW?=
 =?utf-8?B?SVdXenFCSG9TZkF5djAyQUpVNUtWMHNWV3ZLNDNvY3E0TnczRUZyUVhaaGps?=
 =?utf-8?B?dmc3SElXN0FwSFlKUTQrMGUyY3BBK0FCc2w4M2cvSHhOZWppQklMUGhQbXAr?=
 =?utf-8?B?UjJXMldMTUExbjVoZWc2c1ZMTDUyaHNzcU5ubzFaQ3kxTkwvaWFFR0prSDhn?=
 =?utf-8?B?RmtxZzRxYTBSZ3JNb3lSZ2ZlWnovb3pTZUVjS0F4ZDd5S1o2ZEVORFBpZDlR?=
 =?utf-8?B?VWpudWs0ako3WkFWRFZ6bDZYN1NDV3hQSmk3ZVU1U3QyMHJoSnIyUVZuMFVX?=
 =?utf-8?B?d1VLZ0c4M3JoMnNFZXNxdGdReFZUTXI3YnU1RklVeC9QOWJJUDZXUVdXVlNi?=
 =?utf-8?B?MDZyQTkxd2grTGVKbC82Rm5JaWx0VXBmc3JBVHdmY0hIRkh1bzcvZDZnR2tH?=
 =?utf-8?B?QXRvMTU3Ykp4VFNqS0RZQVBpRDFuOUZFa2NHS0VrTXZxdURJVW85NGx6M3Zy?=
 =?utf-8?B?M2daNG14ckZiV2xNcmRYMWRhTmx6c29mQ2tGOUdPdkliaXo2cjFNVnI3eE50?=
 =?utf-8?B?WFQwTVpreGhOYnd2c1pGbFBrcC80d0RKS1ZqM3g4U0wyTzlDN1dxSGxEeHh4?=
 =?utf-8?B?bmNjdzN5VTIrME5MalRtcU4wKysvUTUzOThpVG51R3RZc0xoRjdBdGwrS1JE?=
 =?utf-8?B?MFRnVEdOSW9qNXM5L0x5KzVCZGFwSi9CbHIyWnlpSFp4bEtMRG91UmNxSXV0?=
 =?utf-8?B?dzBYZnB0WDk3MXBUcUFEeGlZamNYZHY2YmhtZjdzUWZ6ZHBqUXppbDdkeW9h?=
 =?utf-8?B?clZVZ2RwK2htUjd0Y3FUSG16b0VBS3RielJLcUJNMVpON3VVRkxlMXc2R1d2?=
 =?utf-8?B?SUdmQ2RzOTBHcmVLdzRlaWxiZVRZbDB6Y2orWUdSVXJEZmVOeWpuTFJxL2x3?=
 =?utf-8?B?d0dXSFF5VHVsNGIrZ0J0SkFROTRseTZBWGllZVp5QWZSbDJrVU54M2FzNlZW?=
 =?utf-8?B?dnlRdjB1dDdhbTNndHZzN0NlaEVERlVDbHJ3bU90RmdmNVJPY2hLN1BxUTNX?=
 =?utf-8?B?emFnSnRBcW5RdkN4NWZoNGNMNGltS3JUT2RpNEtJRjlxNjlBMDMwTEt3OTFh?=
 =?utf-8?B?VERRcEFTTzRzR3Y1aU83d055U0hlSmM1ZDhJY0pZK2RPOE5Qc1l5Q0YzYnBo?=
 =?utf-8?B?TG9RbkZsU3VDQUVEUEZIUXRaZXRlaEFua08rVFlYVUJUblVKaVNDRVh0dHZj?=
 =?utf-8?B?SU1CWkEyMmNBaVNSMjBOTjRPQUVwQkdEUDRTZVpxR3Y5a01ITmtwWXp1Y0ND?=
 =?utf-8?B?ZHNzK3EzaFVhZkFzdk0zTmpJa2JQclRiSjlrWTEwL2dHd3VsSUFkRmhISENo?=
 =?utf-8?B?ZDRTTXhwd1Qvb2xGZFAxTEhmUnBIaXJVdXJQQUxSRTE1djQ5SmRyVmt5VUFH?=
 =?utf-8?B?Wm1vd09JL2c1eHhCNkZTTUFVUlVnWDdoUXVXZDhTR3lzQ3JXR2o1NktRRnNL?=
 =?utf-8?B?NTVXNk1veld0aWRuSXRPZTMvdDkveXpndEhjTFgza0RObXA1R0F0RzEvck1E?=
 =?utf-8?B?QzFVR1BFZ0tRcENMWUlQQ28wdit2MDUxanRHa1BOcm9zRDF4eW9DazQvUEJx?=
 =?utf-8?B?QzNnWHd2U1hVTE9pZVhPSEZyTmZlNE04ZmhiS3dMQ3BUK3RRWUVSM0FucEsy?=
 =?utf-8?B?RXhjb1dGMEFOdDJzUytSeFFFUEZuU0tpNkNXZmRtUk5pSDNvZGo1KzFuWENK?=
 =?utf-8?B?WlJ3ZVhkb3g3eExLL05YN3ZydnpEUXEyOGdOWG9Xa0F2R2xMYUdXT3JpZmZD?=
 =?utf-8?B?a0RBWVpNNVU0MEVzK0x5OW5rOW9JMGhsTTQwNGdpSVQvWDNpdVErdlJIbHAv?=
 =?utf-8?B?NTJ2blV3bGlkSWdyRWxIbTA5TW9JNk1Nb2tMenVVelNTZEVlWDZBQzJYU0lj?=
 =?utf-8?B?OWEzQ1IxMEt5dVBQdTZYUCtudG1yRjh3RGJud0NuUjdUdTE1eDU1Y3pXdCts?=
 =?utf-8?B?ZHJpb3djTVd5Z0NwSnBtSkErT0Z2OGtZOEhrVUhDUTVNRm5xT2ZqN2NMaXpn?=
 =?utf-8?B?dWpZTlk1UDdaNzRwb3ZDVmZwb3BXL2lJU3B2VXc4THAxdSt1cVQrekJZdEE0?=
 =?utf-8?B?TThsR3dBSEU1aWltRm4rY2gxbHQwZVQya3BNNWwyUFpTSlNacitBbG10K3dr?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8ba534-d5ff-4bc3-3eab-08dc53c47a6c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 09:57:31.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fr14iyR8UVfOHVdnYAoHc89thkvI1y3MSrjxwHu37mJOGpkQAHDeMVsE9WL3dipi+bu4d0LEmHYjixG8TNOhUjqMhBMhOq+TiJsLUKN8H+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

Laguna, Lukasz <lukasz.laguna@intel.com> wrote on pią [2024-mar-29 10:35:34 +0100]:
> On 3/26/2024 11:09, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Currently in IGT we have a library intel_mmio for simple MMIO operations
> > on intel GPU devices, but it is limited only to accessing registers,
> > has a lot of legacy code related to the i915 and offers no support for
> > multi tile.
> > Let's reuse the memory mapping from the previous library and add separate
> > helpers, dedicated to Xe, for registers and GGTT access that support multi
> > tile.
> > 
> > v2:
> >   - add missing std ifndef/define in header lib/xe_mmio.h
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   lib/meson.build   |   1 +
> >   lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
> >   lib/xe/xe_mmio.h  |  42 ++++++++++
> >   lib/xe/xe_query.c |  19 +++++
> >   lib/xe/xe_query.h |   1 +
> >   5 files changed, 270 insertions(+)
> >   create mode 100644 lib/xe/xe_mmio.c
> >   create mode 100644 lib/xe/xe_mmio.h
> > 
> > diff --git a/lib/meson.build b/lib/meson.build
> > index a5651571b..e2f740c11 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -111,6 +111,7 @@ lib_sources = [
> >   	'igt_dsc.c',
> >   	'xe/xe_gt.c',
> >   	'xe/xe_ioctl.c',
> > +	'xe/xe_mmio.c',
> >   	'xe/xe_query.c',
> >   	'xe/xe_spin.c',
> >   	'xe/xe_util.c',
> > diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> > new file mode 100644
> > index 000000000..bd4227f25
> > --- /dev/null
> > +++ b/lib/xe/xe_mmio.c
> > @@ -0,0 +1,207 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include "igt_device.h"
> > +
> > +#include "xe/xe_mmio.h"
> > +#include "xe/xe_query.h"
> > +
> > +/**
> > + * xe_mmio_vf_access_init:
> > + * @pf_fd: xe device file descriptor
> > + * @vf_id: PCI virtual function number (0 if native or PF itself)
> > + * @mmio: xe mmio structure for IO operations
> > + *
> > + * This initializes the xe mmio structure, and maps the MMIO BAR owned by
> > + * the specified virtual function associated with @pf_fd.
> > + */
> > +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
> > +{
> > +	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
> > +
> > +	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
> > +
> > +	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
> > +
> > +	igt_assert(!mmio->intel_mmio.igt_mmio);
> > +
> > +	mmio->fd = pf_fd;
> 
> 
> no mmio->vf_id = ... ?
> 
> 
> > +	mmio->intel_mmio.safe = false;
> > +	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
> > +}
> > +
> > +/**
> > + * xe_mmio_access_init:
> > + * @pf_fd: xe device file descriptor
> > + * @mmio: xe mmio structure for IO operations
> > + *
> > + * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
> > + */
> > +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
> > +{
> > +	xe_mmio_vf_access_init(pf_fd, 0, mmio);
> > +}
> > +
> > +/**
> > + * xe_mmio_access_fini:
> > + * @mmio: xe mmio structure for IO operations
> > + *
> > + * Clean up the mmio access helper initialized with
> > + * xe_mmio_access_init()/xe_mmio_vf_access_init().
> > + */
> > +void xe_mmio_access_fini(struct xe_mmio *mmio)
> > +{
> > +	mmio->intel_mmio.pci_device_id = 0;
> 
> 
> Hmm... maybe better to remove warn from intel_mmio_unmap_pci_bar() ? Is it
> really needed there?

I didn't want to modify it and I made it similar to intel_register_access_fini here.
> 
> 
> > +	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> > +	igt_pci_system_cleanup();
> > +}
> > +
> > +/**
> > + * xe_mmio_read32:
> > + * @mmio: xe mmio structure for IO operations
> > + * @reg: mmio register offset
> > + *
> > + * 32-bit read of the register at @offset.
> 
> 
> @reg / @offset inconsistency
> s/@offset/@reg ?
>
my copy/paste mistake

> 
> > + *
> > + * Returns:
> > + * The value read from the register.
> > + */
> > +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg)
> > +{
> > +	return ioread32(mmio->intel_mmio.igt_mmio, reg);
> > +}
> > +
> > +/**
> > + * xe_mmio_read64:
> > + * @mmio: xe mmio structure for IO operations
> > + * @reg: mmio register offset
> > + *
> > + * 64-bit read of the register at @offset.
> > + *
> > + * Returns:
> > + * The value read from the register.
> > + */
> > +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg)
> > +{
> > +	return ioread64(mmio->intel_mmio.igt_mmio, reg);
> > +}
> > +
> > +/**
> > + * xe_mmio_write32:
> > + * @mmio: xe mmio structure for IO operations
> > + * @reg: mmio register offset
> > + * @val: value to write
> > + *
> > + * 32-bit write to the register at @offset.
> > + */
> > +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val)
> > +{
> > +	return iowrite32(mmio->intel_mmio.igt_mmio, reg, val);
> > +}
> > +
> > +/**
> > + * xe_mmio_write64:
> > + * @mmio: xe mmio structure for IO operations
> > + * @reg: mmio register offset
> > + * @val: value to write
> > + *
> > + * 64-bit write to the register at @offset.
> > + */
> > +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val)
> > +{
> > +	return iowrite64(mmio->intel_mmio.igt_mmio, reg, val);
> > +}
> > +
> > +/**
> > + * xe_mmio_gt_read32:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @reg: mmio register offset in tile to which @gt belongs
> > + *
> > + * 32-bit read of the register at @offset in tile to which @gt belongs.
> > + *
> > + * Returns:
> > + * The value read from the register.
> > + */
> > +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg)
> > +{
> > +	return xe_mmio_read32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> > +}
> > +
> > +/**
> > + * xe_mmio_gt_read64:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @reg: mmio register offset in tile to which @gt belongs
> > + *
> > + * 64-bit read of the register at @offset in tile to which @gt belongs.
> > + *
> > + * Returns:
> > + * The value read from the register.
> > + */
> > +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg)
> > +{
> > +	return xe_mmio_read64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> > +}
> > +
> > +/**
> > + * xe_mmio_gt_write32:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @reg: mmio register offset
> > + * @val: value to write
> > + *
> > + * 32-bit write to the register at @offset in tile to which @gt belongs.
> > + */
> > +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val)
> > +{
> > +	return xe_mmio_write32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> > +			       val);
> > +}
> > +
> > +/**
> > + * xe_mmio_gt_write64:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @reg: mmio register offset
> > + * @val: value to write
> > + *
> > + * 64-bit write to the register at @offset in tile to which @gt belongs.
> > + */
> > +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val)
> > +{
> > +	return xe_mmio_write64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> > +			       val);
> > +}
> > +
> > +/**
> > + * xe_mmio_ggtt_read:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> > + *
> > + * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> > + *
> > + * Returns:
> > + * The value read from the register.
> > + */
> > +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> > +{
> > +	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> > +}
> > +
> > +/**
> > + * xe_mmio_ggtt_write:
> > + * @mmio: xe mmio structure for IO operations
> > + * @gt: gt id
> > + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> > + * @pte: PTE value to write
> > + *
> > + * Write PTE value at GGTT @offset in tile to which @gt belongs.
> > + */
> > +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> > +{
> > +	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> > +}
> > diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> > new file mode 100644
> > index 000000000..96bba6e16
> > --- /dev/null
> > +++ b/lib/xe/xe_mmio.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include "lib/intel_io.h"
> > +#include "lib/igt_sizes.h"
> > +
> > +#ifndef XE_MMIO_H
> > +#define XE_MMIO_H
> > +
> > +#define TILE_MMIO_SIZE		SZ_16M
> > +#define GGTT_OFFSET_IN_TILE	SZ_8M
> > +
> > +typedef uint64_t xe_ggtt_pte_t;
> > +
> > +struct xe_mmio {
> > +	int fd;
> > +	unsigned int vf_id;
> > +	struct intel_mmio_data intel_mmio;
> > +};
> > +
> > +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
> > +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
> > +void xe_mmio_access_fini(struct xe_mmio *mmio);
> > +
> > +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg);
> > +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg);
> > +
> > +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val);
> > +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val);
> > +
> > +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg);
> > +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg);
> > +
> > +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val);
> > +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val);
> > +
> > +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> > +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> > +
> > +#endif	/* XE_MMIO_H */
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 53a2b4386..c885e3a79 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
> >   	return false;
> >   }
> > +/**
> > + * xe_gt_to_tile_id:
> > + * @fd: xe device fd
> > + * @gt: gt id
> > + *
> > + * Returns tile id for given @gt.
> > + */
> > +int xe_gt_get_tile_id(int fd, int gt)
> 
> 
> uint16_t xe_gt_get_tile_id(...)

Yes, it should be u16 here.

Thanks for review!
Piotr

> 
> 
> > +{
> > +	struct xe_device *xe_dev;
> > +
> > +	xe_dev = find_in_cache(fd);
> > +
> > +	igt_assert(xe_dev);
> > +	igt_assert(gt < xe_number_gt(fd));
> > +
> > +	return xe_dev->gt_list->gt_list[gt].tile_id;
> > +}
> > +
> >   igt_constructor
> >   {
> >   	xe_device_cache_init();
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 82af2706d..b1b3a989e 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
> >   bool xe_has_engine_class(int fd, uint16_t engine_class);
> >   bool xe_has_media_gt(int fd);
> >   bool xe_is_media_gt(int fd, int gt);
> > +int xe_gt_get_tile_id(int fd, int gt);
> >   struct xe_device *xe_device_get(int fd);
> >   void xe_device_put(int fd);

-- 
