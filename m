Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6239EC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1790110E00A;
	Wed, 29 Jul 2026 11:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbYLaI0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655DA10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323035; x=1816859035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v/Y21ov544qz/x+wweKBNIpUc2mUGnurJ9Qxvaji1uA=;
 b=mbYLaI0W4DwgGAbvWdMY6ZwL1UM5R78CkUQMv2xEnhvdlISfYr8bMYBi
 kU0nsxTqvzc21O3iLu4VPPRMHKdLTSGiuPGfxkbEn6Hf7d2B5t7LEkkAH
 kQvbdvGGURUkYqFrzyqh/xj91Uxb0mRB9RGeJeXwpiyQYny0qhw/iU71m
 T3TrtqY9YSc1ifACKTVxVYnv72XIGGkes4TuWxHDpOrayj4algL+Eb09d
 BSupXhB/fpe5fcGQMMKOUNlTFKuCoiNeBc2WoqvXbXUOBX08en8PZ3+Ti
 h64G/YXDZ0HxHiusQm9xDHt/Gc4em+azQS59c4NkyF6XrQVepiXkEaQ/3 Q==;
X-CSE-ConnectionGUID: qNcU4MffTlybsvvq/E6Dyw==
X-CSE-MsgGUID: 3Jf6D1WLQzOaoi9keMTXtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743549"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:50 -0700
X-CSE-ConnectionGUID: 3IQjrxxoRGC4oJwlmgncNA==
X-CSE-MsgGUID: mJb+PZx0S1Kv8pFxN8V7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6TcZnxHffKsnnEqVlDYUFbRZtWw1sMUECsjY+X/Az1jZKR4v/XOBOQh+2A357eMr3/WnSKtLb5Hb5IBBamzB0p9U4Zx+hUsmE2Ew4yKNYd8boKl6gEgxwtnP44ebMYHBw7OGGwlKdB7qB9FqurKk07isc//TqD2USgsHlJG210b4E0t+Vy30BGyDH3yLMULHHbahgJJIKjqWtgk5sHy6xzjXp9/EUdYYe4LdFj5BDNX3ElwWxUMlwjegdA2CZa65lVTyEarXUW00nO5gcnHiQKiZMdCzFL+3gUR26CBQhcKIKe9237x+iQedj6yMEb8anPHYPgzKJopYjhC/nFISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcbeeqYyYQVOU3oMxz8MqddFZhlPDt//d2//cllrff8=;
 b=NC5ucbGXjHyfCVug3ywFTlAzr2jbwoPgMCS95TlNXeXCYUQWoVoexzwnuvaaFV5gSNPMkR5pmFlSrX7BzZ49eotNOAd4lYMxhRLqxmFdOkUGxkbdwEeCnIRfkA5Q762q6LzOXHFnggjC6a5+bl9cHPJkAAeDN4/SOhZf/opvti4a9OknrQU0hn2fOYZ0qaK0gmIbuS3HSNDbevzmaY3VdhMq/k9WzQ5I7abQIGJy/5Z7UiQ1j5X30EjYWFj2OAChDi3s7L+PdZb6829VRU4LRnkT/a11mxHym8Sib8r9KiVt8flr3lsoRsFK3Dksa2RWz8cgqhwC82WYmUM2MGLeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:47 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 29/31] tools/intel_gvtg_test: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:46 +0200
