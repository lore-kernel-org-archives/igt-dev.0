Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E117606A686
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTwFswY+;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FA/gMDru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400910EECE;
	Mon, 23 Nov 2026 14:59:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884A10E81C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445697; x=1826981697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uFDXVmbHbeejayuuZAHqFX7f+aTVA+zdtZWc/b8g2E4=;
 b=VTwFswY+yy+BCTT03nP8tMtN08Pq5J4pe0NutgBOSU343ZQyYpkAcloQ
 bzknj3ugDgyQrFSv2W0cWFWHvA3zJ3qy5fQGtxvZp7uonFhIxc8S1TmOm
 Fv8dTqUl05xynefE5T7j5bgi66ATJmfeSVeSVuRu/nKWEyS/AqAsom6ZE
 wDF3wDzyZtEjRIpo1HhO+4CGlJJGkwRT++bssWkNXc2QM6Xn0Xaj7797g
 9Be/PtkdOA65zjeKDlJSH/XrZ3AqKlAOZyRgZ/rqQ7HKOrbfEOIl9evlo
 1eJ/0lihSJtrZbFXcQeiV2vNWaikdVfHvPMYXIfHWxZkk5Q5DM7F+AkYZ Q==;
X-CSE-ConnectionGUID: RHaaZ462RNejuqWPmS5KJA==
X-CSE-MsgGUID: 0bNNjSkYQeykPEJNTHhuWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4307587"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4307587"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:52 -0800
X-CSE-ConnectionGUID: 4kwFVNZ/RF6bSKGpTe7ZEQ==
X-CSE-MsgGUID: 01m3UMwuQHivjdNpEdcr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11093574"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsrVAHuRTgV4RyF/utc/WV+20QoseLtIIsBcQQV2497qyC/9cQp4kcxd1A7eNnZAbdQrEDcgQOdPdlLq0BF+nZTIs/tgthmrl7LZk/kJGaFg4wpkg6KriGkbutwqJ3RRcujM5WXhsvqYxiqzgfB4s4rn/Qt1bIU95ofDbLr1nCvxyHV5PdgFvv4KZU+ImmUId5wNdANpeJhC1MZxi1OePKqYOcLJ1ZQEcr/++6Psn3gwEDWCmUTznWVuHp78rqao5D/CCtvN4NL6p0hqmxdpNDasIU0L9VWZlfdd1/DnOU2V2ft8AwoVJGjwoycWK4IggCh3Fx3fwD521s+xUB10Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pywKKk3iR6zkoyjHZmzJu+1XH9ihb/tf3uwA7Vcwvpc=;
 b=gSjuWOC4o0yfjegtpEAPbnT0TiLETXlSMjxPgTUwmJ6GpzGIDI2iHwm+22GxCCwVLK28eX1lf+b4Q+WL6lkkmEUWVzBJu69KtmMq1DKK/qUBq0DrUAjjgsXOetLe6ensBdRwnd5CeNxttIVn97kj7qVX5yfr6D2Z5dABXh0saigk6TIZQtMDZ+lwroK8vWiF622YGwgkYeo5bzHmMJpg1sZYasXaKuU1+RYNJqmbXKu1THAPW28Ci7dHV5r+sOXki5AedrdW//ukZ7jzCzttGO6DJmUVfqmZXblZSORrSlyVpVpXhOxLNsVSmep90kq9SCJEBwhrLXRqRF6zLfjeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pywKKk3iR6zkoyjHZmzJu+1XH9ihb/tf3uwA7Vcwvpc=;
 b=FA/gMDrudZRPGyAMd7VDjjiIBxs8XE/2NUJF6YpcHd/Ri87E1S2bEKq5kkEeqK338BuQjEWtFwlttkH2pPghWZ6GBH94HkLmXhcetlJ/OljE8tnWBYvfPd/vNoIfCEqDN162q4nD7qCd9JGaGmD2O0u41gmSSrb4og8pf08t5ro=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:26 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 4/6] lib/igt_drm_ras_nl: Add retired pages helpers
