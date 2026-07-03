Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE8C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6450D10F82D;
	Fri,  3 Jul 2026 14:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhE1a0UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E56D10E1E5
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088973; x=1814624973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DnmwLwalRceUcQlWB7o+o9c0mDCC1WNPybmwTbCDBSQ=;
 b=KhE1a0UVW0cHqIGA0xfi+TbwH/Q078EOZK14sM78CEFKYUmQzGeceaIv
 IZiJsMm3dft3vgUhq9ItYvVe4k+Xl/wmHwmVCQKIONch0Vk7Rp9SFPRjN
 EmiZ3QlXQJAcAr4uA9C57apfyOnvTIyAUuO5MFGYHrgBJ4oSkQztYLoHD
 Lr+xseBsGaAoAGEghvXG71TKuGYZkpAMUt4PN9V/j+KJKdOUMXKHAHM5a
 USxJmhdplBg9ycnzMZ5yYg28YSThUddu+YntW+IB3CEEqDhXvzELJbeM6
 B+I/fWToOzZBQE4hRvskAcV3sVJxLuA1wDVcxDGFPYYOMAxdGf6/zJPqf Q==;
X-CSE-ConnectionGUID: epuKXkYiR36OA0xwcBbJeQ==
X-CSE-MsgGUID: wc0EY1wMSNuHfHwwQNdvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264108"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:33 -0700
X-CSE-ConnectionGUID: Xsqecss7ScCsBv3uuShoAQ==
X-CSE-MsgGUID: PfeIIC14RuCNaDhGrHt+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019611"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZtVa5qG+E7SYCvGkfSk1ub+KqrA3tUt+s0J+dqCBH9cvTfEv6+8beUX9m3mf6r5dp3O460n5LBUMWdv74ieT9/wO0qtSxLiHSt4MtVWgFgCuSdIdAjQdmh4tgm7IvF2K9XedAWYZ1YbYpZUNL03naZXaq0ka6gMBOYht1KftWC5ObJ2Dh1fVkcj+EyuGuQs0H0IStdUiKCixF6Ve5cc9ABaHIa9L3As+0z552wbhLOmcEtrUmss9TdK9F4nwe99bdIoouGlw4HGFK4WBxpH2YUJLvD/it7AGcSb3zvAMN7+K0o02yKtuN1Pqd2+xLvzFGDxxreg/kyPTxVGkQ9vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al0TpxbCV+Z2grXe5cliAvD4ionD5ewI7i9nag8msfo=;
 b=F96v0iCW4c8Qo52IwgSJDGblgJUybSJQRgChuITHS8nNf2xnPz060YKVU5XsR5ruxQIAIArlhDYmbLRbGNn22x3nzMXnQGuyaeVEcFFng2/P6vBPTgaJQPftqt7kETXsp0KS+253DPiEzRNl9Pkb6eIIS6TNRl2WXHoBM49ydDuwS1j9kM+rr9QKyImq+le8C2j62TtnD6y4IjrzPkEFYb4Kgu9qpqF6AXnCZYFp7mw++arCJAHjOQ2DbWay/6PHOECs4AxsCvZiPzaueDk1xPkBMUxjRmk+7OEVSMwgwltp84yoz94vL0rPaHfRkrz9LZ74EuyjljZh3DWW/0+xGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:30 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 26/31] tools/intel_panel_fitter: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:29:00 +0200
