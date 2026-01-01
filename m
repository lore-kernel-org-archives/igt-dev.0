Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F131EEB573
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 00:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97310E2C3;
	Thu,  1 Jan 2026 00:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyaxUEHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146FE10E2C3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 00:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767227674; x=1798763674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1FT6YQVaK+CS/AuXnw07wJfJ2JdhzIbdbkpDjG5USRk=;
 b=RyaxUEHI3VHug7IhY4eRqnjGuOIjet99rTmWexTawSX7OtRN7IbXLLdk
 eaom0xf+u6huw4ZvpFSKuGyb/Xt930zc2ZE7ciy7LRLoGrTBjEV7DYAt7
 LZyEIQ5AAzm78LQJXYsEhVnHZbITnyPRPQtPyhPEzkA47snYgPArh+QpM
 QGdPIHkSiAHPuov8l19vIIIFdsTSClgjuyFn7wmfXzjzDmfwmxiuEvqhi
 xGwJL1Be1Yt/0elH5XM9cpEuH5KhKNpZ/XE1MMBvHLqvTnGyXL2DhzPVh
 P5ZiTsHV1k9BUXqI+b8dDxIdC0MRcPmS0DvGd6siaH2bQpmbK625ACkg4 A==;
X-CSE-ConnectionGUID: 5F5GF/woThSEdYzbXJ54Dw==
X-CSE-MsgGUID: qy7ZcTblQOS/J6LlLa7OKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67981777"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67981777"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:34:33 -0800
X-CSE-ConnectionGUID: 6yV+VxEkQ9eQtnpMrfXqLQ==
X-CSE-MsgGUID: bYeMQBd3RNyUOL2rtgMXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206414567"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:34:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:34:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 16:34:32 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:34:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSPAklMgDMM+eJl7CNSDsaBcVmxVRFi1apCHXxYtKbz/P086BDbo9WZ1Fi9IPsm1nEemPD0G9rSer2T3gSm9KSD9pACUYlyQ96Va9pd76vFl4fQ2XW2zKLw6sUcK47xQjQshB4sVmEy+7S56GM4MKLFtCWUFoO4S5WpO7V0zNTJKmbF5VclRqA14zggHb1L8eBX6pNc/EqRTnAPr1L3tUHgEPmjYNVJkFYC7Fyi2NwhddwbxWgfs8avUYFagHi4pfCdoCWujtaqC4ERsTMMfr2HrIaR0z8jALKXrMU3moaHugSUAbZFMtT7iLfUg9ipzKIiJQC1pMJOEMaoaabj/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knG0PTMoiKwCHLumBy2uduImfJnYNK/EA/UWcTiulQ8=;
 b=rYOsCbUOijZ8pYo/N7hoSC11rjseTNmgIDIxWze2jhxKQL6KgB1bNelpc6j4XtUOTu/y7jFwweEMZKBHjFxhF1fRSkrOhJe1EnNpNE3EvL5lQil9yH5KX60TyaA7Bhe9YUfnsP6egtvO3L2RDo2w7i+Bqz7I7X+ABn6qglWKG//CwwQIBQMf+g0gw2I7GJqda4+XAImpgyM5yR6x0TRh3Qjm9f6IBatWhRWD5HvxnIP4VqhVMyWRPsLVwwnR9JIoiBj63eqd9HL69ULqNPlkWtfe2LJF0Iu8ha8OUWClcOYxr7HDEO2J+/r7o41/vOEnIPgyA7dFKSIL9Ur8rcmz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 00:34:30 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 00:34:30 +0000
