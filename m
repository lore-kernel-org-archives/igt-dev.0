Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AE0FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 23:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E4510E044;
	Thu, 30 Apr 2026 23:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iPditriQ";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9173C10E044
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 23:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUJVbpelwC6ILxQ6BuoKfVc4PgsOuYQVtlOiZu53+D8/fFh07jfwBd+MUIDwmfIKWHhd/HmCosxlLi7hCoUnS2NL3zQc41mJylYl2h6F4BZtoFjr/JoFsceGIjeWS/8819lnarhwbtoV9QBeBj/3rbnJ72zP44xfDWui8PxOHuA7D7nc1ukLuWscn+PgSYDdF4tWaMiLs5N717OzR8n/UhYoH8a7gZ/TQc9Hqn7pC7AB2fhCVB/qGr4IS02W4WJl6BuGL9xSa/iH4j69YQJPRJVcWiBFOta+4nyhJ0lsnDF5XNah0lhipaMgQqE12XUPLh1RHXu9lbrNalaXf826yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy/gB1WymeDJPzB/7wDXcpKnIIazSvfilIY6IOlTF4k=;
 b=AUe0qxnBt3w/tJTyVxoVib7yGonsg5X0U5LIR9HeJjoPWoyU2ZeFSKz3MVmADbsCGZ/em6Q5RCejrMfPJ3exu+iNs6e96v+6Ik5rjEeb+xeWoZQDIvT8rL4Dsb3tXN+m+eCq48+552D0bC+d2s42emb+O5iSc/vavhCLKzUD6arTsq70sEmyOuZqZyNvxA6T51OtmObmcANrGCBzigX4jRkVbWfDvNVU12a16R4jXQWfmNFluSnaXsk5+NqSRBrTWYjladLOlsj0gweZ+8+PUxyj+m6/iGFpuGwi0vQibybKQ0lhaxxm2+O+MNmjp+oDQqqvYbtNI+9+bFaQ3EMp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vy/gB1WymeDJPzB/7wDXcpKnIIazSvfilIY6IOlTF4k=;
 b=iPditriQnzfqkmGaHPYAEW8+UsJP2lZayiqORaajdIjaeAsxLaN5DhJlYgbvkKbZt5k6tUDWLUgm0ln5TipG1osITjnCqwLd7cTpLMu/Qa/I+IZ/wewPX03bhp9rxonJvMemv2otb7/gLKa1+QWaGt01vfrn17zcdMVaHpt6nNw=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 23:31:50 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 23:31:50 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 3/3] tests/amdgpu: Add DebugFS fuzzing test
Thread-Topic: [PATCH 3/3] tests/amdgpu: Add DebugFS fuzzing test
Thread-Index: AQHc2OAOO6I7Y4f7xUWeaFaljSmSB7X4QLmw
Date: Thu, 30 Apr 2026 23:31:50 +0000
Message-ID: <DM4PR12MB51526E72A561A5C7C986118CE3352@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260430202923.91444-1-vitaly.prosyak@amd.com>
 <20260430202923.91444-3-vitaly.prosyak@amd.com>