Message-ID: <3273d0db0b7bd11848394570b1fb3f96ac08ecc0.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 863d5471-6bb5-417c-8887-08deed61101c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZbP2RHmUTzlieDUDp8NSpsWWaFVmkl6TTCO4RNPv2wdMkvDOj5OPFjUEjabuHXAiE6+jN9N1Sav9x49VyEWjGjOqk16j8IlpbMVaNSFl5+nrqUYf8StaGkJOyjwDLVD6K4SKRgFlkQTIilpNuiRAFSnNCJaiZ11oasa1J3Lc9vHc6NJ10bddJPQqNEyy1/fMtj0TCEDIdLPQH8ik0Lax93FNKTvxXH5UK3nN+ANEqAFDwxOcSMbJoSYfofwLz8W4M7bmTta2wGD/30xoC8GJ/LDnOF6xea4QA8AxEfeGmTW62yqIFBMivPg45p6XqeZ0h0ZS4kVp9kGDGJGwYuvHmxu7LAJqet6keIVy23vclVnqR46nhQAaNeQi5S/SqcKz0QKBBlNsK4FQItVzUHz/cOUVmRBSYFe17sX5kyu0gCJUI9VqmRjuQTea6y9bSnZM3Ffu8C7SoYGovaZUyPUMG8PRjWGFFWFSBiWt0+PnpLHclUuXk82kJY5b2zfoiU5ZYMSjayPOp0CZwns0tg9vjQKt4L1PdG+G3YzxxwUfgfXwsY20IgUJKww92pl6cghkeItttVHRrQmaXYjFCp0xWEfHzmBQ9S6BNNV6EZfuOsgtFswZxFRjRDu2fcmLHJOPHCWiTk0ReMXtZXvhxITZdZLISAVgXcsgon3fBdP7HYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GxmoDl+EH0ntfpFXKJUBGWIWX/kaTRtnHidWOTGllHYjU6K3HQwF850N8OBc?=
 =?us-ascii?Q?KkCFX+0+yeGwk70YuTFFuiy3qdS4Oi8723FDlX9896h56XN+vkpPSvTw7KRk?=
 =?us-ascii?Q?ikwq/NyMRmDxmlj63rPq/VOy+rtZRgJQbgMyszQpDKaFYFE/DRvQ41GfEuvR?=
 =?us-ascii?Q?ox4E+FBpwpy3SvNxGzVkUk/meGEmz31ImJGJ6c5bXqb9lVuX1PyQCzohYonH?=
 =?us-ascii?Q?zxzy+nZJhleiINj+JawDHRH2eAfPEl0GY38bhpllkMI5aKOb+rCP+YCg2ngB?=
 =?us-ascii?Q?DAPERxJ9p/y+4Jp/+x70OtR66lQxSysnhrxmsLT785tfHut5dgvB4sqrDI1v?=
 =?us-ascii?Q?kBSs7sCKQtSIhiU28DCDIO2hfPImWKlhUEozgkO2beVUp2WqgdU+7hZuhVyC?=
 =?us-ascii?Q?qsgOGUcnt7F7iOtr4JDane98mONYTcUPaxQEJrq1bx5hCYHjfnfUbKO2AJyU?=
 =?us-ascii?Q?6m2tEMjo+XBrj9rPqRjlzfTbNuZBlzhLNtp+670kMJ96IHvnSc3FJUSCnplq?=
 =?us-ascii?Q?Pgbbnt9qUwUnlqzueJmraG0KtLzE4btBtiV4s2UVF+XSJSDxuGK5yIfS5HbX?=
 =?us-ascii?Q?D29Y5PLM9/uaZ72cRMem7hGjrX2/LIMVTWllPUtmydNAJ6qgaRYnWWYht0SF?=
 =?us-ascii?Q?uTyQn/c4JfBLO+RINeWGfodelrCvNjVh92EOKL48IjTjGzHyPCv4GI8BWxn0?=
 =?us-ascii?Q?J1UP/Z+E+5hqpIjtuI5qpRqGx0dTw6wOhblljq4fhhJHAU/8bTK7QuoD/G5L?=
 =?us-ascii?Q?/AsKkeHKARw0DgzpXWk5yk4e+Go7Sp15RljQd4prz87r+mmIJGH2Jkk2GZiS?=
 =?us-ascii?Q?sAXSQ9iDMS7CJ82Sv3vcla9j1czbAYMqDLHISTh1NLZOKdHWRqw/tM0rrR3f?=
 =?us-ascii?Q?gb4EMf5YzYvIaTf/aBpKetA3RZflwSXp7WhpzYeezR6U/l49nuIGfASA20jX?=
 =?us-ascii?Q?3V1RDUvZFTS27U8so+/cqtTttHmOLpSMXuYHof2N/C1Y82ac2FQmqVsMUdFB?=
 =?us-ascii?Q?MWgQtHNoi0Xwoi42qY6GSfKIhx/qqARDSCv6ADZfOrwCpWuoFOZh4Gr4pMWG?=
 =?us-ascii?Q?E2H1VIr7FV7Wyo4y7nzTIV64eW9rTk69c/t1sLwD4vToqWJkKB42ibO/JV/M?=
 =?us-ascii?Q?MgcT+/3dnbYxyrGmK7XoJWozOfkvQt2+PUj99NhUwMvwtGdVJ/V5KQms99TF?=
 =?us-ascii?Q?JfIdtROPcAac8OmbKGhhiEbjwT8ucqEsMaV3593F9W5mwBBJY+jE6ZO/ZFS/?=
 =?us-ascii?Q?pZYNqPr5aAKSbG1r+1Nvv8pIBfWFIQ1mW3cu5Cz/RMJ2xD6sCOP/aOu/ZbFe?=
 =?us-ascii?Q?BZapcK/DGFs42AjKaEX1ay79uSWdoSg4NDsb7ONKtJ1L3lohT8T8BS1kgkVU?=
 =?us-ascii?Q?FBu8FXJyr1nplEg089o1MOeDtJczRYNULybflRgP0ycaEfqmzdkGUviVnwdL?=
 =?us-ascii?Q?bUn7gm/9Y6wsp8cR+WcfM4Z0SmnWw6pIAifTlPgmsqYYlIi8uScq+HEWTqqo?=
 =?us-ascii?Q?HH51+05UgVXU+Bptz27ttinoLuvnj24LOCreTeXTW1Je+HDdOzWqq0JFKHnL?=
 =?us-ascii?Q?0stUB87Y5gWyXl5GqsfEt92r8XtOjou2EwZbjkcEmKiN4USGUL2H7X5kEWo2?=
 =?us-ascii?Q?8uzGugPbP++ZHuin7/eUAJhf5yVR4q6YnB59aUS4B2JqAGkBKrQVD+3ovOd0?=
 =?us-ascii?Q?5TO7fkqyeRxBQcx0OdBjk6y1qkhO/m+InOkwkyc2pt6HmgufZsW8fDXwKXJR?=
 =?us-ascii?Q?0pF0HJ7xG1+HfgmVGvjd89hCNPgkQ6U=3D?=