Date: Wed, 31 Dec 2025 16:34:27 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queue test
Message-ID: <aVXBEzxYOBZW8nfF@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-3-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-3-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ba9e73-dd3d-4f29-149c-08de48cd86e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZFA7y+ubA/THlnfB7sh7bN7sgYnyl9+NAM6G0jOHVAVf8UiSWYAegVdKJ12x?=
 =?us-ascii?Q?srpL6wb1rUrF/J7dAw6/R8PWl5cR86+Jaizrnf0H+JglBK7f+450nuZV3h4o?=
 =?us-ascii?Q?ENOhjS5AG4SAL4Bs/Xxt3p5a0ePgrmW7eEHeBRraYTQEffbS6kecPJmy65iU?=
 =?us-ascii?Q?Tkl/HjcFzsif7Dwn81Oq048l6wrAKTG/F39aoDXDfoMrLyrbKW+V4DdAja69?=
 =?us-ascii?Q?o7lIbrrXXKJbg3jz1O0IsCVVHIFvo2CThshrIWuvgWNcSK07MYWFW83DRXc6?=
 =?us-ascii?Q?fRf3uOs9/fdug1OF5ewfRxLttFG7lP8apYvkPoNactdofft+JhJNf3Od57VE?=
 =?us-ascii?Q?JRCxDU2EMhYPqY5aRnFl/OVxLXme66yMVjSIelh7bL3aVQZocC1GGzxiAy9O?=
 =?us-ascii?Q?ZRYRv2FtEMAeWBt0eC2OabLkyijklfgTgWJN22e14lm+UMnu3v8PHX6u5Ecr?=
 =?us-ascii?Q?gXp11IincQlWwr0NyoP4pJokJdWT2ZdBzLeN6hXgSSmzbqsWS4S0NOVaD9Sj?=
 =?us-ascii?Q?7DfZm2bND4DITCzjJ+GSrd2jHpi0JmmE+zKgsRzXyUR+KLG6iZx/vHD+RQwY?=
 =?us-ascii?Q?FlYOX2ybQmK2hGNTZ5iUKe6ZVD8UgKVIadYLOTyJwi0ktJ51PEjC+kD/jMEQ?=
 =?us-ascii?Q?tuFGlYUvRjiImSrwjvhpKvartYNC2Pem3qQnxHdIsFuh+kmCtp3cfyT26rUi?=
 =?us-ascii?Q?B48YSlPTqx5/YUFbVEhfp9y1aQGCXjCq9tO3xj94cVAqeOKvqe1ATDPCNDpr?=
 =?us-ascii?Q?c8Jq+JgMDLV+l4oZbnU84hQRsGSsVFFV4breD8yjX1/sQnpjIhg2o8L+7xOO?=
 =?us-ascii?Q?Zaq634I0lc4gDbHdqIPzRLMLuBlStGom/TjuXcjEVn675gigF32cVEnYHO7r?=
 =?us-ascii?Q?U171p1B33uNre3DFR0sqxN8v5URQYKaJ5xPcSRKn09gZ2bJxnO3TVc/6q2De?=
 =?us-ascii?Q?d11K8SSsDge3QC2i5mMgRtzUXCSqSH0+76X/2h8pUQsfEHNnIawwzUd7+9ZX?=
 =?us-ascii?Q?8W+i05m7zoUugP7AQHtqSzxTJAI2qCuP5bANYWrRCWZwy3uC2gXsHkGZTzxD?=
 =?us-ascii?Q?cZ8h8p9m3e/sTw2ed3wgFuF2CxfQIp4bkBYr3Czb4RSJyfBEmpA/003XfZj/?=
 =?us-ascii?Q?GSFowtT6N/BCc2DgpO6OkdcUcvJTMKioj1QV/RmdM9G0fqHnYX+zKio8kxAv?=
 =?us-ascii?Q?o4Cxe84Qm1kHwLPj+87IkFLY7iemqEYRw4v/6PiK5GPm26vI/jk4BavXyXSM?=
 =?us-ascii?Q?WNaXYtYxFQ/8f/ggR37jiV9dAi1LbSleUmzNtJbp1M0XH6V0yupY/EeKmSnz?=
 =?us-ascii?Q?0gZib3JzpWbLbWvXgUSugjIhBKTTeHFjN0qT976b6MLs+Mem9cCwCwe2G6Vx?=
 =?us-ascii?Q?Rx2cMIqkCs3OO2TZfdpc5f+OV90OlSOs7nYn4i9FBHPsiY0De54eqjCdBMLz?=
 =?us-ascii?Q?ot6CrLQQjEeZwFpZnV8gRFd88kRmxgI+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U7bChw3MI8Hx8zpcxhFqQz7zS/SgCTgjr2lB89U/mm1Rv11bkJUTz2tvk/v5?=
 =?us-ascii?Q?iNWcxqpGkD94TGRqNTTNBzOEMCxO0g/3IdKsnVkBYmGPSL8cKBBv9cyIGVr2?=
 =?us-ascii?Q?yyJGUo2ZOaPrjDPAcJl4/76H5EBh2f1MWaV1/xvAnIJuhNe8rmvx1mlYD8bE?=
 =?us-ascii?Q?ML9crRV84ogmghTgHg3m3akFQctEYWebnLeCNDTX+WYxyRP2Xdgp2KuyDJ1v?=
 =?us-ascii?Q?Aqp3jEYEUKm1SPGeAoCbQhZctp4y/xuYREReC1jDHs6sy6akwo7STrCEm3SJ?=
 =?us-ascii?Q?DHojQiMulLPZ7gyk1YMGUpbjO5fsFbf5SlztD+Q0mpMxIK6IdG9gwgvQLat9?=
 =?us-ascii?Q?4PaNjItjq1Qi9eTJIoI7sOoSSY251XyQkrdi3bgfvhWolXbh98srI79FoDKr?=
 =?us-ascii?Q?Ql6L4btgSNd2GxK51pJ0gH6FpGJOOc5MnXGx0rkC70da/XekM7bA9LS/0KTg?=
 =?us-ascii?Q?cFo/hezS3i2vN4n8A8eT8YpBIplha8RgEZCtyNn5ij4YpczUTRDikeGa2rhL?=
 =?us-ascii?Q?mjweO7eCqAi9LN/vc1bxBWsISHFAYsX/oe40L82svvxylYt2DNFxF52j5efm?=
 =?us-ascii?Q?fgyTnBuPWta9L2vFxg2MgUXvTHM6b7ftv01n2JM3La0XvSZm/8GIzmriMvK6?=
 =?us-ascii?Q?lPD9ZbD1HJaHAHpffBN7l9aeGoOHAMX/+al0CamqH6DcNMXm3Wdmc+RSMIU0?=
 =?us-ascii?Q?Mqn01pRBcHYEcdsGCCjTSF/+PHkYNg7RfZwG22IxLnek6qN07qtKUswNP9hM?=
 =?us-ascii?Q?hUex1Bfll/GGWXgB5mO43zqy7P4tL+y3DmeJRHddwwL9qfo4MJhZiJ6AJ9Pe?=
 =?us-ascii?Q?iKJYaSSFzFY5jN3QlUyRb7if2qdfolAe/6yzb3nZU/6Vy4J1AY6vCqxpQXLP?=
 =?us-ascii?Q?wFsoMFklPLA7dN5zW1T2pGpyFM2hSs7gBJSkUl+HyQeOzK0C07FkGQGznV5X?=
 =?us-ascii?Q?qC9FJhacprencwgTud7++riwkCg9H1S6gBvBpO9FI7FJ44E0Ox1DJGb+6UMf?=
 =?us-ascii?Q?RJ/6ZqHRzFDkf3HIeSPjBmJUE4Vfu0JKjJn0e5IapyorpRTJAkvHbKw3PneZ?=
 =?us-ascii?Q?RQCgAZXMdL0+fIWVYGI+j5ehp+c8vp/Mn/WfdlTcJHDVNNwuuT2/VFAlHcHo?=
 =?us-ascii?Q?uDm3vtIJ1FosOIFDEXhqhn+d7oRrFYBeHBjfYSiBv2fdKnryNCZUoAcO6aoS?=
 =?us-ascii?Q?GWVuK8hV35GHheiKMN8bLPodWoNUwl2sKiaLrlL/l+rBlhaT0Auvd0x8JZ0n?=
 =?us-ascii?Q?bKmmTB2c+fkKwHC3R8SblgW21KPiGLYPmXYrtLqwilL6FRjazovTudEP0b5o?=
 =?us-ascii?Q?jbAZfGqDJXhu6wKpoQkir7ntI6iBYQt8ps0KemaU5u8jac7VnfdqZDn/Ie0s?=
 =?us-ascii?Q?VwkX+977Fg9NIW5VYa8P3v+ZsTCY8fd50Vic4DBcJ+3cpXTa79JvSxJO5/vr?=
 =?us-ascii?Q?L6w0SpoGKuFi702KaBi/d5jpNYwKvesFvOWA9ifNWRV/xgsGFuUpIdTAD2qM?=
 =?us-ascii?Q?NZCAJdejPrDgyXhyJdeMcwxdfY08MPfEasR1C1KhPzCf3/gBCBbEFYnzJq7U?=
 =?us-ascii?Q?QxHb76XibomCs3ChZPIxXRTTlqCOx0MWKhiV/Uzof6l1Sdfwjho6VPjKQRhF?=
 =?us-ascii?Q?JnV24wRF5BXLC3YQ4brsxXnxJQgIPGnJwj42i3E4X74iHYo9hcJRNFQlfVlB?=
 =?us-ascii?Q?hxlxbwc4keqny7V+vHqVJ4yt7t80JxcyUEvcBVK8STHhyhTWx5otOXE2N8HV?=
 =?us-ascii?Q?1vgB/QqfvN7KGihafBJqakutXKZvwLk+c7IUXg0qbUHvbH/aFRMD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ba9e73-dd3d-4f29-149c-08de48cd86e1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:34:30.3011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGVqJMEh2lvJqzWQYPDYgF5/Bs2EWqTJLjKXzjAqGCfBaaCEXl3phuCI1maQpSnNd+HqyQiqRI8HnfJbkstyuojzDVe9hlxFXh2GYAmzexL5VJG88r1tvbV3KV+boYtR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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

