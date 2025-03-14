Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62849C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 12:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203CB10E9DE;
	Fri, 14 Mar 2025 12:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAep2kmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294410E9DE
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741954458; x=1773490458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kZJMj54JumJp92RpuTE23lIDMZVL8FlKegmiiARAvao=;
 b=HAep2kmRCuMt/vh89fgVHkYVw+z/4L8rqyLkvXyyG4kEqe1hPxtNxB7O
 wYN03+S/qVRrpA3RmzjN4YDqXlMq1QdZn5bhJ6AeQtlimoU6AqoLK6NR9
 cNstLwtmGbv4sRyGxSqlzQO7469cXJO1zzAgqAwLyjKqkcayjdhvF2CMG
 nMZNNiahcIDBywjkFypUaOnkihnYxUXKBYH49PJ3Hve0ttaAtq0c74Yl2
 jolFsEw3VE4W0o8rzkirtmTZF2L9ioBZXTODFuRnfCjDVG7LJpty6UvtT
 iUmFK7yj4R9x0f/5YBDn6H+MGbxBCjvt37EzVpNWZ9Qdbw9RTXnt/GYnL Q==;
X-CSE-ConnectionGUID: Op+BYGEESQ24GtCokYqjhg==
X-CSE-MsgGUID: X7VPvtO8R1Ci1mZ/vBZOuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54483352"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="54483352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 05:14:18 -0700
X-CSE-ConnectionGUID: +1e7oiG9TxiLi+E2TCrhkQ==
X-CSE-MsgGUID: uvhHMP+HRJmLIVwnbiOgBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126133491"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 05:14:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 05:14:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 05:14:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 05:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQDN5z1/56szQEhtCNQe8kt/j1GjUh26OlhVnlYBa9zCJjrRMXiAdz4ZREfPybKfhm/l/SVIfMjuOVcMgMryHFy7bBKliSZOmX962t3E5DBdTUODlmF6Fj+oGW9P4OuILpNIOCRnF6ek9EL1aI/dUhGbProwEDqH5NbTacUV5yAqd4LWM12+0CMWnuPaOQ5PSHVbDWS/RusVS6yD6TNRR7rxrtBU26mVcYLnamcbIEjb20+Of91eT7mbdlEcer1HZVCqRPQIRkCw4L5RhTvZQIkgYTJMSv3TsUsWPHj87Eynkb9XQzt9rUDPwhWpFVa0t2h2Qf4qPImqUwqb0OyI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvGVgCEEm+wOquKQvSl9pNUV+DN+pQFBVHdxQ/QVFmE=;
 b=TjKSTDo0UOCQWCfLHAeHQiTUwZyi8WEUmsMU/8gvsTt5Pn21QloA9muTYU5S5owFo1JNMZMpGGqTQTaZ99WLZlsbdj/Pq3elQ6OsEuCZOa013gEDbCSChpP6ymT5ITNILFK4Nnc8B1nD1SeBqHiip+B+xy6r4DG2lIS8+6lMROs6FaR53CwGDLu2yv7UsHwDgQ9rJl3O063J+qTj2qwZUSmDR6PPoRwxhrr450FnkWjMJMzSQBqm6aBo8fjyFOWMrAtsOkLVG5Trb41v3umKlOdDrI/zhIDVdEG+6LHMZs2mhq2Yf8VRMmt+sXo4NBLbHZrLhzjo7VU2nMUUCe5vIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Fri, 14 Mar 2025 12:14:06 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 12:14:06 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_allocator_simple: Prevent deadlock due to
 log mutex contention
Thread-Topic: [PATCH i-g-t] lib/intel_allocator_simple: Prevent deadlock due
 to log mutex contention
