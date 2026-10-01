Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7FFCA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 06:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0767110E288;
	Thu,  1 Oct 2026 06:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmrhr5Vx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B72610E051
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790837416; x=1822373416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojoIOzUfdOreBWi3wCPg3jQwjst2FOv3PJYrH2vmmio=;
 b=dmrhr5VxPqKFfWnZw0FRSDj6djhoW7KKRZtdou/WkdHmpyJg70uS1Pp8
 PX5JbmQ/A9XJs/yLwV4nW8ECy+eZhs6iKAYgzkstrNGrMAcREi9zE4wb9
 VZkzRy340xigOA7VoX0WQrQPm3/OoeHWQdXQdC3ZzFozTGlNaNLHEVJ1w
 kX4oSx5MbbSFP2qCo3m+bQ6ha5VfW0lqMvvbAVIBZRoYTEZ5PucASuHBm
 kl7zBSTb4AXCY/DobTnBhH5jGtTK7I5bRgPDyMLyWXrcFS45roW8qO7uP
 W58M8MGiNaXknmAO+79dqoqOX/v0BNMgYOXwdTAN4Ryti+2GWbX/Y/fCs w==;
X-CSE-ConnectionGUID: nhzrWanBSiGee+dgKqYfmA==
X-CSE-MsgGUID: G441zeJVTR2uHD/4sQVBpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90354117"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90354117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 23:50:15 -0700
X-CSE-ConnectionGUID: 3TPTj3tlTDCpiiCEeySzGw==
X-CSE-MsgGUID: c4Ti3YqKSRmA3iW6awHnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275027680"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 23:50:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:50:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 23:50:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+llKgO2c6Jf/r3P2OSB6olWmWdj0ODudlRYOuI5G8GIh9f84Thb88Fo97iYeeWYxZZhnl2PwqrfFSkpauD3OVQiW4v+UZrDn6m0Z+x1ysFnVkVlp1OtSjg1xvAW/2AnO4of/2/nkwQpRmuDKUQlgQu+g/cFEZPKHwgNWLSNKvR0bR3LzHDsIRg+PHs9wTjLLaA8hfIBbb6Rk07IvbOll23ZBMITc0eqrcSC7uYSwb2p4EMASKuSzZWn9JcPB23hTXNGRRocNA3HyqEJ1Xaqmvx/tUp7ueHA7Us5diItY6mCMLOQqzxSArIhgiput4czB9YqwBuxylaLXSGTZ+UbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3nSgyAE6T1jjevHfgv3ieJmrrk4UBx3moe+myV/1kc=;
 b=PhU7XHbD+YkDXzuYwql/VMw66weFqN0xuxxknCntqzUw4s7s/Kc5eLq//wQDmc7AiqfV0Oak+N1H4tevWMmxexnaI6eaqUvsdpR6EN8rcXcOsq25RuehdDf0wxfBc0onUGEzg/JoKQ/mDgCWJcS8MyJ5GYEI6Y5en6y+HA4V3xtQXG6zFQsflSZf1ZM350iDHDay7m3PS+DyUMai0uQtVtOnPS75y6L6aMJkpDfl0mnB4BTtm8NMlGLO5hdFOlczihwm3alJTX48+TOBVOahg5uUzEcopsBxsv5thn6xeMJWubiSADbZtp0vtVSnQaoTWdIGxruIXdmR1zfiy0Iz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 06:50:06 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 06:50:06 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
