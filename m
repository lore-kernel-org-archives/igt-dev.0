Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E2C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CCE10F02C;
	Wed, 15 Jul 2026 12:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZgVXtoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521C210F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117708; x=1815653708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=t4cO0h0NRDDnoLxjcD8ZSoWeskxBF+olAg1zLcmLohg=;
 b=ZZgVXtoUTsDxomf5hhRuQojAUJ0VnFROZrdCZUA1G/iKpieAqMHmcbsm
 DwAr0fAk9t6a7JiiLvej8jE9JbhI1NWaDxLHS+1SBln0WU2GbNgYxSEf5
 muhLAh2SOjXxKT54cbGuApkN/E8MjciRQh9afI498idbHOE9KnJYsKaS7
 80LQDT99S7cujDs+Y7bqbVulOq4UnOnxXsEBABJ1X6+7je1eK4ychsC9g
 5YRK6+RH7HLLFbAX33tgiKsJnWfkRWiDGDxbzHWDhf5IRJAw8IhAieODq
 WIlQfzBSumB5NZGyxA9YBQLE9/QY2j13srZ0wkIaKgZW0CHjwDdJ5Am1J w==;
X-CSE-ConnectionGUID: CIOYtAKBTl+gSXpg42Wx9g==
X-CSE-MsgGUID: 05afeAPpQJKYmVYQJGHAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84606997"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84606997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:08 -0700
X-CSE-ConnectionGUID: 5gWYzcCXRVKHSH6KLYKbRA==
X-CSE-MsgGUID: J2W2R/lbSqyt6qK5VLcIaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659368"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFFSiucfYKk5CpY1c/sE//FBF6rN9zx38OA3JQdPOobhnekjIwRMhxsmQXBisFLadSSF8cwQ3RR0q1X7E0NOARYBZzTeSfNzqLQWyQBIYcNGX2supA7EiJfNqyhfboVE07OLPcXU6pJMixcesrrtiPFfNlB1hyMunGXn8671G5egPZks7b9kcree6ma+F0+8koX5u7S+Sry6F0zyionoRDjMbv04IXcV+0hwWBliqXsTq8b6Zhfs8yfXZ4kKATojtfwJfYINBnpdBsXHvxRpSl4bEavOOjKu5GmDdnkqHIOZFec5k7dTX7tIYZBHqxmpfii9p8L/sDZUi2p+wykd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqnlbU39IWoWC2DLHYNUAk8B3QPadwsIZnoi2mipvsY=;
 b=CUXERlXo8TFnreYs7JmMxB92a6+K6BekhzMbY5ydAIwjZM0lM8HEjmFcvDAawceVmD/wbFlq9k6/ev7RuOJdkLufXWb5NtJxvZGzU3tCM5igiVNV9fl58rZSb4sh8yMBd9aWvN9BRI3QH30EmAcyNyDaFTzjPH02qRDXNHkr6YXb/NSkUcKLY6vFRaSZXwJh3mYYH9UF+s75Azj3/C3PumagWkiPUBsqSnsN6QRQK8L51lc0s2B7duiVeptmGwjv47Us4vv8bwGXhVsih3PMQk4XgeTkNjTvFdh3VOmEiYd/s2sUIe33Ef9YPpMce+jwdgi/kOxWJM/9MajVpP3Ntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:04 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:04 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 05/31] lib/igt_tools_stub: add stubs needed by tools
