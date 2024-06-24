Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE0CC27C4F
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 01:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C110E149;
	Mon, 24 Jun 2024 01:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eMe1atEX";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B010E149
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 01:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM9/XkRBD3dT6XX9gxLEa4ebpP5ADYY6T3bTDkIkh1zzVMmY0RoBYFMRSwBpFr+7rNioFfJX46OyywTVJx2qIt3Tj3cgRb1ZWrytg+8i0zU8ZTJ7m2qVYq+HYRixQJ//KW3GTKCh6QEbXLSDiBi+DOsvIAArBCaEl0eEPIk4VxWJXpGA68HDxEq/qh8GUmnF0t+z8eE2sxpiae9uJWtb+OnDfkJ3fPELJasY6Z1gkrdkLYvfeaSicHErS7qzEJRui4A210vdauHREO0BCqOtT6+xOlHiM5BqONypHpDi+okc064JoNdVmOXwJmxO0jksG9sL1kgxPz+bsHJrPtPL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WB8MfjcIelbsM9+X43w11CM+J1kmWiSgVxOCpTOL/Q=;
 b=OPrJsGgarVoD+4h5Lui2B4iKxFs3gnwINxRRIIzIebBDiXa/yIoK6cOXE5GVVsNp2zLr1LxYHuvELI0w6S6BSb2bnQSt9sFiF0C/BT6fCkyW5jCarGrHKzMVkBmKVeWXjDCeXvCLlmMfBYtL7ZbA8iM2DtK1e612KQ1xRRuzYPrlFd0JtNE/EYWktiw+Xt9JpvOUx3mXkBwb5vketIsvNonDnPpMd9eZLHInvSO5MOVOP0mfSonE+RJm3z04fab1JE9e4+nISZ6PCac9V7elK7Qh1ofyPafXETPhEU/H0ALNWEzFqd9Tg+uMo91GHTMFFdJQ4vwyUbS0OPCR2QpteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WB8MfjcIelbsM9+X43w11CM+J1kmWiSgVxOCpTOL/Q=;
 b=eMe1atEXCX+iNEf4XH50avu18TKXoRmAEKu8hOdwKo+84VN8IkvKQG1Ve1bXkWTgdnfU7KVhfPg9I36VKIMhMfSWR83/viC8uxZgJPWwAS6Mi+3UWVc6N9+eb76NCTTZ35L/OiP1wQ01tiTfxcx3oxYT6zKIG569oSOn5I/mzkY=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Mon, 24 Jun
 2024 01:57:20 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 01:57:20 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 1/2] lib/amdgpu: allow usage convenient chip info
