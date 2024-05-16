Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D9DC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 12:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98AD10ECA4;
	Thu, 16 May 2024 12:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uft31zmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB3310ECA4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715862008; x=1747398008;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=caSOYSHqigGaUSXWURIzQ1fSOmefMHJpZoBRtep/mUQ=;
 b=Uft31zmbBI347v94SvnLCDggRjVR6dMXZ0GzjxfODSMun4Qfdodzn5Gv
 hA0Wj/qa4ulN0AUBGNLK22zXob7GRU3aC4zFuYQ6lClfn6uJYv+L7qDRM
 pykQzSmc5EW0lKURewBMnTfDONECDkXNXkfUrQLUoxzGXq7U/ZInSzZqw
 yQt2hEY7aPKGaAI4S9kbxIEykKjFUSZA1IzEuqUnYS6RGcRHwJTJEgqfQ
 CXb0uBNelkYYgEuDHph+6jrkNPQmcUkg7TY1zN+9EovRAVom001yua0Zg
 jKMOXRfcVv7/7vE6yCcCQAdBtAnizouv+uSL64zYsZQ/zgWSWBOzPkcxQ A==;
X-CSE-ConnectionGUID: HiK4oDE7SoeOr0VAYpWCVg==
X-CSE-MsgGUID: DY4u4vuLTWmcxOrh48Lazg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23372537"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23372537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 05:20:07 -0700
X-CSE-ConnectionGUID: J1GUXPEwQaiG86b0yE8ngw==
X-CSE-MsgGUID: Yj3p+fAmSqumudtYoMhtVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31406241"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 05:20:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 05:20:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 05:20:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 05:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqOaGRCr+TvLJoqsVSJgVFzEoTmXWKKETgHvvQDrxOluxKYo+HRRhswuvvvZRi/2IxGptI0ho+XKPf/dcP/7gBVOmv39xQPIYHox0YKzS0YIT9Q2W5DEw9V4bOoAs6tucVE80mhmCbPeyeHAGyp/cUQzQv58BSV0rDp042l0blyVf6d2NkwKmMUN4OVKofLxNMeGTNvlBZ1f5kRO6Q9bXZZQRN3IILD3vAsvXWesqJff8ddqIkBCkYEcaFj8ca1+t9Ne6eq3tsE6SKCc6juxFA3/lhr8h/YPlaZensIGnROGo1W+sB8Grxk53S7aYzhItPzg2W16azWuIjhCRF+I0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caSOYSHqigGaUSXWURIzQ1fSOmefMHJpZoBRtep/mUQ=;
 b=WnatHA+qDirgNsMMs4m45cfnLeDlO8xaJswKsCZY0R9BBejneCrqaREmkgXmt9EvhgdoHUbiwM5YVNI4+n+lsH3+fLTJmMOd3PIALNuv0cj/5oEPjTz58ukDY2PIdDWkL+dstGRWfGqt0U0ojlnsJhMARRYzbfGcPiTKr7efMqMMv9hbIqDuYqRJIdAHWZsUq42UOWHMisaerTYaPsQOIe8Rj127zvo02mdsCTvaq9TZHmJCG7TirpuiuaZO9Ozoy4f4XHJOA/o77YAz+5JX4ooyI2W1maFGsRTD1yVK7CVpVo8rtY0EFaGz9RtXnwi3WDT44R0VCA0/QFkvqr7Xlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 12:19:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 12:19:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240516104058.llfw2vgdtn3txnpo@kamilkon-DESK.igk.intel.com>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
 <171579455569.27300.4520939210308457020@gjsousa-mobl2>
 <20240516104058.llfw2vgdtn3txnpo@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 16 May 2024 09:19:26 -0300
