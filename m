Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42328606A33A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iMinluTO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hIpGdAHk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B7C10E74A;
	Tue, 24 Nov 2026 21:37:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1C10E74A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556142; x=1827092142;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6QorhscBLaL1Q9416qZMatrzWAOK/ub/xGuVXQ0qvMk=;
 b=iMinluTOSJnqxknKr7fuyFIxJd+1mgO1yQAA5LhW6a4F9cG3iO2BQQpk
 GN4O9YkdWxOZUE0EOnCV0IYZyAwlh8PShS4TcvCkHqKee3QxCt6Ld+zON
 iTIupc1LPlTU48h3PPRknxl4vGoGw7UH2DFHJHhKuTl0fq/IX+2mCcMWO
 EzWrtZpy42mM4APPlNqQzyBOZBZR3p+BO88Dvw9tRp4d8MI54c0Z3aijJ
 PuHcOXL/5/lmamjx1hXYTSLrcVLbRzUnMt23gKycEnUrk3aEzULf/7jlj
 p2okyibXx4cbc0f5qS+I2Y6K+U4WUpOK8Ararv1L+LRS85ZiJp49gD7Ha Q==;
X-CSE-ConnectionGUID: 40y2/jaFQI6Ik21POBClsw==
X-CSE-MsgGUID: nvcSDEloSZCMnyxytrrUNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4330235"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4330235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:41 -0800
X-CSE-ConnectionGUID: bp4JesXtSg69yI3h3wDRPw==
X-CSE-MsgGUID: G4pTbWB3SHeRnzhJwRJjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11880973"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:35:40 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUjQyy5HfPkGS91ViDyAH+nrBR/V3rzlhf56LCoisMBqIWjh+H2uOuh2ZajuR4F7R4u8QnudbO0xGIJl2MX8zYA1cmYQpKmKA2EHxRxc7CtLofwabI9WAnVl2BZh68TZQFVvGKQjs1oeThbu8q0l6tncqpEpURDOmLheyFBxuO6mNO/Pj7Pk5Skw4WShirU8LXvWFU1Wjk/P+Jj/HMokA/09015UC3gusn6PntpJYL2S6SVvDORcrovzzNyiKJcNfdPlDSG4azUFWAqxDZwe6+BR3oAQTfWApkTEFfVbIbNANpzG+Ek3L5pXy5kfDEBNjXcs3zlqfa3Ct9R1p52WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=O5pHqCL/hSVIb0i3vOL43Wpij0RbeBYty50eaEqqGfHwXraWOh1ZQZO+Fzbebr2VZJUau8KHyr+1mGtIoQhzbmbn5aq4t/lmnpY/XaThfjvQVj2KeJoihXT57hnvCyA+i1VCJS89NubyRNyAjhf2FL+S04LKg2ReXLM3vjGImImVQ/q6JWx3b8N8vmd8anLNoj3/jfrGR86U+iKHOSoHTknDyD6DBVF1M057cvUITMylU6QscEXZYLh/t0jC2zwMtlUzjdA5JMiGRNte9800QOXtcFDnnGOjqQzQJXKIMbOjRf6cdsj86wpY17EKbYW3NAjAY/7RYdophLaC/sAc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=hIpGdAHk3R1RTIH4RI3aUtgzDizbTngkNJpNdDFAr/2+BXrnSAo9GiTmRea7OeqhpEW3wkukpy1abyKqiLkGhd1uyvLDie0plue13PcU2VMSdXbsUjHgvEKIYA7K0j0iZnKmNjR6CXDr37Y4ZfpMsGAVRG3EUGwHnkhvP1INgxs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 21:35:37 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_drm_ras_nl: Add node and error counter
 listing