Message-ID: <4fa96369ba17ab2d327d3fe266140180f22204b1.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b87bec-1d09-4361-05e4-08ded90f7e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 8SM7cLLwrUiiGcv5M1nOtxa4Stjcq9tIc9O62PGtYeamqf0Kf+8Fk2D31mRgMeUnB+cnDLc9B0+gMGVxjQsG9hX6WVP8kR8wEEbLGln2RG0AMoO75i4pcXRGtKA5v1GksHCiMHQCRA7m/kYnQ5KJFI4L6XjMvomXWLthGYo4JSHwxefahaBK1MGMNh5Jg521PY4qEGRuiFaz8OGHl2qonHkTQfdAFYOroxFU3+TYsLGM5zcXkyHsRtsD0xCDhuKQeyEqpPxMpUR5Q2HCke8qsvF3aBdGjdA+KbcKr6/pwuLTzhjLudIl3QiWTefABREzXmIX3JvGcMSdMmE2nih3vByLkG233GJQWLt9TXWmvw1JhSd2JUh7sa9C6yGFYrkfYeGr5ttY9OP3oKgAfw8xhywzpj6prmK9f5LrTI0gc+ZsYowLKZAxNOuyxVABmZGeKVKT3k+s1xYuTEmandzwGy+ERw9yy8UyYDk77DdD5I7YyUrCfaSn9/ox1+mcVezEDYIQRJHtzvaKrqcxPkpj08DCtDNrIUY+OiCP5vH2TSypmig6ARvOMw8cVAMaILpZNZN7WvfJWxZouDMyfohIbgumSrtSB1h5KJu95hPRedHJlSp07kX+wwnhKUJc+MWT0i+EZqBvz8P9pbvkw3P3Q7xdAxOg52g7Wr/30uj6iIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?unWSsHgcUdEsHfXgo9s9wE5P7i+oHu6yliZuJv/1n0cOMjPm2PCuNjmYIR2C?=
 =?us-ascii?Q?BOPB0AOVX+0aPTFt3hsx38E0io+4Msnb35ZSBKsld4WfMPg9r/ZpM9J1wBGT?=
 =?us-ascii?Q?/AvNqOBaNtJVcTE2o4Q19A4XyRBH4c4dG8okxNT1wpGxpFXVi5a9jlVltOse?=
 =?us-ascii?Q?7ZgGZ+5UpQVPyEjgu3RmI5QGrYzzT7iVwG6kFpP7Xy0o5V7Amy8FIIi8NIRP?=
 =?us-ascii?Q?ov1EzyCFNiFoL895IIUkQAXhsSsmEVWzaOB6o6gK18CSRfKA3DJT9PCBUYvH?=
 =?us-ascii?Q?ETJQb5jlR9rwI3SB0jLkmhV4dW9IYICmuHr3I41XEYcPUYIIejXtrIvf0V29?=
 =?us-ascii?Q?yiGt00OijB8zgj7lTPRuQRxspBHBw6SnGrBkCmOekLZBT7YngVBHzuNEeNm/?=
 =?us-ascii?Q?ewuWBwAc8Z0XcZcOb8RxtGit2Bhn9598pieXzkHO4dqi8HseGRsdl3fpe28h?=
 =?us-ascii?Q?fnnafw2+cXhZU6FhMjJ3xY1s1GCfue4uM0pxd3M5j/ZBAawq4RS949TaEziY?=
 =?us-ascii?Q?perbk9UlnjUZqo9OEVOMf+9RFY2QJXp/WdIE+mIKDza4QL5u8FZBlUUJlDuv?=
 =?us-ascii?Q?8SPhyQ5W1UsB1IycJQ9H19fIEUhAY8U4EdpqLf1YY0vPrEFfLfKs0s/vU7sr?=
 =?us-ascii?Q?GCmzo6mNied5HcmvzcTRvfIPJuOdTJmVliQA/ij+VvogphAxpjh5wRXn4XuK?=
 =?us-ascii?Q?xvR/gxkqlRdXnc9ugAlwBCTAZOXkZOW2GwIrdDsDxKW0Ilq3JLE24spCQ7tx?=
 =?us-ascii?Q?yw8J3i3AkF4ijq/LYYAf9ZOCjx3XHeAr36Tw4tlq3q4V1UVF8K+F4or+uHjU?=
 =?us-ascii?Q?wERgFTD8nFOH6y0FR7tFjHjspeu61jcMdQJQ/IG7zHG72MPPXCuacFMrFuWa?=
 =?us-ascii?Q?2qdy0WoTqW1ilFyYRmKWrmSbN4LsEKgnC80NsLdTUeZ4OUZPAnX/37CQpg+7?=
 =?us-ascii?Q?TWg42rxnPthBewUbdgQ/bFDo9GMRZHtYcD+pTW73IkiJTdFXjWxBSpU8ikVZ?=
 =?us-ascii?Q?B4b/XCikWvIKIDfRr2blNzW4Uja9QmLOV2EHkPppOt8I+SGMiti7Zk6s69lC?=
 =?us-ascii?Q?oA92t6sFqNecRN603DLv8ptndi7l9a+xAu8i61o7HgzTXgMDt5qgSBMOiCtZ?=
 =?us-ascii?Q?CXqfBvf1O77RlKBi1W1AiCFX8/tsaGpxZGmYBvH9GYqjJBmWESo8vbf04zZD?=
 =?us-ascii?Q?JIrzGpj22CyDfXDHcjusTvFYItz+oLF+tRN7DoksiMdEVqgM1L67pPVIf3tF?=
 =?us-ascii?Q?KM5/6ewKpLJVcEXsEm7Rngy3x1oNavJ0X1KROq0vpkqyq4Wg4TcJej/O0TjS?=
 =?us-ascii?Q?/k2ccE5cG15dr+2DfPPZ9jmERjfnTyCQ2FC8mY/Hiwp4BYy7I4z1yHovPeP7?=
 =?us-ascii?Q?ywCzrxSa3ujU69Z38owFAppaNE8e8/S5U9OGSHiQ2AjKKFhwzh69vBuB+mro?=
 =?us-ascii?Q?wZQiXCcqgmVIcynMNeA1aIDqV3yW3tM4f/cNEWQ8Jw8rjsxiwMKjva9/hhPT?=
 =?us-ascii?Q?WRMimIJwnrjT/Pp/wGDw6CJRBvpzS1/nEin2+HSoiLZcB36ZmBvH7wmA3vN/?=
 =?us-ascii?Q?mnlgeo5we85x/5OIW2kH7Y42wfxfQmE8VgpfFZgB1KuMbOgR4LBk3s3WSWpn?=
 =?us-ascii?Q?16iG9FV4F/068w0ux1vJvHa3SLAW5XtjlLZ8sgrc5w5PtYQfArhtD//Rab/S?=
 =?us-ascii?Q?dwD6uKXZmxu66t60zvGDjdCR3PqdoExTD9w8eDYXbqGv05bBYJyjAWjqLTwZ?=
 =?us-ascii?Q?VZUKM0IiqjDU9K52A49yHVkHOkcqbPo=3D?=
X-Exchange-RoutingPolicyChecked: TZ3r3DbjHdUSRQXaf7YmB1RyyJ0SIg07g8wg1aL3EjSjD778OFylYwtrUd+fzLhp7uSZWeX/xFtSmlZedtuGH41dDOx4mdCEzJO7oLCEDyrkM0IHDiak51SxmiJMwJmsD/b9qAhtvc2MhxBwsE8NI2deJfiBO8IR1t/fztJfWh9RkQDX4Q35S/VSto7w3JgHYgVFEoOuJJYPjNolJbHoENAf82u6rmqJr8Qox8ffROMugil1chL+KYzKzgmaAKW/ocgmoicc4OgBsTg1tXcJe1L0OfSs8kbqJaUoo8v7IO0rcuvfreOYRBCEDcGX16viDKX9kVebMNgf9w6hhs5Ctg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b87bec-1d09-4361-05e4-08ded90f7e8a
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:30.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQtLCYmQ45XTwFl/CGVZTWL8AEOFU4JPmmqEObwAl7hnzKaXCZjKbHtnI32GuwkOQn1UAob1pYfqo8MbUGzX+p327zzGz+wkyo8BkHzLpJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

