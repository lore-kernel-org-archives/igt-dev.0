Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C367C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E8810ED23;
	Tue, 21 May 2024 15:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Etyz16bV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5D410ED23
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304609; x=1747840609;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=nUL3ZBILs4JUZmAvA6v/4EliaEBw3xnOAqAvBYkZV8c=;
 b=Etyz16bVR6bOuTlRFFnAmnlLR/1/SNjGRLdkQ6PDZNmga5PSVMbY0DZV
 MyTUMSzpSrTqGcxVzY/Y6J/NhcpD/0jmS+CpTE738vYynIIGXxp2dS8a+
 CvqYmskAs48ZcHhgthSI1rPd/si/ht0jyECJeDPlGjdML0wniyfeyNJrR
 9qk63jaSIJ5zAmZYg8l5Dee3NBic8e/MK6aDGQMvUtQbeU60Y3vd8lkzv
 /ZYvnHl+QUPUOOlE5XGSW/UIWx/z1iDhmFIBfOrJYf4QvURuSPoCfJTFT
 Lm7woZMRura/ywHW2OpqYbJzM+U3U6Wr1AZ742zkwSsDp3OE7kMd580H/ Q==;
X-CSE-ConnectionGUID: CWEYFx04SgCfxXsnFLW/iA==
X-CSE-MsgGUID: OFRK+taNRMmcaiApel6F0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12355377"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12355377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:16:49 -0700
X-CSE-ConnectionGUID: kkgDiPbsQeKB4wxR1i4NUQ==
X-CSE-MsgGUID: rLF2LDGMQoGeXVu88YX1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33078440"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:16:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:16:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHzpLhM06362ib67Lf0IuwqhSrhAv/gNW5tFjP6Aq1iCxC1K7d1LhzwoKcfoJNW8AfUQuqbc2fezi+R5yJr4z6eCu+qx33hLTMDiw4635f7QmU2Oef/byuGk441L2RN/433JFqeW+HiayeogTBz5Bdl++PP+h5M09yJaKIL16DUT7OMl/U2l3v4RYyD8Jx+7okBXnP9bcyJdZ34Dn/i3To/fwWwDxDqjpGlTpyAvPei0j2JpaqlAgCwJEgl78WLjiE7HxdbBvv0LMbfBHn67CrgCh4v/S8Wq7GCvZnS3NRZsSrAgZCUUFMWzYN7lZOrWQlQpU4hYZiXsqwjKu+FIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2TxTfj5D9xZ/DiONBMwGcxsjqKmphG/5JSrpLve4ms=;
 b=eBoKVBL14+DIrzVb8azfk2Ro0RT/n3gF3fkUGoGYhzqXu01B5DZvUKrLOf5hkEkerBvwjA9guhOrJyz45kPv7MmXVUhws0EP1JyPNDF5qS4iHhqImZ6vTvShb8yCm1a6fm0aTsD1QvqCnU3zFW+TshJQGF8Q0aIrhvkwo5jKZKmV55WNW77sR3JwXXlKa2d8T2DoDb7Jfn47Q24Kf8aXUTNIDp1wyJKMbP89gIMOI9XC9rd8qdwsOvj3lxD09L2Gxf2IvZ/qWg1G4670FVpyvfDlznsn/asCdvpPPoYFY9vdB16g/+4zT5XHBDIV9Hv/d7CrG1VoiFKcSVF2LuKQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:16:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:16:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/xe_pm: Update runtime pm conditions
