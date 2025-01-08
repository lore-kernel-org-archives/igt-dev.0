Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0C6E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 12:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B263210E29D;
	Wed,  8 Jan 2025 12:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEAMMO+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426810E29D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736340639; x=1767876639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ifyavXzCHTdzNxQ0ykp6aZxns3ogqIWkuC0RRa+qZvc=;
 b=VEAMMO+TDTSyxaybyxV0aNUzT8R08jwBnDYgEIaGBlBvD/3e1WFRxrH3
 xY4ht7wS49WpnJcZ83y7F8w/X/dAKTJgGcRxus0j6IVOJFM1rfsDNmpZP
 TplW+qdxdcBjMFYghK/YjZ7/lPrtSarfkfpPWrfNlNHSDbgImnZSGPnu1
 21Q+dBKwdfKNOxvGbmHBszBohZRAAQ0ogTwUzIoCiB92+FWWyzWYwH11e
 IfLlokDx2+wFUGHUTJPh6e5NP+yMsf1b0H8fruHklwxeY1H0TrpFAOaQK
 SbfsndQOOGDUAtvv4qsmgVy2qMpfvK31BKE1NM/XEAZYmjIZp6miBo2ZZ g==;
X-CSE-ConnectionGUID: ZZttiqKjTL+QvMUP4kD5ew==
X-CSE-MsgGUID: qrQhfy7RQi+a0Pre22CL+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24168103"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="24168103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 04:50:39 -0800
X-CSE-ConnectionGUID: KJozvEOnSfuSCL+pISOihg==
X-CSE-MsgGUID: 2YZXbbpOSeK1eTAIi0Nmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103940536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 04:50:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 04:50:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 04:50:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 04:50:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfLG/HOp/0NiCkoRDlEe5/hLbyXM341kuEKRcr73CCwpQo8t99ygfFmMuZ1KRE6n8Kuw0WbZUORnwN+7wGCbDqtBC62SpX3tiFO2NdfW5r6q68O69yeTFCVoB0KgT9oGy4lwcHYbOVAWrsQs6KD7dI3clShc8kQ2dSTXjQ54aztSFuB2BDGClbE/ZXsm4GqpwupxxOnBq1esp8A+swPexEe4LBkCr+628+Zepvsyi3XtHXlcXUI6ufWP/vbKtefKpm+Ls5/ZHn9p9myiuCc0Vrtnesi+7UMhgcc1Lfcd+9S/6vFqAcZxftH9AJ7as9vXiwn+im2yU5E+6XpfdUShqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3B5++nfCS6xNZfQ2w7SER6R1BBw6XtFP+/X5wW12sQ=;
 b=uN0k6dIMFl9oFFanh3n1ch9hWKhBAmKvO5DqWv+CeTFZvhK6i2xa7KtFclFSkQSuKsaf3syxku7hwrZ4cI23Jgdg1H6ba99EyCZZgytLzPpzFCQjA/mcclcTop1H1Cb4dLXntAvCYUnuDLeuEbEsaRaGoeu58BDWWrkATyDsDwOtXGsS60ENim+yeq+nciZz66Xi6Vjt1UFqxwxeGpl2E7ugkglzE6BjEB/9/2o36bVbQBvYf/DyM7V5+0avEFNVYOx/fXCqorbTKCZ8Rq9jOnuUGnipinWKSTDNTBCiLJRn9nlQZG0aL5BLEleGsa7Kpvj6VMNULPlK6g8i+MvfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 12:50:01 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 12:50:01 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Topic: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Thread-Index: AQHbYCCzyMeg8ydQ00+JuBg3mT45drMJ/EgAgAAhnICAAOtBAIAAV3EAgAF2WBA=
Date: Wed, 8 Jan 2025 12:50:01 +0000
Message-ID: <PH0PR11MB4806D0CBE54176B6266CC9D5E4122@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250106095154.243459-1-mohammed.thasleem@intel.com>
 <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
 <PH0PR11MB48060B2DCFDCA769A5DAC186E4112@PH0PR11MB4806.namprd11.prod.outlook.com>
 <IA1PR11MB646717EDD6C6AB0E59555E00E3112@IA1PR11MB6467.namprd11.prod.outlook.com>
 <ffj5p27czbluexza6vgsbwlrwya3cipywgybukmj32rdyxnbao@u4hfftxmze2f>
