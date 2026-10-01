Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16309CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EC210E187;
	Thu,  1 Oct 2026 11:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRG4Wwj7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA66710E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853270; x=1822389270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jDFFnDnz4biiD6tPN0FA0kC1L+nGeFxMOj2YSqmcOEA=;
 b=FRG4Wwj74sUOONcmF/yjbHD9JNKOJEZ153LGEOIbmoeq3jEciSydV2nR
 t+AG3gVtszs8UuLe/tJ7hFaG6+P1UlaLqxwmf5Hmuy1kXdghRfLk93HtM
 +giY4sdo4THTHJrJ6NM9oq8A+2A/HdoN9x1JJOPRC5JkbqEVWnMe/kIu8
 b36lJjiR9u73s6kAriYkJu2UTIIcf4oDSMdGNOWfCtkFN91MThdNqISm/
 AbD4AsnOP2Dg+9QbcMI+8jOAMyMJKC0Sd10TEMA0AyyEXu2aClR2Gmg9n
 3cbgLBC8GtdvttyHNPyTpXymix8utZdWfCCJL9Cjnis3vtreFV7PAfH22 Q==;
X-CSE-ConnectionGUID: f/oBJdqwQ0+4pVVrBLeOZQ==
X-CSE-MsgGUID: 6x9+6YRpR5OHxQVzyp5+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102278783"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102278783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:29 -0700
X-CSE-ConnectionGUID: UY6wJNbUTZKq7qoYqk3G4Q==
X-CSE-MsgGUID: JrqW45mmTmGBmp+EntZRFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="302211428"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX5NRoEJA37AyWXlvjLSIFNeocn8rlH/6xRNAkLwSXwVGPBoNJVrokUW3HYpHfRbwUjs+Piu/HAgs4ZIbr9QDLlDmB0g/bQAXcXvg3dWnlRd2X0ZPUu6JYEYMa0fIzLfQpFkMLHjkMusGzj3Hc9kIZ9lznaPIwH83q/A1DScHHqt4XbdzXCO+Va3TAS5XqJ//DHJnlXWGZOL7seIQD/FgJik0qdJD6VXiEfBTR5GLBlg47FDCJ/cJayFRGBalod9zz3i02PwCo7QZB0z2HKZ+p2PHYZbBCbDuQCAf4Vbnk1YEnYZw+jDwrNqBfPllsVg9YiX7ZfHtZi6KnEXEpVjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mciF0LiJmjsuAH7htMVtptZrahVQbR88EowqOhAgaKA=;
 b=njxZl4JB7qX192yCLIpDf9kZYz1POzpDckGqTGhLWDh9xvwi8tTx/6fXAaVoSbZzBgnagwRtGXWi7uU7+o/d6H+4sEc/Ath6uYKQf0O7LZjhBr02zfGY/PzcBLygV5ca4HlHRadIWbfz6eDBiSUzBWJyQr0Ft5lXCJuhE6qydge0xBa72t+LsG7bZrfOjDwIJdnRfvUqtLVKa4UZ+qTHdc/Qkh/+F6/Q56G9vnb6NkaveLY+DEZbsJps6fes9qdpLvj8tUhOtCXk+38T6JJ5moMGSx1R6o4zypHWrExtCyyPqZ9Y/en7EfBrWMFRCCHiHYsiP5gDr8uwYNoaBce//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:22 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:22 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 8/8] tests/tools_test: add gputop PMU engine
 monitoring subtests
