Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDEE606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HGtgKEIt;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=N6ulsyNS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413F10E9DA;
	Tue, 24 Nov 2026 21:40:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEB810E9DA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556162; x=1827092162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9Prhvn677rbEr6KEEJUTfN1gleuGujtGK50ass7IW+w=;
 b=HGtgKEItqmp7o0b/4OvGBvjkGMDIWa+n7CIuK2cm5R0UIJv1yvFTnYHL
 9YQZHXaef7XE2Ss5BdfyzNqDFrWRWeRgmIqUhHdNAwE5UT9nVReGWP9Kb
 zKhUvhJ31x7stHspRDBmbxCp+A96LozipZiHwY4hW33I/8hlatF+S/SFd
 cEo1+BZieWpYFN/p+Ub2dReKFyt946g3i6o8ffU7L7tqbXO27OyjEg5E5
 ckvvJxS334qjaZ5YQw8rGX4ySvKGeZp8mS9nOBicmLSDKvJG9T8E+C4le
 BQ67abC6oN28q3yVW7bM17VMwygaLtsMPlCrBBNosPPntUL8+f4Nl4Jaz Q==;
X-CSE-ConnectionGUID: txrWK439ScudHEdSK0TpUQ==
X-CSE-MsgGUID: fQT9CftfTxWcgriX4WR8qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4343907"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4343907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:01 -0800
X-CSE-ConnectionGUID: BUlnAZNPSQuLBbU5kxFt9g==
X-CSE-MsgGUID: lCcPCDnpQ7i1d8CYfRaKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12022851"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:36:00 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR3DA4dqzzq3NMSBag2nnQt+7RYozqfP4fJx9TSgocy+mMxmGNK7IZLlg9LvEPe0WWuwnCxXRytzfz6A/sFHSldhEqye5lz2FS5fBYurMHvaigDSCoVd5L0rETPfz+fqX2yHWiLnnYnpr41Jl+lj1AdOOL9UDHgHXt4U2F4UkhAU30i7IJFro5ClbApYPYLc8ohJL7o8uEUk1uSXcMwys2NnnvSQVAZFD9JOD0XCG0uBNrc5FBOW/2qpE9j1l2b8MThSZgF9NW0vJUya9YjWfsqTt2g2h2bGSuRbIALg7EKDsfc+3Wm/cvbYY4svuVMY8kQeA7w2MIvh+ZdLXMAQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql9IQvWe0jqbxPM0PVbelReDVp7bCEoxGg3oFqQ+Qyc=;
 b=YgPnxbaFjQMf+qwFO5IgN5K2a4wkbQ5OdigkY2/clkwLgX90+yW3VTYGrjQJWAghXNVrDkhqNVeyiHrfnUWpHkqMgONyvt77O7dtQxyDV2Pj4AKCn+u92kdHpwFi353uzhgSbSudzp7ysdzOxSdyxwRRNEnNjojCcoYTZxjt3/rfNSkwjutbNgJguCxJCk/seoF6QSEBTJxxthfJlx0gBhh/9oMwE/b6NaSizGxceSqdo1EmiowYFXrhi7eSQxTDB1byXyKgEQgYHdWbq4KrmhlU+rytLOvljZp8S2c+hlWnZxerA18Ry0r4Xj9H9gOYu+sCH0vkrRu/IYIcq5h0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql9IQvWe0jqbxPM0PVbelReDVp7bCEoxGg3oFqQ+Qyc=;
 b=N6ulsyNSrOw1QNR8AgJ6vTqMWr9cejtf+wUqjhANW3Jo0lPng64OFw4XT0rJgAUa+Svdx4j3NoebXJ+hp+jOr95FaVuC1MS1yOyck4RqOst8oZ5pQNwdz9t8QMMAmNwvQXQnWtVdlEHut+fhy63QKHLNe4p9fGyRaBynpMbInXo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:50 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 6/9] drm-uapi/drm_ras: Sync with kernel for retired pages
