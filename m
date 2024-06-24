Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30F1C27C4F
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 01:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6522610E174;
	Mon, 24 Jun 2024 01:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SgJ2R3aT";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C510E174
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 01:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wuqxc/4vX05Jve4SaRmtIE9K0My4d9Ou9ZgbFWNGA2avJDMCRuFWjFrAby227oi6/Wt3ULBhP3P2V+rWlqsCGxO1eKnINigHGH9emSGIQaTAwSbisO0Qw202J53hShdjo4RAWr0xoyoUMScW1DFcj3Yv1gs5lJOD2CeYrnsEH1fKgZ/GZBH0mWorbvc5cs3yj2BrGVvyuNm3imD2s+EIWCG3q4OyNzy6VwIPvSw62OpqwhnaHKzdos5bdI2KA0M6vUuBQjU1mZcKlvjdlrvJFK0O9Ecaj3lemfvpb31WKLxyBvYwlKpbvgxuyM/ZajtXwE3uuubiQR0gwN6Gx2QVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blRO8JEcgkwDJ2BNVDRaHdnoqCsByTtL1621trgpCc4=;
 b=RN07zk8pmKeFm/ouwUE8xlrhD9WtD2GDlYWY7uCdAQ/VFzjZUK2bMQdXA+D/P3+zZEg9Jfd92w9L0jfTwSn2QG92J0DT18jQx6JyuP3wBD7RrdDoABTUrAA68g8sUzurq5Ox4q3AlAbNT0zfk4b3Skv31R/JREkTw7yDyXVJKJ53JqGATViN89Z+YnX73E+KWbKAyPv4DruWx9E1tN7WE3xm9VgXNfeEQcP0aRAfs/6dA9NuF+GY5pIFNUlNaChQyxjT/l7bAqJjtnE8CHnc2Up68Jdr/iQ57nuAK9vjmoT09ar2iFUJ3FhonUcpF9WLnT4by2BgYvOzWtt9Ue8ZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blRO8JEcgkwDJ2BNVDRaHdnoqCsByTtL1621trgpCc4=;
 b=SgJ2R3aT9lvW3dy2MypBNfrMxZPtEZKUx0vCIGpEWnFl3MKdipF7LSHF14ULGA8n/OCIKLLcBpa5gmT5rzeqv5sc4llHcOZgnG+7FBln1c2Vgbq7JdkaDhau4v3ub/ESn9j+VkJVpE1O+NVJekS4U2s2jRg/dg9sNu+Ai4zZnbQ=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Mon, 24 Jun
 2024 01:57:33 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 01:57:33 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 2/2] tests/amdgpu/gang_cs: skip test for some chips
Thread-Topic: [PATCH 2/2] tests/amdgpu/gang_cs: skip test for some chips
Thread-Index: AQHaxPbZc5V2dEPreUGlmZsnziMA37HWKcZw
Date: Mon, 24 Jun 2024 01:57:33 +0000
Message-ID: <DM4PR12MB51523BCAF47CEDBE51792D29E3D42@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240622225216.108985-1-vitaly.prosyak@amd.com>
 <20240622225216.108985-2-vitaly.prosyak@amd.com>
