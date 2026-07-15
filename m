Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83993C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4BE10F028;
	Wed, 15 Jul 2026 12:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzAF5yUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2698610F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117771; x=1815653771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wng848a/e821nL84MyP+DUh5MGBmvxWae2RNSFVZkic=;
 b=TzAF5yUIZCrYmNXEXgbq0s4GTcqCTxEVBWhsm0tkSPLYvJPD/O9gCuvr
 msdAV55C4ECagPgn9wXR2Gx+h6q7C0H+eMlUeOqP7P3dmyMB3qP55Urs/
 g2DUsdsqn3m6O+mClm5VmD51S4lrsaVt9UUt0NmdapdKybZW/zdIY7lJe
 N/xvM2Yci/c3LnKIeaLQDiR/DswqkL7bB89mEKE/2DUIwSUbsea7hVXEo
 e9dMgU3s1g6skvtnv9/oU57cIq3hgi5cqHnOwWwQIGKAo4gS+T0PkSwyL
 IDoPtIHZmcqH4MYhte8X/MTd9B6KRthxkH57B1gfq23GUPYt2ZeF9HeFo Q==;
X-CSE-ConnectionGUID: OQ5QkzYQTvSu5vsthEK3zA==
X-CSE-MsgGUID: CJ2BjXwdQ4KORvJ6/l/NxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108151"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:10 -0700
X-CSE-ConnectionGUID: dT2AnFd1SC6I2Sgq2XKh1Q==
X-CSE-MsgGUID: 0gagrb3pSnC0wQb+QVEaUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252210399"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:16:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AszhoE45IfsjQCmX0OysgBpnkUcEtSoqWgZgkw6v0Teh7pEJiD+X2TwyNJ0C2EURipU/bA/4/lkM1HC95ruZgQATew2khmluW9NVL1jR/NXuG7te1/I8xRNmeC0lQFWxth8V0orIdZK7wKaNME60ALtaWHprJ5HwbqXAQU8uSPIX0jg0lB0yUIO5ftnv6JbB43+nkwJN1UHnt3GHMrhljMJrbrZyyvkJmeMgTZSuNHKQmGMWfv87/umyq/YdHv96wsDsfBkPVN1bkGyoyMThi/nv+FaB5nRfX60PHweg6cSvPDp7fFye+qM30OXQdON9AgQuAzYgZQ1dG0qC4xnw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkx1GYnQMDjHpKj8XjyBn0+BCC4KsqpDz7TNo+KzUDQ=;
 b=b/4k7q24WJWg8NLH/n3R1LIADTflIWWubLFSVr9/MT2cpRU+CHxNOeR0IpwnP9FZB4FN2msSS3hYExeogo/xRrsTxj7DCUnV7lau8TOuT2q5C6TcAOECl10+/q13Ha3yjKxbgo7Uemw4MV09AHxXELCv1LnqoXBMtR2qgGRSNbWPWbgVHbpv1qYg+2X2v9F8jkFXzCIRI4sHffW2J01WXKXB6nPj+iUCfwMkD0LCxU2l0oT9JauKMrzSsf5yyhMYdQ8PoUBm7Zsxob5Szf3kQVPKWMup9cOg5dRgUUyy24Ajw9rxj1ULeuxxxD4RtxCa3CqkVHZ90GZiGyLzRtqjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:16:07 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:16:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 31/31] tools/lsgpu: link with minimal sub-libraries
