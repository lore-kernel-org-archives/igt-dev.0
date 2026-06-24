Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F332CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47B210EE25;
	Wed, 24 Jun 2026 08:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VP1Grip0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1910EE15
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290847; x=1813826847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+8GF/klwD7g+Gc5PvM/oueC7vnjDWGHlTiin4Y6jTyw=;
 b=VP1Grip0aSeegeYQHXVAdtvh56mSEFM7LZiL0rPJQjaxh2yV5a0HWhx2
 8o0+zOWAOBrAoMnzDaCV7MUDt76pnuKnpldbMNxvwTkP+lPkT5/urxIuD
 t/xGgHJwQZp5f03667x7udBKqRWp+pI5AkT8Vv1cevAa2n4FmFw/t5ncr
 X2xJuh43EIbdmt9VNUy3p+CjG38tyRPgoNGl1C9/CSXtE9bicGHa5GCFR
 TM3JrOuIxY/UgPu0N6zM898xtfi37AEll7pGohNNVBR2jw2JhWVGTlmSQ
 +ZFmGbp8UP6h6tkmCvmRK+yRn/YClbxJ0a6EyILtp1uf5vj+IRoJXwBPG g==;
X-CSE-ConnectionGUID: cdiTKE4VS1eyI5+HbuyHWQ==
X-CSE-MsgGUID: /lWHAdLsRouuCG2x777c0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142214"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142214"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:25 -0700
X-CSE-ConnectionGUID: Kr+sxbEhTIOHKEVT7eN8Kw==
X-CSE-MsgGUID: EpNusDtcRI+18qV/wMTVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432071"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCW0gAG7XlSF9QzH52z71sDRZg7JLnVTvDZ5TDlG2kU8rnxG8ed2F1kV8CXjnU/n90Lsa381ADDJYCA/3xiUb3I/VDYGkzP1TpSmTo+1uvwis3V1efSfAEcnHfX9Op4FqqK0/0g4T6TOu+sHMe+kns5osyrXvH/TyP5OtqC+eOq9ZKF5WHU1hyYZXQjEYWrxUxbs5oNHEcAdPZvdqbjnQlc7/KkhfFq21fCfKQI6OpLFKvpXYvnuoRV/G5tECypWwYrqrSON6J4vsCm4DBqzdHZiJSkeMOXKj1Rc071DlJIvpRtiCaJ5g9y3dzwvBcZJd1efjxT1CsElD2j8PCQXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zoliz2KpH8lUUkB0GaKbh3w3tNcAjnapscJaly3Ma+w=;
 b=o82I2ftp9UukPeJwsqEa/dSR5Yr50CAbdrmOUipTxi3JgexB7RP8vf/XhciaUYaeEZVwEBTML7MQsIPfqNBcwbNfm6sx5Y3ErvM+m56nkkQM7YhABPFBA4+DPKVygfkOPqbR3qGV2mfccE67tzkZazSjoUDPyp7/6Prb9JRdMHkF5XF3v3Aum6IRKw2ZcVEjkfVfTnf1cXqSX3wFemAkBbdSyknorW+x3F2ZoqBfvBY8KVNKQYbDXosMawRgn0A663aJG55lNkKSungKj4jXotW27X4dXFB1JHFf0cn4VkUeWG9oOBb/uGHBE1ZdzZcUiSddyf3UGo4cqPcUXISmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:22 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:22 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 03/25] lib: extend igt_tools_stub with additional stubs
 needed by tools
