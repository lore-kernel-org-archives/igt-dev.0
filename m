Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D28606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGvh6XqD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91C7112580;
	Thu, 22 Oct 2026 12:33:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0B112580
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672350; x=1824208350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CpT/9SK92/ijNGg/muUruWCqSgFYbcqjaaTr6MmcPf8=;
 b=PGvh6XqDZvdRZgG20eq8RNgNd/TKsw115cPPGgHm4cjlmaUeFnh5EGw6
 l74L2Sc5hFoNw7Oeqa8Gj41Ub43a7pSdDAFug7QcANH/phnxAY+DPbEHc
 yolHfZF1H+FpyUW2RQtrkqlZrovI+5aZGVO4NSlzjVIOYHKxvgQEBKQ0S
 3PVhMgQYqazlC8ZBOw1cVtCtbxXL73a5M48B6j3uXblNo0c0J5wYV4if0
 2wMpJSABU8Itqbl5CUSaWVeqKJmoSQlXt/fOGHlvKrn0h6l3fhAaKegJh
 RRezl3aCcL2tMnFlfAmJdbdAvrKtlpibjmCHBozYDy7Hn1bPsIFlAznYd Q==;
X-CSE-ConnectionGUID: vQOICD7rRWmuhfRxQ775qw==
X-CSE-MsgGUID: NURphMqBQ6WWp3uBygoh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1309312"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1309312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:32:29 -0700
X-CSE-ConnectionGUID: Kw/7JpReQeClXZJnou6ysQ==
X-CSE-MsgGUID: QRTrUl+OShCDQFMwpa744Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3714087"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:32:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:32:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:32:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq7IQyU6dNeCdjAzkltPJbZ+ntVhunaOHcUZ/kCM3ul98ZCFHcfERI12Q4rMtthE0itsQ93OzB5WvXAUeb5KUENIdaotv2qDCYJDIyeKhT0wZBb06irZLYHpImaMXKaZdHedL0pU784rgpQFF3k+N60oN2MxOZZrFCB+iwXRFfaRgAQ9fOEcGpyMjE23IiJURmkaSTld5iXbLTEUbPR7YaM7nu/CVtWk1YrkPPKjP/Juv5J3rgtzy9r6lhI6UdZoUT58PjQswO1VUPeiR0KzEuPeOQ2Fi7H4ZG94viUNwll5aTtKGbCgoyuTCEE63DTOWZ9mz2rS0TRMYX+eqHyAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFZsEiSte4O5fdhMrB9oMyUY6BOUfNT0sLEq94bNVk4=;
 b=XjZ+U6AO4NJQF42KmYBB5vt9+Y1Jm78S32pkXwvPGhvroCQNdYIUFkAEQRlL+kqc04OWJeZhnGW89oaS+ykzULpvg9R3AzRpiDDlQSm494mhezRu1Qo18jAvYE4n2qnjrnogsP59tbprFW8W2lCg3lIf5PSSYeYsmnXQbLMLCBqDGOnrMGX5J6WnYMcJXg2Cmg3GqwPVdWwVCv36F556un12wp80XkrMnPt6WTvO+4ZmrfymFjYHIEFjwnLoi3urhKSmmC90a2dh9lFC9cKnUbAJzn23hM9yj6A6b3Uibs1+8nRsitO9sKUU6hgsOvBGBpSaXSQHmYqtX8BuF8oSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 12:32:27 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 12:32:27 +0000
