Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D6606A323
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BtjtLVHx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=D2fhgbh8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B8310EA3C;
	Thu, 26 Nov 2026 18:13:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738A112665
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716364; x=1827252364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=525Mz2x3++RQhSkz3V8GbEgn0v0jVcbWudCmLnP9FZ0=;
 b=BtjtLVHxdwiSrTVzwI5GlPqpfwhD2hgENF7GstiJBqeVxZ0/CvSu5i+v
 GBmolx5Jd2daRksiL7X2vzsQKtX2TUT0FBHhmdypjJJxXaBBwuJQvB1fJ
 6Sqk9NyHKZlu1Pe0TS+ksdfiUUFfM3PEYhuEp1gy1JkjPXoHQTGWUwe2v
 Ny40H1L4UkmtKCxODgaq3ahZq9PECf8aNd6J83uSbiKSlnV1+dyrV5ioo
 9nky138jf0QjCo9j8okXY76Gr+/r0nrWTtR+hQJoOVKy+GvTye2aFGtor
 YOf827FJh9BWWFDGLAzBVWfqygBblfUNIm6/GfTgPYG6GuLQEfIrj4ue8 A==;
X-CSE-ConnectionGUID: xY8sH8aNS6m5kLvOpYJs/Q==
X-CSE-MsgGUID: Lq7yOyEwTV+HS29qBDCY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541052"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:59 -0800
X-CSE-ConnectionGUID: NM7PZ1seT+2QgqV9XRKhng==
X-CSE-MsgGUID: lTCTSo73TDG7WLPVwWgjYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmbfZqw33EJBqTz+AEmDwSvWTXGcsh3HuVrypASxNyiTQAN59XXJhS4ISkE6df9t9EzIZVBItHOBJNZmy4I0A5DJeLgPVXDNnjRJTKK7KGbr+hjYNllPtYwpK8RvqIrp1B9TDmBM22nrS7WZYvl3SA2Z5ICIzgaFsJfM0zjLJ9YafbT7/eWIdi3N7FmdeE4sn02e5mmu+9ysVW1wy/4+AiquldZN3hBLScZIe+uLI8995BMNAHZ6qucr1c0zVc0gQMzOdiJIbNnQ5yaO2juO+mMlIMddF33kxlRYb0zolJCcDjguMoUkm/FjIn48HamJ9NpVSfU+Gjfhj7HFjTbUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiSI84YDoosyeSQy6GoB9iVNUzJDAe9IJ9Lysdy99lQ=;
 b=utnTh/HrTr+1E+J7OE3EuD/WLqoo+iBJ3Bn/MOE3XcdCWc4R4FxB3UKN1X1S4RLQS4P3WlE+6UJ/4gGA19soUXh7Jlhy1Y3V47Oov21Wm3nQHeA9sE/NqDpUuNh7XBr9ZBil7P6p47L5Gy5U65v5lbN/VimCF7xPCrqG5kwuPzIIPJrwK4BTdi1R6qhiKZAIJzwyY+T0In+k66rZy5VetetOUqOauBGY+iKP4Tw/9MAKk8xiG3zo64Y4AJUBZ5YntdKrEISoep7DjD60T56azlKbf63sQeS1rLRiT+pbUjHb6cSO1CtchlYd7R3CvcSekVgUdmlJvRBTtV+YGRiXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiSI84YDoosyeSQy6GoB9iVNUzJDAe9IJ9Lysdy99lQ=;
 b=D2fhgbh8KcYX/x4Fn0GozGcjPaWz44mhvyiuuEK/NCkAwfOIqgaPrcVe9j9QJmAIOK3w3ZCDWLzcVMImxDGTvNl0K/hSYS4+bheDLWX34VkEqEVOWnF8QW5lzNs6c/XJo+gJJn6SvS+4JfrbWOZRsgpLa1L4RdRol5EmM+KTUJ4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:54 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 5/9] tools/drm_ras: Show and set telemetry fields
