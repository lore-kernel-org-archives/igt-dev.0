Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6942ED6ED0E
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C9410E3F3;
	Thu, 21 Nov 2024 12:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oK+zu9zU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92C10E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190922; x=1763726922;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YXXOAM12zQLr3E1Dv916pieLJ1tbQY/9K7r0Jn7uNjc=;
 b=oK+zu9zU8j0P0R1z/4uZBLvvI++/smgX0HlRPToyTDJhFByfnVhk2d22
 EhgcgZU7RFrLHBUeZcSEHHuKmrhsaL18hmCym6oSBa+EE8DR3A63ujJiW
 F8Bk55qXDicVd7QwajIy2l/aSJMmz9uvMCi73CET0M7plxeJXrnnsOKUN
 0VpaZZpe+GTSid40Xl4KLaRq4BfNnnOfPJFsZBAQwphn9CVKCAphUNzJr
 71N141YFU2h45n6enPxRz9LR4060C9qNw5Jp9tqb01kX4Bie0S0+t6/Y2
 t/IVggF9B1xceCr+TnEZzIWvqGy1tBZlBfYSvRHSwSL7iRv8CrU9iNnY+ g==;
X-CSE-ConnectionGUID: oB8GzLTfS/moAw7HZtjZOw==
X-CSE-MsgGUID: htRDWKZVTVKCYKfCVSXncQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32353472"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32353472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:08:42 -0800
X-CSE-ConnectionGUID: tZgWMDsHTbO46QK8si0cIg==
X-CSE-MsgGUID: vQudR+xPQCaKACwKp6kAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91047817"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:08:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:08:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:08:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h89J2rOysgEmA1Cjeg+kpveXuwj3x7L7vJeq8pKGF4X4qIb/MJUXSKUjl1Vk4vOFrPsyF9tfho2OJFRio0AC6UBqjiO9HXl0cFXkfamtoHuN19HyBw3Y9qOfyvaerOEgHulc/E9RMLvJ5SEI4Tk7JdDZtfik3QByk9wb/nlA+aDYHH5yr7qWtzo1n/GSEbWb2nn/L164g9Yb/yknpiKCGU/OYbgVtGASl/FIuXJko4m3JAq6kWgk0STiZHH6oJcbgfRba3+Xn3VkSsO917wrLXRhfKiNjos8NnQeB+5crdBL6u+EKM5flLgF0vXuhEOKkgwb8+9+5WjcxrNYNk2GNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEHRBwmPh0atfn2X6f+xydyvUz09KvN2vVrNoWL9YLE=;
 b=SzqUOygQvC/fTXODvWnQBbGfVR8cyNjHiXc+93MYAXQBrTcSstNh2/r3xKt48yDUpCX8nvYAzN3xOcVhD76enspsyx+Oi4lbeax60K+bRLLHHjSBKzsbwm56Ur+m6iV+IzrzC8uVfJi9jfNBzqRNJI1QeLWs/caJtdI1LsvmZqOHwjdePtCGbs8DLitmtx2BTVvu9NmNwqkPjg5J1LEOIiYF2iKKADy58asAu6t+3e0MaO/jXs7HrLi4YbNVOTH2ZhTuOGnidn68xjJd5ixCOY21VKW1Tcymwyoy1PlCY1uG4wvBAP/un875zV6MXJ5+6dywq1BDblsL5ky4uFT5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:08:37 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:08:37 +0000
