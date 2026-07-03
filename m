Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CF5C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CBB10F82D;
	Fri,  3 Jul 2026 14:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4eynhO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05C910F82D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088962; x=1814624962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f1SzBmUhTCSpYaqOIMR6o75HvcXsqrK2H+cZx8hLwrg=;
 b=U4eynhO0Yombl4Y/zd2ObVUOh55HNi4aQvhimUKeCaGXx5zco51viuVv
 Ib0kUuUkGiE1RLnsJJM6W3s4ttwmnP+sadLTw4LtpgL98GHsUO3YPttIw
 RMa+4aC4hvWCzqaSBLt1lRuKirj/SH6jUq5Hpl2qAP7nOPEAyzuoOOhtS
 HOBsLhomwAFkWJgB3Z6D+p959nL0Lch9u9V4WPIVY2qzhEpbIGUFcqBIo
 CGOHy9yfW9lcihkdMhYoxgugdoh4gV5cP+EFMCzoc/ZYm8FYTUKmgMCaH
 Ff2SvRBVVyaJpWlj/lPMEc8CHHzcVB6MLds/+eJJdmDl67h/XhvPZu5uI g==;
X-CSE-ConnectionGUID: iFEWCLUJR4qvyIzdkk2hug==
X-CSE-MsgGUID: ggw4kCwkSfaITvfp/JvWAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877930"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:21 -0700
X-CSE-ConnectionGUID: 8gvsbZhCQR2eod3uZNCSUA==
X-CSE-MsgGUID: /hoHUQx3R5KG+6SCpiZODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlLntgFupCUPCTDqVECb/qigJCplXgcG0Emx25ilfayvNLpxXplxXjajOu60QJXhPrRy1s+tyWjuN4OevHDrmbC9VRyD9whqV0PiERQgnPhwopv6oaswOfKTEAkx3FYYw4uINditoRWFfH/Gui8crH7rt1M57T/l0imMgRtpUlnXv3A+5N08m5Ydd3NQuiR56y1Z85ZoLemgkkCxUB6L1q6WbucI9F8gRGn/cfcYtQG7bdv3q4r2ylU2s/YJ9M3k8yCTML+NcvlWSXb11T8zLAKb3uAq5gROBi8LxVM2ytE9vUNa5EaxxcwhsnHqk9ZdMWJ0w5r9F07xvH8gDd86tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKikmmqqH9YMda2VO+yJxLvA8eEML3B5jaYQSqMvYvo=;
 b=x5ZJE2/B5IDfiRB3ubYm/pUYCgeSraIlaV5GRByNN4+1L74S7/+WyQNet8Jp00L9F2dvb50zukULJqIcfsnlrowNavqT2UApCarlpHC7VpK3/gNRuxrCcugw46fIh1NoK2q7ekGo2T13alc1cM4pQ0IYYHh8bkLxFmyxRLozQQM3Ws1kFYTo9U/kW+BVCgMbwbvI1dryTKFDf8yvWynaMBNeqa30l1IhYP/heExKHc2xqZYrFozNxswTTqrLpOiQv5wZYFaWJ1/52NAYX0blSBhUF1Q05yRjaseIkSOA1SYP2VGLaaw1qzrp7R55vg0zx0GjZSpk0akZx75g/ls4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:18 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:18 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 20/31] tools/intel_lid: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:54 +0200
