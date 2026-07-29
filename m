Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C6C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04B110E64E;
	Wed, 29 Jul 2026 11:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8fXUtyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7710E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322993; x=1816858993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wEOh00zPu/vb4lmasVtdD+iYjgV2wR0yZ/D2SfBzLiY=;
 b=Q8fXUtyVdBTr8vR3nclT2b8as3iEMderFGJEHfpBiv9bi/eAp5cmxS2i
 8ozhsOSrlJP0Qa16EIFywX9PNW3iKAS00LuTK6Lk6dvGeUcrLmnzTeeV2
 s5IIoQz3jI1o1OcFUJjZFb09oGwyIFzBCmzXLYk7mdccPOCQI4sgDrwIa
 YvHrS6/ZI/xmASk+FeUyiVEfr/AZd/fXTt4E4wumesUpWQUYFpQ+RcmGe
 332wHd82DkqnEnQrvEjQr0wAonWeqO7aO4OZ+NSPQMoEbGeXXIxKi3dpV
 htrekagTuDBYq/WcKPMA8QQQkIQDkHQz1L82B5kByGKKGopYQIRkxJCcK Q==;
X-CSE-ConnectionGUID: uL7Sth7iRrWI3kFYzCt83w==
X-CSE-MsgGUID: 5hFbxkjOTx2DCGWJd998UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797573"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:13 -0700
X-CSE-ConnectionGUID: KNZ9SC1uQBWlB6k3s/bmzg==
X-CSE-MsgGUID: XbYF5G3nQFuPCxBiJ6M6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264071"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3X7oXdG2AVAjRRHodRS8yPfbbflwicYt5RVYuEy3B4/mj9xI9zfPgiaHKnwI1hQaBBCsK0URuyItC+tGtBHsydPhbIU6Q9TY34zxCJDhrPJ/DfL0rsFmUpsFm9WRndQ4n+2G6B2HqZ+qfHC3t201Vpiq9BJzwFGqwkS6Ekup3gINkCaNJBfeCVEQPFv1y4ezNUNCYuUlC0otGUThG9nAeikemZBkzB4kZkITLO1Z76XCN3oYPko3xMau8WGDdD1HKG4FBLyJ3byL/RX5q3YDDKDFAZEpN7NxU44HulOGSYKYi/dtiDUa1U779S1bpYVnaIYQYbe6FCRqgsq5w1fcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJQTuZTVEkPcypfd5zTcycLqw4l8CHM9e7xgvMHnq6o=;
 b=aTGTpr3d6m726jQd+0C50apmqHD2QTMk/0oVonXD4ELgerl3ng5+rE/basuT0hksWia1cOF84eHbl0786wq6wYsy6ANzLLC+3rk28+gGWZd6NvDJAonaBV1PoAVSdNszjDalMHu8cB6vfsfZeWM6TChuaaHzHbpCVA9waQCx9V0M2+AnSACsUuoDuIk+xw0Q20cRjiCqrUrEF7wU4uKuUxrDlIoV0p6uxxe7XJmHkLhviaOWFJ2l8noPg8faX/hpgqdbTyEARAyO6rH/Ezzde7UREo++r445En/0E+ZL2xxfBor1RrCdiET7Lv+7x9ra/ErlRiRdAQV2iSUKDmgkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:10 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:10 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 12/31] lib/intel_mmio: introduce
 lib_igt_reg_tools static sub-library for tools
