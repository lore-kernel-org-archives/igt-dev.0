Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E14E909D6
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 16:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEB210E514;
	Tue, 17 Feb 2026 16:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqJMoSlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C685C10E512
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771345763; x=1802881763;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oYJu2kCtiZBb4Czdd4eL4bKKeOic+9qhzl8L5HeLRHc=;
 b=NqJMoSlLyeV9WwLz+7VMSUp7sSB+NrDJ+EDhtgOp4esWjTuT9ktZb/qc
 kHTAxM13ElJH3XkE88mmw9Tnv44IPrBmTxBV+vIR92NjdrzQI/MQztyOd
 zPNutDRUYDsBHk7oeE+8E697e3VFKH8Wc+G49XqHKmUAQvewDRYTXLXXV
 1x7YDKfnU8AQ3uLmtK41Tpd1H1uJ5iw8/psm8N4mc/hK0gZ+zo0mGXKBg
 oKS8ARegAXU0KCg4eIJpDnpo+GrTx/7OBp0UXKxmgLQ3XqYOr42z21Tri
 P8foSuTwXOW126kE5ccLJQzeNXfSKu69Xn4+uXGkqBVhHYghMPxC2WMn7 w==;
X-CSE-ConnectionGUID: tpbt5KoARFuGQWnyauNGYg==
X-CSE-MsgGUID: DRyyLtnfSkq33TRQU8xL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72408491"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72408491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 08:29:23 -0800
X-CSE-ConnectionGUID: DerPe5CjS6+vV5DZfLDnQw==
X-CSE-MsgGUID: LyoRXds8SPmtRZVrwkJ+Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213767093"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 08:29:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 08:29:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 08:29:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 08:29:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2h41y4DrIOkjaMAQluxuevVeEXyK0FES6YbKQGSvmIEE3r2NIvs/vFr9UqDPtS2ibd3A+vELoETVbndh2saoCCJfGl7JZuBEo3c8GrHuBqtFyo8wITRf1cko7Zdua5Wq3SBq05ziv++XHvdUu5550fOeSBZQM3V1jSMIorLSa8jOhWja2c2yL3kWiCnPgxlR+ZCHmntD2heR5J3DcL0XKynhXWH4b4Ahza1JMmaSTMjTTg+JBiWgfu0hIe5tCn+ZhJ2AAdtQ7SbJoS1qcTsi7fUTXy/TCpcBk8XVimqFHY6vY2YLX7rnP5YGlF6VM34uokRf7NlNL8jvbqVgw7VCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzFN6KNO/AdBHujATk8GB69S5GL93y1LQP7qhzUMY7k=;
 b=hjMjUlk6Qiw45grkwf4TfdJ6kGL+ljaQIvn0h5IytgBP00glglLEDIlDJApQBMsp0yqQiHd7vKaIJGeRGZf08svM5O+wBZDq+Nda65PmfYK/lK13gfenQ63NC/S/7csvn+ofe9z7mU7mW/oCmk72fLGRlr3LFqcHCOg4e2/LeRhS4iCGb7pS4lPr/bxudGOpvc7nRhS3paX5BkehM6QwOjc2KGOBz0ENncA8litfj8vCXNVau+b55uqpdkyjlyrQpTIKJpRFZirj6NC+el+GX1xF5lnncGS//ngjnwzhUUPc6ZnYjUA82aQtnE7ZGiGdXDHDhzqNSq1CpS+VpNJnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA3PR11MB9488.namprd11.prod.outlook.com (2603:10b6:806:465::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:29:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:29:15 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_fault_injection: Close drm fd before unbind
Thread-Topic: [PATCH] tests/intel/xe_fault_injection: Close drm fd before
 unbind
Thread-Index: AQHcgblxY4XEZnxNaky6G29k4d7FHbVb/AmAgCtUyRA=
Date: Tue, 17 Feb 2026 16:29:15 +0000
Message-ID: <CH3PR11MB8434E30DC541B6BEB0C6F38C8D6DA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260109224047.2483497-2-shuicheng.lin@intel.com>
 <DM4PR11MB545620EA1B0F449402A31B0EEA96A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB545620EA1B0F449402A31B0EEA96A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA3PR11MB9488:EE_
