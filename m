Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F8C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8A989023;
	Wed, 15 Jul 2026 12:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLubxRWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4910F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117764; x=1815653764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lRRiMyS/p3IDhZuzv0U+5O4v8BoLYT0yAvdTn3qARGU=;
 b=QLubxRWY5FNcYQK8vr+79SKu0jgAZ7+4390P3j6l0blQKkQ8VRZEuJ+m
 NPEvBSJafhs1/GZXxrgR936EIe+fWTGVZFfB7c6BboUyAwN75/Lzh8Bzs
 aFmb8GSTm33soEUHkOSMSnyt3BFppZsNtv/hHG5XrJrm/exmjZsvM0OkT
 qy5JE+z1FCLXskwwtcI8ZX6hRM3adDVhMvTMNNlKUdIfBPN1/ob7pwEwk
 PrJa38Hp88sjClKJcsEwtlnPfI5tZkmd0HqXm+5wejbFKl3zHlFbY8uoL
 dTdxBYSi6mYkOU0HQ4kTEjEReM0xlnjvoo4D9Dg8g36OI6CHP+QkWPa80 Q==;
X-CSE-ConnectionGUID: EtgXKpEOS4WL9ETg7vbOPQ==
X-CSE-MsgGUID: swYYytdiRE+WMnGMnYvBuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108144"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:04 -0700
X-CSE-ConnectionGUID: eAZEvKmLS/OnQLaawyKU7w==
X-CSE-MsgGUID: uLmnbDDwROuUiq3VVj6BgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252210376"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:16:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EArN2q2lb2rQXnGkqsROm+V2OoIJAF+Zw44y3mETfqsEcG8CY3/MKgOAIitGrkFAAogguwrLdROiH/tPFYAPUX7BWl81JrF+NVqnfN+fNFRnOfmaz4sshW1pA86hcgNLiuEcOOx497Xfqz0+tDx5xgWWMBPidcUog2MS4JE5zxUc1rgKOULdcMacvjlnPf6ppXsy4wdV9ha2IMhwhXs1QhhO9ymo+AZJnCW7r3RuilQ/AOYD4jhkJQI+CCFMTLEC2AVZqglufw2trxFAr2kwaEVTkMyJ1Vs1qGnP2rPzwlGxAqzAS2dcQ1DzBY7A+/uJOwYzweTDS7WJzJPFeyJM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w4dpYKSRPJooIqrqSe9bZGAPL2OENc/zy1yI9gxwdY=;
 b=G89JpmYfCgDW17I/E3PzGfdBGfx3JSex81ykLDA43+W6G/7XIk9JYep63N8Se1DO7kFmq5V57RpvuKIktV0MUP45QreGfhC1GgRy4TAG/h/W4WOmSPPG6EOWXL1kubSqSjsC1ZuevjWiSkZmJlpIfASB0wdwHR8zy6PSNMHLbMI4wUfYYt8IZbD0i9zJps61B/27aUW70oWFQnPkRAayoFXg/VxSoXxosx+2hgmDrF01bTcdCAQIvo3zX+JEOJMIPZM8NzrGDTfu+tWtvKK6vxu42lSCJ4RrLzQ+pq1vPG6ezpI6oaXSh4G/uTCTYpg2sjXkLSVKG2BeVBZKQrIX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:16:00 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:16:00 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 28/31] tools/intel_display_poller: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:38 +0200
