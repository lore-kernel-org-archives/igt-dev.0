Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA6EE9D3E4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519210E66B;
	Wed,  4 Feb 2026 14:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsXcec3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5E710E668
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214602; x=1801750602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FPgIuI73VkzVzZ9sIM3NiGc14lBSTLIPwat6Zuw59Zo=;
 b=YsXcec3G94OSFIpOIs+bGC5SP25IcPd48PkeuaGLT1DiAO6SuiFHMDAE
 CZiZk7c9Mkz17tmGua6tPLx4g/wm9G2wmW/0JphmcUHO5mco/k62vyUnV
 pwn9TwJjtZ04q4JMxst92wLiZYNAHYKoJkdr93f8uIIfYQbuZfwTHCZKz
 KtD+2hz97dr+oCnJMUAW+5dANbylzms6T1+n5gMnvPlltT3HBsNl3boia
 uW2m3IHz2Xybb8oWkMKx/238vpRZQOu8Drzc4fkfPxiKqXirdO8sYjEB4
 F5hGa5BtkYPFO+97vPiUXy3Y00hxMNR8dylwhVrmcH/6y0hLJkpKouS4h A==;
X-CSE-ConnectionGUID: xEpQsmIlQOeQjuEdVAhkPQ==
X-CSE-MsgGUID: 7jilbwhiSGqg6pRQflaGXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835266"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835266"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:41 -0800
X-CSE-ConnectionGUID: y/DTa/0WTsCnWL1mbe0u3g==
X-CSE-MsgGUID: aU13BFlhRbmfQRmQthXEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668685"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:40 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9wphq9cOJ6zYkqQ1ibVRtgMu9j5PXBDopDaUreW4usNgtg0B3dvPOC7tVnqiPUe0a82W+HpUE1wai3bgxSORUCFhJ4udehtL9a2p2YTixZIQDeaWMMl8A0kOlz4w1QNM/PkvSBJK9jeiCCN7NCrX+G/4iNiXOhzLXH+Fes14qiQ2G5HIG4nKCNowJzSdynmN9P+1iv4dtDPlrbVajFVRR5rUk/ZrvQSKcObZQVqtBd9e/XdXuc/xuMQYAkF6+WKSEpfC3Clyve1bCSAfjlXo83HHrIDnVUZ6E9KAPgcUq9jbPYxARL7xHKRjvZJGw6P7EmbWTMOceXXzBCgQTXNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbXZIo23qRmvo6ELtsd85pbd09X8qvd++6yp0GGffow=;
 b=FCJ9OF6ACNeCr+gt1FwlLCCqDE8YMVjywhmNRMhcXHlEerpSVSKal4/rMCi7VX4ub4XNk2pVo2jCaUm71Zw7hZ0bgLgQH5sLI4fMA5r3j8Cx42+gJPTiu3rnaj6rLVer6bJgzp8P3r9d1JVktmhH9CCwWlx0VDqKxdRdsH3RLjgNLvHMHyQRenQFh6pcLY1RVXz1kaMWCuMGXP2JIWPAwGQXawxx7Mecg2zSaAZd2Z2wGeYQ3QrIIdNMvVpTbVMXIaL4PuxW6ciGM0Qpnz6woxexMF9qpKEWmZwbc8VeOOVGxpmJfR7vo32tB7qTrGR2KBCHqGdWmynFbImtezbI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:33 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:33 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 5/6] lib/igt_tools_stub: Add igt_load_igtrc() stub
 implementation
