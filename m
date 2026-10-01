Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE56CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 09:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806FE10E253;
	Thu,  1 Oct 2026 09:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAzl/Skv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC010E310
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790845565; x=1822381565;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fMGGxmfQz/ewIlBhSZ34DsVbaUAlFBUiv15I7jWnEwI=;
 b=XAzl/SkvIoG/Dn3g3fsR9nx2uM7hmQmVokcmZICbWkwy9Ng9uHZKPZUC
 HpPoYzI6E4n/kZWPUnFYm20MPi7wxUBONRwnhp9Mj5z/U0u4GVKHOHnK3
 bx3f3CqlaC9kAB1tIR2dtOiBFXIaqfX69YcMLL7KAwc9vdKvwp+72mlr6
 2wEYH3/bYAtca3F1P8dnoX9xM7N0poiuBjtQZGwpp9zrSDRy5mcCd0yp9
 1WoGdaQ28EFlA1L8DOtiAiok49aA9063soAYBS82feJy1b6fC7Mkecy7a
 20Us+fDiItxiOwDP2N7N8GV/h0eFuXhnFm7cdTUN+A9zz9iOjTCxI98uu Q==;
X-CSE-ConnectionGUID: ysTskiF4SXCPz3YfFJ2ZQg==
X-CSE-MsgGUID: THS+M8FNRvGCiyZlo1/L8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113384997"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="113384997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:06:05 -0700
X-CSE-ConnectionGUID: HZcHOGJbTaCjBS4wzIRJ0g==
X-CSE-MsgGUID: 6gBOGYZrQlOxN1Pdtf55Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="273747212"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:06:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:06:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 02:06:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 02:06:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMOlkG9pN3R5l/PlaNSQvEhoa6/f5xH4sFRqaj41DRTBrFTnxYiHkYUT7WhQA6gs3kdbP38n97iVImUjEMwI8Iu9tYjmeyigzhpd02ZLp5el8deHmDsr6QOnaPblRuSlWF1yhWehG5kqGisALDoklTn3Vaph4Fp+tzkOKT4ymLcaVvMewcI3kXJfCXgBVhQFmppIeKdSFa3UsNQjKRaecMpWp6snTLp3ok89/TR+K4UtWEGg29vVQZbOgcRC592eZ12QNmyG0pu4fhEaE26WP1J2G8AVCShev0c+idyDE5pvZXs6+owDQZxHamVqz7f+Mso/NPXX7FipO65MjLMawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Aw+c5DII7Jz4eLwWU755QPqamnNthIemVWIkLHW2M=;
 b=IOU6IUmOCc3gMBx7YkKF4HoRa2m5uqxDxAt/a0rZNvX3ROaWrmiPcF8yTuzhWyV8pbRiTgE5lXg3/p1D1t1JdpqRZFpfz8pMk3oHK8zVw5qOyZfqFRHhvcU652KBGSPdoScsM9s6aYM8cF4w8xtL+b3kd6ov+l/g560OOvAJy4ylhcjn7Xpyh51qXBRi531J2Vs5i5BnYhFlWHKYO+7A7eJs1yGCDvd2bPKTP1wosLeBW616vmfFUELXqbgCfNiyPfuqT1/lJquJLL6Eu8bLj3SumYgehfWvGfZyRdosFpiq/KLksBy2st8vQIwC/gs6oV0c1tM3CE1vKdDepFsYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 09:05:56 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 09:05:56 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: train all
 allowed link configs
Thread-Topic: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: train all
 allowed link configs
Thread-Index: AQHdUXWkLhWUjK/NwkK9/R2y5a6ZqbboZRWQ
Date: Thu, 1 Oct 2026 09:05:56 +0000
Message-ID: <PH7PR11MB6796521045FBB6A276511A73E58A2@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
 <20261001073703.5067-7-kunal1.joshi@intel.com>
