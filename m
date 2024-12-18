Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690D4E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DFB10E012;
	Wed, 18 Dec 2024 14:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8hschGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94A10E012
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734531530; x=1766067530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=I1i/gt4mRZsheE+MYYjVa28Q7d4M/X8+GlXdGAxLRIc=;
 b=j8hschGnRY2ps9jb471/XXJeOWiEM8QloXjGHfO5LqeBiSQYCqLHcb7W
 5a5cngAW4NkXIwig13cNK0EVgL8C2DjNPcTkk2Ghjexkkp9wD0Rtmo6BA
 Nncp9HoensnQS9aoyyHvtM8Z25WvIKtSVaDySOS2D0iQVyx4d9Y208qtB
 SxC8vvTjnSnE1/lp3dTQAdo9FLjnGlBnQFHQSPaaIZx1J2g6fxp6F50Is
 Uc2oZCrPjFvlIsartPyscDLPkLm85u7twsqcCwrZF5yiIyjoPIVhBAJR1
 SlpQhKxvfj0b3GBcR1PzwUVC4mnvph7ydsBxxmJVCvsONARJMXIUClGLm w==;
X-CSE-ConnectionGUID: 5BQZZXWsT1eokPOGECWxew==
X-CSE-MsgGUID: f3pkKQRvSRKw5zcsBICbxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60394445"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208,217";a="60394445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:18:49 -0800
X-CSE-ConnectionGUID: IrVkJhJPR6yCqY0SY15WGg==
X-CSE-MsgGUID: xwsUjJwHScmwfIBcZ7R35g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
 d="scan'208,217";a="102727700"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 06:18:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 06:18:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 06:18:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 06:18:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz8UF/vuVpB0P382u0xaPavpAEB+tp1oQmWRho4cj540bdvjbVm0Nxs/MDS9k/ZBLhLqeaSbUlF7yVFHTUqJMlmZNKWYmSaPS/9cW4JZWE0Czj41Tr/xeASdBcG8aqq8QS9r7p2KFJsTSwefeNpLk45+Wh6EVsM2V3QqwmcG4js0ixhUbfXU7Bfk7XjkaZE26Qmj/WMPsw8JOjZWMLxX5FF6BWaubP0S1nFuT0pvd2NjfHT/kdv7/77fhjSCrz2lu64kKkilsyRLuinGn5P2avI0fmUx71qmolRjFQuK3h/0hV3D21b9jvT1qK8BZpQi8s3hxDrPdG6IhJEtONlRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzWxxSoLu2JmsUKy7wOkR2pk0mbB7Rvt8vm6p5Ug6Kk=;
 b=laIyBwssqs1UIP733R6WBeoYeE9VvRdpmsIflDndOa0IE2h/CKHzzwiDQaoDq5jdZTomhM75qSDprfLDa6+r7EGXMeMYrHNupTtJ9PPVypJshUS4jq/+Mo08NZTl3dm/Y+h6Jkx8j0IPrW5Xu6EF3/JYyNGd7s6VXbCiHz5sfnL3ANnaLAMeEIjIUf/3CrKhY2vDkSWFakm9H78tgTxzz+UdgEiAwE43vitOcwQMUKzcW4trEc61J6z9SIYpmCaqDpbJ8/CwczeusnrRwuda1x9ePuBMzzi9KCLbuLLfQEsgN0vKbSPTyPnS053S65pRc7hRmFXq3mHi8qemKKFRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:18:42 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 14:18:41 +0000
Content-Type: multipart/alternative;
 boundary="------------pyK7WGBkNjvdvohkQXWK0oA0"
