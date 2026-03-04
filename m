Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68936EF8FF4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 15:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C8A10EA30;
	Wed,  4 Mar 2026 15:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fhjo2Aiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B28410EA30
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772637637; x=1804173637;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bqchU6CGhTOzkZKM/hWdaWMvwHS6L53K4/WCBPkYeYY=;
 b=Fhjo2Aiwewj1wq9ND1Z9+zCc+qia68mSt79kouUEG2kzY6NdaMRvFx9l
 4qonByWr1iwHbIET5jGDNlLHyVVQZ/MUdpqw096iZqmBSapw5AiBAoNlC
 rZf3naOrO8FmBLaxdNedSfinyNuAGqO+NBbElC8xXGBRrtKCReg+7MbC+
 aLHnXbuCXPSQW8uwKGwpHpHMBcXDiLRNxQcNTx2RBRglpvhZnwjVttiK4
 7GuLTcpFqpmofXRFGNSiJccOpn9bWG0VYGO3LyGOw1XBsLNNjLGla1/ZH
 NQGmKxLhCAuR0fBPtzjGV8NudHauFBZ32NQg0Pda34tE8PrvWw3y8weba w==;
X-CSE-ConnectionGUID: KUACMUqLR46Ktjwk1yBH/A==
X-CSE-MsgGUID: KJhtwzYUT7SM14FyYOxbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72896714"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72896714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 07:20:36 -0800
X-CSE-ConnectionGUID: /bPLuFArREuYFK3ep8WKQA==
X-CSE-MsgGUID: veRrF3/4QZmmqZ0PzgTJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218316634"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 07:20:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 07:20:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 07:20:36 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 07:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrVKUqjPZ2Czaq8TjmVRvo3UrD46W2YCwV6nDfFzslIoBjnIt3qaNj9wbf/B31rLrCCUi0IcXkx+gVZTcAaJp9npjXKvq4Um3TGkt/LnqwtQZ3ZWNkzcCL329BxrNee+BQ9PUOkDsiqKFoNqK2HSqiR7ySUY7RK3kiiwb8nH4+jMZndjjcAM6oxhDBWYZ6DSeT9UAhpRWpEXzfp2lJ7/vbt0oN/NGCOZQLbfZ1RDfC/3VdSTKuuFC5o3VieaWzsm14edtyFwGmknl58PExsKunzsbupKbrW6AJabEbyZ3Cterij+JfWd6/icfxFELG1423a07zxugPCflS16XRshdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vttemc8BBz6HW0hZjsRD1jaKUjUzSO6BY8xBbEDIWE=;
 b=eP+Muv4zojIeKp3NItFw6ly3+Lj21+A+HI6yjnzxxxOWpUItpaOSt9rzl+H5Vs1LYlBJDwI2ZyoBdOZABasLUMSHubDWm45YElqVhjmFqfI14E4YjmCBURh2VMc0ZYpwaGpRfiti95VtPvzJtUDLWtjxZIP188H6mpEZmKdhzq/BMjD+LthnLUmbGvP8ZOY9i2CIYM9hK4A4ufcJbpcSdM54zKQI15t1blEbbv/EETNQREMVjhO0juhICN9zdUR5ZBgUkAGMnuR/+t6SrFhzvY2/3TtCjCnNn6QwMnvFi9xWclID3bG3YikvQSWCSzxq52jZEgvwFwf/FRfgCVeMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:20:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Wed, 4 Mar 2026
 15:20:28 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3] tools/intel_gpu_top: explicitly reject Xe devices
 and update documentation
