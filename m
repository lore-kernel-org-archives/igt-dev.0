Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5888C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7610E793;
	Wed, 29 Jul 2026 11:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOYm50JQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2935E10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323022; x=1816859022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xajBmh+VDPeEoId2aV5kCzkNMFTShVJ+CjBVQtDGl/s=;
 b=hOYm50JQ0TKfbLtJ6tbS4ESPhV5xm/P+Rw0x4R4Lio9FlJDQBkzIR3ge
 D8mw4EqCNGpdNuS5HhcpbakpHaniONCZ2ZVM4MAuoZOAdZ4vCu/gin5+w
 u4uSgJcm/Ldu+76IEube/K08PJ4tDnoEraIytk9vOYG0JWjLm4/+AjbMH
 v/3KSA6vI2okdpcUdrBhoFcisDeXAQt3FzlNMibilQ1Ku+ufyWh+IlVC/
 Hu/dAyaD8FvDkhasx+zCRyihdPM13AguO/X0BSJzHIBZCpqyIBAXfmIjR
 QIdDqdItjj5N2FMSrLa3HrHYHYl20ZRGq9FsOacXNPZrrmugD3KQ5OUjT w==;
X-CSE-ConnectionGUID: ReA+I1wlSZ+lbarn0sjz6Q==
X-CSE-MsgGUID: wR8GdlzSQHeP9BVwsctaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719024"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:42 -0700
X-CSE-ConnectionGUID: vo40AZQNQe+/yRDuShXkSw==
X-CSE-MsgGUID: JNK+RQLSQg2JUNrZ6B2HdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204814"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMcwIf9GQBeuCk4AAVJ4bfuPBb6DZmbLWgtY6DZIzAna2T0Kzr61wEQhqZazh29llsKCwbRRo3sOV+jCZREiQ3Xls8kHlsx6NvhtSRyZPgNJ/7OR2iCKyommInH16ZwzhpmXwCxplfo/sK0gCw1Y0dTK2Zfbn+CBGOMVm6TL8v2KQj4hjGqWCnl8BcebQmUvMG+JQ77x4elEwrPg36tid/uP6z2dCTu/nsjb8a+P/6ZLnKo7MJZhgM8xDdUXmuzjKVVN0k1sGNRTWQq8zDSVipiBvGeAhCJ2lo8XBNYTiCggsfIvugJZfbIgRDDN1hReEuSYgWTcFkdY14rwDwlLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xrxa6cAwRCpddlkAyIC65ulGOPsemLfOoezL5PrK+Q=;
 b=ZN+LnZSAvsGSd3hIznr75Hm/hia/C0qGPxVhKH2OKSStlRgxVQ+8I7viZvALvoS026v6lu9RCu65nFNjuAfBNWcBNo/w/ks3GVLWB0jlRc+BqFZlPTqqOmHmDBoC1wsWeVfrwqZYK9W9rzB77PrWU2qYSp54u76G3d5lcwU75L4amYYTis9KdGVG2dSXqJxEAOcq4CN3/29lNMGv9GfDND9FK9l7JNC2MVYjFJqjLgl62RCJCRuAA93G58XMXLcWHkgA9kDfBxWb1A44JP9Zha2f4DSt/ZFjQHRukTnrGzltGiJxntwI/cmTqr2xUba/dC9AK3xbjFbiEAjElo2K+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:38 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:38 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 24/31] tools/intel_guc_logger: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:41 +0200