Thread-Topic: [PATCH 1/2] lib/amdgpu: allow usage convenient chip info
Thread-Index: AQHaxPbZV8xOrfCcpk2guC3bFkkDsLHWKbbg
Date: Mon, 24 Jun 2024 01:57:20 +0000
Message-ID: <DM4PR12MB515299FEDC61BD5F0480439CE3D42@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240622225216.108985-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240622225216.108985-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c0badfde-3bcc-491b-941d-ab9337567593;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-24T01:57:08Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY8PR12MB8299:EE_
x-ms-office365-filtering-correlation-id: 3eba069b-212b-485d-7ba1-08dc93f0fb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?rcNWckja5moppseA2g7NUP9UQ4XJQIdkqfYh6yttdrY9+rDRmJEyYG4KjY58?=
 =?us-ascii?Q?AIvyJrOayzL7JCOvZ3xs5B5K3To6MLUOGVW+8vuaxqAsUs6U+AJOliZSuYEE?=
 =?us-ascii?Q?Psxe2n89wha0B+7iQZTjuDaVyPHPFgTTw7EWdProqlQcrY+1KoeQK0ScJ9ox?=
 =?us-ascii?Q?yLzuF4b6mNTqri1+HStsGMsyBJ/qHv2a+9wcEErVzg7EDaoIvbtyGkFpvb7S?=
 =?us-ascii?Q?fanKyvzwfmCFDHuCr321KilWBwm4qaoHRmShnWF+34Yp/JF+BEqxUQO9Anow?=
 =?us-ascii?Q?JyqIRLSzLx9UaciUs/tMv0iS3nACA9Med2MhE1aI7kk9PMXhyeqW9PzvmMZO?=
 =?us-ascii?Q?FmA1J+9EaEvRg+REf2NanszLOgQWnHVh2sek+0YT4YDrz1FTgrQzGIkdogHe?=
 =?us-ascii?Q?AAY5HaN2KS1HspontgGNEIWcfb++9Yb+aTQ6utGJ7LgxKbzPZHDZXjJ5U4lQ?=
 =?us-ascii?Q?BhnWrNmfoh53pJ18dPlPp1sQ9oK+I7SELd5wlhCOw25CxBMLB3zA02YZcNHJ?=
 =?us-ascii?Q?7aJRnW0wkehGSFGcXfAqj98tdjDcaeLtw2DUJbgR6uNni1icaqGuJwsFBPN/?=
 =?us-ascii?Q?f2zTOlkqnh8UxMDDMAHm9+L3KWox7+QB4/r499UXXvro+fvCM8fK8yD+7ENj?=
 =?us-ascii?Q?3aIF/Qi+LBlKV9jINQb1TINX1wIhU91rfh7vu4EBlU1ThxauzNWiFLb91vet?=
 =?us-ascii?Q?vNiYpi4bgsNczjySQZ09kQa32idf4CHvcQOrB95rM8h7gUEPkyhmiO8JNFWw?=
 =?us-ascii?Q?+uDG0DyjQW05vEsMU6tliKfcCHy25Z3nV8Q2rsaDP5gV0AWIZvZl3T0Hb9dz?=
 =?us-ascii?Q?VPaxeHZ5BhGo2cphGM9Z8xEKj+6fJ0cNXyCmSI7Co/p6ySvhT0y5FKTYWzW+?=
 =?us-ascii?Q?gTl+3zpWMgpbVf43j6jRXYVTODLJC/svz8i5a/rWCfWkYyrSsATfWglygvP7?=
 =?us-ascii?Q?NSCPBGQybKWVZJ0GPclYuO1F74+r9xCShtG1X1iudcLBKIoyoXPOzW5nyuHe?=
 =?us-ascii?Q?B2FtzNJ7JvQNoBVUqTBs3izh8g89pIPOGcRE87Y+Vx8zXFQntiSZe9eysKA0?=
 =?us-ascii?Q?1U0f79L+JYutTCPEbsCtpRxHAceIH/d7b1JddrvBX457o2BTNH3P0E8dTRdu?=
 =?us-ascii?Q?6pALiLDovSfuycRbqUZ2aZXj3T/L+GgMR6hNdNi4nj7h0DHUyW6O0K6H2eXj?=
 =?us-ascii?Q?23cJB1t2IE8NTS3E+Qstj2NmB4AQu8B7GrarBzODEgXIxE3Dn3ZfDygfj8zR?=
 =?us-ascii?Q?UXcC9Zx+Phg/Q2yWVS8t10cp00KvJUWsVtMiiJAu0eXfV1D/G2oQL+fdfCK6?=
 =?us-ascii?Q?4EtotDGmGgW+zqklJUM3j7/q0JScBU5KSY702ZxF5d/uqPdW34fLgRl2dvCV?=
 =?us-ascii?Q?97QlfZg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OMD4OPXLNuYM9vE6vfdQRKFvHfQ3zMrykLqGlJsf//v1QBzdErtP7Uki/H0L?=
 =?us-ascii?Q?fejCJAtAEqf7tQcbHDkyudmO2a5NTEAMZO/pYvwGtQlxBMrw6YndRsRmz5VQ?=
 =?us-ascii?Q?VR4Qw1ho/DdrC9r+J6aUrpTU3GvGgftRcCJOFTs1/4OmcmY5AHA2FWkZqfZj?=
 =?us-ascii?Q?F6P1rR0UixkaB9xzAulan9p4QIrQjhUHzevUM1SyymzjnR/rk98nQsQCKToT?=
 =?us-ascii?Q?ah7pwQzeQ6RhRJ7reHptwwJz2hfKOHP2CnJyzxxNuLDojpY/lZzcQAA6zQXk?=
 =?us-ascii?Q?COeezAHoOC62THrhagrFusYo0af8bWwiKlT8u+lfhZcidcdBrW6YBpAqVt/m?=
 =?us-ascii?Q?N8BKsSjc+IgjIeo9u4/9UHjA7I07K6OVyIA3P/EOzptQebb8SogUGqbN3wvz?=
 =?us-ascii?Q?W2fpptXCVJr3DA/g5l9IYfuD3S4yZrUs5yBi6Um+KhDM9loiBZtkwF8oQio+?=
 =?us-ascii?Q?obEP3QqTK3uclH3Gw2vbx6EgOJB6xhOT/6ykEC8527wXe0q/Gh5mvOawMf48?=
 =?us-ascii?Q?gMddhm5DKPIY3uxdph6taKNAkVQlMxwBOjvIs86zVjSlh91ALLmzn8lyYnG/?=
 =?us-ascii?Q?fOtfFroX1eW565Sag8hl45MvSuMN5KKlh3adEOXYAzOyW6NPHeMZ3kurFfXB?=
 =?us-ascii?Q?E/a71MNdrLQZbRDqfAjoCGdi/GxuvwjzSM6gS1bJSGI1KBL5eX88XFCpwHRr?=
 =?us-ascii?Q?v/KMO0C+9aqvOhmZx6bBxO/UheFkUX5yqn0uvGgLFJdawPVxq7K4HLUZPqZH?=
 =?us-ascii?Q?M/+CkvtQLirBQGOZhIaLlvoiPEmcLihKmswDDpSI7kg6U9hu1r8YV09GiL4L?=
 =?us-ascii?Q?xgC3a6bckamoZG1mkVfb3XT3YN1nhjHIXlDTnxuZNM0g4/atnWEmOajJdmRi?=
 =?us-ascii?Q?1KHbOOx2Emy2wKrUnI8UI5knlOMWSOWEoio6M3RiJh5AAbRl+i0dv2jP+1G3?=
 =?us-ascii?Q?znu72EURARSvExy06FZKqp6fU1xlSHZnhMKogxRIGDpTSE5BiTsA0IxanHNl?=
 =?us-ascii?Q?yvSSSB9kpJn4JJAxqi5YBvzz9KsjGBbXOyCvhYXHXMbcwQgTd+UcJYL/Ktgz?=
 =?us-ascii?Q?GGAYJcQppPHt0rVxpTIGAtplTIuIFPTE8iFIG0GDtmpZugKhw5KZXc5bDZy9?=
 =?us-ascii?Q?12nHQYu0HBmBVXddNbXpA/S4+D5Q8cxu0zkrNwbnpFS+jimT8mvpMyegQLii?=
 =?us-ascii?Q?FxlTl7Fk9TQiHSL8Vh3D6GzvZa6QIgaNwXdvLE/RYayMk6qiyHyzQWUNNTTZ?=
 =?us-ascii?Q?Dg9Tju9edxACmFev4fkvYnJVeVyJqxMxaQ/k2+uXpmVaCDWuwTdO6Ifylnbi?=
 =?us-ascii?Q?jZRB93JSH+Ui4gx9iBTiyJ0/lONLrJcvgubiensOVMbLCGdFLMlv2V1Wd8n9?=
 =?us-ascii?Q?/oceQO10XKrZvW2tV7PiT4kXWbTb3dzblnrhbEkZO4iJm5ro+10LnqvXI2LV?=
 =?us-ascii?Q?PxQ7pUCdh5powzmDXeY+swGO4BUTY/N3gWtFCAdLi5cEOcUTxPPCUAayGWta?=
 =?us-ascii?Q?G61uocXYA+uBAtiWWga0Ky7Hio4AqQGz6qG1Cf9uK6zaXn3WXmBX9iRNgzkM?=
 =?us-ascii?Q?SqN2c+PLAiA08Q0AgGg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eba069b-212b-485d-7ba1-08dc93f0fb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 01:57:20.2220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QIuaLb5C73IfLGh+dmgORoSewmPyA9XgT4aWLYLbrHtrur2WtIe5EXIDc8Mpet05XMbn2VA+zElmkBG2OyfQQQ==
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
Subject: [PATCH 1/2] lib/amdgpu: allow usage convenient chip info

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Make the struct chip_info accessible for use within the test.
The structure will be accessed through a constant pointer, ensuring that no=
 modifications to its fields are allowed.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 10 ++--------  lib/amdgpu/amd_ip_blocks.h | 1=
