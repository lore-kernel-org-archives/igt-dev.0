Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E48C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1A610E126;
	Wed, 15 Jul 2026 12:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMxfd6wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3210F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117698; x=1815653698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nVrj7IHvT35NY8F6lZ97fBlsYXCOLW5yMwM1qvwD2no=;
 b=KMxfd6wxkIYmeykm4tq879tHsoaoulB4ROqwtDi7UoTSZqvGOfE4no/L
 JOEswfRySORrSQtGNVDW/wT3T9S3R1vUxY8NFNj6g0iJfJsuoD4sZgwAy
 vKRPTPAFAqAq8ouj39WfVE7zbLOCAq2lVixbQUqvt2n5akVHPGhAq8Y6T
 BUxxt2c3VfltTSeRFhdSlXXXpr6DVLQpzDELbz34sLYaJZRx2iGePif77
 In8IgbFLGH8GO1u9dF2rvTjfeS3q9W/5bUOwSvJMtssXVsiiVBORM8+9s
 rTPQ/Md+8S/0JU4/Q4EI6s+S0Jv/qh7PXf7r7LWWhol2MDaZq22A7AVtr w==;
X-CSE-ConnectionGUID: 9//LcXEgQhaLJpZiqnS6VA==
X-CSE-MsgGUID: ttaQq+O+Rni3Mx9+OHKaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84606974"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84606974"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:14:58 -0700
X-CSE-ConnectionGUID: 9eDCKnsySQKJnCWu8Z14jg==
X-CSE-MsgGUID: 0YVJ1ycwQWCsfVSYhYdYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:14:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:14:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzowEPnVE1X8QymTMgDMSSrjUf/2xF0P8SrhGDYkTAvJM0HkXAi1I42Gcpnso80189Dbh8QOPdFJE0hdZzP3JHWc1nDsVX7sp7PkmZ/H9PBjF/A0hAcEpDW2tFFF4jWp/weq0qoKjmugUxNMHCQrJy9FmC8m6f6T5icNfIBysqmMIXh3YrLQFR4CE9187tFcoxBvwFjph4SbykN2eM2A/byuNccojK74Tw1qL2VwLBmrZ8bUpF6XgOsNXVD4kFhosMczUaEkTknEnA/vYoQv0YBsMRrLlyZb7laTWM6UosBQ/J07YLUI6pwpM4pVp76PHW5ixIDSSvfiJl8CNc0lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ3vFczwVJMsEgCKu+Ogn4lez6DVavVFnLrdEvyT+6U=;
 b=WBzPTbpjtMxwRQ4SqiJqt7IJstp4VzSO9RB08yeRV7sztdZHNrIPeOLSnmuILI2ahGNtKmON1HFj7QRPHcHMkD6PJ9pdH3I9rEd5m9dPJMJvKGbXL7hl48lfH+pJ5bcDmQFzAoAvdqtmmh6M7Gpoa9wAugGOP3vb/sB4zd0/IwBHdMz0lay0suBaxsYWcJWGt52uSH7thmdtofipDQIrIEepO+Am7opdzFxKjinwf/ew+myQqCeCaHjebUTzrk2buhPmRNadz9/sawfbQubzQL5Uc2YlCp/HMORnGMBRtQhkgKxqFDBclq2Aub3Gf990zfY+9+u8XAS3hkEZ6yGqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:14:55 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:14:55 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 01/31] lib/igt_tools_stub: introduce static
 sub-library for tools
