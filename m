Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C2CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF50410EE1C;
	Wed, 24 Jun 2026 08:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOonZBMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10E10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290868; x=1813826868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SKN50rcKRCiKuo9vSKgorUj/ns6sqSkANlz41dUNSn0=;
 b=jOonZBMokCcczUAzcw2H865cDeB4hjzTc1LEmwEZ4lgLd4qFI9PzCxSd
 wmFcfUpQPnTqjU5V7666Kfu+vEu/544lHtWnsmvkhxN7P3VYDIM1pDNTG
 oT5rI+k5+DcIdnQ7HBUIigUSqrCeKs0bV6XYRZIPWhshRnLyXjVtUHBZ7
 IhelV6VlVBhKOhGZsrDwRwzIY0D3f3rPGAIbnVW1Ir9b5NpiR044p6+Ut
 1a2goha203MvkUuth4i1zllt1I2dSXJYUOPGoELd47oBHWzr0lEHu3ZeK
 MVVTN5ST5w61slqmj4dSA7pM4sAxd7nFSogM7Zwe3vw18qoqi12kINxI6 A==;
X-CSE-ConnectionGUID: 0Vsqvn6BRHiDxLy+tDahwQ==
X-CSE-MsgGUID: Vm5cHjtfRjGOp3qE/dLLoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142257"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:48 -0700
X-CSE-ConnectionGUID: PvUsEEKYTOelxqlaiRGIOA==
X-CSE-MsgGUID: GdoXZKUNRmS5A/DWTAtvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432158"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azcSpKoMvjaABn28Bmei08OD2KsZteCC5o4Xl4Q7Hd8QrMPWSu6J9msC7PYcnjh8OjpnSp9f1l1wvHM2jHdikUMTlMb+BcrSZqIKfnkNsOZlyDsjGN3Nk3b8umUHH3JK+H8H9Cr/Gm/UCRAzeqNzpb3I7pxBdaQiBv+zQpp5qy5Ezydtynl6hf6iQXCicP8Ywevs3BOQGJOpm+sDf/wvquucBwmIG8KXT7fI7flItrdVcsMZijT75XqrgCFJKzT8QvCQ85XiW7qnof/Gj8tvbgdECDyLSNEBAru59Mz2+oOZM1kmsfktzbdUfjd3RjekTfVGcBzyoStD0wywbJs3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp8e6Z+Tsu3bYRjZoZW2Ey2Y5izTKXvkURjMXj83SjI=;
 b=Ri3brtStz7V+PunxMx9ANask2IHX09RyLApF3bm0+16Qg32a9Ah2OieSJ5qBiRbl/PFryB8sLXK6VGUoUX4Or8CXqGBiZ1r1APiThi335Wr534m9B3ISV4j3VZZhOuz6WUjJpLr9B5C7UbQqKRjuzTpscQDzQn5Cvft9KaUNn5ZUN8u2Sh1fhRlkeSkYUUKmfMNWnIcvGBv9K26bj6u6kSo2ViwD5ssGgO2Af7o6zOVjQ0BIo2P3clx1ieLj11/1TnbqzpR3H+HKhMfQmBXolyEA9chT5ulCp66FZyIclRRp127bQn8q9kAaauRI7JQXaHT/cOFvFhHSeiZqs4/r+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:44 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:44 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 12/25] tools: intel_error_decode: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:19 +0200
