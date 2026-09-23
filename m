Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00733C9830C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F06E10E0E4;
	Wed, 23 Sep 2026 13:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhZ44VLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7881E10E0DF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790170186; x=1821706186;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nE1wFvH4D7nLxJQ+A9YOnputzfJJTaB3U1tgvpZocMc=;
 b=lhZ44VLUdAWpXYqa2TJJZy7cGdlpcLVskqFNr1i1a/1qfhLN+JLpL/lN
 GY1u9Oil2Ed6OOF8CSdDbDF4Cj81aaKep65x2AUmZU5UZmt5naRgY7WPU
 pjpWjOEhj2y7P+wgxkqSt41v0nlXtWmPh/its67YJWMJ+RXkAU4Ylc05D
 kbIaj2QvsaKE/b4hWlakRSKcmQvZldeus5xzZ5H8ExDxLBnWmLW7l2yw7
 Tt+rqHkV5UXHRKtiW3IjI0b4r3k6/5aU75RYA0yVweDDmFksrJrKuB2bC
 N3LuZErk7u5givoU+voVmtubpL8j9Z1yeJtHoMwA6s0oilf6VzLqeaU9w w==;
X-CSE-ConnectionGUID: I9R/xFq5QombZxVJpy9sYQ==
X-CSE-MsgGUID: 0ATAtpQAR6OYq3/h/M/BDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90888547"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90888547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:29:45 -0700
X-CSE-ConnectionGUID: vvIVDF6UQ5+AZM+Z9Yot1g==
X-CSE-MsgGUID: Ii+ZWTJFSOimSNkZOW/d2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273085068"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:29:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:29:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 06:29:42 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVglIzC95SyVOSq2f/wyQjIT0D6Zg5vzedSqAeQHg+gyzAHfV57zfmY62+TOPl3eJnNGxPoTkHp1Wg3PjL1pU/cG8OTBthprK6Dr/Yc0mcJsbPKhmjjoc0ZSS5ESTQh7r9q5YuR38UODa5d3tRXCpTSxTOCBjAYepw9VjW24MgbHN9ZBw+uJllg6cIp8GhDaNi9A/quM8k0j6bMwsODH1UlKSMwr3f4CeisxgelqgaxM04rU+KjNHD4505fTHVpUy5SRrz+MFOkYwyNWDm+oqeA6NWSTyqL3AA6Tp/pS1dJvDgxB9zeZyURbrUcnjfdv4tOX6u3REDTZfhtuaXqDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9creRDqVZykPCkq9lN1CqZW7J1Yd9HuoWgxISj2596I=;
 b=LPkjGJsSIuH55qhi1A+ftWfbqsQfRfsjuuQ3w5wv8oNn279IQhqJnvzCOh9OrejS/DpnC6G2TmfAHp7octMjxe1qQ6x//PEdd1l9zwCH6RNF+/TEtFWWEpScyo6mZy94iC2TAynAvbzO64WCGMg54DTslCXmxPHB319WvwkcmoYaU2rgukX5/9KSD8EbI9Pre44RKvqjzWFV0fjyVjH2baJLgKXM0jhpWH96qGBt1FijXsd8HI0Ropv1pDZIlAQMm5xhGLvIw4TuthG8SNns+BeI/QynW6qJHdPRHpU3T5nTSvXeS7O0gnqQxScAU85za2+VGRZxFS7fN+0aU0ibJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA3PR11MB8117.namprd11.prod.outlook.com (2603:10b6:806:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 13:29:37 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:29:37 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 10/13] tests/intel/kms_dp_link_training: Add per
 connector mode subtests
Thread-Topic: [PATCH i-g-t 10/13] tests/intel/kms_dp_link_training: Add per
 connector mode subtests
