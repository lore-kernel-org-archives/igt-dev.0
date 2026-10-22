Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D1C606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXrr1a9z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2711122F5;
	Thu, 22 Oct 2026 05:10:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1AC10E3B8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792645744; x=1824181744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NtHIQRIsyY3vyHOgk+6pXMkM/1p8qptIBNjvJiUPo9Y=;
 b=NXrr1a9zQb7P0C8TDIdOtUMav21k3r7k8N6h/pl/iCL2oT70AB5j10NE
 G47+s8Zgtb6w+YW97YqSlho0zPa06W8+G+o2w1ZocBfD34o9eHq2aSayd
 Jd3w7TZmZtbHuCHrVryhJvb2eeqWAl+0mc1SsLiS6C7rK0yiGaan1yqGK
 HensNImCwn4iFE+fxGCe1XLRMt6HSIsqDVlyQhRQ+m8BB8GHDODYrSRjv
 zfUO/G0Ug0cgRzUNBDc49OyETMI2SqsSBHGt7NpsYMtUGM+TPcXhzlbCY
 ZjgoF0SGRtnqc5WqXaLG5LsvtLpQeLSTIbORXQE6kE2+hIEOJdGs2OU6F g==;
X-CSE-ConnectionGUID: BpWnLFLIQJCDRuaDmDCq7Q==
X-CSE-MsgGUID: /hH2pZM0RnqlGDh2NtqsIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1272925"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1272925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:09:03 -0700
X-CSE-ConnectionGUID: nYGOrScTRiqEfyovuTlgkQ==
X-CSE-MsgGUID: KlytkgaRSOCXEoUI4XF06Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3211710"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:09:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:09:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 22:09:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:08:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9sFU6H/BA2n6/yIi8c/aeNGhFySQrFatnDzUAzcBuvZgBwEPgInDs6Vh/B+F1HEgmBGfbAJEOCiS+89JGiVBahRTM8G33vMRwouj/4fQlwHVYn5r0uXkqW3bmmG5XC8t/V4qNy76PW3WIFpJuYsFdJ4/eqNsk3DfpXslroainuS9ysA1KYwx7tFj9Cp3K3KnV/knprvIRWafUtpOkJIJwfx5DdJdJZrkM64Nu5p/83BtnsHXcU8Bmt41CFeP6VtfGWIYuwFcz0KaZ7YpuXqXdZXmNBSjeq81eohdw8kmPJHn0DidujvV+qQiDck3QiqYL2IFIZkdL64Oksg4zjswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UgKIwXmrgVv6U0w4wWLUe5bbrK1bUTiglGjbUV/pls=;
 b=u3KcJoo0vncGVooBtGTDcVHjIpUSmymkANnzv3672xbLq1AS4ndB+rPew3psGMiMljqP9KLIm7Xe1W/gMGCYac7Lxbj6fi9g/rkzXPm1wfQivzbcTEOnyHUsmBMFh8/LMcmWVBmSx9LmfLL4VQmsNgihzUFnGaOQSrBZMihDC/CG0VUNTTIyjEkOSJuCG3Z783r8jr7cXQvkhizSolizdgJZf/MBjTjhSsVNaRLvvcZ0s6B64T2C7ecr6Zpdbc+a3AgG58IZJXP5Wjjr5hptmC+WGeEPvuKcz6tG8i+vdUujGOlZ1JvSQydS55+rSyPLnMdeqm6pLAnFKgvyi0nhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 05:08:49 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:08:49 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on
 simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on
 simulation
