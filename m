Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44730EEE27A
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 02:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CD610EC2D;
	Fri, 13 Sep 2024 02:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BFjpYAJJ";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA710EC2D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 02:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kfn+C8Ui5aEiT5hvpYB/AlpAgfaASxfY8R7fZLro9VxG7wFB8wOOPRnkbHJPUFR6Mzf/L46aPIrDujoPUsTFNz14q+H4uKjGU7JM/HhnnAni4ziPmbrDLN3E6ko0DciRtBF5ld3diUcNCPsnf/3fgxLwsnGVfE41HWnsbLb0cvkFVDgtjdnjF14yVOxSGhb9d51DbdzU4Jx4fVzjdJMU0bEHsX3MpnfXSf2Fjzo0nm3IXcirUD5D3m1+Xo4HHXPi3KBd5QMkXh6oLaCsvkLkzhsQ3wvYd0dJUgKb3KpjlsZGlLyijHqGnpmekqFY51L25vnFYPQa1DCp6BDemQr5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/S82S+u7DjWDgT2SDOlQEDpE/r1WRA3n0zAE+cArA0=;
 b=cfE6AbnEu6PKFC9/vuPtygJt/q2RS5ZRQNYtWfseXK1m/HAzuH9f3gMX+iTFJkHHsdXvFpZGS/xkAWhx6Qhuydpwur95xXaeP7C6ndxTQRaukypKNhR/o5YIMlaQSLiXyzwssmJ1TSXKzaG13oigSmbMG8fChTK58YaktQ4jBzUJnsWhxQCfIcp6/BzNUBi3TCCQmccRJJBZV7IHmQHU1Fk9yJqzqwZiGPpVN02wj4oLgL4ipnAfaESgDcf+CeHRz2Ga5Py32GRJULye7NytUfObG0p1ZrjohLuIqYVsDkBlrkNw/HGWjoMMSXgqyRsSOfqPNN8l2HOz0fPRU52GCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/S82S+u7DjWDgT2SDOlQEDpE/r1WRA3n0zAE+cArA0=;
 b=BFjpYAJJHf9hBMZ7Oxue6dUCiB+fGxWc8rRdMpqztBaar063jWw0Skdhpd46Es6/NLQvVrDfR3ymCbvaIUd2435hhHOB6rxd6k+j6voCDJKeucXqKRSIksvxe+tNM/CJ+zi1MS1/Z9VTLuccwQgUVs+yxWWXl42vxF1cnhzqoq4=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 02:28:05 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%5]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 02:28:04 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] tests/amd_queue_reset: add expected error codes