Thread-Index: AQHdRZRNBSfqlnRvaEmCvGseetZQQbbcM9wA
Date: Wed, 23 Sep 2026 13:29:36 +0000
Message-ID: <PH7PR11MB6796345D3348B5DFEED012BCE5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-11-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-11-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA3PR11MB8117:EE_
x-ms-office365-filtering-correlation-id: de3d99cc-f7d8-4d4e-03bf-08df1976b68c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|3023799007|11063799006|6133799003|18002099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: tCRek1s2DtmGb0vvTy1ygV14f8Ha9f1+fg88znKRcfXeo1gDOwTo9aHQxgXfAoROYKs0SSHCMaqNMYv4YuvbY9lj/KE9tXeXttAqFX21LspBiDG8A+PeTt4RIodmYD9wL4pQnwnKAlV9ptp/O9dwBst13qsqzIdq+i07kt8e0lx8Kvr2QyepSQh2JQ26iMkCjm9/Qvo2QPXf0AjxKCSPYWm37SqXYVAA10bq/zIbcl+LzklALAyCWdY5BgmLPi+BYg+55kHDnux8EJJgvcQDVOnlbFMWE0J6+M1BGyz4H2u5EQiLMsgteo6yqhCx8tsmiRCbxuWC7z6hjm+1FEhZRE7RBv/01l5ed6+hC+08B9wZopSYk3UNPhMnse+NWbtgnrOtLJhlvWIOALAgXl+t1PbMxfUU2Pi+E7vrxWNVGYGNLK3C4P/29HZ7xeARqGjNy3K5/KzYpNCfdS/h89YFu4C6gjBAyW42KUOffsptN0jgMvwgbv1Ew29AYfYdwbwworSBnX2wr5gAM1cuhmXZnnW/mLDlCO8PQcHv3jMHp4qhMziYn9j929Xd+VzcpN58W8Yre1/GJu74k3ozekmrteaBu49PSCyZ4Aq29yQAj7+LAaW5z466yMUb/tpHeAcQ/F7Zp96PmPu92cpgGeJ3S0Wr56dt7/WSYdO5KyQrKF6WhZD/szZP+nHoTM47ud56KSuuT0CwPnycjVuhgYQ5t12BJu/TOK9qbxV8gTpNxqQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mbv9XHLGeUN1b/k0Xr/V97Pp9nLVvqO/JPnsGbOrRTHV3Atp7euVsaJurfUL?=
 =?us-ascii?Q?FXqjeeyF92a6A54wY5kfpq5zDW0rvtpyI60RmRPAlrtugq5VguJm7x8SU2sD?=
 =?us-ascii?Q?xQnBdnaI7RUH2K7MseqsW+mxqJsAJ3oGGYG8hg6WzUvBdAGmGq0H/ksns4CQ?=
 =?us-ascii?Q?UInTx4TGk4di7sEXXy5n375qEq3O0f4YFizdLpvcFnX4HDQ7bu/pc9URpfMI?=
 =?us-ascii?Q?1ZlALVTrS84YpABv2e8k8oOCSsuo/2+Q2La3lcQoEvoaTbvwm0bw1e3q8toy?=
 =?us-ascii?Q?nHw0Kzwzqt9/uVGseu/r0K2z//U04HPqp+034YX4yf/07Fba7bQo+wa0k7YE?=
 =?us-ascii?Q?oke/n5tJrMahcHfIvS/bYaTcKaPC6Mf5Fm0LE05cJLuxqwBYeM+2tsJSIrNF?=
 =?us-ascii?Q?MXuwsv/tjn0/F9lnPpdW7P1KOK8U1CtWSZIfYyuFMPpzXIKEd6CDBtrO4pdP?=
 =?us-ascii?Q?O3oOWS1uXJ3zND7Spq4E6VX1ojs+aZ4RANUvHcxE5iDavrvFayv0IlWGvkoq?=
 =?us-ascii?Q?N0n/3J/ZzR3ySfK+7MEzkxxcg6C10draRMFJWgIwL9XdeQ+dYmA4EHuuqgCv?=
 =?us-ascii?Q?U6Rpx5m/CFcmfIYHofMs5Vs8d2ehgemJ4ayY7mO+UX9rc81Rd91itTo81kw0?=
 =?us-ascii?Q?YtqPDE3zrAWbScnhdEkT6wXRseASwdFoRsLSwo09F+Ski3d7hEIUqlJeJ57i?=
 =?us-ascii?Q?7cCKZpK/KQCimc6hojNWud4sl3fCfMEugh/1cBpiYQkdwzLJ3EgzOfhmLm7J?=
 =?us-ascii?Q?KFU743/0czvdr6RVdG7NVUdeiFv+DDdw3gx8duCqopr+mQ0p3C6u3uKGoin0?=
 =?us-ascii?Q?Z9MkUsiruCB+sbaLhAiPlNYR1iioOKoAglp817qik7x1JIyneUd5wzBKkZeK?=
 =?us-ascii?Q?U4OY2ymyxKiSSDu6JSlnhVYnoeIyMrg9mB9jK2zt17sgPqo5d/3m3uuABtp6?=
 =?us-ascii?Q?FSdvgFTQ7Bjik2MtlYKgDXYYscmjkyL7EndR9oS/ZA2gE3GOdcZD7Ua3Rihe?=
 =?us-ascii?Q?E7+Jijzl8vC26yMwgyFwamvQzQfYc2Vpee1+AdsKoyWgdZDV0wOh6sqeT29j?=
 =?us-ascii?Q?ibLnomYGrwuILHU1OP6/L/jQHqRvvPS5/+xwpEqBKIBLcnRSmsMv0MSYFVHG?=
 =?us-ascii?Q?11DEO5TCoYVT2+FH4SNTYU3Wq+9392Tsh3IkJnVrW4NoGPV1c+O6ytexMkLs?=
 =?us-ascii?Q?MOYM8g5dY/7rlmjFx++jkHi2OwNHvTo1hDKEPfgTGe8C5xcO3Y3ZWYz6yNX4?=
 =?us-ascii?Q?IjLrUtg4NC+Xt6Y5CLJgKJasIGxztE5zNpbUEKlSe4dpC8BxqO6gA2FcbyU6?=
 =?us-ascii?Q?iE+lWwscWp/Oi4g6pxwwN/mGpV5XF9hobS8AVmpncB/xRZ9QOjuNpQWzHyde?=
 =?us-ascii?Q?1HuUAy8loTYIYy8BSZOnr/OxbAXK+ziU8jMryJVilxAyw+so7rbeBeZd3G+x?=
 =?us-ascii?Q?shFkgVRNrsT//CBOzKe2RNn+8yHyZbbyb7l9RHqoORwlvEG8N2XOjOFLzzf6?=
 =?us-ascii?Q?udXdrw5FUvMnIvst/jiiP7GCBARiseRbgjJPFp0Jgcm/YLtQrFEIj3Bf5ueG?=
 =?us-ascii?Q?oTSODOP1qgQ0NBtWtxH5LoSxeK+BqnfFA+fPSvxJH4baDNDEvKKK1PrTMsiy?=
 =?us-ascii?Q?fKL0n9dDnvkMe/zdkLOTi0V9QP/RaxBHQgB++uArxJP5QzRTguS+xyuj4NVi?=
 =?us-ascii?Q?Z59EU9BqMSIwyDII5Wr9uRTGCjePMypJCpmbf+FGrv/pZN/U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DEzYfAJEKnRbJndJ3XjI8qLM3vMLOJAC47OwMcYl66Sfi073L7UAuq6KKHgM9xahFnC5o9GeP+ffvbNM1oy4uTUmD8CbPbul6tkof4OVFbNw58Vpor+SQsQkNx9D8B8eqlExZiD1fc9YY+1Vfw6Sp3wT2ce0qUADrH2EEhuIsoRY07XfT1a4eo+CwA2Lx2yeyLxvj9ZgxamtFV4oa6+T5uZt2sBBvaxwTfUTKcl7l9mLw6fJtWoAB1MlFykraxeAnXVk4hCFu7SrD3ZfGVMUSaljtcCe8ORSC6e1dzkj0dVk4cGvkr68+sdikCdgOWayR8IdCpjnjWFkX9aWr34wXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3d99cc-f7d8-4d4e-03bf-08df1976b68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:29:36.9192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haJXxvt5pqIGl+HFTxHrQVhg+j9bZpWlecUGS9+IVOJweUFWbYzaFV3nJ9/MS0yf4fBaki06hnLyq9pBjq2Qgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8117
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
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 10/13] tests/intel/kms_dp_link_training: Add per
> connector mode subtests
>=20
> The four existing subtests cover whichever connector mode the machine
> presents. On a machine with a Thunderbolt dock they train a tunneled link=
, on
> one without they train a direct link, and the result is identical either =
way, so a
> lab that never had a dock looks the same as one where the tunnel works.
>=20
> Add eight subtests selecting links by connector mode:
>=20
> 	uhbr-sst-tbtalt-train        non-uhbr-sst-tbtalt-train
> 	uhbr-mst-tbtalt-train        non-uhbr-mst-tbtalt-train
> 	uhbr-sst-direct-train        non-uhbr-sst-direct-train
> 	uhbr-mst-direct-train        non-uhbr-mst-direct-train
>=20
> with the same per configuration dynamic subtests as the existing ones.
> "direct" is native, DP alt mode and legacy together: they all take the li=
nk clock
> from the PHY PLL, and only tbt-alt takes it from the Thunderbolt PLL, so =
that is
> the only split that changes which driver code runs. The raw mode stays in=
 the