0 +++++++++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index =
2ee94105c..19e2838f5 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -16,7 +16,6 @@

 #include <amdgpu_drm.h>
 #include "amdgpu_asic_addr.h"
-#include "amd_family.h"
 #include "amd_gfx_v8_0.h"
 #include "ioctl_wrappers.h"

@@ -412,15 +411,9 @@ struct amdgpu_ip_block_version sdma_v3_x_ip_block =3D =
{
        .funcs =3D &sdma_v3_x_ip_funcs
 };

-struct chip_info {
-       const char *name;
-       enum radeon_family family;
-       enum chip_class chip_class;
-         amdgpu_device_handle dev;
-};
-
 /* we may improve later */
 struct amdgpu_ip_blocks_device amdgpu_ips;
+const struct chip_info  *g_pChip =3D NULL;
 struct chip_info g_chip;

 static int
@@ -617,6 +610,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t min=
or, struct amdgpu_gpu_inf
                {},
        };
        struct chip_info *info =3D &g_chip;
+       g_pChip =3D &g_chip;

        switch (amdinfo->family_id) {
        case AMDGPU_FAMILY_SI:
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
97a9ad489..d4364d604 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -8,6 +8,7 @@
 #define AMD_IP_BLOCKS_H

 #include "amd_registers.h"
+#include "amd_family.h"

 #define MAX_CARDS_SUPPORTED 4

@@ -110,8 +111,15 @@ struct amdgpu_ip_blocks_device {
        int                     num_ip_blocks;
 };

-extern  struct amdgpu_ip_blocks_device amdgpu_ips;
+struct chip_info {
+       const char *name;
+       enum radeon_family family;
+       enum chip_class chip_class;
+       amdgpu_device_handle dev;
+};

+extern  struct amdgpu_ip_blocks_device amdgpu_ips; extern const struct
+chip_info  *g_pChip;
 int
 setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_i=
nfo *amdinfo,
                       amdgpu_device_handle device);
--
2.25.1

