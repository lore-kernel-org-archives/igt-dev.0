Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4EEC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479B110E4B4;
	Wed, 29 Jul 2026 11:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkLLfKT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243310E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323035; x=1816859035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oGtGGUXEQmVFIYZD5YBVoqHXiXFRRyQ8tf/LTfwHWb8=;
 b=lkLLfKT3TD6Z6QHXIf/WlFtN4Ddt9sMvM10qB9kxbD5botULa7NmDw7q
 kGX3jlbx2i/Mdo5JCfX0ujZrZXQJa8jlOE2qahoTPCvOf0ZaN1gnPKOhR
 Kaq4gZNMNr/ft9RJWlz0ICQCzIRm+dVC/x5dOzUeBDehQMXJDtOYEqf8h
 6Se+KHT2N+YyhlSHfS6S1y7PIGEb11GH1/rOEhzA9AysNOCGMqZNTERLz
 7jdbIHAZblJF0ioiDltlgoDFEn0jSNKTDFbdaYibeWQucNIIW+vkkWilp
 DYLhqKL5S3BC74S7VDV68h7ShIBgEXj5mhq/Gsae8z/i4ET2nioUQ3v1K Q==;
X-CSE-ConnectionGUID: e488hdaZSTq3rvyFJdD02A==
X-CSE-MsgGUID: glAXxMgTQ5Wb7ziz9XV/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719035"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:55 -0700
X-CSE-ConnectionGUID: xW5s68wWQ96QMWjMoxt4+w==
X-CSE-MsgGUID: 2kQET59WQr2ttwSt2hhnEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204825"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo7pQTZdyb5+i/E2P59umjiH/+8zeN+z9BHyB7bCJtczgIskv7bv0WPQlKH57SyyOg462YuDZSnyK3Vpxg8wUuklSDNsRE+UclxWqsJw/3gm8+76ISM6dFTnCQK0+SLLiFHzD1FyBSJZxT6vLHKI6SCpnxjWKZ+MBkLADfaLVkRpqNcfb+WV7wGz4I2W3B62ayxk0di1ZmWYESVToMGYeyZh/L9NeMP5/qyshQ4phVqxUNMi8E1DZu+gRm+etH6nU3mymRPR7F1Rz/V9uyNb4+Uu+5Eti+C3qs6qyejXAG54WGvAQixWfEsaWzS+PAj4Sp51S41IBIbbEFCcjQWnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CDrOUG6+qoedBSegbOtUT53Bs6NPQfS1egs/eTuSzw=;
 b=tePLBbpV9k4opArX52hbhjdmUUv7jNwG1qCmf9gdZPdzgRo5EB68QtyOLzvK4IgMyhY0kx60PgJ56NEiWbDqKsHl4u2s89EVNEmWpXjdcsw8LTtCfLIDrU3SKTX29JTVxLph3ksHYs9ZOGKDwn9nZgZqk1MA7fURAmDrD2rZP83nnnrVn7Q+pvDoAmYis0+t23zwwKBDt7+j981+iNQDWs+HW7v9hKuRiP3QPFmJFAyQbmcPCqz3AZIBYiroYppqsMfXhwr1MHAKGPBIeC8XHx8WH94IITJq+ZeZUXhngm8vPW8DZf4c2mU2jpjsFNpksUOr7U4oxyJGaXMzHH1bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:52 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:52 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 31/31] tools/lsgpu: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:48 +0200
