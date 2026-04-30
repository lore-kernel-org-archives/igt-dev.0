Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBEFF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 03:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8413F10E021;
	Thu, 30 Apr 2026 03:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Km4iqEKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3193310E021
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 03:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777519104; x=1809055104;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ae/Hya+nIXVdp1KJQqWLJusAk4+rxGWKpGDUdRyP2mg=;
 b=Km4iqEKsqEZ3pXPuxGorLkzFqgtkdMrnUoxeCGNj26wHdNcKJpajCVhf
 8I1dJb3AzN6ZlW8MKVlGQZ1dW4PmSqB42y+6sAnBLpNgh0vnG2+/lRfoU
 DBDdd8jLeyYXiP9aTMM7zpWOecWp89f1SgBouTVVfNLPF+C5nC+Z1Qhzz
 Cn8ioIr8Idiev9DCn2PjqQGSpXnWykwPANcOf6CE/PX+JLeXirS+OYO2D
 rZwPQnmYlyP1Vx10jp3rjtLw18JN+HqymXR1IFpnOlxwC+Z1rwQoX3X89
 biz4z4WGd5uRmu6sQbo+QSLJIlGwdB/VBeAcn6LrTU0e1WZj7Z0axFST+ A==;
X-CSE-ConnectionGUID: FY6MhtuXTIeLJx2D1Uuo5w==
X-CSE-MsgGUID: idcAtQ/CQZqXJHcyVwnRfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78171849"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78171849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:18:24 -0700
X-CSE-ConnectionGUID: 8GcStIeBS7mO11bAHaBmhg==
X-CSE-MsgGUID: 4lRwQfrnR1ix823lVAWiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="272571947"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:18:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:18:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:18:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzvnGqiQlDtJV7qcOWLuUWtpzEpb+5aGT0QwfK5cmVQcuq6Kt5lfygviaNsL0KANoXseiNVnsuAtxm+MIpcC1x3shhUSxRyCxJWMjZTPQVwBZRyIyf7v0QU2um0ibjntkFJ6d05/RdzzQ6nSalPL3jDfJL1jjKkE84wvtsZvEzEJtQ6rYELJqP7dn2aGgFDJMb7l32S/EJ9bCbxBEq/OSG4x5K/lhb625N6Hlol7qX9SzWwrxvwjur+r9IEbpj7RAJse5SrdsG+NjOS5+8pFyjYzEvlZGkoyDIu64xVtZXhBri4r9nHZMk37EEf0w+4GhM8Adf9M52dV00dqW1aYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woCU5K4xFr0qj9iBr002982BKKZ+RFNqAutNGBv83EA=;
 b=cg9ltl/CYG4J7srGx2ZaLj2FbLcMcTkCOxZ8ti/uy2doiqsc/qTcqYa5kn9eHUbSzJgCFFCxNz9lXYq7Mq2BWAdhXgWnUSQHmRYizLU38QMx/dshrlbmC6POuMYP5bkqyjBnGCircjAaVxZvSEwuO/j8UzRNxE6jEmuwCck/wVvJEaXW12LRDZwUNqz+NcX2sefgk1CeD1HW8pVBc9iZ5XcuooJ4qDB6Ap3FCRhO0Y9yUVYicvHm7HkF73ZGmPinGBd+s4Uk195Up1bXdfsD9/LseD08ju4frRkCNNSJ2DcHmwRUzW0zPh4KTf7nn/zI0OQL4ohJNW0fR7xfpZN9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 03:18:20 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 03:18:19 +0000
