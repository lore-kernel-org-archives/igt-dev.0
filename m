Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C9EC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 22:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077610EBC7;
	Thu, 11 Jul 2024 22:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ee8VDiED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8235C10EBC7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720737028; x=1752273028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZOfPa7PgjlW8E82yjwQDcZoLXKD1vw1HGehx035F4kQ=;
 b=Ee8VDiEDT+LeN0mcUFV0RxpHm9X2ov/lfk9Tvr9n0vCGMz4+UFVoA/C+
 cxe+9/mrCBo/GniC1qESphYTTxWAf9VH0583AjqDSNDUDpXC3aN3IoObn
 kpDCz3w0BFxkKVHnxdteidtzvJqAvDuTRnxGDGJfDlzpdJt/VGnI3jFp+
 9sAT20hU8Fj5K1keJIpbGZH9FpJbVmPunJNFmfYPa0C8tq9AAmYOYbTPr
 oBkdwyrIpz3kusJVNR0zrU17ruUlnG1d/rtqzvdKKdkJSU4IViu5G6otB
 xn6nbeANic+nEb4V0fcYaP1TXTCVcqfYozJfOeeeyj2yPh9GpVqo8qvak A==;
X-CSE-ConnectionGUID: XRgJXjh0RpijxaM4CRBMpQ==
X-CSE-MsgGUID: i7B6FABFR+mge0W4KMfCJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35589000"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="35589000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 15:30:28 -0700
X-CSE-ConnectionGUID: 55EuWrwzRqKRQvbs0HIH/Q==
X-CSE-MsgGUID: p24xH8xZTsSEp8ZZLAtx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79408235"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 15:30:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 15:30:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 15:30:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 15:30:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 15:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytTWf2NzTp2cx/U/KptXl2UnllNjFJfEtjtBYPa5dxGYMxzGO5KuOy281KfIYsMPviNmV9H3ekP8ahZMLl1Hxsqv1QkW5EQmqczrzTM/bjilTjgvEm4An6K/R0AbZpls3VO8aGhA7f2Ha9kKjTzJbAaZrngT13judhJeDDC8U8ORi5G3g5GVez9OQglmgsgAFibTIaEYPed5dmip1w+d2zjHvOHK7EFxkfKLaILIZNvusju0qFR0uwdtJN3AxXVGxAN4Ixk9EJI0RHINdOdtIZaSbCYsrdlYTMfTfOhjTb5tAHrayIRI9P9LUWIJ81yrXmJ5zylvdkFE9BBe3pHfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ApnSfKclSMND6R1PyHcvhY3g2Wl79uQLPacT69wCFU=;
 b=C/PCUqKXiBKZGlDxq6uZx2nHb3BV/H3JbPTAszWiWd5UwMABukFzk3g/s+cYLu4Sq2ymfIC4XLd76j9BixofynasPxnf3hvxg8U4lw50CCF/tgOwGt5AY8bUepBTsK4mXHBbU3mT3INM+sYQMT+jnGBu2VYUN4SxhCSzPrGfuYOAn4v4gLn1cJ4RZl4FXEauqQdnDWl63ruV7335St3NPwzAAgf6nSI1mMLrHtVtesNa12XmLgWO4jtXThgnONPiY0muO5xDw+gb2dZ+/gOb9C+rsUg/+9V2IuitiDnJKRT6MmqoAAMUxgkM486CW3TxdwpIDaeGwWI0fChD1lccYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 22:30:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 22:30:16 +0000
Date: Thu, 11 Jul 2024 17:30:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2 07/10] tests/intel/xe_drm_fdinfo: Add an
 iterator for virtual engines
