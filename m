Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C9CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3DE10E36C;
	Tue, 26 Mar 2024 09:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdJpJy3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C3510E36C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711446215; x=1742982215;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s/AhFQPY62UovlWECCImnj6yzbTO2eoY+147VvmeK58=;
 b=KdJpJy3GOPTBwPoBGqG1+eXR2PTRONZDow6QUm/TWR4KnPv1CMvKXWAA
 qBEZNwLMjDfrU9KN3cbJqz7McfufW9jp0aiw5y8JsgkqKU/2Ls1KnJUuv
 3IhIj/Yuk2KO/MaQFhgjKfJB3iqNZ+LqavcVag0GCpyIIJOEvXvcYxswG
 MEh0N9kj0kv7w7xhDIGBSRRl/fIVV5OTzmDV7r+52SOzJ1HvNW49N9E8B
 u5AxeRAazYl06Dhrp0n7BYDHpNo0eBKSo/ukw4wXd6BNWqdHBCThCkmP9
 BJqiCc8mht2PP8CmiRk48Jwe52+ul8P58dZnzn6qH2OwrPMuIkvM6GJXO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6599123"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6599123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15773293"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 02:43:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 02:43:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 02:43:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 02:43:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4vM9YXDROcXg187puSvf1ep7U2GCRWvpU8wAHKy3HCxInkSMm3Bkkt904Pfzo7MI/yp2k0KlqTqq4opPpOoMIqwzp9h3iVdeJRJUuc3tAqdfa2L28BfUaV2iFbYAY+yWsOcTzrB1g4CbDvCfhytIGYcLxrYNvjsR/VuRHmhPV/B5O9LkuPfk+LvxHaB/TF7t7hjbQYDdWDSBPs5mKJHeeVqgM3IFf42otm8AruckTKLRwmoCViZeNcIiq2UxpYjDJg7Ef2mkz6II9AtgH/J3IqV2WW/WjnE5p2brOL6tbSmVDQds1NykNLr8oCmivm7m5cpA/4eAjr165gXB+6R8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zpU79ONLyGMWEMt81CKUs8+T2GK0z24pc9ZoDxrQ5I=;
 b=YVECGGxxzQD0yUHwyaoto83AHAf40VcVMKFEg1cdk1EyOHdZJEFs5RYulFxfk/VZoIBAMPHcQyIptuvP4MI7b7oy4LbqG2p3trAyLUPKnRq74kEbcOYrtozd3xV5z090v7C6visjQ78zJpMeVrO4nflQ/fsBHdkkQDrSbzK+tZTTqiv+eUjoz5qaLZOK6Oipi/W4hj0vL3PAMjyeiTk6NIxvBkTqezGY5ifTihQzE/dmotYvQvXqDwFJIgE+KtjN4kL2sjqFFjBSsFb2CneUmJj9w6rz8kEctdo7kRwUgorkFIIKVMNDoqMOkmiIR2nD/uGEbpX11HAeaQ/okjUkLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 09:43:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 09:43:31 +0000
