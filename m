Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FC5C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 08:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEE510E3CF;
	Mon, 17 Mar 2025 08:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRVuRt9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595E10E3CF
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742201798; x=1773737798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pMtp2K9Z+hOsfFXN/VB+nNAGgVsKEcWrap4InKWGrvA=;
 b=lRVuRt9PxVRYFUfEqzXi0zpdUoo1/40AE8APPsDfq9k5n+1f9lWpMpFa
 b+HJrImmeb6/jjPAGdjPhrARcfOfTH8+zjQZMTZA8Y81WLxiagQt58sMQ
 wI754K340XRDbxtre/jZvx9NwfjTqOkNBVBtd2PLfMDd+h4uYWFRCFyXt
 tikeH/OsYZ4PBOivjwEk7mtT6FvPS9un21dlai8NqevTom5PpXEqSIJWN
 nhTWfyVW6KBgYGJcH7ykLvETreYFvNoJ0OQWZA4PIHnjvkPNWGzireaTh
 HQSQ3e3gNlBKbtfL4YvWmwqDWKQ49L/PuxJ88gZ0juEtLtmM91ZlGqWcw g==;
X-CSE-ConnectionGUID: bwYQAbJQSBGnvuxYQN6raA==
X-CSE-MsgGUID: eQWAPgPUTnqMnRrD6mMwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43389226"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43389226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:56:37 -0700
X-CSE-ConnectionGUID: o9++Lu6hQM+xprmr1gMx8A==
X-CSE-MsgGUID: 4eQoW6s+QmSeB+2ce/T9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126958770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:56:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Mar 2025 01:56:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Mar 2025 01:56:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 01:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGd9YTYZ2gqNRcibbxAA1DBB4FWEX0vxhwCqtx8ve/HgSj2iipm+tuj6FrRAHeM1vCmLtNyXv8q9bX8HD3agKGOVU9aCShXrsaNEj5PJUsHOmuwJDICSo+kmK1qmizkJL5MGihjRItSRKi8hX+71Xy2YzRRDb5tU9tAX8aRib1NUaJmBAbWLqjB7L+7CQ39R50l9+SgO0+YUZpwtZfP//PHUP3HPpUYA0UdXbvMndZNw5wS9vgsmKqGbhVaJ8fG7iqA0zFLrBcMJPPjuLdSQ0iEJktTK3KN6jXoXSapusVqNhqGIdEJ6kAXiFl1h2l7Ru8I4ouGZmj8L0RuW9nmzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjC2ZseWx+HYdRkOEDX76wmNVMNQVeyP5gUk0tcXSEo=;
 b=WPhITGTtdHkgbK1nrEM8Oz/sNhFySEltCmevfdlXSfHgsgZkWtjyuEzCMNXab4w12uTXlvu9d9/EpFeXBecE5YOl8gHOteaPow441ATnG6dOJ1+9xFMwoMbVfrTDU1U7JRoFlSD+gEgR+6ulyp2lbp+u9/u7Wn+3HLWAVF62+/1QhBgFGNarz0mgPgMv2t0Bbb/z/QTGM+dBioe0qshx/gq2lfNccDnma1ygmzrAuv4jibKVZCSopAtZcFodAgXcP/IyYFC2TzkYB1iAaMGkjPB0Xpo44wZYdFX853KEl3aK3DcJ0yRSCeZxJSAZVnhSfPxCAqiAMXVAX+2cWOXWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:56:33 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:56:32 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Topic: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Index: AQHbkmPZmUjSF5C9XkagahW5LY/ap7N3DcYg
Date: Mon, 17 Mar 2025 08:56:32 +0000
Message-ID: <SJ1PR11MB61297304FD895ED97AEEAA43B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
 <20250311085422.2573860-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250311085422.2573860-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB7760:EE_