Date: Thu, 1 Oct 2026 13:14:01 +0200
Message-ID: <d2df747d0813d3cb156d9ba9f5b485d70e2d5596.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 704ced4f-492f-481c-ab33-08df1fad24ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pcgm6j8dpK8PX0x9npAO/wK0CP7i2f4kEWk6otmXNyYNMXCdyeENYGGdp9wO6xg9ZKWPdnFmdMS+/W/4FkBwMIOwcY5W5uJ3rdH0Ku58pxG237Pa67xJi4rYXSiQSOHO4yINENtD9dHDRLwE6XI0d1cukl3XdfIWN+XyTt+8cXLGo7fgUFqIsxhIXRnZXhhoMw1ErN13w2JxvCd77H8/OXp3qnj8e4MkmZ4e+ib9ipseEXbew3cFI6pWh7oAy6INWORH4Hlo1bXD/AVDyDN2GTKQDESwiTBw1iJ0WxT2Jq4uIqlBZ7tzn4krlAzEL/olmbr7CdZoLUYJnpIrcBFfLV6tOwW5ZOtgm05JLF6dzqCx89V6RATQ1aym6oXA82zTzSZAFdjoz91pTgj43t8ssI5mlZQHLfpdaN04ysy9+h/pECW4iFVGwCDbQaqFVdYuqoX5cJhPk5akmkrgSwAVDJUNiGxIh+dx8WNQIEx4qN/Q4QBboYBoCkkJnmTkif2nH/Z8qXn+mMpzP16eCgrlwySwGSazmenblYpF+Wam/niMmA8kkapM7lbAGOldrtFVrchZ25XL5vg/9KKmqxZNrnKUpJ6hpEZKQcSy4D6Wq/YYyWx+80z9F2FE+JQ46A7dWQNt89hr9QEvSZto76Bj+4yYNRcyaDW/3ccVcv8IAEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AnuWPkhrA/SF1meGdqN/4Or/OS8Wpzatc2UWxOkZFGX7sftUN5osQCcAme+E?=
 =?us-ascii?Q?A1+0V6vwUfIDVUnm/LTd7BXSWqhfuI+iXd4zzzZddAgdZG0SlOPdFHQ3YrBt?=
 =?us-ascii?Q?9cUQXpqMs1RLaiwpfRTG0d5tHhIb84xeZTlNjyrR7IiKizrQ3/wPdoL3bcqb?=
 =?us-ascii?Q?YNWpzd8VFUl6FrfOpoTQQXqQxps8k/eh4rlL6JfZbRAXBzW9TLcTQbYijgzq?=
 =?us-ascii?Q?0jgctngp4Jpj0y5YSl+/XeO2vBwf21rSuV2gNHLU+7gPcOLnRgYKttxrkTp0?=
 =?us-ascii?Q?1urJINEiFP3h/Gz3n58OxZUP9FJDhmykWCW2/VYTAbILt2f2T8OO4bjFtDxW?=
 =?us-ascii?Q?02v+sb6eLMpX4e8tupIqKqsmcuYdJFrxLNa5MibAlFJpnkPTjX6ghHkSujDr?=
 =?us-ascii?Q?I+ZIlj3uB/+7fs0in7pg03ahsSBtiPsbZK5oZqc4RkpkB9qYBcqSwRx4SFYZ?=
 =?us-ascii?Q?kCBTpVa7qbAR51ht6hXJcLCm9BBz34lnoHiSgV44p0v9ibwoYwzi0iqfbfgS?=
 =?us-ascii?Q?3hAdi4tONlPTUdjSG5yyrLj170P8wTeNSTcr0746SuJVLE6mgCGzewZ2aY+Y?=
 =?us-ascii?Q?h0mU6oVbAOrpc8rR5FHdwtkTfIBcbXcivjyAuW42Hww4rMz+VbAMNGhC60Qy?=
 =?us-ascii?Q?JszW3oOUJdSj9eG1eahzR+M7ophWSNKlRycJg70+bas//8mfazJD9g9BX57N?=
 =?us-ascii?Q?9JGgdYEhC8c4qxJm1Y7tUV53UYGl3rGO/Y1dGUOJhuKJ/4eSPR9Ctwpw0oHs?=
 =?us-ascii?Q?+945Elb6QRvV566sgG8nAif9xZOrd7IZvuU0Ex+lPbdI/jgdolB8bdRsDeG7?=
 =?us-ascii?Q?/zTD8bGmCX0fLnio6TMzM6TXjj5hJyOuxPln69R8mp7WFakFvtgIitn3nOMR?=
 =?us-ascii?Q?yS7WH0fWKE7qU+NgOPBfFExR32AXLKVq07swV54fH3GSlD+YHLgr8q4UkfB5?=
 =?us-ascii?Q?CqXhDzc3JnggJAhpTyD9YhqAYo+gkaDb2Lm9cYw33fahbNxliRBAqp+XIJyO?=
 =?us-ascii?Q?QW/ig3x4CubkHLMuW3lXsT9j/fDgQnXlAByDn87M977GpJj6x9i6OvIg3oWZ?=
 =?us-ascii?Q?fQ5UtKK/5I69Q3jLGKdGiTK9B7scLdlQasvXLXaCH14O/TcwL2mOssGuZR0w?=
 =?us-ascii?Q?K+Zbk9usLAj+PkwP4vAeYITTC2/ZdKrCad6VwwEGa2f6YoVgbYfXOGsHsLkh?=
 =?us-ascii?Q?OJfufW9lR+Jm6g0cQ6N6I20K7Aoa9zCg1YDzxMgF0SCR6Db5sWYvNZjReUpt?=
 =?us-ascii?Q?llAnrGuDzyqtZ2nslP0buCWCMZgHV1UWZW2i9wQhgoo+OrBD2vV1SFxJd4Dd?=
 =?us-ascii?Q?q98nFj7D34l3bs8+7cDdj9iFFZBipDzwdJoZMY9VflOd28JsFVFen1bc7CAj?=
 =?us-ascii?Q?IC/wSnORgmqHgwQT4qrPwgga8X6scq9FzlJVt//jedRN1dYW6g9nkMjggfDt?=
 =?us-ascii?Q?+GvDDlh1b3OLWIuJvu2SQhe7qZYvrCsKmOm6QB4muWWYB7tsEOc6DZ/Af5eH?=
 =?us-ascii?Q?BG0CzbKrUOR64lxMfOVltfzewdDk+LAu38O2fCqxVLzM3HwuBl5j70BBCnDP?=
 =?us-ascii?Q?qteK+xfA8vvg9Hc3iantA2rQ7vs4p0SSpmK1IR9m9123y7KB2+cT8dVoF2KS?=
 =?us-ascii?Q?nvANtzl4KSrC7HPXNZhN10Q1B+JThrVZZUANJHG4KqZzmMAPCJfFoiubVclY?=
 =?us-ascii?Q?wEw+QDHCED6RMcIL75EFrngOy7DUopwqN5Uu6sMeq1Wr+qpD4Uity+W6VKat?=
 =?us-ascii?Q?Lbz9Lc+sPCk2P67wHJDP5wDNCgSCaT4=3D?=