Message-ID: <6eb966962619af21ed2c1db21d802bfe1c8a0dec.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0bd3ee-dfcf-49fb-61db-08ded90f7722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Nuo0i3f+zVcw2HiYcJ5fvzMK0jrWu3JUjn9n2C5LUH0bme/9gys0felJGSFJeAealLebc8Stkpjn7dm9VZxAZVo0iIHEHX/TalccKQ04qNxJnsuQZlRtwMHVrH7FcjysMomdbuoyg1wQqcPFu2JGJwbk8ejkZ/TfgzfqF//2cPQ5dZd65IMRQsKuiGeu6FNrMjwOhcm0R//GUzRZpAZlCIH39jd3Kb8gMuCMNbSNDPLaqFq3rfec1cnY8ISWpQN3LA0hkERyLqtOuA7tkli2ebcpR9YeNhoiIVTCG/tPAN4JgYlSSXl94kzAoHxeI1FBVZQWnVDqZI8E6a+teD0gVdlnYaBGknJnz3olAzTV/gkQeAKmYrbuKH7OfhmYrs+t8QpQimiR91EzC8d/0BwVkyA74F6QDtcSdHwbA0KV8VEAb68Ukd1pxFYbhFmL6QT5jWALYa9Z0einrTYRxBm6hRxEr51t3u2BLZWNdkMTAuubmWyM9MAUcrG5Fqw7HrmmPJujjqwNAgBrDOzQlbcbfrnEqtVGJDZneS/cisHUGXQc/AMxmB1zyW83zkavuoAkqhRiTpH4UoGf1GoQyXmggefm6RUOmeb6qVmNMdWs0+s6/DPFjVmdEeeLVBjIGy3KtuPN9xwL6K/adnWOelxVzU7+NaF5k7TWsuAyWIyHkzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aYH9x9FfjDLgwgDGx3S7BMXbMhLpQKSP/gzc9IG15re9LEtT8QI5TLbgxSvS?=
 =?us-ascii?Q?Sj10EmPt4uVA4swKybYp0i3yDfLfNkoQSnnDE517PYWuQ8RPuTMMfyjWp5M/?=
 =?us-ascii?Q?cxypAfccf8DUsn4ALSnSEUDF3jeBHe04ndR86X+1JY49S8wlL0EAyvlDup/z?=
 =?us-ascii?Q?T5JKu80aHHAa+G1PzNBFJc6VQEh5FI85HSrohzOTLwy+k5MdyQsC1w41q7wP?=
 =?us-ascii?Q?O/uDovA7nAatgVarlah6Bskfv15960cR2fBafG+1igOtWmkv5Fv701kfkBOG?=
 =?us-ascii?Q?a5rr090QY+noUT1/1W11n4IHXObrDww/mueuAEunwsme7h4ALUnsz4/6/E7K?=
 =?us-ascii?Q?RY1gGeGcx96/sjg+FqQ9EaYSvAUNIeJY5/foXlVgvcPw61YKeqHp01IOu7/o?=
 =?us-ascii?Q?FRLxTuI1adonvCYPNJoq7gW7EuVa6xXyoHOI7pgLAg1u4czXvw8eMfj12bP6?=
 =?us-ascii?Q?JGoezK2aBZPa3NMoKkMvPh/TS41mhJl3T4+OtxaxGY8MBTmxxG43BntFz4uw?=
 =?us-ascii?Q?GxM6CDnCChAXdmjs2uo3HJpETVTj2AbRQFdC6UFmtKSU7bSnsBZKSmyXsp9D?=
 =?us-ascii?Q?PsstSOTMzV5RKt+Haf9EkgQm+eU2pH/R2NgkX12VL2TPiN3z/AGhFEtbsUs0?=
 =?us-ascii?Q?t+hNFz0lnVjvv5UVluwiWucPUZD5DR6qna5LQaSyI6uEPpL5qUA0L7FFPl9d?=
 =?us-ascii?Q?pm2/NaEGigioeWwS9YkpDlirKIxoS1wXJnvrSW1MA5dYm5TZbdmeQA0QgVfg?=
 =?us-ascii?Q?3bfsnRjmZCt/OYu7Z7goT6uQwpYm3ONqw3XEdWyCVpIgwIWLyeRHUML1ylmM?=
 =?us-ascii?Q?T0nILy/ad7sEI0RRS6PJ3f4i6rd3Kk3t/F1Y4Rd5++C3FN2CxWaHX8HitXgr?=
 =?us-ascii?Q?49KjdqdcS/yJLEu5PaOo+XsTebdYF8NVxwWJJtVcP7F4VAPqDwnvrR6HLl9r?=
 =?us-ascii?Q?EuahAHuL2ApNhsK4Cosb/zz++DeqnZhNTPVTsTIcwJdPrTJ4yXXudDdcQyFt?=
 =?us-ascii?Q?LdnMIb56SMxDZgmHJ6bOzF0DQXxfXI6wZ+BX6sSQl4Z+dqTgOXcBa8sP4DGp?=
 =?us-ascii?Q?mHt1pdSc2QK7JxwzPG8JYxyribHnbM7KGIJo/jUgn7LPYCch2gYWisJRIy+c?=
 =?us-ascii?Q?YwOp+Fhwd5GfZe86RAiHnaL7fqfIHlj6x6sQJWG3pcaIUfvI7NS807vl6Y91?=
 =?us-ascii?Q?SC21XImXT6ha0A8jQKCA9D7hygfh2gHh+65wC1ZffKCCC6C70fhFojFL48Qy?=
 =?us-ascii?Q?mOTWxSpNpOkdr1rR0KlVSOBKJiEsN3NwZxC2wlvdXBAgn9Lfb2YrjhDmviLt?=
 =?us-ascii?Q?f5AuCfaMC5vld3lndgNqDZTNABGUWRm2l8872LuFuNq4VRKE3+nf5XpGNZ+T?=
 =?us-ascii?Q?3qFOXqa+IM3PFbH+z+t97h6sFSfQkOMimHrA0HD0lbgl9vHog6vRb2rTRGcE?=
 =?us-ascii?Q?g5q7xcEj8+IzsqSNmi0QY0dWPx45uzbo+ilCrVd0zEf2RH+z/KmPdUcOXvfs?=
 =?us-ascii?Q?xLarRn9QFYZkoxuTG4ueD/QSqHZOFCwcKqlemfSryteL8rFQdUBSrFsxwaYW?=
 =?us-ascii?Q?qRuBglBiUo7C2pYCTvqSzY6dgzB3mQDfQ8ZZm5/a01dJOMChynAFwjyNjo/U?=
 =?us-ascii?Q?EbDFJVnuXdYUWyuQgYvBOaMgSt/Uss9qUnUUOp5EOaBllR7usm5ifpp1wXdq?=
 =?us-ascii?Q?sQM9Yf5S1FGkepQ7mCkdi84PH6xyw22dhXw702NDrvJJkT4JB69VBfJSBhAH?=
 =?us-ascii?Q?aKV81oRJQYPmS+dLH49uxv/7viBE4FA=3D?=