x-ms-office365-filtering-correlation-id: b8e61927-2a19-4254-e1a7-08dd65319d9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?M3cLgtNZ5ew3Y5RVln2mpobINl+eILsypuHINpemHRWo4RBIEx+VoFwzVaJ/?=
 =?us-ascii?Q?glwMWWj4oE5V09S17K5D6ZWoMDxeHYWaHbpCJcHgfxwDCyGxBHGz0D1oQZkr?=
 =?us-ascii?Q?jMUcgcFcYwG1ewgqaki6N0uXHaNPLcDevbGMT2RA0WelCtdQurQVjqCAsddA?=
 =?us-ascii?Q?yEjg/FkGyM76euJkEcL2TsxVmIDwygmT/GuKzqrjD/v9s4o8BDOGaZ7BQtxc?=
 =?us-ascii?Q?FPpNDnTKHbUq5aHAGicBLcYNifE1s0AIGTLn2voX8sQZIpmV5P2yPwVzPeSF?=
 =?us-ascii?Q?Tgn5pkhb/4wBEzaaOROyWi0pTvFG5Z0SmjApsZPK0Ps/xqq6W7SUt2r5Q/an?=
 =?us-ascii?Q?qSG6KVom/sh5COL3ginF6/tIiF/8UshF1fsJN5EzPoH8tit2BmN52ibpFKka?=
 =?us-ascii?Q?SOwztbs5JQOEL9OabtKrFFvbAtXFwm7YQtSyjNtl0GyllI/gyV0gc2MKWm7R?=
 =?us-ascii?Q?K6LmPletbqnH1jB8ABbG6g5sx4hZHt5g4+8V2B8ptBiaIu58JDzQleLMHBZv?=
 =?us-ascii?Q?73ZSnhAR6k7WQYQqzcKZY8RhgpVOOeBKcNPbVN/WH97QpeU3wnWlmMoTBCSS?=
 =?us-ascii?Q?hYPeHv77dVRtDe5Z5fxXUdeBjvSmBFhvSiKxIcXCPsN+wcLAPIT11qNs1U7m?=
 =?us-ascii?Q?yay+1MHbNa2rubvjVwlVCEUtNRwLFXsj/JFCiDiOP8BZWxgXbCEtDpFpo2Eh?=
 =?us-ascii?Q?JXs1Rbwyv6pwQHsRltviVhBIddHO7RIn4VZlP5S/zvXP7bHCCi66XPF1A6En?=
 =?us-ascii?Q?d6V40yE/qRQG7ds5suyGEJv1x5CMRiDu3B5bWhHxXk9jZcYZCje03fSe3j22?=
 =?us-ascii?Q?nTp2oKfwLSWtze3nATOPd5zbYQiVU8y2nXZc/yDK/CL8HHE4bNQPbVMV5TK5?=
 =?us-ascii?Q?Qj0z2uyR8KqYUP04trGCXseN486xWRzmHGETIBjIOKTGoHfqgYcm64ibe1AZ?=
 =?us-ascii?Q?s9RCzfmsNbTnzsKLQfpaL+l3QMVldZxeJwBMFXwSzuAB6Vv9CfxA+R4iI7ou?=
 =?us-ascii?Q?KzTE8eLZowTLXSkHM+6tc7X6HQ1T/0aztRNk4bwf8AMguv48eARYJtTEjrKB?=
 =?us-ascii?Q?Jg+x/5htJ4F+GdlZEbXqOYYrvbU0kpJWyS1085L/w9pvGBt/jBZVuUgfDk7l?=
 =?us-ascii?Q?urdxmwGNWedr3bQBWPuf1ZuhLNjmESxPFM5GvnXO2GAifx7RAo63i/nXH2l1?=
 =?us-ascii?Q?hq8vX9WZ5MQZN0xSL0NnlZw8G0douR/AImDP6OU/hztZK0YyQBqlvS/07Az+?=
 =?us-ascii?Q?sjlOO6navR06LpIE/MCc0lURWH89P49J4sivXapmxYLKA2Kgy7EGYecmf5u+?=
 =?us-ascii?Q?LFqel19WiiF2qms63Hnjzl4XQzaLvSU8WXgSN5Q9dQt7as9Iz3FnssYdcmB+?=
 =?us-ascii?Q?GO0E+yXZEt6VmoTLXJrkcd7bG9t/RBwEvdM29dLMzUKVFAgeJQD058NnBiGI?=
 =?us-ascii?Q?d1TC1akyQSkHzbVmyEjYJEcucXRq4QIM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YB4DOsYAsx+VHv3tHRlqGN/3R0f8jVYQoBBhY1gYg0yVkVTWFEfDCGcK/c68?=
 =?us-ascii?Q?ggI+G+6aN/MIlCixDuPpj2Xpb7K1hV5fidzYoHJWHv/3KemstZUgd2ANEIYR?=
 =?us-ascii?Q?hav+DtokpOpEyMtzt/7EmTxfNWWaylAS04sAKfO1VP35/RRCbLOyLhoWCK2e?=
 =?us-ascii?Q?6Lmz156C4xiLGel7Wh9S2Onf/hT1IAPMZhvNH767fWd0SUwmOTIDwCHQhOl5?=
 =?us-ascii?Q?HBo/S2wygDsWUit9BpOAR3VoujnrA++fAADOLiUBm1cLOT/jazlq9JW3eq+w?=
 =?us-ascii?Q?k7yacf9UT9k5xyF0QuC3NFvwJiqsGcaZyE9vf6TmJfTgc3n+ur7dCdg8PpgG?=
 =?us-ascii?Q?kBNmlyZYyIc/VwXreHYWMh9HFsdga4sN7kYOUNj7LCjmUPYuMjskTFWFlyvw?=
 =?us-ascii?Q?jYhWDC0yOFLP9LepTJiuh9fBhCMRj6b2XGnOeOVt9CjIfxB5k7tZ6bnSe6KF?=
 =?us-ascii?Q?EJhH5NH5dwnn5aCn6aq5Y+JVawjO+OyXaUZy0Q5ut7HRnrfI5tAOb6VQ4fWN?=
 =?us-ascii?Q?9+dVZpALdXifV4a2WuCJs1oV2U8gu37cPrgLNr1TevtGNjnym0WelCuBObgK?=
 =?us-ascii?Q?xG79VLhuEeZ6lrWBQjzxUsF9eeOENB0O3OzCRYM52XB5/FZBMrHbXJyqmOpg?=
 =?us-ascii?Q?kGghkREaGF+l159HeJZL8bAOGp/41AItWkRAgxrv/jRKhX23yxOCKBAeGvcW?=
 =?us-ascii?Q?bch2bXy4y8uwBK8dofAE7r1L1hj43Y4mc+fTR8So/IGrA+cswPNXnVPZtpr5?=
 =?us-ascii?Q?QKzEsxamWNaQKWNYPNz3vjAwQV7fGrx0bZVMm7iCZEcgEHF4R7efvbws2Tq3?=
 =?us-ascii?Q?FCfghGXnW/1yUNg2pq7c3fL/mprm+9scjQ0aYzOq9XHnm0oWrYLNwatx9hBt?=
 =?us-ascii?Q?ioMmmjkB/QTIpQRz4MTh95sQon1rCnvWGJj1u93x9Cj9vYOWd5DZWbfqExsL?=
 =?us-ascii?Q?rplt2HK4UA3MyOzo6cgTyV6UVW5QRG+zKg2pA5u0i0lok0BFiYfVxt51T3AP?=
 =?us-ascii?Q?logyTKNm2dy/dNAncPthxWTZ7s9p6CLwviYnq0G+M7R+0k+iO+42piJ+QDpK?=
 =?us-ascii?Q?4xoN674AtXA35NNu/kAXB1epAJPXY9QQP26PcIwOyT3h1FQHhlJfgaXruK7e?=
 =?us-ascii?Q?/2ZYz+eRUuJQjF9wmiYOlGmNpapTnV3xRx7AzmPnqzAv+eukCsvhVowXrwzi?=
 =?us-ascii?Q?/FHJU9n9U4b2+7Wd+RJqs7F21ElWpq6OBmTqDTQTgCjJ9tLUKtUxRA2IiuQI?=
 =?us-ascii?Q?e/7iEZaFQv51zFqxV+7NQVxqXBWnWPLG2V5CqJeE7xB2TPr8C8lzvaCRL5j0?=
 =?us-ascii?Q?hp/MDouPm50ZA0Onl0eolnvqW2x2sXqLMQYBCSGm7Onllej6dtsWtdpW+z3z?=
 =?us-ascii?Q?gkc9a8vJRBzSwE45qK+Mao/zKi/cKnNUX/eLA0lY0DBJSatShOtBehen6QXR?=
 =?us-ascii?Q?NdKObIzW8B5s0nq917Q/aUDlAzS7pyMuhDwyr29EUK+nwWqwUuP7fFFVfSFn?=
 =?us-ascii?Q?QPTHYKf/cDR4F1O/Lq9kosDQlw2m52UxkFaywmIQmc5maiWwpw0ingV55PKJ?=
 =?us-ascii?Q?kLmVdE9rw+FATTtMCgs/SbkrKy+S3uDlv8ZBmxddQYwEAq6CIHGaW2NT2QuB?=
 =?us-ascii?Q?Uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e61927-2a19-4254-e1a7-08dd65319d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 08:56:32.8201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJvjl5FLBvHrlqYBCMOIPhuH6J4Fo4ESM9HhLcV+rhD81EMieK7JXxJEiceqWmr0EQv/Sbs5rUDkrSSBlJYnuYDPswq75KTDFBi+FrrhSV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, March 11, 2025 2:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
