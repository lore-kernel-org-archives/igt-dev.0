Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4A1606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aRpg/NW7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XBBJ4XU3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1EC10EC52;
	Tue, 24 Nov 2026 21:42:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67D510F0CE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556165; x=1827092165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sTW4uUdCU/bF4TivrX3iV4cvvmUrhLpXco5ThX8e8EM=;
 b=aRpg/NW7BS/ouBIQqNUhWHetKyN0chqWQZ8aPjzcO246g/B/0iFVGYcd
 IX+ZH2DaDTGvkBqXhUewDRQAz7JB9Q1ud3RZxiRfrGMNPGdV0g7fMNcSQ
 1sZis1+jTRo59MNkEVyeefCg5a8gWATS789HyUxDBZ2Wd4xNkCjuM8rke
 FP5BIa/vFCjJ5zHmj39cLjifA2zYQDvCEQMlUAQdJYy6FIm3pUqoXQffK
 WRorwUtdXQQ1xdo8GyiL5GoEbQzoxMw/mTghZQEiPaE8f1W8l3meuBfqc
 CN+S39j0+oooXwkKBdILYKt7c5UEsUxQwYTGpRK3P0xOdwGmDml1v2Aww g==;
X-CSE-ConnectionGUID: 8Q6zukdmQjWNFfqgwPVanw==
X-CSE-MsgGUID: GsDCfc0wTXClvWe/wQlndA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4343909"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4343909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:02 -0800
X-CSE-ConnectionGUID: t6wk0UssR/Kj+uapjitreQ==
X-CSE-MsgGUID: TdI2z8jDSdGP8aY53UvNHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12022854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:36:01 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGTSzX8lklWxP7ixfVSZovfAjFU9X9icxVSFJmUR5831jk1/N5yeoMW4vWXOjHER8MEAqXHOj+i9eI6k7BGNQfwtD0j7njSVeKFykdZ82LsjMEKgje/1BKaJ5HJGH4xZIjFGeDiyXJSvOqz6P8/HK2aYqEtX/HBH7yVlbm5/BONJ812W0lOLQBFv6oX4tIgCGwKvVe/UXaicvMIzonUnHPqu2zZXNnFx2RmwFm+ttJaCYUSA5UmA2Fccm4dDrsaLU0M+eau7AeZmlflPctcFR+4vbR2hkW2PWZ1jbfDZoofGiDjsJHTCtuXU/n1P5o9c+Xz8l0HLsfwqoFaGrPScLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqhyJ7+90IkP0xU/NKtwJFqkEWXB1s130gT+21CZ3gA=;
 b=N1J0IGP6k2cIHyCf1rAmCHB5suxPk+HeeZ9HVs8cR0Xi6WdsjU83wX+2DF929OeaeFHstF/+rbz9U07vAGXPrzsABsDROCb63Lwgt5rM3rzKCDVsmjAX031dqPV8/CXBdbZa+u498Rlbr3MBuMbcYoHcR4x2IgDQk+nMaEv7WvLOrmujedNJ2Ggvd/pTigdQyCRGOYf1KGAECPb0Sjoi1ENPtoGva5WT+XA6TLxoEJQR5CcVn52SGo8hJFFdKg9eFM5Uo1CuWqSeyz42/1zvds4ZJC8Ttg5MYX+kR6MKGuv1ybwYQLw6/WDrU21wc7KmWvfBvI22lKrgCnroWNVOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqhyJ7+90IkP0xU/NKtwJFqkEWXB1s130gT+21CZ3gA=;
 b=XBBJ4XU3eyAfFnuqH0NxqPyVN398t0eGpbji/91uy2AW29UrMo66Pm7PupJJIGMDTsnaCZ9Is1w+YDoC1Vu9DuSYP4xtzuwEQT/lvvYIqojYgGPSI2OBRSOF2eeT/sd8u71IRa3nTuVSuHN5hDCRG5VJlkm7XVCdpqmjjqHnkb0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:57 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 7/9] lib/igt_drm_ras_nl: Add retired pages helpers
