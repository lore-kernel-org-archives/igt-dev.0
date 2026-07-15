Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3475C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AA410F028;
	Wed, 15 Jul 2026 12:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwaRuZcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28F410F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117766; x=1815653766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+MYK/I+sd1TIF9loeAN7/xcNcGtQRAY66rpYYNDENzc=;
 b=QwaRuZcPogFaXXuCiAL87fO3tb7fd+8xH8I6irP6elhcb/dMZRclUSGz
 mgMrPfgvYma/ynil4PflQPchS3ViT0uWleR8hpfp3MG1S+J4R1lzr+oAY
 VyH6VlswBAcJ0K4Nmtcd1NJYvmWFfLeh4faa6M0HtOfHWucmBaMB6RiVZ
 DqRY0z2ZgMqgo07UPasOOgZzKO4psPoJ3prCFMx6x1EHQr13VIdc3qz2+
 4hM3+HZhlT1lZB/8GbltZHod1gwhoa5AJ0Y41nuugL+XtnRsJIannJMTN
 NCicO2GpDV0XBWYbycMA+QY6/fTjptcfQ8yii9IVx2Z7sXaLUnjw+7Y9E w==;
X-CSE-ConnectionGUID: pU21pzNSRXyCGy375huekQ==
X-CSE-MsgGUID: bJOJ8cpNTs6eD51M4pXzAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607106"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:06 -0700
X-CSE-ConnectionGUID: tPEuVGPERf6pJx4kBkGRHg==
X-CSE-MsgGUID: 5wN8WTj5SYi4BZwupcetTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659718"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:16:05 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moqKI9RJPGUCwa+M0+hVswdI3hfYRqCaT4HjmWs6pBWi1bR2wt1GARrBlqHA/Oa/IftXATrQY7aQdK/KUan14Mb7BlT2C7ub1qYBjDlmDS7HxPqGHUxXBNJYq8C9ZOfzJnsUOQKKwmDTnK9B5Nozz6vhz9KdR9LDEZnMbgY492Pn7HTF2mhipDHTPTpn+uEmwrvUY66xZPv9qCj8o1ItuR8tyk5qSmtZa2S0h36vhrJj1YDSMhGNQmUkq081L9OkzrS5bfDm3kOozWU7j4mKDBl7S5OgsRSGgBkgvLn0rX4UbmjZmzSznqXXexiAgNCPuC30HsFXaK7BOTP+ADTqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nbeyePuvQtyeq/3qrqgaAfvqwUVWW80TBgDl0Qw11w=;
 b=XVA0cq13YFIIlfW57dBfGVSagO1cOoJiN0fEGW6Bsyw5PnoThuTExOwntW2/hXuBbi/NBlQ10efgToHsshq8nJlMy2MfiuLl7huDet7w7IiAjgeqsWjolHCP9/5K77UX8gJz4hBGpKmu9wy4e/bcenJaTmfaq/e5QmPsMtHlt0bavMIvASuTDQxNzL7sefrRYQ08MzfP74HMCrzMHF4STCTbPVl4s693kbxMJAYhqpi/AKrsstYTHRW9axRUOW/kA13UNYzrLhj30OjxvZjE8H2FIPUgcNKZU2r6Bz8brej+QDtdtsMumPargtnILPG3krvg/YiyLQYNejTivlTTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:16:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:16:02 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 29/31] tools/intel_gvtg_test: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:39 +0200
