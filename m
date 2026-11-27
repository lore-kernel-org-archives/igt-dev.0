Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455FB606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1zuMLlf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D110E0E5;
	Fri, 27 Nov 2026 18:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3196112CE4
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803102; x=1827339102;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6QorhscBLaL1Q9416qZMatrzWAOK/ub/xGuVXQ0qvMk=;
 b=h1zuMLlff2CDUDuoJ6EjeTO7mgZIkCNP4r2nILepSmXt0IhmVk5DgBgo
 loeYeZUBU6+liJL/v3yToRHoZSE++lpt0t4O61MNu0EgKNv6kh7zD1lKv
 IZ6ziVU0omxn0vMb6mgbYRgz7r1ddCMufoNcnE8OYXQ1O6KNMatBdvPhV
 FmHbl159N3wEuYDl5Tambi5gMxKx9lvW/RJgG1URkt0tOE74KjFrfSlwa
 lzROXsHZXduf6eosw7DNH5e9jnOrrzr0A0eTfF2kQ/djEDp9CwGifMJ1q
 dHNF1A+/MHNiSuIkXRUY8v/dvAQTBmOpoxZRts2R3Sj/DY/ED+feubUS0 w==;
X-CSE-ConnectionGUID: pbP3QIThRXiwCj0nfAM6vg==
X-CSE-MsgGUID: z1+XGe/GTf2f5DVeDOHGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602871"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602871"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:42 -0800
X-CSE-ConnectionGUID: LSWum/W7QF2lW7WHmrnkPQ==
X-CSE-MsgGUID: bpU620J9RSqw21VbqOTPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208048"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:11:41 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnqPUr2W9Pq47vU9CYW0+nm/vKWwx9ikNuK3UsRnCJGRpC6kbz7MLgF2MoHsMDmUyK/IjH82IJawEOMtVCoPFSvFum9MmPnlm2DICvLaenaJPkwqsmuukY8rgeNJRiWuwVQopDrKkldVwzYc4+tUJPxnSoe1p3ePLg0tKu3czsgM7tzDwBVTu/bv1MYXhtHOCnzT0AcW6wXAsqHly99m3xILJT1wwvk59S2aymPEIKlrWoB/aYPYGdWhWlCOK1444zDalJQj/zwxKjRdsFTfcbwH/v5rtIa3b6MKQc6MU1p81ZscwHcHVsfMT2JjBkM65Gf6HOR4UOB692zK8ZtRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=TEZUb8DAkf8DjyTQKjBqSLUaNyclOWHQYLbXYvpogLJFQZYTrq5eA9bivm1PvmSiwjMbKpyKUVrM1wuS9qAH5l+67I6nPhfjqfg4sIoro2sY31IuKI0oFgETAhLJiLqTJC5UcX8mDiY7tecaG68aPdsYTQFgTIQji6cxslKE1SGwf0R83zIkhEZeZ6uymmm5iichfnwWVfuk5STdjobGvxGdiB1zPQM3IkJI91w5RcAMzad7AjEsCmfqEl0TH8OzsYfYoc5EkHpi2EWuBiv5gddSCpRNtX471zFBfdnteliDyM6unXUflIPXrYbNBcADpzwKUEXrHBcmow+xiUUu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:39 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_drm_ras_nl: Add node and error counter
 listing
