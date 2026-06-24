Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F00BCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA09810EE1B;
	Wed, 24 Jun 2026 08:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGRp8Pdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B27F10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290860; x=1813826860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h/VuOgFoGx2xX7GZfxM1jeEjBvPIZrSIDKIpEMGF9Lc=;
 b=kGRp8PdbJfPalqbvxwasoafitdNHAw98aXitG4ZEFmIS+GIqHYpfRrfo
 t5IWsTXTFfiUbSTJ1qd6ojM1x8llv85YstDNVqGLqSN8nz0X7xr5DXoHt
 4vam6/Se+/XGwfxv3TXVq+kaG6MtmO0BDGRR2RcVo2fwyMsXUDJLvcF5Q
 1ii4R78kzRV+Tp/5ibfdSpyp6Q7RKdcaxKIBkV5whoLAnCjVcg5RnY6fr
 XA0pYdSlQPuMCNd+wcwAqG1XN4piNHHtf5Qh9Jtxlp85LISpsE80YAzlv
 gZ/HF97gHMtjmBBe9EOmzGsTI/EhVaUDtgNPI//SoUqB/boMb2ZV1fFpd w==;
X-CSE-ConnectionGUID: 17lglaGrQc+AHIRsgU1kdg==
X-CSE-MsgGUID: ///HU+0sQmSPkqQRPoJZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142235"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:39 -0700
X-CSE-ConnectionGUID: KmAFfYNYTnmzksxL6mCO0w==
X-CSE-MsgGUID: dc6D93y+S8KFErITnqsi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432133"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:38 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqf3CvBicvA+8Du3jeFN2pELISE/DBoRnwhhEVaMKcIFNM0Ap7sqshdcZYYO55be8VJCzKABjngzWPsltj3+pv7wnByRL4ozRZOHt3y/4RkMBx72yOQVoCVprj+XeK3RjXEFFeLXKjqo7u7YRi0j/ak7o6J7Am8AIgOgSPc9hQbdOXIzu+qHKI2bLdobHjRUgdMnh4+1j11kSbDTbR6sbhp4jaRl8H8e9NvTtF+lWMS9BkGqTY7uEUXOw2m/6M+xo/yWxSXRqwj72CHXNAhafuGNEicpm2iMLuMgBj9WyuwIE62ESl88UQwDhsLvx4m6Xsqet6FiZeWU5Tv/IsMQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUhkkhjQgHgbbmsSSIf8iZK6epujFOolF9FtSjablnw=;
 b=sx4A6s4m4PGjrkIa61Awh08UrWth69bd6tl/poS9xHkaZ1pSMeGeBdITFfNNHRgpyMum6cytlOXVvUkLskTzu0Ds/6vEQRIRFpRmmDFxWelR8bCPq6adaeVOSYJs2bAqdEJ/xq6DCx3pDnH3FpxNHDHeJGQYAd9YlrxKODizY7JvT+9gwnloUcwbq4dZrBLtdj9z1LWSFktDXZNKIX5Is0tP0CZirp0lJ1RSgx+AEeENRU0YqOwm/b3mx0rVLR35Lsq5UL7EhMY3JEd7BugbnZafUm/l5OLJPww+p8lNcWGWfo8FjRSy3PX+GDgOUFw8bSJYo5QZVP218a4qATPZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:32 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:32 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 07/25] lib: introduce lib_igt_reg_tools static
 sub-library for tools
