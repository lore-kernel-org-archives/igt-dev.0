Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42080C021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 14:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE21710E14C;
	Fri, 14 Feb 2025 14:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUINuvJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEC710E14C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739543580; x=1771079580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2TQvT66CHEnsMTxd7yRATkQFQdBTUpzKVHBuA+8k77M=;
 b=SUINuvJAe5u+BWNV5Bck8Ee20XoL8GunwTlBcU5gYmh92tPswcpjUsfX
 wan6sHIr5aeWYRKlYJaEqKdAqUURVcCRsugz8RaJyIT467p9yuJcdtOMl
 zJT3kZP0gvjG6+8M47P/HDrIXbCTK6r/EVkSzGBQKLa1mGAJsiN05lMbX
 Ry/2xCt03EDxt8OSgonOhP79s6HAllH+hohW7SYHWtPR9mwn+RZl1J1p7
 L3OIX/c089NKhFItD/uPuReYyr86pKVplqxVVZwRB5Odwe0Mq3VnPOo/5
 wQ8+se0UEBLzAKh74C9H+6DSXGDnnAbgm78k3cc0AHx95wU6sCCxcXFx3 Q==;
X-CSE-ConnectionGUID: w1sGICJbTAma47J0QjDY2A==
X-CSE-MsgGUID: MY6a10bdQTib9il21rALcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40327697"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40327697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 06:33:00 -0800
X-CSE-ConnectionGUID: yZaqihN2TWG42RCviTpiXQ==
X-CSE-MsgGUID: YLqI3STkSfOpnLnUrU8S9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="118577341"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 06:33:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 06:32:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 06:32:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 06:32:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwkyvL525pRZl/dUeys1CBU2ycul3IiSjN09HPcET4duGPcuIFWwnGgOqoWo41eegQ7ioO5qlmPZQ7zqmyPhmw6GaPgBSi1IcuHay5cEEU0JvWHL8C+VGFVPf8KoFAtIvKjskzn7wpeI8Fzo0YNt7ApGZPnagsh0jnkVqIAhKF1+S+k62zbIxlTRe7C6s8xPjpYfJ5pHGITeXMYnTEt6WRqeJh34xlZtrXj5Ju0cu6JLxFWJpejL4YGsUnrURE47Q/8hOZ6NEAth3sX9lcp7c334sgqwrxYyWWnVSTsxKozX7YqC2Q3p732dsCGGM3iVqI971+khq16rSjYdpV9BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Noori7O2N5m0Xde5OOAmkIUBHSZGPopTkHYflH61rm0=;
 b=XFzTss3eQlts1AJ+2gmr4y+93zmGMIiHz2sFskTbvrFNl96NyQw4z7wPEnZm9lOdpNuEo5nPLSyRhwbEt9Y12MXZCy6m5iiSoDf3E5EzYu7jvhxxs7fq8Xon9TWJS8ugTv8hQgDUzgpWCxaR7+DnSg7BfjNmR8Pjlp5YPbVnKjIuiWy5vSFpk37Ypv9/ZtUh9UTamCcZWQgAs1ynof9OoUIR8uBOjoyZMm/kILi5s3Rb25ixWt1c67sK4utTDCa1WOOn/lmVnFNGY8gjjjvg+ybn7SqTm8o0r7r8PcGTKYPwzLrNc0ctsR0RfdHi/SZGLHOBF5qf+g5nKjI1a5ZP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 14:32:54 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 14:32:54 +0000
