Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9D4C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38C910E0E5;
	Tue,  3 Jun 2025 19:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQqRc50P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C4010E0E5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979192; x=1780515192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1PxURge93PS1eVztR1Uw0nZg0TTPD+oSjpUhyj0asao=;
 b=IQqRc50P32YdpJb/lj/CALdfe/L0IK/HnwR+Uo8/SxHLyobKSxgNZEKm
 X84MAmzgE78IB6NaKOSF4XOJuqWr+9HkWyA4wsOqMk+CD/DfItjy8Ho61
 8h6nO0oE3lNWkwNyfUOmuWUuhYHr5e13Nzy09zeNRNGTkAxGq/X6DQYuV
 zreT98mK5UBxl2XMeEtlfyjogwftTuPgd99t2ujs0wVAFfFCPnpvpfhut
 ePGeAd/G9kfaenV+jpR4jfUFVUPAhfw9NzHM156CZ4ELf2EkWiwfaUiLy
 LCufC0eQqWW8o5MI1ywTkxUPKPIjg+Uz+klb9qvDtMX+jTggDMFiANQlo w==;
X-CSE-ConnectionGUID: G7wsT0SvRZqZ5DySNGTmMA==
X-CSE-MsgGUID: lkqCn/roQAG2faFlcsJHvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61657614"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="61657614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:33:12 -0700
X-CSE-ConnectionGUID: sU0vnLlzQmeKppbQ7f4FqQ==
X-CSE-MsgGUID: 1f9j3gTBS1Wd29xNeNseRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="148790124"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:33:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:33:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:33:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 12:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyvT61OgPzeP+rU+EawExIjQpFXEOoyArkRhu+M5s8o8s2IxHMoO6QgE9g8a9FERonynj6PYvrCRx0S2tqHzX6iw4/tjfd7u98qBzXqgFp7s9M6OCUIak1cD8QXsv3enY9eQWS1mffJ1igoixsXmhIvkjYNJyXqTq7W4BgbG60RiMa8ZTFvD0ScK74l0ABIokMaL5baNc+iQkga7uE9AsZQK2AyGWki0x+9mxgRDYH574jQ+w/F/MZFpzAD7Qk0qKiYLBDLR74Ccr6Y0itcin4TCv3uX8uJvA9YWhTNpI0Vb5Jr/ibsO0kgFPTSwi/ODCQOWl6q0IwuBya6NvuAsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAFve6bWwsXTcedbJZIzvnxZR7SLaxUpPjCLb1kNKa8=;
 b=qw0p8AvMkmrANOChq6SGtKxGjU/MRqbclIRF2CCiloPBVtxtt9AF6wFhT5RIIXvIEnhSxVkRj9e5JT0Ia636tG9vWvgrYZM9ANgfvmzfF3VkF52DRLGyb/dEjoeUoF0/yL77lFPWWAFCQcd5OnU9mCPrucjB2NaDAodEhfm/hkgdL2heyoQVSfAMKkEx/ZC4WQR9Z/YNbREmUU2r6xkmnYML9Qnz/XWp8M1KufW4xs9mWWViPeI3/pLLYr2ybNJaxshPRnRPB/gylliYmbSk1mSY/zhJX/bPvRZ9hogu4x3CDIdciqekKtuYyeFxqjbmdpaxfYlpFnC18cRglMA0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 3 Jun
 2025 19:32:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:32:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb1L4WFQuSUZ5Lo0SYdwh+rT1VqLPx0t8Q
