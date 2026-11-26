Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB7E606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YXQI4AVh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AsspNwDU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC28D10E9FD;
	Thu, 26 Nov 2026 18:12:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B175A10EA0E
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716363; x=1827252363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aeKRghG8oinlOH0XayZZovSoPQC9u0u/HP1uafHpSKw=;
 b=YXQI4AVh2DMwCv6wqjNLV5eGaam12dYc4agnoPz/9YsM0FD24Rl523TH
 LSCDbIwaq1zBC/PNxHn/7XIa05KlstcgGKQ9q1PuxIjhHcbMj6xhG87Qj
 iaS+1f/leP6CQmAYjkrRD/J06tjzRBOKkxnOp6r4mvtz8WMgnxIxgktHk
 0J0pdHTUJwbTRyoYN0Ll4dkJD661r2H+QrlkryTAVyPGLzn+7tX+UNbuu
 rhbXZcrBJT6yZ0z6PNHg3OFpxZjCMB/AH9OfFAWPmf9lVR6n0OyM1l3Cg
 wYfpD0e/khJT51cL6tqlMkiks/L3pvmHwYCbrGt9pvEkYGBhTBs/9aTn2 A==;
X-CSE-ConnectionGUID: NWI94f2kRiagJ53jkUQ2qg==
X-CSE-MsgGUID: 8Bin+87PTyeNknzi7thPCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541041"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:56 -0800
X-CSE-ConnectionGUID: 3ITBSuXERWqtGcEJezqjoQ==
X-CSE-MsgGUID: 5q9usDZmSj+qEv+u0QBsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:54 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcGspx5ppZ+46D8TDuY1gLFvllTVVBEeUoEvbaIt9qWSMSiA2qtd8Fd1LG7vqCa93PoLivKOe3Vh9FPmKR8sogv1YXuN2s49iXy0DM/WYzmCiNliGwCZJPQb8xVQXJ2hQgvhcsa+z5KLMpiBxGe1n1laj5FrObiwp5xi+pbMsD90hGRSKxaNsMK4tv2/dbmhAj7dWCELCR9Un0ptIhzufWBM08H6XF/Tj2vh2mC+8lq/1DVxxsBux0+UMSVFMvqY0FqROnbMahYegi0KbqmBnOFUlkwinfj3lATigyF9C3pN/JK1ePBSPZzaIxVnNerOHtMx78TN6ePEmtlhq1bRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcEHB5DWcYjdaeAOVYp1NxOJkEtZ6p82HKXuifL3NOI=;
 b=FX9r+9aA69JgnlNjoWCNSQChCltyUcfxzb4vshohq0TX7Vsp3x+5Ka3KBvdHoamhGvvhuuTlhBk9+OY2vlL91O/SGLW+e2+A3YxFFnAhzuHUpMf0wlB4LA7xOe5sRjap2poWRQn3W66Wgj5MWNsaqezHUskabvibHrE6aiZkx4qeakEWD9HhlhSqjTDD3cK/AmucsC4N1c8xFxv/PX6yy2ACPXOxJ+hnEOym59bFviVA7XGEfiAnW/RKHG2228DiUS8KQjD8ANl7OJxuekiMNMi6c+OX27Bse/FnoLDuBYO/hTuxI8UJtui3RE5xJbMnPq2FkXmPHcW4iWb/6G8QkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcEHB5DWcYjdaeAOVYp1NxOJkEtZ6p82HKXuifL3NOI=;
 b=AsspNwDUes3DbDFJ2p9mx9vDbNWpvOhwPDH9A6QEJW3qwaJ6ZgHFJXSubNDjyef5iUhk5Y3h2EfZo+pnckkyJcrIgr0RXh9XOJcIMxmbCva7HLlu3SoNItsHvcdlsZRCexld7bSP76RfiUhHGONCL0QRnTJd7919JdxZ4WK44Ug=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:51 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 4/9] lib/igt_drm_ras_nl: Add telemetry helpers
