Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A739CC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B07A10F028;
	Wed, 15 Jul 2026 12:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEZGlrbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55D10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117762; x=1815653762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cjc9nD2mGXT9WKov1Svr1eH8erpksp+/VbNT4e2k1tA=;
 b=ZEZGlrboI8j3JMQqVWHdK5a77Z/wb2bloewp9npvuzS5Lw2bDfFFUQqG
 8x8ZRe/bdrw8+QPXMMfqfZPB5cfWDLhkj3kTUwhgyE+Feg4mJBLa/r735
 Lq7FK1LWHL1VhOhJDtM7YzG8o+hfpjza/DEbAKxLnhHooUR+wxfh0qa/c
 WQ2iYM78a3yZ6WS8h9EemmGpWNE2TTgnKC9rKjPk5Rs1cRU/flEzHw5F3
 ZYf5AMcbUQ9rRxFSf9MyUXoubCdHZbvLMtwosuFJG3d9m9pgHQixvPQIa
 n0oHNFumVUo1d/OS9brZngv6az6gI0zCChIiw9pILVHEmqhp3mOcaWnS/ w==;
X-CSE-ConnectionGUID: 6T9lnGN7SfyILs2h6xgspw==
X-CSE-MsgGUID: P+pRg+NxT4mND2hTPA0ErQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607098"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:02 -0700
X-CSE-ConnectionGUID: uVzTuYrYThaDiRX32N81Zg==
X-CSE-MsgGUID: JZvPkdLoQLWJ64nSlmiYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659699"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:16:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBts4eyoaNS60Pa5xp1izBRzOpvTf7mkUDeyZVwSzZ5B25+zgYO2N44m6hn2I6uOD/rZ6g1BICg6U9RNwFJx5fUVaoIYmcaxqep+OylPKXYxq54aI4pnXZnGKyRxxdC7tnexErFFsauYasyG1eDA7wRL9B6Abt/iRmWS8KqYjjRiyM3aKyPjobQYDsDTo6onjb0w8A/YCMDzj+ImFQNihNToMSsiClIjTcUYDG08SpV+xZ3TLzMKo06Tg13TQyigejt7oCE6smyJ+iRY6NM8aFToyD0HB/H8vLsJUW15uJ5oD06duqpfXdwmJR77Ij0ivR083HfWO6knV4ntDpV3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2XGN+Dez7WC8UxJ9IKfTxm3RpV7HPVyIx6vp+YLh+U=;
 b=uqoV3f7hnHK4QrWoyI26/bi792M25DOwtIPk6x0JmuHJMmUWuZkkBiFG+8CWrVnv9wO+WIy3A9B35rIuDaRnHKO89Z84/F0XFnjN0hXZHPMKD77vvgXDi+Bi/OdlPMY1MMZc2WzqVxASOOfwS7hdqifdjBCQfNQhXlNOnGmsMuxm34zrsjb+b+ewtge+ycrGfVrBSljS3bXlFC/MJ9Fpqls+COxwEq2PjHPaI4lzzGLCrUU4S50URKbpf1yG8GjsreOa7cPmDSjf9Tw184iKZRNtQTrwO+jfOVRRnQYW+XJblFOeivshF7WXAL1oeQwwAaelrK2NAfKIaMK6siyBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:15:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:58 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 27/31] tools/intel_watermark: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:37 +0200
