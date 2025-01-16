Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5A4C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 10:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89B10E01F;
	Thu, 16 Jan 2025 10:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggu2j07g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BE410E01F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737023106; x=1768559106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y3EwOBhXpftfAIZKRqiz40JaUbRAhemzQWgVqYhFxF4=;
 b=ggu2j07gQIfYAH67xNG2CsWGDl376osxEKTft4ldGQllssRCGbpDmeQq
 kR5DNeTc/+0GZnDkKTY1139cAmpBSM7zstmvtpMO/M+T0d90u/uaaPNZb
 4ZU8lOhuYzwxRMObQA6ErqOIVdt38qc1gfuuUSxOrkYaUId7sL05fAexW
 TVOb7T+NWfF3Hs8qt+nIt1cMYaULj0iMyZR0GwRJwkTv5L797e28l5Boo
 zD9mJene/yoS1QyptnPqWHfxNOXsNzYhY5H2Q7L4EfeS1Z3sE8pw5jRfA
 4qOdHEDLtG0m5MlNC8VssZWCelMDbhYrMLlDVKlf3jnaimk+EVIZwmRiG A==;
X-CSE-ConnectionGUID: 8KjUp+oFQ4GBUOQ8ZwfMKQ==
X-CSE-MsgGUID: MICRPrhMQe2TDnJjHlC8Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54815930"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="54815930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 02:25:05 -0800
X-CSE-ConnectionGUID: 7mT1QMl8TfmX8hq95n1gXQ==
X-CSE-MsgGUID: v03H30e5TCq5hO77mbCOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110077254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 02:25:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 02:25:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 02:25:04 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 02:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxpAXlaZr3MEdCTGMoUWueSh1OqVLN42WlhQ2pWiGZHeHqB9eAhyjiNen7DW1Q8DmM+NIv5I5C9zxO+8IhtJRQtE4E1Vw7WflQ4oDAUVYnnLNz+l4NzW6P4ymkUakBlorJB6YAaB9JCESDzMPrqLU3t/ehlEWAQ2XOeFTzfZOCURxbRxJ2DfHgFzGCxeqS2muDQ2T0BC1ltSLFwZzBxt6EQ+oBPsEgp8eDSJnAzf+M8yD9+ezsJJwfUUZ5I6kK6ZN0bKzn1C3Se8cLNiF5DquM+dO5AsS9uTKBbMJZCgoKRVgtwcYlZ1rF09MhVVIaxnX6i8pzO/9TqXpvrLv6zRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NbSR15xtBiRixNxt1JJ19aTueX6sIuqNkqabd3nJLQ=;
 b=r5BPpvOfGn64PaAjqhtTWIVHGAXBQoLdS8wq9idOdtLLBJWJDBNeKTMYHweRU8lSha61zAWen6SG3ZZFBrxFGuufXxoScyv9b8Wraluf1GOXwUln7DfvinT2sqlCFX11Wb+IXphyzmm2KTYcgpcpJdqRa63akqgdlfTMTbTdEwFinBkLDhku90i33ZwHP/e6TKIqpJZfI6pSJX2DTUya8Z+Vt5TYlbha67oLRxRVzDXxHYyjI5Ax8cQOT6Tqclpf5uIPE3bfl24MJkq0fPUzX1l7HW5oQhlGzUbfFcnWd0ghHbz8YK+krf9kxKPe2XO1tD1A4ldx6hewan9tsnOcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 10:24:47 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:24:47 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Thread-Topic: [PATCH 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Thread-Index: AQHbZx2Rvbuh1pcZnUufIBnyUS0D37MZMuJA
Date: Thu, 16 Jan 2025 10:24:47 +0000
Message-ID: <DM4PR11MB6312DFB7D7361F7DB7FBEB12901A2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
 <20250115073243.2002014-4-kunal1.joshi@intel.com>
In-Reply-To: <20250115073243.2002014-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB7454:EE_
x-ms-office365-filtering-correlation-id: 9405177b-4ed8-46af-3a9d-08dd36180092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XNXBO8O6W1ax6L7mTIOD/Aa0S1BN7dmOvKVhzGkAHDYeYyMPi77+ZmGAWCmk?=
 =?us-ascii?Q?sI6viMGNg9snUjrUIprMT4CkR3yQHYrY4K1c8vk6QFlc0a3zjjGIgB/Vy3n2?=
 =?us-ascii?Q?ucUNyTSl+ZTSd79XNy5zaS9wGjxDcyw0H156lkoCNaI8RuZvZ7stGhBKfG6V?=
 =?us-ascii?Q?t6AxfKnRzGzQyda4LllVXzDF94aBNGyQ1grMUCoZegE9KRCmARSPyCu0qPs5?=
 =?us-ascii?Q?HpfxcJZCLxQx95+rLjFOWhfTvZsx12wyzrT1KvD/ak4mdhsAqIORZazfAKch?=
 =?us-ascii?Q?DsTES8HNg6Ch7OCNZFlk9gp2gQ8TeL2DaZCAA3VbjDvnfCnCBDGqZP7YvBrP?=
 =?us-ascii?Q?TCDY9TP1TE5tscrOxDloOoWO5hKn6Tk1b36Qzdb1sc8DvGDeY0ikrHI0ZSeU?=
 =?us-ascii?Q?bIc4YgYdGFL5SQR+jmXMY27iRChMUwPMRO+pGK/KnvbGe8U4pO9MaZaXKdJC?=
 =?us-ascii?Q?3YfViK64UjOvF2Q3rQ0cljKTCEfksvbnizByPO5RJoU4yU5OKFJbJ6Tn307j?=
 =?us-ascii?Q?pEucOBonl0KghxxYFCiXb0LT/X+mcfLHrnpjc49wCkKXmksF6oZQv07t1WzU?=
 =?us-ascii?Q?e2AgQQpSW1InTb2ZGCwc+B4OkKu9sM3X2slWy15azH3gd0jOHq5ozb4ZyxW5?=
 =?us-ascii?Q?WT83jVVxa9+RelDZyHe23vFLxtX6GNq71aelOni9Uxd2jW5lTMkqFalGHfmq?=
 =?us-ascii?Q?Y7kVNRDjgYKWbWTG0udELStgiZkLKOx1fmKU/okkdDARbmpbnoQxMEr9Dqo3?=
 =?us-ascii?Q?cclYAsCzmWTCFLCby7/xISaxN7KzHS5Iv5sjZHpnxH3uBDBYPmfnc14If/4y?=
 =?us-ascii?Q?T82l3FOyFA7HMRXt38n7Qt/C1hUt1XBCyDVsKoh3GKoj8PVLFOD2c1O6/VVj?=
 =?us-ascii?Q?UkeruhBD92e0IUCFrL8AnIgmAW0078tHqNjTIogUTK8oHyjRDcZVZtOPrEjG?=
 =?us-ascii?Q?fIMabbrMNDppTMZCCzybj95WPT3h9BPc33itYiYQHdb47dV2xmbPUTTSTTff?=
 =?us-ascii?Q?59AGCp928+kn67/zh+EnZt5ReiMB2nJTVZ+fTbcZdYVq3ajO0gCrAwKhO/Z0?=
 =?us-ascii?Q?/4ZixoIm1xlBoBgfVi4T89BrtkVmEgOySg4kY1guqtnyQYW75RNbojQbxgPJ?=
 =?us-ascii?Q?cq3bRXcKAw8K3Hy9j1nwuta6etUqvmIPHZtswbcqKmmNAFpEplDvjAeMK+kv?=
 =?us-ascii?Q?z4sEwJvs5zDMJ+1OxJFbBrpWZo3bJ/UgUWyFzCmR7GeW/jJBJaM5yFkldju4?=
 =?us-ascii?Q?LSEOad+/phWb80t+Us56VFdRjEe68rtJj7sP5TE/oIyPB+TT14jPJBBxcbnO?=
 =?us-ascii?Q?sgaxSDwqN7eskXIMiIFutIIqn95C0CpxAo7sjkYbDfmA9Y6lUy4NZBntwr8s?=
 =?us-ascii?Q?w1Sn31V24PZpfIEh2E9kmpGxkuC5GplRAkqWsHTqyqj7ZylXW7469udubuTx?=
 =?us-ascii?Q?kS5tBdhcBqXC4InUtSJzN248CTNGLUxK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dFsmc5It/xbjV83694KDxCcbDW+FoMZcZniZ5r66fHLmpQzlK5qhQa8S8gq4?=
 =?us-ascii?Q?cDFn2G+7Jy4Bx0GciObPZeL4+DMjNomRfVw97GDwKAiaAJQA3e6wNy5581fM?=
 =?us-ascii?Q?XszbNiggFTXWvbT2TDPscmzh3XFOHAOQZPHFYfpnVFY7TQ3PQkK9t0b38QAH?=
 =?us-ascii?Q?6DQZgNMGcHNrXijNUHqM+dYUI4V/joymd4HQJxBHYYKvUxoKy0Jjdx6uomnr?=
 =?us-ascii?Q?KJJn+ezF4sgW2e2Up3Xr8EflaNSEYXPA4tCnprsNP5jkiiQC7j9FWRdjZXQV?=
 =?us-ascii?Q?BYo+UjUTiVjQdURjYlfKnYrgZ9W1iApA2nmMP0Zwa3IAaxXRkZednjSB3PIp?=
 =?us-ascii?Q?iXS1zOkOQ4wxtHZpuKfqq9QrPpk7j6AHZojC4GrBvHyO2BMdv/mPrPHkLdOY?=
 =?us-ascii?Q?p+a+LpN4/9RC0D8LYdgu7fRWfh4gjRaTYz15EaAj1ng9iWJzJipAYGLck5fJ?=
 =?us-ascii?Q?dr5vVU9MhkEEufy02/i1Kym1bZ67s+gjilQlTOjuxf9Wflmba/zqyDODwdTh?=
 =?us-ascii?Q?dud6jlBWNHPR+MHeE0gHZEJKQKXGz2jgVyK0JTMqeBRizNT3nys/g/VwaK4d?=
 =?us-ascii?Q?3q5Hv16UQU30A8ixsh96QVaSf57NdphcwsKMNIY7+GRfp2/QY5B3rzGOV6uz?=
 =?us-ascii?Q?DWIKWQkFL3NxtXGuqoPdTwzxyXtx5C0GT2TApcWLQ91iLXOOcTt+/UgA/2+s?=
 =?us-ascii?Q?OQNbacy9aDyMcGp2roB2hOxWIOc0FMF8Ll6kcsr7vh9wW8mEY37zcgyxN1VZ?=
 =?us-ascii?Q?sBG8bOfQqiIZ0Hv6ldUGJXbnh/ym7cfl9epvfYjpP3ltNnVJZZLj34II03yk?=
 =?us-ascii?Q?/esMK+FcpupmSLyDitfx3RLekC+DExhtw74XKtMNJ4Yv2BfM2EHc6e/a/MjQ?=
 =?us-ascii?Q?H/Qw7ZABe9ab5SFiH6hMemH0nVDmsJO8GZnx2KzArK5YHPPHoCqjNpscAFm3?=
 =?us-ascii?Q?W9yLIMJ07Ji/HsFnbCb2ttaVFGQuUk8aLCLRfsgrJuPDifqpcwmIk5WdnXBJ?=
 =?us-ascii?Q?L4UmHzvkmZSyE0hd5wbem9HedWpiIpTkJoyrxpv1N5LlnK6fjCl1ob+kwzOE?=
 =?us-ascii?Q?+S5IS/ggf3ih9ccV+FZSBtsyVlMMY30Pj8ewdQwTgh0L3xwyGbJel7ykNT4i?=
 =?us-ascii?Q?XdyepvcQr4i6j1pUplW1nJQmn96fh4yA6KZ3ZCz9beU7Bw8d1+Bzxd0xLat5?=
 =?us-ascii?Q?caNrh6m/flVUJoFekNYUg7fkg1OLTjk2xYxOQAimJAtym0cya8JW3i1GsNFJ?=
 =?us-ascii?Q?SjUMGksIb7rnoB7odyPTjff9jsjuAfGk/f6kuCO0bA1MT5pi6RJM4b0TP4Ll?=
 =?us-ascii?Q?sdW0L49cUVWPpoGgrNMQFS2aGXyuoz5f48VsTISi4KZ7rPl4zU8sLXgu2I8a?=
 =?us-ascii?Q?IiP4X3niCIOIkswdWReZ7mgFiJ0WN2WRnLTEojCjcCBg0oBYwLEG3UL2AYar?=
 =?us-ascii?Q?Yec+opAMq5vEoEWqsJb4vYXv05IaDTUazUJzOJK2cFCnkdmPo2BZQan9X86c?=
 =?us-ascii?Q?teo5i7LB7xlnhXzNgaaTRkSkvG+1uwinHVVohUc92ZK+2cc2DsXbLbWca9y1?=
 =?us-ascii?Q?9JXL2Ybm+8db0roRito=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9405177b-4ed8-46af-3a9d-08dd36180092
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 10:24:47.2927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SWkml7wNIN0fDyHhCPkOGy506R3pUVqIhrHqdtjfrV3OTGbflG9Y3s8ZWzVscjTREmKGw5682v/DwXJZpqKFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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
> Sent: Wednesday, January 15, 2025 1:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH 3/4] tests/kms_feature_discovery: Add tests for UHBR/non-
> UHBR over SST/MST
>=20
> This patch introduces subtests in kms_feature_discovery.c to validate bot=
h UHBR
> and non-UHBR link rates over SST and MST configurations. It adds four new
> subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst) that check if t=
he link
> rates match the expected UHBR or non-UHBR capability and whether the outp=
uts
> are MST or SST. The new test logic integrates with recently introduced he=
lpers
> (kms_joiner_helper and kms_mst_helper) for display setup and pipe assignm=
ent.
> The meson build script is also updated to compile these helper sources fo=
r
> kms_feature_discovery.
>=20
> v2: Add definition for UHBR_LINK_RATE
>=20
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_feature_discovery.c | 177 ++++++++++++++++++++++++++++++++++
>  tests/meson.build             |   4 +
>  2 files changed, 181 insertions(+)
>=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.=
c index
> 5bca9ad76..48e655c6d 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -42,6 +42,8 @@
>  #include "igt_psr.h"
>  #include "igt_sysfs.h"
>  #include "igt_types.h"
> +#include "intel/kms_joiner_helper.h"
> +#include "intel/kms_mst_helper.h"
>=20
>  /**
>   * SUBTEST: display
> @@ -71,10 +73,164 @@
>   * Test category: functionality test
>   *
>   * arg[1].values: 1, 2, 3, 4
> + *
> + * SUBTEST: uhbr-sst
> + * Description: Test we can drive UHBR rates over SST.
> + * Functionality: feature_discovery, uhbr, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: uhbr-mst
> + * Description: Test we can drive UHBR rates over MST.
> + * Functionality: feature_discovery, uhbr, mst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-sst
> + * Description: Test we can drive non-UHBR rates over SST.
> + * Functionality: feature_discovery, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-mst
> + * Description: Test we can drive non-UHBR rates over MST.
> + * Functionality: feature_discovery, mst
> + * Test category: functionality test
> + */
> +
> +/*
> + * DP Spec defines 10, 13.5, and 20 Gbps as UHBR
> + * So considering all below as NON-UHBR
>   */
> +#define UHBR_LINK_RATE 1000000
>=20
>  static igt_display_t display;
>=20
> +static void setup_planes_fbs(int fd, igt_output_t *outputs[],
> +			     int output_count, drmModeModeInfo * mode[],
> +			     struct igt_fb fbs[], struct igt_plane *primarys[]) {
> +	int i;
> +
> +	for (i =3D 0; i < output_count; i++) {
> +		mode[i] =3D igt_output_get_mode(outputs[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +				mode[i]->hdisplay, mode[i]->vdisplay,
> +				mode[i]->vrefresh,
> +				igt_output_name(outputs[i]));
> +		primarys[i] =3D igt_output_get_plane_type(outputs[i],
> +				DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(fd, mode[i]->hdisplay,
> +				mode[i]->vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0,
> +				&fbs[i]);
> +		igt_plane_set_fb(primarys[i], &fbs[i]);
> +	}
> +}
> +
> +static bool fit_modes_in_bw(void)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret =3D igt_display_try_commit_atomic(&display,
> +			DRM_MODE_ATOMIC_TEST_ONLY |
> +			DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret !=3D 0) {
> +		found =3D
> igt_override_all_active_output_modes_to_fit_bw(&display);
> +		igt_require_f(found,
> +				"No valid mode combo found for modeset\n");
> +	}
> +	return true;
> +}
> +
> +static void do_modeset(int fd, igt_output_t *output,
> +		       bool mst, bool uhbr)
> +{
> +	int output_count =3D 0, n_pipes =3D 0, i;
> +	uint32_t master_pipes_mask =3D 0, valid_pipes_mask =3D 0,
> used_pipes_mask =3D 0;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *primarys[IGT_MAX_PIPES];
> +
> +	for_each_pipe(&display, i) {
> +		n_pipes++;
> +		valid_pipes_mask =3D valid_pipes_mask | BIT(i);
> +	}
> +
> +	if (mst)
> +		igt_assert_f(igt_find_all_mst_output_in_topology(fd,
> +					&display,
> +					output,
> +					outputs,
> +					&output_count),
> +				"Unable to find mst outputs\n");
> +	else
> +		outputs[output_count++] =3D output;
> +
> +	igt_assert_f(output_count > 0, "Require at least 1 output\n");
> +	igt_set_all_master_pipes_for_platform(&display, &master_pipes_mask);
> +	igt_assert_f(igt_assign_pipes_for_outputs(fd, outputs,
> +				output_count, n_pipes,
> +				&used_pipes_mask,
> +				master_pipes_mask,
> +				valid_pipes_mask),
> +			"Unable to assign pipes for outputs\n");
> +	igt_assert_f(fit_modes_in_bw(), "Unable to fit modes in bw\n");
> +	setup_planes_fbs(fd, outputs, output_count, modes, fbs, primarys);
> +	igt_display_commit2(&display, COMMIT_ATOMIC); }
> +
> +static bool run_link_rate_test(int fd, igt_output_t *output,
> +			       bool mst, bool uhbr)
> +{
> +	bool is_uhbr, is_output_mst;
> +
> +	igt_display_reset(&display);
> +	igt_reset_link_params(fd, output);
> +
> +	is_output_mst =3D igt_check_output_is_dp_mst(output);
> +	is_uhbr =3D igt_get_max_link_rate(fd, output) >=3D UHBR_LINK_RATE;
> +
> +	if ((mst && !is_output_mst) || (!mst && is_output_mst)) {
> +		igt_info("Skipping %s as test expects %s output and output is
> %s\n", output->name,
> +				mst ? "mst" : "sst", is_output_mst ? "mst" :
> "sst");
> +		return false;
> +	}
> +
> +	if ((uhbr && !is_uhbr) || (!uhbr && is_uhbr)) {
> +		igt_info("Test expects %s but output %s is %s\n",
> +				uhbr ? "uhbr" : "non-uhbr", output->name,
> +				is_uhbr ? "uhbr" : "non-uhbr");
> +		return false;
> +	}
> +
> +	do_modeset(fd, output, mst, uhbr);
> +
> +	if (uhbr)
> +		return igt_get_current_link_rate(fd, output) >=3D
> UHBR_LINK_RATE;
> +	else
> +		return igt_get_current_link_rate(fd, output) < UHBR_LINK_RATE;
> }
> +
> +static bool test_link_rate(int fd, bool mst, bool uhbr) {
> +	bool ran =3D false;
> +	igt_output_t *output;
> +
> +	igt_skip_on_f(!is_intel_device(fd),
> +			"Test supported only on intel platforms\n");
> +
> +	for_each_connected_output(&display, output) {
> +		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> +			ran =3D ran | run_link_rate_test(fd, output, mst, uhbr);
> +		else
> +			igt_info("Skipping non DisplayPort output %s\n", output-
> >name);
> +	}
> +
> +	return ran;
> +}
> +
>  IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. =
"
>  		     "The subtests here should only skip or pass, "
>  		     "anything else means we have a serious problem."); @@ -
> 177,5 +333,26 @@ igt_main {
>  			}
>  			igt_require_f(ret =3D=3D 0, "No DP-MST configuration
> found.\n");
>  		}
> +
> +		igt_describe("Test we can drive UHBR rates over SST");
> +		igt_subtest("uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, true),
> +					"Didn't find any SST output with uhbr
> rates");
> +
> +		igt_describe("Test we can drive UHBR rates over MST");
> +		igt_subtest("uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, true),
> +					"Didn't find any MST output with uhbr
> rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over SST");
> +		igt_subtest("non-uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, false),
> +					"Didn't find any SST output with non-
> uhbr rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over MST");
> +		igt_subtest("non-uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, false),
> +					"Didn't find any MST output with non-
> uhbr rates");
> +
>  	}
>  }
> diff --git a/tests/meson.build b/tests/meson.build index 6418899ca..851ca=
8fa5
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,10 @@ extra_sources =3D {
>  	'kms_chamelium_frames': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_hpd': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_feature_discovery': [
> +		join_paths ('intel', 'kms_joiner_helper.c'),
> +		join_paths ('intel', 'kms_mst_helper.c')
> +	],
>  	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
>  	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')]=
,
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> --
> 2.25.1