Thread-Index: AQHdXS6Pg0SmxAJh/UuS9L6D9ALTQrcJDF7w
Date: Thu, 22 Oct 2026 05:08:49 +0000
Message-ID: <PH7PR11MB6796E8C5F71DFBAD6981CE01E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261016052243.633897-1-pranay.samala@intel.com>
In-Reply-To: <20261016052243.633897-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pranay.samala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|BL4PR11MB8869:EE_
x-ms-office365-filtering-correlation-id: 2c2c2a06-7734-4ab5-1c8c-08df2ffa8f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007|261021121427099003;
x-microsoft-antispam-message-info: ew/H2ORNTsMBd5dUGInuFZzSmD4u9F3CQFnGNBz4CmPIDzVi9spEMbKW/oJtpbBuYaELA0PcAN5gwS68tbAyV2IeJlE+VO1C+xNZKP2hEObV6KxUyoBxQKHT4y12CD9VV5SuztPG6Llm9DyK0HDp2AKSkEjLvVtV26Xh4AgbzHwCoARUN/XEq0An7RdwKnBPD/NPR8S0xNk4lGnJ4byDbGolOD79nGc0nZr54L9lYJncbS38w8TeB8QWnECnG2EB+3nNwLJiCPDZi9Cyft1yNJ3VqS6IIouEW1cOxX9iup1x0QXZe2uYem4xlii2I5BJfJ0JZo6pBaF4rmA30Z/c6wxjHePOYTQimE8UFTs86rEyoaLOniPWRftpVC9DgoGm7gVkEzJGYVTeIW7/xbxqYwoIxXH8djN4dRPGPewYWo5XPkNyOvcezVuAhtlMK78M96DuOJk5UUGCjA6z5Z1Qxxt9+0e2Id+Lrc8/W4XZqV3TVnzq8iKL6q2/lwENAPe9F5OgeTNKIioKIMa6CGcDr1TmvLgpf5vCtbQUkKnTUrKt0JbPeh35zir7NpN3D+KeJl3Q2gsdWueTI6G7s4jDOmitaJFObHq0eYIOAbMYArWFQivwIuyWiMu8/EOV0B694kTTI7vtRfat/NYEGpErnIxl9yuSildexwKGAsYKzbkzomKSCjiDv7Mq37A+px2SrKsUr6liOneZB3KBc0Gikw4ajeVpVLYhvlvXrC6CHWw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/uUtLGwYwbifHHFBy6yygr+97kMD9EWEPhf7xw74hXDNUXp8CyY0oAYsqvd8?=
 =?us-ascii?Q?lMExTo5E6q17NSuK4YHdp7eNGB6ubSpvKz/dD5vRIoFm0yxmJsW1HWMdhXOP?=
 =?us-ascii?Q?ScPkQbf3fxtoGvbIlmi2iuf+1XzXOaFGjrHuSkufI+SL4giLFIRn34vozYFm?=
 =?us-ascii?Q?f7qMPUY0+XNyCZr0aEveQoqQz7If2ctOmWV1voWNOA1/K1CwSfS6zXLh/1iV?=
 =?us-ascii?Q?1E3oVjj/PdVJoZenQepSq8Wg3cRMj913LisExw28evTM2ZXeREBZ+Rwq1oG9?=
 =?us-ascii?Q?3uJCbtqU+otlPBbkVGSMwmFkgnKAqFXPgx+5Yd3rN5XayL4PylJNifjLiNoh?=
 =?us-ascii?Q?joJtvaZtJrGyRmo7QAa57hc+vrsqkVulktJfiQiqW/bLKI59b8PTaBm1n2gY?=
 =?us-ascii?Q?CpbU1Q0ZKRtM+n8JC+K/tShfoVJqprrIqr+K3QGN/ixmM11wgBCt/KB+R3M5?=
 =?us-ascii?Q?cfQwU5zQOYyfgNloTzxDx4jZ6tZg58gaI5z7U+8qgOv4lfbZoIAamYFw+ZQ1?=
 =?us-ascii?Q?H5c87z1AjrSNRApL02Gn2PsrD5Cpwwp2dJzPDjv8x8Ul2xZPvLInjoMRLF2f?=
 =?us-ascii?Q?vZdKePV6oc46n4xKXGmgmhtOZ45oZqUYn328Lz0wVVviaRtPwHUBZ5dRkXdt?=
 =?us-ascii?Q?SLovYjv9hxYnxX5r8eCw10DB3D8OOiMYqM8HUTvlgqhisL9ZZ25iQ2RkvZPV?=
 =?us-ascii?Q?7vuC8e2STRx8OmX0WsHGvut4Gq+sCRzAkWnqAV7iSYN63nycjh3DF40sYS8w?=
 =?us-ascii?Q?8W8U+fJrU9836Pa8AuRAhSDKoXST9tLrwt5Z5U7XhPIpnR+kuA8gso++PkNh?=
 =?us-ascii?Q?/t8gd4hzvOuWvSTMC6D+Szk10Rer46Lp9pKie/uNL09lMGIPNLpOIHMY4DXp?=
 =?us-ascii?Q?mvdVYGvasNNVFLnj8aFtlsjg20suXHJS/R8wxs0LfKzhsufJRYQeJoNmuPzb?=
 =?us-ascii?Q?iwqg+B0SONtYxtVTqVKm5m9/APjdBmg10CCZb9n/sn+Cfr42V7jvTy6ld9Dr?=
 =?us-ascii?Q?66PHTWEGzA2zd7HhU/2SXk//q7MeEdQCwTtnFDABdCnDa23lDWDzFa0q88XX?=
 =?us-ascii?Q?hokNpIjbhu5mSo4+gMJ4hjKUqSlC0fglebiRgKPt38Ep9BlGYt2KYJAWqqOb?=
 =?us-ascii?Q?lmB+1gaWy0/+XBcJsK6aGPeRJBHYbS57CzP5XJUHgOsYuO4l8eCxOmHtRJGF?=
 =?us-ascii?Q?vGE1IG1X8QY+79Hnp1FINzUd/qf/4l+VSFru+GUPa8aFV0v/pb4T5NTAq5sw?=
 =?us-ascii?Q?FexO9YJ6Esbw/kI2HHU9OUxpOhUEyvcVMhMOjdC0BcSaoO1FfTtTTuDDS8tH?=
 =?us-ascii?Q?2OdlTO/MNCb/7qzEeTW3ctrgoORCB2FZlMLaTpg/SajhTDKltZLqFeH6Nv2t?=
 =?us-ascii?Q?r2EgbmmQHUfPGHb2SZC6YSWEcv3HALmg6WMhh75J7rhi0/rblcMD/ZiZ/JW1?=
 =?us-ascii?Q?JlAhtZSqrrz51a2Y4ZmEMH2rcVbbruTu6kOkLm8Sl4bI61i0zXs8J9leehM8?=
 =?us-ascii?Q?adnQA9ehsKW2fo8euG+yDxXYiVsyfQ+lfYw1h/TN7u4+JYEzBJTz7b4D6Eq7?=
 =?us-ascii?Q?mRXiuVSictIweIn2rhPEMXIOKLOo7pSHl75+DdxxNyRXNBXCIRcOuP3yGLP+?=
 =?us-ascii?Q?l3xftWy6mVaCD2bSznzixZ0OdH5PndwD8ij2RyJ1y4yecOYrlegxpS88g0Jk?=
 =?us-ascii?Q?CMCKlejovb/AG530n/CHj1G8BzmTyn35JXh8In27J3ktPqXF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vffl/qb8mUgNxVgFNKAtxonXYY9/iSrU8NXtxwrU7zedqRAvDV8Zad/+wUYFx9pMA8SqgMlIsNGtBXy7+9yMPuhHx6YypfY4lRO7TG7OlXfFHzhzHyPAaInZT8KpyUluKOqmRaA6P5H525j17O8/UhXS2T2Skhy5pk7yez2bQcibtRau35eSEUraoj2VKtKGBeXv5CJqbO69Br+cCmPYjAkodn2pWiwgYD+xpwUmowv6CPSH+G7I2huh7iMJuQo2FzihmaYy4sXhCE5HF4FhkrMmIkrin4B9VKhyFRA7ZA5/YCiRPNUO78xIOaYNDL56HoEe+MbFKGtqteYoNrdbYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2c2a06-7734-4ab5-1c8c-08df2ffa8f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 05:08:49.7335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXy4VEyXeZuMd9JX+YQEYOv4pxBOrzHEUveGh6Lhn3M0thNKqDrdbYPWVea2CjKnKmsBQCgoq3XgtxWzAzP0og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
