Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A4EE644D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 05:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45710E1F2;
	Thu, 12 Sep 2024 05:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmCHMTIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71E10EA9E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120369; x=1757656369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JIt/5vLQetwoGM+YvViwCz3yUBv1UHX3hVtUpR5a2QM=;
 b=PmCHMTIA9VbL1xGiJoNl/K87pdDvErZe9/NBK/OEdmbvRz6ZWzDZtZpq
 dI2d8Qn8qqCOmdJWvOxOBJDIHXPhZRedLug6wFmtBgroct+BnziV8g0ee
 xov6Dr5stLTWQrp1BfKskQb1sc1ao7g6d5bSEutsVEI1rG0zcfFn+HPAX
 t2mR8I3J1D/KZUzkRKfFVs6pS1VmPhLNqIe0O3rYgA0D5jHbcsq+30dRb
 dPwTXXmC7GdDcb3I1nxj2ayJlmzVXfSA/12ZDenDcxROPNQh6AB9oWxNB
 z0Jx+2t26XnT130dyIUIAd8JGVlnbGjX/bjKH8GxZHcHQ1/mOd/cGwPbD g==;
X-CSE-ConnectionGUID: e/2wIHYySbKDkUvgJ4bCPw==
X-CSE-MsgGUID: UWKGIRgJRNyg3soiS6I1gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42428174"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42428174"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 22:52:31 -0700
X-CSE-ConnectionGUID: XHxETtZYTiuVL+eOHu+FOw==
X-CSE-MsgGUID: u1D0BCcrQlaXezh8TZLgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67902864"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 22:52:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:52:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:52:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 22:52:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 22:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZlsLYCSiCd2IAEJcNiygoyX6TChlGGYLWaSiy6R+zdQ7nVU35r5VeqlXu79lOsY/1vsKze98xvZRqxGhNBGBFCziTVRZvz587i8APOvJUts5oVbypsXvP4jvOjJj+0rTZYc8iDZgvHJfS52HqakSYRBDVgwb20zh0VNdsd/Sbh9nKiEfnxiRkwcra+bg0Y7h+V1sSDv8ORw2kbHhX6alnKrSG9BE4wk5MsuaJrmgBLI9zmDT4NoC/ze3aPoi2rLonPojopgVXtsUk8t+86H9/tNxp+TP94RFo8psBKyX4Qzons3fxf29V9MjPkoyj1XyNlSKVAr++Y8MTWDfD3q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z8qVddtpfCNu+HfJwD5OxLUJo7YsX8Cjlf6Icjnih4=;
 b=cpsPA9K4r1myUaiF6LDlCPOBLxx3srljq2YIpHDBIHmdseLCYz4YqExA4UiPbXT1JOSEPks+rzcZOJ1fKNoP1xrZrvFRJL70ydsaUUI9GJLr4xWHNp9ZxKaZa7Nlny6uJjPPCgd4ESccGdx5P1eiK1gr0uv+zF/4qIuCAdbIUnOo3ZZel1s5y+aVhR0V3d2UxkF8PE3HpwZvI4iyt+wl5wcjlE23bcClD5XFWE3JxHrf1TU4ZX+cMiA/EBHbeUwy7udrjkPhn1cdPTrpvlWlkrC0FFfDTJh4mfZTfcYhTOewZM/tiytmeCT2OIzF6/6snOfTWngMIZFW3JJx6IEhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 05:52:28 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 05:52:27 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Topic: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Index: AQHa9yiZhg8shtGwCkaS9FJgITX//7JGEgiAgA2vEWA=
Date: Thu, 12 Sep 2024 05:52:27 +0000
Message-ID: <CY8PR11MB6889A5CA4CBB52C9962F3735DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-2-kunal1.joshi@intel.com>
 <ZtcGnwYnI_7ektVq@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcGnwYnI_7ektVq@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|DS0PR11MB7531:EE_
