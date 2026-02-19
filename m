Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7C0E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F37410E6E8;
	Thu, 19 Feb 2026 14:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYCPXlPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A4A10E6E8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771510492; x=1803046492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y+tJBQWJCZtSe8CqAE945SSoazT0o2c9AU2mifxOlLY=;
 b=gYCPXlPBRUWImV6QOssSND3+kffhmoNHgFA27nDwDASsrTV5+yavrlIP
 nX9pX5kWbQwUViGV+iu1qLHVbKC5ZE5gDpm4Jshg3eRRmxQKJr/qmhRSL
 a5UjZMeqT2pW5YqyTEcedtTStJR7cAQUT52ITBMNn5cPSOff8wEwLlDhR
 8CIX/REf5357P1scafsIEY/G220jv/AuLbBYa4dbWEG+nScfdVHrQpLkR
 I4hhtG5+e8Wlu99HVrZp/u7oJvyzHVGT0sUExs1xnUxDuwEhoDrnaldLq
 03CeAJM13FTvNGqeZ/xKvXiPjGBDzH4wu6B7KEAEpO4BgcK4NqA8otirX g==;
X-CSE-ConnectionGUID: q/TnXFUlRp6hHK+2hBceiQ==
X-CSE-MsgGUID: Aiejkn8qR8qUqsZY+9D2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72299384"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72299384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:52 -0800
X-CSE-ConnectionGUID: ROcOzRWpSsebvHiQ9r8RBQ==
X-CSE-MsgGUID: CWrTb2m7TNG5NpTDKTZ7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="237515767"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 06:14:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t33L63opBW+PBGjl/C3YvQ1FUNJbcNRTNVdBbuRnv/9n9d6J4dkxHE68KPbozuyMH1mKsdsfPtdEMLdSG2Xq7zsNrgBfKlAvits8tkCZ59DbUiaFJhIKJe6NRMiE+5FrPVjAmVjVX7CRJ5bnP7B6Tt8M2katpWr1W18GzaU2QvP07x+OEvgXlwukVAxj6+OWRINOx8jxGpDv4Y7XYjBoJH7BjUyqn2dQQ47d4UqLLy05n79w57Fs21rWHQWy+EC1f++PF/pyZ5hCXdAy3DvInAt0JAeR1WR7TBTskpWctcqYugXgC2GYcpRP2zTdDSWLFWu/kynhdV1Ke0jzeWFYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWalhIX7DleCecBM1wigobBot8dooozgZM5wKZBgn2Q=;
 b=GTqFBWnFm63q/MIsZs1NLPklZUihsKwXBLj19MOPymuCs3O7bifR9SUMtGJj5bS/duuurAiTVBM4GwlyN2EOuVXbw1mrJgpywR3wDzRWpaZcPiyYWDqYyejydEM2c9aw4N+kfQ2X87sVb5cYmJrMeqblVJUJF7RRNmt5ZhRbWxqbAWphURBXr6qJGAXguPpjShsl+td4aVDMYZT24uuxQGKPMGVxx1r6qqEomxkvHO5d43CuWRNeJAsJY/MqnyRvx/cgi7lNVPeU18IGAYv1DQNxm0pG3EDoZINtpJnhOaA9Tbwgm2VjpKoUm9UE4H4zaw2VZ8UwtlDKrjbszGukbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:14:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:14:49 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v3 i-g-t 3/4] lib/meson: build core sources as per-file static
 libs with minimal deps
