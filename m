Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF9CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 05:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629610E1C0;
	Wed,  4 Sep 2024 05:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWozYh8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC9B10E1C0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725426809; x=1756962809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SucAyponie9fWr8Ot+6trM4GhvZsVaZVaBqGgqS3hV8=;
 b=CWozYh8lHZR2a4uRhm+Rjx0/ArAODvBpO5Z7hRdbnjoDv5SAbaGPJ5Nc
 Mwsdex3UxGAaSgrUhsZx4b5eTbTbaNy+bmoBITKqr0qZuqVsOPxlNLmzO
 3x2NVXkGAdD0w2J3kPtR+5B7bxLc63uFXplyRH+sPYi+/N/eB5/ZvgwT6
 c4zoLw+j8ODCw+FlVYlwWx38t6ZA6R7QsG1ZTQcVJFiwQx0sTMAnpXw+f
 MnFSDZuUdku+g2DefJNieavcgmPQaCdrZGBp5H6QRR3Mha7WT/7vD8InH
 wTXjNpwuW4U40t1gBEozaurEYsBexFSQoFveB1V5unXKxxobLjbtFjWH4 Q==;
X-CSE-ConnectionGUID: h816dkgkRiyRAeodGAv8jw==
X-CSE-MsgGUID: br7YkqfmRCeafE5TnReiVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26975678"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="26975678"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 22:13:28 -0700
X-CSE-ConnectionGUID: 0bOjRwLGQmm3nELRqK6Spg==
X-CSE-MsgGUID: BWDeB5H2TtGW8Z3OlFLXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="102556901"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 22:13:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 22:13:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 22:13:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 22:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2UWYZXOIMEpIa8UgOCbCLv/F5cmJAfK3bXXzhOeMHZDwfIePR4lWD+waT/K5UM9G4i4umN/J/E6SZzS6hDOU4ov3CuAYDPsvIOGZ492GStzXJY3wZNyNoYcjdueALxcgmcQkWVUmhtNQSGru+D/yoJKztp/lc5w3jcxqkIrecDDMWbBUcVmKMxosJzsqcyXE/PcVWJbmnml1jZoGGjVH7Z2+aFzxxugOV2x2svYaJ7ULbhZbqFGJxKf7xS/O35TkSuUn/LCZfEnMW3+qRg+R4ghXWJrZSm9grSKSdIQzocEFCl6b76NO7Q04g1ok9g6rFcYQ4632CfJMonhorHSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l178lr5EE3UzUOnlWrcQLNG80oeaeMegI0MBvgpozYI=;
 b=gt1VY8PlSCXxOGZh1WDsF4We/k+PonUYYfOFQPug6xAxUm5yQ7dp/0mFBDQtiRYd2VQpPjnvJPTVBC8RJPlxmafwemnfWfvGUeKaIQ8qJTfUofa/9zigDpPXoNoeBwNQ0T6X1GvSOkj0wsQ4RUM1tDW7huLtgufLnITIiBz78RFk2TLbOVn9UWkn61WeKVgEBeuQ+8YBGEAb6tJb1JB1p8tQElzf7woUHQlQhQUK/ldjOOyk4ryWRjYuVwWIAgYf5APQLL6qFRXcMRvc+jho9LslRfHQtkfpjwUU3rZtXfFmXUYpHCgVMevqjCLXDESRA2hu+cyqyqkYLgtvOlwA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 05:13:20 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 05:13:19 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 06/14] lib/igt_kms: add function to check if retrain
 disabled
Thread-Topic: [PATCH i-g-t 06/14] lib/igt_kms: add function to check if
 retrain disabled
Thread-Index: AQHa9xkGaI5Fp7StGECyej9ZbHuzTLJHI6pA
Date: Wed, 4 Sep 2024 05:13:19 +0000
Message-ID: <PH7PR11MB60536A20A2EADFFC7C3506C2E79C2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
 <20240825181424.4034541-7-kunal1.joshi@intel.com>
