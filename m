Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75315606A329
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GsczqZy5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=czplWCpt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B84D10EA03;
	Thu, 26 Nov 2026 18:09:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE689112672
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716373; x=1827252373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aWJEc37VmMO3fzwvdBaqC03r5Q+e+z58JFjvG9CPZ4c=;
 b=GsczqZy53K3LHbMNyYecom+Y2cECqSLrtYe+z6SCTmXC/Hs06KBxdUZY
 rXt7gUSkS26BtraLwg9xY16vbnte+ZsQ//EoUfn3VtT/W12q2lY33j0WW
 Q8lR5UIdd5cgoyhRg7oFKG3aZgZDUNPpQW7hXF2Ah5lvaGCIlvp/6AkOY
 FVwiAXZBD3mPYklY3iAd369b8q2RuQeaskrGngA8ot7h76ihgw5gnlwgb
 k2ht48lD2npIkxuJ/Y1l4vPE9YNLnQEBAIfgubysLVH0KE0XxHGXAbcGx
 7Al5VTfBkmgrgVc02WlsmbXf6Lfu4vkLvndOsPKdK7hgJFDmgoRDSXrWt g==;
X-CSE-ConnectionGUID: q8Rr7F4UQ02XRB+VWsJcmw==
X-CSE-MsgGUID: XBcHBYNaTHShzbLi5uqUBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541072"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:08 -0800
X-CSE-ConnectionGUID: VIyd5DW6Rr6quRo97fXQrw==
X-CSE-MsgGUID: z74438CJRtiDtVXcV5BShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12830219"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:06:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXlNx9ImT0f8wadGDCZitsx3WwRY2i5BPl0ikPiUlR7nKmC9WXO3gxl/xy/ev5gyQmD/V8SSP31X1atbhtKTuqLSIR5YBvtJSqzlnuBD6Mgxye8inOjafKlEP4jxCst3bzISrpURqRG8rGhR/i8KDG7+H17av5nJyPCqz/3CqiJkpPqTAOJA1Z1ql1Rkkd0h1pLCNY0rTZwMecxaIpVbSe/dIjJugCSr5fEuwEsXRoe/ZJE2uExBDhGZQfNJwlQHenj+iAM/0MPoLcjG5CCiJsaw95JeVQzOVkUOHdlna/2swf414LtgGH10s0+6KHRdM8dBNJFK0+oF4Ea3OnDURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLasNQrz6BxjKksQy1I59Ckyc3I17aLNl1w6ccDsLRM=;
 b=Ub+5IMJwzk/1n97c4TsmkCSD0/mDuKGn0u8/iChPZdda6M6vy0KVQO0V3h5hrWZ9GnuN1fDgMNYr0idMN78/nmfDlpPPYE34cuWBsXnrm3jY/HA41eKShsfjYjWFy4LR5/HbHgRqTrdwVAj2jjUB7niUSW9WDqJbh1x7WsAaaSmDReYTSRVDIFUqY/xKUT+9pqQ5fJeGSG1takaW1K904B79HWxUUAX0YWC+pw6m0JNohZjujr1gmJ3g4aJUAgowZ7GA3PcEr6eWTdq16+NV82NzSataFnbvdn0Lz8hFMCFDnNZl9KfAB4as0tE2oSFOg0F3xky6mZmfQ5982pfTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLasNQrz6BxjKksQy1I59Ckyc3I17aLNl1w6ccDsLRM=;
 b=czplWCptrnnxMdAKk2rUwplbqmKpi6Sy/N4aWssmYkCymlP+MpzP0Y2FVB3AUHcLnyh6d5Ap+s8G1DtACO1QnpOMGvEcjwRAvWWE1KtHFbDeilYvmX0sZrA/ncjTZ0cbR8wLPz2+P/GFDkxJC81I8pxMyOWfQYOKVbCA1ILrP9A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:59 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 7/9] lib/igt_drm_ras_nl: Add retired pages helpers
