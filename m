Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7441C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0AC10E64A;
	Mon, 25 Mar 2024 15:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1odxD+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294E110E400
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382249; x=1742918249;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=HIBLpJlv9+HWTGi/wv2OQ5x5xzhtfxHLS45GW9WwgEg=;
 b=k1odxD+efUOPYXqgE1S/bH+FUs/2wk+xPIQeKns21qVu+uC0fvknkPra
 fTKOfKARbPyWTuQ1MPf2hSOVvgOMOtq4KOlrQJG6Uzieco9oGsRnBi+cj
 jZUiOofr9+GH/CMAi5RTATBc0/9jE7hFOhQqO39PfSldmTf8L21HsDGXR
 EFj1RnUm68mTehORDqWilUEUqMwm7Rd/rX+BLc77qYfeQZuZj7JQSDS9+
 ylEoponTqVghmK22Qv4974chFGH3W3ZS6bD34+mH36Rpisybs8000V66y
 sgR7q2AwLXeTektfTWgOFU5lvorclgC1eeEOh5b7SFLvrPBihzG7D0/LZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10186692"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10186692"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15637185"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 08:57:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:57:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbSHDaRrN35TFKAL8Candf76rPzneUgtwVNo6LCIRxWo+qOT2Q9z7mdnb5EiC1DM7j9n/PaRCvtZmjxjjgRHVs4ipAheT7kkPxbFi0I0pI1gRRMpK6npiR0UAC0SmJdpr0xhLVuCxTRGuzwtTmMSUVuciIjbi0nBmg5SwGGiPCsOJZuJVPDeEuoESO5V2NuMXbzyj3bN7ll0q7plOG754avRigTpN+RpuRdB10N81MpRNWLpi0XINTyKAqM4yK1w30fvfvacmC7to3c8s2+oKg7aHkw/2DIQkEic9fPEEhq+Bin7g498tb/D/ywhJ98PDrsCjPXX2wnmsRryIY5uWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzCu8uclVOGzx7ytn+2P9MmBf3LCT280qfGgZgyK0oU=;
 b=acsicVz20MHt3ub5DrT/fE9XQyDbO09WKEZqM1js0+UWGJAH6ukgaDqp0ldAV0/DwfmzuA5odiyVMKiM1F/YUulg20hiW6tOrZc5c86g/4PfmB/YZNm+aReJd2Su/JRON0sAxdQbh4SgM+ljK783iq78h6H9sXZKEW+feR0D4OTzAmOacKvZu3XihIvDEhW29eNOcp9x/GEtzdXh2rc+pfPOI5TWIkAyf0dX8KZc/+a70cejGEiyX+VuGV2S4KdpopAOkcFVerDPOZQzfAIekex4wswo4hCiCelPk67nndQT2Wkzjam53MrPXaCb1XF3D9AveSxNqYh1PKk+EuUFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 15:57:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:57:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 2/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Mon, 25 Mar 2024 16:57:09 +0100
