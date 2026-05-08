Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF89FCD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 19:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4584910F5CE;
	Fri,  8 May 2026 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rCBzpx8J";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1591810F5CE
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 19:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGQW5uSpd8YHBLX+qrisHGaoO13e6EED0BOC1WN9Cj3vFwlylSXdv1t/YtdorcqjO8/Z5C04qywqTlkLclG4bROlWwlqFYaDIpANKTauW4+NmbNtSLGMelOVzOab+w1n01FdQ0h9MItHCa+AXZpwQFJCid4nXo9ww16O3mGw2G2YYLvg4AsN7K54UwcGElUIjNbtuU/ADwhYuimo+AeBHxlsEKw3XhzF40p3IejaDDXX+QIWQnDFfWuuIl93SmpEW/v6nuHau6XNYg17zgDfmGExOo1l7PjiUYDJr99GhRNGGlqa4IQLCSZ/TF2npToxQ++bnRdchJM9xLX6zWqnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aWyrQIHcPB6hrsmgYd0T+A3K6dEjxi3kNY/aeKhL9s=;
 b=tLdtH15wfpXKq9v0r92+6WxquvDjqIkD6seeJ+/Txyk/SuFebFFSg/yC/XCRU7V1ZmGYXsWvyEfyhO2ivZH4yfqXyEe9XhrZ11xlrhNs60Gbuuithtci2UAmrRrV1sUNkWxLKHF4uHsJyqFKpREnnpLlubZ8HcjsYcmBcgmy/dg88qhamJfFZkSNYZz0UF6H4mttaH160gCNGr0NmC9XkcNTyrCaWl+2j0GJ5j1zpIcV8VGviOlEbHpvkNKaLWzaSutSOWdV1cU6dcFNE0mwM/CTJE+ACh+FwmhwyIZLo67Mmcazd504xTk7KomwendFiGYX5Xw42XPiE6730vATWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aWyrQIHcPB6hrsmgYd0T+A3K6dEjxi3kNY/aeKhL9s=;
 b=rCBzpx8JXAIdBVAKfeaLflMdzQfKmjXeNkz4A7vwskm6fAvLp4G1603m5e4whtcTiQ9+4fW1EXuxFchQQG/0ZB8+3kFA/RFvQvtMgrnD8N67JNbwGMwhSV60zbBQqt85zeu4EfOa5IwMcEMpdPkJqzT51TuVgOSB7yj4pJWqhro=
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 19:26:09 +0000
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675]) by SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675%6]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 19:26:09 +0000
From: "Strawbridge, Michael" <Michael.Strawbridge@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/amdgpu: temporarily skip amd_fuzzing_sysfs on
 Polaris and Vega20
Thread-Topic: [PATCH] tests/amdgpu: temporarily skip amd_fuzzing_sysfs on
 Polaris and Vega20
