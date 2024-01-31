Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA572C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 19:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE4810E459;
	Wed, 31 Jan 2024 19:53:15 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1BF10E459
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 19:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGrzfDj6HNrDvgsVbb//p61m2dJTULDnTpbhplu3QN0/48Sf/vXRkyJoOAAxXluU9W9R18rRFbamfsNL2bHyK/wTKUsirNp8sWxY56dmx0O4ED8QezYaUg8N7mt9hIAQ2WwPR940Cb85lEMr9Nd35s0NUfQCzqs8nqDMeXdAZbWDNo09fqrp98iq9UZAftPsMbH/xrf4VK95A5VHQUMPc0RUR+m3jIJe/bW2rl1/286xb3DJiKCYvICBpfi2ssNhY92b2tg8nyJB0MHKdGC8gIaJTZJBIWluajYCA1Up1B5nNsr0w09xIDMJxSMM7v+51UhTG4weURQ3xSRkPV4ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziJmRinM7BQ11yIH8GW7dw9Y1sxC6CuCItMdims1wDg=;
 b=IOj2s4dMI4Vgy0G1GA0q+IOaPOV8oQxPQF79za+xsXMn3plduDGGHwHxZyH8nS1cAXzyvDPwiGZpDlBhhxzvn9d9UJH5P982q8A9uWPBiFKwMUcu3Apyd4LCbTgWK51+K2L/mMXgQ5NVW5lMDtRjrJG/9/LcsKZaZ9D4VOmXyQoZDK27HQXxJLbej/9o+3m43e+I+ckQwRc5t+oYFQTCn7Aintb/i3TiXJRK3bMRhyzPaJyNQAfwoKNLfy6EnJDL84UtUri9TKPna+7lmjqTjG/bfSO16u8ehnQFl9ds9grqnM28UXtHZCCtVAjmjc4TeXQEKVTeViVmbPT9Bn4Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziJmRinM7BQ11yIH8GW7dw9Y1sxC6CuCItMdims1wDg=;
 b=ciRxIWwYOb9u9soBLWIsnlOSAa40vRzhk99Pe01eQMmBnqFylcoAzV0y+Y8nVuWAaYDAE8cM7RQhfE1G6wy+pRsi/VwQxS5MfxB12zql2bzPiRzJ/QSUGe3/VkFbhZh4OXU9mY3vBJ+VdDsKZ6pLJkPKJ9sTqvixPlYpJAkKczs=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8; Wed, 31 Jan
 2024 19:53:10 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::dd5e:e866:b2c4:2c05]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::dd5e:e866:b2c4:2c05%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 19:53:10 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout
Thread-Topic: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix psr eDP crc read
 timeout
