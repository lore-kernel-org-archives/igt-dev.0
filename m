Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E87CCA472
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 14:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE0D10E833;
	Wed,  8 Oct 2025 14:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaPqEvGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F3C10E833
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759934491; x=1791470491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ADoTep5e4cgj72FtyIEyVtg4topXQekLIHCzs15Sqj8=;
 b=TaPqEvGtBhgehMT1u26hfJfbD/FtURTAOjhhjM0MQGIK7/FFQcGXFfD8
 1aaYtIoqdOPsCm1c8/Iz4KF5X+iwSL5bCImAQOv63WWpAkCxVRdIEo1qw
 e0FEYy3xiNUQj3F/pD871UV6d9hdGQsLmriWlYxyKjz7OKMitBw/OeKyl
 HjqScRnCW1ZzosDMHt1mUHSBLrYY/Lko5FNdW+NiuCQILoq+DqdvOXXTE
 NoGsQ5U0VuT2v3WE8OYKBpFLV4pPEMg5h0GMkYfj6iHE1tNRmzdazKUEL
 jVybPXAUWGtoUYBFKEujT23dTh/0bk03sFSw6v3hIBe6vbIb3SwLeYMQv g==;
X-CSE-ConnectionGUID: TobbRRiISTqe/rPIKlCYLQ==
X-CSE-MsgGUID: 9Xnhg2xvT7yJnIBPUQdk0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79775795"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="79775795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:41:31 -0700
X-CSE-ConnectionGUID: YK6HXEnETrq2EiIQte/72w==
X-CSE-MsgGUID: tjMY+4AnR/KG0MojOUckvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184838327"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:41:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:41:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 07:41:30 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvPZKx9mNEHam8KKE1++vq/G0KD5oh/J4afFHQoRL4CkZGmTa5kucz7g5IY6nGR6B26bk2ahR9TP80BNBw+MfJcs1EUmRoyqh8aYaBan4oaX2pw981ZkyrNSWTVj+fl46/x4bFThquCdtzZxGIaRJNnN3UX365EkPt2LMVaIR3hPPbmWRixnMjuxANb6R91YPks3kEwuc9cIPS/wPWDpyoQljEfBhlCt5eYTG0JA+5fO9xh8VDoAWew1vdZskenmOiSHe1RRRw24+BJcw3BAK8uPm6g2eF9AzZ8vmhD6xCjpxrPoIGWSJda1EfEjknHTOE21WuGIfr8g0QJxb6zp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CV+v6OAPkqtnhs3xiwAJL3Y+5ANLPmjVmwbz0BUMI4=;
 b=sMFAc2Hv+MQqTCwwz3AA0y0xdn3Y+X3zvwmJRwJ2Jyn0ms3Vdq+BWCn3QaWJLUfBGaqfh+1eKa8Hhh298oGjjRRRoSGcRHRGv2DMMUxTeToiSprWUAtoLKaIR63KcnZM8JaeMm/QhNKbgiOWGOcAF/qLUcBX32/l5Ui5VT4WWzgEmLeRngItWY8pm5XCvX9wpbQDrEZhKijyCLyEGazlxOtfz41ZYBGACZA3Phc86aMwjlGrkRTgMQYEk/V9nKCusSzo4p7dwgOsxcbQHMXkJedVTcFbbPDQdsQWujrnSlig4dNh0EwTwUS1kXHUkVKNLudpY0I4OI5TCTLeOxACBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 14:41:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 14:41:22 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
