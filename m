Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A110E606A682
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O/kza8J9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fazc22W+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9CF10EECE;
	Mon, 23 Nov 2026 15:00:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2910EE96
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445697; x=1826981697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=R/Qs+YlSPS2tXbafTfUoTPrslNQpB/geb5cs2nvEW4w=;
 b=O/kza8J9oTGXk8RKbLuJdEk/7z8nB4zJk8mvWsW6qysjX+gX02lKVw9B
 OjbGdV4HdefYFwHbhHMCszhdYQfgdAYTR7LHDcGecsKUUdSeaXvQNKduW
 4KwzufHgeM5d1QiHWAKC7PR+fkWDE5syl7qw80BkxxnKoDcS1M3rZf2S/
 RYfX6vsgyxaTwmaLxM3GcVSdz3Q3hgOVpVq/qx2fAUtmaxbmB9jRF8LAP
 Gj872xS6F28MWeHqID99Por9Z9kjAxDMCRl5zjnEdg5H6Gk9Nli59f4Rs
 LBKJjTHAs/3Iad76Uh30wqlURP/RGJ/E8C/nbJ3I6zgM/HcrroP+lf5N8 Q==;
X-CSE-ConnectionGUID: 0xCSm6hWQaG4FtsCAxPwbA==
X-CSE-MsgGUID: e66HHa+qS1KVkYRKC3hC5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4307583"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4307583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:52 -0800
X-CSE-ConnectionGUID: kaMQk1zpSc2eg0CS15RzAw==
X-CSE-MsgGUID: 6eXEy1LsRPWou0pIdFdUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11093571"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYDMeAyo3x6JpQoLb9r8z2IzYfCzCDI/QjZKMM1ucAI8Z20ocqS+tucQNtEeDIC+GYGVu5JJJRr7I0N/xZMNya4FGVytENFMGO848jyuxVEnX6KrED1XKarlUaeUoVUzss+74wcUt78WdcaemzGTi0jdO91laHKyn1h0Hra0usfL9V+lTGVxTja6XZ2EYUSdyd8qsbvqjlZNRmFG/yuXEhrGX5GygJwdn0TVeWujh7r/CAqCbCKJ9TnZd6QCjnyxG6SpYWWTmR4/i4JenMDN3uullv1lq3tKvlbwiL+jwWDypaC1Uq34q9T7ehzcSGFRvkPD6BGewjGi4CaDaRZu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZiPP5h7xGO00gbMyu5RFBq2sMSLBNfcYErkWDGAsDU=;
 b=fNgI3VcbPpSYN1p8dvY352/FU2nLI8EF0UuI6pokogEI9iW84emDgldG5YuBIDRLRx9cDZnxV3iIJYqH7Cb72rxS9N6mAGVJUw4387/JKADTI1bsfqNJ8trtMCflm1Ijid0RtpIOBMjbr80PQ/afdVmC+Ae183Y44nqh7hDT4hgHrbzV4rYWfETS+vWBHONCqwxRqom/JTs3Sly2vmDlFaoeiuPNZZhmv3UIx5vKe8crbi6xwLLKa51b05uQXz7D3otkdPY+Feb6DIidEMUs1MOgZL2ABf4eG2XqiK9VjZ6+7v+6rDRZh6LJu5iTCuTM4wlpy+ldMJ0tran1OkXl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZiPP5h7xGO00gbMyu5RFBq2sMSLBNfcYErkWDGAsDU=;
 b=fazc22W+ddlHK+s1FGHOm39dZ+wAdWrFH/PUjVDr86AA1oA6+0cr+y4Vci87jEPihNAa+3Yq1q19IlXl9Jh8SnUfAmxaRRWiqsIc40uygpcKYy9zK80Zljk4STEb4rBEBrXNAQsOs1QAENWQh3pNX6Ep/OGwWAjVfjmV9kljanw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:24 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 3/6] drm-uapi/drm_ras: Sync with kernel for retired pages
