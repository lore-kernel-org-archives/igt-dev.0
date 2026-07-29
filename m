Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542A1C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0392310E390;
	Wed, 29 Jul 2026 11:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bL0FIJCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4A10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323015; x=1816859015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o/gN0YjZmB3hy7fjISMSNGztY2Xq1Fo7HzIOc1/Papo=;
 b=bL0FIJCifH0wYqF+60nEnxAL7sUxXkq+3GdIz1vLT/SshTKecE3Cd7tL
 tqLDB4p6eia9OM+wItZigkkpCO9CpAIpU3DVzpkgF33SZBZSvb3CCgefL
 xaqsHJe8eVHeUKLkdPGLufCx/LnkymecWOCbsxfQtz4YeEEybVcEz993z
 JrlrF5UPVCewK19ZmAVKCtgy2DGIZkP/PwYPxgcNALFfTEncRv6NYcvkS
 NFmFhxA3EIFqEvjgr23N0dcxywtvHcxQqTdT8r+9K4l/uF04i815dJCsX
 p67o0WiZYKC34ELQolbuUB2wtx2joI5ALghgEcPlXoB/ytq+vBoMhq5vZ A==;
X-CSE-ConnectionGUID: R9HFtIhZSdiPKwo/XG9niQ==
X-CSE-MsgGUID: ZZtUeyQUR9OLYYhfbCkobQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743511"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743511"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
X-CSE-ConnectionGUID: OfO5YsmmSq2fY+sOdt+ZEw==
X-CSE-MsgGUID: /Wwc0UpbQlWN345KOCw8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mhcy3HpkWHwfVN+ZcGQlQ+Rg5etax8qRkw4BjvQ5JSrkSkhvDe/EtyKpH70TTv08q7zlpeKvYsodB9HIae8JFi6yl2LqyOSiFnR8jetDU8Uj9Hw1dLxa4YgjJDNsndfkA7cUoF+Lm+G4KRlueBMy1yZR6a5+h1qquQs7rKmnMdoRtbbsYMyms2bptFUveT6xfHuT9h/7kqyagpapqOM5x+asrSbDEN2EVv5QO4d3rbeTkZnxtgcEuU9lK3dE0+xPEKUcWrOJyKwGgzUFFnml+khnu4sOdFmsFgo1jcBag093ri8m/Dy1GA4s2WAqcR6bsa8C6+ANoGKfdJimSR3d3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEL5FQ3z+tyZCQQZjEFDAPbCx5GLK6B6Ei9eFwCRPJA=;
 b=DrPrd2j6Ecak0geYboLMC5K3gQ5fMr5NHOdXcsRz/vqR/rumjQH9ospKW/fxPa4NGlMNS7/mDSvfVsgETtXRPnYQUpURIhOG086w7hwn+lcYCFmnF5IvwMVHoblUamdS9GuAC4wydzTuoGrd/sByQ3JSXtXaztiBdfhkg3xYIfknHapPUrtdokw8TCshd1ruVbsQpW8+3vOebyXbJ0vnd91Lg5LoYB86i0TnHWNnNLkOa0bk3qr52SM65S2pnNDF6S+7AlgFnSs9ebMfnjp4SEG7HeFPi/+83vZcpS4vy8Rtu1nLcaNGuqhCEqz8OjLdsPNOB4luWTs1tG9NPIbHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 21/31] tools/intel_gpu_time: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:38 +0200
