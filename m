Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF9CD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 01:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311C10E00B;
	Wed, 13 May 2026 01:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lZ7YzYTe";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F71910E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 01:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE7vXr2oHBmrSc3C6jMepctAao7JEbdE0ePXBgO/dZ56tkOhSxFdJ5APijlYuPvNZ0Yxh6JgS5a4ZCoJ7SGoKScfKWAI94muqRWCjzn0z9YLnXsvKzQ9kRChb4VHWjeodfwgW4W9NHmZjsxl2CJqB02MmgkQbOiRIl7lmde/Zv8Cetmn2+GSfDr9tGENuJslQaA8OjRiq3FYJ6To+XAE4CQLOrnIWfMMfG7hz7q0Q2Def4gDbs3Bvm+4H5Lp03CPGixOsSywL7o65QGIQdZ0afNHQV4Y5eLSxNQLoZj1741F9XW8l9NKPC+wvB6uB8GuRfh4D2tx6fvFCKCo6aPFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKzWAIXfnuaCPWdc0TpN6gFEulETa8aibfBndWKGbZQ=;
 b=NSqGbmqMl8QBeaMoXqrSHobOl6rM/SZfstybuHvDtj1lNWXHjwXuLCfskQDUBrWy/zFS+AanB1ZxI3v3BADahIwWypVZCCDKmBRGqkdl8Z+QwCR0GOtIm0FeElK5OZ77xwVKKwP1O207Pe+GtB6v/Ld29KeR65f12n47Mv+gTUV8pfY2lsJoxosXQRCQ1OW+L2bFgotBfaZb7QCj0VXnp1rEjvMA39BVTsMNIaRouyVgLD3+OOS3KR54p9in0/Rvo3TH5dveMqJ66UQIMk2WjBrLKKBPeMYoyJfn8gS62JzLyng8J/o4YgSfzBEuGWDQJywQg1Ny5dbXqRceom+Z6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKzWAIXfnuaCPWdc0TpN6gFEulETa8aibfBndWKGbZQ=;
 b=lZ7YzYTe+1y29EiHLrF1X6CRjCk9yRHQjxKGD/VfqhABFHsqiswHclrGlagOzJjpssW3pmiiWOldkwzoFlgLTTWdm+soUscGJNeci3nH9B9ipR7+V7IFW7fTeAmJ4jm++AZH+in952GxOBToPnXpNc0La74Lk2MLDRzlfBpkTUg=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 01:13:05 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 01:13:05 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: add USERPTR PTE invalidation regression test
Thread-Topic: [PATCH] tests/amdgpu: add USERPTR PTE invalidation regression
 test