Message-ID: <20240325155709.3521039-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
References: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 276f2fa0-21b3-4df1-f4a7-08dc4ce443ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bihx28glLx4lnpHyU2EAQy0rUKDWFHlOArPa0l3B/D3tOr8eEa2M7PvDzquw2ZlOkrqzBKNGT3pev4Ti+wWexZ8YOF0irU3NE4R2Ack6X8UDfpUzC74myVRsCa+MlLsxRfK5EhHV+rg8lQ/j7XoP2joxR3+U/MrYG+hdWg+m/CSuTgki3XAPrUZHPQs8DGGwV/7PRQgbHNSjeNxDEtvCL3Rv/l5TWlrZ5Sauy1w3WgFGkDgcb88TkZ3PJls9vo2gl7Wr9IgFeGMk+KC2Yhv0bgzVABlOroEaaPRDFog26pk430NNOb3u1n8eUQImm3BEZBqbr14790OYOysoCZXGbrFcHqFGMm6hrnV7gnHQF5zN/gn1HwQEEZB/Nu1ODpLe74WkPAAsfs3uFL998G2xvlByT3RpBJHojqzK2GA99acEwM9JDwOenOAU01ZwF7kPSzogVYpYWP4Ggex7KXkDB02rzx3Nmxli6IyPmctEwDYRbWYBgcReLscg1loGUqvyoYeBG72YqZp3F1jI8aIVxXK7XKqHRQEuEvvNKLdr7+6oV7MjrddAl4WTHopI3NwHL1mVGtr2AczL71ZLOuFV6j5fOFpHPtoQWT7fnp9hKElp6xmRn3lfX/d2RY/K52u9QR/R7D8dl+uipvB8DD+fIeo/wgG0yD8kysWM0yFOv3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjJSdEl2dFk2dXNTOE12NzZYUTZva0ZwR200ZWFDM1VqOHpxejk2Rkh3Rkx0?=
 =?utf-8?B?L0JoY0ZFNDY5QzJCSXF4NUVvZy9neUNPbGFZOVlFWVdPWW5oQ2pBcW9vTUt3?=
 =?utf-8?B?Qi9jUEtsWDhFQjBWU2RQSzNNUENQekk2MWVKeVhlMmg3bGJYTC9qakJMam54?=
 =?utf-8?B?dDAwM1hpQndlaUxtcEJ6UWpNendSd3ZCc0svckh6aXZSZTE3OHVKODRSZ1VC?=
 =?utf-8?B?d3daRmEvdjcyU1UrSEd6b1pkc2N6WVVSbFRpTjJMb1RidkVpY2l2MmtXVkdT?=
 =?utf-8?B?QTdrV3F3WnkyM2pMNnQvYlZySXFqR1hhR1NxaEJnWUJPMmVpTXc1eTFUT21H?=
 =?utf-8?B?d1ZCU1ByYm52SWVES2dDZFpBbDZGdUp4aklsWmlBcXlFOXgzM3ZOWS9pbnRE?=
 =?utf-8?B?V1Z2aWlVb3oxb0FwKzlOUm5weVdzUmdqcnJ1TGJhTW45cmxkbk9nQ0tsWFA3?=
 =?utf-8?B?YUlSenhpMG1FR3RVQk1TdnRuQ1FRWG9GRE10Yjh4WERMUVRBY1JPL3RaRTFk?=
 =?utf-8?B?R0dLSXB1N0txZThhdnlpTE1tcjBWU0xOV2Z5ZCs4clRrcFhPSitCYmxXMW1Y?=
 =?utf-8?B?cEFZbUoySElDWUNXcXEvU2c4TyszK2djb2wwaE94N0JHQXlCTlRUWFNmbE5v?=
 =?utf-8?B?SENhUkE0dFV1Q3ZHeGY0SG5ZbnA0RnIwT0tkSHhxQ1hlV0IzTnJKL3B5ZEFF?=
 =?utf-8?B?eEQwUUZuOVh0TmNhNEs0ejdVU1FFWVdwaStxVXFoV1JoMDBnNllkR2hPbG9a?=
 =?utf-8?B?R1V2Z3c0cWtETWI0VTRwenFCZlRZc3FIY2hsN0RZS0ZTdXowbWgzRXlPTExh?=
 =?utf-8?B?K3o1WU5ZZmNDYTZSSVBQUU5LcDlzWVNZK1BES081dWd1TVF1SGIrVWZybGhi?=
 =?utf-8?B?ZC9Oa0IwSTJwaFErVE5WQ1dzWm9BR1JFV1hNM3AvZ25DSlpqWjdranAwUkQ1?=
 =?utf-8?B?QnlGdUNXU2FMdVF6L1VjR2VlbkJSbTdUZXdDSndpRGpBK0ZDdzJ4cjdGTnZG?=
 =?utf-8?B?aWo3ckFVcG9UTnhpR1lDaTZSK1pDaDJSTEhTWnJPK2ZDcyszaExQU0hnazlY?=
 =?utf-8?B?SjAvdE4rWnpxVVJQVGxmeHFEMG9BMUFnbVUrOFcxRGg5aWpiREZtSnJhNU1K?=
 =?utf-8?B?YWh2aVV1UjIyTStzQk1jbHF0czgyNGEzMGs3ODc5MFlFU2k0aGxsdUdXR2tP?=
 =?utf-8?B?Sk5IcjhOTmZnUzcxaXc3NjJwaDMxVlFnVTJaeUNpa2RGQlhnaE4vb2dxU0pz?=
 =?utf-8?B?c1pFU29XcEg4Vklvbmk1MldzSEJJRFk0bER3YlFBNEMwZmRQQ0JlaE5zT2Vt?=
 =?utf-8?B?TGhrbGxEK3A0Nlk2dDRQdmVnWVE4cEtKaEJqbGV5enBaZjVlVm93VmY0b09Q?=
 =?utf-8?B?eEdGdjRxZ1llUnlubFNFSno2cXUxR1BEUGQ2VVRKVUo4dGF0NmFjNEVBNUVV?=
 =?utf-8?B?ZVZjdjZuZVVHVGFKMDZQZFlFcklUZFB2aUpPZXJNKzErMTlpSUVwS0Q1Q2Zh?=
 =?utf-8?B?bW00MWViR2lBRDRleDJDa2hONkhQRTE2a3Z2YitNdzJJVGxWNzBBVVY2WFF2?=
 =?utf-8?B?MG9QTFVaTU9pV0htcWhBU1pBZEppblIvby9YY0tqVElOOHhaY0NKWlhmVVZq?=
 =?utf-8?B?dTVoamtBSnRYZjVyQVYyTlRyenBkbWQweHN3aHZ0eStNRHlyMnBrNzJwM3dT?=
 =?utf-8?B?ZnZzMVJBT1cxSEdUWXNpMFF6MC9LY3VqVGRWa2FNYnBjRno3ZVNLRGlqRm9u?=
 =?utf-8?B?aURmaG9QOVhlS1Z1cEpCcDZTU0RvV3ZYa3JFN1RiQ05Vaml4Y2JmL0hCNm92?=
 =?utf-8?B?Ti9DOWxuRkFId0tDMXprM2dOVkszcHZTaENuNkdwSHZzcGs1bjBiVTlJcHBa?=
 =?utf-8?B?b2VGQWdVbGVadTdmbk9tNmpsMml0MUZ1clV0b2phcnNRZnNsc1EzdW9yRk9i?=
 =?utf-8?B?TWhxamNpWnVlVXI4dnU2bmI1ZFRWYjZuQ0VrQm1lamM5SC9HbmpDVS93cVRp?=
 =?utf-8?B?SWZFbTdycndGMHdTbE9QUXNJYzRHajNmenJBeUEwMmVRTVBoRVdNUEpPbCtq?=
 =?utf-8?B?b3dRMHh2KzdOUHJhOE1OYytucTkrTGcyai9ZbVBTK0NzaHhCWG9ZaHNSUVVh?=
 =?utf-8?B?aDJCbURsUjg0WUpRMzhtaDMybnZCMjVRdjRFb3pocnBwME82RS9Wa09iUXM3?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 276f2fa0-21b3-4df1-f4a7-08dc4ce443ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:57:25.5557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/o603cHD2wr4EiUZLgptYnVGMl8E1T4wHnF1l4XYicW/S+DqEtLmZTJoPmIsFxPdf2W/KQvCPQ4uZpRsVg6COnyp9rYDyI7vs320QWZ91k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in IGT we have a library intel_mmio for simple MMIO operations
