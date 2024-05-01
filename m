Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C29C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 04:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04691120CE;
	Wed,  1 May 2024 04:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2lVsDyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CB81120CE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 04:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714538661; x=1746074661;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DIsapxPB6a5FxqiB8SPTmRzc7VY2Y2ns8BrC/HsiGsE=;
 b=N2lVsDyElrnyhYoDJUDW6MRbUzREhUemryP/RhqC0yKp1qqsJiOdvWVH
 8jglQuuGkXKVKxpwhitVKT90OF4RkYGiFvph/ukl09Y1Z8xgnIxC3yUdO
 ZId7Q0Qij4uZZormaF6NHN2sYN3w0vMXQcFgHUAPgEXy8idVK3suR6h3H
 Jt8iSmeT0JK0nlFttvRxWVcCagTBttxzOY8uqU6gHwHEBkZ/VEcU5I3wo
 Y3zh4ElBOdQcA91LQzF6HCLNP0+V1Tm8uvgT/mSwXPlGarljuYHP32MYo
 LuwBZ29LT8i0WKTwo0OYxC0Tls4D6ce1b4Xn2s8S65Lzpm4mxPpyooqPt Q==;
X-CSE-ConnectionGUID: t8sv53F5TXmS0IfWanaLtA==
X-CSE-MsgGUID: XbGJrZfJQZugdf6C23j/Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10098893"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="10098893"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 21:44:19 -0700
X-CSE-ConnectionGUID: iUchSqBjSxm2Wg54c01qfQ==
X-CSE-MsgGUID: yB3JTFO4QAKsK1Gm1FtTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="31149291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 21:44:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 21:44:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 21:44:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 21:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnkdFdSCr+/aNT1YXdG5aDishyJ1l2XkPEuDTdkcSxJLWzOIowk82MVkR/mbYC3UgGlty9+bpoaephcXXyeVBazs/MTW9los15kUTpShfGt3PLwfe8+/Wyb82R4v4ZgPlD87Qj/tlnn1lY86p3cJf7zlgDegrAbCRcAXw5zuW0A9riYOBnx7PE5S1AY5MNUYs65If+s2nxFIAjH9HWHvUGQSaXcEE2Jb97bWFdDxAR918vnF82CX0fu24lBb3TCN3WwuN6RXhr2zJjIhhyLy1nOEW4UsKrILmO9HFmi1Gl+CgFGS0Zv3XSrG00U5PhWXSlRIQPb8lj/gRhApKRJ5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acsFwroFxNVQmdwAcBX1BBbtAx8uo/QgYgmhJR+Kd8w=;
 b=KbGPqJmOUIXGTLoUuhjXSPbGbA4LsYYPFlqjaBkNPk2KEqL/jmWxcVqkLooDvCi9B2h39RWN2a/tkQNiBZFcqC5UQltqlcUFN+U4vVitS108WPaSLq1OzdJEnV0NeZ5XqmBqaWj5NSft8spkKFdoue8LPyT0xjk0JkpCCITWbaVGl0NE9U65ptzt4seXN6WtaHMdVJ4Z4EVjY0mvzW2FCTDPvm/tT7buCnO8S2k6/3MoGHUuiOn4Pc16iax5sIW9pR9wqwGfANHa00kqS4CCTvTtBUESqn0t6SNmlEbyZXcePWFcZ28zL95SrbONbHSccYn22UpssiD1c8v2y3Dmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.37; Wed, 1 May
 2024 04:44:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Wed, 1 May 2024
 04:44:16 +0000