x-ms-office365-filtering-correlation-id: 653edfb2-9cf5-4819-c289-08dcd2ef1552
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZPUXrphmLXck0/mtpbFZoEP1bvMbbXAwNwi1wXXN38+B6uZEbY2i0Sdsy379?=
 =?us-ascii?Q?+8qsmeVF/zek0Rz7JEG5kzRLxdhNvs+fbU2CtOAznvo3FdtfjUs+wUvmCC7b?=
 =?us-ascii?Q?85zV9q+ClNDmrmfL09A+2/RhP0kp3jiYtKhSdiyE6zO2DrjG2CpLUjEaDXCD?=
 =?us-ascii?Q?4vOgR4O30/ezs0aYHSa4IMZyEzfdzWX/cqqoT1olgk4vrHnbHtXWOgVZBv6u?=
 =?us-ascii?Q?9dshU9ZtkJFdiTIGa3DDaYee97kIhP0rbdrlP22bulOWBUyL3OR6qb1xuT76?=
 =?us-ascii?Q?b/J30MSQ8G4EC7uNrflTf7k0XiUK3rLtqAi56ObVG37toM1xpOdTrL27hJiA?=
 =?us-ascii?Q?hvDz4C8bwuaf2Wjp7AoIzkzFghDfBb4RjUx806jy8ylQKsY6G9Cskbf+ezE1?=
 =?us-ascii?Q?cOa9gkbkaNeh51lvQY564WNEJK7S55LDyP7sm6XIoNc8L3ccPjo+JjabWxmY?=
 =?us-ascii?Q?3LG1qt/VuBqmdBpo4dZ6VFNCFnd97AhZtMC5nS9UxI0j6Zv/bTtcQxuZ3hXQ?=
 =?us-ascii?Q?mA30VgdYGZKYF3X9GjbB6tqlyj/LojZQO//kG51gmS6bhMii1GEItK3W9y1U?=
 =?us-ascii?Q?tOnnxqP36N3AWh4OF0gB91RP8HvMnQopMpKFz121EtWmMKvjGSCSff1OLX2k?=
 =?us-ascii?Q?wclXF3ZAvakNR5recaqglpgly9obLzx1qkszacx15zb5Ev/mp8DFgvPlU8F8?=
 =?us-ascii?Q?GNM0hWO7ux5wz1kvxIIRIBXoBK7O41UGQfworTXgJ+dfHDJA9nIDyu/AB2be?=
 =?us-ascii?Q?0bkviyRjjHx2tXzHL6xmB7MrQhpFBVYRCmP12ic0bCkK9AXbaoLJwvP/K9FI?=
 =?us-ascii?Q?dwOcsiTOYtIYA4mcDFjkwoY2Z8Yn8niXZe+4bOFFSKVkf8gCR9I5a9PUBVd7?=
 =?us-ascii?Q?02feGrxETJKrOMspEsuQ+BHBqQ+UhaVNBdp7suBMsxmf3vxCTqvUphtWheQx?=
 =?us-ascii?Q?ZAePOw4JVV8WjoaWBbkag9ntz3nwIxzTJjlq2NrH2NlLFPbTtcHSf+hoa2Lf?=
 =?us-ascii?Q?5FO4207LbIuyqPkJ3GggBeP7OASHWlZq+9HChZOjNBZmr+NJyR1TipR3+Xws?=
 =?us-ascii?Q?iRgqAN1HsQ6P6mS7AA82I5FYEjkp2suEEvQ1kz7MT+ZNeODx4lE8byp0/KtT?=
 =?us-ascii?Q?ZYlFkRVkfpvgTfy7I0oMxBb2OuycJLfq7HiOg6szmF7qfu4r6bTJjzgacxzC?=
 =?us-ascii?Q?f/8rmCxkEX7V9G/fy68WFTSNVT5uCt9ioozrI8pS8JUm22RK5ydT0eV3yFF9?=
 =?us-ascii?Q?LemOMdFCegODw6yKoG1ntm9bX+MVgE7cM78Gm60XZKx0LWu3Wy/ojLIbsZHg?=
 =?us-ascii?Q?lcGhM74Z3KwuBTyFbeaIrruSP1N8HQiP8Aakmm5jIU2QIeuCyNhkqQHkkbDd?=
 =?us-ascii?Q?uk/jLBh5eYX1B2ncpRMFmNqNGCVnR03xazGv4euXzU0LmqV3/w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mY0n8jbmNu6OfPFrI47dNQ+AoGMrlQdke5zZbGbDQTZNDdXvoGmVtyKYOrBz?=
 =?us-ascii?Q?VpEoCEMkiOIHJXu3H74wfwix2yCRrRhxxHUfc/o4G4iV6ScsFAfJe9i8WeX3?=
 =?us-ascii?Q?t5wzBpHXZ49VeP+N2zO60ndhZMIGJyN1xv1NY5NwJ8oMeQJg/xGIRjV+iYbn?=
 =?us-ascii?Q?u/HMC7CVue3+IAJ9sFyxcZUEsB4p0sCeU1ZksI0BJlAFkGXcdN1yvBgfjXZi?=
 =?us-ascii?Q?qFOz2ZN/smqoH9WC3auETVmH+8n5u5OwBon+WW5o/GaOmB0QCYxK3YzGccQO?=
 =?us-ascii?Q?BIGDA8JkgUvmJLl4vuAE4jEL4WqvjEwLNM56ZlUj82gqRgRqnlZr4+DO5wWi?=
 =?us-ascii?Q?g32g9HoNDcgAy5JRHt+98WBZoeKQwiJXxyz0Kri98fc7q1uJGY6vc8UhTWWY?=
 =?us-ascii?Q?pUAdrcKZpguHBxRTXPMm8YmRGWTdtolNkvrZURjKTqjVU5JRrUOPXpjTk7k0?=
 =?us-ascii?Q?j8fyY5xVrZoobpZADOjtIBO/8kTvgknb1Hu6lIIoqCV1KHi5wXNNeALdcprd?=
 =?us-ascii?Q?YLDCnfpObyBbEdJuCUsxF5RWxnQTPkToe2Dhv2+7ic11mdt+vOPZsXJ4Tauq?=
 =?us-ascii?Q?U2c3Ff94MoAriN4jv7UXtbVEPeUj/2TqUrAia74aBczleSr5vxfISCRqxewN?=
 =?us-ascii?Q?N5+veaBbz8oBngkakGaTNmH5fx86NL5pEhPqlrTyVnzjJxubPKqcdBwIWMbL?=
 =?us-ascii?Q?q1tEQ7Ds2HrNyGQAvL2/bu6sc6dt68MqI3+egwzlyQ+DEIpS2I1H/uMA1O38?=
 =?us-ascii?Q?crrZUIdRFbhBTprEUchdIh5fAQ1lIxfpZeOe3PAWvBC/xd6raa5FFXdnVwgw?=
 =?us-ascii?Q?mJpi7UoBanJe8Gi2chx4y2x/4QEnKkZrEzbTCUYgs2m6SwpHNI2bUeJ/VSlF?=
 =?us-ascii?Q?+Ih4Sz4iTTvmIgvxbSjPmvU/PeC17avrA+whR3RcAzf7xHAk2zvjSCdPHpFi?=
 =?us-ascii?Q?9XseTv6Eo91lYdqbba72q37gWjRd354cDxUdmaHOFmELjXj/7Q3iTBxmrKPC?=
 =?us-ascii?Q?ingMsL5ERhtR3Y8DGWsr9ocIcXRDGCUL6ZDG8x0J/R6ru9GJYSlCF/jdzUoJ?=
 =?us-ascii?Q?fMJIfvaopmg6ceQla/htrgHIFcVuOXzi8GKoxJrs9fkms73RdmMn5F4bwQmu?=
 =?us-ascii?Q?xa1s5a7tFSCBt2SCnpNqCBl9wbML9FHwi5XtNMTjYVQ3N9qtne52BVTrxnYG?=
 =?us-ascii?Q?X7BBma6Y4Qipm7+WprbRu6QjhT5yTENlDa9fPEzJT0o+rjQwGz+uTOaMWh0q?=
 =?us-ascii?Q?4zet22leArvQ9S/ZHU6GkVqYbXSxkDllCznygJ9yrN8zgEqEQQZRRkclHLQw?=
 =?us-ascii?Q?t8r/79DaPNyEHG67X0ypl8ucqQQ40T9r2exnd1P4szDUaEvBHz+mKSsZUOH+?=
 =?us-ascii?Q?Z7hcJYw6v+h4POZPqQgQvoIhkpTC5Fylwa4hrezi0hMTDJy0dvScbzJugfyQ?=
 =?us-ascii?Q?UR8pmLkkGxG584yi9PiaH6ytHqyS/U7JuNpxWVSHvxmVnA6487KjLjuZRCJP?=
 =?us-ascii?Q?28JrO4apWV6+Kp5iBxvtTjWu6Kw3IbRvY+QnIhjnXw6tP1gd1egDmsq/mKuk?=
 =?us-ascii?Q?q0gNGihLb6j0IKD9yM1Nv8R14eKSygbSJqAFMy3K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653edfb2-9cf5-4819-c289-08dcd2ef1552
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 05:52:27.6102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pw8uzl/sf+N3tbG43MLWAb+AG7TOkQtinE1Oi1JWqJzXZDiOUPkHG3S5SNtAyt8YNsClaTQabKUSXCBuFIZFrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 6:23 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and la=
ne count

