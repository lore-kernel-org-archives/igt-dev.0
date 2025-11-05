Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191DCCFA04
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 02:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FB10E695;
	Wed,  5 Nov 2025 02:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dw2Iuom5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F69A10E69D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762308309; x=1793844309;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9syLqOC9hg3qUrGPAAZ0x9bQigYlBr/ajZ5GOoL9ljw=;
 b=dw2Iuom5tsoZYN2Y4XCoI1Z4u1yzWWnHREyms2yFhirVsvaZ0nVy1UD+
 YTu4WUIlgHzpF9tutNiGt+62p4ch2H3R7LZtSzpSc3wco5jVxW3/1samc
 +qNx3Fon6mnj3CnphdCjYpd5Yv7T73l99ZSq2oZDGJC3GRqSE5ty3HPU0
 paoCFpVuiFYRpbnm99E3JuTXIGGwicpmLB7pbPFTb2rMwu/iZQtGFO2jo
 PP0nsfkDxagHNU55buVL8F38jyKnBns4GVn0uqUywH0B6N+P/bvRGgcHI
 hqe0m+5mZbJQr5U8/PxzI8Wj/tTdk+c9TRS2Lnd/X6ek8IaGMjvRGxSPA Q==;
X-CSE-ConnectionGUID: GytcAuXpQN66GrmQbh6MjQ==
X-CSE-MsgGUID: 3gIr2zuLQCePYcyJrH1TsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64564547"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64564547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 18:05:09 -0800
X-CSE-ConnectionGUID: fGFGOMTuQgqxdE87/vsBBQ==
X-CSE-MsgGUID: IUUghwXkQWCYZEidzlVliQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187169776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 18:05:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 18:05:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 18:05:08 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 18:05:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7mBJgrvy+g1auoOi74UQelzC11TTFS4j68dqy8t5gPhEqYPplbxVWhC4bDUtvtDpJ/YZq56eM0Ndx3MB5ZNC1rUoXPsyAHTUyvntsvUgr7w/jN5sUhSq8sTzjgIwpaBBbl/+9CEkbpVAXmbvO5PrD5/qxHo5iQDwTnEhW+a/x0fSpuIghrr+i9sM3Ln+43U4bbFV576ExHouo68SYD9sqfy82NrVGwDNRyIUD+3TZZVjEannvzZEYKMiVaF5kMJNvugVlgiVtlQXvreH4rUE53izaiYrcEPwJIWtOvpKHajY2iEgS+GHAo1/61kc7sVH1AMOttUDaaSnxAHoSaeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIbsS6YIZZHor/tjWC7ZEN7cNdn+m7rYp1jyPdUuz/Y=;
 b=FDdbCNP7uuDQqEwIo164dvkG7UMgsyR9dQnJOY6lWMZ40ikIE1M+bhBNqlZfKxIBidx8e489SCBz4TkMTOCWU20/16q9LUs4MIotYek4cnRhaKIXxdChas+hc3r0PzBWbZD+nMlaLZnH4wwUcWACg9LeoOQZUpVWiAN1mLtfh2YjvsqP0rM/IPTJ8XpELlmcPPktkA4FX67C8bUGpydDtyssJIgkk/OrmXO/bxKEQMtQhITmIS3Gta901cya19bu2+YHFaOVqfZVITTR5jN57SvEf4Y0K9OwukChD1CzMvTv1qSVlZCIv4SBCHNhmQkSUoPd3Yla1lINYnKJY6/jYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 02:05:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 02:05:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Topic: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Index: AQHcTbSZnctigYqBhESbvam13+rgxLTjVP2A
