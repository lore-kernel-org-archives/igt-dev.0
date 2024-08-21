Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0C3C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 05:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89B10E572;
	Wed, 21 Aug 2024 05:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A91UUAfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE2310E572
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 05:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724217840; x=1755753840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AR92VMdkE+QhbbGzJYGx2i5gsPXmUpHmuu34P5gAZiI=;
 b=A91UUAfO7O2IGPbuuOTZyrkcvQSjUhtHw4BZrDHeFvOKLCe9SeGaG/FM
 WOFHjwv5Tbsl5p54s4cY1anZCSlyphYoSSRkfNATlXLXDET0M3PdK0CzL
 ayBfmoOwZxgtCQIqrp5OvJI+dzZ8OS5eGYN4u097Ws1I6g/5l29tbhMxX
 4Mo2kooqv/q6KbhbGC+6YsZsU8X9zpFXkk/WzZfNZAeybE5LFuD4cmUR6
 hV5W2opUVTKyChT/1K9w90j80HQfCj/qbInOd7QPxViC53YYenNz0jyqU
 L+McUwg4EAcTmVkPunNpwLMTI3q1g3icrbif83ReyP0WA6itZwvmndK2I A==;
X-CSE-ConnectionGUID: oOourtJ+R22nWH6Hs5Jg9Q==
X-CSE-MsgGUID: J5J4dRfXRSuzKUUhYVnnvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13126282"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="13126282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 22:23:59 -0700
X-CSE-ConnectionGUID: ebZ6zPdITJiMpNY2zfRIUw==
X-CSE-MsgGUID: RByA/KKsSjKfQVM5uEiooQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91719424"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 22:23:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:23:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 22:23:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 22:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCKmYlIvDuG4C9XTu7FB4WR5IlgFx8tWvwjW2mASVz4c4ZNQCfL/rUOkcJvUizheHmLbwVoBXZmiE8ntE2uxPIl1E0l6pLobMMiuf6XZ6UuAF0DCdfkqokT7DWNw6JQKuH4qebW+a8SBRsYyo9pECaw+u+yXnyDXO2Lb/m2bUyjmM7LVxBC9LjFUn8TswcczoumSnQLwb14SNSlkLu68kweVrKWSOGFnq4yAOmDKZ9hB9Hxm9UdT/5vluPiyhHAE3uRRQ9A0enFJLfSAVLCcw4UdZNaSOKoXuxNm1QhQz/iCF0ZIAouBHL/c4I+gJMQpEBibinfiFE7cWD/ZRt5HYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOCG0AyvnQ9P7AYxYVaZNpdp0PrrlmivPt3H/rDuoy8=;
 b=XtX/2z6Txezq53g73YD5b2ihSV0ThjUNlp1yV+xICit7Qod022GEcJ3FdcuTTfOqChSGgE0GjGNPfbTNovh6u31WTksnmYXQCoI4HTKjg+aE7km+sSHLp2v2EQz1eTvZpBI2zDWFaTiRV2BW5emw2xEDuWbpUcO9OO9WwgMNEY9qOUsY6Ib6ui3FpydrABLEuQ7V24yt9N+KvVgqBOYWrO6nrOWkRGsAhpx3QNWhouh4ydJz/oJwp2TiEPSU0nS8LbPfphTb5i1e61cwXUiBlrejloQLvfyrI49xcjDcPL9uNbgLfPklIwJX4jW30iwzmrpbg1+WBBj+WkOkMMk/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 05:23:56 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:23:56 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 1/4] tests/kms_color: Add more logs to skips
