Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21814C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 09:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9D410E35C;
	Mon, 21 Apr 2025 09:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aStXhL7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678B110E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745228632; x=1776764632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=djUWNVGTfGc0A3RVaEc3NU8MS+1dshk5GQzE3YaFUMY=;
 b=aStXhL7jH9np1JS98bS0s1HWMfUyBS4qiSL6UTXN9GHmsk2Vs0Gc/yyU
 EFy8QkihYSdHoUFnFw9QGDd47KBtcxcNvSFHO7xlGpMwaFEp2lhVwpyYp
 73kcBqbMyO/2js1cQwq6R/Rs71Gd6RJNmrYIsfCRh8mCYRrZzBjR2IcDn
 MB1unU8WFOWAaotUrB662k4SbKnhfA/Ck6BhkQdQHu/HXozIMy7ZC+OGY
 IZGlPj8nS5VsxsWKP8uU8NP5baodQ9hmrznKG8n5jsa4Hn1gBygeJ2Zgq
 62MMRAirh/Ju+0x8Y8ZbmlhPODqjQUrzc5ngvhVl5WTDtjnlFQw1sQJB9 Q==;
X-CSE-ConnectionGUID: hmeX5cj1SkSNr7XzqUdoyQ==
X-CSE-MsgGUID: lSN38rBnS3exBgJk4pmrBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="49421214"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="49421214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:43:51 -0700
X-CSE-ConnectionGUID: //R0AotRQ0aiTbal8BP4iw==
X-CSE-MsgGUID: rxyXXdA5SnK7Y8lEL6qQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136537633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:43:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:43:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 02:43:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 02:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By3txP+RUTjjqTUVwDdnkFNXBpwubBXjI/XQzL8HtXdvN8lhbREpzyBJWmL1SfIr/D0m2gddQEqT0hNzZXlV3X2kAm7LUVZ8TmzAaTe80PaRAhgE4jSge9B5WFiX9DThaGDijxATKp8FU/b1BeqaPr+PkMQm6CR3spMmCxfHLOO1Wve1DxwKgQh126ug4rzjER1lLUveSymr90kkjevHTc22nj/4pUH6t49uOegqeFfNPDoRAZdqzAQlIOY1/1axa91zgTkpqd47G9qOjbuPuGKG1QGZdM+9kkvYSFVdcMlcBPYq0gwUG8gPJADRqhsbHchXGXcOQ8vGAbQRdIJVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQoOyoK2P3083uPBoF5zRBhPHPfcgPkDK8rBGEAPEo4=;
 b=EakJctAWZKd3ASDtMKqcRTxFTBixMQw24j15KUpokW8slLaYHMRw9WwSoAXuN7LixA3eGL92kmOHTI7xn1wsHsdJsMLfHeodXFDAyUpsGp9E8XIi5WMWsuYgp34/t8XokbKicGsapLDiCvGn3/76llrzwKSuUCXTKAh+KI6fQqIFi1eblAwmpU6Av0U4+iWaBaFVBMUPwqAh92EjD7kiaIksK008txjJ85PYPYGqC+ohBPu6fGPWDWCS5523JQNaK5BDKYg6oY6npqsE78LHwIaJDkuGTZVSb8wNuwuvFVZnG+IS6BBLtd4PGootMYipEiIwsUMxavL68gNLhSaZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:27:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 09:27:57 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Thread-Topic: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Thread-Index: AQHbruHNSY+pEsb9A0eMYfPrHXaY6rOt4VjQ
Date: Mon, 21 Apr 2025 09:27:57 +0000
Message-ID: <SJ1PR11MB6129F2DC9DD92CB331437A98B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
 <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA2PR11MB4827:EE_
