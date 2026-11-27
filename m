Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BCE606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXgYhfbE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E87410E0E5;
	Fri, 27 Nov 2026 18:13:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208810E718
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803124; x=1827339124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8rdg1mGZ8GAoPA47AWsxdJLArXgsYwPvslGIwl2Khb0=;
 b=fXgYhfbEERVL/ed1q3i5gs4GV4Jr1Ht+V7zSQWqbjX0MsE5h85WQedCk
 E4x11DolpzmC5zTY+ibV+XpHqvH3gpl+otyVksFAeOiiuBc8cfn0AGqFt
 N8kVA88O4iDqNPagYHHbp1bOCARornwFVeRNJk500WsAJEs2vn6CvPnjS
 AzIVqGa7Y0upXLrzKoZz22bnDjBYkSO0hk8yr8LZ5+7EgPutC/TDA4rlc
 bu0VEL9Qt5UGrk0At9X8h8pFlDHW5eSo63zSnKuW2Ms0aPvMopNevecU4
 RKMT0fURcCOsvhph7jfR36dhiRbvg5dvv2H7ASB2cF2zj/+PII81JtB5U Q==;
X-CSE-ConnectionGUID: /0mEGUvqTBq3cnH3BWmZVg==
X-CSE-MsgGUID: FvX0s5KDRxCWmWCs0foLhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602887"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602887"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:02 -0800
X-CSE-ConnectionGUID: mpmWceIdTImEK0gjyrso1w==
X-CSE-MsgGUID: pCXdMgQ1SUu+i2T2HturOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208074"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:12:01 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM39JQOCC8DXlFniIDp4pefngt4vePS6OVIjJjBhX0egJTqaSC4gxcjEcMF6KFe8U9DczyPjuDSdHZWjuxSignLN4/c7cQHgnlA40T9MDvUt6uvRjYp7I/69oOy56vFirGcyHScPS+6GY6bH+3Sved2KgVVixvh9xsWkPBupnZ/+cD/wO1dsb4hvoa4l5QkP8RBXmjdyYssEHgWU7vGh03ouGFlfpgLX4ZVsLNG8KTtzSXFNtfaKTyeDborvGfNH1ESEf/+BAJQz8MsK4/2GGkptV2eaJOlk+EKKGylwcIENmoJBrAvBs4UlyPT3SYGC+wdAhaacuTO7lmdFM1SmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXdQ4Xq1qyaBKeZyhpVbHWcJNTdbdFmb69k6lKiGweo=;
 b=ne/aJ25fSartAzZ4jroQnF+xAOMvZXT3J89ZZTUtnQ7Rtv5Iy1dT/JriJ63LCaZ77tUtFzEkvm1z6HycEa6u8/NmPnKUou+Pbd5YrJd6KB0/WfetZDFdgMFhDKUcGri7B5gkXXXV1VdUcxlqnHLVlM+UegwG9hBgDC4tAHE1oiPe5hP0pMleImX8F4mZ7JItTSUHpSD2cC2OSVxk/u5ePOpHLTHds3gNpV/RynubpB3NTUaPkpU3NaadL7V+tNfIHj+1RqlqTJatQ8a9n0N/HDtyhYrNFe22yF2M5FRAnYyX7xsfW1j1Hz/yqPXdN7VgNhuhJPzepMuhAAJWUDtJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:59 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 8/9] tools/drm_ras: Show retired pages
