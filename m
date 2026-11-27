Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D13606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLrutG4x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46410E276;
	Fri, 27 Nov 2026 18:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63A410E0E5
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803121; x=1827339121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5qOw6dKpOoHbshcdjxnR9S8WNYg/xM+gu0E2EwhiDMw=;
 b=bLrutG4xQ9zTKz8nLRTvNa09DSRSa00D1Z7luGinBuPZdEm/hbUTLKNE
 UvIp4XN+UmZh9X9rzbdks5RLDGJ8LxkEiIWl9o+GKKxctOhzGq6pmsDFv
 VTyFCDCmEAnLODnx44lg/dLZSZpV7sI998jQmGZxs/Jar3RFdcInOYygz
 3882htQ0s3MsxcSSlq/p06NhPRtUMOAPTSIFQvXHnd5Lst6aDyFEPT6gU
 tc/tvZNqjxrHJJIrCjO48CDi6zOAq+srbwlcm/7rXdJpzumQ8XVSETBLA
 QeIZbIsR41C61P2eqibUk8e4eQvLpsmQ2mB0GOT1p1lCIA4XMRh2eyPX8 w==;
X-CSE-ConnectionGUID: ZELJRmUYQ7GkW/JH/zI7Hw==
X-CSE-MsgGUID: D46+A/BxQiaTGYqMYwBHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602885"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602885"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:01 -0800
X-CSE-ConnectionGUID: sCW1WYBBSNqq6Al6DgURoQ==
X-CSE-MsgGUID: viQtLk5XSXClbkXTAgk3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208071"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:12:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:12:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:12:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7HrlwED9Wz/1hrxKgsTSUfKli7Q5hhWVqAQWLWKy5oW5NT+/ZXE2cZAGAKExozceys0l/zSB4w8WU2A3uTP+WKEAzNeGqyonFo+iBZaQbd8IcX2u5qJ+Brzl6LzPgt1zKPrd/oO9bdENuyuEbwJ6HOkFoGrQXbfkvFZsuNfk2CAlHwEW/ExDQAbxdR2qyIJDHvinqnpnAgZGTplGNon3/9JLZLlu+KHhNwlIUUFbcPCG9GwFlIsgZgv76XrKuaMx/ORoXQU3rkmIivlB27DvuzuUoPd0UhOZymiGnvzhWKeoH6V9GOiB9snyFeyJb19MX6s/tStFc5qm4oJhZr1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYFbg1NDHWBp/wZgkSv5P3d/rAMdieLfdeCzm3XwV14=;
 b=tXEmcKVnuC0BpOcIBNNzD4drDHikmg/Ih1snAH8qLRqSRux0IGEPL+UhwPzDbGVpoRpIRT2lPDe5DjlROpcfz5R70ms9EtvoWTEZuloflDTOD47v9/aU2ru38tEUEOldyApjH1AEKPA7bEk5+sQIw5A5vrlCBfzYAcZmO+lYk2CtU7jfz0Sgm4DVuevO0SPYlgOhfKftoEucXhfGMkInOo2sYbDINyNEeP6RvpoUjo0RceaiMCUZtlaSg7MasiMY7d97yKHoyQ7Apm1Ks6UkfZjho5uYNfsTYWKAjnni/MLdBpH+N7qeThUYCb0jij9lVQr2OGOWqbm9H9fJfGhFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:53 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 6/9] drm-uapi/drm_ras: Sync with kernel for retired pages
