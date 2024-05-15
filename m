Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A4EC25B78
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F414A10E1BE;
	Wed, 15 May 2024 17:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7EYdlDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BBA10E1BE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793212; x=1747329212;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yWHgq5jI1cjQpm/EIzdUuFyoPDzqthYLuwjUYe4dRGg=;
 b=I7EYdlDZRoLFLeq3lP42W+XEBF434naEoM0Ca2glE6MBKAx5/XTZ7ASL
 BxeC5VbKiNO8y4+UOCTICqwGV5FbrzsQ9VgSzDgKPGRT7xfnwJ1rKOu9m
 Nscyk2LkLhtM07lspbL5cnTks1b2dVfRiC2WCEU7UpXxBPVfvEsDH5xfZ
 qlL4s4t16OHeaGUMf98hJ2OHMt77E88aO5jJqyzyr05FBfdnVGg7LgSjN
 6m102JADjcGGO3uLcfIAeLpmd8PHAOUvc5sc0zzIXdF6TYzK7FqzQ9j/1
 6Pg10B6R9ghXbE6iPPcYWgJDCghzEWxBQisesUJdaKbNxF359qbbyKfxN Q==;
X-CSE-ConnectionGUID: ymDTJf+hTvGlEcVGgHaiIA==
X-CSE-MsgGUID: P1+MM+l6SpOoDW/XUANWLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12031993"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="12031993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:13:32 -0700
X-CSE-ConnectionGUID: vAFuDDcXSESg7qmf+6cD+g==
X-CSE-MsgGUID: hiPLT+keRiuos8BC4O3+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="54332202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:13:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 10:13:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlr4jk7fUoL+YMp4uruFhsE5/7yTw2DdsIrQ+6S+80Wdv6UvgKz07FYv1sCzOo/Nx3UftuKd4ggY1DvZIAu25KUBtNI9vuF6frEfVuSkKRYGMD/SlqgHPqbz5mW4cPFiEYkpVlm87jWDHWBOWEyVENGegAJyLnkxHVe6PO6hvleduZjdnZY5hnV2243ZZWGDu7vtTtHpZgeGAIdg5JPq+p8ZeECVjtv0G3zZ0LeJnRHdmd5wC68PRwrbTs/2m5WMooVAcEMQDDHpSwfGspB+uTs102rMZeHU5YjWEk3Bje0IeWzZ1DcPmQTXs42JCQyYcd+ySH1Bs1zTt8AEZ7lvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grngtlV1YzDFWSNVilhrNu8lanlFdBBQAgdkXfUuP5A=;
 b=BM9UByPOTaB1Fi1IHt/0c62A+I4oTHkcnSHi6OH8dN8QmhpuqhswTDv0lklxilUYWuJ/+dS2aSOBxgbaqUj4x5UrQZX/zAHDd+4liT3DbZBHhPwwzVrEqeC4r6N7EBc5TR94FwbBGArQOc36iFjuE7XPMPjx2LVtWLnjgV8nLwvsCtfboQIUE9iGTAaBcTUMjobtGbI6+nloIYc/HDQmf6fItUtovSYIz1zePQncOSc+ccZFCuwgmVxueZYHlAVHnwaSMIfB7E6E0EXP0MDH28MZEA2+gS0w+2dq3xdey39ah8Uk/13muWOAOJl2RLsSMrEOt0CpilCdYtWb6DmHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 17:13:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 17:13:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Date: Wed, 15 May 2024 13:13:13 -0400