Date: Mon, 23 Nov 2026 09:54:13 -0500
Message-ID: <20261123145414.2243338-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
References: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: b6eecd19-9fbc-4816-f34d-08df4971ab64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: osDDAEAiAavRkgge+aEkcsyw9wOl50dnhge6IdKFVuEaSykhco4l3oMrTrB6OA/3HrCnb6XtmIf9zDnk9Z7gbPeplGRn7PrM4QUQvlRksdCmlCTTBLLLIUrYzyHgN6qaMKJD0TIuDpmpnuRpUXCIDJlr/4RG48hgzbuVT69t9cHZhU8Zvgz4eSJds4Pe/GiEBeNalmzs5u4vAqswGQUVOJdG+nNEEAYVgUwTh9FoXKxBwWPF4WObLrwC+WlffkTvO/WlYFUn/C8jbMgM4alojK9oXKr1RQPSWPXMUV5SecSYrK8JPqjQBxIBKF7n5HburQxBx47I4KyVTL8f5f7M3KmN7vhd8kR5ibNQI4fSreOimOenNWUoTiIsVTzncbSu4UkA1jE7KqIQ6CYIUiyCDtb8JoIcreJtFz98kDrT6PTbkhrYDwRLogqFesU23fQJcHhRmHmj/pf1SxbJxZhBFtRZJW32GrnIBw1G3PXQAwtJJluQsKWYrANy3XG28z3in0B0dOZwxrtUZN/GXQrtrENLUtOoDUqEtOrqSqUdumBjmB52P+jqvA7mK1Vl8XuRnb53qpV6kWfQm07Uyly6P3S2hd7JCvFcza4xbT8RRh9/uIEucuuWHwONhkR3qLxZTH155v0exkYR3cqH7aD4W4j6J21vEsyp5nmf2B120eY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xeCr+SUwH63mMKHR2cThan1fGyYCcKotUmYLTgIlfuJnJ+RT4uOX8i7tw+a/?=
 =?us-ascii?Q?z/5Afrus5dYdDe5Rsi/xl1QjNdczJRuy/9kpOcyTvygzaBE+fWcO8kiqJigq?=
 =?us-ascii?Q?IkUUvx0tTdA8flj0k0679HFoYV2XJuBvgL70RG27JugjlpkJK2CstIxzOoQ2?=
 =?us-ascii?Q?3ebu7QSmHNqU/KUo8hXEM/1525Iearqqi57bmDTHKmSb6YyA5bX2Ak2iw1o8?=
 =?us-ascii?Q?5Wg3IeW0ZWv4gBLX55LusF5FJdOr599E/JlOnDHDkn424WHsjcsenrDD8o5N?=
 =?us-ascii?Q?V4Rvsc06ifzQpHqFFG/yOTw+GEg15Xm7oUoEUizrQjGdMVMuVSUdl+mcXTAc?=
 =?us-ascii?Q?ZqLFGK1Ta+qxgR4E6c8ZHQ6oobp88NUP8h0GcUsZBil4GtHLX869GLZajdhH?=
 =?us-ascii?Q?4fkTLe5T35IKAKQmyqFSNdnqObzH478uMRunv+Sph5M/wBNee++ZvICoKIpI?=
 =?us-ascii?Q?LMmPEufo5+9JbWcke9E+iaJEvklQUa+PJUfKGkUw8BfVOPGHyWo88Ccf9gqN?=
 =?us-ascii?Q?7ASrtp5iw0Jbft5v1vVvkYqXJ8cgf8NoAkxrcJLLrSRjFH/4pDi++5e8wpLt?=
 =?us-ascii?Q?FCHp4Eae8+pYlDnRDoaFbozRpf7oVpoRy96er4y7OtygGbG7babYL00tX6Mk?=
 =?us-ascii?Q?mEjmYsUMI9fNXBle1XcngTQdOAYoPxJjEppRlgG3BjkrgByz6KrR2QoZa/Io?=
 =?us-ascii?Q?Wtao1Ko+M065JWLCNBx1agr9aRDz/XADib1nIFfRsrZNapvyoGSzygcuaFYe?=
 =?us-ascii?Q?IONN8ld/DZWXpb4/Jtf1QJFyyJ389BXECfwZ5cuGalf6uCVTy0tMl2Kv8beA?=
 =?us-ascii?Q?s+Kh2wEVRUjsZDHoW/KB+cMEsg2QRSMZQWieC7HIQp8uyszOQpcQfx0xt1pL?=
 =?us-ascii?Q?gf54RUy/wEdbmEIoUBiIksZthok4RYw2stUROaQKXhaZExbps60P5mdZ67ly?=
 =?us-ascii?Q?2Fc5beWTFgyL6mAseYLwEvYW4f5EvarpgjMW4VjBK5Yoj4UN7veJ33P217CK?=
 =?us-ascii?Q?NAMlxZtdO6Ll+x79rDTwYHW8/FQedQ6YWEMdLES1X1b7OtWTCFGw29lbf7ZG?=
 =?us-ascii?Q?bm3FxhcGvoA3vrGctUSiw0ztVcboyV8ogtNbUpxoZQSR6oAVAMz9YgRxxrkQ?=
 =?us-ascii?Q?MjmqKc4Ul8Nxj5B7ZU7MWLPdaXWslnzKTK5y+kM1vwa1TV1fCUHa+sVLQL2n?=
 =?us-ascii?Q?+B3BYXwT8cxSQWTO3m7aEw/BsBqW0eS9CqfsMw9Z5dlYDGggZmgITtQUqZMp?=
 =?us-ascii?Q?2/pi9y5UVVNrl4YLiR6b7qFF2hgNNML+VTyEvUbFt51atH9d4MLgydIeD/Ei?=
 =?us-ascii?Q?Jq4Cg8Kj1k/WSPF8sM17V/c98vUpdpWnUScxyB2iNAFNiq59BOEKQ+TKNsES?=
 =?us-ascii?Q?XEKjCoR4nCfMYTHGk+rQ6atIftIhCNkfSunGKIEAVEfrCBOV/W8hF6oLlqAh?=
 =?us-ascii?Q?j1in0V+pmsvCPvwAFqiwPkMjJeiD91z0QnXjvs/n70jk0PfD8ZVZuZ2poFRC?=
 =?us-ascii?Q?GbQ+N9O0kC1lfE43+TI/so5cMJeIIOQDtxSR5EVMdTw3JWNR35z8U5bA81sU?=
 =?us-ascii?Q?M6FbWTDUbcQdOOPNiuCa87atLlKr8iDY6xTQbMDJ8Nss9rYtkK2yb6lAGCE+?=
 =?us-ascii?Q?Z/7sUwfMF8b74d+/IGgd717soFj1DEQqC/VXrIcjKSKj9mbXDi2HWrixGouk?=
 =?us-ascii?Q?rk8jfA4SyXrxfHR7SdwHKHtSH1Wg3qVqHgMj+wucEOTyH4Dkcd1Nyo5DOzJx?=
 =?us-ascii?Q?zZZieuOWjw=3D=3D?=
