Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC25DCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821DE10EE25;
	Wed, 24 Jun 2026 08:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBmwPoUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F7110E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290901; x=1813826901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hLUGrOFeOxHYG1oPqW0RYeT8i6UyGtJN6pE+0SU9GXE=;
 b=jBmwPoUc625T7m4J9BXI0zcHN4Q4jUMprnfw2ej07WvQmHduYMYJIBeI
 5zV3nXuSoJeWOh9FAnUQpw2HktP+eUHrvd5SfFKTLVXNpk05/ockldOyN
 C3nq/Gl4Otr4AcVVOrQDAgBy37bV8Qg2quPihHKVGpM45YrmeGy/hm5a1
 F1Yq0IQtHQ2M/seMciJn2FBIbjcCRs6YgJ0mr4RD97qTnBsXDmo9sUTCY
 sL+0zJrsScz+yRiZwST22RRx/CXKnauct7Eg85f3yS3Pog/JcZObT+B5H
 SmjcMma/xPUOktEKwpQSDJBZ0SLlR3UlQEJjiwNQBWHxYDuBkKzKjtyEh w==;
X-CSE-ConnectionGUID: xH3GfFTfSBeFEvrilvP7Eg==
X-CSE-MsgGUID: v+/uboc7TWScmh5ITIkvXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93645386"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93645386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:20 -0700
X-CSE-ConnectionGUID: 8Wd8VoKAQ+63tyxiPzeVXg==
X-CSE-MsgGUID: qQKUwEqUQPO9dCpuyZXF8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254755684"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:19 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMFy6HE6I3xAHvI6PoksjpG1aHF1ppbCZ7ieAzdllWXsDYDJK2wSb+KQMR673769+DX1pFg8Szlh0X3QIX5a5Ctw6roQMS00acRK4ga1iCidutVZ4SYNc7yiroleGZ+dt/aAhTzjYmsDwX9gnXoKBL2d49A8SgHs3nOGqUHLScR44FiNXRTEpI8gME8l4+6PFjvlbVed/a6BN11F18Fevj43IdN2SxUGjPZjQtYA4H2nbhyLlsPe0KbynmmL+mQjr3KqUyUgGloQQExMcAwE4c78LgtUK5mjfgnWwCJjoes45WbLmnT/0NCrQTeiKq0FTjvu/jmgGnVyazxX+FaCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3zEDd8BR41n0kGYmMAr6K1RiNpNDJUJNhaawlQHMJs=;
 b=sy7ZHcOJyRCvN+Qq53t602GetvyTsGf6FKnVZ7PVO+43SAOyjyXQ04bx3lPX/Q9kcvunGa1lyVCRqlbzSiY+VmZqpSvHrJywrtCTLJN8s2REWUfY3K9cYnJY+EoFPRn/Ua+vOg1risbUtMjeg3TzxQm4aNIziYAe/ZzzNNhCltVvKWswyxz2riKuSCap9mPNkpJIh2rGLeTEyAf+rlZ5u/H6LwyeHDI0H/NAjOdOeh5nd4fuOYffcvIdAVVwk+qDNK1ucGqAf1RatgJbMjh/Y12bjjiItAtiOhWhpGs6szCVqcIK830nVYQmuXjDT5BsYoLW9R6t8b18LjIwY0pPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:16 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:16 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 25/25] tools: lsgpu: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:32 +0200
