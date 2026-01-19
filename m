Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E37ED4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A780310E261;
	Mon, 19 Jan 2026 05:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZxXBv+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9E10E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768801929; x=1800337929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FgZnT/cMSYouy0ZgrvkbhTMScjaGVnMsxfxXjn+AK8M=;
 b=mZxXBv+v/zWIad3sTTV5HbTGRi+8DtoOq5gKlmvq+0McQG2+9wAKJzCu
 jNehu5pQ2SpxW+cgVjF4/1VoK0bhWLibqiY2vc8d1yclx1XWbhAJ8cV9a
 lDcIK1akP5aY2Q+++PqDIiZyMaK/0XZ9+JKqQu75edCB2QuzPHcf/3FFl
 +P6xmQUUk2lxh3KvoothPfRUzbrxRWtkkpgiRtTaEp+Q49dBOT8ZPD3Pj
 mHfHD5i+BR749yQ0eKDn8nLtGfS+DvP/w7xqKCAa099PqOUdKnqQCT3gG
 rOB8Fv6kkqwTinU5zN0qle2QWZCVmzWy448JumFPGToP1PU/E1Xtjg6By Q==;
X-CSE-ConnectionGUID: QdLCz0faSrCySRUM0CaQ5w==
X-CSE-MsgGUID: Li2CzUPDQ7+bNjCyVlTUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70060069"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70060069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:52:09 -0800
X-CSE-ConnectionGUID: ak7Us0JbR9CbIEdIpugAGA==
X-CSE-MsgGUID: alveU3eBSsScPaTaaAvDsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="206206727"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:52:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:52:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:52:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:52:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJtHl3rLuIIiBE1RfF+4jRHDuJWJXMUOwbyaVkAvQEZt1SoE3LTzat97rb2zKfUNXTtX1S6xvlOIBKRkeA2jbk/O/yewUMy8AgKzdLOXDH0XIISIn+g48d7S7XsBi8ogS3OWqoJeStp04nEPbAY3PpbKKGpi7387favKf6LIxMGUk2+z2j+aFyVFWf32B6kIlGzmD+Fr5Ya0xX5zVDipeI5wgQiSe6R704TH2tTvTNsgm8EU7u2A2kTSc96wD1yMoIot7v2UthNYeW3OS2Z0L152lrePyihVHVuhcRgPSxLtWSkGs8r99e8GHC4KXgQ1CMaDYHVfCAlBqTvXxgNRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ozc5BbmyzFqzwOROVAelwR2u+5MzcMsYVAVtpcnN7cc=;
 b=TMdSgSa2EkIs6CE9DNvjjrzaaFl9dOJtaT4UorTWXscQJexon1GIqNrKOFUR3NEpg7/cboaI52Mx1juW/Bp/3VgJikpMldfWGxFtiV6qU7Eu6D0Y+tEl786+XCxZLpohZ9StctrYFT99mifsXkjtB2h4kmAC5xPjfHKoV3d43/CPrQUtd5hX23EnilyveetzetkZfy9kdx36XUIxPZJw70vSD4FX6j5ynsGiq7ZKwMkSszaF4gZhzXf3tLjHHguzo73DhLdEwHY8LQkhJWOOmZYEPx4RqCAXXluBDTOA5oBur60FinPjm+Qb0Mj4rHPkYnrOaPRCLe8Uh8xiA3xomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Mon, 19 Jan 2026 05:52:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:52:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Topic: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Index: AQHchq6761SRfMXkkU23a+oFPW7+cbVZAUvg
