Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B841DC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 16:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2CD10F713;
	Wed, 17 Apr 2024 16:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRo2Nf16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7217210F713
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713370153; x=1744906153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=97cLM11pM9wL4niFAtvqQIuTXZYbAZO523KQ884N8Cc=;
 b=nRo2Nf16+PDmqCC0HgJJworjTzTBAEXyA4TXHKeurmO9p6+m3oTnlQOO
 NDQK/s4Y4D0AQvZ1ZwhKxD4BqEvtHJ8oVQajhLIYY2OHGm2H0r6xg+8Xu
 QMSx6qZPNVt8+Wrhi1418uVAa/hi7gogcSKRJ4scMqDphMgG5Yc2p9w+v
 VOVD+tA8eV2QklJXyATxLnoNq2vB3kV8uua8OpyRiQyFF2EjTQBfVJx0b
 ld8OGe7ZVSLr1df9odXAQhb01BoMO0TOOnHmZ1On2rHKkZqqkSW1UJi0A
 dYs7Ik+MVRBnyJZQpJ3LdgaDs3sSICgHR8ejYQT7yV8gutL3MjvUs0nGB g==;
X-CSE-ConnectionGUID: pPj0emUIRUyV3pNPVcb3UQ==
X-CSE-MsgGUID: hvE873wmRx6vZ7YQZ0mxnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8707340"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8707340"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 09:08:03 -0700
X-CSE-ConnectionGUID: N5WLQSkTQnmnt/7Eif+c0g==
X-CSE-MsgGUID: GLKvs5vkSdGmfFPP2VTNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="45970404"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 09:08:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 09:08:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 09:08:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 09:08:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 09:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C78RuciH9NzSUPPKJMx53SOcIOdi0JeH90oB0hJVuz2dCp8+9KPUfYrChyhU4pvzK0YexgMYJOAD/tP6zh768uQha7x0y7WcqLw2ehU1vT0PSvtcS0MriLF5kKWavJOYlAxv/xwv8voZHaIeaWcqMziQUci6dKk0M+VxK/Lkpbchzu07wrkyTTGsWk21Wi0qCWFRMMzPRC12amug/Bf9hJ57cYbNRE88Z3TDj+D7et1TJOvMt5dENlDD9gFy98F+e4gKa+++b7/g+6JeL2BmB6WnHEm1iKfaZOGHox/Ps7pxhMix+RhFCRgiKvx+73/SJPfbPuvnhcaWrUXKuOSeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F53NAPlanLUENYUOsn3JUpIFM0E92FZ3qz3L5D6o+2g=;
 b=Iy7F7t9Oia9DXHT4Kz1vEV3sX1eXpp4yOMjrVsNXN+zoa+aITxS8kRjQvKP0WlCHdYrqYdMseHTtjYxMTrpY7PQ4mJwz5jFs+P40qPWzBdjHKQsnouOlBRnWWenG6+b3SSfjUmy0njoWB6bU5Ryr0z52Zg8OMghVyUURnoyl0eZCapJe75OGHJOpDp87XuwOze9jXN6JvP5rsn0WoOqNykSuQpOT7DP7Ajc0OZ4LibM1fhMAwLFxm9bPhxeuxSCj6Fcgq7tjqMUnR9uSmftYtBvyhqlrmRgsohNQGiHs3620MudWwgjLwD1Svtq7cQTauvd/raUrn62l5vxIYVqiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 16:07:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 16:07:56 +0000
