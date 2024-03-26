Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0601CC54E64
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 02:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAEC10E384;
	Tue, 26 Mar 2024 02:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tOgwQAx3";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2119.outbound.protection.outlook.com [40.107.93.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62D10E384
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 02:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsvIcvitfwaK3ny+PmZf743Xf6uBO+QGBQa2bs19VXjA5BIb0WpKCu9S+qevTQFmcB7ZzRLjM2mEuaLax6DUE+GFclZDsQoodL0Uyg+lg2GXmg/MHgOANH5YaU16bNTL9vXLrHbgokKHnGrP1Qolf0ZAEfxrpN11PEjgT4OvRCgttGIWpGILzgw+Ln95RELXSyuZKyNle2bpZz9FF8Sz/DkMbMeGuiyBiz3QhgRXymMB5Xj4uminQcIdpE9vs5pMwSV5jWCAlnOie9StYjUDqgMBgk19vEbEsx9NgPAJYTtuEPhbXqP58YJBzkjiLJH7gVfLClou1K3E0o8BRXUrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB9TDKqydDctRuRPIGsR3bG89LEbm6dEm6l51jwc7eg=;
 b=efG9kTg5vE9/d95L8/xXPpIL8XoC9E+9EA3ZDks85JG+M5PFlfJOznaqwRb/ahtTlPhL8nlH9X7ltwdmtsEtJ5kn0uoYJC/kVzJ40V74ZejnxzYeu1XzxwmXh4sdgvQoLqhAh+ixtWZu720BmDepZwYqyXqGp/wXn3D4DLfJaJvcEEwJOi3F109tGS7kHmQTmEKK7wglp6w0wO12wK4A5hZQjTDxhNKdAyXBV9mOVHyooyKe4pTCcD2TNvgvAKiej8jXtp8Pp223Tl3uJ4ID9EWUdfo/D8FFNDWvd20W3c9MtrLXF3Mz7v0IKo2KjqUKGWk1PE27CA3/F7FXN6vzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB9TDKqydDctRuRPIGsR3bG89LEbm6dEm6l51jwc7eg=;
 b=tOgwQAx3qPMjJpPs6vJufkSmTWTWoItEHgF0Mac10ybVTvuEx2ZJDWfAAiKG/Ph4Nnz4J403iJ7nZxVDlZ+73a+JMU2vqHTiiTaWN4Pn7UlN6ZAf9fwzv1sBi6yptjrQhTYqaEWfTFpPZTHQmh9CLIdLRXxpd3ggP+DOHu0xQuo=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 02:32:53 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 02:32:53 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t V2] tests/amd_basic: WIP fix eviction test failure
