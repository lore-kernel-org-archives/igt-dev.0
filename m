Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD0C25B78
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDB410ED7E;
	Thu, 16 May 2024 18:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGUOaK1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7730210E514
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883033; x=1747419033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uohYEj3cf2DnKIcVnG39nRQaV+AjDfG2gyMpqa3B2+k=;
 b=dGUOaK1t/RDVaEBQsPSwgk4GenYP1PvWPVddUU49MmQ4YVz+wi3oNPS6
 jPhF6g/m8PNmA53W84B3ve+4+XR7zQ1q5RREMAZZ9BterXu/wO+yME2dS
 xoIvIFArEAajLej2gNfscs/+iITfvhIviw/87t4/uzPzEEjIFgCympeP/
 nuKR8t4kUpun4hIsbjHHG7tHNyTPYzmNOMZblyA8rs6s/omIJd9BKQBDi
 Zy6IFJamabRSUyJGRjKXT8s0zMKBVRu/W9sl/yYsQlKcGaaMBUgrLJV2m
 xHBmc2sXo8DZVLpwxE10dgaRotN8+ZjF8U9YY7ujoFDrqjDUnRt8+0rtz w==;
X-CSE-ConnectionGUID: yYqqGrHTSRm4BQQv3kIn1w==
X-CSE-MsgGUID: BgoTKQqpSAevnQ7OgxgYgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11888830"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11888830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:10:32 -0700
X-CSE-ConnectionGUID: pOpOwMbMQNi+An6DWwi0rw==
X-CSE-MsgGUID: CMnTRByNRsGCXhkd7bLEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="36411568"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:10:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 11:10:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5irnBYmnYDvtcXzitQ5TP8aPZh+X1iVik22DcUBCJvMLFqcvH/zlxFJ9XnFcw2yLM8ngJvI0o2Nel5ntcRWuk8rsGkrCU4JvWEq+TKUqpNFDgaViHR5AOsrLR+2o3c8yf6OvMfRmez0m1+2N7rGGwWg0ughhYOy7i+jBDIcO2oOs/VH9CvZoe9TxEYQ5/WWcQabw0I/5jD27TsIV+3FDciebrR4Q5VqpWRAT0uYQwi5q3mWdOUHsm1Fy9s6UamTHmavADt6UoZjWDqjJbTF5RwZ/4um6TQC8/cKiP4BNnhAD6cI1AVH0xAfsD1Zd1wMTh1LZ3zFdBCLxTQot72R6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDEjjcGY2uBC50lXJs6jVLQi64FtXF50GjAIuzllKKk=;
 b=Jug9USlt1l1KqNZLOUz/iTJZaE0xnQQJj2M2eBMhJ5UH86DiBw0UFj95YmI97rLO5ZhZPMBzGAS72DYJNHRMkl7254pK6JQ8yIfOVwb3dDLPjS8haTraEr+gLdB31/o0qlrl6PYwhj61oCmFMQLnDeQtFVjajYjW4gk8+CLzIGzyTdQBF6Ys2JAlurc0h/zOJdGcbME5CGY1lGX7HmzoZ4EYSksO2L8BXNiyXr97Q2dnejk3pmrVAS7CPsdeYujwDKI6ZBFCG+qT8DKssZw9YVFL49luSIecCBZQafKpJHz6WY8WEBOdiy863CjNEwj03RrI23qazF4y8ZpzVjI13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:10:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:10:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Badal
 Nilawar" <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Thu, 16 May 2024 14:10:14 -0400