Date: Wed, 4 Feb 2026 15:16:07 +0100
Message-ID: <af94dc0971f27dd33a3424377102301c1cb0802a.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: cb698dba-ae71-4d4e-5ebb-08de63f7ffe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2RurxIcidPf1obkd5/RpOHD8b6U9WAO+X+6r5imyZD/hlt1d5zdZuC0hQqY3?=
 =?us-ascii?Q?M7uVsqYpAU6wLzoDNuTt2Tc0d8w2b3FKtwHGeHdnT8PGMzCyN8oWQV8mcfaH?=
 =?us-ascii?Q?RoRALa1Se/ph3IicyRjfLqMQEmxrSmnooyKlgG11Mn9IcVoo/dBzwETQKvgl?=
 =?us-ascii?Q?D+YSLtjaZnV8RWXLb78fRL6xcsYv5/qCiGq6p8pKIN+JB5tj5tRag1yv+nJS?=
 =?us-ascii?Q?lI1M+bkyDHWoL4mIYgqYdt//A+CJ4nCEemd/67jkYI/pawBGIt3y78R05NO6?=
 =?us-ascii?Q?mZ9zKBqumDn9Tl3nhY+p+TtoYl5HFOjFLmd1DmUS/bxDWjMTaiipbhvbtwk7?=
 =?us-ascii?Q?UKMVsae4oZ4/yc6H150NrUUXI9DSHUO4abaXismoRAiURkue4+pvYnMU2ICK?=
 =?us-ascii?Q?/fla/ppHkzJUN2rVLkwiAPCb8YQ1BP6RVhYCRSOrpnCnHyZpfCfkopXDT3Se?=
 =?us-ascii?Q?+oV1+PvgNKaSC4oM4FiymfT198zPgbzUHmSlMzYmp5ur03WpJBiT7pXylPDz?=
 =?us-ascii?Q?NwLVwFX46EcjreZFF07XnYMxye7LEb792pZoz1tml0jLAVBWgWQrV+Pt1mgY?=
 =?us-ascii?Q?a8iEgstoJhRSYose+6kSD47Q2FyP+SIWwJkvS9AVmxb8zt7+dHBAcHendcBx?=
 =?us-ascii?Q?FrYoDHM9C70MbHTQNyC/6rIvGUZqh13+P+cGVrXChPX12ugVXL4zS0vmf88O?=
 =?us-ascii?Q?Ry7r/UldvzoGBIzSuiQVo5xRCLFadwL0/PtBJXyA1EvuNUTgMiJ23pRAUxsi?=
 =?us-ascii?Q?IZRBAFQMqo0c6WRBzLfvKa6/SCDAP9SXCWSSlmC10lw9HWhUp57UaWMkgjGt?=
 =?us-ascii?Q?g+cRS6aaMv86nUshTA5K1uqf4aXM3Zq+UiUc3xaNU/nnZSBdNIRONkDoJnrL?=
 =?us-ascii?Q?RhuRI7mBxI6WSR9FuCtE38LtDh2YrGGEMvkGvA7/XlT+uxPMnq6dO5NEpscq?=
 =?us-ascii?Q?EGGtSyIU+pbnSk93dGoL7UhcXeJe7Y7SGekcdWdwZjJNTjHUfAu3EXbeNQIj?=
 =?us-ascii?Q?aZUwLaBbe4rFM8F0G1kAZZW9lEJ7ZFYm0aFH5F9H90yazYYZVf7u6oyzAAmw?=
 =?us-ascii?Q?Djo9nzN/ZYZknOlmvMeBo0eTZg6WL467SsUL86mOswc9SsBWuJNXgVM8PDOC?=
 =?us-ascii?Q?2xcSiHuDPBPzJ4FhRPkZygxY2PTxKZUXyCkMMvkCx81wf454iFeDauzBPxUG?=
 =?us-ascii?Q?6KjXrVvVhHnhQ7RCggnTu/uEbzsoEhmdl5LSkf5z00H92dzmvaSHI2jUCX9R?=
 =?us-ascii?Q?PsUi6g0+tlC8y6x3Bka9jEG4Qa4JSeKcbyrhwsgsgsgWxiWPxRqFxbAtIoe7?=
 =?us-ascii?Q?cB5jyg6RE8tncIHgiPFjshKn8qWsX7ChITJPWTDfsTPfJT6ZTz0g99WUTw5L?=
 =?us-ascii?Q?24TTK1RmlEMMvEwtv0eIxCA/55Mu0ttPXJVPjKIlFlWH8YiYfxiMXbCT7h+Z?=
 =?us-ascii?Q?lH2W5CShJ6oZEZ5lmNe343D1/hA8Owl+zdlE3QrhDP1QEbhtdnsTd5xI19io?=
 =?us-ascii?Q?DFWHADu8Hb3JAqdgkuY3mq0NzPPRINU1TdHC0m/eC0IUwb+HpdgViYbeKHBE?=
 =?us-ascii?Q?+3atBsIl2Lgorjg5yM4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuaF+tBlhs4kQxROMjx/YCs252PQ/M05Kiq8Qac+oNgGYutA81v3IZtZbKYo?=
 =?us-ascii?Q?qBdIOoOX0v30xcaPIGIEFA9FK3O2FJ/3wAKfiCmrx+xqwA7sQvPL8+jm5tK1?=
 =?us-ascii?Q?IhXsPgL5TlcTpU5s0uPvftSCj0euHlJqvi+RUOKNpUU7xvc+dJWhehjjJX8m?=
 =?us-ascii?Q?GZfeWhGFJVRuZK6rYHAfncPV+qXiY/+xv6rTpW6wb1UOZF57yQfdmVjvE8Uz?=
 =?us-ascii?Q?pK7tXNTm7OYXQ1W9evTvqV2l6h7oNdUfy5A1cy74kw9dqMHEj8wPWQn7liXT?=
 =?us-ascii?Q?UKZ2SgFMkL5aHNrdwpV5hmTo8lyLYKtJyMNr2Gq3tGNtql2CPmPdxI48Tnqs?=
 =?us-ascii?Q?w0CYqGKtu/LHEySWNbHa2KkaQp/tr3y2YdzkjilfFiFGn+QgAhw+3tl76Pi5?=
 =?us-ascii?Q?Ku5jcFU/dZaTbV/f1jsjYyyuHrIOggLxgmOIC0yFljODoMlvS4co7IOB0mD/?=
 =?us-ascii?Q?0BmBgzcgKFtaE7qXCBS7dK/ZfS4Hi7O+DIEzwhsdcKLWg8m6E+jrmIjtDFyI?=
 =?us-ascii?Q?ICuE9FoJ+wWRGFEd+N7AlToz0nXhiBSPQFAKdq0lod0ncLwFxWwrJG2UDK4o?=
 =?us-ascii?Q?692OhzN6OZRnasl7UAsLjfY5wXRlx5Py/yK3sUxeDf4mW0yAlGiNB36edBS9?=
 =?us-ascii?Q?lizM94JPnjpu0JhMPhl70D+1N8qjY7m87zPnTCgKEy9f3tYRkl9f1H67iEy1?=
 =?us-ascii?Q?OyoNdO6/KVH0QIMznqS9nFChOdmdzUpAOT5YyjCEzopGR4iJTUPbWn4CqX01?=
 =?us-ascii?Q?7yyS+EP8mVjXNwmdi7Sau+DflxnakbMPSZLVCruvlSkFpzr8aZfZfiq1f+42?=
 =?us-ascii?Q?EghDl/6SSZrL9adIdHaeN5eJcab9FVLDtns2WYPGJVQiMFXaufOaUVrMK+K4?=
 =?us-ascii?Q?DuJ6h64np8JgH94UY/GpNQ+6lFDsJ91rJMlJ7fQqcsNyEcerBAo/lD87mQql?=
 =?us-ascii?Q?kcN3M2gWPRybl+6WtF+REezUzFBDD7t5i9sgv1k0O+b+KPGBcJdIG+I8PgTv?=
 =?us-ascii?Q?Vz7F/VjnE8x/wEgYu/WJ/2Zkpr1rbvmdtfF7taQaih8HyOWlF57Pwm1LdFBa?=
 =?us-ascii?Q?/vfaKfLPn6qU05rGptFXXllE2mVe1HdRfXDs5glVQkTJtt509BDYOLwz8XFB?=
 =?us-ascii?Q?QLNA4gpzy0EQNDFzkvX/CjLC5OHYnIIvodEIAIzTJM3sLDBSShODBWrSuU8Y?=
 =?us-ascii?Q?xkkdz2cZKqVZuSH/r4yy8K54Bwmy+/hGcvwWKMLGkPlxF4xtrCFby4RYU6mm?=
 =?us-ascii?Q?bClCysLvV1jmZPNeGQMeiXxxLW2KXljs2L/w+IwzoXpX3fLkELVGOZFbEZGo?=
 =?us-ascii?Q?lBAwkFsew9yEIngn2sH2i7EWiH/RhbGhFXj9KT8NZNCsrEuaFdNX+BxazJ6T?=
 =?us-ascii?Q?yzlZnHh9cR14ZzwA0XNnvS6/3cpMn+VBy+qoGXZ2XiOQe1/WvQYh9nmSKT5e?=
 =?us-ascii?Q?RHIMXs46T86I+CKU+naLyDw6OGyt/r+BDMnXbt2Fz+gGBtbt9aPlllKcj3Tl?=
 =?us-ascii?Q?X7aRyrYe8+IcsIuHD6YN/aoH1UIxIb1e6BK1DDXJBw4LM23P3J5LhRTV9hLu?=
 =?us-ascii?Q?5Hc2kfTbZkh+iIYtyghERTu0l21q/8CUqL2IUMTcFDaKO2+PDdNKnw1AHueS?=
 =?us-ascii?Q?xcaaL7d8/0NNaMxALYyzOXk0LggBEzXqGPjWVqlwC+glL02ovsZeJ7VKRJN8?=
 =?us-ascii?Q?TS8R1qKnZYfPIQVHPNwCkHKW+KMRlnYgqWdGIDggNJ3aMJi3Nn7Mit6+9e1b?=
 =?us-ascii?Q?tw4rH0M6NmaagMwhaV/KeCjNBU/2rQ0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb698dba-ae71-4d4e-5ebb-08de63f7ffe0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:33.6006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SumKJ54W+T0YrJlwY6RGMCY8IkicO8xSx8RQVW3JwPaC5aoUkwJ6zf0iQ+a7R1tZqCuNQUtmcijll7IBf/A8D7W4n2aIm3znLbyQhmiagQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

