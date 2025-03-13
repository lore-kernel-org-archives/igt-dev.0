Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333BC282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 13:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B210E87F;
	Thu, 13 Mar 2025 13:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoKIFzed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889510E87F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741870850; x=1773406850;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=OCHwNBkzUzK2CSnHTQF9h05b65SfuVWWYBRqHESTyc0=;
 b=XoKIFzedMBE+AuXz9M2wDd8nV/y4UPeBT9bskJUJQ6jcquYKX/UUB3K/
 EV8WmC/S+rML68kACiMF9BcaA/oWwbTo2YBt19IOj6us/glUpFrQU7fdu
 d+31OAuzPo/WPCrfiAwauTCLGQP5aeP5kFubLCfMZz5b2evOmrH4KGGXc
 dyKUYifY9ETjORB4dm3Ec33CatPFNRoiCw55PF2y5STiIJahchjZ7L7LE
 OYD1hN6mcByxpviXkL4uTDoFLcMYe/KY1m6n12EVODaR+dOtUom+nnGtQ
 Rk35NLKFJxOWuNymdKCyvE2oELM2tczBni6y+SWrDm3/15bCT3K4u0qZz Q==;
X-CSE-ConnectionGUID: Ppsns+dfTrKz3sI6XcN6iQ==
X-CSE-MsgGUID: pzcZUDNmRamIwwlSBKaI8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53190116"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="53190116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:00:50 -0700
X-CSE-ConnectionGUID: UA2V1b4aSi2erllRAYw7nw==
X-CSE-MsgGUID: 2i8NJ3c6QK20F/piGoZTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121873697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:00:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 06:00:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 06:00:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 06:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT9qQIXpAeBL3u4C0xrWu0XIv99tQG/OA9UDhc7CBmgBlvAD/5uVV3IfY30+shCoIwfisiSWj5d+EiGEyG4ntA6wEwMATNC1kvXc3e/+5xcut95W2W65kPRhubO74/WK9IKhLBYeXGrdzzUYJOOQ88tfkyi7tJ0DyC7mJ4ZBaMIR4Q/KXWdoNpTvb4Lwh77cWKEyfjfS3jsJhkgUrNYzDo1L9bCeLWIyy6IoSa6gxdPe50ouqG+ZJgXHlSnw76AsBwZHT9d/j5ln/70ZeQv8+hxRFiZzFertSfsiffFzzRv8zeGFc1UwQ9G1bKT9B1Vya4ftLr/QnkvfCsDonveJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3glcgATT4fSfMcX90szLvh8cRenGD6kG4iL/Tmc4E8=;
 b=qeSQ28B6n6/dEH0Zq1JhvfvFt/si6nbG/ZW4qtV+maLoORonPCpfN5jjzRwHOPqzSeYf4Ml2jIF7Dhi1VNHj/Sq3KBiBDKnBHp0xqQAgDT9LRh38fC6gWRuRtJXT+fArehCNTYzmNCL3sO7iPQcrZgSmKIArOux2vcCPd3LYhpX+4zft72ZOAG1KgQOYPC7gmQIRQkVubqpCompUzmGc02nXege/eUNgRHX9ABa2b8g89AMB6DtLeGNuoQSG1j6s86hmboyfweaMyt4dJJ+nMLXX5bTAKLWYCntEFIaqRK0sSY+0vyr9Vwpct7558KWD/rmQrg1MOKGyWTOpnM9r9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 13:00:33 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 13:00:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250309100649.26528-1-mohammed.thasleem@intel.com>
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
 <20250309100649.26528-1-mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Add skip logic and
 logging for DC5 psr test
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Mar 2025 10:00:27 -0300
Message-ID: <174187082742.91144.4847624528128996107@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW2PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:907:1::34) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|PH8PR11MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: fac9147a-8a25-41af-88c7-08dd622f0a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a29SQ3NLbVdqallsNEpKMmVZVTRKNy9DbFM1aDM0YVdwZG9pVGYyRlFGd1JE?=
 =?utf-8?B?U1RBZWpaZWF4WCtJYzc0UmkxUzZReTRzRXZXemFTNEVtVmg3SXJGOVd1QkQ3?=
 =?utf-8?B?OVM1SlFxZWRIdzh3M0FuaFR3SHY0NXZqcVpkZURSODVWRnNiYkRXRWhJdmFn?=
 =?utf-8?B?UlcrdzdwSGJKVXdKMG1BNnNWMHN6RWlOUXNnVFdiQzVkakw5NlNOaWY2dXgv?=
 =?utf-8?B?RXBUMlNZOE1pUWxaZGxtelVkNkdQbGpDVXM3a0NDTEFReEpyNHdVakpCQ3Vn?=
 =?utf-8?B?WlVLNzAvdlFmai8ydE5lRWJUbjdJMktKZlo4OTFaejEybDZIQjk4dHZzR2tD?=
 =?utf-8?B?RjY4MURzZ09wSVRzTjdxUklya3phRDFJS29yZXJ1Rmo4ZHBXVE9PeXlkdHV2?=
 =?utf-8?B?WGFpNEVjSUZhMVB3RHV4eFJWTVJtWkNVeG4ra3FMN1F2dGJ5Y2thVnNzTkFs?=
 =?utf-8?B?YWlxcXBzN2Q2Nno3QlN2QmxYKzlhNEhmeUlhV2VJM0ZxK1VTa0RpdDhCSzM2?=
 =?utf-8?B?U28zaE9nZjVQQk1OdUovaTg4UjVycEEwazcxSTNsTUFRbnJVZmJla1lDaHNW?=
 =?utf-8?B?UUVGUGViRXZNN2lYVVkzK3d1Sk84bU9qVWdYenpxY1ZrL3ZSY2JQYThob2hY?=
 =?utf-8?B?YjZETFkrc25qSW52em5MSDJnUFAxeEFRcWV5N29Dck1kUm9tVGErczN0RGlK?=
 =?utf-8?B?VE1mWEJyM1JPY2pHMUIzZmJhU3FoQUg5R3FocDFPWTVGcGhvK0FyblNUTndF?=
 =?utf-8?B?eWJZTUlHL1Zwckd5dkNGMHUrbW5XbGJjUi9YQ3YrMno3dDdOd0g5Kysyemd2?=
 =?utf-8?B?U2N3TG9GMW01ZnBRZzRSMkdLN1ZXSDhqanloMWV4UDJFd0tYdnQ1S0hLS3Av?=
 =?utf-8?B?YlJSWmtJTzExeFNnUm9HbTYwaXh3MlowRlVCWUVoL0cvbWQ4akhBZXVXQm9t?=
 =?utf-8?B?SU11OStiU1J6WHhqazlqV1cyOFliNnJxcVJYdXFpRlhid2hoay80c3RqUW93?=
 =?utf-8?B?TmhPY3d3T1NnQ3NGSlpTbkF2RFVBWWdkdURRN3pjNzM5SUU1b0xmQnIxaEov?=
 =?utf-8?B?ZEQwWHlxek9zMkRyc0ZEYmdYTWYvRnNDWXdmcVR5NUo4bWVDbDhRNTFTOURR?=
 =?utf-8?B?ZDhXTExOdnpTRUlqTE9YK09TSkFnakhiRUI1Z2JRQ1FPZjJYT0FqOWVsdEc3?=
 =?utf-8?B?dGV1RmtGNEFkYkYwS0NYWmVtNTRzZnp3dFRZeDhCRDJTREV5bndYc0VnTlJo?=
 =?utf-8?B?QVpaTzhPSXJOdlVpSUZ5QlpJS3NuTlV1UU5FY1NTdnA1M3pONCtwVy95Q0JM?=
 =?utf-8?B?eXJHdzIvQW5wbndURDZId1Q4K0gwMGxRMERySjVaclpyc0ExeHJuU0ZrcjFa?=
 =?utf-8?B?UytMbnVOOVFTN3dhczhzRjF0anNWWjh6MWtyWWdqajRvd2ZlNzJINE04OEsy?=
 =?utf-8?B?VkdHcnFPb1pSdXFpRmhqMDRmcHc0Y1FCZ2lvWjJ3UWN1WlZwKzM2ekNYWEZ4?=
 =?utf-8?B?a0lTZnloS0pXMXZhYTBHTjUzeVBTMDFhZGxpTFJJTmRyQnJXS1BLSk9VUUh1?=
 =?utf-8?B?RUw3U3ZMYTNwLy9SdFpDOGFqS3VJejdjc0h3YWRlMUI2RlhTeEFic3V2WWl3?=
 =?utf-8?B?NnhMcUM3V3VYcGt5azdVd1B2VzlsU0F1Z21mdzdHTWpkdkpGUUUxMUhDaEt1?=
 =?utf-8?B?YThZeFJZRFVwWDkvR3lSdFZoRjJQSUovNTQydXVndEVua1lQSnpOU3NKemo0?=
 =?utf-8?B?RXhiTllIdUNnR2h6K2RKZTUyb2Jkczd3SUx2Z01TeGxONVBqMWdDbXR2Q3F0?=
 =?utf-8?B?Z1MwQVNaUG1LVnd5dlBsUGNvQzNla2J0V043SDB1KzVONUozZ3h4TzN0ZWVw?=
 =?utf-8?B?bmt4bVVBNGxROU9xU2gyU3Y2bmhPdFVFNW9jL1p4KzRabWlnRVlTS3JTRnFY?=
 =?utf-8?Q?GFYMnofLXOWCIp/huRHnipo7QVNrBitD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFRcktDeVZNT1NXeHozNndsOEpodlMyMk54UzlaU0VhZEtDSTB1R1BRT0Vo?=
 =?utf-8?B?ZDZ6b1RGV0p2MkJhclNwYnFyNVorU3NzMkpwUEdUTzg5MGFnclpHYmdMbGoy?=
 =?utf-8?B?WUV5c3Y1QXdnZktXKys4elhXaWtuTHdubGtwaHpKUXhzT3dRaHA0UkV3U0Nx?=
 =?utf-8?B?b0U1M1g3UVFNY0VJUjlhdXo1N2hNdGg0Vm5UWEpIeFdaUXJ1VVg3Vk50UFJL?=
 =?utf-8?B?dWtZRldLNWpVdHlLNTJ0SVV0ckVyTjd6Y0UzeGMwRnZMMW53MmN4MWRDSmVM?=
 =?utf-8?B?NUhsL0hPOXNFMkVLd29PYWMrWkhiYUozZkI0VE91WEljYU41ZVBEbWQ2YXh2?=
 =?utf-8?B?Q3NQZklrbDBlRFQzVWtwZnBXVy84V1haZlpEbDhnckducE1taldYbENEMW9N?=
 =?utf-8?B?ektac0p2TW1SanQwVTFwUGdEdWI2NEJYNDlLRGFzR3ZBR1hPc21zVEtxL2JO?=
 =?utf-8?B?VjVlRU9qQWJXM2lBSFpNUmpUMHd5NmNXa0xQWEpIcTVvN3kxL0ZDYjc2c05I?=
 =?utf-8?B?ZVF4OWtXSGNGRndlbnlwTWJ5bmlPekQzZnp5L29Qb2dXWHM0ZzZXdEtsRkVo?=
 =?utf-8?B?UU9pTDIwUitJbkRwSHFBTURudXRGZ0FFdENDZDhTUEtWY3cyQm9icjFIMVZ4?=
 =?utf-8?B?Y3doSHZvQ3d5OUNISGFGdloyaWorUW1VczlnUTFTMUZXc1R2MHpLajBBcEdM?=
 =?utf-8?B?c2Y0bXVaKzdCa3EybzhDZWFRalFKYTh2M2RqeERCa1hQYldxWktPTDE1TkhK?=
 =?utf-8?B?UFNTTmxsMEhjVHhCMGNybmZmUTI1V2h2aEs5cDZFbmdhbGsyYXliSm9hWEor?=
 =?utf-8?B?ZjQ5T3lUYWR3OUJOK2dDalN6b0tYYVk4ME9kZFkxNHJ4QWZEa3hLOUZaRlVu?=
 =?utf-8?B?dCtUV3ZMN2psZEpuKzVvQU9CZTFiZ2djMU1LWnZaNitpSmYzZlYyTG1xVFhq?=
 =?utf-8?B?RjU4Qnl5bjRZdVcxOUo1dGMwaFBIS1FvZ3MvRVBkZjcrOUxaTDgxQUpNK1Bx?=
 =?utf-8?B?WnN0elhpKzV5YkNDTjdMUU5wOEE1SktybXJySEMwMnBSaC9uSE9YaUxIbUQr?=
 =?utf-8?B?cGpTUit0WmJ4ZHZveGxIMnNleFhXSDB1bWFwbHZVd0w3SlVBTGVDREJvM1F4?=
 =?utf-8?B?Z0ZPUWxxMEE2MDd6OU9kTnlMTHhLYjluSmNVUUFZL0RUektHeVI5eG96NWVp?=
 =?utf-8?B?YlFHb05zTy9sZElxZUZzUkFiTzVRYi9lYkNNb1ZabnpNSitPR09MaGF5cHFV?=
 =?utf-8?B?QWh4T2R0eTc4ZWdsbnNKVjJxQjh6dWdYbUY5Q3FGTDIrMWwzUUxQQ01iamw2?=
 =?utf-8?B?Y0FSSzZueVRBLzVDOTZ0eUN4QTcrNXJiMHJpeEZ2NGdzOThvQ1V5aDd4NU9m?=
 =?utf-8?B?ZnY3QVljZUEzdkZKcTdSMGpzejdBb2RHSEhoaGVXVk9zVmIvV0lKbDJxV3ls?=
 =?utf-8?B?SDJ5VjBBdkxwbnF6d1hyUDgrRXVGZVQyekhaSWtKZk1Gekt1aU5MdUxma1Fl?=
 =?utf-8?B?RU9nQmZaY2ZBNjllU0gyM1A3cHppWFExemxFSW9YcTBBblNWTUtsaWh5YUI4?=
 =?utf-8?B?bmVLTlQ1VmFOZlpQRWVoaTlFeFp1bE9MOVlPSjVoOWpURUNXd1hRK0JuMG8v?=
 =?utf-8?B?Q1JyeElWNll0UlhyZHB4K2xEeU9aSHpaZCtMYzB6M0MrTUZxQWYwZTJVS3BE?=
 =?utf-8?B?LzFoUTZsNnBDaHdabllhQjIxS2JiVmZnZlRYRUhzeENVN1R2bjh6aXNSTFBY?=
 =?utf-8?B?UnZRWHRKQ2ZZZHIzTE13V2pFRjBBYXBIKzd6bUY1dUxSWEVkczViQVpyL3Bk?=
 =?utf-8?B?aVcvZU1xQWhpT2xreU5ZU1pDK0FTQ2hNQm96dFJ2OGFMQ1BjOG1wZFJ4RVFE?=
 =?utf-8?B?RHVwM083bmZqczFVUXlBYVkyalJ3dXNDeC9GdnVjMGpVOWFtR3RIUTJ5RUhh?=
 =?utf-8?B?VmV5WnQ4ZC9XY3c0ZnZwS3ltWW9SS1h0dUdCQnZ4aUlyUm5xek1ZTHJ0eXFS?=
 =?utf-8?B?QzZ3M3hJL2J4V3NJazNPd3lNMFVlUW9uZ2RaOWZ0b2JiQUF2U3QvOTlFZE80?=
 =?utf-8?B?anZxaHpUTlZFZG56dHVkY0FtZUZubDRmaU9Bd3lJOGwxM3FrZWdFM1dRbFZO?=
 =?utf-8?B?amtGUkFnM0k4eWhPa2ZaNnNEbE40NEZ1dW9CYTd3R2FheEIwSG1ORzFMN2dC?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac9147a-8a25-41af-88c7-08dd622f0a2d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:00:33.2069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf1UR7MsyKN5jHMqz4AknchSnti90WrFtE3PXiA1Xc7Zmu0+LHEDogHnqG87JQZmcppuPmsKs8B7XuOBxkQUug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
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

