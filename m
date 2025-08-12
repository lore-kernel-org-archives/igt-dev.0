Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F6BCA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 03:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B02110E0BE;
	Tue, 12 Aug 2025 03:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="askeli6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7B210E0BE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 03:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754970763; x=1786506763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zl3iPg/lrB6n/HESrhw6a2wQB6ow6eFE9StEeWFvxUc=;
 b=askeli6Nhay/TK34V0i2TgWilXgAjwxjKm6Vx56t7skH/IgFCKGSvxkT
 GoZ/Umc+9MsYLa1CwK7tSPCx8/MjF6ofxaAK2WUmtPAp0thiXKck1GYpE
 pl8q6cDdyP8IfFOxU1E3N4qKlA0snr5LosRQJe5WPj9nBY1fq8Ggwo4fu
 6ObmU5XlF7WH/GtRyXSI+LuLjFPh+vZ8ERUjnXTQhnlYYZ82bjRL0Ad4C
 d2xOpSK1aZ67vGn4ffXvuUi8Nj3M9zd7qtwg2GBH93FfbuYNoN6L0khH7
 mlUzymJwZpdQTztdCTD+iaDe6mgAagOt7/V1EdabH1SbEfFKZkXjLR2hc A==;
X-CSE-ConnectionGUID: LJb3pIm8QoKSQrVIzosFBA==
X-CSE-MsgGUID: /KiXeWPOTUuZ6ncZJjzJTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="44817501"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="44817501"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 20:52:42 -0700
X-CSE-ConnectionGUID: 2FgD/XdzT9eg31d1wVIY2A==
X-CSE-MsgGUID: ohoYSvsVSEyq0GnZ2vzO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165280554"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 20:52:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 20:52:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 20:52:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 20:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD0XYRRnYKqa/kl2e1UElVr28dqilt/f8g9NiFi/VwCdnO5Pvg6YXKmlMD2LhcrXkUWarfQvIVEyb3FGnKDa9pick8KlKz9vqMR9ubpUwDzbracZKdL1nFk6EeKf+pUXYBQj15VN1rRCWEUtcE4XSN6f8H3emXLo5O0eYr1vEI3NDcpMN7racEIAa2qquU34UfVzB1NqMRfHE/Vw8svNieDigThZw4BQ/t6/2NEabmzrrPCCTQQlHnfQXDlKKkdGdUkr55ze3chidb6/5jnqmPAgWqSTL2+I93frwNkgXgkqX1J0mXV7gqrLvnV9onInyPytYRSDymedj1g0gUs1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DothHWDPo5t5kgsBAAWIXuEbDB5B6xOs/uyveBaIdU=;
 b=e9zvynLYmshRoEbDEyRyoWfWDoUzBGiutgWQ2S0xwOsRycf+dsIR/aGaGqQaSTSclCyx4/7JGCWpPK+E/g51pu6IM9xhaoEd8MTZxdi/l8o9uS9FQ5+mtKj5yEhmmJl6uLqcGa0t+n20m2IBEopOPqeRw72Fl8aWHubfyCqimcBe3/i+fXTk6BYumKNnl+0GiaXMfok9FFKP8s0n9y/yQ9zhJibRh90u1S8nZkRNTYU0LCT08oAve99erAjEq52c6MRXzkjrbyPn7kCteT+DsLuSYxsH4kM2gTOt7a1FDqz3F5JtEugYdhFwXS+loxXD9JRW3TmMPjpr6tyVx5XofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6829.namprd11.prod.outlook.com
 (2603:10b6:510:22f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 03:52:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:52:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Thread-Topic: [PATCH i-g-t v5] tests/kms_content_protection: Add force HDCP
 1.4 subtest
Thread-Index: AQHb8koVohfN/RZfEk+BjfY9BE+CTbRekxOg
Date: Tue, 12 Aug 2025 03:52:34 +0000
Message-ID: <DM3PPF208195D8DA8EEFF02673EA071FF26E32BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250711095249.1622000-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250711095249.1622000-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6829:EE_
x-ms-office365-filtering-correlation-id: f0d198c0-0b14-43d8-dd7a-08ddd953ac03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2+vMg1hGTPvlMcbaJ/SEGdk+sAfCh6v+etAU+/hkr0sSiH8C3GXZbVQOZY6k?=
 =?us-ascii?Q?TOKV7jUvWegjT7A24yWki4+wqReoo5lIMu2ebv1KnHHVK/pX1ugPfI3wAAzm?=
 =?us-ascii?Q?0Acteob2HXWPFQxwPAGer5TB1G93KQdk4QA52fAQAR/t3gmGzbkVOlSDlIMs?=
 =?us-ascii?Q?v1QO5K9Pju/QbHYDcme4odM3/3YgO5xWHusPTy6jzm6iDTh57lxzo0U4Fy+/?=
 =?us-ascii?Q?LCvuSEkMZ07osYMo/JUxgSJCLfK4/420DUCQPkTLMR160HoX4LJwB1dOxb1R?=
 =?us-ascii?Q?sc9cUasKVB94yccSMFA3j5xbiwbSEdq6zC8AaXiLbSGbCCE9xC2xeGH3Lyzt?=
 =?us-ascii?Q?tZwwpE11o7r+QnS8QbloYBJ0LlT2aCzt6uVFq45KrWnNUYr1IT3UVR3ogX9h?=
 =?us-ascii?Q?Cu/nX1nAI76Alqtx8F2/EjmIGkGa8RQ3jWtI7XWq8hEJh6CYyjQGC02oY8yN?=
 =?us-ascii?Q?sWaXfuAKSIZuJxobLUt+6CkMfaQGPWz+4esEn65jiKIPWl3BfPpDBQGsLJ11?=
 =?us-ascii?Q?mQ8v+daPgcvqtAV/9AKcJcRgK6Tz55s1tpGemInLj+SGsPSJrP4V3Mm3xRQc?=
 =?us-ascii?Q?ln5ZZhCTz2lhyiYXLUhtO+juGbWPbSpltvcoczTuPv6G47BRRp3lJ88B+tpO?=
 =?us-ascii?Q?NaahL04wTioBmqyOqnouW4E0zjFpwT3S28Jb8XpQwjgCFsB21lOPJgn06t0Y?=
 =?us-ascii?Q?4zHATiJT08MxQJeW6bJ+Pziyym0kCiTmhi3wjtfihIMf+fn75Ag72/48gZF5?=
 =?us-ascii?Q?ReTcmTg+MIt/lY1/TO3WoTW40OIanPlJ/YBeDoquuyt8ndAd27rE0bWkSRX3?=
 =?us-ascii?Q?3O8RCmA6Q26e5JRpMTR4IFVKvU7vITm8x5OVNkF8KMcznckt8ystuH9QRHdN?=
 =?us-ascii?Q?X++f20xF2qdQmhLjiHfqSpFz6K2irnV4cJwwOO8FNZRF4UMvyiGa5n3ofNsb?=
 =?us-ascii?Q?HwxSAsVRhr9waDhH27Hn9BoiVebD3ZLRuvnrXB3+bHIv+q2AXCMlzT87rsB3?=
 =?us-ascii?Q?ono6aeN57jQ8JDGX2dVXg+1/bb52Fuz4vZxDOiayyaJhGsx3QvvOJanrgTTS?=
 =?us-ascii?Q?Bkq/+HH55GXq+H5vVhUjUb1HC3UZU7W0s1yebFTieRwuqtQgJtQ3D0RoCQBr?=
 =?us-ascii?Q?fQ/xJ2eLfnX0M4p0GUKzdfJxrbwU9AsCaLBVe6oYPmlPVNd42E5sAY+C4Gid?=
 =?us-ascii?Q?kEPIpsBnfYe1118/5JOKgutBMyhGIhHxV5i5QcqxGULaIlqYxPb6+1iL+MK0?=
 =?us-ascii?Q?Y+28KF2U/KqavdVgRnN5yFlN8ljU5+iaiigpZhHlKKLfQHxwc2qQ56z8u212?=
 =?us-ascii?Q?hDmzzQf3h/kiPCsFAXc4qdoZclzM+LqwQzE8bee45okLkkD3mK3jw/Cpd4Q4?=
 =?us-ascii?Q?f8HWz+fPPoiMGML17At3I92JgETc88BFGDy8A1QmFnEWGBLzSmE/JyPHTxaX?=
 =?us-ascii?Q?jVUG0rIvwk3Mxetp/59pjhez7YKVNxxUMp4UuU0KoTm4fHz9R8aZRA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TIyp5gCZIvozzbpXwUKpq1IM4D1UdPbRMqva8OxcE1sST4DszB7Zk8oQgZew?=
 =?us-ascii?Q?/PWzlvBByyuuLxvU678omNeM1mpwLB7/bLrEqiwxOi63WscJU2mZ2Pb/4Ggn?=
 =?us-ascii?Q?nIQAE053DM9Kz1ITT/0WZtpws4RQG8WBVrRbDZrj8ea3vym5afl+FqnrXn8V?=
 =?us-ascii?Q?8ELv0qq7dzxlHO2jG8OWPTTurvs+A17bK8LzCumoO4+WlpISLWKKXf8delMk?=
 =?us-ascii?Q?HJYuC9+amFU9HgE8iDe5lrjrfPJjjpOMgbNWx9M24INoalWIKeK3vjep+Qsz?=
 =?us-ascii?Q?I5Eu4HZCG4D4bB9UCxBpiKZLRWJGHTu4mOxpK6dbTAD7eOCGALOEyvGkK1eT?=
 =?us-ascii?Q?nL/wGDyfxOaTd8bG9P3ko/T81InEOW6f+0lAM3TxNBHEGcWmNzsH2ZLex08G?=
 =?us-ascii?Q?zksbqEOQs2hud+Ld59qv/Obl+XlEiuMkepQGHboAgWs8TvSP6pCCgU05Sf33?=
 =?us-ascii?Q?SlZLB/+Uw9btO+FB4IOb5N58gVdGmeis0azQp+xR/gdNPvngx12P5jDVziwk?=
 =?us-ascii?Q?tTWIsJWX+6/ycME6QsIj/ZzmvJA3v6bNhxrET58jK3U4OLQ7ymiV3q6f+AoL?=
 =?us-ascii?Q?Cmq3U2DI0eRiWlWUXx6TPcqy2DCJI89J1/YAyPJiFD/qTmU0HpwqxDOd776j?=
 =?us-ascii?Q?Cs5XaJj5/hDV1r7vK2dbNBTTDVEx3eiXYkS/I/WbACbTMrG+gcop+7pf/Krz?=
 =?us-ascii?Q?ZE2D4E9y/azqa4bVkXX6/v3TWcUMJA1vYJrZjAWUjxyrZ/JVfzEfiwxnpfFI?=
 =?us-ascii?Q?Y9rpjvO8H5bhjlKVGg5BBYt74pQd3ftbO5I0or5qB/fVEm+iWjEYjEOkzcrq?=
 =?us-ascii?Q?0gQimi8UHwVJAO/XT5KOXNmGcgBSk0fpSS7oGQ5wrus1k5PS2mn31EAk0dOy?=
 =?us-ascii?Q?hSU/BOY/cJVMU11MkSQzCTBEef7BJ6VGfcws7RGWihlCabQN2D+3g/pkz5m6?=
 =?us-ascii?Q?UwFYZCpkNZ66MUQ2UF4c0PCp3AtFaTGiuzZeZfOYAB3FrJy71/r+/nzHmHXA?=
 =?us-ascii?Q?O2x/r2Ti1CK0KkuR/wANOYerOy8tRnKDPW7iu85z3Aedr48lXfnq5WB6v097?=
 =?us-ascii?Q?1PEWb6VHQ66I4W1KYfEkcVXS7OgNGKOmOKUVu3xN5DWzQkTUsjqhV83BbZiP?=
 =?us-ascii?Q?cPohKAy1jrbK2dY+rJ+ee05ZHDAzyF0WOvd/TycvSZ9nNUyBANCCYtVpI9V1?=
 =?us-ascii?Q?wxyuT13Cn16wyPMMibRAvwLuNJWANkoIgwV2QlLe2XfDl/reIJe1KNt0acgz?=
 =?us-ascii?Q?Rm/i6ldMJzOa/EfCR3npiEIWy5iMnNqkPdxu0xA2721ddFZv4qG4/i9pm8io?=
 =?us-ascii?Q?2N8Bsd/drFnLzm+ut666q3H/Et0Yj6GlYNnhvYagh8YM0wdpF3T+LMcKmNVS?=
 =?us-ascii?Q?2JzrcgSsmqlxQRrLiiQyxHfkieO9kIraLI0n6eVZCVCFqJI3IJG+0L6//k26?=
 =?us-ascii?Q?rDJz0zgmzLToMMbWkFU7Gvf123heEFfHZvWn7ePYn/OCWna9LbWiBfbvnYUh?=
 =?us-ascii?Q?WPKG6/bz0OJ+vA8buYh4tA8t/gQHXpsFFnsEp1r465pf+IW9QszYbSAFewJw?=
 =?us-ascii?Q?iiy6zQ2gfE+gtAenBA61mbO9KjB2WJ7nOx1o26s2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d198c0-0b14-43d8-dd7a-08ddd953ac03
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 03:52:34.7521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m5Sc4asTXyrPJlAUgOn3KGFwMqz8w7pfIjde7nFlznVd6AYZwPUfmKYTkWh/A12CeGWgtiAXdZ7qhCGdDHNIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
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

> Subject: [PATCH i-g-t v5] tests/kms_content_protection: Add force HDCP 1.=
4
> subtest
>=20
> If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will al=
ways
> choose the HDCP2.2 protection path and if this fails, then
> HDCP1.4 will be tried.
>=20
> The subtest uses debugfs support to force hdcp1.4 on the connector and ve=
rify
> content protection.
>=20
> V2: Use hdcp14 debugfs for all the supported subtests (Suraj).
>=20
> v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
> supported tests. (Suraj)
>=20
> v4: Add -hdcp14 suffix for subtests only for cases explicitly forcing hdc=
p1.4,
> retain original subtest names (eg atomic, type1) for default behaviour. (=
Suraj)
>=20
> v5: Add missing lic-type-0 subtest (Suraj)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 150
> +++++++++++++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 51fc1d3be..c4658ebf4 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -46,6 +46,9 @@
>   * SUBTEST: lic-type-0
>   * Description: Test for the integrity of link for type-0 content.
>   *
> + * SUBTEST: lic-type-0-hdcp14
> + * Description: Test for the integrity of link for type-0 content with H=
DCP1.4.
> + *
>   * SUBTEST: lic-type-1
>   * Description: Test for the integrity of link for type-1 content.
>   *
> @@ -65,6 +68,11 @@
>   * Description: Test to detect the HDCP status change when we are readin=
g
> the
>   *              uevent sent with the corresponding connector id and prop=
erty id.
>   *
> + * SUBTEST: uevent-hdcp14
> + * Description: Test to detect the status change when we are reading the
> + *              uevent sent with the corresponding connector id and prop=
erty id
> + *              with HDCP1.4 content protection.
> + *
>   * SUBTEST: %s
>   * Description: Test content protection with %arg[1]
>   *
> @@ -74,6 +82,10 @@
>   * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
>   * @legacy:         legacy style commit
>   * @type1:          content type 1 that can be handled only through HDCP=
2.2.
> + * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style
> commit.
> + * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic
> modesetting.
> + * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic
> modesetting and DPMS.
> + *
>   */
>=20
>  /**
> @@ -83,8 +95,10 @@
>   * arg[1]:
>   *
>   * @lic-type-0:   Type 0 with LIC
> + * @lic-type-0-hdcp14: Type 0 with LIC and HDCP1.4
>   * @lic-type-1:   Type 1 with LIC.
>   * @type-0:       Type 0
> + * @type-0-hdcp14: Type 0 with HDCP1.4
>   * @type-1:       Type 1
>   */
>=20
> @@ -96,6 +110,7 @@ struct data {
>  	struct igt_fb red, green;
>  	unsigned int cp_tests;
>  	struct udev_monitor *uevent_monitor;
> +	bool is_force_hdcp14;
>  } data;
>=20
>  /* Test flags */
> @@ -581,6 +596,51 @@ static bool output_hdcp_capable(igt_output_t
> *output, int content_type)
>  		return true;
>  }
>=20
> +static void set_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	if (ret <=3D 0) {
> +		igt_info("i915_force_hdcp14 not supported\n");
> +		close(fd);
> +		return;
> +	}
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "yes"),
> +			 "i915_force_hdcp14 is not set to 'yes' on %s
> debugfs\n",
> +			 output->name);
> +
> +	close(fd);
> +}
> +
> +static void reset_i915_force_hdcp14(igt_output_t *output) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(data.drm_fd, output->name,
> O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
> +
> +	ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> sizeof(buf));
> +	igt_assert_f(ret > 0 && strstr(buf, "no"),
> +			 "i915_force_hdcp14 is not set to 'no' on %s
> debugfs\n",
> +			 "i915_force_hdcp14");
> +
> +	close(fd);
> +}
> +
>  static void
>  test_fini(igt_output_t *output, enum igt_commit_style commit_style)  { @=
@ -
> 654,10 +714,15 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  					  output->name);
>  				continue;
>  			}
> +			if (data.is_force_hdcp14)
> +				set_i915_force_hdcp14(output);
>=20
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> +			if (data.is_force_hdcp14)
> +				reset_i915_force_hdcp14(output);
> +
>  			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
> @@ -719,6 +784,11 @@ test_mst_cp_enable_with_retry(igt_output_t
> *hdcp_mst_output[], int valid_outputs
>  	int retry_orig =3D retries, count, i;
>  	bool ret;
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			set_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	do {
>  		if (retry_orig !=3D retries)
>  			test_mst_cp_disable(hdcp_mst_output,
> COMMIT_ATOMIC, valid_outputs); @@ -752,6 +822,11 @@
> test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	} while (retries && !ret);
>=20
> +	if (data.is_force_hdcp14) {
> +		for (count =3D 0; count < valid_outputs; count++)
> +			reset_i915_force_hdcp14(hdcp_mst_output[count]);
> +	}
> +
>  	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
> }
>=20
> @@ -878,43 +953,70 @@ static void create_fbs(void)
>  			    0.f, 1.f, 0.f, &data.green);
>  }
>=20
> +
> +
>  static const struct {
>  	const char *desc;
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } subtests[] =3D {
> +	{ .desc =3D "Test content protection with atomic modesetting with
> HDCP1.4.",
> +	  .name =3D "atomic-hdcp14",
> +	  .cp_tests =3D 0,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
>  	{ .desc =3D "Test content protection with atomic modesetting",
>  	  .name =3D "atomic",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during "
> +		  "atomic modesetting with HDCP1.4.",
> +	  .name =3D "atomic-dpms-hdcp14",
> +	  .cp_tests =3D CP_DPMS,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
> -	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> modesetting.",
> +	{ .desc =3D "Test content protection with DPMS ON/OFF during atomic
> +modesetting",

No change was required on this line you are removing the "." for no reason
With that fixed.
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>


>  	  .name =3D "atomic-dpms",
>  	  .cp_tests =3D CP_DPMS,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test for the integrity of link with type 0 content.",
>  	  .name =3D "lic-type-0",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
>  	},
> +	{ .desc =3D "Test for the integrity of link with type 0 content.",
> +	  .name =3D "lic-type-0-hdcp14",
> +	  .cp_tests =3D CP_LIC,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
> +	},
>  	{ .desc =3D "Test for the integrity of link with type 1 content",
>  	  .name =3D "lic-type-1",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test content protection with content type 1 "
>  		  "that can be handled only through HDCP2.2.",
>  	  .name =3D "type1",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the teardown and rebuild of the interface between "
>  		  "Intel and mei hdcp.",
>  	  .name =3D "mei-interface",
>  	  .cp_tests =3D CP_MEI_RELOAD,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test the content type change when the content protection
> already enabled",
>  	  .name =3D "content-type-change",
> @@ -926,6 +1028,14 @@ static const struct {
>  	  .name =3D "uevent",
>  	  .cp_tests =3D CP_UEVENT,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test to detect the HDCP status change when we are reading
> the uevent "
> +		  "sent with the corresponding connector id and property id.",
> +	  .name =3D "uevent-hdcp14",
> +	  .cp_tests =3D CP_UEVENT,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	/*
>  	 *  Testing the revocation check through SRM needs a HDCP sink with
> @@ -940,6 +1050,7 @@ static const struct {
>  	  .name =3D "srm",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  };
>=20
> @@ -948,26 +1059,43 @@ static const struct {
>  	const char *name;
>  	unsigned int cp_tests;
>  	bool content_type;
> +	bool is_force_hdcp14;
>  } mst_subtests[] =3D {
> -	{ .desc =3D "Test Content protection(Type 0) over DP MST.",
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST",
>  	  .name =3D "dp-mst-type-0",
>  	  .cp_tests =3D 0,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST with
> HDCP1.4.",
> +	  .name =3D "dp-mst-type-0-hdcp14",
> +	  .cp_tests =3D 0,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 0) over DP MST with LIC.",
>  	  .name =3D "dp-mst-lic-type-0",
>  	  .cp_tests =3D CP_LIC,
> -	  .content_type =3D HDCP_CONTENT_TYPE_0
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D false,
> +	},
> +	{ .desc =3D "Test Content protection(Type 0) over DP MST with LIC.",
> +	  .name =3D "dp-mst-lic-type-0-hdcp14",
> +	  .cp_tests =3D CP_LIC,
> +	  .content_type =3D HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 =3D true,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST.",
>  	  .name =3D "dp-mst-type-1",
>  	  .cp_tests =3D 0,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  	{ .desc =3D "Test Content protection(Type 1) over DP MST with LIC.",
>  	  .name =3D "dp-mst-lic-type-1",
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
> +	  .is_force_hdcp14 =3D false,
>  	},
>  };
>=20
> @@ -983,6 +1111,14 @@ igt_main
>  	igt_describe("Test content protection with legacy style commit.");
>  	igt_subtest_with_dynamic("legacy") {
>  		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D false;
> +		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_0);
> +	}
> +
> +	igt_describe("Test content protection with legacy style commit with
> HDCP1.4");
> +	igt_subtest_with_dynamic("legacy-hdcp14") {
> +		data.cp_tests =3D 0;
> +		data.is_force_hdcp14 =3D true;
>  		test_content_protection(COMMIT_LEGACY,
> HDCP_CONTENT_TYPE_0);
>  	}
>=20
> @@ -995,6 +1131,7 @@ igt_main
>=20
>  			igt_subtest_with_dynamic(subtests[i].name) {
>  				data.cp_tests =3D subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> subtests[i].is_force_hdcp14;
>=20
>  				if (!strcmp(subtests[i].name, "srm")) {
>  					bool ret;
> @@ -1018,6 +1155,7 @@ igt_main
>=20
>  			igt_subtest(mst_subtests[i].name) {
>  				data.cp_tests =3D mst_subtests[i].cp_tests;
> +				data.is_force_hdcp14 =3D
> mst_subtests[i].is_force_hdcp14;
>=20
> 	test_content_protection_mst(mst_subtests[i].content_type);
>  			}
>  		}
> --
> 2.34.1

