Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E1C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046710F026;
	Wed, 15 Jul 2026 12:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2yUl9SL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298A10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117758; x=1815653758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=x8pgZOnY2ydkU5V47TVwIRfqhPMa/CugCdAxZQZ4XUU=;
 b=n2yUl9SL5NtsrGFl/nlkk4tz1I0i6DrL8CyOJETkw2wZnW2TMP0sGTHs
 57K4qWD2PFmHcXi3rOy6PY11rn4H6jQmG6qd+wNL2e8wzI7VTHfgLfpJI
 3qAOjK1pPsRg4rnBbBeI/IRzaZBxzYOaZECJFdQl7I9EmTZIxEvCzKXnB
 fQMz+LE95fWvIsm8b/nKfNgA6tZZaaON4ocLwMyECmrmBfx+eiG6U4Ced
 AUgvFd9jdvON0fmThkm8Iq6AGPMKLRuiOYlovNUPVsGkDnNJBCt6ry3v6
 ntKtx74pNT/dcMeaoVGkipxhdWggjKImhdHuRAA7JD3YtC1CbCumU4h8f g==;
X-CSE-ConnectionGUID: da9m4hd9S5SwQSN10xTSVQ==
X-CSE-MsgGUID: kV3UmrW3QXGtoGubKhn25Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108135"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:58 -0700
X-CSE-ConnectionGUID: EQRTEt7LQSGTnRYcjfcZtQ==
X-CSE-MsgGUID: acStLdTXSNWJIzBRCvtAJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252210297"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2HYIp2wKdC0KweZNA2R0oLGoo05Z19yYBCGWW7EogAXo51zJl/+0X9WSHJN7MirlI4Q3T8HpgLy8+IqnAU5cgImJCBHKwwwEplNfDIqJC9QJXDjdzBmUp61+c6PKsF7lCO5qz3GnFJepHPlrVxxz+xnIz6kA4fNjv0Q5uepcl/IGpvA+fhHqKStlxmDg30b6AQesBWkkkV2PZ0AS+KISCY4bSffd5r14+Ufm36ogqrhKzSRskyJyeD0Bq31Vm6ZkoLjoXeOGdtTV++xNI0s5/D6WAr3VyhuL+uo2yzuUXk15uCObS02mpoNgRWuq7iApuv/AVXyL8/YVLkIOuTt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIYQHagn/gAJU91aofVS/w/GwvK8XsBW1k8C9sQzqUU=;
 b=c5tLrs4ksBiIcZapx5J4BeRVxOxwnrRGzlY6nWmenle6nfYG61QrsbC7Z9MmDhvczk/SdlRH36dGb0gCCBQ+hXbzYH4+gQQbyZL0+9fVxVWfZ7YWaHKKa3lHNaQd6cT/oYNHf9k3Pwgi9m3oWV7af2zCmclxSU8IuXRN6gMJaZywxRelOZT8O9FErFrAfiHSODlPMJjTplEoMtS2kPDrvT4uHrrCcovBtUKArTiXKpMsCNk+7wqsLtH6bNllfEKxRYoyMx9GslLoOzmwTrWx5n2xgCjpV7DoUMttUg89Tg9Z8AVLBCKhmWhGbjr+gZnCvrW39cnjFdSPZ+nZcy7pKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:15:51 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:51 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 24/31] tools/intel_guc_logger: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:34 +0200
