Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D2C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 04:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43B810E915;
	Thu, 21 Mar 2024 04:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EAJ7qMnc";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DAC10E915
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 04:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9+M3yEcUKJnY+EFTyV20YeEKWwX4qqmBKk8Eqt8KJn7cvlf3lBFRJkAOit6L3JP5qiyS4ejD7UGDOLeYG1+FXHQ2VX+F4uMhymytD2b199Tmoxv1NNOD3zH294IawWzXWJK3MNrnMpEwH38ODIT9Yf6vKvSGQdYa1MzG+54TmZpIvtLqLwdMLvA0ViDozWs2Mu7y/cgMBLOjT6o+Z9P7Xjc4zkgBSEoMj+sZaJ5ggU+Gbx9DJi/Bmd8FEl0+FucMoXTjy/Hd/J4765vd5T+rOPDAIitEHEW4ZygmIar0mKGiQ/mj6B2EyFkVOFgJgfEd2uNSt0oP5oxklr8Q3bung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n64l/C1e4T/Gw98HjIOZLuG2vSgkjWgWRDU/wgTgeQ=;
 b=OV5iYfWkzemvwxbewMpBW554Sn5n4aAoa2SDXj/HV/BEhZanasnCgQ/TRP9GwvQs8c0YEmQ0Hf4vDbkEgGdLfHfeRBDfcXyA+gsk3+OlklcS/qL4+KjlE7ui/2tNux0Oj1kgv2PRAHnty213PaHK1y8NfGD+xcmQTf86rDxiYnQ4VmfsnwkA8JjV/tQ8aMggBVerDY198OBrmm6CPDDvd50PnOUZ+kKAqA5uXV7VW+VbZPhyCYkqVnS/wjZk8cVLtofZn9g0qTuDaL/rMyBNAC3S/UaFfNtEmWEkHbtmSSA6OnGKpxBCNIb4R16P70mG+y0HE1AvHKJSKyGpfk9EsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n64l/C1e4T/Gw98HjIOZLuG2vSgkjWgWRDU/wgTgeQ=;
 b=EAJ7qMnc5fU2QKRjEbXSVpt/x2LjMcLCv0aUr0clNL+7uUUI/qhlw8ZVnhcJ8Ojy3jcUGzNzn65tcN6rflnOQPmNff0E31ow6Pyc7yplHK8CNxkvGcw8ecFo5ofxjVAitXfH9/JZ1BYXNd1GKcz22SOEqMvLpxH9v7gqKOysdHs=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 04:13:43 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e%7]) with mapi id 15.20.7386.031; Thu, 21 Mar 2024
 04:13:43 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Joonkyo Jung
 <joonkyoj@yonsei.ac.kr>