> inventory line, so dp-alt against legacy is still diagnosable from a fail=
ing run.
>=20
> The connector mode has to be in the static subtest name rather than a dyn=
amic
> one, because a dynamic subtest that skips is not counted as
> executed: a container with one pass and twenty skips reports PASS, so a l=
ab
> with no dock would look green.
>=20
> Keep the four existing names and their PHY agnostic scope. They are not
> redundant: they are what to run on a machine nobody provisioned for this
> matrix.
>=20
> Expect most of the eight to skip on any one machine, since dp-alt and tbt=
-alt
> are mutually exclusive on a port at a given moment. The skip reasons name=
 the
> connector mode so the two causes - no such link, and a link that allows n=
o
> configuration in the encoding class - stay greppable apart.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 142 ++++++++++++++++++++++++++++-
>  1 file changed, 137 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index e6160cee5..229eb3d69 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -21,6 +21,40 @@
>   * Description: Test we can drive non-UHBR rates over MST.
>   */
>=20
> +/**
> + * SUBTEST: uhbr-sst-tbtalt-train
> + * Description: Test we can drive UHBR rates over an SST link tunneled o=
ver
> + *              USB4/Thunderbolt.
> + *
> + * SUBTEST: uhbr-mst-tbtalt-train
> + * Description: Test we can drive UHBR rates over an MST link tunneled o=
ver
> + *              USB4/Thunderbolt.
> + *
> + * SUBTEST: uhbr-sst-direct-train
> + * Description: Test we can drive UHBR rates over a directly connected S=
ST
> + *              link.
> + *
> + * SUBTEST: uhbr-mst-direct-train
> + * Description: Test we can drive UHBR rates over a directly connected M=
ST
> + *              link.
> + *
> + * SUBTEST: non-uhbr-sst-tbtalt-train
> + * Description: Test we can drive non-UHBR rates over an SST link tunnel=
ed
> over
> + *              USB4/Thunderbolt.
> + *
> + * SUBTEST: non-uhbr-mst-tbtalt-train
> + * Description: Test we can drive non-UHBR rates over an MST link tunnel=
ed
> over
> + *              USB4/Thunderbolt.
> + *
> + * SUBTEST: non-uhbr-sst-direct-train
> + * Description: Test we can drive non-UHBR rates over a directly connect=
ed
> SST
> + *              link.
> + *
> + * SUBTEST: non-uhbr-mst-direct-train
> + * Description: Test we can drive non-UHBR rates over a directly connect=
ed
> MST
> + *              link.
> + */
> +
>  #include "i915/i915_dp.h"
>  #include "igt.h"
>  #include "igt_kms.h"
> @@ -60,6 +94,38 @@ struct dp_link {
>  	enum i915_dp_tc_mode tc_mode;
>  };
>=20
> +/*
> + * enum phy_filter - Which links a subtest selects.
> + *
> + * PHY_ANY is the PHY agnostic scope of the original subtests. The
> +split
> + * between PHY_TBTALT and PHY_DIRECT is where the link clock comes
> +from: only a
> + * tbt-alt link is clocked by the Thunderbolt PLL, native, DP alt mode
> +and
> + * legacy all use the PHY PLL, so folding the latter three together
> +does not
> + * change which driver code runs.
> + */
> +enum phy_filter {
> +	PHY_ANY,
> +	PHY_TBTALT,
> +	PHY_DIRECT,
> +};
> +
> +static const char *phy_filter_name(enum phy_filter phy) {
> +	return phy =3D=3D PHY_TBTALT ? "tbt-alt" : "direct"; }
> +
> +static bool link_matches_phy(const struct dp_link *link, enum
> +phy_filter phy) {
> +	switch (phy) {
> +	case PHY_TBTALT:
> +		return link->tc_mode =3D=3D I915_DP_TC_TBT_ALT;
> +	case PHY_DIRECT:
> +		return link->tc_mode !=3D I915_DP_TC_TBT_ALT;
> +	default:
> +		return true;
> +	}
> +}
> +
>  /*
>   * check_condition_with_timeout - Polls check_fn until it returns 0
>   * or until 'timeout' seconds elapse.
> @@ -606,7 +672,8 @@ static int discover_links(data_t *data, struct dp_lin=
k
> *links, int max_links)
>  	return num_links;
>  }
>=20
> -static bool test_link_rate(data_t *data, bool mst, bool uhbr)
> +static bool test_link_rate(data_t *data, bool mst, bool uhbr,
> +			   enum phy_filter phy)
>  {
>  	struct dp_link links[MAX_LINKS];
>  	bool ran_any_link =3D false;
> @@ -628,6 +695,15 @@ static bool test_link_rate(data_t *data, bool mst, b=
ool
> uhbr)
>  			continue;
>  		}
>=20
> +		if (!link_matches_phy(&links[i], phy)) {
> +			igt_info("Skipping %s: %s requested but it's %s.\n",
> +				 igt_output_name(links[i].output),
> +				 phy_filter_name(phy),
> +				 i915_dp_tc_mode_name(links[i].tc_mode));
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		}
> +
>  		data->output =3D links[i].output;
>  		igt_info("Running link training test for %s\n",
>  			 igt_output_name(data->output));
> @@ -665,7 +741,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("uhbr-sst") {
>  		igt_require_f(intel_display_ver(data.devid) > 13,
>  			      "UHBR not supported on platform\n");
> -		igt_require_f(test_link_rate(&data, false, true),
> +		igt_require_f(test_link_rate(&data, false, true, PHY_ANY),
>  			      "Didn't find any SST output with UHBR rates.\n");
>  	}
>=20
> @@ -673,22 +749,78 @@ int igt_main()
>  	igt_subtest_with_dynamic("uhbr-mst") {
>                  igt_require_f(intel_display_ver(data.devid) > 13,
>                                "UHBR not supported on platform\n");
> -		igt_require_f(test_link_rate(&data, true, true),
> +		igt_require_f(test_link_rate(&data, true, true, PHY_ANY),
>  			      "Didn't find any MST output with UHBR rates.\n");
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over SST");
>  	igt_subtest_with_dynamic("non-uhbr-sst") {
> -		igt_require_f(test_link_rate(&data, false, false),
> +		igt_require_f(test_link_rate(&data, false, false, PHY_ANY),
>  			      "Didn't find any SST output with NON-UHBR
> rates.\n");
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over MST");
>  	igt_subtest_with_dynamic("non-uhbr-mst") {
> -		igt_require_f(test_link_rate(&data, true, false),
> +		igt_require_f(test_link_rate(&data, true, false, PHY_ANY),
>  			      "Didn't find any MST output with NON-UHBR
> rates.\n");
>  	}
>=20
> +	igt_describe("Test we can drive UHBR rates over a tunneled SST link");
> +	igt_subtest_with_dynamic("uhbr-sst-tbtalt-train") {
> +		igt_require_f(intel_display_ver(data.devid) > 13,
> +			      "UHBR not supported on platform\n");
> +		igt_require_f(test_link_rate(&data, false, true, PHY_TBTALT),
> +			      "No tbt-alt DP SST link allows a UHBR config\n");
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over a tunneled MST link");
> +	igt_subtest_with_dynamic("uhbr-mst-tbtalt-train") {
> +		igt_require_f(intel_display_ver(data.devid) > 13,
> +			      "UHBR not supported on platform\n");
> +		igt_require_f(test_link_rate(&data, true, true, PHY_TBTALT),
> +			      "No tbt-alt DP MST link allows a UHBR config\n");
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over a direct SST link");
> +	igt_subtest_with_dynamic("uhbr-sst-direct-train") {
> +		igt_require_f(intel_display_ver(data.devid) > 13,
> +			      "UHBR not supported on platform\n");
> +		igt_require_f(test_link_rate(&data, false, true, PHY_DIRECT),
> +			      "No direct DP SST link allows a UHBR config\n");
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over a direct MST link");
> +	igt_subtest_with_dynamic("uhbr-mst-direct-train") {
> +		igt_require_f(intel_display_ver(data.devid) > 13,
> +			      "UHBR not supported on platform\n");
> +		igt_require_f(test_link_rate(&data, true, true, PHY_DIRECT),
> +			      "No direct DP MST link allows a UHBR config\n");
> +	}
> +
> +	igt_describe("Test we can drive non-UHBR rates over a tunneled SST
> link");
> +	igt_subtest_with_dynamic("non-uhbr-sst-tbtalt-train") {
> +		igt_require_f(test_link_rate(&data, false, false, PHY_TBTALT),
> +			      "No tbt-alt DP SST link allows a non-UHBR
> config\n");
> +	}
> +
> +	igt_describe("Test we can drive non-UHBR rates over a tunneled MST
> link");
> +	igt_subtest_with_dynamic("non-uhbr-mst-tbtalt-train") {
> +		igt_require_f(test_link_rate(&data, true, false, PHY_TBTALT),
> +			      "No tbt-alt DP MST link allows a non-UHBR
> config\n");
> +	}
> +
> +	igt_describe("Test we can drive non-UHBR rates over a direct SST link")=
;
> +	igt_subtest_with_dynamic("non-uhbr-sst-direct-train") {
> +		igt_require_f(test_link_rate(&data, false, false, PHY_DIRECT),
> +			      "No direct DP SST link allows a non-UHBR
> config\n");
> +	}
> +
> +	igt_describe("Test we can drive non-UHBR rates over a direct MST
> link");
> +	igt_subtest_with_dynamic("non-uhbr-mst-direct-train") {
> +		igt_require_f(test_link_rate(&data, true, false, PHY_DIRECT),
> +			      "No direct DP MST link allows a non-UHBR
> config\n");
> +	}
> +
>  	igt_fixture() {
>  		igt_reset_connectors();
>  		igt_display_fini(&data.display);
> --
> 2.25.1

