Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654C5F46101
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 13:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F6510E10C;
	Mon, 23 Mar 2026 13:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqwA7dmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326F210E10C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774270939; x=1805806939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WTwCgRjMOLL4uA3Y17cSq4g70g6YaWfpxRINY0I4SPo=;
 b=fqwA7dmQy+bokRa5mlb5uuo0ru7IJPGXM1FbtnwNneJdB3wOnV3QU29B
 rCCrvpTKzANd3v4FV8udeKh2uJPlP8IF6MMmActnOoq5bVXAlb5ohLARB
 nAyUTj99mE8BJ8zxA/2YTDKcaZgJ3S3DSxmu1Gyhqk60sjj1E+HdWaFes
 ejTTnIJlMq8vQbS8cfmnM3P+f069FPQUSLeXf3u4YPcbNDlXbN9Pdl1aa
 ov/rYPf9QvBNyUiuKla75KSBZ8L/b+PuUPnhInjQ6F/fUq8YBMYS6NOEp
 E3DN6iNr4Dt31RWwz/byn8QZOv8C3NqijJpyw1AgtbDwiF4bIO/iOIxFw Q==;
X-CSE-ConnectionGUID: 6aEZRxVUTKWJ3JttAP9PgA==
X-CSE-MsgGUID: JywKly2oT/KP/Ar57Np8tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78863099"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="78863099"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 06:02:18 -0700
X-CSE-ConnectionGUID: EAw9qit/R6WBW/RZytYeTA==
X-CSE-MsgGUID: XLaZ77RSTJ+dttrJv/JA1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="261937284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 06:02:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 06:02:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 06:02:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 06:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXz0KOI1Yeai98zD/jWwg7Ddyx3aJb4caxuhHxA+g4eQiQjlg1T033skpGyHNCHWwhgosKMX9F+l0d9T3A1FzSguRVhIMUZTGULipF32UW6qo3B174m+sSDHOtLCbd1/2Y+3YvsIsbihiczQRDb50RJIGoDa4JSrLpV02xdDnrqlTXU26xQiAk8IkV0ISagxqb2eHRue1cxYHNk61JaFssbyT5PiGi3WyvqngWiAqs1mfPLTcy1DGlOijlh6UIUSMBJSTP7PqKK6oI+f893VBdQdJQD0aiQixcQvK6hj9uoMMRlNzwcOXDbvJekjIbo32tTLhjbyypP8Oz5YB8lQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjkHo91GFUdD0eBNfQw3DH5mqI6NeGebDFWtv+/OOqE=;
 b=EQonT9avkGY8CFzv/dpJFNGm3B4v0umn8E+GbsgmteKrKUJDwzGmBEXzxn9XEOApGkdRnnrvj9rEeXC5DtBhmKXvJXbN1/j+zyAo5hjV6ED8Zzgjlwnp+GFzY+g+VPOsRrI25FL8ZgTW9U5QpJB4JMnQ5LW27PJs3AtQWgZXn7pf5xA8fhKfBR18LYfz1vS3M+BTGZxSGvc7vyMqFyya2rycn8T1Sdzf0WAzqSUe+zblZODT+bolnZQ2Iwf2fcF4tixBGLQxWlIXXdgXfewD0Y4T9u1QYB3qfJVyIjjf25m/iM4sB2sbZInXnafQeqtR6V0974uUV6hAZj3ikZkOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 13:02:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 13:02:06 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
Thread-Index: AQHcuoH+MGGG876T6k2uN4HNwzMRl7W7uHYAgAAhmgCAADk2AA==
Date: Mon, 23 Mar 2026 13:02:06 +0000
Message-ID: <PH7PR11MB60537DCC26158937DF1D3F67E74BA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260323051049.2627387-1-pranay.samala@intel.com>
 <20260323051049.2627387-3-pranay.samala@intel.com>
 <IA1PR11MB6467222C2F24562B961BEFCDE34BA@IA1PR11MB6467.namprd11.prod.outlook.com>
 <2f87dff630bfb060e15f8abf6ec46f88b39297e1@intel.com>