Thread-Topic: [PATCH] tests/amd_queue_reset: add expected error codes
Thread-Index: AQHbBW5lA/5gK9FdNkmMh8UKjtHvtrJU/YVQ
Date: Fri, 13 Sep 2024 02:28:04 +0000
Message-ID: <DM4PR12MB515234181CAB95A20CF87CE7E3652@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240912234908.450480-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240912234908.450480-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=002f2ecc-ba29-4bd4-8b70-e65da1eb9939;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-13T02:25:26Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SA1PR12MB8599:EE_
x-ms-office365-filtering-correlation-id: 980f5beb-7a9e-4f2f-f7a3-08dcd39bb210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TmaAWZeTGZy4pc/sco6ActMZAgsRV4QuANaOAb9Ann5QMWhoQ3hOiEXMwkUK?=
 =?us-ascii?Q?s3lyzBr4HSgq6HRsOOiWe5AmOMgn4ck+DVDPQRvpLG+T0L5XZGAh8ZkvkYLi?=
 =?us-ascii?Q?CDj/I8YkU8AtVwnx/3YvNwXRtWJeBhXwFAjL8ToFAgSWbByzwIucP/54pdsL?=
 =?us-ascii?Q?RGbMKG6bd1/SURYzGyPC1UZZqFHmbPwR5AV5RtBD/Xs7SGWxlM0D32d+2jkV?=
 =?us-ascii?Q?7FC5VdYn7svK2+wofvY/PUzPYeLPI6agWtE4/Y2hROwfOqb/XJk5qD3hpcgc?=
 =?us-ascii?Q?aKdG05VpKl5MYiwYUwMGnsbrrjiCPlGScTKcvkuU52lAPGC9v3zD253BOldh?=
 =?us-ascii?Q?296Ft/bHH1M9pEFprn4eGUlFX9taKzX1fH6mIHueSnT5MosLC/+I65CJrhHa?=
 =?us-ascii?Q?enjlZQI0wppO+eQ5noky8qyn0AsmjrL7ve+uBl/o/UOJV3Hr/3Z1mWp0tLCX?=
 =?us-ascii?Q?bADCjiRmuAuyiJgyqKz6ZAJJ9lBKSEdwzhiFItBBzCWMCbEFXIImK9FLwEc6?=
 =?us-ascii?Q?2CpbNPiuNPEjyzKryStsaF64wA5RiDaMWY+2inrRJSncy7ajcTJplabpWs3k?=
 =?us-ascii?Q?OI5zfrUE45V10MeXpHs930wcn+wUcyKzMB2lV6FZhZr0ejhzj70+nBdS2w9+?=
 =?us-ascii?Q?Uw36W9jAKaU808Bw/pCDyI/ce5LoI+ZGyHlBgy9Uo5h4a0ps36f/ej170EjM?=
 =?us-ascii?Q?8YeMySfO/4QQLgiJLljjdZ/yKE5B5EMYGNGGJca2y1h2/+uPwvsBbnZ7Bw7I?=
 =?us-ascii?Q?KCywmyfiNuJZw4lVETQS1wFfxMK2PpfU93ZT3wV3rdqWYFVfQE/dS/jd5Pst?=
 =?us-ascii?Q?SDBsFg0yksFaU3FejAt3jZFYCiwJDbdUHZyTtoBtG5idMcT7W0rbwGQEaKXd?=
 =?us-ascii?Q?XvpKPHDlNMoScvKJGxoYGL0H1fJ1Ssxq6kqIuwBUChgKCEWQJuWBEb49R9QV?=
 =?us-ascii?Q?kAuW4DcuDHSL56M3soFSYJwgJ00v87JcyC+gJzHNi2epOiPBjWuLJtdIYJ+k?=
 =?us-ascii?Q?jiTIYkQ/SI6wbooKWJFTB5g38ioEAgK1sfBgedN304pO6j0A9GMCfAVbr/Ye?=
 =?us-ascii?Q?ygc7JfdPx3Gb/Rxi27HuDpfFEKImbdjR0n2hQhq57DAxjXopz7jFVF3lBUgl?=
 =?us-ascii?Q?Z2tgsHtZzi1mtFj1Hj75OnOPXWmgPtkvLSE+mPiBV2lVS2EJaZaib0Ufmsjy?=
 =?us-ascii?Q?ZsV2fEbtQcHnWwqUFpk81BELsuRbpd8WxRYER16Xm+NHj9PFBpXaPt6xynZ0?=
 =?us-ascii?Q?D7gVsHjjW5pGNxeeEAbj6EUj75I1JRvewvbmloGp18V+jIdBS3cYTmx4AsE5?=
 =?us-ascii?Q?DYo3xNG3WBl67y2zeMksBmCNC9zu3tTq8A8I1sJ45n9aTm9WK5V1Ep1rMmqx?=
 =?us-ascii?Q?ocSxp0oRH0NjatJFdxp4MZxR6ahZcyirOHYZXYo/9Lalo5gKug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LQkw4lov8I1JUe6wGMd4eICCTgRiUYi7WNqSKMu/TqMR0BagxKwN46iICBFa?=
 =?us-ascii?Q?7dlsqpWct8Cbdp6gy/xrwl6ZuAO+E52iKNS8yCMDY9aW7JJj7GcsJaimjuAr?=
 =?us-ascii?Q?c9uG0QgTNDLUQx4leaVqYKnPuvTYMwqU9Bv6OuPzEKj7TiYQmi8Rk6+rS/Sj?=
 =?us-ascii?Q?yr6u5LJEiKqCNmoVG9LBF0KCAWUqr2RPrQKIaIqCtToX+FmUaOEK9iGfPT1o?=
 =?us-ascii?Q?3Gno5t+aL5GaIuHhujGNBEN/GtJc/ybho490Ttn8ghEHt5ilm+BB7a3FkRCI?=
 =?us-ascii?Q?jihUrni8o5WXreQSuC53SqYNkx7IsedmtAPKO0taPF66MYnkSczdhRw0/Xbp?=
 =?us-ascii?Q?ZP5DQt/frUKEM9HffCFPA5hbYmaHdn/V7k9WWfWAwioOdlbZ0ltIMPs2YJr2?=
 =?us-ascii?Q?znd1xySvlMUiSX6cMZuSF6VRCGABuApkDkb06U4nusqtIp3SognpixZ9+M0D?=
 =?us-ascii?Q?DYV6JhDnCEunsVBqgRS+Z4l+Qkc5mvFpkCjv277+nTJ+ddmtQmPDrPpkGNl6?=
 =?us-ascii?Q?C8R8uVB1aW+L82rZYO5X3378i802ZSfhIOMSJeAB2+L4xBUMfNret/OBOdmB?=
 =?us-ascii?Q?TErUTrGJuW13SOtJvQyTSK3C32AxYeiulKzHfldsLJdo6d598f/PjSLuI0s0?=
 =?us-ascii?Q?HJMS3gxk/V2BRoiatw+LuW5SROGf1YxqTMlEngf36WPwSjJKCkCWeHJCeH80?=
 =?us-ascii?Q?3DSLHhtOqF4XR84L8sWmzlpi2qnRvaLn/XYAn5Vy7vJHY497E/BCW+HPmFHK?=
 =?us-ascii?Q?1U8EnwbKheBUgQeF2aWY0dLFxVMOPZ2QpRCMnoZP8+CFGySzo0RK6ysK046/?=
 =?us-ascii?Q?SmM0IryhHnZzUG5SGO/4Cob0Mknc2ia6VelcTJrohGBvq/0leBimiS6Nezjf?=
 =?us-ascii?Q?+8wmdeuKKpDiA69HvFPpPc9qeymB06CtMhDnnE/iADZ0qHSj5hF8wg4YFbCI?=
 =?us-ascii?Q?muP5C5SWLe6daxi/TsKr8pkja62VfINTmm8tN4OMB0sTmYSZWaAb0THua24U?=
 =?us-ascii?Q?tAVQqNZwbLHiDRBtuTNOrEnJkYpwgXHd7NMfxno3NuA4XKMjia7wheM+b9Oy?=
 =?us-ascii?Q?1HEtme2LLgymdOqxtIQO0NpINrhwMXUGVrIz8bngn2RchbEa6NbzDMwMOozQ?=
 =?us-ascii?Q?TTC46TGvBosB+GkAXUpSkFmyApjUT/A6/GBXegzPcno897cgI8TyfyJyRtUi?=
 =?us-ascii?Q?V9/2+0Ovvsa4L3thADYyGt7Nc7rvjAfL413L075shrfLBoJ5UrIJNKAqjC8C?=
 =?us-ascii?Q?Ozd/pgYkmgcLawmHAYS/M42VMW8wMaXt2+ZmM+uZjdqh22I3w0UaOx4DICZQ?=
 =?us-ascii?Q?ViMi4ZN2Ftb/QbNs0w5CigHND/US4nIlOGSvjhv8xkI7DBAQbk1x/iDdHGgU?=
 =?us-ascii?Q?zu/ZJHQFFEFCdlAebyfactAAZfrbZoMVq+B8ohjtsi3JF8dnKTH4WxDQguW5?=
 =?us-ascii?Q?H/wuhIfgYhH/S7l6VCFRflG0SMtYWs0z4Ca/O7vumTq4gcDROeOFi+jyL3zW?=
 =?us-ascii?Q?zYNpbzoP80babwpkpVeyT0FxHDt7FhLsdagYSVkMA500PmNiwQYSAL4QX7ru?=
 =?us-ascii?Q?jIJ/V3AcOUbtwo7JK7c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980f5beb-7a9e-4f2f-f7a3-08dcd39bb210
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 02:28:04.0586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBNjrsLkk5FHTFgYINN2NHW+L6+0YHeqHJFhWaUuweLE4HkJP/I349S0FV7r1BSFtcUqyNxxtql97cRWTq5oyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599
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

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Friday, September 13, 2024 7:49 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: add expected error codes

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The necessity for this change arose from the need to centralize and documen=
t expected behavior for specific error conditions.
This centralized approach allows for easier maintenance, making it quick an=
d simple to modify expected error codes, ensuring they do not block CI pipe=
lines. At this stage, we cannot enforce strict error codes, as we are still=
 addressing resilience issues related to failures in cs_submit.

