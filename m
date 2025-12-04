Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B796FD29FB2
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507410E9C2;
	Thu,  4 Dec 2025 19:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUnuYctL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AAA10E9BE
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764878170; x=1796414170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/YdC2MqOGqDoP5z7ae2qMPed+FreikC9OdG5BbzpSTc=;
 b=SUnuYctLAOwOnoFdWulWNhvX0tRAiXSxg8/WAYg9GNwXNcmUdndrgOTy
 4U5DY1lpHU5EhhQ/TGX1QMeNNkM+rYu9ON+ypj6qmGqpvwm6BIzdEoPk5
 3gh6C3wZNKqlWl3XKQYAuMK33iu6FiNd2sA0I2qXvKmvuinUtbV2Z3HKg
 nuxMRbCJxdogs0xMInYJmB2YwcMdSYKu5MTjGtfOWjawekfD/rwjY3X2V
 bw63bMoOvi9GRwqH4wKdNd2fRpPwGJ/AaNXznmQLo4kOsPoDRTFpqwTKz
 lr0SZ4AaRrgavpKsx2PEc717Dvo+RPrQd93pM9Jm7wH/9sYSv6OJk+j3N A==;
X-CSE-ConnectionGUID: Yyb4zGrARwOabFFtFEUtcA==
X-CSE-MsgGUID: JSpa29dESLqOiePWKva1oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66870439"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66870439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:56:09 -0800
X-CSE-ConnectionGUID: /sNpbq6NRAWRicJQOj7l8A==
X-CSE-MsgGUID: T5/wAfPmROqQigALjh4Dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="195496010"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:56:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:56:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:56:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:56:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPxypKzNi+7pm6O0iRQm/Ec37zLlOEURXkGlwpJ5SiqKBSobp3yDWrbN+C0r5YgG3RAYjaBhtQYjQH2evgBv6sx9n6IVsainGxQvqiJyCYRNZ77Dhq/QRpugJDu/IE/4kr7CfYWHuultWyFLhWgY+GkGuzeDE61n0yFkfceALcr52ykiVYrnf6mzhhrcfz7DAPUsJ4RrSsE9Ut/krjelbFHMtksJ5PrA/55bHfFSKmyZH9vztXwEPK52UzAooCHNNsZHV/EQqESRz3D020YREQNRY/Mq9C9f0K+NSY119s1kdZnacDuCnyMOsCp2wrsGSZHKa03lwmUD0cZB3Awhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPGxpsezRt/+6U88FLys3Ndf5RvQIe3tpAF3QXrrZAM=;
 b=uIq0ZcdnBSDNWeL0ER5TI33TqEZzgWh7qjQEuZ7TJysl8otYM6ldxSic8IPlO4w6aiphVPYkuyO+ikhekxldbLX2X4s0hg7L7gzhBwD5tjXGKx/wbIKuoTa+Npn6ZK1ms1oj8ZGVM0ADdfOeXKgNQXyH17VAJTkn0UWieu7tf/pkPuIwL/OHGugBWy10W6QFW+SFJssmCKxFhBqChWh5lByAi+ChQd3lBJVpBALZ9/in7u0WWkPS4MvFcN60saveTPm1FAlXO0nESPZ0gpWjgZ1yQBwYOKnYAK3SxUsQryJf7o0wHos1I69AZJHxP2yiMlZy2PGdQiXbh9MOiPfRHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 19:56:05 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 19:56:05 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 13/19] tests/intel/xe_exec_multi_queue: Add multi
 queues with SMEM
Thread-Topic: [PATCH v2 13/19] tests/intel/xe_exec_multi_queue: Add multi
 queues with SMEM