X-Exchange-RoutingPolicyChecked: kSsf7qT7AwaKB/JZbNmMgXaVzrp8AgxgeHECxM4WPHDO9F65XMO+3ijE6u/xPfABs7fMQhsOqv0ro9uLc55XoZ9ka3CaytVkNFoF2ewuKSYOHTXfChhlf5tgvyYHgBewr/83pNGxnIYT6b2JUwjYZuJ7n07JEXfRFbGoAbBuGKaWA8HrVfIPFqCAI66/cl7x27pAUXAIhQKD6idvnv+wq58YZzqR/48GyXGrk4rluFIuT3fHazk8y/vbIU31nlqy1U5fgsK8fJNHLVOd4eFau92h2p+MzE1Tj5k+/47tRmt1G0N/513Gbg9B/nrXE0L96upehaVePW9hYCAYQwALhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eecd19-9fbc-4816-f34d-08df4971ab64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:26.7159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy/TF/g+YSNREgS5mZ+bCToSAHi1695TeUpRw/4CVbR7BcTyn52y+NQH8jHtSH1mi632by1FTe0Hmz86gIKznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
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
igt_drm_ras_nl_list_retired_pages() for retired-pages nodes. The uint
attributes are read as u32 or u64 depending on their length, so libnl
older than 3.9 works too.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 81 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h | 18 ++++++++++
 2 files changed, 99 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 282648f55..62336aadb 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -661,6 +661,11 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 	return 0;
 }
 
+static uint64_t nla_get_uint_any(const struct nlattr *attr)
+{
+	return nla_len(attr) == sizeof(uint32_t) ? nla_get_u32(attr) : nla_get_u64(attr);
+}
+
 struct request_state {
 	struct igt_drm_ras_nl_context *ctx;
 	bool done;
@@ -829,3 +834,79 @@ int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint3
 	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
 		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
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
index 4980904f8..996defc51 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -95,9 +95,23 @@ struct igt_drm_ras_error_counter {
 	uint32_t value;
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
+typedef void (*igt_drm_ras_retired_page_fn)(const struct igt_drm_ras_retired_page *page,
+					    void *data);
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
@@ -111,5 +125,9 @@ int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
 			      igt_drm_ras_node_fn fn, void *data);
 int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
 				       igt_drm_ras_error_counter_fn fn, void *data);
+int igt_drm_ras_nl_get_retired_pages_info(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					  uint64_t *max_pages);
+int igt_drm_ras_nl_list_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				      igt_drm_ras_retired_page_fn fn, void *data);
 
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

