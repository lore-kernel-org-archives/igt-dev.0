Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51291C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908DC10E67D;
	Mon, 20 May 2024 19:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEB1a7SU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9830D10E89D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231853; x=1747767853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V2Im0lnc65t0cdOxV4U7zq4tBC6eztfEAE6LmtLyWw0=;
 b=CEB1a7SUmPsgr/mJLSTnxRORfXrBudX0PW6grh6zN3yh+tU4MKZNffnw
 tXsUkmh1aoXq07wTdd+hVdrDPXFhxEKbL37bpH3xKEPkulPnwG/En0sNd
 KyFHDD1wK+1ItzETs5+SJU1eZAbsj66BHD39lcyoqyOvW8ZXBOVaAMdFY
 v5JoekKaFM2n0bSRuxBMvOV1Ss2twLC6khX9HUxE2RIZVAh03/U2DcKtu
 6pbwHUqXZqnxHP2iSd9AB9zZp4CaSLfO0AUlOO4HITTideJ+wUAy4bo8u
 gHR40B9XQAMk12N7IsW8/gCn73Rd/k6rEi2IjQiTuKSmNKuORaHRimAnq A==;
X-CSE-ConnectionGUID: CYWn2HWhRkiqqdAedDwVpw==
X-CSE-MsgGUID: 0mnIIEytRHqX+3vrleWWKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16219263"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="16219263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:04:13 -0700
X-CSE-ConnectionGUID: 86AZvdU3QSGu+xuqj11fZg==
X-CSE-MsgGUID: OBfUgO+4Q0qQoJag3Deucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37216226"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:04:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:04:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1HVhHMt2BCZmqIwiyYB/S2nkxQF4VIrIgyrHrwfDfmKF21SUPM5II4EIrWjCC9kdlNAdXi/ULh5IRn1lvjbTVzv7G+X2tHpLYkgFWDlptv3ZDW2D1vaFz8x8Q/vCD1Hs9AYYyhisZIGC+QjY/WYwGS2Pyb7WaYgocx++UvNxyjrqEjoxpbIL7V6zVvhRf6mIifGMJ9/wNEiYhsbE2MfZ4fImpAQjTGXsNi3gJ6cTY1sSSi8T6d5bfN/V2b4H+xRFDVh8qYArGurjbQyefSBQe+Uo4Ew/aXoGl+0Ulkw7qANRC/2e62/JmKjGS43rSMly/b3S7A6bssvNfCz6s2xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUsiTf3v7cVrFwcVm5SsGgPcObOP42l52V1cx6On+vg=;
 b=cBKvko54bWGQM8lVi3k4R1VME4CnBkRfBwAuzstkCIeVn+K96xe9bh74Kl4PYnRxWJEoLC35OlYzj2rOz0Rs1rvWQDqinXrrVp6qcdc9xNXh7hyJd1O73PCGW+kl6XKbzh8QrD3j59RIZtTlAng+yQ122V7Bae8H9j6ZhVO6HmGshlSFUhAFPiH6NF9ykzsKhcTyZcMUs5s6os5tSaJJOh+sdJKB9GPAbClSKYRLv9m4wYGaRr8ctdXjAgxRylv3YX3SicCm0cTOITRNzUZwz6f6qBTBh2wJev9uDPIeX/5RyfdPluCs8gMreuG42y7vphEentcxzijc5gQ2Exun+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:04:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:04:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Mon, 20 May 2024 15:03:45 -0400
