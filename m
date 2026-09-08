Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F0C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 01:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349810E06A;
	Tue,  8 Sep 2026 01:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g3CS+VY+";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6310E06A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 01:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5BOEpe72dygFWZUAAnOoZUvkzmCYXJw56GPBwNBoVF0lfw8MJFJTzmphw/AWcA2qMB9Ma0nVVQSVS4zAinvY6HTpSRrOrhExAiP4GgIPSw9CSCtBeRYYrf+CxfmCYtaI50knT622EjuDaEvxa7Kp9c6X9ZxXXMyXrvs8e3vJvAvUk+n2U4s2dvZStYbTqrAtiDsSb8EsklMV5OXQj8PSt0Lf3Wh38g0qKHbYal0ikxn9U/j5MqXMIdmshT2n9KEVdZlJD5U3hRcaCmMsmdGAU7WheqTQlBOkoMJaa8DD7EvFOCefp6NB+KGjlsTsQtf6x2X4F8rWjvC3bGQgFRfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS3ROylFbr/tipsSBwRW+NydUNLYU5kK1zDL/D1uAss=;
 b=Ua/hOVxOSSEcR1Zb4XJEv32sWJnqPw2DDdGJ4ixUcyPXZDnmOOzkI6XnnIaD0ARqVJSUu43osKX7Fe2xkX/fcJ0N66/OtBM8Uxd+TIqDFh4LhgZoCO7MbKmGweWu+6ANNa737nzXHNB0REMSO8BZL8y0W7HPfIDbYKgNX2YTP98IzNDGkLhGVgD7k862w/golo7E43YG8mICgoLl13FxZOmy6st7kGatDb/1moH+/9qhBEUSI2XQ98uVBHIH7IuDpPYpXz7JDW+LXvR1l6aqkB15iVGZkDcl56l0iowEdbdL9Ppd7mlpQHkk4Ami4uSMjW+oED8QytJHveGdk1cUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS3ROylFbr/tipsSBwRW+NydUNLYU5kK1zDL/D1uAss=;
 b=g3CS+VY+HOfSHJ5R+5jyayXLhc+8OZiq+iKR1fzzm/WeLYJK9P4VwYcCCnxfmhYSfImqom5U9jCY2vXP+6csq9Us1eEBW4LQ8EDwbrcu+MhhFEl7Tsp5x83OPCRrGuGqvikos7y0YV26Hj3M4n/83Nv4Yhc/C3rxtpQ0O4ZaVBI=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Tue, 8 Sep
 2026 01:55:53 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 01:55:53 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH i-g-t] lib/amdgpu: sync uq fw-area info type with libdrm
 metadata API
Thread-Topic: [PATCH i-g-t] lib/amdgpu: sync uq fw-area info type with libdrm
 metadata API
