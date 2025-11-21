Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D5CFA761
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D603710E11B;
	Fri, 21 Nov 2025 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea+gWfI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF410E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763717061; x=1795253061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H6cGozKs+3YV+KZrMEZxVbgnrvmYL5LQdvbjR0h1gi8=;
 b=ea+gWfI5L/Fhpam/jsRfjOrdb2fe7Y9s7C3s5i1uHiON6NRiPt3mW8Cl
 c2nHR5FWlgVrIA0Erk3e4s8aXOz737i2laepAunsi6Fc0ZArtBU7yLeGe
 uS2vIIZiHatTMYCJVWR9ZL0lhm2JUYekcJ/AwBNTbRREP55FgVeRlS94L
 0js5B+GGzCYZagpANq/cZHOiOYNTFCEqackdTlWuO+B1HMSSrpfCA8FNh
 gC8McsP+F2xAI0QHcSqBQ6lIhAnNFsW8fZLjvYrA2VrxfNHD5AnQcT9MH
 EZyO6scArRYWfdKTc+sSWrtBa3tUBMBrQcusHer79U8ULrFWHzhG6If7e g==;
X-CSE-ConnectionGUID: qA9g3WgQSN2Q13Use6FMuw==
X-CSE-MsgGUID: Drts6aodQOuIDnDqkHgEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88457209"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="88457209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:24:21 -0800
X-CSE-ConnectionGUID: ghCfId3LQz2oGk+UxyogwQ==
X-CSE-MsgGUID: 2FMVUJmVSUqJjBPou2ZQHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196596721"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:24:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:24:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:24:19 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:24:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X84948VD9Cai3dljdsRjizb1PfziiAd9/far9MOe6xi/zOP4ynMVs/MMSb/m2eb2XlZhRYmvrXCXtjsndH6FiOtMNkYnVwu4YKB6ePSbmxF9vE4W6PU44ruGMLwLjR9qIfFGIjz41w9Y7Gl5qKrB0h9QPjhXqoD3ZJxBFMLUynDEAHRoUlWSv+bNiFs30k6I9aSfucnre/lo2TelNjUYQYi20PAQQIxprc59NKMh5EwmmiXshcecXnO90kiRUFGwlE9eYkOfE55LStoaH6zBP5XY873oaEYeBLPH1FnQrZVkKNw+pOZvEiUoPAg9adbjRP4svVMIDCsxshkDsosU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jqdE1GyKFLA1eAEBycH/UXJq8mMEfoBQ+UFC/h0gK8=;
 b=tCzPmy71rsqFa1rxo5QxO4a3lBI7Puk0X8I/NMnUaaExahQpI0cAjiwRted0er/SeszodN93n29/n1/Ya+9WALWqT62isaAw6mBWNLTwHE8ON2/JNvgAFZfhw0rRKmWeWmDY+36pivbK8XQYsMQA2ZywbDWGhjcmm6BeHq5Rr00xFjGk1bkavcEdquRMbLsgIAFaL3dTNNeE2xwORUlsi8p1adVxA6AR6Qg9AHfeNyZcedKaur5mpzrlL56rdXC+4HSEKRY2AoCGMcqZRu0JLbzs7QOLNLIaVBRPbni25jERNv/lIWKQVu2VChnUb6I8fd0+OCxN6NmSFR8Q5/boRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7476.namprd11.prod.outlook.com
 (2603:10b6:a03:4c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:24:16 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:24:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 09/12] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v3 09/12] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHcWql2riYb1TyIrU+XgoY/TxnnpbT82zhg