Message-ID: <9c33105d2649741614e121177cf1a11d1f74e7a8.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 261c2da1-238f-4967-7133-08dee26ad3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WoOWYpRPOJku/ZO7bdacuG0ypDQ3pvnGXPm0b/pur5U0et9mzJpDzwQAs66zMcNv+3pW/0W7RDml628Ez2vk2g0p9nQ4w3Nm2nTqiKJvm55o4nL5dsun4jpB//231xll6O717ldirj8zB+kWLWYlns6AemTye0y+LxZtFG8DiCAbQeRbgwQ6ZnADPeIV9c/yzgJCRAqwNoWNzBF1yKjQ2vqAglzCd9lTcEpeOBCvgV5+EYfxKJGfaWsGZcG6rSrGOEjbricU0O3fUTrSLCVmvIBTEXNLqKuh9k3JwBvuuo5HRhK8DshMVLlg9Dj6DXGC4FXws4zMcAxr6bnF7hw6ZGzKiVDJMDqMVkVy4/ACQKrJsWgJNvz1vsGtyHPDsgGYExWtsLv1DdXCUZR6VH6QYy/YXLwHzhhtUhW4fyJDJe8N02XoYVpybjCKIM4nv0WjnRJnP7GSvL+VLw/CpSMWrV/ho5GmTw+b/jY1tGkMxIJQnwI0v8BEP9NayfdX3kruFDtPi77/XaLihbqEx7+Bwk5MA4+1/BrDribtQUEibHtk5gEkNlWDttRBotlhtOFQn/NVO86UpzZBr+bVIR37HWHl+menLGgTidDUz5PXlVbKkGyadQkKZkG2M0n1Mr3CXir6FbQibNAwipeN063wCxhUooCyaW3ihEyivYHPDhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6WlTOUhqjR4K9PAbJnk0o5un6Wr3jz7oCGJhBrzNMapZECwpf7lyUS9cmKL1?=
 =?us-ascii?Q?XEyP5u6lu58/97opnt3ukSEqcdkK+7m4Ojegrf4gFERDsPc3Sm+VJ5+4yww5?=
 =?us-ascii?Q?qBZpQpeJ+QrJCTmSrlzQwc2ujMQGzskCDSAU1oEAdjKkLEaKiuRKyNFTUCuT?=
 =?us-ascii?Q?5FdtYCpQiRLKvmXJ0DToRMkXFLwukFu651LoKpluSYpoFE1QNenwplvKAqEf?=
 =?us-ascii?Q?Oo0IxnyYWtD0wOEz1qU5fgBfPdI+KokxlezlQBji76LhhDHYA3EVMxbQTuKb?=
 =?us-ascii?Q?PDOCrpSiwAdl6r6N/XcIvsVlJwvsO1nCtTx0HbqR5bOFdSpwAFx0pbRddvFR?=
 =?us-ascii?Q?S55URXdzZ9PWMlj+ex8KprLGF2FMUc4CQ3tkbJWzB2HhSlJrbuT5t1548tYX?=
 =?us-ascii?Q?fPsK3JCHZx03F7U2Di/BhH+BJSwWC6tDGn5tFPjXlRudsGtxeb9AG7ikDoWR?=
 =?us-ascii?Q?TlgX1Ly0NSaMLmCip9aiPVxr3BAVXfii0hh3vloUqY3wt7G1ivLwA4G+c+F/?=
 =?us-ascii?Q?zdTimJqiUmx3BMgmYT8xyBdngaci9twloV3JmzdTg9FlhKx7wK5HLiFnwznq?=
 =?us-ascii?Q?8sW/HYr+Pn/4ZZycHtI6VfwqO8sq48yqKCf4OD3zw3z8umThYe1QJx7/mIQ1?=
 =?us-ascii?Q?/HV4pafxPnE19O1Q6sM7sOT609uB+FK3tev44X8QwjYJjJ2MwaeX/cG5xgBV?=
 =?us-ascii?Q?rYP06c2RtkWJB3SvUIsWOjwXDx59zgdTnNoGjXXdWixf2lRQlRm26YDaCl13?=
 =?us-ascii?Q?XtKL+UMzfog7PGvGwbAup5nx5h76JxxZ8EaMbb4xXYdbM05x7GdL2K2CoEZH?=
 =?us-ascii?Q?jeYbzbMXBDHG5taTfyxvT9PnM1tB4gMeFvDz7b0uwER3aEf8goqz2+Sf8epc?=
 =?us-ascii?Q?zgaUpi6eRuc6Pq4XcFcUJMnPpBgCGT+yH9HQJxvHa00omGM4EDyGy/7/dKXo?=
 =?us-ascii?Q?/e9c0wVZtBFHWeIl5LB28sglOiu3ozJe2l+70Dlr4jC6E/yfShhblM/+hYRq?=
 =?us-ascii?Q?jf6T+oojsZHkg5/50qcpuUnXodQyrGqusUptZWoELk/jH9NrUj1su2G1Hx+k?=
 =?us-ascii?Q?JOJBBg0dU5Ci4yFZnhOOVftP1tolakJbwGiSe/n9M51sJ8GYccSMkLuOnS7Y?=
 =?us-ascii?Q?fY5cK6YzXhmfmJVnAH1a0GlpkY0fgsmk6NAHY9r9vJmUAof+3X5+8Jz27jS2?=
 =?us-ascii?Q?FBJ+TmfMeHiWJ1HRLvxR74K4Nxxn96ujvizhqO8PzUYX+IxlabcDwPbx05BU?=
 =?us-ascii?Q?+xoED9J11Qj/mXoa9IOqr5a2g1Q3txrrjye4sQtCdKm7I8lcAVPxWqAGBUYk?=
 =?us-ascii?Q?TLvwMlC+XtidcjXzmZ7p5FTyKwbs0OJqAj9oAGcpsyLq0AJOpT6RW6B0wmJx?=
 =?us-ascii?Q?Qk0UpOCrisp9pIaaxcAMJws8uRLsTCqR24Rqpq34Qav4ntwQkcneBf5l8rrL?=
 =?us-ascii?Q?O9kPgD7EQJt6NTiHXe822KlbSP3jZYC1b9N7mmRswMU/WzVRJSvjZBxBPHlB?=
 =?us-ascii?Q?hs7CrTc44cihE8tC9bVLmKIIFYxmpQ7HZStYpVyF4zgHXsWiTfk5XC9M1CW0?=
 =?us-ascii?Q?cZvmPgOUbu7nnTD5u1qcMv65a3l/TTKVF1Uj/Tcv7wwLdZr+7MMHntkXepBn?=
 =?us-ascii?Q?FfZoC3VgA5VvKI3jFN7YgQN9xsOildtl2Eo6xFbNVlfFTZppD7dlNRHcgcfm?=
 =?us-ascii?Q?e+FrmqdNruFPrIXbMjVFkVUcFDvaWDe+woTKscSBQCeMMnw/tEv2Ob1OICct?=
 =?us-ascii?Q?odCV/wG0YVv5THPqpZiZVC9j9TdRLzs=3D?=
