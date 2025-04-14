Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C50AC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 21:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C04410E055;
	Mon, 14 Apr 2025 21:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKO07pGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732BF10E055
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744666350; x=1776202350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AasUpDNXwGWURC7XxYzTit7+3EMJy/u7lPWYcvVLf3U=;
 b=PKO07pGgo/aZq9JSQi4PqnZDRN2TpwwEBbgreT1W3QERtzmzOPQYwwU8
 VneOIDTHAaswZvt4T6J5//d/OIKVhqqLDbukl5FdVplZ3zHgo82i1GG7S
 Zk5TaJ6auc2vXfxKcYEMBKuaFHLAC3QoYwDrRwPIkDt9VJw7deetXmAtY
 Ck44ShUuFGXoOBmxgAtmSI2cnxiS0Kh01JRykVllcmpjLAImdFVOlwC3s
 gv0n1YrL7XAT6/7IVyiMRPm4SAZdH6VRRqsIhxJpY28jn/0mrdsDM6THq
 zAX8C4G6MtoMPup6aAzObPgE1MZOMX6Fv4xeA5JGDi+kMw6qcSqRwBYVD Q==;
X-CSE-ConnectionGUID: MR8vGWAZS/eMlqn9NNuB6A==
X-CSE-MsgGUID: XyaJDgf1S8C41TRU6BIn8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63556353"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="63556353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 14:32:28 -0700
X-CSE-ConnectionGUID: njS841kxTvqt4m0SqWY0eA==
X-CSE-MsgGUID: tFl5bWoUQPeAWpIq1mpu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134703380"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 14:32:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 14:32:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 14:32:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 14:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAWxsPRkiCucocdrEAAMN+ypM7urxwTmdNNRVFHyTBr8PNvFoo87woYlfTn8RrkEvN67L/XYSCTD1jw8vx73Ed7YqvgG5GK/jIVbi5HUnGmDopm7PYVF9/ej+5Q/XvWj89JsMJHmXpzk7tsm64KwlkFUTU/Wm6uU2O5BqeS7hEMmMgDqrzGQdm53US/UGjX66YJOcOihrjk5EtnfNZJM4IZJIhlYl8vFuNwKnEAzektTVA34HjEWXL/nZoshG9VjAyQgk3ewhRkkGLNd86amQjy9aHNmKuUUyuhQPCndFHMJPJT5Q5Id6MUccD0YjEaPGeKfouM7i8GiTG9pMbeTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szwd3WHTNOBlr9Qv7btySWwQvnH7dNcZWcHfni0UgJI=;
 b=HNIW2bOSg54tBJnvo4Q4Ho9T6zuLub+EeLjdqtg/2Cpk46s5mjdCj8JwL/OSxC+wviv3K6zkHTaYnzeVh1P7hZnMoQuJMo3NDnWcbCnlokmZtk2+U3t1VZvYUNZMvDjGoMFc6vPYjuH2jLDKwZEiXIt7/U15MgM9GcykNWN6sZK7n1qYqdFDHNBhgimNPdVc+7KRngsujZuG8soeVjaTjQU31HilZFFu3e8z8pA7GL0zBuxVd3uMhizGtp4wdATOUhXtPRxNhzHeJjytBY6UTxaAfxIYPVEmYF1IMAqf6FO1vto7Z2LGOp02e0O5bbHmdbVJsD1h9Na+GTCe3+TE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPFED6629EA1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 21:32:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 21:32:25 +0000
