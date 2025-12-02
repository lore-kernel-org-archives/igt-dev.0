Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CACCD116F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E670810E0A7;
	Tue,  2 Dec 2025 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVwvQVI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9610E0A7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764688132; x=1796224132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=amdpJvBql0NwOZtVonb7RLnHTYkLNomVoaLLUGHoAmg=;
 b=aVwvQVI5fjd6an9wLVPQnzyROaHChWVjJCNW8ra1HyWrjz8gnphUg/zC
 pxRbEP5dOavdnQ1bWAk/dpbkNEfEbz2xvq8587Erosh/nNJXbAWa2wCT9
 j0f0Hb0JW3/YCNS/Mvv4tACHHlMZIS5S+vRzR4yDrcEfvS8dQPkpYLK4u
 hjgnLgqqnKXjOiKWphgdJEcVKIYPb7/IILLj4d3MvXlrOUA0U5g3tOacp
 ZLS8I1MJAZal4nvYeo6TvlZz6QIqvf+NX+KTfV08SKsPNRh7ErlUOLL6z
 DSgm+t0hUQN9YqzIsSPvEwYUP5N+DJhM2rdxnUoZDOHOTGSK8r57TnSFv A==;
X-CSE-ConnectionGUID: xHWMSqLjRoCKdM4kyDNHjA==
X-CSE-MsgGUID: d5ob4UErSPWfsoPqqkTvrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65662134"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65662134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:08:52 -0800
X-CSE-ConnectionGUID: fdy97GmsSK2xaFROmeZtbA==
X-CSE-MsgGUID: T6wZRj0bRzSN8lx2fqc+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193700185"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:08:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:08:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:08:51 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:08:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkxlgWfolx1IWeH9Tr6WOp9q5aD/7N3m9s9/wsVR9MlC8JkDzh2M84Xdscn2I5o4buWE96gsVGs5cDdGTUhXbcjr3le0oNgh9aFHN8aQT9SWJygxT7IrTWyKmdOBFFgZH7SLFA14dzlEmTsi//ArEI8824UpUW/LaoCnWl72zS4zsS2E0nkypyxWStVjXwqR/0EDugZnOXiTOY2+tKpXhLuATeDz2Wg8V1pYhyhKL+7JktoKFO3aB2GESSUr6YmI3Bx6I+MgX5kGPuDxqBO7lqh9aLVsEXn4jbNirzd92TbRFZ9nB7pRGYg6XIRq4uZEWysWrkpY2rKLk7+JfPniLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYZOGw848GGrtuuxiJ+r+j7RqCsF9ZJAXXgAQNYFGdk=;
 b=FMA7xy+RI6kSaFoOsWNvMw4zjn6Vq8YDb9DzHBCXUiApG0eowTSlxdUHanEIUmo4Sux2X0r9jkukgmZ92vGPu6EFQCWIcEZPMd5al9LIlDc7M/VR63ILaufzFWqdY4ZboP71qY+gjShnmWJvxu1fbtE+VYPW0ox+LuxX8PzxWvbFGDvhzDrRU4ZkuKJLdj4W19vZOR1iYxiLAh0pz8X4AUvH15r8yX4fxoL/Ub9mLq5jb8Q+tE2JpxaYghHhzhAn2Jj/CKSVCNTjrZKZAPFWyCXCnHF0t7Fjnn+TGa40DS9xXEYVTPcvnnwPZFWhJBOG3MOvLjF9i+OrprtaRSp9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:08:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 15:08:49 +0000
Date: Tue, 2 Dec 2025 07:08:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] tests/intel/xe_exec_queue_property: Use single
 invalidate property
