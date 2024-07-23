Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3AC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 18:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8310E196;
	Tue, 23 Jul 2024 18:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPqyISGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F3D10E0B5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721760036; x=1753296036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YJ5EYc/In4FgzyfLqKFyYqzObk0MWqpRkzAoVXxtJcY=;
 b=fPqyISGioh3efMs5RlJZCzXS13Cm7w8e6KCjKZnl5sMSIqFP09gBN+9c
 gAFFZrtj7JCEu4k1HICg+htNklf+5f/9ys2yVeKtbAp9N6GGA6dkr4ocS
 v39wn+it43WmTyz4WCnTYB3s1aVlB5+bFlGhdPojYiyp9Q7Gx3mqq4t1a
 /fXlBkSrHRsSD/K4Rl4cJYp7gbULH+FlKbMDlEfS8rH7mAYaqkqAUnqAg
 Hjcd1cJii/X6MlrADGNpicooab6dGV422GqsnFB83SiqMnOuyBNyeV6Ed
 ++qpHccoeFHRqGo+L4oTmceY5LkfIJPi8kCaZ6wpXxqcuM0/DcS845sVj w==;
X-CSE-ConnectionGUID: IIeTywgGRlOCuJE7Q8LEMA==
X-CSE-MsgGUID: aTOn7v9vRBy0lQjU5TRYnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="44826490"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="44826490"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 11:40:33 -0700
X-CSE-ConnectionGUID: EL3ISNZGRQyxXEJu/bbrFw==
X-CSE-MsgGUID: PYMa4OnUQpCOtTilIlH3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="57160038"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 11:40:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 11:40:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 11:40:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 11:40:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 11:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxGhM10ZxAxo9jT0j9EghS9U2sq8dobQQKRxOSVl1bNlLeuN/aMNARQd3fRPGB1dNniyoT0TN8Kd0sbjVRf1nIoSFjxuwWYq8Ji8iEhxsz9bWjlTEATyzWH7/b49O+s6SIONWH8JtsG69nNc3EnwqxwKgQtAmFqS44dak8UrJk3qYYPvl9C1TaeCbs7za+ZcIVeUeBha22GhM5CQm15ggbwOU6kQF+R31S2Y9IBRfc44hqh93c7K9sbyVteGSFcvlzp8Z0aIv8hjZzPH0mjK5TW8tC9Gamp8lhGQF4Sq5P4PZH3PxVoiFVsb7IFU4/1zliRN83MDSalJVmZl0LVU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLqSndxat0FKqRir4RletIw5odbAuP+UI3Hf+ZiSjOY=;
 b=LbnNcUSr+9OCGnLuTJpL2g/vHZ8z4udsT6JP7iqtoCDJO9iUMTnfZN+6Ao1gDQGvvjkrFo712E3I/DMnBUH+CPQ8FwrKpie6k4I2V+KKYxw2r/hawnlwLAo2i4RO6bIWjzHClwq/agSz037rsUiI4d0JOUu1DLIrUGi4YFR/QMZcfOhkat3k4WdYPR70ZUoTg8AkeE1EQj5VszEBKecoWv0VOCoJrPtYAC1NhEW/SvIN/skCpaNCDhND4Qc8cR39hslXENjF3XjY0oGlRHyfyt3QOPcD7qGFp7DsPLMoae39ohCVF45iW4fzlq0gQlgArXssDyeex4mcnlyCLvDLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Tue, 23 Jul
 2024 18:40:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 18:40:25 +0000
Date: Tue, 23 Jul 2024 18:39:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] tests/xe/xe_exec_basic: Add section to test zero
 number of BB in exec IOCTL