Date: Wed, 15 Jul 2026 14:15:15 +0200
Message-ID: <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: c147f083-ca02-4bbe-dd1c-08dee26ab3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|3023799007|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gw3z+pFCFB7pNIfhG/BvFfE3URAPsVyubqyONOmooKFjkrev3+Y2suhEIlk+4SVo/xfdFSZV10kbGzaCWPrGBF3vhCcgpxt4apKwpDiF4WW0HHIXE8aP1g9ncA+NVhGKPX1UXazciFruxHKkK+rSRcw4e4ElNJ+VDc+qIOks3F0i4767gyTgYYI3x2FD9g2/P1V61abNDQjALyOQBwi+OJ5a7zteczvjrpKYS8/p4iITVTZYWs2qdl5zPMeFZzJIaOba6KGvnENRmTA9yp6xM2zCBTWDGSZwRh5K9bUZtI8K/6fPhEfJNQ94LXpZzcvYiBDvUMfloe/+su4UXcM6rReduShVnYoA+CQqzYHx/Q9kdT+TwCjBCPG4L04XKw0a6lvoQ4yqkvc3eNswPJl/O3r6q5KftSsX54+vTFsRCKpX+rUoe18L0IuzQnzlNSaX/lKn1BLABdsiXz/clB08KanlNuOsBA1/tREZiFynEmGsoMVtXkUwSSr2IzeBgfOJH63dQJ/k7b83TBdN1AKmE7tXG8vUsJkZmz1NHj3v1EFfiGs65LGbrow1R1RXGCwX4Mhuy+FEQ/QlFmowrihkUhWOf6qn98/ddpOsdSDEXWU2oFggekWwLbSv0IuyGfZybeh3fy0pHQdk0wnPpfg42A5QF/kRYKn/m4HNFQEKBHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZGlpwXlUii1GlSxk42mZ/3Ub2H7JbbvapoLW7fsl3P0tqz7ButCsalqZmWs?=
 =?us-ascii?Q?GL0s5IRmqZotmCn2pRp4Ad6fyr9jwLDBObNTZj+D09bRaKvUntzdhKXTZIqh?=
 =?us-ascii?Q?Gsb/MCHNu7QCuYPB6JG98O2FRQLUIbNoO9o7dPOsKBV5pD+1NU4idd+8OQE7?=
 =?us-ascii?Q?db985TIGb8RQeNRVxsR4vTvh99c9RyyW7EefKrtTpXS4eu9GUh1mSg3aW71i?=
 =?us-ascii?Q?s1s+yLkx0y606pghtsuBGmYXktFCgrsqL9o7M9tua2VIw4mhV86KFvvxtdvQ?=
 =?us-ascii?Q?PaNRVzaC/5alDwqrfkkA0iEzU7JaW/MTSdg8Gmz8y83db/rvrL+Fx0xrH/ex?=
 =?us-ascii?Q?XiG7IcKAUUrjQyNy7GoOYzuyTW6FUN604lWhCtMOrfwKr+efdmAyHd9SWc7W?=
 =?us-ascii?Q?E3pCf38D75mfkQbJ6VjxGoTk29zWVhMY80MIS6v8e5yMsaIhaB4SPKzqhyRu?=
 =?us-ascii?Q?IJaO9rrEEBzHYQBQ/+HHstahniVDaaLP/jHek7k+SHGLyd6IrfK31956XMKz?=
 =?us-ascii?Q?3R16elNMUg7Ili+rzohlsWoQAZ4NRCqMysBqFdfMQlCays5hEH1kLe+MSKYL?=
 =?us-ascii?Q?ILgDNgTAbVrGyUsWJrWglznEnhigLrZ6upgTg3EZpJONJWLaFkE9/Tkkegqk?=
 =?us-ascii?Q?M9u69qEHs3oW9lZzPg/ugPCwIuoeUZyQkG0NlV1XRL1gyF6GnnRymOsGANlD?=
 =?us-ascii?Q?G5XQyveCgEemnj3+lN+RTT5yaTP2UtjJlFrCm7e6oNHcouzBmuBx20ro7Xp3?=
 =?us-ascii?Q?u7d2RTRCydGdtP6k7I7DVTI72efeB1LEN3sNpbxTr9dXQkoSKwGCPgBqHEDa?=
 =?us-ascii?Q?ObIvUtdXsQKxeDadGx8lGGyNIJVUN6WtUbZdqTtXa+2p3/9d86IEtPAhxBRK?=
 =?us-ascii?Q?ZDaxMOuPw4cOCk7cryzGehrBbcIU/04zW3IqwXZ0G6P8NFyAKXQlVPpbmz7W?=
 =?us-ascii?Q?KYoHlGYEaXetVeaZqs/Vz8DuzcrjD42meKkM7zciP5M9PPxr50h9qGUrfX/+?=
 =?us-ascii?Q?EQ9QZ1LnFWNNDfROj1+NYHpuvBKl8chVXJCPWT7yiZN5lUie0Rqtph8qTjzC?=
 =?us-ascii?Q?pIXrT5UlwyMb3FsS8xUrEeZ4zTCrXc/94993t23KzBBmriZHWuKQH+Yxzq3c?=
 =?us-ascii?Q?Lp/9ODP+CXh7LpI7GLrjQqSP5LQSP3anLubTMDV0GpenY/q211vm8PRmBwmZ?=
 =?us-ascii?Q?cvvTTH/c46Us5FySgpM3gpONPhVhaNjn1SP3jDobzuyntFsZDNlBt7CDUH79?=
 =?us-ascii?Q?9ncKEu4k3orJ4TL8ucT/ugo068VHR5+snO/3CKE4SloDibaE5Zaly1Ga694F?=
 =?us-ascii?Q?gj3LXhbcy2P2wsdVJaVn5ZljGXi92sE/TX4awbsGNunERDw8OmQx3wO+uear?=
 =?us-ascii?Q?AK6NTiZgYzYn2AM7j/z8TZQ7r0ik2LaFsyeSRJc65UcE76k2FjjbiO8d2qwK?=
 =?us-ascii?Q?jSelJuzNrrOYJGfWpc5oL4cKcbgUMpKAsKtOu5Bz8/B9rzvYDEtkzQXH4OVV?=
 =?us-ascii?Q?DqXMcXGBbZW/mRDHQy//H3qeHZAgvXw620eWxCiZ3XfntoZPIhzgewLcD2Wh?=
 =?us-ascii?Q?rgt/Lzh6a5x9mznIR1mcqaMPlw9hp9SKWffkpNCAFtJJ/+6cM7fUdAVlQ4Xe?=
 =?us-ascii?Q?qQ4jjlA10rcUWXH7TP0CbjidebSNc9lYPgzi/+gKiYtcsKvKwN3fBr6O+atm?=
 =?us-ascii?Q?H8SQ4T9d0I9lZ55NUWdnm/busmIc18axcbQd8Sw9glj2oqu/cEeppDUmpMDG?=
 =?us-ascii?Q?CwJH/NYPTrv1WiWtvrRUt/2FzSxsArc=3D?=
