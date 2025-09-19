Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A16CCAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 19:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7010EA91;
	Fri, 19 Sep 2025 19:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S03Te7jH";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594210EA91
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 19:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+lMngogwvP9Jx1nAyAXbEvUB1NOhbk100KfLGTB+jRlFresUr8AyTCc5wKyUwvJm9U9Bnktdh/H4Wr5oMHG92alL0PCExjCqRC0lJ70nRlivkZ7mgUn8yUXCf+6lpzMP+wCCqAmgScoA/O0WTrWSIidt1UL2Ar+lxMMyhgvVCMx+G3gG0etLmq6n3kusDCOmmTEc0bbVZ/YO4P72ctaeuZifXGrHngF5SMzxlbThhK0DzTPCSC6LgRMz23PGbb5qF9RbYjG2+l5Mxc8joBaXmciVGRm6T2iKzkDw7lTLeLBvG+iKdtEvn0OHCc+s3dUSd85oLlU/1QMv9tUI3qvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UovQ0HqOyGsBKCk6WJLw/Oj8Za5R5byljk+eiYUHSoo=;
 b=uNJJPD15l063hBKHs8ytAJb8RVh1gL9LqH7K6mPZyGpGQ+r/DEwlfJJMxLuzyAxkKZ+D1ieo3yhPbFTd1ZMt/PvzKX/HQyqwYoXJkLO3La5Bky6bIiNAeeI9LSt7rnBBldRGwtS/3SRS9UgQq5efvywm4BVfftjCPeRcugdBs/GoaVHMWAjkQ5IzyUI717q2CQLp6sCenyNUurpNEpxMYUhEXQNwcrijaSAHsmNh+L3kYM/NdzjHGbKAuQ/l055G2pGSTSkAXdpE31W/OfYjlccTa99240Ju4GXnPKzMYMQ/hj/k58r/utiLfYWqjIrboh2BraoHS88sHB6KNzeuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UovQ0HqOyGsBKCk6WJLw/Oj8Za5R5byljk+eiYUHSoo=;
 b=S03Te7jHKqZ35ONi57q48B3JR8Ducyq3Yxwfsj1aCRWIAymIR9ZRIqlyLs9z4AfA91rq0uVcRRG3IhZWQxo4M0+huPlz/UbXkj4LmRL7J+PneoCBDS5Hcw8WZNOWZncr+NVnPz4nfDetOGdZr6EOBNb7XCpJ6/MAiYIIwEHDpmU=