Thread-Index: AQHaVH3PwBOVwAqepUGWzGGJru6C+bD0VSG0
Date: Wed, 31 Jan 2024 19:53:10 +0000
Message-ID: <CH0PR12MB52849E27F82BB1C1C6011F338B7C2@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20240131194342.182455-1-hersenxs.wu@amd.com>
In-Reply-To: <20240131194342.182455-1-hersenxs.wu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-01-31T19:53:09.718Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|CH3PR12MB7668:EE_
x-ms-office365-filtering-correlation-id: 4ade3863-4001-482d-9d4b-08dc22964075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c2VYauN+4jGXGBgCj0Xz+HspQ2h/oQCge7uH3pgaq8PqBsGvKwaU2lPvPp2mRGGuqMZQYLMbfrP+3/SnmJIPDiuMv5l5pt2P/GbJvqLbW6B1hoxqzJiAnFNW2esAX1TFJKtDTxOS6jnTQrZHlxvs79RT2fxnaAc9HUIW0u2+jC1QVx9pSCR1KtyBf1gw+j72bCgs4EDffdoJeFu7mr1a5qS8enCrQoXG1mju1AbbRfoRVh1VO/4nUZqP2JCTGNXBbWnUjJceMVz6e3YxlAd1Y7Wk53sW2KUEMcvGG1Bf8KnMnJ2CT6rMavYOoLH2q4UVWhWkEZXPib+PvFem3ERqPuMJf8hBv7r3x8EG6NH51uYE9wXdpL8RIRYOi9firT38a5jiryxR617VQhUaXtLTgYhXqcksGIo+R14qw7Uwu8WHH7frFoF2AnFd1TNTMiLDMxEFDIZWMBvwmr2ri13YvioFrj60+j3/wKhgviv+2Esq5MJm37SX3mB4t/mkhNeTE/WZVEhkRFVnXVfH6lrJeHUukmHwno4ESdpeh/jndRtkcpUhQc5VfhGk5Rv4WvGrcNxhrdiRwyf3RGwbg2KnEvMr3PtAl91IcHLnr00YdRcPEwRi4XM9jsGL4H8LEcY7JgoylPCKHqWISIS3hVmoHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(921011)(26005)(55016003)(19627405001)(41300700001)(66556008)(38070700009)(316002)(66446008)(6636002)(66476007)(478600001)(71200400001)(83380400001)(6506007)(9686003)(7696005)(53546011)(38100700002)(64756008)(122000001)(66946007)(5660300002)(110136005)(8676002)(33656002)(86362001)(2906002)(91956017)(76116006)(4326008)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cAVyFPhVh1gKfDGBavKM9DNqgVS6EW0NWTSaBrv+dnp47BJ4SyEtmG1ylDin?=
 =?us-ascii?Q?FQztK/plZz2A9dOk8qSPyvwgMujP7PG3K2GwX/bUtuFXb9BBZzm+Rz5HrRnf?=
 =?us-ascii?Q?DSgwhujMPaNqCGvAzbG+8EVH75otYtFu7an8YjspbtUhaB94SJe2FWUfC63P?=
 =?us-ascii?Q?n4oAqNVD43+RY5dhsneqw//MdCPaNnnOZsMIgyfF2c/ef1s0cdK19xZkZh+H?=
 =?us-ascii?Q?eRZ4wGoYnMXPeMxfOtpxf0ET8rmGIekuUtOfTbGd87Lx+Ti9tEWYCTFx64LX?=
 =?us-ascii?Q?c0e1Zl2/4t1iWFBIebQZrRd3ODiJsdaSueHwunarOw8MeiT8Gkha8fVPLIVw?=
 =?us-ascii?Q?OumxlD1nFkS7Aj7B+U1ezYYbKL0btLFUdeveWasc1ScdKcTVtExd1/sPZlzb?=
 =?us-ascii?Q?ufeTizFNAYu+yHmOlXlLDT4GpyYsgOhGy3TQUSXk1kTypsNYvUl/kWHc7RbM?=
 =?us-ascii?Q?SpAzwRZkIBUFsESRsQyjA+GuFxOOHZeq2eCBxMxSbrDMHO7ullam6KiMWZWE?=
 =?us-ascii?Q?xKEqzAT46s+TUa/UZeSPHM14oq8yILXJwbeburqMEiPfIor3uen+w2UG7SVn?=
 =?us-ascii?Q?VuqKF8LxTzV+IEpcXlcQJdZhUDUD3SJwE/BbzXuL9BGREKsnMFuUZkszttn0?=
 =?us-ascii?Q?vFbo+qMsqkES06lDdO18HLKwhiErSXBKLpmUQxwFwEKKn4HxR0ULQ/qigFiP?=
 =?us-ascii?Q?b1XHxdB2+F8xcGFnfMqeYiHxd71Dki5q0zTphWyrLOywZ30Vk13n4cRxwSEB?=
 =?us-ascii?Q?8lE1gr5aM10dJGTQgNGjNM5PIjhDYxLRrTYkm6J9uTaX4sL8AMWLiAp3gbNf?=
 =?us-ascii?Q?BZiRKpzslQPVQi+7/QThkJFpF7ykMYTwZmmN2G0Acir79Zed1VdNPDcpeofF?=
 =?us-ascii?Q?rtyBwrhBThmUI+JSxbJTERvnl0tJAqX+ySCJXAnWHcQYSnOL1hVGOz+B3xLR?=
 =?us-ascii?Q?6O2EWd2YpuQhtaX5WIj6Q94Mp3310VMvzYwo16JDZMRVtqEkgpTt1Ad3XAdK?=
 =?us-ascii?Q?IdSwqPdvpLq7kAaqeoeWJ9efrGcJO3ZdGoWzU1LRS4sOnZj8m6cROPxWgY1d?=
 =?us-ascii?Q?0wCPAbZ+EFyZuLv017/GN7/DRlAj79k1r4aVNJMxcFGWYdWZ9oU8D6tkjO+j?=
 =?us-ascii?Q?d5RzyTtb/Ge6E5EUVW9LGDqJl30Jb08EQ9ZwYZNWBJ9I57DMdEHTkWH/ikK2?=
 =?us-ascii?Q?4A1iKp1/PBDPkJMuOCwxZkpbbhNEx7BIu5C45p+Tdoi7UbMlqYQA+sSvvsqE?=
 =?us-ascii?Q?Pe4IPz2KoGVlfYXDVIHpIkrdI8pnG7j77SEdZyho6rkdDKtZSnon6Kob/MxR?=
 =?us-ascii?Q?jeO/YJyEh1/ytE9lAcNbT+2PIyd41tWcobbp7zOLNf/5C9A3Rb+d/4f0OEE4?=
 =?us-ascii?Q?5e9YP0maAiz2nV1hjwX5UDVCXRqomgrmCXY3TuthTZRjuNyHVT0SdnNtobQu?=
 =?us-ascii?Q?gBPwFbX/xqEM47HX6qB1kwyLM3op55aur3n8jzQyZLEl1UlwiLXIeAVqCsWL?=
 =?us-ascii?Q?8+o0Lv0fl3vWddtnzo5BQmiRCWgjFNmQOFkI9QGeFj5g4KdVAcX70lpnPauM?=
 =?us-ascii?Q?6I73bNFH4g90rVJtl7c=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52849E27F82BB1C1C6011F338B7C2CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade3863-4001-482d-9d4b-08dc22964075
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 19:53:10.1114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfrJRitDFbGChyis3KiYN7FRRHt1GxP3hTdRSuu7/8+KG9PGDUar1SoFT6qLqVepLvkxaGo/+TTSuNo6nVjvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668
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
Cc: "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--_000_CH0PR12MB52849E27F82BB1C1C6011F338B7C2CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Hersen Wu <hersenxs.wu@amd.com>
Sent: Wednesday, January 31, 2024 2:43 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Siqueira=
, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@a=
md.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz, Hamza <Hamza.Mahfooz@amd.=
com>; Lin, Wayne <Wayne.Lin@amd.com>
Cc: markyacoub@google.com <markyacoub@google.com>; Wu, Hersen <hersenxs.wu@=
amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout

