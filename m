Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD4FCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9EE10E087;
	Wed, 24 Jun 2026 08:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuDXv2iM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089D10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290880; x=1813826880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7bpO2/ptx/A1FRg1O6W+CpmJKuY6279L5SyXmxCogfY=;
 b=iuDXv2iM3fp17fbC/TjQQmjWLUl+Ty5sQSMM2EsxXeW8HHRTaBJPQCnn
 qNzamh4DNnmE0xrMmA6EovLVfSzux8SQz6Wp2iHRFS4XxdZKuFvDDJIdM
 +R7rISaDf9nok1dYEBH3U9alJtTQBftOny+zJNtrEM3j2OFYG6d7l2s8L
 jsbf0FGBvUhRy5F8wldZygaBU35DADfCdFJt6+w12eV3ozIBR/b5yusqT
 OxZNnjbv1yXVFbEoHjmphAvNPr3OMpYl8bM5Sz57PE7Vj/Wz6jp85a7Oj
 TM9rTNBQZaWy8Xzpb3dHUHWsHLDFV7EhJCDH2xvnvChlNUcEQu0g103bY Q==;
X-CSE-ConnectionGUID: GOJp9VRgRdKiEJ/HQfvZXg==
X-CSE-MsgGUID: co2hWcPZQcK/yXOHOgN+4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142286"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142286"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:00 -0700
X-CSE-ConnectionGUID: R3qDiSb8QUOebWEXDCpAsQ==
X-CSE-MsgGUID: ENN97jPuQxibVuMwBpYtPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:59 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFLhsRG8YF4ldV5ByNkYElyPdGAwBVR31cEalGSyeUwQsRqgBIf/VX5Q9+vFX2bHmbSFL0CXSiMYkNNXpmKsLIK2bXj03XM55o0Bs/8W5PruPBRvD1UJUN0wRd4RylaHJR6cmAU3M5EmwyK5u4wIrlG69Soq1xsBWC4QcS9mtx49Nw8xcI8InCqK55vvEicYGkOmlN8tkIe8C4LxGJxhiGtz3WRR4PhkQPVnoq6lUFgE6vuNbP1hVqrUFBGqfeONAfe/ET5yJpLriRkud+HGihxhJXW2GUxou7e+5KadeMPnlaz0Uk7FB7BMnOfvv89T9KW93XoVIt41fj1K/f9u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wuf/F4G+hUL5S2YepJX0Ctv7eiD3MOmhTUaMcuNn2bQ=;
 b=nngg/KQJMwGZFHdI+P4XOB7MF6njqjP0TaVcqNuIKytRUUuqj/veOYHujKUidgzThdnwtcdkdZ8wCv12IrOoHU/fk1SJ71vOXrNipKYDsy10iCZ1yNo+dIW2RNld0kFAgej3uF8Xp93SV/gKZUkaYdzebzUkcnl28jii4SN34jHzBaDrHO8StCF5ky/rVBbGxg0KKvYs9YxJKoUFz0VG+glWop8PaGJtCYhudfN+YWyLg3avkBtjv6RL677i1Y3UTaxWbrO6H1D4Rz0x0GkGUr3e/pjPUWc0+HhwyC9nJIzEa/xXHo+1dmkiD1lQDiP9DEM12priT/RRSXdaRFeTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:56 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:56 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 17/25] tools: intel_audio_dump: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:24 +0200