X-Exchange-RoutingPolicyChecked: MowiX7R5EeIZEqWGiXd1W2cWKf1E1v74KXRestCQzcOgvNNianQAGYMT7jvF19ix2G6SWZlk6D8R+fPZWBkKV1jzh6k2jw4oMr8u1MaKqEtIyNMVhjiTbbSA4Bxx4Ez7nzVay638aydOYajKs72+xqDLKu/fVpcjbeCTjE+ZmDpQ/L8sSnR/5pnxGXuQRQZHLqBL4ny/hPC2dgf4T5B7AJ7br0UyvOpLeQUdIWlWGSskWfxGLaYJ3/sdComqxR0rz0DBRR5Q6kWKSqVQSaio/xrUk+cuU73OolLviGNJQFnpdX7n95BdDXXr0Bk4pZYqk4JYet+chbH5Jrg4143Ikw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 261c2da1-238f-4967-7133-08dee26ad3c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:58.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A23tXCze/orhEZtpTfrsC26714+DiansCn0rysLtI27yEBZPequ//AUjpyLjaMjy5YFB4y8/J/Cthj6uCjF9p6OC1ImKloDZLASWf+8vPfs=
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

intel_watermark only needs the register/MMIO helper subset, not the full
libigt.so stack.

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
index 1a4e14ed3..0cc62b54d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-	'intel_watermark',
 	'intel_gem_info',
 	'intel_gvtg_test',
 	'dpcd_reg',
@@ -124,6 +123,11 @@ executable('intel_panel_fitter', 'intel_panel_fitter.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_watermark', 'intel_watermark.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

