Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34DEE65D29
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B648908B;
	Fri, 22 Nov 2024 05:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOFmTLqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B910EACE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732254114; x=1763790114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWkNTkUxOy7G7SQ0v67jwBc8zzshIXLIMdjWK9GH0ms=;
 b=OOFmTLqJYXZzIu//Lx368ALDDgasw+8twR7VRvtoYcoN9ldM2MQp75qR
 tcLXp/thGCYY6wasbq5OUP1qQ3qCBR5U7Fi76GPpa9q5KAB0qVAXsKsrq
 wnSJsX0GyOIMcKzLq/aL3BG3kLU/i60/nJLJbGfwPRXAHK/6ze++o83TF
 iQyspMK6a+7s6xHxF5ACz4HO6Pgi2UsZCBO87PudyfBQmlxUVeP8LE+mo
 kHzzV5Si08QyJ8FcT0xeY455HR3A+Cn+XOxAuJEDfjSNsIb3XsZHiRwbN
 C1OYxrOMAWFsTajqOFT5KzHxK2+MCNRjuubVsjOnNXExwaB/NSMpkQivw Q==;
X-CSE-ConnectionGUID: EfGxPsugQP6WdjG7tPe8Ew==
X-CSE-MsgGUID: t/B5kAqxRtqLaMZkfq8LVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32548509"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="32548509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:41:54 -0800
X-CSE-ConnectionGUID: PztT9QdlRzWqJgGbnA76Og==
X-CSE-MsgGUID: 3bfAay0uSySOEiV5om1gxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="94560610"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 21:41:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 21:41:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 21:41:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 21:41:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0hD95KoVq7ATwx+dSqLpxL5gQ5DjBCMDk2pGXI+eKVW5wDEaRC/m48NuAIs0nDKwXxtdU5dd7XRfgnT3jeG9AsGVEvmHMyidf7LFh12cAt4RM9ohdDjgsyPfzHKitNhYZpWKmX4EE0aNdMROCfMM83ONYztNYFtb1TJgt4TvM8i15gcnrszkS6+r6u4hFIDvOzFLHo7bzdsopS5aPXn1hpnnz0qkTPqOB40lOiJwjlQnc6B3qWgi25w78v9hkzvqZtYBoZR14N/PhZnnAogqm47RzE2ySisKM8wIQofDgG6joETyF+x9MdMPi8J2YZ8B/EJ4TA9gTVnsvu3Q30A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT/b/3pGNUcnMxBPUL3bysMbie1WI1bcTrEBodeMuCk=;
 b=D1hcTS4j7nkGA5aGWHY5/5VhM1S3lwN3t/7DBwRt580+7JaHHPuY1/zHa3oMhj4jLKzIU5B0nThcR75dT5d81CWI716bAYjW+pKwKhriyJhbaO0JTgp5kNmECfDkN1V3FmAQffSquXv4Y0HABaNNGJ/MGNz6T49ud+N4RvU1dDEk5dKq6jtjzSl+bea96jaEdy8BUvO2mqXglqCClfuL1z/UdjgxzkoIbGGx8+KzmNKD1In+BiRUUb1omw3VDTle89wSzkelHW9R+VES7euLMgspQRCY/MlQ9qYyP5iwYu8Yk1tYdLy/gKHb6CDnKaUE3TA1N9j0V/7ocO6A8pgHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 05:41:50 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 05:41:50 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
 creation format
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
 creation format
