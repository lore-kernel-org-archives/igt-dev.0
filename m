Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C2EC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4210F028;
	Wed, 15 Jul 2026 12:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U47384n+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3753E10F026
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117760; x=1815653760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=L21P0HKluXroheETragFLj7VwbOY0zaZ02ZquQsbOkw=;
 b=U47384n+tQzD0MDnUYzEz7ZAgxLDl7tN04YCVniK0WDw+YxCVKucXnfk
 dblDQlFLBVS8pViAklehEdlKTRExt1NXT9QMqmXXH/Z9pDtFyRc/VfU4D
 bGKEnDElnghb6PM4bS/lMKpndjE9RiMsS1vJ3pj0CFwurgazIWdq33Utu
 WMFz7gr6pC0yCG7AjW3QXuSQYIe8H3ZEUvs+UiWhZesh/Ps85yB2VZVTn
 R8yHhaCfd2m/Y2OSCkOezedp6F2coyyLHn5QLhQdXRWrvTi0xY9SfiGCv
 0CQpoiKFPCGsiN2g6vfTXc9unMdKEDvTSS/IUKBGbAKZZVg9UfzAbo3TI Q==;
X-CSE-ConnectionGUID: OXFoWZCqT02d7YBYLAU87w==
X-CSE-MsgGUID: NzYoI++kQ+inBBAhQEcHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108139"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:00 -0700
X-CSE-ConnectionGUID: Gb4BxX6tQV6XyVdf7OwaKQ==
X-CSE-MsgGUID: Fen15s78Sl+oK2HsLj57PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252210321"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sROF9B0jQjhPL5kEtYjvqO/yApqNZFf5KqM9Gk6XGgABWUAJoaEAw5yvmmjnbCkfJ3yAHHHDqPrYiPpWSLcBDO4zIyXBSYtc24Vc9dOAVT/SiajxT7OVvSCeWRTa1uZCfUv9eVkuU0Xz6ewE5XPH6yBBUly3+J8268LZ/2pMO8pRiy/6DUghziVRUiJLlpqptJQLtFld4Nc05OIbIKqoHJrV2NN8snzf/yqepYxDqhpZrZYlJ/gTUC0Tw19JaMGLoTZc0EwjhbqWljlKEY3xZUuCtqCF6ie0GROSWQXJtDzDvYxewRGMnceWxj4mlYOCwsjiL+EatUvaNvxmQkTSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OzvLpuMe+b5pEoqMsnNYjjs5Y+5c/km+fBhFbAV8xA=;
 b=y6b1ckO/uUgNDgUYa4mVfoIrs0w3l99ngMViB1/02h220RT9x7Qfe26JhIR5UefMJvQWzpWZ77STlNWLYm9tdt6wVcOsARe4mNdI2t3XRrDs/rF1YISImiRlyU5McVCu0miH93G6eYTchhTh0plRGFdnJmhMi9jE6zoLMXCAvyA2TUyIXEnPMg7+34EJEDbpaHR8xJOy7TEnZYtlWBHm0/DsnWROQS2VGV2zBDqFY/iOGFFr4c/3ZOL/Gvsat3WrfVXATgO88X/TxrHlU1UQhDHGeLzcvwK/OJv881IWqfdcEaq+tUK1QelAaTdcR5vXgnY0h6Hf7tLuHQMZEDKFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:15:56 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:56 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 26/31] tools/intel_panel_fitter: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:36 +0200
