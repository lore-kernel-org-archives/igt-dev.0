Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A3AC2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9F10E050;
	Mon,  5 Jan 2026 05:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqclcx7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6B10E050
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767590405; x=1799126405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a7NcFkj+Q7uTqCCNz70xlydv7ylX11OssOibueNY3Pc=;
 b=eqclcx7In6Jr6t61In8Nsj7THUhPCYoDfg2DvPkG/JaVCgvih5NEnkQq
 RCqQ4RSxJOpvhr7ZBCgL3sjmEabRG9WNJ4JTdl98YJp6yFY4kM5tnUoTh
 CK+Pn+/PC+fWW5HGNNQ4tlJZnGQJI1/p6hAd4KycyBkIYdBMkuU33goYm
 YmN2JP2ynx17euwat75e2DkkjuzrniXn8pCoZVZJJRC8BfsGU6rSw6rnM
 u3y2hsPZCS4YqKzt/+7PbDJ6BK/9vDJLBqZZQlMPovzMY7ztNIKJZAuAh
 wP9smuDjepycBQOhzwBDcbuhXE2V4QRnL4HYhXdMN0sCK/dM+8XdVaQ8k g==;
X-CSE-ConnectionGUID: YG2v6aO7RRyQ67ENkqltVQ==
X-CSE-MsgGUID: wDmq4TP8TAyeWHwsxkF9bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69005309"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="69005309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:20:05 -0800
X-CSE-ConnectionGUID: sQ9nVQj/R3+6wozw1/WB4A==
X-CSE-MsgGUID: mdYAUulFRzGO3SxVPBqgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202556980"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:20:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:20:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:20:03 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:20:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPkALfjQfH1HS0i8MbybwawqdEAn2lHMowASL4269b8RVEZXA9HP4g+l/wXoH2NUTjs9DXRHixepWBsgTIV6o9ODRDPfvFnHA+/kLFD9yE5h435V+TWFiM5Ce6rE+9FP7cLl9YhhN2Tf1afrnHYDsqxQhf+uNcC+jJKCMPQnKFO98RpczRvpTelzZJwSupJx1xmDlTG9LgZZYwB5cu0dAtvOKVKsWGP13g+jsmPMR2/ujSbtRnnENegsv81ipw+XdfLbXhvAykcllgyEXdhD+czCbf2dwQLOVzWhWNCYl0h/ra/HmUxKjCeBUj6U5dGdSr766LcnccPPkNlccHqMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh8b3Vb5p505cinTVZXCzkc6BsFnfmjsyTrddlM9kfw=;
 b=DPUSI9cm/VfOXg2YE74x2qX9B1BZAQwCQ0TDK8nfuQmnP/+eUOwXEsj4sHgLhrzQ8PbB2Zd4jDXSj5ZvyL4Ga3WTrdkttLCExFJAco4IbRqYq6TOyJYZrq5CCj9tJAAzYgy/Rm1N0p0xUwqQRs2Y3BAIdbuNxMdhuUYCX+hxvRT9XxZqotOSJolafcbZgQCRWTlGHBjR0zJGRZU2xHN9OkfTXZ5buedAGehjFCy2nub+PxyNhx12b4LJPzBiVz5A7x5txukbEC19UWZ/fsK0iXtRLSVqKh7xhZm5ygcFCp99H+2TUYEMfh3bWhwBacywOLYr2wHXvmS43YRu6t0riA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:19:59 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:19:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 5/6] tools/intel_hdcp: Add interactive control
 with playback
Thread-Topic: [PATCH i-g-t v7 5/6] tools/intel_hdcp: Add interactive control
 with playback