Message-ID: <aS8A/0k3iacOAd1c@lstrano-desk.jf.intel.com>
References: <20251201223126.863042-1-matthew.brost@intel.com>
 <20251201223126.863042-2-matthew.brost@intel.com>
 <20251202133840.cqzrzychu3vtjtuj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202133840.cqzrzychu3vtjtuj@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 1282b5fc-d80a-4a4f-d284-08de31b4b285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xCUKdCCQI8FoVvX5CBH8nFdmMNgQJzEUDNpXVuT/JQLMb8RY/402isBIoU/N?=
 =?us-ascii?Q?jD8YFjmkrlYLkbCsWrA8K+LvgDHH56Uh8YKKrwVw6CF1rRfZoByE2C8GowJr?=
 =?us-ascii?Q?ff8yQIAZVo3g3Ro97sjUMQ2J1j74ypRnAbY6YjMrB3/PsgoUXCauqXARbOQU?=
 =?us-ascii?Q?OwouO5lV31rWFBwXT6R5o99HzfeZkjBJu75si7p/jaDtsZZOC/oBQKY0b1eC?=
 =?us-ascii?Q?cTcpQGkTVa++IdaNulRy7LiqGRDYjulvSwFRedlTwD/A/amO6c6UkgZUQdMi?=
 =?us-ascii?Q?OK2JyyEB21HEmct2G4AZKsR/GpTIaKPEPT21vK1xphuKTgBuZ69l/OpyB68N?=
 =?us-ascii?Q?3mEQeLSWOsC0DQDEVzxGJXrL9rzCzhERHiUPXoD3JnbDpJZKyYKRUk5MHm3Z?=
 =?us-ascii?Q?DLuYhATdc0qt+Uvkc2NGYSFZnnqS10RTDIvfKA+u69LcO0zSHxLyzUso6+gY?=
 =?us-ascii?Q?Jt2C9tKJvE1mh+d7Q9a2TKyMwULzxj4A1V8avD2ii1KAoSTweun3LyacpmXc?=
 =?us-ascii?Q?nUoYLkkhTx2i+n3hv+/CuHqOk9m3TaMGkhRNk8l7pbjwJuMHlKN/OBCA7MAd?=
 =?us-ascii?Q?wBZ/leu1VHLC+FvHWGemPAB9b8tJArIs1GFJ22kTGSjeWheGo9WFeNqaxCAm?=
 =?us-ascii?Q?1GCO35jDOCyj//OXaf/sq2kEb3KWT1zsYKY5QEAerfJYmLBy9UNCVUMwFWvj?=
 =?us-ascii?Q?Q/jW+rZhxzFQIOcFv+JEa+6pip/DFRuOe+SJKStYYkILvNh0xowfOWo9PGdT?=
 =?us-ascii?Q?fFC5LjnOMBeMiog3DVgTi5ambQeIVrfpwgJzHf/btppSruzlponw/KfGlYh/?=
 =?us-ascii?Q?tsT3DZWZmcjmoYuZYL6FPqsF09Zx51pdRBaWyI3rY8S6bugFAyDvpORtgCR3?=
 =?us-ascii?Q?Ro5pn8YREegxXvF4f07Ygtxf2JNhF+2ArCmtIKPUrTZmU3zpJXJQu5Ls7WQE?=
 =?us-ascii?Q?0mdVn3j3AK2d3oTtjTJKdJnY5bbKr7wp1zrvJmG0O+cpP82EL2uQ6ds4d6/x?=
 =?us-ascii?Q?piSC60qG++ITUQ5J/uaRs45zEf+AGipgAohcYegHCbjBsdHCg5foPyfyzilk?=
 =?us-ascii?Q?IP6pwd95LKSkZnsP9we24UVm5yNYdMZd5FB87M7PAxSNmaFn3OMR+OWsP19U?=
 =?us-ascii?Q?PLJhHLdQk8L+4oFefQ43lFZRB22N12EFE1i0tNu5uw1crVIRNnjWIK1O4a74?=
 =?us-ascii?Q?E/GgXJf9vjfZD1jSnSH/ia+PCXtQ/vwyl6RSANp8BjVRapCJM+gglHVm4VP5?=
 =?us-ascii?Q?KM0zEdni+hWw5PbxcBnnEWfAUvzq3ri6Feo+p1+ecYi7iEAm6IACmp5tMV7L?=
 =?us-ascii?Q?0rX22oxvhnaon/tO9HoRrGzWz1MGE75uUYPJ4IKWGuwcmZcHd4kFEB0IEiCY?=
 =?us-ascii?Q?ih4+TD8tLCRiPIc67QGRRSd3x3xw5vBWrR7jOJoOwpz9EI4cX2pV/eLkSTF0?=
 =?us-ascii?Q?7oLdUP/u8n2zP4ZnrbY7bihA8xPwTDNe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smz/C3nCzeUCZpZhcM8ixCERVTzDePtfl6QGOSpjCJQQEgwgvc70y4qcmDF+?=
 =?us-ascii?Q?ka9vfahqVvGM9v7SuTMbP7u5zgDdiJMqXLV9QKxIz7aB4DxnHwyVmfRBeQ9l?=
 =?us-ascii?Q?M0Dhc3T7IzsFkkfHS7WLErSqf9aW2nhv8sMHX51KBu0FMUaykIvqe6P93UmQ?=
 =?us-ascii?Q?rduIKgtrgDlg4tRKAOWBqBGr9gNhCYfgvuzXApQkNBlfNhjk4WNep0hy8Arc?=
 =?us-ascii?Q?ZRXhYW2QSuB0ibnIfgRlmwqU0huTFDl/jrMc2im2lm1hh4QDSnRQS7HihXZI?=
 =?us-ascii?Q?zkr2jibYjuL7XAxMzEpdvapkJG//jHMivYhC4RmzKkyY5CAW0SkvU0Hz8tBU?=
 =?us-ascii?Q?itIYoZzxpD3awYPfVbneMcsWID6EI48P2ozQv+9U4uKuEA4DukmTfoZ5G7OA?=
 =?us-ascii?Q?DL8NVNkdNn8Zg/F6nNXo7R2xrmAPxEXRT8ASLR4oJxw4kABxQ7Ohvs+wyvu8?=
 =?us-ascii?Q?CJpMOZwOpkgI6NMcv8P8cUH8NgTm0USWIQrYWZLHTkb0aMjb0U7s6v62yzc8?=
 =?us-ascii?Q?eGTUmJ6P/6mqCG23pYSkYKntRzN+dqe6i33T8MjSLlpo+VLsrLn5RoBbgCta?=
 =?us-ascii?Q?jOGQYwrLrjNaviOIItQFzawi/HD79a/kFFEVffeDi2S85ZDUM3Vj0j195o+H?=
 =?us-ascii?Q?yJ0ya37eOX5PZLxMmOXotwhuBJo/jI6lcIL25juywCytRyY/H2ILB7rZvk1U?=
 =?us-ascii?Q?mpAun+EQAwlu3GLkwl9b7rke4iDCZgMfeToVwqqidH9UtHHsaRDuO8Rmwn/L?=
 =?us-ascii?Q?+laR77eMVsdZqWQRbojbr3KzbRY6s7FYtYLQjIccIgWCdn9EbfV18fhrBZgq?=
 =?us-ascii?Q?snAJ0agZYIaEKFX5zeov9oudwBBCZNHoVUxYGMvvtkP/rqwA20XkqEfKlc8E?=
 =?us-ascii?Q?kqVEFQbu2bGt43YHlzKnhW+GQP4q079v4lMhwVLUDSFQ3zY8sZsqF6yVo3+I?=
 =?us-ascii?Q?3knQY6UHYGFi23tmPXnQT3wBSxYFAEcM5LLhmwZmkUFYoMO4U8KC5fVhNsoE?=
 =?us-ascii?Q?41b5HxtuA7gMsLE/jDS7Oiv9VJFZSzvzZB4TA36h4gBL1ijdbN+w0Kh9Mwy8?=
 =?us-ascii?Q?sx3NV7FNfg2iFNYRH3BJAUb9FhOb/AwOMTpv4q0+JtPhL00ae8ykz0PzG5yA?=
 =?us-ascii?Q?qloqhNvD+7VUj14KLZD6Xj2HiEmLI0xV5c4MId6/IadigwzEiSrOvOoU5PdS?=
 =?us-ascii?Q?uOTijheHgF2iJ8kP56xFVYIfNxlouCWKzPKk5izLyfxMkq+jnJQG/mm0gp0d?=
 =?us-ascii?Q?wiJ692kAVzmpG+GZb9qp2gQCuTD1QToEUXd/7YB82kbiRwj0myZuQAHodnaz?=
 =?us-ascii?Q?GiVoRHDDm0Xxt9ZCWSc+v+XgXFT5TNKFCnyR92mvv0puzZuZGZ/hnrvXfiXh?=
 =?us-ascii?Q?YPDrqcdZRk3IARFPjKYlSTjXq8fDfrr8YNsO8ewZeoORbQzn5kJYQqOUUek9?=
 =?us-ascii?Q?Wol5qUo+A6DO8TBoiaBMhkYasNTx3UnyV479fjw1oDkJ+01xDB2Z/QlGk/tR?=
 =?us-ascii?Q?6L5AfZdh59Cj3CMTN0tG+OZe57IA2zyNS/PmQV7gZp6XFdvR7uwfoWJhQhpI?=
 =?us-ascii?Q?9h78vxCygbMLU7YhmM35vjVrB52dAU2Y1qP9iktj1XXSqt7xES2z6UTtxilS?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1282b5fc-d80a-4a4f-d284-08de31b4b285
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:08:49.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Hzrr5SlepjlFOUV4xW3jGVox1qADZ7VWV0ANpe9727C+AXrarpkhxrfljoahYG8D1ZdOdWei6c20mgKYKRgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Tue, Dec 02, 2025 at 02:38:40PM +0100, Kamil Konieczny wrote:
> Hi Matthew,
> On 2025-12-01 at 14:31:26 -0800, Matthew Brost wrote:
> > Rather than using a loop hardcoded with an invalid property range, use a
> > single high value invalidate property. This will avoid this test
> > continually breaking as we add more properties in the KMD.
> > 
> > v2:
> >  - Use single invalidate property (Matt Roper)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> This seems to be independent from patch 1/2 so it could be merged
> without the first one.
> 

