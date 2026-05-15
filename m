Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C316FCD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27610F471;
	Fri, 15 May 2026 08:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJZ8jUw0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7910F483
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778832532; x=1810368532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PPLup469iPU+vbYFoTqsNxn0GwfR+Jumv8w0ZbTHAt4=;
 b=MJZ8jUw0ZFokxB34TfQAB/z0rxxEBNhxCu/JKPw0gsaWofS5GnTqFf87
 EIALPS4RWjZg1a7EezRj0yMXqTw1eAc0j0FymhLuyZ7aAUzzYz7JTTXPz
 V8y6aF9uOmRwZmIhpK77t2UU/g9HiPFIUfwUTDu6wA4X0SFADD4PY47xm
 zkWiAeot77gou0L7mis6CX1lS3d5/oc3nC++rVbwXy92PoOPC7fiOyQPg
 tV9+jbHzkrOXE3QmrxlTdjjzclZ+JwzPdaqQPyCtGFoWlK92UkQ6iOcC3
 M+kg9PrYnlmt2mp61X8LFumKMLDxeUgo1h6cQ89rYs9eyLYFgaXuQDexn Q==;
X-CSE-ConnectionGUID: 4gNMHz1UTYKJCujTFiquXw==
X-CSE-MsgGUID: ghgh3d4sRau0nQkS8tSRyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79642999"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79642999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:08:52 -0700
X-CSE-ConnectionGUID: 5Jc4qCU1SXijNHcIt15iIA==
X-CSE-MsgGUID: B3gkhsIiSVOHsZUTzXkr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="235581370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:08:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:08:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 01:08:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKpsMrVybN/DB6DfC9Y09MiTuc8ZhRQA/SDeIi1Zp2yY/zzPuYHO3xqYYx6KoXFUtUoyyDZ68SQEc21G0uaqxfNP5PnNEaZRmEWKltLzyKtLeT1V5ScUk+rxL7Ipy3xsFZrvBHw0J1hXYpIpn7dloCGWzeZl1HWcPEVpwSKEZ1qPDeOmd/k8FRItsh35PQQfN0D4h9SIudesz5+jjgh3bxyOfW7TJLxFRoTQsxqnOFAuXe1EoWjYNDwS/0RM8fxYBiauX5oGf53br/3PKPjlLwNvYY6ZRdAAI9ZbCzcEaIzZ9adudVvUkb1knnt6ttCdhziYyDWL8CDx/ysERWsowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iW3jOEjyMWq7r/B4eokF7fynIfeBlgdWxJBGBdilFU=;
 b=U+KKpZTB+Mc0xZBhouotEDD0dRQkPEbMIwfs8e/u02P+p5xFwza+k05kCbGMSfKmod5mVRVVHu97S6L7jNubJBFyGXjtXg38AFyKx7A+YMvwm1LvrJwDOSSupb9GZ6RZQnFJ9kYgxNIg0pbC7vex0S0I2qqPewsSZg+npzMXRoRYB9leqqUro9PrqgHGIJSbK0qqwbj9zV8OscVw/x94PQjGsTvy16sIcW52VclNZrgx7+jos2eGYM9UA+9mYp93sRW1CJY7ghPoJKo/xW8lO2iWX5WOrECTXVLJIkpmwLgMys0k7XXUNq2G03n6yLmNpi5Vh7Hpr0DNUBLopsML1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:08:47 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:08:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "jason-jh.lin@mediatek.com" <jason-jh.lin@mediatek.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "fshao@chromium.org" <fshao@chromium.org>, "Navare,
 Manasi" <navaremanasi@google.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Topic: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Index: AQHc44XUfGFNAuMr/0qNiwoQ0sMnhrYOuK4AgAAEF8A=
Date: Fri, 15 May 2026 08:08:46 +0000
Message-ID: <DM3PPF208195D8D3A24BC5386C1FAA1C3A2E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
 <f8de8e9810d620359f2d5375d83f2a6d1a30ce97@intel.com>
