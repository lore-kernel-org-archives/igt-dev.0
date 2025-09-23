Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0FCAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 03:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A52710E549;
	Tue, 23 Sep 2025 03:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T729Kdjw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F10910E549
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 03:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758599353; x=1790135353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7dyyDjXAt4IgFVIfttXmf8ugW728NuU8QnC/JxeG9sE=;
 b=T729Kdjwr5WfRoBcj+LyR7n8s9EzbWL7AjpSIrQxxh4hhWftiHMxooFJ
 Xj6yoSmRygwMMfFCZTYriZuhm9OeRFddW3UymE5jW7q14Dx7KvzUBtFrA
 JERO9SIYrUGM34cvJBMqWkwtJSZ6Qtqdw4ZqmB8pUriYYlBR2SQpPyuwc
 2gArHulT2LS8I3ZDEt0h+158dASJ6FBZElIZQ86xEwJECVBZp+nBPVx6Z
 oRuiD+H9OBntoWrUlghi4ThZE5rGiXy6udsZwMmZua8NnOg6csKi40xMF
 t3fzyWAS4qFzXLaXAiGf+BVwX2OYknYweO0njynUKY8gLhGBtduMQjBfJ w==;
X-CSE-ConnectionGUID: mOh+dRTmTfKUdrQaa3mo+Q==
X-CSE-MsgGUID: fsjRpst8QYimDJCeB3BXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61040425"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="61040425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 20:49:13 -0700
X-CSE-ConnectionGUID: GCJ5uQbxTdCpIfc47d7S1g==
X-CSE-MsgGUID: VEt6BZS4So622P/FRQO0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="177440972"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 20:49:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:49:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 20:49:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT6OcwPwJHdMDlEllSi1mNcVgJnGrGp0WDWtT0A4yb2w4hvK6hjCKpQg5/LjWPFLU/PXdTyHFCXzN3dunFpixDawLjBYo6rMnlmmEHsMjtIVA8OMy8u3/1BBicLIKGCLSbLbwoVhOSW7ijmvuQ/Blsb1Hkmv+T2Ns02l2zSkeBbYNFy4TAHprU8I9P4wJ/+I0cxiCDikRclWG+jhg5Nfy7lZ2C/+S/bfMQYhA0o7PhQpz4d5Dfjv1y6zlihYvOelEsEb1jJhDdhiPdzujpu5jWTLeKoT8FzqRvvwZCq7IOyWyNXfwngiYgGe/J1c1fP+eNnIknqdgscjBMn8fL5uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emHaiZGMKgFLFkZ/op234wOW93+6PzWHl70Ao/fgb7U=;
 b=naWAVyNs+T4GaiZD2C1u4FVke6x7aYQeUxfMSa7Uwnb8dlJPyQcTvCZPfajFqwA21KXlTMzjtopdKkOXZmoqKgpimxRwtyVlqfd3uJNwLyfyoyla7Kt47uRkqArHFBxfVwSk15wWrRIKTc2xKiEF39zQtqn3Y0pdH4f8ZBAf1pbT3FwxDXfpGIN3v9Ube0k/n7v8pu09S/uabqTEWmm9fkO5I+JpzdRAh8ScGPV/NakKTV6N5pj5tIslIoNh6ACeLyy1SonZ0oUfSlvjmblYaJYaoqo/poCToZTEiG/P8yiXwl+a0laYohK67svyboQ1kDf3smITaNGvn4rHIvwwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 03:49:05 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:49:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_configfs: Test invalid engine with
 valid class
Thread-Topic: [PATCH i-g-t] tests/intel/xe_configfs: Test invalid engine with
 valid class