Message-ID: <9b1b3b0e767528df7b888bbd2e285401b023f57d.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cef877-9a51-4d15-7f28-08dee26ad66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cW3Fptc/FIffRgeVStbxg37ZiWFw4B41ME4hPBiJjgi7M9QdidZnVSXJYKbfwKqFrtzm4/kpkHpSwtsTkKfYHzknO2i3UyGdFXGVzEpLrsq0O8+dTo2BapxKiGGUdFaa9tM0+V1B5FUvSbBKAKimuKv/abjAu1U2KhGEjGClclns3aVpYEw2n5Hm1q7CHRPxzFDLthL2leDU/6Bq99bkIw0nTvr2lcmfG9KlglR9TnXpEIR2aaWhhljD8zf35/Rj+p60Tt12brqxmGdKJgLOjqE80xwJlTCS0RpHZNDknXi9XDSMhzBGa3Rdx2HRnqttQAx6QHOI188yBRWtyVDeWAJz764feIhzyrkis0yi6gdDtThsKwJnPEgO63zsIURtXdG59ojOR/0x0Ap20ErDcZSok502zTbHoNbIfGofcUtCqfmc7QiHhHUBO8REloAuTu0s+vGqxV8w5M6Fnyo0P4RbivGSarM0wXYraP24wmX39xGfa6y4pQHJz9tWwGWKQD45eTYYpC5s9PNU0O8bcgVdmZpV6NtyG78d1I9VlWn/He4Kzhuf8kZ0ucSaklGgvpC0zomMoXFUVRoeFIORYzh4nUsCmW5D1NgJZHvAO63YYg34GeS6JCCPdAVP6VMCpIUAA3IDp9KEgM8VtpTvrBLbtQVkiguP+8Si56q5VRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2zEKIl1OLKcDXJ87xpyCEA9hZIyJUJi9mxWZ4GThNyxZFcH5N39iHDqeRKOj?=
 =?us-ascii?Q?4g2jcqgI7GzXYpfmqork5d39HRhfQtTEwZjiOGIHqVaLWC4kZ5EZ6zjcEu1s?=
 =?us-ascii?Q?Hx1iPNdd8TeP2bbPNyo0K6i6rvXMmtWbtgPhwPLzG05Amvw5ukYhxL7u6Gc4?=
 =?us-ascii?Q?nwEhPXwXmQ7X65QfWYCr+FLfJinGm1SjNC69ptadBJeAh+qJ/2x8MrZwgpke?=
 =?us-ascii?Q?n1cc1wRLq5qCXO9vo5KHRdX/R0UOQMP3DZUB+89OoQbHL6NKR4vLyN2axWqs?=
 =?us-ascii?Q?1FWHExrJBqWwoewoaGe75r/vNaYpVCpQfxR5OU5pLuCJ2lpseOnKKtVzLkh+?=
 =?us-ascii?Q?s/EIro1Yhufze/IA2xt0jifVjHhr+Q5TTkDpvz0U72gG8ApDDWKMohTgJtUl?=
 =?us-ascii?Q?cRJFR6HCCl8NUv6RejTCN+/fDNrZ/n0pg7ROyG/7XwGAn7HroLamMie8HgGI?=
 =?us-ascii?Q?/1kSQ8+xFcK26MXMOHq09nGEumchDLcgETPrm2pI8cDP8bURFoJJjP/UHIom?=
 =?us-ascii?Q?O37g/38naCqPAZfNmyTYRNLhVSuU84YyFyzzHsR8gXqCfXHUDuTVFxg/ahUQ?=
 =?us-ascii?Q?FphG85CXZ6n9Jo8x0Bd/8iuhLzSMAUenFPhJTrsYFf0PSQohBMCSy79i8BT9?=
 =?us-ascii?Q?jJ2NntNpy6aPt9E8pyXuNIpqdoAt+xtMhM89M/EnddN4+iO+pZBUD13u2kJu?=
 =?us-ascii?Q?YhzAijOZ3XHVNBPj5gTLyNTN54S4mEan9Q5yjH7i1kCVgrCq52jFokAX7pP9?=
 =?us-ascii?Q?aBTQWq6YIri9uI9Q9ESdMcmq9DUY1jkQN5HW1Afl0IFJRNTxN4ox9BM2acAo?=
 =?us-ascii?Q?AHQTHbXiCtGAyrTQfrY127tI+bolNASBQ+W8V52jpc7DVrkFhJeqmo+2cGLG?=
 =?us-ascii?Q?K1/cG95UexW9Zk1LsSnLMV0oIFLTyBk3jEy9Wq6gxiX21NDHJ1uKSIXgirBp?=
 =?us-ascii?Q?pSmVui1YGmgpMLq5j3HrWuZbiCz9f4CbYF6yDmXYLiB0IwX9PzbI7QU4mzg3?=
 =?us-ascii?Q?T2HkL8nkX2oUynfKaRVZgyv+2KSbUmV3YNkhf5bPGhY2To4+Uv1iz5MAFQRn?=
 =?us-ascii?Q?JtEzyj2TzucSzPnxCPSdr3MROCDcpR0WSQA0RCI3IkcbTQ4KAYekn7G6OSwF?=
 =?us-ascii?Q?b9vkuxP5G+3EJNlziF/fo9FywrYfGK9nRrhWmK4GYnN7LgdBWchaNtldfsRl?=
 =?us-ascii?Q?tIhYrYuRyE0dbT9W/hh1wHy4nDJ2CR15a10rIzbuH5teJ3Wm95ZZDcO3LFcC?=
 =?us-ascii?Q?gOEDQj3Kq4I6QU6Xu4Az2vc+T0bAt9ms/6h7wsPDfYDiFb2YZZ9psRaD1b1T?=
 =?us-ascii?Q?7seJFKQWnsVSUyYjiRJ2LEIsYcbI3FB0K3SgSCZ9OJGSBnuAuUVeYjggV0FK?=
 =?us-ascii?Q?0gkxs04NZOq9i9m4S7X2xR8dAuPKwF7RUHDWyjidA+6hxMy0MSk6nN/ADCgm?=
 =?us-ascii?Q?VEdMRBpBfPudfZpu5DWKHxy0+CbvCA794BaAhFNieRC87eMhB50geGFDnVss?=
 =?us-ascii?Q?1J55J7T3nrFbAOxQG/EpW4WKRfKoOeWsv69P0gZCV1jsSKS4AOkbeEmtqJS6?=
 =?us-ascii?Q?fBaTG9Tc+mcxCrm/ve2uyhR1rTnqzQuNBtruAu+AWhrz2xr3xG1vcOfPNBpI?=
 =?us-ascii?Q?6vA1oss+m4V1FY+7jyK3gGQFEryQoTpBV8Iq1dNCnKUqZIeSWQDcotcXcqpf?=
 =?us-ascii?Q?i61TilupVlu4fNldZ1RKWnsxw2zZNFINDq9el/+WtayC7oD+qoYHAiiEMYE1?=
 =?us-ascii?Q?64cCbPnnnBe54CC4D92D98I7D+9nx98=3D?=
