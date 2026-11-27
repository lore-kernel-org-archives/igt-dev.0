Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA28606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mfa+mPex
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B710E0E5;
	Fri, 27 Nov 2026 18:15:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC03710E276
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803110; x=1827339110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aeKRghG8oinlOH0XayZZovSoPQC9u0u/HP1uafHpSKw=;
 b=Mfa+mPexNRxUo7olN3LcIEmcY3dyFUQ9pmRf9ENL8i3ep2ZbVqP7rmR2
 mFMkykElIkplkw0yYFrg5vg71fYwn07YcFRXCRfHsUFJm7jA9S2lOfzw/
 9kc2OYgcqnrxQtW2NJ/PgOgD3BHthfO2d4hJe6QElt16FWI9auzT3RrWz
 I/2sZrLLjXLHcu1HP1nOS603An8S9Z5EUhkYyom+IaOGbT373UY3GjY/C
 uH5H7x4/qPMB3hmjo1RkBF8xf5toyi12NcRm2qpbu6pTvVzAvb9TMAJNR
 D8pwxOqVmkMI+gkVfRt4mmnf82gHMwHyd0o26dJ/eA1A+kNskfdxXwpff A==;
X-CSE-ConnectionGUID: VW+0U8hITrGZ+W8V9s+FuA==
X-CSE-MsgGUID: DNHSlodhROmKlHwYhOZhng==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602878"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602878"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:50 -0800
X-CSE-ConnectionGUID: zI5olJWaT+aU5lwAyrKL5w==
X-CSE-MsgGUID: A0UZSVBITxqYU3sNk4W6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208060"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:11:49 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDJahT9slzM2z/2sg7tEueAKHobvdQPc8cbshYmCLs7HcX1XsR893wEB4XlVcFNJnVLqiwzU1fTQwZkklrNOqCe9hYe2cHbsMiNMlTII0ceIn4FEvR3U+XE+R7Lyd6MmNf8t0dOWsjow3P5yz+P1WqORPfyii0LhK2Z3xSOjaLZxf3Rr3P1sBRHq8AzHuY0AkFP8G3mjUATRQHsT8jFxGS7AhynnxTaljFpNdDrfRf+oHzPcYLrsmplXM2GpIBp4ZjbL7Jn7w1j5O60m5rtnCQHTLmPLQ0boirKtrUkQmYMmxoNKlJWZXeCDEiaOqO7apM6BjyPZfd/nPbSYlIk+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcEHB5DWcYjdaeAOVYp1NxOJkEtZ6p82HKXuifL3NOI=;
 b=uwdpJB9JAwppqU1eachUvsHLfF6s6tl31bY0K0D+qu2bagIbs2qlCgHdXEPOmJbl2LQEEmvdkcSVkl5dHw2xp9/csLAvZchidfZCiAOqHgQHw6jTiueSbATfIUCYS9CjZ4NSKkGwDUe/zLy42vbr31CrLhu8BU212BIknbq+DUmo6U2ZXejXzHbAJeukoo8T3c6cHeBiq4oJVMLqpNNzsFYJsZ8gGSIDZ4V4UMdl0S8xc7MzaIhFdjeyoYVLY33afnaaWPuy7luidSLf68103SDljtuj+59QsBLFIzb4xLR2YmoMPdvt2DChFFjgzRFrlW2kcEnDVoq6OQzXrBaCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:47 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 4/9] lib/igt_drm_ras_nl: Add telemetry helpers