Date: Fri, 21 Nov 2025 09:24:15 +0000
Message-ID: <DM3PPF208195D8DC12BB0071BF913C6DB30E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-10-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-10-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: c8892a25-da27-433e-de5c-08de28dfbdbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?zZYp2cbR5QmjD3OHlMIW6X4NAEI3Az/1aoqZXczAKwrmZ8jee9WRZX24aKHb?=
 =?us-ascii?Q?tkKJfkUMgAE/9W/+s5tXpcbbHD7GzkFbgNEe9MIajk9RLy85F8BLhIfMCfYS?=
 =?us-ascii?Q?pudoWSp2RHH5fEQyAPHRihQBX2FxWLKtB/6ijrC6sVjYiQaPWS4D0lh0jeRJ?=
 =?us-ascii?Q?MQrsu4Y1SGCGaTnhWATnQB954Lh+mjzrz9uFc2Q1FkXnqUE5Tj7Yn5XdZVpF?=
 =?us-ascii?Q?Wbbz/GzUgugdSS93BfKDJ67QbTp4lMTnO1hI+gXc38DPyu/SHJWCL3juJiQP?=
 =?us-ascii?Q?3AyfOn5fpLmBWgHK1BxYBW0eIaJmV+25sMfq6Dj30R/SPRt5sE8c7gV2Z6fZ?=
 =?us-ascii?Q?Xnul0k5xZ6OgB1QmEW3aFZigEIUDM8ihnVxdX5h0NdbNNyATRLwxmMek51rx?=
 =?us-ascii?Q?lDyLC55xemx+4IA1JRk0Qtv2AmmhpW07d4UO3IJzR5O3+uUcmdzLunQNgeFg?=
 =?us-ascii?Q?jLzC5+O3oxMDyFr9Wisvb3V9OFXroaTWL0v0eR7u0UKJ9Mdu9HB4JUnw2edg?=
 =?us-ascii?Q?ORe6gEcYt01NDhZjhFBXOfrtblCKGuURI+yeiqGncbC6l1b37WARy1UZnc9p?=
 =?us-ascii?Q?bNHFF++EOQ2AfKBJ6NkAscaYgVmrn+fmGgBvxl3vtZtZU5YCV8h57zJqRrgM?=
 =?us-ascii?Q?SIEev1qt8YzWy0bPrEVn+irEAbjSKw5w9jxLIlUR3lK7YEOEayCol3T0ySLd?=
 =?us-ascii?Q?ZFdNC8lT2xwr4xDv5S6AdFT6+Oc1l0Odb99Usv6ab+M4x6amj/tRNRgKIzOe?=
 =?us-ascii?Q?BfLYLynEQ1ztaSBZMiHyC3vnLaasFAHrif4FfAPViFm4lLm5JPsLqRHvlfYa?=
 =?us-ascii?Q?MOygLSzouxdu9GeA5FhAxy2LguiHgcvHJd0g13vQfKIK5EiuofLMoWje8Qwb?=
 =?us-ascii?Q?6zVPVaofT59H8w9cwMHmjv6yZtSnV7yiPXmAyzfcyHsQwtf7yZoKeCW2nFK/?=
 =?us-ascii?Q?ELOHQ6QOM5bj2FJa+n7F45IYLpDiS7FvhAxwQCFrTxFzMZo+eAlOCVUc+t31?=
 =?us-ascii?Q?/RKxJZIaEqcAPfyZPDPbM24v8T9Z3OleyNoNkq1alQKej9V72JhBr4XvP4wg?=
 =?us-ascii?Q?HWT7rFsPVwgBx1WI1tLRpc/S9DeNZIpJHw2kqJD23lkvPNvyS2EbhJN7I3Vr?=
 =?us-ascii?Q?FFN1mUEdkGxrIIRIt3rKe32DQ8EK9eatoIqpUWc4V6YS2jIjn3HaIhUYJLCM?=
 =?us-ascii?Q?PF8VeKBl2Bl6vWjWB1YB8Sr/Yv8T/AAvYNjuu4e2vWr1NtVLmSuclbGPKDdH?=
 =?us-ascii?Q?ngZm+woCpJJbVGPWLg0fsVofvojgCYzG0XjkeXJ/38VdqmK5ByvrliRIXa0R?=
 =?us-ascii?Q?2nHJr6J7C4M7fhyNeHeLtYz0BC6lZ5oia0q8jQn2odfSiiBne4yEMWwwAriU?=
 =?us-ascii?Q?30+wQjUOerqa1/QiD26yfbIn+gwHgzDtcspL1RdgkpQi24Na5Sj177Cfg1+/?=
 =?us-ascii?Q?tKXBPmwOn+P4aKbs0kTw2AMvZf+xYIlX3KbiXefLBfzOlQLClkSrjShkZgfV?=
 =?us-ascii?Q?w1YUPQMP37dcxXGq9mfx/nYF2ByUlG+i9wBL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ffq6gDKWAnKUAqOFyno2tDZMrtM37LjaP13S1XgvMrwLl6crTuJZ3pz9hYPC?=
 =?us-ascii?Q?nRJBwwTQHm3sHQmn97R/vs1DpUx6G+GEyoKHz6wx+TKu7DYrpf5CCPkZVTnh?=
 =?us-ascii?Q?2RefdfVAmrfwveCthUOvN4Kd5alQHt/rvDDVVxjReZOjAiP0UcOZNx3ppbPi?=
 =?us-ascii?Q?2lPXPsbTjR7a98tHwwG3JR88gQtS1zawzz8Qg7My4+aHP9vWJcsop/4rYGWQ?=
 =?us-ascii?Q?w6gUguEfXq9/sLmhJVeo+CcqYsyruU5V/1swg8j1WmC+cJtVgA1cS9v2iQbZ?=
 =?us-ascii?Q?jjZXSBASo/7C1fWB4n73QAxBm/fS2jhui3dmyl0OF2GJCt9U2bDzRpsZX3UF?=
 =?us-ascii?Q?rCG/ZLXyS43HWHviECJ5Nn/rLFvd59ehhQGFJiAEQOy90NxOA7bEcaQJiL5G?=
 =?us-ascii?Q?+C5af2WQUk4IiXZktESvb3yW0ySWebWCam+ALIRnmATuMP2RhqBD3Phjx9uf?=
 =?us-ascii?Q?LkooM5tudgkBvldfFpUX9yufYCISIOYRNwPPnwgWeOvKiqsCBaFDCGvhAja8?=
 =?us-ascii?Q?WOy4JMwlSVSYF8J+3M3RwDRs9ASY3uUBoRGHLYn06G7KG2MEfmCmH6frEduU?=
 =?us-ascii?Q?zlZy05yib6PsUqEzq28eOBXTEfpWurGssrc0C+ccsnMZUbFYvH3r9JQXKK1N?=
 =?us-ascii?Q?QJCuV3OsAubMCv8S/mxoSOLkr2aFnQc0yq3e3nwPd0sDo1O9I9jjkMOId1Ah?=
 =?us-ascii?Q?eY43d2LgpkbC8ugdNuX6CJmMHaMrcZjo0RekvDPbPo2H5oyoWjHHgx2OcEoH?=
 =?us-ascii?Q?odY12xyF4ZvmvQJNKqAsmst/RCwNSMTrrYY2IA0n4WCrk0DJRCpT2SI1SLbF?=
 =?us-ascii?Q?8vFSrQf5eLt6vWBD2uPO/KV6RtzPfNfHKMmPQATDaQhmc7NFdwP+lw2Kdk6T?=
 =?us-ascii?Q?y35jFEVcOKWM9aA8lhqFLDLKeWI+p4fbc+uC5MrLK4jRXpSCTLTRkgDeuZKY?=
 =?us-ascii?Q?cR4E/aQ9aFiWl+FRVsbg5NgCYBI08pOZ9pbtn9wD+gQX3xm2JOwM6BmIrmb3?=
 =?us-ascii?Q?X9J2DzuWHCdj93MqHaTwMoqWaGZVng8nJqCzPZqu93aG8S3AVxXU9Ht1bJSk?=
 =?us-ascii?Q?yYN8A+4ZmLT8dbLgQ+jlImTSWbrLLO8MHYpWt2ySP5aDIrFWm8qA0Q2IsTLn?=
 =?us-ascii?Q?mX0OHB/jBM5M6zIZL9af9u9W+UpjZmbJ9zwdvk45OpWHvcsgFGC7rhx+zhbq?=
 =?us-ascii?Q?YkGRQZ2suYmmG8/lZFZYHe6dvXPX/gZOjtIqq75ZJdA/CnWFYldCkPpWGUDO?=
 =?us-ascii?Q?R+JULOt5S3V4h2lefItti9z1DCMoy2LE9O1J/iK3Z3tA0a5q0jsxg4P65Jr9?=
 =?us-ascii?Q?tJE1XkkjD5cPabNuYwrF7qC/cmt+t86PBIiUFaOZ09Ag8QtR60JtBejt6isg?=
 =?us-ascii?Q?cz2sKBb24Zse/XpHfYgmnXv0obAfJLBZ/VQpGTpwe4BcfBpoVf5OciVvNbYj?=
 =?us-ascii?Q?RBwxLeX/ImV7BDwXk/mNu5s0ZAiBoBXZHSWGPD+iqu1SpQ4eUV1rTCV0REzw?=
 =?us-ascii?Q?NCjC0yZ+SannhsQV3iSw53aolpujPTYIJq11TOz3LPc7+O4ZgLWDRb8XTnis?=
 =?us-ascii?Q?4PoAnP1JXyi9ePXpWLE3LZBdR4Hlijf3wJv2Sz32?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8892a25-da27-433e-de5c-08de28dfbdbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:24:15.8741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVnXYKmDHNxtVadAgXymxSCJwP8ezh0/uDxNoUT5VqoOpqOXwJIIu7TKLjSJv9e5rMd6vMi5nWNsNz9MDaFVew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

