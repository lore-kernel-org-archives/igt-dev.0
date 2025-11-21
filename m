Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226BCFA74F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84A10E2BA;
	Fri, 21 Nov 2025 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2E+FTqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0055110E2BA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763714401; x=1795250401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zgQJ98n1c7B1h1sDf7+mtITbr+7+WtrhjOCCCkVPnEw=;
 b=T2E+FTqj688L8p7p4iWtLzH2Hti+IQKp4FbQ9DWFG9Uk73A1iLLMOBLK
 sSI9ECyhgeLplvi+Dk0L8myGdlETAtPY+C2yxqRtWGL73g7tsgucggA99
 b8+uIHO3ctw/k8OUupwLR8YX+Yrubo7cOothXyVQvIRkNArQlYAr2CqD2
 O9Nv5aPibvZApEOFQcj9M7SiMvdr9WySye9MGYTdPRglGLxynqjaa9IqS
 gwfmsgybhxcMRftHa8YThVfkcyi5R6LjWP696pmLccVfjhY1Rwwx0bY1U
 Yu7wX3Mlb2bkiILoRIkloAmw3dp/r3GNZJTuaRWXrp15CwwO28FWOrRxY A==;
X-CSE-ConnectionGUID: gzbVP7qJQra8HwDggPxdcA==
X-CSE-MsgGUID: 1S/BZInEQBurkVBTcIpo9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65890611"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65890611"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:40:00 -0800
X-CSE-ConnectionGUID: +VVgtiFmQHWnyCQHOS+2Xw==
X-CSE-MsgGUID: PIetYclsTb2xZYD9Ia3hrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196772757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:40:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:40:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 00:40:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:39:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFErO9FoBfuLDsFiCB4kh3rTOWZ5TJ6Ax53/EKJW8GNjarslNKMyATCIeXVDNgyKG9OfCCKkYQYtYlhRtsyPOnYzMWI6+GIqB4EKsnSYRGhW9eASf8+VZN8EFQl6oxT0uAuQtnHQ2pm+NeYoodbm1rGLeyok09n+CoY5+lu7nI8e+L1ntlCHtQDF1zY97DnA7QgEqZwRX1kqC9CG1/S0xCSsku0fY7hHHnyr86dxyn8zQRsM/Bb6hov9LuX6IBT2F2rDELS2TmyKNfBfrBwoTgQxwAO0s86coFQMPnSrx4fRKFMP8hOZDEtsU8Js1m5exmBGXkpxZA+rj433ZtNU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imIL24zZgcl0ICZq9yH4YtKtsQA+QiAS5HCN8Zd+0Vk=;
 b=ZGIoehLO/9uEaWJfsHcfATGru/ey4UzpgetcIwbdKyus42veKysiaeduF7FXrWe4da05F/V92nVTzQUxJZNZbe5+5UkF+94RMyW1vnRKl9R0m7SuBRUUENVSARm38IYfchrebkPtrZoqYck+FHPUamgvae5FaRWENtfDEmC+0/phH4q30+d8F1uhOl370ydeQZstSDNItAnq98U+8+3ZHOJVSZYtRMAjJNa56fn18Z+L3unxtxPstwsBR5n1MC2lSVJnT092CrYJL68VlwwAJ9cEB/i7uw1o7lLIiJbd/BJlZ0jpw9Nq6+smZ0D9uAS3a77RGegaiE/ud9jxDfiT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB7127.namprd11.prod.outlook.com
 (2603:10b6:303:221::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 08:39:57 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:39:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 03/12] tests/kms_writeback: Validate supported
 formats
Thread-Topic: [PATCH i-g-t v3 03/12] tests/kms_writeback: Validate supported
 formats
