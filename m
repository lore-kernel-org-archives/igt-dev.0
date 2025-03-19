Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F08C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 17:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614810E164;
	Wed, 19 Mar 2025 17:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOU5y4t5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551C10E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742407015; x=1773943015;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NyNtIpnKp8Rmw8GARyM1Ug/Dz7eT7YRuEIn/ICETKPQ=;
 b=NOU5y4t5WsovAbcsO2bEzL1SAbJPIx62HC6p0KQAHJ4sluRCn6p4NPoC
 flRMTkGAnd3W2tmt3EgZg3VZva3dmuiD+zslJxpp0nU/IyLbEfDVJkD3N
 mUJ+SoHus0TX21sKqKbdgwXYstGkOfZjdCDsfFqspZGyy9UTJo8gbOzx0
 YbaySNpIZXPkKOtSx1hCNGvIkySoAmNx5qXnqIwCaxnORYnGS5uYdKNGl
 2JCGlOB7WZeYHCPACGV3akwJo4RxN9eIWmNr5ZkYCENmPu7UuJt5dG9Yu
 yWY6yItI0nEvbqalOFw4v/LA801RESQNfBioMhw3co9SecpPfJqvWhemg g==;
X-CSE-ConnectionGUID: 1dD0e1T+RzmmUvVALPBtXQ==
X-CSE-MsgGUID: ORTM3SYKQHigwOJGtqNBPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43533725"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43533725"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 10:56:20 -0700
X-CSE-ConnectionGUID: qZcenyfhTXehwQSTEXnr0w==
X-CSE-MsgGUID: JMK133nZS9+NP5RKrdywWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122726843"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 10:56:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Mar 2025 10:56:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Mar 2025 10:56:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 10:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjm9zSI3B75AkG3dIdAkl8U6ELJs3TpZbSVQci434uY9XGAZoffYub3BCzZCpp01BWJJN+DDiQFbkIrsy24MHyzRzcCswwg55cEYpZQmY0MXoWlNLUq5esF3V5EOuz6K82VqkeqMMkcISiT3PgS7lS1gmgMfWO/vNSQBbClMgQ0kQhAt9d8L7da6QgwI8oizx/ure6/3SaQKDG9kLYRvWvpCjcnWrYlAI8063EcJqOuG7kyr1XKDsVdVV8a4uf/fY3SSvd1WE6DDGPDLrsOjhj9jCvULP1xRVsbZKFYTBzjkPo9N6zyWFkhXdRFla60iddC3hu39rDWzebXl58q66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+ONITOvpF/GPhxAIUewlh+afeU+h92e4d0GezfkMVM=;
 b=s9hBro6ICo7AWzyiEXM0cY+7qxN3OAOiySc41d2/EnXYyYOez5dNmzaM7XMSL59VM9jEIrqLlRzaktu8JM2rXMCV6a+m+VMRNqw/8FGu354KTovkw0YiWTEU53F69kwv1Vq/YR7adLBZTwAKNHvOI8seAvvU4/w2G9D3/9O/X0gFOmSW/z3kxTaKHmzx7sj6qb/qkStXKdDjUxxyDWEFrtlekMPN0EiFfRYK9ruapTIHJgkU4qkWOrD4eGyUW1EHAkMnSJ0NxfhZchbdWNDSAEKHsky3IG0hZ8SkK8PlZAufpl9JiHE3rWHyYMUUZ6rSxDCCvSHJV8BfLKuEfI8Wmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 17:55:26 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 17:55:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3] tests/kms_plane_multiple: Add dual display
 subtest
Thread-Topic: [PATCH i-g-t v3] tests/kms_plane_multiple: Add dual display
 subtest
