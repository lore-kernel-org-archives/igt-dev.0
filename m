Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B738FD20698
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 04:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8C010E087;
	Wed, 16 Oct 2024 04:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUDqSIbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7535C10E087
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 04:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729053013; x=1760589013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PrtbvMAUo2mpKNHwbOSNApxUJhyFI6Q89sFYIjXUzQg=;
 b=EUDqSIbkqWUKQd/L21nkXTs/6SS70ZbGuToCHXOBKk+8PBwE2PsP7hYA
 MwRilu+Iq+eAx81OVClrFFWn7hUDpx/LeRIT4cbqOWmXIC7p8i01hqERA
 k2HteRfX4AsTBfyJuvMFk5an7tOVQAj7vx+oDuOtPbFOM6xCBFn0PvXJv
 CK302AXMDdiXuCZC/qMF3t/QaJ2iPl8KCmQg9qCYLPI2KUyNnsyIpASu8
 Vdk10yFgsowlYGfaVZLnNYjaRFJoCOyFIbLBDR7+Ng+j6swKEXTN8uxtD
 EHo8HVzq+qrpk8RpaolycR8IZ/YwJf+459KDSiPIX+9+7qjAswsHjA8G+ g==;
X-CSE-ConnectionGUID: bRSQruyYRy6sluFYy3aFEw==
X-CSE-MsgGUID: IKFKko7uSb+Yc4U8qtjpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51020403"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51020403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:30:13 -0700
X-CSE-ConnectionGUID: IlgXY4tmQiaWPwRBbcvInA==
X-CSE-MsgGUID: Jv44T7igR3Coe9AUCskOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82884644"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:30:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:30:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:29:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:29:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:29:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On5JoSK6n0B+wv3cqSptfxA/CQLVTMNEqLruQfZIHcDGcA+QBSLjSUczRbdCulMMf4MeGaWB3ceXWEh8wjHp48BW8ixf7fuiW8ta3fy8WljMIbDwl+sGZbdhi3INBJYJu4/1BvlHOj4v6CSrVyabNa7pQyGNH3CD27yUo4kZFlbEAcDZQy7pz7Cz/SJ16WM3BeU1LJ1x8oL9wAE8CjGmrE3HwR/OYR3xLu+VDE9HkGugpC6P4loC8uPp2S91lU58fPSUXWkYhnaw/O1kvULtm3BlVzI8xvIlNTGLX/XsbFtjCQM85xUyPphDBCwtoWGxX+6PudikOLkc41u9EDQNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOdUR/9+TlcE+vOhdMa8s3udTemU/lgUOwQ3ETJ8u+w=;
 b=TnpOxZLAzV5jCVY9hHZK+aQUujIlkUo1zSmoTBDhV+W/EKOtTSM8Nk9QxLHBRGsnObtG08wKj/khfS0lgH/pCxPKHoi14r5tTDstpC8U+h8QRK1OZoz5vuF/WsTGoYXZos07D7BwsYZvk4gt6E+/pbNgwvNG86HXu7nN47IrqWekTTvBxZsblbYjesL79imPhONDzvIBUcycwmDiPeak4bDC5i17RIeYtsUk7+2JVXm2CaOu4mjlxT/mSN3RKsrOnpP+xNN+RadWYfOQAAq4HWSm+13p7h5CdIb6qjFGfC+9G5SzsmaruSBAz1drzxALROA11vNKTGE3vJ6C3SbWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:29:54 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:29:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to
 lib
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to
 lib
Thread-Index: AQHbHx7qzqqykAZBq0OE/mCVJ0b0I7KIyOLg
Date: Wed, 16 Oct 2024 04:29:54 +0000
Message-ID: <SN7PR11MB675010485E8335B4A2091401E3462@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
 <20241015162336.304730-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241015162336.304730-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|BN9PR11MB5308:EE_