Thread-Index: AQHcLA4uCazWAMAEgE6NJz55yJu/JrSgIYrw
Date: Tue, 23 Sep 2025 03:49:04 +0000
Message-ID: <CH0PR11MB5444AD7D0C4D750D8D1795F3E51DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250922221315.111774-2-lucas.demarchi@intel.com>
In-Reply-To: <20250922221315.111774-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 32ec59d4-aeb0-4af9-11bc-08ddfa542401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ww8W2WUlqKLu+R0wGIkY0onhrXtE+x3nCWXpzQ4zMVw8GSoyR5hCNOcEiUkf?=
 =?us-ascii?Q?v/BCkYSMMQG3hh6952MTr/vZeKFx8Ron+Te5Rg0nD+vpXIrRRAwpx7dnqqSP?=
 =?us-ascii?Q?R0LL+SOlSUHHsgMLeQ7JFtEJ6JEy0Z1nkyBx+p9Ay9GwkXu4p+/lQshC76jY?=
 =?us-ascii?Q?wdTUIOwf/WQRC1TpGmBlLR/A8fz6xJ/OiD8o57s+F5yD2BQoLVRsNbS7PnTe?=
 =?us-ascii?Q?VwguowgLCxFJa2z3CNsN86XnVHNo2qCXmC+qQQVAb6xSjEW9vULgEGrrUct0?=
 =?us-ascii?Q?5bqIsHx48dlo+sPO0KYnLHzqKfYRIDdj40VO9ut7ipGap31X2z35U4+u3TsG?=
 =?us-ascii?Q?TwNGrHn30Re7wUH53FJ58J+wWN9MYWcW768wnMssFQzIboqrlUy3h6tDV+q0?=
 =?us-ascii?Q?Ku44upArgLX8RfkI0mfuUQk4UGf0Tihu10/PjS61LN3fsAxk4lAZY443E8SG?=
 =?us-ascii?Q?VWBI2PvPdU49dmL4C5oSlEDlajhmlIU9uxqm3Ix0TYBvLCPc8HFpnh9YV09D?=
 =?us-ascii?Q?rWDdyCtz+1q66ZcwCimyHnw0Hg4KEiDH09oal3cl8TA64rGh6EWTOnkitToB?=
 =?us-ascii?Q?rkJphu93WeKctZnxgWJi0rDbhUb0XOzcSt0HImSLuhQCeWoV8T0XV2RKidGG?=
 =?us-ascii?Q?+PnKQOb64/orfzigFLUGk0MB7m6h6hGqSxrRSMor2cy+GoAaBaa8zxQ4rcWG?=
 =?us-ascii?Q?0ob47Nrr/ryuQaBcly43KrbB8QSjZED76V+sYt65qagny8tc6544I6wlmlGg?=
 =?us-ascii?Q?vxIMvkwWViQr5qWgUiGxk1yR7lASo4HNA4U4PBNXbV61MuUuFkZs++fs62Aa?=
 =?us-ascii?Q?JCkHSBVZXQFlreR8/crj8UTwUevmZ5TlYsFfN+wUuFFCi7LV9/e0WS4YOguC?=
 =?us-ascii?Q?tV7QEXADpCftJbKx8o1u3jiCHpZD83wZHhiyuvQM2TPBnInMNi0sKBtYLVh/?=
 =?us-ascii?Q?P3b4tQXUqmNepbkcU5z9vhyiITlwEfQfTf3NxE7OhU7wtpzYFodxOV7CGf0G?=
 =?us-ascii?Q?f1/bhxwNEtDPrnj5lMSpSazT8cqsAwP1J1hKXjfweL77hbmQqikagh3/GpNN?=
 =?us-ascii?Q?tJqukeEovKUIRu7sS8IVB/u5VG+9iviXazoTIH/mNizWoFxJ9w8Rqsk7XyOQ?=
 =?us-ascii?Q?sHNbWJwriF9AFDRDsrHExVai04xlDuB4W4rhBhtOjTbStbjyrKQe7zFkisKD?=
 =?us-ascii?Q?qeB/b0n8o3OjdvoFEkGMHvjIx1YrWe1H03xW6wKCV2pNj4t3H0aXHQ4bGLxT?=
 =?us-ascii?Q?GQOaMtZoaxQG7MW9qvTV63t5Y//uUxbldUfWuZmJ+dUlSCYDgjgbhveJSXyu?=
 =?us-ascii?Q?8w47ZyrV83x4na1n4A+Osj80ZEBmUdiCZy/+n9NXplQwDKDiLsaMlM7RXz/r?=
 =?us-ascii?Q?vRgU5luZWYAJynMUYs2kdTTnsyzOnSxcjB1PJPlgQntrJPSeZhwRDZRR8hcs?=
 =?us-ascii?Q?2mncVPcEWqWwYKINP0IY+FU1vL5XjuYPHWtaYNZJk6dfdUI5ecg871UVZL5t?=
 =?us-ascii?Q?iCDYrfLaYnIafeY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EmvhFJBJejDcQlPOWlJZTYSMDKJFnoPWtYsWhtgCQlH4iX9sSN3zN1u45JYn?=
 =?us-ascii?Q?Hg/m59bjfezGKBRtp8Krrayke27DSwgDbrGv5Qlrtd/ekFBAi7iFIoLmWbg/?=
 =?us-ascii?Q?WuLSsusHr6ITx4qcOOO/onnyNMEjzt7lPAWtGpgoIswj1rjSxzyRPcqNiJYZ?=
 =?us-ascii?Q?rDmElwiZgQg/b5y+gSu81SK11jZtDMoLA7RlL3BbpEUgixW3mxILnLIosIKk?=
 =?us-ascii?Q?wzQqOpeKky/79JWOS0BGEFjcX1tb/A1YnLAxmLgiCeureG7giDuIfk4iuHfI?=
 =?us-ascii?Q?WXma7GgB4MwFmJ2HBVejA6bwzs2Sia6TQrVgZ4PjEisfkm/jacNdfJMWiS2h?=
 =?us-ascii?Q?zVLARefEPB5MLCyY5mQpHiRhSsSuXta69NA7lED0Cg35AcRqyqUXIYCiXDOJ?=
 =?us-ascii?Q?ZVHXsJpmCN+bi7GpkkaEyIWRdCYK3/wPSG1cTj2YLCruJPvHdCkva+xRLRTa?=
 =?us-ascii?Q?ozXd4+LRIKq+Jq6wCc5mzZtbeXY5/Tf8TTdcfoYYeaCSuTF7m/MhJsDUVVD2?=
 =?us-ascii?Q?djdzQKQMVspG+ReyUTPEHDhebNNcyT3ClTsuAL/ce5nJgfF/N+JtFQ441Aig?=
 =?us-ascii?Q?j1VdGZcd1vHAVdwssIjE2ZGRvcQAQgmwEp1s/W/lmhWQXtsmIPiAsSm4MGag?=
 =?us-ascii?Q?YKkY/yd3ddunVizR1Bb5Qf4C2dB6PXJEWm7R/5W7TgTsjOpdKn/hCn/igFcx?=
 =?us-ascii?Q?GehaOJofS06s23Wgj1xg5pTAAAgvDijqQlM4UXqx4yRqgI1EMdk82Ofgzp0S?=
 =?us-ascii?Q?xXmPA9FdWs8FnjMciontr2Q4EPkGpdjqQlcwOOCXKnFAd1c863jZk8LIujQe?=
 =?us-ascii?Q?DU/M5Hs7/ysQ9oxqh/WKEcqDyOqwuVKpMJVayNTTBNF6iwmPLDGP3UIvhBnh?=
 =?us-ascii?Q?4Zete5RI4xSnA+oynvFUTRjqS8dg4SrhmUkGdQSkYgaF+eYYBK8sWUSjYxOa?=
 =?us-ascii?Q?h9/agGFqbnR1vSzvDH93gh1GaYewLI1HQhuA41pmvObJDdBia1jl+hnRmMyX?=
 =?us-ascii?Q?QoE6UFaNCzDnBjUBYdPu71tUDII6e2AeWIAkVVgeXbYpy99fwNqAzWRk+PpA?=
 =?us-ascii?Q?Pkk4tMeecjWDrAxxgnkk3rvpYrArAimIcDEUDzLA3QnqhEyewiAF63xKqsus?=
 =?us-ascii?Q?jw/YolAksO5i1nA8/yMBos8MktITnKVuDZjTTcx4oWstjVWhmEunMqbHnz7S?=
 =?us-ascii?Q?KhQFdIVWQ35Gn5YFBCGMSN7IoHmlN9Z2iNPHRY+1frWAKgILzdLVEcDB5hdv?=
 =?us-ascii?Q?dZwYkNdOZo+1nP59grwSD+cnLTSltyDknge/o27wAgChzsjuMymkkY25uJxH?=
 =?us-ascii?Q?4fEAGjK/+O1bFU+qTwO9BgiNEPw6cooHnpZD3FijSidu6d4FMkdrlKdeMkmW?=
 =?us-ascii?Q?ayoGBYbfLcSjBPJ04YrQgO57en9fieO6hzDiDg3ODgfL4IoUSitjFwMjTEJC?=
 =?us-ascii?Q?5KUA8CLSlDNbcK/rqHVJAF2YNBhpVU7xfPfapKt/nn5uTBa2SR4xA35Teq2Z?=
 =?us-ascii?Q?EGuBD0bCJumbrOZt/mOUnpqrw+jdLrTtAwTZVRmS+xsTGwTEemwDmnS+9qNE?=
 =?us-ascii?Q?KzKwOIUqJ+0CXi06FJWZqXw3evm9Wl2bWkfDHniJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ec59d4-aeb0-4af9-11bc-08ddfa542401
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 03:49:04.4372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMVmzqHvrUt7GIcsUzlf48iVfj1qXpEi0w1quKLHzGyT0sj3FzZBa+D1LyUq5njR+9gNo26SS/1lZoB8SMe/ZgUDiN827X/AcTNABBvtfqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Monday, September 22, 2025 3:13 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan <jonathan=
.cavitt@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Test invalid engine with va=
lid class
>=20
> ctx_restore_* expects only the engine class. Pass in an invalid engine
> with a valid engine class to make sure it's correctly handled in the
> kernel.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_configfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 7a7a7edf4..ecba69dbd 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -177,6 +177,9 @@ static void test_ctx_restore_invalid(int configfs_dev=
ice_fd, const char *type)
>  		{ .test =3D "invalid-reg-addr-only",
>  		  .in =3D "rcs reg 4F100",
>  		},
> +		{ .test =3D "invalid-engine-instance",
> +		  .in =3D "rcs0 reg 4F100 DEADBEEF",
> +		},
>  	};
>  	char buf[4096] =3D { };
>  	char file[64] =3D { };
> --=20
> 2.50.1
>=20
>=20
