Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A67C369A3
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 07:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D560810E297;
	Wed, 25 Sep 2024 07:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxFuj3Kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20A10E297
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727249913; x=1758785913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tkM0C5dT2cREeGddEsbx/Uzb5Y5j8r0EDgYpYwFEr3Q=;
 b=BxFuj3KjQunCWOUqhvwGMPOYn4RV3yzZjvMYdWdIvG09jrZpWQW6bC7B
 6MzTmWTx3PZYWYL6BjXT/zEHCH46Ex+yUs5/nATlXX32Mtz1fj9wrso09
 BgFDmpcJRQvbzbx74zsjwas0TvAwjTj8SG3hqk80WRvN9x0s57q+5/TZp
 uMr53UBtWihnNgJl9nMt5nnzUoZcPHiJcFQX6zbKufGkJZ2NpC1JSTX+S
 FugnbruKBHF3RoBfibjUvywBper6bELfKgzkwtqCax66JzYyCXUEo8Vk2
 ZyCIZ8pqVGOApk4N33xu+cvo3IdZLAQ2JqCb/l8FxVFNQF6ArBl5HDNa+ Q==;
X-CSE-ConnectionGUID: gwrDa/qVTX2s4M+P3/NhyQ==
X-CSE-MsgGUID: I7MD5ZERSke5yBYSKGzZtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37660026"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="37660026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:38:26 -0700
X-CSE-ConnectionGUID: 9UgZ/AfjSQSMwftY9u6PcA==
X-CSE-MsgGUID: /EGk/y9dTviuI8o/pDN53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="76612492"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 00:38:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 00:38:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 00:38:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 00:38:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 00:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY96GJ6wYkk64imXTFTlnPcQc1tQQHsYyQrTl9lT/usImWfFDrvONsm9qgRYTwpKbeoAj2o4JG0hOebJ97AYExaT1qI83LrvIRjf/pA5N7aSz7ZPiOFOEnmj+t+BIUkNtxwofcZczG90WsB+Ad3d2243apWB3gF/1W5jM9L6J8NpfRs/0JHU6RGD9az4BKJ5Iwg7lBeIe1UHwQ1bEJkWLDolzqmhBo3hoyTEa4l3fi0vWjiW3Mx2pqxnnl4eX8WclCmOmqnLLJ3seW1bCswRHgGdj5pg7gGXo20CVXLbt+Qi5c9qxxP27xtOYDKXkDfnpLrdwIMwjRj/6I73hCVzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtvIJ0GaHMLmNyFAgQ/7fPIzVmiUaoJ41p1k2eiArjw=;
 b=Fid2pH8kPfXUv/PnHNOh6AuGM9exoNMccBBu6NPVtoPInx2i07SaIcYiAWb9f6d7lHugA3htuVOpfKB4CJ0FNhBBjQ+EUC0caOU3Pjc+8JS/T6AqFFkCJ1s5OYv2O39QTtijuWCmkPiKPSpJ8sZgY9IRpd9Pjxo1h1E4LZU6/cw8YCHIUUE6SZijnWo3bf4OQx09TH9kIU4+9q6KaLTujxjuVv2WP0F+kazaOvSTYCi8DRx9oqhV2qyDitSVAxSuRiaBDEwz2VeOZPZIDBL2jJOjLlI8XyjwbxIUx7Z/ugTqay/1rj1l07kv2kLNzhcQyrBhIpXgod93Y3kptCbdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 07:38:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 07:38:21 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_hdr: Add brightness tests for hdr
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_hdr: Add brightness tests for hdr
Thread-Index: AQHbDnjSGlravCoeZUmI5wtEHPwiJ7JoCtrQ
Date: Wed, 25 Sep 2024 07:38:21 +0000
Message-ID: <PH7PR11MB60531C45F0EEFA684C71F1B6E7692@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240924115555.773860-1-santhosh.reddy.guddati@intel.com>
 <20240924115555.773860-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240924115555.773860-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA2PR11MB4779:EE_
