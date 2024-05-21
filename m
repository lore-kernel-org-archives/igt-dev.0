Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE9BC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A47110ED3E;
	Tue, 21 May 2024 15:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsRt8EC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E95110ED3D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304625; x=1747840625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4fzlIvvN5xcIXY5ms7eU/muAVevSQTxBqKigRlh+n3A=;
 b=FsRt8EC0GHtZMZUJ37z/OTtKU5VeQiHHkIrf/6/ahQn0GfSrjdVgnZbm
 5I/8QAu2cv7mTbQABYhKI4USYRNxCnpPeQKK1naFsqWgjAWfPZSrmwkxA
 aw76aTJrEIOwJBtPXLH+tAKADroXgEzfBYekEsnaC9cY9ZYZ86wHq3TzK
 MMV6exiU+J+tBRQEb3CYwqPXV7mfuGj9eJFprh+ZIOBtdwzBRSzcrEV1s
 j/A1w1//nH3bzKINe1cA2h75as3681RCYzWMTjW6+VOnI2v8qngwX1QzS
 p6O6wLPHY7nJ6Rjwd6Ei1s+KOLHGzUT5qxzSzjKNcFr9Bjw226/VJu1Ho g==;
X-CSE-ConnectionGUID: phcJuyTdTKqtpiILel5emQ==
X-CSE-MsgGUID: q6AbOpWCTQydpl9au1Ummw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12355420"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12355420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:17:05 -0700
X-CSE-ConnectionGUID: bgjevlelQleRQu3fDyBEsw==
X-CSE-MsgGUID: e6WLyDu/TdWEnq+80ZFr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33078550"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:17:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:17:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:17:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdfN70nuye3r/cjZoc0hG3cr+oh8B1OnWgz6TVRfZAcZV0HM36vvosKZdX1lxdLQBI+DSwGesQ0ka8nybNLXA5DIT7fkR71/GP9BP+G6/v/raWPsTSha/CgOnAkgdCACttiXsdE9DQWR8gttdfMmlolfe9eQpXEzgVDrPgkfBU4k1ob0DZTIsJSrBUkviRal61+9XqESY0JDufpuS5LqXB56ba5qWICuIx8Ztco12LekT9Nyo1H2dy0ePUGV2FwCNbhX0zWqJnOh+I5C0j3nKI46vvtwSPraxYBy4W37L8VWQPNX+VUovtt8TLAAY5KjbRaqvIuo6TiGbN0iOf18tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKYgG+tXbNsyrHWoIij/UfCP7DCLGx410DJcZy8Ist8=;
 b=bZfu5e79+vRCcuFu2byE1T3mIghmnIRBovfeKUcjk88hMEnWwpkDyyfEScUE4AHCdcyrGJgWvTHApapfLIgKMoh9j0vMYj4XW3IlamQ/mKctsg8qYxPHN9E6HppNhuPJMRgJMsvJUtnTAamPxT/fGjRtxVOowJyfDCi9Il/bBpLy+/slw3iWNVHDDAadcIPVdhwofDIyCG3dRsVZPz91n6etIELukp9crJj+LM0UpyEZG8QkikJ6m2qFvghtRO6MLDGp+LDQ1omQ9h2vIaKUNJyFCrB5xG5qjBQR8NE6JJHBinOgLfdwItQfjiBb1eJqsIrnbIxKNXNbh9/QDnqMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 15:17:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:17:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 6/6] lib/igt_pm: Convert suspended_time from int to
 uint64_t
