Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA2CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 14:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079210E939;
	Wed, 10 Sep 2025 14:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwkKjMXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA56B10E939
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515846; x=1789051846;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uHckG3z+JuxVU2X0q7QBvGBqbKEWojScTrpmRw8ATh4=;
 b=lwkKjMXiEBWtHSFjKGTbgpeCdrxk/ieiKgYz6ic5FOJtLwb5D/SABt9h
 veLH0Ywwtk0WSwua7n5E7FQmTIvxDod0c0zRSYieyfblRUzm5yKsUGZWz
 KS8fWY4hEoEVPV4u2DytlfK2IRxXGymN33kVe1G6xQQ2K9y29/LFqz6fq
 6io0STop69OjbFUHEqpBU4R+4VTjmwRm8/fLO5qYEd8orwf2rLqYc5P7s
 V+PSS8S8Das44+1uI7CerZ+dgBVXarlbNVOb5ype+RuwQXN3EDZqsEsmd
 VWXJfWyooYFfSLeJcUiXZuJEUmX8/1nPak0fdmg5R4iW6SUuZLLUFiwEu Q==;
X-CSE-ConnectionGUID: wbTPnSesTH+ZcnFsaX+yyQ==
X-CSE-MsgGUID: 5nPxSMDiQfaDacN/7JxPfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77435049"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="77435049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:50:46 -0700
X-CSE-ConnectionGUID: 5h9FKofYRIiMgpeMCs26vw==
X-CSE-MsgGUID: 9jZFhHCjT8ST8AQCQqRYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173009481"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:50:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:50:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:50:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLWjtDWXu0YCf4FCNbhERLo8iDJWqrj8AOhuMtkhEYsdSODmLLdiWjPLW5r0KLbKMt431f7uxwHDMMhzJnlzMK/xaYDeHoW1X7aNYcg2DE1DiVm+ttmtFRgwaS6w7fZWRyHdUn2FbxSDAIhgV00ErVUOAgCRYOwTaFvU84q23+8g+eIB86FmJk/hIRa2z3za2v8ZJ6oVKA1ktf10d+voQbK46BblF1FNsiFJ4mkfiQ3KCXbO0dD1TSVzpie7K4S4x3JxfBEdkWCfYEFXkUkRy2vYO0HG2XDbP4IDUFthPrhLT/XjHWGQH37Mtz5VVt/lwwIbXYPr6CmdO1ZKFeKUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cupjdb3sDc0MUcSmruyM1IimRx4RqPy1avySv5UB8gY=;
 b=BWPuRkT9Fk3EK26lMgf7VPsDNywhIeuY0A8+Zq6sdzHqQSZsaPmVHyGg43/Cw1nfkuVHhCrLc2XfkDzPJaWHdTYNKXSod9dmwvogTbli2zPCOUByJReM1p8N7JBaYruKYK5qTWk97ptlvlo6Vb1b/ZzjAKToj/QWmE0KIBmmMZXHzRKQnWI7jhAE2kbfJyHeEIzRwyQzHujQdhoFkzJgWLVC7Xz4omfXOb0a+/WpfSgaELRnoUO1S1Oj+/xzVoAQX/ed0aSrkbgj+uHJ/QTa8HOCt53jTvau8VTykArpQz2yiMp+/C3zifZQO/uRazftYIvEOUrWbyUGrz+RWCBriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH0PR11MB5298.namprd11.prod.outlook.com (2603:10b6:610:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:50:42 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:50:42 +0000
Message-ID: <36f06cf6-1834-430b-99d2-2071f268f134@intel.com>
Date: Wed, 10 Sep 2025 20:20:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
To: <pravalika.gurram@intel.com>, <igt-dev@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>
References: <20250910141045.1141826-1-pravalika.gurram@intel.com>
 <20250910141045.1141826-3-pravalika.gurram@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250910141045.1141826-3-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH0PR11MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcdcdcd-c66d-4e13-76e1-08ddf07969ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFc4bGVxQnNZYU91MkVQemtZSGRmVmRnbDU4UHFoU3hBTnBHSkVSR0N2L0I2?=
 =?utf-8?B?RjhqaUZrVlkwOHNiaTJMYy9XRW0ybi9abXdMVFZjZGptREVJTmtoc1hDSUVY?=
 =?utf-8?B?SGdkeWhZNU1Ub05jOVdnYnJHbHp2VkdxVTF1UVZGWXZhT2pMQWt4MDZUbzFF?=
 =?utf-8?B?OG96WktwM0d0TTh5Sy9uM2tMRTc2QWRHeDF6NXNXTzZIY2NJNU1nUzRGNENq?=
 =?utf-8?B?T2QzK1BxUnFqNENqSVBjdTVIRWNsdmFRbkVqeitKelA5bzM2ZngxSTBCVFh4?=
 =?utf-8?B?M1pvS3ZkMjRqK3lUenk4amt5ZXpaakJ1aVg0NUlqT1RCV0F0RUJTM2RnSDlQ?=
 =?utf-8?B?NjFYaUdzR1hsU2ZrV21odW8vZHhZdlZsS3JoZkhIY096NFF0b1pOTW5TNE9V?=
 =?utf-8?B?UG43UC9JZUxsSWpNeVM1Q0FyWmtOOG1FMFh2Y2xHcm4rOHJRa2FYTUQwWXEr?=
 =?utf-8?B?algxbWRIRFEvWll3WVVSRUdOOXJsaXdIZHQ4K2dEeFIwdFpseFpzZEZCVjdG?=
 =?utf-8?B?d0lReWxCWjJJQXA5TmVxZmppbmwwa2Mxc0Q4ZlBveUJQZnI1aHNJd2xnZ3Vt?=
 =?utf-8?B?eU9FdE94U05Vc2R2U1BPMGNjRWY3Z2hHSVhxdlgvdmFyL1NLSGNxNjlDTEFQ?=
 =?utf-8?B?ejdJc0lqM21nZjZCVE9FWCtNNkhvSmVOamNjaGE4dEp2VzFVNlZ0UWVZUWpE?=
 =?utf-8?B?OHNSRE5XSmxXaUNzQ2FDa21LR3BBbWRuandHeURKT28yRktYZkN6YU0zbVpO?=
 =?utf-8?B?a0pIOS9JcE5IQ1pwZkprVEhiN1ZXN1lFUlBhRFRMVEhNZUJ6cEQ4RnpUaDE3?=
 =?utf-8?B?UEZ0Syt4ZnJKem5HTXZ6NFNYRG8zeXptQXdUN05sQUNWRnRYeVMzRm44OGx0?=
 =?utf-8?B?QkQ3TzBCSzFuSVFWT1NQNDVaWVloVFJqcjd3ZlU4NTFvTnF3c2FvcmF5N1dC?=
 =?utf-8?B?aFlYdmZra3l0c0xUa25odTFIWGFMY0EzRWc4M1EyZWpyazFXaFU3WGxFWUlC?=
 =?utf-8?B?b0twcldXUTBhcGxkbXk5azBYY1g2aEpXZEdGMnl3MzM4ZFRseDdwV05jZWlk?=
 =?utf-8?B?cURTb2lPNTZSM2IvbTZMVWk3a09UYkpWUDM3TDZCYkovd2tYVDJHL1pYemps?=
 =?utf-8?B?SU4zS09nbTFKdkZrOTNXMUpDdTJHZE1ZTlc4UndrL1Nob3NJWXRNYWt3blg0?=
 =?utf-8?B?eDE0MjZMbm1KbVdpZ01ZOVJpM0xUNjY4VkdiYU5IZlh0U0ljdVhTMFB2aW9n?=
 =?utf-8?B?THVXN0FiNURkOEtweStoSnhoLzQvSVQ2cjdRNFBqZmcwRTgrZmlPYnNnYThL?=
 =?utf-8?B?cFM1aWFMYlJRMVZGSUgxYS9Fc2wrdW9GZGxDNTBVNnhndGM0V1kwcWJ0aUU1?=
 =?utf-8?B?UnV6QWpYRVEyZVNvbkw5Z0lsQ1ZCbnRvYjBDUWhuQ1kyZkpOT0F1YmR1Szlq?=
 =?utf-8?B?cE5mREsxcnQzU1I0d1RnWXBsRWY1VkFQRHdrUGhlVlNWZUVtMk9EMVJBN1Vn?=
 =?utf-8?B?eUFoSnNMR1RRdFhJMWRzWHlVS2JaSlN2RzRYWlNVMTNwNVdHM2NEMWJ6YW1v?=
 =?utf-8?B?YWcxMlVGTnc2eTFPS3pzMWJxcE53VU8ySFVHU0JHVi9pRDZwbXhveXpaaGVP?=
 =?utf-8?B?bUc3eG8ySW8ySmdhUXBjM0hwMDg5MVVZUHdQSGRUMC83RURCRkNwUitIdUhE?=
 =?utf-8?B?Z3JIQ0ZPVWNVMHpucTBnZU43L2l4VS9WQ2tmTElHY0kxWC83NytpSXhHUmFU?=
 =?utf-8?B?Zk1PTHJ3bi9tZkl0b0RwOFFMZ2h4MEYvYk83YThKOExtMGxmYi9OSDVqNE8r?=
 =?utf-8?B?T3NHZ000WVI5Ui9YUHpHZk9KeTVaeWVPUHJlTmtqOVIzcVpnOWhMeUJXVUZD?=
 =?utf-8?B?RlVBQjg2d1dnMlA0dWZybVRUZU5oVUpLMG00MFVEMm00NGZoR0R3L0FYenhB?=
 =?utf-8?Q?9ijLqdoncmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBuYUJsL2w1a3RLaWtSd2Q1TUlqRG5KdGo1N2FLUHR0dWVDTGluL2VvVFF4?=
 =?utf-8?B?M0ZBRTcyb1BDdE5IaHVYaFRFRENSL0ZaazZla1ZDNlk4KzQrdnFaM2ZLN2tM?=
 =?utf-8?B?dmhRbFdZa3liZS9IdHVQTkJWVkl1cHVxejRrU3hTbmN4eURCQTZyczNYbmQ3?=
 =?utf-8?B?RTZEY1RCRnpldjV0Tjk3UFoydEZiRWd0TFV4VFljSXEvbXpxdjBMVVJkTENh?=
 =?utf-8?B?YUk1QWkvK2hMWGxKQWl6VkNuMzhpcFhRUlZuTExMeFBRaXZDdmJxaUR3NUFI?=
 =?utf-8?B?c1VINWgwdnV6amRRZXBNekRwcnhOWGNOQ1lQVGVjNFcrekM2TFdrdXBEZWls?=
 =?utf-8?B?Tk1WbC9zUzhGZWIzMXk2LzZhRUhRUFFDaTFsaGFaUnAyc1JiRURwWk1MVTZN?=
 =?utf-8?B?ZWJ4MlhzWmp0WEMvVXFuNVlZYjVseTBoR1kyKzkxZDlFOGxvbnFBbXFUenJR?=
 =?utf-8?B?b3Vmc1NjakZ2RkFHRktNUkRmVHMyYzU1UFgwTFlZUlRUSHd1TUVoUzdWMnJ0?=
 =?utf-8?B?VVhTbFNkZG11Q1RMMUYrN0NYR1R2SW9TaVpPSkZLeU9jcU55VzZGVTl0K2lB?=
 =?utf-8?B?endENC8waE5BdG1EcU10Q3lxUW01V000WVM1bC8zbmRNRm1QVmxFUGR5UExZ?=
 =?utf-8?B?dFR1L3E1dzEzWmlxWkxLNUswT00xZC9RbmMySkNUQVo4aHdFenNvUkdLR1Y2?=
 =?utf-8?B?aWxhNFQxdHVXRDRGdGJYWDRkUndRS1cvSkpRZ096UG1IeGhFNFdNL3QrZ3hr?=
 =?utf-8?B?dUd3YVJwQ3YzQVFjVjU5aFpQNDc5cit5WGVoUy8yUWdLR2JKVHBVTE5lbXNX?=
 =?utf-8?B?a092cFZBeU9pc3oreThoTThlMWNRdzh6bEdaWXNTelV0K2JqS0tKd1FmeXRL?=
 =?utf-8?B?VlZQc0pUNkRDcloraFlPbDcyN2I0UU03NU1UcUdrTGhWRnY2REFwckJaN3U5?=
 =?utf-8?B?ZkRESXlrMm9kNjFyd0ZhWS9YUUVZbVh6TzFQZGVsU2FycGp3Sm1PbUhsdU1Z?=
 =?utf-8?B?WjdtdU1tY0c1V3RDQ0NKcFVDQ1cyTmxYSVVWcWNhNzljUzJTTEE1K0ROMWFl?=
 =?utf-8?B?UHBWd0UzdnFtYWpHeHd6TFhRZC8xR2hLWGkrRVN0dHlhWDhkMlp3elgrQW5T?=
 =?utf-8?B?MGl1eHNXVHhLU0FienVwcnZYYTVBbzliajAxOUsxSHVLR1JsM3lJZzFwQlh4?=
 =?utf-8?B?RUJLT2o5cFdPNUlCNVhzVG05Wk94b1hRV3BqTTVzeXFkb2RmdmxiMGZRWElx?=
 =?utf-8?B?WFN0L0pLOVAxTE90K1l6ME8veUZWdjh4dFB0bm1xdWFCTHVvaktLa3RwM3gx?=
 =?utf-8?B?ZEM0Mit4QjM0RUFCQ2VVSWQ1VHBwSGt3QkljeG1UZ2F3dmtES3pvditod24y?=
 =?utf-8?B?U1VGSzE3VFd6MUZpamlIK2FUQVV3bVNncFpVZ2txWExQemUxL1ZhaG1HVGwy?=
 =?utf-8?B?ck0xVjF3VjZ2ZTlGak9oeFlHVHUrWVBiWC9XZjdKRzB6KzVnODFBT2tqUk9D?=
 =?utf-8?B?aytSMGZIdzA3QWNWeWw1cEU4WDErZHRFeS9oVzViQ0JDTXY1ekQ3emtaVjNt?=
 =?utf-8?B?RGVJZjBWTDVPMjE4NHhmQWlyaVdCOUhiRTR4V25kVjBNL080S3B5OWFuWWFV?=
 =?utf-8?B?Ti82TmJHMzZxbXJQQzFDQXg2eU9QTXBwY0tvbTlReFRpQU0yejdvRzhCbEFh?=
 =?utf-8?B?b2s3dVF6MkQ0cldvaEpqYWE4SEZpL0YyZUgrZkVTdlBIYk1wZVo4SDdUYmxl?=
 =?utf-8?B?MFhqbjY3UUFjaHRjY0ZoZTJmVTZuNWszNFFLQngya2ZEdHgxNjBkRkJEaklB?=
 =?utf-8?B?cEJkeFpFYitodzQzMVVtUU5pc1NEU1ZsUWQ2bmUrMExlR0liTjc0azlWbDBz?=
 =?utf-8?B?U1lGUkJIaEVTY2gxRE84OG9DNlljT01WNUZGTFJiRHBIZ0hFU3h2NmpxcU9S?=
 =?utf-8?B?TVZtdXhOdUg3eHpsS1JDaHYxa1A0eFd5bW1vUWJVbDd5cnZGQWl3Tkx2R00r?=
 =?utf-8?B?Z1kwOUdScUFiTjRXY1YxTWJTVm9ZVDVCdUc2dlFxdGZSeHN0TkRJa2lRdTBv?=
 =?utf-8?B?bks3aDMrcWxETUlmRVRZdW1wbm1jSUNRRzJ4blJhSGJwUTBLRXpYamJCVnlz?=
 =?utf-8?B?MDJBZEZPYUZtNllQNE9Sc0ZPYS8ycll0TDlXdXczK3hyaHpZRUFjc0RQNnFJ?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcdcdcd-c66d-4e13-76e1-08ddf07969ed
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:50:41.9343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DFrkKHccXkV5iCkRymwHtVbYgJ2zH0XK5xGHCLvrJTRyz1EgwkUwZpax215jvKnDTz2DbGzvH8MRxaEcG7tnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5298
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


On 9/10/2025 7:40 PM, pravalika.gurram@intel.com wrote:
> From: Pravalika Gurram <pravalika.gurram@intel.com>
>
> Add pat-index-madvise test to verify setting different
> pat_index values for multiple VMAs. This test uses
> madvise to set various pat_index values and
> verifies that different PAT values can be assigned to multiple VMAs as expected.
>
> v2:
>    - Remove macro which is not needed and alignment (Nishit)
>    - use existing struct by adding new member
>    - Remove num_ranges to NULL assignment
>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>   lib/xe/xe_ioctl.c                      |  27 ++--
>   lib/xe/xe_ioctl.h                      |   2 +-
>   tests/intel/xe_exec_system_allocator.c | 183 +++++++++++++++++++++----
>   3 files changed, 171 insertions(+), 41 deletions(-)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 62e9fe9eb..06ea6e6ae 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -79,20 +79,21 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   }
>   
>   /**
> - * xe_vm_print_mem_attr_values_in_range:
> + * xe_vm_get_mem_attr_values_in_range:
>    * @fd: xe device fd
>    * @vm: vm_id of the virtual range
>    * @start: start of the virtual address range
>    * @range: size of the virtual address range
> + * @num_ranges: number of vma ranges
>    *
>    * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
> - * memory ranges from KMD. prints memory attributes as returned by KMD for
> + * memory ranges from KMD. return memory attributes as returned by KMD for
>    * atomic, prefrred loc and pat index types.
>    *
> - * Returns 0 for success or error for failure
> + * Returns struct drm_xe_mem_range_attr for success or error for failure
>    */
>   
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
> +struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges)
>   {
>   	void *ptr_start, *ptr;
>   	int err;
> @@ -113,22 +114,26 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
>   		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",
>   			  err, query.num_mem_ranges, query.sizeof_mem_range_attr);
> -		return err;
> +		return NULL;
>   	}
>   
>   	/* Allocate buffer for the memory region attributes */
>   	ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
>   	ptr_start = ptr;
>   
> -	if (!ptr)
> -		return -ENOMEM;
> +	if (!ptr) {
> +		igt_debug("memory allocation failed\n");
> +		return NULL;
> +	}
>   
>   	err = xe_vm_vma_attrs(fd, &query, ptr);
>   	if (err) {
>   		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
> -		return err;
> +		free(ptr_start);
> +		return NULL;
>   	}
>   
> +	ptr = ptr_start; // Reset pointer for iteration
>   	/* Iterate over the returned memory region attributes */
>   	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
>   		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
> @@ -144,8 +149,10 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   		ptr += query.sizeof_mem_range_attr;
>   	}
>   
> -	free(ptr_start);
> -	return 0;
> +	if (num_ranges)
> +		*num_ranges = query.num_mem_ranges;
> +
> +	return (struct drm_xe_mem_range_attr *)ptr_start;
>   }
>   
>   uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index a1df810de..a41c48db7 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -106,5 +106,5 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
>   int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   		    struct drm_xe_mem_range_attr *mem_attr);
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
> +struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges);
>   #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index f61a4ebf4..0fa178962 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -515,6 +515,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>    * SUBTEST: madvise-atomic-inc
>    * Description: Tests madvise atomic operations
>    * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-multi-vma
> + * Description: Tests madvise max pat index multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-single-vma
> + * Description: Test madvise with max pat index single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-single-vma
> + * Description: Tests madvise with uc-comp single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-multi-vma
> + * Description: Tests madvise with uc-comp multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-multi-vma
> + * Description: Tests madvise with uc multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-single-vma
> + * Description: Tests madvise with uc single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-multi-vma
> + * Description: Tests madvise with wb multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-single-vma
> + * Description: Tests madvise with wb single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-multi-vma
> + * Description: Tests madvise with wt multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-single-vma
> + * Description: Tests madvise with wt single operations
> + * Test category: functionality test
>    */
>   
>   static void
> @@ -861,6 +901,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   #define PREFETCH_SAME_ATTR		(0x1ull << 39)
>   #define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
>   #define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
> +#define MADVISE_PAT_INDEX		(0x1ull << 42)
>   
>   #define N_MULTI_FAULT		4
>   
> @@ -1127,11 +1168,10 @@ static void
>   xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		size_t bo_size, struct drm_xe_engine_class_instance *eci,
>   		uint64_t addr, unsigned long long flags,
> -		struct drm_xe_sync *sync)
> +		struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
>   {
>   	uint32_t bo_flags, bo = 0;
>   extra newline, remove it.
> -
>   	if (flags & MADVISE_ATOMIC_DEVICE)
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
> @@ -1203,32 +1243,74 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
>   				DRM_XE_ATOMIC_GLOBAL);
>   	}
> +
> +	if (flags & MADVISE_PAT_INDEX) {
> +		uint32_t num_ranges;
> +		struct drm_xe_mem_range_attr *mem_attrs;
> +
> +		if (bo_size)
> +			bo_size = ALIGN(bo_size, SZ_4K);
> +
> +		if (flags & MADVISE_MULTI_VMA) {
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size, bo_size/2, pat_value(fd));
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/4, pat_value(fd));
> +		} else
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
> +
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			igt_debug("Failed to get memory attributes\n");
> +			return;
> +		}
> +
> +		for (uint32_t i = 0; i < num_ranges; i++) {
> +			igt_debug("Processing mem_attr[%d]: start=0x%llx, end=0x%llx pat_index = %d\n",
> +					i, mem_attrs[i].start, mem_attrs[i].end, mem_attrs[i].pat_index.val);
indentation required.
> +			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
> +		}
> +
> +		free(mem_attrs);
> +	}
> +
Extra newline. remove it.
> +
>   }
>   
>   static void
>   madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		unsigned long long flags, struct test_exec_data *data)
>   {
> -	uint32_t val;
> +	struct drm_xe_mem_range_attr *mem_attrs;
> +	uint32_t num_ranges;
>   
>   	if (flags & PREFETCH_SPLIT_VMA) {
>   		bo_size = ALIGN(bo_size, SZ_4K);
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> -
> -		igt_debug("num_vmas before madvise = %d\n", val);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
> -		igt_debug("num_vmas after madvise= %d\n", val);
extra newline, remove it.
>   	} else if (flags & PREFETCH_SAME_ATTR) {
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1239,7 +1321,11 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1247,8 +1333,13 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   	}
> +	free(mem_attrs);
>   }
>   
>   static void
> @@ -1274,7 +1365,7 @@ static void
>   test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	  int n_exec_queues, int n_execs, size_t bo_size,
>   	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned long long flags)
> +	  unsigned long long flags, uint8_t (*pat_value)(int))
>   {
>   	uint64_t addr;
>   	struct drm_xe_sync sync[1] = {
> @@ -1406,7 +1497,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr = to_user_pointer(data);
>   
>   	if (flags & MADVISE_OP)
> -		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
>   
>   	if (flags & BO_UNMAP) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1527,7 +1618,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			next_data = aligned_alloc_type.ptr;
>   			igt_assert(next_data);
>   
> -			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
>   			__aligned_partial_free(&aligned_alloc_type);
>   
>   			b = 0;
> @@ -1893,7 +1984,7 @@ static void *thread(void *data)
>   
>   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
>   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> -		  t->flags | THREADS);
> +		  t->flags | THREADS, NULL);
>   
>   	return NULL;
>   }
> @@ -2011,7 +2102,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
>   
>   	fd = drm_open_driver(DRIVER_XE);
>   	test_exec(fd, hwe, n_exec_queues, n_execs,
> -		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
> +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
>   	drm_close_driver(fd);
>   
>   	close(map_fd);
> @@ -2106,6 +2197,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>   struct section {
>   	const char *name;
>   	unsigned long long flags;
> +	uint8_t (*fn)(int);
>   };
>   
>   igt_main
> @@ -2238,6 +2330,31 @@ igt_main
>   		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>   		{ NULL },
>   	};
> +
> +	const struct section intel_get_pat_idx_functions[] = {
> +		{"madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_wb },
> +		{"madvise-pat-idx-wb-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_MULTI_VMA,
> +                  intel_get_pat_idx_wb },
> +		{"madvise-pat-idx-wt-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +                  intel_get_pat_idx_wt },
> +		{"madvise-pat-idx-wt-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_MULTI_VMA,
> +                  intel_get_pat_idx_wt },
> +		{"madvise-pat-idx-uc-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +                  intel_get_pat_idx_uc },
> +		{"madvise-pat-idx-uc-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_MULTI_VMA,
> +                  intel_get_pat_idx_uc },
> +		{"madvise-pat-idx-uc-comp-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_uc_comp },
> +		{"madvise-pat-idx-uc-comp-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_MULTI_VMA,
> +		  intel_get_pat_idx_uc_comp },
> +		{"madvise-max-pat-index-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_max_pat_index },
> +		{"madvise-max-pat-index-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_MULTI_VMA,
> +		  intel_get_max_pat_index },
> +		{ NULL },
> +	};
> +
>   	int fd;
>   
>   	igt_fixture {
> @@ -2255,52 +2372,52 @@ igt_main
>   		igt_subtest_f("once-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("once-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-stride-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-64k-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("threads-many-%s", s->name)
>   			threads(fd, 1, 128, 0, 0, s->flags, false);
> @@ -2351,13 +2468,13 @@ igt_main
>   	igt_subtest_f("prefetch-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> -				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK, NULL);
>   
>   	igt_subtest_f("prefetch-sys-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
>   				  NULL, PREFETCH | PREFETCH_BENCHMARK |
> -				  PREFETCH_SYS_BENCHMARK);
> +				  PREFETCH_SYS_BENCHMARK, NULL);
>   
>   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> @@ -2377,7 +2494,7 @@ igt_main
>   	igt_subtest_f("fault")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> -				  FAULT);
> +				  FAULT, NULL);
>   
>   	for (const struct section *s = psections; s->name; s++) {
>   		igt_subtest_f("partial-%s", s->name)
> @@ -2438,10 +2555,16 @@ igt_main
>   		igt_subtest_f("madvise-%s", s->name) {
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   		}
>   	}
>   
> +	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
> +		igt_subtest_f("pat-index-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
> +	}
> +
>   	igt_subtest("compute")
>   		xe_for_each_engine(fd, hwe)
>   			test_compute(fd, hwe, SZ_2M);
Please check checkpatch.pl. It's showing 7 errors related to spacing and 
few warnings related to line limit.