Add a minimal stub implementation of igt_load_igtrc() to allow lightweight
tools like lsgpu to load IGT configuration files without requiring the full
igt_core.c and its heavy dependencies (Cairo, Pixman, X11, etc.).

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_tools_stub.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..ccc393913 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -22,6 +22,11 @@
  *
  */
 #include "igt_core.h"
+#include <glib.h>
+#include <pwd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 /* Stub for igt_log, this stub will simply print the msg on stderr device.
  * Domain and log level are ignored.
@@ -49,3 +54,41 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+/* Stub for igt_load_igtrc - loads ~/.igtrc config file */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_loc;
+	GKeyFile *file;
+	GError *error = NULL;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_loc = getenv("IGT_CONFIG_PATH");
+	if (!key_file_loc) {
+		struct passwd *pw = getpwuid(geteuid());
+		if (pw && pw->pw_dir)
+			ret = asprintf(&key_file_loc, "%s/.igtrc", pw->pw_dir);
+		else
+			return NULL;
+
+		if (ret == -1)
+			return NULL;
+	} else {
+		key_file_loc = strdup(key_file_loc);
+	}
+
+	file = g_key_file_new();
+
+	ret = g_key_file_load_from_file(file, key_file_loc, G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_key_file_free(file);
+		g_error_free(error);
+		free(key_file_loc);
+		return NULL;
+	}
+
+	free(key_file_loc);
+
+	return file;
+}
-- 
2.52.0

