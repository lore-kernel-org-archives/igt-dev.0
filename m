Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A492DC2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5FB10E251;
	Mon, 15 Jul 2024 04:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vodu/kAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDD810E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721018662; x=1752554662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4vcx6cGPt0AjNHdeLQdT1i8FLN9MVd7q79lYT+7YeUw=;
 b=Vodu/kAnDChmzD4mIZcLIpc1eW1gR/ARzUsqoby0+znQGDM7aJ2imx+n
 dR/mpvkIjmj/4LiGQiQ4qMbqHpF+k1Gaxt5Ebk11IW3EJfRMSQlOxOkjA
 llHylAmLepmIBfBtPuHciiwanxp9+/ZjQk5mySc5EmDnbV16Wmmsor5xd
 r+HXyRH5NvJvTmEh4C0X26uTQ+dgRvs0HQX3AEb/Q9/pS7pMkIeFDV4Rl
 CMgD8QzDl+PtM6VYROSO644PphpIPCudI8dbkmGIUfVBdLv9vTKyRWFHd
 O8+A3DgNcnKqvrIA+uhhL1mN/56FgGA0XoUXhiv6jRXHmP6OaQa72N+SN A==;
X-CSE-ConnectionGUID: ctbCCZxwTPSok6jJ5gtXrA==
X-CSE-MsgGUID: uMXfDa77Qj6AxngogFr8HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="22249809"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="22249809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:44:21 -0700
X-CSE-ConnectionGUID: xSNbJcZoSP2UGxgkX7ynyw==
X-CSE-MsgGUID: QoD575lIRnuyKgVtqb0HEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="49581067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:44:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:44:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:44:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:44:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNhJVooX7qNoGcQmgCrWsgNrnLLfJwwjXE8iYGI+GDGOvngurLviVtHSzoqOKfh4uEJ3oMR5yM5YoFrUlvidsw8ESnUR5EaVWAkALtIcCWmYF/m5IwzvOMT2EAX2o0Hmzd2MyZr1YskP6OkPf3y0Dj2zG1Nh1TMSQMvLTfcnaMTnh8PAKr+MI+AhQ0VGyDItXDAy7WNdN7h5gQ515iFO6m6QZOltBJA45jsbCRc6WmqS5wKtAW+mmKP3njXqteWTQ01to2ocaTBYg388sYeCqfOapbj3WbM3QRfQljXt0ZGsc9bKxnk+ikwzJ6zqzGV333fuMSYuWMT/torZBZfx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYm4fabFsMK1OUvJzDac+I+dMRIdygG4yZn1FfN/Y64=;
 b=Fsyz3HhcnJbs5MofDXPPxyLCzcUyTuxC1dUuR+m96UO1aWJiMSYI1qlRs57W3FQi8hzfAuG0S52wOfWR3VZvO7EpbfpcRj8eVTP4xDKUXRDPEQhYT6lKh1Wgy7OyHTX5BV3ZKUKHvRP0LyofoVaS0BkxP3zpFxOIeZrBEPoXFpJPZ27Q56et7lS86CmMlrKEnQP1xOk5ocP059VIsjSkI/Joxk1wVluIrA9teR5hWK+CXphdb7jY4SUEYVycHXsCfnteASEykpl64JlK857dGCmR3sZAQwNl5ocT12Wqx+G5OCswYf2glfzN1aoyuSGb1LGVmVlTQT6qXorjrSYeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 04:44:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 04:44:11 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
 deep-pkgc
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
 deep-pkgc
Thread-Index: AQHa1PV2bhaa+YoFwk2jdHGURwJCY7H3OI4Q
Date: Mon, 15 Jul 2024 04:44:11 +0000
Message-ID: <DM4PR11MB6312E063E7C4B692DD48802590A12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
 <20240713072646.551590-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240713072646.551590-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7092:EE_
