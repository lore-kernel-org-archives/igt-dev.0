Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83705CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 05:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267E711244C;
	Wed,  3 Apr 2024 05:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6UCL/aB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E513411244C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 05:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712121258; x=1743657258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xy7XtHMEAWgEoqJJJUbbV2kaqTas1jI4e8jaxIgX6xY=;
 b=K6UCL/aBF0ad4KTv2HiIMqJxqyPUp8h7h4ff1FzBs8tHKaR6iOIAAWij
 Kver8q9ToOq9ihnGJ2vkCqAZD3aoOUAQS6Yht3FEwSCxHt3PRvuXZ5o9p
 XAkauJBor0snfoZeyDWnTsbswqd8ClILDQA3uYT4lC5i6OxclSNC7JuHc
 C9LSsBq4WMDR+XIcaXyr7JvIBazqDunAjI4+IASiX0Jm8Y9cfL/7Mj1zy
 jio7A16CPIq5vEVRtjHDXFT58R5YrU6JlCGZgvHG15XLhdr2E77t0wKzg
 OxYqkUJ9diRlZIVmZWRcV/da+xttfHHVG8Uq1oaKR9L6Zj0AFOGek+5ni w==;
X-CSE-ConnectionGUID: ua4V9+RHSdOZ5/j6Jza5wQ==
X-CSE-MsgGUID: uVa8pIwUTjeWuqK3aKNmSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7194879"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7194879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 22:14:17 -0700
X-CSE-ConnectionGUID: rV7pZ15VRRiy1bDzalWVxA==
X-CSE-MsgGUID: 4LXDfa06TnuVPnyOH4uDYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="23006588"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 22:14:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 22:14:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 22:14:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 22:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIjdi8K0bM65tP1PK7UAG9Vo2RhcA0g2tSC+Ov+/7wtVoMSW07tuRAB64/1gVpfZZ1pEQjzxOS4qiSrqrO2RwUOxIvZijf1Pd2Oo+D/nOXSv0MCujCZr3eNGeFm92+oqzfF2G59g+hTAKvFhCODVVp/nyIGe6HW+XsUAlTZGWnySsMiClc2nw+Rjp8m1MeZGobmvl4bR6axT+orCr60hILQmQRTrTa3eEe0EyIPgdxd6+zYQ6J7naBJRH8xQsx9mJPcJwVDgFZn4H1T+Xiinc+GICz1bZVtFDlMMchhmSzMjJvPpFxbCsAihSzNRV46/pIRZDSXAkYGftKsin4t+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPTZl5wHouJ1dtBMRp0VpvbBTUSlV/OaP+fNFNHloS8=;
 b=CdyW++Xr0vwvnTV1+kY4IwdK+ws9Ejmp6GxEy85hJojaxheS3bFuBlVkuyXLsh1rhgOl1wstRMkeVbieFk0ZWxIIggqloWS/+Ezsipcwo+IMDfLSl2cLPl6GR49qQ7tXUoJ/j5ZQyGCnqLn85+60t+6C9nDMUEawqBf963QIDfCw0eKrUjyLaG1gj4E/HtYaavLp7+whI79DeGqUw/3XWxkLpPEAFv+JuOr3OK98n6d+2utD/EjYSx3+QWrVxOE3caApdWN8VdJzTgnHuygUTAlsLZIjOQcIygsOHtd3s8WKyfy8YGvdHEzbZa6nmn6tGjYGfMTEuVa7+PYhU/OZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 05:14:13 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 05:14:13 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Thread-Topic: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Thread-Index: AQHahX7S8Vs/I+SreECPud873Lute7FWAGlA
