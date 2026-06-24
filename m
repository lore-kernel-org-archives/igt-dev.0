Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C6CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E674410EE1B;
	Wed, 24 Jun 2026 08:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XF0i3D2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4A10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290866; x=1813826866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Uga88ys/2s5ub4+OPRW8offb4Wt3kQTHngasRBjouP4=;
 b=XF0i3D2BzMRhWXPDI+5qIUcWooSL+HYxoR4BKkBIAl6QaZFdCKeBWZcL
 jo5YFf0hXrOl5QYdjpB7AlHxVvHSBJed6kldSvzg96v3L6YsEsX7+4o9t
 mtYZ+gENmn6NruZouUoufXjoD6ykMDJm71axdOS1QcTnYnoZgNBcCtfXy
 tcM4B5MNjoTq1eoSUxwSCxCg/8+WlM6wlD4/PJSkFJHoSPjvxvf9Wophe
 SnL4N+HzUpJ3VXsROTn82r2fE4XFntYMpdLVbBx2qQ7RbgPz+H2zyK6oQ
 KlC9Hjc1ftDeCWK8d6YX3ilNg8C+sMegTjumRPE3Ph9KNdqmEQBPNX1hl g==;
X-CSE-ConnectionGUID: YpCq9wYWSMynQHrvzkoPqg==
X-CSE-MsgGUID: e9nHhzzfRUiUXbn1OszVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105841227"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105841227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:46 -0700
X-CSE-ConnectionGUID: gB+zOU7jRKKiReNCg4dHTA==
X-CSE-MsgGUID: KG0gSSInQrakFzZrEJDexA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="248880802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:45 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLGjl2HfQRCCiqPTAfrdkhy91PdaulTkh5NRUEp3Cgpu5Wzrp0KGdFVKh0yT8fQK1A80KDLFCvEFMvTbgaaW8zWkdpu+NBLOo5zaCXV7Q8dS0o7VLvANA6uvYfS8eIJUKDG6Oor3BLRMTrPX+3bNENGk7hSp6iqrwbtoWl+imS0DxwA//dX+W1HsUk+Yu+dbJlo5dZ/0LC0QuNo8Yinv36+iuhfuO0hrY7pbj14enmlgzz9Bq0iKdTVkKDQdcGOyoolk7/IPvI+Dvj4js+KY7x2dpSEdJLvS0rifcqMOLYCtPEkoZDnrRdqC1McQEGAGEJ3FlSMYeGi27czvX9S1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX2mEuUUhy4wcU7HYur/8Y45bd1sXIRsPlVSgdLiXQU=;
 b=GA4YsvMzTNQwqcV9oe/R5hbU/5WIA6Kj1si7xriyirK2IjV1xkZTPuoR9hwQIKK30J6x40b26pRh3y00f0ArWAGhGvFiDYDZGRLMGUg1dJcsNUKDw7s7EBLP2PG9jvFasJggmMH91cePDmPZ6X6bx6e5eg98CEdzSHtQZE8Mjok843RYzmsQYymP96krQqXvEJGtQRNJ9LmuGAzATECMGmBfmKIyFmnZgNBsIIi9yRrTuxU5Kv1JXybuEAGYQRF7mKXtQdu9S+TDib4L3AXDxjkJvmvBlE6bGdyvxFN9HHAlrdvb4MQTGA1N7oL+uRZRnI9qL4hbmcikJtxJtNJR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:42 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:41 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 11/25] tools: intel_gtt: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:18 +0200