Date: Wed, 4 Mar 2026 16:20:53 +0100
Message-ID: <944742bd9f27945878791856a8a641ffe5e54d0c.1772637555.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL4PR11MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: a10e763d-0d8c-4011-a1f1-08de7a01913a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: rg6nVLIEtU7uqkJSunW8dJkT6udpsfRner0d3EL7NogUo0M+2BKiwNrtcnn5z3qIHgzrI6+jL3ppFic9JTt9+Nzs1CvvjsV2uSic2Cpb2Y9Iz7eJFnxjVV0hcwae3qjAVmAmh6pum/4yAnb3RckQz1ZmTkay+PGwtPHLAdmTPcZwPm+L5GtlBTIv6a4OVJwfcGOfqgDD/H246T6ax24cVb9tE1z45MPF2EoH/yUZ1r/2IvFJgpM5cKCY918qk+QVRu9vnkbkosbsJLLO4peAMn7a61v5xPedoa5X3N5gG7G2EKV/JZJL+stTHVL7DOUPQZNcNK2xmh1u1ki17Q2liL7/2N9mXXBk18n9CTU2BSx8/Yi4M1SD/p6l5+LsI37oVneLydK8CwJImyQrIIAM72j76njXtivXabrX9xuTbCc5GCeyAvFVwUTVtNWEAXb7qZ48L0H2zw9DfajYUFXqZ2+EOUseN96HxM0mqaGHeSdbSXHzV6P24rkdI27d5rfW2MRlVd+0mekwMGAv1I/0YNZaa7zFMgLuut5qSRBe8yfBTIgq6mi7D7frjNrCGb4IIdO2DvBxcaxRsX03Ilzh1zNG0mWzYVDAVlS01g4G6WQ6RkLh1UOAI1o41bkGjmKgfJc5HFBYoEnYO062swHCjYz8IHKviWfKE05rKibM3PVwaxyzi71C2we6mYpiT6O71/mq2fNipj8lDMR5xySUb2171JJqCWFz56KqZM2VxzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d0TIhg60k1R03f3tMhR8rbZpHZOfUA6gY9YwNdHWDTX3YowT9R9ZjdUdX2pC?=
 =?us-ascii?Q?BpbB3C2fPygT/EeyeFLWzypnDak1HCFfOpK8GS19jmIN69YbYTbZRLHWZbrl?=
 =?us-ascii?Q?U5hqoPVlVJ92vuN26lqRE9GDfVfEUvSjBL7NLzqvKwS+GR0mOc9RgLg9BzIx?=
 =?us-ascii?Q?/gO7ompk7pFhq9V5CQjgWqfrVevqe6OB4TgaWeqHxZac7z6efIaje5XEgrVZ?=
 =?us-ascii?Q?6W4Ez1avBCPZbI8gvnoZCnnKjKuc9RKY9Tr16sGMv2UVN8bmrFR9kgY8zuMG?=
 =?us-ascii?Q?0MWIln4p5219XPTOOpjMDu/eUbWiKDEFfAsoYVWUZ7epzq8zeCb4cYD+1VBb?=
 =?us-ascii?Q?uIaI9CJFX2g+E6MiDU0A9hknNAUNor3+8JV/kt+IpgUylsAf82zh74mGujVW?=
 =?us-ascii?Q?bJF+L1/kLVUmoZva1OVGOhmDOGESM4TipBULUzRGXfBvqhhmrMw0O+Dg3ZMD?=
 =?us-ascii?Q?JF5QF9NE8dNbvjhaofvzWuinvcfAnbwICz9lmBHTy9jsWhQ6ZwTEu7vLWRJP?=
 =?us-ascii?Q?fsUyKgLvLu63OkuCKkw5wbyWWs7/I3lJpmR3F/qscJ6EGGP6hcUdM35qf/54?=
 =?us-ascii?Q?6jHFaCsDkLC+Kzt/amsgUDnXurpOxqv/ccMJ+uRgSnOrZ5y00c1RpQnxS5gE?=
 =?us-ascii?Q?6KQUa3vaoA535YhFk/dM6Fc2Xtcr9X0w1MZA34E+8O+xTPATtlPyxSV7a/2H?=
 =?us-ascii?Q?NrHvOKOT8TIq1d1mUj2pPX18VAo2YQVOdHvLvxYVva6+Sx/N35jmKEDsqhe6?=
 =?us-ascii?Q?HrPZQRiiuk6g9T+XqaN1G8bhOuVyIHlEEGE0QvLpL9OAYaWeMYFDoWtAoA4l?=
 =?us-ascii?Q?zGcECkLs3dlizmoyVklEP6zXBDb3udjCdv+VycJbvap/rSd8sobO+HpclUQL?=
 =?us-ascii?Q?fxlZPknv1Wyp8W3fA3hPS/cig7o2cFD2TdFo1UgpQQPZNcCBOZg5XT3khlus?=
 =?us-ascii?Q?uncsMpHyn198SM8Hc0wGrvYuvDLmGoASs+bygpq5hm1VPVqJHehCu87Lod4Y?=
 =?us-ascii?Q?qPHt1jhYB2Vu/BMmApRnzyvQJMeORQoe0leRYpr+AL9ukjPzxdGfcUC+lpuZ?=
 =?us-ascii?Q?VQOhCDAO47jxip+aInzMCSz1DcAnScFOfVHEiGT/23DNBotd1be6ge008ejD?=
 =?us-ascii?Q?nWgUy+YYk+2mxjD4NfRJrx0r8seg/Ibn7oLRJKqNAHofC9iKrrPB/dgjV6ev?=
 =?us-ascii?Q?a6H+ZEumV3SXVpWXDX3U436z1+l1c7yrbDUD24v5qhV7nnn/sTh1fABuikvR?=
 =?us-ascii?Q?5b4pSikCvJ4LymM0Ubxr3QFlgJNW4cLGUTxOM9mmp5GcW6KrCmziy50aVctU?=
 =?us-ascii?Q?ko05JTUrHAkcrB0jZ10WDVkPpOxmOJ3vQRn9UWUS3c/3+nspyD+oroEItUZl?=
 =?us-ascii?Q?WNUAtWgtQi7e9ZLxpYKagsXYvaYxHrCdHHeHzrq2/4JfHBiataqtAzZZKiUf?=
 =?us-ascii?Q?UFjZS1wl8wqslJPzxS0yE9y0egsZKI1dms2B0hRph6Adsovl5bt25Q4HII+j?=
 =?us-ascii?Q?rMmCH9PX33fG13T8veWv4sy0T0UgZGw9OXXgpVwxQ4W0sVupEyT/XZZrBWPM?=
 =?us-ascii?Q?+lf+DDCajeONgmEUY+2Oe4X5ivI/mWHQsm83CLh/BA1o8m4BZbIgj2gOCMm2?=
 =?us-ascii?Q?xrBL6YD0iBg/xhCsy9Xv6ZQ7Jb8kFJsv0jNM/NTIJFqWzhAGv249GjxApA/8?=
 =?us-ascii?Q?pNJZQsqItfiwKfMPhaesC+pcUQFRusQb0xHgjV0JO85qpgQb6lGtWg3MxQ4A?=
 =?us-ascii?Q?HqTpwtP5ANuV3LA7QXaCSLsmR/QBkuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10e763d-0d8c-4011-a1f1-08de7a01913a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:20:28.5205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR4rIhV6ikTY26ZV/VmkyvYYzgO86GnCSPUj0r7HZbpMuT+J/a8uudxiBcQNQnjG0iXe1Hm5uN1/89xWKAHtu6QWb20qb6A2rVXeXgX1hIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
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