Date: Tue, 24 Nov 2026 16:35:37 -0500
Message-ID: <20261124213532.3674338-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::14) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fdd636-a254-427e-8ab7-08df4a72e8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 7L8HBg7wsCJLSIudoIzlV9KeAviv2Zp2KxPXIpkyF9l6mwo269EyULZBZQralN0dwpsOU5PsHCOoQ+Db03APPnoQ49CuzDScdkc5bDnMOC/xPreVgVyByIspd7YS455bVwK6Wejiv1lQ/KlSJ/DQaopx2p0Y3FCqFOehJWLDvgNF3mmL176gBSm7ScPodcn4BsVu1nTkhQjaLezwRce2KOl3PdNuyQOUc4dgncQrbuoRNl7eZNsaGSP/669pdg2TnaY8XurxW5EhwSj1H6BwIFiIOuKgnBQk4OWPAVhd/1Jkr7a21b1cs+yZs2yUOzgg8FXDZ3JiYMsaJ0LyCZ928jTCvaOHtJd4ZGQ+FjMRX/qQLkBF0Rn3U0cN47+Mo780NKHPjIQ7uXNAVSKM40d0+/0acziE7kfhjKJXDe/i+7GVETguo6oIrhDt8S3fD0eoeAMkz4GYmafUFn+1bB2iW/In1AO/Lw/nrY4EUXJfBlT3a6GvrzrjJOCdt3rzfm3RjulKV++KBMFWAhHrGpeMi0lCqHJbCMlDUeSX9+sUz+T3CJTCnHnKDVVYtyyclyX7xR2yNBYdP1EaChA4XprGJeWwMOchFEH+hc7y3JWW5aCBZQM7FMJ+ELfnFhIIqX4H39/1lhp/hB1COPC+zr4RnvBnr+Alq/HAgSGYay7oInM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTHYsnFPrdIGxu/+um+U1K8WwxNiSTMcgf8VVlulDqSy9htRJjJdMUhL6mGP?=
 =?us-ascii?Q?SrWu3nYZJvsdFLLW4SPSRBKJPuw4qJffR2nB/GtZpUh/QjQIb/gvAY7sm0Oq?=
 =?us-ascii?Q?Ccfh25osibSxp7BgrnZci5Llx0pDfDkBvLZhKv3lk5OA91vUmWFQ+BfYG4h0?=
 =?us-ascii?Q?tVt99AnCy/utQpzilUHC4QdppHlCJEYh+mbfuGFeIAi/iXdctMxaNCrR814u?=
 =?us-ascii?Q?zp4yXix9RrgdaEIisfGTz2wqJOZVe2pUb6kmYCO/OlvIw4thuuvf4wf85FhZ?=
 =?us-ascii?Q?qPAY3X/3IbA+u0hIJ+xHhNbNIt/O6WOD6R5QMHLK4K+haFeKVexhA5Fe33ga?=
 =?us-ascii?Q?EUeLVXYgGqGobMs8TK8ubat+gvIkErjln0mU+X8TAUl7IvRb9QnYfnir448Y?=
 =?us-ascii?Q?mOdyhXfuT+rV3Ao4ojY5O3P6jjbLJOrL2V9XrSG43RpSJnn+kEhu8VEqwUl0?=
 =?us-ascii?Q?by5Ya6RXtpdV11p9dDRDEL2uBRSWASjtrXCPfe0+MWUn13jQvF+dS4tTjnVA?=
 =?us-ascii?Q?tJLEAASV6qJZvXuGGIL3JhDO5IVv8iTX6V6dluI7zxwobpzSTveMWnle/sGR?=
 =?us-ascii?Q?lQVnkU5erv2E2byAKRYoz20M/vAsj3jdOM/2NOFt2N1E8mimcAWDUUcHNfNj?=
 =?us-ascii?Q?MhpXGLHW8DhAHQfnHXpbmfZkz3ea1kf3XBrWzJs4SF0cvejMTdjw9inChfYm?=
 =?us-ascii?Q?yPEPgbTB5Yr/BTTmCSP3BHQ5e7edSe+l+tUHDr5440UgqECFRas6ZadUrflL?=
 =?us-ascii?Q?EwrJntJGq9doL4TDhPptupb7FKHgSCy7NsKE5AA4kS3COJ/m4aLnK7TsyHTm?=
 =?us-ascii?Q?57dqVVKzTVYbmq3hbT0EtA9bjVXopQpfbXJ89BV15+hnfQVjU5D5Mo2I3rl6?=
 =?us-ascii?Q?dZJ1f7fwqq6OU9N1PjxysbGKvDchWE4pQYLvA4w2vbHG/5kQAqUAl/2lWpzT?=
 =?us-ascii?Q?0aF1PwzozwrmPCKXNSyOrk6JEzW+ign0eM2JBmoGEey++Ff9WdMgUX8kk0QM?=
 =?us-ascii?Q?78LP8y1q6YIrj6fOJxzDM9t4yo+84/iiy56ktbULM8RNQgvkveIuTyPDaetS?=
 =?us-ascii?Q?J0Aby5i4hqxiZVTDDTXBU+YoOnDuqJ2nuJeabtVoYz+qf8iI4044e/i7ZCPv?=
 =?us-ascii?Q?h34oAh6jVz41oRN/G7Cmb3pT0iT+U9XT+Q6aTepvSPtCwsYpCVvCmDB771Vl?=
 =?us-ascii?Q?ciC4NUmqw7nGgWJA0UdB/unMi9TMMbm/gslcL9QTCp7rBWSeHgUAuXLbxfCK?=
 =?us-ascii?Q?oZF2PoKwJEgtdtM0agMdvtqhl/+6HajNcaWDWjMimACiAMbvBEXAaLgvjnH4?=
 =?us-ascii?Q?XIpL6fhGolseBfEXybHqoHauWQJ24VlUqy3Vb7a5MVl4PLEdVeNTlg5DSC4E?=
 =?us-ascii?Q?HPjcStFP/FYCHvNqFN9QOm2fdffOPG6kpBd8qau7f/ZeFewEfng+52h5U7we?=
 =?us-ascii?Q?IdFKriU6Ba4ifS1bKU7s2nSymKBZ2sd+/K/mUstPYobn7/suIDotah0+jJSC?=
 =?us-ascii?Q?N6llYeHNwmkWH43umcvQDwbP5j1+tN016f++04b/aTjcXiAeAQZWyMdin1iM?=
 =?us-ascii?Q?I3YhBwaG9kEhTsUtUyJHr+M/1z6pHrqWDw16AFY16zQsDbrMoWzjSm55bAnf?=
 =?us-ascii?Q?nPhWC4hF0vuwfdBMgfuae0sTM0YXtsrcHCP0hYMnKK46aWqKf9iPO3RPWD94?=
 =?us-ascii?Q?7Sa6jA4QPVVnTp2A0bs3SFoeGNnyjVevC8T0lacCPyr45kTYnYvvv6RRxIqq?=
 =?us-ascii?Q?AzDWVfqpkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: C1LyEnWGxk9pPVujZ44kcd7OeJuzf48/zdR4UeB8HoLtBMURURbSSOYKyWg1/lv64w95I+6oXtLa0JtEs79d2DpgoUkCIDQgiZpYvVVUCl5/2rLQhMv0iz5e0zLA8EQWiDN2Pa0IHTxJTssgCxQJ57ue6u3r9n4U8/fdKQSoZKdoe5yEgV7tLnG4IJr9SBhmIqSeUm71bX51BAsLC9A6GH/Nl90Jc5RcxG7J4d1lpOXwZKEhdVwvbHFpAUTt0iWxGeID9pHRyCHz75l2yfSjpSbjOMQlIkPc0iZ9GAmQ6uy/EzWnxok7XHSWKBH/KNryIQiPAzYK9TZ9bhx/a8li+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fdd636-a254-427e-8ab7-08df4a72e8c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:50.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpU5oYUrC+xqrHehoxLhsPk92VyK+k5gJIa25MioRGh9wYeSwU9q3pk/g5aLMtcJ76jMbkW1YizxCoKutc2+fg==
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

Add the retired-pages node type, its attributes and the
get-retired-pages and get-retired-pages-info commands from the drm-ras
retired pages series. To be replaced by a sync with the upstream commit
once it lands.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 56e0588af..e7f2da18c 100644
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

