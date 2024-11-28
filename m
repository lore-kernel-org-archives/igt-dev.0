Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B7D6D251
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 01:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D604210E311;
	Thu, 28 Nov 2024 01:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ytdtZebB";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADC710E074
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 01:34:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIf+b2EAZ+WpgYCO1iUDabKEE+YEkWKJYnGkn8JZVICueodCfDzo/7BeqJswEinR2AzfWmWEyNj2cBpadJHhoDi9o5yJ2uU7TJM9qxAH15NaNeyNvk6azqXXqH+yoaVhinC8GsN7S1HTXUT/NkSBHIZX0F4OBVXdjbNR89rt7qL4gAXC/pBLqkL2lwKCVZ9L03VZNE16TBX3jmFW5nbnDwkPunJEEHnYA8OREIbKTS3aHV2DGbG60TjbXib/v7f73HB0sBJk+X+SwRibmwaOtdo4qAb/zglJiCtqtexNaOkXTvt5j5vxkQsjLrxt0isAw7lLiNoJZ5Zn4GBOua8Oow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmjPsSljEE8d5hwrPZTR0AP3A7SGtYXco7SLuWGMvx4=;
 b=mKd9P6gVGiYgdL4VFBBLL5Dw9AMtj/5sv+Foe+c0254pM58VSsrjA1Frl6r4RTaTqlAag/nx8l7bql/lOb/TFtZVX8bytnOmNSPhWz6xQge1pOfKd2r4ArfC0MOaUYG1Pm4nlTHW0Jp1etcaIlPRhG4iq7RNrrkyfiz9GrpGvJspjkTgfL6Wt88tqCWUe/fgUogd83epMwTtAvchO5Rn77v3r/kJvbozRu6ckyScNgZ8/OuKEpdQXUxGTPYKaU7acv9FgZcN31Pq2CoHdgpohkkptlTDHBt/kt+K/5ba76gGs3vlsGYmMJ4dqKMUqDKkArvZntYRLgAqHN7VpFEidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmjPsSljEE8d5hwrPZTR0AP3A7SGtYXco7SLuWGMvx4=;
 b=ytdtZebBRgDOr9wIOzXnLZOLIhTS6KriVtwuifZfcx0c7wma64XZkQJcErVcw+PRjs844C8vz/u3GjQ3hG7dyPKmdlSOQ0NXo2OcuVmdoZRLHjeEcTP0eslX+Ih4I4yleum6KBsPttxQjHnMzrLvlIXLKHONsNbUJ6oPpEpCgAs=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SN7PR12MB7024.namprd12.prod.outlook.com (2603:10b6:806:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 01:34:39 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 01:34:38 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Liu, Leo" <Leo.Liu@amd.com>, "Zhang, Boyuan" <Boyuan.Zhang@amd.com>
Subject: RE: [PATCH 3/3] tests/amd_uvd: Introduce additional test instance for
 UVD dec.& enc.
Thread-Topic: [PATCH 3/3] tests/amd_uvd: Introduce additional test instance
 for UVD dec.& enc.
Thread-Index: AQHbQCjJTEU7IskFFEOewm9n2mreS7LL6vxw
Date: Thu, 28 Nov 2024 01:34:38 +0000
Message-ID: <DM4PR12MB51528364E10A77D80B00D1FDE3292@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20241126172923.206952-1-vitaly.prosyak@amd.com>
 <20241126172923.206952-3-vitaly.prosyak@amd.com>
In-Reply-To: <20241126172923.206952-3-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1828b19f-db6b-4d1d-8c65-b1d9502caefa;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-28T01:34:22Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SN7PR12MB7024:EE_
x-ms-office365-filtering-correlation-id: 35202868-bdfe-4163-1f0b-08dd0f4cd2f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1v7SgTfstfIQjbTS0c9NxmOMTLPOGihigo4CRLyFV172uqpNnYgNX0GDUBQ+?=
 =?us-ascii?Q?xFNzRmYamgcIavTD2dfFIaTuoylYmnHPHUsfN05CMToK27mvHa6uKD3xbf9Q?=
 =?us-ascii?Q?dr15iUXM6iW27yOBwLmSCPNILCPaq4Qq4zBVpKzAKr2P5yMfB1TwVf8CK4vC?=
 =?us-ascii?Q?p+WjYjXCLAklx3ERqXZEQfoVtK4iKGjGN8HSwhqgBHcJ3ZmXRTQ0lS5LLxb6?=
 =?us-ascii?Q?cdTEKGUaHljlOHZ99tJiXTIzApn67NVZdOQtfnM6WhIlmmKQutuiTsWTjuBc?=
 =?us-ascii?Q?i/vRdWwoX+YV7JFRsUzYpAvFW3mKnyhbo+tm6z5kygYr0PYhbjj89mMkeH9Q?=
 =?us-ascii?Q?qw52PVWC4vtIq67HzIjcv5Tk6oMRXOeBR+KNnFAgeoXxm6mzw8EEhxxtncHX?=
 =?us-ascii?Q?d9VA7AJNy419aTTLx5blnk08EFRlHOHLzQUHiQRcTrnamIE/omXw+6xtAPRL?=
 =?us-ascii?Q?SQR+NoAqu85rS3Q09nVz5SgXaT+npzgenDnmSfF3aDydorehBFkFbNx9/J+l?=
 =?us-ascii?Q?kg11wcTGeXkUOBn3eyN0w8X9pp6RjhsrumK+eYuuQbR7ZUx6zU6Lnme189MD?=
 =?us-ascii?Q?UElpRuT9GyLVGwrIuoStkWgfTm+6L48NKeLc3jzbbcFSwSflq0t9pYpRc1xI?=
 =?us-ascii?Q?hHj7vwt22P1/64p2xj5qXJZylNv89ciqGmK1k3ehgiQxXvU7AAldQGfEOprB?=
 =?us-ascii?Q?phxqNseEeITntP/fSh+uahQ6YrNCbiI8gtmhhG6AI+xMYfCI2u3NJ652Rxsn?=
 =?us-ascii?Q?N+iabogIUEAu74zk9WFR5w0ds5QHzjaiHwuZlceksr+IZjf7gSHOOh+hPqyl?=
 =?us-ascii?Q?jjj+aGkIlyp8u5mTfwGN+AWXfLzHebUnlBo0cPbphQgwvjL0Th9wtkEB+Hbd?=
 =?us-ascii?Q?S/KGj/C4jme8krptUHl/5FVVaCDoQasjm88YBfp9qfrl1zIn0y9uFmjkLdMj?=
 =?us-ascii?Q?NGbAxrvcdRtgVOsA0TkfVQ4GTZokICT/ezchbVwN3oo+F8JDq6DV1v3Oo2Tw?=
 =?us-ascii?Q?hu1/M2lHwMRGn4+mxWsr+0yDM+wmeK+MFTr+uNcU/tVBMLhnsxHcldNfIsVE?=
 =?us-ascii?Q?7M5qOxMwPjI8vbe4dr/uPV3y7oPtmkWCpjhevtslG1rrECHytsMrfECx7d3/?=
 =?us-ascii?Q?L091B9YqsplLE5bJsOc456Up92ZLZzGmDfQwSe3d83Kvwp+x2GNho6Mf5d2G?=
 =?us-ascii?Q?Mkdsze3Kx563vU4he15GYuAufGCTCtO+Ni7pG0BSyPYV0Kkfg+BJ9jj3ITZk?=
 =?us-ascii?Q?MRkpyVh96zoAyxZhRwLPN4UTe37/qEFYb8ULxbHOdsmRK0NUWZhyUVtnXJKf?=
 =?us-ascii?Q?1DanbJTj5qNoUTOvG9gTzjcFYvOELfZ9UMnDd9UWTah3X1vB7SpAK5+uFX2E?=
 =?us-ascii?Q?n6fCafFFpTCsPc634SfM2rWjdnOw0ZmUm4R7giusl+KGx2Wr4w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Ivv314yc47xsedKjdKuDSivunqek79s0baia1HJ5DsfbhrsvVquBr+pNOZp?=
 =?us-ascii?Q?/wAuW5rlYfXlk6CVrtbIp/l/MZZaWhnwvLgla8id6+bIqb2k2ScCqqsSVK2/?=
 =?us-ascii?Q?bk+4Wa7pM1wWGSU5N4K+hNjctVPh14RfjUrs5lyZSVcU1u5qqyfdzsAAvZsX?=
 =?us-ascii?Q?HD5zP1F+h9+0YtPStPqVk6nhAuVoh5xfWDVy69ZZhXISsnmef17x8JX0trAa?=
 =?us-ascii?Q?mWLQ2VpWHFWg+LBrj8NX7OT5q/5qTl8Jgtu1cbySBW/57G0ocSptmHaqWEby?=
 =?us-ascii?Q?0waCO9slVkDSBHgfgU1ONnws8+JgEsfCR6dQHOYpTmyoCdNiRr7b+zncI4SH?=
 =?us-ascii?Q?Wic9tqHg2/EDyoeDcCrfb4sIJmIROrmBRL96O0gDu4/2lIOejPPElvG79q4D?=
 =?us-ascii?Q?3opqLg9DZcvEUsdAaq/Jd5qHaf9wxfNOsohCDsDHEslpDG4jeypwuV79XYmp?=
 =?us-ascii?Q?qXH/AceNXDfzesI1NbFKAfTzdRsOtpGCjE8AxRN0qTq9yYcwbGVfyMnh9E0R?=
 =?us-ascii?Q?RrPhoSvrc30ZFkS9vsDseS30IHc97iId9kNxo+R/1p5yL7n9v4LA6HAMxd5R?=
 =?us-ascii?Q?UVBvOhOjUfxVt/ctPLXry/wz+VLNl2nV6oFkcfCrVqzMAm1xwU8rtNqcdrhv?=
 =?us-ascii?Q?CmnGBY5ZEIspWAUevabi6sLOSYHSrOwRzp4PzD6j+K68k3+1qZ1y1PNaS7zJ?=
 =?us-ascii?Q?UosJe9Fc5tOKjC32XDPXuzYPWp86Yy0G2n8vkjJ7elimadv9NRrgh8Xd+93K?=
 =?us-ascii?Q?3Mk0TYtbQviwm5v0Moix/gZ3Hzq9A8KXjy/TqhHv/TPoGHouHir48Qe+Vthx?=
 =?us-ascii?Q?PyAfWA5ZqWAD/nsQdpdkYASXkadKsz3Ms73xotnrHeggryfSsa2PhyJgMgCS?=
 =?us-ascii?Q?ST1+DP86HK6qFVFjYM8Yva+uSYblgeGu7tnN4l/mG/0TWeXPclbVFj+Vim4k?=
 =?us-ascii?Q?teHT/zy99JC9ew6p0uCq5WzyqKteYbq/nN82kOzTIdZonZrzKdk5OvSBGqJN?=
 =?us-ascii?Q?adAtONbJwTWwwKp2khojWNzjoRiSRwWzmaweUK+ET12rYtD4EXBhrdetWSdE?=
 =?us-ascii?Q?PHT06ws9m79T8AcuuPJorilxR9ZtCEAxIHJ2d7nouMlcz3C+FlHEglOwyIrL?=
 =?us-ascii?Q?WIPuCeVzfwLlEMs+0xhUqFfN4la6Qi/qEHlZr/280BPvDkIrQdaz6VPDJY0I?=
 =?us-ascii?Q?S6uoK9cQNZ9U9Y2T1Dg/CKUuQCzuLRa5Mcqm3mgIi/vCLjgXrkmtP0iI2Q04?=
 =?us-ascii?Q?3hD5gEx/XmQ8/F6oEjtEiRElwIG+SXcKtwBvC66e0WDm0vZWgV1zKjaEETrq?=
 =?us-ascii?Q?r01vfA5IvX+yI8MJaxnstjUxdM/4errnatRUXLTWLJmSQKR6vvkflFWV/b8M?=
 =?us-ascii?Q?HdVEChzfQpPRn8rJVE3goQReoCBJfCh6CB7HsLeH+9nJBVYWbPuYg4kVyyaW?=
 =?us-ascii?Q?YEQUTquH30/IZUHFyIMdoqRkrCAhcFTt+GfiX3xKpRYr/oqXhiJAaMY/MO5V?=
 =?us-ascii?Q?HUU/Ngq5DXeRQ2zn8HAfmhVxOYlJiAd+uclRtV7kx595cXBh/zNZ3rSuhWd1?=
 =?us-ascii?Q?r0ZHBvUDLv/hwc2fTzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35202868-bdfe-4163-1f0b-08dd0f4cd2f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 01:34:38.7098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vMPtHl8j/x6aG9JCwPMktE1IeUdY1ObH8gg55uHoaagiok+8bW4Fc/lswQ+d7kAXbuNM33eRPbGafL0M3iU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024
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

This series is good for me and is
Reviewed-by: "Jesse.zhang@amd.com"

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Wednesday, November 27, 2024 1:29 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexande=
r <Alexander.Deucher@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Zhang, Boyuan <B=
oyuan.Zhang@amd.com>
Subject: [PATCH 3/3] tests/amd_uvd: Introduce additional test instance for =
UVD dec.& enc.

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Added another process instance to simulate stressful conditions for UVD dec=
oding and encoding tests, increasing test coverage and robustness.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_uvd_dec.c | 82 +++++++++++++++++++++++++++++++++-----
 tests/amdgpu/amd_uvd_enc.c | 60 ++++++++++++++++++++++++----
 2 files changed, 124 insertions(+), 18 deletions(-)

diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c index =
3ec411aac..4b82549cc 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -2,7 +2,11 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 // Copyright 2014 Advanced Micro Devices, Inc.

+#include <spawn.h>
+#include <sys/wait.h>
+
 #include "lib/amdgpu/amd_mmd_shared.h"
+#include "lib/amdgpu/amd_shared_process.h"

 static void
 uvd_cmd(uint32_t family_id, uint64_t addr, uint32_t cmd, uint32_t *idx, @@=
 -21,6 +25,7 @@ uvd_cmd(uint32_t family_id, uint64_t addr, uint32_t cmd, ui=
nt32_t *idx,

 static void
 amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
+               struct shmbuf *sh_mem,
                struct mmd_shared_context *shared_context,
                struct mmd_context *context)
 {
@@ -35,6 +40,8 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
        req.alloc_size =3D 4*1024;
        req.preferred_heap =3D AMDGPU_GEM_DOMAIN_GTT;

+       sync_point_enter(sh_mem);
+
        r =3D amdgpu_bo_alloc(device_handle, &req, &buf_handle);
        igt_assert_eq(r, 0);

@@ -88,11 +95,16 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handl=
e,

        r =3D amdgpu_bo_free(buf_handle);
        igt_assert_eq(r, 0);
+
+       sync_point_exit(sh_mem);
+
 }

 static void
 amdgpu_uvd_decode(amdgpu_device_handle device_handle,
-               struct mmd_context *context, struct mmd_shared_context *sha=
red_context)
+               struct shmbuf *sh_mem,
+               struct mmd_shared_context *shared_context,
+               struct mmd_context *context)
 {
        const unsigned int dpb_size =3D 15923584, dt_size =3D 737280;
        uint64_t msg_addr, fb_addr, bs_addr, dpb_addr, ctx_addr, dt_addr, i=
t_addr; @@ -115,6 +127,8 @@ amdgpu_uvd_decode(amdgpu_device_handle device_h=
andle,

        req.preferred_heap =3D AMDGPU_GEM_DOMAIN_GTT;

+       sync_point_enter(sh_mem);
+
        r =3D amdgpu_bo_alloc(device_handle, &req, &buf_handle);
        igt_assert_eq(r, 0);

@@ -232,11 +246,15 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,

        r =3D amdgpu_bo_free(buf_handle);
        igt_assert_eq(r, 0);
+
+       sync_point_exit(sh_mem);
 }

 static void
-amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_cont=
ext *context,
-                struct mmd_shared_context *shared_context)
+amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle,
+               struct shmbuf *sh_mem,
+               struct mmd_shared_context *shared_context,
+               struct mmd_context *context)
 {
        struct amdgpu_bo_alloc_request req =3D {0};
        amdgpu_bo_handle buf_handle;
@@ -249,6 +267,8 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_hand=
le, struct mmd_context *c
        req.alloc_size =3D 4 * 1024;
        req.preferred_heap =3D AMDGPU_GEM_DOMAIN_GTT;

+       sync_point_enter(sh_mem);
+
        r =3D amdgpu_bo_alloc(device_handle, &req, &buf_handle);
        igt_assert_eq(r, 0);

@@ -292,6 +312,8 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_hand=
le, struct mmd_context *c

        r =3D amdgpu_bo_free(buf_handle);
        igt_assert_eq(r, 0);
+
+       sync_point_exit(sh_mem);
 }

 igt_main
