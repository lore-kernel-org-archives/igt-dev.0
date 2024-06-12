Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A094C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8046310E182;
	Wed, 12 Jun 2024 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxi6bcz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170110E035
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718191952; x=1749727952;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5YtYYGqsEVr/gx07eylb33ZAKrUlyXfUzv4FlMofZJo=;
 b=lxi6bcz8CD9I+ozqOal1l2ERjBoRVEORKMAt1S45kLjVqBEw+Sl6b8ZK
 gXPq9cHE33qe8tTGxhdMzHooWEIW0XOkirvajIJYLNctR2g0Nuzx0wrzf
 cVQDqY4px8TNgHwwywppF7V7TsFf/TCHNZ9duJHgUtbQGpi7LYdy9lGMH
 wWxbAB4p2IUFg+MZUfNCK0gK4L+Pzj8g6VTZExclw1SkxFn71i3ILSTCj
 Oyz7z/MgynUg2WnZ8wRTfNktBEaTUG3lZcgylsRDjCVIluDT93xqyhzXE
 d+nfFVfuW4Y8keHtdqq8Ivmev29tp4sjOiHz9pLEMftEsLEGnw6OmKzUu A==;
X-CSE-ConnectionGUID: WON/tyBcQxWQOXmhD8iROw==
X-CSE-MsgGUID: UGdsQv1kRvyJwEDds9uCRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26370290"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="26370290"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:32:31 -0700
X-CSE-ConnectionGUID: m91ZOvrYTyO3IUPnBSypIw==
X-CSE-MsgGUID: vjZtswJ5Re+fmaWDlCfeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="40235980"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:32:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:32:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:32:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAp8aPPJaqrLEbcnv+pgo5zoxfMxT84HdopPuYshJL8p3Xvemt24D81lao2p8pgBc8b5liAsEkFeVwesJmcyGO2dLl0J+zijuwZnHA/Hz2NjuVzDyBp6nO/GYqIWeFuRGLV2T9t/xFgi0pxCT+EUnr/JRw1FiqHcdLNTJIEVP4l+zPQremBSZndchIowCC7zBlafMB2WwJn0dHyddGyV0FzpUOpCsc2sBKmhHyo316u8vnnYpWH3R1AKdtAUx5q1gaUdw0SiNNk/lduHBUskAJ2e+l2BW7kR6SY4BIduLPHB2HbGD1egTJdWe43zJIGke+tYYkthWBkO9IUbzWSXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH5W13rQaxShkOS4ldOwNUCYNkzDWM6LVQOytEQP3ws=;
 b=Ig32wocvCpl+5t2hHw6dlBAN+Ax39B02In7yy3CVAF4pIMoN8VWwQGn3jYX8U4HDBTIWr3uebTblQU6c6mOWmrqQEpcK8NjT7BtD0u3kdsPfh2s4aQZ01t6AwS3G6Nw7CsK7smiIHSUNE7cKNST/f3KBKPkaAM67lrqIIvJwSdQuOqMt1rgSaLi81qHQ122CFkAWNn6kx+hUvpcXaXl6Z+AzgjB4BD6MhKXwo2mQcaXUjhJLfjiwV25GlXYH9NVRSZULG/jInh4TidAuJ0DOmc4c5hliNI/937uHqpt84P/xPsQuQ1szztCIpoA3sv9oQtgfY6b0GQab2f3D3JlsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:32:27 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:32:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 4/8] tests/kms_hdmi_inject: Test cleanup
