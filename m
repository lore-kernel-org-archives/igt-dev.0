Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C074CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 10:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF310E3A3;
	Thu, 14 May 2026 10:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWOw5PyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82810E38E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778753343; x=1810289343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pNzUZ6dWMBqzdEVt3KZ/jQl6FYo2Rkj7aTEgpFSWmu0=;
 b=KWOw5PyOYAy5HGpa2bsUUZghioTRJHBRRpCbnC1fcQIBd79toDYyT2pD
 7u1gCoDO/1f7hdVaigcjV3hB6Rw0+pCCUzLxcuyEX+RquHJ4OiXCWWo/a
 mzjHv3/dAwHgqs/HzhqOaz4AGLAO79sbEqbX+d0Mf9EPxwjPlqxlKstg/
 Xe1afrGkxEdtLqPH+4YDyfS7J8c8Ok7LO3Jfbcjy2t0K4jqMirwvddkxg
 hhfC0rxtl25virxVs4milXdB3QSP3ix/AqiIBVVYz3Wzex47cJBVArBpg
 VFhIh4ugRES5EtUrfTdoEZ2j653dTO+k0CjnMpVHVDlCi6ttTKt3Ej+kH Q==;
X-CSE-ConnectionGUID: KIMBXkHJQC+Jv5elFpBt4w==
X-CSE-MsgGUID: heYpNffiSAWsNl6NmJJfwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102362902"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="102362902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 03:09:02 -0700
X-CSE-ConnectionGUID: 792tFFH2SESAtJcrxd6YXQ==
X-CSE-MsgGUID: +BVCKywHQe6MuvJwWAu1pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="233912624"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 03:09:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 03:09:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 03:09:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 03:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhgQ3Obl6Qxxk8fmbLfp7HHXiWcPVR8+WEC7DOXTr3TqVruz5kd0tWwGkjwX60flPZ6PublIb5kaa5BtpjYFW2BK8Zvghcyg0OfUJTMC0a3JizgVUlRo3jXPRCEGF7j42pmAfQjIQWj5pW8PAd+vsmnrFmNDoorMZInsVWINFb2RqS5oVgSsalpp7QR2rPjTRdKzq1eGmpNJqXzkJ1v6xzJMD8Y8oxW4+mDHZ+mf91R5cnmFTJzX/J9cWwkOo092t3TUY4q5YzJNtYBBa9nVYktixuLayJ1J3CB5YlSO5iNH2MsAVcoU2wCTobPRs/3N6fwVl+imEg0h2iMf4a2uiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsf7YFEUhE4q/farZ7XAo+jAi5uptxHu6StCCblki1s=;
 b=EhDySHywvEniWhWJrdHjXc+fmDk8YuXr2aSKADGHdR6Q4z9lkFXHMR+RYWHM6VVmLYEjE0rLiZJfSwRLI2i6kWaQi2oHfEksdFPTjim1iR089W9MiVXx7McmPsQSQ6csrZ477ZDJ9/Pej+5Bd2qVFqq+JRNxaTYwYtjI3jDyFx5bpOtjkSsW/fmQ0q5sGcrMM4oAd7kBXWH8ZBlemj5Htwq0vuZTzRySwpAu3g/4iBfPEfyUCD3moe4kE/uh5OnhTFGd7DPHcp10Urd73pvD3Mxy/z0Fz+nbcqugC+0HduwMKmgp6GCEgqORvEphEOB8RBWKzCKROT8XEtd8XqfSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6308.namprd11.prod.outlook.com
 (2603:10b6:930:20::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 10:08:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 10:08:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "jason-jh.lin@mediatek.com" <jason-jh.lin@mediatek.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "fshao@chromium.org" <fshao@chromium.org>, "Navare,
 Manasi" <navaremanasi@google.com>
Subject: RE: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Topic: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Index: AQHc44XUfGFNAuMr/0qNiwoQ0sMnhrYNS98A
Date: Thu, 14 May 2026 10:08:58 +0000
Message-ID: <DM3PPF208195D8DC888C83072781209CBCAE3072@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6308:EE_
x-ms-office365-filtering-correlation-id: 24f50c32-cb87-44fe-7c71-08deb1a0d069
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|3023799003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Wf3juYfUqODL41xFESXKVMr+AvwYo2TTFG/uxWN+t/Y9I9oZncBseIUYt1ugu6oVpjqTallWNzZCtV/3PbvctJyhNlQepCXrXkjN3saO4fI3HZkc2Ef10k/7vX1KApDbHogslIys9+7FwYJLbAZUrWLTaNIGPYxt5UTooUyr/djc+W8QHqirLLr6VcPw0ut+6hvvK/qDKV1hL6E6p7OvwRez889UqAnsa+uN/qUQMNcJRzos+r+Ij+1QVXbbdx6xc4UEalrTcHoaXtoJ2ufPqKJR6KBygPcpxvqUyQaNhC7Ymxk2hhaF03HLJEOmbmE4S9m9fEm24S6xWoJBh39fhxO0vW4tCVRqpaaulnJKJ3nebkRAAz4oM21DZXy/lT/YWQJ91JAddxYMqLA0vUpBCjJJ/Cqp2B4AAiuCj0grrJiXaE81O8HG9PGjx7nvjJxD2rM5GQxtSqXQGBrnuv54fmy2im4e2qt+VCdVruE3W7Y4TIXj/KcNycagWB2v8HSALm29R4dPKqQPdI7EDximUuVGgRiGIKMWfprOGlAryYdpXMv8NEhM/2IFujC4rilZWUG8v7E8hojpEazAEeOqZ1nE3xrBweIVnFpqNsUs9S1c4oiHfLC7dB4FpN9f7JEXLPxxSRjSlRMQAbx6sp/gpCyBWwfVB9797W/CE/ou9gWhfhcgYJ6FcET4GHa7HRM1wETEMC4869ZOwZv8i2yKl6ygln+vQ8xThcjSxX0NqtEhjFb3hfHR78Vz94mLYWEC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0RcunzC85fOD9GNJeWg3vV+9wIb+IFb9sOba9aP0kTCFMVocqMfSpLB5pALg?=
 =?us-ascii?Q?vu0UZXJhe5m/oZMtOJFDHQXaqfhtnf/irC9/M/1pU5tt6G8yL1p/deuBOHa6?=
 =?us-ascii?Q?+UoZdrRde3aqfiMrgrmXAE2+EVhk45SHHYUFPSFPzg+0V3olTHw+VE7nJ0S0?=
 =?us-ascii?Q?02S2vwXqHgNtYtAqHVqxWBpsc+u2T/6Lr67hmgBUuBz2W2m7KXJgxHPjWRDo?=
 =?us-ascii?Q?oPQ92LKzFX8qKBKt9IymCnmHCkwjaGkMvOHcsQXBEHP7QAxhCYIIzpMZt5Ib?=
 =?us-ascii?Q?HVRYttZHqUZBgQN7UxmDuN5dANXWrHJVnAVbpVW/pC/0nurSR4Rh4day6DFl?=
 =?us-ascii?Q?1JC+ltvxCIarHFct41IpC/6i6dFncqdu22uB5xxUz9vfM+msRSmq5wl6eHQv?=
 =?us-ascii?Q?Qsfz4BY6MOoDveU+3HMr9ctQW85bt2hYeATxpdNsNd81/NiWJO3vK1ZKdA/z?=
 =?us-ascii?Q?iFtKjPjoKIpPydAIzSINcVzvbjsWW5qBn5D4jZdcFGVR/BOUfSD0CXW7x55q?=
 =?us-ascii?Q?Bp/y3r7lLxvjTPb6MiK45BH7wuE3lPVi0BeIYz10sADorkQaJ2I+yAoL/jmp?=
 =?us-ascii?Q?jYv9rW6EXWTjFil8zc7CIrpw3bHtMSvBBX3sGG8iRwrRBsQ3MrctdL+E/lok?=
 =?us-ascii?Q?UrefdbM+IM4PRO74yaZbcTCaLG+o5x3Zs2Uxz0b39gd7jsFMvgRVrfR0EWhU?=
 =?us-ascii?Q?FuL63OVHXSQT6nln34HWIabbfVDqyFIjMJiXf+LHChcBgt5vmZ7TSTbJzN36?=
 =?us-ascii?Q?WP59bhEYvMLY883pLN5OGbWLknF1vA08EDRCZ6Ek60z82e2DNODLpODz0MNR?=
 =?us-ascii?Q?W+klFg3PjLwP34alCy4KX0gfVZUiEDUSuyYK97D/V/AlgzUIbc+ni4A3ekFN?=
 =?us-ascii?Q?8irqyAAggursxPWtyPX0AFnUQduE8u6evfqdghs3jmah3WiGA+8BCuWdBEGM?=
 =?us-ascii?Q?RZVJBxYWo1rOEpJ5dcmlJeHm3BFPN6OlEHXAy4CI8CKp1xek978BLJMwjFbi?=
 =?us-ascii?Q?oKZ0vfhqjW//Ww83xpSKJHuXwYb8UvyR2/W/9OnSRAXnoZX8hbiO/blnf/Me?=
 =?us-ascii?Q?Bj/hJGgzdO0dPHna2l3ijOLUBFczhl1OWeWWOnEk9BNesSB3GIKR3u2YJUa9?=
 =?us-ascii?Q?KoAqea1uIO4IDgKerZtMkXdBhja7QouXrXhnsItxVpK9jgioh8oyGQuRg65v?=
 =?us-ascii?Q?f8jb8YCnXzu0PSohyxOPEbEkCo9oNUlkE97fsC8O4Qlyg3z1wDqcDy4NUDfJ?=
 =?us-ascii?Q?JqFwAmcs6suPBxJMFC3G3KKps9yrdOlYWZuhlP9DyLskUCmzFCYfSpdglGQY?=
 =?us-ascii?Q?yn4VSyb5rAez+olVwbIPvZjpcI7Tf2Fh+jNPZILwbmnxqgEzEPWOOUjUrhGG?=
 =?us-ascii?Q?hfjq7y43DsbpyR7i+ZL6zepqJVhyPcSKgaWA+u+rN5UMVQiQvk6K+o98/V71?=
 =?us-ascii?Q?6rN5e7FYY7nStWUNLR0tbzQeWLePMXRTPOZJOajAQQYB/h8NMVgkpGy7SiJb?=
 =?us-ascii?Q?1BFWaN7i/EdtPja8twGF9Os3LhrX/ydYY9AREh3dBRC/WZjGljo+8gdalZ7+?=
 =?us-ascii?Q?YVWK3NBi6/99ej/FwoMm5vIxkhn8MhWUNjK3AN1GZso+tTQQAMhcNgQaFYqf?=
 =?us-ascii?Q?D43TEhUz35PoEQ1+UwYGZiNH8ofcf+y6Teost58adklwuWQkbXQgr38Lu4CH?=
 =?us-ascii?Q?KH4MQVZ5c3Oil3ifMOSmbYrmGt4xIexIAbtfcsEFD7d9c+QYuV6sUgFAATtR?=
 =?us-ascii?Q?PCx3v987Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dYgneECl34rvUWtqGc7rR3GQmpCccZwaj7qkCJnIEIIe2S3hEScZH6Rnd624MaQXyi9wA7oougdbz7jKasmNUHgwe1HWSFKo+E1z7KQnHAtYOZqWvUlsVw469EcJhLjuFDKN6adpNGsvms8QMev+dp7Fqe/mZmj+H/u8j37BBLf/r24nCsQCx9i+YIL/KyW1xko1UxR8xIyAHuYg5Hqip9+vZbSawQ5Fn4f+ylkqFbTJwJsJsgH6OAaq4a8lcFLh5XOv+hqMctHdP8OLePEmzasZPJpVN3dFHk3YaHsXg3An1CXDigY6Yh7wqqYPKN4O2RoahaWXY1ejsY9hRYy8BQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f50c32-cb87-44fe-7c71-08deb1a0d069
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 10:08:58.1477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJQFoQVSjr/vE/VbBhcV1fz9o/qOiR6EbTSVBLOAfLbiPLOThVK3DcCG0KAxm65bPsltQP6McJheMZJREq2i4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6308
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

> Subject: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
>=20
> Reverts below commits
>=20
> b4036b1a0 tests/kms_content_protection: Add FB cleanup for MST tests
> 8d7c2453d tests/kms_content_protection: Pass crtc parameter and use per-
> CRTC FBs
> 925b14d43 tests/kms_content_protection: Add per-CRTC framebuffer
> infrastructure
>=20
> The per-CRTC fb introduced in the commits caused regression especially wh=
en
> the eDP panel is connected with 2 4k Panels connected through a DP-MST hu=
b
> with "-ENOSPC" and all the content protection tests are failing.
>=20
> The MST subtests are skipping when subtests are executed with "--r dp-mst=
*" ,
> as the MST changes introduced did not clean up properly across subtests.
>=20
> The create_fbs() now iterated through all crtcs and eDP (2k) claims the f=
irst crtc
> before the larger output and fb is created with smaller size. Later when =
DP-4
> maps to the smae CRTC (it has differnt fb dimensions now 2k fb than the m=
ode

* same
* different=20

> required) , the kernel rejects the commits  with ENOSPC because of invali=
d
> coordinates.
>=20

This whole series is,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Santhosh Reddy Guddati (3):
>   Revert "tests/kms_content_protection: Add per-CRTC framebuffer
>     infrastructure"
>   Revert "tests/kms_content_protection: Pass crtc parameter and use
>     per-CRTC FBs"
>   Revert "tests/kms_content_protection: Add FB cleanup for MST tests"
>=20
>  tests/kms_content_protection.c | 168 +++++++++------------------------
>  1 file changed, 47 insertions(+), 121 deletions(-)
>=20
> --
> 2.34.1