> modifiers and formats
>=20
> Parse "IN_FORMATS_ASYNC" plane property to identify supported format
> modifier pairs for async flips
>=20
> V2: Add new fields async_formats and reset idx.
>=20
> V3: Improve commit message , remove unused declaration (Chaitanya)
>     Introduce structure to hold a format modifier and its
>     associated format list.
>=20
> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>     (Chaitanya).
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_kms.h |  7 ++++++-
>  2 files changed, 51 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..dfb23c45e 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] =3D "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] =3D "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] =3D "IN_FORMATS_ASYNC",
>  };
>=20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D { @@ -
> 5758,11 +5759,14 @@ static int igt_count_plane_format_mod(const struct
> drm_format_modifier_blob *blo
>=20
>  static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_=
t
> *plane)  {
> -	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier_blob *blob_data,
> *async_blob_data;
> +	const struct drm_format_modifier *async_modifiers;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx =3D 0;
>  	int count;
> +	int async_count;
> +	const uint32_t *async_formats;
>=20

I don't see a reason why we can't re-use the blob_data and count local vari=
ables.=20

But that got me thinking. Are we leaking the blob?

I don't see a drmModeFreePropertyBlob() call made after drmModeGetPropertyB=
lob() for both sync and async.

Otherwise the change looks good.

Regards

Chaitanya

>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p =3D plane->drm_plane; @@ -5822,6
> +5826,46 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
> igt_plane_t *plane
>  	}
>=20
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +
> +	blob_id =3D igt_plane_get_prop(plane,
> IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob =3D drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	async_blob_data =3D (const struct drm_format_modifier_blob *)blob-
> >data;
> +	async_count =3D igt_count_plane_format_mod(async_blob_data);
> +
> +	if (!async_count)
> +		return;
> +
> +	plane->async_format_mod_count =3D async_count;
> +	plane->async_modifiers =3D calloc(async_count, sizeof(plane-
> >async_modifiers[0]));
> +	igt_assert(plane->async_modifiers);
> +
> +	plane->async_formats =3D calloc(async_count, sizeof(plane-
> >async_formats[0]));
> +	igt_assert(plane->async_formats);
> +
> +	idx =3D 0;
> +	for (int i =3D 0; i < async_blob_data->count_modifiers; i++) {
> +		for (int j =3D 0; j < 64; j++) {
> +			async_modifiers =3D modifiers_ptr(async_blob_data);
> +			async_formats =3D formats_ptr(async_blob_data);
> +
> +			if (!(async_modifiers[i].formats & (1ULL << j)))
> +				continue;
> +
> +			plane->async_formats[idx] =3D
> async_formats[async_modifiers[i].offset + j];
> +			plane->async_modifiers[idx] =3D
> async_modifiers[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, plane->async_format_mod_count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, plane->async_format_mod_count);
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..78d6a7ee4 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>=20
>  /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>  } igt_plane_t;
>=20
>  /*
> --
> 2.34.1