Date: Tue, 26 Mar 2024 10:43:27 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/xe_mmio: Introduce Xe MMIO lib
Message-ID: <20240326094327.jmu64gkeuri4sgcg@intel.com>
References: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
 <20240325155709.3521039-3-piotr.piorkowski@intel.com>
 <20240325173606.pu3r5k3prf6te3kq@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325173606.pu3r5k3prf6te3kq@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MI1P293CA0029.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ1PR11MB6156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: egDCivdtgh3P5ZJxVVISEhLLKv88OQTXVQkeTB9VzxALRNXVUc4QF5HxLRhYGi758PPhwGkugfw5P/MsTj8hxa88CgmLY4tX9HWlWQvR9ttzY9MwC+5kol05DMzfiB+9hX+b9Au3zIOWRbYpn+aI03qn2HCt7DifWpydQBuvsorwIzOYGilqyyCSgFhvvD4j29z06xuXP1MCv8XflmxEoo0x4uXWV8frCK07gS/ex3AeepwGziJ4Xpv+kk0CKNIKbwPpHDsmvX8P1a5DwZ6Q3YlpAJkNEbPZel2qehk1xuzglUrBmugpx2smYpIxYV0VC5HpHwBc9q74MllBfd2mNemAvav2uemiTOfbflhpCrP2mLNf3Q/3XqY2kSpkSseUDVG/tu5Sk4OuB8H4TBJkMzIeQ77WO7qBUOXZtgpqSl55Kp1J+cNt3iFKA3Om8yzwv2qlR6sqFiQvhZ4R2pBKzQfCEai0Z4vCwd9vkzPeGASooxvG91dlyReti59r8r0LlQW44vdGxPpvW+XiGHcI5crGtBtEP7IZmeHafbTWHfZNd331KfZfuND3yqbDbqS3Xda9J0QGXQnRoysgA/jHlIal9CG04T3D/KXONNuef5vd+QI2rqwspsqnMeKszy5rL0Wo1x0v1UBRUZgZDfP1k2N37oCO2jbM1p63KRVhJlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJuOHpZMi9NTGthTnJ6MFA5ekE3bmovTUgvbUNYRnpONzNZc09pTm5ya0dK?=
 =?utf-8?B?MnVTYm91L0ZuM1k0aTkzb3VKN3NWWDE4OERaZjhPaG05SnFHTWtuMjh3YlRN?=
 =?utf-8?B?SGZMakFpdWdWS2xXVkZhVGswSHdTa1FWSU0wZ2Vvc3htdEVReTJLRjRTODc5?=
 =?utf-8?B?NlpIU2tNNVgzMll2WlZBcm5Zdi9sT3cyamZlYkZ1OTZWQUVCTW02YjhzZ0ND?=
 =?utf-8?B?WXZ1MHl1RUJydlc0eklWSHJjVGVaNDA2VktMWjZUQ2tZUTdRQlVNVTYvTlAx?=
 =?utf-8?B?TXNNaDg2cGJ3WjJzVlJjdi9SNThaZU1vb3NCSjcvaVhxZ0hFRzZTY1BMYzhW?=
 =?utf-8?B?MHR4d1lHRGU5R01jTzJRUEZxTWZDY3JJUTJxSENyWFJtcU5mQWs3MlBkdmoz?=
 =?utf-8?B?cWtTdzhyZmtjTHFLbGplSTVxTE1BajdnTW1DSkt4LzNYcWpnZGh2NERPd2RD?=
 =?utf-8?B?cVRsNWNsa3NPd1ZjWjVIcWZtSUlyQUVGaUkxTWhNMGRYWjJRWmd0c1Fwejg1?=
 =?utf-8?B?Wkg2dkRyazZYRmZRbG5ncEJETEJ4QjEvVTMzUFhoN0dCSVFJVSs0VWdEeTdm?=
 =?utf-8?B?TmRDN3Rib3NyOXlFcjJMSWhhS3JrTm9hMkxXbkI4amU2Z1VhU2Y5RW9GdEhu?=
 =?utf-8?B?RE9Ib1lpK1YxSTRoYVFnaWhBUk10aGlOM3J1Ky9KTmpwNjNNQnp1OEZnVFZq?=
 =?utf-8?B?Rld2dy9aQkJMU1JqQ2lKY1FPOEQ1M2xaRkRJOXZZTWF1VkQ2bFZTajI0bmpq?=
 =?utf-8?B?UXo0dEJOUkFIZld2aHBjL3lJa2hHc2l5VS9vQjVXblV0c2hJcmU0TTVYNHp5?=
 =?utf-8?B?Zlp3MW9zYzJ4RHR5ZHdVVWMvVVhYUUduLzA3dWVZa2pZa3RyTWZOY1RDQ3JZ?=
 =?utf-8?B?QU5GYWdMdnNUNitDYlVIdFhUOERUZ3ZoMmlBbVAvZVNPNk5nbkYyVUdIdjlG?=
 =?utf-8?B?WTZ0cmEyMjN2eHo4akZpekhTNmQ0L0FaTDI0WE03S2huQVc1VTQ2SmtTSlRX?=
 =?utf-8?B?Vzl5eFllWCtWYU5IZGxvcFJibENib3dSZGhnT0ZrbEw3N1lXU0RQNkhXUkhZ?=
 =?utf-8?B?alhFK0hycTlscnpiVXBtSGxSTWc1SjdPMjMrR3c2WHAzVXFxNFZNRnI2WjZT?=
 =?utf-8?B?UU1uNEowQTJJRjZucDQyTURJTWlrUmpGanFKdERaL2tINjU3UU56WXNoUm9s?=
 =?utf-8?B?cDJaZzYxUldjMGxDQk16REdFajZEQ3RFYkpkd0ltVTJBbWR4b3JRNDRHUGZL?=
 =?utf-8?B?TWtEL2dCa0dHUE4rT0UrV0hRekNJelNVd1hLdkhsMW50VWNYc2tWNjN4Tkt4?=
 =?utf-8?B?REJ1NXM1akRRUCtLVVM4dHJUN1BsSUtLbkthTng4OXBWRUU0clpseGx4SDA3?=
 =?utf-8?B?Nm9qbFBjTEJmTmJPc2wwUjN4MHhMNHRub0VWdjh2U1N2T0NycGFrUmtLYnJ6?=
 =?utf-8?B?VTdhd2grcVdqOVEzcmZUdUIvNm1QeW95N0FiZnlMTHJlQVZxTHJNTkZvMXVH?=
 =?utf-8?B?RkJGZEY1WFE4dmh1dC9qOVNkRi9xeGZqWE0xWWlSWm03WjBNQ3VXMVd6aVA4?=
 =?utf-8?B?RVJhOGhhbnNRU3dsd0dicWJzRHVIL1I4djZUdnlBSFRVY2VscHNWaEZPaWp2?=
 =?utf-8?B?anNRd3YvdUpyN2R1V21oYWJkd2o0ZTVscktrREVBNXFUd2w1WC9zck5PdFpS?=
 =?utf-8?B?OTJhZ3dScWFlSndQWjAvRkt3MXVxS2I1SncwSFJNbU9rbkN5ckg3QjhEUnZS?=
 =?utf-8?B?aDNMb2xybTQ2RjZlWFFHMm9Dc3YzSUVMMHdRTVpmQkJpc0hHTm1adjE3Z283?=
 =?utf-8?B?MGl0UWc0VERFMFI2TWIrZks2czh3c3ljYUFBcnNTQWRCSnU0bVB2Smxwditv?=
 =?utf-8?B?SkwySllYWjlteXJPUG95UFBHVGMvNWxua2tEYmluYUw1YlYzS094ejVzbXJa?=
 =?utf-8?B?L3o3SHczY1dJZ2RBaWlkbEpCZlJscGZOYWt1WTVWTS9ZNFlaQlQvWGRnQUNE?=
 =?utf-8?B?RVVOelJlTThRaUxNRHluRisvNlBvMUJNM09qbzJGblptc2l0YjBZbWI4N29Z?=
 =?utf-8?B?eVRrU2l3Q1BhVGpGR1E0eU83dDVTRkIzTzVLMW8rd1h2MU9CNWo1ZjJMM2tF?=
 =?utf-8?B?Y0kxNWFXN2NzSkJSTEtEaUh2eVV6dVIxa1hoVTVHbTlUTXhmQWErZ3hXWjli?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce485ad-8d09-47e5-b720-08dc4d79325a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 09:43:31.2030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzRQa8jIkU9dZOTjeJU65InDymDDVAc+tWKzKy1B9nkAVgNYKWsQ9C385DjvXBANklzebvqp89kBeMofPnoRlAeQzyEDMC/VWIU2Teja2xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote on pon [2024-mar-25 18:36:06 +0100]:
