Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ACFE68172
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9010E237;
	Tue, 17 Feb 2026 11:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVqDVJdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6210E230
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771328097; x=1802864097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+llVdgVSuCSziH//bzrPh81NbDXZVnWdbGhhnDbWgtg=;
 b=EVqDVJdT5EGCCPy+MCT/lgIs9IfPE+Z4Oee4Q8RiGGoSA4uIY9fcqQ2u
 AaYu3tojlvlDfMXopObaH6NLJNj51LSiiyT0HZOmHByXdh+UeagVvEIjV
 HF28iueFS+tPjTqQqJprofXHXUu9Hhx5PfF4FpnKOgVeZfOeTz4NUypHI
 x5JVARo3K8AS7bC1W0GCp9vaX8Jw12R78zhPWbCwgKpvsxevOyeU+QNCt
 uZ2OnYZsECcfcerdOAgGNEdG7tYR5B7N0DF9ebgDOpV2jAFogkNaVmaB3
 F6Xckjr7Us0+Nnp+WpONqAuMOt61SgAYbp0fGlxEzvHrDnqhpuc6TBZ32 A==;
X-CSE-ConnectionGUID: b3Uj5ArBQ067BxdKmhPPCg==
X-CSE-MsgGUID: O3ni7rPbRs+kDqhNmcMy8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83832572"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83832572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:34:57 -0800
X-CSE-ConnectionGUID: x2HWibm6QUCiq2OyY97QDA==
X-CSE-MsgGUID: pIpFbfKfQtuIOM8qlduJsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212763295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:34:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:34:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 03:34:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:34:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBfhv7V1ZmFr6QEyEozpxxVWjHWmMfGl3VHp6MJ9DJxiz4lUImO4bD98M9e5k3+1fxkFUVuhvPRgJdJw4gquAIFs75CHneGPB2yhV5cl16qwFV0vK3MwBhM25kH8H2R9mM8co0+0AtHMBtZOaSJq3IV9l9uS9SybpxPEDTKVgjawKSU7DDRXl3XlKhXcx2kAvDuVJtaWbV9e5oviTou6tCHjCrdTmU/mLveU5M/nbpFlvop2TsHF0Ih4MvCkAmxdw3RnqQp6cVc543Sw1jLgGlHZWccc0/5npA3EiZcvUcUyvq6I6ZPkOvOUxicGL2Q8nDtEUM7tCBFA2BDZFzaJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8/5OdVc3EPT9ftAPMmuEGQSBH/VvtSGDxhEYIq7hRA=;
 b=qohCrgJsGpfiywna/oJzPw/5Xf1vssgATeLwC+1lY7zT9csrmaatWYJNZQpzukEugwzIUcCZQhxlJHxxpPdzwUBtVQLq5YMRpaGT3r7a7XVU23fj2RFy7WAiJ+DX4S3IZV4jNxPh8qQT0XxKLz/N7u44rLBDBWLqgfE5xdp7WUJgHPl9Vas2Cw+QD8m1NgjWuFZP0iKKMAn6yAoedbxtm4JiR5SQvOfZXy694lPoZY+MahuLg7qwHHK25oTADQ+CCwnRdzYcsTapbDc/H7ofm/HqF0bjESXc/X1t8dkenIJL3G4coT3spsFrmkuvwGaX1NYZ1GCIPkff+m77kOMrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:34:47 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 11:34:47 +0000