Thread-Index: AQHc4jx/1wuTg18xqEmSXLsMEj65cbYLJiPA
Date: Wed, 13 May 2026 01:13:05 +0000
Message-ID: <DM4PR12MB5152969E7801149B0DB57182E3062@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260512182348.115625-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260512182348.115625-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-13T01:10:36.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CH3PR12MB7523:EE_
x-ms-office365-filtering-correlation-id: 5e0d7fab-5a9c-4363-d463-08deb08cc955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|38070700021|11063799003|22082099003|3023799003|18002099003;
x-microsoft-antispam-message-info: pyodpaVlvZHQgIA/99O1fyjbGHGmwW5t5zfLrN2gYDAY20CNjzCUnY0MCOG/2LFh/XIUDNauzVOsG9dhV6AGHsfrRUu9V6IR1Uhc3D7G6qnh7Dihev4MiD8vhL4Bwtc4F830qD73gYyzSa5QyHYSTtY70UasYfNyD6BDfUzwMugGvDmFO85X/xCkJwTmzMh0N9PefoR1o+5KV5c1EzY80caOegOvd6IqVcftyOOh9tAXxydQzTsStTu9AXCCPH7IjRRia+ZiVsMowdxFeeHOccXBKxALovy7ZCybbsjJDM5etd3rEUPbH7PolRZq0xD0mi/4KO9GicPCkMXsrboVVM7/cfXGFFzYakdexMBq8MoT3In8OyFYSN1gqCbmlNBQEThDCazgsGCa8ysFz4gm6ntpRcMcI/OrXqHsebVDspN5/VsZ2d3Rh96mx0bIwGTja3aXvxbxXerilfonAtJa3W7HDy1RuVnT/4l0USCjHTZhjxn0IFj9gffXZIFtTGofdjZ31aSaPUi3Xk193meLeiLJCXV7WmAtPoX/+1Ux3UAP5l7B9yNp5sHlNz6i7J185i6Id+9iqR3Qw/h8lxL7IP4ETk5ZKsPkSbx1qQsW4ka7avKSP+QQJCplyKuUdMU2IwCzu+6fpHEgeqq102ps3X887aVUD9+AUcHr9+dqMAFiWoNVza/BB9C4x+PU6GXSOTCZplQdBjuNf4swd3prS6KXwIttX4Oe5bLTAzEgg3Sdir6Xz/2kxDdxzEBo+I9y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(38070700021)(11063799003)(22082099003)(3023799003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4QBVKtAgjX1hrfoQH+QKF/5aKnuZsTqdvPrU4+kRd4KPWPZNIcDp2fjZVe?=
 =?iso-8859-1?Q?C+7PhF5RwcJ7VFgdJMFB1V7i3KMC/EXfwv3ZTuj/3m1ho8vqLJehlSWTCB?=
 =?iso-8859-1?Q?aI53osS+p63LtIKVdbPAkpsAze8lFfyGgISW4lPoGa5wqkzC6AD/CoGgRF?=
 =?iso-8859-1?Q?EgTeEgvy3t+rPLyWmdg6LPpzuOvRQO1eeTSbplT5a7OAOCR+BRAiOIItla?=
 =?iso-8859-1?Q?yTzpWjcF3PSG8uIt8wPJl9bTMEYHrF+hKqrLCQ4noIgZ5PjBXJRreE0dz0?=
 =?iso-8859-1?Q?jxMOxoCNB0FFdFlGzK4cxSY9h8V9mRIGTEAM+ohNhZ+e2ImgEgNxeCBEiM?=
 =?iso-8859-1?Q?hYmbw8lcOBgtNhykFkaXVc7NK60EcepEMc0MtY3PZ3IeSpWf50cpC2x4Di?=
 =?iso-8859-1?Q?4EEf+NlR8mmQWFOonuY4tDLrO70vtiRTA6QTghH/ShLaNOPXml2SvUVfOi?=
 =?iso-8859-1?Q?oujAF8VzjGy4unbNxWU9bP0Lj5rsOsPnDLLFSpF1JYHizl8/DvkIosk896?=
 =?iso-8859-1?Q?cMX5RTaXuUqe8JoDIqnBqumPFHW7Vo56iqsYkuU74jZtYu5tqL4UmBDIHe?=
 =?iso-8859-1?Q?rjONUdESy5QOedRmga3GCFVLzj2ttAAuK/zmbLcM/gTJgtcOkiSiLUxhdr?=
 =?iso-8859-1?Q?+CgklE/GImqiiOpxaoJDbVVfBMZKINwzfMCdKostrZjwlQBTXLD+tSkbbJ?=
 =?iso-8859-1?Q?IqQuycvQ2Ys06q3sePq3+hCerdyPdYbGJ7ZwqsQN7PyolLiHFof0Gg4xQt?=
 =?iso-8859-1?Q?UymTEoQAIBKFYk9uxV3vkcAnmI4mz37yrYIbc/bwWW8bArYTbfVuwnYHfT?=
 =?iso-8859-1?Q?0krkx6lzg1V/mgE/UOQFLmb53F5Cp/WgIjw/9mtj390xd21+5sRRHXCHmt?=
 =?iso-8859-1?Q?+ThFj4ERA2yYk4ku4SB0T9dLKNyPeFoBi+8seXIEoPlJTOdBG4LMlguy56?=
 =?iso-8859-1?Q?c659hvG38XWT69PZtf+YcIxA1h5DNGu4A7mJGrN7G0eBiexJABfPM78xlT?=
 =?iso-8859-1?Q?755OBj7yN5slf/axNSBg0jqAk0TjqdFqrRoT0E6wLK+qvVFjITwu8vfQLy?=
 =?iso-8859-1?Q?+cmRBVWITYdrp3h3jGTF69y+NAwGwh8RJxqMDNpljHf4dGksnbhEBIj9Lt?=
 =?iso-8859-1?Q?lUplqmqkHhmooh4ysOagAhZUGDDEYptftzSw20YY+wxnWS+S1qufiizd6U?=
 =?iso-8859-1?Q?T6QfInTy4PSoub9sjpFVrCH5m4qBAHRlEKoXlxObC3KD1ZSePEl9XhL9SW?=
 =?iso-8859-1?Q?sW2dLjg93QMtwouJo6rgWSyNSXjq6FRptjcwCE/IGrYAzM7fEjjOr9o/A6?=
 =?iso-8859-1?Q?BfCmhWCo2bJck80EKzaylyNL8hiyonZ8SfVN8Po1IIBpTsyufMIl9dv3IZ?=
 =?iso-8859-1?Q?KCAxFeswdsSgjlAcTIrh7p4UtpRoFXw7wGd33K41D+le657YQT/JwEPeYy?=
 =?iso-8859-1?Q?ysIzq0pJCY/3iYF71p7z5Gf/ZFoPlAbeGqLkkGe0XVT/9LKfesLOPamm9B?=
 =?iso-8859-1?Q?tgTS8Vi4JbEiB8AoYG/TsaiPgPLviDu8uwA0oxOonloH6e51ZS9MFd2l4/?=
 =?iso-8859-1?Q?ss7HjHYd/xGosveMahZKtzWi+eka/9Swcze/CV18SHi+e3X59t/0RJOw9M?=
 =?iso-8859-1?Q?M0ZmbOXDdR8jOvOXwFaptOjB7CtVxeEJmsH3i533Tn9YGOqmEoXATsEtgk?=
 =?iso-8859-1?Q?4vTM0plwXniOY3oKLw0eOxM8G4Kftz9aw5WmhsgwY5OtMmHfp3J2KXpLZh?=
 =?iso-8859-1?Q?a95PCe71mlUmR7q5Fl4uqeuULDJY8cl3IGAXwuaYxihV6O?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0d7fab-5a9c-4363-d463-08deb08cc955
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 01:13:05.2543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx8mEYnDBGNq/dS+tTEHaQgnPpKIY5btMeuADCXedoIZptb0VTd5wU1jZxU2qtSYEWjnbhIvmTJ4dDGcDTLCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
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

This patch is good for me , and Reviewed-by: Jesse Zhang <jesse.zhang@amd.c=
om

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Wednesday, May 13, 2026 2:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH] tests/amdgpu: add USERPTR PTE invalidation regression te=
st
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add amd_userptr_invalidation test to verify that GPU page table entries a=
re properly
> invalidated when the userspace backing of a USERPTR buffer object is rele=
ased
> via munmap().
>
> The test contains two subtests:
>
>   userptr-unmap-revalidate:
>     Allocates a USERPTR BO, releases its backing via munmap(), then
>     submits a CS that still references the BO in the bo_list.  Verifies
>     that the kernel detects the invalidated BO during revalidation and
>     rejects the command submission.
>
>   userptr-unmap-stress:
>     Allocates a 256 MB USERPTR region, establishes GPU mappings with an
>     initial SDMA copy, releases the backing via munmap(), then creates
>     memory pressure with pipes and child processes.  A second SDMA copy
>     through the old VA range is submitted without the USERPTR BO in the
>     bo_list.  Verifies that GPU PTEs were invalidated by checking for
>     GPU page faults (via klogctl) and confirming that the destination
>     buffer does not contain the original data pattern.
>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c     |   2 +-
>  tests/amdgpu/amd_userptr_invalidation.c | 590 ++++++++++++++++++++++++
>  tests/amdgpu/meson.build                |   1 +
>  3 files changed, 592 insertions(+), 1 deletion(-)  create mode 100644
> tests/amdgpu/amd_userptr_invalidation.c
>
> diff --git a/lib/amdgpu/amd_command_submission.c
> b/lib/amdgpu/amd_command_submission.c
> index c80e06fb5..1a5fd9446 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -139,7 +139,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle
> device, unsigned int ip_type
>                                                0, &expired);
>               ring_context->err_codes.err_code_wait_for_fence =3D r;
>               if (expect_failure) {
> -                     igt_info("EXPECT FAILURE
> amdgpu_cs_query_fence_status%d"
> +                     igt_info("EXPECT FAILURE
> amdgpu_cs_query_fence_status %d\n"
>                                "expired %d PID %d\n", r, expired, getpid(=
));
>               } else {
>                       /* we allow ECANCELED or ENODATA for good jobs
> temporally */ diff --git a/tests/amdgpu/amd_userptr_invalidation.c
> b/tests/amdgpu/amd_userptr_invalidation.c
> new file mode 100644
> index 000000000..6938c11a4
> --- /dev/null
> +++ b/tests/amdgpu/amd_userptr_invalidation.c
> @@ -0,0 +1,590 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Test for USERPTR BO PTE invalidation after munmap.
> + *
> + * When userspace releases the backing pages of a USERPTR buffer object
> + * via munmap(), the kernel must invalidate the corresponding GPU page
> + * table entries so that subsequent command submissions through the
> +same
> + * GPU virtual address range do not access the old physical pages.
> + *
> + * The test verifies two aspects of this behavior:
> + *
> + *   userptr-unmap-revalidate
> + *       Submits a CS that includes the USERPTR BO in its bo_list after
> + *       the backing has been released.  The kernel is expected to detec=
t
> + *       the invalidated BO during revalidation and reject the submissio=
n.
> + *
> + *   userptr-unmap-stress
> + *       Allocates a large (256 MB) USERPTR region, establishes GPU
> + *       mappings via an initial SDMA copy, then releases the backing
> + *       and creates memory pressure with many pipes and child processes=
.
> + *       A second SDMA copy through the old VA range is submitted withou=
t
> + *       the USERPTR BO in the bo_list.  The test verifies that the GPU
> + *       does not read back the original data pattern (0xAA), confirming
> + *       that the PTEs were properly invalidated.
> + *
> + *       Detection uses three complementary signals:
> + *         - GPU page faults logged by the kernel (klogctl)
> + *         - destination buffer containing only zeros (dummy page)
> + *         - absence of original 0xAA pattern in destination
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <sys/klog.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "ioctl_wrappers.h"
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_ip_blocks.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_utils.h"
> +
> +#define BUF_SZ                       (64 * 1024)
> +#define PM4_DW                       256
> +
> +#define STRESS_TARGET_SZ     (256UL * 1024 * 1024)
> +#define STRESS_CHILDREN              2048
> +#define STRESS_PIPES         200000
> +#define STRESS_SCAN_CHUNK    (4UL * 1024 * 1024)
> +#define STRESS_PTE_STEP              (64UL * 1024 * 1024)
> +
> +/**
> + * count_gpu_page_faults() - count GPU page faults in dmesg for a given
> +PID
> + * @pid: process ID to match in fault messages
> + * @since_uptime_ms: only count faults after this uptime (milliseconds)
> + *
> + * Read the kernel ring buffer via klogctl(3) and count lines
> +containing
> + * "[gfxhub] page fault" followed by the given PID on the next line.
> + * Only messages with a kernel timestamp >=3D @since_uptime_ms are count=
ed.
> + *
> + * Return: number of matching page fault entries.
> + */
> +static unsigned int
> +count_gpu_page_faults(pid_t pid, unsigned long since_uptime_ms) {
> +     int bufsize, len;
> +     char *buf, *p, *line_start;
> +     unsigned int count =3D 0;
> +     unsigned int total_lines =3D 0;
> +     unsigned int fault_lines =3D 0;
> +     char pid_pattern[64];
> +     bool prev_was_fault =3D false;
> +
> +     snprintf(pid_pattern, sizeof(pid_pattern), "pid %d ", (int)pid);
> +
> +     bufsize =3D klogctl(10, NULL, 0);
> +     if (bufsize <=3D 0)
> +             bufsize =3D 1 << 20;
> +
> +     buf =3D malloc(bufsize + 1);
> +     if (!buf)
> +             return 0;
> +
> +     len =3D klogctl(3, buf, bufsize);
> +     if (len <=3D 0) {
> +             free(buf);
> +             return 0;
> +     }
> +     buf[len] =3D '\0';
> +
> +     line_start =3D buf;
> +     for (p =3D buf; p <=3D buf + len; p++) {
> +             const char *ts_start;
> +             double ts;
> +
> +             if (*p !=3D '\n' && *p !=3D '\0')
> +                     continue;
> +
> +             *p =3D '\0';
> +             total_lines++;
> +
> +             /* Filter by kernel timestamp */
> +             ts_start =3D strchr(line_start, '[');
> +             if (ts_start && sscanf(ts_start, "[%lf]", &ts) =3D=3D 1) {
> +                     unsigned long ts_ms =3D (unsigned long)(ts * 1000.0=
);
> +
> +                     if (ts_ms < since_uptime_ms) {
> +                             prev_was_fault =3D false;
> +                             line_start =3D p + 1;
> +                             continue;
> +                     }
> +             }
> +
> +             if (strstr(line_start, "[gfxhub] page fault")) {
> +                     prev_was_fault =3D true;
> +                     fault_lines++;
> +             } else if (prev_was_fault && strstr(line_start, pid_pattern=
)) {
> +                     count++;
> +                     prev_was_fault =3D false;
> +             } else {
> +                     prev_was_fault =3D false;
> +             }
> +
> +             line_start =3D p + 1;
> +     }
> +
> +     igt_info("  klogctl: lines=3D%u faults=3D%u matched=3D%u\n",
> +              total_lines, fault_lines, count);
> +     free(buf);
> +     return count;
> +}
> +
> +/**
> + * get_uptime_ms() - read current system uptime in milliseconds
> + *
> + * Read /proc/uptime for the kernel monotonic timestamp that matches
> + * the timestamps used in dmesg.
> + *
> + * Return: uptime in milliseconds, or 0 on error.
> + */
> +static unsigned long get_uptime_ms(void) {
> +     FILE *fp;
> +     double uptime;
> +
> +     fp =3D fopen("/proc/uptime", "r");
> +     if (!fp)
> +             return 0;
> +     if (fscanf(fp, "%lf", &uptime) !=3D 1)
> +             uptime =3D 0;
> +     fclose(fp);
> +     return (unsigned long)(uptime * 1000.0); }
> +
> +/**
> + * amdgpu_userptr_unmap_revalidate() - test CS rejection after munmap
> + * @dev: amdgpu device handle
> + *
> + * Allocate a USERPTR BO, release its backing via munmap(), then submit
> + * a CS that still references the BO in its bo_list.  The kernel should
> + * detect that the BO pages are no longer valid and reject the CS.
> + *
> + * If the CS is accepted, the destination buffer is scanned for bytes
> + * that do not match the original fill or zero patterns.
> + */
> +static void amdgpu_userptr_unmap_revalidate(amdgpu_device_handle dev) {
> +     const struct amdgpu_ip_block_version *ip_block;
> +     struct amdgpu_ring_context *ring_context;
> +     amdgpu_bo_handle up_bo;
> +     amdgpu_va_handle up_va_h;
> +     uint64_t up_va;
> +     void *up_cpu;
> +     amdgpu_bo_handle dst_bo;
> +     amdgpu_va_handle dst_va_h;
> +     uint64_t dst_mc;
> +     void *dst_cpu_ptr;
> +     uint8_t *dst;
> +     unsigned int suspicious;
> +     uint64_t i;
> +     int r;
> +
> +     ip_block =3D get_ip_block(dev, AMDGPU_HW_IP_DMA);
> +     igt_assert(ip_block);
> +
> +     ring_context =3D calloc(1, sizeof(*ring_context));
> +     igt_assert(ring_context);
> +     ring_context->write_length =3D BUF_SZ;
> +     ring_context->pm4 =3D calloc(PM4_DW, sizeof(*ring_context->pm4));
> +     ring_context->pm4_size =3D PM4_DW;
> +     ring_context->secure =3D false;
> +     ring_context->res_cnt =3D 2;
> +     igt_assert(ring_context->pm4);
> +
> +     r =3D amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
> +     igt_assert_eq(r, 0);
> +
> +     /* Allocate and fill USERPTR BO */
> +     up_cpu =3D mmap(NULL, BUF_SZ, PROT_READ | PROT_WRITE,
> +                   MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1,
> 0);
> +     igt_assert(up_cpu !=3D MAP_FAILED);
> +     memset(up_cpu, 0x77, BUF_SZ);
> +
> +     r =3D amdgpu_create_bo_from_user_mem(dev, up_cpu, BUF_SZ, &up_bo);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
> +                               BUF_SZ, sysconf(_SC_PAGE_SIZE), 0,
> +                               &up_va, &up_va_h, 0);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0,
> AMDGPU_VA_OP_MAP);
> +     igt_assert_eq(r, 0);
> +
> +     /* Allocate VRAM destination */
> +     r =3D amdgpu_bo_alloc_and_map(dev, BUF_SZ, sysconf(_SC_PAGE_SIZE),
> +                                 AMDGPU_GEM_DOMAIN_VRAM,
> +
> AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +                                 &dst_bo, &dst_cpu_ptr, &dst_mc,
> +                                 &dst_va_h);
> +     igt_assert_eq(r, 0);
> +     memset(dst_cpu_ptr, 0, BUF_SZ);
> +
> +     /* Release USERPTR backing before CS */
> +     munmap(up_cpu, BUF_SZ);
> +
> +     /* Submit CS with invalidated USERPTR BO in bo_list */
> +     ring_context->bo_mc =3D up_va;
> +     ring_context->bo_mc2 =3D dst_mc;
> +     ring_context->resources[0] =3D up_bo;
> +     ring_context->resources[1] =3D dst_bo;
> +
> +     ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +                                  &ring_context->pm4_dw);
> +
> +     r =3D amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context,=
 1);