Message-ID: <539a1e388900fe94b6399bdd713f1cdbb6a81ec4.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3e81e3d2-bd90-48bb-cc36-08dee26ad26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T0707kDZVUDl7fMlzbcjtstYQsTTZ+UuT1h/lLSa17MwkayOoIXPn5/WKNN/vesfTiBLIuVjm0zXLZ+A5fz7RUtngfimEfgw1RbdxAr8stQYQBbD1uHnY3Lye7Wn2CkR8KzuR03Db77LRFnq0fPGVGM5f+rQEpkB5m8sLvDJsNtnTCwvACe3ZZnn5Z/M93QT6zQHHgjoLGCvtv1Pect2hJWtwPCJjY1IwWCTMwKnPGAeKvDf9w8Wj1UymWQZoC5FNcTkWP71svSGG3UMJgfpAjBeeb7xwXa4dOcatnyFGd7NOkC3uthF0P7fL/V7FK/pUFccfpGwLmZCwdvmzulFZ34Qgsvq+JVTcrfd4eR/E/zNb69bU+DOgzr0w0iMmGPqAQgQ+Pf5UHRaoRvDkD5R5i1YNkn3RHqgdl929Z6KnXErSfZ0hPIMUeB0UjNEXPy4YUVCYd1jGcTIjeHfeT3hFhxtLQIlqiaxAzCVoKmn6OZc89GBBFcxJMvMwGi2IlM74WYoZEi6Zxtvt0E4PgMh1ZFRSiB9vB62ZEg1GnCh6fy7ukfasNN4m99KkXGcUDeGBZcEXOFhfjJtyKlJqbDvHQ5cO/wTNq0qa8QS0G0mfPzvn3jDZCRBLwYKCYVCI6uVvb3AVlp9EWkEF81Mgi7Y+5LV3AU2dYnAXMXDy4J6ewA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhrwLTl+ZjZ4XTUHRjDDe7CH8pZ4i0UvnpzBJVLGBmSpHh/18G3Q1BOiiVmx?=
 =?us-ascii?Q?/hq9VO48l1HUoHweCzKnlZwetsfhsr56FG/yodxCPn8Nm8Pg2JZgcXHrl6/y?=
 =?us-ascii?Q?aCdeQgqcD7W4/6wz0UijrK46reJ6gYtqi2u2+Mah0LFit0fAJTPbgNdlOCLk?=
 =?us-ascii?Q?qCI90YNhHynSg5D9cKpMNLdgCKCv6VM8q7P0Z8xY9/ufL0oA72/styWUrilS?=
 =?us-ascii?Q?c/9C8qYd6Ek1nvJHSZv3Q765jw6ecoLsydTRVB11AWv3JJhiGitzzyq0sp4x?=
 =?us-ascii?Q?v8xPLGmsi9hdVJbUxPnEvkUg/mHKctIFXQhd4KViNZQ/FhH2g7xt7AHWvner?=
 =?us-ascii?Q?E8O6ArizHqNwnI8FNScVKv4KBCU9tWHxtaMTffQBsWNopT+N/2qxSJrdIV9z?=
 =?us-ascii?Q?QttXCKgnkR5fetQl6FQhr+vX3+PvZBNe6OmXIF2YUe3BAMlv/Qmdo8wN8j4Q?=
 =?us-ascii?Q?YEFbpCfX1M7zclss4VqzqMYA5lwDSkY4xruUAli10upS1D6Rs6+sKCRC0XeS?=
 =?us-ascii?Q?AwOwQ2c0qVpXBgUj387JonJHPQvs5Xop4EqAjiNh80seVgLIeK+Jt7Uwj2Wh?=
 =?us-ascii?Q?xiiU8s/cGn6nfiFoCG7A++zGGnNbB8GKTy+qBEVGJyps6nE8+/Yt7HXToepl?=
 =?us-ascii?Q?qxDI6Yuv5Bl6Qwm+MQzHscgdHUFONU6yhjAES6mAXKuXKqJm6so3BMdowjQZ?=
 =?us-ascii?Q?C1CuVv1DAJ1URgk+vWjAGnAfpy96Zq3hrFoOjSRki2FIWe60tZHeYZe8KpZJ?=
 =?us-ascii?Q?8Hz2NrBBW+eXKDZ28Bl7gBaPlKg8UoUHBHyyQGDd347g26S7rkJURvRqVU5Y?=
 =?us-ascii?Q?BmW4tGRUyeGWwIPR6GlAMQICBszx0t/Pvyi0vIAVb1Gz9NY45Dr+bSBGntL/?=
 =?us-ascii?Q?qM5U78aCvU1K9erSc9v2aq/2F/krWLiFRTkwA+4LqRsuuOrihz7ngHq2UqNR?=
 =?us-ascii?Q?gVvUmEFkWCWVIroSZ81vM1yU/SeDgUXYwKGbKCF6wnOrovE1aIIhjst4MywB?=
 =?us-ascii?Q?JbLs2qAnVUBqelONYjzPtC2HZuAF6jUme2whsyX5BNZK2G9V/NBlz5j2QQKl?=
 =?us-ascii?Q?hkwRW71ucrYAiOHmIB1wz4QjboKk6SL4uGbeLXtkZrUVxBaalKQNd+gOntJC?=
 =?us-ascii?Q?Kn71BuHdteh4Dkvh0Y4avlwKBMSyarKsV0XgI+p0cJ59SxWXGaPjwciQuHHZ?=
 =?us-ascii?Q?4FZsxnSo9kg2RhwbyxMomX8Nyfi9wctmH5Pe7IZI1dI1X/t4yVVcgvOyQBGD?=
 =?us-ascii?Q?EXPF2/D4z/Cag0P8jWd4ATIxRjR9DQ9Ku56lUBXGWUa+/csFfheyB7i5O1E3?=
 =?us-ascii?Q?VZ867WdVkBOPFEyzExKzTysTlYPxNTmg0bZ90ciC2Q8NEy3PWxp331mh4PQu?=
 =?us-ascii?Q?2fQkO5ZJiOpTuokSVAFC7ucA2m8xGABQddGi/UAO0T8SZ6ySAY8UZLeMZL9n?=
 =?us-ascii?Q?sTgXy9jqkhKWn+rCBgZFAf4Mqvi1lUJEXIcZz/EL/MX/z8T+Ur8SmkCVfFfj?=
 =?us-ascii?Q?fC+ORpKTmGYRZy8VuZbqFA3GxwJOx3GE/P0dV5Nu82pMrY1Fv89oAgPj4dxS?=
 =?us-ascii?Q?9djhRzvZF7eY3W2qk+lPj9HjL3orUnsh+Iy7TZxHmvjzRsFIljoEcgit8f6n?=
 =?us-ascii?Q?eMKnJteUSfMOtKENzR8ilxbBq7zYoALZKQ5jgjq8pC3IqyxA5zPZK2Q35syI?=
 =?us-ascii?Q?WAkbW98Um6+8WYvxIPirM6eMfamhZvTD9rXfYVDpeHHHhkzvw8ZhjJdk31QA?=
 =?us-ascii?Q?04kZgOQ49tKSJliRm5ztmYRt7ds5M0k=3D?=