Thread-Index: AQHc3xacxs4MZFLos0K5/GrboIZkArYEgsjq
Date: Fri, 8 May 2026 19:26:09 +0000
Message-ID: <SJ0PR12MB6855A03C6479F0FD26418997E83D2@SJ0PR12MB6855.namprd12.prod.outlook.com>
References: <20260508181459.36546-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260508181459.36546-1-vitaly.prosyak@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-08T19:26:08.781Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6855:EE_|PH0PR12MB5606:EE_
x-ms-office365-filtering-correlation-id: 1c18c26b-8cb1-454a-2d7a-08dead37a866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021|8096899003;
x-microsoft-antispam-message-info: briefzywXo+X+xxfYohwsQNc/Ms7yklV/ONe02f+dj3G7xl/imILnnsEIcu1Ot5UzE8IoqRFT7NIqyqXSkst1T/sjW8xxtCAh5A3W9lnOM3Bf8u8lnu77oYk5Vg6cvUii4ENf0eFkx4GrmJTIOlK5i4cTVWjjqEySCfmURm8ijR8PGA1JmgxRtANiWC6JREVZoMLNZCh0aQOleaZ8WC0H++FfEyRpzDsZsXNBUG49QtRu6HKl1BDi6whhgOhOBH6Fiukv5+HxcA5yCkjMUyODA5yKAzaRfYgySCgUFmpa6tlVWjsFCC0IGke5hxMW6fpuCLA4xBYm2QWnXFfCwWUy7uz1FmwwU5NWqJzYlqhPdIZchqbH2Jw7iOhbXwS9r3opoDRr6zqLCNyE1qer21rN1H+RLwMpLBDFe06R75kFjwfcOJzyCbiBiJkBhgKzEXxJCn5L+bzP9MevaxHB4GOm6VyWbWtmRG/OdIvdnbcNMUMcykBHh4G7FbqcSalaAFy5GuhPg5L1zcgFz64p20+mWG9fVqnExYcCGJ6QmKEk8UWp9BStBlqdX4L6EQlgTELmOeyGT/wAA3VOb3y1yoFTp5tqY1nZBnTj4K9iUA5Me4QzPEn3RbX17ADQ2eNEZV+xPxP4Yehwuk1y0AeWJWQZyiiOJ3NI2iFp4KR6BLk0rtkxpd2xU8pesOsDoCv7Atzd6HRuoS3Ba7JtsR3oWJElYXiyBzHMPClWj2cnHvn2bj/nY7IF5A9jYmE+WQOXpgp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XAYOouJ1ZK6OTacnz/qQ7NydW/2zJ20zpfI8Kxpp8tvXGiRePJCcW08MHbvf?=
 =?us-ascii?Q?9YdA5+/guSBywlc5wsPqMC+7rUxf/iJizny1j7OYfGiY+Flx9fTMk4kta1uf?=
 =?us-ascii?Q?O886ZJk9mZGy4BDQPDbecxriDANejR+8X5WppU92753UDW20TISxOkGt4KPt?=
 =?us-ascii?Q?EV7d2f8EV/FwKjUgFDdP7xt7OmZ11GxENn/iU/K2ZWhlU6jwyR3pRzQDKoSr?=
 =?us-ascii?Q?QIlkuGLgrAckiZUC1mJrclooTuJq9EUzm4UhN5rI7cJkXGeAOGoX3TaOLjD9?=
 =?us-ascii?Q?i7aeK8Y7DCwW2gR/HMMAxNEq7MEjwX4GV2dntKBXX5p7fZ6HsXL4FP8yn1eB?=
 =?us-ascii?Q?sX5GydiTGWT10gmVagJYoUigs467ZYD8d3ozJ2z2efWUZM2f3S4ypjsjDqAo?=
 =?us-ascii?Q?DSIxMNBl8AtexpCK9OTbIPTh35rJfxXlvwBlwOkSZ5ujEhsMT5UG9D2BMS0U?=
 =?us-ascii?Q?bTgOXQbph86C/v1x2THyMHbdViJ4wX8VUjjMwctAWfzbgKESFqC8X5zkzOGv?=
 =?us-ascii?Q?yesAPjmrSUT51TWvJH7eqzwdEqRWsWnCjl1UrFjhDx11ujIpiw3grDlzpM7y?=
 =?us-ascii?Q?AoX3RjP5iXpvNag+gEE8d/fk6755wpdqN1Va0CttfPRcRDO+adEr7jtXIipA?=
 =?us-ascii?Q?sQjVo6MLGfVScqaO5YI7kIljewufVTRpYx3wsgATtaNOg++1K3Q1kwVWTqwk?=
 =?us-ascii?Q?ALjx7iYLBZHk7ckJ8Nimrmjve5wYMmHHPdVrKApfPWZjZDCiV8c2oRBY3zex?=
 =?us-ascii?Q?hQCOMPeYmDM0L91pZ2Cd+/aFrKSlcjrNVVjzXSeV6S3y/WvQm4ihICMz9YSf?=
 =?us-ascii?Q?a2tFY2yqlxRBhvgPpshl+/mXtOdH4Jof7Y9FXql8uyS7iHVlLuduA3XvfAJX?=
 =?us-ascii?Q?4qevCNrqHm26+tsLgjygzaka8WSseeuEY8Eb0g1Kn535ld5Ci7JT5qFnwIsd?=
 =?us-ascii?Q?ABRiTAle4eZfZ8NPwmEoNvDB/3lD2zTBHwV1qNBzWwzhfOJU78OMjZWywigg?=
 =?us-ascii?Q?ElMmV8+XdtBcygN7h/99iucr1Qik5NtPSGrEDbbSMB/CQIk30DZJxDUpdroQ?=
 =?us-ascii?Q?ZoJPanTPRJN7xp1CIZcUbGSmzTV+xlHsLE4kPTTenLwfrfQfMggcr0bFOr9c?=
 =?us-ascii?Q?jPasJaGbIyzLjsBblWBxWnUPtmLHmpmt/3XTBx7xVKyG9HWsdCw8XgkBOsRw?=
 =?us-ascii?Q?Yeuc4xJZF7ohFeTYWQbV5fVuJjKoi52uFVIYwSxAFv3Ueuw9cy2hNrRi+tOY?=
 =?us-ascii?Q?rrtaF+BRNY3gS7pxGjyBYkQhBFoeq8gM1ato9BJFOL38ERyOcGIUDQNZrvnU?=
 =?us-ascii?Q?mMkOhqxcY8c9S+oTHEKAGfUff3JStBvF0c0d+JAd6m3JteSMj0Ptj7EABx0K?=
 =?us-ascii?Q?JJJ5ncdl1dzlpGgadQLb5D8xpvWFOMPeK5D5NNDvuID4JabNOzej9yoMX4xy?=
 =?us-ascii?Q?8RL3wP6wI8pSNIG6TNMjWdZgHZhtEBVie1iwdezRmT3hRMEuQWrXrWzHCTxc?=
 =?us-ascii?Q?dC9JrrKtl8FRhPbTBR4qYsFrQaA9gAd/qtTyK+Bw8gyNQ/+pkW0Zv0aZPslp?=
 =?us-ascii?Q?V4nZK1ppGiWQ1MtDfhpHKv6ZMNYmIZGVRrz1iXtcoOuWRbT3TQvWk0nIMJMY?=
 =?us-ascii?Q?1ZHTPllfFbjPSxiPmDiN210bDqGJGpbaTNf5Xz8pJoQhZ4/LgTsCLLqlBH+L?=
 =?us-ascii?Q?Je9g+YM1T78kBLt2smyyWJGIRF//j7spW/MCVied/n/FVQSb?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR12MB6855A03C6479F0FD26418997E83D2SJ0PR12MB6855namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6855.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c18c26b-8cb1-454a-2d7a-08dead37a866
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 19:26:09.2842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ieZnPjj4I8VgJ4RSRTi3iyyIMLF7B7EoebcU0YXKRvivWQdIwYf5OSZiL7f7wtDeSHW/5yj2b0rCdsBwQ/eZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606
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