Message-ID: <Zp/45/OJLkSWk/df@DUT025-TGLU.fm.intel.com>
References: <20240719194107.1549306-1-matthew.brost@intel.com>
 <20240719194107.1549306-2-matthew.brost@intel.com>
 <20240723122733.o3phf3wskcqtc7qt@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240723122733.o3phf3wskcqtc7qt@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1700ce-93fd-4759-03bd-08dcab46eaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fF8DiLYxBtGZk6T/82pK1IN6K4C4xNu6s7Zssr947OMhReU0j71KWZoqFhJX?=
 =?us-ascii?Q?hDLtVAmxRtpxNZG9q8t8oQS0n3l3I2vJ7Gdvt9vG2K9HNbG82tsdjxdRzZca?=
 =?us-ascii?Q?sakHZs0QE3FB3GhSXCZoO03KdTU7+AsahYTYKWUPMXNOU7WHQkytf5dRX4vR?=
 =?us-ascii?Q?ZpHNE6zIf8XC8PeFt765D//4EKWIgORRQOP+wEUz5g3RpA4DJ6j5LXoDDFpn?=
 =?us-ascii?Q?5HK16nQ0znv49wqBO9R6u1ezXPNPX4DwLf2KTVQSpD5OwqHJOgKTvaQz3fe0?=
 =?us-ascii?Q?Ggbc01DEi69rDoyNh2yIOMZfxjE1FsTQVldauQSrvduS7RYoTrQKWLeSpo8m?=
 =?us-ascii?Q?0D1BWWxfVZVji5t9SRcD5AwURrix23ZfUd6tB8MynxaTBuHq2YQ79TCI+ucY?=
 =?us-ascii?Q?IrvTHtxjppS+ILolME0CNAe4XVZYk5ELmSrfzSsjddAxXApDj/7kGamHLIEA?=
 =?us-ascii?Q?BDPxKXCtMGC6K92IHMcGdYun/XW/XwOXzHNxvJPux1z6qqZB9F45bWeRks0F?=
 =?us-ascii?Q?2W6THcxIDLaH8R4ayMSHnbjOiJ35xTn3oVHZI3+ypMXxfEtI+Dk3AX+nYzQf?=
 =?us-ascii?Q?7AO9cFB1hPQyGpeipuNnbGh2XXV/lgayz+2Mj7Rc7fCERQyJPs17gKKxWoJ4?=
 =?us-ascii?Q?ty8sutmQjB2csvZJhfAn69wT62fVYke0oSf08ZgK7qy5MyI+RFncC7IIvLOs?=
 =?us-ascii?Q?uRPzzm6V5fkeidbRt8XB0f7KCxhSsAxh7nJDogc60B4meboQn80E4zYHxWZd?=
 =?us-ascii?Q?ZjpKzGWVqrWLn6plAz8odpjGHMoGCKsPvoKSVeXIn1ESMM36v7uOP4GApTu0?=
 =?us-ascii?Q?9pgu9cmhpS6J8mUakV9QjdKPIxK6I5obgPtVF55vv6LFVYng6C8QnOGsFA/N?=
 =?us-ascii?Q?e2LqERXg2Tid0dXGMg2g3YroGC3pHB3ijXxOeaqtTwnGqy0gScVIT7qroHwv?=
 =?us-ascii?Q?4AwLEzB+kxd/I2CKx4A1PjDnDmhjXir8Mz2RiTNCi/6DzT1KZPnZa9+gZmIZ?=
 =?us-ascii?Q?2i/raeojOwr/F4t/mU+ZDuGnsnefB1i1RV+0L19eyuxDzxusYliAqWWnxdgc?=
 =?us-ascii?Q?UwtECV+tQw7oNbKEdzH4i0ago0BruVtiW/aHDoFp5Kkqo3Qq2yaMVx7aB0JU?=
 =?us-ascii?Q?LCWEilqOzhvJLCtPpfm4/x23UCgQuVDdEH36WGTzo6aXhSgEzdnOUupv/pTv?=
 =?us-ascii?Q?PUAaVtfDgmPGflB6INktvGFaC7tsA8OxgoTMopa+6hFksG1pt+P+ZWNKITiO?=
 =?us-ascii?Q?Q5pmVC3Mpz3yHC4iw7O4MlUX/UBT6uRvnAXqfeOu872mn6BGjmy2APrK82ob?=
 =?us-ascii?Q?YZO4RztV482mmRDKtkmIdjBFZ3RSR87MMOSEXG0mYm3S0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PZj4qegBF7NJHZy6ZLAeGNtEgS3sc3VZRl8P3r3MAGhgyraQUpszgdbEzVr?=
 =?us-ascii?Q?vPvJIqpdPoB9sx8HItB0DChLw8W/PoGzhPJrGZbi3YnqnCp77NsPr7A2TtUU?=
 =?us-ascii?Q?mFtdkbsR8i5HCMKAJjMPRiF6uhn+T0kK78v4p3ihVMdCLldBd7J31FmnecW4?=
 =?us-ascii?Q?fp0/O2p+/LKM3gawB0CCBY/LSZ/ASAnfGRMDZ16/4KbSDvGMqZ3QoK4n098Y?=
 =?us-ascii?Q?cof2uCfl3KHHTZmC9Lrk/VH984WObxS0/41IVN0Y4Eiw/nUGwXgW8rO0Y6Xo?=
 =?us-ascii?Q?pfZ6Aw40HmXQZAIJbQAanmh3JgxwHAJvwaoE/09q4GlDhAyQOssw86UxeAzd?=
 =?us-ascii?Q?5qbl8B7Pyw3FtA1fyWEtJ4imz8vRb4XFHnrc8slwnD2k89uqzpaA4r3J29kv?=
 =?us-ascii?Q?ynjvz8K+D6b0Nh4s5kINIRfHqCIJtkys0c9NUeYRB3R27NQ6qbpRoqueBVjF?=
 =?us-ascii?Q?JwhYAuXC+amVKuAdH7Ekp0UHaPw7/Fto9IwkThe9V9xc/r9nwxc4g3VAPcw+?=
 =?us-ascii?Q?n9B/VDNkYrwso+5AIawTSUrVHtzMd1Yov89gV/8BmgGo42GXztNZD7tuqf7T?=
 =?us-ascii?Q?JTH5cIRPL8Ykylg9HQBNUu8aQymCE69ZOZvctlOQQUlniONUV1XtQdlD7MFl?=
 =?us-ascii?Q?OUwC+/Qf46NgtbEvN793q44736tzbopHYLLm+J+CsFMSc26ognbM0UHSeET6?=
 =?us-ascii?Q?Y+unQD7pAJfPVo3rwhGpu6wvAK4TZAJzis68u+S9mZoKwsweeNMydUS5pziD?=
 =?us-ascii?Q?/ynvlvtEXVvV6MGjhclGv34Zi/buVwHANPN8jTJmog+1H+Op6MyBkuiThx0v?=
 =?us-ascii?Q?/FwXugSRtMmiXQVZYPY85r2zellgaNKtATdY2QuyXwiVC1A5mBAQHS+Ov0Xl?=
 =?us-ascii?Q?ZkvPNoKAwpyihvYKNteDootfX2ZFwT39vdIhK72ChusVtrqLaDAAJl7sKk6Z?=
 =?us-ascii?Q?u38y2iMfHEzDEllPQd4bbrXinttYkjytG3Lq1gohYo9ZiSLlnaHrV1FYWelQ?=
 =?us-ascii?Q?Pt2aljEYRP6yGnFfovP5Z5ylYgyLTVuZi8KQ6HOpYkGvoh9wphOmPYOz9PW3?=
 =?us-ascii?Q?YhlQ88Kx2hclHvd1JzEOzYXsQ8MevxVHSSsnOfayw+qWAJTJ/T0PtJ5ZOcio?=
 =?us-ascii?Q?vGtenNVHwl+puyhMDou1M+y7eqh1NCzEVDO9dmzfZQjcZiA7THBOPd2d48Xx?=
 =?us-ascii?Q?/rVNa6xZK0V0ldU4InVDRL+ivYjhC9QEVsanF0Th+1pt+Bh/HD0oS/TgHsbv?=
 =?us-ascii?Q?0Hr5eUyrGMH0mo3bTK5OT+d74Gob+54YUYSIjZRhWN6fRFcAbFyaI/ZFp9X3?=
 =?us-ascii?Q?6DK8V/ivxPk2Kk6EjP+7RmcRhOLgqI1MQ458j19JUlsUHQmGchDnzPNmXxop?=
 =?us-ascii?Q?9cAmM1qGASS8VN3gvaFAkEvLFNYqGi7BYFbDuN8x0UwikadNbIC4h8l5DaiP?=
 =?us-ascii?Q?7lZ5NMX7agKulR2TgXygrAnD4GL+BUK7pVQq2vK5n3QnMyXoca3gCqO65J0R?=
 =?us-ascii?Q?TkkcoCtM3YqNHjzRSSHT8dtYcb1xEquOCFy5Zxsn4/PTLJDkOP5im0xBqp9Y?=
 =?us-ascii?Q?QMfGYNqA/lDqaGvQJBeAXzhYi8CR8TDkdEqivjQbvWyhrH83PfuJB0USBcES?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1700ce-93fd-4759-03bd-08dcab46eaa1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:40:25.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH2uZSXJY4SkZVU3EkWfsnvq5UunB5/1op/2PVs3MTYm/SlXI0tnQQa1QzVjZJG1d8uFclG/7RD+CYXpNejAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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