Message-ID: <6e842eff-d9a7-4bd2-9908-9985765445e7@intel.com>
Date: Tue, 17 Feb 2026 17:04:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] intel-ci: Add xe.chamelium-only testlist
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260217091838.2508942-1-mohammed.bilal@intel.com>
 <20260217091838.2508942-4-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260217091838.2508942-4-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec074eb-a8c4-471c-9584-08de6e188dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG8wVGFKb2ZWSFF2b2dYbjNZT1JiTExiVWpBTHRZT09ibnBtNjNrLzVSUHdy?=
 =?utf-8?B?N0JtK2EzR3FNWGpnZlp2a1poalA5SkVNWi9EdW81MXY0NkpoSEo3UEJmQlJR?=
 =?utf-8?B?VGJqTmNhSWNuY3kzQW5LV1BrYjFvYlAvR0NHQ1VKL1F2YTJwa2NicGxCdGFL?=
 =?utf-8?B?dWlkdzJjaXdGWTh2aVFnZXZ4RTdhSHFRWC8xUEFaRDY2WS9NREpnOHBMNkFW?=
 =?utf-8?B?emN5K0llZldwdytNNDB4TDVMNHM1Qi81S1p6Vk1zMFhGTVRTZ0VMaVd6VCtZ?=
 =?utf-8?B?aXlvWW92WTFrU25SUHNtYnNMelQwTS9EVWppMFdpaEVxaDFObmVreHJZdzV2?=
 =?utf-8?B?Mzh3OUlkeTNxd3NkUmFHTXBwWEs0WXMrdmJCdFlGZE11SFpkV0Y3L2FEZVNa?=
 =?utf-8?B?TmxoNGtDeTlRV1B0cE04VWVvSlMxZHN6YzlCL3pwK3djUFA5eGwxSFdFcElh?=
 =?utf-8?B?SHM0OVJoVTdTOGtMN1YzbTEvOVY1UVNqV055ZkExOHNpYk1RSFAyODlxcFJG?=
 =?utf-8?B?dTVQbVJXWEFGbWVWZGpUZWUvdTZsTGVCWVptbm91dzlIOXVYZWU2ZW5LQ1JR?=
 =?utf-8?B?QjR2YmtOUEZEeGtBWm0yaVBqRFdFNXptQlN3RXUvV0ppWTRxdlNFMjhJaHFx?=
 =?utf-8?B?S1J4MlB4UVZ0U21NU2tnQWxISlk0Nms2dW9qbnI4UWgwWmc4KzVXU2VzS2xo?=
 =?utf-8?B?WlBOMWxJTkJVU2dkZVpFMjdCSC9xVXZuV3B4RHprd1Y4aW5ZT0ltVm1MSy9P?=
 =?utf-8?B?bnNLRlNsVGhlakRMT1hWR1VSNDBxRUFnWDNmcVI4QThDelhDOVNDTGdCRXRV?=
 =?utf-8?B?TWZWS05NclRnME9ZZGI1ZVN4dXJCL3RHd2RUNjcrZFBuZDhtWUd4akRWZ255?=
 =?utf-8?B?L3dEZzlRZndKUE5wZ3NzYUh6RUJ6UkFrM3NXOGREMDRjLzhpcDg4cmMyK1lR?=
 =?utf-8?B?emZqUXZpQ1hTenBSUDFHN2QrL2NGNWhrMEdpTS91dTRaWU40a2VxdHlZT2d4?=
 =?utf-8?B?bVAvREVrdjBuajZNRkFmbWhQN0dTNkt0dHpsT0xLOStDclB3TkRJVDc1cDN1?=
 =?utf-8?B?T2o4TDBOWU0yRUdQQzArUkNTY3p4bHRmUVZGSGhONjhMcWZvVEd0elFtb3B0?=
 =?utf-8?B?NjVMQTVpNFdQeWxtTy9zM0NMMGFTcTJIQllzU0diQk1OemthbWwwMXZqb0g0?=
 =?utf-8?B?aUEwSCtCNVVkbmx0TWRhN1Uvdm5UM2g2VnB1T2RoOGc4cnBnZkFyYnM4ckJr?=
 =?utf-8?B?cFpsSXJmSDhFUDlsVGtKRjA3cnVVNjBseXJmSTBkUWRjQzlyMXdzTE9Qd1gy?=
 =?utf-8?B?c1EvUWNnSUZqckwyOVFEWFEzQ0xlQmt1Q0NMOWsyaHpkRTRXU1BDaEFkSlVo?=
 =?utf-8?B?RktsY2lWWFQ1QUpuT2NHaFFndVA5eGVaMk1UaTNJTkhtcW82dE52VlplVWl6?=
 =?utf-8?B?dDJLYXF2V3Uzdnl1aXdDQmplWnYyRmd4MlgzTVZxSHRsVXdFd3dtcmhhdnpr?=
 =?utf-8?B?NHZGZ2w4Rk1YRHpZUTZyd25WQ0dWQlpzMk52UTVsY09VNnlWZlp1TDVFQm5J?=
 =?utf-8?B?eVN4V0ZrQWdQeUNwblFLZ0lGYk93cjlDUUk2TlZhMjdxK2o3VUZjR2dKd3lJ?=
 =?utf-8?B?cFBpQURwS0lnZ0t0STloMDlLOVczWElBVDhIS0NVWW1mT1p1Vy8vK1pidUNJ?=
 =?utf-8?B?K0c0NDRpRFYwd1BCNmxBWjRvTDlvaE85Zyt2K3JXc1NKeXFGbG5hMDBaWkM2?=
 =?utf-8?B?cnhTTFRRUjdFbDNLVUpNR05oajAralh0RGRpd0NqT3hXenRBQ0xodjlQbzVX?=
 =?utf-8?B?SjdoVmVLVzJueFJXVnFnQmJ3aTl4YkdvZnl6M0VubnVDUURIb01jaGhESkpB?=
 =?utf-8?B?clk4WkFKTVZRcHFVeSs1aGl1TFdJM3NvZUFjeWtVWXRJUzVyaktrR2lSSGoz?=
 =?utf-8?B?QllSa3NJZGFLSk1MTnhUSkNINk1Dd3lac0w0ZlpDakEvb2JhVzVJZ2hOQlJr?=
 =?utf-8?B?a3NBZWpqRVVmM0pQNDg5VURVNUhwN0ZyQ0dqRXpia2hIS0hzYlViU1Yvb2M3?=
 =?utf-8?B?RjMxdCtMLzVzdVA0TDRveXUvUmtMaU9nV0ZvWHdJa1FuZjcxdnI0ZTdVYlRU?=
 =?utf-8?Q?mBKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckEwTHlaR00vK0pFNU5FY0Mrd2hQUlEyU3NhNG9FOE8ySW8zK0hicmtzVzBJ?=
 =?utf-8?B?TmZVM1VTbUlFYU1JbXEwZG5GTjFDM1l6YVROMFpxb29aNlZ2VkdBUUtLRmNE?=
 =?utf-8?B?MGhNQjZrRmVWd3NwR29majZUTVNqV3BiY1cwTFFScFRiTkFTc3V5M2VaMlVC?=
 =?utf-8?B?NEk4L1phY2pGWFYrT1lBVVYxVU5DbHBsRGRiTWtVMGdaQ0VoWlU0bHUwZi9I?=
 =?utf-8?B?ckVBdjhCZ3FEeEgwSWVVVWxTWWRCZ1l6M2labThWSXNUTzVmS1hkRkNhQmI0?=
 =?utf-8?B?Qm51QWZkb3ZjVkM4VkVEVW1uSzNmWGMrWk54WW9IQ29Qa1BlTVFuOVpDS1RD?=
 =?utf-8?B?dGFQSDEvcUhLbWhIZjF3amFGNW00M0lPVC9ncUhEbDNFRm0wYmhzeUtoQnNj?=
 =?utf-8?B?MVpIaUhOUnRTNTdLNUNlcXh0d01wR2JRSDZZdnNudHRldjRyS3FJLzhqTzZl?=
 =?utf-8?B?N0ttODM0R1ZiRXY5MVJJKzRBdEowS3d5NnJSQ2FLc0VMcm1CTGdneWtsNXBV?=
 =?utf-8?B?Nmw4aHczZXE2aTZQeExRWDVGY2t3YUUwOTRINWxScllzQVNJVFFZYzMzaDAx?=
 =?utf-8?B?SXB3ZG80TUlIcFp0VTIySlo0NExVUXUxM1NBSGpnODZGZGMvT2U3a0hOR0Nz?=
 =?utf-8?B?VFl1ckdaRFh2WFhzRy9Oa2g1MHFUY1MzekFraDFaeW9tWmVCTjIyOHBjL3Iv?=
 =?utf-8?B?WnliclRJNTA0TDRMZGdQbVRQZHZUZDJVZG5vK2RoSE1wbmM4VlZLbnNCSFBB?=
 =?utf-8?B?NDV5THVBM0k0RUx2QUdCcmlHQnVwQ0dibGRReEFpWmMzTFYzb2tpVnFDQVRH?=
 =?utf-8?B?RmtGZFFzV3BCbHdBdllCYTJGVm1wQ29BNThobDc0V2VzVUNFWjRyUWgwQks1?=
 =?utf-8?B?WXI3MXkyOThhekNTVCtiVGMzSWhOQnR1TTFZbTdiYm5iWWxVRlc0UEV5K1Iz?=
 =?utf-8?B?aFRCYWxSd3hvblBDajFCNFROMTN4aDYxcHY2N2lFcXBkUWY3dUMrazZQWWd4?=
 =?utf-8?B?RWIvdU9uekwxTjZMeFZiT0pjamFjZ0NuakRranhLQXBDcjI2c1RMTUwxN0k3?=
 =?utf-8?B?TTJIZWc2dTFGNHpGdGhTRjBycnJ6ZFRXWWdvSmhPdEN6cFZkaEZKV1RnaWxB?=
 =?utf-8?B?eW1WVXMrVzdsaUYrTGtYRjhaK0xramtiUlZvWHFUREUwN2lXZXNxZ0J0MzlI?=
 =?utf-8?B?VjFzQWNRb2t1MEhqRnZ5L0JEZmxoKzVnYUtESHFZNG5MVkRCYmxjTDdPNFF6?=
 =?utf-8?B?WFUyNStzMTNuYWZZRkpJaW1sTkJPK3FqZGZUcW5SYW02cDZoQWo5OERUeW1l?=
 =?utf-8?B?RCsvSTNpUk1nREFUMm12UEYwc2hNcVBSdUs1NXd1V1NBUEV0UFk2SG8zeGVO?=
 =?utf-8?B?cW5od3NPSFVsOVp6Q0xISG5laXBkYXFlR0J1Smx5UlRYdE0vNFlYRzRuVFB6?=
 =?utf-8?B?anVqNThpOXdhM0tJanpSOW9qaldyM2xlQ2VwZFZmWTg0YzZ0b1NjOVM5Zzkz?=
 =?utf-8?B?UVJsZk1tVmltRVdMbCtZaG93aTQzVU5mUVlKTmFTN0pnV1RWVWZGbUhLY01W?=
 =?utf-8?B?ZHJIOHBzL2dDbjJ6RTlBVXNHT1ZnTzA4TmZ0NFRPeXUwdEJoNlF0ZzYvRDMw?=
 =?utf-8?B?TGQvZjBTMzlxSlJVdVd4SlBtVUJoT0RMOEorSzZyVmZReFdMSzJPeFN1T3hN?=
 =?utf-8?B?L2cxNWJFNW42NnNoOGlLWlFwTEdEbW9kVG5US3JRQkRMRVZRZmlwSm5NNWdp?=
 =?utf-8?B?dER4V09mZ1BpaENYaTBzUVV0UU5vejNqM0ROSmFPV3g0OXZaYnFnRDNvQ3BD?=
 =?utf-8?B?dXQzT25NbW4xWVVYSlhMcnpkWHJlVEowS1dnL1VkYXJJMlRRR2c3MG9jcGRo?=
 =?utf-8?B?OGxvVklnZ2pHWitPSEoxSitpSHBDcnpBZnR2K01yTUxCWDVvR3hxU0lta3JR?=
 =?utf-8?B?RmVzbFJjODZ0cVkvUnZVYklYcWF2WExTT3Q2ZGhpM1MvZjh4WWx6Nlp3eWtP?=
 =?utf-8?B?V3JwRjlhazFNT1ZSTnhRelBDU1VENkVKelowTkNjbDY2eVJKak1GNWJudDZT?=
 =?utf-8?B?cW9KbW9uMWdUOVM3R0swL2RWUHNNTTFrTXZyK2lUNlAxVGlZNEZZTGdkSDFp?=
 =?utf-8?B?OXU1UUI2aklTMmFuMVlKM29uR0ZlTVUvRmdRV2p0eGZuTEI0Z1FqQzdhRTBW?=
 =?utf-8?B?REJNT0RNZytuN1ZBNjM3cHl0RlhjZ2tSamlja1ErVjFObWtxRHdMSmMxb3Nh?=
 =?utf-8?B?Yjl1TEJxQXhORWRqS1dqK3RkeUh4MkcwcGJnaDhiYm1KOVJ2TkhEWGhiY3F1?=
 =?utf-8?B?cCtDbWUvSEMrbkk2QUZHeURyYm4wTzI2RSsvWXdNYWdIMFRqWnhIdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec074eb-a8c4-471c-9584-08de6e188dd9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:34:47.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDdEHpH08kZA6KcbnLjSmewwUJGMFUitPPPHKBSLIijP+KLRaMjSZrU46MyemLBCqx9X4dUnd2PEVkcQptFbSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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


