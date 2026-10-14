Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A6FCC6B1D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 13:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7127610E064;
	Wed, 14 Oct 2026 13:26:44 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012050.outbound.protection.outlook.com
 [40.93.195.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289BF10E91D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 13:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0lxtm4pz8xdz5o0ijuF//dFCpBWaybOHoKymEtRwEeR1xmVT7Bzi3Toh4he5PyBst79SQQsCA6O/CLXRsJhbdN5i4x56lr76iW2RpiqCWhHrh+4bTxzM4Z5KICW9PAGFVbkYMF/ODsLTYBK2bVWXxrfj4AiNAiS8Z67JSLPNnCqE5J4VhNKia7CmbLa1ZGi0Vt705CdDk97wUgXSl9kywfDZ0An/3S/F451Qvujmx8XwD2p4uHl7+wZgoyB8F1Dt5Ef700C97MNItPaJBMWCtpY/vrdhJnx1UXmoA7ktSDsfELFkj1b34z7QKWfEIC4eIsSqrN5UbQ1vMymkChwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/+SSKw8GwxUoUzAbGAFBejJXVkxTwXzp2AYKoYj/o8=;
 b=YbUVBKkN2WdZPGFaakvX7DQC3wvwe5QzALzJyLZYH4REkOksX+K3AHyQL3ika9+W0xHxtYBnLdyENjLZGKfo/vXQVC6PuWIWP8XZPw+76298O0p3j4O5x+UWlRULLerKYe34TjHSaV0WK3fvYVewb0DD6Fv7DgWuJka22ceVkuhe+tFVb2fECIRs/QEO9dFBCyNb8bA7fi8jnIcGOV6CAotJ8LxFlqPY0g9jidumvahj04PlcikH7WnvCUygmwVxZRpXRVdQoPcjjV5ImDtYTzhZ8qFmzkquK/g47A3UBfqh/wRghN0gyWxDFFUJd2Hhs8MlqVoh6HXNcmHIYYeJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/+SSKw8GwxUoUzAbGAFBejJXVkxTwXzp2AYKoYj/o8=;
 b=mFq7gzROgm1o9AYjkyJhX7mjuXoV1RmgL9WTrYFsNt746PFW/Pxx9fsUNe+5DUj9xO66oAk1h8Zz73FS/knj64HT9hnGM8CXjmzwFaPmOztP/rxqOF/SRDG63FCuOpjobYBCPndBoA8vweN7UEQV3SbLAU+SBwXS061DACHAL+Y=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by CH1PPFDA34A4201.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::625) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.35; Wed, 14 Oct
 2026 13:25:47 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:25:47 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, Simona Vetter
 <simona@ffwll.ch>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Topic: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Index: AQHdVmXmMW9uqLKDx0S/oDHXh66Ci7b809oAgAA92q8=