Date: Tue, 21 May 2024 11:16:40 -0400
Message-ID: <20240521151640.280354-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 2212d065-1fb9-48b7-a2cf-08dc79a91042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UStJro4PJjEp5nu3UleGHbPghbVps24DgxruifArsr9XO0RzBW16mpIFo52+?=
 =?us-ascii?Q?PliJPDKU6xN9nyBa4S07dT2p93bwzwVjM5u99liCFxGP0wlK1sphkzU942yu?=
 =?us-ascii?Q?mXJmZfwSr02ePe3cbltg6+kFdyDHQ2OcHa9jf9/wEjO1ztsXbPZQ2qy1O0R1?=
 =?us-ascii?Q?t09gd0CUvmeafRi/R5U0jQt63SioN3lTnnyYazllLbsTz2weNGIiPG1r/mF7?=
 =?us-ascii?Q?Vmli0QR8RSukyfLHi9lrb1sow1Q+ge7sVnx0ybhjgSBmYJKmHdmw79/IepMo?=
 =?us-ascii?Q?sEjhHYjLjxjP7BMDIMj8hKK0E06EWCDiDyJTgEpKefvvAgjUgAeWJkHmHcQp?=
 =?us-ascii?Q?cbjKQNyntshegGpWnDw+QVBl0OCbVofcBhk+mdNnq6Zjo3SzIV5Cn0z6a/8T?=
 =?us-ascii?Q?GNwuvfwh+h0tAjWBIwZf2KMAqg6nkaThg29lpgIYVUmwZBbMICTOFKKm8U06?=
 =?us-ascii?Q?XeU4UJTxYX64gsI630YC7C0qtLXS/GBt+woYtKrkzFZawV30eClfayrF2R6l?=
 =?us-ascii?Q?OX1ZjFnbJvaF+UE4NW7ciKShbYcfkLrtEK8C0Pae36HFDsHVz8ffCIppl+xv?=
 =?us-ascii?Q?JX66IEFwPYchSDzsE9xq7gvGpR1uY4qscZvYF0E0736ylvb3tYrujLcyYnC4?=
 =?us-ascii?Q?n8WJAG7SKfKc8N4Pen3RaXzJ3htGqzeYZzi2ztiVcZer4MSmV4s3C/Zo7wmT?=
 =?us-ascii?Q?nQOuuEwePAyWRvL67wwtGY6YD28OPTw5pwixDI3JUbwOXQ4Jn6ccYN8blFM0?=
 =?us-ascii?Q?mZSFxRKfwE2Ynnc2IHHX7q4gdFkAmXJL6/+X23GpWT1tkYidBsBRUrCrlpzr?=
 =?us-ascii?Q?6vbXVj9LCflLxfNdeNP6zz5GquUBgCvxzy2dNW5m2x4RYDZLi3zPLMdkJanQ?=
 =?us-ascii?Q?Or9tLejvgOut3wnli986eEw8dEuIq700dFYimJqmmPE37U1nXuE+Hcc4OzFs?=
 =?us-ascii?Q?iCc6PIBFzK8uRn26h82y9BcDDQ/1hDaGpzYBx4Fs1WkC7ybTco0tFCt7796f?=
 =?us-ascii?Q?561auHUoYFIK2GECTB7UX9vA7NZ/SC1VoD9DDTIUi5I0xraLA+64aj46xlht?=
 =?us-ascii?Q?myQAEFuPD69B8XpyIfLtjhimQkI2fu8b6mfd+pzGR9Laag0UEd5LiGACgJvz?=
 =?us-ascii?Q?xQjaNCy2Kvb1jWoiPYDwPIvJ1kW0L2HVgHmb9zi+YeQGS+EpLLseVpKdM6x6?=
 =?us-ascii?Q?Gshv28ptH5R735WPeQnYjzv/AzxhrlqmsQzKJ2AXy7n7Lg8JAgE7rJFsY6fX?=
 =?us-ascii?Q?zb2wyvptNOpbMfszLgaTNstuCZvRUPQXmKY9V7zuuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fdVYFSvsiMJhj0w0NaBGDzoTZA2F+v00GnLvJedZRRPKlc0WNRvz2WlDX2Rx?=
 =?us-ascii?Q?d5NKi+u3tb8vbMoZJKPGGdNzEKKm7WIO7S88CZzWTyUwH2wMw/BphPjD0V2g?=
 =?us-ascii?Q?oFm7ibWSqAJMNvAHuedMQ4tK8InTOXxc2m8XCGPZjAMiBbxVVIwmKHfh8KXD?=
 =?us-ascii?Q?M3p18+QEwH/dUg1oxQiVrP8gywHVTlEF9DXr+KZrrlckOIzmXiZiB1zrrROd?=
 =?us-ascii?Q?ZQ6rmKp0LviREt1Xj52lo2tO4fA+mXRKiqkye0S6oKx+cf5qq2ojd2w2K1o4?=
 =?us-ascii?Q?DznZs/TutcL4w4+83tXWFUrtxYXhnoqZnjkY5F+osd/sOTSTI+C6RquP3xgb?=
 =?us-ascii?Q?nVORvFI5cmWuNwPXepxY4I8P1TmA49ZSOczMOgLvFf5v1SWXk+HWzxP5yj49?=
 =?us-ascii?Q?JmlRMYkXR8uHyDkeieKTyIhF84HdzNSHkT4TcxbUXTiCvIK0obSlYo4M8qFW?=
 =?us-ascii?Q?3STGHAlVx0s2NZ4vCD/mxX5PfOJuQNNDcZfB49u2vaJGMk5pkcfo/OLaAJbP?=
 =?us-ascii?Q?KHRaL1qo2pyRBOs5Tyox06AcwVqQsRCJMHYgelN1F7Ys+IHx96w2gutqp+Pd?=
 =?us-ascii?Q?aR53OWlJHWxDmkSwtRl4lUKPqp4xRDdCie3sRB0LVQ2xuHn4FtZZXRpBvLxi?=
 =?us-ascii?Q?sSEHmd4STssBz8XS4oy16R+0KAvMLqvB6tqSOx5ODXYXNe9KZw8FsqE+t0Qj?=
 =?us-ascii?Q?u2btt3B2x1+Doc2pTShgnNx0FXzxS3eVrEfddrGOYP8TXf8VEBqGSexRCvMx?=
 =?us-ascii?Q?2kFiDNi1IflwFOB9m3NIjMzhM+dKrF+M9yyvWO4I+hb9T4w8SFs4NLFrqNgA?=
 =?us-ascii?Q?Da9cG1dMcrhCEuAk7qjMNcEyzzPp7K+3q6fAtQl7dWuKqovYyNr6HXD6mmbi?=
 =?us-ascii?Q?XOV1ya3CkapdFt6ww2tHZilHjSI1Q2xgbJjSBEjm1AIEtud+nsI+OEXehqZ3?=
 =?us-ascii?Q?sn75JrzRF4YYDl8KWDC8YwwRURmTSp5ZPyeu9z6y4N0dF0zO1GOaGqEGPqgr?=
 =?us-ascii?Q?IXRP07ACTu6VsY3CL9Ww/Il7sSmVUb1oJi/d3LvXwsi4S8RT+GzYnXkwPlBK?=
 =?us-ascii?Q?vgsVgZLRBzgLBDxygpBPU8pWQIZcePud75zKhyzp1RPq0tVvcLC8qeNcadUX?=
 =?us-ascii?Q?KROdrkkNUoQjaSOMZ3muPbWXD2YgbOVqfVG02RQUw+wH1437QpmFzGFFXp4P?=
 =?us-ascii?Q?5rV01tXg+3YGu/NfHfljkZ2YetPVJVh60E/phFuLqdgeMWDeom2RCYrvt5Cy?=
 =?us-ascii?Q?Mk3xKSfNUS0tbQ333LGKGXJCxlFfSlhdpVWfquRsXbztcZY2owgyGf1xshAg?=
 =?us-ascii?Q?yt1QDHl6sOuvTNc4K0i89jdJ16B/+I7SkSOj2ytHkwaRPsDMFx8tHZMtPhHA?=
 =?us-ascii?Q?ZFp7b6E7C3PPTuvvGBWCDb3sQC1R9XYOiUHvatbUjvnMEGyrqvBwZgDv0WoH?=
 =?us-ascii?Q?TRIqZSebDq3QhFzZHnn7JNsOLQkREtOffvz0wLRPlRpylRE7g+P7Qdu1C0AJ?=
 =?us-ascii?Q?YDnl82rPCVnm5tqDeGTAqkZAupezdKg3VRqvvwux4hYsydlCxO4OpPHuGxNu?=
 =?us-ascii?Q?birfyaQLaaIEAC9lm47c/hAuVo3FXV08MeZZd/nAsRiNtDHvokIqsm6is3fk?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2212d065-1fb9-48b7-a2cf-08dc79a91042
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:17:01.1223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98BZpnksHHStCCp4kIbvpFdwOfKUbqlrgEDcE4cL/gATa/gPirW2CPVaOYUmRDdvA4Mk9B5oskokEbwonVnOxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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