Date: Thu, 26 Nov 2026 13:05:38 -0500
Message-ID: <20261126180536.487442-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f6c243-699f-4e93-75a4-08df4be7e800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: xjf13ZdqkcQeKt4RAN0FBpnxaOF2b+lb9NScyLA9lxQm2UkHVLFAjG9Tjv3I7++blRHqoo81YQwkrveso+Bckf+HrCU6sD3lJBM+1JvhNWMG/lL0n8QQLVMRbFtWUmCMQ2k/LEYfvzYZBYBfU/J2V2iDaPokDhqEaxmSh9IuvziPJTxapegX24flf5B7bkjZ7svlowWMjgyH9uIdPojOqwJCga+inFwOaXKP2RxmObyROnOw7OylakWWJKIPNtZRPkdWJf7bWujQVbqhnGm+eyQKd7TvoJ2+XJA+YZLkVJkz4XXp9LaC9yzFsuBTubh+lLXVF8mxAHRXi8zxn3utycU4k6La+a2N2Jq1gfk5v/dQ1mlKdzJL1Kjn0D4U30hhOd1sELZEHvnbfe908K+HXnWdWsB28Y8g7ft7q3xMSslGp1UlAgYGAkbKFU0WWsM3AdGMnQcaSaa6MHuXzPhYLp0puNhTM3iMv2PY+zem75sgAIB3hs0YlhBw5mKVX7Fl6s/4DXCbaGeXtkYMnhtBpSo9DiOKyMVGa0cCDqJV6vjca41fku1I4HlyuIl6Y29zCUkEanKUCLDwKzQFm8S9Z4dZBPhcFavCIP4zePSi5vx1TWEDAH9weAVUeuSTS4hH46od6JDESgJkpSH1lUDHDnYP79kuIC5GxRAuBhNEQ9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjtLeFQaesrs0Yj+MwuGtrvvMR+WGwb3NOPdiCA9u0OBIdOlnhFaEWmgwafE?=
 =?us-ascii?Q?7UsF3m6/B/xxkou0bZWd/OwCeieSYUsh/7batmhrI3w5d3cHKly/z40dsNWL?=
 =?us-ascii?Q?cxufOKOhAdxM2wHzYW9ccfBavbFwHa12bb5d1znOPopLkyx4f1f/qNM9LR7y?=
 =?us-ascii?Q?BwPJGg7Y6y+VJUPbbfGBmotPKwzd5R4WGeGVW0exUMFbs2QjvIRVHIpiavDR?=
 =?us-ascii?Q?vRUfQn7oW2mXshkblN/ooh5/zfY68DLdTGcT7UVjLI3uK+XvVdcEZhc33+D8?=
 =?us-ascii?Q?p2IRmDrJMrbePGC8kQFbymFb9IlpN1E3c02FiHbvFNViLcTSQvLXkhjaHZi4?=
 =?us-ascii?Q?KKN6fBRd2NOpz+8w+SDzEXvA3/Z57vm3aXz0XxMdBULGxMiQ6CTcnjMeHE9f?=
 =?us-ascii?Q?mBFSsHcmhRvCaaj9gSmMuvqvSRu2JBbCN8V736Oa3eyuF879sDrU3N1sqVny?=
 =?us-ascii?Q?+4rwIwwvnc6pj6STJbdgSPlLi0sbovo6+cy39ea5vBb8LS25IE2mzVa6yS37?=
 =?us-ascii?Q?dY6FADxQChaxTR3PTWQubxiNKKB3JI38PSTvYrACrXL+E3oVMkIQqRzq3Tfe?=
 =?us-ascii?Q?G4JY2shv2nhV2DhIaG1+QKeJUWB+F2LdANDVp5EWoZrss1dfw491qCnodE8E?=
 =?us-ascii?Q?/hyz9IA/vgS5UotDFGn3NSaoKygeViEWMF+TlP6fRcNM5xO+QEg+zSxZpWEn?=
 =?us-ascii?Q?iMoUtZui01KshLikeBEM4GlOAhwHWG3y/hazKl2J5j5wur+Nb/wTH8bO0E3X?=
 =?us-ascii?Q?pZA3yxCbbEaPLNFF5d/jknCcd9mndlovxB9UuKtmZqsUWqBUZIcVd3+9BjBD?=
 =?us-ascii?Q?7TX8bjr5rqtCQXCXwxDDe9fYobLHUESejpotXA6fV6VH98Em5mk7PrbIcEFK?=
 =?us-ascii?Q?FdSz8kF4F11KAbbxVABJ0wm+qY2k2yG1L46o0UFQtVYfwuSsWYRCCy+QDY8s?=
 =?us-ascii?Q?zgGcEoyObrAl3iShtRLagrSaRtSkTA3wWjNmLB+MFerhnZykwC1j9biS58FQ?=
 =?us-ascii?Q?e11XEgjp/SUvoyLcdbojFDcWhWiRD+qZnC3YXR+GLzd5kRLGHpweEpGr/zMG?=
 =?us-ascii?Q?+1PLFV3MINGH807+faq56uGrjoNLhVeQtmVh3TBQAZ/itHxgkjXIRfKIkpIT?=
 =?us-ascii?Q?JZtaG1a4o88FTcKdsHS8QwTBac9YvACnQywuqqaJDibeMeNEqWAQMtDvnqvM?=
 =?us-ascii?Q?h2XYoPPLbeJKtAdNEL9NXYso6v8emJk0r722Bcf0HU5RQwyxx2n1FSylJKJN?=
 =?us-ascii?Q?RlpiWdX0u8a3IdDqbdr4FACGUlsq1gFYrTc3otrmQFHS7YOQ/u0qTumtIH2R?=
 =?us-ascii?Q?aj1To71gBpMs4lbCmAtWkqJe/QEqFLKYTECcOo9F85EwiWN4+737lMwbOD9e?=
 =?us-ascii?Q?NQeoqnqgtq8jMwJCLMK+bjhCD0rMrEs/4s8JbkP9QPEcYUX492jtm65NrtUu?=
 =?us-ascii?Q?bVECbFumomMzwzG7W/BZTsUS28b3Ed63s8lp8bC4YGTSCz4AGgKhTUDooZmK?=
 =?us-ascii?Q?6D72owbPkJSf1lO08Vu6zMgLKO1kie5nvLFeF/yOwq8PgiGnH7ql18LzvfQi?=
 =?us-ascii?Q?rXJk/hYovxLN2sbqZqFzcpvqqHuupwr0Nzz6R0tP0WCL2KfptNTTgiie/2od?=
 =?us-ascii?Q?wZL+oDnyQXQJoDEQMaPESwWSSnAn02CsR55O4WYZPXni6qrxfgmu/2234LJr?=
 =?us-ascii?Q?DY1P5dNpsMiHZrAQjp5vTTDsW9mZOWp7GBkU9EFbOFGvwJl4M/6EUnT5DQce?=
 =?us-ascii?Q?O3lhaBu0Kw=3D=3D?=
