Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62045E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C6F10E24C;
	Wed, 18 Dec 2024 21:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBcY2cw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93E10E256
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734556733; x=1766092733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RD7ugADSOfnBHNA5ESTBeZ0hFKyQky4vAL7hrYpDugY=;
 b=QBcY2cw1uhjUJdhBKWVKqEuTh8c8R8sg5our2OSFldOcD0zNRe+8o8UG
 IY/edbecyR0l598435HqWTHY/hdCUyhKdmOMOhfJpq7PFrKBRg30/QVns
 DCVM1NsKgWTiBlZbGN4WulGE5KAV7rJHwOMSGw4fRhBNTbDpmuEag4Ccm
 /El31hdZD5ml2c7pzZ180uo6XrabtoDqyMNiih/7uqb2UavLaWDx4AgtV
 YLWVmDGoJ5m2cF+HK/VG+3D8WEM6KvBjquwUgeuY2vvDTurOlVba3v/fZ
 68XcWsMXwkMG4L5mqvGIskGKpfbPAtbsiMUG/Yf4LCTP0ZTFioPnVcVlR g==;
X-CSE-ConnectionGUID: SS23kZVBR3KtAiNlyiLm8w==
X-CSE-MsgGUID: 2pl6u14ITGm7xJ5Q8gyEqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57529506"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="57529506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:18:52 -0800
X-CSE-ConnectionGUID: 0/15nr/KT7u9gZ5KEYQGeA==
X-CSE-MsgGUID: GHcnCsmSTzOFhliW13gGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98462496"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 13:18:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 13:18:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 13:18:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 13:18:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKNaT4/Bx8GMqKUQohrNxRnrHgF/wXfWvdWqrWFk0yWVfBLgRCCYdgp1BuR2AYQbNEY2MQb4p0iB8EwDNNY7CDS8DWNcMGZVVj+X0zqG+YZiucatKRGrCQFTsm7aif4xCad0WznbMGyw2wD8HtILyJFtfWvE+igOezIRIeSJLyEF1qgXB1m0eboss8Q2/R2YBFctOSA34lwvFFoZ1yP+xRuNNFUzVEUtEjBz4FZ8+1eBKZihBiI5n3/2nzwVYL/6U2QTpEXjLkB1lpH237J1XTDnrEJC1VgPlU4ufswIGNyYuH9dFbq+d8jQrnAI+QCqT7LBmdQZGTYhJwcWyRs/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUzv7cw8+DBAJ/i6nMxhQaEcck4xaoKWpLzTqIjUYAs=;
 b=PKwrdZmwIiBytpRYsbLt2KINHdN2GIVtjtngobmDp2JMP4C+Qjc3c6bvBLdchDXHFh2ToHDWq5rSJTb06bKRoPvDeuUeOA8e6nWuxs4ObJ7KyJgCw7qqLiCMKw3x6o7T8SgspBin6ZXZLtFTwAs8MvkRvgCwVU5MxVxf7IvUkSqCypXtZ59z0pBDEVKSZib4p6qLGDjx1yCwyEbLPu4In5VT0tzc8eR+5IrC0Y8Z0FJig3rW1/UBrAfXkctUAQ0rjpy3s5rHIXjPWdz9J6N3tu6K29NjHR0pre8NWXGgi5Ky0q8GVf28wMvX/wJ3xvRfofC9ZocRw5YPtl23j2QrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 21:18:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 21:18:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_oa: Remove unused function
 arguments
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_oa: Remove unused function
 arguments
Thread-Index: AQHbUSoRGy92bTgHv0OhrmKDpIh8n7LsgdRQ
Date: Wed, 18 Dec 2024 21:18:39 +0000
Message-ID: <CH0PR11MB544408688D23A884690E1A64E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
 <20241218084134.2898703-2-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241218084134.2898703-2-sai.teja.pottumuttu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8739:EE_