> +     r =3D ring_context->err_codes.err_code_cs_submit;
> +
> +     if (r !=3D 0) {
> +             igt_info("CS rejected (r=3D%d) after munmap\n", r);
> +     } else {
> +             dst =3D (uint8_t *)dst_cpu_ptr;
> +             suspicious =3D 0;
> +             for (i =3D 0; i < BUF_SZ; i++) {
> +                     if (dst[i] !=3D 0 && dst[i] !=3D 0x77)
> +                             suspicious++;
> +             }
> +             igt_info("CS completed: %u/%d unexpected bytes\n",
> +                      suspicious, BUF_SZ);
> +     }
> +
> +     amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc, BUF_SZ);
> +     amdgpu_bo_va_op(up_bo, 0, BUF_SZ, up_va, 0,
> AMDGPU_VA_OP_UNMAP);
> +     amdgpu_va_range_free(up_va_h);
> +     amdgpu_bo_free(up_bo);
> +     amdgpu_cs_ctx_free(ring_context->context_handle);
> +     free(ring_context->pm4);
> +     free(ring_context);
> +}
> +
> +/**
> + * amdgpu_userptr_unmap_stress() - stress test PTE invalidation
> + * @dev: amdgpu device handle
> + *
> + * Phase 1: Allocate a large USERPTR region filled with 0xAA, create a
> + *          VRAM destination BO, and perform an initial SDMA copy to
> + *          populate GPU page table entries.
> + *
> + * Phase 2: Release the USERPTR backing via munmap().  This triggers the
> + *          MMU notifier which should invalidate the GPU PTEs.
> + *
> + * Phase 3: Create memory pressure by opening many pipes and forking
> + *          child processes.  This increases the chance that the freed
> + *          physical pages are reassigned.
> + *
> + * Phase 4: Poison the destination with 0xCC and submit a second SDMA
> + *          copy through the old VA range without the USERPTR BO in the
> + *          bo_list.  If PTEs were invalidated, the GPU will fault and
> + *          the fault handler will redirect reads to a zeroed dummy page=
.
> + *          The test checks that no original 0xAA data appears in the
> + *          destination.
> + */
> +static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev) {
> +     const struct amdgpu_ip_block_version *ip_block;
> +     struct amdgpu_ring_context *ring_context;
> +     amdgpu_bo_handle up_bo;
> +     amdgpu_va_handle up_va_h;
> +     uint64_t up_va;
> +     void *up_cpu;
> +     amdgpu_bo_handle dst_bo;
> +     amdgpu_va_handle dst_va_h;
> +     uint64_t dst_mc;
> +     void *dst_cpu_ptr;
> +     int (*pipes)[2];
> +     unsigned int pipes_opened;
> +     pid_t *children;
> +     unsigned int children_spawned;
> +     uint64_t off;
> +     unsigned int i;
> +     pid_t pid;
> +     volatile uint8_t sink;
> +     uint8_t *base;
> +     uint8_t *scan;
> +     uint64_t p;
> +     unsigned int non_poison;
> +     unsigned int original_count;
> +     unsigned int page_faults;
> +     unsigned long ts_before;
> +     pid_t my_pid;
> +     int r;
> +
> +     up_bo =3D NULL;
> +     up_cpu =3D MAP_FAILED;
> +     pipes =3D NULL;
> +     pipes_opened =3D 0;
> +     children =3D NULL;
> +     children_spawned =3D 0;
> +
> +     ip_block =3D get_ip_block(dev, AMDGPU_HW_IP_DMA);
> +     igt_assert(ip_block);
> +
> +     ring_context =3D calloc(1, sizeof(*ring_context));
> +     igt_assert(ring_context);
> +     ring_context->pm4 =3D calloc(PM4_DW, sizeof(*ring_context->pm4));
> +     ring_context->pm4_size =3D PM4_DW;
> +     ring_context->secure =3D false;
> +     igt_assert(ring_context->pm4);
> +
> +     r =3D amdgpu_cs_ctx_create(dev, &ring_context->context_handle);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_bo_alloc_and_map(dev, STRESS_SCAN_CHUNK,
> +                                 sysconf(_SC_PAGE_SIZE),
> +                                 AMDGPU_GEM_DOMAIN_VRAM,
> +
> AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +                                 &dst_bo, &dst_cpu_ptr, &dst_mc,
> +                                 &dst_va_h);
> +     igt_assert_eq(r, 0);
> +
> +     /* Phase 1: allocate USERPTR region and establish GPU mappings */
> +     igt_info("Phase 1: allocating %lu MB USERPTR region\n",
> +              (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
> +
> +     up_cpu =3D mmap(NULL, STRESS_TARGET_SZ, PROT_READ |
> PROT_WRITE,
> +                   MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1,
> 0);
> +     igt_assert(up_cpu !=3D MAP_FAILED);
> +     memset(up_cpu, 0xAA, STRESS_TARGET_SZ);
> +
> +     r =3D amdgpu_create_bo_from_user_mem(dev, up_cpu,
> STRESS_TARGET_SZ,
> +                                        &up_bo);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
> +                               STRESS_TARGET_SZ,
> sysconf(_SC_PAGE_SIZE), 0,
> +                               &up_va, &up_va_h, 0);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
> +                          AMDGPU_VA_OP_MAP);
> +     igt_assert_eq(r, 0);
> +
> +     /* Touch pages at intervals to populate GPU PTEs */
> +     sink =3D 0;
> +     base =3D (uint8_t *)up_cpu;
> +     for (off =3D 0; off < STRESS_TARGET_SZ; off +=3D STRESS_PTE_STEP)
> +             sink +=3D base[off];
> +     (void)sink;
> +
> +     /* Initial SDMA copy to ensure GPU has walked the page tables */
> +     ring_context->bo_mc =3D up_va;
> +     ring_context->bo_mc2 =3D dst_mc;
> +     ring_context->write_length =3D STRESS_SCAN_CHUNK;
> +     ring_context->resources[0] =3D up_bo;
> +     ring_context->resources[1] =3D dst_bo;
> +     ring_context->res_cnt =3D 2;
> +
> +     ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +                                  &ring_context->pm4_dw);
> +     r =3D amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context,=
 0);