Add expected reset codes for each error scenario and validate the return co=
de during the appropriate test execution. These error codes are part of a g=
lobal table, with separate codes declared for different IP blocks (compute,=
 GFX, SDMA).

Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 ++
 lib/amdgpu/amd_dispatch.c           | 46 +++++++++++++++++++----------
 lib/amdgpu/amd_dispatch.h           |  4 ++-
 lib/amdgpu/amd_ip_blocks.h          | 15 ++++++++++
 tests/amdgpu/amd_queue_reset.c      | 45 ++++++++++++++++++++--------
 5 files changed, 83 insertions(+), 29 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_s=
ubmission.c
index a0c72fb47..df278ad69 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -74,6 +74,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle devic=
e, unsigned int ip_type

        /* submit CS */
        r =3D amdgpu_cs_submit(ring_context->context_handle, 0, &ring_conte=
xt->ibs_request, 1);
+       ring_context->err_codes.err_code_cs_submit =3D r;
        if (expect_failure)
                igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
        else {
@@ -95,6 +96,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle devic=
e, unsigned int ip_type
        r =3D amdgpu_cs_query_fence_status(&fence_status,
                                         AMDGPU_TIMEOUT_INFINITE,
                                         0, &expired);
+       ring_context->err_codes.err_code_wait_for_fence =3D r;
        if (expect_failure) {
                igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d ex=
pired %d PID %d\n", r,  expired, getpid());
        } else {
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c index 0d=
e0ce816..5b4698a83 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -161,10 +161,13 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle devi=
ce_handle,

 int
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
-                           uint32_t ip_type, uint32_t ring, uint32_t versi=
on,
-                           enum cmd_error_type hang)
+                               amdgpu_context_handle context_handle_param,
+                               uint32_t ip_type, uint32_t ring, uint32_t v=
ersion,
+                               enum cmd_error_type hang,
+                               struct amdgpu_cs_err_codes *err_codes)
 {
-       amdgpu_context_handle context_handle;
+       amdgpu_context_handle context_handle_free =3D NULL;
+       amdgpu_context_handle context_handle_in_use =3D NULL;
        amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
        volatile unsigned char *ptr_dst;
        void *ptr_shader;
@@ -184,8 +187,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle devic=
e_handle,
        struct amdgpu_cs_fence fence_status =3D {0};
        struct amdgpu_cmd_base *base_cmd =3D get_cmd_base();

-       r =3D amdgpu_cs_ctx_create(device_handle, &context_handle);
-       igt_assert_eq(r, 0);
+       if (context_handle_param =3D=3D NULL) {
+               r =3D amdgpu_cs_ctx_create(device_handle, &context_handle_i=
n_use);
+               context_handle_free =3D context_handle_in_use;
+               igt_assert_eq(r, 0);
+       } else {
+               context_handle_in_use =3D context_handle_param;
+       }

        r =3D amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
                                    AMDGPU_GEM_DOMAIN_GTT, 0,
@@ -300,19 +308,22 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle devi=
ce_handle,
        ibs_request.number_of_ibs =3D 1;
        ibs_request.ibs =3D &ib_info;
        ibs_request.fence_info.handle =3D NULL;
-       r =3D amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-       igt_assert_eq(r, 0);
+       r =3D amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
+       if (err_codes)
+               err_codes->err_code_cs_submit =3D r;

        fence_status.ip_type =3D ip_type;
        fence_status.ip_instance =3D 0;
        fence_status.ring =3D ring;
-       fence_status.context =3D context_handle;
+       fence_status.context =3D context_handle_in_use;
        fence_status.fence =3D ibs_request.seq_no;

        /* wait for IB accomplished */
        r =3D amdgpu_cs_query_fence_status(&fence_status,
                                         AMDGPU_TIMEOUT_INFINITE,
                                         0, &expired);
+       if (err_codes)
+               err_codes->err_code_wait_for_fence =3D r;

        if (!hang) {
                igt_assert_eq(r, 0);
@@ -326,7 +337,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device=
_handle,
                        i++;
                }
        } else {
-               r2 =3D amdgpu_cs_query_reset_state(context_handle, &hang_st=
ate, &hangs);
+               r2 =3D amdgpu_cs_query_reset_state(context_handle_in_use, &=
hang_state,
+&hangs);
                igt_assert_eq(r2, 0);
        }

