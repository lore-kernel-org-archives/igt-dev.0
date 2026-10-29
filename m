Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AF606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lutq7L94
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127CC10E17B;
	Thu, 29 Oct 2026 03:04:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6E510E17B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 03:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793243033; x=1824779033;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sYZBLg7FDUfoAl06CpGDjnvGTsCs3yi5e/rjpmHP/Jg=;
 b=Lutq7L94qZ8keLf5uzzxsbyfAmvGYZeeqB8qtMxa27Kx84uyQai8cQBp
 UROwE2vRotdryU1M4kbnSK1RQNJsDu5ugO7gDJbWEReVh5yH/LHvS1+Lz
 /mwgWKrx8BOJoxuQYpddRpY2tzTOZ+kUUdrHWx94gUQH87f2k3yIXvIHd
 qK1Lxm65PmIdWUZRhbOoQFlRleiV2XZchnEIcKZHaCIOuYnVBEdl0KGuh
 w2zyqdXxxHFGGwCJNblK+TOW9DM/XzvlIZm30zyOnSUKJnKWW/DMdVHnH
 W8+fXzt8GDRQGI487CXtgsI6sjmkzgHjN0WxkGMU/p+JUyj1rK+wyfOuC w==;
X-CSE-ConnectionGUID: VLA8n1s1TfWqC7M1dJ29yw==
X-CSE-MsgGUID: dQA6GWWCRci9zc7swtbWIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1871845"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1871845"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 20:03:52 -0700
X-CSE-ConnectionGUID: s8nJLVkVSYG3trmJEwCC0Q==
X-CSE-MsgGUID: 6y2ywLiQQnG53Ly+74nbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6835599"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 20:03:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 20:03:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 20:03:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 20:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KV+PkweJ7rZDIPYyRGHpmUP34uu2BD5xjckjhWQDvjYsUHCXtm7dfMgOffqWWltRiPCUre9lMmeJzRcdN79u0KsnJC8DN9u9hrkfH04eUNVAvWHkXBDoDiqvf8zN7pTxpOy8RrgZztxsdEcCqH9ap/oMPExBG4TeuI/fhhQXRZrqWK4SyxA1KhqW57SIAIDxwmGZCWQBs2KEkoOUmL6B1MA+amNE5lZyYwBMjg4aEjSmN3cEwlweVp3a6UEKAlZQlTUKB5F8JARWfj+mLp+eqUPyM7cp6biszZwUkflnTr+1epBV0xe/UCf4F7DqWU/dVNUhuZ/JM4HOXE2ttLYiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wn6jamEL7zUrUqlz0aiRxEbKNKDWVLrj6bft7v6rYw=;
 b=qx0kD6iQPCxwZUbXrmPEap0BsGpzIx34xebo1BsI2lugwU5W0wBXYgsc9SIlcgGS1E95nlpOUlBcVq/WG+zVYNPZ5/1UdkOdOkNPeapPeGpJrSF+uLcGwK4SwooBTX6xdnunJuuxmnEBzRPfjZHgRBTH6INnTYCLvvotklCqNlfeS8cXYhQSMMkyTiFBWcYNEJkpJe26hSKT4cxaKJ8kxDeoaS4Tjx5s15elpwl9Zyj/nSOzDeweGKxQwrS/PGuk3Nk5nE96sALxNpUBLAuNH+sNcQ0AKl3xXl8EBwZlX6ShE/yfSgTQg2Oz1S6/rql3YZXYC53SQSCdN7JVYOpHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MN0PR11MB6302.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 03:03:48 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 03:03:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/kms_link_m_n: Add DisplayPort Link
 M/N ratio validation tests
Thread-Topic: [PATCH i-g-t v1] tests/intel/kms_link_m_n: Add DisplayPort Link
 M/N ratio validation tests