Message-ID: <20240515171317.84811-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd82fe5-b785-482a-459b-08dc75025602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZbbLCbCMB0eFt5xNOsloR9DnmAGu5Ekib97sM7W9Lxiz+Mif6A3yFnVwbM1d?=
 =?us-ascii?Q?57+yB1Qdx+Z0925cURsA8xuuNw/GigYP9anBlJ4TZfBi9NABIM7wUNaA1F2b?=
 =?us-ascii?Q?s+qQ+zExfGp4WTSmdbMUkNWXG7eq+Xj+iIgiCCdjPXtZXCj6X4FgGIG/EHzu?=
 =?us-ascii?Q?ltUkgs8/M7b++fMjBjEKB48DPYBsvMfPly2RSiZCkPIZN9MeaInq1wMiARya?=
 =?us-ascii?Q?zTKr1CVYkbVjc1JHN6dRGUT5ekNnTL6f3dlXOqVQ8ZtKn+KTFlAxgjbHFEfd?=
 =?us-ascii?Q?yBEJBh/PAqO1RDLHZwrxmIu3SIUks8YqOe1nCiq9VOmCK5fzAeiZh7Wr72Ek?=
 =?us-ascii?Q?rMAwQWIt2qe0/G6I/RJcDfafXYs2NQBliRIgA3YoBMcQYUsf7jfOpWtMfrNh?=
 =?us-ascii?Q?RH04TAWgpx9sOt8/iTK8VzPs9Jbij1wh31qFo7Yklg7wj1eLq05n+gxI9KF5?=
 =?us-ascii?Q?4gwCxahU5+XgByq28d9tfFoqg8VuE6kFJft3nHrxOtlm0r6oKdTsGkqN2obU?=
 =?us-ascii?Q?RcSUHZXCjjc/woY8skGyhi4KtoM/NAKIfg5wAB7j/Dx6wk0ZyUX701vpaJGc?=
 =?us-ascii?Q?41sCOuwM2zXsddS1Kp4nIXspyih9culiXN+LL2rx5TEieDbWgkNiOammVOza?=
 =?us-ascii?Q?koh+UjUUha8hXB0+aJF2et4MzUlmRrtriR7Wkk1mSu+7JKYwgdowy5RbOlPA?=
 =?us-ascii?Q?d4qSwkFDvE7HiUsjrwBED9701Wp8XHsO/UviRQW7yCOGwE87nEophV3ejkll?=
 =?us-ascii?Q?tmWcM1hxtbsWwUpSyhGDYpBFhui3r+YXKXneSB2BkFK7zQZuUKkmttWF8DkO?=
 =?us-ascii?Q?vPhcAPXjjSJHga8a5Af/Z5X3F0OdosucEyplvvr5g2BwhIBycNZzZU3mn5K2?=
 =?us-ascii?Q?Wb4vr0c6SsIdMdEvVhhhm7gfb/sYFqJVs0UuXLbamlN2JEAp0WCRPKNSchvC?=
 =?us-ascii?Q?iMYzJzVzxFAdIC2ffNS34LjOXYQ/YgBAtfuTN8k9Nhz5NfJl6zhfFaeDzJvD?=
 =?us-ascii?Q?DufeKQUcea0Br0jo1/oruGQXXxswqkPSoIXmZpb3B9IKKwBQ5evLOaiwcahx?=
 =?us-ascii?Q?oBZl5Lz4vuCPnQY8RzQOt0LnYwiaC78VmR9tdgxzQ/+dPfec0plicNAWqzSE?=
 =?us-ascii?Q?egeZNSRkF/3uz2DMLvD4iNp0ZEDnTNQoPHLznN0fUg+KQ1v6nze1yswvB6K9?=
 =?us-ascii?Q?Bhv7wSkV+aB0HmlJF5XINixk2pVjpmICbEjru982WtoGEo0o1pGMteIQbq0A?=
 =?us-ascii?Q?pRrni47gwUfni/TUc0LVTwf08fD4eljFtggyVm4NMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kipU5Xa9Ww6Lxzeys0aMoRro01ZO6EnsDLH9tWaNbTMU+iW4RDH3GN9F5gJw?=
 =?us-ascii?Q?oey8YWh8dwoNU18ZqhDwtegYF02dIgVH21fCRn75p6Mo+ojunwHDq2Mz/FMB?=
 =?us-ascii?Q?Gi6oqegef//sH4YNqXfiLrpY/daZQc2rS0q3BtFv3BwIdD90tCy31V1xDUlZ?=
 =?us-ascii?Q?se/EeQrs8jx5vXK7DTXHKZitQrsDphSYvtkNr7AY1nLZ24dBPTJoUskv4idC?=
 =?us-ascii?Q?aj+mFU1VIy8a4cmjhrBaRhbIx2LwEyjH0Nj9Cz6IX7bQlhh/aC4hataRW4ET?=
 =?us-ascii?Q?2oPu9I886DF8vCbi1FS1ka+waSFba5oFhanRg6rmJwCQf71Xzqg1JqqTkfhM?=
 =?us-ascii?Q?mFqDw1z8nIjg+rOmxf58tOycJo3ITqcAIc1QTSiwL2rDFEHZ94KmPv1efEAo?=
 =?us-ascii?Q?YhnVxCDJg0ibnj7wV+1+2wa4Lyv0VrQB7GQGna89mmiDGHa0vMPo/UedIB+q?=
 =?us-ascii?Q?MG5GJxOHYUu8MufAnMa+vhfOoXsueh7fbx2MC5BhdFN7kPznNnaZiiHreHdp?=
 =?us-ascii?Q?ZDx2yIAFcJ86SPsqscI/L7GWRLvQkQg8QQluvV82GV9tVUGk4Ozds+jgWaE3?=
 =?us-ascii?Q?TGgnOIeoX/hzFAfwSuSDquuHhoI9fcPXS21mNHW5Mvs5xb0bDHqH5tkTzjTR?=
 =?us-ascii?Q?jLzCYracifWWmXM16MU5pCTco9OdggM0bTM2CGlBvTAsZH6gjQevRGHJfIG2?=
 =?us-ascii?Q?/ys+pS79nPIGmLwfxVwTeJ4APT99x2/yUgSDrQAKIPaO1YTqdHnqGW7I6+8U?=
 =?us-ascii?Q?GB2IJTgXDxFjvPY1XHS610/hV4a6GueqvgrUVN8bMwn69EBFRV+LTNsvRPSz?=
 =?us-ascii?Q?h/iN4FRYjH8TLhSso6Lnj08yPE3p8uz69xvIW+kK+HtuqFssbuwvZbrvziS4?=
 =?us-ascii?Q?sioejVwN9GyX0ZIfm1ATFSMbuBQqF5rpC2KiVqxszlxNA9noAXmS25XqRGtR?=
 =?us-ascii?Q?cyZGrECwoZ7dpPV23qdbQ6WzUKUm4Ndsio2ES+iktTwM4+ZwuBrY3Joy82y8?=
 =?us-ascii?Q?ijUN74gt7lLcB8Z0G07ejwAegwBg/curRFsR8SY29H2xmRZbDjiQL93ZWkkl?=
 =?us-ascii?Q?G50NK6myCcceT7Oyzj3KxLncQZ5YaRW+d9uAFWTto36znxu3n+E4fSo5C1+I?=
 =?us-ascii?Q?dKh7hFhrAVuCDaQjEGTK/ARNHSXI6jI9VQX8sa9Q99uw55ywtUTZI20Jl/wX?=
 =?us-ascii?Q?ZeOck3o0tGw8Z39A5Kcosv6EEjRDLgVSBBVsEeYBUpiETWMrHYsKTmahgrgr?=
 =?us-ascii?Q?qjliLVw9ftyK9siKxcpcJzhCOEqgFzQ+lkn1IlpRkBCEkoZbEQBVTTgzEx3n?=
 =?us-ascii?Q?JYN3aao9aZmz4mP/5vVVZ9lHgpmO3E/lYQAET1BgWxjN//5adpsGh8kqh6Bd?=
 =?us-ascii?Q?ODABwufRFMdedPG2uQAc2YHMofxqXnUMSkxAOsfkbjv1mjcSXOc2PAuQULum?=
 =?us-ascii?Q?s6doCqrQSvTmmiLc7z6k6y8VWZRIR3/5xwcWjSYPkMEgWIEM+6RKVSPeQYTu?=
 =?us-ascii?Q?qgRxQERvAlghYGYfGw2AInmLuiN0PA2GJxCEi4BboYqFtV2qov09ZkjCb/08?=
 =?us-ascii?Q?DY6hineMgd2YQMGImll11FJrWRqm0TMWjoqUymuz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd82fe5-b785-482a-459b-08dc75025602
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:13:27.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBFqHO9wz+ajhfIXqpUrmsKUHYpwivYmpnh4ddINR83eR+H1rrY7NqxBhkwxVORNH0BoSNGyZUs89jnNbbql4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