Message-ID: <430550dbae617e6b4c04401ee8c0c3cf78f56324.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1097bbdc-5151-418b-89da-08ded1cd5528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6S9TJJnIxZVRuptvOINDPhRGU2ED/9b6WmlACK00mYfe3sAKdwhibyCq8WloC08cDzmZ096maRFpiOqnZXCDIc8ggRZ8ECUSP4OBL2EcZ8nFZIFPvkObJuWV7VowlXBrzBc1clAAWeYhrpH2w6ejMit8zuGD3I9rudGXJJ7YOpwqkiNXu4kKI6R2Z7Q2/lxAwheM8kiVGJXyBwnhX9VwS6/DzTpZGImCD1X1Mg8DnYH1d5/HvxxM+ipFLnbyPCI5AM3pbnW/i1NORIn90j/WgPCD/gGvY9fvswGFBXvR0ZlGCh3TFUdP4+0WTazsYkdzDC5m89rb8I+anHPXbwyKBhy2pPoERemKmMQI3Jy5bvWiFuevUN2aUC/nAn2xNNo0X5bsT+mJptMFwkF7riIdNTfWVvvzRnRrlWDYcGj8wE6npzarv7E7UWxVTOP7lNP/zFN2o1EPtF6VHelgFQo52cBFSZ5pme/24dsxIutkI8tQ+1OHNjEQRBipWUQiPY9ZjKwQcTeiM7+L8xQIwzso+4fWLBVHjOwrj0+TsZx2PMCSpXNGxbFprQAErLAufVPqkrkAu8nRjhqaOa+hq98nLGySS4YmIODsfMA9b9a450+RisABqHUsOUAwUn1qHlSL8bNQotD4IlMaoc+R+hXE8fWXNeAkCJjbijyPvGE4quo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZxwBaahg8dqqlf5vIZZoCkz+gpU3DoBR3/2KKApmFIVzje7mNklHIiyFoI9o?=
 =?us-ascii?Q?zXNeZJ/qaIhsv13ZfgABtr5XPvjRnHgfiLTiG4iHEYjLhFPBZ3cQhHjmPU8x?=
 =?us-ascii?Q?IJnScquAA24lBpuJ3ZLS/fi2gvagGXl+3epT+GYlnhtwMhit7su4u8h7Plo9?=
 =?us-ascii?Q?Om/ZOVT5fme2nSXlqLhD+REZSiNTrrisnUxKozPtyUE0ZsUqC/0yXXpiigk6?=
 =?us-ascii?Q?TNRflfDsZG4FygQbbmVQ03c6cHwX6HcJzzwWl0vNqYHqAbRgOQfF7yS8hXeB?=
 =?us-ascii?Q?Tr/NRmZV0VJ+2IgLFYAagJkrsNilRBlL82C0v0zx+FcB2cLll35W0rf74ahg?=
 =?us-ascii?Q?FIktu78DpBDaT7v4+uWxxy5yJ0mSw31vzxyWIgxzjJ2LH0lny044KLwEF+qA?=
 =?us-ascii?Q?4VxZR1lJh9Aggui1D/GInz8ivrF4txI32PWvuv81ryrOeIOx4HQCTM4lWLKi?=
 =?us-ascii?Q?Y6xT6U/mZ9+gUdMHtEYKxM+1W+x2WAFipfkGVt0Ae4daeTmT1Foupzck6FKm?=
 =?us-ascii?Q?PaJxf/He0nptS/mFzbdV5KprSALCTkzdsIuLFoTnefbuz41B4QzJ3AIU5cxs?=
 =?us-ascii?Q?Yu6AmiO0p1iLaJ5Qxrf4LAkp5UAw7ENF534jmGYJ3sNKHLSTkisJB6+wvBFt?=
 =?us-ascii?Q?u75pQ1yfbRJHIFQchCMBnWaNsHGhBg9d1tqXGS8lcuaEwLVD0Tei//WZ3OU3?=
 =?us-ascii?Q?zJtnSlKiu4HjGzEqgK5QZucodeuUQWVnNagWiFXv1g2J1ttbVBXyLUclAuCn?=
 =?us-ascii?Q?EL9ENxZS2rfifDrQVlNBdryjSJvii16UO0y7PS9J9I+wwAj0u7xLZMjzibsX?=
 =?us-ascii?Q?rpwKxLXDvbFyZmROaLGs8EJ6sADo84hS1IlbTN78LLIlt3fL8MsjkZylhU10?=
 =?us-ascii?Q?8faOnvR5xoQAlW3SiymgoqUPD7+Ik5tnmituDgm+Q0a2O2voqYdSmJtuvtBm?=
 =?us-ascii?Q?DT/ODhgh+rBx4PUshKt6MyXkJYpyJfwFcrgu5Zh9AZeURW8iZFnvRi1F6y3j?=
 =?us-ascii?Q?EGwSw93X2mAhxGZG/ytNe8iaYVmk/ClWV2x43GA+SBjxTl6cnVUsZbxE1/8I?=
 =?us-ascii?Q?spIpKVh42B6EmyDtvg35hU+b2vQc8M25bfwetvm2Yx3GTGj6AgTDiyGDdygv?=
 =?us-ascii?Q?mWeEZAE7xAXL/fFZZFTg0QaXNmP0gZl2eA/fIAUXUsp/2gX5UZid0gF7MSum?=
 =?us-ascii?Q?xRXAA7BtkeSYikSVMYACfNzEaKx9HkwZlHaFwp2wNdVA+2FOGIMSVVyJOaN6?=
 =?us-ascii?Q?vCF2QUNCUyF9shh1vXXcG1NFtOd+c3k2Owypm6/C2vY6xWYRwGsak20oEsBO?=
 =?us-ascii?Q?xZVgXFQN1yD+8Ph+CZu3fUvAHDXZlU/Mp8fgCT5q98gCpa+DdRTM9ra6LMR7?=
 =?us-ascii?Q?KCAuZQk22sk/nPRRypjE6wKM3PN6/7J2cIoBsd/Ob5jiFZZ8UKJMNEXQNNAS?=
 =?us-ascii?Q?YmmB8CrglxU6cqo+3jT8810BBo5x2wMAknEn/SGE1Z2Ce0c+XCOsf7ffs57O?=
 =?us-ascii?Q?H4OIXWvy9ZLC4lqiOdqCFzZ3DoryFIbn4MIkS8x/PJraEj9D+DEw8/gcsj1I?=
 =?us-ascii?Q?eYSR7QIRx4ucX6tbvRmzfM5tPVBthqeViAcFQ2lh9cFwgXqh7LrQ2TfoMDZ5?=
 =?us-ascii?Q?sb4ZHhHMVoKlM6Q8rBEDNz5vbPvA7PEyr7UTwZa2MSciRJSvpVhjaawOJsgr?=
 =?us-ascii?Q?6O4Ev2DQ3Hxx0jr1dvlAdAokLHnBNvWPknRQpfG+8p4g5Y1vGXQH6OymAmmS?=
 =?us-ascii?Q?hHBwUjqvSjpGSihgaspKgcxXvhay8dQ=3D?=
