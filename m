Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65D0C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB0410F0A8;
	Thu,  9 May 2024 19:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQYlyi68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C2010F0F0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282209; x=1746818209;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=A7WhssOxuCKn78R6qso9/8vwCCIX2v1bZ4BndW29EDA=;
 b=cQYlyi68uBbWy5aFsF7GdKuF2XM+XYW0OSnvGTfhVUN6h8EEJehvly9h
 dXmCZaMwYgpqAqvjT7ZcbDBctJ02kyYXDvy8Kr4fvvLET3WeLe8nf8yLN
 WMC1oDsB6cQPA5exgp9axQYK9XdeRsgHLBehBr59i83KTUALECA4pnAo7
 4uHBY3GChnvw7/vYPYXWsPeMq11W9GLgpM+xykqkjLU5MoJw6f/9ZxNsk
 JJv0fBWnzLUNCKg8QQgEDiSg2l+SkbC1fzNopK8NEws3d2ALRDwaGOuyC
 dErnXEHcyMmOO0f+BssydONhiNsJ/su0J4WoKAAPTuM3MhYbRZ9DiPkhC Q==;
X-CSE-ConnectionGUID: qCdg5BS1QLiGj2QNCuZEag==
X-CSE-MsgGUID: eokUI0NjQGaRtm3r8R4pnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038413"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:16:49 -0700
X-CSE-ConnectionGUID: lDsKfYS7SgS10uCaqXezqQ==
X-CSE-MsgGUID: MBH3SGYRRlKBCWuidc/5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879222"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:16:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:16:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZXRU/JfqzzWRamlbyEF05QDciYkm7mu/oEyyDiDk0X29Tc4bO1lozsOpHOsjzMIZk7sD8LL0KZZEpZIWZbF2bXWTEc9h5DWJ9MN0rmSICf7YH38Rn/feltNb33PdK0+Ghg6TFjONcFzNta41VXJFCwCCXN9j/XtMzEvXI86S/3punjWZOgaY6GwV99QUc6XEQWf3GT1oS7HrpCGDEiscd9jshx0CWame8abRV4a6pEIhAqXqMvjwXNNiUfZMxsYm+NEzlxexOAc9Fn7hZH/kF55QTIQE0jmHM1e+dqnYzOoF2OWSrZo6AqFcMrNY3k5FFUVboJ8shAfga3AY7DgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=en0e+QlEDzGMovu8xOYi334+xXmew7WppvoEdn+tb5s=;
 b=E5Sb7vYlLecax3UGU8z5Gbx3zLSp6csM/NYkG1g2FH8f4B4YIWjmzPAt5mcOO4GWUS2AoszPHUkH4f9No+q5Yw9Q14tLRAkJXxKskRE4yYMuUFv4TEgXmvJV43IloQ1IccYzOEV48Z7XDku9Kx3k+DFVSMw+QUvUrWPbXaoyf3rfOPJ30DgqZjBypbU4jxRPFq50D06UQzKznL1sCr4NzkvOIlr8T+bSLCeu21Rj7G8/5B9KgzDAmZnPN/Y5uL4+krHOv+uu3EG8I6hcTISARyUD8kLlnJqiNM7vI7vG7WZmiSFsANLWwlbhI5qeUD8UCox4jBW05ZiG935+G0L+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 19:16:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:16:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_pm: Update runtime pm conditions
