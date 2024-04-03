Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89FDCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 10:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6972811262D;
	Wed,  3 Apr 2024 10:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV1lwxRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5380E11262D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712140596; x=1743676596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QLpzn/gf6oMItJPe+PhdKVUj6WgCd7FNk1rPDOkoqpg=;
 b=dV1lwxRNoG+gjEUaQSsJG6xBpyQ/D76jVyLHKihCEWZLC8Dyv0LP4yb9
 gZGMjiUnkMMidJ2fcV91jzJhFU4kWQ/DUGwTaTYFJ2GM6BWylgxysLzBK
 DKZvLkKwYRC2YQ51RXgafwjBmJNZR2FHQBLc6p1TlP47I91Bfbb6DF72d
 33MN1yOrXHAx0CFze7yPyYBxR/+ncn5JVyK9lyFKhASkyvopOeR+i61ml
 yCsQrgrpmu3DrzJ+O+/ujPbmZ0ICnUmwLcU8sDJ0culwN1ppoNDVqKy6k
 zCuAcRZ7mr8HirdBHXloDCsahytLCIK4QLVn65JrPEjYbRTrVPii9/s/X A==;
X-CSE-ConnectionGUID: EFFLzuFkQtGhrAYKzGF07Q==
X-CSE-MsgGUID: fecxgjV9QbW3qU1oZ7iJng==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18723348"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18723348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:36:35 -0700
X-CSE-ConnectionGUID: nbv7gEfEQPeoIDHcJUm4lw==
X-CSE-MsgGUID: rmBzGK4iQ2iLchg65+jOzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18497394"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 03:36:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 03:36:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 03:36:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 03:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iz4wwYkgMWlr67batCncOoCS0juoRweKEwKw2w4hOutnTy4AnwrbQhLEJkgPNc+Jz1puuX+pS03PIYA2ZZ1I9MK3qrrfECaH9pFzrNFlXdZ1Bp6bw8P0kbCllTfWl4v7kqeG3bcnWYjSKiW7VZSw0Y/TEjmGfyafT1YEBR6NrvvlEdbWmZW/rSOKVhWqKtq2qxjvT1HNicxDwgwX6EqmXSmBJEj02lZrCoCjzmkqDa/5sO7nk6qMX52MMoq+WO64pLw9T82U2vA/JpgzeysiksYgRyw+QLZdlGALM3/1Q9PE0mDSZNjU11ALefrpnYFqapFRehpv9ex4qj+bBeJvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hFjpOqpIbQt3Up0nUq3P7lkvK2iuwfZdA7rS3ksALM=;
 b=BFlgbz1uhFo8Jer4ZJtkl+7JRc/3Z9raMseSaXjzlyaKZ9mV2o2HjiWTOo4pP7E0WvsEhIDSBy1V6j9F8qLxj4cQmDw0E7gy1RRuHeIKbCX6RmCLBqWXM1ZY09smKnDsQef8CU7CaKu+k4lHC7OpKBNKblnLPm84fr2TZ3tpufpYjRFadqvsxwxiKVbGI8EztAVVBZDV8KPltp8ZSbmHL9t5DdXEvaPIbdMrY7Tjmz97zqTSShB2/+KBD6urMlyyB014M/ExAMoxLmpARzAicQFcgpgq2Drtf2yzROgCV8v6/BjlejFtMRO6GvKIP3HQZz7jdnynn3Hk9F+bPI6UPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 10:36:27 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 10:36:27 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Thread-Topic: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Thread-Index: AQHahX7SAC+L4aSznUmq2oee/Nnf07FWWlXQ