Thread-Index: AQHbPJJcCzEZ48//xU60w57aHnvhxLLCyRog
Date: Fri, 22 Nov 2024 05:41:50 +0000
Message-ID: <PH7PR11MB60538FC20BDF122A76648177E7232@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241122040958.145956-1-jeevan.b@intel.com>
In-Reply-To: <20241122040958.145956-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: f17c0c6d-d84d-4610-f5e3-08dd0ab85cf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dTSZQoy11x5KejJtFn5gnicljwKvNjZxISQNtAQQQFPlXPjpwSFZMgrwcXCB?=
 =?us-ascii?Q?cJ8G+kepwK/XPc8hb18UnL8ExhcPIxi++lYQfKkZl+pOdVxKLkIWCK2ZlT+q?=
 =?us-ascii?Q?iSTKlNGHCgB8hUQPciIvOBgpJ1VmUCVOWKag6ZwNb5NhQGBZQ7Otdu+szgfc?=
 =?us-ascii?Q?zbdV4Zz5uNa06JGU5F53oLCPHpJOdELC5Z1UHXTBm654fiGDvyWYA38LaFWx?=
 =?us-ascii?Q?d0dFVTppHUqXfHga5oFK30AMxawuaa7GC8zk7lIQJcFyi+1+kkJDWgacj0lC?=
 =?us-ascii?Q?IQ59LNC66943yUWKNA1H8YOpLM5NrByq5CMHHeeJdGdYYsW19P6yN2k3wF4U?=
 =?us-ascii?Q?m0chARpvblQP8eqHcaRCksTy6ttyE5gvu2kIivNuFbPAdOj+BmMBMgTTVzMZ?=
 =?us-ascii?Q?xNWYlTWT4PRh+1zteyl1vPj+4G1wV40WPW6UaqRp98QLGx4yBcIest5AfUFX?=
 =?us-ascii?Q?+SxvNQ8xGJEZodFZx6iKWe5TTq0EJIa/V/CpQN605Pg/XWkPpbGMejryx82u?=
 =?us-ascii?Q?OjdH0ZJVjZ4+diiXjXGVbCaYdXSSMyerz3qL290AkjczjNeV1UoNItNM+bmL?=
 =?us-ascii?Q?isAZQmU444FwYiiBx308quErNofJ+AD3WRqwF8Eask/gSm31WVDdXOo0P9Sl?=
 =?us-ascii?Q?IJaJTBBREzTDbFvTBRGIvmFhWkyrFmLbq7GoQMmPGpzGWUoSAgPlxm6p/2Z9?=
 =?us-ascii?Q?oNpBT5t4mM2dM5BDvL6tunbhzBvujL7UJ/H656yKrqO5H5CGk/0XXvtu9lNr?=
 =?us-ascii?Q?tiFRxMhSP6Wrr9CQOqLT5iXj6iWQieECIpd/ar9qbabseozDmInxvGI6Mh4S?=
 =?us-ascii?Q?kOnfUoTBvqq00aXsV8g6iGUbGzJRWI/MF5mOCDRrpKmW8bXFFGlccKhju3lb?=
 =?us-ascii?Q?PgC8iGUU39vKC4YJPWgsH5iKqvFQ6nEcIuJGpD8OIhhN+LW05gc+2GrMW+Br?=
 =?us-ascii?Q?cGFFNVHrNnF3Cc125QOTCr4F8QefrNW+G0Hs6lm405rk4+H1G7jyCJird5Ct?=
 =?us-ascii?Q?+ZER6swWaSASFoHoxC43DpFwAr5uuCDH+UceM87bOHI7nfBR7k7dJo/Cpdv/?=
 =?us-ascii?Q?B0T9ai37SDX1rUYzoe4rY0az5ADnFMP2bc8XGJqCxV6f54IcRdMkt3NqSwR9?=
 =?us-ascii?Q?oFzDa8e/KogU4pcYTEyL7BIfIXiyP8+v0molJvZZs6xgCq76bf2pfROvclXz?=
 =?us-ascii?Q?POkIGY+ifqqBdsuRfrgI2Z8zZzak9NkYdLL89ul1+T3i/HbaWHed9+RFqoXN?=
 =?us-ascii?Q?eVzeBzey3y8iBzv7uSPpRXAnLr+NptnTVKm/2i5/Wt84d+BZEPnPEiqo9Aut?=
 =?us-ascii?Q?JrSCK0uowgdx+q6nPshuiVseoP92rIvnr/YByWUnfgzDJQSJaAnYoVSVGCXx?=
 =?us-ascii?Q?Wfqq9CjSvsEfnthqm8mcXylubNhxYWP07gF7T0Tc6Zk4NqMePQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQ71hE1RaYebE71N2WQdvtHS9KdcFYl1foF1jx6HG6dYfGIwPcm6lOtngLWV?=
 =?us-ascii?Q?6R7CdIa0p6QJTHx9qK5XCbIzLitw0wcc/3BQErxX4a9qfeFSt/jCYio1tCTJ?=
 =?us-ascii?Q?57m+w446YCpJU/4slcEs1nFAv8oggQODXs9mFumGSR+KH1I76IVgL5LFbz+r?=
 =?us-ascii?Q?K+XIbkqPi23IKP94GwkSk6vOVYnpF13ZIp0/o4G5ngMOM873ZEsuLuIkbAPi?=
 =?us-ascii?Q?XNfl6PQ0FfzTPrZTT7n5yrPfw8m/2GvyrLzwOuCyp24g1sWbzHaBWDlJAuvD?=
 =?us-ascii?Q?JPjhRWqeEUiME2pUyih9iEisKq3zCI6VbP+BT24QAFHnjNo0sMjti2Qt0fFH?=
 =?us-ascii?Q?MFzULjIjtTK/UGDgGlyBY2oYJXfoioW7ZsvL+ZSsCCunarZnyhDzHzsK9ACB?=
 =?us-ascii?Q?CRKMDA72Ku/yzd6+EO/YKTqE6/lpB2OKmByWgUpgVScfIU+XzNOxlffXWytL?=
 =?us-ascii?Q?dFpB/5n1paat1esSP2VyqwiotLYJaOp0239C8qNg2V3oCB0gtg4n4bRAEKLv?=
 =?us-ascii?Q?JK1BPkK5zNBLDb7BzWnSadMBMIS6q3vPISLBnnKcRw2+ZecGClThgnevxLCT?=
 =?us-ascii?Q?t/ZB6Ih9etvHUTLaqe+YJ3Pc9SRcgZJMACHZ9f+TDGXtTDn9ZCrahEYil8eD?=
 =?us-ascii?Q?w33wFtkC2e58eCvtocFQUQpr2fMuwpYb64vJV9hvNHfsZ1GI7aONR6z9Mff7?=
 =?us-ascii?Q?mZ58IawsTVpidr/sdtBHaCc30hdM/yZV1/gqAZo4W+iASF5pKp/9gjVastVn?=
 =?us-ascii?Q?4JK93x7nS01tHdVSj+eH6QVBbVqnTmat53uHteu01U8P+7P56vQQQtw8TH7h?=
 =?us-ascii?Q?jFZSjVuDQareWwtSvO+vV4XesPvux8A8jYMbLzLmN8I3kFQgyWyBT3LPHVbh?=
 =?us-ascii?Q?t9AnTm9tuAi5I0cMY4uJ4goMicIZxPXytPLkqQC4D6vFshvect+WU4sRThHn?=
 =?us-ascii?Q?GvvzDb6PJ9wDuH8m1D8WWdobFV/JSNQGLgvBOLR4iw733oZkAptGSthiMusr?=
 =?us-ascii?Q?K/Rt1Aj0LWn4Te6kzQfOH4gqBoT1yONhNVuiehFaNKrcG5pFntNmf1hap0Lk?=
 =?us-ascii?Q?d4CCJvmnfiQMP/f2y7n8zHVhVFBhbLCL2aYqAwxYBiNa6ItRVe8FbWkimNgf?=
 =?us-ascii?Q?5hVf82t2xxLY/LWwNybpAUHuIPuk8exzS5xo6AQe6F/bK8SAgcSRjmrkL5mV?=
 =?us-ascii?Q?CGp9+2gmwK40jEzAePSb3cVtnaD/h5PY1ZMSWP5kULfjVh+lHSz/Kl56yj+7?=
 =?us-ascii?Q?Jcu76fqMJ3zgUrNTwkf6PkO/as94bXiaDBKrDUfX+LWoOM3TeVKDDUq27Ges?=
 =?us-ascii?Q?ImWVmw6vbc+f2Dz1f5XMhdSddow/8Ks0HrOpb9R1CDjIRYajLCUeOdRU4Sf/?=
 =?us-ascii?Q?6jAZ626YGi47ecsB4ZgPzKnJGP5gOz3zERgjLtygNLX6DYk4kgvygVjT6Smk?=
 =?us-ascii?Q?xYpHh88e1T+qXlkwQXK6NxUJ6TRSbYCHDRUeTUZVGfOO27orRQ+DvdRAWjTH?=
 =?us-ascii?Q?VTDJjRierb0eSv31G3LKEUHIXvHCZ7WthIJ+ckzYX1S4miSphipCMen8yltc?=
 =?us-ascii?Q?7wMtZsFFz/Aw4bc5e6UIO0wpeIhz+SMnGsGAi46G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17c0c6d-d84d-4610-f5e3-08dd0ab85cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 05:41:50.6520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YusrJ6OQUdft/wQhXKesv9w77e2oRD0DrOLFoV8TbU9QgIoR8l8LAYP3/im3dNv6Gt3vk2jMTtC/FTdI4Bierw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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

Hi Jeevan,

Add bspec id. in commit message.

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Friday, November 22, 2024 9:40 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
> creation format
>=20
> Updated cursor_fb3 framebuffer creation in the cursor subtest function to=
 use
> linear tiling instead of x-tile. As x-tile is no longer supported on late=
st platforms.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> 990c50915..aeeaf69f7 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
>  	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>  		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
>  	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
>=20
>  	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>  	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> --
> 2.25.1

