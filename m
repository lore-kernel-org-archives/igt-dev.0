Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8FC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DA410F82B;
	Fri,  3 Jul 2026 14:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ixmlcswz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5314310F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088969; x=1814624969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rZ8jTzNYjsUiMxcGM9NzfVQNmkjLxLFexcHC0RxxUIU=;
 b=IxmlcswzYVF8zs3vsy3mN/nALCuuRwmnHFVXwVNACe8S7aEXIfzDFwD0
 VAmqnltq4jxLZln7KvT5zyOJXs4RRaBGJN4k+owLJTF5l2FhsOHC8WNxR
 fX6f7X+CA9kL4F2AgZK4yEHKcCitihClkaxX9niWfn9cO4YdIfaH+Sp7g
 n8Wx4tQSaRrCIrvkL71lHyjHEe2JWIUTeIbIrI7EQjYcQpUb0aZOpfAty
 e+TL6btLdBERkjoXAHvz9cOZeXrN0W/6F3YK6SxRshaS/78fRJoLVE68w
 epnXERCpICV/5ACqP8wQifvl3fUV2AYIZwH6FlR++jLTVAb6ChLjnd/Ax A==;
X-CSE-ConnectionGUID: yUyuXzQYT+q8lLs0Rbvsag==
X-CSE-MsgGUID: MM29HZPaRzOWVjzm+/ulFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756542"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:29 -0700
X-CSE-ConnectionGUID: xztzE5kUR1m2GHQDVXnfVQ==
X-CSE-MsgGUID: x29uiyCISWyUWeREiHdfAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341141"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUnKSmh90vEP4FsN2uXq4dxPh9vs949oL0zNuID7MdZm6FucZEnVp86PefhNGgNE/MXcroT/DrO8nDjKWafitSaSofeEbKQeYkrvlKYOYrr5CG9Sa/GRI2lJmu/Djh9Xlq7UWzUQpluLQvu1XmPTkRt7oDZ02x+5undoFNHz3cladutvr48c+UE4EPJ51A9g5TSsDSmzgaZg/ezL0UsdPRWWxlRtKGVtG9VpWwUW+IGBAJueO7DQwGpyJalOSGC06V3KKxyTAeUIoaas8VXg4ui8/+/45E68bQqhiCGbQCB9lqf7Vsy0Agrl1QTjbWj/HuoWwPUq/IFI2lRR1TPcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V0dtAs7dkc5w/QzFHZbEklor15BFZgyaM25O7TCAcA=;
 b=xApgJIYgRQTRoeySbFBmwqaH45z8kqZUlS55PWXsd9+vs4Ic91zaizpdWRXc6IuRReBIDQNIIWSNwG7XR/uvbU4YjoJzx/+suuj2TQKfAGucjufor+dEREJWRh3jmt/UPqy3H2GkXaADYzy6SsNI1cLgewaQIHoO2fdHC0xUFxsPiFR0RsWD5OLuCgXRMfAGcrH4KQZkgXy5Nv6Ls9iOCb2kLwqRDwFuacVS/sTskX/aGvhPfKEALnQWY2CJNfmWChSaa2wBByE1//kl2pAK6spuxoKDZJ+T7dJcrTu+KlXRvcJgjSMlvEZOAb2iXHMtagqmWHORyEh3Z8If7ujcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:26 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:26 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 24/31] tools/intel_guc_logger: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:58 +0200