> Subject: [PATCH i-g-t v3 09/12] tests/kms_writeback: Refactor writeback-c=
heck-
> output subtest
>=20
> Removed individual tests for each format for the test writeback-check-out=
put
> and introduced dynamic subtest generation based on the formats
> supported.Framebuffer creation was now part of the subtest level based on=
 the
> format and removed from fixture.
>=20

Not needed till we verify BGR2101010 till then just skip BGR2101010 and jus=
t provide either RGB8888 or BGR8888 based on condition

Regards,
Suraj Kandpal

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 69 +++++++++++++------------------------------
>  1 file changed, 21 insertions(+), 48 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 530915ea1..581963fe6 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -45,9 +45,6 @@
>  #include "sw_sync.h"
>=20
>  /**
> - * SUBTEST: writeback-check-output-XRGB2101010
> - * Description: Check XRGB2101010 writeback output with CRC validation
> - *
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> @@ -596,9 +593,8 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	igt_display_t display;
>  	igt_output_t *output;
>  	igt_plane_t *plane;
> -	igt_fb_t input_fb, input_fb_10bit;
> +	igt_fb_t input_fb;
>  	drmModeModeInfo mode;
> -	unsigned int fb_id;
>  	int ret;
>=20
>  	memset(&display, 0, sizeof(display));
> @@ -631,22 +627,6 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		plane =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  		igt_assert(plane);
>=20
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> -				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &input_fb);
> -		igt_assert(fb_id >=3D 0);
> -
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> -				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &input_fb_10bit);
> -		igt_assert(fb_id >=3D 0);
> -
> -		igt_plane_set_fb(plane, &input_fb);
> -
>  		if (data.list_modes)
>  			list_writeback_modes(&display);
>  		if (data.dump_check)
> @@ -686,6 +666,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		     "the combination of possible bad options");
>  	igt_subtest("writeback-invalid-parameters") {
>  		uint32_t format;
> +		unsigned int fb_id;
>  		igt_fb_t invalid_output_fb;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes); @@ -
> 738,43 +719,35 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_check_output(output, plane, &input_fb,
> &output_fb, DRM_FORMAT_XRGB8888);
> +	igt_subtest_with_dynamic_f("writeback-check-output") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-check-output-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
>=20
> -	igt_describe("Check XRGB2101010 writeback output with CRC
> validation");
> -	igt_subtest("writeback-check-output-XRGB2101010") {
> -		igt_fb_t output_fb;
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
>=20
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +				create_fbs(&display, &input_fb, &output_fb,
> test_format, &mode);
> +				igt_plane_set_fb(plane, &input_fb);
>=20
> -		writeback_check_output(output, plane, &input_fb_10bit,
> &output_fb, DRM_FORMAT_XRGB2101010);
> +				writeback_check_output(output, plane,
> &input_fb,
> +						       &output_fb, test_format);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_fixture {
>  		cleanup_writeback(&display, output);
>  		igt_remove_fb(display.drm_fd, &input_fb);
> -		igt_remove_fb(display.drm_fd, &input_fb_10bit);
>  		igt_display_fini(&display);
>  		drm_close_driver(display.drm_fd);
>  	}
> --
> 2.43.0