Date: Wed, 24 Jun 2026 10:47:14 +0200
Message-ID: <d9ebb38d4c682a6cef77fb00a31378762975b3de.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: d6171060-20fa-4799-1e4e-08ded1cd3b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 2u2C7ZhlH8hG+JWIogpz3o36OUJEou1OHELxtjfWc+hjvICJIvbrduTIraKPLrHvoCfTjgs/LBQbju/3Kk+qUSgELzG+8lLasLMz0H/ABlxQVAcc7P1iU2VdIGIksOrSTJUFNKx/mQb4HDAUXqoXIvXtcfGPFYZYU4BanXhMTBb3b5LWGVMt+XinnHMhtnbJJr65RaflbnQc7KuPlUz2VBNX0HWEhITYE/2gOQNrYyKxLVNzH0WMk1jW0y5CGBNuNYnSXF2/C6tbV8NsgppLoF/8rJm4429QlDAO2T04NdoM+Rfsj8M+TyJ3K5TlfizP281iXdwY5JTPchCyXaUSTmn9tc13QFEZWg169NoSHXVLgRJUuJj8nlSnsDAFSu3Vg2a5doalXF2oe12+4dB8dOnpvVNsd1viL62Nms5QPD22Op5vjJ5swr8xZxIJZ3LapS2HwwIiQe89+mWZSAfnNy1JOmgATPIAo4R15ONRgQ4YtFSG3qhYUZUIqw/QsJWWJ4tLGRnRDNk1yx/Cqhp2aH3v8ir0hSkX3juZ1OcIgaIJaF6cKVwhxsAPFaaTlumELAXTuc3ULiJBKRkA6sLTy6nWrECtKoPexUjjIPokUjqFeHOblevRjSGlH2GenMeMSQFU16VEDlgUrbTK9opkmgSiqNiA5WQXmifjeHyGW4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XoUFPUxMqz1h9dd+ixNp7pd8RC1lVP4yETdHsiSkTABygveIN0sXCgXE3aLV?=
 =?us-ascii?Q?PhWYZyyzaY1f1r0Wf2bD+lJTj98seiVjDwT0bRvNH+ySdd4hGIL2pB1eZ9ml?=
 =?us-ascii?Q?QkET68iZQzVMr5qFCNZ3celYKlGpkc55HToGniZnuE+TmozedKOtj9tU7G2p?=
 =?us-ascii?Q?oTMun0+sxRcOwv1c11TKi2ig9aSvDFK8GtLQmkae4R9CM/4JeF0PqU55+1er?=
 =?us-ascii?Q?RBmyw/gy2hLOWbBZ5Kvun8E/te93iLPDg1s50MmxZ2RMQzLCVmavIbJWsVwy?=
 =?us-ascii?Q?yfhWpCiBmVa3CaP0uq2pyvfbdahixiUCtPqtb+hdaLzzuPZhnWfelCO32XDZ?=
 =?us-ascii?Q?8VB/Z252uJM0HqIvG08HQaHsLxF9raYoyc3bAx0Uw2o/YDoYXfqJhWC682ib?=
 =?us-ascii?Q?A0PkmLyK5830a1pzTl2e2Y20iqyr+Nd00Fb14cwrXOLJMAPEGhDfgHx6mjlh?=
 =?us-ascii?Q?H21Tire2gbDLT7ZVgfJqJbCELH5mTCk3319K3bXJeKFsvS64nDwnQnw574V5?=
 =?us-ascii?Q?pz6rHcVX/w/0A2Se6wGOtZJpoKjHsxJ/oFKH35iMDovhEAupXOpWyvgLiNSY?=
 =?us-ascii?Q?6DnuVs2je5tCleyH8QZE0hIjMTeRAfkI0vdPpZUFswGU+ENQqqHPUrt93gFf?=
 =?us-ascii?Q?hDjOi9f7+2Fx4V4XezhgdBHe1GX9x0FcJ02fo2EV3wRkYaA0zugM8A5B1SOu?=
 =?us-ascii?Q?Vavz5O8Td82AMQneG0YgtztUkQtrK1M3aGcAvemcvnpZRpyJ43lk8urdFPK2?=
 =?us-ascii?Q?mm0jeBPXyXlTHGJrv0cENwlkoAbAW69RT8+u28FFyeitdLVhLNUAQq10b+mI?=
 =?us-ascii?Q?OPM0E1pvscqPsIXTavBgP0HqVGuVUi4frHNLPL9JQFcEvWvQxJN0y5h2+xwA?=
 =?us-ascii?Q?pAjmKDmcm9rwBUVKgP5P0n2qb9M2ohzzobm7PRy+P4izrC0n/qGjT1Gsr3NW?=
 =?us-ascii?Q?KT+WrbAnSnYHpCcSdx5lX81jVAiJ2Bv+TAAvznkFDY6Az2HNB9hkC4kB6UGx?=
 =?us-ascii?Q?vW4AI/zVYEWX0G0dn4WxTHn9KpU7ZSlcSLJtn+3UYHt35J50c/XqBK6jAdTv?=
 =?us-ascii?Q?VSnlQojEhZDDlQ7wY1aoyGekmnpDvzRcdPw1YO6tmreTn6uzVC92UBG2nioX?=
 =?us-ascii?Q?lcrlQcAiqWfhifviMIOSBi1rFnr2vJ7JLAJUTSfbvdq6i0Kk5gBovucpWfOE?=
 =?us-ascii?Q?p9Y/EdOitfC4oxX+pzAcFdTnJa27VBCGq/i8Sru1FzyNdLPXZW39kZPFzFeZ?=
 =?us-ascii?Q?qPi2h8noHTnciYrfxqn/JO1Bdh9rLm0Qgl7Q7TnEkcAGlKj57Pf/tGFqEDn2?=
 =?us-ascii?Q?cz4ms6WYNytfLvi4P62riFBUdKnOUwnVl1YQxHBKPjgTPwZ3zkCSHA4v2i43?=
 =?us-ascii?Q?3FZc2vHiYwj8Fk2EV6xyxp3lm09OAlFLd9w+ikKa2JQV3qYb4YMHepDEDIjn?=
 =?us-ascii?Q?Ms7UU+f7XuhEcucJ40pScs4aft2gy7HHGaVPwPEx4Lond0aYox3P+rJcLI/e?=
 =?us-ascii?Q?0Xc3DeOagu+8y7KOGDYQ9Gx0V0dITimeMgFC+PWQYDFOkl2ScDsIyz4IEJN0?=
 =?us-ascii?Q?nSAQpB9Z4kid6WF4dQxj1yq1Y4Vu6oOc8/JisFZDsu9W5NwAMD/u88oJ5cfj?=
 =?us-ascii?Q?KjxfuiH7D35B1IncOafy8vnt1mPYOZTkQdQb7C/vIEullpCct/AgaQ1VvNm0?=
 =?us-ascii?Q?CwBQoeCE9nlXVgRUpdQmR2gGVJPYkmL4FrTh3oEqCuvpE+hhzivDtyZo+Slw?=
 =?us-ascii?Q?GzGG2TuXAvAY1ZzfhCO6lY75c1/VzMk=3D?=
