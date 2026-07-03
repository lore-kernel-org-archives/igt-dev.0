Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6535EC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1905A10F82B;
	Fri,  3 Jul 2026 14:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3K7CNEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AD610E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088928; x=1814624928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2XR3PiNmU5vEeP1A1oy2sW5xi2MknwHraWN6xkAiz8c=;
 b=G3K7CNElkN7LAtByxUzx2KAxmH5xYQ5WgPJXIWCQd1Ga6ZUKFRqmwiYV
 lLyO2NaQddQEY4EEfRtTREEfX0f9QSRngd/LUj4dAXXZ51ocjmkwoIxSl
 nnySmRAXZmsvH3KD/q6lhdxjURznlqwalvc6Pl+uBNL3KoWCNRUv1CWyO
 eZezrYq6KWNdofGIzRU7YiuTzom0Zo4DVQYChSNKCKZ2bAW2C89dpxgqY
 TrACLPPnZR+s1v6iLDPbDrUFUsAfUk5kdT2U5WRjTTOEr8p03sJnxoi4V
 lB9GvCPPXmoUjQ9sIy2jdcl1cmpg0yuIETTKIfaR2OO8b/hIrHcBEJEwt A==;
X-CSE-ConnectionGUID: VafbGXruQrSGyJ02l+9uCw==
X-CSE-MsgGUID: 9K/DZJL6TuuSVgh9Jt+BHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523729"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:47 -0700
X-CSE-ConnectionGUID: R/1z7XqMSYesIobcH7V2Wg==
X-CSE-MsgGUID: 12tjelwFR6GK5N3o7Utd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugFD4Jd4xD+D6VsFHRHWyQrmvajZdbTMRFgu1B7RKudJf20y8ANi6YpwIwoVJoCqhj9+ilpUMhZVg6L/lCQMqsoeBth/az5P3VcM1HTAyweaQBDqJW+ScGcy9vg182S6ZLSkuFPg6O/RH54zzI5n0RI+EunFVBN52VeQ9yHizggxviN/9R1k24d5ztwvAgwserMUOinQV6/s/g4cnSTHo379cxGgfh4FAdBeN3gK2h6I8j+EC4cj8geSzu8JS5hx0/oH8D0Lg1Ko1oNoqch667l9HCE+uBZ1qL4MMZoaApoftjubgHWZeyctThBfeWkYaK8l9Y2cpjB06Ti9vYV+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbjDNY7hJxd713DuvTHof3Ge/9JtI0bm0R19Lfu8q4A=;
 b=NJZjMDTRWjL4Q+AXD7L6K1aMjgTw0Vw+j5bNkjYf7KeEcGFY2uGkcYke+CUsD7HgJbU5kprgWCRJD8KuYcl7pv9G+Nur1mTTmCU3urfaZKgLc8r2rI9c+N1cJ9avnihTYBXOmRbbujEJ3ePeRfJ+jFexsfrcgZlSQccn9ACEeEFGLs0+SAtvVRKHpbk3sDeo/xacI1Kq2r/6vJ8RtW2h3K1VbE86XHSqH1Zzf2nHmXr91rstfhA3+SoZv6vAo/3dc1JQwYkBJ2OUgxlp9hOe19MJ1l2MVr2I1qb55LbaWVj0ZWvDQooalxCEHMxPzKw2HGkegeckv8Uw4qEBuC/JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:38 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:38 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 01/31] lib/igt_tools_stub: introduce static
 sub-library for tools