Thread-Topic: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
Thread-Index: AQHdSoIzlEmtFkpAfEaF63j0hTW3ErboTAMg
Date: Thu, 1 Oct 2026 06:50:05 +0000
Message-ID: <CH3PR11MB8434BAF67C445F8398131BB28D8A2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-3-sobin.thomas@intel.com>
In-Reply-To: <20260922110438.2402109-3-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB4989:EE_
x-ms-office365-filtering-correlation-id: 4c906195-2b49-4ef6-936d-08df1f883a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: c7vcjlE9QwnMnpZM8zpLJBQKcy06SgEfXi+tIGsVY/9oAdpwiD5E22eJLlbUyMVlYVg8p4DHxZqwVx4vwt/l6DMwlsLCkHjZB9TTzXbrxBCHsULEMCMXqTFA43fbeGZxQEBxpLk7KGrNkRyQkudU3/d7lli8gKAYAcv/EtLfzUvCzNpv+tR+t543UoGbVyuGWfwJWSvpt1xZ4SkPRFmxGVVkvAcEedmFIUe8qOjgpZ5ZW7ewif3G7eQ2Pm/edQUeKQWfUY43Li/ANLDM4hDaO5IaoEG3SSkPhIrOw2gH0lOm/qrI/oVqoVSnD1mN6PkkKYkC4kHD2Faa5HXfDJ9/mtb6B3jFaV585PwcFghilVlTAMrxgB3Q+kelV5sx6k435vOPEfx0T8k+lzaN3hlyoKfgdWutliZHH+Ix6qOgZ/iSQBI/FH5BLl138XtuZYTvrLoSKOdz84YW4fBXfpT1WTOvjSQ5NJLKjeMiBvhk+vIKl3Lp4z0Wp1thmigXTZLIc11VzzrPm0s00bXF5Gx6LxSeqIHIqGixHPc0J7FTIDeod8/xJgS4uDaanbiOZEmmE2jsdaTI1mX0VzmDp3DyC4nMmIRnmoNM2gPOxnu92pQ8qRtHRJaWJihziHO4w0zcStPP1qvFN4LiYUL5iLHvG64Ji6JcB3qNn+dr/rJ6x/vigOboonW8eL66yY3eV9bKrDFVzor2OGwkhPaJybWOSkblF+Sb1jOw2d45Nwn7aq0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LuvKzlry8P92iHvPwALLpRxCf2jaKkGlknB8rMObHl4egflliod8NaKEjZ0B?=
 =?us-ascii?Q?OnsQNRzvQG3lyMx0C8UazS0WPlEa3VzBDb+CRizteF/jnEkZiYzImHA8BTz2?=
 =?us-ascii?Q?YdPwlT27dbZjTzN4VkmEbWxrQ/9wbw2Y9Rd5UPqqoc0RAO1E6z1X0Jgf5myc?=
 =?us-ascii?Q?kl+vz+oV3zVmOTZvRUnD+XPb887BwQoJYq7m8mXRtaMDyWsKstD1JWUj3hAv?=
 =?us-ascii?Q?6UO3Dzeb7XQ9YvhdVf82RQ/9N/2RKfzYuuLpbSlY1IZrIvMJRKMYsqDVcCbn?=
 =?us-ascii?Q?2zdryauERwESa0xDGy6lidD1Qt29xyU1KVbpZ93rfCp2YJUymD4KcPlIs8LV?=
 =?us-ascii?Q?FBmrncpMSkAoE2g9O4J+XEPQB5TVqOtXYH4+LV/wg5vmaiVZk/Eo9BA67gsX?=
 =?us-ascii?Q?0ID07SgrjzbQ74flsBc3amwN66KOPce/EwqnZh7uFCq4YBhPYFpuyp/Wnnoc?=
 =?us-ascii?Q?BWHxw1lehGcDuGYHCHTpQ6bEfCNjq1kS//dtOhSROBU1iZobehoZoMO4r4zi?=
 =?us-ascii?Q?VqPAOCkcazWkC93d7SStaEsZN2ugNPibMWqbHbBgO/kmCykKdbl1Iv0gZN/y?=
 =?us-ascii?Q?ryaqvCcAtrtJS7JzkUMITEFk0HjP41yNlGUPw+oitIoc3VWmHlPFs8dZku06?=
 =?us-ascii?Q?mKWO1uwcVMQw/EHgQQiGhh8NyhZEoIl1jj30H6oJIfHgjjV34/QByNbCCWTb?=
 =?us-ascii?Q?hIfcyhvoYVxkWSAmnG4KaaNI1uHh20+da6Q6mNHGzt7z03nrqzmeG+5EpAAc?=
 =?us-ascii?Q?paNo6mOd+ohF1WtBhF47MS9B6yb+wdZynzaaTjiyHozysRRnaFTFAa0eUAML?=
 =?us-ascii?Q?itc1QTKSNL08+JbnDCezWqzx7ujICQ1yI07s2eUuPQpkAmmu6zsrec8cDaNr?=
 =?us-ascii?Q?uPxvpVDwkQI+19aWuvX4NTGx9GOH9DevoDPvBFZv1rViIXbggbGXzpXNHTxs?=
 =?us-ascii?Q?hAdL08WL11CQY4fM+MGXw1wlWzFAgbps6PJ+EX+US85v1qxnT/Ci5znpRX0A?=
 =?us-ascii?Q?mRtDPp+OC+hcIdH/jK57Ua/rn5WfY/+uGIroUNcb0+UIQa7NwzDMxOR5k/kh?=
 =?us-ascii?Q?geerilD0ldQJBw0YWeRZYmJrzKiYLSwQBE9HK96QXOb1twXM08bkQZAIuDlw?=
 =?us-ascii?Q?hXZaLMBe4EHgPu4vRhGBllMaWcMR/DAypJXS9J9oLMXOdAFZAe0wOJR0ufDi?=
 =?us-ascii?Q?adcLUsPZbvViJPbUFxi+m9dms7XklBWwqmFZ0p1WOPo5RsXgDtRRCVnbeLOt?=
 =?us-ascii?Q?QIr/YHHzQ4Xa9Bwuquoss5nKBJ4a5VIaToMnU8sotom4CmgyqyiM+E5ksLGZ?=
 =?us-ascii?Q?fJOSF+63xERDy5eJgkkM49cr9Tn1NOzlPb73X/AdgSK8czzlPu6/mQrFZAc0?=
 =?us-ascii?Q?OjrVt/yqeNNjw7HE7+wwcu3HXbPA6E9MxH9WpyPrFRqMZ1kiGA9N6DhM76/Z?=
 =?us-ascii?Q?ovGziu1jkFwQcbxTVx/B8UgsF6GxIYXyAqBTM7hROQ+Hf1Dx7KdaEfRwz4Xz?=
 =?us-ascii?Q?1UkaRCiA+T6Ew6PaJvyyQ/6yFKEf1G/L4VxhXY5I4z1HX6rSlmH7Fp5ZJFka?=
 =?us-ascii?Q?zf7io8mnTL0MdgMG5KGNdJVqC3wBHctb7Sxyt3wVWfpEx3O2ofL1ToBc3sns?=
 =?us-ascii?Q?w76tTFQfKJTepT3cCB9TingTVUsIhz4KJuh3cPGZEUW+8ZL0qXREI+TeJKnT?=
 =?us-ascii?Q?YbOgmyF9NYiBTOaEg2y9A8T+aW6wu6vOTTXBLr7xjbJKLjjANL/o5++m2rr1?=
 =?us-ascii?Q?Ed5mJ61XEL2zL/qrlwV5wUHRJg9Tacg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Axd0+I5KXDDscwiNs/qhLKtkTyc78vG8CyDOEq3XxgHJLgDW0eXSS43qTxtHSwdF35u4/TzR4TjGmWDFKvQD8T919FSGzHU8/9uFkK7rTYbJwf94EX/BmPC5v9Kdvg5PJDxbHFeQQwD13xsiF2xeuOlD3ys81Ki+hnQ5DLtBXJwQKmEvjhNGpKzT6hfCDZSwa3kLSnrmyEeZsgMSm5xwfPVYj6kGeDaRnfblSqrgP3tEv9XwuH0fbm3x3mionyEPVsoZlEW+qRTlRNBU9BnNJ3QQvB/zLde83qjLvZ5pH03LXFLoqO8acgyXUgsFWQpK+a1nsUqUFDW4vHVKO2ZsbA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c906195-2b49-4ef6-936d-08df1f883a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 06:50:05.9363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0YJf+acf54ctkdcQwM/UC393euTzYi6Lcv6zUhCu2Ws6MDn/sUCWcMLa/MbbKaxy2dcfb1kk1cHWgEB+uM9JGsCJEJiYExcGmdpacKdFYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 22 September 2026 16:35
