Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD400C5CFEB
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 22:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651C810E079;
	Fri, 20 Feb 2026 22:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DadOOr5W";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012019.outbound.protection.outlook.com
 [40.93.195.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F10110E079
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 22:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkX97XU3yV25LNSeIOy25peFUxfqEB68gonC+Yqi3iXrBXoqHgNgAwERpOvmiZjRoM1IRHsXzq2UZx1F/Fd1vN0as6KhB1uJLMlM2DHqAqM1b74dzP/GnDS9y41XxvIipuPBdyyH4+pl1CJxvQC7u2Myg0PVfc3+azFySMEsJXO+/mSF2OrVk6NZCRohdb8GxqaGfiGU1xA44o3Rom1M/HIGhji00M4fpbKiao2ma2x4twBWiErIGSa9DKqoA6MG4y5nREhWekskXYvoBpKNMrZEE1XNWk0nWrx3j/LkcMYoDMuM9vUfqZf+xx/p87mbnrwmNSHgx/6nbOH4ESN/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeI3TFYBLWKyV0gT0ZdXZzrBDNWLzD4dJnTXmU0JAME=;
 b=e+rQIpu8oXe3aerdYKrbok61yYY0Ind3U8XWJ7O0rqDOYGytDr1vUI06RjEszQkdtrtNRpUx8Yr/rqlModSSq8/PtMWkRxMlgBrvvwZVr+AKqRG6STXrSzaTJwUVzhY/rJ1stma5BbzqYxKdW19REYdA1PQQbcMExbWE4xd3slUhjkuwUyT4v1yJCnM8mAT9pd0MU3Ivu82etKowptJY8WB/qXHGsXKgG76Q+tO8yo75pflPburVo20fJGVo9LcaCarG+esu/UomIwtzfJn4l5nSKVRjAlLZCNkc66OphsXyDHRP7s3BMZWatIDeop5H1oq7x1ZWUu7t1uwCsifpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeI3TFYBLWKyV0gT0ZdXZzrBDNWLzD4dJnTXmU0JAME=;
 b=DadOOr5WXaEjR/NIpjXQZfbc8cDcOtqPvt397LOKeocajSf5xSKmsEsyJtlILcOnDru67V9/zpudm0dIqo2s2sgHe4DrmW5PoACx1zI8VxxwdzRdNikjQVhhuurvAhEagOZFV9hv6NdeWwh+BPmyIQHUro6J9tiBaC/+GL5Spkc=
Received: from CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 22:57:25 +0000
Received: from CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::8715:80d8:e0b7:7bb1]) by CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::8715:80d8:e0b7:7bb1%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 22:57:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH 1/4] lib/amdgpu: add DMA hardware limits struct and query
 API
Thread-Topic: [PATCH 1/4] lib/amdgpu: add DMA hardware limits struct and query
 API
