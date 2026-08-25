Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E93C5B572
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A89910E8A3;
	Tue, 25 Aug 2026 04:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jgadbruo";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012059.outbound.protection.outlook.com
 [40.93.195.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730110E8A3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 04:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQIimg6cc6vMiBL/YhbSqkssCB+stmEhhy1l7dbn99rkgs9vvaPobZHbbneohokgAvIGX7/8Cd4D2ln2YTzfxENHtrVyleKfIWj8Swkh4niPhCvD/0mTitr5EYeCHn+eIHCTsoT5QJ6X5X37jUVTyKsvG7arFdywz5frYEZmGXt9zN0+d061iWfHPiMZeh982/V02OtJrG++bq3DukMK4QM/MBn0+dOmZ8R4hT67Rm5M/SkCF+EvOa0rJXusYMocc/TPhN49briWDBcHwdXLELDfHfwElag/U+5c4FMWOCAVoE6D+iKyaH34kMSIhwB4Il8oojTvP7Tm9F54Uxt3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7h1Rzcoi8hzGSQvv9e6ZvozBNBerIN6VY4Bms3G4HM=;
 b=m2RQeVxUjlcLOvLb007NjvAJ0HKOaRxixVUi+EGY0CEh1fJz25Y/YuyYbO0Yv8QajzZ7TU5OxtOySlzXaQPTJodK/9kdWXvrAl7OhQY5z3NBWOxP4jBeqChTzl2fwpmBnIQURREk54J2L12UNuA747zY9JQYWi4WfVqKqmWUeZ4zarfJY31RAXwKG352OMsbDQPCZwX2vAQ2vsEQCD80rXGKTSXXmP1UbVf5PNDINecShGFkjRmPvt81AlDDUvWJcx4BZQy8wb0NV1wOzLYDjgzxVHLXZ5iZWzEZiX21XbQTA7PZeAZskqcjNPL38m0HfiUi4F1fWsLaglEzp9Bnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7h1Rzcoi8hzGSQvv9e6ZvozBNBerIN6VY4Bms3G4HM=;
 b=jgadbruoU3JuopGIpBVpc+XzN9Je+BweIoBFanypMgrCddxPzXp5VFRSI0RsVRzmucqTEqqaf+bXkuNhqiuPuugJiVh2Rl+5LlO7Whr/Qz1JdO9R8+FcnbdTEZ0OisVLquyUOaZSRdoPGNE+wL8UU94Dd4x1pE1tj3Pmas+B26k=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Tue, 25 Aug
 2026 04:23:55 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:23:54 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Shen, Junhua" <Junhua.Shen@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>
Subject: RE: [PATCH i-g-t v1 2/2] tests/amdgpu: replace
 execute_compute_dispatch with amdgpu_compute_copy_dword
Thread-Topic: [PATCH i-g-t v1 2/2] tests/amdgpu: replace
 execute_compute_dispatch with amdgpu_compute_copy_dword
Thread-Index: AQHdMXiQ6O9W/cYgOEetMtdp3otCL7auLqRw
Date: Tue, 25 Aug 2026 04:23:54 +0000
Message-ID: <DM4PR12MB51523BC07C03349DF6610656E3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260821142242.34700-1-Junhua.Shen@amd.com>
 <20260821142242.34700-3-Junhua.Shen@amd.com>
In-Reply-To: <20260821142242.34700-3-Junhua.Shen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-25T04:18:33.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MW3PR12MB4396:EE_
x-ms-office365-filtering-correlation-id: 08a8ab1e-803f-4208-70fe-08df0260acaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|3023799007|38070700021|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: mSd/rRKFWWlrb7Sx3N26aZaIg+fqgDNhS7vA6DkmkDt3ptb8Lgy44SDLjLR5zgXLaUIhP5H0gVFWs8jxWBem2sycpPWfkXb2rk7EvtdgRZUeseHyWagA9XdM2+RRVHZ/HUexAStZHik4F/SdejdDk8ajcMkPC1CD2CvehL0y7al0ojCO/H3rrRSgk63gnRoCaI/ykscTQVINTO7nXAREWgMrOdWadRjZjU8gwdWM61XPU+7F6n7sre5u+qNPzE68H4AOdH/rO0RcSN4gBXAFAdNAlUdjDUAeCwG6Cptlv1rc6sVc4V4qh6Mw6E9887UfBXRLKWrytt4clfVqObAcTJ9rV5SruZf1/I3ym6qZhcrfNpL1F3Q6ww6fmQIBRqKByg35/eogD0CxXIPcq2jdSSs2YtU/Z4gdqSyC4ZrAqoXFtcv1LYF2Dkrjw36Y1nL76US/zYOS6Sw2hBhgrGWjbKzpiO7CQnKlPis2EusPX8N8otbxLuWhq210Wwc1n48nCPYkHh+2Rs6kXtfi8AYzGE9+ZRT3+Xib6o1+dbXv2hVWjaDUhI4iBULUpN5y1o4ToTjAY40CZpExjBRLrBhwsQUHeXqvSZT1I5+W8rewkKPXmq+kI/6i5MFrJh7nFAHG4EIw0N2eSEYEF4nmeg8BMaYF35lp5D26FqSi4eYo3bh3xJrA5yr8vI5ACjbaAFBMiurLOtIc7GcsM6+XCPgCN1IXYbaOIghlACnGOGun7zk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(38070700021)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pw/zDGsxofrAe6qiEomxKSqapvWSwot3pVvIcpgDrGhs0juu3Tn0JRFbTFeR?=
 =?us-ascii?Q?8gfQ4l1wpCST+pGMQwFg16+0gO7sJMlulxtSPWT50MVL9YVvBAwrZ32qqtgk?=
 =?us-ascii?Q?R7WdRZDLEaTpyl56hyf8j0jK/VUJHalEbOXpLxSjmCfrzPMUgfcdmg70ymas?=
 =?us-ascii?Q?klgP8t6BvYRkKfpQtqHQp+tXe4NugAX/gn6wQ5JCifWS2ULoEMwmx5sYzn54?=
 =?us-ascii?Q?0gkQMlqXvTNXW6WLUhknra48y4FlfIZ4xvm/KIBac7WCMg2K4+e4szYI8tCd?=
 =?us-ascii?Q?qJypbrss3H/DCbQupWki48BIUalQ0oVtCW8jpN2vhL53o4ZQtD666EAAz2hV?=
 =?us-ascii?Q?FlRpYRobX+68pr9dTACFnWBVjZpCOEqqZ+eMMdcijsGdS+huMWispxF+CO/5?=
 =?us-ascii?Q?LAy757XHjUrhqAC5ubUDX2ZcPOmW2Qdu3P82l8vKeZJHNIqwxfYjJedS3J/l?=
 =?us-ascii?Q?tldsZudDVTR3wzXgSSZq8er8H5QTOol0cRvVtzuT3N8gXPbYJwP2L7kIsWPS?=
 =?us-ascii?Q?aZGcug28NJ4bCmR345YUgei3jSXVUoAzML6ULlQNOMY1aB+jZ8iOkpyZc8G0?=
 =?us-ascii?Q?KJsXWbCK/qwItRd4hLQy5ag3iZPk8nlCZCMjmLjNUgm9/KAcAz3dKjg8Hkpk?=
 =?us-ascii?Q?PHfaLmeNil0lqCztgdglgRRz7b/K2GVvvWPmI4FJJjzr86QJEYu1D8Ic6CO2?=
 =?us-ascii?Q?dfLN2uE616bcPOyGPlzqykfOCje/bJuqVLwdc4Zx9caow7VOPtni7S5IMlvo?=
 =?us-ascii?Q?sTh9A2X6DAqZQUO03bpTB5CRH5rng9+7GF9GGpv2tDBRhjesj14srUZcI6Yx?=
 =?us-ascii?Q?8Z+/fp5hvVdoqTZdaprDPd1hyuntjjqgprhGuVTWyisRUoNDyAdseSTp5A1y?=
 =?us-ascii?Q?sIwcswruULnCoGZJOWp2lt7DKFEBknPtAbLyFxjqAh81kMoERGe98e05EuX5?=
 =?us-ascii?Q?zwRj9yIDh5f5QbTjo5+qE0EY0mEsSg7LBtTJ6jRIM67hwYJ+dCEaeZk2M5k/?=
 =?us-ascii?Q?Xz5fv7Rp3t2c12WtrU0seOBzZCfQL1BNZVYEK4AhrbpPTNhRqFrpI3iqrT0r?=
 =?us-ascii?Q?nbazxDnz7B+zeEBVFTfKz1ZV7Zod+whAc0mqq80C7XZ76dKEKvMO0rpi2BtC?=
 =?us-ascii?Q?v8moVykxex4jIxHuRLGR7DbhRZE+x/vWSu6/Nt0kkvyLbOV9iYfmUv/I1Zfi?=
 =?us-ascii?Q?J47m9hkxz+Lxr5izBLRbSi3Ys8I+2Cg/9c44Htq65iVMEub8icELf+NnJ2hs?=
 =?us-ascii?Q?mfuE4t3toRioimybf2CDKKdOE5ru82f1eCFD8Q2vJ+QQ6nc3wnCwh+lGFUCy?=
 =?us-ascii?Q?eVdjLZIZNIhQlOmU1R8DE2KuRs9pd0fQFcW/AVTYTvWlMEJgpi9TvGWql7Kd?=
 =?us-ascii?Q?YFdzcmha9pLJ8pbG6lsCMVN5TDUIn8x+xCIzcfxuCfpKXOhGKMIEX6GS/nSc?=
 =?us-ascii?Q?kqnSZfFeX353FyVB1SHs5WVT17a3WSFcf9ZV5vaxMkguC+GcNxr74byyepaH?=
 =?us-ascii?Q?y9wCqyqZIBJ/qdBQgnvB9//uOqW4HxirFSi5onJ6L0gi1HId6iIv6gnsqRNR?=
 =?us-ascii?Q?aYqNW9a+ydKFKpXwCCg3Y9OPILMmrVNasX9RMw0eNwHC1pzX0f6zhaH4y7Ds?=
 =?us-ascii?Q?BAcUlR3Jg/lHf4K59pB/I4ZiKDw86xc8re13IqhWZRV1V/5enr9cDE6TPKek?=
 =?us-ascii?Q?xoMRF0OkGl0Or6mQ5gapsGLJgVaZ7mJSOZKnd6cjSFee3NKZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a8ab1e-803f-4208-70fe-08df0260acaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 04:23:54.6299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XeA/Vc+hasl/orB95OfPJOCBopxQj7zGQMzeQOoxfWwY5hwoxm+D2oFNyqb0nPCTDDIpAd5yUof17p6IR993Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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
> Subject: [PATCH i-g-t v1 2/2] tests/amdgpu: replace execute_compute_dispa=
tch
> with amdgpu_compute_copy_dword
>
> Switch amd_mem's ptrace VRAM verification from execute_compute_dispatch()=
 to
> the new amdgpu_compute_copy_dword() helper, and drop the now-unused
> execute_compute_dispatch().
>
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  .../compute_utils/amd_dispatch_helpers.c      | 165 ------------------
>  .../compute_utils/amd_dispatch_helpers.h      |   7 -
>  tests/amdgpu/amd_mem.c                        | 109 +++---------
>  3 files changed, 28 insertions(+), 253 deletions(-)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> index 7ad1efa16..eb6a1e707 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> @@ -190,171 +190,6 @@ int amdgpu_dispatch_write2hw(struct
> amdgpu_cmd_base *base, uint64_t shader_addr,
>       return base->cdw - offset_prev;
>  }
>
> -/**
> - * execute_compute_dispatch - Execute a single compute dispatch for memo=
ry
> copy
> - * @device: AMDGPU device handle
> - * @version: GPU version for register programming
> - * @shader_mc_addr: Shader buffer GPU address
> - * @src_mc_addr: Source memory GPU address to read from
> - * @dst_mc_addr: Destination buffer GPU address to write to
> - * @expected_value: Expected 32-bit value for verification
> - *
> - * This function sets up and executes a compute dispatch that copies a s=
ingle
> DWORD
> - * from source to destination using a pre-compiled shader. Each dispatch=
 uses
> - * completely independent resources to avoid state pollution.
> - *
> - * Returns: 0 on success, -1 on failure
> - */
> -int execute_compute_dispatch(amdgpu_device_handle device,
> -                                uint32_t version,
> -                                uint64_t shader_mc_addr,
> -                                uint64_t src_mc_addr,
> -                                uint64_t dst_mc_addr,
> -                                uint32_t expected_value)
> -{
> -     amdgpu_context_handle context_handle;
> -     amdgpu_bo_handle bo_cmd =3D NULL, bo_shader =3D NULL, bo_dst =3D NU=
LL;
> -     uint32_t *ptr_cmd =3D NULL;
> -     void *ptr_shader =3D NULL;
> -     volatile uint32_t *ptr_dst =3D NULL;
> -     uint64_t mc_cmd =3D 0, mc_shader =3D 0, mc_dst =3D 0;
> -     amdgpu_va_handle va_cmd =3D 0, va_shader =3D 0, va_dst =3D 0;
> -     struct amdgpu_cs_request ib_req =3D {0};
> -     struct amdgpu_cs_ib_info ib_info =3D {0};
> -     amdgpu_bo_list_handle bo_list =3D NULL;
> -     struct amdgpu_cs_fence fence =3D {0};
> -     uint32_t expired =3D 0;
> -     struct amdgpu_cmd_base *base_cmd =3D get_cmd_base();
> -     amdgpu_bo_handle bos[3];
> -     int ret =3D 0;
> -
> -     /* Create fresh context for each dispatch to avoid state pollution =
*/
> -     if (amdgpu_cs_ctx_create(device, &context_handle) !=3D 0) {
> -             igt_info("Failed to create context\n");
> -             return -1;
> -     }
> -
> -     /* Command buffer for PM4 packets */
> -     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -         AMDGPU_GEM_DOMAIN_GTT, 0, &bo_cmd, (void **)&ptr_cmd,
> &mc_cmd, &va_cmd) !=3D 0) {
> -             igt_info("Failed to allocate command buffer\n");
> -             ret =3D -1;
> -             goto cleanup_context;
> -     }
> -     memset(ptr_cmd, 0, 4096);
> -     base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
> -
> -     /* Shader buffer containing compiled ISA */
> -     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -                     AMDGPU_GEM_DOMAIN_VRAM, 0,
> -                     &bo_shader, &ptr_shader, &mc_shader, &va_shader) !=
=3D 0) {
> -             igt_info("Failed to allocate shader buffer\n");
> -             ret =3D -1;
> -             goto cleanup_cmd;
> -     }
> -     memset(ptr_shader, 0, 4096);
> -     /* Note: shader content should be copied by caller */
> -
> -     /* Destination buffer for shader output (CPU-visible) */
> -     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -                     AMDGPU_GEM_DOMAIN_GTT, 0,
> -                     &bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) !=3D =
0) {
> -             igt_info("Failed to allocate destination buffer\n");
> -             ret =3D -1;
> -             goto cleanup_shader;
> -     }
> -     *ptr_dst =3D 0; /* Initialize for verification */
> -
> -     /* Initialize compute dispatch state */
> -     amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, version);
> -     amdgpu_dispatch_write_cumask(base_cmd, version);
> -     amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, version, 0);
> -
> -     /* Program user data registers:
> -     * s[0:1] =3D source address (64-bit)
> -     * s[2:3] =3D destination address (64-bit)
> -     */
> -     base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG,
> 4));
> -     base_cmd->emit(base_cmd, 0x240); /* SH0 register offset */
> -     base_cmd->emit(base_cmd, src_mc_addr & 0xFFFFFFFF);
> -     base_cmd->emit(base_cmd, src_mc_addr >> 32);
> -     base_cmd->emit(base_cmd, mc_dst & 0xFFFFFFFF);
> -     base_cmd->emit(base_cmd, mc_dst >> 32);
> -
> -     /* Dispatch compute shader with 1x1x1 workgroup */
> -     base_cmd->emit(base_cmd,
> PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
> -     base_cmd->emit(base_cmd, 0x10); /* Dispatch initiator */
> -     base_cmd->emit(base_cmd, 1);    /* dim_x */
> -     base_cmd->emit(base_cmd, 1);    /* dim_y */
> -     base_cmd->emit(base_cmd, 1);    /* dim_z */
> -     base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
> -
> -     /* Submit command buffer */
> -     bos[0] =3D bo_cmd;
> -     bos[1] =3D bo_shader;
> -     bos[2] =3D bo_dst;
> -     if (amdgpu_bo_list_create(device, 3, bos, NULL, &bo_list) !=3D 0) {
> -             igt_info("Failed to create BO list\n");
> -             ret =3D -1;
> -             goto cleanup_dst;
> -     }
> -
> -     ib_info.ib_mc_address =3D mc_cmd;
> -     ib_info.size =3D base_cmd->cdw;
> -     ib_req.ip_type =3D AMDGPU_HW_IP_COMPUTE;
> -     ib_req.ring =3D 0;
> -     ib_req.resources =3D bo_list;
> -     ib_req.number_of_ibs =3D 1;
> -     ib_req.ibs =3D &ib_info;
> -     ib_req.fence_info.handle =3D NULL;
> -
> -     if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) !=3D 0) {
> -             igt_info("Failed to submit CS\n");
> -             ret =3D -1;
> -             goto cleanup_bo_list;
> -     }
> -
> -     /* Wait for completion */
> -     fence.context =3D context_handle;
> -     fence.ip_type =3D AMDGPU_HW_IP_COMPUTE;
> -     fence.ip_instance =3D 0;
> -     fence.ring =3D 0;
> -     fence.fence =3D ib_req.seq_no;
> -
> -     if (amdgpu_cs_query_fence_status(&fence,
> AMDGPU_TIMEOUT_INFINITE, 0, &expired) !=3D 0) {
> -             igt_info("Fence wait failed\n");
> -             ret =3D -1;
> -             goto cleanup_bo_list;
> -     }
> -
> -     if (!expired) {
> -             igt_info("Fence not expired\n");
> -             ret =3D -1;
> -             goto cleanup_bo_list;
> -     }
> -
> -     /* Verify result */
> -     if (*ptr_dst !=3D expected_value) {
> -             igt_info("Result mismatch: got 0x%x, expected 0x%x\n", *ptr=
_dst,
> expected_value);
> -             ret =3D -1;
> -     } else {
> -             igt_info("Dispatch successful: got expected value 0x%x\n", =
*ptr_dst);
> -     }
> -
> -cleanup_bo_list:
> -     amdgpu_bo_list_destroy(bo_list);
> -cleanup_dst:
> -     amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
> -cleanup_shader:
> -     amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, 4096);
> -cleanup_cmd:
> -     amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
> -cleanup_context:
> -     amdgpu_cs_ctx_free(context_handle);
> -
> -     return ret;
> -}
> -
>  int amdgpu_dispatch_shader(amdgpu_device_handle device,
>                          const struct amdgpu_dispatch_shader_req *req)  {=
 diff --git
> a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> index 8890e99b4..39b6a6fbd 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
> @@ -35,13 +35,6 @@ int amdgpu_dispatch_write_cumask(struct
> amdgpu_cmd_base *base_cmd, uint32_t vers
>
>  int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t
> shader_addr, uint32_t version, enum cmd_error_type err);
>
> -int execute_compute_dispatch(amdgpu_device_handle device,
> -                                uint32_t version,
> -                                uint64_t shader_mc_addr,
> -                                uint64_t src_mc_addr,
> -                                uint64_t dst_mc_addr,
> -                                uint32_t expected_value);
> -
>  /**
>   * struct amdgpu_dispatch_shader_req - Description of a generic compute =
dispatch
>   * @version: GPU version used for the compute state init (9/10/11/12) di=
ff --git
> a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c index
> eef869b41..b924d66bf 100644
> --- a/tests/amdgpu/amd_mem.c
> +++ b/tests/amdgpu/amd_mem.c

execute_shader_verification() no longer assembles shader code; assembly is =
handled internally by amdgpu_compute_copy_dword(). Please update the functi=
on comment - remove references to "assembles the shader code" and describe =
what it actually does now, e.g. dispatching a CopyDword compute shader and =
verifying the readback values.
> @@ -2803,105 +2803,52 @@ static int
> execute_shader_verification(amdgpu_device_handle device,
>                                     uint32_t expected_value1,
>                                     uint32_t expected_value2)
>  {
> -     struct amdgpu_gpu_info info =3D {0};
> -     char mcpu[32];
> -     uint8_t isa_bin[4096];
> -     size_t isa_sz =3D 0;
> -     int r_asm;
> -     uint32_t version =3D 9;
> -
> -     amdgpu_bo_handle bo_shader1 =3D NULL, bo_shader2 =3D NULL;
> -     void *ptr_shader1 =3D NULL, *ptr_shader2 =3D NULL;
> -     uint64_t mc_shader1 =3D 0, mc_shader2 =3D 0;
> -     amdgpu_va_handle va_shader1 =3D 0, va_shader2 =3D 0;
> +     const uint64_t src1 =3D vram_mc_addr + vram_offset;
> +     const uint64_t src2 =3D vram_mc_addr + vram_offset + sizeof(uint64_=
t);
> +     amdgpu_bo_handle bo_dst =3D NULL;
> +     volatile uint32_t *ptr_dst =3D NULL;
> +     uint64_t mc_dst =3D 0;
> +     amdgpu_va_handle va_dst =3D 0;
>       int ret =3D 0;
>
> -     /* Query GPU information for architecture-specific setup */
> -     if (amdgpu_query_gpu_info(device, &info) !=3D 0) {
> -             igt_info("Query GPU info failed\n");
> -             return -1;
> -     }
> -
> -     amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
> -     igt_info("Assembling shader for architecture: %s\n", mcpu);
> -
> -     /* Assemble shader code */
> -     r_asm =3D amdgpu_llvm_assemble(mcpu, CopyDwordIsa, isa_bin,
> sizeof(isa_bin), &isa_sz);
> -     if (r_asm !=3D 0 || isa_sz =3D=3D 0) {
> -             igt_info("Shader assembly failed (error=3D%d, size=3D%zu)\n=
", r_asm,
> isa_sz);
> +     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> +                             AMDGPU_GEM_DOMAIN_GTT, 0,
> +                             &bo_dst, (void **)&ptr_dst, &mc_dst, &va_ds=
t) !=3D 0) {
> +             igt_info("Failed to allocate destination buffer\n");
>               return -1;
>       }
>
> -     /* Determine GPU version for register programming */
> -     if (FAMILY_IS_GFX1200(info.family_id)) {
> -             version =3D 12;
> -     } else if (FAMILY_IS_GFX1150(info.family_id) ||
> -            FAMILY_IS_GFX1100(info.family_id) ||
> -            FAMILY_IS_GFX1036(info.family_id) ||
> -            FAMILY_IS_GFX1037(info.family_id) ||
> -            FAMILY_IS_YC(info.family_id) ||
> -            info.family_id =3D=3D FAMILY_GFX1103) {
> -             version =3D 11;
> -     } else if (FAMILY_IS_AI(info.family_id) ||
> -            FAMILY_IS_RV(info.family_id) ||
> -            FAMILY_IS_NV(info.family_id) ||
> -            info.family_id =3D=3D FAMILY_VGH) {
> -             version =3D 10;
> -     }
> -
> -     igt_info("Using GPU version %u for family 0x%x\n", version, info.fa=
mily_id);
> -
>       /* First dispatch - verify word_before value */
>       igt_info("=3D=3D=3D First dispatch: reading word_before =3D=3D=3D\n=
");
> -
> -     /* Allocate separate shader buffer for first dispatch */
> -     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -                             AMDGPU_GEM_DOMAIN_VRAM, 0,
> -                             &bo_shader1, &ptr_shader1, &mc_shader1,
> &va_shader1) !=3D 0) {
> -             igt_info("Failed to allocate first shader buffer\n");
> -             return -1;
> -     }
> -     memset(ptr_shader1, 0, 4096);
> -     memcpy(ptr_shader1, isa_bin, isa_sz);
> -
> -     if (execute_compute_dispatch(device, version, mc_shader1,
> -                              vram_mc_addr + vram_offset,
> -                             0, /* dst allocated in helper */
> -                             expected_value1) !=3D 0) {
> +     *ptr_dst =3D 0;
> +     if (amdgpu_compute_copy_dword(device, src1, mc_dst) !=3D 0) {
>               igt_info("First dispatch failed\n");
>               ret =3D -1;
> +             goto out;
>       }
> -
> -     amdgpu_bo_unmap_and_free(bo_shader1, va_shader1, mc_shader1,
> 4096);
> -
> -     /* Only proceed if first dispatch succeeded */
> -     if (ret !=3D 0) {
> -             return ret;
> +     if (*ptr_dst !=3D expected_value1) {
> +             igt_info("First result mismatch: got 0x%x, expected 0x%x\n"=
,
> +                      *ptr_dst, expected_value1);
> +             ret =3D -1;
> +             goto out;
>       }
>
>       /* Second dispatch - verify word_after value */
>       igt_info("=3D=3D=3D Second dispatch: reading word_after =3D=3D=3D\n=
");
> -
> -     /* Allocate separate shader buffer for second dispatch */
> -     if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -                             AMDGPU_GEM_DOMAIN_VRAM, 0,
> -                             &bo_shader2, &ptr_shader2, &mc_shader2,
> &va_shader2) !=3D 0) {
> -             igt_info("Failed to allocate second shader buffer\n");
> -             return -1;
> -     }
> -     memset(ptr_shader2, 0, 4096);
> -     memcpy(ptr_shader2, isa_bin, isa_sz);
> -
> -     if (execute_compute_dispatch(device, version, mc_shader2,
> -                              vram_mc_addr + vram_offset + sizeof(uint64=
_t),
> -                             0, /* dst allocated in helper */
> -                             expected_value2) !=3D 0) {
> +     *ptr_dst =3D 0;
> +     if (amdgpu_compute_copy_dword(device, src2, mc_dst) !=3D 0) {
>               igt_info("Second dispatch failed\n");
>               ret =3D -1;
> +             goto out;
> +     }
Since execute_shader_verification() delegates to amdgpu_compute_copy_dword(=
), which handles LLVM assembly internally via copy_dword_shader_get(), the =
caller-side wrapper is redundant, like this
if (amdgpu_llvm_asm_init() =3D=3D 0) {
    execute_shader_verification(...);
    amdgpu_llvm_asm_shutdown();
} else {
    igt_info("LLVM assembler unavailable; skipping shader verification.\n")=
;
}

Please call execute_shader_verification() directly and let the helper repor=
t failure when LLVM or the compute IP block is unavailable. This removes du=
plicate init/shutdown and keeps LLVM lifecycle in one place.

Regards
Jesse

> +     if (*ptr_dst !=3D expected_value2) {
> +             igt_info("Second result mismatch: got 0x%x, expected 0x%x\n=
",
> +                      *ptr_dst, expected_value2);
> +             ret =3D -1;
>       }
>
> -     amdgpu_bo_unmap_and_free(bo_shader2, va_shader2, mc_shader2,
> 4096);
> -
> +out:
> +     amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
>       return ret;
>  }
>
> --
> 2.34.1