Thread-Topic: [PATCH i-g-t V2] tests/amd_basic: WIP fix eviction test failure
Thread-Index: AQHafyLvSrl2mHmSbE+jygYYads6EbFJTVww
Date: Tue, 26 Mar 2024 02:32:53 +0000
Message-ID: <DM4PR12MB5152624E9D03FD3BDA4EF45BE3352@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240326021027.2459760-1-jesse.zhang@amd.com>
In-Reply-To: <20240326021027.2459760-1-jesse.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5bb593c1-6a3d-47db-9db4-42458152eec6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-26T02:32:16Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|BL3PR12MB6618:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ZhWvJQpx1R3tU2clv5dFknSbb1yD2NAs3cfDpzA6HqdzNyYiadfNaSDq3Dgck1Ube4/re7rxse9WOBXBxDg3/mcecDG0rL0lJ5dkFBloRE0F0do1Va2U+ADyQR/HWZZWXJiQNxi+ZbbL+u5WOAaDBHPaigJCnLPJQlLxVt0ToW70Z16y3oodJ/nkVCfhKBBj/lwa1l9er7CXcKJBLSLF1JcT1fPyIevfax9NSBfOm1jYN1FYKi4lzBUxYuuB9uwECvpSleyursYzhD7/fcnkTvRLCD09wRwOeNbECEO/poNcu6iAXuCicXIiUjTaCPrVRh+PPTd0/Ui8u8RrTibMDwu66W/tmnQPTlezZgYpdGHV+3XhFPTXTo5TgvOUQFY7ZjnP5CN4PtMAMdeDQzzmbWAXHSJv3GAi6kePWU1etiJfgzoAiYaK0T+18YyaX2Nzq9M9wduNVp58IewHtGlYqOCBIjW4rHL/ud0Op7u4ZGu48JMMlAODy2Gk/ZapWO+A6pXLf12TSfIQSKWnc2tM9cvqOumaWl10rmU8I06zN0dse23FplQWybL1b4atT2rOsH5XXN3lL9sB57mEycEaeHTXwnlh4B0UjXIG9KrShgW/zYBqo1daaB56lA9JzStPZUSQgFpC4wpHHQFhPRBQAW6wG6U7UFpxnOsdeTJDAU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LoZOPLi0N613tOcD30uimEKS27DHyDYjxAl7cLvJgcPjry/DbuDltnytABH/?=
 =?us-ascii?Q?rbNXzJYLCOmtVWyJGCxnJO5XeH71/EhvTXU07YSdMgKYZAER05iDTOaLYpzj?=
 =?us-ascii?Q?q3CguXBkUoeLCo/Bk4CWC/TwXM/eHto3Q7NU4wnpEuQ75QocsiTlQSU/r9Li?=
 =?us-ascii?Q?3TJFokBmO3JNyG22VcVqjzRzdasTRNxea2oS5rapR1W+qfiVvKgS7K2b+8iK?=
 =?us-ascii?Q?5PevnjT5pkr9sN4GXLFtkvsefLnBFXurcEUZK6r3mEaMpRZRwZsKeH1Y3GvD?=
 =?us-ascii?Q?q9L3VfsXm1Wp1Frc468Ea3uJ/i6LgsfIeXsywLvUdN+FXApTCr0/oy+0flm5?=
 =?us-ascii?Q?516cr7NcO52DbRU6YcOq+RDtnVuVWDAS5t0sP4KZ2636tCfz/P0Sok1sg2sX?=
 =?us-ascii?Q?1vV/bMbNKBHyJBh8luZuwTo0fiNe5CeoawTqIkeKjnDLzlot+uEsp+HRr+3O?=
 =?us-ascii?Q?5uLAVPPX2qaI3Vx8T11NzZfUeMze1QDWQNy9EXK+sas3BMp/PHs0K+b5Gs12?=
 =?us-ascii?Q?sQTEiB2H+mEQYn1uQWDPylgk+0/zT85DssKxsaMJduFPWkxNtrWaKKkFAdA1?=
 =?us-ascii?Q?2+YJBMbkWyM3wkXLP7hI9Z8RgBcB4wZiLa9zmLaT/GNLvQU9DvCA3wGUKHet?=
 =?us-ascii?Q?gxFf+o4iKYeOj/z5GMsoSMw9BRlnOuCxuNtl6VXZsEc+T2neLMKNAJZEQ3Cx?=
 =?us-ascii?Q?ShzNyrTHoAp41cvNnRZJuaRfu2D9Xkh6lWFbJbwgQF4hv17YB2LkeXhP+ebW?=
 =?us-ascii?Q?nkyAY3sp0EkrIW5NEwjxNZNP5pUvud8wsUI6pqGTM4wWxM/VbDxRkuqH8497?=
 =?us-ascii?Q?F6JR0VPknV1+kn1SHlX7LnlS9MlUqX/zAEEjA1ejXJJr9AAkiI7NAsXOZbru?=
 =?us-ascii?Q?WYEkMqbRmNhiOjbyFLrwj/tqurRtwHnZmuWOfcjBbvAzVIDKwfos/aeOSj4+?=
 =?us-ascii?Q?JrXAS04uZSYGmVHc0KKEGZhYNLVaaTPBkSfPB4CJcnOd/RfehBTY4kY3V3cQ?=
 =?us-ascii?Q?tem9d4eJUHSMdCzksQNep0D65HL2EPlzhGWQA2fxwdF8POzm9pBQ4WWIiflu?=
 =?us-ascii?Q?sH65RcFIpqAaO7QcaHLHjeToMbzyT8m9ubKtgOXmFgJo4iUyXNnegNOxrqG2?=
 =?us-ascii?Q?u7Sqkk44V00OYVceE+pA+OAcc357yymsEUQjuvhW7BPjYbHheSNI6NZzRcQb?=
 =?us-ascii?Q?VD500/d4XyR9lLHKq3hWmCZGgbh2qowPqwy6DJ1yRX5EX6Ngys9b5bGoyd9n?=
 =?us-ascii?Q?ebE8S1XxzLYxZ/d3QuZqZmflub9l2vqTHLuxIohSke/zqse7Vos3JVEWyW7V?=
 =?us-ascii?Q?2cVkkAQCjQywWyrNR4sibCah1GOyMvty02+fJdGzztmG38OdESYHxKMTfjjV?=
 =?us-ascii?Q?zGC3B2hhb6gH/3qklyrpz0kr3Z7bZvmAGYm2/5pF8EzAB+0bda3nSXeHHXr8?=
 =?us-ascii?Q?GDKXoWq5il+aDi09fJ+RIeN6CqlY0GXQjXQnNPMZd72tv0jkJVmJL3qtb3pq?=
 =?us-ascii?Q?BMcEich+Hw4HHZgoXBvxIjrLm+144dL/G/RS8uR5LU9KhSBZ/F6PL5tscNFS?=
 =?us-ascii?Q?aNnvx3cGx9pt5FAW4o4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4f73a4-e5dc-4ecb-a90b-08dc4d3d09cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 02:32:53.1998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4sbVQ2b653dq0wB1piaafib2Pfw8LN7BN2YYPJc/0lAJ2c0r/ww2L5sqn7Wr67xtK8ldHLOf0mB9rb6MfTISQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Please ignore this patch, I will send out new patch soon.