Thread-Topic: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
Thread-Index: AQHcOAxvpJB362sVRUOZqXsbLdi0mbS4T9tQ
Date: Wed, 8 Oct 2025 14:41:22 +0000
Message-ID: <PH7PR11MB6053B9B61EDF9DE9844D1256E7E1A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251008043107.1536018-1-jeevan.b@intel.com>
In-Reply-To: <20251008043107.1536018-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH0PR11MB4789:EE_
x-ms-office365-filtering-correlation-id: 38111375-1829-4f55-0865-08de0678c053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Jt+rLIBHcSxxqSR21w8xP09YVRMk7zMrOvDYeOBib+QdbsveG0RGOB+ShL3o?=
 =?us-ascii?Q?L6VL5JL6ZhlHz0dZHhVN1ffu3BKMG366eP028FKUfHqFiNeb5l54RC3ZwdOo?=
 =?us-ascii?Q?BHEM1h0NsLUP8v7pmNLkCYX2BRTrhCBODomvH/n4wvY9F9krMHBxsic8Y8pX?=
 =?us-ascii?Q?bT+p0aDvncmIfKtxIuR4LA78Qde/WO+JhYHoqSCZEnmlMF2AwcpNniX7zaHJ?=
 =?us-ascii?Q?rnk9PQ/0NGUxYhrTPRkmymS8IAiOSAyyczTCiWDU8GczAy6Ej57REKzVhDrG?=
 =?us-ascii?Q?GKQitsGih8H47U1m2a3qdALAq12cZQ76QTesWFqWtjf+77kxs85yYczApfWy?=
 =?us-ascii?Q?U4W68zegPAPKtTOeOCPfcxurs9TEndugt+Wo7XStqqJRlfF25nW5zBOz46BC?=
 =?us-ascii?Q?YEdfWF27miF6DX4jTcmViW46A4fvY1LGcuN5UkQOTjiPyU1n49K+yd0j+HEq?=
 =?us-ascii?Q?Rk7J+nzTQhLjz+YikuBVCJ5Na96tbrRoycy9NiKjSN7KcSmQ2FoGkNi17yHA?=
 =?us-ascii?Q?d/YPWBx1gosbIOnt7t1DLsYLKXLWOPa5xULWhZ0VoOg6WUqvvyz8vKKnocfr?=
 =?us-ascii?Q?+vkvkOIiI2FJur2NtmcosULHdawXZsOYO+QGoNXCfounq4GJzGO/PoWrcyrp?=
 =?us-ascii?Q?PIWoy8ZSSoCXcYoQUbjSaxwfg2k+6CWNHc8Ww21ImTPi7wc+uwUlR5zFKOno?=
 =?us-ascii?Q?JuYI0rB6ybCBuHLdnxM2RpQkOS5fe1sPguJDCHj9K7lO+3GLyClgKKeeNWpS?=
 =?us-ascii?Q?UKkohegW9Jv9yYazLrOHpkEEe5LyHJft3mEnb+W0BlGvHRxZLyk9wbcVXMI+?=
 =?us-ascii?Q?+0jXERh1aqfVwit5URIfA0MjlQGH1v5C4qoC8ygpSNX6WqOcdwQzzOqnGVGp?=
 =?us-ascii?Q?G7qhcguSVORzFmk/POhbYxUhB2eB7CxvpMY79lGrP7byRDqfEo77tAz9anxT?=
 =?us-ascii?Q?aORTX4NQdmJdjNpQ/PNSil22T0RhSiOrEaIFEolF4vTcNYZcnAdjHEqSuBFv?=
 =?us-ascii?Q?7OYRBaOQtIjO9z5kHT65iuUNm8FbITYb3HAdhL33705GdDR7GLmxrdknXn75?=
 =?us-ascii?Q?hOPackjynRh2SbDmTRwcY2miCgpvf/1kpUO7BZY8dIgcz3g5t+WhI9uIYUUr?=
 =?us-ascii?Q?2COPbgMCtWHpYLWPM/akgldm29RqZRwh4yt0L8fpW1uThwMOvp18gvHDRsRo?=
 =?us-ascii?Q?aFPLq8Ln1a8Hi1P5PtsWPAKNq3VHcVUNaOowfDOQdLa+NdCIUCLfhaHXhS5y?=
 =?us-ascii?Q?itWQR6aUCC5cG5Jy2lw3F5CCoaYn6if3sG/wQ30W6BULSPQ+XJvvTwmxy5pK?=
 =?us-ascii?Q?OhG/lLAfqjVfN8qiewmUCVh6EyJ2/kN69sgtMyA4YzQczJVK3XaaPLZEMVjx?=
 =?us-ascii?Q?3s7Rz/uKYzi6RX4gxVuMNWk0WzmTtz/hVXhsnPL69Qm/mQrAM8oOS1CK5m8P?=
 =?us-ascii?Q?PjnRY9QYxVBWWQ2O1IVXImCXFcys+xQeVM6ibIf5394zOfAxuQcMK1/lOIJB?=
 =?us-ascii?Q?9ZFGDeVjQzKKD9xjJ9xEd8W4PnI/UOrM2tbH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LXClqHTxedSDh3Yam+EVYx+iQJig7KX9MOXe1KgPmJXbhsqW/4iRvqLjA6Yt?=
 =?us-ascii?Q?+sEwGZIJFnUfoJDzO3GuhFyIjwkNdwlt3f0rtLYIhZw4eNDoo8vXnDl6m+j2?=
 =?us-ascii?Q?Olyf+bSGRdH4XyQPvDgMYIzrSdANNt3a8/Hwdl3vEQ/OrA0clIVFHIzs+tHh?=
 =?us-ascii?Q?PHYYhQ0RhWl4lO0sXhl/9qKOCphrW94NgDRoKAy88cgsmVKPw7TdCQx2D4Zy?=
 =?us-ascii?Q?zenpubfMWcdo+0HewerskajVTBBlfnvOWL7Tj/sgE6hEA8p7FHYa2rF8AWIP?=
 =?us-ascii?Q?qf3qMCTUJ8T4lefIPIf5HbxWL3Fiyjl8kSd2dZM0gRUVRMbLUZLM1VMjyjTt?=
 =?us-ascii?Q?op84rNbc9InzPFQKmYX4+/k4XKpwwhw3KqnmKtV8yEtiHI0HZuSOm39001rA?=
 =?us-ascii?Q?GeLiV5T0XqTtLJjz2g9R5cGgu5TfRIekK4ck3s1FpLQS4HaoqT+nHJQm1mu/?=
 =?us-ascii?Q?ZfFkr85NOt40eN365is8hd624dygFi6uCWMGo6FfTiDTQiGr9eymd2cvvI7B?=
 =?us-ascii?Q?mMxVZx8Bi7LVyMjufddw8kmAnYH5sys6jQRNikx7+AeH68Hysr8CVuSLriGv?=
 =?us-ascii?Q?sFmG9X++KiL+CqaAxYzdA09L39W4phoWRaOAXMa7f9NCefmIrpepGHeRydpz?=
 =?us-ascii?Q?R8ENx/EHLENz9r/LNCmw8qjYGlLVEBlpvatvUtur3LBE7SDnMPNcRVFIvd8H?=
 =?us-ascii?Q?PxfOWD3mha8kxLfJ+wKx0BUN6IsIAQgXQ7CVsbQrxpSzx9+MunXHZuLQ7mk7?=
 =?us-ascii?Q?YTSHF1rj6mViAbiNi1EUJJRMrNvZ8dvaCDzQNpwQlhuepMgqSjDtIJMoehFl?=
 =?us-ascii?Q?l5YSrq5sjYxi+fjOR3uaLQL39wCwKhg+Kn2PLzdPCkGxMX5vr3tCBRx/gOuh?=
 =?us-ascii?Q?zjXP/8+6HH8EUbRX11d+BPcXbuBU1CO1WLqZqHpcICHWo00Ez9tecLaxpfOH?=
 =?us-ascii?Q?D7CCOFscPl+SRVy9fBZIOo4EHRWjwCVI0V3Ic9LlUsZ/sDctt1hwf/DItM/e?=
 =?us-ascii?Q?Jgj6Dlt/YGCzfL3/ZnIbgNYfSx3oeR9Swd4VY0aicoFzGArmC21wt3kFM6LN?=
 =?us-ascii?Q?nQ4Y9KWfWHLglqH4a+ETa2+my+dWtiASofH7cGR6bBO4c7nv7VAn0ZKOY9w6?=
 =?us-ascii?Q?n0tsQIJR4KCN3oaqqvIYjOJvNY+TJloydQwUpfwPWOue2w91zmIX1TB3vyNh?=
 =?us-ascii?Q?ZaEP++Y8PAl8pQl2oP57t+TX7K+5B+LmYwUBSSHS+ayVml77DhPrUyNy+pJb?=
 =?us-ascii?Q?A04fuWRVc5QSPLU1oxClDIJas4glNwpZpp7M9EfSOAsSuQMA1xIMZJb9SKYL?=
 =?us-ascii?Q?/tAbDHv/opFseFGyrLS79+HmywzgAg9fuaGkWk2OA5vjwyZdeILQ61PxXWiJ?=
 =?us-ascii?Q?ZE2uTrhT76Ugy+jopC5y6BFpOYLPMXhqDsxib7ycAxBayaH2fjAFmAg6p/i6?=
 =?us-ascii?Q?8l1+eX60K0sIiJG8YtL/T48ho9xmR0rTB+7R/atZp2wTOJjQInHB4/auv0hi?=
 =?us-ascii?Q?mrMU3ltOww0mDX377IYY6LKkcn63HtG4GD1DlaLtQkLR3EYcIdAEDZReDAPx?=
 =?us-ascii?Q?yCHMTZFhmugaXemVpagzqeEysUJZXFDlk/FdnE/L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38111375-1829-4f55-0865-08de0678c053
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 14:41:22.5158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9gdojjo0UBxc8dxO+gD+O4K2wonRqIa6IJlwEmW92FQDrvGXQ3fMOd7ky/uTIr3xsvYZhW9CKlQX3IxnQ6N1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
X-OriginatorOrg: intel.com
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