Thread-Index: AQHbkx13GNj9aKn1okioIF4/XOd66bN6yFqA
Date: Wed, 19 Mar 2025 17:55:26 +0000
Message-ID: <DM4PR11MB63129F52EA5D4D281908569990D92@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250312070821.610143-1-karthik.b.s@intel.com>
In-Reply-To: <20250312070821.610143-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5167:EE_
x-ms-office365-filtering-correlation-id: d87fb22d-4f66-46db-3399-08dd670f3afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5fJuib0kT4lAdveXejsmJWTO250VE5nj6Z/673PaPyF+rAad03XlEquESMYs?=
 =?us-ascii?Q?SCnpIxsL0mSPSGh9EQO/anvaBY9rCC2gzUlNF0iw8vlnOm8ncLQw9CuA0npq?=
 =?us-ascii?Q?FIop331i0bLIqNwPOPw/dgiZOJY1GtNeJHzZeBNYeDWaKyOjszGnREd4HAtO?=
 =?us-ascii?Q?DsJNkS7io8SVSLzU6hceKws2j9yJamjWkJjXZFFPVmI4L80RBhp/Wu33KSvo?=
 =?us-ascii?Q?amgHpDxT+VFmyk2eiv9nvGMgnWeiOjPb880Hrf6fcslaCY2GMtQ8hb7x2mN/?=
 =?us-ascii?Q?CExqcMJxRcp57MtsCkM6vTt+OdAhoNMTlzqExjifO8D2aJxwIrJJHp5qraZw?=
 =?us-ascii?Q?5vKW4r6r8INkFy+sTmzgelVNeNoBC0LOcyu1D96FoeqcskbLHJdoeRqI2xgk?=
 =?us-ascii?Q?ig8qKBH0tMZeTo4aEqkKYYXbd2W1oYL/i3kyzUpgvRzmo1/ar8WOgeidxVyQ?=
 =?us-ascii?Q?UepABfL8iaI8h3dyJum1hwBJDyEnfNaGelFTJJg85svJO+Zt/4/tCBi4K2yH?=
 =?us-ascii?Q?sou0vAdW24NJoCyhUK/Bse7Rr5TPwS3CmgEqYNyG/ymp9zl/MYHKNfaDOyg7?=
 =?us-ascii?Q?WcbrF9gA/P+C4e3bzGDCw3vX56OEVoEbKDpe3wtx296wdb8tgeitrJpBRxz7?=
 =?us-ascii?Q?GqjTIBUNSXZfTGcfkgnm02AG9fZUeHR09+aLu2fbmq3PL6rEM1XYw31LnSPM?=
 =?us-ascii?Q?FlxXsyzSsTgo0guMcegD9KSA5qyv/8g7YngvUVc/U+O891UmN7B+A/82J0kj?=
 =?us-ascii?Q?2pKnLtKmxOQsspM+18lx/J5VR8oP7ZrLp8dM9baxizOfUBDi9LdO1aYojEmq?=
 =?us-ascii?Q?/TL2zcQI+u+YwvNE2hSCPen0iLzqmRRuCWy6BTDFBJPwODN3/Gc2UQRb92mw?=
 =?us-ascii?Q?OeoVQp/vMftp2dxo5kE1hsMrIsn6UVZDtF9xqZHEKPaLpFzctC47ugDrsFnF?=
 =?us-ascii?Q?4s+UiavvfF6YaAMLvd4kulgPpFRQve/MMt5KbKbKlPq0iQ4KBR5rVmcvami8?=
 =?us-ascii?Q?gLTJmtnh+JuUckZe56U3yINbZ2LcpefALmPl9vywXO7B8GCDlrU4ElnCLw4B?=
 =?us-ascii?Q?c8E2ObJhCjMkQCs+/6Co4HAv9mMTPcF3MGHKiVhGhbRCmcsPxCB4feB9pXYP?=
 =?us-ascii?Q?7Zj1Y0pyCyOvG8U1L9uZ25mKYmNF6DKwoHlumqlC3Lj2EtvCzHAqruBkWWM6?=
 =?us-ascii?Q?/hIY13wAkGy0cfESmaUG3HRc+Ces/bCjtWgIvIQJP6BDFybSjuv4EzFyZu+b?=
 =?us-ascii?Q?ldIp3nmqDSZYwUqDBj0SxTnd6c1/UdI3hHYnoRC9vsPp/OlKHZO5vx4josud?=
 =?us-ascii?Q?OKlrfAgTz400m8b61lp/IhzspANepfk5tnNE64ubYRrqeAinmpexGFc2wgq8?=
 =?us-ascii?Q?xonEgSCKz+w4jNaXM4Okml5Ks07yxjFMnNUo5SuYgZ5+R+JhhM8AFl3SxvlS?=
 =?us-ascii?Q?GEdoBwNymrQ5A9l9rKjSPDjDqEcELAsF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bchw8AYLr4ZF/+H645T8itSJFWaKzElreiAKBCUrqI9JwiY0loZLkxMYcnI4?=
 =?us-ascii?Q?YRojfqgojpk8olTlWKboG3fgQliIlcHBkrN3J6KVJDlyXE3DK3uG2HuXT0wv?=
 =?us-ascii?Q?JeXmdlLaYyL/VGk8F2zr4z4HxC5ygcMzXJIDX7nwQ5STNcJlOxbNr9Uf430F?=
 =?us-ascii?Q?e23PXuwkZsyH0bstk/bXknLfisFN6eyZru7Qpm/YaHEinxlJ/NvMrC5MxCOZ?=
 =?us-ascii?Q?LibyRsg93jvuePrtoUBBnYbZAKxSMHxJCTG+b1k9lNQzdHcOclDEslOfDwsN?=
 =?us-ascii?Q?2endMp84wCNUZpTTx1bnOBktZJKUgKajZAbYkntRkl41DJr3XeaOklDZBCpw?=
 =?us-ascii?Q?Hy+GjP6zvp2NUawmceSLHe3VlfVSi04q1NNG9rbmrHgK8HJmxcBN603fFumW?=
 =?us-ascii?Q?UVzYa2bvDHeY2k9HppcGgb324Mcrvr+1lCru9wbwx0IJwjf2UhxmEfnMtSTN?=
 =?us-ascii?Q?jtyB077iftZsLmvATk/79XX9c8QRSgeMtv/GeZmihPzeEx8vmZHxGR/VtsUJ?=
 =?us-ascii?Q?/QuAh9Xwor6LBVkSj6Bx+diWe2Ig6pq0L1vdZzMzkL4+17Pvw5cPdNStFR68?=
 =?us-ascii?Q?j84oxLYePlxrDw4cuYmedRB3mqNY9JoguRE6JJiwIet5NFIxmx6mr36PLqo7?=
 =?us-ascii?Q?aSrR/I+FajA1ET4lAutd0Fe0ZDyCCtEK8MrmB/x9elYhGQYaAfh8d3zeL7vN?=
 =?us-ascii?Q?TZhdRDsGvqK4aA9oVdAC16BR72H/ekJBEQE52pj4D1WQ/3eG2w76F49pDIdj?=
 =?us-ascii?Q?bvcJKCe/jZqpjBfHKzn6Eg9iGtiMTMLAdIkb03Abac9AlsOZWyjk3X5WlyKO?=
 =?us-ascii?Q?uFx/y1t1doz9EIUlHouHPqH8oxucHy1x1+a7ktoCJdMqvkKUV+i86X8NDWj9?=
 =?us-ascii?Q?+q4RAmmF7J3/4i3arSDgPWRGk3EI0+fPA/nwWMVwP3yjWtDpTR9heeRZ1/tg?=
 =?us-ascii?Q?M9/OPcUP99taoD7jmXlA2G2mTRseEyqc5dSfeCkJ7cb4h1shAVmRfBElbDYD?=
 =?us-ascii?Q?pInL8PVBbKyesOf3YY87gXGDB5jtlPE/Ok+2OK2/qzhCEB3ZwEjLeRG9ni9R?=
 =?us-ascii?Q?kY9qNGHWwun+ZLmHhji6qC/IpV1BBdByOO0R8Y980tQ1tSByjDpQWoZHx8q6?=
 =?us-ascii?Q?zPHASqK0VNzp9ybLj3n1Mp0qb/nJu2wQhI1eRVdGRShHwXed7MfPYagJYNib?=
 =?us-ascii?Q?fuiuku/cpoXwWOebNzQNIdkEk5q2+dDJeoCFa+wQAByJB6WOEw7Ypa8nuN0f?=
 =?us-ascii?Q?jzvx6M1QDnXWS+2tekt+sWxoNQEX6tx2MgpvNnEeZnzrez80DPVmcJ9ptHax?=
 =?us-ascii?Q?9JR7f7wOAH3xh4GJGxMaZ41TQEUSan/Dr5Wqsyz05Wvp3a+lzjTYStDCW+/Z?=
 =?us-ascii?Q?WWuPD/SHhtJH8/+E9zQ5kmQ5RUis9mbzEwIvy/4fa/j3NCiUYepMgyso1AMx?=
 =?us-ascii?Q?yQri3Hod5GiCt0Xdw7wc8oe5PGaljvqYFX74gOw3yMnUrTe3bdHbwPv3FxB6?=
 =?us-ascii?Q?jl/W61OrwZBnwq9VGKQYUxLYogXd6UxRFB17wy/T1/HZi5VkQaATvq8AGxIQ?=
 =?us-ascii?Q?w4neAe/tf4IiwHQVVXs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87fb22d-4f66-46db-3399-08dd670f3afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 17:55:26.7947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIbMXvnzgfSCcs9ONCecfngzcASX8tfUo8tFpGUuag5KZ6XBpnm8sAX00GqY/nW9WSh57LLZcQB9CxZ+2Aw6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Wednesday, March 12, 2025 12:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_plane_multiple: Add dual display subt=