Message-ID: <4a19b9a60fb9423f96697b1c59c7dcf1a064f44c.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4c81e86-a05c-4af0-0c92-08dee26acfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: c+YV6f9IJwFibHlkD0R8r8/Oe023ss6dbjkkbGjyvp6/brf4OwH41OI1Q8epyDhCaN71cgS6qaTUu95cZ8tIgj5lkaRqn05DZ0x1Pt2jJi+ehghyNXrDqoTjgTpY0ju9h6WAcXNIwgjhJ5AYgMS65dmD5T7Nirts4lsnO5iqtG1SZQmss8z4CbMvSDJs4HFXHGb1eBPK0IszgYXpSiybYs3TZsC+yG/JtgYfUdL3pb2Ta41eiKmwfJ7z0Cj0kmulZJrl55umbLVglB9TSY4UypOeRzNug0kCXxeT4LB4p7BRW/oQY94PmlUlZ1mHyKBAqLUF0MFt3zn+ZitiJ8KXOclgRBn1ei78j9o3baE/s+PMJ0TW9RROhzBwBs6OiDsdtLWqbHVU0qTqcf0SbC8H97YMa+FfHhk8gS/ih/1XKAylBl43Tux31l9MBIoFTVt9iawqQrwsq4sD9uV7kaOxUgPEaXEnuGhxPOup7qmSVCRdrA4wcDM+PEuopbbpMAsuhXV9p2Ism7Ezwy3uAhMs0FiJWqWlkrqz6N+JBIazd478AjnpI9QHeJvJmvna9Ju4lFoJPg7E3Hql1zni+sAjebOAgdM31FLAiTrVdMh5v+XY8j8qXnedQ2YbK1yUPZdypdk1GzBfotyvyxevc4KAMl3ttazaEMTMECyivdNcp3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZZlOSGnnug7Tk7bnMqKSsRyD2/A7CBqYiUujp1tIumJ6rEmjUGjQ1M9BciFf?=
 =?us-ascii?Q?E0vnm5QwmHXahaQLVQUAasPiiRj0qqKiU9T4ybm+myxYwXQxwwMD0dbXcKlk?=
 =?us-ascii?Q?J1GmKqu9tw0JWRaYu7fSgH96eCLokMy9+flo/6+KUL5WHYeCw6jgje0AUiII?=
 =?us-ascii?Q?xRTccerVbiVWMAMBz23i5NVfDB04mdikFMPP50f9Q/x8hdcqZg8c2i+e3Ri4?=
 =?us-ascii?Q?FtThc9aLLSUCp2GtqKwFVS3ZTEPYsHjshtta563mZJLViuheraIMvwleh5b2?=
 =?us-ascii?Q?OUCvTSVv7JhwAb2pL0239gAne1gEslSbrCjxabpqRvloshHNfNTDMCIFquUC?=
 =?us-ascii?Q?u41ytYlkB6KgpTitWl0ws+sFwkm9+Rh/rQHFyuQWkaPe7nlbJ/OoRM8Zx7zJ?=
 =?us-ascii?Q?XEYIL/s2TMUZ+jR6DYFYv4V7I+lQJzMJXlyuUoLELL1b8ThDnme3zhr8yPu3?=
 =?us-ascii?Q?9wj7UJY2k5DuaAI8sS3i7YvZ7jkphki/th+Z2HFucWhf9hpfjZlkJz4OFeYY?=
 =?us-ascii?Q?e+xEdlluWZu04lbRSnTrPUitf6rtxeN2x6CXQm87EJ3KtEwqVPzkLrRKkxOI?=
 =?us-ascii?Q?PKyg3AeXxDUhov94zA9FoyYzmwlmk2tcHgP7WddYtxPcOpqCuFUBtU1Y6Vgo?=
 =?us-ascii?Q?V5M1SvyteNww01EV+YjqHnzPp+Y68UiANuNigh2sjg3QzRvFbn9cyl5n3WCD?=
 =?us-ascii?Q?O91ka+bbcLMKq4R8+zikyFG7g9fuBXJag/qe0j4fN0nhNWHPmSKKLHFF3xSO?=
 =?us-ascii?Q?2Gp2cPxcw8woZPxgV4lu7t+T1e/RIXZxUCtU+qfrVKhoZB1mAAXqWmr6mGU5?=
 =?us-ascii?Q?k0xdAzvau+O2LIW6hR9L/QYvsIjNQ4BLvuIr2J/bZvW5KMvEIrhEgZ2kBAky?=
 =?us-ascii?Q?bKbxYmgttsxjTyjahgI+jNwvBYRsXwMWdXPI+6zHUiOiS6r08oq71qoLN7Nq?=
 =?us-ascii?Q?FT4Ye4VXgE+w8GsjzQD+xx/1D13ziTLK2W5k/lhLVlHL2qFHUy5cSuTdAf3v?=
 =?us-ascii?Q?kG+XOQn+agMVBZIbPUazgu6peOevoVzQ/Oz7Fv6D26yM+w1owLQVR9d4L9Kd?=
 =?us-ascii?Q?GQKWyvKvB+1EnwlurzqDbreuHlWsEKO3E2oWnISoWC9b6hwsLrfsO/hfZWIg?=
 =?us-ascii?Q?vGsBGuuc2cMyOnIFc07Qwus1/74KK/tbDnuA6Jbphyb9Bq5sn89f/8tDCvDQ?=
 =?us-ascii?Q?ZWyFlNsB3uwLKT2Q+pR9i+ByfCLIGpR2QXHSKDWIfVwPRs1K4UDDWS5JxQWh?=
 =?us-ascii?Q?bA0ku4cyIMCkkVLL50rwRBmYtMPvqUbaEblBFHJhRw4EiAa+jfdjM/aQlx0h?=
 =?us-ascii?Q?DnRARxVl1sUreb+4CpHW4YVTl2vSWnoTjMJ4dlE4iDUtl6bS2910qgTmVe3/?=
 =?us-ascii?Q?+pJi6MyJlu5C+woi5YKWa4/yinRxMyv7aXyKJIe8FNMjhBpPJi0zU11hy4BM?=
 =?us-ascii?Q?sAK0d3lRfJSjZysSjVzQo3HFdHFbCorXpmBHPVsRGeB/h7UcnxS6erD+O8n2?=
 =?us-ascii?Q?1nov5RfM34KmxU4Tyb/jxk+4W4sWavimQYuIIIjoQ+Ha5ocHdkWStnljtZDc?=
 =?us-ascii?Q?iqKW7gvxuyQB2jQnq9P+t+4/u/ip3YprJ5y35ojRPmERg+rIpi1b3cI4jlYy?=
 =?us-ascii?Q?8s9bmsz4pARY2OBudk9GrkQ4dXUrKr/iJP01OAngjxN17FadRsBskDNST9qy?=
 =?us-ascii?Q?EoK48JQDh95/KRSPfTomju61wKsgPmpbkX6+yg6eCQ3mrilPCMLsweuhTMrU?=
 =?us-ascii?Q?7P8SQKHMwDbgTAZ9R71Y/UUFGBNXOn4=3D?=
X-Exchange-RoutingPolicyChecked: afmonPtjY7RxEgbVGOO4paCHiSLES0QyWcjk0lgEA3oReYT/ZOV2lK7uVNVhu6bTp7mPoIDS+VE4KzBCuXuHMd6Zc1wONrJlHZ/jMNPTflpzInCei3waNHxxtGuPdRWZO4PalCdaPuqWtxhgoZmgc5iocIrVCwLepTiPwxcl2FmCrZD/wt7r2NGS17100cczNa2m2ytoppaZ8MG/ITrWNX5uadYnaPSOsKZIs7TcbwrCClkZ+RuBAiQASqo77wvC7bxsW66YxhAxRBSbtU1r1f37tdmjdfetfQlUksjwJYK59J4FvRQe5ye+fLkwKdPXQS/i1tIQwVDVRJcOOQRxEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c81e86-a05c-4af0-0c92-08dee26acfb7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:51.5038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2mNEqycq2ws6zTUmm0ZqJNJg0hk97EjJdQmwv//DTpoXElSeFoz28sFPyoIniar11RbsuqMmqxB5ib00H39ZY4cbhUn43z1sThzm9c9QTI=
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