Date: Thu, 26 Nov 2026 13:05:39 -0500
Message-ID: <20261126180536.487442-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 045dd4f6-031a-4e65-5f9b-08df4be7e98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: FyOuhsAOA05Zr9Cwj1rqsBVDOPmQ3icEsGAws4TO29eAU7e0GQXqx3Xurvzp4kKJMhm/E3WuT4TZVL8HvM8GvuXtS2zko0Z2dq/Ov/n2thldp1oI42IXzkOpG9UzN8yo3YJzr0OkR+skDmdPGwgPrER7EjoFh7AB+q3TdxNvT0+deQxJVp1jOjEFiNz7xrJgb5dRozP3KQs6a0uFPbnZ4CrnZh/Xib2Mo/ZEs9R5iw8gQwSnOcaato7ZX/9+N7kRmjHK+oMUNN00zVgBcKC37/J1Xxsa2PG9BggMoguWPj7P3YpE30xV+eBc1GTxzB0JT+oaTFtC891k4Us6kFFNDK4/Rv7SVNkxdIWjEgnkOMLePOR2yLDtgWhZ4S3yK/pYcKeHtLYjyKxFR5VAitF2naG1xx69Gjsz8BOgTJ32j8S/UBD/ST7REoRxDZ4Rnu7ox3c2RtRuDw55o8tLxI8qfrPG5WtlmGJYWqa1NieBItigWazfk5zN6IJPsR9chgTCMhYXOpKmFrrk+J39P1vcmxxSoByYliarAoSYlO27P+bMGnQ2Sh4aPaGK5012w+Hx9MJ268bJh0Pg2N2CYI6knsXzUoZ/uKjCYlkf8oVw4DBnD5JNSq7NXesoXdHiDHwA7BkKEfJ/1P5965DzePCs6+Tu4zlzmB7E5J/JXp5M3U8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gBf71BdKBizPAicZFOWMsAte+6wdJON0cG1wKly4K3uukf5xpi/kZrn2D8wp?=
 =?us-ascii?Q?rYOuv+WEqw+W8np5FvsWvmypUHBiXMAh1OmJ9GxdZisE79mitdVCMOf84DPX?=
 =?us-ascii?Q?IlAG1N5BsoeRfLrtlt8MoNqBN7w7QRke17Gn3tZ7HqIyqTfNjscm+dHeXKwf?=
 =?us-ascii?Q?3TuWIfCYs6himn2vg6mRCq1zn3jt25unA5FC9YpSvqYJi2JfcjIvaLrFsZw5?=
 =?us-ascii?Q?Y9vClPwYfW9K4mW9UC5xog2DYglA04RIywDMVw425nJCAugRZM2Z/T9tnj2u?=
 =?us-ascii?Q?GFpzRRIyarslrWww3C9Ra1HsKqnVrHvC0T2pdBc00sfs1HEMxhqx6fSxCl4G?=
 =?us-ascii?Q?CKjGVeQpr+as3kXx0UIgVegWYo+kKEJzmssAi/xJ3wt+rmCyHgD2fnEekqMi?=
 =?us-ascii?Q?o3WV4+dJnFcFYO1xCasB+NoY7eV0qR8fyRSSwY6MYRx4BhmVZ6JB892bmYvg?=
 =?us-ascii?Q?J/89uovXcBPf3bB5TSKvFJzBueEWEfuXFs405KjR3G8f/tFrkz+lAWvQjAsB?=
 =?us-ascii?Q?frQk3ph8szpO/EDRP9RNOScpLC8Jyp8G2seyKm3kMSffpAK6ar+L0yVVd4Xh?=
 =?us-ascii?Q?OVlBiBVWbtnSut2UH+dy5To6B6D4HtguKHzx7BlFj3Usaxa/kozLnil4WGs6?=
 =?us-ascii?Q?sb/lqal+ancEelLFSlAMls3BYRJ9pEzPvTouZnFdizFQIvNC4kRt3/fyeU60?=
 =?us-ascii?Q?+iiNzZc6aEOhbOLfdXRIhTQTAYpu3XVDqFFXE6XK0yPR+h7H5xDovZlGOWg+?=
 =?us-ascii?Q?fuVEy6F58COyMyZYQ44LktlrrdXykEkPMeh1JVemu0p2WOnoDNu+3fp6aeEN?=
 =?us-ascii?Q?wUMoZpUk7S7RX/Rl6GJAc0pGSvLAwtLncW4dbyMNiCb750Fj6+8kBQr/+mm6?=
 =?us-ascii?Q?XlZO/HwkKbvg/UGCfs2RaqNV2GSgWRuyzbemPFcBfdziNeyZxvUA/X79fVvD?=
 =?us-ascii?Q?+PETG3zrVb/5O5NUuL9UIJFTugcatxSk7kgEnfWD9ZGTAKBwM48bPrmJTKz3?=
 =?us-ascii?Q?+7k/7EnX9oTBm+JtE78W+g6T/fp9uAcHp7fLb3JtVG5Be3/248it9ETvvVGU?=
 =?us-ascii?Q?gQ9KuizlQ4uDQ+su8ct1BOAArTi2Nov78cAvCojtpD83hxPNhPq+/Y3GMe6B?=
 =?us-ascii?Q?RdzB8Se3gqdQFgdu7LBUTJ2jAcnn+569VCKqz9NmI3DkZZNctEBzjSku1LKU?=
 =?us-ascii?Q?/aml81gdmtllN60JIlgd7a17wE3EhXCSE6+luapCNBreZx5UBiC9JUghNjNN?=
 =?us-ascii?Q?twIQunIHsZs4oejJsXj/HuJVUVD/sF6/6YvrNmG6wQ08nqo3p0fTRsvqvj1F?=
 =?us-ascii?Q?YJ1C68rdqRxS2BpwzbGfi0teu6/LlU9AajRNMo13aTEbKt4bEVsVuZOjWSaq?=
 =?us-ascii?Q?agSi8Djp76p0OWbwsFMmO7bcciZJPw1DbylBPBIC5IXRCaQuWcuFWNWgeTZb?=
 =?us-ascii?Q?0YJnF8v7eRJnPXZdFAkAe8DxWrq5AXFaSkod/hisxuYm0+8dzCF8Swh34kq2?=
 =?us-ascii?Q?Y/bbNOfdepoGj5n97LHSELJUBUjrmqNBlxvXRSNFCjoNnKrnb63rsbrDS8Ey?=
 =?us-ascii?Q?6ZAe0N3kymKa2Y/Y7po53Vrh0PLnRX3D3xH9X/U33gQlSSpAT1Nw9HfS5+aF?=
 =?us-ascii?Q?iJ7t7xFxjbmiqLfTF6JEw2oFzaHx+wMAfo4+im3uNRp6Wk4keYXo88hPgkmP?=
 =?us-ascii?Q?SpdnI7+jfcHUMaVyvkBWHZI/xBwDZqyHexHuB/hqPsXKGA+Y329Ee1yBs2Ku?=
 =?us-ascii?Q?TscGxCx66Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: iBLo8FZSuAKgc5B2N+TYo5/F+Q12BkOLzhUG3vc42uEG1vECcd3i7m0sUsOP8cPqhfKBl8XwbrUwZLxTan1OnbJrn+crmlJKKM+rGPeR2XUxLAcdCUIajfYt7/Mrz4CYjK3c+f5KJ1OKpgXKM5uCTmXsxI0ZloPlSQbtfR81JZZSSZY+PeBQq11fhpqGe6/q8ulSnYA/vh8eCk9s2wou6R8DKKMuZnQyXkltkukPIA7Mp73GeKETjYqQ1f6G8lHrknndycYtBYGRHSFeesLxUjJCau4PSzIna0Gqq4LsdOgZPDj7D3TQeQh/c3MUhD2yleE2cCXGc6Yb//BAwKawgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 045dd4f6-031a-4e65-5f9b-08df4be7e98a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:53.9150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbL/J80UvOgScsQUM2s04J7BmSfkhIuBvXZTg/lNjVJ5aUL/Dc8whk6gfKPKDeXeh9CpJcG8elVS+uKZUNHwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For telemetry nodes, show one line per field with its ID, name, access