x-ms-office365-filtering-correlation-id: 72729a9e-4862-469a-9830-08dca488c541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?g97vt2MQao83w/eQrf9jCVitkdFigON/LJQGZAAoFH4LajIw567KEmSlhhtV?=
 =?us-ascii?Q?Ali/A9MfpTZlOugT8SJ1Akh4nk60A2cN5jCMNQBTw6ctcbj+SNLZlA8B8kRF?=
 =?us-ascii?Q?ads0cERJj+d5EK5/wNbcSnNyFZh0tOmZYcpTOX4JqWmcoyIEqYc5p2SSeyRb?=
 =?us-ascii?Q?BL7HEiKTbkMYCKQk/cMsYbsOvEWfc7uAqyGfNryazBJgTeo7jS8FIadM4jCF?=
 =?us-ascii?Q?XC+gq8KnpPGEZygKm2IYJ+5f7ZkMZvFLLYzUF5nWAtLdkoEvDSUGdzqMs/Er?=
 =?us-ascii?Q?rTBjOs0YTSZ1mJSCDbi5OjvrryPC3mNYqtPomk4hM7F9fbl7j2QEHjYyTe8D?=
 =?us-ascii?Q?f+5PRCMllRKe1YHvgRLRIJh5a9SKlMvg+mXbgB4OL7+xV+G205fkBHsbabM3?=
 =?us-ascii?Q?XF3YtOlEt5mTV4/ICioDkIEG/dmzQvv/cwUh3tOs8tMKWaCa6sbiAKc/TuJ+?=
 =?us-ascii?Q?tBa5xvBheRIWBFMkRFOQ4V3A6rPaZp6vARPozyt1U5qfPUXSC7lUGkasRn6b?=
 =?us-ascii?Q?k3gPl34/8AOFcHGmHUTvqatgb0JUSOecIzr8D5RoQvDghDuVFYYdEDRkCz/F?=
 =?us-ascii?Q?dg40pKr5aoekJipCPPCcXlYISpX4rSGeqqjXBZv/w6GSpWuwrVN/WWBAnmAC?=
 =?us-ascii?Q?/lbsP612IPiHVvtagwqG0PqhJdyT661ZLwgqQoHsXStbKwj0NYozISFN77eQ?=
 =?us-ascii?Q?lOqmiuBjwxXDNiwSoffy/uW6uSh2kchYgX2yIu8p15jSTvMvIOYUX2HZ4pUD?=
 =?us-ascii?Q?YXuxERBEWvU9XUAIFAv1PGSRLGe67SSLTVTs4ljYrgX8Jymh+zqVEu0/Qffh?=
 =?us-ascii?Q?bHzOMY1aRAoxjTa6fAs+Ad6qYA6MMTcD3ikUBrq2t8KFqH2sA7xy1eUpkD7j?=
 =?us-ascii?Q?lF8D6Stsq/9IS2MMJ7lHDUPHMsI6GEoSEK5Hkci6CIrJcsDuw5rxqmrbGdDX?=
 =?us-ascii?Q?XAmp3DqqjuFXe2nI6AYtu2AupfwxkfvF4Q9eszrso26ui/fJ+U5/P9rP+2ns?=
 =?us-ascii?Q?buMT+qJFxF4IyIu2iz//1LizFwOMcsybi1RGRIA2i9AckVLegET+CLyMJhmO?=
 =?us-ascii?Q?Xj7XkwpTUphJN+NuZGB5FM45hzSILiryeIcUq1NrpmiqMVftyn7DgrHMA5z+?=
 =?us-ascii?Q?KYW5gFEc6HuyG7JyFz3jKwDAyoQRDTCSpLxiQLO1Z500djimXI2S994LiSxt?=
 =?us-ascii?Q?YuTV1W+O/SFm3LmcwBU5xCXYuMU2z1zJ0xLRCswEnKR/bqT1UZDg1VVeZvfj?=
 =?us-ascii?Q?UxU9DYPCpj0edKAiusoKD83AvoaU3oGjVanImCaF6apv0PaFRsfzhgOabY02?=
 =?us-ascii?Q?pBmKqeqar0yJ93GW7iwIU3wcObEHQAeGzxU5zu/Gv26cc4PEJW3tiCX5N2SL?=
 =?us-ascii?Q?fFA3CiwIgovLQmw7ThGwaYo6uwkROavYmw8LNu5Ug0vlv8TFFg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ihWOROzZHNAb37YRQGOfEwxvq5O7H8Y7eboo7IMUoc6CL1mkDBQNZRX36flj?=
 =?us-ascii?Q?u+3ZL4iDVTLOPYWrKcWPSCI+HKaBXseruQqTX1ouxF8hOXdln4JA7WIGMjAO?=
 =?us-ascii?Q?dSQ8fK2Qi1gfvmsCzj0JBowaEp0t2lrTHo9URoi+zEd/8lUzRn91PGvvtHEo?=
 =?us-ascii?Q?/UjyiNpKBv1FBRwlnAzbvJM731bxaTUokU/H4Wu09s8jJpsNieKgDE8zSwwx?=
 =?us-ascii?Q?jVvFC6rIoQAZJhV7h2TdHLEwtFM8O0XHMkCiVh35ApvZgTb/G5EeRe7xxz0F?=
 =?us-ascii?Q?jm41yjx7XU2ehNiAUJF+1O5FmrXgBgZ1aYlGJl0SAk8m4SrpKc/HH6JFRHh9?=
 =?us-ascii?Q?10wDETEOJF/HcrorUYVIZtDze1S2lJvsVUh/UmMWX95W96NZWNJHgyDSXgrH?=
 =?us-ascii?Q?xH/xJ4X8vc4gud3MLJRiFSElKrXtii0vFb45KakGRVR3fnQxMM4rbx/F505o?=
 =?us-ascii?Q?D+Uh0UmojatWKISpwsac2kSQttzIeTFQHc5eMTPhbeFr4cRnhZX2BoNs+vJS?=
 =?us-ascii?Q?70qS+kwl6BMiBJopr7plgfMY4Z8GfVEZ2mL+M2wobhG+4A1xsybOvq+DB+Tj?=
 =?us-ascii?Q?WiG9FkFwWHnIBpv/prGw7U+xTgdEJjNRcrhZbRn28o4rQYiWt2uRIeo6keK7?=
 =?us-ascii?Q?3y2xNIa5Vh51uku7qK5kP+Al+kQDAlHcejl2gNJsh9OSn92ViSHueWGQMAO+?=
 =?us-ascii?Q?u+hSkqGuJpLcwMur9voTwvBsNlc8taOyLKPc1LrLLjugCFCiXRb6fv9H+kRJ?=
 =?us-ascii?Q?ERmHFCUiUgbji+4c9uXM3Ydg/fL0GWTOgyljTWAZaNj/GK7KuzTbl4ceXryM?=
 =?us-ascii?Q?MGCiZPmsKvTYyiH6LdrbkYy5N8YhGNSUoz+9pQdpxM1ftTpc4fI+4DJANDRU?=
 =?us-ascii?Q?MIK3vHQH2YdOgZAhOi93t7qcUM7FvUFU2fax8htWiAXL16YElGNLS+ARUTYf?=
 =?us-ascii?Q?vI2GlNUUJoaqoLCYYIjc893tPVH5X50lLCVnkfkyyM81kVBuYjMiZvWDhZq/?=
 =?us-ascii?Q?+v9tQvy9FS5gBrVrpXKB6EMRimcBhPPlzMBCrN/WKnEf23romlFVeK+Ch8rK?=
 =?us-ascii?Q?GgFhfxnIxHsV2Uju7IwlJo/uwfurpwDlOyn7VnOZCV2+60+ts9rNe4GYMPhT?=
 =?us-ascii?Q?wWOIcCOl2S+xcLDIWK90Y6QbMFISR5bBTguEBe1AmKbmG/t8K0lX5mmMk+ny?=
 =?us-ascii?Q?IOWGz07pOHypSRZpx2jV1+x44OnIjhnaYAXKz5CFwqpUddL9fBFOcLTcarYv?=
 =?us-ascii?Q?cioxcKxH7ml4i9GREimvhDq3CDUeAjQu6B75g3WF495qEyqVfHHbDp1VSqCD?=
 =?us-ascii?Q?4eemBvzPyZWrLnH16jrAdEXmMl3jsCoGyPvj1JIhfep8GbVwpCDfMxxYitPb?=
 =?us-ascii?Q?k5Pf02s4AkwRbDhgoyhgNzml0h1Yiz8GwNdyvWb8L3ZbBmkbR53yFEX27nzv?=
 =?us-ascii?Q?VZA2atTP1ev4ntTRtAzkBgrBM2YiZeKn/uM/nrnHwOwyjLO7Y5KqcKHi5vOy?=
 =?us-ascii?Q?K1m1v9kjT+cDhX7o7X5Bjn25XZHcll4E0FSZ3vqdtpV9GFLKiqwTMALEshOP?=
 =?us-ascii?Q?TkZHu5OqzeLdemz/Mas=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72729a9e-4862-469a-9830-08dca488c541
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 04:44:11.0607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFY8eFH1RwgEpgwUeJKYJI1ac/DH9199be1XOF2rZXcZBlGufyPf27A1zVAlrm92Fglrj+oPVK2WZ1HXygxYkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
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

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Saturday, July 13, 2024 12:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive =
deep-
> pkgc
>=20
> This patch will add the connector checks and test requirement checks for =
deep-
> pkgc
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> e1318bfa6..bca5bfa58 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,31 +592,46 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, delay;
> +	time_t start =3D time(NULL), duration =3D 2, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool vrr_supported =3D false, flip =3D true;
> +	bool flip =3D true;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> -		/* Check VRR capabilities before setting up */
> +		/* Deep-Pkgc is a power feature it will support only on eDP
> +		 * and low power pipes so add a check for the eDP connector
> +		 */
> +		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
> +		/* DEEP PKG_C_LATENCY can be configured only for fixed
> refresh rates.
> +		 * It will be support NON-VRR or VRR with Vmax=3DVmin=3DFlipline.
> +		 * Disable the VRR if panel supports VRR.
> +		 */
>  		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported =3D true;
> -			break;
> +			igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_VRR_ENABLED, false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +
> 	DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						NULL) =3D=3D 0);
Fix indentation here.=20
>  		}
>  	}
>=20
> -	/* Skip the test if no VRR capable output is found */
> -	if (!vrr_supported)
> -		igt_skip("No VRR capable output found, skipping the test.\n");
> -
>  	igt_display_reset(display);
> -
>  	igt_output_set_pipe(output, pipe);
> +	for_each_connector_mode(output) {
> +		data->mode =3D &output->config.connector->modes[j__];
> +		vb_delay =3D 1 * (MSECS / (data->mode->vrefresh));
> +		/* At least 5ms vblank time required to program higher
> +		 * watermark levels
> +		 */
> +		if (vb_delay >  5000)
Reduce space before 5000
> +			break;
> +	}
>=20
>  	data->output =3D output;
>  	data->mode =3D igt_output_get_mode(output);
> --
> 2.43.0

