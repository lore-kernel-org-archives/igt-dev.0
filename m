Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B5C54E60
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 01:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0D10FA8D;
	Fri, 15 Mar 2024 01:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMzieLr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D13E10FA99
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 01:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710464932; x=1742000932;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=aHtJYjxI0bD4WMeWn8saugFs4YMKUmknOPktKxylfoQ=;
 b=gMzieLr3qjX2W3LQw1HCZ4xzr7lVJDZ1sJUE47PqlXKThdCbyaQb/aVJ
 UA/PpvzEBGmDjY7rRwMv6Eox0NUMOMaIkGtOcd0KwH0GoEcAYELg4UFe7
 ENNZZPO7UTbLTSnjx4mdfWd6pizOAXX0/5eK1gS3ahrVKCtnSlFqVMBf7
 X7BAMvqE+ZQbymarfM1mj02ALlWWA3x8VJac0HJ3J6tMNE+kbHRe+FA+z
 LidPhmm/R1XDAorW+yf825Nzn+irsqqXuJnrzIfVyvRzlxotfOyeOZK1+
 +2wmMn65/ewUJUxvpytK7iyaWJDzE6KC8FYbd82TKHxr/wTz+GvrJgHV6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5450896"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5450896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12458166"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:08:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:08:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:08:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:08:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJstuasTlKfQatWnjyVafShxKAtGbdfVWcxMNVnZwxglt4KoI5/2QycOHdPENhzDkBKMVfcJQ+cDYEnBU8mTr9BSrJGrlK4JKXdBPB+fPpgKCkx/A2gsP5dGHg+Febdxkv3yHoXAuJ3LWkg10HlEmSYIOjcspd1QhemPFmWXgHE9MTqH9jO8ycQpThlpHjG/1O2HCCA8EdXofXlk9+xdszxj6Inxs05pT5W+5ZERmJbMoMZCiVZJ/0VEdlyCl6PyjEp2eFkTBOdj27njPL3Jh1ieoLP8WGfIlIWTIt87YU1LRlpDOb2dsJtqZ0hOcKTMfuZoKkXJAVZWcYcVaTJm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYLLIiu6tAo6bFICu4X/LbsROofiqPJ6jDu+Et/6kCk=;
 b=SNBA98eDfAhFjzc56kdjb1ggBnosLbhFiR0iiXICeteC8zLHMJFiFZgTG0mptgP96PsK+Jt3dYqLxeXk+1zLRRBzgSQNiEJDVe6E3DBNXEmsZlVyByWf4au9zJZUy6cSpbm4ld/IymHRjTdD+4Xdi4WIpqNJsku68TrPwsFaXyExpW4VZp4XlOqnATLdsCfrVKcb5PTEpPD2fTtQdlwJdDi2YbmBmkjzdpMdze4Th9hieEDTSCBAwE6a6100MlPiWKpcEr0Trfas/fqL+pdLZKvROcUzLfycKMsWvy0iiimKJvm9eue5pp66eOZhrOIJhn8RM1WqX0+R67Ek+OT7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 01:08:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:08:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_busted: Introduce a new test for Xe
 device busted state
