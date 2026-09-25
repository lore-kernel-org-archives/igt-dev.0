Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB6C9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B610F9F2;
	Fri, 25 Sep 2026 11:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKFvBQPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6310F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333895; x=1821869895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DEcrTSTmdmOG2nf39AM5hYe2EuaM4v1xVJpHQEs9ftk=;
 b=NKFvBQPQItHAn7mO9j9QhWS5xD/dJm1p+GSzlMLsMcb3YSnKhiiF6gFY
 MJxW0I3XFJxMZqSRC3T9iZd/Foa/bLkPQFW81iMFXNa2bqTnw8TZwrvFW
 JkiaAXwQ6Vp46KFHKPWWtKXkQ6KBkOAOxvnwjdsZfsM43Xhw5R50lBQ9F
 Y4lJHyLU4lefIFak6HaG1ftiSfxN7t2ItmV/derL/AqpwfG7Wy01Hg/qt
 z+i0yJGr6cFMZdnvmkYPE64oFiHSJ+/gZ3Tfd26R75ZujswYEOFxYlYWS
 7t9YKRbKKCKg/sPSZ/W38vn8YX3lfHGh/6PlPvTre3Xs7SDqngEeaElc8 A==;
X-CSE-ConnectionGUID: KcZ+3AacRoykjLBa5FG0SQ==
X-CSE-MsgGUID: UfAvjFPkQka5e5peTmb8fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90076481"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90076481"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:15 -0700
X-CSE-ConnectionGUID: gphuCPnbQqWW1AFUyISb8g==
X-CSE-MsgGUID: 2N7rqOiHRhKW8dcAMMS+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272884240"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9pAN2i4z62JkJv1maXIx5ki8P7P3PpZsmMdcUJNXevjdSk+CF6i8YURQFlkrSpOVRhUi1w6bO/hLkaYKOQN9e0f5oVsSKA0WHBhplRigs88IrrnSeXheeTFz8XRIcHOhGg3zY/1u9svbmnI4z7OKwKS/pxv7ZXdzipiZqfI22nhINFkTu8oLKypVn+5ULoVnTYFLtHxSFRZDu5R7JXIqS9tlzPec2GL3Xv7EA5PW5GR5BE1dwBQALE/v9F0+cFA5hdGuH5lazIOpjipW9yMBsf7vnrRZv82S8C8AKaRpYIehHkWzTTQrvDiZfrnmRTEpx6Y0Puzk6/whFdhnUGvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVonXhRzWk/rB0PMoo3q/QFzXeVlMIHsYb3R36u+VsM=;
 b=dHO4yv0bTI9OqAZidr8hgoKQfWAPxd7h8QdYp5qu+LmeoTINKkP9YwA6n29L8M3ZE806ILgv5SSVycMvXiQZXOXy3HWfbvN6Hu4nFgN5U5lP58OzDExRnFbdNwCCUwWMXFCHRPtZKr2J6/UychXLh/RDFm6iHogwTB3uwP33I0SqsfTFOO2F6jlcFWgPswfGX+krRVghwQp9eZJIOjo+fBbInf7apHpZ5iRTFmkTkiXpAYQuGFo2VAABf2qPUAi2N7fjzwnL00vqNilrwBkCmovnDti+ERYsQgakOEV2qbq+fVe6SDSDJ5z1xA1ogChoU76wzs9VTRka8wk8E+sfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:11 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:11 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 8/8] tests/tools_test: add gputop PMU engine monitoring
 subtests
