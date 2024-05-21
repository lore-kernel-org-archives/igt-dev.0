Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB8C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E706810ED39;
	Tue, 21 May 2024 15:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCuOTiJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3799810ED23
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304613; x=1747840613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xv7oqQ13pIGXAdxcGMPzbK6OyzA8qiyfTk8C+jwegUA=;
 b=CCuOTiJU0sxgkLDoNqsFbTwomG7MnoS2lxSNNQLJ6R5wQc9OEE8c2iri
 12pNkBekWKKux4W5FSpcjMighx6KjBES1tG6nJHqN0bSC0S31w+SHWq0N
 Kofzru/B22JP+Ib0gp/YNEuEoFLtooSj4Dw1rh1EWVxBCronB/zPp2s85
 oRInaWssLmmcphhXWezC9PLixPKIfUBaj+R+6gkQwyALBODC+LeYChV39
 lJtXMyTmnVMw6BM9ConMvpDJOQOuPq6YAJ3mB0LsrC1QU9lodMK/hwJrH
 RXZVbiPlq4n0F9c83gJ2i+HSnuTQWCzqIelabtbsMTmJPr0cDLleLuxJL g==;
X-CSE-ConnectionGUID: fWYcTcE3Rh6Lwa4ToDcFXg==
X-CSE-MsgGUID: 4QoNO9MxQMq4cG4wIu1IrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12355387"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12355387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:16:53 -0700
X-CSE-ConnectionGUID: BJvoCbRkSNy8sbfe+5bfWA==
X-CSE-MsgGUID: kyP1zqxOTsi8mlZOJwOeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33078464"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:16:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:16:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N38cNqU2DJbALy5tQ8lDsbb+g1MUkKbh/0quBS0ldP3FvQQ9tXW5+LWNXCC+z8dLXlNSwHfNKpUv/30l1bafv0Y84EHkvIkJEGfzp0Skr+x0eErKHDpe0QNOYqJ89hXAe2rIC/uiuvIanAmAwZkmg9n3pL2zRUCQ7bOwoHqa0OuEkCJEK/uURXt+Nq3sV89/nOJNmtKad3xN4pLYmxze8pn+WIooH6QkfJQ9GFdHcH02zneIURxMgyeQR6jkvg+/J0EIUyH03q1BtvvuVkabmlQOQWkdjF+s+Var/pC0/27k1zetg1qcNEtw6LtPD6LfJJ/PlI61rZg7B9fzUxLHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYy7k+FTSrzAHB8do23P46f2/8jiVoUYde9AmadJPEA=;
 b=gsp/2lSbSwKMJBTi0LGwpO929KPIDuCszo0HP9m2hiOwoDqTCrULivKauMXVwLKr3wXIvjSJQCTcUyhsMzMzqKiwzsHdezCi4DGrExd1py5EU38y7tsiTYrBNHJVyTIeCilgXL3VK6Lql2as9s3K7xCvwCJtSgmSa8AhIS9XHniLrDuDVmkrqpDNIrvM9o0rF+qd9bg/45vvroqvbIL6m7bmMtQW95WwG7jvBYMXDAsNy7o+3GxzW/OItkUtstq9ZqzbeGv7HwbLZ5bDneQztAzMcbeN/3dg7u3iEkAofk7Suf8r3tQYG6ONBcNzRAzpwa48qbbnlUPMh9owRzxc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:16:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:16:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Tue, 21 May 2024 11:16:36 -0400