Received: from SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 19:36:15 +0000
Received: from SN7PR12MB7787.namprd12.prod.outlook.com
 ([fe80::1d85:6db3:9cd3:51a7]) by SN7PR12MB7787.namprd12.prod.outlook.com
 ([fe80::1d85:6db3:9cd3:51a7%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 19:36:15 +0000
From: "Yao, Yinjie" <Yinjie.Yao@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)
Thread-Topic: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)
Thread-Index: AQHcKZxMt1eajG7IlkibdiN13zI8S7Sa5alQ
Date: Fri, 19 Sep 2025 19:36:15 +0000
Message-ID: <SN7PR12MB778712594F87BDE090DC1ED29C11A@SN7PR12MB7787.namprd12.prod.outlook.com>
References: <20250919193329.92904-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250919193329.92904-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-19T19:34:40.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7787:EE_|SJ0PR12MB7065:EE_
x-ms-office365-filtering-correlation-id: 58b48844-d4ef-45ce-1cea-08ddf7b3cc56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?c3ImEMTuOmg20Mjo0UVLF0MDyEtHOz1vw6k1qzy5x/QIFkFAjLPblWBteZLW?=
 =?us-ascii?Q?gSJ8ZY1pzpZE41xvRsPW1CG9ox722e9kCEU6Ks9n1gkrDl77sxwHj9xU7anj?=
 =?us-ascii?Q?W/qfDHT+dz3GqE+HKA7OgzqfKKWz7NIQl8tuRvShhpeQBmHB/Pt7V7QuM6zj?=
 =?us-ascii?Q?1wYOOxlpD+fJAwH11r3j7A0US8LpqdtHKAfzVix0SX/3Ypceww03+i0VvKeU?=
 =?us-ascii?Q?vHEtf6PlTpg/tbb6lmAi5YjP5hAKmU1hJcRIaTwyBfMfm8CWaUPCb8fZxSiy?=
 =?us-ascii?Q?OjOGDvE3C1lgoiywrkU8NuO9jyEcY+uK+tAkBX3XSvPUd8dt0dZ/soi7wIhM?=
 =?us-ascii?Q?phfTbzZN1uWYLsRLFO0VUOiw6e8VcjLt2e4MjF8F4dX0BcNO/gA8W5EDxue6?=
 =?us-ascii?Q?LjVxzRfbJLwsj6Erougzd80AHMQHe7iBn+lwzIAoVhQ6ZvPgfotCAtPndRni?=
 =?us-ascii?Q?2bc1u68uOHRp0YG+aSKvPi2z/97Niv/JYDFZjYb4KfhqNsgPrRfHscnFBrIc?=
 =?us-ascii?Q?MUTY6sWPZXfeHsRMDZ9D7qjlWI5v8+kx1fBpcSpivIg1+bxFFvK4/p6GiL2i?=
 =?us-ascii?Q?GnRTfjPcD6u8SZlCMN8ig4C7z567Tz4hPqGcQp5NXje6Yrg/uzvrt8rY/XHS?=
 =?us-ascii?Q?sUUWidK4fkeGNL6HQCdn2IbD480oIVocNIldwaJ193o1z1oLF8GWDx9t5zFx?=
 =?us-ascii?Q?YSRLqiHxkPsBehI8B0XEalwcrg8cchetnlDkVp3dfNwNEG5LwA8B5OaVTLlw?=
 =?us-ascii?Q?JsR9Z4Wa4YdcWijI5uyVRpTMIAj6xFVkmtD16SxXwvjxokdLoyYpRClaKf1O?=
 =?us-ascii?Q?WUKfykLvEsJG4yP/szq5evx16Pjb5xVAvkIx6tbGC6zRbiz4qb8lfxfsgiLD?=
 =?us-ascii?Q?bPjkiZvFLWMxpuBkCz2G2iinEQrLrC2Nyz1LWNRdkSIqwZKd1H2uhN9qKtkP?=
 =?us-ascii?Q?k1g6l/1VU5DjApdZKB0XNqkDit/oZF97SPTEsDE4IuTGBRcQumoJLpJx/mck?=
 =?us-ascii?Q?7CEKZBxdFbF6Wuq98LQnSdn6hTtPXkZpzffofuCrJicY5pGWt/g0BuCtbmvJ?=
 =?us-ascii?Q?57puemgUMuzvUPBzAxxOrk1FvAa++Q1hpQBRfzdoB24dQqqJMu8KR3ZNtMoF?=
 =?us-ascii?Q?/TEdNO5iCl4r3pgl4GK0M79QVdvBayMQwxB5W6Zpzm1mJ9WpH1ekkNOELJWi?=
 =?us-ascii?Q?ywat3vfd1yu6sMCueoBDgTQ0M5348gYWIATQgifp1AWAHUwAJkIuaxRmnAVh?=
 =?us-ascii?Q?mRyp3ubpVFMtqa3fgn0awmSo9j2nKU2GvR3rgeaHEOGfB98vGiXytqzq/4XI?=
 =?us-ascii?Q?yg0popfQOAP5/d+SHBrpGw8yCiAJ/L+kZPzABYAg5xoMf+AqEaAObSNNOF4t?=
 =?us-ascii?Q?qai7jHhrQ6PuSmjxNQ8Ekb19cYHtWv3neS04zoW4tAN0JHdS1nAnHGgUx2dG?=
 =?us-ascii?Q?/05f1osp5fGjmr1j3Ur5KvKbJPvXVM0CYIM6wYpDV7qPYhJ9fWHnFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB7787.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ZP/zAmR6rDWXGbj9RCuzl+usIOxxoAPDkbydYDHmpzeH8XS1XsNdQrTiGgi?=
 =?us-ascii?Q?Qa6MhKqseB4lINCoyYcluZ+0LlIBR7EbcTOf8EfrHS/UVQXwlHc6DlB0JXFs?=
 =?us-ascii?Q?PJ355xkNzW/cSPRx/nabihvOQjE4y7cmfgCRiYD4e0e6qMxBTzNWcO+7+RIP?=
 =?us-ascii?Q?8GEqyAI7gTSMh1I2fLZLSIjqRZb/Cfcg40jKgD73muACngr8zN+MqSZo4/uZ?=
 =?us-ascii?Q?DuPKeA4UsiyHiYbBcORAsCX/9wFCwPxf2b5c1w4O7kyj5p5ZWPyROThK7zeO?=
 =?us-ascii?Q?MnAvQ8XCiJLA2Pa28oY7aO4N/CbfZK31gV6ndBZqjV+MMPO5dKJFNwB+zeVt?=
 =?us-ascii?Q?01q6ux1eXL/YPxLSW47DEHx1rjduHYFAbXozGmMfOOqOJvrTuGk5sELgiT1e?=
 =?us-ascii?Q?8gdQvJR/4DiRJM8XL14x6zTPeJA3GzIFnQFwWA20Bh1P0UCIjYBj+M8YnBa8?=
 =?us-ascii?Q?etkxvERzNZefVmZT2LuQYqP9aUVjBZBZZWiDxW7mAbdzqPMbtKCXlKD/OrsP?=
 =?us-ascii?Q?tNU7eHmJUsz3GYaP+N1e2E+AX8hIalu1ZkeoLFY/hNcrdOdNwhtPPim7bXfD?=
 =?us-ascii?Q?pKb8x1guDN0q7ZupBEaTZwh4NIQdkAHii04C57C21SkNsQrqw7Ccea0/5YN8?=
 =?us-ascii?Q?nG6Ll2sqVHE02mQb6vxFgGumVaHk3U+uflc6SCadqXvDi8g8FvgrF08DBsOo?=
 =?us-ascii?Q?QfGszbZ1bDe+axjgwXXdOJt/0KAzTtenhXb95WPGS7Z9tm+Ni0OMUTyfmZ94?=
 =?us-ascii?Q?imkQsFf14XZsQuzwLZPYHp31HSYgtJ7Dmm0T+BqwwqBRkuYCoJn/bGO27IYl?=
 =?us-ascii?Q?njC7d7G30JpUqmmaMP2QKf46BPaUYRGVpJjZuD8/qvg3K6GUhG2eSVCK+foX?=
 =?us-ascii?Q?CXRZZZhuXqnDIGgum25wtcCpDffjaL/6dG9xWCWOQYeKT4dSndD0aU4DkPoz?=
 =?us-ascii?Q?Oaadq7ZbwmyJt2jp9FV9kQ9lQghYnRmGBp0aFt37EaWT/2XiE4zhW3Y0oHun?=
 =?us-ascii?Q?Pq7iCLxHVrNTUZGWnlaXm2dd8LgbsVo5WopnpHw5pKwzt9GiTVQ71TOnovCG?=
 =?us-ascii?Q?vWfDkZrZ942OIoobI4bIlhergrZ7khTMa+L39eYVFCiIDY6ZV/Bx6m15P515?=
 =?us-ascii?Q?ecIXvn1z1RZWl6zCD0wQHe8Vxoloriep1DTGDwFydJW+RyKf+u59C8z+mJfF?=
 =?us-ascii?Q?K9y5Z7cscUQ8vq8nrhjdEwO3aEFbR0/wOUiuMPhHQOp5lxBzRk0UL73f4PK2?=
 =?us-ascii?Q?wkEL3vejpO11hOUvFK1d6sHMQNsviliLX0CydU0R47Sv8ve5OuXd6EillIen?=
 =?us-ascii?Q?Fe2M9cwryQ9Bl+7SUZnqQWf1kdzrukjmTZVZrfpzxLEod+XEWkGfPOERbQpO?=
 =?us-ascii?Q?oZDD+IQAjF5jqppw2ODZ42xi98baZ/3Q2Wj92rthE4tKIBnxksasrVrTDnv1?=
 =?us-ascii?Q?AUHmANvhEkRqoXQ7VMokxUoGUJfhi4A887Ub/gWdSqU2fkvYp6Yt7jagzE4+?=
 =?us-ascii?Q?vMPnmoAk6guS5eURlOPu9IqCUeFXTrvDZAQYpw5Y32kJqc8oc1FSnvu5CSjP?=
 =?us-ascii?Q?t+kDIfHJ/HSQ0lQ/fn0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b48844-d4ef-45ce-1cea-08ddf7b3cc56
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 19:36:15.5719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQXk72Pk+kLBnS5HYjkVS5KegAb++OjfAHBuMBkkspssxXi19fZeL7dqzxll/aiTO9cIxLrqNpVh52bDWDsSJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065
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