@@ -301,37 +323,77 @@ igt_main
        struct mmd_shared_context shared_context =3D {};
        int fd =3D -1;

+       int r;
+       char cmdline[2048];
+       char shm_name[256] =3D {};
+       int argc =3D 0;
+       char **argv =3D NULL;
+       char *path =3D NULL;
+       enum  process_type process =3D PROCESS_UNKNOWN;
+       int fd_shm =3D -1;
+       struct shmbuf *sh_mem =3D NULL;
+       posix_spawn_file_actions_t action;
+
+       pid_t pid_brother;
+       uint32_t major, minor;
+       int err;
+
        igt_fixture {
-               uint32_t major, minor;
-               int err;
+
+               posix_spawn_file_actions_init(&action);
+
+               if (get_command_line(cmdline, &argc, &argv, &path) !=3D 0)
+                       igt_fail(IGT_EXIT_FAILURE);
+
+               r =3D is_run_device_parameter_found(argc, argv, ONDEVICE);
+               snprintf(shm_name, sizeof(shm_name), "/uvd_dec_shm_%d", r);

                fd =3D drm_open_driver(DRIVER_AMDGPU);
                err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e);
                igt_require(err =3D=3D 0);
-               igt_info("Initialized amdgpu, driver version %d.%d\n",
-                        major, minor);
                err =3D mmd_shared_context_init(device, &shared_context);
                igt_require(err =3D=3D 0);
                err =3D mmd_context_init(device, &context);
                igt_require(err =3D=3D 0);
                igt_skip_on(!is_uvd_tests_enable(shared_context.family_id, =
shared_context.chip_id,
                                shared_context.chip_rev));
