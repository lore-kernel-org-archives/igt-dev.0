Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98433C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C08D10E60D;
	Fri,  3 Jul 2026 14:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7g1iHfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1192810F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088950; x=1814624950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/bC1SZcLhNWFOrqQogxtxlCenn8bDN8GBKuDLZPCJGw=;
 b=R7g1iHfxZmThqMUC6gmaUaOK/nBnDybufCtMC08I2POqnSSV4TAOth/Q
 NK6Ft4P36ImbJQkro6cXjW0G43aZGHXjHKodq8T0Dq8YbJfXCn6apVfTu
 DK1KZczVgFx15ypxOIUNRDYY34IusUU1+6fsX6F6vuzQCqfZPruVz0HJP
 ygNJy8cP06k654CS2rnHHNNHCYFvg3S79Zo+CJyLibhpsMSSuMDttj5FM
 zgUyaXYkZHooUEioU1Q6gkFWcRYHiUqUw3kqGJPGX+qyk8fFn+xp5YLCA
 jUGQzrvpxPW2I+gXJ7uxsOO05uzIHvG8CU50yBjIchiPAaNeNtdtC3qgb Q==;
X-CSE-ConnectionGUID: 4nx+PiqwT1q93toz0KcANQ==
X-CSE-MsgGUID: DwtC0YA+T6aP3Etn63UZEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264070"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:10 -0700
X-CSE-ConnectionGUID: 70cdIk9kQPeFtNFTIzqduw==
X-CSE-MsgGUID: dc3iNz75SNmnlMv5C2H8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2p3OrLtgb1p0ftpYv2Sy58A4W2ugNtcvj9piocsB0sbKeiNa7pmrIYcG1N44NYy8RL9FgpEm3SzC2gTrNhIfZfP67a7qfOcXFhDb2pCUUb/AMETPn58fROEy2VcaMTR7UixIOcEbQL7pMUt7MH+2V52Sw5igO31Qa2qxJ7FFMx06bDLIiTZTPNfc5ixDDosBouTX5QN9+i7xtCTNCrVBOUb2MuDBoQGRxuYMzFcwpMzuMnox+SS4lxhiJMUtNYOUUboBaxwgPV1YvhN6dvy8YmQmEJcN1SLgmeWx4mOVSsfKiRL5p4c0M/TgH63YwRwhoRgrRWUSB0mcSXHw/IxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSUGfolCn2+ym6ZiHeqZIYlIU4WuBabW+IbXDAGXnws=;
 b=Fmca/IHpHky8vGRIuZDdFdU2Chava5jclNoF1ZDLVr5bW+k6WvQsA/2M2hZ6xftGsFebnVwcvg8kcWjAqHxk+uMr56iziUdjvRH7i+rlRWDkXlWzm/F5tdvyBnneNsrmIWCfKpF4iMjQYPQKnur5/4TnBBgV4JRAxKT+k1YugS9HHsAc/qBvf3cpydVOGp21AMC2XmZSXVqTYJHItFcHEc7YzoQnQxl9Cte8GrZW1Ve3iZNBlAnPFGgZkPQgoOEeFI+PiwTWZ7O5Kl9SG8yr0u/RPGnv5Vj+IWsA2ADmodR0YxFOSYyRzZk5oHoPeD18t5AGi+1B6fioTXcC0GmZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:07 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 15/31] tools/intel_gtt: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:49 +0200