Date: Fri, 27 Nov 2026 13:11:33 -0500
Message-ID: <20261127181133.801215-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bde016-36b0-4e6c-7613-08df4cb1e15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: qyZ4bBW7KaS37IRj0OKKPrqbxzMp8FWKext6dFDYmeAq7eKnStBSoRttTSpp/2cTh7+K7PstXwy7qEPhdape6KHOxtrhwa8fvikuaxUq9/OblUZzv1QIBrC8QyjPJ+WIFkBh44IHwzpLuK+vVfPRvmMl/2J5jEETuag//HOsTXzr+CWrsGZl6wk3CJxf0IaWWr6i3Le1Xg8PHWXHXHoqsJ9Mw4uXS7F2cSDgpjmYWgSsRtd3ux6peIg6A+E8yRH416/h67JBE4+KNum6c4h4IpuoxeKdNOFyvJn04O//A/GLzEIgO5posKE4205FXCdo9yGd/rg2OWbByayOupB1JuU1VmFuSb0GdOFGslHhTSoTL1EHioORvsvI34AZ9/2wbbWsZHLH9/6PAouKecC3Y1doh2a1FjQP6DpVSiw3+pJEySkJzrgofzjyOBxvuRTBzkMIhmYgOL+EZGiMVJCCJrcUJQbwN91Z/Mn8IaA5cw8C+4XYUPC0TQg5kxsuMFMJH7NwGpntujHOxI/W9fGby86YnklSdpAHKBVpHsetHunLb5XH84q2hpcB/Bd0uE3fsGBs+ledgs9ghx5ZBWYwUGaYtHxColWVBADm7gk5JwmTnwO4wBb9vSMV30t6uR6UE7dcfGJxoYjxy8v0lrLl6ufCbgbJcwnXZCapBouLD/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbSbaswQLjTxpCZ4/x8759DwvaIzIT/n2KJvdqDkSGbNhkXASV4/siyMyik8?=
 =?us-ascii?Q?r0/dbem+Dwh0pIk+VPBCaXx+rR2OR1Sd49sH//i1fiYKYqtG19sRi8MJn4rn?=
 =?us-ascii?Q?z1IgnwaLxKOF6Y+u8icNmfHHeu0iUYMn6Dt8dGxPab+LF1YdFpgamB0rRKgK?=
 =?us-ascii?Q?SXqMe/3aXJjGOW3WnOVwD+1qVsxGS2juQl8zenCy5H2LxGOi5CrOohJWKAFr?=
 =?us-ascii?Q?kmSM7CHCwBa5TxulXdKLIkZlL+NXCIhn1BDOHNXR5FEK+Xn53oOhdLNZyu53?=
 =?us-ascii?Q?JMW2fuknhGEN6S/oM+Yw5osm8pad+e6DtvgP0xZWeYjwx8UAFYf6QaDaJ+q0?=
 =?us-ascii?Q?h1zN89+xMj7Qapg9Qef8KcvR0Av2g1Jx1w527o58Q5XyRUj+WuGMQcLqj4HH?=
 =?us-ascii?Q?ll8zwugS4Hld+3C92r7jsmr3hCiOp+z4hZJxZfCwtVn9GxGL0/mqPxK72rcl?=
 =?us-ascii?Q?QK1FAKNm7CFI68zyzpSOmNBftw+pGPwMnV655/eAoqXpDCBoHkVINs3XaFCu?=
 =?us-ascii?Q?OBt8IWTjae/klXMtItxyzEIh8rHy7BFa7pw590WJK4E+p/7/CzN/k3lMEs8p?=
 =?us-ascii?Q?L8XXsMENCW7Y3EYK5eUeH1IXXDZ5/zc7jBivYaI9TF/Ob+dFd6ZK6f8eQGE+?=
 =?us-ascii?Q?I3c6Nu+80fd0dZ6cc95/KMXh8Yu58ysj7EdHLfgo6/MRJglDSZI9YIJkyp51?=
 =?us-ascii?Q?gCmzXkStCReJlW2AOKcemvwJhelYEQ4mq2V5Jdz9K1it4OgN/x4b4xd8oxDM?=
 =?us-ascii?Q?GBiZkqHzcTm4iE+9WSheFePv1fOCMeynNuJr1Xci+03HHJnPIgn8u6TPd0Qg?=
 =?us-ascii?Q?2DRVQ0yAEz+BtHTmuXPmV1nJJdML6RyyUIgRw5uBcI885/6vM2rl6BKuRpzm?=
 =?us-ascii?Q?VExikCnN07X8nIT+SjiEGLVYlIRtdWcj64ndqE9W+17VPba7yd05KHGpYNSD?=
 =?us-ascii?Q?TClg/Yxs8thUGDSjhf8fccZiUxXhUq/OTu//d3sxxN9F20VeVW0fLrMCHdoB?=
 =?us-ascii?Q?kqk2mIS8e8F8b3p2g7F2EQv1gICasyOxsqDRIJW5Vh9mZ3N+pvJ4Jb+gTPVC?=
 =?us-ascii?Q?kFwjU4M0duqwc37XLeViiwRYDDdFAHIKp40gyX3XY9uEnfLVLv/2XUIQEoe/?=
 =?us-ascii?Q?AhM3e2mJDIvPi38J4n68jwhr5Uz1CxT+szyJbqQToT4PmKCtmUDR43bNYB5C?=
 =?us-ascii?Q?DulZalPslouwR53Xp4ob4irnWJPsZulQ0HGbi/EH7pE49cBzo5NKQLc4nAee?=
 =?us-ascii?Q?4LtOVioZL8gqkzLESQ3t36Mtws5+GzC0K9A3o6v+TDlkhlx4TmwtrMLpm9K7?=
 =?us-ascii?Q?osLC38F/5BaYFhZ9ppjnCcrCXM+M13FC/pz9EPgvDEHnMX1H98KFsEYe/Ab6?=
 =?us-ascii?Q?l4f0y2InvgoULPfIboNfWp0ZGGYh+C+3+qvHphG6f3W133GNTVg3kpsiYT3a?=
 =?us-ascii?Q?WJ0ZdW4JIXff2VbkVP4wDurtd0XVFvYxOmwcby/ButDdwnQnvI6Tw/CDRt/L?=
 =?us-ascii?Q?3Lm044Fu0KDUgHbzrNwfjy39gdeXugO7oaKBPQ0YfACRNWDCjW8IB/JuWsQ8?=
 =?us-ascii?Q?1sKlM/ipmp5kPBvZd77fCXuEaRq71BoW8cKQVf6KRAKc6qDQX2FpiLyfsQkm?=
 =?us-ascii?Q?25f7q0HBJXWwqR6bNci4PEBihfYLxQ7eL4VauTQp4fVflgWXaOKjN65xXpWW?=
 =?us-ascii?Q?9pAb+Tu/M4uG0/06Xqj0LZjw1Z5nTjiG00He7Bu1SlRwUV+FMbxLFTIjVcGp?=
 =?us-ascii?Q?IUdAuwOfsw=3D=3D?=