Message-ID: <171586196699.2995.10601085751736261998@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: ea336e86-d55d-4e1e-ea1a-08dc75a275d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Skh2cHM0Z2VWeXBVeUk3K1VLRjMrbWRaQkRIQXFKaWdCUW1rM1ZuN2FWcitY?=
 =?utf-8?B?KzVZMmJrblpDSGxieFc3UnJ3WHAwVUhCMWxacjg3eXVXV21wZzdKQk9NUUZQ?=
 =?utf-8?B?czZWQ0RrcTBOeUdOSko1UUVMWFNab0p3RSsxa0hvSVpBSVRudURRU2V6OFAy?=
 =?utf-8?B?dlVoYXliMUp4ZE9jbFU4Qnh3clB3eTlVKy9SeC9mb1l6a0hrUVlQMWE5cjA2?=
 =?utf-8?B?eVBUTVkvQytLN2E3bkVURHdoL1dsQTVBQm9MK1pOcm1UTU5HVlBabzhOSzd1?=
 =?utf-8?B?MU82cHJNeDZ1bmhmdC81MEd0OVBCdTZ2dlh3c3JiQ00vUm1zOCtrSHMwdEdF?=
 =?utf-8?B?T2NJNVNJOERxRTVreW9Kc3BsMlZ2SUtmRkM3MUUxZnFtWnRZOHh5QXNPYUxK?=
 =?utf-8?B?ZU5aTzVMMjZvbTJhMXZvQnFnbnNteldOd3NlR3ZEV2lBbG8rK1dFcW5ZU3pm?=
 =?utf-8?B?QnJSc0RXVUVuTVNKRXRCKzJWWHRhM0ozTks0Q2NJeVVsTWlIMUVXc3pjS0kr?=
 =?utf-8?B?VUs4TWFDOWhLY24rOThKdFdLS3laSUlRT0VKbSs4UWNXQWptOFVqODdPTmRN?=
 =?utf-8?B?VTBoY0hRZUNlUVY3ZituS2V6RTBnS3lJL3dkL1VteThpU2UvQTNzYXFFbnh4?=
 =?utf-8?B?QzlCOGp4TUs3VWl2d3NSZlE3QXl3eEVRdWplL0swNTU0MktsV2lYRTdxUEtn?=
 =?utf-8?B?b3ZBVDU3Mm44NHE1T2JsM1BydmczT0lCcFZIL2x2VU5LWXZVY0RHL1RnZm9F?=
 =?utf-8?B?RDlRUEZMMllnaWQ4WkV3cjNIcFcxallqUy84NGRzQUI1K28zdE1pNTdzR2M3?=
 =?utf-8?B?bjFRZVkvZWxKakYxSThsRXJ4Wlh1Y0dQOHlKYURMOHYzSlVSMmVXOHlYbGhw?=
 =?utf-8?B?NDRKdHlGaW5CY203M1ZBTC9ubnd2aEpzTDFaS1N1MWRRNU9tVy9KaVAxR2Rx?=
 =?utf-8?B?SCtoWnYxR2RsMWUvbVg2cXZlVmlERVdKQXgwSmQ5YWh1ZS8xaGJYWkYyb0Nk?=
 =?utf-8?B?VURCMit5eUE1UDZBMDZGT3NyZnI1T0t6Nkx6bnBnTlJRWTFvL3h4a2VzQjM0?=
 =?utf-8?B?dEpPTjQwajByM1owbjlXd0huTHZBcDVoQVJOVUxxVGpnR0FvaHE1Z1RQcEwx?=
 =?utf-8?B?K1pTdTJ6YTRpa29vNnZ3OFpIWjI2a3BzbmNjUzUzSkxISlhaY0ZGQ3pCNktV?=
 =?utf-8?B?a2s2eXJOSXRrdUVDckJ4anJoNlNqdUdaVDZGNUdobzBWM052WFN5cDFDd2NL?=
 =?utf-8?B?amlaSENEVU1NODlXNlhnYWlwemZ2dGp3cGRBWFVubEZBTlV6SEtVZ2lwRU1Z?=
 =?utf-8?B?cDdDaG50ZStuWW1CeGhDQ1B4K0RVbVdxcU52OGRYdlNqZy84WlR0WHB6d0Y3?=
 =?utf-8?B?dnR4K0JpWFpQVW1zQ05Pd1U1Zk51MEplNU1hV2JpQlQ4K2RFRDNRMXZDV2lU?=
 =?utf-8?B?WTIzQWFacFQ5UEpaSzBBcWhsSkZiVnBFZUFnN01aQ1lwTEhtbnZWM2x5d2Y5?=
 =?utf-8?B?RGNHVHdXaTNITzZJTVF1aHp1N3pQOFBna1FsTVlmc0hjbkt2UzNya1ZGRXNa?=
 =?utf-8?B?eXZtTGlmenIwUXFHTnk0U0h0OFdGSStYNGZ5cUR1VXdKdkZoaFJRWmpHVjlx?=
 =?utf-8?Q?Ai3SLFtuxeRpr/afg09VTSkXKP0wmJrkrdjyAbYuRoh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05hbnh4Skh1eHI1cERVUmsrZ3RSVEs3UTVJRHYrTUhmeG9OQWh4ZXJLc3Iy?=
 =?utf-8?B?Z2tWMnhuc2FjdnNiNUxYK1M1cWN4M281TEJheDZURkg3RVVIUjI3UVR3WlZw?=
 =?utf-8?B?RSs2dytaZVZhLzUwR2V0b1VzVk9MMGo0dXRWQS9IZVdmY3AvUnBiUHA4UFJq?=
 =?utf-8?B?SnRpamplOHkrU2pPQVMyZ2RocDJjTmdEYXk1cm93akd1b1ZhOGtJcXVucUtB?=
 =?utf-8?B?T2FsTzRkRVkzNEkyNUdaaXdrZjdvSjJCV3kya3VNalF6M0IvYmtNRFEvTytx?=
 =?utf-8?B?ZzczbVhRY00xT0NjQktwbU8wcmFybXkwYVBUYnZpdlM1WWcvaEdub0d4ZzlP?=
 =?utf-8?B?VlpKRDFNcnFDRzhlNjJWanpaNDhqL0w2RlZ1NmtobmlMQklIWGIrZVdWZVFJ?=
 =?utf-8?B?c3JvVU9Sd2dTY0szVW8xWUhmMGpJWTFxUnRjRkozczBmUnFIcFdYS2ZCWDRt?=
 =?utf-8?B?OG53RWpFckxZT0RtbTFjY1NVc2pDR3Z0UmpzcHFpWmVwNGdUSkZCZnVEZUsy?=
 =?utf-8?B?UkROZC9ZcjYzWkgzWFJ4V05Od1JiaThnWTF5anhzSGdTdE1TalFWL25mdnRT?=
 =?utf-8?B?VEdCeVlHb3JXSUlXc3VzWXZQYm5XN0VrQXpZaEUydnNLYjVHYmNMME5iMlpP?=
 =?utf-8?B?eGZPdDNpVDVwTm9jQXpsQ21iSEtHeFRsOHlMSDdWN1dpbDZOaUVTcEFSaHdY?=
 =?utf-8?B?V2pHOG9ycHFZb1ZOVFJjelhrd0xEMVJ3S3BXVmZ2QWt1NU1xNVJyMGgzbXNj?=
 =?utf-8?B?dHpDYnptVzl1YWJXc05uaTMzS29FQ3U5TDF2NHRxemJxY1RnbXNLWStYaWor?=
 =?utf-8?B?S0xmV0RyODhtcWtsOVg0T2o3Umk5eHNEYkZPU3hGYVc5ZnN5Qm1vRXBielRh?=
 =?utf-8?B?eWdFU0MzbmtIWDVFOFZLNElaR2kvcUY2Q2tLMXVEZHhqS3RLYnJpdVM0cVJ0?=
 =?utf-8?B?MTF0Wkc3bGpjR29odHNoWXpGbUUwd2g2dEVIZThmTEVHaVNmSEVFbUZXY2gy?=
 =?utf-8?B?aUo5QnBqeFNHTndKUElvWWE3bXozWkhpNlVVV29xRHFTOUIvNzQwVldPT0N4?=
 =?utf-8?B?RFpUVUlYSzM1anJ2Ulc4TVJRaHpQbGxGUGZlNzAvZFZmckN6ZFdEQVQrbjE1?=
 =?utf-8?B?TU85LzQvRFdacjE5eDJyRVlndDV3b2c4bnNmcEkxOWMvRW9GN0VYOFFFQXl2?=
 =?utf-8?B?RWp0Zlh6U0UvMnpYOFd0cEpYTGJaNmhseUlJUmp3dVBEbWFEOHdRZVRYd2JU?=
 =?utf-8?B?ajY3RHIveTFmTTdheEtuVzI1Z3RWejRmVCtjK3lPR3lFUE9ha1lKd2FYNVNF?=
 =?utf-8?B?enRzZmswK0RlT3paNlRQT05PYlhtdmRDdGNpdGFSVDBWL2Z0WXZ4Tndqa1c3?=
 =?utf-8?B?YlAwcitzcXh4cUtBQXIxTGswbmFVMnpHZkZ5U1JJQ1ZKQy9WemR3T1hjckZq?=
 =?utf-8?B?Mys4dzhESTlxTGdCME9XUjBwaFVnMVpQOGxIbXhNNm9aSmxGQUptU1M4blh0?=
 =?utf-8?B?MjAvd0Fqb1ZTZ2pidkYxNEpoTTNveVo3dzhUU1FxNkw1SkMxL2JyaFNCdVpU?=
 =?utf-8?B?Qk9vY2Fyb09QbmhmWEVLUGxacEVrVWRIY0dab2V3eGYyQkV0dDZncU5rOUk2?=
 =?utf-8?B?OW0xWkErQmVybDIwZGorSFBFSFlkOWxKWlpnUEg4RzUrYmsva2Nnd0dMS1gv?=
 =?utf-8?B?UWZobk1oZzlIV3FDVCtLRjYzQ3NpTS9NVDA3cjhRZmR2RjhBTitJU2ZONkZ2?=
 =?utf-8?B?ZlF0ZjA4Zk85M1dsN00vVDNjR05HTWhhS0JTUlFlYllWR2ZSS1dTWHlSZ2hN?=
 =?utf-8?B?OGVRaHpoTzgyc00vU1pCMU0wdW8yazJmNVBGWW9HcnZLU2N4R05LUm9Nd0Iw?=
 =?utf-8?B?T3grM05jYWkwNWtMeEkwZE9zM2xpVHhIZkRzbE1SZWh3TnBuRGd0bnFSY2VI?=
 =?utf-8?B?V1RhWVlHYVhmSGRoQk9hV3c2aHFEU25tYnVlcHdQbVkrZGYyMStXU1BORzBO?=
 =?utf-8?B?eDZIVXBlaWVBRUEvQ0IxYUl1M0hZOElDTDJiZnRpdzlBVSsxSjBHUnVvUm0r?=
 =?utf-8?B?SXZsMlIwL3RZSXJSOVkvM241citLMDZ1TU1vZzBiUTMrbHlMRGpac1dFc1V4?=
 =?utf-8?B?ZUYrZHE4V2FBWWRFSGthak9QRnhqVERaSHRIc09FUWVUWVE4dkFWTUpBaHd0?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea336e86-d55d-4e1e-ea1a-08dc75a275d3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 12:19:40.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnhCfJewlu0QZPBDEzK2CpYIp4Bkseh7Vy7WGusMTEAs9WbkEPRHqHw3k/vhnN5b/Yy8z5Mbm20rznQjA6c8ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

