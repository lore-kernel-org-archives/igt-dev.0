Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CDFEE0217
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 08:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047D210E927;
	Wed, 11 Sep 2024 08:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEfBwJay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5110E927
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726042465; x=1757578465;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wMkoEs2dm3GzuiFD1LLfkwg3cIj8OfZYrS57at0ujtc=;
 b=AEfBwJayXgfJfv4VxSAkideWWTKvq6JagZAp5uo1OSPF2+oYaHDYnua7
 kk9sHRfej4ybgDZq5eRDS+b9lS3iMhXHxCay9w/iVq8fGiKqYcPGtw5UI
 QC6HlhIGYNIf+aO7Ar6nZWEq9mMrsGx2UTcd/VDTaPhgn36NHfQfoD1kY
 myzy7woykUeU1EgR6nMN7hjUfkmgbi2RUvByBQUO1m+Xm3kK2Kxl+bBEb
 FhqgGPoInY8703N9sZ3C1RUhVkA4+F8ngU3wdintHCAInuZJg+Kkvsykd
 D7PPYV7X4qY+9qp3cDugJzxyZR0LN8o2kX0w35QHNZqnY+zyo1cZn4I1Q Q==;
X-CSE-ConnectionGUID: ZkQxhXneQQy9pBM43OHIfw==
X-CSE-MsgGUID: tnwUpag9Snyv2UMGjF1d0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24930371"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24930371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:14:25 -0700
X-CSE-ConnectionGUID: gSnyHVSfTfW/d8XYOQsdZA==
X-CSE-MsgGUID: 4AtcPg/nQ2S7MmRISaqcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67243346"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 01:14:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 01:14:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 01:14:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 01:14:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 01:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0zkBBVSf2A4CwBGbqUZ6OherWmVwqkrF9B/HJXRpozrMY5BW05GQILN4Vu9Naq3vJaykLk1wAUWjYJDPHH99xoCAf4rEFrYXBRNejuL+jAvv2joC4+FmsbCPXhY+0Q/7tUPXomrD5E1rVtfIaCV8kyl/Yr0GZi2qHjO9KQgJDy8PQQuUTH1rWFYs/DOAhdHEyyl4ZVZz7X922er3IeFY/EEPu48VmYlrP3P9QScuKVs+suWTrTJHjlPVm/t7iyTuacs6xHfADuYn5+7u82ULLkls76aftGSPRHaUcxQFwkFCWVqBK1PQjk1NjQ/pucB7W7kNWcGZ+8WwUmQMWlbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwVJfC9ffMLM6MfN5ovFQk/LpPXunNMUPGxaHngj6CU=;
 b=Zb0h/qkGV6V2kEFVkeHedC2y8GL74GbnNK7fQn6XjoMseIRMm8z2ie13l0DPYIdBvR7yfzEtbiQ0JlsHCRHz/wSXnZQ5FGyMcw57lIDofqCCzBhLylNR3YF0e2DcSnA+SeBnMQqJV1zsbIWLVfqm+W1zr62yDx/HdlRCJpxKCnmvRFKzR0nnRbbvRzRTop7BpKQChaVbv2rdENsLgos8Ve0Qxkq3SWJq1Hi6XED79uoqREwNPOU8EYf0JyGp9OZXG9BsYb8pZ4OtovXnQ9eRWZ7ej6OLuj/RjXEkfy9/zpiATh98PcYgdI7GX9jVVaPivJ/zLER/tmC/I3CNwEHNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Wed, 11 Sep 2024 08:14:21 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 08:14:21 +0000
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 1/2] Revert "lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay"
Thread-Topic: [i-g-t 1/2] Revert "lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay"
Thread-Index: AQHbBCGx2/g0/GJWPEKSFD4tP/cPjrJSPKNA
Date: Wed, 11 Sep 2024 08:14:21 +0000
Message-ID: <DM6PR11MB4738E849AD0AD643134E49CF839B2@DM6PR11MB4738.namprd11.prod.outlook.com>
References: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4738:EE_|DS7PR11MB7929:EE_
x-ms-office365-filtering-correlation-id: f5730d6a-2976-4df6-d06f-08dcd239bda9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?blO5NKUFErN9Vk+d8UiViVgtq6WWSCT9n4+2iQGy2yVT70e2nGE/m9dJ7V+b?=
 =?us-ascii?Q?rB1S6xSRC7kgS8tua7FKrKor9w3fWqsHds1+JUVyizoxu8Oun9GP3//tUWkK?=
 =?us-ascii?Q?dEx/HsmR7l+nnS0ouGpE0lQtyR42nxmUqhGdragl4RYIb4rv9//6/WmLMQaC?=
 =?us-ascii?Q?uBgdWJ1eUwA7JwZOQSGPdZFUJDxDJgCFtrf2ZnCoIAD1n4WGmSIt55c0jLAZ?=
 =?us-ascii?Q?OTCKC4wGO4PwxBKzfPW72n3r8PcHbsw0j40Hi/hyADO4hBrQ6ZHA2vMUraEq?=
 =?us-ascii?Q?4wcb7NXgJK9ZJwnwcmC3efmm5PDOuWs4tm1cxq+uk58wyXp890j/DQv70dHT?=
 =?us-ascii?Q?AM88MWbg2h4A3gZQEtP6jG0sgm3gVgg6yqu7S0K4NUfBpwfG4CBSdJWWruUm?=
 =?us-ascii?Q?+0oTKnSJJHWnT//DBHiirIXNHyDsXcxjNVAxzR6mJ10rQebtJrtinUU/J5Tn?=
 =?us-ascii?Q?j+o7qUbjNC+EbHtkAvfkwl2tNOFVqL7GvYtOu0lfxbWApA5k7L0GYQ3hR7NK?=
 =?us-ascii?Q?ZepIGcdxniS2krYSPoznq9q9oxOGudkUzbc3CM4lNqpfQU+Vy5VJufXu5A+a?=
 =?us-ascii?Q?MRyMfn2oxOwkvfJaP8vXxxlnhK19fZjr6/XP+aZi8ixlKDAdpt+12bg2EZub?=
 =?us-ascii?Q?S+MkwGBkJbXfT6gHbL+YwulnKrLZpmMSLkVr9PBt6AtoGR3LDKGj5uNR/J+5?=
 =?us-ascii?Q?qu6n9zjMrhQ8ubAk4wfQOUPp+Z3MMJKpr1mmCjjwIr5WwHN8JxM+NlPbRtdD?=
 =?us-ascii?Q?b17xxSsntGrkLcLin0fujiEcb02c/N1r0GjmtqzWjcTKn2R4sKIqjtCz9xWL?=
 =?us-ascii?Q?c8rMh8GWUid4PGCtwuyL7us9eLNfexa8WHeB6px3xd1ncIkEf3fhvoeSXsKt?=
 =?us-ascii?Q?oDYdMea7YGfjKMI34EMJldp9OrBFmzBMe+fU7kY/j21Keb9IaNo1HN1RQN3m?=
 =?us-ascii?Q?BWIu+AwlDp/ON7C32TJkZb0J4ebOB43xqH6Sh3dlXHh9KKxU556CqY8uz/Fw?=
 =?us-ascii?Q?p3Xa7RcmQLiKetlE4jAj3XBOoqWds+3+RzL9bPsxgwpr0yfMk5pG2/mS1B5I?=
 =?us-ascii?Q?eEbI2iF4nCU4ZSukvb8D38ggbs7X9YDseDweuWSBAs1aMhiGu0pQZzXSEfHV?=
 =?us-ascii?Q?15YFHHWdbuEk00bTnXJGGcLThqADpNMfbCD9NvPP2C5oZ3YCD58/7lkVmUWH?=
 =?us-ascii?Q?XpI8AMxiAxd42bF1uixSxT6IXX2L4s38wJAj73t/vjdi2aHIx8t5of5wwmyg?=
 =?us-ascii?Q?uZxmJ5w5Lw/KxUk+XqzFxoGgLrCxVnpAkcAkegLSOHOsGpHt3dmlJDMbfrdm?=
 =?us-ascii?Q?O6Fx0CCNAYDWzX8XxpPA2EAVa8eXXxFkr//vjn17kjSmKrHEAW4HfYsYwR/i?=
 =?us-ascii?Q?pA7Y8jE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aMmFvld61HRqXYnv3lLRyvZV58o1y1CcKeJoSLEd98ona84ip9WOIFr9Iblj?=
 =?us-ascii?Q?+lQ7owcAuvywSzWhNcx8LajY1I79aDRVs+ABKmpMwimgMPgo57GchBwApw4v?=
 =?us-ascii?Q?JnbyZrrZMAcAsnS46ofC5s8TmTKn0/V8I1tswPKLNqnpv0K+RRnxJTHSN/4z?=
 =?us-ascii?Q?iblTNCRahMcUitYLf0o7f2o0eonDzoQEFeJZWsk8WLmWq/ZLzsMo5kLfr5tc?=
 =?us-ascii?Q?WiJIBQZlDt8ldF26CG/jLkzAGmey5tfhlRTZ6ksSdBXQlJGnX1IRcsiJNZh0?=
 =?us-ascii?Q?r/xHIAusx3T/NjrJIAXLQbc89Ak4YPuKKcp0h9xTcjhLaSGh2KdAVvyEnX8e?=
 =?us-ascii?Q?CMKj2ZqJoiq8T2WMmUrHo3h+A2gA/dyF7xiHsmIRJvASTC9G1vpOpDxSN2aL?=
 =?us-ascii?Q?bB2UlX/b4K0ErsBEYPfLuzwg3Nl5Q+pLy2jynAXCnGC96TLf5816RhfXO2i8?=
 =?us-ascii?Q?SHBhsiIFGlOV0D4z5xEQ7MlR2KgI1cqH/XYLiLZqDHO0pzCQhYXJnQIPExV5?=
 =?us-ascii?Q?8Ao+D5KsLOXU+/Vc5Jd+7sttAYZW1KPsqBA2A4hbtsZoXeuqZ5ypDtrDOUeK?=
 =?us-ascii?Q?c1Mfd3RtsHeVSxYhcThoFJPytFnoR6W9J80vFycXqvUBpXSB3MuIQwrvIF0Z?=
 =?us-ascii?Q?F1JOJ5IhMDZ7BoE0y3cDYmY+gQoFPTiM0fnfmxCDnAtc2bdfGH2ZeLR5mrLG?=
 =?us-ascii?Q?LkiX3snqQLQG9DCOj2Bs5B1mNI3I1wVrY5SwwS6wDyOPO4UqmjVHnpe9ueoC?=
 =?us-ascii?Q?tS7bRpdbSwHt6/u3G2BuNH1lugh+014lgROHBMOxMNw+IKpbnU5g3+9gQ50n?=
 =?us-ascii?Q?oJO+/BslGWKZvoz9M32Qa4CnETiv/GY/oMdAFU7cvAnyCdcxQCQIbtRdF36S?=
 =?us-ascii?Q?9m+p9qnxRqNtDjH6y80u0x4DoFnN/lvOLRNoBgv1qQVMmG7xGM8qJ7VMkbJj?=
 =?us-ascii?Q?IlMx8/DzavXl+qFwoCAItYA8Gd8S+pyrk6fwBuMLyGDsGtEkMRR/cpLggk29?=
 =?us-ascii?Q?WN76BkGjG4KdJvCdI/rxwEOvWzefLQ/2MexYeX5UxSTka/MD2EmiEfIQmPk+?=
 =?us-ascii?Q?vYqvIH/9YfKg/+mS2LBNI5513qPTJ0iJ/u2JfPjDp8ThE8UPW1FkPe4ocqv9?=
 =?us-ascii?Q?fb0o+0TGhyk03qhFE76bZcMmZY7wW0m26DQCEVSwEsjAy1cjxzpZMGHYPu+y?=
 =?us-ascii?Q?rGFTKfi2CnWRKkQYT6HFdIgyqe1wLWRihtXwCIb0/XzE7IDbMWZQxFk/Knrk?=
 =?us-ascii?Q?W376hsrtEs5gRP11igo1AAINaTRFJvMVF3BLfJX8hoQ4zcVrt8zkqPCzQ5/R?=
 =?us-ascii?Q?rYI/LVwb/Cm//EqrA52LaQGKYtcPxN7s+Jw/6DcyGxC5gewGllY9CzB4KhoA?=
 =?us-ascii?Q?zfK+eJ0GAxqfaxMI/ND7yJVIlpDZEhBLrsMPHGmOHAMWmLkAc/T3AMpz/UiB?=
 =?us-ascii?Q?/WpE2rNcxZRTblrT5VZSpYoIkZOnM+QNmRL2RrvqlR7IeUUBW7/DIhznRL0B?=
 =?us-ascii?Q?cTfNQpHkyD+oOMfD3AEM0P1+eJCvmgXmbo0J7Ya2D8ossJFJ3c6TV0CgcX8Z?=
 =?us-ascii?Q?ZrbGK7FnwCRmT/bXMzBOCkropsO+9WHMhjMUUvlSWITuDKkKDbUPvQHxpQgk?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5730d6a-2976-4df6-d06f-08dcd239bda9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 08:14:21.6228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBXj412cXiod8KTO/3Pl/R8se31k7ZQiKAnwr2w3+pmzt+3AHAwBPU1EGbKgD8T8yaMcso63zACj5vgEX2aMhX9vHh40NDujPYnDF+n52gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