Thanks
Jesse

-----Original Message-----
From: Jesse Zhang <jesse.zhang@amd.com>
Sent: Tuesday, March 26, 2024 10:10 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>; Kamil Konieczny <kamil.konieczny@linux.intel=
.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2] tests/amd_basic: WIP fix eviction test failure

Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
Fail error: "Starting subtest: eviction-test-with-IP-DMA Starting dynamic s=
ubtest: eviction_test
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion fai=
lure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_su=
bmission.c:77:
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: =
r =3D=3D 0
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Ca=
nnot allocate memory
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 !=3D 0 =
Dynamic subtest eviction_test failed.

There is a case where the system size and gtt memory are smaller.
When evicting vram to gtt or system memory, there is not enough gtt or memo=
ry system memory available for allocation.
Therefore, try to reduce the use of gtt during initialization to meet the r=
equirements for evicting vram.

V2: Added dump to the file to get the values for gtt and vram heaps (Vitaly=
)
    Remove the space and empty line (Kamil)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index 70e4=
5649d..0b4159222 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -336,6 +336,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_han=
dle)
        struct amdgpu_heap_info vram_info, gtt_info;
        int r, loop1, loop2;

+       FILE * file =3D NULL;

        uint64_t gtt_flags[2] =3D {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};

@@ -358,6 +359,36 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_ha=
ndle)
                                   0, &vram_info);
        igt_assert_eq(r, 0);

+       r =3D amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
+                                  0, &gtt_info);
+       igt_assert_eq(r, 0);
+
+       file =3D fopen("gtt_vram.txt", "w");
+
+       fprintf(file, "gtt_info.heap_size %ld, gtt_info.max_allocation %ld =
 gtt_info.heap_usage %ld\n",
+                       gtt_info.heap_size, gtt_info.max_allocation, gtt_in=
fo.heap_usage);
+
+       fprintf(file, "gtt_info.heap_size %ld mb, gtt_info.max_allocation %=
ld mb gtt_info.heap_usage %ld mb\n",
+                       gtt_info.heap_size>>20, gtt_info.max_allocation>>20=
,
+gtt_info.heap_usage>>20);
+
+       fprintf(file, "vram_info.heap_size %ld, vram_info.max_allocation %l=
d vram_info.heap_usage %ld\n",
+                       vram_info.heap_size, vram_info.max_allocation,
+vram_info.heap_usage);
+
+       fprintf(file, "vram_info.heap_size %ld mb, vram_info.max_allocation=
 %ld mb vram_info.heap_usage %ld mb\n",
+                       vram_info.heap_size>>20, vram_info.max_allocation>>=
20,
+vram_info.heap_usage>>20);
+
+       fclose(file);
+
+       /* For smaller gtt memory sizes, reduce gtt usage on initialization
+        * to satisfy eviction vram requirements. Example:
+        * gtt_info.heap_size 3036569600, gtt_info.max_allocation 211424460=
8  gtt_info.heap_usage 12845056
+        * gtt_info.heap_size 2895 mb, gtt_info.max_allocation 2016 mb gtt_=
info.heap_usage 12 mb
+        * vram_info.heap_size 2114244608, vram_info.max_allocation 2114244=
608 vram_info.heap_usage 26951680
+        * vram_info.heap_size 2016 mb, vram_info.max_allocation 2016 mb vr=
am_info.heap_usage 25 mb
+        */
+       if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_al=
location)
+               gtt_info.max_allocation /=3D3;
+
        r =3D amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation,=
 4096,
                                 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->=
boa_vram[0]);
        igt_assert_eq(r, 0);
@@ -365,10 +396,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_ha=
ndle)
                                 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->=
boa_vram[1]);
        igt_assert_eq(r, 0);

-       r =3D amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
-                                  0, &gtt_info);
-       igt_assert_eq(r, 0);
-
        r =3D amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, =
4096,
                                 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->b=
oa_gtt[0]);
        igt_assert_eq(r, 0);
--
2.25.1

