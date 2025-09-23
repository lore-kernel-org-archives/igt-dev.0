Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC2CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 04:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF6410E553;
	Tue, 23 Sep 2025 04:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEpOq5Pa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5BB10E553
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 04:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758602781; x=1790138781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JaG5r3mogTs9l4oFnEb7NYS9iyCFhshmTR/cCZKNLQs=;
 b=MEpOq5PaoHCgIYA/uNRd8f2HsxGVKH/871ZFBdMiYbma9TFS3A6J7mjq
 jBwKwocAaX1XNpSv2KzMyaMpSIg2doi7OzliGmTzIH2GguNte2yPTX3KN
 gjr/8JOIS/LLUa2dqRrZAAA8syzifVtb68Or6oqouMnYAKc5LffhqUDaR
 DEDBvyUvPRwa29Gyi/s9eDHlSz15zBeN554M5s89+mT+bLk1VieU/6Slv
 VO2qrskivoSXp10l3w9i+wUnmzgMddPm/Tbw/aupqWkZVtUIdh6dKJwUN
 S9l1MFFXsplsFVwa65EmEHzyAjpMsFqKcWyu5GA9mv1XTzw/j1c0EpTY+ Q==;
X-CSE-ConnectionGUID: k9u5017DRfun0O5A6hzcEw==
X-CSE-MsgGUID: RCHc/C+qTjKQXoRso+1kpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86309623"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="86309623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 21:46:20 -0700
X-CSE-ConnectionGUID: Yna2wlGOS9GWU4dXVrm9zw==
X-CSE-MsgGUID: vkkCdP4iQ46RfNZKkQ1Bbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="177451935"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 21:46:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:46:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 21:46:19 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/xY17DkyZZOM9J7NPJbwJ5/iLsT4UgpKi2EUnfGQLWu0I5w6u2UCU4MzVOcX4iCEp3EKYtuuCakEfNxEEp/IbmazNxa584SEgr51XSg/wts0xjCZgUmnF0yzS/y1AsK+nmWdpy+Xz4E9paXW49/qV7acAcbolJLvNwomu2j7J7IzaJforXdMTP/HNPexp0nK2wKfYJy00lQHQC//x0rTjbDdJCZYEbQXwpN7ItrUYOsuQmAYM9GodYwT9Xj7RsFQwqFoxnooZOx+3u4U60ffzA4qNaaX4VhkRHyaSe+9qS+RPjin3lC/0Ktmcima+pyeqejgMW8jzsUhOqri4I5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5UQo8lf4lngpTEnn5rmXR9KzHSXbbWxwranPmlNg54=;
 b=JA8xp21NvLtfA7jEjJb8J0xaz+6aNwsm/qdQW6FdbPxnyA3MPCVeGJ4qXIhCJuoI2FEqiFGOa+gN0CYmQ7NfhTK8ZrP7hTxObs1OmLrwAIp3nZTjNM9P6zlH2FNoPb8tIMhxHyO6cDYzA1ct8VLx+sQHv0PxxEceOaSGUewSaS0ker3aNCh/DRxKq4CbiDBtI8scGr5oI7Gj0dHIA07ptr4UH6ji82RN14qThqiFyQCzEm5Q4EvVz4VBtgcYtykakwu8ZQI6h1bR0Y267TFpCQmkm9sLUUK7W8SlCn0G+VoTN8McH5tvkJCvxSLjbWUR3L92wDH6WZydy36vlAq8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:46:16 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Tue, 23 Sep 2025
 04:46:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1 1/1] tests/kms_plane: Optimize pixel format
 testing for simulation mode
Thread-Topic: [PATCH i-g-t v1 1/1] tests/kms_plane: Optimize pixel format
 testing for simulation mode