Date: Wed, 15 Jul 2026 14:15:41 +0200
Message-ID: <be7357fc0ffbe85e2157ac919360193e40dd8961.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8225d1-481d-4ffa-7b16-08dee26ad8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rxUfkZ5JsRXmlg6LhLdO+TyfCstVpdLsthguyvIcVBTvP4t59jXh0+vsTJ+KuYkOH80HMS8SK41DYaRQ6qWmZ2Rex138R7WD02pw5gYXpGFLo8wwAIuc63n1bL4eP/AUmWWpy+10cJ7SnQAorzqwJwdUbuqWXcHgEOGOTuLKOBhxtiqWC0oTsYxSCRzSoX9ykLha09w59pcn77MOGKe3ggbNAVJWBffDC/7KkijVy2nsSMQKao0S9/puihlU1FPxBMknxwgqReMuPjcPIZoGyIga1J9pws+v67IDywulXHa5ADYUpXmyf1O9VvvcKnekYRm9Q5hQouZ9JNRENGq8NLNQ9Xu1IJVzFK4FEpIMrUs3Yu5fx4GakInWh1f3M8oeqZO2Ye1b1q5+AdBttOAckTX4eE0Y6QPie5cjBgVQ5IZ8oTM6S7zQn/KNu9A4M2e9o7GuwDHQnFHG47eTfTSOkUxyKxx2TgU7KFsCUHgDOFRPiuxijjhKkjr4YRcrn20JQfZJtlU+gP3mGtxHhSN4zJnefGsOxL2po7LAgjXJ4Di18aXEvWQrPj2mdJkhCD4wgylOwgtQmHTiSrF9BeP6XcyBnoaIfc1rIqe7cwxFlmtHVWKl0kzc/090i59NZ9CNQuHG458yxNVYuyVCeXft54+OpG+8BJ+CqmY+Ut/3i5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQmILSDm7faHTEGERkTwRW5AU2Cd2WSBv5akEKVRQPtn59P/nfj3LYVXMthM?=
 =?us-ascii?Q?OAjhRWKURJzIFGAQjjrVdy7T7ms0hnaXbK4CsCzpIOJV7Tju8Tiv39l6ZAbM?=
 =?us-ascii?Q?SlDVaqYksUl6z/WQAPnaPbRYg79jS9TnfngLElvDOykpViLKeHvymRPKzv8z?=
 =?us-ascii?Q?cRadzTsI3rj8kykMUpkwuw+pwapQMiKfqjxBrc3tbamtdnroHC5BoHaOdkOU?=
 =?us-ascii?Q?qImM6yg+aTi+hVD4w1hw97VdgRGqLv+7ZEN1MKmYq9N95hfv32i8JZr6100t?=
 =?us-ascii?Q?06EokSKvHVBqHt4uwTALTiIIkNVJX5Rp+johNNbTuyI/sH5OT0DWBSe4KvQ2?=
 =?us-ascii?Q?e2H3ui6BeNhQNjWkLfFPb5+k4Y7kriiYerP8Rskxwz6ZMJpSSchU9UgYiXbc?=
 =?us-ascii?Q?HPMKWKyPSQZw8++B41lS+vMv/0OzWUeSqjDPQdR3zdBwuKZ4Vy51pDEJHhVu?=
 =?us-ascii?Q?3GggKNORNO/drXEGOVJbR3eRSRhHgrkhNZKd38sb+4xjmrubFJA0WyhmIT2Z?=
 =?us-ascii?Q?QIscWbo0MWh7X+1p8r6Sa18cj/vqjf19veTaIO2smmcAl+t2wxB/D901aNcZ?=
 =?us-ascii?Q?d8DFWXjGSFYpZcvKEIVWoyCo47jNZPALZAuRak5QPDg+slHwsg+ZLrBaUkgi?=
 =?us-ascii?Q?JroHdQ4Fy5/QGAup8pHmqVnqrPGcHeqf3tXwZ58gq3cvWVzVTlwwKOfylFQ7?=
 =?us-ascii?Q?Xq1xxXKsaxau0LTaeb1/xNcDDiFg884QkTKjVCMzBihTF9CSbMnCZkxQ0wHe?=
 =?us-ascii?Q?M1eFYrExuSays2aeZLDXeLttrqauVRsWmt+K4hF1K6d7HGLznO5Qe5fbM2q8?=
 =?us-ascii?Q?eiqyKu96Mi9d9+3YQ5568oDvFr69UjIue/vjOYLmLAj8AQABP1Qmb9GlSDy1?=
 =?us-ascii?Q?lagm+4pH+JeXsY/409vbRdPC+q8U2FewL/TJr1Tw3aaVxfgR1+s8bzlWyBTa?=
 =?us-ascii?Q?9CD/B62tZ/CHbmzcwKiOQZq8Xm5civCbPIcqVeSMY/izdtuO75LtGSHDW9sl?=
 =?us-ascii?Q?d6CawQfi7VF94gflOC64OmgkZJSYZlWarRhPqDO+z04/UBqIqSkuCW8H/8jm?=
 =?us-ascii?Q?ZVnzajNe+ILTZD7pfbE1r4aszh7j+rgc/grhk+HuZFtd1NEgdLDsYUNIlR8q?=
 =?us-ascii?Q?/sZsL3A2xDpVI7XUZYhqK64JlxlEjhtGygdKJWwEHCnvaBop5bwwbQu9ba1l?=
 =?us-ascii?Q?RD8cmL2qFQxNd/faQpbigoHUKlXF4/TID0Yp7wC9/72y4xGSBt7+t5JNJ04E?=
 =?us-ascii?Q?VprIyqU5dBR4Du8k9ADHEGFqtuBLZL0P/okW797K3gtsU/vp563TNTqqCuta?=
 =?us-ascii?Q?8A1/klWEZXl/KDvIFHy8TwIWRS7DlOaS6y3Y/SQrOy5RgerOray53eS5nOGI?=
 =?us-ascii?Q?0jzfeLoazoqk4NPdR+C0EyZKb6Bp0rpHt9cJmdaO2COF3BFVQFMlZKckyIDK?=
 =?us-ascii?Q?Etvp3ZVNPaXbbzEMA5SKQRw60mnJYjC6s51lj0j+8D0ROXDdGRUR5k52+z6H?=
 =?us-ascii?Q?dxkfF8Cfp4UEn6cRfkGcuWVzpEOTnpiyV5jXRHceLoPJRk2hgwaln8WHUxJB?=
 =?us-ascii?Q?GTfOQhit9sF0L/3aBjCJZEUYZoUXmVBV7Mu8g2+QwD4hUdWDlORacXGdO5TM?=
 =?us-ascii?Q?a4CDe+55JYWmFqcF3IeavmL8oadAg2+08wXEh2BUUY1xQSAFnMuiabaLrHlO?=
 =?us-ascii?Q?CKnuop7lzF146fUtoE0NNznljOS7SMCpqOLuGCu/Goh9r5UlWpEJ5IvGKaFX?=
 =?us-ascii?Q?w8xD8sIi+W91L2InXPaJF6+S5WWZiUg=3D?=