Message-ID: <92d171e8-3325-4956-90f8-7e5b6cccd252@intel.com>
Date: Thu, 21 Nov 2024 14:07:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/gpgpu_shader: Add causing a read pagefault
 from the eu thread
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
 <9b4d1bd7-9918-48aa-85cf-3ad6c1cb90ac@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <9b4d1bd7-9918-48aa-85cf-3ad6c1cb90ac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 7accdf35-054a-488c-9741-08dd0a253aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW5pSTM3bDdXSXBJbEN6NC9oVzBiTnZ4blFiT0hHbC94UHBwK0N5bjFWZ1ha?=
 =?utf-8?B?bE8vZU1rMlVNbDRLTDQ3WjNMellCMC9XWXh1OGc3a1lFMTVOWXlwR2pZYUg4?=
 =?utf-8?B?QTFHMWgrei91SXZ2SXFLK3doL3AzR0Fsc0pZclgzMThkWVFHMEZZWXpDVVpP?=
 =?utf-8?B?UmtTTUN5T00wakNlcVZacjhRTHFGcGIyYXc5U29QMGgyNEpMOGlQT0tyN0VI?=
 =?utf-8?B?Z3FkL1AyRW5SUStBdEs1NlFaVU9YbGp0bDIvbGNETkg0YzBkVDFjOUhSazNi?=
 =?utf-8?B?ZWFzZ3VDaXpnYjNtbEk0K09qUVpaZmZFZC93eU5xRjRoK1B0YlVZUkd1aW1S?=
 =?utf-8?B?VnBwQmpMcmpnSUFhbW1Tc0Z5Mjd1aEhKYjkxd20ybnRtY1JXT0hTSm9QUk5F?=
 =?utf-8?B?ZU9SQVdWZFR1TThINmcyV25OVUlZM1RzcGdZaWk4Ulg4T2FHMHRvcWRWeDM2?=
 =?utf-8?B?QXJ3QkdSLzYyZzdoVXJiakZ0ZkVUUnFwZ2tBOHRpU1VKUk4zODR4aVNhRXBU?=
 =?utf-8?B?MVZYSXdHemNhMC9aT2J1bFlGVVpkQ1VucDVzOUNyQUhWOEFla0kzUUhSWmp0?=
 =?utf-8?B?OHAzeGVvUkYwYVhsZzJJZ0Z0OHRsb05LZVU1TGtMb3oyVWtOUzVxdVAydkxt?=
 =?utf-8?B?TStidHlmREZzTFhFd1UwWUloTmJZR2VTMDRlZzV3WkJkaUI3dkxZQm1Cay85?=
 =?utf-8?B?cXd3bERZNXh5ekhIN0ZJL0Y2SmNYbmw5WUVpK0dZWkpRZlVSeDl3MFNGUlUv?=
 =?utf-8?B?MGNYWHJMblI2MitWWXpZa3ZKWFZBUVRQZjdETFFSWWVxMXJ1L05mNEt6RjVX?=
 =?utf-8?B?OEdzTDgrTWptdFRXak5LVmp6N0FzL2t1M3BmNEFvT1FhbHN6TlF6ZFVrQkVt?=
 =?utf-8?B?V3l5dHVEM0dJbXVyNVVaaml2THVLOWJuVk5uRExjcFllOW1DVEgxWURiV3ov?=
 =?utf-8?B?dVZueUk5OWRqblJMYUNPSGNEWHMvbWMwTVdUSHBtRzhBMlQzL2kyL1owdEM1?=
 =?utf-8?B?WnpLWDNnNmprZ2U1TCs1VHM0Qk4rZUsvQjlhM215K1NYSnd3US9GQUttdzFk?=
 =?utf-8?B?OGlYZ0hHbW56TjRMU20vUmNvTmhzSG5jYzlWajlPY3hqeEw0RW95R0g2ZmdL?=
 =?utf-8?B?S3NIWHJFclNXTW81L0NGMGlaUWdCQ2JYQ2tEZHBuV3RFdm5hbnc1YzY3a0c3?=
 =?utf-8?B?OHZDN0hqaEVERXcvdU1UWUhUdDN6TTNPQ3lGS21aTWZGMDY5ZFRiZEtla0Jm?=
 =?utf-8?B?eHFCSlhzYklrUXJkTUFkY1R5NUZmeE53ajkzYldkMk03V1NxTmxoaVJmcmJw?=
 =?utf-8?B?bW1iZk9tUzRWR1NkdW9FcFV6QlVTdHZVMy9FRUFtUXdnMjhBMkIzbFRFNzVS?=
 =?utf-8?B?RjU5RTNkd3pFRDNEeFhvZ3VmYXJZcU1YSHd4cnR1TzkveEVlbG0wQU9hQXFS?=
 =?utf-8?B?WE5nTjBjUExreFJPMEp0RXg2VE0vWFZrcVFIeVIyUThkUnRibzJ6OEdnelI3?=
 =?utf-8?B?NFV4OHB4L2h6TEd6RlVNSjU0TDYwV2pVZHNLWVYza2tZYXc2b3V5Wk1CNFlz?=
 =?utf-8?B?aUZTSGhpOUNQWlJqUjRZWTlZb0wzVHNjSzZwK1Z0NVd4VmVheDBmNDBFVmlz?=
 =?utf-8?B?aFByaWNyNG1lMy9RTVUvT3dkQ2svbUU2aExCSzZ6L09SamxoeXoxRXN2U01n?=
 =?utf-8?B?Z0xJaGJGZE1FcUF4MGJiUHprL3pOZGhxNEdIMU1ycUhLeWM3b05OU0o5ckJq?=
 =?utf-8?Q?X1ln/KcAZY/EKtUPntM0SIlDJodWDffCq8GO185?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJRNG9wVTh2VC9UNnRSaHYrenBYekp4VnVuZmJ3QjRoTXlXK2pVOWY1dnhK?=
 =?utf-8?B?aEREcVo1Q2Q2NnFEVHJORTU1OHZtZTI1WTlyQ2dJb29TQjhINGRXcFNleEp1?=
 =?utf-8?B?NmhHcW8rVnBwd0xwR0FOQXVCRmpUay9PdkRpTmF3QUVGTGhLK0JKcDNmOEpN?=
 =?utf-8?B?Q05tbUlqbjN2Mkl5bGlBL1RWUURTSzlxbHJQbHpjaUxDVndSZWZSSlczcWFQ?=
 =?utf-8?B?ZXFJRGxVcHNYaFIzNCt5UXpQOE1yS3FmdjRuTnZsek5PdklWR3ZHYzIvbTlU?=
 =?utf-8?B?Rm9FY1kxcU5ia1N3bmMzUWV4MzJJQ1JZb29mZzZQaTFHWGNDNUcyWGs5NUtL?=
 =?utf-8?B?Nk9XS2JQS3dEMkEwUWhtakhUd1dwV2xaT0xMZkxsLzdycktlZkFHZVBKeGV2?=
 =?utf-8?B?T0F6cU1NSU40bVZRclhUWG9lT2ZvQjIxOFdLMkdvNTQ5YVNBN3JUZ0JCNTlv?=
 =?utf-8?B?dEtsaVowTXFoNFBrZVp5NU5VZCtyK1pJWWJRT3RNazI2elZjMEVxU21NNkJs?=
 =?utf-8?B?aCtxdTZkT3o5eU5VbDJMM2hFVkpmc1FFaEpoOFg4OUw4Ui9SdHFYSnhyRmhi?=
 =?utf-8?B?UGp0MEw1VkdxQ2Z2VGVsVXlBVFNQS2dNcFI5eHZ4eUs2MUZxaVRUV2lFSjhy?=
 =?utf-8?B?Tk9rbnhIK2ovT2E3dkFRWVdnbUdPdTlIcjNOQzNEY3FrZlkvcHI1RGdpc2hv?=
 =?utf-8?B?WHZLNmlYbGNZalg2Q1VOQ1g0bG9PZHp1TFlxTEhkd1FxMG9aRU1kdCt3TUdt?=
 =?utf-8?B?T0J4TUducnFFWHpndWN3S2lrUHowckZGVG9yeTFOV3g5Vkg5b21Edk1RWTZE?=
 =?utf-8?B?YVRnMFpkejE3c2pGVnpYT1ZsSFZKc2JLZFN1YlZndGJJc0tIV0xzekNENWM1?=
 =?utf-8?B?Z1dkcDFTKzZNdDc4NWNRUG9PWUUveGp6S0ZOdXhMUXRSWDFLa2tEdlY5Z1Qw?=
 =?utf-8?B?Y08wVW9VWnZxZkhGOFNtOXl0V1lMWUpac2xIVXRWVE9rd29NVUY2QUhBY2Zm?=
 =?utf-8?B?VlM0M0d0WFZIenpxbUV2OTJQMkV1a1M2WkN1RDI1T285MEZVYlI3aFRkTktn?=
 =?utf-8?B?KzNVSGxTbnBEOFJrU0IzWk96ZmdidjA2ZnlIZzlITnVtNDFRZGF4dW1Ta25P?=
 =?utf-8?B?b2p6RkU3ZU16cVQzbWVucFpTaE5SQTFLV1pmZlQ3QjRGdmttNTVVNkZ6bDZv?=
 =?utf-8?B?WFVZZWNnbXdnNndLQkNUZTRUOGNLbHRNWkVzVzZTZGs2d2RseWtiR0NkaHFN?=
 =?utf-8?B?UTZjSGZCYzZNTTFEZ2VWWlBhQWhpVFE5b01KaHRyTjBROXltOHNEQjd4RHNu?=
 =?utf-8?B?WnBKQ0VKeU94dHJmeWg1dEZwaHFTSFNETDRsQlJiTzZxYzUyeFBtZ2o5KzNF?=
 =?utf-8?B?UTZxcFBQcExTR3BjdGFScjcvRHV3eExyekw5UnVnVmg4bkxLa0JFVE1tOUJ2?=
 =?utf-8?B?WXpVaXpuOEVxY2VSNTBzbE1sTTdNYW02dU95aWg5WWppWUl5NmYyRmF1WE9L?=
 =?utf-8?B?azl1SnN0OEZ5eGw1MitqZFcvWE1rK2ZPWlZTbnZiK25GR2dQSlJaUkp0YWRD?=
 =?utf-8?B?bmdvUFZWczR1SVFNRVh2Y21tS1RxMGcyYWc0WG1DOElMaDJiUnFNblFNRnlG?=
 =?utf-8?B?cllWN05TTmIydEVqajRWbHk0bEorcERHalI4YVpSa0dxT3FidnhZRTYwbnpN?=
 =?utf-8?B?OEtWcnZLdHI0MVBjV2szdnROMW42VmNsQ2hsYTBzNEt3c1RWL0U2ZklKNjVx?=
 =?utf-8?B?dFFESWdCemMrV0M5b1VLQWtaU3M5UkoxTlBxRGlkbk1selZuNFJWL0hrUzRB?=
 =?utf-8?B?OHJZNkExdnYxRE1nU3pyeVVqQUpHNmZyR2prTWJDUUtKWnVDWW5wKzFhZWNZ?=
 =?utf-8?B?bWhuQS9MMFBRNjJiNUFYS2gwejE0cnN4enE4Zy9mMys5cktLMkxjVmd6eXIv?=
 =?utf-8?B?MEp4SXNBdTVRWkNDdDQrd1hnemFBYWFTS1VSbzFmbzJnQVJ6M2JDaVBXTDlS?=
 =?utf-8?B?QjE3UlpiWllpT0FtNG9JZldSRks4UVBickpBeW0raEVYeVh2VXFlNDRPbzB0?=
 =?utf-8?B?NkhPMnZzZENmclB5NU0rUkx3elV5SnYrYTZtZmZkdTlSaWpnT0hoWnBhS1Jw?=
 =?utf-8?B?eXB2eENLU3RuMUpnY1NQeWRyZGt4Qmx2OGtNSWpGK2pVeTRvWlhUa24zRjJ5?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7accdf35-054a-488c-9741-08dd0a253aca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:08:37.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LSDO7GjsitpfuQ3SA70H6GubMcSS/KS+MMpTOiNgyciaBSKetev0xRmFXeG2DFcRwsMZwYyCNb+hSbxRh0hZOyvQ35r0leLYw2/4DLGYVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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



