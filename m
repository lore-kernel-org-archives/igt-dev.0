Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66550106FD7E
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C78E10E02F;
	Fri, 13 Mar 2026 05:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKftsTpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C262D10E02F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773379310; x=1804915310;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/6UQyy1oYeSgTme2jp5XQkfWvgtvJIkVczaV9gYrdR8=;
 b=SKftsTpJdBBYo47flHI3KmUeBUn/3B3oWRbmoq4beDhvZ32hYWj37EH2
 f3fsLIfZ1HhLH7ylGE3WGhCoyv1wdHH6+XMyvnEBhxBLtwZeYQrEEYTSh
 4JvjT+rLyZeTklmoFbSSDlC8XzGZftUiy8qFod4v+UTqQE5GY3V1B+7BM
 qmJXuGuS7TRl62xZV0ihtEvdBTBr/0f24scf9+eAt6h7soB58RserOBNe
 isgaMHuXj76d+KrnnKGjUsUSxiBEVuwBV8wWUWEYIkb8Og8UKB8rvOr6t
 XpCnv1IV6onxSCMft1Qpb9Q5MIajiVly5ij0ql3TCXcHSf+9X+TKcm/2U Q==;
X-CSE-ConnectionGUID: DGbi20wOSHeNWnLRRqGBKw==
X-CSE-MsgGUID: q749Su+5TpWTn85fd00GNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74564610"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="74564610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 22:21:49 -0700
X-CSE-ConnectionGUID: AiRKjKUyQ8SFkhrayisTNQ==
X-CSE-MsgGUID: iNYKVZW0SIyDUUkLj7FbWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="221121648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 22:21:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 22:21:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 22:21:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 22:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFF0Bzi+8X1sJ+s9uKLXIKvTE7ijG8EUWGxBnTEE3SiAmm4qF4MlTlDnI6DnW3xqNQzLtvIZQajinodA17w2G7grvG5KHLSFAuX2b88ePU9NuArcPDmVn6H6xRxwfq739jWtgyAgoDkEwCgmn7hXkJuCuZzxogWuMeSMo+8evoEbK5QYvn6PdqTk/SBesyxL+MyidLBTmcqslrJXiLQ+uJrKl/cJQ3MlZIKMDWl6W74MCjyZUkwjBicU3Jw9zVGb6nXIzj7JtE/lYPH4hGN4XMh3O1TVR98tHuZSazBu61DjUb7PRGv4KJO+BbzTMYGBg6h1aksb+Mdv1a8jDKz4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+Vp6ZT0rlSvnHJT0PhwyCorgGUYiSe7Y5YHUAZQrt8=;
 b=h7TKxwW1ud/KiDkQ27vXUv0UX6qqJV86ibvBSfdaOW0Vohog1r52M/7za+slq6caT0GbLDZn1sLF/deLh3fXNkI2JewSLm8b2pdV6GHZXx6sVLydB7Os6M5UDvk4oqOiZie2AndfSUL/rb59866nwzRH0sAg585NLVEFDwvDxuW0W+vig35JgKEOVgBwFa3PpdA1eXTMzHrYIC3e8GTa8AW5HggY62dDszjwkoELqB1UrGRnTlYefEKxZa9ThN5rhXvGjwEezt0r69RYNq+VpjpnKeJAM9llQXB1Wx1BfRnyGCfecuKAWFwkk98zuxTmlHUMeKhONohSFVg4/4qTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ2PR11MB8369.namprd11.prod.outlook.com (2603:10b6:a03:53d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 05:21:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 05:21:32 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Sharma, Nishit" <nishit.sharma@intel.com>,
 "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Chauhan, Shekhar" <shekhar.chauhan@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v3 i-g-t 4/4] lib: Add WildcatLake to compute kernel tables
Thread-Topic: [PATCH v3 i-g-t 4/4] lib: Add WildcatLake to compute kernel
 tables