x-ms-office365-filtering-correlation-id: f16aa7cf-07ab-4fc3-3a7a-08dcdd3507c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hRffy7odtwPJa/Dt/qSVvW+BZ7KYlu4CgrKXfQYw/+pOeaQBmY2CFLsqcWM2?=
 =?us-ascii?Q?v8GvGmjmbJ0x1eOS6Q5ufoCX40lYh2Jj/IuKjNMI1RQe+7dDH359omn7SRqZ?=
 =?us-ascii?Q?0A74HZTvurhU+gG4fkJwX3JmOmccPUPPBtaoAkoHNK0Xj2qZx8sevr2SiXHg?=
 =?us-ascii?Q?R8Zbxg9dkZimcWQOR9LuVvxgIk1NcgJlZz5Qi5OTrSjEUxoAZt+9WWdB8BsV?=
 =?us-ascii?Q?18J9jE24e7Y6Ki9e+CrgtM+BKKlO7I2ZL1rJREhAyLJIFvB78IKQHKg68k6a?=
 =?us-ascii?Q?cVsz4uDxsW+w6mNjDENOkiX5GqcmIbL+lZrpAz8mtxGVMSlCFDTMei5mfa5F?=
 =?us-ascii?Q?Ayw4X5g3PiLH5Jj39sFxqe5GgDA/8rt4SW/UZGmdoDcdTb82ssjkIfYtv9wW?=
 =?us-ascii?Q?wufCNqj7zzuNNvPfikJORQcpiDOEizVK2NhgtX9HzrMZ0pHlk2DvfGH8v8/r?=
 =?us-ascii?Q?4qy8fvbPZNzgXimKS8W9nmBcf6R9HLOkZo1rplf3gu2Qfr8YcNsxE1K2II0E?=
 =?us-ascii?Q?5UOJy4wkI0eEYdTfqrFAkBC2w6Bm+8DrXnCMwgO+wLsozqkg3iFJV/okv+za?=
 =?us-ascii?Q?0EOYOLNAX2F1452WuU5zC4TjKsTOqIxXcRaTPpvEL9iCifMm3oTCb2YN1ru4?=
 =?us-ascii?Q?AB1sNDv+dFCIdxNKys+F2V2OVmZhHu4DC9l4anZhMtJmHonnPpNITuVHcmp9?=
 =?us-ascii?Q?JWRTV0Pc8u9CfveI3lCjgiGUymmE1cxwtDL13i2OX2gLfKf8+aW5nsfBbbQG?=
 =?us-ascii?Q?mbwxvsh6PirKHAttBnQHeOd0G9okrAVJLn8NyhBF09juixEwLQY4ISkij2Oc?=
 =?us-ascii?Q?HOlTMyua3mn1r/cv7kbotFPF0Yql+V34jGcoXR6b7tetfVI4lFWie2DL8bA0?=
 =?us-ascii?Q?BYDF0FD3vTXv67BB+caREa0tv3ZbVui1aP6xPhdUNojkFDeQqPF5dWSWK4Mo?=
 =?us-ascii?Q?gNS8+5L9O6Whk0iKXzXANzzBVDsGelsUDykREX1Hb/aITwypMej0pLWgshvY?=
 =?us-ascii?Q?CzjPS1iQfVky+inUcr9FDr8IY9mGKNAihSAJiYS3vSAVxtclAbZRuLTlvH4j?=
 =?us-ascii?Q?wBsBAH8BoKmhvUOSoUW37WsKVThH5pj8Tpz9H0eCTGyzciFobqC07Nrq0JSy?=
 =?us-ascii?Q?UfKuDldNUIIWr8je9/ldsNaHIajzEO1cdyuQhSBrH4bPwvKu8TurYh1zMfnN?=
 =?us-ascii?Q?tr+7RIv29MnlZ9TswJBf54WTn2xux2NCOVZoWN8UFjYlJqppzBRb8L7fkob/?=
 =?us-ascii?Q?BDNLVfgNHWMfpr/Zdl0fC1701h1YN5l3FpdKu5zHRWJIckoVCnjS90waN0wB?=
 =?us-ascii?Q?f82+XROvuNOb+rgepB5J0GnJ8cIiGKlLAV94lbgkVWzqzw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sdio5pukolWrlDPlwMxHwdYAvUf9otTKpgvVTD4XW+JknXHZ0RHXulCdWBFX?=
 =?us-ascii?Q?/3yvzWuiVZ3WALo55+tMI2Cy8z6pr1KdUxe5sUpav8vci5KcPQUvORwq7xgY?=
 =?us-ascii?Q?GWZFsLKOrkDsQHxLnxCqE18qR0Gf0Jcj6gblrGbWJ2oPq9z0vsC4NelIUfL0?=
 =?us-ascii?Q?Yey4bWv205uez1NPNioUd3D9JozjZLJcpdHive0CtHyWpoyCfoA6qTU3gcVH?=
 =?us-ascii?Q?zQ4fON35qgSvRbyv3YHg4t48PCfrDUedHJiNqkBgBf3IIMMK5pBrVay67faL?=
 =?us-ascii?Q?79IN6Y5l9BrFuenFA1KxYZxOhtaoSKN2xjfnhrukgT9uEKrCkfLiHxNUC32l?=
 =?us-ascii?Q?ee+o2rVrE2twEmLZuDHQbsryuzb0BMVN7pceqD2TSzLR9pXuy96hlCQAmIR4?=
 =?us-ascii?Q?/PjOwYE7L5I72C3KtMpGhtgxmVUfFzDsWVv0vUcQuuAuqZK/Oj1/wb8SfaIO?=
 =?us-ascii?Q?o+LEG6maRyeWiMVkY8lHlxDtme2DkXXN71cjK9NFW1uT3NqRne25M2sosXvr?=
 =?us-ascii?Q?OkIPE7hZOhI+B4OVOA0H+psEf/PzMZJwhfCQd7gmI4Z8gSgzS/YlERzsgRu4?=
 =?us-ascii?Q?KFfXL5YkcgxoXEkPKXmMbbGCmMkfBOzcEqEVK1sNies0vhQnga6qe3+UqFrA?=
 =?us-ascii?Q?QmwFBFsFJnxPmc6swXTZIOlMTBE3pZnn91/m6ODaKAQHVA+sG9sBNkEP6FS/?=
 =?us-ascii?Q?7QtT/YnGaBNnIfOIwNI0wy18uWXZj/Eu+XOgJcGQkjrIQGxAsv2D8tzTeDM5?=
 =?us-ascii?Q?iN3Jc5qHWTfMZKusBndehNrH//6fr3QLajiTc3HEnkSqLx6m8K3Z4LdIlRtf?=
 =?us-ascii?Q?Jv1sP7+GIZGkSwU3zuwWXmRcCRxCM3jL7jxRVwFZLrAsQhTBZjuMV8VyQcll?=
 =?us-ascii?Q?s9imrosom3qtNmPvoHyvNsMIs9sC8CLZtPMknITXIdSjc915iLpIqA4lqDNr?=
 =?us-ascii?Q?P/sCMDNDDxpzmXxgwOYBkZQA9YMD02xNuSKb13lpoTJQ7LIix3DNyPHUDcvi?=
 =?us-ascii?Q?FPlQpTmQavOfmocUPt71krNSJV3eRt8p6qtH8G52vupif94iNzwCiwjnfc/1?=
 =?us-ascii?Q?reg88TqYqD75XOw2ifstZ2ZZy21BFWGq2AVIuMgnWakb000pbkrGatSIw1UU?=
 =?us-ascii?Q?22kDSrA+GAEA8jnO6KCEedl2/BbCqOXy5QZ+7CEEqFPk3Sg5Sfe8kNf2A307?=
 =?us-ascii?Q?nRJSNKSNPMctKfn4M1KFw80lb7fsy+GJtPs9ujTsbzsyRryVfmMxFZc/GjWS?=
 =?us-ascii?Q?TajnarqkWcR0x9Fe7JT4qJ3CyV5gRynGOOOAiM9HCqHqbICY9MNc2k3hzD7P?=
 =?us-ascii?Q?zDMf2V4pwANrtLzsJyr6j+6R5wZ2fPZW08BBGdtoZU6B8A48kjNbeSsNSk2a?=
 =?us-ascii?Q?Qn9eejbwkvkIiEe0AKp5OLYrCZqSTIf7trvfxvNB//ljYClnfWemnevWMkZV?=
 =?us-ascii?Q?tCUuRaNgCAVBF+kPL94HnCxFrVpRvu1SccRbkwHFbXP21w7fOnA27fegv2t8?=
 =?us-ascii?Q?P83lUS0/T1+tanIT66ek7tUf+7WF6Ql8TFqrlrkKo3i94qZD1IhQJE++72ou?=
 =?us-ascii?Q?NZamiGLSo6gyQSzBeZidvMGxe7G5NYDYv1o+kg2Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16aa7cf-07ab-4fc3-3a7a-08dcdd3507c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 07:38:21.2531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pj1PJpojv81NuNUn+AGDcyiZ4FESaX/feYxqn1LV+MNQ9rvVQxAZDM5OGg9B3BiSTPtCez7CFHA3+tMJ+0LeBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

