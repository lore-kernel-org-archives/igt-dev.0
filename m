Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DDCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EE510EE25;
	Wed, 24 Jun 2026 08:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bu2TybOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A37B10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290884; x=1813826884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LFMzKqn5Gz3PceEueyUZvlAZaBPpxWPnAGTxWQtvSvU=;
 b=Bu2TybOA6usMzIOo5uNlKWFbCCt8+f2CJEMAJzNyeDLmE/jsmmUNO7fz
 Jj0bwcax93jt5sXRa+XDc8i4ZcMrlVYoti1z8HRmjVpkQb5Aw706+6IZ3
 mbnMEdMcPjXzhhVWQMWBqeyU7rGxgAecH+DBOrO1oP4GdjV1cu31nZ7xF
 RrHweqNEw2MGNxiTB7KF5JpNRx5LbLCWSkt2Kyn6uB4s2smMuowOx43tn
 5vUpZ9LDNgai04hmXT5pobIvztEmOtJ5M7QMPW8kfm1QKg2OOaE74IV9e
 SeBgzgVDMI4Jck9hwiDczFbc7ZEeFWIIEG+XRl89AwwxGDAaZgqhjaNtt g==;
X-CSE-ConnectionGUID: qDBqw9exTx+oivJ+OGZ7pA==
X-CSE-MsgGUID: 2g1/mD4pQSq1+WOXlYUsxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142299"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:03 -0700
X-CSE-ConnectionGUID: /InqvexYS6qULTs73tS28Q==
X-CSE-MsgGUID: 2sU3czytSxCFLWz0P7ZZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432197"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fN1Or0thv4Zz1N/7zfOIr+d1k66++TJZ4pjUd2a34PfKRm4nccrZ+rLBLaH2KPPIjiPzZ1ri4gPdqxWveZvrHN4by4+/UOvUqgsPQ0c1kt5ePOWpASBBb42AFQjOj9XqikpRmGcCiFxpg7uyFpvVI6D2OXomc9LWmmwwpFIDs0vJGN8QSO0cakDgkP5zuM4wLngRbRoKlaHlvPdv5lixngacbB1yyjzUii53yKnADBCknS3cGfYpr1u/9hzkUrWe2ekh4vAeJQxcXBzMzsq0IzFtr0t61PrvzcgEXyG7KU8G2mkmxEhUN6B7hQLFr2sQhZuwAa91zDwOHr5S/LgPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2LSsRKg5oVlZnMhQ50aFdtxzRzrAQLsSpUrDLmcEQA=;
 b=GgGu2+QXuvmefWh51OfegRZVYLCstgS1L2UJYRBWRTl6CjyS/QYOJ9Ougw8Xh8UUzggFU4j4rJQh+1cOqsrw/LltzTGePgyUfku93F0TitRJlpWI0iU6CTUwLpPJ8nIyajNhu/iFtqWx0oFCtjkNOVCmIOCDohW5p2crm3mipu5+v2Sch7wV7+RlmvFEYD+W8M3qPyWrwMdxs8ED82jcdOnji2gEFR+3T2OEwe82lGsWu6i7taAhC5qJL66BsEuuXpTnsKCnjEWUorB2bw8w/p8q5dO8AToK44AglQZSMJOFDi3qtREBpzyxyz+uAqN7bHrljrDATS5qTrZh/o+GgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:47:59 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:59 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 18/25] tools: intel_forcewaked: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:25 +0200