Date: Wed, 1 May 2024 04:44:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH RFC i-g-t 0/2] helper function
Message-ID: <ZjHIlgozTn+cph0I@DUT025-TGLU.fm.intel.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <SA1PR11MB6991BA2418A132F04239526792192@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991BA2418A132F04239526792192@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c94107-c8db-4a9c-21af-08dc69995b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck1MOW1KbWMrQlY5VG9qUlc4MXlxd0RwUkJpRFNiaTJMZzl5NVF1djhxRnZP?=
 =?utf-8?B?QktrUWV3cFdweEU1MTJZN2hSOGsrWXYyYXd2MWVYTEd1ZGxDTW9oMTFsL0Vi?=
 =?utf-8?B?bk9CQVV1b3c0dmNaaks0VDl1Y2hSNVVHeWluWnpnU2ttNkFrbTJrYmcvaEVO?=
 =?utf-8?B?R3lyamIvTFRmQkZ1V3VXSGZhZWJPbzVidUgrSVBHMVh0eEQzc2w4OXo4MVh3?=
 =?utf-8?B?cWYzMU9UZUhsMmhLUlVtZkdJVHNOMWVoM0NtUTVGbHpiakJUOVZuMjd4cXBr?=
 =?utf-8?B?emtOUWFwM3FXUjFGdExyTFRlMEUxcmxyc1o1cmgrS0QzQ3p4MEhOODFDRnU0?=
 =?utf-8?B?ZzhpOHRLSmF4eERtMGJONkd3eXNSNTk2YkszY081Y0MyazlFUllqekhJeHd6?=
 =?utf-8?B?Z29TNjMvUVRHTUJpZUQ4QjFyVVBURWZyQzZQeHdiTmdvZGhIY0tSR045QlNV?=
 =?utf-8?B?cStOa1NjUHEzTkRrUDJKSTZQVmsza1dLUks2RjExQVlEdHJXL1V2VUR6VENM?=
 =?utf-8?B?U2tDWkdXRVJtcXloM3VvMHZIb09FNVhpZU9rNHhFRElNQkxzWWxpUk5JNkw2?=
 =?utf-8?B?ZEN6eWVRUzlHRnNBT3pVUGdSalZ6QitWRXdIbkNOd1ExeDQ1YUJuNXhYSzBT?=
 =?utf-8?B?OFpNMUNWdjdOaTFMclNhalc4M29WWFJTanZNV2hFUXNIb1ZzbDh3NHhkK1JK?=
 =?utf-8?B?MXdMdUZLcitNbzhqSFpycU4vQ1Q2S3d4c2t0by9DS0IrVzFDY2J2TUNhT1Zh?=
 =?utf-8?B?UnptOUFlQ3Y1aUoyVVAxT0QzSWVqR05lVzhZZ204dUxTakZrQm8wSERtL1Vh?=
 =?utf-8?B?R2lBVlovZldqbEFuMWlrSkxyNWFQYXZxNkNqWkhuNS9XWnNQYTk4dUlaalRO?=
 =?utf-8?B?TG5pYSs4Q0lyUFBQM3ExdGhwT3Qrd0kybEUrUGNEeW9yYVBPNVBBZnJYcjdP?=
 =?utf-8?B?NnVHZlFleXY2QkJ5eUtJdDJVNkFBODJRc25pNlZGZHFEa3Qyc21RSXg0NTE5?=
 =?utf-8?B?YnBsdVNYUGRWbC83MGFhbXZ3R1FVaWRXWWx3eHA4UG5SdDQvUHVISzd1bXR3?=
 =?utf-8?B?M2NpSnJBYXB2cUE0ZVgvUERSOWxySXVSVmhScFI4S2dSTWZpQUNUYjNWRnpu?=
 =?utf-8?B?R3M2WTkzWVlrVldZcXlTbXlJaU9qbkNWclRtalhQZTFVSU1DdHdKZTlENFZy?=
 =?utf-8?B?aEFMWmtOSXowTnZSWXA5UjdrenhveVpsTm9PeFk0R24vUkJRNFVYRXZwMnU5?=
 =?utf-8?B?aHJKWDMweXFRbzRxUFFRRDEyMkx1VkJqdHNEOFE3UkJCbE4wSkxxcXFLV0Y1?=
 =?utf-8?B?ekpkeVFUaEc0Z3FmOWUrTUJZQTF4L1hxTDdwNGxpalZ2L3VLK0RBR0xNRHJT?=
 =?utf-8?B?eDBHaEozQmYrU09sMW0xZCtOeVJjWlRJajcwZWttMG9XZWExdkU5bDhCaVVm?=
 =?utf-8?B?NkEzTXNwaTFnV2E2ZFVzNlNZNTJxR1RmRk1GNVBkeDYyNklKYU1UU0NmN1RZ?=
 =?utf-8?B?U254K3hwZnBJWjVwa01SMjRha3JVVXJLNXRoR2REd2d3a1YxWVRNaXBuQ3Fy?=
 =?utf-8?B?d0gzNzFmcnFmamZ4bmJSR2M3SFhJcXpWZExtMXNZY3AvRGc3R25UbFBweXdR?=
 =?utf-8?B?bjlTbjBGNGl6UUZXVGlPN293V1lFNVhDTmFCRVYzd3NtdFFNbzBoY0NJbXIr?=
 =?utf-8?B?ZmorU3BuK3RHUmQ1NEFYV3JPSy9jWnd5emVrdnpWY3Q3ek9NVXZBd2NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0l2VGx1NjJ6TldJbXpLbmRjNWR4LzBpZE1PemdxSW1INWZCRWdidzI1dmpF?=
 =?utf-8?B?SnJ6R0xYRTVXeUw2MU1kNXpQR0R4WUYwSzZjcnI3SlpMclBTOGEzUk1NWTBh?=
 =?utf-8?B?K1RJZzhhbFJWSEYxdWZmbnJxUHRVUWJHUGpJU2FEVVVtdVR2b2hvd1NtZTRO?=
 =?utf-8?B?RGZUcnQxTWdxU1Z5V1VORW1yYll2c2lJSFE1QUZ6WW5veHdGR0Mrd2ZUWGNB?=
 =?utf-8?B?WThLL05mcHpIL1E3Tk10V1RuV3FxeldWK0ZNSTFQUzM0SG5wZ2w2djMzZ1RI?=
 =?utf-8?B?U1NvZ1o2aW0yUXlyeW53dUZOcDBHRkhlbjZRU2ZvTFZIQkRXM3NDQTN3czZL?=
 =?utf-8?B?ak92WXI3RlBUa3UrZ3pyMFhVenVjWXVsRlhOYUxHaG9uU1U1YkFRVjc5czd0?=
 =?utf-8?B?bWl0RURPd2RUcWo4cVpqRVp4Mk9MSlgvZ2xvbU5LdzlrMkFDemgrc1NkMWtU?=
 =?utf-8?B?YTlLTk1xNFIwU0pWY2huU3BBTDdWTERWbndUZi93VEVyaEVlNGxaYzZyM1dN?=
 =?utf-8?B?WXh3L2F3S292aHA1M0ppTUFsQ2I3QWR0d1dzZjFWUWlxS282T05yZWtrTU5M?=
 =?utf-8?B?NEFSZUZLeVRWK0s5RlE1NnZmUGxSb21MSmljS0VGZytHd2FTbHJ1WDJDeURX?=
 =?utf-8?B?LzdyZkVxOCtuWDB1bGF3UFpEZDgvQStOdkdkZEpoRnRsb1hNQk5UNHBvamJ0?=
 =?utf-8?B?NEVKbU92ZWNJWURyRzVzM0swenRpS3c5dWxIVVIrTkpJNHQwc3JOK3FVT2wz?=
 =?utf-8?B?Z3F0U3ZGeFI1ZFUxdjNQMFhPL0QvbHptQjl1VHdWZDZzNmN6TmN3N2JPNFVX?=
 =?utf-8?B?MTZkUlBabmV2UDhTSTFkT3hSd2c1Y1NmaXhnbi9EVDBMOG84ZUZXNHNBWDQv?=
 =?utf-8?B?WE5qM3lYVUNXSGM4YWRGY0FmbXZXMW0yVURGQlc4STNNekxHN0xJVGJIOFZ0?=
 =?utf-8?B?N2FiTStRY2RVTk5PZ2FDVUEzTWh6YnYxaE5CU0NLUkhuN0N1eXhvdGNKU1Fq?=
 =?utf-8?B?N2YzRDZPZU9Ha0ZNRUd1ejRlV1Y3a0Y1NDdCTmVnNVRhc2czbm53cFo5VzdQ?=
 =?utf-8?B?YXhONTNDYXFhY2s1bTRWNXhMUmVxMHZBUnFsZmxFMXczUWNhaFpsMXFSbExn?=
 =?utf-8?B?L2FXMGJSbEJKUWR2Z0N4b0NEZHltKy9XdEJMQUN2Ri9UZ3hrMStuWUUwOWVJ?=
 =?utf-8?B?SFhDdHBNTzhqUHZzQktrOGFkNnk4QTBVZDZwQTRiOU9jZXl0Vnk2VlhBUWto?=
 =?utf-8?B?WUxiSm1zeFJrdHNMOVphenVCdVZ1ekxGSkxlOVBhVmRhWHRXcnJzY2RYZTlK?=
 =?utf-8?B?QWtCcDFSZlVmZmtUUGwzR3ZKQllCaXo1TWRhZFNTTklMdW1kTEtRL1ZFWFZF?=
 =?utf-8?B?b1FVL05FRlllbmthRk85Q3dseEdzU2dzbFlIdUpyQW4wOENRMkdwQXd2Mm04?=
 =?utf-8?B?UHFsdW02Z2dwUHBPOHlSa0g5YWdJUGhNZndwNUxBK2RJY1NkaHFzT0RYb2Iy?=
 =?utf-8?B?TzdnaW1LQk1VQ3JjVlA5M0xNOVZTdjVpMTFtdG8zUHJObXU5ZHJiU3ltYlhN?=
 =?utf-8?B?NnMvdmFMZ0hkUkJ0eXhDYVF1cXZadk9TNU50VVVRMytVZk15MVorRit6MUMz?=
 =?utf-8?B?VmIxc1RvMm1LK1hFcnhUK0IvRWJocjdNdFFOcm1uS1hVdUZxeXpablB5cTJM?=
 =?utf-8?B?dTZCaFBLOW5xd1lEME1qV1dqN1VRUk1JQUV2ME9qL3Q2U0hSa0Jlam1rcXhp?=
 =?utf-8?B?YVk3N2dDWlk1NkdySElVNHROb1JmQkhleVMzLytrZmY2NTBHL2U4L1l6Sm8r?=
 =?utf-8?B?WVFnMEhHdXQxRXZBbXlTcGREVDg1VTRzUDMyTFZJNGtBUGlmV3ZWVmFiWTc5?=
 =?utf-8?B?WFFNYW8wa2t2ZHVCandxbHQrL2c3bkRHemwrZFZsVU1KRGNabUFFVWUzckFq?=
 =?utf-8?B?bHNTQkpBMENUMUUvc2NmTTRHKzI2d3dKT2d6R3Jxd21UZzFiblY1WUVZM2pq?=
 =?utf-8?B?a291ZTNva2hnVkNzZWdHVnk4bDFCL0M3UW9acnFFUGZzMU9Ka1piVUhUcElu?=
 =?utf-8?B?aWFJSE9ySmtvYmpyZTFFeVYrWHBTbnBqeHV6YkxOSm14Uktqdk1kVFNhczh4?=
 =?utf-8?B?K1BhK0pIdWZ6MjBabjJIZUp0L2JSeXdTeC94MWtnM1RHUTJ6bUZPRWgzbVBQ?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c94107-c8db-4a9c-21af-08dc69995b37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 04:44:16.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bjqupl+5VooX2hFQc15QMIDhZvKHwBvJOrrLPiQVOmzd4v+R9GKCRZYpTVbTfuSBnXBeBnnGwwdbHtAv4khAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
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