On 11/19/24 1:38 PM, Manszewski, Christoph wrote:
> Hi Gwan-gyeong,
> 
> On 15.11.2024 15:11, Gwan-gyeong Mun wrote:
>> Create a function that causing a read pagefault using the eu thread load
>> instruction. If the given ppgtt address points to an unallocated ppgtt
>> virtual address,  this shader can cause a read pagefault.
>> To directly use a 64-bit address as an argument, use the
>> Untyped 2D Block Array Load Instruction.
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 92 +++++++++++++++++++++++++++++++++++++
>>   lib/gpgpu_shader.h          |  1 +
>>   lib/iga64_generated_codes.c | 21 ++++++++-
>>   3 files changed, 113 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 7a2f0d28d..d7c47be80 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -912,3 +912,95 @@ void 
>> gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>       ", 0x807fffff, /* leave breakpoint exception */
>>       y_offset, value, 0x7fffff /* clear all exceptions */ );
>>   }
>> +
>> +/**
>> + * gpgpu_shader__read_page_fault:
>> + * @shdr: shader to be modified
>> + * @ppgtt_addr: ppgtt virtual address to raise pagefault
>> + *
>> + * For a given arbitrary ppgtt virtual address, it raises a pagefault 
>> using
>> + * the eu thread load instruction.
>> + */
>> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr)
> 
> I admit I haven't read much into the assembly however a question about 
> the naming and intention of this function comes to mind - why does this 
> function carry the "read_page_fault" suffix? Isn't this supposed to be a 
> complementary "read" function to the previously introduced 
> "gpgpu_shader__write_offset" function?
As I mentioned in another email reply, I'm going to change the naming of 
these functions.
> 
> It seems as if they both should just allow to read/write a specified 
> ppgtt address and if it isn't bound then a page fault will occur. If 
> that is the case I would suggest to use some matching naming, like 
> "__write_ppgtt_offset/__read_ppgtt_offset" or some variation of what 
> Andrzej suggested.
> 
> Thanks,
> Christoph
> 
>> +{
>> +    /* pagefault ppgtt virtual address */
>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>> +
>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>> DWord!\n");
>> +
>> +    emit_iga64_code(shdr, read_page_fault, "                \n\
>> +#if GEN_VER >= 2000                                \n\
>> +// Unyped 2D Block Array Load                             \n\
>> +// Instruction_Load2DBlockArray                            \n\
>> +// bspec: 63972                                    \n\
>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>> both        \n\
>> +//    the block parameters and the 2D Surface parameters.            \n\
>> +// Untyped2DBLOCKAddressPayload                            \n\
>> +// bspec: 63986                                    \n\
>> +// [243:240] Array Length: 0 (length is 1)                    \n\
>> +// [239:232] Block Height: 0 (height is 1)                    \n\
>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>> +// [223:192] Block Start Y: 0                            \n\
>> +// [191:160] Block Start X: 0                            \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>> bytes)            \n\
>> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)                
>> \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>> bytes)            \n\
>> +// [63:0] Untyped 2D Surface Base Address                    \n\
>> +// initialize register                                \n\
>> +(W)    mov (8)            r30.0<1>:uq    0x0:uq                \n\
>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>> +(W)    mov (1)            r30.0<1>:ud    ARG(0):ud            \n\
>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f                    \n\
>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)         r30.2<1>:ud    0x3f:ud                \n\
>> +// [127:96] Untyped 2D Surface Height: 0x0                    \n\
>> +//        (Height minus 1 (in number of data elements) of            \n\
>> +//        the Untyped 2D surface, it represents 1)                \n\
>> +(W)    mov (1)         r30.3<1>:ud    0x0:ud                \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)            r30.4<1>:ud    0x3f:ud                \n\
>> +// [231:224] Block Width: 0xf (15)                        \n\
>> +//         (Specifies the width minus 1 (in number of data elements) 
>> for this    \n\
>> +//         rectangular region, it represents 16)                \n\
>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>> bytes).        \n\
>> +// [239:232] Block Height: 0                            \n\
>> +//         (Specifies the height minus 1 (in number of data elements) 
>> for    \n\
>> +//         this rectangular region, it represents 1)                \n\
>> +// [243:240] Array Length: 0                            \n\
>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>> messages,    \n\
>> +//         must be zero for 2D Block Store messages, it represents 
>> 1)        \n\
>> +(W)    mov (1)            r30.7<1>:ud    0xf:ud                \n\
>> +//                                        \n\
>> +// dest data payload format is selected by Data Size.                \n\
>> +// Block Height x Block Width x Data size / GRF Register 
>> size            \n\
>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>> +// data payload format size is 1 GRF Register.                    \n\
>> +//                                        \n\
>> +// send.ugm Untyped 2D Block Array Load                        \n\
>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                \n\
>> +// Execution Mask restriction: SIMT1                        \n\
>> +//                                        \n\
>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>> Block)    \n\
>> +// bspec: 67780                                    \n\
>> +// 0x0 =>                                    \n\
>> +// [32:22] Global Y_offset: 0                            \n\
>> +// [21:12] Global X_offset: 0                            \n\
>> +//                                        \n\
>> +// Message Descriptor                                \n\
>> +// bspec: 63972                                    \n\
>> +// 0x2128403 =>                                    \n\
>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>> +// [28:25] Src0 Length: 1                            \n\
>> +// [24:20] Dest Length: 1                            \n\
>> +// [19:16] Cache : 2 (L1UC_L3UC) 10                        \n\
>> +// [15] Transpose Block: 1                            \n\
>> +// [11:9] Data Size: 2 (D32) 10                            \n\
>> +// [7] VNNI Transform: 0                            \n\
>> +// [5:0] Load Operation: 3 (Load 2D Block) 11                    \n\
>> +(W)    send.ugm (1)        r31    r30    null    0x0    0x2128403    \n\
>> +#endif                                        \n\
>> +    ", lower_32_bits(addr), upper_32_bits(addr));
>> +}
>> \ No newline at end of file
>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>> index 355b128b5..318550c52 100644
>> --- a/lib/gpgpu_shader.h
>> +++ b/lib/gpgpu_shader.h
>> @@ -87,6 +87,7 @@ void gpgpu_shader__write_offset(struct gpgpu_shader 
>> *shdr, uint64_t ppgtt_offset
>>                   uint32_t value);
>>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, 
>> uint32_t dw, uint32_t x_offset,
>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>> value);
>> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr);
>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index b23613ac4..53a705358 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   #include "gpgpu_shader.h"
>> -#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
>> +#define MD5_SUM_IGA64_ASMS 01290b5ecda7a6e765463558d6f59952
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] 
>> = {
>>       }}
>>   };
>> +struct iga64_template const iga64_code_read_page_fault[] = {
>> +    { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> +        0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
>> +
>> +    }}
>> +};
>> +
>>   struct iga64_template const 
>> iga64_code_end_system_routine_step_if_eq[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>           0x80000966, 0x80018220, 0x02008000, 0x00008000,

