Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98AECD1294
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 12:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A05112A63;
	Wed,  3 Apr 2024 12:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6XV9Doy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA6112A60
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712146227; x=1743682227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qr+3744n0d3n9e1cVQllNbcFobGQxzpHKx8+JN6kLg0=;
 b=S6XV9Doy8QPQ2h4U+sq8m/jdPdeFV1FJQ4cIATA5GywX6Fi+ZVoOB09O
 BR2gskhMDmXlc//Ewt5VZj4cKgcxGPs7LqOj8z88jPvtwDlnE16ojHNk4
 x8Uh0ctLqZcK2kuuJgRF27kT00vqRgZcxzqTD98oKYFp8VX7hvHFZv2a/
 ueIBDbten/6lArrcFVRnqJzCGCxwNdCV+Z30tbOh709EXkrHqzZwd1jc8
 wxM71xF19TTK7fmOEjN7/AMuD7N3ssI9KeiOL73E1U2jYWAefLk3F69mk
 EnX8ehTk0GGGRu9Rcr6FXXQnz6mL4sMOYXdMatP8O4iLZI7lXYpJdhXYk Q==;
X-CSE-ConnectionGUID: Z5LRW5+9QnilRgZ5ot4dCg==
X-CSE-MsgGUID: mCEZUf6GRa2nF4IwZWii1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11147371"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11147371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:10:26 -0700
X-CSE-ConnectionGUID: FdUCbaaeSEuiVIQZb11z3g==
X-CSE-MsgGUID: Zv1so1tbQkCinTB4EPdKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18857764"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 05:10:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 05:10:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnZn/9JGlhnwRr5XvuvslnsaXNdb6dBw5rsuPbX2S3L23Gxahx/EUvtIsimGH0eo2DZOc8YD+5xOp0ppNa9iaPJ7BQ4vFmOSbKpy4SgyXADSAHfTQRdf6ZAwA71OkJUnrr4whkPXNxuV7o0OZYjJYuDks4js8S4LfiyN184/8eWKizu0G3UbeEKMDlkgb9/M4M8P9XPnpDrdRD0L44bFMpa8GKNsTBdRxhxIjmVQqEqVQdbsANpvUAE/drUuVh5etFQNH7GqVJmi+GKdiEoRKhEb2y+iJWR2CHZQL3cT2GsDgjweGgDbng5uh3MqbSpPI3q86n34JvrCyTZJ3n18pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+/bNT818XfjCDuZLwEmL0kDcrGL1NM92fHovi24cTo=;
 b=JM+3ysjl6031TNXQRElkQRbeLGGM03TwxNli5a3ccuj3zLVOa/mqWxg7MQsnUO9jYgHUTivI7SWkDslsB/y9eE/ZrG9VG+wdLNHrb9XcnQk8Q4loq3modbnQU1I9Rycar+3+m+zXZ2POC/gXpUXi1Jv7be+FY1ubOBfrKjqSVEoyxVcaQvDGSkGLc0qZUoOPj/13ypnf15A3+bUzFQZCCtb/fQqVYr+cWFRmNDvVGKTydB2ajnFh7dX/kheVgdDy5orNfq9fd7hMNhb5aXDi4sw21sVi7a9dml8ZnwAC9bfIunkrzU7Zu/tJKxJHY0vbdpl8FcTuZ7rk/c0Gb32vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 3 Apr
 2024 12:10:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 12:10:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t,v3 2/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Wed, 3 Apr 2024 14:09:55 +0200
