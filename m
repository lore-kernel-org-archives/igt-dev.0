Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C502E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 08:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74D910E41F;
	Tue, 17 Dec 2024 08:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6DNDcAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C760210E41F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734423822; x=1765959822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z4mvojIown87gNTONB3bGDAPPW8wkIEWKEXnE3LNvfA=;
 b=R6DNDcAcjaA6MO3h6u+6UjFJI94ABpFt7mRPIDMI3RFN84FazLsJiigz
 s5Od51M/neZ7X6isu+EMs8dbDBCF6rzYw8WxL+I5OQq5YKrD75m8ZhG0V
 IBU0kjmbtZeQgckB4rbwq6bvSmvtvcd36I1qpdFBvsWiDS0d2P7d1AXdh
 00sqGkm/FzyFqmGmNuhuIARqgs1apKba2P6s+b46YrHorjEDzdrImxOsF
 kR6soRn1Cj/J+25v37Gjefa0BQ3bn/LIo/CvzO52Ym6o0RDdsy+sdmmk2
 We4WvVlrLutfecQvMPNnnPLm0IdvdEf76ZS4ciTYaFBxBayoN+8F3zlW1 w==;
X-CSE-ConnectionGUID: uPr2M9QaRfeiUn1G/65yEQ==
X-CSE-MsgGUID: 6CKHNYfeQXq9JQsA5J7xlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22428416"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="22428416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 00:23:41 -0800
X-CSE-ConnectionGUID: hCFw0o3pRIqW5og1SjzWoA==
X-CSE-MsgGUID: 3xP7l8WITreUqnY69HN4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101610423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 00:23:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 00:23:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 00:23:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 00:23:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNg5LTf0b7VcS6/2bLELt6jJqSZZiABjAnDag0d2jChrI/KSckQrikIMVl1kRT5IuajZEi+U/y+3x95aHhlPLsShuLQymzJm4TLriXk4O1p6FW/81IQkBAY59WRxWlxdEmXdsMzqSwN/KwZF3dtYMseVp2hdOdqNNHzdBQFf+9tsq0vYyvnIu+M/BK9eM90qa5EEfAS2ckOHGiOWZN/QTxBYqAMxpxyQU92h7zYG/gWS7K+mmJeCbYf1vkeurtciokDNWD8J8iih3aNHcqSFi96R21eYCJxIbloP/bbacY9Ri4Hy2dl3lC6xpJtw2wnOt6h8NvUNge0NoDUv9OoCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu9uE2z7UxvVcQ5CfRkrls32rQ83s+qKs2dCdFJtgiM=;
 b=eul9naKdMrhPI4wV16ppq1ID8fOc++Sic/YM3cyU4ndLwfiVBCRWqdy2lltEK+e9jF72FZnAfy6UemZrTsHqapHydbvWNW+jZJCYrgOIal7yoq+UIJpMh0V0OWKRREK3v36aajnQLa7z418wFZhQ8vUYoiJV1IpndPzEAOSExsJc4nQ+gLmVnoa2vkowhMCp3wZQxAwF/r+/EiUwDovalTVqH3lCHIAncAPgzA9kCBCK5kxK0pmLk8pU3i3Nx3qBtKm1m2vCE845FQCcl0aLwSZfQoKFHNXkpniRA5YCHZnuOUuXujCUH69QaKaMAXQnPwrMIiBIM6K3EFvXPiRCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA1PR11MB6894.namprd11.prod.outlook.com (2603:10b6:806:2b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 08:23:23 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:23:23 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH v11 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Thread-Topic: [PATCH v11 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Thread-Index: AQHbUE2mUbj4gl0j0ESMe6UrO0T9+rLqGQsQ
Date: Tue, 17 Dec 2024 08:23:23 +0000
Message-ID: <DS0PR11MB726427201A8C7E25BCB7DC86D9042@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241217063029.663697-1-pravalika.gurram@intel.com>
 <20241217063029.663697-3-pravalika.gurram@intel.com>
In-Reply-To: <20241217063029.663697-3-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA1PR11MB6894:EE_
x-ms-office365-filtering-correlation-id: 08541343-6370-49b6-e1ba-08dd1e741296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?VZPPc0r8j/qoUm3x09/oIgVdyPVBc/4pISUxwuwMN6C4gctVBwvmUhq44N?=
 =?iso-8859-2?Q?Gk5G9kpybTfGveQ5u841PbI17TtZa09rILW2oOR8UnsRdtzQvU+YXR+uoR?=
 =?iso-8859-2?Q?jEvlrq+Rcf6J3NQyPION7Lj5u3InHSUC9KxYXEAw1LznvuFOxtxsWo+D4d?=
 =?iso-8859-2?Q?mI2PG6F0obDLqSmS/819vyzIR+s9RHHoGvbIxN/F9O+/LqIuGKeO0uDPgO?=
 =?iso-8859-2?Q?lJag1H60cGK6uonpPFtgiGJyejELT5KDldioGv1IFcQWN/lyV7QWYwkoCr?=
 =?iso-8859-2?Q?4tKbpbmqu10SonBCJxvNeM0XqPqMaDBROo1Omk84wcQx36cuThIuXM/yCj?=
 =?iso-8859-2?Q?YtmClpbtec7Wgq+l4iO+c2OflwAdD7j1BMwzfUEiXanxGWy8xQGiChhQrf?=
 =?iso-8859-2?Q?msKkh2WHAozDnleudin6HFtG26pkFuU3zKbq9r9/GKZ6uf10OA7UPohUAa?=
 =?iso-8859-2?Q?GiS3j0xcbQeu+HhWrABskx9o1YRipD077OXE+AEYrBHXBuciWSoevvf5uo?=
 =?iso-8859-2?Q?kIEKlfKfHP3BegVW77+oxEnD0rJhMsxWHoni8m7Wc38bbMOr3VTmRgg11z?=
 =?iso-8859-2?Q?4gfP5dQyLFet8/rqodD2twFAr3U9Ff9yMMdyl3+1evK86J7bL+icM8KdXQ?=
 =?iso-8859-2?Q?qtL++igzkqeQ/FwjXLqeQY9syKfRpS8fk0LXnQ20cffj0yWTHIA1JisqDZ?=
 =?iso-8859-2?Q?pc/0XgxsLJvvGkwpyjXz5OndeTYM0tha1rpmlXKsWylFBlEv7dG7fi8UCf?=
 =?iso-8859-2?Q?9y59svZq4n2gBiKto9dS5Rj1O1Y35Wp35tTtUnk4SFBabDFwqg/fbgZzDl?=
 =?iso-8859-2?Q?A9lylISY+7nWAUif3xqUdc23V6LieAUCGKpXJUKFVhjEEqpUaSF2JD5SsE?=
 =?iso-8859-2?Q?ZwKkYWQmCiNXxwGivyH3OutT2mKGMkbCk0l8UCpQs5UgR0/QYPP3/vrgJp?=
 =?iso-8859-2?Q?wZ7myw5TKPpmG91BEvJDvdqa9ykBHLSJ2ygL8/G41jCs6l82xNikk0a52F?=
 =?iso-8859-2?Q?8jqE1OLZjy5LsSrr6mdjxNX7/CYM65YmwMdPfUmz1GQdgjCpbijcNEPSav?=
 =?iso-8859-2?Q?orM4x3Rq4idhABPwAOs/J2oUNX//NEuD7sLmTPmz1PEmFexYciYHTRp494?=
 =?iso-8859-2?Q?Dv7ufL3oU1bOfQCC2yK8kcXbAx8/FU09hXsU3HkX8lvWbpTJ3pKLp6xSnh?=
 =?iso-8859-2?Q?OJsFO7Qpl0QmkJITmC4jqdPcz29kREmRs4Jg84h4gA2FpDh6MsOtOuuGbw?=
 =?iso-8859-2?Q?RKgdV3kBewNxYnRQtwL5Bu99KK9kEzfQKOyGBpXXpEymLwZ8qh5SlbC9zv?=
 =?iso-8859-2?Q?jJb1skmpCMaWgajwwNtbfE6BuS1ep6uZnxG5QNGoxU4B2UnQZTOu5oZU+Q?=
 =?iso-8859-2?Q?uzZjxH1lDLg1OKslXag94lFBMIWmuOsdjpRjxyBIOu4QLV3LyOvz0ZRGZY?=
 =?iso-8859-2?Q?Mfs5jGBWIxCnEVpMxRsfAGaXRmNOed8zf3uerf/rC5zVlJtO7gJfBhbDZE?=
 =?iso-8859-2?Q?dlfAuMTUmW1cGi9/87mj+P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?Q8Y2sr29h8Yi11n6DFr7zf1J4HB4hDnBEn32MLkue8eABnbIc/gk3xoscG?=
 =?iso-8859-2?Q?w837+/CaaBaBrnbOp+4tknxQj2cmKU41/F7ttsDA2NoQwkZAPRpu+qIgqv?=
 =?iso-8859-2?Q?HlA3N6D/ya7ztiG+6Ul0gFrz7iCMYrr+l4F1rOVuCVb7SToMvJ1TNyFp1g?=
 =?iso-8859-2?Q?YXoQsOyJR52jZ7N66DaLQtp3WGstZLLl0gQJBpG7WFl+QjbYHgdrutgMat?=
 =?iso-8859-2?Q?3E1nXO1GMNxHNoDg76pdWAzVw/lyaJPfWrDeEtU0QoVNp8EiJyTtxs7aYY?=
 =?iso-8859-2?Q?UJ/yHjkp96lZ6KruhqBPWzDHpm9UftYzD1YGgoGjLJ3JqmPAxJlqQdIEHy?=
 =?iso-8859-2?Q?phtJmyG7GsyVvh6I0y7r4ufL+EdEmyU5aDX+jpAa28dloZZuitMvQqE+Em?=
 =?iso-8859-2?Q?jh+GgPmutulUlfujctbwtZZAtWHQbx+DDIHGdMMLqYFoMGUBYVwKGMEQiy?=
 =?iso-8859-2?Q?aSuOql7vp479FJmnFfHt+p824JtzCYZIZVIHtZTDsyw4f1qtBS11XgMMg+?=
 =?iso-8859-2?Q?cluyDcLIeYikOTD54cIBY/FMbOW+g/+e9LgEkv0Yl7FrHENCyX6Hpznum2?=
 =?iso-8859-2?Q?IXPYI6ssgp7lDZ3u17XeLEi3O6rLErE28GJbzi2UQrja7nuy3mMPKj9OxF?=
 =?iso-8859-2?Q?Oat04VU3bniOl0Dg0MY/yeAO5BidVf4+xcQYIzfHKZ1rGq3K7QE4s3HxgP?=
 =?iso-8859-2?Q?JDYsysejxTQXWk4HKE9pftcUk0NYD1FqyJXJ9YdIgakBnjLqLDtYMIECaU?=
 =?iso-8859-2?Q?j0YlNQXxXASiBeYTBYYFdpG//Z6AOlmBdKvRyAzI9U2ErGPcPqhhF9OWWa?=
 =?iso-8859-2?Q?FfBl7oQ85D6BdnKs9mVa/UwqUsGSmWS9ozk6ne3OKnYSULNjXTt92Kd1vr?=
 =?iso-8859-2?Q?a7EEEUgGTFUkyxB4y/6GunUk8GnT4t5jMaqL6rMqERVW2lh56pNhI5EUSS?=
 =?iso-8859-2?Q?uyQtxmB7CzS7XOL2lAzCN85887FwP4DS0yFqsH4+XXPN92x5JipKJo72p4?=
 =?iso-8859-2?Q?pk2cVQM7PmfCYDRpBwYuoPK/cUUcxCvC4u78C7XPLxKKeLGD6vd1+hsIUr?=
 =?iso-8859-2?Q?LWZZ/t7u76ddGPlRYYMg2ZwNmATLaNnmWvhwjTu3ogAClt84Cs9oHJ+nyl?=
 =?iso-8859-2?Q?BfVBZdaVNNcZzDN2nh4Q9qFipDFwsrrdg0ufn8uNpK8H0pbGD9TW+2fXIH?=
 =?iso-8859-2?Q?kFvfAQ14gkVA+QIfW0KUd4j56aEnBQWm/B57t8JBDndRhJMjw5uD46UWwG?=
 =?iso-8859-2?Q?RlK59AAHErehiu9EYORYaU1RqCP7rX7JqY0bmqmdongVl9FAg7gt4yaBCu?=
 =?iso-8859-2?Q?dWpXRMX0tbtszlzj9eebumIj8t41jN2xDgTHWxEzSYnxMtO+ct08A6+bHu?=
 =?iso-8859-2?Q?zVORTuH3yHgp8k+cc+0rV3K1h9hGhfT7ryT+kDA8HbdOKXyIrAltiMVZyz?=
 =?iso-8859-2?Q?23cc21ClsUsgI2FC/ymWK5YDu4O02VsuIDPjbfWQ74SIiA7VfJOUQ4iJZz?=
 =?iso-8859-2?Q?PAUrxWc+YEjjJSkwEI7M3cjrF2UwvfZ3HfWRWulaxkjkowLDPzr8qy541W?=
 =?iso-8859-2?Q?11ezTlKMPTsnu38YEa4k1ZfzBtT7oqdwR5Jw0fuGX2iBy5AteucXE9QZaO?=
 =?iso-8859-2?Q?9wBLew2+ZxBE+2FbbrP2roOFA40mwYoZwxuV2nAEzqoCXKqEz6UUa3SQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08541343-6370-49b6-e1ba-08dd1e741296
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:23:23.3233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KESr7QvzXojWK9OwASaaXAvGOOfrQy+gpX6VrW94l+1++mqn/YYjpZ3IwRHTUuS7R/0eKA3LBo7oILAhVIQ9SMoXo+/20hPEWyCx0s+5meQmXsqan4rZpC5vjmpN4yS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6894
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Praval=
ika
> Gurram
> Sent: Tuesday, December 17, 2024 7:30 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Gurram,
> Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH v11 2/2] tests/xe_spin_batch: Add spin-timestamp-check
>=20
> check the ctx_timestamp register post gt reset for each engine.
>=20
> Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 118
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
>=20
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c in=
dex
> 9314e229e..0ad2490a0 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -309,6 +309,119 @@ static void xe_spin_fixed_duration(int fd, int gt, =
int
> class, int flags)
>  	put_ahnd(ahnd);
>  }
>=20
> +#define HANG 1
> +static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
> +		       bool flags)
> +{
> +	uint64_t ahnd, bb_size, bb_addr;
> +	uint32_t vm, exec_queue, bb;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync syncobj =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&syncobj),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +	} *data;
> +	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
> +	int64_t timeout =3D NSEC_PER_SEC;
> +	int i, ret;
> +
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	bb_size =3D xe_bb_size(fd, sizeof(*data));
> +	bb =3D xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
> 0);
> +	bb_addr =3D intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
> +
> ALLOC_STRATEGY_LOW_TO_HIGH);
> +	data =3D xe_bo_map(fd, bb, bb_size);
> +	syncobj.addr =3D to_user_pointer(&data->vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bb, 0, bb_addr, bb_size, &syncobj, 1);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0,
> NSEC_PER_SEC);
> +
> +	batch_offset =3D (char *)&data->batch - (char *)data;
> +	batch_addr =3D bb_addr + batch_offset;
> +	sdi_offset =3D (char *)&data->data - (char *)data;
> +	sdi_addr =3D bb_addr + sdi_offset;
> +
> +	i =3D 0;
> +
> +	data->batch[i++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[i++] =3D sdi_addr;
> +	data->batch[i++] =3D sdi_addr >> 32;
> +	data->batch[i++] =3D 0;
> +	if (!(flags & HANG))
> +		data->batch[i++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(i <=3D ARRAY_SIZE(data->batch));
> +
> +	syncobj.addr =3D bb_addr + (char *)&data->exec_sync - (char *)data;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D batch_addr;
> +	xe_exec(fd, &exec);
> +	ret =3D __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE, 0,
> &timeout);
> +	igt_assert(flags ? ret < 0 : ret =3D=3D 0);
> +
> +	munmap(data, bb_size);
> +	gem_close(fd, bb);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +
> +	put_ahnd(ahnd);
> +}
> +
> +static void run_spinner(int fd, struct drm_xe_engine_class_instance
> +*eci) {
> +	struct xe_cork *ctx =3D NULL;
> +	uint32_t vm;
> +	uint32_t ts_1, ts_2;
> +	uint64_t ahnd;
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	ctx =3D xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd =3D ahnd);
> +	xe_cork_sync_start(fd, ctx);
> +
> +	/* Collect and check timestamps before stopping the spinner */
> +	usleep(50000);
> +	ts_1 =3D READ_ONCE(ctx->spin->timestamp);
> +	usleep(50000);
> +	ts_2 =3D READ_ONCE(ctx->spin->timestamp);
> +	igt_assert_neq_u32(ts_1, ts_2);
> +
> +	xe_cork_sync_end(fd, ctx);
> +	xe_cork_destroy(fd, ctx);
> +
> +	xe_vm_destroy(fd, vm);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * SUBTEST: spin-timestamp-check
> + * Description: Initiate gt reset then check the timestamp register for =
each
> engine.
> + * Test category: functionality test
> + */
> +static void xe_spin_timestamp_check(int fd, struct
> +drm_xe_engine_class_instance *eci) {
> +	exec_store(fd, eci, 0); /* sanity check */
> +
> +	exec_store(fd, eci, HANG); /* hang the engine */
> +
> +	run_spinner(fd, eci);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -343,6 +456,11 @@
> igt_main
>  			xe_for_each_engine_class(class)
>  				xe_spin_fixed_duration(fd, gt, class,
> SPIN_FIX_DURATION_PREEMPT);
>=20
> +	igt_subtest_with_dynamic("spin-timestamp-check")
> +		xe_for_each_engine(fd, hwe)
> +			igt_dynamic_f("engine-%s",
> xe_engine_class_string(hwe->engine_class))
> +				xe_spin_timestamp_check(fd, hwe);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