Date: Thu, 9 May 2024 15:16:33 -0400
Message-ID: <20240509191636.504200-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ad8702-6c52-46de-6683-08dc705c8e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PFUW4SDQs04gBqEvNLNtVXxV9FRVDI8nx9R5m7vDZVxbYNcnuUQM8E0XQCxc?=
 =?us-ascii?Q?arEtn3PvmKQScF+xk6GrECXBl9hLS0LTAEfiMgJKwkIzGkFx3sqkpAa04rwz?=
 =?us-ascii?Q?5xMkYRgbojyeQAfX1EEMTy+0wy7oxzq2LcSPgPFs/PPJ9cRSBg/k8/sadr5I?=
 =?us-ascii?Q?2oQGNeJf8ildFD/BOQuyiLDW5wCRhGJCaUIPmiF8QUr7sEE9LXoJJOKp1mmC?=
 =?us-ascii?Q?jwsLsBvhi/irXjkt1FHxsPocXYsaMR0sFtVeUR89C4nqZQ99v+Vj0dnNDwWu?=
 =?us-ascii?Q?PwmphCKuSfrGDwFbQSAJ7VK+p/cl3j2Yqmi7jd7RnXjEnPevP2P3/+DnsAtg?=
 =?us-ascii?Q?mt3eSRASkTC9zACX7iK2GMPj72J3GVaXb4v4Wnp162uO7ctk1x3R4mcmquPO?=
 =?us-ascii?Q?VVd66Vt7xR1xPipb5B9HKN3wwVlOqyD9thryEC02o7jVLfbNkeYCPC6aI6BZ?=
 =?us-ascii?Q?wow3xw8MxiVKR5bvZeFujzv+s04ohD2NBwThr0EghI4XCkDYSNDZTHMK0wmV?=
 =?us-ascii?Q?Hmr9UDxSLdQXfzg2BPZrjSI8Raixz3jaijFdC/5CHxFCfnmRP2pGjZufAdGH?=
 =?us-ascii?Q?B5zSF4W7EGLvge/0igDcRqVNybfpT8UfQutZHYpI4NlDD/esnWXql5RBDSxF?=
 =?us-ascii?Q?nuKRDoDB5blD8TSnVundHfbk5JA/sa/buPPDZEghdsYfCiYwDj3H9s2ULzbl?=
 =?us-ascii?Q?zuY2H1ORkiu/wZDp5zo4Nj0KMG1eHqYw36Szd0x3GN/Biy+gr5zd8JHE/sXJ?=
 =?us-ascii?Q?5Jbi+pWkW0WhK6TLXoIe8hLFWdUYI8m3j0KmR5BZFbHRsiUEYvK2BVg+YlNg?=
 =?us-ascii?Q?mkgOl5T+HCrOcQy1abL8YsO4XWa6byyoObzbMWXZ/N7TNcPMJVoEY9F2mviW?=
 =?us-ascii?Q?DTwylJcm6CyGw3qHZMqgW5gPPih+LIqsljL1QXTbPJ9dHstuOVT7b0L2psDJ?=
 =?us-ascii?Q?VtuwUBy+12plEwUH17jrHxq74zZfpN8hZYx0h0+gQGRUgJUy20XY59k2WkuS?=
 =?us-ascii?Q?W7S6U+pkvBoN8u6P970vauGJ36pPrXa/Ln5RMUWUJ6ooZH8EvUaSJXxAPjEs?=
 =?us-ascii?Q?kV1MEaDl12gfpfJ39pXCclyzgeziyZhwoACjO52hE2+8G1uqfbOs/djPTApk?=
 =?us-ascii?Q?6CtHojLcrBOgofJrQ9iexIYpvNkF4b3pwpYe81tWNcMyHDHU6T2JGcp4IyQk?=
 =?us-ascii?Q?THMogcuk/9fuiZFJnIOwsApTOJpPbPfViI0bM0Kx9GIkQi3kfDreYzaliOwX?=
 =?us-ascii?Q?+U9iY9TEaC6RvYCadDaomDwthVp+Mp75cL7x7Uif6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qxDbMrwJTH7Cw8lfbYztaHB/jmpIPty/fysmM7KS7ZvYLEd5euAgPrNr2qJh?=
 =?us-ascii?Q?uiJ8VGBJu8rzGhCB5PbwHcKDe3SvAAsQcm1PoJc7rvQkZxJitDK6iPlTsvXR?=
 =?us-ascii?Q?y2A7bv5PtUz3IZccUXHMYDvlh1Mjeq6K+ml/6SKalb2XK6jixNFTNuKgixqH?=
 =?us-ascii?Q?4siQ8e6FizEMXWN1QKSguqr5RxBaFyB3ur7bk6kkFWUcaQnm6f8L6gF4g0MH?=
 =?us-ascii?Q?4Vme6Kd4VaHt1uZ6RhpGdJAkEGeULzC/1iXHTVCTRzI0EIMTPha1W8JhgTnl?=
 =?us-ascii?Q?qWCIM9MWuWrGtae9eQtgIGkJNAzBUnEc5XFruQaW/66D5LMZv6r+QRcsNz55?=
 =?us-ascii?Q?oHJESKGvD0g+7733MZRHCS7a99SXmDkdL3UtMndIFxyrCSKtDiWzCSjmXiev?=
 =?us-ascii?Q?deBvS0h2XO0OZIvK4b1IbRps251heciFEw6BshCBb+1gkgg1llYXTnK8duM2?=
 =?us-ascii?Q?swWu5RH06BDRO3HYLBFrJ23yH5iGciHFWQJh8PPCateYXhXxAECxbK+JbFm5?=
 =?us-ascii?Q?eJX7jh2EfUtIdKstC4320nd6HscTUgwK4dzwQLH7rv4ddWHvaHxDELQN3RUe?=
 =?us-ascii?Q?PYMrHM6PPpEP2ZUogCPwshvApQhm5sVar4p53XbrXbkQn6uAmFXX1ERSUYR1?=
 =?us-ascii?Q?K1A2M9pO9Oq5tOgA8OnTM1Bw4V8+tAy64z+lAAWZYRqV6becu2avsngSERck?=
 =?us-ascii?Q?gGv1hVAd5thvGutDdf331qD3Mtj6YEMIdzz2RWDiUmq4Mxljj/wQyd7I1EDQ?=
 =?us-ascii?Q?cPwkfexpKDYh6348d99YEUgnk7jTSrTQ7k7/ONeqaHdPEm8QwifL6vQY1prv?=
 =?us-ascii?Q?6AOHUoGSACdyvq7tnlAG/gT9wUC0HXtm5iDVilIAQRj3fitDNt3F/upK8z8e?=
 =?us-ascii?Q?oQV3uNjtKij85Rwk6Jiy3uCS9dSAyb/C29mCUXoHKmRdpPsot4fqJ0jBFed6?=
 =?us-ascii?Q?5lvikMKVp0HrSpKuCJWrxqlWvaMnZPUTCwMjWFddOgW/i21VT+G1hez8/pj+?=
 =?us-ascii?Q?Vhr6gpX5z9ypPRZbX0BfS/viq/8BhcALGoiusXQlox+QsinjvIbmyHnjqEll?=
 =?us-ascii?Q?RAQKXaC0TT64rkTYQQvUzX+i9Qo5drMoDhKPXOj0LnKXK2o9OsAGziIznZcE?=
 =?us-ascii?Q?DSZ+vATtOAH4s+ECywknL3cYRyHpIvrOqqCHjQMai9/V97JlDWaOdCQQEOY5?=
 =?us-ascii?Q?D2WPNlKASkrT+60HKeHh94Oa58HnwhQ+m16qUdN636bgZX9zu2Hs/nnzhgle?=
 =?us-ascii?Q?YY2hmo9zF/b3G1IjLrocaLrKMASxea7clIp7s+JapCRbzM6Vorh5bjedPhn1?=
 =?us-ascii?Q?dj3YXxqdRP5iHiLP8n0/W9bLwkL2cB2nVthjqs/vQ1Wn2Xum+oeoCfwg/+lI?=
 =?us-ascii?Q?3DP5Kb8vowuGPj1sLH8BF4cq0kbOGk+CYbz2ADno+R42uSbt5RC2tovghPCc?=
 =?us-ascii?Q?GeiUtu3LYlMpCPsFKtaV1e0fWZUkkDkywDtMnDkg20OUL56qk8t/sqFjTHDA?=
 =?us-ascii?Q?oy9eP5ONueIJDb9TyzAe4k29xSx6JVDjZnVpqyvY0FhEsVRXcuJEFq2f7pf6?=
 =?us-ascii?Q?gO0oZh45W304JQWV51p+JOb5pvWqohgNAUZdn2V7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ad8702-6c52-46de-6683-08dc705c8e29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:16:40.6216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i7my/RbQGnLHWdEiH54bqp1p2NZLD7Py8yYqftxVYcJSM6BEQ+zcSKvNxPyJKyXyf4u2r/gYV11DLrPbed6jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 18 +++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..98cc8d969 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,24 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
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
index 51442537b..661f837b2 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
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
@@ -322,27 +294,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
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
@@ -380,8 +352,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
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
@@ -422,9 +396,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -452,15 +423,13 @@ NULL));
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
@@ -554,10 +523,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
@@ -568,7 +540,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -578,22 +551,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
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

