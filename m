Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40404CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E282B10EE26;
	Wed, 24 Jun 2026 08:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhXjLfAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE51D10EE15
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290898; x=1813826898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bTnprVtv3TsDsFfyR8YUdOKAc/XhgUGCq7aaikYxkoU=;
 b=ZhXjLfAy7U4gUrvnD7MO0Q5RJLfABa43L+vPDu2pA4kYK2gpcka47ym7
 u7yJ0Eu2RaX/dmONTBiseAIhz3Kni/WCR5ivM/e6xvtDa535q9s8hmTZl
 Qm1Cq3yLY/YBT/4UqQbixNfC7U3bC2WBX4HaEi8kU2j1h2FgQLIQcpl1L
 9DPO5i3RJ99/nTSe4wLFEDRg57QkEh+DrzgEFllINKZEzPX3Yl4w7VAsL
 6AuTirTr/X6mMZAKC8eiObwy+FSKdbIcxBsuiMbfkO6CdzE1QbmDSQef3
 fVw/zp1B0Ki6I2MUDDDSYVdJ1aHjExhRq09DJ4nEiowZPH2XfNmIHgslJ A==;
X-CSE-ConnectionGUID: KKpcR+zVRIGPwoFoNUGsYg==
X-CSE-MsgGUID: W0bOt0tPTQyORSuDtjOnCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93405082"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93405082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:18 -0700
X-CSE-ConnectionGUID: KnucvOncQqauYKsdco+1HQ==
X-CSE-MsgGUID: dHUr+4dbR+arS2tUAn3knQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="287900107"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQKkMG1HGaOxSpft9Oe7JM67zvSiRXYJEdUMNaV1QWbJxxRewI4/1Rbgvit0oU1ad65PFID/QECe6/joX4deCZLmi3GAohIo5I0MaG3RiRcg89tJKRrdEdLLk0GIhFaEuwFXD/DU1mATyc2TqDvo1S8ERhLERK6mwPO/tuMaeAZR55CLt6biXeHtCNoLIuuElE+jjHnE484Y/Qas5w4lkLQriRmKZTXTJuGbztoeuIoTvM8QE6zsvYAt773vUCFeJuv9WMG5PBMSVfGRJ7jy8M5cxOiNCjQRtjrU4CXzy6dHMX5cp1Vp/MIopIdcD+S+dpTQrKuP8d9qfNM9cIJ0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiZHPmym5h7hcl2Tk5D9L99s9/rs9+ygvuc3EdZOMQM=;
 b=Gxo515kzV6W0TliQX+o4KlaOFZ5EIpM1c8qI0A38qUahVibfUl4cIm3H3N6JGfL/oydH60HOnUd/fN3XMguF8AnuidV6Uz4BTR11w9CNMs+guiaDdHrxGtJSsUlKbjBrXSzcrUWPgZyjQOI7AYKF/I9n1QvfOA5hXZAFjt7sDjZyWw6lcGZ6tsdMn23+fn6vuH3q+jH3mpQUbUMYt6gv7DjTw0obTcM/9od3bQrEyw3nBEaapfOICkzXhlaqvMhm0siJkysyEn8SEYfUU0au6DXmm6rP8CPGhroWfFFPG7ieiX53Pquv5kIwv1X7nztf/GPlIrXizsIOGKdV+PkHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:14 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:13 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 24/25] tools: intel_gvtg_test: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:31 +0200