Message-ID: <e853797ceb96c975c10e7b35ddb31a57f77c24ad.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6b6c25-acf5-4362-095b-08ded1cd4983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 3XCXFOsY+Dq7qbHfgwQNIEQin6pXPUDZwzu17KovvwZfzekEDTgO1poAyfQZg8npkmM9qbbTnp0hvbSxZpz81uPMZ8rwMeqLx3gl5Z44/p8x6hCsG7hwV31S7h7K4+CRIxByXRt6aGiKcg0peOUFZRyMMWPRfqt1Swd1m8eTJQjoc7ZuAl/5+wBUsV3chzqpwinHD2VboyaqPAVOg+h6q03dpN5VviPdhzdbTgqpACF/IsDIv74aYxWvYJBxSBLkaCcFKXP6mhJkr4q+SoLcUFbQ+TJeBdvPqxJve7+kq56NorpL4Yd1+cUMNbK/IdHC5VQ9OJMmq4LVLjz3fzTq3/I1uGAYZFwOKJRpNvIQAe6s5swv4m8uwYS9ucNRlXPC+CTsObjHfYtEzow5CIApa1CMGDLoFxzPD2/8XUizXz8bgNXo0tE3+zB8gyKn8k8IiFCy80r2jRt+TMh3ivkZPeRpfRr4ReZsKYtRDcTyerAjQdsF8JG/9CjlVt6KLjMbg6qDBVI1+KVi4Geofw63eLxkbNfHK7hWFt3fUshoCmlBWdlPcZCrrprXg/6NrHCP3ZCBhJ7sdTrdvS981/BL+TWdCkgBvO4DZCViDZQDs6+XcMg1MvFFLvIu9jd8gtUZixOhdieIouBGW8eJjWylz76+SQ1ximETwqTtWq3hYZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03HCAQbN7fahoW9jHtpqhk9y8s1DZW7MJP/V2bbcXYj/ivEcBSciP6hCET4o?=
 =?us-ascii?Q?r0exfd52URQfSl3kjHWNQgAHqVQKTIC0UV3l53FQrkqAslnjDeo0xxRcPlgc?=
 =?us-ascii?Q?O0HQvOf/gp1F2dryxb7BhQLUhSoasxfb4kFZg/i0aHcPSDhBu4cO36Hnf6cl?=
 =?us-ascii?Q?Kv1PKArWXoaUSqZtShWM0m6cu4KP2u/ARpyvRv4/SDgCu//pJ3RxNRmzDIXo?=
 =?us-ascii?Q?h859RewVM0J41D6E2gPUqZEp7Gyts6MeXZDSwafNY1Lp/YV1EhLDz3VWGlb+?=
 =?us-ascii?Q?sXFx/y0Cg9Gd26SScB78UX1z/TagqD78JSgebfFEZ2lZrswf3aMBnxNRzwy2?=
 =?us-ascii?Q?l2YsFw8kXLdAaesasZQYXYan6IEo+82fFW6LL4FgalV47UVWXzjvgv6gzr2I?=
 =?us-ascii?Q?nuc9mG8WIu6PL/Cvyn8r/+CuS8SuzaxhqDXMo4WzmL7dPWtw78/VdP27aPYP?=
 =?us-ascii?Q?3cMZyEfig7qWeDqWwggwpAj8xeRQHb8srireUmiiGcuqISgVI+d216Xf9QAV?=
 =?us-ascii?Q?bAvXv2jzcBYHNTbw6Stn7/ckxCfQl/VwS4MCJxuEo4n93n70FRwIMWPy382n?=
 =?us-ascii?Q?KYNLumpdHm/NOvZl6RJukv5JI2GjaBTy5P8vDVilFIgHf49YYwkRZfqTIFba?=
 =?us-ascii?Q?IWHnYGCWPJPVE3DrL51EBwNt3NjFY1s9Km61codIDL5fNVACl9q2YZJb2NY5?=
 =?us-ascii?Q?7FwsC8b24b7eFn90PcwBe2E9XiwHAKncXBV2qWZIIZjuAYJZp7PiWWWoooZs?=
 =?us-ascii?Q?hSGzAFHCHdtvb1d6H4H0yPI3+tdHyRuHN6hqpH/natjeoHCS/2cCkmZZXzuD?=
 =?us-ascii?Q?WvGrv2RrxbISPoCFrt7GCZ6ltTliufctBDPjOXU59WN9OAPdigkhRtydLNDw?=
 =?us-ascii?Q?0Ju9Pz4QN4anpOX906WJWLKJw+MFu0WevMXewJF8AkzJJL+97lIsAYLs3KEQ?=
 =?us-ascii?Q?VjbDeUb/LG7KKEbKW0DzNAOvrnmvLVdBrypvsSj/hjHFrh1Kc6dQqZXmRI+X?=
 =?us-ascii?Q?8oC49+9ZaDMWIjemrQGuACqBfJtJqPlMUj4+y+4UaVWa55E9ZBTJFF/G0fBs?=
 =?us-ascii?Q?fiLMo/CaFVNJdOOi/aD3Wx7plEnn4tYVegFgRVzgd0rvNsx/N2JUsFSNUyHL?=
 =?us-ascii?Q?L+c7HnnqAs+uuSuCaIo+rdueoqzi10WClGjrVgRfMOzE3zMe+HhgRiCnuvhJ?=
 =?us-ascii?Q?LuApI59FiVZbkKlIRFhHFO7WWOErjDLfu2AzN9pmK0uH6XUbVnPfrI0ih2+f?=
 =?us-ascii?Q?IPp66scig1kQrUnJ3xq3vKaU+Zy6E+MCITAk82AqdlIBVBtOYqI2DBU0/5RR?=
 =?us-ascii?Q?oFXPah85V9Wotju+AYEix9Xn+kVuDCKXV6GuKFQHv2wnLGJr2sBjUjXG2dBw?=
 =?us-ascii?Q?r3zZcFe6ECQ+/QTnavGUdSmHt1jF3J+xt7tL2PHdUTV1M9oOYAKRRSZydrHd?=
 =?us-ascii?Q?ug9VirkrTvQ+zIHK7wsRFhnT0RyMItyY7GhySvuYImEUVBz2Y/WuAmeNuUX3?=
 =?us-ascii?Q?XbdCkYH0X4DYOe8vKDGeqShQDq54LNomhu6WNOFfPws+QPvcu99ifo+UqZ2y?=
 =?us-ascii?Q?zrn9BR7O+CGum6ux2W7OLmKUIPtVbJfTIwODnwtFUMrpXI3XDcLzJdZYEL8i?=
 =?us-ascii?Q?Jw96j4qjUbaSwY4WhQdtJSobIvtm5VPv+ZkXaeLiquYhq/c24Tjg+tXtRVKm?=
 =?us-ascii?Q?uKOL5e2SMWyM0VT1LhjZ/oY1RXswhd+BQX5F/XU1xcbeRErkDdiw5k8Tadpd?=
 =?us-ascii?Q?ubB/es0b9szMmb6j1trM50xTsZ9dMqQ=3D?=
