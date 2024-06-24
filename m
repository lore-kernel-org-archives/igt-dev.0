Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB1FC2D0D1
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 18:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC6E10E265;
	Mon, 24 Jun 2024 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiVXdDs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91C910E265
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719252023; x=1750788023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3INt82Fgbt2qIZOTKUTRdgK0JngVT1G5PbiCkSwHjNU=;
 b=UiVXdDs/puaUXNsTR2pjj/31868NYKg2+4xrBDv7oQ1C/GadVeCMEbhG
 OsukFbgDzQGIr5dhwrBp/yy1B2G+a2eo7NUZwo6crx4Sg3jNSuncU1XND
 cwkTkZg2TH92AuDuz84AWj4awfPDHwFhGA33gmLy5c9ZjhMBnDDeflQSG
 l3EQzzLyfOLZC3UQQZ7jcC4aReakkNX4NQvZWEiZpVi9kftG9ppwg7XSC
 XA4lBFuCNXA2i/ypryHvTwksFKnO/MJjiPoZoSja3reDZ96C5qyv6mHVL
 CJd+VKaLeLMDkHSaIAyWjZzsWrJqvCe5pPA07lARgb0PjfhFFqKBEu0bN g==;
X-CSE-ConnectionGUID: X8WRjayfQ8SHXe2IR4zF3A==
X-CSE-MsgGUID: D0yTPzWyTgi9nsjkQJYSUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20119287"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="20119287"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:00:19 -0700
X-CSE-ConnectionGUID: rluB2oDsTOaKLaG1dCgFmg==
X-CSE-MsgGUID: UBSnMwa4QfqoNgudPE6+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="74597798"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 11:00:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 11:00:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 11:00:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 11:00:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 11:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9kurAL6eQzVa/qh6e3e4XBrAX/0O0Zqg7KOG7NqOSClsuINSL1QYJJtnCyVuk/Lv/Y5OpHNagWwZUTFr7jqzNfTrOvaJBvkfreB67inavANgJvJDRVj6KezYiEgahC8p4+PzfRAdpxLh9RXDPxWWAcNQsmoBwi9X1MuA28j3WjkMBkL/BWc4oht/I3Qr5uKn1vgSzktOPQKUrSR5aT4nvudil3Byy4GqcaBxvIckwQ8GciufKV5AeExM8RVeTPqknFjIROXrD2q/Qff0We4s7QmHu9vdPUXtAIxeDE0OUrHAp6bfKK2yTeA0MTsQVaut20HCvBu3H6WBnB08lGoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAvjApqTJD1FLBg3gIU+0Q/Alm+sLr6Iuvogu088/wM=;
 b=IqBXLV3eSFk+/2VVokUx1LB8KJfi2P86A/yGFTQSJZOZly1S/fmaeO6XrozjwEqGPku7vQ1B+gzF2cHjyPqnZ4Nh01/5AanSNjT+B7pp5ll6mzsTZgiK5UlT7UGcFRHwy0NhUqCj2mLm7yGTvi0actWTVCFasYR9WkN3KBuD9MZ5kOnVGWipLi5WNLpCHcJAjuq9OfeGNNN8bpxDtsytjXn3rQ0DfC5zHnS/lPrbka69NtZR6KirOj6W0gjIDYqtuazHhNwdSufMOAoBo0WKM6GxpSSETBOnCljtfiHgtJ2QwsjplEFxne+VQRRtm/4AglZhufOutqHGJzRLEqriIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Mon, 24 Jun 2024 18:00:15 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 18:00:14 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
