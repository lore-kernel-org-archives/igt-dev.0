Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B302CCD19B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AECA10E1D0;
	Wed, 18 Sep 2024 10:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WU7LpFgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670C010E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726656746; x=1758192746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vn3aGPpsyN90THYoc0OF65FOOOTzBTKI9eL8Op9z2aw=;
 b=WU7LpFgFTNrXkkpLKF5/0geh/4JZugsVk6i7GPus8Iz04Vb0dwTbsHs1
 azgEaFHtLon5MblsOw2WxtGHSYR9XqezPLIKFRJB48fMBzTBLGAIhY5g9
 BCqvaps/akL/t9JzRL3bh3uCD4ogDlar49lifLAjpNG2UXhe0pQJAFAgh
 oC1yRy1GyWfVANs7+ZRzUjdRmEOEk26Zu9H6VI3MchHa62+5epFRdvGe4
 7bwxBvR7mao3Sts8p5maT2TuWlhTC0OW4jz8TzgWpUniKStfDkCB3hy0x
 wzX7Go/LQL6YtqRXBfKgi0uunktPemlxwyYpx3euDoaIUVEO8ZxzW2w0f w==;
X-CSE-ConnectionGUID: VyRw/a1uRXOmxsyOFSV2ww==
X-CSE-MsgGUID: lTlv5N5BTFWRwjHwlK40uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43031718"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="43031718"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:52:26 -0700
X-CSE-ConnectionGUID: sTloi4nBQpyHfS/JS7ZR9Q==
X-CSE-MsgGUID: Knt08/+/QHmKWm/AD5KRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100333443"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:52:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:52:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:52:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:52:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs39M6gYq2rzrzZ8uUKj5P0/r7n5HMkqRY7G7xkUu9SeeYXIJcwsmvQ2jlZRovN3h2QBSfHsbnkiLrQOrYeNEU2J56OadbwB4N62fS+f4OBVcQwYuE0nUihGkttTNFBDQvXpb5sYA0o/SG2MIeQ4qKCPwQCdGT0xfneISvdVKz5qGxjXs+rX9ZOAdz8gNTOa9DODI+mlBhXw7J51OJ2aAYHJ3IVYkRJ85mTOsHLt1dTU+Q1qSWyUzbFZCG5yiQ8oSV9aSiuyrdzNGf3jkOI5b1L+TJ9gJB7GkU9y65usnMRCtbgCw0Joo8Z0r5XZdkvYfPp2iLD9lrdSjAMvdaDeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHGOtY970yXAc3oQbpIfnuYjjSwEd9OeYcIjLgyMxOI=;
 b=kU9nlXFYf65nwmwduOqgPAAEiaOcMMwCl6KX450+sFvvLFFrArOKBssj78k+vKVnfypDO909Nc+cM7raCRFsT+0Bii9lF/2S9ge/HW3CE06Sde35kmplHyOD1U9FrV8R8hloOYqteeugiSWqYe2Tqy/sBxTW3usTBVOSO7XmsiJbhqSYO7Bvfz/C3e/OukE2FOxEyqVY6e4wGN8pjsfl9AL0i2BdSTuzM7RElKGoUcudkMXSSWz9ezMzWE4jXnxceeu1qJRIJXOFHDc99v249XlTECUWhOAIl944LpV2nUC+SzfEuS/AQQB9GQqHPLLzx18YGot2eJ6OOeh7/UcxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 10:52:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 10:52:22 +0000