In-Reply-To: <f8de8e9810d620359f2d5375d83f2a6d1a30ce97@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6527:EE_
x-ms-office365-filtering-correlation-id: f126e92a-77ed-46f9-c11f-08deb2593097
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|11063799003|4143699003|18002099003|22082099003|56012099003|3023799003;
x-microsoft-antispam-message-info: J/ZYMdjW4KciMeYO5zSALChkXAO9Ttczw3qXgq00qFYK66fyAKVS8+6yVS7LFWFCOI0EentB0BsJseKJTISYqOvUB9CjsDlkzOpOHjImWx8Hik2VHRhOCF8nKFTYOSYFWWjkLaTEiL0Ergt9p1KossUlbX/um45VeXYnE7wnruZ8MFHV5LObd5YNJH5jiZ575Ma/LwsQAPuLiMQvtLV2Yu9MQcWkfqxbg87vcAWNGWnTUwWEiF4g9kyM7+qA5fALdOD++8J/NqfcqXzt8URQidY96ZNgzY2Rh64D4tO4Jrh4VMmfsNigNTdwcDXbWJMQ7qBCv5US1zHO5WBCNyuZ+X/Ou8ZUmDrmojCGQjk9Z18CN4dq3qnaFYdZa3i4tQ8wFdX8Mn9LzCuszehjT33WfhMT2/I7cVnMpbr1cBeZ5pi4fhous1y8atQzZSRaF/HuF1C9Ma+tflO2UT0tgNaVqV1ZZhCkFtZ1k8a0Gm5oofhLiWVk1Y1fuZKIHnfCeeDSSyETNaKbdzckAD/UB7I2MbxEEe1qhozVc2nNjGs1UfUDNK940twP0TSo+AEUlge8woCvYC+bhmiigJvoq2ZZnyCcyl5YdOEa9NX5ucYfSV223ImTZZeCe9RiHlD44Hf6XP6v/cNS4FSOO0LV0Im/9xvF56xmk01lD1TWLxgY3Gu28DJTdDBiCLQNhBPX2WsiWlwpKj6L17nT44OSDMpo7+aFH9m13dKoMwkEg1sctkpYTAmdLdYpXPQ2zGjqq7qT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799003)(4143699003)(18002099003)(22082099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VV/oUNbMZx14vHiDeUIK20eEOU/K8qhsgPzWtoIc3xCoTD+FP0tURxf/Ol20?=
 =?us-ascii?Q?5uNq+3KHegqHp9b0WuK4jneQQexXnFJnZCqBDTuomCTQ9+EGPtH44uIRWryZ?=
 =?us-ascii?Q?6gPO4V+cre0CVpzRh7OyPlim/dqQYuhWYqTNIEyPwZ6O2a9eojow3D5FmpWU?=
 =?us-ascii?Q?oDNuttURj2AKjFVKq9UeGIVnCQ9SH9Rc9ZQawt6kFD+KB3bvla02ICkVV+I2?=
 =?us-ascii?Q?Yhv3nbIXtgx1ULN5CZzJTtxiAuZOXsjrR3OSGnof+VyDQkh+c384vQ0akqUn?=
 =?us-ascii?Q?epJ5I1TCy66pDhagcVAlo3wQqG2EMi/cdcMvu6GDI6EdRAkZG9qJJRR++RH7?=
 =?us-ascii?Q?M1QrxzJTPDfbv/j4xmDicpDgSRCS+eYPXNk1PSZij4DCqBFEPpu6A+rJoiFe?=
 =?us-ascii?Q?DjXBqdUpQCH4vq51wmmLw3oSsoJLwckWj1Y//Eq5cqjAhXIilyi7V+/K7fkt?=
 =?us-ascii?Q?+58XMhI/avvpxxh0kSkRTONllKnfDgs1wnUC/Yaet9K/Mnq5hFRn0VunTkVc?=
 =?us-ascii?Q?Qmub7oEUrjMG6vmy+y0Y4/wfpG1FoNUleVVmS+O12wREzrcYVdUrT5/OxUan?=
 =?us-ascii?Q?sJWFwLPcFrXc7Lz7plz/mPAX4vFN4gQREXmy1e7u6W+7RL1k+DfjVA8ICSwM?=
 =?us-ascii?Q?qxmGwlZyaWcCSS5W5BT11JD6PTH4kVPsIezDUYB0FtKCHJUWcLbSuSfs1/Ln?=
 =?us-ascii?Q?HoJhED2fq29T0FzVg8QwFStIV6kfym8jDq3Y01Mezxfb0qEloLfCs3SW+7Q+?=
 =?us-ascii?Q?OCnixzEmnoRst0yXBSECvNYNNbjiPBjSA/j07qlm/kyKYPhJFdMntNDtCcqD?=
 =?us-ascii?Q?1q38XvN1if5Yv45IwFkxf6FQabgDpvVPHLf4rjcjVl9YTrldPJsebVuEiQ+5?=
 =?us-ascii?Q?figNy6Ccs8DMtbbuD7yx4Vcy9CMotILbHz/1GwgrPt8CYlA1Y/yHkZFePnM/?=
 =?us-ascii?Q?baenilNrgoJjLcftjU8OkJnoZXlsjLufM7eTADDBIdvqU6r6yM39qphRO2mD?=
 =?us-ascii?Q?k/BBJu9ZfuRdIFzzNs1b7YwOUU5Ek7Op9tR8Csc/RT6ArC4WgSl0l4qfKJnH?=
 =?us-ascii?Q?nB00ICub1hyXlsmNxWeQnNtp8bqf2Q5APAWlrBY3/HTjpxzqPwMG7wnUgoKU?=
 =?us-ascii?Q?/Ez1nRELvdmVA30VoCNK0cn9ur8lXK3xlnl8bNHgyat5GL9m0lEsowvZXbpT?=
 =?us-ascii?Q?BwjeLuA2ReH57YIxNOeOBMMi5+MJ8N9NiLO5r5kohifdzLpFeuUcSy0v9C+Y?=
 =?us-ascii?Q?wgC55BLlaCJ/GSG/CWzqF48Me6lAbQZS74DWHFX2puamJeJgBpl/RBvehJJs?=
 =?us-ascii?Q?nyvO52bQaapFJYbgTvryQZDAHKfs2oONkPn8eiEAwK6dym3l6NVTUtoydQ7+?=
 =?us-ascii?Q?Rvt3aWMVRe6U0pdeo+IagoNMzbnb0W1RDauhz3ySDDijyyNQzTStNbTY+JzS?=
 =?us-ascii?Q?yhz1jAbLGgEPjBPGutg7/hZY/xZ5akwyKFg38rBqPWNHyjHoc0S/N9d1Vf6F?=
 =?us-ascii?Q?8dQPYbhZuaCsqjOxkc2KOZwHyJNCIlDspZ3vtRnDiu0K1QYOFZozSRvXuNAz?=
 =?us-ascii?Q?rfw/6u4BVVf2at3ZZA3HaK4LujbUaGbE0H9HjVZFgHZYqNk/KCQ4RTntimb0?=
 =?us-ascii?Q?UWKlTtxB2nEIWEfnTszIz9+NvWKHaej6Yg1q+s7ftyD3QSgzWP6YsRTzgKba?=
 =?us-ascii?Q?/iESIS1D0AogCXjMfbOKPMBasMAzMRXTfWoM+TvQ2uAylL4V44A33fOXV9sg?=
 =?us-ascii?Q?+xeSrYjcZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bDOxCllkXeDgCM2GnMYvcQU7yDA/QfvgaasiMdJNQGPSW5YNhl/mGcYloi2l2VC5jS+f+yWdTI1WbPeWfbrrzgrLxZrDaGmLF9G6dgh7Hu4J8WlXhImbY0DWWziK0j4WmE4Stu7THzW9/FlgPghkRS416aLwYlWGehtX9LsndVexpoIMysWcl0CPlBRLtleovnT+xNgDUr3CBbhgQDCtYVZbkcgqfMJX6N7jlyz6tI6mgMvWWsDwEXO1Wgj9/19hTw1nRg1hOjOxNyq2ljX6Jtbt8oZjwRfpqo4hxClHh05vIA6PakWboJDmDaz/IHnCBdDO4ndwCxOxOXK50APoAg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f126e92a-77ed-46f9-c11f-08deb2593097
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:08:46.9802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVoU3KjWoYWtlwwyfEtHAibRld+COwJayTkDeivNR9CQKHg4h9bkY59W9pae7gTBvQfbQQlYFVuNHTK/zLGiKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
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

> Subject: Re: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
>=20
> On Thu, 14 May 2026, Santhosh Reddy Guddati
> <santhosh.reddy.guddati@intel.com> wrote:
> > Reverts below commits
> >
> > b4036b1a0 tests/kms_content_protection: Add FB cleanup for MST tests
> > 8d7c2453d tests/kms_content_protection: Pass crtc parameter and use
> > per-CRTC FBs
> > 925b14d43 tests/kms_content_protection: Add per-CRTC framebuffer
> > infrastructure
> >
> > The per-CRTC fb introduced in the commits caused regression especially
> > when the eDP panel is connected with 2 4k Panels connected through a
> > DP-MST hub with "-ENOSPC" and all the content protection tests are
> > failing.
> >
> > The MST subtests are skipping when subtests are executed with "--r
> > dp-mst*" , as the MST changes introduced did not clean up properly
> > across subtests.
> >
> > The create_fbs() now iterated through all crtcs and eDP (2k) claims
> > the first crtc before the larger output and fb is created with smaller
> > size. Later when DP-4 maps to the smae CRTC (it has differnt fb
> > dimensions now 2k fb than the mode
> > required) , the kernel rejects the commits  with ENOSPC because of
> > invalid coordinates.
>=20
> The cover letter won't be committed to git.
>=20
> The commit messages for the reverts themselves need the explanation for
> posterity.
>=20
> You can't have empty commit messages that just have the "This reverts com=
mit
> ..."

Right even I missed that.
Santhosh can you please add reasons in the commit messages of the reverts.

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> >
> > Santhosh Reddy Guddati (3):
> >   Revert "tests/kms_content_protection: Add per-CRTC framebuffer
> >     infrastructure"
> >   Revert "tests/kms_content_protection: Pass crtc parameter and use
> >     per-CRTC FBs"
> >   Revert "tests/kms_content_protection: Add FB cleanup for MST tests"
> >
> >  tests/kms_content_protection.c | 168
> > +++++++++------------------------
> >  1 file changed, 47 insertions(+), 121 deletions(-)
>=20
> --
> Jani Nikula, Intel