X-OriginatorOrg: intel.com
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

Hi @Pranay Samala,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: 16 October 2026 10:53
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on simul=
ation
>=20
> The test creates, fills and copies full-screen fbs with the GPU, which is=
 too slow
> on simulation, and test hits timeout.
>=20
> When running in simulation, limit the fbs to 1024x768.
> The CRC still covers the whole pipe, and the reference and test frames ha=
ve the
> same layout.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c index
> 48fcb6c61..4674bd2c8 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is
> working properly with "
>  #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)  #endif
>=20
> +#define SIM_FB_WIDTH   1024
> +#define SIM_FB_HEIGHT  768
> +
>  typedef struct {
>  	int drm_fd, devid;
>  	int debugfs_fd;
>  	igt_display_t display;
>  	drmModeModeInfo *mode;
> +	int fb_width, fb_height;
>  	uint64_t modifier;
>  	igt_output_t *output;
>  	igt_pipe_crc_t *pipe_crc;
> @@ -106,10 +110,10 @@ static bool check_support(data_t *data)
>  		}
>=20
>  		if (!intel_fbc_plane_size_supported(&data->display,
> -						    data->mode->hdisplay,
> -						    data->mode->vdisplay)) {
> +						    data->fb_width,
> +						    data->fb_height)) {
>  			igt_info("Plane size (%d, %d) not supported as per FBC
> size restrictions\n",
> -				 data->mode->hdisplay, data->mode-
> >vdisplay);
> +				 data->fb_width, data->fb_height);
>  			return false;
>  		}
>  		return true;
> @@ -234,8 +238,8 @@ static void prepare(data_t *data)
>  	data->pipe_crc =3D igt_crtc_crc_new(data->crtc,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>  			    data->modifier, 0.0, 1.0, 0.0,
>  			    &data->fbs[0]);
>=20
> @@ -256,8 +260,8 @@ static void prepare(data_t *data)
>=20
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
>=20
> -	igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>  			    data->modifier, 0.0, 1.0, 0.0,
>  			    &data->fbs[1]);
>  	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1], @@ -
> 265,8 +269,8 @@ static void prepare(data_t *data)
>  			 0, 0, data->fbs[1].width,
>  			 data->fbs[1].height, 0xFF);
>=20
> -	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, data->fb_width,
> +			    data->fb_height, DRM_FORMAT_XRGB8888,
>  			    data->modifier, 0.0, 1.0, 0.0,
>  			    &data->fbs[2]);
>=20
> @@ -382,6 +386,14 @@ int igt_main()
>  							      crtc,
>  							      data.output) {
>  					data.mode =3D
> igt_output_get_mode(data.output);
> +					data.fb_width =3D data.mode->hdisplay;
> +					data.fb_height =3D data.mode->vdisplay;
> +					if (igt_run_in_simulation()) {
> +						data.fb_width =3D min_t(int,
> data.fb_width,
> +
> SIM_FB_WIDTH);
> +						data.fb_height =3D min_t(int,
> data.fb_height,
> +
> SIM_FB_HEIGHT);
> +					}
>=20
>=20
> 	igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature =3D=3D
> FEATURE_FBC),
>  						       "FBC isn't supported on
> BMG\n");
> --
> 2.53.0

