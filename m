Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF19C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CEA10E096;
	Tue, 20 May 2025 05:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eKELf/mL";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675E210E096
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjuLTcAisP9LFF9wqvOW5CcELsL/agHQunYwNW5QRo8WauqqA9hGU1vqMa0TrXq6DFDIcNnfwjnxN7Y4HX1p+RvHE3Zy1Upgcy4TN/iLakE+pFQZOp7dO6UMHkgYVo5ooAwhoYLx0bZhhzcKoCvTaO0YYnQfPw3FivaDp30E3GEjnUkozIHYqTu5PmPodh+TimcckfRZKfqoyAZ2xGfZxafFztIu6KeC4S+S0e5b45K/t94XZhCfAOZRJgXMha4o1IP94XazCoTdN+JsO0cOiVQH4o/a3Ej60FanqK/RnfiY4Oqd/CAtDgAEjn5bZRWJYj1RXgLSZJqll+NMI0vuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmiBCM1R+BsH2BXoAUr1FtDBJFPR2JYjJAszC19N0zU=;
 b=ikILcORguXUGEK6+Vt2+TIJxZkOnEbd0o7gZUze/ePz9Ws+KleBTqNsU6VBNxyMulRCTKCBONW6ZCc3M2nsHU1HbiBzDM/1163lm30E6obdPknWr6auJ5xrZxBpNIOOT/3SZ8DAjGiA8FGifzzD54aRLW33k21Jj98sWqYMeWvQCgJvTSLgNKkwQFT+qcHCBs4gQzuzkgkXPEVE/eTY/UJbiKeAMnKhitgKyxPgk6wcGnUAgBnBc63KK3uhJ1iyslmsGSXo9EWovPjp2eQPR5JW4TsOgmgmBZGv/nvjR/mdG98yeQtAy24d2Zmr4kgjEtQaXqU8a4qARJ/oPDZ7Hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmiBCM1R+BsH2BXoAUr1FtDBJFPR2JYjJAszC19N0zU=;
 b=eKELf/mLmlecEQAzS9tQqd8GQJE7I8Vjcf8HRc0jxG+O/mWmkFM0gLaOM8pEMHEHjppplKqmWhAlF/kPHnJ7/nYAeGff94+AIZ/7pqFkddKrBB2m82TELu0OG4LXcthqI9ZLx0QRhXQUWHI6HuiiIcdwkUsn9acstu9lqFIzxzw=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 20 May
 2025 05:12:38 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 05:12:38 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal
 fence
Thread-Topic: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal
 fence
