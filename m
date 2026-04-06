Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D8FEF4ECB
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 10:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6610E1AE;
	Mon,  6 Apr 2026 10:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1l2wqyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C6C10E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775471426; x=1807007426;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fz6qhd7PQCFJ4/MkvqPYyzA/5Bh1tQqWKAB/jsfXuEs=;
 b=n1l2wqyfZ5XaOBYnWJlw6l73K23Il5bHQfuUOoezAVWEY6ivl3EIkGBC
 ITLMIDd319oI/QLKwYhOAT2ukNRDLO1mqETUC8JouKM/2s5hl5tADwjBy
 rIXp/NUqlXgB5m27KHxtseqlmeV/hyGK9GwWI2NGahXp4WeqAaatzTDPZ
 /Xo0xmToO700qwScRpNJUbzDZKs3G20i4Uq/urZ2iib5gDl/+Jg8Eafyt
 Se+NF2jSqqiFvNXhN0fHSTqQy9lr1XjLWjntbchUC/8kTOEo6BR2eiuJX
 RAj1S9QJQMs64S8vce+zW5xUBvZnr/b+pmGFagsPlnqHGKI8XUb+k/fAW g==;
X-CSE-ConnectionGUID: a+Xk11RRRfODL7nvEkCMpA==
X-CSE-MsgGUID: 7ePQmlzVT5KIF8YRHuk6cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76488105"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76488105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 03:30:25 -0700
X-CSE-ConnectionGUID: f3YzbZfjT++xOqm9BArNlQ==
X-CSE-MsgGUID: 9oxxn7JIQhCX0yP5CGQPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227749609"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 03:30:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 03:30:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 03:30:25 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 03:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2pKiX4tT9nAcBFpzlyctUjw9MXnrsu35TYxq7tC7l0UApyHkbFiJ76B4NcgCEdNROJ6amTbn26Nj9sAYhHItEFguXtdNXgQOWxYxtv5TU9fvA6C9hH2ed5qZVEXOs8zKR3XkyIz53Vrm700DidTP366ZQ9tRtFJ991t2IzmvBwOoIhe8vu1IEryuoyErBtzUv399fvB6jQ0F+dSdM1G5RmwSEp0VUv/08Iog13KGSEjqN5eVV0HQrHEHyfIzmG0W4LCkFnQvwddpuIpzw60wpAjL7LGqcEoUyAmHL5OfOr5ogSHokpwjoFQGGezLld/j2HTodYSCJT7CMBtovAH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/2hwQqYPNhwrZCYNfVAqjDbMMVcu9vN5vWYR3LXLc4=;
 b=kQMRsWlKsob0X5zD0YdfZbGFv8vUyECQzK5BPuKBOm4E2CRrIibiy/qHviMgMK9Vtsoz/4tIToSRbZPm3+PQ227on6o/DxoLkLj+iO+pVQYY+k9LtjoFug92i0rUqZ5BVNphr+NgygcifTRi0kZl123d484MOp11uCMSmqaeXBTpmHy8b+5IsoPRkaPEpsjHvTA8yL2T8pbWkluiousprfLKXf/umNozR0bCrkqb+1TgYsEpYzIZnNwU9Li56LfvgQt/MqXGeHbG8/r6H3EDhH7tjswryXg8IhTTXtlfBEGCeCNDk+6CUfPdyLBnPPDjKvT4ORRwxjaSB3umCC4weg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA4PR11MB9132.namprd11.prod.outlook.com (2603:10b6:208:56d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.35; Mon, 6 Apr
 2026 10:30:23 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 10:30:22 +0000
Message-ID: <c30a0712-9d64-4752-af84-cd9dd598caf3@intel.com>
Date: Mon, 6 Apr 2026 16:00:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/9] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-4-arvind.yadav@intel.com>
 <1db6f1ca-4706-4ed3-9ad0-219a956e4cd3@intel.com>
