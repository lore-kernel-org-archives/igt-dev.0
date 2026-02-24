Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00725E9B258
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 12:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953EF10E2C8;
	Tue, 24 Feb 2026 12:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuFpSrqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12A10E2C8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771935690; x=1803471690;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7tguBNpSYezlqJvM90y8hUfOkGYclClkP80d9qpnV1Y=;
 b=CuFpSrqkVM03n6W56uLr9kviAFrg24054imacVTp+o7m3Z0XwoOnonn1
 9r7dw8MVk9BBaitZOVSOa+cklKCiLZbayy1ZVTL+zGBGO0pLtwfi9VOZ8
 PNxylFVDXB6HUaVW20YNT9beW3SOGNRixN2J1aimQLQUeRjj+MH3ObJji
 3NWTaIWmB3JXu/RfYteTph0tVz2dkco1qZwbMssZjHXPH8vrKdDbVvXNM
 9SGIW60YK4czOd9AHi5VR0L7mGCGubcUgnnmVZa5Rw8TLnqRjZIr/miCn
 HyiLlDEih5j3bi4vz56YoZ77yxZNG5xjkwPcLf/uCbZw6gowimhKxwNtO w==;
X-CSE-ConnectionGUID: zjxP37sgT2iO7zoEE7lhdw==
X-CSE-MsgGUID: QUCPBBULRP2RY7zbD8q0+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83271127"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83271127"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:21:30 -0800
X-CSE-ConnectionGUID: EPgTxXD+SvqQwztZ0Y/Ciw==
X-CSE-MsgGUID: dUfQuOW5TO+2UUf8sDoNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219985766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:21:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:21:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 04:21:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 04:21:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTmkeXnyWtz95SKSVedsW9mg64ZZgbKrwKep3jViHJIs2dG5QeTbgGcJjj9Z2FQJ9Kc4PIaJDOsAyRLgLvV6Q4sBKU5zg7YI7EyGIA/0Ik9Nfo0EWLpijIyCBbYqW2rPoOs1+zfufSZ2Jr3sRQEkdcscrsh9m3zE3XFEgsy5CVzYblj8zdAN0L447iYOJXJGh7LYFizSKbDKYIvJ7Bj9MJpzpjWxok2udTd0nFpLUnAGavHlM2I9QHbW0detmp1ZQ8ebsC8mbYckF9De5Ac0Wh2eRm3CxRmipAfCo8hEI1JYpP3URM3NnjT2Sqaf9FXY0aUHcu9LZ7PmMufUFJLkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEQ1TCcj/2gAO6vX12NZlZTRDIEHD/7EZENfluVgnlQ=;
 b=lIzfDOG129MiWQMvQD7MXxnXiTAs7RuAL2x7ttHy2rvSE4XcRatjZwI2cznoEpdj3oKSS5uB5yZ1aZall1runZELPLSnbEzUuHPUJeMXEOjZmXV62fgDJvTi/sSNlUTPrYPR6jnl/O+VX1RCzDWHFNNkSBYQPfQlNN+2UqKliJ5UYTbOeu7J2P9AO2o+W5hgKTronUNBOtIHrOQvwvy2DpKJ04fES1MfWA6xMaotM8uBpA5LesSbRMrsZSLWavN5U6R1ijAXbMptiSNjFiBrsS/Ie7TnBaj1YiMWf8jhSxWYkKKyurtaqI8DKqIGGgXtS0kS+HwnCqMomvdnLt8dOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:21:26 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 12:21:26 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2] tools/intel_gpu_top: explicitly reject Xe devices
 and update documentation
