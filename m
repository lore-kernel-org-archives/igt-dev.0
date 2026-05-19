Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E23CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 07:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A52510E26E;
	Tue, 19 May 2026 07:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWFeExUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1610E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779176683; x=1810712683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V/vtiCVaFvFDBpp9cbtMbVW9iZxgn7D7gfMDqFofzMA=;
 b=ZWFeExUPoLgWqA45gbU9W3wuGyrusha5nMjbY79c0BREqdLU/WDmEE8T
 qJ1KdRHB4P1JqTbHj6FVz0RvwGnJ1SuC80wff+Gp7y6h57Gwt/2PeUO2S
 DsgmM0/gITXy+iEuOMeiU70JK8xXmakBdIATcOmPYeMNZYE+ng7deo0OR
 XxyShj/i934mKT/DTbXycKpdbangXmJ9so9xsNp9OeM/80c4iEXgnUiLu
 J56ffeB3KSNXIcdjxstdaTyYLWv3uPMvuQUrQSv2B3jV4kDcQgnxeV96B
 zpAVNnomy3Nm+Br0F+ZO0ZvOV9e+lneH3F4zL07POkyJnPjgm5czjt8UH g==;
X-CSE-ConnectionGUID: 4Fbn887yScuUIobqpFYLjQ==
X-CSE-MsgGUID: wYrg8dVlSJqmSHkLghZqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83661909"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83661909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 00:44:43 -0700
X-CSE-ConnectionGUID: SRhuAvyCSl6oCTdRroaBXg==
X-CSE-MsgGUID: oAKPm6sQTvOpLR+zxvY5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244687362"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 00:44:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 00:44:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 00:44:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 00:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtbR5JLRjzM8pdw1doxXVk1cbGh5RR1XzU5yvWPiadboeucIHc5gg1yOfXp70n9Rr7CmFNT7QGt3iPFA0FViaD3VDjIjypvQ7Md2ufcblnng8nLMHGddrlppdXmeeaBz9ttG8KFpJHys+3aVU0p3K2G2l7vtKdbJXdBAVcteAwOzRWhcb7oaPGsrswNMTaX4vxERkJO6JIl+9tAQRz+cSzAzM6MzgGOSiUJaQGLdqmadHIBqqhKCQJyRL67zKaOK3uUlvuZ7IHAY2gXzVHLvenuKjlUj1hSsDC4LWxh1v9QURI886Pqhf6mJHSyIX1N8UNXU/hGlys3zmw3NbUBa4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emiNki7Ajl21NEkRvVOWiwHL34Vc/7P6K90/ZPq9bIk=;
 b=SpiHu2r8v1zyRPkMi6tSy8plhKH4rUDDpKYqmVHtkmnmo0Qj3mGGTCNsu/IbX0SHh0NdhNwS+TxBwDdH7eWlfItA41eENaTtmbMdbdmjNWzbxjF1yk3iajnHml/klPqWEiOBZpbpmUG+8T85si/DBFHw5MlfBZagJvX8NsLDr+2GIyqi2aNJCur4k4BEkSqtgKXmDmB50egnd6nEir17wQ1/xnVm21VhjbjFfOiWgo9c3qE/FYuO3r2VXbiPeVUmw5twABmX7emKGbWzK8s9wDT7WQ+0b0Gxsl5xzM0H7LCIAoHXRR7Qw2kjn+OnzY1oOJxjigGZPTwyCioc79cSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS4PPFFCBF1B4C7.namprd11.prod.outlook.com (2603:10b6:f:fc02::62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:44:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 07:44:28 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Topic: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Index: AQHcx9yyIx+zRt8UeUqWctAWH2Sfz7YVIAtw
Date: Tue, 19 May 2026 07:44:28 +0000
Message-ID: <DM4PR11MB63122829F106339430D9815990002@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260409044855.191421-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260409044855.191421-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS4PPFFCBF1B4C7:EE_
x-ms-office365-filtering-correlation-id: 808ee868-7649-4ddb-0398-08deb57a7522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|11063799003|3023799003|18002099003|22082099003;
x-microsoft-antispam-message-info: tU2oIpEMgVSyex/ozhHr1igc/vLKIr0jpfQUO3IaUSB7FCK1tawx6S730XnNq0Wy1Id8opPEt7EtBpJd2SJfUNPUoA3ioc9dwvfXkve9Vl0n2Rlql5+09NlKNWPuWX+VeetgzhjaSi5BIgb69WKOmv+I1KZiD0ZVym0mlU6XzAMk9mrShmBuoifoxfAVNzSC4RZFgj2F9785Qq/8f8Av+HTLqgvFbl0fbmgapNIq7NrI5UZZ0hXBdWYTU+mWwOW304mJZ/ruxNiQ3xvlamAcpS3eKh0VVqgYThU2Y/dTNfO+ELvzGAuPzzBLeYFHq0+PXO3jUWtkRlA27DWTIqG8yLY5Wt5MELosMXfMaj/Yl2XoQ/rAv0eSw5Mr6AEYUdbmJIeC65tPhNUqlICbs8dRyOwdyOQT6lcXHJReBFdWCKD8qg+M/hiv0lgRqzNsQsmefL/3zSHRa/5v5/UKKrxpkl7qMFqgyLb8/ggDVjkYPEYrcIMZyU3M0MigOquwGOeQlTv8Y/n6m4+GbExvKfjYIDJHaOH2YujvcMyxjeaka6Jm7hD3mvtCEFpFTDpMDY4KkAxbdwOkZmgfqPgDoDAGNAIGAQ08Vo0wQvajuYZ5iVl54smiojdcSqdmZKZuGhOUD9ILiL7/+wgEFmDDwcqHQexuatU2UG+IM69msm/clZTtanL+lQx+R5QKKcaDI88wZOctuYplhi2hSzxvwapo6Ps3VWXmJysQ8Uv6Mw9jzRXEgb2J4AAnu15GNkhXD4by
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(11063799003)(3023799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EuskxrVJzEpLFKQGetnbQzkNCgls0QlDWJ5fu9q8jRTGY46Qy7CTczEonGdU?=
 =?us-ascii?Q?6ylyTfaGLx/Z9Oa+qYITEx/YYQsDj4g6KsN4jBh9Pw4Lt7WPDQr/hPA754bX?=
 =?us-ascii?Q?Blai0+ZnG4/z0J1VEsrj20Vrh+LgRdzRfUWWNcviQqkOkzdp1VllKKfi4p1J?=
 =?us-ascii?Q?aoaJER67dLIf9+75FlhqsxQFhmtXkpgeD4/g4J3UmgcLXPi2x2t+kCyNm6xA?=
 =?us-ascii?Q?YlY3PrG8S+WXaf2n6luHcZTlF9Tf7CBWAgwbnvRJRRIhqcADgYz/s8+4y7VI?=
 =?us-ascii?Q?//hWa6agK92qgHPBj+D2advB/i2w5XqQ6Y74Sr3Bqo/HK1Sv+oJ1Nmw8vJqm?=
 =?us-ascii?Q?Nxe1EHgloFkWeCPxi1rwkSMu+P939mfXf2xpJ135D1O0SbZlTjM0HVoZimM0?=
 =?us-ascii?Q?/TJc156BMZP3vOYtBnZcYaZF/0ad71M3wWm0qWqUsT1vgMXLy0CFAb6R6U96?=
 =?us-ascii?Q?+Twme0zDCCl/Gy5jgGhjSAqOBZ5EgIa2+QDN6uCH7kxmNjtjIc6fMXr3r4kI?=
 =?us-ascii?Q?8cwkvPv4rQKscIVTejd00JCXheMcwpQXDBHtT7WECMaCjWf01fCnProyxexV?=
 =?us-ascii?Q?8rfXV5cdD2DObVNIWwYQIKPItzZ94nUNhF3x5sdZIv+eudTlkuN8UEMz9Ea0?=
 =?us-ascii?Q?8NHbYwl4UEhOk9RXNrGAwpvCUUG+fG/5PBxNtQBKqqHAhr+gRZ/CGmcfUtkQ?=
 =?us-ascii?Q?smf02T6QoBgtJ2bXg/nMfyUzh9cRX7jiwsLrCdGyqB3CF7NkWKW3mjEt0Rav?=
 =?us-ascii?Q?FPTF5523UPCsKl8QZ+6r0fPJxpptJmvTPyrNp/5KRlUHJMgJu0kwE44brb5q?=
 =?us-ascii?Q?fGnwAHB9GtjiwfmjUANTHrqaSWexxUOGNG/inxuVh+N4a+Ro7QgiCbz9kDop?=
 =?us-ascii?Q?gXV/Tip+Hgu4Hz+DcWdDiisOQvA8Ir01Dd1P0CQYJ0YWCFn+QtlccVDPdk1a?=
 =?us-ascii?Q?jJh1lQ7Gdq/RS98ZfZ7NedZ4s3OMAf1M/1w3Gj7cZEik7neBH67Go+9sbDHT?=
 =?us-ascii?Q?7fOLz/nwfQ441Q/PXYYvSYatz1cMBw7ZSnnzARONuCnz1EYIqWmrw5Ovahmy?=
 =?us-ascii?Q?MT8vJRPTJNg5+4/P1XVXGu//3RNFmlc8kJfnswFAS7w8+QTmqz8azaJo9aeB?=
 =?us-ascii?Q?Czz5rMwJIjA0FyDEQ6J67xlpNtbJulDRKjtECD7CvMld03Tvm5DCBULKbLoJ?=
 =?us-ascii?Q?hGu9AFJRz/l58r9rseVKUgZ/Fwlv5osjfTQOkS8Y9hXSvQm3TGM3lBVWSfNh?=
 =?us-ascii?Q?1/9vzUk9cLpF/HVmhygaIWzCdFy7Eq/21NW8mjQlFfgD/qF/UQJngNMtwrrv?=
 =?us-ascii?Q?LQlZaqo+5z8fxAnqoNJOo54F++lNYgXco3e8OFn2s/JK6A+G80nqnntmcSgV?=
 =?us-ascii?Q?2nU5rRtWBZ/uffnY6fNMdxNGsus1QIittKaF6es1gSaYsMWTxGH/me0mOTz9?=
 =?us-ascii?Q?l4WB2AQUMRcdtz+MccgX6JpzpafoM46z3g7cpkOhodZ072hjQRKCVbN0Fdjb?=
 =?us-ascii?Q?Nz5UFsgXjCiJdPQoOPNEvfcUy1kwgfdDupbJsF49OADZzXRh2yZP+LVP6Yes?=
 =?us-ascii?Q?4OihWZJZyMvuEPn/HO8wQjtw2Ig4F7ryvaY66cQMUJFahIZqXvx/MI13r/Po?=
 =?us-ascii?Q?7NCQ5DkYl2K3WKMTExbngMxf1J+2FoC5rv0nn4nbRtZDJNBgpImIjS0CDF0A?=
 =?us-ascii?Q?A1B6vkllv+qxHlv5KRQNanxXj2DMp6nnoDM2MT5wKRnd4dBb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MR1wed5ChTWeQwCWlnd3DjzjK5mHkGZZSUy7TtrocuGKmq9ZOtHowOXeHaNm12g5c6Pog5DiyGk0DZLmc/WdRVbUhWnpg5Q5fM/3CzqnVr48WHhMS4SafS5Gwpr/4PE2pnvkaduAb/26Uaub/PB47VyK2W9wI9K4nmhcc/VAHzr17ERCjCHVIJIWai+1V0i3D7JI/SMwIeJ+4WP5vsHhGlfx+I7OzmAMVqVReHBvv6/lBzUhrAR7vwBcfZdp5DVglgnr6z/ZOCCqhTxRvDDSxq2Tl34kj8yROKloMZ6/1S2xzvj9hpN20Eg9Z2IwqU6qi71PODi1ltN5FYHnvVxwXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808ee868-7649-4ddb-0398-08deb57a7522
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 07:44:28.8795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDFr/s2wdXoh6/6WczOOd+4KTe5FYwYwtmErdVHu8O4PKp3Saa22UdH2FTJlM3MRPDwm1RfV+dBWIlVAt2ShPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFCBF1B4C7
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
> Sent: Thursday, April 9, 2026 10:19 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy
> Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor
> movement with rotation
>=20
> Add a new subtest to validate primary plane rotation 180 degree while mov=
ing
> the cursor across the screen.
>=20
> Use a triangular pattern fb which is easy to identify rotations on the pl=
ane. Use
> CRCs to verify the plane rotation with cursor movement doesn't cause arti=
facts
> on screen.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_rotation_crc.c | 193
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 193 insertions(+)
>=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> 4420053f1..4002eee55 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -68,6 +68,13 @@
>   * Description: This test intends to check for fence leaks exhaustively
>   */
>=20
> +/**
> + * SUBTEST: rotation-with-cursor-movement
> + * Description: This test draws a simple triangle on the primary plane, =
rotates
> the
> + *              plane by 180 degrees, and then moves a cursor through di=
fferent
> + *              screen positions.
> + */
> +
>  /**
>   * SUBTEST: primary-%s-tiled-reflect-x-%d
>   * Description: Test for %arg[1] & %arg[2] degree rotation on primary pl=
ane
> @@ -274,6 +281,81 @@ paint_squares(data_t *data, igt_rotation_t rotation,
>  	igt_put_cairo_ctx(cr);
>  }
>=20
> +static void paint_triangle(data_t *data, igt_rotation_t rotation,
> +			   struct igt_fb *fb, float o)
> +{
> +	cairo_t *cr;
> +	unsigned int w =3D fb->width;
> +	unsigned int h =3D fb->height;
> +	rgb_color_t color;
> +	int i;
> +	bool rotate_180 =3D (rotation & IGT_ROTATION_180);
> +
> +	cr =3D igt_get_cairo_ctx(data->gfx_fd, fb);
> +	set_color(&color, 0.0f, 0.0f, 0.0f);
> +	igt_paint_color(cr, 0, 0, w, h, RGB_COLOR(color));
> +
> +	/* Build a simple upward triangle using horizontal strips. */
> +	for (i =3D 0; i < 9; i++) {
> +		int strip_h =3D h / 14;
> +		int y =3D h / 8 + i * strip_h;
> +		int strip_w =3D (i + 1) * w / 14;
> +		int x =3D w / 2 - strip_w / 2;
> +
> +		if (rotate_180) {
> +			x =3D (int)w - (x + strip_w);
> +			y =3D (int)h - (y + strip_h);
> +		}
> +
> +		set_color(&color, o, 0.0f, 0.0f);
> +		igt_paint_color(cr, x, y,
> +				strip_w, strip_h,
> +				RGB_COLOR(color));
> +	}
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void collect_current_crc(data_t *data, igt_crc_t *crc) {
> +	if (is_amdgpu_device(data->gfx_fd))
> +		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +	else
> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, crc);
> +}
> +
> +struct cur_data {
> +	int x;
> +	int y;
> +};
> +
> +static void set_cursor_positions(const drmModeModeInfo *mode,
> +				 const struct igt_fb *cursor_fb,
> +				 struct cur_data positions[5])
> +{
> +	int cw =3D cursor_fb->width;
> +	int ch =3D cursor_fb->height;
> +	int edge_set =3D 16;
Replace 16 with a named constant or macro (e.g., CURSOR_EDGE_MARGIN) for cl=
arity.
> +	int x_min =3D edge_set;
> +	int y_min =3D edge_set;
> +	int x_max =3D mode->hdisplay - cw - edge_set;
> +	int y_max =3D mode->vdisplay - ch - edge_set;
> +
> +	x_max =3D max(x_max, x_min);
> +	y_max =3D max(y_max, y_min);
> +
> +	positions[0].x =3D x_min;
> +	positions[0].y =3D y_min;
> +	positions[1].x =3D x_max;
> +	positions[1].y =3D y_min;
> +	positions[2].x =3D x_min;
> +	positions[2].y =3D y_max;
> +	positions[3].x =3D x_max;
> +	positions[3].y =3D y_max;
> +	positions[4].x =3D (mode->hdisplay - cw) / 2;
> +	positions[4].y =3D (mode->vdisplay - ch) / 2; }
> +
>  static void remove_fbs(data_t *data)
>  {
>  	igt_remove_fb(data->gfx_fd, &data->fb); @@ -1160,6 +1242,109
> @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_=
t
> *crtc,
>  		igt_remove_fb(fd, &fb[i]);
>  }
>=20
> +static void test_rotation_with_cursor_movement(data_t *data, igt_crtc_t
> +*crtc) {
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	int tested =3D 0;
> +	int i;
> +
> +	igt_require(display->has_cursor_plane);
> +	igt_display_require_output(display);
> +
> +	for_each_connected_output(display, output) {
> +		igt_plane_t *primary, *cursor;
> +		struct igt_fb ref_fb, hw_fb, cursor_fb;
> +		drmModeModeInfo *mode;
> +		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_seq;
Maybe rename to hw_crc_sequential for clarity.
> +		struct cur_data cur_positions[5] =3D {};
> +
> +		mode =3D igt_output_get_mode(output);
> +		igt_assert_f(mode, "Failed to get mode for output %s\n",
> +igt_output_name(output));
> +
> +		igt_display_reset(display);
> +		igt_output_set_crtc(output, crtc);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +		cursor =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> +
Imho, We can query if it supports format and modifier for cursor:
if (!igt_plane_has_format_mod(cursor,
			      DRM_FORMAT_ARGB8888,
			      DRM_FORMAT_MOD_LINEAR))

> +		if (!igt_plane_has_prop(primary, IGT_PLANE_ROTATION) ||
> +		    !igt_plane_has_rotation(primary, IGT_ROTATION_180))
> +			continue;
> +
> +		prepare_crtc(data, output, crtc, primary, true);
> +
> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &ref_fb);
> +		paint_triangle(data, IGT_ROTATION_180, &ref_fb, 1.0f);
> +
> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &hw_fb);
> +		paint_triangle(data, IGT_ROTATION_0, &hw_fb, 1.0f);
> +
Cursor size is hardcoded to 64x64, hope its supported on all platforms, els=
e we might get invalid args.=20
If possible we can utilize plane_rotation_requirements function. =20
> +		igt_create_color_fb(data->gfx_fd, 64, 64,
> +				    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +				    1.0, 1.0, 1.0, &cursor_fb);
> +
> +		set_cursor_positions(mode, &cursor_fb, cur_positions);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(cur_positions); i++) {
> +			int x =3D cur_positions[i].x;
> +			int y =3D cur_positions[i].y;
> +
> +			/* Reference: SW-rotated triangle, no HW rotation. */
> +			igt_plane_set_fb(primary, &ref_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &ref_crc);
> +
> +			/* HW path: unrotated triangle with HW 180 rotation.
> */
> +			igt_plane_set_fb(primary, &hw_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &hw_crc_atomic);
> +			igt_assert_crc_equal(&ref_crc, &hw_crc_atomic);
> +
> +			/*
> +			 * move cursor first with no rotation, then
> +			 * enable primary rotation while cursor remains active.
> +			 */
> +			igt_plane_set_fb(primary, &hw_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &hw_crc_seq);
> +			igt_assert_crc_equal(&ref_crc, &hw_crc_seq);
> +
> +			igt_assert_crc_equal(&hw_crc_atomic, &hw_crc_seq);
> +		}
> +
> +		igt_plane_set_fb(cursor, NULL);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_remove_fb(data->gfx_fd, &cursor_fb);
> +		igt_remove_fb(data->gfx_fd, &ref_fb);
> +		igt_remove_fb(data->gfx_fd, &hw_fb);
> +		cleanup_crtc(data);
> +		tested++;
> +	}
> +
> +	igt_require_f(tested,
> +		      "No connected output can be tested on first CRTC %s.\n",
> +		      igt_crtc_name(crtc));
> +}
> +
>  static const char *plane_test_str(unsigned plane)  {
>  	switch (plane) {
> @@ -1359,6 +1544,14 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		test_multi_plane_rotation(&data, crtc);
>  	}
>=20
> +	igt_describe("Rotation test on primary plane with concurrent cursor
> movement");
> +	igt_subtest_f("rotation-with-cursor-movement") {
> +		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> +
The test currently runs only on the first CRTC. Consider iterating across a=
ll CRTCs for broader coverage, or clarify whether testing on a single CRTC =
is sufficient.
> +		cleanup_crtc(&data);
> +		test_rotation_with_cursor_movement(&data, crtc);
> +	}
> +
>  	/*
>  	 * exhaust-fences should be last test, if it fails we may OOM in
>  	 * the following subtests otherwise.
> --
> 2.34.1

