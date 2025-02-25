Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C71DC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 22:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DAF10E082;
	Tue, 25 Feb 2025 22:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/Hl9gF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09610E082
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 22:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740522365; x=1772058365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lnf9TzbPLpKKgOdhApDwukyEg2+3eeyUVJ/AbUiehFs=;
 b=G/Hl9gF/MPwv78HWUQ5sxmi1jVL92SPdeD6U3oWmgubmiW8tyhOjhhdU
 JO+0UztQ2Xys1YhGpFtByVMBKDOP6skhjMnax/MYMhfWrmZeQITBB5ouM
 wrHQE52ctNork1PX6zBoiA+35KUx8rwVvcBI0UImox1p5eKLFltFNU8db
 s6WmSC2xTeV9OZGwV2ORA4Xptho9/fa+Ie40UdYYyutgiUltWYEUmK/7F
 Gqcr2fkS9G0SFPxcNYuR4Z+xEYdrAuVebcLA1P/+oiZVIvVKSrwcCV/eE
 R8N+gAPuu/w1tML9XJrsEy/i552Gd3mZ0b92CMaitafDQdDAHV41bEtnt w==;
X-CSE-ConnectionGUID: pEyXDAElSqGP7L3Kf54WPQ==
X-CSE-MsgGUID: XFRvOQkOT8u+Nv16pNg4ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52773889"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52773889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:26:04 -0800
X-CSE-ConnectionGUID: 9KGUSnv/T769ArmWcLG3nQ==
X-CSE-MsgGUID: XxN4CHkCRvOG/ZIxjMg6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121461665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 14:26:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 14:26:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 14:26:03 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:26:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt/UYWf14TZUXhnqjQH8iFqfWPuUsTul2RY4gYHGLJEFybqCoV37TaAMuQ5zMBRRstqnFnWyv2N62b0e6vyc8IYrBEPkfbR76tbgNfXJaRDwWQrWHZ5ZlcyC/E040N3hIm4cse+w2gun3zIU5qeHztA+KRVvLEsksjH76YqEFbCNlfmOSI/3Sa+4Hv+gf7klE35pgKFZcelbCgRd6L0QEjiqQK49aJbkVeURgR5lC7lYW/pIBmO1fPtWt99zDHA2EC+tJoEV+lG+eELTQHWcWZICehvYIYCoks3mcfkIYHxYf2qjqxz0k5iYnF/av3xUjeac7sGFwWMDQc47YIvMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxwMBWZlYWI4NtaVOfxy/0o+zQ1grRAOf13+Ln1VuF8=;
 b=WwrEOIFONwkzZz5QfuPNO4sLtl1tm90CNeU39ebctdPkKS0DDIzCkAcghdG/HU8fyEGmqOMXrNCK6TjbGiLKfy6eUENzfDv90e97dbc6JNQgFqKquFoJOPS6MdmGjSWQZ3CuilQt+fa/vEqa4tkxnJ9wv9+tFjBTMK96WW36pJDdXzKydK8H/dhpbHgvANeQPNeKMl8L3oIH5N6D1Q6yOhmdUHn1dureTjRWLkiF9Kc5clfKknXGVovIj9Y/djJLHlooYeHbGYkNlJ2Ev4ti+GmKsjDPWfLiFGw3VGAjiTUy8zOsUo9nDmy9196aWL34cHby8zy9UPLKfXTnMH9E+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 22:25:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:25:12 +0000