Content-Language: en-US
In-Reply-To: <1db6f1ca-4706-4ed3-9ad0-219a956e4cd3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA4PR11MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 01722631-761c-4a52-1139-08de93c7823e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: UTfpyYIT0yZs/SGPn9alI2LymPLg5EAXMIjiH1i20oY/20rtSMWXYD2QlQzKuxp8D6Kvu9277bZQPcxyfhncph/em0ppMdtzOTfMP/wy9hFZCde5SREAgrHm5DqMm8jSdNvfb7wwhdMybnoea8DhfYlZARbWfuT0gae3jc3Qjva+rnOm0tWz7+GgJgYal10dCA3xtVnObHBhzI5APVXmfzOraL6kvRje8N0e/dqDZJs4GDPUBd6ZE/LMI4gnILIiz8/2LIoq6jNwmDv6JYNZLTG7R1P7TRUZtnGXpiDAH2FBKjq+KVMjLy/MpipF3Fh+RsjtzLb5VuFBexD7DFnvBNE1HMvgTnogkBrm7FbhKlIan3nA0oqGx6VnPFaw3y3r5qeTx/02adrnZBWJeDJs7X/bfcDinUwlWV+mvGSuCcrTVyccTTe9oXS+yudYCEVS1p5FaoEsmbHkUNNFvavzhaRMBaMcokD8raoPrMup9JvOXV2bwRwIkeRc0Spc0YJFGKFUmPRm+X0OpB7PtSARbJ/JkIP+tbxHBZFEIvF2yhWst0wcBIHt0Tug7g2Wk+ivfHTynlDFboGRrOCr3LZIDARPwk/GHkk/7E/+04GtWNo+7vA7sQaC1WfD9MAxETdKTcACGT+gTwBV6V53uU/TKBM0nS7g00bTaRROMftlTE0Phlp6XIAIUxnGbxN/PCc4Xc0cqIL3e+CahWbtwjXG3X2jfhajBaSFwMqdAU+ntMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2VGbllKSzRRL01pT0RPbnoxV1lkRmJFdmFWYnY3YVRtNm91ZXdhWmFZSFJT?=
 =?utf-8?B?NS8vaGdNMFFaMDU2TmRaOTFWODk4WFU2SkNQK3lEQUl1bTVjSVEzUFBCK0Zy?=
 =?utf-8?B?N2YzQmxOL0xHVW9abWJaU1hFSUs3UVJsNlpNcktXOVZhaWxUNlRXaThyQ0Q5?=
 =?utf-8?B?Z0JUWlFyeHhMSW1tQWVZQjljKzNBOXliVGJWakQvSDlTd002YVBsbGkvOXhZ?=
 =?utf-8?B?elJSUWJrNi9PTk1Za3RIWUpUWUY3Tkp6eWphV2NoUW5Fak9KT1ltcjlDc3BH?=
 =?utf-8?B?L0pWbGRoSitzQ1gwOGNxNFhrTmMvRVFQUUcvb2RKdnhYTU1QODNER1RxeXFY?=
 =?utf-8?B?UFNIUG0vZHpmTjJPNlZVejJOZGJMQ0l4emZrT1pPTmMwWFEyUG56WGtLQ0l0?=
 =?utf-8?B?Y3A1RE5EM1c5LzJWVUJxYlM1cVgvYTN5ckprdlFteDZFZUZTT0FyN01JWjkz?=
 =?utf-8?B?cXQxT1M2Vk1SOWdNSUg5SS83bXk2dHpESFVZcUZ5NWN4RDdGbG1yT2pIV1lj?=
 =?utf-8?B?MUZCeXNmcW1XVkdnQmxjTkFDbStsUWphN3JsaW1DREU1L3VLcmY0Zm84bVdY?=
 =?utf-8?B?cmM1R3YxcmNuaXBxdTB2bUtXWTVrQ2sySXpuMEJzLzh0M3dWZDFJamdhTW1D?=
 =?utf-8?B?cjZOS0tNOUV2bkl4ZEwyMjJ3S05zSmx3V3p6RUlNK05FemphcjRMV0VKOHhW?=
 =?utf-8?B?RityMjNVaGVEcFcweGgvYTVQTFJYcGRybUFIdFBuUDBiSU1wTG14QnBoU3hl?=
 =?utf-8?B?OUlpTDBGcmhEaXphOGdyNkVDMWdSS1dTSjdnUlUzNVowV0Z6a3hQOFVDVnFQ?=
 =?utf-8?B?TlMyeEJJaTdDbVExQ2FVM2dCWm04ckJrL0p1K3p0VkdhTHZsS0ZhTWFNSlZK?=
 =?utf-8?B?OXNWamx1M1EzWEFrMnRhVSs5UkFEU1Z2SkJxcitSTEx0Z0YvLzVRYjdSSjY5?=
 =?utf-8?B?Z2sxL3c2RmpadGhndm9EWWRvL3V3T3FaYmNxQmtqd2J6TS8yS0hZeG1HM2NZ?=
 =?utf-8?B?a0tUQUxPUVNlbnAwQ05UanhibEtXK0RLcXZXL0tyQ3lhdndzMXZSSEVlWHBt?=
 =?utf-8?B?UGNuZkFZblM0YzY4a3NnNTFOL1dSVlFTTWV6bEN2aFA3ODdETjIrNFZhNEg3?=
 =?utf-8?B?cnVna3c5ZnlpSzNvVDBxc2tWNlVLb0dTSDhBZHcvekQwREN3ZGlHV3N2b2kx?=
 =?utf-8?B?UjlUM0h0ZmpLVnc2MS9rY3BPUHJNYnZmVlZvVVdLTWVBTjNjNkxTaW0rSURS?=
 =?utf-8?B?RHByOHNTa2dOWWNCN050bzNVd2M4VTBQSkFHdXhQWFl0NmhraW9QenQ3Mmxh?=
 =?utf-8?B?OEM4bFJ3cms4cEVCN0xLR1RFL282SjJ5eDNodjVQV0RFcTNIYmVkZ2hyQVo2?=
 =?utf-8?B?MFNZOWJJUVl0cU44RUY3RUdrV2o2Zkp0bFk1OGpud1VjS2pIQVhMN1V6ME85?=
 =?utf-8?B?U2xtcWROelBpWkNxTmxISGt4WE12MDJYVjBQWjFaVnVVUzMwSmxnd1NuWjY2?=
 =?utf-8?B?UnZKRTdyclczbVVtUVhqTndKbWtvdWVTWko2Y0cxZUQ5cHlhM1d5MW5pQjFa?=
 =?utf-8?B?NlFmWjV1RDdQMlFhUGtLZXVFVDlGbXN3dHNsMlNIYm9nS2VzSjJrVWUzdFY1?=
 =?utf-8?B?K3lDYS9nTmtualU2ZVJnUkVGZWdPZGhaWisvYmZoN3BtYUM2Ly9EWTY1ZkI5?=
 =?utf-8?B?Nm9UcVdUUXNMbVNyM3BuYnlGeHQrU09NY1BlZnQxbnFJUlZmUHY2bHdra0x0?=
 =?utf-8?B?NStTTUIwN3lKcFVkdmY4cWV2OURQaGJZdjRMUDVoQkNuZ0M4cG5zS1djS3Y4?=
 =?utf-8?B?VVExTEVvVzZubUxxSnhKRk1BM00zS09taFQwWE1RTVh3RXJDSHJFTmRGRFl5?=
 =?utf-8?B?Y08xd1ljYTJWODhHdlU1Ykx1MDljeTZkTE5KVkJaRU9OUm5Eajd6WFZaRnVY?=
 =?utf-8?B?WFY2YUVaK1A5Q29NdmtuNXZYUjJweWJtRmc5MlVweXFuUE1BUGNPc2FnU3lB?=
 =?utf-8?B?ZEpGV2UycC9QVDhMY21UTkJJd3FZbjYyd3prQWt3dDhTdVp4amp6VE91dkFZ?=
 =?utf-8?B?TndPc3pVWjc0YWE1aGF3WWRSdU5hNkZGa2kxaHFSVEhwZDN2UlNlS2YwUVAv?=
 =?utf-8?B?UjJtV2RoRkUxK0NJT3g5Q3kxVVBYS0E2azR1aThOT3RsN25yNzRUa3BMRzFX?=
 =?utf-8?B?dEhTVTlCTFVLK2dJSTN0MG96Z1Z3UkprUzJtR0ppV0U4bHZDTFg5WnVBQmE2?=
 =?utf-8?B?azEzSjd5bUVBUWREREdsVlFQbTdoTEhQcElEcGl4d0ljc2tLMHE0RUpNb1ZY?=
 =?utf-8?B?SE5iRExsVkpwR203VDloSGVyUjB4aEZPM29rbmdRVTc5R0xNOUxXVmhTUlky?=
 =?utf-8?Q?HatxL/+/3dirOsJc=3D?=
