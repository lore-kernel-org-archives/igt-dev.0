Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95203C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 05:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C00810E52E;
	Wed,  3 Jul 2024 05:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgVj3uRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BDC10E71B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 05:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719983516; x=1751519516;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2/7uNsBJx0WuCy+3zQnyLVYh6gO555aDCRYBrbAnq64=;
 b=TgVj3uRaypYDPBVy8+vSp4wt84cBn2++vcZCz5Qph5P6HaD2U0aoqJig
 XzLxBJC91e8LzblAXoFM8VJGWH84RlaYOdXRzRPyovcXAmmStAW+DHyUq
 xYnlsIWecKC64ZDOccqX2er6E5XeLCCVEthaDErmvYaSjD1teMmIP/gxl
 jMp2V15/C7HBqAHvIIwoKj+To9EILQdi8wKUqxh8iLMedkmqXNT7VJxJ0
 bFIheuChQz9uU2R9rklmioCn9/pC1/iQfezhXT4rCJqqF2pq6TOhboY52
 bXvHj5q0MyknzMwU8S0YsM2f7EAfvJ0r2ckTGHKPkBeiIZ52hrKIsmufN A==;
X-CSE-ConnectionGUID: +YbvXcOES3uY8he+n8pqHg==
X-CSE-MsgGUID: 5J9a8jfwQYWADXWGYCiamA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28585029"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="28585029"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 22:11:55 -0700
X-CSE-ConnectionGUID: kxQXzCbARUKTyA9JWV2GFw==
X-CSE-MsgGUID: Wk3gQcT2S6+LBlUQl17ICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="76870644"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 22:11:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 22:11:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 22:11:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 22:11:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 22:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buD8/4WRO53ZNSURbMkCyOg/HXDw44GHzsTa2SNdUPs8JsP0dEHv6+35unW6eq1rmTZCag8Vsb6KxRupEeDv+0jLaHd1L/85FDUkz0bCiPSmEZO2sBmi2tV8DlYYTtl6w7UhJwSVi1QuAmE4SRxRQLe5a5fhaybuQkXMd42MA+xMk+F+p0Cax1LzApgVX8U7MO0QqXkyTOUdH6V95zPLH/YQBTgm88imRka7XL+r102ZaKIwxlNWj33mBfSoWISb2WY2fv21NJjlc5GhxzLtEhIQO0V+Ts5/6+4zj7qd9mEYJMXfV/b12YdQvrP/oaEfLlpE3kWBWpQGej+0nBRejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfon7ZI9HO3XVJZvX1uPqxXuw3YMfYeP49xztl1VD/k=;
 b=KqN5PaYvWbp0JM9l0pCbvvDtqqdmDs5vsSnYPW6VvgamJZbOANfAr+or8VItltksE2FA9yymNBmwFQ22t1wLZUHcsaq4SiWXmrktwTVB43wc073FPcIwmsq6aq/P3ZdaY9B1EpGC12fAc7Og+3XZZbXHpf5ktmN3rR5IFmdrZOLHLHmMpkzTtzSp4CLFc4N9Y3jR/PgweD9y3mlfUQcEOs5KKQilU2rOF6hIxYc3Lq9f5s/4qIxWI2bjSE8TXLsuFYUKBiWhJ1WL9BRJRXZD0ONI88W9lTD6Kuq98/qMR/2jlMQwQEyeAzSNNqvSHtYPetabToWdn9KykS54q0yGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 05:11:45 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%2]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 05:11:45 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V2 3/4] tests/kms_vrr: Cleanup in creating the virtual mode
Thread-Topic: [i-g-t V2 3/4] tests/kms_vrr: Cleanup in creating the virtual
 mode
Thread-Index: AQHaxe0AQvrAO9FMdEuOcz3cmfCyQLHkgrqQ
Date: Wed, 3 Jul 2024 05:11:45 +0000
Message-ID: <IA1PR11MB6348528AD031C37CCB83A6A9B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240621084711.68444-4-bhanuprakash.modem@intel.com>
 <20240624040611.172063-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240624040611.172063-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ2PR11MB7574:EE_
