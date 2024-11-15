Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85578D68BCD
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 19:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2A10E17F;
	Fri, 15 Nov 2024 19:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ6tBXqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9910E17F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731698480; x=1763234480;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wq9RPINCS+RHTThoVXUSFxI8LPMfQB1tSBQIjqPPjxk=;
 b=fQ6tBXqt2MSmzePiZnPrVwp9vV3CXE9QaK7L5iGGvU7MV9BuuPjeo1wi
 R86Z9JdUr9fdWtW281YQvZJu20UJ054X9RkBKD2ia3XQG0JIBqyzguxfn
 EwKAPuCKdsMdHOV8Igs+NFO8735eu8XBWmMkvpGQ5fi+g/nrAYdqWP+1k
 Gr4PTwzuEQ0+qm5PGBuMrYgPdFUjK7x1wb4G0wAW20v5vKwydWvHSnONJ
 Tm762E/aEuT4P0C3mLBbBnvTaoTTo892+SsSztm9L0ni/Km5VzaxTErJE
 erng0XCM+JB+t9s30q98cD9uGEJWX4/sWHGJpmu6wBLmskYQGoIzT2mpd Q==;
X-CSE-ConnectionGUID: PrW7aUbwS86uKw3bkFtu1A==
X-CSE-MsgGUID: oTDTbh94QMSAnoZSS4PjoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49247048"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="49247048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:21:20 -0800
X-CSE-ConnectionGUID: Mb4B0KHjR1ydFQccV/z8Dw==
X-CSE-MsgGUID: Eq70HCAtQZO8bNDPehdvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="92726826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:21:20 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:21:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:21:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:21:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCfbVCFvXnXFugcGqoxYKy+rTB6EW4+WM1WvghmndPcsEmrJEncbMiUZZ4hAuhdOKmiCc1TlgsQTcjApntobLePQeOibULPOliZG209SfUm2j5w+VHdJLJ4EMXy4sxAOA6AgNEENvfxDIuw9zxgIo/qMTbQIHdw7NHFL+lZpqVwxxJ9+19QFBy9xaNE69/JhLz15RBwYWE3oT3j9APUZNFRDdfpLsPjuPgAUHLeA7ZySFuynV/p5AR1L8u6t6Uqfe/60HyT7AYOuE+5FrCZS4PRdazDFDnvoQQnkHI0DSi6ZEtq+qoqZUvTnurkPuO5OjijmBLHEmNj0Yi1Cndtj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCJevSQs/skv/HpY/PIl3j7S1xy0AIC05RfwQ8m15nc=;
 b=GIVtZbguazaPs6Lmu1Z415p4dWEXvXj7nUkT3POdI7Fm00iQMDJ9IaNST/ITkdRs9KEbMaBkuGsKC9Y4kG8SWyWmV1diE3y63QvE08sQZ3HMEMUWHDem/XS05GLYJo4q1lPxVrqoShzF0KpMXvBEidWHRPJAhtoFdbTmvnGjlcOb29dHUtPcrjtXQqsQFi4IcCGbiObLo5ebAqGvJL4g7Pfn0klj7aHo5X2tkKJF8K84Ff+TqlHIwNgmnuYbVuKQb7n6ALXjcogfRnAxhxn5xoQexRs3jBQwI5dXFjxKI2bMCm4MjlZmeqIG7KLljILcx9KQZmzr801L/CJBtVdlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 19:21:16 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 19:21:16 +0000