Message-ID: <20240520190347.242249-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: e6477d8f-a662-453b-7297-08dc78ff9b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LFfocQUQUn0ZdQcPYsG+Fu5NjM/1Hr5ZYTQ7Hi/APZaXsuG9tQ7N108hsChm?=
 =?us-ascii?Q?+7Q8/9xS3ol0a8UaNW/gTtO3ibwc6XXUKuFU/QkKQg//8RgsijSFSPTXmf0Y?=
 =?us-ascii?Q?SYCo9ivPIj4bxP5NcYZbNTocowEfVX6eG/aPrZYf1W0YO1YUq7DJHOyyeIq7?=
 =?us-ascii?Q?DNsohM9cyS6lyWKnNLxK+DnYe5o/gFUARuM4xeOYjAdaESYIUJKYFBOzudb9?=
 =?us-ascii?Q?diMF1aXckxngm3rc5b/AX/hd9AbYdJGQHWWYNaNXi9cNCL++LBnC1cf+44kO?=
 =?us-ascii?Q?KNbPsBGwcO3cgFEl4Z68le9dsgnn09B5uLSEIZvMAmGrFsCmKeaS7A0/iTZb?=
 =?us-ascii?Q?1raxMGegjNw3j/c+p70oFJ2f7Royc8LaE0EcKArEiB43sXrauEmwuy2w+X88?=
 =?us-ascii?Q?zJN4eumf/CWYTx+5WWABR1dJ6Ks3p3VQtAf5WYeoQoeghxg8L6a4JqpoD6mu?=
 =?us-ascii?Q?iv3FZxy7Xz3/NvxqD5HFq7+USCZmEGfJxCJ3sYchiqpg4GYHInOJa0NIpx1t?=
 =?us-ascii?Q?BxAlazQMDNjQZxsZxJgTSDbeUqNdSmHCm3CdSCQfOnla7hngD5WLMsJWvAIV?=
 =?us-ascii?Q?siFI+OrqH8MFA3KIwBBvgMqtgjSKZ5vtIVJnut8upaZkYEBVcQiDlSYIVCek?=
 =?us-ascii?Q?0nYwtB7keTNl3ip2P3Qk0F14u6kke2RJi16sM5sFWkghqB23S32v1d/V30ab?=
 =?us-ascii?Q?hCRepOwVQuGCugSlCOI58oSc98YZC86hPQrv9aT1enIljfnuoyJRCp28NsBm?=
 =?us-ascii?Q?UolvZbFO34FAwVYxN+1SiwvkJhAoaMhbedn8poQKgjs38TA27EPAsAhX0gnf?=
 =?us-ascii?Q?sXC+OHtjWgmKibm2dC9NsmdIQDKCIt/JwPqtIjDpBwe/GxFaJE+9oLcr/Vmt?=
 =?us-ascii?Q?Z4A8DNCQs6DUcrJWPrIhLsi3j+JgCyRVristOs3St0wr0M0FXjEyBmVPauK1?=
 =?us-ascii?Q?eWwtiVMeb7AY1NDcvp8sHaIXPtl/IoKcxg/IqP3W3rCkHo5Txp4EAU6DKsE7?=
 =?us-ascii?Q?PW3j2hDRJusJIYTXm1O/Gdd3/v0gH0RG6tXsrRXc1TMvx0myYyLHakpdSxDe?=
 =?us-ascii?Q?xDjMGXWh2JHqmKsL3bXv6uS+gw2CgTET1nn/c/12Q/n0Iu2GFnVqGDcblY9f?=
 =?us-ascii?Q?7IAdDE8wIVJxgSYByxH3rkfyMo46ANiACAMT7Fi4yuu7Lz3Pz2V5yw1eccPx?=
 =?us-ascii?Q?JIMa7a0wg9K2nTxtcl6Zqmesm0WpcmvUUiLmy1oFCpFFd9E7A8MC+Zd4k74n?=
 =?us-ascii?Q?/svSgGE4GgwX848FTGXgfsibOerAe16iuLIxzfoApQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?seLIiAmWY9sYWct4Cx5cyqHFNxi9jWEyip8OzKUzKNJcUl4fhGl/Ta72nw2d?=
 =?us-ascii?Q?LadXZZp/ZwX+2DvTyovIEwcpw7kMBFsn71ogZDOXlkqbWe0kD9xJnHYdkrol?=
 =?us-ascii?Q?s5MV5/jPnH2R/jfo84deBNfYdadaTAaw1NYsj/0HqzT7bDPWl/jPWNKbvJfX?=
 =?us-ascii?Q?KxN5lYC1ChZRGArQN+tQfPRPLrV1VoXRHPld1lnJEGIpalSX5YNySrwCsFtG?=
 =?us-ascii?Q?OQU7ExoNYtG2IRDILFQhaJSmGE4p7trJ6Zn3bRz5pBoZFCxYK9nRZYOBgooc?=
 =?us-ascii?Q?HmxBNzedjCA6F1ud0FgJLE8E5pyBs+8EY3CbOwr5DwWxLreog781elHHaLof?=
 =?us-ascii?Q?WMteHT7zKNCed/Hcz5Jl5cCY+hbMJx66MWnbCXHE2zptKkQL95MnT50P3DLT?=
 =?us-ascii?Q?5+vPGStHGxQ/JF5oD3zoob5R8Mbx77Pq5gfGaKwZviopyzWzyW71so2hwvlZ?=
 =?us-ascii?Q?bZVV88WReTqDCcsecCyTaz0z1WqtFFCogBJckHpZp+NyHV6FOcsPz+g2PkpN?=
 =?us-ascii?Q?X6WJTqTwBsM5dvFw8AHgICe9LFjR4lb4CBS37ZNYQuATxz3CTG/+mt/QMUcw?=
 =?us-ascii?Q?y1MWlLclkZUQNul3ikkRwrrMiH2MBxHEujtWHrprt9u9rq6WeZZMom2bu8V2?=
 =?us-ascii?Q?JF864aKTECraTLIGTc7MhwPCvy4FSBr0HkQ/r1/S2BHoM6lRjG+YhtzYH2yu?=
 =?us-ascii?Q?e9zYo9fzTrL0wJ0MCcSfK0qPUw4g6XC+u1gunKgVf7mWrwH9+7BlVnGd3f7s?=
 =?us-ascii?Q?629zXWjXgLxDMj271Cu1Bm4zr1+nmad1ZhVx2OxeYgPjWhvuVPr/l3F2gwcR?=
 =?us-ascii?Q?AIjwbG2a5aQOx7YfXHbrSI8nVPP4ib6O6rnA6j4phL6P8LjakE1xL7jJ2nfh?=
 =?us-ascii?Q?64eQc5c/Kox4/E0fc668dLT8MlsArJLQql+FXHoj1OsOTf8I5jJfLnHUeSyv?=
 =?us-ascii?Q?laJlgfw+GsMCVDMOQf1bVGfxHLn1PBtGtq7q1KmJ9b5yRq9ZguVSZyXcTeck?=
 =?us-ascii?Q?QH28z1ps/mGaCPyq8bs+PNcCfOGc4b/gVv8ISTwCF7Vn9pLSDHdbJrq5VdR9?=
 =?us-ascii?Q?i7IkxRhfxrH6WTFpzUz/jdWBQBScKPPZuvT+yTnD7Qt5OQqICjgc2M/Pqi02?=
 =?us-ascii?Q?IdM9HSruHowHLaoMOvOTgHGZMNvTtFQV600IGbpDhHkIMwqNeddiVYGm2/gM?=
 =?us-ascii?Q?L4+0gT+YVlEL0jQNzY2y/tzxc5j7d+e/XQvHtjzrNioIIETY5C7Z+K/evANp?=
 =?us-ascii?Q?pr0V502FMmg6wctkf/jYtztQl48guXan5nprAtHfTFC49nTQBW2NCPoqRGkD?=
 =?us-ascii?Q?OBo3odSAUSaJGvy4Cue7tbE9yRrSe7hTzidb/Ns8q+B3+vT+gsRo0o1Zu9YI?=
 =?us-ascii?Q?bZQpagpsq9pLFmteDfzcsEeZrTHLQ/XcbVXhiplHwyKjMizMVQRyv4vgdXTS?=
 =?us-ascii?Q?y0bMuuJWCkzuZ11BRPOqPdnZ3s/1ODbZBWKZSxhCW+gBkqUe6uQ8exkfhBxc?=
 =?us-ascii?Q?b3XLhH+snjqb/zFbJdevemvpj/knorsdg4Mcl0ATO8XjmdpJmHxI7KG2xReQ?=
 =?us-ascii?Q?2Eu8uCP/ngfK/5w5X+WYje/9kVTi5EUPr6ujp8Zrz9Atazo4GlK/MKDLVeCL?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6477d8f-a662-453b-7297-08dc78ff9b6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:04:00.1086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSSvGXV14svRQjXLxSOGWXg7zar1OOjkajf2vvC+jB8GBmdhfzWfF2kfGHK+PtpbmQ6kMiP5/ZjzMG5Fqnlr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
index 68e3dd1ec..683f25969 100644
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
@@ -523,7 +528,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -562,8 +568,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
@@ -573,12 +583,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
 
@@ -794,7 +804,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -813,7 +824,10 @@ igt_main
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

