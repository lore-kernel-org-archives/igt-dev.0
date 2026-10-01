Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAFCCA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 09:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A2910E310;
	Thu,  1 Oct 2026 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0LoMi2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5369910E310
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790845527; x=1822381527;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G+A1Bols6Of5aCZP0mLW+CGb/MZiUdymK2EoTQUDf2Y=;
 b=S0LoMi2LzFdFa/u9DzOoPQqvUBl9KS0wiTAPcub/B9RdLaBFySi40gMe
 t1rfLwMZLH1iKkLylXMMz4DmlcMo8vTPKfOXDmF9TOMV2zCg91zHdZtAp
 1jMRHQ7NCFgZCxC6/FSMP+/IWMRdRg7DYHEXzXLz3j5Fr1s2iKzG+AeYQ
 hcaoGI5473BJxwyFo7mlKwUq4k2q4g7dfVq6orCRSjRMPW3zSbDmSeyyl
 vZGYZzlRI06PuEr/gNflnwHErfCE2zH/wa7IpXSvFtWKuRINOifNEBJvz
 sePa2xqj0hxfoIjxIIds+IInXdiuFwAM5D1T2dzOfs61X+f7P709JvSpl A==;
X-CSE-ConnectionGUID: Y/uPsKRQQuycwWZHDjHwLA==
X-CSE-MsgGUID: hnyMAfDJSRiTyRaL0+3jtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90497575"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90497575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:05:27 -0700
X-CSE-ConnectionGUID: KZVOKeRYTdGPVjqnBTgG2w==
X-CSE-MsgGUID: EDOyaTNxQFqtsj0+w84p2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279721174"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:05:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:05:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 02:05:26 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZleXiPfRQZTSYfE8ESVOPLyYr06LDgZYDNoMZLsB30fI+l0WF7iJyBiVVwQ4eVzE5ArCKaWBzqKiJTmskH7e3nf+J/cddLSIM3EsjTzhVmYk8upY+1BBt83RvzdCzmJLN27iShmqeMUglrJewTRzB5JJw6r/RBtTkK8+90D3mtfzZi5tz7Sj494yyKibyqXapKiwcq6wnYcBtUaz3pPSsuNFPfZoC3QxPWXfx/et8bRMv1wqmuYan9w450KyHQ4XyIUIaXCemAOD6zQEJPv7cZJNzuk6hq4Qr4r4hvAzMop+/47aNKiOMo/miiW8SxkM3+T/ZkQHPhPNlLT3YJV41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPFnAwIgfiExOM7LHa2fPIUsBhj+hB3IL5YrKIsSVC4=;
 b=vNLLluQsukyIF2ngM2cOyL8kpiMIL7g5ifWbVVLCBUisVt2oNurD0KECKKty3+CIoaCCRmELH8fiwiVsz1r3bnBWC0FctIcRbjq7kzDVYyigGbEIZdwLl2wazgTBKo3hdwdA/RUuxx1q3Qi5AngUrMM2ShM/qZy77RQaZCN6fGI3wFdAeF3w4SQOov0VabGsJ4QblQjl2LbOrGuOM4MFnLkT9vudWLfieo6tz9f9YnXwTyCx+fJGABP7e+S3VpnJFuEbnafVa+3O7AuNppQXN3+pOz6tGbYQfB2YKdRG2ltfjNh+SUcxgpquTxC6liNQln/OIqYdIBUBIBO8FqhhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 09:05:24 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 09:05:24 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: detect
 links that failed training
Thread-Topic: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: detect
 links that failed training
Thread-Index: AQHdUXVssQrTTyfD6UuRU+1G7yeyHbboZG5Q
Date: Thu, 1 Oct 2026 09:05:23 +0000
Message-ID: <PH7PR11MB6796BC48076798B9EEFA1F1BE58A2@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
 <20261001073703.5067-5-kunal1.joshi@intel.com>