Acked-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>=20
Sent: Wednesday, September 11, 2024 1:28 PM
To: igt-dev@lists.freedesktop.org
Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Naladala, Ramanaidu=
 <ramanaidu.naladala@intel.com>
Subject: [i-g-t 1/2] Revert "lib/igt_psr: Remove SRD status change check fo=
r DP2.1 Panel Replay"

Causing regression in CI BAT.

This reverts commit 99861b72ee396a57712bbd0993f3d037cb3e7d40.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2748
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_psr.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 09107cd5b..4e44f44e6 10064=
4
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -114,28 +114,12 @@ bool psr_wait_entry(int debugfs_fd, enum psr_mode mod=
e, igt_output_t *output)
=20
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *out=
put)  {
-	/*
-	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD statu=
s
-	 * remains in the SRDENT_ON state. Remove the polling mechanism for the S=
RD
-	 * status change for the DP2.1 output.
-	 */
-	if (output->config.connector->connector_type =3D=3D DRM_MODE_CONNECTOR_Di=
splayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
-	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
 }
=20
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t=
 *output)  {
-	/*
-	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD statu=
s
-	 * remains in the SRDENT_ON state. Remove the polling mechanism for the S=
RD
-	 * status change for the DP2.1 output.
-	 */
-	if (output->config.connector->connector_type =3D=3D DRM_MODE_CONNECTOR_Di=
splayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
-	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
 }
=20
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *ou=
tput)
--
2.43.0

