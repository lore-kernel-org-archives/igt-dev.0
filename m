Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FABD10FC465
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 01:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0910E70D;
	Thu,  9 Apr 2026 01:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="21ukY/eF";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64FC10E70D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 01:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCSwkWASsfHcUv8wcvbRNn3yLhxO2bHR8lDAdmVMgaaZ3WlT7niyIBPrA/g6l6nmO5BQ7ruzE57lE3V4ZnKz2EEiE5usEq/OMuX3hoTIOGZdDmH2hvp8RBmJ7kOfcLNwIh5bcGvz9lSKVpa1eOPldnj3nApAA2I1QjpM9ht2m7eDeHuzfwyE9RFR0XqRABOeJFfMp0+OlGXDkGUlKai7CBdY2xKr2aCdSXJWX5QY3++orzU/vxex7X11A4tmnOlGpxfnQ3GQPxO5DpRmZW5G/wo1pPp3lM6MKb/e00d+D48/X4s3FeCBlnnMKTXaRdCYEQ2iiQykqt7iyuxxffviyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vILBxieKAlh0zswQB7npEZC70lDnCTDHEF/GfpXLi6A=;
 b=nwiCnI/+Jl2GG4uXfZHgdsAzOzhFf/7uWMNAMnFpxxbI6hOFMaI1MuM3SVPjQZDELloAYBBJL4Puy7Od0HQeYsYNgg005SP8B454566jw8ghluZ1MfDs9DWrBJQsajdaAhnyuusV/YV64VgGh9qvhl6pIHytbRflI0TMKqtUQcFLztwUCy3v1uztMTBG3gc5JbK93M81rC4oN0lFG/UmexzPohGWPlIjWCgbYyuJn+83w4gASS9qEL+CSRVMWJsBuz092R9Xwcgpln5z+BXlGZfL2mqZhUiVOSi8zGF8ALhkcT0ANNNJTLcz709Hiuc41R7pDarlYStXO2aiDmR/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vILBxieKAlh0zswQB7npEZC70lDnCTDHEF/GfpXLi6A=;
 b=21ukY/eFNQqto5DR0o0EuIJK6AmyD8q13mTURtPWevQJK9urTLV578F5dE305Ev9JbkTTcnfOz2c2nmpe5IvYfq11N29e/5l0KdEm7z8z4mnkv0aZBk5ZHUK/Z4839fZI8V2xoPyKuJByIuzcFB6Z0VdShEpU6l/rR1UNkiSe+g=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 01:57:54 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 01:57:54 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] lib/amdgpu: fix sched_mask leak on igt_assert failure in
 dispatch tests
Thread-Topic: [PATCH] lib/amdgpu: fix sched_mask leak on igt_assert failure in
 dispatch tests
