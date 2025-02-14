Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFC9C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 07:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0618610EBDE;
	Fri, 14 Feb 2025 07:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ9y5Qly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58C410EBDD
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739518147; x=1771054147;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oTg/HoYZZi9i/87+lGSE9karTzMI1/w+FKwrhOyIBzY=;
 b=LQ9y5QlyVKcNkT+rJ4GEyxaa26CKhFDl6NHZYDluWIHvkYcY4u0Uhz44
 ola1qvsDglSEnD45cPkoCJehwz5GDR9OuIxaadJx1qRgcPUmBhoWghOc7
 t9VRZq7w+0dCXh0dF2BknOKVdPBvvK8z/Q94rUHhoeqYebI2ikwuW/lwS
 ZLRJpCry4O2jPVQwSbgBSUZOptoRd3Vij3U6PSiiJErzPRgpvCEMh3qed
 Yub4ENfxbf0q7kaVdJimletWvJX25kEOCZSGb79Nfufl/ueg1SvXe6p3M
 pnhn3DeIZyr+fVucGJbstMFIh+nDlDGuL3BtUywsFFA5HduBzLHpi4BPB w==;
X-CSE-ConnectionGUID: SeA9ywb8QJqK2nleUuOXlA==
X-CSE-MsgGUID: mAESBRg9RSy9E8q5HuFgdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57663773"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="57663773"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:28:53 -0800
X-CSE-ConnectionGUID: qIrySq9eRvO3bKiGYN3qnA==
X-CSE-MsgGUID: 0F8pT/YbTd2Z2hCuoNbI1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113872970"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 23:28:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 23:28:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 23:28:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:28:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDQ5Lrq1pb9IQmKd1RFi03oAzg3OVN3mznUZ+uF75b7dvg4Zl3eJrMs9cxJZ7Jh2U95ZDDfBAofd6wsMD3+mUyaIxbuO7X2HieIAu41SSj0frILoOTDaWvFmlYPaYsvO7Sqht7Q3/V8RKqbDPjezMF8HtHWEHdp9YtVRAiyYtaw7uojHnBKAICEFN+7dKgDyE8YjhCZNlf2hvRxjQ0uc7fnw207xhsUSrY2Nk2xNEOQrcbdeWfJJLmKR24RqQPdSYcxwrURfAtd5LaEHDoiwyGDcI1b0RUyw/WfygBDode8i8bgU6MJBFmkGon9uxZCJkInueMd2nn2gzswbCAtwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KrV3Ysky9/o0Qg6Q/1fgyWdeYbyJbUqRWkwt9tmM3c=;
 b=FV0qbHhQc0Wv9VgcgxPNcrGHrNezX+aSuBxXZrzALf8Ny9stAShMcUdDhu0KopKlKMRHmMQ28Bu/ONIJK2Wb2qVMQaHpSzYis10YOUTkaeV9TdXFr7I/BCxriZe6ui7CP6zHz2ZxSlLtqrR1MVMWyDvDQxXqW95NP4wlbv8LQ9ToFKT23z+5/5fREXht0b/1dWC2YByP272sXC9RxDnAcphtKvqobK8CK0X5UHMQouq3JYuqrFFpSb5M9ngtpkAhmG/pABpG150xqiJ3FhiS+BEp1EO1v+LK1z/JqlpmoTcuayXblbS8ohwxuqYyCQxNm+Xab2rqahojiXuO3UlAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 07:28:50 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:28:50 +0000