Date: Wed, 14 Oct 2026 13:25:47 +0000
Message-ID: <SA1PR12MB8144A801C8B706E82296CC25EF9D2@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <DM4GOOY2F8D7.1RBHG2IGLKI7N@intel.com>
In-Reply-To: <DM4GOOY2F8D7.1RBHG2IGLKI7N@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-14T13:25:46.225Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|CH1PPFDA34A4201:EE_
x-ms-office365-filtering-correlation-id: 51aa27a5-c0d8-41d8-69e7-08df29f6a83f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|261009221227099003|10067099003|38070700021|4143699003|11063799006|56012099006|261009223027099003;
x-microsoft-antispam-message-info: Lo2TZsJFYO6g3N4xHhYiwCN1RW07tpBFmE6TSK4lQ/Y0ny4DdzQXh3svJiVxaaK2vrE4CDZiMLQriWkVEntU02PIGhLwSMNQBx30LcRYE4qiq7lYXTt1aZB2MoqjYuVSMvTJ3MC0fnpc+MYo5F43kSGLzDrb/mF36edHTZs5HrWaP7CPS3N2Ayq9lMYgHaNq+z4mW6KikuFGPLO7o2D6/Ve621yiBpiUJ4bLvAS/1r7TKHtZsz1j/+V3hpcaCjFfmQYsrFDxjkXE3RRckuugnDjCJDH1XOvZ70GrGby27r+pbkF6963N7uNTdSztVy8nqDplz//mbv8HfJae3tzHGCPN/B9VSnYD/amQQCyWuLjj5457DWW2bBgxhdj6+IgroLKA6GU6gW3Tj2sqbKuWBC0fCrR2lmcm1sNkMzdj6rw8wYPw20q/eD0M57350saIYqjXHEZaQeczS0ddemAnwxNUn4gPGxcgmi0HfHbRn3OgJWT76l87xYWStlOKLqcB0po2vNYPZPP3oaS42PSAJSR0bg9sr6rLudjQtwx/PVWEnTGilSFbv5ziv7E+E+jDHZ46ge88DLlKxqn0m2dzzXgDqpVZvhD+B2e+sgfO0cOGjnWXjJuZ0hMNqib6hhxuSh2udx4qGW/AdXtQdRWeBzXR9gxpmt0GgrpoOSCKnik=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(261009221227099003)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IDcQeqIZKEwSKci/G7pP7/95lcVivpZ7h11K+5kTDA8LOduo2/mZmpa9mq?=
 =?iso-8859-1?Q?FP0Cm+75ihVNe+EMFM99FHn+78yo/aADADNEW0aqB1wf/fOKVvgpl+lqv/?=
 =?iso-8859-1?Q?tc0VYHH2/W6BvZSHtC/W/eZqfsa3hZD+PjoTwLVAJH5QTvA3t+4Sz46Mub?=
 =?iso-8859-1?Q?INtm1OH8IVvmb1e0w3TYqh7MMre3RxvGuZjPUjOuR2sRR7xHaFyfermtfv?=
 =?iso-8859-1?Q?3vFGQuSZySWAiu6CM96n9AjCBMotemFLW2RbKgk7EJ1XyBUUCNmWCR4VsD?=
 =?iso-8859-1?Q?ixrW+xl7FwhbzNL/6ydXu2kxQRL9v0NzLBAq2CXTRYD3jFQ8f7rTo/wec3?=
 =?iso-8859-1?Q?K9KJypqGK1SmO7rSDvD4k4swYNGTP81ceELN5L28QI2nMz9lyM3reTF/rP?=
 =?iso-8859-1?Q?RH0SZkXK9j5M4XjwNwY5d6uGsnBUIkTojrlH7LRpAgVkYCIeQD+0XUVBUM?=
 =?iso-8859-1?Q?swmWVWII7dqjDC+AFvDmrA/U3nYRf8sthEsuMASjDr26MGnarAm4bsbeSZ?=
 =?iso-8859-1?Q?6csktXhqjwjCXvxFJQZwU0OBpv8qJu6HJeZ9CZ161IAHyVpOLUrMT+tVZs?=
 =?iso-8859-1?Q?Cg/eNeohJdPDZG6dAuSIxFvEn41cFOwLR7GUFOapKEIAMhGvRpKRWiG3If?=
 =?iso-8859-1?Q?vQM2cCfjOjljxje7aI1G93hDMaurg/riPoeGQBjTsC1+Dh4QSU6eOZYeJe?=
 =?iso-8859-1?Q?C6RDPhksz9u3lAcnTIF/zdcaTcu7kNK08kBJhlhYSoqjMDibuQVbEPY85k?=
 =?iso-8859-1?Q?/GtTjQ6864HrWrMwNpnxyDLKRXM1s4Wc6FahQ1EYvgb/3DGRbEfHoM6790?=
 =?iso-8859-1?Q?BgW5DctD/XxU8xbutZ3oJiFwfNawOvTTKy0OFi/EAwn2hnJ9AuAkqT4kIm?=
 =?iso-8859-1?Q?IlnWEy9598v4sx78cW/QqrYNEpZdqMFxkS86RdBAwbptDPcdRApn7KhhS/?=
 =?iso-8859-1?Q?6wmhhEIQPKuZzO0LVP0G+LVl4vIRac6+Kg9cAs6q5OeM8wiyMIHpDIs4gs?=
 =?iso-8859-1?Q?VbpB0atYfjBTSNo5AwFdmLzC+NSxrss4GazIGuFBM4YBX9au4lQOILwV/x?=
 =?iso-8859-1?Q?EUo9l742HsUqotrjyBHpTonhpDEMOe7zht6Mw5qBR49jwixwnwtDBnEnDC?=
 =?iso-8859-1?Q?KAoNWucKdHvRaVJzzhh8OrfQ9nwci2KIxs50iEq4JvrowWbqCM8/hLxNAX?=
 =?iso-8859-1?Q?CpKGbyGmFkRTRlHKbLN7Z1gVJuUNeMHKt4PJ16SijuPShUoZHA3cHCht4+?=
 =?iso-8859-1?Q?7zuJV8HKsrF5K+cfx1ap3kSR/pFO1lk7tXCi+gd+KaA3iCWwYD2xOqQkCn?=
 =?iso-8859-1?Q?Eb99ZXuYouCHKw/5nlxIBWyAeExIbfCdf0nGarLDbcrYrnX64YXcbys2tW?=
 =?iso-8859-1?Q?GDfDWlziqc7OtQF4WKt/TgpsjH5Ug19veV9lgHlayyj4qhFIY2AaPGnYvq?=
 =?iso-8859-1?Q?jXuGeNe+mP5CESz8XDeFKqmLsd1+qnb11DIP80qlZvDLG3hTuBmYRv8jLb?=
 =?iso-8859-1?Q?S/tKYTqc0mUYSZsM11AA3onE8SmiqyvdZFnBOP/+mzNXp+Hgg3ZPojZPUN?=
 =?iso-8859-1?Q?54bcCsINOl3qhY693wnF38xLOKxacS454aace0a0f7zj4vimVE9ryg48Y9?=
 =?iso-8859-1?Q?iBlUOkWWyLJeKtaF5ZDtnm0+xDbyQT4PQDhbPHdgNwKEUHyyVb9KqhNv3L?=
 =?iso-8859-1?Q?6scoVssZcPn3eCbXXLcaHEl3T4bCm3gKDIRz68KOUgqpuuHUwFFSnEEETF?=
 =?iso-8859-1?Q?9MGj1lxZIygMRunA/yiGJSlQpOY+NTwBXSaRaOQV5yFxwz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aa27a5-c0d8-41d8-69e7-08df29f6a83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:25:47.0893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lo3Ps2Kk+RMpCN3AQZfY7TstyUHe+NPlv2f0GbQvt7E6HENymt0b55chYxAVqj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA34A4201
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

