Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DEDC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A68210E0AC;
	Fri,  3 Jul 2026 14:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI6igkcQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B610E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088931; x=1814624931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lghkeSWX24O9CK4DEArC1s3FdbwaijVuFQ4Z6j4gFIE=;
 b=WI6igkcQgCL9yz0DRf+4bNydeMfULwn8RdGoYFPsFXV4ZmjySWFC2B5X
 ONnSOzkDzMXK2n3BcgHbe25R66eHHHqG5LuVPhG/jbBf5Fh/bvtfCHrRi
 FoerM/nKN1vVOWjrUz0G+6aenwDVsSxyLSIumAzopW7bNB3cjaEEkAg2t
 YsCLMkQ/lS/IAd7Zy63s06G+LmMrrD1EqMwZrHc9tXHS8uzS96q84fy4l
 HhZMUIJvQz3BD3msZtzPQ+B5oATT3OOtyIcYAsq37YCJrWayG04NzsN9L
 iGum0bkJFdi4R4NxvORg9X+Z9OzuofJEY5bpLdeyhnSD/ictB/jUovVod A==;
X-CSE-ConnectionGUID: 1lbuiap6TYG9SQkVNVuXhw==
X-CSE-MsgGUID: QXDMCRRsQnqfQrBwVF/udg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877906"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:50 -0700
X-CSE-ConnectionGUID: biwX2O9uT5ewOq1wCrh1aA==
X-CSE-MsgGUID: xPQ+tv1AREyD5XE1MTvSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019322"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMygZrnH1T0dRdHdg4yIziJQIX3R3aHO5KBRYkw1m7FI1Q2mhz7MEDa3Na6nwEUEl22br/I6RnbjxuAC3NP29w794Y3nzWKk/NIkoMqWYQD0NghSyO0MS+VUWNMV19YqgUOUDWV/4eA7IjMrqpNu3K3HVYK/o4E1aOEe/nXQKWi1C0CPJ86QleLC8NTXap3xaddsw6/7dvSgeOxI88bfp8VvEODvYrO+xyIab4UZrg8/vme42OZhhOsZcfJwUYpjmAjNab19+eBn2Lwt3e85In8GtDb1dO84nQWDoAk4VcDxQUzPBmEh4nqjOeYpKysQxamY8j7/c/rJhgYqtcnAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytueKijkEiW7A1kMkE/cJ5U0oPDaujSyIM85B5glW9A=;
 b=TVOLcRxmMjrrLKPD30CY4aOkwj3Fxg1YdxaOSkmz/oD/5K9a4y5dMiTJoyB3aiMZJM0WXEpcjszBUiliKcqnOlvP3OsdTgfLXTG+w304LmqXeA/EVgh4y5/RwtrrPcL0ARi/SBv944u133bXIEfvN6ESV7GdrqJ04PqEiM/4wVF0uxe7gvxQEVYB6hExHH6KtmVPH1GgUyzzRa6VEIAwwjtQ3P9EvUQV6NuU5Z6I/CNaWVMqL5g9lEHLevGIVXB70Ur9eNRiVaYwrTQJ/xXly+02tN/4csa2IlONDRzyy1t5aAoubG30JE8BKJekWCFu1GeciOmtZhZMW7ApZ9kWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:46 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:46 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 05/31] lib/igt_tools_stub: add stubs needed by tools
