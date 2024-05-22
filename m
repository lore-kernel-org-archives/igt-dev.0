Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF89C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC510EEC1;
	Wed, 22 May 2024 14:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceXCk42X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606A210E4FD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388420; x=1747924420;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=4doDTkfI94m2/jXP9cu3zUTWrfmEk6kvj93GWPh01VE=;
 b=ceXCk42XrVQj5NQYxRIgEL2n2dDCIAV0ssxLsCWwGWpGvF11I7JNOZFx
 FdqBsmnNzc81eMwdQecev0d/Hwhu34AF3KvYD4nzecetoG43HEUqwH2rU
 FVlcrw8qHJ+LkMDlE1dtnB8dzsO7M7sQzzDSXzP5ar5QSAXEQMEqAbqaO
 aA2NkKMAIQnbD1M6MRsYx03y2fJDQe/eupKnc5QCX1ADVQKAihzwG+VIi
 4Lolq8e0IMzqtbtNfnin02TppPxXl0KLscSbpKzgpZiSSYj1XI7tSpyrB
 vc+IRUxrXa4WGbzg/kt3I8Z9y30DXNIW23C7S4XfQiT2ijfdWAVD0Bywn w==;
X-CSE-ConnectionGUID: ATR20zzITlGkwrj21FGd6A==
X-CSE-MsgGUID: WXMMAx+wRDCrGvU7lqQ0xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12496066"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12496066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:40 -0700
X-CSE-ConnectionGUID: dyfZocRhSwiKHyooMU7l5w==
X-CSE-MsgGUID: eSSKTR76Rsam7OWpxcNdMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33298789"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuLoYeQgXjLHmwcAWkMHsfEthtV/oqmFbBHLeLG5SyhTiRczil2nKkw0EdRGKI0kKtCSXCihKREPDCHgrn+I8j9mrg4Wu5Aiq/8hGnFO8LBd3hnelGUPD/1FHpq6uIwPLdxF2TARIA6bsymhFjcL91gAG9KM0P7iEK7r59lKcKCrdNCLHlLDfOoVIqEv3+PHG88EevTHLVu2I55vxo77E9yUqgmaBwF+Tprz0pEA2fughTsvlpbKwaFjQRPbZhLHF1H/tgtDPITttMWEqcnxfTIMcacutjL963roeiyztopHP+UfXC32MjCoCpOi+TZlEKzd6GKtZHS1V9cDv9IFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzaN8539hSFvhk33xQ1CZZVnNSXLThplcAWvOafGoaw=;
 b=VUP81HxtLP42s8TPGK5h/H22J6Qbt45E4yg/cx3x+npiFN9JCaNU91DZ7tktIiUS1NPdJzMjXNd+rfhyiWdwa+YCsymhiN3XMxgWaiSKyZYKLxlViaxQSY8J1Z42dLKeZomS24YO+Cfhu0WJ/dJYY1aLHhqtxbRrsh6CP90/hMfu4wkmpmJzHbkGrSj/5oTe4bpVBGUQ8mAfyZ0Cr3PS5nvavKC18HFPhJmwGe2mHUlUEOkKVj9uVi6QkmpEqeJW3GU3Flu68jzlCpPuD+ol/5m+y/Y86FgWhJBvWCiZ6J3bti+HIKGJHHWXkyBA8ko5LS4o8EgRBSPlPS8bC2dgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:33:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [CI 1/6] tests/intel/xe_pm: Update runtime pm conditions