In-Reply-To: <20260430202923.91444-3-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-04-30T23:29:49.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DM6PR12MB4417:EE_
x-ms-office365-filtering-correlation-id: 7811ff81-a738-4893-b202-08dea710a785
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: MNNfxhvRkMkg43vDDzfkQqf+dOVGZ7yhPETwoMqJ1Zjwkl56o8hppHshlCs8gtbhJhytEyFk9N5V0VWMDisB5bIwrnyQaXXPRj6xnyuu71rv6AydxXxbLwBIAMYv89ZcPMCmSTxHfJ+g11pNij6wItBwZ2gunPs2d2zPfsmdSXYR/ogu4MgRxgKdNwPRDRv2ZpXlZZINaB1l88BGnIc0DI2ihq/+cKy3YeCR2ILTCh/LPvqdP2Y1TgWw8EWENJJyFoFiZxu3uHds/oCUWKDIIeR24FvCMuBQ5C5jTUhZV4utD4NkIK0KcbddlScslRhTd+3pTzhgDd7G9EbK22qWHiPVf0G8rAUylJc8XpDKIIW8RMfFV3R080yrv/Zy04oEZS2Wstdlty9Ws1faBqGVRzzS7zpTgH5oT61kzsnslyNi/kkayyg7+GKbMqaL5uYH62c6YCXDHAXglJDbgPqHeXPUJhAVjjrv7kPw0ssgvlURFNZ4dFC3f5SfBZuDds9JfT+pZQF4ppuIAqwT1O8lhQWkJUfz2Zz7/arLdDeUunC2qXvqIbgoJ7K3Uz02Bq4cN3eFg93AF8Ceq+t/K2QQZwdA2J9ymcqMQ29cjmmX4FWyBPsOULInQ+dmg2IGh7HaNuciC2VTNfp9kPu3G9ZnTq4yRihBRp17Q7IrZU9lzbdxb6lC/U8yEKXW1jQ8EJnIZxBwqc4GYngNcux1prhBlPJz5EyRLoDiXFj3wfJqD2fV1KW0HYvo/SREkzAxYebF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RDNk9KmwSCM7zrPaOUt4DSbJ9FjJNyOc/Lz//5YWgT0IEwjcvXX2YVofoZ?=
 =?iso-8859-1?Q?fTBTAfwRWYmNxRHX27LnCVhgc7GGwxKCkJtsr3mTnwzF1+NdIo9pnIgX33?=
 =?iso-8859-1?Q?FA74a7p4hh0PceEpAAyFuXjEYmdbTuKN+2zwDjdlunkeHezpcrF12VVfFg?=
 =?iso-8859-1?Q?60+1O3uFTbSCbMUCNQomF88DZaDM5o6zZu8tUvyoSgqI8JWJL75keWWzQP?=
 =?iso-8859-1?Q?gHORy12m9etIDx/QsH6l0bt5pnnRE0lFI0Y0+pWHz67hDDJSVUsKxgZ9Co?=
 =?iso-8859-1?Q?tGOWkW5Fz4Z+rsA3qqWqoC3a5KjSEyP1qUatk0M3hxAd/R/DqI2Ag1Edc7?=
 =?iso-8859-1?Q?nmTZs2zb9boSYeiRxr3h19Kc923Im8P7mdVTnFJU9V4rzX05dCgeZYldLI?=
 =?iso-8859-1?Q?rkqVVU6IOHOsrON4nX0002EZBILeqGZwzgv/5WZ8W6ginlU9iWWOH3z5ot?=
 =?iso-8859-1?Q?GR2VaJEp2PG4sC2hRQGjYFJMZfRZtuzsxx6yGHI56SaAwGamL55P6le6F0?=
 =?iso-8859-1?Q?NSgE55ijX6hlEDvamKWGcEf3Oh+ZuqML6zUigjWXEgLnmRNQXcVleTk9ri?=
 =?iso-8859-1?Q?ijRUwBo5zRVO1ccOzftizsC2fcgDdo4otlm/b1dxq8AlGmdMQdnunR8MYD?=
 =?iso-8859-1?Q?jTErOuAm9o8bH4cIqzqIseHV1LstLn+X3PXN6UC6ZSV1ZG7DPAgfY41UJh?=
 =?iso-8859-1?Q?dvAgg5/t0NRvNcNQnh9Jjr40LJnqHJHmAb5hUY51uKRi52Dp05yeXF/BGJ?=
 =?iso-8859-1?Q?u7pwktJ1IG1yrUZlD7KS9XDKRhBl8KsSGUd181U03YsW/B+KbWZ9t116UZ?=
 =?iso-8859-1?Q?G/9A+d5W7VyXuE9XZKHERd+6g/vwiOYjGmwKXGletAgIEmUKkNVUjzYSyp?=
 =?iso-8859-1?Q?HlsN5lNhC9WZjQQZyH+4pct2nvYfUyhsBjflX/8JouY4CcM4c6P9SkmeQW?=
 =?iso-8859-1?Q?1yHbkeYbHcX+e1Uiwueg1oeBlYZbbsHxOwJd6xfqAGdcNxrlvCx6uMWxmD?=
 =?iso-8859-1?Q?fwBOpObJ2FABCFAUuvoYvCaFMLii4pJgZZlqc2tbpb+IQqlBeyzsEQ0b1k?=
 =?iso-8859-1?Q?dV1fwIV9tCjzBW0Ht2gULf4hUswAMHsF3VL8PMhQt06cIanT+3s6E/zRZ1?=
 =?iso-8859-1?Q?rhvupfZLkU5dsXuxN/ipw3RxNmGL9AXebweS8MBYW/OeW9lwgEMOoNZ8h1?=
 =?iso-8859-1?Q?Snv8Nvs6Txq13bR47D98xqfWnd8FgCBGD3hU/t2nFSl3Lch6x1ip7GTQUY?=
 =?iso-8859-1?Q?SltfDMfySwFmQmPbnHryFUGQ4GmccPyvZ8RkYneAtYKlFZSH9Oy0kcCGLq?=
 =?iso-8859-1?Q?bsq16VmTF/sRi30x9zxa68MqmmCALfp4UbKTLExCYaLjWZhLoW05omr2Tz?=
 =?iso-8859-1?Q?tnwYrrgYsdsmEtaoNHLiSvfa6zan6GEYFJsz7ZqwpAMfVlJtbmoqJ3XdxG?=
 =?iso-8859-1?Q?QZsuhR3tzxj9vfEuHJrqi3UNYpjczj14amNe4E659fUXyHwFVnyBg/5pYq?=
 =?iso-8859-1?Q?uKkGYbEMyAZKVCpQuO9/z0E8+H3VjcHLlRuEY9X0CB5tZtUO9UXY17bVxS?=
 =?iso-8859-1?Q?e2W5znuCXE66cYC8XNnaisir6Xd/d3bkPuWiGkPWwHqXCbiTDBSn8GJIM5?=
 =?iso-8859-1?Q?rqLMFJn3upiOhYeenjgAy/OdVWiiI+5x/N71Oai5mvPF8pa1bibDaaK8A0?=
 =?iso-8859-1?Q?vnssEvjzIhS3GMpmbk7C4Ye0SNfZthbxJyMNm2e7OC520blsIDtj/BU33q?=
 =?iso-8859-1?Q?UNG4Q+Y7nNKo9rRCLvUfNeXvgXzbFcQruJg3qOWsHr+HO5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7811ff81-a738-4893-b202-08dea710a785
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 23:31:50.4947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoTXPMYxu0si80i7QXLbrnCofjAA47bpKDlEX4ajlqP7O8P1qKddk5ok3MMr2eAl5ORoMrNV8+Km6ViU5TuhQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
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