Disable eDP psr via debugfs disallow_edp_enter_psr
before IGT reads crc.

With set_all_output_pipe_to_none within test_init,
Tx writes dpcd 0x600=3D2. eDP rx is power down.
Rx dpcd 0x170 is reset to 0 by Rx. eDP psr and crc
check for rx internal logic are disabled. With
disallow_edP_enter_psr =3D true, IGT sets test patterns,
then igt_display_commit_atomic, kernel driver will
turn on edp. Rx FW set dpcd 0x170 =3D 0 (default value).
Therefore, IGT could read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_ilr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index b2c0f294d..46ad6f60a 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -205,11 +205,22 @@ static void test_flow(data_t *data, enum sub_test opt=
ion)
                         continue;
                 }

+               /* igt_amd_output_has_ilr_setting only checks if debugfs
+                * exist. ilr settings could be all 0s -- not supported.
+                * IGT needs to check if ilr settings values are supported.
+                */
+               igt_amd_read_ilr_setting(data->drm_fd, output->name, data->=
supported_ilr);
+               if (data->supported_ilr[0] =3D=3D 0)
+                       continue;
+
                 igt_info("Testing on output: %s\n", output->name);

                 /* Init only if display supports ilr link settings */
                 test_init(data, output);

+               /* Disable eDP PSR to avoid timeout when reading CRC */
+               igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, =
true);
+
                 mode =3D igt_output_get_mode(output);
                 igt_assert(mode);