Thread-Topic: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
Thread-Index: AQHaxknkwkAMzoMoCkqbqQ75q0T/jrHXM/cg
Date: Mon, 24 Jun 2024 18:00:14 +0000
Message-ID: <DM4PR11MB6312DD541E91C4E60C8DA53590D42@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240624151028.205562-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240624151028.205562-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA2PR11MB5050:EE_
x-ms-office365-filtering-correlation-id: 138aba6c-641f-4c7b-6bb4-08dc94777fff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?MZH20SGAL4J5fbcEmBdNCqA2b0OIGZs7pPC/Ergh0DppwtQiNyChYBSS6b8o?=
 =?us-ascii?Q?tcW96iB55Y1ivSDdZSB9Z8BG5hJs5Rj0srMFi29hxNJLhaLRjGIM85kvRbhF?=
 =?us-ascii?Q?68WhNmXKoAq7JnPi5vrO4nhcAnqN2LDi7VsVCFJdwiU3F6Xm4iGbiXYqN+zV?=
 =?us-ascii?Q?1HdhKlEFT/iKoFX9uwZjh5jLFqe+6mESSUrpYmVmi+pR05NipGEwPqV+CG+B?=
 =?us-ascii?Q?x0DrH/Jfh232v4x4xOyEm+bdcz4kxvn2ohLT0XQ9rq0wQxgDGGjfkJRHzKjx?=
 =?us-ascii?Q?PdDxeI1VSLCGYZwqlwqMvAIW+vkOg/DTjVLGDzy6I32AYOIgBPHeeAZO+WEs?=
 =?us-ascii?Q?J5aOT0XQwBllErZRxDUfunl3zbmHNKjmm8efIEZPO51eNlOlVeAmz/aWiG4U?=
 =?us-ascii?Q?l4+gECbCGQ587xOCAW7Tt8sXbo6BfIT7G3OpneXvQxBw+nzjzaaytrm4+lXk?=
 =?us-ascii?Q?Cl2s/cXd3gxtA1zwK0HZRCiJTlnB3OWHp0ZgzdJruQfG1JsRPAxLG7FPsFhL?=
 =?us-ascii?Q?tqAlTU7r/V5LiTEa7wwrYbA5cr600ova2Pt5opFavPc6AZBlpnkeZmeONUJK?=
 =?us-ascii?Q?w2h9KBOGQdT6OOjWke05b5OhV4iPmxec2T4ZeKCpEPsSv9qvYguEsBQY7kJR?=
 =?us-ascii?Q?Oyoy6Rzb03+3xsBGGZ/J+4b3IUMymga5vpP95Q5ge2RNLdHWpQiJzqjKtmNm?=
 =?us-ascii?Q?EdV61/Br3O+kKqGKP2wLkQm4+iH/+ki8ex09tMGwPFMHxk5yhqPxNfH9o0Cj?=
 =?us-ascii?Q?p53fpg911MZADAx0OS0TieVEesooMtPEG1cJiBUPQBhOvhHTiRl/B8TaPABc?=
 =?us-ascii?Q?P3HtxIVPpdVSPESbvpSVqVefF+MQzoox7IVeFYCd+0CL5qJwn0H11al7cznI?=
 =?us-ascii?Q?TrOFvz5JX9VHtdFrlAs4FyNtvuRzXGcdNTVqpOGliku/Y6VZiqmUnSNAqqP4?=
 =?us-ascii?Q?Vj7keFd/wRwA11eTYzw/H7H8wUFA4yejQSgBJMmnzxUk5uG8i7/a9nmZrTJX?=
 =?us-ascii?Q?aAjJ/0CKY6ogkickV6vRqaxrGeChrlW6IqLFZwozOKWjVnX7NK3dZRvksSRs?=
 =?us-ascii?Q?sigPbnrfD14+1Y3wox5OYrBilwchOGkUvp65y2U4iqeccNFckZqZJ1XB5pSq?=
 =?us-ascii?Q?u0ttWq3dbLldY/bLxgONPcbp4zPjLrgoiJRNJQszAslpI+6IQR2qKz6N8ZII?=
 =?us-ascii?Q?iJ7AmPbbetyGv72LJ4CA8th0nomOSV8u7u7JQu571+cQ0P9U4FMLMwAYRCAn?=
 =?us-ascii?Q?VeOJGSNzVxABkS/EQluIBAx/TNwnmSjzc0ZqJCFm5GVvtA/SHxubq++ymdyx?=
 =?us-ascii?Q?1aX/I2ubblXJ1/IPGU1LsRP8HqYDxgcS+B3OVHIkxwmWX7pPdEmjtN4BHRdC?=
 =?us-ascii?Q?mBHLEno=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NcVRf+Bmd27izCED6du30r6BoDK86+X1X4xnvZQPw/1JsRqmL7lFibrQ/i/r?=
 =?us-ascii?Q?a7KacZJ+wzlQslhYmlnDKUrsE2+bSmiPOiBzQ6hRHg1tqmgb3DXzI647S6kJ?=
 =?us-ascii?Q?VNdYiREFhWQ8O9abTw1lxKBkE64HkLClHaKegQjJAttgZd9FM2EzBjUYj7Yh?=
 =?us-ascii?Q?C0CI9VoIWF4SWgfVhUjgeafeoXFrt5DlfzvjcwprIwEISxJnamEPegfySxuA?=
 =?us-ascii?Q?MpB7qYkMdT+rMtNe0+61lmahQxIPY3ImCuBbXehE/XiiLCa4u19TXcRd6TbE?=
 =?us-ascii?Q?Jv/EaF0fOhpxpi8YtVn3VJ1WbEHlU2OVpPIOGdcEI9vewIHG3jv3FTnWUwP3?=
 =?us-ascii?Q?41dRFAG0h1jnEZylANQJfyGa1M+XVP9cdkqxFzi37quc8dp2MtRgpuSR+VwZ?=
 =?us-ascii?Q?XI/WZKBYu2KpwWMvzHdRh9BjmkOfufcyTHilEGOTUmYpxEs1XAb57G1838tC?=
 =?us-ascii?Q?nAuTXdEFU6dUTXTvjs4fQB2k/L36HOPw3vS1Dv4sLuG8Kk8q0oDjn9BSJ3HB?=
 =?us-ascii?Q?+ZriEFI+ypwyU0rOrTLOTmJOzFUDPU3GLwzc+MB6iCKSVLOG9JM/UvAahpU+?=
 =?us-ascii?Q?GIXY0FOmL8Zqy3J2Ge8v/GOBj5gBBrcdJxmmr+pTn2Bp2ob32n3ejdsjv7SZ?=
 =?us-ascii?Q?AxXM408XRcV4YkhKdXrV84nOZ3jFj7GSdNfbkzgs+OJKfJt4Dww4wKbyth3q?=
 =?us-ascii?Q?9UQTT/Ag5Z85g1cUY7sx7tcoth3gMsg9NJzDn305v0Z46/CoHuTToVUK3hiE?=
 =?us-ascii?Q?wIC4NY7hK+whqyswip/mmVVy0C/P7NvB+qFx6C3PXtrOWH9JMrBiyIyTwKlm?=
 =?us-ascii?Q?5UTbSCvG3BbYgPA9bM81RNLb/B31sm4NXGSkvu79ySieABe0Wxe+Zq7AhjWt?=
 =?us-ascii?Q?bmz7O2U1H2yJOKAhAEGLKjCgxYA7rjI5dixpxmy8DGth4pylrZtdf5elmUJM?=
 =?us-ascii?Q?cXFV5Uk8p2fAwHfbMK02n4ruNA6W5b6Y+nY6OEG374xt8qqlgUjwt2Or/e4A?=
 =?us-ascii?Q?W5LhSHU/oRiaIYoyLTD8if57ok6E8uIAVdelMDK1W0bHZVEQ5HdFrry5AOF6?=
 =?us-ascii?Q?7eQbs8oEAEE1eX2rRaiwTxb4p8xAh+q1XBYbD8owyoZ72ctJsptgKuBGPeGK?=
 =?us-ascii?Q?GZt20+xiLNpPYsbpzYi4EGmrV2agAazMljtxfzwLV3W5Wx1k3Aran4cdB46U?=
 =?us-ascii?Q?8FP/T/kKZQtEu1y9m2VRSts3vjK/bR7gvJwtvk7QLNGHG4mhJWD1D/wUPlQH?=
 =?us-ascii?Q?3rLGDsNfKbDo7aB8HXMEOZ8YW32mM1EHZPXMM5Wc2DTUbqYdId9sLWta5hap?=
 =?us-ascii?Q?dtX0YktVZpT73ceu0JwOuhzGuIAmLn3hfc2riiz0CNRd8yqNRQgme6esOzzs?=
 =?us-ascii?Q?OWsnw4ra5+dbW2okQ/gOlCd3qx8Zex5dfrO/WX1YXj/KRTaD8LA+7GDYa50F?=
 =?us-ascii?Q?pkLoz5sEiv4dBsIDVtEaDo8l6mMRz6rrwVb9vDjPE2yWagOho8N/+IYHjSri?=
 =?us-ascii?Q?i3d6nRg5uWSundl/bAaDige7+gthgzeL5Ognf6LW+JNW76rbIGEkucqA2X9b?=
 =?us-ascii?Q?qLadF+quTPYC1gjr6wI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138aba6c-641f-4c7b-6bb4-08dc94777fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 18:00:14.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3isQ9SO+xcv1lnoVadXsElNrAwtZw9kNSzIPArO1A3j8PR0yyZBAp/O8mWWT9UFxAHiwQiSGWqcYjS3f3RM2Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, June 24, 2024 8:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