+
+               if (is_brother_parameter_found(argc, argv, BROTHER) =3D=3D =
0) {
+                       add_brother_parameter(&argc, argv, BROTHER);
+                       fd_shm =3D shared_mem_create(&sh_mem, shm_name);
+                       igt_require(fd_shm !=3D -1);
+                       launch_brother_process(argc, argv, path, &pid_broth=
er, fd_shm);
+                       process =3D PROCESS_TEST;
+
+               } else {
+                       process =3D PROCESS_BROTHER;
+                       pid_brother =3D getpid();
+               }
+               if (process =3D=3D PROCESS_BROTHER)
+                       fd_shm =3D shared_mem_open(&sh_mem);
+
        }
        igt_describe("Test whether uvd dec is created");
        igt_subtest("amdgpu_uvd_dec_create")
-       amdgpu_uvd_dec_create(device, &shared_context, &context);
+       amdgpu_uvd_dec_create(device, sh_mem, &shared_context, &context);

        igt_describe("Test whether uvd dec can decode");
        igt_subtest("amdgpu_uvd_decode")
-       amdgpu_uvd_decode(device, &context, &shared_context);
+       amdgpu_uvd_decode(device, sh_mem, &shared_context, &context);

        igt_describe("Test whether uvd dec is destroyed");
        igt_subtest("amdgpu_uvd_dec_destroy")