Date: Fri, 25 Sep 2026 12:57:48 +0200
Message-ID: <7b993f51125a4d3cf188d9f9007ceb5f448eecb1.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7f978c-da8e-457a-61cc-08df1af3e41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: nkKlXT1Ar2pvGqPFr4loFxPKV2fe//DHTGbnWSnh/2ZEQMkwUoPnn7ynv0rgduPrTevz1KYrTt9v8/i/AA8b55ZDD4vMMifegGLU8XJenAUz/Ky98bfasCPwiFaWbFcFitTXXLOEGCkTs5RusKYZmVI9st7L1zOfDeBVmbsrF6WZCJI3oxXIoaFYrJizsaFCxEPjMDjk2+VQXSZSHpEOLFLcrrXK4Op9zZJrXDT0JNGmdvuEVXoMIRweb+o3sk1Dby2IDWM5i++nc3LsW2Oj8u5ddwzxdzSo/RihSEyGSFVO0ldq0tqeKIYS+xFuj2bLh1IfJGzZmKZYsUphJbkaYD+/1Vmtmn0HaphwlizA3Bo9dqe1BYXLzQptGugsuX3WJ/tNxse3TNKIuUtO715fzdtzsJwKXvZJMa8bnd/b5Yi1YJcrK9xjJDjO1SVku3XavD/ZtRDL/kS3YbKY9CkBA3a8PmwVQ9qgBmVDXdYKS9NTKk3pf+QUnyC1e90QX5htX0aA6zOBbfthj19jvLQL1BIV4DnMXCpwS1/eJPKTZ2TgKiMxTAXo7balYz8i0EoYFCx6FGnoutxZu0kmXpQQs8iBylJsje1RNRhqkdl65VfYOMeEUJPf+372xTLUyIL8uBwyE33gwvvhm+gRR+Xh/4nL1VDcwQBCDT8FrdI++wM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4AEzsoK9dT5bjlZ95Gny5vvkgiUftGc6EKT/Et6dvsij+55qSAWl1Q+dC48x?=
 =?us-ascii?Q?0EyBhE5MdehjGqbeNJRgNE6T5oA2CUiqoOOfp4Gq5uQnATcYw2Dq9CrKlvyD?=
 =?us-ascii?Q?LG+pWN7ay/30Z6H3oHbtqfphpqUnKWlz/2GN1i9RzJ2aG6Yz6PtqskrNXVc0?=
 =?us-ascii?Q?6W4wo6QGE3Uxl5LGwRNeWN+f1OvUea02pjGVEZsaV5dqSl14i9s5C1U/6Cu2?=
 =?us-ascii?Q?h41TChzVYN8WI/nBVnhTQPJYXnTfUg9UCKvzeY9raG3o9PtSNCnsFllSFezd?=
 =?us-ascii?Q?1Nqvj4sIP7wDwetDF3LvA1IpO4ruWmgXosSlf+uD31jnsbtRmCyXMCQ7GeIS?=
 =?us-ascii?Q?mQHju0n9VmxWXul1iGfmPuBYd7Yd9QJjJQ6DPMsFokDHc6PfQOhMZBsQheLQ?=
 =?us-ascii?Q?DwKxnEP1xnyXQZ5/tMEEsD7ozpVmShyLskcf9jL399sntmSBKo3V+q74I53O?=
 =?us-ascii?Q?T/82B8Km6zyUl9KZ9GaXUPwP2NJymUq/UdJ4JM2RtrmUSqqyI2Sht4aiz1wT?=
 =?us-ascii?Q?qW5H8NHvQMdY1x35Vk89g5fHjdcEK2DnLzxGIZjhBnSH5uN05e36JUsOyJJ6?=
 =?us-ascii?Q?206csgRW/4BRIOjlIxkZMdW3O8lgniMOMiArIEpz4ilF5xkBL3HjJdMvjZt9?=
 =?us-ascii?Q?ZSdpfkvebvfGMz/n3eCtsXN05Wob2THY073wZKQO4vM7L5cIfnJBV6VADDHO?=
 =?us-ascii?Q?xz3iBBmT6qKfYvqgR6MKInvyzFedGueitNdc/F/P01h4WjOsfMn78ZI1W1ZM?=
 =?us-ascii?Q?OJYw5HjBwefabxT1EGiYN6CP6XLlkrfUrCkoVckBskRn/n43ae7OQ/bRYLD4?=
 =?us-ascii?Q?slSotF5Xg1+vcvSTRo1DrrW3jgq02zw/djuug1cAkpEUzT7JcSjqfHe8Up2r?=
 =?us-ascii?Q?SY5oA65S/Wkn2ntulwpkB67jX3efps7bB1aAR7wtmXK3qJ+buZ3ABP7YYTio?=
 =?us-ascii?Q?ugDn0v/wtNBTR6GCcMWNqti/o1tMVg73VPDIudaln1J0k51cshFPv9tDIMaa?=
 =?us-ascii?Q?NXyZD+2kpY8g4K9HB/uwz51CB3Ah7DJQttlTw2Wtz2zFJTZP8Js/QsGh9DJP?=
 =?us-ascii?Q?oCgEPJdH7XCPAVd/GDf0v+/x++Q0REpWBeFGdb72E24SAFng6fsyQ0vwu4k9?=
 =?us-ascii?Q?KgPnhc0uUK69b+KEASglW3zlWCgaGy0KZjGlzI5Li9N8GXnnjVTLHs0+afRD?=
 =?us-ascii?Q?t+UsD2xNytGL3rqZ85qFUuF6mmRjIuMmi4ovoOXQdUbtn2Cy1Mhpb6dlcHVq?=
 =?us-ascii?Q?GayhMKIkWTOsFqh9CSV1m8lKrtR6DPpfX42VrTysxTIQm0TBl0EJTYas0b7l?=
 =?us-ascii?Q?PKreMX1336UrymaMl8CF/nQWDRQX18QQPZVpUhbZ+F5iTWf2eQNKNegWvS/2?=
 =?us-ascii?Q?bCh5GhTHa5A7ZSiGmZs3tX27Evmwu/iwPygESQ3kaOvfozlBSOQZy0nSYHvU?=
 =?us-ascii?Q?NwioBdtL54CfI03Wa2U5sZzj0MZ679HbqhlM2dknfFHB+FyvCd5q2EUTPEsS?=
 =?us-ascii?Q?UPXNFTvAiFjYCkcfLNsoPtvuHMGnQ+O4qWCdM+oLL0EdZHilzf2zi7XlF2Nx?=
 =?us-ascii?Q?/+cw81UUbCXH/07BYVZiLM7p8BkrpW6VVWxaYB/AFPgGDj8M5qwMCGTS6qPe?=
 =?us-ascii?Q?3Bkg3ZuoM1ClWYa4WhU4+Pm3td/PBf9wgZ5Wwd4Vy9l/HBB/InZb10K6+qWp?=
 =?us-ascii?Q?I5eGBDT/eSshU2kPg0K5Nr/bCu5mlzWtQyvwJj5v/RVmOW3fT0UF/gTk7lIL?=
 =?us-ascii?Q?FIXHHq0THQGx6gsXFc1CRFcz0TrO3GQ=3D?=