Message-ID: <a80e0a1c-a36b-4fe3-862f-c2ba54418c5c@intel.com>
Date: Fri, 15 Nov 2024 14:21:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: <igt-dev@lists.freedesktop.org>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <20241022163324.383145-2-zhanjun.dong@intel.com>
 <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
 <533ff0ae-6eb3-402f-b6df-aeae10da75d4@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <533ff0ae-6eb3-402f-b6df-aeae10da75d4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 5876f0ce-84d3-4550-4ba1-08dd05aaad13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmRGOFBjS3ltS01kODRiUXhERnZPOTRTa3Q3Q1pFUmRQbGpGZ2hvbnhrMm5Y?=
 =?utf-8?B?R3BmTEhSdDZUMjc3TUtHNWRtNlJVejZxV1R6aU9zMlIveFdVMW91eXU2aWRt?=
 =?utf-8?B?Q3lubVNsUEFldEtXOFd1OXEvNFd3Y0QwS09HSnJjdDVxTDUwaWY3RFZBcmp1?=
 =?utf-8?B?SjY0bG42UmlsdThzdGpmcnJxb0JyM1NmUjNCdksrb3VkY3JNRG5tVkhLZjNX?=
 =?utf-8?B?ZlFOL1JJT3hqSUJuUDlwSWJyemIwekdjaExRb0Y5dDhWMmxkQVc1QmNFRURW?=
 =?utf-8?B?a1pEZHc4SUJrek1TanJ2OTlzcVJ4dVhDbFNxM3YvL1VmbjZUZE53UmNSa3gw?=
 =?utf-8?B?RlljMzNBUmZZOWZMbml0Ry9wRlJ4eW9lVzZEWXVnMkVhL1hyd3BvbjE2TmVQ?=
 =?utf-8?B?LzM1LzVLTytaMngxcEt5enpORUVWMXBVVDZKOEk5ZjM5WEx2L3NzQmVlTWN1?=
 =?utf-8?B?WU44MVZ2dWxVQkdqT09LK1E3WkNuejhHS0V2WkpuZXJ1TEdmaVlTWG02SG9k?=
 =?utf-8?B?TkFNQUxEdGFqYnpJT1ZGdFhLL2d5QW5jZ0pNVS8wQnNOVytJeVNITUl0cFFy?=
 =?utf-8?B?TUluNStqMzI4anVEeWxWTjhJRFAyRzRvQnhscDZ3SkFsRWpDR3crcXR6amJK?=
 =?utf-8?B?b2FUS1ZMNUpFN2l0QmI1WXhJSjZKcUNad1JFRFNtazUvazZUS2d6VkJBb1NN?=
 =?utf-8?B?c2hzeDJKZ3FGUkdxb1QxNDdyNTFnejkvZno5VndPQnI2VWhadHA5ejlOYzhq?=
 =?utf-8?B?bWZoRUdOZ3ArZThHNEVlc1FRdUhCQWF3WFNNRUR3L2ZOL0k5ODdnTHRTTkRo?=
 =?utf-8?B?T2Y1eXIxaEYveHFKaXUrdjl1ZXROWkVacDM2K0pZZTZGRURuMzVyR2hlT1dX?=
 =?utf-8?B?Qi9vc0M4ekwydFVXVk04TVRwZXVzNGt0aFBnODQ1MjVabG12R2tFVlprUFpl?=
 =?utf-8?B?akJzNnJFcUdBbXc4R2hxRFBTcW91UUZjRkplSnVKbG1VNjlxRG8xYXAxRkFY?=
 =?utf-8?B?OTV4T1EvUG1ObnpCRHBDaHVUaGNZWEhrK1NTUnp3UURnL3VTVHBQaTJFQ0JT?=
 =?utf-8?B?ejdKSmRodkJvcE13MkIxVWN5Vy9pM3hyN3JSRXlRV0JSc0EwOGdlNlFtVVNB?=
 =?utf-8?B?N3B3ei9MRm9lTzhLM2hjd2JZZDRkM1hVN1pPRndtaU1QSktucmJkVkVTUE9o?=
 =?utf-8?B?ZjVhd2NRZUx0bnJyTTZMQmx0N2xaVzBWdytpNXJrMklSQmU1dlhENjU5aGRN?=
 =?utf-8?B?alo1OFIrdmJLelNFYmNTSHR0YnNYRlh4KzBQWXhkSUorTVQrY3V5MWg4M2ZG?=
 =?utf-8?B?TTNDU29tT3hZMmpqTHhOTDVnTUl0SU5EaEFlcWV5NXpwU1loeW1nZE9CTkJO?=
 =?utf-8?B?VEpKK01aWmgwNjkzOEpBZHBxYkp2bllwNnNVTzJWcnZpRStYTkVuZGVlWGFU?=
 =?utf-8?B?b25RMmxuOWt5QzhiY1hOOHRlaFgvbDZnaU1CNVoybnBhMjMwRFRoUE44UHlM?=
 =?utf-8?B?R1c2Vy9zcVBpZFVBVlRoWVJoY1RxZ1JWanZ0dFVna1Brc3pabnhkaS9PY0hT?=
 =?utf-8?B?dGp2SzZ4dVc4ZlA3bVdOZDZaN0lVdlZpZW9sNE02cE5nQ1ZVYnhNKzk5YU5H?=
 =?utf-8?B?VGp0SEYvZDlZZzRKOWx5c2pkMUM4cTVKOVM0aUhYeVQ2aDFHYkQ5Q09hdVM3?=
 =?utf-8?B?SGZQNnpHY1dJazRib0pWZDJNNndyeXlLc0VkalJyWlBmNnJmd0hxRjZlS3Ir?=
 =?utf-8?Q?KY/qMgvlqCU46pronEE0qQ/9R2NAkbnXrQpfNhg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBTUHRqYy9lQ1VBM2VCTEpma2FRemRCOFZXYVNDbG1rL0xEMEg1YXR4Sis3?=
 =?utf-8?B?WC9BZUhaTTNRUFp6ZEVJdGdhd25oWWJWeXl5dVF0ZS90S0ppazBOZE9qNWJs?=
 =?utf-8?B?WlM3WXZSd29ZdjY1aGRUbHI1V3o4aWRFZjlVY2VLbWlFQ3hTbUlEY1pFTTgx?=
 =?utf-8?B?dGdnaWtJZ1k5NGMrY25WbEtmTXJUUDR6VnN1dTVpazQvbnpWb0JaczNGZ2dU?=
 =?utf-8?B?T1VyK3U5N08zQjIvd2pLQTFZOWoyU2JXYlh1eDRhVVFxYWFkV1NhSXJGQWJM?=
 =?utf-8?B?c0o5RER4MUdJVmVJTVBzQWw2WkxEZEloVmtYSUFVK0ZmWjFvY2tvL3hSeTZI?=
 =?utf-8?B?M0hhVFBUVkxwWDFXc3JvbTN0SG1lMXIxMFpqNXF1WVNVamhuWXJJcjdONlhE?=
 =?utf-8?B?RHpsWGNscmtZcjQ1R0NWZVM2b3puT2cvaUtTZXJtc1U5VDc3SUI3SG1LM1NU?=
 =?utf-8?B?ODB1VVRheHpOZk1RWVFHLzhidnNxMllPQ2c1T1dSTFBDU0NSdzBVOWhEVURl?=
 =?utf-8?B?a1dRdjEwZ3FMREJYbWFUZHZRcTQyN0l6eXNtTjRHeDhPZzIxMm5neWI3ajBw?=
 =?utf-8?B?VVhldDRub0k4Um9pMVo0b3MzaHEzNzNsS00vUEFpZmlhbXA3UHFjZGd4Zm1Q?=
 =?utf-8?B?Ri96MkVvNnpGZXNvLzdjUDN0eHpHRllLWElZOEI5azJodjl1RDMrY2ErUExM?=
 =?utf-8?B?YUxVMm45NGtmWkF3aEhRa1BVWURHNTBuME5LOHNWWUVnNk5jZjI4byt0c0VH?=
 =?utf-8?B?aW1ybVZlSUdpN3pIT0NiWUdqQXMwWlRQOXh5VnFTTnBDL1QrU2ZXSDVsNncv?=
 =?utf-8?B?RXY3NURnQUF2RzgrREhFRGd5SkVhWXhZMUI1RGdyRWNDR1I5TFl5NjdiL2Nl?=
 =?utf-8?B?M0EvTDZtTU9xdmwxMFd3Q0tXUmVPNVJKUlZKeFBvcE4vYm5hL2ZwR0FGZVJS?=
 =?utf-8?B?bTAzdFI4T0kxdVJpOEZCVFhrTW1uUVdIUms4Z1l6cHVCMCszOXdLN3JTOTBy?=
 =?utf-8?B?YnJSTkhtY21yUWJPSE85aVdJQU90aXFSZGxnSkhoam9WZGVKK3ZKeTBGZ3JW?=
 =?utf-8?B?c3k2cXpEQjhqamdjZUc3KzhHV29HOW5FM3ZnNVY4dzZjM2pjVU5WTkI1eExG?=
 =?utf-8?B?dExuM0tMZU1JK3JpbkhwN2VDU1RMMmpNUTJjUmVaM0ZkYkhmZVJzQmg3RUxO?=
 =?utf-8?B?RjhraHRpV2Jka2dwelNZMHBLTFI2NjBDR1Z1RXg0OUR0R002M3p1cjhDMnFO?=
 =?utf-8?B?Y2ZUVDNpcHpnVlhwVStlSXowV1NzU1RIZ1ZLQ1pENjJRTmsrblVTU2tlMTdT?=
 =?utf-8?B?cEkxTjJ4Z05ybTBpREZkZFFFcVBaRDJmcmNjM2o1dHdnQTVpWlJaNERvUHFI?=
 =?utf-8?B?SExzNXU4V2xKR1JMdEY5OUhtK0JrOWJoVFRlT2RkK3QybC90RlpBVWM2c2hB?=
 =?utf-8?B?ZFJtbXpsMWZ2ajZ4b3BVdEFlTjlJbVpOR1VpendPcGJCeWVQdm5uV29PV25r?=
 =?utf-8?B?MVV5cVpEbnJoYVpqK3FjQUs5aXJSN2hKTTFqUU85NXJQS2o3RGxtL2JMTEYy?=
 =?utf-8?B?eUN6MDN1OW40Mzl5THdSQTdhbTB1RjNwckgxbThyZlNVdmVEdjA2cHUwdnFw?=
 =?utf-8?B?YXlkSXcvdWZpdmowWDNRTjFkN2tIUktTdzVqWGpMRjl0RlhwVlhrZnZ4eDdF?=
 =?utf-8?B?bjhrM2xwMWFPdWVzTjRnaVNXVUp1SnRueFdOWkNrWmlOWm1XUXNCMWQzNmRB?=
 =?utf-8?B?Zm5sYy94TmFFNXhYUTZjZkY3b3BKdk4rUEhydyszSVBING85ay9UNEdaTUFR?=
 =?utf-8?B?Qk5CcmFCU0pQM3FXZnJOdlRwTkg2Wi82UXNINVFSeWhFTEptdEpZV2UrSUZt?=
 =?utf-8?B?NTBReVVLZWNFb1d2V1JDdmsrcjd4d1ZmbFpwTHRuZEN0MUhCS3BBUndTMTJk?=
 =?utf-8?B?c25kTmVKQkdCMHBuUnpzZE0wYlREMzZKNUU4U1JyTFRhZHJXNUNVbDlKcEgr?=
 =?utf-8?B?QmZ1WjZYeGJTOHkwZk16bkxnaUpmbHVHaEJLVHhtSkc2R2hCbWw1QVhza1Fl?=
 =?utf-8?B?djhvaFVSR2hiY3FGMXV3U3BVTTJlYVRHY3RwaUNVTWFwSUZlTytoNDE1cHFK?=
 =?utf-8?Q?7taUY7RSQe8mqoCO/bChjbhoh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5876f0ce-84d3-4550-4ba1-08dd05aaad13
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:21:16.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8oqw/t9u0XQG2z24dnjw5uIwZ41CUT2tm6JIll4ebjnpb+qHcnPoiSp1LPREhRQKwVybqAFINTO2H7nHcvWuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
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