In-Reply-To: <2f87dff630bfb060e15f8abf6ec46f88b39297e1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB7961:EE_
x-ms-office365-filtering-correlation-id: cabfc9ed-fad2-431b-09ec-08de88dc62d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007|56012099003|18092099006|18002099003|22082099003;
x-microsoft-antispam-message-info: JPK3zGZ271DUg8nNkydmOxrs88Z5IXEK7oP0V0FzbXWWT0VCdSVF5tsYgz+jkf2bhaYLIc+aiifi6uUkzjTNfwW8Ik0QneTHBo+Wi5iqN5p8eb6FICBI6bg0Fl1TO1fkUlz+8UHLnXTeSrdeb1b37vepdry9EPuCgxo9/SP+VuXCxke1KVSSGsAs9Hxl+zkPOpeAM6eHM870G8A6LpilZABTrNe8Hv6P/B6PMD6sgJOnZc0e5UGVl/xRUYhfSKVW2iDpWiuTtz8kvgpsHma5aWzlxu49splYgcm322sKwoeGJegV/nDwbDnredMTwF2ADp2h10yfODqJtnFH7zU4JYZHUDb4VIt1IxwUDMawPn1S8uWtSDwljlWID8TRNYyPzyTR6+wBKsW74mhIJKaqeEniD0uenEBDxs++8jq4c0HQzGJjtq2CHahngs6oGL8XLZoh1wIVOvGVPKG/2WgIOfhmgYy1jUUCpegZINNiZdQhZAU09suKO06pmj/XBIc1pgFW14Rv2TcE96XJOzxl3f8kFrX6u5tj2kgKuijIRn9JI5Th724Tkr5fNX/XucxTcYG+1wuG7aBLk0/Sm3R5je3chwPlv6sYFBrBhNLsTPXCzQbqdQTKIXWotBdnnIkqrB19yB2loJh+dcnCysMefOYuil08QqYSHUzF32NsgV33aOYhf1Wpt7X/wJ0RXbkH+Wdr/jn2ofN4UAx27omXptCMeC/Es5SfPeN1c3mvgENNwmANWQI5/Qzo30+IYroWtIAJ9P08leE+zGC1+P/Whb34ee1GuINLI9Do0RuuX9o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(56012099003)(18092099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IA1gBu1EpiR1fPBW8tMKz/yQksTE/RaEoaWJBSnBtNUpmsVwMZ+gBMTJfQgC?=
 =?us-ascii?Q?qKW217g+F5ER56IRe56yPwkAQpq4iajgtg9cTflgE7s1QSlSRf2kaXmPiGWC?=
 =?us-ascii?Q?jAZxJ39cjXKOVQN81C/6mfTIaARSda1sL2QaFENiBTX7DLf26r2KplsjEXZ+?=
 =?us-ascii?Q?KscgrDgEkmuPdU3fbjLOmCMuznI10EjgbKLOcxVC3KGSwx8WlQKQPKCxNef3?=
 =?us-ascii?Q?7a1Kl/R+LXn4RvyOxCvEINffhSR9c45FYlHHRIJiyaqeiT4tPESkRWRSXcck?=
 =?us-ascii?Q?PX23TN+/eYaZspTRelOSXNzL+J/k7ruaeOXRZfcwMrHhZIvusSidvFJtDTHf?=
 =?us-ascii?Q?oj/yuiFYlxEUVxX4Lmk8fRWuKFC4jsZqyWnrmopFSBfs11jQccXidNE7O+A/?=
 =?us-ascii?Q?D80i0yIqv1FMWweB74WqoeR2U8rouchkPDeh7Hk2rTF1RqIIgCduEoFmIPpQ?=
 =?us-ascii?Q?xuoPrVoBirFbLfmeL5zh5ohgR3H1/G6EcurG0bBlBt/hEMs8jNik+U9frYEB?=
 =?us-ascii?Q?Qbd4hkEIUmEx1HN43mrmo61gfk/RtqOJIcKJd/UCuVZCf9orzJDfkSRMAeuR?=
 =?us-ascii?Q?/ZoDlVv2iI++q1O4X6Jbe3rkFZfbBv4bJUAUj77SDoLXcbgmjPrdaKD5oI1e?=
 =?us-ascii?Q?sAo1QXWXIvgcfRdBvnznNPeCVCTOVlxwINYRks4Demz7tBi1148fB5R2xiBt?=
 =?us-ascii?Q?ohn7GYpPhJ3PJq8WWC0p0itEDCQxIYT4DGTozjUCZVC3+nZRo5UMeV0OKQpi?=
 =?us-ascii?Q?NZ5/nB04/cNgh1vO7zTBzuAZ+nFl16CWdj4vVa9EDj7oxpDCu39V+IJUZDrx?=
 =?us-ascii?Q?Y/GjhzHbOCA0+rKJdm/97UY0CTVFvzbZdkwaIWr8hsGvL5A7vCyColmPVf/X?=
 =?us-ascii?Q?rnNFMk4nZ5F9vxkIRNjovFlLVaeSo8AayBK3YNYzmNFj9tN/PEYh+Bz0x0HD?=
 =?us-ascii?Q?3AwoGHSI6TzMmsa6emN24Gib1JABubZNS0WcBclViX5sYFqlmrLnuo1ZmsKO?=
 =?us-ascii?Q?GdYuFpAc/xF0DLW1m20Q0Z7cEHz416aPxfdt8I+Mbd6zmLK3KXeDk18Kdcik?=
 =?us-ascii?Q?qgajWI3W3SmiatYrOkkBafmA1xjvSFF7+IPXYRwn2LtDwbWE1AmQR6qWytpS?=
 =?us-ascii?Q?D3J/r8UW/kMMC2OTBv27Yya3kZK2YeS2M3WR3tXxhauda8QtfYA8VMAxibVu?=
 =?us-ascii?Q?mvSARChxCScOhdO4vPWJQK8r99EoWwYzLbCE5/FeLey5Ws54ZBXCXGRNJBBY?=
 =?us-ascii?Q?EfXzLVHsddlG5Ufc+jP5oqaoaLN6WCU5pn+d/2IlirrhSbLfwMMplNpabEbc?=
 =?us-ascii?Q?mCeviwnTGpS8Kyjp4B+AgS8GOWBNhfFsbqsDF78SmzcxS3YPVWIxsj3nmlhh?=
 =?us-ascii?Q?drHETfzYiPoTTtq2qZZ/ZBN38r0sQ+XhFP5AfsFSrHEHWWh54B49Voje6fu0?=
 =?us-ascii?Q?MsIfWMsbLkunAOnzHPDAjqEfFlV0O6TU9/vTuT93d32Eokdk0hS+cn04taH6?=
 =?us-ascii?Q?wwsBahUlGJrzDAvlur8u+iGAFdevw3jzbpSVfscJFjenur8je5WrWFQACGAB?=
 =?us-ascii?Q?hN/uj7JUAGhdxikpddiwBSegbXy4j1OesnrippE+0NxLlSCybh7Nc5g/Q93C?=
 =?us-ascii?Q?19xjBHbUfH5LZtBoV9vkuNsrGX72GSDMLWu2y4/ETBi5MkkLrVum2/2B6keb?=
 =?us-ascii?Q?+GiPmSzPbYTr4vNDii8UOxsaQ4pjGDLl+VujZ9UVjwsMSpLqyVcV546ypnsa?=
 =?us-ascii?Q?La5yal7fjA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c51UQfRZt1hiTAwo1OwjwbaGTlVHQiVcxSlsQDxmWRK08QvUk6eWUH1yW14eDVHJbQl6+06uVYcyqvpWdgKzsHFstnTLzJmv3M1y6d+ZY59jswt/ehWu4vDFH2FT20nnifn1yR7jnsSLOL89+DKsaVzALcZikyMTCBF5IZOFNk+x22hKyet1TdXJ1w4oxGQoCGpZAITnVZAq5of58kcpmIF2MOjE3Izw6jnBb7wC6pyxoK55V3kmtGF7JlEunWXTqTAW8E07AeNO16/i+CylGHPqGX+upSzJhK4Hn6Sjh5nyFDHNV0CzIjkuUq0aTbi3vteAS580N3On7WCGUS055A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabfc9ed-fad2-431b-09ec-08de88dc62d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 13:02:06.5668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RY2QyNIXrKBv2wV02VHvnMutXKUX23vjVV7GYmCNNzP5iKv46+KHcSgC6h5l5bBYNbNN7oBYBYc8DILcSWHhpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Monday, March 23, 2026 2:59 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stab=
le
> non-joiner mode for joiner bypass
>=20
> On Mon, 23 Mar 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> >> -----Original Message-----
> >> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> >> Pranay Samala
> >> Sent: Monday, March 23, 2026 10:41 AM
> >> To: igt-dev@lists.freedesktop.org
> >> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> >> <sameer.lattannavar@intel.com>; Samala, Pranay
> >> <pranay.samala@intel.com>
> >> Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use
> >> stable non- joiner mode for joiner bypass
> >>
> >> When joiner mode is detected, fetch a non-joiner mode into local
> >> variable and store it into the caller-owned copy.
> >>
> >> Also override the selected mode before commit so the programmed
> >> output mode matches the mode used by the test.
> >>
> >> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and
> >> bypass joiner modes")
> >> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> >> ---
> >>  tests/intel/kms_sharpness_filter.c | 10 +++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tests/intel/kms_sharpness_filter.c
> >> b/tests/intel/kms_sharpness_filter.c
> >> index 96fb139ae..881fab746 100644
> >> --- a/tests/intel/kms_sharpness_filter.c
> >> +++ b/tests/intel/kms_sharpness_filter.c
> >> @@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum
> >> test_type type)
> >>  	igt_display_t *display =3D &data->display;
> >>  	igt_output_t *output;
> >>  	igt_crtc_t *crtc;
> >> +	drmModeModeInfo selected_mode;
> >>  	char name[40];
> >>
> >>  	for_each_connected_output(display, output) { @@ -438,15 +439,17
> @@
> >> run_sharpness_filter_test(data_t *data, enum test_type type)
> >>
> >>  			data->output =3D output;
> >>  			data->crtc =3D crtc;
> >> -			data->mode =3D igt_output_get_mode(data->output);
> >>
> >>  			/*
> >>  			 * FIXME: Joiner + CASF currently unsupported.
> >>  			 * Remove this check once support is implemented.
> >>  			 * Until then, run on non-joiner mode in joiner
> configuration.
> >>  			 */
> >> -			if (is_joiner_mode(data->drm_fd, data->output)) {
> >> -				data->mode =3D
> >> igt_get_non_joiner_mode(data->drm_fd, data->output);
> >
> > Hi Pranay,
> > I guess instead of retuning bool value we can the pointer whether NULL =
or
> not and then assign the mode , something like this:
> > If(!igt_get_non_joiner_mode(data->drm_fd, data->output))
> >    data->mode =3D igt_get_non_joiner_mode(data->drm_fd, data->output);
>=20
> Yeah, there are many ways to accomplish the same without changing
> igt_get_non_joiner_mode() function.
Hi Jani, Nemesa
Thanks for the review, I will keep the helper as pointer-returning and avoi=
d changing the API.
I will take the returned mode pointer once, check for NULL, copy it into lo=
cal variable, and set data->mode =3D &selected_mode before mode override/co=
mmit.

This keeps the change minimal while still fixing the stale mode pointer usa=
ge.

Regards,
Pranay.
>=20
> BR,
> Jani.
>=20
>=20
>=20
> >
> > Thanks,
> > Nemesa
> >
> >> +			if (is_joiner_mode(data->drm_fd, data->output) &&
> >> +			    igt_get_non_joiner_mode(data->drm_fd,
> >> +						    data->output,
> >> +						    &selected_mode)) {
> >> +				data->mode =3D &selected_mode;
> >>  				igt_info("Executing on mode %dx%d@%d\n",
> >>  					 data->mode->hdisplay,
> >>  					 data->mode->vdisplay,
> >> @@ -463,6 +466,7 @@ run_sharpness_filter_test(data_t *data, enum
> >> test_type type)
> >>
> >>  			igt_output_set_crtc(data->output,
> >>  					    data->crtc);
> >> +			igt_output_override_mode(data->output, data-
> >> >mode);
> >>
> >>  			if (!intel_pipe_output_combo_valid(display)) {
> >>  				igt_output_set_crtc(data->output, NULL);
> >> --
> >> 2.34.1
> >
>=20
> --
> Jani Nikula, Intel