X-Exchange-RoutingPolicyChecked: 0mdkOzvSJGHgs6l3totnt48c/P1z0kJq+Dxo3FsswEqVmUU7+qHyIGpLSuzdnuRV+J3powG2BEr50FDqjBVdEIO04aOMZja1RivfBq/t5S/epdjBA+fA7dfRAUWT0yxozqsGsP/CQkhyhJ4XVslIcyg/So9Kazar7aWvY1bWPhQ8pDpW4mMsKE2n1LTzfcqXUBn07Ch74PYOU7UJCxkCh0oN1kYYwmYXitdQ9nnYxjwJVbVmMZRyLm18msVqqCM31VfkImxh3EZwfCMSElrnVnSnP5Lqk6ZbBmER4FqPhfI1fFcXinXbT4EkSeNCaQUkjo0ZMVx0Rhlu6dwUc6MECA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7f978c-da8e-457a-61cc-08df1af3e41e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:11.7674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKr5spV/eEEqkPOHV+kGxAR4c/9LvShBoG+YW2h9DrMtn0rGtp/qkhTniq6D8crxALxTRWdDpAhFIz3u/LtKKBAUChwC0dIeEkb7Q1fI9hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

Add three subtests covering the gputop tool.

gputop_engine_discovery runs 'gputop -n 1' and verifies a DRIVER header
and at least one engine row appear in the output, and is skipped when
no GPU is present.