x-ms-office365-filtering-correlation-id: a16786cb-5b2b-410a-7318-08dc9b1ea26e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7RDQAQyTPjtte59afeC45d5WOG8KI8B9OVmXUUPbL01unKVMyyqnL6FPs6bb?=
 =?us-ascii?Q?k+EPlvIH3r5m2PlkXvF+oQKrBeMC3B2PkzJGsRdqz8dXe6IY4PfK9Qc743x6?=
 =?us-ascii?Q?4ubAUes3vZnmHTDshTEuLyyavJx1su0wadWALFIFxNht7BV9N5aiQuU8TSaG?=
 =?us-ascii?Q?W8LtIMitDDSwGyRG0hNzvto0SFv+2R+pYh2Qbbtir5oKjm0Hl2i6oQ088/AH?=
 =?us-ascii?Q?wbSYGU1xAaQs/cVoh7pc0Y3Erm7KxFE5A+Wy1CM5YeqtTjmVQXXSTGMOCryL?=
 =?us-ascii?Q?e0zH9Ubp/CtVLJfJVamDdWCVRZWSi4fQ9bw0CUmNUPh2jM64Gi/3J5gARC9t?=
 =?us-ascii?Q?bvrLJZAHTQYEFcXaGsnSWCqueWyxGJR8XsyHeIVPPrAcuSx6nPf3MNX7N4K+?=
 =?us-ascii?Q?EpHbLpP0xPANrQ+xwosAbRrr28YKvxOIin7e7jwzoniWffQIT2lBe6KNxWv0?=
 =?us-ascii?Q?QM0rz3SiTcrcB/bS/AafiA5heDNa6WRS1KcINXNI849bSNXYoDG7+15tSuUH?=
 =?us-ascii?Q?HUHn+php8e4ffQ52lt1C8yBwfa8L87G2VRAsY5onZ6Bwrwa3YA0MD6oDl7mZ?=
 =?us-ascii?Q?YSW3sys8rlVk+qyvII9lYi5Ed2/OFtjne83X584NNpKN4bYPw5EI2rnWfvWS?=
 =?us-ascii?Q?S0ttd5NQGe3A2rqD+M4FNGoKvG6Hv3W2sikuvmCUON4330ZosnkG1wXJadCN?=
 =?us-ascii?Q?76ScOP8kRIKptSIBW2L6gCSwpTel8XfiK1arhNLNkWVhH38c0QneC2ieEY56?=
 =?us-ascii?Q?E+jB5TQD4K17CuyxZozjG1aMLA7/bmjsgrsX98y035+8i25p5yNfj094pJBu?=
 =?us-ascii?Q?y0dTww7gq2htY3nmGy453chNcudpU4TAuKNjNj9V7/mP8yk7YCnW0x0rnN7n?=
 =?us-ascii?Q?Ry17+ZYnYP5+Ch9cwg3J/Smdh1lXG7Vi73HWsaDlHdfE8fQan/banKKk4O3q?=
 =?us-ascii?Q?70NTSkgb6Is5FDePMX0yLAzWnuxPq5BB+VclGBQPFD4HTBIsKTjohA12W2rW?=
 =?us-ascii?Q?PxfdrQqFV3L6gyCTg3yI26pa1MgZkyb6tY4/J2XCdZjFazm51NOmYNIsxsSZ?=
 =?us-ascii?Q?fIlLI9dfUdsphMw8reEKG1ljQ3m2kVRGIbi5BecobRWdOlWhS+e8DRDGkuM6?=
 =?us-ascii?Q?M8mciPhH9Lt/6kqH0U3O2eX5DUMT85uQOxZkLSMBlfpKwhtKT34RNIaJ00Ye?=
 =?us-ascii?Q?Z6BzLnMjKTipynD+kkNeFxWT8Gz305xi5If77RW41BBcC+d6ijOtC2aCi/iX?=
 =?us-ascii?Q?o2gYBU2BN+Fk8OI64Sjs1FMlPY7hmAWWRDVdfCuiZdYuFmu/dOMXP5jtHLlo?=
 =?us-ascii?Q?Mm5QZyeSh51MlZul+jqo+xuZnnuWP15mpeCEv/WPfS0yO0b/sPdvyKTkvZHP?=
 =?us-ascii?Q?9shfplJcN95ihTx4UXBiyIDtlECivHy5j40mvjwPovur16sl3g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?agDws7ZCle0MyXN5LI6untOKJcW/MPz8BrUXKEy3jZZPFK12XrUVjUqfa2op?=
 =?us-ascii?Q?LC0cr0znssBAeKNaAWXBAfsrNW8nah1r5FrMt1MPBfqhWv2kmGPwyrAgXmeZ?=
 =?us-ascii?Q?vpfj4DodzysM061VsGceR3bZPBTT11CWqme57z6GYf42tl4ppe9SdsdG21iz?=
 =?us-ascii?Q?JYnHmqiFJvX0u+5IEd6gyVnqFKr+6EEyGIrO0DGtQ5OyphSyW3b2LgejgKbp?=
 =?us-ascii?Q?24WHCAx3DSiL1SN0G7wp+F0aIszcrP/57jJrrmGsdRadxHyYPGaZh2GpZ4gN?=
 =?us-ascii?Q?ssYjd7pFuR9GvhO8r2tiwJCbbaKbqR7s0+9/c8uv4U2pG3n5QNHnn95QIpbo?=
 =?us-ascii?Q?/jp3DN0zUaI6zb1BvnnmAqKrlCVpvRo/onlhoPDguoORmnY5CpQKtRkl4NLc?=
 =?us-ascii?Q?5peKzoL1cMV9fXLAjM92GnbxqJq3CI9E2IsBShL9SF6BYHFcKCZD2jTwuqyj?=
 =?us-ascii?Q?MN2eth3942yEtpL0qfWJ/GnkpkTFp1glkawLPn6hgnDK3DC6kpJq2y24OeVk?=
 =?us-ascii?Q?A8O3fizAaCVwZKfnjc54UBk1F91+Yk1/cqEsZ5eboZIxqmHaQ5LhuvX1dCJx?=
 =?us-ascii?Q?Ty4+riAztrw6DkjyARktSI30wNAtkyRLus72rcuG6NhR7d+KaX5XGZrcMZTQ?=
 =?us-ascii?Q?mWt+ecDvVpWhcDVBZyX6MFg7ZxXv0n0F4UnLXIESL4Mr9RrV4Cdgruy8+ci7?=
 =?us-ascii?Q?4zFh8UtjprPwGyfRq+Xu21ijz/A5Fa/8SBSx6Idam9EpK1JjOTwMSb3keqwK?=
 =?us-ascii?Q?t+Mq0BFP4QM2zlVrfJykrLHuyWQzxrPaL8d6gqkSbWRO6eS/Jw9Y74jRkDS4?=
 =?us-ascii?Q?oEKbQAOKnxRac3biUVCy3/x/dfGdIHmHEMI4sGQgt9fSVM+hQ3BzZrbBOEm/?=
 =?us-ascii?Q?eyQF4C01vHZeqNHyNIJxldyLuZbILZ0DCxc859S/vi/AerKzVP0vVtDcdv7b?=
 =?us-ascii?Q?BK3C30JiY8TAr6zpNCx6h9Bai3qScfr4oQucw+P4Bj65EB18PjsENlRem0II?=
 =?us-ascii?Q?L5rZCn1apEnfB+wXgMe/G54Dew/UEyTXQXgfnYiN4tGZlNcdOeXR0wNvlksg?=
 =?us-ascii?Q?bGb/v44tpGnFD3VJUKGId0as4O+rCmc2X8mRAp5/cDR2uYeQQtKj+QfwvyKc?=
 =?us-ascii?Q?reJw44WNCzUyOtdhBa3ZfULU14H1XoAENXratnQqEan6CDfMuAnhkkoDFdZw?=
 =?us-ascii?Q?7IXLjg2W8JPiNBoJEeflnbrlm1Qi5JjhPxDkWQiPTx+CiitwBzLxFNjidkyX?=
 =?us-ascii?Q?g6dxMfsVcNULo56z0FLICz/NYGlOsEl7nazs+Vv2IuqPa2oQxDOFbJrnPdGg?=
 =?us-ascii?Q?CfrBfLhTmnGz+UQf/gllYrsPvuzXRTK8R7dlUFb3DmDQcdsdRntLQiPtevuG?=
 =?us-ascii?Q?M9G/04Ci38GXolJnzU/7nB160AHAGyhE1KobqFHLEj5q7zIGpFmqK0WXlD3O?=
 =?us-ascii?Q?QSwYl1pWuaGwyKQlhyKJewo2Dt14d8Xysj8vCS+dBTZCERskGlzpHGRbRsed?=
 =?us-ascii?Q?c9nAjpQ61VYAGJLUkVDKyCh4BRcoSvy9FXoazsPR6DSIVEz7A5FPvE1JKPUC?=
 =?us-ascii?Q?ci7YWBOMS7NcDELJng/Co43JYCd/Ej4xF6o1KFeHy0X37gTsdeZ1mwFl2D92?=
 =?us-ascii?Q?rWhWuFNk6cY4Ovg4ZMRNxjA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16786cb-5b2b-410a-7318-08dc9b1ea26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 05:11:45.6090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKWL+ov7tmJM6xTUkkEchiwhB68d+9A+4h2BNHpHPOfrjMUeYD/nhIPohF4v8f1iscuK4hcgZJXqv9r3y8AwVryYPVOvukHixxFEfdF58JdOVQUPsxVQLX4FnmugQOjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Monday, June 24, 2024 9:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Manasi
