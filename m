Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE43CA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 05:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A83210E163;
	Mon, 25 Aug 2025 05:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6XXl2Sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5972D10E163
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 05:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756100530; x=1787636530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UuquQ7O6wtvWRJf5HI4SWnydi7L6HpDYRoRVJJS7BfY=;
 b=H6XXl2SrGtB0CscgyixUJco2EbHWVllvM27lPZdpxYqOPqdtTzipPFxQ
 /LqfSDnqysU7bbAm7oAcTNCCtjsuXDFZ/Y4tExoZNpHOs0y0Pw0doMQak
 zbLSlJQgwUx5q6TIR754Z/Z/095rIuFLZ/vNVQwBo7sn4T6lLrnEPeQeL
 4zVyU6hxgFwCXTg80BjgY/MYRR/9u+Xjc0MXXqnTKzyjIOCcyuVIpm3VO
 W8pOcTK9+gEZSsyLMDFOO4pAZOxR4dsEtoI37tOkxDGglFvVQ7dZlYRoa
 B8AWwIzyG9wJ9+NUNiLNVnIHEb5SgoTv/hU1FcL/5W0f5eckUCI2beLJ/ Q==;
X-CSE-ConnectionGUID: 6R0uShxDSQSli4sZ5zWrag==
X-CSE-MsgGUID: G7IMk7p9QxCLs2zjZUnTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58014791"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58014791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:42:09 -0700
X-CSE-ConnectionGUID: JdDlhfxDRoq+xp9uFs/X1w==
X-CSE-MsgGUID: ZhhVjmnpT5K/cwthcN7OCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173386862"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:42:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:42:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 22:42:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz1xkEIl3mYX0O4wlDwslBM3zFBlW5iV07CIu+msd2BVzW/7A+mPs2A3gKpBpq8vBHtUvCnp5WJvPBfLc4lDcXU04g2YuZH3qSdI1ebE363G7Pk1FXUGu2hvTynhw2cEBdeiadG/qREp2IF3VV23ADxvbmLktBliGFzi8oEwdhwIv+qPqPAmCFjYRDlZNuud+7UuPUVCG/wqUe+RlYZq9S+ey7TfM6wXSF8xM24TGaiFwVqiSESWGvAT8I8j7X5eB11ayyTI0MrXxPgUVOnfJ+HU/IvRlMbhPFvE9EdvHYSs+4/zCt7RAaCnCYjrjhsVcjtNyt05ZcLgpKemrwbIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc7RTkGQdbwYabmNBjMnzTygzgccTRZcdwa6bHaOr2Q=;
 b=G28ksZrlmMV4LhVtPVFdDiWBeNxG0zHHdfBKKRcUQ6LBUIj7oJcYxKFmGvQpacUaXB09+WxCmFK+mtAjGOHL5p2CaPczUAJaHdMmUz4jawj3wQp/u7X65MialJQJP7v4EmazXgB6O6fdOIa+qahPhb9OwnP90UbPbU72CqV723GjabkiSpOsdAbj2hHUYF9G+YGFyuQ4xFkwqKijHXZ0VYrM263FD0B0BHpGT3MuPrwxqfIyrHcGjrzEfklXnaxv/8Jfbrp8E7sW0DBqNmRWyceIEBTkQk7dewxcB8IqfkZQlfpUTv20rQ5PhgtVcDf/uWFave634P/P+VLawmBLsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 25 Aug
 2025 05:42:00 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 05:42:00 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t 1/1] lib/xe: Track valid Tile IDs
Thread-Topic: [PATCH i-g-t 1/1] lib/xe: Track valid Tile IDs
Thread-Index: AQHcENBogSxEXnblYka9gugGePW4WbRy272Q
Date: Mon, 25 Aug 2025 05:41:59 +0000
Message-ID: <CH3PR11MB843405BC27DBBC8F4D7CB5EC8D3EA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250819061326.205124-1-nishit.sharma@intel.com>
 <20250819061326.205124-2-nishit.sharma@intel.com>