Date: Wed, 5 Nov 2025 02:05:03 +0000
Message-ID: <CH3PR11MB8434F388A8B5176D3347C96A8DC5A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251104175819.13809-1-himanshu.girotra@intel.com>
In-Reply-To: <20251104175819.13809-1-himanshu.girotra@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB6556:EE_
x-ms-office365-filtering-correlation-id: 34ea65ab-fcf6-4f87-8b6c-08de1c0fbbe7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bJ+LD6XGz8NsnnCQQQIPpWgPXHOxOK5c2HRWAMIZGD0n5prWmLV2P8xkBoL7?=
 =?us-ascii?Q?v/sR5w/VZed7rOh2Svk/2o3pICYstPRWE8uhJ2eXk3tb+tCVKhXZR2pP150D?=
 =?us-ascii?Q?hEXowG/jwouG0cM8nC4/O/fFjefnPk9jkeAZWnkrjGnagi5hnP5VogZLgoLQ?=
 =?us-ascii?Q?wkSIlkCADawzQkXY+ZJPme+3f/1Ld7B4XIs1n6+ES7k6LI11MJ0feDDZPAsw?=
 =?us-ascii?Q?uaJbIGJ8zmmmh5H4QhA3x+V0tLzTsLbi3EkGWW5fPLlLIfPBovJpv06t3ofp?=
 =?us-ascii?Q?7NpPNkygSvxvlMmg/U6Ln/vEjjQ0rjcQoQ6lMZ2y3Ppv6bOYTY62Xe2ICZGW?=
 =?us-ascii?Q?vv5EnQ4Y9wNJC1fps/wxY1u7rQaVTe28A6sbQj49vPZhuW48jviOTIG7/mU/?=
 =?us-ascii?Q?zcHUuYX1BcH7ge4zLWPprfdKrCFea/foTqxg6quBiTcryw7J3cbf4OKUowhX?=
 =?us-ascii?Q?An3Tgex+exuz3JKutEelAf8cC3L+tfTokEAgVGLEJEp31y9N961Wn5IUkCwv?=
 =?us-ascii?Q?VerGljr67Tbsn36F3UQJp1z05cy0L+C8YAd1n6u4cwB3IFV08szaOIpdvctv?=
 =?us-ascii?Q?G+3iVQvVGPF72c1Uo0CDjxCR9Zajt0gXynmjCWoGcn+T9QBqalKU0SBUEgUs?=
 =?us-ascii?Q?KqxB7aNLf7XtZYs1FPwfvA6xiuv+C2mhtVLPgt1pv+B5NZ5xO8WHhx8dHAuA?=
 =?us-ascii?Q?/ligS99sfOiC1uVOrk4lGK63c+eHyMfZrWKUSMkawn13zB6kHBF9mpVnqPU7?=
 =?us-ascii?Q?MBgLiWoX7YVwOXkSJ72z6lXCWIAwYKRWeTKazbEDGiOCZbZ432zEwc34AkWl?=
 =?us-ascii?Q?HkWTHzGbZ/nXqYmoxU+DjfojwMCX+mVZ+v3bm9+AmKCeDsaHdtayyyk5nYys?=
 =?us-ascii?Q?FIvAcAfRkoJVBMtdc+5Ac9pLZZtGX9C/Vd0QfaF3+TRVokYLl9QNWJ/cnrqi?=
 =?us-ascii?Q?+mLYX5V9DSsosWIm2UJlzP21YomJwcbM4XJdPC2/+MZLFixO0bjvdqj5VpyY?=
 =?us-ascii?Q?GQOeZNyd7Llo5T3P5K21e7nezHiAo80pHTypxrHEC8zSqq03DPDJDAa+xpUG?=
 =?us-ascii?Q?WCTVvZKMfGJM8jT3I4W4Z303mc67U471TDIpPfJl8GwatWArOJ+Vvf3F8wb2?=
 =?us-ascii?Q?9pFsfFTtFBeFfpaXs9nVyOXpNFZcGB678HJZJ6sgvQ/ALRr+26+UxouIkZ5k?=
 =?us-ascii?Q?e6oDTDKQxo029WZ35gvDjo74pI9poEJ6pvohh4gwEiBJanAWEQjW28ljS1cU?=
 =?us-ascii?Q?izKp4638ukKdB2/VIHLDuSD2u7Memxpau481bi8IeGEZgeVDGIbFb8mztZHs?=
 =?us-ascii?Q?NEp2XcgqPWJ5ExQ/CdWuC8l1yQfwVCsdKBwW/z8m5/aS1EDl45kw1hDNL0qn?=
 =?us-ascii?Q?RNLJpQDpnZYWuivtximB/Oo0HOKjAIeWnBkEkAnUV4a1OBwU0Sg4cKyeSlTI?=
 =?us-ascii?Q?9wBLBQUcvKUK9BtbOX+Ro9uBrZktqjLyyJXqfdpWOFQt51uRBs1HjY/HoUT+?=
 =?us-ascii?Q?7IDY+avHc/RXncW3njj5un/V9Jm1pIeB0ZtV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ox70vn9jeIx1gbvz6igiLFyomVlRcEngCSslNI04IDH7bSf+CmMXpahzQAzt?=
 =?us-ascii?Q?HuSj1mtNE33R9IXOs/dYE0nZ0bEXyJ7fE3RpAeCDz0SUicGxpez6FVwjIzH9?=
 =?us-ascii?Q?EhI3gWo3gVX1NLk5GW6wqTy2iqLxZeAfqbDH7y7LPV7zpIvHEQ64igB38uA3?=
 =?us-ascii?Q?MpV3lH/CEakRQ7K8t1fFgwyVGrwHEviO4SXywDbr8ofrcDLE304dvTjrz82J?=
 =?us-ascii?Q?La4DbagFTsHfgYwgzwn6WXRsDhF9lGUltbnExV6a1DKdROW0GjuW3rFM4Kir?=
 =?us-ascii?Q?fQ8H8QNRQSgsUnPJIiw5HFgZkz0TCUYwQokhihkd11l4BwwwPUQwYrtjj9sc?=
 =?us-ascii?Q?ojSJEdkbeVdU2O6rJO9eNhA0w2FMwZG5IMNF6yaagLp0mDnod03HCYoPmAy7?=
 =?us-ascii?Q?UEFcDYgwnZsCdMEo7igf7yKWOwtVlzZ61rlJu6F+NL6EJ3Pk7pc02KKXhZ21?=
 =?us-ascii?Q?rX3aEaA1pqbZ3/DHujB/cScxfRfJL/puSMA1VzEqSSyYz0yTxD+EDQBhIl4j?=
 =?us-ascii?Q?ROAaiEh1C1O7dotUOXvrXQUuY7UG9R6Ax6sY/zJ9yq2ud1Tfs9DcLM+77x+D?=
 =?us-ascii?Q?NWFZ9LdaJ1Z/9kbkRNsRRifydHe5zYUU9hPtREiAZRNfiq5GJjp0DMSXUqFe?=
 =?us-ascii?Q?J3EwS3YwP3Yt0WM2s+DkVlHt8xpTBKN+UCozQjp2L9bxQt8gQmO9/38FEXtq?=
 =?us-ascii?Q?kXZKo7N0pmjCerc6CxAiYfG/dWfM6mnviAzJD8ekjXzlEcJV3bun+8MkHqzn?=
 =?us-ascii?Q?OSH+UePQ5p32pbU/sBPZNZ3/6Z8PUl2xarV6h+kEXxqKSOxgw6Mx5vFduwBt?=
 =?us-ascii?Q?GSfBv6m/uzhj8RW06g+PoVoBO0zRsQ/+y6c7jKpQ07kaN2UIGzF2BWG1VCEJ?=
 =?us-ascii?Q?ZcYPWti1KhIaDrT8iImb4yqhE4ivoeJHaUWvccioV3xSPA7hBqiHqi6opij0?=
 =?us-ascii?Q?Ljo+BJ8Vv83FGdGOKfoHDSr0KED1+IirMT42W9wZ7UDxwT+WL2nwps5sozQA?=
 =?us-ascii?Q?jLZLhTi1fdu4zWyeq/qnHEoWVbpYgMuR/EQVq3xsN5Ew88rAqVs2mwmJJUGM?=
 =?us-ascii?Q?LYta4PhgNCAW4hZexkjSFMGHqCs07klWVWFWJs2Lt/CUAJdc+9yWhJpBPVaP?=
 =?us-ascii?Q?Og5s04sUJ7gmp151VGJ/rKko0w4J2Q0UcJkvbgmH6xq1gSq20p0l8auHlO9B?=
 =?us-ascii?Q?7MOFbLyJA5JbWIujnDdaia11uWkUqYKfRB5HZffvuhAXAPBMeSa0RQ2DJeSm?=
 =?us-ascii?Q?dFCgTrzXJsTBwIqjLmvT8nGLHlkOOEl6AM/rVB/Q27Rviz62byuaxuWBf9fs?=
 =?us-ascii?Q?b1yy96A9sjklKK5YYg0vcxn1Ewg2n5JyYFxxaP6KSofPA3QdxWtALLGmC2Ii?=
 =?us-ascii?Q?A94xJMyyyKFT0v7UaOsXS+ete0o0fr3QX3o/MvC6pBEh2NNe8s8O5c25Zp9U?=
 =?us-ascii?Q?n1QOQpwgAb/m01obiAmy5iDauB/ju+dU4N0ID/NNjPutlOakBufjIXLf3oN3?=
 =?us-ascii?Q?99VSmS1WpbI1QAjb2aqIz2tgryJRFqZO7QFEfMFQwEhQ7Ml3Npj4c/jv2COJ?=
 =?us-ascii?Q?2jcUEVdzbHJ6vAQ/nrCCIWychdDlmJFV15ivAm1kdvvz7CJ5ZGwFibwiSsuc?=
 =?us-ascii?Q?JQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ea65ab-fcf6-4f87-8b6c-08de1c0fbbe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 02:05:03.5246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6UsI7b6oJoGfM99aSBWSaZfMEs4QDQhiX/gp8UJvqMS7ad3K/xpGYJAYteGLmBUKC6ppbsVKsi6TLxDeRyjN62mx7J+s9ioSN0hZGxo/MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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