Date: Fri, 27 Nov 2026 13:11:38 -0500
Message-ID: <20261127181133.801215-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd93151-62c5-45a2-6c5a-08df4cb1ea10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|3023799007|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: +YxfkHWBUfv36UGb48aABGIqxDTavE+vNdTATwwX5Teeo6T9rW6rfkskims+8GnmZquQS8pbx969Q3WYootji16DUKkK/OJt1SUbFJusvEumv6JSCv6IgW3LGEu8t7lY+yxRn/zwy5jjd/4Q/I3AARvZIRAeh90Z9KQuzMPdjNXYE4TSI3Q01vk7vg8CfxOR0f8f6ZGGP3vUSjYf3WRhJUGxu0hc+w6GCMNRKzLtaEZukcOUq6BDg70IYuRDyTpUYle4f98nyQuUt4DG23f1qNuLhop/SZL3++8i+SYgMg2zve1sTl1QI0YdtF+AjQWAl/Gv8FT3XGSIo72EN8bRAsD5GNzQC8OggebCNX4buuMH+DN1/xZcITsp9taeJ0Wkjj1zQgzYIrwKKBlXTZs68j/WvyMJQjk7zm1ZPfJtlHJ3NUTOLHUE7JWBiIrqeGyCjE2PIWgBVjYJDORNJEyqGT6seIisdkVJDlCTd2+2etc9gVIH1w/+sOMh2FTTSU7AIVQQ6wufjDZ+uJVAmCJNO/fVoAaAbXTRIoIdnM2Qwm+8nVhajiWhA0PtWYOstcPCLxcjlGdvh+RCErO8HDx6BBh+uFufCs4N+RGTLwNJIP49FT3pcXGzbucTiIGfgfRhJOLEHpKoj0//M+c4h8/RgGpglQinc6wr30p7uWNqQI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zzA9rtopFM6QseQMsnPJSNXvU3UQNmULqsCP3UmbQWleWeOzRr6gRyBNG/a?=
 =?us-ascii?Q?ZLM9RLSgsdnkVaFXSmAuK3ztsZRqyG6EWf8G1fguLXJHAmVDFadaOt0ZQ9ot?=
 =?us-ascii?Q?ARVICV/QhW60OvwS4k3wrdl1vACFd8YEOrttRqazwq5XquimXHkWIkTpGtBc?=
 =?us-ascii?Q?2GdC0ZgT7rKlDpQfIKEEKnc3H74G19Tx9tqTfmGcMxJK7lXUOEAKzdCWX3Ut?=
 =?us-ascii?Q?JyXv4znR9Q1Uec/k5QEVguLmL6mJd/Wn7jasX+UH103RUBWhrGVBy9bxXcXd?=
 =?us-ascii?Q?VLcK63JQ6ow95imYrl3v99PiHPv0c3dgqXdnajpJ7EV/smK36o/oTS5bXqW/?=
 =?us-ascii?Q?+VjF/kaQSc+VbH4mUxEOqLW3GcnoW+HwFxP6ij+KIhmU2x7eCJmlfimf1HUZ?=
 =?us-ascii?Q?wK/TMCnwpXKCkp7xD3TDjOM3cg8mTbCh/sXfDq0MveUr5MpExIkldhmU/f37?=
 =?us-ascii?Q?+UeXEF5DoOBgezSJpbmu73XOJzQXZdGNSzpKFAkH0amcsuBotFwYEOZ3tN1/?=
 =?us-ascii?Q?GHi0Eo+RxMATW50xHnGRQxPcvsPiE+CVvGMqETUTK0Id/fmQkJclxPVyOliv?=
 =?us-ascii?Q?hkZufAAsLuRHmpN1bn7KqRLCVJX9nU0sg+IItfuc+DdzDvZmmv0Rc54P9HVE?=
 =?us-ascii?Q?UxuCZ8mxk7S7K7BWws8dGdKwt+Fj754tefDPW6Siu1mbgNKhZErtm9SDH0dk?=
 =?us-ascii?Q?BcDgOEtTuVJoo5x5At1R1NPBKg9jKhnVA48xfJtrAbe6AI8dRqEpAr0KgOKh?=
 =?us-ascii?Q?HhtUwafN/Ou4M2dnasubkpOyJf9pcjU9TRZ6JN3hUTte5PXur0jf31M26f4N?=
 =?us-ascii?Q?9u+5/MrDqwEDcAGkEyuta7BeOgiUfhcbU4UW3ojCDkBKIqnIj7uan0aSUh1v?=
 =?us-ascii?Q?vuuKBQoYmW1/1ktrbxCIdtK3Yq2Gah7I5sp6wTs2yRL+/A1Ez4nLZSs5ks9o?=
 =?us-ascii?Q?gKRdCN09pEwRxfhS6Yi/k952c8XW4LplbPXUdkuKAsZyHBez8ji6zJukleQ/?=
 =?us-ascii?Q?RjQpMmPrKaqwzBVbAACSDJdsjLq2HyYtILyF4eePU587fcDervSZA3nv94eD?=
 =?us-ascii?Q?Fbu8hJ0YX/R0Xg4rhV4BzDn8msruQqqPXT/LZErkqmtgaDJb3uQORMqq6Vto?=
 =?us-ascii?Q?WzfzMAFFR9ViZP9HRXiF6Hoiwhidz5udSMbbubw2++SAHZ5eZIzaGBnJPiFy?=
 =?us-ascii?Q?bzHg/+p4mu/FG5FloMhVbtiJoAbKloMTfnq9P2W7L5Z6R050wOXC9KKGbTCj?=
 =?us-ascii?Q?n8FtiuTcOT89Plkj9p8FH42fA/ObZ23svnRYeEWwX6ovBDJYrw223dj+3z+s?=
 =?us-ascii?Q?VLucS60ly0SeshIySTxEGHD2YFrEkxPoKV+47R5F3ZvhX027/tRkJv9xhywp?=
 =?us-ascii?Q?FNVH1ID1A/vbjUQQEgM8ztrBYpa6FRH9LGrOQhrCtuy0NPvjHrXgEjvm6lpC?=
 =?us-ascii?Q?S6Zrk791vv2kIH+GZKbVSnmXbykWkegj7C8PO16PeTDnVc2CsMSpvf0jhPaw?=
 =?us-ascii?Q?C98UVUXNrraTGt6oRoUA65H3j5u2ZiXB5XBu7WFEZ/dh0b0UfWTryf/2WC69?=
 =?us-ascii?Q?OVOI5VTS0unhtgRc4J6+lVIb1zdXmhqsWSJkmsLgsTvvhSa6oZQ6jWV2cD9X?=
 =?us-ascii?Q?pm4xBx6+zTWm61uGZ0nY8J3/qLfAKxmmgcRaorxe8crxCI2r8/Ey8md/vAj4?=
 =?us-ascii?Q?RznLYwu+5cYFVqsBBaww4Ig2yVHMPPuu7YhiAUjg3mFtYCC4aoy94+iR4h0v?=
 =?us-ascii?Q?rbNTskf7JA=3D=3D?=