> +     igt_assert_eq(r, 0);
> +     igt_info("Phase 1: initial SDMA copy OK\n");
> +
> +     /* Phase 2: release USERPTR backing */
> +     igt_info("Phase 2: munmap() %lu MB USERPTR backing\n",
> +              (unsigned long)(STRESS_TARGET_SZ / (1024 * 1024)));
> +     my_pid =3D getpid();
> +     ts_before =3D get_uptime_ms();
> +     munmap(up_cpu, STRESS_TARGET_SZ);
> +     up_cpu =3D MAP_FAILED;
> +
> +     /* Phase 3: create memory pressure */
> +     igt_info("Phase 3: creating memory pressure\n");
> +
> +     pipes =3D calloc(STRESS_PIPES, sizeof(*pipes));
> +     igt_assert(pipes);
> +
> +     for (i =3D 0; i < STRESS_PIPES; i++) {
> +             if (pipe(pipes[i]) < 0) {
> +                     igt_info("  pipe allocation stopped at %u/%d (errno=
=3D%d)\n",
> +                              i, STRESS_PIPES, errno);
> +                     break;
> +             }
> +             (void)write(pipes[i][1], "X", 1);
> +             pipes_opened =3D i + 1;
> +     }
> +     igt_info("  opened %u pipes\n", pipes_opened);
> +
> +     children =3D calloc(STRESS_CHILDREN, sizeof(*children));
> +     igt_assert(children);
> +
> +     for (i =3D 0; i < STRESS_CHILDREN; i++) {
> +             pid =3D fork();
> +             if (pid =3D=3D 0) {
> +                     pause();
> +                     _exit(0);
> +             }
> +             igt_assert(pid > 0);
> +             children[i] =3D pid;
> +             children_spawned =3D i + 1;
> +     }
> +     igt_info("  spawned %u children\n", children_spawned);
> +
> +     /*
> +      * Phase 4: submit SDMA copy through the old VA range.
> +      *
> +      * The USERPTR BO is intentionally omitted from the bo_list so
> +      * the kernel does not attempt to revalidate it.  If the PTEs
> +      * were invalidated, the SDMA engine will fault and the kernel
> +      * fault handler will map a zeroed dummy page, so the
> +      * destination will contain zeros instead of the original 0xAA.
> +      */
> +     igt_info("Phase 4: submitting CS through unmapped VA range\n");
> +
> +     memset(dst_cpu_ptr, 0xCC, STRESS_SCAN_CHUNK);
> +
> +     memset(ring_context->pm4, 0, PM4_DW * sizeof(uint32_t));
> +     ring_context->pm4_dw =3D 0;
> +     ring_context->bo_mc =3D up_va;
> +     ring_context->bo_mc2 =3D dst_mc;
> +     ring_context->write_length =3D STRESS_SCAN_CHUNK;
> +     ring_context->res_cnt =3D 1;
> +     ring_context->resources[0] =3D dst_bo;
> +
> +     ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
> +                                  &ring_context->pm4_dw);
> +
> +     r =3D amdgpu_test_exec_cs_helper(dev, ip_block->type, ring_context,=
 1);