Message-ID: <6118f586-86cc-44e8-92d4-40f2a5b0b20b@intel.com>
Date: Wed, 18 Dec 2024 15:18:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/xe/xe_sriov_debugfs: Add debugfs get/set
 functions for u32, u64, bool
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241218120056.779962-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZRAP278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::21) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8647a818-e2fb-4c15-9301-08dd1f6edea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlBRYWZSV2ZWdDlrTDhrSWJZV3RUM2tETm9JS0FJbGxlbHdDeEkxWUZIUkVO?=
 =?utf-8?B?SlhDODhOcFJaaU5nS0RXVFpOeVljRWZiMm40QmZoK2tMMFJWKzhSN1FQSlJM?=
 =?utf-8?B?WmkzNUpxS3REMnc1TFROczVlMkVwNTZlZldMNDYvbUIyeGNlN0ZTV3h1aGJk?=
 =?utf-8?B?YnVsTi9EWm1FWmlEeEN0Qk9iWG8reDE1RGpUUDRmd3N0YmhDdTVEUmF6RStN?=
 =?utf-8?B?ZVNxb0tPa1lsWGVMVHFmWGV2OXJZZWppMlZzVjl6RHhKWkR6T3dVVVNYckQy?=
 =?utf-8?B?S3A1U2JKVlUxMHU1RVQyYTFwN2R5MHl2MkVkZDNySVVWRERvY0lkOU5zVlR2?=
 =?utf-8?B?OUM0eGdrdHJaazh1VFBxM0VDQlNFOGk5c3VWN25xN1hoVXJFZzZNRUxBQkN0?=
 =?utf-8?B?MkFyY0VBUEJic2xtOXpKUzhaWU1ocG9UZlo2Rk95enNEYUZqdzR4UFpVQU5w?=
 =?utf-8?B?MEhyTjh0TEoySDg2OHhHajJBWGRlY2ZGaWYxbkFZckc3ejVwdS9iSXF1aHBT?=
 =?utf-8?B?Sm14SEFmOFRsVENhcDlvcEFjN1Y4NUpSZXQrL1I2NS9VbUU3Y3h5S0xqc0cv?=
 =?utf-8?B?K3NZaWdxQ0VHUDR4MFZpRHAvcmRqeXpKYTB3c2U1akM4R0taYm9jMDZpZ0dt?=
 =?utf-8?B?RkJxejFlb0xJOWp0c0FjZ3VaT2VlTTRhc1hldWVXNXdiVUZnT3lOMjNESkpv?=
 =?utf-8?B?a2t1MjJ3QTBqc1EvcEc0S1ZMVVBuZStkUVhMZzRlRGFRQVM5eGRZbFV1RmU0?=
 =?utf-8?B?UjJ0dkZ4YjhXdy8rd3FTelJld251eWlTY09HNlZnTVNEUnFOVHZ2UTA5UUpU?=
 =?utf-8?B?SmNOQWFuL25kMWFFZDBXclFMN0JobnJmMU41eTZHUWZOU3BKamVEVlU5ejJT?=
 =?utf-8?B?SWlaN3d1QThTNEdiOXhuemxHdmZTRWYxQS9jME1vSTZTMllPeEtYbkpYdDR0?=
 =?utf-8?B?RERCb0pWMi84Zk13MzRRUlNxRFE1WmczeVFvN0wyNjh3blNLUldiVDdNYi9z?=
 =?utf-8?B?cnl5cjhzRmVTR1NjaU5LZnYyM1dYR20zb0RCejY4TnBSV3NObUc0d3pJZnNk?=
 =?utf-8?B?K3F4cVNBTm9ZMExDdjlaUVNSb0RHdGp5RXhXY3g0SER3ejlKcTRiOXBDZUNV?=
 =?utf-8?B?RmEyT2hweUNENlJzNXJVa004K1RRMG1OenhLWHpISSt4QkVMeGFLcE5PL2ZJ?=
 =?utf-8?B?YUtFWHZqTzhORDMxa2htY2p0Zno3VzZPTHNEdjVTMmprdVFLMUNyUzVoRU1y?=
 =?utf-8?B?c0xvb2xmTXJPd29GLzNPTUNvR2NRb0NrUnBZK0hpaVBXY2E4UHhUYk8wNHJZ?=
 =?utf-8?B?VklDZVlHQkxJWHVZWElOVEQ4akdCYm8xRnhyQWxpQ0ZESzlVQkhGcm1FbDBp?=
 =?utf-8?B?WlNXY0U3aWNFbjRoUk91UDY5Q3FmcG1jamhWeklJVmVxOEJSQXBPL0Z2NUpP?=
 =?utf-8?B?UWFPaVVsdXVwRWQzM1F5VmFlZTZ3NVppOWZqV0FVKy96dG93eUFsNjdFejVC?=
 =?utf-8?B?dnhMWGRpNUxXTytSL2tWVzVYeUwvRkcwYmlKNkFMa2swK1NMVFNGWlppYVVq?=
 =?utf-8?B?c25GMTlOTVJOYTJpV1J4TCtreWN4VUgzSGswTmx0SmlydUVLelp0TkZLZ1pB?=
 =?utf-8?B?WXpFRktnVGFjd1EzekVTWlQyTVYxeFBnMm9sdVovZ1lkRWtDbG9QWERhYnU3?=
 =?utf-8?B?SWVTUnl3S2p6YjJqK0lvYnV1VlIwTkJGNXEvc282SVExcHhMNDdnTTJQY2ti?=
 =?utf-8?B?emM1ampQclg5Ritkalg3SnBUaHJnQXpvQldWSFJBUjVJclhJM2pYOFI2MjZF?=
 =?utf-8?B?cnl4TkdwaWlZOGlFYXVSOUh0K1YzLzVyZXJBdmVyUEcxcU5YZEVpZEppaGxZ?=
 =?utf-8?Q?hoej4SchjPA47?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVBsZTNQaFcrUVpFSFd6am95M2QzdUR5eDUxWDltNHVNdkJUT0l0VkMrRjd1?=
 =?utf-8?B?ZlRicGVPb25XeUpTcEZXZ1ZXaUU1SWNzRENaWW13WStEM0VxaWJNRCtuczdW?=
 =?utf-8?B?cWlHRVZQd0xvU1dydW9aRElrZWNkS1BLdmpMUzdoMS93dDBmaXEra1BvT3NJ?=
 =?utf-8?B?VzhPNitSSEZBWjB3MTE4RTlEWW9SSmdyUHYzZVdvN3hBV25VR1lnVGp3cUdU?=
 =?utf-8?B?cU1UWFhZMzAwb2N1WklNQlpwNE5tY25KdlpZMVFwWkUvWDkweXNyMVFPc3pS?=
 =?utf-8?B?MHIvZ2ZJaHBGMUtIdElkM29NL2N5a25xb1ZGY0t1ZVplN0dxeUNybDYxYnVZ?=
 =?utf-8?B?a1J6QmRzTGVZSmhUMzVJR1hIaGVoZ2hpMFFpckptYS8ybDRjUnpqWGRsNzZR?=
 =?utf-8?B?bUliaU5heFRXRzFrK2wvV05uNDg4YzBlQkY2L0lsdGlIdHQ4MDQvd21vTnZ3?=
 =?utf-8?B?NEVsd3U4akpQU2pVczdBRlpSN0dCaU5kQ0ZBRGl0b3BhZWptdFEreDEydFhn?=
 =?utf-8?B?N1NhZkFVWUpKbnpabzl0UUJOb1Ayakkvd1hJMGpZR1c0RjFkWTcrb0xMeXJh?=
 =?utf-8?B?bWkvL0hqazVzT052NDRFWFM5K0dKT2U4OXdXS2lCcWxNeHJVc05KdVAvbDIy?=
 =?utf-8?B?Z1lPUlovNUxuL05oYUNjcHo5V1dTaEUyOXlnV3Q1aU42U3ZrTkpDb2t3K3NB?=
 =?utf-8?B?R2ZMZjA0RGVic0MwTGdqdzFlZHI1UVF2QndjTlh6NGY4dEdoUGRoMnpFWEhm?=
 =?utf-8?B?SkNxTHNTVnpsTVJicFgwMFBXT0VWN1pSWmNQT1lTSzk2WFpEUmQ2NEIvbWxD?=
 =?utf-8?B?cjl0ei9CaTZscmtxSGxzdWwwaVlYcit5NHRKekFxOXN6dkhtOGxtazU1THFk?=
 =?utf-8?B?bkR1YUpUSWhHOWxjNFpwMC9ZaUN0cnlpNzhoMWNzenBCU1loRWZFcFJWWlEx?=
 =?utf-8?B?VXFpelVqY1dTWnhLNlFFZGZSWHA5MlJsdURjcU5TV20rVUx5NE8wYTFLS21t?=
 =?utf-8?B?YUdrdTRoeXBMbFNrQStoMGNnVkNWaDhlMzMxVDRhQ1FRdVZteDNhUkgyWjlB?=
 =?utf-8?B?WnA1aWRYWHdwTjVXcXUrSks5dDcraSttV2pPQXMzeE9LSnZQM2lCRC9ERVdm?=
 =?utf-8?B?NTY4TjhLNUlUSnNGbFVGNWJZWTlPbkNyUGpvTGZaY1hHYWJZaEtaRTBIaERj?=
 =?utf-8?B?ZXJXVVpnRkl2UDZRTnAyYm9kc2pMeE5EK1J4N0wvZWkwMi9JU2ZjSWp1MnZw?=
 =?utf-8?B?TWVid2ZwZ21SNW42aWRBVm5KcVZhekoxeVJ3VXlyYmVLY3B5VCsxMk9Gc3dn?=
 =?utf-8?B?RWNmblVNUlBzUEdhNG1NbW40TmM2cU8wanVuSWhPMlJzUlZNL2phcEg5T1hi?=
 =?utf-8?B?ZFNZZlExVWp5dm92a2c2RjB2VEVidURaR0pEaW1pSlBndVlKWkhVeHpuby9I?=
 =?utf-8?B?a1ZOcVJVZTlSejNWaTA1ck94YVdnRVlxSENiNDQwZ3QwaFZudENwZGRWZHpG?=
 =?utf-8?B?SFprb0MrcENVMnZDZTB0TlE5ekE0Qm9rZC81Smt4U2pveGpHd0JxVDZraTM2?=
 =?utf-8?B?MlljRnQ4eGx1N3BxWGVDY0hSbjFLb2dJR3BLSVZqWTNqODNETVJuMkNUekRM?=
 =?utf-8?B?MFFucmtBZ0VwUnVqc2J3S2RUZzcrNDFkNGZKTy9mSUUrcWl4NXhGbVBFdE8y?=
 =?utf-8?B?VXEzbEVzRFFhenorR3N0ZW5PdzhDeSs0WDBiOXppeEliVDhaT3hVWE9iTGtq?=
 =?utf-8?B?TU1SL24zRXJWcWJoei8yZ1d3Mms0bDVjNU9qY2JYRWdqS1RVVU0zdWtnRGRR?=
 =?utf-8?B?SjI0QVBSM28xQW12RUYwb3RETEo2SkFMR2Z1TUNKSHAwSVo0UVR2NEtvcnRp?=
 =?utf-8?B?dDcwcVFtUFdPN1RFRXpUWW0xMFlqTU83Ung0VHo1UG9iVzQ0aEVvWjEwSjdp?=
 =?utf-8?B?Q0V3dFYxL05EaHEyM1MrNnZuekNkYlRjaGErc20wZjlEbUM2TFBPRjQ3UHJI?=
 =?utf-8?B?Y1B4c254QWFlQ1NkZHRrMEdCMWp1VkpBOGZGTVkvYVhXakR6RytiQ0FSc0gx?=
 =?utf-8?B?MmoyZGhPUm9zMGZuZk5GZ3RoYm42OE9pdEMzK21kU05COHN0aFdwM0tBUjVS?=
 =?utf-8?B?eE1YWFhSS3ZwS0JBdTFIYVB2dHNXSG4weldoaTNHUlBwRTNRTnRualRPdGhE?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8647a818-e2fb-4c15-9301-08dd1f6edea8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:18:41.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq5PrNCgw5DPcwlWz5nBM+L5JmPYCycJafxmohMiGPqGSVR29UfhaI3LchN3zTYX7GF0PaINHYzsFakjWCUgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