x-ms-office365-filtering-correlation-id: 4c331152-b6ff-4a4e-245b-08dd1fa98af1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VxVrPL6E1y5tVhvVmWtUunjh25CQYN4Fk2sA0sPWtm+NlbwnSwMnsQAfacT5?=
 =?us-ascii?Q?Geo6dRYLGzKjEweLov9OZB/wVDbD3F4IokaKV+Og6Fd+pf/hF5tr52zmEzjw?=
 =?us-ascii?Q?fbtkVg9rAWFKZ0IzvX5b1nxgPuS3kkGXaUaq4KaQBkwoWXmucvHFnUIiJzRc?=
 =?us-ascii?Q?EgmuvxhX7MxAK4S/0MjGZSsBD6YnzIc7lKu3vignT6O5Iw6rL1s6xwDo0nGS?=
 =?us-ascii?Q?J7ry3nTmrO3TN0FfPmLoB6aXimFE8RZ7KcX7U0VOtV6PbxkVC1jR1MiXlmVb?=
 =?us-ascii?Q?WDLH03gW11qzIZkkSh2iEJrdp1uwYzmwjYh3cuWrE2sZ/75T8qmipzpTpjvh?=
 =?us-ascii?Q?Q2+zeqmfoK2C6uV7d2fiFwkYIo3iYRitB6VWN67b3fZ0KRjQ9YqeFiu2zomV?=
 =?us-ascii?Q?AjBEabP7OM/46RHhaG/4Nsv6MVFKf7FxV+czDa/A9zT6DKaX/i7myADwNk+v?=
 =?us-ascii?Q?tPdY0BXMY82ZG86YgbcDGYm+VsnyquBU54Bmf8XhHKBCB2/WPF+fNOSWrNA8?=
 =?us-ascii?Q?Mil82T9Fu02J5GLc099tp46LtvuPLEaBsSChnc8DTmdRU1OoHckeRIi/TJed?=
 =?us-ascii?Q?3bz1RlC1epEExDb5I2sfLDDUtWD+bMpLQ3rVppufMItSfVaKUYokWCeUwim1?=
 =?us-ascii?Q?7n0W9ESfU/t7Q2sldeBvHX1zTARJT3QCbQh1bN6CQSb5+Bln+gKqRpQ56ei0?=
 =?us-ascii?Q?arba3Rys455/vcRF++SlFDQnKBdhhksjdNCKq86BsdXk6FT7L0HTOl4RwvM/?=
 =?us-ascii?Q?e/xVy2gHJoAbBroXZhKoaQEU+jwLb/oYF/kK62zW1flc/y17BSUN8EXcd4Jm?=
 =?us-ascii?Q?yFF42uQIbdEEk3tOBwf7z8MoXTlv8NH7by2o3fyzQSopONlQauePQdDFKQjZ?=
 =?us-ascii?Q?bGIydOJfKFg6RQggyAUXZvfiSrXT2iqVP3n1aSKRk3oAvUW9OKUKVsn/+932?=
 =?us-ascii?Q?j/g3euoNh6MK0XBvIEY/YX4w1QZ0hYztLYxlwj7QIIPBGvjBXP49YmAEXke8?=
 =?us-ascii?Q?Bbcp2BX6jtWQif9W5KipXCgqqaraj3h2vUuAUn5nmjPZWnhVhGa+UkeA0igw?=
 =?us-ascii?Q?baZEiRJNHUtx0oPGk97J2x/uCSPgbWs7F0YPCUJgbWqp3L1YsvAdKXjv/bWf?=
 =?us-ascii?Q?/VTO66pkLbmeugcjwxiXYdbiC7F8S2/J/yRjX3qyf3bRPv+8lKLXkpl/ZYni?=
 =?us-ascii?Q?BMY5VJjpw56UJi/7htaLiFrSrqtfrg386EoOi1OFLCul0IIhE4/qV/q2GJ+0?=
 =?us-ascii?Q?snuptaFL7QgC/ER7nA3WD+abU7AGAI6lF1lhwcJ54BJhCrzCTEaKkAyz+TxD?=
 =?us-ascii?Q?GUZoo77/lnAVDdCNnvrLsFQ9+WMzLu2NOKirsiFdii9Af4UhEMczvo7McJFY?=
 =?us-ascii?Q?lV4cJD0VhVRuOb5gdsf22ozzDhkYIUUTbVvTxgLqkzxxMEIuh64tlioT3NCB?=
 =?us-ascii?Q?jLSkOyrksPrm9NGnDkgxPNvhHs9IU/2T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4o7lMkORxMmJkptjYj0krulzP2fQnezixzp2sqDHVrTYmqjINnCXiJI+1Dxw?=
 =?us-ascii?Q?57pd3M0Urq4MC2XSmLm3juqAQL6lcEqg4PFMfChUouBqcMsD3fkQs5ecdDfO?=
 =?us-ascii?Q?Ozb0dArfsVahrJo+bfCOQ0y6U0Xp3eiu4nonZDOUWJFBYPkUDSzX7TLa5dZK?=
 =?us-ascii?Q?es74k29WhJMmxocwCVuJEVd+y33ZWog8kwP+ShaTdfOnRfdjS673IjZzaplr?=
 =?us-ascii?Q?U5aLCEwKcc72HkCOB0ialdG99VnXVx/T8IIfa38/NVJDiW3nQX+ajLcL0OcI?=
 =?us-ascii?Q?QJw5eG7M59CxEEhh3fvLAfrRD4j9GVk5mQPcMC3qvHARVK3fBhSxZFFfGXPs?=
 =?us-ascii?Q?JkbfzoFUuw/dRfaIB+Ht0maBKpVQPeGDFnkFH5otBlam+SwO0HNTt+dQSB2L?=
 =?us-ascii?Q?lZ4wPfRe2suHlH7k7rO+F/YR8yPUG6V8RXsaeBMI8zx8AhHCl+cal6kirmZB?=
 =?us-ascii?Q?72mAyDZN48KLebOgiYVzeAPZScMjo2166u7YQnUHi5b//njj81dGA/vhNzaW?=
 =?us-ascii?Q?Um5SsZ1uWgSUBbJ+wz12plj4r/z8J82+eGwYukg5oPoUfENkJ8Tlm6LvI7C7?=
 =?us-ascii?Q?ZHD1dDtvXQXpGfIABKPIrPXMa27OmVArnaunzOVKnAp3tvCQNwGvzsh6ixs0?=
 =?us-ascii?Q?9aFvy2dKFh8bLmmfMJExM8wzYbPL8+XqW98ZrwPZpfoXabntXMR8QagKipnT?=
 =?us-ascii?Q?FIvtUUdkXjxqXZqdkCCCe1hpR69fVR51jRkfOR5VsCkDNiMVAhYWP80Fx2Hh?=
 =?us-ascii?Q?qHai4oMM6bncuRNhurtGUX9YUEq/h0R2ztbjo52vQAZWBDY+VAASdQ0E9C5q?=
 =?us-ascii?Q?DBY0TZPpxsbgqilNV4UV11Ytm/PC3AXZ4RxT8/pIhAQ0cLNtmprB6q99AI6i?=
 =?us-ascii?Q?zptVF4w8BbnjLm1Pa3ZbWX9TVVUzoCFK95oAAuLCWHkgxUQ/XwN1b1+mY9gG?=
 =?us-ascii?Q?uHUCW1AS1/pH2T5exGbednJU25JvA1MHNbwZjWxPC/38fk/7gRcTxS6YfCzB?=
 =?us-ascii?Q?9HD0MgsG+Juqq92FvjUgggKCJXVEszjmcxYzZNLBg97pzYDwvdbyo+HeliQM?=
 =?us-ascii?Q?Tlc7xr0sW0i4hBgq22K/onPYwgubvshQnO/jYfQmpx+Tvc9FHaMdHaC8ro8F?=
 =?us-ascii?Q?KaNCHVK/WaUhet32FetRT7gyWUhtbqC7iqUAMi0t//pbYmKEOkxez2Ph7H/5?=
 =?us-ascii?Q?4hs526BwN62pzuJmawMXOc7j5jjTusL7XbudmADRHOAzbI62mSoJpUI0vq+m?=
 =?us-ascii?Q?xrmP4olYNrVfLUOhvJ3B4/pBXAEtO9xpBbGoVrz2GSmGhXfo2ATmtkWSqkmM?=
 =?us-ascii?Q?PmbSH3bMA7kp6jEir+WDF7waSErGOFOiXqhS/ISlGX7GsDVcHtuvwedDpfPa?=
 =?us-ascii?Q?8H2+QbckdhSAscFszkxfOWBcnNqMwrjbgKTc6Dzpv4Q4nxRxF+eY9jMVadE3?=
 =?us-ascii?Q?4MODe35dPSrqA6wwUCHMUd0hYc5uptOxUT9EdwgPDVjueVIeYeiRpb5uU/LL?=
 =?us-ascii?Q?P2FFpEXSmyoWVu4ORZbbmDQS3LRKj0+SrIAMbM80cYcadki7M14+evAHHzaw?=
 =?us-ascii?Q?vec4/zTnqxHe12R7tKu7FWQcwlxGtuVRi93Whepw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c331152-b6ff-4a4e-245b-08dd1fa98af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 21:18:39.6965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqQBS2YSZdhbsZLFkZsXeYmORN9Q3QpqNqQNUoTTqWZTrWjYCerKYNmlwvhkEZXukXe3c554A7PIz98S5yZ8jH63CuqY77RW0pPKuTaDVfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sai Teja=
 Pottumuttu