Message-ID: <2a09d222ec245f17da0103e8a5b79e18d28b4f52.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: cf439c93-97a8-4168-f5d4-08ded1cd421a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ydjtDr1+PYY6RhdfWM8TAhsggzEkY14F3FJ8PhzyNRwm++RFnnyzaWEwYU4ljJ7PRJcriuIiTmejKZK7UoBq1V4nHGk1i7qtQr4e1+b+IbZIs88q4RLOyDpe5TVTMdhJgluQGWyJKZOM3/FpGyTYHDHAsCBC4kwM7E1oqkvSXNJ6KPzl+LG6Ramh61uwR6DSy6Nwfu63iOc5Yk2yLaYLT82fwTNeYhuVTprA5D+9iBnezA7nLZFiooBMa4JNg9uNgqORqC6vqA1IVcKpYIvxktoELLzIFXrfp3gYnA1NE2IG0KCfGQD/kXHoMKasv/9qHn2LjG38QKXckCtFiuxOjjKCYoFBJL+paJT6ke21LJtr8c48NFJEaVN48QQI0gwMeo7Oza3KdXQcBmhvNPQJKEkrseX1iTH29e91m5s5xX3Rr9HzAIF/ZhFI9pO+al2Wv6uYRgQJNdyQ7bCTfI95KB/xhXuRo2LeN7ADj1n4XdFwp9H0hBVQyfpsSwfWNEZjEY8xhIcN+U4u/VhFPnjTy3MX3wbPI7dDwakfgVvPCbYseUJ1N/xevXH5fjYLEHuuJyQL0HVT7IAHkUB7LjWYq4XsZrkgIcw9RZW/VDSJ4TVC8jxSkwSRs6kF++1heI4vJ/jIzlr4BVIsIhTnVYvhmL3z5ksy6rIhLWpMlRLlYV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5zlkeiSNgph+ZJN7WE2PIDCkwSdf/jGsP9Fcg6DWP/yak5/YJLvn9Ah3ZQ/c?=
 =?us-ascii?Q?Y+e0zJkdSRGm2ipyL0QJRVsNZA0zZ9vt5My6mFd6GFM/1mcI1J0EwzGKUaih?=
 =?us-ascii?Q?kVrhE0509TD8lVZWYjgsCEna37DBcbA/K9JAvJQeA/dw0H+6mp/JXK3RSunk?=
 =?us-ascii?Q?QJI+ob1niWfnCLseH2OQeDqn9clhPwuIWYlA/iJ6jUyy3e32OUgg2TCoiapN?=
 =?us-ascii?Q?Aw5LKWBw+iuezC57ik+dZkVT5J7VVElx1XgxDMbDdxYc1/ewqpUhcfnq3ueA?=
 =?us-ascii?Q?6m/oQOmx2mxbM6rD0jVLp89sqbySj8TXP7OPicW9bz09v+8sdQfUR5HLBJbB?=
 =?us-ascii?Q?PWcSxCl+XLdBnXPj/UTosOMzuK1V8RTmTKp7DLH7vNhCj60s1JMHlR6mkryv?=
 =?us-ascii?Q?OXd9bTxxVyLEcd9AgpzauRNLMZZw7gaWjxXsV+b4JsPfR8+HjsJ5DVz1iuBE?=
 =?us-ascii?Q?Tk+OCyLGdOLCzxabv7rXO1B4dN+H97bOWjr2nYlYb7ZdQf1GABpgexztVcZd?=
 =?us-ascii?Q?dZgxpuromAUDQnNgVCg7J0gv+XRWJz7JWB/AGZNpRjRXrJhHTVSJGYgdSgzt?=
 =?us-ascii?Q?UROin9euCttfty4nb5DmwL8Lz2y9httzSMvUMnR0gdxRulzeg8HzFA0722Xd?=
 =?us-ascii?Q?v4sguj529CXafhi8n7X2ZdeYzwuAwY6hBW3/eeBiUMpf8bE/xoNIAAiZ5/PM?=
 =?us-ascii?Q?tmor2NCPQTOi3shhmAZzBoq6/TTBorjcIJq98QCUBe2d6qupsMDGv9Hahf8R?=
 =?us-ascii?Q?Tb/lW9Tw2sY5ouRaGBaYnV+0V8eO57XufWgBsuJ1K8mcdHUuTOpePkcX/K18?=
 =?us-ascii?Q?uRWBym52Eqnh7AagMU/P6MAx4RchMYyorzqYuQ02OWg8J/mYT3Cror01ZEcS?=
 =?us-ascii?Q?NlS84gIzbjG9n422fNuFtBnXZBivks/nFQSwdLKlXqlFXmm5LLHPzU0uOxIo?=
 =?us-ascii?Q?/SLWrx3X/yq1aLvfNQCsGd1r/mjpNmuBHP6E3rfI0TPberRWc1O8gSzQLKCp?=
 =?us-ascii?Q?lMqJm03PZxOkA3S63LTAMGBffMJMhllPtJ9ba1de/HJByZO6nrVyx+FA5fVr?=
 =?us-ascii?Q?mH8fcdbotCXYg41zXRBvZXKHrf4A8WRZJJqUMR6WwhPfzaKSST4YJQpSG0AF?=
 =?us-ascii?Q?xXqe7L8hc9Xe/zGd/fHbkL7S++4TlNmvHy2kHKRK9ffY48d0StZuyCpeBuGx?=
 =?us-ascii?Q?eDZy5+c+v8waZoXqM3byddL61NLFrd4orp993fVv2DDqpd6E6UHnLTclhcle?=
 =?us-ascii?Q?JiT+1D11LLpkoICOCOjy67Uf3vaxxQVt0195XnjIZiQrFiVuNNt6nV/IUK5G?=
 =?us-ascii?Q?Ohz+Jx18GNp3p0O2VLAV6A5wAFd4es6mAsfICkEZ/TgTpuIKmfczbygENJxZ?=
 =?us-ascii?Q?X/5Pa9K6KaA8Fv4oMJz3WECVx4TeIHFeIkPEasTjPMrsss7LpSvp3ErDuT+g?=
 =?us-ascii?Q?X0n3ITthMRPRww+qczAtC29KldSQw2D3pxhMDsZP0MXoOlJ+E5gupFxYDynZ?=
 =?us-ascii?Q?OR7rvoP9F5l1eepbzQPW015imdq9/kP5g+Jtfv9JxiXcUEX1QeFb6zHBFwBy?=
 =?us-ascii?Q?7hCTzRN0y+YmrmqTu1RwybeBODjcjkZ53/w8OPDHMQrV2lzVxcx0uoi6qFKS?=
 =?us-ascii?Q?MDQ+Zit0OVu32MaTWSFfDRDCJA8T0NbVdg7xentM5g+owwK1W4+6jX4/QcS8?=
 =?us-ascii?Q?lRqzsHxnXrMyosJlW+SdYUalBcDo43TsmHR5IZ+8PNt4K9iCr9q3CxHcmX0e?=
 =?us-ascii?Q?UnfINhQQr5lzC58H7eXQUZ2Swb0caqY=3D?=