On Tue, Apr 30, 2024 at 09:34:19PM -0600, Zeng, Oak wrote:
> @Brost, Matthew This is the improved version of the igt helpers. It has some clear concepts of creating buffer and command buffer, and command submission. With those simple concepts, we are able to write an igt test in <20 LOC, see patch 2.
> 

Sure you can write an IGT with 20 LOC but these helpers ultimately put
limits on the complexity of tests you can build. To get true coverage,
you almost always are going to open code something. Or the helpers get
so complex it actually makes things more confusing...

The open coding admittedly could be a lot better in the current IGT
suite. A lot of these tests I just wrote as quickly as possible while
writing Xe in a PoC stage and then they got merged. If I could rewrite
these tests, they would a look a bit different.

Let give some examples of the limitations of the current helpers in this
series.

xe_create_buffer - Things I could conviable want it to do beyond what it does for a system allocator test...
	- I want to use mmap with no file backing, with
	  several different flag combos (MAP_SHARED, MAP_PRIVATE,
	  MAP_ANONYMOUS, etc...)
	- I want to use mmap with file backing
	- I want various possible alignments
	- I want various possible sizes
	- I already have an exec queue
	- I don't want to bind it (e.g. already have system allocator
	  bind for it)
	- I don't want to alloc a new ufence
	- I may or may not want to memset it
	- I want to mlock it

