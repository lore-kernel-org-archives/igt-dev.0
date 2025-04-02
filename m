Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F9C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A22810E082;
	Wed,  2 Apr 2025 06:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXr9GBx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF6910E082
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743575155; x=1775111155;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1+HkpUOAbmq9dcpkzfhhIB79Cf72EniMAIxWdZTA2no=;
 b=cXr9GBx9ZWeu6Wl7eUWl218/z59m8Ee4IhF+dMBq0bAFO651MVjjzgOs
 qbUsEGCtiV2eq3jSllB/gwIiz5lJKcesFiSMIm6ab16afoWPWrf09aXLC
 RwyKAeCnb3v+M2Y43OfPS62Ks/98FitMD9hajYJRSCiEyxF/nHZ9z8p2K
 rfUicm5l6jJBK9YKx6hFV61TrBXJ034q406/I6qNFMyoApmT2Co9Lk7rj
 2MiUS/7ccAKqQEgPVkkVOo/jF9pxX/6IfjfMKhw8YA9fFGaWgMQvHqXLT
 eVY569pW2V9cDg/EcqYPM3QehzrEprX2htkuYWB846Sjffzpc06na58Md A==;
X-CSE-ConnectionGUID: Wf1wKlonTuKBx5kXNt/uOw==
X-CSE-MsgGUID: wZmrZjneQjyvAcGPs1ISiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45045087"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="45045087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:25:54 -0700
X-CSE-ConnectionGUID: Q61UZ50ZSLu0JDVqc9Wr5A==
X-CSE-MsgGUID: MUipQpoRTNmOkFi+MoGaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="131792784"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 23:25:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 23:25:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 23:25:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 23:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0BF71xJcNVoqx/YpIyIUh4A/FwLeTlWR6U56a+6l3AJF1OnkREFwFFFscW5Q/v8tPpQ3OhyuHssRDbxpMQsWbp3OHXDR5sRQP73/1aCGWqHr/H4BaK8YPg9+xvi5OpnhAPD2rSd0LRVs1kYjqF2G1teaqSOvf4DnG7sha1nyzaZqL0SLuuMf95FGcOl/J5V3dIgqnhC76HBg9MgSLD4QaovSvIrTFGnD/D1S63M2yZcMNtjCqYl4u4jdoCih1kJyP3JOuTGBlz+VNNg4n/PzfTwz6te4qfLXE64kwk9zsvSmcEs5G+gqoJV0cLEJzBdBdpSAqfgimSuUrTxgwr+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okoPBLlRaUoNEma1yIP9d6Bp+Jbc5ZrnwvvlRS3x4IA=;
 b=peaanVPuOzUp6PyVt/3WQ/3/pva4Y0U72q5EU51MGDjfrHrAkT9V8iOTdk1QDFIrD564twnbvR1+JIk70/7aUuVan9JW7u67gO8l11/oTBHS2cEpBWdrboWTRSRtP750PSKe3c7pA0+0zCUOgrIMoHmYIa1O+z0s82ODzg3GmzMSzwImSgx2/a/SPSu77wd2cDsmkY5yKcn5M1VDGDN8t1+dMlhYXWSVoN0r2MkQEg9FjfETZYwVMlOwoutq5eDkrQOyjjANsUWzk90YB4j+Wc8CBEHVvssRzGSr6j3o4PVUOWJ/Wp0B9h0LvJqdU9epYHHE+ZFRGngnxkK92TNIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 06:25:49 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:25:49 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH 3/4] benchmarks: create xe_exec_ctx
Thread-Topic: [PATCH 3/4] benchmarks: create xe_exec_ctx
Thread-Index: AQHbo5U9D8RkIeHWE0iuwDhC7bUydbOP569Q
Date: Wed, 2 Apr 2025 06:25:49 +0000
Message-ID: <CH3PR11MB843404141379639F9DE2A6358DAF2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250402061033.659931-1-pravalika.gurram@intel.com>
 <20250402061033.659931-3-pravalika.gurram@intel.com>