Date: Fri, 27 Nov 2026 13:11:40 -0500
Message-ID: <20261127181133.801215-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: cda9bf2d-983f-454e-f471-08df4cb1ed1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: aG8bJKs/1r/833ZmApEWmm/KahVdIUSvhsJu+76KKXkGXxWWscSAGWPnzlcAWdE+ZOXaL45U6Gg7tHMlvoEdKWVpMrgBibVkIoCOgWcK++3/jVWoG6HYD1GkBZ762+ivVGP+bqu43E87o1ZInvQ1E+bvmHrwtZ+j9xsJ8UeE+b3tQdvM7ZANwnDykCtQE/9tXFRUWPn0TU1LzLv9VOuw7vnp6/CgMV/8ELtZgQJsjT3PwgeuuFFbSeBA7m6UE4Wr37Jna5l6vGE134sbKNa58WyEIYXyxcJseLz7lvS12lUElJZYCnoY4f69LudvLqdkvz/TOT+bXqcXkmv+VGI1JeWzmAlWFfEQjvBhoes7z9uKsqb4vICEMteblEBh85ws7Atk31V9hlXVQqEOeReZM/w50+dG+I0yJ/vERwrTfdvVyNTzDHV3OAj1eXnbHhmzVddQ4zu7Ljthux9IH0A2LnCa40f7kiJkwHFq3LwSckeFIzke9y5a8tW3RGQta4TKl9gCES46jdCxoS4LOkt3yRX4gEaD+RCi+YJvLD4bEFXxBP7EhiCs81NOKvzMzscPNo8eAtz2XtinTNNpGYZ/euVNKQFMwVjvqVJItVuyK5RlFG5wN0GBBo7x02Xp7Iewc8SAFzmXPvItnI2ufystQzGyEP9YYUnRBMaZ/7aMvXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQCBI4SbxVwXYlvWR18aN5vw15ihGyHjdkcQs+YzErk5uQpXuWja6lWjlEuQ?=
 =?us-ascii?Q?mJtSD9Y1/q6KfziTFWDqIQqYwzL7p2CwRaUgOyPqc2UwSWIJwSOQqTTgbFbr?=
 =?us-ascii?Q?oCDjBZbiN2gfx2SzfIAjkak2pOi7DvtlzeUI57nEEc8bxUdn69yHvHWAD2LO?=
 =?us-ascii?Q?yZGpL9i4sFrQsqrVya6FimE0QteP1wqz1nNAJab5Wyv7JsQGm67bWrURmYZc?=
 =?us-ascii?Q?DLug/txKRMSY+xHwwmKvQqtIPCeLZaP2NuAHXp4QOVVf0sddSoIttxVakYPH?=
 =?us-ascii?Q?O0RKdKGpu3U4sKxdLuHMn+FFyo94FJwWwZ262jP65P5Grn3CKVHe/bpmPCl8?=
 =?us-ascii?Q?/I0290EZKrU4ZTthECef/H1NQMBxX/Eqr94je1iimxXiLZ12ulP1VOCCId97?=
 =?us-ascii?Q?WmxkgUd3nknb99K1wTXEdXoE4/0mfJ9aHZ49MGRqYa+5rFyWYM2MloAj2m5d?=
 =?us-ascii?Q?Zq363PjNKL3RCG/S+NOR6a9bi+5ozyEjkopLPqi04OGsuJv2i9KNq00WkOYi?=
 =?us-ascii?Q?At6J6LxRROh4TAbYKp009zSnKnW0vfxj4r3++w8pp9/xyAHJiTsr9QujqPZT?=
 =?us-ascii?Q?E40o/JRC8q0ZA1VfxGj5tKB4WBrMjd951ZEw7WIzi80GC29hJcN6IICr9FCJ?=
 =?us-ascii?Q?mBVvSG5c9pvEvdVJMbbFirdbBmw6oHwVrUB+9QwxbHCJRJe0R4WyH/1R9kFH?=
 =?us-ascii?Q?YY++r5CQz1eJvov9y71wWtl5ihn07M8weyw2BdtrUt7ghydS6qsPWH1hKmNH?=
 =?us-ascii?Q?SWvXLz+ZghUXhBraBFqutZObyddcKVa1wwEUUbfbfbVkcbmzm9PMt/l4Bm47?=
 =?us-ascii?Q?8mY6WHQAPkQgH8D17fPD3rKcyuCbn5c9D6ues/AJAvNxz4a79Od6Oi+le3rf?=
 =?us-ascii?Q?l5j6RLCMS8mPYLLdsNO/MbLvqt/hB33TPgmU0TAJ7x1FKOBvwJqmOmwcuq3p?=
 =?us-ascii?Q?nTaICIi1nn2Fls1aY+9VD3hwARJQd2sS3ggnckogzJcVczf9N6LgFEEKTrvU?=
 =?us-ascii?Q?H9JYego4N8Qti33cHEHpVF/trigHBG0uyQGQ2G0/RHa5FH1vL7MsIX3kh2OI?=
 =?us-ascii?Q?B8PT0DfpZLzEzskGjDNSt/ScdGIkotDagD7WneHK56rniS8EiAOj31kPXPzb?=
 =?us-ascii?Q?o36764+RFCRCGZaK7ZPtS4sLzgMoa870wfXkgsyT/t2tFfeDNvV0zsp3OHlM?=
 =?us-ascii?Q?Pkk+HdFw8pAwH8IE8tjwgDWSWGdaFm421bnWhTb5f4/l9lhKcIWbxT9kxirV?=
 =?us-ascii?Q?RH/FJn2AWVdq/BHBlLpW3HSDtHM3DISUXWQo5ydvXE2spqu3P5M7Gz9sevHE?=
 =?us-ascii?Q?M4xsCQL87YNkG4s3UepuQKqFEkF5y4a7Te5xr0Uilh11/Yw/1ryc8f9BNRYz?=
 =?us-ascii?Q?P1Ir2hDNQzx/b88iWBaxbr60aik6RTwYqVlUz75tyGky8T4sUB+/ZalzmgrD?=
 =?us-ascii?Q?PX+J/zH6VNEpbgpp54yb5i5yhXde9xO70872kUF8gM4i6d5ehH1+kqYwcSkf?=
 =?us-ascii?Q?biJACfbmyx+tohHdJ2jrFYdRAww9z0wK5JLo3+p1TfHMIwdhUhR+nwP6l2F6?=
 =?us-ascii?Q?KwGRmAolq1W8bbMMhpi622SAy+k1EaAfvOpXsNp5ngi3QuzH9qDQHEN8L0Xl?=
 =?us-ascii?Q?zygViNTMhPIU7/bw4EeQdi7nrS5CvJpc97HdmEtzPonG/OcJvzOYxV/UsUt0?=
 =?us-ascii?Q?lJGACbFbJb951XFBQyJ+chAW6hQ7e4rVC4DXoC2WXirpGt3VDemq/SZZ06Nx?=
 =?us-ascii?Q?AayjXe+92g=3D=3D?=