On Mon, Aug 26, 2024 at 01:35:59AM +0530, Kunal Joshi wrote:
> add enums for link rate, lane count
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 25ba50916..999921f9f=20
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -258,6 +258,29 @@ enum intel_broadcast_rgb_mode {
>  	BROADCAST_RGB_16_235
>  };
> =20
> +enum dp_link_rate {
> +	DP_LINK_RATE_162000 =3D 162000,
> +	DP_LINK_RATE_216000 =3D 216000,
> +	DP_LINK_RATE_243000 =3D 243000,
> +	DP_LINK_RATE_270000 =3D 270000,
> +	DP_LINK_RATE_324000 =3D 324000,
> +	DP_LINK_RATE_432000 =3D 432000,
> +	DP_LINK_RATE_540000 =3D 540000,
> +	DP_LINK_RATE_675000 =3D 675000,
> +	DP_LINK_RATE_810000 =3D 810000,
> +	DP_LINK_RATE_1000000 =3D 1000000,
> +	DP_LINK_RATE_1350000 =3D 1350000,
> +	DP_LINK_RATE_2000000 =3D 2000000
> +};

Imo, there is no point to define enums for the rates or lane counts.
---------------------------------------------------------------------------=
-------------------
Sure, will remove this.

> +
> +#define DP_MAX_LINK_RATE_COUNT 12

This is not used.
---------------------------------------------------------------------------=
-------------------
This too.

> +
> +enum dp_lane_count {
> +	DP_LANE_COUNT_1 =3D 1,
> +	DP_LANE_COUNT_2 =3D 2,
> +	DP_LANE_COUNT_4 =3D 4
> +};
> +
>  struct edid;
> =20
>  bool kmstest_force_connector(int fd, drmModeConnector *connector,
> --
> 2.34.1
>=20
Thanks and Regards
Kunal Joshi