In-Reply-To: <20250819061326.205124-2-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6692:EE_
x-ms-office365-filtering-correlation-id: 95c66ae6-11bf-4d19-fa10-08dde39a1c92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6ajJu4SolXeZPKeqF83Pc/f6m7DarNyaBTBamVL1dXGSq51e7REoyJaB9Dd4?=
 =?us-ascii?Q?SuARSPoagRdIYGN3S7UfTo7sxO3e8jAlq+MQ3H2/qLqQzQ0g4N9/dkyukAYs?=
 =?us-ascii?Q?7GWIYbO60pS0E9JXHZ5bBgDxTvSG7bv4pc8yK3pXqfP2HLruil9NPJ7/Pgft?=
 =?us-ascii?Q?GIjvFA9ocGwzAtMxYveyNtrBDj2LZiBo5akkHwJ8wOnjyIKOuc3Nw3Y/nR7K?=
 =?us-ascii?Q?2IKcyxWHl9ixQktUycJy71gNntnYxQKlii6uosC0Cs1xLy7sBOrHTeUUauDj?=
 =?us-ascii?Q?yCmhL/p7b2OQS3vDTiUaTdb+PxCt6cpMY5c7J/DW2XIcw6tfWu5hIkWS8XZF?=
 =?us-ascii?Q?tTthJUosScBCBzrO9QH83UItxD3hdQ/+U/KIsR9aAwoi95uFQNnKicUtGtpu?=
 =?us-ascii?Q?4+OeXEEDThimulpW+FRW7vImx20j9XXEYg4HdCaysTKRICWvMaaaZKKqlaFF?=
 =?us-ascii?Q?0j59aCaDoLZIyaqCsneTRaQdc0Q/lG5FAmGneEJUv6RrgmpDKUDJ8eNBajp8?=
 =?us-ascii?Q?Od21BvlIZiJ2PqiR+ZwWtAlKw4P8Eq0RmFQtaTMu8HzUnKfdZQBkkpJ+i3hA?=
 =?us-ascii?Q?QTssNTPucK3HfYj5olTUAeh7/CXj+4yId4aoDNW3Z4vm15loajkEjEP1RTz/?=
 =?us-ascii?Q?iJC/s1Akhbo4yFcEzENep3hSOa4P/6RSMTnADuQoDem7vnrNWjBG1VbyL/M3?=
 =?us-ascii?Q?YE8lA0BR18X15KsRMAyhyC60Sdfs3hpdoVngouYj7mpmVq05hG3YqWgj7O9W?=
 =?us-ascii?Q?EHIp27HGbL9ELzLCb9GbNS+mNhy0hSi9XlWOF34zZGMhSCZ/zN5rn83MWWqi?=
 =?us-ascii?Q?Qj0zaxFMS7Te7hU2AOYBh1SpbzayjAguUU6xzSOAa6LjMleuXeZ+V1YzWMQD?=
 =?us-ascii?Q?PY7/yam4IKBJjUgBZ/mGr9EJ5KraiFQa6HqlBB40+VHN1TnH+Z9DIUQdzUMu?=
 =?us-ascii?Q?GWZOV8EPHDkaM+SoFzeAVorq33jhN/jjlc9oxXZgzF+KOMnof7BpzQqFEoo8?=
 =?us-ascii?Q?sKimukAz4rTHHikDaqqajrT6zTCdYxlbZ+fsU5w/rgrl+NBKe4t8C1iRToN5?=
 =?us-ascii?Q?PiXoZhVvFV+HximKSiHKWnfpCbkKl45EODskyfDtt4giKOEpwmE7FpI1IsLR?=
 =?us-ascii?Q?KR/Q7AN7gZyEP6MJUReMxBhXP+P02OpedNIcFUovKzCQDIiMPr699JT9NjVk?=
 =?us-ascii?Q?78r3YzlWjgm8EGNH12cklZDbgeh8yJTJFy1Y0mvqlxHcWMIB10lENyWsdasM?=
 =?us-ascii?Q?wHgGUrKXXkenZEc5jPAowCQTVMwVPqENGlC9Fl+Df4hKojQlLBCrP2vCQJyG?=
 =?us-ascii?Q?+0JG82SBIKUE/KHcA6G8cLz7tfF3+ZhhKGJA+lP5KeAm8WhsRI8heYvnsKfj?=
 =?us-ascii?Q?tQXi0aG2vkOIp2ljbW6EH0VvP/Rmlk+jnMPQBetR3bdd6MOd3I+EfpZgbOme?=
 =?us-ascii?Q?eVbiBHPJd0Fn8b0RwXhoR0rzCXDAHTcH4rFt1TMz/Pqq0fz/keyKpoDavedD?=
 =?us-ascii?Q?oUmmlWUYpNqc0zk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kAr6aSqR3h4O7jQ8fD71/Dji95+ppjCCW8t9R/pSXtXJCA4rm03pqIVQ5niO?=
 =?us-ascii?Q?+FKWTTtHpYROgYJDH45lBBDBve2EgLPO/nl2JQ4gX8Ny+bOBe6nyfIar21i8?=
 =?us-ascii?Q?j0tM/tIgQeIrWFXyaozfjJSWlg1CtAv+jyYq8AuoBlloLe4P5rKebTxc5ih1?=
 =?us-ascii?Q?fw0dcx04v6JKkJ659buIqPICpTRmkCojoaKnNWz313Joah+SZB9+qNVbwL6y?=
 =?us-ascii?Q?KpqqqpNmVT6CrfuWBlnaLHnMz1TztBx7ED2ev0rdeA/6OCszgVeLwFdF/uSy?=
 =?us-ascii?Q?818IVQbbAY/cbILo9AaJQnQsyASjP7VTPVNNQK6WnR5iGeiVlWtc0XIw1e3f?=
 =?us-ascii?Q?F9Q1V5rBAXeHSS2JRFvZ8Le6Ad49lUTSyEoZPX8ac+9X+ARZ80x5X00IbYd1?=
 =?us-ascii?Q?ylLeGhdUl4cxcCgG2BpVpKmpoKmSSSIESFyozW53FtCMWV7Z+gTRyJWKa60y?=
 =?us-ascii?Q?sa+YxrAB4OTRm+UPbs4j+UlPbATyvji83/9Z2Msfy1qVZWTJki9SXRh8HNYh?=
 =?us-ascii?Q?AIMXmT5voeOzQga96ceADF5QCRXwmtwzYtI9TLaVy4xoL9OkBPkNWHuKcZia?=
 =?us-ascii?Q?k+x9ns6rA8uS4wgR7/jTwZUJlRyugr/TumdtGPhb1dfC+Oo4JrHWngF8gTXF?=
 =?us-ascii?Q?WCt8kRPFRNfwO/ThKmQtL8OpMV2VnRf5ptDfvHgGelhqvvPSnyn/VJwNLKHB?=
 =?us-ascii?Q?D0jowVb33mQpa4xF9qlh6xDtR5Dfl8nLrIvjWwk9Thv9nm1FRFcXSDEFWSab?=
 =?us-ascii?Q?o8Fm88uX4M9QpNbXLHJVwQQ8RTT3/NZ9ICvAI/TfrLGAD7FBkxHADUKxysR2?=
 =?us-ascii?Q?lGPH/SZqtRhiAX6e9PzuTSBBlWGtVit1s800AMr4GH/qjWtpmUG1HfoUezSG?=
 =?us-ascii?Q?28TRl5RcDGdfFuVTA2JEDXpLKX6gCI3Omn0QbGfDaHlB7eM+BZyV0okFmvwL?=
 =?us-ascii?Q?+fQPrst2htAw57sLHZcz2ARbVZoqWy5EtIvEf1JFdps/DaxW+LS7Zhrj9HuF?=
 =?us-ascii?Q?VN1cuKlDuDqImuaCdX8CGOl861mwES/mSWIb2PqTWZAe49cuS5UmHMgUlGSx?=
 =?us-ascii?Q?BuUxkPXspKp8FXU8xhWqBKIpE+atlnssGolRlcReW1IfjMhNMt6l7rTCylDC?=
 =?us-ascii?Q?oBHLWlS2hvIpzGZEJN3lmwroWzhF9RzeC++1JD778hVITBtiYhAduF5CUmv7?=
 =?us-ascii?Q?Z/91BgxIj91Hu/pStIwiplBsJOkJw5ImIrPnD1ItbnubsBIqJbvHtYDOtOuH?=
 =?us-ascii?Q?pTTwIBPDq+hmdMvp9+67AoaPK8y1WWdyq0tHtD65iNCifI55f6yoUgLxP7FL?=
 =?us-ascii?Q?+90RxUzJDvYcvXw4tpfdL81adQj6UAGRUAVtTR+rJCm9+63TwuF9lGgGtWU0?=
 =?us-ascii?Q?7PM1jLhy334pRWHhJZ3V5iHGc6c0cQ74TzR18TA2H5+d5gVEwySx/vCWpbq+?=
 =?us-ascii?Q?CKd0sOHFWaFMnQS1L3BnQNOeCI+sx7yq80b4NcjMUzCkG9w+3FWyC8/W7FaU?=
 =?us-ascii?Q?IGq1MSZlbmVd7nIxTgrAgcYIlM2EBJmvPOuJ3F1gsinpnpHceCA2aLXNJLyk?=
 =?us-ascii?Q?IkCsMroyeAsz1KJ3njs9zfRl0Tg1gmgoc3jooUS/0dbAya3xxYp7/fxu9/jQ?=
 =?us-ascii?Q?YKewWcJWyyVJC53NVHD2olgY8rZWIwEm5NxGto+6nWeT1hsy4kGEsXT9cwGq?=
 =?us-ascii?Q?lHHd9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c66ae6-11bf-4d19-fa10-08dde39a1c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 05:41:59.9965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKx+yNxbhrH7NNiDHb/A8QtptebhBquO7Oj8zUZZ1WptVS4aaDlwZA0tJOWx0xIyT2r6GnSq1xXZga44HY7RiqpVZAMkEcozWVRMBhNI0Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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