-       amdgpu_uvd_dec_destroy(device, &context, &shared_context);
+       amdgpu_uvd_dec_destroy(device, sh_mem, &shared_context, &context);

        igt_fixture {
                mmd_context_clean(device, &context);
+               if (process =3D=3D PROCESS_TEST)
+                       waitpid(pid_brother, NULL, 0);
+
                amdgpu_device_deinitialize(device);
                drm_close_driver(fd);
+               shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
+               posix_spawn_file_actions_destroy(&action);
+               free_command_line(argc, argv, path);
        }
 }
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c index =
15fb11fa3..fecda249a 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2023 Advanced Micro Devices, Inc.
 // Copyright 2017 Advanced Micro Devices, Inc.
+#include <spawn.h>
+#include <sys/wait.h>

 #include "lib/amdgpu/amd_mmd_shared.h"
+#include "lib/amdgpu/amd_shared_process.h"

 static bool
 is_uvd_enc_enable(amdgpu_device_handle device_handle) @@ -293,20 +296,24 @=
@ amdgpu_uvd_enc_destroy(amdgpu_device_handle device_handle,  }

 static void
-amdgpu_uvd_enc_test(amdgpu_device_handle device, struct mmd_shared_context=
 *shared_context)
+amdgpu_uvd_enc_test(amdgpu_device_handle device,
+               struct shmbuf *sh_mem,
+               struct mmd_shared_context *shared_context)
 {
        struct uvd_enc_context context =3D {0};
        int r;

+       sync_point_enter(sh_mem);
+
        r =3D mmd_context_init(device, &context.uvd);
-       igt_require(r =3D=3D 0);
+       igt_require(r);
        amdgpu_uvd_enc_create(device, &context);
        amdgpu_uvd_enc_session_init(device, &context);
        amdgpu_uvd_enc_encode(device, &context, shared_context);
        amdgpu_uvd_enc_destroy(device, &context);
-
        mmd_context_clean(device, &context.uvd);

+       sync_point_exit(sh_mem);
 }

 igt_main