Message-ID: <qjpe4ruaijnkvh4ljfo4khessxu42i5ndgwsrhnxzqgt3do2yh@e43ewitauzbx>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
 <66pm7xg62ide36jiagnsc7hb3hqo47wwadkisyqzokhtbobfsf@wsgxak5nmwzw>
 <ZpAlCU+y8hqTlF3e@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpAlCU+y8hqTlF3e@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:303:8c::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: de1afcfc-d155-4273-ee0f-08dca1f90a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Loj0zyTlAXI/o5do7jFmSwuKCUq2xUuBxZj6hy2MYy8GB6vXBEHcKmu99Uj?=
 =?us-ascii?Q?oDc1AU53DUWgsv7RHPb3K5uDqUJGRGH3Sfy1vrequwMe8eG18/DmJ4a1YsbJ?=
 =?us-ascii?Q?xMiiS2dQGQEOZy02f9PkjHrrxsgAglxY1m6DsIkNXYis04azX4fOj8vS9Eq2?=
 =?us-ascii?Q?6DF0+EIJ/Y4ciba2EtP68raO7NiAX4YF8asF27tWrZPadrrfN/u536zmIeTJ?=
 =?us-ascii?Q?QV3nfuSfqruvjCFG4FpZ60nSxFMew5v09Ifk2CRPYMqiqIray1m7na3pOQp6?=
 =?us-ascii?Q?vlUePy0XDVs54HEIzpACzOjlBiHqHMhRxCALxDorjAvtsY92IKEmT/+LG/89?=
 =?us-ascii?Q?DCS0S8KjDDeHIPFsAyJgDlmXkJu6dxgvs3IuSnq1Q/kIPMERAzaMgkJCUw5S?=
 =?us-ascii?Q?peWZUAAFecaJItlbuyulIhYntavalJbgru0uQ8tWgEP7xyX/gM0JJAZbumHV?=
 =?us-ascii?Q?Xu0H8F5hLrLskTVROmajPGD8sAsVXQ952Ra5aWjChHGrgrqrhtto9T9Fxkhx?=
 =?us-ascii?Q?4bokuG0AUYHYbog7ufo/TEQIxBV1uCRdWyEaJrQqNa7g/LdrIO+RYg4DVVbD?=
 =?us-ascii?Q?+/05uYwqpyDm9/BoqJzyGE6H3XGjQm26tVpq+lwBgmbqA+53cmcETX4A3yOQ?=
 =?us-ascii?Q?m3TN9FzAcORQ8HNswlw5TqHIoi8dKw36z2dMPRiNmjN28fuYxaCAlOixtTam?=
 =?us-ascii?Q?VinIWaqtzN8zQXN7OsabJaaz1UceZqQdRViBxOxUfrXys+WzaU7PbAO69Agx?=
 =?us-ascii?Q?DXUomdmBPyJT3vWRaIvJHghvRbq1ITZR+8eTIwVOpwQOQFkQfAaMxgY/s313?=
 =?us-ascii?Q?YGOx1mQxUwCq+w878rZxoM3WGbSA6lRbv1ztR37mKDNmCbbx9UUCHysaB+4S?=
 =?us-ascii?Q?dBX07dySjBWBpKC0o/K+JFzUFNo3SCKTSJndirnmMKfXdNx4ZM4028b6kQWW?=
 =?us-ascii?Q?CKzqXXC7wmcG2xrOXDF4ExLFj/WNbR37+AO6XavEF4IfIMV/9JiozbTO+01y?=
 =?us-ascii?Q?/6wincqrA5fhWIsV9dU4VOJojFIPcYbTzGdrSSPXYaq/nBE0HtnltIMxrdeD?=
 =?us-ascii?Q?NzKdhRzYs8HaI7UQybnpUSeSIO03TSINvvyBnFO+fPJykMrmcCumma9KITw/?=
 =?us-ascii?Q?qlKtIi+8UBholVMh5vnZtNL46ACurAUVJ++IW8ekU7X57ZrBRY7RXdIH7sae?=
 =?us-ascii?Q?v3Cpc9eIAPieNsra3FLGOdLTikYpTawqgS598JvyC07MpJl3LxO/znuvqAMp?=
 =?us-ascii?Q?54LL9PWqvi6OQk1HHqsWw/yIBXq8D8BmboSkYU7C4jyDTsocZC1/3pf1hZDg?=
 =?us-ascii?Q?NqdHjNqUArwM4I7shJCbbNM0YdWxVwZ5adYaJwqj4QGRpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6L4bpuh8/uORLr/GtNueJipqSnJYYSzwE3Cb6ZB2e/EDMX8w3ISY10HJhjJ1?=
 =?us-ascii?Q?COtoFyC5Sq7/KhaBSGH/GuDIXi8sRPE3DZsRBpiNhdgRGAHuvpUoqqd7M0JL?=
 =?us-ascii?Q?OKceUjVp4KfnFBoT7qU9tNIW436UQsdGUC/XLZghqOcxmRwoR5/c2V+Mh3oY?=
 =?us-ascii?Q?i53bYjo1qa7/JSxC1XE62V4/icSZi7NzFVMGKkag3ouV5gxvSNOGRYfrvdPb?=
 =?us-ascii?Q?SsUdzbJvEI5s25RaPy1jrPRopZJNpTpRuh0YhcwG9bNwzQZ8/GTahgBsY4yR?=
 =?us-ascii?Q?YLaDZSXzcXeDOLvNeYsQIYXQWrMSwOHaUEQB47325eWSXoPvAIaL013mTo5d?=
 =?us-ascii?Q?0DLH4HZuH34JuqCOCIFx/1lIBRy8ZMTzDg8TNqHVEd0iJQe8r/E2FlqKlVbg?=
 =?us-ascii?Q?dcWY9r7FLUQikrUyxP+JF2zu6oFmbOxNIYsJIJDmjTEOk8aLzYwY3lsktAeu?=
 =?us-ascii?Q?DLXzOtfF0/tP85js/nj9nng9TJyf16ZYNRUKfd8gPzWXQYpXxy0M0tI7sGvK?=
 =?us-ascii?Q?13D9znPtHzyZDSasD5EzXTmpVyH52A+pv5R1EUP0DhW06wM6SnXRiuvi0odk?=
 =?us-ascii?Q?ptweCTSuxZZgeJGqqGB0U/xsBYc1yhyC+GALJcoyWplSgJ7KOmhW+3Oi3uuj?=
 =?us-ascii?Q?hAG8AbNaab+H2Rvnk+GmQpC4EBiYoV8s9/68pkoa2q9gVRjuSxDAhhZKLsUA?=
 =?us-ascii?Q?k81PaOLX9RdSsoFZqoBjfiG5464WfcngYe0z236RYw1qLf4NCeHh8KhqDcvV?=
 =?us-ascii?Q?/RwqN1A0TqyZb/JOw8umbmSQR8HWBUrzwAaGRUiPkaAVO5L9av1hiSHvu34d?=
 =?us-ascii?Q?OtR5xWSEjIVqNbBPQy3M+KopisWjtZbMyUUX+RQ0GNmADp8Szdh8PNGjXHnv?=
 =?us-ascii?Q?wjDYZu+H517WsX8FUMGe20OXsup9IL+04HdJ2uSlEMhiigaK5JkkUnNImZjK?=
 =?us-ascii?Q?r/npKqpuifII+kIVMD1OfdrUMue9rRyRo/yU0ZLO7rTEhp140nsVPShiGmKj?=
 =?us-ascii?Q?K3iyHOzQpoDC2RKr/nBC0fgt2pDEcYkkLqWP4zU1+s+lBmbYcV/YGF2wcFPZ?=
 =?us-ascii?Q?x8od1gTCs5lgzqw6fQibuotlSNnkFtsHyZS+7ZU57WXT2ZXTZVn0XD5mhU2E?=
 =?us-ascii?Q?OQ7Ad80FeHBR7sHTkBy970xUoHTfU1g2EE1IQRW9UZ1lzTWfOzZN/7qJmlPq?=
 =?us-ascii?Q?bHv8LhFJ26ktKihIHD8bBR6I2zbbVk8KOIy6pfCqqQaUr+BbEOeNV65bSa4C?=
 =?us-ascii?Q?7qtcIlCNOy9KAUFhe0KfUa4sTUSjvVvAvmyBsaihhXe5KeCPFKVSo41TH/q4?=
 =?us-ascii?Q?ZGX+XSHRxfKIItQCFbPJWg3JScCUH9jqRwwo1uWnSxfXQA5vCa79yep6QtAB?=
 =?us-ascii?Q?31qr0FSiNEPv5KMYR7ZV1HzGPgb1fOgzsBnhL6WOQ6zwWQHhUGPi28xh1iPP?=
 =?us-ascii?Q?TiKcBouUvnWe2Lgd5i0Gewf9N0Nbh1UUWOYVMs/i/aKoj4t/sZ8zdTC1P8iX?=
 =?us-ascii?Q?D8FOAjGF8EL97Ub2S8RvF3n1zG+01IYeslreOVgqMY1toLP8HYy3PGGL507L?=
 =?us-ascii?Q?Gg+RYE85ABODTNjWhV67U26feCOizFFuGZN/tDeHIjQ6tnNp/7YLigdGrDYY?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de1afcfc-d155-4273-ee0f-08dca1f90a08
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:30:16.8326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WFHfSjgpxdBtXVKMQKzSpKUHYabYALd2fdRAv2TPTsnBx4omAsqCRKXOKvoUCg7zBYrAdnkSi9OUlnXC6XS8RfUT3UA8eVdAoyOKJwSsGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
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