Date: Wed, 29 Jul 2026 13:03:29 +0200
Message-ID: <5353d986fe5f7534a59d4cdad6f03b5be2d36b31.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 005d6e2f-1495-4bc6-80f1-08deed60fa0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WFYegnYcFLzWgSvoWfmWSHgF7aw0/FoTdnZgzccsZEmN7zMi/mQx0Paug3jTRUVny6Rj+F6jpUS4Lp+OeQr+q4YhojxB8AyawxkM2FmEBYfgpELikZODbATeBBQ6KpFdBAkZ4mNszj0kUSj04Uz5m+AXTdP3CBfeRKK4Mq2vEsArZQNvVjUOU6aYh7K+mWYtPxpBDDhxuZIyVlVBBlMZyM+GZ0FX48VFxojIj65Ch97JDOadFOcgfbVUEmUU0yKMRHngckrPrHdNknoeX+wb3nfMy4rSBwXChBdHyu2ec58aokTVbsrJK5pn40VhFN6Ey6SW+fJMxX+/CACOG5noh7oP46kfRpjnNtoljxNtZdL1JABTq/CmCx+ZY/HpY6h0LSyj/KuYvuuNKp1zR559TSsnhim/+8GC6E/tZxX1e7JaCuHnsCe1utSA5FsvLc6N7Px7RQTAyxizcys8ixZeZS/2BZJ87TjrnLMzEdkP2SYHBaY/Nf4HVttJtasr2+rpaTG8EXzqqDsqcdtwI4oURI20Nmu5EsaJcezlLQsCEKej25p7Xgmzy+QF/GgggWjMkB7ZiqxaWC1m/K4T0JNTODqECb2s62r7ycxnCBPNSzfp0qmt47LfaIvr2krW/ZCDroFsyqFewdHws8pHWG8XRHMRFZLzP5lea7HqRwVGysM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSzOZYeD+b48DMFsUxlWWqgNfryiEIA9gtilNiCEda9U1VqghZZj4SBwP1X8?=
 =?us-ascii?Q?X6uL3CD3R90ESZb4GDUki1StcI8nK3hYsvnke3pfwbnIR3ofaVRBaWiAqTmx?=
 =?us-ascii?Q?vbdnfl7NsDl7kZWZHa1L9B+V2oxc4pKTOkPBf6U8rvw6EBgjJ99CFTfmDrxK?=
 =?us-ascii?Q?RiYLuUwFgUObZpnnxIPHtEdNXvf9YGz7ji3yfF5cVmYuwD6o8RJlxIksF8Xj?=
 =?us-ascii?Q?0Q2bupxPdkLkigyVobi74lbLHWAxCmGykjjYaAHWszXwTACaS8QSWW7UNiU8?=
 =?us-ascii?Q?Ku782e+yJ0MlY9cgCHNFRMNtD50i0ybjWRWr3r4FAxe3A8ndqo1i8u8Wgcix?=
 =?us-ascii?Q?PSCdFjXhCfGQyvosOvqkgaLyrt6DO/uX092SDdApgCFbzZze90FwS+BDAXgU?=
 =?us-ascii?Q?R4gesQdnbJ+eSsx148/KNMOCuYffkJWTN5atib5ar9Ekxa6Zbs5ZfINTj3gc?=
 =?us-ascii?Q?efHb510LY1Q1cc0RKrBKPniogSIF5UMRG6VyStc1A733EizKUOcrE0iNr+TV?=
 =?us-ascii?Q?+90vI4JCllJEEwlDGMHdGkHrWfrf+J9CUnvgGtV3vhIlV1IXVLLKYBlBz0dj?=
 =?us-ascii?Q?U5cFOh4MXsS31rg+AopTEsb0/YyzzL4ESiryrEFl3TRAwIdZiDWcP/4DWhWt?=
 =?us-ascii?Q?BjDhZdR3B0UEtLCaI3cS4+o4GiBSAjEOQCCxyvhGQYCxSlNz4sUIR13Rkd12?=
 =?us-ascii?Q?pVT7phWvwsm94/MugISfEdGT2qlUncQO2wJ17gPZk5WD2VLmYcLqAipn2reu?=
 =?us-ascii?Q?OGNFSLQVIpjbM/MjbDbWeSHN1k/jV4Wc1OXXtr3hDm8HT9TnOOobYcScJA6C?=
 =?us-ascii?Q?YI5m3goyTTSnKWV392c5k5RqR0mrrxeEn1w74zeEsF3c2/H3DOH6PBHo6pb3?=
 =?us-ascii?Q?yMd7QYWiYuGEYoO9uA2PdGUfjISfg0AYnth15Ij7ypNLTMh+vBHBTNUEm2Lu?=
 =?us-ascii?Q?KyM/dlK2+lo9lOI/s9tVcOyGPJskcTIOHeJOczL5+gSp2JV2wp43C4/BDGju?=
 =?us-ascii?Q?zUR1cm6zuj+pboYgXF05wHjKCRKugeK25d4oFXxtWCFMYLA+6/HgEakzra9k?=
 =?us-ascii?Q?R2kDrXUkB75vOt0bemGqe5QMbueyE/nUpvl1hzQKjh4ikWbwcxA1o3yOE0xn?=
 =?us-ascii?Q?0mIFSP2Yw/Q1V7w4NmgnrPsTXuzCRteMEYXjM2JPX5eHMmO+O5/a2biRDIrI?=
 =?us-ascii?Q?oKwEEvkTJxRIxuvObQmHtKf4d0GPu/nzLzPO9q8c42Hr5IwNW67xhBwynLgs?=
 =?us-ascii?Q?T8IFnSyHwNKr85f4mevdgBs8zw2XFcRLWS/sX5xUD1jQZZfMgmA28cO2DrBs?=
 =?us-ascii?Q?NxNqqmPUGQbMWHDe0XwvvixNciNuKa3/HzeuY6aArXCiFoaiuqyHAJrk3sNQ?=
 =?us-ascii?Q?PfJi/tNoX61bp53D+Q7YQ8++YCWDlo54u3tvhD8Btz1KiTxalCTIkpLIYBPA?=
 =?us-ascii?Q?dcdzj/1U5LDTuYoVw1u3Wxfvq2wwngbqCX4fK+kAbUCPEmNna1G3oQKA0MAO?=
 =?us-ascii?Q?eM0ZFSoLvlMU51lRzitSs5c7BBc7+LYJzMuzlfIWm0TuwfZjdneLYkmvJyBP?=
 =?us-ascii?Q?ywJ8IDuUeXDlN5DKT7An2Q6ZdBv4ePGIaGViUPqeABrfjTfpnB58MJ9+ybTb?=
 =?us-ascii?Q?X15Xm8/OFFoOfsUqfO7yP4FW5pDxHIWDLQFfpZsRhMIA5CZEXYiZWd2Wgnnp?=
 =?us-ascii?Q?nT8+7HlQT+tY6LCKTyla9LSM719ioXgVaur60b0j0ES9U3vhLFJikIZ6xDbZ?=
 =?us-ascii?Q?agblQVh05pTWBAGQWByp5ZqBBZn1bTw=3D?=