This is quickly gotten out of hand for a single helper. I could go on
with the other helpers too.

If you really want to build powerful, complex tests in a generic way
from my experience you really need to build an entire framework.
Typcially these involve building operations lists and the passing these
off these opertaions to a test runner which executes them. Building
something like that takes quite a bit of skill and time. I haven't seen
anything like that in the IGT suites and is likely out scope without a
serious commitment (like a year plus dev on just the framework).

With all this, I'm not saying don't do this but I'm very sceptical this
is going to be all that useful beyond fairly simple tests. I could be
wrong or other might have different opinions than me too.

Matt

> We might still fine tune those helpers but roughly the concept shouldn't change much. 
> 
> Do you think we can simplify existing igt tests such as xe-exec-fault-mode using those helpers? Do you suggest us to give it a try? If not, we will just use those helpers for svm test only.
> 
> Hi Krishna, 
> 
> See comments inline
> 
> > -----Original Message-----
> > From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Sent: Tuesday, April 30, 2024 2:28 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: [PATCH RFC i-g-t 0/2] helper function
> 
> The subject can be something like: Introduce helper functions for buffer creation and command submission etc
> 
> Oak
> 
> > 
> > Introduce helper functions for object creation, binding, submission,
> > and destruction, applicable for SVM and other tests
> > 
> > xe_svm test is validating the helper function introduced in 'lib/xe/xe_util:
> > helper function'
> > 
> > In this test I haven’t included the svm functionality, next patch I will include
> > svm functionality
> > 
> > Test results
> > root@DUT7032PVCMella:/home/gta/xe/new/igt-gpu-
> > tools# ./build/tests/xe_svm
> > IGT-Version: 1.28-g365f81646 (x86_64) (Linux: 6.8.0-rc5-xedrmtip+ x86_64)
> > Using IGT_SRANDOM=1714498247 for randomisation
> > Opened device: /dev/dri/card1
> > Starting subtest: svm-basic-malloc
> > Subtest svm-basic-malloc: SUCCESS (0.022s)
> > 
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > Bommu Krishnaiah (2):
> >   lib/xe/xe_util: helper function
> >   tests/intel/xe_svm: basic xe_svm test
> > 
> >  lib/xe/xe_util.c     | 113
> > +++++++++++++++++++++++++++++++++++++++++++
> >  lib/xe/xe_util.h     |  32 ++++++++++++
> >  tests/intel/xe_svm.c |  99 +++++++++++++++++++++++++++++++++++++
> >  tests/meson.build    |   1 +
> >  4 files changed, 245 insertions(+)
> >  create mode 100644 tests/intel/xe_svm.c
> > 
> > --
> > 2.25.1
> 