Message-ID: <921cd9f91004035a577333556340c10662798329.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 559f1c30-de3d-4ad4-f44b-08deed6105d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Kkc1QXbpUGOJKmN+hyrf/nSpOqk5wj7RgXjgDMS1A9VSUoqU9qOnGO52zRpoqOdyGJal3Dnd/n58mwoTNk5xdRGt99IoUwJ8oQV+J0ETmkuRpnil4700TBMDzf2cPP1j2yANhDnAVwdoMMpkx05v04JZ/cEJx69v4/r2SRucJYYPSgXbGwawqDglhnzH5mLyXKpkacAaN5D1C4Rn1dgiqRpj6L4Ehl3DCSAF4uUyhUITzeIFMcJshSSbMcFUks1F/zOYSQB3nQxr3Y4tr5j+6pQwCHnuz1OfIT2y43cAOFCG53lu08Owl2kYLh+6x6B9dwRwEIcSqFGJdkk3R0qVvF8h0rPE2g+y7Jh18SfrA09+V9Axwk4SMa/bxN6GabFe241guj//4ID8eDOEOlfQDKqN+/vKOOaKbrjzCY6Wn0EU600HACUS73lOqKD64m7wIMWG64jbCXqTSQqeaQC513k2SZxofpe9VIvVoFHD6ASW3wTTfnFvj0gI89D5FEVCPnk2AZMSpSZjzwTB8j0/1iGfBWXiUTDiXOCT8olIb5w6CVYi6A8rhlqMO/+rl3T8D002bmyjUtl13WiEfiHuiNeaMevKUO8KHcrTLnQzgoYfwlP4YVgz1wvwSLRuaDYxGSCQgrOX+4BxrKNFgAOkrjrR10NOljqzR0cUpCA8KLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fv9zElC/oVY3kTO5y7NU2sBjlTNLoqOwBXYjR18BfGZTDQfC+//agv76+Apl?=
 =?us-ascii?Q?8lQVVKAUx7W2UpXLdWHUt6gR7TXSj2uIqn0YlUi47NgxxTvBQVR0DqzuIRuM?=
 =?us-ascii?Q?DsRTzgWzOMSF4glPaksZERmpMskRufELQuV2hl0yw3/bimpprtJnKo7qUU4G?=
 =?us-ascii?Q?nDgPLS3k3qSW/R2tJ8FnLmj9wpHEovfL9ucocDgJMF8pHsw92C9bl94g7Uvz?=
 =?us-ascii?Q?M0joOtTkMJUtE81WYOzS49mDvLw8gqEseGUXjmZPONcsHWx2uhN4qiibMLcj?=
 =?us-ascii?Q?ji67L0+MEe5ncOrYVewHUeT6+FAEekIhyNGGQWNW6MgE80W3YYIDH12uL94r?=
 =?us-ascii?Q?sldvG9ZBzSvrPrD2FiQMtv+jdr8bY/uEVihJRN0+UIZ12GKI8+PJbY2ppKnF?=
 =?us-ascii?Q?whSoItY1od3RnqfEZDyuVtATUAqElJLD1d2YwpJDX2DA7zGk7mfnd71qIhOU?=
 =?us-ascii?Q?HHdKyBSH/hZIY4b35Xu2LKO18hvnSoeTD3cjChbDWtzVI7q6Ux55gcrpQy3n?=
 =?us-ascii?Q?dXe3Ak0WtHoX7boI+DDfS2J3hJV+N/5+zfiI9Py7Cqy+zvLmBctxME2cvYTe?=
 =?us-ascii?Q?nH/nwELYRKhe6eV2S0ByvHI9sLhDdfn6eF+XsPd2rCXlqgt4isQgEaN+mYuY?=
 =?us-ascii?Q?ERibcZCWt9c3qWgfFhvxNxlLpaw60BPihbOcTllus0DgIiypWrC7dKdaPd5Z?=
 =?us-ascii?Q?+HhdIDeDeilbqeRq6ZeHETI+rUwZxx6VoyPnP6vlg0jQ+xldwpRrDLhYdMTG?=
 =?us-ascii?Q?O3h0o6BVmCGSieZDpOfpifcQH8rQ5RNRmpoSrJyLO4GHMO2m5epPxxRLCPen?=
 =?us-ascii?Q?X+AX9EwSBxXkEK77T96b8HT/rY6MzfkCWyOmadyENxB3M4E0jUpf5giht0c3?=
 =?us-ascii?Q?2C7G0xas1L/axdrRvR6caNga2tzfs5sklHrir7t6zME9sq5zTCu5My+5upH0?=
 =?us-ascii?Q?W2ln7B+PfdQ5YAKVopXlD+1z91yPsGSssIyuN23F4q/0NDd1rcv5L06IDl6q?=
 =?us-ascii?Q?FPif6byD/CAOfJ7iStHb1n45I89GHpg1oclC2tc/3NkmRqzmSwPllZD+rqJo?=
 =?us-ascii?Q?0puggB1eYAu7x9UZTR2sxgamDdUw+y7elTPfZs/T0FTQPN8hYWJzAmFWDv+1?=
 =?us-ascii?Q?42yDIu3W19QPctsPKx8eG+KY/J5yFDbNKaIERKQEn2XeI0wPZPvih7AgqvnK?=
 =?us-ascii?Q?pZN8igRSQDVvviZLOchBFjUMoaNCNIwsCUqRI2niH8t+pR2jWXul70ZqCopz?=
 =?us-ascii?Q?/ZSrDC2zI/FIkjX7Q4pEb1L5OryW0qMCg+OBAeZWu3Lgb8zUqHDxfMnk/Q9V?=
 =?us-ascii?Q?a4U5lZzxEjKmOlP6OtWBSa4Ght29qWtuXD1GApKAZIvZ2c9vVA9vcyy9FkFs?=
 =?us-ascii?Q?U5CPCvq4U84qY/lKDNOXX6aNbbNUk4pnhu7GY6QGfbK7EWBveAD92ONw0x00?=
 =?us-ascii?Q?YWYyBu0SkT5knuovzQEwcOxN155Jr7crCCrNHhVeIYIzfP0qf/KsA8G13P6C?=
 =?us-ascii?Q?uPGptSFhJ9oeZyA3iJkMOw7HAr6lbM67LP41V9MTDnvs/CcR6YOXM0UTc/6g?=
 =?us-ascii?Q?vG1CRUBfEx3UYDOmfNv2JDU88GExivvyveMC7KDUj8OUdAMO2F5q/zbfqmcj?=
 =?us-ascii?Q?id6JZmYkDNYi83roRlDsUAc5KqKdpin0kbBw6aBLWHJs6mWu2iwsE5+ex6ts?=
 =?us-ascii?Q?srARRWQTsT5x4Ozr2fwYXE8j3nrvPNhQyBeU2W8D/LBb5iHwoHNrowgg7QY5?=
 =?us-ascii?Q?VK1WnLB40ZwG+l1z4I/Hkxa6A3JRmS8=3D?=
