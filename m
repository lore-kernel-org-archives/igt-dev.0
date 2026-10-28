Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB0606A325
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iR04qs/S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A94810FCBA;
	Wed, 28 Oct 2026 14:03:32 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD910E101
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn1dhL/luoaX++lVO/VDdLFNZd2mu2kaTD+IJrYYMJNL/6pcNs8fmG74ikcNKvRmdcI4F/kuCWD1b6N/2E/f9fSt5CJqZnA0bTtutgBtVny9hXQtVgQuF44doECkvSznQFVERZujV2zRrEDAfTxcTG6NrkTCxpZdWTJ5ZA9DYWfCrsD7sb0CKLxPcIk/0wPAlqLcA0roYRIL6W2e0W6UKFT5h8JWKslgnKjvCB+pbUCBNLYufNr8usKiFxxe1vGSHY+gs3NjyXDsHtS9Ubh/bonlXsS/bWi+MqccRKLuiWiluXu+90A40CnDAjMtSxvOxmslLo7oJ1PJHvtzGFL5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVryU3VcJgVGQtDc7vFwlllsc4fu6Jk2EFC/NA8nOo8=;
 b=t+Pt64N1NhnlAJvNFi2YLqYq6y1GWO1vxnCdnDmQ3DOF5F2ut1Az2t23YQ7qw9qo467SlAkIGGtFK0fIAPXG5q0lDC8sN1HZ+MzqvZhO4uq78LdOT6EnX2wYL3PhN8SCpJtkA6QUaQ6/N5aDk10JwFtPIVGBM8XNIXpTpr50StA8DiP5iniLY2ysLFfysk5Be0ROQA6gLSfp4o1FSI4UK+QKHNpN3e60u6UbEX9q8MfhgxCCs84AXcA2/T9SyjfNxdA7X28JPXuahUu7H5WrGdKJzYk0l9ChJZCe0u93Jg97ZoKlvbdgchQUx1Wv4uQaGebxzx5yh7O3rLD1rSurbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVryU3VcJgVGQtDc7vFwlllsc4fu6Jk2EFC/NA8nOo8=;
 b=iR04qs/S03+g7/Kt949BM4/TacvbeJ5wy1zynMBQF744DFADt22cQNgKMNRnAxEOG06qLqvAFy4XjOi8OsIDB3gXEFH4WDq7jPIrTyBVIt4SwX5CvtPW6C5HU9jGCpXJEG+7q7uYycA4Aqd8clWzhVFGHnLRbHFxpw0zWFyCbX8=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by MW3PR12MB4457.namprd12.prod.outlook.com
 (2603:10b6:303:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:02:31 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 14:02:31 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] tests/amd/gem_list_handles: Add basic test
 for DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES
Thread-Topic: [PATCH i-g-t 02/10] tests/amd/gem_list_handles: Add basic test
 for DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES
Thread-Index: AQHdYv3i8tcHEM+CYki7a7fSc55NPLcTA9MR
Date: Wed, 28 Oct 2026 14:02:31 +0000
Message-ID: <CHAPR12MB999247B0A449B8C9260E9CE183EF6F2@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
 <20261023145032.22650-3-tvrtko.ursulin@igalia.com>