X-Exchange-RoutingPolicyChecked: cXi4YyhnQT5DxYwrqY1VDxzUDHdujYNel2DsZ+sLmLSQtFBIH5iJL2HPc6sqy23nJvfDXDcIhk9PRHPjXfadH0yXsMOg78DnU9fW4+94HQIkT3Aqq3+/Fnc3dpsBwvJCIheY/KeQNYFqV2EIRhNE8KJmyu1++I+GCNUAF0Ta/U3JCM4GD0hbQQwc0EHgHZshZMmU/GAdKW4qc5fKaTVoAw+HY0lbh7Sbh4dT/pcSnbmLlC6YUGYKANE0eMvAPoBDV6U+7T3LARJKzNFzogGY26Mp+pvTTrnPkW3EHh156rpzXFXhmoeZ8y2z7E6ZatNzhr+FhVfhl6GDfFwO2+D7BA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6b6c25-acf5-4362-095b-08ded1cd4983
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:56.6145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+ECYHb0wtw4mOoL775Sys1FoDEEsmaSnDcD0HouxMrTw2rZJ5bXMYb3oqz4gio43Oqt1dQcZ5LFYgacVpybM8kitbceq4+o1tNCgGw5o/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

intel_audio_dump only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 2e8ceea36..f9bbb41a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'intel_audio_dump',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -104,6 +103,11 @@ executable('intel_gpu_time', 'intel_gpu_time.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_audio_dump', 'intel_audio_dump.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