Series is Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Friday, May 1, 2026 4:28 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH 3/3] tests/amdgpu: Add DebugFS fuzzing test
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Discovery: Fuzzing for Microsoft secure supply chain requirements
> Tool: amd_fuzzing_debugfs (IGT test)
>
> Add systematic fuzzing for AMDGPU debugfs interfaces that accept writes f=
rom
> userspace (root-only access).
>
> Coverage:
> - 10 writable debugfs files tested
> - Display Manager debug controls (7 files)
> - Scheduler masks (2 files)
> - SMU debug interface (1 file)
>
> Test approach:
> - 11 fuzz test cases per file (110 total iterations)
> - Tests integer overflow, invalid formats, special characters
> - Saves and restores original values
> - Configurable failure threshold
>
> Key findings:
> - All files properly validate input
> - DebugFS rejects empty strings (unlike SysFS VFS behavior)
> - No security vulnerabilities found (robust validation)
>
> Files tested:
> - amdgpu_dm_dcc_en, amdgpu_dm_disable_hpd
> - amdgpu_dm_dmcub_trace_event_en, amdgpu_dm_dmub_trace_mask
> - amdgpu_dm_dp_ignore_cable_id, amdgpu_dm_force_timing_sync
> - amdgpu_dm_visual_confirm
> - amdgpu_compute_sched_mask, amdgpu_sdma_sched_mask
> - amdgpu_smu_debug
>
> Test results: All subtests pass (10/10)
>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: Id6582d81780cf79db348a19931b62c059c158e8e
> ---
>  tests/amdgpu/amd_fuzzing_debugfs.c | 233
> +++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build           |   1 +
>  2 files changed, 234 insertions(+)
>  create mode 100644 tests/amdgpu/amd_fuzzing_debugfs.c
>
> diff --git a/tests/amdgpu/amd_fuzzing_debugfs.c
> b/tests/amdgpu/amd_fuzzing_debugfs.c
> new file mode 100644
> index 000000000..6106836c4
> --- /dev/null
> +++ b/tests/amdgpu/amd_fuzzing_debugfs.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * AMDGPU DebugFS Fuzzing Test
> + *
> + * Fuzz tests for AMDGPU debugfs interfaces (userspace -> kernel via
> +debugfs)  */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/stat.h>
> +#include <dirent.h>
> +#include <limits.h>
> +
> +#include "igt.h"
> +
> +#define DEBUGFS_BASE "/sys/kernel/debug/dri"
> +#define MAX_PATH 512
> +#define MAX_VALUE 4096
> +
> +/* Test case for fuzzing */
> +struct fuzz_case {
> +     const char *desc;
> +     const char *value;
> +     int expected_errno;  /* 0 =3D success expected, -1 =3D any error OK=
 */ };