Message-ID: <c9486d29d705e30aab6323a758fc3ede94cff37e.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07f23bdb-2a26-458f-344a-08ded1cd40b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 7kJ/riQgPRbQEw94ASShZYpZoK3Ts8IVclkj7frpA6wA1B14PJcpeh6eKPn6w2C0wq1fVanfKDakKwGag/XGY4cIcUu0kz6Apvjk6bPF3FVHj6QBjZ/iugEuKI1CF6bcAnbpCUOSp4iBAa+FKFrv63tQrCjlbI2LFKihBhi6OxfzRRij2g5EzbDCIUrO/jM+eqMNZnLJVE85WUVcrJO0rjq/3vgkXvml+ll6BGru8hyhG6OxL/C4u8wjRU0wEtxUC30bzEK12qRY7HJoRMGau7/jugURGTwwpUx+RuuuDX/2aswdDbux7ebhBgBbcjstxJlxMx51Suzkhp5wXVUXw9It5W1pSOLkqnZ1qsjP18yEuf71ECy0KasXG39aLs6f6lxIpxWaMN68wlMvY4H7Ct3ZH8pv/G6dbtAuYmc3I4pMWePmr09xxJdEoPwr9jBigSOBrrl7RkAyQKd3fv7X28H3aVyJZ7O4Jh1I/trpn62YxgU6o9eKl/mdLp/ZjLbaTn+jZPR7cwqNk1UdS2pQb/q0hK9vEN61G4L+C7Nvd9zWKvkRTDUTproKcjtS8RCU0QQbJu2m9ziPPA/++RuhYQwjKq6qkTrw6SHc7i8/x6PKYObe1io/d8IlrZGQAd4w8PglAMp2gTQy1kRv2rt2PBhRjtqRpn1VZgir5cRraBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mCKV7FtKHrasb2CjZrRC3E8zSlK1CVeiBrXMORXNelJnRHibPcXz0M6zmjMs?=
 =?us-ascii?Q?0WTELDkYKRkdUaOo1P9P7AcT/kdpvhYaezouJkFkh36okH5m93mR9Ahpc6/r?=
 =?us-ascii?Q?szPQhLi/uY3Z34uJep+HwAXfJKQOHSp5YkZeZJawuSajnFtqfziADTdIoOM0?=
 =?us-ascii?Q?bwu/J91lcD9EMFPwqoKLnI+iNpUI+icq4XptXwjPrlCU+mCUvwE9BTBFdHib?=
 =?us-ascii?Q?zZ3Cwrp0bjTCiLoeVsVcsfZRUaAGyfE2UI0bdthyf8fyMnsYu0iG8BoGbyUW?=
 =?us-ascii?Q?dejxN0QKUjVtkU4L0H1GgCtxSU6iVf5hnLIOwWCAyM+8+yjO6tFwE8Nr3t2b?=
 =?us-ascii?Q?sjZ8618duS9RU+IXAuvjkg9Q3H4Xssk+6tdPOCaD85Hz1a+zAvFpFbCwmYzA?=
 =?us-ascii?Q?CfADx/hHmACbaDNPKCoBcXwOYigc3mw5h3PoD2saxQGHjslvUHUuQ5IkHbFt?=
 =?us-ascii?Q?RvOiDEGhffKE6mX+WDlREM7S4zCG03/LYzcv/KLOztnvHhUrIrivvXXkw+D1?=
 =?us-ascii?Q?Fmwm7UTAn5qZRhZL9xqi1trCN9JhX95LW+sp19e4PYdCKAJzx+layD/cNSPF?=
 =?us-ascii?Q?MtOHk+uofDNXqtzfH2sboSWS19v9Njtpn03zoFfT0NfDBCXjtP54SqBbR0Ip?=
 =?us-ascii?Q?oHeZQyP/XiZFjHaMzWLHuFDCYO3SBbzUx/qoJFpeuZ4TdFZeBWU6HrjA9j3j?=
 =?us-ascii?Q?41P74GHBwB+r2d+LX0nyWN7QNt6VKG+tt5ApLuc2eyPaMMWkwKzXMzVx318J?=
 =?us-ascii?Q?2o6JSAlAvN8s6assjWeq++JKtObNkB47Wx+3Wbpku/XNiXuqa4KsVodsLR1I?=
 =?us-ascii?Q?Je2Qg5x4iAx3PwXQjU41xcoy3RU/yc/pgd4VeoYXjtb33Vt3ofxBpQz80nIV?=
 =?us-ascii?Q?IKhqqBy1U4VpoTJixvUkbE0PxNJtkcjE1Oe3wU+EzVfSclZD7b81KikWRXzO?=
 =?us-ascii?Q?mai0n0aCPgY3eM+NaXVXaIiEEJiRNN+7E7a25mymr/8fNz1B7yR5yz17K+nX?=
 =?us-ascii?Q?I0hpwHmXyGkk+q6FDj1uyi8yFf9Qc00UG+uZSXl+Ja+uG/DR+XzjvQuod9Q/?=
 =?us-ascii?Q?ODhlvEFVpkOcnljYFyhFVVvJ/7tuGLIRvyk6eLi3u5my8bBKbCHauJQKGMwF?=
 =?us-ascii?Q?Wm9uQOosEAeeKGSWgTru+ln/cdz8PNQvQYqww+/HYkC/UtG3EbBKSf3A5wC8?=
 =?us-ascii?Q?hY93EWKLs+lW4fJ4HMhvFzWCqOvRJzDC7K340DhIvXklei4Yfe7EPXWxUt7y?=
 =?us-ascii?Q?tJoTVj3NSmoWlUx3feU59Jr5dfCnwWbglLGEoQ0quP4qkdqVml9wMuQbms93?=
 =?us-ascii?Q?iwtnmiLKXb66uwR9pG2j8hLXdPtKSWKzRJmXFZGcJmqCG5TAhJxMwwy7oLwS?=
 =?us-ascii?Q?lwWYVmjyTd+kkd3Z0Wpe3bst6u1DmMPBGwYPQp0PZie5qkdGyanwKGB/LCfp?=
 =?us-ascii?Q?EOJ2iDbIGoUJkn/B4RGgGf+7Zt5pKUmXz4K37Za78l+ZtWU1uXYrqhB3UP9e?=
 =?us-ascii?Q?+FvXf1lCyNYcycXu83G+zygtV9t2ObgxPV0mLsbL7+1OTToD0k26QDUHhzML?=
 =?us-ascii?Q?dBLd3477c+6s1Cy7IVveLf55l8LfOEsBJbabbyRHGeWbnEGa0vE2m8lY9Snl?=
 =?us-ascii?Q?0l4jK/0AWdWyy6WdvjckAE72mekL6DL7B/6fQtvrnYTBdodT13oSsA/ObUA8?=
 =?us-ascii?Q?OK6Cf5vcb3qfRdFQS6amwTKmUvnk1aNsDXRr2NWUKyCcD63lEAhk7AP7M9T9?=
 =?us-ascii?Q?mQZFJn3dmSovHh+UcsFIUVwwFSo6iog=3D?=
