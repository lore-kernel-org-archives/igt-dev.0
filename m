Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6A5C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 12:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10710E262;
	Mon, 24 Jun 2024 12:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7SUzzl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4978C10E40D
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719231177; x=1750767177;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=65gUuiqOMVv1m2EhTjai7wWKlCZL0WI4bgrQzFcAMLE=;
 b=G7SUzzl5EiDZzfP2YqB7fV7vQunkcNLJGyXrGTiHRsuOpFrYNf8tRqyq
 VwMB7Ie7U3p6L16c0zzGeP45BQnqI3u/on9kCoV9t97rQFRW7KU3C7/U1
 PxGQ0Ysdz6w5VrATylWwcLuwBvVp/miUbtRplbmbR/aHormeNBJPnyo39
 nlasqiTS++NRg5sJ464vy9HR1Uw9gUcvvXc2qjtyHTL3MLu0bJ/lc5jnK
 PEvbR4SAxNXnTGKwcbAimV0xyb692zQ1PybJ7kuTxxwtcjikfkOpWcKkc
 RlwFa1BsANyyb4CrA5wLVgjUsEf+1z+hNv0DqsiIHA4s1FXd55XbZtq3+ Q==;
X-CSE-ConnectionGUID: mMW1nEIARPqwqqoOt55IpA==
X-CSE-MsgGUID: 29ZQvDr4TUaYhFOVa+IVOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887724"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="15887724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:12:56 -0700
X-CSE-ConnectionGUID: hoZrByHdRyep2K8l/P1FVQ==
X-CSE-MsgGUID: tBuGZVGZQBezB4SILWqhLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43357660"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 05:12:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 05:12:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 05:12:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 05:12:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 05:12:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pjw5fwUOPOAEzYXMWtEXLkMAmISAvKYOv8vFJ+DWlmHa/iNmTxT+Zzs7wDRCa+POfTaZlvI30X5v4S/QJ+zKJENpoLTDieI1gZXdAr0UAs4fpS3u/cX03glIqEVN2XLJ/FHuBdhWSM7lrnZsY5wCKpleAncppT+zCQPPj9OzWcqH5d4KrgM6NWQSxjBcCJ+QjCl7ESvTLSxmz8kdODNaeeZ09/hPOnDEXlOt8DINYtTlQlc8HeqiaEXxXXSBtK5ceZS5wxmfU8fDDbaiOy1dk1ebZb8k8kGf4DqWyrQ69OaidgE0zySV0gHU6BSsGnOLakgKF2bd2G0HXTqGx+Pctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eB+ueV5TGsW+6JgtRr9JrNUaJE0vZoVAHkMhBEWvVsQ=;
 b=YQFp9gSRpV0HDzfqsjHMTwMkfqeP4XNmZrMLW+xdnK3RAercdVUxMHriOwEIGiVGZghVJ2tiEGvCB0t++ktsjWKdNCQJ0XsPMxiBRXXQaC3rMU0ar/ut6ZrNS+bFh5m8liTdHimgAEL8USQP2mUv0D/Sr5IStNRIMZajcq0BTjBJKIPQFuAySGzFQFwU0qe0uywRpKw4ZEZWsR+LprX9IZ/HwIVtQ1ff+ZLzXXxkHGdSMUzN6CAYvOqsdNteJpthWI/ceCeTdoNYbIrrlyMscMtaOLBM/QNyiAaa0uzwTrk+UjjhNYGkhlKBiCcpMRhxWh49xciBXiCRkr3r6+uyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.28; Mon, 24 Jun 2024 12:12:52 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 12:12:52 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Manasi Navare <navaremanasi@chromium.org>
Subject: RE: [i-g-t 2/4] tests/kms_vrr: Fix hardcoded step size
Thread-Topic: [i-g-t 2/4] tests/kms_vrr: Fix hardcoded step size
Thread-Index: AQHaw7jNHkFT+DI/C0SHyfXgDO13HbHW17Qg
Date: Mon, 24 Jun 2024 12:12:52 +0000
Message-ID: <CY5PR11MB634400F7791E53AB317D30CBB2D42@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
 <20240621084711.68444-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240621084711.68444-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DS0PR11MB6374:EE_