X-Exchange-RoutingPolicyChecked: JRWk906t5b0e+JsYCushJlyiCz/5n7KxCGra8T7hXCBStJlPP0/BsRnSHfQt6UpCegvg4IH0XJ4zZJxuI/W09/gLci/6WurwS9RUYBjq/GRos3UZGgdJmn0kvoeE356y5JAQhpGcoa5B9ABPtwG97fQO5kQOglPhZhhgsY3iS6qCDcUvJo3hI/pCYJlV/7863VoDZgGfsh5r4IBwjzanAoh8lrgoDY+2UH5SfjTkaZ8pQP3ZBXc8YKMDHmu/mCI8R6uy7R3BpC0jH9d/xw984yal4DqHAXnQ+bIIe42C1JxKtUfCNacAw286Ydfmpk4mTOYHE8/RqHcgxjQ0SqS4/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd93151-62c5-45a2-6c5a-08df4cb1ea10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:53.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUlNlCjTpF6lCwZHdc7wm9CPPPNIx/uBD4NxIVLn279OQtd9xp8HhZtpuFFP/UwnK/Zjv5CiuevcQ/i10dPn7Q==
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

Add the retired-pages node type, its attributes and the
get-retired-pages and get-retired-pages-info commands from the drm-ras
retired pages series. To be replaced by a sync with the upstream commit
once it lands.

v3:
 - Generate the header with make headers_install (Zack).

v4:
 - Regenerate for the kernel v6, which documents each status value.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 71b342bc5..8fbce20ff 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -12,12 +12,14 @@
 
 /*
  * Type of the node. The error-counter nodes expose reliability counters for a
- * hardware/software component, and telemetry nodes expose an interface for
- * reading and writing telemetry values to a device.
+ * hardware/software component, telemetry nodes expose an interface for reading
+ * and writing telemetry values to a device, and retired-pages nodes list the
+ * memory pages that have been taken out of service.
  */
 enum drm_ras_node_type {
 	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
 	DRM_RAS_NODE_TYPE_TELEMETRY,
+	DRM_RAS_NODE_TYPE_RETIRED_PAGES,
 };
 
 /*
@@ -28,6 +30,21 @@ enum drm_ras_telemetry_field_mode {
 	DRM_RAS_TELEMETRY_FIELD_MODE_WRITE = 2,
 };
 
+/**
+ * enum drm_ras_retired_page_status - Status of a retired page.
+ * @DRM_RAS_RETIRED_PAGE_STATUS_RETIRED: The page is reserved and out of
+ *   service.
+ * @DRM_RAS_RETIRED_PAGE_STATUS_PENDING: The retirement is queued, but the
+ *   reservation is not complete yet.
+ * @DRM_RAS_RETIRED_PAGE_STATUS_FAILED: The reservation failed, and the page
+ *   may still be in use.
+ */
+enum drm_ras_retired_page_status {
+	DRM_RAS_RETIRED_PAGE_STATUS_RETIRED = 1,
+	DRM_RAS_RETIRED_PAGE_STATUS_PENDING,
+	DRM_RAS_RETIRED_PAGE_STATUS_FAILED,
+};
+
 enum {
 	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
 	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
@@ -73,6 +90,17 @@ enum {
 	DRM_RAS_A_TELEMETRY_ATTRS_MAX = (__DRM_RAS_A_TELEMETRY_ATTRS_MAX - 1)
 };
 
+enum {
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_ADDRESS,
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_SIZE,
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_STATUS,
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX_PAGES,
+
+	__DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX,
+	DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX = (__DRM_RAS_A_RETIRED_PAGE_ATTRS_MAX - 1)
+};
+
 enum {
 	DRM_RAS_CMD_LIST_NODES = 1,
 	DRM_RAS_CMD_GET_ERROR_COUNTER,
@@ -83,6 +111,8 @@ enum {
 	DRM_RAS_CMD_TELEMETRY_GET,
 	DRM_RAS_CMD_TELEMETRY_SET,
 	DRM_RAS_CMD_TELEMETRY_LIST_FIELDS,
+	DRM_RAS_CMD_GET_RETIRED_PAGES,
+	DRM_RAS_CMD_GET_RETIRED_PAGES_INFO,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
-- 
2.56.0