Date: Tue, 24 Feb 2026 13:21:45 +0100
Message-ID: <99018033de0f61191bc09464ebe340631ecdfb5f.1771935520.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0a41c8-8373-4286-210c-08de739f3b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RZoZhhmpNgg6TVs3kJvprojvbv0J3CH3ZvDoq1FL3xkp7Cvu3SEShIzEViCM?=
 =?us-ascii?Q?1gr84Y8eT3KHocv+IpjJklnx0xuqJalS5C5ijbRIi7jf/Q8jh00pYRs1AYYh?=
 =?us-ascii?Q?O1P2ln7pOxRPUbkhCesTCDy05vtU/J8rB1wEKfyIY6jiOU15DuRehwydDZWf?=
 =?us-ascii?Q?5xm0J6Ujfyv/xCrHU+7Pa58+h6hUnFBxKekcdloBRN96IZtSp+JeyVHEYFGK?=
 =?us-ascii?Q?4WeTLTX4cCldzOrFQywkuFQs93gQu52c4MHqvrAOuanl487GSBrsD7I8Gsf9?=
 =?us-ascii?Q?9Z8tGneJjGTYeEUQgjoL22XvO9fPBG0pHCRniYNOPM+vpF8bKbJw6ids7Ef2?=
 =?us-ascii?Q?F543TbQwW6YCfoomXWNAXr0uXOTXqZ17tIc1HQWNck3LzEZH06PGJ3ecMTta?=
 =?us-ascii?Q?BQtG21RpObGOR66nRj18LrVVN6RNN1S4nzCukqO+fPqEMfTuAb4TDQ/+M2oc?=
 =?us-ascii?Q?OyCI/gADSAdxbbpPLo1gFThyTCx80b9wl0Rt1SAFmnjV3mM2DDtHOu948u+4?=
 =?us-ascii?Q?+jFP8kUQp9xfDRQJOrstqinqjTJ9aWk3tFTEH41SmgHTO5zrP4jT19E6GHni?=
 =?us-ascii?Q?XG+VOK6iwMnZ5vcQhZytQFIhirXDpH2eLfOGsGxhv5iz1dC+TylFoaBhh5nk?=
 =?us-ascii?Q?crV5cQIT8iBsPzY08e+dcluBa14VVgcD0w4DrBe5xlrekrGRalNrZRgdpt5F?=
 =?us-ascii?Q?5ZGGXbkLXLkEjY5xr4rsTkWR35/AfEH9wOFwikopGIJ1IFmh8SSMf85/ykHw?=
 =?us-ascii?Q?i8/Jv2OkSAtb8l9CqkNy3FC/+VkHzJAOMDDzwwlew1U6DovoEYlbHP4QmGq9?=
 =?us-ascii?Q?kIZQaogn0Ljm2/d7y1qRXpDiA8M5rNtAbpRdbQRZgp8M3hPoAixKUfow/p69?=
 =?us-ascii?Q?xJLSsB/d8re0mhKnR3bjjJ3zZq1njcmIdEZlbZQmwSCpW78A0dIGrUqtGhSj?=
 =?us-ascii?Q?ejo/ovwFM/bYPTvtgCNN+hubTGaFZe+TdbAS5posseVrGBmegEWJ3qGV6OH+?=
 =?us-ascii?Q?wQmdSUI69iMq9ZT6Asjy60ZI69Ypm9V200nkwMriUTZ7xXNHyHJ8TIMLMeSm?=
 =?us-ascii?Q?RCZdaIudHCsWFqMNnXJrjLjOlPgcHw4vlwKInu26oGEOu5aj27ZSGe5a6Loo?=
 =?us-ascii?Q?+AzhIlRzBLGgvY/tx5odjKvbKnP+UFP5O2P9nWpMbgHNcskbAi2lEViFl8Tb?=
 =?us-ascii?Q?W5n6j1r7EeJauFfDyXSeFE966mZ+ndU9TPf1dg9Jd9xHja+EEwAMwROVw00e?=
 =?us-ascii?Q?s0usD7ktS2TYFd6yhwzCchTmKLYvJbLDIvDOoCh2WXXXYEkWQIJ8h/VZG6aU?=
 =?us-ascii?Q?FyKnj8LCV3B36tsbRS8Zc6CwbXBY00qQ/IZRmbY1yOxMrYj0ot9jnZ+uGfmh?=
 =?us-ascii?Q?alDzIrRz9uw4LwbnFszww6xDQWW2wVsBG5t2rtw61Tdeo+NY7A7XA/aV+9pO?=
 =?us-ascii?Q?v7fFfGSuTi+YXrtZbpEGrh07N+iAIIh8T7XYwIA7VSUHCuRI+dwGTCoAPaB7?=
 =?us-ascii?Q?/f+/ieMIjSoTC/hyGN3cZPZikFpYBE4SLp3BkzETi3iA1gX/6rvPC5UMzn+q?=
 =?us-ascii?Q?+3b1z7W/QXGObKX+gzw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnYUP2x45+qWlDtAImGiOvDrGaVRnm+0WMQlv7dNJEVjiuCUQZ/LkDXaK6i1?=
 =?us-ascii?Q?nEWWBm8UR6rsNPlgqIwDNEDaUhXpTjZvifL/g34GYpk9ybAUpKAtCLZQqMRl?=
 =?us-ascii?Q?UlzdCAYX1okFIjA2Ry5hejpJPW3NamSJAfFJzks627TPLkr05Nw/sV8VdrGB?=
 =?us-ascii?Q?4AXJlIhUPjO4KAhGfnp8FOHju4+0HaQPR9vslDxmJzuMylU9xN++FRWLydti?=
 =?us-ascii?Q?pjpl1KM30vG/N2z2/DPb8q8nEx7QJiB85unO6cRHu1IyH4C8j7HL3dfeWyeq?=
 =?us-ascii?Q?8hfk4tbqFRikYcSdofN7WFEygK34oTpWfnMvApY2kaWtU8X8gFyT/vKS9tKE?=
 =?us-ascii?Q?wcmQzRjQ6Q2h16b+IPDXzLiV50qaE+GMLjVTLXwC+Qz4zm0F/mxkvjnXTCs1?=
 =?us-ascii?Q?8qdTsMFDh9ZX2eFoJ41RW9TQ5cgLYWhp1LVxSw6hrICzeJpVseV7zsjwk4+O?=
 =?us-ascii?Q?U+e3WvOClRLrso5NKJCo7OHU2v5kJlS2YccSVS/9bYxh0fflrgayRcvCvyA4?=
 =?us-ascii?Q?bI9YrlFo8piet8DuJzDZYQEMPNkne67hY+HyVkHSUnJrX0pbpVmUFHB2/OHC?=
 =?us-ascii?Q?aNnzwVSB9mol/fG7MPhS4kZTueuIBlHYqmQY+54B8xjQ5TE5JBeebZQWoZQW?=
 =?us-ascii?Q?ev3NNgJT+YI3MAQLXfCbRhqPRlNuaq3HmeHzSz4YdrB8To+lTLMnyXej2VTB?=
 =?us-ascii?Q?x7mI6gP86rxEkc+Ec3ivt/016IptLrZGnMhedi2vbfr+Sli8n+NeqL30TgvW?=
 =?us-ascii?Q?PnWFmKqIGZohIrcLgdHp7MW1SmeYbj8Wl5aFA2hDiNLzy4+tFaSw/tkAKC0V?=
 =?us-ascii?Q?W5K2fUqbCTZXsxGhiXrR57D2K6coYdJ3ylTAYcguI5zGF6dq2hZ+JV5FeELA?=
 =?us-ascii?Q?cbZRJPDIPrAsVP/uH/oEB+qdahD3+VCJTppVrLet1PIAYCuydRZsIC7LOJAh?=
 =?us-ascii?Q?q1zS8JyLfUV0bm9+sTvzrZrTKXGPaUf0rK1cwyafkRExmceZNNsDfSZKNFXD?=
 =?us-ascii?Q?QI1Qkc4T53MA5WwY/UfswJCrCRVl8BvsfXxRvtX3t18fvO8UqpD0snvC8x2I?=
 =?us-ascii?Q?ULSzDrzN526xnxZ8zOUx9iZ7bAVRQAEFNEpWDqVXpySm1+2zxWLafzB65Q6g?=
 =?us-ascii?Q?WfAhAPg+fgvSvnx4PmVob3kCFUFutAQZY334xePIIp8qYi6GwUXRfNZPvzHb?=
 =?us-ascii?Q?Owe4Inbyqp8EMYDPwefwrts+i1tjxuBq3LizLMMbL0EVbOoFJ6qSB+JzjHlL?=
 =?us-ascii?Q?QX8lcgvfaX8nbRW84AmpUbZtY3Uk0bzsvpMrcI7eqkSSanndukhrU+QLNBGJ?=
 =?us-ascii?Q?lM2eM4ycKV+cbhkeiFIETBeGnIeK4cyfXAyffP46c63ELYnvrN3S2pd9hlmE?=
 =?us-ascii?Q?Mhgxnr6xRvDV0N/Vn4Kenc3L1Maa3X/sLQ4GcEGF2cNLcFfwZKgcYv/endV5?=
 =?us-ascii?Q?qGTO4yTN1kjjKZKJ1H/V7pnGBZdZcV7wfMbBGInyASyaiqThlU4GoYGmc3ZJ?=
 =?us-ascii?Q?0p1Us5VcCWXYDUf4ADn30HFwT93QP44MpSD0dhNH4vnwgJxVlxDgOlC5g2Le?=
 =?us-ascii?Q?6RelX11+aZzRpH6DfQZhDGvGNinMEtDyd///vV6plqLhyio9Kw6QN7laG5YW?=
 =?us-ascii?Q?GzzXVSs6Ax9o2fdZG54W5gxBmnPzQhSufvJos6IOqJuKpCngzmVp7ygzVuVJ?=
 =?us-ascii?Q?5e6+NFfKFlUhgl8PQUFE4SW6MiVJQhdmquwUKTfGlBX2IF2XiCSmmYp5qG0l?=
 =?us-ascii?Q?TARdzTIi2vlVHU8p3Y2QhvIHMew9nzE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0a41c8-8373-4286-210c-08de739f3b23
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:21:26.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWsJ1tVX43H4DtigXUiikVRuebbK8SbL6aIBuQrEF4y/dvFEVXlzR6WXIAVno4oPonoDrOzgxjlIcSnfaOBPFpeU4NVDxZmUYXGcR6Uo2Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
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