In-Reply-To: <20261001073703.5067-7-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: ae6d5ec3-94e6-4cf9-19e4-08df1f9b3405
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|4143699003|6133799003|3023799007|5023799004|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 5JOxDPa/02avioU5ieuibsFI3Kd80bKcTRUwYB2tr3lHA1B6vu7dCe7WxNvYQx6ehuODDl0b7ZHAGf+lt0hcTXEeQCwYX2FpruVRKRmRosBwAikK2TSvaPJy+ojcNQj2M5TikelpAe2nli/1wERQOhMTpaN/xGICP3smeexEIL+vVe29mSMu1xdQ6pNJxKM4RLAzJ/NdF1mR6B2pzBZSAtWBsTgTrnPympfW5E7KYT6Pd0cEVShE4a6jXpHpiTjyD4yLhJ/gN60jT+/jqb6uvzapQSyvKRp8AcFvpt6oMMg9haLPFXRm6rKomZ1/sWCHD66k3jJcUFT9vrcHu6kn0cVQa5moZ37J1vQTP1flyfXk2UJ17vH0IBgU6gfbTvueskRFJDYEAY2Lg+s9KCna9o8vFpaC+sx8W1uqf0GDkOx4CBplWWSPsPHQqe0Yms+Jgbr4VzF28FpQRnWsL5YLwPHP/LIV/9rNsxWuyabmDNs6KJw/hnglSEpmp8nKIiYxirbpvBKmk9num2Qi5WGYhQBcWZGtjbSM2JXA8c8dyKmobFBvHiDYbVZVRa7SXUtk1pJ0Ln+FheCRidMuoRGHV5gSpLlulvwjSHTLXSFK84zyA5oecY5RXn60Imp/OBHbaF/s3+S+2bfgSvePM1xrfo079UzYabB1y6THOjfIIxoykgBlcIbV/+bth/zJ+P6kztD9RqA7k1XptFVXtXDtPREYGauDV155M7itvNImRCY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ON1hFdKbOqKsvUnxRAvYhWhmG1k2yVF05Lp2e+SLIyZ3B5rqdg69WldvmyBD?=
 =?us-ascii?Q?6TPsvKrAP9Jy85ziKmHBFexyPb8WgxKDvoIeUT2mvO4269x5LWV5QYomV+Io?=
 =?us-ascii?Q?Gc0fBL1rgyeq6cRZUIj6fT2RhWpXKifHliHpcwCclgwDoS2+8dbXgZsjmoUh?=
 =?us-ascii?Q?ckSq5/8ZKLrVqd5Y5IPYJ00OX2hHBfJExvHZxFP/isqN0iUaDCyNf4WkXecl?=
 =?us-ascii?Q?m/oVGF1Hjh4YfZcHll2o16RWOXrJTdW4jXOIWWVEEYtR89fPzZTZ3FkBHwfR?=
 =?us-ascii?Q?XzNookp9cBJdQfMRuri3ipxqr1bQKOCdBN9Gu2O9MrEa8PJgPoBAZuBwONw1?=
 =?us-ascii?Q?3MmP8d+0yyA3kF4nj/PEW8GlvMJVuiuz6uQVJki6ex7jLuodr1SzELRrlzif?=
 =?us-ascii?Q?kJx1OYTILWpgvSPTZILl0ocHQuhEb+nTrtFESlKT+h1fd38/EyoCHH4XMgiJ?=
 =?us-ascii?Q?eFtguxdbs3MmEMNN9YLWHfV2jwIqZwFKKkvOb5wNX07J1UNZwKyzC9fy8yIQ?=
 =?us-ascii?Q?QJgIW+GLRMIVY3t+oX6zMy8IxMYhI5lujrEA9Yq/BWJ9ldVezD+ydgRa8D7u?=
 =?us-ascii?Q?WGS8mAnYSzODzpTlh4h3QOPwa23mncin6DgSNS9d/KkJ7kOQ5LR7EIFv7hIu?=
 =?us-ascii?Q?/dGOM06IM4mqYSPAHmUxe86+vadAU899loMobtCxVbSnmm8ALUxy6PY4c+7E?=
 =?us-ascii?Q?yBrUTnfXQuxho6BY/4j7UNIa0kVUUynFkI8e1a+5xPoVeGtlaJLU2Q+BrIPw?=
 =?us-ascii?Q?ufDSNo8j12Ip+XUlkSQUiAxZXq2nQxP+K9W6kpc0GEGsbCij2cvB/wEFkZfF?=
 =?us-ascii?Q?spXpyNgFbTGYiIiG/G5N8ftw6ucxGZbORTZxvrt7NwQw1gOr7ClAgki0CTSq?=
 =?us-ascii?Q?906613K/qO9Hhpsvj7mhSi2cp2ryZnYstebJ4TD09ZBiHe2d0i2zsdCGOkFg?=
 =?us-ascii?Q?Q8646WnRh4NU/jpkFFrVJRRJnRKFRM3k6IHK1z/pwA8OcKCn6AeIYQt6JeFJ?=
 =?us-ascii?Q?I4wCqP2GxKz0Cbu+Y2vbXZk9iLHvkygpRjNnYtXnI9U9tPdFKS1HjbeTcWi/?=
 =?us-ascii?Q?UPMPfQN5UNMT8y4/4Y8LBCOi32yoifZJpK9Y4tSs895egS/JRY4fzaQc3prm?=
 =?us-ascii?Q?0SfJCOi1wsSQAKCtigJWX69ocWuobWr9Xjov14yC3I+yCmVE75DSPYHgBZn/?=
 =?us-ascii?Q?9DU4PAefNFNwfrrNkXbJg9Du5ZsTo1yQJ5wef6ePo+uCcq35Z1vOzt8EHbwt?=
 =?us-ascii?Q?DQgwwOpdXGqKUz4lMwuQVmWuXYnVrczkk2P/1MrmqzUtIJt3aaifAN4kjmsl?=
 =?us-ascii?Q?Jh7QV7lxae8S+vv/QqUfUlULA7htWCsJ8jkcQzBZtzlgHn0FutCGp4NSaeeI?=
 =?us-ascii?Q?qEblf4Az9p6DUTMPLWg1MlKM7BWqnjIXUZpupl3Gfzq1hBXEzfq0wywnczts?=
 =?us-ascii?Q?w0aOgrSHVh0yOTzcwCEKjQMJSxshM7H5A6CCpv3p8ulIZdIw3ofxUDnyQ30r?=
 =?us-ascii?Q?CoVEyPQ6nw9aTw0fFGdmFrf9KAb4S+ogtTf3HzGomC+gH9NM9W2Wk1VI9wGY?=
 =?us-ascii?Q?AfmwbnVJMzETbps5RBoqV/sst11ZpBkIxu7ltwDAgUSkQi63UiD6fca+KIEC?=
 =?us-ascii?Q?EJ77byu/n+6nsbXyMjF2wRdgtATdd+2s2KTK0BvLUKcm2BuuPfqfbikfDG+C?=
 =?us-ascii?Q?J1OuLO9UYQetuMUgXYmauYKGvJg+1KuZ5yuo2NBLZW+sLsh1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jKFfF9n4h+wAzJKNLO4NTOB8Dz/VoOLMa1eQYALCu4R5DU++I/0icmOHk8RRB64eP7Z7yti0cRJ1W33Msn9st5v6paIUF6mIuJ/+U+6oUjwi+C6VVOrdyvqdQm10X3ghS0CC8be+Sz8jcfYGIF6k238I2csMyq2NkA+z24UWKe2AZ43JjBRFpNWbKDITQvI9atdcqtq2zxQ9di9JbrXWaIRb7K7hM8J0KobqfgOJ0xDrBnVa55S/sR5eZT/EAK8MT5na8+GZk64HcVa4x9juSL5tVa/5PgF68Kjzu7jq2puGCCGb3kSk+TKo/BYPCVZRPr/a/4cSwoVfYBaitvpcYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d5ec3-94e6-4cf9-19e4-08df1f9b3405
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 09:05:56.2507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CU2GtBUKEqI6525COBAJCarKdaPF3oPp0XtrhaifznGr8UTZ2qhqnbya3AbvhfW7bDPNr+35XTCK0yL0nEhV7A==
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
> Subject: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: train all =
allowed
> link configs
>=20
> The test only trains the max link config. The lower configs, used for fal=
lback and
> for modes that don't need the full bandwidth, go untested.
>=20
> Train each config in intel_dp_allowed_link_configs as a dynamic subtest n=
amed
> <connector>-<lanes>x<rate>. The configs are split between the UHBR and no=
n-
> UHBR subtests by rate, so the non-UHBR subtests now also cover the 8b/10b
> configs of UHBR sinks.
>=20
> Bring up the link in each dynamic subtest, as failing outside of
> igt_dynamic() aborts the whole test. Skip the configs too narrow for the =
mode,
> as the driver correctly rejects them. The estimate errs on the side of sk=
ipping.
>=20
> Clear link-status before each config, as a BAD status after a fallback st=
icks until
> userspace resets it. Check the lane count too, now that it varies.
>=20
> v2: Drop the reset after each config in the container (Sowmiya)
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 194 +++++++++++++++++++++++++----
>  1 file changed, 168 insertions(+), 26 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 76bbe3733..7125bd033 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -29,6 +29,9 @@
>=20
>  #define RETRAIN_COUNT	1
>=20
> +/* The driver allows at most 10 link rates over 3 lane counts. */
> +#define MAX_LINK_CONFIGS	32
> +
>  /*
>   * How long the driver's link recovery is given to reach a verdict, in s=
econds.
>   * The automatic retrain is queued without a delay, so this only has to =
cover
> @@ -106,6 +109,103 @@ static void assert_link_status_good(data_t *data,
> bool mst)
>  	}
>  }
>=20
> +/*
> + * set_link_status_good - Clear a latched BAD link-status.
> + *
> + * The property latches BAD when the driver falls back and only
> +userspace can
> + * clear it, so without clearing it before every attempt a single
> +fallback
> + * anywhere in the run poisons every later assertion.
> + */
> +static void set_link_status_good(data_t *data, bool mst) {
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int count =3D 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
> +								 &data-
> >display, data->output,
> +								 outputs,
> &count) =3D=3D 0,
> +								 "Unable to
> find MST outputs\n");
> +	} else {
> +		outputs[0] =3D data->output;
> +		count =3D 1;
> +	}
> +
> +	for (i =3D 0; i < count; i++)
> +		igt_output_set_prop_value(outputs[i],
> IGT_CONNECTOR_LINK_STATUS,
> +					  DRM_MODE_LINK_STATUS_GOOD);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
> +/*
> + * link_config_data_rate - Data rate a link configuration carries, in
> + * 10 kbit/s units.
> + *
> + * Channel coding efficiency is in 1ppm units, matching the kernel's
> + * drm_dp_bw_channel_coding_efficiency(): 96.71% for 128b/132b and 80%
> +for
> + * 8b/10b. 8b/10b MST is 78.75% instead, because of the 1-in-64 MTPH
> +overhead
> + * that helper deliberately does not account for. Using 80% there
> +overestimates
> + * the available bandwidth and turns a correct driver rejection into a f=
ailure.
> + */
> +static int link_config_data_rate(const struct i915_dp_link_config *confi=
g,
> +				 bool mst)
> +{
> +	uint64_t symbol_rate =3D (uint64_t)config->link_rate * config-
> >lane_count;
> +	int efficiency;
> +
> +	if (i915_dp_is_uhbr_rate(config->link_rate))
> +		efficiency =3D 967100;
> +	else
> +		efficiency =3D mst ? 787500 : 800000;
> +
> +	return symbol_rate * efficiency / 1000000; }
> +
> +/*
> + * mode_data_rate - Data rate a mode needs, in 10 kbit/s units.
> + *
> + * Uncompressed 8 bpc, which is what the smallest mode of a DP sink is
> +driven
> + * at. Deliberately pessimistic: overestimating what the mode needs
> +makes a
> + * borderline configuration skip rather than fail.
> + */
> +static int mode_data_rate(const drmModeModeInfo *mode) {
> +	return DIV_ROUND_UP(mode->clock * 24, 10); }
> +
> +/*
> + * link_min_data_rate - Data rate the link has to carry, in 10 kbit/s un=
its.
> + *
> + * do_modeset() drives every stream of an MST topology, so the link
> +carries all
> + * of them at once. Summing them is what tells a configuration that
> +cannot
> + * carry the whole payload apart from one that can, which a single
> +stream's
> + * requirement would let through and turn into a false link training fai=
lure.
> + */
> +static int link_min_data_rate(data_t *data, bool mst) {
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int count =3D 0;
> +	int rate =3D 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
> +								 &data-
> >display, data->output,
> +								 outputs,
> &count) =3D=3D 0,
> +								 "Unable to
> find MST outputs\n");
> +	} else {
> +		outputs[0] =3D data->output;
> +		count =3D 1;
> +	}
> +
> +	for (i =3D 0; i < count; i++)
> +		rate +=3D mode_data_rate(igt_output_get_mode(outputs[i]));
> +
> +	return rate;
> +}
> +
>  /*
>   * assert_link_retrain_not_disabled - Let the driver's link recovery rea=
ch a
>   * verdict and check it did not give up on the link.
> @@ -162,6 +262,8 @@ static void train_link_config(data_t *data, bool mst,
>  		 igt_output_name(data->output), config->lane_count,
>  		 config->link_rate);
>=20
> +	set_link_status_good(data, mst);
> +
>  	i915_dp_set_link_params(data->drm_fd, data->output, rate_str,
> lane_str);
>  	i915_dp_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
>  	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data-
> >output, @@ -173,6 +275,9 @@ static void train_link_config(data_t *data,
> bool mst,
>  	igt_info("Current link rate is %d\n", current_link_rate);
>  	igt_assert_f(current_link_rate =3D=3D config->link_rate,
>  		     "Link training did not succeed at the forced link rate.\n");
> +	igt_assert_f(i915_dp_get_current_lane_count(data->drm_fd, data-
> >output) =3D=3D
> +		     config->lane_count,
> +		     "Link training did not succeed at the forced lane count.\n");
>=20
>  	/*
>  	 * The link parameters read back above are the ones the driver asked
> @@ -282,14 +387,17 @@ static void do_modeset(data_t *data, bool mst)  }
>=20
>  /*
> - * run_link_rate_test - Main link training routine. Expects the MST vs. =
SST
> check
> - * to be done beforehand. Returns true if tested at the correct rate.
> + * setup_link - Bring the link up at the parameters the driver picks its=
elf.
> + *
> + * Runs per dynamic subtest rather than once per link: everything it
> + does can
> + * fail, and a failure in a igt_subtest_with_dynamic() container aborts
> + the
> + * whole test instead of yielding a dynamic subtest result. For the
> + same
> + * reason the reset here is the only one between configurations, and
> + what the
> + * last configuration forced is left to the exit handler that
> + * i915_dp_set_link_params() installs.
>   */
> -static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
> +static void setup_link(data_t *data, bool mst)
>  {
> -	struct i915_dp_link_config config;
> -	bool is_uhbr_output;
> -
>  	igt_display_reset(&data->display);
>  	i915_dp_reset_link_params(data->drm_fd, data->output);
>  	do_modeset(data, mst);
> @@ -300,27 +408,61 @@ static bool run_link_rate_test(data_t *data, bool
> mst, bool uhbr)
>=20
> i915_dp_get_pending_retrain,
>  						   1.0, 20.0), 0);
>  	assert_link_status_good(data, mst);
> +}
>=20
> -	/* Read max_link_rate and max_lane_count */
> -	config.link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
> -	config.lane_count =3D i915_dp_get_max_lane_count(data->drm_fd,
> data->output);
> -
> -	/* Check sink supports uhbr or not */
> -	is_uhbr_output =3D i915_dp_is_uhbr_rate(config.link_rate);
> -	if (uhbr !=3D is_uhbr_output) {
> -		igt_info("Test expects %s, but output %s is %s.\n",
> -			 uhbr ? "UHBR" : "NON-UHBR",
> -			 data->output->name,
> -			 is_uhbr_output ? "UHBR" : "NON-UHBR");
> -		igt_info("----------------------------------------------------\n");
> -		return false;
> +/*
> + * run_link_rate_test - Main link training routine. Expects the MST vs.
> +SST check
> + * to be done beforehand. Returns true if tested at the correct rate.
> + */
> +static bool run_link_rate_test(data_t *data, bool mst, bool uhbr) {
> +	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +	int num_configs, num_dynamics =3D 0;
> +	int i;
> +
> +	igt_require_f(i915_dp_has_allowed_link_configs_debugfs(data-
> >drm_fd,
> +							       data->output),
> +		      "Kernel has no intel_dp_allowed_link_configs debugfs\n");
> +
> +	/*
> +	 * Enumerate with the forced parameters reset, or the set being read is
> +	 * the forced one rather than the one the driver would pick from.
> +	 */
> +	i915_dp_reset_link_params(data->drm_fd, data->output);
> +	num_configs =3D i915_dp_get_allowed_link_configs(data->drm_fd, data-
> >output,
> +						       configs,
> ARRAY_SIZE(configs));
> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		char name[64];
> +
> +		if (i915_dp_is_uhbr_rate(configs[i].link_rate) !=3D uhbr)
> +			continue;
> +
> +		snprintf(name, sizeof(name), "%s-%dx%d",
> +			 igt_output_name(data->output),
> +			 configs[i].lane_count, configs[i].link_rate);
> +
> +		num_dynamics++;
> +
> +		igt_dynamic(name) {
> +			setup_link(data, mst);
> +
> +			igt_require_f(link_config_data_rate(&configs[i], mst)
> >=3D
> +				      link_min_data_rate(data, mst),
> +				      "%d lanes, rate %d is too narrow for the
> mode\n",
> +				      configs[i].lane_count,
> +				      configs[i].link_rate);
> +
> +			train_link_config(data, mst, &configs[i]);
> +		}
>  	}
>=20
> -	/* Force retrain at max link params */
> -	train_link_config(data, mst, &config);
> +	if (!num_dynamics)
> +		igt_info("Output %s allows no %sUHBR link config\n",
> +			 igt_output_name(data->output), uhbr ? "" : "non-");
>=20
>  	igt_info("----------------------------------------------------\n");
> -	return true;
> +	return num_dynamics > 0;
>  }
>=20
>  /*
> @@ -388,7 +530,7 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive UHBR rates over SST");
> -	igt_subtest("uhbr-sst") {
> +	igt_subtest_with_dynamic("uhbr-sst") {
>  		igt_require_f(intel_display_ver(data.devid) > 13,
>  			      "UHBR not supported on platform\n");
>  		igt_require_f(test_link_rate(&data, false, true), @@ -396,7
> +538,7 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive UHBR rates over MST");
> -	igt_subtest("uhbr-mst") {
> +	igt_subtest_with_dynamic("uhbr-mst") {
>                  igt_require_f(intel_display_ver(data.devid) > 13,
>                                "UHBR not supported on platform\n");
>  		igt_require_f(test_link_rate(&data, true, true), @@ -404,13
> +546,13 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over SST");
> -	igt_subtest("non-uhbr-sst") {
> +	igt_subtest_with_dynamic("non-uhbr-sst") {
>  		igt_require_f(test_link_rate(&data, false, false),
>  			      "Didn't find any SST output with NON-UHBR
> rates.\n");
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over MST");
> -	igt_subtest("non-uhbr-mst") {
> +	igt_subtest_with_dynamic("non-uhbr-mst") {
>  		igt_require_f(test_link_rate(&data, true, false),
>  			      "Didn't find any MST output with NON-UHBR
> rates.\n");
>  	}
> --
> 2.25.1