@@ -336,7 +347,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle devic=
e_handle,
        amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_siz=
e);
        amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
                                 bo_shader_size);
-       amdgpu_cs_ctx_free(context_handle);
+
+       if(context_handle_free)
+               amdgpu_cs_ctx_free(context_handle_free);
+

        return r;
 }
@@ -538,13 +552,13 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,
                return;
        }
        for (ring_id =3D 0; (1 << ring_id) & info.available_rings; ring_id+=
+) {
-               amdgpu_memcpy_dispatch_test(device_handle, ip_type,
-                                           ring_id,  version, BACKEND_SE_G=
C_SHADER_EXEC_SUCCESS);
+               amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
+                                           ring_id,  version, BACKEND_SE_G=
C_SHADER_EXEC_SUCCESS, NULL);
                amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_typ=
e,
                                                      ring_id, version, AMD=
GPU_CTX_UNKNOWN_RESET);

-               amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id=
,
-                                           version, BACKEND_SE_GC_SHADER_E=
XEC_SUCCESS);
+               amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, r=
ing_id,
+                                           version, BACKEND_SE_GC_SHADER_E=
XEC_SUCCESS, NULL);
        }
 }

@@ -570,8 +584,8 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle devi=
ce_handle, uint32_t ip_ty
        for (ring_id =3D 0; (1 << ring_id) & info.available_rings; ring_id+=
+) {
                amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id=
,
                                            version);