Thread-Topic: [i-g-t 1/4] tests/kms_color: Add more logs to skips
Thread-Index: AQHa7USveoqzntpx/0yymV283gTKdbIxN+Vw
Date: Wed, 21 Aug 2024 05:23:56 +0000
Message-ID: <PH7PR11MB6053602A947B24EA4834067AE78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
 <20240813053845.2567954-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240813053845.2567954-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: f45e316a-62e7-44b7-a583-08dcc1a17431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LSGrlje0cucjxjrz0UsYa3k2rXresUkWF3fXHfvGPxik5gR7TcGYg6AbLaFJ?=
 =?us-ascii?Q?mJYDocp8Voz+mVba9ayJsqb2K41Q65FIYul0fm+jC1UFSjOYG4NvQZkRsj3A?=
 =?us-ascii?Q?zthbXAQ73RmyNHCHj+0vcKC/YKDBbuwF/nmxPlcR6f0czInBKifHiGJKXSPr?=
 =?us-ascii?Q?r6A3GKR1B1n8g7WaKLrhOc0JaoWvvzrIPp3udS77clHKPVgZW03DJLjhTOHI?=
 =?us-ascii?Q?wjPBLWQWrwRqh7HFPzfyDJciKmU+c5wdjStngYdKxEYVCuBw/gjd6oDnPc4j?=
 =?us-ascii?Q?fX7DcuDtb9Z0lItZFs6sHULxxuUfTTFhhXVMAQykTESiDZfT0hcJW3sZG9MH?=
 =?us-ascii?Q?nX0F1oZFK0m4kK01dz0ZqUz2+P/WJHo3aek5fDzhHGEmRLI2fdtvuHrgCWzU?=
 =?us-ascii?Q?EtTRhMLkLTUyGgwNBpNT/LWO9Xio53BOduv2Rpyo3d9LQstGS5cKiuuZJkhI?=
 =?us-ascii?Q?OPZer5BNPUgL6WzgNPsnChchWfutA783L7CWTDSAIjmnvrmTS9kJ667J3BuV?=
 =?us-ascii?Q?S7+Ch/Pi2OZLitZ5lY2TCGxDJtTpNIrnbLDDxl9+6zNctO2NZd+/aNozGUlt?=
 =?us-ascii?Q?1Fx0QRaAUn/xRp3k2UPZFnS6hL/JgU6ULg/CYrRm2LLaXWkPG6ySzo0AdFE+?=
 =?us-ascii?Q?apcPcnS4mP3JVLvta+snelbv7ncl2N5i1H99wbu45cedPgkAzNKBNacmWjy4?=
 =?us-ascii?Q?gJCxrnX4n6iZI5vLOGa43FWrirF9YsZ6eleyvPWE/wDt/feIP2Y52lUn86U0?=
 =?us-ascii?Q?fynRivw288mqFzT3XULPQ+vBfdAgix7sd2GWybVLj5gCT/7sfSMEE51QAYb2?=
 =?us-ascii?Q?z8CAaSXDpR56OWMFXgIuRch7LU9Ujrh7c2WBbvERIU2vLMzlxYNGR5YB1FNc?=
 =?us-ascii?Q?Fxd9RUwFLl4x/R7FCg0Cb44vU0r6PjnhyWQCPPCOI+RGHWQPiLXp+WlhvNEu?=
 =?us-ascii?Q?APLbGDXuNGf4GSU19wr69xHymYUPBPinxdWaedWqSdViZoRgql7/j4uMqlTE?=
 =?us-ascii?Q?a3fm2YMzbt1r0oaY/tsj8N/y5Xxfc5IMdMdrt1PmhIfTBjmQ2LRrKgCrnAJu?=
 =?us-ascii?Q?g11i4JeUGBYmNkrpf+zJUsURwpgEXZSGqDPhWYG4B9sBwQ5xk8r/xvvONBk2?=
 =?us-ascii?Q?GXef8SMuIWPFFCiZjixbf4lTBylJUohuTly/AqpJbwZ7y+/hCT8j3VAHHrQU?=
 =?us-ascii?Q?mLNULm//9pGclNyS8xxU3Wz1nLksxtxnaK/Y4KOTF+rgNfYUyVRYEbJDgia4?=
 =?us-ascii?Q?5UQbhZ1HpG3vcfCgf4UqwXkRg4AaF2ZO2d9KLAKfrPRJlkbyniS+Eqdpp74X?=
 =?us-ascii?Q?QuP67U6OtNYPq21WqOHIEbsFtApFrthXtUcoNZ9G9dhN/VVS2AR8rSpN7yHW?=
 =?us-ascii?Q?+iSjQb6rxT+aNXQN/Bp9iVLaWO84XOy3mQDZAcD3HtTE9NvNbA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l+FYRE+KImAB8oLDue617ihvmjRSXMn7+Wb88fVSwfH2WHUyVwA8mRwgxYmr?=
 =?us-ascii?Q?kGyydo8q4phh9zd41eOdY1u1zKtrJ6B4FctLxrZ+Fer2dMYZedhxV1gUZHeO?=
 =?us-ascii?Q?e0I78gTCNQfzcI/YalwbaDuMNIwst5x7tYKoiSQZwoqB/ZpsqLwuA1oB1xhl?=
 =?us-ascii?Q?g/T8ONwheOdNThoR3rnWcXdzabawumyQIHGPC9U22P6WJQxWrthKoTnKWkLR?=
 =?us-ascii?Q?ot5uB05IWeykzFIR4ZBRGFEdYKEOh1eaWL/JEuFX2DxDurNSAHAYqWzndDo2?=
 =?us-ascii?Q?Ae3DkCfWRVHSSfBhOHe3ip0HW+BE/qgSoeVVrGB6Pi/A3zUmgIv8+Je0m8/5?=
 =?us-ascii?Q?ArYfrPj290+WCFy2mniznduW/wjcJej9QKqVehwQ/XBI9wyHELhelUNUg/j1?=
 =?us-ascii?Q?HakVU7MaQBqvBp9RPIagD0GvHmP9sKw5Ti2QLSWnU7Wx2CiNvDX5DvkB/17W?=
 =?us-ascii?Q?3W9vrR7dPHiCbfuRV2viS+GvhGiz/5I8X0FNKgXtV5lG09qdUx50ZtGoyywv?=
 =?us-ascii?Q?9xaLUMP7VO7YMFVT5nOKIshHi8EnmzEJRSnR177EeaFMFPW/TjK44GDmgOsY?=
 =?us-ascii?Q?oiKMbc9xkF73cK7/UPFXD3D93IOItMGfdy7nIJ/C7Oakh1Jz386Gntygcfqv?=
 =?us-ascii?Q?L19U0dkwRf7Lm3Aksgld/dduEjUk3kmQLt17zf48RzuJNel+GhYS9OHY8bW0?=
 =?us-ascii?Q?G+I0sJGadckdzCc3pySelnAG0/u1RNHWh28YjblcNNxHgmll1YW8XnzaL0MR?=
 =?us-ascii?Q?Sb8bWF/8MT1bxIuVIUzJuEnkVL9I4bOo6haZm2qHAZVNte7CuVw4gqGxRRae?=
 =?us-ascii?Q?ik0TY5VkRdcSGCguu9jyeX/o5B8z/p1kHMQVI0ib71qUQBKRG3XcPycmsgLj?=
 =?us-ascii?Q?xIhTxyPhzmGn1cqXLxjCrZC/k+JNA56GnpSb96OcnI8db6alS5HcSmi1ejXE?=
 =?us-ascii?Q?dSYEwq5k279yavLY0yKjs7yibSjGfGj5LMuFH4Puxg5Q9prwUsQeqDxXT70d?=
 =?us-ascii?Q?DpCr0r9nmed1iK8cqRGAXoT05eCLgc9bPZeEgAENFECk5INyzbHwQkHbysGW?=
 =?us-ascii?Q?yl865Bue9/GLWQHKiA0QFE3APNikNC1zjxQa4lxb4Kp88rFjj47pDaTY1s2c?=
 =?us-ascii?Q?HKI1GO4Ev180DC3v8CQbfrLWjo6YpMfnAtimLHac7v1Z1u//gqLjsAjRrjfk?=
 =?us-ascii?Q?NfwYmgBrDeqhM4u0HJvSYVMHAsecjneAjovx87UE9D1Zf1CmYZLbfRq2a05g?=
 =?us-ascii?Q?8vXYHaOIfbDHYq8K8XCVArNhQ1p14f2WMQhDXrV9/szjKb9rZqnuQKjNDqpr?=
 =?us-ascii?Q?J4+NsrMoDVFUPNq4QI+mqh2xZLadrswUaHXosAUWz1g3hB+8BE63f5tcMOwL?=
 =?us-ascii?Q?IjqqCocWV/uy4ji0IQC2vYjzPMI87jDJ/W1pTPfQxms3M1dxDQVmVIaRRhRs?=
 =?us-ascii?Q?Hby19oKxWQyGdwF0+bxpfQf4CB6P3Kbz0rT//OQQLiFFbedp+RpBNZ8NTgox?=
 =?us-ascii?Q?lkIf1UIdA/SeL53SrmOXNCrW8b2J6I5tqy11OkkgCORsPwmsSspsGHzNrOuy?=
 =?us-ascii?Q?mgMYDZuSdkchqwqBK4uNco9wFdMpoSeNrhkQeWh9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45e316a-62e7-44b7-a583-08dcc1a17431
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 05:23:56.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xsaUfk20bfjSI0X1euxCydsLeYxIF/NGKB0kMs22iIBfOIp2LElzaer9shG3Qt8tURzwr/EoNoEzhpVaDV1mGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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
> Bhanuprakash Modem
> Sent: Tuesday, August 13, 2024 11:09 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 1/4] tests/kms_color: Add more logs to skips
>=20
> Debugging would be easier if we had logs available for test failures and =
skips. This
> patch adds print statements at crucial points to provide better insights.