Date: Wed, 3 Apr 2024 05:14:13 +0000
Message-ID: <CH3PR11MB84347D4F45FD06D586F61A358D3D2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA3PR11MB7656:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3PRVg0IgqZx6nVVGtPhujDyqICUaqNegPbEXm1n0NPsaZij1nGnI2Ab8P+0e82yinYJ8+vXMsGJb9002si4rHIQOayuHL5HekeyKlLbUAI7d5pmugujmP9gewaqaJDsVLiCSn5PMRZAhQKkv6s3EyiOgQmIEVJP03A8QyWMe/ExQSWu05qfCFOKiD2vYA+aic7mAIcBPWj1n63v7pwFuPYbSMxkQWwoLHQzZ/AQhLT4/HGvpWVWP/je4OOxpZLItsCd+bYe8uNTIiKdP8yuMlwgvgrR0bZ+31ev9XMgCcDCHOdl/CYeIMA4FGjf/fV63uCv8PmdejdK5ldx1W5xAsjkSt8e9TPt5De38vl0cunEqfFqqYn9AzbzLz9QRXn84wPZ/UFhlbuKY4Y/f23JlQajNVSvlyb6jWdbDnm9QaOkQRSzeqlUC5dItH0ftjTDLziYROZXAzqR/dZbj2ujsb2gTNSSaYjhJKl09UfeKC0m1nneRVjwEEha5sXwD1acuN4BSgdLvw/8HeLAh81beBg/aciAZSnXIPpM4yF62dce0dOBgCb9On3UIF3IXs3C/Ul3tcbmo1GGbLmZZ1BaDeGC5FBJDVjfPWFB9QqtKpxhhT3m5rL/M2TINRW57tmEjwdxoM9bf4l1c16ynWfT/79Tre65sGMOlq8BHsD1clag=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XKLjf0GfOxsdkqGwVAFfqmcWutjy18xTN7Lc5R8DdtJP8PsoxpgPLRmvZmsw?=
 =?us-ascii?Q?R+CVkZYWQX8PI3NReOxM8kxrSdKLwILqAj0svzO4wlXXzwgUL35irMy1AOkF?=
 =?us-ascii?Q?0IUPzgyb7gvzmMdaGo60FI1MWB8SCch27EvHfX1TpPa2yvxWl86c7sO5fkmb?=
 =?us-ascii?Q?eUxhXfJlOjCtAwJmGQTKyKLTJP5NEPQE9Cu14T5vCMaT7WSWDo+iT8OP6vff?=
 =?us-ascii?Q?6Mkz2yhIn9nlmPWEDOgWvqhD4qbehg4+JYBRdkHih5Lv2n6wPulf/lLnPsf9?=
 =?us-ascii?Q?dKucQ2lPz6xmOCnMdQ9gsxzYxsdyzCzjWHp1Nfv5dO33iVr8AYI0oK5iWZ32?=
 =?us-ascii?Q?0DZY5YR9sQYQz90pTNDKk1m4nBlCimejQM31CqA0ac4wW4GCNcUr8GK+LHLX?=
 =?us-ascii?Q?OaQ9vMtLugw4CsjgG0PO1fyClfCmDYiojZ5iHRljxG3HpCrjLGT7rYj23zhQ?=
 =?us-ascii?Q?KvE62q2/0y5VP3dSf56XAY0xU/onDjI6WpR0KlRemQquIC0T3viZkPg5pv3a?=
 =?us-ascii?Q?JJXEcjk0/KazO7Cfr09yD5kG8+AMT49jlJNLOh+l0M59GWDGfU2HN96HosFC?=
 =?us-ascii?Q?MNT0JCqDMRoUNdQwbI2+Q4TGZE8rXIyKxlXoRzLnAALsrDH4cLEyTl4CDqSF?=
 =?us-ascii?Q?RM12W4hxb9i0AcnmPB7gTsgK5Lap6oCqU8LpdJW2+hHXAvTu9w1wp6HdymzO?=
 =?us-ascii?Q?cUYGWeaw8IozlN18e3v1KsXGTpnou5JupSJRred7efhd/1Qz1CnAkC/6UM5m?=
 =?us-ascii?Q?2RNn2IBtzutt7jqs8ZgUCD9ddfx+xxrzlOOvUY+4z0q+OuSdETf4WndkNr/G?=
 =?us-ascii?Q?vV2skpyqBBvGV0PuI0RSdIYgikBr3zTaFbBRUeCt8sxNW6a9nxXkKNINfvkQ?=
 =?us-ascii?Q?p9bj41bUHba/x5aHDxM2yjwiKO4b4NtFUkNlG5c7W9ScXKUResSyOMR7kMPT?=
 =?us-ascii?Q?MW627HAEdI0RWMkMJd4PdDIed4a29JZIQnRIJoeTzT6l+XuhUkWwZWGNCkvW?=
 =?us-ascii?Q?KrFclXVtb5wv7lrA/WB+TOFyH76KTjzJVQF8OUqIR/le9Da/O6emPPWVvFNI?=
 =?us-ascii?Q?MII4KCE5og2I49oqoiGxsqkLIZl8TBBg8wyy5PTvkeJx7sE8/HqsLAv3mDue?=
 =?us-ascii?Q?xfplN72Lj9hkF8KdO29t6WyYFyqI6o7uThDHHPx4ddfG5X9KrHMoV+D+iKSe?=
 =?us-ascii?Q?Bn6i9gl6LUxqD0bIrzOVF29kytEHQ+oBII6bYwuLnbFtiodoX3Fm9jqcrQni?=
 =?us-ascii?Q?CL+IzpoeFFMuUIwjttlGcK8+apRgjwfT3XarGfU8oB85Q6Ykurfk/Yj1Uia3?=
 =?us-ascii?Q?QfDigX/TfFknFETskynpiYsm9CTdUVhr3soJ97FniuzhtL/7My085S/0uv+d?=
 =?us-ascii?Q?QnCZwEqX/dSJifW6YnUWaAtrHVreXvybwZhnW4y3s63kdO0MqW8xqcMao68b?=
 =?us-ascii?Q?ps5THpZI2Z1hheCvAjRDTYVCVJZd60MS2ycE66I1mc9wVgMdrwvKM1v7Y0lO?=
 =?us-ascii?Q?hOD1URAbzmVecw16kenAwo+x/ADV21h0tI+CIfVuI6GzQvx6sKhafL3q6xXd?=
 =?us-ascii?Q?Usx5SM+hXEF1DMpgUBhu+Bf49kpgP6qYXtsFK2kyg8vd6dHrtULGdFR3A88Z?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd582faa-1a71-42f5-2efa-08dc539ce728
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 05:14:13.7753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxHuxzyoIHuv5YImYgA2k07uRNWI2bcQkRXXnexrbn5qpLHoi+QHOTsQjlvi2f3rulrUKVDQ7nemKlxRgOw6f3Mq2G4Im2zMcxvkfWGVqUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
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
> Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all de=
fault
> values
>=20
> From: nakshtra goyal <nakshtra.goyal@intel.com>
>=20
> Change in igt_assert_f function parameters so that it also validate for
> property value equals to 0.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: nakshtra goyal <nakshtra.goyal@intel.com>
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
LGTM
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
> --
> 2.34.1

