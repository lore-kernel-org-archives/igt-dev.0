Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C770606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UApymw3R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00A71126AC;
	Thu, 26 Nov 2026 19:54:21 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8507C1126AC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI9qT3n7llqZZMsccQGy0b0zI07PSvEFpIeSrs7whRzwnRpX+y1BxJ+qjB/Lrv7v3JPrXHrx5xp7WSfX04RO25Wso4H4Gvs66AP3tu1iRTpSfQaWsiEqT4Y24cHTLUSs9ra7XWPZMN0F8+pRyGNNw0sD67UUuJJFiwrSXJnT2Pel3tm1RjT6Zm53WnQtME9fwpoz+ztyC+GiEMv/yalMy4ZfdpL8xA43wW/tHa7A5mg83W0JTY0pEOGuiSi64+j7jssBgOJDb6x7ZdzeRPDPdvyd6Y61psYCfDtHSdtObRV/z1YXJ8NQ+jLGt8UJKVBWMUOKj1yRbup8c3gLBJwImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI+ONv1ispiQjEQ/ycAvLI90ZvWUH+jA9ZeYeZ7hVtY=;
 b=eUGaQaPsLH2x/MPtutd8cF2dSY0qrKRjy7n9o3sWi/I8hlvf5bDEMTHm32Qj5G77BXyenUmmdzcWMg3lf/GiZZj1JwlzcpPLpWaz7Ql7+Ry2RhYekVa5VUNrZtZxsa8J8Af4YQZRPYX3F6C7BnmJW5ZGAzW+ok1PdKg0qc27+UMaebqIyW80QaGchJfQqzN8Gi2QVScXootExhtZfRWfoybKwSbJOCTg4dO8v0iAnVNkVJsmjjV6SaxaoQAOaE91dstdlhhO4QMEtCt2mkp8KuO6RjQxHeo216wGDK6z6QYVd0nzXDOW/DhpOjEKD23gYMr8qmbOxFbbg+AG8NMeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI+ONv1ispiQjEQ/ycAvLI90ZvWUH+jA9ZeYeZ7hVtY=;
 b=UApymw3Rb/CqOQazIHFSqvYwI2ed+WcvPPtBtIbTfaAksm43eSBp98tneY+LAHB6EN+uX3wpqOq/nveHJVb5cFdo7zcbZC8a4yPb6pCiGDcN/PQaxGQ91vcuXCOFKbQ1khbiyUVWUKPv0Ram1p7GBJz8xcCTIfwU7VFqWfW94FM=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by PH0PR12MB999087.namprd12.prod.outlook.com
 (2603:10b6:510:38f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 19:51:55 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 19:51:55 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] include: Add GEM_CHANGE_HANDLE to drm.h
Thread-Topic: [PATCH v6 1/2] include: Add GEM_CHANGE_HANDLE to drm.h
Thread-Index: AQHdfOsN74MmWlm6dUCGpfTY6p/HOrdAwlgAgAACRCw=
Date: Thu, 26 Nov 2026 19:51:55 +0000
Message-ID: <CHAPR12MB999247ED138C5D8A304D46AB60EF422@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261125144110.2198338-1-David.Francis@amd.com>
 <jsd24hhfbwpyfwzdjqawqlsfyahebkasxszqt3po55z4nixbzn@grm3ytmb2tw3>
