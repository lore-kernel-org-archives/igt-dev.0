Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AADE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 06:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252A10ECC6;
	Thu, 12 Dec 2024 06:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVlhxJTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C079110ECCC
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 06:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733983997; x=1765519997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eZN5mk3WBf+3NIyEpUw/tYNpffyHiNPZ/uV3w2I1NVI=;
 b=QVlhxJThUQ3v9IQlS9TOfDKwPu4H/OyM8uIiPfdy1NCjTLhZLRJLunTT
 KRP9Szht2fRQbNy/3U56b3CH+cGmI2sSEs61Oc3fphLGYV8gipjnz+ISU
 y4HfYJuC0NLnRyNOR6ex7n/pBPMkhIFexeGVQvwfjefIqqwk1a/xFAeCA
 Z8LE+kHjDrQllkdlkjjeLMOd20SGMnRIxP5wdv195/4rVzGRH9bwTHhAo
 cytNrEsNIE+VSqv5PU9psU31t0FrcszgQTCfwUzqC2wRYFGSw1HzK730o
 qN+O7WDFJvBRJ81Wawh9R1PrNk5J0j/9XiSm0AuI5PHlWwxIc9oaS7h+r w==;
X-CSE-ConnectionGUID: 53fBWLlQRDeVcgxx2zLJ1w==
X-CSE-MsgGUID: Bm1pqeO+TvCwXtmRqJeaWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45772182"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45772182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 22:13:17 -0800
X-CSE-ConnectionGUID: QdiiLS93SzGiYKSO8hhAjw==
X-CSE-MsgGUID: 6H5BJpdiSrOIx7STNxQhdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96551169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 22:13:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 22:13:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 11 Dec 2024 22:13:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 22:13:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5hB5DmeaLaEqT2twcHyzHzK4M0C5rM/WUlSM/G3wK7LxKk/A1mVrI48TCF9/slIjiy7/eJAKtfp9kBLBk8qOLq4u1UQrln5wnwkobf7CnJaSh9hEoqWaACeTv1xeUtxeJqwSMD0oY727fMFiNAkNkBkECTvbV7yoxAVaQoMPZHfcg3zF6MuACUVyAFztN80djzkTKkS9TyYFR8ptJKYcr8Ev5he8/nJNg1J0wHZFc+FAsg3YXel5LlZx4fM8WCjTRM9qNfUuW2KcDFBmRgBwnwCx1qroyBfe/eaxjvQejXjUdKOcAbNbC44IXCQp49XQTst/x/T5d4jOY6Y1quBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL9lajtB708JVQhPSqmGILWd6/ed0rE8tfHJAqlVjnk=;
 b=Gm5U+S3lnApOjqAZPdudMPJvm0E4JXK2b18LpVV0s030s5yOyzN0pVjex3GiJIO5xm9k/PIs7BsxSHtma0fAt/661hbsSK+UISSOEnwzBt3j48seHy65Y4icG+OYT8PhyBkleWj7mKK8d5uKPPTtAIwyYTIt3GxbllSTA59W8eZs6a9C4Rup/nCcItuJOXUQpUUCoPlvUOxkYalJFHVhT9FRGFKrgGSRFXI5BJYgx+Sta7+A/b0YFsVitIYjqjeOMzOINiGpKBJRR1zpvdx1Zz476gBDmUnFdZMyH4Qli6HhpjQmecaNnsGWLf32gbzrmuNl5Q+dFnqw1G3moxhmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 06:12:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 06:12:58 +0000
