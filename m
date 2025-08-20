Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E9DCA0EE6
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 00:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B126910E02C;
	Wed, 20 Aug 2025 00:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3kHKnzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667EC10E02C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755649279; x=1787185279;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WoyLJ7dEA2Dm912e1mBV88NLHswIwK8aWkBxVF08hrU=;
 b=c3kHKnzDmiYUcr61ZUJHuMFkx4eATzfCL7bOB+x5rFlGX4WzaW3P+fGK
 B5zPpSnYvA5OvDoqOFBjEGyhzPLp6+TNq2Espt0Wlr0h1x/vJM6CMWxzP
 6tii0pLGrJYy2guM6unTo72hF8RxBL7AbrXt3IUsiQ2dRNeYkQ4n7x5Nq
 Tfwe8yyNlf72cwsu8Q4FsTujWzzmwzpSXVhYBPS3PZbKfpuqJwhxXKzc2
 k+gdZHVxBjk1VeHHyXI4p9UIQeSXYBXGSCsRWWybFVbRdAYu+9Le8ETiB
 /cjwJ1AUcoLh/ogW5NtBPgpotFiL2sEBTYFK+m486IUF8TwmWbBlgi6Qz A==;
X-CSE-ConnectionGUID: zghqWZZwQmutca+bCqE4zg==
X-CSE-MsgGUID: vd1dMUZXRDe4p9VLytbIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61542541"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61542541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:21:18 -0700
X-CSE-ConnectionGUID: aJTA/EXqQnaEtUZjGHZAUw==
X-CSE-MsgGUID: yZQuhQ9JRnOGGfItXgtPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172416783"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:21:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:21:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 17:21:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez4r0w0Ivg8Q18nNj2wlO8V2/Ly1TKpAKJvSDk1Atm6sEnBXTqap98AbgK8ZhE9X7+oezBTPzJmAgQapHGvta5Idr2/P6RnkMbaQnfhcop4tCI/o+m/X4eUvMSOVAw6L/ybxuNu2r3PmxXnsbwoeD0NXdESRIv/LYcDclH26dq9rMsOTsbhMjD/4YPbTfqIRTTLfviFUZdwf0x8tKNKATfm7KWywVt32WKlCdC14yQ3wN8P0QH62+X9KLaT0ONdth4/8eZlTfxb3XVoa6PTJ1/pSgkTD05U2Ml7lhErp34AysCNK+E+V7vhubLTER6tB9b9uHU4crYD4x1Zy9XYsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cixQQrv6WeV+DHH/dJDovf61nc/2mvxSOWx/FC0UVOQ=;
 b=sCsO8N8piuFvE8zil6ZuVztqZJzGzM4frDaZEXZgnK0us0AAIYBUYWkG5xU2Hoggn5VRs1LC/EqWj00A2mDruTT8a0yZAtvdEH910IJi94tphBsBrcqXG9XdWJYHdS7LyHeVHdMzATB+sfobTRm8iOXM/Qqc3YT/8QzofhHn43xz++MWHOkXsl5M8XimJI28J5/YnNMjGfIYo8vzRk4GRVGrhdwLFT7Qp6rXjIllVNAps3peKoPCdNvL6GS0ZhSF8lA0uHF3EZ1qjf/40sXXS6dHF8akxDhYAcIu1hHxv81S2droOXWJZmoP1afscr1EK2hemz5sXKxln3CHYtQrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF524F3F9FA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::829) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 00:21:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 00:21:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Martin Monroy
 <martin.monroy@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/xe_pm: Ensure we open as primary for setting
 display off
