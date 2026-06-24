Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346DCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2540210EE25;
	Wed, 24 Jun 2026 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S50hfVbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3510E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290851; x=1813826851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BKgVxdxwMRCQ6u5wFVIGOExgxmb2sk7hX4A+yMP+Y4g=;
 b=S50hfVbl/PL3Y3NAXDMgIsgdl6Yd43cdR5UCSR1Odwy3/SyOhDgHJMQ3
 /WcVXfRR6VbMlP/gOM7mxN3jDMt6hjcJnjoXxH1K3w3kRUmYGx1SyClDJ
 dGbzWcI0fi64gblimWEHGee4a3CXrGibRQz/Te5vkC76b5XHLNWLrndDy
 /f8OpcPdXX4xGh9+DDfIxpupGAuxqWpDxvBeR2S3be1UXHEa0W0NQQiaR
 uFDOatfAqK9TCBUsXNZDhJV/a3ZYuALWaNmJnkbZgN5IWdFGgMamGZUK/
 JBQOH2dFSSLdoHxEyoP2hH169q0MoDkfAWqMtUJxlF496CdBwqVA3j8k6 w==;
X-CSE-ConnectionGUID: QDO1K5GpQdSaV8siz6yPGQ==
X-CSE-MsgGUID: S9lm7ROtSBmVAo8dy6StIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93405028"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93405028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:31 -0700
X-CSE-ConnectionGUID: VUzhqK5uSySNhyZncZ/CQA==
X-CSE-MsgGUID: ijKZ7JoZS5iJ7pfXCg+TTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="287899855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDhOkX183/jc10FKbUNA79SrxKa7bd0VXTBUpwsUvUjDw5dQKbrDPLJ1TYVgy37TJhgNEC/Ioub83Sha1SWlv1t5E4Ss2AGauUehwoJPJJ+8xLJlqH9HSyHltAUdqec9ykDms4GATH9KVk3whbb+aON8E8abeggrT18kOXSbxBaE9tjlvkqXDyJMUKWUZs//SpH7kZDgIWOhKyh1aPVB0e/F/0+ID4NCX5PTWCl3VBqp7GsTV1fWNgVr3yOFhoaO6ZxSuLOOYYYzwtyIYFBCtkpURfFHCf+1vpu9iZhMlkZ19WDBEQNdZPbDapn8GAhv5oZSEeDHp/R74lsliUQcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opCTgbX6b8Qms6rzIHg53+dNTMdZAcbK1y8yJTjBGf4=;
 b=efqoaTw5XVG4NIER0sf6XX6C+YNSAvW3iu5OO5qNd7C5BfGbW03LVHCn4JYsouEbLqV7DVjfnJUayXLffJBnA00Eb+euKRs00i6ImyxMDRqxnnT0hvhYM8da8Ud6tVxvjsRuq7TPSdg/MuSZMK9vzj28bf+CJt89K+cbHn2bj++5teoeKWKO+myCloo69mzCyXyQSTPYZxYJKO1CuAlCb58mkdG/6TgRUztDIHys7TdmW3LGQTOu2T21fZ2aeKp8qd6B0lSS4lvlAQAwN8eJCA9G7Vunl48RbDC/JCgZViljKn1cf3SgyoTCrCJcvOpKTpPwxXB+GAE+xpYb1fQ6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:27 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:27 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 05/25] lib: introduce lib_igt_halffloat static
 sub-library for tools