On Tue, Jul 23, 2024 at 02:27:33PM +0200, Kamil Konieczny wrote:
> Hi Matthew,
> On 2024-07-19 at 12:41:07 -0700, Matthew Brost wrote:
> 
> in subject you use 'tests/xe/':
> [PATCH v2 2/2] tests/xe/xe_exec_basic: Add section to test zero number of BB in exec IOCTL
> 
> imho this should be:
> [PATCH v2 2/2] tests/intel/xe_exec_basic: Add test for zero number of BB
> 

Will change.

Matt

> Regards,
> Kamil
> 
> > Verify the exec queue ordering works wrt out-sync signaling when zero
> > number of BB passed to exec IOCTL.
> > 
> > v2;
> >  - Fix build error
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_basic.c | 108 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> > index 0fd1ae062c..02b78d55f6 100644
> > --- a/tests/intel/xe_exec_basic.c
> > +++ b/tests/intel/xe_exec_basic.c
> > @@ -19,6 +19,7 @@
> >  
> >  #include "xe/xe_ioctl.h"
> >  #include "xe/xe_query.h"
> > +#include "xe/xe_spin.h"
> >  #include <string.h>
> >  
> >  #define MAX_N_EXEC_QUEUES 16
> > @@ -314,6 +315,109 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  	}
> >  }
> >  
> > +/**
> > + * SUBTEST: zero-execs
> > + * Description: Test zero execs in IOCTL
> > + * Functionality: exec IOCTL
> > + * Run type: BAT
> > + */
> > +
> > +static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *eci,
> > +			    int n_execs)
> > +{
> > +	uint32_t vm;
> > +	uint64_t addr = 0x1a0000;
> > +	struct drm_xe_sync sync[2] = {
> > +		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
> > +		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 1,
> > +		.syncs = to_user_pointer(sync),
> > +	};
> > +	size_t bo_size;
> > +	uint32_t bo = 0;
> > +	uint32_t syncobj;
> > +	uint32_t exec_queue;
> > +	struct xe_cork cork;
> > +	struct {
> > +		uint32_t batch[16];
> > +		uint64_t pad;
> > +		uint32_t data;
> > +	} *data;
> > +	int i, b;
> > +
> > +	vm = xe_vm_create(fd, 0, 0);
> > +	bo_size = sizeof(*data) * n_execs;
> > +	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> > +			xe_get_default_alignment(fd));
> > +	bo = xe_bo_create(fd, vm, bo_size,
> > +			  vram_if_possible(fd, eci->gt_id),
> > +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	data = xe_bo_map(fd, bo, bo_size);
> > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > +
> > +	xe_cork_init(fd, eci, &cork);
> > +	xe_cork_wait_started(&cork);
> > +
> > +	/* Initial bind behind cork */
> > +	sync[0].handle = syncobj = syncobj_create(fd, 0);
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	sync[1].handle = cork.syncobj;
> > +	sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 2);
> > +
> > +	/* Exec behind bind */
> > +	for (i = 0; i < n_execs; i++) {
> > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > +		uint64_t batch_addr = addr + batch_offset;
> > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > +		uint64_t sdi_addr = addr + sdi_offset;
> > +
> > +		b = 0;
> > +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +		data[i].batch[b++] = sdi_addr;
> > +		data[i].batch[b++] = sdi_addr >> 32;
> > +		data[i].batch[b++] = 0xc0ffee;
> > +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > +
> > +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +
> > +		exec.exec_queue_id = exec_queue;
> > +		exec.address = batch_addr;
> > +		xe_exec(fd, &exec);
> > +	}
> > +
> > +	/* Exec with no batch buffer */
> > +	sync[0].handle = syncobj_create(fd, 0);
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	exec.num_batch_buffer = 0;
> > +	exec.address = 0;
> > +	xe_exec(fd, &exec);
> > +
> > +	/* Let jobs runs for a bit */
> > +	usleep(100000);
> > +
> > +	/* both bind and execs are waiting */
> > +	igt_assert(!syncobj_wait(fd, &syncobj, 1, 0, 0, NULL));
> > +	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
> > +
> > +	/* Release cork */
> > +	xe_cork_end(&cork);
> > +	xe_cork_wait_done(&cork);
> > +	xe_cork_fini(&cork);
> > +
> > +	/* both binds are done */
> > +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	syncobj_destroy(fd, sync[0].handle);
> > +	gem_close(fd, bo);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> >  igt_main
> >  {
> >  	struct drm_xe_engine_class_instance *hwe;
> > @@ -383,6 +487,10 @@ igt_main
> >  				test_exec(fd, hwe, 1, 0, 1, s->flags);
> >  	}
> >  
> > +	igt_subtest("zero-execs")
> > +		xe_for_each_engine(fd, hwe)
> > +			test_zero_execs(fd, hwe, 1);
> > +
> >  	igt_fixture
> >  		drm_close_driver(fd);
> >  
> > -- 
> > 2.34.1
> > 