Date: Tue, 3 Jun 2025 19:32:40 +0000
Message-ID: <CH0PR11MB5444E22EE02C6AF06F467BFDE56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250603193110.625056-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250603193110.625056-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6185:EE_
x-ms-office365-filtering-correlation-id: deda440e-f912-4e74-a8a2-08dda2d5679d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lS14W34VUbNkiNIJcAYsosyEc6l7Vp4LoCOP61SCoTODe6R+Fxy8rui1nm+R?=
 =?us-ascii?Q?VvYT0ZA/YgsT5INNbcx7M1CyIWl1GjOUG1dgoHENwgVh1xkudy+3nOkuwIJk?=
 =?us-ascii?Q?EbbQgp5VUKe8X7oVz/DhNR2GPFC+BWRFtc8VJytME6PSJDaLKiqDtjbns62l?=
 =?us-ascii?Q?g8ldF9N3joIlEOGKd9rhp13hZvziyLr8PuJN8uoNHLketgZCJtAHUKDXnzEP?=
 =?us-ascii?Q?QmdZGz2sSZcd6lSLcoOfDjEPyeqoY0k43IJcu333KE4cjnHAVV8/3V8z4/3L?=
 =?us-ascii?Q?Q9Pps7mMzvl88YvGvmrmAYmzfAwCWGRbh/3EjV8sgbLA1jXVs8Jv3ddSIXFv?=
 =?us-ascii?Q?VdoIWz5lSP0S4TjK3LUBB9oVm+uuyqyqHTcefOMxo8i3fmZlCanUKxG2RyW9?=
 =?us-ascii?Q?vwx5pyUnutsKv31rs1mMalQhC1Jqa4TDST8pqeGIa9cBZpWoweLxTu+8QY1I?=
 =?us-ascii?Q?BKvnVbFmAjPEzWAhoxhF8BLsg0YenNV9qH9L31C/YDwOUi4b3HPqqbt1ry0z?=
 =?us-ascii?Q?YDhGH5fJCODsqIOhRM264SIMAnhk//RAW013rEmUjNSLp0mDlB7e1L25Otw+?=
 =?us-ascii?Q?hTI/DI8yMBHo06terQH5Gv3iCtyTsXNzNzF02W2e85mi8lIAcY52SbcGDgFN?=
 =?us-ascii?Q?EVy88bglEpB7+z0WlSHPatil6b92nWJrvGRjVrMGKSjiEKlH2BYczFWqtnip?=
 =?us-ascii?Q?Az6v6QBN3vWlJV2LsputM1Rx7drTcawrbWp8U0S4yZwqmQQx5g/BjKLdvub9?=
 =?us-ascii?Q?a+ATPOE4JMGsdRKSMaUvzaMY/f5/97avcfa2QvSPkawK5ABoF0CB2RHfrrbR?=
 =?us-ascii?Q?RMmAdkqx/zaxMZXBHyFzYKzS1rE/Hgz6nN7juu5pNuuL+QX3tsNb48QQ997h?=
 =?us-ascii?Q?WSmF7Kr1LhKwI5clmhFwlH89H/vX8jaz6eFS6frLfBa42IujVIf6TJ0d6xQV?=
 =?us-ascii?Q?Y+qEg68hWxAySnto4SoCRpw4WyxruN1qeBi2nsSVDyxGmvs2zY9y7njdVJJa?=
 =?us-ascii?Q?d1ubLTnfzokUhDGjMWQET5m0ag1huBfrPDuWL6oD4TjgowyN2TelH/0o0jDX?=
 =?us-ascii?Q?YU30C7VritYmcS5IaQLcr8T59wYT7V02RrDWFmteK3toeYp3SGo+ycCdW18R?=
 =?us-ascii?Q?IfW6u4VAYBwmROV3JAiuC6YIs8YRZ9aiyy6wdwBzZ1Dz5PipMU64pkag1hOs?=
 =?us-ascii?Q?M7SAWPxmPm9aK6zNNFxXq1EU1ppxX3HXenkKYsV/oGFMLO+v/MUiTLj4AZSK?=
 =?us-ascii?Q?O4C0s94CEoobXdfWzbW6Dv7t8dkDv6ttxaQ070AH3UEzYN40O0E98ZcGYk7u?=
 =?us-ascii?Q?90adeB/aDNZS3FH4yF0rIG7G128018hp4siiv2p/Nmowyqwjfkwkh3hNAc72?=
 =?us-ascii?Q?lj6B7w1E4bcrVsY179lx7KphZhF3ncl8EUxZxKvnhAj/jwb/ho2pGnsPk2/P?=
 =?us-ascii?Q?FWENevRj6E7WCu4v3QS8ThvlDGOPPkdgwgE07+ehLxa/pijzU4Ua/Aj1dqrH?=
 =?us-ascii?Q?oySQIiLDM5scljA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/blZ1qovgYBFa8soPbHk+htnkv+rU/GcAYLrmX6uDLbqqLupSdjo9KylgUhX?=
 =?us-ascii?Q?HSe9coO6ycBU4edwJs3jBYEKrnD1vJxFnYmIlcrB6e4m2QXgDPxrQ8uiTWPs?=
 =?us-ascii?Q?XMIlxwZnnRWetZjXh1j05WeMOQY21W1dK99WjC0utQZIDqUxgYFaYVbom9cy?=
 =?us-ascii?Q?M+LvxzPtvFThtYDbir0hkjynUIYMk/RLt3q16USGMFB/RE/DFcbRDz4ioodQ?=
 =?us-ascii?Q?KmVKKVe0eT0tNP/xEsL4JiLv40b/Tq3/0jQJuoGMIX5gP6FJDoI2SybDquGP?=
 =?us-ascii?Q?Evq7/E9LL4o8oiSQEzdHh6GXglY7ZbB1Vfpm8brsiTcFllsmIL3MmNHUKpjR?=
 =?us-ascii?Q?utKX9hi4ZGRW2U+c4SXTpY1LU38ay27J7m3PZasJbLWx4TwB5SMHJY7Nj9M4?=
 =?us-ascii?Q?5Qq1A9a0XzNh6VZsKynkA6TbudSwOtvjnOrEfwR76a5YCpJOJqa6x6aSsiFo?=
 =?us-ascii?Q?uzCKuWGOTqpTA1xLY1I1u4bz+/MqWUUWhlkJA4ZdRI9bmWzI5badrZkb7tD9?=
 =?us-ascii?Q?g7hngcuZE9Fvpisjmlhdh8IplGN1kQuWULAMGkgL8rlF7X+uGQclzIraYAPh?=
 =?us-ascii?Q?dYO12Qzhl5AqzR87XWjQeyLY+hNsMjjmrVl2gO6GxJ9u/tqqRpG+CSve/oBu?=
 =?us-ascii?Q?2Qe56gfcUfNpAnv0xVQB1gy/GWJrP0hXLiM8U1fxoDLGi2oLvfyylXE6kP9F?=
 =?us-ascii?Q?lM0w2dh39Fqh7IsofXBoqUrRqEv8Lr5lEOyew9FEA5xSgpeXcK+sl9idvD6M?=
 =?us-ascii?Q?bKpUo4/968ywt0yo3XESCy74hAMENUhCtXd0iuKXcxxXP/OFKCvSd3Y2WxUh?=
 =?us-ascii?Q?5Tpj+AnN4YRQ551zVfaGlG8ZDcHAgm1+Uy3gt+RB4QnExI6QeFOdOTCfx3Zy?=
 =?us-ascii?Q?zpzzgwYVyuyJKcozm2PTntYwObwBww7R/O3F4BbfVD+NGF9hZrCfjCT2a4jf?=
 =?us-ascii?Q?Lcd4Xk50/ZUppr6MPocTA0vZtp12vNQJoRVAD4DVMTUiCtTqqBrxvpyexffF?=
 =?us-ascii?Q?ZfXnX0rFY/QqGy+vTvxlUXYaK1pHinsAwVsc4aYxAE/izk9m2DMdI/9HKa4Z?=
 =?us-ascii?Q?A7gcqRjapEYfZZ+TyNXgL6o3QZVHUoN7bjfq/caV0vrZ2cs2/Y13se34mtfY?=
 =?us-ascii?Q?87zZODhopGWAvWMy8G1i/x25JrEskgZeej8j3ItGP7LUR+B0/laXQW3A0/wg?=
 =?us-ascii?Q?GeyfGmwiVi7EL4D0gMp5TssPedZGqiyewVUfJUF0toE65LZ0WMNHKRWOy2Hx?=
 =?us-ascii?Q?4L/j1dTQ5nPyiW2Udz6KwMco+91NB3NOejLgnkIZp3YJSrcRyIOyjwk+JwX8?=
 =?us-ascii?Q?CWApUDWPL9A73EOEf8eBw9i5Etv573ZcPp6ttXphJ21EInXdP44+cOsQ0lU7?=
 =?us-ascii?Q?bV6DIilAGcpDC4X9nU20dPLbwWEohaT4Ji4vl/pNRuWY+h/9YtqzLVOzoW78?=
 =?us-ascii?Q?dhiIQJlR5yA+BwdyfvkhRv35sysdRYaaaXNffusKhn+xmiflMxeNIZh+0BNf?=
 =?us-ascii?Q?FmQFsUnc48usZW0vi0zpzCdLsuFrci/nYmuqc7XrqeKzKXf1KJHnczfdcku2?=
 =?us-ascii?Q?qxx0TVwT9IYCv2UQalHmacK0AxgIjg1Boa5an/Ir?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deda440e-f912-4e74-a8a2-08dda2d5679d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 19:32:40.6583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: quhe2IspXZcQqNV6Epjpmdf50A1UK7tLO65dFqPH5qiWssd39Y4wdgt5LsOFLPh4e2xMj8WVVImxpgT54j91RkhZScYDSwqDMC6EcGJpUas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
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

