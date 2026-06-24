Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD31CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1553B10EE25;
	Wed, 24 Jun 2026 08:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0vXQsG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4400010E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290890; x=1813826890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P3Cvq8baSUvTzRaGfbjLunLkDHUZEKqY0fuE5jTNkXo=;
 b=X0vXQsG3WfZpX646lV/huXW6H/I+OyMVKrK9x5InYCIR38sMxmQVBKLl
 8FDUJZdo1BAXhtchb+uKcsKI2KUDNeRzvlBj3Ms/Jcfqda44LVidhFjUc
 Vyuv2wNGe/kzTriIuBjTS72BHOURvPAdOi5OLsLmOhuEKbZ9aOVtNjnH+
 CnFjGmbYGGrQ9ooVDVBruyUuWRHwVRDGIwOp0o3uvSkifhobuRhHzZyf6
 KQ84etqiKi/CIwu1Hf7CsYYYg4ee9MjbR2OGhz51nNj98FUor7TZNN4DK
 8FRGhLbJky/bfzovaNez8p1HBfl11b2pIXCXU5qjQhOg4kQy9OhaOLa1R A==;
X-CSE-ConnectionGUID: mbPiOR9BRgKtYMHprjP4Iw==
X-CSE-MsgGUID: j1EsgOVuSb+M2bfg3J5oow==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142325"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:10 -0700
X-CSE-ConnectionGUID: HX+a8AA+TUGb53+Qrm1SHA==
X-CSE-MsgGUID: dX1sjoB9SKO5jaG+6kJpHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865380"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2t9U5S0vnO2aZPEmoDQHiUfbDslum5UjGn/nGFdEO8cghF9tKPj6sE8U53jvwWmLJ37msGs1nu/50hq7wo7y/TjcGR7iRXHkiKVavJjij32dEKoPRtiJe6/dt7J0vVxB61SbhADIh32Oi3cquG7GBLS2koJaZHipcUbfpaWuvIIY0bNui1uQPNEZhs+6TWTJGJaQMRhU3mM2WiSDS6XbLoh03QhWPJ6pWuPB7sgTOxSFgHAPRRsaLL9umi1f2Q9pe9YtWEreF7ai2/AdJgAUoeBzLYEr72ImlGuJqsTD3eNDGjNSRmgR6q+r2Yq4HcMEYujUIPB3mvnhICpag9Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9/dygqY1M9Ea0Ol8m3g0wkvj62Ve4lg+NhSuKT+0MU=;
 b=GcZEwhssoO8Z2nOhaJIoI0aq4VcBYp2FSq093UWge+MaVMWwDS6K5ansM/7kRyHDKknoEZSBtA8b+rKtwl+8vyCYw1kjK4xqeYTCcphScp1xz8UrFvn3YfwKgALRIGkijJFSCiYOk0DfymtRxe/20KPwL8Z41Ab+EIJ53kySG+n36ZZhgHaNTSSU0L8v/vZRsvfj1AeNjO8Ot2QiYYj51dsagSa/xTrEgGTyA0x9kecA81NEin/6xRNBghm4SiEhh9WaT63KRYctCtrfPq59zK3xp9Xp1GXYcKCWwPcZvi0S6cpFf18NBb5yRluHUcdz64d8qX9ZKrFGF/2LFDwSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:07 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:06 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 21/25] tools: intel_panel_fitter: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:28 +0200