In-Reply-To: <ffj5p27czbluexza6vgsbwlrwya3cipywgybukmj32rdyxnbao@u4hfftxmze2f>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: nemesa.garg@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|IA0PR11MB7935:EE_
x-ms-office365-filtering-correlation-id: df90c4ea-5395-48f0-b2e5-08dd2fe2f718
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RnaytOD/Fi4avIQCrbb5IkBKCPsYtxw/4kxGrDYswvU/mVr0FxClNvJC28t1?=
 =?us-ascii?Q?8pJq5KpO64HJO6uF41CLDPMtFrCWU7IZxdCIJtLfDRFlrarZbfhZh84nLzsd?=
 =?us-ascii?Q?BBQ9pHuz8WK5VUay8ErjkMbCuWEYdtS5uZTRE215s84c5X15MhgIhXv8ptsB?=
 =?us-ascii?Q?22w3/hX3BzDd+D+d1Vt+hpn7cc0RS+SBvPhcttFpTAnIgykYgz4c/CRI186z?=
 =?us-ascii?Q?lQjZZrsSQDh7jcSzwf41tHHiIKaz4whlt7fEKfjXZVcr5ENyuiWM566n0ulz?=
 =?us-ascii?Q?pfcJD2x0OXFR9XmCQ3gujMaPxl0DTFtEXJXBctSWGMuuBryrcxtxGSvnjO+d?=
 =?us-ascii?Q?5fgpEHQKY13Rd1d/3sRCkWP43ePotqtlAPpKAsRSuvcmjDW+jtV3PYaxRmJd?=
 =?us-ascii?Q?9XGq0bFdXfJFUmeTvt3DiXO2dm1OKKsOsLOkoHbUU+fwaM6b3LXMrT9y4gdK?=
 =?us-ascii?Q?eJBN1Kn0uepQbfydgTV1VNjxa22VQmvsbylCW+2+C7zQ1lWh4UpTdPL3w3vf?=
 =?us-ascii?Q?l23Cu7vxdpno04J2e++cd6oDbBf5ccx+JbDVntH2iExPiJXULcIY7kX9Uvee?=
 =?us-ascii?Q?nO93LHC7uq8NE9NRg++iCBFbrQJ/Ucs9Spqf7xKLnrdFTPbPlOBZeHH2bcy6?=
 =?us-ascii?Q?tw7RBUjHnz1B3BKt2tZH77KoewXXm52Yt31bQboY+yi1grAKpnQD4mDukQ9b?=
 =?us-ascii?Q?PPCp4UeHDEDQWrYC+QHb3kKW64zzMjTl2rN1Nw+Z2yMUA83r+eoMhOho5yDX?=
 =?us-ascii?Q?1dcI22A8iLmvClJUHwDsjNO/tCkRwd4C2fEVr7tnMf3VDuqbsWKZpDozs5Ej?=
 =?us-ascii?Q?BUQg/HQHIEFUYRByC1HIsEQOLHFMLwJWxLplZ+nAmdv/nigb1Zqcmxe0Z6TM?=
 =?us-ascii?Q?oMzikMoFKLS7ySWIwpoGh3tbYtYdox5bQJJ6QWAuO58/cPzk5kyRgvmvcVIq?=
 =?us-ascii?Q?cr5BJxoCGFRVqIzJHLTh5R8W/nDe5u5YPPbyAY0jximxIXruN1wYfvim1tf2?=
 =?us-ascii?Q?kDTC9aZjqF2KmR2h9pe6srfuuefXIWMCfkGQmMcnXnj9xwHKWvywQzntHfE0?=
 =?us-ascii?Q?TGCC8iHEO+u4xJ5w/sltgxcs2AOVtKNrxa6Lhir5OxMEAj/AWu2W0WOs0ruJ?=
 =?us-ascii?Q?YEwpTTbAN0cVohgs11GTpv5vieBMOFg7mg32SsyStB1DuMxcWsveUMMF0Zkc?=
 =?us-ascii?Q?YMfITrEiMQN6cStto7bOsconxkIRt/wgN537oMza6XJnNP8Rr5nQzBCFmP9i?=
 =?us-ascii?Q?A9ZGqLDNKee6/QE+pTt95IcTjnRgm9WSdw6A0q9kf2WxyOytHfXB/dK9JLl6?=
 =?us-ascii?Q?RoYfPfCiJGRBkasgtVfcqR9Ms4jZLkrs3UyXUhBveAyfZ6YAFShOVFdoQuDn?=
 =?us-ascii?Q?Vgr1qTdeNeyIbIQxKXT0iPrXsFQhrCsK6KQHiAIGPn0Zx83raw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dkUzqpz+0l3gAyiTlXimtEiGFUu6Ss+XLS1gfUevZt7qXa/ACL3HmBIMxqN7?=
 =?us-ascii?Q?Yq+oMWd9Bus9XFiwCe9UZEl5Uo+vBR6U7im+Il0S3VjmgsA/hL97V/qdJfCB?=
 =?us-ascii?Q?2/X0zch7ERUanLkPcPtaf7GcEk4nQ9tbLrPHKx1no8TBhmbyiiSZ8OWFJXXb?=
 =?us-ascii?Q?/IsIACn4a8a/72XYH288hGyTIVIlOMaviw9cBL8j4SkK/YY4OR3jsGznM127?=
 =?us-ascii?Q?NM425XSDbMsEYP86YgsBoRRY2JrZ4cKxVeEEm6b7B1im4Tev6zJDGeB7dBJZ?=
 =?us-ascii?Q?xraHHWVMuUeLqZ8gaE3DBkgzAdozUbSENN4KQ0HBvdA2hfup8pwh/VoXOmbe?=
 =?us-ascii?Q?45yj/AopV1WPzpapXsbiIaGnLdZkDQQqaec9ZceoNluyFqlr02uYrHEFOf4k?=
 =?us-ascii?Q?e0amCe5s5XN1+uEZI/GCYXHTLGadPim7+mrRUO88Nvk7W2UOYfP5AU8zKCwy?=
 =?us-ascii?Q?06GJoXrokRp5ZcZTrVEFgs/Mo22i3ej2fpxIdfPJTqmkDRxXFQzCMLzE+C8M?=
 =?us-ascii?Q?22jL/LGxyiPcHznlZoyXlT6ht43wdxMxhCrXcFI+rZTKlICKcsviwgIQNGN1?=
 =?us-ascii?Q?d2rOAcVa4GIkgYJM2zo4PqTAH8t7fylObpWRjPInH93u12ZbBJRaMQGmWDU9?=
 =?us-ascii?Q?yWeNtJAIuyoSWaUvFQrW54iht/TWGdJMhZZMJ+hdohDnRoZs9T8cs3855Rwa?=
 =?us-ascii?Q?LbRpEA9EHSwy/dRIP0ng0tuA4S2m43jpbs7ktE/lLt7VvB8ymlb6tCdMOA2M?=
 =?us-ascii?Q?T34GMG75aVwBXtdI7nRnMvhZ5fenekOD+2FsazItJV8nFuNpmQrAzWP3SO5w?=
 =?us-ascii?Q?jvUo5xfLNi/cB4oWOZYvAT3jRvH5lj9sDB8NIfTeZYYvLUclSikt3UHuHyTo?=
 =?us-ascii?Q?/bvYSn+EsceWsT/juYuSEUjkOIK43SwaAUVoSm/xBBFtboVpT5O3LEIamFzp?=
 =?us-ascii?Q?hNNoVNgtcQZ8pS5kc8SoiV3sBtbg/TF595pph7WaSod58b2l0AUZh0QVSOIz?=
 =?us-ascii?Q?Daohf38uw1IGdSBlF4IR1QmUThy8XxASgHaI/B2a9heswAWPWTnW/43BVWB7?=
 =?us-ascii?Q?zXQ8C70vxqOJ6GGKxmB5YxIbSupzWt25UfkwI2IVIK3RHAvqb62hdNeyjz61?=
 =?us-ascii?Q?1IxZJ6oZo69VIca5lkBUv5lwOPVJIHq8YdaVaCpXhQBZfkkwKIoA1yqQPizt?=
 =?us-ascii?Q?KIrqeKZzCxcjOjzAglsPPoccKHnd4iek3FXJ2klUIbZdoSY12Mb3HlAOz6kg?=
 =?us-ascii?Q?Tq+RMcXgee3S/sl9zsMIAlVeUQLycnVw/dx27pDJL155ed9sKvODNcPsMwGl?=
 =?us-ascii?Q?EQzPnAiwQb4tqaTUHw02GMgoP5sPMxC6EpTX13sijBeo/kjbN7IPT8QRkvuJ?=
 =?us-ascii?Q?jbvwjFQZXg+h7S0N9Mis/ALEvX5/Fq3bqpPZc6u9dB9+OABZRBzj+4Wtt5wz?=
 =?us-ascii?Q?/ZF83TZho7IysEJ7hmeM9wMhtViRr31ScDFrF6Kp/4yrDipOR7HNb41Y9VHJ?=
 =?us-ascii?Q?QxNIuWlpAMI3KkrBObFkKVmlZLLDvZVX0tJJVhDqGdoersUR9WeotGps7eD0?=
 =?us-ascii?Q?vJw+DF8JhOHyhuO9XSnCKAIDdf7gue4JYAockClumJBZ1kfb+3YzGrO19z3f?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df90c4ea-5395-48f0-b2e5-08dd2fe2f718
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 12:50:01.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJWLmy7gSsb4QuWsHmxuxxLXIzvTYH7VPVm6iqzGs4YlnFr/oiJ69qcTFVjU7OV746zKRh13n5P+LJcqJAYR3OkVsbk8HIXm99tA4ZuhlAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
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

