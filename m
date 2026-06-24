Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C8ACDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D0210EE16;
	Wed, 24 Jun 2026 08:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6zopVXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443ED10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290885; x=1813826885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=w6TNQza1ikrDQG79eiBIIoudLXZv41JTq9ENg4GEK40=;
 b=H6zopVXqgsUHbqGesEXbnAniDdy2eQm+jaUhap4uVdjo7mWnsdgImRAC
 PeVLwnvpsI5WA0n/irSyumngiKLHora2qmwuJKxRBeoRVicPNtXikVqda
 LuAsLYCMP3TwvgfDttoGLcmvETMVC3KJ7VbHx8v+t/K9GJX1f81ooWFa0
 ypA/0g3qO+NAjTB0LVF5Sx7ptpHc5R8b6bNO9lZ3wNOWYJMb3Cv/d1PDR
 7O/QH1B5ZuVjsdZTELXCnofze/13Y5Co6M2N17JZ/udOnoEPDoSS1Bkoc
 Wzg8ioixugbcI9XXEgaCVb10j4eerng+u1aC3rbuOLAzBj/2J8f4OU4VM w==;
X-CSE-ConnectionGUID: v/wINMuGSZybery6MKq/vA==
X-CSE-MsgGUID: eLCnzLAUTSuCocFMSfM5Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142307"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:05 -0700
X-CSE-ConnectionGUID: Khe1AkFEQ6yFxdeNcF6ZEw==
X-CSE-MsgGUID: be3rX0rGTLyYr1H8WmpMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432203"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRavJOJwhzVxq5UvC5Q2WKfrxRycjmTQmvtsOAC0FT1lONvUdY1Sr3BsqgT0y/HQhlDyvcz3SvfhoHDCvZx69etuWBg/CqJTUNZp++kvwmRQ3ttG9Dt74f3cp+eO0QHXEkDvm5yFrLsFKNCQTd0kRk/FY6ZqjizJg/fkUKw/JI1cl++B6xrtrtcxyjkxZAY60jBuTrlcLG+W0aCji/lL+8qRXiZD8jeFbWDWqABUDe3Zvy2JyMX/PSQUdCZ5bAf1tQV/JDbEfDMrEKd6ua5cHLYBTsPTRutMPrr/uVus8PAQIO0/xDQ2nIf9OPOH2eHhhwkcuyZFmKslEVgwTzIDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Pf1SnVSH7C8kSjgH7Zhkz+tHmU6bd8689tKSAVvVE=;
 b=B2jGHmFLU7rwARPjHursyFLYhmvEWr4BSbTFWWNBJwrr4LJXwUweZqL/JNbnhN3vCrY7f7sM4f+BR/yvkBppMh6KN4hzMXf/XmKg4Yoa25ACQ6n1uU00+BNvgeVbDRpbTbW+fl9C9j39eBs4NRt/KlbyrCt0gsyO/s/bzy4eJpR1ztt5UGGwWsTBB9uCeej/FdP5MIGGJbLimJnTY618LJYZq/eP5mmwkTi8XzTgRGQaGBsnabNGdz4v6YLX/feqc4FRevJptWerO3yCGfv2W9sfCikbBtQmk+b+s9uPGcDGV3sEB1x7T5xUv1CPSu0iQgP2Xreus17huZt7WUN5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:01 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:01 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 19/25] tools: intel_guc_logger: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:26 +0200