>=20
> While printing the DRM mode, align the style with the Kernel logs, so tha=
t it would
> be easy to compare & debug.
>=20
> Example:
>  Old:- 2880x1800 60 2880 2928 2960 3040 1800 1803 1809 1906 0xa 0x48
> 347710
>  New:- "2880x1800": 60 347710 2880 2928 2960 3040 1800 1803 1809 1906
> 0x48 0xa
>=20
2880x1800 : Is better than using " I think.=20

BR=20
Jeevan B
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2e6f44e3c..1c096ec5b 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo
> *mode)
>  	const char *stereo =3D mode_stereo_name(mode);
>  	const char *aspect =3D mode_picture_aspect_name(mode);
>=20
> -	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x
> %d%s%s%s%s%s%s\n",
> -		 mode->name, mode->vrefresh,
> +	igt_info("  \"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x
> %s%s%s%s%s%s\n",
> +		 mode->name, mode->vrefresh, mode->clock,
>  		 mode->hdisplay, mode->hsync_start,
>  		 mode->hsync_end, mode->htotal,
>  		 mode->vdisplay, mode->vsync_start,
>  		 mode->vsync_end, mode->vtotal,
> -		 mode->flags, mode->type, mode->clock,
> +		 mode->type, mode->flags,
>  		 stereo ? " (3D:" : "",
>  		 stereo ? stereo : "", stereo ? ")" : "",
>  		 aspect ? " (PAR:" : "",
> --
> 2.43.2

