Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB9EC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8B410E390;
	Wed, 29 Jul 2026 11:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArWA524V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488B410E631
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322981; x=1816858981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3tLzBQMdsluq1kef0CtjKU2ALhzBpmJw/ClRV8b0vcw=;
 b=ArWA524VRfqXar75i3EXkrCHAzHDmbJiaPPhahLUILm/uDu6opkG125x
 mUUoNvoNdCUe3FWDoDg+JpXPRPGtvFqhMcdwMZjh4qHceVvfH3ZnUY/J+
 sWRcbTsTsahG2opWu1ZM28bkoYNWRccfRZLDphwv5ABgPXzdSp0sQ/aku
 Rork43vX0HEXi2j50zDBM597UVa3kg6QQSV+IFgYroEhexJPoVo60KL62
 gALi/gAmvbxqQsAFlNPQrjEhznx0IKzaYLYHq+I2iOL+3rUbvqll89/+e
 AXcvhgYMo0xkmfzrTE53X4h+xFnuKx79e1hpRlJcdrnm2f5eITLb7zv/A w==;
X-CSE-ConnectionGUID: c+TUXTqOQ3mRcDtbb5/TRw==
X-CSE-MsgGUID: ssyRww4HT52T+gURSPpDKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797554"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:00 -0700
X-CSE-ConnectionGUID: Wupjm66VQde17gZlRW8xmw==
X-CSE-MsgGUID: ll+lzWayTyWS3U/O1yoNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264032"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:02:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0CwRPH3L83rbXVHq/qMACwbW8OzQVXUGq8oXjCKbT/raQEdvpb9cXsYQcXKScbeSJp4vE/Go1UMV9CZvevoQFMdZYZnNvM/0NYLwwjVwuj9KZ6HzqVqu7NCJROBx9Ua7ng752qnlRjcvHW80+436g4xCIK2uXswl9iVmY8X64KwbEPkMc4NKYOn54vnO3rig9YsSEbhcfmHMuhd3gQ5mXOJ4Zq9nhEoQWT4NroslWUwk5dgs9IMxRXtuSLRkc+clo5xgqxzTvemT6GJw+0s7T5f1i9ovLOR5OhKSEquFMtliGSjxbgAo8aGzP/5E7jbZQsEdR/prADdlinkBlqodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6Pab3rLx1ITJQ1JqueE1OmJ3B89EUe/iKqRqTv7Z6Y=;
 b=mRc4HOt9HRw74MxulKP0nmNtugWcIQl33LGiCm9L9FyeUcxWMfpgFVgrdfGCmrMn0vTef26xshEVVTgYu1Y1K8Fo2+BHAmDjDGBz9rp5fZ1ZvdQmIHJqMMit2khO5vVRCRm71GamCkVM5UP3yrgvQl6fL+OKgtcVOWvJX6KXa5oJArEKd8gnAqz8mxiRnrhISCW5MnL/aUJ8QR/AoWa/l1gv6DROzgDDfXVlrZgS5zjkOFQxkFQP/MLlhPAjgvI6BtvqnAOjCLAeaPOSiNZun6TRsmSDTnOYN0jwxwoiYoXNlXrLTG5g5P+kcxNPZjpJe5j+Qr2xBoQyUuajCLwQ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:55 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:55 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 05/31] lib/igt_tools_stub: add stubs needed by
 tools
