Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674ACC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B86910F028;
	Wed, 15 Jul 2026 12:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoLgBtvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5FB10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117729; x=1815653729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vMnQBIUeulkEmt0tGX1kCHaqLnMIl+ysgPDNuDo6IMA=;
 b=RoLgBtvNqqRhaOWxavnxGDG4gaMnZLYqKBSw+JSHj91mU2UJBx6MzpjZ
 iaz2jPn4jzRQmh/EGQnouzRuPPQg3H9MC/vIAjlRszR1bhR6YzL/Xz6sA
 1Tib+jC2ertL07Vxlk3q9jmGWYKXS+E0U3NwTrT4x2g6F/7MY3owMLTYK
 hg7Y6ZtRWkXDo/iEdPGICmfx7p9A01lgVVT4VLVwJ1hw14qVuGsS+T4bY
 x38yZZqhoWIptGOpHrjn6VRgahsbGmVHuod6scMVjYwPNVDmIWRp11mp/
 4q7JxtzlIvsnqUYcbgb39N61qUxwMua7Mxya6y1GTvyq47NGJ6zWch57O g==;
X-CSE-ConnectionGUID: 7A/qtIJFQCCFD6sYjCKT0A==
X-CSE-MsgGUID: 3oiUbD3sR3W9JrH5boKLTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88580724"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="88580724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:29 -0700
X-CSE-ConnectionGUID: w0okH7u3QrKGola9r8/WWA==
X-CSE-MsgGUID: 3Zaa7wf7SKyresUsb9fozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="253557567"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5cNyufUoiTI+xmYKFrTZNt0gfPpb/Q13YZJVkK6QXGx0xXiWJYYUW2vodwGb+KY+4JLJO65N2dYt8CvIlCO8MBLHe78bQsNFimhQmF+O+0jlqqLuRQhwJzW+9BaEm7RpXoIfR8d7hhXnlCRg48OdZORLmwX9fSIfqyGP7hnST854bM6FLT5LB5ixa8LGbK50FLNEuz9hnzi40SKwPI9SSDUX0sSAgfurpjMdVsfeZ/vAdP0I6JoEsnlNg4w5ErHFef/G4oGWARI60wQZq7Pup0Ey4rKwQDkeShp6XI+Gtb/Z797cG5hu9dvrqBFu/QkI0OC/KfCz4KsO5AXTKyKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfoAqz3xHKjHo4lrFgumCPgXMs3Rrz0B7ba8CA0f07I=;
 b=Z3U5ZpTmwIzVvKdgAfUlDlvXMRI5KZI1ocdxtqY8ZSd0kA+jn7QK4P1eLHHCxALm1ZGfUkbSSGSMojZML13gsG8yHQuLNe0mfmei6pCFCMdAT9VFUj0xWtwojyRzgg3IuXCY6hnTCaAGpoiG5qPyRzMTPjWvKtXT55mq2M3yVgSXzkCu7s7dZWLAyaBy7g+u0hFLvUOjJyvCyrJu98iYD69lMsUHWk1lbXnbQiyKHTlvE8prUx8PVciohTiIpU8fqFi4Y68TUALR04lK6GHDT5CiCxPageoCvA6vIgApLzNvP1xKTCA4Te8nRmWaUgZjk2X+clgIYQiX2TKWrEvDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:25 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:25 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 14/31] tools/intel_stepping: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:24 +0200