> Overall, this series looks much better now. One open question for Kamil:
> since these tests exercise functionality that's currently disabled in
> the kernel (drm_invalid_op), and the IGT coverage is meant to be a
> prerequisite for bringing this feature back, how do we properly test it
> in the meantime?
There's a kernel patch on dri-devel
"[PATCH v2] Fix and enable CHANGE_HANDLE".
You'd need to apply that patch manually for testing.

Rest of feedback is appreciated and should be straightforward

Thanks,
David

________________________________________
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Sent: Wednesday, October 14, 2026 5:42 AM
To: Francis, David; igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com; Prosyak, Vitaly; Kamil Konieczny; Sebastian =
Brzezinka; Koenig, Christian; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests fo=
r GEM_CHANGE_HANDLE

Hi David,

On Wed Oct 7, 2026 at 4:12 PM CEST, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
>
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This =
IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  2 files changed, 748 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle.c
>
> diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_han=
dle.c
> new file mode 100644
> index 000000000..23f2f8b39
> --- /dev/null
> +++ b/tests/intel/gem_change_handle.c
> @@ -0,0 +1,747 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation
> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardles=
s
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object crea=
tion
> + *    on Intel platforms, though it works vendor-agnostically via DRM co=
re
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functio=
nal-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright head=
er
> + *
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
a
It looks like fcntl is not used anymore.

> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
same here

> +#include <signal.h>
and here
> +#include <string.h>
> +#include <sys/stat.h>
and here, please double check it, I may have missed some usage.

> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +/* AMDGPU includes (if available) */
> +#if __has_include("igt_amd.h")
> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +static bool verbose_logging;
> +
> +/**
> + * TEST: gem change handle
> + * Description: tests for drm ioctl GEM_CHANGE_HANDLE
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
> + * Feature: gem
> + * Run type: FULL
> + *
> + * SUBTEST: sanity
> + * Description: Changing a handle to a new value works as intended
> + *
> + * SUBTEST: change_prime
> + * Description: Changing a handle affects the result of prime import
> + *
> + * SUBTEST: new_handle_zero
> + * Description: Changing a handle to 0 should fail
> + *
> + * SUBTEST: new_handle_exceeds_int_max
> + * Description: Changing a handle to > INT_MAX should fail
> + *
> + * SUBTEST: new_handle_equals_old_handle
> + * Description: Changing a handle to itself should fail
> + *
> + * SUBTEST: new_handle_taken
> + * Description: Changing a handle to a value already in use should fail
> + *
> + * SUBTEST: invalid_handle
> + * Description: Changing a non-existent handle should fail
> + *
> + * SUBTEST: race_change_change
> + * Description: Test for race conditions between two GEM_CHANGE_HANDLE
> + *
> + * SUBTEST: race_change_create_close
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, GEM_=
CREATE, and GEM_CLOSE
> + *
> + * SUBTEST: race_change_export_import
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, prim=
e export, and prime import
> + */
> +
> +IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANGE_=
HANDLE");
> +
> +/* Structs */
> +
> +/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers=
 */