--_000_SJ0PR12MB6855A03C6479F0FD26418997E83D2SJ0PR12MB6855namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Hi Vitaly,

I think this looks ok.  Feel free to add:
Reviewed-by: Michael Strawbridge <michael.strawbridge@amd.com>

Michael
________________________________
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: 08 May 2026 2:14 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Strawbridge, Michael <Michael=
.Strawbridge@amd.com>
Subject: [PATCH] tests/amdgpu: temporarily skip amd_fuzzing_sysfs on Polari=
s and Vega20

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Temporarily disable PPTable fuzzing tests on Polaris (AMDGPU_FAMILY_VI)
and Vega20 (AMDGPU_FAMILY_AI) ASICs while kernel-side robustness
improvements are being reviewed upstream.

The test writes intentionally malformed PPTable data to exercise kernel
error handling paths. Some edge cases in the v1.0 PPTable parser's error
recovery paths are being addressed in parallel kernel patches.

This skip is temporary and will be reverted once the corresponding kernel
fixes are merged and available in target kernels.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sy=
sfs.c
index a9b53ce81..b02f3b7ce 100644
--- a/tests/amdgpu/amd_fuzzing_sysfs.c
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -28,6 +28,8 @@

 #include "igt.h"
 #include "igt_sysfs.h"
+#include <amdgpu.h>
+#include <drm/amdgpu_drm.h>
 #include "amd_sysfs_spec.h"

 #define AMDGPU_SYSFS_BASE "/sys/class/drm"
@@ -722,11 +724,33 @@ int igt_main()
         char card_path[MAX_SYSFS_PATH];
         const struct sysfs_file_info *file;
         int card_found =3D 0;
+       int fd =3D -1;
+       amdgpu_device_handle device =3D NULL;
+       uint32_t major, minor;
+       struct amdgpu_gpu_info gpu_info =3D {0};
+

         igt_fixture() {
                 card_found =3D (find_amdgpu_card(card_path, sizeof(card_pa=
th)) =3D=3D 0);
                 igt_require_f(card_found, "No AMDGPU card found\n");
                 igt_require(getuid() =3D=3D 0);  /* Need root for write ac=
cess */
+
+               /* Open device to check ASIC family */
+               fd =3D drm_open_driver(DRIVER_AMDGPU);
+               igt_require(fd >=3D 0);
+
+               igt_require(amdgpu_device_initialize(fd, &major, &minor, &d=
evice) =3D=3D 0);
+               igt_require(amdgpu_query_gpu_info(device, &gpu_info) =3D=3D=
 0);
+
+               /* Skip test on Polaris (VI) and Vega20 (AI) due to known P=
PTable handling issues */
+               if (gpu_info.family_id =3D=3D AMDGPU_FAMILY_VI ||   /* Pola=
ris (GFX8) */
+                   gpu_info.family_id =3D=3D AMDGPU_FAMILY_AI) {   /* Vega=
20 (GFX9) */
+                       igt_info("Skipping fuzzing tests on Polaris/Vega20 =
(family_id=3D%d) - known PPTable handling issues\n",
+                                gpu_info.family_id);
+                       amdgpu_device_deinitialize(device);
+                       close(fd);
+                       igt_skip("PPTable fuzzing not supported on this ASI=
C\n");
+               }
         }

         for (file =3D amdgpu_sysfs_files; file->name !=3D NULL; file++) {
@@ -758,4 +782,11 @@ int igt_main()
                         break;
                 }
         }
