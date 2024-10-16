Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF7D2069D
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 04:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B210E65A;
	Wed, 16 Oct 2024 04:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGubdA8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DD610E087
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 04:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729053094; x=1760589094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LnxCDM4Y2jJcmX2RVemf4Bb8cwmoLZEHuAwIVvPxpDA=;
 b=HGubdA8skxQwl2ewwqo9pu+BB3a1rko29Kd6DXMEQt1A2/BcKBUudQK4
 hghYf5mq/KBZW3SwFBOY+hz+FLa0seWjEwp6qIzT5WoZRYud9WOJhqtoU
 yaWv0c07e+HiZk+JyaCiqd0GzFqHbedqLEuC8ko2B7fSnWXnnj7E/wewD
 xtFrZ4h+fnskObiK1Png/TCzniuruK9AWOTh1kcHAmqt6psiY+gqwpzl+
 rnMWe6tO4lS3ET8p1GcrwfGyXoOeQkeSyGJ1UMGGeSrXnkqylAVRZDCKU
 XpDqOBAvYLVzdEzEPHUr0QaR7eCLLhTQ6uGW/TTY/4SQVn+V6SYzeTNcN w==;
X-CSE-ConnectionGUID: R0SK7fzlQMWns/5vQCivpA==
X-CSE-MsgGUID: E9zySz3fQomYZNxQV07VZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28436796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28436796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:31:34 -0700
X-CSE-ConnectionGUID: lu+TYaknQpiZjUfCWcvygA==
X-CSE-MsgGUID: qMmkaQOjSjaC+ztdY8rL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="83182833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:31:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:31:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:31:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:31:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDiUJ5kalomiEUyr0EBubB8O/9GS3MoYbfUO9xE9xd+32H6yrE8GoK/BPvWxUXAOadAmtWTLKNCUdqYSZPu2e2tbFQld9UwHLvk8DMQanz/nV7oEcSDi/BkhszwQXRYxleXKb3maRcbMzxdK4dGgUGCplq1KW6I/Wu+PrXwzBJVnABsasRAa5gr5bdeZSCQDWBDnG7sy7oZ5YQjaRDFmuLjR2xNJssDU1mDXeBOf1n3CqVDhiO0Y4bdx+Izh8xPrn93Xp9JHzWkpGh5Yg690rxtvZk5VQecm7kkxvKx2e/6moQ6zHUsk+HEYvBkrjKqJ9UfK41Sr5NSCTyZt0oygDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eTdMcmRhDCqb/xaBYkxL0WkrRymXNQxzCtLyqKDBBo=;
 b=Uh4MjFZak7oOzoQrq1Nzn22lRyTarkog+CtV2H0G2JRjAFvvfzhPaArQTcrOPemaT+Jbk71wJ1hSX5QgDoujpJDsH2wx87xOxjKl12QNlfqOVT5gZyLyYKI4xA/mxG6HNtg0KiBHG/nyZ12tTyDIscN6hbGyY9s+YPAG0Smm3tyy7OjZMPy5U+N6+EcsyPdRWYXUDreG0nh8a8pJR6Nr1SfsgbccDZql9g/rWTX2KJMBbBdr6ll7yaF21b7sf9uOG20ylhshh1LunySq/mjucUbS8G29AvIRnBHRnwFiQYe3/aq8Mhp9iWJhEbWUaXo9Xh/YrXukWZKSDm0fob+dFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:31:25 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:31:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to
 lib
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to
 lib