Date: Wed, 3 Apr 2024 10:36:26 +0000
Message-ID: <MW3PR11MB474841F082BEBC6FEB4DEA8CAE3D2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SJ0PR11MB5134:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1WuEXeEeayy4QgfhQSLmFA0QfKsVrkuvrqGxcswfbiKH50fHdQApYWGRjsYW6P6g/GAG3eAgsA4VQfqPyXLRYhkoCbB6xR6XtewUYAyVM4uHozJ0P1Bn3/+3vb45oeUi0AGRkrhwePIpE68CvVxusCCpBCl8PeuRXQgh7X5Js5akFXNb7wV7V5J64yNRQ7yLMiuLizJtSgsKYxqCX4nKItfRyHJj7AYjTtzsokacj2MC4A54ttx0j2iUB94vsrKrFYdkVrFR2MCjK/sm48cNUrinJBWRo4iPk1Xpn39tSCXydipincaNZPI8/1TLZRQSki5BOSve4s54myKbU6xijFS6ejtai9g65g9/yhTGWMg3G3vqNWMBZhwJwJo26u4DwQlX/UdsXMBPTand9cXEN5IqSyq3AxrDERX/yCogm1B74FgWrf+RTeHOpiSyyr28ej8o/x8YCZrAm+Yk17TJkNV7qXuSTNnbZqlJQuA7vU6qkJjD1/m3QyP0uU2g8tcgAozP5Ps/ugZLKDNuF7qXc2FB0fPZ2zAZcds+lQTiZrL1g0RKjkLl9bzxXn/X5iPQ7xcxhsT+QKxI6jzqt1D3l35NFnmrKmHZBOingWXD0Wo/KOGMjn7Deh6OAkGSPoEv97Xtqz4oXJNibyS+SjF4CbyYWB79Y2B/GiinBChvQo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SYe4lyvpc5OXY5lpO+FCgy0NVINZ1YjdeyWd0hMXnuyGbPzmQLfzE1tkU9xx?=
 =?us-ascii?Q?qqHAdVpijTLXoAXXcvGNv/ey2C7+F9i7ChlpJ0MwAUsEGeBiDKsSnEdlfscU?=
 =?us-ascii?Q?Kh7Nplj202a7hOQCkNYNX2ueu8XLEy+UcXeAcBHuUYDFvu4OmiDt1djJxETV?=
 =?us-ascii?Q?wHj24Vmlzk1u8i223yE2Ak2ZauEGMsNHUHVG8b11d3qR0DMX2vP7hxcte7lV?=
 =?us-ascii?Q?dx2gXcU4Tp1N1/WzkOpkIWcThnVJktZG5Ukt+Wdiid0fiNgFaIIq2kPgba1b?=
 =?us-ascii?Q?IZT9tuEutz4pLm2f2qdeU4SPsfEDadZEiFUGmmWBGoKolbAcBnic4jQ1S6Zj?=
 =?us-ascii?Q?/SB8HreHg2ItsRe3ST9z4h3pU9a1Wddhm7SpLSXjpjOBGwo7aB0pwgOqmwCe?=
 =?us-ascii?Q?joP0uu5bwPh2lgzlzArX4lmLagjyiMVcKmtSmz6ZTagyvhDbFOVpesAKM4QG?=
 =?us-ascii?Q?Tq4612g0avTvzEoOY+Q4vZLCDnEntrER0TUgeIc/YgLWidEEE8VV+xzicwun?=
 =?us-ascii?Q?hWt8AJM/2k1ywZ5P3cqG/LUxnIZEu6INUTorlqGxpP24buvkKcUGHUTz2hYa?=
 =?us-ascii?Q?nqk8giTX+trVg20P6KlUFLWlNIs3p82BGkK9B1WBqbVuBWimtLJZkVeFAxJ1?=
 =?us-ascii?Q?jMGgQDofG4ufDqMi2G9FG0+TyiOon8tBNptl3sVMrEN+9qRN8y0j92tIp7jW?=
 =?us-ascii?Q?QiX8baG0R+K0tFKXEDM2UbT3uuG6gUcblul8WQ6GhULX5qp82qOCeoCn364P?=
 =?us-ascii?Q?+e1NyXlAUrixeed3clQ0NcQ8RkWloplV6GMxIpzF9DtnXkOg4sEyZep52QQG?=
 =?us-ascii?Q?M2Jom4RH/H+1DNqXsRWMBjRwv0y+MVhuM8SXBLECj1H8+o1IcrTWhjrhLMpD?=
 =?us-ascii?Q?zPp0R7shaIh4wBxqq14HW3ievepqgPch8mkddPuhGg4GWBhdtavoawwwuw6t?=
 =?us-ascii?Q?quBsOZELQ18y/ZMUR+DZCv2Y5E2nFrZv69PFHy551+jQlmru87vu++eKa/aF?=
 =?us-ascii?Q?e3GKKQB/q0CA4ph0NBsyX3tnZIuOe48xwPqwAQCCS6MRDP1SHEM2IaXmanwV?=
 =?us-ascii?Q?Af++Q2usKkzldIchNt+j9mIjltLfZtgZYTTgbFQDTCS4auxq0Yo8trIA1s8z?=
 =?us-ascii?Q?EkMlnhq1PV2tV4XIPT4JxhWlZoKXy3Gb2EF/L6pmrNWcBeQqYhRLgChIZ9pz?=
 =?us-ascii?Q?nEYmc2yUS3HU1bMt9BPUTAzZh7dtRADSLra6P5OrHqYAlXykf6rZSc35tE5/?=
 =?us-ascii?Q?Xi0bYRZklDnbIbCLCgMyh8XPKDhqKIlxnGaEY9OBvSJ9fFWyS9K83xi/QBPT?=
 =?us-ascii?Q?gAdpbZTGOk75IrtySkXJaWGSuShoiSvwrRRQxgmmWJrs5M67wFWm074wGfFs?=
 =?us-ascii?Q?AeTSWdaz2zGT3YBTaLfnpL0nh9KvcJqedHYV6KkU+4HTukflVzSLD7483+K3?=
 =?us-ascii?Q?V+1M9OkahsomI/szyUtXdHkf00MAmfEoj+RTyfnXS9wtxdRQqPSgijiab6QX?=
 =?us-ascii?Q?Jesuzl6eG/VmZO0hvFcjoOO9L0yV1n3/bbSl82/4fhvSIXrfw9gfNwY0A9VI?=
 =?us-ascii?Q?LRqgyLwzLSw99dTRbYhA1V//UGtTt8iCXpT4IGY0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8d31fd-f48a-4122-41e9-08dc53c9eaa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 10:36:26.9728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNRcDUQDSQrea3pLUVIqbSq3By1ftw0mh3Cco4ydv4GTl74Omsf5Kd11r6THq4w7f2MW4hg83H1QIzoHvMoCUEv5qcMiR42nQ+5s2NkdG/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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
