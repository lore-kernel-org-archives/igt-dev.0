Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9AC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE5510E112;
	Tue, 25 Aug 2026 04:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U2wxtK+q";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010006.outbound.protection.outlook.com
 [52.101.193.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FC710E122
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 04:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSGVfOCnLfp1ONKSvq30EB67hhcGuWbuwhPEeW+Bisc1+r9hDL2HIzvnh35629UuamSx2aME1MvEGy8TXzqUCzgMC10TEnp21EgJnzuh57ixCNwS4/O5enkDiX6rYLkaKTrstpf9nadLDiaMqhZcz2pruifga4TL7fSortSxckZNIH2FvgFBz2cFd3l7+TzgykI0BkE3npPLN4SRVnqpwqSDPi6ggOcbzzQXKvOLZi1w//PRnzMDz0bDeyzdUIw3qrLPUr7RXttdrsqrcrUHMSV97sdsXsE/cVErk1F7pHHkvAnCuPc6jxBDLYXsfx3JR1bzY5XJhQ0/ruQVmKqpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cX05Z1ZzxuVmggvS6bkYesWITvFcpSZsdxwi0qr5pE=;
 b=iwezhuhD4dpWMiLtfznRayVzvSDKZU3zWQDPVdym+aoysWHHNVhrLINWw+FZZB45TEF2ijjFcPv53d4WjmESS4oNUYp6gE4cw9EnkvJEF4U0yCKpN6QyScheavbPkGdtgThWrKXqbGkMU04EO5/wN3guDy7PCh2Nel9dNlsYxwzt2QR7IRb1jtxi9nCOyaxC8N7/lD4Bbj2A2EUOBWZLmM1Z2wAd7COqHqTFVL/bAbUckR9O42F5N8TJqz2sWtLAExa91Y8kvCsdNrFz5UUawb5Y59etbY9nHSOa/qFGz4lQFm90kKDz28h3k7cywys4raPLWJjYyL2oUpx+PUDsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cX05Z1ZzxuVmggvS6bkYesWITvFcpSZsdxwi0qr5pE=;
 b=U2wxtK+qSsCU5cfttnxtYJ88MOYPsSIpXgHRiO2MA+PYTx5ssFCbC5foUlQfnVnF0hhrCBnuAFAyXgUiYbaruHGfi4rXJVRDbRFj2XAf7HEgjBCATp7q3bwLoBf4OO8D4hfnFwMk57xgnS0YDro/TO7IIT6pOdFcCL9KKTrA+5s=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:18:21 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:18:21 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Shen, Junhua" <Junhua.Shen@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/amdgpu: add generic compute dispatch and
 copy_dword helpers
Thread-Topic: [PATCH i-g-t v1 1/2] lib/amdgpu: add generic compute dispatch
 and copy_dword helpers
Thread-Index: AQHdMXiPEaUj3QqWXEW1McbG3byPv7auLYtg
Date: Tue, 25 Aug 2026 04:18:21 +0000
Message-ID: <DM4PR12MB51527A7C2CB157E5F6C5B93EE3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260821142242.34700-1-Junhua.Shen@amd.com>
 <20260821142242.34700-2-Junhua.Shen@amd.com>
In-Reply-To: <20260821142242.34700-2-Junhua.Shen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-25T04:14:37.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SN7PR12MB7250:EE_
x-ms-office365-filtering-correlation-id: dcf1bd99-6ced-4e2a-f142-08df025fe63c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|4143699003|11063799006|56012099006|5023799004|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: FcwSMLPdRAlzNJXWNuzh3C3QnActWdU0R6GhkMUNt1w7bxO305uwiYJOwaOjTSpYe3sbQlFgfwIjPanas4I8SL3vQgI49SKjdWPvTBWNTFDkyC+376RqVY20ETBAvWlfG6JdniUmGN8inWNyKxTAksD4TQdamNHjNxRFoa0q8ALcYGqNkt0e2/xMWLqTc/zCNmW4GkMwMNz3TdTZnnSZAubQV6hIZ9p9ago+Ycj54yuKQRMq5rRSGbSYyPepRI1OuySwt4DQbRCljDAV5v/ZcjbT60Xvo6Hv6gWc+WnSMYVrdp4chWEsXtS5h24FxDZi39IcxDv1kdmjQ+4U+NYRTPnx790RtlDKJEQUjWiR7o3snItfqqcU1XqZybAGZTP8oa/7cotUvVAtz82C7y6RoW60c7KV0GuspIixwaWS2wAzDaGbwLTqKXen/hc7us2g4hGFGssGhpbD2qEdlWXdY8xOtTNajF28tr5z4Rns5R/SSUsH7yYumhkSBJgUtjAxPwWkoYZBzoHMs8aR1yc5vKNxEaFBBYGOIFWyzd7Fk0QcIVbYp5JqZxhbVWINm7BUy4ZgBlzqgqDb8QqJu6OUUrgKUhjHsmOSPI1kDmStbhUoke2t66AqZ3pVl8+RdIDlO9p4u0eRRccKrhXydb4htWly+I7lMnpXeH8F9BzveqNdmmz+tI+sMoOOa5DmlSZ8viUUleupNFmC7SND0KS7esgyvaMTiVtLAxUjgtErAKw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uEgUuWsytL+eelsXtHLz+aa+4hdkyM80foYGZfT4GZ/7GqrlLurivQ6JpIaQ?=
 =?us-ascii?Q?vW/LrpuXItBu6f2wwR6fY4AQ43XUBjPj2RREoAH07SiZ9ejx9xpzP/l/wk6Z?=
 =?us-ascii?Q?x9fqodB8wMLPWwN7Erk7GBmKuMgJ47CAXQ1reBO38qz8+BO8kntZk56rBWHn?=
 =?us-ascii?Q?JlF+JiLsmrgjKraooSfkeiplU0UR9rBDRfWEJIc6AiW6mHT31qs/Bmmnd2PS?=
 =?us-ascii?Q?36As7Nl2wjKHdQbjueSRnn5+nud11gjZdO9RpnfzFHXRjPzhxaE6n8b7QdMk?=
 =?us-ascii?Q?x2SN/IvNrAfo/9MeyLFUjYSy/r6DTmCU/CIyhqvDVMe/2mSYXn2H2phPv+kG?=
 =?us-ascii?Q?GQ3vmDq/GKSKhqImKBOCm8Nz+UwKCoxzWUo5wpuwmCoMQt380WYtAzktr0XO?=
 =?us-ascii?Q?VqsWFfbgJxNkoI1haoOzkdI4ERZzB1q+uoA+leky35MS4oqFPpOG/9Bph28a?=
 =?us-ascii?Q?EA+YDS95oOtHxazM2zHiYd4/Ga43zaY9ndbVf4EJqhXDk6WjCPdJ+uEmylIR?=
 =?us-ascii?Q?X9rsWzKh8yjZJ7ZabswVRBbXAHxu1tj1fYbP9zfqIJs3HBrbqijIMkFlBXI3?=
 =?us-ascii?Q?qNjEESHMX3iKBlY5qYz7e1MhRESqnutw/xw66tofD/UoQBk4nnguascGJYPX?=
 =?us-ascii?Q?HtoLn+O/1luX4MhgmrnGdT3G1VnVXWUorXgVzWIbhEQ3iII6SgyTV7Qh9hZ/?=
 =?us-ascii?Q?I3Uazw6kx+0yaNG0epST+PNF5ME7//RIAgAwSpcPA3QsTX5hGzFYyqpzxq76?=
 =?us-ascii?Q?/eGrkvY602FyBDGrYVbVr2I59JFq/Eu6wyCmgaUohHJwPHtkI8rgkKfA/7qL?=
 =?us-ascii?Q?G5T71KqpYwU0N4Ctt5W2Z2xVZpkCjO6V0Z3yGTB+RCla6lJ46e++01SPga4m?=
 =?us-ascii?Q?bOIvJZ+IpIZrsWbuLwWhjZsDU+O0PNsGk/TCm4dVcvPg4ADB90p5iCHvRJno?=
 =?us-ascii?Q?lLRBl4QcSSkGZ1KQY4KyrI8mQUu9+aLoX9UyCo9r1DvAzYXxr7okVLDsnYpv?=
 =?us-ascii?Q?r/45mJEWL8oOkmbwd/HS7LVX4lDxRXUdeLkeK1djNhMQRV3DhdSPj2yNYCJO?=
 =?us-ascii?Q?tPYxpm3PXYTvcYzXGrS5OIzKhymE4YgIuSYzna0uCgvGNU8C8f8SeSziN0eD?=
 =?us-ascii?Q?wEUec1cpj5pf47wqSTQ38tagkff0vmX4xbxTtIoYd8uhnOOSsKxaID7FzqKO?=
 =?us-ascii?Q?OHQTaWdFuDqcCODd1kpKOxjIdsAVjXgOjLNoM7GbeiKfFd80vFem6AyKKI6z?=
 =?us-ascii?Q?6xTnTMqgEOduXuxr9b0P4HXaTPK4SpEWhth44R6N/XaypjLW/NzHrN1dV710?=
 =?us-ascii?Q?Lw8r/T9TbwDiEFmVhZtE809uayL6+e6riaMbog8tnCIcwJSZtP4UZIcZwGdt?=
 =?us-ascii?Q?Wnyo+8KdDL0e+SQaD8bMaF/c2sdDLfZlfnUxlpKJyCT1SKBJ8fDiDO4quCz4?=
 =?us-ascii?Q?1hJIv2eT/6vOJ9Gx6VwmIWrEwudfx6HfV7YuA7HXrSkUI75ZXkMWbK9xof2w?=
 =?us-ascii?Q?hHDTAggkPMpmwTTIrkN91954UNEQQO9/PWxqR1gWQ472TLFXIJF0Xa4nQZ6U?=
 =?us-ascii?Q?OPJx6hZJdAWOdsp6bmt9hHZuLJsZTeylGSTXi9IVYa/QDs/hIASQeVVUYDHq?=
 =?us-ascii?Q?4I2raGqrJfd/AJQ0iH9zg2nPlUlmtP0mJEcgj5ROjq1VrH28X0fmJc2xfCC/?=
 =?us-ascii?Q?zQ8B8sFTwRbLFUDuRmIuCZEoMCgKn5U5b20fk6+KhB4Z+1FS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf1bd99-6ced-4e2a-f142-08df025fe63c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 04:18:21.7452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9o5D8tSikcGy5vpoALu5o5lgK4Y+kE9pPsYpj7l+SIh8sh2f2/Wl4xyhtoEbhyQnmbVCI6g/72NvWqnLyVo4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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
> Sent: Friday, August 21, 2026 10:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Huang,
> Honglei1 <Honglei1.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>;
> Ma, Yiru <Yiru.Ma@amd.com>; Shen, Junhua <Junhua.Shen@amd.com>
> Subject: [PATCH i-g-t v1 1/2] lib/amdgpu: add generic compute dispatch an=
d
> copy_dword helpers
>
> Add amdgpu_dispatch_shader(), a family-agnostic compute dispatch emitter =
driven
> by a caller-filled amdgpu_dispatch_shader_req. The caller supplies all sh=
ader-
> binding state (RSRC*, thread dims, user data, grid and BO list), so any s=
hader can
> be run without changing the emitter. It creates the context, allocates th=
e command
> buffer, emits the compute state and DISPATCH_DIRECT packets, and submits.
>
> Also add amdgpu_compute_copy_dword(), a small wrapper that builds a singl=
e-
> DWORD copy shader for the current GPU family and dispatches it, for use a=
s a
> lightweight submission workload in tests.
>
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  .../compute_utils/amd_dispatch_helpers.c      | 333 ++++++++++++++++++
>  .../compute_utils/amd_dispatch_helpers.h      |  77 ++++
>  2 files changed, 410 insertions(+)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> index 180fbdd40..7ad1efa16 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> @@ -10,6 +10,12 @@
>  #include <amdgpu_drm.h>
>  #include "amdgpu/amd_PM4.h"
>  #include "amdgpu/amd_ip_blocks.h"
> +#ifdef AMDGPU_LLVM_ENABLED
> +#include "amdgpu/shaders/amd_llvm_asm.h"
> +#else
> +#include "amdgpu/shaders/amd_llvm_asm_stub.h"
> +#endif
> +#include "amdgpu/shaders/amd_shader_store.h"
>  #include "igt.h"
>
>  int
> @@ -348,3 +354,330 @@ cleanup_context:
>
>       return ret;
>  }
> +
> +int amdgpu_dispatch_shader(amdgpu_device_handle device,
> +                        const struct amdgpu_dispatch_shader_req *req) {
> +     amdgpu_context_handle context_handle;
> +     amdgpu_bo_handle bo_cmd =3D NULL;
> +     uint32_t *ptr_cmd =3D NULL;
> +     uint64_t mc_cmd =3D 0;
> +     amdgpu_va_handle va_cmd =3D 0;
> +     struct amdgpu_cs_request ib_req =3D {0};
> +     struct amdgpu_cs_ib_info ib_info =3D {0};
> +     amdgpu_bo_list_handle bo_list =3D NULL;
> +     struct amdgpu_cs_fence fence =3D {0};
> +     uint32_t expired =3D 0;
> +     struct amdgpu_cmd_base *base_cmd =3D get_cmd_base();
> +     amdgpu_bo_handle *resources =3D NULL;
> +     uint32_t num_resources =3D 0;
> +     uint32_t i;
> +     int ret =3D -1;
> +
> +     if (!req || !req->shader_mc_addr) {
> +             igt_info("Invalid dispatch request\n");
> +             goto cleanup_base;
> +     }
> +
> +     /* Create fresh context for each dispatch to avoid state pollution =
*/
> +     if (amdgpu_cs_ctx_create(device, &context_handle) !=3D 0) {
> +             igt_info("Failed to create context\n");
> +             goto cleanup_base;
> +     }
> +
> +     /* Command buffer for PM4 packets */
> +     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> +         AMDGPU_GEM_DOMAIN_GTT, 0, &bo_cmd, (void **)&ptr_cmd,
> &mc_cmd, &va_cmd) !=3D 0) {
> +             igt_info("Failed to allocate command buffer\n");
> +             goto cleanup_context;
> +     }
> +     memset(ptr_cmd, 0, 4096);
> +     base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
> +
> +     /* Generic compute state init (version-specific defaults) */
> +     amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, req-
> >version);
> +     amdgpu_dispatch_write_cumask(base_cmd, req->version);
> +
> +     /*
> +      * The SET_SH_REG offsets below are hardcoded (0x20c, 0x212, 0x213,
> +      * 0x207, 0x228, 0x240). These values are stable across gfx9..gfx12=
,
> +      * so hardcoding is correct today.
> +      *
> +      * The intended abstraction for offsets is
> +      * ip_block->funcs->get_reg_offset(): fetch the compute IP block vi=
a
> +      * get_ip_block(device, AMDGPU_HW_IP_COMPUTE) and call
> +      * ip_block->funcs->get_reg_offset(COMPUTE_PGM_LO) etc. instead of
> the
> +      * literals. It is deliberately NOT used here for two reasons:
> +      *   1. Coverage - enum general_reg (amd_registers.h) only defines
> +      *      COMPUTE_PGM_LO, PGM_RSRC1, TMPRING_SIZE,
> USER_DATA_0/1,
> +      *      RESOURCE_LIMITS and NUM_THREAD_X. RSRC2 (0x213),
> RSRC3 (0x228)
> +      *      and NUM_THREAD_Y/Z (0x208/0x209) have no enum, so the
> dispatch
> +      *      path cannot be expressed through get_reg_offset alone.
> +      *   2. No per-gen adaptation - there is a single compute IP block
> +      *      (compute_v8_x_ip_block) wired to gfx_v8_0_get_reg_offset fo=
r all
> +      *      generations, so it returns the same gfx8/VI offsets regardl=
ess
> +      *      of the running IP; adopting it would centralize but not fut=
ure-
> +      *      proof the offsets.
> +      * To fully adopt get_reg_offset, first extend enum general_reg wit=
h the
> +      * missing registers and add real per-generation offset tables/IP b=
locks.
> +      */
> +
> +     /* Shader program address (COMPUTE_PGM_LO/HI) */
> +     base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG,
> 2));
> +     base_cmd->emit(base_cmd, 0x20c);
> +     base_cmd->emit(base_cmd, req->shader_mc_addr >> 8);
> +     base_cmd->emit(base_cmd, req->shader_mc_addr >> 40);
> +
> +     /* Caller-provided shader resource state
> (COMPUTE_PGM_RSRC1/RSRC2) */
> +     base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG,
> 1));
> +     base_cmd->emit(base_cmd, 0x212);
> +     base_cmd->emit(base_cmd, req->rsrc1);
> +
> +     base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG,
> 1));
> +     base_cmd->emit(base_cmd, 0x213);
> +     base_cmd->emit(base_cmd, req->rsrc2);
> +
> +     /* Workgroup dimensions (COMPUTE_NUM_THREAD_X/Y/Z, consecutive
> regs) */
> +     base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG,
> 3));
> +     base_cmd->emit(base_cmd, 0x207);
> +     base_cmd->emit(base_cmd, req->thread_x);
> +     base_cmd->emit(base_cmd, req->thread_y);
> +     base_cmd->emit(base_cmd, req->thread_z);
> +
> +     /* COMPUTE_PGM_RSRC3 exists on gfx10/gfx11 */
> +     if (req->version =3D=3D 10 || req->version =3D=3D 11) {
> +             base_cmd->emit(base_cmd,
> PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +             base_cmd->emit(base_cmd, 0x228);
> +             base_cmd->emit(base_cmd, req->rsrc3);
> +     }
> +
> +     /* User data / kernel arguments (COMPUTE_USER_DATA_0..) */
> +     if (req->user_data_count) {
> +             base_cmd->emit(base_cmd,
> PACKET3_COMPUTE(PKT3_SET_SH_REG, req->user_data_count));
> +             base_cmd->emit(base_cmd, 0x240);
> +             for (i =3D 0; i < req->user_data_count; i++)
> +                     base_cmd->emit(base_cmd, req->user_data[i]);
> +     }
> +
> +     /* Dispatch: dim_x, dim_y, dim_z, dispatch_initiator */
> +     base_cmd->emit(base_cmd,
> PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
> +     base_cmd->emit(base_cmd, req->grid_x);
> +     base_cmd->emit(base_cmd, req->grid_y);
> +     base_cmd->emit(base_cmd, req->grid_z);
> +     base_cmd->emit(base_cmd, req->dispatch_initiator);
> +     base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
> +
> +     /* Resource list =3D internal command buffer + caller-provided BOs =
*/
> +     num_resources =3D req->num_bos + 1;
> +     resources =3D malloc(num_resources * sizeof(*resources));
> +     if (!resources) {
> +             igt_info("Failed to allocate resource list\n");
> +             goto cleanup_cmd;
> +     }
> +     resources[0] =3D bo_cmd;
> +     for (i =3D 0; i < req->num_bos; i++)
> +             resources[i + 1] =3D req->bos[i];
> +
> +     if (amdgpu_bo_list_create(device, num_resources, resources, NULL,
> &bo_list) !=3D 0) {
> +             igt_info("Failed to create BO list\n");
> +             goto cleanup_resources;
> +     }
> +
> +     ib_info.ib_mc_address =3D mc_cmd;
> +     ib_info.size =3D base_cmd->cdw;
> +     ib_req.ip_type =3D AMDGPU_HW_IP_COMPUTE;
> +     ib_req.ring =3D 0;
> +     ib_req.resources =3D bo_list;
> +     ib_req.number_of_ibs =3D 1;
> +     ib_req.ibs =3D &ib_info;
> +     ib_req.fence_info.handle =3D NULL;
> +
> +     if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) !=3D 0) {
> +             igt_info("Failed to submit CS\n");
> +             goto cleanup_bo_list_run;
> +     }
> +
> +     /* Wait for completion */
> +     fence.context =3D context_handle;
> +     fence.ip_type =3D AMDGPU_HW_IP_COMPUTE;
> +     fence.ip_instance =3D 0;
> +     fence.ring =3D 0;
> +     fence.fence =3D ib_req.seq_no;
> +
> +     if (amdgpu_cs_query_fence_status(&fence,
> AMDGPU_TIMEOUT_INFINITE, 0, &expired) !=3D 0) {
> +             igt_info("Fence wait failed\n");
> +             goto cleanup_bo_list_run;
> +     }
> +
> +     if (!expired) {
> +             igt_info("Fence not expired\n");
> +             goto cleanup_bo_list_run;
> +     }
> +
> +     ret =3D 0;
> +
> +cleanup_bo_list_run:
> +     amdgpu_bo_list_destroy(bo_list);
> +cleanup_resources:
> +     free(resources);
> +cleanup_cmd:
> +     amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
> +cleanup_context:
> +     amdgpu_cs_ctx_free(context_handle);
> +cleanup_base:
> +     free_cmd_base(base_cmd);
> +
> +     return ret;
> +}
> +
> +struct copy_dword_shader {
> +     amdgpu_device_handle device;
> +     amdgpu_bo_handle bo_shader;
> +     amdgpu_va_handle va_shader;
> +     uint64_t mc_shader;
> +     uint32_t version;
> +     bool ready;
> +};
> +
> +/*
> + * Assemble the CopyDword compute shader for @device and populate @sh.
> + *
> + * Returns true on success (sh->ready set). Returns false if the shader
> +could
> + * not be prepared -- whether unavailable (no compute IP block,
> +unsupported gfx
> + * version, no LLVM assembler) or a hard error (query / BO alloc failed)=
.
> + */
> +static bool copy_dword_shader_assemble(amdgpu_device_handle device,
> +                                    struct copy_dword_shader *sh) {
> +     struct amdgpu_gpu_info info =3D {0};
> +     struct drm_amdgpu_info_hw_ip hw_ip =3D {0};
> +     char mcpu[32];
> +     uint8_t isa_bin[4096];
> +     size_t isa_sz =3D 0;
> +     void *ptr_shader =3D NULL;
> +     int r;
> +
> +     if (get_ip_block(device, AMDGPU_HW_IP_COMPUTE) =3D=3D NULL) {
get_ip_block() takes enum amd_ip_block_type, not the libdrm AMDGPU_HW_IP_* =
constants. Please use AMD_IP_COMPUTE instead of AMDGPU_HW_IP_COMPUTE:

> +             igt_info("Compute IP block not available\n");
> +             return false;
> +     }
> +
> +     if (amdgpu_query_gpu_info(device, &info) !=3D 0)
> +             return false;
> +
> +     if (amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0,
> &hw_ip) !=3D 0)
> +             return false;
> +     sh->version =3D hw_ip.hw_ip_version_major;
> +     /*
> +      * Only gfx9..gfx12 have verified register-programming tables here
> +      * (see amdgpu_dispatch_write2hw() and amdgpu_compute_copy_dword())=
.
> +      * Fail fast on anything outside that range instead of silently
> +      * reusing the gfx9 defaults, which would emit wrong RSRC1/offsets
> +      * on a future IP.
> +      */
> +     if (sh->version < 9 || sh->version > 12) {
> +             igt_info("Compute copy unsupported on gfx version %u (need
> GFX9..GFX12)\n",
> +                      sh->version);
> +             return false;
> +     }
> +
> +     amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
> +
> +     if (amdgpu_llvm_asm_init() !=3D 0)
> +             return false;
> +
> +     r =3D amdgpu_llvm_assemble(mcpu, CopyDwordIsa, isa_bin,
> +                              sizeof(isa_bin), &isa_sz);
> +     if (r !=3D 0 || isa_sz =3D=3D 0) {
> +             amdgpu_llvm_asm_shutdown();
> +             igt_info("Failed to assemble CopyDwordIsa\n");
> +             return false;
> +     }
> +
> +     sh->device =3D device;
> +
> +     /* Upload the assembled ISA into a dedicated shader BO */
> +     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> AMDGPU_GEM_DOMAIN_GTT, 0,
> +                                 &sh->bo_shader, &ptr_shader, &sh->mc_sh=
ader,
> +                                 &sh->va_shader) !=3D 0) {
> +             amdgpu_llvm_asm_shutdown();
> +             return false;
> +     }
> +     memset(ptr_shader, 0, 4096);
> +     memcpy(ptr_shader, isa_bin, isa_sz);
> +     amdgpu_llvm_asm_shutdown();
> +
> +     sh->ready =3D true;
> +     return true;
> +}
> +
> +/*
> + * Lazily assemble (once per process) and return the cached CopyDword
> +shader for
> + * @device, or NULL if the shader could not be prepared. The shader BO
> +is
> + * intentionally left mapped until process exit; the test binary is shor=
t-lived.
> + */
> +static struct copy_dword_shader
> +*copy_dword_shader_get(amdgpu_device_handle device) {
> +     static struct copy_dword_shader cache;
> +
> +     if (cache.ready && cache.device =3D=3D device)
> +             return &cache;
> +
> +     /* A device change is not expected; drop any stale shader. */
> +     if (cache.ready) {
> +             if (cache.bo_shader)
> +                     amdgpu_bo_unmap_and_free(cache.bo_shader,
> cache.va_shader,
> +                                              cache.mc_shader, 4096);
> +             memset(&cache, 0, sizeof(cache));
> +     }
> +
> +     if (!copy_dword_shader_assemble(device, &cache)) {
> +             memset(&cache, 0, sizeof(cache));
> +             return NULL;
> +     }
> +
> +     return &cache;
> +}
> +
> +int amdgpu_compute_copy_dword(amdgpu_device_handle device,
> +                           uint64_t src_va, uint64_t dst_va) {
> +     struct copy_dword_shader *sh;
> +     struct amdgpu_dispatch_shader_req req =3D {0};
> +     uint32_t user_data[4];
> +
> +     sh =3D copy_dword_shader_get(device);
> +     if (!sh) {
> +             igt_info("Compute shader unavailable (no compute IP / LLVM)=
\n");
> +             return -1;
> +     }
> +
> +     /* CopyDword ABI: s[0:1] =3D source pointer, s[2:3] =3D destination=
 pointer */
> +     user_data[0] =3D src_va & 0xFFFFFFFF;
> +     user_data[1] =3D src_va >> 32;
> +     user_data[2] =3D dst_va & 0xFFFFFFFF;
> +     user_data[3] =3D dst_va >> 32;
> +
> +     req.version =3D sh->version;
> +     req.shader_mc_addr =3D sh->mc_shader;
> +     /* Register state mirrors amdgpu_dispatch_write2hw() for CopyDword =
*/
> +     if (sh->version =3D=3D 11 || sh->version =3D=3D 12)
> +             req.rsrc1 =3D 0x600C0041 & ~(1u << 29);
> +     else
> +             req.rsrc1 =3D 0x000C0041;
> +     req.rsrc2 =3D 0x00000090;
> +     req.rsrc3 =3D (sh->version =3D=3D 11) ? 0x3f0 : 0;
> +     req.thread_x =3D 0x40;
> +     req.thread_y =3D 1;
> +     req.thread_z =3D 1;
> +     req.user_data =3D user_data;
> +     req.user_data_count =3D 4;
> +     req.grid_x =3D 1;
> +     req.grid_y =3D 1;
> +     req.grid_z =3D 1;
> +     req.dispatch_initiator =3D 0x1;   /* COMPUTE_SHADER_EN */
> +     req.bos =3D &sh->bo_shader;

The header documents @bos as covering BOs the shader accesses (inputs/outpu=
ts), but the implementation only registers the shader BO. Please extend amd=
gpu_compute_copy_dword() to accept the destination BO (e.g. add a dst_bo pa=
rameter) and include it in req.bos alongside the shader BO. If the source i=
s also a GEM BO (as in the ptrace VRAM test), consider passing that as well=
 so the driver can track residency for all accessed buffers.

Regards
Jesse
> +     req.num_bos =3D 1;
> +
> +     return amdgpu_dispatch_shader(device, &req); }
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> index c0113519b..8890e99b4 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> @@ -41,4 +41,81 @@ int execute_compute_dispatch(amdgpu_device_handle
> device,
>                                  uint64_t src_mc_addr,
>                                  uint64_t dst_mc_addr,
>                                  uint32_t expected_value);
> +
> +/**
> + * struct amdgpu_dispatch_shader_req - Description of a generic compute
> +dispatch
> + * @version: GPU version used for the compute state init (9/10/11/12)
> + * @shader_mc_addr: GPU address of the shader ISA to execute
> + * @rsrc1: value written to COMPUTE_PGM_RSRC1
> + * @rsrc2: value written to COMPUTE_PGM_RSRC2
> + * @rsrc3: value written to COMPUTE_PGM_RSRC3 (only emitted on version
> +10/11)
> + * @thread_x: value written to COMPUTE_NUM_THREAD_X (workgroup size X)
> + * @thread_y: value written to COMPUTE_NUM_THREAD_Y (workgroup size Y)
> + * @thread_z: value written to COMPUTE_NUM_THREAD_Z (workgroup size Z)
> + * @user_data: dwords loaded into COMPUTE_USER_DATA_0.. (kernel
> +arguments)
> + * @user_data_count: number of dwords in @user_data (0 to skip)
> + * @grid_x: DISPATCH_DIRECT dimension X (number of workgroups)
> + * @grid_y: DISPATCH_DIRECT dimension Y
> + * @grid_z: DISPATCH_DIRECT dimension Z
> + * @dispatch_initiator: COMPUTE_DISPATCH_INITIATOR flags (bit0 =3D
> +COMPUTE_SHADER_EN)
> + * @bos: BOs the shader accesses (inputs/outputs); the command buffer is=
 added
> + *       internally, so this list only needs the shader and data BOs
> + * @num_bos: number of entries in @bos
> + *
> + * All shader-binding state (RSRC*, thread dims, user data, grid) is
> +supplied by
> + * the caller so that any shader can be executed without changing the em=
itter.
> + */
> +struct amdgpu_dispatch_shader_req {
> +     uint32_t version;
> +
> +     uint64_t shader_mc_addr;
> +     uint32_t rsrc1;
> +     uint32_t rsrc2;
> +     uint32_t rsrc3;
> +
> +     uint32_t thread_x;
> +     uint32_t thread_y;
> +     uint32_t thread_z;
> +
> +     const uint32_t *user_data;
> +     uint32_t user_data_count;
> +
> +     uint32_t grid_x;
> +     uint32_t grid_y;
> +     uint32_t grid_z;
> +     uint32_t dispatch_initiator;
> +
> +     amdgpu_bo_handle *bos;
> +     uint32_t num_bos;
> +};
> +
> +/**
> + * amdgpu_dispatch_shader - Execute a generic compute dispatch
> + * @device: AMDGPU device handle
> + * @req: Description of the dispatch to execute
> + *
> + * This function creates a fresh context, allocates a command buffer,
> +emits the
> + * compute state and dispatch packets, and submits it. The caller must
> +provide
> + * all shader-binding state (RSRC*, thread dims, user data, grid) so
> +that any
> + * shader can be executed without changing the emitter.
> + *
> + * Returns: 0 on success, -1 on failure  */ int
> +amdgpu_dispatch_shader(amdgpu_device_handle device,
> +                            const struct amdgpu_dispatch_shader_req *req=
);
> +
> +/**
> + * amdgpu_compute_copy_dword - Copy a single DWORD from src to dst via
> +compute
> + * @device: AMDGPU device handle
> + * @src_va: GPU virtual address of the source DWORD
> + * @dst_va: GPU virtual address of the destination DWORD
> + *
> + * This function assembles a small compute shader that copies a single
> +32-bit
> + * value from @src_va to @dst_va, uploads it to a dedicated shader BO,
> +and
> + * dispatches it.
> + *
> + * Returns: 0 on success, -1 on failure  */ int
> +amdgpu_compute_copy_dword(amdgpu_device_handle device,
> +                           uint64_t src_va, uint64_t dst_va);
>  #endif
> --
> 2.34.1