> himanshu.girotra@intel.com
> Sent: 04 November 2025 11:28 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Tahvanainen, Jari
> <jari.tahvanainen@intel.com>
> Subject: [PATCH i-g-t] tests/intel: Adjust test documentation
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Change mega feature and sub-category for multigpu subtests and some other
> legacy tests so that it can be fetched under correct Feature Bucket.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_create.c          |  3 +-
>  tests/intel/xe_eudebug.c         |  2 ++
>  tests/intel/xe_exec_basic.c      |  9 ++++--
>  tests/intel/xe_peer2peer.c       |  4 +--
>  tests/intel/xe_query.c           | 55 ++++++++++++++++++++------------
>  tests/intel/xe_sysfs_defaults.c  |  2 +-  tests/intel/xe_sysfs_scheduler=
.c |  2 +-
>  7 files changed, 48 insertions(+), 29 deletions(-)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> e8b8bb025..f0a3f737a 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -383,7 +383,8 @@ static void create_execqueues(int fd, enum
> exec_queue_destroy ed,
>   *              buffer sizes.
>   *
>   * SUBTEST: multigpu-create-massive-size
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Functionality: ioctl
>   * Test category: functionality test
>   * Feature: multigpu
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 4a2c43635..f0d32f6f8 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -932,11 +932,13 @@ static void test_read_event(int fd)
>   *	partial unbind, unbind and unbind all operations.
>   *
>   * SUBTEST: multigpu-basic-client
> + * Mega feature: MultiGPU
>   * Functionality: attach multiGPU
>   * Description:
>   *	Attach the debugger to process which opens and closes xe drm client
> on all Xe devices.
>   *
>   * SUBTEST: multigpu-basic-client-many
> + * Mega feature: MultiGPU
>   * Functionality: attach multiGPU
>   * Description:
>   *	Simultaneously attach many debuggers to many processes on all Xe
> devices.
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c in=
dex
> f652ab6b2..79dace331 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -58,16 +58,19 @@
>   *
>   * SUBTEST: multigpu-once-%s
>   * Description: Run %arg[1] test only once on multiGPU
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
Does sub-category really mandatory here? as mega feature is conveying same =
meaning,=20
also, xe_eudebug multigpu tests doesn't have sub-category , there just mega=
 feature has been added,=20
then why no here also just mega feature is not enough?
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-many-execqueues-many-vm-%s
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Run %arg[1] test on many exec_queues and many VMs on
> multiGPU
>   * Test category: stress test
>   *
>   * SUBTEST: multigpu-no-exec-%s
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Run no-exec %arg[1] test on multiGPU
>   * Test category: functionality test
>   *
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c inde=
x
> b777d2b66..c2b724a52 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -18,8 +18,8 @@
>  /**
>   * TEST: xe_peer2peer
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Functionality: dma buf copy
>   * Description: Peer2peer dma buf copy tests
>   * Test category: xe
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> 2de88fac9..d320f3ec1 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -184,7 +184,8 @@ const char *get_topo_name(int value)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-engines
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display engine classes available for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -211,7 +212,8 @@ test_query_engines(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-mem-usage
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display memory information for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -275,7 +277,8 @@ test_query_mem_regions(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-gt-list
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display information about GT components for all Xe devic=
es.
>   * Test category: functionality test
>   */
> @@ -350,7 +353,8 @@ test_query_gt_list(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-topology
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display topology information of GT for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -414,7 +418,8 @@ test_query_gt_topology(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-topology-l3-bank-mask
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Check the value of the l3 bank mask for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -486,7 +491,8 @@ test_query_gt_topology_l3_bank_mask(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-config
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display config information for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -543,7 +549,8 @@ test_query_config(int fd)
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-query-hwconfig
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Display hardware configuration for all Xe devices.
>   * Test category: functionality test
>   */
> @@ -582,7 +589,8 @@ test_query_hwconfig(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-query
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Check query with invalid arguments for all Xe devices.
>   * Test category: negative test
>   */
> @@ -605,7 +613,8 @@ test_query_invalid_query(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-size
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Check query with invalid size for all Xe devices.
>   * Test category: negative test
>   */
> @@ -628,7 +637,8 @@ test_query_invalid_size(int fd)
>   * Test category: negative test
>   *
>   * SUBTEST: multigpu-query-invalid-extension
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Description: Check query with invalid extension for all Xe devices.
>   * Test category: negative test
>   */
> @@ -793,8 +803,8 @@ __engine_cycles(int fd, struct
> drm_xe_engine_class_instance *hwe)
>   * SUBTEST: multigpu-query-cs-cycles
>   * Description: Query CPU-GPU timestamp correlation for all Xe devices.
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   */
>  static void test_query_engine_cycles(int fd)  { @@ -815,8 +825,8 @@ stat=
ic
> void test_query_engine_cycles(int fd)
>   * SUBTEST: multigpu-query-invalid-cs-cycles
>   * Description: Check query with invalid arguments for all Xe devices.
>   * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   */
>  static void test_engine_cycles_invalid(int fd)  { @@ -929,8 +939,8 @@
> test_query_uc_fw_version(int fd, uint32_t uc_type)
>   *
>   * SUBTEST: multigpu-query-uc-fw-version-guc
>   * Description: Display GuC firmware submission version for all Xe devic=
es.
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Test category: functionality test
>   */
>  static void
> @@ -946,8 +956,8 @@ test_query_uc_fw_version_guc(int fd)
>   *
>   * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
>   * Description: Check query with invalid arguments for all Xe devices.
> - * Mega feature: General Core features
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Test category: functionality test
>   */
>  static void
> @@ -996,7 +1006,8 @@ test_query_uc_fw_version_invalid_mbz(int fd)
>   *
>   * SUBTEST: multigpu-query-uc-fw-version-huc
>   * Description: Display HuC firmware version for all Xe devices.
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   * Test category: functionality test
>   */
>  static void
> @@ -1011,7 +1022,8 @@ test_query_uc_fw_version_huc(int fd)
>   *
>   * SUBTEST: multigpu-query-oa-units
>   * Description: Display fields for OA unit query for all GPU devices
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   */
>  static void test_query_oa_units(int fd)  { @@ -1063,7 +1075,8 @@ static =
void
> test_query_oa_units(int fd)
>   *
>   * SUBTEST: multigpu-query-pxp-status
>   * Description: Display fields for PXP unit query for all Xe devices
> - * Sub-category: MultiGPU
> + * Mega feature: MultiGPU
> + * Sub-category: MultiGPU tests
>   */
>  static void test_query_pxp_status(int fd)  { diff --git
> a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c index
> 393e56651..f21ae94e6 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -7,7 +7,7 @@
>   * TEST: xe sysfs defaults
>   * Description: check if the sysfs engine .defaults node has all values.
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysman defaults
>   * Test category: functionality test
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index faafabd29..90d4ab8fd 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: xe sysfs scheduler
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> --
> 2.50.1