Date: Wed, 15 Jul 2026 14:15:11 +0200
Message-ID: <6cd55f6efb0ea8e6dce0a66de140a2010100dbbb.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb4c973-f610-4662-40b3-08dee26aae6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CYqQGQzpMq34eF9JSZGuTgyEG2HRFHwXTjUYpdCJzW/tq+vo5g7XejeXkd6KiQ0IeBJbrCPBHb+17VHRw+ZCkT9W1XFnFqsLM52DmK59JWXtMwZ16Bv5pbIHiW2U0o433czjNwTaGtaxcyxmx22egqaFHS+StlP8cm/R9iGjQrJI92hnNrqUZbArNgCIPxk97C5IuaUwvolHYm+A6PNy9f70Weelotn3UFv2AXWHfTjvRwsCdL/9mbXfvtsOCiz7RM355soPUkCLDn/JdzzzAiou7cvQzXZRz171CRgygsaNsDV+IJBnfQqGMIPZ7MmQx2WWBP52NITMrJmiFWil7zk2plneAVA8E+Y3WFj8nYTBBk60I6m+zUghUnWPEn+Gf3xCFdgTuVvSGagGuvod3Ndik3mhtsg099HV4kzZCWEyPxsgBaeQRpeg5LjewW8wSF+VuSyxHL30v4eoDBN/KAR7UMJ30tc5sKyahkGDZ8LwV+5+pyPLa+qghJblju9qmnghSE7bEipTrR05Mu0CNgfgTuvibs+MLL6xTv/stbvtfkoxdIvBynuq3AenyFPfVBGsqL1BX5QEsXD0xblLh42R8yQDL1r3h0f992tOQqjrxHMFTUfK3BeZXsxhOlQOgYhVerGRB76+vbXjIcntG9bxbGphyzYaBXovo3k2fLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f36As95FD5EjIyTKk59HFFsFWci7lsbwKO0i4kQVqXZYR157QOWZGZqeCHUq?=
 =?us-ascii?Q?PtUAhtb8djpZl0lYk23HZxwQtqOPvQ6RnIRPuAi2xT9eTKAIKrpOOlSz1qps?=
 =?us-ascii?Q?DDRXxaDR5hxDFWET5OcUUIfR7dFlJdLcc4BbP9OhSHwv5E5TpidEDPJunV8o?=
 =?us-ascii?Q?gFWc+LmIqzVgtYx7wjFtzxhJwSeb6ePotvOY//NXZTapLnctKPCPLnLfVCJH?=
 =?us-ascii?Q?BC5l6MQHTQmkKIVRijkJYpwouJFut+l39rgqxnX0Z+LSw4gkndU+tNVQmiAH?=
 =?us-ascii?Q?6wakS4zB7xsnWCN+nAg+dhVw4Xj+QUZHlEvy30e+YZIwZYWHYu6WvKumvVHv?=
 =?us-ascii?Q?1hHyTMTDrosr5CCHP0vSxoMwVe81QRpfKLEyDjOdj3uFwxryPuKqigSMxyVP?=
 =?us-ascii?Q?WEDOE/fHX4ggfL0pz2Y5fkjaGl7bQB9uJDQmBEZp8sqnmtXSi0V/mwMw/Z4O?=
 =?us-ascii?Q?cgw7SxWp4peCg/MFESWg98ctILD2MJjXx055AZWcryI2Op5C+hlLKKB7dqpq?=
 =?us-ascii?Q?V6L1I1C6BjT9j/Jx7ZJI5XnYtpE38qbE6IHvCzuogz+r/yze1sZK7VSi/Ji4?=
 =?us-ascii?Q?WHntzZr4PhAGHOzWGlsnVxQ+/C55tRSzIzX8tHp1lSy81jB/iOYCfZHtKwcL?=
 =?us-ascii?Q?DnCeKASMz04BCqNrOed/hpC3/6UDHN6XaFwC0KEde/V5QmoducGoZfYMdTVz?=
 =?us-ascii?Q?CpGsVKQgsgwvpL12fLu590EfXebSU3kimiIWGLQQcaAA26YnZpuK0tU98Avb?=
 =?us-ascii?Q?1eAHcvujlOSNHYqhOe9LJ5q2dZowiDRr4LCgQTVN2wm7brT8PFaWVFDw+HGe?=
 =?us-ascii?Q?SHbuZD1mTgAXN8XufJvysYgueE4P9f2LDZgt0gunOnEF9evVZKrefjJeOMTf?=
 =?us-ascii?Q?KxaYhSXk6ZNHOQZgjEgy9d1vjgZP3Qts4tpSCYPoT+gTArvW1aP5OLAXcPKM?=
 =?us-ascii?Q?HX5x2qvWcZHIW6M6/r0pltAR/ESI73zIbtagZnW0ai8Era9MyV/oPoLXMQmR?=
 =?us-ascii?Q?P9o7r1HTLGt5FdrXud9AXlO0dvJIRH60Ys/lJBB7B4z1qdKyrH9+X82Z4lay?=
 =?us-ascii?Q?feAudPydb166d4DFWC+HTfW5Qa+1yiJozV4gOouxVXgA3TL6O4RkSJ5m0Soc?=
 =?us-ascii?Q?bjX7PuCW9vylginNYnp+FKMIOvH5BkLVyx5sXqxrjyzrwZhtO0CES8VAzaus?=
 =?us-ascii?Q?tNduWVG4yKTbwhoYojpgf/WS/SpGsjTmPmOOebc0SIVjQYA2fo/IDNFmiWh8?=
 =?us-ascii?Q?+DNT7d3jek1FRAZUEX+8crphKw+i3+sFYnJja+E1LBaK9JUWsPdnRWRdAf6g?=
 =?us-ascii?Q?+s/53gqbRcFP3EHcA15619ePCoSJXP8hCw7cFtbmz7QTyV6y/TAH2LtUJ1h/?=
 =?us-ascii?Q?yWGIOBmOcRH3V9djKsqJNnefajj/944+e8VDG+yFaCXRIpLlWCPQvDQ6hQ9j?=
 =?us-ascii?Q?228/vOFD0MoE3jiCB2KRxZkQfDkOD+c+S3STB1Du/kkIHNxxr4f37kLXYkJG?=
 =?us-ascii?Q?eoMS1UefyCflKNmnoPn/GyYOR2xvDYJtVmv9m0W8UMFWxBm1PRL6aDsICKcR?=
 =?us-ascii?Q?7/+7hPYb70GXSRyjuRqOUElawyoSRa8hCP+GsDJ5/DqStOIPmVwYv/L6frT4?=
 =?us-ascii?Q?3V4hJaWeAK2uUK6v3g1jEyKGnJwR5ipbR8F06uOwPXplwxnNRvjlpNVmzgHm?=
 =?us-ascii?Q?fAMEpTvEkNmFAeG2uUMs+uuNnhATph029YlTX0uRKQ99WNslUIZgjB8mDnHz?=
 =?us-ascii?Q?kENUlqjqOVsHfpP4iGplMZvIWgJNzK0=3D?=