x-ms-office365-filtering-correlation-id: 17ac04a1-1ea2-4084-37c1-08dced9b2eff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?brSAF7KvVpjfbpKWI+9QWpFsiJtZM27KJhmQw2krjh/3zRBdQAy6+P9HWB9Y?=
 =?us-ascii?Q?6sHxB64Lyt2kJxKalPShu8TCFJuEgLdI0zh7IFyv+VKLlUTRVAb8CxOpaGUc?=
 =?us-ascii?Q?Dt94S617sYDUgmVKjOLDr1sLfeA3MeL2PDCL3x3vIy+b/EDlN0y8bO6AHr9Y?=
 =?us-ascii?Q?C7YboOcZBTePmWnc22Q9uMF9Ha3vNTrHTjWDFBwxeCADl+F6hFY3gcACCnCw?=
 =?us-ascii?Q?oC4+sTP0CN0A+XK0Brti6fsm6/SCBk6Nr0dlQI1bgjVTYGfZqoFm/B4JAkf/?=
 =?us-ascii?Q?K9egFWkncMrYGpq9v5WwV+woIcT8asOnapIt7spkg1WKpBsziXdEnEMI2KqY?=
 =?us-ascii?Q?j6yd3lZfF1Zi1B0dv+rTpnYdo6vf2/bFkAKi0nsuLvFufljqMXraqfMjuerF?=
 =?us-ascii?Q?6pH4UG8BvD8iJZWl9XT9Cp3XXG3v1D6d26kNxfEeSaNYxXrPS0w6xshB45nc?=
 =?us-ascii?Q?ZyV+4cvqzveGX/x6LyFPepmwU532nKeElhiBWz+V9XtXqfXJOR957IBlumRK?=
 =?us-ascii?Q?sDu2j5DgeEFejDwcAYXwKP5w76hTnZXngWThoUnl1maT/RzZMQ0Ug67sHQfq?=
 =?us-ascii?Q?2lHQwmQbKYQingI+MflG33Ap21a2WDFu03TWNdSs3018pfdaMpv2B92oFDMY?=
 =?us-ascii?Q?Q0Zj949MJsUOaNFQv5SY0XsU04ows4xZYD+JOwSRl3d44yKNg0UqzrzATuXS?=
 =?us-ascii?Q?l1YvS0WzbctvDaCmK4szpWRyso4+Hwod7DvCTPA8hX+e3yO9/UmGkb7kwGLp?=
 =?us-ascii?Q?i9diRWzntJQqKa1wM75ysXY7OtBMNw8VZmcYrK7IF3MJ0l/1+8qDd4zFMetM?=
 =?us-ascii?Q?/IJ0SfXTCBIux9u7nkGygK+2N9OGHmTA1htOYzVoqCHZZ9tzKEB/x2/SvyEx?=
 =?us-ascii?Q?oKTZA2WVfxp1y5kM/op7xUE/khe60kXKtQA4limdt8mB+EeLuTPXzzRBfYsZ?=
 =?us-ascii?Q?R7bD5tbrlVPhSm0g2ESAepzbVoS57/r7pbuThc33Yk4WtmF4xSL1KELQNc7w?=
 =?us-ascii?Q?0dOUEE5/9dZzDj3zTUJn9fcQEHD2LrsJIFHPtYyb4y0t2dHoc45glnotv9WC?=
 =?us-ascii?Q?CzUjMBa/CzLpTadtA1c3f5tyE024qtwlH4TDOtPCZvvSktqYodxBRRSXQMih?=
 =?us-ascii?Q?UpnRRCkEsuofQCSIasobZCDSAg1XHuFAE3xOWFS/DZayuskj7NNNHmq4a4oF?=
 =?us-ascii?Q?CmSSxh+zoJdNPAFCqh2jdXmY6ScW/hngpEWTfKZ0RXstiWSIrLHQmD8RgsSg?=
 =?us-ascii?Q?JzTtBRo3E0RVIRrHJyU46MqOFEbdZCtnJn6uXwlqmX9MZL+lsCbhFM7Hc+ki?=
 =?us-ascii?Q?q9JRPTBD+uY4Hx9xj1g1P+8HoiqKkxMH1OvjvxyE1Qn7RQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VvcqMiBPobOc+dt3ZaoqP/m9Q2p++GACAUdKwhRQ+xCHeFc46Gctf4c+cyGx?=
 =?us-ascii?Q?x5+yqvxLTsvLM7wdMVCFWd2QGTQ9NEbFZD8mS8mFf1rLjXe0+lfJhKCbE39L?=
 =?us-ascii?Q?rm6Cp2UOfMXUHNJP/6GtpWAGt+x8YSuEd2W96CubDzAo2tlgQIuZ4dNheRpP?=
 =?us-ascii?Q?zJW6iP6SZhBDVLeViVc7BFIKzpSqixfNi6tCAGYuAkRNgyfaSMjDXlwELZGw?=
 =?us-ascii?Q?osKVq9C1xs70RdKPdPOf+DprWHSTCtcTrOfHEIokCeIXyz45hPouS05wtw3v?=
 =?us-ascii?Q?tYRI/FHFNMJqhThGmYNFKTyW7Xp3gaNGzIzORmtgNR9fjR1uB+78DI2GvX0X?=
 =?us-ascii?Q?3yy8sKsnb9ONQPryjzOENJd5ZUiEjMr5fKRDQc24dQftrWwyrQ14tj1B5EJw?=
 =?us-ascii?Q?epOg4ouBpsR+GtfePwouzKlN3eBqQsVYOk3sRVYxVhmcGR3MmkPQdsgBTWd+?=
 =?us-ascii?Q?bO9u5Uu6dPKhy5qMaozuRaxMIFivO0rRq3SOk67JAQeGWB8/e3urLwLFIQ7B?=
 =?us-ascii?Q?H5wmWmCjGKxf+hNP9xDFbZRGpG7aj7+KW/8XCq/JhuTksK1rLMkU9UTqwJ2+?=
 =?us-ascii?Q?8hsfyS8u6DSYBZcZiDNs1IzEqthLhfcDn6BAfWOJcm5cxeR4jxv4LWbph2ua?=
 =?us-ascii?Q?Z8Cv7FiYGdqQ8UBd/4oH5FtvMkkz1B/IEqU5BNA80Oyz+jiGqvysWuWizC3C?=
 =?us-ascii?Q?CK39YQx1kw2df/4mJb2MQomlzSurpyMvB8f5YhHlqoFBX3J8ZRDVTSzmwMmA?=
 =?us-ascii?Q?Rjz0K0GqHanLzCy3h5JdDkzu3L75YVBFQIT5IUoHy7sZvS0EYLS4FxyihbUy?=
 =?us-ascii?Q?+Dfa95FtTMSuXD7JhVNN9HBKiauuH+AolXOgpiGMR2AbT5NIyCN6CvcdSOcV?=
 =?us-ascii?Q?tj+n/pVJFe1oWi2v7CWs8Uu1mjFjplizD5HoD7OFZRktUhfiUXZ91f3XEt2R?=
 =?us-ascii?Q?4FJ//UTHYWBK45dXchqctEZRWpPKf3cXh34XVGye81TcL40x7yKKVxjX5Xfr?=
 =?us-ascii?Q?QdZUl6ew+Gomw9P65IsUdpnKrORe1Nv+mBZky2FM4mC/sv6JNayqZgzLuHfl?=
 =?us-ascii?Q?yeuS2ok8StZ7CBf/fG2F3xF26fNHwhu/B5LB9EFlvwvOnUyGbRKFCtcDJKnk?=
 =?us-ascii?Q?BlkU7LRVndP9X4XpMHtVNC5p7V1Ayc84jDk//c4ih0XlxmIpC2pGbuGD81K7?=
 =?us-ascii?Q?6ZGrEIqolRU7oLSMpYdj4JhME0oCJaJAFQeeU/Vs8qVJju735poyo6v0spR1?=
 =?us-ascii?Q?Lu++g9IAEya/2Cwc06PDDwlSfzh574DBxjjp+dF2XSBtKqvA6jJT/h9OCdXx?=
 =?us-ascii?Q?CY5sZKesUMbT2EAkO14uxdTW54Dxxiliqp3/Ci2XpZI6LHlSAW6xIZdUZDRX?=
 =?us-ascii?Q?WTd/fxVnYoc4vzi5kp+c1rL0FLWgHKVy3BxY0r3gedn0o1C2jePhYNj6sYyh?=
 =?us-ascii?Q?Z0kS3IsSe0sOYyWKJc+p9wFkmTuJsHNj7Q2vDaZsZroB4hHw12CYXKf0KNjw?=
 =?us-ascii?Q?mdJfAqvrgy2aSayyKWKgxRIFqNE2u0AqRQ8uwGCd8OjLG9mKUY/JIaKwAO/p?=
 =?us-ascii?Q?PtRtfOGyeAjJYi9xcNh0DMn8Nl+jrrc0cQVRF46m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ac04a1-1ea2-4084-37c1-08dced9b2eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 04:29:54.3452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OuqXGQ/9Go8TXpt9CB34rDB7A9M0eeQJe4omUcefD3DCQRc9ZvDsFByohWyTDISd/oEHrt8H7vxccvubhGAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, October 15, 2024 9:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to =