Date: Wed, 24 Jun 2026 10:47:10 +0200
Message-ID: <58b9bf1d4bf1984af79901d88c87cf34ccf7eb60.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: d47fffaf-62d6-47ce-3e23-08ded1cd34f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: nf4T0z9TBShGJ5/YfqKzZRz+djq2vc6UaUu76+JYPNuRM4LhBiSad+X3R3KHqirv32ovgPv8jcs0urf4sIn/Iv14Mti4wG9/959Fzg4vmB1vx5ac1Bsg4UgvuywTCKlsIZkejCi7W27/q4ltYPDgeKeXY76uJF1NnRRpV6HFdW4m5WxoX1XyOy6f6TDOPbSWBMYPkup49iyK5ZAB7NrIi2I8EdbwlnTh7adWd8U4Tkkb0e+mvxPKaia7+vS3DtdzULdeXO9xrje/L2Q9t45x1br9qPGxQNBgQuRcjRC18QS1LSy8XUen5xCKHHlK1kOFH83WuO8fWH/5ey00kljmLFQj0zbY2G23q70SCFdPlfhEfmeLNcQZBrXkvdF7D/YTjqYPpheJ9C4+RHGj7/2tWW15LLHVbsvCi3cH4rFaKzbjoOEH6cdA72s8HWTfzzxPTLoieETUd8SXCtMFpT2xUkfjdvrMJ2XEEYcv5Wt+wLhkm7kz6Xi+8nWnXsvL1tK3MT4C7cIMBBJU5LuyRaFQJndLcUEmHJf5J558E2ezPkWBSuGyTMXCaaSBnrHGJslYn16Yrp4WQ/rhCsU0RTkgEYYQqwfdA1GfPpeGAb6AEQvhHp77QW4uqtKd+z28Go/7SQdFuRcZJgA4vlUr9pj/SyKvDNFpbBMwHBxGNE7St/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hPjZfFubm2qgwA5VPPnqgGoDOQM3mZSa1sc1VG0cM+EfNWy+mOippPdR6It?=
 =?us-ascii?Q?5dZsKdO7VzJ2VOlswdYf6JmF/lEOe/RrfSJWEAmVGaL1vf/0hmpem6ANpP4E?=
 =?us-ascii?Q?nKfS4zkJi/EN1dDuDsrk+gTrh7Xs1Z3AEMBPiNrn1Kocx2kNOO+m7p58eBjU?=
 =?us-ascii?Q?+AXWpa0hXLnN2tFu2NFefoEh3d8t2kalYKlq6kMohu7M6obnGN0FiuS2ysAx?=
 =?us-ascii?Q?dPTgrKSUTUTypUz55Mx/eJDRNUgCibk3T8W+WOkaOt7mUrBuwauNDLOYwxe4?=
 =?us-ascii?Q?v8312cq8lN0QOY1TB7ziR4tiqEJBISQHhEw04na8J4fchkJwTPJu7RXLAQ9Q?=
 =?us-ascii?Q?AQD+A7I9Rr21qvRResvVPYP8I74tHvuLut+c1y82SVZDPBi3oPAILQKPRorB?=
 =?us-ascii?Q?v2B5aFwSR0NKwFQze0Z8hcRvFExOsUT4tWXYJAzJu8lWy1A4MKQ96tYGknxE?=
 =?us-ascii?Q?786Vn1SQBtKV+7JPPkDwvloCDyl/2PU0/9mvXAlod2Oj+uPbOgT15QEW+pXs?=
 =?us-ascii?Q?GQ9kUEgm2LJzscmPBNEkyNeBVeAw1C0HUWeX9iRiV9Vx0rUBujXdZwooSYWT?=
 =?us-ascii?Q?5yCekYBdP512njSobsIXKlhrMXM0D7MK82RmB9A97peIQkppXMJFAnllWANh?=
 =?us-ascii?Q?oPwnstz0C45PC6/v/UVEb1qLeK7UF/+Q2+3kIQ//gi40fiEFmPGNgbilkEYy?=
 =?us-ascii?Q?ffQ1byNhMN1dIf9TR7I9UCZRGB6RZPYlx6nOU0QCu63nphtJrRtY70jujERU?=
 =?us-ascii?Q?jNpFlETbX3jhvK7Md5C6NEiF5rgRWJHMoXVYI4tzntc5gOUw/qxbHRvHyZiV?=
 =?us-ascii?Q?QW1uk3jluMD1wlrBnILFeU31nMySKnGCzRJHnQKkpkNrjI0Rp7dwgYfM3pmB?=
 =?us-ascii?Q?xvmYM5G5TAHXILH90sFwQunBI6L0oeT3dRhrNxkPCLZhcgRhqJcdpWwfTQ4g?=
 =?us-ascii?Q?03HpiDGiZW11cC4RyskXzvfwvGg+MZOD1r6i8LPSK6MtO1Lyv3UAjQMWh51g?=
 =?us-ascii?Q?cGcBYOZYVfQXdhqeRGxylbb/IZpPFfCDze9Q0A91YPRG8VCDRUU5HCKjp93z?=
 =?us-ascii?Q?8dQUYmrYoAEqyf8B8alNWH4/+wlaMHgZRh6HZm4kHOx7xw4KrYRNR9E6cqJR?=
 =?us-ascii?Q?Un42BSyh7ORMxmjej/9m2ps0nF2fZa3scAWWFrLJHDVIeaiMsOJ2SYp3niVz?=
 =?us-ascii?Q?DdYlfmZEfq3qZ9mwTG18+ux+SZ+wDO3UIiXrDHUMzvoie/LAX8rCOj87MJMa?=
 =?us-ascii?Q?92FRqHqrLcfcieTM2Vg6b6LIcPWJH14aXqRk7681p6d34JN6kHopfUbYbUp9?=
 =?us-ascii?Q?RUaKwb3kurplK7wAK207wUoHNJlhaDIVenPn3sANOyzjkplB+YYZotaQdxhy?=
 =?us-ascii?Q?NqxOCO30Y3AEyjGYdUZjowHmqbkd9OaZQaayr81mYKGKOn4a4/Fd6zbFlJfl?=
 =?us-ascii?Q?cXHTyF90YUr4AKk1Wbgf5ja6g1Dg3dNQxSSjQssoF3XOLsa+pO78IuEL/7vZ?=
 =?us-ascii?Q?2IsLtjnucQKikp3PgAsWOUR6gGJdttWh7TfgNRTc+n9Lptl++cwi3dEpZ0J8?=
 =?us-ascii?Q?ysx59T/8JlWNF+F+7VsxbMyLbcbOieN9SGNlILY4BxH547+ASlFfRhYrV7aN?=
 =?us-ascii?Q?wpDmT3cgTVT+EnGOwGD7hx/HMFe2tFXxBwd74RjQ1kNJ+4l/wiziyb8woerw?=
 =?us-ascii?Q?i0ZmteisfBS1UGpJ4cxGOp9dLmbFtiDpQ5jqXel4CwvfHBFLmTiUFNx2uI9G?=
 =?us-ascii?Q?cosH/AZ5bOnot5kVICwibhU8Anifsfs=3D?=