Date: Wed, 24 Jun 2026 10:47:12 +0200
Message-ID: <8d3553e1b2c92b82be184c472c5b80da6081df23.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ffc68e-b671-40da-8488-08ded1cd382b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Uiv4Gn3Vq07sXkEKRCSBYx1aVrNp1ZxUjicxwOSOD6VrwgD8MG4UaRZe5uuy73llh0EDh3Zsb4K6RJNsr4OPhtIUdtmJARd/aeKcBuuPvKt7D3a3e/Xbzafm4YSkO2qG3F1t3LSAmm5ZBaGAGrStFjez6exxwL/I82trX0mrc65IFdu13YtBPrTE08jcnach0Q5Fpvh5enhQxP5hB44B1SvHZIEGYBK5B8evnXeV/oP6SWGoPDok2aCT4ciNebPr6quXDhzYYfhA9BXfEbWYlsShG1Ae2JRUa0chdbo60aSuTdb7w8oKUmC96eht1kyB1pI1aSgY8uwJfFelzfLeNMShnf1poc/TWjsqJsF5WdHvR92SJP/Dl1SbUtW/SDKyOrpJt/0m0MsCcrqSSBOQr1hVLr5dtYEnCdw3VVRzUkPUZCD0mzWasu2rSp1bYu9g06j1N7TjFdFt47qH/zDGYZNP+fBPM3VY0ZHma0q6U43+EoxCqEnyqJaECc6Piinz/uWuUmx4tTvBKERumcWB/N40dRt1WbHBkDK/n8J6E6skYoRFK2B/Wcn5v0vMiH+BiKO7qNawGzY8zdkgBTS7bnqv/q4IGv4IkHt1vZbKFrD8S9dAiZC6p6WdFyEjBtJ1qd2rbp5KkZ2g3Ti74brZ9T34w9R63mDVZumgCE+w5Pw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/mbpXS7dj8qgVBx0VwuGynxsZuocv8OG0tI6uI0KHFZ7WF/PXGiu8LlGwv+?=
 =?us-ascii?Q?9WaZRv/ER7Jd948j3AqCSQDopUh0QAQfbiSnsAYzjFVTHKLox7BqAyEb8UR8?=
 =?us-ascii?Q?W6gAPoE1SrElVd1F3FFBvs+gRJMwZo+ZgM5OZ8/S4rTAb+6/dJUOkoZaDtw3?=
 =?us-ascii?Q?BGKctmTAPhJNKLsNk5pgS5SNfkyVHp9uSMzneG65GxR1qTpRf99WUXgmUx+d?=
 =?us-ascii?Q?vF/xYj42wOE00VtllLlSuFQeAnmVkh7JzF4ob1TTlO13zG5QR+DcOOYYrUCg?=
 =?us-ascii?Q?oY1pFepHxpADv184IqnHkUPzlEVn1k7m5Jpxl3KAxmMr+2ZWM8krdb9Uz01t?=
 =?us-ascii?Q?t62TsMwVma1vT1s09MO0AT7o/ALcIDvQwOOWa8k/i7F0UDFVdfbxavczCbNL?=
 =?us-ascii?Q?ENmc9GvS50b/ngXPxTOqYrgN7wq2nyc5dIshdq9yoyRGJIilur6Au37vw6ri?=
 =?us-ascii?Q?ccjMFsl/k/hBt8cSLlfSR6piem/mptxJOAFWGV1hN+/v6mprwp71GgENTJre?=
 =?us-ascii?Q?f42I8V2e5tpqOo+aF0ytH+25kST4YVlOl7r4dbbFzeRu1U5h/6eSfkxPjnnF?=
 =?us-ascii?Q?VMSh41l3iGE1BP6CE5tBMYPj3VLijMoYIxqhsskBweUMF9y3IdGxBiJH4yT4?=
 =?us-ascii?Q?3kahgBhc+8nbH/e1e8oukqiOAQ3XYc+MvNn1M65ZEUtpsTjtJzAeX4Ui9WVj?=
 =?us-ascii?Q?/gvKObs4BWrUnXlJkSHvEllM6u9eLEZCLuC43zaTAneYx55DqraDJpG9plvE?=
 =?us-ascii?Q?Zua33BDUXWzEd/QPrzkg07Q3csXC3qy0iAdu/+QMwCE1nmMnMM5C7h5vq1pq?=
 =?us-ascii?Q?5JMn3zngmrN91Hs5fxEgfJuyd7ER5oqMOFYFLcu16udICPQQI7MeuCB6s3GQ?=
 =?us-ascii?Q?boM71Mz08x7uIwGLg7fQyDbZzgTp7YfNemV+mzTKEtIOg8luTVMhCWTy9aPC?=
 =?us-ascii?Q?61BpuLQVtgr4A02pZknPk8km1BbXk06tGinz1UzLY8EAIy7W7dfGzb+kD+Dr?=
 =?us-ascii?Q?9hqsfaoUH7kEkYW/V6tICLTcS+B8jpLv+AwitSv6HKKIUWopFv/hJc6bsEBA?=
 =?us-ascii?Q?WU7mkRUGnM8dKcs1Nmxtcm/A7IkUeMyFVujn5Es+k51I1JzwRKoIvLT0dbmA?=
 =?us-ascii?Q?HOoGDcCCLUSbeSG+rPLvHUfz1nAIaaO6g5ESjn3CiXsOXWVqwyRXw2ZURd8P?=
 =?us-ascii?Q?EnxxZrTaGeaLg9HVOw1sZEZUodqsExnm0XxzN17On5e346bEIHyvlCHKvwlz?=
 =?us-ascii?Q?P/gNFMPN7eptyPniNhQSF2G9yBHf8Z/cMhWQ6/eXeRXpI6yOhLsIQ8dXrv/5?=
 =?us-ascii?Q?MU+h4JxcUXxBqPoRwsoB4AdFNuYHZjb3JU9tcyib5A2N26tKU0hVYEVTKvBW?=
 =?us-ascii?Q?7Krhw1IqLlA2YPL3ktXi5k9rOrSJVRa+xjx2JT5bGa5KDS3uYddyYbCRIwGj?=
 =?us-ascii?Q?Ui8vEl6QflMdbpapUL4NnONiM3+JW4MibVyO5iuUQavKczBXzqN15ivnN14T?=
 =?us-ascii?Q?A5oEL/DAqQ0luuJzhW3kTICrVgL28elnp5YDNBFt2wJnLfu8mhbYov94qdcd?=
 =?us-ascii?Q?gWmT2hsSZ4/FShpoMLBtji6YZpyWbESCNjS2jJnj5LNNH5/N57x0PuqY2O5q?=
 =?us-ascii?Q?fyX+sR4/bTtVXWAb6YEpAX4VlXYE5M85TIPn0iqXIuJjsy82K+pFHP5eOdjD?=
 =?us-ascii?Q?vh8QfVhXOcWAmQ5zWkQjY6XJgzpelmCfb4ce6D3XAbOutWgHJDWqjFUvBZrf?=
 =?us-ascii?Q?IYyT5Q8JVlgjzm0vR09a3a7PbH/XvpM=3D?=