Message-ID: <99260dd25fbb3a024a4ce32a44deb532b42d2c5c.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: a52188d5-ff6c-44b6-a7ba-08deed611273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9x+C8P8JQ/MngE93J/ZKOFDnnhjpz5ZSG+N/cgQ1Onb9HBYNeYmOhQNmQm+nXpC9XkPeywtQE3cMbpZpPzRcEeJDtC1fmRkcg4Toz8XwhsSCVXj5Jsjx58BkWHLfLBAYnXttLIWZlBGy3SBq14ZjP7gekYdbxf+tNtcpwCxqgpvCEU/RO8zv4VzXWVkmmMIzh3189Eo7ir5niraRAjH75wSQDJKfB0bQTmGZLU/XBOUdYSE0eKBf7HjZj9kNHXc5CcoVtpnmHbBdJY5j7VtSdVt1+YFPdpcTXmulyvj6LteQdsP5HoQzSqF99oJmK9w4Pz2E90mhJNHxKOxlbvZws63x6SIuCtkGLYU69YcEVVA0BC4Hxk3ZtDKMsdTybXcWZx6m8pwVzQUJx1lWDQnSc9dNAD7fNRoql0QXLJjgxqy/yy53pAjGkEXXSxDzEb0t7KP110Tg1ywNbp8yG877v6ONSnhyi2Asp0yHuExcoeADP267l1RryvW3LXRAQ6uhWnObjRZKshmW7UHfEWQ15nIj/ZnNByEZsqNriuftaaq73vI9fjXPY8gJ+M0TCF3FtuZKBHWEj5YwBiLxuCwpPWJ5HkrqsH33R/2hZ5ohytTstRQzvZ4uJgtLsFMzMr4X3v+SHknT0m+0Bfntyeg+1oXQmVUZSWyhfNjFDiEjPBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pngoZv/DtiUGK5h/zy9Mt/BGZzPFC2c+X1mqb17V8p6MH/YH0T8NdAYAdc6U?=
 =?us-ascii?Q?OqSKar3D5hXP+9DAC5tE8wI3ajbdPWPP241hV/AtkiB0oeCXLHv+R4BJ4ZA0?=
 =?us-ascii?Q?kvCzfiyS17N3zGShiSNLRoUPrS2tIrxPPJsge6cm03z2g2U4MliRzGArfq0w?=
 =?us-ascii?Q?qjh8SZ72SbnlhjrpxjCJfGHOfvR7UPAKryFFsVpE92C8gOenzyPdQyy9ObK7?=
 =?us-ascii?Q?GVN8lPlm3h6k1afAEIiffQvjgUtnvW0USH9oNgHYPPKALoQMH3olCZsCJiYj?=
 =?us-ascii?Q?E0GUVexSJusEiPU8IOQv3HDFhpAjtscTvnu2EWNt6kHlk2WF4+mSXaHgwRDy?=
 =?us-ascii?Q?CIlx1Sfg3ow96FgoiF+CRo605W6xS2+A02Uwplm+UrPNpKqeSLGTQd1KEeuh?=
 =?us-ascii?Q?c0UC7USRUVENWFIbXVi1oTbSAdUQen0pdzsWI4dgX/6DP5nDSG2g85uDvzto?=
 =?us-ascii?Q?IYtOOA3mRGZrgJHbUB9hiBEyvZQBanzEuwlEi+8ENzDIiqPonxAB1tZwLtna?=
 =?us-ascii?Q?1W69fqpBNJ7gRoqZK0JBVivgsEk7UEKPrhhJX77j2n4vziGc589vueLNTgfF?=
 =?us-ascii?Q?FyNG7udVcj4TkQG9MGGj/5Q8rTBm2SabfdGex6E4gTHpab/Q1WA8H/ktQmBZ?=
 =?us-ascii?Q?457IzGr8d9VYgzq3YYSo0fzM1jQzwBBs2py0DxMMlH57CcBqKGmciUbn8ZG9?=
 =?us-ascii?Q?qtqkLJi8iVGm9dBuP4eHd8BWhqb4x8T+nUnFkFPAgGAO030jJnWu9ZAEcszC?=
 =?us-ascii?Q?NQzIDcpG0t4Z57jSVMBiAi43+8koXj4fAcMhAXJKFWNtZWfHn9G8tFk3bnue?=
 =?us-ascii?Q?yeJx0l5FOzF+oeqHKUVk0znHxrzQ/5nTcJj7cVcaYWUob1qy92HRpV+Mjrnz?=
 =?us-ascii?Q?2sRt/BkXpbNnBFVWeEzVUFwLXzF1FCSSQuo7DomNfrmldThMxPcwDLdKMnZM?=
 =?us-ascii?Q?ubCRSOR348ZVSL+Na5blAhHk+5ecLaFcF0qyqrj2fSafZPuazcBmCKlSxktH?=
 =?us-ascii?Q?BTFURzWlqI7ESEJ+z7EocIkAETC31vNMBDYyE5mlRUVMzCUCDmJhOVKSf/lk?=
 =?us-ascii?Q?BlKutqVGvm1CDZy/HFKU8+rsZbZV2cN/pETSSubgrKBx5tfvj6iXuPTeCytB?=
 =?us-ascii?Q?beAdauqvVcUcJsmc88LWYeLzbbSWjQfZfWts+VGu0lixlg30UbmZXOdms5N6?=
 =?us-ascii?Q?Y6fyuaCSbqUafvUeh2ubmLhnh82kJcGti0e5XltY9xRnGt0/QIZ2lvU7SFzp?=
 =?us-ascii?Q?cccsYeXWqI+VAG7yvSScA9ZoXOYxdoPhZI96YRcYh4b4BgghhjUpTAGOLfTv?=
 =?us-ascii?Q?P2twrcRO0awTvetcV3ZHrugVbCe0rImsZnis8b8fsbzuqt457uPg3HkJ6RBe?=
 =?us-ascii?Q?874p5c5ZdvpVSsaCIDNbexnJ0HA2g1AO5YvdmD5L6kvivboXM1rfrA1Fh3na?=
 =?us-ascii?Q?75Odd5y716Ca4GEtecuWopeQfw5HrwnP1+TnIXwS8lLJTN7YYn4Z0mgXLcIV?=
 =?us-ascii?Q?J49iyEGUok+84FX7rMGXK+FVbEDKBJ5klRhedgLb57aYbeOTnitg0ksOKRlr?=
 =?us-ascii?Q?cuO7ctEyycia4gFZhx/q653WzS1+U0LQQSRJqmO2T77FZ7vSAh9qEDFslm0c?=
 =?us-ascii?Q?6Y17yxYw3iDdJG6p/hPb7NHmTe4P6Sg0ASznBdklvIn1WvtXhlI7w4aJtFPa?=
 =?us-ascii?Q?DD5NLX6AvO18yAqRtPMQN5Yu1hajRspasAGhzz0l7tD8YNizibsQiR2jlubT?=
 =?us-ascii?Q?cKnwJE6piZ1au5b2grXIKYpy+4yWEzQ=3D?=
