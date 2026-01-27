Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9410D2F02C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 13:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AB210E573;
	Tue, 27 Jan 2026 13:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmDyJCQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055C710E0C1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769521336; x=1801057336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dMm7rljMiE/zfmXPOMNVdLYfi/NqwFPuQNSMreNNmKU=;
 b=lmDyJCQl1BbdzpkOIESSSu1jeDL4KvFdDFyeu55JWIIaoLGrRpvWHNQm
 BX44R1TyWAc4qx3f3ytKTqNaYCWk1gcXNYnyNqOR+uhH9rqCQ92xgyOUH
 6MzpCo69N8fcoGx4zYeqeu3UO98ATXN4GK+oWFTmBay6wseJDMbTghRrr
 +y0Vy54MkhwwVzdQUhXptkAfDHGwe+aeUMNugGzgCu9Bvi2fg8K6gcZNK
 lPi5Dz7BDIefgA91/QI9orzlwSMOaFjU353nO7Dc96gwGI1JhvZ1EWNvi
 2i9JrlZ3MNh3yABI/pYzDPJdtcAk8ZIcQiIyM2HUiPBq1Irnlh05Jyf9c Q==;
X-CSE-ConnectionGUID: 6kAqiVp6RB+WeXlgBOa0Og==
X-CSE-MsgGUID: aSgvyMNPRmqzA5VWX2G7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96180070"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="96180070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:42:16 -0800
X-CSE-ConnectionGUID: dVE8e28CTpy1oTcgYX/bHA==
X-CSE-MsgGUID: lDzrDJjgT6aKf8czlEPfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239238490"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:42:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 05:42:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 05:42:15 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 05:42:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFXiLpOkwu3G9IAh1aEuwxWq1sH08Xv39+ZeZeI+SGU42vkuj3BCnbzGNSck+hHCjNoysj7xXGbgpkvyRL+yaSHHoRJ7SW4NlbVRqtRLLyOgVApjZFzmwjt8TLg9UI9Jr6RaCbW8AgFLYZ81PB69yESpLcGvcaGLegpfbHqOEYt/DUPoD2ZJuU9nIW/58dgzyaJECSHuq6URm+9KIAq/v2rXldywNV94xFVxjDPg1kHeVtNu6BaUPnAETUQSSwJ/tzDVXinFHUZ0aZNKfZJEqQZ/mK2z0JeqFEJcPm90ziCHOQl5xLUZRo7R25seJ8alclCmYkxzBowECa6kbSKaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9UiyU9KLqZwXDEVVGADZ8UyHTvq+qUCHUlgdj+12Gs=;
 b=Tkt0n72R4Zc3wab6RsJWibyPYaOQ+qF2UB14ipR/nz/9EAnmMa3TpxOv2/VVQtarBR5uyB3SucMPVnEMJ87Du4jqvc2oLOd9WXRuL5Tsz5W3SH/wmdRhBX5SHPH2Y/K9DK6CFVMz29870TdmZ1FunGeXIcuE1ghfU1t+x2GHXESwzdzV88Kkj5SQ46khuO6CL4caAc4/M2sMHBMwPR6z1b+7jSgTqQj252yPFU7hlBfo+OKde7YLugxHCFPK2qInMEm+Yr8gZM+I8avNjnExgw3vsyw1CNDMFv78TQP6bfhV0/bx6og33zyr6DTUBxIjUwqm10528wupz/iKPhnZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Tue, 27 Jan 2026 13:42:12 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 13:42:12 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
Thread-Index: AQHcjFwHbvDFo0MjckSQwK5CeWGrcLVmBu7A
Date: Tue, 27 Jan 2026 13:42:12 +0000
Message-ID: <DS0PR11MB726440BC41A7576D0F9958B7D990A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260123113523.262544-3-piotr.rudnicki@intel.com>
 <20260123113523.262544-4-piotr.rudnicki@intel.com>