Date: Wed, 17 Apr 2024 11:07:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
References: <20240417145049.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240417145049.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d62df3-5cce-406b-fde4-08dc5ef88b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMejvQM4JqHtHjRUrSD6Syjg/zWHD5WscAXP0Ut0qE+qQdlSw92wcabc8ujwyeWtolmQ+nczJi+6w+F9MGd2t/s6W5uj6HvWM52r+tfwLJy0tEAfq8p0X8HjYx7AyZAavDMYfV+veoQ+N8dLIlJbQqONL2ATPCp0WlGc9XP4rA7VpCbx/CLG9LxMBhEJD6YE4qoi/1qTJANM1TrKtpY+Lyu0pfoTfHFO46F9MkIJnN+n1ShqgZsg4HOD99NMuLIwrYrAkJyAsy/znpp4gYE4Q4eM8NQ+nq+dM3a7958+L8FCWQ42QWpIRdwQSsdPBrGy/t2671Lo6/A5el29wEvT+IjQNqhopxp2z3NSjTPIhC2F36z5xsOTZVEIS5xRFRGVb2UYXxb3Pu00lD0joURN8YvUh1K0byNP6x+uHVLn5pxIDa1DSk6I8XCnfqdU7jDVOY4vzb4iyULKOdZs7k9laFK1+YHxMxuT6JEnWoLSr5oHOoMUxKsyOp5TZ0BcUdTuNqZOh4M/g/0Z1ODlNHekMZADLhNIIohRRvV8+kxIO+HMDp3gLdBsl8FWx2TjHTJBwVfH5+WczrIPraUMb9FzYJTC0Xan88H4keLVPEFwrdQXbwTQT6ONdXvekdCi4L1E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLf24gAe9WLi0o7MsSFYHKk24TunUYPlviiYTumH8jVFHadnm2RKEdH4QvZy?=
 =?us-ascii?Q?MlmtVxz2GxIqWr4AIv/stiapwzjRyIdun6Hyutmt9NdEl8G7Sm35ccdRpAN/?=
 =?us-ascii?Q?OyxLuTy1aL2l+Brwzpa8wAaRxWPb5BSZgCtmMwAJKAgIUwbNHTwtIviNsO2T?=
 =?us-ascii?Q?B3NzW3nM03pWGOeip9fSUzEgNFrwT2fdIloDL/eU71fLDJ9KbLQm0WZxvtS0?=
 =?us-ascii?Q?Q5MC9WARrenDDZMonkvXfpHWFniZb7QImj1LnXmZ55/aBsS0Z5qfO7mCtaR2?=
 =?us-ascii?Q?hGVZ1DzoZBeCgc5kgQdZ89uqoEd44hC2NOoJOVpxiLVdRrm6G2zrtGPo2YK7?=
 =?us-ascii?Q?NgpnaqpP8pbzF5ZoRwhLnQGiaQx64m0V+SGec0EmXCWVdDOMUkdBVGyoL++y?=
 =?us-ascii?Q?Tug5Aol3JLz7sEWzb9PlgZa6MPldffHiZz/uiqPJnmbIRJbaD6dC3vwAh812?=
 =?us-ascii?Q?6+5Sih7p/Vk9a2J4pikQ0R481077aqDsl8ZY1a7axvIVbVjYstxZr6DZv6KJ?=
 =?us-ascii?Q?Nmzcv7Gg0tnW7bmI4cqh1NM01DQUyIpZbp40qfqXPxIiQvb9Qw+YQpWK398X?=
 =?us-ascii?Q?lpKv9gzXJqcaqnzRVzjZ1PJhe6cKa9DLbidRnRotwU7QdvGSty79OCylIL1O?=
 =?us-ascii?Q?qZwm+lMoIpLQXvl8QSbeh3K4IX+l9CJpw0YVIQF56+nNqWSNixIH1sjMDxbM?=
 =?us-ascii?Q?lowOK1utnOx4w33xubIYsAkHOZDVhnR4OtuYbS+sUgjky9fj8/YqO2BKZ9o1?=
 =?us-ascii?Q?Kt99yq/OJC+jIGC7a6lBP4RLxXOxKZlVvR/jIpSr3h3sA776ImmvfVr4otOR?=
 =?us-ascii?Q?dp1c34vYNsisCedq09cZdnARCdTGAiblJmUF7txfDY1pHyGNbhhwHoApICqY?=
 =?us-ascii?Q?nBdQRDERrZNyLYfPFRCAy1T9YPvD6V7imTlYGbaIclvizSaWpdbuI8V1zte+?=
 =?us-ascii?Q?gXXaZZLPQI6e5ToxKfg3L7cFXugFqetsf3Yj9t3D5bD47Wl6PrpjpTgnlgy6?=
 =?us-ascii?Q?SDJyTSk9CQZxdnkFeeSqegeIQzICWx+Pv+YgKb7gzLEOI1hjE4SRyRo1demz?=
 =?us-ascii?Q?4lrRxVb+tGBJ6+RnGq8iPYKvm+oY/6uwe1JTeOnrR/7gTKOTHH8ue8KkPlJO?=
 =?us-ascii?Q?+iMHrdlm3+B9hwwii4/DlsIQXFiU7t5NucAVrJDbjkGHeLVrljojZ03O/uY9?=
 =?us-ascii?Q?kdDm4A/RQxd7/IEXLFmAvF2MOZSZFeJKrbyZM0twgUu4HjCeo8U7eB9iGh1d?=
 =?us-ascii?Q?zqg7ogJJG1CmMp4JzsGJ2bSihHMbrqMfHWIlNzGtgmISTCTMt3Z+aoEDUdMU?=
 =?us-ascii?Q?/xDwwDs3DB0JJ5RQ5nSd2dWM4vI7YV9hKTWtqN4oVYOastNbQIc/JFNoF7Ga?=
 =?us-ascii?Q?kV112Bes2bkpFiWBjcHi1Q2QzZAAh1gKYR4vVfLq7oa3t9CrLaHcDRBukjMO?=
 =?us-ascii?Q?Vxie2GjeuAtPXhcu8A/du2nFQIQFULbKk8tZ5Z2BU+FmDP/261ZZjltEukVk?=
 =?us-ascii?Q?XGezK4wPA3tQod7zFtOPxzYbyF34ihof6JeaGeP8Ov6A4/9+4wJcJdLjc2vY?=
 =?us-ascii?Q?Kzy6DCr5DOIts2fiCG3Q8MXjsCJCg9UILaIjFMmv+HUhuEuFvVJ9e8V0v8H0?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d62df3-5cce-406b-fde4-08dc5ef88b88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 16:07:56.8419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CDZ+N1eqyZ2E7PVDapfmk/HtDewIVseC8nleU1Xs1qelQABj+pSV1lIQ6WchJ1LEMVv+h/4XkgdljjzOl9kORoLv2xOqKHq7OFoVWAYfvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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