Date: Mon, 23 Nov 2026 09:54:12 -0500
Message-ID: <20261123145414.2243338-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
References: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 82188793-44b6-4f17-2f22-08df4971aa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: SUlpb8XEUO5QH4eAdoz/J9vtn9WoadYDJynhZg9xXOIni5fovMmstc41Zg3uhOe5HQrgxcNHcjVszIM1YBV1YG6YxqALG8lSNEPcxba14NDzkMfZoUWKex5bp2RulUqrN2knv+QdKXqs5Q0oDNguazloG80NCA8CG/Z1nemuEzD9uWl1kBoWn4ykUt80Ec9icw8caCugq8oebehE0w4Eg+g7jeyoSEQnxr7Y2/mqcddxnKZaQSk79owO2kZ8x7zP2htWqqadCOPmfzrFFPSFOhEzlOMyhK5Odx+xRiu6xjR8R7zqDPcrrtj7d08N+A6WivkGuoxjTgyvg/dFJux2xlR34iPJTSe2KsimhKMFNZkjLZbAsP0ZiPytyCmJlfI4S0cf1v/LhvVGZHoa/veIqnvzSjLGaZDV2YjbMK4DTNtqD5gFXHjI2bv62vJKN9UdBy7GBvEEW4el667VrcrBmSkUdfy2cQbJDJ/Z6pNPvt95+is6ExOrbkXfS7R6RFzBmWblSEa3sSXxFqo7NbYzHyoeLHJgugsApLRu72cVn5xIW0crxupMPB3JHs36dxq46Gub8tQsW2j3CXuGxrIDkmNZhHqswSaqXPf6xsaXj5n8Yyfet5G6ymNeJwD7P7u+23wAB6LVBBIzFUOUAROEVEHzeQ07LmGNqKuMxS9JktA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hp0+DRkQWsE5dIo6tF/RTqFGh0v4Ao4efgshzK2OF/zHVR8yhqqXGAQA2wrU?=
 =?us-ascii?Q?oNNSqd79jjucHkOOTk88ngoDEABgH4ZP92pc1LeAZg2TlizdRryfmoM22WVk?=
 =?us-ascii?Q?49EegHmvOouTpxPqcNrCIFga3il+gtPnI7TpXk87dAxyoHgBmkCykXYMNfkl?=
 =?us-ascii?Q?MLxa9Vi2l5aqr0Ddpk7f5ym+KjzD+3qVOCT9X8/V+Vs6asyH+kI+2x1Mtcg2?=
 =?us-ascii?Q?17GdB9EfxQBG1q5ZBNtLEmlgctZ0YhO7OSjy5uM/XsDrau95QiZsPAhow0JG?=
 =?us-ascii?Q?Zf8Zyv+nCQgGJ55sYlbljZhOEt8XrYgNf447XZ95pAZ5Nhwgair90zqlzeuV?=
 =?us-ascii?Q?CkkSg5lFRSkG6b4nxWFdW6Tg2kiuW9OTPYFnp8qbQPWRf5j/s6qvPCwBv0WW?=
 =?us-ascii?Q?bnzXpgaSXdCRa+dCg+xFHxJpu4i51SKnNzd3ckdJs5In3VvB0l/AnSAaQx/3?=
 =?us-ascii?Q?X98Nl7A4ewvdTMOKJ7mvxV2gWZcVrf5W9+icRZWoWr4jpkzZ5yf79iwXA35l?=
 =?us-ascii?Q?MkP9g/BCyWX5bkyXy2JvplwwLVimr0O2pbh7XlSflKwq6ar7Zk/MZ2li71ui?=
 =?us-ascii?Q?26W13q7bSm0VpuMAw0YAnjJVmKQAeYfJj5EH5aeeQBqrIyggzkucGZlRoiJv?=
 =?us-ascii?Q?JxVlVO31WIlJLWqoM6Pe/2NIbJyyYGEh/PZJhoi6NrhH1W9rc+NtJo9pLsso?=
 =?us-ascii?Q?+z75x+CUIN1MdJM9uuIZ66zac+2fwmwXgAsi+N5Ynfhq37sK5R14Hx/VkzZb?=
 =?us-ascii?Q?pOYEgPndC0/kNUBz05zJXuP1nYp5ftkbecMp4m0ZHQq0HQ5BWM9Qu6JDHuTt?=
 =?us-ascii?Q?3vKf+OnYGLgk/V1KSxj+wi1ZHl88Ub2xGQV7GU90gqcsJTVKM3AMcXSj4lWV?=
 =?us-ascii?Q?ZSnFLjPPJtfjrocPyZlLqMlRM5vJnia4rD4AvkU//GCkG0H8Izgc0k4MKP5q?=
 =?us-ascii?Q?jijdRnin+Z7AFExSxOcNrThe4jF/LkiPEAFNcWKf4k2DeDtQMKv+yltRDbbA?=
 =?us-ascii?Q?kRdXKZ01lK506EGuqk182jfufYQH2JOlu0+sp1LImFzsdhnXVOyvo/OTB1IH?=
 =?us-ascii?Q?i3BIXQXUUGMW/jISGJE5t9PJqTEsn/UateaaezhGuCd9SnqLnqXQ33hrnPH3?=
 =?us-ascii?Q?Evv53DcBt6zpQd+Jfb8Gr5Nki4RHLEqZXQ6pzJji7FjDFwUmRAuNWlnJsdwx?=
 =?us-ascii?Q?N0nPZs8ILoGV0O1Eha2Pv7zZFAoeaAdaKWTQhRXcEVEMnwc4sQADvhFtI4Ca?=
 =?us-ascii?Q?aHrFGnhSuqpW6VDhbMr2GgAna2nk7aXnncxGSnYN8IkPA6SxDrY4cogDr9gx?=
 =?us-ascii?Q?zqxWLBhNtE+Tq9jwPlyuopToBs/wnSiPfm6hSr1vqtepgfUfpF9VmngjHU8A?=
 =?us-ascii?Q?Cs/MwJ7b+2ozfFkA89NQYrPLYmnjyFO6buYn/FrV8OXeuEy3FAAXVcVPV+Xj?=
 =?us-ascii?Q?BfCttIESFVRER0axOFxDrB5rxvAjnrtEYFbnMKl6RyUBEa6Fkw6KhiZC/Ejv?=
 =?us-ascii?Q?VYOrfF9Xv0eR5Kal3NkfIFahiYOWDyddXqfGHPhLYwyVwjC9Gfxr91uMPe0q?=
 =?us-ascii?Q?9VR8I2Pd4C195qCzmHIF2QQOdbh7F6sm3IEzxqDvO2KPE/kUyGwBXrgzjoh3?=
 =?us-ascii?Q?TWYWkn1bBN5Fa/yUOKPmoVbvh7iAHexFDGpioOx6qjwBNm5iEB2Kuc8tQ5ej?=
 =?us-ascii?Q?VMnysnE4s8wSFOW3HJCEGE1dW8deFApyFZ76Z/HecyuSxpJtlSQtvsvMMWJV?=
 =?us-ascii?Q?Kb8zccCdsw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wo/ABwqf40xxezCbENiV8V9rqtKMPrkQOpT9/7qikRVcctxnkbbqgBNkuCBjd+I+JacIDqzmq27325zybROx4Ezr+xHHtmd6dWwHkH02EJarnMikDFGVLcSiu8/GZ1bKCPZdXYdy+w9g0GGW33msu4cA8oJx3JcyFSdS48xN2GapgxGlaspnOqOVPYbX0q/yzCiQYoVf9tE5wmIbN7U00wF6/gEdXHAX3ynC3ExptG00m6NJBDE/8d6uWvXqOgdWhKi0nbxcSSkVmiA4XFoPp6cq4dSSa7+wNtabwNTSRElVae7LEKdwYIj0YWNvItAudETSdV7OK0sREl7uTNOZDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82188793-44b6-4f17-2f22-08df4971aa00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:24.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdzH9dWHUKU9qJE2MWQfyKZnJGC7duK4dg2TyMHhvQbyYgsYcaR8PmocGKTwwE3flqTBw0kc3swSYV7EWd1/dw==
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

