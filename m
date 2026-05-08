Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977AECD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 20:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2575210F5D8;
	Fri,  8 May 2026 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t1Iiot0p";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012061.outbound.protection.outlook.com
 [40.107.200.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E485610E33C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 20:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwZCmsW/fT2wIe9SBzi2i0Jh3vapZIh0g8Ky1rAgwpYvF1uFVOIku1Lx942g7/pJ3LKChMW7xJqMRdWSBnCpkv8Of2M+IqSgpI/N5bDh1bfLPH/8e7ySYKhP0CaS8CvJmsGISmBKeUTuPjJ5NFk0KdI4afsHd6ufNKv6Qo5O4z5JNE3HDvO88cJsyKSB8x6y8Ea4K8pr6/STwvP5kCRV+QSIxNpLnWcn/tHbw4STgoWwtLybst8OxxFMQgBVYpqNyiw6SE2OTZVP/iQwp+kT3KKm9T/PbRU0g2mdAfaBBSUJs02jzfVK7vnJjOEkaTfD7Myn2349S8biuhNDBeGp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYOyFYlSGhyTvRhBVFnXlvFsCBm8kDr62N2nLiQkWpE=;
 b=aeDPZNZ9/4Q5YKZ4K4AgYUpJJqKBzSe/mA+1icFskTzBP0Yo6UmbEk8CFy2nZqahQ9UshmQCh5NIrwTlTe7Sle6xRlz8ejJoVpGYA/1v6ACoPlEgJPTwzp9FRDGplMqp7YDWE/IkuXEaWEAXWqDCoRAGSzt31kHolUWw4Wi0RfmOIxR+4pHRt3i9Ii5JJZ/DxqNNhmwU2raW5GUB4cxc2dM6S4Vay9qqPTiFMGckTcjG3C9I63hkBunNx4it1LQ57Jpo2Yg/ZlQ1BU0JciMtdtkZerJYF/rs0ReoS29LO2YlF7WHV44kGjFwZB9tjbd8Voawocy5ptGvbU7zG77pMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYOyFYlSGhyTvRhBVFnXlvFsCBm8kDr62N2nLiQkWpE=;
 b=t1Iiot0p6uOFBDjmXBzUisfNXFFNA9g1TvG1CZUsTSSSrQrIVwSjXNFDml40PEydnkYFIsbypqJE03ZvNLTWt4NsYkggzNY3tuetsNE6FVHf7dqW9GGtiIhnbQm0YPPNkr0NeRyANmoRBLLU3GT0wAeYbLcUrmMJd2MaUYCTvdU=
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 20:23:59 +0000
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675]) by SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675%6]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 20:23:59 +0000
From: "Strawbridge, Michael" <Michael.Strawbridge@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/amdgpu/amd_fuzzing_sysfs: use local include for
 amdgpu_drm.h
Thread-Topic: [PATCH] tests/amdgpu/amd_fuzzing_sysfs: use local include for
 amdgpu_drm.h