Date: Thu, 22 Oct 2026 08:32:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Message-ID: <atoCV6hhnFIB_fiq@intel.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
 <CH3PR11MB04614921246BC82520BDD5AAD6C1662@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB04614921246BC82520BDD5AAD6C1662@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a6f0b6-9ee8-479a-0918-08df30388811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QaoiOcaMzL+a02rmFFfRYDRXS17x0xd/EbzzmTl/PDTHUaH8ZUt3hitlGZ2o7uFHw5xtck8kvj1czlM6d96MpOQMMezBc5k5DKFP2FsNyhjrT0YVGjXCA24lRW83w2BCFST/gyJXiX7bp2zo6bLCy7nw4VZI63M4qi7QSHyYo1R1QzXkeTPUNT8v0zP9f0/g5lSKTDlEHz+26BuUBZc6JT5PhzreeoGnkuSSsR6Q44os4Vq4znnWz0V1cHmtonxlibXwhv05H7MjmQsv/ubFo74M7pfZ9znzbV+MkKPdm+ilVQQ8Wi0fj8n/yyhNS6s3zwMSBkRyusWDnHRrrhwf0zPrKSrEuX+iK/vBLlofLDiPO5xSsu2Zesvzbqc1UFn/X+btoMvCZogahWZyZQvFoYUbE4Fy3OfEXrbcJKzyHyzkiyue0cAcfhmgeJDk67ZB4q3p17AM2yH8A8sYnUGpufVeBJw1FRk+DIuCR6gB7roTjneAlZZpSkRG8IuHd2Bg6/6QqS5HROE+X0BOpEw3fjqLX7NrDKV1gg6CTX0e0Tj9vlzUaIA/xLmlpzacVsFW5HFXlo4hvPzzUoe5B+NR72wsd+CGeyozJMfeygv3MapnLUwx7BEO7H4l1a94eu0qEhh7tP9ZyQa0D3dhsJPB6jqkJgQx/YMEh77uK/6xBiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QbigEQekykM1UjH6Efh7FqEjDQyOpHl/RTU+WDKCfL6beIrvS36y9WuBEuI9?=
 =?us-ascii?Q?apNaQtHz3NcQ2PoVsV8WDVvYGcR1dSnlGEiyY2HdONW9Zr9RwUvM2iqarDPH?=
 =?us-ascii?Q?as2HRHOAWHl7DTD6fndcq9TKINdS3AUcsfkwfc8CdxDl7HTI2o5rg6Qb3bFs?=
 =?us-ascii?Q?21BOHbzfZAAZC6YBoEAR2/awPaUN0zrBignjphwURZeYdEbBZWE2T+JVqg1X?=
 =?us-ascii?Q?PPq5ubokqhNjmw+QQWykdS3aEQ1orJgXJqyleK3Z/l5xL5+Kb7VmYO9G4/MM?=
 =?us-ascii?Q?tviKigssYYZAi9PID4FG010Dj9NyZgwV+S+KNXzUSsgB6+xb4W4GY1w91+71?=
 =?us-ascii?Q?4N5brzGUPVtvWPIcqrsjLJDmVbzaVc68/yRvVD9sFqw+iVwNFJXKi2whnKHY?=
 =?us-ascii?Q?DGvVs9GapmZV1DPXDglJ+r8JLrrIK0Xvh+etsGmM93rp0RHsVZaqyukKj7+v?=
 =?us-ascii?Q?fVyjiqlI6ysoQdsXC7LToliiO3YpI0ae2ZcpITLQryx8R2NOvoVkoEyZxZmn?=
 =?us-ascii?Q?rdNeoZxCyoqY7y/+wei/rRQSYejGxOPng7zTjNsyFMoVID2xX6o27vfbsRWP?=
 =?us-ascii?Q?Bjikf1PdmD9yKHjxA6XGdzBUfjf8HHegohsMhNoHbIDILs2iMj191nAl6aCm?=
 =?us-ascii?Q?R++aEBV5ETgpLbAO3t2YcZo0uT/kN7gbdvry337xB6yIZcU312HteYIfwnO1?=
 =?us-ascii?Q?4Js6Odq2BdMZeLCk8vb1W2wwCv9PEcLdbKrvYFjQPgn4weddrdjSEBHdLmW8?=
 =?us-ascii?Q?4aim5gt3tOiM70MY/BOTOqoaZkV5xn/DEP5G65Wwn/6b7yzAzl2fTxqMjA+2?=
 =?us-ascii?Q?5dcLaBEunParauUFoNXikeAbto3tI/n0jSiftPUYICa/cL9dps7okqQ8naer?=
 =?us-ascii?Q?ihAupnQKujFL7AGlYDM9EIoXIodepnx0fC/bTIBgsSSkQqZyKeBFxUpMvuAY?=
 =?us-ascii?Q?pehEgw9dvL5xEYmRYaoHlycQcMZNWJHY2ncnWnr1PyrQyr63EkeWiOYShspS?=
 =?us-ascii?Q?r0up5Idu+uV2Vx+OwQo7J1Iwml/YQivigqUV/ILk5nQz+Mz8aVICMUqKDSO4?=
 =?us-ascii?Q?TJUDOB0Z4Uss1pSVzy0tAuIvgWl7LB4+zfSwKJb4hK/LrpAjSsgXQVePlDy2?=
 =?us-ascii?Q?nfT9GwJFpe2tCdfHqescKNSBYNSotiUuw/q9qsIeoyh6S5cagq+CRPhcjgXA?=
 =?us-ascii?Q?RqRYApONTz9XKvQMDi4/0ps5cP72RnCfN/Z7pLtp0bCkgF2y+mrCZSRRSUeS?=
 =?us-ascii?Q?jyWGXuXRGDCbZlOCWTuTVCfcOjaWY4D/cZyN9iMQAGLMzb79j+VOKW9MzHEi?=
 =?us-ascii?Q?x/MJblHtrD1KXPhLJdAvEEsz3rv92HNBJReAC4sTZcsjOu+TpYclkSDnUcxV?=
 =?us-ascii?Q?3fNkm+FurZBv4XVhEE8iwEl6IpWsIgxyXk0YTzFPFh2yuvhgf/pkcxreybV0?=
 =?us-ascii?Q?5gr60xPdjDqeKikeQBO5T2inUUp2/T3TNvOey1BOc9hfAQdYH3KZ/jy6dRRh?=
 =?us-ascii?Q?enh6B+V40hvpQ1KOxCuAEqqjZbY3XXstYqLR/x5qdklU0Z6qpQ0l+kyR2PQ8?=
 =?us-ascii?Q?/QWKvw720SFiW2a14Epj5paDYln/R2H2dLTrWiuOjC81/iTdYdK+zrpXwrLk?=
 =?us-ascii?Q?WWI2USkVoUCsG4NJF0bl/JeDzHxb6xmVQIxhqr25/WZoYmhlmuICNDliXzcq?=
 =?us-ascii?Q?PEc4j1tXijL61M1QYNNHmr78VrbAjjbI3hIeWNvkz3H2SfUj5WB4zo9yjjLI?=
 =?us-ascii?Q?X9MQv3wULg=3D=3D?=