-               amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id=
,
-                                           version, hang);
+               amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, r=
ing_id,
+                                           version, hang, NULL);
        }
 }

diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h index 9a=
a7a1b78..89c448a1f 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -31,10 +31,12 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle devi=
ce_handle,
                              uint32_t ip_type, enum cmd_error_type hang);

 int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+                                       amdgpu_context_handle context_handl=
e,
                                        uint32_t ip_type,
                                        uint32_t ring,
                                        uint32_t version,
-                                       enum cmd_error_type hang);
+                                       enum cmd_error_type hang,
+                                       struct amdgpu_cs_err_codes *err_cod=
es);

 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
                                      uint32_t ip_type);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
3e729f4c0..161f841cf 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -57,15 +57,29 @@ struct asic_id_filter
        int chip_id_end;
 };

+/* expected reset result for differant ip's */ struct reset_err_result
+{
+       int compute_reset_result;
+       int gfx_reset_result;
+       int sdma_reset_result;
+};
+
 struct dynamic_test{
        enum cmd_error_type test;
        const char *name;
        const char *describe;
        struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTE=
R];
+       struct reset_err_result result;
 };

 #define for_each_test(t, T) for(typeof(*T) *t =3D T; t->name; t++)

+/* set during execution */
+struct amdgpu_cs_err_codes {
+       int err_code_cs_submit;
+       int err_code_wait_for_fence;
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */  stru=
ct amdgpu_ring_context {

@@ -112,6 +126,7 @@ struct amdgpu_ring_context {

        struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
        struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_stat=
us */
+       struct amdgpu_cs_err_codes err_codes;
 };


diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index 177a22b3e..b6fe0e64e 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -44,6 +44,7 @@ struct job_struct {
        unsigned int error;
        enum amd_ip_block_type ip;
        unsigned int ring_id;
+       int reset_err_result;
        /* additional data if necessary */
 };

@@ -306,7 +307,8 @@ static void wait_for_complete_iteration(struct shmbuf *=
sh_mem)

 static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error=
,
                enum amd_ip_block_type ip_good, enum amd_ip_block_type ip_b=
ad,
-               unsigned int ring_id_good, unsigned int ring_id_bad)
+               unsigned int ring_id_good, unsigned int ring_id_bad,
+               const struct reset_err_result *result)
 {
        char error_str[128];
        char ip_good_str[64];
@@ -324,8 +326,16 @@ static void set_next_test_to_run(struct shmbuf *sh_mem=
, unsigned int error,
        sh_mem->bad_job.error =3D error;
        sh_mem->bad_job.ip =3D ip_bad;
        sh_mem->bad_job.ring_id =3D ring_id_bad;
+       if (ip_bad =3D=3D AMD_IP_GFX)
+               sh_mem->bad_job.reset_err_result =3D result->gfx_reset_resu=
lt;
+       else if (ip_bad =3D=3D AMD_IP_COMPUTE)
+               sh_mem->bad_job.reset_err_result =3D result->compute_reset_=
result;
+       else
+               sh_mem->bad_job.reset_err_result =3D result->sdma_reset_res=
ult;
+
        sh_mem->good_job.error =3D CMD_STREAM_EXEC_SUCCESS;
        sh_mem->good_job.ip =3D ip_good;
+       sh_mem->good_job.reset_err_result =3D 0;
        sh_mem->good_job.ring_id =3D ring_id_good;
        sh_mem->sub_test_is_skipped =3D false;
        sh_mem->sub_test_is_existed =3D true;
@@ -482,7 +492,7 @@ is_sub_test_queue_reset_enable(const struct amdgpu_gpu_=
info *gpu_info,  static int  amdgpu_write_linear(amdgpu_device_handle devic=
e, amdgpu_context_handle context_handle,
                const struct amdgpu_ip_block_version *ip_block,
-               const struct job_struct *job)
+               const struct job_struct *job, struct amdgpu_cs_err_codes *e=
rr_codes)
 {
        const int pm4_dw =3D 256;
        struct amdgpu_ring_context *ring_context; @@ -527,6 +537,8 @@ amdgp=
u_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h

        r =3D amdgpu_test_exec_cs_helper(device, ip_block->type, ring_conte=
xt,
                        expect_failure);
+       err_codes->err_code_cs_submit =3D ring_context->err_codes.err_code_=
cs_submit;
+       err_codes->err_code_wait_for_fence =3D
+ring_context->err_codes.err_code_wait_for_fence;

        amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
                        ring_context->bo_mc, ring_context->write_length * s=
izeof(uint32_t)); @@ -646,6 +658,7 @@ run_test_child(amdgpu_device_handle d=
evice, amdgpu_context_handle *arr_context,

        struct job_struct job;
        const struct amdgpu_ip_block_version *ip_block_test =3D NULL;
+       struct amdgpu_cs_err_codes err_codes;

        while (num_of_tests > 0) {
                sync_point_enter(sh_mem);
@@ -660,12 +673,15 @@ run_test_child(amdgpu_device_handle device, amdgpu_co=
ntext_handle *arr_context,
                bool_ret =3D is_dispatch_shader_test(job.error,  error_str,=
 &is_dispatch);
                igt_assert_eq(bool_ret, 1);
                ip_block_test =3D get_ip_block(device, job.ip);
+               err_codes.err_code_cs_submit =3D 0;
+               err_codes.err_code_wait_for_fence =3D 0;
+
                if (is_dispatch) {
-                       ret =3D amdgpu_memcpy_dispatch_test(device, job.ip,=
 job.ring_id, version,
-                                       job.error);
+                       ret =3D amdgpu_memcpy_dispatch_test(device, arr_con=
text[test_counter], job.ip, job.ring_id, version,
+                                       job.error, &err_codes);
                } else {
                        ret =3D amdgpu_write_linear(device, arr_context[tes=
t_counter],
-                                       ip_block_test, &job);
+                                       ip_block_test, &job, &err_codes);
                }

                num_of_tests--;
@@ -676,6 +692,9 @@ run_test_child(amdgpu_device_handle device, amdgpu_cont=
ext_handle *arr_context,
                                break;
                        sleep(1);
                }
+               /* validate expected result */
+               //igt_assert_eq(err_codes.err_code_wait_for_fence,
+job.reset_err_result);
+
                sync_point_exit(sh_mem);
                test_counter++;
        }
@@ -697,6 +716,7 @@ run_background(amdgpu_device_handle device, struct shmb=
uf *sh_mem,
        const struct amdgpu_ip_block_version *ip_block_test =3D NULL;
        int error_code;
        unsigned int flags;
+       struct amdgpu_cs_err_codes err_codes;

        r =3D amdgpu_cs_ctx_create(device, &context_handle);
        igt_assert_eq(r, 0);
@@ -713,7 +733,7 @@ run_background(amdgpu_device_handle device, struct shmb=
uf *sh_mem,
                ip_block_test =3D get_ip_block(device, job.ip);
                is_dispatch_shader_test(job.error,  error_str, &is_dispatch=
);
                while (1) {
-                       r =3D amdgpu_write_linear(device, context_handle,  =
ip_block_test, &job);
+                       r =3D amdgpu_write_linear(device, context_handle,  =
ip_block_test,
+&job, &err_codes);

                        if (counter > NUM_ITERATION && counter % NUM_ITERAT=
ION =3D=3D 0)
                                igt_debug("+++BACKGROUND++ amdgpu_write_lin=
ear for %s ring_id %d ret %d counter %d\n", @@ -726,6 +746,7 @@ run_backgro=
und(amdgpu_device_handle device, struct shmbuf *sh_mem,
                        }
                        if (r !=3D -ECANCELED && r !=3D -ETIME && r !=3D -E=
NODATA)
                                igt_assert_eq(r, 0);
+                       //igt_assert_eq(err_codes.err_code_wait_for_fence,
+job.reset_err_result);
                        /*
                         * TODO we have issue during gpu reset the return c=
ode assert we put after we check the
                         * test is completed otherwise the job is failed du=
e to @@ -1082,10 +1103,10 @@ igt_main
        struct dynamic_test arr_err[] =3D {
                        {CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM=
_EXEC_INVALID_PACKET_LENGTH",
                                "Stressful-and-multiple-cs-of-bad and good =
length-operations-using-multiple-processes",
-                               { { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI=
, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } } },
+                               { { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI=
, 0x32, 0xFF },
+{FAMILY_AI, 0x3C, 0xFF } } , {-ECANCELED, -ECANCELED, 0 } },
                        {CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_I=
NVALID_OPCODE",
                                "Stressful-and-multiple-cs-of-bad and good =
opcode-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOW=
N, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
+                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOW=
N, -1, -1 },
+{FAMILY_UNKNOWN, -1, -1 } } , { 0, -ECANCELED, -ECANCELED } },
                        //TODO  not job timeout, debug why for n31.
                        //{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_ST=
REAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
                        //      "Stressful-and-multiple-cs-of-bad and good =
mem-sync-operations-using-multiple-processes"},
@@ -1094,16 +1115,16 @@ igt_main
                        //      "Stressful-and-multiple-cs-of-bad and good =
reg-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEN=
D_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C },
+{FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
                        //TODO  KGQ cannot recover by queue reset, it maybe=
 need a fw bugfix on naiv31
                        //{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BA=
CKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
                        //      "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_S=
E_GC_SHADER_INVALID_USER_DATA",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x=
32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x=
32, 0x3C }, {FAMILY_AI,
+0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
                        {BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_G=
C_SHADER_INVALID_SHADER",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C },
+{FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
                        {}
        };

@@ -1175,7 +1196,7 @@ igt_main
                                                info[i].available_rings, ip=
_background !=3D ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
                                        igt_dynamic_f("amdgpu-%s-ring-good-=
%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
                                                        ip_tests[i] =3D=3D =
AMD_IP_COMPUTE ? "COMPUTE":"GFX")
-                                       set_next_test_to_run(sh_mem, it->te=
st, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
+                                       set_next_test_to_run(sh_mem, it->te=
st, ip_background, ip_tests[i],
+ring_id_job_good, ring_id_job_bad, &it->result);
                                } else {
                                        set_next_test_to_skip(sh_mem);
                                }
--
2.25.1