Thread-Index: AQHbHx7qzqqykAZBq0OE/mCVJ0b0I7KIyhag
Date: Wed, 16 Oct 2024 04:31:25 +0000
Message-ID: <SN7PR11MB67503FB9D9661AE505190025E3462@SN7PR11MB6750.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH0PR11MB4807:EE_
x-ms-office365-filtering-correlation-id: 4fea7c95-2f3f-41bb-9c89-08dced9b654d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?N8lk+xIXDShpP2GEjeKwSwrsdXCi3xCCiBsnKch/8OjEzU6vaf0MXUJ99Tjb?=
 =?us-ascii?Q?zaCfpxFa/H7cJUsNo9zf5O0xt4DHJFCeZLJWyFolZZMymZmA215Ws4XvZxp+?=
 =?us-ascii?Q?oQmGIhzz2hjGJT2styNbBVx9cX3M8R3F18dypDi8MowA4MIH2Fl6c9m23c+7?=
 =?us-ascii?Q?BgdNl4APNUmcOwC9ZPT7HFLygLWBOBWGROZRcmfeoFvfHq/opcIuPFUNdaVN?=
 =?us-ascii?Q?xBn+LfNxNPMunnpzAvSdS3TXffDsjpJ4qOW6d/aVT+6g8VMMQTrz+vmH9Cxz?=
 =?us-ascii?Q?zZZQNbLIhqBqd9fgA7ubIGzdB53zWMZIlDIPJ4HCUmAvaV25deQW+jkAnaBd?=
 =?us-ascii?Q?0OpUlccNtLp+DJbS4sYiT3x7Rh72YLraQ+IHhNW8Yj5rEXedQ0rBufXQhjd2?=
 =?us-ascii?Q?dBoBo/uvbhaZDNpG7nS/dlkVcqaRso7jRn5goDllfSiUohXzbK365oikzKkI?=
 =?us-ascii?Q?nwXCFNK+l9j1DI83Q7UQKpp52p7JpayGdPBjP0fQbQ42pqY+f2SgLZaFBW71?=
 =?us-ascii?Q?aBPKs2hj/rwbEl7wgn97TN4GVld4Kq0vKrN16x7NIaGSc+W5h6sDKbtyP5z0?=
 =?us-ascii?Q?Xey4rQjIa1667tRh6A3Ew3H/897nz+BhEGAvYSWzUWp+GRF3cizAwMZ0tz0H?=
 =?us-ascii?Q?DgLLOgaPVReKbTHuNvXi+Hze+p/F8XngZWSN6gXeNBB+N9VJ6xu4KS5sVTDL?=
 =?us-ascii?Q?0SwEAHX1Ha8j7yicuIIyMZ/XInoLrNvaW9RGfwuYPj0jCf8YkV7AEsE2EFeh?=
 =?us-ascii?Q?IDNdkvtJtTpS5RPmgJnF4Th14fTXF0cYI4rgAKM49Ft6mZrLIowuyLUqNBdl?=
 =?us-ascii?Q?O/91KRFXa+o0WxcRyjGUDM1imDTeZar+gdS8MSIy1jB/+Xh+S/0Ox0WhAd0L?=
 =?us-ascii?Q?jIa9brsv2ecp0TdGdmYi0imGZz2G+EfOn5/S0yybLDJAFPaRAA0YvEA/Ab1O?=
 =?us-ascii?Q?+iNcE1I5kxAWCSpepEFceDM9REHUCIWVipYSq2U3o7wsl6fsaQZXZm6eFwno?=
 =?us-ascii?Q?vcd5CPg76HEcGHpxojdO2fQydSrgB1Tjf41zCsWbP7UljbNDp9D3bCT4uhCI?=
 =?us-ascii?Q?gZoUMU/5NoRdsdCbFh0wjxI+NB7LkSHPWXttLSnHbo0y0CpfMaMG3X4lPoV1?=
 =?us-ascii?Q?sTcmVMzR7kBDucAg8ZRerZ6BORx1ZBdRdDwOGMcwytm29N+LWIGb3ZUpLROf?=
 =?us-ascii?Q?bvPvqkV3mVJni3tkW5AkYWjt2xLlNC7H3+3+zejMsXXASwr7Rg6Vo8/FGmPU?=
 =?us-ascii?Q?tJHaqI5pjVNC1cwOs7AEoxyCOUcF67Jw88Y5nnoj9Gm3uYxLP1G0V61LA9Ty?=
 =?us-ascii?Q?cK140f3T6Dm/ne8OGnkNiBoYfFvyXbUbD6a3WipINBzkWw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KMvXdp8lVAZRHmTp8YmT20RY4cuEKnQScvoirWFKlRMA7TQBF09KN3bY5+yf?=
 =?us-ascii?Q?PwffjFkFyZq4FfzhD319EhJQgSy0EI0EjPeSwewh96qJjl+g+D+B44vF6rkY?=
 =?us-ascii?Q?xgtom5FuwKq3+OARVg4B3AkiUOdQzBLz98CELa+8WNKfCp/Bqij94930uH04?=
 =?us-ascii?Q?vk6Yyii8BVYPGT2jNS+V3gURRCVzHsr12uwSjn3yXu+tT14HsKxboQM7YC8Z?=
 =?us-ascii?Q?DDYuXvqukncDBQv7SKQYjaYvktUJZYnWuStJDQHgIIDU41PAy7EJkqtnVw3s?=
 =?us-ascii?Q?mESilcbNtzjPNTQm/dlgDl3BfMASaL2eus8AI1UPrkiHCafqkOXPhUh4NchL?=
 =?us-ascii?Q?Xv26hO+yGvCbAaG4epIgVJhu4u/Rry59ARj7P6k0+YgRsiwU7DWVS+UlfDBX?=
 =?us-ascii?Q?8NrZgB5UwXCPNYVSSIi/5LosLDg93PaKM6mJ6xAFRUACSmwn/gRql7xiznYQ?=
 =?us-ascii?Q?v1rE7nOP81G0JJs0reePVhiNUe3Yp593C7z8CJTIwPk9Hp7EuRc1Tjefc7fu?=
 =?us-ascii?Q?qXaVUc/9E10b+8PhjwDm1sFz1oRwJyaueOCrPo5WV+jyKEJAxgS6rNdGWmWN?=
 =?us-ascii?Q?FRmNU495zTEigF/D7Tyu1mBZTfCtjVqPrVAoxFpUeofs7aezifvB31Sd4dE/?=
 =?us-ascii?Q?TnL+1/35MEkDaw8LWDsrE5/On5PeA/QCCxVppxB3nuwOBgkywaniKIBmT13z?=
 =?us-ascii?Q?pk11t5sgc8DZCzcXgQptRfLcRR81rPg3xWntgNVhoccKXy2axbNtex2iGXnA?=
 =?us-ascii?Q?IKGQbxe6UTNxGFX3FeyJKvXHF8QTjb6tR5Fp01FrmPgDC6+bFINWnT/RCtpx?=
 =?us-ascii?Q?ZAQWBBjTvy72Ku2SnZwL6beDCuVNZD+5E4yHSdpo8HqjBLtpEZiUnSaPClLW?=
 =?us-ascii?Q?YfAVJnyVrZ5x9lmUD2nLx4NuDU/AMqWj1aydSN+wHcfHWoDhJqEoPiCXB/i3?=
 =?us-ascii?Q?25xOggTjrtVeBJh95ikUUXtdMEdqhAS6KuVgLjDYeCIJ1dW/lu1gn1WKmw/A?=
 =?us-ascii?Q?JjfI2nFxVz5mSJHz0h4ay8vXwQEceBV2udY0v+Dm02c/e89+5DB2maF9zkou?=
 =?us-ascii?Q?OpHnJfSKdC93kw8XQ+uBnNNjuWGBmvyX2zBmofFkFr3pxKC1SqjO4lKHf1Hw?=
 =?us-ascii?Q?HaqilturgGj+0YeeZw7YOmUx/tXZe6npXbc8lj5HO8I1iqc6F4B3GHhugkDu?=
 =?us-ascii?Q?SHlmyRpm3JD4RbOS8ja801fJvC2KcX4emGb/041x5/NsJfN/qo5O2Ry3XX/E?=
 =?us-ascii?Q?LvCWus37OevtV4KguBPu10H4P55q6gFnDEqnEKv2pGBSSRk+51SUb5J1aR9f?=
 =?us-ascii?Q?8JaxO9QtU484vP1nFFMKQ43RvZ389IlpC1sD9vKvXrJCeAe20nHlwwdO4Nyw?=
 =?us-ascii?Q?lNXYxVP6xSx8Ko+UHGgq4hwGeIw11Own7YRAUEPupxKwRg6OQBOQef97vXc0?=
 =?us-ascii?Q?UZHOErgIKU3LXVZLb4+WKka+jIFIKp7vwhv2voNxzBtu66a2b4GesGRhLA0a?=
 =?us-ascii?Q?B8rTaQPQo9tYY4Ip5dDhrybw/hgnuOxGgqbDNI48Z0k5RtOsL1h1Sxny2KJF?=
 =?us-ascii?Q?MOrdUsxexpo3tSlVyD7vmVO7AJyxcZbtAHIj8BVp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fea7c95-2f3f-41bb-9c89-08dced9b654d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 04:31:25.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6glG2oH/ASeNtGYYlsU4FNdcev2vCjaPZozTV7gbloq16maYp/CM78GKa3fHkMWen+hEDI2S6xE6pzOsUSU99w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

Also lets not add "," in subject line read and write to lib

Regards,
Suraj Kandpal

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