Message-ID: <20240516181015.149824-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516181015.149824-1-rodrigo.vivi@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8e639b-9fce-4110-b228-08dc75d377f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kJGyeQfE9Q5/opmI8qAXE928bpJx9Ylp47+q90Rl8u2UJ4Wbz5xubndW2lql?=
 =?us-ascii?Q?5RQi7u/QeLD8viJ+PvFvbRHvyCmK+LYXG5vQ1Io5VAgS7K9Ab91kU9/8OQTQ?=
 =?us-ascii?Q?IGhUyNKegHAydO5SqWaE2iJT+mR2JudlEVUxcVJQhRkO2GVEi95v1hRl4J8L?=
 =?us-ascii?Q?P6yUrudV0w4BmBmhw5H0rn2M5gZIohFqqOd9+KgF9WyaEQ4srb7Xs9KxqpEQ?=
 =?us-ascii?Q?KAMv8z8rL4cPWHkIEKocfkvQ4Ee6YlZrZvf0VUsN/N0e/FUKayAyfnLUVmun?=
 =?us-ascii?Q?vKEMKj5UGfKXTo0DLEp80pd89T2G4g56I1DZ4aqm/vMkDYxrsmmuyhTxF/nv?=
 =?us-ascii?Q?2IgvVe1xNunhvhqXPgYwDgiJCf+BNz12gVdKl0r3jKAIsv6XbIqF9cp2N7de?=
 =?us-ascii?Q?HYSoXZkHsalotz0ybGaj35hQAkvwTnSMP90nUA7TJKR/NyGWkyZFEfkka9yp?=
 =?us-ascii?Q?vPqFKojS6OfLeuacMRgCGWdGr7ZtIVPd4hVQsXrzJjU03+Lxku2aLkfigQ6q?=
 =?us-ascii?Q?q/h8f9ix1g0Fr4VON8h1fuu1HIxEyw+gaLO6VZurOpnpDUEcHpDtJ6Zf83VX?=
 =?us-ascii?Q?AJgsA5qJDhFOtlclXfhLij1yLpcfSUlyIvtyodGafZR/y6V4WrQOn1d9PwDf?=
 =?us-ascii?Q?sgt9tUbAlvY/HZMF/YRusXGkqtos9cLmrbcXefKHrDm2nozbOGpXBvAOe2CY?=
 =?us-ascii?Q?sARpTAG2M1/xHFKJkmbE+i3EokWERot+lW8Sx/hhVY1MKbfwGzM7fa/QncLI?=
 =?us-ascii?Q?W+fdYca0Xx4VV1tMeVwVjYWLfxmbspKoB9Zg59BqVy/0nxkDEiegixcdUZJ5?=
 =?us-ascii?Q?5Wu/fBZBk2EA8JvpXcfPd2T4/xmGM/eKp0CrEwhJS5ovuTJccYBDTutSAqSY?=
 =?us-ascii?Q?in7akz5OVCR9e1ULdliLAzxUXEThz7+nLWHm4uyQRqG7kzo98hpRPHsYUNBJ?=
 =?us-ascii?Q?cPXst6UArcOi6E3Nb2i0ZJHXymrKokxLj7xa8OLUi3McMBAThZkj3w3aN5Wt?=
 =?us-ascii?Q?gnw9b763N5dnZxuooQxAC3cR3g93L3GffrtKwg91nFWaJwu4eQ+fvGhpSGjn?=
 =?us-ascii?Q?PewYm3fgJasLLddZ06VG/iaSwEV+R10lwyboHXFG9SG4x68wkBsB18zFMfFx?=
 =?us-ascii?Q?bd1D0/kij4Ep55YohtcsGQpdrcgtyetgoWuIw+lKf2N9Dca4yju9wy0XjgjO?=
 =?us-ascii?Q?86aGfXpUUnjCJyQBPgkWvQvEW/7bH/qY+kL3Zl9+CN6bj6TIhA3Y2rG5ra1v?=
 =?us-ascii?Q?/wAWy3PIC7k43prdAD35vQhaRpFi6ebrkNciPMyriA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7HtZdDwdlKWrkLRVvity7Z8bG47wwPVsigPjAxRdwYMCtrz3Ib3FXDPOVz1?=
 =?us-ascii?Q?1fZzlq+yqdvI7MTOnX2Cw35ZRVZCNLbpcaSWGfARGyNvxPhiHXhsdjKv9AGe?=
 =?us-ascii?Q?WLS9qfVc51KKmg9Shb2rjX53DOsG1cunSQRdqj9Uwjon2CjZ2m4IEXH0pcgZ?=
 =?us-ascii?Q?hBaJamZjQ3une7VHMNFsVK2rAScZGQc0iuH7vBIpLUOXiAbj810WLWKwgRk7?=
 =?us-ascii?Q?An7aYNbpwpgIla0ceX3VUVYcAsPsMxoz1JCejjlrcYI57yBecHot/DQM9Dz6?=
 =?us-ascii?Q?i3AirtIakrD0D3zTSAvY7mzl8KAcYYX0sI2Ta4aKYZ59VjCrQhj6r+ssjeNS?=
 =?us-ascii?Q?j18Yzj3MAWoI3lvDpdRmIMfIOheKmqGKHoXoVfpF3ISjaMXc8aI/VUuAn5xA?=
 =?us-ascii?Q?XfRBWVFb1NYomb/7PxCDylWbMlUrOU4GUL/gdbRP/EluDVL+bhGPZk1CXO2/?=
 =?us-ascii?Q?1WVvJpxS23Y2CpdgZpIYDSd1bSC+g3K9j+c461Y6Cd4wZOlKmMYpxHKsDeSl?=
 =?us-ascii?Q?+QrCk5zwV/mf5w0REmkYSNZqFxMOtim9ogwuy558kfwSBgvz3DwNzPK10blt?=
 =?us-ascii?Q?mdmcWyDz2vrQ0xahLFLZoNNT7D60jeNNjgKhRp9rHJow293NIoHsSm84jKME?=
 =?us-ascii?Q?00TdcnfUzhp9JZQGwgeZEGHBJSSw+nXJBe+GW8yO/g7650wrJ/0xykWjXOCW?=
 =?us-ascii?Q?ZdisoftFnbkdKujF5qF50oNjPnBqzAYHG8t7yyb24Zxur4NjBFQ+HAIAMK+u?=
 =?us-ascii?Q?+k4HNw9mjpDu9jGCCym6JBYBW+mmfEsgrTnsmhxdd2tMM84rB3RNXz04GEeh?=
 =?us-ascii?Q?FCf4HHxxPVD6zfjIYndOAfPnfhNmKjnR96fD30E5V6Uv/N/QJWP35TI5CIu0?=
 =?us-ascii?Q?LKc3NBzNvOkUtYIHv/gD3WFkm+o1mf2RCAgUwubGOkwEUa0q4UNyspQ56Klo?=
 =?us-ascii?Q?VwHHU1lDXmVr9yaHz7+gVypIH/ali8jWWqFuLUMyTD+3gXw2XehLtW6fuiQV?=
 =?us-ascii?Q?p5eLNInBOaVpol8cLFPP0wNGkTCWWHPW8pMq4xF69sfl7F+FjEtq5xhivR9G?=
 =?us-ascii?Q?z1wun6ElZ774kGARLsXVKas5X6Y1XwqiBpRvatPWw0ajiT6VLrkCmcgOdBHk?=
 =?us-ascii?Q?jljfyM2QAQRdVqtW7hEU0jPZnz+m8IMgiVqaRf5O+LNVm7GCwOZJmHs6hwYU?=
 =?us-ascii?Q?zpMVxdX/vy7rkhh/2Jp0HmY/z8USLxpJM8VDBvPAHahBfYkOQ155oYzQlHFl?=
 =?us-ascii?Q?xNpy/ElskSmbtsbSTadanJoFrYkWyl+adQTqFpUPKhfj8sBuBYbFqrtBWmMd?=
 =?us-ascii?Q?z0URwPHUIdol4qsPpl74ZxCtVNLVBJILLCJxfKIF2XvPYCVUomNzepL8RFIm?=
 =?us-ascii?Q?Z1dKzdWT+QOHtX9ofNPZ0CfaGRPBYxR7CAxXKqfiNyhiCD5H6g1ZOz0Sw8Qz?=
 =?us-ascii?Q?ClWDxV7ZZVNYev0TkGdTGSht+7ep9bgxDRymUickZrJ0FpISsgTLLcDSFNH8?=
 =?us-ascii?Q?EexYTis+DvH0q/kUEIunCMj+jgZa+XOpuWSvKJz6/vfdnHtURDOvpyZsUuys?=
 =?us-ascii?Q?cLu/qPNA0eRKWlZCA3i1/v5Jd8kQqVfrizajucDs/63WB4lfO6K0SoXUkY9x?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8e639b-9fce-4110-b228-08dc75d377f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:10:29.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JKNhRlV1h3wguIqLf5oVphQ4c07klCFveX1Qe6cnNWct+bLWYTfjlbLyjhn5Y/ZhvjnXsrdovWq5Dw6JY6dSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