> +#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
> +struct drm_gem_change_handle {
> +     __u32 handle;
> +     __u32 new_handle;
> +};
> +
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_cha=
nge_handle)
> +#endif
> +
> +/* Driver type detection */
> +enum gpu_driver {
> +     DRIVER_TYPE_UNKNOWN =3D 0,
> +     DRIVER_TYPE_I915,
> +     DRIVER_TYPE_AMDGPU,
> +};
> +
> +/* GPU context structure */
> +struct gpu_ctx {
> +     int fd;
> +     enum gpu_driver driver;
> +};
> +
> +/* Helpers */
> +
> +static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
> +{
> +     uint32_t handle =3D 0;
> +
> +     switch (ctx->driver) {
> +     case DRIVER_TYPE_I915: {
> +             struct drm_i915_gem_create create =3D { .size =3D size };
> +
> +             do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
> +             handle =3D create.handle;
> +             break;
> +     }
> +     case DRIVER_TYPE_AMDGPU:
> +#if HAS_AMDGPU
> +             handle =3D igt_amd_create_bo(ctx->fd, size);
> +#else
> +             igt_require_f(0, "AMDGPU header not found for AMDGPU driver=
\n");
> +#endif
> +             break;
> +     default:
> +             igt_assert_f(0, "Unsupported driver\n");
> +     }
> +
> +     igt_assert(handle !=3D 0);
> +     return handle;
> +}
> +
> +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> +{
> +     struct drm_gem_close close_args =3D { .handle =3D handle };
> +
> +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> +}
> +
> +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, u=
int32_t new_handle)
> +{
> +     struct drm_gem_change_handle args =3D {
> +             .handle =3D old_handle,
> +             .new_handle =3D new_handle,
> +     };
> +     return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> +}
> +
> +static enum gpu_driver detect_driver(int fd)
> +{
> +     /* Check AMDGPU first (primary target) */
> +     if (is_amdgpu_device(fd))
> +             return DRIVER_TYPE_AMDGPU;
> +     if (is_i915_device(fd))
> +             return DRIVER_TYPE_I915;
> +     return DRIVER_TYPE_UNKNOWN;
> +}
> +
> +/* Sanity and Functionality tests */
> +
> +/**
> + * test_sanity - verify rename actually works
> + *
> + * After a successful rename:
> + * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
> + * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
> + */
> +static void test_sanity(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle, new_h;
> +     int ret;
> +
> +     handle =3D gem_create_bo(ctx, 4096);
> +     new_h =3D handle + 1000;
> +
> +     /* Perform the rename */
> +     ret =3D gem_change_handle(ctx, handle, new_h);
> +     igt_assert_f(ret =3D=3D 0,
> +                  "gem_change_handle(%u -> %u) failed: %s\n",
> +                  handle, new_h, strerror(errno));
> +
> +     /* Old handle must be invalid now */
> +     ret =3D gem_close_bo(ctx, handle);
> +     igt_assert_f(ret < 0 && errno =3D=3D EINVAL,
> +                  "GEM_CLOSE(old_handle=3D%u) should fail with EINVAL, "
> +                  "got ret=3D%d errno=3D%d (%s)\n",
> +                  handle, ret, errno, strerror(errno));
> +
> +     /* New handle must be valid */
> +     ret =3D gem_close_bo(ctx, new_h);
> +     igt_assert_f(ret =3D=3D 0,
> +                  "GEM_CLOSE(new_handle=3D%u) should succeed, "
> +                  "got ret=3D%d errno=3D%d (%s)\n",
> +                  new_h, ret, errno, strerror(errno));
> +}
> +
> +/**
> + * test_change_export - changing a handle affects prime import
> + *
> + * Importing a prime object that has had its handle changed since it was
> + * exported should get the new handle
> + */
> +static void test_change_export(struct gpu_ctx *ctx)
> +{
> +     int ret, handle1, handle2, dmabuf_fd, imported_handle;
> +
> +     /* Create a handle and export it */
> +     handle1 =3D gem_create_bo(ctx, 4096);
> +     handle2 =3D handle1 + 1;
> +     dmabuf_fd =3D prime_handle_to_fd(ctx->fd, handle1);
> +
> +     /* When you import, you get the same handle back */
> +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +     igt_assert_eq(imported_handle, handle1);
> +
> +     /* Change the handle (should succeed) */
> +     ret =3D gem_change_handle(ctx, handle1, handle2);
> +     igt_assert_eq(ret, 0);
> +
> +     /* Import, should get the new handle */
> +     imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +     igt_assert_eq(imported_handle, handle2);
> +
> +     /* Confirm gem object is at the new handle */
> +     igt_assert_eq(gem_close_bo(ctx, handle2), 0);
> +
> +     ret =3D gem_close_bo(ctx, handle1);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     close(dmabuf_fd);
> +}
> +
> +/* Edge case and fail case tests */
> +
> +/**
> + * test_new_handle_zero - new_handle =3D 0 should fail
> + *
> + * 0 is not a valid gem handle.
> + */
> +static void test_new_handle_zero(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle;
> +     int ret;
> +
> +     handle =3D gem_create_bo(ctx, 4096);
> +
> +     /* new_handle =3D 0 must fail with -EINVAL */
> +     ret =3D gem_change_handle(ctx, handle, 0);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     /* Original handle should still be valid */
> +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
> + *
> + * The kernel enforces an idr_alloc() limitation: new_handle must be <=
=3D INT_MAX.
> + */
> +static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle;
> +     int ret;
> +
> +     handle =3D gem_create_bo(ctx, 4096);
> +
> +     /* new_handle > INT_MAX must fail with -EINVAL */
> +     ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     /* Also test 0xFFFFFFFF */
> +     ret =3D gem_change_handle(ctx, handle, 0xFFFFFFFF);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     /* Original handle should still be valid */
> +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_equals_old_handle - new_handle =3D old_handle should =
fail
> + *
> + * The ioctl treats old_handle =3D new_handle as invalid input.
> + */
> +static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle;
> +     int ret;
> +
> +     handle =3D gem_create_bo(ctx, 4096);
> +
> +     /* new_handle =3D old_handle must fail with -EINVAL */
> +     ret =3D gem_change_handle(ctx, handle, handle);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     /* same thing if handle doesn't exist */
> +     ret =3D gem_change_handle(ctx, handle + 1, handle + 1);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EINVAL);
> +
> +     /* Original handle should still be valid */
> +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_taken - new_handle being the handle of another gem ob=
ject must fail
> + *
> + * Not allowed to change a handle to a handle that's already taken
> + */
> +static void test_new_handle_taken(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle, handle_2;
> +     int ret;
> +
> +     handle =3D gem_create_bo(ctx, 4096);
> +     handle_2 =3D gem_create_bo(ctx, 4096);
> +
> +     /* new_handle is taken must fail with -ENOSPC (direct from idr_allo=
c) */
> +     ret =3D gem_change_handle(ctx, handle, handle_2);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, ENOSPC);
> +
> +     /* And the other way */
> +     ret =3D gem_change_handle(ctx, handle_2, handle);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, ENOSPC);
> +
> +     /* Original handles should still be valid */
> +     igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +     igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
> +}
> +
> +/**
> + * test_invalid_handle - non-existent handle should fail
> + *
> + * Using a handle that doesn't exist should return -ENOENT.
> + */
> +static void test_invalid_handle(struct gpu_ctx *ctx)
> +{
> +     int ret;
> +
> +     /* Use a handle that was never allocated */
> +     ret =3D gem_change_handle(ctx, 0xDEAD, 0xBEEF);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, ENOENT);
> +
> +     /* Handle 0 is also invalid */
> +     ret =3D gem_change_handle(ctx, 0, 100);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, ENOENT);
> +}
> +
> +/* Race condition test structs and helpers */
> +
> +struct change_handle_thread_data {
> +     struct gpu_ctx *ctx;
> +     uint32_t handles[4];
> +     bool running;
> +     int unexpected_errno;
> +     pthread_barrier_t barrier;
> +};
> +
> +static void set_up_context(struct change_handle_thread_data *data, struc=
t gpu_ctx *ctx)
> +{
> +     data->handles[0] =3D gem_create_bo(ctx, BO_SIZE);
> +     igt_assert(data->handles[0] !=3D 0);
> +     data->handles[1] =3D gem_create_bo(ctx, BO_SIZE);
> +     igt_assert(data->handles[1] !=3D 0);
> +
> +     data->ctx =3D ctx;
> +     data->handles[2] =3D max(data->handles[0], data->handles[1]) + 0x10=
;
> +     data->handles[3] =3D max(data->handles[0], data->handles[1]) + 0x20=
;
> +     data->unexpected_errno =3D 0;
> +     __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
> +
> +     pthread_barrier_init(&data->barrier, NULL, 2);
> +}
> +
> +/* Race condition test threads */
> +
> +static void *change_handle_thread(void *arg)
> +{
> +     struct change_handle_thread_data *data =3D arg;
> +     uint32_t *h =3D data->handles;
> +     int from[] =3D {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2=
], h[1], h[0], h[2]};
> +     int to[] =3D   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0=
], h[3], h[3], h[1]};
It may be a nit, but from[] and to[]=A0are int while holding uint32_t
values, it would be good to unify the types.