X-Exchange-RoutingPolicyChecked: njMsH/jGtb67VsG1R5VvmQ3SmQOqsnZ3GVKglFH7xITJ4oM5PoF48NEPsjZSnTMAAstJgU+5Qn33oj80byEhOQuV9aAFgyrz5bw5ap5+Ns+DmNhyH2BH6+vteOtV4UYV5127bBgeW61pP/cRLCRTovd6RpoGyIsWlOHloT/keP15D+qH2JRW2ekFwgCqrXYkrtPK3ZaEVCBDHHUIWLN3ICAkuUtIO+P+sy9yflMIaIszwk5pxFJf0jvmMXnPCRZt2+eQN3bBFqd0qwhOGdfAgN1jimC89JXV+3bFl/xMb63aC7J/N2HfLHC8sXYSO2o9IjfcliDiUr6GQbjIjGfJMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cda9bf2d-983f-454e-f471-08df4cb1ed1f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:58.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ae3IDWjWrVUY+1g791zC/dsAdWvIThAZxsErKjHfJajQItqwyPUOGykpY8OS4DB752QkQgfCcZU4NYmGu3B7Ww==
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

For retired-pages nodes, show the maximum number of pages that can be
retired and one line per retired page with its address, size and
status:

  # drm_ras -n 2
  max-pages: 64
  0x00000002fb5bb000	0x1000	retired

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index aae92f99a..7d200df76 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -16,6 +16,13 @@
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
 	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
+	[DRM_RAS_NODE_TYPE_RETIRED_PAGES] = "retired-pages",
+};
+
+static const char * const page_status[] = {
+	[DRM_RAS_RETIRED_PAGE_STATUS_RETIRED] = "retired",
+	[DRM_RAS_RETIRED_PAGE_STATUS_PENDING] = "pending",
+	[DRM_RAS_RETIRED_PAGE_STATUS_FAILED] = "failed",
 };
 
 #define name_of(names, i) \
@@ -40,6 +47,26 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+static void print_retired_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	printf("0x%016" PRIx64 "\t0x%" PRIx64 "\t%s\n", page->address, page->size,
+	       name_of(page_status, page->status));
+}
+
+static int show_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	uint64_t max_pages;
+	int ret;
+
+	ret = igt_drm_ras_nl_get_retired_pages_info(ctx, id, &max_pages);
+	if (!ret)
+		printf("max-pages: %" PRIu64 "\n", max_pages);
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	return igt_drm_ras_nl_list_retired_pages(ctx, id, print_retired_page, NULL);
+}
+
 struct telemetry_fields {
 	struct igt_drm_ras_telemetry_field *field;
 	int count;
@@ -151,6 +178,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
 	case DRM_RAS_NODE_TYPE_TELEMETRY:
 		return show_telemetry(ctx, id);
+	case DRM_RAS_NODE_TYPE_RETIRED_PAGES:
+		return show_retired_pages(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -160,8 +189,8 @@ static void usage(const char *name)
 {
 	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
-	       "                               of a node\n"
+	       "  -n, --node <node-id>         show the error counters, telemetry fields or\n"
+	       "                               retired pages of a node\n"
 	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
 	       "  -h, --help                   show this help\n", name);
 }
-- 
2.56.0