X-Exchange-RoutingPolicyChecked: V0mxaHtpF7HqapgmsKRl/K3AgEPHvp6FSO91ipeNKgFxj1S2S7np+hkvaGl2nZdDSfbaALix/P0dBLv/iuyhy4dNVLDEDr0x9l+fYgpEk7CJuqkm550mAxRGpij3KLHKrs34tpP4l72mIJn9n1WH+CAwaSmiCcTcNURuLX5h51uJ9JLkxtzNPcFYpvnqNGtX+clOQQjtVdURHRW2+k8vkbOblI+v2WNYf3VsF6CpVNSZAn2A+dOaoVFGdHrFU75sPYSl7NJW6NOkU1J6hw7ei9wQ/6P97CPZzdToxtCm+mE/2JR0wh0ubtPqB5oAl9MY0vMD4c5tWdOldv5x4k/LvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f6c243-699f-4e93-75a4-08df4be7e800
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:51.3736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pV6VQYJnEzZtsiHZtkCxqZNljRxq4SIJv40GZBAVg05g+1akHBw2PDmTwtPtbaJBl3ggSzb1rdE0VX56VeQUug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add igt_drm_ras_nl_list_telemetry_fields(), igt_drm_ras_nl_telemetry_get()
and igt_drm_ras_nl_telemetry_set() for telemetry nodes. The request
helper is split so that requests can carry more than the node ID.