> Hi Piórkowski,,
> On 2024-03-25 at 16:57:09 +0100, Piórkowski, Piotr wrote:
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
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >  lib/meson.build   |   3 +-
> >  lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/xe/xe_mmio.h  |  37 +++++++++
> >  lib/xe/xe_query.c |  19 +++++
> >  lib/xe/xe_query.h |   1 +
> >  5 files changed, 266 insertions(+), 1 deletion(-)
> >  create mode 100644 lib/xe/xe_mmio.c
> >  create mode 100644 lib/xe/xe_mmio.h
> > 
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 934bac5c6..2f9666846 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -110,6 +110,7 @@ lib_sources = [
> >  	'igt_dsc.c',
> >  	'xe/xe_gt.c',
> >  	'xe/xe_ioctl.c',
> > +	'xe/xe_mmio.c',
> >  	'xe/xe_query.c',
> >  	'xe/xe_spin.c',
> >  	'xe/xe_util.c',
> > @@ -162,7 +163,7 @@ if libdrm_amdgpu.found()
> >  		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
> >  	else
> >  		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
> > -	endif	
> > +	endif
> >  endif
> >  
> >  if libunwind.found()
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
> > index 000000000..ed45040bd
> > --- /dev/null
> > +++ b/lib/xe/xe_mmio.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> > + */
> 
> Add here standard ifdef/define and at end of file endif:
> 
> #ifndef IGT_XE_MMIO_H
> #define IGT_XE_MMIO_H

Oh thanks for catching that.
I'll fix it right away!

- Piotr
> 
> Regards,
> Kamil
> 
> > +
> > +#include "lib/intel_io.h"
> > +#include "lib/igt_sizes.h"
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
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 53a2b4386..c885e3a79 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_to_tile_id:
> > + * @fd: xe device fd
> > + * @gt: gt id
> > + *
> > + * Returns tile id for given @gt.
> > + */
> > +int xe_gt_get_tile_id(int fd, int gt)
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
> >  igt_constructor
> >  {
> >  	xe_device_cache_init();
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 82af2706d..b1b3a989e 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
> >  bool xe_has_engine_class(int fd, uint16_t engine_class);
> >  bool xe_has_media_gt(int fd);
> >  bool xe_is_media_gt(int fd, int gt);
> > +int xe_gt_get_tile_id(int fd, int gt);
> >  
> >  struct xe_device *xe_device_get(int fd);
> >  void xe_device_put(int fd);
> > -- 
> > 2.34.1
> > 

-- 