Message-ID: <2e36223d-3c05-4561-b381-94e95c211d54@intel.com>
Date: Thu, 12 Dec 2024 11:42:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/1] tests/intel/kms_joiner: switch modeset
 between ultra and big joiner
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20241203034218.53066-1-santhosh.reddy.guddati@intel.com>
 <20241203034218.53066-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241203034218.53066-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: c8194756-450e-4c10-e01e-08dd1a740648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STN5ci9YNnZwU2l0K2M1cW5KOWFWNVFzVllnRjQzQnpDSUFuK3V6ODU0eVdu?=
 =?utf-8?B?TlgzZHEvWDRXdFdMMlNjZko2OEkwekN2aWRQYlhDREYzaHFEV2EvWlRxdGI1?=
 =?utf-8?B?c3FWNktYMFFzVHMrVEJuOFJFUVd5OUt4VENvNk5ZQXJoRldQQS9vZDkzcjMr?=
 =?utf-8?B?YWF4VHBhN053c0ppT3FHbEh2TFFMVmVUUFl4d2hhK1AvdnFkbE82dkp0VVls?=
 =?utf-8?B?anVMNHNXeTRtVWJTTEV6WFc0cmx4aEk0Z1N3eXMwQnZNVlo3RTMwb1RJVHUx?=
 =?utf-8?B?MlhlRkQ5R0thYmVoZjJvNWVjNUMvN2lhdlFiWVY0R1JaZHNIcnZZZmNzU211?=
 =?utf-8?B?TmMwd3dvaGF1UDFrTkpjM1lMRllqOEJJMUl5NEt3dE8vaHVJditMVkxBRG54?=
 =?utf-8?B?SlczYkNiVWZHbEJFM01ERzQ2ZUNiMzBsU01mT3BQQVEzbjZyMXlvcTh3d1Nh?=
 =?utf-8?B?c25pM0J4eWIxVmpmRTJNUlQ1YlVBWUVidVJrNE8vUjhoUkRhODBjQWtVWGdL?=
 =?utf-8?B?Wi9ER0lZU0Z0ZjdvQUlFSjRsQ1pTd1krVGZ1ZS9tTllpWnAxWnBYTm9FZFFn?=
 =?utf-8?B?Uko5NTZLYXpGbHJjcDZFU3ZHL2k1MVRmOFVxMVBncWhuelg1dkxPdURBK01t?=
 =?utf-8?B?RUNXZ2RZeXVoZ3FEQWRmYm8zS3N4YjlHYWVYR0thTmFxdTVVSTBtY3dZUTZL?=
 =?utf-8?B?RUttSlo2bWVYK2pwV0wxcnlDS0dUZzlWcCtrWDFuckFDOG5sYVdWSWIrTHRF?=
 =?utf-8?B?cDdmOHFUNDhENmlhWHU0azZLOSt4dlFrYVZ3ZnlkclVmQjhEdndoTUcyTmRz?=
 =?utf-8?B?TnljV0pZcm13NUxSSko0cW44b3EvZTQyR1VoTDVsLzhLUXRMRzZyNXNNbXo4?=
 =?utf-8?B?aDNqRDNnUUJaNlZ4OG11cUJYYlRZOGpqUTFIUFJqTEdJTHFGdUQvbHZVQnYz?=
 =?utf-8?B?dUJ4dmE0QUpVVGI4OFlhTng0M1pSb3VMbmJQSVAwa0ROV0pYTDJjTGQ5ajh2?=
 =?utf-8?B?M1pzTmZXR2Z3K211WHhGa2hEcGNXUFc2a2pFQktzQzdvREFsU0N0MGVsMW56?=
 =?utf-8?B?S0pZL1o0UEs3TVJtanlrV2l3YkI1SE5sTS91UFJmV1hCZnFuUzZVNUtJOGh5?=
 =?utf-8?B?NENuSHFRRlpKemMxR2VQUkMxdUhyOGxkcHI5eFVqck92ck11T2Z0dDBQQnRx?=
 =?utf-8?B?T1YzSFBWdldUQ3hhOStvSzFEODhNL0M4a3Z4eVlBYUx4MCtVUGFXeFVBQktR?=
 =?utf-8?B?MUQvT2RNRWNXN3JmTE4wZjhaRFVHMlNsZnFickZ0S1NxMmZZKzBuWk9MV01W?=
 =?utf-8?B?QnN2M0Vvby9BTHJUSHNmVGprOE5aaGpuSG9HTUhoQzRPQ3dwbFIzUXBGZ0x3?=
 =?utf-8?B?NHp2L2MvV29nc1Z2SDRqbGkyeVBtMG03MGZzREQ3aUNNQnhLYmZ0eFNISnRh?=
 =?utf-8?B?WEhvYlRkeDlkOWJuQmwrcjhJc2p0T1lRZGo0bGdzMVREck8yOHA5eE0vRWxi?=
 =?utf-8?B?dXUrWWU5VFVWSXh1Q2lxZ2VlemJGTEZtL3FzdmV3WXBxbzNCZGsxWE5WSFBv?=
 =?utf-8?B?bVJzamJ4TzJjY0hvU0cvTzBPMGtqSCtoTE1ONzh0bTJlNmY0TDhoZFA1ZWox?=
 =?utf-8?B?aTNsQSs3YzYyTjBuYjZvNWNWWnNxQnpCdnVtOEF6RUkwdGlTbm1lb1QrSSt6?=
 =?utf-8?B?MnBXZ2hqK1dtTnZpVkZ3ekhHNE00V05JVFFQekMrV3MrajdqZDROdVlHaEVT?=
 =?utf-8?B?RUpuVG5FN2MwODVhOUxFTmxxelErTEtkYW1TS2YvRGh5S3VwRjdsZ3JPTzV1?=
 =?utf-8?B?eEgxemQ3THJ3ZzZtT01aQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRjWmVkbmc3WG5tQ3pGeGtwUXhzUU16N3JCM3RSY2tPS1pmbTBGUDNqbXBQ?=
 =?utf-8?B?ZWRaVnNWZ21PbmI3Wjl0QUxoakQycFEzS3ZJaURMLy8rcERvbkh1R0NQNWxh?=
 =?utf-8?B?SWNzUCt5MlByRW9CczdhNmpuTjVjeWovRnJLbVRBZVlndXoxMDF0SnJTMGlQ?=
 =?utf-8?B?dEdjeXFldFRMZWZXWVlOcG80dERFako2MCt5aVpqWEVIS1h5Q1NGenV1RG9D?=
 =?utf-8?B?T2l0cHBQU2xIR2cxeThFbndocytqUlRrWG1nSEFVL2pVcWtHb0lvcm1Bc2R2?=
 =?utf-8?B?YmtDUHJobnp2VytzNndBQW5VTVUrWjlSeHpqUFQ2UlIwU0NYWTdKZDdma0Fo?=
 =?utf-8?B?aFR5ZWtRUjFuT0ROZ1A1UTJzOUEzbVhleUxyZFBYZE1mTjRYSHluaFZpS25L?=
 =?utf-8?B?eUM4dHdnZTk2MUgvQzJTdzVwNUxpVUFWbXNobGdicUMxVzhpTjY3SlBBUWMw?=
 =?utf-8?B?V01qcS9rdUpMMmRkQXZMUy9qdDJaZWhRNTNhUUppcWQyb0EwcWp6VERqUVR6?=
 =?utf-8?B?ang5TklXcS91L0xGeHdHUjF4aE5QcVZtQmZFbm5XVVhVOEZFZk1kR0w4TWtZ?=
 =?utf-8?B?bThhUHhSTEdUVTU1ZTB5MDQwRVppbE83VnVqOXFaWUpORWR0Rk14ZEhybGts?=
 =?utf-8?B?aTdRT0hEbVd1QnJ5b3ZsSy9nQWNtcjY5b0QxUzkrRzJsTVhtQXlWK2xZZDdV?=
 =?utf-8?B?UHdwdDc3NUcvUldQS3Avbm1YRm9IZXdtUXJnNlFucFJJK2xmL1BlalBSZXk0?=
 =?utf-8?B?bjdLZ0M4L0NpRDV4b1ZlUGNsdGhSKzdtd0dja3dzTzIxS0FGSlVxTE0waUoy?=
 =?utf-8?B?MzFmeEpHVk9Qb01hcDNXM3NnS0dFMm11YTVEZGxZSXRLRSs1blI1ZFRQLzJP?=
 =?utf-8?B?OEZJOFltSFRwdkowUlVXRWJ4cVBHemlRb1lISWNtRE5ZQUpQU2JKUGdySW82?=
 =?utf-8?B?RkZHODlYc01QT0RySy82aldaTkJQQ0xOTWpvak1vUWUvZDQ3RzJmSjFEb1Zw?=
 =?utf-8?B?c1JRTDE0c0grRGpSZjEyMjA4UU1rYlhxR0NTMCtlaE5LRjJzcVdiUTNOM1NL?=
 =?utf-8?B?UnpYajZibzcraXN6djV2MVdlRlZjUU9mUjhMSVdVSGc1aFR2TDdZWWxIWXVN?=
 =?utf-8?B?Z1IvMGQ0d0Nlek5LeTIzYytaWmlZZ1dtOVNQQ0M2blJRZWl1bExhQ1J3ZmR0?=
 =?utf-8?B?ZXZMWm9WZ3dlSFVRcXZRNjdRdndiU3h3MXBlRmttbmI1MURyLzdZTlJRQ0RM?=
 =?utf-8?B?ZjBjUVpzSzNjSnZ6SjdTcUMyMXVaQjR3dnRuU3kxZWxjRDg1TUJDb2lZNkdK?=
 =?utf-8?B?L05YM0N1ak8vTlFRSFlTN2hLODVTQXl5dWM5YWIyL2crdkZNZEgxK2JlNTVV?=
 =?utf-8?B?K3c2Q2dUME5PR2p6QlNlMVdEV092dWJJWjhMYUZ3UTRPZG5kajFBd25IMHYw?=
 =?utf-8?B?WE5ERGVBd1JSSVdsNkkzM0s4WkRUbVRuQkxLMzZGd2dkam5ZTWdkN3JVTC85?=
 =?utf-8?B?MjNzOFBNcnlSY3pXSThIU0ZRaytMNlRhZ0VmczRIbE56dEt2RFhRQ0FoQ0JK?=
 =?utf-8?B?eFRHNUJZRkpSNjlBekdFQ21zN0traU1DWUtzRHUzMHJVdnMzazA0ZFRsemox?=
 =?utf-8?B?OS9BKzYxcG8vaG5oR0R5YmZ2LzRUL2t5b1pUWXZvV0FESVRxYjdvbHp4aXNz?=
 =?utf-8?B?VlNNVVAxOEFzNllhajM2Z2N4TC93YnVJdE56UmJ3TnJpMkJYeTZTUURYMDZF?=
 =?utf-8?B?c3F6Z3grNnMwMFRvcktNZ3VkNVAxaVNaUWZJUzg5NGo0M0llR05qT2h6bTda?=
 =?utf-8?B?OUdwL2tCaDU1UnNIMWpLaE5ib3VSWEtENWRzRWVjalh3Y0x3ZFdzMnBlWHMy?=
 =?utf-8?B?ZFRVVUc1dXZDbWVGREFXYzhIZjNRTTMySXMva2Q0dlo1VlY3UmlYZEpXcm1R?=
 =?utf-8?B?ZFlDU3BZT21lU0t4UjkrWWRjN1BseHU4cUs0MVVBVHFiNitBd1VOSy90eEp3?=
 =?utf-8?B?WEt6VCtiR2VzZzdRbGtheVluMzl6K3R3TVV1ODdqam1DeVRnN3hhTjM3a2F3?=
 =?utf-8?B?aENDWEdoeUNhekhhQ2tBUFQ2cTFFWEJsalFob1ZrT1pwVWRaOW5ESnYvNHBh?=
 =?utf-8?Q?Vpl82yObPyvmNKsvkS0dCQpTv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8194756-450e-4c10-e01e-08dd1a740648
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:12:58.4902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3egH/wjlIicb8SHi2ITDf1+LOk9mem96nDGFl0R+wL69h8Ia33/83g+79NkodJMOMFNUIDbeLiBYQ2XgFjViBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
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