x-ms-office365-filtering-correlation-id: 1cf747da-31a5-4eca-8e59-08dd80b6cd7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QmsHkseXpJ4s6sfkAm7TTV2RXty9pZnCBzhDALgh+DF2NT7P0Y/U/SUSGoCo?=
 =?us-ascii?Q?JqbcIsQh4DvWc0FiL5sCoXZqyiea4zYxnxb7Nlq8WaRv8GnhZdvTKxiRQ4BN?=
 =?us-ascii?Q?7jJOzOpXNfAKNZl8ORgGgn12MhtO7ts6YKom1USTb3k5AyyJ2up9Psw8kFU5?=
 =?us-ascii?Q?4vSHcVYLvwBAwmTDU/J/49wtuYDomET1B2zjmN7jJkrsWtKaS+PBxUXhGxMB?=
 =?us-ascii?Q?tCUagcYpl8RwYc1+0cK1GIoQxtmXLY3YWv4NMgpDhaOMB2Ew0ldGLBN4vU3J?=
 =?us-ascii?Q?Hq5Ra8ysfMbosfAb3BfO4n/gZocYUsA6vi8QwYzW/DUY7v0/XSAreTziC23j?=
 =?us-ascii?Q?QjS5YbRk5f6dtPMwobjjCXAmvSEl9TCKnAwmRlB2tjEgeLBX4F0Axru7JvBg?=
 =?us-ascii?Q?SfLn0RNJVANZVWtmfDx05X/d/84sf+biTLtL1Uk6hICeCVMi2wY5US/E3nam?=
 =?us-ascii?Q?mMHj5fpY1qMRVI5CsVdHLCLAjNzgnr2rJF0AxqWN2GrSricc17DO0PY+tGc7?=
 =?us-ascii?Q?Jt2JRfaP21cTPjT4cC1ABvK4RF2KMF3wilBJ+FpxvwoAQ/V45zEXWmim5pRR?=
 =?us-ascii?Q?42Qx+2VdRpWXagix5zmzZSTd+w5q3IACsCWg5v9njkGqeWZ/kDtRprdG7y9R?=
 =?us-ascii?Q?AgCFe3jm8JKSVJmt/RtpTxHmg2cy/q7NHvVSymnOSorvQbqUGxkj9mUmDNZF?=
 =?us-ascii?Q?t1/S9MRPSLaKzonJ2R1kusCm2P9AyDPHIGHBOAXft8bADUkpQ4gJgh218qsy?=
 =?us-ascii?Q?qVWcQs737X49mYbK8H3pHRV2Zm5aXX365QpUVSI/2Vkqg4A4J1UigkHE0noD?=
 =?us-ascii?Q?cnVxtMDc5AaljUljKYtaV8QKAa1C38h/R3WioGKoy660hINiFXvP9ZuTDuBW?=
 =?us-ascii?Q?V5PdXQV9pLb/KKTZB5QU8QxnwCFhzMU4rX0DCy08wFteTv06/XD8FYKBAN9u?=
 =?us-ascii?Q?wi4Otx9UVCu8uvSfxhBk9RRpaK3sD/1K+aGhHUB5FZdnW69MUuSIcC0pqtEC?=
 =?us-ascii?Q?/5uMD+hoRyLCK8AaVfLNMlnj6ND4uKoNM3LPFFM2Wqqm8hmmaqtgr8pyS0SB?=
 =?us-ascii?Q?km03tSxJV1ou2Ubd3SWu7Dh5XFHE5hz6VGVVJqaPmzHaNkEo51m0vKElpKXN?=
 =?us-ascii?Q?/XD1XkZizk6BYtjVMHUh7Rn26lJ4lTdryO91VwMjghfum3HE7nuvhNr3nuix?=
 =?us-ascii?Q?nZeGC7iG5wry3Rm18pjw2fUP49sbDbH0dchIpeJErufCKXz/gi3AMmjqZKex?=
 =?us-ascii?Q?gdalpfdplbV6jjT+1HQDjUDMiZmrXjdGm5UB19dNz8E1b9p+TIkNvrWG1Aaf?=
 =?us-ascii?Q?pxVzGGtlVuCqpSwnoGfVq+Bev73GP1fTNfzLeXV09As0AZhheJD1ON1zJYbl?=
 =?us-ascii?Q?LXTI/Wr5W/rg2t1r1ilgh6R2D2pWNb505+j6FK+0WpXp3jcKCWUCCZdShsTF?=
 =?us-ascii?Q?qkiFlLbamkN8GMCweRB5b5rePDa4SuC+ROaSJ3U4ZPcCEQXra0Mm9fiHQ1DG?=
 =?us-ascii?Q?JUvgmkdzFv6iOv0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RE9nldt9RnXqbr+U2/5C8+iYynkFgLXAlXmrZuBZd9o8dkxtPOWJ9utmumfs?=
 =?us-ascii?Q?qRRNJb5oRZVe4smjTUdxw6AXpj/J+HA4h4H0JvFOLkQRDIkTjIqLKVJXPHbe?=
 =?us-ascii?Q?qb9/SBUvkYjOok/11YwULE8Znlv9rKBFRNtuaFx9a5UV0mQq+VJlWW+nmw/j?=
 =?us-ascii?Q?vuW1JdTYcjpibMoxmO1Z63vE+R7ioHlJ/OFJHE563bzPs6IeB8pacFX72XkE?=
 =?us-ascii?Q?mV+geLHftDQb4czoO3+a9CKT8tkANGanuPZfnT9n9pnh70SXEmGeXUKfM6/o?=
 =?us-ascii?Q?Khttx+1QmeLn9L6UUuMSmgZnLFoQYhL3f3KpDX1SE53qVMaIXA5DyOSfLbOB?=
 =?us-ascii?Q?uopSsXqZg5RjG7cSbQVN69SjyoPsq2KYETJ2XUiHznQ5dFE9/QBEFcChSipc?=
 =?us-ascii?Q?e4E4AfdGCmBhenNxMSWzJI23xDyt82c7kXnav7vfo+n2vrqFGYzpHR9IYtpT?=
 =?us-ascii?Q?xX6OgNGOB2xE7lT3IhADMYhxCgbl34ErcVdu5wb8dMb/9PZdUOSukgyCZZw3?=
 =?us-ascii?Q?66wvWe4Zf2i33NAdavDazMHhk0QI1HibezHTRplAQ7tRTor885E//xPkyMPx?=
 =?us-ascii?Q?gjmSnvTdM3WBdqylHev/9hkLsj7j807fJlKRn03kZe5M2+7L4S7UuiVM29Wn?=
 =?us-ascii?Q?F7Gf8tvKEKAkFeqE/daLjlazDpUGsyCYn8YkuhqrhqJ9jJ4W/1J7Dkm7Fcoq?=
 =?us-ascii?Q?5MGjAZRtbh+prBSHE25QN5vAtF70ZHOWbDkblzYYugCp1rYbBxDaw7QDcVj8?=
 =?us-ascii?Q?RC5kZXdrpbX1qb9afifNGt7TxjPtMaJpZbOP9qVeTOnx+LdE243iSo6xvVfY?=
 =?us-ascii?Q?Y2ySbuzuaN/oBsryl63qawpD1qfhgdTZrhxzVFNkUvhsVJsnW+v0XEZ5mvXp?=
 =?us-ascii?Q?8PPJtrDiYlL8k36lkUP4OTO8TZD/fz06WUqPhZo5gbsMQTJIygqohx56qqzB?=
 =?us-ascii?Q?EjGaPNwt+KbxKRCqiR6SL3CcxvjBr0LjEla02aC6c4pRMkNne91PIA1XEs37?=
 =?us-ascii?Q?uMR1T1dV5GolyS3bbQCYNDxl6/PmDNDUT37ocI8Ya1BBPAxoJ6gfvN1GFIIe?=
 =?us-ascii?Q?axrxeCeSUzo+D4X6QNny/YhYCmueNjddpb1idV4xjOY2vIEDv80oQN56zy5T?=
 =?us-ascii?Q?dpBuFI4rIT5kLT5fwmpYvqGTpBR6hevy5o22LAKlxPMbM7h5udBxIUTdfkI8?=
 =?us-ascii?Q?T3ODB1xNs3esYhyQsVQLr73n65lxM+ymx8kxWs3dI31a4J1s+FrKlQ640NH9?=
 =?us-ascii?Q?O08mD+TmFwv921cq7Qxoik11Milor847akD9BdKXbO/8SR7lmNM/KqzQmwv1?=
 =?us-ascii?Q?gacsbxvwTjt82DsaCa6quPxMOBJm/OQPCL6JehvTBwa305aEJ+11vTvxFfMO?=
 =?us-ascii?Q?josbnvwZ6ZsxCLr3k38PdI9+K6CI7+v9e7Dq6PeZuM4Is1dJja88LLlwOuCk?=
 =?us-ascii?Q?L0FWIFNPQZ5VmXJLpJOxsfsJOjQgQSyYgo3/1d9O3b1od7RtDuePqvtnNy6y?=
 =?us-ascii?Q?F0mA6kZkd2fDLUKyYp5fq/RjMACVi5vwZ+XCs/SR4r6vevMpjn/CWt26J1MH?=
 =?us-ascii?Q?F+Trc9qHGJ8ZdAUJPNan4EfFIpu79M8cQHatYutu9iVktLzL0O+oE4C2xurO?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf747da-31a5-4eca-8e59-08dd80b6cd7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 09:27:57.6124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEeFDI+clFRt1NCNbYrsja4eWVRC3CAoDM7EBwBbgdyz0Im7SLrTJnaoRieF92o2rnCrLLgV/4AoUNSKwAxN+9bEDmSapkqwUZ/9AztUJKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Wednesday, April 16, 2025 8:34 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
>=20
> As async with linear modifiers is not a practical and common use case,
> override the default modifier with tiled for all the async flip subtests
>=20
> V2:
> move handling to default_modifier (Karthik)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> a3defe604..51afae8e9 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -194,6 +194,9 @@ static void wait_flip_event(data_t *data)  static
> uint64_t default_modifier(data_t *data)  {
>  	if (igt_display_has_format_mod(&data->display,
> DRM_FORMAT_XRGB8888,
> +				       I915_FORMAT_MOD_4_TILED))

This is still checking for sync format modifier pair. We perhaps need to ch=
ange this.

Regards

Chaitanya

> +		return I915_FORMAT_MOD_4_TILED;
> +	else if (igt_display_has_format_mod(&data->display,
> +DRM_FORMAT_XRGB8888,
>  				       I915_FORMAT_MOD_X_TILED))
>  		return I915_FORMAT_MOD_X_TILED;
>  	else
> --
> 2.34.1