Thread-Index: AQHc3yd4N1jR4NqYZ0ynswCdSmnwY7YEkrVz
Date: Fri, 8 May 2026 20:23:59 +0000
Message-ID: <SJ0PR12MB6855F905CD89BC275D662A1FE83D2@SJ0PR12MB6855.namprd12.prod.outlook.com>
References: <20260508201540.54172-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260508201540.54172-1-vitaly.prosyak@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-08T20:23:58.729Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6855:EE_|MN2PR12MB4158:EE_
x-ms-office365-filtering-correlation-id: 15fb6b54-f013-45a8-bcce-08dead3fbcab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|38070700021|18002099003|8096899003;
x-microsoft-antispam-message-info: 8VmDdrogCtSzkg87QsO0UkOPGn3neXpiszdh3iaDgAvxmDaUWVCOsd5CEbdd0Q6IpPDnOPCU53DxwS4geWTFStnDUGNp/uwFWa8ANIj7bKfnHm4NEmm6P/R8EQ0yPXKexrhIxd876bhHGyLsFJqraUN88iEevJsuK7hYvbIExd2YM5twCCpF9TtC7hmKplfz5sixXyLLW9EqAaq3feTT9xVozXM2wxtRsCNNpI522OgmaWkJTOr2+peyFFtrMdeQzK7GIgnTdrx3oC42FqOmKSDfrTa5E03qlX7JbkfpvxXoU5o68ZmcIocyNKdMPAU3oAO+wEyKjbutrzVLxYJAOWA2on9dhlth/mD4ANRw+jPFN8httjfNqHL2D4WuWaBLrmETZ7dz03JU5qGDYAA2YbOpxLmvfJvmcwUNVD6OWjx9kbEAxljuNqD1Bh9gJqOsUgyGxntyDEA+9UIlUdKkkyx/0V7fbGUSN2Wp6wgZoKqprDy9weLgNm538kuLhusdxTu1p7uzyikd2yVw6aIeBR2t4g6Nzr+NK4Hv43BjLwzJrgjyyT8N3AtV/mSSzkbPVNew0hGUwqekJLaYgHKVkstX+XEvqmSg/CSWVt08hHRDyGedKEcizA61UfNfT/zUABJNkOlFlW4OPtfCO4NFYOJpy5KhXzZ6r8ukOusNKz1T1WC8EcAdWJmIyElUJw9Z6EVL87aYvpuB+9te9CeEmI9B80g77TLyFbN/IFowoXvB63xBxJQlANqtnqt8fX2M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(38070700021)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tjNbr8k0dPu51z38t3hWt5R5CdhxxuSddC89ES1eVlNHtrV9MNW+ERhLWu6k?=
 =?us-ascii?Q?vME8KACkx+/jvTjQ9UIEyDE/MTYSJoZFWhzZhyBJDpXriN4cd4m+m1NXwd6J?=
 =?us-ascii?Q?MaCmW5XCTOJZb1fynO9g9cwNlEN0GFOs4a4EYPrK7MCiOnd1BF9K4o2FLW17?=
 =?us-ascii?Q?jo2jEP6GfHLWadMNl4oNuQd9G1lR9yLoD1jJjAOsEWoYGcHPiACe0tZgiI5R?=
 =?us-ascii?Q?hRiMSdNL77/luJrePn1+lgOE3tYDQjvmc/lGUPW2dqxArFHrYM0d9NWHUbE8?=
 =?us-ascii?Q?J1kaRxw/5vPu9c9rRKMEBOGNymjRCzDd3UXzzlGz/vhZtwhnGqdDmC5dQzCQ?=
 =?us-ascii?Q?huvez5OKjG3Z2NCfFgmHFXs0UCgTBfO7bGprf0gW5RqheGYhGFf5veA5pHmE?=
 =?us-ascii?Q?qrrdPemnl3NXgDeifYbX72TNKXNRfe7VSrVeC2VgcYHwjC2oFseCX9MlrqRE?=
 =?us-ascii?Q?bqJ6bEW+ikfdB4MTTZ4t7yZskwVIHZjqApCLxEKpIw319zdsiTIwLjVoJ/Q9?=
 =?us-ascii?Q?4ldx1q3YRydDXTd5mpHTNUtA8rCLQ34S5orizYM9HM6KZilbn0EcZWQw101U?=
 =?us-ascii?Q?6z8KP0ChpDRSZ1R+gScsPiB+TWH/c+EwxdSF42DAQ1+MYJPRVkxtuYbKKu4c?=
 =?us-ascii?Q?AEOCVjeZ/9G9HwsRcZuHuU1ari3+UJLWcl5sE+zdqZwu19fTVp8Qx+5OFBga?=
 =?us-ascii?Q?wmgg95eHO8SqElDAJnvndOmPV0s3j2SBMHCtDwDernYsF79IFV/w8WS3LyzT?=
 =?us-ascii?Q?Y+SKIE06zYP7BL3bFMIWf4AeUIFr+mdYdpnNSVmXAn49iO7IjdzkMdbf8yaG?=
 =?us-ascii?Q?UAW3XLGfwYYrMuZYO7LlpFUyRfiooY99w2c7E+syVK+usS184IXjp9ZoACL4?=
 =?us-ascii?Q?LG3F4/WTunZY9j2W/n6zsprmsI/9sRZVbwoe7cXXxCj06x/GiKiYWvn7gxBI?=
 =?us-ascii?Q?17F2XK+0J+kRPlsHJht8bW7PhqhlH534xgWNfz9z9cq/1TvlsBJU4ETK61/l?=
 =?us-ascii?Q?o+LKECW20gw5N5BrqEE/49OKTST3mbBJx9d36f9Sd4eB3O5Hp1/8mgwND9+N?=
 =?us-ascii?Q?kkqI9tG5yK6YVZ4BJKcGLLYyfw23hldWqpT48wIzhLUrL0Vn+vyUIN9oEgoP?=
 =?us-ascii?Q?w8GDMmkJBc3l0RV/axju947OvrV6FjQ+6wX5Lf2T5GvrfCk+2SwE9Mhw/+fv?=
 =?us-ascii?Q?pIpiHHWwbqGf9iF9lwKCNcrafT3HYU7VIslW+wH8uHNW7/qLm8OxfsYR6ycc?=
 =?us-ascii?Q?E6SVEIa7CwGG1LeICC12lQ9PUQ+XxiogR4NoQ8InVFkAXD4ZL1tbgcfnVl49?=
 =?us-ascii?Q?Dctou2f9HMFyFBc7KIivdm6InYWI6YJflWZwT/2Y9cA1+BkgQbVbLf9I4jjB?=
 =?us-ascii?Q?9odnVywo2xYNR9BQskAJihkbQpWUBJ3pUXVjmFE/HeY0eL4aA/YeZLFPk81p?=
 =?us-ascii?Q?E/DBL97SH8TcUXEqQIfwzWU8eJSasd2uArea7Hulxk96appMEMOKxVVkC7ri?=
 =?us-ascii?Q?0YxQrzAWdTPwaYP3IIWQkW8XOoNjQ8lAbQDJWN/8cNzkMus8Y+TSVZoW1ZwE?=
 =?us-ascii?Q?bf/odpd1zEA/+zbYDnfrQS42+p2oO9NkVCdP90p6mFSG0Y5S1My2/1HPiOK8?=
 =?us-ascii?Q?xpRfYilP+ipgLarfDO739sXzM6nlhlLadJmq4wz629MAwGissQsLECq7GN9O?=
 =?us-ascii?Q?d7YbAMshajkr4Eg+M7yNvxax59NqjrzA/+ulDbCdGgDcm+1/?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR12MB6855F905CD89BC275D662A1FE83D2SJ0PR12MB6855namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6855.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fb6b54-f013-45a8-bcce-08dead3fbcab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 20:23:59.2526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BM0Ut0xfvbd5Tjjb6A4+Qd1lV1pVnrorO6G8QOFLHIovBpHNgWFM7NWonNMmZipauoT/vri5c8FfG3xngChq1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
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