Add checks to detect Xe driver devices and report that they are not
supported by intel_gpu_top, directing users to the gputop tool instead.
The man page is updated accordingly, and the tool now prints clear error
messages when Xe hardware is detected.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
	- Reword the manpage message,
	- Reorder the messages about the unsupported Xe driver.
---
 man/intel_gpu_top.rst |  2 ++
 tools/intel_gpu_top.c | 18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 20204fdcf..25196d7e5 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
 LIMITATIONS
 ===========
 
+* Xe driver devices are not supported, please use the **gputop** tool instead.
+
 * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
 
 * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index ee38829e1..10519998d 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2734,8 +2734,17 @@ int main(int argc, char **argv)
 		ret = igt_device_find_first_i915_discrete_card(&card);
 		if (!ret)
 			ret = igt_device_find_integrated_card(&card);
-		if (!ret)
+		if (!ret) {
+			struct igt_device_card xe_card;
+			
 			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
+			
+			if (igt_device_find_first_xe_discrete_card(&xe_card) ||
+			    igt_device_find_xe_integrated_card(&xe_card)) {
+				fprintf(stderr, "No i915 devices found. Detected Xe device which is not supported by intel_gpu_top.\n");
+				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+			}
+		}
 	}
 
 	if (!ret) {
@@ -2743,6 +2752,13 @@ int main(int argc, char **argv)
 		goto exit;
 	}
 
+	if (!strcmp(card.driver, "xe")) {
+		fprintf(stderr, "Xe devices are not supported by intel_gpu_top.\n");
+		fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+		ret = EXIT_FAILURE;
+		goto exit;
+	}
+
 	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
 		pmu_device = tr_pmu_name(&card);
 	else
-- 
2.52.0