X-Exchange-RoutingPolicyChecked: TEo/Xq0oAlRavUtfwisqaMENcO7fVHOqDwKS9UDsQRoqUkv6WMGfo5qwcjsDIB3zPFcxlJss6AeVjZPIT6mWP4/YnOLVyY0njiysIdTAv5nyuJ5U57lM5aywuRUh0BSm9QccQ5q8DIUUlwD4xZDB3mBY7Ko9aeXZhTgPSbztuaa9zKGlLeIJv2oJ790ICSHBU9367EZCUlkIxNMQ6+RZHTPEb7enT0WM2DgVDIypaZKAx88NUiOJvxC3Ya/dYDH9zEn56YeWRg973obGJ5WoKDxNjuk6gh4H3mE4NWgROA9cxCuY+l6a6XM4zmj1v9iaJESGmHppUFMd2mH+RYxoxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ffc68e-b671-40da-8488-08ded1cd382b
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:27.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB84j9iO59agv+ev/LM38vshTv9fZEPTvZEPB4Ft7yZQwEJEAuCIqCzGzfoMFVDrpx4cREgphlySeDmptEaLsGi1KB77EvoJYRn4ENHzjYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

Add lib_igt_halffloat backed by igt_halffloat.c with a math dependency.
Tools that use half-float conversion (e.g. intel_vbt_decode) can link
this minimal library instead of the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 0fcbee230..299acae7f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -414,6 +414,14 @@ lib_igt_stats_build = static_library('igt_stats_tools',
 lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
 				   include_directories : inc)
 
+lib_igt_halffloat_build = static_library('igt_halffloat',
+	['igt_halffloat.c'],
+	include_directories : inc)
+
+lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
+				       dependencies : [math],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