Thread-Index: AQHcWqls+JFeYS/pbUehQNiSNjcMJrT8zq8A
Date: Fri, 21 Nov 2025 08:39:57 +0000
Message-ID: <DM3PPF208195D8D01AE1F1D4A0076A6FEACE3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-4-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-4-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: af4026a5-37e3-445a-549e-08de28d98d00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?uuW2I4NAtqXcwOyTUastbIjqPWjNYBLnloiGZeTYwXj/4S4ZKGMavfA1wHjs?=
 =?us-ascii?Q?+ZVEMnV8gZ+2qP3ZyU6mRlzH4efo6zQS7pzxpX7wVHZYVcqD9xLyyRKxJFvI?=
 =?us-ascii?Q?xglqLXWI2RdXhhVMZqHQ0au8WExoHh9op6p0iycqrEDFVYCtbj25tEo6a4sn?=
 =?us-ascii?Q?wfydXzuUDKK+PonibRsxvIUwRtK0tJwx1S/gd7On8aYaxNTZtwWRT8cylS7p?=
 =?us-ascii?Q?EgMwg+T+6/yIHxEkcquURXvp03U9akg6G50HFgWUIhS6BuemX6RWmCuk+Wdw?=
 =?us-ascii?Q?fxD8RS32ekagIuudzFjTyH908inxZs+XciRVQADYFHzXjzEE8IzD0ofGRumf?=
 =?us-ascii?Q?unaYbmRSdgQprary6JQxnHOCN3TLEETIO1Axd+5XW24+BSEkk0HoApAVknwx?=
 =?us-ascii?Q?f5fs4/KWRlu8zhz7HA4irm+KADLrD0/PzTXwQJHdjCY/hFAjhFtQWsDYEo4j?=
 =?us-ascii?Q?BJIFOAnqW6MQKElZFbIK1CMb6dwBMnujc4L/DLfT281XdKQYln+Ni6ngtM8J?=
 =?us-ascii?Q?l9BcEfeRHUfA0CnLGlX+wr2/Ocrbr4cjC9zzB43DJz6Iz790lPOyJuj+sjZI?=
 =?us-ascii?Q?K21S8wcN9Fe76JjzyZTjJIFXbZ34aanGlkB09WMew/Pei/Mo3H1rQMJNJbFQ?=
 =?us-ascii?Q?p9U6yEpTPwLYZbU8smp0mH7nmUJtqHnBYvZbqRVhhrduLwQvq/vNIVYWr4er?=
 =?us-ascii?Q?pFWIzKLA5FRUy89n1lk5lI0grNxbC2KiwzLP+80qTllGhQLwucBeZEaUhp8T?=
 =?us-ascii?Q?3ii9p2V8N0pcsa8TNcGuxQ9Y5LuAjWqTtTd7Aeii2im9zv6kzytoJ+8fkZhL?=
 =?us-ascii?Q?5HVn56sU2IMgn/4P2z2uF1AAuuVw6x1jKrvHYKSRdiipSVSHTAqqZ7w6F6b3?=
 =?us-ascii?Q?jn0lbZVECvBx9w2xFzCLWOFLMu2Rq3rzOxu4zSeTvuMTCsCLKzyo41kkl3zB?=
 =?us-ascii?Q?xwTOzr8BDz39m35NN2uunCX/LFnadt/YSODHS2HHFS95eESmtJm5c0KBSZ2p?=
 =?us-ascii?Q?Q8kwGjhU7AccOgb6tjfVE5UFCi3ReJDRRemO7sbV7X0tleEmZXnUxrheGIdj?=
 =?us-ascii?Q?WGshS4tlKN/EoMK0JCk8e8WsnmH1nwamY1l5QNKihJ7RoDhW9Ga8+AVsYulo?=
 =?us-ascii?Q?DYo4tBmNSQWkSxlZZxAePcrRIXSWmMQLiFy6ia43Kp+5cZA7MNRGH0Buhbv5?=
 =?us-ascii?Q?QP9NBGdgNlD6k9hTIcoaMSUHf681MN/hz+0kr/4faiG6yVzqZKnIRDO6evZ3?=
 =?us-ascii?Q?HA/5+SuGb92FQZr7F+Xcfjp6BWNEeOhkJ/2ozSwA2zknidPICMHGXFoIJaSK?=
 =?us-ascii?Q?zabqQyfEsm51rEdB7vU/r3/2jG5OLEW8HolQNlWzZMKscaLtMPmbY6LI0QuE?=
 =?us-ascii?Q?qMTWXCa9vEt58rc4jfoyNNxzN7UBZdSCoZcxBwBxjd2dLkvtFhqGz42WKdEF?=
 =?us-ascii?Q?lZm+qR/d9PWTEDyOHBQjO84e99n0dRm3py4e3v9U+3FUoRZ32OX4rO46HwRa?=
 =?us-ascii?Q?85tUX/UdLNnut/v+2FNjmc7f+xBL3Yq0LIuV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LXxMRkAg8BLDmY31apHudodXfJhrN5k4Wou8mE6NZ1g2i0NomcSu4xIuDI7j?=
 =?us-ascii?Q?PYqfEjEV48euYrOEw18fC9sRi68ewK0upIud5/US7O31wXSOyHB5CEWNtn7F?=
 =?us-ascii?Q?DGBLKk7rJWrPP4XMQ6FkjSDXHQy8MVqhZB+vxp19jEbLXNM/+9anZ1NZe7wc?=
 =?us-ascii?Q?97uzQmeddvnF7k8VVhOfpaMF73KFBZTQlmXGDEBA/ZLexVDPaS7/BkMutM2k?=
 =?us-ascii?Q?z06MiMh8R1+2h4aIjcahLJrOU+e6HI5zmVf31WLraJN2YgZTZDMggsN55v4C?=
 =?us-ascii?Q?bzCe20EMiWkexwx6LGBV9xJOcwgXfLBCLyGkxTMw6zxdgkUE2oF6Ix7krpe7?=
 =?us-ascii?Q?DUhgaY16u8x0vlDg4NIqeW2NZBJSDx42AWo3EZYgE8/9UFJlutlt9Fcxns2T?=
 =?us-ascii?Q?SijC0udn72VzCrkcv4CqFrhTO9ikOyPklImN/o/5l0A3JXkQyW9U5c2ffOXQ?=
 =?us-ascii?Q?dZ68EPSlceBz3mAsGxMSMifA9dpcxq+H/OO3sxUSKGAdkLfuI4ZQ6282XtAY?=
 =?us-ascii?Q?GqCVZ2Qz+kJb1JjnEsYB99F2a6vnub2S/QRKnbRRquBFyOxlXTkW0it18jaJ?=
 =?us-ascii?Q?7/FAcmtpVzMPwlGEqSHB5pAGl5NC6wFN+j+shpx00seAQ6mWGBZkszsiePcm?=
 =?us-ascii?Q?QARMLLpAfZb0Kgt3PiLb1nMFPoG0Ay4tzvsOwEBqrOilPwyQ+4FsIa2lbf++?=
 =?us-ascii?Q?A3PzG3T/Yb19Fu6PzgzVBT8Na5I1VKeQJJ32Rshnu3KcHq+GYC+RTmjocWHT?=
 =?us-ascii?Q?+6VVwUUc7XxWBzbsFzKzwBupbSvA4g5APWCuzGBZRE1BHAI9Xk8wY68ATAj0?=
 =?us-ascii?Q?alwUZx++AwOH+K6ZtJyuQfrMealmGXqjekcig5dUY3K6byLHvJUD9LM4pxEU?=
 =?us-ascii?Q?7LT6eWxQV0BQWk3NqbLEekZW3jy+BU+46UMQBNpNM7W3cXbhgGGDAAAi5kqh?=
 =?us-ascii?Q?daOIki44CrNC8Zxu3VYib1lHwD9rLL+pPF/Tc3EuMxlH7h0w/YqAJPOouebq?=
 =?us-ascii?Q?jUUg3oTTDQ9L4yeX8xSHVyi3l6G9vvHb67HMFyFlMVu88hT5LSMMvEQ5qQ41?=
 =?us-ascii?Q?pCHY2n6RljqfnWnHT1NqjWsTXXJVaZe4N5kbXI2iC8WyUYL0R5jsa8smSo6R?=
 =?us-ascii?Q?55HNEH1KnWS4QYRfHjBgkBXjnID7k6Iq7LYOCBa1O6zPOW+MQ62/96SGfAs6?=
 =?us-ascii?Q?TIk9cE6ZltdrxCjT8hbyirMcIYpG09KU1L8jhnR4Pz/gxqtJqnmSfWyoudZl?=
 =?us-ascii?Q?7Q1qxVvxwotKUxKL6q9Z90aKhviqh6p1fqBnWQEUjID24MO+gu2uV3SJL0H0?=
 =?us-ascii?Q?G1o+g8+ilrC/bknKbLs2OMRdTLF7wnCtzv9KQ0e6wkgtMD7bWs2hyKs20S1k?=
 =?us-ascii?Q?0306b8UoZWxaDUcZ94UuOXwO22IX60hMEKjRfx2EPrbCUnSd0W+5lTbTYI2J?=
 =?us-ascii?Q?iVO7NhhFzKmmxOya6uoi0SwkUzbkYBc3EFxykZBS+ycuWhBiEn1utLSJOU0E?=
 =?us-ascii?Q?DzxX+D19vUMq/R6JBA+WUNwDEyl4XylwdWHnAz2l3pp1SOW4eS3pH3t/Q4f/?=
 =?us-ascii?Q?YQRbjKlO+IMQNlSgZqKWrsCx760sN34KJFpt3nq4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4026a5-37e3-445a-549e-08de28d98d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 08:39:57.1288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxA4Bcu3kBugaIfqO9/GUecjXGCFxIX+GSYvEUwbcyFzmt80NgusBWAETAb4cL1UIBapJ9l77IsOT0W9N01KVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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