Hi Santosh,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Tuesday, September 24, 2024 5:26 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_hdr: Add brightness tests for hdr
>=20
> Add subtests for Aux based backlight control on hdr enabled edp panels by
> changing brightness via sysfs.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_hdr.c | 106
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index f123c6b36..4e6ff87b4
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -64,6 +64,18 @@
>   * Description: Tests static toggle with suspend
>   * Functionality: colorspace, static_hdr, suspend
>   *
> + * SUBTEST: brightness-with-hdr
> + * Description: Tests brightness with HDR
> + * Functionality: colorspace, static_hdr
> + *
> + * SUBTEST: brightness-with-dpms
> + * Description: Tests brightness with dpms
> + * Functionality: colorspace, static_hdr, dpms
> + *
> + * SUBTEST: brightness-with-suspend
> + * Description: Tests brightness with suspend
> + * Functionality: colorspace, static_hdr, suspend
> + *
>   * SUBTEST: static-%s
>   * Description: Tests %arg[1].
>   * Functionality: colorspace, static_hdr @@ -100,6 +112,9 @@ enum {
>  	TEST_SWAP =3D 1 << 3,
>  	TEST_INVALID_METADATA_SIZES =3D 1 << 4,
>  	TEST_INVALID_HDR =3D 1 << 5,
> +	TEST_BRIGHTNESS =3D 1 << 6,
> +	TEST_BRIGHTNESS_DPMS =3D 1 << 7,
> +	TEST_BRIGHTNESS_SUSPEND =3D 1 << 8,
>  };
>=20
>  /* BPC connector state. */
> @@ -623,6 +638,80 @@ static bool has_hdr(igt_output_t *output)
>  	return igt_output_has_prop(output,
> IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>  }
>=20
> +static int test_brightness_output(data_t *data, enum pipe pipe,
> +igt_output_t *output, uint32_t flags) {
> +	igt_display_t *display =3D &data->display;
> +	igt_fb_t afb;
> +	int afb_id;
> +	struct hdr_output_metadata hdr;
> +
> +	/* 10-bit formats are slow, so limit the size. */
> +	afb_id =3D igt_create_fb(data->fd, 512, 512,
> +				   DRM_FORMAT_XRGB2101010,
> DRM_FORMAT_MOD_LINEAR, &afb);

Alignment should match open parenthesis

> +	igt_assert(afb_id);
> +
> +	draw_hdr_pattern(&afb);
> +
> +	/* Start in SDR. */
> +	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_size(data->primary, data->w, data->h);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 8);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
> +
> +	/* Enter HDR, a modeset is allowed here. */
> +	fill_hdr_output_metadata_st2048(&hdr);
> +	set_hdr_output_metadata(data, &hdr);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 10);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