On Wed, Apr 17, 2024 at 02:50:45PM GMT, Francois Dugast wrote:
>Align the XeKMD header with the current version and add the L3 bank mask
>topology query proposed in this KMD series:
>https://patchwork.freedesktop.org/series/132075/
>
>This series first includes some patches to align the XeKMD header which
>have already been reviewed but not yet applied, from this other series:
>https://patchwork.freedesktop.org/series/131816
>
>Francois Dugast (4):
>  drm-uapi/xe: Align header with drm-xe-next
>  drm-uapi/xe: Define topology types as indexes rather than masks
>  drm-uapi/xe: Expose the L3 bank mask

no, I don't think we want to merge these as is in this series. It can be
used for premerge testing, but this is just reintroducing the same
problem fixed in patch 1.

I applied patch 1 locally and then did a diff with the current
drm-xe-next:

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4353595a4..0b709b374 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
         /** @gt_id: GT ID the mask is associated with */
         __u16 gt_id;

-#define DRM_XE_TOPO_DSS_GEOMETRY       (1 << 0)
-#define DRM_XE_TOPO_DSS_COMPUTE                (1 << 1)
-#define DRM_XE_TOPO_EU_PER_DSS         (1 << 2)
+#define DRM_XE_TOPO_DSS_GEOMETRY       1
+#define DRM_XE_TOPO_DSS_COMPUTE                2
+#define DRM_XE_TOPO_EU_PER_DSS         4
         /** @type: type of mask */
         __u16 type;

@@ -871,10 +871,12 @@ struct drm_xe_vm_destroy {
   *  - %DRM_XE_VM_BIND_OP_PREFETCH
   *
   * and the @flags can be:
- *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
+ *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
+ *    to ensure write protection
+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
   *    MAP operation immediately rather than deferring the MAP to the page
- *    fault handler.
+ *    fault handler. This is implied on a non-faulting VM as there is no
+ *    fault handler to defer to.
   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
   *    tables are setup with a special bit which indicates writes are
   *    dropped and all reads return zero. In the future, the NULL flags
@@ -1085,19 +1087,6 @@ struct drm_xe_exec_queue_create {
  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT    2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT           4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER           5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY            6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY       7
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_128K                                0
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_2M                          1
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_16M                         2
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_64M                         3

         /** @extensions: Pointer to the first extension struct, if any */

I seems we don't need patch 1 and 2. We only need the commit used to be
closer to drm-xe-next.

include/drm-uapi/xe_drm.h should always and only be updated by copying
from kernel from specific commits documented in the commit message.

WIP changes while the kernel side is not merged should be moved to
another header. Traditionally we used LOCAL_* defines for that. But that
comes with its own problems as it's more work to  go find them all and
drop when we sync the headers.

What about doing this?

Add include/drm-uapi/local/ to -I in build system *before* the non-local
one. Something like:

meson.build:
	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')

Example content for
include/drm-uapi/local/drm_xe.h:
	#pragma once
	#include_next <xe_drm.h>

	/*
	 * Local definitions - delta with WIP UAPI while the upstream defines
	 * are not yet merged. These are supposed to conflict whenever the
	 * upstream header is updated and break the build. That is intended.
	 * Commit updating the upstream header should garbage collect these
	 * local definitions.
	 */

	#ifdef DRM_XE_TOPO_L3_BANK
	#error "Already defined by upstream - remove"
	#define DRM_XE_TOPO_L3_BANK		3
	#endif

The ifdef + error could be optional as it's harmless (and allowed by
compiler) to redefine it multiple times to the same value.

Thoughts?

If we don't want to decide on this and you only want to unblock this
test for the kernel addition, then maybe just do the same LOCAL_
approach currently being used. See e.g. lib/i915/i915_drm_local.h

Lucas De Marchi

>  lib/xe/xe_query: Add L3 bank mask test
>
> include/drm-uapi/xe_drm.h | 27 +++-------------
> tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
> 2 files changed, 71 insertions(+), 22 deletions(-)
>
>-- 
>2.34.1
>
