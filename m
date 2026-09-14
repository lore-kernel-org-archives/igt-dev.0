Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2D0C88E64
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 02:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16DA10E06B;
	Mon, 14 Sep 2026 02:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="paDQA8AV";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010041.outbound.protection.outlook.com
 [52.101.193.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65210E06B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 02:18:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR6UQi5JOqRlDJqHAMEGR6gMERWzhLO1WLUaRxjp5zlWp0EYF5YOrdqXbDfvLRFpNGDRKB+vjyvP5PXIw1JwrhXc2MT77Y3i6fuU51ZpYxxnr4l7fLpSdJR6AxDQgL0k+Y9J6uiC/XasoTJXsrrhqVA3QcNQV7qNqXEcMEvgJ7xMga+3uKls6htKLVTECmnW03pL4E68RFKedqCH5roRn2WdqMSMFC4ilNHGwnwo8ceSzLdAfBADo1VXeOMhw96lA+0IKN/NhWMWyvf92xwRar5YcT+uFfqW5Qww8LlzvN8rLEeJ1TusXwk4KP9P4kvxbsDgzMjArM//QzFqA4rJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8EyE/dwJ+jSovWZsAuSxgIzSABiVtOevGkbq3t2oLQ=;
 b=aUy1NuyEWQwM8n7TKqNeCq4VPftHk06Nk19WGDie1DfhI3q5sZWq53WV+8VkJ9Mo6ok8Icf+s9rXFqbK04o/Q5AolCE/R1+2B2yazwVI0dYwC8dkbBqgSG+/h2NpRx633pfwqpVn5L7fp9/sxhlRq9NFs+Ll+Vxis+NZe/YC/ILaWPn1/Zkit22visHHY+jeFduo4wiwU2798fUiqGeW/IoszMORnSQWRRzhJHGaJUtPoHsVV5O2PmGqt8y4Z6Trzzs9x2U+NXhdx63/zELc7t0lM9znT9PY2S+ZDMliORtac1nuAzSeWGWN8UwKMQAd0nreRBywygdo60hkhDotMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8EyE/dwJ+jSovWZsAuSxgIzSABiVtOevGkbq3t2oLQ=;
 b=paDQA8AVuRsYM66Bc74oQRvXwLZq33U5F+Bx/QxQB9DKoQRkPWl4ZqgS0L3N4JOoMRjdXcuongiELtJ5QJyI3H0fENPnk5Lws603hNvH9lEHbggh3tJ6sf9H73p5dprJD4z4OmzgWDK2F/FlG+33jdUf1RC0BjOPSUPoNN86Y7U=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:18:29 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:18:29 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Shen, Junhua" <Junhua.Shen@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>
Subject: RE: [PATCH i-g-t v2 2/6] lib/amdgpu: drop external BO from cmd_context
Thread-Topic: [PATCH i-g-t v2 2/6] lib/amdgpu: drop external BO from
 cmd_context
Thread-Index: AQHdQEhz8V2URKp0GkedG+rvZm1en7bNWogg
Date: Mon, 14 Sep 2026 02:18:29 +0000
Message-ID: <DM4PR12MB5152ADD2AD16CD7DE47DB60DE3BB2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
 <20260909104602.13807-3-Junhua.Shen@amd.com>
In-Reply-To: <20260909104602.13807-3-Junhua.Shen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-14T02:05:43.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SA3PR12MB9157:EE_
x-ms-office365-filtering-correlation-id: 7bdd728f-1cd1-4ac4-d368-08df12067756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|3023799007|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: Pq/XTP8IIhhLQJ3Hp0gntVNonL0XFse7+MrcFgcO6feg4hg4YBGbHYSzavKCz942IvtbEKdBEuKj12HsAkVVdmZZfkn6SyDChyl1Q0dyY+i4riaO06QqtDJbvqsM3jreRq+4E6eW58yl6Q/cxC0TzSU8t3mD/Cch7zC1LPWkf8wKK4jf7X+/gnoCN3bn5Aw3B98KzrAN3hB170nL1meTp/mVzc5OFi4wJiBcQdr9A+/xKYB8m8P+M/iO21By6QHL20QH0epy2KpM9c1u4CxyT+Hs4sy/xd0DgFFF7JyeerFOdxBI1r7mzSyiyA6Y0UDvL+njKapf+m4PjoSZa2SLAc4TLIBNXLGGORtzLmOGkq10wy6rJNQG6/rbGE2ytU1/4yOY3ixsF/FnYxGd2X08y+9SjMOeYkOvVzSbZ/8xUFq6VguYNHLnaik+Q4yMoku7bMgCoxc+kYVSOoY2/k6YUMkKeVcLjlBgjE3RLZQw78O3347pz2724KD6BMZft6nTqCA3gtnVJla15bV2f80HCWhKUgcu4ezoLT3S5d6Jodi3Y1IG15X0hdpIy2495fHZIHQiYhjVGVNw8zvWZSdqChWYmZTTxO+koKeirs2Wsl7/UH5J1kMEwjkob9Ll1yBV4Pgnc/ilXS2tydZuYr0FMvlAIJQL2zIRunt3BnVH2tjFX94tZpJCbG0/EVgpGhslXerdcHfPNcMo6knARwxccUFdRetAL4ujtW+znJtIh6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QyaoTmNpJhhlPvzVlHWKmZ/UmOig52lU4W4zO9zxvLiO47u5QX2r6ndLJOeW?=
 =?us-ascii?Q?1aSAP6wodqin04O/1zVE9B5QIsyH2NGfg+/jWioJ/Gpol4uFqkzVPhVqfZkZ?=
 =?us-ascii?Q?PHX5P/Z6ix3gHfjHJQBZKTInJu/op69F5Urw8GPB5z7TVx5N4V9cf1hIXmzq?=
 =?us-ascii?Q?fq2n5wN9lPwyOFXLJU9tf/+Squu+twgF4GJWlOmvioV18+Wi0hzk5g7Fvy6R?=
 =?us-ascii?Q?MiUd65C8rcDvtX5i7tX3/OIX9ncZQnKV3mxyECdQgs82U6/O0Y5R2Ha3UlfB?=
 =?us-ascii?Q?rMJhnQ1N0/smrTNLYxHJRwWqOJHq0wZCMnaiDbmlh6M9HBr688xIAYPaiRLd?=
 =?us-ascii?Q?8QuXkyLXrNYS2dPK9jN1ecnIA4BRh7t3IIQ2NwqdcywKVSgyIm17daaiF2q6?=
 =?us-ascii?Q?UtT6pkCGCgFaasQER9gczfvk3ROvZ1Ifb58ya5J2aOaXKdhly071vo0akBp5?=
 =?us-ascii?Q?v/Dg2FMCY8FpRECS+uaOSY+Snb83NTyhCs4KG16C5/e+EhSRkYgFnF2cHm+u?=
 =?us-ascii?Q?rMENvZzyFxG1UmZlYDGaG1RWF91FqPvl1JRmnx24B/iRi80bkAyx6+aRy/40?=
 =?us-ascii?Q?cQBxsxTy2SVOSesH7nhRiF+/ibbC8HxoGsA1doVELzJw65KDIOlwy+r2QeCr?=
 =?us-ascii?Q?L4tfSUqpKibqDoYJZZnpoPNxGDMs1CGTvKr2R4EYFI7Pv/clGVuk/NcPFn0X?=
 =?us-ascii?Q?DdfqDhoJLwK3mlM4M1E8YRWYTp0ojOJ/SFbrARAKveAQfhDdm6rKlWNHa3H+?=
 =?us-ascii?Q?cXufYzel9BEkuaoh2QDZEtsiA/7qZW5OsfzCzs4Bv1MUbIkahxbaq0k/6ezB?=
 =?us-ascii?Q?+fev2w9J0j+VvlcH1RX++iLPCsaeOxpKNssvJG8hQRz9Z9g22oasnXNUn8nC?=
 =?us-ascii?Q?r3ffvxElrfBsWvpG15aZedXzjthPobrKciR5MXijcAqB9xjrePSQ0T/GTYml?=
 =?us-ascii?Q?mjtn9c32nkkvcbkoF7Le0AQmamyWuUooZphg2qdkqDz/4Ni9BXH/EMbrU8b7?=
 =?us-ascii?Q?3SP8P/cZUN7EMyPvMeoc4raTP/vBqXjYxK5im6l2hd2jjkGAxMQc+59+lXqZ?=
 =?us-ascii?Q?mIiZcr4EYdh1Qt1cuRFjuc7l5EqMWLPwsxhpX5uCtgX18GbfSIblYE7CIlZQ?=
 =?us-ascii?Q?5wT6heOG1FMOK4JBmS+0+ZJ22Z36Azd3IknTtMY8DMZ9s7KTV3sUVehfTd2V?=
 =?us-ascii?Q?CTGPdBq9JfQ7ZrMmXdnAUAwZnqpPZJP8NletNVdLnnJe/Sb7a4ZMOw33UguM?=
 =?us-ascii?Q?SUx/LyQn128UA40bXsQZ94p0RBJoZJXpVMfwIBcRYAnPAIpLErMgWZkryDqW?=
 =?us-ascii?Q?7sKx2OOhcfcs2EfF/xMvodHxXvhSBhtSStyRPnvJOi3iZhhNNhkoAQ0Y7/Tl?=
 =?us-ascii?Q?sq+GzQvtBOVA9HPNxWfntN7dkY6YdiA68BHHB4DugxaA7psB3Fh0zL9vDDF8?=
 =?us-ascii?Q?bNEZVo6BCqS7Se10Tb7KNVo8xPm/k65lT5sKoAz+DbgEAuxssNIg0uiw/ooP?=
 =?us-ascii?Q?lXKX7E/xGqA6gik1GOuDEtAwpKjsSgTjcev+gh75yQ3nROxP39pTVXWxgpWG?=
 =?us-ascii?Q?yc4sptBwTA3uSzNiVzANOLN3Oq7ABKSn7dtu5O1gp/OsYt9Y0R8fKwzvbRPH?=
 =?us-ascii?Q?ifqM82pvjpKiyFJ/uBk9FN5cPHzV1kwYRYO6sveGkMqHRquVOnTyoAiNkphe?=
 =?us-ascii?Q?jjho8hLrhtbbwQoAtsSxo/GeFQg5xgzYX4xMzd9jO/djWKFV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdd728f-1cd1-4ac4-d368-08df12067756
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 02:18:29.0686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNAqDfhoNm6V/zBzjs9o6e/VUXuU2eM7XTmdSRKbtUQp7w1OHh069L9h7A+yG+6Xutup1cfu/ncetpWPIGWAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157
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

> -----Original Message-----
> From: Junhua Shen <Junhua.Shen@amd.com>
> Sent: Wednesday, September 9, 2026 6:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Huang,
> Honglei1 <Honglei1.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>; Ma,
> Yiru <Yiru.Ma@amd.com>; Shen, Junhua <Junhua.Shen@amd.com>
> Subject: [PATCH i-g-t v2 2/6] lib/amdgpu: drop external BO from cmd_conte=
xt
>
> Rework cmd_context so it no longer owns or clears a caller-visible data b=
uffer.
> Operand residency is registered explicitly, and the leftover internal-BO =
plumbing is
> removed.
>
> - cmd_context_create()/destroy(): remove the external-BO plumbing; the
>   context no longer allocates or tracks a data BO.
> - Add cmd_context_add_resource(): so callers register BO-backed operand
>   addresses in the per-submit bo_list residency set explicitly.
> - Drop the write_length parameter from cmd_context_create(): the IB/PM4
>   buffer is sized solely from pm4_size.
> - Update all cmd_context_create() call sites to the new signature:
>   tests/amdgpu/amd_dmabuf_unload.c, amd_kfd_dmabuf_unload.c, and
>   amd_mem.c (three sites).
>
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c  | 308 +++++++++++----------------
> lib/amdgpu/amd_command_submission.h  |  99 ++++++++-
>  tests/amdgpu/amd_dmabuf_unload.c     |  15 +-
>  tests/amdgpu/amd_kfd_dmabuf_unload.c |  15 +-
>  tests/amdgpu/amd_mem.c               |  59 ++++-
>  5 files changed, 273 insertions(+), 223 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c
> b/lib/amdgpu/amd_command_submission.c
> index 7210cffb9..d5837e0f1 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -906,31 +906,22 @@
> amdgpu_command_ce_write_fence(amdgpu_device_handle dev,  }
>
>  /**
> - * command context creation with optional external BO
> + * command context creation
>   *
>   * @param device AMDGPU device handle
>   * @param ip_type IP block type (GFX, DMA, etc.)
>   * @param ring_id Ring index to use
>   * @param user_queue Whether to use user queue mode
> - * @param write_length Size of write operations in DWORDs
> - * @param external_bo Optional external buffer object (NULL for internal=
 allocation)
> - * @param external_bo_mc GPU MC address of external BO (required if
> external_bo provided)
> - * @param external_bo_cpu CPU mapping of external BO (required if extern=
al_bo
> provided)
> + * @param write_length Default per-packet transfer size in bytes (overri=
dden per
> + *                     packet by cmd_packet_params_t::size)
>   * @return New command context, or NULL on failure
>   */
>  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                                      enum amd_ip_block_type ip_type,
>                                      uint32_t ring_id,
> -                                    bool user_queue,
> -                                    uint32_t write_length,
> -                                    amdgpu_bo_handle external_bo,
> -                                    uint64_t external_bo_mc,
> -                                    volatile uint32_t *external_bo_cpu)
> +                                    bool user_queue)
>  {
>       cmd_context_t *ctx;
> -     void *cpu_ptr =3D NULL;
> -     uint64_t bo_mc =3D 0;
> -     amdgpu_va_handle va_handle =3D NULL;
>       int r;
>
>       if (!device)
> @@ -949,7 +940,6 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>       ctx->ip_type =3D ip_type;
>       ctx->user_queue =3D user_queue;
>       ctx->last_submit_seq =3D 0;
> -     ctx->uses_external_bo =3D (external_bo !=3D NULL);  // Now this mem=
ber exists
>       ctx->initialized =3D false;
>
>       /* Get IP block for the specified IP type */ @@ -967,7 +957,6 @@
> cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>       }
>
>       /* Setup ring context parameters */
> -     ctx->ring_ctx->write_length =3D write_length ? write_length : 128;
>       ctx->ring_ctx->pm4_size =3D 256;
>       ctx->ring_ctx->pm4 =3D calloc(ctx->ring_ctx->pm4_size, sizeof(uint3=
2_t));
>       if (!ctx->ring_ctx->pm4) {
> @@ -976,7 +965,7 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>               return NULL;
>       }
>
> -     ctx->ring_ctx->res_cnt =3D 1;
> +     ctx->ring_ctx->res_cnt =3D 0;
>       ctx->ring_ctx->ring_id =3D ring_id;
>       ctx->ring_ctx->secure =3D false;
>       ctx->ring_ctx->user_queue =3D user_queue; @@ -990,7 +979,7 @@
> cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                       return NULL;
>               }
>               ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx, (=
unsigned
> int)ip_type);
> -     }else {
> +     } else {
>               /* Create regular command submission context */
>               r =3D amdgpu_cs_ctx_create(device, &ctx->ring_ctx->context_=
handle);
>               if (r) {
> @@ -1001,115 +990,59 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>               }
>       }
>
> -     /* BO allocation strategy: use external BO if provided, otherwise a=
llocate
> internally */
> -     if (external_bo) {
> -             /* Validate external BO arguments */
> -             if (!external_bo_cpu || !external_bo_mc) {
> -                     igt_debug("Invalid external BO arguments (mc=3D0x%l=
lx,
> cpu=3D%p)\n",
> -                                       (unsigned long long)external_bo_m=
c,
> external_bo_cpu);
> -                     free(ctx->ring_ctx->pm4);
> -                     free(ctx->ring_ctx);
> -                     free(ctx);
> -                     return NULL;
> -             }
> -
> -             /* Use caller-provided external BO */
> -             ctx->ring_ctx->bo =3D external_bo;
> -             ctx->ring_ctx->bo_mc =3D external_bo_mc;
> -             ctx->ring_ctx->bo_cpu =3D external_bo_cpu;
> -             ctx->ring_ctx->va_handle =3D NULL;  // VA management is cal=
ler's
> responsibility
> -
> -             igt_info("Using external BO: GPU=3D0x%llx, CPU=3D%p\n",
> -                              (unsigned long long)external_bo_mc,
> external_bo_cpu);
> -     } else {
> -             /* Allocate internal BO for command operations */
> -             r =3D amdgpu_bo_alloc_and_map(device,
> -                                ctx->ring_ctx->write_length,
> -                                4096,
> -                                AMDGPU_GEM_DOMAIN_GTT,
> -                                0,
> -                                &ctx->ring_ctx->bo,
> -                                &cpu_ptr,
> -                                &bo_mc,
> -                                &va_handle);
> -             if (r) {
> -                     goto cleanup_error;
> +     /* Allocate a single per-context IB sized to the PM4 buffer capacit=
y. */
> +     r =3D amdgpu_bo_alloc_and_map(device,
> +                                 ctx->ring_ctx->pm4_size * sizeof(uint32=
_t), 4096,
> +                                 AMDGPU_GEM_DOMAIN_GTT, 0,
> +                                 &ctx->ib_bo, &ctx->ib_cpu, &ctx->ib_mc,
> +                                 &ctx->ib_va);
[Zhang, Jesse(Jie)] The user queue uses `amdgpu_bo_alloc_and_map_sync(..., =
true)` or `_uq()`, correlates with the VM timeline, and waits for the mappi=
ng to complete before the first commit.
Except that , the patches look good for me. Leave Vitaly to take a look.

Thanks
Jesse
> +     if (r) {
> +             if (user_queue) {
> +                     if (ctx->ip_block->funcs->userq_destroy)
> +                             ctx->ip_block->funcs->userq_destroy(device,=
 ctx-
> >ring_ctx,
> +                                                                 (unsign=
ed int)ip_type);
> +             } else {
> +                     amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
>               }
> -
> -             ctx->ring_ctx->bo_mc =3D bo_mc;
> -             ctx->ring_ctx->bo_cpu =3D (volatile uint32_t *)cpu_ptr;
> -             ctx->ring_ctx->va_handle =3D va_handle;
> -
> -             igt_info("Allocated internal BO: GPU=3D0x%llx, CPU=3D%p\n",
> -                      (unsigned long long)bo_mc, cpu_ptr);
> -     }
> -
> -     /* Initialize resources array */
> -     ctx->ring_ctx->resources[0] =3D ctx->ring_ctx->bo;
> -     for (int i =3D 1; i < 4; i++) {
> -             ctx->ring_ctx->resources[i] =3D NULL;
> +             free(ctx->ring_ctx->pm4);
> +             free(ctx->ring_ctx);
> +             free(ctx);
> +             return NULL;
>       }
>
>       ctx->initialized =3D true;
>       return ctx;
> -
> -cleanup_error:
> -     /* Cleanup resources in case of allocation failure */
> -     if (user_queue) {
> -             ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx, =
(unsigned
> int)ip_type);
> -     } else {
> -             if (ctx->ring_ctx->context_handle)
> -                 amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> -     }
> -
> -     free(ctx->ring_ctx->pm4);
> -     free(ctx->ring_ctx);
> -     free(ctx);
> -     return NULL;
>  }
>
>  /**
> - * context destruction function with external BO control
> + * context destruction function
>   *
>   * @param ctx Command context to destroy
> - * @param destroy_external_bo Whether to destroy external BO (if used)
>   */
> -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
> +void cmd_context_destroy(cmd_context_t *ctx)
>  {
>       if (!ctx || !ctx->initialized)
>               return;
>
> -     if (ctx->ring_ctx) {
> -             /* Handle BO cleanup based on allocation type */
> -             if (ctx->ring_ctx->bo) {
> -                     if (!ctx->uses_external_bo || destroy_external_bo) =
{
> -                             /* Clean up internal BO or external BO if e=
xplicitly
> requested */
> -                             if (ctx->ring_ctx->va_handle) {
> -                                 /* Internal BO with VA handle - full cl=
eanup */
> -                                 amdgpu_bo_unmap_and_free(ctx->ring_ctx-=
>bo,
> ctx->ring_ctx->va_handle,
> -                                                        ctx->ring_ctx->b=
o_mc,
> -                                                        ctx->ring_ctx->w=
rite_length);
> -                             } else if (destroy_external_bo) {
> -                                 /* External BO without VA handle - just=
 free the BO
> */
> -                                 amdgpu_bo_free(ctx->ring_ctx->bo);
> -                             }
> -                     } else {
> -                             /* External BO, preserve it as requested by=
 caller */
> -                             igt_info("Preserving external BO (GPU=3D0x%=
llx)\n",
> -                                              (unsigned long long)ctx->r=
ing_ctx-
> >bo_mc);
> -                     }
> -             }
> +     /* Free the per-context IB. */
> +     if (ctx->ib_bo) {
> +             cmd_wait_completion(ctx);
> +             amdgpu_bo_unmap_and_free(ctx->ib_bo, ctx->ib_va, ctx->ib_mc=
,
> +                                      ctx->ring_ctx->pm4_size * sizeof(u=
int32_t));
> +             ctx->ib_bo =3D NULL;
> +     }
>
> +     if (ctx->ring_ctx) {
>               /* Clean up command submission context */
>               if (ctx->user_queue) {
>                       if (ctx->ip_block && ctx->ip_block->funcs->userq_de=
stroy) {
>                               ctx->ip_block->funcs->userq_destroy(ctx->de=
vice, ctx-
> >ring_ctx,
>                                                         (unsigned int)ctx=
->ip_type);
> -                 }
> +                     }
>               } else {
>                       if (ctx->ring_ctx->context_handle) {
>                               amdgpu_cs_ctx_free(ctx->ring_ctx->context_h=
andle);
> -                 }
> +                     }
>               }
>
>               /* Free PM4 command buffer */
> @@ -1123,6 +1056,42 @@ void cmd_context_destroy(cmd_context_t *ctx, bool
> destroy_external_bo)
>       free(ctx);
>  }
>
> +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo) {
> +     struct amdgpu_ring_context *rc;
> +     int i;
> +
> +     if (!ctx || !ctx->initialized || !ctx->ring_ctx || !bo)
> +             return -EINVAL;
> +
> +     rc =3D ctx->ring_ctx;
> +
> +     /* Deduplicate: an already-registered BO needs no second slot. */
> +     for (i =3D 0; i < rc->res_cnt; i++) {
> +             if (rc->resources[i] =3D=3D bo)
> +                     return 0;
> +     }
> +
> +     if (rc->res_cnt >=3D (int)ARRAY_SIZE(rc->resources))
> +             return -ENOSPC;
> +
> +     rc->resources[rc->res_cnt++] =3D bo;
> +     return 0;
> +}
> +
> +static void cmd_clear_packet_inputs(cmd_context_t *ctx) {
> +     struct amdgpu_ring_context *rc =3D ctx->ring_ctx;
> +
> +     rc->bo_mc =3D 0;
> +     rc->bo_mc2 =3D 0;
> +     rc->write_length =3D 0;
> +
> +     /* Drop the per-submit residency set. */
> +     memset(rc->resources, 0, sizeof(rc->resources));
> +     rc->res_cnt =3D 0;
> +}
> +
>  /**
>   * Submit command packet without waiting - Fixed submission logic
>   */
> @@ -1132,10 +1101,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       int r;
>       struct amdgpu_cs_request ibs_request;
>       struct amdgpu_cs_ib_info ib_info;
> -     amdgpu_bo_handle ib_bo;
> -     void *ib_cpu;
> -     uint64_t ib_mc_address;
> -     amdgpu_va_handle ib_va_handle;
>       amdgpu_bo_handle all_res[5] =3D {0};
>       uint32_t res_count =3D 0;
>       uint32_t i;
> @@ -1145,12 +1110,28 @@ int cmd_submit_packet(cmd_context_t *ctx)
>               return -EINVAL;
>       }
>
> -     /* Check required parameters */
> -     if (ctx->ring_ctx->pm4_dw =3D=3D 0 || ctx->ring_ctx->pm4_dw > 1024)=
 {
> -             igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->r=
ing_ctx-
> >pm4_dw);
> +     /* Check required parameters: the PM4 stream must be non-empty and =
fit
> +      * in the per-context IB allocated by cmd_context_create().
> +      */
> +     if (ctx->ring_ctx->pm4_dw =3D=3D 0 || ctx->ring_ctx->pm4_dw > ctx->=
ring_ctx-
> >pm4_size) {
> +             igt_debug("Invalid PM4 size: %u (must be 1-%u)\n",
> +                       ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
>               return -EINVAL;
>       }
>
> +     igt_assert_f(ctx->ib_bo && ctx->ring_ctx->pm4_dw <=3D ctx->ring_ctx=
-
> >pm4_size,
> +                  "PM4 stream (%u dw) exceeds IB capacity (%u dw)\n",
> +                  ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
> +
> +     r =3D cmd_wait_completion(ctx);
> +     if (r) {
> +             igt_debug("Wait for previous submission failed: %d\n", r);
> +             return r;
> +     }
> +
> +     memcpy(ctx->ib_cpu, ctx->ring_ctx->pm4,
> +            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
>       /* For user queues, use userq_submit */
>       if (ctx->user_queue) {
>               if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) =
{ @@ -
> 1158,16 +1139,14 @@ int cmd_submit_packet(cmd_context_t *ctx)
>                       return -ENOTSUP;
>               }
>
> -             if (!ctx->ring_ctx->bo_mc) {
> -             igt_debug("Invalid BO MC address for user queue\n");
> -             return -EINVAL;
> -             }
> -
>               ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_c=
tx,
>                     (unsigned int)ctx->ip_type,
> -                   ctx->ring_ctx->bo_mc);
> +                   ctx->ib_mc);
>               ctx->last_submit_seq =3D ctx->ring_ctx->point;
> +             ctx->submit_pending =3D true;
>               igt_info("User queue submission successful, point=3D%lu\n",=
 ctx-
> >last_submit_seq);
> +
> +             cmd_clear_packet_inputs(ctx);
>               return 0;
>       }
>
> @@ -1175,26 +1154,8 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       memset(&ibs_request, 0, sizeof(ibs_request));
>       memset(&ib_info, 0, sizeof(ib_info));
>
> -     /* Allocate separate IB buffer instead of reusing command buffer */
> -     r =3D amdgpu_bo_alloc_and_map(ctx->device,
> -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
> -                            4096,
> -                            AMDGPU_GEM_DOMAIN_GTT,
> -                            0,
> -                            &ib_bo,
> -                            &ib_cpu,
> -                            &ib_mc_address,
> -                            &ib_va_handle);
> -     if (r) {
> -             igt_debug("Failed to allocate IB: %d\n", r);
> -             return r;
> -     }
> -
> -     /* Copy PM4 commands to IB */
> -     memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw *
> sizeof(uint32_t));
> -
> -     /* Setup IB information */
> -     ib_info.ib_mc_address =3D ib_mc_address;
> +     /* Point the IB info at the per-context IB */
> +     ib_info.ib_mc_address =3D ctx->ib_mc;
>       ib_info.size =3D ctx->ring_ctx->pm4_dw;
>       if (ctx->ring_ctx->secure)
>               ib_info.flags |=3D AMDGPU_IB_FLAGS_SECURE; @@ -1215,14
> +1176,12 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       }
>
>       /* Add IB as the last resource */
> -     all_res[res_count++] =3D ib_bo;
> +     all_res[res_count++] =3D ctx->ib_bo;
>
>       /* Create BO list */
>       r =3D amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, =
&bo_list);
>       if (r) {
>               igt_debug("amdgpu_bo_list_create failed: %d\n", r);
> -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address=
,
> -                                    ctx->ring_ctx->pm4_dw * sizeof(uint3=
2_t));
>               return r;
>       }
>
> @@ -1234,8 +1193,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       if (r !=3D 0) {
>               igt_debug("amdgpu_cs_submit failed: %d\n", r);
>               amdgpu_bo_list_destroy(bo_list);
> -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address=
,
> -                                    ctx->ring_ctx->pm4_dw * sizeof(uint3=
2_t));
>               return r;
>       }
>
> @@ -1243,10 +1200,11 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       ctx->last_submit_seq =3D ibs_request.seq_no;
>       igt_debug("Command submitted successfully, seq_no=3D%lu\n", ctx-
> >last_submit_seq);
>
> -     /* Cleanup resources */
> +     /* The kernel has snapshotted the bo_list; it can be released now. =
*/
>       amdgpu_bo_list_destroy(bo_list);
> -     amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> -                        ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +     ctx->submit_pending =3D true;
> +     cmd_clear_packet_inputs(ctx);
>
>       return 0;
>  }
> @@ -1258,14 +1216,9 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>       if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
>               return -EINVAL;
>
> -     if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
> +     if (!ctx->ring_ctx)
>               return -EINVAL;
>
> -     /* Clear the buffer before operation */
> -     memset((void *)ctx->ring_ctx->bo_cpu, 0,
> -     ctx->ring_ctx->write_length);
> -
> -
>       /* Build the command packet based on type */
>       switch (params->type) {
>       case CMD_PACKET_WRITE_LINEAR:
> @@ -1280,13 +1233,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>               result =3D ctx->ip_block->funcs->write_linear(ctx->ip_block=
->funcs,
>                                                      ctx->ring_ctx,
>                                                      &ctx->ring_ctx->pm4_=
dw);
> -
> -             /*  Copy PM4 packet to ring buffer */
> -             if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -                     memcpy((void *)ctx->ring_ctx->bo_cpu,
> -                            ctx->ring_ctx->pm4,
> -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -             }
>               return result;
>
>       case CMD_PACKET_WRITE_ATOMIC:
> @@ -1300,13 +1246,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>               result =3D ctx->ip_block->funcs->write_linear_atomic(ctx->i=
p_block-
> >funcs,
>                                                     ctx->ring_ctx,
>                                                     &ctx->ring_ctx->pm4_d=
w);
> -
> -             /*  Copy PM4 packet to ring buffer */
> -             if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> -             ctx->ring_ctx->pm4,
> -             ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -             }
>               return result;
>
>       case CMD_PACKET_COPY_LINEAR:
> @@ -1321,16 +1260,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>           result =3D ctx->ip_block->funcs->copy_linear(ctx->ip_block->fun=
cs,
>                                                     ctx->ring_ctx,
>                                                     &ctx->ring_ctx->pm4_d=
w);
> -
> -         /* Copy PM4 packet to ring buffer */
> -         if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> -                    ctx->ring_ctx->pm4,
> -                    ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -
> -             //igt_info("cmd_place_packet: Copied %u DWORDs to ring buff=
er
> (copy)\n",
> -               //       ctx->ring_ctx->pm4_dw);
> -         }
>           return result;
>
>       case CMD_PACKET_COPY_ATOMIC:
> @@ -1419,30 +1348,39 @@ int cmd_wait_completion(cmd_context_t *ctx)  {
>       struct amdgpu_cs_fence fence_status =3D {0};
>       uint32_t expired;
> +     int r;
>
>       if (!ctx || !ctx->initialized)
>               return -EINVAL;
>
> +     if (!ctx->submit_pending)
> +             return 0;
> +
>       /* For user queues, wait on timeline syncobj */
>       if (ctx->user_queue) {
>               if (!ctx->ring_ctx->timeline_syncobj_handle)
>                       return -EINVAL;
>
> -             return amdgpu_timeline_syncobj_wait(ctx->device,
> -                                                ctx->ring_ctx-
> >timeline_syncobj_handle,
> -                                                ctx->ring_ctx->point);
> +             r =3D amdgpu_timeline_syncobj_wait(ctx->device,
> +                                              ctx->ring_ctx-
> >timeline_syncobj_handle,
> +                                              ctx->ring_ctx->point);
> +     } else {
> +             /* For regular queues, wait on fence */
> +             fence_status.ip_type =3D (unsigned int)ctx->ip_type;
> +             fence_status.ip_instance =3D 0;
> +             fence_status.ring =3D ctx->ring_ctx->ring_id;
> +             fence_status.context =3D ctx->ring_ctx->context_handle;
> +             fence_status.fence =3D ctx->last_submit_seq;
> +
> +             r =3D amdgpu_cs_query_fence_status(&fence_status,
> +                                              AMDGPU_TIMEOUT_INFINITE,
> +                                              0, &expired);
>       }
>
> -     /* For regular queues, wait on fence */
> -     fence_status.ip_type =3D (unsigned int)ctx->ip_type;
> -     fence_status.ip_instance =3D 0;
> -     fence_status.ring =3D ctx->ring_ctx->ring_id;
> -     fence_status.context =3D ctx->ring_ctx->context_handle;
> -     fence_status.fence =3D ctx->last_submit_seq;
> +     if (r =3D=3D 0)
> +             ctx->submit_pending =3D false;
>
> -     return amdgpu_cs_query_fence_status(&fence_status,
> -                                    AMDGPU_TIMEOUT_INFINITE,
> -                                    0, &expired);
> +     return r;
>  }
>
>  /**
> diff --git a/lib/amdgpu/amd_command_submission.h
> b/lib/amdgpu/amd_command_submission.h
> index 331889161..8644f25ed 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -50,8 +50,16 @@ typedef struct {
>      enum amd_ip_block_type ip_type;
>      bool initialized;
>      bool user_queue;
> -    bool uses_external_bo;
>      uint64_t last_submit_seq; /* Last submission sequence number */
> +
> +    /* IB shared by the user-queue and CS paths; created in cmd_context_=
create,
> +     * freed in cmd_context_destroy, reusable across multiple submits.
> +     */
> +    amdgpu_bo_handle ib_bo;
> +    void *ib_cpu;
> +    uint64_t ib_mc;
> +    amdgpu_va_handle ib_va;
> +    bool submit_pending;   /* a submit is in flight; wait before reuse/f=
ree */
>  } cmd_context_t;
>
>  /**
> @@ -89,15 +97,92 @@ void
> amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
> void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>                                         amdgpu_context_handle ctx);
>
> +/*
> + * cmd_* command-submission API
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> + *
> + * A small wrapper around raw amdgpu command submission that hides the
> + * context / IB / bo_list / fence plumbing and lets a test issue
> +DMA-style
> + * operations (write, copy, const-fill, atomic) on an IP ring (SDMA,
> +GFX or
> + * Compute) by GPU virtual address.
> + *
> + * Lifecycle
> + * ---------
> + *   1. cmd_context_create()  - create a context bound to one IP ring. I=
t
> + *      allocates a reusable IB/PM4 buffer for the emitted packets.
> + *   2. issue one or more operations (see the two API layers below).
> + *   3. cmd_context_destroy()  - waits for any in-flight submission, the=
n frees
> + *      the IB and the context.
> + *
> + * Two API layers
> + * --------------
> + *   High-level convenience helpers build one packet and submit it in a =
single
> + *   call:
> + *       cmd_submit_write_linear(ctx, dst_va, size, data)
> + *       cmd_submit_copy_linear (ctx, src_va, dst_va, size)
> + *       cmd_submit_const_fill  (ctx, dst_va, size, data)
> + *       cmd_submit_atomic      (ctx, dst_va, data)
> + *
> + *   Low-level path, for full control over cmd_packet_params_t (custom_d=
ata,
> + *   fence/timestamp packets, etc.):
> + *       cmd_place_packet(ctx, &params)          - build the PM4 stream
> + *       cmd_submit_packet(ctx)                  - submit it
> + *       cmd_place_and_submit_packet(ctx, &p)    - both of the above
> + *
> + * Semantics
> + * ---------
> + *   - Submission is asynchronous: cmd_submit_* returns after the CS is =
queued.
> + *     The next submit on the same ctx, or cmd_context_destroy(), transp=
arently
> + *     waits for the previous one. Call cmd_wait_completion(ctx) to bloc=
k
> + *     explicitly (e.g. before reading back the destination).
> + *   - Operands are plain GPU virtual addresses, not BOs. For every BO-b=
acked
> + *     address you pass (source, destination, fence/timestamp target, ..=
.) call
> + *     cmd_context_add_resource(ctx, bo) to add the owning BO to the res=
idency
> + *     set. The residency set is per-submit: it is cleared automatically=
 once
> + *     the packet has been captured for submission, so you must (re-)reg=
ister
> + *     every required BO immediately before each submit.
> + *   - One call emits exactly one hardware packet and does NOT chunk. A =
transfer
> + *     larger than the per-packet maximum (see amdgpu_dma_limits_query) =
will be
> + *     rejected; the caller must split it. Return values are 0 on succes=
s or a
> + *     negative errno (e.g. -ENOTSUP if the IP lacks the requested op).
> + *
> + * Example: fill then copy 4 KiB over the SDMA ring
> + * ------------------------------------------------
> + *   cmd_context_t *ctx;
> + *   int r;
> + *
> + *   ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false);
> + *   if (!ctx)
> + *           return -ENODEV;
> + *
> + *   // Residency is per-submit, so register before every submit.
> + *   cmd_context_add_resource(ctx, dst_bo);  // owns dst_va
> + *   r =3D cmd_submit_const_fill(ctx, dst_va, 4096, 0xdeadbeef);
> + *   if (!r) {
> + *           cmd_context_add_resource(ctx, dst_bo);    // owns dst_va
> + *           cmd_context_add_resource(ctx, dst2_bo);   // owns dst2_va
> + *           r =3D cmd_submit_copy_linear(ctx, dst_va, dst2_va, 4096);
> + *   }
> + *
> + *   cmd_wait_completion(ctx);   // ensure the copy has landed
> + *   cmd_context_destroy(ctx);   // (would also wait) release resources
> + *   return r;
> + */
>  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                                      enum amd_ip_block_type ip_type,
>                                      uint32_t ring_id,
> -                                    bool user_queue,
> -                                    uint32_t write_length,
> -                                    amdgpu_bo_handle external_bo,
> -                                    uint64_t external_bo_mc,
> -                                    volatile uint32_t *external_bo_cpu);
> -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
> +                                    bool user_queue); void
> +cmd_context_destroy(cmd_context_t *ctx);
> +
> +/*
> + * Register a buffer object in the context's bo_list residency set so
> +it is
> + * resident when the next submission executes. See the cmd_* API
> +overview above
> + * cmd_context_create() for how this fits into the submission flow.
> + *
> + * Returns 0 on success, -EINVAL on bad arguments,
> + * or -ENOSPC when the residency set (resources[]) is full.
> + */
> +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo);
>
>  int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *para=
ms);
>
> diff --git a/tests/amdgpu/amd_dmabuf_unload.c
> b/tests/amdgpu/amd_dmabuf_unload.c
> index 05ca3cf2c..0e43de0e6 100644
> --- a/tests/amdgpu/amd_dmabuf_unload.c
> +++ b/tests/amdgpu/amd_dmabuf_unload.c
> @@ -121,9 +121,7 @@ static void test_fence_outlives_module(int vgem, int
> amd_fd,
>       igt_assert_eq(r, 0);
>
>       /* Create SDMA command context */
> -     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false,
> -                                  copy_size, src_bo, src_mc,
> -                                  (volatile uint32_t *)src_cpu);
> +     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false);
>       igt_assert(cmd_ctx !=3D NULL);
>
>       /*
> @@ -138,17 +136,14 @@ static void test_fence_outlives_module(int vgem, in=
t
> amd_fd,
>                            AMDGPU_VA_OP_MAP);
>       igt_assert_eq(r, 0);
>
> -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> -     cmd_ctx->ring_ctx->bo2 =3D dst_bo;
> -     cmd_ctx->ring_ctx->bo_mc2 =3D dst_mc;
> -     cmd_ctx->ring_ctx->resources[1] =3D dst_bo;
> -     cmd_ctx->ring_ctx->resources[2] =3D import.buf_handle;
> -     cmd_ctx->ring_ctx->res_cnt =3D 3;
> -
>       igt_info("Submitting %d x %llu-byte SDMA copies (no wait)...\n",
>                NUM_SDMA_COPIES, (unsigned long long)copy_size);
>
>       for (i =3D 0; i < NUM_SDMA_COPIES; i++) {
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> import.buf_handle),
> +0);
> +
>               r =3D cmd_submit_copy_linear(cmd_ctx,
>                                          src_mc, dst_mc,
>                                          (uint32_t)copy_size);
> diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> index 24260b560..28caf8982 100644
> --- a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> +++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> @@ -309,23 +309,18 @@ static void test_kfd_fence_outlives_module(int vgem=
, int
> amd_fd,
>       igt_assert_eq(r, 0);
>
>       /* Create SDMA command context */
> -     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false,
> -                                  copy_size, src_bo, src_mc,
> -                                  (volatile uint32_t *)src_cpu);
> +     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false);
>       igt_assert(cmd_ctx !=3D NULL);
>
> -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> -     cmd_ctx->ring_ctx->bo2 =3D dst_bo;
> -     cmd_ctx->ring_ctx->bo_mc2 =3D dst_mc;
> -     cmd_ctx->ring_ctx->resources[1] =3D dst_bo;
> -     cmd_ctx->ring_ctx->resources[2] =3D import.buf_handle;
> -     cmd_ctx->ring_ctx->res_cnt =3D 3;
> -
>       igt_info("Submitting %d SDMA copies "
>                "(KFD amdgpu fences on dma_resv, no wait)...",
>                NUM_SDMA_COPIES);
>
>       for (i =3D 0; i < NUM_SDMA_COPIES; i++) {
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> import.buf_handle),
> +0);
> +
>               r =3D cmd_submit_copy_linear(cmd_ctx,
>                                          src_mc, dst_mc,
>                                          (uint32_t)copy_size);
> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c index
> 7c6855d3f..295a3ab94 100644
> --- a/tests/amdgpu/amd_mem.c
> +++ b/tests/amdgpu/amd_mem.c
> @@ -850,8 +850,9 @@ static void
> test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
>
>       /* 5. Issue SDMA write to buffer[0] while shader is polling */
>       if (cmd_ring_available(device, AMD_IP_DMA, 0, false))
> -             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
, 64,
> NULL, 0, NULL);
> +             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
);
>       igt_assert(dma_ctx);
> +     igt_assert_eq(cmd_context_add_resource(dma_ctx, bo_vram), 0);
>       r =3D cmd_submit_write_linear(dma_ctx, vram_mc, sizeof(uint32_t), k=
Pattern);
>       igt_assert_eq(r, 0);
>       r =3D cmd_wait_completion(dma_ctx);
> @@ -875,7 +876,7 @@ static void
> test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
>       igt_info("cache-invalidate-sdma-write: PASSED (dst[100]=3D0x%x)\n",
> buf[dwLocation]);
>
>       /* Cleanup */
> -     cmd_context_destroy(dma_ctx, false);
> +     cmd_context_destroy(dma_ctx);
>       amdgpu_bo_list_destroy(bo_list);
>       amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
>       amdgpu_cs_ctx_free(compute_ctx);
> @@ -1905,6 +1906,11 @@ typedef struct {
>
>      /* Single DMA command context for ring 0 */
>      cmd_context_t *dma_ctx;
> +
> +    /* Scratch BO used as the destination of interleaved DMA writes */
> +    amdgpu_bo_handle dma_scratch_bo;
> +    uint64_t dma_scratch_mc;
> +    amdgpu_va_handle dma_scratch_va;
>  } mm_bench_context_t;
>
>  /**
> @@ -1912,6 +1918,9 @@ typedef struct {
>   */
>  static int init_dma_context(mm_bench_context_t *ctx, amdgpu_device_handl=
e
> device)  {
> +     void *scratch_cpu;
> +     int r;
> +
>       /* Check if DMA ring 0 is available */
>       if (!cmd_ring_available(device, AMD_IP_DMA, 0, false)) {
>               igt_debug("DMA ring 0 is not available\n"); @@ -1919,12 +19=
28,23
> @@ static int init_dma_context(mm_bench_context_t *ctx, amdgpu_device_han=
dle
> device
>       }
>
>       /* Create DMA context for ring 0 */
> -     ctx->dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false, 1=
28,
> NULL, 0, NULL);
> +     ctx->dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false);
>       if (!ctx->dma_ctx) {
>               igt_debug("Failed to create DMA context for ring 0\n");
>               return -ENODEV;
>       }
>
> +     r =3D amdgpu_bo_alloc_and_map(device, 4096, 4096,
> +                                 AMDGPU_GEM_DOMAIN_GTT, 0,
> +                                 &ctx->dma_scratch_bo, &scratch_cpu,
> +                                 &ctx->dma_scratch_mc, &ctx->dma_scratch=
_va);
> +     if (r) {
> +             igt_debug("Failed to allocate DMA scratch BO: %d\n", r);
> +             cmd_context_destroy(ctx->dma_ctx);
> +             ctx->dma_ctx =3D NULL;
> +             return r;
> +     }
> +
>       igt_debug("Initialized DMA ring 0 successfully\n");
>       return 0;
>  }
> @@ -1935,9 +1955,15 @@ static int init_dma_context(mm_bench_context_t *ct=
x,
> amdgpu_device_handle device  static void
> cleanup_dma_context(mm_bench_context_t *ctx)  {
>       if (ctx->dma_ctx) {
> -             cmd_context_destroy(ctx->dma_ctx, false);
> +             cmd_context_destroy(ctx->dma_ctx);
>               ctx->dma_ctx =3D NULL;
>       }
> +
> +     if (ctx->dma_scratch_bo) {
> +             amdgpu_bo_unmap_and_free(ctx->dma_scratch_bo, ctx-
> >dma_scratch_va,
> +                                      ctx->dma_scratch_mc, 4096);
> +             ctx->dma_scratch_bo =3D NULL;
> +     }
>  }
>
>  /**
> @@ -1957,9 +1983,18 @@ static int
> submit_dma_write_operation(mm_bench_context_t *ctx)
>               return -EINVAL;
>       }
>
> +     /* Register the destination BO in the per-submit residency set, the=
n
> +      * write into the scratch buffer it backs.
> +      */
> +     r =3D cmd_context_add_resource(ctx->dma_ctx, ctx->dma_scratch_bo);
> +     if (r) {
> +             igt_debug("cmd_context_add_resource failed: %d\n", r);
> +             return r;
> +     }
> +
>       /* Use the convenience function for write linear operation */
>       r =3D cmd_submit_write_linear(ctx->dma_ctx,
> -                             ctx->dma_ctx->ring_ctx->bo_mc,
> +                             ctx->dma_scratch_mc,
>                              64, 0x12345678);
>
>       if (r) {
> @@ -3164,10 +3199,11 @@ static void
> test_signal_handling(amdgpu_device_handle device)
>               /* Parent process - perform memory operations with signal h=
andling */
>               igt_info("Parent process starting memory mapping operations=
...\n");
>
> -             /* FIX: Use cmd_context_create_ex with the same BO for both
> internal buffer and target */
> -             /* This ensures SDMA writes to the correct memory address *=
/
> -             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
, 128,
> -                                  sys_bo, sys_mc_address, (volatile uint=
32_t
> *)sys_cpu_ptr);
> +             /*
> +              * Create a DMA context; sys_bo is registered in its reside=
ncy set
> +              * immediately before the submit below (residency is per-su=
bmit).
> +              */
> +             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
);
>               igt_assert_f(dma_ctx, "Failed to create DMA command submiss=
ion
> context");
>
>               /* Wait for child process to complete with proper signal ha=
ndling */
> @@ -3215,6 +3251,7 @@ static void test_signal_handling(amdgpu_device_hand=
le
> device)
>               igt_info("Writing 0xdeadbeaf to address 0x%" PRIx64 "\n",
> sys_mc_address);
>
>               /* Now SDMA should write to the correct address since we're=
 using
> the same BO */
> +             igt_assert_eq(cmd_context_add_resource(dma_ctx, sys_bo), 0)=
;
>               r =3D cmd_submit_write_linear(dma_ctx, sys_mc_address,
> sizeof(uint32_t), 0xdeadbeaf);
>               igt_info("cmd_submit_write_linear returned: %d\n", r);
>               igt_assert_eq(r, 0);
> @@ -3244,8 +3281,8 @@ static void test_signal_handling(amdgpu_device_hand=
le
> device)
>
>               igt_info("Memory successfully updated to: 0x%08x\n", sys_me=
m[0]);
>
> -             /* Cleanup command context - don't destroy the external BO =
*/
> -             cmd_context_destroy(dma_ctx, false);
> +             /* Cleanup command context; sys_bo is owned by the caller. =
*/
> +             cmd_context_destroy(dma_ctx);
>               dma_ctx =3D NULL;
>       }
>
> --
> 2.34.1