Message-ID: <91cc71fbae655ac628c1934ea624d0819bf04fe7.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6069afbd-be04-41ef-ef0f-08ded1cd4c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: F+E/vt+ukDsf2sfNS4oj9qynwO44EGudqpQPqJJMMv/mrkkTMH3KyRm7PR65fQjeYtjVvVkeGNdExmDPoN9W1udEwlLHBoio4t/kkDsZHiGGKD5jna0c0sWF1ToyytLHA7Z3IdIHteuJHp6toJKFfqBzhVYDUjltH+VQ42fd7W/t5L6PXCst5ynHURzJIDBSwlHHquBHP+wXmsjvkn418Yz0ULmBK3E1RXTTc2dDtZr+45cFRjwDZGYvks1PJ5fgtZiZ5Ai9VgP7Z2Fb0C4zickwTOxw9YXwD4zFfXtsxmccn2P23no0tKYG7BDNRM3pP9l4tKYNwdShUPHvjq6hnx9rbB/kHvrdKxr+q63r01/7gigRHtwGmyq9UQ1+Df4P5U/sp9JtLVI4H874WyaKzsad11IFmpugJT4+XGz8VEahqvGN4d7XBoMJYg/dcSjWa5yTU3c5sJzgNNPZJEBjqjUvinT+85m8LqBQMnFTInX+iASNTrFzLbx1BxcUcwmY8f0XTP+LjM0ahNwp6h8uxT15zRt/zIzmzsQRodmySYSxfQmYvgWpmWomz98VYMKXH6HxUsUWFx+qtx0LIgvJ1QnTmV+65rtSvnNVjCmKIqqUsd+7Wjz5Db0vBpbkmvQyzaq0mwycPyt+Nb6ThMIcVSuEOYQJh++Ni49f2/FrKuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+p3VCo5sj4kJodCkuiHpmpat9jaeoObgmvGU+t8IKi/KAvkEHMhLdTzy759t?=
 =?us-ascii?Q?n+Sr2+XlWFnHRttquYQE9nnrIJ/6bOKoaE6EgCzYPD/On9OScZPJhnu7Lf0+?=
 =?us-ascii?Q?E+/vFGny32lHgD88cNowBdvXr9sUXzoGz6i3Oftrtim3jQmfku99myD0eCq7?=
 =?us-ascii?Q?FrfkPdddISY8407CZtd29KMCPKw9upRaWww+im/s/GecpOneP8uVpktf5oDN?=
 =?us-ascii?Q?OOegvtscxSuR1bcZb3DpY+DSU9DTcPHHcj1xrYjQfbGyVRoS9POeZHpc3m+K?=
 =?us-ascii?Q?qkY6l75P6J0pUShLBQXwMrOE1cHcaJp3x54aKnBN/VyVzV0ZxdJpTn7y0muI?=
 =?us-ascii?Q?tyCdONgy4R1N7OuxkFQdGz94J4G3W014M+NxdYdR0OOc35hmaWCiG9Lwavtu?=
 =?us-ascii?Q?UL+qe+xITBrCYvUDKnBT5rOINFhoZbOFxAsW0+qVElfCW2p2egB1xuf7eOn1?=
 =?us-ascii?Q?pogusD4abGi/r5qWrEhNvB49sYYze06LqoGxZWQyhAhxgtl+knpRp/Adal1y?=
 =?us-ascii?Q?gWpAiQyUwjtN7PyItKfEXSxa6Zp2d/0Ub+ubf9GsQFbqYYwA6yWB3FziD5cB?=
 =?us-ascii?Q?zWfxxGjhFVzKbv/o4MWyme/cbY2mlcu0EYRdnzpy+vq6WIHgKnCe3kism+Z9?=
 =?us-ascii?Q?Kb1Nl03aAbl4HVZtfoUhyj2KLCmJKFQsUwmdLYQ2sSQ/ujojKLgnloZneQiG?=
 =?us-ascii?Q?YaOwb6gox5j9yeHkZZq9Jrk5rjZKytTRS2L6XPirxR7zzDO7SW1QW3I2Fs3f?=
 =?us-ascii?Q?NMWER6iWRTC2A1caDhQr1TfkAp+z6dBW26mlyvXXBfqzTZs6j8W2TxC1OuVh?=
 =?us-ascii?Q?FHv2NY4JsaUxtsyKkc1Tk0l5TthYj23NK8+a/LvAemKivPdIje9ffdfxBoBe?=
 =?us-ascii?Q?cvytSQUwYVVmlIOq1E0uoR5WFZm8BQVB9nx5Uyb2BX9Pw11f/KBQsi6LtsNZ?=
 =?us-ascii?Q?m+b3wXzzKpuBWiltTvyAiKTAX7tBj9e6kE481MN7Cc4VAm63JXmRWFF57AUA?=
 =?us-ascii?Q?zT78+i5caMchCOSTBWoeqpT09TFKPpjFCzVOKzvuxMTotIpgMbShtWkE9EPT?=
 =?us-ascii?Q?iujR4PXUaWjTG87VHXu4DTEUISDJj5MYYVcRcpzWy4eyxCUFzzWe8hZqK5HF?=
 =?us-ascii?Q?BLrTaDi+hnFOys58CVEF4qrNluEOespJzu+zB7JAhAV7vJ4a8vrSPxtJAEjO?=
 =?us-ascii?Q?PP6n3qu0eIgUO+YGxm3G4FR0XDM2a5p3jh92UcCxoJfu74YixBLdArSDA9E2?=
 =?us-ascii?Q?3mdp1C1VLH6hnbO1o11YXcY8KJ7yKb7SiMzoKWFcjwWIaEsm575xs2gXEb90?=
 =?us-ascii?Q?0sENVfvrK19XXB96MzkvUwO4hbStlECy6fjGRGGoLMDIOh3GmvcGGwpFVHPO?=
 =?us-ascii?Q?GC9uvpAfHpF70eWAifH+Q3TT1MAp22ZJqr7cjPspBEyOfpo4lhKhb7wLF5hB?=
 =?us-ascii?Q?FnwqIJu0aJ+qjLTE/r7eBrOwx2ifU1EmwB4gqckOL6PLHNxiKcCrDNyytlcl?=
 =?us-ascii?Q?P3bkoHn9L1OoV+7mBF4lqM4CW/XFggWOOIxZCrhpwoVXPsbIn7RB9Ua6GXZD?=
 =?us-ascii?Q?cEFd4QDFwbqAzOP+XkybtB6HriDtCAoMVPBDPR1Cisj29PRGttQBQzIwEyyk?=
 =?us-ascii?Q?25H4hCLjfU8C9PLILG1roe5nv8pvi7m8j8ip+vIBBGgS453fpubeBOg7NbkA?=
 =?us-ascii?Q?WUlh3T71R91KGQkHV8GLQeIEVzSywSAH1GWYIUNCY4PHqHy3HStUlC26xJdr?=
 =?us-ascii?Q?HsuveHIBc+DNWL+XQQrv0AR7RphZONo=3D?=