Firstly, the code itself is not compiling, there is a build failure. Can yo=
u check that.
Incorporate review comments as revisions in the commit message along with c=
over letter, as this is a single patch cover letter is also not required.
> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: 19 August 2025 11:43 AM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH i-g-t 1/1] lib/xe: Track valid Tile IDs
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Iterating drm_xe_gt structure to get valid tile ID instead of assuming ti=
le_id =3D=3D
> gt_id and finding sysfs path for GTS in multi-tile platforms. Initially i=
t was
> assumed tile_id =3D=3D gt_id in multi-tile platform and if gt_id =3D X pa=
ssed, it was
> considered tileX.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c   | 28 ++++++++++++++------
>  lib/xe/xe_query.c | 66 +++++++++++++++++++++++++----------------------
>  lib/xe/xe_query.h |  1 +
>  3 files changed, 56 insertions(+), 39 deletions(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 96ca57ed9..0ef1182b1=
 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -233,9 +233,14 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char
> *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>=20
> -	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
> +	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
> +		struct xe_device *xe_dev =3D xe_device_get(xe_device);
> +
> +		igt_assert(xe_dev);
> +
>  		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev),
> drm_xe_get_tile(xe_dev, gt), gt);
> +	}
>  	else
>  		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt); @@ -307,7
> +312,6 @@ char *  xe_sysfs_engine_path(int xe_device, int gt, int class, =
char
> *path, int pathlen)  {
>  	struct stat st;
> -	int tile =3D IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
>=20
>  	if (xe_device < 0)
>  		return NULL;
> @@ -315,9 +319,16 @@ xe_sysfs_engine_path(int xe_device, int gt, int clas=
s,
> char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>=20
> -	snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> -		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
> -		 xe_engine_class_short_string(class));
> +	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
> +		struct xe_device *xe_dev =3D xe_device_get(xe_device);
> +
> +		igt_assert(xe_dev);
> +
> +		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> +			       major(st.st_rdev), minor(st.st_rdev),
> drm_xe_get_tile(xe_dev, gt), gt);
Missed one argument, xe_engine_class_short_string(class) as last argument. =
Have you compiled it as it should throw warning as number of arguments are =
not matching?
[116/1206] Compiling C object lib/libigt-igt_sysfs_c.a.p/igt_sysfs.c.o
../lib/igt_sysfs.c: In function 'xe_sysfs_engine_path':
../lib/igt_sysfs.c:327:90: warning: format '%s' expects a matching 'char *'=
 argument [-Wformat=3D]
  327 |                 snprintf(path, pathlen, "/sys/dev/char/%d:%d/device=
/tile%d/gt%d/engines/%s",
      |                                                                    =
                     ~^
      |                                                                    =
                      |
      |                                                                    =
                      char *
[123/1206] Compiling C object lib/libigt-xe_xe_query_c.a.p/xe_xe_query.c.o
> +	} else
> +		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> +			       major(st.st_rdev), minor(st.st_rdev), 0, gt,
> +xe_engine_class_short_string(class));
In else case tile is by default tile0 no need to add additional argument as=
 0 as above to make it uniform.