@@ -315,28 +322,65 @@ igt_main
        struct mmd_shared_context shared_context =3D {};
        int fd =3D -1;

+       int r;
+       char cmdline[2048];
+       char shm_name[256] =3D {};
+       int argc =3D 0;
+       char **argv =3D NULL;
+       char *path =3D NULL;
+       enum  process_type process =3D PROCESS_UNKNOWN;
+       int fd_shm =3D -1;
+       struct shmbuf *sh_mem =3D NULL;
+       posix_spawn_file_actions_t action;
+
+       pid_t pid_brother;
+       uint32_t major, minor;
+       int err;
        igt_fixture {
-               uint32_t major, minor;
-               int err;
+
+               posix_spawn_file_actions_init(&action);
+
+               if (get_command_line(cmdline, &argc, &argv, &path) !=3D 0)
+                       igt_fail(IGT_EXIT_FAILURE);
+
+               r =3D is_run_device_parameter_found(argc, argv, ONDEVICE);
+               snprintf(shm_name, sizeof(shm_name), "/uvd_enc_shm_%d", r);

                fd =3D drm_open_driver(DRIVER_AMDGPU);
                err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e);
                igt_require(err =3D=3D 0);
-               igt_info("Initialized amdgpu, driver version %d.%d\n",
-                        major, minor);
                memset(&shared_context, 0, sizeof(shared_context));
                err =3D mmd_shared_context_init(device, &shared_context);
                igt_require(err =3D=3D 0);

                igt_skip_on(!is_uvd_enc_enable(device));
