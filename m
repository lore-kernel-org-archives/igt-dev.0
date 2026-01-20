Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD2D2ED0E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058BF10E0A8;
	Tue, 20 Jan 2026 03:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnJdZL27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A0D10E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768878281; x=1800414281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0sb1gJwAgxMmnV1q9Dmrpaiwg4wqMTC2Ac675S7zD+4=;
 b=fnJdZL27ZTo+yL2+DU6hKtO6GaLWeAnqKW8cBkD91/BqqmMFsqijDStH
 pds9eBlqTS04sDmeVW6tDm2xkb4PrDcCo677abLF6mtHjTMFUlb/h55OK
 OhDaCKxDxMnO8drp8uES6teyStpPbV3HwRxVhsNcz5Q8X7ZBhR6N5Hd4L
 xRGvsqCXysNP+auAv5xwcAjwvzBDZ4G5wgowE7VHB2eT3iGRx7Zjs6dpd
 ePcs+cpoW3JzC/joBZzJYRe8QexMAZDiVnp4ugPuggO0PM3SJ+B3lnQ+t
 sOaUrCVXhINS89cC9fyZaGQssqQz0G4jYUvRNjBFCne5sYp+NpS3OqD7G w==;
X-CSE-ConnectionGUID: TxeLKg5yRhiUKEFIQCPAJQ==
X-CSE-MsgGUID: rAXbaawETE+xrRR+U4iLGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80802348"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="80802348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:04:41 -0800
X-CSE-ConnectionGUID: pzAZR2NeR6al2vbyi4AFUQ==
X-CSE-MsgGUID: 6vU+IdXQQFeHiSQ6afN+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="210849795"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:04:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:04:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:04:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:04:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYRj6Lyndn05FXt5/04b4eSIDankepvM0+Jo1ODxHvew9atDALyvCvx+cFU4y4BaysM5OoZ3o17JSowYF5hq8UloRR73SljoVCpNMBl5Mh+Keo5FyalZa8Ski74iJjhMUKt67dKBH3ZQrCqHsYZSDY4/28q1qUSbjGYonj9ER7m0aG7Tq+GekK6vP7mX1XhNXEK7vcIqEt8E4sES0qCEvXgZRWLx71yZqz0Bv3BfmKA5WkyuLSgWGsR75CX/kliScXI/FHNfkixdk49L9c05btFURsWmZ5e4C+8X/ZrEZ1Z5nVb2vAa9J6O5ZnqXO5gvEgKQq1LjdNTE/5iy/FemuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhMff2H6NqRZuPuJEE4ay8VrAepR5+VnHL/BR9LMB04=;
 b=jS7zHJJQNvssOngff2izFZMTc9jZmNu0nGIKUbbpvgMl0Y/96KHmbM0N+bIpGrfcXejElLhJGBPnWsp2dgUY74F/9y8zGgLjJwIfC3z6S9kI+XXcEY3vh43YZD9plzF2iKCrTlHpGPEhahj6tH/Lh8q1876IQl+TrIrNDkepjQ4RNj/K6mILkOLt9dP+5umKSDmOzVn3vqyYmRFTFiAg9yM+Ror6Sc59/JfRUXUm3gQCTNknoyJedhk1AxGmZABusegBOnehdVf8sjF6OzFOMHuBqJ/Che80PcBGU8/jdPlatJJP06tu2PZgeYRbQ/YGIIMYSyMyox9PdMN2kwKnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8742.namprd11.prod.outlook.com
 (2603:10b6:408:212::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:04:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:04:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH 2/2] lib/igt_color: Improvement fb compare time
Thread-Topic: [PATCH 2/2] lib/igt_color: Improvement fb compare time
Thread-Index: AQHciZUEmTDnGdzDi06d0HrCD6DZxrVaX3Ag
Date: Tue, 20 Jan 2026 03:04:38 +0000
Message-ID: <DM3PPF208195D8D7D8631102233D5BF06B4E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
 <20260119224237.561000-2-alex.hung@amd.com>