Message-ID: <20240403120955.4070545-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
References: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I29eb+06VFIS9GhWuMWA/tzHdZC0OtolJjiANiP0fd6r79JT0cQNPbzLuX41NorC0qex4pnbEuO6K3sshtjvBq8CkFH5p7UyIyAdSkgT0qzEFb0qZQXhv0Q9tIRmeoF8KYgIqtVGiyj62QmuvlLOEDte/3vyUSfnBh4RIwcZ8rNeQD2RN8fBg0ohLGfj+vvr45BWEyfqX0DqRCPO7scQHHwr13k536Fxah331cuHGtlHM0uNhEFwsolzmZ7Mr5ORfv3j9XmxW3lFJol5f5pGy7NazcgH0C8qKHebQHxKfTDiwe/rtN17NvZDOCSN4Bl7xEniY2TeVFNCLxvN9/AkbLbzOjxpKJtrRlpwagg7B98SGgmyOsuzHBap2m6fWxvyS5g2jltgt7u79RgNyg+wmunFjLBSnlPUHD+a5ZFMCh8/7e/DLifLqfYgT+OfQhhRK2t8ckpi9Tr2QE9pA6aOGL5/AOQeeJZ91Zu8K4gciZvzmAARSQ9VMNba7JKOJGppa/uVa8KtV2tUK1DrNaiIPsBqClvkWvw7/javivsTRs/+Gb20hPgtLp0pyh0yqFxPiEP72qMSPEh80+NmQbq4rVUHiQHgOToTtAoyXZnaXQwMFMC2FTEidW5t58zKrF4trbVdT1ZnWmfAYPaZodKX/zXL6HuR+5FCmbuCm9btyEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1diTHFxSDlhRGFJQ2tDbFlydlE4KytWNmhRbUl2cWtRcGRZdmxFSEg3TmJX?=
 =?utf-8?B?NFJEQVh4ajNwNEtsb2hCaENHSVQ2ZGxkWXN1RmxHZkMrbWU5NWJ2cm5ZSDQy?=
 =?utf-8?B?RU51eWE1VWtyQmI0bkJ6aEE4OE5SODNSZlRFYTMzdjBaQjFrL1JHSWVRSkh0?=
 =?utf-8?B?VU5DbFpCMnFVN3ovTDFTQVUwOFBPTGtMY3dCeStSTHN6Ly9XQTQyNEh2ZjRQ?=
 =?utf-8?B?L3RHN0Z6czdIbkxoUkxLWDRMWXBLL3N6NU1xTUZ5bmlqRGpCMno4TjFlRTFk?=
 =?utf-8?B?Sk5ldGJRZlBYMWRrR0hxNzlEM3VSZE8vOGNvS3M4WUJvZDZSTEZRY1RabDVI?=
 =?utf-8?B?ZWZjVVdNK2RsenNaZ2krcU8wczA0OEp2eERWQlhVZUtHdTEwLzRKQkk2dGxI?=
 =?utf-8?B?MFc0bzExNXBmQmNIbnNFUTBuREdZejRIZlhVZkdSdnp3WGkrOEhORVJEMHRV?=
 =?utf-8?B?VUd2R05OU0J3UkxSdzNrM0s2bVFSVlhQSFlud0FZU0orQWhteHdIZmdSblUw?=
 =?utf-8?B?VTcvTkU2VzVXUlhlTTQxNzdyL0tEL1IxSnM5NW9mU1U5czNYVUh2Wm9FeFR1?=
 =?utf-8?B?VGNkM2Z6bmkyaXQzMmVmaHdGMlRJL3dtdzNRU3l1clkzVkNnMkVIZzh5K0Fl?=
 =?utf-8?B?eTdRSWUvYnh6QkRCTU9KZGZtK0p2WmdjaVhPemFDcldlakRXamdLamY1SUc4?=
 =?utf-8?B?OEZ2djVVVzBTSndMQVdQbmtmWXpnTXl6V2wyY1BCTy9yODVVK3kvMEhaWm96?=
 =?utf-8?B?YmVZR1dqNEdtZ3gxaCtLYTM3NThHZ01ZdlV1OFNxRkMvRHZhdWExazVScEo2?=
 =?utf-8?B?Zm9mWUdwNTRjT2lVWjY3M2xOdnZ0R1J4MVNoYzh2R2VoUFNtVDlyaG1pWURV?=
 =?utf-8?B?N1p5akkweU5CNS9pN093aVJCMWoydXQyRURpV2FkR0plbWNYZEpubUttMTh5?=
 =?utf-8?B?Y1VHbCtOeGNVbmJIY1NIcTBTeVUxcUJmTEQ3QU1veVV2Tit6Vjlqb0VhUk9w?=
 =?utf-8?B?RFc5WGphTTM1ZHFJalpaaDJHc05uWmVpaW0xS2xKcFhqZ21DY3ZCZnRmbXhl?=
 =?utf-8?B?b3gycVdvU3RNOE5oWEVZVkswSExFT3N6Q1JnVlJQMzNhYWR1c1laT090bmFT?=
 =?utf-8?B?Qmk0WEg0TER5Z3paWjloY2o5UjI5YXlJQkVFYTlmR0owaTFiN1NkQlZLYmtq?=
 =?utf-8?B?dFAzSlEwQTRKYUx6ZGJQUExFZWJYUVV1QTJUNjQ0K2kydFgyRktmT0g4THB0?=
 =?utf-8?B?MVhNSmZjY0ZyWGRyOEtOY28xMnRrbmkyVEFuM3k2TjZwY05WNEF0NFpuRlNN?=
 =?utf-8?B?SmUxbnovWVFSbUEzblV5Q0dQK0RST3N5VzluTWVGdGh0dTU3ZGF5YVA0dFBL?=
 =?utf-8?B?b3BJTGhSM3BLemhjMUhrYTIrMXgraTNlVWhTUksxazFmQmNnaVpiYWxuVmQ1?=
 =?utf-8?B?SUFneUs3dWhPWmpNTXpmNktCZXVubFRoWXpmaGhBb2h5cTdvb1QyUHdHRUY4?=
 =?utf-8?B?bUgvUGJOOFpSWUlKZnhkeS85Y1FFOFA1emVweDF0d2ZnLzJUbUova2xvSS9W?=
 =?utf-8?B?WUpieURDbmdnQW15dlFwSXhYUmhhWW5iMWlFTDAveGJiQWt6dFU2NEtRSG51?=
 =?utf-8?B?RkhrQ004UGgzQktmSWxWSUNMUnFJMUx4U0o1WkUxTms5LzhKb0tYaFZieHZh?=
 =?utf-8?B?d0UxQ0FLYS9Oai91RUZLNE1sMEpXZ3RXTnlIQ3o1SnV0dEpnTHlLSnExZFlU?=
 =?utf-8?B?clhrR2M5bDV3eElyR0ZFeDZpTkRpWnpaV0ZhL1dISnVpWC9lam1jbklBOGdE?=
 =?utf-8?B?Rzc5SkZ1a1NpRit5WHJSS1ZRQzQyc1plTktBenZCWUpQZEdQRVZ6UG43emwz?=
 =?utf-8?B?VEhOMDB5c3lvVENyRjBVQS9HZkx2QzdUMmh6SlpRUnB1Z3BzYlUzbWtBdDZy?=
 =?utf-8?B?bnFTMVk2TGJTN21wQlVBOXhuYnJTZWZlOGh6ZmFXd3p0U3hCVWRrMWRRU3d5?=
 =?utf-8?B?WUpNb3RjNFdDYmpIT3djL1JFdTYwaE1VRFpZcEZmektYbVlpTWZBY0dSeFdu?=
 =?utf-8?B?S0dYb0F4TUZNM1JtWjdkZXJpYnJFbmErdnlhbmtEYVBHeUtEWndEUjZSdFdV?=
 =?utf-8?B?emVMam1TSUVtUkIvaG93aFhsWEdkTXNOdU5lcHEyTG9MQlIwWk1JdVZQSTRV?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 863f0efd-0747-48c5-a30b-08dc53d70931
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:10:21.7982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOEuFPggzbiECwLTG9vsLgd/z2xhKIu30vZNZveWbISiGvPHAD/R/B7CK2P4IX/OMGJHvUcdu+yWBmsnzM1ckW1jAauRKmASuT7CSbNvSEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in IGT we have a library intel_mmio for simple MMIO operations
on intel GPU devices, but it is limited only to accessing registers,
has a lot of legacy code related to the i915 and offers no support for
multi tile.
Let's reuse the memory mapping from the previous library and add separate
helpers, dedicated to Xe, for registers and GGTT access that support multi
tile.

