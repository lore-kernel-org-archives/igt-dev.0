Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC8606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bjq02jag
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E09112CF0;
	Fri, 27 Nov 2026 18:18:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906710E276
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803122; x=1827339122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aWJEc37VmMO3fzwvdBaqC03r5Q+e+z58JFjvG9CPZ4c=;
 b=bjq02jagM17kX8ZHtWKHtewiMDXMhG3zlYsiOmJ4C4NvYtFR6Ah3GY1p
 7RzlYmb6KqlmXNtPa8tnOW9feLS/5nLuJ3tPbt6e0NYPAfU4f7sDoa95v
 O7EPuzW3luRdeN7XKA3xY+9VFl8wDZH+FFsHZSQkIV5/dtLy+Uj2akDjJ
 pKY1JgwPq/JEps2cBKKrcVBqKtpelDStFm99erBhUObKopiqWT7YsVvxX
 sxO7on5RTzfOPNdgSswZ99mp6xkuhxl2vktux3d2G8IvNiAlWhehc40TV
 M3KuVFv2p4fq2BW2c4t5whXyfEBNAL5S5d+bS/w3k9p4rDiHuEnY01LNx A==;
X-CSE-ConnectionGUID: k0XWZMV8QXGrvmNDvPFXxQ==
X-CSE-MsgGUID: 5eA4wN8ZTRCQNWqX5jB1VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602886"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602886"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:01 -0800
X-CSE-ConnectionGUID: P2Sk1ibSR8yq1Uh2ZRqCWw==
X-CSE-MsgGUID: wy3ZDRcvQ/q2s3YCQ0sxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208073"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:12:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwvfBlHqWq+3B3nQKD6C6MzvQDYMAvqpPdKjbZKfm+OKlTskfjM2IGc1ERtlZgHjFdwIqfEr1zqgz3xdndC3jkZmUS2aLq1oi3C34OXvcQkHu31+nOOGEwEmYvlIdnoGnQencQJCdZG9kkjmd5I9D4WZ5vBv2mq0asqTpLktgjJiFY0xAxvnrSj93PB/KzysULtBqvLav8YotLYHONygKalSzo3dhHvhVXy9cyyekEzycdNZZTgEIHg9AQdGNZhvhyuCHdAtFfk5NYmRDi+HjQhQlDTBeV4IshtKXj8XSiS6DBmD+3/izzQ2oqCJMiB356sPk6lzoezeKGfNqI3cjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLasNQrz6BxjKksQy1I59Ckyc3I17aLNl1w6ccDsLRM=;
 b=f/qj2R5KwNveDAmNFcVuuSfK35MXyBByczngtCIZSeQ8yFbCA4IyGMRk2uc2eYR7Bmom0oHWKLUa1UxVJ0WwEzxqq2dZkudaydCZrX1JnQH3MHyIwlb7nmcIan1lRQcxv/YB9lWwmeRKI8FOUd/HO+clJd/yEGDWAGloSGZGKi+teW7bo7XQg76omWp0BijGa6A10UoiVfy9ggd06GK/eDDpbvl5tHfsxCXUruGHX4CBGbBvBOzsFY4xWpWqBQ6wMDqa8rFI6DUmDomcglTajceY8zLZOXHUW3JRgaqPurxJEPTSHthLwtsNcFFIYr2VrCviYatCc9T1h+SLh5sH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:55 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 7/9] lib/igt_drm_ras_nl: Add retired pages helpers