Message-ID: <20240521151640.280354-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:a03:100::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: ba667b66-e7a2-4be2-be7d-08dc79a90884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?llliMFQTb8Dmc5WwnESg5A3Zw0vdtLNXYlkQvDmFuAjT2OTFFsRDmy3s8TRj?=
 =?us-ascii?Q?m9r9evfKdYVFNeb7DKyONMxCWqLNcmZLKEDTJHO6InXpJEkpIq8KkxvwWAwZ?=
 =?us-ascii?Q?3pN20TomIG8AjHO0FcK+86BgLiUbDSDP/KDNyEJj1YcNGwvVNWfiq7AY5+JK?=
 =?us-ascii?Q?ju9JwccmIqgE4m1QUc4wMOMt5WhPk47D02FetQl0IzaIKyQE2Vw/EPCVJYF6?=
 =?us-ascii?Q?vbS+ghxKEMa723tJdWJ8OQ7VZBhpcrzWmpIlYfXJonZnYGawNEPJHmMAgT8b?=
 =?us-ascii?Q?ecd2B62qOnhvTh1MNRwVtWYORiKPER7AXuP2v2y5BTwaM+EZdS+TQLdmozJ9?=
 =?us-ascii?Q?qfuRGzxqlJNKCv5e5dQdYhrSNPm8Dzr5WIZg7P23KZocjy3zDE1OyXBJnZ9/?=
 =?us-ascii?Q?LXlJidYvEd++sGf//qhrFGpeGIWYE9WQBu6hipfCqcvU/dRXOJ29RNblNhm8?=
 =?us-ascii?Q?B9XkqG2BghGaAz/IC+b/rXGbsCx840EYy/grd4WtZgiW9PKfjHj7rIHYq7g9?=
 =?us-ascii?Q?fJKXF9U9idMCmg01taQuox/BF0eTEGUt5WikBbMGR+yGLzbPnkslmhU+A1ab?=
 =?us-ascii?Q?VH0JfOeNwjsmyTQ+fL5kS5s48Cd4RjmuTILIxLqbjAQK7kAtODMKku2q9yRC?=
 =?us-ascii?Q?5fNB4eg+43LzgUtBu8svDkE/Mnee7XL6Wh4FGcbHgeKGM9cwaVNBLMxpaLsR?=
 =?us-ascii?Q?hm7SAJhKSJQiOqytGBMmxfLAP/a8JlgrEM+sIDa9RaDcRjDNY2jGueHDtPmf?=
 =?us-ascii?Q?o0WqQFPuMRmGIH+SiaZ20Fv90K3K8Vk+jCb0dku1sBPDf481H6HtcyuBKHuP?=
 =?us-ascii?Q?iuA6Q/hxmrneeQJbduBJOl85T07B7dUOy1Jr8Vvy4bOgdAPLyY1rIb3JioU3?=
 =?us-ascii?Q?2rb6H9B1k2Jsq0ZRWvX4RI1d4qm15ngYK/OwPt0DM3mNPG+H3dET2Qefk0He?=
 =?us-ascii?Q?Y1autWPVm3Qam6JVoFZTH2mD7YnrSetJxQUQ88BO+n708CCbLgzbOiAMnquP?=
 =?us-ascii?Q?4BkQhfXGI7jYK22DlgDKD5/uLexxpN+lvQIzmmimNLhKI0CW9f4tQHaQTP8n?=
 =?us-ascii?Q?sG44fQEMleX0gzfmsbNWpyk08xlGKKvyCD6RoVXnHIVfeZYaW5bocl3vOeuj?=
 =?us-ascii?Q?haroiSpCgMTIgRJVBvknO1gbNvGVqHN35pUX2zFINybIIT4bNJNoyxIWi+CW?=
 =?us-ascii?Q?St/wW1l7srpHLtmq0tnbeSS2NfNKjk4g0pcz8QUITJn5pnh0mhhPVrM4vlAH?=
 =?us-ascii?Q?hftWTF5qMzoiTlPqi08wP5vxqFAl++izo9m+HkpVDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1F39/7Mk/HDKqkHW+c8nJQijcyfpNdN2eu+mCeye6yg/QJH0J7jMP7mdAuwj?=
 =?us-ascii?Q?+q0oW7Pw5mOCQ/YKvDQhzmusGyU3eGSV1TlMQM5ztBAlfYEttN9QP3CSuzs7?=
 =?us-ascii?Q?z9QS2tvvGE7CaLNUDvH0PjA9fxITo3YoQ0hQkRd5ZuJ/oDkpkfB4b5A3UohX?=
 =?us-ascii?Q?MwB2U3Dh6flpD3bQAWuSnIf2xsKmOmgOw18KM9Hjd+aody65TYPizm1QdceI?=
 =?us-ascii?Q?4qULsNTyU1aMTEsM6kZf2qlfVSs/k2t/r4qAp4lQLacp/v7yqUckRoAGYkF6?=
 =?us-ascii?Q?UewnzSH5aSg91cy3GK/p87b0Q6SWEWzfpUekNbHNbkIAjP6D5iNIdJ0ulPtn?=
 =?us-ascii?Q?O8plpETkjHkR+HzKK5elVJA+bRVSbQho3+nFiIlGDgkIIoenZPUdmX+RrndQ?=
 =?us-ascii?Q?hjzhgB54ZbL3JEfgqb9cCZ61ToiLPS0orN6Jht5F/FYsF+ruSJRHZHv4IXP2?=
 =?us-ascii?Q?aIUuUjvBlpsYqiIVg3mrhZzVmDFewoMkuTI/D2Mzkz2X1mn6TeGR+Gxsy75G?=
 =?us-ascii?Q?VW7rxxmk920oIlPljbGPhWgEn/gQtwDp48vS7qi2/hgAHc1gbMgDpcSqU5xV?=
 =?us-ascii?Q?FLJmanR71CtpMV47uwsS/7iiwc3FvYWCXa/6BIm2Hsv4R4IfWfhPucCOIqGk?=
 =?us-ascii?Q?/THJubOzitXinOL6ZCDaUGJCF+F4WhVBnsHHcMZ1XQ+zRSZXoR9RIMTYho3G?=
 =?us-ascii?Q?0gvzs1RoUbSg3wYXNQF/dhQNFeLQLgGdMyCUg3Lok9PwkpGA1Nwt+YXEM/N+?=
 =?us-ascii?Q?Xo7NKLppmFRfYYFiXGDcLwy8Zge6qH5fILDKmECU2Dtp4cRAkp08PFmDhw/B?=
 =?us-ascii?Q?moq59ibYusgdkAnDxqPiqQeJ6OKGv5NWygXPwy4Xh2GPt6d0U/lQaHJeKbWH?=
 =?us-ascii?Q?NLUJiWmKq5xFEZn4Db1/cUrV/JEEbSpdop/UDHu7nhNSWi6+v4ohe/wi3BzW?=
 =?us-ascii?Q?7/rUL+ravNS6GdX8HGt5WEJn5udSRJUsNwyHQin8Cx9sXZl3VvcjRsE8/yDT?=
 =?us-ascii?Q?YgsSDPKeWh0m30SUvK5MoXfipPdyZHf1go51+Zgj/NjU5mD0o1H1+C4C44ZE?=
 =?us-ascii?Q?94NCqFMwU0D9ks8SzvBQA1VOyHLlgZHwFYcoORd+ooYG2sYoqRPVYRs4DwVV?=
 =?us-ascii?Q?OF4MPWCR+30iRT3/P1k4I0659eZ6Vrj25D8hp5N6Ot174Syp/UreFaj3vONv?=
 =?us-ascii?Q?sKAbCQWtt+L96BPQjnKeBhp3HeCWzY3n4K9wzNk/GeGIPTQ2r8BRkqThGzfy?=
 =?us-ascii?Q?l9dy56fZAUOCfRxcX4zfxd7D2iedXa8G5SI5erFSJB/EzmCiTnLC6pYSJ2+3?=
 =?us-ascii?Q?71HecHDQ6OFRhqMZu64xbjS7kStmuQld42//OpmKtNeYWqG4UW4EP13D2gAF?=
 =?us-ascii?Q?1Dc41cx0ErkmeZY/MTeH641uy+sGdjuP6vBj/ys/AiM0jcLbW3ioGynj6Sk8?=
 =?us-ascii?Q?JYBGX86GI7bv1iu+VEh0SzRQYVK9KRG0m3m6LmCt/IS7/kXMXIxKyENI0+f0?=
 =?us-ascii?Q?ZxKcBY/CLux2s1dbaReq4td5bd13XiON1seqpLPw9fYZ0elB+N+COXNWfmTf?=
 =?us-ascii?Q?V6KcRfeWFe8L82xYwtPfLgdpBDFUR4EsYz+Z1QgpfVRWmBXX+Sj9gKRA6Mmj?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba667b66-e7a2-4be2-be7d-08dc79a90884
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:16:48.2264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGttyZRmV1XAR4WxmhE71AyZpSsrva2uWHZ+RhBIJvKQrQ3LZejxFTHGxipoD9GRRCM1GOSk6fx9ebEJth9l4w==
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

A revamp to get some kind of standard in the various exported
functions in this library.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index baaa6657d..c6c0a592b 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in miliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in miliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1439,9 +1437,9 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1456,12 +1454,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