Message-ID: <fc3ed62aa9fca59f6e8c314224541ea5a7484774.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: df59b87d-8f77-4aa0-21ec-08ded1cd53c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mEspmpXrILpA7spPM4s15sJaetLEdfA1Wtq2qnyT00tmE5lqdbeBftKv4lfG+tESmtstGbp3IfQDembbDupK0fQMWgq1fYKKBN0qExMm7wfGJBB6aU43NMlS/AUeVpGplXIHGPfuT1h3jNVvx1o3GyQ1IMWLiSa/DzhoivbkwNCHCe47B/vtiIBXzlsgNPgfvCoGGcSHg7GRoyaF4ywEtU8V6OMny8Gm9ceaO/QHN966gOpZThIWCGXsafvttH0wnBtVEyC0sGLZclbrNBcAFNsW4W6o9pT8IyrvZXMkEzdLl66HQ0wx9ygY/fC/zNFjP5uAyeO5p+jj4lBnIwS8muea76IZcIvjYQn66XgCtaJpQF/ClnWsuZGp+JcD1nKFIBBZ9ag+VzfBpFCeUeZC1OtcTEXTA8L5ZA6KR2ulPfcWgzFTsK/oIcZwiW8GWiQ5/QFmU8FMDtxWed+8vxYaWnmJA0L+6LZbQygcCngjt3vttCGWj2UQH5E6XYM0FUOJii0Gwb0qEa7LpG/JDZGOAee6CZ3R6imNGvAzeOSfWMOwEGjGaXyl1TBtrFYvCjQGcg+mrs/gs6wV/0ue6rSTSB8sWNeu+9XR/RzUppzZpeec7/xtjAaHCkn9h+Wm6hvd58cj8yd1VhDeB0aO3gXg1d0XSQX8JIz1cuFh09dMti0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cAlgN2QDa/MQvSqrzxva1IA9dXGHVLM8Cy6AQ5FyhhdqSWPbyJuuI8nXGVE5?=
 =?us-ascii?Q?4pTatkAI+atydjBznmrA3utkecK6gv80/x82IjFUC4k2BUuy5IySxpKQT1fq?=
 =?us-ascii?Q?secXsydCSSdcFgv7pWKy1pSstrFqa1sNRSIGEMjm1iFN0G1e/aDPDWZTBLc1?=
 =?us-ascii?Q?MCmxfCk55zgZRUWayDFy19xhXaXSoLmDEE5G1mQAYLV4S3aTMJwXcJxhb+yy?=
 =?us-ascii?Q?AscYzDhMEAiNW6NkA6M3uvUfkbT6Iqx2hK6qlZ0MRc6lQQJhUV7rClSfCE8S?=
 =?us-ascii?Q?6HTzlNRM5rDw8KBeJV9bx/BzfTwisgTOQLkuIwYCrzZXg0hXWq83F9Cnm/pn?=
 =?us-ascii?Q?VSZ2djINbLyYgYnkYmojwMKxXykxjVJ5nbh1v4UDqUCzrMBo8AXSPKSf78Dy?=
 =?us-ascii?Q?ym2VQQWBdRtM/iOFxap12eOsQpXBvsa1NpsbNX69jOQVPP2bdgWiEDL/w7Tq?=
 =?us-ascii?Q?IYbnTQX7WAfB1PCd1k7gC205/9k7ZB3pCyHbS9UthfRz/3GTJY1y6e9cT6D7?=
 =?us-ascii?Q?D3Ev5t4+aF2HII+9seYGO/LQLAEt6sP7RHUbq2WTRo9jMwFgJs8hnK4Alp6w?=
 =?us-ascii?Q?qj7dKU4Z84S4nyXKmWMjUUQe+oobmSwXE6AFHdyKUuKQQP5jaYDTV9md/EGf?=
 =?us-ascii?Q?R6xcvu2QEIPOQB9G/uSnxCU/zpGu0NcsOtKpOMhr8liAPVcU2fyXy8h1Pwze?=
 =?us-ascii?Q?xr4B+Yw9Xi+zY3shMGebDje+E+kUjnbtuDnp0GB3OObYW3229vz7xeaScZR+?=
 =?us-ascii?Q?92wgWPSUJzcSlalztxbbhLhIT53ifxEKAjlgg4faKjWqaxPdVSLVXZiIfGCW?=
 =?us-ascii?Q?gSizMsl5XLNR7OYeBAVB9JCeK15evk2RaD/alhk9rybdaIdDau1UqwIRVuIq?=
 =?us-ascii?Q?5dtAHcut34H5+ra710g0yu8NixwWkoQk45nwhebFm3gVxn7ZuxnRujylvg8U?=
 =?us-ascii?Q?Haq1/d8sgF7eD75tiiYshGTomNopp9bEtOfUqJ1uxn4g2xkdbJ7aO6ivpiV3?=
 =?us-ascii?Q?xeSHLOcrH8m56yfJaspcrdqiaVMWyy5CtcLcwSSha97aD/dPpvLK+51II5sB?=
 =?us-ascii?Q?zsnb7ty71EDUdqgmlVmBKxRrNMQlFMB1tojjXcwzCA1zttPgJHhFpECW78DD?=
 =?us-ascii?Q?CDj3EEQI24HwHpqj+hDEBgGoSo8/konlbXi9+zICoZl8e7OkgI/287MF4QhL?=
 =?us-ascii?Q?cS2dEArBmJdyqtXLtNsce0wE2OROMXD9VRL1blUKqYRineleSJ05aaxz5JoP?=
 =?us-ascii?Q?um7xNBQbXCWueqk6SGV+/xHrOSIXzuuvMYz8QOilMDywlTTth0/pLnfp7VrJ?=
 =?us-ascii?Q?o6iF7B37Fi+jIdSgkpGvr4+FEP/E+aE2q2jvkOpL8Xo2qxsZaBJQqNsGd2hU?=
 =?us-ascii?Q?oRw29SCkEvCyYJ0KIbvKxN/GEjYvgcymbmIY0BMrkTqG7ithnfgDHrGqo/+S?=
 =?us-ascii?Q?7YkI8/R/ppzV8uuF6wzalk/nZ5fe4TQnnRreRX+U5HN+AoE2OqNZEIIRzy7O?=
 =?us-ascii?Q?ckMqwg4IICWgZ3SUfB8balClOZk7yO1MmRXIB0nk+Z4fbOq4iQGoJlWc1j1L?=
 =?us-ascii?Q?5aBVZUH4KFqbJMsnrXnYVtTQcKmq/BaRiCVP6M8TJ0kL8dW2QOZD+PjLpGIH?=
 =?us-ascii?Q?YpUll9SDyFnnLPoFDSlYjfpsM5a5mMTR77xC/h3wYzTsWSIO6EL8htmbgk7B?=
 =?us-ascii?Q?t4nuSEd/ztY/uBiEnWhYYgx1RdP395HR7rXRviWsrFW/hSxQqwIxgNsa+GDk?=
 =?us-ascii?Q?skZmkc34nWzMN/3bzsu/nolQC/UWiB8=3D?=