Thread-Index: AQHce66MWXtma4TZEkeMxE+rNWe9jrVDDY+A
Date: Mon, 5 Jan 2026 05:19:59 +0000
Message-ID: <DM3PPF208195D8D0FF1ADCF95B096AF5EB9E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8252:EE_
x-ms-office365-filtering-correlation-id: 12db66f2-0f4a-490d-4a00-08de4c1a1287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?JQLBWEcvjAwdeYnzO3vC08xJolV0Qerb02RnZa0mY7zedCIxst0cLXlfqCS8?=
 =?us-ascii?Q?5QYTNabflF6pJnj9T9B/4QYcZdgLW1ZLqkJp/38aNEN7zoofE9UGFUlf+e0S?=
 =?us-ascii?Q?ygNNcesR64xlArHVUziGVy1kbnW5IT2vtytFfXlKY9WB9pAQCeQEuhn5LB1n?=
 =?us-ascii?Q?EVFvaUJFIpKyccW2D+YijBeUlEm0HrupftOmBgg3HlP0EPLuQxk7aALGj9EP?=
 =?us-ascii?Q?HkMdJNbC8WtoOJnqtFOC7DFyP+NU20kIyDDh9YfvjDA15w8wMwWpsYAhv0nX?=
 =?us-ascii?Q?Z4Ldt4pKlD2yvvmOSFd6MQwPA3Hx0ZP/YLacqIlH/6SKs6pmi7K8qKIIt8WI?=
 =?us-ascii?Q?qf4HRzMCM3RuKcbHzC+UkHO1MBmQXYfgx6YDhg2DFICKPyxNEqsFVtuF2Pht?=
 =?us-ascii?Q?iDN5nZ8V+ncIWdM8I8UFPGFtKbjyt+Svadbx+dWeNcfB9LSvHyBasiLjYE1E?=
 =?us-ascii?Q?h9E1Iu0ecjY+1uchGLDX2/EzbCymbZjnX583ygAzsD09HiARc8M+pt6t+yA7?=
 =?us-ascii?Q?WlhR6YW4kW7yqK0JI7Z/6r57Bcyu7Qy8Qj1KhqStecpTWgGhEzAN/bvrMdky?=
 =?us-ascii?Q?0xRl+g6f+JNTzwH84yU7gWbhUTdszxx3UO3a//S8PT4x8bgb8Kd2lHCmNMso?=
 =?us-ascii?Q?3jkPYg3o8u3sp9bFfCcKOCMheLKjfRhyqQEJwKNX8Yg9Hr+BjbcY/Hpt+ztP?=
 =?us-ascii?Q?QzRlPBHqdEA9xbndVDmUtcmjmSqwyIvjoGY3BknRIAFEK9B5PKi3aXr1i6mJ?=
 =?us-ascii?Q?yRY9VuTnXcDR1OQjGKTmQwdWDXu8qzLRVJFdOuIEX958nm3wMj7vGVow7oy2?=
 =?us-ascii?Q?Dkux0AALf+krx+7N3I0FypTLfhQNazS+28mb5pD9qxLVR2/krnF/efcRjT8O?=
 =?us-ascii?Q?NH3IN2X3h75NVjj+S0ZEXwMaEeSreX4FmS1ZLAa7HiAnskB/KtjHtiaIhh0W?=
 =?us-ascii?Q?Nen+5sHk0nuUEqLG2fXjh+cd6fNB9v/pGkBUKt8cxHpaIIiUS/rq5mS9j1YL?=
 =?us-ascii?Q?PsfNoHN8RlmTIXY39G5mX+8Y7yg1zFII52+gk5xTTtWfEbN8DsDbGl8Tmaek?=
 =?us-ascii?Q?MblNLSCCkZ3H7CBuIu2QJW1MOfKvaprQ1PeDDYHzKqRMl59qbm7SpUQTJDw8?=
 =?us-ascii?Q?4SIUdaArV193TfuWkks2gtc8ynroDuejX1VVTHIhcN7UuBNjt08qORBnZ2eC?=
 =?us-ascii?Q?98tvYBupQlkgOVhu+xaAz3sVqEiVvHB6tkPtyRWwKHSRQPPDBE+LWXXl4mjC?=
 =?us-ascii?Q?7JLiAOF6blqkf9HmDSDebhxyMpIIlV5hJKgM8u5EEblfFmTqVLpaBvBQJfIA?=
 =?us-ascii?Q?6MGoqMpJootQix6iGKkd6bzzn3fsni2aibpy8PTTP1Pokm3n5S3NI+f53zYf?=
 =?us-ascii?Q?OAqDdDp5fJ6vPqh0GJCDbpLqUlkEW2ty9wZYRNl8qE4yA6F4jDCUzgcOV2qU?=
 =?us-ascii?Q?KQXasMEathdMtKrX/hCJQbm5sBekL1zk/LB6T1NCqc1EvUoscaE229uQqoPk?=
 =?us-ascii?Q?eE1xGySA7JmZq4wx3V46uYr63wZltr4i3Gte?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s8XgCUKUJhzVQ0gI4RxU481ag8bja0x+GGTob8pWcnSwPFxfyyYUcUL8UzQy?=
 =?us-ascii?Q?IqaN91C+3Xe7H+g5oidT1Oo8ISwqeetVBlyW1BhmEL782fY9TDigDG2TEs/8?=
 =?us-ascii?Q?iOqK/NS2uK9v+edIyRpqammcZmeQg/KYGGFTxy5u05FLdstfw8WejahBEEC5?=
 =?us-ascii?Q?4AfBZhQlO2dfnfLkEyeEMwiHiUuBDgu6PqTzY5B6U/R0+nxX3XfbvR5ciWcy?=
 =?us-ascii?Q?mdvRifK2yHaMSuE4ybgvrm0sgiVy8NImCD4/fYcHRKX2Bd/XsLxyg7+2DAyR?=
 =?us-ascii?Q?R5qvUcRttk0EwGpdxA547AOnf4fLmNoS4abxTQ48CeVp68dMq/ytIYXNNSNx?=
 =?us-ascii?Q?/SSc3fCC1e3fLHBX27oRTnUYBQs/FdCYkOvM5rdyOSyJH2OIJ/5jWh74SYVP?=
 =?us-ascii?Q?+YoA7j3VyOZcusUAQp33e+y/hjuIms1WuGQoFL/qilmobK5TDv/mOJWN8AjF?=
 =?us-ascii?Q?F+GZHb68f17z6+LpGxIWKj0vL981VC92LD+rJQm/3GpR3g4h7/MCZyEPpa51?=
 =?us-ascii?Q?4biIKTBRzCAJnme4MO0qGZYrPTcUdrkDyke/6q2xKRdOXvgL0J1fwnMdvqNZ?=
 =?us-ascii?Q?I+vHy5jKyGj5G5x/t3511BMYv+yz9HBGL0XlqjOoKQ4WQQjyLly8toNPET1C?=
 =?us-ascii?Q?Hsj77g6S1g+8TOiHy1kxJ3enpZbU4EF+QOqzTcvJfuHlu6Io9thbOfHC/t+9?=
 =?us-ascii?Q?NTShTcNwootLJOkIzS9DdTfNiTEpPIezmfNCC2AuDnm3zuMF0w1wD+yXley6?=
 =?us-ascii?Q?u7knLfKViYxZppXNo4F90/vRLa+yQtUA/NnwpjqwsDGIcbY8u1kv8CuLYbse?=
 =?us-ascii?Q?o7tB2MlP6t6b4NMoOVW+V8b/t5sMESPWh43soZOTtk84KUcsP7D++EEgYypW?=
 =?us-ascii?Q?tvrRJhMYUvZRsFzOx5W9JIvILIGYbdpbPMyGQpcFKp3jhZZeGbOg4/gS54tt?=
 =?us-ascii?Q?LCoMOapQuJfzNMv1WVWfMEi3sYMFaC+gPVbG/H+7PN1Lj0zsWk8PCTt0+7Ax?=
 =?us-ascii?Q?2sN4qZYTr/PUNeX8nEHVKWQfAnMPafzMZvdyi4J3lyC1sZFkjMuv0u3v8/ZX?=
 =?us-ascii?Q?vQjTkXd3A6jk7rSTW8VFGEeZBJAaUL0iIZzaDNw/Y6jH3WpKka5cPcmn7AXG?=
 =?us-ascii?Q?VGffdTW+DxvvmCmXFyAy5FqoU+cWh81UYF3CcEV+3OFdtNbej6Bjd22MtVeq?=
 =?us-ascii?Q?CCFlHSQPNTZgK/iqbYm0LbeuJl6prcvUTrqLHzOxhlgMWh2HNFWMWxS1ixSr?=
 =?us-ascii?Q?IYDWgwqCP7dx7T1To4E8RUmM7l4I+A7wRo0HC0p77WNyL9rxm7tNAknhXSng?=
 =?us-ascii?Q?qJTejnD7u9fXA50aRcqRDPzf9PtNg43h5CublsvQEVEo2yeXQVZwjFskdqdx?=
 =?us-ascii?Q?sXFWbDhJOsN+DYWzmmjhETIzN/C1uob/prAo5dJNcjABTRFkanbbi5+uPTEq?=
 =?us-ascii?Q?rVom0/mwPuviVaBTBAl4ccTx0WbrHwTGt/a2yVE1sW6oIlxf37cq0eAM91Bn?=
 =?us-ascii?Q?N1YM5guO4WGmcFD80G6upxxfuvzZtOHrLhzKxdgPp6XKmXmlU0/i8WCVwZd4?=
 =?us-ascii?Q?6cMtJgnRHauanJwcWOxlL8t3P6baLQ6AWzLDxrRwE9PVRkO0l7LgZ51SZp6Z?=
 =?us-ascii?Q?mDKffxXrimVdq5gz+PvDHyDo23UZNMg/m0l9EnYHmWzVD5wD/78YNepCUDyE?=
 =?us-ascii?Q?hmfc0Hvyi+vspqNggZpmPxguJsW8943axwjpHmzlZmOGvX0JTZQ/BaC0e6SU?=
 =?us-ascii?Q?FOLVm0FgGg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12db66f2-0f4a-490d-4a00-08de4c1a1287
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:19:59.6643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnIyMxAfRFZ8F6Daqkzj87/OdPBYxNSJf1SUhjyz8BSotKJEgmdOjJq9500Uv3ETEoT8wVkjKDonFGBLE/ZSOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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

