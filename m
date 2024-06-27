Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC51FC2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 08:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E64E10E17C;
	Thu, 27 Jun 2024 08:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOVQ50PH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9D210E16E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719476980; x=1751012980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sJHLiwt0FLTdhS0Hy3GOU/qavGuolcNsIZ3q7HNMaTY=;
 b=EOVQ50PHAj4Ah9VgLXZQq5VkuqVMHRYftu2Uyk7L9DXcmo16lf4k9pdT
 8JVyQbXrktsOQUp8Z0Ca/UxK5KuBjAM1xJqzGUR0BNiy0njQZ5avwUuqp
 GIN0YSSZW3XtWKaKK9MZRpmSIgiGhJyQnO+IYA796Iq0C7UxU2SUK4Yfy
 EE8AxyPT6g0G4LGKDSqYtzzonCGeLhdB1HGvQki4C68v1m8FrxUeFHmBB
 Wv+zlyMixHwdRPRi1N1l1vBEdxiSy/wdtqwv7UUx4fDr0xradBnIrgpc2
 j6SRwcXz4wmtuv18d0MsR1E08gnNh6AOZx2uGEgTPtwSSUGtJOTzUPfsk w==;
X-CSE-ConnectionGUID: NETc7hCmS2m03VyY35sdSw==
X-CSE-MsgGUID: +t8BcBdlQFymgi20dGX1Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34123943"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="34123943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:29:39 -0700
X-CSE-ConnectionGUID: r5XVaOmzTl2vXG9oEir68g==
X-CSE-MsgGUID: 6YItOBm7Qs2K5BAwK3JGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="75492042"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 01:29:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 01:29:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 01:29:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 01:29:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 01:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzHpj6oOEvi4qkBoqpWYxM23Trpsjjw27O4sTPjaqsCjX/GSzzPiNNWKeHpZkN3MrvEy7kfncEWFajYcoRKbBvOgHGyJDwauV5T05K4RuobPzog4b5YJ1oj7KkxN0BGBBPU9/hBUeYjB4ugBiNSmFtGQkzCmm08SpBX4H7bNfeO/sb4ca3M/7RDviwKQ+nB6yPlqzmzmu+MXVAtAf+n1oVRbeJ4zsSNyjr6mcl4eCgQU5Fo1e3mYVduhS4Cc0smvpEXTVEyjTalTpXkAMFX8uEuHNCmHx53MPJNXoRL0t1VIFm9Ah2JQX304Co2djC7hO59xLvhL9elexxmR8iDAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsmYCoBe8vkLDP1fxS5Q+KB3YZ6aeenPX895mvIRXTY=;
 b=gddjWqDOMxyje84JVmBC8F0znIH/8qQV9ViCmImWw1t7ENO61s50RXOZTLm7MUrKUFG3WoKlkCQRPrN0jqx2bkN30xedqNdX+SNQ6wcYC7eM6E0ENoEvIp/YtGoQIsP36kUtR1ikvt2PDSJz9s13/zsa/wcQnT32xs46dVlvRCnnUCvUCB0JQaZfE6MXHUorvS8iDGMrkIMI+L/M0wYelU+JNgkT7pa9iaSPWcGekRzRqvmppy13SUYk7QixN2dx/7IimebEfHIc0i/9+T7dc8b2LTTQ2SED4vxpH0+yHgg2EOYe1finGRFkrhFWeAi18vPxds7d01wMgT+oniPB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 08:29:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 08:29:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in
 bigjoiner checks
Thread-Topic: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in
 bigjoiner checks