gputop_no_crash_unprivileged runs 'gputop -n 1' as an unprivileged
user and asserts the process does not crash with SIGSEGV or SIGABRT,
since gputop must exit gracefully when PMU access is denied by
perf_event_paranoid.

gputop_pmu_sampling is a root-only subtest that runs 'gputop -n 2' and
checks that no 'PMU read error' messages appear and that percentage
values are present, confirming that the perf sampling path works for
both the i915 and xe backends.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tests/tools_test.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/tools_test.c b/tests/tools_test.c
index 857f71d14..9ce17f897 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -22,6 +22,7 @@
  */
 #include "config.h"
 #include "igt.h"
+#include <signal.h>
 #include <stdio.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -171,4 +172,81 @@ int igt_main()
 		igt_assert_eq(igt_system_quiet("./intel_reg dump"),
 			      IGT_EXIT_SUCCESS);
 	}
+
+	igt_subtest("gputop_engine_discovery") {
+		int exec_return;
+		struct line_check line;
+
+		igt_require(access("gputop", X_OK) == 0);
+
+		igt_system_cmd(exec_return, "./gputop -n 1");
+		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
+			      "no GPU found\n");
+		igt_assert_eq(exec_return, IGT_EXIT_SUCCESS);
+
+		/* Driver header must be present */
+		line.substr = "DRIVER:";
+		line.found = 0;
+		igt_log_buffer_inspect(check_cmd_output, &line);
+		igt_assert_f(line.found > 0,
+			     "no DRIVER header in gputop output\n");
+
+		/* At least one engine row must be present */
+		line.substr = "|";
+		line.found = 0;
+		igt_log_buffer_inspect(check_cmd_output, &line);
+		igt_assert_f(line.found > 0,
+			     "no engine rows in gputop output\n");
+	}
+
+	igt_subtest("gputop_no_crash_unprivileged") {
+		int exec_return;
+
+		igt_require(access("gputop", X_OK) == 0);
+		igt_require_f(igt_system_quiet("command -v setpriv >/dev/null 2>&1") == 0,
+			      "setpriv not available, cannot drop privileges\n");
+
+		/*
+		 * gputop should exit cleanly even when perf_event_paranoid
+		 * prevents PMU access. Run as an unprivileged user (uid/gid
+		 * "nobody" 65534) via setpriv so PMU access is actually
+		 * denied. Any non-signal exit code is acceptable, what we
+		 * must not see is a crash (SIGSEGV/SIGABRT).
+		 */
+		igt_system_cmd(exec_return,
+			       "setpriv --reuid=65534 --regid=65534 "
+			       "--clear-groups ./gputop -n 1");
+		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
+			      "no GPU found\n");
+		igt_assert_neq(exec_return, SIGSEGV + 128);
+		igt_assert_neq(exec_return, SIGABRT + 128);
+	}
+
+	igt_subtest("gputop_pmu_sampling") {
+		int exec_return;
+		struct line_check line;
+
+		igt_require(access("gputop", X_OK) == 0);
+		igt_require_f(geteuid() == 0,
+			      "PMU sampling requires root / CAP_PERFMON\n");
+
+		igt_system_cmd(exec_return, "./gputop -n 2");
+		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
+			      "no GPU found\n");
+		igt_assert_eq(exec_return, IGT_EXIT_SUCCESS);
+
+		/* No PMU read errors */
+		line.substr = "PMU read error";
+		line.found = 0;
+		igt_log_buffer_inspect(check_cmd_output, &line);
+		igt_assert_f(line.found == 0,
+			     "PMU read errors detected in gputop output\n");
+
+		/* Percentage bars must be present */
+		line.substr = "%";
+		line.found = 0;
+		igt_log_buffer_inspect(check_cmd_output, &line);
+		igt_assert_f(line.found > 0,
+			     "no percentage values in gputop output\n");
+	}
 }
-- 
2.55.0

