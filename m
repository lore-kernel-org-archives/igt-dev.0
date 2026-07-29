Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BABC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001DF10E64E;
	Wed, 29 Jul 2026 11:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5k3dZux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B3910E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323037; x=1816859037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/TpzSrzG1yJGP4Ut9chEnnzBpk6NUMOl/sDsOCNBdp8=;
 b=H5k3dZuxGOBTioz6GvPJqRbeA8J0mpVd/lK1N7g7raWwZMUwtNwxxX2Y
 qC8HFYmrEBdwYUhw3k3XiwBThVep1ONm58Tv1+LkI8JQ7v8xFM0kNujk6
 tvrgmB1ONxESZcjm8Xe2BIeUbTpNyTAj64XRTxIPlJln9I24nTRz+VZdd
 MQPiwEHVGuAsRuIf/DE9SrO7gNNdMIrm5H3jnIwZePlXqyqr9AHzDGYP+
 N0JSq4OQ+ndG+GOHfLMUTdR8Rv/MErw2kMVwyK0e6eI4eIjV+PkXJxJJj
 NPg+bPpwGTQGGHW80cNoh8OVqw1dxQnPBbS6xkqUs5sEZHuQbDfqR4Ebn g==;
X-CSE-ConnectionGUID: tklwfz1TSOeFCiB+Rf1V4w==
X-CSE-MsgGUID: 9hUX1VQaSG2wZXI3U0Iw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797642"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:57 -0700
X-CSE-ConnectionGUID: QaLDKiNHSZq2GMmQOxHmyw==
X-CSE-MsgGUID: TfN2MiZkSWur+iU6hz7F/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264232"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:48 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaf6V/7WUcCgJaPtkxW5Pqkz5UaOk6LJqiuGMprb5THz/j9/Ssw9cEt5qF7ikPSSLFaL0BLnYb9S42ipQebm23fKmS54Ptz8N09pzJipVJi4aOgPC/9+G3GTgA+6xSdgNE8HvS8V69qOtiiDV0DHD1gS9VO/v+VQGKGn2/Y4RNeHWVvPLhndBXAKlcG9hDyF/Cmt+oMtNBc/xiPdqDjf2uT2TI6xPSx3L6+Ik//Xj3/MgiVmznnu4w6+aEvCdQv5bVfxnEVnTHJqQHn68hpwBl5gyd8MpCWEBCIQGLZ+Ar/BviK7VpzvSC8IaKneV/o+iBXi5KVM/rYeF+q8H/3edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1JVHF68To9LpF+zhlXq1dRLjGdjXXGx728LTFQTsMo=;
 b=hlpHEBXdOxpM5WCr9thEtV9j46aBWAZB8bOWnNLCZ2WSr8Ele7FoOTWky95ET27kgs6FeuU27S/89bbqMnkyj7JfLP6iXH6O+WL362x8wEavzvwWyDh+Yb/EFi9NhGCrgkvTmLnXDMQqXZofP6mE++tXI92jul9F0lGwiYS7Q5Amqw39tFI5+fusEU5WlwuatsqQfBhcVcrCNm5PmrfwoZSfioT7iazi9+v+6PZQaU6DKb7Gs5Mf9qypN0rw3uRV+12Ppp++j7vl4+JU11NiC7wbHJxR05QGvxNr+BRNlxjVIAS/K9ZYPc7KaAIC5E0Kiv5Q2EtjqFc6iOkp9OLqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:45 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:45 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 28/31] tools/intel_display_poller: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:45 +0200