Date: Wed, 22 May 2024 10:33:25 -0400
Message-ID: <20240522143330.312014-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 542e599e-ec80-4a32-73fd-08dc7a6c28c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLcI8Dgv60bwWCaZzKVUn3cDsM/DbonhdHT+P1d4Cktj0eyjYi4/3rK4nvV0?=
 =?us-ascii?Q?DRqt3lqdQU502EtOwJ047V5czvkpOi+7Sq8bmrMsRzXNTIZXla00LB1LOgMo?=
 =?us-ascii?Q?D+SRYenK+Q9/Ii7TcbcffTttTgUD1/B46v/S9rIsQWnIFhN6sCvr6dyWNDYH?=
 =?us-ascii?Q?ihnfMIfxB9eYzZhZpFFZAluZw4Xjp8t3iNEB9fmp6wSMEOt2qbNf8sLYhG8P?=
 =?us-ascii?Q?J6Y1fPlLSbZDpnNiLDbbIhwSQU+Qm5iCYH4TatqRLBAVm+T59NytkL73x+nv?=
 =?us-ascii?Q?sRGDGrbx9WDZtSv6hOMVnPIV1AgstXi8Pxuhy40WfgKp78UHspr+OC+KO2os?=
 =?us-ascii?Q?xctSnDkuXy1PUfcms5Qnt912BxaiuIclLP9hiTwVtYLayYYMZM/oOnkmCYAW?=
 =?us-ascii?Q?9ahca+npq1WNIP8PP/k+CNrA2loHIYPP7Q5EWGlGaq/yrPuSgOLMsyJEbayH?=
 =?us-ascii?Q?ZiUWHLnzrNwulncZy3AloMuJRvl5zelAZpCHGPq1OgWWW3Z9cnJPzlvE97Vx?=
 =?us-ascii?Q?jNc6a33RP7uj1HJ5g8YMH1Jd4QDxf6cNSZLGsDt6F3Kyo6t16BvWJpR10E8D?=
 =?us-ascii?Q?wOWHCzzzxrfkzbXyEueC2lnieTatznlSVAG++fRJgBGlrbqfRV2baObBw2FD?=
 =?us-ascii?Q?B0B2l5X4H1KS8epzXMfVZ/NM+vlpGDxXK+AsqMiLK9FglLoW9XTLkCcsEpvk?=
 =?us-ascii?Q?17D68u9Mextq5sXr4McD6oJGzFORQopBA0vLBkOiQIyNT2BhraWoV4PXsMRS?=
 =?us-ascii?Q?cL/jF3QjZQcZPSeyEaGiTqTIWo5AZecFw3537BUR/gudgPuMzGxi20hbu22N?=
 =?us-ascii?Q?Q500s7ODnGxaK9w4EbJlvRSnZooMP3T9p2XJEs4pKrsJLQjztnchKA/ZwOkw?=
 =?us-ascii?Q?mYSOgvVxhZDkOt9T/ja35wrOGMKM0ctefzzSDlQuOAJf0TuS3DO06dKrJGFB?=
 =?us-ascii?Q?aUGa9UoV0CuTmgiKAYwPjalqCGBe5+/Yi5F/5Bf63p3VcRNfOfemCEGiEHUe?=
 =?us-ascii?Q?rBEwu1zGsExboUa3XGB2xO2TfDKs6IC6/+7v6BMrB+6M6OShkuR7uMHn4AVb?=
 =?us-ascii?Q?bmJ/aaYDKRkeX5NZ/Yc/ARBgcpnig8vVf0gWPUY8hlH1LsCxlgIJLbvC4YEb?=
 =?us-ascii?Q?lst0FBov0oOJI8SnwLedw5VVp9ELfx6nCC22jYaoSfuSdWBtXGAKN2OahFsp?=
 =?us-ascii?Q?bxwQeW7ZgYhnuhC+KZViJX8ew10DpC2eSdi4vCykmnma+7ETy5wiV2wU60cw?=
 =?us-ascii?Q?3XJq2GzExlf4Uc84a5h6ZOpJ3r9DsaM1Y9EgeIwAEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1qpRwygu9XW0AWIhtsyISLAqEiJxI3wyWtj/OwI4dZIIef4jaGjOR1cYkOk?=
 =?us-ascii?Q?gJrYpwUPR+QEpnvtXqKW4Fi+IGuO+hDTOGJl8rDk0g5YvUrh0uinrNc6KUeh?=
 =?us-ascii?Q?m1r7kBUhEdP+/URUjRC/IzSuyuioH8396CahLvnGRjrbmwd5D+U/JyaH8jIf?=
 =?us-ascii?Q?Q/RmD75mrHv/vk3n33puozsLxtoLJPvrUkMPF5r+Ez8lQ91EZAd2a9VJG0ti?=
 =?us-ascii?Q?e9kWem4OViPg6V8VbuLh10ZcMoJQg2WvRfuw09r16cIuKx8BNHHzrnbfsPM6?=
 =?us-ascii?Q?3QAWeDkyzex3RzVxWCiZ15fL6tvuVZUqcmVvDPVxQJNavLZLafOUiBx+yQdl?=
 =?us-ascii?Q?BlgzOMt08IbCOokhTbMFimvyNM0KlnxzzJ/gNMy7UStLZXu4RwxNyuuRXRo/?=
 =?us-ascii?Q?h/HLqUp3CGnHY9is5tMMsRFHdd+JrScdZ/PharvqzvqenZHRRR3savJicV03?=
 =?us-ascii?Q?YllqqZBaNY6OsrYwh57WWiUBSM9I8PZT1ZUMn4mCpGLPtMRtP5omu8V3y5G5?=
 =?us-ascii?Q?yMPLlOhiKC+i+mafnjUu/fUsF7/2T+WLEBdlylr9MvO4mRh3LErhg7cZ3ua6?=
 =?us-ascii?Q?6VWoiwcHnd8xucH9IcXklm+UOsApJ2FzWMeOSw/TpfYGh7yXA7cKAZVUYL3N?=
 =?us-ascii?Q?+aBYkb6YQimfv8/593EQNvGx49qHr5xoPliSMMW7/vHMwpdz0QMRZY8IcDYa?=
 =?us-ascii?Q?oPk7R3l4A87Wb4AylL4bYs9G2U4Przms3gxLGYheAP1m3jFSHwZT/bGwwUU/?=
 =?us-ascii?Q?6X0dXwPQEezPC9wBkNJ/sOvbEPRiK3RjOxbH+QmGVE7MF58HpazDVw1AtsxV?=
 =?us-ascii?Q?0n3kFdWhbN6pUH12nsDe7F1/6EZQfIN/9Puz2AHvuNjuDzEaftk0UL1g0G1D?=
 =?us-ascii?Q?11K9wbKynUZnx4MeONeDImYQHkbhVq+NOTPPDImDRTJ2Qk/FbNrZarTog39q?=
 =?us-ascii?Q?vgRrP3CK+qZL6qOkSlev+83Juc2mD98GXMLF/2OvStscWzhxwJammIQ9mkTd?=
 =?us-ascii?Q?2Zdc31JOpm4Kw2wc68j69FjCyP+ZzU0kz//jdNhkwfzAgP+DQERwAMbeOJm3?=
 =?us-ascii?Q?5nz026e1Ag/0KyYAnPVOrU6VCz9wq7rEJGw4V78BwYMrDamh/49pu0Y9loY5?=
 =?us-ascii?Q?Wejmh11GGlmMGevE5pzFYBaLbHah1Gqs2gPWa1JaRjPZlazztrNLs+w6mXC6?=
 =?us-ascii?Q?Cqw0zhuZsaqzviUmTH7qkHJAIMBu4f6RGyJGRJLxzEn7XTI7B9aYMMFvfu/K?=
 =?us-ascii?Q?WHPcSahWQlccsjE4gsU0SHoI1I+QNJq5syJUhKI8G52zZ+1G3uPMDJXKUTW9?=
 =?us-ascii?Q?Dtg2pmiPN1452iB01ELoUELHXmhiuWzs45pcD7qKIWnwsJ35E2yc9QcSOtwA?=
 =?us-ascii?Q?YjtTgY0wEMM6x8HNwr0b8BVwijH6jYbq/7BjPQh2VCjvBZLZymY8yaohOPVJ?=
 =?us-ascii?Q?K/UuFMeg3na75NmYdq/TBf+V6nyPB1A0yMjDPA8vYArFvtHvWib4lUEiZ84h?=
 =?us-ascii?Q?gZP7g0ye9f0mdysPBpXFjlv3jgOdyZCrI2S5INXEfLc6PMP+OYRKMNbbu7vS?=
 =?us-ascii?Q?Fq7ZQ5mcRB8vZ2FsciKSvm6Z/oBKyeqbrteg9GKZwphKjN2GPokTxbzBvRM2?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 542e599e-ec80-4a32-73fd-08dc7a6c28c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:34.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOBG1wbwmnChwzvvS5Yu1lHL8BsaVSFExdRxPpaAwsS70ZUjEHPsYqnNs+hfU3HJIDgROtiGqbrblfWIUQaT5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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
v4: Use uint64_t for active_time, which is a big number in
    milliseconds. (Kamil)
v5: Used PRInt macros instead of %ld (Kamil)
    Tell what unit of time is returned. (Kamil)
v6: s/miliseconds/millisenconds (Francois)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 25 +++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 55 insertions(+), 48 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..cb18a88b9 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,31 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+/**
+ * igt_pm_get_runtime_active_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time in milliseconds that the device has been active.
+ */
+uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time_fd;
+	uint64_t time;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%ld", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
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
index 91ee05cd1..15e301533 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b4a8c4d15..d301ad031 100644
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
@@ -323,27 +295,28 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b;
+	uint64_t active_time;
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
@@ -381,8 +354,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
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
@@ -426,9 +401,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -456,15 +428,13 @@ NULL));
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
@@ -558,10 +528,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
+	uint64_t active_time;
 	int i;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -572,7 +546,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -582,22 +557,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
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