Hi Santhosh,

On 12/3/2024 9:12 AM, Santhosh Reddy Guddati wrote:
> Add a subtest to validate switching from ultra joiner to big joiner
> and vice-versa.
>
> v2: Add new subtests for switching without force joiner (Karthik).
> v3: Start with uj to bj switch, if not available switch to force mode.
> v4: Check for uj, bj support before starting dynamic tests (karthik)
>      call reset_connectors after forcing to uj.
> v5: Add a separate function to switch modes and execute test for each
>      connected supported output (karthik).
> v6: Add force_joiner and dsc supported checks, remove redundant checks
>      while setting modes (karthik).
>      Remove display_reset during switch-modeset, intentionally force
>      big joiner and then switch to ultra joiner.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 115 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 9a353ee1b..97ffecf60 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -71,6 +71,9 @@
>    * SUBTEST: invalid-modeset-force-ultra-joiner
>    * Description: Verify if the modeset on the other pipes are rejected when
>    *              the pipe A is active with force ultra joiner modeset.
> + *
> + * SUBTEST: switch-modeset-ultra-joiner-big-joiner
> + * Description: Verify switching between ultra joiner and big joiner modeset.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -161,6 +164,103 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
> +{
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +
> +	igt_info("Committing joiner mode for output %s with mode %dx%d@%d\n",
> +		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
> +
> +	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_override_mode(output, mode);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_connectors();
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
> +{
> +	drmModeModeInfo bj_mode;
> +	drmModeModeInfo uj_mode;
> +	int status;
> +	bool ultrajoiner_found;
> +	enum pipe pipe;
> +	bool force_joiner_supported;
> +
> +	drmModeConnector *connector = output->config.connector;
> +
> +	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
> +	force_joiner_supported = igt_has_force_joiner_debugfs(data->drm_fd, output->name) &&
> +				 is_dsc_supported_by_sink(data->drm_fd, output);
> +
> +	if (ultrajoiner_found) {
> +		igt_output_override_mode(output, &uj_mode);
> +	} else if (force_joiner_supported) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
> +							JOINED_PIPES_ULTRA_JOINER);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +		uj_mode = *igt_output_get_mode(output);
> +	} else {
> +		igt_info("No ultra joiner mode found on output %s\n", output->name);
> +		return;
> +	}
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +		set_joiner_mode(data, output, &uj_mode);
> +		/* Switch to big joiner mode */
> +		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
> +					 max_dotclock, &bj_mode)) {
> +			igt_output_override_mode(output, &bj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_BIG_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +			bj_mode = *igt_output_get_mode(output);
> +		}
> +
> +		set_joiner_mode(data, output, &bj_mode);
> +
> +		/* Switch back to ultra joiner*/
> +		if (ultrajoiner_found) {
> +			igt_output_override_mode(output, &uj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_ULTRA_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +		}
> +
> +		set_joiner_mode(data, output, &uj_mode);
> +
> +		/* Intentionally force to big joiner and then switch */

Let us remove this below switch as this becomes redundant and add a 
check in 'bigjoiner_mode_found' to ensure that this function returns bj 
only mode and not uj mode.

Other than this, the patch LGTM.

Thanks,
Karthik.B.S
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
> +							JOINED_PIPES_BIG_JOINER);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +		bj_mode = *igt_output_get_mode(output);
> +		set_joiner_mode(data, output, &bj_mode);
> +
> +		/* Switch back to ultra joiner */
> +		if (ultrajoiner_found) {
> +			igt_output_override_mode(output, &uj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_ULTRA_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +		}
> +		set_joiner_mode(data, output, &uj_mode);
> +	}
> +}
> +
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
> @@ -592,6 +692,21 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.ultra_joiner_output_count > 0 ||
> +			      data.non_ultra_joiner_output_count > 0,
> +				  "No ultra joiner or force ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +
> +		for_each_connected_output(&data.display, output) {
> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
> +		}
> +	}
> +
>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>   		igt_require_f(ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