X-Exchange-RoutingPolicyChecked: D1+Z7dCErnn+QCLWTzWkk2ss9WBDOv6EQv82zxPguafq/pWUm2UADigYFBOCjtrLrIMSgln7QjYSskHGKxLs8JwQuCyOxTmxO5Rb8kie4iQZJbzmzPqB3olMcWQbd+dVU/giA5T3lF7xMWqqxgfWyZWZLr4Guj/Wz9QcVHwCovIsbW8p/mj804/kL1lYG3yEniWyOfYvJaFkMSc/u6ND9lYbdYB1ptPXjRoPI4WF4QFBlXxsFfYbJvjvVL5KCS6vI4bsfHm/HSU9S/oeAsaDiX7GOOSb/1Vq8GyYXgJg2hab1ux0IoSGR9Q4ez64Q1ncHIUqum/9DoYYnxVXtip5EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6171060-20fa-4799-1e4e-08ded1cd3b14
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:32.5151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSXnTk3BKzi1FSyDxRNcxzEHBTsla2w4HtMNFWA7WQkeyNWqTVLTKM0AkSNXOXQOg46AKt5fBdgQMbzqtLPx+IDP531DM4APOuabh1EYo84=
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

Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
intel_iosf.c.  Tools that need register access (e.g. intel_reg) can
link this library without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/meson.build | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index cced7b260..95bce8e1f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -434,6 +434,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				                     lib_igt_tools_stub],
 				     include_directories : inc)
 
+lib_igt_reg_tools_build = static_library('igt_reg_tools',
+	['intel_mmio.c',
+	 'intel_reg_map.c',
+	 'intel_iosf.c',
+	],
+	dependencies : [pciaccess, libdrm],
+	include_directories : inc)
+
+lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
+				       dependencies : [lib_igt_chipset,
+				                       lib_igt_tools_stub,
+				                       lib_igt_drm_stub,
+				                       pciaccess, libdrm],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