Thread-Topic: [PATCH i-g-t 4/8] tests/kms_hdmi_inject: Test cleanup
Thread-Index: AQHau7x3zE/1TKSS/EakHnaQzn7ofbHEANVA
Date: Wed, 12 Jun 2024 11:32:26 +0000
Message-ID: <DM4PR11MB631259AD46ED1A0E03118D9390C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-5-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: ae06b093-4933-42fc-dd05-08dc8ad35639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?9UQW7kth6PVLy9+5TzgJ1e1zZo7tfFp2f9bL1yjL5Bdtf7RTLoegy8EHaAle?=
 =?us-ascii?Q?qs5QpAN/KnuoHdiRSTCK+vA1ZgojHPG+x+kLSJ6Qt6Am0aRh8Hg1mr15w5/B?=
 =?us-ascii?Q?GW0T0wxzOp35AMrT0YxmDodvGdl65uz7e+uWCJHsYKuzUP/s7FY0OxRfKonD?=
 =?us-ascii?Q?HR/zHZUnawDtdidmX4e/etNzHaxW2hdmDUVwfdhy/6Z0SNgkCr+E6le1Mwv2?=
 =?us-ascii?Q?1l48/NeBvwiZTd4Jt74kBoZghlAlMjCDi+14KQO+QUUiF67Cjp70vIvtqP7G?=
 =?us-ascii?Q?tdbR86HspuGEk2E2VwZcgndqG0cMZRltoK8EzOsylJWLSZAadtuoGO7a3Lux?=
 =?us-ascii?Q?g+rt481Pr3n9j+KVjKq77TmpNN2DJGLGCXeZS5sjxUQdbn31LvqkH4BNrndA?=
 =?us-ascii?Q?xzapZP+bs93OOlsq+CPTl0Rylvqj2jJckwPx1RGly5FrcQ/bNBlogGnN5Jqg?=
 =?us-ascii?Q?ZtbntFEpV0zOnroqtmOXK/+k13MZ1xJutzdZEE8noSXUEuNKvH7Zg39mdnmw?=
 =?us-ascii?Q?xdY1IHZ0SWhvSS4ctVZM3wBo+AJdPaNlStCDLLXJs/KltiQccnNbE4ag9/Ev?=
 =?us-ascii?Q?LTboHWuGqqJ9YjQ14JnOB8Ql+x5P4DHdRwsLk38vlMYNEY7UdfMctuHQYzC2?=
 =?us-ascii?Q?KmFBTBxne9jY5K1CHQ6keUwUCh2VBtLlwOUlZZncWvqxo+UuMZPgrDtutKf6?=
 =?us-ascii?Q?Pqni7ExqIeIkn87SPOEbibnGK8+Y27D3SYx+Uj/nJY7IiU16m0NV8uM36ADx?=
 =?us-ascii?Q?yfusAnlj4n7U8W4YHwnRKLPUV/oufvY1xUY820ai/i6aHUiJHn/dDy9UDN2Z?=
 =?us-ascii?Q?a8WTitncoWP+J0sQzA/KmXqhIAwgEOmjgE7KKjh4RaBUZEfV0MmMyGVyZGGq?=
 =?us-ascii?Q?8JQoBWFyCi3cJ1Z4OZJX72U9c5daO892ztjF3e7nnXuqOZJH4Bhdz1M29cwR?=
 =?us-ascii?Q?PGigXgPEqe9eLq70/tsVoOUm5I6e2WqHBfX8HwrSQRUFdyfJKmWEAGxtZMFL?=
 =?us-ascii?Q?upO64JT62Bw3E9HfpVRmRbiEwMvQiI4zjak6atrq1AI5OUFM22yjQKf1ODXL?=
 =?us-ascii?Q?jhY96/jcpoSWcTXmKdFXo1KHAoZkB/80h1Rn2S/NiPHq7OI9KguZut/9z+qp?=
 =?us-ascii?Q?ufEFgr7X0A9F1bsOXEsGH9RFnJ3Yvx7H5MKEEw4VWHOKk5mHiKmcI7hWLAI+?=
 =?us-ascii?Q?GruS97HMUHJU5itSypEor2jPs6VFCJiOdrLHM6Xz48ZJzekH20Q4QwGxZMMa?=
 =?us-ascii?Q?0pm1ZRkw39vl6RnpFv0LPh/XN9bO11oxhJ89zwIBeU//BFEk0axMRmB14CJe?=
 =?us-ascii?Q?u/qKx+3DL9R+Dnes+1rPHBSceKLdnCSK6GqasIsNi1qng09KZgXTZihHUI70?=
 =?us-ascii?Q?36SZFio=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ds4K0RKyNpFdXqkX89JwTXFDEeQzD4hi6zo8MLdqVGuz15fj740iypRxdTr6?=
 =?us-ascii?Q?Qgts7X+At1OHiJamga+gTnGhBUOKUdogZ8QNP3s/Z5gcD/4v2pY1DF6Av/iT?=
 =?us-ascii?Q?2zq8qZyJIcCaRw3HzbGZVReOYpcfLxbiS24aVk0/DSk5m0asd2RlGXzIlQ88?=
 =?us-ascii?Q?QWQzfLoCYd5Q6fUuORdrWn26k/CnNClqmB2tLM9UjHiR6S+rbRDZ+fATuo+d?=
 =?us-ascii?Q?5l1MH7gM6pVaKY+nhqLPcSFl/zwdFzsUhoBNU1CdOwt/FPYV9rlgRafxr4QK?=
 =?us-ascii?Q?PDkxISWwnewUfDThd4r4C5kEDS/fcYSbHHp/sV6sof3cyUZhINBpaQoA9gYA?=
 =?us-ascii?Q?7IS+cuKx5OYarJ4daOgKlCuUAfLCYkUoHfSX9LZLgmbVqwUKihj7Pr0E28PM?=
 =?us-ascii?Q?KOKdbu7j4gcC6HNub88+4CbllqPvAT09we489COB4P93bAAbEaMpgGAAaots?=
 =?us-ascii?Q?HewHe9NumIpw6DPBs6KFg3tooH/w3nOn8JW10dfIwx713bvgB1NCaZwfRwdP?=
 =?us-ascii?Q?mOBVD52gcdOATRmwno+KI3ZRA4QDMWU7pdILc7zNYYuCZ551P3QM2lOl+B5I?=
 =?us-ascii?Q?x4HMr8MQFy78g5lbROTsY7FTB87KvXteDDNPLW+iA31BtNr4C8APBa2bw+av?=
 =?us-ascii?Q?PeqcpT99Ck1dpHNkt4zr4dvxtxRPCg+++PYGITqUBsVUWJfUk2Cze271fgIn?=
 =?us-ascii?Q?Q975Q1QNi1Kz1hFrbAxmSb3Yq6P1e3vtINog3Q2L8CIlsydKeSamzr2X8z/v?=
 =?us-ascii?Q?/pIKJK4SlqrOUsht8s5rAYloItbApRzCbroQ70BQ5wcHMDdAUG6J28WuLMC3?=
 =?us-ascii?Q?KiuOKK6kea6cMInNfFU9rFmkm2NeJHwxg9LvNUCMjSQ8ej7cD5STeIAeKkiG?=
 =?us-ascii?Q?U9l47hXdUMZuTH6q9bwPSUGHemh4Kwl2QatNP0Ag+nCM7XnWylDMNxOjlpVX?=
 =?us-ascii?Q?/sPiGdGy1kwU7aFYyCoazY8qd3hdGvWuozMy1d1yqoXrCqKUM793jLIwNdvR?=
 =?us-ascii?Q?Pz19CKnNTI312tj+5veVxXYISXg9gnJYb0k7rsYpDnR3Bi30zll5njRtr1dq?=
 =?us-ascii?Q?BDW0bfvy7fc2oFFTx8VbSKVyqWSDLgxnKo2xTDfh1Xw+Ez8q2g5JlCxdwRXC?=
 =?us-ascii?Q?5N/PKuGEC5jq28SINGkq9E+hl/05thQ/3R3ZpoYaUgOfPJpj9MThl5ny1QbI?=
 =?us-ascii?Q?6TXfa2fqkrJpkrr4LI/G+aAqnRwWLvnxwmquwLA/fYZa6VGPBdpZ6c8WE+v6?=
 =?us-ascii?Q?1ywl+s4tln/uMasM0/WdCFplfsEhY0T8P7yPZb+/+Hlh9GohU8cOaf5afKbD?=
 =?us-ascii?Q?9LfFTIrBE8QDpaUh78ywzdEQw6JsRD3Tlfwtrjp4KWQhYjoqYXg+zpq/PWR+?=
 =?us-ascii?Q?9M5nLY2QDTLW3dyYE/Wh9GTKovvJm/WO20lU99zY0wOoxELnkUH9WX2f8umB?=
 =?us-ascii?Q?rJHBhYVIB2qQ9mqysl5Ro8krEhM9WGRwgNDXIlti1wWuclq1CKVaG2CM5Awl?=
 =?us-ascii?Q?jleX30ahSKkLbvmWw8BgVnS8QbdRD9jxo62AQbMzcseDyirY7/ivpogU5MEx?=
 =?us-ascii?Q?iary7A+I+/pszgeGu+k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae06b093-4933-42fc-dd05-08dc8ad35639
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:32:26.8974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWaaWQKZiotlrf7kNjIp1MgCooxeJbSyYiGIziVe3mqMDGr8m393LMoq2x+V133khLpu2n+0jdF8io9rJmAodQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

LGTM.

ACK, Rb already present.=20

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>;
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 4/8] tests/kms_hdmi_inject: Test cleanup
>=20
> From: Kunal Joshi <kunal1.joshi@intel.com>
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> v2: (Bhanu)
>  - Rebase
>  - Initialize pointers with NULL
>  - Update connector type HDMI checks
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_hdmi_inject.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c index
> dce74fac0..d28be38e4 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -80,14 +80,15 @@ static drmModeConnector *  get_connector(int
> drm_fd, drmModeRes *res)  {
>  	int i;
> -	drmModeConnector *connector;
> +	drmModeConnector *connector =3D NULL;
>=20
>  	for (i =3D 0; i < res->count_connectors; i++) {
>=20
>  		connector =3D
>  			drmModeGetConnectorCurrent(drm_fd, res-
> >connectors[i]);
>=20
> -		if (connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA)
> +		if (connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA ||
> +		    connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIB)
>  			break;
>=20
>  		drmModeFreeConnector(connector);
> @@ -243,6 +244,7 @@ igt_main
>=20
>  	igt_fixture {
>  		drmModeFreeConnector(connector);
> +		drmModeFreeResources(res);
>  		drm_close_driver(drm_fd);
>  	}
>  }
> --
> 2.43.2

