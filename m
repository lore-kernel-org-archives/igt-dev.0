Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE3C61DE4
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 01:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A2B10E10A;
	Mon, 31 Aug 2026 01:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qs+aqA4n";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6C10E10A
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 01:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avN83ajt1o6XdpJb7qJ7u/RLDZ2jodPxDdCeiMCcji2ME9RHfodoG/dXnXcnZp6Grty5lEyTF0A4UtEjtPI+rU8fw3ynQwAkDB07dLgj0uz0bcVzr72Mfd1KoC+msXJ21i/yDwyy40Jk8/FHA112/FNloHFeNDv3vFvJRywJMCGwZntBoL90zH5AyrgidNAbOD3U8FvXw2RITFuGiieVvX1FeZ77+dQ6Bmf+7TOHsEhVs5n6LzIvPmS9b6MMHhA8BSFMtgyrrJ1djwMsfz1048qnernlomm8cz08OttHWenUIzeWlNn61wwUkAXKltJ5KRsCEa34ou98PFy5T4KDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJH7htDun8XRP73r3cV/PmkghHfI13SuhD+kXLbAGJY=;
 b=RXymMmSpeczBRfNE4D5qSL/JW2o1v8j719voKCtbbVWeaK9YOdlBm61eweEK24SMC+GxlBTZN09X9cC23JSo60EBt9GvGFLFFKbDbDNr58YEZ1AMpE9hS3gY8BdYtuzSJxcOlFbcYxfyDOWXOWOX6DmNxwvK39Jco3qncuq6MyXaYOHHilX8dOIIObRjZcTFWdC9z5cSNr7A9YtVIk7IY5ztAXtAhED9vN1+ZymzBGukIGQvQkYGPiGmIKgQZY2Q7W04xSz6YH/Lj85zN/KpriWLKvhWy9U7EKb5u0FVhmqQPgzvwLtJv9XoVGWjBx/zu2bOe2JsvRo4pvHotpc5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJH7htDun8XRP73r3cV/PmkghHfI13SuhD+kXLbAGJY=;
 b=qs+aqA4nLpRWKn2LLHPktOsNLEbzesosTDumv4l77AL8NyATgOlEUp7ttBBSblwMRLm0oQGePnyWXLWq/TnEJ2IVk3TwrYN6CkC6BEb/paU64JO4ZcUbM+2/Fjk7GenXWCU/8Uv9nWtdPr9UkS7Uflvb5QCwznQSfYYXXIQhOzQ=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 01:16:30 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:16:30 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] tests/amdgpu: always enable UQ test coverage