Message-ID: <75c0b4e8-5bc6-4ce1-b0bc-bf6bf8d6f8d1@intel.com>
Date: Thu, 30 Apr 2026 08:48:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 02/11] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_fbc_status()
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-3-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 488deedc-f571-4cfb-0b2e-08dea66720c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Rqxfm4wHGUyZ4/0P3cBthj803uj2E48RCqQi3MfjbEj0sDX/8kudVasWVT7zGVOKPh/R7r/vtsj0fLuWUqjIXZAh9ifFmiY19Unk5ecZuxEqbJL2R4sCIvXe8UR4OoS5UwSZN/nBaACfpVCVZTLXCwJjldsIuF415ubC7rn/o9+n1/50NNEOyfS46qwL3W8U3hDDF31thwljWUnJ20q4CZYV/jHGHPeLlr8encKoC0BJ88TG5ckWVZt0qvNe/DDJYjLrlHUr4a+YZvf/9uMYxT5bXX8YU8Qh0Vw1hLnt9EQ1MPtWl5nqHkjC9c37ig+gHswoyDRwpAaXkIiAKDWC1WIlz9htfA2YvtD5K3XgKPQaQllEzCUCKY8L+kuklDW3qza8wEINamc6GiiItM5kHKhaXL/itdYwgIM8aQ8qj6uZZZihld1eBkkEFdSV3JFmyye4k7pNvC+OSt2dAgnZieDVBNMDzEopcQAc4V8PtIut1m3BbRrAvcZLkwdoe2lBblDxdRqyxbZrp+HULIJ1atmoQ8Zc0GB/Ycib+mmLzjMwVBJMKnlbekWeRjKqh5VMZwrZXitvdhI7uZO3lcpWFjQDO1OrbaLihb+LXKUVBv6IqjjCiBIMoUShFEbwrRIQTNHly/UH7zrPhx6DEuNeGcs9lcjkzTY/EL/BjhaFje82tMUsBqkhzgh8JRO5EFsWLpcyMsRxAvyfP0gJ6CkqYSZl6NHEzpbSMjYTYrkyo5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BTTzhiUHI4ajZ4d2ZseXlhVWNpTnJYVWRMa1JDZkR4RWUvZkhEMkJROUZv?=
 =?utf-8?B?cUJXc0N2TmFtN0hwOFdHRGVpUFdOaGhlc2RSeUoyMEp6K3lyYmNoQkVZY2Nq?=
 =?utf-8?B?cHRvbUNvWGhHcGNncDZUMUJpa29VbndPS2xhd3UzREhtcm1rZ2o1NFUwRHZK?=
 =?utf-8?B?bnBUU1lVYzNiSWs0SlpLdVJaVndoTWxUSWw2T2NRVlRhUEY4d1dPV0hEWjNu?=
 =?utf-8?B?TmtRM21VUUJLc25oSUJuUDJmY0NvSFVxZnlobUZSTzA0cGdhWW81K2d4dkcy?=
 =?utf-8?B?ME9IMURmYU9WdEUzczhZUmR1YmpWRStCc1NIcGpZZjByellKWEs3SnFHSFZK?=
 =?utf-8?B?cFJTa1NhdnBleHR6cUV4MGEvbjk3cUJ1RnR6TzhGSEVSaVdZZ1lEem8rQTJz?=
 =?utf-8?B?TmRXQndHem1UWmJ1UmVVbUYvUnJnNEs1RUc3dnNubVJCSHhVenAyeXN1SmJk?=
 =?utf-8?B?T3UrWnAxUzQzS2dKVlBlK3NJOCtWOVVUSS8wOVRMNXBxZ2NvR2NyaEJFMWJH?=
 =?utf-8?B?am5ERzc5Y1NLbTk4Q255RmNQN1dYK3Q0SUYxZXhpR2VkcUNlRE10TTJJN1Zm?=
 =?utf-8?B?dkV1elRuckFYWTFJa3c1dmZ0aUFHWUpNaTBsYndzNGJoUmJFV2JpZ1NTL1NC?=
 =?utf-8?B?WVN2Skp4QytnbVcrZjlTT0l2LzFhWDhkNWUwamg5eUo2T0pqRjZkZ0pXVDcz?=
 =?utf-8?B?enRoSmNWZGRxTnhYVHRubmoyU25oU1ZpY2ZlRDZ2SXpwQVplMzlZYXU3T0J4?=
 =?utf-8?B?Mk1STzRDRjhscHM5K2lHZm1BcCtkd0p1ekwxcE12WG1RWWY4WjluMzFXWEhZ?=
 =?utf-8?B?ZkZrTHg0SjZpdDR0ZXFsK0VKNmFVd201Y2tHcDIwdjZBSnlYcVFoNWo0ZzE2?=
 =?utf-8?B?Z2UzZXpQenQ0UXhuT3U0VGVWTXBRNUpDeVppZUR4Q0VLakZBU242bHRFNHJx?=
 =?utf-8?B?dC9hYWsxeE9GY1lhTnpEekFVWVBOWkdiWUlLN0ZkdWlVcjk3ZlRMQzVWejll?=
 =?utf-8?B?cG9wVUNSbjZ4Z2ZQWFhjSEJIL2hNVEdwOUZFS2RKSm81QTVBYzdCQXRsQ3E2?=
 =?utf-8?B?UEpqSCtEUVFCY2QwdVVHQVh6SnRHKzI2bHFUbVJQSU9MYnFLRW1IcHg2MHpz?=
 =?utf-8?B?c1BVUTE4dGptT0k5S0JqWGt1N3d6aUl1NWFkaGJNTjU1Mi9MZlhhdFBkbmg1?=
 =?utf-8?B?KytVM2RsalZwT1BuVzJEcUpNQkFNQk5sdldJbGxHY1RLdUVLTWpQY0xkRElR?=
 =?utf-8?B?Wmsra1ZEeTFoQnc5OVJvdGFEYk9GaXVCN3NTTURhUUpzQ2ZvSTRMbEFYNkIy?=
 =?utf-8?B?R2JVMDAyczlsS1JOSXl5WGtucXR1cXlaMjVHZCtWZTM5ZGovL0JHTGJramtN?=
 =?utf-8?B?Nm1LR3M0UUNBRktrN0IvVGpJVnZEaEhiM3FQSjV6VjR6bUJVQUk1aUw1M1Vl?=
 =?utf-8?B?YjJxc1RLNXRQaWcvNXlyRGdEUC9FdUZ0NXpWY0J1d1JYaWx4Nk5wTnJVSWZZ?=
 =?utf-8?B?allsVk53K3lXQUltOU9sMTZtTlFHUVdyN0hIZjY5WHRNSGtRcmxlNGYzRUJv?=
 =?utf-8?B?N3p0Vi9PSS8rOWVhWU5hR1lucE9Va21vK0FQNmlUVGZiQXVIU3FWS05hUzR0?=
 =?utf-8?B?SDRpZ0ticktzRktreDd4cFRCQWhSOHBWOUxLcTQ0Rm85RkYrSlBxd0R3bVVR?=
 =?utf-8?B?aDgwamFub1NqT3Q4QnhjSmVUQVUyeFVweHZMVWpHZDljZ21OTWw2ajdKVGZ4?=
 =?utf-8?B?K1F2d1RuUllMam1OZGFFamRnOUh0MUFsQjFZWk1LUE4yVWhkV3BtMHB6YWFO?=
 =?utf-8?B?YTRZcEdrWDFyemc4b3pSajlRUUVPekYweS9vNmxsRG1rYng4MzhSOWNCTU51?=
 =?utf-8?B?Uktadk1zUWJrVCt4MmF1aUNGSXFoMFpReDRxLzd5V0dCcytCN1dlSTVCWk9q?=
 =?utf-8?B?VWJKcmtnUGFUMC9xWmpwZzA5SDFUaHhmTmZzWEx4a0E4UXpuUDhjWTk2ZE5u?=
 =?utf-8?B?ZDMvdlhpVVZNY2thMkJoUjBnYXBCdUpLUkF3K2VVSStoMUxrYkM2Rmg5dHFu?=
 =?utf-8?B?d1QwekEzc2xDcHR6Qmlwb29YZjJCK29LaVFDV0pIQmFpVmpYU3U2aklDY2VD?=
 =?utf-8?B?bWpzcnZ3UmxpY2xOUGFVY0pxVmNBTEpIZVNoL2s2QWQwL2lPWFRvSlBXbGR2?=
 =?utf-8?B?V3BGS253TU5wejZzZGc3M3hRL3MvZ1NKMEJTSUZ0OFllVk1QUU9DZEpNNmF0?=
 =?utf-8?B?L2FGemxSK3QxUTlhd1Y2MGRjMlVMQ2NkRkJlNkF3Wk1DRHYxcE1qOXZVeDBJ?=
 =?utf-8?B?dnRsdWR6REQzTVlIeFQzemF0ajY0MlMxVlprZ01VTlZ0bURudmg2WmxtcmI3?=
 =?utf-8?Q?O8C51NPMwlM0oV8VABKcMJHnUyw3ZWze8bw/s?=