x-ms-office365-filtering-correlation-id: e158f7e0-8f08-44ca-f884-08dc9446f90f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZKKY/tZTdo2Oo2oenIbtc+sPulh4Zsmp5SNBZelMq3e6616fJfeDahdpcZt4?=
 =?us-ascii?Q?P1m5/9aU7wFm1WVy0+kAbN7zVgulg6OVizHp8TEDx/u0HKGy66kxnB87wMfi?=
 =?us-ascii?Q?AaY3YEW9uWkL4V2ICl8NVIPKfwoAXKGXfs25Ja0q8a0O6WPjBIG9HysbYrMt?=
 =?us-ascii?Q?zusZ7gfBLVtjW6bR9qRT47SzNLHAq++54dxlB6GXUuJwrMueghRh1NN/hMqX?=
 =?us-ascii?Q?Gwo1iWPbn7TiN4S1Mx3z5LlgjsbIO2wSKp+mFtPYfJ/Tf/BJFY4olOsESRIN?=
 =?us-ascii?Q?uYD/RUcQsJjE1PPqnt8QqT0iyXwVfEvs8NLTRuX/vhDgHbPgCfCXeeLdSBKk?=
 =?us-ascii?Q?nUVAuu8TA3Bv3HNg3M/k3nc2Rul3i258DDuXDDeknUS4nxhuLhHNaqCTIMD/?=
 =?us-ascii?Q?w+wwJiwvdtVAT42fHv2N6WnV17VOosSM3Z3OO27TIS1k0mXJHOYPm4lUiTzF?=
 =?us-ascii?Q?I24xrjs0wn69rhtkDGbJybSFIRuwsKY2FUQfSo/+11JLFyUWkEstwwtV6McS?=
 =?us-ascii?Q?ejU51haH/eDlv8wVedCZm5LGIJh8mE0LScL6zdiLZ1Lx0IyveYHDRq3KZFYO?=
 =?us-ascii?Q?boofFmBNlXCsaIE6VrUCQv3PGnaQRndsR37BmAgatZiP4l4coYK3miFaUpLz?=
 =?us-ascii?Q?rAxGZ7pKbduaRlizNmMOBoGSFvBtiTS88S9G9hjd1z9QWMDh4VTjTwulObTi?=
 =?us-ascii?Q?aN3MCCACwx6q8YuAyeGoSfh6cWNE0Enj0soYWupV7GIJ3NXvnEA2Ev+WkiVe?=
 =?us-ascii?Q?AWZv6P+E/WuF8NryXxZS/2bfP6OCpjf01FYq6rj4PcFN4PkJF5TKPHDQNaFP?=
 =?us-ascii?Q?wzWyNaihz64vHnGfe64xLETY46R91z59ADncLXe+dCFxRHVJLFWx8sCDALP/?=
 =?us-ascii?Q?ePk7bomnrAnQpXnqGTcdhW2rAHLJRib8CrmRCmQC9dZiKTpgpeh88XutBdUj?=
 =?us-ascii?Q?KEr/JExj+U/Ia5scTJj+bED1UdeSALoqcePAusMu//SJb0w+UVkF0RnIhzst?=
 =?us-ascii?Q?xxSlOigMuwK9qoeHvd8WYjZj3N4rqstn1FdqfsCGfQujnx2FM6pkXBKU1GNA?=
 =?us-ascii?Q?0aZxGyBcSMlewR8rBG6KYslYBWYoewdHzH4PtjPJ006kSxRWPmDBmP2/2WUC?=
 =?us-ascii?Q?FB7LPW+EZq04kpPYqXkJ20uEfufnD00qIjfGLZZVkUKzPHrOAhzmhAkKzl3t?=
 =?us-ascii?Q?8gEvl3VLyDxy4eoB2/EQdHhj/+nQkZOlhumpwoqOnNIPz09L/XOLt8U3DLPx?=
 =?us-ascii?Q?c1lZXlzF76GJlfrGFKBgGe0QSz0zCK+Ilzh0psmxm1kzx4kjJaoFS1vY/gLt?=
 =?us-ascii?Q?tUNea5i8KrBhzngW3D6SMeWUw3FvFhUkvNcQZsUwWk2zvZo+ljmeaPhHLIJR?=
 =?us-ascii?Q?Sb0HWN4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t5lSGS3f2texU6OlihE2r6H/+V1wqScyuYDu4Gor0I6ONZHaHC42ALtPzcYO?=
 =?us-ascii?Q?wOjBu5zFcOOip24a6LCeTcGHgnjq8Ee+gWPPVZIhrCAFTHRFc+x9KJEz5KhJ?=
 =?us-ascii?Q?T3p95HKpAo9NfKsOkKctCSKWi+A8NrIchFolbiG+JKDnGIe36h64PC54DsOl?=
 =?us-ascii?Q?cOYDGEHykWejfYw+p7L1N552z8DDDPA7qYJiMIe6GAAOXEvl+K5PVlh/vzRw?=
 =?us-ascii?Q?GWBKnAfQnRz0lgpUFCnkVFcMKOqwgwoN0u0CwJxkp32FGF5ecfY+KIEqWlgG?=
 =?us-ascii?Q?PZDPQreqAoW8WJ9gaWO82t+OrFqQkSkXIVodpBCSApdF0U1OhFH0P9BUOHy2?=
 =?us-ascii?Q?qWd3NtUJFvDF9okH0rHAsC3R/WEAVPcT74CYtchOW+sosfVfINaFfOu8fXMY?=
 =?us-ascii?Q?mJLQtseXe6Z4mpk4QGKEYsOI7yuMv+ejBx03vLBcADlTrkAbuWz2sLaqge/o?=
 =?us-ascii?Q?7eNL3HaTR8fQBQ5WH2nSAzQbr7JFmL76qe0PXVj/MayFXvLVUYG8cAALfEZR?=
 =?us-ascii?Q?oJzA5EBmg2jgdG/TFFFl1mSvQm2/XzmzkOEP7BlW7Hnp8D6G2kJ1rcte1ZHX?=
 =?us-ascii?Q?4MY2TT740aLdRfvw5+a2sSP7PGvxFB88lCkh5wr+EgVAEH2qfEe7jq7Ysi2o?=
 =?us-ascii?Q?EaisOFg7awZjBREbwEWIJdxJJFT0SvcW0e+jhZiEp1CKx12HhEVeW9g/bvlK?=
 =?us-ascii?Q?f/l/XZfyapzULr4cblYff6Zsg6Jk73SBVHeGk4GwsuG3NQjcJ4wKJLP36fqK?=
 =?us-ascii?Q?d5uOidfhrthvNih4FRriybKjHzFe3UKS6Aje7Kxb4S71PygT4rky1btDmHHS?=
 =?us-ascii?Q?NMW3DlfOEDCnJBWc0pPrFfR24wdUg2DoZ+W9XLmJNbRL32t6sFEyIM0+vPjD?=
 =?us-ascii?Q?7bXzV+1tj+IpxcqLpMeV55rRvapp7ZBtIQ/Tvo18aPfc6qE0WGRvejhXu5o6?=
 =?us-ascii?Q?Cxv89BaV/6Q90Kpv+cIzgLymOZRACG2h+1NafHIeyR2uCojDjuF31dkTev5E?=
 =?us-ascii?Q?eiZqflTMOqgF4B33mq42CNYiqn9dIGjCgTQ1lQfNZTVtzBr9+o5yxCo+GLkb?=
 =?us-ascii?Q?lVbXUy7u2u21DEZHGj2e6BqT+nLclRapTnwiadB4prKcnzhUsuVskV650BuG?=
 =?us-ascii?Q?BrprBebDiZ2qYs1wmufl5AiHcGKrulYD1fmh06tmmQ0285665Z7a2SRAYjC2?=
 =?us-ascii?Q?ft9mwKyUhLBZ8ltEeXnLNkSlSLe9kSJ81wKlAujVlalHqzsrVVg3ojIRfb/k?=
 =?us-ascii?Q?C2g71u8qVGozMHDwQwHXH7u25Camc9fE6F7ZNy/KDgztzySW2S4rsI5tZFGf?=
 =?us-ascii?Q?ieo5nDltzGbyTkkRJjWnThBeKU98Zer7aIjP6DuaEgn3Ok3uXqEAUIKCEOKe?=
 =?us-ascii?Q?jiwhkbSRo8yHqjqGkUHdnklSpO/5MY40AVT1FxCvD33kD7NyOoxOVROASd5R?=
 =?us-ascii?Q?3aixXGlrzZjUWyxlnKM68Zua4HLyn/rQnefSCjfeCFfgilN/LUdBjI1zBozN?=
 =?us-ascii?Q?4xF44/NxdqYuQ+toZxN5BWXeyABlsNFcUoZWV0TX5AJ91Za3xqyePBSvjP1o?=
 =?us-ascii?Q?aqBvEsazHns6KUCnaRaZei22eHB5JV59LvD+f6XER1W9QD3wteMN8hn8Osnu?=
 =?us-ascii?Q?DH4GdJyUGGcBx9udS31AFiA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e158f7e0-8f08-44ca-f884-08dc9446f90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 12:12:52.6731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Q8i4CqyvLfm8bXHqob3DqrbonUU4BEsWM2OBkYzQaYp/Rxm/hJtm3jE6dy7ov7MwmkFpNlyh6wAaIyi7JUhmg8KjEz5Mn9MeRzoxM2fjmLwX5GvnHjbdNNHg44siiGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Friday, June 21, 2024 2:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Manasi
