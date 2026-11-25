Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E8F606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5iQVbhET
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6F10E0BE;
	Wed, 25 Nov 2026 14:26:53 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8810FC9C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 14:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8YGdPrhILhSrOWI4h/CijKMCOkyYpkKYqAtaomlWuBdYp72EmqaCd7ehX4F2Bw9ZLyZ7zMHP0PrN8Kjck17SqeC6fvWaWTvmWhpq4+/x3Aj/NdJgcj40SYDCCw3JbKvXzSYAcKfJgHYoPLIRmpgQ9zhKkByao6ncIus7Xm+X1+pfGq0KidvOiTeHlcpXFUgZQDLkWoibzusR4r/W8uFK8WaNzMr5fl1jcUt2lvfVpLnPF3xmaDd8KJhgNRd1kTE5Ir2NklwYIKxmC48wfsQKbqz72QJ/BUWEWLw4CC4naHFfuVYcnvR+xNesaXPb3Pnnu8evKLRMJXiUmtPEX28rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+vFQmA9/1J9XhUZSbhaL7ekhvX0WPTdWCHFNp9f3YE=;
 b=juSp8E2gxCZtyj3M5V/akqRgJhSDMXhkyLl6sacrc8Rpz5er1MvIUPjWE9htWfhmzGzKoPxCOZSz6+iu+hOg6DfB7+qi/QiVasFi2Zimhsg1r9jkNarSpxP64LLdRnUm822EP0T/0W5OVKrrzsTaKbROMBh2rxz+oqN8nVaN2BaUqgP8ZX3mrQKTCtaGGR8mWlBUeycMg/I0jPiY9JapNFhkzS40wzDt2h5Qqx9qJWQO1QIGSOt0v6qGAD5JXt2mmSEwVu+42JDp/evwNCyHYsUDLzQjuny3ClSVahqsFqf5mZQjWqIFlj58KOd49L+xDPz0+SId7g/lYI0uTkH6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+vFQmA9/1J9XhUZSbhaL7ekhvX0WPTdWCHFNp9f3YE=;
 b=5iQVbhETLBg6P7FFPt/Dj1g8StFWWADAns4hWLK8LWdJWeF5RFrrevnDfoOhXIWd6JcZ7E/Cw0TNmHFBy3LMsnmtnnbeMicaiMLEE1SjXI1DqVGhhVXZyG7SxpIYYHIRnftuyH6vvt3uyX5vAr3zD3Br1/z5wQk60kWou21wtl0=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by IA4PR12MB406293.namprd12.prod.outlook.com
 (2603:10b6:207:12d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 14:25:36 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 14:25:36 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak, 
 Vitaly" <Vitaly.Prosyak@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v5] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Topic: [PATCH v5] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Index: AQHdfEr5/eIPrR4Ko0O41s+qhjH+crc+0p8AgAAGZY0=
Date: Wed, 25 Nov 2026 14:25:36 +0000
Message-ID: <CHAPR12MB999247951EDBAFE706205C8BBCEF432@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261124193506.2136315-1-David.Francis@amd.com>
 <v7jfv6txem5vvzvaijup7d2akg6fw6li74i4rhpa7cgn5u25fs@uiugp4omunwp>
In-Reply-To: <v7jfv6txem5vvzvaijup7d2akg6fw6li74i4rhpa7cgn5u25fs@uiugp4omunwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-25T14:25:35.537Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|IA4PR12MB406293:EE_
x-ms-office365-filtering-correlation-id: d00cce70-a076-4003-311c-08df4afff8d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|261009221227099003|261009223027099003|261021121427099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|38070700021|261022113327099003|261022075727099003|261028144727099003|56012099006|4143699003|261102130727099003|10067099003|11063799006;
x-microsoft-antispam-message-info: dNWdKAnjBhjQHAxsMwWrGMYjqAjHS5/0Dy2UpcXuer5zVmZIe3OxtnUmndOZBcFvxXZIck4NF9rkIBpBBkK/i+ZOdZwph3gl6UT6W7GKzGVSWjDUlDwOW/JRkqrsbnGj4s1OLxom5Y7b32sxmmIzid+DvVZUdO9eU/5tVg1EFdrmBDX+cp/zeeqcX0GDf2etq/VE4IrlosX5Q4SxXZQ2gDfkbjR7bngOzTcwS8rDso3K/6xOro/fDjHn7Q4tD0phV/JxHQ8F37iLTbxIzPNL27YIUj3Cp3eWShVC4cUrWrCuWIgiYkASrpQtONR0p2zBp3Vj+Uk+OVOBZDI+3X8XISKIgiid4ACmIB8346ViANRkFOFPNyV3f99ZFDPgfZUrgBsZB9eMCVvkIK7EpQoLKtjXGzYt2avT3AWPVXDC3upFtGNb+Ee3fO4b0SZOY6z0nu3Ki2dlKHZBRWtToj4QrM9HHMNlaYY/f5nlmffWcYBaLuQAR9tbmv/noKpJjEqLRTh5GNLcmg38tRfP2oHMrv1IM8iCrcY0lrD+Q9VQWtzxRvEnu4Q2bT2JD2iuoLXUNjzSOk6P3QouNZ4a9YnmAcEWAXnpjj1rY9mhguaqtd7Tiu4chhE9ZPfvAk7JzitufCVZ4wFrI+Oyrbubv24rLVFaVr0piOyGPbeo6K6/54e9JdmxLi9ITw1sZkM6rdqkEGBsrLs3HQUGV2+WCPWFDwu8qP+NlnHbxFI8TO2yDnI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(261009221227099003)(261009223027099003)(261021121427099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(38070700021)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(4143699003)(261102130727099003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Cco/hpjpcjjxZxtJbAdyqNBh0tEm2qzhURaLNjgo63Xg0tvV1wQpGYnwUhT?=
 =?us-ascii?Q?2pQG2aQEtND6UkS2A6wUzpCfr1o5Zj0G+w2oKWmoBj51DmxQRLiIQ7Q3G2ou?=
 =?us-ascii?Q?ErKOG4P2fB/O7vzlup8Snvxoy+v2rAavhuyJIJCL6lI5rkXL9OUjhzsE1luA?=
 =?us-ascii?Q?BLUa+tuV7VW82gh/E15usWel16YYdfuacKLhMa3UHw8ScVu38Cqd8XJLMP1N?=
 =?us-ascii?Q?1oG0OnIuhdUw+52S8H8iV7N9WnrMCyLrtzDI9MgfSBvNma1bj8w9NPxJGDFf?=
 =?us-ascii?Q?58Okilc1eiknKRSv1XLNutb2CortsBomMKxDvoWXOJuiu4o4C3q8nDfnaxj7?=
 =?us-ascii?Q?uFObdFGO1dF6KQxhPQc8Q3MolFaD3AejnUK8LBRRJrGLYtroCOYhkZsyVteB?=
 =?us-ascii?Q?US8Z1mL5b+/6QN9jQ8x+HLz2UGos0J//U+fQVzntdVfPAUXslPLSDdSMxMTY?=
 =?us-ascii?Q?b016A3endxDGzUAnRapdBmn/j+h7pTjUmeJ6M0sGxfq3moftRuPweLu7hvJ4?=
 =?us-ascii?Q?8OSIPQGXtQ0uFvej/OMo0SoL/ehJodMCDk3CySjVlWSjd2Rb/Ssqyyf4v39v?=
 =?us-ascii?Q?Jf5u6nEllWhkOlRuKnV8fRgo245T1w+8TPp0bz4a6XigIycJ9yBK2QBjJwL8?=
 =?us-ascii?Q?Fh8wW/efr1H4Bxs3vrq763PiPwvjCTOnpNSr4U+BHONhVeNLTY57azki11zx?=
 =?us-ascii?Q?mqqbOW4RZH5mhTzD2f2RJnUsSeRw3LlGCuCVDVBIgBVlgR4CqTQTYgTVntQI?=
 =?us-ascii?Q?VhrAH0JZjv8mDcp/WvxG+5bOfq08uyZ6cWMChl3jopLCbqEbsuEU8aJ4n7rG?=
 =?us-ascii?Q?Xiii8QV27RqYqhj/mJSEq8MCeE2xyFscdH6y69zpArS5KKF085w2+J3CXnEj?=
 =?us-ascii?Q?Dw1YwlJQ4A3Mem8cWGKuxoHkMmNOKI0NKam/Az4NoRJ6lQ7vk5fBeMjI4ta5?=
 =?us-ascii?Q?c1AmW00X9/wCCgvTvh8YgMwx4+/DqBzMxVp4kQceuCKaMWUNv0zcOeD+xu4u?=
 =?us-ascii?Q?MQrqSjB7H6Rrcr/9DTKwcfSjPrCkB/Cx9KD2YyTaqT9wwy6Y8LAkjvtabteA?=
 =?us-ascii?Q?jAcDzLNnhTpTkP9zx8lhgbxmytR17MW/nbtX2aKh7RSzJnBM5sZiAYujwffj?=
 =?us-ascii?Q?dmpa9+h9urjF2rV735ZvJ+TZpqNk+ezLN5fgszEjMXiJGCuGj8D8uRMN4QLu?=
 =?us-ascii?Q?8MdN4uVKR+usQCc5fw+thmAr+cI/laRBMlOdKqxtwfrPgEUw8ttqWKE005Dc?=
 =?us-ascii?Q?ErVFL2UbaMuq6TQRZtWXlgn55OMxJI4nIaS7LiqqXKLwxSkRktOy5DvRUz8V?=
 =?us-ascii?Q?/fVwizwnMEZgX4bOnBCFpYj/eTROU8FHYLTFpVaQSt0QCRJWcGuHUVMT8aQq?=
 =?us-ascii?Q?n03QaNa/AXiUP50xXuqR4dRWN7UIueR1vWOTBcq65XWaVGwRroGyIR2ea6Rf?=
 =?us-ascii?Q?97hFIfbMR0wwzdJT5SDlZzdTqpL8TjFyUHX9r/vMshUX/9rewRG31T1W78DE?=
 =?us-ascii?Q?yT+32bUw0t61yPM7vm7isSVgx4V9wRD4bZnTIAYqN8imAjMt1NftfBuOXz6q?=
 =?us-ascii?Q?XUq/8jhktmtq9uWmi5p2GvlGV+aMdscvFpqPaqbcaV0xE1K98RvAkVV/DBuH?=
 =?us-ascii?Q?96t6kWMWP0vsrDk1HtwTVqM/YOgkM8oorDkiW8Jph5hadXzfyon5O8uHW2jG?=
 =?us-ascii?Q?cBX6t19ZlVgGjycZhvY3wLBUzqhuL26lUNaaYDdBNQYt+6Lc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00cce70-a076-4003-311c-08df4afff8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 14:25:36.0633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cD6QSpgYrtZCtI6jBM2MrbX/QI9fyOde2TPBMVEQRdX2yQ3Qh5qwBJeUofZE9F6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB406293
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

Thanks; will fix these and split patch

David Francis

________________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Wednesday, November 25, 2026 9:02 AM
To: Francis, David
Cc: igt-dev@lists.freedesktop.org; Prosyak, Vitaly; Tvrtko Ursulin; Sebasti=
an Brzezinka; Koenig, Christian; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH v5] tests/intel: Add edge case and race condition tests=
 for GEM_CHANGE_HANDLE

Hi David,
On 2026-11-24 at 14:35:06 -0500, David Francis wrote:
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
> v5: Add fcntl include
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  include/drm-uapi/drm.h          |  23 +

Please split this into a separate commit, if possible.
Also give a link to lore.kernel.org with this change.

Few more nits below, some found by checkpatch. Btw you can ignore
some warns, for example line too long or about MAINTAINER.

>  tests/intel/gem_change_handle.c | 729 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  3 files changed, 753 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle.c
>
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> index baa620e3f..cf131da24 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -619,6 +619,21 @@ struct drm_gem_open {
>       __u64 size;
>  };
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
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1296,6 +1311,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_MODE_CLOSEFB               DRM_IOWR(0xD0, struct drm_m=
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
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_han=
dle.c
> new file mode 100644
> index 000000000..e9cfb4a40
> --- /dev/null
> +++ b/tests/intel/gem_change_handle.c
> @@ -0,0 +1,729 @@
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
> +#include <fcntl.h>

Move this after errno.h

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

Better
        igt_assert_lt(ret, 0)

here and in other places below.

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

Could be also simple 'if (ret)'

> +                     data->unexpected_errno =3D errno;
> +
> +             handle =3D prime_args.handle;
> +             verbose_log("[PRIME-TID:%lu] Imported; got handle %u\n",
> +                         (unsigned long)tid, handle);
> +             if(handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2]=
 && handle !=3D h[3])

Add a space after 'if'.

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

No need for braces when it it single-statement if...else:

                if (!ret)
                        num_handles +=3D 1;
                else
                        igt_assert_eq(errno, EINVAL);

> +     }

Add newline.

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

Same here, no need for braces when single-statement if...else

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

Same here, no need for braces when single-statement if...else



Regards,
Kamil

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
> --
> 2.34.1
>