In-Reply-To: <20260119224237.561000-2-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8742:EE_
x-ms-office365-filtering-correlation-id: 2417c3a5-37ee-45be-a51f-08de57d0a5f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?nancHBv9y8jUgFrRFyNkDiozGdCMxO/HdrNR+IvpVc4hTsqlmNIk4GiFW9Tp?=
 =?us-ascii?Q?eb85sbihk3a08OpQVsgN/LQGhrCv4lftEz5af7KzqW1wVTwYIF9cX/Hd1hj2?=
 =?us-ascii?Q?NNX1SmHVC7yAJcaxiF+8NgtAzzZkOs4tlHCKM577njFDLtXOhXpxXyb5aSJ5?=
 =?us-ascii?Q?0zsKMeHhsN9Sm30V9elngETFwSleJbAvSndZ7YPBCw3T4hsaItzyvz2T/2iZ?=
 =?us-ascii?Q?cGY/O0/52V1H4LNHNI4v4AokQM4PEFOvHxxBchotbAHOqC6RzGk86aR8fKzA?=
 =?us-ascii?Q?GAOKrXCGpHpk9HH2DXMKpBfB13blngA7bCWN8BK6iZ5splUBwJwQCxPJI1K+?=
 =?us-ascii?Q?PT0zHfN0LZs+G9LljE+xX1PuQoD05j7RxuPGhRAkCbTpCarKgOyiOsftjeWp?=
 =?us-ascii?Q?VSiIr8YBsAo29QCpMc2me5YP/m0hwJlAGxD2tg+vQMWG35K9JN7qLVAiUW7/?=
 =?us-ascii?Q?RO4L4J9ydM/sB5ReXEW2bmt1PyTgNZOvt9hifh1jhHwow2qrdBRBuSvYW+N4?=
 =?us-ascii?Q?2EcoHeqJV5eAwREkfKVGNR1L3Xl7gDPgWqAmpVUKOueH+KeGqG0AnXLCZnkl?=
 =?us-ascii?Q?eBkyqhY6ISFLwg5+Ef6HND0Em6lEWmGQOavrjmB57ghnD3OgyOnIKzC8hQyT?=
 =?us-ascii?Q?mFk1lADc1w7khfv8eZOtv53bfOLB4RKIkzGc4tuVgcmcH9dumKN/LnB4HMY2?=
 =?us-ascii?Q?aWb9lCEIi1WdTXFGZZlVvXr7MZrrGPH2jcGlwuYW+opUPOPBQ+WQsON2cIms?=
 =?us-ascii?Q?hr/UEyOTsy8y473K+Ieh9gTgnMMGcTAQTlfaoUWxVo90TTIejwkGH28jhkAw?=
 =?us-ascii?Q?ejelx0sXSX4EpD++wMjz9vsRuvmeVVYEz443rq/SOBj5Qtie0cau1+qcK8k6?=
 =?us-ascii?Q?5Gy4DfHJRIK5jp7dVH6YFcDkoNppdoZ4/HuSrkHQALrE9e826mDGysTOUFiR?=
 =?us-ascii?Q?rzNkerUuz1uwNJkLzcKr/NRrzzU+YFAJChHNJub+c1jstTi6LRLEYxHJFdF3?=
 =?us-ascii?Q?s8WTs5SYdHczRLLl9DmOijjn5w7BisG0rYcrJqqNPaNBxZWTiBC37trxIzzf?=
 =?us-ascii?Q?5UKTXfQB4/uc25jGeGgdRXiSoyCprLrk/qLX68P5lQfLvvK1H4GwIynNOk1k?=
 =?us-ascii?Q?2preghXqnTJVqnGvjRtIyRmk98ygM3HWAyoqYAJXaVfVH08VmfdqYlxE2CZ+?=
 =?us-ascii?Q?pu/BOZ3xK7LamdeEbk42W37iHXvShqNkGjvh2zqbqDcZFs2oi4Ftnj0XzAdd?=
 =?us-ascii?Q?2v+a3oJgoEMwKUV7J2GwSzJLGGpVCsK6Y+xreXYNPJR0qHrfZR99i16GI3La?=
 =?us-ascii?Q?bmoeFJvHoT33HwDw0UYWpGzXd2Nk9QfT6fhf9og9F3zGCCyho6Emq70gFPsy?=
 =?us-ascii?Q?FfWq151AjfLf76KSMt366mUeqLVSYTuvlewBYx9YjI3CL1g9FlNVbUUJgct7?=
 =?us-ascii?Q?sFw2MNHZgFTHMv5qgIykbXOUkm51GdbLM6g+Wj7eUE7rQmCxr2qks7wNJv+X?=
 =?us-ascii?Q?USfXU30vyUN9LSJT0BxGRO8yofJjHCxIl20zgj2szd9fmsvT2RYoJrExBPbQ?=
 =?us-ascii?Q?iqBNq85uABTzZT7u4r5OrnhBxJiKQONJ44yXw3c3MV8taz5vmLw3Pk171hwk?=
 =?us-ascii?Q?CzySbRaasd8dvY8/8ZUoRbY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9FMv0cukR7tXyni4JU0X5YweKkfluXrlFS4auwQXWkJE5H6qlLhfFR2X/q4Q?=
 =?us-ascii?Q?wtjhwq4WKsbprClVQXxz5RFLDQPVleydHZ8wHwQxXDVYAe6FX2UT9IiGgiGd?=
 =?us-ascii?Q?BmtSbA+DrnsI2rns+qOorPiR7wSjZRG4MxiOp8rAehiPXmyDxyyIk9TJONYF?=
 =?us-ascii?Q?8AmwVqilPYFEkWsQnPlt3EwQBf0tsnzBXY7E4Pm4YFyvqXy+c1NIJAJiRlYT?=
 =?us-ascii?Q?iZz4CFetnHspm/91KmarGy1tOEO6wkZtb8pP1o5SDMMkYy1q+HibaitZqLDP?=
 =?us-ascii?Q?5kVVNXJGQq1vv2EbOOUj0ADYXazWSMvf/fdshh22XdxjMejz4fpd69Dhqj81?=
 =?us-ascii?Q?vo8o4oaftN8UpMkE4loh86akxq9yWJ/dMEfDad/82jOFLOpQZlFg+H5jjjBq?=
 =?us-ascii?Q?16FFuhGlXz8/QwIgkvZrJufubc/qjxavQdiisIuRBsgalHxroOyc5lvGkjBg?=
 =?us-ascii?Q?kP+Erq30KZc4/HzaLPxgpGTkZkcIbo1tZd6mGNVr5JHeOMH+0MBpuJFHbHGQ?=
 =?us-ascii?Q?MC8GZzEN8Lfbun/dH6XxMFKapupbWanIPAzbEQPhgqMmfgW+GYjiCDxkNWmJ?=
 =?us-ascii?Q?fx6MOAtMrQPl3hBoEeBtRqmqUdm2ibkmesgh2F5yQy30N2hr7v1iZrQVhIr0?=
 =?us-ascii?Q?qXjGKNvT0Gv4kwwbQUzy8X6liuYhTV3ECh/f2pgkaYVY5Izn519Vj9wRWXD0?=
 =?us-ascii?Q?YZE2Jsk4G4SWhIeYwbgfQ+ZL98FPUQVVvPjvdOT0vz0M4/o8IN65ChLg3SNj?=
 =?us-ascii?Q?14e+FFuoDCdaSWKpEchi67zn77DzKmdMobdgKCduOc0xAYvjnpq5CoreZrXG?=
 =?us-ascii?Q?skhof3LQSmvmD2pl9YTVQ7nMoks/zZw2sWFo4e0j0pi6g0r/MjBk3C9PeQ9t?=
 =?us-ascii?Q?TAyzHzfPg80NEmJdGwINq53YpMC9xP7R/itY5rcVYZ5fkbY0K2Iq9B4a3uKA?=
 =?us-ascii?Q?iNr8GLP3hjYVWv3hP7eyDQjlnCCuF4272GwA6kY8W9qlb460CieEUiaNHFBW?=
 =?us-ascii?Q?Qps4k9UoY7k9OHugfDRecB2SG7fcHZ0T15MiBZyljsg65FCtZy7a57g+74IM?=
 =?us-ascii?Q?1CY9U15Ipy+DZhboHXxHf4CoMOCyCVwAne71GS/swP3q5NUYT68yR7J37nED?=
 =?us-ascii?Q?rFsWjMV08qNg5MgZaZwMsu+BIEjmTR3/WWY7HwHGO2joquIxcp1sR5ou5klc?=
 =?us-ascii?Q?0PpmEpVgMHcMIunyZ9frd1+bzItlk4UV1VYWN5DkTGuEUcDXF2dm6p9IYPv7?=
 =?us-ascii?Q?4654lIdmz/11btfVHgirvUhlu78rDbkK9w7U9892rJDdqEriB10T08N6vWh5?=
 =?us-ascii?Q?WeB9s6p3rsGt7xOHfq+zOo7R9tuZrw/67prhZAL3ZaPfzZlKsvD8dxpePuMq?=
 =?us-ascii?Q?xS16gw6xdqLJraGs5iZljwu4UbsrDiurr3qb18EW3Sxi4+3uLkNA1iIviKjz?=
 =?us-ascii?Q?oiQdboKSMX8qLUcTbHeatzEU/ZpSVgFGXkFkcn/IFp3BQVWZYahXS0ZQ3kFH?=
 =?us-ascii?Q?JE4nlYQ3uiSrRxZiNy3uKF5s96VvXWUkcTR3S8i7cu1d2RsUdGBWyPmcrZYx?=
 =?us-ascii?Q?bly2U9pb7dH31IwcZEUwW3wd47N6vINN5eYHFCelD/Dn6whXzwuHAoqr4sqI?=
 =?us-ascii?Q?bk+bcC/kbeYqGvyAhxXTY4P041Bsu4Qt62NZKie6Y98tjS7wmPPRUyQ6uP3x?=
 =?us-ascii?Q?zmW9XjCFAw/x75F6nmzCFMIKD1x3shb+Z2ywoxWp5FJ4mV2Q1GUS4zm2Vmyd?=
 =?us-ascii?Q?YgiOfMXoDQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2417c3a5-37ee-45be-a51f-08de57d0a5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:04:38.1633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKmEz45Xn02JvycboIwHZg4HrodJ1c5Q/4uKxbl/cFMyJiblpnf4+hBKOLrSMQGcv7DQC/Zli88hRLvX+4y0Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