Message-ID: <bc6815175dc04b6f7efccc21b5f86d86026a5d4b.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 0757b215-351f-41d2-7c40-08dee26abfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: fBBEizefnBr3iL52Yrunhm2X4HgZAcppJRsi/6I4VyabiZS8jvpJCcVlJ+wG8e+r4r0SDazOYYeVzOurzrx1r2+V6dbFpiLEx/AnFN9oQfBGu7LnzkNUuinPnkfE2EUWhwUfUrtAh1bG1+lAlFoZD3PUwoQg6DjkE8J+NllHCWi/Ju3l7mfEMxCcqa4SHGnb//3ouXlCdumyah8oR/0IwNwCajic5lPGQxWd6JnLKk1Ke19DtMJ0G1/o06ooBmiok1MY/Vuv4fA8AHFFVMe6avjBEcqeWTcMocIYCDCOs1jTWC86Ta7sEddBF/dhKoQTN4yz+EQYMSqKD4EBObSJSauODg3K39P9YwdmNwkZVqX/Fi77s6etnB93Q9tsSUkifmOdDUNLALLJXvxml4/fVotZ7z8lovf5qqDbmqF7JGJ3cbl51boqyn06BMVWwZCPD506sjzcznHPg0iXffGFxyzZHKqXrA1NcF78Nx6GhmXEwAHALK+cUJSgJPxcA8VDI6ogtumiTdI0Ormw7K1o7uXAwwwdsD/+5+q+gc76/vfUgz3yoMpecP8cVZYHh/bJJyGces4RLsPYuQ2ugDJDCj+8pzbYi6BzPe61BXzXLaQuGyulPZO35AGRMyI9xgt1XoPDyuuhjl3g8nNY1V6uVxqsTHucqyhYqL9rncBdzZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b1F2/4V/iFaeJ4bB5Q33XUYfOL81wSZ/6R83xcx7UFuoJdG+1ci06fWl0zCB?=
 =?us-ascii?Q?yfB8fktOjq6Y231XGS1oAlpayoOZ5Hx8tiWRvMUVgPNUprCI0drkEhW/0lAG?=
 =?us-ascii?Q?Gi/Rqxj4mSkn5u7a08mmTHKW6tpUYEeX4kwwflXnlnZn6HjooFlPWE2GOa0E?=
 =?us-ascii?Q?A7mwUSjTdf0QJChC+gw0d306BcNeoFXnGQD2SEA8xtJX3fup2WM/1EyA7/xQ?=
 =?us-ascii?Q?srvsg8CYrov7mIbrAaEsQUpcQqd3NKlt1K8OktCdEdDbSLhkbC8rtcQFoDCk?=
 =?us-ascii?Q?IlrPuPQ7/hwy62M43G1YhqG97efpS0Q50aWEKqHZLp7BIFC00pWsP8H+ZXuf?=
 =?us-ascii?Q?B6QUvhhO0uYbZ44yzA+A2ZbZzkq2Q5CTzV8h56miJEiDg9HWhb9uzMrDlrOE?=
 =?us-ascii?Q?sIWBF4psevecrxJZf1Zj3rAWBgimXzovSZg7/PR/KmkDsQM97x5zGjtqNmyP?=
 =?us-ascii?Q?cJw7R0TXMAlcSj9tBE1EAPKe5X1Dhg4VDhSE8C5w24wSrDWr7Ysr5oI62s+c?=
 =?us-ascii?Q?vYzGgiWqsPb07dT/z1SqUMB32XZx22d3VhRz/5sD/0HRhg1rRr0Xq224vfLu?=
 =?us-ascii?Q?IgOkqh0waSexHXLS15AHerUMXFGqS2SKMn+COXKOeEdm2GMdiXdLQKpa5uSs?=
 =?us-ascii?Q?5Tb4BoCZcEO7hhkNTrDDFzh2LzjVmkfPm06La0Rzqhda8WslBn/jw/J9O6H7?=
 =?us-ascii?Q?5faNE0dtN68F5RIHofWzM1V/CaQO3i6EkHizl4wh8juwcjwgwdOOROixus0P?=
 =?us-ascii?Q?wjZE/IDTZc2Lnsv5xHAKAYGuWd/+1QWtJ3JyOOAHUenFV85oewdkqsX/GVCr?=
 =?us-ascii?Q?pn/9wakV1o7Rie7ciihSm1U/5n8F/R95M6psYOtWF7vDr0dbAiDdBLJXZcY2?=
 =?us-ascii?Q?0ZP3BLrX7hOGqfTCkRnLBZ3hrbY8tylNaR7MV9HYM3/w/+OAhnB5mpyXPXKY?=
 =?us-ascii?Q?f6jeNSMk8KAbrd+la50rxWRCh8yBk8LVy18jPCuHheTp+3Scr7+FJFyNUZvp?=
 =?us-ascii?Q?+qAn3QjlLKoDASEflpmqzLWrhxjvVbBJIDN2h23Mm6J6FtBIOJQaj5xjRlWb?=
 =?us-ascii?Q?wmx7PZUj0q8Gl+ZYKIxn6SM7T6oMF0orjVqln6b9uyZ5YihKYHKVRAc6RupG?=
 =?us-ascii?Q?yDyL0mOIQL8MForHe0XZRCaA+Aer5vBgmM6kRAbso87p/KB/bo1+rj2s6q4p?=
 =?us-ascii?Q?VISiUNL2UfSl/kdgMe6BD/8gC7tEdLzsI1BWCFAnZE70PNk/cWgdGCF1mbM0?=
 =?us-ascii?Q?je5/j3Ru6GkRLpL1JK0+JpmNzjkcCFX5obKbWyeIis/IWc48SyaXMUV/19ZS?=
 =?us-ascii?Q?MjnEJeBr+qWuAGBSNSaMpSvmxV7zye4S+is1dmuwKNuZ00dwUwIYIRfvUW8d?=
 =?us-ascii?Q?GAQ/FVA4xCPAx/PgtQ7IQehSR6/lpnnf+0CQb1G8m9aHmat13Ka+d18s5xQG?=
 =?us-ascii?Q?uXrGMLzHjIzAZ4Fcp26B+zLi4W+AkbOvLwtZ728Wc+cef4cX7QMuVMZi2bt/?=
 =?us-ascii?Q?2hEjqKHf+h3D5HM+gbp1cjikfxS6tCg98ObxFAzbI5G7k1oRTYT4cWPzXHlJ?=
 =?us-ascii?Q?61bxx2Zdmc8snjaBI4WyV1bRzsIPOZS6kJ6NoLIze7B3pdIJ+xhCiTWf8YUJ?=
 =?us-ascii?Q?LUfQlYaSKcku8Oh4FvHhC/vfqz9/h7+DRut+9fEiTcOJO6PepBNV7OjfMBKD?=
 =?us-ascii?Q?xsnByypMea6inulxVF1l64xAf59HBxlBtbam9f3EbrMU/+Me2J2u92snuIg/?=
 =?us-ascii?Q?bROiKcms/+g+r5CVPJUgeyOmSLbohuE=3D?=