Quoting Kamil Konieczny (2024-05-16 07:40:58-03:00)
>Hi Gustavo,
>On 2024-05-15 at 14:35:55 -0300, Gustavo Sousa wrote:
>> Quoting Kamil Konieczny (2024-05-15 14:10:55-03:00)
>> >Hi Gustavo,
>> >On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:
>> >> For development purposes, sometimes it is useful to have a way of
>> >> running custom scripts at certain points of test executions. A
>> >> real-world example I bumped into recently is to collect information f=
rom
>> >> sysfs before and after running each entry of a testlist.
>> >>=20
>> >> While it is possible for the user to handcraft a script that calls ea=
ch
>> >> test with the correct actions before and after execution, we can prov=
ide
>> >> a better experience by adding built-in support for running hooks duri=
ng
>> >> test execution.
>> >>=20
>> >> That would be even better when adding the same kind of support for
>> >> igt_runner (which is done in an upcoming change), since the user can
>> >> also nicely resume with igt_resume with the hook already setup in cas=
e a
>> >> crash happens during execution of the test list.
>> >>=20
>> >> As such provide implement support for hooks, integrate it into
>> >> igt_core and expose the functionality via --hook CLI option on test
>> >> executables.
>> >
>> >Hmm, why not just a pre-hook@ and post-hook@ in testlist itself?
>> >It will be easier to handle - just more parsing.
>>=20
>> How would that work with respect to filters? The current proposal allows
>> something filtering the events to be tracked. For example, one can use
>> `--hook "pre-test,pre-dyn-subtest:echo hello"` to run the command only
>> before test binary starts and before each dynamic subtest.
>>=20
>> Also, there are cases where a testlist is not really used. Examples are
>> calling a test binary directly or calling igt_runner without
>> --test-list. So, while I believe we could consider support for
>> describing hooks in testlist, I do not think that would be a substitute
>> for the --hook option.
>>=20
>> On a personal note, my current use case for hooks is more towards
>> debugging, so for me it is more convenient to have a --hook option than
>> having to make a copy of a testlist only to add the hook instructions
>> there.
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> >Added Petri to cc.
>> >
>> >Regards,
>> >Kamil
>> >
>
>Ok, that makes sense, I will look into your patches later (maybe next week=
).

Thanks!

>In meantime please look into GitLab failure here:
>https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606

Yeah, already tried to take a look at it a few days ago [1], but as I
mentioned there, I'm not sure how I can get more info (e.g. logs) on the CI
failure. The test works fine for me locally. I wonder if it is possible
to setup the container locally so that I get the same test envionment.

[1] https://lore.kernel.org/all/171527425512.5772.1654105508452706087@gjsou=
sa-mobl2/

--
Gustavo Sousa

>
>Regards,
>Kamil
>