Thread-Index: AQHdPzJ40HaCHsuxvUKS72Pgc8FmqbbD658Q
Date: Tue, 8 Sep 2026 01:55:52 +0000
Message-ID: <DM4PR12MB5152EBAFB786F94957727DC5E3B12@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260908013616.2933758-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260908013616.2933758-1-Jesse.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-08T01:54:39.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS7PR12MB6261:EE_
x-ms-office365-filtering-correlation-id: bb19a7ef-595e-46fd-98b0-08df0d4c5079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: pb1NiV1cUzYeSG0+Ni6mCnjyOb14oYOV3r3+HiqwRP3ZaD2OJer/ZAIp5pBBaeHnvVnusMRnb8162zIzx5odg+FB0QfoaGWGd/6mQR1+aPSAt7nXa37e7uluInQ58nTdxLUEJVpdAVFk6u920Ftc3kIagibJdt3l33qApdb2saiArYblygo1KCPb4CJZvCMMYmPQGs+ayEvmmnuphn/hkQWDYLt4OAURjvq3s0wo6CQjXB1y8cX4QE450BL7k3J31a21qD2Sc385OmF2jxEt7bmFaZWhz2n8owfGaYPrEgdKWhPafQ1WtHk+oEM/2+8vIbgo/GvDJIDZJiB7HslgUTfBe0bvB/LbZo5+Pis5E9uZZRgwEodym5UtJY2UQKP6pbvYfXCLwUxBBC5SIHJf6uwNOcZd54JDyFrCLw3JH8HZC9U3wbdGcpYCW2F7DSnOCl10r2gpIvroHS9p2gGgG0yn/y+A0QVJ5iuE8z/WbkYn+BuAhO4cp7+EqD5zcl6UHfhX3JThW2q20lo4XUN3ALXw1WU1BDCxoYeIUwdU+heqFU43mA0/KFT3zHU0cd/zFc5G3mQSahBavJAmXKEWc+/YzHy1yJ/n/nTWMvqSgpcryz5xi7wTeVSqNWaV+NbO2mhXG4Bbj51v5LhZsaq4EtJYB6mvdmdJWE4xJGSf9ze1TrYyzMZCgsMv2kiZ2id65RMpXhwq5Z0ve0mezaqPJMFE0WlgnLdAJSRlic8JCBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6wsxMRxbC4HW0DceORndwRH54rRvzXC1kZBJUh2CHt8NPas1J7QHFUAXUbWC?=
 =?us-ascii?Q?J1YJT5MvnZlNchG9w9zShzLNBFy3rZ5x+lZJ+oemQTdyWK0Bx3cf1soh5E5m?=
 =?us-ascii?Q?twH++ZRSepUzubMXagweF6hM2cOwcmJxim+6wg4E871GQXSlJ29cnl7iCDSo?=
 =?us-ascii?Q?p6GTCRoDDZQYa0zskRCRjz3dQu9F6dNFla7BegQFSridy3TmS0GZ2+P+1RjI?=
 =?us-ascii?Q?uKI8MfzhTHAjsezNTll59XwCwFztatwaql2zv+wyyoxb4KNvHb+eDtyncXPZ?=
 =?us-ascii?Q?F5mXGDNiS2/j9dDRdMrIgDuGaqCErVdiOBvZlPmQi28uZlJ7ZPTjXSIdjuAy?=
 =?us-ascii?Q?ODVgTW0SYvKFDJ6Z3X64Ah4KsKnK7B80z3ncarjhRUqLnLOb7bG1IMhyXeiE?=
 =?us-ascii?Q?iCV5CXqTKz7+WK1Jn8nUzg0fgZbzTA3mhhxwUj96HarRZomeUS6NpwA1nwug?=
 =?us-ascii?Q?MfSXaVGBBOpvcH7rnultkiXzQU2UY7XQhdfbseI4jvtFrwjSXe5Tbvlk34wN?=
 =?us-ascii?Q?QW6ETeyj7iZ2EM4k8BpgYfObhdf/6UZ10305stK+n27jRJSwloucNK2L9bfx?=
 =?us-ascii?Q?sypL6Be8gXvvX36FeMqwp9VsHVqyHmWuVrKBxjlKrDYQVzZlTNWgb51AeZth?=
 =?us-ascii?Q?gLKFA2WT7KAC5NzmmMJWlREIawSFAy0OpnaeYQcWt69h9c4lESHpMdz43RPB?=
 =?us-ascii?Q?LCcCTDfHC7jbUJGLOkVKEhuZIZRoTCrovJ23nFFvPT5wU5FvB2OsovpVvmbd?=
 =?us-ascii?Q?DbysbgDgGCV/g+gQ2n4UIQS8SuGEOca+wh8AFgSKzCd4VrvD9iOEVLNYnCzO?=
 =?us-ascii?Q?jKluW/x7d284exKSRsjDtevtLDvzNdq7If5k4HerggPSAuFySDj0f3yI4WQt?=
 =?us-ascii?Q?ATa5gkd8MNK8/JYh9k1KvOpAqnd17UTE4F4QmGeRV33ZKej2IQE/ZKsP8gR+?=
 =?us-ascii?Q?GMZ+KMSbDYzqr48AacEfARX28C6yAd72WgSa1GS0Akv0dsKz3HHejWRxWlkA?=
 =?us-ascii?Q?oW2EX6l1/sQb/7seZQgFAxpayNisZdwA4q2bxTnF7UEhCa0yLhjqad5iDfKE?=
 =?us-ascii?Q?XfdEnXmU5UwwY6/RonfDIqcQ2HNOtiWZgbtbAaM0yGhRD1/MbAzK/ZT02c0k?=
 =?us-ascii?Q?gxyk5ShNE5n0PN4s+bX1Gs2jll7TBcJiA0ySG4RynHcJX5h4op9apuetofTw?=
 =?us-ascii?Q?lav1v5sgASxo6x5XV2wZeC2KLXC1Wp+s+Bh9b5ebIiqo2HoQlisTdRISSSKk?=
 =?us-ascii?Q?YQwSx7A3iQEeJGAV+fNsxnl06lRdZ8qhmJtqipaLxmYhvaKvw9fv6I5yDhTx?=
 =?us-ascii?Q?vfWNU8A45vL0EmBCDieEI1a8qnqCZCC/3aFgjxXC6OYo+ziWgwvQJRyj0XTj?=
 =?us-ascii?Q?GXk4DAfWFqgSeXBwTBKDzergnk7NnT9ShQIBVDv1AeR3ESmQDYB2WXvxOfXS?=
 =?us-ascii?Q?/Pl3b3lyfGOl6qE97LbvovqaoxiMPlApkiqUvntyeY+KjchRm0gjJI8JTvRm?=
 =?us-ascii?Q?D/ZBOj32JadanM4QXwJ5uolih98hBNQ2Q8D/wuy37mwxhcQSiMVXcYm1oZQh?=
 =?us-ascii?Q?NcowqMQkdz9vL+wzyBK9LgbMWHl2M9oJLfBdCCPJGnAIIPsY/iCAOm3w+MVp?=
 =?us-ascii?Q?JurEVNuXaAY8AwhC8NappP/mdTL7x4heTPtgO5sQF9oqCtpDBVmkwjRuM9kU?=
 =?us-ascii?Q?D8gJqH8YBKS+zhiqbb77miIbYvzdc76LkiK7zsqzw+U9f0QC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb19a7ef-595e-46fd-98b0-08df0d4c5079
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 01:55:52.8158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GnNSBlhcLeI3wPNUKo5EpjtP1AChzQXP4DIF3PiZKrp63n+tNjlpOuzBSEQ0lzqkz4Iapy182A651mSmwKVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261
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

AMD General

Please ignore this patch and wait for libdrm to update.

> -----Original Message-----
> From: Jesse Zhang <Jesse.Zhang@amd.com>
> Sent: Tuesday, September 8, 2026 9:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH i-g-t] lib/amdgpu: sync uq fw-area info type with libdrm =
metadata
> API
>
> libdrm renamed the amdgpu_query_uq_fw_area_info() parameter type from str=
uct
> drm_amdgpu_info_uq_fw_areas to struct drm_amdgpu_info_uq_metadata (the
> metadata union carries the same fw_areas_gfx member). Match it in
> amdgpu_ring_context::info so the call type-checks. Older toolchains only =
warned on
> the mismatch; gcc-14 (Ubuntu 26.04) treats -Wincompatible-pointer-types a=
s an
> error and fails the build.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h inde=
x
> 40a9735be..c4050137b 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -346,7 +346,7 @@ struct amdgpu_ring_context {
>       uint32_t max_num_fences_fwm;
>       struct amdgpu_userq_params *userq_params;
>
> -     struct drm_amdgpu_info_uq_fw_areas info;
> +     struct drm_amdgpu_info_uq_metadata info;
>  };
>
>  struct amdgpu_cmd_base;
> --
> 2.49.0