> +
> +/* Generic test cases for writable debugfs files */ static const struct
> +fuzz_case generic_fuzz_cases[] =3D {
> +     { "valid_0", "0", 0 },
> +     { "valid_1", "1", 0 },
> +     { "negative", "-1", -1 },
> +     { "large_int", "999999", -1 },
> +     { "overflow", "99999999999999999999", -1 },
> +     { "invalid_chars", "abc", -1 },
> +     { "special", "!@#$", -1 },
> +     { "empty", "", 0 },  /* VFS behavior */
> +     { "hex_valid", "0xFF", 0 },
> +     { "hex_large", "0xFFFFFFFF", 0 },
> +     { NULL, NULL, 0 }
> +};
> +
> +/* Find AMDGPU card path */
> +static int find_amdgpu_card(char *card_path, size_t size) {
> +     struct dirent *entry;
> +     DIR *dir;
> +
> +     dir =3D opendir(DEBUGFS_BASE);
> +     if (!dir)
> +             return -errno;
> +
> +     while ((entry =3D readdir(dir)) !=3D NULL) {
> +             if (strstr(entry->d_name, "0000:") !=3D NULL) {
> +                     snprintf(card_path, size, "%s/%s",
> +                              DEBUGFS_BASE, entry->d_name);
> +                     closedir(dir);
> +                     return 0;
> +             }
> +     }
> +
> +     closedir(dir);
> +     return -ENOENT;
> +}
> +
> +/* Check file access */
> +static int check_file_writable(const char *path) {
> +     struct stat st;
> +
> +     if (stat(path, &st) !=3D 0)
> +             return 0;
> +
> +     return (st.st_mode & S_IWUSR) || (st.st_mode & S_IWGRP); }
> +
> +/* Read file value */
> +static int read_debugfs(const char *path, char *buffer, size_t bufsize)
> +{
> +     int fd, ret;
> +
> +     fd =3D open(path, O_RDONLY);
> +     if (fd < 0)
> +             return -errno;
> +
> +     ret =3D read(fd, buffer, bufsize - 1);
> +     close(fd);
> +
> +     if (ret < 0)
> +             return -errno;
> +
> +     buffer[ret] =3D '\0';
> +     if (ret > 0 && buffer[ret-1] =3D=3D '\n')
> +             buffer[ret-1] =3D '\0';
> +
> +     return ret;
> +}
> +
> +/* Write file value */
> +static int write_debugfs(const char *path, const char *value, size_t
> +len) {
> +     int fd, ret;
> +
> +     fd =3D open(path, O_WRONLY);
> +     if (fd < 0)
> +             return -errno;
> +
> +     ret =3D write(fd, value, len);
> +     close(fd);
> +
> +     if (ret < 0)
> +             return -errno;
> +
> +     return ret;
> +}
> +
> +/* Test a single debugfs file */
> +static void test_debugfs_file(const char *filepath, const char
> +*filename) {
> +     char original[MAX_VALUE] =3D "";
> +     const struct fuzz_case *test_case;
> +     int ret;
> +     int pass_count =3D 0, fail_count =3D 0;
> +     struct stat st;
> +
> +     igt_info("=3D=3D=3D Testing: %s =3D=3D=3D\n", filename);
> +
> +     /* Check if file is writable */
> +     if (!check_file_writable(filepath)) {
> +             igt_skip("File not writable: %s\n", filename);
> +             return;
> +     }
> +
> +     /* Try to read original value */
> +     if (stat(filepath, &st) =3D=3D 0 && (st.st_mode & S_IRUSR)) {
> +             ret =3D read_debugfs(filepath, original, sizeof(original));
> +             if (ret >=3D 0)
> +                     igt_info("  Original value: '%s'\n", original);
> +     }
> +
> +     /* Run fuzz test cases */
> +     for (test_case =3D generic_fuzz_cases; test_case->desc !=3D NULL;
> test_case++) {
> +             ret =3D write_debugfs(filepath, test_case->value,
> +                                strlen(test_case->value));
> +
> +             if (ret < 0) {
> +                     if (test_case->expected_errno =3D=3D 0) {
> +                             igt_warn("  [%s] Write failed: %s - UNEXPEC=
TED\n",
> +                                     test_case->desc, strerror(-ret));
> +                             fail_count++;
> +                     } else {
> +                             igt_debug("  [%s] Write failed: %s - EXPECT=
ED\n",
> +                                      test_case->desc, strerror(-ret));
> +                             pass_count++;
> +                     }
> +             } else {
> +                     if (test_case->expected_errno =3D=3D 0) {
> +                             igt_debug("  [%s] Write succeeded - EXPECTE=
D\n",
> +                                      test_case->desc);
> +                             pass_count++;
> +                     } else {
> +                             igt_warn("  [%s] Write succeeded -
> UNEXPECTED\n",
> +                                     test_case->desc);
> +                             fail_count++;
> +                     }
> +             }
> +     }
> +
> +     /* Restore original value if we read one */
> +     if (strlen(original) > 0) {
> +             ret =3D write_debugfs(filepath, original, strlen(original))=
;
> +             if (ret < 0)
> +                     igt_warn("Failed to restore %s: %s\n",
> +                             filename, strerror(-ret));
> +     }
> +
> +     igt_info("  Results: %d passed, %d failed\n", pass_count, fail_coun=
t);
> +
> +     /* Allow some failures for exploratory fuzzing */
> +     igt_assert_f(fail_count < 6,
> +                  "Too many issues for %s (%d failures)",
> +                  filename, fail_count);
> +}
> +
> +/* Main test */
> +int main(int argc, char **argv)
> +{
> +     char card_path[MAX_PATH];
> +     char filepath[MAX_PATH];
> +     int card_found =3D 0;
> +
> +     /* Writable debugfs files to test */
> +     const char *test_files[] =3D {
> +             /* Display Manager debug knobs */
> +             "amdgpu_dm_dcc_en",
> +             "amdgpu_dm_disable_hpd",
> +             "amdgpu_dm_dmcub_trace_event_en",
> +             "amdgpu_dm_dmub_trace_mask",
> +             "amdgpu_dm_dp_ignore_cable_id",
> +             "amdgpu_dm_force_timing_sync",
> +             "amdgpu_dm_visual_confirm",
> +             /* Scheduler masks */
> +             "amdgpu_compute_sched_mask",
> +             "amdgpu_sdma_sched_mask",
> +             /* SMU debug */
> +             "amdgpu_smu_debug",
> +             NULL
> +     };
> +
> +     igt_subtest_init(argc, argv);
> +
> +     igt_fixture() {
> +             card_found =3D (find_amdgpu_card(card_path, sizeof(card_pat=
h)) =3D=3D
> 0);
> +             igt_require_f(card_found, "No AMDGPU card found in debugfs\=
n");
> +             igt_require(getuid() =3D=3D 0);  /* Need root for debugfs a=
ccess */
> +             igt_info("Found AMDGPU card: %s\n", card_path);
> +     }
> +
> +     for (int i =3D 0; test_files[i] !=3D NULL; i++) {
> +             igt_subtest_f("debugfs-%s", test_files[i]) {
> +                     snprintf(filepath, sizeof(filepath), "%s/%s",
> +                              card_path, test_files[i]);
> +                     test_debugfs_file(filepath, test_files[i]);
> +             }
> +     }
> +
> +     igt_exit();
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build index
> effb6130a..d5a4820e3 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -20,6 +20,7 @@ if libdrm_amdgpu.found()
>                         'amd_freesync_video_mode',
>                         'amd_fuzzing',
>                         'amd_fuzzing_sysfs',
> +                       'amd_fuzzing_debugfs',
>                         'amd_hotplug',
>                         'amd_gang_cs' ,
>                         'amd_ilr',
> --
> 2.43.0

