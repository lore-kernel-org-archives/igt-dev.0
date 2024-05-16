Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F066CC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736810E514;
	Thu, 16 May 2024 18:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5E3Fazw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836F510E514
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883035; x=1747419035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DY9zpsuY+/ihQfNIqNFSalkxqqmUNq/rR9Ma/ot14oo=;
 b=U5E3FazwitwQqrsBkVvKhAy9HQLmUnWokzvmyDdlaj28YZJrgHmxOur9
 Mlj79FqeXlFveAW4VzcKYOvOjcF7xSKZvOvI41nS0boubCS9xzteXukxf
 JFODcEqH47nPcJnt4yfmQ//9y5XnU48nuiOJzlNVj5rqMzOBkKo8qlKwN
 gztxwPg3gXNb4ViM/ItbJGqd6IZ1dZBK6MTMdjFGKMsVoIZdirHJ8htQU
 WS6rJt1LM/xVpAvJCWerxDic7/aeMFmXVEK15X3ZNCPuDkrBZ854i+1Nv
 FdK+ynOTQqA4JXi4+6XfailZaP4RO/MJofrU7la7M7rkl5KocMmNyGtvf Q==;
X-CSE-ConnectionGUID: /OhgXiJFTXCApY53v761XA==
X-CSE-MsgGUID: MnNtdaEgRByfurGxMGJfUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11888839"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11888839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:10:35 -0700
X-CSE-ConnectionGUID: 3XhXHV30T8uPJW72LMh7lg==
X-CSE-MsgGUID: 5YlB+TwRQCyZxMDYVZ0fcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31655772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:10:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 11:10:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jICooNudgPZVKglaOtYOSeVqkueHce2kxo3HBnlv2289Fb0uC4XWby+YBO+kK+nUkaLzSdY+o5ytDX3EkiyhCcVifNfBphikwYWmoiI1FqB6hBDu5YQBFWt8o7LVa90Aqa3zzaT0ZTOXGekXHsxkc35iz3lBqnm21VcLnhjm/CDMAVsSg+PQHdeK3mHShY9EDDrG0g9Tn08aTZczB7rvsQ3TqRxkZA9D57/vIwMQR+56Nn1aSlIoAO3nw0YZRXZTBN3729eh0xQ6KIPCyRKGyJfYPFHBYceMgfgGPciIxOIKtoGOQiStWFYLtjGPgxd5GBeIDrqtThLGrMozibv3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTDWSh7FVwuP1ga1kZjzor1IXJ5XEfkpQRk04wk4YJE=;
 b=FVse/jeGJ40fatkYUWNOVihdJloABvLvC7de2FN/q5ToydJkB6dmDw6K2fOfENIHKjp3OTyEuNH/YSvDyjfei1RTGrDdw3Ovv8pIKqSxlPdqOOdSnat/ZPs3rAhYxdX9tkDbtvmnesZV833bzg4j4cOvw2kjTWJeN0c11a8UvvcJ6/E/RCjN1rgLoLmAQY/PdgkFy3mCn0yT3dbgvA1im63Yu5sF6Do2fOO/ElD8ZiSRzFWIsQNHZ/pU+scQbunMfvtdZZKukpLvozj1458Xd0x1O9414I5h50XOLQJ2GwWA0ObRR5V546JyqX9r6J/NAFpacdpGc1+Mg1QEt/MWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:10:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:10:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Badal
 Nilawar" <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Thu, 16 May 2024 14:10:15 -0400