In-Reply-To: <20261001073703.5067-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: eb706a53-4736-43cc-6ea3-08df1f9b20da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|4143699003|6133799003|3023799007|5023799004|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 1x3HQnAPgJ+gjKMCQv/i0Nst/FoMLkUrA3Ri/AI9ajpwsL11gzfHn5utZoU0TxPTVaTOojOVcRr+J49hCICMNd2r9jb2duFZsVRuXSLhQTaa34IitdPZ2SHn6Qv4Z8Hd6Hi70EhefmWIocRmVtY0NS9rpxWtKhQ55zQ9/iw/ihN7VmmhnGt6FuTh6Zt8Olb0mqBlnnUJRY6i/M2jeZJFfr9waK0XAfMD4hfCNNT9+qfZXbnsFzz+GcGLPQgCZpUCvKsjckaZJ01RRhhj4Va7MYRuNcHkZEgE3AOUIqUvN5IUGooOPSM72hzjd+veB5WQPQd+Fx66t1Da6Ea/7McHZsoR4xeSKykNnC1rfdESHPwXhJvB/ndE+Hztxs5DW9GV3Xymrpiac7JLXwBbjG1xoTBCm9XzgyY1FSNFWyyWpXtVEI10ZZ4cRsfy0WEQwcyuJvNHbwOx32cG+3FCnd6NrS1vD49DMksPNBz3xYgqAZD1pknfJ7MvLq2N2wQDqR2GfSPECN0gANeJpx4g0PZOFZhmzjO9X8BnP97GMTvphAKvEtoZ4PmsP4iceaGAJoBhhc7ZR8GSERFb+rVfqf9i1qMeobxfgDlxE+ZziuVzrwlpO0P+RQYUSIH035O0yzn9Ypt8EWSUc4rnv8U2+Fllv3frMt1iL5c95meXFL1/2lz04SnUHHNRovunYVa00GS1a4J4GyUf7KFzEeloHeTi2tn2gTxEPXCxGWi1J7WeBuQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a1sGiwSTg1FctL+jAlBDFzRvH/NrFPlwIZPzTqEyMgtP5AVZOleg0tjihL0O?=
 =?us-ascii?Q?eOPKpvLYg8oe9JXrx+xFL7NTSjIXS2PctyCL9gZV7tx4m4zSKDJwWWjWUTs+?=
 =?us-ascii?Q?8KRdlkr+aILjQO7LsC6ZhO+jhO5tY9g3q9+bBYo6joz7OqGMcAg1KgAzChxU?=
 =?us-ascii?Q?Ynz4yozE+sm/MWFljNiVVTjp024h+5Z1m3YM6zYKsCbvYepXiuTHoXenGKyX?=
 =?us-ascii?Q?9clwSV0F0pGhJ8Nak9zb70y2Z+ZQE1BV+S3VvPKBiBy7Al9MOjBFbVCxKM1+?=
 =?us-ascii?Q?qQ6aJRTBbvuzkZ5dHT8Q1sgBB3ySsc+pAYCXvOWjcolaH5V1ieSk6nP5M/1e?=
 =?us-ascii?Q?bHNe7PWDIhgi/viOzwM6JVB81u6RDISGfP4Y2m1lwrNa3I1pKR238OrVmK3v?=
 =?us-ascii?Q?9qwOTFAp0e4Oxie/EEpIQWbWZc56RDT2MEEP4d7G9DAoEiZG/DwfyhH5d1JO?=
 =?us-ascii?Q?Ez+cagznyVDDU4AzgmriaK699GnxtrEWZBDkVs/jQ7kCD3yr1aj+GhK7LV3x?=
 =?us-ascii?Q?kxYMqUVu+v3TKP38QJAiBGuNIvw9Q4bT0cl9WtgvEQzQmZzIBB2VtBr3j5hL?=
 =?us-ascii?Q?RC3zkwrmC/8Q553p81CqoTnaZl6ewUR0IA+bI0NWItQaMx7ontkaPmwrt2QC?=
 =?us-ascii?Q?5qNOCTGIL1AF8iZ1qOlBR5nlMMtL3lEw04gcylU9GgpboaOG16+7oghaT7Hn?=
 =?us-ascii?Q?gLPGSH6Iotplk3+UumK5Aj+dQYQfrYA9LzQ+41n0ANv2j8KzuYGFMzf0/m7M?=
 =?us-ascii?Q?Mh/GwUK6WxLNAjfp7+0+AqQkQSumcFulw4K33R/Jh3Y1GgnTSlj8JsW8PnYs?=
 =?us-ascii?Q?1gz83w2PqmjdI2+GEv3qbgc7pRCYKbtpkoQI0Jd52IoPSVgIXhR9DYPVY0H4?=
 =?us-ascii?Q?ZIdzZfATpEdtj/SWMr/Q/THZSusVxgiZSjyphGiORA/00BWYQiHWA4cCe7bQ?=
 =?us-ascii?Q?UOK4B1phwG4Mkhin/Kyl6if50CEpk5U1bdRu91jvv/g4rqCiaMqesnzmB0P8?=
 =?us-ascii?Q?Gpn+6J4vjIVId/eCe+MpUtGkqnA5pu21mDX5fwt5CqkG1oUqW3zJgpSme08v?=
 =?us-ascii?Q?kgdjh23t7r1ZpTcWGwns1su9asfbbOEYqZidWjIjc/+Jh1p3RuvZXqLMPoQa?=
 =?us-ascii?Q?0JvHnGY70wlaBatwX+g6BBSHzZem+ItAjEp3I98ZoNtO/+vomDyMeXIQkq2R?=
 =?us-ascii?Q?GOBZHFFx2j5yXXUoAoyRYCGTWUQQhiAGWNQRHqlq9x2LDrvQOO/SoVuBY2Ks?=
 =?us-ascii?Q?uJrpyNd0vIbyp160P4Hu+tflj9/KpUReIBWd8dfiQGiPtzlI0QXrfxrfLtUU?=
 =?us-ascii?Q?72/S9kBHWumZ5UHg99lnlvCPzaj5rcQ2JjSjDVR+ZP0+3eEKQxNWZ5Qd+yFx?=
 =?us-ascii?Q?nXOeYjrCONqt8Yb/HUVC8/PWOulO3jBqLfr9FURO921efHKpRH3K8yUw9Uov?=
 =?us-ascii?Q?vTyToP0hwRNRKBe6PCmquEIHOGfo8RRaw5QDL0jdhln9lWH8bgfOxz2LxKt5?=
 =?us-ascii?Q?OqjH5hmtMLZO5bsBPMf+ZLy1QbsvwgxwKUuTXACqpy8E000J5ayP+OqkErnQ?=
 =?us-ascii?Q?9PRg2NgH2pMYVTMwmmbvIDmZMhuaIv9IOmhdFeGX9BI+blza/URqwssGBhjz?=
 =?us-ascii?Q?aDeqaL5RvDBhGNvHnbeY3OddQvVlEJ00lPVVxDyOSA/4r1rvKpoPBf3ceZVM?=
 =?us-ascii?Q?quVGr2/qSNL2K0G2i4CWu9gzXLa0TwELWU1C8AD2RMfNdoGr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O18A1dCE1S8/V81TQXLCH7SsbeY+J3jvf2pvU3fDWM4RF/AqRU2w23d+NZvZhSNKbu54yNMVOqbfnt3leEWVks/N3sQ8/wZwz0Yb4o3FBjRStN9WfzY5avH2bUHyEtuOI0xuNeiu7FEefZRC6e7UyPP/2glkw55ZaN61m//SZqVkimQConfzvjBX45wEghXmH0pu/RuXACUxg5PL4yvIOLMkFeSQPfy1aQozygYR1vzwVxscMKDg15NTuKup5++Pr9Y0Sbw5dU/smrmD4uj70wfho6bzUkDgHJlUmidGAUc5HpyEmav4vjonJsc43H/PznK8G+BcnqK/NOvWCovHqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb706a53-4736-43cc-6ea3-08df1f9b20da
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 09:05:24.1392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bq4HQWPv7+38nLkPcJKNctXmvBvCTfHwG+PGlpfkoooAqBpE+R1Vb4VT+a5xA3JPfffIT//mN0YZ5Tix7vmlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 01 October 2026 13:07
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: detect lin=
ks that
> failed training
>=20
> The current link rate in debugfs is what the driver asked for, not what t=
he link
> ended up running at, so a failed link still passes. Nor does link-status =
catch it.
> With both rate and lane count forced, there's nothing to fall back to, so=
 the