Thread-Index: AQHblNft8us0BB0Xpku55OgPwbHV/rNyip+A
Date: Fri, 14 Mar 2025 12:14:06 +0000
Message-ID: <DS0PR11MB7264FA282EB8E13ECB0E7D6CD9D22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250314115444.293063-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20250314115444.293063-1-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CY8PR11MB7034:EE_
x-ms-office365-filtering-correlation-id: 5933f36c-0282-4142-6d1e-08dd62f1b780
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?+x12KAiCeVrCYOaI5a5Vy4BQnXTHbKDskVrCtchCUD+B2fgKuxB7j990J7?=
 =?iso-8859-2?Q?5Li3AJsdMeh038RiqH1xPU0t6gJlqVERNFias2GP4lzyCSgu7Yj78KhBTY?=
 =?iso-8859-2?Q?SzGyWaGjaUaNHVgIOF8FKgb4VoQJ8F9stUEc6CjhSFa/xagfFfxMKnEYSG?=
 =?iso-8859-2?Q?2mwh2yzMRpXuFnQTJw/ZdSz2qT/ogiEBD31B470yNovujxYSUPYtoXoryZ?=
 =?iso-8859-2?Q?tFsKwikB5WoLCebhaMOsV3r8rSCJYMbcRlGqSeDjeGmMM150XvUca33VS6?=
 =?iso-8859-2?Q?PJp/e60wix4L7aHz6jlpo2L9NWqhGPzJCm2tt/UwLpAD3hOF0cCEAkH1ny?=
 =?iso-8859-2?Q?JRDqm5dUf8ByxvcpF/w55Y2UD76Lm0cFBbHVugspU4iCKgfNVVZeXi7JJ6?=
 =?iso-8859-2?Q?4SOxPDCRElHha42gXtXA2SaYWmxBEHj4QKbV5FOx0oVASdFvydwOOzcvZm?=
 =?iso-8859-2?Q?mZlaC2Sw9eiBZb66iugNWsdehGym+S97bt9bAeALyCP7HPCribn4TQWhRb?=
 =?iso-8859-2?Q?wTOF15jvcsgOj5C9iDy3l614FhbBSgRtzd/5wf0xILceBffs6wBDyUVbb7?=
 =?iso-8859-2?Q?KIRPPkdBaBlq3v51sfuA3R91QxtpsDQ4Mk7kOGvP/M1BriLtRmcW5bG+9M?=
 =?iso-8859-2?Q?s96TXm3zi07/s6z0dv3uS6sAm6VFaBsUv2oOxVpceM6k9VgicHlCpVOg/+?=
 =?iso-8859-2?Q?qoPeNa8wrVUQ1+kqWbAKNqgXtKwrMUGcQ9bp2hDDWjsI1RbhhmQUUzXWEU?=
 =?iso-8859-2?Q?xb5BYoZArW7heC1AqOvrCrel7bIwOd+j784bApOSE8ikQDGKhMQ1xn6Dy5?=
 =?iso-8859-2?Q?0gBNQma+Twfre8Y4f+Ujz2P0KqEJFqqtQfSs2pnXZEjtzOrv2ms2ChfWGn?=
 =?iso-8859-2?Q?LhM9n6q0+d4NdjMnuY6LLdDWOKoXkOzhlEQFvGRimDL1JDvJPoJyyRLH7M?=
 =?iso-8859-2?Q?DjinQCPwK+ZMTU/i8giMwrT1jYrASXE2YMg0YRndVB62u/JPXj8KZ9hXyX?=
 =?iso-8859-2?Q?amyxKN9UlEgqTb2kzmjd+J9qCrp+UbYpx+P6zIum/9YklFh/GBtt1PK2QE?=
 =?iso-8859-2?Q?dhWsEOUN/NuJ/S3iVPivIbCxK5bxKT4VG98upWEtw2Psne3HhpNFLdExVA?=
 =?iso-8859-2?Q?7p0htvElLaytYltb+cJGxPu1HVOH2AnVRXcEToYCjL2aJQ6Ck7kb24yWRQ?=
 =?iso-8859-2?Q?pJexlqRZe9QT+Y1Didyr/XQOBQAbBIbQkskdBIlx1X0GEEO4Y1+V+CpAyL?=
 =?iso-8859-2?Q?b1C1odtRhR5o5++cwMFH4rI2HlKkEzWHHJZn0oBG5zh8+zBxZxsDsvsNhp?=
 =?iso-8859-2?Q?lvYINchsJD3SqGSf9uncK/RFlnskWqKPGzj4WahFdivgND1tLduNyYmirC?=
 =?iso-8859-2?Q?6qOaqFuInNUpzIU8Xknt21SO0NdYkBCGXw6LDJEZfSVtWcuDopMqkZlnKi?=
 =?iso-8859-2?Q?sB4AL6OowIy3q0Vo+XJHcvCDQ1RD6Uiolg7shAjQtjxDjVc9kplf/m+0VM?=
 =?iso-8859-2?Q?S16uyQMTTdjuA6SdbulftL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?+aWRH13gsKHHP73NzKtjMIf61G6KVFC1ZOOjFGFV2zUu8JPFAaD9UeI/95?=
 =?iso-8859-2?Q?zmCRarwpO1XgRgPQGzyNV74hyFNoNdXdjAeE1cNmyGG3YEKVsLaj/Qlv31?=
 =?iso-8859-2?Q?VLH89XdCUqbmbxBB1EL/skX3Uxjhp8yENmHyoYylpp1inj7VbkaqkxQH0t?=
 =?iso-8859-2?Q?SyVSMq3rP2t6juln7TstuWFgonqbnqzCgQotCIHxXeYZH3Q89E9iLmTCiE?=
 =?iso-8859-2?Q?87izTtRhwPe0Tzh3Ct/+CAnDT4OEn74cl/bD8bi5kkO/YhoE0qGlXifBR0?=
 =?iso-8859-2?Q?14dzKgDhM8MojBa5qiR94jbdQ9ngi1cKrYDsYYw2/XGxJar6ox4Y1wU8gh?=
 =?iso-8859-2?Q?+0qCUdTSGSp3n4Ng1MsG8wG51Vwn4iOLIqJd2TGAoNzICupvdKdp6FyUjx?=
 =?iso-8859-2?Q?v2IqFqz2VCWuprzGlcUH1+phu7z+cLZ4jCt0cR+9AZVwBfFkAHFe41NLZH?=
 =?iso-8859-2?Q?MEVuTAuap/qfOF2QFFO09sVon39+Swtex5JIoOcKWYpjsODTWaOIlnhlFZ?=
 =?iso-8859-2?Q?bq1yfubRk0Ew5bcOFyRKsHKZNIrWnmp+mx3VW0Cmm5927hO1vqWfq9PZFl?=
 =?iso-8859-2?Q?TigFNQZEOyTRsaItTy0I1yT++YdXXdif/Ciz1SooLKJgvFJXXVcZlvqpcA?=
 =?iso-8859-2?Q?ywJYb3kC9eMOzSW7LMhDh/Fau3UIOMzhyVkZ1AUD838kkR7uNt6vak1EM0?=
 =?iso-8859-2?Q?rat1N03yu5HagnqXWAbReyRffKJ9kUTlUTT/+5HgxZA2qRvViK9n8Fql+w?=
 =?iso-8859-2?Q?TS59pYABCDkthS0Ke9k4VKvnqhiK9tWBv/vHW1mDoK+jUSp7XjvF1FBs6C?=
 =?iso-8859-2?Q?K9BFlYprjGXxHCRKAWme2Gqg3LIRjalLXdfuJMCYZAzNUHkAthkdkVgdjs?=
 =?iso-8859-2?Q?uV2z1a5dtXEpaBb45zZF/wi5+OScQsLT2l+SfGhvYWz03P4V9CpEY+Phsu?=
 =?iso-8859-2?Q?UBgjpjI3nNag4tD5guxtRqoYxda+FltQnM2k58lB55wOLyjTvgljRKt4L8?=
 =?iso-8859-2?Q?+LUM/ExOGUvXl3MrBPGANqxz5tmd3DFChTQoIuC2wNk3iLBL2RHvYWhxtZ?=
 =?iso-8859-2?Q?Q7ZL9lWpFdOeRd8X5Rxd2d5rRkC5ADM+VMNxXR3PBqvnyQybTAdUuHRtpk?=
 =?iso-8859-2?Q?gS1smFgMlInydXzaoHKJia/PaaOVoJGoeDBF+vTRReKVJMacDjSuArPAs5?=
 =?iso-8859-2?Q?6NNYseK4DIw520yMdd8B0MTByWsimC4ohHiuaS2nPoScqcE9fjxKNfwZCC?=
 =?iso-8859-2?Q?8ccplFsOrGduDks2ws3oF4t/di9+5EKWNFEVaPLi14F8UF84Eqo3hlLt/5?=
 =?iso-8859-2?Q?vqJcaRvHw4td1qdurJfrgUhdHJqRwDfwvqz0uEwC2wHxTz3OmHJQSElqVh?=
 =?iso-8859-2?Q?yfHhzmltrHA0FUb0nNJrn00EpL28PGmX2cjk8+cnYhL1IPWEmOsVC2XE6s?=
 =?iso-8859-2?Q?0hUTfxXHWjuWKNo5O9AL4QkrU15dEsuvhQIC8KgBA0WpmP7dk8LYq7fFaq?=
 =?iso-8859-2?Q?6J3gLUNo8PuJPJnhatGI1DboYFfDgHnIZQVBAZLttoSOtM0CR3GDaqAcHk?=
 =?iso-8859-2?Q?/y2f9s+SDKf66TykZpmwXlmEsuGeF29fgS+nvq70vVLH0WbRcwWyoWUCK8?=
 =?iso-8859-2?Q?Wk9y/xHEIIkhoup+uNBpad2n28XfdGw/gM1dMyjSx0HSSK4/ye/y9NMg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5933f36c-0282-4142-6d1e-08dd62f1b780
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 12:14:06.1257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JO/M4GN7aMUfXgwDuztZ44AM9OLhojGXWZa9b3f4er1C+gLIEMrgHCxV7S4Y0rV2qFdD0D75q8/QDhNw30wZmPlxkz2oSynYq03qfv5lJ1cqP8SoaB53h7QOyYrzQ7OD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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