Date: Fri, 3 Jul 2026 16:28:39 +0200
Message-ID: <4474cc1c9f5fdeb6d7182593ab2fc24c04dc0629.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bcad1a-83cb-4b9b-828e-08ded90f6479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qQx/blluGzA1dBMPa/0cO5PHaY5h6Ha2IVtREzjtxPvxMYV+FnDK3wPJ5CdZNwWrb8wagCMAmViZcnJ+vvymkfaNZeVw1EHnaGAqvqg7+tMPNXFsbmeKHh3MEpFDDq3OFId72AmuJHzQtV0eCFNxmByf/IGar8ewYQFr63s/6i07P8j1IBRCdBpfJ/gN1qkUeccWYj+Mtyk1jkGQbLXL4YIXjRu7gbirFVBZ3kNNiJr/Diw//QEZ1tfFP4WGU70Ag8VSb1XSOfMAO+R39NPYw5I/SENpYFMWSg6ArDdyV5w6vtWy4TaSo4V3/d1S5Xl/Oepi7GIjvBt44Q+xwg8injvC/iRogYrlp4SgtkJTdIXwisauCvSkb07dnI6xVKt//Q4VFcUjH5Jn/8EYnshYstzry+I5QMYE1qJnEy90PnNMaYJBam+IELvK2uhu9nKAoqODWLjghAPeSh9RC3zpLHtbVE97xTJcRGMHQvoF0eAdcOIZwmaOFd4EERi56pnud4lcko8aNtTeHWvY1blqeWeoxbUn93X19wXa9/G0V8NuuogmY6uqQDUw/5QGlaGeGAL/W+bc7NrbA/AaTLQZtYDFaL4rqj0Zi5v46rRsqYnwa4N8r2+SIETbiNskMv1jRPkgVcgQZH2ZZ3ffdOyKm4RZ9jI2ReOBKzpFS3QlIu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xub7Q6LX53dqPKIpfh2zyqwT7jCGi8rbCBWUhdPC7fp7Nf1pPquYWH8g5oDM?=
 =?us-ascii?Q?sFAIuqpReG9pjI5db2bLM5yQDn30u8Omb+rtR/JKo9tl5iJmwAu7PUbr6hA3?=
 =?us-ascii?Q?GvEkyYoFjDGdlY4VoevWp224dt6W0efaOzU5KXWTJulNBIUc0E04DKFOQoGx?=
 =?us-ascii?Q?9DtTstzpCtJVf4IE1rvkIycjJZjMtvyQp82C8CKFJO7KkGDG3R92Vks+ib12?=
 =?us-ascii?Q?PTQiXTdBThRyUg+aOFJn4IuYmK1eOtZqhGYWQ4snqf/ytpEY5rcRpKjJG/ws?=
 =?us-ascii?Q?3ZfcCpRm0IQ+f8SNsd71Yn5gBdQlYG9x2xi4wnw127q+X1qaoPldvRuRcQLE?=
 =?us-ascii?Q?4ebTJ5WGWP97Lta7+WVJp200xpuatgIcEOEw2XCY/fJNxeV3HAWhl4Jvhr/0?=
 =?us-ascii?Q?aMHztluLsavAiMWXfZCzr1ibUQdwXnIWgusaysRrmd3hq90sZVh8+qXR/Lzh?=
 =?us-ascii?Q?cTPTHsrCnqlKzoePTyHVRS32Ywcoz999YRtslBwC3wf5bdCzNL6nW/yGoQLO?=
 =?us-ascii?Q?GHdYAHYxs6GEuczbNXr/MYGLTP/QjUaMhYc4OYomc7ix5Zl+aJGiYKYw0m/i?=
 =?us-ascii?Q?8dqnGvsc4tdC11UDWKX3wjpTRP7iCcCY4ZjotObLjR++h4SmL5aM2wT8BGtx?=
 =?us-ascii?Q?ew6rk2GSofGlMKst/+fM/78A+S1rfDCtuRm49Q5/PCpxKr6/AqQ23oVg58po?=
 =?us-ascii?Q?LdthGsvhDrEpzMQoHbeAS48j4QQEkw6YY1D64g/eS/5HRdUZP3D4OLhTB9IZ?=
 =?us-ascii?Q?Kf7FxI6TvjaVVJMe3Of5bBqSVt9HcY/bRfEDOSpttCAAe3AYsopk83iXVpzF?=
 =?us-ascii?Q?FKt1TYabYcn2W1POaNnDM+luxqmDWTyMfnlxho84iPMIo1VV4pegiD37TSLE?=
 =?us-ascii?Q?m8k1x7ke3Yfq5X7rQR3pdw4xmZCXvr+01Ek2MZri2dwvhDzTpMMonEFjbzV7?=
 =?us-ascii?Q?4hoknxh8DnBxwh5hmTtJsPlM9R2PzLX43NnHOqEyNTWwZTLOnwWajfoXTByF?=
 =?us-ascii?Q?oeVfXxDSAhvzrDkrFX/GsUqBa3CmgCR7iTPyyPRsQiKGlfKGVH8/gIOnv80h?=
 =?us-ascii?Q?jVtrJ79JG6NJZQIr7AcKJ8qGdR/SKxrGe22g+whxDri8aUW96bqmOiRf41Jn?=
 =?us-ascii?Q?ZyJGzl1PrR1rsPt4M03z8Ic8sffhMaVaqkz6gSm2iloG5WH9Orf1tGX5TVMj?=
 =?us-ascii?Q?Q5tSQJOHZcpHU9otpPPHsGMuF5ScFcjSr4tDFOJXKAZHlsR6QkGoFYzUIeZL?=
 =?us-ascii?Q?IFDSsGdSyfPTJG8bLD8WwnNwOk4InzDx8mNHGCK5mbc63rnpIszRE5MzLPzt?=
 =?us-ascii?Q?cLnUsQESqDw1awLhIWw93/vB0ZyVGYKtU+zcmv8U8JRN/S6D+sxArxZL3saX?=
 =?us-ascii?Q?qDKeCOxgVQw54WopJnXb8egUDvJxS+tUIdQ9rS2YAR4bV90N4ZB6736AFkCf?=
 =?us-ascii?Q?7Xb5nFS4s5vBIorZiICwwpJrlksB0WVxf51XIHP7cLWJs7EyQzgi/gKt0Bxu?=
 =?us-ascii?Q?8wKG3ORLpcRVayiEPJPtPm42tO031bEP1cLwfmXKuj5BeqZTymxyzcGpGbgf?=
 =?us-ascii?Q?A5x0ywj2LvbIcnUUxLUs83keWcnQGkpakfQCtdmaHf0oYOn2lqK1F37fSlsi?=
 =?us-ascii?Q?YFF+gKtPUdvbRfBs/3W0oVbVYpSSnBmFXvrouO4ZYSDOpU2f7Ir1cWVXVDZ8?=
 =?us-ascii?Q?tVRczP/E0yezMFVum6rZbmyzIDi+rXoaawXZKbN6n1uOVz44stHA6iFK83VN?=
 =?us-ascii?Q?VJGSQ2z8oYm21yJ2g646VMQ7cvX9ono=3D?=