Message-ID: <65f023400809dcabcf9079dd1872180a23089447.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c13cc5-644f-4338-4b84-08dee26ad51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q/wcSasiRS81lCsIgzzm+1+I1yknnntMPx7zZqpBMKo4nr8soKocCuAP4UMi7WtoEBjjCy9iECliFmlnUNKlrSfMwEFGtszIgHyl+duwce0YpTlo1gIgA8dlhkswIkRYQuW7gvR7RMO2WQsUgEVig1MiJSQRkhilJv2EOgoezpSaqtH7dDoaygkPGG+Q36+pq+1O9EdD1n69R1TF9+G4ZB95m+7xDy0LYspPy/mByD2IkPnrRlV8p7gHLZ/XHDqJLagjEBkJJGoXIjS8vOdluCgfLyG31R3ZghepQDT31LpWFbxfAlsGkgkyWu99Y286U2QoM2tJmvfoZZWf2ug8xo6SmBZqVOTRHJnnq8/pm1kXkxZEo61VStXCaNUX+lAHo+134pisg+oq0cVpUjIQ492CE/HxjYpFEcbiAGpqFr9rI1cf7gxaYMgpG3FbXLitGqA4eWfxJGIDXx6mt4+D0DojQYL/eob7gPFF2mcCXOLN1Pc1OtvU99204zmd6TKwjQisLkgLKWwqI1BPKcXbqzPz+gt9tSkRNaVNGGsNTaADiZyo29cd+vbKDebPm3sblpeXR1LbwtLTSVnO1YUbb2huQ7OHv4ftbJoF+ILanMNM67InsIZwamypb4rb5cBT5fF1yvLsSbSnqLd1T+moqL3ceShzm5CGec9ZW/XF5TE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JHr9S9AQl7zrD/Fa8OGXCE1BWGR8JcuISL28eKaSJTx3VXpOMi9yDojhjCkj?=
 =?us-ascii?Q?bmOhthmlp4N24YGw4YbV7MO/8XJYknkRJrJt4uxWlZ/fjri3qV9RXse1pYeH?=
 =?us-ascii?Q?aeI2WVUyXpcBLU0r+/kIBraoBIDiTTTWjyT+gKRm+I35EHcBxNiSJs8rGz/C?=
 =?us-ascii?Q?RaCVvMU0qqoBdoPZplWRvcNCvBq6FHx0+l6vvrh1wF84oFVCYM0w29OdRhQ1?=
 =?us-ascii?Q?BiiKuFvLh2VNxSCrgpDAHIz0Yw3c2QG9k7jJ0gjbCHsG9ypjgM8D3HVHKKNw?=
 =?us-ascii?Q?rBDt3S9Z3ykthCbxls3OUylTfWWZIhhBRVA79fIxG9Yy0FRatiat7Xmz3Fj9?=
 =?us-ascii?Q?+1RakwY2+DNkCIZ7HiWwsVcBvZLbGBWuZso+zdFebD70Tnck0B5duu47cnR5?=
 =?us-ascii?Q?HbWD2NqQ70yZROLoMcKDpR81iay0lXzpAHuQMjRzrXnZhEYpH5OT2qLzG3n/?=
 =?us-ascii?Q?eUprQGuM107FhDXOI2kBalga4aXZZ/3z+99GNdp3IEJ/m7uShePXHNN7uJkl?=
 =?us-ascii?Q?iKdhxxCSCGqYf0aPNNhG9lrXBNaap+dv0UAgh0xW2BVHkQmu5Ab3QbeZi1te?=
 =?us-ascii?Q?mPMKICRK/IneObzWdg1l+7UQrYEMCUx/TJ+yD1UL7fpT4ic1mMVoYVYGyVAz?=
 =?us-ascii?Q?83HVCTlxwyTRXojmTD/zQFcMFzQeaBp5N+lX7dx7fDqWRGUyD61bLNExJGDk?=
 =?us-ascii?Q?QDowmuHkoSFd0nJ0IKGcMaOOyGCySzE1FzboxhkCSGGI5eGwWliu/h51064G?=
 =?us-ascii?Q?/puYlUkDMNaYtjfk426NbjW/1xgH1zFWEA2Ge9bej0wtWRVq3wF7ymWvls3U?=
 =?us-ascii?Q?5mjVP0rXwK/D0848g5NmwYt39l86unD0BemMvhAybwowvIL1VRmOcHudWHgK?=
 =?us-ascii?Q?N8iqbsXhuwWjabXKwJuFUj6ps9sBbq3LA1Qae0WcjNIDL7c5VJmK/IvsTizY?=
 =?us-ascii?Q?v63Df24DFCCH6svmfJcNUvHeYltMocVYlPVXFnMC4PhnX0nFib3dKUznfSpt?=
 =?us-ascii?Q?Rf6RjN/jBhDZbUCjTjDwwygoajENyBfCAbaI42LUkHd2+xB/CoHAF2U1CO1z?=
 =?us-ascii?Q?Bmn8tgwfFd424UBMjMJMtv6CSMwqYwH/g4PqhcrAMLLBHhUTLF6ddFOb83di?=
 =?us-ascii?Q?p+hiWRlZkbM9FeeXGipDiqtI4h2ohDwyFKwrLRgSwbHE1B/rqUb/A5k/eof1?=
 =?us-ascii?Q?2lyKEw31Fz/AGA5cDLlse01tXc0nc9LrYjyDM4FZmaRg8FfIfuEaKygTkZ4A?=
 =?us-ascii?Q?BelLvVs0CuPh7TV6f2ReHB6fhNHDPdJdLQa2fGlAjy9fmWHnjDK188uhzVQN?=
 =?us-ascii?Q?S/vmKt5wrayFNN/1uMYlS9qQ5nMTubAOhl0vveF33d/KHPHEotbFNMQnLRki?=
 =?us-ascii?Q?AjMtlLXpQqKQ3TRL4XfjqOyHwCTLJuglirwiDK9IFxbR6ektPH37THP9xGLq?=
 =?us-ascii?Q?Yatxx7pXaHf4YejjYLf8mdq/WPZ9sDDXmAyTUMAYlLSLx4jdsJygvNIQoqfV?=
 =?us-ascii?Q?3QhlKaKCUzvwGxrJL7hJrm6ejMHOTibPkqPH7pNymVW3odI5O/Z0HvxDbQMd?=
 =?us-ascii?Q?Mj5kp3SDa4GYCZ0rYmIQb8wilpkT7c0FwR3Zt9WsVU4W1WAWoCGpPOQ4saQm?=
 =?us-ascii?Q?25tkdqH6y+zfHcb2VZ8Z+8N7LA1NwU7aOVgNSGll0FSmwmBJ38s6Glez655/?=
 =?us-ascii?Q?fZ2OhMY2n358W2Nb8HlFoUxTaBe5V0EKU5SsSpdXoAcLfJJdFqpf/iJH/Cok?=
 =?us-ascii?Q?hCRH3pP9AwI9q3x1Bw/FqscxMuxofUU=3D?=
X-Exchange-RoutingPolicyChecked: ZcPU1LLADwANod/q/Out7eVuysHkEVmuPZY5g7npfkFCKNJM0P7eVZ+elpvhNXD+3Lr5d9JC3x25oxzoj8zxefFrVG+lgHAdRTSzSsFAqPP+EqmdmGFVK3bLCKspKZr77LQnYbpI9t0+wOw1oM5mk7PaIF72sTkfRtys5ez6H6qIhd3nrLAuDZJOgh18gh9pzGg//eqc1AlSwv8S8SyguusxzTvGML1sHgIheahAP7HdedUdy6zCv9YQaCBekpTsAATah+eqieTdu1LOafksDRdDPc9ux3Jl1XCUC3AJ/yN3l0r6l6OAzu9FVGa/0+8n6b+g+7pelBtUX3KgjNzc2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c13cc5-644f-4338-4b84-08dee26ad51b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:16:00.5649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBgv1XuBBeqb4WLL2HcAFvkx/mAv+gHhCN4Riwyz5UDi7H1+VOyXkI3Yba5BNLKJ04j9mDrlh2CRYLyycjurihWrp+bYZxmB3iXIVkcyaB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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