> +     if (ring_context->err_codes.err_code_cs_submit !=3D 0) {
> +             igt_info("  CS rejected (r=3D%d)\n",
> +                      ring_context->err_codes.err_code_cs_submit);
> +             goto cleanup;
> +     }
> +
> +     /* Scan destination for original data pattern */
> +     scan =3D (uint8_t *)dst_cpu_ptr;
> +     non_poison =3D 0;
> +     original_count =3D 0;
> +     for (p =3D 0; p < STRESS_SCAN_CHUNK; p++) {
> +             if (scan[p] !=3D 0xCC)
> +                     non_poison++;
> +             if (scan[p] =3D=3D 0xAA)
> +                     original_count++;
> +     }
> +
> +     igt_info("  %u/%lu non-poison bytes (%u original 0xAA)\n",
> +              non_poison, (unsigned long)STRESS_SCAN_CHUNK,
> +              original_count);
> +
> +cleanup:
> +     for (i =3D 0; i < children_spawned; i++) {
> +             kill(children[i], SIGKILL);
> +             waitpid(children[i], NULL, 0);
> +     }
> +     free(children);
> +
> +     for (i =3D 0; i < pipes_opened; i++) {
> +             close(pipes[i][0]);
> +             close(pipes[i][1]);
> +     }
> +     free(pipes);
> +
> +     /*
> +      * Read GPU page faults after releasing file descriptors so
> +      * klogctl has room to work.  Brief sleep to let deferred
> +      * printk flush any remaining fault messages.
> +      */
> +     usleep(500000);
> +     page_faults =3D count_gpu_page_faults(my_pid, ts_before);
> +     igt_info("  %u GPU page faults for PID %d\n",
> +              page_faults, (int)my_pid);
> +
> +     if (up_bo) {
> +             amdgpu_bo_va_op(up_bo, 0, STRESS_TARGET_SZ, up_va, 0,
> +                             AMDGPU_VA_OP_UNMAP);
> +             amdgpu_va_range_free(up_va_h);
> +             amdgpu_bo_free(up_bo);
> +     }
> +
> +     amdgpu_bo_unmap_and_free(dst_bo, dst_va_h, dst_mc,
> STRESS_SCAN_CHUNK);
> +     amdgpu_cs_ctx_free(ring_context->context_handle);
> +     free(ring_context->pm4);
> +     free(ring_context);
> +
> +     /*
> +      * Invalidation is confirmed when any of the following holds:
> +      *
> +      *   (a) CS was rejected outright (already handled above).
> +      *   (b) GPU page faults were logged for this PID.
> +      *   (c) Destination contains non-original data (zeros from the
> +      *       dummy page), proving PTEs no longer point at the old
> +      *       physical pages.
> +      *
> +      * Page fault messages may be suppressed by printk ratelimiting,
> +      * so the data pattern check (c) is the primary detection method.
> +      */
> +     if (page_faults > 0) {
> +             igt_info("PTE invalidation confirmed: %u page faults\n",
> +                      page_faults);
> +     } else if (non_poison > 0 && original_count =3D=3D 0) {
> +             igt_info("PTE invalidation confirmed: dummy page data\n");
> +     } else {
> +             igt_assert_f(non_poison =3D=3D 0 || original_count =3D=3D 0=
,
> +                          "destination contains %u bytes of original dat=
a "
> +                          "(0xAA) after munmap with no GPU page faults\n=
",
> +                          original_count);
> +     }
> +}
> +
> +int igt_main()
> +{
> +     amdgpu_device_handle device;
> +     struct amdgpu_gpu_info gpu_info =3D {0};
> +     uint32_t major, minor;
> +     int fd =3D -1;
> +     int r;
> +     bool arr_cap[AMD_IP_MAX] =3D {0};
> +
> +     igt_fixture() {
> +             log_total_time(true, igt_test_name());
> +             fd =3D drm_open_driver(DRIVER_AMDGPU);
> +
> +             r =3D amdgpu_device_initialize(fd, &major, &minor, &device)=
;
> +             igt_require(r =3D=3D 0);
> +
> +             igt_info("Initialized amdgpu, driver version %d.%d\n",
> +                      major, minor);
> +
> +             r =3D amdgpu_query_gpu_info(device, &gpu_info);
> +             igt_assert_eq(r, 0);
> +
> +             r =3D setup_amdgpu_ip_blocks(major, minor, &gpu_info, devic=
e);
> +             igt_assert_eq(r, 0);
> +
> +             asic_rings_readness(device, 1, arr_cap);
> +     }
> +
> +     igt_describe("Submit CS with USERPTR BO in bo_list after munmap "
> +                  "and verify the kernel rejects it");
> +     igt_subtest_with_dynamic("userptr-unmap-revalidate") {
> +             igt_require(arr_cap[AMD_IP_DMA]);
> +             igt_dynamic_f("userptr-unmap-revalidate")
> +                     amdgpu_userptr_unmap_revalidate(device);
> +     }
> +
> +     igt_describe("Stress test: release large USERPTR backing under "
> +                  "memory pressure and verify GPU PTEs are invalidated")=
;
> +     igt_subtest_with_dynamic("userptr-unmap-stress") {
> +             igt_require(arr_cap[AMD_IP_DMA]);
> +             igt_dynamic_f("userptr-unmap-stress")
> +                     amdgpu_userptr_unmap_stress(device);
> +     }
> +
> +     igt_fixture() {
> +             amdgpu_device_deinitialize(device);
> +             drm_close_driver(fd);
> +             log_total_time(false, igt_test_name());
> +     }
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build index
> 0dc689e40..801239547 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -53,6 +53,7 @@ if libdrm_amdgpu.found()
>                         'amd_vpe',
>                         'amd_mem',
>                         'amd_remote_mem',
> +                          'amd_userptr_invalidation',
>                       ]
>       if libdrm_amdgpu.version().version_compare('> 2.4.97')
>               amdgpu_progs +=3D[ 'amd_syncobj', ]
> --
> 2.54.0

