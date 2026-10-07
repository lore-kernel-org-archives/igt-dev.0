Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D498CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD4D10E5DB;
	Wed,  7 Oct 2026 14:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4qtwzPe3";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010010.outbound.protection.outlook.com
 [40.93.198.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2398C10F613
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQBQkPm19o/XbAfTj6QWjmW2EKzlsTuyYmfdSVE509tmMvVht01gfQaaME040T5M0P2jM8W3jFooe+dRcNjBJMbQxotZxQBdsyTolscBxfsL2ONToJzrrzAEQGg3qiA/vBQ2yPKrGsU9+7NrBnKJCEbglC4s8SCxbuALRuDV/l32GGaik3CXf3wN7RmJl3I/6l4NIT1pxhkGEMwXawpq0Oh0+o6HoiZn1TW8ugH77NYD3qqJC93coXoSxPZuu1DpjY2PtCGckFwHvZtiedTMmB53UPxn4uc1DUwS7xmLJMF8FgA9Dnj81G2E4Rx3VAzaeCeDH7mhhMF2nBF6BYab/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYa01q5nPAF2e7eA2gJ8m2F2acNF81t2KyHvGFl2XKY=;
 b=KalIIIJNKpJ9bG6rEY57Tx7MYDZ/gyvQaIkLR5zYnMp568h8rDWsxW5TYEW8zCMvExMNIvqnBtjPtnvGVJCk4zOKHx5Z+F3j4Pw6d+Rmx7fJE4OFU01dEFcNUv20b8bVaehTOFE4mNXRVauZ0n3zzHYi6yEMY9sEHUT+1yTnCgxyrflPcJ92odRzcN1Rf7m0EHQM0XrmcO8qkOJQiHalGCHIg11I2UT2wefVQCSHu6C5ufpVF7GVJOyVmq/jAB+PJW9DzVKJatOnEo5l7DlTj1J2Pt3SwtW9r+cpDUnVJtJoC97qr4bMsxxKohGmpkcFY9/cEXgiMIVVrC7EkQQ3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYa01q5nPAF2e7eA2gJ8m2F2acNF81t2KyHvGFl2XKY=;
 b=4qtwzPe3vhDogd3GSlUrp2Yt6g9mWTAsXg1gcIz4Ge3QuOs2Ox5nI7uhPWaKNLjBPIzf1iDjhIlVGxESq9WRPec1T78OkI7NJ+4OdO6Uh9mcDJVqyWcjcFoUob5vcpmJktZFxjkL6iqk15aUi8kxSq1/vFSSoGZhIlE4a/20DYA=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 14:13:32 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec%6]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 14:13:31 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Topic: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Index: AQHdVmXmMW9uqLKDx0S/oDHXh66Ci7byHxpn