Date: Fri, 27 Nov 2026 13:11:39 -0500
Message-ID: <20261127181133.801215-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: f436e3b8-979f-4b65-bb5d-08df4cb1eb97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261102123227099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 1MLr7/7DpFR18tepgI/13rjFKhMLzr5o7oD9p48GE0a80fl9wW7swZp6p2lRMeqwISz2z+5J/9+KSNPPm1H/Nr5IdLx2tAtjYdc/WzYRYmi6mVjR3rm+XAybS3BuxYC4cWap0sZIe6MSQ8tsKFimHFRoSlARXTpTmmV71cByYcLRCaEp4vsed7aFYJIx3IBlH7JOght6rdppQKd4XiXh5CxAQ2f4ZvmZzjfeDe86ZVqL80wrMJqMIIgw4jS7RLZVUNyedjZzX+OqeEXTjrXdfhfc+8xKxbIoNivj7tnL8ZKqVJ+ylX91gjEUYPunvtuRC/VDKnr0LKXn2gqmh1AKOU6AfSRfdfouWzslEvF6c0WDZOFKxe6lwzOGo6jhdCMi6zJdDTUdGsB61+0xzVTZVHHhKIUYiXxC9vZ1B+CREGJpzXBym0mArvKTmnpcze6P97GZlna/5f7M/adlcthiJVx1MomTysCQF+PYacPTey/DHEYxfJVE587PXaiO8f/xsViNxkDUAY5MbtTF7o5IDVSd/9P6qD5eBBa52KYB7z4xG8DtcNn2GLXMX4wwe6eLTjUFTEFVwz5U814UzSLVVc3dX0039Iw2vRWXOxKjEWRB+LEpUkGuIMD0qjVzNW2uEhQn3RnK9mXhU1BIGI+1Hs5E5uTAIqcbIwjeu1NGofU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261102123227099003)(261021121427099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXCknHP80B3s8MRo9/YiFlZUjySzdgQOUyNgFqRhxAZk3JqVo8czVLqluPAF?=
 =?us-ascii?Q?kupG7KPTECOSs68MNVPLy7g3DxZjXcxZnvG29KGoyFfS//PgCbaYzDrRKwxw?=
 =?us-ascii?Q?W7+rswbGzlcvMP+PFWJDTQVKn10Rwbkymm5YNu1iJYH+B2DduEXKSuSZF5Um?=
 =?us-ascii?Q?Hk/KcMXj7v7u3sRaZCS91qvrupXqXBX0rC7duhVfay8lmdddHnoU/5eoBWps?=
 =?us-ascii?Q?KW5gxYQ59MZXmAaOJvw87RzcU87kqTVCoq9g2IQUbc4Jk+PF2qysz3gN1r9c?=
 =?us-ascii?Q?0ZQyyYAyRwrs40DRJtVJsqGkvhvC5i+NUpSOevkVkKI8/Q+SbNPDnUvJ7KyN?=
 =?us-ascii?Q?AbIt0k+7nJeS1LkeEVDBdCr6pmgLe7E42d8OtKx2/j+FJ8PRhSesrItcJF4p?=
 =?us-ascii?Q?rnPbF2X2Xq/2kWCsii/E9ycJGKcnXW/wFV6P5JC2f1Im/m077HqziC2MBhh7?=
 =?us-ascii?Q?pL9xbsI5Untce62WMS4n0LpiNAJ8C/Q+tnGQ2leU8ek6fPkUF7fbEFooufpp?=
 =?us-ascii?Q?Y9aJSGH+9Lv2GKZO+MgfYlW7EHVVm2opE/0ixEW6eWXCYwt3CfrW6Ld/kZCS?=
 =?us-ascii?Q?4/CYUs0JZX73ZoRZIyuXbJV2E4CCgPBfo2UaXe0Vb40XY7Sa7BK8WL7FRBsG?=
 =?us-ascii?Q?20PunYly2SeKb/v1xftUwXxI8s8CIPYHdf7AR/qFi+LSkq9f8CuYNK5V7nkb?=
 =?us-ascii?Q?hJxcQlD2liY1kceNyvGbUys+qCglxchPz14NYLddgc92Ke8P1z+0aIatydlx?=
 =?us-ascii?Q?4vjDZcdMhiNGhvqm3d+lmd0uF5Gkdy3RMw/NBgjwkuxNfhZyOBrUtEjzYiTj?=
 =?us-ascii?Q?S5BiAajnd0YTFu+y8WeFxffnxtrXkRzrJl9JMh8Pfk2i083bzJIv2+TPj1uD?=
 =?us-ascii?Q?t5agAcLpxJ56RBhy3qb8G3KhXmXRQMCy/622amXib6kEYHajKkV9EmJJ6qL8?=
 =?us-ascii?Q?vPNidGhCTCSCm3xlR6QYB7OhM0ZJbK2MHqW+1IpFmu5XFSjIqEeVgZ+sz32I?=
 =?us-ascii?Q?9FD6G66UX8lplAUIArH/EKZR0M9QCV1rTr7w8bib8fyML34h+Qmgfc7kh7PV?=
 =?us-ascii?Q?8IzxFdPL49RLbxPGcklZ65/IZsdPZcQnbXWd94tU5qj4pNMvh+PKN7Hg51Tc?=
 =?us-ascii?Q?eWLz/k21rZkSeCX/tAhqOMQ1IPOuhhkemdpzyfjZmnfKiLT9Vf4+3ho5NwGT?=
 =?us-ascii?Q?q9TldPteoUt7Ia4Opj/UNrLnFVJOPaVGhIetot5xwqcBH2R1ox7oSvFKu4Ns?=
 =?us-ascii?Q?9FrlCOU5DIuzROpx0x7nkirYzUbpJ2TCDbeFDmfOCMqxGl3tycAZ0JXS1ft2?=
 =?us-ascii?Q?1DMG8TMAVE0eSHWMO619HuOV42F1fE2IWKePi45yRuvNO5apTp66E+1oAq2Q?=
 =?us-ascii?Q?FKgpsK3cQ8904IjmECJd5L4pmZsuYwSFVUyYKavxmvzIb2WDbBmQo3p5hkhN?=
 =?us-ascii?Q?VNF1rUyhBVZEzaMsUq/higaOXk3TsqNZTn0ZUJDNUKXyqGWm2CgikdfYSBlM?=
 =?us-ascii?Q?XwJC2iDY7ESHUmA4zlOlHzKXPAVKa8b9dXvkCY40XN5oagWm4UzS3UeyxMwu?=
 =?us-ascii?Q?Kyj2WWtRO7GerdtbolgDQy0g397wlWfMx1UU9toQRskulosfRoo2z4Cbmvev?=
 =?us-ascii?Q?CVF2tFlSpcFtW3HGh6bz/pHlq6nMbsXC8sbK1oq3SeOfnRycmaik4DXniIBz?=
 =?us-ascii?Q?INXRFqlwBxrGDgVGvZA13eFXF8j70Bc25OWNH+99Fu01rgxBtoi7zARr+Hir?=
 =?us-ascii?Q?FWPca7hL1g=3D=3D?=
X-Exchange-RoutingPolicyChecked: PBqgdzyZg7I3pVsMqUpyuVDDZQvFONCOGAMw66eZPgXYfRBnN2d8d4s0omkYds81UEBkz3wrVhzFfxJIqOzxrNI9XCuOtCyiZ6+/vRQid80qTD1xMVXRNacLSEaFlL5G674CEFIAxHOfF0nS2ycsn+z7zAX4b+WQLwcl+HDxNCrL3GUVkufuvx8rMKPwvq/cGrgvm1le2bS40pAXq5u5o+PJaYlGxfyXs7xcXeG+m3My5Qs19YSz9G8djKShHarbMOQ2AD4zi0y3RBCP7p9IL2PNQHcMQgxvFFSCOEk9/L/6v0OTZYl5gHutzdR0fAPwO/AccYbIX9yBuFt27gYMlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f436e3b8-979f-4b65-bb5d-08df4cb1eb97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:55.7338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJePj4oU+7PH5p7I577x6RMbuqYmJN2nygTwY7aKbwXQA8P4SAx8EkMZU/uGotCJe+YpWgFEoiNYWaJ6kp0tOA==
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