> +     int ret;
> +
> +     pthread_barrier_wait(&data->barrier);
> +
> +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +             for (int i =3D 0; i < 12; i++) {
> +                     ret =3D gem_change_handle(data->ctx, from[i], to[i]=
);
> +                     /*
> +                      * Expected errors:
> +                      * - ENOENT: old handle invalid
> +                      * - ENOSPC: target handle occupied (collision dete=
cted during idr_alloc)
> +                      */
> +                     if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D E=
NOSPC)
> +                             data->unexpected_errno =3D errno;
> +             }
> +
> +             sched_yield();
> +     }
> +
> +       return NULL;
spaces instead of a tab

> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +     struct change_handle_thread_data *data =3D arg;
> +     uint32_t *h =3D data->handles;
> +     pthread_t tid =3D pthread_self();
> +     int handle, i, ret;
> +
> +     pthread_barrier_wait(&data->barrier);
> +
> +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +             /* Close a handle; keep trying until success */
> +             i =3D 0;
> +             while (true) {
> +                     ret =3D gem_close_bo(data->ctx, h[i]);
> +                     if (ret =3D=3D 0) {
> +                             if (verbose_logging) {
> +                                     igt_info("[CLOSE-TID:%lu] Closed ha=
ndle %u\n",
> +                                              (unsigned long)tid, h[i]);
> +                             }
> +                             break;
> +                     }
> +
> +                     i +=3D 1;
> +                     if (i > 3)
> +                             i =3D 0;
> +
> +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQUI=
RE))
> +                             return NULL;
> +             }
> +
> +             /* Open a handle */
> +             handle =3D gem_create_bo(data->ctx, BO_SIZE);
> +             if (verbose_logging) {
> +                     igt_info("[CLOSE-TID:%lu] Created new BO with handl=
e %u\n",
> +                              (unsigned long)tid, handle);
> +             }
> +
> +             /* If the opened handle isn't one of the four ones being
> +              * shuffled, change_handle it in. Keep trying until success=
.
> +              */
> +             if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2=
] && handle !=3D h[3]) {
> +                     i =3D 0;
> +                     while (true) {
> +                             ret =3D gem_change_handle(data->ctx, handle=
, h[i]);
> +                             if (ret =3D=3D 0) {
> +                                     if (verbose_logging) {
> +                                             igt_info("[CLOSE-TID:%lu] C=
hange handle %u to %u\n",
> +                                                      (unsigned long)tid=
, handle, h[i]);
> +                                     }
> +                                     break;
> +                             }
> +
> +                             if (ret !=3D 0 && errno !=3D ENOENT && errn=
o !=3D ENOSPC)
> +                                     data->unexpected_errno =3D errno;
> +
> +                             i +=3D 1;
> +                             if (i > 3)
> +                                     i =3D 0;
> +
> +                             if (!__atomic_load_n(&data->running, __ATOM=
IC_ACQUIRE))
> +                                     return NULL;
> +                     }
> +             }
> +
> +             sched_yield();
> +     }
> +
> +     return NULL;
> +}
> +
> +static void *export_import_thread(void *arg)
> +{
> +     struct change_handle_thread_data *data =3D arg;
> +     struct drm_prime_handle prime_args;
> +     uint32_t *h =3D data->handles;
> +     pthread_t tid =3D pthread_self();
> +     int handle, i, ret, dmabuf_fd;
> +
> +     pthread_barrier_wait(&data->barrier);
> +
> +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +             /* Export a handle; keep trying until success */
> +             i =3D 0;
> +             while (true) {
> +                     prime_args.handle =3D h[i];
> +                     prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> +                     ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HA=
NDLE_TO_FD, &prime_args);
> +                     if (ret =3D=3D 0) {
> +                             if (verbose_logging) {
> +                                     igt_info("[PRIME-TID:%lu] Exported =
handle %u\n",
> +                                              (unsigned long)tid, h[i]);
> +                             }
> +                             break;
> +                     }
> +
> +                     i +=3D 1;
> +                     if (i > 3)
> +                             i =3D 0;
> +
> +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQUI=
RE))
> +                             return NULL;
> +             }
> +
> +             dmabuf_fd =3D prime_args.fd;
> +
> +             /* Import the handle; it should be one of the four handles =
in the shuffle */
> +             prime_args.fd =3D dmabuf_fd;
> +             prime_args.flags =3D 0;
> +             ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HAND=
LE, &prime_args);
> +
> +             igt_assert_eq(ret, 0);
I don't think you can assert in a worker thread. It doesn't return
cleanly.