Date: Tue, 21 May 2024 11:16:35 -0400
Message-ID: <20240521151640.280354-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:a03:54::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c880fb-4af2-4b8a-47a3-08dc79a90670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u2k/C83VBrLutc6g9lVH35hXAjzNw8m1IB8vMnYaaHQujjR+Q4AgeeQ8TTbe?=
 =?us-ascii?Q?KFSVp6T+fmhWIMxo2Y9MpFEck1CR64GWlSRnxyzG6PDcSkCihmqPGYSe4Vbj?=
 =?us-ascii?Q?QDf2WaF81my3NubJYnsUOfo+UF+vJF341G/Saqzp4l+USSpHhlCPHxoeuXcu?=
 =?us-ascii?Q?gWuOoVexISuMACqm4hUFsAeChaC3mlPpvdgrwe688RPq2QLAG2I1R5myzwzH?=
 =?us-ascii?Q?B+aH2s8ucahb+mPFaQXdUPLAwEokR4BvzPTA2Y3kpN1TfKR+Ozb3w4Ky8oVm?=
 =?us-ascii?Q?gQxAdsQXf4+sbhX2j0rGx79UifPNxe/gJxKG8wn9D5MPVGgw28SJShCJfKjX?=
 =?us-ascii?Q?MJz/C3VbPdWX8iOrD4JcvHl1HGDKA+/Uaw9ChZpMx5e5XxAqNNtuKFR4ARBi?=
 =?us-ascii?Q?aL4NwT3UCMvwiFnfXSdrgIviODFdMKWvWKuGW9sQfzS3w+ngWqFELJ1mn0DY?=
 =?us-ascii?Q?VkOffzI3oTccAJdqvGmVtmnhhkz9epohyUguHnvL3hQvu6iMR2I7mm07wPrk?=
 =?us-ascii?Q?8KDQjf8ySVSJ5R2IvXaCgBx6pspJheC1h0A8H+S/KjL0vpXAzEAv97tGZD1s?=
 =?us-ascii?Q?XVxj3iOeHdpYww0jJaekVriyHJ2d1YBnm5+9NmROVottZrOL/24YuSRQiShL?=
 =?us-ascii?Q?HNEkKmWutjoSheBdNQD2XkAfDUTkoJiBCS2G2FamVbahoT2WWgXEIXnSV1X+?=
 =?us-ascii?Q?RICS43Wc9j8qVeU5sasjNJFYItn3z9z+W4rQoanQ+649Ul2fgMZovR2ecNB4?=
 =?us-ascii?Q?L9AJI7XQyGAzLXv6ucOolitByFsvh9leQWtFcBy5QhPewWdzPrQ0rYSUV9eX?=
 =?us-ascii?Q?bbJOHIv3KpLTwzdcJpMS9pJMacxPkh7DXA2VgPXIVwvSbe3x22HJojK3XYZH?=
 =?us-ascii?Q?wqaE/ZdDuXmK4TeLJCDBAtCOlnV3hwkJBcPYvYhp55ZI98D/WySNnJ4Zm/LP?=
 =?us-ascii?Q?qJGRCOV9lz9nWVsSh/B9mk24kSMvHZQRQMeVmMXW5X7NSAd2szBvbJv/5GqY?=
 =?us-ascii?Q?PN8qrgRaWck3Gt9clAscsFDL0nWU/unjEIFVAOfR/CVGM+H8u2vUKgJUlaQt?=
 =?us-ascii?Q?QYlvD4vmsb1EAwmiqGy5lYnsSgP0pCu3L/0Y9JjAFoBvPAJvsDWuLdrItjw8?=
 =?us-ascii?Q?t5cGoNDsZ6+lFfn0DFMa9NCT0b+6h+5v9/FGu4CiQrRK7xcy9Q2j58tQ8Nff?=
 =?us-ascii?Q?AzJX71CwmLuWdTZNPGdwxAUffmbZjIJpCNiDQlcWePZqeR/QDgPx8YpuXPiu?=
 =?us-ascii?Q?brbU6DIAQsEfPj0Pfq0qWOyH5oT+48iFvRog0kIRUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iuic4esfwYMFBBs1Dhm2Srg6tmsOoANxt6EIJlZu0rsgditm/sE4hBfm4SKa?=
 =?us-ascii?Q?0PZ3Pqbgr3AxGCM0rI/9CvnTJOfUSoPlNAcVPQNLNFMCnmthSCSTIp60pcyo?=
 =?us-ascii?Q?QVvI0w8g7v+NNaQ5pAfprkrlhM2ZeUr51RagzUBjKwOKiMdH7e4yE5iHHcOs?=
 =?us-ascii?Q?saEqrzjnL0ZcypExN01poGPpAYq8lzvmyj6uMrjLmHS+dE+OBirtE3wyCxos?=
 =?us-ascii?Q?jkQKu3nGjGyan7Y/f4/hhQ0bex7nWKYAKSDDWBONFaOQdQ/nRClFr0GqFK5Q?=
 =?us-ascii?Q?vP+wc1DJVNPZTGgpVBiJH5ZTqnk1IG4zUkyGkIqLkl+/E4uRNccIt8TxFM5w?=
 =?us-ascii?Q?VcOjx6sVgkmL742ltqnuhJVqqYutxjRYnegTkT69cxiqQm/oejhyp8gJLf0v?=
 =?us-ascii?Q?KEYsHXpUk6wDE5yTjcgTWR1zC1aNlzMf0wD5D6Wd6b9wuZtMCrJCEcTTcSFG?=
 =?us-ascii?Q?n9beygsdpdcyUGKCHWSse0tv9e76bCKexYSiFU7GdXMvLaeZxC5+OW5FF7Ns?=
 =?us-ascii?Q?jxedHss5oqR2CwpO1dpYhaBrzOhmbSgTXUc/rMY9KjMSglc1HTF+5RoTiHiJ?=
 =?us-ascii?Q?YESiLJfoJifnHu78AE2fqU2y9osshoZrtXOaqoFCtQpFkGEM9Q5us/uauiQC?=
 =?us-ascii?Q?A0eHi3ZuGyGjslY86J/KknHAg3NF/ciTDgmZ8i6EhiVV+c6ja8lCAgRY4roo?=
 =?us-ascii?Q?RlMq7BAulgMQNpDhyOrb9Jm1p87f2doSlR4w/+9RDuP5fu4s9wdML005G6eG?=
 =?us-ascii?Q?2uUhY70lYns8FkUSgSMxkKLo8fKbzUDQqgFQbUwN4odL+XhwDLsTOS8QUAWj?=
 =?us-ascii?Q?xDeW9kto7BSwGs2P1jLL+kwuH40B66wgvbxV54LLNgwxukIhWJXoqadO4aDc?=
 =?us-ascii?Q?crGRCCCEV1RDJzblJtXmmTLKU1X52aJVsJdTGxqsZSH6jKxObhrm0MwT9jF2?=
 =?us-ascii?Q?ubAQb0Bse3IDICUGGFIt0WCqvAsVyt6mVUWhtwfeMr+TjrAL1bihKCNXjiYv?=
 =?us-ascii?Q?GB04Cj7PPl2bAXmeiGfpkKmLkd8cpIRUiNYWJFTCgB6XUPiE044NKN7BZJ/a?=
 =?us-ascii?Q?sv3Ve9ekj18vGBMbvmoqWcCeED6lq/bFfjB05O6jR4Ehq/G0FlhyR663nBAA?=
 =?us-ascii?Q?w/v7dpwEK9Yaf6NtsfqkxugFHismMvuVOcF8Ha0mzkyHOEcFe8TOyBa7xPuc?=
 =?us-ascii?Q?qf63ynKJDRe0pyXPKcT2h8sFV/lH/4mhEg0w6txm7evwk+GOXkrbfG/fH4TU?=
 =?us-ascii?Q?Es3bnOzM2tVgKftU2Vse0mXX6flDWoDe2Kk326YgzBDgU9wetqN+28zuqe/J?=
 =?us-ascii?Q?GBuXjZFp16exL4fwjRsIfAlh2h+tfJvgI0AkdlsxkAQyOLiG/0Vawi8FFJEk?=
 =?us-ascii?Q?PRmbxotd3FbD8iZmQ7Ms1IVV9hrRa3Y5yiLp0l3XUB4AaZ62GMjSMLQzq0vn?=
 =?us-ascii?Q?32gfWcQ09P91BMg3P/U986O0okUz5XZ5Cer/bA0KwOgkaCeoIFsdN/TVEf5L?=
 =?us-ascii?Q?VeSnmdLjD3pDOurMUAG3UV1cmMweMOWqOxlAejH/H0R01RWn/vJqOnGRXwsR?=
 =?us-ascii?Q?oxln+VhqO/Z9JsXDePbRkeK+oESDWZrv188y2DupLRJy6YxDVuLHluiSy53g?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c880fb-4af2-4b8a-47a3-08dc79a90670
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:16:44.6297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUnK93HpjkNFE4LXhv2O6w/RGnpJOh2YivzDsCKHTwixGM8fJ0E/zNAJMrUPJdIbefNNqziDqw8boAueonxeXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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
    miliseconds. (Kamil)
v5: Used PRInt macros instead of %ld (Kamil)
    Tell what unit of time is returned. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 25 +++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 55 insertions(+), 48 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..baaa6657d 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,31 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+/**
+ * igt_pm_get_runtime_active_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time in miliseconds that the device has been active.
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