X-Exchange-RoutingPolicyChecked: D3/BtLdZwv49VH4sxmdaX8VqQcOUHIMckl1b0qbvSnVNN3NC0rLYHlmUV8D/iO8L7nm+HLtowlQoUMnR+8jli+x462DD6qvFJTccfstW1E0u6NzhpCQ1K3hgZGHJ1dPqOqX9Eg9gzqAedEfmb9PpSP1UKsyc+nXQaGHJG8VO4XUXv6jgGKVdHjfEyIeODywNaXjT2L9De55ilybyMpBNzzLdvNm0wOmp8l0dDA7AJ0yCvFs+qtQSN3ryNqQmG5tHWfPAOvFOSPpw8H4HHyGvjoavO6STDwduKt+AtuJD7G17uWKhgKPlU1l7LPwxS0pFU5w55Kp4v+I24kQJl/b4NQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0bd3ee-dfcf-49fb-61db-08ded90f7722
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:18.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Houo87q9WhD4On8ppckApSxH28eTx7Dz0burxpPNAi8rHYwJt2VEeCl9kcZpHI5qw9W5/nuJOoDm1mAXtSQ1vhcu08Mio4lI/mqZ36AN30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

intel_lid only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8899a5b49..0978f8f11 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
-	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_lid', 'intel_lid.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