Message-ID: <20240516181015.149824-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516181015.149824-1-rodrigo.vivi@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: d55ea224-0c88-4734-f7f0-08dc75d37a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nM1pksOfkQuu5M8lpvOTxj20Y5jbAAWtAL8Ebn0FrOCbfBtm9VUgSpU8jDO5?=
 =?us-ascii?Q?F3+KyzvfFS2TwIOkarDavJAEINEDDq/zkQ/p97sr0FOthJxlAiXapjt1fxEN?=
 =?us-ascii?Q?4dGHq/NRh5jMmNwUCxCscov7VpuYbTfuaGEfi32ah5NcpWqrPT+5Ze7LfXWr?=
 =?us-ascii?Q?b2nJc9rd31vHd2rvT1TmJYd4vISy1mE9VOTdKzWLO9cm0u3IbnWqw3MGFR/D?=
 =?us-ascii?Q?woJo7bJejZU6E6LidicVT9Kv69cEfmSsVeYw0GKi97R5ZI2AgoCOao9U0Gqq?=
 =?us-ascii?Q?XuDZq73Sjfnf9skVysDTkh72vBJRv7GA8ovcS/wBv4M/bMwE7XMrmFSCPR2K?=
 =?us-ascii?Q?ZxcZaE2apb+HHbd3oAfPx5dW30YzcG6laHhMKiu7vhAg5ly1AFElxLrqy02k?=
 =?us-ascii?Q?5GOxUD1blhZLDtonSjtpSeJP5EAkndzBF539OS1ceYA7JVEvbCDDYF1exjoG?=
 =?us-ascii?Q?ludx/H+owenZY99M7w052d/+W6EO+IOYmwyxF4bXFCVNsD0Ujdz6PjO7/+eg?=
 =?us-ascii?Q?HxfKpTTV3C9QJhgCx0MlZJ3L13PGWKqSHOkaRVWyOO4kWC8moRUrHu6qrutc?=
 =?us-ascii?Q?cX3lzgVYmK5FXsnbQ/S1+FAs09F61Ii5YXWD68KaFeBImavbf7G/h1AB38pA?=
 =?us-ascii?Q?8VygfIOnAAQFdZxcrygmVPGmEYEUcaHfeKYKH43oHCSKLJKU6ibMwFykVwPs?=
 =?us-ascii?Q?UQp5yNAefkgyHTa+TsVi5Dm6GTpav4US12rIPYm+n9jepsvnzjR13VV32xmm?=
 =?us-ascii?Q?GtUgbazlmP1WbKq1Qbg38IHnrK1WDZDbAup3dj374GVmhTTzUbhJp27GQZmq?=
 =?us-ascii?Q?JVVqWaSigRyICnHkgdErfXxmQaPJps8b1RB53Foe9+ZkyTYZREEhRF1CcnYr?=
 =?us-ascii?Q?8annQySRTAM3K00qj4wRCN2fyXoMfkesOCyh1mVF1HlvtEI3AUSIHlWXkKYD?=
 =?us-ascii?Q?Q5xoH5xxPPUtpJCXF6u9vPsxQWNXVCOAqahMudNSsBEOP3y+jVQjfUgsuqBZ?=
 =?us-ascii?Q?jwYJTkR9HyDaRY7GkNboYdUaivBVsKoYmZsN5fAHjnBc5cAUdOwAu3w1K/dG?=
 =?us-ascii?Q?9AVS1QZLOW2Ilv5dkdMdJnkadSqxT63jgqEKafHda5aDWh5OTsCFaSWSt7HT?=
 =?us-ascii?Q?QEE4M5SsbPsfTeahUn+i160kOgfG8/Rz2rK9bbzpF7E7Lb0sk4ySgNUrL0gY?=
 =?us-ascii?Q?63wFXgegKOgsqD+gA95RZotGi4efHNzPIzVgIMc3/PFvqxyickVv7RKfeEvd?=
 =?us-ascii?Q?MXaN/kDYmI7l2VUXTEAdL4oa/hMxJPFgTJPfH3EJgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ShcuiaTFJON2aEeXP7O2ldHdT6CHobKcccGtvhpurewIsO4RyI/y67O75XSh?=
 =?us-ascii?Q?5igS3lzYIBoCLZotRNt3xBCiGCGDCR9dRqfqhAdgeg8TgtJLQxpTa+o6RNB5?=
 =?us-ascii?Q?njZ4IgVXSkh8NC4X1rXhFYVQXsx1pXnhv2RHFij8z+kXNWXVvTjgX2qo2bB1?=
 =?us-ascii?Q?Smo12qtPYn3U43FrVxLH1kRNSlsQ0+RkFF1RMq3NG/f55hUS16GVFZiROmo0?=
 =?us-ascii?Q?rMY3dY+bxRrbhqdMPxUi7VaJB1c6lx1DbE/n6wvC2E1KYq579BA9NPAs2aGX?=
 =?us-ascii?Q?8pYCu22LzXcKhnYWFlrBL6ZTyB644xfCuuS6+cJI3hSsrPvYU6Q6C8w2mDaq?=
 =?us-ascii?Q?IHiGs6nRm6EIwhBNpoyV6bFfFUKAvsPVs5fFj1EKARMn83yERtpY8/17ybT3?=
 =?us-ascii?Q?1iEBCdK9ITVX9iTOFEZk2Gf0jsuJnYCNYTmpQoqXLhtk1cqUR/1CaPAvpypM?=
 =?us-ascii?Q?V4LLRiOt6cHbAIHtNW5xWGlrjJAyE0OsT/iD8+2sNTS2sMkmrbmeMdf6Zw70?=
 =?us-ascii?Q?sVhDHoxPi1P16OftwGF1w4qroTXbTVm046zvYHAlyDUEWWoVA1KRlL0yxyjP?=
 =?us-ascii?Q?5VruPbfguGLstnRNA0qOWMF5rggVnurmNc1bIDWwdj9ult9tNIRXLeZsbWuE?=
 =?us-ascii?Q?Tmy1fNs/iTFo1xwNvt9G8D0xz/bsDJlmTLMmzv/x0SO/Qk96JcppmxHyirkf?=
 =?us-ascii?Q?PvqY4f2j55NzdVSjWBp2j8aUzomLOiBarvHncdw1GkeU6JAzZ46vG/Lygakq?=
 =?us-ascii?Q?6u7GiZJCMqEyU93pXM9epSHUVWIrMPf7RMEnbsG/SCneHXydlu4R+XypT/SG?=
 =?us-ascii?Q?IrLLxwkoKl/iryXiCtwrCfby+GecTdcNkcaURjwcAbsXfCgG0Zq2+SxubrN+?=
 =?us-ascii?Q?7JgDJNcKtHlZ+RY62zQ/sVy7IiY/TxfbBmGMwk5e+R1rBqKWCUCvHANbEFPP?=
 =?us-ascii?Q?w5X/DNegz9tFl7dYgd3ZT0q3mrWj4gQRb6Oo8Oq/FGdsiHirWKFt0wLFtpcf?=
 =?us-ascii?Q?6u/kfOGT0hZOjtfAqPbmJomogRyxeDTUx3MOsSnQKVt7rS7Ou/63e8DYiy1/?=
 =?us-ascii?Q?R1dFH6Z1Z+meDE/UUs9gBqfkZaF/43AOOHpAchsiGhfBP8rHo56ugOrTice/?=
 =?us-ascii?Q?nHUsid+kKpkSGFeXHlM8aKaOAOYhFsM587wcmSK+jzKPgTOL7LhhKzq0D3B+?=
 =?us-ascii?Q?MRIoVZ1RYT2M4BgGB/dsnd0M1o4wNcJuy9XGgeVehcLY4h3Yq2DmqIFQLN56?=
 =?us-ascii?Q?2pS+mqEcnRvt+RgwhHiIG0m9eG4pPMF5vNkF6QUm1/cVKtBRDz0/PQOcNBKR?=
 =?us-ascii?Q?UiCz8hOlUpn2JOBRnIaetL3LKM3rbLgu35ZJdJXYX0wgoWwqBlPqJRvNQkD0?=
 =?us-ascii?Q?5DiAQW7FolsDkimbAf1/bi3SkRmx9IFhBGD2a7KsiqQ3R8uLc7dpgPN+oPbQ?=
 =?us-ascii?Q?FistVob0VgK8M1JH9NIESTb3Yv/W5NXJqHKENUB1XkQn0KQhk+W0irgWHS5E?=
 =?us-ascii?Q?Qus1jOdIauzuzBW0ypngPF3JScjjdTXr3vsZB5FJ6D+0aRCxLKZ2bc1mzHM4?=
 =?us-ascii?Q?W4mb8aS/Hdz444nrHTgg90tO/DdplOUVnYnLSHirCK5YR/amhlxGat1MNpUU?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d55ea224-0c88-4734-f7f0-08dc75d37a1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:10:32.8988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Itpq8CbggNGcsc4No3Zkldx1GWxYVA/uIQlpE3wh/27avjrvmkgvlVh6y2zcnQETCPayBWJiUy5Q/eWCkaCmDA==
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

v2: rebased

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 2770ce83d..94e36774a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -516,19 +516,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
  *	Validate mmap memory mapping with d3 state, for %arg[1] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -537,7 +543,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -563,7 +569,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -578,7 +584,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -588,7 +594,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -783,6 +789,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -798,38 +834,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs-rpm")
 			test_mocs_suspend_resume(device, NO_SUSPEND);
 	}
-- 
2.44.0