Acked-by: Yinjie Yao <yinjie.yao@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Friday, September 19, 2025 3:33 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Yao, Yinjie <Yinjie.Yao@amd.c=
om>
Subject: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The previous patch attempted to skip VCN ENC/DEC tests on RX9000 by checkin=
g `chip_id =3D=3D 0x51`, but this was not robust enough across multiple sys=
tem configurations or future variants.

This change refines the skip condition using `family_id =3D=3D AMDGPU_FAMIL=
Y_GC_12_0_0`, which accurately identifies the GFX12 GPU family and allows f=
or consistent handling of RX9000 devices.

VCN tests are currently failing on RX 7600 and block IGT enablement on this=
 platform. This patch allows test infrastructure to proceed until a proper =
VCN fix is implemented.

v2: Fix RX9000(Yonjie)

Cc: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c inde=
x 61075d8db..32766c0b4 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, s=
truct mmd_shared_contex
                context->vcn_reg_index =3D 2;
        }

-       /* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id =3D 0x51, fami=
ly_id =3D 152) asic_id=3D 7550*/
-       if (context->family_id =3D=3D 152 && context->chip_id =3D=3D 0x51 &=
& context->asic_id =3D=3D 0x7550 ) {
-               igt_info("Skipping VCN tests on RX 7600 (family_id =3D 152,=
 chip_id =3D 0x51, asic_id =3D 0x7550)\n");
+       /* Skip VCN tests on Radeon RX9000  (GFX12, family_id =3D 152) */
+       if (context->family_id =3D=3D AMDGPU_FAMILY_GC_12_0_0 ) {
+               igt_info("Skipping VCN tests on GFX12 RX9000 (family_id =3D=
 152)\n");
                return false;
        }

--
2.34.1