The very first memory operation on a mmaped region after runtime suspend,
the device will be resumed if the memory used is vram.
However, after this first operation with page fault, the memory
can be migrated to the system memory.

During this migration, Xe kernel will get a notification at
xe_bo_move_notify, and the bo will be removed from the
vram_userfault list. Then, on the next suspend, we won't mark
bo for page fault and resume won't happen and the active count
won't increase. This is okay, since the bo is now in the system
memory we don't need to wake up the device. But the current
test is wrong, because it assumes that the bo keeps forever
in vram, what is the issue here.

Only checking the resume after the first operation is the
enough. But also, ensure that both read and write operations
are actually validated.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a80964d1f..2770ce83d 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -38,6 +38,11 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+enum mem_op {
+	READ,
+	WRITE,
+};
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -522,7 +527,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -560,8 +566,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		igt_assert(map[i] == MAGIC_1);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			igt_assert(map[i] == MAGIC_1);
+		else
+			map[i] = MAGIC_2;
+	}
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
@@ -571,12 +581,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		map[i] = MAGIC_2;
-
-	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
-			   active_time);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			map[i] = MAGIC_2;
+		else
+			igt_assert(map[i] == MAGIC_2);
+	}
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
@@ -792,7 +802,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -811,7 +822,10 @@ igt_main
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
-- 
2.44.0

