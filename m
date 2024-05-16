Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6DC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F98010E1CE;
	Thu, 16 May 2024 18:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTvZsFrc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE86910E1CE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883022; x=1747419022;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5DZ/YYNev2+eSHh9tKUpwUtXBAAcsoQLC+pQKHTWM4k=;
 b=dTvZsFrcJN8gwvObMO5QRRaurQJz9yiPulLESNAtgzVltKG5Xp/Slo0F
 XtZ5mrEOc+SL+g1oWuqEbj3mg3Gc8tYVzu03a9K7yCYFD0u+tRsFI/y2d
 GuI67vCZymeMRxPLA18Q5ZIh0eco0l/93F0C1hDXnx7Yk7JoE6Ctz39uT
 +d4cTmin5j8zhj0yNN3K0Iir2BUw+XrVtszPovCvGkHangAPJ3TXUEnTL
 ceB9kWhhnNd5e7ugCPWTd7Upyh7/EbFNB5ezU7eq6ouYaWzmnWWBhtvzn
 /qocEtSQF3sfIpOJTA6ojSMYFAY0mRiO/9GQE19ZsHQep1ze8EPMMJ8nV w==;
X-CSE-ConnectionGUID: aMsbavP5SPqHhJkfVu3aHQ==
X-CSE-MsgGUID: zha5FHf+TYq7f/Jo4ZVczg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11828641"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11828641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:10:22 -0700
X-CSE-ConnectionGUID: zNDa/fLoTEabRStzShm4og==
X-CSE-MsgGUID: e6Xra1aVQra6W46Bs2yaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31449369"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:10:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 11:10:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/bo+w8tNdr5mPgpZ9kb/KjsSlDG3KzgeAvmglRi4Rq7ZWKwXQKyij3uWQQN+0DYNKKgoOUMj5WqaTcJ7Yd/591bHp06XQzdOYGfiK10UrHn9vFAEeQluowaYEIDeMUx/Yrb8VS9qOUks1GLEbCmtEloy7E0MXpDjD2+GKvVomxN7IVsjbTKwAcj4LQ7rnmrNyWxhX4aSJFOhjKFVe5fgBLm8n77gpbd8iH+gVtlBp3BuHoQXSUKbnYhVLMPLY1xvweMjQw3fCS9/DXJfU5uTL/dN44bTU0EsdzNbYfzFGLeQ/1zh4AUgW1Q1jMzckmyr8SYY/mZg8oJ4kg5f9wJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JXM8eHl0acVwrYreSVUxsHaZ54XZ2BWtuUMeohJ/sE=;
 b=LLzmRCody3lpX4SQBgtNpHnslSO/mnHr6CxE12GLULctBkpez2CBktm2KXsaOgYV/JP8tBvNcX72DP/tGaicCC7ECl2IGXgurPlSkJudvtLcnvCU7T82ixUN076QZujVuLYQYs96M2unAX4tzcGd+8t2JlAQQyRB7FKg43dKbklE59E9fv25F2zzDRuBiDM3PN+/3mdFqlKLBFA/xIvXkti7rUYe94E12w2lTYYUvgBmFwbO27mj+PXWGW91ZC4nD1eGLxjYu60MWAe3ZYJn4r/5/f9q9OzLX7GUnbDvP5cl8cdsuZnEuSnK4wMw5z6M73OLva9sKWHA61joym5Sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:10:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:10:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Date: Thu, 16 May 2024 14:10:11 -0400