On Thu, Jul 11, 2024 at 11:31:37AM GMT, Umesh Nerlige Ramappa wrote:
>On Thu, Jul 11, 2024 at 08:34:03AM -0500, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 05:25:29PM GMT, Umesh Nerlige Ramappa wrote:
>>>Add a helper iterator for virtual engines.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
>>>1 file changed, 29 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index f2051c422..9d3d1b285 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -90,6 +90,34 @@ static const uint64_t batch_addr[] = {
>>>	0x1d0000,
>>>	0x1e0000,
>>>};
>>>+
>>>+#define MAX_GTS 2
>>>+#define MAX_INSTANCE 9
>>>+struct virtual_hwe {
>>>+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>>+	int count;
>>>+} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>>
>>there's no concept of "virtual engine". I think this is something
>>brought over from i915? Is it related to the width when submitting?
>>
>>Please add a comment for the confused reader and it's probably worth
>>this abstraction to be outside this test. +Matt Brost
>
>width is for parallel submission and num_placements is for virtual.

ok... let's also s/virtual engines/virtual exec_queues/  where
appropriate. Like we have in xe_exec_balancer.c

can we also use the helper in xe_exec_balancer?


Lucas De Marchi

>
>>
>>>+
>>>+static void list_virtual_engines(int fd)
>>
>>list? shouldn't it be virtual_engines_init()?
>
>Right, I will change that.
>
>Thanks,
>Umesh
>
>>
>>Lucas De Marchi
>>
>>>+{
>>>+	struct drm_xe_engine_class_instance *hwe;
>>>+
>>>+	xe_for_each_engine(fd, hwe) {
>>>+		struct virtual_hwe *v;
>>>+
>>>+		igt_assert(hwe->gt_id < MAX_GTS);
>>>+		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
>>>+		v = &vhwe[hwe->gt_id][hwe->engine_class];
>>>+
>>>+		igt_assert(v->count < MAX_INSTANCE);
>>>+		v->eci[v->count++] = *hwe;
>>>+	}
>>>+}
>>>+#define xe_for_each_multi_engine(__fd, __hwe, __count) \
>>>+	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
>>>+		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
>>>+			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
>>>+
>>>static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>>{
>>>	struct drm_client_fdinfo info = { };
>>>@@ -678,6 +706,7 @@ igt_main
>>>		xe = drm_open_driver(DRIVER_XE);
>>>		igt_require_xe(xe);
>>>		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>>>+		list_virtual_engines(xe);
>>>	}
>>>
>>>	igt_describe("Check if basic fdinfo content is present for memory");
>>>-- 
>>>2.38.1
>>>