> Subject: [PATCH 2/2] lib/igt_color: Improvement fb compare time
>=20

Subject needs to be "Improve fb compare time"

> Copy the memory to a cached buffer first to avoid slow memory accesses on
> dGPU.
>=20
> This cuts kms_colorop execution time on dGPU from 1 min to 17 seconds.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/igt_color.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/lib/igt_color.c b/lib/igt_color.c index 4d94421ba..8b2564d40=
 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -575,15 +575,30 @@ bool igt_cmp_fb_component(uint16_t comp1,
> uint16_t comp2, uint8_t up, uint8_t do  bool igt_cmp_fb_pixels(igt_fb_t *=
fb1,
> igt_fb_t *fb2, uint8_t up, uint8_t down)  {
>  	uint32_t *ptr1, *ptr2;
> +	uint32_t *map1, *map2;
>  	uint32_t pixel1, pixel2, i, j;
> -	bool matched =3D true;
> +	uint32_t *cached_p1 =3D NULL, *cached_p2 =3D NULL;
> +	bool result =3D true;
>=20
> -	ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> -	ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
> +	map1 =3D ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> +	map2 =3D ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
>=20
>  	igt_assert(fb1->drm_format =3D=3D fb2->drm_format);
>  	igt_assert(fb1->size =3D=3D fb2->size);
>=20
> +	/* Copy WC memory to cached buffer for faster reads.
> +	 * Reading from WC memory is extremely slow so this is important
> +	 * on dGPUs where framebuffer mappings are typically Write-
> Combining.
> +	 */

Nit: Its better if we follow the following convention for multiline comment

/*
 * blurb
 * blurb
 */

Regards,
Suraj Kandpal

> +	cached_p1 =3D malloc(fb1->size);
> +	cached_p2 =3D malloc(fb2->size);
> +	if (cached_p1 && cached_p2) {
> +		memcpy(cached_p1, ptr1, fb1->size);
> +		memcpy(cached_p2, ptr2, fb2->size);
> +		ptr1 =3D cached_p1;
> +		ptr2 =3D cached_p2;
> +	}
> +
>  	for (i =3D 0; i < fb1->size / sizeof(uint32_t); i++) {
>  		uint16_t mask =3D 0xff;
>  		uint16_t shift =3D 8;
> @@ -614,15 +629,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2=
,
> uint8_t up, uint8_t down)
>  			if (!igt_cmp_fb_component(comp1, comp2, up,
> down)) {
>  				igt_info("i %d j %d shift %d mask %x comp1 %x
> comp2 %x, pixel1 %x pixel2 %x\n",
>  					 i, j, shift, mask, comp1, comp2, pixel1,
> pixel2);
> -				return false;
> +				result =3D false;
> +				goto cleanup;
>  			}
>  		}
>  	}
>=20
> -	igt_fb_unmap_buffer(fb1, ptr1);
> -	igt_fb_unmap_buffer(fb2, ptr2);
> +	igt_fb_unmap_buffer(fb1, map1);
> +	igt_fb_unmap_buffer(fb2, map2);
>=20
> -	return matched;
> +cleanup:
> +	free(cached_p1);
> +	free(cached_p2);
> +	return result;
>  }
>=20
>  void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
> --
> 2.43.0

