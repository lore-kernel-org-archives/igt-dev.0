Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921BC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 05:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7505110E23E;
	Mon, 27 Jan 2025 05:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJe6jzgI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640E10E23E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 05:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737957105; x=1769493105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5UJ5NjGYFbHD/j2oFkQAcVis+baKdwR+38qip7Quevk=;
 b=TJe6jzgIJbJ4T4I4K6Sh0THJkiRwRtrltboD9j3OcDyvDvA24xKFtwtd
 YJangTL3aomEFMHoh6cbd8ceH+c13Q+64xgb5LElvaSD12zAIMyAwnsc3
 eNHM/ZmrgENLgZWGw8eH1lB/SrWlwJ28/KQVIXnuHg9T1AVCAr18xtTpw
 jPwtI+PgXdKusSnxKlFV2ID4V4BIJmuFMA8jihUojkM3iNzumXrs8DVNS
 cfQCp+3cLiI0r3pJJuEuYgxGVnOjCe1U2k94X1O2M6eOFoddexCM0JmeP
 BEqwSqLqwKQOS7QncVtjC/5FI4F8pW7zw7UQq/GTFdrERVrq5FlK/7P1W g==;
X-CSE-ConnectionGUID: WQSAHc7+SX+CIahiF8vJ7g==
X-CSE-MsgGUID: DjduYZ5MTnmNiK15O7j9gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42340364"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="42340364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 21:51:44 -0800
X-CSE-ConnectionGUID: WymmlIlDR6qsEKGSyoFSUQ==
X-CSE-MsgGUID: yItx0AiYQzCpnsYY+tEDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108781374"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 21:51:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 21:51:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 21:51:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 21:51:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRACqhoroWK1lb08TBv4SG3QgtKLcyZGHfthEhpT7LcQ+8/mzffMWL+azbBWkmh4cG9+rvBYZEQb0iXobzdz9Eubd70dstSkDzPkvJERl2p2PSEmj+ApQO5erzA8G+QlQP6DcA8ZR3Ldj7cH9XRpE5ETfIOzqnhK7mViE82OBM5mYIXWyNGmmfK09Ky9CAw+Vp3HJQWqUa2VzPQsFSUqF8RpAre+2TjhTk+WX/p0xPBCm6B6Rq/Q7fjsyPfCCY+QnZT78z2mYEepfjK9CZ/Q1Xu9JDNU6dJlA4m/HDNx0KZSi8dJFxRt/6oRMkh76UdgG+ee5mx8u/HDnOaVdjcRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UJ5NjGYFbHD/j2oFkQAcVis+baKdwR+38qip7Quevk=;
 b=lK/wDWVk9g/GHKYHJ2RHPbSMiC1M8Z5A83ghSEgJn8q0leZCBOgFWl7zu3Ti9M8G/f7XAFLnJFohBBMzqXEu9vJjfD+FdofYZdsd2EC/AeIzOk8aOEAkabreLvZ2TVtNL80a+A+CWgvookGgIk50qt6uMjAHGUTOW3Tv3/e33JW3ngrOjjW2BVMZB79EkT3sXUB5fgpCi4zcnrGO94xxp/ngqBK87Z2YLINvtwj+45uU9i1WM7L81/2XTC+7vCTD1rJBAOJfQ0oXImmEzTCFTwqPAAGmkg/FBsIX2ZW2U4Rkn71xgOE/1HOC8VasyzD4GBvN2Nw/Nhrd0YpZ+9C5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Mon, 27 Jan 2025 05:51:00 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 05:50:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Thread-Topic: [PATCH i-g-t] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Thread-Index: AQHbcByy//qIMZJTiE61zE9/7w3fUbMqHdWA