In-Reply-To: <20240622225216.108985-2-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6428d487-4eee-4ab3-8965-4b54571d9e27;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-24T01:57:21Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY8PR12MB8299:EE_
x-ms-office365-filtering-correlation-id: 0f868b43-21af-481c-caf5-08dc93f10375
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?Lm4PTYJuj+IFjblwmLAvN1VobnaG28COvGXlrrhxG81Ldo7LLxeUXcZfxQgt?=
 =?us-ascii?Q?5FAXuK3fUeIUtd5VLX6qv4dKt6D5+4sCWHc9m75h/z21/HaiT1b4ltiBlWxi?=
 =?us-ascii?Q?d8BwoX8J/e6xFkK+X4n48qOV1TwxsnTk9KKwK6BV4T5x6Fo+vnOmOr45nVNr?=
 =?us-ascii?Q?dFrIpF8B+1wThQOsihHlHCNUKjoG7Gz6a8DAvy/zT0WY66emgfbpGuo1DDd6?=
 =?us-ascii?Q?QIv0pgLkBzZYSHXaHQK9y/wtDFR4gjD7UTchPvsnZ0EvUsc0CYypBlKlzqea?=
 =?us-ascii?Q?Od3Zw2UxMLhkpC628Iq18mCoQYaOVaKuPGSZWexWgSrcwba1R/yfWpEKXSCT?=
 =?us-ascii?Q?jy3ruCxOCCadmx/JQIjH45TQb9mGwX5FzpUm6iQrDkdmu4tYGST2VJ327huF?=
 =?us-ascii?Q?HXr+ZewODxQwFaQEjwnauYyUOkNejjKm9attP4OvOTK4zWKFXugdfIOeh1SJ?=
 =?us-ascii?Q?7/b3lk/9ctSXRzk2+iB9abYuoNNlUWS3U+/5D4pvan6DyTvszIZ4dgYmXXIW?=
 =?us-ascii?Q?w1yV43QU3yVTAqxP09RxTOJjPZOid1TEw30lnkuBwFbUHZ3c2zWQJX7QkETq?=
 =?us-ascii?Q?Vg8F6AwNpfrjJF+yaBN9IWtb+VT7QAEGqqDaBF6+ee/JiOy5/FWa4L//i6Tf?=
 =?us-ascii?Q?O/GJzI7EbP3MGpIzGhvlBTOh4lFuRzZaMPTUKJPotHmxF30PKH/VJkSuAJAi?=
 =?us-ascii?Q?TK7MvWDczFE0DQyZHTw7AyEt4qBk3L7dk14rz5bK2voAG0sSH6NiFfqTCx42?=
 =?us-ascii?Q?10RTMHgl8FG/rkCUZY6rnJAwnWrJu+HqfRXyQ2f7byW/VvY6PfgL2ER99HxH?=
 =?us-ascii?Q?BsobXJS208FwHXo7J9yokB3m+Z5t87lO3c/C3Bu2WzAoU4lKEmKDHsAjpwtt?=
 =?us-ascii?Q?85ULHDTuf8GeiaaqWBGMHiXTrMmZUMKfL+7KC2AupLVpaAfsYP7O/IVInTg5?=
 =?us-ascii?Q?Cbl3A9/WRRP5Gq5sJyuEkaydcLxfuXSis/IZh5wmV84MZA/JBKEHBkAri4cj?=
 =?us-ascii?Q?i3RFH8Wuzwq6ojStlYBcAaHLNbz7aQUnanKJ8kYCifQDoVjuW8zaLVA5zzzV?=
 =?us-ascii?Q?uD78Ka+dVtZ0nZY7QTxuxWtPrtn6D60hj4WhOJhquCBrGdfxw2Y+FFNukcbE?=
 =?us-ascii?Q?LT/LWMZEDAg2IirKL1jAzCv2SPGDzb9iTMYO3hr4aW019jodOPLhewOm8Puz?=
 =?us-ascii?Q?JVyUexQ+aWpL21ISi5BRxDmU48VrKxL6rq7PZyLwaXNsGI6u3G6Ti/4Ieaex?=
 =?us-ascii?Q?B8j8ypI9ga5/XzRoUQsMy/HjYlJwEy+eoIT1vvyY2YX2Ie3HAxccL0+oday2?=
 =?us-ascii?Q?X4nEHV/Ev24Z9AR1EKmTNs2uo0gIbvzZuU9ARKstPkj7y1P5aXfarj84YUVt?=
 =?us-ascii?Q?/IO6du4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k7im11zzTjhkVKfQAIFAcIKM5pgyKzJbG0dVXH/z3PboAO4g0OwiJ93pS9XW?=
 =?us-ascii?Q?t9MUat+EVe9s3W27IN9mhfJ3IugWtu3HExrR8MvJDF+NpOWyRXm4GZvd2QWp?=
 =?us-ascii?Q?SOP6iBu/kEOab95FIZdMa4YbJ1zSucG9Sd/oQQEypG6DJRlFBHyl07hwF6ZC?=
 =?us-ascii?Q?ZhgLrC+cAgnaZG5EHy2cuoUhlg5qFUU6o9QCnJmMjarBA+a3Wt5eG/LSjQ5e?=
 =?us-ascii?Q?ib7N8RpC2le6r8TUSDP9NCUcCjMCyARSCGUzvas5HeYq0T2MryknMLr6TXXu?=
 =?us-ascii?Q?N9hgqLtlgducNdXS/y2u3NKoxES7tEVI4/HJZ5birXxHaAsCDEjArW6ZibMk?=
 =?us-ascii?Q?WNCaEYQiD8NN2BLCLoytht/K29ZluPxCjk7DFUFJeNOwKM4TgLNjxTk+xegb?=
 =?us-ascii?Q?PHPhXK44NJ2lR9j5Ayg+JVkBa/hWXzjkmfgLfMFhhn0oziIC330z1gw3AKdh?=
 =?us-ascii?Q?xQGoapZi5vX21iQD4rBzTSEgvCa/OMBvaCR5U3XURieh6ixDC64Y6ZitXV/e?=
 =?us-ascii?Q?Q9HXk/F+6L2PVplzAOIBG7KQhgRhms+8DAODnkcI3Hhgsfv4ycUxkPNWAMc5?=
 =?us-ascii?Q?spbzNo9eirWlQKGP9sGP5myJaZXJfB4LSwsl/v2an+C+vhRsS0mjJTPa5MIf?=
 =?us-ascii?Q?fuAHirso8N9poGFuhIg7Tx2AQVN+4EXwvRODO38KY1WoiPEQ27VRspBVXjbi?=
 =?us-ascii?Q?7UVkEvfS8WVtk/d//uybZcVAbnXhJzyNnapN/X6rngcLfkN5rCwp0gsTRpR1?=
 =?us-ascii?Q?FYyiyPyLqlTwoe7NxG8w4NYLkkbXYDOJOy0ektb9+6hbFA+BuinHl4JxBwlq?=
 =?us-ascii?Q?lktnitGY+hw/eIEEcEJvTax8O1dSVVU/4Ax9UuGEd8TT8dbzPYOBjboWZ2yk?=
 =?us-ascii?Q?lROTbGzQe0sTTHgW6ZTYCDfi9xa6xCBTvHfJic+l/d4d6F6PesfiSZWb3Tpt?=
 =?us-ascii?Q?UcuguIuhppn3DHd8k0TfHZFwysnkVYJtBoHI/rzqS7wVDSlKnm9kBjbbYg7j?=
 =?us-ascii?Q?NJZliC6xcoUpUrq3e14tX/ZN8rfd6/zcg8OkGy0r1Y3nXGihNk9YobHiw4FT?=
 =?us-ascii?Q?0RRmIGKymU2ioT7w1FG+DR3GHRl0kfdd8rdod/fm6/l3EJSgC053SQFD5PzS?=
 =?us-ascii?Q?4NxalkPogt9wwUAZc7IubLaCPXcrdgmHPDR2S7ihlHDxz9Hc9VZuUqKV+AYT?=
 =?us-ascii?Q?moKbIApRCkcwmRBYTh2BP+grJ0ZX39E+eyW0DArGwbUjyEcpXc3FbYBKh2Yz?=
 =?us-ascii?Q?duzhgJ2gRuGpWX4uA+yQb1Jfb//WSyc0h/OAC7sRIiYCwbxqPFeCvHC7fvWL?=
 =?us-ascii?Q?nzwRX4qX405fGA2CZ2o7NkaWaSUysTslYP9K+jBdjcfowu79kaT3feOh8iyJ?=
 =?us-ascii?Q?S15esc0kzbg1++R55uEK5DVvty/kipwXLkZ8xzWV8arhI1j31MmA8bdD1ThO?=
 =?us-ascii?Q?wfMNfQXa1o24mLaKCeiySWATSCQiS/SMlocFhgk488DdjHMUAozJHiV81WJT?=
 =?us-ascii?Q?ij8E9XbWe0Ieto92uYN/wHC10pB3J0MjfNcd/yegTZagd8EsHQSIpiu8IH/2?=
 =?us-ascii?Q?QvEzmb9w9nUN+I4iqVc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f868b43-21af-481c-caf5-08dc93f10375
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 01:57:33.3980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q52TryHb3xjuU/3azWjiacVXiZJ2bjbcyBHr6/JDFNv24B9NyHV2JdooAyVjwof+2Wpr0W5IHwJRwF2Lk5M1pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299
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

