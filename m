Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A121DC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 18:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC2010E061;
	Mon, 20 May 2024 18:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmXm8jYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8AF10E04F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 18:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716230127; x=1747766127;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=qLGxvscmwFN1zmNhjbbWao8A/g1mt0Z3zE1HvyvzTKI=;
 b=JmXm8jYaGMO9urbJ+tqZTuWi4nz+8zk8o7LwBHS4Vd3U4jfMjiNz1Cez
 Pkg6rno7KKH37KcBNEQ8g73PxQsudFFJGLp65cJqPW/PQSX0ZlY1c7NwO
 3PHqxAJpYD0StHIv7ZD9Y0jKaKYypgkU5uWoUEenObldbj8bExlQkx5Ay
 yoT7nViy3HTnqj92a8sX3uAsuzp7Ixso8lT9TGhlV38v7VyG2OVIQOvwy
 zeskiGH+NT3aivzaFXUkuVYQknNcvSZkytypG/jyKsS9n7405UC9MhaPl
 M8nBlSj0czf0mO/5yt/YbZBl6jfFXu8GsCGFIJ15qcffh5AYCgAW6tN6R w==;
X-CSE-ConnectionGUID: TKhh1Gx2RAiWqWfbi6Ju3w==
X-CSE-MsgGUID: wI0x/BkqTDOqso5q7l9/fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11610662"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="11610662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 11:35:27 -0700
X-CSE-ConnectionGUID: YamAvecdStCicHv5v7zjvg==
X-CSE-MsgGUID: 8g7oyCoMRgqtW/GMvKPCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37395068"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 11:35:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 11:35:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjbhHLjT0k98krZ3q3UnrURa3IXUZrbvTA0sOWrWUxypc5LsqIMKaM9Oxu+Ymy/QlFEMyGrkKcJoBF46sOn2P8o/xWgI4a9gq3W1lSM38xU143Ku/BYPpyJt4mqQEnfFZuuGuXOkJN0b8qMGB/Wg9vCDgaB5uQuYHcHIbJkKxnaMoFT6RA8z6J1DMj5U5xnE54HV/7r/yxHkCC0noI8+A3XZewCUU16HqV+LfeY/5xLzGoZEKSZFdl42+tmgxnA221g1zB58YjdLo4xZL6Jc/MMGIqZm2gO10gxMRupXZ2u5Bia2nrGvdm5Dokpnc5PxZHsKWCU8YCHKr+3e6s24OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO6zjMMHCBe/zlZprAKRPVM8sfmw9lNsUgIv1Ugk1No=;
 b=O2ZokjU0RdZkxt4nc+ihjZZP6eA105Tlmrmjnr4H9L9xmeryqhiudZU4gCS/buPVxi5zHi77GFUDjJq39/Lbc9ScXoUIxima+M0EqR5NRWC5/Z1slWp0Ot23D/vNb821QnF5IqfFwm94nWGReqT40Dz/5UT2RYVeWkqwZze8v5peQeVl/VHPx8sBdO4fbOJYNpzv1wY867fUTIBK3re/ck7XGgeiFisvfi7Bvz+JcGiMtIsXlb/63OJZMflsCSOLqX9Ta1PfilRubBnqq8jX/n9tUA8pJ0zWJN7W4knZufSk46tX0h8BRBvkdJy/UTaXVKKeMRZSLaenaUkBuqEtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Mon, 20 May
 2024 18:35:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 18:35:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Date: Mon, 20 May 2024 14:35:15 -0400