In-Reply-To: <20261023145032.22650-3-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-28T14:02:31.517Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|MW3PR12MB4457:EE_
x-ms-office365-filtering-correlation-id: 803b369a-a1a8-4b5f-0926-08df34fc1c26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261022113327099003|261021121427099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: GUgfsKL4Xm++2WwDO5oD/GhmcyFbo/MJ3QQAT60/jXxqgekGhh61tfoayB6r9JNMIwlsxQdU70PV3OQKq6gEvw0EQJmBQOAdxPuOidUhzbZ19oEVYH10LGnllvaU+eUI9YZZ5WtnLvFMrYVfv7ydg4kLAU0N05kobMMIvbYz39ANKm5RYB/xkix57f+bPs/eauWdm7iAshfu7R8BuLz4Y4SQ/nlkNy0uVNVsDN+PKxWnH8Edn0QIxX+t8cnISeJU+UNLCmLWeshSuCkvBZX4MkjPTDEybUgyxT1VYyUvKZ9ij528gjlSzCQroF2ztLImkB+iMKxU/IDh+lK/Itq1MjyfEdna29cjn6nRGwLyLGGErwcWxGKItMaSoLq0H3R7J+H3XmWkPzfZqC90DDd7fIMPB/oi46sI2ygEvF/MngoT6E49Z/TPXQLFweT19TcxjfwyY3r/tjMlB1QVAq9vMToOGw1BzwURx0Y2cKdQHhawrfjvTLrGiI8C04WC4pEAjHtYHoDAHZkoPA49RpgmfZbCFXTWH7ZBRcJEsmXS1vfyOBwqVFXZB+1v2Ej18BBC0eImtZiAoKrMjW0VmxG5Qsf2tAqAtSTUE2MhO3Hj/UKgoqszzdR0EF4uSC/MTFkkMuGY/ANxF2Qx9hax1ULP7+4hnKjr+Ldutx50Kj3nkCL/scQhd+x8oYl+80xy5lVIYfQs2JFlkPt4JbCl4abZqOFZGf8tOKUHE0pTnKhk1KM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261022113327099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nyDc6yF0w3I9nWyH5x8OMU/L5BP7FRjavNnXBmoONmPdQtVBtGcr3loQTg/W?=
 =?us-ascii?Q?qRCLalYZAoFL3yVckEQWpkalUZFVNgaMGZd6oIS7bMxt9jglp668/EUyWV0Y?=
 =?us-ascii?Q?kctUFaXQac8kUAKodRYjTPnEeslIBTIZ21GNe8bdQi0swmhjAEf2bKXIdK0W?=
 =?us-ascii?Q?3C17Jqy96XP8ucmSob60vuWU2kXHXQUFUHB5+JWOy9I07l3QxCniqk75ireT?=
 =?us-ascii?Q?1xxJT3brI6maCpbkVYfnViEpR+52WiEq8ApbwB02kQ/nhhxS7iFYsU91hMHT?=
 =?us-ascii?Q?+SP6HQY5617BTelU+484ZnuWHk3Ud1TGWE1VxzWeNub9LGBXm5eO7Ly8Encf?=
 =?us-ascii?Q?qsVFVIE8YcvUGwBVAEQBVyjLHCVZ+VeARn5LE2EBxWs7t5TzGbfNVhAJES5I?=
 =?us-ascii?Q?dkQ45+bOMfaW90L+lgJWEkIgeKv/2Fyd1LZzeNdhoOy1SrT/GLxSHvhC8JRG?=
 =?us-ascii?Q?sLxSMrGw2DqdHdyN41lxEl5U0GoJ3m/f4T2awifJhlk3I+33uJtoMO5eS6kZ?=
 =?us-ascii?Q?3z5UOfUN1VoadDK14xLNNh4LCEeRiaNmuyD3hiNKHA0v/7ZU/yuRDEQZkQ0k?=
 =?us-ascii?Q?sT0mLKWljVARjhvv4n7s0mMTBr/559xP4JdbsWZ4L7El5u9E+DmjbMuF/VAn?=
 =?us-ascii?Q?pHLPG/k5jJdGCUZYSsj+WnPiINX1oLTW9w0VltHW0X7VVeEx7P9+fZrdE7nS?=
 =?us-ascii?Q?UyfpmppumLdAVI0+naxMwb5D3fuNr7N0BziJz8c1sk+juVvR44cdPPdhZk0w?=
 =?us-ascii?Q?e56Cj051HOnZnoCVdYfBillifFwVJVafjQNWpKVPtYs7tenK6FtmL78uJbwo?=
 =?us-ascii?Q?tY/psXN0e5W4ZUtDqgF8SAFqNnVFCDxi+x6xm7f5OYFynvbyUI+s6hLlXFl5?=
 =?us-ascii?Q?rQRMNLJNbImH8cKghAzBOmgTVJw4rlnZtXYw5ROuF0ZpIC7cfY+1JWoYNEmO?=
 =?us-ascii?Q?/uWyWP5HZEmm2R4EoB0oVgkxuQRx5jhAO6OstSG9UDTdvMj3kAU3AAHqIxFS?=
 =?us-ascii?Q?rJtFJfAhbR6uaIgjXkOwh0Iz2eTAPqmNyhT6Au5kGjjYmjgoW3mHSDKMypNv?=
 =?us-ascii?Q?W2CJBUwQWwQLjdT+yp7ReEpyk+wfHiuwI4IkW2EHsErf0EMSATlowULQiEgf?=
 =?us-ascii?Q?TS+TRbAqggT665QEcuVZnBQtin4Uj6n5U/jsvsCtoe6/B+1Bug0NonHC0454?=
 =?us-ascii?Q?A/spJugRwXLYj4NOZUwjAeQtW3IKV87+JymTcd/Eg0X4Ez0JTdO5b6pa8rRh?=
 =?us-ascii?Q?f3XkqOAvjSdZ9w+e+IozTEy4rB3XbkMLyuSRa2Y1cp2HMUxmf3Py51va9cZq?=
 =?us-ascii?Q?g6B+3DLbwn41jCDzrC3aZ9fAyOMex/uDuDKDW54+JW9OxgyhiELvV6cGe88c?=
 =?us-ascii?Q?RZNQNfjfr5T7S4fZBtvQg0ccGa/YF16Jp8vKf/CPS7v6hALiSKyrPLHla/FN?=
 =?us-ascii?Q?lC2UAiCiRcwA2cKaDEtXJNDczgMDS8lkrebKQ1uo2CjjZjEqUW4ZyZyWDSf1?=
 =?us-ascii?Q?F9jPgunyX3+be1y6eT/yhuNBk556Q4qX7P4hxUOoNZh0va72D3nGtw5VlYvs?=
 =?us-ascii?Q?0IaDXQDN13qwz3QS9Tq2Jg2Pee5Kw7eG5s2nsUOa2Gpf0B7rFEeVojy3tEaC?=
 =?us-ascii?Q?aCOG1fAYF9fY5bgu3fs4Gv+lqfizISnIbZeHVit9zYwNQILgQwSVfIHivufb?=
 =?us-ascii?Q?s8jPmgRA5wt4egoBa5cII6I4pCl4v2rIs/B65PVewen/l+OR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803b369a-a1a8-4b5f-0926-08df34fc1c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 14:02:31.7923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8quayRmY7QHNkFK8NZRFXRspQRpKQMxLXIOOLs7GgR4jYJ99f5RtUepbSOfKORqz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>+               /*
>+                * Apparently kernel never checked for mbz so now we have =
to
>+                * keep accepting garbage.
>+                */
>+               list.padding =3D 0x13ac5;