Thread-Index: AQHcLD8BFRiOO/w+LUGHUj1FYbVRu7SgMHXQ
Date: Tue, 23 Sep 2025 04:46:16 +0000
Message-ID: <DM4PR11MB63129406ADEC1D4BC2042C56901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250923040243.3664141-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250923040243.3664141-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW6PR11MB8440:EE_
x-ms-office365-filtering-correlation-id: 29a9bbeb-ca22-488b-79e5-08ddfa5c21b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qAS6Yd0QVDnbdecX2H1l36Y3ic4R4TdYbUDDruFkGgCFbkue2yju/KIHPkE+?=
 =?us-ascii?Q?EJIzHr9OVp6RwyxyxSdJoNKoWoceSAWm2aPiqP5CfHXmxHaZ+7twkYKJmtM9?=
 =?us-ascii?Q?2CcaYPII1Q5cRGk7SZcezvKe+iRfFpXCL6KShep3bOQDPMrAD8WM2O6C7i0G?=
 =?us-ascii?Q?dQah33OmGPbZQQSYwPj7Xe+g6ygjuHobv9Pl/9SQ7Lfdx0u9KbdSfUdSZDnq?=
 =?us-ascii?Q?mQCd4SaTQQZDCcwqInRvBpsC0XLeoNvffVAsjGQvOtolqOuoTgu0i+K1vKPg?=
 =?us-ascii?Q?S2B+Zcx3tzhuuy/SsgjTPggxU6OuNppb0fVTAKizGVcEL9NEQlwLZoncWbt0?=
 =?us-ascii?Q?D8Xa6Ww7VhB06m0F+aPodOOypllAojzJ+qL7oz40sI5hsZDLMY0wuKkryt3b?=
 =?us-ascii?Q?eqvPX1hETgLEnnYxSrPAygqqpmGa9DhTctfZH483wHxuxJJGtB+qLrusBKiR?=
 =?us-ascii?Q?FCWzSIcKRR8pU5R4HX29vhvSY2nWyBVdQPOptQHQJNFxdaMIG1jLolMqzkz7?=
 =?us-ascii?Q?ksbunf2Tk0VVZMYYKATjGodsPZC34JT4DkrZ0IvdVSXhGfB41tfm+ua+HZq8?=
 =?us-ascii?Q?ulUjpW5ENNJWLNKoJKXTAUkOEVu3QDTFlvr9hHtnxpsq75B9eGDXgUTMWek2?=
 =?us-ascii?Q?68W9wM2UqExVBLyX1TtvK87Folgv9IEiMY7A+CYn212VD/FKAtLFIIbAdKzx?=
 =?us-ascii?Q?6BXfenWe4mpdxN7fP7sH4qtblH8DEX7uZwy9mwaL10lzO/LNCvzM6w1oH9uL?=
 =?us-ascii?Q?xr3dJiFT4zZpKwj1NsAtkknHZf5YZ5wb76cpypjGsWwucLEmXeWQK42Zso/e?=
 =?us-ascii?Q?eT2h17t5A58Ame+oRTjr1wC9Rp9hiyDw72psFp11DQ/pUS/UJm5C016lB4fj?=
 =?us-ascii?Q?WWTPdBPTBLIZ2Q53VOn7MTCF9itEupyAC5EOD11e7MZLh3hf0Lp2DxIJyBYA?=
 =?us-ascii?Q?0AD6pBAYUnN587EzSA0TDLjPuuAIuoBZh1GpAkGyd6RayQ7bAPkQc5bpjv8v?=
 =?us-ascii?Q?ZRXKrjD4UXh7bwU3+7le5ufr8+4Kynwrmgmk8Gr++7gHRlRGE/8M1ldu/7Kj?=
 =?us-ascii?Q?lRc8GQqMK8QN2bCRXDcbGNYLkymjxAD6alaEF9w1L8LYvpgtYThEaAua62VX?=
 =?us-ascii?Q?8XGt/Fb8ZRTsx5S8BhRw2pZgDHi7pMW1oIDKRVYbmTHS9srwNymo0QknON51?=
 =?us-ascii?Q?daE3nO+JL78MiMhrv60BX2/sROA2Dr19AuhxChOEv0O9PggeT6Oc65/MvZnR?=
 =?us-ascii?Q?rlXA8onWF8mA4FfJNVYCNcY0zBKupFqaq11xsd3EkVuNfaZmXDel/ctx5pY0?=
 =?us-ascii?Q?+QQv7g2yFBQFNvbq0iACiZv0khlVyYZjuAF8r89WmLxTlUA4U5FC7sqdTf8O?=
 =?us-ascii?Q?c8pxjXVISHrvhfzTxUZgrgFYlW3aqmLxalSwA1E2D1+X7FHyk3Y7Iej/3c7l?=
 =?us-ascii?Q?atwXtTQGVVkZJZ+I3unTwmBy9dlQK7iD3SpcCUOQiya61y4Klr8Lv0eBpk5N?=
 =?us-ascii?Q?FIYmJwFDglBiYfQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zcvvq/IghueyOsc3+ea5qDzfGzU5tHZxV/qxEs46P129Z4V3WifJJH0MmO/F?=
 =?us-ascii?Q?NlMRqnQzzomfIcf/pcQzm/J48ru0FCCGgLzclPIYsxxBMpS+xqBZ82CihjXW?=
 =?us-ascii?Q?TJ7M8LxtIQuKazKK3b7kCAgLciFxs0Pt6yUEaOSG65j+nuKiUFNAybob+mQ5?=
 =?us-ascii?Q?Nr6VEAY9IoWc7w4aWIJwL11y/pmVsNesSbIGQxPNCOSxb1uzd0kusiFXuHa6?=
 =?us-ascii?Q?a2yJyAUqnIP67EZVmy+crCpspTU6e+Lev3ti5lmT0BkjohE8X6fD8Y/Gdpbp?=
 =?us-ascii?Q?dILNdnH/5bvEPFj4ClazvM2zHD4nE9kXUD1WmFu+pELKj0Xd0o/ozg0r1cSb?=
 =?us-ascii?Q?6hTXmtnlDA6Yh0BF0n9ZNIz1kZNDShDif8V6hVDSfAm95yC/XwnXh8PY5nLe?=
 =?us-ascii?Q?nyJYQ9I5Zh42I/Ic6RQAesxQGSAndFNkenPGVxHZA0wPYM/EbA/qHowGcx0x?=
 =?us-ascii?Q?xlXfW2PCeXhX8rFohmy7thHIoP7MyogUBNDGUSZyE9QdLnZ4ZvmLhGTjsLxt?=
 =?us-ascii?Q?0xcpm6akGVYid8IrTi8IvFxBmjd3e0E52DeajU1Fx4VRyppCYcmSYpFc79Pd?=
 =?us-ascii?Q?gljdDunOlc86+P8mgxFUcKtJex75JDBgmkyPit2R4FsPph9ICxOrJjxIZHMR?=
 =?us-ascii?Q?lnsIit8bYBlbgLwzMiWvvd5+R8/0ao0KUUVPRk/nrstdyBGYEF+J0Dvsgf4C?=
 =?us-ascii?Q?g0u7rkewOytdSm7YmeNrxCHM+s9I03R1sZwfkCm6Pb1VldK9Fi3WgPSkfqzx?=
 =?us-ascii?Q?O2PLynuN71Fa3ARKBDq4vmSB/XnxW3yMBpg+BQ3X2XAFxWaAnEvJK2zVQlRE?=
 =?us-ascii?Q?Kzt32cmGOjO4MEfcMC7D6BmfsDD13ZA2dkvPsZQYoVdyu1w/pbp2j3l47wc9?=
 =?us-ascii?Q?JF51zv4D4RUP2vAF5Ax71NFf6KZyeHl80ZtgiJXAZ48FUrKIDTAIpNwI92oB?=
 =?us-ascii?Q?/es2F0HowveZd2q8egiGvuCOJB0/ooNIAdYHvjP89ELA2QF6zkwtIzadZFlz?=
 =?us-ascii?Q?NUVpX/LiTVgs86bgQR5YjxFi+lmeWf4WZbo2EQzX3mf2A5YX9PQ5NbtpvqZR?=
 =?us-ascii?Q?shgxrN82aHglzQ7QqFltU5vL9RxziP3ZyA37dFs+yrnipm2q0FCtmrdHuCKO?=
 =?us-ascii?Q?Sx35EDSjpIbnYIrpdBk+S5oVu3IQEKJS7DQTbrKFTqRjzVOuVXu5JVv0YBGz?=
 =?us-ascii?Q?O73QmVVgc6wJMQ3JwN5/N6RwvS7NGQDKqryJJtwPiZWVgJkpWhbnHelzzdmc?=
 =?us-ascii?Q?0NXEJ0miOf4HuryaDYQDq5Re7jBus6X6aJheOmHG/uunGch9bZdODmtRq+67?=
 =?us-ascii?Q?suef1J4cwrcYH+F3W32Tkt4uUNM52ua4+xTXjG0P0mrT6swD43rlSXk0D++k?=
 =?us-ascii?Q?g+amek+HfMTtcQ2PMgV67B/lsZGomNRtO93Oj6jf6MdQRPM/zXljBGXRtjqF?=
 =?us-ascii?Q?k+ot4ThyMRQqBYHtpCeyfalrQqhDXOPJLOPLzyNKY0O/fUAX1Gm06SI9/+NO?=
 =?us-ascii?Q?qO/txGLF+X7PUajADGGkTDMRi8XjAJlPY9coWlIFixcpdzMMlmmNN84zy3b7?=
 =?us-ascii?Q?UTyP5tb0qe9eJb+BR0L4VOF8DCcARuClqBio3xLH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a9bbeb-ca22-488b-79e5-08ddfa5c21b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 04:46:16.5677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMO4Hdj/eIlGYTH8Bp7C9SRkHIkakyZJrjMYx+kOd8jBN0fGG9bWSo1L/4iELSX10SM3/zj8xVIlQRPPqI1d4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
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
> Sent: Tuesday, September 23, 2025 9:33 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/1] tests/kms_plane: Optimize pixel format test=
ing for
> simulation mode
>=20
> To improve test efficiency in simulation mode, logic was added to skip pi=
xel format
> tests involving the "linear" modifier, which is known to be slow due to
> framebuffer fill operations. Additionally, test execution was limited to =
a single
> plane to further reduce runtime.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index f7b672c7a..1de78=
9ca2
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1106,6 +1106,16 @@ static void test_format_plane(data_t *data, enum
> pipe pipe,
>  		    f.modifier =3D=3D ref.modifier)
>  			continue;
>=20
> +		/*
> +		 * Filling framebuffers with the "linear" format is relatively slow,
> +		 * which significantly increases the duration of the test. To
> +		 * improve timing and efficiency in simulation mode, linear
> formats
> +		 * are skipped.
> +		 */
> +		if (!strcmp(igt_fb_modifier_name(f.modifier), "linear") &&
> +		    igt_run_in_simulation())
> +			continue;
> +
Can we add this logic inside skip_format_mod.

>  		if (skip_format_mod(data, f.format, f.modifier, &tested_formats))
> {
>  			igt_info("Skipping format " IGT_FORMAT_FMT " /
> modifier "
>  				 IGT_MODIFIER_FMT " on %s.%u\n",
> @@ -1229,6 +1239,13 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  			continue;
>  		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe),
> plane->index)
>  			test_format_plane(data, pipe, output, plane,
> &primary_fb);
> +
> +		/*
> +		 * In simulation mode, we only run the pixel format test on the
> first plane
> +		 * to reduce test execution time.
> +		 */
> +		if (igt_run_in_simulation())
> +			break;
This should be blocked inside skip_plane after the desired plane are tested=
 on simulation and then skip.=20
>  	}
>=20
>  	test_fini(data);
> --
> 2.43.0