Date: Fri, 3 Jul 2026 16:28:35 +0200
Message-ID: <99c93f19877174d8a9dfd156dde841808a5950a2.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e37ec6c-bad2-407a-63fe-08ded90f5f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u3XBhbayi+cTGixzviO2kRWnvYrpxo0c4YBGi+cUxCoD3zlA/XqRCt7y4iTVbYUKUCvNM6t9hmiEwje1iosf9BveIeiDHggc3/r8QJ9aB+n/EGJFv1cAffBH+hyiwCiyuemrBqijKyqwXNuEBl4I1fcQiGxZJs810rj2KZL7//4sZCpcHzAef3/pBFSTuguhbmwOMcIDWgs5w+xFZnsyyP8l0BbKB/0fP/pFBbDg7OjDjNIrAkyjGzd1wkbB5UZwYMrc0cbKL5hWdfz8nAQFvzJoDfwxpeMfqppO/503np3TJCB6teFdXHI4g1bTG4KYu1DoXAOZyxsvJx3RYTzLzOdpbGlKMEJSPekGgL2jxQtOt+R+4Ov3mrM+sl6DCQswhX6OZ/O0xkNKaXbH2OKU1kMU9DtZ0dPuWctpwbnwCpU/77UhznHOEaQ9e2gD+BwH7/1l88KJkNCHSWGTPbbUGvraWxhTPtCvnde6NJF2brZko/sssFuKyYf3tUbbuHht32B7bsBBT21Rf4uTX3YVWrhls2syG1WYZLK5zAzXZnuHUoeYT/Aml5bls9r8cwvN/A8D0EwykiIqUERyxcOWgnR4pnsqDBoPTEW37tCLjpeoG7Hplm833ba7P+Q2zvRO9iaotV57uHh7uzp3gbfgI5VIT84aoAPJ8PA2WBBwIsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HPmSrJfHWd5OuuaYl+bO4uwbERqNbUBpibYIliIro8F2sctj/+pU3qwwu0C4?=
 =?us-ascii?Q?qhrMj/QzyU4udedh62KyatiTuWS5nnM/hen5k0yXQSYmmFGkfINNmEeN9y+m?=
 =?us-ascii?Q?+9X60J02ZzRZo0EW7S3KCxqYnoSvTw0CY5ahKplrRDpSE/NxZpv8EVXofv15?=
 =?us-ascii?Q?Sycrp35UuaqHAwfDqCgLbUvq2SxkdWg+pLiIlUG/GsV72KvQoGtc68J5NVQa?=
 =?us-ascii?Q?uAh/ODz+id+r3KzSR1hzutvT7piFdO5cd+TdBIDo4qjX6Q1Y8VnueqVYZF81?=
 =?us-ascii?Q?Mk19zR7se2Xo5y2bhdZnG6t8WR0HDHbC49MrURrlVLI2vvvlKDbKdc50UJvi?=
 =?us-ascii?Q?zULXvPz10oruF+vwl/iv99tFk1vI+TMfU0o3QSwHd3e52PPe20PNOZ8aDl8d?=
 =?us-ascii?Q?bt1ATIz+IcFU1JsNcx50o0IaDSHGjszdZP47dNb0VZPFufUIyxKGeOhu1kxo?=
 =?us-ascii?Q?mfSYvc3QUs++U+Xo0/JD9AUCyS1bLWkorSah7pXwpx8PX6oeLLRR0nhinYnQ?=
 =?us-ascii?Q?evicXeu+iRSBfulQ2Z86s77SaqbhQDEU91vBQoyUIcbwrZPqTa343aKLAqPp?=
 =?us-ascii?Q?7wF9kWLAHgGrRlktG/chRatLdvls5Rr1RV1q8D+RmUmtpZOH0DHbycT1iarQ?=
 =?us-ascii?Q?8O7AmoepqO7TYrSt3qcjLYJb/W+OPL8g1xHyGkiBLYOdqzca5tCWwZH0KZiU?=
 =?us-ascii?Q?njmObwuCSxSW7LBUbkGRtMPDBP+4qizZlDa/6qK6/53qK9t3QsR2o+r126F1?=
 =?us-ascii?Q?7eo5kHdZorwCHHJfEL0HP0meJ2sC8n61aBupFxLtsf6tU1DoV76U+iEpZnTI?=
 =?us-ascii?Q?Qj+zteDK7K622WVv4rXYx+cTEMLpZ3WIGrL8+HIt9/QwbCJ5yoP+GJEKF5Vo?=
 =?us-ascii?Q?e3UXJVJj/Fc/tzNWrmJL7vdktRIpHdjzcEZEE/vRkShANiQAObVsmZENvlDU?=
 =?us-ascii?Q?rcvans1kchux4MAzE2MGKWeXYDF9HKTQTDvVJwzVTHZdTchRxPz2sRLLX0D/?=
 =?us-ascii?Q?raLwPtSJdtft+NKNiktWxDc79h+AUKXMffLcgQicK+h+9Q4LUH2ZP9Z62szB?=
 =?us-ascii?Q?aWE9jUPF+/d5MixYvgFWc68XTOGeSnJVs07mbhiIvs2/aIPLniRtpUZfzZrl?=
 =?us-ascii?Q?cPEi4Zs0YedyonXzEFj/NVe/K8o+TNitNR7wHc9yc4SP2HNeftUp6Cs642jB?=
 =?us-ascii?Q?XXWM4RMLVajhvHceVgJSA6i/WDA3OUUuIcNhede3mP1ZOxJal+0u1/JedA3g?=
 =?us-ascii?Q?4pTdg4PLTXtjln2hl+KU49Cc7S5y0dEmCFLufzfeSV2Uj7rQzn4A2SM68IE9?=
 =?us-ascii?Q?PV9Oh/sPrqmzneuOQKgH2qk3ULeOG4mCDySpqZL0A04q/o0HOTNjONkq5JdP?=
 =?us-ascii?Q?nNo0/ZGGVcQWh1jjy3hgAEMYZUwpDhwDJsrEhngB1w4XnzYqkagxuCp9Bjvq?=
 =?us-ascii?Q?5jqpo17mDiMI8AIOGJdXNjgHmc+lHsFoXLHDTYTE3PIQK0KK6NYgF2m4bquf?=
 =?us-ascii?Q?meCyv0SCsa4FkyTD4ePv4idaucOM7g5+NU2tIaZ+D78vWQUsP2LRM0rhcH/G?=
 =?us-ascii?Q?HBYIjI/xSQ7eg3+fO9WVKuacSw+MykBXdxDm8Pg7G3RdWeBG+VZSPvGDywbd?=
 =?us-ascii?Q?gd9bnjjxn2NIAcrLOjdITmjCS/oFZnSN26WVJxOwEHHFb798A6sbTk/TbsUD?=
 =?us-ascii?Q?FfNaS/sCjXKAAmrmSg74MvFOtLIuaFN8tm7lKOJWCJIH8tdJQi3YMAfR99lJ?=
 =?us-ascii?Q?P6iS1MV6tkzC+m241nme25d18EorvBI=3D?=