Message-ID: <7ba117ad27fa1b8732db43a268b6eb2827295675.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 322d8aa3-76f1-4caa-5758-08ded1cd4ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qQCVhM6GUkSujN95DhICmkcYIzm6ffrlD7s3EspZ5xjnFis3fM5jdOa6x+v2fZsiHiEaKbYwfaiGGKtPAOZ/2gpDlrENGjsJEoFNH/3kdtbEVd0fjDZfPIY/8TEYYv+R0y0qvM6aomA/GLd2rjhfPdaBJI/dehF6t+Eb9TSgeJQ4PrJv8K/Dj22e2ZNmJmhv4D5ZmUZqQrBTZcHydw1I8V0DXZxaioJgoO4nD0EmZpy+1gFFUPSQX9+hU+LnEHfKoug8LUNGj09wE3HboiXAVdlIgKnwknHd3MPUyQFP0a+cSeScv10Pow7EWuZ8pKgF5PIDz/u9I93mtVHZoIyqWu2jfHwEaa4tAfM6n5wBXi490q3EZ38bjauMBRPaXptDI/cHJmjINMuEcONKGTfBnSpMuyfxYzfMiT4+D/2Xj62QKj83ehvPjSPJ7PVPOn+Rn6URsxbi8SRv45Y52a4k6VYIy7Bb6Cm2zQ85Jl1cx5juki1gOho7MTzdrcKyfuUDGyD3RMXZU3rAKtQaqz4+FoSe7vvMi3edxgtWddv5hTuSJsFx8QppZeIZ+LMPbmLgxb2qDYQ2rJAD+yxyrt7ffvjMi80m7Yl9gucOc75wfUFvZJazCOU1IrGMs08qBEtvhyyx/gPVI/BnpDJR/rryj7yo/U2mLl3m9HtCf5s9rYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYFDHWumGVu0kob+v0n/MzIkUcex1PP5mE9uMlPHEi05ZJzPoX21qSLZKwBd?=
 =?us-ascii?Q?kpqrQziscYTCoy088HBZIh1OyubiO6+9q9O5RVaq5W6egAi8tVnQIVE/UOme?=
 =?us-ascii?Q?5pXLgSsQW2bc12/YkY8++YSzTKWYtebZyYInTD+xd5xgY5rypGjjcEfdgxsS?=
 =?us-ascii?Q?GPCHdwXpjKJQLEcRiyapeiXWgDPSrCG7y21cl3FgmzlBXhCrBVwh4RVuHOXp?=
 =?us-ascii?Q?mOwOOd243V6K9XjbpOPInW0hryzBLTwSf8G7IrZDsAI84r5cE5k4xyTt1qrd?=
 =?us-ascii?Q?X9vshvTlpUqA4i+htG4lgDj/Uh/pvYjFKq1snhyAmj3S0w/FvamPUOJd7nJ/?=
 =?us-ascii?Q?dn+ZBOdGKghtzcqaOzZJV0Oxfql/bVlwBf8G56YRF5eN/dB11h8Ys+Nd2ZST?=
 =?us-ascii?Q?pbMVTgOe6Gt0jE2sUO9FdRrlkq3spYO6rh6W5CoiW+EjL4ZoES/tLkdBnl8Y?=
 =?us-ascii?Q?v1HG18Su3o8qy6oB3fiBaEaGIDnZuUMhZGgVHHWiMvvL6jT28IQ6eSs9bETB?=
 =?us-ascii?Q?weA779rTC/8a+Iz4Jn2oW0JRLKxY7XNhSvH2Q2nBloxGy9fenVzhLVPEdXv1?=
 =?us-ascii?Q?ZDFm4keDvnHqyppruxSS6l3m9+IyY7mAX3pXnzoRV+DgXMKesD2/laXBNZww?=
 =?us-ascii?Q?8NaFXnA2DPaf9oQNBuhK1dyPkTMXa+tNjGl3KTrwONipOmt9SI8wkFu+i/y/?=
 =?us-ascii?Q?72LlvX7FZF7D4KFHYjYF6GrocoJn58Dcsemj5OoDALxnXppClQJ3ALu42S6t?=
 =?us-ascii?Q?HmBqf1Syhz8se7Wvlg2VAn+Px+0nql0LR95wAwpkRNuwJ5TxV3G0s/PrH0D/?=
 =?us-ascii?Q?WNWqB1MwQoHWgH7yh6lYaSSp5aR1gso+DL9vlc+AwTjwimPeZBPtJSAvPxOl?=
 =?us-ascii?Q?rRQ6OnBffmvDJO2UQTJLuF7VIbmLvgWpLQqbcEteDl0MGbUn39+PBePM+p0K?=
 =?us-ascii?Q?+R2MzcVFc+9JtI7zNgj0GT2EcRLgOijXJldAZ6/KqmkleXfgEyA9/054LqfO?=
 =?us-ascii?Q?kXgGcw7HmGBTQOCdb3SfKhtj9ZfYgbewtltogGYRZ6q9N3do/ICUk+hWhK8a?=
 =?us-ascii?Q?b/n9ElxQQwVj6ITsmmbneWQjmBzd2u3TaMZkXt7icMacu9339BsrA7UB8frA?=
 =?us-ascii?Q?KOsz3IF4TvBW8l7eRP7ny4dr0aylGh9MYgjBwbYdivOnv8QjA2BzOInzxk00?=
 =?us-ascii?Q?FipdotedzuEH6yMS2vbRaWfKpLeZNIZFQtIAFiSW7P1bCueH/PeMT+prtO0W?=
 =?us-ascii?Q?K6l1DSRPIVJdv2gmvVtGGwSUQQKh3E4Bg83rtD+qIGJV345n1USvBpA9iCcK?=
 =?us-ascii?Q?K34Mx0Awf7uN4uN9DR/IhV0lJdZw/4jqtIHU+hjioKWCF15EYhqB5HXBxwr3?=
 =?us-ascii?Q?/MJgzvzlSmM/dOm1HDUG+rigH5NEAjmA0JqfftyY2oMx1YxyY+JqMCFvh6HI?=
 =?us-ascii?Q?OF4VJOUMjBFDXskmC6QHjshenE0FboR5hSXDGi8rbJWBDQNhEL0BB92m6Pkt?=
 =?us-ascii?Q?aCFSjFNfn+3tjqIr8+/FzZMQGSXx0Po3Qrv3AI+yrn/VV1+i4fNXBQ2GD1hK?=
 =?us-ascii?Q?yJjlc1d2cfHnJk/yB8PHj9C64dpCCho8yCP/h6/esfJQUMYivuqIZwe27TUq?=
 =?us-ascii?Q?8duwieNn3A19Z2bNjlExkd6/pL7xe3OnIkwO0QqalWRodKIczjyFPxndMvv+?=
 =?us-ascii?Q?N7sMmC9+2EC0DWbbcCHeccOQQXbpwcuaCcAIP5/vbCm68L82q7gFFxSsxmBx?=
 =?us-ascii?Q?0EiDYuJa9My8BF2SLyu6swYuGdDkJwY=3D?=
