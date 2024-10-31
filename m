Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19783D767E1
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 16:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4D10E8EA;
	Thu, 31 Oct 2024 16:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8cgsoOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A110E8EC
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730391556; x=1761927556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TGVJtbNbLPpSEPZDEsUSS4/wUFZ9Q6QdEN0+ja+h020=;
 b=B8cgsoOFtdG4sKZyr6uEZUElFMf1pQ4WnyPb9QyPFpI2DOXR1Kv9fE8L
 CtvYb3jZgl30IEVxLQJdU8vpN1x8y9IUEWMr+RE0cS5Ob5Y82vF2/6sOy
 Jd9Yv1l9PQqsfXok6CKXUD2Da4V8furUXuCcN1Zm6jdu0Fl4GV0eBQPAV
 oDI10gxaSjnh/GgYYmsxb4A/Xaxt85WnX5xHEhGFuvW2z+thwdu9rwt/j
 pyremCo1PJ21KkmVQtEdW+HFC1xs7y3duCTNSf1w4j3l63ohrY00RxJMn
 ZVKTJkVCGFzPEfI4Ydtu6RKACLTg7uESD/Y5anyb9RiHlReXvp/WbSJhQ g==;
X-CSE-ConnectionGUID: qC+O4Ml/Tpmlmirnc5vxEw==
X-CSE-MsgGUID: zSh6wHIyT0KxToJTC50hxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29915018"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29915018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:19:15 -0700
X-CSE-ConnectionGUID: YstYFMQRTX6QaxFKaClEJw==
X-CSE-MsgGUID: tnUlicSRRbGe+nhd0z0liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83101827"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 09:19:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 09:19:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 09:19:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 09:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuMQoWozq6zqMMfXY1d5SkeQhoRj1eNbsoqazPqU9ns/y23QhTinq76OiAIG+na9QV2JDkc5s86RAy/CObXjALbjyS0u8D4h7x5Ss3R4HGoEx4SgKffVj3BjB3ucK8XHbFyD9d81OEWJoncyc3tS6ayBvNbUNSAap1i97P0AsCkvGDC9A//9KLZgKvo+V+v+J3gNo+nArCreakBGzMLQ3Kj/nYeTmfmIn/+s08jhY97GcJ1/6k5adi/hdC6pBEkit3TSmufzSQ/KRnSYpMyV5nkBCWTnDU+E33r6sX/1CXh801WxZg5soh5vwaLxgSwiEXLl3v28rXc12FviGqaSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGVJtbNbLPpSEPZDEsUSS4/wUFZ9Q6QdEN0+ja+h020=;
 b=lbod0iJfxlr2oAZYgVxiAhTueBzFno3vrj53gEBfKKxymeUIyHRps3tkK99RRMFus6G30XMMT67cbltSYBe7mhMwEbMZi12RI2lNrgDWPvZ25tVFdjwQsR/0aQuJEsFKKcd1MLeqns9eujzOakFC1uVqD08qUFISu8t+LKWThWyior4PGc2E0l4LFhl4mpIhnz/vzlGBHvv57z4UazyFso+0mPaJShKtw/SfpbLxDFSn1DfklMkLW/jJhaYchPT7olwUMkAZLCKn4GGZf5gYwkfMKVwtJinVUIQpN6lovDLD7ENhmZjOgXu9LCgRmDtdF8tJxafadicW59xUnYSGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 16:19:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 16:19:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Thread-Topic: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Thread-Index: AQHbKkqiFfklfJ4VTUaZW+bXzhxEK7KfQEQAgAGrtaCAABgkgIAAB+9w