On 2024-11-14 5:23 p.m., Dong, Zhanjun wrote:
> Please see my comments inline below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-11-13 2:48 a.m., Teres Alexis, Alan Previn wrote:
>> On Tue, 2024-10-22 at 09:33 -0700, Zhanjun Dong wrote:
>>> Test with GuC reset, check if devcoredump register dump is within the
>> alan: nit: more clarification? -> "Submit cmds to the GPU that result 
>> in a GuC engine reset and check that devcoredump
>> register dump is generated, by the GuC, and includes the full register 
>> range"?
> sure
>>> range.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
>>>   tests/meson.build             |   1 +
>>>   2 files changed, 366 insertions(+)
>>>   create mode 100644 tests/intel/xe_exec_capture.c
>>>
>>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/ 
>>> xe_exec_capture.c
>>> new file mode 100644
>>> index 000000000..3a8fa68f2
...

>>> +#define BASE_ADDRESS                   0x1a0000
>>> +/* Batch buffer element count, in number of dwords(uint32_t) */
>>> +#define BATCH_DW_COUNT                 16
>>> +
>>> +#define MAX_PATH_NAME_LEN              512
>>> +#define MAX_LINES                      4096
>>> +/* Keep line content up to this length */
>>> +#define MAX_LINE_LEN                   1024
>>> +#define MAIN_BUF_SIZE                  (MAX_LINES * MAX_LINE_LEN * 
>>> sizeof(char))
>>> +/* Buffer size to read a line */
>>> +#define LINE_BUF_SIZE                  (64 * 1024)
>>> +
>> alan: the above set of definitions are being used for the sole purpose of
>> trying to get all of the devcoredump file into a buffer that you can 
>> then go through
>> an find some specific keywords using strstr in get_coredump_item. 
>> However, instead
>> of using all these definitions and creating alloc_lines_buffer, 
>> load_all and get_coredump_item,
>> why not reuse igt_sysfs_get function? is there a reason we are not 
>> using that?
> Yes, that idea comes from previous version review comments.
> By load all into line buffers, then lines buffer index is the 
> line_number, make debug easier.
>>
>> Alternatively, i am wondering if we can consider the top part of the 
>> devcoredump layout
>> is persistent and so maybe we dont even need to load so much of the 
>> devcoredump?
>> i.e. if we dont get any variable length printouts or buffer object dumps
>> before the guc error capture then we could simply read the minimal 
>> buffer size needed
>> to get the initial keywords of the guc error capture dump.
> That looks like what I do in V3: only data content between
> "**** Job ****"
> and
> "**** VM state ****"
> will be load into buffer and parsed
This rev loads all data into buffer, up to MAX_LINES of 4096, with full 
16MB GuC log buffer+debug settings, the devcoredump could be very large 
and 4096 lines can not hold all. On the other hand, the fixed max lines 
is not scalable at all.
Back to the purpose of this igt test, it focus on engine register 
capture, we don't care all other parts in the dump.
So in the next rev, I will only load contents of 2 sections:
**** Job ****
and
**** HW Engines ****
which is up to tag of
**** VM state ****

If we want to have line number, it could be line_number_of_start_tag + 
index to get real line number, if we need it.

Regards,
Zhanjun Dong

> 
>>
>>
>>> +#define DUMP_PATH                      "/sys/class/drm/card%d/ 
>>> device/devcoredump/data"
>>> +#define START_TAG                      "**** Job ****"
>>> +#define REGEX_KEY_VALUE_PAIR           "^[ \t]*([^:]+):[ \t]*([^ 
>>> \t]+)[ \t]*$"
>>> +#define REGEX_KEY_INDEX                        1
>>> +#define REGEX_VALUE_INDEX              2
>>> +#define REGEX_KEY_VALUE_GROUP_COUNT    3
>>> +
...