Hi Jeevan

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Wednesday, October 8, 2025 10:01 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
>=20
> For simulation environment, we can reduce execution time by running test =
only
> with basic tiling combincations.
Fix typo: "combinations" instead of "combincations"

>=20
> v2: Add helper to check basic tiling support.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.=
c index
> ff9ad1229..72fe01daf 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
>  				       COMMIT_ATOMIC : COMMIT_LEGACY);  }
>=20
> +static bool is_allowed_modifier(uint64_t mod) {
> +	return mod =3D=3D DRM_FORMAT_MOD_LINEAR ||
> +	       mod =3D=3D I915_FORMAT_MOD_4_TILED ||
> +	       mod =3D=3D I915_FORMAT_MOD_X_TILED; }
> +
>  static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)  {
>  	uint64_t timeout_ns;
> @@ -242,6 +249,15 @@ igt_main
>  					if (plane->formats[j] !=3D data.testformat)
>  						continue;
>=20
> +					if (igt_run_in_simulation() &&
> +					    !is_allowed_modifier(plane-
> >modifiers[i]))
> +						continue;
> +
> +					if (igt_run_in_simulation() &&
> +					    !is_allowed_modifier(plane-
> >modifiers[j]))
> +						continue;
I feel you can combine these two simulation checks in single if statement.
Something like this,

if (igt_run_in_simulation() &&
    (!is_allowed_modifier(plane->modifiers[i]) ||
     !is_allowed_modifier(plane->modifiers[j])))

> +
> +
Please don't use multiple blank lines.
>  					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>  						      kmstest_pipe_name(pipe),
>  						      igt_output_name(output),
> --
> 2.43.0