v3:
 - Move nla_get_sint_any() next to nla_get_uint_any() (Zack).
 - Initialize the reply value and status before the request (Zack).

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 199 ++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_ras_nl.h |  21 +++++
 2 files changed, 207 insertions(+), 13 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 282648f55..177d2bc88 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -661,6 +661,17 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 	return 0;
 }
 
+static uint64_t nla_get_uint_any(const struct nlattr *attr)
+{
+	return nla_len(attr) == sizeof(uint32_t) ? nla_get_u32(attr) : nla_get_u64(attr);
+}
+
+static int64_t nla_get_sint_any(const struct nlattr *attr)
+{
+	return nla_len(attr) == sizeof(int32_t) ? (int32_t)nla_get_u32(attr) :
+						  (int64_t)nla_get_u64(attr);
+}
+
 struct request_state {
 	struct igt_drm_ras_nl_context *ctx;
 	bool done;
@@ -699,24 +710,35 @@ static int request_dump_intr_cb(struct nl_msg *msg, void *arg)
 	return NL_OK;
 }
 
-/* Send @cmd and feed each reply to @parse until the reply, dump or ACK completes */
-static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
-		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+static int request_alloc(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+			 struct nl_msg **msg)
+{
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	*msg = nlmsg_alloc();
+	if (!*msg)
+		return -ENOMEM;
+
+	if (!genlmsg_put(*msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
+			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION)) {
+		nlmsg_free(*msg);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Send @msg and feed each reply to @parse until the reply, dump or ACK completes */
+static int request_send(struct igt_drm_ras_nl_context *ctx, struct nl_msg *msg,
+			nl_recvmsg_msg_cb_t parse, void *arg)
 {
 	struct request_state st = { .ctx = ctx };
-	struct nl_msg *msg;
 	struct nl_cb *cb;
 	int ret;
 
-	if (!ctx || !ctx->sock || ctx->family_id < 0)
-		return -EINVAL;
-
-	msg = nlmsg_alloc();
 	cb = nl_cb_alloc(NL_CB_DEFAULT);
-	if (!msg || !cb ||
-	    !genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
-			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION) ||
-	    (node_attr && nla_put_u32(msg, node_attr, node_id))) {
+	if (!cb) {
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -734,12 +756,30 @@ static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
 		ret = nl_recvmsgs(ctx->sock, cb);
 
 	ret = st.error ?: (ret < 0 ? normalize_nl_error(ret) : 0);
+	nl_cb_put(cb);
 out:
 	nlmsg_free(msg);
-	nl_cb_put(cb);
 	return ret;
 }
 
+static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+{
+	struct nl_msg *msg;
+	int ret;
+
+	ret = request_alloc(ctx, cmd, flags, &msg);
+	if (ret)
+		return ret;
+
+	if (node_attr && nla_put_u32(msg, node_attr, node_id)) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	return request_send(ctx, msg, parse, arg);
+}
+
 struct node_list {
 	igt_drm_ras_node_fn fn;
 	void *data;
@@ -829,3 +869,136 @@ int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint3
 	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
 		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
 }
+
+struct telemetry_field_list {
+	igt_drm_ras_telemetry_field_fn fn;
+	void *data;
+};
+
+static int telemetry_field_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_TELEMETRY_ATTRS_MAX + 1];
+	struct telemetry_field_list *list = arg;
+	struct igt_drm_ras_telemetry_field field = {};
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_TELEMETRY_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD])
+		return NL_SKIP;
+
+	field.field = nla_get_uint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD]);
+	if (tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME])
+		nla_strlcpy(field.name, tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME],
+			    sizeof(field.name));
+	if (tb[DRM_RAS_A_TELEMETRY_ATTRS_MODE])
+		field.mode = nla_get_uint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_MODE]);
+
+	list->fn(&field, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_telemetry_fields - Call @fn for each telemetry field of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @fn: called once per field
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_telemetry_fields(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					 igt_drm_ras_telemetry_field_fn fn, void *data)
+{
+	struct telemetry_field_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_TELEMETRY_LIST_FIELDS, NLM_F_DUMP,
+		       DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID, node_id, telemetry_field_cb, &list);
+}
+
+struct telemetry_reply {
+	int64_t *value;
+	int64_t *status;
+};
+
+static int telemetry_reply_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_TELEMETRY_ATTRS_MAX + 1];
+	struct telemetry_reply *reply = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_TELEMETRY_ATTRS_MAX, NULL))
+		return NL_SKIP;
+
+	if (reply->value && tb[DRM_RAS_A_TELEMETRY_ATTRS_VALUE])
+		*reply->value = nla_get_sint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_VALUE]);
+	if (reply->status && tb[DRM_RAS_A_TELEMETRY_ATTRS_STATUS])
+		*reply->status = nla_get_sint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_STATUS]);
+
+	return NL_OK;
+}
+
+static int telemetry_request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, uint32_t node_id,
+			     uint64_t field, const int64_t *value, struct telemetry_reply *reply)
+{
+	struct nl_msg *msg;
+	int ret;
+
+	if (reply->value)
+		*reply->value = 0;
+	if (reply->status)
+		*reply->status = -1;
+
+	ret = request_alloc(ctx, cmd, 0, &msg);
+	if (ret)
+		return ret;
+
+	if (nla_put_u32(msg, DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID, node_id))
+		goto err;
+
+	if (nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_FIELD, field))
+		goto err;
+
+	if (value && nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_VALUE, *value))
+		goto err;
+
+	return request_send(ctx, msg, telemetry_reply_cb, reply);
+
+err:
+	nlmsg_free(msg);
+	return -ENOMEM;
+}
+
+/**
+ * igt_drm_ras_nl_telemetry_get - Read a telemetry field
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @field: telemetry field to read
+ * @value: set to the value read, only meaningful when @status is 0
+ * @status: set to the status reported by the device, -1 if not reported
+ *
+ * Returns: 0 if the read was performed, negative errno otherwise.
+ */
+int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t *value, int64_t *status)
+{
+	struct telemetry_reply reply = { value, status };
+
+	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_GET, node_id, field, NULL, &reply);
+}
+
+/**
+ * igt_drm_ras_nl_telemetry_set - Write a telemetry field
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @field: telemetry field to write
+ * @value: value to write
+ * @status: set to the status reported by the device, -1 if not reported
+ *
+ * Returns: 0 if the write was performed, negative errno otherwise.
+ */
+int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t value, int64_t *status)
+{
+	struct telemetry_reply reply = { NULL, status };
+
+	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_SET, node_id, field, &value, &reply);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 4980904f8..1b2a8f164 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -95,9 +95,23 @@ struct igt_drm_ras_error_counter {
 	uint32_t value;
 };
 
+/**
+ * struct igt_drm_ras_telemetry_field - DRM RAS telemetry field
+ */
+struct igt_drm_ras_telemetry_field {
+	/** @field: Field ID, as defined by the device uAPI */
+	uint64_t field;
+	/** @name: Field name */
+	char name[IGT_DRM_RAS_NAME_LEN];
+	/** @mode: Supported access modes (enum drm_ras_telemetry_field_mode bits) */
+	uint64_t mode;
+};
+
 typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
 typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
 					     void *data);
+typedef void (*igt_drm_ras_telemetry_field_fn)(const struct igt_drm_ras_telemetry_field *field,
+					       void *data);
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
@@ -112,4 +126,11 @@ int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
 int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
 				       igt_drm_ras_error_counter_fn fn, void *data);
 
+int igt_drm_ras_nl_list_telemetry_fields(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					 igt_drm_ras_telemetry_field_fn fn, void *data);
+int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t *value, int64_t *status);
+int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t value, int64_t *status);
+
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