Thread-Index: AQHawVnj2FOWUOfmvUW3A7O86EDyCLHbPfqAgAAXhxA=
Date: Thu, 27 Jun 2024 08:29:30 +0000
Message-ID: <DM4PR11MB6312CDDB03F882AED33FF43290D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-8-bhanuprakash.modem@intel.com>
 <DM4PR11MB6312CFB9FF56795F65D3DEE490D72@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312CFB9FF56795F65D3DEE490D72@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: ce21a3a1-c351-40cd-2245-08dc968343ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8QoBKl7miT6DwCZGI5mRD7HKT+lxcjlfR64fyGv1rQR9dhX+nAgZ7S0GCfUc?=
 =?us-ascii?Q?amKfyG2WYXUt3lTZgLvHSKgswO6xZmqSGAOBe8w8A6HaXgcn0k/lpxlRKFWC?=
 =?us-ascii?Q?fQGb40fGbqybSEV3e/ynxcn4F+2bqZfl/TCw0tkP1Qb6zS9sJXLSNHFTL6Ka?=
 =?us-ascii?Q?eg/kViI7g007WIbDGkKu9Lcbjq2OK9h1xwY9J1VZGKCMqa1CbGzAFGRxqpN9?=
 =?us-ascii?Q?H7i4pLx65Z7P7E9MAizBBnA/hrP1SEL9D2eTfHRNbB0TZ697QJkgnl9rV3Q5?=
 =?us-ascii?Q?8if33Py1ZkExV+IUD15mDE/INbujKR+Ba1gf6o42s1NRcRvgWFMRlPlajQm5?=
 =?us-ascii?Q?C1Z6MTH/4l7MAtYhcnzN0wvGSsCVnz8m45csxCuHMvMiwki9cQ48awMAZSox?=
 =?us-ascii?Q?PndQqgI46h9imuIbVBrZyVGXkqKwm+5m0AUA5/17/Shhv7R1hCiJ8//1Dffu?=
 =?us-ascii?Q?k/cPpRUeLsXQ7lIBDLVWFJ7IbFqkyCoMu1vCGsbA997iMqwnnHGEgpHjNiJr?=
 =?us-ascii?Q?s6vWle4iEaFlm9lVV+905HY6KYTYDgiskW9tBrv4IVYnGuyvTHqGCD/7itix?=
 =?us-ascii?Q?J8L2/6qMi2D6xzzlql0hODoL1cItoeNUO07dmdYjyP2JtAqfM7JwE6xkL6mC?=
 =?us-ascii?Q?6AxNMcGV+ED6bQONYs7ZLDCDqr2XoyLSh3XjD470xkNEA0qGRR34a6kuo2yr?=
 =?us-ascii?Q?iwiaiq72kQjc3Fa5o9UnQKK6OLUb4lwQyrKMM/RUOYvfKiSDDQpyd5X3bfkB?=
 =?us-ascii?Q?uqkADPoK4ZThVw9oD3aHOmS7ximdM/s6zF/tLxLRLZ4JKGRDUtlOecEFNjjY?=
 =?us-ascii?Q?r/kDlNboRdmMp+T9Hy8AQdezhwa8aDxIVC9qibSQOAWHdY/oBjgxQ7YTeQ/D?=
 =?us-ascii?Q?sUbTHP1RSHeOSOm5k6MPB2OBlicBEWB+/49CR2/mDeYL4PWt6o2Z58Ewxew3?=
 =?us-ascii?Q?5PF0klUCOzyoSOdeOEPE7kaCD20hmjCBTiTvXgOZCuytmsq0y2fmMi5m2IvP?=
 =?us-ascii?Q?Spx4OTIKY+jO8do0kgH6gRoqL5KDUZMvfLsJlZ4qze0K8r38WzIBrNoiKkHX?=
 =?us-ascii?Q?MS1L6hCf1r4mUHl6IHEDmmG492IlPJpeAsLX3nlHaHrskoWJ9EkZgQQPNYu4?=
 =?us-ascii?Q?7BlRqz+tpidJh+oC67sHSKt+Bkq9akVcm5+acHRogFokwBbU8uyxWHf4bT/V?=
 =?us-ascii?Q?xsS1fUCJwTIcbb5gJDZQol5F26HIKmkbmn5dJAzbnuMKzNJyccoBPnUu4vsb?=
 =?us-ascii?Q?ZwJgiKlBBxWvYnqkOo0rPdsDADwmmNXljSl2ddxgbFm0Wnc+z6rS+ouGC9yG?=
 =?us-ascii?Q?Po7/6uKXceV3gWJimq0Nz2KJC3e6rOXwF5Tx18Lo8O0NW8u0ep/Ew36SLsr3?=
 =?us-ascii?Q?z1S+T4B6KM3yaUt1rmk5582fH1bzPU8OAj4PdY2qXw2ELtcHCw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/h1iQIFqLyVjPxVTIVdUjnLSMZtkVAeKcNK0ZwawofPprCPNNWhyo2Tf38JO?=
 =?us-ascii?Q?XxzkBdmz0BwZc3nJ/rVFJWYNBUZIcM4jH4iRLcpc4ZnRR3PD9H9VaHuDh2La?=
 =?us-ascii?Q?7GDTLQ6skBiME+ZvhnDPkTdlG6RKUXPKSyVll2NEKPKvC3t80xi7w76IAtlK?=
 =?us-ascii?Q?SD7ee8661IKBent7oJJOLDthMNAkAP/iko4Sivohy9TJwUhKPD8bIr9/A3ku?=
 =?us-ascii?Q?DBc3GYkqe/IXGC2fmFeC2CPZmC+SAjpX0w3slEIVfkC4e4Z72mSaST+Voc9C?=
 =?us-ascii?Q?n/TxgwGjqhVmnQDIxWJs0wHrhMFXF7uJeDE8JCNsSWimtewXp65s/MfEk2Nr?=
 =?us-ascii?Q?QqtJXY4hMdG0uBuqxeepXPwUxD6YdB98snxO5pucWNnVEvbZttmhsDEhzdrP?=
 =?us-ascii?Q?WuCL1nZ19fe8S2N611DMDwYfWgUAoNHxZmPizjqjYUhMKIZSL4rcBe9W5ILQ?=
 =?us-ascii?Q?Wtv5MwJ9AbYoKvfmTCtU/h8SkMrlk06anw+Z3PjpsnBj3oT3eudmoRXD5JrT?=
 =?us-ascii?Q?vfiXJuQ3s2oMAukDYGQxzThrFI/8y+gkosnthwOyZbILhJ8p1CAi/VD5+Zu7?=
 =?us-ascii?Q?gIOKU3eRRJx9bMN7vsDwNblojINCkoZfw8XRRgbZYnYC1iv67Uc4Y3gJh58t?=
 =?us-ascii?Q?4l4ewqN9fzaK8UE4bOENERXIcQGTEJfhOf/ktBPplijwszp01IHZm1NvEV+k?=
 =?us-ascii?Q?4ZxyDjdMwOVxAiF5rxqAyUqznZeaXkiWgGMT8rkVsO8lyDCduMFo9Nrvn8JN?=
 =?us-ascii?Q?EVok01OZi/zHhGXGAaRsU6pFw1buIrfISNnwfkhNwzyjLX8ziTHjR/xItF3G?=
 =?us-ascii?Q?zmvzd3hZCZKuvGFKtZHxI4m1spS+4hezJiiRl0ywu+JO7pDw4l9KnbmEOCPP?=
 =?us-ascii?Q?S8wV5V3/po5Ty6Na+MwEwe9bcRNU5GpxJqpT1yOmgBVZcActTEvLfPSYhzAi?=
 =?us-ascii?Q?CeZBvSxqtaYxAtbSheIS+G5xJ2cIij/3QkLmDvVYbi8ZIr6bpY36CGq59kPS?=
 =?us-ascii?Q?wJpaIQzlt+Z9+K5s1l5q/hgTmnwJJ/sx511rxh6Qff2FEUlMZ/+2qb2yjtoI?=
 =?us-ascii?Q?xchscK4wuVIjJR/pq2tbZMAAltq8x8ZkOZKCqrkLPElXRfoTtjm0ZiYr1Cp8?=
 =?us-ascii?Q?U8C7r+IlkslIJdLlsQatGyS1Cb5K06iC/i/AKmA7eVXZi2yp+HRuDnWc/XDq?=
 =?us-ascii?Q?gtLPZkBA7I5/lPTquAA3D2f0bmlXbhGhlrBgZqlNkfx3Yez090T3Fydk52mo?=
 =?us-ascii?Q?fzhiro6TMLDU2siD08s/hBvjg2U/5AlAmZunypHmpGQeu/P167wVYwvfuTk6?=
 =?us-ascii?Q?eV6N+xhizixZW4DE2r3retiwBC+rPlj8Yna19xp85i6hy5xWULxm/4cFveRI?=
 =?us-ascii?Q?EhNKy9URk8Y8sB/stAB03uQ+tJujSbdEex2Fz+aPMJpEAvi/lTlRU1vHFjD/?=
 =?us-ascii?Q?m/yZu1WczkWbH3cA8KO72stZP8KTzOTxhOaYtqNVRRQ9AIjf7z8HaO8CqzgK?=
 =?us-ascii?Q?hEaUo0s7+nhJftKZMqyQ8Q2HDg6XU0tAWAoEMHAm0tEahmmSHzWva3Yfx47D?=
 =?us-ascii?Q?vrE3kr6F8mz/TpZd760=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce21a3a1-c351-40cd-2245-08dc968343ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 08:29:30.4279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VeJNaNBoI6HHtPKbYo5+GdBpyoAttmpgjph6a44CYiu7Dbf/7GJHCuCdCsSfLvmd4OZM3R3Ue4b0EupJ4dkCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of B, Jee=