Message-ID: <2188c3f515232a2ac50505937485e89ba4ff88cd.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: f00000c1-e8d8-4da8-9696-08ded90f7c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fUoK3pC5DfwDFrKIFIb2M1F656D+d07onc9RR6MmSl9F/NrJCmSeE5eQRvtFotpFQiegmW/PA3I0TewMcXGcBzunnUYVW8LqW051fY8UQTXVJOQfKiu4XVfao6E1lkBmxfg1//xIMAF7YM09zJmW8rb+L93RD7O4TjyyHaYg1WQkcXB/AOwsguy0Obx1cQQZfyrxsIri6lAduvREs6raF/cfGIx3hV4uoBMm5TiVbL9NeZX3SoTfv19m2qEzKhqxew6fvzhkHwqcYrEEwxnJ4lI+k821gn/XmPJFejabCl6kzJImcvQ6GNgOmpTxPLy26ABlCtG2M2nL5VRiVYFmPiCMSajQvY7i2j9JVYCpWozFFJGR3efbZ6JRFKdQXPiXshKclu9jU0Bu8ENGGBkc6AlTYHaR8uqJCnxtaojb7uhd3qiWx7cC7YXL5wL6WGosgfpJjypc842oeMJ19FSEVeCDJgoiHALKWbXzJatI9FsI0mqAAlLfKF7vmv6H6yS03nqaf7nBIc7XSUPRPHrktnQXbNcokCvLXpITWh8AR7jR/GWTD+FIYfjQb/4erXFLDZObdQrxBORlznLHpGnmXyyBfXm4cr9asvRKio7Se02Li/0zXxxWt+jfn0lz0o5VjFDk/eWW0Ppfn9OCBqV7GRftg4JLXPqBwQ+vfuvN1j0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eG10CFaCp96V/ArQ/ciJyxuT8Dvn+AN+Iy9j4KdleTYk6FuFw9QUah3ihmCc?=
 =?us-ascii?Q?pipW1CMaO6H6VSMoY2oNPwgfalqcvL/kaRpyfzZeeN5qyPm9skU4YU6P9U+E?=
 =?us-ascii?Q?0yqfeuVc+Twep3vmdiNKdIKF0nask1AlCPNxKb5Ak3R311f6ZiJxXSpgIDer?=
 =?us-ascii?Q?VzVDbVTHz2C/ZJy2dQi+CCoI885KBK2eQIk7YcZeSDQdnY8SmBmavTdw1avt?=
 =?us-ascii?Q?teKA46HDG2BH9hwuoWlMdjOfw9Set8fJNpX6BzLJrRVqnyCjaV76NJ2qGsJE?=
 =?us-ascii?Q?1Mrf/dITAx5u2muKpnPUQuYUr3IgsS8nzwM+rvISp6+bPUqQ6WZYOR+sa6a0?=
 =?us-ascii?Q?INWb93+Umsp2lhf4N3JOECNdnRbeEpIrgmFXMoExJOP95sjFSue1Oe3N7mJW?=
 =?us-ascii?Q?2iagpA3s9XuT2f9DGs/78ISndjmQL6ECSUMxZoh0yXzbQrQRs0W7texNtE+H?=
 =?us-ascii?Q?bn1Y3mCmBP195+5yabVqvgSH7YLaOLwfd+ftuJh0x2YimtFkrK2hVd/zqAug?=
 =?us-ascii?Q?990ShmyqPTeJXOZRw6EKvh6oLUqDhwyrd3f9KV07/b6yeN+d0e3NORFp39GM?=
 =?us-ascii?Q?DstRskBrEoJ/5+XiThCutMGce3Qlt4YDzGiyVe3iwnVEoj8THNgbQX/yLVv8?=
 =?us-ascii?Q?H7sh5r1mdiWNsXGpvRLzKhjZZwDU9DVNrqTCTTsbCBc0l8xy6BEhTqLsroX+?=
 =?us-ascii?Q?fnfHgnvzR5vGfHu6P0RFQJlaKOR20jwo2XFo17qKIDiT7oW/xHeUIxAruW0U?=
 =?us-ascii?Q?JHlOBE9ztchiReiqog4rsdFaQzUTtZpJrUdOwuNNDbBr6K+OwC3OhWSkpMTg?=
 =?us-ascii?Q?7Xo3vGAUb/e0SnBUtye4NOK4nWnuLXHKR2sCom6+BBm6MDQSWlXj9wz+6bfH?=
 =?us-ascii?Q?mQqwBn5EYqVScK+l419aTrhT2BnmB5/dxK+sPELZ78E2LR8VeIfNQczJVEzX?=
 =?us-ascii?Q?BPEUIsqwQRTmgwzpbjMamges4njhwVL4FdGahFOKanIslPGnmDCA6t8x1RNl?=
 =?us-ascii?Q?h19bSF+2kPBU3EP7oUgFBeAB8NHyCVJ41WonwlYTbFh/fZybBw9scJqkjCu1?=
 =?us-ascii?Q?B9/c1NLAgSXked7gzcc//T0Zl67qwCyzcafwtSoSoEgXL50+Mn6IhQacJHgd?=
 =?us-ascii?Q?8Cy1fSucOYH0EaA/6fGMP3na/mWIiwcBBw48P6OqedQI0hnWUuoO3H5Z5GJl?=
 =?us-ascii?Q?OjrAFG92G6Bw+0IimatQs7pl+gBpeQve3D6/F7ja/SV/3JodolNSK5nac2Jp?=
 =?us-ascii?Q?pfm2zPKeaXJ9uQPYzWqkSjVjZkvcmTVsjsEw7CnNwu0Ibti+oJUPICPcFMrf?=
 =?us-ascii?Q?5f7hlYu5t6tpYz3vUHz12ju34lQU/npw0Hqsjpysw6Fkm4x00c06ZSWGAghN?=
 =?us-ascii?Q?Rbg+K3Ol+XZdnbtAIC/coh3ACqCU9DWhUmzsVgJmNOApKdXZ/4PcRbTsokn+?=
 =?us-ascii?Q?zgrpzMhQlZT068uhXFkEAqC9yeKz4ijG6zoUXSq2WtAQyfO/VJs++hOMdoGZ?=
 =?us-ascii?Q?oyeB5oquk0JvWQNHSdweYz57+aDoOdDPRNxXFbnbDwIb9I3O/AxqPWB8QfG1?=
 =?us-ascii?Q?J64EqhLsQHsua7SCJ9oS80odhUiS5fJtQ1h+bjXtkgWF2v2z0prYUcXhWEn2?=
 =?us-ascii?Q?VBvOu+faKRqQigXdNIzzyWnqGppq4WpeyAYaprG1UXiwS36dSlqzkswJqIcZ?=
 =?us-ascii?Q?8k9YwFg+A/6sHIZFzS/Xtpj2caDXkRHxuaWTdMT0Axwnr1QpqvZeViELdADa?=
 =?us-ascii?Q?R2G0xDG7hbf95g+N2jL8YfkatrsxxM0=3D?=
X-Exchange-RoutingPolicyChecked: YZ6RbSZftCTq1FDS/cMDwfbwFdcWYSFbwuuQ7nUszfsT/Moy4kgrfc6qcmHzYYDRyNIp/tgFz3tlRYHshUE9kXERxcwtWkvziV/3sRNZllamBCMGN7EuYOvBxpmVsiZcHXWa4lnqEMrn7vZYcK0bYOE5hcmureTudfZx/glQ5wjD3wFhzLIY9oArjrDoImTou+8v5XxtyDhsBONNRINSzlS2eOEb8GgZh7uFqSJtYTHYVGZsQncG5EGS+wG7OKAEYN/KvTSVHscJ+Z8BIIA9kCqU4XGgdboGjsYYzfA8aeKynM95Zp7KGnhebf8YfwdxFdc6iONf4YMm26JnFPJQvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f00000c1-e8d8-4da8-9696-08ded90f7c22
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:26.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdnKS9GJliVy5PDo4/PjD9fMEP/hYLTdH8h8Glq1gAFNExiaDfmRLI4Pqd98An/QqQReBi/WplQJqimdcjOvTZZjUFXbroJfrgclbgLoTpM=
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