X-Exchange-RoutingPolicyChecked: UJHkSbUFRshXWHXNo+U3SQoXOfmKBz7r+A/s11PUMZMHX/d2pcLC18xv3x4sGLFC31B6cEygYP+4pzdJEMBLUBeOApuLERtgzPup9kx2MEPPI+WtYlPFf2/++tC83TcjweYMpnoASP5bwEiFYeNeLgPj4FtKsnM5n5e038Z/v3otxV+3aRyD46ZGIw2OU9gYirCnSZn+vJnTD4mskHKnvlOpqqpWpxR/jqfuUttaGvK/zb8LkSlbqjSTteCmBmClgL4HfRPNaS8pGnpz61nIjQ63D4RoX5vIw7zn3aAWemGNkWYzG++qLK4wmyebYTsKnLpBVl+p5B0qB9rDs0KiJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 005d6e2f-1495-4bc6-80f1-08deed60fa0f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:10.6639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPVK/GM7TwG0odJo9ZMg4JlmFG82QdOxscJDqOY0V0ePjyvF+777TAhQCFxRlRy5DXERxhnOSSyC235d8Y/WfxC6bxz8GGbEsy+u6rHjfDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
intel_iosf.c.  Tools that need register access (e.g. intel_reg) can link
this library without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 8addc8982..aa8eae68b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -437,6 +437,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				                     pciaccess],
 				     include_directories : inc)
 
+lib_igt_reg_tools_build = static_library('igt_reg_tools',
+	['intel_mmio.c',
+	 'intel_reg_map.c',
+	 'intel_iosf.c',
+	],
+	dependencies : [pciaccess, libdrm],
+	include_directories : inc)
+
+lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
+				       dependencies : [lib_igt_chipset,
+				                       lib_igt_tools_stub,
+				                       lib_igt_drm_stub,
+				                       pciaccess, libdrm],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