Thread-Index: AQHbyMZImb6T5Akudk+qzhFFjUgXX7Pa+YCQ
Date: Tue, 20 May 2025 05:12:38 +0000
Message-ID: <DM4PR12MB51527589A0ACC0E8C2692F4FE39FA@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250519135901.3032-1-yogesh.mohanmarimuthu@amd.com>
In-Reply-To: <20250519135901.3032-1-yogesh.mohanmarimuthu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=938ec39b-13ce-4ce8-bb4f-1503bd81459e;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-20T05:10:38Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DM4PR12MB5772:EE_
x-ms-office365-filtering-correlation-id: c553f162-6715-479a-3dca-08dd975cf060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3hMieYGu2WakkM4Xm9UuyxbtUtiwjKXsL3pU1n7bC33d5k2tW/U8icPEJiew?=
 =?us-ascii?Q?fKRCcIRuST22iFgtvME2dHmR6I4GHOEB1fec0oVDLV7hbu6/BC+nkar1HEs/?=
 =?us-ascii?Q?CYnSxfBhohInlzg8+sdp0blC/MJy7GesMUoXkG8y2UBdVr/hxKlojLYIsJuR?=
 =?us-ascii?Q?/Q89nPNBXlP+bXcf/iHISzAR5+QjyIuYMmQeGkUpeqZ62mg60R0UlZ5CFl8o?=
 =?us-ascii?Q?0TnU+PnSJlLd9Sxa78TOW9pvTLtRqpBJkvZOlg/2F+0RYi4f/uC/r6ishDAb?=
 =?us-ascii?Q?DXhMFpdzHP084UAJBF8PoPuYwNcLr/u+mZS3Mm9xtHw0GOev7vPR1NgwT2Yu?=
 =?us-ascii?Q?ruJg1ffbRcictoW/2p1OY9x7iHJczk+TdX5W7Mro0Hl8lkVOMNQHeBC0zGK7?=
 =?us-ascii?Q?Rbr/8KUgvpkBOS8PBFvDH0AR9Bz1FT6AMdZXBfSwZUJF4v6/0H3cN257INvE?=
 =?us-ascii?Q?aQym2PQTJoKBTQxTCwWHlGZ4xil7hB/AOjzWxBIzhbNDMBqoI6LKpMH/6oGi?=
 =?us-ascii?Q?xz+hx6B7chZ/TFBurj2S6OSfdNkOFvTFqaH4loPx6h1rISAjFWzvN6xurX1a?=
 =?us-ascii?Q?j+oNkmbJmIyAlgI5Ioj08WIqil6i6nvdAGitKr8W/ZnnglkS0Bl7X/02iEsi?=
 =?us-ascii?Q?MUMOkXid45CP0QmG/L1CJ7t5gZ4p6Ca0Zx5OMUxtvH6IOBr9F0aOrrC/RF/C?=
 =?us-ascii?Q?G/d6ZnYUt501xczXAVDw1NraEWoLPPb84BFQiGSKk0+zt3X73sdC3uL5lOBe?=
 =?us-ascii?Q?rL3jwJ8FRJXsM3/FeBcwaBdVckwItP1kQM0Pna6leVSsxnQJrIvgvh6059pr?=
 =?us-ascii?Q?MUgLexcdqSgPEn70d9DlM4d3pSzbHjAB+91c+wHgVMORdBlDVYCITN1oLOrq?=
 =?us-ascii?Q?mOkw6wRDEEsW6NL4Hcoq3ShVY1TmLkc7RBPsZ7PG2LoUJ+/CIksVfrjYk8wi?=
 =?us-ascii?Q?5r1Ucx9be7KlOgS+8/XFg6WItYlJ6LScKDwewuN2snirjbMYWpbCFOdCK9nJ?=
 =?us-ascii?Q?cLPh7hiD7aRhPfN5bK5H6QbwvVuVQ79He5D6+C5pEMSKJVby5ANEEjNJsrd/?=
 =?us-ascii?Q?WjWy1ZNU8f7VEjazbVK5NuieuBkysFHJcnMLBmEKpyjb5GT1ywBhltfRHx5q?=
 =?us-ascii?Q?DsVqlK6OytfkrT8K7W6r7jcdT7PqgmtEvgvCYRmCWTzkK+cTwKA/Z1QsdrvI?=
 =?us-ascii?Q?VlV6fgakiCOp9Rm81cCIA9APvHjVnrdZdZBk2jlRfG754G+6pH2bM+vaTqox?=
 =?us-ascii?Q?oZC+9UCwzCQzFN35hGzZd9uBVuo7Quxg/UANH5N6TuyI9cnT8iRQTrfti87f?=
 =?us-ascii?Q?BZ6y+R2a57NmyiKzF28s7dhPt7nVNH++QlrogHkF5xJodkGZyjSO/cypdGUL?=
 =?us-ascii?Q?TD81VTC8lMhZM600zy25bi6gXyioOHf8GrKVBJmUc/7OTHmoZXY/h9sIX7IB?=
 =?us-ascii?Q?pmds5DXAGpzqe3oNsSxcJhslRJG8sQ6Ju+U6y1A5y41tcc9mC95Z1g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TrxOTROAXU0ysCQh4m8Vnj7JMFtAszYMN+CBHk+aPJ5y0h5jUlt1vbWAHAlb?=
 =?us-ascii?Q?9Vn+rjfTTf/bqqJXm7kOgbynBuLKVUZIGY7s+JLitSLscJN1Tl2ANehrxXIc?=
 =?us-ascii?Q?2moXiwblsfZBA8ty5x8zRyYdFBvI3OtxOXtBvQmpjSuqOV2EXvFZu5gFxmR+?=
 =?us-ascii?Q?q/dGkNWPE/Sj9EN7d9V+YqX/YEenElb7EujpWgD8C0cqVHSymWqWQ4XIfcH+?=
 =?us-ascii?Q?VrhH+DUEOOypdkijsdvtl3xJXAX5I6GfoVQKPjdzBt8+g6023WpsfFRF7HZ4?=
 =?us-ascii?Q?wfmOuDm8qck+E+YyF6/4wahjgUsD+V0/z3Rgo7aUhqH7mRNTEKwMI++b2z4k?=
 =?us-ascii?Q?VR2tAHn9qAWSbp5YHIzC09IkdXgYe/12GnlykKVce9I7zKtGQ0qgznffkdVd?=
 =?us-ascii?Q?hr2AFRXv3U74fjy19yYEIPz4mTC1ZbIeNci13YaKfOZqn1mZ5xXuz4wvZn9n?=
 =?us-ascii?Q?5O8K2EwclvuIYM32Sc8fJAEtirdWDrrMAdlnsU5h+SVKMCbxu1Hs6bdCe/wO?=
 =?us-ascii?Q?Ob0Q4O8PuGLuh5joIsKLZURB0i93gZt3zlG0dOOgAl9BtIz4rv9xdIDQSpdM?=
 =?us-ascii?Q?JkGcQMp9UL9UT97lCWfn/GysyD516HuXc0/SXiUMUxXYyHf/rUdQWUYMPtQq?=
 =?us-ascii?Q?wa6CvVfKKlOhSkdVi9iNUGj5P48ZfbzIiUaNzqjPBPTiguCLbhAimCNXvfMM?=
 =?us-ascii?Q?EQVp9fD0eO1mS90oWIRD6gR1jz1866NJWuTkuvazdYeCZ+K6xXgENgGwPxVi?=
 =?us-ascii?Q?6XCwZ/Yb7GANue8oMoqypK0shlAiVk0KWeXDodJilCyT6PicMXzlcTlHiUf3?=
 =?us-ascii?Q?gSKbx0pqT2gbyk87uaEbFZGtEUGpscJKiiK5KHAJN0fidY2nhYupbDbStdvP?=
 =?us-ascii?Q?H9fF3MjbQtVqzwijW1B18YKt0nlZVf6kBj4nuwimeMUdkeVUOyJ+oYN1JmaB?=
 =?us-ascii?Q?Dx7qHaI0091/XxRE8uagLbiQqo4LnrSROW46AyuH0i7wYDBfwToYtQiFTvjp?=
 =?us-ascii?Q?8o5CFco2WWj53b8v6scg6jAhtvLMm9LaT8GHG4iCuJe4rcgSiosq8jF8eUJl?=
 =?us-ascii?Q?43Sgo19i0qskWSwEkFXLKZ6iJzDB/tnFhE/YqS04vOnt278GF8PM+IkVGttp?=
 =?us-ascii?Q?602PSQU9rUhr4Sb+Azpp3/bQQ9dcxx7WasBRXOOoiUuiinyYPcQRxJ04VPHf?=
 =?us-ascii?Q?nVUHpleJh4ufhEdMX+R+OJlQRCRwzZSnBg4/S66cpcayJf6NWgfrp1mya/5B?=
 =?us-ascii?Q?dOSGTaMMqSV9g0NVWrjl16Mx3KBeRxx3t7pXNDtLCLNcClVifoLpp0QImCX1?=
 =?us-ascii?Q?ic+xNijzwbaq7+QAFanhUJkgMLQxKdsFtldom64m/1xTLMwJt0LysCdJZIOu?=
 =?us-ascii?Q?oOOqGDC8iSaDNxUmpov2FBM2PLNZqxYMRlk4GR4RPLkkG7KHNSAlPyIt6C+T?=
 =?us-ascii?Q?idehSPYP5bjMdD1JBnRkn+aKCyeaF/beSVAr0c0h5d2Lmaq+kSWIFSB4UYr2?=
 =?us-ascii?Q?oSzsB+bP8Pf/ZT+Z4iG90SLMf8oeIcu8Npxr0n7q65Ei3rHhvECxv/MdBUqo?=
 =?us-ascii?Q?cOdfbzG5sC2GfmsoW78=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c553f162-6715-479a-3dca-08dd975cf060
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 05:12:38.1970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAinCfQlFWto6aToPG6KZ8EAjwqu9jqxmeaBUFQg4RQdyzxet72WyEswQfA6GU6j46W5rjn+jTsUflYb5kjuKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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