Date: Fri, 27 Nov 2026 13:11:36 -0500
Message-ID: <20261127181133.801215-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 494f1052-85d2-45b5-8b5c-08df4cb1e6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: Afy89UB+Tj/Ee0Ikr1ghPVF4K9UJEvhQCLa/cfvT714gsF7u5qBKUS+zSC62SfjltJrG45iIWM1lDAqVTrRf3VlurrtHSxuAELDurL3rKPHq48ThMXC3sJuDMHW68dQ+a61f6+8nyQta8XVeYqcf1oE+oo8PFIzaIOti8xyQnfo6ROOtw+aweYelu55hGDV2W2p7a7QYKjUPOFXe0j6+DNaqym3jDvibHNtHcBkVbhtqwq8Sb3v7lhKloUDAyrPHHg0ASG4dqGhJlVeJIxnjmlv+YLFvT2eGmr0B/HwEem/OHOdnTjnFY5hYJS+3aG+zsSxjcSlo+nclEu1S5jx9R1BJJaLHMBsIa5uapjES7X4CL+pTpOsgdFP1LY+jCw9hvaslFPPOENmk8a3CId6N9riNByXffjHffhwXKM24jB1/fdTNc2MMsUM8pQSkDvDaMFW9hEKjZhOkLne/fOTsCOWmNahdKFFHHL0hfcfHvoxl7ot4/akNk+qgHlhRwWiMOFCsl1GakgFTX0s+Z7qkFV0FqLS7OJZlEFi5ZK+jZQ5F+ISTmeHgvufrlWyia+kQbR9DjrlZ/EawlonuNJn2YEx3QKvu++wG7pyY89nsv9LrbWGFnj0eElpwqGBBIM8aH08JMmRInUyoT++GidQN1qhGyAIm+rUqxmu92KC/1YY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IcxwLIirrSwNjnH1QFFgchcHYgTBXGypR+9rySY6t85VbIitjbIKV5dmtdHu?=
 =?us-ascii?Q?GxucKIYVOedezOJv9eoQjj6qdZH0hZO+Bt66BqjN3WAxjhTCqS7nCivd30PB?=
 =?us-ascii?Q?LdJkAUbRPJ/KIsBNnG5oKC6pybTYgyE/eZZr0jFBPf/VHsj1+eCHPdzx6/c4?=
 =?us-ascii?Q?eG86WyEkXi7BID/pMux11IHOcTg41OYtHhngMcyNK4714plG0MOxVg5MEE1F?=
 =?us-ascii?Q?I7X7/i1iFng07yvfC2qit44plvOkePb/L6SD/iFoQBLPiCthAxsvs/sS5Rmw?=
 =?us-ascii?Q?bSEn1kAY13EBp1BcE15eqvcRuv5EtDkuOBVlolA652bTC/xEvhwUc+JmcDbo?=
 =?us-ascii?Q?lkcahJ3PoRH4BZ72AN8y54jSF84S2fZdivtTRUNRJA0++hsbrmcdGuonS5nG?=
 =?us-ascii?Q?QCZ0XTOsaFcTOU2kt8bPnFCBavp/8KsyRXidvwvUqyXfMMclsSckJEl7mN7X?=
 =?us-ascii?Q?JQGX9aEvxreOezjT3qXGwEylgLRwiJ/Nk2opnKS/qGkW4x2og6xTv7ngDu1o?=
 =?us-ascii?Q?G/wUWrrBbVNUifNGGjdFdfe+zkrmxgIDzTcgQ5bhraWUNIuDqkbPP4AipSjw?=
 =?us-ascii?Q?fS4ZqAlAHt+xTblns9K/WbUbYmJSARQYmLdEvIVM0aUwsl4pBESZVOdisHff?=
 =?us-ascii?Q?K1RgXWqXMRz5uzKT0iBVQArdxEccAa6j95j0Y82kuKUW4hIkhruPYJPIyNzR?=
 =?us-ascii?Q?XbqQZxYV7CSHmgPvJePjTd5Srwno1S6p/73YXFuo2pzKvBHYx/JdRVY3m7Vs?=
 =?us-ascii?Q?MCbNXWZE8T25DamJHSFGU/IwTomiY4+dsgRvvW2sXrRflG44iyz/2iefgOQs?=
 =?us-ascii?Q?TZoIHWqyT04jZXEMrWLG5lFt8VU94W2WYmQVFVM2C/5xGs9mPSGTPnEcUoMo?=
 =?us-ascii?Q?MVOk0XKO3Nb7YSYTMoqRfUPC9HRwrHELR78s18lYE3gBfIhI95rRxrJ+vBZ+?=
 =?us-ascii?Q?UgffP4ZyjilfktA3sfVznXWKZcB8EtRo9KkQD4j/jtD0lLliv+HsVGDo+P+j?=
 =?us-ascii?Q?Z3Jm9Y6daWhsLVuOKXH8M8IFDyOEmJe1KFvoNWe+zPfRedpTUtH9Y5FdkQ61?=
 =?us-ascii?Q?EWsfrNYeJFTeHTJyPbE3kWzSn3hO698UE1K8jLGbsCE+mpCoPJsBHOxb0kki?=
 =?us-ascii?Q?RdxxU46KriQ9Mbb7suPNJyNn17A+zbLepn51Cxae/CsBTWTFopYqkMIbammS?=
 =?us-ascii?Q?wu55KOrk4ViPHmOv9Eo0Y7e3C4wvfBiE52LiIFculTx5GjiL+x/oxwPtWlbx?=
 =?us-ascii?Q?re3Z2YcLZixdT0oTIwDpZi9ms68idaj8mf9Q0hnqnecrqi3XZ/YqKkHtkRLF?=
 =?us-ascii?Q?4jESN06EcqHL9k6VyUX4B4Jwp2bZbPgtZOQdTWf7h0ajcqwRUFXmfiP6BoAq?=
 =?us-ascii?Q?52ifpAdQ/gcZFETOY4n6y+B7GchNqBP+D8N6huwRYmFufEPRt/wC4ApdxXU9?=
 =?us-ascii?Q?2w2dOiGnGtNe5++JPR8eiYEqUdM/3g1q5+iiQRcWHYVPdL9/wxzIGNem0Mit?=
 =?us-ascii?Q?G/w4m1OpfNiHRFK/5LC0lruYPjOorhsRZyEXBt59nmYy7T0bFetIpGdfzUrv?=
 =?us-ascii?Q?VLonG2B1rsRR4Tm1tPqWfxjG8noXICK0W2Hx7On9VoPr8o9RBZMCwRxVmF5C?=
 =?us-ascii?Q?aPwNzOhWPus3bnCJvDy/F/i6Zgw50+RNsV3lZrn1olSb8VYX9k4DTa8V8Kc3?=
 =?us-ascii?Q?jhGk8wUgcCOzynShUVCiUJOI0HsCTFNfUSzu/ie30JA8iCv9zgNhYR1NdQfz?=
 =?us-ascii?Q?AzCe6Pigxw=3D=3D?=
X-Exchange-RoutingPolicyChecked: eijOR7ZKMmS9DptvF3aM3nWb6Ov4ECcDEiyOn21+wXH0c1oCc8A3jaXZRg77O70bxZxLihAGrEwmsuJd10qQgzufd9hW3pVxV2068o7ZkAk7aRcw1/eEBnsodu74l4/05XHHQTvK0SRjbTTxceu6zV22g+WnFTbyZ5BWZP47e7ZkL2Tu4XWdCM+fZAGZFXFI1oFyrJLaFYTBh2y5jBDwhhmSjT0A62OoJSuMVzxOpApG1qxz+qhNYAe+YjXbqPlH8OAPQAGM7t+yzgrgj65YEEH+ZRHqJu23488ZTVwKuNaHPqsmb/1H7iep32BIsA4XmgprDHSg0eEuudUG9NluZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 494f1052-85d2-45b5-8b5c-08df4cb1e6b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:47.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmBnUjAV9P0DZzcPmkQJCew8QQ5a0DY2hceBxBnzs+Mddn6RPNqpEQ8/gYbbdcXtOSqtDoNP3ZPhtBZWJhFeEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

