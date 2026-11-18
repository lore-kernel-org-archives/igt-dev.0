Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19628606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SlpKgUX+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050710FFB7;
	Wed, 18 Nov 2026 19:26:50 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4174410FFBA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 19:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sg/sHAn6FActbr5OtudPC3xs7eYePIT3aE2oHOo97hM9vfg1EIh+bWlK2hVt5kPLz47uliW42ERD2sq0cIPn0MFKUlWqddEIF1Vd645V4OtdXhtakkk90Cr8yC2Eoo+P5J/yy9/HQsAdd3BBlkYYDGutxCXUGTVWCCGcLa/JxWqJ7LHJncRgkWnu0/wB0Kzd9rK+9AB94PxPbI62/GSkRuK4K37yCU3pK3ts4C9uusgkeLNqdX5BJhtx++WJxElcg3UNtA3jXL/wx+VTDehJ+OYDi6e8zoNxqGaXcQC0Mf6jonyhP6Rmv4aivSyzuoIMURbh8d7mRdWoJwKKpTeL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdsbgOJvpM/2ZcxyVzu9tr9FX/q1YUX8nqZRvRgJ5gM=;
 b=xvBc50i+D6NVpl9OvvBvjpWXf0dQVLyRiZb5KI+WQLYLOxlLUyj8aoFV4rmwZYrnmbDw1m7xd4lVahau2cJIWzpWlZ2Iq/urX52Fz3/hgLyLq+OOLIp6AQ5M2v3XkfyRTqltbgaVldZw241UHViK21hAbX8Hh8tPEDtTEOyV5PUsvHWrCNVqllJVcIzJmrAs5kG6Vs5aPzNWNjVV/qijPUktEkKeqJiPo33867P5xuaxKASvllJIHom6GepuEGYy8nm3nFEabnE3yP2gRNbk8TjzzqsVNiswGi6RuQl6paPIwJrsL4tJItVvXAxe0O35PNJ3cJBjAlR7uTDQ7ywyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdsbgOJvpM/2ZcxyVzu9tr9FX/q1YUX8nqZRvRgJ5gM=;
 b=SlpKgUX+rxLcNHtZ6ce4VexYm4B3BbAz+ioatfF+q12su83AavrY58PdGRUjChp5ZlLyHAuqI4eRhi8xUPAlVE7H0CW2Gf/YlOuC2rP4/HaVybOk2/HD8tmy7hoosl4ichVzwpLEsaE/XG78c7Hbe6tvDzRX6xyfnsb9fiAIdhk=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by MW4PR12MB7358.namprd12.prod.outlook.com
 (2603:10b6:303:22b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 19:25:39 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 19:25:38 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Topic: [PATCH v4] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Index: AQHdcSi/CygxM0nP6kyg2bHeno59hLcqdViAgAnMydQ=
Date: Wed, 18 Nov 2026 19:25:38 +0000
Message-ID: <CHAPR12MB9992477A972F6389F886D55EAEEF7A2@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261110153230.583745-1-David.Francis@amd.com>
 <6a89a83a-8290-4c59-855a-f798f8350570@igalia.com>
In-Reply-To: <6a89a83a-8290-4c59-855a-f798f8350570@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-18T19:25:37.699Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|MW4PR12MB7358:EE_
x-ms-office365-filtering-correlation-id: 905d6c3f-2851-4924-cb7a-08df45a9b9f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261009221227099003|261022113327099003|261022075727099003|261021135927099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003|4143699003|38070700021|261102130727099003;
x-microsoft-antispam-message-info: rt7XO2Lad1ybTuoOBw41jwLs4WialK+0Kd5fGfmX/kBRg78fGYWl0yfnf5/MV4CeGVuxB/wEv5w2ZRhPECdqA4G/p2vMghP3ooAf798YPr+2rbIy4vYzAHIdqUNVC2j4HrkuFlwSONzwh0DOAFaVOO6ZZ8l3y1Y4kdiCF7YXlkHFfWnrmMcds7F4L+7HL3C+anKz6OgBeH3lrh6NXkJjWrAuv4w2OPzsnujpIM1/GPvbUuxPS8nooU/tzsQEkb0Rfn3iYd9pcAHOW5xp6TZicn7Jf4qR2LEfTQOR6mJm+ALblA2mDuM2NRgFBsbuDljCeahxI6ViDBQOnniAbIAAMNQ47iHdC7/61KPnQjkqSbtMWl3mTx+A9U6GJJSMFYrcEFMGNT/37QPaHxxP4EfkjJjq1/cT4LceBjWlwQXagmvsv1zYe9Iq6IoBMGIDvVTfEillAfn6p4WeJtEMTNt512XUBZM3t7NG4H9taw+XPGuVWdDVbeL5cQSc/Wg33zCbY+iRl+nTCcO1bgkbEsJarjgpkww+RSJI34bcLTPrzLEqFrj51CtRHDe0x/MXmBQ2RmCypbljpOYGk/czPclUgG9PKvC4IIBhM1+EWG938Sz6atqEcjsJSqTYZQslY0is1GcdHZEH6inDYJa0SYTroYXRYseG/S9oMiDskOBaFoyNwf/m2Q/ZwfMp99oIn41Q8v23foilE86uULJE16mDpWfnXLUkv33P0tcxbtJlqa4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261009221227099003)(261022113327099003)(261022075727099003)(261021135927099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(4143699003)(38070700021)(261102130727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5h29CjWSVNRblvFPIQsiXcPQxx+zL2FO7stypb+WT2TWedMbW3otzLai6mAT?=
 =?us-ascii?Q?b76wCSOTuNajmeTl+JkSMXZwvKpyJJR96YUOKSF93nkszGWPUTei8P1ECbEe?=
 =?us-ascii?Q?KPNqEikYFCY3lMPZCl23/bi99mxOqfUP7Gt6WaSs4OVzK8UMpXxJv2ALBalp?=
 =?us-ascii?Q?kf2wNLnTLypdDu4246ON2/oKqM1a9U2M4u8Iyyamvj88As0UKk91IYgQppDr?=
 =?us-ascii?Q?z4D63u4Hg0tnEcw+DGc6ZH53lyS60hy13rzjRxYUpd9sezj8zOyMvCln/MlJ?=
 =?us-ascii?Q?29W9L8tUPeEi2mvIbSe/GVuq0WWjSjz9Sp38KKnN9BxuD/zQgPINxzeYRK+9?=
 =?us-ascii?Q?bZlltKSANyfsHROvT2iMmQxeUxkx1flBgER6ERC4BrFh8QrJO1C6RTjWY0A1?=
 =?us-ascii?Q?E82wvf3Z+2RQ4G6dehJic2sNnwzGjjgizCQMf1CE+QkunuIaFwnzuLzGwC9g?=
 =?us-ascii?Q?Q0YbQCpo0nB91vijOgEcpvnjgOY2KnbEvfVFsQaBwmku+04RaSnZlFUPOBYU?=
 =?us-ascii?Q?sf7SbVjTUIf76PxU3vZzGWdCNgeSOuGbVTjQhMXwIjBgNPCm7qaWcM/k2Vux?=
 =?us-ascii?Q?fYoGEKCgpkR9uE+hHEDQp0oRMsu3U27o3aEIgW3H7vyo422Zjyt9G4xfM8TX?=
 =?us-ascii?Q?Zs+Rx8Xr20HNdylJdUPHNxWRvdwKgDhdL3211kg1CaBrZef/7Jv09iGwhfNP?=
 =?us-ascii?Q?IYfaGUKa55a52ueqkVRymkepCp9aIv0eJulHFe0gCnW5KdOp+h3747Mpsbt/?=
 =?us-ascii?Q?Ke3RKphIlD6gDMEO+wxFVwNmoIm4Qqpj0Egb7cxrGZpSu9/0yt4nxTFXDUdW?=
 =?us-ascii?Q?0ZHX5eGyeFmMiNzqFK+SlXjCh/GTvAucI+NeEiqX5qYJt38irAzbsUVGl+mf?=
 =?us-ascii?Q?zqG7D+d1J2mj4RRtZ11WJz+Of254xYEAcP7ueHeYul+Flv4+xeEWMYMc1SZP?=
 =?us-ascii?Q?NfC19kde0MB7z1klK9XUy9/aAvu9KAwQkpKvnH/PK+MTrwj1FWftD/4WyHZM?=
 =?us-ascii?Q?WsvBy3Wzvjk6sxRTVPKWwqRO83IoNamiiaCD2DJOfCLT2jYJfdqHeaNFvD0J?=
 =?us-ascii?Q?j/ULqF/RzgClfhVfqGawRQp+kQi5ov+o8iqmGwzVrOt4Rta2cUxK1UWSSmtE?=
 =?us-ascii?Q?NTFfU310IX+u+/xeCtBHeOLX62ykRQGQglQnv/HWMk+LcHdDjoML+KOdrP9j?=
 =?us-ascii?Q?N+oC+hT9sT3qKHZAKgT4SQfrFOtUukL6yOsD9q/3x8Yu+ikTnHyDMpxOpZkk?=
 =?us-ascii?Q?rkwM+sKzTiK7WF1K7HKJ1H02B0Yw2fNCcCJL1W90chgPgPCwjNDsjTJ9wnuD?=
 =?us-ascii?Q?gGH1t/GZ2HtfHHkF2i0dsPeWO3VXwi+f/FN4GnfjTpbAdy5dkA6aSRoZXQs1?=
 =?us-ascii?Q?uk7Azkxkmh2H4D/9njJsPMaAvMR9cuZoYOMLq/CMjRBHU9BcilhYD8qcTZ8S?=
 =?us-ascii?Q?JM8duwkb+t423OaxsrOn2J5Q7hBgUhsgUM2Ip6dvBB6VltSrjxfZ+N+RwzFf?=
 =?us-ascii?Q?BHU3smJU21HVCO2FhjWp4keU2W5M/zvW06Fz3jt7KTGSGWHDSDcERPMf+oJ+?=
 =?us-ascii?Q?0NiVIS5R6ANhIZCKH/rYolwhyQLJPE2HsoSGn70WRcZr7X313DRwYQy2URKQ?=
 =?us-ascii?Q?72y95CCdSGjeWdDA6Wd97q2Mt6FWRDQ3EZzr2XClgmio2DGz9iS9lbt9nPEX?=
 =?us-ascii?Q?oMSU20vheDmp5EKc+jEbNxPuodXme8kfdeLkFQe1iUw4mBET?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905d6c3f-2851-4924-cb7a-08df45a9b9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 19:25:38.0484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c06Xnk6FKZsdp4PovZN79cGAzwzzdBDEKGD6C6iHHhNRiERR3a0CZjaOhWiYWUmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It's been about a week since this was reviewed.

Tvrtko has also reviewed the kernel change.

Is there anything left to do before this is merged? With the current versio=
n, tests are skipped if the ioctl is still disabled in the kernel.

David Francis

________________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Sent: Thursday, November 12, 2026 8:43 AM
To: Francis, David; igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly; Kamil Konieczny; Sebastian Brzezinka; Koenig, Christia=
n; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH v4] tests/intel: Add edge case and race condition tests=
 for GEM_CHANGE_HANDLE


On 10/11/2026 15:32, David Francis wrote:
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
> v2: Small cleanups, including cutting some includes and no assert in thre=
ads
> v3: Skip if ioctl disabled
> v4: hop around randomly on race tests

Nice, v4 is much easier to follow. Thank you for iterating patiently!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>   include/drm-uapi/drm.h          |  23 +
>   tests/intel/gem_change_handle.c | 728 ++++++++++++++++++++++++++++++++
>   tests/meson.build               |   1 +
>   3 files changed, 752 insertions(+)
>   create mode 100644 tests/intel/gem_change_handle.c
>
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> index baa620e3f..cf131da24 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -619,6 +619,21 @@ struct drm_gem_open {
>       __u64 size;
>   };
>
> +/**
> + * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HAN=
DLE ioctl.
> + * @handle: The handle of a gem object.
> + * @new_handle: An available gem handle.
> + *
> + * This ioctl changes the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +struct drm_gem_change_handle {
> +     __u32 handle;
> +     __u32 new_handle;
> +};
> +
>   /**
>    * DRM_CAP_DUMB_BUFFER
>    *
> @@ -1296,6 +1311,14 @@ extern "C" {
>    */
>   #define DRM_IOCTL_MODE_CLOSEFB              DRM_IOWR(0xD0, struct drm_m=
ode_closefb)
>
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem ha=
ndles.
> + * This ioctl changes the object at one gem handle to use a new gem hand=
le.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_cha=
nge_handle)
> +
>   /*
>    * Device specific ioctls should only be in their respective headers
>    * The device specific ioctl range is from 0x40 to 0x9f.
> diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_han=
dle.c
> new file mode 100644
> index 000000000..1aef48d0a
> --- /dev/null
> +++ b/tests/intel/gem_change_handle.c
> @@ -0,0 +1,728 @@
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
> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +//#define VERBOSE_LOGGING 0
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
> +static uint32_t gpu_create_bo(struct gpu_ctx *ctx, uint64_t size)
> +{
> +     uint32_t handle =3D 0;
> +
> +     switch (ctx->driver) {
> +     case DRIVER_TYPE_I915: {
> +             handle =3D gem_create(ctx->fd, size);
> +             break;
> +     }
> +     case DRIVER_TYPE_AMDGPU:
> +             handle =3D igt_amd_create_bo(ctx->fd, size);
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
> +static bool is_ioctl_disabled(struct gpu_ctx *ctx)
> +{
> +     uint32_t handle, new_h;
> +     int ret;
> +     bool result;
> +
> +     handle =3D gpu_create_bo(ctx, 4096);
> +     new_h =3D handle + 1000;
> +
> +     ret =3D gem_change_handle(ctx, handle, new_h);
> +     result =3D (ret !=3D 0 && errno =3D=3D EINVAL);
> +
> +     gem_close_bo(ctx, handle);
> +     gem_close_bo(ctx, new_h);
> +
> +     return result;
> +}
> +
> +#ifdef VERBOSE_LOGGING
> +#define verbose_log(...) igt_info(__VA_ARGS__)
> +#else
> +#define verbose_log(...)
> +#endif
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
> +     handle =3D gpu_create_bo(ctx, 4096);
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
> +     handle1 =3D gpu_create_bo(ctx, 4096);
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
> +     handle =3D gpu_create_bo(ctx, 4096);
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
> +     handle =3D gpu_create_bo(ctx, 4096);
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
> +     handle =3D gpu_create_bo(ctx, 4096);
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
> +     handle =3D gpu_create_bo(ctx, 4096);
> +     handle_2 =3D gpu_create_bo(ctx, 4096);
> +
> +     /* new_handle is taken must fail with -EBUSY */
> +     ret =3D gem_change_handle(ctx, handle, handle_2);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EBUSY);
> +
> +     /* And the other way */
> +     ret =3D gem_change_handle(ctx, handle_2, handle);
> +     igt_assert(ret < 0);
> +     igt_assert_eq(errno, EBUSY);
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
> +     data->handles[0] =3D gpu_create_bo(ctx, BO_SIZE);
> +     igt_assert(data->handles[0] !=3D 0);
> +     data->handles[1] =3D gpu_create_bo(ctx, BO_SIZE);
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
> +     int ret, old, new;
> +
> +     pthread_barrier_wait(&data->barrier);
> +
> +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +             old =3D h[rand() % 4];
> +             new =3D h[rand() % 4];
> +             ret =3D gem_change_handle(data->ctx, old, new);
> +             /*
> +              * Expected errors:
> +              * - ENOENT: old handle invalid
> +              * - EBUSY: target handle occupied (collision detected duri=
ng idr_alloc)
> +              * - EINVAL: old and new handle are the same
> +              */
> +             if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D EBUSY && =
old !=3D new)
> +                     data->unexpected_errno =3D errno;
> +
> +             sched_yield();
> +     }
> +
> +     return NULL;
> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +     struct change_handle_thread_data *data =3D arg;
> +     uint32_t *h =3D data->handles;
> +     int handle, ret, i =3D 0;
> +
> +     pthread_barrier_wait(&data->barrier);
> +
> +     while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +             /* Close a handle; keep trying until success */
> +             while (true) {
> +                     ret =3D gem_close_bo(data->ctx, h[i]);
> +                     if (ret =3D=3D 0) {
> +                             verbose_log("[CLOSE-TID:%lu] Closed handle =
%u\n",
> +                                         (unsigned long)pthread_self(), =
h[i]);
> +                             break;
> +                     }
> +
> +                     i  =3D (i + 1) % 4;
> +
> +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQUI=
RE))
> +                             return NULL;
> +             }
> +
> +             /* Open a handle */
> +             handle =3D gpu_create_bo(data->ctx, BO_SIZE);
> +             verbose_log("[CLOSE-TID:%lu] Created new BO with handle %u\=
n",
> +                         (unsigned long)tid, handle);
> +
> +             /* If the opened handle isn't one of the four ones being
> +              * shuffled, change_handle it in. Keep trying until success=
.
> +              */
> +             if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2=
] && handle !=3D h[3]) {
> +                     while (true) {
> +                             ret =3D gem_change_handle(data->ctx, handle=
, h[i]);
> +                             if (ret =3D=3D 0) {
> +                                     verbose_log("[CLOSE-TID:%lu] Change=
 handle %u to %u\n",
> +                                                 (unsigned long)pthread_=
self(), handle, h[i]);
> +                                     break;
> +                             }
> +
> +                             if (ret !=3D 0 && errno !=3D ENOENT && errn=
o !=3D EBUSY)
> +                                     data->unexpected_errno =3D errno;
> +
> +                             i  =3D (i + 1) % 4;
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
> +                             verbose_log("[PRIME-TID:%lu] Exported handl=
e %u\n",
> +                                         (unsigned long)pthread_self, h[=
i]);
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
> +             if (ret !=3D 0)
> +                     data->unexpected_errno =3D errno;
> +
> +             handle =3D prime_args.handle;
> +             verbose_log("[PRIME-TID:%lu] Imported; got handle %u\n",
> +                         (unsigned long)tid, handle);
> +             if(handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2]=
 && handle !=3D h[3])
> +                     data->unexpected_errno =3D ERANGE;
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
> +
> +             igt_require_f(!is_ioctl_disabled(&ctx),
> +                           "GEM_CHANGE_HANDLE ioctl appears to be disabl=
ed.\n");
> +     }
> +
> +     igt_describe("Sanity Test: Change handle actually changes handle");
> +     igt_subtest("sanity")
> +             test_sanity(&ctx);
> +
> +     igt_describe("Functionality Test: Change handle affects result of p=
rime import");
> +     igt_subtest("change_prime")
> +             test_change_export(&ctx);
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
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..567878df6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -105,6 +105,7 @@ intel_i915_progs =3D [
>       'gem_blits',
>       'gem_busy',
>       'gem_caching',
> +     'gem_change_handle',
>       'gem_create',
>       'gem_ccs',
>       'gem_close',