> Navare <navaremanasi@chromium.org>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [i-g-t 2/4] tests/kms_vrr: Fix hardcoded step size
>=20
> In seamless-virtual subtest we are trying different Vrefresh values betwe=
en
> Vmin & Vmax by incrementing the Vrefresh by by 10 Hz (hardcoded).
>=20
> With this approach:
> - We'll achieve less no. of refresh rates if VRR range is low
>     Ex: We can achieve only 1 step between 40 to 60 Hz.
> - Execution time will increase in case of high VRR range.
>     Ex: We need 30 steps to reach 60 Hz to 360 Hz.
>=20
> Instead of hardcoding the step size (10 Hz), allow test to execute fixed =
number
> of steps (say 5 steps to reach Vmin to
> Vmax) will guarantee to test (5) different refresh rates between Vmin & V=
max
> irrespective of the VRR range.
>=20
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 6fd04505e..2ea90cd8e
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -740,6 +740,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	uint32_t result;
>  	unsigned int vrefresh;
>  	uint64_t rate[] =3D {0};
> +	uint32_t step_size;
>=20
>  	igt_info("Use HIGH_RR Mode as default\n");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -759,8 +760,14 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
> reached, result was %u%%\n",
>  		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0],
> result);
>=20
> +	/*
> +	 * Calculate step size by considering the no. of steps required to
> +	 * reach Vmin to Vmax as 5.
> +	 */
> +	step_size =3D (data->range.max - data->range.min) / 5;
> +
>  	/* Switch to Virtual RR */
> -	for (vrefresh =3D data->range.min + 10; vrefresh < data->range.max;
> vrefresh +=3D 10) {
> +	for (vrefresh =3D data->range.min + step_size; vrefresh <
> +data->range.max; vrefresh +=3D step_size) {
>  		drmModeModeInfo virtual_mode =3D
> virtual_rr_vrr_range_mode(output, vrefresh);
>=20

Changes LGTM.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz):
> \n", vrefresh);
> --
> 2.43.2