X-Exchange-RoutingPolicyChecked: Tx9gml1kTFryDU/1DLbxdNsUvg91dIXLv3sN4iArhsNsvJJway59VKR0WCUMRxKqMuTnc6B4hpbyeEZZ5SbISGAMIhZBUqDzJ23rvsIgqA11doSumNB3wnad9zNpYbBSlLhZAmUU8PAkFl2wFs3iOdszaC/s/o41dkHJVo/6JT56nUSZhpUvgn04sZ+hjYjdyit7KyR4utH2Otzj7LAZJMXiLwWWsZnuGqpbUOz+cKUCRYA4xJ3sHLd5UEnL9EpSUQrSEjkP5kdspS/QOsw25WKdMyUq21UdzH/ck4WI4qgzIUL5JHU2LSpKY8SXzlUc2+YaljX38f6avAQxpYr6CQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb4c973-f610-4662-40b3-08dee26aae6d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:14:55.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hucvLcw+t6z/NAmXqP67hLxNVa2+kcMvCvf0pNSQcObZwahRCS+PxM+fg5tyCPOHRVllxUwAt9MPwb4H2taszQD3HIf+Dzzn5UkxJoXSU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add lib_igt_tools_stub built from igt_tools_stub.c. Tools that need
minimal IGT assert/logging stubs can link this without pulling in the
full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index d1289a5e0..e95b29d49 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -349,6 +349,13 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lib_igt_tools_stub_build = static_library('igt_tools_stub',
+	['igt_tools_stub.c'],
+	include_directories : inc)
+
+lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
+					include_directories : inc)
+
 scan_dep = [
 	glib,
 	libpci,
-- 
2.53.0