X-Exchange-RoutingPolicyChecked: EcbvtKwmzLqcWQAefOJxdaXvWMJIcv7qoAtaPraCXR6eUoLFxEJgeoctHuxY5Wrne6Hp/6NTpI5gPicvPBd6nT0vYin+I4cIElTm+vdx4IYaQqFjOdG3J6Q+usdZA7kxWRq7UPnIsHMizNXwODl9rh/4a6O3btVtrzUCR0A6IW/huBwIuDwKr6Bq5iVLh8XdmQXAIG+gK09VOQqlPmQBjHKuW0KZLdrGzW0TlMx3tKNhsWuVe/3MhNDOjr32oyLhE6Da4wTQBLnKVYt/6+DWAMAwsSCvGuOzF31mLq1itVRJfDNhYTxBdLNKogDIZ+rUOwU8SEs/aWEqiPar7KD0Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1097bbdc-5151-418b-89da-08ded1cd5528
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:16.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WB2G8LCapKEaReIAeZBxD7dXUiBd76V4I53ZEJN7LL4c/BQam9YUUnHztsuDSB3xIjGON1T7uRfihRMRSbjgClCvJzeXL9Olz2pVqBKJbWk=
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

lsgpu only needs device enumeration and the lightweigth tool stubs.
Move igt_load_igtrc() from lib/igt_core.c to lib/igt_device_scan.c
where it fits, device scan is the primary user of the igtrc device
configuration. Replace #include "igt.h" with the minimal header set
and stop linking against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   8  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_core.c        | 47 ------------------------------------------
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 tools/lsgpu.c         |  2 +-
 tools/meson.build     |  7 ++++++-
 4 files changed, 55 insertions(+), 49 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 5198d4ec5..b6d2c160c 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
 
 }
 
-/**
- * load_igtrc:
- *
- * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
- * home directory if that is not set. The returned keyfile needs to be
- * deallocated using g_key_file_free().
- *
- * Returns: Pointer to the keyfile, NULL on error.
- */
-GKeyFile *igt_load_igtrc(void)
-{
-	char *key_file_env = NULL;
-	char *key_file_loc = NULL;
-	GError *error = NULL;
-	GKeyFile *file;
-	int ret;
-
-	/* Determine igt config path */
-	key_file_env = getenv("IGT_CONFIG_PATH");
-	if (key_file_env) {
-		key_file_loc = key_file_env;
-	} else {
-		key_file_loc = malloc(100);
-		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
-	}
-
-	/* Load igt config file */
-	file = g_key_file_new();
-	ret = g_key_file_load_from_file(file, key_file_loc,
-					G_KEY_FILE_NONE, &error);
-	if (!ret) {
-		g_error_free(error);
-		g_key_file_free(file);
-		file = NULL;
-
-		goto out;
-	}
-
-	g_clear_error(&error);
-
- out:
-	if (!key_file_env && key_file_loc)
-		free(key_file_loc);
-
-	return file;
-}
-
 static void common_init_config(void)
 {
 	GError *error = NULL;
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7c7995224..a15a4624e 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -33,6 +33,7 @@
 #include <ctype.h>
 #include <dirent.h>
 #include <fcntl.h>
+#include <glib.h>
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
@@ -2477,3 +2478,50 @@ int igt_device_prepare_filtered_view(const char *vendor)
 
 	return gpu_count;
 }
+
+/**
+ * igt_load_igtrc:
+ *
+ * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
+ * home directory if that is not set. The returned keyfile needs to be
+ * deallocated using g_key_file_free().
+ *
+ * Returns: Pointer to the keyfile, NULL on error.
+ */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_env = NULL;
+	char *key_file_loc = NULL;
+	GError *error = NULL;
+	GKeyFile *file;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	/* Load igt config file */
+	file = g_key_file_new();
+	ret = g_key_file_load_from_file(file, key_file_loc,
+					G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_error_free(error);
+		g_key_file_free(file);
+		file = NULL;
+
+		goto out;
+	}
+
+	g_clear_error(&error);
+
+ out:
+	if (!key_file_env && key_file_loc)
+		free(key_file_loc);
+
+	return file;
+}
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..7d6b70b9b 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -34,7 +34,7 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
 
 /**
diff --git a/tools/meson.build b/tools/meson.build
index 0ebc906ad..70b168a82 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -27,7 +27,6 @@ tools_progs = [
 	'intel_tiling_detect',
 	'intel_gem_info',
 	'dpcd_reg',
-	'lsgpu',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
@@ -172,6 +171,12 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
 
 install_subdir('registers', install_dir : datadir)
 
+executable('lsgpu', 'lsgpu.c',
+	   dependencies : [lib_igt_device_scan, lib_igt_tools_stub,
+	                    lib_igt_drm_stub, glib, libudev, libpci],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-- 
2.53.0