X-Exchange-RoutingPolicyChecked: lOFC7jOBKUxq96KS+9FpRRNN7JBXOmjJ9PTnLe/DfadOqxP02UNEav0q4MZyTOm2YsoIXf6ezcDpUBriEML80QgAcbW/mPHA+WDR/sH2GFZyZhgBObWWaqe631ZrM5Qkg6rSiXx42g8uoYWP0MRc65PXIDzq9HUAIXPQY8CkZgajFKAqB+JDNP4+5P/tLsVPofbJ9v2XYGcGBBZaaF4x6AYc6zIJX03Vy+/zp6t8pFZF6zKLDy9GaXjky77DJOb9YjxYe1ebllW5gkJkBg8kcjjATQi/rm3TpcsVAEZayVljRpdbHGkgB9TCOoVte30Ak7XYvGupG6N/P3/iH81QRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf439c93-97a8-4168-f5d4-08ded1cd421a
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:44.3140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqdLiZGVgwW1oOAUqiA64DSK9mSsQBniViWQJCcBtiEYZDO71F/ke0b5NN32MjoJ2pJhsjH5ZUd2BuN/mkDvA7EPAL/Qw2Kd+hLcb5M+bT0=
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

intel_error_decode needs the batch decoder, chipset tables and zlib for
compressed error state handling, but not the full libigt.so stack.

Switch to linking against lib_i915_decode plus the minimal helper
libraries it relies on.

ldd before: 35  (ldd | wc -l)
ldd after:   4   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 467b8eea1..b04754c5e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
@@ -84,6 +83,11 @@ executable('intel_dump_decode', 'intel_dump_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_error_decode', 'intel_error_decode.c',
+	   dependencies : [lib_i915_decode, pciaccess, zlib, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