@Garg, Nemesa, Thanks for the update.

Please updated the version, will add checks for the same.

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Tuesday, January 7, 2025 7:59 PM
To: Garg, Nemesa <nemesa.garg@intel.com>
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Murthy, Arun R <arun.=
r.murthy@intel.com>; igt-dev@lists.freedesktop.org; Kamil Konieczny <kamil.=
konieczny@linux.intel.com>; Kurmi, Suresh Kumar <suresh.kumar.kurmi@intel.c=
om>; Lattannavar, Sameer <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call

On Tue, Jan 07, 2025 at 09:15:32AM +0000, Garg, Nemesa wrote:
>I have updated the ghe lib and changes are merged.

https://github.com/intel/ghe/commit/8fc0c8f825244af5d6f552df7c1df1589e20604=
d

so the new version will break the API. What's the next version that will ha=
ve this changed? If we are keeping the new name, we should check for the ne=
w version.


Lucas De Marchi


>
>> -----Original Message-----
>> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Sent: Tuesday, January 7, 2025 1:24 PM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Garg, Nemesa=20
>> <nemesa.garg@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny=20
>> <kamil.konieczny@linux.intel.com>; Kurmi, Suresh Kumar=20
>> <suresh.kumar.kurmi@intel.com>; Lattannavar, Sameer=20
>> <sameer.lattannavar@intel.com>
>> Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api=20
>> call
>>
>> @De Marchi, Lucas, As per the internal discussion we have updated the=20
>> api name in IGT and accordingly we have merged.
>>
>> @Garg, Nemesa , What is ETA to do the same changes in GHE lib?
>>
>> FYI @Murthy, Arun R
>>
>>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Monday, January 6, 2025 10:43 PM
>> To: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Murthy, Arun R=20
>> <arun.r.murthy@intel.com>; Garg, Nemesa <nemesa.garg@intel.com>;=20
>> Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api=20
>> call
>>
>> On Mon, Jan 06, 2025 at 03:21:54PM +0530, Mohammed Thasleem wrote:
>> >Check ghe algo for the function called by ghe igt while compiling.
>> >
>> >Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> >---
>> > meson.build | 13 ++++++++++++-
>> > 1 file changed, 12 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/meson.build b/meson.build index 8b2a2a64a..96f010fe2=20
>> >100644
>> >--- a/meson.build
>> >+++ b/meson.build
>> >@@ -198,8 +198,19 @@ else
>> > endif
>> >
>> > libghe =3D dependency('libghe', required : false)
>> >+
>> > if libghe.found()
>> >-      config.set('HAVE_LIBGHE', 1)
>> >+
>> >+	cc =3D meson.get_compiler('c')
>> >+
>> >+	if cc.has_function('histogram_compute_generate_data_bin',
>> dependencies: libghe)
>> >+		message('libghe provides the required function')
>> >+		config.set('HAVE_LIBGHE', 1)
>> >+	else
>> >+	warning('libghe does not provide the required function')
>> >+	endif
>>
>> what's the a proper libghe that provide
>> histogram_compute_generate_data_bin()
>> and how were things tested? If there is libghe available, build is just =
broken.
>>
>> Ideally we'd have something like is done for other libraries.
>>
>> 	libghe =3D dependency('libghe', version : '>=3D0.2', required : false)
>>
>> However, looking at https://github.com/intel/ghe, there's no such=20
>> function, which leads me to think this call is actually a typo to=20
>> something else like set_histogram_data_bin()?
>>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Nemesa Garg <nemesa.garg@intel.com>
>>
>> >+else
>> >+	warning('libghe not found')
>>
>> no warning should be added here, like it's not added for the multiple=20
>> other libraries.
>>
>> Lucas De Marchi
>>
>> > endif
>> >
>> > build_info +=3D 'Build Chamelium test: @0@'.format(chamelium.found())
>> >--
>> >2.25.1
>> >