Date: Tue, 25 Feb 2025 14:25:10 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] tests/intel/xe_oa: Rewrite enable-disable test
Message-ID: <Z75DRmb9Th6WkiBj@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <20250215010628.1639986-11-umesh.nerlige.ramappa@intel.com>
 <85ldtukgro.wl-ashutosh.dixit@intel.com>
 <85ikoyka31.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85ikoyka31.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0359.namprd04.prod.outlook.com
 (2603:10b6:303:8a::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c17eec-336e-44fd-23df-08dd55eb452b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzAzczFXckdHZjkvUmpyNlVwcDJ3eDJGRitYTnJEUXVRNUdTc0ZHRHlsdk9v?=
 =?utf-8?B?bUQrOCtmd2pDZnk0RFNldWZrcnk2anZ4UEZGR0NveC83N3ZTYU5sOFNFS0lT?=
 =?utf-8?B?T2RMZjhQNXB0Z0w0Tk5EV3dDUExHN0RGQ3NjUitDRFY1ODczbWt1WUo4b2Jp?=
 =?utf-8?B?NThtOHdERndSaE95b0pqRk40bW5XZ2JzdXNJenRLYXdQb0ZsYWlnNC9ySXhh?=
 =?utf-8?B?dDA5TzJZdTNiUGcybGIyaDZEVTN3WUY4eUJvc0hZZHp6cXpPWHlCSUtlNm1w?=
 =?utf-8?B?b2Zwc3F5U1BmOXowMnZDR2lhUTJpTjhXTmxPYk0xU0lIdW1SRzdKWS9aM216?=
 =?utf-8?B?bjVSckR2bmtFdVVCSnJXd3lOYVJWYUxlOEJKNVJXV1drR1F5T2d4M1pWeVhk?=
 =?utf-8?B?cWZGWTFDMlNGQVB5NHM3cXpXYmt5Yjg3T1preFNJcXdrTlpRTTQ5WGRtdFZU?=
 =?utf-8?B?dlBSUjkwbUg5cytHWlA2azR2dDdobG1KS1loVFhRbmNPejVWSGxTdys2ai82?=
 =?utf-8?B?MlZVNmcvc0NwREIvMnRPcDNFSUcxQ2ZuUTIzQjN4dFZxK29kOWpwN1ZKVkoz?=
 =?utf-8?B?aDZhYXRQT25wbjRvRzhLY3k1SU5iRkFhM29kMDIrZk5CaXBLNlZqZ2NzYVNH?=
 =?utf-8?B?WVFXM0k3VUhTY0xRWFlUS3JHeUdObTZqMEhjU25xaEdkTW5wOURWUzFkdzVp?=
 =?utf-8?B?a0RGOFN1aCtvbUF0dis1a1R0Y0JnS0tNK1h5SHlkK1dZZ1M0RWEyUitnUE1U?=
 =?utf-8?B?WUdpLzIyZlpzakI2WU1jR294Mm9XdmZ0NUJvU211bDZyOHlhM05vVVl1L3F2?=
 =?utf-8?B?ZEhmTlRwaEYzZHBmMU1hSGhqTUYxelVrbXRPNnlPMXdFcGxtK3FRSHFSemE0?=
 =?utf-8?B?SkxBNDJjU1B3OHdCeVF6RFpVTzczYlhSY2pvenUxaTlNQ2FaK0RndCt6Tlc2?=
 =?utf-8?B?NE05eDBQenY3L3dGT1diMmVwRnBxVGtTVXcyWU82QUFnOWxybGJNcXllUitv?=
 =?utf-8?B?aU9UYnVEaEVqQXJ5NkhMckFqRi9kWk1SSU9ldldyOUw0NGNBUmdDY04xMVpn?=
 =?utf-8?B?dnFSayszNmtQdk53emwwV09LYnJ4bWxmR1dzOWdPS3VVZ0pqUE5XcHRLbXFO?=
 =?utf-8?B?NXZNL3poTzhsekg3NnFWdzVsUDlyV2IycHJ2MTFPT21rUnRPdmtyTFdnMm1P?=
 =?utf-8?B?NjlDbHhZTU93eU5DM1FtSlRrS3VPT1pwT3hESXU2VU5acTE2eG1WVUZ3Wklt?=
 =?utf-8?B?cUlxWTRnbVIvUnUvVXduU0JYQ20rT0Y0Nm5pV0hCVldIUmdZSFhwVDZjNmFk?=
 =?utf-8?B?MjQzNHgrbTBTbTRVQ1lDV3ladFJoSHFLaHpQVHQ0bGR0S2FFQ1MvYlR1YUcv?=
 =?utf-8?B?QTBNRllhK1B5WXBsTlFDYjk3dUd5UmxZSVBFcGNxMW9ZazErUzVJNU5udnFw?=
 =?utf-8?B?WHl6Uytnei9aNERoSUdpMnNHeHRZdjZSSnBVU3ZxU3JldkUyS0JUMWdXdTV5?=
 =?utf-8?B?M09ITmZzd3JGUzlnYzdtQzROZkRsNitjV3Y1TnhqZ1lOYnA3TWtYckJxSURH?=
 =?utf-8?B?cUlXSkJ6UGo2V2pJTC96MTU0M0VoVVA0R2w5TXViTkJVMTQ1ZFA3N0JpZXlu?=
 =?utf-8?B?aXRPcm53OG9nak1ZeHI1RXh5bFp3U1VjcHNCYythUUlWWGkrdHZJSnNLVHV0?=
 =?utf-8?B?YVl2dFpCeTJibXA0Tm0xeEgzY015M3I1eUJQQnJQLzVhRCsvSDVwcmY2c3ZF?=
 =?utf-8?B?R0dYLzZ6UXQ4WG5icVdRVEIyMzZEWVI0U0tuSW5JL21lME9INEZ4WnhxMHI2?=
 =?utf-8?B?M0x3RDErcXRmais0SWhHYlY2T3VXS2RDOFZydkgwUFJMMHNISUNTbUl0NlJV?=
 =?utf-8?Q?WzKi+bBAGEJNW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtnMlplZitwMWVCbUtwYndXNW9QL0ZWVXRqT1FrWnZBLzdNTldXOHhRQVBO?=
 =?utf-8?B?UHFrREg3Q1UvYmJGcjZpemVJSFJiUmt6TUtQTlQ0Tk91c2sxMUZ4Qkxzb01I?=
 =?utf-8?B?R1UyZ25HY0pXZHR2K2RSNUJISDAyL1FCNGxZdWdZOXZjR1NJSlFacmZFdm8z?=
 =?utf-8?B?OVVZeCsraUhhTzZ1STdGQjZzWWhjaXo2V09NaGtrcWhPNDhJSG0rVjJwM3Br?=
 =?utf-8?B?Nm8zYjBIWnEwMmZHNC9XUS9sdkI5cnJkT3ZoT3RpeGFLQ2tvNzVRTUJNRmRw?=
 =?utf-8?B?aWN6dk9mVVZCcEFqSDlPbE0vdUxwZ3c4cWdQR0treW1YaG5aSzFDYWJ2aUZT?=
 =?utf-8?B?cVcvTlZDcFpTZ0tGb09DRWJIRTNyRVhkcTU0b2NWZ1IzTm4wN1ZYN2RiQzMx?=
 =?utf-8?B?WGdvRTlDbWVCWnBUWmQ5Ym01a2VYVzNCVnZnWFhRalpFaHZYRlFiTTVNTkYy?=
 =?utf-8?B?VFEvYVlKclhxU3dQd3drTUlCbThmYkdhVTRNSFo3RFpyYUF0anNkTWV5V1p0?=
 =?utf-8?B?MVg0SHhweU9xYlhHUmdJeXVVTmpqN2tvS2RML3VhMTRJQUVqbUgyNkozblFw?=
 =?utf-8?B?TTFiajFDWFJwTUZCY1pvNlp4WmdLVWJNdGI2SVNXYm5Qa2FsZXFGdlY5NDMx?=
 =?utf-8?B?bE05TzNya2pwUGhFSlNKeUEyTEJVVlFuaCtZcHRZbzFPaTZLSExaVE5PMEZH?=
 =?utf-8?B?WXdLTGVsVHE3dzlXSjJmd0JHclRXTlU3OWh1dUxCR0V1MFRJUXRoRFBIVDlK?=
 =?utf-8?B?cUVhVW9paTNOZDV0RTFmMW1HRFBmSm9IMmRkYnJBV1dkdVIxZDczN1dVOVEy?=
 =?utf-8?B?SHY3Zk9XazUzbFNlZWdEbng2NkczVzE4ajFkQkJ4d2pZL2xDTUp3WStrbmdl?=
 =?utf-8?B?SE52azYza0wxZXhpaGFuSWVuZ1BqejEyajhzeEpLQnBNTXlVZXVDSEdCaGVi?=
 =?utf-8?B?MEUzc01uOU5EQVk0V3hkeGNIR0dEeXRMYlJxTE5CSDhXZ0VpK2c4cmNtSDNj?=
 =?utf-8?B?ek5aM09vaW9uMXhWZzJ3WFB6V01rUVpDSjRIcGdkT2IwRWdsWDVMUEk3c1U1?=
 =?utf-8?B?Q3pia2ZnakdwRnZJdFY2OS9pZVlTZzRWY1VwbThBemlDVkVQSk5yYzVpNE1B?=
 =?utf-8?B?dE5OTWh0RzBSbTJQVlpsWEdCM3BnQlJZV1dJOFB6UGdYLzdDWkNSc1hvTmZD?=
 =?utf-8?B?Nnp3SVRtQkZ0eGQyUGNxUFJXOU5PbGluZUpjSFRuUEdKWjVldTJoOHZMRCt5?=
 =?utf-8?B?LzMyWXhZaTdmM3Ruc3FmOGc3Y0dWc0RWeDhBYWFJcGlNTThmcTBOZVNKK2pU?=
 =?utf-8?B?RnVmSGI3V1FRZnFpOU84c1JER3BkdjcvS214Y2hoU0tkWnhGRmEwbU40NWpl?=
 =?utf-8?B?cHpYYlB2cEJIZ2YxdkRCbmR0TExLWVduQ3NpUVp4OFFLVklpYTQ1UnE1SDY1?=
 =?utf-8?B?MExRZXpPYVh2NGxlMy9hK0dPUk90NUxNMWxybW9jbWtuLzdBaWY1eWo2YVBU?=
 =?utf-8?B?TTBNRFMyY0xHcTlyT3labG55TUU0U1RnYlJGdnBzYzUrS3EvU0FVUmwyWUZR?=
 =?utf-8?B?ZUNvcXdGNXE5cHR4QnhzL1hDZWYzY3pXTWl4YnVjRm1yQ0dFTFBuZDNCNWsz?=
 =?utf-8?B?bEdNa21XazB3OFFJb2twakRXQ25raXdRQzllMGQ1NzhRUitrSXRNdHJZbGpB?=
 =?utf-8?B?Mk13QWgwNHlLQzdrSlh6OWhsbTJGYXFiTWRWdDZIU1BrZVFRSXVMMVNrQ3E0?=
 =?utf-8?B?RmZOL2dUVmZGRnZqdVp0SktqOGNvWlFxejhIcXg5SXNWZ0QzQ0hoUGx5Qktp?=
 =?utf-8?B?QlRGRXFBRGhqbXBEcUFkOHRzeE51anZvaXF1MGlyVXJVMzVmTTRsbDZuUC9F?=
 =?utf-8?B?TTZvdSt2TjZUOWVaSXV4a2RxaUhzbXpDUFM2Ykl3Q0VhejEvOG1GZktlNk4x?=
 =?utf-8?B?NTFNU1lFc0RyNDFjTE1mMmhKZyszWGo5Znk1Z0UvcWFYRnFudDAwVEx4eDBF?=
 =?utf-8?B?NGRWVjVFM0hud1kwektBMnJ0TWU5Y2pjVWJGbk4xTVhNbVV5cmVEbGFDQjhJ?=
 =?utf-8?B?ZzV1SWF4SWVSUGJoZmRBa3dZOEpCTm83L29XdldNa3dDTFVzd2sySS9aVTEw?=
 =?utf-8?B?ZmpXYXFLb1NyQjJielQyZ21JQW9GV1pYSFpiR2JnOGlZeHdjWVcyVldpL0FL?=
 =?utf-8?Q?KYIdvPaYKjs1aFheNG50pHA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c17eec-336e-44fd-23df-08dd55eb452b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:25:12.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWmUPj/1F3vYli/iff8sQppHf0onNIpuWLTkb3xrCyDHyPbpOs49ZN4i4C+9a7SWnV5iW4zY6PtWA9Jh3T5jdCoiyALFMDYr0Mb2Dvtn4do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
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

On Mon, Feb 24, 2025 at 06:54:42PM -0800, Dixit, Ashutosh wrote:
>On Mon, 24 Feb 2025 16:30:19 -0800, Dixit, Ashutosh wrote:
>>
>> On Fri, 14 Feb 2025 17:06:25 -0800, Umesh Nerlige Ramappa wrote:
>> >
>> > Keep it simple and just check if enable/disable is working correctly
>> > using mmio.
>> >
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> >  tests/intel/xe_oa.c | 129 +++++---------------------------------------
>> >  1 file changed, 13 insertions(+), 116 deletions(-)
>> >
>> > diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> > index ee87b7338..c6c1c2358 100644
>> > --- a/tests/intel/xe_oa.c
>> > +++ b/tests/intel/xe_oa.c
>> > @@ -2534,21 +2534,13 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>> >  static void
>> >  test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>> >  {
>> > -	/* ~5 micro second period */
>> > -	int oa_exponent = max_oa_exponent_for_period_lte(5000);
>> > -	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>> >	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>> > -	uint64_t fmt = test_set->perf_oa_format;
>> >	uint64_t properties[] = {
>> >		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>> > -
>> > -		/* Include OA reports in samples */
>> >		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> > -
>> > -		/* OA unit configuration */
>> >		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>> > -		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> > -		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> > +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>> > +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>> >		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> >		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>> >	};
>> > @@ -2556,123 +2548,28 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>> >		.num_properties = ARRAY_SIZE(properties) / 2,
>> >		.properties_ptr = to_user_pointer(properties),
>> >	};
>> > -	size_t report_size = get_oa_format(fmt).size;
>> > -	int buf_size = 65536 * report_size;
>> > -	uint8_t *buf = malloc(buf_size);
>> > -	int n_full_oa_reports = default_oa_buffer_size / report_size;
>> > -	uint64_t fill_duration = n_full_oa_reports * oa_period;
>> > -	uint32_t *last_periodic_report = malloc(report_size);
>> > -
>> > -	load_helper_init();
>> > -	load_helper_run(HIGH);
>> > +	u32 oacontrol;
>> >
>> >	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>> >          set_fd_flags(stream_fd, O_CLOEXEC);
>> >
>> > -	for (int i = 0; i < 5; i++) {
>> > -		int len;
>> > -		uint32_t n_periodic_reports;
>> > -		uint64_t first_timestamp = 0, last_timestamp = 0;
>> > -		u32 oa_status;
>> > -
>> > -		/* Giving enough time for an overflow might help catch whether
>> > -		 * the OA unit has been enabled even if the driver might at
>> > -		 * least avoid copying reports while disabled.
>> > -		 */
>> > -		nanosleep(&(struct timespec){ .tv_sec = 0,
>> > -					      .tv_nsec = fill_duration * 1.25 },
>> > -			  NULL);
>> > -
>> > -		while ((len = read(stream_fd, buf, buf_size)) == -1 &&
>> > -		       (errno == EINTR || errno == EIO))
>> > -			;
>> > -
>> > -		igt_assert_eq(len, -1);
>> > -		igt_assert_eq(errno, EINVAL);
>> > -
>> > -		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> > +#define OAG_OACONTROL	(0xdaf4)
>> > +#define  OAG_OACONTROL_OA_COUNTER_ENABLE	(1 << 0)
>> >
>> > -		nanosleep(&(struct timespec){ .tv_sec = 0,
>> > -					      .tv_nsec = fill_duration / 2 },
>> > -			NULL);
>> > -
>> > -		n_periodic_reports = 0;
>> > -
>> > -		/* Because of the race condition between notification of new
>> > -		 * reports and reports landing in memory, we need to rely on
>> > -		 * timestamps to figure whether we've read enough of them.
>> > -		 */
>> > -		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
>> > -
>> > -			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
>> > -				;
>> > -			if (errno == EIO) {
>> > -				oa_status = get_stream_status(stream_fd);
>> > -				igt_debug("oa_status %#x\n", oa_status);
>> > -				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>> > -				continue;
>> > -			}
>> > -			igt_assert_neq(len, -1);
>> > -
>> > -			for (int offset = 0; offset < len; offset += report_size) {
>> > -				uint32_t *report = (void *) (buf + offset);
>> > -
>> > -				if (first_timestamp == 0)
>> > -					first_timestamp = oa_timestamp(report, fmt);
>> > -				last_timestamp = oa_timestamp(report, fmt);
>> > -
>> > -				igt_debug(" > report ts=%"PRIx64""
>> > -					  " ts_delta_last_periodic=%s%"PRIu64""
>> > -					  " is_timer=%i ctx_id=0x%8x\n",
>> > -					  oa_timestamp(report, fmt),
>> > -					  oa_report_is_periodic(report) ? " " : "*",
>> > -					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
>> > -					  oa_report_is_periodic(report),
>> > -					  oa_report_get_ctx_id(report));
>> > -
>> > -				if (oa_report_is_periodic(report)) {
>> > -					memcpy(last_periodic_report, report, report_size);
>> > -
>> > -					/* We want to measure only the periodic reports,
>> > -					 * ctx-switch might inflate the content of the
>> > -					 * buffer and skew or measurement.
>> > -					 */
>> > -					n_periodic_reports++;
>> > -				}
>> > -			}
>> > -		}
>> > -
>> > -		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>> > -
>> > -		igt_debug("first ts = %"PRIu64", last ts = %"PRIu64"\n", first_timestamp, last_timestamp);
>> > -
>> > -		igt_debug("%f < %zu < %f\n",
>> > -			  report_size * n_full_oa_reports * 0.45,
>> > -			  n_periodic_reports * report_size,
>> > -			  report_size * n_full_oa_reports * 0.55);
>> > -
>> > -		igt_assert((n_periodic_reports * report_size) >
>> > -			   (report_size * n_full_oa_reports * 0.45));
>> > -		igt_assert((n_periodic_reports * report_size) <
>> > -			   report_size * n_full_oa_reports * 0.55);
>> > +	intel_register_access_init(&mmio_data,
>> > +				   igt_device_get_pci_device(drm_fd), 0);
>> >
>> > +	oacontrol = intel_register_read(&mmio_data, OAG_OACONTROL);
>> > +	igt_assert_eq(oacontrol & OAG_OACONTROL_OA_COUNTER_ENABLE, 0);
>> >
>> > -		/* It's considered an error to read a stream while it's disabled
>> > -		 * since it would block indefinitely...
>> > -		 */
>> > -		len = read(stream_fd, buf, buf_size);
>> > +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >
>> > -		igt_assert_eq(len, -1);
>> > -		igt_assert_eq(errno, EINVAL);
>> > -	}
>> > +	oacontrol = intel_register_read(&mmio_data, OAG_OACONTROL);
>> >
>> > -	free(last_periodic_report);
>> > -	free(buf);
>> > +	igt_assert_eq(oacontrol & OAG_OACONTROL_OA_COUNTER_ENABLE, 1);
>> >
>> > +	intel_register_access_fini(&mmio_data);
>> >	__perf_close(stream_fd);
>> > -
>> > -	load_helper_stop();
>> > -	load_helper_fini();
>>
>> The sync tests actually change the config on an open OA stream. However
>> they do it without disable-enable. We could add disable-enable there, but
>> still those tests only check for the syncs to signal. And the syncs signal
>> after a delay after the OA config is applied, not when disable/enable
>> completes, so those tests wouldn't check for enable/disable.
>>
>> At least here we have some basic testing of enable disable. So this is:
>>
>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>Actually, I want to question the "wisdom" of bypassing the uapi and
>verifying something by this sideband method or direct register reads,
>clever though that method is.

Since this use case is privileged, I thought I might as well check stuff 
using mmio compared to cooking up complex logic to do so. Also the logic 
needs to be simple enough to run quickly on all platforms.

>
>So for example, another way to simplify this test is:
>
>1. Disable the stream and check that read() returns -EINVAL
>2. Re-enable the stream and read() a single report
>
>So why not do just that?

Sure, I did not think of that. Looks like EINVAL is also returned in 
read if stream->sample is not set, but since our test already sets 
sample, we should be good with that. I can change this test to do that 
since anyways, this is only testing basic stuff now (see below).

>
>Fine we verify the register bit here, but the uapi is more than the
>register bit. Verifying the uapi as indicated above verifies that
>re-enabling the stream actually returns valid data, which is more than the
>register bit and of which the register bit is a subset.

There's more to actually verify in this test, but the uapi itself does 
not allow that - i.e. check that enable would have reset the OA buffer 
tail/head/status etc. Sometimes users use it to restart the capture.

For now, I have kept it to bare minimum. We can add additional coverage 
in this as we test more stuff.

Thanks,
Umesh

>
>So not sure.
>
>Thanks.
>--
>Ashutosh