X-Exchange-RoutingPolicyChecked: gwf/uv1qYLVydRz4EY0+8+C1IgwjbdBk9WurlK16jxCZUVawi9IyblODtDtJBWRP2CtpXQLhjdC0zrajVrzGRb4N7GwqRIw7sPgIO0bOHsv+tRLJgXsHvAxSU2PGnKz3JMjMh4+XGBQlAMxd3WUfzLpKMonCBQYh60VLFZtgedkHt0e841q8ueVTmvCbL4+spWfSE7V0XEMOs1jNdFRVZ8yZSSxgz+vjLOlz0chSagFx42BkxAPvgX+bP3uFvTIzucVIYWNYcd5/13RW6xqPhu4KyRmA9ObiIJARgJcQViyJNvl0HA3tyLgy5EsC6VHb8iac+GAUwy51wl/IJg85IA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d47fffaf-62d6-47ce-3e23-08ded1cd34f4
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:22.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1UAfnGa8Mm2yNyQGZVDYwOl3teYmq+Lj5cVc/jmDlh/t/ubFQUbWGPf2wAHY7nF51UB4SK49T5mQvKtabVFOw0ofkVVfR5JPa19lq3HzCA=
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

Add stubs for functions used by tools when linking without the full
libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
igt_open_forcewake_handle_for_pcidev.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_tools_stub.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..081a05a8a 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -21,7 +21,24 @@
  * IN THE SOFTWARE.
  *
  */
+#include <fcntl.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <unistd.h>
+
 #include "igt_core.h"
+#include "igt_debugfs.h"
+
+/*
+ * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
+ * The type is used as an opaque pointer; this stub always returns -1.
+ */
+struct pci_device;
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
 
 /* Stub for igt_log, this stub will simply print the msg on stderr device.
  * Domain and log level are ignored.
@@ -49,3 +66,53 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+void __igt_skip_check(const char *file, const int line,
+		      const char *func, const char *check, const char *format, ...)
+{
+	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
+	if (format) {
+		va_list args;
+
+		fprintf(stderr, ": ");
+		va_start(args, format);
+		vfprintf(stderr, format, args);
+		va_end(args);
+	}
+	fprintf(stderr, "\n");
+	exit(77);
+}
+
+/* Stub: tools use exit(0) rather than the full igt teardown sequence. */
+__noreturn void igt_exit(void)
+{
+	exit(0);
+}
+
+/* Stub: open a debugfs entry for a DRM device directly by path.
+ * device == -1 follows the igt_debugfs_path() convention of defaulting to
+ * the first DRM device (dri/0).  When a valid fd is given, the DRM minor is
+ * resolved via fstat() so the correct dri/<minor> directory is used.
+ */
+int igt_debugfs_open(int device, const char *filename, int mode)
+{
+	char path[PATH_MAX];
+	int drm_minor = 0;
+
+	if (device >= 0) {
+		struct stat st;
+
+		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
+			drm_minor = minor(st.st_rdev);
+	}
+
+	snprintf(path, sizeof(path),
+		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
+	return open(path, mode);
+}
+
+/* Stub: in tool context the driver keeps the GPU awake; no forcewake needed. */
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
+{
+	return -1;
+}
-- 
2.53.0