Date: Thu, 14 Mar 2024 21:08:41 -0400
Message-ID: <20240315010843.194335-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: f947cf6a-93a5-4ec1-15bf-08dc448c774a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAJ3mTwGPffckBN0Wl0fFtc4jHQO9/ZcLIlau98yrUJUqxw3yzmKqu46V97Tixh0N3GB+cIVFNdo56An2R5JOaID3NyciUdgj/+Xf/heqKAwxL32OPNhK1q8p1G+Byt7EyNknOSn8bmJStsDptTlh0NDJtlHNJxAa2VXn0MtD+PmtQIiTQso1KtapVCreOfiAqMz2z2KmZ8LCHGC0l3QV1rjzcSz4YSgJc1ITBF58EX2LCKEvYQYGYDm9/yvmYD2P6I2cB7gmp4EsywgQq765vWiJNw32uePFW8hbjsg+tqbPl3satRe9kE/GNzRpycWqAkI9tp9qRvKq2sG3S81+kgsnI50pwaKLNOZPPI9WXzT0uIWoyYNWEcLFr+qa9bayWKEy1IRTSTxkZeNH/UYgFfX2elf3oRCdEDh/jwOvzgrFgq9oChxJx1X2az2qP64mAMKHD2eDhPrNt385CWxNhtNaksdBySxw6PVagIFUEnP7DHyonVZDVyFaSMmWs21g/bFgj4qjCPBfAgQN1yfiPj1bqIzI1FIeexWdcXQ5R0rdzInInkx9FOAZ3+6OumFzcLK1v1rE7c2TOFRi0/9jKrEmbQ61AXB54qAOuwl1AFanMY9VgcHKXuLhg1/NoBbKvraLz/SrygQAmnaTTRtfzQQjvcgY3ei10Hwj5y0UEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3IrbksxSEI4TWZMY0xOSWozZitHa2dhTmxFd1I5K2YyWUEySHlLWVdsZVdz?=
 =?utf-8?B?SlNXa0hoWi8vSFc5QWFQeVgzak1FM3RmRUYyV3R0dTNQdHgxdFZTcGxFck14?=
 =?utf-8?B?OEhWTU5Pb2pmVVM0OHoyT0htajhlenUwbzNZSXgyR2hBWEM4czFJZW1RT0F6?=
 =?utf-8?B?K0c1WjY1a3BBbGZQTEN3dXpRalF4YmxLR0xxN1ZQektSNVRLVENpTnoyeDZt?=
 =?utf-8?B?QUVuZkRESDRRSUtaOVhGUlphM1JYUXRjNE1YQVh4cWF1bE5XOFdPN2tiSTlY?=
 =?utf-8?B?bjRSUkltblkycGEzNnhnZE1Qci9tSG5xK1l5UysvRXpvd2xhcndUVFlvaU96?=
 =?utf-8?B?cDZwWUt4QnRvNHF4dzU4L28waDhXN0d6UXhOdldmNkdLK0lSV1JaUTNrcy9B?=
 =?utf-8?B?RlEwRWlaWnRDUGplWWE4dFp3RWcyL1c0U3hsdkxrc0FVU01lNWZQMVBWS3N4?=
 =?utf-8?B?VEFVbldqZ0RqVS9ZYnpUTkkvU0k2OFFXVHBQOFNLNjZaRzBZUWFlZEc5bDUx?=
 =?utf-8?B?ZnBYK3lGK1pPc2pxMHF2RGYxYUZDa01jVWNSTGs1VnRvVitPSnVnZ3ZDWTBz?=
 =?utf-8?B?VnM1Y3Z2blg5S29FV3BkQjlnVW53cWJRSHdQeWxUZmkraDNwK1ZxaXB3WWxD?=
 =?utf-8?B?aWw4N3JjUVUvN2NvaHhacmpmcGZ0NG1RRHg5MDlad2wvbnlZcFNBTk9IcDBP?=
 =?utf-8?B?cEJQKzFCQzBCZ0xwdGVxa2JHNUlCcGFrUmg5YjNtSk9HMjBRdGFLUytCMUpt?=
 =?utf-8?B?WGU2V3dUVHFzU3djS29YN3psV0paVGQvOFF4aDVESkIvUlVCelZaV0lJMWI1?=
 =?utf-8?B?K2lrZjhDWHNESkcwd052K0VJa2tiUnFtVHFtWDlQZzhma2dQb1RLVm53eDdv?=
 =?utf-8?B?L1gzYlQxVVRpM0E4UzJlQTVPMGJnMVh3alhhUGhpb01ydDkwRG1XbzlZd3Zu?=
 =?utf-8?B?MUFhRWVYOWFVWnovOGRqTm16d0ZmbFA1L1hBRGlTaG5xcHhjcEJmU2o1T3dp?=
 =?utf-8?B?UlBxak9ybms2MGNQeXVudzdJdllxNG9HcGRWSDN1WmF5R3RodmJSQXlaeXlh?=
 =?utf-8?B?UGRRRkJjZ2tuSGd1RGVVQ2dXS1BUUFdWcFZrNWJUbFRjS2s3UUJoWUl0VWIx?=
 =?utf-8?B?Qk5PYjd1V3I4eE0zM3hOZWRFNlUraGtwbEp1TVFYektKd092aG5ZQzl0Y2tR?=
 =?utf-8?B?cmM5MGdsMFJ0akdhdHpaWjdzZSttSDBRMnZpOVhtMmpxZVlpYjZLQ05SMVE2?=
 =?utf-8?B?b0lWY21qTW5vZzVQSE1XdFNTNlQ4Y1p3KzhzbnFhajBDdDJyOFRIWTd6a08w?=
 =?utf-8?B?Mk15UnQ3ZExub29nbFFzZEsvSVRzVUx6UG9TYUM5MXBBeUhUVHVRUnFYZHJQ?=
 =?utf-8?B?MDZLM2owUEJsc1dUb1doc3B0cnlzdi8zQmc2bGtDZ3RlRG9UTzBnQnp1Vm5r?=
 =?utf-8?B?b3drN3BoWXM0NmN5NE96V0hKcGhzRHVGdmVEMjdjSnNLSTdsUDkwVkZhYnpS?=
 =?utf-8?B?RjlBZ1Y2endxU25ldHFNTmlhY0pObTVvaXRlMnpjaS9QWUE1TnVFdTREQkpO?=
 =?utf-8?B?VHpLbTZYaWl6a21OUmRUOTJNYjgzUFQrZjZMR2pyQVFydlZ2d2EzUkcxVU4y?=
 =?utf-8?B?YXlhcHhpR2NDcTExYnRFcUZjMUFrWVRvcFNmNEV4QzhGTTlMQjBwVmJnVWcx?=
 =?utf-8?B?Z1IvcEZOOFl2TUxpUU9tSXJZU3dUeWNodjJVaDhtWVhuNEE5VzBhSEo2MlJO?=
 =?utf-8?B?Q0JkalBidmoyZm5RaU4vQ1dEQ0tRODExU1ZtN0RRODJES1VuYkFWcFJlOGJC?=
 =?utf-8?B?a0FuM1EyOExNVktzeFpMblVsZm9IK29MdDBDd2NkMjc0K3ViL2ExNjNuOVU3?=
 =?utf-8?B?THJlL3ZpczFKR2h2QVpwcTVZb0RVVlBRVWtkUFN4eU95M3BrcUpSM1c1MkpZ?=
 =?utf-8?B?QUpORWNIc09aQzhjUm4xMVBIeXk0ZjdFNEtEMStTY2tXemJaUzhwVXhVK3o0?=
 =?utf-8?B?UWx0Uk14djIyTG5GbVVoK2ZiV0JscU9iYkNNSjFHTlJvM1BZYUE0NFlpZG85?=
 =?utf-8?B?bEZZQVVjSXBYTUFKKzZnMkNMWEt5N0dVL2UxVUh6YkNUVG9MM2g1TXhmYlNW?=
 =?utf-8?B?NmV2VmVmMW1IakNicmMzT2JDQ1VhNlRxU0JjcG05c25uQ2lEZWlQQStISkdl?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f947cf6a-93a5-4ec1-15bf-08dc448c774a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:08:47.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Emrhl3V3uAflP26tc56M4RDVG2Q+xaleaXmeba7frDwCkfpegV77L7myv6XVMnbtsQ9/UzIvgZDAYlIEk/xYKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