X-Exchange-RoutingPolicyChecked: Py02UfGVHS2MFxzqisBXVmvDURKJsJMmU2uJApmgqHNwdQh+I6luVzONXq7kJPxl4rvbFDgTpW0o7cdDCtbCWyYS0OvGbVurHtrJn2GHk8OY0wTFaU8od1Kguqkd+P5VkI3ru+RM8TKzV1C2cHmYPuEnGyofUYxA9Lgee04wXk9ezqeQGepeoYNM0KAv2fFUUltxSS6PA7qjVz9b2LDC4+E9eJnjBBeX0Y5C8lI9gLZW3lUAhnzPLGGY1jMVvoFydSMjR1o8LPFPAY+drbN6st1wVdCq2uUiJ85guzzIoRjBFRtud8MpsABnIuHzhUXxvRpMP2Amf+Ni1cabW8eo7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: df59b87d-8f77-4aa0-21ec-08ded1cd53c7
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:13.9470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aB8XVD/UA7VdaMuwW+6UX2VME2vvYSsdhXxhw/2nWmfEHrTCgL4mNgpiqAjTEWTeSMs9AZvUSbvcDUIDNjfZyBLwh91bASDQED3Xvi45bc=
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

intel_gvtg_test only needs the core assert/log/skip helpers provided by
igt_core plus the lightweight tool stubs. Replace the monolithic include
with the minimal header set and stop linking against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gvtg_test.c | 2 +-
 tools/meson.build       | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index 408e703bf..fe8f7a599 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -30,7 +30,7 @@
  */
 #include "config.h"
 
-#include "igt.h"
+#include "igt_core.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
diff --git a/tools/meson.build b/tools/meson.build
index 82d569f46..0ebc906ad 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_residency',
 	'intel_tiling_detect',
 	'intel_gem_info',
-	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
 ]
@@ -132,6 +131,11 @@ executable('intel_display_poller', 'intel_display_poller.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gvtg_test', 'intel_gvtg_test.c',
+	   dependencies : [lib_igt_tools_stub, pciaccess, libdrm, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