Date: Wed, 7 Oct 2026 14:13:31 +0000
Message-ID: <SA1PR12MB814451AAAA230BA088A37A2BEF942@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
In-Reply-To: <20261007141209.2928162-1-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-07T14:13:31.264Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|MW4PR12MB6950:EE_
x-ms-office365-filtering-correlation-id: bcb48b33-b684-4839-03c0-08df247d2aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: mrF0jEx2/xyhT8F6UCciAoqJTXFud8S8FGoNNLhREIXzFrEZqUNm19ZPluZ1SN1C/Er20ETTgDoxv3q47NrBZrwL6WPDlsO04E3TVLL5TYHmsQvhp/Rc/UMqlrzN3v4cc4FFokkYRSISLF2XjjzhKjIGDSPSCNuBrxSArJR0+soVUHBrnAzINSkC8SprwuxnLd/kuU5wpqGioOElpiMfBYhmOkJTYhKAbWo0U70bitADU7BgGbTxeRqExVrAMJblr2cyW6K6v7UXS4uvFHI4K6diPX5UDlybfdRs7FIVGaNFGJOzs70WcZDiI+oP1dxqyPGU2ajnswSBZ0zEelq3BwSXyP+w1gMPMtFFF6v+b94tvCx0CCKn/s5VB0TyDW33aINcP8qNXZM0IUzQWY+5GYWekkOtsA3dznbISnDR3t4vPVUV7o+UVg3w+wGXdHLBOtxhzeaQgM+rFb5BOrtsDpxa5fc21ML2D2utFBgpQu65Pj9vj50GIVW5slqSAbDlZUU13FHZzzBiSFgbCBi1HRwDmEDlnAm4Lr8/K6BV1gzIZPncdXVazNkX+h37n0zOnjUj0lBusFOltmNFpAk7RJ3UxVz+iLl/gFEepl08hkp6E9TDJ5tfRO0JCYfv011S0p+i5HlpBPA5Y/FZIKGzxyzwhrzbGhr9jwpja+oPWf5KUiMnjwTYxm47opQB7RK5fI2We4tMI6rQN3bfL6P33Fo2KmdQq+xbiWQW2e5qZBA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pqbBZoe44jZESvkoc71T6/O9648MjRKnuHX5oXmXT3ZyGQW/4E5x0qny1UZ2?=
 =?us-ascii?Q?qzCYOGd/h6SI7THJz37SIHDJjFmPP8BDM2YCWlNb2f1UILb87CifeXPZ6Odn?=
 =?us-ascii?Q?z+1J8wVu15rmWcFnS3FHl7AOEhGAghXuKk4eke0rS3uqso5NMfRNhKL5XYoo?=
 =?us-ascii?Q?rJcxI/qDazxHP0NISkyQ1SQCoC+1LRX0P/tH4tclDOqfC61ZkY50bEg3L5q4?=
 =?us-ascii?Q?pfAvuUzuKViRT8HIfMab63m+awpKYzTy2FCYgsBDmsllFO/DNMPeVeiQRAvR?=
 =?us-ascii?Q?VXja7yM+8e3HvnWIHGDim9l9nDnOwziCTuroB1og6oVh9EqrF+KA+xhByrR7?=
 =?us-ascii?Q?uwi5CTtQ227q1IkVbXTaWyE+xV6Lu/bMOfSiIRaUSvzOn3EEw7qhtiqUTAYJ?=
 =?us-ascii?Q?lsKUxKdeXf+kAf5Qfga6iyDMkbJU9x0Mfb0c36m5WtTa8Gm1dkruiTcxdg++?=
 =?us-ascii?Q?IfCI3l0yK6ks2n7CcoxIwzJTd57sUCdjYRS4UrCPnFyYuZgEJbowzFnV+aes?=
 =?us-ascii?Q?SaQOTeHcZVjr956R/BF+Po/MQoyES70QQHeVSpnAGboh2Fcz4LfsHhxM4Fg4?=
 =?us-ascii?Q?6L5xZTA3CrMS8W4qe6gXzukn4ISNq2arW0p3OrE/0r5H5KcSegNNVpgofuU6?=
 =?us-ascii?Q?HDtZQRz2PdTtXwC1SG+lHiPzDu3/9xn7hJlFL6Ws/gbJYA3i+SNkvthB3Grm?=
 =?us-ascii?Q?OHSBzhW2S3TtNGU2RZhLdencV8r1vRCFo7u0uOHoPQEF23F0faIp/QeJVbuq?=
 =?us-ascii?Q?EfPkdNy79SGeIGmUwnkAR3kuP940bM8XmwPhVb6+GxRhBmIkTRQnCmU3I2cA?=
 =?us-ascii?Q?RTaiZ8Wi1Gf6CgJ1N33sSmDwjgwYFmZNjzLE2i3FVXmWAV7tyNSdHUZKHBeQ?=
 =?us-ascii?Q?VU+lTXE++4ICGGmiU1B+O735PBs78d/iUIlajAPbfOkUlXuo5K4ksQgI6waq?=
 =?us-ascii?Q?tAxMg1IiI0rLtMUdAkFodUz9w/2865O3NYH4FRAmAZ7fJGRYSYU8dxay89DR?=
 =?us-ascii?Q?TLSAbah6vCTEiK5cWu22rXuKUwkzj1vqr+QzKkBD3YY8XEYoXIuOqXExDdxA?=
 =?us-ascii?Q?rNYPXVRfGUExoDwqlr8EckDsrX/rolec56825bdRhFvhriDlhy9UWyhYL+KR?=
 =?us-ascii?Q?VcBGVvvQl324ij1v5kTtJWWi9fNJzj/PaRbvp62SpRNjA2Y2J6het3/18M60?=
 =?us-ascii?Q?P2KwHdYBWbybrLdkmRgPqomnNCjVFQ1BLpjYuwUhACu/VB6Vit8UKzevw8ip?=
 =?us-ascii?Q?sugbadSUY5X+Zs8b0JO6a0oSJgzeO2A91/UP+Klk5B8bqRiqDrCZ99KfttWw?=
 =?us-ascii?Q?v0ksbeEUKsP2Ves2oBag6uhdI/FX/WcDoMcbT41AlKl9TQ4nde5ZnvmydNSw?=
 =?us-ascii?Q?xPtRihHHpRMj3FANVz4LRj71shH0qITTUIOdVfUdx54pTpWC+k9vKpl0hUaP?=
 =?us-ascii?Q?6xx2dywe3+dJTu7iFQPmUYzpIU2kUhiOj48EPmUArQ2tVo5DJ3+4Dw7jgdn4?=
 =?us-ascii?Q?H16q48OzXA2dGwx7eG+giQ/vbLRLVpU9V+9k8jQt3p03NvDwYjZoOYKSzi9O?=
 =?us-ascii?Q?NTTFddvwNfulqI4j3AR1I5gSl11tFrWia4heayGuquDzvlxu8ald5SpdFTzL?=
 =?us-ascii?Q?Jwqp4tLewhJo04ikywq2oxpHjpNdo8rc3pglnuchwAY1ABRNiiphKN6v4Z4T?=
 =?us-ascii?Q?hBtuelzEM94/CgWnoMOSvJrCNHZjEiVShO+iaSMvCdi20Zct?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb48b33-b684-4839-03c0-08df247d2aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 14:13:31.6964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ccKycLl/VY2RRR4pHTMetHhTRTW/ZcMIGqCz+2ClaFh3/LjXOGlUlP2BKH6AxV7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950
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