> To: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.co=
m>
> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
>=20
> Add new RANDOM_SIZE subtests exercising randomly sized BO allocation This
> test excercises allocation, execution, validation and cleanup paths acros=
s a wider
> mix of BO size, helping to detect issues that may only appear with specif=
ic size
> combinations.
>=20
> Add the following subtests:
> - rand-sizes-10
> - rand-sizes-100
> - rand-sizes-100-unaligned
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 126 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 115 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> 8680fe518..bd5bf5a33 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -34,6 +34,20 @@
>   * SUBTEST: all-sizes-once
>   * Description: Test all BO allocations sizes in test table
>   * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-10
> + * Description: Test 10 random BO allocation sizes in test table
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-100
> + * Description: Test 100 random BO allocation sizes in test table
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-100-unaligned
> + * Description: Test 100 random BO allocation sizes in test table,
> + unaligned bind addresses
> + * Test category: functionality test
> + *
> + *
>   */
>=20
>  #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -45,7 +59,7 @@ stat=
ic
> uint64_t *alloc_sizes;
>  /*
>   * Data-driven subtest matrix.
>   *
> - * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly o=
ne
> + * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise
> + exactly one
>   * engine per invocation, so they're wired up as a dynamic child subtest
>   * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
>   *
> @@ -59,6 +73,7 @@ static uint64_t *alloc_sizes;
>   */
>  enum test_type {
>  	TYPE_ALL_SIZES,
> +	TYPE_RANDOM_SIZE,
>  };
>=20
>  struct test_case {
> @@ -337,6 +352,15 @@ static void test_map_bos(int fd, struct bo_alloc *bo=
s, int
> n_bos)
>  	}
>  }
>=20
> +static void bo_release(int fd, struct bo_alloc *b) {
> +	if (b->map)
> +		munmap(b->map, b->bo_size);
> +	if (b->bo)
> +		gem_close(fd, b->bo);
> +	bo_alloc_release_va(b);
> +}
> +
>  /*
>   * Build and submit one batch for every 4 KiB page of one BO.
>   */
> @@ -414,15 +438,6 @@ static void execute_multi_bos(int fd, uint32_t
> exec_queue,
>  		execute_bo(fd, exec_queue, &bos[i]);
>  }
>=20
> -static void bo_release(int fd, struct bo_alloc *b) -{
> -	if (b->map)
> -		munmap(b->map, b->bo_size);
> -	if (b->bo)
> -		gem_close(fd, b->bo);
> -	bo_alloc_release_va(b);
> -}
> -
>  /*
>   * Runs prepare + bind + execute for n_bos BOs at once (n_bos =3D=3D 1
>   * reproduces the original single-BO behaviour). If LEAK_BINDING is not =
@@ -
> 488,6 +503,88 @@ static struct bo_alloc *test_alloc_size(int fd, uint32_t=
 vm,
> uint32_t q,
>  	return NULL;
>  }
>=20
> +static void validate_bo_leak(int fd, uint32_t vm, struct bo_alloc *bos,
> +			     int n_bos, uint32_t flags)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < n_bos; ++i)
> +		check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
> +
> +	/* Migrate the whole group back into VRAM, recheck */
> +	if (flags & EVICT) {
> +		igt_assert_eq(test_bind(fd, vm, bos, n_bos, flags), 0);
> +
> +		for (i =3D 0; i < n_bos; ++i)
> +			check_exec_data(bos[i].map, bos[i].bo_size >>
> SZ_4K_SHIFT);
> +
> +		test_unbind(fd, vm, bos, n_bos);
> +	}
> +
> +	for (i =3D 0; i < n_bos; ++i)
> +		bo_release(fd, &bos[i]);
> +}
> +
> +static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group
> **groups,
> +				   int count, uint32_t flags)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < count; ++i) {
> +		if (!groups[i])
> +			continue;
> +
> +		validate_bo_leak(fd, vm, groups[i]->bos, groups[i]->n_bos, flags);
> +		free(groups[i]);
> +	}
> +}
> +
> +static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe,
> +				int count, uint64_t vram_per_process,
> pthread_barrier_t *barrier,
> +				uint32_t flags)
> +{
> +	struct bo_group **leaks =3D NULL;
> +	uint32_t vm, q, bo_size;
> +	uint64_t vram_used =3D 0;
> +	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
> +
> +	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> +	leaks =3D malloc(sizeof(*leaks) * max_batches);
> +	igt_assert(leaks);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	q =3D  xe_exec_queue_create(fd, vm, hwe, 0);
> +
> +	for (i =3D 0; i < count || vram_used < vram_per_process; ++i) {
> +		struct bo_alloc *bo;
> +
> +		bo_size =3D alloc_sizes[rand() % N_ALLOC_SIZES];
> +
> +		igt_assert(i < max_batches);
> +		bo =3D test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags,
> +				     BO_BIND_BASE_ADDR);
> +		if (bo) {
> +			leaks[i] =3D malloc(sizeof(*leaks[i]));
> +			igt_assert(leaks[i]);
> +
> +			leaks[i]->bos =3D bo;
> +			leaks[i]->n_bos =3D 1;
> +=20
> +			vram_used +=3D bo->bo_size;

Currently, the test only does similar to alloc_all_size but does with rando=
m size, leak is not happening.
As LEAK_BO flag is not set in any of the three subtests,=20
Code related to LEAK case is never being executed, it always goes to else c=
ase.
validate_leak_bo will not execute. So, LEAK_BO need to be set.

> +		} else {
> +			leaks[i] =3D NULL;
> +		}
> +	}
> +
> +	if (barrier)
> +		pthread_barrier_wait(barrier);
> +	check_leak_multi_group(fd, vm, leaks, i, flags);
> +
> +	xe_exec_queue_destroy(fd, q);
> +	xe_vm_destroy(fd, vm);
> +	free(leaks);
> +}
> +
>  static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *=
hwe)  {
>  	uint32_t vm, q;
> @@ -544,6 +641,9 @@ static void run_gt_dynamic_subtests(int fd, const str=
uct
> test_case *t)
>  			case TYPE_ALL_SIZES:
>  				all_sizes_once(fd, hwe);
>  				break;
> +			case TYPE_RANDOM_SIZE:
> +				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL,
> t->flags);
> +				break;
>  			default:
>  				break;
>=20
> @@ -555,7 +655,7 @@ static void run_gt_dynamic_subtests(int fd, const str=
uct
> test_case *
>  /*
>   * Data-driven subtest matrix.
>   *
> - * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly o=
ne
> + * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise
> + exactly one
>   * engine per invocation, so they're wired up as a dynamic child subtest
>   * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
>   *
> @@ -570,6 +670,9 @@ static void run_gt_dynamic_subtests(int fd, const str=
uct
> test_case *t)
>=20
>  static const struct test_case test_matrix[] =3D {
>  	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
> +	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
> +	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
> +	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,
> false
> +},
>  };
>=20
>  int igt_main()
> @@ -586,6 +689,7 @@ int igt_main()
>=20
>  		switch (t->type) {
>  		case TYPE_ALL_SIZES:
> +		case TYPE_RANDOM_SIZE:
>  			igt_subtest_with_dynamic_f("%s", t->name)
>  				run_gt_dynamic_subtests(fd, t);
>  		}
> --
> 2.52.0