Add the retired-pages node type, its attributes and the
get-retired-pages and get-retired-pages-info commands from the drm-ras
retired pages series. To be replaced by a sync with the upstream commit
once it lands.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 54a4cf2e4..58309a759 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -10,11 +10,25 @@
 #define DRM_RAS_FAMILY_VERSION	1
 
 /*
- * Type of the node. Currently, only error-counter nodes are supported, which
- * expose reliability counters for a hardware/software component.
+ * Type of the node. error-counter nodes expose reliability counters for a
+ * hardware/software component. retired-pages nodes list the memory pages that
+ * have been taken out of service.
  */
 enum drm_ras_node_type {
 	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+	DRM_RAS_NODE_TYPE_RETIRED_PAGES,
+};
+
+/*
+ * Status of a retired page. retired means the page is reserved and out of
+ * service; pending means the retirement is queued but the reservation is not
+ * complete yet; failed means the reservation failed and the page may still be
+ * in use.
+ */
+enum drm_ras_retired_page_status {
+	DRM_RAS_RETIRED_PAGE_STATUS_RETIRED = 1,
+	DRM_RAS_RETIRED_PAGE_STATUS_PENDING,
+	DRM_RAS_RETIRED_PAGE_STATUS_FAILED,
 };
 
 enum {
@@ -50,6 +64,17 @@ enum {
 	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
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
@@ -57,6 +82,8 @@ enum {
 	DRM_RAS_CMD_ERROR_EVENT,
 	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
 	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_GET_RETIRED_PAGES,
+	DRM_RAS_CMD_GET_RETIRED_PAGES_INFO,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
-- 
2.56.0