X-Exchange-RoutingPolicyChecked: USFgY2An9dMOGJSMZCZSITuiGPIbGlvF14zhwIJ/ToBjblESUYYFp96fDmdmvA3waC6jmiYmSaQVNk0G9aiEGr9o6Vi/xDrkqQtrgueGhzQQFp0x929evokMyFnER69RRyTMDUArBDfnnfeKdiYfqlmeF3zJZdANWpb8Oli9Q0cAjfyGA9Gwlr4AXtXiU/n48b0GAiyQCtdXDvAV+QkADqqN7jKWVFIyMO1/BXfEFYl31DQ+MbnGMGzC7PHfdarP6XuVoeF3fIJBbmRR6aYKwidhGK1/Ktk9PrmI/FcFp5bqkV0Yq9OL4e9map4JtZrbEnX2pxfxtFKD15ye+zp4Sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e81e3d2-bd90-48bb-cc36-08dee26ad26c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:56.1533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Na2rW//YFxVq/YZfTeTJKRPiikTo/jcc/kFeOOgSUGJF5gZGm0PDH/Mwdtjturf6WRnC4oHeUJh9wHYbvklSe/sh4yfbfPEQBGnqh3VD/xg=
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

intel_panel_fitter only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index a31b6d0ed..1a4e14ed3 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_framebuffer_dump',
 	'intel_hdcp',
 	'intel_opregion_decode',
-	'intel_panel_fitter',
 	'intel_perf_counters',
 	'intel_pm_rpm',
 	'intel_reg_checker',
@@ -120,6 +119,11 @@ executable('intel_infoframes', 'intel_infoframes.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_panel_fitter', 'intel_panel_fitter.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