Thread-Index: AQHcx8JRhsNxbIDUnkmRZ8uBaTM4O7XV9tNg
Date: Thu, 9 Apr 2026 01:57:53 +0000
Message-ID: <DM4PR12MB51524E56A5A5FE638D078960E3582@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260409014335.79604-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260409014335.79604-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-04-09T01:49:59.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SJ5PPFDDE56F72B:EE_
x-ms-office365-filtering-correlation-id: 048812b3-b8e3-4ac3-13d3-08de95db69d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info: x3/LnzibXFFY9llrK/jmMmHusSwQKH9Iuq773WbgbU4d8rySZIry5IEH0Q8znHRFNbDNcD4zysUz9w9nGL0+clkhXq0BALGYm8DJ8lHXyWQ4fJvACVA7TVmlsD0he8O1JyECzg1gqXPJovHoexhf0NPufzz+stWMbiePyp2QLzUrPz5BO2Z6Ul1YAfLCWW2r1X7KuBooalyAWv46nnvAZaND1LnGDFUiib729reovAR0jrPqc6RZU9RCoQ30O4lRN9w1ndMk/1Fx8s2no8OJeCmuUYTPXBZwSHiNNdU6Q9OL+VAnDvo52kkt5kRBA1i1cEtAX+V2m3/Fh1pJGEofZN7Ma2VNVZC2wNAeVmySV8h1+1y+6orODvDRpqZrvi06bBdJjwwT0hL2jgcHNRQ8DkzQTOuPRAKUfmmyicMoU4N4IJJJ9sVgiu9IM0emblnxYyfX2FSS2eYR1gXZC/rVXK1iw2755zQSpEwBhw9725cKCHkcCLMZc5dR/QF5RQu25TIpW48zAg+s9h2KNaRBiHJjxt8GIOL+hReVDm1n2XW88ujj9bTVbBdZw4QjvfZ73Q0udkVMBwKgr2EDOk5JVCzKRdUvv2WBsKUjS7Ln1vxG499SekTYD0vnHPh7ocjV3BlNBYBjzq/DXCzUdTVaCQlHFHeg+aA3Ol2VEdeXbe9rceawCXArzrd0NWw0FXdSxUdomc++7VZBm2BzjPqRB0bJzP37lMGpF72W/BsboKmhxaKUf90G5Y3peyZ8Rl7YgrnkfCrqXS1FYD+CgphwK/tY5lNFGr0caZuZdzh3fq4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dzNdEzMrV20mN6rKwMWOodN6EzRkNQriUgiJQfG3nQG0aBFpJGUtMH+HPa?=
 =?iso-8859-1?Q?u1Rpw92vUJITcFF+m2y1KYMGXA+3LUepU9X8L/RhjUjJ6GVbRE9wu7V/vt?=
 =?iso-8859-1?Q?GNV5FmCWzQDBdiL4jkvnIkDkZGzKo48t/fIDhFoN+vYa2LSOVk0ROKBuMA?=
 =?iso-8859-1?Q?ueiPRd71LItTvCHF4PreAQHhvhrSTM5AJvYqVP/isaBRnpBZU/6+k8XfKy?=
 =?iso-8859-1?Q?vNNsrmzO5qUfp9qlmEywzKTb7QcWMxcDJdZQXZhj8F+YcA1+AaLCzxXTTK?=
 =?iso-8859-1?Q?Np4zCIdmcRwLyNb0EGxtjpl7+KsxxVWcYpQifHzXgVj9lk12t4lz1S427e?=
 =?iso-8859-1?Q?vPZHY8AVz3t7C6N4+W3icGKu7MX9atQ3Kn/ChSsgvZSOUm2tlCYRi3CGSm?=
 =?iso-8859-1?Q?K0WN4PuPr55uayccMDUl1D30Ulb71W88vV9h6TCgOt17Jzlzq37TnX1NYq?=
 =?iso-8859-1?Q?l8Tp+/1eD+5mnYKoP+7XqqXnftte6WwIg8I7cYrx+bs7VH2cniphgnsKz9?=
 =?iso-8859-1?Q?7IRl2Lv88uO04KYbP4VqIQAJ85ZuMz2vmOgdxM2X6T8Zk0S03WRyFAxZDd?=
 =?iso-8859-1?Q?zWRidItxIxedvPB1QoW/xjMOEIjD17UDFORYpg+DAfrVHQcEZYw4Oh//ek?=
 =?iso-8859-1?Q?Qug8ueZw5NO07GzT2Ywg2YU9VdysxGBJI0WnjH786gUa32ozHONXfK513q?=
 =?iso-8859-1?Q?aGXVWlNWpYyc13++TJ/nySLYpTfFuT3TqjVd1SPf+iw5LwzkXTd1Xkzd70?=
 =?iso-8859-1?Q?6+pIzSARapjWkh7n/4319L2LTHJfQp+rOG33kLvFHq7bs+zQI5E8bjDycu?=
 =?iso-8859-1?Q?znvJ7cDYKBP60Y54k1+d21DSiCAz6ot+bd8IyUK/xAVk/PPsXp/ZJbwnzF?=
 =?iso-8859-1?Q?4VJPxrkc3Rq0tRfbAgUAMM/4CuGqiGFthCz4+lXYqLhKtYnJpOtVKrN25x?=
 =?iso-8859-1?Q?P607jPWSoObEDuPwtv1/n/WLRK2cSWA4FKKDRwzAN8qXydIrjAScAWhjBD?=
 =?iso-8859-1?Q?Qs3WxY7iHoMulEX/Yn/lZwvgfUmbjq5PXGEyXSwhhh6cI2pyYuiIs+FPl3?=
 =?iso-8859-1?Q?AR0//EDQpsUmDuB3VRJ8RdXlCdTrTFWFiDil0lHWHvSpP0aFTrC62Z7Gj2?=
 =?iso-8859-1?Q?Jd4eYqrVkXhR8WgtaNpGjZuOo4Pncagn0T5DMBX2GiKU4UM17TOZNKZc/T?=
 =?iso-8859-1?Q?SnGBVVQs5D9JpOVfPjLzFIeYcA/4GYVaJ1mkZzmdtyU3tj+jyG8VYBUAeR?=
 =?iso-8859-1?Q?/5f6Zzm4h45mBQSE5hs4d2vy4RqX9g6yKGIB8IwnO3IYvCm3pWrY1PG0bO?=
 =?iso-8859-1?Q?xk4+9SlphGTp8jBXx6wtYVlKxkXSI0KfIyaagexQXpN3ITz93sdV3ycoB2?=
 =?iso-8859-1?Q?6jdu/J/Y5dsHvbUJbgEMyuloTfyLtHNzOw0uL5Mu7hsS1qvJxbN5sylVw+?=
 =?iso-8859-1?Q?pJDNE0jG1y209WrTfMd8vuPdm0ebS+PTp6kSACxq47MIYfNWkVxLIaXBa5?=
 =?iso-8859-1?Q?kfrCPnp9Q5iZ46aX6Z3pqzb59+lrbCJQJ7FLzwcgLkQltIzIifnupFT4YN?=
 =?iso-8859-1?Q?7Py3/JGr+u2qtx5acvE2/9TrFmq8DmaQ+HUkT/yiA4kX8CPn6RGTqWCxvt?=
 =?iso-8859-1?Q?Voh92SzAiQSYJrCDHhdQE46BSNdea0mLjhQtGoe+Rf86KrvmuVJlqNkP1r?=
 =?iso-8859-1?Q?VaIvJ9iKnxWWEPCCjT5HSCzjzAeYxBQV4vu84KdG1aQX2fJ/PB3VjBfXiE?=
 =?iso-8859-1?Q?AvKqzkSFmKaoILKiQnCHXowf+RvpIoIiSOEGgRsvu3A4Zs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048812b3-b8e3-4ac3-13d3-08de95db69d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 01:57:53.8907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaNcLRkwSfE8aypJjujg796cK+5AzOtRfsqCIlA7bwC1pBliT5Gv6O34X38YnoQZ3drXAdUVwNdB/8AzYiqBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B
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