LGTM, one nitpick in commit message.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Friday, March 14, 2025 12:55 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH i-g-t] lib/intel_allocator_simple: Prevent deadlock due t=
o log
> mutex contention
>=20
> On the allocator::handle_request() we hold allocator's own mutex while
> we check if the simple allocator is empty with allocator_close().
> That in turn will call igt_debug that tries to take igt_log mutex.
>=20
> If the another thread encountered an error and is trying to print it,
> it is also trying to take igt_log mutex. And there wont be

wont -> won't

> allocator requests received by the client anymore as the handle_request()
> is stuck. So we deadlock.
>=20
> The intel_allocator does put logging behind unset define
> but the intel_allocator_simple uses igt_info and igt_debug
> directly. Follow the main allocator's lead and put the
> logging inside intel_allocator_simple behind a unset define
> with a warning that enabling it risks rare but possible deadlock.
>=20
> Here are the stacks for the deadlock:
>=20
> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
> 2  0x00007f7195898002 in lll_mutex_lock_optimized
> (mutex=3D0x7f7195d5ff80 <log_buffer_mutex>) at
> ./nptl/pthread_mutex_lock.c:48
> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
> 4  0x00007f7195cc0867 in _igt_log_buffer_append (
>    line=3D0x7f718800be70 "(xe_eudebug_online:40711) [thread:40713]
> intel_allocator_simple-DEBUG: <ial: 0x7f7188009e20, fd: 5> objects: 0,
> reserved_areas: 1\n") at ../lib/igt_core.c:461
> 5  igt_vlog (domain=3D0x7f7195cfca78 "intel_allocator_simple",
> level=3DIGT_LOG_DEBUG, format=3D<optimized out>,
> args=3Dargs@entry=3D0x7f71931fe8d0) at ../lib/igt_core.c:3215
> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195cfca78
> "intel_allocator_simple", level=3Dlevel@entry=3DIGT_LOG_DEBUG,
>    format=3Dformat@entry=3D0x7f7195cfc4b0 "<ial: %p, fd: %d> objects: %ld=
,
> reserved_areas: %ld\n") at ../lib/igt_core.c:3137
> 7  0x00007f7195c7d851 in intel_allocator_simple_is_empty (ial=3D<optimize=
d
> out>) at ../lib/intel_allocator_simple.c:613
> 8  0x00007f7195c7aa99 in __allocator_put (al=3D0x556bef180950) at
> ../lib/intel_allocator.c:312
> 9  allocator_close (ahnd=3D263) at ../lib/intel_allocator.c:430
> 10 0x00007f7195c7add1 in handle_request
> (req=3Dreq@entry=3D0x7f71931feaf0, resp=3Dresp@entry=3D0x7f71931fead0) at
> ../lib/intel_allocator.c:561
> 11 0x00007f7195c7b567 in allocator_thread_loop (data=3D<optimized out>) a=
t
> ../lib/intel_allocator.c:766
> 12 0x00007f7195894ac3 in start_thread (arg=3D<optimized out>) at
> ./nptl/pthread_create.c:442
> 13 0x00007f7195926850 in clone3 () at
> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
>=20
> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
> 2  0x00007f7195898002 in lll_mutex_lock_optimized
> (mutex=3D0x7f7195d5ff80 <log_buffer_mutex>) at
> ./nptl/pthread_mutex_lock.c:48
> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
> 4  0x00007f7195cc0867 in _igt_log_buffer_append (line=3D0x556bef182920
> "(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure
> function __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
>    at ../lib/igt_core.c:461
> 5  igt_vlog (domain=3D0x7f7195d27b7f "xe/xe_eudebug",
> level=3DIGT_LOG_CRITICAL, format=3D<optimized out>,
> args=3Dargs@entry=3D0x7fff266ac070) at ../lib/igt_core.c:3215
> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195d27b7f
> "xe/xe_eudebug", level=3Dlevel@entry=3DIGT_LOG_CRITICAL,
>    format=3Dformat@entry=3D0x7f7195d19e60 "Test assertion failure functio=
n %s,
> file %s:%i:\n") at ../lib/igt_core.c:3137
> 7  0x00007f7195cc2bd1 in __igt_fail_assert
> (domain=3Ddomain@entry=3D0x7f7195d27b7f "xe/xe_eudebug",
> file=3Dfile@entry=3D0x7f7195d27b68 "../lib/xe/xe_eudebug.c",
> line=3Dline@entry=3D303,
>    func=3Dfunc@entry=3D0x7f7195d278b8 <__func__.29> "__wait_token",
> assertion=3Dassertion@entry=3D0x7f7195d1b044 "ret > 0",
> f=3Df@entry=3D0x7f7195d27fd8 "Pipe read timeout waiting for token
> '%s:(%ld)'\n")
>    at ../lib/igt_core.c:2254
> 8  0x00007f7195ce9944 in __wait_token
> (pipe=3Dpipe@entry=3D0x556bef15b4b4, token=3Dtoken@entry=3D3,
> timeout_ms=3D60000) at ../lib/xe/xe_eudebug.c:303
> 9  0x00007f7195cebcf1 in wait_from_client (token=3D3, c=3D<optimized out>=
) at
> ../lib/xe/xe_eudebug.c:324
> 10 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at
> ../lib/xe/xe_eudebug.c:1523
> 11 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at
> ../lib/xe/xe_eudebug.c:1519
> 12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger
> (flags=3D16777216, hwe=3D0x556bef159ce8, fd=3D3) at
> ../tests/intel/xe_eudebug_online.c:1591
> 13 __igt_unique____real_main2500 () at
> ../tests/intel/xe_eudebug_online.c:2525
> 14 0x0000556bbde6704d in main (argc=3D<optimized out>, argv=3D<optimized
> out>) at ../tests/intel/xe_eudebug_online.c:2500
>=20
> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
> 2  0x00007f7195898002 in lll_mutex_lock_optimized
> (mutex=3D0x7f7195d5ff80 <log_buffer_mutex>) at
> ./nptl/pthread_mutex_lock.c:48
> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80
> <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
> 4  0x00007f7195cc0867 in _igt_log_buffer_append (line=3D0x556bef182920
> "(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure
> function __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
>    at ../lib/igt_core.c:461
> 5  igt_vlog (domain=3D0x7f7195d27b7f "xe/xe_eudebug",
> level=3DIGT_LOG_CRITICAL, format=3D<optimized out>,
> args=3Dargs@entry=3D0x7fff266ac070) at ../lib/igt_core.c:3215
> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195d27b7f
> "xe/xe_eudebug", level=3Dlevel@entry=3DIGT_LOG_CRITICAL,
>    format=3Dformat@entry=3D0x7f7195d19e60 "Test assertion failure functio=
n %s,
> file %s:%i:\n") at ../lib/igt_core.c:3137
> 7  0x00007f7195cc2bd1 in __igt_fail_assert
> (domain=3Ddomain@entry=3D0x7f7195d27b7f "xe/xe_eudebug",
> file=3Dfile@entry=3D0x7f7195d27b68 "../lib/xe/xe_eudebug.c",
> line=3Dline@entry=3D303,
>    func=3Dfunc@entry=3D0x7f7195d278b8 <__func__.29> "__wait_token",
> assertion=3Dassertion@entry=3D0x7f7195d1b044 "ret > 0",
> f=3Df@entry=3D0x7f7195d27fd8 "Pipe read timeout waiting for token
> '%s:(%ld)'\n")
>    at ../lib/igt_core.c:2254
> 8  0x00007f7195ce9944 in __wait_token
> (pipe=3Dpipe@entry=3D0x556bef15b4b4, token=3Dtoken@entry=3D3,
> timeout_ms=3D60000) at ../lib/xe/xe_eudebug.c:303
> 9  0x00007f7195cebcf1 in wait_from_client (token=3D3, c=3D<optimized out>=
) at
> ../lib/xe/xe_eudebug.c:324
> 10 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at
> ../lib/xe/xe_eudebug.c:1523
> 11 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at
> ../lib/xe/xe_eudebug.c:1519
> 12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger
> (flags=3D16777216, hwe=3D0x556bef159ce8, fd=3D3) at
> ../tests/intel/xe_eudebug_online.c:1591
> 13 __igt_unique____real_main2500 () at
> ../tests/intel/xe_eudebug_online.c:2525
> 14 0x0000556bbde6704d in main (argc=3D<optimized out>, argv=3D<optimized
> out>) at ../tests/intel/xe_eudebug_online.c:2500
>=20
> Cc: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Cc: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  lib/intel_allocator_simple.c | 88 ++++++++++++++++++++----------------
>  1 file changed, 48 insertions(+), 40 deletions(-)
>=20
> diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
> index 25b92db11..a73b16854 100644
> --- a/lib/intel_allocator_simple.c
> +++ b/lib/intel_allocator_simple.c
> @@ -11,6 +11,14 @@
>  #include "intel_bufops.h"
>  #include "igt_map.h"
>=20
> +/* Enabling these you risk deadlock with igt_vlog mutex */
> +#ifdef ALLOCDBG
> +#define alloc_info igt_info
> +#define alloc_debug igt_debug
> +#else
> +#define alloc_info(...) {}
> +#define alloc_debug(...) {}
> +#endif
>=20
>  /* Avoid compilation warning */
>  struct intel_allocator *
> @@ -505,7 +513,7 @@ static bool intel_allocator_simple_reserve(struct
> intel_allocator *ial,
>  		return true;
>  	}
>=20
> -	igt_debug("Failed to reserve %llx + %llx\n", (long long)start, (long
> long)size);
> +	alloc_debug("Failed to reserve %llx + %llx\n", (long long)start, (long
> long)size);
>  	return false;
>  }
>=20
> @@ -534,19 +542,19 @@ static bool intel_allocator_simple_unreserve(struct
> intel_allocator *ial,
>  	entry =3D igt_map_search_entry(ials->reserved, &start);
>=20
>  	if (!entry || !entry->data) {
> -		igt_debug("Only reserved blocks can be unreserved\n");
> +		alloc_debug("Only reserved blocks can be unreserved\n");
>  		return false;
>  	}
>  	rec =3D entry->data;
>=20
>  	if (rec->size !=3D size) {
> -		igt_debug("Only the whole block unreservation allowed\n");
> +		alloc_debug("Only the whole block unreservation
> allowed\n");
>  		return false;
>  	}
>=20
>  	if (rec->handle !=3D handle) {
> -		igt_debug("Handle %u doesn't match reservation handle:
> %u\n",
> -			 rec->handle, handle);
> +		alloc_debug("Handle %u doesn't match reservation handle:
> %u\n",
> +			    rec->handle, handle);
>  		return false;
>  	}
>=20
> @@ -610,10 +618,10 @@ static bool intel_allocator_simple_is_empty(struct
> intel_allocator *ial)
>  {
>  	struct intel_allocator_simple *ials =3D ial->priv;
>=20
> -	igt_debug("<ial: %p, fd: %d> objects: %" PRId64
> -		  ", reserved_areas: %" PRId64 "\n",
> -		  ial, ial->fd,
> -		  ials->allocated_objects, ials->reserved_areas);
> +	alloc_debug("<ial: %p, fd: %d> objects: %" PRId64
> +		    ", reserved_areas: %" PRId64 "\n",
> +		    ial, ial->fd,
> +		    ials->allocated_objects, ials->reserved_areas);
>=20
>  	return !ials->allocated_objects && !ials->reserved_areas;
>  }
> @@ -632,51 +640,51 @@ static void intel_allocator_simple_print(struct
> intel_allocator *ial, bool full)
>  	igt_assert(ials);
>  	heap =3D &ials->heap;
>=20
> -	igt_info("intel_allocator_simple <ial: %p, fd: %d> on "
> -		 "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
> -		 ials->start, ials->end);
> +	alloc_info("intel_allocator_simple <ial: %p, fd: %d> on "
> +		   "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
> +		   ials->start, ials->end);
>=20
>  	if (full) {
> -		igt_info("holes:\n");
> +		alloc_info("holes:\n");
>  		simple_vma_foreach_hole(hole, heap) {
> -			igt_info("offset =3D %"PRIu64" (0x%"PRIx64", "
> -				 "size =3D %"PRIu64" (0x%"PRIx64")\n",
> -				 hole->offset, hole->offset, hole->size,
> -				 hole->size);
> +			alloc_info("offset =3D %"PRIu64" (0x%"PRIx64", "
> +				   "size =3D %"PRIu64" (0x%"PRIx64")\n",
> +				   hole->offset, hole->offset, hole->size,
> +				   hole->size);
>  			total_free +=3D hole->size;
>  		}
>  		igt_assert(total_free <=3D ials->total_size);
> -		igt_info("total_free: %" PRIx64
> -			 ", total_size: %" PRIx64
> -			 ", allocated_size: %" PRIx64
> -			 ", reserved_size: %" PRIx64 "\n",
> -			 total_free, ials->total_size, ials->allocated_size,
> -			 ials->reserved_size);
> +		alloc_info("total_free: %" PRIx64
> +			   ", total_size: %" PRIx64
> +			   ", allocated_size: %" PRIx64
> +			   ", reserved_size: %" PRIx64 "\n",
> +			   total_free, ials->total_size, ials->allocated_size,
> +			   ials->reserved_size);
>  		igt_assert(total_free =3D=3D
>  			   ials->total_size - ials->allocated_size - ials-
> >reserved_size);
>=20
> -		igt_info("objects:\n");
> +		alloc_info("objects:\n");
>  		igt_map_foreach(ials->objects, pos) {
>  			struct intel_allocator_record *rec =3D pos->data;
>=20
> -			igt_info("handle =3D %d, offset =3D %"PRIu64" "
> -				"(0x%"PRIx64", size =3D %"PRIu64"
> (0x%"PRIx64")\n",
> -				 rec->handle, rec->offset, rec->offset,
> -				 rec->size, rec->size);
> +			alloc_info("handle =3D %d, offset =3D %"PRIu64" "
> +				   "(0x%"PRIx64", size =3D %"PRIu64"
> (0x%"PRIx64")\n",
> +				   rec->handle, rec->offset, rec->offset,
> +				   rec->size, rec->size);
>  			allocated_objects++;
>  			allocated_size +=3D rec->size;
>  		}
>  		igt_assert(ials->allocated_size =3D=3D allocated_size);
>  		igt_assert(ials->allocated_objects =3D=3D allocated_objects);
>=20
> -		igt_info("reserved areas:\n");
> +		alloc_info("reserved areas:\n");
>  		igt_map_foreach(ials->reserved, pos) {
>  			struct intel_allocator_record *rec =3D pos->data;
>=20
> -			igt_info("offset =3D %"PRIu64" (0x%"PRIx64", "
> -				 "size =3D %"PRIu64" (0x%"PRIx64")\n",
> -				 rec->offset, rec->offset,
> -				 rec->size, rec->size);
> +			alloc_info("offset =3D %"PRIu64" (0x%"PRIx64", "
> +				   "size =3D %"PRIu64" (0x%"PRIx64")\n",
> +				   rec->offset, rec->offset,
> +				   rec->size, rec->size);
>  			reserved_areas++;
>  			reserved_size +=3D rec->size;
>  		}
> @@ -687,12 +695,12 @@ static void intel_allocator_simple_print(struct
> intel_allocator *ial, bool full)
>  			total_free +=3D hole->size;
>  	}
>=20
> -	igt_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
> -		 "allocated objects: %"PRIu64", reserved areas:
> %"PRIu64"\n",
> -		 total_free, total_free,
> -		 ((double) (ials->total_size - total_free) /
> -		  (double) ials->total_size) * 100,
> -		 ials->allocated_objects, ials->reserved_areas);
> +	alloc_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
> +		   "allocated objects: %"PRIu64", reserved areas:
> %"PRIu64"\n",
> +		   total_free, total_free,
> +		   ((double) (ials->total_size - total_free) /
> +		    (double) ials->total_size) * 100,
> +		   ials->allocated_objects, ials->reserved_areas);
>  }
>=20
>  struct intel_allocator *
> @@ -702,7 +710,7 @@ intel_allocator_simple_create(int fd, uint64_t start,
> uint64_t end,
>  	struct intel_allocator *ial;
>  	struct intel_allocator_simple *ials;
>=20
> -	igt_debug("Using simple allocator\n");
> +	alloc_debug("Using simple allocator\n");
>=20
>  	ial =3D calloc(1, sizeof(*ial));
>  	igt_assert(ial);
> --
> 2.43.0