van
> Sent: Thursday, June 27, 2024 12:35 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: RE: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in bi=
gjoiner
> checks
>=20
>=20
>=20
> > -----Original Message-----
> > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Sent: Tuesday, June 18, 2024 1:53 PM
> > To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>
> > Subject: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in
> > bigjoiner checks
> >
> > As we recently introduced the option (through debugfs) to force the
> > bigjoiner, needs to extend the support in bigjoiner checks to handle th=
e force
> joiner.
> >
> > V2: - Fix connector name
> >
> > Cc: Kunal Joshi <kunal1.joshi@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_setmode.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> > 490bfd3dd..95c5bfadc 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -709,24 +709,38 @@ static void test_one_combination(const struct
> > test_config *tconf,
> >
> >  		for (i =3D 0; i < crtc_count; i++) {
> >  			struct crtc_config *crtc =3D &crtcs[i];
> > +			char conn_name[24], prev_conn_name[24];
> > +
> > +			snprintf(conn_name, sizeof(conn_name),
> > +				 "%s-%d",
> > +				 kmstest_connector_type_str(crtcs[i].cconfs-
> > >connector->connector_type),
> > +				 crtcs[i].cconfs->connector-
> > >connector_type_id);
> > +
> > +			if (i > 0)
> > +				snprintf(prev_conn_name,
> > sizeof(prev_conn_name),
> > +					 "%s-%d",
> > +					 kmstest_connector_type_str(crtcs[i -
> > 1].cconfs->connector->connector_type),
> > +					 crtcs[i - 1].cconfs->connector-
> > >connector_type_id);
> Same here...
> >
> >  			/*
> >  			 * Handle BW limitations on intel hardware:
> >  			 *
> > -			 * if mode resolution > 5K (or) mode clock >
> > max_dotclock,
> > +			 * if force joiner (or) mode resolution > 5K (or) mode
> > clock >
> > +max_dotclock,
> >  			 * then ignore
> >  			 *   - last crtc in single/multi-connector config
> >  			 *   - consecutive crtcs in multi-connector config
> >  			 *
> >  			 * in multi-connector config ignore if
> > -			 *   - previous crtc (mode resolution > 5K (or)
> > +			 *   - previous crtc (force joiner (or) mode resolution >
> > 5K (or)
> >  			 *     mode clock > max_dotclock) and
> >  			 *   - current & previous crtcs are consecutive
> >  			 */
> > -			if ((igt_bigjoiner_possible(&crtc->mode, max_dotclock)
> > &&
> > +			if (((igt_check_force_joiner_status(drm_fd, conn_name)
> > ||
> > +			      igt_bigjoiner_possible(&crtc->mode, max_dotclock))
> > &&
> >  			     ((crtc->crtc_idx >=3D (tconf->resources->count_crtcs -
> > 1)) ||
> >  			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx -
> > crtc->crtc_idx) <=3D 1)))) ||
> > -			    ((i > 0) && igt_bigjoiner_possible(&crtc[i - 1].mode,
> > max_dotclock) &&
> > +			    ((i > 0) && (igt_check_force_joiner_status(drm_fd,
> > prev_conn_name) ||
> > +					 igt_bigjoiner_possible(&crtc[i -
> > 1].mode, max_dotclock)) &&
> >  			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=3D 1))) {
> >  				igt_info("Combo: %s is not possible with
> selected mode(s).\n",
> > test_name);
> >  				goto out;
> > --
> > 2.43.2