On 17-02-2026 02:48 pm, Mohammed Bilal wrote:
> Create driver-specific chamelium testlist for xe
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/meson.build                |  1 +
>   tests/intel-ci/xe.chamelium-only.testlist | 71 +++++++++++++++++++++++
>   tests/intel/kms_test_config.json          |  5 +-
>   3 files changed, 75 insertions(+), 2 deletions(-)
>   create mode 100644 tests/intel-ci/xe.chamelium-only.testlist
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 466530e08..54a9b6f5d 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -14,6 +14,7 @@ intelci_files = [
>     'xe.bmg.core.blocklist.txt',
>     'xe.bmg.display.blocklist.txt',
>     'xe.bmg.eudebug.blocklist.txt',
> +  'xe.chamelium-only.testlist',
>     'xe.eudebug.blocklist.txt',
>     'xe.fast-feedback.testlist',
>     'xe-fast-feedback.testlist',
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> new file mode 100644
> index 000000000..4428fb48e
> --- /dev/null
> +++ b/tests/intel-ci/xe.chamelium-only.testlist
> @@ -0,0 +1,71 @@
> +igt@kms_feature_discovery@chamelium
> +igt@kms_chamelium_audio@dp-audio
> +igt@kms_chamelium_audio@dp-audio-edid
> +igt@kms_chamelium_color@ctm-0-25
> +igt@kms_chamelium_color@ctm-0-50
> +igt@kms_chamelium_color@ctm-0-75
> +igt@kms_chamelium_color@ctm-blue-to-red
> +igt@kms_chamelium_color@ctm-green-to-red
> +igt@kms_chamelium_color@ctm-limited-range
> +igt@kms_chamelium_color@ctm-max
> +igt@kms_chamelium_color@ctm-negative
> +igt@kms_chamelium_color@ctm-red-to-blue
> +igt@kms_chamelium_color@degamma
> +igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_edid@dp-edid-read
> +igt@kms_chamelium_edid@dp-edid-resolution-list
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@dp-mode-timings
> +igt@kms_chamelium_edid@hdmi-edid-read
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
> +# TMDS config errors on v1 board
> +#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@hdmi-mode-timings
> +igt@kms_chamelium_frames@dp-crc-fast
> +igt@kms_chamelium_frames@dp-crc-multiple
> +igt@kms_chamelium_frames@dp-crc-single
> +igt@kms_chamelium_frames@dp-frame-dump
> +igt@kms_chamelium_frames@hdmi-aspect-ratio
> +igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> +# Tests are exhaustive and pick random configurations
> +# removed tests as results are non-deterministic on each run
> +#igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
> +igt@kms_chamelium_hpd@dp-hpd
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-fast
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@dp-hpd-storm
> +igt@kms_chamelium_hpd@dp-hpd-storm-disable
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@hdmi-hpd
> +igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@hdmi-hpd-fast
> +igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@hdmi-hpd-storm
> +igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> +igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place suspend tests at end
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +#Place hibernate tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index e907b4b84..158ead3b6 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -18,11 +18,12 @@
>                           { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
> +                        { "Xe chamelium": "../intel-ci/xe.chamelium-only.testlist" }

Shall we have this as Xe FULL chamelium?

Same with previous patch i915 FULL chamelium?

>                       ],
>                       "exclude": [
>                           { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> -                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                        { "Xe BAT, Xe BAT chamelium, Xe chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                       ]
>                   }
>               },