--------------pyK7WGBkNjvdvohkQXWK0oA0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/2024 13:00, Marcin Bernatowicz wrote:
> Add helper functions to get and set SR-IOV debugfs attributes for u32,
> u64, and boolean types.
>
> Functions added:
> - __xe_sriov_pf_debugfs_get_u32
> - __xe_sriov_pf_debugfs_set_u32
> - __xe_sriov_pf_debugfs_get_u64
> - __xe_sriov_pf_debugfs_set_u64
> - __xe_sriov_pf_debugfs_get_boolean
> - __xe_sriov_pf_debugfs_set_boolean
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_debugfs.h |  18 +++++
>   2 files changed, 169 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index c87f91492..121dabe73 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -9,6 +9,7 @@
>   #include "drmtest.h"
>   #include "igt_debugfs.h"
>   #include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
> @@ -204,3 +205,153 @@ cleanup:
>   
>   	return ret;
>   }
> +
> +static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
> +					 unsigned int gt_num)
> +{
> +	char path[PATH_MAX];
> +
> +	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
> +						     sizeof(path)),
> +			   "path: %s\n", path))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
> +/**
> + * DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC - Define a function for accessing debugfs attributes
> + * @type: Data type of the value to read or write (e.g., `uint32_t`, `bool`, etc.)
> + * @suffix: Function suffix, appended to `__xe_sriov_pf_debugfs_` to name the function

nit: maybe "Function name suffix appended to `__xe_sriov_pf_debugfs_`" ?

> + * @sysfs_func: The sysfs helper function to perform the actual read or write operation
> + *
> + * Generates a function for accessing a debugfs attribute of a PF device.
> + * It handles opening the debugfs path, performing the sysfs operation, and closing the
> + * debugfs directory.
> + *
> + * The generated function has the following signature:
> + *
> + *	int __xe_sriov_pf_debugfs_<suffix>(int pf, unsigned int vf_num,
> + *					   unsigned int gt_num,
> + *					   const char *attr, type value)
> + *
> + * where:
> + * - `pf` is the PF device file descriptor.
> + * - `vf_num` is the VF number.
> + * - `gt_num` is the GT number.
> + * - `attr` is the name of the debugfs attribute.
> + * - `value` is the data to read or write, depending on the sysfs function.
> + *
> + * Example:
> + *
> + *	DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32);
> + *
> + * This expands to a function:
> + *
> + *	int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
> + *					  unsigned int gt_num,
> + *					  const char *attr, uint32_t value);
> + *
> + * The function returns:
> + * - `0` on success
> + * - Negative error code on failure
> + */
> +#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)		\
> +	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,		\
> +					   unsigned int gt_num,			\
> +					   const char *attr, type value)	\
> +	{									\
> +		bool ret;							\
> +		int dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);	\
> +										\
> +		if (igt_debug_on(dir < 0))					\
> +			return dir;						\
> +										\
> +		ret = sysfs_func(dir, attr, value);				\
> +		close(dir);							\
> +		return ret ? 0 : -1;						\
> +	}
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_u32 - Get a 32-bit unsigned integer from debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to read
> + * @value: Pointer to store the retrieved value
> + *
> + * Reads a 32-bit unsigned integer from the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t *, get_u32, __igt_sysfs_get_u32)
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_u32 - Set a 32-bit unsigned integer in debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to write to
> + * @value: The value to set
> + *
> + * Writes a 32-bit unsigned integer to the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32)
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_u64 - Get a 64-bit unsigned integer from debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to read
> + * @value: Pointer to store the retrieved value
> + *
> + * Reads a 64-bit unsigned integer from the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t *, get_u64, __igt_sysfs_get_u64)
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_u64 - Set a 64-bit unsigned integer in debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to write to
> + * @value: The value to set
> + *
> + * Writes a 64-bit unsigned integer to the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t, set_u64, __igt_sysfs_set_u64)
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_boolean - Get a boolean value from debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to read
> + * @value: Pointer to store the retrieved value
> + *
> + * Reads a boolean value from the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, get_boolean, __igt_sysfs_get_boolean)
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_boolean - Set a boolean value in debugfs
> + * @pf: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @attr: Debugfs attribute to write to
> + * @value: The value to set
> + *
> + * Writes a boolean value to the specified debugfs attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, __igt_sysfs_set_boolean)
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index 856445e76..2db965f9b 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -16,5 +16,23 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
>   						unsigned int gt_id,
>   						struct xe_sriov_provisioned_range **ranges,
>   						unsigned int *nr_ranges);
> +int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t *value);
> +int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t value);
> +int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t *value);
> +int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t value);
> +int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool *value);
> +int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool value);
>   
>   #endif /* __XE_SRIOV_DEBUGFS_H__ */