Date: Thu, 26 Nov 2026 13:05:41 -0500
Message-ID: <20261126180536.487442-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: b86b077f-488a-4d65-03a4-08df4be7ec91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022075727099003|10067099003|56012099006|11063799006|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: b4fmKVWBDRq+sF0o9sMLivcHwVIvYFctRW8MnVZZ3NDDwQ3Heeip1HQb5au2TEqlS2Elq+t8AbB9Pv8t/d416L7PXrB1uJ3sW+FhYldL4nLZSYUJo4nWcPFgE60sDUzzGAJF31q9exxjfHQOR+FhIh5w7S1yQez/DOXrW+k+G3dAfGNhNkhpMjaDwALwJIGKuxIaO20r7FvdkGPMCiNA/Ij/Za+rIt4t2qdmn7TaV5/cE1KTl8NVIZLVGaeBhUJUJWbL0yuwqf9yIXRcddEk3NgEkf3oWeoD/2LnbFeJb40s7v/MtFjd5RcAqD96HLfgmuSYRFShcoL3/FZUInJZr/DcV/Gjt4EBaH2AYqvZXW/OE7Au4xQKiyIYgrh9SG8n/2BoRvdq+77mVk5AGZAsTZyKXziAVB5HIV3RF79JgO8LBdzZQcg3T1W6WXDEsEHnlTaLSBCuW9oyK1bKqiSNXSGs/lZKYn5iW0ZeggDqUc8kbJbwAlT4jIIVqocBfU2Qtspf0OGDarxtCUuauEDZKZaB/8aF18bsmqbr+7Mt8LjTv3UyAWJgMFGlBT99PzOEhZ14+JihJ6mYlpzaEdaEGZxt/48C1nBNXLde6m5o4kKIB+dt98UAbA5qfv35OOtUlTtbbs+pgXq2jIKNoq6qgXtuN4tar2+VAVBbjpplE3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIzUAEPY4s02ghTFtVsqgWqhRfF74bkzD7gJWVsMQcY1G1CVTlMSjt6U/dsd?=
 =?us-ascii?Q?cCXdvQK3SaIcGMwmwk26KEA0/6Ld2ZKV81DN738JmCZtD0eXBBL2s3loqheT?=
 =?us-ascii?Q?orP96iu4wkT13QNPcZWXXo30vHo8AjWH1f6sKh62WLQdTZ9E22B5iY93a/Hd?=
 =?us-ascii?Q?EHBGZURnwzADuvXUhWnaofoWyTEVXEkQfDGf9KZHL7JAlX0+CTrR2W8gN44F?=
 =?us-ascii?Q?i682ra1yqpUc22z6mGfXuJ/tWtBVMkHf4v8QaT2Abo4e32t/1qEfDBXQQfvu?=
 =?us-ascii?Q?bfHnEcV6JAnXBx5Yly0f3rPngUAy7SgOsYZpHg79jYFXB6BPrzlxFNwwx3Qj?=
 =?us-ascii?Q?QIWdtQENQ1y9XCKA8LWZ0fUnQe2R3IwhBRauQjdqgcUhhTMETagY8hC3ZSm9?=
 =?us-ascii?Q?apcd8T6TNnEXoecTkLlBXryIwoqWDc1iSemdpsix3K1W4NtdAYvruQLoaqVI?=
 =?us-ascii?Q?LXzbhvD/xqMUh0prDcDXkBmopaHddb5MT43L10PKjyUsxDORysvCm+wTTZm3?=
 =?us-ascii?Q?RplxnJytxqtupDzB4pI3poT7o671f4OARw19+7SQd37/YyxmssuTLsAulDE4?=
 =?us-ascii?Q?RWrTW9iJXdAyzqojZkM/Xu63TA8iFYSXsBaWh47sQYE/az9ttFxXbdiEjXOJ?=
 =?us-ascii?Q?qdg77wXCZlJiJkL0A9/EB0Jmmq9rMCgKWz3R/Xi8zwiQ65Cyco6N9XAkqDkz?=
 =?us-ascii?Q?tuxhnnWOc5BjNxUkiCsnzKsy8fzXx9BE28Te3Dbrv/3oNAnuuLwOXQdArd8h?=
 =?us-ascii?Q?VfwiuVXwHj/fu22A2jYPSYt4qqm4LmGHGcKq5sdLLAj+Va5CmM5nhorfcHIj?=
 =?us-ascii?Q?tQWnsRJXENVXXLTUahjpJ8vvTXwf0V8rCNVZU2Q2BjCV5DCKZFmUO4v8nOYq?=
 =?us-ascii?Q?MgPCSTGXbaWoSJiHZQBkDQ6Ofm0HBsjuO8j3HQwQ2WhUxsr2cb4c0/GRQecu?=
 =?us-ascii?Q?MS5fHDwsJFXIPI6zmcgybWch8ZdNecaSeJ1GbZWj1r/8K2INw8b51dQNJVP6?=
 =?us-ascii?Q?eXdk4iY78qhrC5zZKK5p9T+JMUQCCssmw/8GPbTOhabqL+yf63gFkCVcWzmo?=
 =?us-ascii?Q?4naB1upvE7vER1MZ/qZ1mMddbzNkkD16njce3I/7YznArxGCVewiQHhfW4rK?=
 =?us-ascii?Q?bbtJFxTcaJd8z2Aw6WQoS2fdz1S+Sr6JLhx/ZK+o1Mqo8PjJIchynhi9cEHc?=
 =?us-ascii?Q?AVaVERVWohUD67ReIHbLLGqMduL0XVgrYVxe7HbV5jsIrJW5ln+vuN1uuKIH?=
 =?us-ascii?Q?kfu19YnmkCIi8ym6meUG66/tFUMzAgBFX4hY525mnjQ+u03IIQkegcx4JmTt?=
 =?us-ascii?Q?5D+AEz9sAMrPUcU8nFXzaeIVSmCLJQd6FvPM69nHkl1CVVD6c2yHJFbBjz34?=
 =?us-ascii?Q?MDdx5QiwFHuZp1RFZeFbH/1Fj4HhkQgq6+tfHHN1QBIyY3apRrJpniLNtt2u?=
 =?us-ascii?Q?dm+pJkFuu7wb5ri9//D3wwXQ8H/kzWCRiDQL5QwGkU12WNUfru8Wr890eC/j?=
 =?us-ascii?Q?17LW1cgaP0xDpoFWKcoeHhxGkioKy4+bYPoBvNn6mICmr97aqn50pE+2+xHJ?=
 =?us-ascii?Q?rQ8v6FoPjyrvj41Mlza9WOwyjNBFgUJH/OMiOSGk+Kyye+xeC/Yp3EU6xVyJ?=
 =?us-ascii?Q?ls4IL+1YdMtybg1+19dsCWvF7RA+4hSIUbU4LgmYwaIA+w/t10nBaHrBEjyg?=
 =?us-ascii?Q?j1am7DQxytShOE2C/suWoI+Hc5T+oMVIsYrGgRc2QFWn8nRd3rptdht/OsdT?=
 =?us-ascii?Q?Sz1Ge4NG6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: pYlbisL89oivpR4aY/nmoVBiWO1Mdn9qby6bLxo5993BfLCvePmHoQUTAXbEZ0JpNfY3FV8k3pNZAWAFiYqECAERbyKrwWeehayNYAwDOZ03DZbuOs+t5lFYzQoIeJwgBtZ5FQGFJmkQJvcwHR526j4UJWWOvdoaBC960AZZSnamTymiMnTc3lhEjPQ+GDlz08gI8fvwvN12oOvEVw27UPMY3BjjFFi379APRU+RmfvVb4KSbwuFoFBeSWBAQl2AcsAq7KrYEx3iNs7KL/E2xECS3t8uEsnmgda8zfKNoxKy3gx+7l0uKVAIBaGnsZI4nFvb+ib5RvLqHsaVmtaVHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b86b077f-488a-4d65-03a4-08df4be7ec91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:59.0334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5Ec3CYOwBxYUZBCpmOuX0HOzIifhBSKpO0bMpdEEGwDAVgjb/+RGO/reyX40X2NUNQyVn/CeJqYNj4ikD18NA==
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