[AMD Official Use Only - AMD Internal Distribution Only]

Series is Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Yogesh M=
ohan Marimuthu
Sent: Monday, May 19, 2025 9:59 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal f=
ence

For negative test cases where the job will not complete need to skip signal=
 fence. Pass a flag to amdgpu_user_queue_submit() to skip signal fence wait=
.

v2: rebase to latest code

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_compute.c            |  2 +-
 lib/amdgpu/amd_userq.c              | 36 +++++++++++++++--------------
 lib/amdgpu/amd_userq.h              |  2 +-
 tests/amdgpu/amd_basic.c            |  4 ++--
 tests/amdgpu/amd_cs_nop.c           |  2 +-
 6 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_s=
ubmission.c
index fcc356f8f..c3dad3231 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -68,7 +68,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle devic=
e, unsigned int ip_type
        memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*=
ring_context->pm4));

        if (user_queue)
-               amdgpu_user_queue_submit(device, ring_context, ip_type, ib_=
result_mc_address);
+               amdgpu_user_queue_submit(device, ring_context, ip_type,
+ib_result_mc_address, false);
        else {
                ring_context->ib_info.ib_mc_address =3D ib_result_mc_addres=
s;
                ring_context->ib_info.size =3D ring_context->pm4_dw; diff -=
-git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c index 95bfa53aa.=
.008186049 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -91,7 +91,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_=
handle device, bool use

                if (user_queue) {
                        amdgpu_user_queue_submit(device, ring_context, AMD_=
IP_COMPUTE,
-                                                ib_result_mc_address);
+                                                ib_result_mc_address, fals=
e);
                } else {
                        memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info=
));
                        ib_info.ib_mc_address =3D ib_result_mc_address; dif=