Oh for...
Ignore this.  Something weird happened.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Tuesday, June 3, 2025 12:31 PM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; K V P, Satyanarayana <sat=
yanarayana.k.v.p@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=
; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Luc=
as <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C <john.c.harrison=
@intel.com>
Subject: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors while=
 injecting fault
>=20
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>=20
> Currently, numerous fault messages have been included in the dmesg
> ignore list, and this list continues to expand.  Each time a new fault
> injection point is introduced or a new feature is activated, additional
> fault messages appear, making it cumbersome to manage the dmesg ignore
> list.
>=20
> However, we can safely assert that all dmesg reports that contain
> *ERROR* in their message can be ignored, so add them to the dmesg ignore
> list.  This unfortunately does not include the device probe error
> itself, so that must be added separately.
>=20
> While we're here, we should also assert that any errors we see are only
> coming from the target PCI device.
>=20
> v2:
> - Only ignore error-level dmesg reports (or, at least, reports with
>   *ERROR* in them), and device probe failues
> - Add PCI data to regex (Michal)
>=20
> v3: (Michal)
> - Revert name change
> - Add change log
> - Remove fixes tag from commit
> - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
>   move to lib/igt_core.c
> - Minor code fixes
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>  lib/igt_core.c                   | 47 +++++++++++++++++++++++++-------
>  lib/igt_core.h                   |  1 +
>  tests/intel/xe_fault_injection.c | 36 ++++--------------------
>  3 files changed, 43 insertions(+), 41 deletions(-)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b06cdfd894..ecc7bafab9 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -76,6 +76,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_map.h"
> +#include "igt_device.h"
>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
>  #include "igt_vec.h"
> @@ -642,8 +643,8 @@ static void _igt_log_buffer_dump(void)
>   *
>   * Provides a way to replay the internal igt log buffer for inspection.
>   * @check: A user-specified handler that gets invoked for each line of
> - *         the log buffer. The handler should return true to stop
> - *         inspecting the rest of the buffer.
> + * the log buffer. The handler should return true to stop
> + * inspecting the rest of the buffer.
>   * @data: passed as a user argument to the inspection function.
>   */
>  void igt_log_buffer_inspect(igt_buffer_log_handler_t check, void *data)
> @@ -1101,19 +1102,19 @@ static int common_init(int *argc, char **argv,
>  	static struct option long_options[] =3D {
>  		{"list-subtests",     no_argument,       NULL, OPT_LIST_SUBTESTS},
>  		{"show-testlist",     no_argument,       NULL, OPT_SHOW_TESTLIST},
> -		{"describe",          optional_argument, NULL, OPT_DESCRIBE_SUBTESTS},
> +		{"describe",  optional_argument, NULL, OPT_DESCRIBE_SUBTESTS},
>  		{"run-subtest",       required_argument, NULL, OPT_RUN_SUBTEST},
>  		{"dynamic-subtest",   required_argument, NULL, OPT_RUN_DYNAMIC_SUBTEST=
},
>  		{"help-description",  no_argument,       NULL, OPT_DESCRIPTION},
> -		{"debug",             optional_argument, NULL, OPT_DEBUG},
> +		{"debug",     optional_argument, NULL, OPT_DEBUG},
>  		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
>  		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
>  		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
> -		{"hook",              required_argument, NULL, OPT_HOOK},
> -		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
> -		{"device",            required_argument, NULL, OPT_DEVICE},
> -		{"version",           no_argument,       NULL, OPT_VERSION},
> -		{"help",              no_argument,       NULL, OPT_HELP},
> +		{"hook",      required_argument, NULL, OPT_HOOK},
> +		{"help-hook", no_argument,       NULL, OPT_HELP_HOOK},
> +		{"device",    required_argument, NULL, OPT_DEVICE},
> +		{"version",   no_argument,       NULL, OPT_VERSION},
> +		{"help",      no_argument,       NULL, OPT_HELP},
>  		{0, 0, 0, 0}
>  	};
>  	char *short_opts;
> @@ -3034,7 +3035,7 @@ static void fatal_sig_handler(int sig)
> =20
>  		pthread_sigqueue(tid, sig, value);
>  #endif
> -        }
> +}
>  }
> =20
>  /**
> @@ -3581,6 +3582,32 @@ void igt_emit_ignore_dmesg_regex(const char *ignor=
e_dmesg_regex)
>  	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
>  }
> =20
> +/**
> + * igt_ignore_dmesg_errors_from_dut(int fd)
> + * @fd: The file directory
> + *
> + * Submits an igt_emit_ignore_dmesg_regex request targeting all error-le=
vel
> + * dmesg reports (or, at least, reports that contain the string *ERROR*)=
,
> + * as well as any device probe errors, that are reported from the pci
> + * slot of the given file directory @fd
> + */
> +void igt_ignore_dmesg_errors_from_dut(int fd)
> +{
> +	/*
> +	 * Catch any dmesg reports that contain the substring "*ERROR*", as wel=
l as any
> +	 * device probe errors.
> +	 */
> +	static const char *store =3D "probe with driver xe failed with error|\\=
*ERROR\\*";
> +	char pci_slot[NAME_MAX];
> +	char regex[1024];
> +
> +	/* Only block dmesg reports that target the pci slot of the given fd */
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
> +
> +	igt_emit_ignore_dmesg_regex(regex);
> +}
> +
>  /**
>   * @igt_measured_usleep: Helper to model accurate sleep time for tests
>   * @usec: usec to sleep
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 2db579423c..f6affbaf57 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1599,6 +1599,7 @@ int igt_pci_system_reinit(void);
>  void igt_pci_system_cleanup(void);
> =20
>  void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
> +void igt_ignore_dmesg_errors_from_dut(int fd);
> =20
>  unsigned int igt_measured_usleep(unsigned int usec);
>  #endif /* IGT_CORE_H */
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 9fe6bfe351..594c1417a2 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,32 +64,6 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
> =20
> -static bool function_is_part_of_guc(const char function_name[])
> -{
> -	return strstr(function_name, "_guc_") !=3D NULL ||
> -	       strstr(function_name, "_uc_") !=3D NULL ||
> -	       strstr(function_name, "_wopcm_") !=3D NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runn=
er */
> -	char regex[1024] =3D "probe with driver xe failed with error -12";
> -
> -	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> -	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOME=
M");
> -	}
> -
> -	igt_emit_ignore_dmesg_regex(regex);
> -}
> -
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kerne=
l.
>   */
> @@ -234,7 +208,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> =20
> @@ -299,7 +273,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_c=
lass_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_q=
ueue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queu=
e_id) !=3D 0);
> @@ -334,7 +308,7 @@ vm_create_fail(int fd, const char function_name[], un=
signed int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) !=3D 0);
> @@ -397,7 +371,7 @@ vm_bind_fail(int fd, const char function_name[])
> =20
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) !=3D 0);
> @@ -445,7 +419,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, cons=
t char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) =3D=3D =
1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG,=
 &config), 0);
> --=20
> 2.43.0
>=20
>=20