X-Exchange-RoutingPolicyChecked: l2DdaUE0quIT7Bej9/u+4JzThHhtRqF0+A4IpyMXo+ph1Eio+Xp0LhT5an3xTo0sQrgzGmvSC7TBUQ1CvyV9hsb+0Jn4JD1eLc0ylg1koW7WyUJfY2g3S/Tde8pxzjA3HZHriDY/9LOYFXkcU7s7ShWWNcjcd/wbG+iqdBi3XWQLLrVfAzLNnqua77M35632GsNZOF2eeTQd8uj50mMgSLlC4PUVNjEwmoyTkONv/Rbov0X0sFJk6is3RbZ7wTQZYgS6HRmpCiJVtn/RtEvYwtDMYD7DpScGtwoXEEzZkcQgVjeE1xofLRYNzWe0GDGpm3rMUUyavRCALdv0Fgpsyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cef877-9a51-4d15-7f28-08dee26ad66d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:16:02.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtyRQbeSreNmEVFHvDLiNdpfPFQ5BvBMxUsCGd5eZ9gVyxMNp3DKV/Bregyi4hpnOUqeRIN44ZfYJGJ6069AZ8bqR6SBL3h/xODsGWa2UsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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
ldd after:   3  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
index 2a084a0c4..6e694164f 100644
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