> Subject: [PATCH i-g-t v7 5/6] tools/intel_hdcp: Add interactive control w=
ith
> playback
>=20
> Replace static handling with an interactive loop for HDCP control.
> Add video playback thread, dynamic menu updates.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 201 ++++++++++++++++++++++++++++++++++++++------
> -
>  1 file changed, 173 insertions(+), 28 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 3dc128531..a04f85362 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -36,8 +36,72 @@ typedef struct data {
>  	pthread_t video_tid;
>  	int selected_connector;
>  	bool video_running;
> +	time_t video_start_time;
>  } data_t;
>=20
> +static const char * const menu_lines[] =3D {
> +	" HDCP Tool ",
> +	"Press:",
> +	"1. Get HDCP Information",
> +	"2 - Enable HDCP1.4",
> +	"3 - Enable HDCP2.2 Type 0",
> +	"4 - Enable HDCP2.2 Type 1",
> +	"5 - Disable HDCP",
> +	"q - Quit"
> +};

This can be moved to patch 2

> +
> +static void draw_menu_text(cairo_t *cr, data_t *data) {
> +	cairo_text_extents_t ext;
> +	double x_center, total_height, y_start, y;
> +	int num_lines =3D ARRAY_SIZE(menu_lines);
> +
> +	cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +
> +	x_center =3D data->width / 2.0;
> +	total_height =3D 0;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		total_height +=3D ext.height;
> +	}
> +
> +	y_start =3D (data->height - total_height) / 2.0;
> +	y =3D y_start;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		cairo_move_to(cr, x_center - ext.width / 2, y);
> +		cairo_show_text(cr, menu_lines[i]);
> +		y +=3D ext.height + 10;
> +	}
> +}
> +
> +static void draw_menu(data_t *data, const char *status) {
> +	cairo_t *cr =3D igt_get_cairo_ctx(data->fd, &data->fb);
> +
> +	/* Background color and text color based on HDCP status */
> +	if (strcmp(status, "INIT") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	} else if (strcmp(status, "Enabled") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> +	} else {
> +		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	}
> +
> +	draw_menu_text(cr, data);
> +
> +	cairo_destroy(cr);
> +}
> +
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id)  {
>  	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id); @@ -191,17 +255,6
> @@ static void get_hdcp_info(data_t *data)
>  	drmModeFreeResources(res);
>  }
>=20
> -static void print_menu(void)
> -{
> -	printf("\n=3D=3D=3D HDCP Tool =3D=3D=3D\n");
> -	printf("1. Get HDCP Information\n");
> -	printf("2. Enable HDCP1.4 on connector\n");
> -	printf("3. Enable HDCP2.2 Type 0 on connector\n");
> -	printf("4. Enable HDCP2.2 Type 1 on connector\n");
> -	printf("5. Disable HDCP on connector\n");
> -	printf("q. Quit\n");
> -}
> -
>  static void *keypress_thread(void *arg)  {
>  	data_t *data =3D (data_t *)arg;
> @@ -212,7 +265,11 @@ static void *keypress_thread(void *arg)
>  	const char *hdcp_support;
>  	drmModeConnector *connector;
>=20
> -	print_menu();
> +	printf("\n");
> +	for (int i =3D 0; i < ARRAY_SIZE(menu_lines); i++)
> +		printf("%s\n", menu_lines[i]);
> +	printf("\n");
> +

I think call print_menu here and move this loop inside print_menu function.


>  	while (data->running) {
>  		tail_ok =3D true;
>  		printf("Enter input 1-5 or q: ");
> @@ -388,18 +445,34 @@ static void *video_player_thread(void *arg)
>  		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
>  		cairo_paint(cr);
>=20
> +		/* Draw menu */
> +		draw_menu_text(cr, data);
> +
> +		/* Draw timer at bottom-right corner */
> +		current_time =3D time(NULL);
> +		elapsed =3D current_time - data->video_start_time;
> +		minutes =3D elapsed / 60;
> +		seconds =3D elapsed % 60;
> +		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes,
> +seconds);
> +
>  		cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL,
>  				       CAIRO_FONT_WEIGHT_BOLD);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>  		font_size =3D data->height / 12.0;
> -		cairo_set_font_size(cr, font_size);
> +		cairo_set_font_size(cr, font_size / 2.0);
> +		cairo_text_extents(cr, timer_str, &ext);
> +		cairo_move_to(cr, data->width - ext.width - 20, data->height -
> 20);
> +		cairo_show_text(cr, timer_str);
>=20
> +		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
>  		cairo_text_extents(cr, hdcp_str, &ext);
> -		x =3D (data->width - ext.width) / 2.0 - ext.x_bearing;
> -		y =3D (data->height - ext.height) / 2.0 - ext.y_bearing;
> +		x =3D data->width - ext.width - 20;
> +		y =3D data->height - ext.height - 60;
>=20
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -		cairo_move_to(cr, x, y + ext.height);
> +		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
> +
>  		cairo_destroy(cr);
>=20
>  		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY); @@ -438,6 +511,16 @@ static void
> stop_video_player(data_t *data)
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
> +static void enable_hdcp_type(data_t *data, enum hdcp_type type) {
> +		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
> +		pthread_mutex_lock(&data->lock);
> +		data->hdcp_type =3D type;
> +		data->video_start_time =3D time(NULL);
> +		pthread_mutex_unlock(&data->lock);
> +		start_video_player(data);
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -467,38 +550,100 @@ static void test_init(data_t *data)
>=20
>  		break;
>  	}
> +
> +	pthread_mutex_init(&data->lock, NULL);
> +	data->user_cmd =3D 0;
> +	data->hdcp_type =3D 0;
> +	data->running =3D true;
> +	data->video_running =3D false;
> +
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
>  static void cleanup(data_t *data)
>  {
> +	stop_video_player(data);
>  	igt_remove_fb(data->fd, &data->fb);
>  	igt_display_fini(&data->display);
>  	close(data->fd);
> +	pthread_mutex_destroy(&data->lock);
>  }
>=20
>  int main(int argc, char **argv)
>  {
>  	data_t data;
> -	int option;
> -	static const char optstr[] =3D "hi";
> -	struct option long_opts[] =3D {
> -		{"help",	no_argument,	NULL, 'h'},
> -		{"info",	no_argument,	NULL, 'i'},
> -		{NULL,		0,		NULL,  0 }
> -	};
> +	pthread_t tid;
> +	const char *status =3D NULL;
> +	igt_plane_t *primary;
>=20
> +	data.selected_connector =3D -1;
>  	test_init(&data);
>=20
> -	while ((option =3D getopt_long(argc, argv, optstr, long_opts, NULL)) !=
=3D -1)
> {
> -		switch (option) {
> -		case 'i':
> +	draw_menu(&data, "INIT");
> +	primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &data.fb);
> +	igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +	pthread_create(&tid, NULL, keypress_thread, &data);
> +
> +	while (data.running) {
> +		int cmd;
> +
> +		pthread_mutex_lock(&data.lock);
> +		cmd =3D data.user_cmd;
> +		data.user_cmd =3D 0;
> +		pthread_mutex_unlock(&data.lock);
> +
> +		if (cmd =3D=3D 0) {
> +			usleep(100 * 1000);
> +			continue;
> +		}
> +
> +		switch (cmd) {
> +		case 1:
> +			/* Get HDCP Status */
>  			get_hdcp_info(&data);
>  			break;
> -		case 'h':
> +		case 2:
> +			/* Enable HDCP 1.4 */
> +			enable_hdcp_type(&data, HDCP_TYPE_1_4);
> +			break;
> +		case 3:
> +			/* Enable HDCP2.2 Type 0 */
> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_0);
> +			break;
> +		case 4:
> +			/* Enable HDCP2.2 Type 1 */
> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
> +			break;
> +		case 5:
> +			/* Disable HDCP */
> +			stop_video_player(&data);
> +			set_hdcp_prop(&data, CP_UNDESIRED,
> HDCP_TYPE_2_2_TYPE_1,
> +				      data.selected_connector);
> +			data.hdcp_type =3D HDCP_TYPE_NONE;
> +			break;
>  		default:
>  			break;
>  		}
> +
> +		/* Update menu display */
> +		if (cmd =3D=3D 1) {
> +			draw_menu(&data, "INIT");
> +		} else {
> +			status =3D get_hdcp_status(&data,
> data.selected_connector);
> +			draw_menu(&data, status);
> +		}
> +
> +		primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &data.fb);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +		usleep(200 * 1000);

Same questions as the previous patch

Regards,
Suraj Kandpal

>  	}
> +
> +	pthread_cancel(tid);
> +	pthread_join(tid, NULL);
>  	cleanup(&data);
> +	return 0;
>  }
> --
> 2.34.1