Thread-Index: AQHcoV7u+CZ+Ss47EUWXp3E2AH92tLWMMg3A
Date: Fri, 20 Feb 2026 22:57:24 +0000
Message-ID: <CH0PR12MB51396E2C24E3560CDCBD887BF768A@CH0PR12MB5139.namprd12.prod.outlook.com>
References: <20260219051630.127667-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260219051630.127667-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-20T22:43:57.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5139:EE_|CY5PR12MB6083:EE_
x-ms-office365-filtering-correlation-id: db7c44f5-c3bc-48d4-1503-08de70d369db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OQxUEh0b9uHJM9HBwUn8CWs8PAUYRq8wj4rlvqQFidh3cfeGFKqXQu/ohI6l?=
 =?us-ascii?Q?6nyuPnsiVvysrchbjgmr1y9fB+Y72BaulPLMxMPRsDnKXzpWCjRMC5D+Qnyg?=
 =?us-ascii?Q?r7wZy9rPTiU/RoK3yxWuKo2le6zgoLwBIWqOyCSwI2Hw4UudHI+O07eB4F5g?=
 =?us-ascii?Q?y1c51BWatNuV16Q649AG/w0VnttUc82yAtNEHIPCfOye0zUE8TqgYePWlUo8?=
 =?us-ascii?Q?nk3+PiRbZnHVdTuvD52x2qIhGvqRW2EicTbnPPhCye4kNuVRfGUWemXwixsm?=
 =?us-ascii?Q?MouWYWJA4yBV64kvjLe0m/xCZ5douL17KNRYkyvpIoXE6e1XUE8qSb4av/h5?=
 =?us-ascii?Q?NNyEFKAbj06v7WwPDw2D2VpheSHskALLUvuBRHKAusNcuKLX3dHGJOqfwfPG?=
 =?us-ascii?Q?Ac/0Z4GYnuCnRhj7bM0bsGCwVKe9r0WUuz3Xr2BFCnsI36eCSSuZ5WE20pPj?=
 =?us-ascii?Q?DsuTzjWioBRjSAuszzMN6M7R043rhb38QobsIcLBXpz+DEOa0nJZnnMfUgY2?=
 =?us-ascii?Q?iy/dwLbfx7Y9rATA4V5osiUtLija/6jOU9Z+iDxCLUprNgwNK0yVXrxAKYfT?=
 =?us-ascii?Q?JKYJhRoU/6UIchmtH2vjJAU6cnheCRs8Cyb0Lies6ztviF2IlJNIplDZlE+t?=
 =?us-ascii?Q?WdDYFCZSrXrGatbr5i1eO2vTsObiACs8SlA058tyrSrPJ2GcOt/DQ+zbK75S?=
 =?us-ascii?Q?eyLIMJtWKaCH3j0pOWrvj0mq/F1b+Sy8+/r9Vcpp7NAxgoQ3mhicJOHdp/+S?=
 =?us-ascii?Q?YBYbn/hlyQxehr6MX1BO1teNBdA3iiW3ZoQfRUncrR3LqEH4ov3cNuj1Vplu?=
 =?us-ascii?Q?w2R2IindmN7UHjLBCGt2RhnTPif2RY6QvnU5r8lQ5yGF5OStp6ScyAZCa+zU?=
 =?us-ascii?Q?aQ7yYw23mGhyjAvp3oJGjuCtUFaWZA1kd1ITonJn9jaSgJkAwVGKsAtU90HX?=
 =?us-ascii?Q?tjV9C9vk7vqHc1Fr7/pdEEgM+KDFs/Te78pFhzU+jSHsg44L/HqoDlHr6LFt?=
 =?us-ascii?Q?EtL2mswvDGJmYuzOjxCTGHgJ/hXEhz7IdUGqEXh/pnrr/lnBt/ra7CIc8OBX?=
 =?us-ascii?Q?uuc/ZQRZeek1NLJyy5QuU0tGR+CLZuPEpggbz/+a/EVn1pCjmsX9h6DdKVzz?=
 =?us-ascii?Q?YstPWx+CA9AfFdYNoXM2Vt8MaPjOJ+9UqWM1AvOe7eWx8jqy0pyx00xFG+mI?=
 =?us-ascii?Q?8fdcqXmJ3MeLNpnXGuU/SojteK4IqryBx7ZoXGRLYCIGqukk5Jd/O85KDuVu?=
 =?us-ascii?Q?1FygIz1+EwlkRWNvl3pydcsbSvQR7rV1bDXLdsxe0jmGqjq0znZtuzErn/oO?=
 =?us-ascii?Q?aGGcCUIfMV1clmbug0BshsNUMfQQOrobI/XhyiRGBCFrEbG3fx7FF8EJBte7?=
 =?us-ascii?Q?AS5EbJBEfBQEkb6u0nq3r0MUK7s/5iS0kjYFbDQYceW5F5HmwhN9jQCqvJh7?=
 =?us-ascii?Q?u78GwMHiZ1d4GQ9xbSjPjMofmXoLQRiyynYjgt0q8CYk/IR4zBPp+pCci+CI?=
 =?us-ascii?Q?VjM43flnlEI5SHOF9U8I1del4e9GAeLoCYNK68HuEmkO32TfmB5rGe2WHOWT?=
 =?us-ascii?Q?NOVtF2VTnXqjdqBF2eS26EtDFbA9iYSIpPTVNRkv09CY6XljMf/4EJswSBnF?=
 =?us-ascii?Q?F32VXwl/var4bOPrAU3RLcs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ujiI+trfMCLepLGkfGsLO7ihXc48yWgVYwTIQNhaQvhSCNCFO+VGgBlsw5Hl?=
 =?us-ascii?Q?R6T86zyP+5IYDq+kg35GXX877na6bi1F1CMLyP1+2L8x7zIJpf2j9FA90oks?=
 =?us-ascii?Q?r9l3zK+DMAx4ncsA97vQPJ1h1UkVL7yZ8i586/z0afHDZa2v+iyIUAgsopqR?=
 =?us-ascii?Q?CHO2Mhap6G5pb1UkdSjY8C0SS7UqCLHwlSvAhi90koPle9Lg0TJYdZfQPzZX?=
 =?us-ascii?Q?qJlUTGetNBYWxgOgbyN4QtoFeLP6cty38UKUK8ErPK622mmr/L5SoX0PLL+s?=
 =?us-ascii?Q?AHMSNzTNFVMs457/9QsbV/6TSYklkp2ePMFqs0uiABKIyqLIknMoroJrc6z2?=
 =?us-ascii?Q?JfAd2mrkKKg2U/qAr1gsEz0BvypeoSf/RZEHLzjC8AjIAxpFnRB/aOUBqrp4?=
 =?us-ascii?Q?XPFxAY2lIHmgtVP6greYKNC/lse1XFiT7noMoOI+fpoHA4CG0DdV6uLleAOZ?=
 =?us-ascii?Q?7PyrE0yfggeqlSOuJHrYCJf+MuI0hr8FaE0/W4axHfYfDr1Ljxz69mvEuq/J?=
 =?us-ascii?Q?e9TehvzKqmbYV2QLxlCGmg4+LRpbqFmzwhltQiglnH+MlSCauWRtHD3gBRsy?=
 =?us-ascii?Q?whAv8KNj44k/fyJiDWzgfC1XdNk/Sb1MGneDgqmaJv8QvY97P569Cz08tSDo?=
 =?us-ascii?Q?MiZejy1U3xvCGpbsBpBdxLDGiNjNn1nTlA8xYCpn93sRPHgtzsBZNCcGyK73?=
 =?us-ascii?Q?QDv1Rj+ylKoJPx1AzIgFaW+5yh48jHmSu/22OAjwM3px0HxsZuKeWcCGx7D4?=
 =?us-ascii?Q?20jo5gInfCOdOqC9b2joRhAeCNNDAXMWu7qZouVKQQnp+EzIns93J6oJ1Skp?=
 =?us-ascii?Q?1yRWdN4xfOuV9GxUYgteOlpl9exjpKgJ8f+ldwFiLc7vcsBT+vcWv24gI78w?=
 =?us-ascii?Q?DSNftb8Zh5jTytJmoM7zsEF8Wvosyw5Bmj78OqMbWwA6dpYYWbqdEug8fDBn?=
 =?us-ascii?Q?K0GJvqpiA4jzNlkqN+RDeW0AnLhMVDr2F62Iu40FDrYoAhpnSYQ08LWBP0kK?=
 =?us-ascii?Q?/4hXYSbqDVRkOpMWunOzrHXYzB7JXev071Lgar9xLjaFfUwUeUV/wYWTgLP3?=
 =?us-ascii?Q?N3xPh17MOhqmz00JWMb8azm4r60JahX13bFR47vOYIBCxb2wVuiv3hhvQsDY?=
 =?us-ascii?Q?flBk0rdaBEwqQ2vxmHq8Tw8NYAeV3nQpLOCNp8hx3ay92PK+8lLG5zQNw8H3?=
 =?us-ascii?Q?C+KwKu7mb+CNTxPnI3+631m188KpNRPtvjKJDOY1lVQSBxWEeOPhfYghKDHk?=
 =?us-ascii?Q?9zLI/VXMe6pOotFsI7sOCtmhEKJ2MQ4KwNc+DeBgWTgmCz685nkGOre7pxL/?=
 =?us-ascii?Q?qF8J3fiM/5No92OyDoroyRsv0C5aWXxI93iMKmHbL4/T0peJjz+/7qORxLfU?=
 =?us-ascii?Q?1zCEgd6NO1s+7ANwCcRbidOu3WC6mnIo5DOiHftfTkANzInF7M+R2QJdEop1?=
 =?us-ascii?Q?AydCC1cMvTlIslV18/tLWEgP0Jn5oGOTWCrgEqlcp45ihCxGqiSmg7w04Ih2?=
 =?us-ascii?Q?ISjS8iLiPVA8SKD/1lf5yhwANI43h+hkNTm+CIPmz9QB7xaqxSVUv+TIvEdb?=
 =?us-ascii?Q?DWY9uiGXsDoo1AuqV6c8+7nJKREvQBBjj/BGHTUSnOY5nCHL0mZKaeVtoX8l?=
 =?us-ascii?Q?+fsTLAbjMYDSI2isfbTvLjk1WQ1bmRZnmgjgirHdDaGkShGK4YK0yBuzQqa7?=
 =?us-ascii?Q?YlMMhnRc5bERhM2oc480yKe2JIOPgWd2GL6sag3rI6qF6ki3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7c44f5-c3bc-48d4-1503-08de70d369db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 22:57:24.9426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TLxN+p7ubCprq+n1fNivvvIRA5E5OWNF01KucAGSKaCnfT9IS+Xy/ceG5Mg2fNUzS0ptMslwZP9iE67+KjkNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Thursday, February 19, 2026 12:14 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH 1/4] lib/amdgpu: add DMA hardware limits struct and query