Date: Tue, 24 Nov 2026 16:35:32 -0500
Message-ID: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: a17f6c02-240f-4c26-13ea-08df4a72e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|56012099006|11063799006|261022075727099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Ezise2N/OcyubxsJS1qmZxa2blVg8vlYmP920Df7SCMZrhihl7scJHygydMuf0p1U50FQcoO6pJDR6/yOOaNFxFR6uhHLXnls5fG8L8XbYsGn7tbEtXxb8JWL0f3RtKHEOTECjcfkrCi6zw//o9HrYDkAFOsdh934//X/u26Er9XzuWvcY+B2gGeOtKeiwQKEyaDikQ7d0LQ9K5Pn6FJ5olzbfcVgMnRgcOZ7wjn14/joIjXCXRZmXFVo4BlrBncKUp75S4LgxyJ/0Yn00abzPTyoqbbQO0p11D5jciRPwneRlrQrIndB8vWwjzuKXAcr5u24nnlSH2goZ4UZic/KRiay8mqyDNWnEjCbAENbzii81Rn50YgXUNWvWcDXRWO3uyn2Gs+a7leV5BnmJpsn3wwKF5QXXRc+4VXGvlRrjsJQGJL7cbsCuJZSU+x2qLyVoxL57unBBZWhbF6m8wJKL5jMlpjKMsNYgjwPEIB2WBBKr+JMvdI8y9IUybyE8gxkcZyF+hSi7JLyuGo2EDLVJ7TDT3TBV4Gqu8mwks15JQ5r8qJ5ivCY65mysDC6FmkhBjaoUv3IKPRmLPhoZq//areaS4XQEd9Gdp3LMJQBlpRGJWz3RwBgoj556XxCERE5tnkUtvITYzgDeT73Cr/ok8YkP83Ozk0sKzVgzD0Xz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qAIRVQOPfSk4uFRnwU1gHRzmbr4X13ZXM0TRDTHRUChA39dxxsn77/RncvZ?=
 =?us-ascii?Q?TateWKcrb5RCeN4gkl02VI0vVTMvPYKL95L2W0pet/AFJVst0sBvxGu+u+Zn?=
 =?us-ascii?Q?baprASneDN1PpRh/akGn3ZewZM1plR2sZY8OtNnOdjblrrLsK9vnDLtgbI2j?=
 =?us-ascii?Q?Pd3mJ6UO3o+8iLwnMsEVNBNH8XTbPQz/i7un0GgC65OzCsJ79WQJ2rXjMdku?=
 =?us-ascii?Q?71qe8WCmg2SlyuY+lKnMF0HTP9rM+X2TNutPWmRgweOioanm3+PORhqi5QJG?=
 =?us-ascii?Q?TtEUIuZfM+utFWgbNZtrUEWEeqD1L0UJNbEdsl9Xx6RLr7c+/bCaotyXOetm?=
 =?us-ascii?Q?NLxapNFOO+fVTUyYAp4txsTAFO45uohfdyxcU3/Tw9jyYyt50eWqpOIL7yTK?=
 =?us-ascii?Q?Duday2YGBsKF9PpgZMw/+EYpZGcIEROX0KDGq+djUoWBY241SoOp/9ql9etV?=
 =?us-ascii?Q?cQ0KKqNngJ4q5pRQ0KUq2bqLTZgl39iW4Tm8J7auPem2pRTp1IT7Pitxn4DI?=
 =?us-ascii?Q?y84CKoAyPIflCBAkQpkdjcXzrin0SaNNjP973aNeXpGEgLuaxLN2bdMtrxIL?=
 =?us-ascii?Q?BV5ttzEigcyxD++sW87+FGkBNquKMEXevnMrORHQMS2sUCXFkjtc8srBbx2t?=
 =?us-ascii?Q?h15sZ5RR94VIBcE8n7RmOeO7FoxAF6AdWKWjY26HF1DY7yuakJJiJZitC90+?=
 =?us-ascii?Q?uOAZYaLLa1FW34DZS4NMH+nobrcD0kEtNjLy5U8dD2WRBB5YhxhuOA6/52hv?=
 =?us-ascii?Q?h2tk7YlTGOnwslGNXf74W+JWRGJ0K/GsvkYx1zrqRF0j6LiFkq5quFgOZm2N?=
 =?us-ascii?Q?oMi0svAl20ZjGevfhLlIR3LyE2BR306vX10F/2Z6mampGBVfJfiyMs/gqBSv?=
 =?us-ascii?Q?HM0h3/ugfjsFSkkjrpdQNBUGXRqGMa0hUuy1eiMKgTCTrzlJ0iJRfWb6ToA6?=
 =?us-ascii?Q?9OSm0PkaDYbh5d/8qV7tj9zEg/FcJxCd+MWplXAHQ30qi9231WgTRWsbPkwI?=
 =?us-ascii?Q?QxZJuW1FWoBtJcOpA82pIfXm5cBWFcIwPJtrcg1EpH0pfOHe2rZbTNn/f0Y7?=
 =?us-ascii?Q?C9TjMTWs8Q3mCR+jlA6iPyHbx8N/dkQqfwx49FmC3aQFFfdlNn3FHPtqVqv+?=
 =?us-ascii?Q?sH8QNCaUGn8KIBihCEBKuPalxxCW+xgXGn2H/KxWQ6zrpfV72Wyxx/XznK6y?=
 =?us-ascii?Q?PUmnz63sTQJG5eSomT01in/6ixcn30xEE62JI6CqYTsZ4eEtIWiKAVYgv7n5?=
 =?us-ascii?Q?bk8UrpPQG1yE0clSSQRK3qgKtYrgKh9+B9pWZLDga/RJxfGJ1mucqWqcuklp?=
 =?us-ascii?Q?UYFs1+l7a3SOg4b0NtKSr2R0I0YdvxIjU6jvAqtBY2xNSRB//tZ+vvGEYK9/?=
 =?us-ascii?Q?ijkmC2ek8hmtkE1qO+TltE06lyNxXtM7nujI8nqm+G9hknW/KW6vXPmizDfg?=
 =?us-ascii?Q?/bK1qkKaGAwn+I/gIEoyQ8U973twFJtWIfirhRHHqqJtp+Igg8kPYs/JdDpF?=
 =?us-ascii?Q?NV2eKGxt2jVvBRHYuiiqL3oIG+wh8oFis5ytDqZ9USFrIbhm45m1Qo9AcwEM?=
 =?us-ascii?Q?qhrSsLakaWyDVkd3OOnMuxxTdiQQNFMqChnBDzcSsbWMON7LpGUd4idgJ05s?=
 =?us-ascii?Q?v7vQYNowBwjEShuF6HhCQIHhYGFCSUK/4lhVF/VCnjUmcDzX3WLTF/E/5fCF?=
 =?us-ascii?Q?9nhCrT3F8HdUN/nIBn0GJrTXqNOxc0ZRvVC4a+IjCh3YRKfq6Q1m05/0ykbb?=
 =?us-ascii?Q?L4yAuWg9vA=3D=3D?=
X-Exchange-RoutingPolicyChecked: MGNsXPBiFy8uHCmZZEVtoO+oKuMlkGK2NrLwevCNgaj9BqgwzFgvWKnwnt9wZ+krSiG4tS0w/QoqtdKZLAS33pz+iBytLbff4ThhUJhQxWA2wNxDU6X3OVuTOD9nY5Nw5nf5dep0jYPIn0ig/2oUUMFSm6+t/QMCxkv+sIHJBimdVufHUFmEkOf0ID2h1iVWDiWC6fLlEbZGxDFWZ1Gn1K54y9bnluPu4ctNST0DlasGw/LIiUZslowMUH4YDLZG8MBzxM61LSe3vQTPxImgw1zT0SGI/8iyBQjSn0VdM/DZ4feKRW1uKMT9vO4D6h1z9KDT+2dMqNGZ20B/YC6HQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a17f6c02-240f-4c26-13ea-08df4a72e0db
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:37.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLFfG26Hd4mY6rh7tomDD8HJm4WSvQUK5v2NPctGfjyrROQRq1qXdPqTGbBmTgWY+lSOdrL2DsCn7iQcdL2oqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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