Subject: RE: [PATCH] tests/amdgpu: add fuzzing tests
Thread-Topic: [PATCH] tests/amdgpu: add fuzzing tests
Thread-Index: AQHaeWPVrotSFabZDkSxkY1HWGI4ILFBmXCA
Date: Thu, 21 Mar 2024 04:13:43 +0000
Message-ID: <DM4PR12MB51528872F88BDD965C71F1A5E3322@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240318184056.108067-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240318184056.108067-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e959e8ee-8862-40b2-a8c1-2641a402c2b1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-21T04:13:20Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DM4PR12MB5939:EE_
x-ms-office365-filtering-correlation-id: 8d12a95e-b26a-4f54-d945-08dc495d4bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIYgj8dPdz/X+aQI8P9YA7eu4II6kgGry6qu7oFOfSm+DOEc0vpth/YAM00LuzWDElkZW+bRKRBfz+tHhiAQbugPXnxA/4YAQERT1XQyX48jKwcy8krUpQTxRk4RO28L8SAiqa9bpjS0gTWR2C+LUWBjLEIZjJherFXzosYtu5aQ6TQC9QEx4hY1Qtv/QXbBR1CJZJK7Ftx5WRaghtVNeQwOYcrg0i5+wEto8kcoK8jTnjiX9nXzLBF9jFWKs8HabfIO5pISuAZ0BLS2ZGfsbpUjBOx+8aCVIxWG/mz4KfCCg6fokapc0j+ulUgu3CNqgcbUT0kloOZRaftP7J5U+1CYQVA74Gd3FwoRc7JXPKMZabqDeYIU0eb48mCpC5pwuimqmpC0iMVW3sWHqp/I3LfVFiDyR55LTm3ghDEWKCtasC4J9nSZ6LPsTuI2D9XEqG8AGlffPXhpXWkbzOb10UDOW+0LLhVaUvI/M3l9WQ8UTEWVdD6b6etqRvO5euPHJF5t8H//UkKEec2sT0yw+xHGweyjJspnpkd/vUZkCZthX+r2sPew/15Yhd6vmPHxhmgdjSNHuQRLzDZRXDoWp8p5ZvGzr27QqQpDwUJ7/vTOZSkPMX+6LpCAvdbmKTvgYVB5zbWeTiB/qBP6bOukPV2vPRH5wPAVlQ9pCPrn5bIg0GmIRwuTQqml30GRzWRR20RLh0DvaxTo8VMywsIhSuC0XGK3Az2TBtp3Kmln38Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zQXgEjbx4a4KVa4bEFUcmtIC5TH2vzf1oreoSGjjGQiBIzs8Ec7MckGYzpDK?=
 =?us-ascii?Q?r5bZEmt0mHTc9jBniXyDONd9EWqbWZBaZih7LB0slAL/yGjaCVnQqdKbKyEn?=
 =?us-ascii?Q?OykN7FANC0vsqy20bs6hJbUGljEXgPB5qSGDKHE849rRsA77uDDJ82jn8CWa?=
 =?us-ascii?Q?TolYCVcuHeGr2jJP1anCKPkTO1fuEE/B6rZkbSBftLYuc+YSn2vpEQkbBIhA?=
 =?us-ascii?Q?+/UQ4smwTUROqGTuoouJ0+ldTVze8jhXo+/zxlFn1O/v+QQ5qqNIJ3MdWgRT?=
 =?us-ascii?Q?o3/TTOuRZPfwMaFtSu2NT6JQ1i8n4i9vXgrJLIJb6vVXSyEnRkc/aoU7JwL4?=
 =?us-ascii?Q?0WGUBRcEmeMpUr7lGxjCwYZSBga6Sclhcpubc27WtmOUlHnEdCCFYepiouep?=
 =?us-ascii?Q?lAXeftHAfx/zsIcdyKLVsLn5xIZsxxJ0r5pbrpWQgf/3EjxDFGyGkVvzq7ju?=
 =?us-ascii?Q?q1YCluHdQ95HXw3HoUjDEw29p/1qRn4ZdZd9ioLhlTmY1IM8CoE7wFIc33EF?=
 =?us-ascii?Q?ppSTdnvN9aU7u9OJYiUp1w8fu4rKxwVH0b+7BcgQCpjFamIMDHw6A7ehe/3i?=
 =?us-ascii?Q?dD7UD04zBleE0javFc3sMxHRNW+AiGu6AM4GrdkrQHYSxWXXYubbWwz3Oza/?=
 =?us-ascii?Q?A3m8ZrUbh1+a8f978j/2H5Ap1by3DIemuZxOSEpEvOawHEgJT2AuR9kjU8ZO?=
 =?us-ascii?Q?PgTTpmxUXzVeMy0GSHNnFGgF1L/WjRiiM9dNR4tMKkCky6X3r5MohzLckwsj?=
 =?us-ascii?Q?5ZidBmE+Kb7Fz9kzo6Yh22VYvE8YsB8WIybWEBDH79zcHTvz+VPuYi9FTkeT?=
 =?us-ascii?Q?+4u6hM9iFQGJgrSij0RAu9PoQa1W7yjvfo7dmJzmI7+HJKuruKAP94PW2Ki1?=
 =?us-ascii?Q?suieMWda7ZckGVjfEGjW5Uscfl4yOjNMvtr+Sip4cpzzpwBIqHET/KQEqI40?=
 =?us-ascii?Q?o5/wJYPmJImyRexwbL/GkyWJxKQ/GICqsUnQm9C6c2FnXxBb+XE/2rCORBsY?=
 =?us-ascii?Q?LSIXCN3X3SKHLggaTr6IYMWvhEhrXqKMJ9ZWKNTZgnIhZJk79YMhKLJVMxUz?=
 =?us-ascii?Q?eCZ6oX2kM0madvhuVGjvKtsDSKpz/qNuznAcEwb/qIX94nXdyxkxn7ffHg8O?=
 =?us-ascii?Q?6EfLj3XJEl9pfzjCwMmSwfVEH2vYHrZfr1z4h0UHDfolKcP7RaiVLoKr8n/9?=
 =?us-ascii?Q?EEvSKAnuFK3/eA3SfMgvIKEzSJs0jqlay6gDe1JOHykCaaA5lZlcLwPR9C1r?=
 =?us-ascii?Q?UWsU6I0TxmdkG9+ZUU5k32vkm/AB6z6o93F0TxE1L1FLlkz5wtP2HcbAFUIM?=
 =?us-ascii?Q?bzOsIURVCGcqwM3d47Hma0xTh/4nPzJSpC5Qv+zVuodCnmoib5s43/mUQIVP?=
 =?us-ascii?Q?R2fGneqIvHlqcordzDlnKc3JoE3EqfaBB5Izsiwl3QD5/zmVd5zmM8ZiCT4K?=
 =?us-ascii?Q?y/1BSVRAYwBdDiPD+Z/6/7TpFxft6UUSoPeGpZ0wOJP0PXNn1bWe+vlWwAuZ?=
 =?us-ascii?Q?3gj4nZqIOeHTW0H+NaXhm3mX58Vjxq1r9fWNjVJRsG8dvEHra+eKJ2NgcdeR?=
 =?us-ascii?Q?nO2g8en4TF7UgWoCtrY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d12a95e-b26a-4f54-d945-08dc495d4bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 04:13:43.1269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmK6nhXpajOWlo1okpAEsn6aboHwL6DjP9EAYwFJ58jx9ld4GIp0M4MJoGUzhwVnzB+Jd1Wt5wYrBLUwn3vwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939
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