+
+       igt_fixture() {
+               if (device)
+                       amdgpu_device_deinitialize(device);
+               if (fd >=3D 0)
+                       close(fd);
+       }
 }
--
2.54.0


--_000_SJ0PR12MB6855A03C6479F0FD26418997E83D2SJ0PR12MB6855namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 0, 255)=
; margin-left: 5pt; font-size: 10pt;">
AMD General</div>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Vitaly,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I think this looks ok.&nbsp; Feel free to add:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Michael Strawbridge &lt;michael.strawbridge@amd.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Michael</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vitaly.prosyak@amd.co=
m &lt;vitaly.prosyak@amd.com&gt;<br>
<b>Sent:</b> 08 May 2026 2:14 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Strawbridge, Mic=
hael &lt;Michael.Strawbridge@amd.com&gt;<br>
<b>Subject:</b> [PATCH] tests/amdgpu: temporarily skip amd_fuzzing_sysfs on=
 Polaris and Vega20</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt=
;<br>
<br>
Temporarily disable PPTable fuzzing tests on Polaris (AMDGPU_FAMILY_VI)<br>
and Vega20 (AMDGPU_FAMILY_AI) ASICs while kernel-side robustness<br>
improvements are being reviewed upstream.<br>
<br>
The test writes intentionally malformed PPTable data to exercise kernel<br>
error handling paths. Some edge cases in the v1.0 PPTable parser's error<br=
>
recovery paths are being addressed in parallel kernel patches.<br>
<br>
This skip is temporary and will be reverted once the corresponding kernel<b=
r>
fixes are merged and available in target kernels.<br>
<br>
Cc: Michael Strawbridge &lt;michael.strawbridge@amd.com&gt;<br>
Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_fuzzing_sysfs.c | 31 +++++++++++++++++++++++++++++++=
<br>
&nbsp;1 file changed, 31 insertions(+)<br>
<br>
diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sy=
sfs.c<br>
index a9b53ce81..b02f3b7ce 100644<br>
--- a/tests/amdgpu/amd_fuzzing_sysfs.c<br>
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c<br>
@@ -28,6 +28,8 @@<br>
&nbsp;<br>
&nbsp;#include &quot;igt.h&quot;<br>
&nbsp;#include &quot;igt_sysfs.h&quot;<br>
+#include &lt;amdgpu.h&gt;<br>
+#include &lt;drm/amdgpu_drm.h&gt;<br>
&nbsp;#include &quot;amd_sysfs_spec.h&quot;<br>
&nbsp;<br>
&nbsp;#define AMDGPU_SYSFS_BASE &quot;/sys/class/drm&quot;<br>
@@ -722,11 +724,33 @@ int igt_main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char card_path[MAX_SYSFS_P=
ATH];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct sysfs_file_in=
fo *file;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int card_found =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_handle device =3D NULL;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t major, minor;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gpu_info gpu_info =3D {=
0};<br>
+<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; card_found =3D (find_amdgpu_card(card_path, sizeof(ca=
rd_path)) =3D=3D 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require_f(card_found, &quot;No AMDGPU card found\=
n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require(getuid() =3D=3D 0);&nbsp; /* Need root fo=
r write access */<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Open device to check ASIC family */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D drm_open_driver(DRIVER_AMDGPU);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(amdgpu_device_initialize(fd, &amp;major, &amp;minor,=
 &amp;device) =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_require(amdgpu_query_gpu_info(device, &amp;gpu_info) =3D=3D =
0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Skip test on Polaris (VI) and Vega20 (AI) due to known PPTabl=
e handling issues */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (gpu_info.family_id =3D=3D AMDGPU_FAMILY_VI ||&nbsp;&nbsp; /*=
 Polaris (GFX8) */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_info.family_id =3D=3D AMDGPU_FAMILY_=
AI) {&nbsp;&nbsp; /* Vega20 (GFX9) */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;S=
kipping fuzzing tests on Polaris/Vega20 (family_id=3D%d) - known PPTable ha=
ndling issues\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_info.family_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_de=
initialize(device);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;P=
PTable fuzzing not supported on this ASIC\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (file =3D amdgpu_sysfs=
_files; file-&gt;name !=3D NULL; file++) {<br>
@@ -758,4 +782,11 @@ int igt_main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (device)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_de=
initialize(device);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fd &gt;=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR12MB6855A03C6479F0FD26418997E83D2SJ0PR12MB6855namp_--