Message-ID: <abb4a9a6-30e5-48d7-bc59-818b41c21f04@intel.com>
Date: Fri, 14 Feb 2025 12:58:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/7] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
To: <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-6-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250211180542.1430676-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 004ae617-a578-4684-7a7a-08dd4cc939be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm4wOTF0dzZsU2lNOVNXZmFjOERLa1gvcXBQODdPOGd1UXJMVFVybGdDckN5?=
 =?utf-8?B?OXNMK0I4Z1NMS2xpYXlNUUIzQlNWYjZKMVFtb3FkTlA0RjNKRUZOQTlBV0hK?=
 =?utf-8?B?NXQxV0dJcC8vcWhqYndLM0tSbURvRlYzclZLSnNoaXRzL2JXMUVvWUJEeXpK?=
 =?utf-8?B?T1BWNzkwd0J5QndpWjd2YlBMQ0YvZFprOTdHUjgrZGRnMFZLZlhWMW5jK05n?=
 =?utf-8?B?a2R4WHAyeE93UHRSQjZwVFV4REVMNnhIVzBySUZFT0tLeWUwUm0vSEZBcnRG?=
 =?utf-8?B?dVhEL2doNHNQZXJFbGsxTVRVY2M5VnVaaGVzdFBPeFRzd3lPYWhGdGJzUHNR?=
 =?utf-8?B?RHFRczltaGFWeHI4UkRBNzcyTFdMR09XQldmS1dxL2tZaFM1TzAxS3JIbEF4?=
 =?utf-8?B?TDdyVHFHVTdXa0c2NkZ2eWF1dGpYU0lqWThtL1pqZ2M3ZHAwZDE0WGhlRXJi?=
 =?utf-8?B?THZxaGpkeUFlR3kzV0h2ZzRrYXdkR2F0NHhHWkUvZEFJa3ppYWV6NG5Kak52?=
 =?utf-8?B?emVSLzZGQitDN1dtSVpmT2VIbStRcXFLWGNjWTVvbzR5V3lUc0tpaE14MWND?=
 =?utf-8?B?T2hxK2JpbExwWEw5WmpsUnpWOVdzUmlJME9RMEdCclF4RWZZZU5OTVdZczlT?=
 =?utf-8?B?K2VFNWdIa1hMamlsaUFFenlCNHNLMjEwM3NyZnM0ZVJIOGFweG5tdUViWWJ3?=
 =?utf-8?B?M05WZG9NVEx1S0VMRTdTTE51MUdFNWNtUTJHeG9sdnA1T2UvZGk3SVEzdjlS?=
 =?utf-8?B?Q3UvbW15YWcvM1BwSEtJd0xyenJJM3YvakFLOWdHdTE0anIxZjJWQ0QvTmUx?=
 =?utf-8?B?ZGNIdEZWNmV5MWVvWWdCKzgvdWJLSUJHZHJNMGZvcERoUy92blRBT0dibnRG?=
 =?utf-8?B?OUpNWFJGRzd2RnJ5cE0wN0ZuWld1dHNZK1JPMzVqOGtaWGpsUUNNMnQzbHdI?=
 =?utf-8?B?RGFlNWNyR3RDZ1k3T001bUtQaC9qZGtHZmhtSW1qcEsvVHBMT2xZS01LdWtP?=
 =?utf-8?B?dnVGVXRNYm10K0QxRFpsZGVPWnE0WnJjbk8wUXhlN050RHhldWluV2V2bnR2?=
 =?utf-8?B?QU5VTzIvRVE1b3psYTFBanF4TGlKNnhzSXIwOFQ3MkRqOFNBdVAzZzh0eHNo?=
 =?utf-8?B?aHorRG5zckFnNExmaUJYZTJlTk1IUUlrS3dHZEo0SERFc0U5Yndld3RDVGx5?=
 =?utf-8?B?MGh4eU1nY2RkeEx4a1RKd0ZmTlpBOHArNDF0eVRqWFBQRHhyYysrOURTZjRN?=
 =?utf-8?B?WFdrSlN4YjNweVh6WVl0SFFPcVg5TVp6eVE5RDNCOUdnc2NNZUpDaWFTZ0c5?=
 =?utf-8?B?V1cwT21QUUllV3ZyZDdkN0ZqZ3F4L1JxL2pJci9VSDkwcmNuOG5peVZTbnZi?=
 =?utf-8?B?b0QxTXl2dm91a3lXWDR4NGVrYzlLZG05WktDRTBweUtsUXhHUEZMTDJtaDYx?=
 =?utf-8?B?SVVBNkh3K1JBYzk2MzBkMURHTXVwRXlNUlJRbDA4c0R3MFRqb2k3OVVEcHVN?=
 =?utf-8?B?UGMzY2lmMThhYlEvSncwZEdoSFdEMFdWWXNPMGVGcWlCWUh0VW9qMzNnRXI5?=
 =?utf-8?B?VThSUm1xazcwaitrZFk2TzArUzFaODdsMHpJUkVHNlpRekV3c0VYVzIxcVRR?=
 =?utf-8?B?a21kczBLeUphNWdvYm5mR3U3RFlXUWhXWStBM1laWE5FNUtMNlk3dnpINDFh?=
 =?utf-8?B?MjZIVnUrYnlRQVhwcWlqN0tjenFjN3ZuMk5vbW5PcDBjUE04a3pGa2puQUta?=
 =?utf-8?B?anI0UHkwUnBNVkdtdzUxT2hkeW9jUkpDblVpbFcxWGJudHQ3cTM0VFovMGZl?=
 =?utf-8?B?VTJyaEkwclBXUTREQisyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDN3QkN3bXRBaFlzSFVEbmNkaitKelhPdVhPTFRPYXNndXBVZjMyenpKZTht?=
 =?utf-8?B?Y041U3l3WFlNNE0zYWQ2TExPa1k1bGowYlpNQmJzdGkxczJzdXJ1d1I1WXdV?=
 =?utf-8?B?aTZwejhGeDVuNTdBM1ROWkRObjRmeXhWZEI2ZGRMQXBoYUZBMVMzdkJ1WDlz?=
 =?utf-8?B?ZEUxckNOSkZUaHdtK2dXQUNGa3F6QzJ6c2JWaWxPVXlxYk5DSVo5VUVZNTUz?=
 =?utf-8?B?UGJUQUdzdk1sSXZqc0RmQ1ZxbGFDRUtXbU1jM2JVcWlKUlljVDlwMG56aWVx?=
 =?utf-8?B?VTZ5SjFqR2xiTGxZaXNDcWswV1I2Q3BHbmZ0dXlSaGlTdHpoU2FxS2tPencw?=
 =?utf-8?B?REV4L3FwbDJYSlpJQ3lOUW94V0xMVlB0YXdFbEU3L0s5K0srd2ZEOEF0ZjNT?=
 =?utf-8?B?Z3VxN1I3NjFaU1ZmWTBOR2llNEdkaHBFcHhiUm54QzdmZHhGM1BXcDh0MVhq?=
 =?utf-8?B?ZlpyczZPeE9tcVBLRXplM1VSR09mOCsyc2d5bEFGMS9GZGFlZExoZDJyNnFl?=
 =?utf-8?B?MHZJbWUwUlVudWxENHFiR2taN3EwcjhCcERUN1hxV1JwbGgrSS9KT09PL1gz?=
 =?utf-8?B?dFdjQkx4dDliSEVZY1lKNHB4V0FHOVhHWERVeHZRV3U0eG1rbEhSWjlVSXEy?=
 =?utf-8?B?bUg2MDZiYkVTeDRMSExVeDdqV0xsQnQ5OHVpSERIaUlReS90V2YyNytCdjZh?=
 =?utf-8?B?RGVlL3k2VGIwb0tnYnpzckxSdm5aZlpnRTFaa0VYMG5weTRqNjd4YXE3U1RD?=
 =?utf-8?B?d2ZtbkJ0VjNYa2pISTdkQ1NOSGJDODdzUndKQjYzMitZVUJwTWZwZ0ZVWmFV?=
 =?utf-8?B?VVNiOWpPanNLdXFsL0p5RHk5TlNvVmg4MFYzQmlKcnZYdURSeTUwTlRFckE0?=
 =?utf-8?B?ZVFkWnRrNHFFN3F2NUcvTXUwREMxdDhoczVoSGo1MEZMczZRM2pCUFJibCtw?=
 =?utf-8?B?b1ZoYjlCQmRLSFB6RmZUWGFuZWFlOTEwVGhSV3RIb2xoUzNzbTVsbmhUNVJO?=
 =?utf-8?B?dkZrLzNHNVVjNEE0bW5vRDg5aUFKR3VQZ2k3VmQxUkNzZzU1djhvZ2pkNEFw?=
 =?utf-8?B?Mis4U1pmNjd4eTRicDBQYmVFWGJZUEdQUXpvWU4rUjFvbTRYU1BOTnBuOHZN?=
 =?utf-8?B?b3Q2TDhGZm5jV1RNWklpYjdEN0s2ekVJZ201NVpHdHBUUmVlY2Zuc2ZaU3dY?=
 =?utf-8?B?NXVxYnEvTGt4ZjlGT1pucUduSGQxcU5kOEtOK3JiSE0wRnprVTByeTVGZWxh?=
 =?utf-8?B?ejJNNnk0eDcvQVN3TWZwOGd2N1FwTE9Lb1JmNWJHaTlGaWtFdU9PZ3dMaXk3?=
 =?utf-8?B?ODlVMEFQT2ZpWnZxYmdvOHc2L0k5aGpKZ1ZxU1NBZUtURGJ5bEhJRG50eUow?=
 =?utf-8?B?Z2liQ2M4Zi9xUTN3WFRnWEtMem81LzVIVTBDUUxHWnNKeVhaK3ArS0FwWEkx?=
 =?utf-8?B?VTNYMmZvQTlqb1ZOdFpyRU1BK2hnWE9oMFR4OXNZWFY5bHRCYUZ2VDdCblBp?=
 =?utf-8?B?R1UzcjE3TWJ3QTRlazBaUHN5VW9yZmpjdHlBVDZkelhlcit0cm42T05lZVhY?=
 =?utf-8?B?R2c1dWdDOE50OFI1aDY5Z1JxUjMyd2gyalRuOXpFTWpFbHhQcGVzV1dxQmY2?=
 =?utf-8?B?Z2RyWCt4eDAwMVh5THI5anhiNVJhVkdta3RMcVhiajlIbTZFUTFtaXErMEUz?=
 =?utf-8?B?UVArbVQzMnBlMlBqaEx0TUY5a2JUeE9QOFh2QWxZV01oVWkvNEk2QVMxNEdw?=
 =?utf-8?B?aXVudVROeXd3c1ArekxqclpZT2dOVEVCcXdpN0xPdXBDV0xaUFNBbjhMdEVn?=
 =?utf-8?B?dllzSEFRcWtVTDZLa3Zqa2p4Sk5ZUlo2RGY2b1E5ZFdFZHFCUTU2RkRKci9S?=
 =?utf-8?B?K3N2VngxRnJLNlhIV21PeTNnMFkrdWY5SlpRRDVVRmUxWVAzQ0RkdE1yZ3Jn?=
 =?utf-8?B?eEdBUitsdi9wZW0weG9ocFJuSkdSNldvYVE0VWxOWXA2WUhYM2pMQTFBVWcr?=
 =?utf-8?B?UG5hUzMzTk1xSi9RSW5rd01mUkhWSGdUK1FCZkZZQ3F4YjVkQ0NpblJSU3Np?=
 =?utf-8?B?aTRvUFdoa2hTL3lJbEZ6dUY2Q3R0bEkwRWhZU21sY2xQM3M1YjVaVGsyWTBy?=
 =?utf-8?B?TldCWmx2azZDMTh1V0RHYloyanhCR2tGNDVGSk9JN3NkNzlTd0N1TzRDcU8w?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 004ae617-a578-4684-7a7a-08dd4cc939be
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:28:50.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzEv9V2Ddf0vysPUXkg73ZEggx+zp93A1qkms/iVKh9KcRiBtC9O0jGLRUoFX+ePob1/DSgQBou2VZPKRhxIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

Hi Kunal,
Sorry missed one comment.

On 11-02-2025 11:35 pm, Kunal Joshi wrote:
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
> +			igt_info("Skipping output %s as DSC not supported by sink\n",
> +				 igt_output_name(data->output));
Here no need to add igt_info. Its already there in 
is_dsc_supported_by_sink()
You can check here
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-dg2-oem2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

DSC not supported on connector DP-3
Skipping output DP-3 as DSC not supported by sink

Same info, we are getting twice.
> +			continue;
> +		}