Message-ID: <b3037d29-30f2-4ad1-9b28-1bd4547a168d@intel.com>
Date: Fri, 14 Feb 2025 15:32:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 4/5] tests/xe_sriov_scheduling:
 nonpreempt-engine-resets subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
 <20250212184757.586071-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250212184757.586071-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::48) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: efa63e11-58d4-4547-404d-08dd4d0477d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHpCUUdpRlFneUhJbkUzSWUzL0lRU25tUnJMRFVPMU9RR3AzSzlxZi9vOXJs?=
 =?utf-8?B?QmJqVjhGdDhid0NsZE1yb2NVKytMajBIT3BZNlZRM2l0dnh6WjVLOFNjcDZv?=
 =?utf-8?B?WDAyZWwySDExaDFVU1F5L0NtNXVuVm81d0ZLYWlFcTNkMGNVM2I0TnBibG8v?=
 =?utf-8?B?MDhITHN6K3ZWb1dtUlBlanZnalU0YmFyVVpvMk1WWnRLeUZOa2QxTDg1T0Z5?=
 =?utf-8?B?M2YzODZrZWZhSXZVYmVKSE9SZ0FDdndkMDRFV3dRcjc5QnVCVVZ0Z3ZtRXNn?=
 =?utf-8?B?ZmVkelJEQ1JEcWVTMUU5S1JnODVhRjlQRmI1M3RRZHNDSWhDSEprb0xlWmxh?=
 =?utf-8?B?RFNORklXMmU3MHgyY3ZGV282ZzFMa1htM1ptelBXeXk5N3VWTHpIT01LU1Iw?=
 =?utf-8?B?QjhqazdHOWRocmhYbWN1dEZ4S1pjWVFDOHdDRFd2T09EcEJDVFVrQTNhYjlj?=
 =?utf-8?B?TkdYLzVUSkdMMXZJdEp6TVJ4VmlveVdUVXl1enNFTjRoVEVNKzVBaWs4aTh5?=
 =?utf-8?B?WFlTUFdidXdwNmFENjdEalVNdkxLZ2dpaEkxNUpjak92eVpENnkzVUlFZWc2?=
 =?utf-8?B?VklRWC9SNVF0bHp0aFp4V2pTNTV3WU1IN1prQ2ZxUE9DRUdlM2tuOUlSMm81?=
 =?utf-8?B?VEU1eGxyK0VOV1I1czhFdU1DOENVczRGa3dKY3BWVEpzSkUyYWdpL1NxRzNv?=
 =?utf-8?B?ZllFWEVQRUo2OG1mZDJUbTRUcFM2dmR0SFVvZVJra3IzVjg3cjlld0pxSWhN?=
 =?utf-8?B?MjVVVG8rMko0OUZYZng0MTkxSVNCZjlDUGtUQzE1OVMrOW9Sc28zeHJjcFAv?=
 =?utf-8?B?dzE1UW1mSTBQYm5LRjBUZnhIUFg5WWpzYUorZmptRjVjV3FDbm5NbCt5ZVk0?=
 =?utf-8?B?YnBMK1hSakRrQjY1OFM4SkxReWJwaWFmQTc3dzNEMkVZT3o2QTV3NFpkU0VU?=
 =?utf-8?B?TVRPN0JESFpqeGxwdVZPRFVycUlVZkNwK3d3R3lSRy9EeWo3cm95UHU5bTE5?=
 =?utf-8?B?RVgyK2E4ZGZhamVyd3ZscDh3Ymg0SENtRlFldFFNL2xPWVZQQ2RTQnBCZlZ4?=
 =?utf-8?B?dW1vMWZPZ1pYSkZUSXhMZWFSdU82allwTmQzRHN3MG9zMlZpcC9jVitYd2lJ?=
 =?utf-8?B?T3JoM0Q4dFNvdFJ6eGJtL0Q2ajlIRHpWUlprYWRMZmRvUXUxV0RVK1FCSE5Z?=
 =?utf-8?B?WVozSnBpUERTc1ZIV1A0ZG44NmtySXJQaTVINmVxNXBJa0gvSHFGYTBoSUkr?=
 =?utf-8?B?ZExVSEdIVFd3SXVoTUg5YlA4NUg4SkpKSEwzbEdpaHN3WUdKdUtsRGxHVlpr?=
 =?utf-8?B?RWk4UWk5TE9tWmRLaStwMkM4UytqWUlNSEE0a1BWNHdwa0JDSWhJblBSZGJa?=
 =?utf-8?B?MjhyS0RGbGxFNmc2S24wV0lLUnc2ZVVSTVh4THY0OW4zUmRlMjlOVmoxR1VR?=
 =?utf-8?B?SXU4ZmJ1b1I5c1J5YXVJRVJ0anAwTEk1dm04enBMNWFUaTFHaHdtMVBTMkZv?=
 =?utf-8?B?M0EyT0NqSkltODZic0xwbkhrZndkMVRGdW04NlZ1NmIvQUdyTUkwWHRZVldS?=
 =?utf-8?B?dHpLMGlOa3BMU1lJTzU1VGUyVHdOKy8wRGdXZmNnVUZMSUdkSXRCRWZQNzZB?=
 =?utf-8?B?YlF1R2lsaDdobWRDcVZxK3hEZUJXRUd0ZzRpZkZtVUUwMHlSazBQd1J3Nmxi?=
 =?utf-8?B?Z2JvZzFibVYwOHlFYXdaYnZxYThyaW15V1VFTUcxUjdWbW5aYW40NDhkc3ZY?=
 =?utf-8?B?QXpDV0JxcEgzYUwvajQrcEJHZ1U0M2NPY2Y3TmFwbmhTS1NWeTRrcjFaQXNO?=
 =?utf-8?B?U2o2SFhBcE9EcWR1NytHVzRLM2FScnZrUGpzYlkwOGl5blNDNU1LOHJRWlY1?=
 =?utf-8?Q?HZIgRsaK4WeGL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXh0UzVGb1NjM1ViMW0xYTg0L200QzA3TC9HT1JjMGMvd0NjT0VteTQ1Skpu?=
 =?utf-8?B?aHh0Vm54bUVwOXd5YldQR0ZpZzgvY3hPa0F6Qm9uYlZrRmZZUUJqMkFvUVlp?=
 =?utf-8?B?UDRGRmZqMkNEejQxYUd5d2d4Uk1EOVhUVUV3ZTBIdGJMZlh0Tk8rK2x1bW1t?=
 =?utf-8?B?YVk2OCtHNTFwTVVWdTFLa1NRVHJZN1pXWFhYeGkvVm10K3UrNWFRbWF2TU1o?=
 =?utf-8?B?cy9seEZDNFNYTFRqcFZkWW80c21RR0ozN2wwQlBQMnQ1bkE0WnM1cVMwNlN5?=
 =?utf-8?B?QlI1VloydThFZUw5Uk5rcFZMWVJ6MFZhZCtmeWQ0cmpOd2FIZVgxWGJjVlE5?=
 =?utf-8?B?eEZ5Y2pIenBsOXRHNWcwdncwZEh1bnk3N0UvRHc2RXBnYnNSZ2JzYm1PUWRS?=
 =?utf-8?B?SzdoUmxZQWVMN1N1L25uNE1xQWRPQlJaWDFtRXFtOWdXekNka05TblRUN1BK?=
 =?utf-8?B?cmhtRE9md1BFbFg0b29sRHQ2N2lNSkRucWNvdkpqWjRIY0REZEhiYk5GZ1Aw?=
 =?utf-8?B?VlNJK29lSjBSRFdrZ3Bva0RLRjY3OGl4SXo5NEpQQmhkWDA4NjFyTllnWGYy?=
 =?utf-8?B?UjZiQVlwZTBDM1JNdzEyWisxZnQxemlwK3Q3S0oxeHVGT21xZ1FnSXg2aE5m?=
 =?utf-8?B?YnhwdEF5bks3WmhST2lodHJFb0g1VXlSMGp1aitqYkpmbEFmanUyTVBBUVJV?=
 =?utf-8?B?ZENjZnh1am5JUll1RFdNOVcwVlRFQWpwc3h0anhUVHFULzd4c0IyU3FtUmpw?=
 =?utf-8?B?Y3F3TXA2dGRBK3VxS1FhK2tLWEFjM3NTZXcwK05pdWpvYjg2eWU4MHZjUVhi?=
 =?utf-8?B?RkRNSzJVOE5xZ1ExQ0VvZ2QwNURYb1FBcXVFcDRxSHRhVmhscnJzTG5hU2U2?=
 =?utf-8?B?Z1lSVTBuYW5NaksrUm9ySGZWSjVGb2xhVzRhY1pWZlJFU2doUjNlWERIcHg1?=
 =?utf-8?B?THpWVnMwaVE0Q1VORTFSVDJ2ZEIrdVFlcWRFTzkrQnZGSkFWOWxQSCt5U0wy?=
 =?utf-8?B?NkFuVFRpTjdmWjJtb3NoZEEzYUtvbVJHTWhQR2YwVGxnSEIxZGl5OFlyUlNy?=
 =?utf-8?B?SkJudUFxeEpjVXcrVzdva0xjVXROd3hMWG1TZE1nbW5jbEYxdUtBZzBGbHFK?=
 =?utf-8?B?Qk4xYjg1TDlXNVY2QXhYQ0pld1lROEJQeTZqSVhYR1RId3o0KzY5STNFNndq?=
 =?utf-8?B?UlVnQjJOUVNaSzVRam1SeEUrbDhSL29mQ0UxUWgwZTV0T2RmMzlkZ25VekFE?=
 =?utf-8?B?c3c5QWVwN2IrQVd4YkY3aTFnRXora3pId0dwdXRhVjkrdWFOZVQ5V2Iyajkw?=
 =?utf-8?B?OWo5TGRQbnhpYWlXVExaQU5DZ2pZaWU1T2x4cDlXYVdPNkVVZlBOSzNJRkhB?=
 =?utf-8?B?cHV5ajEweFRrYUozdkw5clo3eEk2VlNyR0U1ZXhTczM2TUR4ZVJVM0Nha3Zz?=
 =?utf-8?B?Nnd3cksxcWlQeFBrM0NkRlIzODM3MkRDUkl2cWdxVjNFdndKV0xYbFpyVEwr?=
 =?utf-8?B?cWZjTUdzdDFKZmhvQk5ldCtJM1d3NjZsV3JMVTl5WWRpSWQ0a3FaVW1uYmhr?=
 =?utf-8?B?dVM2ajZ4YmJIbWZzU2kxbmVIQ1IreXVFdXRjNUhrTEg0MEx4MkZvOC9pbzZL?=
 =?utf-8?B?d0ZRYlMwTnA0SjIwOUQwU1pjS0ZTNzBuZGwzQVNkRURXaGRuRjJ6QlNwejBp?=
 =?utf-8?B?L1VpcmxNRFJJQmhRaFhnclZ4elQybXpPNXBsaHI2OHNkMERqU1JpK3h6UVUw?=
 =?utf-8?B?Q3VuMEIwdEZ5RmhHUjdyd2wvd1JuZHdYMHQyRlorT0NuRGI3cFd0ZG4yeFpI?=
 =?utf-8?B?K0lWMnpvUEk5Z0hiTllZSlNZZ3hOUUV1L2VRbDlSc0Q4b0lUN0lNYVZLeVRj?=
 =?utf-8?B?N0ZiSVo0RG1kU2U1TExtbXZpMTNEbUc1eDlWSVdmL0NqbGltOGdybHozL2hZ?=
 =?utf-8?B?NzRiYVVDKzkxRkQ0bHdTcjZQTWdSZW5OeGhmY2FYREg3bnhlcjlPcW9DVXlx?=
 =?utf-8?B?cE9PMnMwb0xKYWwwS2RSdFBiU0lJY0t3UDFwd05qekdSak16eWdYaFdWWHhs?=
 =?utf-8?B?UDFXajZKRzFwV21CSXpUdDk2bWl0R2RWMXZOei9yOXZRWFpTQk5zM056QUMr?=
 =?utf-8?Q?Y7WnV0+rxikOCRDxxSpEYZao9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa63e11-58d4-4547-404d-08dd4d0477d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:32:54.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB/z0no48Wip+VNT2dVQbRPWvVdwoyoAnNkBsjk1c3e8ug26trbmDbasP33Gb/hTFxKEaS58ZPb5Q0fTaYZ7FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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


