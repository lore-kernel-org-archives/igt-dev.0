Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA7606A68C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jLsyvNV6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iku0hqCZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6F510EA5D;
	Thu, 26 Nov 2026 18:14:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274E10EA0A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716366; x=1827252366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tIVRkRT4c6qOMra4bCIDJnWzu0bToILsgsvmXpUg6tc=;
 b=jLsyvNV6QlARrvZJmL0I4CnIUS/Qqs9UPqbpTKWhqDwm6Qxawx7tVwju
 lr5CiAPxO1qIHq3bSvdsCXNdocAJ3t7ovQeTR4dn89C0etU9ekRr4o1kx
 18508F91GIk+d1/T2/R3Oh9aPU7UgRCUt/aqaaUeHKhrKoWIEghWkLksy
 qfTnG3i5wyyLXi3x7yVK84cC+9MXpQ+DCcgm/rLOBS+cWYGNgFBmRx1QB
 raIGdqVK45iI1J4VHhVtsCNWB1pzD1Xktr7TxjI1JzKi7jQL0qh7v/jrk
 I6DQmf2rgCFUh2aOCoVVcpkf0HWvDc/DswFcEHZsMvmMDbgHI23HdCDV2 A==;
X-CSE-ConnectionGUID: MSdEF29CQvWsyqgonRpxeA==
X-CSE-MsgGUID: DcajWvaQT+awNYnIOtiVyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541054"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541054"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:00 -0800
X-CSE-ConnectionGUID: q5I1m3UaQHSx3icfDO8EbA==
X-CSE-MsgGUID: 0s1mOMn0RE6rs0ZoaTw49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560613"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izDTyMGVIZjWcdhuLbnt4y73MQiLB/HpczO0mLj0ShoAeZzpw7yH/vy29eMbp3rYa8MMpi8uLTCQ1dgYr7zTJNN74OZkMAaTS+hqTkBEN/bO4kAEZAfu7EypVpTkLxp7Spr/MI9J3fnrWcWYSfxn+Nq/uVEv9YFJc/2+5W0/biwBQf1v36vLJOKlIC0rit80tqOt6R+W2eeNk+uBdhw36m0ouqxmTDwMnsHvv00vVMMdOL93rWfeg4MV8bi/wTePKsTOpwHMcUrnFFdlBPfDgHPWhxHPSPx81HwwyV+FX6NEMv3WF9aSehWrJ8IJIWStVUt9wXuUkreEBsL4MmQYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SslgmA0UZK3nE1wVWu8DYR0vXsn/DaycejCsBhMCWU8=;
 b=B6lPKYvb9nZH9cucyWa714/6bsjkUxIRNGNmDMIDO7K4CDMCDJLCjXRF/ez//w/Y+1NC8v0or5dHTEqiTuGFVzWi1YQDe0PGHjOP42DqA5CQO+k7lT46m0Dvr6KcZ/lqCga4HDUhkzbzjPlaSPGyhSOguJZzjdAwQOH9cHHuHJPCxbyO2Xhz/J+5oeNBwJlCGoQuzIQL+WRqvAnP6Efx+33wQSHGuXSps0dbMdK25iOd05SnQVMZaiVTWRHPtBc0+MuiHpy6DZ18iTOMt2nx6GPsD8m2J3KRvnqdSxmTKmiwDHmbxlilV8xblw23NHsVF4r06D8yVISZY0rp4Jrz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SslgmA0UZK3nE1wVWu8DYR0vXsn/DaycejCsBhMCWU8=;
 b=iku0hqCZKR7WmzZWEZdwrOHZKNhxZLA1+XPOiTW7w7z+hTFwE/7dVH5SPpzVfSqHI6QRB09xGLIWknmgWFYBze+LMFgWKO1WWbAsHW3m66sB667FXmxjXYqCPluPhT15ZCwVlLeI2/6oYc32J224nv0XNMRephZnfR9K3V+uiVI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:56 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 6/9] drm-uapi/drm_ras: Sync with kernel for retired pages