X-Exchange-RoutingPolicyChecked: RHM81r0ADUgm6jnsmPoBIDScgSLs/4+7QWlhJerMvFVOmF3iQOfmQXCaP8o+1FkAVUwYlLQQA2Q5HMQQvTw/mbIQzoDZWcB7PNwVmOmII2O/PRNEjO91Qy2w64+JXQR9zzS9opvHvbOEakmuzk/RKJjC373OwfPw8DYwRZyDwTY44DYQmOYM9p9ux8/6+t9t6xpToSDNpnQuLFI2+inEA0Pw2vjdqn62LUY+vy7gfgBpzYpEQbQhowavYxBM7euk2rAnUqQZfqSSLH90mBoCmh8hFILSez2KTMKhrFP97PCoTmGiIJmOvgoCNLTlx8jAaTjh4O09bTddy3tM4qQAVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bcad1a-83cb-4b9b-828e-08ded90f6479
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:46.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKn2vmVHdeP1xOh+KrpVCNySUZuvrU9z/YFZ7xGFaqPdWagVcn2sOFFPJM7XgXzlbUhkBKESjsMADCDpr2jAeZ1gd7QvgaRYl/Gu6qJ5Etk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Add stubs for functions used by tools when linking without the
full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
igt_open_forcewake_handle_for_pcidev.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_tools_stub.c | 77 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 7 deletions(-)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..71c850e2f 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -21,12 +21,26 @@
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
 
-/* Stub for igt_log, this stub will simply print the msg on stderr device.
- * Domain and log level are ignored.
+/*
+ * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
+ * The type is used as an opaque pointer; this stub always returns -1.
  */
+struct pci_device;
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
 
+/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
 void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)
 {
 	va_list args;
@@ -36,11 +50,7 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
 	va_end(args);
 }
 
-
-/* Stub for __igt_fail_assert, this stub will simply print the msg on stderr device and
- * exit the application, domain and log level are ignored.
- */
-
+/* Stub for __igt_fail_assert: print failed assertion to stderr and exit. */
 void __igt_fail_assert(const char *domain, const char *file,
 		       const int line, const char *func, const char *assertion,
 		       const char *format, ...)
@@ -49,3 +59,56 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+/* Stub for __igt_skip_check: print skip reason to stderr and exit with skip code. */
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
+/* Stub for igt_exit: tools use exit(0) rather than the full igt teardown sequence. */
+__noreturn void igt_exit(void)
+{
+	exit(0);
+}
+
+/* Stub for igt_debugfs_open: open a debugfs entry for a DRM device directly by path.
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
+/* Stub for igt_open_forcewake_handle_for_pcidev: in tool context the driver
+ * keeps the GPU awake; no forcewake handle needed.
+ */
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
+{
+	return -1;
+}
-- 
2.53.0