> API
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add struct amdgpu_dma_limits to hold per-IP maximum transfer sizes and
> safe defaults, all expressed in BYTES.  Add amdgpu_dma_limits_query() to
> populate the struct by querying SDMA firmware version and using known GFX
> CP_DMA limits.
>
> Hardware limits by IP:
>   SDMA: varies by generation (21-30 bit COUNT field in bytes)
>     v1-2 (SI..VI):   ~2 MB  (0x1fffff)
>     v3   (AI):        ~4 MB  (0x3fffe0)
>     v4.0 (NV10):      ~4 MB  ((1<<22)-1)
>     v4.4+ / v5.2+:   ~1 GB  ((1<<30)-1)
>     v6+  (GC12):     ~1 GB  ((1<<30)-1)
>   GFX/Compute:  CP_DMA DMA_DATA size is 26 bits in bytes (64 MB max)
>
> Inline helpers amdgpu_dma_max_bytes() and amdgpu_dma_default_bytes()
> select the right limit or default for a given IP type.
>
> This is pure additive infrastructure: no behavior changes yet.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: Id407c254f15a6612db8fa986c0fc7c8ebf0f01e6
> ---
>  lib/amdgpu/amd_command_submission.c | 69
> +++++++++++++++++++++++++++++
> lib/amdgpu/amd_command_submission.h |  8 ++++
>  lib/amdgpu/amd_ip_blocks.h          | 49 ++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>
> diff --git a/lib/amdgpu/amd_command_submission.c
> b/lib/amdgpu/amd_command_submission.c
> index 52327c69e..84f4d01d6 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -1439,3 +1439,72 @@ uint32_t
> cmd_get_available_rings(amdgpu_device_handle device,
>               return __builtin_popcountll(hw_ip_info.available_rings);
>       }
>  }
> +
> +/**
> + * get_sdma_max_bytes - query SDMA IP version and return max transfer
> +size
> + *
> + * The SDMA COUNT field width varies by generation:
> + *   v1-2 (SI..VI):  21 bits =3D 0x1fffff bytes   (~2 MB)
> + *   v3   (AI):      22 bits, 32B aligned =3D 0x3fffe0 (~4 MB)
> + *   v4.0 (NV10):    22 bits =3D (1<<22)-1   (~4 MB)
> + *   v4.4+ (NV4x):   30 bits =3D (1<<30)-1   (~1 GB)
> + *   v5.0 (GC11):    22 bits =3D (1<<22)-1   (~4 MB)
> + *   v5.2+ (GC11.5): 30 bits =3D (1<<30)-1   (~1 GB)
> + *   v6+   (GC12):   30 bits =3D (1<<30)-1   (~1 GB)

V3 is VI
V4 is vega
V4.4 is MI
V5.0 is nv1x
V5.2 is nv2x
V6 is nv3x
V7 is nv4x

Also on v4 and newer, the COUNT field is the packet is actually COUNT minus=
 1 so if you set the COUNT to 0, it will copy 1 byte.  If you set the COUNT=
 field to 0x3ffffff it will copy the full 1 GB. So technically the max tran=
sfer size is  actually 1 << 30 not (1 << 30) -1.

Alex

> + */
> +static uint64_t
> +get_sdma_max_bytes(amdgpu_device_handle device) {
> +     struct drm_amdgpu_info_hw_ip ip =3D {0};
> +     int r;
> +
> +     r =3D amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_DMA, 0,
> &ip);
> +     igt_assert_eq(r, 0);
> +
> +     if (ip.hw_ip_version_major <=3D 2)
> +             return 0x1fffffULL;
> +     else if (ip.hw_ip_version_major =3D=3D 3)
> +             return 0x3fffe0ULL;
> +     else if (ip.hw_ip_version_major =3D=3D 4 && ip.hw_ip_version_minor =
=3D=3D 0)
> +             return (1ULL << 22) - 1;
> +     else if (ip.hw_ip_version_major =3D=3D 4 && ip.hw_ip_version_minor =
>=3D 4)
> +             return (1ULL << 30) - 1;
> +     else if (ip.hw_ip_version_major =3D=3D 5 && ip.hw_ip_version_minor =
=3D=3D 0)
> +             return (1ULL << 22) - 1;
> +     else if (ip.hw_ip_version_major =3D=3D 5 && ip.hw_ip_version_minor =
>=3D 2)
> +             return (1ULL << 30) - 1;
> +     else if (ip.hw_ip_version_major >=3D 6)
> +             return (1ULL << 30) - 1;
> +
> +     igt_skip("Unknown SDMA IP version");
> +     return 0;
> +}
> +
> +/**
> + * GFX/Compute use PACKET3_DMA_DATA for fill/copy whose size field is
> + * 26 bits in BYTES (max 64 MB).  PACKET3_WRITE_DATA inline count
> + * is 14 bits in DWORDs (max 16384 DW =3D 64 KB), but that limit is
> + * handled by pm4 buffer sizing, not by this struct.
> + */
> +#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB */
> +
> +void
> +amdgpu_dma_limits_query(amdgpu_device_handle device,
> +                         struct amdgpu_dma_limits *limits) {
> +     memset(limits, 0, sizeof(*limits));
> +
> +     limits->sdma_max_bytes    =3D get_sdma_max_bytes(device);
> +     limits->gfx_max_bytes     =3D GFX_CP_DMA_MAX_BYTES;
> +     limits->compute_max_bytes =3D GFX_CP_DMA_MAX_BYTES;
> +
> +     /*
> +      * Default safe small sizes for quick smoke tests.
> +      * write_linear uses inline data so keep it small (512 bytes =3D 12=
8 DW).
> +      * const_fill and copy_linear have no inline data, can be larger.
> +      */
> +     limits->sdma_default_bytes    =3D 512;    /* 128 DWORDs */
> +     limits->gfx_default_bytes     =3D 1024;   /* 256 DWORDs */
> +     limits->compute_default_bytes =3D 1024;   /* 256 DWORDs */
> +}
> +
> diff --git a/lib/amdgpu/amd_command_submission.h
> b/lib/amdgpu/amd_command_submission.h
> index 7826c2d0f..331889161 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -121,4 +121,12 @@ bool cmd_ring_available(amdgpu_device_handle
> device,  uint32_t cmd_get_available_rings(amdgpu_device_handle device,
>                                   enum amd_ip_block_type ip_type,
>                                  bool user_queue);
> +
> +/**
> + * Query HW and populate DMA transfer limits.
> + * All fields in the returned struct are in BYTES.
> + */
> +void amdgpu_dma_limits_query(amdgpu_device_handle device,
> +                             struct amdgpu_dma_limits *limits);
> +
>  #endif
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 424b3210a..bb10a9a0e 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -208,6 +208,55 @@ struct amdgpu_cs_err_codes {
>       int err_code_wait_for_fence;
>  };
>
> +/**
> + * struct amdgpu_dma_limits - hardware transfer limits per IP block
> + *
> + * All sizes are in BYTES.  Packet builders convert internally
> + * (e.g. /4 for DWORD counts in SDMA inline data or GFX PACKET3).
> + *
> + * Queried once with amdgpu_dma_limits_query(), then passed to helpers.
> + */
> +struct amdgpu_dma_limits {
> +     uint64_t sdma_max_bytes;        /* max SDMA write/fill/copy per
> packet */
> +     uint64_t gfx_max_bytes;         /* max GFX CP_DMA fill/copy per pac=
ket
> */
> +     uint64_t compute_max_bytes;     /* max Compute CP_DMA per packet
> */
> +
> +     /* safe small sizes for quick smoke tests (bytes) */
> +     uint64_t sdma_default_bytes;
> +     uint64_t gfx_default_bytes;
> +     uint64_t compute_default_bytes;
> +};
> +
> +/**
> + * amdgpu_dma_max_bytes - return HW max transfer size for an IP type
> +*/ static inline uint64_t amdgpu_dma_max_bytes(const struct
> +amdgpu_dma_limits *lim,
> +                  unsigned int ip_type)
> +{
> +     switch (ip_type) {
> +     case AMDGPU_HW_IP_DMA:     return lim->sdma_max_bytes;
> +     case AMDGPU_HW_IP_GFX:     return lim->gfx_max_bytes;
> +     case AMDGPU_HW_IP_COMPUTE: return lim->compute_max_bytes;
> +     default:                    return lim->sdma_default_bytes;
> +     }
> +}
> +
> +/**
> + * amdgpu_dma_default_bytes - return safe small test size for an IP
> +type  */ static inline uint64_t amdgpu_dma_default_bytes(const struct
> +amdgpu_dma_limits *lim,
> +                      unsigned int ip_type)
> +{
> +     switch (ip_type) {
> +     case AMDGPU_HW_IP_DMA:     return lim->sdma_default_bytes;
> +     case AMDGPU_HW_IP_GFX:     return lim->gfx_default_bytes;
> +     case AMDGPU_HW_IP_COMPUTE: return lim-
> >compute_default_bytes;
> +     default:                    return lim->sdma_default_bytes;
> +     }
> +}
> +
>  /* aux struct to hold misc parameters for convenience to maintain */  st=
ruct
> amdgpu_ring_context {
>
> --
> 2.52.0