v2:
 - add missing std ifndef/define in header lib/xe_mmio.h
v3:
- remove vf_id from struct xe_mmio
- rename reg to offset in funcs params
- change return type for xe_gt_get_tile_id

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/meson.build   |   1 +
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  41 +++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 5 files changed, 269 insertions(+)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

diff --git a/lib/meson.build b/lib/meson.build
index a5651571b..e2f740c11 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -111,6 +111,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
+	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_util.c',
diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
new file mode 100644
index 000000000..57526d7cb
--- /dev/null
+++ b/lib/xe/xe_mmio.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_device.h"
+
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/**
+ * xe_mmio_vf_access_init:
+ * @pf_fd: xe device file descriptor
+ * @vf_id: PCI virtual function number (0 if native or PF itself)
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps the MMIO BAR owned by
+ * the specified virtual function associated with @pf_fd.
+ */
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
+{
+	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
+
+	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
+
+	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
+
+	igt_assert(!mmio->intel_mmio.igt_mmio);
+
+	mmio->fd = pf_fd;
+	mmio->intel_mmio.safe = false;
+	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
+}
+
+/**
+ * xe_mmio_access_init:
+ * @pf_fd: xe device file descriptor
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
+ */
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
+{
+	xe_mmio_vf_access_init(pf_fd, 0, mmio);
+}
+
+/**
+ * xe_mmio_access_fini:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Clean up the mmio access helper initialized with
+ * xe_mmio_access_init()/xe_mmio_vf_access_init().
+ */
+void xe_mmio_access_fini(struct xe_mmio *mmio)
+{
+	mmio->intel_mmio.pci_device_id = 0;
+	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
+	igt_pci_system_cleanup();
+}
+
+/**
+ * xe_mmio_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ *
+ * 32-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset)
+{
+	return ioread32(mmio->intel_mmio.igt_mmio, offset);
+}
+
+/**
+ * xe_mmio_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ *
+ * 64-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset)
+{
+	return ioread64(mmio->intel_mmio.igt_mmio, offset);
+}
+
+/**
+ * xe_mmio_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset.
+ */
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val)
+{
+	return iowrite32(mmio->intel_mmio.igt_mmio, offset, val);
+}
+
+/**
+ * xe_mmio_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset.
+ */
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
+{
+	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
+}
+
+/**
+ * xe_mmio_gt_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset in tile to which @gt belongs
+ *
+ * 32-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset in tile to which @gt belongs
+ *
+ * 64-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
+{
+	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_gt_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
+{
+	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_ggtt_read:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ *
+ * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+}
+
+/**
+ * xe_mmio_ggtt_write:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @pte: PTE value to write
+ *
+ * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ */
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+{
+	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+}
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
new file mode 100644
index 000000000..f144d4b53
--- /dev/null
+++ b/lib/xe/xe_mmio.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "lib/intel_io.h"
+#include "lib/igt_sizes.h"
+
+#ifndef XE_MMIO_H
+#define XE_MMIO_H
+
+#define TILE_MMIO_SIZE		SZ_16M
+#define GGTT_OFFSET_IN_TILE	SZ_8M
+
+typedef uint64_t xe_ggtt_pte_t;
+
+struct xe_mmio {
+	int fd;
+	struct intel_mmio_data intel_mmio;
+};
+
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+void xe_mmio_access_fini(struct xe_mmio *mmio);
+
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
+
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
+
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+
+#endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53a2b4386..6df8f4264 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_to_tile_id:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns tile id for given @gt.
+ */
+uint16_t xe_gt_get_tile_id(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	igt_assert(xe_dev);
+	igt_assert(gt < xe_number_gt(fd));
+
+	return xe_dev->gt_list->gt_list[gt].tile_id;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 82af2706d..f91d16bdf 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
+uint16_t xe_gt_get_tile_id(int fd, int gt);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