> driver just disables retraining, and leaves link-status GOOD.
>=20
> Check i915_dp_link_retrain_disabled after training. The driver's own retr=
ain
> may still be in flight, so keep checking for five seconds before calling =
it a pass.
>=20
> Drop the FIXME. Note that this may start failing links whose max config n=
ever
> actually trained.
>=20
> v2:
> - Sleep before reading, not after (Sowmiya)
> - Rename to assert_link_retrain_not_disabled() (Sowmiya)
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 59 +++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 595d78d98..8d079ffb0 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -29,6 +29,13 @@
>=20
>  #define RETRAIN_COUNT	1
>=20
> +/*
> + * How long the driver's link recovery is given to reach a verdict, in s=
econds.
> + * The automatic retrain is queued without a delay, so this only has to
> +cover
> + * one retrain and the fallback selection that follows it.
> + */
> +#define LINK_RECOVERY_TIMEOUT	5.0
> +
>  typedef struct {
>  	int drm_fd;
>  	uint32_t devid;
> @@ -99,9 +106,48 @@ static void assert_link_status_good(data_t *data, boo=
l
> mst)
>  	}
>  }
>=20
> +/*
> + * assert_link_retrain_not_disabled - Let the driver's link recovery
> +reach a
> + * verdict and check it did not give up on the link.
> + *
> + * A failed training is not visible the moment the forced retrain flag c=
lears:
> + * the driver clears that flag when the retrain modeset starts and only
> +then
> + * queues its automatic retrain, so the first failure is still in
> +flight. Once
> + * the automatic retrain is used up the driver looks for a
> +configuration to
> + * fall back to, and with both the rate and the lane count forced there
> +is
> + * none. It then marks retraining disabled, which is the one place a
> +link that
> + * failed for good becomes visible.
> + *
> + * Poll for that verdict rather than reading it once, and give recovery
> +the
> + * full timeout to reach it before calling the link trained: sleep
> +before each
> + * read rather than after it, so that the last read is taken once the
> +whole
> + * timeout has elapsed rather than one poll interval short of it.
> + */
> +static void assert_link_retrain_not_disabled(data_t *data,
> +					     const struct i915_dp_link_config
> *config) {
> +	struct timespec start, now;
> +	double elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	do {
> +		usleep(200 * 1000);
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed =3D (now.tv_sec - start.tv_sec) +
> +			(now.tv_nsec - start.tv_nsec) / 1e9;
> +
> +		igt_assert_f(!i915_dp_get_link_retrain_disabled(data-
> >drm_fd,
> +								data-
> >output),
> +			     "Link training at %d lanes, rate %d was given up
> on.\n",
> +			     config->lane_count, config->link_rate);
> +	} while (elapsed < LINK_RECOVERY_TIMEOUT); }
> +
>  /*
>   * train_link_config - Force one link configuration, re-establish the li=
nk and
> - * check that the configuration took effect.
> + * check that the configuration took effect and survived training.
>   */
>  static void train_link_config(data_t *data, bool mst,
>  			      const struct i915_dp_link_config *config) @@ -
> 127,6 +173,16 @@ static void train_link_config(data_t *data, bool mst,
>  	igt_info("Current link rate is %d\n", current_link_rate);
>  	igt_assert_f(current_link_rate =3D=3D config->link_rate,
>  		     "Link training did not succeed at the forced link rate.\n");
> +
> +	/*
> +	 * The link parameters read back above are the ones the driver asked
> +	 * the sink for, not the ones the link ended up running at, so ask the
> +	 * driver whether it gave up on the link after training it.
> +	 *
> +	 * This has to happen before the next force: forcing a rate or a lane
> +	 * count resets the recovery state, which would mask the failure.
> +	 */
> +	assert_link_retrain_not_disabled(data, config);
>  }
>=20
>  /*
> @@ -222,7 +278,6 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>  						   1.0, 20.0), 0);
>  	assert_link_status_good(data, mst);
>=20
> -	/* FIXME : Driver may lie max link rate or max lane count */
>  	/* Read max_link_rate and max_lane_count */
>  	config.link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
>  	config.lane_count =3D i915_dp_get_max_lane_count(data->drm_fd,
> data->output);
> --
> 2.25.1