This patch looks good to me.

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Sunday, June 23, 2024 6:52 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Kamil Koni=
eczny <kamil.konieczny@linux.intel.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd=
.com>
Subject: [PATCH 2/2] tests/amdgpu/gang_cs: skip test for some chips

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Check if gang tests are enabled based on GPU information.
Gang tests are supported starting with Vega10, but are broken on Navi10 and=
 Navi14. This function mirrors the logic in amdgpu.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_gang_cs.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c index =
722c376ee..699862670 100644
--- a/tests/amdgpu/amd_gang_cs.c
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -9,10 +9,38 @@
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_cs_radv.h"
+#include "lib/amdgpu/amd_family.h"

 #define IB_SIZE        4096

+/**
+ * Check if gang tests are enabled based on GPU information.
+ *
+ * Gang tests are supported starting with Vega10 but are broken on Navi10 =
and Navi14.
+ * This function mirrors the logic in the following amdgpu code:
+ *
+ * void amdgpu_vm_manager_init(struct amdgpu_device *adev) {
+ *     adev->vm_manager.concurrent_flush =3D !(adev->asic_type < CHIP_VEGA=
10 ||
+ *                                           adev->asic_type =3D=3D CHIP_N=
AVI10 ||
+ *                                           adev->asic_type =3D=3D CHIP_N=
AVI14);
+ * }
+ *
+ * @param gpu_info: Pointer to the structure containing GPU information.
+ * @return: True if gang tests are enabled, false otherwise.
+ */
+static bool is_gang_tests_enable(const struct chip_info *pChip) {
+       /* Concurrent flushes are supported only on Vega10 and newer,
+        * excluding Navi10 and Navi14 due to known issues.
+        */
+       if (pChip->family < CHIP_VEGA10 ||
+               pChip->family =3D=3D CHIP_NAVI10 ||
+               pChip->family =3D=3D CHIP_NAVI14) {
+               return false;
+       }

+       return true;
+}

 static void
 prepare_compute_cp_packet(amdgpu_device_handle device, @@ -233,6 +261,7 @@=
 igt_main
                igt_assert_eq(r, 0);
                r =3D setup_amdgpu_ip_blocks(major, minor, &gpu_info, devic=
e);
                igt_assert_eq(r, 0);
+               igt_skip_on(!is_gang_tests_enable(g_pChip));
                asic_rings_readness(device, 1, arr_cap);

        }
--
2.25.1