X-Exchange-RoutingPolicyChecked: OkL9LQsPc2EfMDxBdWuuFg7N2LjpGNud5AjfBR7j0TRAyUki4+fuI6r6nskyGj5AeZ3gWtJkk75YMoLxr4ey+vZDbScn5xrkxz9Uigzi9eV4lyQSYgPTaRi5Sh54WVImJ/1YNfg6xKkaB8drfORPm6B1FTrABw2A3yiyncpTzFU1gZD9Ns9QjzNVDNwP2qSUoZ4IYYP+J5KZywvqlvcO9bomY3SI+9ljyo6SAB2mKfTBF1gjeCQm5/z5SaGAVpu0rbNjOC9qKPtTOWpzqnUwcDS5EDA8ZYiZE4botchB1M/wLtSPGsLPamAYM3NMoeg275d1PqvsRXcvtFXcttJhAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a52188d5-ff6c-44b6-a7ba-08deed611273
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:51.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYOdHTkoe6z9v6x30r+GDufouSz2E3JPGRMjgQN6SGuNFe2rRwws+cdanDrmiS2MYCSUliG68UxCAPLj5lvfDAIMvf8F2rH24ooeMve00h0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/lsgpu.c     | 3 ++-
 tools/meson.build | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..b804cc582 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -34,8 +34,9 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
+#include "igt_rc.h"
 
 /**
  * SECTION:lsgpu
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