Message-ID: <81a0dc9fb4ec27348f339e0a448ad0ba26ce4901.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 39405dfb-4916-497a-eba1-08deed610ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8sLsCp1hPSwItUgURpxsXBICjPHw2zSDWJZeHMJWA6dPuUNMyhqLaklGT2FctAMaX7DmjtFIMvHcmLKqNME1pGUENJu86c4YrVHucliqqVcGl1qQdECER4hVpWzXXbPmM7z338od9Bk8olgXlWMF0TTl6YOAAcrZBfDnd7E2ZbB+QeLUt7Ah38MInbcCJE6X7kfFBm3w4oozbKFLySY8k85JNBIOow7LbAa1otIvoKpuYFclRc9cwhW9lpymt4tEqSvJeNGhNuIO+vbpDYNtAkHDsC1VyIRIN2pR4gXDLsepPyxBkBiwdBZkvleKf29vk12jVfzeYCSA218wyPdxXj0pHJp7K+0qWVxRx4PmU029tbeyQtHygWCpDE+k2sJcIgOjnL28rYe2wATWK/GXSL0bNjGun42yI1rSTALQBr4ln8qePI0jCQo/wXAHvtpVhoWlm+z8NHiePAD9RGDy4YtQkJ1Ymbp5d1Sv+JoYY2ITi2s2D29y1vUTeNLtiUxIV9MWf8yApG5qY0Id5GOK1Q4ncXYxLQKsI7GCwnFUYdFG8meHJ8qYq4VEp7ATLZlh5L4ouOLd4wsKVCan7Cjg7fZAFNwQUI0o0EKgGCTHKDKi81KvVOFRSIiwsEVeVUbmPai65sCQ9VLXCnxUruwaIqO9Mio1XYMDJu8j97dkS+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DI8hQ/CSREf5nO9xgzBNWgmMuDl9xvvWgvCDuN+lExUjcRA8uDRtLJxtG8Pt?=
 =?us-ascii?Q?up7Q3deo8wUygYTPFva7AAdVrkgxafpOzrhjlOPxyYcGoSbeBBY7KhVlYnVP?=
 =?us-ascii?Q?GWQNVdb5HSDbHiI9om9aMQgVrreBL9NPaoyi57DI7iO1l0AKOQorYlxFfy/o?=
 =?us-ascii?Q?nQBXxBlX07Wvhuf6gTqqecCB3pf061JspqHL7G4+jnhJ07n13h8peltN3PAX?=
 =?us-ascii?Q?nQ+AUK6bDbPzZg7UnXcHOfNGno5Ax86cq33XztfNxNzufyMtcUTR+q1rt339?=
 =?us-ascii?Q?OT+La9qqi1zyjEmqGBVvCuFV8z2afbcsz/aVee4NkqGlTJ8QVQIiVvfv3My7?=
 =?us-ascii?Q?87yBw83N8IQ03f0mDAMQobNdxOv7D3D4hRdH2RX2oqQ8j2neVOEeE4SGuwSJ?=
 =?us-ascii?Q?4RqfQke4+08W84Ww8Uh6OM9ssv32KOx8lgv5yWujdTmnLAmhCTi1K+3Q9fbl?=
 =?us-ascii?Q?aQricN6Zpd69s1CsFhPQxnH1BmCYy7x+H7+YArV/nN4lWcvqFOLpGNYMet/l?=
 =?us-ascii?Q?9kiNfv0BaH+6L+SmzGH/HyZhImFQ7MiXnyqhgNPhPi4g1ijo3YnwvaI3yJgP?=
 =?us-ascii?Q?6C01nfOB56SzOY2Jrxmsmp+zrkmFrkiA3iTanezWSwSuZXc5gWMOVVKs8MhA?=
 =?us-ascii?Q?yO1ghJgTBpMtjUl7PC1rA5oSEtydepnW5CkmUSBEYvFW53z0bGGNmtkb/Usf?=
 =?us-ascii?Q?X5nNibhHmG1AWLGpSJOp76ORzHVOFeS6+Xt2YYd3hW3Iyf6ra1vfhcGlqW6F?=
 =?us-ascii?Q?FJvZ1OVXUCSBR+qvci3+X7Hq2JcK8KT+48vEbmcXuAGj+XUqtDXJ5LlF+SPO?=
 =?us-ascii?Q?ZDz8PG4NmmHKSfnZIwc8jtkpnul3Ea/w/ZqUPLTTH34zEzcZht7aLsYvcLqJ?=
 =?us-ascii?Q?fI8BTrd4LzAaznDa5P1CJ/fHzArx8+ZUwSRdoATBxMYNB6UsG38Wa09vJhaJ?=
 =?us-ascii?Q?G1P4UqyqGRwe5nQySSs5sATgIN57/Qpi1uPnc38C82ggg8eYanHwr3SPbaQ4?=
 =?us-ascii?Q?isND3RKuCHa2CqS19DO6+wGP5TT3QaVg8cMPVhIPPPJQW9LqyK9uxPvdoGYB?=
 =?us-ascii?Q?N4uvpISNiuT0GIolEjM2VQzsdKFqUJwpETgVHyXe0VWDNrT6unu41G46Rp4B?=
 =?us-ascii?Q?oX7q3zrL93QWiYggaZpaH49pSWjVBXr4fhtbMYdaomrO6qETWbubc5y60ay6?=
 =?us-ascii?Q?98jvI9byN1xSTl1ocEGvwT+sIdbfuN+E7kpxBo//83yqUojWxAD6722rseVX?=
 =?us-ascii?Q?gKI2rJS+ZD3zR4lMc6SexVYT1TBBW4uciLFjVst7n5BkIcbVnT+GZYKUL1rJ?=
 =?us-ascii?Q?yOJ34acwZuNxbAkg0qF0GKrmgWcVR4UWeSj90fT2myK1XwrFv08MKsCPNIgS?=
 =?us-ascii?Q?f5CSz+v3rPRF3M/UTfjdSb9Kd0ikGl4tXBA6aaNbThzYa2ktep1lf+4J9Tz0?=
 =?us-ascii?Q?0LwWSYT1PqNuDlER5b40CYJ0la27+047CCuWcxPMSWm8jRRYdR9+Kr877TEa?=
 =?us-ascii?Q?LBSN4BFQgF5/5wIC8OK5l26t2EEzp4SN/r3Znr85BAQufDFKeUJyP59GdSdn?=
 =?us-ascii?Q?eps+3MT6Im8jHNLiWURhhJQhi9iczkwSLUG0X1XY9taocUTNQucx1TzqS+FN?=
 =?us-ascii?Q?EU+XX0GCRHm7ETsGpI7S6FN862CaB23UyaW4mnjVJvRCwry7p/3pGtkF8HLL?=
 =?us-ascii?Q?wObBYYie+DOBl0XoPCAP6O/Lay1sL8poVt6/+nTEqQDaGcVnZoXp3/dj/WjV?=
 =?us-ascii?Q?zCdAjosbkyL+N7axJSMLYZRf/VU1J+M=3D?=