lib
>=20
> move backlight_read and backlight_write functions from kms_pm_backlight
> to library to re use in other tests.
>=20
> Signed-off-by: Santhosh Reddy Guddati
> <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 60
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h | 13 +++++++++++
>  2 files changed, 73 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index bb35d4b82..c9c0ca1d3 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7119,3 +7119,63 @@ void igt_reset_link_params(int drm_fd,
> igt_output_t *output)
>  	temp =3D drmModeGetConnector(drm_fd, output->config.connector-
> >connector_id);
>  	drmModeFreeConnector(temp);
>  }
> +
> +/**
> + * backlight_read:
> + * @result:		Pointer to store the result
> + * @fname:		Name of the file to read
> + * @context:	Pointer to the context structure
> + */

Now that this is a library function the naming should start with
Igt_backlight_read same comment for the read.

> +int backlight_read(int *result, const char *fname,
> +intel_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char dst[64];
> +	int r, e;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> INTEL_BACKLIGHT_PATH, context->path, fname)
> +			    < PATH_MAX);
> +	fd =3D open(full, O_RDONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	r =3D read(fd, dst, sizeof(dst));
> +	e =3D errno;
> +	close(fd);
> +
> +	if (r < 0)
> +		return -e;
> +
> +	errno =3D 0;
> +	*result =3D strtol(dst, NULL, 10);
> +	return errno;
> +}
> +
> +/**
> + * backlight_write:
> + * @value:		Value to write
> + * @fname:		Name of the file to write
> + * @context:	Pointer to the context structure
> + */
> +int backlight_write(int value, const char *fname,
> +intel_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char src[64];
> +	int len;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> INTEL_BACKLIGHT_PATH, context->path, fname)