This patch LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>=20
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index 645a03537..5f012=
8bca
> 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -893,11 +893,18 @@ run_deep_color_tests_for_pipe(data_t *data, enum
> pipe p)
>  		uint64_t max_bpc =3D get_max_bpc(output);
>  		bool ret;
>=20
> -		if (!max_bpc)
> +		if (!max_bpc) {
> +			igt_info("Output %s: Doesn't support \"max bpc\"
> property.\n",
> +				 igt_output_name(output));
>  			continue;
> +		}
>=20
> -		if (!panel_supports_deep_color(data->drm_fd, output->name))
> +		if (!panel_supports_deep_color(data->drm_fd, output->name)) {
> +			igt_info("Output %s: Doesn't support deep-color.\n",
> +				 igt_output_name(output));
>  			continue;
> +		}
> +
>  		/*
>  		 * In intel driver, for MST streams pipe_bpp is
>  		 * restricted to 8bpc. So, deep-color >=3D 10bpc @@ -905,16
> +912,22 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>  		 * supports 10bpc. Once KMD FIXME, is resolved
>  		 * this MST constraint can be removed.
>  		 */
> -		if (is_intel_device(data->drm_fd) &&
> igt_check_output_is_dp_mst(output))
> +		if (is_intel_device(data->drm_fd) &&
> igt_check_output_is_dp_mst(output)) {
> +			igt_info("Output %s: DP-MST doesn't support deep-color
> on Intel hardware.\n",
> +				 igt_output_name(output));
>  			continue;
> +		}
>=20
>  		igt_display_reset(&data->display);
>  		igt_output_set_prop_value(output,
> IGT_CONNECTOR_MAX_BPC, 10);
>  		igt_output_set_pipe(output, p);
>=20
>  		if (is_intel_device(data->drm_fd) &&
> -		    !igt_max_bpc_constraint(&data->display, p, output, 10))
> +		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
> +			igt_info("Output %s: Doesn't support 10-bpc.\n",
> +				 igt_output_name(output));
>  			continue;
> +		}
>=20
>  		data->color_depth =3D 10;
>  		data->drm_format =3D DRM_FORMAT_XRGB2101010;
> --
> 2.43.2