Date: Mon, 14 Apr 2025 16:32:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v5 0/2] rename drm_fdinfo into i915_fdinfo
Message-ID: <frxvr3oqixkv6p5mmaxr23vlmxbtqyqfnmtnqgqrdotiwuxk3n@xn5x4ztji6ai>
References: <20250414172336.59158-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250414172336.59158-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPFED6629EA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 782e8529-c10b-437e-7b30-08dd7b9bd956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PCFYtJj9v6nNw27ThQVOftsFFMwYVyHoULo5zVR1X3xwU/DMLtzzwvQt5oJZ?=
 =?us-ascii?Q?xAjRmwVA4VdO/eF8C6M79CH6gD/JxR+F0e5rZHik2pgCYSFaKDu2lUbfw8+M?=
 =?us-ascii?Q?I52ds80dIlm9Ix+qmAZ6FFWh8QynWiOgzzvR2JiXy3wa9d2aLhCwm+xAI+X4?=
 =?us-ascii?Q?9ROS9KOovO++/9fpQe1TK9Nr1ScCkhghWYCtl4vo0R4u50MC0OndSDOVJgwY?=
 =?us-ascii?Q?2roJ11AnEuHv2F+581hCgshLYRxxEDxpsTg1glywbHdX0I4wWrB6CiUsJBz3?=
 =?us-ascii?Q?DIlaREt68vlgovXDOTT3An73KPDJrN7Nx5kzFGAoLZxMqAMvdsWxU9EvmbSk?=
 =?us-ascii?Q?R7WE7pVeg1nasRC98Z3sR2ihcEAYazMXaywx3UZTPeMuk+MIpatZZZJKEBad?=
 =?us-ascii?Q?LccXcZBdkfUZdmo8EnKXEjP3uSpgxHF/mSKTzaOghOrL2VL83juJz2dMXF/D?=
 =?us-ascii?Q?4EixWfSmXxoCtAb2bhiUc+v9JnPCWl6dpMt9EtMyUP3HSPcaHD8meeCJ0Fip?=
 =?us-ascii?Q?M56l48EqfjuWYan6g9SsjGAgfzx7jziAMqlL1eyJrJBzCxe5PUySDxwLR/GQ?=
 =?us-ascii?Q?hp5vHMYUz1iJ9uq89o+N+b2AF6uL1rdDt3CpY7ZFHhJjcW562HJV8jIC4S/l?=
 =?us-ascii?Q?9WcLw56GZa1aBl5iFhFOeyXTAkZTUezFWQWS0RvTb7tcYLq+uhztJtA/mPSh?=
 =?us-ascii?Q?8gjbJ6o+zG1zoSGtyV6zbakDhTDHT1Anp4PA96xEw46lUiOlgJH3isC8wFvY?=
 =?us-ascii?Q?PiY+a4DPReVMMBrYv3yEWhF3trQFiUChF8gYnV+w3sPQXR2HzBya5JKdtddl?=
 =?us-ascii?Q?fnukTBE+2mhVPwm4yVOJigIuRpU+nH9llZn4No6dfONfwHVFl7WP74hdIkEm?=
 =?us-ascii?Q?GLAIi2OVazTcPyDGJFXdAGa5TUkSRfw0g8/6Qa8l9q96jiGcHTUnmmCF+S3Q?=
 =?us-ascii?Q?yHswYQn+ErsrOksh6Zcd0zOO+aJ6SwUpy6m/067FlIgn7CsocQJJoPC3OFJ3?=
 =?us-ascii?Q?6Qm7p1+dssZDGJ7Nol5B/cTeEI28OTsySGXknlited4S2RNgRpSiHnPfiA8N?=
 =?us-ascii?Q?/BS0rwxH1h7Z6mUmpr1k4VMVLFsGnvNJsosjGdz8upPmFeB4rLNGBaIwMf5E?=
 =?us-ascii?Q?1bevbk5kLBXTK1LqAgbjqxC2ed0al6O+9fXYlpC7zjcMMi2A9TtmPZ09KsZd?=
 =?us-ascii?Q?ChBkfddxISoHl/0kEZBNVW2vrbY4wQrOi9VZZMA7361KqSSKh0SjGXU60P6b?=
 =?us-ascii?Q?NNiwg6/3SVa6B+SzOTCnFbTwYVYUTJ679COyaxbJjFvAEQkY12aJxYTwM09g?=
 =?us-ascii?Q?ITQoPGbJWrqBoHcJVZgU0CxXexQ24ZwCbFJmvZUEdfmaTGzA6bOXPxd56mcT?=
 =?us-ascii?Q?+lDTgxI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NjDYtvGfL1AjWg3dUpuyo16b8v+Ees8cO4wEblWlbs7qT/wVxp9M8OLFjH7W?=
 =?us-ascii?Q?6OhTwyqQYS+Q7mKH5lfql+6X/qIqEcEmkrtiGmetR31T62wjBarQFYhuAp6r?=
 =?us-ascii?Q?iidOkjOfI1AtyQKwy4T/GK1gWe8XuHCUNqExUVuMdgFeVrAp5F0m7G2moncB?=
 =?us-ascii?Q?JZWUVWPj3OxskiAMUAUUqp2IRwEcWIp5Gh9V/zgDCM77TZQ9QFSQEPs+knbu?=
 =?us-ascii?Q?B2EGqMz/zTyRSo8i+xCLvnjq6V7X3Y0MR/i2nIopeekQYpsWdNf9nir1Mf7T?=
 =?us-ascii?Q?flbpDXAvD/Vc9JUVbTnqG+6T8BFtpShS8xaJgDGF9oAo9dMTvvUB+O9JNZ3z?=
 =?us-ascii?Q?e78Pv4sEPvgacR9WLEiulCZQa+hBBVooor9t/opIGDf7pDtuUt75O2v6xnTB?=
 =?us-ascii?Q?eOFminv39RjSjkrfjSlqu0JlEN/CFriFQHo9rX5e6kCSQaA5AF7w1RtPIEY4?=
 =?us-ascii?Q?7bcv8xVMIa6K4+fydgs0VGI/d15HWQCBTUlDDZ4zt3BaLvy1o1U8YNxjb1sE?=
 =?us-ascii?Q?lsjpG/yXmDvJByTvjgpellaVQpDDF41HSydeatnfudhcnS0lqQlfnKvj+D5K?=
 =?us-ascii?Q?XdhFq0AObcrZneCEVtT9Y5MKPwRTd7oJSI+qudCiREmvrlFLv/0tw0nXknQ7?=
 =?us-ascii?Q?4iVdWV1WyXwQszYtTSwXh3Bd/syzzWburgK25mGtqPlEL7vgVyEnfqgHZ9Qq?=
 =?us-ascii?Q?cbz1MH6YyXyKq9H0EAcTzkYX2IKYxs6gFer0tEuMdHLxnEcZDNYkx65QuEAG?=
 =?us-ascii?Q?Vb7T2927SrmhlMXdpPPnr1/lL2IAXyG5BXjyVp+rKz5Cd5pUvT5WojXk4z5r?=
 =?us-ascii?Q?tkJkGfzrFyonz00NY0A06h75/JXZCt2SPqfOSzKNhxFNMoSAGn+LEjpF2hAN?=
 =?us-ascii?Q?5ZhZN2czooCdlXqaFrAG5qbKG6cpJrDpFXkFNgfgoBPwR0BVvdShiInGM7/n?=
 =?us-ascii?Q?/C1SvHhvwg/6GpRdx1uIJ+q5Ut2byAaOG8rmrROWfUgc560QnuXXptiXKiS0?=
 =?us-ascii?Q?PXgLupsE78mpm9iEWwjAB1KQ2eLMY+K6jpFfzRFKsZEB24mVvRwoZ3wXdgX3?=
 =?us-ascii?Q?AarEAMs6vqAzgQZuTmtJsDri8bdT2+jKtCYNMD0un9sffysPumIvRw6g7S4p?=
 =?us-ascii?Q?K65tY1YDS8ed4Jzr5/NJUvhggmB4YaJV4N/LwzTSnyadb5LFkYBZoGybQKde?=
 =?us-ascii?Q?RRHrgzd38J3taoMbXKh64meXdG7vilREud46NxQabqpYgxl5CgOXS5vaUKBR?=
 =?us-ascii?Q?mBfWT+WAY75sXew93kaDdb+aqgO2gUsC47rXGVuY3IUbjCPLADdlQzBY+OoQ?=
 =?us-ascii?Q?aYKEPryRW9yBJLQhuXfLMtNgglDr++61z3iANcifYtV4oeRmzvA+M23XFq2O?=
 =?us-ascii?Q?SyfRBl3LxBPgk7Xis/fJOd/D8RL+/Hyq2g2Rr4UDeFPu/nsMPKoel2eq0F0v?=
 =?us-ascii?Q?l9j5drmkmePUNpiVhSnSIx0CvkT+0J/xFw2pbWN02mqjD8kZv1QfwNOpWmuH?=
 =?us-ascii?Q?tMcdrQH7+rT8WQZ2NW3HR2qMCTI8vNG5Bj5JFM9OH+ZhX8gHl2mDvEgy0wU3?=
 =?us-ascii?Q?L84tnHiquJ/w1Xh8bDKdQItQlDRPTGLNgA+9GYJF5rIA4EXXlD6OJWE3OuOb?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 782e8529-c10b-437e-7b30-08dd7b9bd956
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:32:25.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6e+9I66BGLJWpXT4o7PwWwOHDfPa26Gjxc4wQ2tDBtGMT2GZQiWzeuomNy2e+zmrpqajhKU43tE6uCKEavEpl9mbItwc90jz56QpY0c79k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFED6629EA1
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