In-Reply-To: <20250402061033.659931-3-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: e6b240d9-2225-4fad-4f4a-08dd71af35b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7QszC2X1lRP6IMiL5lHhzC2+cniPrgvmdohTIgJa8MgJnzWO73GZAZzq0JGS?=
 =?us-ascii?Q?JnI9onLRdDVN/DBQzBJH2rZp45ZorzJ+BL+OA7KFisHxaSIyOe1mPKChPaI/?=
 =?us-ascii?Q?TC3Y7XfYcA8P42s5uFVHolnoqrSnuPjzn5IdCibFN1UXmZJBIcZ7+N9oSurJ?=
 =?us-ascii?Q?/HrYWcEKDbo2qxcs2Is7Ln5eUmk7zUkEvYu7i3uSXPpsapj4JmYZtZKjIAho?=
 =?us-ascii?Q?M9Wb2WQN0GBkV5laqggq6QTmYEdWK2/qDuWfP3FcP1Jv2g+J3n0S8OhwmT0Q?=
 =?us-ascii?Q?LI6VDGicwzNbGbIHDy4iuCj9zFPrEGyuxNg6hNMmhWxPgHi2bDR3hFMy3t1I?=
 =?us-ascii?Q?Q3ubUx3zBVm4eV2RylsrgxtY+qHTZrAblJg5KYMU3uatm8Ou5yHyKGu8sCy5?=
 =?us-ascii?Q?N09EVL1GwhSaJUMOpvkAPWt3OnfMjgzJaQfIrz+/6xjwGLFbH2vDGgNxX+lU?=
 =?us-ascii?Q?HytXvj71eivjnjubGRvZpx2TJgZGphLQj6xbI7BWG8CLSzByCBeKWvHsE3Vc?=
 =?us-ascii?Q?0934K55A7VadBYyePvFA4sQ2hAV+Z1D5aJRD0Fp7tpNeTeAElUDyd6aSaf/G?=
 =?us-ascii?Q?onaI1cHchAfuAmeJLnv2jZLdZge0pBfQhGVvQlu/fZoLEPhjGfla5sbEIdsr?=
 =?us-ascii?Q?MXwR0SCRHNVopQNJZ9cyMXVRjxgjQh73oAXqNj1fcqgR6EbFgVd6dcRhjvRi?=
 =?us-ascii?Q?2gaKfDjgKshkVG5aoQ059yMblP7aFNX0ss8kzkEc0tn/SPhWFUj6ydi+OUQU?=
 =?us-ascii?Q?FFVrOnr9ZX0u3YFdRcciRH/vH+9QTfdXnAWttynkAfMlCmQ5zhGVHaDOQmWn?=
 =?us-ascii?Q?gbMyB9ITipItNwzHUOI2gXGuAkF/BREzL2ynj6XiSK+v1dMuiN+hXg1uaazk?=
 =?us-ascii?Q?r1teYoeEfZYUFW2cB3jUAKVw6MYoqrB4KNIj+9M5TLG//xjIZO5g0S0lHVGf?=
 =?us-ascii?Q?oyrhjuSAbGa0SuuxcnflTs+G4aUcP1eL1psOINnZAAEds8qKiHVdmvpVZ4gq?=
 =?us-ascii?Q?mgf2H8TwQe1hYlM9Mq0vIwlQ9klWDOIQ8TyA4hfH2iAd8Zd3el1ueLwfb6j/?=
 =?us-ascii?Q?l+UUZAYtF6ZHnTXbI7BO8nIOiZZmYbPHoRAYPfCOW3sB5CvlMQc0Bcab6ZtT?=
 =?us-ascii?Q?ayOLlNM3tayTZsODvKl0VbFQjGIWDYcFMPodTzXP86TYdXneYsPg2kuj3dqx?=
 =?us-ascii?Q?5Dwzh0mR3EJ44Hz6pk5+hHXzSOpWDDLIi31Dg4cdRcggBNJf4LunlSaqxZZr?=
 =?us-ascii?Q?o9u3KxQdJl25zw1AfWQYCsDwH0OoG41/nE0rHibAb764abAOA7P7jzKHgU6W?=
 =?us-ascii?Q?LgsvGBrctHawRc+Len0yhjZPzSgRQgcYSep6Ki4wMuItHHrjIgh8clJV6VYC?=
 =?us-ascii?Q?Y4NXRe7F/ISauKoiBg4LmWB6xVru7c5+WEVTo7BAb7RgY1XqYHCEnpafxug6?=
 =?us-ascii?Q?6ECKgnzisY065b5xFqCFCItueGOWxoEB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?azO56MUitMM6ubwZ0eMLxrkT39Cjyt5VA6jkJob7rbwc/F/y/IxDCjy0Km4c?=
 =?us-ascii?Q?/xautcDOYgIIcmpQSO30a1Ws/vJUgjvCSxo8wxKYrmcDYPxnavArhKXMmcRc?=
 =?us-ascii?Q?uQOFEcbWXuvLkOOzGxx0de94fDsU0ebKCooPnRv+iqZCpes/08aMGtCjepP1?=
 =?us-ascii?Q?H6HpkXyvv/S/z+Y8fD3VTLHQcAqJ5vHxrLkts9Pn1hjqQURXFT/Z7wiOgTsc?=
 =?us-ascii?Q?vaOhh/vY6Pn/QkBCZdf7PAsrxggXTePqHarBLYzwUjBEP4qZs8C2Ks9ndu0Q?=
 =?us-ascii?Q?gupohS9blFjskH/sEuuxIImw09e3+5pjYW1xOzBjHZX4Mpl6HPgVV4koX3iQ?=
 =?us-ascii?Q?A854Vht04lntpSx1mkpISPdsjbEzTuPVMjk0cpHcbnhkAyRUQoDx7dXk43t5?=
 =?us-ascii?Q?mntTm/nxk7tfAqmvJPosrSkQJ2KohPZF36ARwFVi95HOWvsHjQjpDhivLK09?=
 =?us-ascii?Q?iQPnc0pya49WNtQTCK6rgNQSCKjaL6+7ywDX4SZTJ1sBiiuW7NQEjlO0hwlp?=
 =?us-ascii?Q?h2tLG1PQSmxfQwEzNqtJuT0Y3kpSdR/GuzL/fezal8Ilg9JNp49vZbZu5W3r?=
 =?us-ascii?Q?tFrILCqXVF1ONA5pHp4hHr1CD4YCUdVBFwEEKvRK78zriNPFV7UxSMTkKwRL?=
 =?us-ascii?Q?oGawdj3BCZNVk0LETZQywzMHaXUn+CEzynQpG/j4BuUEmeZPkmHeF0fCGlM1?=
 =?us-ascii?Q?Y1v0t59N95KHaMuuve5v/hLXA5FXqvVfMn7KIiFuuYM8HLiMN1yHFGIrY8fU?=
 =?us-ascii?Q?gcCxXOd2sXn1OHWl16xdr9TdzrsCbNeBCdF1wnSBak1QAFk6U6qmfIaJOrYm?=
 =?us-ascii?Q?dhgHXl6ZUhlBmf6HOw5Y4G4kxNNh4+2CVaGMUP08miw3iZ3+eOuTq8VMKLIK?=
 =?us-ascii?Q?GlY814NlC3DNOTOg41Jt8JZqcORkSgFHqUuWmljI9I6zyIUSGHl/jQKZP6cj?=
 =?us-ascii?Q?xEcS55f/v/Pm1myQiwjXihMuI1Kh4DWPVNag4iT3XLG41fp3nDOECHqFVjGo?=
 =?us-ascii?Q?wTNDRrpMgaWs9yxsPaM/FSClcoqw0Z9UQ2pAMFQNvO7veVAukQVnFmDn52D6?=
 =?us-ascii?Q?Koe1o/3Ji6Z7bgWVA3ZmG8RbmFTQdtdKhQbHF+4+4FcBB5ZXogCTiXylXSCy?=
 =?us-ascii?Q?Lmq7f03lK7HQ11EFLuiupmzneVGV9CwTKvzOVei584JUz01AFUXwGWq8v5dW?=
 =?us-ascii?Q?pGJ8aPNJguwb3XCuPMUb2eN4o7E3KXEOT9miQUeNycTDy+AkCib3p4herVQ9?=
 =?us-ascii?Q?74rZGPydoGN9zMCAgFtaCJ6/1vYrVguHCQWswAq3x+qp9M5NbYQJoVFK4MD1?=
 =?us-ascii?Q?5X9QXX/wJzfpdukCmjolniaoXMrdQA8bmP3VDb174PRuCw/Eo/sUArVHfKu7?=
 =?us-ascii?Q?ssKwcU3HuN6ZBvZbP/ibeOI2/U3mOJmk6tsNSrNHnDNO0FT64HiiOReNDQr2?=
 =?us-ascii?Q?cH82CdON6HTX8yeWD+1SbgJpkZXHEG02+gJwD5UkoO8HHAzmo9mbHbEhJCyI?=
 =?us-ascii?Q?CrcT4ofEQqml/q9U1mmh98O9I/w0XFOPWju9GXcCsNgTV9diHCBSbzqLBvCM?=
 =?us-ascii?Q?uYNenxCu5UouAK2Kfet/sEJuWUxtvZ9/fvd6fWHQIrMrSRozCPXMIWK23Nhj?=
 =?us-ascii?Q?u3f3xNgnEki5LniY6HniGXkoETJrPYPV+Qqp/U2S3sAFTwl7RXji2o73v/yk?=
 =?us-ascii?Q?gn6x5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b240d9-2225-4fad-4f4a-08dd71af35b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 06:25:49.0321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJzqc63xFX3m2eS/mwo5LcM56f+wXn0lTNu4G3po3dR7+iwT1F4/bEuzohleYHnJN1roQKrlQs6QfAjRSUcxkjbKvxhYPZVZfnhygdyFW+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Praval=