Date: Tue, 19 Aug 2025 20:21:05 -0400
Message-ID: <20250820002104.312534-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF524F3F9FA:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9ef9c2-351f-451e-a95e-08dddf7f7887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cyKNxNguSZb0hW7rG9qaL77QkS0CKz3g8tTcV0f+p+4iOSHrm2HrGosYLyEn?=
 =?us-ascii?Q?DaHgc5mNPJ1P/A+Msvt5VBWUuKQf3qpZeX8F61UiEivrD1baB9bIunw2IDr8?=
 =?us-ascii?Q?RRzwSmnixAFZeIPKl3uM+8haVyTolc9jbvpQdMG6Au6tELBhFDYWhChZgCMh?=
 =?us-ascii?Q?saMqiFcMhrTxPAGXw8ZRDca0CAWTPYOziscLO5IzQ5YgQopeetlwzTaVXgT7?=
 =?us-ascii?Q?y2jyps3fkHYwCTVllRHMEOw+YgI9a9jlgYg5yUEC+JH997rnV5O2/8bUKwTA?=
 =?us-ascii?Q?rHCCFOv0KkLMlG+jKYRt4CwG6EAzaipo8kbxLO8Cl7mQ4lBrHz8DSx5iLmJm?=
 =?us-ascii?Q?zZG9Vje+EIhUKv8/MaUd6nqw/FpAfITZujkvbEklhgH19KKvWVZCpBFHaVyY?=
 =?us-ascii?Q?OWbrTOXcgpwd9vI41tMckhtcQODdTs9zDmPC2hHF6X5wxs1m1VvmQQEdlxVS?=
 =?us-ascii?Q?bRk7lV/BXbmN6TvllwZGM0MJwtXOlXZXWY2p1YxZBHG5wQlhzPftyAm7fji2?=
 =?us-ascii?Q?BSUllIOubgJ9FAvTDQWHd7wW/CPzeRyVBHhnsGyY88bDQwtrh6wPKKVqYCuu?=
 =?us-ascii?Q?uij128HOhl2228RPL0fks7NFyAUJ86MBQvYQ21+jbSCY5OhMPk06h76yAL1U?=
 =?us-ascii?Q?iiZdZcyrydVITQYLBG8KuOAtUOfjRqnSl3UiBGlrEf3vv4jzqQDD4xWZceTi?=
 =?us-ascii?Q?JNhuKgcKHDki6D7HYnFflHa164aM6KPnKumb+XNJTn5QpWcq6WJIUUnOvDqt?=
 =?us-ascii?Q?UzvV2iQSXCoXnOyCuqi7IIRJcZ0frtjR5OZCwthXWzFHuC9DurlltCzuW8v0?=
 =?us-ascii?Q?c3jppMlEadVbTRvUoA+E/IViiOEYIyaZKA5TYs111XTqXOQUX5TmfgBzxx0B?=
 =?us-ascii?Q?LNeGRaQQc1BL00Pme8GhCWiLcqJGk7XL8hcAR1XpmvlNVUFRAEIAeZlh9VJ/?=
 =?us-ascii?Q?soHkYs4TyMi6bDj1z+nDtY0k/DH+ta/YzO+0ALv35OOMdZDh0ZnhNwMayBEs?=
 =?us-ascii?Q?aJaQIJ67secdFqmZY5iE+V3pdlJ3YP3A/Mm2FGXmDV7m+Ii6I0Q+hBKWv0Ww?=
 =?us-ascii?Q?oxVRPiDnkXnqkPwCAwKdGDacKgMRViZpecO14ASXb3HI7qsgTraOgQLc/wHV?=
 =?us-ascii?Q?S/GInYKrYTILscuV0TNrlDN0aS01gjovN7NHuXR0SH+UHKAr6SXfLpgUKEDF?=
 =?us-ascii?Q?Dh+uqzQFOj+G+LUY3Y/lvVezs+AoTLq1eHe91F419i1jjBHOPcPlGODJuOms?=
 =?us-ascii?Q?YK85xXTU9UzIPEXVxy2kus8EBp/bQXOv/RuQInIASXxXagCmPRRj9buvMBIo?=
 =?us-ascii?Q?0aI3kda6pHBZTqJO8JFUkp9HiAGZGio/5u8w5JjrYBtr3LORCyIGqGuRy07h?=
 =?us-ascii?Q?bD3Rvmpi9OIYdDG4xKgytJsrjW4vkhe/CCm8lFvQs0DPCJO99CJL4ISMv4Si?=
 =?us-ascii?Q?gC/u/rUO2m4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYW7+j1T3fPP/s3Gzg1Pq/6QW7kGCLzrkFOd0b06/zqecnU5M1iGkD6kL1zl?=
 =?us-ascii?Q?6GidPCv0T4t3EENgCYpfDwfLI/AW33+mRqi7OWeWbRdkx/D64/toIpqAJyd8?=
 =?us-ascii?Q?2WEeAle7y7ftetdkVG+irIcIreEF3GVJYsfpvbfOOm0PNI0QOQnFdcGdAOTd?=
 =?us-ascii?Q?ATE0sz4tnXqZJQ7f5KDec65fp9KLXVW251Ed6Pnx7XRvbwDo0hY/CSAdA9z1?=
 =?us-ascii?Q?U0fWT4EVnbZJS2SeN6iH7HcFLJ0DNXZXPKvgpdw0Wn/AjZBcXcLCbg406Hve?=
 =?us-ascii?Q?ej/a6Wv+XcY2VDmLLXZbgg3JSxiK3lXFTnCz9nhiCARlvc9Kp8ezylbI+dT/?=
 =?us-ascii?Q?PRZX7rPNdQoqJZW3kQIuE+IyXqP5AhwTcvDpYN1HYkkM+PQEISg+bIWS0dnR?=
 =?us-ascii?Q?MzWZruYUmfSzzEoJRg3KJxpglBgHCVpOKw01+y/FceGm6LDk5fs+PNxUytzI?=
 =?us-ascii?Q?mAcxGvUhZWz+GvfEFDOGles+hZzIlbjMMAtBSoyuYPbgzZSsmqWZYQiMQ1Pa?=
 =?us-ascii?Q?lDfgUMtpBVAwWnsaVP7j1G6wsOZUT4JcVVTJO8lAy0YS+cmY/3QWlIDFXGAf?=
 =?us-ascii?Q?a0PzcfPso8F59kEQXKjcRjd0tToSf8bcFsmusSpw/0VB2iqBB2FJj2X3bEVr?=
 =?us-ascii?Q?D0MN0xVPP3kTFarZE9yfvZotHIR/p3hmTdN7GSPa/vDDGzLGCh+0VJAZzuAL?=
 =?us-ascii?Q?yr8OTcVzGf5L0E/POazflHn0kM246hW1VnFSseChu1OLJb56tytVIW/IAFae?=
 =?us-ascii?Q?I915ROX2hMW9lA4+eAWtK8TiNdMRS7Qd+0kwmH97GAZ/fQPabcwrKyUEERj6?=
 =?us-ascii?Q?8aJsgNWcNJK4w/akWsmPx3kmNMnBlCfGhKTx8nrmBHHxkyosSaAopmPcJJj5?=
 =?us-ascii?Q?VbHCQXCoYgkEWzfpGdG7JkAJ+sUxY+pI02f4cPz4VP4XHny5mDkCXAoO/2VJ?=
 =?us-ascii?Q?KpXtaKKeyUdzKf6gTzehqyjSVgD1C26XLimZ8vu9NsA0zF+0nm3cqqCQdCs+?=
 =?us-ascii?Q?Q7KfjrbBvRxqEt245ty+rwluU9ejnezcYsDPsRU7uoo2SQdQQYF6rPPOHjOU?=
 =?us-ascii?Q?ZRCh3Nr07ETU1KONA47ucEFY09nysLVa1BcjmenrVSc1jLbh9MsRaX62kOLU?=
 =?us-ascii?Q?nOdAE01oX40tli1LvrCWJdhhbtE2/jN3oWcUKnIZ8pU1VedY/KzJrfHKZEmB?=
 =?us-ascii?Q?mJsRYJDTQQjTfDdIfL2/4lj91n46GsfGldnWKzfKOkb3aAUqNG+Rily9I3Bm?=
 =?us-ascii?Q?8wPTp6mrU8+G4MgtrlyWbDQrjK5wi/zrRg09KMB/nv26X18Gi3N3JPIt7zUY?=
 =?us-ascii?Q?ko5judZt0+uSf/PTE1b8cwV+nRORCVT0bgt9dtQ7uN4NUH6K2LHizXyrBXCs?=
 =?us-ascii?Q?RKZUZqmWqmeLYvyPhEJuShkPpltetvbYc3PmJWRO5hgy4j3n5LHO7R7HdtjA?=
 =?us-ascii?Q?KtL4C8lIB4Cie0V3ZG1bz2ZfJrAmc4JGMgZZCqfz156gh2ann3unIFVcNw1m?=
 =?us-ascii?Q?kSDMwnkHJ+Rga/R8oFyKaioIbsC+0o8jutZoc7N3q42H4v+vcezv0wghVLJY?=
 =?us-ascii?Q?965inDTVto0PylEEWPMxsqJRyGnNluS8znNFUIaQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ef9c2-351f-451e-a95e-08dddf7f7887
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 00:21:13.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/EX0oOe+5oQ5wDjU6I907gTkIq+qHnzpO5gWgUE1c8TV26pSPboFVjV5DMvp0/QPxAQvmYKa2t4A2oBqBt91Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF524F3F9FA
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

We need to ensure that no one else is using the display
so we can turn it off and guarantee it will drop all the
references.

Cc: Martin Monroy <martin.monroy@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 46b441c4d..a3a26f62a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -145,7 +145,7 @@ static void vram_d3cold_threshold_restore(int sig)
 {
 	int fd, sysfs_fd;
 
-	fd = drm_open_driver(DRIVER_XE);
+	fd = drm_open_driver_master(DRIVER_XE);
 	sysfs_fd = igt_sysfs_open(fd);
 
 	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
-- 
2.50.1