+               if (is_brother_parameter_found(argc, argv, BROTHER) =3D=3D =
0) {
+                       add_brother_parameter(&argc, argv, BROTHER);
+                       fd_shm =3D shared_mem_create(&sh_mem, shm_name);
+                       igt_require(fd_shm !=3D -1);
+                       launch_brother_process(argc, argv, path, &pid_broth=
er, fd_shm);
+                       process =3D PROCESS_TEST;
+
+               } else {
+                       process =3D PROCESS_BROTHER;
+                       pid_brother =3D getpid();
+               }
+               if (process =3D=3D PROCESS_BROTHER)
+                       fd_shm =3D shared_mem_open(&sh_mem);
        }

        igt_describe("Test uvd session, encode, destroy");
        igt_subtest("uvd_encoder")
-               amdgpu_uvd_enc_test(device, &shared_context);
+               amdgpu_uvd_enc_test(device, sh_mem, &shared_context);

        igt_fixture {
+               if (process =3D=3D PROCESS_TEST)
+                       waitpid(pid_brother, NULL, 0);
+
                amdgpu_device_deinitialize(device);
                drm_close_driver(fd);
+               shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
+               posix_spawn_file_actions_destroy(&action);
+               free_command_line(argc, argv, path);
        }
 }
--
2.25.1