ika
> Gurram
> Sent: 02 April 2025 11:41 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH 3/4] benchmarks: create xe_exec_ctx
>=20
> Measure the overhead of execution when doing nothing, switching between
> a pair of contexts, or creating a new context every time.
>=20
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  benchmarks/meson.build   |   1 +
>  benchmarks/xe_blt.c      |   2 +-
>  benchmarks/xe_exec_ctx.c | 332
> +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 334 insertions(+), 1 deletion(-)  create mode 100644
> benchmarks/xe_exec_ctx.c
>=20
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build index
> 00203c62e..f29d5a288 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -23,6 +23,7 @@ benchmark_progs =3D [
>  	'vgem_mmap',
>          'xe_blt',
>          'xe_create',
> +        'xe_exec_ctx',
>  ]
>=20
>  benchmarksdir =3D join_paths(libexecdir, 'benchmarks') diff --git
> a/benchmarks/xe_blt.c b/benchmarks/xe_blt.c index b6fd290a3..00f8be87d
> 100644
> --- a/benchmarks/xe_blt.c
> +++ b/benchmarks/xe_blt.c
> @@ -39,7 +39,7 @@
>  #define BLT_SRC_TILED		(1<<15)
>  #define BLT_DST_TILED		(1<<11)
>=20
> -	static double
> +static double
>  elapsed(const struct timespec *start, const struct timespec *end)  {
>  	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start-
> >tv_nsec); diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/xe_exec_ctx=
.c
> new file mode 100644 index 000000000..f84d018d0
> --- /dev/null
> +++ b/benchmarks/xe_exec_ctx.c
> @@ -0,0 +1,332 @@
> +/*
> + * Copyright (c) 2025 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person
> +obtaining a
> + * copy of this software and associated documentation files (the
> +"Software"),
> + * to deal in the Software without restriction, including without
> +limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> +sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> +the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the
> +next
> + * paragraph) shall be included in all copies or substantial portions
> +of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT
> +SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> DAMAGES OR
> +OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER
> +DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Pravalika Gurram <pravalika.gurram@intel.com>
> + *
> + */
> +#include <stdio.h>
> +#include "intel_reg.h"
> +#include "ioctl_wrappers.h"
> +#include "lib/igt_syncobj.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_util.h"
> +#include "xe/xe_spin.h"
> +
> +#define MAX_N_EXEC_QUEUES        16
> +enum mode { NOP, CREATE, SWITCH };
> +
> +static double elapsed(const struct timespec *start,
> +			const struct timespec *end)
> +{
> +	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec -
> +start->tv_nsec); }
> +
> +static void
> +test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> +		int n_exec_queues, int n_execs, int n_vm, unsigned int flags) {
> +	struct drm_xe_sync sync[2] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 2,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +
> +	uint64_t addr[MAX_N_EXEC_QUEUES];
> +	uint64_t sparse_addr[MAX_N_EXEC_QUEUES];
> +	uint32_t vm[MAX_N_EXEC_QUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_syncobjs[MAX_N_EXEC_QUEUES];
> +	struct drm_gem_flink flink;
> +	struct drm_gem_open open_struct;
> +
> +	size_t bo_size;
> +	uint32_t bo =3D 0;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	int i, b;
> +	int ret;
> +
> +	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> +	igt_assert_lte(n_vm, MAX_N_EXEC_QUEUES);
> +
> +	for (i =3D 0; i < n_vm; ++i)
> +		vm[i] =3D xe_vm_create(fd, 0, 0);
> +	bo_size =3D sizeof(*data) * n_execs;
> +	bo_size =3D xe_bb_size(fd, bo_size);
> +
> +	addr[0] =3D 0x1a0000;
> +	sparse_addr[0] =3D 0x301a0000;
> +	for (i =3D 1; i < MAX_N_EXEC_QUEUES; ++i) {
> +		addr[i] =3D addr[i - 1] + (0x1ull << 32);
> +		sparse_addr[i] =3D sparse_addr[i - 1] + (0x1ull << 32);
> +	}
> +
> +
> +	uint32_t bo_flags;
> +
> +	bo_flags =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +
> +	bo =3D xe_bo_create(fd, n_vm =3D=3D 1 ? vm[0] : 0, bo_size,
> +			vram_if_possible(fd, 0), bo_flags);
> +
> +	flink.handle =3D bo;
> +	ret =3D igt_ioctl(fd, DRM_IOCTL_GEM_FLINK, &flink);
Is flink present in xe as well. Please check it out.
> +	igt_assert_eq(ret, 0);
> +
> +	open_struct.name =3D flink.name;
> +	ret =3D igt_ioctl(fd, DRM_IOCTL_GEM_OPEN, &open_struct);
> +	igt_assert_eq(ret, 0);
> +	igt_assert(open_struct.handle !=3D 0);
> +
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		uint32_t __vm =3D vm[i % n_vm];
> +
> +		exec_queues[i] =3D xe_exec_queue_create(fd, __vm, eci, 0);
> +
> +		bind_exec_queues[i] =3D 0;
> +		syncobjs[i] =3D syncobj_create(fd, 0);
> +		bind_syncobjs[i] =3D syncobj_create(fd, 0);
> +	};
> +
> +	for (i =3D 0; i < n_vm; ++i) {
> +		sync[0].handle =3D bind_syncobjs[i];
> +		xe_vm_bind_async(fd, vm[i], bind_exec_queues[i], bo, 0,
> +				addr[i], bo_size, sync, 1);
> +
> +	}
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		int cur_vm =3D i % n_vm;
> +		uint64_t __addr =3D addr[cur_vm];
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D __addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D __addr + sdi_offset;
> +		int e =3D i % n_exec_queues;
> +
> +		b =3D 0;
> +		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] =3D sdi_addr;
> +		data[i].batch[b++] =3D sdi_addr >> 32;
> +		data[i].batch[b++] =3D 0xc0ffee;
> +		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[0].handle =3D bind_syncobjs[cur_vm];
> +		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle =3D syncobjs[e];
> +
> +		exec.exec_queue_id =3D exec_queues[e];
> +		exec.address =3D batch_addr;
> +		if (e !=3D i)
> +			syncobj_reset(fd, &syncobjs[e], 1);
> +		xe_exec(fd, &exec);
> +
> +		if (i + 1 !=3D n_execs) {
> +			uint32_t __vm =3D vm[cur_vm];
> +
> +			sync[1].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +			xe_vm_unbind_async(fd, __vm,
> bind_exec_queues[e], 0,
> +					__addr, bo_size, sync + 1, 1);
> +
> +			sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +			addr[i % n_vm] +=3D bo_size;
> +			__addr =3D addr[i % n_vm];
> +			xe_vm_bind_async(fd, __vm, bind_exec_queues[e],
> bo,
> +					0, __addr, bo_size, sync, 1);
> +
> +		}
> +	}
> +
> +	for (i =3D 0; i < n_exec_queues && n_execs; i++)
> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> +					NULL));
> +
> +	for (i =3D 0; i < n_vm; i++)
> +		igt_assert(syncobj_wait(fd, &bind_syncobjs[i], 1, INT64_MAX,
> 0,
> +					NULL));
> +
> +	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	for (i =3D 0; i < n_vm; ++i) {
> +		syncobj_reset(fd, &sync[0].handle, 1);
> +		xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0,
> addr[i],
> +				bo_size, sync, 1);
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +					INT64_MAX, 0, NULL));
> +	}
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		syncobj_destroy(fd, syncobjs[i]);
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +		if (bind_exec_queues[i])
> +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> +	}
> +
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	for (i =3D 0; i < n_vm; ++i) {
> +		syncobj_destroy(fd, bind_syncobjs[i]);
> +		xe_vm_destroy(fd, vm[i]);
> +	}
> +}
> +
> +static int loop(unsigned ring,
> +		int reps,
> +		enum mode mode,
> +		int ncpus,
> +		unsigned flags)
> +{
> +	int fd;
> +	struct drm_xe_engine_class_instance *hwe;
> +	double *shared;
> +	fd =3D drm_open_driver(DRIVER_XE);
> +	shared =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -
> 1, 0);
> +
> +	if (ring) {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class =3D=3D ring) {
> +				test_exec(fd, hwe, 1, 1, 1, 0);
> +			}
> +		}
> +	} else {
Is it that if no specific engine is provided,by default we need to use rend=
er engine here you are using for all engines. Can you check this.
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, 1, 0);
> +	}
> +
> +	while (reps--) {
> +		sleep(1); /* wait for the hw to go back to sleep */
> +
> +		memset(shared, 0, 4096);
> +
> +		igt_fork(child, ncpus) {
> +			struct timespec start, end;
> +			unsigned count =3D 0;
> +
> +			clock_gettime(CLOCK_MONOTONIC, &start);
> +			do {
> +				switch (mode) {
> +				case CREATE:
> +					xe_for_each_engine(fd, hwe)
> +						if (hwe->engine_class =3D=3D ring)
> {
> +							test_exec(fd, hwe, 1,
> 1, 1, 0);
> +						}
> +					break;
> +
> +				case SWITCH:
> +					xe_for_each_engine(fd, hwe)
> +						if (hwe->engine_class =3D=3D ring)
> {
> +							test_exec(fd, hwe, 16,
> 64, 1, 1);
> +						}
> +					break;
> +
> +				case NOP:
For this no operation that is you are not passing anything?
> +					break;
> +				}
> +				count++;
> +				clock_gettime(CLOCK_MONOTONIC, &end);
> +			} while (elapsed(&start, &end) < 2.);
> +
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +			shared[child] =3D 1e6*elapsed(&start, &end) / count;
> +
> +			}
> +		}
> +		igt_waitchildren();
> +
> +		for (int child =3D 0; child < ncpus; child++)
> +			shared[ncpus] +=3D shared[child];
> +		printf("%7.3f\n", shared[ncpus] / ncpus);
> +
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	unsigned ring =3D DRM_XE_ENGINE_CLASS_RENDER;
> +	unsigned flags =3D 0;
> +	enum mode mode =3D NOP;
> +	int reps =3D 1;
> +	int ncpus =3D 1;
> +	int c;
> +
> +	while ((c =3D getopt (argc, argv, "e:r:b:sf")) !=3D -1) {
> +		switch (c) {
> +		case 'e':
> +			if (strcmp(optarg, "rcs") =3D=3D 0)
> +				ring =3D DRM_XE_ENGINE_CLASS_RENDER;
> +			else if (strcmp(optarg, "vcs") =3D=3D 0)
> +				ring =3D
> DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +			else if (strcmp(optarg, "bcs") =3D=3D 0)
> +				ring =3D DRM_XE_ENGINE_CLASS_COPY;
> +			else if (strcmp(optarg, "vecs") =3D=3D 0)
> +				ring =3D
> DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +			else if (strcmp(optarg, "ccs") =3D=3D 0)
> +				ring =3D DRM_XE_ENGINE_CLASS_COMPUTE;
> +			else
> +				ring =3D atoi(optarg);
> +			break;
> +
> +		case 'b':
> +			if (strcmp(optarg, "create") =3D=3D 0)
> +				mode =3D CREATE;
> +			else if (strcmp(optarg, "switch") =3D=3D 0)
> +				mode =3D SWITCH;
> +			else if (strcmp(optarg, "nop") =3D=3D 0)
> +				mode =3D NOP;
> +			else
> +				abort();
> +			break;
> +
> +		case 'f':
> +			ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +			break;
> +
> +		case 'r':
> +			reps =3D atoi(optarg);
> +			if (reps < 1)
> +				reps =3D 1;
> +			break;
> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return loop(ring, reps, mode, ncpus, flags); }
> --
> 2.34.1