One small nit, but overall looks good:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
--------------pyK7WGBkNjvdvohkQXWK0oA0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/18/2024 13:00, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241218120056.779962-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Add helper functions to get and set SR-IOV debugfs attributes for u32,
u64, and boolean types.

Functions added:
- __xe_sriov_pf_debugfs_get_u32
- __xe_sriov_pf_debugfs_set_u32
- __xe_sriov_pf_debugfs_get_u64
- __xe_sriov_pf_debugfs_set_u64
- __xe_sriov_pf_debugfs_get_boolean
- __xe_sriov_pf_debugfs_set_boolean

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  18 +++++
 2 files changed, 169 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index c87f91492..121dabe73 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -9,6 +9,7 @@
 #include &quot;drmtest.h&quot;
 #include &quot;igt_debugfs.h&quot;
 #include &quot;igt_sriov_device.h&quot;
+#include &quot;igt_sysfs.h&quot;
 #include &quot;xe/xe_query.h&quot;
 #include &quot;xe/xe_sriov_debugfs.h&quot;
 #include &quot;xe/xe_sriov_provisioning.h&quot;
@@ -204,3 +205,153 @@ cleanup:
 
 	return ret;
 }
+
+static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	char path[PATH_MAX];
+
+	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
+						     sizeof(path)),
+			   &quot;path: %s\n&quot;, path))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
+/**
+ * DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC - Define a function for accessing debugfs attributes
+ * @type: Data type of the value to read or write (e.g., `uint32_t`, `bool`, etc.)
+ * @suffix: Function suffix, appended to `__xe_sriov_pf_debugfs_` to name the function</pre>
    </blockquote>
    <br>
    nit: maybe &quot;Function name suffix appended to
    `__xe_sriov_pf_debugfs_`&quot; ?<br>
    <br>
    <blockquote type="cite" cite="mid:20241218120056.779962-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+ * @sysfs_func: The sysfs helper function to perform the actual read or write operation
+ *
+ * Generates a function for accessing a debugfs attribute of a PF device.
+ * It handles opening the debugfs path, performing the sysfs operation, and closing the
+ * debugfs directory.
+ *
+ * The generated function has the following signature:
+ *
+ *	int __xe_sriov_pf_debugfs_&lt;suffix&gt;(int pf, unsigned int vf_num,
+ *					   unsigned int gt_num,
+ *					   const char *attr, type value)
+ *
+ * where:
+ * - `pf` is the PF device file descriptor.
+ * - `vf_num` is the VF number.
+ * - `gt_num` is the GT number.
+ * - `attr` is the name of the debugfs attribute.
+ * - `value` is the data to read or write, depending on the sysfs function.
+ *
+ * Example:
+ *
+ *	DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32);
+ *
+ * This expands to a function:
+ *
+ *	int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
+ *					  unsigned int gt_num,
+ *					  const char *attr, uint32_t value);
+ *
+ * The function returns:
+ * - `0` on success
+ * - Negative error code on failure
+ */
+#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)		\
+	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,		\
+					   unsigned int gt_num,			\
+					   const char *attr, type value)	\
+	{									\
+		bool ret;							\
+		int dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);	\
+										\
+		if (igt_debug_on(dir &lt; 0))					\
+			return dir;						\
+										\
+		ret = sysfs_func(dir, attr, value);				\
+		close(dir);							\
+		return ret ? 0 : -1;						\
+	}
+
+/**
+ * __xe_sriov_pf_debugfs_get_u32 - Get a 32-bit unsigned integer from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a 32-bit unsigned integer from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t *, get_u32, __igt_sysfs_get_u32)
+
+/**
+ * __xe_sriov_pf_debugfs_set_u32 - Set a 32-bit unsigned integer in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a 32-bit unsigned integer to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32)
+
+/**
+ * __xe_sriov_pf_debugfs_get_u64 - Get a 64-bit unsigned integer from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a 64-bit unsigned integer from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t *, get_u64, __igt_sysfs_get_u64)
+
+/**
+ * __xe_sriov_pf_debugfs_set_u64 - Set a 64-bit unsigned integer in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a 64-bit unsigned integer to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t, set_u64, __igt_sysfs_set_u64)
+
+/**
+ * __xe_sriov_pf_debugfs_get_boolean - Get a boolean value from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a boolean value from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, get_boolean, __igt_sysfs_get_boolean)
+
+/**
+ * __xe_sriov_pf_debugfs_set_boolean - Set a boolean value in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a boolean value to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, __igt_sysfs_set_boolean)
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 856445e76..2db965f9b 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -16,5 +16,23 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
 						unsigned int gt_id,
 						struct xe_sriov_provisioned_range **ranges,
 						unsigned int *nr_ranges);
+int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t *value);
+int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t value);
+int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t *value);
+int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t value);
+int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool *value);
+int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool value);
 
 #endif /* __XE_SRIOV_DEBUGFS_H__ */</pre>
    </blockquote>
    <br>
    One small nit, but overall looks good:<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <span style="white-space: pre-wrap">

</span>
  </body>
</html>

--------------pyK7WGBkNjvdvohkQXWK0oA0--