X-Exchange-RoutingPolicyChecked: MbX5d2fhtEaeK+fhsIXD9UleZUSYt0EMLwVI8+dnVtyvE4VWJWt2b+OoVAlDxzbz3vUPuaiBscZDFIu1juRW1t/tXNMTvOL5aRkZajjcDf3LQNg81KIn+jZ1lRaihuvwhnusk1Xrr/DgfnBgC+NvRFDHeYiX5ma+kyMgydvDJDsLpdsziiiuXRjSKymRzgRkdgPOksIWv4Ffw6LUPrJuvTASlF4b1XHW0Y/53if2P9Ox+mNsIV4iY1fMEAto/NgsYZy7bnHZhBwnbOs7W+Ui+EIT8FaKMxZhnsOsNs7Olyx4GlPcKBs+uM2uWBzyXpJap1jAjCpYkVlSVY2X+5z4LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01722631-761c-4a52-1139-08de93c7823e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 10:30:22.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyPRV4cc+m3Bk9iq638B3odM/AzvCfYqC6/K1vAG0yCAAhQf8DrO6arY+25srTPKIqypqfZFInY/aKGjyQw+VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9132
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


On 4/6/2026 3:23 PM, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> This test validates that mmap() fails with -EBUSY when attempting to
>> map a BO marked DONTNEED. The mmap offset ioctl succeeds (it just
>> returns the pre-allocated offset); the purgeable check happens in
>> xe_gem_object_mmap() at mmap() time.
>>
>>    - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
>>      has backing store but can be purged at any time)
>>    - Purged BOs: return -EINVAL (permanent, backing store discarded)
>>
>> v4:
>>    - Move unmap outside the block. (Pravalika)
>>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>>    - Added assertion for xe_bo_map. (Nishit)
>>
>> v5:
>>    - Add kernel capability check *_FLAG_HAS_PURGING_SUPPORT for
>>      purgeable support. (Jose)
>>    - Drop memory pressure trigger path; mark DONTNEED directly and
>>      assert -EBUSY from mmap offset ioctl; restore WILLNEED before
>>      cleanup.
>>
>> v6:
>>    - Support iGPU by using total system RAM as the pressure baseline
>>      instead of VRAM size (which is 0 on iGPU).
>>    - Raise overpressure from 25% to 50% of the baseline to ensure the
>>      kernel shrinker is forced to reclaim on systems with large free 
>> RAM.
>>    - The DONTNEED enforcement point is mmap() itself, not the
>>      DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl. Update the test to mark 
>> DONTNEED
>>      first, then verify DRM_IOCTL_XE_GEM_MMAP_OFFSET still succeeds, and
>>      finally verify that mmap() fails with -EBUSY
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 233 +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 234 insertions(+)
>>   create mode 100644 tests/intel/xe_madvise.c
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> new file mode 100644
>> index 000000000..de4a6e34c
>> --- /dev/null
>> +++ b/tests/intel/xe_madvise.c
>> @@ -0,0 +1,233 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Validate purgeable BO madvise functionality
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: Memory management tests
>> + * Functionality: madvise, purgeable
>> + */
>> +
>> +#include "igt.h"
>> +#include "xe_drm.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +static bool xe_has_purgeable_support(int fd)
>> +{
>> +    struct drm_xe_query_config *config = xe_config(fd);
>> +
>> +    return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
>> +        DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
>> +}
>> +
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR        0x1a0000
>> +#define PURGEABLE_BO_SIZE    4096
>> +
>> +/**
>> + * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable 
>> reclaim
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle (unused, kept for API compatibility)
>> + *
>> + * Allocates BOs in a temporary VM until memory is overcommitted by 
>> 50%,
>> + * forcing the kernel to purge DONTNEED-marked BOs.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm)
>> +{
>> +    uint64_t vram_size, mem_size, overpressure;
>> +    const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +    int max_objs, n = 0;
>> +    uint32_t *handles;
>> +    uint64_t total;
>> +    void *p;
>> +    uint32_t handle, temp_vm;
>> +
>> +    /* Use a separate VM so pressure BOs don't affect the test VM */
>> +    temp_vm = xe_vm_create(fd, 0, 0);
>> +
>> +    vram_size = xe_visible_vram_size(fd, 0);
>> +    if (vram_size > 0) {
>> +        /* dGPU: pressure VRAM to trigger purgeable reclaim */
>> +        mem_size = vram_size;
>> +    } else {
>> +        /*
>> +         * iGPU: purgeable BOs reside in system memory. Use *total*
>> +         * RAM (not just available) as the baseline so that we always
>> +         * over-commit regardless of how much is already in use.
>> +         */
>> +        mem_size = igt_get_total_ram_mb() << 20;
>> +    }
>> +
>> +    /* Scale overpressure to 50% of memory, minimum 64MB */
>> +    overpressure = mem_size / 2;
>> +    if (overpressure < (64 << 20))
>> +        overpressure = 64 << 20;
>> +
>> +    max_objs = (mem_size + overpressure) / chunk + 1;
>> +    handles = malloc(max_objs * sizeof(*handles));
>> +    igt_assert(handles);
>> +
>> +    total = 0;
>> +    while (total < mem_size + overpressure && n < max_objs) {
>> +        uint32_t err;
>> +
>> +        err = __xe_bo_create(fd, temp_vm, chunk,
>> +                     vram_if_possible(fd, 0),
>> +                     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +                     NULL, &handle);
>> +        if (err) /* Out of memory — sufficient pressure achieved */
>> +            break;
>> +
>> +        handles[n++] = handle;
>> +        total += chunk;
>> +
>> +        p = xe_bo_map(fd, handle, chunk);
>> +        igt_assert(p != MAP_FAILED);
>> +
>> +        /* Fault in all pages so they actually consume memory */
>> +        memset(p, 0xCD, chunk);
>> +        munmap(p, chunk);
>> +    }
>> +
>> +    /* Allow shrinker time to process pressure */
>> +    usleep(100000);
>> +
>> +    for (int i = 0; i < n; i++)
>> +        gem_close(fd, handles[i]);
>> +
>> +    free(handles);
>> +
>> +    xe_vm_destroy(fd, temp_vm);
>> +}
> This function is called from below function which is not part of this 
> Patch-3/9. This must be removed and introduced in Patch-4/9.
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig)
>> +{
>> +    siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check 
>> purged
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Returns true if the BO was purged under memory pressure.
>> + */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, 
>> uint64_t addr, size_t size)
>> +{
>> +    uint32_t retained;
>> +
>> +    /* Mark as DONTNEED */
>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    if (retained != 1)
>> +        return false;
>> +
>> +    /* Trigger memory pressure */
>> +    trigger_memory_pressure(fd, vm);
>> +
>> +    /* Verify purged */
>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +    return retained == 0;
>> +}
> This function is introduced in test_dontneed_after_mmap() in 
> Patch-4/9. Remove this and introduced in Patch-4/9.
Correction here, this function is called from subtest 
test_purged_mmap_blocked(fd); which is in Patch-4/9. Please move these 
functions in Patch-4/9
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t 
>> *bo,
>> +                      uint64_t addr, size_t size, bool use_scratch)
>> +{
>> +    struct drm_xe_sync sync = {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .timeline_value = 1,
>> +    };
>> +    uint64_t sync_val = 0;
>> +
>> +    *vm = xe_vm_create(fd, use_scratch ? 
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +    *bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>> +               DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +    sync.addr = to_user_pointer(&sync_val);
>> +    xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +}
>> +
>> +/**
>> + * SUBTEST: dontneed-before-mmap
>> + * Description: Mark BO as DONTNEED before mmap, verify mmap() fails 
>> with -EBUSY
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap(int fd)
>> +{
>> +    uint32_t bo, vm;
>> +    uint64_t addr = PURGEABLE_ADDR;
>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>> +    struct drm_xe_gem_mmap_offset mmo = {};
>> +    uint32_t retained;
>> +    void *ptr;
>> +
>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +
>> +    /* Mark BO as DONTNEED - new mmap operations must be blocked */
>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +    igt_assert_eq(retained, 1);
>> +
>> +    /* Ioctl succeeds even for DONTNEED BO; blocking happens at 
>> mmap() time. */
>> +    mmo.handle = bo;
>> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 
>> 0);
>> +
>> +    /* mmap() on a DONTNEED BO must fail with EBUSY. */
>> +    ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, 
>> fd, mmo.offset);
>> +    igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>> +    igt_assert_eq(errno, EBUSY);
>> +
>> +    /* Restore to WILLNEED before cleanup */
>> +    xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
>> +                DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>> +int igt_main()
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +    int fd;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        xe_device_get(fd);
>> +        igt_require_f(xe_has_purgeable_support(fd),
>> +                  "Kernel does not support purgeable buffer 
>> objects\n");
>> +    }
>> +
>> +    igt_subtest("dontneed-before-mmap")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_dontneed_before_mmap(fd);
>> +            break;
>> +        }
>> +
>> +    igt_fixture() {
>> +        xe_device_put(fd);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index cecb4a8ae..a6370b685 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -314,6 +314,7 @@ intel_xe_progs = [
>>       'xe_huc_copy',
>>       'xe_intel_bb',
>>       'xe_live_ktest',
>> +    'xe_madvise',
>>       'xe_media_fill',
>>       'xe_mmap',
>>           'xe_module_load',