[AMD Official Use Only - General]

The change looks good to me.

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Tuesday, March 19, 2024 2:41 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Kamil Koni=
eczny <kamil.konieczny@linux.intel.com>; Joonkyo Jung <joonkyoj@yonsei.ac.k=
r>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add fuzzing tests

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Joonkyo Jung was using customized Syzkaller with KAZAN enabled to find the =
bugs in amdgpu and the drm scheduler.
Those new tests would help to keep the job state machine of the drm schedul=
er and amdgpu in the correct state to ensure that the wrong call sequence o=
r invalid parameters do not cause a kernel crash.

The sub-test 'user ptr fuzzing' sends
DRM_IOCTL_AMDGPU_GEM_USERPTR the invalid address and
2 GB allocation size.
The sub-test 'cs fuzzing' sends DRM_IOCTL_AMDGPU_WAIT_CS for several IP typ=
es without previously submitted jobs.

v2 : File names in 'meson.build' are sorted alphabetically
     (Kamil)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 120 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing.c

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c new fi=
le mode 100644 index 000000000..69c9e8dad
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_gfx.h"
+#include "lib/ioctl_wrappers.h"
+
+const struct amd_ip_type {
+       const char *name;
+       enum amd_ip_block_type type;
+} amd_ip_type_arr[] =3D {
+       {"AMD_IP_GFX",          AMD_IP_GFX},
+       {"AMD_IP_COMPUTE",      AMD_IP_COMPUTE},
+       {"AMD_IP_DMA",          AMD_IP_DMA},
+       {"AMD_IP_UVD",          AMD_IP_UVD},
+       {"AMD_IP_VCE",          AMD_IP_VCE},
+       {"AMD_IP_UVD_ENC",      AMD_IP_UVD_ENC},
+       {"AMD_IP_VCN_DEC",      AMD_IP_VCN_DEC},
+       {"AMD_IP_VCN_ENC",      AMD_IP_VCN_ENC},
+       {"AMD_IP_VCN_JPEG",     AMD_IP_VCN_JPEG},
+       {"AMD_IP_VPE",          AMD_IP_VPE},
+       {"AMD_IP_MAX",          AMD_IP_MAX},
+       {},
+};
+
+/*
+ * The bug was found using customized Syzkaller and with Kazan enabled.
+ * It can be triggered by sending a single amdgpu_gem_userptr_ioctl
+ * to the AMDGPU DRM driver on any ASICs with an invalid address and size.
+ * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
+ * The following test ensures that the found bug is no longer reproducible=
.
+ */
+static
+void amd_gem_userptr_fuzzing(int fd)
+{
+       /*
+        * use-after-free bug in the AMDGPU DRM driver
+        * fix in amdgpu commit 6dbd33a9c8747dbf1d149484509ad667cbdb3059
+        * The error dump is available in dmesg only when KAZAN is enabled
+        */
+
+       struct drm_amdgpu_gem_userptr user_ptr;
+       int r;
+
+       user_ptr.addr =3D 0xffffffffffff0000;
+       user_ptr.size =3D 0x80000000; /*2 Gb*/
+       user_ptr.flags =3D 0x7;
+       r =3D igt_ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &user_ptr);
+       igt_info("%s DRM_IOCTL_AMDGPU_GEM_USERPTR r %d\n", __func__, r);
+       igt_assert_neq(r, 0);
+}
+
+/*
+ *  The bug was found using customized Syzkaller and with Kazan enabled.
+ *  The bug can be triggered by sending an amdgpu_cs_wait_ioctl for ip typ=
es:
+ *  AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE
+ *  to the AMDGPU DRM driver on any ASICs with valid context.
+ *  The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
+ *
+ */
+static
+void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[],
+int size) {
+       /*
+        * null-ptr-deref and the fix in the DRM scheduler
+        * The test helps keep the job state machine of the drm scheduler a=
nd
+        * amdgpu in the correct state to ensure that the wrong call sequen=
ce does
+        * not cause a crash.
+        */
+
+       union drm_amdgpu_ctx ctx;
+       union drm_amdgpu_wait_cs cs_wait;
+       int r, i;
+
+       memset(&ctx, 0, sizeof(union drm_amdgpu_ctx));
+       ctx.in.op =3D AMDGPU_CTX_OP_ALLOC_CTX;
+       r =3D igt_ioctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+       igt_info("%s DRM_IOCTL_AMDGPU_CTX r %d\n", __func__, r);
+       igt_assert_eq(r, 0);
+
+       for (i =3D 0; i < size; i++) {
+               memset(&cs_wait, 0, sizeof(union drm_amdgpu_wait_cs));
+               cs_wait.in.handle =3D 0x0;
+               cs_wait.in.timeout =3D 0x2000000000000;
+               cs_wait.in.ip_instance =3D 0x0;
+               cs_wait.in.ring =3D 0x0;
+               cs_wait.in.ctx_id =3D ctx.out.alloc.ctx_id;
+               cs_wait.in.ip_type =3D types[i];
+               r =3D igt_ioctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
+               igt_info("%s AMDGPU_WAIT_CS %s r %d\n", __func__,
+                               amd_ip_type_arr[types[i]].name, r);
+               igt_assert_eq(r, 0);
+       }
+}
+
+igt_main
+{
+       int fd =3D -1;
+       const enum amd_ip_block_type arr_types[] =3D {
+                       AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP=
_VPE };
+
+       igt_fixture {
+               fd =3D drm_open_driver(DRIVER_AMDGPU);
+               igt_require(fd !=3D -1);
+       }
+
+       igt_describe("Check user ptr fuzzing with huge size and not valid a=
ddress");
+       igt_subtest("userptr-fuzzing")
+               amd_gem_userptr_fuzzing(fd);
+
+       igt_describe("Check cs wait fuzzing");
+       igt_subtest("cs-wait-fuzzing")
+               amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
+
+       igt_fixture {
+               drm_close_driver(fd);
+       }
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build index a58d=
18ad3..d7152a356 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -13,6 +13,7 @@ if libdrm_amdgpu.found()
                          'amd_deadlock',
                          'amd_dp_dsc',
                          'amd_freesync_video_mode',
+                         'amd_fuzzing',
                          'amd_hotplug',
                          'amd_gang_cs' ,
                          'amd_ilr',
--
2.25.1