Message-ID: <8251397668f06f5c9e75bae4bea544eb0632fd6c.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8d86f1-fbbc-4948-6319-08ded1cd4f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5GbGRaEzuZakHzldZzNThxhgDAtOqpW2iM0WjOMT7pFsXTSZadZ96QlCysyOBVUDVB0YxvCYNG3Jz8rNvPaIoI4rou1bfpzCw1cz0k11aqU3SnKaPHqkXW47JjhbqV4r02F5G8K5b41P5RuTJkLsaa2he7s0a94L2IPCiGayqhuwiLEX/fYYKeSUWqxnsGPxIXIoUr/W9N5QG/m+xgsZ+w2NL6lW8v3Bz5/8VkQIEIkDJE6PNHSeYBgrxn0czIZyXnn6BPBO/ZsaGMt8binmdOvO0Z+wrpBUQnJLYYy/OXPZNcn5NbJhlW8kzXf0k8uNBxeQW9LqINO5Lu3ysdmnjMZAygdeV0bHByUwHP0zE9/fEExO+YLm7oF5mXXu/KBwWmDkZ5tP7ceId8gI8NzM7p8ut0Ol79234g8dygSgT4sXJBwHhBNFhegLIlbnuKlrW49ukiB5qaK+qfu7bI14cEOIaLIzgRxWTi6C7EuKpooTjATiPT19wV8Tw40FNYer7xrj4G3bahkLhn9DVbHZhGoe2ZgCQlc7i80nBXkpdT2D/QdaiEGA+GH6q2QiO+fYPrmshgYIPm8enRwowHxJnVeXek8vo1X6kS/xmuJ8awUSKHxYkfl95th0gwvaxEhal86tJ2e3ItNPCHOyabFARUWNry+s+VuBOgl/cOwT3n0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ew9wBz5DTJ78ztMLTmx76g6OovcSZbw66oGOq8bUPPzdtz+SWTlYb9dBPgBV?=
 =?us-ascii?Q?vypar1+qeBcCrP4vOapLvy0n3VTPX8IqfOq1laAJBfTePTyLkIlyIX3gsM83?=
 =?us-ascii?Q?9NeqSbCwLmKnALxHkalWMnE2rbKiF3vHONrktKl2ebM4HvI+XJJe7qtDSYXi?=
 =?us-ascii?Q?fWQnt2/hTC7bTBUknm1Z4LWSP1T7kIgI1bI2jYBWm/YzGqcxsLZRUEoHBpk9?=
 =?us-ascii?Q?sKuDxp3EI8N15goLHpC8d13ungy/0SuX9YpCYS7SOr0gfq8cHRBx2hNx96mI?=
 =?us-ascii?Q?SZWRSMoWUjAf8mxy5NiQCKI30jLJ1ZRn3dKOPgCT7zsg+Lqgf4icsUGpreXA?=
 =?us-ascii?Q?BzXFENZDtxOymZylaewdumxaGkR9DzOvVP3kyUQ+XqiPdRyVDujID+AWt1fw?=
 =?us-ascii?Q?uhpWp/DRi+4YJhJ+9rGLFROyHAsPfsn6tjynwbB9OxV5raQcuXhH5Uy8pKNW?=
 =?us-ascii?Q?ev/itGTXWcV2GlaFtEP7Zuwgu56630OMA0D1cbWSEd0Z9neVi/XwNuHoVkDy?=
 =?us-ascii?Q?VZTR3tHbmLFgTdfDSV7jZUgMFCm33dZL1vz2mQXUhd8i1K82LTB7Z9gMMGPR?=
 =?us-ascii?Q?WYp7DCczYyZlgKkGyb5PWRTUd/3u+R5dKuP6urr+yl0Z/vBe0h6S0W9HAQAp?=
 =?us-ascii?Q?6UUMRQ/Cs3vq91Mnq8bQfqXHsUgN5wtkFZMYsH0UA5lDssBAXmhBIfKsGfYK?=
 =?us-ascii?Q?VUUL3aG8/6riTT1DpzkeDvKyWN4lQR2xYAhjuDt4bqwrjdrl13oPg6Iiox52?=
 =?us-ascii?Q?6DkWz0035tT0feSy9m7Sq2aoWXnUF/mNZw7TwEn0jy6t428G+OnlffEYQU2e?=
 =?us-ascii?Q?JVgXDnJxS8JvD/QfKzGkHmoHHx84OCIJiM9HxcUr2hDSUIitKZukhFLQAwcd?=
 =?us-ascii?Q?+eaFnIScWzfDlL5W+/HGIWzp7SJVR+Vm+sGC47RlGgBfpNkIzW6RTTK0vOIL?=
 =?us-ascii?Q?l8KcyggpRsivFnRBoxlYa6FoZerlDkd4+2i+p3A0xSmCm/S1mIOrkGPCMole?=
 =?us-ascii?Q?XJmrTWvc2ElaLYA20zyMTLofxeErdPCVHNwMVecOQPDt4wHO5D7vMkWYzJt8?=
 =?us-ascii?Q?1jS1CkPiFcsoHR16BpFnEi+dHE34sFSMDiSi1IwoGHIOKxWB93umTd18AFR+?=
 =?us-ascii?Q?5VN3dulzB/kHpohQXGHl6ui3HengjJd0v0qjECRrzTW7drqd8z3xnSakzX+4?=
 =?us-ascii?Q?iKhNSniaa7Az2wvmGBX45sG/I6W7/Puki+Pnl89FS6/v3HbbnnirojlGI1TY?=
 =?us-ascii?Q?BLpXgra8pMa9QzUZSH6TLrxh9E3lrEI0KE7xfYvbqtmy/1lAfTNzRsj7vpmT?=
 =?us-ascii?Q?xecr/eO4xft3VrhAlNVlPC6qlQaltczq5daYgsta5jZoD/JwbVoeIzhc43kZ?=
 =?us-ascii?Q?jjoe4WFxavdI8lkxYr3OGj98FqJnxz6cBDN+dWJZrpB1+lpDwyhWGzds3JAR?=
 =?us-ascii?Q?NHn1Z0/PYIYR00OCBdvLq0g/f205rDNJurftyiOcA7oA4a/Z/RdiXst4OMj9?=
 =?us-ascii?Q?9efvpSNqV+SRHogn77PRS0T4lABnBS76yV7KFPbOK6Zg4MScAXGrYEfQ/8CF?=
 =?us-ascii?Q?IFZcY+HwAX3Qu/BD5UtiyWn8Yv0w/HBKdyHnj2OQqfiCNHjalEW+iq+LqhgR?=
 =?us-ascii?Q?blkRhD6fuvUxodosuisze5CAjMnMqHOLQpmLTDlGF/1sYmbGa/xmBHzRpEwW?=
 =?us-ascii?Q?92quqNo4PFSwoEHWtBqthGFGxu9G7SBabigvIpl+bqNsrUGlrry/Evn1NHiL?=
 =?us-ascii?Q?KIT1rhEzz69rke9DSWSiq09ub0Vniho=3D?=
X-Exchange-RoutingPolicyChecked: BKh4IAqdFfsNbrdSslSK8bX0oHCf3Z2X5i3VOZjeNtVDACZvuLh++ndg/pTiM/+0r+8t29NHePLae/4GdFgVBImNUXw7kbqGMRnovxPoDLGqsq2BfdCbyL3E6i5zlvBgIs12PO1ru7NFGoLDpV4xdqwyNxXdUo6EKPlG500DkwCoHg43nBYOYjZoTNJlGUtJQVhch4tt5cYHLdTyZADedMt0YH4EoN+HTiHSLp2uZJgcTE4LjmYrwYQC/TcFMN3HyPFw0UyOe34aeLE0CJ68gPavK3RpBdXP7ybX4bFsu48f3e/xklijqhQTWjCLq6S26HX0qDS7Eu9/pL7NVkNzPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8d86f1-fbbc-4948-6319-08ded1cd4f91
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:06.9083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I//Qq2PWSg2WqMot6OyYTGCN6cBLJ+d5ISe7NAl5Cva5Wx8KyN7pkDLfALjaZlv5OowEZQMPekwlA4yHYai0QybhcqQCrFZK2coO8DnwW/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8f0537f14..19d0ef754 100644
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