Thread-Index: AQHdXZju0wfhdCkj0UCSaX5mJsyBybcT6LXw
Date: Thu, 29 Oct 2026 03:03:48 +0000
Message-ID: <DS4PPFE901A304F4CDAAC139F8C27E685C3E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MN0PR11MB6302:EE_
x-ms-office365-filtering-correlation-id: 84eaa8cf-b31d-4c6e-1006-08df356940d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|261026135527099003|18002099003|22082099003|261028144727099003|261026140227099003|3023799007|261026130827099003|10067099003|56012099006|11063799006|261021130227099003|261021121427099003|261022113327099003|261022115727099003|261021135927099003|261021133027099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261026121527099003|38070700021;
x-microsoft-antispam-message-info: +/ZGg5jqAluWWDKlkjT3XfpIrvBcUcxcxO1FGMpLi+kUZ3Jx+pMMkgyVWUIdrsTpDmVR0kZxYD7yxlL/X517FTDZ6M53kjX33Ctjukn8bE2QVRQlAEqYITD/eMtHBPYfwf4FsZA2nC5V8fwSfoOkQxQ3rP2oBCQ+gU1AAeDjov3QAvpobgKVQl5xbGjggoHA8DqxkFi/blY8CRgbLbjHKnOSC9r6b/1oiAYg7AGp2LEr6Ksz6K4DeD3veLuYWxOMqURtvFqQaSK0OI5Y3aO60jdaV3x57IGrAtPPJ5LGJZ0qMMDuB93MmfdywaGQ5yyL0I5IDtVZj/vxxPH8rErN50vp1o7a+QDoG5j49v9fJNYUiV4R1hii3pbtsWj5ytY7drUQRbPNympQed5XpM/d8SNh8iy1CWawF/7orHlyqbcYY2TRpjBFz7PaYxW1YyUG5N8/lO1scjCQgNvahl2CoP488aXS8j+fyi3Sik1ZVeAI0Hyb0p5k9v779hlfgAK36/EJmBvRSTAAfr201XWvdhjFQM1yQ5PmP7Rq58JPMK4TUFUjh/cOWwMHwSgmsTTIMBeMBaSO/TLu44cRH2P07q/wa9BUUUzG/zPXFRBAJWqjE3G0Hzak2yLTppN1EIsZPPFLTHnNWR2ckZwAW9MitE1mVK9qfa4Ix5cjBAFPYt/nZ+6yv12TeNPoZvQFV/SA77NfkRTbLqboDEn8qXoe0jvB48Nc5/I++H0C0/iTJx8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(261026135527099003)(18002099003)(22082099003)(261028144727099003)(261026140227099003)(3023799007)(261026130827099003)(10067099003)(56012099006)(11063799006)(261021130227099003)(261021121427099003)(261022113327099003)(261022115727099003)(261021135927099003)(261021133027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261026121527099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/rMpKYZmXn9NcUkcMa+FjnHpFKMUjbscq/jmc+UOocPBZEHSMMyfbGtIoVI9?=
 =?us-ascii?Q?YWawLHKsOGrR3Azpcwjbq3NwMGxJnVS1Rf91SBtdyUq9gi0eMWFQtaagU1FX?=
 =?us-ascii?Q?8PFTjXnD+TZJwRgHzOua9I0bKmMae5wg4jisVs8WAlzkPQ9roFltKCoaTiyL?=
 =?us-ascii?Q?nWzfYccfX6f3UWNtUmTigH6isYtD6/XOlWTcxlQejiMuuvgVSOQy3fGoi1LA?=
 =?us-ascii?Q?LLSg7PWFfPBADa5t5f4cqawneIUN5ELvsh+wEdgV9g1G8Zqg0w59Ha1hMX8M?=
 =?us-ascii?Q?/VIpvKILgGiOM0fuhBZh28X7QqbRib7Ti8feJBCSzdHMOh+5DaiA8zAtK2qi?=
 =?us-ascii?Q?VhZm7vYjIMF1zMq4vvxaxLxON7aKoFgjSHDaXOG3xtIRMPRu4FRcuUwzcPTS?=
 =?us-ascii?Q?7ZAg8Z4go9trfW+hd2IwC8tlQgjalsVbHd+uuNQL8wIEUd0TfatYSYlQEr6o?=
 =?us-ascii?Q?1X7i/psb0+LNL0oye/PSXLnTBXom8YpRHGjfOURc4QYghxYAVGJ43QPXHIDL?=
 =?us-ascii?Q?MVBs3p016ti1YKO1axMI7i8LOyrRFyxyzkOuHdPNC1BH1DhEL9JIlBvp4BwA?=
 =?us-ascii?Q?/Xdsw85XxQe5tA1PwMxrzuVdhtx+ELuFKizeh5intVV+I1TWuWwM0Yc5JqOJ?=
 =?us-ascii?Q?mwTT9oCnNqv8f5jKEbpHGnHa4nyvRmJJ/Uk8CtjW7npcpz7scs9mIz/ek9Vn?=
 =?us-ascii?Q?r+OhAxjrX5ddh+O4gt3qqWwoeIJ7RBe+XsBMaCxeC1wlVhHf2VANWIEILC+V?=
 =?us-ascii?Q?f0WWAi4+yRwWBnb8QTBghnCms8YVHgGk3w1B7ISzJOx9WNV+cS/d4cuMnWTs?=
 =?us-ascii?Q?rp8iALKOnmmy4HQ7jRnXodWSa8dDf7ALwomEaFegtqLWnGsk7R2xAbRAfYGk?=
 =?us-ascii?Q?Hkhetke2jEhiPd8SuRi49QzMOSV18KBPAkFNXgBumrWghAV8mlyDgwaaw3f4?=
 =?us-ascii?Q?Ic139hWlrOogxURCBYNHXKfkv0pVknxonNjFAieqNII+/q+8UxpufLB36ORb?=
 =?us-ascii?Q?/YWql/YNXuYsIRVqNGH9XRAfB/LZLaUra7MVYiTM8nAUCJjB1N/Jipsf+wE0?=
 =?us-ascii?Q?rtIWZRm9m2ilTjuqtZP6CyIPQDV4l1mbrW3SiR/StU+ZRyAOAsf5I/dew3lm?=
 =?us-ascii?Q?3rtkNqFrUEztzn+LmtMggX3ErvOViAhH/FOY2RVYKAUzpoX2mDsSc+RC1GKe?=
 =?us-ascii?Q?FnHb1oeoZjisSU533hTRdeEaOUUpu7G9sIb1ppCMr9kp0vu7P3Z39ebWv+sd?=
 =?us-ascii?Q?QDm/qVj23TTZafwlZpk3EaaAtwpgxp6fJS6d6S4ohXxZVSvcDXd2JPoJCo8k?=
 =?us-ascii?Q?2pwY186+RxfcD0Li6N97H6FQFyMayQ3BsZAVZDetgof0lBFA4LrU4DaubCjx?=
 =?us-ascii?Q?9PbmHtVv6K7Ve1kU3IQwp9EhvXWGeAmL2MQckWPmuTzMcIf5PNBZIi0o6nvl?=
 =?us-ascii?Q?FQGZnW0pPCXYRVzM7YIQ8liP2X84mtt1av9yfRNswDwyatbidixI/uGqG9V4?=
 =?us-ascii?Q?ZmSeooHE8B4TO7OQeIiCIdU5Tp0gG8hjsiub3bt+yooRZ0Wb3uOz3AMBnOp1?=
 =?us-ascii?Q?el1In+kAIVKNeaXHyeAVSBGL80t8fpYSXiLTJ+OsmTTfQH50j99q9GolPBBD?=
 =?us-ascii?Q?tNjvgJVDwk+uxI6bx8Eh1eNZC+bS1fKtkvAfEeq1L1T+CZCCZzZz2uM8tcH0?=
 =?us-ascii?Q?ndHdA/EKPvM+rb6UEQGNGem0yDmUybjSnEAQITtRR+cnod+JBOllQzzySMTH?=
 =?us-ascii?Q?7oBGy1l+/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fAL1pzM3jFSqjAlp8m037uUobkGG3EBTGvQ2jQA1rvd/kE69X4QeBezhUssBqkAK/0yR1J1I9rCuhst+9arSrgpIRYUQyokztNRgGgYTspLONc3NzR4/XTSZk3lo0f3qFftUvVP7saZSls9gyeqGI5qdbWvpx4NCLxMtT2eL5feAnXrd+rtGiqIYvX64+UlV4p7VdQ5V6Y68zkWMGJw5tT6cOYyn9n7kIUzqzHJT3Z96PntApHakPiVJcsGdqz+eE7OJ1c9keUIc4AUIbriwGxJ1ZXZI4tFvnWF/u20BWUNzsJld4LWvqtYbnNsf5yCBC8ih01ZMAHAk1mFlxFSsXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84eaa8cf-b31d-4c6e-1006-08df356940d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 03:03:48.5233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2w+sik3rkYbvxMmzNZBIkXpvplgIxaS6pXNFiYcz6DA8rFYP+KpupseG2B4AJrwswWkyDbYiZjaW991uvIukDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Subject: [PATCH i-g-t v1] tests/intel/kms_link_m_n: Add DisplayPort Link =
M/N
> ratio validation tests
>=20
> Add a DisplayPort Link M/N validation test based on pipe CRC comparison.
>=20
> The test exercises a range of Link M/N integer ratios across supported li=
nk
> configurations and verifies that the generated output remains unchanged. =
CRC
> mismatches indicate potential link timing, transmission, or sink synchron=
ization
> issues.
>=20
> Subtests are generated dynamically for each display pipeline, while unsup=
ported
> configurations are skipped automatically.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Just a quick point=20
On NVL limit is increased to 22 now

Regards,
Suraj Kandpal

> ---
>  tests/intel/kms_link_m_n.c | 434
> +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   3 +
>  2 files changed, 437 insertions(+)
>  create mode 100644 tests/intel/kms_link_m_n.c
>=20
> diff --git a/tests/intel/kms_link_m_n.c b/tests/intel/kms_link_m_n.c new =
file
> mode 100644 index 000000000..17dd58cd5
> --- /dev/null
> +++ b/tests/intel/kms_link_m_n.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: MIT
> +/**
> + * TEST: kms link M/N
> + * Category: Display
> + * Description: Validate video Link M/N integer ratios from zero
> +through ten
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features  */
> +
> +/**
> + * SUBTEST: link_m_n_ratio_int0
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 0.
> + *
> + * SUBTEST: link_m_n_ratio_int1
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 1.
> + *
> + * SUBTEST: link_m_n_ratio_int2
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 2.
> + *
> + * SUBTEST: link_m_n_ratio_int3
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 3.
> + *
> + * SUBTEST: link_m_n_ratio_int4
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 4.
> + *
> + * SUBTEST: link_m_n_ratio_int5
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 5.
> + *
> + * SUBTEST: link_m_n_ratio_int6
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 6.
> + *
> + * SUBTEST: link_m_n_ratio_int7
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 7.
> + *
> + * SUBTEST: link_m_n_ratio_int8
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 8.
> + *
> + * SUBTEST: link_m_n_ratio_int9
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio 9.
> + *
> + * SUBTEST: link_m_n_ratio_int10
> + * Description: Compare pipe CRCs for configurations with integer M/N ra=
tio
> 10.
> + */
> +
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "i915/i915_dp.h"
> +#include "igt.h"
> +#include "kms_joiner_helper.h"
> +
> +#define LINK_N 0x80000ULL
> +#define MAX_LINK_CONFIGS 32
> +
> +struct test_data {
> +	int drm_fd;
> +	igt_display_t display;
> +};
> +
> +static uint64_t link_symbol_clock_khz(int link_rate) {
> +	uint64_t symbol_size =3D i915_dp_is_uhbr_rate(link_rate) ? 32 : 10;
> +
> +	return (uint64_t)link_rate * 10 / symbol_size; }
> +
> +static uint64_t link_m_value(const drmModeModeInfo *mode, int
> +link_rate) {
> +	uint64_t clock =3D link_symbol_clock_khz(link_rate);
> +
> +	return ((uint64_t)mode->clock * LINK_N + clock / 2) / clock; }
> +
> +static uint32_t link_m_n_integer(const drmModeModeInfo *mode, int
> +link_rate) {
> +	return link_m_value(mode, link_rate) / LINK_N; }
> +
> +static bool wait_for_retrain(struct test_data *data, igt_output_t
> +*output) {
> +	struct timespec start, now;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	for (;;) {
> +		if (!i915_dp_get_pending_retrain(data->drm_fd, output))
> +			return true;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		if ((now.tv_sec - start.tv_sec) +
> +		    (now.tv_nsec - start.tv_nsec) / 1e9 > 20.0)
> +			return false;
> +		usleep(100000);
> +	}
> +}
> +
> +static bool same_pixel_clock(const drmModeModeInfo *modes, int index) {
> +	int i;
> +
> +	for (i =3D 0; i < index; i++)
> +		if (modes[i].clock =3D=3D modes[index].clock)
> +			return true;
> +	return false;
> +}
> +
> +static void force_link(struct test_data *data, igt_output_t *output,
> +		       const struct i915_dp_link_config *config) {
> +	char rate[32], lanes[32];
> +
> +	snprintf(rate, sizeof(rate), "%d", config->link_rate);
> +	snprintf(lanes, sizeof(lanes), "%d", config->lane_count);
> +	i915_dp_set_link_params(data->drm_fd, output, rate, lanes); }
> +
> +static bool commit_mode(struct test_data *data, igt_output_t *output,
> +			igt_crtc_t *crtc, drmModeModeInfo *mode,
> +			struct igt_fb *fb,
> +			const struct i915_dp_link_config *config) {
> +	igt_plane_t *primary;
> +	int ret;
> +
> +	/* Force link first: redetection invalidates connector mode pointers. *=
/
> +	force_link(data, output, config);
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +	igt_output_override_mode(output, mode);
> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, fb);
> +
> +	if (!igt_fit_modes_in_bw(&data->display)) {
> +		igt_info("Skipping %s at %d/%d: insufficient bandwidth\n",
> +			 mode->name, config->lane_count, config->link_rate);
> +		return false;
> +	}
> +
> +	/*
> +	 * DSC-required configurations fail atomic check with -EINVAL when DSC
> +	 * is unavailable. Treat that as an unsupported mode/link combination,
> +	 * not as a failure of the M/N test.
> +	 */
> +	ret =3D igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +
> DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +	if (ret) {
> +		igt_info("Skipping %s at %d/%d: atomic check failed (%d), likely
> DSC required\n",
> +			 mode->name, config->lane_count, config->link_rate,
> ret);
> +		return false;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	i915_dp_force_link_retrain(data->drm_fd, output, 1);
> +	if (!wait_for_retrain(data, output)) {
> +		igt_info("Skipping %s at %d/%d: link retrain timed out\n",
> +			 mode->name, config->lane_count, config->link_rate);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int fixed_lane_count(const struct i915_dp_link_config *configs,
> +			    int num_configs)
> +{
> +	int i, lanes =3D 0;
> +
> +	for (i =3D 0; i < num_configs; i++)
> +		if (configs[i].lane_count > lanes)
> +			lanes =3D configs[i].lane_count;
> +
> +	return lanes;
> +}
> +
> +static bool has_ratio(int drm_fd, const drmModeConnector *connector,
> +		      const struct i915_dp_link_config *configs,
> +		      int num_configs, int fixed_lanes,
> +		      uint32_t target_ratio)
> +{
> +	int mode, config;
> +
> +	for (mode =3D 0; mode < connector->count_modes; mode++) {
> +		if (same_pixel_clock(connector->modes, mode) ||
> +		    intel_mode_needs_joiner(drm_fd, &connector-
> >modes[mode]))
> +			continue;
> +		for (config =3D 0; config < num_configs; config++)
> +			if (configs[config].lane_count =3D=3D fixed_lanes &&
> +			    link_m_n_integer(&connector->modes[mode],
> +					     configs[config].link_rate) =3D=3D
> target_ratio)
> +				return true;
> +	}
> +	return false;
> +}
> +
> +static void test_ratio_for_output(struct test_data *data,
> +				  igt_output_t *output,
> +				  igt_crtc_t *crtc,
> +				  uint32_t target_ratio)
> +{
> +	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +	struct i915_dp_link_config max_config =3D { 0 };
> +	drmModeConnector *connector;
> +	drmModeModeInfo *modes;
> +	int fixed_lanes;
> +	int num_configs, mode, config;
> +
> +	i915_dp_reset_link_params(data->drm_fd, output);
> +	num_configs =3D i915_dp_get_allowed_link_configs(data->drm_fd,
> output,
> +						       configs,
> ARRAY_SIZE(configs));
> +	igt_require_f(num_configs > 0, "No allowed link configs for %s\n",
> +		      igt_output_name(output));
> +	connector =3D output->config.connector;
> +	fixed_lanes =3D fixed_lane_count(configs, num_configs);
> +
> +	/* Select the highest available rate while keeping one fixed lane count=
. */
> +	for (config =3D 0; config < num_configs; config++)
> +		if (configs[config].lane_count =3D=3D fixed_lanes &&
> +		    configs[config].link_rate > max_config.link_rate)
> +			max_config =3D configs[config];
> +
> +	modes =3D calloc(connector->count_modes, sizeof(*modes));
> +	igt_assert(modes);
> +	memcpy(modes, connector->modes,
> +	       connector->count_modes * sizeof(*modes));
> +
> +	for (mode =3D 0; mode < connector->count_modes; mode++) {
> +		struct igt_fb fb;
> +		igt_pipe_crc_t *pipe_crc;
> +		igt_crc_t reference, current;
> +		igt_plane_t *primary =3D NULL;
> +		bool mode_has_ratio =3D false;
> +
> +		if (same_pixel_clock(modes, mode)) {
> +			igt_info("Skipping %s on %s: duplicate pixel clock\n",
> +				 modes[mode].name, igt_crtc_name(crtc));
> +			continue;
> +		}
> +
> +		if (intel_mode_needs_joiner(data->drm_fd, &modes[mode])) {
> +			igt_info("Skipping %s on %s: joiner required\n",
> +				 modes[mode].name, igt_crtc_name(crtc));
> +			continue;
> +		}
> +
> +		for (config =3D 0; config < num_configs; config++)
> +			if (configs[config].lane_count =3D=3D fixed_lanes &&
> +			    link_m_n_integer(&modes[mode],
> configs[config].link_rate) =3D=3D
> +			    target_ratio) {
> +				mode_has_ratio =3D true;
> +				break;
> +			}
> +
> +		if (!mode_has_ratio) {
> +			igt_info("Skipping %s on %s: no link rate gives integer
> ratio %u at %d lanes\n",
> +				 modes[mode].name, igt_crtc_name(crtc),
> +				 target_ratio, fixed_lanes);
> +			continue;
> +		}
> +
> +		igt_create_color_fb(data->drm_fd, modes[mode].hdisplay,
> +				    modes[mode].vdisplay,
> DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> &fb);
> +
> +		/* Capture one reference CRC at the maximum supported link
> rate. */
> +		if (!commit_mode(data, output, crtc, &modes[mode], &fb,
> +				 &max_config)) {
> +			igt_remove_fb(data->drm_fd, &fb);
> +			continue;
> +		}
> +
> +		pipe_crc =3D igt_crtc_crc_new(crtc,
> IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_start(pipe_crc);
> +		igt_pipe_crc_collect_crc(pipe_crc, &reference);
> +		primary =3D igt_output_get_plane_type(output,
> +
> DRM_PLANE_TYPE_PRIMARY);
> +
> +		/* Reuse the reference for every matching ratio configuration.
> */
> +		for (config =3D 0; config < num_configs; config++) {
> +			unsigned int ratio;
> +
> +			if (configs[config].lane_count !=3D fixed_lanes)
> +				continue;
> +			ratio =3D link_m_n_integer(&modes[mode],
> +						 configs[config].link_rate);
> +
> +			if (ratio !=3D target_ratio)
> +				continue;
> +
> +			igt_info("Testing %s@%u: M=3D%llu N=3D%llu ratio=3D%u at
> %d/%d\n",
> +				 modes[mode].name, modes[mode].vrefresh,
> +				 (unsigned long
> long)link_m_value(&modes[mode],
> +
> configs[config].link_rate),
> +				 (unsigned long long)LINK_N, ratio,
> +				 configs[config].lane_count,
> configs[config].link_rate);
> +
> +			if (!commit_mode(data, output, crtc, &modes[mode],
> &fb,
> +					 &configs[config]))
> +				continue;
> +			primary =3D igt_output_get_plane_type(output,
> +
> DRM_PLANE_TYPE_PRIMARY);
> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> +			igt_pipe_crc_drain(pipe_crc);
> +			igt_pipe_crc_collect_crc(pipe_crc, &current);
> +
> +			igt_assert_f(igt_check_crc_equal(&reference,
> &current),
> +				     "CRC mismatch for %s: max %d/%d, ratio
> %d/%d\n",
> +				     modes[mode].name,
> +				     max_config.lane_count,
> max_config.link_rate,
> +				     configs[config].lane_count,
> configs[config].link_rate);
> +		}
> +
> +		igt_pipe_crc_free(pipe_crc);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +	}
> +
> +	free(modes);
> +}
> +
> +static bool run_ratio_test(struct test_data *data, uint32_t
> +target_ratio) {
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	bool ran =3D false;
> +
> +	for_each_crtc_with_single_output(&data->display, crtc, output) {
> +		struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +		int num_configs, fixed_lanes;
> +
> +		if (output->config.connector->connector_type !=3D
> +		    DRM_MODE_CONNECTOR_DisplayPort ||
> +		    igt_check_output_is_dp_mst(output))
> +			continue;
> +
> +		i915_dp_reset_link_params(data->drm_fd, output);
> +		num_configs =3D i915_dp_get_allowed_link_configs(data-
> >drm_fd, output,
> +							       configs,
> ARRAY_SIZE(configs));
> +		igt_require_f(num_configs > 0, "No allowed link configs for
> %s\n",
> +			      igt_output_name(output));
> +		fixed_lanes =3D fixed_lane_count(configs, num_configs);
> +		if (!has_ratio(data->drm_fd, output->config.connector, configs,
> num_configs,
> +			       fixed_lanes, target_ratio))
> +			continue;
> +
> +		igt_dynamic_f("%s-%s", igt_output_name(output),
> igt_crtc_name(crtc)) {
> +			test_ratio_for_output(data, output, crtc, target_ratio);
> +		}
> +		ran =3D true;
> +	}
> +
> +	return ran;
> +}
> +
> +IGT_TEST_DESCRIPTION("Validate video Link M/N integer ratios from zero
> +through ten");
> +
> +int igt_main()
> +{
> +	struct test_data data =3D {};
> +
> +	igt_fixture() {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require_pipe_crc(data.drm_fd);
> +	}
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 0.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int0")
> +		igt_require_f(run_ratio_test(&data, 0),
> +			      "No DP mode/link configuration has integer M/N
> ratio 0\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 1.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int1")
> +		igt_require_f(run_ratio_test(&data, 1),
> +			      "No DP mode/link configuration has integer M/N
> ratio 1\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 2.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int2")
> +		igt_require_f(run_ratio_test(&data, 2),
> +			      "No DP mode/link configuration has integer M/N
> ratio 2\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 3.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int3")
> +		igt_require_f(run_ratio_test(&data, 3),
> +			      "No DP mode/link configuration has integer M/N
> ratio 3\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 4.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int4")
> +		igt_require_f(run_ratio_test(&data, 4),
> +			      "No DP mode/link configuration has integer M/N
> ratio 4\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 5.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int5")
> +		igt_require_f(run_ratio_test(&data, 5),
> +			      "No DP mode/link configuration has integer M/N
> ratio 5\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 6.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int6")
> +		igt_require_f(run_ratio_test(&data, 6),
> +			      "No DP mode/link configuration has integer M/N
> ratio 6\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 7.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int7")
> +		igt_require_f(run_ratio_test(&data, 7),
> +			      "No DP mode/link configuration has integer M/N
> ratio 7\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 8.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int8")
> +		igt_require_f(run_ratio_test(&data, 8),
> +			      "No DP mode/link configuration has integer M/N
> ratio 8\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 9.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int9")
> +		igt_require_f(run_ratio_test(&data, 9),
> +			      "No DP mode/link configuration has integer M/N
> ratio 9\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N
> ratio 10.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int10")
> +		igt_require_f(run_ratio_test(&data, 10),
> +			      "No DP mode/link configuration has integer M/N
> ratio 10\n");
> +
> +	igt_fixture() {
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build index 519a9e727..1f82b=
a868
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -253,6 +253,7 @@ intel_kms_progs =3D [
>  	'kms_cdclk',
>  	'kms_dirtyfb',
>  	'kms_dp_link_training',
> +	'kms_link_m_n',
>          'kms_dp_linktrain_fallback',
>  	'kms_draw_crc',
>  	'kms_dsc',
> @@ -403,6 +404,8 @@ extra_sources =3D {
>  	'kms_dp_link_training': [
>            join_paths ('intel', 'kms_mst_helper.c'),
>            join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_link_m_n': [
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_dsc': [
>            join_paths ('intel', 'kms_dsc_helper.c'),
>            join_paths ('intel', 'kms_joiner_helper.c') ],
> --
> 2.43.0