X-Exchange-RoutingPolicyChecked: tAQf3bvT+sBtWMyiXfA4cjcUwjgzvG79xQxjmQgiHS6pknzGA5J69vbmBP5+BQ4Zx7DZdIUOX+9xT7Fc81JySqEQUWPqG4Z2kQlUubZSVuPT8vNx8mKl5fIljbva3xEvOp/I1Hf7slnzG74oemiXvSm9Wd2+a/QwP8rcT2vBQtEN+UubbtwuPau4UWKL9m4zy/r0BrgpY29U8yDWcJHXSQiRyTQHSmymYqYKmnA3357x04CCewSgU3YHAwziIE8RMDvHtfqErt23wBQgVdOdw6s2cPj4lEbtW69DLamGQGhmYwqyPS+ALvMm4XfJ3cjd7ypIDAvEEQqyUIidMJp9NA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c147f083-ca02-4bbe-dd1c-08dee26ab3bc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:04.5108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRL2KNEJLoIXPN5yluY3y6uq8gBn35Yapez98EqNwKNS15X9AEYbHOkdb/6szTQgoQRfmMSdjBpNlXdKzWvWFWm1TsA7+3o2MyK287EG/Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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

Add stubs for functions used by tools when linking without the
full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
igt_open_forcewake_handle_for_pcidev.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_tools_stub.c | 83 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..21dc53f3f 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -21,12 +21,27 @@
  * IN THE SOFTWARE.
  *
  */
+#include <fcntl.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <unistd.h>
+
 #include "igt_core.h"
+#include "igt_debugfs.h"
 
-/* Stub for igt_log, this stub will simply print the msg on stderr device.
- * Domain and log level are ignored.
+/*
+ * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
+ * The type is used as an opaque pointer; this stub always returns -1.
  */
+struct pci_device;
 
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
+
+/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
 void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)
 {
 	va_list args;
@@ -36,11 +51,7 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
 	va_end(args);
 }
 
-
-/* Stub for __igt_fail_assert, this stub will simply print the msg on stderr device and
- * exit the application, domain and log level are ignored.
- */
-
+/* Stub for __igt_fail_assert: print failed assertion to stderr and exit. */
 void __igt_fail_assert(const char *domain, const char *file,
 		       const int line, const char *func, const char *assertion,
 		       const char *format, ...)
@@ -49,3 +60,61 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+/* Stub for __igt_skip_check: print skip reason to stderr and exit with skip code. */
+void __igt_skip_check(const char *file, const int line,
+		      const char *func, const char *check, const char *format, ...)
+{
+	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
+	if (format) {
+		va_list args;
+
+		fprintf(stderr, ": ");
+		va_start(args, format);
+		vfprintf(stderr, format, args);
+		va_end(args);
+	}
+
+	fprintf(stderr, "\n");
+	/* IGT_EXIT_SKIP (77) is the exit code igt_core.c uses for skipped tests. */
+	exit(IGT_EXIT_SKIP);
+}
+
+/* Stub for igt_exit: tools use exit(0) rather than the full igt teardown sequence. */
+__noreturn void igt_exit(void)
+{
+	exit(0);
+}
+
+/*
+ * Stub for igt_debugfs_open: open a debugfs entry for a DRM device directly
+ * by path. device == -1 follows the igt_debugfs_path() convention of
+ * defaulting to the first DRM device (dri/0). When a valid fd is given, the
+ * DRM minor is resolved via fstat() so the correct dri/<minor> directory is
+ * used.
+ */
+int igt_debugfs_open(int device, const char *filename, int mode)
+{
+	char path[PATH_MAX];
+	int drm_minor = 0;
+
+	if (device >= 0) {
+		struct stat st;
+
+		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
+			drm_minor = minor(st.st_rdev);
+	}
+
+	snprintf(path, sizeof(path),
+		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
+	return open(path, mode);
+}
+
+/*
+ * Stub for igt_open_forcewake_handle_for_pcidev: in tool context the driver
+ * keeps the GPU awake; no forcewake handle needed.
+ */
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
+{
+	return -1;
+}
-- 
2.53.0