Add igt_drm_ras_nl_get_retired_pages_info() and
igt_drm_ras_nl_list_retired_pages() for retired-pages nodes.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h | 18 +++++++++++
 2 files changed, 94 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 177d2bc88..45173bfcc 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -1002,3 +1002,79 @@ int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t no
 
 	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_SET, node_id, field, &value, &reply);
 }
+
+static int retired_pages_info_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX + 1];
+	uint64_t *max_pages = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX_PAGES])
+		return NL_SKIP;
+
+	*max_pages = nla_get_uint_any(tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX_PAGES]);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_get_retired_pages_info - Get the retired page limits of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: retired-pages node ID
+ * @max_pages: set to the maximum number of pages that can be retired
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_get_retired_pages_info(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					  uint64_t *max_pages)
+{
+	return request(ctx, DRM_RAS_CMD_GET_RETIRED_PAGES_INFO, 0,
+		       DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID, node_id,
+		       retired_pages_info_cb, max_pages);
+}
+
+struct retired_page_list {
+	igt_drm_ras_retired_page_fn fn;
+	void *data;
+};
+
+static int retired_page_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX + 1];
+	struct retired_page_list *list = arg;
+	struct igt_drm_ras_retired_page page;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_ADDRESS] ||
+	    !tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_SIZE] ||
+	    !tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_STATUS])
+		return NL_SKIP;
+
+	page.address = nla_get_uint_any(tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_ADDRESS]);
+	page.size = nla_get_uint_any(tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_SIZE]);
+	page.status = nla_get_u32(tb[DRM_RAS_A_RETIRED_PAGE_ATTRS_STATUS]);
+
+	list->fn(&page, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_retired_pages - Call @fn for each retired page of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: retired-pages node ID
+ * @fn: called once per page, in increasing address order
+ * @data: passed to @fn
+ *
+ * @ctx->dump_interrupted tells whether the list changed while it was read.
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				      igt_drm_ras_retired_page_fn fn, void *data)
+{
+	struct retired_page_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_GET_RETIRED_PAGES, NLM_F_DUMP,
+		       DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID, node_id, retired_page_cb, &list);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 1b2a8f164..1abbbcdb4 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -107,11 +107,25 @@ struct igt_drm_ras_telemetry_field {
 	uint64_t mode;
 };
 
+/**
+ * struct igt_drm_ras_retired_page - DRM RAS retired page
+ */
+struct igt_drm_ras_retired_page {
+	/** @address: Device address of the page */
+	uint64_t address;
+	/** @size: Size of the page in bytes */
+	uint64_t size;
+	/** @status: Retirement status (enum drm_ras_retired_page_status) */
+	uint32_t status;
+};
+
 typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
 typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
 					     void *data);
 typedef void (*igt_drm_ras_telemetry_field_fn)(const struct igt_drm_ras_telemetry_field *field,
 					       void *data);
+typedef void (*igt_drm_ras_retired_page_fn)(const struct igt_drm_ras_retired_page *page,
+					    void *data);
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
@@ -132,5 +146,9 @@ int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t no
 				 uint64_t field, int64_t *value, int64_t *status);
 int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
 				 uint64_t field, int64_t value, int64_t *status);
+int igt_drm_ras_nl_get_retired_pages_info(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					  uint64_t *max_pages);
+int igt_drm_ras_nl_list_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				      igt_drm_ras_retired_page_fn fn, void *data);
 
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