Thread-Index: AQHcWpsB+shqoSNPZEel1QEtW0HKXrUR+iXA
Date: Thu, 4 Dec 2025 19:56:05 +0000
Message-ID: <SN7PR11MB7489451281EBE605690A107385A6A@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-34-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-34-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|DS0PR11MB7459:EE_
x-ms-office365-filtering-correlation-id: 46d039f6-43da-469a-a71d-08de336f28f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?m9IYzcANKpKZBzIqbBJuj3zFQPWgrc90C8wHQF96IunIBL7j/YStP2wCTuZ+?=
 =?us-ascii?Q?MB3Q5HV/mQnB3WBx/ilwejFlm8/TUtbagIUu+/PB/ggpKyboS3TlUejEi7pu?=
 =?us-ascii?Q?Bg/83VcSjHIkGu1ks8Z/o1Zrc/1VznIUZIYIbOHmUF3BXFi2o0DTejG+lTu/?=
 =?us-ascii?Q?u3BWu01zPfiy+PMnDcXYnvoljPzUrJn5OspOBUnI/C+yte8JeBhTG1oKnULV?=
 =?us-ascii?Q?8WBPgZ5Z89XRCt/rtc9YOuWMb5eJODobQwQ354bmvgLm+RxGokccEoO3jel4?=
 =?us-ascii?Q?haCNRNk6WZP61yGg8b7/GRWqSyicw7s3LVPz36V6xqvAN+rqsh5C44H37dL5?=
 =?us-ascii?Q?ew4Un4lr8CLU5k+N9zMQaF4tP55k/E4TVJHma9PnKYnhIiGJTAj9RJYtsogU?=
 =?us-ascii?Q?/NhGXaLvIHpGSEggWwoFa27vweBl3/5vlrpL5b3rXSbeEr9/ClOiLxoYwtXc?=
 =?us-ascii?Q?0yFDR8omLNFf6p7EEHQmK1LWIyD7LuM+R8rdnBx/iAVKVGpDSwiA04/Zm/xL?=
 =?us-ascii?Q?21dZeTLnYtI6wrFQwxB2+x1OCiP0LRpU5GPXOz2n3SqX8Wp5bpl39IZ/YBLm?=
 =?us-ascii?Q?kZQ9V0LuAZlpflnnFrLe0+wMzkrYTAKm64aGFOapO3hv8VrG4hWiX5d+mHtR?=
 =?us-ascii?Q?0MC90l5M9KGUaBbUkjO7CkXt1+wulOc/I3CvVNCEmImmRwnKpRbqyxCKkvpd?=
 =?us-ascii?Q?/sjPv3DxCTwm/f7i+Op+ivhLvRoILdSPZdb45JzL7p7TwFx4icnyaSlUIuM0?=
 =?us-ascii?Q?nF7lRy7fbtQyOmCUSo7SXCK8UtZ/mo+Lf2byku0r/YgiqoyhuFAEb9Fb7PWi?=
 =?us-ascii?Q?YBcve9iDErzKtY02EVUDbiyKlxQ2BPCY1zhuS6i9p5quTH4HdpT90Us2wj0+?=
 =?us-ascii?Q?rlUfcn3YgLffm+fCq3sXN5vBI5KYfhv2gn4IbQD58V0hCgXNDdqGEPnSUedO?=
 =?us-ascii?Q?/r5NmLRuWZrgdET1o+bUylZz6TWLfbo1r9roBvQ7dEk/4m89rQF0EqgnqXRw?=
 =?us-ascii?Q?m40Gp0rfjp5rSzycLLrxa7mIIHKweU5hn8BkdnQq3tJLzPermJWjxjo/7ezh?=
 =?us-ascii?Q?YKQ0uHhKNhMzA28FZkv4it2w09c1F7tqzIqQJEhGJ/8F81RajbImvCDUPE+c?=
 =?us-ascii?Q?JlyNqiIW0gypKhQETFtr2GFn5oyG6Vf8nw+BvvXNBgsIXc7dl11iuez+TPCN?=
 =?us-ascii?Q?aSaVe+yKgMha7ifYnCaaSViI26SQs+HY46/9R+USwjtwudWd7B9mW+iAkO2N?=
 =?us-ascii?Q?FXh2by+yirJk0wVBNwmYSb9tkVnIdXW6Wgh7bl/kbvoRnCYJp0jkOr1nL8cN?=
 =?us-ascii?Q?ZoeLjcTcAcvzimo01pKj2codtM+d6Xs7HcvK+YsRoIhG8/kqtcfzCW3rtA4N?=
 =?us-ascii?Q?gkssxYBgoM7P9BSr1JdMUKXwCNIdM1KRMalk0VLyhgYyOz5UUDfGwhfCcSwv?=
 =?us-ascii?Q?1pbtqmVqeYohZRbYpEH1EVFmVRZaUzWvbCMxNTXiiwExgzlLbSJkcyBJatnx?=
 =?us-ascii?Q?1u/UYao5MYabSf61ZkHGh7JrYmp7I2E6x7ID?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?790Lt2P4zFnxtBwfPEU0bNKadCBdkOeFvI150vyzH68jRNgkepqBKWXX7x3D?=
 =?us-ascii?Q?2SufEBemfGbediV9NpipvdURKlCmEIR9Ozh5kI3qBgJ6x23XGmJHdFnbc0yX?=
 =?us-ascii?Q?AXZgESHwu48RSk5Ww6U2cQ/K4nseqTla//fdefawITO8UfnFAzzsOoYoKuou?=
 =?us-ascii?Q?lZUBdPMEC52LcySMaAtBfaMeUx8VXlBFu/Gpcg7cStUgFJAZG7EDhRMgimDX?=
 =?us-ascii?Q?me4ZYFTdNHcCzZ7yI/hWyqCbdPgYQs1Mbgd3fnb6f+nrLZUxxNTAtjzTej0Z?=
 =?us-ascii?Q?rm9W44g2Uy5WNYCFLdm7Mj/6T/13zziM+umvxOVmK1RZcvymb54r0nK/CkR+?=
 =?us-ascii?Q?qSDstBy+jf/ipv1vx/nccD2YlpIyWqSvaFJ64giYKGQADDiYIMHjrTrYyzBQ?=
 =?us-ascii?Q?fK0cbVRY7czfFGr18foQ77wXXOsK2uexAE4gO03FVFY0QT5Vv+ccql4w0siX?=
 =?us-ascii?Q?0GgWlhHC/FiX2R3IhWJ8Ecr/Bprs2/gmnoRH/oBcWlZLXBCI1mIAVSLoV2I+?=
 =?us-ascii?Q?tIn/QJnVpeJOzViknCJPlI/kr8PvH7yC2KmVL6tPanrxHCr0haIn/5/kpj7d?=
 =?us-ascii?Q?MddpDyYOAlNdYHW+DJnBpJO4W/hmGuMZcEuwLKUvU46CIZwN4YE7aCLrLeKZ?=
 =?us-ascii?Q?U8RYuljxHNXagrov3T+FQ3SeoQ2cqm1HotrZyZ4jO4g9bYnhxRCp/8JrEX3q?=
 =?us-ascii?Q?CkMYILxjNe64cuWXeURBUUd5kLAl6Q2AWASGOkjOga/R8zAXu+HhwZneKson?=
 =?us-ascii?Q?J8dwv3KowALMxkgmmbYU7zSXOVR4eBkSSmMllJDk4+Pm4ocnfgxmFWOhhu2n?=
 =?us-ascii?Q?IumwSlOJdF5T4FoC6wD0zZKKz6//EYcwBIszER6YcxvLWiq56pEHU+K5VHD/?=
 =?us-ascii?Q?duAEVsPz/b6LGe/sERbcTAq80nQvV2CVZDV4givetN8WiwzMvCkr6cttFcUb?=
 =?us-ascii?Q?WtlflIqQJq1nl/EgW85vhGHYA/uAbkm5kSbuPGbk31s1Nm3NE9ZdmGIVZqxh?=
 =?us-ascii?Q?Kx7xaqEqy7X1dEYxYMahwskGZ99WLYCvthK3XEh/OtQIShywJClfbL7Jnc52?=
 =?us-ascii?Q?dpmeLKd9LdUEM4myoCRxHLHllOUBuMw1Ur55hwKuzG8Mrurg2di/SQDWOAcz?=
 =?us-ascii?Q?Qv5Sml3LD8krn531JV3t/HvIIfYIJ112ZhagOoM+kWWsCmMSz1njFwGqTFv/?=
 =?us-ascii?Q?90OCpEBZgc0a+qZ/c7eB6T0Z8GnycHLQCzIJ5t1jTdezY6eGZBCFKu4tsmj6?=
 =?us-ascii?Q?xXbi7qYFnnwMi9AWcdqqRGW8UoYOy1gsOLjJKDgBPFC3V+rcfAMtLtqdnidr?=
 =?us-ascii?Q?WMnQKfp7hElYL56it6p2bdfA0fixi3dDx15OXM9KOWh8atZwFWzAIF3G9+cn?=
 =?us-ascii?Q?1q9yXlTYr8iq7eDMkOG287Xj+NF2BI3RD29Ks0BS+VAneQ0rS6GRvtbe9GWC?=
 =?us-ascii?Q?W7GfbN6plJ6aB9VbdPfo5j3w7d+yP1vfcnLaZ/TdfK5FBgw3w1/wo8BcEyMr?=
 =?us-ascii?Q?/gbnd0YueyuVpPScm644o07/3TJMyhFr9rZY5b2na3Ad/Bl0NBGYfNL832vC?=
 =?us-ascii?Q?+qKpPji9BNVmfJntrfC+t/20pRJGPdHax+D87KYYuVtBt/4HfFqIootEUDUx?=
 =?us-ascii?Q?lCWLGEqAH+xmyPH5MAW+f560HHVjH7pYQ4DD1/BS5bxT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d039f6-43da-469a-a71d-08de336f28f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:56:05.4363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJepHE8WBxeX5CbyfvCkRmYIXuIybdMKcvpfdN+UaA1LwtZpLWcwtwzyjRdUTKivtyCDXQqpW8WD6jAE4TH0gjC3+IdfKXzEOE0bd7QcABI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
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
> Niranjana Vishwanathapura
> Sent: 21 November 2025 09:27
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 13/19] tests/intel/xe_exec_multi_queue: Add multi queu=
es
> with SMEM
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Extend multi queue tests with SMEM.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
LGTM
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_exec_multi_queue.c | 40 +++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index da8117d57..df65ccafb 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -32,6 +32,7 @@
>  #define DYN_PRIORITY		(0x1 << 4)
>  #define INVALIDATE		(0x1 << 5)
>  #define FAULT_MODE		(0x1 << 6)
> +#define SMEM			(0x1 << 7)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -266,8 +267,11 @@ test_preempt_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_plac
>  		}
>  		memset(data, 0, bo_size);
>  	} else {
> -		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> eci[0].gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		if (flags & SMEM)
> +			bo =3D xe_bo_create(fd, vm, bo_size,
> system_memory(fd), 0);
> +		else
> +			bo =3D xe_bo_create(fd, vm, bo_size,
> vram_if_possible(fd, eci[0].gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data =3D xe_bo_map(fd, bo, bo_size);
>  	}
>=20
> @@ -428,8 +432,11 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  		}
>  		memset(data, 0, bo_size);
>  	} else {
> -		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> eci[0].gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		if (flags & SMEM)
> +			bo =3D xe_bo_create(fd, vm, bo_size,
> system_memory(fd), 0);
> +		else
> +			bo =3D xe_bo_create(fd, vm, bo_size,
> vram_if_possible(fd, eci[0].gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data =3D xe_bo_map(fd, bo, bo_size);
>  	}
>=20
> @@ -578,23 +585,36 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   * arg[1]:
>   *
>   * @basic:					basic
> + * @basic-smem:					basic smem
>   * @userptr:					userptr
>   * @userptr-invalidate:				userptr invalidate
>   * @priority:					priority
>   * @close-fd:					close fd without destroying
> exec queues
>   * @dyn-priority:				dynamic priority
>   * @preempt-mode-basic:				preempt-mode basic
> + * @priority-smem:				priority smem
> + * @close-fd-smem:				close fd without destroying
> exec queues smem
> + * @dyn-priority-smem:				dynamic priority
> smem
> + * @preempt-mode-basic-smem:			preempt-mode basic
> smem
>   * @preempt-mode-userptr:			preempt-mode userptr
>   * @preempt-mode-userptr-invalidate:		preempt-mode userptr
> invalidate
>   * @preempt-mode-priority:			preempt-mode priority
>   * @preempt-mode-close-fd:			preempt-mode close fd
> without destroying exec queues
>   * @preempt-mode-dyn-priority:			preempt-mode
> dynamic priority
>   * @preempt-mode-fault-basic:			preempt-mode-fault-
> mode basic
> + * @preempt-mode-priority-smem:			preempt-mode
> priority smem
> + * @preempt-mode-close-fd-smem:			preempt-mode close
> fd without destroying exec queues smem
> + * @preempt-mode-dyn-priority-smem:		preempt-mode
> dynamic priority smem
> + * @preempt-mode-fault-basic-smem:		preempt-mode-fault-
> mode basic smem
>   * @preempt-mode-fault-userptr:			preempt-mode-fault-
> mode userptr
>   * @preempt-mode-fault-userptr-invalidate:	preempt-mode-fault-mode
> userptr invalidate
>   * @preempt-mode-fault-priority:		preempt-mode-fault-mode
> priority
>   * @preempt-mode-fault-close-fd:		preempt-mode-fault-mode
> close fd
>   * @preempt-mode-fault-dyn-priority:		preempt-mode-fault-mode
> dynamic priority
> + * @preempt-mode-fault-priority-smem:		preempt-mode-fault-
> mode priority smem
> + * @preempt-mode-fault-close-fd-smem:		preempt-mode-fault-
> mode close fd smem
> + * @preempt-mode-fault-dyn-priority-smem:	preempt-mode-fault-mode
> dynamic priority smem
> + *
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -638,24 +658,36 @@ igt_main
>  		unsigned int flags;
>  	} sections[] =3D {
>  		{ "basic", 0 },
> +		{ "basic-smem", SMEM },
>  		{ "userptr", USERPTR },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
>  		{ "priority", PRIORITY },
> +		{ "priority-smem", PRIORITY | SMEM },
>  		{ "close-fd", CLOSE_FD },
> +		{ "close-fd-smem", CLOSE_FD | SMEM },
>  		{ "dyn-priority", DYN_PRIORITY },
> +		{ "dyn-priority-smem", DYN_PRIORITY | SMEM },
>  		{ "preempt-mode-basic", PREEMPT_MODE },
> +		{ "preempt-mode-basic-smem", PREEMPT_MODE | SMEM },
>  		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
>  		{ "preempt-mode-userptr-invalidate", PREEMPT_MODE |
> USERPTR | INVALIDATE },
>  		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
> +		{ "preempt-mode-priority-smem", PREEMPT_MODE |
> PRIORITY | SMEM },
>  		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
> +		{ "preempt-mode-close-fd-smem", PREEMPT_MODE |
> CLOSE_FD | SMEM },
>  		{ "preempt-mode-dyn-priority", PREEMPT_MODE |
> DYN_PRIORITY },
> +		{ "preempt-mode-dyn-priority-smem", PREEMPT_MODE |
> DYN_PRIORITY |
> +SMEM },
>  		{ "preempt-mode-fault-basic", PREEMPT_MODE |
> FAULT_MODE },
> +		{ "preempt-mode-fault-basic-smem", PREEMPT_MODE |
> FAULT_MODE | SMEM
> +},
>  		{ "preempt-mode-fault-userptr", PREEMPT_MODE |
> FAULT_MODE | USERPTR },
>  		{ "preempt-mode-fault-userptr-invalidate", PREEMPT_MODE
> | FAULT_MODE |
>  			USERPTR | INVALIDATE },
>  		{ "preempt-mode-fault-priority", PREEMPT_MODE |
> FAULT_MODE | PRIORITY },
> +		{ "preempt-mode-fault-priority-smem", PREEMPT_MODE |
> FAULT_MODE |
> +PRIORITY | SMEM },
>  		{ "preempt-mode-fault-close-fd", PREEMPT_MODE |
> FAULT_MODE | CLOSE_FD },
> +		{ "preempt-mode-fault-close-fd-smem", PREEMPT_MODE |
> FAULT_MODE |
> +CLOSE_FD | SMEM },
>  		{ "preempt-mode-fault-dyn-priority", PREEMPT_MODE |
> FAULT_MODE | DYN_PRIORITY },
> +		{ "preempt-mode-fault-dyn-priority-smem", PREEMPT_MODE
> | FAULT_MODE |
> +DYN_PRIORITY | SMEM },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
> --
> 2.43.0