X-Exchange-RoutingPolicyChecked: bQsbiUWX+4cZAmD9Um4pFwvp+r6h7/alwK42zXgD5VxrcQGAUzJXNqQiFY37Xl7K6SpeshAy4qs2/n1HYVkmJqT/wk3sMgf+P8JHFnA16MlVwWHF2EQctI3Ge/rrreXQ+lV9xzAXpIT00khAm78xmfyltWZNBKeskqp3yUqcUMeGq0Z9omzemPZCRVgRVGa+slptZPxCI7zpf0EomIklSM/3isnXyH1+LNyBct9sjKKAGWfNoqR17CSpHV2lbuD2qC1SROGZw+e4v86JhWkK6FsCzXLiCEGpgmKTHdBgPjqqxZ3Kfk5CGQqYAHR+vSIww1ogF/hC25iMW6utb2Y/Uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8225d1-481d-4ffa-7b16-08dee26ad8f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:16:06.9457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/ItL2vl7TsmqJS4V3bf6vm1FypthYrW0EmIG8mVyoa8N7T/4HUyLlMS4feZFbLkooy9Y69ZDnaA7NUdAHnTNTn6iBj3bCWxp1osIWvH3BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

lsgpu only needs device enumeration and the lightweight tool stubs.
Replace #include "igt.h" with the minimal header set and stop linking
against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   8  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/lsgpu.c     | 2 +-
 tools/meson.build | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

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
index 6e694164f..fbc6c0a00 100644
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