Why are we not verifying the crc values here, as it is doing for other subt=
ests?

> +
> +	/* Adjust brightness */
> +	char brightness_path[1024];
> +	int brightness_fd;
> +	char brightness_value[4];
> +
> +	snprintf(brightness_path, sizeof(brightness_path),
> +			 "/sys/class/backlight/intel_backlight/brightness");
> +
> +	brightness_fd =3D open(brightness_path, O_WRONLY);
> +	igt_assert_f(brightness_fd >=3D 0, "Failed to open %s\n",
> +brightness_path);
> +
> +	int write_brightness =3D 50;

Rather than going for a random value, we can check if this brightness value=
=20
is in the range of 0 to max_brightness or not.

Or write a function which will read the max_brightness value and reduce it=
=20
by the value which you will send it as an argument.

Leave a blank line after declarations.

> +	snprintf(brightness_value, sizeof(brightness_value), "%d",
> write_brightness);
> +	igt_assert(write(brightness_fd, brightness_value,
> +strlen(brightness_value)) > 0);
> +
> +	close(brightness_fd);

Instead of reading/writing the brightness value in the test via sysfs,=20
you can write a function in lib/igt_sysfs.

Those functions can be used to read max_brightness value/
edit brightness value/compare it also.

> +
> +	if (flags & TEST_BRIGHTNESS_DPMS)
> +		test_cycle_flags(data, TEST_DPMS);
> +	if (flags & TEST_BRIGHTNESS_SUSPEND)
> +		test_cycle_flags(data, TEST_SUSPEND);
> +
> +	/* Verify brightness adjustment */
> +	brightness_fd =3D open(brightness_path, O_RDONLY);
> +	igt_assert(brightness_fd >=3D 0);
> +
> +	igt_assert(read(brightness_fd, brightness_value,
> +sizeof(brightness_value)) > 0);
> +
> +	int read_brightness =3D atoi(brightness_value);
> +
> +	igt_assert_eq(read_brightness, write_brightness);
> +
> +	close(brightness_fd);