Message-ID: <20240520183519.227167-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 97725d84-7ed8-4c5f-016e-08dc78fb9c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4cRylNC81WJ+NQlspFALTsxX3B1xhsFp84f8cdJtxs7pS0tCHJ7iih8uc3Y7?=
 =?us-ascii?Q?AQ0SQ8lmvJInVtvhG8gaSvCfwMom6IvDX/B+FdlzcRFD7SBHggoknlSIc9sO?=
 =?us-ascii?Q?MkDa0CzLzVYmfmsH9ul0w9OUpELZtDqYCBa0xcsrlywIQjKcOXON7r3OtiTV?=
 =?us-ascii?Q?j53mv9BZzaCvE6XGXZTMoH8aNCHjlRkVZE8yzYbE7TsDUnm+EfefpYc0V8Re?=
 =?us-ascii?Q?pN0+ljsKGA+huNRxwWYzy0adXVJdgwEEcQqM33hahBATMiW3Wq3skXHM6HYA?=
 =?us-ascii?Q?t9zbh8ibQeZwus3747zaFmn92KJHgaQiFghiOSOdMYwpA4PhlTJ3kihQ4r78?=
 =?us-ascii?Q?SPt+i6gkHfJ2Pic5x7r8K6kPpL6m8CEc8dX3XYWq2rJVwy3S9DZekOKSNGXp?=
 =?us-ascii?Q?417kjWrpLLO/0kJBY531e7Kri+td+t+Hx9VcvOJPcJ9fvv3Rr3e5CgCeut8Y?=
 =?us-ascii?Q?Xvmxukn44Ub5JT7NnYBWZyQpdw1TpD5e8ugmk8W/JZFUQmpV2lT/K7t2OiL/?=
 =?us-ascii?Q?m4kH76oA8hzuoldZOp8dlfoyed/b//NcnDedf8N4el1YAH2ztRI1oY2pq7Ib?=
 =?us-ascii?Q?zDdzOryJDXyETPTNB+OcKX67xwCjT+4ejQFi3E9rUb5aXpYsKCFgfNWhmfVb?=
 =?us-ascii?Q?RmwK4zNgm85bEMnnLf1CD5tJz7UqOWjypZbzVouseOifjgNS3x+4dklq3KO4?=
 =?us-ascii?Q?b8PugnnVQSCXVp9O8Ge5UCHH+gpubaczFwBWwec83APciIp6wrrpSZb5Ttuv?=
 =?us-ascii?Q?ujL5Ncb2H4RYZ6shd/igvTcjsZ0LrON38LWCSMeOMKVM55YPDXAjA0LT3ANi?=
 =?us-ascii?Q?QL2vzSXLxLwq5v9OABKlHF8C6eMyK9s7Ykuusg7/iiO0D/TOjy1VYeGwZww6?=
 =?us-ascii?Q?P8U2Wmk4BR6LOrhYT0A2nBWQrVry2N4b//nfmpOj+IMzQ4/tcPFZXCNGjKpM?=
 =?us-ascii?Q?MQoYSDhGW+w2wNkuLP9QuheGvUw6AhK514FvvqLf0oK7mev3JhmxwCbpjtI8?=
 =?us-ascii?Q?239H1coC/30tzOiQCDrRaVttvQRmk/RJf9uCPmctfuTGfcAIKEyswiIcBqBZ?=
 =?us-ascii?Q?IsTjzzkBe9J9EiotP4Y8ynRXGXzTP6nz5QvUz/MT8Q2nMeFqSHHG2ErwPPik?=
 =?us-ascii?Q?wUQxA08l+lWzhBkhEcSK/ap3qmQ71eILBBDzcYou5go3oHuiesPNBXZef46I?=
 =?us-ascii?Q?nyfd2tIiPNpS7E2gX6LFXyJL1amBNEY4XZvHFxehfppN3/ihj8qmkNzV25Zp?=
 =?us-ascii?Q?FW2XjQwc1WP6OlJCrhWMFPAmOCZDbHd4BPFh8yN/rA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xFPSp4d7+rV7s/vMFj5hahdXF7CRS5w6einqYpSk/nawxxV8l56/88nvW46D?=
 =?us-ascii?Q?PXbG6kMFMp1sb/a0iqROjnHamtu2Tzf7GPDl9ZhGS84h70r0OqXmOfuuRutv?=
 =?us-ascii?Q?K/mfKc9F8Qb3TPpFOd4n3Qwr/vLcmFHriYloC205ux4PNF5E+jo4h86A9eQI?=
 =?us-ascii?Q?bZRREBcFuYfxSNgnzN3FHYM24AkG3NLIxDn1s+Z+TFZWDlFvjGp1pLxOrqDY?=
 =?us-ascii?Q?w8bDbw8YHLQ4e1SVrwbCIGAbp2pq0G9PILZWclYGBIGyeREbbhm7Zt3AqPfZ?=
 =?us-ascii?Q?7heOQ6tBQXcmdfamIo4kw8qtazAr5Gnd7aLMUwjRgFcDXW3+avoKg+8zBEF3?=
 =?us-ascii?Q?i3iNn2Gxc84q12CE+FRDhoVYsybO6D6XXIEm/pzz7iUcvVF3wq1MPfWjD+zC?=
 =?us-ascii?Q?G8zFDpPePKQCAYVtzujpb9PhWyF+qorQpL+qBSYHCn3UWfVE5+LMjtoxgvso?=
 =?us-ascii?Q?px7+ywgSTCMFoVGZdpPKR+GSRT6oMuN8BGQvKgrNXTnKMb1su7KffiUDHzLs?=
 =?us-ascii?Q?MNB0JqZE0NhZ+wfTCGxxxJgCgAKN5MJNPH6lnzyFz3CHGr8Zu0mTD2FP5Kvj?=
 =?us-ascii?Q?TzgAZB+kVO7GWbOX2IK2a4BTaoIUk95paDEwOMlbnxTkIhYJ5lBPWnVL/n+E?=
 =?us-ascii?Q?tL1oVR0jHf6/fRsENc/O66Kmu8ECOn43B5Vs42mm06LK6LxaeqZ3qlfHSXdo?=
 =?us-ascii?Q?T0A5MFUkDg2oUQYC+nnJHdxcqVLJRTR5AlymGwjia4Q+AM6Dj+jXIXpxHo2w?=
 =?us-ascii?Q?OOthnIDUKh6zIKCEnaBXZa2jJhEVULtLG4csBPFpj8fKBnTWkTRBZbvOGfhq?=
 =?us-ascii?Q?UEtezuADIKICpbaxj0R0YiZ7PvSAtIsYIJFRIiCB50VT9KT7V3jOrntf6bMX?=
 =?us-ascii?Q?tZ9gU1JGGPffohAcobMvzcNi5L4eX8920+vD3i0mV1m/jm5f08utocjj1jd3?=
 =?us-ascii?Q?4uAoWow6V+P1ciVKM0Rv3h8HOlQHwYi2ci9h8up5AvarINi4crcDRa64Id4C?=
 =?us-ascii?Q?jcaRmIZEnpXxdBuzpKL/ahwCEA7hP9FppzZzvvEc7j1Z8HXqfk/u31SwPJgO?=
 =?us-ascii?Q?rciqoUuJg7Nz6RgCZG1MnjUdgYrQKIVFZUwmMrhIb+h9PCPgt3TT2YU1ZyXk?=
 =?us-ascii?Q?nxJP3tTxUtei8sl0Mn0JdSrMdOXrIkru/UvFrC1gJV7fAvWdPS5uic0Twdhh?=
 =?us-ascii?Q?7oq+jgm34zeh3vA8AGkXqNnPHFdbOKHPigvyYaoFtrDuY9UNcuXSOtwqOrKJ?=
 =?us-ascii?Q?KxUQng4AmRwvl5yx5yEei/c7qFdx/vXhQCRwTGhTHkGigCzJje0S3laAHlnI?=
 =?us-ascii?Q?kNRDGeoYexyUEhHmD54o4pEgILcW/M6w1Lnt3U3eScoiuNLQ6IyUJMK1gYwh?=
 =?us-ascii?Q?FkNtI1dKckcqmfBwRvsc0I7w1GrPGK2g0bfmdkFx1zA0rVZdwuBVGkRmOS3c?=
 =?us-ascii?Q?cv+b/lMDqFhggn1eMcfSkGlDkGPsFUfbsncuegqPKtxl4VMdCoVALEdMGkey?=
 =?us-ascii?Q?ymVJuB9sGrqa1HUuaGjEsi8238SGwnfLWdyFvhB4UrxfDgDiqBV8s3X39gR0?=
 =?us-ascii?Q?/OsamznELyjRAzc+EwWiUJIby1ylr9PJ5AEjReLv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97725d84-7ed8-4c5f-016e-08dc78fb9c50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:35:23.6395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3A6qCWBlm6guHi8yeQed/e8z7zbHO/IJoCnj8gGsrAKO5itrbdaYmvdkxGy6vPfMqMoWF2BMwcRGc1ZAQ6Fbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.
v3: Add doc for the exported lib function (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 24 ++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..928b72685 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,30 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+/**
+ * igt_pm_get_runtime_active_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been active.
+ */
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..b71f7c440 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b4a8c4d15..b9968b439 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -323,27 +295,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b, active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -381,8 +353,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -426,9 +400,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -456,15 +427,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -558,10 +527,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
-	int i;
+	int i, active_time;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -572,7 +544,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -582,22 +555,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

