Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FFCC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF810E267;
	Wed, 19 Feb 2025 10:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X23yLJGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D8A10E267
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960492; x=1771496492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yf8eIqLtbalrlKFk90LzosBt5/B2dOfLw7zhiwUcILI=;
 b=X23yLJGGtxFAyFQvCfx1MCXLTH1R2N+ZqB52hWk7xhh7cwHOapHvhxzO
 dpjaZzXSPtLzVIQUHZYREbrrN2ULFeeu7YhgFO+Ih6/sW7KR4kRvXEwrZ
 +yYE52PERawiNtMQxJiUoNvfTLyYVM53bH+3HfSx/64hLbOnA4Iu1sg2O
 lSo30+T3vsDwtfN8JpcgVhAqoO3VL4FCZw+h64mHak1TwQog6nYUgw5xr
 ZlWF6xWMot3uySIZqZGaWeE4ZGJf89gSbuwmAYKtcrdLLjin78TLPLAEq
 13TANGyF1elcMNw0xJUdJJEZEdTWlwo5lfl0jd2xTmwGWdx+/p8tBjPA7 g==;
X-CSE-ConnectionGUID: 5358Dr43R2uN2+olpey0bA==
X-CSE-MsgGUID: Z3F2xyNKR1m1+9wllD5eYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44605186"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="44605186"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:21:31 -0800
X-CSE-ConnectionGUID: BoKPHEa3Qum1iSGVBB5dMg==
X-CSE-MsgGUID: jXkKUr6cSsWDvH7h3+4I3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="119784168"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:21:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 02:21:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 02:21:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 02:21:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoOccafHA0jcXql+FxpNW222Z4B1ntGein2reGDjGlDJ6I6EOL4lRqn0U+kGqYIQwkA0NHHuiWT9XZt4NbnSoWfya7c7a9+AQK4xGnm8ubfuKfo7/Ke1zNEmj5SqUPZuG6NR0/9s4JncKLNQkpt722qMCpUJin2c5CdkRNz5D0gwLAfLEYGz5hNy7nQzidOoOf7gasCP/P3ITJQ9J69ByHdn9MFMzux6i/Y+D24EJ7KHIFiC3wZIurJrhoxcTpmTHa+ZQlereuWOnOsc8xXICU9TU56JWsqyRf/7bGeKc38/KoHnBzq4pRqEUzcFPPeoaRwdnrA6D7eRQs+C8HYh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfXSxvZUmSmTrnFDNoFcXLnZ52PF7vC+Ndr0iNcNwm4=;
 b=pYr2Xtb0Sw57+CQNMqlAjAEBjv1PVfQK6qidOljgw1GQQbxaqY7uuIKZEotyjOQ+SNNoUMGIp3GHC1EpNjyLbr38KnxdDx43dzyrGCpDe/DIPU5I4+erpLy2tVAmGrjUHee/gHKdXpQ9WKc5ynw6D9zPWk688uPIRI5A/RXhUUOnmRR5gAg+RR05Yc2p75HOKHB+IBZGkbKlwXHwqf+HzAnsou8I6LIMy75fCMu6VCgXHEMPgDoyf0RX6avsFK2cuGT1/3mAFaVABZ4HGswE/Zyy3gEOyHza6LAsTXN498kQq69h3tChZdn0EImXcLMRNfQDpauzQ6xcoiQ/vGxAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 19 Feb
 2025 10:21:28 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 10:21:28 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_properties: Add IN_FORMATS_ASYNC property