X-Exchange-RoutingPolicyChecked: KdpycdY1yGubovyp2KI/+/HtbozqZ4gyB4VecwQAtgtJSQcvH7Nj3g2TF1Un4gOnlfc0oG0NAc6U8GuCS5itJSWx6ZayPuSlr0/QzNotX2qdVSgq71Wykg31L0Av4JUoo0ZmrMICAcDZGww5HSMUEa3cfyI25K3aZ8FXWjikMZ0DMClqSQgD3FZRcoZ6wv6+oMRT9H7EPQtMgxxWCVZOpoxwCR2I4ppEWAPNywGPCX0OrgpuHeWZ87xo+VDzJjx+UjysRobvTv+vBIfP8Fgh1B5NupffBuKmdSpf5N8Xm9HMf34vmW0Mem10yvhCVaCU7N7YTriu7eVnLl4FyolQfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 322d8aa3-76f1-4caa-5758-08ded1cd4ada
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:59.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqVcD/j3RL7orH3P7mMAnpmRYVr/7+w8g+OissPKYj05lcGbmvoEIruC9TtT+WvV+nTajBEQEgrot8zmskvv7iir+I46wxpLWIRTKfWSBSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

intel_forcewaked only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index f9bbb41a9..15bd40dec 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -18,7 +18,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_guc_logger',
 	'intel_hdcp',
@@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_forcewaked', 'intel_forcewaked.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