Date: Mon, 19 Jan 2026 05:52:04 +0000
Message-ID: <DM4PR11MB631227E6A3CF40A741D48D7B9088A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
In-Reply-To: <20260116060932.523060-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA0PR11MB4702:EE_
x-ms-office365-filtering-correlation-id: a575fbea-1586-4605-3a34-08de571edfc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1BfD9zdaBQTMisuDmJLwd8kgQ5XJtf6kbBGVG7/lHYuvyKvGBLU5k/IpWljC?=
 =?us-ascii?Q?k07zc9PhXB1J7b3JNHEkZGrIfuFxqxXDv2UQMHirdx3VFaIXJEBFUlAVS+LO?=
 =?us-ascii?Q?TgUtp0W2WRjCqNn6G4gDBdRWyWPOLzOeJAMcSvb6bLT8hTILb3LGxe/jazAJ?=
 =?us-ascii?Q?Fxl3Fh0NGsED411MHQrv4EZ6Qu8bAJEubRTMwq05A1IVa/sNER8TcQH74sc9?=
 =?us-ascii?Q?1Jtg1EsF0ajyKQ65sy7sHeY3IaLeK+UpoxHcEtyzgo4BPYAlwvA7CJ4o8MAK?=
 =?us-ascii?Q?6FsZLCDEjKdh6AbMElbK3oKnszrNfXxy6w1MsyuYPb6Wg6Q6O67KzxuchgJR?=
 =?us-ascii?Q?+13eLWe6C6LwzmndOLTKtxFG19uze02GAFt+TQKu8e4g20rcAVJJAfocVz8a?=
 =?us-ascii?Q?Ro/wN3+tGU1R12tVIS/vlr6aVseIQZUu04CawODNjK3aNaWictGiD9tbf17g?=
 =?us-ascii?Q?f/zttmiiJoLGjDtJ4iptZPmQWjGoOTA1S4GHv5NvVt7DHwed8JpfOZ2jQdeT?=
 =?us-ascii?Q?PY0c5BZwLOJ5E5WJFyX3CcjqIEZmgk+/qdXYKipuubvrXJghoeKyjlTy9Vur?=
 =?us-ascii?Q?U1GTBhQLAI0HoXIQ4dO7Qs1u5Tl/M29ULRFzB4pp8cFs6qyGRLRLMKqAQLYL?=
 =?us-ascii?Q?twC4TeBEeRNrf4jnRi87mQYurklquw5ohjC4kUs9VTbK6O3gEADtj4wD8BAv?=
 =?us-ascii?Q?7a3Gk/tTaLH+3TLHgPCmOzNEnRWRaUCtLkVntw3gSKPbABWOFFUATajFLzP9?=
 =?us-ascii?Q?oD7ixp1zcMAdcESCvXfLKsvwAp0FSO4pARMV+V1wHromIAnkk/reLugtku3l?=
 =?us-ascii?Q?ZlxuFhykd1/a0BVHKyRPBuQAkbfzFReizq5onvGfF5MKljYZJ6DA9mvMqgxW?=
 =?us-ascii?Q?FkGQ910688QkyzTI7RXUspLfcHDYX+ZqfBNry/5Wv/lTH9DlDkBmpo+gCQCc?=
 =?us-ascii?Q?IQ1HHB/2YOQ/NQJn3Hk4jpJynCtTrvNSi9b3p2U7fk+al72v6AHW5aXcALNf?=
 =?us-ascii?Q?e88H+eDYYQ+2z0V/NoP3jcEDJHS0jm6fqVSudpuxTP8UwV/eqrtLuHrOc+cH?=
 =?us-ascii?Q?wNbiBADShJLfIrleV+gw9hsWZZlmlxo1s2yIfvD/7wjbYSyrXxJ0eAM5T1HR?=
 =?us-ascii?Q?3gc7qbbc3BaBFmg40S1ObGQo/l+roOgC7HCCa6koxDUwz7UQxkcqySC5RhC1?=
 =?us-ascii?Q?k2ig2V1j5ksp2T/Eg9McwWjYBP04AjrhNS9YCDAAMtQssLETIYSQpEF/YLWR?=
 =?us-ascii?Q?dtN4VrQeBIRevqEdziiqVBM3CW6GJoXxVPqUgTbi+zZZtm6AjxtxATF+URKH?=
 =?us-ascii?Q?AX3NE2PJIPLGcGN6EdjrRqvGzxvP+gTMqdphUU+e1zzCwT7ogAWby5ege/yB?=
 =?us-ascii?Q?Smu/mQAjIjbFf9SaR62c3gYQe44pIMNAqBLLVR6WDqHFRX3gWpw69eDFDaR4?=
 =?us-ascii?Q?WlsGXLb/LOefZiSjndrW2ouvIvxoCCjdDgmmtdN3Uu/8lJ3FBW/J4iH/nSJB?=
 =?us-ascii?Q?rcr/bZSYs1K/2Vo6Z0neM1lfcK/kTDU4xDY5bTrGf/v+zvvPwv0ekUbB7Ur5?=
 =?us-ascii?Q?PZDdR67YNe/X6XLRGCQYHyAYJAzRKRkfahRJjQ5cJjlizxYzm069C1C3ssOw?=
 =?us-ascii?Q?Si+z9XUW0zsnhGnr8HHNwYg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7VS3CHU5GqJBsN9QSYrg5TGdo6ETIeUrCV2k1NI6Q+PSXzfGubmEghYY7yvu?=
 =?us-ascii?Q?EojqTdnOTWVpJf1fB4AILVw3hLmubzbCE0p1y9m6NbTVCVXqx3/RUJIsMU2L?=
 =?us-ascii?Q?OFRLvume7/HD5j43p7DhA3LZYOcDhG5xd8bO5jrdAbh93Eq/pEzdhShKkKNC?=
 =?us-ascii?Q?iieup6JQYpbG5T15Ps31/JLnuPfAt162wIXuFtR9pm70MRRas00/GhaRzYzt?=
 =?us-ascii?Q?B6fEFNBesHyVTNPA9/ArSxaX1Vth+3UHdmSe3KoGId7opUWZgmgQo9tRqc06?=
 =?us-ascii?Q?ZThuw0KUy9SbpCDvoDeZ0yRD74tbd5ROW52NnK2SoWEwq3fHhZ9vhEU7m8n9?=
 =?us-ascii?Q?hua/jRM6a1jdOYqUw6jQnPNY8eK6iX8XWrelsILO8vmvqZulcwU9uNoXWgKf?=
 =?us-ascii?Q?N90m3KHT5s0VOgpvfuDBBpwYFASXro7VQi49FaEfv/WWPpCbP9q6BBAKorAG?=
 =?us-ascii?Q?TGVA5gBq7W5BF+5p/bbjIVujrsqwexcjQ+lBuUE4TwPfenBc5nYWgvJGn6JP?=
 =?us-ascii?Q?QZJ6BqbnDuTIh72PVhARWCHEPJoRPcIAGIUHeRvRGFVVbnivoiQsuXWqRieZ?=
 =?us-ascii?Q?+W81UH/UopTfta26ogDb83b0cvRRdLSJ7PhCmwHJEYEwhONiN8t5/xNDlqMl?=
 =?us-ascii?Q?VNOy+nzf9yZOn6F+ft7N+KdYYsD5KInCETa5MVqrBINZXKxW8hZjTxUWC5qx?=
 =?us-ascii?Q?Z8lUG568kkCJjqzRktAX0HSzvb4bgqYypQhBn9y/PQffP2PV7OB3HUXuPDej?=
 =?us-ascii?Q?lVvJqU5UE8SFnDbAeisYHbljAzIskP8JV56MFj179nBc14okjazYVMWQqvhm?=
 =?us-ascii?Q?+ivmcujPuWLZfCDH5Jcs5IDfic1NIPtfjEZiVGZ1i5qzPZt+xuj6upQQm1/b?=
 =?us-ascii?Q?lsubmjPVbAs3nY5oti14nIfPy9c0hp1w7rP2i2FwSO9oyoFMWBMnhjHYhewS?=
 =?us-ascii?Q?yAzSo4xV29YMJ/1n8BvAdmLBAVvEsIXJFxE3dBdEFqrVQ93f180ZLEdyxgtp?=
 =?us-ascii?Q?+vqye5/GG5DVY5uuFYdErzdaPWTo8G/V63c0/wmef4lZ5POIuJuIh3Ifj8UI?=
 =?us-ascii?Q?0gCYGuMCjImEQpqhIbWyW6Z8p0yVyg90UDDuIJ+fbSMr2SMs76UTDKu1n1zg?=
 =?us-ascii?Q?vNTwvcg8uogSxzwbHqOG8M0E5rFT/+rGoLotU+H0uEBtbZ/iKmwooUF9IjVp?=
 =?us-ascii?Q?lw67ACbjFes8nIEzPQsJ5FsWHNqcsVtKrYOCNU6Cx9/CaFPoNxqhhhKC1VGM?=
 =?us-ascii?Q?K0W8vX3HE/TjIWfCo0Pb35Y9x59wtAncVu0dPYvdjqDtt+QMxKcDjyQIILiv?=
 =?us-ascii?Q?AN6STRbh57YE7oqGpdgh3kB9d+Lv50e0CrjZR2zTYN1TNuKHrrZe96E8vboH?=
 =?us-ascii?Q?m4Im3XBbBegKfll+3qlCZSSrLrHS+J3egN0o/RLE36C1doHLgHs29ZN211+j?=
 =?us-ascii?Q?rNRds4poCHXpi7uj+sBr40rVDZb6m0getRQVWhyyW/vSaorzxo+O6qKfWnTE?=
 =?us-ascii?Q?V1whMfMRW+PYDGvqe0SDLjPHxQHc+hJN+JtyKKVeZ0AKidWxSk7qya2fdgBY?=
 =?us-ascii?Q?zjcCzF1WjVB8udDHf2r+oFeegiaBtBdIPASMaMPc2ZC43jg9t7U8i31iN9HP?=
 =?us-ascii?Q?eRM1lfIv34TjBN8oLCo+24te8irYIzd+Nd0O6f3qPSKPTc+TIfvlQDwmN/UI?=
 =?us-ascii?Q?F/RhUbBOkEIy4TuQCqVzgh5QmHT5a+Hlh87dyd5Kq6hhhWsM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a575fbea-1586-4605-3a34-08de571edfc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:52:04.7898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pF2QZqft63GNTsjYngba21MLWDIDz+g/qLBwhQgySJtoruTn+SBla+W/nAn2D3XUMP+ZlOGjQYO3ISSzMBkDKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Suraj
> Kandpal
> Sent: Friday, January 16, 2026 11:40 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for cur=
sor fb
> leak
>=20
> Add the vblank wait even for i915 as the legacy path uses the vblank work=
er to
> unpin cursor fbs.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Can we add fixes here if we are closing any bug.

> ---
>  tests/kms_universal_plane.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c in=
dex
> aa5927cdf..9ac6d01b7 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe,
> igt_output_t *output)
>  			    COMMIT_ATOMIC : COMMIT_LEGACY);
>  	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>=20
> -	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	/*
> +	 * Since unpinning of cursor fb occurs during vblank in xe, i915
> +	 * specially in case of legacy commit we need
>  	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
>  	 * 1 additional vblank because vblank event is scheduled before
>  	 * unpinning. Therefore add 2 vblank wait to ensure that all
>  	 * cursor-related framebuffers can be removed before counting the
>  	 * framebuffer.
>  	 */
> -	if (is_xe_device(data->drm_fd))
> -		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display,
> pipe),
> -					  2);
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
> +				  2);
>=20
>  	/* We should be back to the same framebuffer count as when we started
> */
>  	count2 =3D intel_gem_fb_count(data);
> --
> 2.34.1