mode and, for readable fields, its current value or the status reported
by the device. Add -s <field>=<value> to write a field:

  # drm_ras -n <node-id>
  # drm_ras -n <node-id> -s <field>=<value>

Build-tested only, no telemetry device was available.

v3:
 - Align the field columns (Zack).
 - Return the error of a failed read, after listing all the fields (Zack).

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Tested-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 127 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 6 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index 0af1ca919..aae92f99a 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 #include <getopt.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -14,6 +15,7 @@
 
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
 };
 
 #define name_of(names, i) \
@@ -38,6 +40,101 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+struct telemetry_fields {
+	struct igt_drm_ras_telemetry_field *field;
+	int count;
+};
+
+static void add_telemetry_field(const struct igt_drm_ras_telemetry_field *field, void *data)
+{
+	struct telemetry_fields *fields = data;
+	struct igt_drm_ras_telemetry_field *f;
+
+	f = realloc(fields->field, (fields->count + 1) * sizeof(*f));
+	if (!f) {
+		perror("realloc");
+		exit(EXIT_FAILURE);
+	}
+
+	fields->field = f;
+	fields->field[fields->count++] = *field;
+}
+
+static const char *field_mode(uint64_t mode)
+{
+	bool read = mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ;
+	bool write = mode & DRM_RAS_TELEMETRY_FIELD_MODE_WRITE;
+
+	return read && write ? "rw" : read ? "r" : write ? "w" : "-";
+}
+
+static int show_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct telemetry_fields fields = {};
+	int64_t value, status;
+	int i, len, width = 0;
+	int ret;
+
+	ret = igt_drm_ras_nl_list_telemetry_fields(ctx, id, add_telemetry_field, &fields);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < fields.count; i++) {
+		len = strlen(fields.field[i].name);
+		if (len > width)
+			width = len;
+	}
+
+	for (i = 0; i < fields.count; i++) {
+		const struct igt_drm_ras_telemetry_field *f = &fields.field[i];
+		int err;
+
+		printf("%" PRIu64 "\t%-*s  %-2s", f->field, width, f->name, field_mode(f->mode));
+
+		if (f->mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ) {
+			err = igt_drm_ras_nl_telemetry_get(ctx, id, f->field, &value, &status);
+			if (err) {
+				printf("  %s", strerror(-err));
+				ret = err;
+			} else if (status) {
+				printf("  status %" PRId64, status);
+			} else {
+				printf("  %" PRId64, value);
+			}
+		}
+
+		printf("\n");
+	}
+
+out:
+	free(fields.field);
+
+	return ret;
+}
+
+static int set_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id, const char *arg)
+{
+	int64_t value, status;
+	uint64_t field;
+	char *end;
+	int ret;
+
+	field = strtoull(arg, &end, 0);
+	if (end == arg || *end != '=')
+		return -EINVAL;
+
+	arg = end + 1;
+	value = strtoll(arg, &end, 0);
+	if (end == arg || *end)
+		return -EINVAL;
+
+	ret = igt_drm_ras_nl_telemetry_set(ctx, id, field, value, &status);
+	if (!ret && status)
+		printf("status %" PRId64 "\n", status);
+
+	return ret;
+}
+
 static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 {
 	struct igt_drm_ras_node node = { .id = id };
@@ -52,6 +149,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return -ENOENT;
 	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	case DRM_RAS_NODE_TYPE_TELEMETRY:
+		return show_telemetry(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -59,28 +158,35 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 
 static void usage(const char *name)
 {
-	printf("Usage: %s [-n <node-id>]\n"
+	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>  show the error counters of a node\n"
-	       "  -h, --help            show this help\n", name);
+	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
+	       "                               of a node\n"
+	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
+	       "  -h, --help                   show this help\n", name);
 }
 
 int main(int argc, char **argv)
 {
 	static const struct option opts[] = {
 		{ "node", required_argument, NULL, 'n' },
+		{ "set", required_argument, NULL, 's' },
 		{ "help", no_argument, NULL, 'h' },
 		{ }
 	};
 	struct igt_drm_ras_nl_context ctx;
+	const char *set = NULL;
 	long node = -1;
 	int c, ret;
 
-	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "n:s:h", opts, NULL)) != -1) {
 		switch (c) {
 		case 'n':
 			node = strtol(optarg, NULL, 0);
 			break;
+		case 's':
+			set = optarg;
+			break;
 		case 'h':
 			usage(argv[0]);
 			return EXIT_SUCCESS;
@@ -90,11 +196,20 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (set && node < 0) {
+		usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
 	if (igt_drm_ras_nl_init(&ctx))
 		return EXIT_FAILURE;
 
-	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
-			 show_node(&ctx, node);
+	if (set)
+		ret = set_telemetry(&ctx, node, set);
+	else if (node < 0)
+		ret = igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL);
+	else
+		ret = show_node(&ctx, node);
 	if (ret)
 		fprintf(stderr, "%s\n", strerror(-ret));
 	else if (ctx.dump_interrupted)
-- 
2.56.0