X-Exchange-RoutingPolicyChecked: CW7zQZjWCmFBkqpJ+NCZcA8aKm9cojwDW2KJxU2HRUT7N70olZxRL9qI3udR4cs952DwMIHBpgKVDtFVWrMavllwk6oYoAuIUpHH3sjpjeM3GvNCbcTXVgGQEmlM1Jn+8pjreo67knZothJbeMw05WMRio2Uezf72DaltRXyAjLtQe3q0UZD8u3XdANW6W+nrU/dCPat1YhPxQ+vadv7HUAcAJq3Qdbr4zza3nWjmbA7jSFhO8o2JJ01XMrdt+wAWymvtdRHzx9f5MrBo01DGTOxNdBelTCwzIRaNSdZU0c2QO0y8k2mDRawAHZHbuMk9IATDnVSHJPJfDFF0CrNOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bde016-36b0-4e6c-7613-08df4cb1e15e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:38.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXIqr5akn33vn+AMNYLeJ6WSq/r0xFv2BM/WIFyXEMmdSu4TCuHSuZ9vEV/EfOvGwrutaujvyE8j0afJ82NB3g==
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

Add igt_drm_ras_nl_list_nodes() and igt_drm_ras_nl_list_error_counters()
on top of a common request helper that reads until the reply, the dump
end or the ACK, and records whether the kernel flagged the dump as
interrupted.

Enable message peeking so dump messages larger than a page are not
truncated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  39 ++++++++++
 2 files changed, 211 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index f7ee3e373..282648f55 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -398,6 +398,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->event_received = false;
 	ctx->family_id = -1;
 	ctx->subscribed_grp_id = -1;
+	ctx->dump_interrupted = false;
 }
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
@@ -424,6 +425,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 	if (!ctx->sock)
 		return -ENOMEM;
 
+	nl_socket_enable_msg_peek(ctx->sock);
+
 	if (genl_connect(ctx->sock) < 0) {
 		igt_warn("Failed to connect to Generic Netlink\n");
 		igt_drm_ras_nl_cleanup(ctx);
@@ -657,3 +660,172 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 
 	return 0;
 }