Message-ID: <00b19508050764d5aebe64bceb7272868967e106.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: fb9286b5-5056-4243-893e-08ded90f70c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fCSmIqTGQU7DnnSgczSLN4dm8kmE2JN6IJvlt48NEBwKnbCGi6eL9g3GlIEHMmr3agdWpcGA8hSmL8Dnt0ATtPm6msVK6s8e/M1Uf9NvnP346/9JhW5wqCnxtu2eEslvIOc1azz927yjJLNTiKrvETOau/xnqNirKA/2US6CAg/Ak903/hU012lWNYYX/d+9fYCp6qAlqlgjP79sqPZW8SQCSm4k6BB/npPjlzBD3Njb0wENZ6p/qg8xGSndjF5EgU0HHncxpm2f0xZ4S1//OHloJsvbDce06RkzVHJzsJZO6YRr6EaJhxUHRme/2VQaRAMTepFG9eSXSYDQ8LwECPWtCqpv7ZJv0tCZCvYqHC4BKMXrtgHI1t+fe6o54B5JiK/j+Iil3WJl/LZ9QQ34fW03gu1O0YCQsmRrk3fjddscwU5F3U2r3qzqEDNpp0tWk4Nc1gmFNgSUaLwoebXC+Zd7Avoe0btAQMvHafX8jy1z6y7mpoNpeEDz6WIwdzl3n4c8O4hYC/F9DN28p9HQnOG4qmFZ04dHG6wAVWgXbn2SowJXk4ednJb+SfdVPUSubz5+hkksALXwAUIo6lz/X97NXSXRHCEMm7p6jG4XN1TqKmuSFJ9U7mFnSwb6Z6my4NpYIkjQwZ/arSwHuzlWKDmPu1qf5jnPHaxs8NqibDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XRL4DJYBJ+1xpQXlzVL1YpzuyNkfZiPh9/9rnamnJiBoWeBBO11/f8IYcrd5?=
 =?us-ascii?Q?6QtggOfLfaWWTHn0kchAlpN9fn+mO3GW0oNbrXzGSDtat5uL+H3iybR4mSYe?=
 =?us-ascii?Q?xSnlMhhv4mha0dkxrJrr7Fsta3ek5OAdSJH/tph71avTOeg0vFUqMYOHhNVj?=
 =?us-ascii?Q?GnMag92z6jyFEz88iLBdMGdj9o5pLB8F2gXPp+HxAkk+LYnigoJhCPXtyqQS?=
 =?us-ascii?Q?WgRU0vUQ24mPbgPAF+ubWarulUUWAl8Sc6usBhiqJF/cbfzxgmhuAabeTn2+?=
 =?us-ascii?Q?71zs/DTMzX3aN/p7Qvp/xha7FgF7149321QFQD/QMQ2bhYvWKrGXTkqFIcjF?=
 =?us-ascii?Q?bIiRFBmKbUMF/FrLqnvXHMRvEeiCGxLbG+MRBgaRyipLM+55/DYZNaB403zy?=
 =?us-ascii?Q?0v8FqEh6MQmzI5gpT2c1RT06IB75QHEuo+LNEXmgidz9+IrFTbi5zYOWIxg7?=
 =?us-ascii?Q?seMm7f7wKHEmmUfGpGDTLqEUKtAgj6ftL6Sbrn88qhtaYMWuTYc88F+7VRbB?=
 =?us-ascii?Q?EgyWC1kM019FmLaawwzhe5D7u5xraQRnA0k6C64BGMIy4I9SXhvkVdI+wtAr?=
 =?us-ascii?Q?Hz4I+t5celwRzF5z7RPgr2BVgVAdq4CQZ2zacAoaRiArFgrIcB2pRVY1putM?=
 =?us-ascii?Q?UIp5GKwTVMUD9srJQx5KOHR6lRr+a9u1y3FxPZ39KS6UMNvif/BfPU0puXK9?=
 =?us-ascii?Q?mBD9h7xIhn4cqgtDMHkD0O96iCknvXZz2akmqByN4plBT97vx/j9zx6QKyiS?=
 =?us-ascii?Q?O8YrNluEQBoZtAe5kGoc5LnNRiDpI3ugPvB2+GArRgK1y1HFHpm+/4DRTwAz?=
 =?us-ascii?Q?ldDONElDt3YAam1y0FutaZfupB/DIpjxTQpmvRdh6zs2esvWX4fdV21Pn6du?=
 =?us-ascii?Q?UWUr/T1X6bT/KsHqaTmMTSfdmK6hTB4/jnk8duSywxUhqSlzJtwfs5lw1vQA?=
 =?us-ascii?Q?2ukfdmdPzkjwNFy0SOCiCG3fXjfgseL+b2HrzzxRLLZRniSk+MCA/YzqCK5b?=
 =?us-ascii?Q?JQOR14y9VHDOaoct20zzVTyQJbG4VTYekq+ZKnPHA/ev3VEtX7/QD289LQOS?=
 =?us-ascii?Q?MJbrW/jrqSXJe670608Q0gd7AVbdnQPipBJ/MMeO8txTeSnWMw4+22DlNLCC?=
 =?us-ascii?Q?weh2RaEkNxcANcB+kB0c0RHIshKAZoA+Sn9Sa+pdzjt/WP7Q6zrXhsq5jKZJ?=
 =?us-ascii?Q?vlo0wjHakBz7lk1HHUp/vRlOeTVwMYF36XTFFEzr1EjDLMFk8dkhQb1gcp22?=
 =?us-ascii?Q?NUNvrB5spgZE5Hpwt3xOvbY7h/x/aQmjdOHt2MdZJtmeEQ6QE5XdyScuyNbN?=
 =?us-ascii?Q?Vu7/SYcGTyP74vAUvsWYqfWOSyq3QlU2STlzWV92782Vvckfc2yG+F7SiTNx?=
 =?us-ascii?Q?sBZAEqTpT4S7Jw32IZLwBIkFD08BreHJizywJ3R7u7CZCfYf+XzPB4kYRgip?=
 =?us-ascii?Q?Ofnwbv8RWFbEeS6NoO5RkHu3li1XJahpJfRmmoKaAyFGHizgSs6g+kNeZfjn?=
 =?us-ascii?Q?s1GbruVzJZPz9T/QWfwWUNBsXrka6WtXAFfCdzSI3tLsH9e1jPu/DKdrigRo?=
 =?us-ascii?Q?gk320uO8soIseohsnfKVGg85tFxLavRbAHsuz/Pc7av8kE1WN9Cvp9yJ989O?=
 =?us-ascii?Q?CvZsAodRKTSjyXCo46D7tNTZH0nDcsOrrHi/5tZhpd9Mnlks1FaifxDiYbWP?=
 =?us-ascii?Q?NX79zOvulE3jSTk73lXADebC2/S9w1pnh/ZJXlmNuhWw6KPcD7+HajZAtPIM?=
 =?us-ascii?Q?in2j1kHao7PvrLAroL9uowPo1jzoMu4=3D?=