X-Exchange-RoutingPolicyChecked: Tror7YN2penPBvUpZa2trmD5pqgGAVDfg7rV6fRs1z7IolY/HgDTjv6tKPdCzprLsJZNPg74iAaFA55a1C5LqT775tIMQhrKX85tj5Xjb3XhpTYIxDkBrzoYoxc+IcX/c7hDX3erGU6bBQkykPA8lPXX/v8C2QjNc5q6D3mKuXx3sPWxE+hgZZpMaTRuQmN8GzPTerbhEBlYHhcwgv5iJKzl1YCqZGqZXb3stRu9yhtydaPrj5feGM2MHxuQgjcRpjqSLIz5TdJ7e3RP7baJx8+FCCGrn1k+2hjSyzfY3PHHlHoO1uMCdU8ffWgL3cx/spQE1UgfUUBNCXyd9l1yig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 863d5471-6bb5-417c-8887-08deed61101c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:47.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5nZ2PJVjZwUp9aoMWOTZvTa43XVJAC+5KbBXdEj6QvU00o7C7N77iUWI5MPkCoaAEv5DWw9d2VqxHtRuHjEd6Vkasgc1J4Zyk8/U6BMgUk=
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

intel_gvtg_test only needs the core assert/log/skip helpers provided by
igt_core plus the lightweight tool stubs. Replace the monolithic include
with the minimal header set and stop linking against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   3  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/intel_gvtg_test.c | 2 +-
 tools/meson.build       | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index 408e703bf..fe8f7a599 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -30,7 +30,7 @@
  */
 #include "config.h"
 
-#include "igt.h"
+#include "igt_core.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
diff --git a/tools/meson.build b/tools/meson.build
index 2a084a0c4..6e694164f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_residency',
 	'intel_tiling_detect',
 	'intel_gem_info',
-	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
 ]
@@ -132,6 +131,11 @@ executable('intel_display_poller', 'intel_display_poller.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gvtg_test', 'intel_gvtg_test.c',
+	   dependencies : [lib_igt_tools_stub, pciaccess, libdrm, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