In-Reply-To: <20240825181424.4034541-7-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB5279:EE_
x-ms-office365-filtering-correlation-id: 5df827b0-4bb6-44ae-a504-08dccca04aa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oo/uUHnlWnwsCITt6oXBZN2Xug5Q95jgFJG5lZ+J52rczf+GGHY2KHcZrl48?=
 =?us-ascii?Q?m8C8FpobF2nIuVyNFgJUteCpTpINW9JDIPcVeo8+CKkT4z1SJyxNcV/g4M5i?=
 =?us-ascii?Q?CRes3V65CRSGmV7iY7Csk9+l00U74skkHyQBCx+1YxpqdKEhfT1hBKgzt3da?=
 =?us-ascii?Q?7Cv+bO2kgzs/nlSCT99J76FFyYB0jYifLTRNQYJNd/xy0SV7VGW5kNuxsB6T?=
 =?us-ascii?Q?1xLOaVqREM8Hu7Q5V8raG69+xJLTmW92+QrXlC4DAxcSsJd0iTqI5nBtFyl5?=
 =?us-ascii?Q?YqPYR/+b0eAagoHgSofHAk84wVs44sAvseomukHj2XPplGgDRuwCsIBcBRSy?=
 =?us-ascii?Q?YWbfzO9DdR9OfhfGfN/OybBvgHw3zugGMFx51wWvOOMxTy/AZ31WxWREpPbl?=
 =?us-ascii?Q?b219z+O5QJUj7XvHOl3XvLV4j4GoYcqs65IlWonoBgQ42nzVxvx3O1XHKYSo?=
 =?us-ascii?Q?wbnXSuENq19gry1oBQ8tx/5qB3aVdDf3z78HcEaAFW51Hki1JX1vaeQIRhy1?=
 =?us-ascii?Q?wd3RGRUDTSAbuSa0QZ0ncaDBmp88tkkJyt7mvSA4KXMB1a+F0ICcZe1/Z+1E?=
 =?us-ascii?Q?6CcYXPKX/LYq+b4HFJ/ZSvhPHPcoEOOLp3djUd3UWisf6pLkXcjWbYbn+LJo?=
 =?us-ascii?Q?eObKewcnIaIwL2fkD5ErRS8bUoQXNjILlC51BBzVNrXeWkHNB5o6fjUW76rJ?=
 =?us-ascii?Q?99oN0m7VLuX1Kbc8Cuzy7vZ+nyzMSvmoKTmZClSGT9MHmEvXssmTNrN9/4uI?=
 =?us-ascii?Q?o69s0jTfs/I+55NJ2qFBdJuXfjVOuSiZ9dfqZpqfLvgbjsjrK1twXsLEWPrB?=
 =?us-ascii?Q?kkAfwOHSGHCQRZCwoPfWxHrw68q7dmmVORl/zKeK9vsKQogaXso3aFxYFhOE?=
 =?us-ascii?Q?xowUfUQRRh6jTMqNIpa4pEJJ283Gx9dTIxzUztyYWzpM4VcR/Mj+qVD3+MUW?=
 =?us-ascii?Q?l7aiq0KHc6PxiiXpFzBsANC1y+KvztOIiFdgz73RCdtEqKoZGN5lAHv+NvGH?=
 =?us-ascii?Q?b2Orc35F9q4KALksXNAvC52J8h+H44fEYdxAnZPx+N9yP9Ki284ZKZLQX0go?=
 =?us-ascii?Q?l66Hbh5QraoicyeHTY1tTh5Q+gxODFkEBTBMolcSrJSwJ3AJWD8r3xq3Nqjl?=
 =?us-ascii?Q?3rqQ+IakBCboyz1Ml15Vzq6xXXMnsrkwsMP9uelLcl5q2Yo3yD4toYTFXTBr?=
 =?us-ascii?Q?IkB+fwVDE3KlHrtDaBnFcQsrVCsqjGaTk3rsqKmlprg87Bneq9GlDLTjtoET?=
 =?us-ascii?Q?ikVrcLIcZM44kuQLxJV7Zk+0XvO0t9zdmF22n37jyJneW6mMWD3xNpvUtHeU?=
 =?us-ascii?Q?KUP4GFII7KBJwQIEJ1uqHoud06tvbP2L6Djf4hBaLWvWEu+G9LTSdMfuekna?=
 =?us-ascii?Q?6PBqUjqWNr00OTLI1dtmMzxktBrtYKKsFltPGl9czLdRGUzmYQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5rcY6+gTYOCSob5HxFZzEjHMMZCJFR+H778qG5rkJeePRbZXABwezcGRAmXc?=
 =?us-ascii?Q?vNLh/YKq017Urr2BfAARSK+ilgrX790jud/23T2S+tEuqNA47LRP3iG6+pOL?=
 =?us-ascii?Q?Ngenf9JfprUoYjDcyU91L6VO8B7Dz+WLvZ3Hv+Wy5uaaCetwIBRmXKkyRQfL?=
 =?us-ascii?Q?S0+XSQFnWlmqlJiGsmmF6Mek1ina8UwKD6vGmlB3g0nfOaTQGYOGfpZQ2MnY?=
 =?us-ascii?Q?aYDQMfnXtq/E0oqHw3pSKVtyrbZ0jmEfOx6v0Us+k7zlRqYTJYK/Bt06PyRd?=
 =?us-ascii?Q?TUZDusky0MazfpOQRMBnrRZIFM0QdqvatppwxBFkGO80WbCiup/4BVAydxSX?=
 =?us-ascii?Q?kzKfZiwAEfdFoxKlla72DJzbIobOw11tpWCt5JANqjk83m6Ku5DuuQI/PcXN?=
 =?us-ascii?Q?Jg5nyu8u12STtSpnRxOuE5A1Tz40vHfOR+g7e6EfvUinLZxG9uUaxLOBgozB?=
 =?us-ascii?Q?sFxlGXzZW0/ySamp1qAMP1hhJfDFj0QaeCZH8yqR0BW9EW9h4NfsMiWScEkf?=
 =?us-ascii?Q?tKlGNHgBINJfOtc50aXohCb/thVCJKB7Y/9A/m/stlYSSEJtOWBR6bb/zmH7?=
 =?us-ascii?Q?eiaTeNZ/sRQWX+qz1VmzBupb7AkagLqp0CfdbQhYuXIbq1qCkawpSHCmk6SS?=
 =?us-ascii?Q?TOF63j1PD6LZgholFfBpILormQ8vjauzLTKaWMkDZWQqEbUqBa7xmO1YmesJ?=
 =?us-ascii?Q?zN8Eb99wEgta17y8RvxK9di6UAkssXOBTk0rcieywcVRrUJTbEgynW5hVMph?=
 =?us-ascii?Q?UiJQpdXil/V588WnboQRlq3ROJ7Q1TUlNVdGnWHKZO95SNyOK4t+yLA/Ochx?=
 =?us-ascii?Q?Dh7YHhlCGaface5i1QLP5Npeo8Y5yYAhc7Pn0wFsbwBq+WcSLCFjjUTf1l7u?=
 =?us-ascii?Q?8v2kyZ2g/B7+awz4gOtlST4DAIn7Q6zsUGEggwzK2JPAHnCpuqe30OI4Eflb?=
 =?us-ascii?Q?aLwsnzNxzxTRhsy2OD1oTDq0BAL5gYxUkTTYe6zgNC+Xmxo7ixqt0p69UQjf?=
 =?us-ascii?Q?jSa5KsO3HwK20OktgnyjrUv6GYiLxRyY/KxMk6R3hyn78YIdh99/Y4+RgfGG?=
 =?us-ascii?Q?dpGFHj32eIst+BEgOOSSXDzZ1x/TW/nZTO+pdMt/jdOIQdR7iFbn21HtPpDZ?=
 =?us-ascii?Q?nFPmQCxygXY5xu0gLqgT+ruwnnpSHpfq7Z+oqPoGp2Pbbw7jH6k3aNJV7+Di?=
 =?us-ascii?Q?YKq/aeWcRll4zluqvtpopgg/zoO6NNq+J0iZJad5dtJSwMHWFMbF8DNpMzCJ?=
 =?us-ascii?Q?jXZcqYXLcOQGTrHNsJRqz8xIZMWsKQZU5zd9Oi7j/EkMYsc59qi7Mfg5aHGp?=
 =?us-ascii?Q?V296ZUG4cMkXQtSQ/JFY++a6Ln+bFFy/jQa1C0k4MQlW/03MPkyYJn5tnQWi?=
 =?us-ascii?Q?vHSdu2rBjG3uoRU78DAYBK9zN1DEeQ6Q/HE30CF+LlYIZ16nsRAS9LcRnlnJ?=
 =?us-ascii?Q?35Non2yzaAEpg5q44Fq/vc6IxaEMvCuXb68IthZGGnD4wgSmL4qr+qfPjzkX?=
 =?us-ascii?Q?vDoeSfu3pt3IhF4OVH9NU3XSoNmZ5YYeFIYDUxgTy9GcZNxT1n5d9lgzh6Jx?=
 =?us-ascii?Q?SI8hyIZXeCVonE5c9/6VPSRPh2sjeZhEBcjdife4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df827b0-4bb6-44ae-a504-08dccca04aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 05:13:19.8355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqgr2aLs6Iv9/rkkGlwZXYyYYiV6ct/bKTaVX7dEJBHrGJqm/PLx1STutprRjmOaXpy0/4S7fEbhsy/6obg7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Sunday, August 25, 2024 11:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 06/14] lib/igt_kms: add function to check if retrai=
n disabled
>=20
> add helper to check if retraining is disabled, retraining will be disable=
 if we are at
> the lowest link parameters or the lowest mode supported on a panel
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 24 ++++++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 683989e84..2720095d4 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6869,3 +6869,27 @@ void igt_force_lt_failure(int drm_fd, igt_output_t
> *output, int failure_count)
>  			     value, sizeof(value));
>  	close(dir);
>  }
> +
> +/**
> + * igt_get_dp_link_retrain_disabled:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: True if link retrain disabled, false otherwise  */ bool
> +igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output) {
> +	int dir, res;
> +	char buf[512];
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));

Alignment should match open parenthesis.

Otherwise, code looks good to me.
Regards,
Pranay Samala

> +	res =3D igt_debugfs_simple_read(dir,
> +				      "i915_dp_link_retrain_disabled",
> +				      buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +	return strstr(buf, "yes");
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 57829416a..2d69d794a 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1253,5 +1253,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int
> drm_fd, igt_output_t *output);  enum dp_lane_count
> igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);  void
> igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_coun=
t);  void
> igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)=
;
> +bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t
> +*output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.43.0