Date: Thu, 19 Feb 2026 15:14:52 +0100
Message-ID: <19bc8c20025f7c02677653f068f8c26f87c6bcd8.1771510028.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771510028.git.sebastian.brzezinka@intel.com>
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 05db3ddf-2732-4791-2ffc-08de6fc13ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NwDLB2cB8GVbe8YGUpFve4pX2gbmVqGfPKh1z0inws2ByvQwqNyXsVlXCtjZ?=
 =?us-ascii?Q?1IhrSJDeAMYYRThm0LIMEUzqeAsPJJYj5iIiTWG8/u/yHX3DYHbSuU3Tq3Co?=
 =?us-ascii?Q?CO9GlFyMrxP5ZcwZ3AxH7mMWAPYXagnrjWGNrpnHPDAkrsokmOQW3iX2/Dmu?=
 =?us-ascii?Q?n8hmXLa9g0qwE9VCCDFRAgQxGZD1qICLUaTvwMZXNjedBoj80yrQ/OV5fJRg?=
 =?us-ascii?Q?U6JqEqHwq7B0yuTxf53X0etRC8JE9TjKdXrIYLzDaUer7iKqA6wSRSHCEzv9?=
 =?us-ascii?Q?+e7DuU16BPLcJrsGD1eDu7/HMzxgYoXM7xr++U9mHmt4oqh3jH2uA57Xe/zG?=
 =?us-ascii?Q?YaWy0HA8GBTPBfLVQ+91D/Np9PkBhtIsPwh5sBsEBCiEqG8x2qoVMg5+iepx?=
 =?us-ascii?Q?/POwjsHX+7QiO1oKarZ9pAKxMULpdnYVo81dW8lSi5XYbr+r8ic+xG9hahCz?=
 =?us-ascii?Q?h29XJPK6bQtIqvs/WZKtWcDZjM5/zO10NCQqvBfUvxd086JDcdMS9xtRHi7R?=
 =?us-ascii?Q?bA8DlataV34m+hDcgwlLwxmNEdeKuRd0G6Kz4QgRZb0gI5SgDN4V2+r1+o0Z?=
 =?us-ascii?Q?f/e+y9FwK0D7mrFnvaHo0M7vVQaJzTGExUzfwU+MJGdV5EW6G8EPg6fpcTEJ?=
 =?us-ascii?Q?tuoyl56rWfR6CF1JOWXfElfFadVz7ZzGaytW8jU6saYcVCDaG+3CRb/VzKwN?=
 =?us-ascii?Q?O91floXixoNvah/vWHdPoFIQPlRJaRN9BdeaDye/hkrLUCcmhL20MPTTun+7?=
 =?us-ascii?Q?fwEux5ATUPIiHENbktjBIwEejL/vnb1TXlqxwJp9WDQTw4Z/5eiK7fDBMMv4?=
 =?us-ascii?Q?KXOd5NXGm5R6fq3Ob55VDMuiZoFz3Og6xoBZJbfO9o3ZmEa7d2SQcGGoWtTQ?=
 =?us-ascii?Q?4FyFAusPcVaWXz/MqJVlYr9ul/fqZXHWa/PS21ETQPl7psGJ1IOzWPzLNOHX?=
 =?us-ascii?Q?Fs15BTLBHwfoZD1spWVXI632kdszT3jSnfPI0rBM+71eVociy25E2BtUY8t5?=
 =?us-ascii?Q?+XH/hI9NQPiYJmY5FoW6UEp/QBjKOXoqNfOjkxPki3jgjoaQMIatVJJZE+Rb?=
 =?us-ascii?Q?BlXIrMLRO7Povj+PGWFn2K1hmNpd1ZJYsWT5W96uhhLmETg2lv+lPJFuRhT9?=
 =?us-ascii?Q?wBDN+4ChRtVADNlxhN4rGYLG2X/fDgDU4QIuXWbNKVstY2ZxP7Y7cfi2l9Vd?=
 =?us-ascii?Q?OdepeqUW/x4HuQFTAI7+lMnaFj2dFPnHQEebfznsTaWE6ZnqVH4MDEC2imaq?=
 =?us-ascii?Q?7tUvsKGtihDalVPt8z+pzKyJpqiYwV0msc1q83jNQA6miR4UxcAzVnF63N+s?=
 =?us-ascii?Q?wKeO+wxp7oseLvd4zs4LoB0l7Rew5LBvDPFzgEjj/LqgXrj3Ajm4vUxLRv+s?=
 =?us-ascii?Q?mZl+0m2QqA8iRMdnHEsKYlixfzJsB7JQdPADi9pKQxFsaj2zNmPA4DLJM0A/?=
 =?us-ascii?Q?OKbaIhspna83hgsAx+uJli8vyzTiXUpJLeRckEDDFtdE8Ye0FK5DFe87KKC6?=
 =?us-ascii?Q?Sjdq3Nic3Ez1MfiD0U4FK9AcywFo1qwYizQIOhEp92vlaaTMlBoU+RzxK3wd?=
 =?us-ascii?Q?+Qvlpa5f3Ysz4MaWxS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OFSMR4RtVyHPKA4aw6QXByTpNgvE2gQL3OAAeBnrmonNBr+qT2PGUxdfqpWh?=
 =?us-ascii?Q?sIbUuJbJIWddD515LLOtb+xO+TLrbRNFOTfbVbNAyKNxWpTahzRcOqFe2nSO?=
 =?us-ascii?Q?Ha1NzDjBIwZ+ag2PUW7rS2rtrKvPx59S6tSAIPR9qTMh73euBNy5R/2mDBWk?=
 =?us-ascii?Q?wbEv/mJCzDDfbG7VvE6lXM/JUTdZiaQyniQw3/xN84wRzpnrUT7AunXGQ6Pf?=
 =?us-ascii?Q?Yp3KF2f6+brCw68mbcxLIK//l9LXUdzV87xVB3hRevsEKR7HjicOsRg81tY5?=
 =?us-ascii?Q?nfsXxQmsXkf8W/t9/QRLNbCfvr/YLWTs/KBIY5cPXusIzAmyITRCjaXXQXhZ?=
 =?us-ascii?Q?WWAWvbbE8dmYMtXq4l5JuxZAhALeCIgKj2EBld61x7gX/7GHEAFZepr8BiGb?=
 =?us-ascii?Q?8b0AnY2vOJEmsViX6ua9L60gA+u4CcAa+2Zuzg0SczE7xkPrrGgkLKZe1qck?=
 =?us-ascii?Q?J5SUh31fcQND4qxkwrI/RGv6zuete9BI2JF9SQ62scT6jYOf+1JyBnkKNdWo?=
 =?us-ascii?Q?h3Il1cxixN73mS1UItE4n72AhjUvugMCpKWc1ijU+cAq9TM1c/1RtLjzA0gz?=
 =?us-ascii?Q?fd/0ErxhXH00c8ojETNOKHJBhXOSokT0op+VavKKMDpVRb13d3hWnZT635XK?=
 =?us-ascii?Q?nIjYblBqggRPlgq/6an8Z/kC30Xxw7WJ2lB1yagYG3Y9C8liz6CvdduuJGh5?=
 =?us-ascii?Q?vNOj03b0qr35alXmX8kA6kIpvIgxTir+Mvxj2veKFmQYrcM+inTs6xcxfPmA?=
 =?us-ascii?Q?UeAxRJ6+4OCHDS2ZX0OyATqjAKEP0MVcjhPvlMYyPO1/hIacVLuygvnn6paD?=
 =?us-ascii?Q?8Cb6pZ2DddC39j/xYPOwznq7nQXi8Bm8p/zfwCQ3n34eRQT2zy+y3c0dqpmo?=
 =?us-ascii?Q?pm9X75gjlMLy/LjHfJ8/uuVy8GIVdSToww/rWzNiapa8aI2kXJ8QWMNdA5Ci?=
 =?us-ascii?Q?XjPIblu2VIlF9/FgNA+BeBagfBEke7kECkh6YmeuWG8zrRl3u9vjc6ISOvxV?=
 =?us-ascii?Q?FpIwt39JwaaNmeRZ1jonsZ6BUtRh6cTFuNKiALQc21EDDY0puN8gfFqMj77v?=
 =?us-ascii?Q?z0zicLo2DvOUntLYJpamoOw+pedrC+HsOvrelDuZv3DaxK98zqU+pZJEAefi?=
 =?us-ascii?Q?qfv5aO4CMOVa0LIw50xtyDlGu3huTgErT3eopRaTn0mEnuCfy7Po0KfYOCre?=
 =?us-ascii?Q?6HY0Wp7yibcJ4NyMxCDhFkr0iGpuO7cEn3hD7j5WNsIMibkHGUkc9TZ3mURQ?=
 =?us-ascii?Q?1YH4MXjGi2NJy5fBPuvvVJXAfZtqPN2bV9q3AwcFTRDf4KTGElpEOCso7ms0?=
 =?us-ascii?Q?/hDPA5v4MVHj/7bo9C4Qaarw3AIIWH898B4b+rNHXFL8BJhLlDQfxk6FwgUh?=
 =?us-ascii?Q?nfyRo7rbXols2mtvOkMb5S26/gwI/HVjMH90yaatrvFwVrDqoQpXDbYEhcsr?=
 =?us-ascii?Q?Cgeh25p0IWR0w3b/hl+F8LUvZRCPCe8360hDLhXsE+zKKdAAI8P42pgz8HNj?=
 =?us-ascii?Q?qgS/Eg6EgygfQkf/1NeaFivqtWe9GLJpuxEl1hGCER7dKSMBlKbMIJslz0aO?=
 =?us-ascii?Q?6SKyX5YxThLQkwjA/2g51ammyiipVPNGl17B+ki1/kS5RHOUr1pTsshkvjHd?=
 =?us-ascii?Q?QvRFwQWKyXBF5MkDo3Q/1/anbCBMhUGwM/xoM/ZYStRZi5T50E5+wOvV57vN?=
 =?us-ascii?Q?agWYs7TyCkwMahlqu/gppnDaI+4b05xYTPvo2ajoaczv9Mrl9krUpfu31mqQ?=
 =?us-ascii?Q?jFK2eym5HHpqv/FEYmkpoAKsrKeTuww=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05db3ddf-2732-4791-2ffc-08de6fc13ddd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:14:49.2532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C2tFG0MIWA1guMyMIPsEwokJN8PkoXn3BoXbJMQpsm2KYID6zSExVRIzzElxzf7M3d0gwT7RZYl7rDhyHDr+aOxOOQ1tZuQlI1F8Ns3veA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