Message-ID: <20240516181015.149824-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f1a409-0be3-4098-3d8a-08dc75d371d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V1rvLbCfuTppZ7iltGtwQVbzN5aI0b7DBUprDX6BFWCyv8Kz5o7vhcN95d65?=
 =?us-ascii?Q?mk9Fb9xIamP9UFDaBZkjOZjxa0CK0aKywQJpeZD3EQuwNFnibmlniuO9oVfE?=
 =?us-ascii?Q?WtC96q+E2fM56lXVQxNpoiv9/+Wey7UVYlNkQXjHM9oCXXH5/cxAFvSP9e7l?=
 =?us-ascii?Q?ccdB9456ptfEGa6QxI4Kb1xCGOVYRAXl5dlOxvsnYY4hhTMo3KEMxGbnMly/?=
 =?us-ascii?Q?SDJLw9IqGmUHaVQgfiNr6C99Fo3+tKGb6Jen79o/bKETeJ9TqQBk4OsmDm2W?=
 =?us-ascii?Q?qv2D53bCY9AoteFuPwZdqru9U03E2mue1Q8MTpwjIlIP4GwU3rRMKfVeQl9B?=
 =?us-ascii?Q?e7R6jQgk7pytNkwothS7eWJFvlzoPjPI3yJu67wuDPHLCMuUh0IlqGcUjvyR?=
 =?us-ascii?Q?uQBLrO5yW+nAnu9P+4gSPX8sfPvyuBpjf5wd2ZDmys8B2KLXFZlFVNQ7WS9R?=
 =?us-ascii?Q?EjZjCGbj1StlTRD7OTL3NQy9bV64lyR394KjdtDpqh4JpiTlhKLTJYOBqMYz?=
 =?us-ascii?Q?axFxnrNiiDw7zTknTLmiDCJ4lHXHmLagj0kEBOmviQIvIHsWCnqkPzKLxDmx?=
 =?us-ascii?Q?NKbKBUArCeywQg5FgXb9kqbG+uvZEu2NH+Fjm6sPvV/NFikIfxmlnVdltziQ?=
 =?us-ascii?Q?8m3omPBMHkxGLT1O1ITqNxHeedyMCK6kVKrzxLBZn56Fc+eM/2AFs8FrbM50?=
 =?us-ascii?Q?HGS/EOfKsvpCI6TOxbSZ7ZEtV8JiXjTK+h8x2+Oxp0+iCGpBi4s1wyyZK6M6?=
 =?us-ascii?Q?708rFURMa2aQQto6W3kTZP4D1DjZZbqba4fjOkGGUD8GwUIdc555WxvPlfuV?=
 =?us-ascii?Q?b1FxNSUy0T59Ub5iTle6V77fzRjrqlV8so98eFqTZGGzJ5SHQcIdSlAMJxQW?=
 =?us-ascii?Q?7utqNlxU7LbD+GKioG24vStw+ubHyefsNlcTFqUb7WJxU/mlKMZmvNrjcMVb?=
 =?us-ascii?Q?WRNl2GIhsURfaPSBKT5IdMcUriAa7zlNidIwhYCA/hB7ts/3Ys9MTq4aaExy?=
 =?us-ascii?Q?Hk1HCfwMLRFM3BlfW0DKVAwU1Hs3NmoQNZXchQMnyqK3FTl0TzbW72q2COnJ?=
 =?us-ascii?Q?lENcYxTo01sKUN39wORW/+a5prJT/a7CoCIRtTaLMoU3kh06WiOkOjQtk/K+?=
 =?us-ascii?Q?JZpkkPA6SEfYu52q8PxKz3UondZGs352uBWEDKszk8H8NCbWngmM5ao77fS6?=
 =?us-ascii?Q?s8zOKEEEimLm7hEdlGPBEddGOKl1aTm/cksJ7odSppplq4pLSDVQ++JzdYUm?=
 =?us-ascii?Q?KZ8bNjjtA/EwS7dJo7Ow5pO9VmkWAtGDLEZU9AT3NA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B3YZTr4V1N9thTk/25cXWfxJWCTNjc0udPMKyKi+RbHGPpUuG8gB8gEB6YDX?=
 =?us-ascii?Q?yptl5qNNfgp94SFQy3w0PIbuw75L/2R/zmcHvczrhzoKNATfin5SaUjX3g5W?=
 =?us-ascii?Q?cQXpiW+pyYs5oreLf7j3gr2TIiaa3BBgcU/TICdpqNFmOvOjUQQjEgFhh+Dv?=
 =?us-ascii?Q?xjQO7eIcZqblr3s0jSmx2XEJaVtRMIMF6ZvmkCfmgbnDY7hJ4EOFM+2rbcCj?=
 =?us-ascii?Q?cB4c6vTUnKSJQXwDb5EUNdPrM64mhzVm3/sFfPWIUXXvASNybRw/Ymf5zf2R?=
 =?us-ascii?Q?LBlpnyFWVMuwXkx2/NbFQkHXclX7a7NHBO4HjNjRdbX8/PCysa4REPyCwSdD?=
 =?us-ascii?Q?L9TnmABIpbhbKFjqZdHgpi02EyQis8DzPyb12s8D5N7JBlYEiZvqo07nlszg?=
 =?us-ascii?Q?CiDJFb3bCYxBga9KXy8eWIuxCHuwo0imHs/T9GDJsXxitw4yYG5V8vfzTJf6?=
 =?us-ascii?Q?urLg8pM0k3Suo+pIaHSwXyAhPwCx8sb6ZD4PJLxo/eAoTvdYoIVFTcJjd1Vu?=
 =?us-ascii?Q?X9zan07DP+UUNdSCJWKUulU5NF/XWXMSZLwoEzbTYwoxO6djvKY9IWR6JZI0?=
 =?us-ascii?Q?jgx4XuLqC4FnhJ+I7nnhjYploQFkGbtLcFZ9QnLb66wJhuT4INFx3sdi/rMn?=
 =?us-ascii?Q?jFTRxCYUuIc/m1oYJABT8vh41Vfd6FuaDZdGpNVuU2x+/q17iIeO8epLaIXZ?=
 =?us-ascii?Q?D5+mCxr/L89X18xT2JjfvvcLxe0LKUggCpMOjXiZ+KDzDZlMmhDRfkomUsz+?=
 =?us-ascii?Q?X3tY5oka8DZXoIC5Vp+mNk9mIW9LZ0V6AE6im7O2ReG940u8qQLDf94rmzUb?=
 =?us-ascii?Q?wd7Qg5G/5ddqKIMMGxLNoxn2c3s/kk9Z28rpyraGmlRYp2ZsW1rPHXy094qG?=
 =?us-ascii?Q?J0Fnb5To6fP2QK+1ePffrulpD0e29ZLwYDGLd72VSj+xplbltNGqmDqRY1CH?=
 =?us-ascii?Q?oUp9ntJ4ZPVYHr2XMiMGzXEj6pGADWc6EkxvTlrigkA5tClrve/8vnAokweV?=
 =?us-ascii?Q?fCiYo7h6Aj3SYbyyx3svKyL/0BKq4NlwQmvOQFhulSuyoXk8uCBZ0FUDdkIB?=
 =?us-ascii?Q?aWXiDXV+N11TYEirc/JwLOjEr7Iu8HrG2iv3JDYLko6cHBZoYisir/x5Q9A/?=
 =?us-ascii?Q?5d/9yJL2msjkU5q3SyAyTBYBxvsRqt7kUXaOS0Ea5vp0Mnyi3of0zhOt5JL5?=
 =?us-ascii?Q?BgbEt3+vmk/wyMI8xInFaOIh+1hYo7lo6PfsNzuJh7Qjb/cAGpLKC9G0MbdW?=
 =?us-ascii?Q?+Ce1hnpYpuNuXZYuUGlJJoBMrD3i13BnPaulttVtBntFa1dj6oM6cTZqr/54?=
 =?us-ascii?Q?Xg/WZmbjtVpahneOtI/6fdlt1OaMmROVNdmzeNLiWcVZyZiXK0nfXXL7AUo7?=
 =?us-ascii?Q?8/OxHa+qf8kJ5y5S0SNVPsXxHKBjsd0v2D7IbBOUxgMY0yomMz4DgpXq9QpK?=
 =?us-ascii?Q?wYm3fag3BfMt2Sxoxz9K4ry7V2zJO39YoEyfAZbcUPwBdntcLOefk2euvkxG?=
 =?us-ascii?Q?dGOodKXSESPZNUflmwvtGrIAVc6V3xnXdQIHkOA+Hjg/wM8onzMBmDXrMhzO?=
 =?us-ascii?Q?znGVeugujQCzUKYsvbf3HbrAhl6g3ZEYLSm4gdeLJhC8mdqpcUe5sMoIaCeb?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f1a409-0be3-4098-3d8a-08dc75d371d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:10:19.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lE5RaqcRzBBFxuuqCFGlXisfwVk9Hptk0/cLZbW6CHqMGX4AJNQSE3ZB2c2GDOmsMs5WIl9PMexnlsM19Yg4yg==
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
index 9cb00c7f1..9e1f1723d 100644
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