> Navare <navaremanasi@chromium.org>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [i-g-t V2 3/4] tests/kms_vrr: Cleanup in creating the virtual mo=
de
>=20
> Cleanup the function to create the virtual mode, so that it could be re-u=
sed.
>=20
> V2: - Fix argument type (Bhanu)
>=20
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 2ea90cd8e..7e8885f16
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -229,16 +229,13 @@ low_rr_mode_with_same_res(igt_output_t
> *output, unsigned int vrr_min)
>  	return mode;
>  }
>=20
> -static drmModeModeInfo
> -virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int
> virtual_refresh_rate)
> +static void
> +virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float
> +virtual_refresh_rate)
>  {
> -	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> -	uint64_t clock_hz =3D mode.clock * 1000;
> +	uint64_t clock_hz =3D mode->clock * 1000;
>=20
> -	mode.vtotal =3D clock_hz / (mode.htotal * virtual_refresh_rate);
> -	mode.vrefresh =3D virtual_refresh_rate;
> -
> -	return mode;
> +	mode->vtotal =3D clock_hz / (mode->htotal * virtual_refresh_rate);
> +	mode->vrefresh =3D virtual_refresh_rate;
>  }
>=20
>  static bool
> @@ -741,6 +738,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	unsigned int vrefresh;
>  	uint64_t rate[] =3D {0};
>  	uint32_t step_size;
> +	drmModeModeInfo virtual_mode;
>=20
>  	igt_info("Use HIGH_RR Mode as default\n");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -767,8 +765,10 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	step_size =3D (data->range.max - data->range.min) / 5;
>=20
>  	/* Switch to Virtual RR */
> +	virtual_mode =3D *igt_output_get_mode(output);
> +
>  	for (vrefresh =3D data->range.min + step_size; vrefresh < data-
> >range.max; vrefresh +=3D step_size) {
> -		drmModeModeInfo virtual_mode =3D
> virtual_rr_vrr_range_mode(output, vrefresh);
> +		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>=20

Changes LGTM.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz):
> \n", vrefresh);
>  		kmstest_dump_mode(&virtual_mode);
> --
> 2.43.2