In-Reply-To: <jsd24hhfbwpyfwzdjqawqlsfyahebkasxszqt3po55z4nixbzn@grm3ytmb2tw3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-26T19:51:55.016Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|PH0PR12MB999087:EE_
x-ms-office365-filtering-correlation-id: dd48b95c-9270-4f9e-4672-08df4bf6b979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|13003099007|261022075727099003|4143699003|11063799006|56012099006|261028144727099003|261026140227099003|261102123227099003|261021121427099003|261022105027099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: p4i/H0MgqO/PQpsoUmUupJ7P/rfj8F37IfPzMcSEfSGzfa3/fX1eXe4FEHl+LukMMwJgF4SxbFnKyBiOleyhzZZEhtUeWhuCdc4CoFYHmNwPV7uWkVIknnB3CIiZwsUyLM0E2dJrOLHc21Udux9LNtwSJ/YZs12qDzcJN22hBErXBXz51aizFYssWbDYYbyzkdVbq7YZ49x1rnnEyq33dqU5gUmmR2T/z/DIIsBmkF12748+o1uY4e6+Gk8STzEAUAWnaNZ0XYUkWQj1VOa6z0XDdj3XZ5JPtUbBFKHwd+osMqmUtt5GS5qoRNPRh4vxNtpuhNckQ40nzHASyfQT/HxT1436S0v+wyF0eJZe1yF5I6XtD3jhVsSOvLXNMHlMQ0I2DWaY9pjiCOhpi5ypCb8XX3WMV2cyhjvk8bJnYsK7DXQAcKCqoVxmraTtecEPqYlv1vFasEHUzjcOnAVzPE4HiLmC5f+XTjfo5RCPW9aXwQCs4NmXlnlPbK///v3G8vENAne5IsUzQWMmReBytt2VPCBGIg7Qdlfuu19q/vPuVZstRl5GYMKlEndKsdl9gUf2+5CVnZeopV1CURxncUnnrU+DR4KbKgx3F7HRrLVuPhO+sf3Qju/lmyWzA1nWz8O3Ks3FZriOcUeS3LFIWHD780AC/bHl5eNpnb5XX68=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(13003099007)(261022075727099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022105027099003)(261009223027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F5pdLKTZbfx/8DvaQg/Sf0MDmy9E+/nshPjlWOJ5NAmgIY3/wMFXVZ75SBv7?=
 =?us-ascii?Q?LGWpMCSO6lBzIDEhLNnlQQDpPrdktgL80gJuCB9x9qPgsZp6VSOfoeztyjtO?=
 =?us-ascii?Q?xd6J2v659U4EJ26ZAjyi0kA1Ea9SU6ts5ZuvoM6nWYg4/kkRZAt24CO28xrq?=
 =?us-ascii?Q?cvLdg8V6RFGaCW/iwUZDGh8fLFAfQksWqJVN4PXLsZ6RJTLzvMGsCd4bW7eu?=
 =?us-ascii?Q?2MpAOmQpT+zyS4QdWYh5rFmve/879pyCYgg1hkt+hyDRLLxC0fZtLhsU8rob?=
 =?us-ascii?Q?nz+BFgpSqvNXll84NBODT8lBGkfW0qdnGTt5/SiZ4+QXkg02c5XPVND9PODg?=
 =?us-ascii?Q?o1bBpirYDDfSLMgE5NXxv6eCgFls2/x9PJ3PcWOP+gJEoh+cG9aidOWXVB1X?=
 =?us-ascii?Q?4AH3jjocXUHg9+TuA74eeSOt4htLwtNS+EZCBPJ7DCQjEdcKzL4OMMTxCyYx?=
 =?us-ascii?Q?QSIPahQEGemJBU3beErv3L4wPi9VQ/7PAibdnOgpWtrclqUwUAi22MLzMVPB?=
 =?us-ascii?Q?HbOL1JG+PEwW9Hqpb4ze6dTKK+DmZrKxVQ1Ni5y1P50YIegb1lXbEarGoq29?=
 =?us-ascii?Q?PjHqk1SYjRt700W5d33k8a0vT8ed+LQS+KMd+4ByP1o95vSbiqxPd6GidsQv?=
 =?us-ascii?Q?6TEEQQeCI1UzUxCf6+9PDFLAYsWyprn6055YeMWnNmzWhVyhnqsnJQw3dx/y?=
 =?us-ascii?Q?mh5QfMCFPgPwNupcnftr1fHzekK/6uNAVjX70xqVdMBoi1+Ah5EMUZs+iN7I?=
 =?us-ascii?Q?BabXIIEpnDUz9mCOrtG9Lr/NDHrcgh9waVZZ9UDzTTupDgDdqa1R1GOOIzcX?=
 =?us-ascii?Q?Ef/fXwv40Rv8VBPUx0W8jg2Uhtoo4TS2HbcVGNBCaz4uGzNdzYkTeFOaTwYG?=
 =?us-ascii?Q?pNJl/ZI3jjQWu5OIpGELVj8uwxDMbkQsleoDg/jBVievtQw0z0YtfO6xuuvX?=
 =?us-ascii?Q?FztVhOV6pnj2lMtE3ts4qMi53dlwjsvehs3u2wm7VEB9/OyeNGQCyLLUi1Ka?=
 =?us-ascii?Q?qlzHLAmKPMbTzJZ+IHnYNjJXP0v3k0SZqLtcPBphRSOoK3A17WpVycugAiTg?=
 =?us-ascii?Q?nNUn2VjyiywIv1PHtfthHatxLlTGJQWGDFeglINnNPoKZe20wpFiuKvpoEGM?=
 =?us-ascii?Q?xvunkbYEpefGNH13U/oa+kG3HUbV9M4PmmAlQN5To7LQ5uIrDngd1/vQyOVS?=
 =?us-ascii?Q?YKq5Ybq2i9b8z4+7msaUE/ZC4zLb4zY2jlRHdvNhS8Q18laiTHFmmUMTe+Mj?=
 =?us-ascii?Q?VNVa48jG1qWBx2l/fJY9biaifAWQNqRl7y2LnIEV+jlYhIkAhqr5DxkOKHTF?=
 =?us-ascii?Q?4wuJa3shRKnoSyQJN2V1MFGXN4751IOh7x/slTkdCFAjzShRsdhgrpE9wRER?=
 =?us-ascii?Q?909v5jTtxWAxw0gYOZu4jBYnFl3kvmcmvSIElV9WEWRa60NVKNlOXK3sYV2s?=
 =?us-ascii?Q?iGoJDM4XmaA4YzlAKruX4yRT4dEzmyKNWhxRseHYcKO5+jwtI/nzGvjy47Nw?=
 =?us-ascii?Q?uDKdE0CDYo4YHhb/wtY3OC/RCoLxispmH7il1W7c1d/sCJVVz9inF5E+UnD7?=
 =?us-ascii?Q?rwM8crvGYCtJAgkmRtwMpslNzQvWilGggy/o8p5SK7R4nDbb5AaO31qSbOgz?=
 =?us-ascii?Q?JQHo/56OSfZQ+Gr02ARw7n+idGY7iHnebBManp2ZWw0svPYYbQe2gnqlMgAH?=
 =?us-ascii?Q?3G+tZhRI9oNca/xyXvKxAEd+Po4Gd84uTLEHoF1Chv9c6FLI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd48b95c-9270-4f9e-4672-08df4bf6b979
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 19:51:55.5465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1k8ozRrKXeaKs4n+Xv7OUlby7PU4ePoPY1sbxGe/qHNdYgryqrs1yD92w24gKhjO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999087
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