X-Exchange-RoutingPolicyChecked: qRe3g2nYeH5k+vEz+/CkjzUxyWVnf6RaiIfG59DzzUU+QnT/8EDor0eYCbKzmcnMMisXLzjqQj7o7nQtUi5U8RMzhjjaPR2EjliPPiTQ9XRCYmQWB8PQp9IZRkEzl7VpzLGOvoTd7Gx0M3RmL3Vpa7MuiD6xaTejXow4TX760jqrPxpFnJm/gRqBKZ3mU/DYmj3GV586obF5umVigWw/Am0EfD1Wg/BDrHCDpgKj3+UXi+vo7xBkym6X6pXZydiPHyfa5cS4LWhc5ehhcMhkh83jWRxOcZ+Y1kSM80XjtCeornfz+MbBDZJpjZ+wOK7wiI2FysH8cWmM+7IkC0keDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f23bdb-2a26-458f-344a-08ded1cd40b4
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:41.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFpehH0S9rwS9g5H3l0PDkDZHWTkwU/cfZa47PcE6dQ2k1jxolOl+jf+zOqr7LvwuPMJhHMzRGAkGLllig1Ehy25ZCR3siRit93R0XsKH20=
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

intel_gtt only needs the chipset helpers plus the small tool stubs they
rely on. The full libigt.so dependency chain is unnecessary.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
libpciaccess and libdrm.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/i915/intel_decode.c |  1 -
 lib/meson.build         |  5 +++--
 tools/meson.build       | 13 +++++++++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index 7e21d1cff..d4a4da4da 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -28,7 +28,6 @@
 #include <stdbool.h>
 #include <stdarg.h>
 #include <string.h>
-
 #include <xf86drm.h>
 #include "intel_chipset.h"
 #include "intel_decode.h"
diff --git a/lib/meson.build b/lib/meson.build
index 95bce8e1f..fe8ee7ffa 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -431,7 +431,9 @@ lib_i915_decode_build = static_library('i915_decode',
 
 lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				     dependencies : [lib_igt_chipset,
-				                     lib_igt_tools_stub],
+				                     lib_igt_tools_stub,
+				                     lib_igt_drm_stub,
+				                     pciaccess],
 				     include_directories : inc)
 
 lib_igt_reg_tools_build = static_library('igt_reg_tools',
@@ -448,7 +450,6 @@ lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
 				                       lib_igt_drm_stub,
 				                       pciaccess, libdrm],
 				       include_directories : inc)
-
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
diff --git a/tools/meson.build b/tools/meson.build
index 8eb346321..467b8eea1 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,12 +20,10 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_dump_decode',
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
-	'intel_gtt',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -75,6 +73,17 @@ executable('intel_stepping', 'intel_stepping.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gtt', 'intel_gtt.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
+executable('intel_dump_decode', 'intel_dump_decode.c',
+	   dependencies : [lib_i915_decode],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