X-Exchange-RoutingPolicyChecked: uVE21HwfHAZFn5+hSMPlp5sXqbGuilybxYrBznhaOs6G5ioOQHyMgWfgYzFfwdnAGqV7GYJNkxSkecFXkaPtz6ZeYUiZUZGab8o+ybpkhSFd+iwDDTUFG8unCTnfJE+GHfTxf0bRirRyIlBG+Pmuz08dCYe38lFiAbvP1CTvTVd8c7D9v/YuIOLdFJo0tzlJOKAVTGcnssZxYnjJJ9cZbz7vXCwfY+9J3uPk2+OaCqBWNXxHp5bH9wetwO608N4+beNCsqzojr39lYE7wmGqsBuYuq+Y6k1hBwEhuVwSk3Dp8DCkxpN7OnlcFSF52O+TxWh6YEEjhZTDAT8Jm/NB6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a6f0b6-9ee8-479a-0918-08df30388811
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:32:27.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmuyBhkNo/IchEYny9cX1Utd1EanYbyIlHLkhzOYsbTEdCYSnFuwzLd/fk/VvJ/zk7GEX7SNJND1opbmdycnUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 08:52:45PM +0000, Ruhl, Michael J wrote:
> Ping?
> 
> Not sure what the sequencing is here...
> 
> Is this IGT reasonable?

we definitely need to include these tests.
The biggest problem I see is the crashlog one. Because it puts us in a undefined
state until the cold boot and we don't save the part, that will likely impact
the full CI... (if we have bmg in shards)

Or we find a way to restore to a clean state afterwords or we find a way
to only run this manually and not on the pmt-bmg-all...

> 
> Thanks,
> 
> Mike
> 
> 
> >-----Original Message-----
> >From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michael J.
> >Ruhl
> >Sent: Wednesday, October 14, 2026 12:05 PM
> >To: igt-dev@lists.freedesktop.org; Scarbrough, Frank
> ><frank.scarbrough@intel.com>; david.e.box@linux.intel.com
> >Subject: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
> >
> >BMG and CRI devices have PMT functionality.
> >
> >Provide tests to exercise that functionality.
> >
> >Michael J. Ruhl (2):
> >  test/intel/xe_pmt: Add testing for BMG PMT features
> >  test/intel/xe_pmt: Support CRI PMT
> >
> > tests/intel/xe_pmt.c | 645
> >+++++++++++++++++++++++++++++++++++++++++++
> > tests/meson.build    |   1 +
> > 2 files changed, 646 insertions(+)
> > create mode 100644 tests/intel/xe_pmt.c
> >
> >--
> >2.43.0
> 