Quoting Mohammed Thasleem (2025-03-09 07:06:49-03:00)
>Low power Pipe A is required to run the DC5 transaction for Gen12.
>For Gen12+ to Xe3, either Pipe A or Pipe B is needed for the DC5
>transaction using a low power pipe. Added skip logic and logging
>to enforce these requirements.
>
>v2: Updated subject title and discription.
>    Add Gen checks for low power pipe selection. (Santosh)
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>---
> tests/intel/kms_pm_dc.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>index bbb29d7d9..c7fde2af7 100644
>--- a/tests/intel/kms_pm_dc.c
>+++ b/tests/intel/kms_pm_dc.c
>@@ -156,10 +156,15 @@ static void setup_output(data_t *data)
>         igt_display_t *display =3D &data->display;
>         igt_output_t *output;
>         enum pipe pipe;
>+        int disp_ver =3D intel_display_ver(data->devid);
>=20
>         for_each_pipe_with_valid_output(display, pipe, output) {
>                 drmModeConnectorPtr c =3D output->config.connector;
>=20
>+                igt_skip_on_f((disp_ver <=3D 12 && pipe !=3D PIPE_A) ||

The commit says "for Gen12+ to Xe3", implying that version 12 would also
allow pipe B, but here we are only allowing pipe A for version 12.

Looking at the specs, it seems we started to have pipe B as low power
pipe starting with display version 13, so it seems the code above is
right and the commit message needs an update.

There is a catch though: discrete devices like DG2 and BMG have
only pipe A as low power pipe.

>+                              (disp_ver <=3D 30 && !(pipe =3D=3D PIPE_B |=
| pipe =3D=3D PIPE_A)),

Why are we limiting this for display version <=3D 30? This would cause any
new display release (i.e. a new display release with version > 30) to be
ignored.

I think it would be best to use ">=3D" checks as we usually do for
if-ladders in kernel code.

As such, my suggestion is as below:

  if (IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
    low_power_pipe_selected =3D pipe =3D=3D PIPE_A;
  else if (display_ver >=3D 13)
    low_power_pipe_selected =3D pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B;
  else
    low_power_pipe_selected =3D pipe =3D=3D PIPE_A;

  igt_skip_on_f(!low_power_pipe_selected, ...);

By a quick look, it seems we do not have support full display version
(major and rel) in IGT yet, so we need IS_BATTLEMAGE() and IS_DG2()
here. In the future, we should replace those with full version checks.

--
Gustavo Sousa

>+                               "Low power pipe was not selected for the D=
C5 transaction.\n");
>+
>                 if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>                         continue;
>=20
>--=20
>2.25.1
>