Date: Tue, 24 Nov 2026 16:35:38 -0500
Message-ID: <20261124213532.3674338-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 043048d9-9e17-4e56-bec4-08df4a72eaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261022075727099003|6133799003|22082099003|18002099003|261009223027099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: r4clTcv/aqrF2eRu515h5r8GFKdgO4C/H8JNQL03+1avalm86Kj6rbBfZ9bm+YfepFtka8VC/ieRy16dX7Oq0+LYtHm0/v/jkFS1fA1S1wpV7wg1tzouB3GUh4TO05adYRwCpmurQ3DnulfR2DgGHlQJzL4xpwO57WSec64H13buMagZv5Pldsn+oj0NRivNJR55Q6yavERBndoPqABIssMA/78IZ2jJAxJe5dC1PwplUcmlp+AVAtcyyEojPQjkUvt9rM5CcD8TvCTb00Ani45B7jGS0MRByMFkcf2IiOrTmVjbaBtITCfbEMF1yqALVOi8dGnlENSOn4kHvOBVgHx2SynytkzZWDNbGclqS0ZjzAyHkQ1Zg+HQX0gEP4Ii4Yo+9fwiassDlcLsn7nNR4lkLHgWP2pTzIvFGv49fXW935eVBbgejK5NsK8mgyP5D+mEM3LqwEfXuv1Qe7rs4b5Ft6kBfLfeKCd5UoYTCPF7WEAicVE9CsPfnBHHvsGnFUsLqR2QxMwoIKfzYff1D+GuWksL4EZmTXJmPG1/qmnQSjrXne5f9qJY9zH45wl+s4bKaFb7D0+MM/sxXZgMG0jWjLrbnyU5T3JiuIoN7Co5J/qqlBf//hLQvtQgFc1b67Flhg035NfPU8G9vYIzLp12RY7SeP7wm3Yr2Gr6B/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261022075727099003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E75cRq4S2Iy0Jh5H2Lib8EmdgqbnWfi8uGlM2ZGoUM/CfIQJdJxTWn5b/c+Q?=
 =?us-ascii?Q?FqfMd7EKmVAQL4/k1kbfV6V3ZTmhsoMJxQcRrpPMa1VmuuqybPwI1FKbHO07?=
 =?us-ascii?Q?5gs9nPD4X9xxDg+X62mu9sx6PfqQnlAIWNTlPS0Aw/lL6eYuKNZOGg5feQRg?=
 =?us-ascii?Q?U1rFe4lQhve6xk0LxWDfbMgYBeltx00IJs15rTxAHUjpPBWzAY30l/Zvyvbh?=
 =?us-ascii?Q?kkUauNgtlbGTS8tXt1AGonTWWVjLueK+OKxq+L9XvmPecutNTrlRdDDCg1dQ?=
 =?us-ascii?Q?4OXqlr3ieL2t/FgmpTLGN/3QtQSp31TGl7MiVlFGTAhVsxDmMpLMwNJnP3Z8?=
 =?us-ascii?Q?2zKeXc4sC++5DP5ox9GCcAB0iEtGYI6Qx0+PlWp3x+XBaV96u6bu0JBKSCIm?=
 =?us-ascii?Q?rVee1e0L04bFutvHaxQHusiJOXXjTs+iDIHhCbZJs/rEdrLMIMLc5e+KzfjY?=
 =?us-ascii?Q?U05AkyelVJ0+RfXdRnpuuCi4NQIE5Ce75HPGfSrlesok5xXR1nbAErdtSCgN?=
 =?us-ascii?Q?GTfcWFWguponyqlUR3/Hq3hBCnglQtg2xaqdjEmxRWfiAga96eD9ZR7mpYce?=
 =?us-ascii?Q?zBq50m6VG0y4YWD9So+PVFiX402z7pcTrC2BRpvf6wRr4LoXG22bLHRB4IbR?=
 =?us-ascii?Q?qDj76BYgeb54C242nBoz5R4+fL4d/96AVXnhPOIynuA0hmFYd7Cm1d5/qpO9?=
 =?us-ascii?Q?ITipMN5w9g1bF+IKswLTBXySqfoa6AWGZAeEMviFMCxyLB3Pp7s12gq7i8Oc?=
 =?us-ascii?Q?w4UBAMtAUcQeiRhI9cu1KK8zEk7TD8mOWg+I0WyJFKj+3jqnYlglIIGHFYI4?=
 =?us-ascii?Q?+PswyurfzW2RyOVhs2vJczpiIm+000HIxZzsPe55hHOTJ+lLG4r+EovsbQ6A?=
 =?us-ascii?Q?IKchC9ncrU5PWfJFdEghSMqLTJqvvAvPSoSBeDxvALioXCb6IkglyAuH6QYB?=
 =?us-ascii?Q?vD8aSQagTWCwJkAAch1LTDJqiAfGfkjoUGNNlFiM5hXgHnQv4ZCbAUNC8yHC?=
 =?us-ascii?Q?UHqRcRYg+FQBlIfs+d6f3JAQjbBzJhuHFPjps40CVMKnOaiIqp0+1dAKL5gO?=
 =?us-ascii?Q?XjTWcE82XFThnkIxywLx+uwxaGnRWmxIF+iuL3hoZbkAAkvMgTooGMEc+4JH?=
 =?us-ascii?Q?bGhqUPsRnPfEGB7dQOcmIYUykPbrGDzoldYxH+eZ101IL91VJ5pnFTCCLZ8E?=
 =?us-ascii?Q?6pWUgfSIRUgwy13IRqQML4da8AHjCZoGW/STScRuSqpdOTNcds7xgLQAEN25?=
 =?us-ascii?Q?j9duuBS4ngsnvsO5b+JPZJiiXA/s2vLjSCOI2uTl3EkCPlGCzCMfNA/ZLXm+?=
 =?us-ascii?Q?i9o+Kzkje8oISuG1xpeNfvGOJTDo42rnh2Ihpx9N6gH416FWc8/X9Q26mCwN?=
 =?us-ascii?Q?Jg/Xwqn5XMlRH0ipM8rZBMiZwPtNc+DkQ8FR+KiH5mXgxBnJdE/v3QmSsaj6?=
 =?us-ascii?Q?DdC1818CtjHZdkW67j0gXuD2ZhOPMXLPxIN1qeHttLCVXvu5cXlPQ1ifoQJA?=
 =?us-ascii?Q?paEod5+/gNgvQn2e5zflXg51pyKhJbUCjEqumk4mJ9suRaMwRf2SCU+/Dulf?=
 =?us-ascii?Q?IaDT64SLFdTcxOafo9fF7aDRPl3kJ6cHVIQVhaw1vqdfrtUBrtpGRDLrKo14?=
 =?us-ascii?Q?aJKFMuUONTaTPJwhFoFbE5FTsqRqtRk15uFIpkuLVfsuND4uVfJDxzJYAZJa?=
 =?us-ascii?Q?ikfKyFpUqnYTSpZJYQpQy6ZvuWZArTV+dOHiYfo79QXBzLwm/fWEJgnvwNCk?=
 =?us-ascii?Q?y/15xklWBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: J7DSxiq6heyNloIidBMsv7D2mhCbJxw/8gVA7zSwFtrXZvwor8E9HSokGcYl83TvqVv1TsaGzsuwazBWsMebXL97XIGSo7I6yHiVs4lRikklZ4F3HEndOX9oKcjScQDSkasQXjWp/Mw9Ah7gzQKOCO+7cKnFiLuvAwc6+USsT/2TFzcuMGeHkJ51PMoC7MiVVOUZfwoeHS7xJfd24YGcQEW3e/8hOnjv8LmcEVtOkLcaaWDwyJF1+/kPqCNWGbOzWnyjGF3cCYJQ3+o74PzAo4/47ElaHATo2QssinhMquWrR2W1PrsSZEPSSaymXXFyoaA9oQUrTgujnyg5XbZpUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 043048d9-9e17-4e56-bec4-08df4a72eaae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:53.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XE0idkExlgtV1JDfQVAu2+v4MIZ27N+Dw67NWZhdlOzFdnIfFvZbEdJDG6e37SWBCiLIjx4y9v7S0ZmKt/LQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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
index bb2900758..e47924470 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -997,3 +997,79 @@ int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t no
 
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