Let's inject a gt_reset failure that will put Xe device in the
new busted state, then we confirm the IOCTL is blocked and we
reload the driver to get back to a clean state for other test
execution, since busted state in Xe is a final state that can only
be cleared with a device rebind/reprobe.

The fault injection of this test is entirely based on xe_uevent
provided by Himal.

v2: Use rebind instead of module reload (Lucas)
    And other improvements also pointed out by Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_busted.c | 107 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 tests/intel/xe_busted.c

diff --git a/tests/intel/xe_busted.c b/tests/intel/xe_busted.c
new file mode 100644
index 000000000..88278213d
--- /dev/null
+++ b/tests/intel/xe_busted.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: cause fake gt reset failure which put Xe device in busted state
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: busted
+ * Test category: functionality test
+ */
+
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_ioctl.h"
+
+static void force_busted(int fd)
+{
+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
+
+	xe_force_gt_reset(fd, 0);
+	sleep(1);
+}
+
+static int rebind_xe(int fd)
+{
+	char pci_slot[NAME_MAX];
+	int sysfs;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+
+	/*
+	 * We need to close the client for a proper release, before
+	 * binding back again.
+	 */
+	close(fd);
+
+        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+	close(sysfs);
+
+	/* Renew the client connection */
+	fd = drm_open_driver(DRIVER_XE);
+	igt_assert(fd);
+
+	return fd;
+}
+
+static int simple_ioctl(int fd)
+{
+	int ret;
+
+	struct drm_xe_vm_create create = {
+		.extensions = 0,
+		.flags = 0,
+	};
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+
+	if (ret == 0)
+		xe_vm_destroy(fd, create.vm_id);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: basic-busted
+ * Description: Force Xe device busted after injecting a failure in GT reset
+ */
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+	}
+
+	igt_subtest("basic-busted") {
+		igt_assert_eq(simple_ioctl(fd), 0);
+		force_busted(fd);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
+	igt_fixture {
+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
+			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
+		}
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a856510fc..87a531051 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_busted',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.44.0