Date: Mon, 27 Jan 2025 05:50:59 +0000
Message-ID: <DM4PR11MB63121D29207E8875D958452590EC2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250126181931.3356853-1-jeevan.b@intel.com>
In-Reply-To: <20250126181931.3356853-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV1PR11MB8842:EE_
x-ms-office365-filtering-correlation-id: c365853a-2c47-4575-7f36-08dd3e969379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?giy8C4JFXIr/9nhTJrof9cJyoZhx8j2w6f5enHFZhGyIuc3JicpX6Itnwn5/?=
 =?us-ascii?Q?uVFhfcW3Jlt97NZRP7OLfkWryP7wme5OkGJGOsDUM3aoDp2FuFsMT6d656LB?=
 =?us-ascii?Q?e1tzDnGkM/GpTY7+0MqxlxNFJh5FR8KVvhg65+ZtzJgcwZkcuphTXA/LCRaU?=
 =?us-ascii?Q?Og1QRU1+swCMkbfwkRHyRubGE7LatBOPPcBng0bUcXj0FPuKTx8GZB9UJFtR?=
 =?us-ascii?Q?g6ZxRsMlrVZIPzMr8WMx04Gz3V1RQPrbS3bOZsznNRATK0Wr6rR3H2QbNwZ9?=
 =?us-ascii?Q?N3fQp7yLYyy1gFnuPNguB91UlPVxcWsrlbmp8/OKd2DZhQXf37sizH8I/Ecq?=
 =?us-ascii?Q?sQ4LAx9zkCAM3w1jG/waRrk7scDaz1YR0tPy40tRig8eZ2kvxIHE4+CFB906?=
 =?us-ascii?Q?tbsXBaED0BOmGKlrLOitJdaL85Nxu4xmm4vKPXrflOmdYtu2J/DNTrwAOrcX?=
 =?us-ascii?Q?3lHuQEW5aHy9yLLDPFxxo1qteA8suqohYZT/mX5fx4t40lNIBU8Dwl13W0O/?=
 =?us-ascii?Q?UZjzh76T6I6wdHbZs/v5UrQC6gyhZ9DrNWLo2l5BB9hI8yt+/H/aB9iccsTN?=
 =?us-ascii?Q?G3tui0lcAxaIMPq8mQAshC3WCIVXMqD79B4yqM30E1LbBQzcrS+TuQq3IF4K?=
 =?us-ascii?Q?K+czuc85mqm/hLI2URvRPutVBA3bl7pdGVOdrfpohoV6Fd2mTV1Wcl6DoLu7?=
 =?us-ascii?Q?fonrNZr6iI6ps+ZaHOXJhDrZj+rbH4WR261UWn8CqYiepg6wB1Y7YxNVsWaL?=
 =?us-ascii?Q?8rHvExbDRLJy0IUAu6HN+ctQ+yTKfI4MTmpUk4J1+lW8zg/5iZf4IsjJ3pjU?=
 =?us-ascii?Q?U0iAIJ918FWwvCWPEfF6k/MFsKCjeBID64lyNcysbY9ZnxOAOk+P3tvnk5eM?=
 =?us-ascii?Q?V6ssRJCbFK3CY7c94+w08Rlpg56vQQl1U1LBHJJ9Fpa74g8w1FmeUWq3gU0W?=
 =?us-ascii?Q?rz3IOomEuCt1lBRnQ/ewzclv7uYHpagyj9O55+Q+UCwE3hFkE7J+YoXZ7lvf?=
 =?us-ascii?Q?VhRquNN/aqOKOaGLnDhqKRmby5A3YpZw34lVGqlIWaUWIo70zenlC/s4fPnL?=
 =?us-ascii?Q?Vja9nq92o3zRxhiZtFIK30x2b8UcEmQyUEQnwQ0HJI7K/zzaarS5LFjSTNrj?=
 =?us-ascii?Q?kP/ppUZLmZBmixwFMQEdIO16Srnj6SUIsC0S0V7jPSMAE0opReNKvxOQbDSu?=
 =?us-ascii?Q?Is6kz/XPs7KOt/g25Rpde7MQN0uo0Mo5fwk6t2llOkI3hxGltdmeXZCNBbwF?=
 =?us-ascii?Q?1L0vDUslAPYo4SHDtGgmScKW4tgnGisEuwfdcSjnU6MgVRniZ2zuw0e3V8l9?=
 =?us-ascii?Q?R/lmzZB4bCAQBH9m/nKQu1Diql4Wqk0AUS9hX9bwLUKdRKx65Y/BbRaRu0WW?=
 =?us-ascii?Q?Jp1dgvMyemGTEWY4j6sL6DrUH7BaspL8dbs8HzAgTd/gaEovm7zt9AYj5D5k?=
 =?us-ascii?Q?5eTwREiU7cEVPqxYqQmG8Qn8FcysSr36?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7S4ddXWITxGnY6d7rpAATOjMBQs7yKpRKc+/2dASFrptblRewrlA+D3b/XJp?=
 =?us-ascii?Q?ujLYPnsSQHDLXyIzBuRBDK/2sILJMdtqTiCRGFUtk4GlRuR2d2kUAAye35Pe?=
 =?us-ascii?Q?HjhRWRSrHw3R3zDznnGIUwvALc3JDGMgOVEOsHvZUiwte5FvBR+8nJtq2FSE?=
 =?us-ascii?Q?NYEJt4bLZlBxUxvA0Iv+WfQ7QevIafuUUMVR8mOowNm7N2iGmyJwQ7Qpww5/?=
 =?us-ascii?Q?1ItyYUyZd4QwJ96Hj14Q1LomsbS/natUDiuLn2T4jPuXgKPoaXm+Q6xv18gs?=
 =?us-ascii?Q?mwb5+yqX5caJs+OSYbIIHbooF+ZzM9HIAPpFaiX2F+Z+KbW8vJZiU4vh1QEl?=
 =?us-ascii?Q?T2FLRlB44xQF72AqEswDZ8dXSEMPGDkiWr2B4LMH61v2dEoWsP09qC0bdatA?=
 =?us-ascii?Q?J50WXrDLIoszVKsrnIPzVK6/ZAbv95BrhC0llBxXxtUcavDg2DJ4b8J7Hnas?=
 =?us-ascii?Q?5cVS8Vqnr0SMdkA2uhXcGdCgPopWvNLTajHWWRjVfO5LcdE4i7wNsbYovQtg?=
 =?us-ascii?Q?BGlkvLOLlJOfpUp5BCosGOi4MH0p+xJXukT67OjET7ULsSoPMz4IVNGZYsYK?=
 =?us-ascii?Q?HxH5ilO6jAfGsVc+8Ryl2joGHkCWzMwVYGt+R1Cq2ZP3q5MgFrtZ6dacJw3+?=
 =?us-ascii?Q?aA2LKG7KU9pmdUjDBkH0bri5Hv9fkzpfzZtWy0V3U7s1bldrRIXZ/oxVkAFM?=
 =?us-ascii?Q?398eI9kRpnT+/T3nepbtLENkmw88btvQYyn4RMdtNYtERWexX8jU/Uu1ZM5g?=
 =?us-ascii?Q?/hd4IFiUKBffxpZk6sZfkX12BIWqZvZmyk1/B9dmdaGcfiWRDNJ65a5AWhXJ?=
 =?us-ascii?Q?QMHHa/PzsUFTl6Q4YAlS9tf8uFnGkBEmypimxDTJ22OvhrBmsAoqZV85sr7g?=
 =?us-ascii?Q?DLQF8JpGOt3ExPpLh/YAkP6KQlCIO1ZYcmNvfy8LopEPj9HetuSovVgUIz9d?=
 =?us-ascii?Q?JiUHgeU7zzsRNneefgx5WnLMulZgyno6pjrs+zXCobGkoWCcXuGylWHmcpbP?=
 =?us-ascii?Q?6WT2NqM9MTNns6syfxFlNu5I+P95N2qJpVHgO7bOMdYZJ35d95GJAh+P2447?=
 =?us-ascii?Q?HQ7/buXSujJBCHSdvk1ZypQOeruR0viR21vMOjPCBcAbl62rP8Y5OvmFI310?=
 =?us-ascii?Q?dD/MLAlKY2tb/C8Hh0BkjFLc9K9ACBvCXG58rKdApu0fXzS7BKiVM17WhAtw?=
 =?us-ascii?Q?G23SD9AUMZZIriOtwlFtPpAP7Dn3D/R9jO4TNORS+G8Z1AwPDUdVOWhIqb6X?=
 =?us-ascii?Q?Cup3mYO4mVf3P51yapbHSr455qsKPOiNWlM7hRocNt1e6p5yuKoi1cRi+rC1?=
 =?us-ascii?Q?cRqfta9SRTspg7yQ7DTb5R96rQgwqS83H3mQktEuZ+BJJQg4aGyoPKz/6rtE?=
 =?us-ascii?Q?kxAtK/WTIk7H/h2UwCdfTtfpm4VoTcwylp565pUfKx1q1vcAaRse8XzFD5pl?=
 =?us-ascii?Q?7fL7uzFg9MQBMYlrwBOqX1Wd0ezYwbjCCPOy9HYXWblqpzBEhPdvxROrVies?=
 =?us-ascii?Q?DSHNtvOsqTvK+8j+Fudyc4YP6q/yeNhFcauF0UDlRY0tco3QTGjVrfJcpyK4?=
 =?us-ascii?Q?l1cjsyk6cugDVIsGunI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c365853a-2c47-4575-7f36-08dd3e969379
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 05:50:59.6197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZvOaOox/Na+RyyyBK+X+xQmwUMpXzPGMPIxJIrlDtNCR7IrHsqHbjyBxGk41qJDDW3/N41BSKfkEgjmUkwJkZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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


Hi Karthik,=20

I have addressed couple of comments you had given me regarding sorting can =
mode selection.=20
But for validation method apart from commit failure I was trying to find al=
ternate methods but couldn't find any lead, I have couple of opens. 1. Is t=
here any debugfs entry where we get to know joiner is enabled or not. 2. Is=
 it possible to get pipe active status after modeset/commit. Based on this =
we can validate.=20

Thanks=20
Jeevan B=20