X-Exchange-RoutingPolicyChecked: mM8+uHd0bLKl+5k08l9LSA4PnrOBzSfgTb9F2urxSTMbKwIqXZ3c3s28jG3lRYypPnlAgsfnRSJirDCvAkSH+zjligQJT/ZIi8FubKFkrcRaPNypEOCCKCuAn3l4fpP9Vrk4HLWzLtZKMWJ09HXW2Yq4MP0EaukCkWHabfKVGpO5CNysFqBMuAT5jpLas/XrnNf7PzaOA0Wj7XxnOngmk9SGdQBZnTxrBpZ9JLFiJgVSl5sjtUuroTCl2qhqM0B+ZYnvfmVzkJrnfrobjLLPCAjn5MOywsw7Bf2U+TSHsizDB1nGo539FnvLMe4jyAkNpo7rYkXILfUauoWfMj9rTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e37ec6c-bad2-407a-63fe-08ded90f5f82
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:38.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tZEfyNRhlUh9K74UEUxsnvUsnf+Bh+c20Zk5786Rn3adm/Ri9wTMC63vEyqTmOIQZ3D/gPQ2RhboEzWUKeF70E5TWYCIZKbsDctCeTwR9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Add lib_igt_tools_stub built from igt_tools_stub.c. Tools that need
minimal IGT assert/logging stubs can link this without pulling in the
full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index d1289a5e0..e95b29d49 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -349,6 +349,13 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lib_igt_tools_stub_build = static_library('igt_tools_stub',
+	['igt_tools_stub.c'],
+	include_directories : inc)
+
+lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
+					include_directories : inc)
+
 scan_dep = [
 	glib,
 	libpci,
-- 
2.53.0