Date: Thu, 31 Oct 2024 16:19:03 +0000
Message-ID: <CH0PR11MB54448B34D7FA21CD4023241AE5552@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029213621.170938-1-jonathan.cavitt@intel.com>
 <20241030125124.234xdbbvwqfirvl7@kamilkon-desk.igk.intel.com>
 <CH0PR11MB54440F024F3F7B381DEA6569E5552@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241031154837.y6htrdunacvtpiyp@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241031154837.y6htrdunacvtpiyp@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 7a328608-4563-4e25-5bbd-08dcf9c7bc71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUE0dEplRlVRY2ZYVU9DNHRISnJaQUtHOEIxWW82akZrdUdwUGsrbjg2Z0tn?=
 =?utf-8?B?SUwyTG02Si9zd2h5eTlaSzUxVUFNMHd3Z2t6NThQSTZqM2dSODJESUdReTda?=
 =?utf-8?B?aGYzYmwxWkxHNXAzbTZuN0pZYzJSRXpod1Q2SnhML0kyOG8vM0l2dERKRlIx?=
 =?utf-8?B?L0dRWHFIWGUvN2M4OSt5Sk9JaG9CSWIyM2VPNm1DTkNQZkNhVEZjUnBuNE1p?=
 =?utf-8?B?Ujcyak92azBrVHJFM1Q1eXNCK3ZUTU92bmhvaFdrVnozMTM0alNPSnc1Wm9N?=
 =?utf-8?B?eUsvbDZlMHBocVFaRGJlbnNWZWFyTG9YVTZISkhzdC9jZmsrNFlkSzJVZkxG?=
 =?utf-8?B?d2VpajhtSEdnYmFCNzA1SVh3WlJETXpiZmhXbFN6OElNcVNhZ2h6dzFIRUN2?=
 =?utf-8?B?ZmVxdkpFb3B1M1k4aFd5Lzh1akdtMWlRSFRmYUxrVlhFVXp0c25iSUxXTjR4?=
 =?utf-8?B?cjJyRktoSCthSnRudk5WK2VNUUtadGJyQUU0SnF4ODd5SFFJSlNSK1JqQ2hr?=
 =?utf-8?B?OU1GQjBET1Y2V1BkZE9iZG9kQW9sT0lRb29MdWh5Yy9CaUNXbzRLL01SamRh?=
 =?utf-8?B?M3NNTERvdjhHeVd3N0pXbGpJak5zekNFZS8zZTRaUG9CYmpYdUpHR1kyYUN3?=
 =?utf-8?B?S2VZQkxJZloxK1BHWnNoSXAxa3VjS0JGMWhhYW80OVh0aUZwcEpqaFhTakFr?=
 =?utf-8?B?eS9Ncy9ETHRVSW5Wc1lkU1c0bUhIcHEvQW5RSndpY0J4d01OWG1jNHJWY0U5?=
 =?utf-8?B?bTJraWE2azd5T04xK2gvcHBkYzAvNG1FUDhmUkJzMUMvQTBMeDc2OUgwdTNM?=
 =?utf-8?B?TThIOVlOYVhlMUVUQko0OW5qdTR5eGpyNCtDbEhMWVUxYVljeGJ4Yk9XTmZZ?=
 =?utf-8?B?TlAvLzFrZ3lKQUtrMHpiMjNMQlNMcm9naWZrTUdMbk8rVGtPTmNkdGJ2UHZY?=
 =?utf-8?B?NC83dElhcC85UGlDaGlqYzVJdzBnaW5sTkpYUzBuWDhlRWlGQVhZSVJ6YXRX?=
 =?utf-8?B?cnJPMjdHS1pFNGp2UmJ1L1plOTNITFJlM0wzUU1TbUY4RzZ1ZWRpYXlLWi9I?=
 =?utf-8?B?L3dqa1RyaG1vK1V5ZHBWSklGM0tFMWV5OUN2dWpPait5b3FOZ3pYWklhMEpN?=
 =?utf-8?B?VXd0SnlMZUlRUnBaTmltbk93WGE3WWFJUmtkcjVDd21waE4rY0JGSm5KeWVH?=
 =?utf-8?B?WERMOE9naWxleGxybWVGd2FsN1pxNHdYVVZFeTNkNzRMb2R3NGQ4NFBubURp?=
 =?utf-8?B?a3dpOGpaNTZCcy9wY2YveGlQb0M1OGRlblNoeXYweVkvMVZ5V0dDWWs3NThN?=
 =?utf-8?B?U2c2amhrZFA3NTZKSHptOU93UXRaQzJNUFUxbGIyTlY4Mk9zaEZvQVRFQzhl?=
 =?utf-8?B?bi81QmV5QWZtcUtjS0NibzVmOGNhSTAvNDhrMHdSRndXUG16R0xubWJaNkdB?=
 =?utf-8?B?dGF3THF0M3lmUEpOQTVDMFBqYkM4VGo3WHBZZktSYnF5Z2pKSkVIR3h5N0lr?=
 =?utf-8?B?Y3V1YmhHT1ZxL3BiT1NNVFYzcDlGRTVjOEl6dHVKNEtuZHZpa3pZTnJzQjBD?=
 =?utf-8?B?OVhOMWlUcFY5alg5cldNUk1wa3pWNlRYSCsyb2lUdzFQVC9BVnM5Ty9wSmx4?=
 =?utf-8?B?amVMVHloNy9jS25uczY2czcwK0FXYUVITGJzSkw4K3JlY3VjUk5ydENCNHRZ?=
 =?utf-8?B?aXNzUDcyNkZieWdOam82SHRoa1ZDVWJCUFdzeVlTaGQrbGxUeS9iNmRFTVh1?=
 =?utf-8?Q?y02Pv0B/Yi8FLLyMsgLsXZWYGMwjXG01mdPN9j4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUxNZjdDT2tMZkRjaUgvMGxGOElIZDVJWldxUlJtcmJzTkwyVmNKLzQwa1Ju?=
 =?utf-8?B?NVFCbTdJWnhVTzk3SFQxSHRhNkxiMkcrS2tQQnNlRC9IQ3pJZXZTTlAvVElI?=
 =?utf-8?B?YkFEMEthM2NGcWZFeG5Pd3FGTExVQVpxYlNVMXo2YVBoOGIvcVIvMXV5cmtD?=
 =?utf-8?B?YmwzZnFTQTFNaEhibWVSTkR3UmZrd0tBNmJUTS83TnpPTStKQ0EyMG5DTVlk?=
 =?utf-8?B?QkkwUVJwYUwvNmJJSyt3QmtjaVp2NDhWaHZvRmpuclNHQmZmUHhKU1RhUEJT?=
 =?utf-8?B?eFZ0eVRsQ1RtL2lEU3VEUGl6YkdmVE5oWFRnMFk3TTNyd294L3d4Ni9xM2t6?=
 =?utf-8?B?Yk5nZlRRR2lGMVY4R1dUdlFQQnhhbmx0VUNPc2psUUU2WGN5dWlNYUJ1NUtP?=
 =?utf-8?B?RFRvOWtJRHFxS1pEREc5dlhkQVR4eFNxQnQ3ZG84L3pjSkVJdnJHeE5aT21j?=
 =?utf-8?B?Q3BlVG5tMDI2L3I4d09wNHRxRXNWZ005SVc1dFp3SWVHOXVWQTJ5TDRqblYw?=
 =?utf-8?B?MzNqK2U0cGFtaVpOUDdMektCWFYyeTR0SStmeDBTRVdVM0xXa3hLbWFOLzNk?=
 =?utf-8?B?MmtYaU1YMnNsYTdaM0oyWFpSalB2SSs0R05HQUtKSDYzYStHdzJCT0d1b2Fq?=
 =?utf-8?B?aHNaVjBHbnF0ZjZSUjN0QWc2a3NRQTdRUlZLcEZtNHN4bUFjVUhYdFN1NER0?=
 =?utf-8?B?VmJGMG12L3M0Ky9Pa2F2b0RlTUJhOHExdVJrSGZmLzhoZGpTME5vNkVSZE9p?=
 =?utf-8?B?Nmp2KzJlbngrK3RaZlRGcTMzYldiQ21aU1FYQS9SejhDSmxyeC9KVGFERUZB?=
 =?utf-8?B?bXlRbklrTUhERkpXSDg5bHhjSE40dlFMYmNWSFBpMmNnYThkNUNpSy9VdE1H?=
 =?utf-8?B?bU55TWZhZG9YcGpJTW9RaEJxc1FvNmI1aThyalNaNlZPN2NuY2lnR1FpcUh3?=
 =?utf-8?B?TWRBb1JYbkZPeFVJRGtINmxqZ3hLaEZCN2o3L2R4NS95RHJGZE1JRVRKOHNB?=
 =?utf-8?B?L0dJTVY1S1AyeWZ1NDQvcmdrL0F3NGhKRGZmWmVQSVdvRmhUelNlRnFwVnRR?=
 =?utf-8?B?OGduUFoxMyt1L3FPR21YRFQ3M3FUVlNNMFhaVlNJTUdzMkE0NnNwTTF0cTNp?=
 =?utf-8?B?L2VOUVBnd0l4MjV3WW9pVkVBYUpKaWppbzJLOXByL1hHZWNlbExHV2ZKS2FR?=
 =?utf-8?B?Uy81RXI0RHBiaWduRFIzc3IvV2l0eHREbk1xMmM2VDJXYnJVZkJDc0cyb21G?=
 =?utf-8?B?Mk9JWnorZXZLQzhBdW41Q0ZaYkc3MG1MMTdTMjEzTjR0YXJzN2tSSktzNUVl?=
 =?utf-8?B?Q3ZsTUQ3OFUrbmsycXZuQW9qS0hteExhL1VPQlFiclFNZFBIazlVUldnNm5O?=
 =?utf-8?B?ZzdzVkFuVHM1Mlp1WHREWVlBcEllTEI1WmdGMjdpSitCSFZwdFNHT0JUWTRZ?=
 =?utf-8?B?Z1FuM1VlUnhRaDhLTGtaOGpLbzFIWjlRNGhiNXNLdXcvYnBUVnNJRTNzbHJC?=
 =?utf-8?B?bUt5ZTZ0ODFSKytkbzZzbkRZNE5QUkFMRmttUUx5OEpGakZROTM5MUhnbkVT?=
 =?utf-8?B?cDl0Z3hLRDdqc1J2eTZjb3orRlBUOWxkcUl5UlJtcmpIbHNzSFNabHYyNXRs?=
 =?utf-8?B?QTdzTnRxVmIwMmFwanJkKzNqTmQ4NzhCWFJtZkp2ZDA3ZlRWVnNYQ0pHSDVm?=
 =?utf-8?B?Rm5TdzVwb0tIOFdjeCtDdENxTUVqZFEySFJ1a1hzbjd5c2xYaGJxdzlMK2dJ?=
 =?utf-8?B?M3RueDAyM2pXTW5NZFZZcXlwMm9RQ21JaHhvUE9ZZXZ2UGtxVnhtQXkvSWN1?=
 =?utf-8?B?S2NRRG5WbSsvTkRSckE5Z2htdzZ1SUFDQU9kcHJiZllHR2VFRkhveDI1SVZ5?=
 =?utf-8?B?RzgyZjhoVzk3cHpzOVBrZjBuV0pZUjEvZ2M1bmFDM3lVaVZWRHF3ajdxQlJ6?=
 =?utf-8?B?YUo1YlprT3N2Mm5ZNEF4T1VucUVQVWM2VGIvc1h0RFJHNXpab0pvejBDQy9O?=
 =?utf-8?B?QVRLYVR5UGRsT0kwRVFFbWFxdjcyNVUySlgweStmbWkzMHU4YXdIeHM4QmRP?=
 =?utf-8?B?OFkrV2ZYbVdLUTc2d1ZlM2lZbnNjV3ZDSGo2amxPUEpJZXpqdk5CT0x2MjN0?=
 =?utf-8?Q?VHdkVZ0wXyQp1G4k0OWQOeXP5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a328608-4563-4e25-5bbd-08dcf9c7bc71
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 16:19:03.5012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igKXno29rv24Ara2YDUiXgCtlf9snMbbwA411tjIxtpwcQBgiMCF8hYsXnh61OHGZ7Eu7qZsTSyknn8YN33C+DZZiHAQBJkW7efn2XxqVDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAzMSwg
MjAyNCA4OjQ5IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDYXZp
dHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhn
IDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNv
bT47IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbjog
UmVzdG9yZSBwcmVlbXB0IHRpbWVvdXQNCj4gDQo+IEhpLA0KPiANCj4gT24gMjAyNC0xMC0zMSBh
dCAxNDoyOTo0MyArMDAwMCwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT4gDQo+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDMwLCAy
MDI0IDU6NTEgQU0NCj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBD
YzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IEd1cHRhLCBz
YXVyYWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0Bp
bnRlbC5jb20+OyBCZWxnYXVta2FyLCBWaW5heSA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+
DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNl
X2R1cmF0aW9uOiBSZXN0b3JlIHByZWVtcHQgdGltZW91dA0KPiA+ID4gDQo+ID4gPiBIaSBKb25h
dGhhbiwNCj4gPiA+IE9uIDIwMjQtMTAtMjkgYXQgMjE6MzY6MjEgKzAwMDAsIEpvbmF0aGFuIENh
dml0dCB3cm90ZToNCj4gPiA+ID4gVGhlIHN1YnRlc3RzIG9mIHN5c2ZzX3RpbWVzbGljZV9kdXJh
dGlvbiBtb2RpZnkgdGhlIHByZWVtcHRfdGltZW91dF91cw0KPiA+ID4gPiBhbmQgdGltZXNsaWNl
X2R1cmF0aW9uX3VzIHZhbHVlcy4gIEhvd2V2ZXIsIHdoaWxlIHRoZSB0ZXN0IGRvZXMgcmVzdG9y
ZQ0KPiA+ID4gPiB0aGUgdGltZXNsaWNlX2R1cmF0aW9uX3VzIHZhbHVlIGF0IHRoZSBlbmQgb2Yg
ZXhlY3V0aW9uLCBpdCBkb2VzIG5vdCBkbw0KPiA+ID4gPiB0aGUgc2FtZSBmb3IgcHJlZW1wdF90
aW1lb3V0X3VzLiAgQmVjYXVzZSB0aGUgdmFsdWUgaXMgbm90IHByb3Blcmx5DQo+ID4gPiA+IHJl
c3RvcmVkLCBmdXR1cmUgdGVzdHMgY2FuIGVuZCB1cCB1c2luZyB0aGUgdW5leHBlY3RlZCBwcmVl
bXB0IHRpbWVvdXQNCj4gPiA+ID4gdmFsdWUgYW5kIHRodXMgaGF2ZSB1bmV4cGVjdGVkIGJlaGF2
aW9yLg0KPiA+ID4gPiANCj4gPiA+ID4gU2F2ZSBhbmQgcmVzdG9yZSB0aGUgcHJlZW1wdF90aW1l
b3V0X3VzIHZhbHVlIGR1cmluZyB0aGUgdGVzdC4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgZml4
IGRvZXMgbm90IGFwcGx5IHRvIHhlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCBiZWNhdXNlIG9ubHkg
dGhlDQo+ID4gPiA+IHByZWVtcHRfdGltZW91dF91cyBpcyBtb2RpZmllZCBkdXJpbmcgdGhvc2Ug
dGVzdHMsIGFuZCB0aGUgdmFsdWUgaXMNCj4gPiA+ID4gY29ycmVjdHkgcmVzdG9yZWQgYmVmb3Jl
IHRoZSB0ZXN0cyBlbmQuDQo+ID4gPiA+IA0KPiA+ID4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzI5NzYNCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0K
PiA+ID4gPiBDQzogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1
cmF0aW9uLmMgfCA2ICsrKysrLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfc3lz
ZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMNCj4gPiA+ID4gaW5kZXggY2Y5NWEzYWMxYy4uNjkxMmYx
NjZiNCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNl
X2R1cmF0aW9uLmMNCj4gPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNl
X2R1cmF0aW9uLmMNCj4gPiA+ID4gQEAgLTExNSwxMCArMTE1LDExIEBAIHN0YXRpYyB1aW50NjRf
dCBfX3Rlc3RfdGltZW91dChpbnQgZmQsIGludCBlbmdpbmUsIHVuc2lnbmVkIGludCB0aW1lb3V0
LCB1aW50MTZfDQo+ID4gPiA+ICBzdGF0aWMgdm9pZCB0ZXN0X3RpbWVvdXQoaW50IGZkLCBpbnQg
ZW5naW5lLCBjb25zdCBjaGFyICoqcHJvcGVydHksIHVpbnQxNl90IGNsYXNzLCBpbnQgZ3QpDQo+
ID4gPiA+ICB7DQo+ID4gPiA+ICAJdWludDY0X3QgZGVsYXlzW10gPSB7IDEwMDAsIDUwMDAwLCAx
MDAwMDAsIDUwMDAwMCB9Ow0KPiA+ID4gPiAtCXVuc2lnbmVkIGludCBzYXZlZDsNCj4gPiA+ID4g
Kwl1bnNpZ25lZCBpbnQgc2F2ZWQsIG9sZF9wdDsNCj4gPiA+ID4gIAl1aW50NjRfdCBlbGFwc2Vk
Ow0KPiA+ID4gPiAgCXVpbnQ2NF90IGVwc2lsb247DQo+ID4gPiA+ICANCj4gPiA+ID4gKwlpZ3Rf
YXNzZXJ0KGlndF9zeXNmc19zY2FuZihlbmdpbmUsICJwcmVlbXB0X3RpbWVvdXRfdXMiLCAiJXUi
LCAmb2xkX3B0KSA9PSAxKTsNCj4gPiA+ID4gIAlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfcHJpbnRm
KGVuZ2luZSwgInByZWVtcHRfdGltZW91dF91cyIsICIldSIsIDEpID09IDEpOw0KPiA+ID4gPiAg
CWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgcHJvcGVydHlbMF0sICIldSIsICZz
YXZlZCkgPT0gMSk7DQo+ID4gPiA+ICAJaWd0X2RlYnVnKCJJbml0aWFsICVzOiV1XG4iLCBwcm9w
ZXJ0eVswXSwgc2F2ZWQpOw0KPiA+ID4gPiBAQCAtMTQwLDYgKzE0MSw5IEBAIHN0YXRpYyB2b2lk
IHRlc3RfdGltZW91dChpbnQgZmQsIGludCBlbmdpbmUsIGNvbnN0IGNoYXIgKipwcm9wZXJ0eSwg
dWludDE2X3QgY2xhDQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAgDQo+ID4gPiA+ICAJc2V0X3RpbWVz
bGljZV9kdXJhdGlvbihlbmdpbmUsIHNhdmVkKTsNCj4gPiA+ID4gKwlpZ3RfYXNzZXJ0X2x0ZSgw
LCBpZ3Rfc3lzZnNfcHJpbnRmKGVuZ2luZSwgInByZWVtcHRfdGltZW91dF91cyIsICIldSIsIG9s
ZF9wdCkpOw0KPiA+ID4gDQo+ID4gPiBMb29rcyBnb29kIGJ1dCBpdCB3aWxsIG5vdCByZWFjaCB0
aGlzIGxpbmUgaWYgYW55DQo+ID4gPiBpZ3RfYXNzZXJ0L3JlcXVpcmUgdHJpZ2dlcnMgYmVmb3Jl
Lg0KPiA+IA0KPiA+IE91dCBvZiBmYWlybmVzcywgdGltZXNsaWNlX2R1cmF0aW9uX3VzIGFsc28g
aGFzIHRoaXMgcHJvYmxlbSBpbiB0aGlzIHRlc3QsDQo+ID4gYW5kIHByZWVtcHRfdGltZW91dF91
cyBhbHNvIGhhcyB0aGlzIHByb2JsZW0gaW4geGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0LmMuDQo+
ID4gLUpvbmF0aGFuIENhdml0dA0KPiA+IA0KPiANCj4gUmlnaHQsIHNvIHRoZXJlIGlzIHN0aWxs
IHJpc2sgaXQgd2lsbCBlbmQgdXAgbm90IHJlc3RvcmVkLg0KPiBXaGF0IHdlIG5lZWQgaXMgcmVz
dG9yYXRpb24gb2Ygc3lzZnMgdmFsdWVzIHRvIGNoYW5nZWQgYXR0cmlidXRlcw0KPiB3aGVuIHRl
c3QgZmFpbCBkdWUgdG8gc29tZSBhc3NlcnQvcmVxdWlyZSBfYWZ0ZXJfIGEgbW9kaWZpY2F0aW9u
DQo+IHdhcyBkb25lLiBDb3VsZCB5b3UgYWRkIGEgLyogVE9ETyAqLyBub3RlIGluIHNvdXJjZT8N
Cj4gDQo+IFdpdGggb3Igd2l0aG91dCB0aGlzLA0KPiBSZXZpZXdlZC1ieTogS2FtaWwgS29uaWVj
em55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KDQpUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXchICBJJ20gZ29pbmcgdG8gYXR0ZW1wdCB0byBjcmVhdGUgYSBwYXRjaCB0aGF0DQpy
ZXN0b3JlcyB0aGUgc3lzZnMgdmFsdWVzIG9uIHRlc3QgZXhpdCwgc28gaWYgdGhlIHRlc3QgZmFp
bHMgdGhlIHN5c2ZzIHZhbHVlcw0KcmVtYWluIHVuY2hhbmdlZC4gIElmIHRoYXQncyB1bnN1Y2Nl
c3NmdWwsIHdlJ2xsIGF0IGxlYXN0IGhhdmUgdGhpcyBwYXRjaA0KdG8gZmFsbCBiYWNrIG9uLg0K
LUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiA+ID4gDQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gS2Ft
aWwNCj4gPiA+IA0KPiA+ID4gPiArCWlndF9zeXNmc19zY2FuZihlbmdpbmUsICJwcmVlbXB0X3Rp
bWVvdXRfdXMiLCAiJXUiLCAmc2F2ZWQpOw0KPiA+ID4gPiArCWlndF9hc3NlcnRfZXEoc2F2ZWQs
IG9sZF9wdCk7DQo+ID4gPiA+ICB9DQo+ID4gPiA+ICANCj4gPiA+ID4gIGlndF9tYWluDQo+ID4g
PiA+IC0tIA0KPiA+ID4gPiAyLjQzLjANCj4gPiA+ID4gDQo+ID4gPiANCj4gDQo=