Mea culpa on this one

This patch is
Reviewed-by: David Francis <David.Francis@amd.com>

________________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Sent: Friday, October 23, 2026 10:50 AM
To: igt-dev@lists.freedesktop.org
Cc: Francis, David; Tvrtko Ursulin
Subject: [PATCH i-g-t 02/10] tests/amd/gem_list_handles: Add basic test for=
 DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES

Looks like we had no test for this so far se lets add one.

Just some basic test cases to verify input checking and normal
operation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Francis <David.Francis@amd.com>
---
 tests/amdgpu/amd_list_handles.c | 149 ++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build        |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 tests/amdgpu/amd_list_handles.c

diff --git a/tests/amdgpu/amd_list_handles.c b/tests/amdgpu/amd_list_handle=
s.c
new file mode 100644
index 000000000000..2c05e8fcdfed
--- /dev/null
+++ b/tests/amdgpu/amd_list_handles.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Valve Corporation
+ */
+#include <sys/ioctl.h>
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+#include "lib/amdgpu/amd_memory.h"
+
+#define TEST_PADDING (1 << 0)
+#define TEST_FAULT   (1 << 1)
+#define TEST_TWOPASS (1 << 2)
+#define TEST_PROBE   (1 << 3)
+
+#define BUFFER_SIZE    4096
+
+static void
+basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
+{
+       struct drm_amdgpu_gem_list_handles_entry entry[num_bos];
+       struct drm_amdgpu_gem_list_handles list =3D {
+               .entries =3D (uintptr_t)entry,
+               .num_entries =3D num_bos,
+       };
+       int fd =3D amdgpu_device_get_fd(dev);
+       amdgpu_bo_handle bo[num_bos];
+       int i, ret;
+
+       igt_assert_fd(fd);
+
+       for (i =3D 0; i < num_bos; i++) {
+               struct amdgpu_bo_alloc_request alloc =3D {
+                       .alloc_size =3D BUFFER_SIZE,
+                       .preferred_heap =3D AMDGPU_GEM_DOMAIN_GTT,
+               };
+
+               ret =3D amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+               igt_assert_eq(ret, 0);
+       }
+
+       if (flags & TEST_PADDING) {
+               /*
+                * Apparently kernel never checked for mbz so now we have t=
o
+                * keep accepting garbage.
+                */
+               list.padding =3D 0x13ac5;
+       } else if (flags & TEST_FAULT) {
+               list.entries =3D 0;
+       }
+
+       if (flags & TEST_TWOPASS) {
+               if (flags & TEST_PROBE) {
+                       list.num_entries =3D 0;
+               } else {
+                       igt_assert(num_bos > 1);
+                       list.num_entries =3D num_bos - 1;
+               }
+               ret =3D ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list)=
;
+               igt_assert_eq(ret, 0);
+               igt_assert_eq(list.num_entries, num_bos);
+       }
+
+       ret =3D ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list);
+       if (flags & TEST_FAULT) {
+               i =3D errno;
+               igt_assert_eq(ret, -1);
+               igt_assert_eq(i, EFAULT);
+               goto out;
+       }
+       igt_assert_eq(ret, 0);
+       igt_assert_eq(list.num_entries, num_bos);
+
+       for (i =3D 0; i < num_bos; i++) {
+               struct drm_amdgpu_gem_list_handles_entry *e =3D &entry[i];
+               uint32_t handle;
+
+               ret =3D amdgpu_bo_export(bo[i],
+                                      amdgpu_bo_handle_type_kms_noimport,
+                                      &handle);
+               igt_assert_eq(ret, 0);
+               igt_assert_eq(e->gem_handle, handle);
+
+               igt_assert_eq(e->flags, 0);
+               igt_assert_eq(e->size, BUFFER_SIZE);
+               igt_assert_eq(e->preferred_domains, AMDGPU_GEM_DOMAIN_GTT);
+               igt_assert_eq(e->alloc_flags,
+                             AMDGPU_GEM_CREATE_VRAM_CLEARED |
+                             AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+               igt_assert_eq(e->alignment, 0);
+       }
+
+out:
+       for (i =3D 0; i < num_bos; i++)
+               amdgpu_bo_free(bo[i]);
+}
+
+int igt_main()
+{
+       amdgpu_device_handle dev;
+       int fd =3D -1;
+
+       igt_fixture() {
+               uint32_t major, minor;
+               int err;
+
+               fd =3D drm_open_driver_render(DRIVER_AMDGPU);
+
+               err =3D amdgpu_device_initialize(fd, &major, &minor, &dev);
+               igt_require(err =3D=3D 0);
+       }
+
+       igt_describe("Check padding backward compatibility");
+       igt_subtest("padding")
+               basic(dev, 1, TEST_PADDING);
+
+       igt_describe("Check fault detection");
+       igt_subtest("fault")
+               basic(dev, 1, TEST_FAULT);
+
+       igt_describe("List no buffer objects");
+       igt_subtest("no-bos")
+               basic(dev, 0, 0);
+
+       igt_describe("Create and list one buffer object");
+       igt_subtest("one-bo")
+               basic(dev, 1, 0);
+
+       igt_describe("Create and list many buffer objects");
+       igt_subtest("many-bo")
+               basic(dev, 1024, 0);
+
+       igt_describe("Create and list many buffer objects in two-pass mode"=
);
+       igt_subtest("many-bo-two-pass")
+               basic(dev, 16, TEST_TWOPASS);
+
+       igt_describe("Create and list many buffer objects in two-pass probe=
 mode");
+       igt_subtest("many-bo-two-pass-probe")
+               basic(dev, 16, TEST_TWOPASS | TEST_PROBE);
+
+       igt_fixture() {
+               amdgpu_device_deinitialize(dev);
+               drm_close_driver(fd);
+       }
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 61b81c81407d..2dcc3228b583 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -28,6 +28,7 @@ if libdrm_amdgpu.found()
                          'amd_jpeg_dec',
                          'amd_jpeg_queue',
                          'amd_link_settings',
+                         'amd_list_handles',
                          'amd_lockdep',
                          'amd_max_bpc',
                          'amd_mem_leak',
--
2.56.0