X-Exchange-RoutingPolicyChecked: lj0DS0hiVxyCpm5zRse3qGwFj7bGOW+dn7gVzzruTZTsISAgI7KRYX9uxjGBio8QDWCo7sXTZcsc8xunvLXN4Y9MGxP8923cqwPAvoJ/4m88NhdqCr7YOtldcFZ9EpfmuK0DNzhZVwaATTmlieL02cnvCo7W2pVwVBjyHBIFmCC4vHExBOqV7bw55g3mepRU1EEX0YYYdNWynFJ/dwd1W1l6H/XmgWWUYx6XxkfovqltpvLiYNjIf4LFxj46acW4W4XdV5ep6n3GuKl1okl+IOLwQgxzGNjDVJgWByIyQ3H8jhpgSQGTmDOqrKgUKBY0UmBD0p1s/8LDoAU3sPrxXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 488deedc-f571-4cfb-0b2e-08dea66720c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:18:19.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W92lSOClfpSCG0Wkx6BOyjBoPkEhDhVTuxNxegjj8HqbhHbhsOBwO0qA57II52tXfvRK4svjhKbrUkqAzgcFcwvPtIzi7zl6Sa8AIZDo2lVMtWBLJ5E+Z4vTg5NdL6SF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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



On 16-04-2026 14:55, Vinod Govindapillai wrote:
> Use the common intel_fbc_get_fbc_status() to get the fbc status
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 54 ++++++++++++++------------
>   1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index c16f63199..b01959d2c 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1570,13 +1570,13 @@ static void drrs_print_status(void)
>   static struct timespec fbc_get_last_action(void)
>   {
>   	struct timespec ret = { 0, 0 };
> -	char buf[128];
> +	char fbc_status[128];
>   	char *action;
>   	ssize_t n_read;
>   
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	action = strstr(buf, "\nLast action:");
> +	action = strstr(fbc_status, "\nLast action:");
>   	igt_assert(action);
>   
>   	n_read = sscanf(action, "Last action: %ld.%ld",
> @@ -1620,12 +1620,12 @@ static void fbc_update_last_action(void)
>   static void fbc_setup_last_action(void)
>   {
>   	ssize_t n_read;
> -	char buf[128];
> +	char fbc_status[128];
>   	char *action;
>   
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	action = strstr(buf, "\nLast action:");
> +	action = strstr(fbc_status, "\nLast action:");
>   	if (!action) {
>   		igt_info("FBC last action not supported\n");
>   		return;
> @@ -1640,10 +1640,11 @@ static void fbc_setup_last_action(void)
>   
>   static bool fbc_is_compressing(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "\nCompressing: yes\n") != NULL;
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "\nCompressing: yes\n");
>   }
>   
>   static bool fbc_wait_for_compression(void)
> @@ -1653,45 +1654,50 @@ static bool fbc_wait_for_compression(void)
>   
>   static bool fbc_not_enough_stolen(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: not enough stolen memory\n");
> +	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
>   }
>   
>   static bool fbc_stride_not_supported(void)

The next commit deletes all this code and replace all this with 
intel_fbc_found_skip_reason(). Imho, we should squash this commit.>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
> +	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
>   }
>   
>   static bool fbc_mode_too_large(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: mode too large for compression\n");
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
>   }
>   
>   static bool fbc_psr_not_possible(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
> +	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
>   }
>   
>   static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
>   {
> -	char buf[PATH_MAX];
> +	char fbc_status[PATH_MAX];
>   	char buf_plane[128];
>   
>   	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(strstr(buf, "*"), buf_plane);
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(strstr(fbc_status, "*"), buf_plane);
>   }
>   
>   static bool drrs_wait_until_rr_switch_to_low(void)