--_000_SJ0PR12MB6855F905CD89BC275D662A1FE83D2SJ0PR12MB6855namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

This looks good.
Reviewed-by: Michael Strawbridge <michael.strawbridge@amd.com>

Michael

________________________________
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: 08 May 2026 4:15 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Strawbridge, Michael <Michael=
.Strawbridge@amd.com>
Subject: [PATCH] tests/amdgpu/amd_fuzzing_sysfs: use local include for amdg=
pu_drm.h

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The file amd_fuzzing_sysfs.c uses #include <drm/amdgpu_drm.h> which
requires the system package libdrm-amdgpu-dev to be installed. This
breaks the build on machines (e.g., Intel-only CI) that lack that
package.

All other amdgpu test files already use #include amdgpu_drm.h which
resolves via the project-local include/drm-uapi/ directory that is
already in the build include paths (-I../include/drm-uapi).

Switch to the quoted include to be consistent with the rest of the
amdgpu tests and remove the external dependency.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sy=
sfs.c
index b02f3b7ce..381e5388a 100644
--- a/tests/amdgpu/amd_fuzzing_sysfs.c
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -29,7 +29,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include <amdgpu.h>
-#include <drm/amdgpu_drm.h>
+#include "amdgpu_drm.h"
 #include "amd_sysfs_spec.h"

 #define AMDGPU_SYSFS_BASE "/sys/class/drm"
--
2.54.0


--_000_SJ0PR12MB6855F905CD89BC275D662A1FE83D2SJ0PR12MB6855namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
This looks good.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Reviewed-by: Michael Strawbridge &lt;michael.strawbridge@amd.com&gt;</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Michael</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vitaly.prosyak@amd.co=
m &lt;vitaly.prosyak@amd.com&gt;<br>
<b>Sent:</b> 08 May 2026 4:15 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Strawbridge, Mic=
hael &lt;Michael.Strawbridge@amd.com&gt;<br>
<b>Subject:</b> [PATCH] tests/amdgpu/amd_fuzzing_sysfs: use local include f=
or amdgpu_drm.h</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt=
;<br>
<br>
The file amd_fuzzing_sysfs.c uses #include &lt;drm/amdgpu_drm.h&gt; which<b=
r>
requires the system package libdrm-amdgpu-dev to be installed. This<br>
breaks the build on machines (e.g., Intel-only CI) that lack that<br>
package.<br>
<br>
All other amdgpu test files already use #include amdgpu_drm.h which<br>
resolves via the project-local include/drm-uapi/ directory that is<br>
already in the build include paths (-I../include/drm-uapi).<br>
<br>
Switch to the quoted include to be consistent with the rest of the<br>
amdgpu tests and remove the external dependency.<br>
<br>
Cc: Michael Strawbridge &lt;michael.strawbridge@amd.com&gt;<br>
Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_fuzzing_sysfs.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sy=
sfs.c<br>
index b02f3b7ce..381e5388a 100644<br>
--- a/tests/amdgpu/amd_fuzzing_sysfs.c<br>
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c<br>
@@ -29,7 +29,7 @@<br>
&nbsp;#include &quot;igt.h&quot;<br>
&nbsp;#include &quot;igt_sysfs.h&quot;<br>
&nbsp;#include &lt;amdgpu.h&gt;<br>
-#include &lt;drm/amdgpu_drm.h&gt;<br>
+#include &quot;amdgpu_drm.h&quot;<br>
&nbsp;#include &quot;amd_sysfs_spec.h&quot;<br>
&nbsp;<br>
&nbsp;#define AMDGPU_SYSFS_BASE &quot;/sys/class/drm&quot;<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR12MB6855F905CD89BC275D662A1FE83D2SJ0PR12MB6855namp_--