Message-ID: <426ad80d-1450-4650-a12a-25c49e98514e@intel.com>
Date: Wed, 18 Sep 2024 16:22:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/3] tests/kms_joiner: Add subtests for force
 ultrajoiner validation
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>, <kunal1.joshi@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
 <20240918073413.28598-4-karthik.b.s@intel.com>
 <fa200796-2d22-410e-b5e8-996fbe8571ba@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <fa200796-2d22-410e-b5e8-996fbe8571ba@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 20598e1b-b9fa-4b1a-e99e-08dcd7cff90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW80TE1NMEhEbU9JNHMvSzZuMU8vUllIMjNuOVVmc0Z4aHJMdTVnWDhmMTBh?=
 =?utf-8?B?bXVmdW55Y01BQ2FCc2IvT0ZCTzk4TEFKZFlHbjFCV3FaUHpONzZzUUZZQ3lu?=
 =?utf-8?B?S0JBNm51TTkvWHFGdDVYcWIzRGdqSW4xNTJJL2VzbHRhZ3k2ckVCdk10dXZN?=
 =?utf-8?B?eTFpcTZxZGdGc3Fqb1FwRXBmQ0V0cC9BRnN6ajh2MEkwSjdkU3V3NjN1SXlu?=
 =?utf-8?B?QUttL3JDQkwzVjJYeThMNGtxU0VnUm1RQ0dnQ1BMZGhNcXVTRUhJdWYyL2Ix?=
 =?utf-8?B?U3VWc1FkTEsyamdVMTRRM0pwUmxTWFo2UDJDQ2NhdFVsQmsrd0V2WWFpdzdR?=
 =?utf-8?B?Y2NNK1BTb09IZCswWEJscTcxU0lOL2tRdGl1ZWN6ZVFVYnFDUHlLU2p0UGV1?=
 =?utf-8?B?SUo2a1Q3VXF1WDZoMFAxTnN5dnQ3V3h4R0lqRzhYTHJHS0gvTjhyNlRlN2FH?=
 =?utf-8?B?UGpXWjFLQW9IWDBjSUd3RHBwbkxNZEpramg4RHlHQjBPWVhiajlnVy9rNVFO?=
 =?utf-8?B?bEsrVXA4L1dsYVhzZ0xHd2E2WXloMVBmRWN2eldWYS80eGVsc1U4SzcvRnhv?=
 =?utf-8?B?aDQzYkdSSGNrOGFQM3RjVjkxZXduanAwRUM3MVRhdk1manBoSzZOQS8ySDVZ?=
 =?utf-8?B?OXBmYnZ0WmxVclNUTmZ6TkQ0aHFOWlBhRXpuT3M3WFNUN2xnMWxkM3pWSGhy?=
 =?utf-8?B?YjJaTWxWWHJxSEQ4VDJkdWlETGltUjhpQ0JXaDc2cmlYTXlkMUlYVGQxN1hN?=
 =?utf-8?B?MW52R3NQa1hpeGhJbEE1eTZZQVVwMHNEZVQ4ZUlTWlYrSDFLeVJQL0tBMEc2?=
 =?utf-8?B?a2dBNEdGeVNjVktoTlBreDJlR2tNNTFRRk9vZTQ5SmhQaVp1U0x3U3FudnM2?=
 =?utf-8?B?WGFieFlCenBVd0NleWt5TzlyZkxLUjlIWnpxQWY3Q0cycXluQzh5OVBFbkZs?=
 =?utf-8?B?RFM0OVAyc1k1WUl3S3hpdHZGaTZaMUlGSkF1bE1PNFNzeG04ZkdEYkZ2Q1hV?=
 =?utf-8?B?UkVHcGRTK1dKTGZzVkEwUzlRc1IwNDRXRG5YVFl3Q2QwT0M1VmdLVjUzaldB?=
 =?utf-8?B?bVdheUlqa3YrQ3JSOHlJOG94L1krUlZYYW14cVV1QWlJUWVldXpQL0YyeDNx?=
 =?utf-8?B?ZnpBSkJNZUpYeE0zNlN2NXJoSURQZFRhYmh2eWt4RmxtU0U5N3lna3B3QTlI?=
 =?utf-8?B?eDNjbDE0c0RKYkF6MitlUm0wbVN3YlVRTmgrQithSVBVNkVHMXFEeFVoK1Vn?=
 =?utf-8?B?ZWJBKy9iUDdOUEtObDJia0gvTnprVWRIa1p4WUxCdVdDcGZDOG9xUTBVc3hK?=
 =?utf-8?B?bklyaHNLSnlCRWVPVXFMcnhLQXdQTkJUc3M1R3duWDJsMEMzSGNpOFhEbkVk?=
 =?utf-8?B?azVZaUx0dVRXQytmQ0pseHU4M3ZXR3hjT21oQUo5QzRoVU9obm0xMlNtdzd2?=
 =?utf-8?B?eXFWVWVSMEp4WDVkTlVnUmxKRDVOR3ROMG1xMDV2aFQ4ejcyYVBoN3FEUVdT?=
 =?utf-8?B?UUd5VlRJT0FSYUp1UmlacW0xMStqMU0zOEhSeDl3NGV6SDJiTkpVVjd5RTBr?=
 =?utf-8?B?WXBVR3Q4aHU5a0FoaThKWmh2Q2JqWm5kbGhncU1ESVFTNFgwY3diTG5sS0xK?=
 =?utf-8?B?dDdxZm0wZldJSWVaSnJSU2RVQUgyMCtWbzN4OE96OWhBRkRPTkJIVGhHUzk0?=
 =?utf-8?B?NmN5OFMyakpmRi82aDdiLzc0RUx2MDNQbEpvdHRqQlVENnFCWDRtbnl0MUFW?=
 =?utf-8?B?U2VkK0toaUtyQlp0RXFBV3IwOUIrN3NzSHMxQmpxL0daaDVUN3Q3aGhHUkEz?=
 =?utf-8?B?WUYxbHZtNXg2aFUya3BLQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRMb0tlK1h4dDBiM0lCY3B5WU9iQ3lENEIzUTNuZUhpK01ERkt6REJqM0JN?=
 =?utf-8?B?UnZwSTFJZ3o2UWpXSXYwRTVIV3pKTWVsMHl6ZjZRbTdGSzlSQTdPWTVOM2Rz?=
 =?utf-8?B?dklDelFMMmlPTWIyNWI0VlhJOFVtUTlQMkptQ1RaSCtQd2JqcWR4OStQTVIw?=
 =?utf-8?B?QjhDcWduVTFOV1gyN0p3T1ZKMXlIbkE2TVQrU3dEa2kzNmRlRFByUkhMVzhx?=
 =?utf-8?B?THZxOW13bjQ0OCtlQ1g4QmN5Sjl6NFMrVDMxb25TMnZFdnkvRkErdUpDa3lD?=
 =?utf-8?B?WUNPQ2ErbWsreHB6QUFRSmhRbEpiRmo4VTVJNU53bGdPWmIrZjg2ZkM1MlJM?=
 =?utf-8?B?SG1HNk9raXJVNjUwdk5lY0FZMzZlTitVTi9vTTNoRi95Y2JjUGo3WWJPcW8w?=
 =?utf-8?B?OEM1Z25DdnBYZFVUQkpPTWFvWnZNL0pDeEQ4YVhRajFGT2FEWnM3RGJoSU9F?=
 =?utf-8?B?QURQRVZpWFlJQXJFaFJXZjRaMFp4Wk5MYlhZRWZxRUJHenBtRjB1bE1GMldk?=
 =?utf-8?B?UlV6RFp5WEpCeEhoWmYrb1JKVWVLbFpGRDhLOTlodlUzR1pzaU9hbWVza2M0?=
 =?utf-8?B?bGJZMFVCdEF0ZjlzZnUwZlZKS1RuM1NwQ2NJdUU5TUZNbks5Z2xGcGFUZzYx?=
 =?utf-8?B?MExWNSs1THdRNXVramdjajNqUDBsa0w3dXV5S2FLOC9WZHBwbWt6c000bEtD?=
 =?utf-8?B?dkVCRTF1ZHpsN3NCSkVWUzZ0NlNHU0ZCMFVMUERQaEt6UmRtRmc2WHBPWkpn?=
 =?utf-8?B?V2dCV29ueTVraW5UQnZENG5PN0tpd3Q5WXRDT3BNaXNyUWVPVEw4TGxDM1BW?=
 =?utf-8?B?TVE5emFVNTBiUzFpZWY0N2dqZFJsREhjamRxWEZDMTFkSWhvTFZXdTI4ZVkx?=
 =?utf-8?B?RlpLVkFGeGx4SmdLZnd0NGxIZUVwNmI4UGkrMlA1WEgycUNKM3lINTdmZWIy?=
 =?utf-8?B?YkM4Szg1Qk1TMi8yRlZyb2Uyekc0UkN3ZktNaVVXSDhqd21TaGViK2VkUmtn?=
 =?utf-8?B?LzBMbjBFR3pUL3laaHZIRU8vSHlzbWl1ZzZ5c1ArNEdtazFjU0xNQUVPYkdV?=
 =?utf-8?B?Q0JlaWtlN1ExbktONW04RDNqN2pESkpYZjQ3WEJDbndHY3NCNmJ3UXd2WjZT?=
 =?utf-8?B?eUdDckE3ZFRwOHE4Szg5eVBuUDN2SVhuMkVRaVlKQm82WjQwSFVJL2hwWDFQ?=
 =?utf-8?B?VlUwN2pEVWtsYW1ady9mVVl1OGRIcWpkY3MveDRsdVN5Y2V0NVdkNU9hM1lS?=
 =?utf-8?B?K05IUi9HL3M5clc1clZKT3VDWWNBYXYyelkrcDE2VVhxUUtMWkpjK0l0Zml5?=
 =?utf-8?B?bCs0UXBXcmZXWndUTG9kRXMvaTc5bFFWd2NtWmFSaGpPaTduVmJYYWNqeWNk?=
 =?utf-8?B?R1lPdHdkVjNUU0ZFbkJDem1YWFVUamJ5Z2t4Tlc0T0ZjK1ZpTmNTTHlQMk5I?=
 =?utf-8?B?RUZ1ZmU0UG5zVXpJNkE0VW9md3dVbTlHc3lFS0FiRzJOOFlVc2dzOVU2SCt6?=
 =?utf-8?B?cHB0cjFYZHhaT1ZTcmZTeEJuNXFWTVNQTFNhL2hZR1hzT2FwMkpnMEpOLzdE?=
 =?utf-8?B?T1V5ejN5azhweGFxYkdWUlNKZ2JEeldXVkhMOCs3aXgxZHVCU09zTFNOYVVn?=
 =?utf-8?B?Z1dIVmZuaDl0N1ZwbUpMRHlxeDQ3bUpVT0FSZnZXUXdEYTVUYVVvSllhbVRt?=
 =?utf-8?B?UGhKN3ZhcC8zUEJnRXVkamFtZDVGOCtFYmlrZVpwYzBSRmV1L0xDRDJlRGp5?=
 =?utf-8?B?c2FmREdFTlZtTUIwdzBEc20wNWtYMXlIazVwSTNpS1ZYUzg2MElQd0EvaXpU?=
 =?utf-8?B?NmUrVFZFK3hGa1EwaThrK210Rit1cVBoc2ZnbXFuL0ViRFhDNlQ1OVhJMXdE?=
 =?utf-8?B?dXhZbmtuUWJOSmUzYkZOVFJmQ21oVzk2ZTNFZG51cVQ1L2VucEJLZjFnVEhh?=
 =?utf-8?B?UlVrUkpzS1FYRW11TUJMZnVPb3pLN0MrdGpmYVBabUNYcWJyQldvWTAwYWIy?=
 =?utf-8?B?TEJNa2tlaDVkSkp2V21heDBxbGFNMytIMmROOW5yZ0dZTFA0blpsV3oyN3F4?=
 =?utf-8?B?YUxjdDFFZmtKd21wSnVzVnh2WXR6K3Nrd2lZMStmNWViT0JQOC9YeDNJZXRk?=
 =?utf-8?Q?Va4lzVc18YZtk26uYBdQwRRxS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20598e1b-b9fa-4b1a-e99e-08dcd7cff90a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:52:21.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANxeHDYl99PmlTcpZWDq13C8BdYAglxI1kfTiL72++oaqtoYKD0g7xNo49rMg2zQOGbRRk5b8DlHShp8s02eFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
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