Date: Wed, 29 Jul 2026 13:03:22 +0200
Message-ID: <5b816cfd3243824e2a3363a22e13c6d8fb3f880d.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: a7741d59-16ab-45de-9d7e-08deed60f09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: RutGj6T9tVasJRZQalYQ7gQm7xAoSz+IeHf7nOC6E5gMzbwmDJjXyuHwqWNJ+Cf/ou24yKdV7KolK7ZcZ1bZEIYPbQurd4khUetPyRRTc2BhJSv2NRaoKqd7eCqTbXnE7aRS/C62+p6gBlONparJI3YA2dzDVxKKumbSnWdmR/KoID+ASMX0cLwpZqCpSMOXiHQ8bsQ88dlOwloMEUq6YFqLLpHnEmAvGo/qbgNiSlh0xC1Nj8QtXGxp+qrkcalfb1YlbKrwgyRQAmWt0Hr7A+a0fCIs9bpwuzhjN0bXzPJmnMjgphAM/tCuBj2lmsY5LHOEq07XbbLyjZBmzC0IXs476g36XI6/mf9LqzLxjfRhM41RyucVkJUCN47KIbW8wcsOEvb+fDHJNZnu9T8PjKNSJ8HgSfzl6YVC1twl8uRI8T9bLZNKmrFza6ox+OavseOpcg4K+t9Tm/Y2+RaL8o2SvTJhwSIFo4ly7HN/9jZIEIBF1ZESIF33ub1mewV+15VZ9AQVcapMZNXzC5TfgaL9luFPrqqjFATYEWI74JBZJh9LYna9WkanHQFZAzA2Ebfl1b4HN7uMJM7Jl4HBJuFIrR+X2LodYFxgflmrEJT9bx0ZwZVF4ympl8+E4GzWvEynF3OYhAWV5XB7O5+rk0W3zmHyh9m1hQGZYkBWCho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jn/NO48NUDV04RASbX+2AyY7kgn+NVJEfQSbGww/zGjNk2B4nBGWiHDl+Yeu?=
 =?us-ascii?Q?LFSP06SBcP9oUWaV1lM+0rSwPCiCZl8wdOafoeI8YoucFA2/4QE7lozBZ6pv?=
 =?us-ascii?Q?Znb4JyZveYuLpU+kh053tkjGb8JKSAOTu11v8kz5WW7JcznrHUEbKCQQsG6c?=
 =?us-ascii?Q?QSTqYgzT59qWG3AQJ2hmcaISWKpg7mOfwNOtCDV/vJAKiYaO+Kw6ZbnzX3me?=
 =?us-ascii?Q?5NZpf6yRuq844yeMoh6RdGzT/qt3Wz8yEo00KI9Hh38tXgZg6LVDX3+CJMLu?=
 =?us-ascii?Q?yZL+tsCgSLgKYuhVgs5pkBpVcOL9Zh/K0OwlPNS6lNR32WmHUgZtbkU6tTM/?=
 =?us-ascii?Q?mpLrccAKdvAF/jtmXRjmcpi9s7lPE964a7u+JiAe0Yim4MyCDJVLYSLM68rt?=
 =?us-ascii?Q?uOBBYYbZA8wKy4oFtwsZBQtoZs6PTuwDOOYBRma+o/isTvLItzxeB4CYpQyF?=
 =?us-ascii?Q?vjvIIL5X5WuvafPhLtv2UJMVk4iwXRTICZVQf4xgTdBDMDtnTr6t6IURVA4M?=
 =?us-ascii?Q?C23EIGm9+SrWK+YN08Wx8o7ZCswLYj74n6CphmLKiwCEuzH2CrEKMVUuaHk/?=
 =?us-ascii?Q?EwRhurNzCLnvePbSgXnrX4JQROVq79qv9hz2b/Ol9SFk++dIYlgKhgKNKe4C?=
 =?us-ascii?Q?8+RuzQMdUH+ymMnfsDSOC+SI15pQ0J41Y4egXRfJhBbDEAtqpmJtfcy9vGx6?=
 =?us-ascii?Q?BVZBPiCAdYOYBsDeLQQXqDDmVm1hceKcFEbPhO43C1J3oiCOGmn58MYIABAz?=
 =?us-ascii?Q?8Bm7UwrFMf7bxDYCHpp2HshRn4iLsU6T/yP9Vd8VVuAzr5xgvEEVf/LfQbFx?=
 =?us-ascii?Q?X8N87ebKFe6AbXYPrTQI1BIxzmqQduDSsCpj2NAnOS88Y52yFuDJrc4kbvKr?=
 =?us-ascii?Q?ShD8y8Mjwj56eJGa0PiJG8NlJDLDyt/5e3nUQfBpWpIRL57LVt0TfXRbbGwc?=
 =?us-ascii?Q?iFsqb59tkQbnavYPAY8SH3Kv5BVf4aTunzqui2lIWEF751P6yXTMK95x6kJr?=
 =?us-ascii?Q?Or0Oi6wo8ClljGZ/ES9JSyi8zjzvBjKNIo523B5r3M5zvKcQjEyRZzxF4E6s?=
 =?us-ascii?Q?Z08jeysn+m+8poFIT2BImI5aAi1ooCx42GnbzveEIVF7DvMRysTQKH/mMuAq?=
 =?us-ascii?Q?ZMzMljI8Nai8AFcXmm8FgG7NK/Onjw+Potc9mCIl6xkkX7rfHlzhNQn3L7B2?=
 =?us-ascii?Q?Qcf/6cSUAGEXYbRvB5tnNCkBa10N2aJBlUs56Er3lUdIPrxl6b4ZaZjVhxDW?=
 =?us-ascii?Q?5PARH041vz8IAy+9aKsXGEcTwgQzM+U2Ru0UYoZ3fibvp5gBc/yyzuFZYy/X?=
 =?us-ascii?Q?Kk2X+qfc3nFkoWR8//8rMoZcsKEk6ZdysLOkNNyamoqab+T71fNJvPyEfqrl?=
 =?us-ascii?Q?cTlbQynUiipehMu4j6oKXWwk4V+KE+gVY59T2ZmqHqFTt7KXe5lR3JgrwTbt?=
 =?us-ascii?Q?xAAhgr3XOvyxekLxSDxXXFhu7Re2GlkKt7GUbFJELegXfWXcy12fVTikAb4p?=
 =?us-ascii?Q?kTybXbbxdOD5whnD6iwCNSjgjzpfAzI9jglWtpADwv92oAwfLBFaf2TXMnD6?=
 =?us-ascii?Q?oLiG802kXFbx4UmuWKYV4WCOqBVnPfLygRz4RLJaarqb5iRegv8/7udjV0Ke?=
 =?us-ascii?Q?qRPXT5J1GcX0UJvEDzwUE9aUBa3F26S1mgrKyDDwoshys8cvCiZfBksBAKDg?=
 =?us-ascii?Q?9WYGTNrPLxqN6u8ydh8DQsB1n2JOK+MEiRWvLlDaEXVcswPCdYktc7dCWXeZ?=
 =?us-ascii?Q?IIjdLSw3yAJxD8fylf2FjteSvInLkFQ=3D?=
X-Exchange-RoutingPolicyChecked: s6RNn5TFY90Xse9zB3BlZBEYpCwcqa1+OSx9MVjnaYW17PyTVpeUuAg+QhEwUvALvdlwv+a9xqo23/Lqd61GRPr0QfaHN8qMw7pLTVvyHxB9lbHk5qSo2pcSacjEPbiTyJbPGxpB4A687asX7tl811kYS4Gp31t+OhS6C66wzMb4HMC4P56Z5nn4Zb5sccfPhEIQxOxvRJji1QUMrYuPYkW6Bpz/i/w5ZcCjcVFCU5Z1qN8+EsoVCaRwwRGhru8raCOWtkEmG3cSDAxFkGJEuLOJuclQ66cJffeI5T5DOFvvUAHCwf+tMbgSEdbkbGR2oJ1EZwuoyI8/f3hpzHXgeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7741d59-16ab-45de-9d7e-08deed60f09d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:55.1444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvFQI6bVUs+TFy6tDtrgsRVIJx5afTZEhqO1aa8A54zRmSGXA5uA1+OiTmuGu2ky/Q8K0FqhfT/kJivTIK0OtxKym0VplCMicWU1GttbfO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

