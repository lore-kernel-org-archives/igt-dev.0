Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6B8CA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 17:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6810F6FF;
	Wed,  7 Oct 2026 17:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R/QanCur";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5382B10F6FF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 17:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwDkmUGa7Nt8hnAiUzMKCv6zHbOQaoi2HpUAZ+fTPcE4ZyKgXX5G1x3qxSX4/TxQQjLoitlK35xjKkBL8ik//8Yf6UIbr8Z/WOGrKNhMepsTITQXitVM4HPl9n7HgrCG2BREwgzKIOmNlpwQlYZBEmHCycnpolohk0ATQJdTHlEyOJat/6RJUt92A4bD4X7gimOGV4R8l+OSpLIW6zu/qeTsxF1qv+h6/weOck+6uILh6q5c9iadNPDu0g/VF6lj8nsbq8KysDPio5pyHlopOqDoker3nkN5FIxAnfqYDUNLBEVOOAi+pHrO8FbwWUffABbfRxSf+lHplv4CaTVWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OuI5XtrBRoa49Z47TD/v1ojgKYPzOmAq7sbS0zj2b0=;
 b=fnjbcJte+pVMeGTtZshS6GAmKqJ1cUcblQ+QqLxy6vGpKRYQn6di8che4FHdGnTDcVsqT9Fg7H1xr5jQ07iy5dw2sJGwO7rqIc5A3pAS3IV0A6+EhueVPG1bY53UcVr8QCpi+fIrnyFpYQ3Ej9uL1XweKmfPGizkOMBNHVEmjSt5dK5i9AoRVe0fiqASu/R49o9RiRIHmYxZdalSGQIlixjLCfLtmW9m0bYPxbj6HrslZY/2+wMXRxTimm6UZPebymyDWvJ3wSa5nTXQo5mNpDowM2oX0AQS4r/HF84483G311tRPVV8j5uOvFi7r9OSRQiY8rGyX6Egb5dpjvAgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OuI5XtrBRoa49Z47TD/v1ojgKYPzOmAq7sbS0zj2b0=;
 b=R/QanCurCO37zwSEGx5hzhCglYF3n4bgW/Vs0dspSPhXFTX/2Z2ClsF2xYx/131IqlAApDsH/oPNN24LU0QuIVY1ehBkR9WFVVGhJX+xhDnsnRnHnO2ZO7jgPTkoNcROOIhIuT2SUOgufIt5AoiszapQY++1dzZJ9e1SJkn/DqA=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 17:05:07 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec%6]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 17:05:07 +0000
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
Thread-Index: AQHdVmXmMW9uqLKDx0S/oDHXh66Ci7byHxpngAAwFHs=
Date: Wed, 7 Oct 2026 17:05:07 +0000
Message-ID: <SA1PR12MB8144C9D213F600F69E3BEBD0EF942@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <SA1PR12MB814451AAAA230BA088A37A2BEF942@SA1PR12MB8144.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB814451AAAA230BA088A37A2BEF942@SA1PR12MB8144.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-07T17:05:07.148Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|CY5PR12MB6621:EE_
x-ms-office365-filtering-correlation-id: e02c0224-f102-4cd3-127e-08df249523a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info: rJIn5GSqUQhbO46h231GHjHOEtGgIu3B3kLErTuyiPN1iMeoSrpvPUKfSlNw2tQRSF34+UEOYLaeP/Ux1VI5b6ElUaffe4C2m24IISzzA9UBPkJwCMovMsH/q0Kqm5g93BuOmucQMKEE4Fl/1hmmMCzBKSoySlJINsloviAUCbrZSq3GWjp5eZW5bQpZ+TXtusjANS75zFYzHKpwkdzfeqjsxbPd9rrSkwwq+nrVN93NAeTOXzIJ4fYOXO+988j1VBF+csNUijskj70nuUp47TFIl19Pq8UPMenq9pglhqXXURiHI7Y2SYPJZilcNRsAZ1JtwSOWmjQWM0egNXuSruDJFjVLLoUH1mhdG+XndPS/cbvCWATbXllSu+XtFigOdvC2jjdh2tGI6G458+cfo4SjxS1Hkqknfw6922Od4+FpAxPcgX2HX49zZlRpwbJeVqx5Vq4UIJ9UY3YZZE4KVryEdMK3w/MP7aYCuWNBFpsvwbrYw5STnH3UbR9dSsaghngV3p4bcAl1IO801VBOF7s3KjOOLnDoW0gkqAf5CQ0cWk58vtBhrQ1wLKlzyAEVCvjP65ZGrs0cXij3enV9MwSj6gctlk/c8kvhk+rjvKNyHeefv5jH8z18PZsOPvshY11qLd8GObTLb8R9U/X/WeBRrSb9SUNIwwBPsVXAmCmu29g8gpR0MuH28M0bgX1ZGfCJM+xsav28R4DuRYHR6EVBPWUkJ3E9wMzVoEpxr8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9WUtsvWaP83WHgo4MqawN4E+gsbFrfH43C37+yfag82jQRFXf5caGo70xTBM?=
 =?us-ascii?Q?BV5r9yaZW5mflZSPTa3poTat3B/FtPe62QjB0lW3IThaC1gVtAchcAHA6ux/?=
 =?us-ascii?Q?a4pOjTrYwwsVcnz7W3rByR+aWJUaCl7BdBs9Fjtp21dJJvPQQeKBIOdKGT+y?=
 =?us-ascii?Q?o8ruHXtdMTMFIMDefnsYi+Nbi0lBhFI3JYw1TPl2jowXIJpB1O7q1mqNTRMn?=
 =?us-ascii?Q?6GrQZo7Xx9En2svlQYEKbNLKR6sgORELqiiImzGsVPUSJf7L7pqYQdZRDlIE?=
 =?us-ascii?Q?3MDuDR65+L2CyPVeAMWib98SA3pMPy1MEYAiD3b097gfiWs+veL/vrBI+q8r?=
 =?us-ascii?Q?GeHrfsmOaQW8pPDRg0w1YwrFhMmsaljtPwE30Yw/6ZWW1ZuysotG+PjAjVio?=
 =?us-ascii?Q?8Jo/U4jJvSinYnaofaBsY8IHheqE/Sw3R2yeswfs68EMRqKV45Hg90HHfydo?=
 =?us-ascii?Q?oqRC9ywzqweD9WMVAHJKJEjvqiwV1XWl10OLmw5cZwWfhCktmYciCxaIHS1/?=
 =?us-ascii?Q?XYsHe8Wc9Os8SI/UIekWVoAfIjpheIYzvpHWDUWiooCiUJSPdGogxPdE+ycN?=
 =?us-ascii?Q?+CGL6onyHyt/zJ3xVhIg4d17xzbYa1BOk9wuexsPRxc/aWBV7t3Lr4gqYYiW?=
 =?us-ascii?Q?+Q2AOys/J73RX7QH0NB3j/ppmAu4alS9onkkb5MFNLBUshtPhMsTZQbLGOrX?=
 =?us-ascii?Q?7gc3z1Yzzcb5erszEp4tjHSK1NCKwxvDZ8rSkjj8V7xtGBAGPmUrA0C9pBzz?=
 =?us-ascii?Q?ydPbR2HIEzczaJEbNGnk3uXoTGdEIBHXNCXGua8t7H89uhYVuyYOQanahL8W?=
 =?us-ascii?Q?T6Fdq6yK0piZ7X13mi8GPGMweqB88dIoahCdudmfZniJ2fcpzpVreZCyYPJF?=
 =?us-ascii?Q?FxSnIOXDHWM1BOUVxFfypdwBEXGGtKg5TN7wiT+boR/PTSoK+iq+d6DR2Fog?=
 =?us-ascii?Q?ePvC0M0tRIy8V3UI1pkb+sScitxFiNMuWLhPmcdkBG/DJHogAoD5WQJw9dHX?=
 =?us-ascii?Q?h2+OBF38Ey3r8KcB8jn7894jUl7+eiVBEX2aHyNBt2eE4jG3OzRHXHiluNp2?=
 =?us-ascii?Q?iBCoIoXS/fLizAkEcV5kJUwLm1JzEekvvB/LRsLa/vK3KXnrwwx0qFMSsMdA?=
 =?us-ascii?Q?1XqXrHSrmfmBAjS5p5rCjozWE6GJ9zlZZGJZgKMu4o82YixrXjeEk9EbyUU3?=
 =?us-ascii?Q?k/Ecrin3obKLZLHXF6QMGW/pydXOrNgP2uvCIrXlRFJ0+a17rNhft7a4A09m?=
 =?us-ascii?Q?+nfCTwDm8UWOPWDKWa7BZUX+pxdH7PNQ3tqC3PSRsAcUUd+i7oLegZHOJBDq?=
 =?us-ascii?Q?kwhD4F24QUVlgcfKpB6RHH56TRq6LrzL4vygfFDJ6nuU3w9r27ySN/B5hCzz?=
 =?us-ascii?Q?ntC8ukt7Kgxk0hhN+dHo3Vhaxl9KjZaqKiDy0K2EvDFFm+Vz1a2ee8t3xdTa?=
 =?us-ascii?Q?V12wrC0+eg9z7Un0FxdUEjX2rLoJoHzxTq5JgP6lFcbGnIEyQsfRNqgmKykz?=
 =?us-ascii?Q?wt4X9/inN4YFWLxcVRjv+VDnI0dmt+6aD1qD0QVDZ0UzeDWP10mqH0JZQl+J?=
 =?us-ascii?Q?TLE0N74C3AhlVqj5Z02toRsskZM0fv79Yy3n485un7a8hPrfigf6dxx+/mdN?=
 =?us-ascii?Q?KtgLmFr7jxfKhBx5zBCvzGzuP5dUivKKZ3XZYsHg5m1xFmXfwIPdH7mqhh6h?=
 =?us-ascii?Q?Vay9k7P3P0+oaMIWnljD/c1O/eCQbZfwvjXJd+cCVVrEWCOJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02c0224-f102-4cd3-127e-08df249523a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 17:05:07.6071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: giOs9R33Ro6NnEtU9zrJA59N0YAYAAnSi0t+PSWQrWR7ZkRtXaMf9bhyrMtE2FTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
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

Things that have changed since Vitaly's last version
- Most of Tvrtko's 31 comments have been taken into account, cleaning up th=
e code overall
- The edge cases and race conditions have been combined into one patch, now=
 gem_change_handle.c
- Removed the change-vs-driver-close tests (reasoning; in my testing these =
tests didn't work that well, and the race conditions raised during kernel d=
iscussion were vs. create and free)
- Removed a lot of info prints to match the style of the other gem tests (n=
ot sure what the standard is on these but it's easy to revise)
- The race tests now all use a setup with two active gem objects swapping a=
round between four different handles; hopefully this can catch more complic=
ated scenarios than were possible with only one object and two handles.
- The ioctl policy on new_handle =3D old_handle has changed in the latest k=
ernel version (following a lot of feedback). It's now an error whether or n=
ot the handle is in use.



________________________________________
From: Francis, David <David.Francis@amd.com>
Sent: Wednesday, October 7, 2026 10:13 AM
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com; Prosyak, Vitaly; Kamil Konieczny; Sebastian =
Brzezinka; Koenig, Christian; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests fo=
r GEM_CHANGE_HANDLE

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