This patch look good for me.
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>


> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Thursday, April 9, 2026 9:43 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Pelloux-Prayer, Pierre-Eric
> <Pierre-eric.Pelloux-prayer@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH] lib/amdgpu: fix sched_mask leak on igt_assert failure in=
 dispatch
> tests
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> amdgpu_dispatch_hang_slow_helper() and amdgpu_gfx_dispatch_test() isolate
> individual compute/gfx rings by writing a single-bit mask to the sysfs sc=
hed_mask
> file.  The original mask is restored at the end of the function, after th=
e ring iteration
> loop.
>
> When any igt_assert fires inside the loop body (or in called dispatch hel=
pers like
> amdgpu_memcpy_dispatch_hang_slow_test), IGT's failure path
> igt_fail() -> exit_subtest() -> siglongjmp() unwinds directly back to the=
 subtest entry
> point in igt_subtest_with_dynamic, completely bypassing the mask restore =
code.
> This leaves all-but-one hardware ring permanently disabled for the remain=
der of the
> test process.
>
> Subsequent subtests then see the drm_gpu_scheduler report ready=3Dfalse f=
or the
> disabled engines, which can lead to NULL-pointer dereferences in the kern=
el
> scheduler when attempting to pick a fence from a disabled ring.
>
> Fix this with a three-layer safety net:
>
> 1. igt_install_exit_handler() -- a file-scoped exit handler registered
>    once, which runs automatically during igt_exit() and on fatal signals.
>    If the mask is still dirty (not restored), the handler writes the
>    original mask back to sysfs.
>
> 2. Lazy restore at function entry -- sched_mask_arm() checks whether a
>    prior subtest left the mask dirty and restores it before proceeding.
>    This protects subsequent subtests within the same test binary.
>
> 3. Normal restore path unchanged -- the existing code at function end
>    still runs on the happy path and now clears the dirty flag on success.
>
> The static variables (sched_mask_sysfs, sched_mask_saved, sched_mask_dirt=
y)
> are file-scoped and shared between both functions, which is safe because
> igt_runner executes tests sequentially (no parallel subtests).
>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch.c | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c
> b/lib/amdgpu/compute_utils/amd_dispatch.c
> index 23c15ef1b..138222cde 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch.c
> @@ -12,6 +12,51 @@
>  #include "amdgpu/amd_ip_blocks.h"
>  #include "amdgpu/shaders/amd_shaders.h"
>
> +/*
> + * Static state for sched_mask cleanup on abnormal subtest exit.
> + *
> + * When amdgpu_dispatch_hang_slow_helper() or
> +amdgpu_gfx_dispatch_test()
> + * isolate a single compute/gfx ring via sysfs sched_mask, an
> +igt_assert
> + * failure inside the dispatch helpers triggers siglongjmp() back to
> +the
> + * subtest entry point, bypassing the mask restore at the end of the
> + * function.  This leaves all other HW rings disabled, which causes
> + * drm_sched to see ready =3D=3D false and can lead to NULL-pointer
> + * dereferences on subsequent tests.
> + *
> + * Saving the original mask in file-scoped variables and registering an
> + * IGT exit handler guarantees restoration on both normal and abnormal
> + * exit paths (siglongjmp, signals, process exit).
> + */
> +static char sched_mask_sysfs[256];
> +static long sched_mask_saved;
> +static bool sched_mask_dirty;
> +
> +static void sched_mask_exit_handler(int sig) {
> +     char cmd[1024];
> +
> +     if (!sched_mask_dirty)
> +             return;
> +
> +     sched_mask_dirty =3D false;
> +     snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",
> +              sched_mask_saved, sched_mask_sysfs);
> +     system(cmd);
> +}
> +
> +static void sched_mask_arm(const char *sysfs, long mask) {
> +     /* If a prior subtest left the mask dirty, restore it first */
> +     if (sched_mask_dirty)
> +             sched_mask_exit_handler(0);
> +
> +     strncpy(sched_mask_sysfs, sysfs, sizeof(sched_mask_sysfs) - 1);
> +     sched_mask_sysfs[sizeof(sched_mask_sysfs) - 1] =3D '\0';
> +     sched_mask_saved =3D mask;
> +     sched_mask_dirty =3D true;
> +     igt_install_exit_handler(sched_mask_exit_handler);
> +}
> +
>  static void
>  amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>                           uint32_t ip_type, uint32_t priority, @@ -687,6 =
+732,9 @@
> amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>               sched_mask =3D 1;
>       }
>
> +     if (sched_mask > 1)
> +             sched_mask_arm(sysfs, sched_mask);
> +
>       for (ring_id =3D 0; (0x1 << ring_id) <=3D sched_mask; ring_id++) {
>               /* check sched is ready is on the ring. */
>               if (!((1 << ring_id) & sched_mask))
> @@ -733,6 +781,7 @@
> amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>               snprintf(cmd, sizeof(cmd) - 1, "sudo echo
> 0x%lx > %s",sched_mask, sysfs);
>               r =3D system(cmd);
>               igt_assert_eq(r, 0);
> +             sched_mask_dirty =3D false;
>       }
>  }
>
> @@ -769,6 +818,9 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle
> device_handle, uint32_t ip_ty
>               }
>       }
>
> +     if (sched_mask > 1)
> +             sched_mask_arm(sysfs, sched_mask);
> +
>       for (ring_id =3D 0; (0x1 << ring_id) <=3D sched_mask; ring_id++) {
>               /* check sched is ready is on the ring. */
>               if (!((1 << ring_id) & sched_mask))
> @@ -811,6 +863,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle
> device_handle, uint32_t ip_ty
>               snprintf(cmd, sizeof(cmd) - 1, "sudo echo
> 0x%lx > %s",sched_mask, sysfs);
>               r =3D system(cmd);
>               igt_assert_eq(r, 0);
> +             sched_mask_dirty =3D false;
>       }
>  }
>
> --
> 2.53.0