(Vitaly specifically requested that his Signed-off-by be preserved here, as=
 this is a modification of his original tests)

David Francis

________________________________________
From: Francis, David <David.Francis@amd.com>
Sent: Wednesday, October 7, 2026 10:12 AM
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com; Prosyak, Vitaly; Kamil Konieczny; Sebastian =
Brzezinka; Koenig, Christian; Simona Vetter; Deucher, Alexander; Francis, D=
avid
Subject: [PATCH] tests/intel: Add edge case and race condition tests for GE=
M_CHANGE_HANDLE

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
functionality, edge cases, and race conditions of this ioctl against
itself, gem close, gem create, and prime import and export.

GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IG=
T
coverage is a prerequisite for validating the eventual kernel-side ioctl
implementation and makes fixing its security bugs safer.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
---
 tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 748 insertions(+)
 create mode 100644 tests/intel/gem_change_handle.c

diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handl=
e.c
new file mode 100644
index 000000000..23f2f8b39
--- /dev/null
+++ b/tests/intel/gem_change_handle.c
@@ -0,0 +1,747 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ * Copyright 2026 Intel Corporation
+ *
+ * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
+ *
+ * NOTE: This test is located in tests/intel/ directory because:
+ * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
+ *    of GPU vendor, following IGT convention for GEM-related tests
+ * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creati=
on
+ *    on Intel platforms, though it works vendor-agnostically via DRM core
+ * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functiona=
l-*)
+ *    were proposed by Simona Vetter (Intel), hence Intel copyright header
+ *
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
+#include <sched.h>
+#include <semaphore.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/stat.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+
+/* AMDGPU includes (if available) */
+#if __has_include("igt_amd.h")
+#include "lib/amdgpu/amd_memory.h"
+#include "igt_amd.h"
+#define HAS_AMDGPU 1
+#else
+#define HAS_AMDGPU 0
+#endif
+
+#define BO_SIZE (16 * 1024)
+#define RACE_DURATION_SEC 1
+
+static bool verbose_logging;
+
+/**
+ * TEST: gem change handle
+ * Description: tests for drm ioctl GEM_CHANGE_HANDLE
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: GEM handles
+ * Functionality: gem change handle
+ * Feature: gem
+ * Run type: FULL
+ *
+ * SUBTEST: sanity
+ * Description: Changing a handle to a new value works as intended
+ *
+ * SUBTEST: change_prime
+ * Description: Changing a handle affects the result of prime import
+ *
+ * SUBTEST: new_handle_zero
+ * Description: Changing a handle to 0 should fail
+ *
+ * SUBTEST: new_handle_exceeds_int_max
+ * Description: Changing a handle to > INT_MAX should fail
+ *
+ * SUBTEST: new_handle_equals_old_handle
+ * Description: Changing a handle to itself should fail
+ *
+ * SUBTEST: new_handle_taken
+ * Description: Changing a handle to a value already in use should fail
+ *
+ * SUBTEST: invalid_handle
+ * Description: Changing a non-existent handle should fail
+ *
+ * SUBTEST: race_change_change
+ * Description: Test for race conditions between two GEM_CHANGE_HANDLE
+ *
+ * SUBTEST: race_change_create_close
+ * Description: Test for race conditions between GEM_CHANGE_HANDLE, GEM_CR=
EATE, and GEM_CLOSE
+ *
+ * SUBTEST: race_change_export_import
+ * Description: Test for race conditions between GEM_CHANGE_HANDLE, prime =
export, and prime import
+ */
+
+IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANGE_HA=
NDLE");
+
+/* Structs */
+
+/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers *=
/
+#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
+struct drm_gem_change_handle {
+       __u32 handle;
+       __u32 new_handle;
+};
+
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_chang=
e_handle)
+#endif
+
+/* Driver type detection */
+enum gpu_driver {
+       DRIVER_TYPE_UNKNOWN =3D 0,
+       DRIVER_TYPE_I915,
+       DRIVER_TYPE_AMDGPU,
+};
+
+/* GPU context structure */
+struct gpu_ctx {
+       int fd;
+       enum gpu_driver driver;
+};
+
+/* Helpers */
+
+static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
+{
+       uint32_t handle =3D 0;
+
+       switch (ctx->driver) {
+       case DRIVER_TYPE_I915: {
+               struct drm_i915_gem_create create =3D { .size =3D size };
+
+               do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
+               handle =3D create.handle;
+               break;
+       }
+       case DRIVER_TYPE_AMDGPU:
+#if HAS_AMDGPU
+               handle =3D igt_amd_create_bo(ctx->fd, size);
+#else
+               igt_require_f(0, "AMDGPU header not found for AMDGPU driver=
\n");
+#endif
+               break;
+       default:
+               igt_assert_f(0, "Unsupported driver\n");
+       }
+
+       igt_assert(handle !=3D 0);
+       return handle;
+}
+
+static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
+{
+       struct drm_gem_close close_args =3D { .handle =3D handle };
+
+       return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
+}
+
+static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, uin=
t32_t new_handle)
+{
+       struct drm_gem_change_handle args =3D {
+               .handle =3D old_handle,
+               .new_handle =3D new_handle,
+       };
+       return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
+}
+
+static enum gpu_driver detect_driver(int fd)
+{
+       /* Check AMDGPU first (primary target) */
+       if (is_amdgpu_device(fd))
+               return DRIVER_TYPE_AMDGPU;
+       if (is_i915_device(fd))
+               return DRIVER_TYPE_I915;
+       return DRIVER_TYPE_UNKNOWN;
+}
+
+/* Sanity and Functionality tests */
+
+/**
+ * test_sanity - verify rename actually works
+ *
+ * After a successful rename:
+ * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
+ * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
+ */
+static void test_sanity(struct gpu_ctx *ctx)
+{
+       uint32_t handle, new_h;
+       int ret;
+
+       handle =3D gem_create_bo(ctx, 4096);
+       new_h =3D handle + 1000;
+
+       /* Perform the rename */
+       ret =3D gem_change_handle(ctx, handle, new_h);
+       igt_assert_f(ret =3D=3D 0,
+                    "gem_change_handle(%u -> %u) failed: %s\n",
+                    handle, new_h, strerror(errno));
+
+       /* Old handle must be invalid now */
+       ret =3D gem_close_bo(ctx, handle);
+       igt_assert_f(ret < 0 && errno =3D=3D EINVAL,
+                    "GEM_CLOSE(old_handle=3D%u) should fail with EINVAL, "
+                    "got ret=3D%d errno=3D%d (%s)\n",
+                    handle, ret, errno, strerror(errno));
+
+       /* New handle must be valid */
+       ret =3D gem_close_bo(ctx, new_h);
+       igt_assert_f(ret =3D=3D 0,
+                    "GEM_CLOSE(new_handle=3D%u) should succeed, "
+                    "got ret=3D%d errno=3D%d (%s)\n",
+                    new_h, ret, errno, strerror(errno));
+}
+
+/**
+ * test_change_export - changing a handle affects prime import
+ *
+ * Importing a prime object that has had its handle changed since it was
+ * exported should get the new handle
+ */
+static void test_change_export(struct gpu_ctx *ctx)
+{
+       int ret, handle1, handle2, dmabuf_fd, imported_handle;
+
+       /* Create a handle and export it */
+       handle1 =3D gem_create_bo(ctx, 4096);
+       handle2 =3D handle1 + 1;
+       dmabuf_fd =3D prime_handle_to_fd(ctx->fd, handle1);
+
+       /* When you import, you get the same handle back */
+       imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
+       igt_assert_eq(imported_handle, handle1);
+
+       /* Change the handle (should succeed) */
+       ret =3D gem_change_handle(ctx, handle1, handle2);
+       igt_assert_eq(ret, 0);
+
+       /* Import, should get the new handle */
+       imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
+       igt_assert_eq(imported_handle, handle2);
+
+       /* Confirm gem object is at the new handle */
+       igt_assert_eq(gem_close_bo(ctx, handle2), 0);
+
+       ret =3D gem_close_bo(ctx, handle1);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       close(dmabuf_fd);
+}
+
+/* Edge case and fail case tests */
+
+/**
+ * test_new_handle_zero - new_handle =3D 0 should fail
+ *
+ * 0 is not a valid gem handle.
+ */
+static void test_new_handle_zero(struct gpu_ctx *ctx)
+{
+       uint32_t handle;
+       int ret;
+
+       handle =3D gem_create_bo(ctx, 4096);
+
+       /* new_handle =3D 0 must fail with -EINVAL */
+       ret =3D gem_change_handle(ctx, handle, 0);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       /* Original handle should still be valid */
+       igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
+ *
+ * The kernel enforces an idr_alloc() limitation: new_handle must be <=3D =
INT_MAX.
+ */
+static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
+{
+       uint32_t handle;
+       int ret;
+
+       handle =3D gem_create_bo(ctx, 4096);
+
+       /* new_handle > INT_MAX must fail with -EINVAL */
+       ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       /* Also test 0xFFFFFFFF */
+       ret =3D gem_change_handle(ctx, handle, 0xFFFFFFFF);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       /* Original handle should still be valid */
+       igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_equals_old_handle - new_handle =3D old_handle should fa=
il
+ *
+ * The ioctl treats old_handle =3D new_handle as invalid input.
+ */
+static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
+{
+       uint32_t handle;
+       int ret;
+
+       handle =3D gem_create_bo(ctx, 4096);
+
+       /* new_handle =3D old_handle must fail with -EINVAL */
+       ret =3D gem_change_handle(ctx, handle, handle);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       /* same thing if handle doesn't exist */
+       ret =3D gem_change_handle(ctx, handle + 1, handle + 1);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, EINVAL);
+
+       /* Original handle should still be valid */
+       igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_taken - new_handle being the handle of another gem obje=
ct must fail
+ *
+ * Not allowed to change a handle to a handle that's already taken
+ */
+static void test_new_handle_taken(struct gpu_ctx *ctx)
+{
+       uint32_t handle, handle_2;
+       int ret;
+
+       handle =3D gem_create_bo(ctx, 4096);
+       handle_2 =3D gem_create_bo(ctx, 4096);
+
+       /* new_handle is taken must fail with -ENOSPC (direct from idr_allo=
c) */
+       ret =3D gem_change_handle(ctx, handle, handle_2);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, ENOSPC);
+
+       /* And the other way */
+       ret =3D gem_change_handle(ctx, handle_2, handle);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, ENOSPC);
+
+       /* Original handles should still be valid */
+       igt_assert_eq(gem_close_bo(ctx, handle), 0);
+       igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
+}
+
+/**
+ * test_invalid_handle - non-existent handle should fail
+ *
+ * Using a handle that doesn't exist should return -ENOENT.
+ */
+static void test_invalid_handle(struct gpu_ctx *ctx)
+{
+       int ret;
+
+       /* Use a handle that was never allocated */
+       ret =3D gem_change_handle(ctx, 0xDEAD, 0xBEEF);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, ENOENT);
+
+       /* Handle 0 is also invalid */
+       ret =3D gem_change_handle(ctx, 0, 100);
+       igt_assert(ret < 0);
+       igt_assert_eq(errno, ENOENT);
+}
+
+/* Race condition test structs and helpers */
+
+struct change_handle_thread_data {
+       struct gpu_ctx *ctx;
+       uint32_t handles[4];
+       bool running;
+       int unexpected_errno;
+       pthread_barrier_t barrier;
+};
+
+static void set_up_context(struct change_handle_thread_data *data, struct =
gpu_ctx *ctx)
+{
+       data->handles[0] =3D gem_create_bo(ctx, BO_SIZE);
+       igt_assert(data->handles[0] !=3D 0);
+       data->handles[1] =3D gem_create_bo(ctx, BO_SIZE);
+       igt_assert(data->handles[1] !=3D 0);
+
+       data->ctx =3D ctx;
+       data->handles[2] =3D max(data->handles[0], data->handles[1]) + 0x10=
;
+       data->handles[3] =3D max(data->handles[0], data->handles[1]) + 0x20=
;
+       data->unexpected_errno =3D 0;
+       __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
+
+       pthread_barrier_init(&data->barrier, NULL, 2);
+}
+
+/* Race condition test threads */
+
+static void *change_handle_thread(void *arg)
+{
+       struct change_handle_thread_data *data =3D arg;
+       uint32_t *h =3D data->handles;
+       int from[] =3D {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2=
], h[1], h[0], h[2]};
+       int to[] =3D   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0=
], h[3], h[3], h[1]};
+       int ret;
+
+       pthread_barrier_wait(&data->barrier);
+
+       while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+               for (int i =3D 0; i < 12; i++) {
+                       ret =3D gem_change_handle(data->ctx, from[i], to[i]=
);
+                       /*
+                        * Expected errors:
+                        * - ENOENT: old handle invalid
+                        * - ENOSPC: target handle occupied (collision dete=
cted during idr_alloc)
+                        */
+                       if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D E=
NOSPC)
+                               data->unexpected_errno =3D errno;
+               }
+
+               sched_yield();
+       }
+
+       return NULL;
+}
+
+static void *close_recreate_thread(void *arg)
+{
+       struct change_handle_thread_data *data =3D arg;
+       uint32_t *h =3D data->handles;
+       pthread_t tid =3D pthread_self();
+       int handle, i, ret;
+
+       pthread_barrier_wait(&data->barrier);
+
+       while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+               /* Close a handle; keep trying until success */
+               i =3D 0;
+               while (true) {
+                       ret =3D gem_close_bo(data->ctx, h[i]);
+                       if (ret =3D=3D 0) {
+                               if (verbose_logging) {
+                                       igt_info("[CLOSE-TID:%lu] Closed ha=
ndle %u\n",
+                                                (unsigned long)tid, h[i]);
+                               }
+                               break;
+                       }
+
+                       i +=3D 1;
+                       if (i > 3)
+                               i =3D 0;
+
+                       if (!__atomic_load_n(&data->running, __ATOMIC_ACQUI=
RE))
+                               return NULL;
+               }
+
+               /* Open a handle */
+               handle =3D gem_create_bo(data->ctx, BO_SIZE);
+               if (verbose_logging) {
+                       igt_info("[CLOSE-TID:%lu] Created new BO with handl=
e %u\n",
+                                (unsigned long)tid, handle);
+               }
+
+               /* If the opened handle isn't one of the four ones being
+                * shuffled, change_handle it in. Keep trying until success=
.
+                */
+               if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2=
] && handle !=3D h[3]) {
+                       i =3D 0;
+                       while (true) {
+                               ret =3D gem_change_handle(data->ctx, handle=
, h[i]);
+                               if (ret =3D=3D 0) {
+                                       if (verbose_logging) {
+                                               igt_info("[CLOSE-TID:%lu] C=
hange handle %u to %u\n",
+                                                        (unsigned long)tid=
, handle, h[i]);
+                                       }
+                                       break;
+                               }
+
+                               if (ret !=3D 0 && errno !=3D ENOENT && errn=
o !=3D ENOSPC)
+                                       data->unexpected_errno =3D errno;
+
+                               i +=3D 1;
+                               if (i > 3)
+                                       i =3D 0;
+
+                               if (!__atomic_load_n(&data->running, __ATOM=
IC_ACQUIRE))
+                                       return NULL;
+                       }
+               }
+
+               sched_yield();
+       }
+
+       return NULL;
+}
+
+static void *export_import_thread(void *arg)
+{
+       struct change_handle_thread_data *data =3D arg;
+       struct drm_prime_handle prime_args;
+       uint32_t *h =3D data->handles;
+       pthread_t tid =3D pthread_self();
+       int handle, i, ret, dmabuf_fd;
+
+       pthread_barrier_wait(&data->barrier);
+
+       while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+               /* Export a handle; keep trying until success */
+               i =3D 0;
+               while (true) {
+                       prime_args.handle =3D h[i];
+                       prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
+                       ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HA=
NDLE_TO_FD, &prime_args);
+                       if (ret =3D=3D 0) {
+                               if (verbose_logging) {
+                                       igt_info("[PRIME-TID:%lu] Exported =
handle %u\n",
+                                                (unsigned long)tid, h[i]);
+                               }
+                               break;
+                       }
+
+                       i +=3D 1;
+                       if (i > 3)
+                               i =3D 0;
+
+                       if (!__atomic_load_n(&data->running, __ATOMIC_ACQUI=
RE))
+                               return NULL;
+               }
+
+               dmabuf_fd =3D prime_args.fd;
+
+               /* Import the handle; it should be one of the four handles =
in the shuffle */
+               prime_args.fd =3D dmabuf_fd;
+               prime_args.flags =3D 0;
+               ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HAND=
LE, &prime_args);
+
+               igt_assert_eq(ret, 0);
+               handle =3D prime_args.handle;
+               if (verbose_logging) {
+                       igt_info("[PRIME-TID:%lu] Imported; got handle %u\n=
",
+                                (unsigned long)tid, handle);
+               }
+               igt_assert(handle =3D=3D h[0] || handle =3D=3D h[1] || hand=
le =3D=3D h[2] || handle =3D=3D h[3]);
+
+               close(dmabuf_fd);
+
+               sched_yield();
+       }
+
+       return NULL;
+}
+
+/* Race condition tests */
+
+/**
+ * test_race_change_change - Test for race conditions of change_handle aga=
inst itself
+ *
+ * Start two threads, each of which constantly attempt changes between fou=
r different handles
+ * Try to catch race conditions such as changing same handle to two differ=
ent handles,
+ * Changing two handles to the same handle, changing a handle to a handle =
itself being changed,
+ * etc.
+ */
+static void test_race_change_change(struct gpu_ctx *ctx)
+{
+       pthread_t thread_change_1, thread_change_2;
+       struct change_handle_thread_data data =3D {0};
+       int num_handles, ret;
+
+       set_up_context(&data, ctx);
+
+       /* Start both threads simultaneously */
+       igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handle_=
thread, &data), 0);
+       igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handle_=
thread, &data), 0);
+
+       /* Let them race */
+       sleep(RACE_DURATION_SEC);
+
+       __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+       pthread_join(thread_change_1, NULL);
+       pthread_join(thread_change_2, NULL);
+
+       pthread_barrier_destroy(&data.barrier);
+
+       igt_assert_eq(data.unexpected_errno, 0);
+
+       /* Exactly two gem objects should still exist */
+       num_handles =3D 0;
+       for (int i =3D 0; i < 4; i++) {
+               ret =3D gem_close_bo(ctx, data.handles[i]);
+
+               if (ret =3D=3D 0) {
+                       num_handles +=3D 1;
+               } else {
+                       igt_assert_eq(errno, EINVAL);
+               }
+       }
+       igt_assert_eq(num_handles, 2);
+}
+
+/**
+ * test_race_change_create_close - Test for race conditions of change_hand=
le against gem create / close
+ *
+ * Start two threads, one of which attempts to change between four handles=
 while the other alternates
+ * closing a gem handle and creating new ones. Test for race conditions su=
ch as change a handle that's
+ * being closed or change a handle to a value that's being created.
+ */
+static void test_race_change_create_close(struct gpu_ctx *ctx)
+{
+       pthread_t thread_change, thread_create_close;
+       struct change_handle_thread_data data =3D {0};
+       int num_handles, ret;
+
+       set_up_context(&data, ctx);
+
+       /* Start both threads simultaneously */
+       igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_th=
read, &data), 0);
+       igt_assert_eq(pthread_create(&thread_create_close, NULL, close_recr=
eate_thread, &data), 0);
+
+       /* Let them race */
+       sleep(RACE_DURATION_SEC);
+
+       __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+       pthread_join(thread_change, NULL);
+       pthread_join(thread_create_close, NULL);
+
+       pthread_barrier_destroy(&data.barrier);
+
+       igt_assert_eq(data.unexpected_errno, 0);
+
+       /* Depending on where create / close ended up, there can be 1 or 2 =
handles open */
+       num_handles =3D 0;
+       for (int i =3D 0; i < 4; i++) {
+               ret =3D gem_close_bo(ctx, data.handles[i]);
+
+               if (ret =3D=3D 0) {
+                       num_handles +=3D 1;
+               } else {
+                       igt_assert_eq(errno, EINVAL);
+               }
+       }
+       igt_assert(num_handles >=3D 1 && num_handles <=3D 2);
+}
+
+/**
+ * test_race_change_export_import - Test for race conditions of change_han=
dle against prime export / import
+ *
+ * Start two threads, one of which attempts to change between four handles=
 while the other exports
+ * handles, then imports them again. Check for race conditions such as cha=
nging a handle while exporting
+ * it or important a handle while changing it.
+ */
+static void test_race_change_export_import(struct gpu_ctx *ctx)
+{
+       pthread_t thread_change, thread_export_import;
+       struct change_handle_thread_data data =3D {0};
+       int num_handles, ret;
+
+       set_up_context(&data, ctx);
+
+       /* Start both threads simultaneously */
+       igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_th=
read, &data), 0);
+       igt_assert_eq(pthread_create(&thread_export_import, NULL, export_im=
port_thread, &data), 0);
+
+       /* Let them race */
+       sleep(RACE_DURATION_SEC);
+
+       __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+       pthread_join(thread_change, NULL);
+       pthread_join(thread_export_import, NULL);
+
+       pthread_barrier_destroy(&data.barrier);
+
+       igt_assert_eq(data.unexpected_errno, 0);
+
+       /* Exporting a handle doesn't close it, so should still be exactly =
2 */
+       num_handles =3D 0;
+       for (int i =3D 0; i < 4; i++) {
+               ret =3D gem_close_bo(ctx, data.handles[i]);
+
+               if (ret =3D=3D 0) {
+                       num_handles +=3D 1;
+               } else {
+                       igt_assert_eq(errno, EINVAL);
+               }
+       }
+       igt_assert_eq(num_handles, 2);
+}
+
+int igt_main()
+{
+       struct gpu_ctx ctx =3D { .fd =3D -1 };
+
+       igt_fixture() {
+               ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
+               igt_require(ctx.fd >=3D 0);
+
+               ctx.driver =3D detect_driver(ctx.fd);
+               igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
+                             "Unsupported GPU driver\n");
+
+               if (ctx.driver =3D=3D DRIVER_TYPE_I915)
+                       igt_require_gem(ctx.fd);
+       }
+
+       igt_describe("Sanity Test: Change handle actually changes handle");
+       igt_subtest("sanity")
+               test_sanity(&ctx);
+
+       igt_describe("Functinality Test: Change handle affects result of pr=
ime import");
+       igt_subtest("change_prime")
+               test_change_export(&ctx);
+
+
+       igt_describe("Edge Case: New handle =3D 0 should fail");
+       igt_subtest("new_handle_zero")
+               test_new_handle_zero(&ctx);
+
+       igt_describe("Edge Case: New handle > INT_MAX should fail");
+       igt_subtest("new_handle_exceeds_int_max")
+               test_new_handle_exceeds_int_max(&ctx);
+
+       igt_describe("Edge Case: Changing a handle to itself should fail");
+       igt_subtest("new_handle_equals_old_handle")
+               test_new_handle_equals_old_handle(&ctx);
+
+       igt_describe("Edge Case: Change a handle to a value which is taken =
should fail");
+       igt_subtest("new_handle_taken")
+               test_new_handle_taken(&ctx);
+
+       igt_describe("Edge Case: Changing a non-existent handle should fail=
");
+       igt_subtest("invalid_handle")
+               test_invalid_handle(&ctx);
+
+
+       igt_describe("Race: Changing handle vs. Changing handle");
+       igt_subtest("race_change_change")
+               test_race_change_change(&ctx);
+
+       igt_describe("Race: Changing handle vs. Create / Close");
+       igt_subtest("race_change_create_close")
+               test_race_change_create_close(&ctx);
+
+       igt_describe("Race: Changing handle vs. Export / Import");
+       igt_subtest("race_change_export_import")
+               test_race_change_export_import(&ctx);
+
+       igt_fixture() {
+               drm_close_driver(ctx.fd);
+       }
+
+}
\ No newline at end of file
diff --git a/tests/meson.build b/tests/meson.build
index 4f5c9be7b..ab083916d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -104,6 +104,7 @@ intel_i915_progs =3D [
        'gem_blits',
        'gem_busy',
        'gem_caching',
+       'gem_change_handle',
        'gem_create',
        'gem_ccs',
        'gem_close',
--
2.34.1