> +             handle =3D prime_args.handle;
> +             if (verbose_logging) {
> +                     igt_info("[PRIME-TID:%lu] Imported; got handle %u\n=
",
> +                              (unsigned long)tid, handle);
> +             }
> +             igt_assert(handle =3D=3D h[0] || handle =3D=3D h[1] || hand=
le =3D=3D h[2] || handle =3D=3D h[3]);
Same here.

> +
> +             close(dmabuf_fd);
> +
> +             sched_yield();
> +     }
> +
> +     return NULL;
> +}
> +
> +/* Race condition tests */
> +
> +/**
> + * test_race_change_change - Test for race conditions of change_handle a=
gainst itself
> + *
> + * Start two threads, each of which constantly attempt changes between f=
our different handles
> + * Try to catch race conditions such as changing same handle to two diff=
erent handles,
> + * Changing two handles to the same handle, changing a handle to a handl=
e itself being changed,
> + * etc.
> + */
> +static void test_race_change_change(struct gpu_ctx *ctx)
> +{
> +     pthread_t thread_change_1, thread_change_2;
> +     struct change_handle_thread_data data =3D {0};
> +     int num_handles, ret;
> +
> +     set_up_context(&data, ctx);
> +
> +     /* Start both threads simultaneously */
> +     igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handle_=
thread, &data), 0);
> +     igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handle_=
thread, &data), 0);
> +
> +     /* Let them race */
> +     sleep(RACE_DURATION_SEC);
> +
> +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +     pthread_join(thread_change_1, NULL);
> +     pthread_join(thread_change_2, NULL);
> +
> +     pthread_barrier_destroy(&data.barrier);
> +
> +     igt_assert_eq(data.unexpected_errno, 0);
> +
> +     /* Exactly two gem objects should still exist */
> +     num_handles =3D 0;
> +     for (int i =3D 0; i < 4; i++) {
> +             ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +             if (ret =3D=3D 0) {
> +                     num_handles +=3D 1;
> +             } else {
> +                     igt_assert_eq(errno, EINVAL);
> +             }
> +     }
> +     igt_assert_eq(num_handles, 2);
> +}
> +
> +/**
> + * test_race_change_create_close - Test for race conditions of change_ha=
ndle against gem create / close
> + *
> + * Start two threads, one of which attempts to change between four handl=
es while the other alternates
> + * closing a gem handle and creating new ones. Test for race conditions =
such as change a handle that's
> + * being closed or change a handle to a value that's being created.
> + */
> +static void test_race_change_create_close(struct gpu_ctx *ctx)
> +{
> +     pthread_t thread_change, thread_create_close;
> +     struct change_handle_thread_data data =3D {0};
> +     int num_handles, ret;
> +
> +     set_up_context(&data, ctx);
> +
> +     /* Start both threads simultaneously */
> +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_th=
read, &data), 0);
> +     igt_assert_eq(pthread_create(&thread_create_close, NULL, close_recr=
eate_thread, &data), 0);
> +
> +     /* Let them race */
> +     sleep(RACE_DURATION_SEC);
> +
> +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +     pthread_join(thread_change, NULL);
> +     pthread_join(thread_create_close, NULL);
> +
> +     pthread_barrier_destroy(&data.barrier);
> +
> +     igt_assert_eq(data.unexpected_errno, 0);
> +
> +     /* Depending on where create / close ended up, there can be 1 or 2 =
handles open */
> +     num_handles =3D 0;
> +     for (int i =3D 0; i < 4; i++) {
> +             ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +             if (ret =3D=3D 0) {
> +                     num_handles +=3D 1;
> +             } else {
> +                     igt_assert_eq(errno, EINVAL);
> +             }
> +     }
> +     igt_assert(num_handles >=3D 1 && num_handles <=3D 2);
> +}
> +
> +/**
> + * test_race_change_export_import - Test for race conditions of change_h=
andle against prime export / import
> + *
> + * Start two threads, one of which attempts to change between four handl=
es while the other exports
> + * handles, then imports them again. Check for race conditions such as c=
hanging a handle while exporting
> + * it or important a handle while changing it.
> + */
> +static void test_race_change_export_import(struct gpu_ctx *ctx)
> +{
> +     pthread_t thread_change, thread_export_import;
> +     struct change_handle_thread_data data =3D {0};
> +     int num_handles, ret;
> +
> +     set_up_context(&data, ctx);
> +
> +     /* Start both threads simultaneously */
> +     igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_th=
read, &data), 0);
> +     igt_assert_eq(pthread_create(&thread_export_import, NULL, export_im=
port_thread, &data), 0);
> +
> +     /* Let them race */
> +     sleep(RACE_DURATION_SEC);
> +
> +     __atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +     pthread_join(thread_change, NULL);
> +     pthread_join(thread_export_import, NULL);
> +
> +     pthread_barrier_destroy(&data.barrier);
> +
> +     igt_assert_eq(data.unexpected_errno, 0);
> +
> +     /* Exporting a handle doesn't close it, so should still be exactly =
2 */
> +     num_handles =3D 0;
> +     for (int i =3D 0; i < 4; i++) {
> +             ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +             if (ret =3D=3D 0) {
> +                     num_handles +=3D 1;
> +             } else {
> +                     igt_assert_eq(errno, EINVAL);
> +             }
> +     }
> +     igt_assert_eq(num_handles, 2);
> +}
> +
> +int igt_main()
> +{
> +     struct gpu_ctx ctx =3D { .fd =3D -1 };
> +
> +     igt_fixture() {
> +             ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
> +             igt_require(ctx.fd >=3D 0);
> +
> +             ctx.driver =3D detect_driver(ctx.fd);
> +             igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
> +                           "Unsupported GPU driver\n");
> +
> +             if (ctx.driver =3D=3D DRIVER_TYPE_I915)
> +                     igt_require_gem(ctx.fd);
> +     }
> +
> +     igt_describe("Sanity Test: Change handle actually changes handle");
> +     igt_subtest("sanity")
> +             test_sanity(&ctx);
> +
> +     igt_describe("Functinality Test: Change handle affects result of pr=
ime import");
/Functinality/Functionality/

> +     igt_subtest("change_prime")
> +             test_change_export(&ctx);
> +
> +
> +     igt_describe("Edge Case: New handle =3D 0 should fail");
> +     igt_subtest("new_handle_zero")
> +             test_new_handle_zero(&ctx);
> +
> +     igt_describe("Edge Case: New handle > INT_MAX should fail");
> +     igt_subtest("new_handle_exceeds_int_max")
> +             test_new_handle_exceeds_int_max(&ctx);
> +
> +     igt_describe("Edge Case: Changing a handle to itself should fail");
> +     igt_subtest("new_handle_equals_old_handle")
> +             test_new_handle_equals_old_handle(&ctx);
> +
> +     igt_describe("Edge Case: Change a handle to a value which is taken =
should fail");
> +     igt_subtest("new_handle_taken")
> +             test_new_handle_taken(&ctx);
> +
> +     igt_describe("Edge Case: Changing a non-existent handle should fail=
");
> +     igt_subtest("invalid_handle")
> +             test_invalid_handle(&ctx);
> +
> +
I'm not sure the extra blank line here is needed

> +     igt_describe("Race: Changing handle vs. Changing handle");
> +     igt_subtest("race_change_change")
> +             test_race_change_change(&ctx);
> +
> +     igt_describe("Race: Changing handle vs. Create / Close");
> +     igt_subtest("race_change_create_close")
> +             test_race_change_create_close(&ctx);
> +
> +     igt_describe("Race: Changing handle vs. Export / Import");
> +     igt_subtest("race_change_export_import")
> +             test_race_change_export_import(&ctx);
> +
> +     igt_fixture() {
> +             drm_close_driver(ctx.fd);
> +     }
> +
> +}
> \ No newline at end of file
Add newline at the end of the file.

> diff --git a/tests/meson.build b/tests/meson.build
> index 4f5c9be7b..ab083916d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -104,6 +104,7 @@ intel_i915_progs =3D [
>       'gem_blits',
>       'gem_busy',
>       'gem_caching',
> +     'gem_change_handle',
>       'gem_create',
>       'gem_ccs',
>
Overall, this series looks much better now. One open question for Kamil:
since these tests exercise functionality that's currently disabled in
the kernel (drm_invalid_op), and the IGT coverage is meant to be a
prerequisite for bringing this feature back, how do we properly test it
in the meantime?

Also can you look at patchwork this changes currently failed to git am
https://patchwork.freedesktop.org/series/175696/#rev3


--
Best regards,
Sebastian