+
+struct request_state {
+	struct igt_drm_ras_nl_context *ctx;
+	bool done;
+	int error;
+};
+
+static int request_done_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct request_state *st = arg;
+
+	/* A dump that fails reports its errno in the NLMSG_DONE payload */
+	if (nlh->nlmsg_type == NLMSG_DONE && nlmsg_datalen(nlh) >= sizeof(int))
+		st->error = *(int *)nlmsg_data(nlh);
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->error = err->error;
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_dump_intr_cb(struct nl_msg *msg, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->ctx->dump_interrupted = true;
+
+	return NL_OK;
+}
+
+/* Send @cmd and feed each reply to @parse until the reply, dump or ACK completes */
+static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+{
+	struct request_state st = { .ctx = ctx };
+	struct nl_msg *msg;
+	struct nl_cb *cb;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	msg = nlmsg_alloc();
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!msg || !cb ||
+	    !genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
+			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION) ||
+	    (node_attr && nla_put_u32(msg, node_attr, node_id))) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, parse, arg);
+	nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_DUMP_INTR, NL_CB_CUSTOM, request_dump_intr_cb, &st);
+	nl_cb_err(cb, NL_CB_CUSTOM, request_error_cb, &st);
+
+	ctx->dump_interrupted = false;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	while (ret >= 0 && !st.done)
+		ret = nl_recvmsgs(ctx->sock, cb);
+
+	ret = st.error ?: (ret < 0 ? normalize_nl_error(ret) : 0);
+out:
+	nlmsg_free(msg);
+	nl_cb_put(cb);
+	return ret;
+}
+
+struct node_list {
+	igt_drm_ras_node_fn fn;
+	void *data;
+};
+
+static int node_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_NODE_ATTRS_MAX + 1];
+	struct igt_drm_ras_node node = {};
+	struct node_list *list = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_NODE_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_NODE_ATTRS_NODE_ID] || !tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE])
+		return NL_SKIP;
+
+	node.id = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
+	node.type = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE]);
+	if (tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME])
+		nla_strlcpy(node.device_name, tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME],
+			    sizeof(node.device_name));
+	if (tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME])
+		nla_strlcpy(node.node_name, tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME],
+			    sizeof(node.node_name));
+
+	list->fn(&node, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_nodes - Call @fn for each registered DRM RAS node
+ * @ctx: initialized DRM RAS netlink context
+ * @fn: called once per node
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data)
+{
+	struct node_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_LIST_NODES, NLM_F_DUMP, 0, 0, node_cb, &list);
+}
+
+struct error_counter_list {
+	igt_drm_ras_error_counter_fn fn;
+	void *data;
+};
+
+static int error_counter_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	struct error_counter_list *list = arg;
+	struct igt_drm_ras_error_counter counter = {};
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+		return NL_SKIP;
+
+	counter.id = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
+	counter.value = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+	if (tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME])
+		nla_strlcpy(counter.name, tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME],
+			    sizeof(counter.name));
+
+	list->fn(&counter, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_error_counters - Call @fn for each error counter of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: error-counter node ID
+ * @fn: called once per error counter
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data)
+{
+	struct error_counter_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
+		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 46d31599d..4980904f8 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -62,8 +62,43 @@ struct igt_drm_ras_nl_context {
 
 	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
 	int subscribed_grp_id;
+
+	/** @dump_interrupted: Set when the kernel flagged the last dump as interrupted */
+	bool dump_interrupted;
+};
+
+#define IGT_DRM_RAS_NAME_LEN 64
+
+/**
+ * struct igt_drm_ras_node - DRM RAS node
+ */
+struct igt_drm_ras_node {
+	/** @id: Node ID */
+	uint32_t id;
+	/** @type: Node type (enum drm_ras_node_type) */
+	uint32_t type;
+	/** @device_name: Name of the device the node belongs to */
+	char device_name[IGT_DRM_RAS_NAME_LEN];
+	/** @node_name: Name of the node */
+	char node_name[IGT_DRM_RAS_NAME_LEN];
 };
 
+/**
+ * struct igt_drm_ras_error_counter - DRM RAS error counter
+ */
+struct igt_drm_ras_error_counter {
+	/** @id: Error ID */
+	uint32_t id;
+	/** @name: Error name */
+	char name[IGT_DRM_RAS_NAME_LEN];
+	/** @value: Counter value */
+	uint32_t value;
+};
+
+typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
+typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
+					     void *data);
+
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
@@ -72,5 +107,9 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
 					  const char *notify_group_name);
 int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data);
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data);
 
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