Thread-Index: AQHcsjneJJZ70lzZ7kur7UXfqO7z+rWr7eSQ
Date: Fri, 13 Mar 2026 05:21:32 +0000
Message-ID: <CH3PR11MB8434CBF705B787D3D0C858888D45A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260312160328.9462-1-himanshu.girotra@intel.com>
 <20260312160328.9462-5-himanshu.girotra@intel.com>
In-Reply-To: <20260312160328.9462-5-himanshu.girotra@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ2PR11MB8369:EE_
x-ms-office365-filtering-correlation-id: 5fd9c4f3-1550-469b-9568-08de80c0637e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|921020|7053199007|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: bhPjf5VZWoWisfVHvRawnBQ9mYzCB6zy24U+wW2SvSHBoZIGID+Z+bQBsbhq4XVHJlz3WZxSWUPCYzGFhL3+Ky0m7AEOUOPnayqva/VYSXGgESnIWXzTxU16o9p4pzc23fcPcqMr0ePspIRBgbUVfixyj6krQG7bfdfwevXWJrwA+yW7C4D1cRItPe4zEtaxv1heG9G36DtChSmIXnHiRsSPZTbO1kE1s4CH3RC5PPaB/yuZskpzMlguftnvebRgpUEpuZTbPQfzp/XSjO4mLwlhPUOYJWTYUIUqrj7aqnTvffQG7kHJkPp79i+/nUxXpA0vUrF/hhsCaqo25Mq2lOrRBlxHOskgftikx8csV/cXjck9M0Q+Om/SLZGQaUdxSA6OP6eCnuYvOKO9TFJj243hA25EzW+wOYBLre0kT/AbZCbttdVMdXkE5xQp+OAMlYZXuurcuHC3Vj+SLsyxIjBOybPjqZXoff3s72a8PteeeZ/enoAxD5FrYquk+RhmSQPBCyHe7nOJL7To05tGsOUHz/3xQyv4zYnjtH/C0Q2RHY6ctVaZIQrK2hqHE7iGYAUwTIreUq7nUdMZ1YHSfjjvOTH6AtVJShwC3fq0u/3YsspSOvI9UXDzgVWas7ECZwxeg0AsdLoKsNwle+8pOrnBaj/XAX3WwjgD+o2wN65e6W7gg6LIVaJcVBTtLgYEourdCO3asabXT19naCqKHxMHBUsRapj+SRwLHYsWHKqRMruZEZ0egro6G0RHHRYR45U0af4QOHQ5U9wCkTKPuGjfAdgpgzm1c9hhFHkNwSl1vOTToKeb/sAzMd04YkyX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(921020)(7053199007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aZBnaD8SMlmhyPXwHbKCmbccLTMpdzssFUtPc/YzJMVFzIMq6YMzA0lzLYCM?=
 =?us-ascii?Q?ds64ApOhTNJHgTkXo5CW8idKVg66/MVulogzkqbOyrREumGUYNLmLlF+UxOu?=
 =?us-ascii?Q?MP8+0N42w0KlAfTAiSETcbNfn/ovvPbzSPozqI4RotCguXfER0joaq4D1SR0?=
 =?us-ascii?Q?S7AAOH/nqj3ftXon2JDs3eXNrjmpkGOnYzfANbZ9ioI6XDT24PvnRPPRqRCS?=
 =?us-ascii?Q?Usdg2SeUtiP966dPoIDpKp1Xpdg3rOMIN2POrVuCT377oHkWET27Z1w/ze++?=
 =?us-ascii?Q?K7wUltVrJamKZbUC589fcNR7+RX76UgEeT1zjH48nn2AmX+oMEb5OpSgmn5p?=
 =?us-ascii?Q?5WbS7/6GcjKiQM7NjpoKhN7MCT4Pck2f1OafsjeO4c9DTTETbCx46iBh/cdR?=
 =?us-ascii?Q?EENvyIzAyCBmaaY/SzT3KRsa5aSG4m/DKe2d/ElMHeJ/ICzD9IOaylyAFFaK?=
 =?us-ascii?Q?5xQqkYyMmTuSJ0VU8lDvFyhu9RcrtraZH1rznywesZcoZuXG6JGnzjknurfU?=
 =?us-ascii?Q?4g4wZNFAkkbW6hNj5p9sAXeF1dGgmtymb22mNHQuRquHYzsTcxYBeTD3T51i?=
 =?us-ascii?Q?qdbtpipyXXwNBlO15KNHuc/TtOgw0+qHHqlOnUg/UPjCpqWY5mLoKsRLo79t?=
 =?us-ascii?Q?ye+uw4dNz2gRowwQP3v8y986aaby1NUbGhsHJJntUYBDgqYz3Xg3pLEK5txI?=
 =?us-ascii?Q?vH9184j03RUbwoTVbO77ikc7HjDSh7oI8Q6pjUKDMgju3bnu1IvqEmC0KeWy?=
 =?us-ascii?Q?zM/BV0/SN5srK7/trnLYs+j4YXv/Yl9vQ2njibZYvKyWpn/O3qlJ4FlMC6Z7?=
 =?us-ascii?Q?Ylq5UYcjt+DQn+l+HY85RRpSrDqnz4rGPl5u+KvJ5Qf0aiSPmsUq7fJPmrv+?=
 =?us-ascii?Q?GTv5d2Kp8BpL52Ou/R120cDWtIHIc4cmz+vlZqvWyp/erax2Wx/4ju/vETYp?=
 =?us-ascii?Q?e4jFtrcRjuP3DBgVMplxyFaATCB7iUiinz0MOr2srG7CeUGWbtlJDhVj8L02?=
 =?us-ascii?Q?AqFrjpH1Q7Hg7OBXs+2lYdaqTmHm66BLM28chshhA66gqpVL4+y2lqXCNoMv?=
 =?us-ascii?Q?kXDPfkRXw6NXAWbhXZZzijMIwOXcEKrEkRnYaGB2pDuEWHR8fXK5C8UVq7N9?=
 =?us-ascii?Q?zxaRUKkSiqYs4Hc9volCywPURAa2yraQ0kzAK0PwCwENzPezrkuZdgatPcno?=
 =?us-ascii?Q?8mHvptgRAWpZy0//IaNujraho490pf5tnbvKZ51d/ClTiA6aH+bk+oUrBOrA?=
 =?us-ascii?Q?G2jEAa95PLbS69J7YlwYP1O0yZekxZBbsIJ2ry6J2X67pGozC2P+su8/VKqr?=
 =?us-ascii?Q?e5MW7y+0/PKhrobbcLJMW8iLLdE7y5qEAKMRhYkgs72aekz7atQ0+1l8SceT?=
 =?us-ascii?Q?BSkbQIKETSPx2QF3muPYIfPlgWktG5D/5fhWhoANRVl/jTuOjRQ4nZDWM2Nb?=
 =?us-ascii?Q?kG29f0fCXS2nSPdkU46EnhV/Q4665VlJ/WHiXQbvcCtx7Ba98XNtewiejwAn?=
 =?us-ascii?Q?cKzCLQeibOvSKOVwXthXfFkqqRa0o+7p35IWseM5aqScPF0MZ5Gd7yrZ6fIm?=
 =?us-ascii?Q?Cqyo36GxHkI6kE1MkiidMIQbGyf8hGiCWB5b1p2flTTjm1WyusqtDWbmfmUo?=
 =?us-ascii?Q?lSP+X507NIFiyGspHwjrf7Faiwy9gMQWZdPZZqtDY/d3miY6TI8eLLdlSMzv?=
 =?us-ascii?Q?XbQpY8QxrmkXzWGO6yrFT/4uPR7kvMgzl12WRzftVN5yxw3DdUaNXk1RB3b/?=
 =?us-ascii?Q?ZQ1UERFyDi5mqf4Ks7vFXAYORqMKPRQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IPDgnskOmygMehk2rimRYlhtzZ4G09LlgTk6A53fI+U1rV1UvMSK81SiUbMHIkLYdrxEJr1dMCtQ/hLEk4N1axnhquyK3AS2NiVcLCvaeQYqSrVxnrVtIYO9qZ5zFBwOlSKBop7RySOLoH3ihLZ4vW1Vw4c6yipLeBCAR9HE1lLAP9YSWXp7QgooSthc3WM+pmtKwd9a1BTF0LpW3/gDZH+T+caG2LIh1Rj844jUI5ARcq9NP/S9erx1xoxfS0rV/YedbsiFy3uoAuFlx4yUObGOPUJX3+7WjhmDMXeCv4HiTYqv2shDl8UChiKbGdAwAWq6AQgXA7k8VmI98wBt0w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd9c4f3-1550-469b-9568-08de80c0637e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 05:21:32.3974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejMO10pdkYU2IqbBAL6a6XcCX6In5IJvJEwzW6olZgt4K58tGzoadcQvQrE8tvKant7ApgE4kYmYi1ioyGBpSIBtlWUkHpVGjvYwNd4JkKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8369
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> himanshu.girotra@intel.com
> Sent: 12 March 2026 09:33 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Sharma, Nishit
> <nishit.sharma@intel.com>; Chauhan, Aditya <aditya.chauhan@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>; Chauhan, Shekhar
> <shekhar.chauhan@intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH v3 i-g-t 4/4] lib: Add WildcatLake to compute kernel tabl=
es
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> WildcatLake uses graphics IP 30.03 (Xe3_LPG), distinct from PTL's 30.00. =
The
> compute kernel lookup uses exact ip_ver matching, so without a dedicated
> entry for IP_VER(30, 03), compute tests would skip on WCL with "GPU not
> supported".
>=20
> Add IP_VER(30, 03) entries to:
> - intel_compute_square_kernels[]
> - intel_compute_batches[]
> - intel_compute_preempt_batches[]
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_compute.c                | 11 +++++++++++
>  lib/intel_compute_square_kernels.c | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 0d1e0290f..b3336a7b5 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2299,6 +2299,11 @@ static const struct {
>  		.compute_exec =3D xe2lpg_compute_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver =3D IP_VER(30, 03),
> +		.compute_exec =3D xe2lpg_compute_exec,
> +		.compat =3D COMPAT_DRIVER_XE,
> +	},
>  	{
>  		.ip_ver =3D IP_VER(30, 04),
>  		.compute_exec =3D xe2lpg_compute_exec,
> @@ -2803,6 +2808,12 @@ static const struct {
>  		.compat =3D COMPAT_DRIVER_XE,
>  		.preempt_type =3D PREEMPT_TGP | PREEMPT_WMTP,
>  	},
> +	{
> +		.ip_ver =3D IP_VER(30, 03),
> +		.compute_exec =3D xe2lpg_compute_preempt_exec,
> +		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_TGP | PREEMPT_WMTP,
> +	},
>  	{
>  		.ip_ver =3D IP_VER(30, 04),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec, diff --git
> a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 7607fadc3..a612092fc 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -75,6 +75,17 @@ const struct intel_compute_kernels
> intel_compute_square_kernels[] =3D {
>  		.loop_kernel =3D xe3lpg_kernel_loop_bin,
>  		.loop_kernel_size =3D sizeof(xe3lpg_kernel_loop_bin),
>  	},
> +	{
> +		.ip_ver =3D IP_VER(30, 03),
> +		.size =3D sizeof(xe3lpg_kernel_square_bin),
> +		.kernel =3D xe3lpg_kernel_square_bin,
> +		.long_kernel =3D xe3lpg_kernel_count_bin,
> +		.long_kernel_size =3D sizeof(xe3lpg_kernel_count_bin),
> +		.sip_kernel =3D xe3lpg_kernel_sip_bin,
> +		.sip_kernel_size =3D sizeof(xe3lpg_kernel_sip_bin),
> +		.loop_kernel =3D xe3lpg_kernel_loop_bin,
> +		.loop_kernel_size =3D sizeof(xe3lpg_kernel_loop_bin),
> +	},
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	{
>  		.ip_ver =3D IP_VER(30, 04),
>  		.size =3D sizeof(xe3lpg_kernel_square_bin),
> --
> 2.50.1

