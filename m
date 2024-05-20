Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD6C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 18:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B9810E384;
	Mon, 20 May 2024 18:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOgwAATm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345110E63C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716230143; x=1747766143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hiXo96o+GuGor7PsV0xHqRP8GNKv4hSPeaKcaj7wWj8=;
 b=UOgwAATmEgHgCsBpfNkf6n2EYFjvR/sFHtHrZCMi1eQKhs7zT2DHUKpI
 pJFSWDz7m7vMFIFIx8Uf+l4PWwxilvLaue40Jm2dl0eBBDeKGjdzhNUqf
 pP9LPcs7zXFzymVI/TSqwdfIKs5hPwJ6xwFKCFpwOROGvSXnxDyk0HXEL
 JxsKl0CBHNoN5ZWlUJ1WraraxPvzK0iPuu4Ax89Jq/Z4MRWPUFC4MVkWC
 iXVRjxUinGAv6TZR12BI0ztrVOqkfieHQEB2DesqSqhtzvkw/5/oYODbf
 SqWQbUq/mNZC7vOIrmWZevPuOpXSS+dSQoaAxHjjX742pdGRYZIzlXMOu Q==;
X-CSE-ConnectionGUID: ulKRB2PNSUSVTqAuyf/k1Q==
X-CSE-MsgGUID: oy8UERC2RiGPG/DIogc84A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23791023"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="23791023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 11:35:43 -0700
X-CSE-ConnectionGUID: ynFI/hxPSQmiaq1s+mzQSw==
X-CSE-MsgGUID: CxTDT4YkRWKlB+O90rjWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32499244"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 11:35:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 11:35:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhM+im/UQuyR2otGtxqYg7TD8Wv2XCnWFPFlTsh2eWtuifyzJkT2Pp7l14bosmvtBfXPDlw2J1FxYHQzCaKXmtFaEV+euo0FRDzt/Xxt2yr6aESUk8AkEyYv9L9cy3g2ybePpQs0p+rE11TkoxD8GvoW17l/B+SK8za95s/7ygkymBTsUXcdIG3psYQgC0Cc+oo4FXRvjrWBkAHsdfvWjugavr0/nh5mpCeLZ9qlKOQNveul1lCf2cCPUaKtHc/AeNiTpiQ6A92dyBL+Ey1/fLc3Y0CxXAwuo1vxgrqXyJa7d/RHVuNCZTfdzQaN/75anEqwqnDmNMoVtGKNyMaU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEdkJrhBbequTHT0yXIBV888/bniEL+vw42JeWnuICM=;
 b=X1elqza2Gme3AY5TeNhCro6qbkVdS0K380/knV5BdUU1KrntHrwFzM8yRP79Z2rzE6ldtE0RryrvjCS8K721NxM+LyQkL2/fyxOzJ4KmSAxVGgM406VDuG7Iuwn1YeGSFGwN6YjsysGsDrOh/oy0OBWTRA5ufVmfCR3brlWXz1BQpGOFzoskoDyh7gsOfiyFJN/sFZZ+7hPpuEfeNXm5yPmfuSmr3FowkEBcpp7uNZR2fmy0aRyjR8SUbaI2bCcl0b+J7ypor5ITF5/2RAGNaUTn52CExwUb68sv9GkmGY/WklPHbYEmvOZAcAH5QshwtPk0KngHe2JoysJZ430IYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Mon, 20 May
 2024 18:35:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 18:35:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Mon, 20 May 2024 14:35:18 -0400