X-Exchange-RoutingPolicyChecked: qOeiDMIHzZ1Xi9bKHtO7JJfVfbvMrYONosc1MnsIbnJydKCSg0qWtAHdfOHYG3N7Ihw9Kz9w2IGgIYUmkObnTaVm8kzbyPnLeG9UBflpMx6rHcnoRDLWy7Rhyl72woaoH0bn1Z6488Ir9hI8cNfs1Z1kW9+8u2/VEozJ1UmVWpJeCEhCLrO0EtwqP047LmuZBC48Pzb4KRLJfu8URixraq9xnikrJydahSpzt8KyDlw8mKSDBFGpkJTU6ojvXLFKSHckXi2I279G8BLVZJdtChmuiHyBOY90tYWdiI8RDqEJ/IEcmcBI2N9iajzxh2KXHFaHZO8UAx3/jx6efXqc9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6069afbd-be04-41ef-ef0f-08ded1cd4c97
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:01.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/SGX9pGVdu50eanBYghYY72VWC/yptvPlmDY5W+OUvvWHvmSqhlKtEYoHGZnq8KqI85cFXvPoDCs4U3g6rUg55M44Yhj/JjjESBIO50hGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

intel_guc_logger only needs core logging/assert helpers and debugfs access,
not the full libigt.so stack. Replace the monolithic include with the
minimal headers and link against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
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
index 15bd40dec..62e4cfb69 100644
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
+	   dependencies : [lib_igt_reg_tools, libdrm, pthreads],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