> From: Goyal, Nakshtra <nakshtra.goyal@intel.com>
> Sent: Wednesday, April 3, 2024 9:55 AM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Ghimiray, Himal Pra=
sad
> <himal.prasad.ghimiray@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all de=
fault
> values
>=20
> From: nakshtra goyal <nakshtra.goyal@intel.com>
>=20
> Change in igt_assert_f function parameters so that it also validate for p=
roperty
> value equals to 0.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: nakshtra goyal <nakshtra.goyal@intel.com>

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> ---
>  tests/intel/xe_sysfs_defaults.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defau=
lts.c
> index 4a6b3ba6d..a0014a832 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -42,8 +42,8 @@ static void test_defaults(int xe, int engine, const cha=
r
> **property)
>=20
>  		igt_debug("Checking attr '%s'\n", de->d_name);
>=20
> -		igt_assert_f(property_value =3D igt_sysfs_get_u64(defaults, de-
> >d_name),
> -			     "Default value %s is not present!\n", de->d_name);
> +		property_value =3D igt_sysfs_get_u64(defaults, de->d_name);
> +		igt_assert_f(property_value >=3D 0, "Default value %s is not
> +present!\n", de->d_name);
>=20
>  		igt_debug("Default property:%s, value:%d\n", de->d_name,
> property_value);
>=20
> --
> 2.34.1