On 9/18/2024 4:14 PM, Nautiyal, Ankit K wrote:
>
> On 9/18/2024 1:04 PM, Karthik B S wrote:
>> Extend the ultrajoiner subtests to validate ultrajoiner on a non
>> ultrajoiner supported display using force joiner.
>>
>> v2: Rebase
>>
>> v3: Add display version check for ultrajoiner
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 120 +++++++++++++++++++++++++++++++++------
>>   1 file changed, 102 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index e193f9071..e498ac542 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -35,6 +35,7 @@
>>    */
>>     #include "igt.h"
>> +#include "xe/xe_query.h"
>>     /**
>>    * SUBTEST: invalid-modeset-big-joiner
>> @@ -51,15 +52,24 @@
>>    * SUBTEST: basic-ultra-joiner
>>    * Description: Verify the basic modeset on ultra joiner mode on 
>> all pipes
>>    *
>> - * SUBTEST: invalid-modeset-force-joiner
>> - * Description: Verify if modeset on adjacent pipe is declined when 
>> force joiner modeset is active.
>> - *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>> + * SUBTEST: invalid-modeset-force-big-joiner
>> + * Description: Verify if modeset on adjacent pipe is declined when 
>> force big joiner modeset is active.
>> + *        Force big joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>>    *        so test exclusively targets non-bigjoiner outputs.
>>    *
>> - * SUBTEST: basic-force-joiner
>> - * Description: Verify basic modeset in force joiner mode across all 
>> pipes.
>> + * SUBTEST: basic-force-big-joiner
>> + * Description: Verify basic big joiner modeset in force joiner mode 
>> across all pipes.
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>>    *        the test exclusively targets non-bigjoiner outputs.
>> + *
>> + * SUBTEST: basic-force-ultra-joiner
>> + * Description: Verify basic ultra joiner modeset in force joiner 
>> mode across all pipes.
>> + *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>> + *        the test exclusively targets non-bigjoiner outputs.
>> + *
>> + * SUBTEST: invalid-modeset-force-ultra-joiner
>> + * Description: Verify if the modeset on the other pipes are 
>> rejected when
>> + *              the pipe A is active with force ultra joiner modeset.
>>    */
>>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>>   @@ -111,6 +121,19 @@ static void 
>> enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>>       }
>>   }
>>   +static void 
>> enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
>> +{
>> +    bool status;
>> +    igt_output_t *output;
>> +    int i;
>> +
>> +    for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
>> +        output = data->non_ultra_joiner_output[i];
>> +        status = kmstest_force_connector_joiner(data->drm_fd, 
>> output->config.connector, 4);
>
Hi Ankit,
> Use JOINED_PIPES_ULTRA_JOINER.
Thanks for the review. Will fix this.
>
> As discussed offline, ultrajoiner requires DSC so need  to add check 
> for that. Otherwise looks good to me.

Sure will add this.

Thanks,
Karthik.B.S
>
>
> Regards,
>
> Ankit
>
>> +        igt_assert_f(status, "Failed to toggle force joiner\n");
>> +    }
>> +}
>> +
>>   static enum pipe get_next_master_pipe(data_t *data, uint32_t 
>> available_pipe_mask)
>>   {
>>       if ((data->master_pipes & available_pipe_mask) == 0)
>> @@ -297,23 +320,36 @@ static void test_joiner_on_last_pipe(data_t 
>> *data, bool force_joiner)
>>       }
>>   }
>>   -static void test_ultra_joiner(data_t *data, bool invalid_pipe, 
>> bool two_display)
>> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool 
>> two_display, bool force_joiner)
>>   {
>> -    int i, j, k, ret;
>> +    int i, j, k, ret, count;
>>       igt_output_t *output, *non_ultra_joiner_output;
>>       igt_plane_t *primary;
>>       igt_output_t **outputs;
>>       igt_fb_t fb;
>>       drmModeModeInfo mode;
>>   -    outputs = data->ultra_joiner_output;
>> +    if (force_joiner) {
>> +        outputs = data->non_ultra_joiner_output;
>> +        count = data->non_ultra_joiner_output_count;
>> +    } else {
>> +        outputs = data->ultra_joiner_output;
>> +        count = data->ultra_joiner_output_count;
>> +    }
>> +
>>       igt_display_reset(&data->display);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   -    for (i = 0; i < data->ultra_joiner_output_count; i++) {
>> +    for (i = 0; i < count; i++) {
>>           output = outputs[i];
>> -        igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> -        igt_output_override_mode(output, &mode);
>> +
>> +        if (!force_joiner) {
>> +            igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> +            igt_output_override_mode(output, &mode);
>> +        } else {
>> +            mode = *igt_output_get_mode(output);
>> +        }
>> +
>>           for (j = 0; j < data->n_pipes; j++) {
>>               /* Ultra joiner is only valid on PIPE_A */
>>               if (invalid_pipe && j == PIPE_A)
>> @@ -374,14 +410,15 @@ static void test_ultra_joiner(data_t *data, 
>> bool invalid_pipe, bool two_display)
>>     igt_main
>>   {
>> -    bool force_joiner_supported;
>> -    int i, j;
>> +    bool force_joiner_supported, ultra_joiner_supported, is_dgfx;
>> +    int i, j, display_ver;
>>       igt_output_t *output;
>>       drmModeModeInfo mode;
>>       data_t data;
>>         igt_fixture {
>>           force_joiner_supported = false;
>> +        ultra_joiner_supported = false;
>>           data.big_joiner_output_count = 0;
>>           data.ultra_joiner_output_count = 0;
>>           data.non_big_joiner_output_count = 0;
>> @@ -397,6 +434,11 @@ igt_main
>>           igt_require(data.display.is_atomic);
>>           max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>   +        is_dgfx = is_xe_device(data.drm_fd) ? 
>> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>> +        display_ver = 
>> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>> +        if ((is_dgfx && display_ver == 14) || (display_ver > 14))
>> +            ultra_joiner_supported = true;
>> +
>>           for_each_connected_output(&data.display, output) {
>>               bool ultrajoiner_found = false, bigjoiner_found = false;
>>               drmModeConnector *connector = output->config.connector;
>> @@ -461,7 +503,7 @@ igt_main
>>               igt_require_f(data.n_pipes > 3,
>>                         "Minimum 4 pipes required\n");
>>               igt_dynamic_f("single-joiner")
>> -                test_ultra_joiner(&data, false, false);
>> +                test_ultra_joiner(&data, false, false, false);
>>       }
>>         igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> @@ -487,15 +529,15 @@ igt_main
>>           igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are 
>> required\n");
>>             igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> -            test_ultra_joiner(&data, true, false);
>> +            test_ultra_joiner(&data, true, false, false);
>>           if (data.non_ultra_joiner_output_count > 0) {
>>               igt_dynamic_f("2x")
>> -                test_ultra_joiner(&data, false, true);
>> +                test_ultra_joiner(&data, false, true, false);
>>           }
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-force-joiner") {
>> +    igt_subtest_with_dynamic("basic-force-big-joiner") {
>>           igt_require_f(force_joiner_supported,
>>                     "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>> @@ -516,7 +558,7 @@ igt_main
>>           }
>>       }
>>   -    igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
>> + igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>>           igt_require_f(force_joiner_supported,
>>                     "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>> @@ -539,6 +581,48 @@ igt_main
>>           }
>>       }
>>   +    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> +    igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> +        igt_require_f(force_joiner_supported,
>> +                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>> +        igt_require_f(ultra_joiner_supported,
>> +                  "Ultra joiner not supported on this platform\n");
>> +        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> +                  "No non ultra joiner output found\n");
>> +        igt_require_f(data.n_pipes > 3,
>> +                  "Minimum 4 pipes required\n");
>> +        igt_dynamic_f("single") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +            test_ultra_joiner(&data, false, false, true);
>> +            igt_reset_connectors();
>> +        }
>> +    }
>> +
>> + igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> +        igt_require_f(force_joiner_supported,
>> +                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>> +        igt_require_f(ultra_joiner_supported,
>> +                  "Ultra joiner not supported on this platform\n");
>> +        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> +                  "Non ultra joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 3,
>> +                  "Minimum of 3 pipes are required\n");
>> +
>> +        igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +            test_ultra_joiner(&data, true, false, true);
>> +            igt_reset_connectors();
>> +        }
>> +
>> +        if (data.non_ultra_joiner_output_count > 1) {
>> +            igt_dynamic_f("2x") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +                test_ultra_joiner(&data, false, true, true);
>> +                igt_reset_connectors();
>> +            }
>> +        }
>> +    }
>> +
>>       igt_fixture {
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.drm_fd);