Date: Thu, 26 Nov 2026 13:05:40 -0500
Message-ID: <20261126180536.487442-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8a5270-6bbb-4140-3645-08df4be7eae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: S5QdlfJzPsxVv+GF07wz2dIi4Qi/HuXKO2hqftv9aTDMjQQpPx5PIbUllcvm4oTZ8BUN6ElgkmFboDsHKkyok+gFjzw7jB+9rIn33f3DwOwEgr6SiY69XEOkFnyM5U3R2kpGbdpcRRdWW2ymbaEkxiU6SOtyU9fb3iNy4N+Y/mPcbhLCQ1Pg+UvG6vbRNKFhi3TbgpWMNfep6DHNzzjknlDaZDtwBgIgTbHQ5QgoEdIG0ZpDQrO5J5tW47gAyVyvDts6nM+g8gocIfX/FikYr6ZUFKObamlFIO2B7+3mOPrEfXcoBx0tldSoUFpe481pcuILGiJaA2Nu9ROu08FJ1T67n6lCFc54cFJMOGL4Ty8cSixW9nu7X8YLege8u+DXFD6N65oq7L2DNkX/+3P1MUkEBSON64DELGslpBR5WCJJ32Ci8Oyke47ebmbo88U1rQTbZc7eoL+EfoXXJcR7JHaZas1jmm5DC28BIZzCE9aO3vG4DJ6Z47jGeBh/efaosIh6beXuLxLjV5IBHdsR1mCPuqOoXozlMX4t4s14FkgMJO7Zc+7oTqArkTg3N12LpcO0HwiBjyQxeeQ+UKOX4F64L/sydVbzq0U7n3S4bFVQlYW3MDCLt9UcivuPAm4oimG6f27cgHu+1yZynIHAiociED7RAkL8hmMfPxQnRxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCoDIqhqYEMBnC+wA0PBQKYS+Ur0sSRIJjEMsVxJyvwqOlJJ2aEXFHnUvkY4?=
 =?us-ascii?Q?Mf/COGMafLzo1W8SifEp3EtMK/QStg+0XqZeAFQHt4DgeTOxy4VJerwpM29l?=
 =?us-ascii?Q?taGGF+KsOKrdQ9k4NiV6jL2nm3cGHnzaP8zZU9Lz6pbzIKzAKxXhqtmOgwdF?=
 =?us-ascii?Q?l/ujRMr464cLiH+hs+hjcIhfs3E2IOkItyw2mDqFrhPgQ88ZLxFMFMTjl6Hk?=
 =?us-ascii?Q?mlhNEeTd9Z1mEDV94lr7urrWS+25y3YzRaMr4AVTZLymOT4N4BHZNht9+B7/?=
 =?us-ascii?Q?mZqna7LI9jxpdFia4dJvlvwRpD+amAgcOEJjlbf8PLAZU0aLjjeynIIzSdtB?=
 =?us-ascii?Q?MY1um1+nr8VHtPhx95MbhLdpfs389GsrZ63EzlKaEKzUx2FxTCHYwoiojAQd?=
 =?us-ascii?Q?eMMuAmCJI7neJIoDExqiRwh2OWUhGf0ymyNTKslOrFCsxBvPCUlKJwvjWjz/?=
 =?us-ascii?Q?zLWYtdxK56jSVgEwG3SRFj9bldbi9B9+N9FdUbum5m4or97+RrcNiPKMJAja?=
 =?us-ascii?Q?l7JJwTmM/wMmm3BYD5ENrs1HD+6wGN+zyZt2iy2ll9Ucr4VLNL8IQAicpkS/?=
 =?us-ascii?Q?uhBFB1PBAlWCLJpGDPDUoQy73O4F9KG0n5Yli7m5bi5CAHKvZhFjI81DVeYC?=
 =?us-ascii?Q?iWMlVGFZAr1VHZWl3H/IThsVJhtWfAADeLtiayLWfIQoUHlmbSmd0mz2QYui?=
 =?us-ascii?Q?3Ydf5R+egjeIY71jjAwQsrELNXHcIUZPfiUWKdFggQ5cBRSj/Kr6jGewokSW?=
 =?us-ascii?Q?zJYmgesjedg0e1OeWhtZSwpFdiTZ9C34vbQwYlH0EvZA2IFN+cUBfRJShVtl?=
 =?us-ascii?Q?92wgGYv/3CVHJ+AvQLi0rtYlP4nLuPcnQyZUV1EKblg2okVXtuHg0Vfu/9+F?=
 =?us-ascii?Q?c1kxXNP5Lre/1GZxFjoDzetE5OgCg7kowe3nUC0Wf2JH0iraaBNrkcwWXD/s?=
 =?us-ascii?Q?AgTSeOg9+l7/sZgpiZLYfafwC+q2LRDRHMitlgCaZwW5gOweJkBnczfee6Qo?=
 =?us-ascii?Q?rid0zQWbX+HrLUS0wzFBsuxHnhyhARkvB8qO3yfO8t2KxGyq74nLrzAEjtXB?=
 =?us-ascii?Q?BHKXRwd5pnACDfhoRqoXdHP+krnVDw8V2jQyiGB15sADv2iSWHQO0wQah7gJ?=
 =?us-ascii?Q?qO6SmTmvVd2IBekiV//eZAr1/N++hBm2zWvfnLJ+z1TAGN49SIOkBQFFQjwp?=
 =?us-ascii?Q?bVoaedv8T7mEAK3ScP/b2sVMCnjHNX4eqWHs4xu3hlfXwYxY0M/Fi8xD1EGq?=
 =?us-ascii?Q?EGemfCAQKog3laKoRUhtlDb2HRCVAxR2h4eTKnQ/TX0SV6tNY27Ds32JsGWb?=
 =?us-ascii?Q?JGt2XU9UJFyrx3a42ywavKkDVAOK6+w7QLcyFB0wEh8I+jtp5vLzLXbELjBX?=
 =?us-ascii?Q?bM+LsOTNmqQfstjDtujwxG0IwrAE+PjlYTzRyY80iGfzK3hUoFRjjhF1Cg1C?=
 =?us-ascii?Q?ukfP9Ywxv9mxH3lPqxsLyLnTeudianMZl8hK52M1GBQ5rqM0GRx3aYPAnd/r?=
 =?us-ascii?Q?qFSHMcAt3zM7k9mYHK10S+jH5UyQfBiC1L/t66bYE2+km+jFsx7IgtjczcOQ?=
 =?us-ascii?Q?hUOZpHBmiEzDqt1FwEvoH5XnEcYIXvyei9UyfmFcyS/hG5ueI1rP/0xgMAYO?=
 =?us-ascii?Q?En/hfGvzNN5rsbX32DRC7QoGlGcm2++m6EHq+M6WScpfazS/kjL0VTIMgNLg?=
 =?us-ascii?Q?mDVAOARusuGre7g5cJiDEoDUasb9CTAfSezXJoYM8aqH/9N3AX8ErcOB70bo?=
 =?us-ascii?Q?hFuSVb1vTg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ndyz5HLnIMnSQOjmLEFV8yYB3XefXSdEJA6XplxJiOeqyBW82cYyCsll8HCmCeriiQpJ3BzPalUNdfdxB+PeoejdICLanj4FoJLB74kAGeEoVzPl1gwwzsbRFSbnfCgak8j2aN8lce2feXr551kIdsjgHx54XIMRskNA1qajR8ytHGLk08s3R5q4azfpFiyF/3RUu0s8xua7QMthRDASzUYUePKWDsMod3IN8kLGCctEsocStkrs7SoKkO/YQ94VBfzfMedxX0ApWxMSYf/qhdV0f8Yeht7qbrlO8ozNGrhCMaAyRQFRoNbA1BwMp341zCq6DTFYPEOSu7Fh5l6l/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8a5270-6bbb-4140-3645-08df4be7eae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:56.2586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKOtGycU7Ua/RK1kigWPjmX7xq0cbB8eKNNc5oV2Fd26M7vWbBBjrp9WPQP+BaxllbEz0jNc71l0SZZrU3/DyA==
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

Add the retired-pages node type, its attributes and the
get-retired-pages and get-retired-pages-info commands from the drm-ras
retired pages series. To be replaced by a sync with the upstream commit
once it lands.

v3:
 - Generate the header with make headers_install (Zack).

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 71b342bc5..265920420 100644
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
@@ -28,6 +30,18 @@ enum drm_ras_telemetry_field_mode {
 	DRM_RAS_TELEMETRY_FIELD_MODE_WRITE = 2,
 };
 
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
+};
+
 enum {
 	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
 	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
@@ -73,6 +87,17 @@ enum {
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
@@ -83,6 +108,8 @@ enum {
 	DRM_RAS_CMD_TELEMETRY_GET,
 	DRM_RAS_CMD_TELEMETRY_SET,
 	DRM_RAS_CMD_TELEMETRY_LIST_FIELDS,
+	DRM_RAS_CMD_GET_RETIRED_PAGES,
+	DRM_RAS_CMD_GET_RETIRED_PAGES_INFO,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
-- 
2.56.0