>=20
>  	if (!access(path, F_OK))
>  		return path;
> @@ -506,6 +517,7 @@ void igt_drm_debug_mask_reset_exit_handler(int
> sig)
>   */
>  void igt_drm_debug_mask_update(unsigned int mask_to_set)  {
> +	unsigned int new_debug_mask;
>  	static bool debug_mask_read_once =3D true;
>  	char buf[20];
>  	int dir;
> @@ -524,8 +536,8 @@ void igt_drm_debug_mask_update(unsigned int
> mask_to_set)
>  		}
>  	}
>=20
> -	igt_debug("Setting DRM debug mask to %d\n", mask_to_set);
> -	snprintf(buf, sizeof(buf), "%d", mask_to_set);
> +	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
> +	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
You just declared new_debug_mask in this function , no where you are either=
 initialising and trying print and create a buffer value.
It seems something is missing.
>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>=20
>  	close(dir);
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index 3b8a682f8..d522b=
c8fc
> 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -160,32 +160,6 @@ static struct drm_xe_query_mem_regions
> *xe_query_mem_regions_new(int fd)
>  	return mem_regions;
>  }
> The below function removal code seems irrelevant to this patch, check thi=
s out.
> -static struct drm_xe_query_eu_stall *xe_query_eu_stall_new(int fd) -{
> -	struct drm_xe_query_eu_stall *query_eu_stall;
> -	struct drm_xe_device_query query =3D {
> -		.extensions =3D 0,
> -		.query =3D DRM_XE_DEVICE_QUERY_EU_STALL,
> -		.size =3D 0,
> -		.data =3D 0,
> -	};
> -
> -	/* Support older kernels where this uapi is not yet available */
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		return NULL;
> -	igt_assert_neq(query.size, 0);
> -
> -	query_eu_stall =3D malloc(query.size);
> -	igt_assert(query_eu_stall);
> -
> -	query.data =3D to_user_pointer(query_eu_stall);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(query_eu_stall, query.size));
> -
> -	return query_eu_stall;
> -}
> -
>  static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)  {
>  	struct drm_xe_query_oa_units *oa_units; @@ -343,7 +317,6 @@
> static void xe_device_free(struct xe_device *xe_dev)
>  	free(xe_dev->engines);
>  	free(xe_dev->mem_regions);
>  	free(xe_dev->vram_size);
> -	free(xe_dev->eu_stall);
>  	free(xe_dev);
>  }
>=20
> @@ -379,19 +352,22 @@ struct xe_device *xe_device_get(int fd)
>  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].gt_id);
>=20
> +	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		xe_dev->tile_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].tile_id);
I see tile_mask being removed from xe_dev structure, there is compilation f=
ailure with this.
Check this out if this change is really required.
> +
>  	xe_dev->memory_regions =3D __memory_regions(xe_dev->gt_list);
>  	xe_dev->engines =3D xe_query_engines(fd);
>  	xe_dev->mem_regions =3D xe_query_mem_regions_new(fd);
> -	xe_dev->eu_stall =3D xe_query_eu_stall_new(fd);
>  	xe_dev->oa_units =3D xe_query_oa_units_new(fd);
>=20
>  	/*
>  	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
>  	 * the allocation is large enough to hold the highest GT ID
>  	 */
> -	max_gt =3D igt_fls(xe_dev->gt_mask) - 1;
> -	xe_dev->vram_size =3D calloc(max_gt + 1, sizeof(*xe_dev->vram_size));
> -	xe_dev->visible_vram_size =3D calloc(max_gt + 1, sizeof(*xe_dev-
> >visible_vram_size));
> +	max_gt =3D ffsll(xe_dev->gt_mask) - 1;
> +	xe_dev->vram_size =3D calloc(max_gt, sizeof(*xe_dev->vram_size));
> +	xe_dev->visible_vram_size =3D calloc(max_gt,
> +sizeof(*xe_dev->visible_vram_size));
>=20
>  	for (int idx =3D 0; idx < xe_dev->gt_list->num_gt; idx++) {
>  		struct drm_xe_gt *gt =3D &xe_dev->gt_list->gt_list[idx]; @@ -
> 545,6 +521,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device
> *xe_dev, int gt_id)
>  	return NULL;
>  }
>=20
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in
> +the
> + * GT list and return valid tile_id.
> + */
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id) {
> +	for (int i =3D 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id =3D=3D gt_id)
> +			return xe_dev->gt_list->gt_list[i].tile_id;
> +
> +	return -1;
> +}
>=20
>  /**
>   * vram_memory:
> @@ -726,6 +714,22 @@ xe_dev_FN(xe_number_engines, engines-
> >num_engines, unsigned int);
>   */
>  xe_dev_FN(xe_has_vram, has_vram, bool);
>=20
> +/*
> + * To check whether multi-tile supported in platform
> + * Function takes device descriptior and xe_device
> + * structure pointer
> + */
> +static int
> +is_multitile_plat(struct xe_device *xe_dev) {
> +	int gt_id;
> +
> +	xe_for_each_gt(xe_dev->fd, gt_id)
> +		if (xe_dev->gt_list->gt_list[gt_id].tile_id > 0)
> +			return true;
> +	return false;
> +}
> +
>  /**
>   * xe_vram_size:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index cc54ec956..ca624=
9b0d
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -101,6 +101,7 @@ unsigned int xe_dev_max_gt(int fd);  uint64_t
> all_memory_regions(int fd);  uint64_t system_memory(int fd);  const struc=
t
> drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);  struct drm_xe_engine
> *xe_engines(int fd);
> --
> 2.43.0