Message-ID: <f32a8e074c60e5cb26f8b7feec3f4ca6ea82a892.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3de66e37-2164-4260-d700-08deed6109b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: zgY+wp9c8ssW3+/WkOeq18SQ/PTZegYNriO9kpYlKQaqC+VNsckYOceV+PI0dze6kNqb8k5SfAvpFkUYZjU9iKpA4f4AOWH0JIruWfzJK9liFsoU0KK2LfGuJi3E1ATjvm10w8ZHZ4eBXKUyrzy+sXvpMfm4CO4oiDl2EEAf7nt2b5s/Nabyb3THVF9wGBJZ3DnO4GbXldVizdsv8DT+tV6gxjn6KspUvKAYd8xbQJrPw5CJkhMO8tbns/g85yL7b482WKcTeP7tMtBGAujKEBwJ22chxnSuwW6lutKBBDG+FUji+nlnhc6UA85JYh99N0tOrJIaPfpn3kUaAv57f4nMTZVszxTHlqeNGD/JtlfnfS77vhCejYCGwXsBNw2Tp+y/Dz//ZHKBodjATxAQlfJ3ItJ6AkWhnO93y3vuIbPtADIY6fLuoawLfBr+sdaa2EfT03JH2Jn49hhUjwGcyTOpFU8MdFMbZHNQLC6lZCyv04Qqj6PKjhoCuly3sWMgiCjT/Nf3n3hAZjsVP5yjUqDLYrPf99snOz84uGuSPKdZI41/KL4vXmO+LyC5DtkK9yZ4LnPeLhGd39GaAWBQOcET3palokE2Eu1VBfHJvvT6PNVPAGYuSbznipKa3egAx7JFBsXRXCR++A/ODMFUrrKMsAN7OCmIrChufldkWrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yeruJy23OBk85EW0M6JKOemSFIBOOiRH1LKtkYWLo7Qh4NwrTHu7av2Mo5/w?=
 =?us-ascii?Q?+iRhvSR8H+lQK44GbKG8CTHHagEwmkM1aSpl0ED9KRCteIFA6avtVV21gfqC?=
 =?us-ascii?Q?hATSgIDr0ohiGfkjPvDibISY5RGcDy3JBe7fE/Nkg8Vw97lgCPIBXjxot9U6?=
 =?us-ascii?Q?Z0dDqr63k3HaKYAzGQVrorcrNhkhDq2p5LidmqWdzj3la6tvlh3mih4GlBZt?=
 =?us-ascii?Q?GzCWMUADFTQ7MTnXx6sYI1sIDHBf1JuUEWq9nProbgkJVm8sz2LIIpvPiIL5?=
 =?us-ascii?Q?CLIff9Nuj3CZrJm64L0eB7ylT8UN+IdwAgVTPdNUEgPDH5djbfZG7fESZOL4?=
 =?us-ascii?Q?Qhknh+9JW2Pfc+yEEEbV7L0KxATWrCnZRqEIBiEvRTIreuDT3jES4Ft4s3z5?=
 =?us-ascii?Q?LLYxBHq3j6pfkUbkwf4pkrFbBleLnyZF+vU8NH5pzVTHXkHEpsK3VsQG14tx?=
 =?us-ascii?Q?5+crBIFAhK0L/GjaZNiL+pQ/oWc/4I6fpXAVk6Q2RKFtBicNRcpe9f0ogCjP?=
 =?us-ascii?Q?6FyzCVR8/0QC5pel0HJT2JsajrSqlIiDQPH8tXkXcMA83ubKQEhUh5XOOCKA?=
 =?us-ascii?Q?1Rwpx1Y6rO6yCV+dCErtMNBdLv6bRFzSsJOemzmju5b9sy/LJ9aZuTdxdnNj?=
 =?us-ascii?Q?rz2KJtsII1AQdbUsLwKbQa7ZWliQc0MWtMb+h23z8s9kXypAsMSToNqJtcF7?=
 =?us-ascii?Q?3c4FewYtXgOADCBJdY/qmXiNX6aJq3A9niHxNZFu3rSHVkwaddTji5VO899l?=
 =?us-ascii?Q?bhssYzncRhiBeZQ/Q00+A4f6x+/krNwv4kGZKVfThbq4qVrJJilypkBy88XW?=
 =?us-ascii?Q?Nn6Nskmg8RQm2L58YBwHsTlpqdimhC0hHyAJE+Aq3z+DnlXYBG1N2FYUJk8D?=
 =?us-ascii?Q?i5hkTevaqw93DXw207h7PDJxD4VhjkSsgZmO9Yam8ihTnP5l/9bysyEoMys2?=
 =?us-ascii?Q?W6fv/X6ug0972CR0/QqHDdInww5CqccjVgBXn6NKgUNuEc72unub7KMGtITC?=
 =?us-ascii?Q?CTD3pItMVX2JZxXltXPkP2JVGhJ5HoKhUtiHyrP35jrM76+UfhFq/TqLX1Z0?=
 =?us-ascii?Q?k7bwesQ7aODIWEF+aUGx8YESMK9Wnva9vxqU84zX1ErjuFqU10nIlbO7Q6G2?=
 =?us-ascii?Q?R/Gh73zpQzM15DVctYixNF1ldSPWTVcQAg/wf9KrGuyhQ4J4WO6JOctSlE2J?=
 =?us-ascii?Q?JNDuFRhrqmwEzzbRflmVXicJtlzfFSZC8JgZmwLolzr90VSZOTWmwYksKASp?=
 =?us-ascii?Q?RR28PLi8H7JLDr9ByUPYi6yTdFfybz8jJTo9tzNpdkC1ORBeLLDzEko8ZEVl?=
 =?us-ascii?Q?d1QLWVxFrdcTHKXI3uVLBy8yWVioWae2HKDLLJP1aMNdReKf1tCxKmzGLWd5?=
 =?us-ascii?Q?dFpHzCZ+pP06fKQgxlcllY9VTuza8BKm7X/bkZLvhxr0/ptOQcJjbbMW5Ivn?=
 =?us-ascii?Q?/U9450wDxA6mb6HHMNJ2NgcE/0hV0EJ/KCd1rNQr6p2OwJ/DvkqVh3w7gpK5?=
 =?us-ascii?Q?AuOXkY/XL0do7FOJIXoVZBeYpOH/OodtcnzFUswEvqQwuGQpwYffRrl05W3B?=
 =?us-ascii?Q?RyxsitNBPbncI6Rts/pB2s3qiYaN2hodoSNzANygMjjtCsU+dRTQMk31raB+?=
 =?us-ascii?Q?AounwfE4L4m0AcomambtHmtylRAkjFs9wsZWg3dTQnYcfpq44q4Ev8F5vsyq?=
 =?us-ascii?Q?ce48rWlxaWETqe7rChSQWyiQLMfxkOnKcFe2qxb5imVlpQyvI8HXTtI3S9db?=
 =?us-ascii?Q?GqbLUmDLLyr2JtkPtV19R27qnAV1vcU=3D?=