Message-ID: <20240520183519.227167-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520183519.227167-1-rodrigo.vivi@intel.com>
References: <20240520183519.227167-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: b054b57a-14a6-4b11-b7c9-08dc78fba21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PQA71KWXCkZuzk2lRroyI66+5jZEewfED3siIh3DGRRBMVuq4gcl7ucML4vK?=
 =?us-ascii?Q?qLvoEkLyChIE9UMMg7Bs1yeGYX7Nnl/AACj6CzlepnDHXyHlONtnc7XsRUh2?=
 =?us-ascii?Q?4yOn/jKMOBgxWd+4w3AS8bzaYgdoKu1vj35IpZpAmD6j6/n+zt3CcglBV+z3?=
 =?us-ascii?Q?r1XE7OcG0hAxV2MPC1GHgPvj++0s9A8r7W1SgrfM9ysxAXgCM/2u84n3pYBg?=
 =?us-ascii?Q?OqrkXWbZuoRlFi2sndDC9X/6Eim5LnMffLhV2GoiSW7772nL/LjnDkcmtuCF?=
 =?us-ascii?Q?pDY3vZ7IK/UZ0TmZX9lSLhMgj5oNV2Tt96kNoVh03VBdus+f104VaOLb6rMk?=
 =?us-ascii?Q?5pI0YosRxUPcUTyUmNNCA0SQDk7YyZ7oTAaSENkZYEqUPSVZ4ndjayqpCJo/?=
 =?us-ascii?Q?mioty0OodXHeYLx+CMkRB4mGJ9lJ+QlCnzgnSr6HQSlgA5zShwRfa6u+WGGO?=
 =?us-ascii?Q?qsDfAOuW9gCmsqXmyWekpPfaULASpMyDkV+waQ3nVxEwwyL0V/HuvBFyw6IX?=
 =?us-ascii?Q?XYs8D/rntfKEYSdt+3L1F8VmIhqa+nCY55wJJaiT22HDZJPf5yv+yobE4pkt?=
 =?us-ascii?Q?lIOYjkvz6j3ftTcJnadcl/Prr/8G7k5hEg7gaJ+OVtSt8PM45QXsVonAfMBm?=
 =?us-ascii?Q?Nf+kd7dPyFrGzTSXjwMNeJ/YmQPJqTukAwvvdah2+DVJD4zb+pVmHCRja5wv?=
 =?us-ascii?Q?D7zQxVwiXxBXtz2JVtz4XWSttqla+dtvLY2aauqCk4Woq0nA0tXGuewFj/TT?=
 =?us-ascii?Q?jR2kOD7c9iJng5Y32vUoCJG1BW+d6VAuwkc/vvTG/3FLOnEGar/QtpvhlQW6?=
 =?us-ascii?Q?Z7hmEsJQTNi9WNwMqDoHSAmyT8NXckrZ8SSzK7B1jU/yM5Xm4gstldWDoOwu?=
 =?us-ascii?Q?mxiIJHrwMSShY95XSnYq4jyC8HNF/Dc+iD9jLIxW+d1QfZnzUGMDmGlIN0FG?=
 =?us-ascii?Q?FOlImm7khyzM8D9j+rbuNOxIAzGCsgnKpHfk2AOeaUa0ZpvSdieh/7SVfIQs?=
 =?us-ascii?Q?N05hXpGKhyA26lc1WIv2JF7V5kAZ3v2TO7jsCebV3RqNBna5lNoX5IfOpmqT?=
 =?us-ascii?Q?iAZR3j9EWv1r+4AEFlUIIEsIcbLn7dAGx1wicQp/6TdpNsJzqvFmJ1Ahz11D?=
 =?us-ascii?Q?xq/2Yqv/5FyLLn2xwJcSqLAil91fKiw3WHqcoA1XUOeUQdRzfMNyMivKdvHP?=
 =?us-ascii?Q?5L3d7VRO3xh78nltAvt8hqunJlx/uw1y+C1VDAsuLKAPdMYdxrilj6/vA1od?=
 =?us-ascii?Q?9f9HiMtKDUWELFwzl39yvprqeHSgmpbzs+ee2q19Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7lRsN/USvh6OopGEPeYFd9s2PKHZ0HQRNliZ5W0JAix450V4eNxg4H7Vbw/b?=
 =?us-ascii?Q?BmQhYw24vJyQHWl9liWV6thUF4z63DrbUrEN/TtKfb4hqR03Qyukxg98aC2d?=
 =?us-ascii?Q?bmQa87viQYzpe5knKPwPLjPmz/eYze7lJDdg3u7nfl1Xz/wAO4Not+YBuxKb?=
 =?us-ascii?Q?onfj4TkQex/iHAUC4LNs8kHduYeiCjtIIOMotpwdzksHhN3QIj3fnMuakTn0?=
 =?us-ascii?Q?o6LgC1JcF73xwD/ks3mBTmoGI1i2e9/dh2tckeiChoVHVSI7dnyjIo5TbM1p?=
 =?us-ascii?Q?upVU15TgaJCvVx3YCpQIZrors6QLEPsLy2vo5i8APFQGu4VESkFQqT1Tn/2D?=
 =?us-ascii?Q?wvxyqO/DQnSO8mzvNh/HjelMAvVR1rNcivxn2PQTGYVqUG6lMFpu/xt79LLp?=
 =?us-ascii?Q?66zVX06FLWhuW4UTlMwQlsluZ8e99l64PP8bK6zfk2pJFqlboH1AWY1VcYtj?=
 =?us-ascii?Q?CBNjtypK6Nx7VxoF4xLs1TJiwFeXGvIrPLDtAlsLXCmhggzSulN6t6+5fFkK?=
 =?us-ascii?Q?f3C1/YARhal3J20ESHKvKy1wpcc+hfO/8XxxZWB88gRZ08/HOYa5fq4NxR5I?=
 =?us-ascii?Q?AwXIpIBfHwDPry1qtRYSK/Ot0N0uSNp6q9+vzyBFq/fzbh+T/wrIOHtrHweB?=
 =?us-ascii?Q?S77VTmP4Y/IScEo5Teo+Bzd7qV0ieBcFJeDy1xZDZOK7d80sS4usjQ/AVyEi?=
 =?us-ascii?Q?ci1iZrm7h/BBtVe9mL/s9d55LLt2sRxJmFu6qByn5OJiWye5H7DZzvS9ph6T?=
 =?us-ascii?Q?r7/mEo4OZVJpy+VCKLEjygwTHBIafkXisFe55fIAbzgrAskH8pvgwsmB/xMN?=
 =?us-ascii?Q?7bo+klAul5gqHUhxDBD7CMFykPMrbDO0KpPPCdLi3GefQvIRoq7xze7KnXP5?=
 =?us-ascii?Q?Uu886nap2B7GpEyGykDv7hdvkMXjEowk+rJxzrkHF8NgdN7r8C1jeoWY8Of6?=
 =?us-ascii?Q?2IZAS3eVuDMSEjcmFwpMKA+R6EyQCBiLt7j0ErV730JrAmwUEJ0xqEzOaHze?=
 =?us-ascii?Q?+/Ed8+FKS7wV0SRT0JXATUVrV4+sp/LWZz9f4BXvki8mbPnCxSAHgLIrS7Km?=
 =?us-ascii?Q?7jBPWuoTdYK+YNtUgF8dw/E5aYfXJ+D7rK1lII7RFeU5BqopkelJO6kmQZFc?=
 =?us-ascii?Q?xRM1TdRdfN0iV0+qKGJXt2oMd0j5uNZ0ZaBG6g0zFA9ldcGd/mPbafzObFlY?=
 =?us-ascii?Q?TEvvH+U846XWGTzPXkXPXxqpj5hyleka97WKNKwtaIyamtZHMSQDjQurcWWX?=
 =?us-ascii?Q?AgsIlMdjpvD9/jS+hevz6AcsZj5gJSulfHX/BHNjh1hIkL5cXTchGlJe7xvE?=
 =?us-ascii?Q?A6rVdsUH2YxSdirS57psfSRcJ08VlXcFfnWGtjchI1VtIMjc9YFTMpE0l/4O?=
 =?us-ascii?Q?JbLwDyQ//dH3XLmLXZ9/p1eABOMfWunqGfOkVQxx/i80yY4k/AZerpZ42c3W?=
 =?us-ascii?Q?7OPq3r+qO+M2VH3ToF7qBtaMeEkBA0VXdZ0MVgk/otKMFbOR+kVTIMbwHfQH?=
 =?us-ascii?Q?FLiL7kyhtZNh/yumg5VBfCGj5eiTgYfhTH0fyDqD0IsJDB/fDjBDNHiEPOC1?=
 =?us-ascii?Q?dp4gA4k36glnWZgttG4vqiefCkd1pvYYx17v8xid?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b054b57a-14a6-4b11-b7c9-08dc78fba21c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:35:33.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlciEkz6PdGs4mbYUjgProqrHfm4aWOr+fJgnkA3Kl/Q+drf4zsS1mYEjoxp8WD6dQL9atNIPOY8ddCyxLfolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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
index 7e1cf2dcc..ced983d6c 100644
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