@@ -243,6 +254,9 @@ static void test_flow(data_t *data, enum sub_test optio=
n)
                 igt_remove_fb(data->drm_fd, &data->fb);

                 test_fini(data);
+
+               /* Enable eDP PSR */
+               igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, =
false);
         }

 }
--
2.25.1


--_000_CH0PR12MB52849E27F82BB1C1C6011F338B7C2CH0PR12MB5284namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hersen Wu &lt;hersenx=
s.wu@amd.com&gt;<br>
<b>Sent:</b> Wednesday, January 31, 2024 2:43 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai, Aurabindo =
&lt;Aurabindo.Pillai@amd.com&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt;; Mah=
fooz, Hamza &lt;Hamza.Mahfooz@amd.com&gt;; Lin, Wayne &lt;Wayne.Lin@amd.com=
&gt;<br>
<b>Cc:</b> markyacoub@google.com &lt;markyacoub@google.com&gt;; Wu, Hersen =
&lt;hersenxs.wu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix psr eDP crc read =
timeout</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Disable eDP psr via debugfs disallow_edp_enter_psr=
<br>
before IGT reads crc.<br>
<br>
With set_all_output_pipe_to_none within test_init,<br>
Tx writes dpcd 0x600=3D2. eDP rx is power down.<br>
Rx dpcd 0x170 is reset to 0 by Rx. eDP psr and crc<br>
check for rx internal logic are disabled. With<br>
disallow_edP_enter_psr =3D true, IGT sets test patterns,<br>
then igt_display_commit_atomic, kernel driver will<br>
turn on edp. Rx FW set dpcd 0x170 =3D 0 (default value).<br>
Therefore, IGT could read rx crc successfully.<br>
<br>
Signed-off-by: Hersen Wu &lt;hersenxs.wu@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_ilr.c | 14 ++++++++++++++<br>
&nbsp;1 file changed, 14 insertions(+)<br>
<br>
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c<br>
index b2c0f294d..46ad6f60a 100644<br>
--- a/tests/amdgpu/amd_ilr.c<br>
+++ b/tests/amdgpu/amd_ilr.c<br>
@@ -205,11 +205,22 @@ static void test_flow(data_t *data, enum sub_test opt=
ion)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* igt_amd_output_has_ilr_setting only checks if debugfs<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * exist. ilr settings could be all 0s -- not supported.<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * IGT needs to check if ilr settings values are supported.=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_amd_read_ilr_setting(data-&gt;drm_fd, output-&gt;name, data-=
&gt;supported_ilr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (data-&gt;supported_ilr[0] =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Testing on output: %s\n&quot;, output-=
&gt;name);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Init only if display supports ilr link settings */=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_init(data, output);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Disable eDP PSR to avoid timeout when reading CRC */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_amd_disallow_edp_enter_psr(data-&gt;drm_fd, output-&gt;name,=
 true);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_mode(output);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(mode);<br>
&nbsp;<br>
@@ -243,6 +254,9 @@ static void test_flow(data_t *data, enum sub_test optio=
n)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_fini(data);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Enable eDP PSR */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_amd_disallow_edp_enter_psr(data-&gt;drm_fd, output-&gt;name,=
 false);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;}<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52849E27F82BB1C1C6011F338B7C2CH0PR12MB5284namp_--