Similarly, we can also have a function in lib/igt_sysfs to compare the
 brightness values.

Use exit handler to set the brightness value to default value before=20
exiting the test.

> +
> +	/* Exit HDR and enter 8bpc, cleanup. */
> +	set_hdr_output_metadata(data, NULL);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC,
> 8);
> +	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
> +
> +	test_fini(data);
> +	igt_remove_fb(data->fd, &afb);
> +
> +	return 0;
> +}
> +
>  static void test_hdr(data_t *data, uint32_t flags)  {
>  	igt_display_t *display =3D &data->display; @@ -691,6 +780,11 @@ static
> void test_hdr(data_t *data, uint32_t flags)
>  					test_static_swap(data, pipe, output);
>  				if (flags & TEST_INVALID_METADATA_SIZES)
>  					test_invalid_metadata_sizes(data,
> output);
> +				if (flags & (TEST_BRIGHTNESS |
> TEST_BRIGHTNESS_DPMS | TEST_BRIGHTNESS_SUSPEND)) {

It exceeds 100-character limitation in a line.

> +					igt_require(output->config.connector-
> >connector_type =3D=3D DRM_MODE_CONNECTOR_eDP);

It exceeds 100-character limitation in a line.

> +					igt_require_f(is_intel_device(data->fd),
> "Only supported on Intel devices\n");

It exceeds 100-character limitation in a line.

Regards,
Pranay Samala
> +					test_brightness_output(data, pipe,
> output, flags);
> +				}
>  			}
>=20
>  			/* One pipe is enough */
> @@ -734,6 +828,18 @@ igt_main
>  	igt_subtest_with_dynamic("static-toggle-suspend")
>  		test_hdr(&data, TEST_SUSPEND);
>=20
> +	igt_describe("Tests brightness while entering and exiting HDR mode");
> +	igt_subtest_with_dynamic("brightness-with-hdr")
> +		test_hdr(&data, TEST_BRIGHTNESS);
> +
> +	igt_describe("Tests brightness with dpms");
> +	igt_subtest_with_dynamic("brightness-with-dpms")
> +		test_hdr(&data, TEST_BRIGHTNESS_DPMS);
> +
> +	igt_describe("Tests brightness with suspend");
> +	igt_subtest_with_dynamic("brightness-with-suspend")
> +		test_hdr(&data, TEST_BRIGHTNESS_SUSPEND);
> +
>  	igt_describe("Tests swapping static HDR metadata");
>  	igt_subtest_with_dynamic("static-swap")
>  		test_hdr(&data, TEST_SWAP);
> --
> 2.34.1