On 2/12/2025 19:47, Marcin Bernatowicz wrote:
> Verify the occurrence of engine resets
> when non-preemptible workloads surpass the combined
> duration of execution quantum and preemption timeout.
>
> v2:
> - Replace magic numbers with defines (Lukasz)
> - Reuse adjusted prepare_vf_sched_params
> - Remove redundant asserts
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 94 +++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index a9ac950cf..fe037c1dc 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -620,6 +620,87 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   	igt_sriov_disable_vfs(pf_fd);
>   }
>   
> +/**
> + * SUBTEST: nonpreempt-engine-resets
> + * Description:
> + *   Check all VFs running a non-preemptible workload with a duration
> + *   exceeding the sum of its execution quantum and preemption timeout,
> + *   will experience engine reset due to preemption timeout.
> + */
> +static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
> +				     const struct subm_opts *opts)
> +{
> +	struct subm_set set_ = {}, *set = &set_;
> +	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> +									 JOB_TIMEOUT_MS, opts);
> +	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
> +			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
> +	int preemptible_end = 1;
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +
> +	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
> +		 vf_sched_params.exec_quantum_ms,
> +		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +	xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	/* enable VFs */
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	/* set scheduling params (PF and VFs) */
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &vf_sched_params);
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +	for (int vf = 1; vf <= num_vfs; ++vf)
> +		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
> +
> +	/* init subm_set */
> +	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> +	subm_set_init_sync_method(set, opts->sync_method);
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		int vf_fd =
> +			vf_ids[n] ?
> +				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
> +				drm_reopen_driver(pf_fd);
> +
> +		igt_assert_fd(vf_fd);
> +		set->data[n].opts = opts;
> +		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> +			  xe_engine(vf_fd, 0)->instance);
> +		subm_workload_init(&set->data[n].subm,
> +				   &(struct subm_work_desc){
> +					.duration_ms = duration_ms,
> +					.preempt = (n < preemptible_end),
> +					.repeats = MIN_NUM_REPEATS });
> +		igt_stats_init_with_size(&set->data[n].stats.samples,
> +					 set->data[n].subm.work.repeats);
> +		if (set->sync_method == SYNC_BARRIER)
> +			set->data[n].barrier = &set->barrier;
> +	}
> +
> +	/* dispatch spinners, wait for results */
> +	subm_set_dispatch_and_wait_threads(set);
> +
> +	/* verify results */
> +	for (int n = 0; n < set->ndata; ++n) {
> +		if (n < preemptible_end) {
> +			igt_assert_eq(0, set->data[n].stats.num_early_finish);
> +			igt_assert_eq(set->data[n].subm.work.repeats,
> +				      set->data[n].stats.samples.n_values);
> +		} else {
> +			igt_assert_eq(1, set->data[n].stats.num_early_finish);
> +		}
> +	}
> +
> +	/* cleanup */
> +	subm_set_fini(set);
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
>   static struct subm_opts subm_opts = {
>   	.sync_method = SYNC_BARRIER,
>   	.outlier_treshold = 0.1,
> @@ -697,6 +778,19 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   				throughput_ratio(pf_fd, vf, &subm_opts);
>   	}
>   
> +	igt_describe("Check VFs experience engine reset due to preemption timeout");
> +	igt_subtest_with_dynamic("nonpreempt-engine-resets") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, vf)
> +				igt_dynamic_f("numvfs-%d", vf)
> +					nonpreempt_engine_resets(pf_fd, vf,
> +								 &subm_opts);
> +
> +		for_random_sriov_vf(pf_fd, vf)
> +			igt_dynamic("numvfs-random")
> +				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
> +	}
> +
>   	igt_fixture {
>   		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   					  &(struct vf_sched_params){});