X-Exchange-RoutingPolicyChecked: kuFD6qGIND7ogVYD+F+3gp91o+bDzIjDVHjQCt5bfFWVY6F70ie9SkbNJ0rhT/3+gO4qdjubYo0cHP9HtWd+CyImBUmn3T/N/t0WqSuK3fL3n7xPi6WZ7JxxvAp56rcGf2OT9K61oo+mFmiaDhqk74xSqt2dWDI2xARbuk1ZjGDQpiGRGSb5+qnwEJVcsW2PSGDPxvkjmmD0ivbMJL2m9xhoAcQ417/sOZAJLOx6TChnGc4U5/tOk4+Jdy+47Q4P3vtOiPFrLxFSG+0yPNAnSL/0h1Njc1kx1C9adG2oPrVhP3GuyC1K69ef5Ub2Qt5ffBgFwhgm1O4UsCZPC7XBZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 559f1c30-de3d-4ad4-f44b-08deed6105d7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:30.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjz7igQRQz6nt7NVs5CgC1+3ec6Q+y/kNRx/ald0m+BYjliaUJA/ziYwyGRnjGylswhiHEahCtUeTKShwvcKSxbtqTqTHwVpmFGNEEAx7n4=
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

intel_gpu_time only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0978f8f11..2e8ceea36 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
-	'intel_gpu_time',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_time', 'intel_gpu_time.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