Thread-Topic: [PATCH i-g-t] tests/kms_properties: Add IN_FORMATS_ASYNC property
Thread-Index: AQHbgrM7JreW9VYom0uCexUE36uYp7NOanHg
Date: Wed, 19 Feb 2025 10:21:28 +0000
Message-ID: <SJ1PR11MB612934E522210C60F9CBC832B9C52@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250219093211.4059187-1-arun.r.murthy@intel.com>
In-Reply-To: <20250219093211.4059187-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: a1168f30-d57f-41fd-682d-08dd50cf2bde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/u3MdGhZ43083Jpyx5iH0IFkLi1jVveDjEbx2HaPYoWjNWlU2xjInTdU2JR1?=
 =?us-ascii?Q?07mJKMXeDtKpiNMbyZqh3vJszAHvTx6RW41Jgrf0ynrPdTpJiefQbajbsbNM?=
 =?us-ascii?Q?ORnFTpLa5Ps8lhQQbVbrCQwIUgcztqn2RVwlJkwOotLEN8IWYipBxHBjrjgY?=
 =?us-ascii?Q?HZAVNxNUHM76phHUqr2l5pxea/oD9+wiTohGZ9/YjHJ/RiryT+molVegqCHN?=
 =?us-ascii?Q?Tuap8mqb+svqS2t4DeOYOcU9pMA9zN2OtdOQ9ukN8iai93vKFumhhR1frGuY?=
 =?us-ascii?Q?W9N8RZaUrDzmXkAlwhBLdLkIMuxrQcidksKR9Xti437xlIZIxZwVbl8O5Dkw?=
 =?us-ascii?Q?lMa2HyiOGhxjTvf1kGohwZUbYzuLVqCiEv8SDL/0dJ8FqLjAStad50USpuYJ?=
 =?us-ascii?Q?ZyKO2lYZBI7ceIZ5NMMOVAjykcTpMdPbAf+yWASngZ7kpltY/7y5hQYViGMS?=
 =?us-ascii?Q?1wnBRgMeYYLIe+CmQbmddlaSj35miq0d0gq2X9+1p+fA0x7vucaITa9rlX9B?=
 =?us-ascii?Q?mFaq11NHvtf3WOtEi6xfBmBGSEvmOPBuakVPkeNpgXZdmIXRBRjLChXpm8QQ?=
 =?us-ascii?Q?C5Nw+dN1LgEaaq/jDTB4DIZcfaxPFSrQydyEvMawqkKCi1IoMG2eP4awCM+x?=
 =?us-ascii?Q?jjVj34iMmO6hPysDON9YxQnDLD4mPYppk1KKNtwB755Lk8zJwmGjOYeaeRAL?=
 =?us-ascii?Q?b1YZC4N2eVV/bPJLAiLVAoEOGQGAMnpy6UQQUw84DqkkBJX5sIEJ+38vBjRU?=
 =?us-ascii?Q?Gqo0S8B3qymjG1Xr/Z2YrAln851LX+j1OOihyHseJsqx16Oo69oxBnA2Y4O9?=
 =?us-ascii?Q?z838I7rY9ED4wFrg/MYPowwcYDJTxqCss3AHdJfPqMghgWD37N+8Buw9WMA3?=
 =?us-ascii?Q?DOenoRsM5fhQyiVjboalSjeOSjouIY/LU7VBDFoCXHUukSOSRv1BB4+DTQtt?=
 =?us-ascii?Q?qmMUcTqW/gqtNDnvBz4Vua2A8CBD9f/gSslS7syGi9wW7cC3YFBmrsz9Wn0K?=
 =?us-ascii?Q?AYYnv7ZKAsJTm37OV8kYtnm/teO0FzSkH6TeHSenJGqRFkld1powQcQNgjdt?=
 =?us-ascii?Q?H8eIBBo07RNJuG6B5Dox8uzmwpmtx8WcMO6yRV3yNHCRicGWlblAXEfiQhc2?=
 =?us-ascii?Q?Z3UDH+r5sAVT/tM+Abktdn1rU4QF+BcXmqieRtV77Eh++KsA8wTU0S/E/dXY?=
 =?us-ascii?Q?21tUvRgI67ohW4+jkcE6qIBjpIUpzR7v1772Uq3mT56ZVlbptS8mGytTPszM?=
 =?us-ascii?Q?fPl1zF5DJDSdhjmnCvnbYkY9lVS76EPY7WBmFuMLxCJN22S80s5GWcsjn92H?=
 =?us-ascii?Q?0525dj6J8D3y3NtNPvStwmIm3ndaEogqjMR/IDWQtzPVhunXdDd4f55JLH77?=
 =?us-ascii?Q?gRcz1aFVrYstP4vRwfKttLoFx1XYh2cQUuWYDRj27AvoAjgh6rLCw+sHsdYQ?=
 =?us-ascii?Q?Hz9JBEOsA4wyYHmlReBDZtZfarxgsM8f?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JPHUYfaujo+VSsl4v/4OGenh9b+SW1MAT/49Yz58LNijvKeMPblDJBPr6FHQ?=
 =?us-ascii?Q?XseTzhAUuphmCvZDJ2Daw93D/l9iEdkeXUP2Sd2ECI/4bsZDWfvVlfIyi72h?=
 =?us-ascii?Q?c9Z6LAB3WyIcGDGyglVEKduhE05m7AfhVQxvMkIAq3IkwjgqE1BHQw2txqHh?=
 =?us-ascii?Q?kxQY9FGIqP0W3YnOersc8GsSos6S5+EYi0kXxLlhf2svau/cipwHjBFRFSoL?=
 =?us-ascii?Q?Z9tAqYSMXMzHkag5DDx8TdGbxRLWnK7CgW4DGL1M9UnKAvuwAc1BjsADeg/q?=
 =?us-ascii?Q?1OELCdnIAR0/qv2dxwrAM40aZhCUKNlVHEv4yQlYrHAivJhqvG6fhlkc6fmI?=
 =?us-ascii?Q?uhLuwNWB+WGI6dsPI2Ajqj6DxI+kkDfXhwzS695tH0X0BKSfS/u5MWkbmCYK?=
 =?us-ascii?Q?CwuD+IZ3j5bYVeEJsiwkWFD5R/ryi/2co9KBunvI58HO9kdsqbfejbtoILX+?=
 =?us-ascii?Q?xsiTj8GKseCfNQqAx5xAkKEnXDiiS/2uGj/ITmDqiwDKk/TUU14XW+ithfde?=
 =?us-ascii?Q?LHrPzifB29EXaopbgb2oN0MVxtRglRobuUSQlNwuHB8KKo5lDvXBJhaiG4rf?=
 =?us-ascii?Q?QU6iDP0iuooS9JJzHkk0XCdvEjkuoc6jJZClLeFKd9spllcsWRE6cwF2QDla?=
 =?us-ascii?Q?sP7A91rGuIq8Xl6itEpJSsS7a88cN/ReMaisgsK7T3Fsm3gUNfgqNypIrZY3?=
 =?us-ascii?Q?t8QB/O544kLe1zUkDuj+DWMK58d88SXou0ac5QcdYyxe7sSbZN7jDO24jYoz?=
 =?us-ascii?Q?E1ktBmNm6rj2KnrJKShigG0+gUwNx0btY34xrd5jwkMOVP5THyQoUxPD01Ej?=
 =?us-ascii?Q?yxTpcENia6cbtTqHjZqp47I/HrZ/Pdi4UpX/lE0RTAdiVg8UpCzuGtoUA180?=
 =?us-ascii?Q?+TzylhhkY41zFH3y1bNK8jQy8mTqd2HDgQ9UMHi8kpn9UsH6MDg04aaYgUrT?=
 =?us-ascii?Q?GDDhWQL3kwjcIDAAs941OuULUUWNDcpAXusqCVC235phf19bW5nTY5gpzuu1?=
 =?us-ascii?Q?idK/xCn+G7JohwbXThIGPOzsLX2oSRoWe3bBNFfIBgDRu1YxKIS1e99lSn3T?=
 =?us-ascii?Q?8cO1LTY/vrqITNDBeqnGZXEAE4oKZpbkTbGNELbgbdqE5W6iubASGh8LOEPX?=
 =?us-ascii?Q?9rS9QPXEpl6Vhl3gWshKEKl2dlTav4MyvyjRlFQAUmvxJdyGf7pecmMHIGcS?=
 =?us-ascii?Q?4/qVMFmffqX2Vi2X4vpWT3pPn+lj93QSNTgyDQoILqEr0D5q+GEk+CJtJn50?=
 =?us-ascii?Q?YnTRj10MiB3z9x90zJY8YM+kdVnsDt+iJVl9yKVvoD8uwUalzRAfh/UPDMIQ?=
 =?us-ascii?Q?kWVWfZh9gdojzwaKsE89aDpwko4Or2qEAvWX2F1EbPw9/Eg4dHIifSOr2WYE?=
 =?us-ascii?Q?/JAFWuslH0EBPkS6pKAtj5qFtjl9jvHoEJ+LGJsMaNpkL2Mp+WC7NClpsy0w?=
 =?us-ascii?Q?girLzS+F4JHfQucHhuRCYeKCyUL+rgQzStnYsgpPw9sK1YQO8OdfJLx+NBNi?=
 =?us-ascii?Q?QuAXBjsTjTqbQXZHr86YFrdsf+mVblh9nzHq9SeSmXkDECkAssH2WOGfW6Q3?=
 =?us-ascii?Q?qJxG4bJe6hYa0UymZ43o7U7+e1hcyqc89bmPlN35oIqQSpcor9w80lZ0fwqU?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1168f30-d57f-41fd-682d-08dd50cf2bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 10:21:28.0829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62mqN4wMuQzMjLyNl9vsZNdmWnJLzt17Cmpp2PmSWVaoHx0QgA/sEVxoRdBg3IAblDsJ8aByVbjcclhO6wuXrIoz60p94u807/LVCTQ+/Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Arun R
> Murthy
> Sent: Wednesday, February 19, 2025 3:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
> Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH i-g-t] tests/kms_properties: Add IN_FORMATS_ASYNC
> property
>=20
> New property IN_FORMATS_ASYNC has been added as immutable in KMD.
> Add this property in the kmd_properties list.
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  tests/kms_properties.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> 57f07e699..2f2878378 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -443,6 +443,7 @@ static const struct {
>  	{ DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ
> },
>=20
>  	{ DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
> +	{ DRM_MODE_OBJECT_PLANE, "IN_FORMATS_ASYNC",
> IMMUTABLE_REQ },
>  	{ DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
>  	{ DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
>  	{ DRM_MODE_OBJECT_PLANE, "zpos",
> IMMUTABLE_IF_SINGLE_VALUE },
> --
> 2.25.1