Add checks to detect Xe driver devices and report that they are not
supported by intel_gpu_top, directing users to the gputop tool instead.
The man page is updated accordingly, and the tool now prints clear error
messages when Xe hardware is detected.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v2 -> v3:
	- Reword the message.
v1 -> v2:
	- Reword the manpage message,
	- Reorder the messages about the unsupported Xe driver.
---
 man/intel_gpu_top.rst |  2 ++
 tools/intel_gpu_top.c | 18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 20204fdcf..25196d7e5 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
 LIMITATIONS
 ===========
 
+* Xe driver devices are not supported, please use the **gputop** tool instead.
+
 * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
 
 * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index ee38829e1..bd4191613 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2734,8 +2734,17 @@ int main(int argc, char **argv)
 		ret = igt_device_find_first_i915_discrete_card(&card);
 		if (!ret)
 			ret = igt_device_find_integrated_card(&card);
-		if (!ret)
+		if (!ret) {
+			struct igt_device_card xe_card;
+
 			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
+
+			if (igt_device_find_first_xe_discrete_card(&xe_card) ||
+			    igt_device_find_xe_integrated_card(&xe_card)) {
+				fprintf(stderr, "Detected Xe device which is not supported by intel_gpu_top.\n");
+				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+			}
+		}
 	}
 
 	if (!ret) {
@@ -2743,6 +2752,13 @@ int main(int argc, char **argv)
 		goto exit;
 	}
 
+	if (!strcmp(card.driver, "xe")) {
+		fprintf(stderr, "Xe devices are not supported by intel_gpu_top.\n");
+		fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+		ret = EXIT_FAILURE;
+		goto exit;
+	}
+
 	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
 		pmu_device = tr_pmu_name(&card);
 	else
-- 
2.52.0