Thanks, I'll merge this patch by itself to fixup CI.

Matt

> Regards,
> Kamil
> 
> > ---
> >  tests/intel/xe_exec_queue_property.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> > index 4dfcf09e26..1b7ed5abb2 100644
> > --- a/tests/intel/xe_exec_queue_property.c
> > +++ b/tests/intel/xe_exec_queue_property.c
> > @@ -172,6 +172,7 @@ static void basic_get_property(int xe)
> >  static void invalid_property(int xe)
> >  {
> >  	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
> > +	uint32_t invalid_property = 32;	/* Picking some high value */
> >  	struct drm_xe_engine_class_instance instance = {
> >  			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> >  	};
> > @@ -187,13 +188,10 @@ static void invalid_property(int xe)
> >  	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> >  					     to_user_pointer(&ext), &exec_queue_id), 0);
> >  
> > -	/* This will fail as soon as a new property is introduced. It is
> > -	 * expected and the test will have to be updated. */
> > -	for (int i = 3; i < 16; i++ ) {
> > -		ext.property = i;
> > -		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> > -						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
> > -	}
> > +	/* Invalid property should fail */
> > +	ext.property = invalid_property;
> > +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> > +					     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
> >  
> >  	/* Correct value should still pass */
> >  	ext.property = valid_property;
> > -- 
> > 2.34.1
> > 