X-Exchange-RoutingPolicyChecked: rBbFNmFp0uMjzYUytKRgJS2v4IQl7FqX8sBfrsKtGk1JEwn2p5wUTz/zxnHLYZ3dRYDwndhKMZpz7Ixnp09U8NMSveL7rgl17IvcoKt5O2LNATJMWpDx/qdqCVS3GfygKaDCBcCrYkYyBUG5tVfMiphe8/eLy0CCl3NbCsLaZYQEi/MCN7tUM6EcMu/vq41UNz5RuLDlKqa7jHKSo9KBt+AeeqsLmuFdx9p8cflNYVgVhE0x0xWLEWaei+7Bx5M+hLCIJ/f0tVrgPIroqZtF1GQdyxnDQxc65YCoYRo0YsU/jKEOeecOWrp87OMctzEz825DQh3n6HiWAavDbnbY9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de66e37-2164-4260-d700-08deed6109b6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:36.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1TG/pi/bhr5tQvxHK3PhFTiwx50DkaofWTznc/TIcDU4dduUes8G4FuTVbk32vTFKsyu3ubwy0f4xEfspe6dlW0/0cbRicmGCTq12kLVNw=
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

intel_guc_logger only needs core logging/assert helpers and debugfs
access, not the full libigt.so stack. Replace the monolithic include
with the minimal headers and link against lib_igt_tools_stub.

The tool previously used igt_simple_main_args() for option parsing, which
is part of libigt.so and cannot be used without it. Replace it with a
direct getopt_long() loop. As part of this: add a 'help' long option, a
usage string header, and a default case that calls exit(1) on unrecognised
options, behaviour that igt_simple_main_args() provided implicitly.

ldd before: 35  (ldd | wc -l)
ldd after:   3  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/intel_guc_logger.c | 21 ++++++++++++++++++---
 tools/meson.build        |  6 +++++-
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 629b4e660..3990aef87 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -38,9 +38,12 @@
 #include <sys/syscall.h>
 #include <sys/mman.h>
 #include <assert.h>
+#include <getopt.h>
 #include <pthread.h>
 
-#include "igt.h"
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_debugfs.h"
 
 #define MB(x) ((uint64_t)(x) * 1024 * 1024)
 #ifndef PAGE_SIZE
@@ -367,6 +370,8 @@ static int parse_options(int opt, int opt_index, void *data)
 		discard_oldlogs = true;
 		igt_debug("old/boot-time logs will be discarded\n");
 		break;
+	default:
+		exit(1);
 	}
 
 	return 0;
@@ -382,10 +387,12 @@ static void process_command_line(int argc, char **argv)
 		{"polltimeout", required_argument, 0, 'p'},
 		{"size", required_argument, 0, 's'},
 		{"discard", no_argument, 0, 'd'},
+		{"help", no_argument, 0, 'h'},
 		{ 0, 0, 0, 0 }
 	};
 
 	const char *help =
+		"Usage: intel_guc_logger [options]\n"
 		"  -v --verbosity=level   verbosity level of GuC logging (0-3)\n"
 		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
 		"  -b --buffers=num       number of buffers to be maintained on logger side for storing logs\n"
@@ -394,8 +401,16 @@ static void process_command_line(int argc, char **argv)
 		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
 		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
 
-	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
-				   help, parse_options, NULL);
+	int opt, opt_index = 0;
+
+	while ((opt = getopt_long(argc, argv, "v:o:b:t:p:s:dh",
+				  long_options, &opt_index)) != -1) {
+		if (opt == 'h') {
+			printf("%s", help);
+			exit(0);
+		}
+		parse_options(opt, opt_index, NULL);
+	}
 }
 
 int main(int argc, char **argv)
diff --git a/tools/meson.build b/tools/meson.build
index 15bd40dec..32a345e9d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -19,7 +19,6 @@ tools_progs = [
 	'intel_display_crc',
 	'intel_display_poller',
 	'intel_framebuffer_dump',
-	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
 	'intel_opregion_decode',
@@ -112,6 +111,11 @@ executable('intel_forcewaked', 'intel_forcewaked.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_guc_logger', 'intel_guc_logger.c',
+	   dependencies : [lib_igt_tools_stub, libdrm, pthreads],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