Sent: Wednesday, December 18, 2024 12:42 AM
To: igt-dev@lists.freedesktop.org
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Pottumuttu, Sai Teja <sai.t=
eja.pottumuttu@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_oa: Remove unused function argume=
nts
>=20
> The oa_exponent argument is unused in oa_report_is_periodic
> function. Thus remove it.
>=20
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_oa.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 492a6b5d6..ad3526406 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -791,7 +791,7 @@ emit_report_perf_count(struct intel_bb *ibb,
>  }
> =20
>  static bool
> -oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
> +oa_report_is_periodic(const uint32_t *report)
>  {
>  	if (report_reason(report) & OAREPORT_REASON_TIMER)
>  		return true;
> @@ -1342,7 +1342,7 @@ read_2_oa_reports(int format_id,
>  			igt_assert_neq_u64(oa_timestamp(report, format_id), 0);
> =20
>  			if (timer_only) {
> -				if (!oa_report_is_periodic(exponent, report)) {
> +				if (!oa_report_is_periodic(report)) {
>  					igt_debug("skipping non timer report\n");
>  					continue;
>  				}
> @@ -1752,7 +1752,7 @@ static void test_oa_exponents(const struct drm_xe_e=
ngine_class_instance *hwe)
>  				if (oa_status & DRM_XE_OASTATUS_REPORT_LOST)
>  					igt_debug("report loss\n");
> =20
> -				if (!oa_report_is_periodic(exponent, report))
> +				if (!oa_report_is_periodic(report))
>  					continue;
> =20
>  				memcpy(timer_reports, report, format_size);
> @@ -1969,7 +1969,7 @@ static void test_blocking(uint64_t requested_oa_per=
iod,
>  		for (int offset =3D 0; offset < ret; offset +=3D format_size) {
>  			uint32_t *report =3D (void *)(buf + offset);
> =20
> -			if (oa_report_is_periodic(oa_exponent, report))
> +			if (oa_report_is_periodic(report))
>  				timer_report_read =3D true;
>  			else
>  				non_timer_report_read =3D true;
> @@ -2142,7 +2142,7 @@ static void test_polling(uint64_t requested_oa_peri=
od,
>  		for (int offset =3D 0; offset < ret; offset +=3D format_size) {
>  			uint32_t *report =3D (void *)(buf + offset);
> =20
> -			if (oa_report_is_periodic(oa_exponent, report))
> +			if (oa_report_is_periodic(report))
>  				timer_report_read =3D true;
>  			else
>  				non_timer_report_read =3D true;
> @@ -2463,7 +2463,7 @@ again_1:
>  					  " ts_delta_last_periodic=3D%"PRIu64" is_timer=3D%i ctx_id=3D%8x n=
b_periodic=3D%u\n",
>  					  oa_timestamp(report, fmt),
>  					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodi=
c_report, fmt) : 0,
> -					  oa_report_is_periodic(oa_exponent, report),
> +					  oa_report_is_periodic(report),
>  					  oa_report_get_ctx_id(report),
>  					  n_periodic_reports);
> =20
> @@ -2471,7 +2471,7 @@ again_1:
>  					first_timestamp =3D oa_timestamp(report, fmt);
>  				last_timestamp =3D oa_timestamp(report, fmt);
> =20
> -				if (oa_report_is_periodic(oa_exponent, report)) {
> +				if (oa_report_is_periodic(report)) {
>  					memcpy(last_periodic_report, report, report_size);
>  					n_periodic_reports++;
>  				}
> @@ -2677,12 +2677,12 @@ test_enable_disable(const struct drm_xe_engine_cl=
ass_instance *hwe)
>  					  " ts_delta_last_periodic=3D%s%"PRIu64""
>  					  " is_timer=3D%i ctx_id=3D0x%8x\n",
>  					  oa_timestamp(report, fmt),
> -					  oa_report_is_periodic(oa_exponent, report) ? " " : "*",
> +					  oa_report_is_periodic(report) ? " " : "*",
>  					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodi=
c_report, fmt) : 0,
> -					  oa_report_is_periodic(oa_exponent, report),
> +					  oa_report_is_periodic(report),
>  					  oa_report_get_ctx_id(report));
> =20
> -				if (oa_report_is_periodic(oa_exponent, report)) {
> +				if (oa_report_is_periodic(report)) {
>  					memcpy(last_periodic_report, report, report_size);
> =20
>  					/* We want to measure only the periodic reports,
> @@ -4380,7 +4380,7 @@ static void check_reports(void *oa_vaddr, uint32_t =
oa_size,
>  	for (reports =3D (uint32_t *)oa_vaddr;
>  	     timer_reports < 20 && reports[0] && oa_timestamp(reports, fmt);
>  	     reports +=3D report_words) {
> -		if (!oa_report_is_periodic(oa_exp_1_millisec, reports))
> +		if (!oa_report_is_periodic(reports))
>  			continue;
> =20
>  		timer_reports++;
> --=20
> 2.34.1
>=20
>=20