X-Exchange-RoutingPolicyChecked: ZLf39VSRru0wVqb2NW2sm1CSEDHRj7szdj0hWt7vO8YfOIFmXiEPAcEnDlwoTCR+26gBV7Ovo21SFUcqb/CAVLqAUXydv3sdjCL/6lGiit3s5XbF09q3OEqc07X0w/2rGbdYa/p/sQE6QjzsPQsir5IkpGj7z0WFZVaeoWtirI7wr9HYABGxCQ/tzbhYCtP8lwGFSW7lUGf9C81xY/4JnQHFGa4l6WHbddHUIe/HN+cODZxg00Jnlo7GCOykbf4H/ovHn1Z5IiBCwVLKiF4GzzHxGD3uCQ7CicEc/hNXMdiDl/j70nziGRm5TcwvDT16aVFJZMvo05o8H0KuokzJYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0757b215-351f-41d2-7c40-08dee26abfdf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:24.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9txV42O4aBjxhdgcjt28vdfWZ1lUYL29BGkh49ALz+gqDoOpMdEbR0S/aIY/5PLGozzMauvtwt3pWNIVaAh32b6yFMmfD2t6WNFnh764YCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

intel_stepping only needs the chipset tables and the small tool stub
support used by those helpers, not the full libigt.so stack.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
libpciaccess.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 01400f53e..8eb346321 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -36,7 +36,6 @@ tools_progs = [
 	'intel_pm_rpm',
 	'intel_reg_checker',
 	'intel_residency',
-	'intel_stepping',
 	'intel_tiling_detect',
 	'intel_vbt_decode',
 	'intel_watermark',
@@ -70,6 +69,12 @@ executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_stepping', 'intel_stepping.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