In-Reply-To: <20260123113523.262544-4-piotr.rudnicki@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CY8PR11MB7196:EE_
x-ms-office365-filtering-correlation-id: d035fbee-dfcf-466d-fdba-08de5da9e00b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021|7142099003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9URflk6JXfOFUi3AUeTtWJldD7zxCoRdyI02rCAfWFUs1N8U2Zci/XttXA1S?=
 =?us-ascii?Q?uyv6Fyhj4zPZ+91kgnvXwRwcAiIFnl0EAbTbJrW4txkeCx6I+UbQ9V2qJTui?=
 =?us-ascii?Q?Q92unKyHLL1lkvxQudXVcBp/PABShPUD/fCcOiVYRSB8kfSxjt2KwvCK4kd3?=
 =?us-ascii?Q?na41JZzw853S0EFy9rulDc+PmgLiSkiyWBFVBsUMQHJ1qstBsdh5YXuPHxlh?=
 =?us-ascii?Q?P5XWW7Ib692Sa4C5JdPcsEO/pe/NLEnn2sv9wSn3mnuVlQa5BfM2kV2Zg2CK?=
 =?us-ascii?Q?onqTlzilTsSCWbu2AMzFcGTPMXRwsjGI3jjt5CBKCEKgqt4tdfMKJkcHyTj7?=
 =?us-ascii?Q?+JqLi/nOH46czg9e2inmd/HRZa3bpxQQIy40U9qbQ80Bn0l6d4Iid87sbO+V?=
 =?us-ascii?Q?fi3VKsP4m6SpHHwKAC+YbK0795Jsf1zvv6hjrJRcaIXp/dS/oEiyC2F1x2pl?=
 =?us-ascii?Q?qQrFI3Tt2xkhqv07OIZuJ53VjqrKca8hamcpP8gDjcHjC5GDsdYGVrsYpltL?=
 =?us-ascii?Q?zeHXK2Ity/LtBBeWMtLbw9OLik7Xf3MaASy467qFsdXejzU3HmpKniZlGnat?=
 =?us-ascii?Q?KS0LqC1E/vUMsiAKEvfC/kR9py5IiQF0d14p+TKyZdgUDv2rRm19/O9WZgGq?=
 =?us-ascii?Q?U7K75DmpErhtjncygSRKL/YtolD2IX56+7vuwWKmxYdK5Shz7TxXKUXZ1OhI?=
 =?us-ascii?Q?NC9M+D9CCq8ZoqtcDRjX/1o1Oa4+w4iMH2fNdmxAbcGjQ1OYO5qHx77hB5Wm?=
 =?us-ascii?Q?9uziuAIB80wWWEY/oeLWnSyyUkBokFlPj83QrFhuCI/zXzGlhZde6hic/hsZ?=
 =?us-ascii?Q?BUX4ua6EE0+z1UFlcAxTBp8bo3BUAjmcUSHJJaRrmB2Agi//+vQW9IYsFwVW?=
 =?us-ascii?Q?hlq7k/eywY5LTzf3PNbT7eWo4Gai7w1qtESU+bD0HvR0b/IZmS4XjUXI8c/n?=
 =?us-ascii?Q?PiaqKv+dDb/OhNMuDjQL1FUokoUdcltlzo4Mw6Z0s7D++S/iFRKDmSgC6Opr?=
 =?us-ascii?Q?qwjViqyglVYbadAnST/S61R8fcAVvXVjD8DayfV0D8CMJwUPdoDKkjLQyUNv?=
 =?us-ascii?Q?66vU+W7mKlW1TBDMuSQ78kac3U6ZxurlmFERcuYaZns53JuJ6Dekh8jq3SpB?=
 =?us-ascii?Q?RdjXdjNVEG8qtkNx+vBfdmAhC3gUqlh9BoWK5ST/tsLxbmIoTdhlJb7sn0qK?=
 =?us-ascii?Q?3lBM2Ynigjn19j0GS8FkhOY+zTnRBL2PthXavvRuSeyDdjVIWXHN7K9SLLNg?=
 =?us-ascii?Q?U/9gTYtwovu6dftoHGI8j0XzOQg9WRSLRk5zDQjV1NvBxqFZMBW4ffwA3dbY?=
 =?us-ascii?Q?k3LWe1rrcXVeIa5cHJEGjvfdWXAxQvYOCKyAXhQTIdIhiaN5MhPUqXTvgE1e?=
 =?us-ascii?Q?E+BJxAADix9NIrzhg2WFPVU/FPpYZaN83hgSsH4+l39PLeL9fPx00rlXaW81?=
 =?us-ascii?Q?td+XvcT2Jpqzf2oyKcaHVKVP0cpyipwNMOQN25WzurVhHNftTeZw7qKTAFTZ?=
 =?us-ascii?Q?9NTxutrUNzg+2krZu5eA7/t23nt+c6bhH3GWzsa0ENn+y2v/894A7GkFcw1n?=
 =?us-ascii?Q?h7WrZmmFEwLdSMG9QhmBlXhG+xLKC7h735cDuzKYi0uDwLUJePQv+TiMyCPw?=
 =?us-ascii?Q?sbJP2jGIeLVny4D72MVbyP0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021)(7142099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6f9zyOjoQzW9NyfDC8XaHN1/mFcpDZ0NCuH2fHqt/vuC1SkEzNQmsW/LBGnj?=
 =?us-ascii?Q?07VDeyStfEahRYp0/SVdWLx2ZvkUtOzaIrI29bzjtJW8m61cyKgBcTEGtYby?=
 =?us-ascii?Q?6GuJJl64JHs3Vy4O/eYUtga6TVOAJUeL+staCCmRCme2aZI2zsLpGZyFlHfc?=
 =?us-ascii?Q?hwrNdC/vr2/ey6UKu6Zlo/hIu3teXM/2SnHz9LRku8LDQaH97kXdvbVKIrrV?=
 =?us-ascii?Q?XVKt6HJK7QPsU8OhvfyKCevLvTMG21MP95TvZ9Ae0CBcwhD9ZT5+6luP5hbc?=
 =?us-ascii?Q?aBTxgVi3+lewkkvMyiRZwunM5yfM/aRNIDEz08HPVtC00232u0UxTtg4gFST?=
 =?us-ascii?Q?kTz/91KRj64cOkvyyb3kRvm61Ir6Jsqsyl/XBVBIqT/ZsVb+5bEO+yC9UQAL?=
 =?us-ascii?Q?VFfok8xZ6Z4xjrdVFqa30WYB310aVQuzKZHRE9HhqOLWP6QrzcQ6ux4Wg+Jc?=
 =?us-ascii?Q?x2abkGbbPv04I7ycP+nSTfsbIoWpdgy6wT0y9p09eofoEaBBhjfxQ+rSNWGl?=
 =?us-ascii?Q?CQ11Hj3siz9SBz3QxKUvlN1muTbVqoxBL4VdaxL1kdHms47lyJDHSd7xV6e5?=
 =?us-ascii?Q?dlB3KqmudYdE30qDmtNT7lEuKMbm6UWaLofMywo0dhF6cjxBNlQAXXjfmNSR?=
 =?us-ascii?Q?wEjtMVKDdAG8hdPao6qwwMPFYK2+lDcwbeQf4S3CiErLH1Opg1tojNDyHoR1?=
 =?us-ascii?Q?RgeF2lEEQQbXmJGLDXbclzUO/nn4fNjyNhp+DVrdIA8ORAtL6ArpyAaubqV+?=
 =?us-ascii?Q?6AOiYubdbQXZG7tecZF2wkQ7O/uVT9wI1/mTZQPjHBwgK+l99apEhrwizYEs?=
 =?us-ascii?Q?f3TLZJLQlq1fdTI8SCX/TLtLwIH3E4YHVigjI2mtvKFa+U/4CPb9pC3Bk9Va?=
 =?us-ascii?Q?iUkFde3QeaOeLL0H5gELnqcNxu15siVdYq5gUsTdWUZT7dVluQ6pZ2ItEsbi?=
 =?us-ascii?Q?6XmkBn81ZNRMaQNmn7e+lrII14jBGI7Yu2uCdq4ZayfTYDWqPlQjQxSifxos?=
 =?us-ascii?Q?eZm51g3j7d8J6LJvKlVl4SAi7sx54rCqbgkoiFglk5wCsAXyMpABn6HocFc4?=
 =?us-ascii?Q?sIefXYicbksmND+OWlwjD8PcUrqfR446ViiuiMNY/BMY08VrAOky+HwSop9C?=
 =?us-ascii?Q?hm0/4Vu+RlwQKvxmNpNbhhQQUAdiYtvgrQWGdwSMvSBq9/ZjwxIMNu2tg4OB?=
 =?us-ascii?Q?rsJyayzs2EFOC0N0iiBgqh8iQmfbAJ+shmIErB+9cruS/QrywqRHKHi+tRqN?=
 =?us-ascii?Q?im2FBN7FJv3J0fhSS3iZe0Em2JrF5Gr53pyO0ZZdxE/hsYxjpdgSVqUwIg8X?=
 =?us-ascii?Q?Qf5JS3BBZ4ZgnDlySy9qWDW7QJxus/XRb1kU4u8GFiWseRf+26tr8k0Y3K4V?=
 =?us-ascii?Q?gkeivv4vKw/ZLmnbjKyCdX4Xh9MdtbMQFNiVSNiZKFlGYKIPNfrujSWFQFr9?=
 =?us-ascii?Q?pH6AaDb//nEaCeFw3QSegps+jG3kCP4WWhZT0fvZ1Wq8cUS62jp5j85v0TNQ?=
 =?us-ascii?Q?dRgCZx3ynvVaLIDOyzQe7eijTZJ8h0aFoLOwIV7Bbdsz7IY1H34jeNkTI3qK?=
 =?us-ascii?Q?B9UmdhdjMoWjG5fBtR7/mbIiuvowYBcNLJNBQ/n5/yEFxFGVhiZN8UPT6Gui?=
 =?us-ascii?Q?gcD8QoUSHIGK36Fb3nj6aOV+8hG2N7uswFcb9NJM4lA878qUROOI2TcB3htC?=
 =?us-ascii?Q?RLpeuua/GIm3QkxBtXrHsQWel59tCGERbn+gFhXxOYELDJUvtnCkEHf+N80J?=
 =?us-ascii?Q?VRV9THgi0i31Mq8jyDSlFef5vDSa1+A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d035fbee-dfcf-466d-fdba-08de5da9e00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 13:42:12.2390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFjD6W1Sn48B2Pjf1cXMuu/IUKjvSeJB2U8P0SO1JcMMZ4Hy33TO8DXn6bmQGHeRpxYi9O1qlojXoM2oFF7xcsa1gR5Z8v9G3nb1313mypLaj68wYh0QIjirpZnjYfuJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

Hi Piotr,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Piotr
> Rudnicki
> Sent: Friday, January 23, 2026 12:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Rudnicki, Piotr <piotr.rudnicki@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online:
> test_interrupt_other wait fix
>=20
> The test was incorrectly waiting for debugee completion when the first
> client should complete due to the reset. Fix the test to wait for the
> correct client after reset and properly cleanup the debugee.
>=20
> Add pipe validation in pipe_signal() to prevent writes to closed pipes
> after SIGKILL. Update pipe_close() to set descriptors to -1 after closing
> to ensure the guard condition works correctly.

This commit does a lot of stuff. I'd split it into library and test parts.

>=20
> Verify waitpid() return value to ensure the process was successfully
> reaped before marking as done. Verify second workload started before
> cleanup and skip session validation as SIGKILL causes incomplete event lo=
g.
>=20
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>  lib/xe/xe_eudebug.c             | 16 ++++++++-----
>  tests/intel/xe_eudebug_online.c | 40 +++++++++++++++++++++++++++-----
> -
>  2 files changed, 44 insertions(+), 12 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 2abee7ba2..9f981d226 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -304,16 +304,22 @@ static int safe_pipe_read(int pipe[2], void *buf, i=
nt
> nbytes, int timeout_ms)
>=20
>  static void pipe_signal(int pipe[2], uint64_t token)
>  {
> -	igt_assert(write(pipe[1], &token, sizeof(token)) =3D=3D sizeof(token));
> +	/* Skip signaling if pipe is closed (e.g., after SIGKILL) */

Are you sure that closing the pipe, especially with SIGKILL, changes the pi=
pe value to negative?

> +	if (pipe[1] >=3D 0)
> +		igt_assert(write(pipe[1], &token, sizeof(token)) =3D=3D
> sizeof(token));
>  }
>=20
>  static void pipe_close(int pipe[2])
>  {
> -	if (pipe[0] !=3D -1)
> -		close(pipe[0]);
> +	if (pipe[0] >=3D 0) {
> +		igt_assert_eq(close(pipe[0]), 0);
> +		pipe[0] =3D -1;
> +	}
>=20
> -	if (pipe[1] !=3D -1)
> -		close(pipe[1]);
> +	if (pipe[1] >=3D 0) {
> +		igt_assert_eq(close(pipe[1]), 0);
> +		pipe[1] =3D -1;
> +	}
>  }
>=20
>  #define DEAD_CLIENT 0xccccdead
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index ff6c5ff19..1093df133 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -21,6 +21,7 @@
>  #include "intel_pat.h"
>  #include "intel_mocs.h"
>  #include "gpgpu_shader.h"
> +#include <sys/wait.h>
>=20
>  #define SHADER_NOP			(0 << 0)
>  #define SHADER_BREAKPOINT		(1 << 0)
> @@ -2014,7 +2015,7 @@ static void test_interrupt_other(int fd, struct
> drm_xe_engine_class_instance *hw
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>=20
> -	/* wait for workload to start */
> +	/* wait for the first client workload to start */
>  	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>  		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
>  			continue;
> @@ -2034,6 +2035,7 @@ static void test_interrupt_other(int fd, struct
> drm_xe_engine_class_instance *hw
>  	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, debugee),
> 0);
>  	xe_eudebug_client_start(debugee);
>=20
> +	/* wait for the second client */
>  	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>  		if (READ_ONCE(debugee_data->vm_fd) =3D=3D -1 ||
> READ_ONCE(debugee_data->target_size) =3D=3D 0)
>  			continue;
> @@ -2044,8 +2046,8 @@ static void test_interrupt_other(int fd, struct
> drm_xe_engine_class_instance *hw
>  	igt_assert(debugee_data->exec_queue_handle !=3D -1);
>=20
>  	/*
> -	 * Interrupting the other client should return invalid state
> -	 * as it is running in runalone mode
> +	 * Interrupting the first client (currently running)
> +	 * should return invalid state as it is running in runalone mode
>  	 */
>  	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data-
> >client_handle,
>  		      debugee_data->exec_queue_handle, debugee_data-
> >lrc_handle, NULL, 0,
> @@ -2054,15 +2056,39 @@ static void test_interrupt_other(int fd, struct
> drm_xe_engine_class_instance *hw
>=20
>  	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data-
> >hwe.gt_id);
>=20
> -	xe_eudebug_client_wait_done(debugee);
> +	/* First client should complete because of the reset */
> +	xe_eudebug_client_wait_done(s->client);
> +
> +	/* Check if second workload was started and is running */

Why not use the wait_for_workload_start?

> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> +		if (READ_ONCE(debugee_data->vm_fd) =3D=3D -1 ||
> +		    READ_ONCE(debugee_data->target_size) =3D=3D 0)
> +			continue;
> +
> +		if (pread(debugee_data->vm_fd, &val, sizeof(val),
> +			  debugee_data->target_offset) =3D=3D sizeof(val))
> +			if (val !=3D 0)
> +				break;
> +	}
> +	igt_assert_f(val !=3D 0, "Debugee workload execution is not yet
> started\n");
> +
> +	/* Terminate debugee and mark it as cleaned up */
> +	igt_assert_eq(kill(debugee->pid, 0), 0);
> +	igt_assert_eq(debugee->done, 0);

What are these two asserts doing for the test case?

Thanks,
Dominik Karol

> +	kill(debugee->pid, SIGKILL);
> +	igt_assert_eq(waitpid(debugee->pid, NULL, 0), debugee->pid);
> +	debugee->done =3D 1;
> +	debugee->pid =3D 0;
> +
>  	xe_eudebug_debugger_stop_worker(s->debugger);
>=20
>  	xe_eudebug_event_log_print(s->debugger->log, true);
>  	xe_eudebug_event_log_print(debugee->log, true);
>=20
> -	xe_eudebug_session_check(s, true,
> XE_EUDEBUG_FILTER_EVENT_VM_BIND |
> -				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP
> |
> -
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
> +	/*
> +	 * Skip xe_eudebug_session_check() because we forcibly killed the
> debugee
> +	 * with SIGKILL, so its event log is incomplete and validation would fa=
il.
> +	 */
>=20
>  	xe_eudebug_client_destroy(debugee);
>  	xe_eudebug_session_destroy(s);
> --
> 2.43.0