x-ms-office365-filtering-correlation-id: 1e591ebb-97a2-4372-a712-08de6e41b0c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E9iA0kC4IeGc3NTl6TqYwVejfjQ1smFxwSOGG1Fl48TblniKd+vBz8AvlN01?=
 =?us-ascii?Q?4btdWjmTCjKSbbwzuJa/Ob5Ye7tqOILWnSJBYfTJzsuwEbPqpEOWS9SbahRM?=
 =?us-ascii?Q?2aa4re7b0ZiXkz+tYG1CTEPO5Obvg0vPrno8468iROXodry23srBJfedX6sy?=
 =?us-ascii?Q?G0uXDwLEZDwBbwp0+EDLvkuWl1aVVfk3QK169JfMg+1xsSY/mZkjKqhNud8T?=
 =?us-ascii?Q?8HcjpJhZWXAOtNfAzegGUSdbCUpYXixY6p3xbj0M/j40z3N46wKgu/gf0w48?=
 =?us-ascii?Q?4C0SkDTVsoA+bDkSNAdbZFAMRENhlaxp3wbfndNzf04wIl4WCWQcKAoBe9oM?=
 =?us-ascii?Q?lJfXnGrMMipTEO8kQdHYW8ivRUvvM55Au3jlJiS3y5+W5CUtJ6PyaomQarXP?=
 =?us-ascii?Q?nIpwYNqWTbe0W+jgH2lz5ncrajdGXqOUgspl/6x11vJxRAL2sy2uucZNacX0?=
 =?us-ascii?Q?NDjcnMrzhKynY07mT0hMJGV4ltDiUnjmuSegSM/B8yyKYWgozK6lOd435Og7?=
 =?us-ascii?Q?bM+31oMLLBh23pF1yUIRSkN83avVTWeA11IUgg5yEN+7fEUATHMTXWXex9uB?=
 =?us-ascii?Q?QNArN/9WGX9J8tdMINj2iYMvLOtOXX0Jl8D3nH8NKREWImhV2hye73U4kN2d?=
 =?us-ascii?Q?cTiXb8n3uT9bmc0QUPksuBsmMj0ZlIaUJ8rGjOhtUlOrIvOhextLeK2fc+a+?=
 =?us-ascii?Q?PFlLOZE/oS2VRUxenHk79IAkgSsrtmInC1V6z3ixbdn4LAFDHyZNk78ZVis0?=
 =?us-ascii?Q?9maWcXloFLFsB6Hg/VxUzPfWZXzum+qmH2n147QtgY+eATXfUj9eIBlVypAq?=
 =?us-ascii?Q?jCAM8FzKHrr6we/YqWA02TusyppaXmn158PHnxchTacx7dZ5NZKE9QfZYfLp?=
 =?us-ascii?Q?uWDcU8MKV/9bKnamdxwpIIM/lyRosDI/l/eUK3PE8Rp0XoKD2F3uCZFO9u60?=
 =?us-ascii?Q?NGjgZBR0pqcIdaH4Bgp/2RJLaT04Rj7xnFrdCw/dL5wb/d84ELRFYeJGd1Jx?=
 =?us-ascii?Q?0kCGkJfS9TXG8+WX8puVq6Gsu23YEICri1AXxgRxszGhKothOKkJ5UeiLaPx?=
 =?us-ascii?Q?WDPl86VeNiqLxnheBHD3quWxo19smYkprkCgqWg6bJVsC+7p9t1aoMERBIYk?=
 =?us-ascii?Q?qinD0hm4y0jJKD4e+BeK+KYdIjBU53EGhadXwhAO54E8ozVF4YIy2I1UTNHQ?=
 =?us-ascii?Q?+sHhpXxQLMVi6ceuB5C2iSiag36W8yCCb5OJ50jpQZfebu6hb+o7+5TwCfSW?=
 =?us-ascii?Q?/s+Koj3HiPvOwFTL52I/8LTws8ycXghktb0fPYC/qlcrKZSUgyBPpeLl0uKS?=
 =?us-ascii?Q?Azl9u9mZ2lsGyEJ5ymhYEYCSFaY6VUrjZtYiA5dtoasBtIVSpi4j5NXNn2lu?=
 =?us-ascii?Q?tlLwHU98inEtGJMvOqhbU6AQjDo+L3SLv44rbqNg9dzVzrgmVBOrJqyqLdcA?=
 =?us-ascii?Q?nP9DBNT8u2BAIXeDXfsI+Q9aJymb5G1Jc9mlORwQlE14cSWgCGsMgu4rARPJ?=
 =?us-ascii?Q?g1eZEkdG4aPsxoO9HaVKIQpGWgzVafekWX/yVlZ6qz2HX99loBDdhqgw67Ur?=
 =?us-ascii?Q?irWKEp3h9My7QlQtcpvs5mtXVMUNT/KdnawxJ5N4xQND3nqLbGD5cg6bpNS3?=
 =?us-ascii?Q?jPvKrEU5fRLQ07TXYuesGwU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pJPwe8+cGxuZawiIXVoWE+Bj4OJVIviqeCQKwklMt2damWn9W4v8BWdBopu3?=
 =?us-ascii?Q?vouRSduk9gFQC1JXOmtbF/EPYCyZX+tBcA+MomrmWouZd8mxpTUdkZkDny9k?=
 =?us-ascii?Q?rW14C7ND1RyMl172S3t/wld0sYJt2SrrzeuWw1jUb3Q7DetmUQluWN8ZmRew?=
 =?us-ascii?Q?bscWXcAqWbSEYKAFeK1uDIOJYhaM7ohv9BWvKalCvkF4UNRLCRBLN2Up88S2?=
 =?us-ascii?Q?iDCGa09kuztxmcG+qGN8URh2165sdccs2b+djhVRp4Zs1yCQMW4eUCzsxwe5?=
 =?us-ascii?Q?xaQRZWR8f9OafyXXHpI5WvTIDGIZWwIYStBhpvt58B0N0BVuVqTtJAQYAYZA?=
 =?us-ascii?Q?rcpOzPqRH8DJdH1gM/fYswu/wazErJy950BwJXau+8Sf8WfuQvf9Qoqb8mKm?=
 =?us-ascii?Q?S+kAkhgq/miDWBS2g3GhAZJ0/JAGJ5SP6CjHFRqv25BSiAPNFKXbsjMYOH20?=
 =?us-ascii?Q?f/X7M4gwA9cY7KAJuOBGqnx7rkaJ0YUvxLE2wnIu8cOsAUdSew+DIHqpilgs?=
 =?us-ascii?Q?wUq5YT071xOswLHnv8FWlr8bfvrDf4PAUEzN+NX5Q0va0dv2elHvLAisheVY?=
 =?us-ascii?Q?2GCIiMFGtfKOxiEV/k/OYR4z3kKGTY2HDCIZxJaCcr05sArst1Fx+KNHWCe9?=
 =?us-ascii?Q?pdlyuYCtWpC8n7Rlrd5WKMhPzJ5doJ5j09Op1S5a3pbVP1IK3nfA5FirMEyc?=
 =?us-ascii?Q?4RfIoxGG/8kP/JdZH/bQ8vf342MZPkc6spbZ93uiyVO/bK36MiUN91G/LBwI?=
 =?us-ascii?Q?9QSBKMZOfEp6sVTCk5zFevo8mAlGPuF/V6WVne7TuG/RqSvoolKgKvxHAbCe?=
 =?us-ascii?Q?OJ/7LOtokvqTyALpeoPzI6O55e61q7tdeiwKc2Qj/G0kjoekV2lcByyhTpcu?=
 =?us-ascii?Q?IlPPT7nCGZAzIyvkK6NnmxhoU5TeZooiaB1zPAcWC35/YM3abbwoEmICCDKy?=
 =?us-ascii?Q?6EzIbBAAfdGoZ7oL1lnME3dag58uC0Z7cqA3f+u/QXcKMx4LKY/In9B6b61n?=
 =?us-ascii?Q?NJ8ZaF3HABhiRsdfiONQ5L2nywJec8Bg+YMRoxWe9u6J9PE4OinStloi+1WE?=
 =?us-ascii?Q?nSIWhUgHAM5PewPq1+U9xiOj1TasdSeIjLqO4JsGTtDnwLhvjkDnnaPZHnTJ?=
 =?us-ascii?Q?9u/OM7Xt3OtRvurP4sY8pt0L0dEOR8Cckhhd6lBAR23QoKtsl8w8wOUGytmO?=
 =?us-ascii?Q?kIh6p2/p/SMZcA61PLDMtwCfNGgbpfMix3+btkjAhfQqpoxxkI0Rl0ndY2SV?=
 =?us-ascii?Q?lHq+hD8LAn7fxUuLeHnq0aOkteYbNjiV2n8D8hFE9QzP5GTYsY6vOmSauRsS?=
 =?us-ascii?Q?QW6HqlNQy0MTKTXlh45boH1kRtqCsBkKRYB2avhgvC40Srl4eErEoqJSCp8l?=
 =?us-ascii?Q?zbOA89gFmof/SfggygAaNE5EH25aPjFf/b6gLdnRQW8EiWaz7LzVhzZv/bEI?=
 =?us-ascii?Q?ShN5KjGB8ddpSh/1aOQXh2yZO8w8MLtRrP7Lxj+Oll8AVJkdK0kDcOtwhtKG?=
 =?us-ascii?Q?8Vnjm/z9IGcPWX0pV9YBg0rDDOyH44DBa5hlTfHZ3l4jPz0qzUMJQmC2vTso?=
 =?us-ascii?Q?XpLEC6/RcA38fqnZk/G4IY/MwENjg6IGOgFJIi52XMbrfgt8SsFgsWK7Ipyp?=
 =?us-ascii?Q?MB9oPJmNpqJMsEzUTI5EseuDCxBMECI4kdXdWTumyXPrYAamOEiHeY5r8KkV?=
 =?us-ascii?Q?uEvnOkw52mVWo8lKgJxu/TqHFFcumHMGZB2Hypq3pjFh6Axn93LWz1ymSbmh?=
 =?us-ascii?Q?wU1F4zeJPw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e591ebb-97a2-4372-a712-08de6e41b0c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 16:29:15.0594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZfckY6XYD5ti8cEEz2+Hdy5pRT/TMtW/tvpHt+NwDc1xBIhY3DhU/t4/WHisartC1/J09uaGBEdnxrKRgJAHtfcX9olKYxXK0OXS+cI6r6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9488
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lin,
> Shuicheng
> Sent: 21 January 2026 08:14 AM
> To: igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH] tests/intel/xe_fault_injection: Close drm fd before
> unbind
>=20
> Hi all,
> May I ask review of this patch? Thanks.
>=20
> Best Regards
> Shuicheng
>=20
> On Fri, Jan 9, 2026 2:41 PM Shuicheng Lin wrote:
> > Close the sysfs and DRM device fd before unbinding the xe driver.
> > Otherwise the open fd holds a reference, and the subsequent bind can
> > come up with different card/render minor numbers (e.g. renderD128 ->
> > renderD129, card0 -
> > > card1).
> >
> > Also drop the unused DRM fd parameter from inject_fault_probe() and
> > probe_fail_guc() now that these paths don't require it.
> >
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/intel/xe_fault_injection.c
> > b/tests/intel/xe_fault_injection.c
> > index f3bfc4b40..76d1c6fa3 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -260,7 +260,7 @@ static void ignore_fail_dump_in_dmesg(const char
> > function_name[], bool enable)
> >   * @xe_wopcm_init:			xe_wopcm_init
> >   */
> >  static int
> > -inject_fault_probe(int fd, const char pci_slot[], const char
> > function_name[])
> > +inject_fault_probe(const char pci_slot[], const char function_name[])
> >  {
> >  	int err =3D 0;
> >  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n", @@ -
> > 289,7 +289,7 @@ inject_fault_probe(int fd, const char pci_slot[],
> > const char
> > function_name[])
> >   * @xe_guc_mmio_send_recv:     Inject an error when calling
> > xe_guc_mmio_send_recv
> >   * @xe_guc_ct_send_recv:       Inject an error when calling
> > xe_guc_ct_send_recv
> >   */
> > -static void probe_fail_guc(int fd, const char pci_slot[], const char
> > function_name[],
> > +static void probe_fail_guc(const char pci_slot[], const char
> > +function_name[],
> >  			   struct fault_injection_params *fault_params)  {
> >  	int iter_start =3D 0, iter_end =3D 0, iter =3D 0; @@ -308,7 +308,7 @@
> > static void probe_fail_guc(int fd, const char pci_slot[], const char
> function_na
> >  		fault_params->space =3D i;
> >  		fault_params->times =3D MAX_INJECTIONS_PER_ITER;
> >  		setup_injection_fault(fault_params);
> > -		inject_fault_probe(fd, pci_slot, function_name);
> > +		inject_fault_probe(pci_slot, function_name);
> >  		igt_kmod_unbind("xe", pci_slot);
> >
> >  		/*
> > @@ -662,6 +662,8 @@ int igt_main_args("I:", NULL, help_str,
> > opt_handler,
> > NULL)
> >  			oa_add_config_fail(fd, sysfs, devid, pci_slot, s-
> > >name);
> >
> >  	igt_fixture() {
> > +		close(sysfs);
> > +		drm_close_driver(fd);
> >  		igt_kmod_unbind("xe", pci_slot);
> >  	}
> >
> > @@ -670,7 +672,7 @@ int igt_main_args("I:", NULL, help_str,
> > opt_handler,
> > NULL)
> >  			bool should_pass =3D s->pf_only && is_vf_device;
> >  			int err;
> >
> > -			err =3D inject_fault_probe(fd, pci_slot, s->name);
> > +			err =3D inject_fault_probe(pci_slot, s->name);
> >
> >  			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
> >  			igt_kmod_unbind("xe", pci_slot);
> > @@ -680,12 +682,10 @@ int igt_main_args("I:", NULL, help_str,
> > opt_handler,
> > NULL)
> >  		igt_subtest_f("probe-fail-guc-%s", s->name) {
> >  			memcpy(&fault_params, &default_fault_params,
> >  					sizeof(struct
> fault_injection_params));
> > -			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> > +			probe_fail_guc(pci_slot, s->name, &fault_params);
> >  		}
> >
> >  	igt_fixture() {
> > -		close(sysfs);
> > -		drm_close_driver(fd);
> >  		injection_list_clear();
> >  		igt_kmod_bind("xe", pci_slot);
> >  	}
> > --
> > 2.50.1
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