Thread-Topic: [PATCH] tests/amdgpu: always enable UQ test coverage
Thread-Index: AQHdOMJFEFX13VYL4UimretrdQzUjra3WlrA
Date: Mon, 31 Aug 2026 01:16:30 +0000
Message-ID: <DM4PR12MB515260A034010497AA99FE0AE3A92@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260830205759.49482-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260830205759.49482-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-31T01:13:30.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SA1PR12MB8919:EE_
x-ms-office365-filtering-correlation-id: a2cb2cce-fe9b-4d6a-e97e-08df06fd7ce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: ZCCvSC8E3cyAsvpO0Eyw2yXuxlOxijZ9QBqQrsbMgRW/n4OBJtofIJWDztSJUag7i8Lm+tIAYVN6BsF79Ul9YDxu7rm5xlAphSjBXYM8ZAlN26W3qrCWdAx5X80UJqyuId6rmjWxBzSeA04t9qx6I/fnyhUJm5hUy/VOx9BwvrmK55ArcZQx8JTqm++QjunViDpTfSTWlmuVwaBCiVA2mp9dfqtK2riDbnbi5Jad1O8xcJQLTE8La24IYZprmYDaQ/a15askeISJBUalKuMi58HHL5nJxX2DFwD4S3vfcEIrzvtkkqUxvgy4NG9L+ESLSoSs7swwHiCBTWhxksSHLJmwXzRi3DBIUrwMOV+ei+zvCq5dazyPDjhhdT1FylykFf7xFRUrcTpTbfcj2xsJQ68F/P2lAoWgRVY/9MipTfQJcxfMEtPGVJvD8Y2E+VA0K2hD/MJS4n3BFQ1UzUwz1T+0RDkvgb87k2QUzc80UnQ70uthqQIPGUKxKyqFvV0wZsOcQVhUzNXYAXspEJ35k806x7ERvI6I5HqEkAdOw47c8av/ZiBx7WUHGubL+kqF6FPJIQ5rOfZ+IG/ybPVJM8hID1+yFttVw61PVlqB7AXE5GCYCKAxUunKpHpHqKFUGE16OJ2F3O1QNKyqI/BwAcG3/zr2HMJrvUZrPKVW0ciPUVNQFZhkOD7ouqIE6d3HW9fpyCnpBC3C6XUGepPjSh2Lf0rF9PflPliHwJ3R3EU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sF00iEubc4hQit14WJM+8YEKBfha9AwqejAGA9lWDgKkb2/YmndDW/E8lmUR?=
 =?us-ascii?Q?2TVeZIwqyfTPox10cv5UgqNaqOrDmh4YFAg576sUszogGBqigjRp3jx85BHq?=
 =?us-ascii?Q?vEUJYVOPu5DI6YEpGJhD0X6J/XlhQNJEY4CBbm9CbgoLx6OYbw2jlELP/8qf?=
 =?us-ascii?Q?DenpyxiJbKZpz2fD+JAXm+7+M56AvLV2iqaF1OEgZtPgwk1TryeEOIjwljEj?=
 =?us-ascii?Q?jQWqrmIyaPQtoP0j7D2eqhYNxRynyRdpkOBF6JnFcgtoLpS9H9n5R8XTzp8H?=
 =?us-ascii?Q?QUcF0CpbJpTC8Wf3AEx+x1Yii4kxByMMF7pctsAasQYWsW6GDxigCidVjeXm?=
 =?us-ascii?Q?BV9TRaetbSSip52Q2jzFKRwz75/3m3rOkT3BpiZka+3o8Vq2oG+/bl0yiih2?=
 =?us-ascii?Q?j6USXjf8wGCQZZe+YZDZDhEJy3m0eP6Lrq6TVodXenwYjyEW7Xhma8XDGgrq?=
 =?us-ascii?Q?jsCALxRgbf22EB8AF/zITRdyTk3POlcOSEFvNO+2WvdmhZYY9t9RyoqZBmD5?=
 =?us-ascii?Q?8HiOCw8kGM7fA0D9f3YUpKPxalKLIk6qCFonLBoB7pad50C2pf3FpD17P5hT?=
 =?us-ascii?Q?VHUmNeVElUBp4pzzV8b259w2WPp5Cc+euoeLgbnBlmC1xlPYyGi7oeRebvRE?=
 =?us-ascii?Q?0jyQWPy8duhIJWEajLhMGrh/4aLqqlDXr/XMfqt3qhn5hnzcSgyAzQ0E4/ig?=
 =?us-ascii?Q?yy5LfNGtwsCmpTKyY1u/9K+tlC5nEAlsrauwA2P3iDo65dtSBJRwrYOPT+HA?=
 =?us-ascii?Q?fqomvym3U7bEEZloygnXjjqhgoQGdQgJoaYaS5hASrTDXH3Jlv70C8vaLwOY?=
 =?us-ascii?Q?TOqNSXEon0gGRJRT5C2vmAktID1cJwUzHsdLuJxZIMftwAIe6Gv/y7taEt0K?=
 =?us-ascii?Q?jYlRxZwLyQsDsPEBO51IYv4XHzJnEbrd+5KJJtuRecxAR7Uiv7GUoPX7JUFU?=
 =?us-ascii?Q?2feZSIZeURQnqAWk6lstAG5wTD3kjjNcAy54+QluKkU7GPNRM8NwJaaS8Yw5?=
 =?us-ascii?Q?WTEoph9RYL44VmMUpmMxFjV6WfAL11+9ATway1D/jU0sQvmCOQX1OtnR67mx?=
 =?us-ascii?Q?HxxhHYdkC1UvmTkHkvN3jKLjOYW2/5ELphIXg804vB3ASVmnPvsVXhGowmZG?=
 =?us-ascii?Q?0DJJ2VDv/mh6SmN3Q4jYVhMn4tiPqT3CZp6NbDT/3VvKeq2LP6WCPbSxjPl+?=
 =?us-ascii?Q?8DCg1Eik7WwxRZkZr4eNw3/B/xdzwS0r+EnKHEFn8w9zId08U+hbBl2xp85A?=
 =?us-ascii?Q?oOaCZ7A4uJn1mPMW7+r8tRcHsSKjHFOOL/cxLWz/LFnW2bNNPo5wCfmdZB6b?=
 =?us-ascii?Q?7yOfe3Bo+Yk52eIf1mIJZbePw707PDVSUhgFcyC70KUuzyuiJ5qN/ruX9pWq?=
 =?us-ascii?Q?e0VcsNvSxHL/erE950FEvbtbgomkMSYJBnePukYEvBoTOT0YwPOn4amQ97qv?=
 =?us-ascii?Q?WgNF/7a9WOObMoYMT+5dTb6Gj3htnHPRthVC7mqL6erwddWTyUeGMaDPSQVA?=
 =?us-ascii?Q?jj6NaxDqezwAPe2QqGaGA+UzSH9x7S3fSt1sJEf/mNQ/6Z5TjFnJeYA1ZPGI?=
 =?us-ascii?Q?TqiGLUWh/pmmRnWGusmz1gqewVdBEBBWcaAZV1bQY1Q3yBoXq9z5VENzTuzR?=
 =?us-ascii?Q?ud0pBki4D6gUDCfFTrihEaz6+H/IHp6KHTJ5nzjYsLZRxOzW7bbvepAYHB+9?=
 =?us-ascii?Q?2xVmtisUiYYBCsoNn7Gf2tRJGXSPyXwr8qn7z6S6poQdx7iR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cb2cce-fe9b-4d6a-e97e-08df06fd7ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 01:16:30.1813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wfDf43uqAwnwSfOUJ3eWX3qdpEmqVAvcnrPa8WjaSIW1sROIHsGKNs3826AKsZWWFaP3JXNbJJuKRBx57A1Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919
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

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Monday, August 31, 2026 4:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>
> Subject: [PATCH] tests/amdgpu: always enable UQ test coverage
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Enable user-queue test coverage by default for deadlock, dispatch, securi=
ty, mult-
> gpu tests.
> This change removes the env-variable toggle path and keeps execution beha=
vior
> consistent across the AMDGPU UQ-focused tests in this patch set.
> No functional test intent is changed; this keeps the suite behavior predi=
ctable for
> regular validation runs.
>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_basic.c           | 2 +-
>  tests/amdgpu/amd_basic_multi_gpu.c | 9 ++++++---
>  tests/amdgpu/amd_cs_nop.c          | 9 ++++++---
>  tests/amdgpu/amd_deadlock.c        | 6 +++---
>  tests/amdgpu/amd_dispatch.c        | 6 +++---
>  tests/amdgpu/amd_security.c        | 6 +++---
>  6 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index
> 59ec3880f..418db286f 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -19,7 +19,7 @@
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "lib/amdgpu/amd_utils.h"
> -#include "lib//amdgpu/amd_platform.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  #define BUFFER_SIZE (8 * 1024)
>
> diff --git a/tests/amdgpu/amd_basic_multi_gpu.c
> b/tests/amdgpu/amd_basic_multi_gpu.c
> index 187be43fe..30b0da617 100644
> --- a/tests/amdgpu/amd_basic_multi_gpu.c
> +++ b/tests/amdgpu/amd_basic_multi_gpu.c
> @@ -13,6 +13,7 @@
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
>  #include "igt.h"
>  #include "igt_multigpu.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  #define BUFFER_SIZE (8 * 1024)
>
> @@ -162,10 +163,9 @@ int igt_main()
>       amdgpu_device_handle device;
>       int fd =3D -1;
>       bool enable_test =3D false;
> +     struct amdgpu_gpu_info gpu_info =3D {0};
>  #ifdef AMDGPU_USERQ_ENABLED
> -     const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");
> -
> -     enable_test =3D env && atoi(env);
> +     enable_test =3D true;
>  #endif
>
>       igt_fixture() {
> @@ -179,6 +179,9 @@ int igt_main()
>
>               igt_info("Initialized amdgpu, driver version %d.%d\n",
>                        major, minor);
> +             err =3D amdgpu_query_gpu_info(device, &gpu_info);
> +             igt_assert_eq(err, 0);
> +             amd_platform_filter_init(&gpu_info);
>       }
>
>       igt_subtest("multi-gpu-memeory-alloc") { diff --git
> a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c index
> beab62a54..65f88cf2b 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -12,6 +12,7 @@
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_ip_blocks.h"
>  #include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  static void amdgpu_cs_sync(amdgpu_context_handle context,
>                          unsigned int ip_type,
> @@ -150,6 +151,7 @@ int igt_main()
>  {
>       amdgpu_device_handle device;
>       amdgpu_context_handle context;
> +     struct amdgpu_gpu_info gpu_info =3D {0};
>       const struct phase {
>               const char *name;
>               unsigned int flags;
> @@ -174,9 +176,7 @@ int igt_main()
>       bool userq_arr_cap[AMD_IP_MAX] =3D {0};
>  #ifdef AMDGPU_USERQ_ENABLED
>       bool enable_test;
> -     const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");
> -
> -     enable_test =3D env && atoi(env);
> +     enable_test =3D true;
>  #endif
>
>       igt_fixture() {
> @@ -192,6 +192,9 @@ int igt_main()
>               igt_assert_eq(err, 0);
>               asic_rings_readness(device, 1, arr_cap);
>               asic_userq_readiness(device, userq_arr_cap);
> +             err =3D amdgpu_query_gpu_info(device, &gpu_info);
> +             igt_assert_eq(err, 0);
> +             amd_platform_filter_init(&gpu_info);
>       }
>
>       for (p =3D phase; p->name; p++) {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c in=
dex
> d66a58859..b8356af74 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "lib/amdgpu/amd_utils.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Ve=
rde, Pitcairn,
> Tahiti */
>  #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii *=
/
> @@ -46,9 +47,7 @@ int igt_main()
>
>  #ifdef AMDGPU_USERQ_ENABLED
>       bool enable_test;
> -     const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");
> -
> -     enable_test =3D env && atoi(env);
> +     enable_test =3D true;
>  #endif
>
>       igt_fixture() {
> @@ -75,6 +74,7 @@ int igt_main()
>               igt_skip_on(get_pci_addr_from_fd(fd, &pci));
>               igt_info("PCI Address: domain %04x, bus %02x, device %02x,
> function %02x\n",
>                               pci.domain, pci.bus, pci.device, pci.functi=
on);
> +             amd_platform_filter_init(&gpu_info);
>       }
>       igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
>       igt_subtest_with_dynamic("amdgpu-deadlock-sdma") { diff --git
> a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c index
> 44aa2d128..5267a742a 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -13,6 +13,7 @@
>  #include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
>  #include "lib/amdgpu/amd_utils.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  static void
>  amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle, @@ -
> 88,9 +89,7 @@ int igt_main()
>       bool userq_arr_cap[AMD_IP_MAX] =3D {0};
>       bool enable_test =3D false;
>  #ifdef AMDGPU_USERQ_ENABLED
> -     const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");
> -
> -     enable_test =3D env && atoi(env);
> +     enable_test =3D true;
>  #endif
>
>       igt_fixture() {
> @@ -113,6 +112,7 @@ int igt_main()
>               igt_assert_eq(r, 0);
>               asic_rings_readness(device, 1, arr_cap);
>               asic_userq_readiness(device, userq_arr_cap);
> +             amd_platform_filter_init(&gpu_info);
>
>       }
>       igt_describe("Test GPU reset using a binary shader to slow hang the=
 job on
> compute ring"); diff --git a/tests/amdgpu/amd_security.c
> b/tests/amdgpu/amd_security.c index fd976e286..48d49973e 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -10,6 +10,7 @@
>
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_platform.h"
>
>  /* --------------------- Secure bounce test ------------------------ *
>   *
> @@ -319,9 +320,7 @@ int igt_main()
>
>  #ifdef AMDGPU_USERQ_ENABLED
>       bool enable_test;
> -     const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");
> -
> -     enable_test =3D env && atoi(env);
> +     enable_test =3D true;
>  #endif
>
>       igt_fixture() {
> @@ -341,6 +340,7 @@ int igt_main()
>               igt_assert_eq(r, 0);
>               asic_userq_readiness(device, userq_arr_cap);
>               igt_skip_on(!is_security_tests_enable(device, &gpu_info, ma=
jor,
> minor));
> +             amd_platform_filter_init(&gpu_info);
>       }
>
>       igt_describe("amdgpu security alloc buf test");
> --
> 2.54.0