Suspended time is in miliseconds printed from u64 variable in kernel.
Convert to a more appropriate variable type.

v2: - Use PRInt macros instead of %ld (Kamil)
    - Explicit time units (Kamil)
    - s/suspend/suspended in the debug msg

Cc: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c            | 11 ++++++-----
 lib/igt_pm.h            |  2 +-
 tests/intel/kms_pm_dc.c |  9 +++++----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index c6c0a592b..8aa3d920d 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1390,18 +1390,19 @@ bool i915_is_slpc_enabled(int drm_fd)
  * igt_pm_get_runtime_suspended_time:
  * @pci_dev: PCI device struct
  *
- * Return: The total time that the device has been suspended.
+ * Return: The total time in miliseconds that the device has been suspended.
  */
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
-	int time, time_fd;
+	int time_fd;
+	uint64_t time;
 
 	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
 	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
-		igt_assert(sscanf(time_str, "%d", &time) > 0);
+		igt_assert(sscanf(time_str, "%ld", &time) > 0);
 
-		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+		igt_debug("runtime suspended time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
 			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
 
 		return time;
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 15e301533..6b428f53e 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -93,7 +93,7 @@ void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 176f7a04b..7766d34d7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -488,10 +488,10 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static int read_runtime_suspended_time(int drm_fd)
+static uint64_t read_runtime_suspended_time(int drm_fd)
 {
 	struct pci_device *i915;
-	int ret;
+	uint64_t ret;
 
 	i915 = igt_device_get_pci_device(drm_fd);
 	ret = igt_pm_get_runtime_suspended_time(i915);
@@ -500,7 +500,7 @@ static int read_runtime_suspended_time(int drm_fd)
 	return ret;
 }
 
-static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rpm, int msecs)
+static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, uint64_t prev_rpm, int msecs)
 {
 	/*
 	 * Runtime suspended residency should increment once DC9 is achieved;
@@ -522,7 +522,8 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
 
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
-	int prev_dc = 0, prev_rpm, sysfs_fd;
+	uint64_t prev_rpm;
+	int prev_dc = 0, sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
-- 
2.44.0