X-Exchange-RoutingPolicyChecked: qIlKx3/wyie+JTQEDYZm8ANpOD7MQH0Kq9p3orB3yXifeukRSZVKZD7Tc3eFPClsdJLElWMwFoeufNGNGJhq1biMYEszXXkdTHLUEamqW3zO1yvvBEovrXz54v7sJwY00A+zpJwhPyL6umKiqvxYvXZmianB9H0QMdzFXPqShLQjDGhqQJ+pqwKYa3VWuTDgvPcDS2+z492r+0Q7DxrkNQb3NEw0LqIhl+Veqsw6sUwtHH8YteVplbY5r800UNjb1Erf7C26dSycpGLt04mmw/wVSBD8UGM2DcuMSO57b4W/j/X0114hWgZmuEGGCMZN0F3VBmypbQUJqhGk4hpZdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 704ced4f-492f-481c-ab33-08df1fad24ef
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:22.6357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFwp+MrrONqkw1kR+v8rX+w2ClCEPsxGtJjUIIfNu3YdPA4Sq0ED22WDmdpWQ+v8mGpES2FOSIUQFM1FEM7U7nfdU28ZLG/CtC7Ga0gXsuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/tools_test.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/tools_test.c b/tests/tools_test.c
index 857f71d14..da5b7908e 100644
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
@@ -171,4 +172,80 @@ int igt_main()
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
+		exec_return = igt_system_quiet("setpriv --reuid=65534 --regid=65534 "
+						"--clear-groups ./gputop -n 1");
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