est
>=20
> Add 2x subtest to verify MPO use case simulataneously on two display
> configurations.
>=20
> v2:
> - Update the test to use all the modifiers (Jeevan)
>=20
> v3:
> - Add modifier support check before starting dynamic subtests
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_plane_multiple.c | 235 +++++++++++++++++++++++++++++------
> --
>  1 file changed, 186 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> eda300b06..1e100a5bc 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -55,6 +55,18 @@
>   * @x:           x-tiling
>   * @y:           y-tiling
>   * @yf:          yf-tiling
> + *
> + * SUBTEST: 2x-tiling-%s
> + * Description: Check that the kernel handles atomic updates of multiple
> planes
> + *		simultaneously committed on 2 displays.
> + *
> + * arg[1]:
> + *
> + * @none:	 no-tiling
> + * @4:           4-tiling
> + * @x:           x-tiling
> + * @y:           y-tiling
> + * @yf:          yf-tiling
>   */
>=20
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
> @@ -73,10 +85,10 @@ typedef struct {  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> -	igt_crc_t ref_crc;
> -	igt_pipe_crc_t *pipe_crc;
> -	igt_plane_t **plane;
> -	struct igt_fb *fb;
> +	igt_crc_t ref_crc1, ref_crc2;
> +	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
> +	igt_plane_t **plane1, **plane2;
> +	struct igt_fb *fb1, *fb2;
>  } data_t;
>=20
>  /* Command line parameters. */
> @@ -95,14 +107,14 @@ struct {
>   */
>  static void test_init(data_t *data, enum pipe pipe, int n_planes)  {
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	data->plane =3D calloc(n_planes, sizeof(*data->plane));
> -	igt_assert_f(data->plane !=3D NULL, "Failed to allocate memory for
> planes\n");
> +	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
>=20
> -	data->fb =3D calloc(n_planes, sizeof(struct igt_fb));
> -	igt_assert_f(data->fb !=3D NULL, "Failed to allocate memory for FBs\n")=
;
> +	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
>  }
>=20
>  static void test_fini(data_t *data, igt_output_t *output, int n_planes) =
@@ -
> 110,21 +122,21 @@ static void test_fini(data_t *data, igt_output_t *outpu=
t,
> int n_planes)
>  	/* reset the constraint on the pipe */
>  	igt_output_set_pipe(output, PIPE_ANY);
>=20
> -	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D NULL;
> +	igt_pipe_crc_free(data->pipe_crc1);
> +	data->pipe_crc1 =3D NULL;
>=20
> -	free(data->plane);
> -	data->plane =3D NULL;
> +	free(data->plane1);
> +	data->plane1 =3D NULL;
>=20
> -	free(data->fb);
> -	data->fb =3D NULL;
> +	free(data->fb1);
> +	data->fb1 =3D NULL;
>=20
>  	igt_display_reset(&data->display);
>  }
I think we need to free resources related to second display like above.=20

Apart from these LGTM.=20
>=20
>  static void
> -get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> -	      color_t *color, uint64_t modifier)
> +get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> igt_pipe_crc_t *pipe_crc,
> +	      color_t *color, igt_plane_t **plane, uint64_t modifier,
> +igt_crc_t *ref_crc)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
> @@ -134,7 +146,7 @@ get_reference_crc(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	igt_output_set_pipe(output, pipe);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -142,21 +154,21 @@ get_reference_crc(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  			    DRM_FORMAT_XRGB8888,
>  			    modifier,
>  			    color->red, color->green, color->blue,
> -			    &data->fb[primary->index]);
> +			    &data->fb1[primary->index]);
>=20
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +	igt_plane_set_fb(plane[primary->index], &data->fb1[primary-
> >index]);
>=20
>  	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_skip_on(ret !=3D 0);
>=20
> -	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
>  }
>=20
>  static void
>  create_fb_for_mode_position(data_t *data, igt_output_t *output,
> drmModeModeInfo *mode,
>  			    color_t *color, int *rect_x, int *rect_y,
>  			    int *rect_w, int *rect_h, uint64_t modifier,
> -			    int max_planes)
> +			    int max_planes, igt_fb_t *fb)
>  {
>  	unsigned int fb_id;
>  	cairo_t *cr;
> @@ -168,16 +180,16 @@ create_fb_for_mode_position(data_t *data,
> igt_output_t *output, drmModeModeInfo
>  			      mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888,
>  			      modifier,
> -			      &data->fb[primary->index]);
> +			      &fb[primary->index]);
>  	igt_assert(fb_id);
>=20
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
>  	igt_paint_color(cr, rect_x[0], rect_y[0],
>  			mode->hdisplay, mode->vdisplay,
>  			color->red, color->green, color->blue);
>=20
>  	for (int i =3D 0; i < max_planes; i++) {
> -		if (data->plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (data->plane1[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
>  		igt_paint_color(cr, rect_x[i], rect_y[i],
>  				rect_w[i], rect_h[i], 0.0, 0.0, 0.0); @@ -188,8
> +200,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t
> *output, drmModeModeInfo
>=20
>=20
>  static void
> -prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
> -	       uint64_t modifier, int max_planes, igt_output_t *output)
> +prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plan=
e_t
> **plane,
> +	       uint64_t modifier, int max_planes, igt_output_t *output,
> +igt_fb_t *fb)
>  {
>  	drmModeModeInfo *mode;
>  	igt_pipe_t *pipe;
> @@ -249,15 +261,14 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		 * Here is made assumption primary plane will have
>  		 * index zero.
>  		 */
> -		igt_plane_t *plane =3D igt_output_get_plane(output, suffle[i]);
>  		uint32_t plane_format;
>  		uint64_t plane_modifier;
>=20
> -		data->plane[i] =3D plane;
> +		plane[i] =3D igt_output_get_plane(output, suffle[i]);
>=20
> -		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		if (plane[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
> -		else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		else if (plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  			size[i] =3D SIZE_CURSOR;
>  		else
>  			size[i] =3D SIZE_PLANE;
> @@ -265,10 +276,12 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  		x[i] =3D rand() % (mode->hdisplay - size[i]);
>  		y[i] =3D rand() % (mode->vdisplay - size[i]);
>=20
> -		plane_format =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> -		plane_modifier =3D data->plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
> +		plane_format =3D plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR
> ?
> +						 DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> +		plane_modifier =3D plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ?
> +
> DRM_FORMAT_MOD_LINEAR : modifier;
>=20
> -		igt_skip_on(!igt_plane_has_format_mod(plane,
> plane_format,
> +		igt_skip_on(!igt_plane_has_format_mod(plane[i],
> plane_format,
>  						      plane_modifier));
>=20
>  		igt_create_color_fb(data->drm_fd,
> @@ -276,17 +289,17 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  				    plane_format,
>  				    plane_modifier,
>  				    color->red, color->green, color->blue,
> -				    &data->fb[i]);
> +				    &fb[i]);
>=20
> -		igt_plane_set_position(data->plane[i], x[i], y[i]);
> -		igt_plane_set_fb(data->plane[i], &data->fb[i]);
> +		igt_plane_set_position(plane[i], x[i], y[i]);
> +		igt_plane_set_fb(plane[i], &fb[i]);
>  	}
>=20
>  	/* primary plane */
> -	data->plane[primary->index] =3D primary;
> +	plane[primary->index] =3D primary;
>  	create_fb_for_mode_position(data, output, mode, color, x, y,
> -				    size, size, modifier, max_planes);
> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
> >index]);
> +				    size, size, modifier, max_planes,
> &fb[primary->index]);
> +	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
>  	free((void*)x);
>  	free((void*)y);
>  	free((void*)size);
> @@ -332,12 +345,13 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>=20
>  	test_init(data, pipe, n_planes);
>=20
> -	get_reference_crc(data, output, pipe, &blue, modifier);
> +	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
> +			  data->plane1, modifier, &data->ref_crc1);
>=20
>  	/* Find out how many planes are allowed simultaneously */
>  	do {
>  		c++;
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>  		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane) @@ -
> 347,7 +361,7 @@ test_plane_position_with_output(data_t *data, enum pipe
> pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  	} while (!err && c < n_planes);
>=20
>  	if (err)
> @@ -361,14 +375,14 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  	while (i < iterations || loop_forever) {
>=20
>  		/* randomize planes and set up the holes */
> -		prepare_planes(data, pipe, &blue, modifier, c, output);
> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
> output,
> +data->fb1);
>=20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		igt_pipe_crc_start(data->pipe_crc);
> +		igt_pipe_crc_start(data->pipe_crc1);
>=20
> -		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, &crc);
> -		igt_assert_crc_equal(&data->ref_crc, &crc);
> -		igt_pipe_crc_stop(data->pipe_crc);
> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc1, &crc);
> +		igt_assert_crc_equal(&data->ref_crc1, &crc);
> +		igt_pipe_crc_stop(data->pipe_crc1);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
> @@ -377,7 +391,7 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
>  		for (int x =3D 0; x < c; x++)
> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>=20
>  		i++;
>  	}
> @@ -400,6 +414,115 @@ test_plane_position(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t
>  					n_planes, modifier);
>  }
>=20
> +static void test_init_2_display(data_t *data, enum pipe pipe1, enum
> +pipe pipe2) {
> +	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe1,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc2 =3D igt_pipe_crc_new(data->drm_fd, pipe2,
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	data->plane1 =3D calloc(2, sizeof(*data->plane1));
> +	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->plane2 =3D calloc(2, sizeof(*data->plane2));
> +	igt_assert_f(data->plane2 !=3D NULL, "Failed to allocate memory for
> +planes\n");
> +
> +	data->fb1 =3D calloc(2, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for
> +FBs\n");
> +
> +	data->fb2 =3D calloc(2, sizeof(struct igt_fb));
> +	igt_assert_f(data->fb2 !=3D NULL, "Failed to allocate memory for
> +FBs\n"); }
> +
> +static void test_fini_2_display(data_t *data) {
> +	igt_pipe_crc_stop(data->pipe_crc1);
> +	igt_pipe_crc_stop(data->pipe_crc2);
> +
> +	igt_display_reset(&data->display);
> +}
> +
> +static void test_plane_position_2_display(data_t *data, enum pipe pipe1,
> enum pipe pipe2,
> +					  igt_output_t *output1, igt_output_t
> *output2,
> +					  uint64_t modifier)
> +{
> +	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
> +	igt_crc_t crc1, crc2;
> +
> +	test_init_2_display(data, pipe1, pipe2);
> +	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
> +			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc1);
> +	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
> +			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc2);
> +
> +	prepare_planes(data, pipe1, &blue, data->plane1,
> +		       modifier, 2, output1, data->fb1);
> +	prepare_planes(data, pipe2, &blue, data->plane2,
> +		       modifier, 2, output2, data->fb2);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_start(data->pipe_crc1);
> +	igt_pipe_crc_start(data->pipe_crc2);
> +
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1,
> &crc1);
> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2,
> +&crc2);
> +
> +	igt_assert_crc_equal(&data->ref_crc1, &crc1);
> +	igt_assert_crc_equal(&data->ref_crc2, &crc2); }
> +
> +#define for_each_connected_output_local(display, output)		\
> +	for (int j__ =3D 0;  assert(igt_can_fail()), j__ < (display)->n_outputs=
;
> j__++)	\
> +		for_each_if((((output) =3D &(display)->outputs[j__]), \
> +			      igt_output_is_connected((output))))
> +
> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
> +	for_each_connected_output_local((display), (output)) \
> +		for_each_if(igt_pipe_connector_valid((pipe), (output)))
> +
> +static void run_2_display_test(data_t *data, uint64_t modifier) {
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output1, *output2;
> +	igt_display_t *display =3D &data->display;
> +
> +	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
> modifier))
> +		return;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe(display, pipe1) {
> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
> +			for_each_pipe(display, pipe2) {
> +				if (pipe1 =3D=3D pipe2)
> +					continue;
> +
> +				for_each_valid_output_on_pipe_local(display,
> pipe2, output2) {
> +					if (output1 =3D=3D output2)
> +						continue;
> +
> +					igt_display_reset(display);
> +
> +					igt_output_set_pipe(output1, pipe1);
> +					igt_output_set_pipe(output2, pipe2);
> +
> +					if
> (!intel_pipe_output_combo_valid(display))
> +						continue;
> +
> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
> %s",
> +
> kmstest_pipe_name(pipe1), output1->name,
> +
> kmstest_pipe_name(pipe2), output2->name)
> +
> 	test_plane_position_2_display(data, pipe1, pipe2,
> +
> output1, output2,
> +
> modifier);
> +
> +					test_fini_2_display(data);
> +				}
> +			}
> +		}
> +	}
> +}
> +
>  static void run_test(data_t *data, uint64_t modifier)  {
>  	enum pipe pipe;
> @@ -503,6 +626,20 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  			run_test(&data, subtests[i].modifier);
>  	}
>=20
> +	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> +		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
> +			int valid_outputs =3D 0;
> +			igt_output_t *output;
> +
> +			for_each_connected_output(&data.display, output)
> +				valid_outputs++;
> +
> +			igt_require(valid_outputs > 1);
> +
> +			run_2_display_test(&data, subtests[i].modifier);
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.43.0