Introduce a new lib_core_sources list to isolate low-level/common code
(basic data structures, device scanning/info, and basic utilities) and
build each file as a small static library.

These per-file static libs are linked via a new declare_dependency()
(lib_core_igt) and use a minimal dependency set (glib, libudev,
pciaccess).

This improves modularity and keeps core components lightweight.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index ea721ecf7..077517df0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -151,6 +151,27 @@ lib_deps = [
 	zlib
 ]
 
+lib_core_sources = [
+       # Basic data structures (no dependencies)
+       'igt_list.c',
+       'igt_map.c',
+
+	# Device scanning and info (minimal deps: udev, pci)
+       'igt_device_scan.c',
+       'intel_chipset.c',
+       'intel_device_info.c',
+       'intel_cmds_info.c',
+
+	# Basic utilities
+       'igt_tools_stub.c',
+]
+
+lib_core_deps = [
+	glib,
+	libudev,
+	pciaccess,
+]
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
@@ -286,6 +307,27 @@ foreach f: iga64_assembly_sources
 	)
 endforeach
 
+
+lib_core = []
+foreach f: lib_core_sources
+    name = f.underscorify()
+    lib = static_library('igt-core' + name,
+	[ f, lib_version ],
+	include_directories: inc,
+	dependencies : lib_core_deps,
+	c_args : [
+	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
+	])
+    lib_core += lib
+endforeach
+
+lib_core_igt = declare_dependency(link_with : lib_core,
+			    include_directories : inc,
+			    dependencies : lib_core_deps)
+
 lib_intermediates = []
 foreach f: lib_sources
     name = f.underscorify()
-- 
2.52.0