On Mon, Apr 14, 2025 at 07:23:33PM +0200, Kamil Konieczny wrote:
>      This test opens i915 drm card and will not work for other drivers.
>Hence rename it to avoid confusion.
>
>See also discussion at
>https://patchwork.freedesktop.org/series/139451/
>i915/drm_fdinfo: Quiesce GPU prior to running some tests
>
>v2: corrected Tvrtko e-mail and corrected xe.blocklist
>v3: squashed patch 2 into 1, resulting in removing drm_fdinfo
>  from xe.blocklist, added r-b (Lucas)
>v4: corrected dependency for lib in meson.build (Kamil)
>v5: drop sorting other tests in meson.build (Kamil)
>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Kamil Konieczny (2):
>  tests/intel: rename drm_fdinfo into i915_fdinfo
>  HAX/DO_NOT_MERGE: test drm/i915_fdinfo
>
> tests/intel-ci/fast-feedback.testlist |   56 ++
> tests/intel-ci/xe.blocklist.txt       |    1 -
> tests/intel/drm_fdinfo.c              |   68 +-
> tests/intel/i915_fdinfo.c             | 1112 +++++++++++++++++++++++++

The xe equivalent is xe_drm_fdinfo, so maybe just use the same naming
scheme?

Lucas De Marchi