>> https://lore.kernel.org/dri-devel/20250717143556.857893-2-David.Francis@=
amd.com/
>
>imho you should resend this as now it is over a year old.

To be clear this is already merged. All this code is copied from the upstre=
am version of drm.h

>> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_ch=
ange_handle)
>
>Should this be 0xD1? imho drm ioctl numbers should be consecutive.

There is also a 0xD1 (DRM_IOCTL_SET_CLIENT_NAME), which has no igt tests.
I could update the whole file to match current upstream drm.h but didn't wa=
nt to upset any custom changes
in this file that I didn't know about (and possibly couldn't test)

Thanks
David Francis

________________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Thursday, November 26, 2026 2:41 PM
To: Francis, David
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v6 1/2] include: Add GEM_CHANGE_HANDLE to drm.h

Hi David,
On 2026-11-25 at 09:41:09 -0500, David Francis wrote:
> This ioctl was added in kernel patch
> https://lore.kernel.org/dri-devel/20250717143556.857893-2-David.Francis@a=
md.com/

imho you should resend this as now it is over a year old.

>
> It provides an interface to change the handle of a gem object.
>
> To test it, we need this interface
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  include/drm-uapi/drm.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
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

Should this be 0xD1? imho drm ioctl numbers should be consecutive.

Can you just sync drm.h with kernel drm-next commit a1b6cf8e5e7e
("drm: uapi: Use SPDX in DRM core uAPI headers")

While at this, please also try to write it in format similar to igt
commit a31c48a76e8849084afd70331484a019d55d82f8 ("drm-uapi/xe: sync with ke=
rnel f99a05cc0b85")
e.g. write out which changes are there since last sync and
use as subject 'drm-uapi/drm: sync with kernel a1b6cf8e5e7e'.


Regards,
Kamil


> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> --
> 2.34.1
>