Maybe add the path as a variable so that other may later on use it to=20
Read their own backlight path since this is not isolated just to intel_back=
light=20
Test

Regards,
Suraj Kandpal

> +		   < PATH_MAX);
> +	fd =3D open(full, O_WRONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	len =3D snprintf(src, sizeof(src), "%i", value);
> +	len =3D write(fd, src, len);
> +	close(fd);
> +
> +	if (len < 0)
> +		return len;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2b26d2bbf..90b911e4d
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -33,6 +33,7 @@
>  #include <stdint.h>
>  #include <stddef.h>
>  #include <assert.h>
> +#include <limits.h>
>=20
>  #include <xf86drmMode.h>
>=20
> @@ -513,6 +514,16 @@ typedef struct {
>  	uint16_t tile_h_size, tile_v_size;
>  } igt_tile_info_t;
>=20
> +#define INTEL_BACKLIGHT_PATH "/sys/class/backlight"
> +
> +/* Backlight context*/
> +typedef struct {
> +	int max;
> +	int old;
> +	igt_output_t *output;
> +	char path[PATH_MAX];
> +} intel_backlight_context_t;
> +
>  void igt_display_reset_outputs(igt_display_t *display);  void
> igt_display_require(igt_display_t *display, int drm_fd);  void
> igt_display_fini(igt_display_t *display); @@ -1253,5 +1264,7 @@ bool
> igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t
> *output  int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t
> *output);  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t
> *output);  void igt_reset_link_params(int drm_fd, igt_output_t *output);
> +int backlight_read(int *result, const char *fname,
> +intel_backlight_context_t *context); int backlight_write(int value,
> +const char *fname, intel_backlight_context_t *context);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