X-Exchange-RoutingPolicyChecked: gkoG0/y6dBVpdSX6IxO2K235vxe5FddvcX8O+7Yp+JbEDaOJWkRkoUXpEmQSaluVUVee47FUD50XohEg3nX7aFPvZqZAgXB7dnGWzlyvVGJiCgADZjHUPdHI1I9FCtFC+CsQNs/8fv5JrhWf4UrqjACDYHRHZp6PDz523sLHNFJAL7rfoENC77vDb4owYgOab80dmbCFZMvzCeTXXrnjwdxlIEoDmk189jBl/4f+dJ5+VxvnczJsQPQcaQTSjpA5BjVx3FprMNUywjxgZWFPXkiIq41ryZcCiECegC6dB+A/fvFaLm9mvhXBJY8qEwyEhdPHYeuCEUBxT0bHyzQfYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9286b5-5056-4243-893e-08ded90f70c0
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:07.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tRkwNoS+6CdDtM2EYZU3bmWtDROGdOGnMK8AV1mwOMoV+ReB5IxQI2e7cbPwZZwFYKm9FRnhRaGwTmhB59QPzEJb9PZWIFGt5qge1xph68=
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

intel_gtt only needs the chipset helpers plus the small tool stubs they
rely on. The full libigt.so dependency chain is unnecessary.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
lib_igt_drm_stub, pciaccess and libdrm.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8eb346321..a3fef87a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
-	'intel_gtt',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -75,6 +74,12 @@ executable('intel_stepping', 'intel_stepping.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gtt', 'intel_gtt.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