On Fri, Dec 19, 2025 at 05:31:49PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Added basic multi queue test for small buffer objects.
>

Just curious. Are evictions happening as expected?
Though in theory it should as all the test is doing is
grouping the exec queues together in a multi-queue group,
it is better to validate.

Niranjana

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>---
> tests/intel/xe_evict.c | 62 +++++++++++++++++++++++++++++++++++-------
> 1 file changed, 52 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 2350487c8..a62230ec6 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -29,6 +29,7 @@
> #define COMPUTE_THREAD		(0x1 << 4)
> #define EXTERNAL_OBJ		(0x1 << 5)
> #define BIND_EXEC_QUEUE		(0x1 << 6)
>+#define MULTI_QUEUE		(0x1 << 7)
>
> static void
> test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -80,7 +81,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
> 						      eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multiq = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multiq);
>+
>+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);
>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 		syncobjs[i] = syncobj_create(fd, 0);
> 	};
>@@ -259,7 +271,18 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
> 							      vm, eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multiq = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multiq);
>+
>+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);
>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 	}
>
>@@ -516,6 +539,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small:			small
>+ * @small-multiqueue:		small multi queue
>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -546,6 +570,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small-cm:			small compute machine
>+ * @small-multiqueue-cm:	small multi queue compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -678,7 +703,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  */
> int igt_main()
> {
>-	struct drm_xe_engine_class_instance *hwe;
>+	struct drm_xe_engine_class_instance *hwe, *multi_queue_hwe = NULL;
> 	const struct section {
> 		const char *name;
> 		int n_exec_queues;
>@@ -688,6 +713,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
>+		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
>@@ -713,6 +739,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
>+		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
>@@ -820,6 +847,9 @@ int igt_main()
> 		xe_for_each_engine(fd, hwe)
> 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> 				break;
>+
>+		xe_for_each_multi_queue_engine(fd, multi_queue_hwe)
>+			break;
> 	}
>
> 	for (const struct section *s = sections; s->name; s++) {
>@@ -829,9 +859,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict(fd, hwe, s->n_exec_queues,
>-				   min(ws, s->n_execs), bo_size,
>+			test_evict(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				   s->n_exec_queues, min(ws, s->n_execs), bo_size,
> 				   s->flags, NULL);
> 		}
> 	}
>@@ -843,10 +877,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict_cm(fd, hwe, s->n_exec_queues,
>-				      min(ws, s->n_execs), bo_size,
>-				      s->flags, NULL);
>+			test_evict_cm(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe, s->n_exec_queues,
>+				      min(ws, s->n_execs), bo_size, s->flags, NULL);
> 		}
> 	}
>
>@@ -857,9 +894,14 @@ int igt_main()
> 					     s->n_threads, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			threads(fd, hwe, s->n_threads, s->n_exec_queues,
>-				min(ws, s->n_execs), bo_size, s->flags);
>+			threads(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				s->n_threads, s->n_exec_queues, min(ws, s->n_execs),
>+				bo_size, s->flags);
> 		}
> 	}
>
>-- 
>2.43.0
>