> Subject: [PATCH i-g-t v3 03/12] tests/kms_writeback: Validate supported
> formats
>=20
> Add logic to verify that provided formats are supported before proceeding=
 with
> test execution

Squash with patch where you introduce these formats.
Saying add support for XBGR support too.
Also I don't think we should be adding XBGR2101010 until we have a way to v=
erify crc properly

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> de0f67a58..e9173ea4a 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -299,7 +299,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>  	uint32_t *ptr;
>  	int64_t pixel_count, i;
>=20
> -	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 || fb-
> >drm_format =3D=3D DRM_FORMAT_XRGB2101010);
> +	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XRGB2101010 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR8888 ||
> +		   fb->drm_format =3D=3D DRM_FORMAT_XBGR2101010);
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(ptr);
> @@ -334,7 +337,8 @@ static void writeback_sequence(igt_output_t *output,
> igt_plane_t *plane,
>  	uint32_t clear_color =3D 0xffffffff;
>  	igt_crc_t cleared_crc, out_expected;
>=20
> -	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010)
> +	if (fourcc_color =3D=3D DRM_FORMAT_XRGB2101010 ||
> +	    fourcc_color =3D=3D DRM_FORMAT_XBGR2101010)
>  		in_fb_colors =3D in_fb_colors_10bits;
>  	else
>  		in_fb_colors =3D in_fb_colors_8bits;
> @@ -420,7 +424,12 @@ static void writeback_check_output(igt_output_t
> *output, igt_plane_t *plane,  static void do_single_commit(igt_output_t
> *output, igt_plane_t *plane, igt_fb_t *in_fb,
>  			      igt_fb_t *out_fb)
>  {
> -	uint32_t in_fb_color =3D 0xffff0000;
> +	uint32_t in_fb_color;
> +
> +	if (data.format =3D=3D DRM_FORMAT_XRGB8888 || data.format =3D=3D
> DRM_FORMAT_XBGR8888)
> +		in_fb_color =3D 0xffff0000;
> +	else
> +		in_fb_color =3D 0x3ff00000;
>=20
>  	fill_fb(in_fb, in_fb_color);
>=20
> --
> 2.43.0