f --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c index f8e1a4b45..=
0a983834c 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -127,7 +127,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle d=
evice_handle,  }

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-                             unsigned int ip_type, uint64_t mc_address)
+                             unsigned int ip_type, uint64_t mc_address, bo=
ol skip_signal)
 {
        int r;
        uint32_t control =3D ring_context->pm4_dw; @@ -166,22 +166,24 @@ vo=
id amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring=
_co
        /* Update the door bell */
        ring_context->doorbell_cpu[DOORBELL_INDEX] =3D *ring_context->wptr_=
cpu;

-       /* Add a fence packet for signal */
-       syncarray[0] =3D ring_context->timeline_syncobj_handle;
-       signal_data.queue_id =3D ring_context->queue_id;
-       signal_data.syncobj_handles =3D (uintptr_t)syncarray;
-       signal_data.num_syncobj_handles =3D 1;
-       signal_data.bo_read_handles =3D 0;
-       signal_data.bo_write_handles =3D 0;
-       signal_data.num_bo_read_handles =3D 0;
-       signal_data.num_bo_write_handles =3D 0;
-
-       r =3D amdgpu_userq_signal(device, &signal_data);
-       igt_assert_eq(r, 0);
+       if (!skip_signal) {
+               /* Add a fence packet for signal */
+               syncarray[0] =3D ring_context->timeline_syncobj_handle;
+               signal_data.queue_id =3D ring_context->queue_id;
+               signal_data.syncobj_handles =3D (uintptr_t)syncarray;
+               signal_data.num_syncobj_handles =3D 1;
+               signal_data.bo_read_handles =3D 0;
+               signal_data.bo_write_handles =3D 0;
+               signal_data.num_bo_read_handles =3D 0;
+               signal_data.num_bo_write_handles =3D 0;
+
+               r =3D amdgpu_userq_signal(device, &signal_data);
+               igt_assert_eq(r, 0);

-       r =3D amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncob=
j_handle, 1, timeout,
-                                  DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
-       igt_assert_eq(r, 0);
+               r =3D amdgpu_cs_syncobj_wait(device, &ring_context->timelin=
e_syncobj_handle, 1,
+                                          timeout, DRM_SYNCOBJ_WAIT_FLAGS_=
WAIT_ALL, NULL);
+               igt_assert_eq(r, 0);
+       }
 }

 void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct =
amdgpu_ring_context *ctxt, @@ -456,7 +458,7 @@ int amdgpu_timeline_syncobj_=
wait(amdgpu_device_handle device_handle,  }

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-       unsigned int ip_type, uint64_t mc_address)
+       unsigned int ip_type, uint64_t mc_address, bool skip_signal)
 {
 }

diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h index b29e97cc=
f..dc39c1ca4 100644
--- a/lib/amdgpu/amd_userq.h
+++ b/lib/amdgpu/amd_userq.h
@@ -50,6 +50,6 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle devic=
e_handle, struct amdgpu
                               unsigned int ip_type);

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-                             unsigned int ip_type, uint64_t mc_address);
+                             unsigned int ip_type, uint64_t mc_address, bo=
ol skip_signal);

 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index 97a0=
8a9a3..914d27909 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -607,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device=
_handle, bool user_queue)
        if (user_queue) {
                ring_context->pm4_dw =3D ib_info.size;
                amdgpu_user_queue_submit(device_handle, ring_context, ip_bl=
ock->type,
-                                        ib_result_mc_address);
+                                        ib_result_mc_address, false);
        } else {
                r =3D amdgpu_cs_submit(context_handle[1], 0, &ibs_request, =
1);
        }
@@ -647,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device=
_handle, bool user_queue)
        if (user_queue) {
                ring_context->pm4_dw =3D ib_info.size;
                amdgpu_user_queue_submit(device_handle, ring_context, ip_bl=
ock->type,
-                                       ib_info.ib_mc_address);
+                                        ib_info.ib_mc_address, false);
        } else {
                r =3D amdgpu_cs_submit(context_handle[0], 0, &ibs_request, =
1);
                igt_assert_eq(r, 0);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c index 26=
8bc9201..658c8d050 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
                        if (user_queue) {
                                ring_context->pm4_dw =3D ib_info.size;
                                amdgpu_user_queue_submit(device, ring_conte=
xt, ip_type,
-                                                        ib_info.ib_mc_addr=
ess);
+                                                        ib_info.ib_mc_addr=
ess, false);
                                igt_assert_eq(r, 0);
                        } else {
                                r =3D amdgpu_cs_submit(context, 0, &ibs_req=
uest, 1);
--
2.43.0