X-Exchange-RoutingPolicyChecked: TiXpwZ/ZqUhTaWP1pp1x/pmDZjhQJtUVcPWh1FwU3axNVdUnYztPYq63kwBQ/SBv/WclUM8psQSwcyWiYi6HIpy+3ZlEZ5a0YW34GF47oJ/uuazQ7lZFpsfY6xC4NjYtNG+4RmYj3ssW99EKM0PZ+BB3wUID48hNEkfEExHRD2U06/I4kwfKQPQUKvzKIiwcE644G04nH1r5OjputRdumneHUILxuL81lCFwvgHwyDo/QrH0tbrVToB855nvSjleEscmrawfpgt0dV7fi4aklLcSIsxSEFET39UogdL9ZMgRL1fTeh3v2iFvxTB6Axvy1zcURj+g3WgY/Y0sAU3jjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39405dfb-4916-497a-eba1-08deed610ecb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:45.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zzONz0PxkTzQ9O3WiOaGhX3JDWHOhNWQinmpOQXZlCLGbEWKL6s8gwHkZwYRVAhiPHf5c+f1rpG5XkVsLyuTT3ekZHyMFasexl/msnbfI8=
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

intel_display_poller only needs the register/MMIO helper subset, not
the full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0cc62b54d..2a084a0c4 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -17,7 +17,6 @@ tools_progs = [
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
-	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
 	'intel_opregion_decode',
@@ -128,6 +127,11 @@ executable('intel_watermark', 'intel_watermark.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_display_poller', 'intel_display_poller.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