on intel GPU devices, but it is limited only to accessing registers,
has a lot of legacy code related to the i915 and offers no support for
multi tile.
Let's reuse the memory mapping from the previous library and add separate
helpers, dedicated to Xe, for registers and GGTT access that support multi
tile.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/meson.build   |   3 +-
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  37 +++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 5 files changed, 266 insertions(+), 1 deletion(-)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

diff --git a/lib/meson.build b/lib/meson.build
index 934bac5c6..2f9666846 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -110,6 +110,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
+	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_util.c',
@@ -162,7 +163,7 @@ if libdrm_amdgpu.found()
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
 	else
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
-	endif	
+	endif
 endif
 
 if libunwind.found()
diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
new file mode 100644
index 000000000..bd4227f25
--- /dev/null
+++ b/lib/xe/xe_mmio.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_device.h"
+
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/**
+ * xe_mmio_vf_access_init:
+ * @pf_fd: xe device file descriptor
+ * @vf_id: PCI virtual function number (0 if native or PF itself)
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps the MMIO BAR owned by
+ * the specified virtual function associated with @pf_fd.
+ */
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
+{
+	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
+
+	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
+
+	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
+
+	igt_assert(!mmio->intel_mmio.igt_mmio);
+
+	mmio->fd = pf_fd;
+	mmio->intel_mmio.safe = false;
+	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
+}
+
+/**
+ * xe_mmio_access_init:
+ * @pf_fd: xe device file descriptor
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
+ */
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
+{
+	xe_mmio_vf_access_init(pf_fd, 0, mmio);
+}
+
+/**
+ * xe_mmio_access_fini:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Clean up the mmio access helper initialized with
+ * xe_mmio_access_init()/xe_mmio_vf_access_init().
+ */
+void xe_mmio_access_fini(struct xe_mmio *mmio)
+{
+	mmio->intel_mmio.pci_device_id = 0;
+	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
+	igt_pci_system_cleanup();
+}
+
+/**
+ * xe_mmio_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ *
+ * 32-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg)
+{
+	return ioread32(mmio->intel_mmio.igt_mmio, reg);
+}
+
+/**
+ * xe_mmio_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ *
+ * 64-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg)
+{
+	return ioread64(mmio->intel_mmio.igt_mmio, reg);
+}
+
+/**
+ * xe_mmio_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset.
+ */
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val)
+{
+	return iowrite32(mmio->intel_mmio.igt_mmio, reg, val);
+}
+
+/**
+ * xe_mmio_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset.
+ */
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val)
+{
+	return iowrite64(mmio->intel_mmio.igt_mmio, reg, val);
+}
+
+/**
+ * xe_mmio_gt_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset in tile to which @gt belongs
+ *
+ * 32-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg)
+{
+	return xe_mmio_read32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset in tile to which @gt belongs
+ *
+ * 64-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg)
+{
+	return xe_mmio_read64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val)
+{
+	return xe_mmio_write32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_gt_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val)
+{
+	return xe_mmio_write64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_ggtt_read:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ *
+ * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+}
+
+/**
+ * xe_mmio_ggtt_write:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @pte: PTE value to write
+ *
+ * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ */
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+{
+	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+}
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
new file mode 100644
index 000000000..ed45040bd
--- /dev/null
+++ b/lib/xe/xe_mmio.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "lib/intel_io.h"
+#include "lib/igt_sizes.h"
+
+#define TILE_MMIO_SIZE		SZ_16M
+#define GGTT_OFFSET_IN_TILE	SZ_8M
+
+typedef uint64_t xe_ggtt_pte_t;
+
+struct xe_mmio {
+	int fd;
+	unsigned int vf_id;
+	struct intel_mmio_data intel_mmio;
+};
+
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+void xe_mmio_access_fini(struct xe_mmio *mmio);
+
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg);
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg);
+
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val);
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg);
+
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53a2b4386..c885e3a79 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_to_tile_id:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns tile id for given @gt.
+ */
+int xe_gt_get_tile_id(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	igt_assert(xe_dev);
+	igt_assert(gt < xe_number_gt(fd));
+
+	return xe_dev->gt_list->gt_list[gt].tile_id;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 82af2706d..b1b3a989e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
+int xe_gt_get_tile_id(int fd, int gt);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

