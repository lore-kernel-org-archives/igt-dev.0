Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCECA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 06:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A52D10E2BF;
	Wed, 10 Sep 2025 06:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3q/wEFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443B410E2BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 06:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757487006; x=1789023006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K8I9slEhQHGqBJKXxI9u2OjJIAQCb9bDw0lpzdqQ+v4=;
 b=E3q/wEFdQQiBmindakcoqz0rhjPsfOpQ06CsQSIE9+bQmjNnN1Oe2CIS
 8Z5NunV+Jcn83oSnUaA2B04ql7R7G6lbEObum9wMotHNSTcIzTt3PC8Bp
 eT/oeRBVQ98eOq2h6dlWfh8T8exH4BeHFNn1iZxufxWANKoGkHAWOGPY5
 UGQADeGbLMal6ZbAT+KI/y2+n2RsDD4X+ppK0KOG3Y4bc5sac6RbvRCdU
 pBIMJHZr0mb6WQbH4g20pogvATQ8OcRswzsX2rMijf8Db8/whJ8AtvpGY
 0QtU9VZDbasDTpSpOR3FpFxdM9erZhiQE04+96opRoBXFNP9yshQeCYiy A==;
X-CSE-ConnectionGUID: mF5SxvkiRf6Gb8NkxnrD3Q==
X-CSE-MsgGUID: 01oiqx0sQCSo5NV3MRS+qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59862814"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59862814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 23:50:06 -0700
X-CSE-ConnectionGUID: XYzAP9y3R6GFmz6Gvo0/ww==
X-CSE-MsgGUID: tVKWVSgHSTqWj+ifDFahJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173690033"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 23:50:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 23:49:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 23:49:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 23:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tah553me/A1/O46/RG67KUb+6Hxhz61Fxzv30MV5XXh9jChUZvx3TLTfFBjjTxLcrkiloKUVLJYs/5eueV7VHRlDEfPDu276fhyWRdL4anufF00bqCv4Jbhga8UcPN6JELmiv2MEh1mOJMWFbrKiPIIBBnAnJnBxnZ8oTc1GUg3wjzRco3vqj52kj02u377VTscmgn2RqUxrkj04ke0RC7OwhlbYTpa4wGiuCcIgDE4O/otPdbHvK2NWDu2y/hhzqL0iG+HkFF5p6iqjWQH9dnU08cjuJGnwCCyFXrJubEszkoNskD7xBY6v0okmFzHSvlVMb8wXXKEE4vY20zP0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvRw9G1OSeYUJMrPui8pnUUzTxCEafpSkmVjNb9mZKI=;
 b=xXV0QptSCWqkKodmAckB2nN4OayyURu1KDtHrXXG2Myxb1lE4f6G6TcXTO/3k4cE+WxYg8bXW05K5gZPb2u3GF8HgKC21RSjwIm7wid43iejktFbaxfqr/f3om2PWs0848qug4HnvvmEF4YrOFJeFiko76poAHZ9nKUzrmnmTXfnIZNTCqPUJMsPWy85cESJuKsy1+lxqv9vWHOWhmJX2eQGnfaEw1mLMcMyad14Efhr6AjMotrFqZ2t3OzIi44ObOMpMAxGOoozvLvLhbK20nJPTlmjSrbuhGfvjHEo8XlixdJiyBVJrgJLWOymxFBYH12IBijiWJ5uA7SOGEs50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 06:49:55 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 06:49:55 +0000
Message-ID: <b422d986-d3b4-48c8-94dc-c06a180982cf@intel.com>
Date: Wed, 10 Sep 2025 12:19:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Optimise subtests for
 simulation platforms
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <swati2.sharma@intel.com>
References: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
 <20250904045731.152767-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250904045731.152767-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: bf81ecc9-5a27-4ec9-7bf4-08ddf0363fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjdtdmt6NjJBMW5abXJEUWQvQ1lZcEpISis5V1ByVWU5OGdPOGdoam9kVmVu?=
 =?utf-8?B?M2tJNUVTN0IxWXlZU1BvTkRNN09FOTBWVU45R1V4NFpsRjhRaVlDVUYwa0NG?=
 =?utf-8?B?MHpCRkt5Z0VHcTV6ZVBUZkVkbElMa2JDZU83dithekdIRm5uUndjanYrcERv?=
 =?utf-8?B?d3VDNndqMk4yeVZHSU5hNGZQRWJnZ3pscU1wWXFKdnloanE2bGx4MEpNZGkr?=
 =?utf-8?B?WjZwU2lobG80R2FSVytpUG0rUFhMWkpxTjJYdklDamczc2dqRFpoL0lrS25R?=
 =?utf-8?B?ZUdlNWlyQXg5SU5ZOEFrcW5pQ1JVKzJrMkF3MHloZWt1SlMvNURESk9FTUVM?=
 =?utf-8?B?SFhhVlRzb2pjalJLM2I5bzNORkRQS1l6TTFHMXRaSUJvK2pMd0JjRjh0Q09Q?=
 =?utf-8?B?MVl6MU9wRGxrQktINlIrK3RHemNnazVsbGhjL3FXYUtzUFJVdXNFMGFaTzRy?=
 =?utf-8?B?ZEpLM0RhNGNyUTdrUTJiZFVsMG1IaVJwVmI3RXZ3RkxubFhsTGtabGRBeDRT?=
 =?utf-8?B?MTJaTnJhSGM1TVV3SXJoSER1TE5xdzlxS0pjSmVibmdOZTZqSWRHdkVwYjZK?=
 =?utf-8?B?eGJtUGJzTkIxbk1uT1NZdC9jT0xsUmU4UTRyUzNFQm1KZ3o2RlFlREVTa1hD?=
 =?utf-8?B?cFh1bnBlT0JkMEg5TzZnQTErVVdEZUw3WUZBeUNWdlpSMEtMK1BXc1dkenEy?=
 =?utf-8?B?N0wwNzk2UnFnVEtxOEMyOW9UeVNZZ2YweWNhaGR6cThmNGphcVo1V2dqSTNa?=
 =?utf-8?B?Q2d2U214KzJ6N1drenAvdlpEWWJPeGExa2V3R3UrREY4MXpJUGNKWXBHV2x3?=
 =?utf-8?B?UjNEdFRPSTV0TWtlVExURGd3elZ0WERhY1A2VG5rYUNqa05DL2pSV2xLbStj?=
 =?utf-8?B?QVk1N3hNWklmWnlqRUZta3daK1RIQmhlbEpVdzFwNncvOHY0Q0RBZTlTaEVQ?=
 =?utf-8?B?aGFFblU1Tmo3ckhjL1FjUU9YbzJIeGNBdHlHOSt4NEt5QVNaRnIvOWN4U21z?=
 =?utf-8?B?WG9Zekx1dzBUMjM5TlJnMjJma0t6UWVBL29hNGVWQkMwcVhLbDJJV0d1a2dH?=
 =?utf-8?B?Y1VyQTVHQzlQWXZUNnUyMVNBRGhsR0ZpRjZTRm9xWk1zdnhNTXNvbjhkVTZD?=
 =?utf-8?B?c0xHNG85Ui9yUVQzVVpwZ3U5bll6RVRlMnR6ZnJNd29tMW43eUZXWk5MaFBD?=
 =?utf-8?B?QlJKRTRVZUx3bFFwUHl4S0NGK2tsN1Rvcm93Tjh0UFVkNDV1N0JyTitBU1BO?=
 =?utf-8?B?Q0Uvek1ZNnJ5RlIxL0U0NnlBZ2lpbHBKd3VHMjFYNkN1elBpVDkzaEZJdERT?=
 =?utf-8?B?ZUpBN3ZvdE43MzJ6WWFWS2VwMWNBZ1ZIUGtTbVVKVmZkOXJuUUtqSVhMZlZS?=
 =?utf-8?B?WEZBZVpYa1VsbkpXYlN2WmVqZW95SFgwMitJd0V1WnBTdHlxclc3b3NuaGwr?=
 =?utf-8?B?ZDRMaUh0ckhGZldpd0Z4WFFPNVlCTjBRSVdUc0RwMEJ4dEhoamwwbjFsWVJt?=
 =?utf-8?B?V0FWcjkxenBMYXV5bDFTU0xlclZCQTJ4VmRVV3FtL3d0Uk1rOG5mTmFocGVB?=
 =?utf-8?B?ZEpoaGRGMHNuYkFVdUNqV2laSDFoZFFLTlp2N2VYT2dVUWFHMHJYZDBiTjQ0?=
 =?utf-8?B?eVhjVUpYTllGM1JlN2Z4ajl2bFJ1ek1iSWJZRWd3R2FZNU5nQWt5Yy9wb21X?=
 =?utf-8?B?VWpnTWZpRDArZitMNFZDZUdXbmtFMUg3RjE3VW5EREF1WkpQUXF3bG9Pc3kw?=
 =?utf-8?B?QzBZQnU1VFdnS0xTZ1lORVNVeDJKVUhFZk5KUUpPUEorQUZ6WUhleCs1MnVs?=
 =?utf-8?B?VWxENWtTK3BrTktYK3Q2UUd3bjlBSFROT1pZbmxnWlNKZEZudTRJRmY5Sk9X?=
 =?utf-8?B?UzlLS0xMb1F4ZHhWcEZIN3dEVnVUMVpNeS9FRUlMdURjcFdCS1FVSWZiMitT?=
 =?utf-8?Q?yFR+0xxZc/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2pNOWZGNHEwNFlsNVVRNmpRMEVhZ1NpK1hpckJEeWVjWU5wME1qZHJCaEd0?=
 =?utf-8?B?dGV6bVM2OHhNOW53cFRGTGNYbXRMb3Q4dEQxNFN4TjFFaVFwVTBmNThDRFlS?=
 =?utf-8?B?ZlJMNGhUTE5yWjhDZmtzQUVpRWRKY2lGUDUyTXk1K3BlMGxLMG9tamwvMjZp?=
 =?utf-8?B?dnFMckNUNm1lc054VHRhQnpraHU4ZmtML0FHeVpXN3dQaFZOS1BuQVozY2to?=
 =?utf-8?B?d2VRTmMrajFLWTFiQ1IwWG9lR0ZnQTNlYW5hNjdUc2ZJME1mcFVray9TK1NW?=
 =?utf-8?B?a0NkVGZjM1lFekk1ZVdpVjg4UWdSeWJ6T3FrOVhtbFZHZUxETlQvZTRPOXRa?=
 =?utf-8?B?SFlGZEwwc0NZVkZHMnV1K2ZrTjl1cHF4L2JTeWxxUS9kWmhaaFh5OHNVUmZG?=
 =?utf-8?B?Y2EzT0g3UHdMZkV3Qi8reGNZWWNaM3dFdUo5OE9TOFVMUDYrZmRjcXRvNUdt?=
 =?utf-8?B?RFJ4djlkSUdtYUw1YnFKZlQvYzgrUUhBYzhlajlEbjg0TWEzSnRmazd5MVFW?=
 =?utf-8?B?V0ovckJheXlWeGx5eHk4WkJwM2o2Nmo2V0E2aEJNM3IrYjRmUURYN1VVdE1M?=
 =?utf-8?B?bVlmZUNBVzFmeHY2VVpmUlEwS3VCYmxVQVlFT3duTlFOa3Z0a1ltbkpSU2I2?=
 =?utf-8?B?YzZCMzU5Y2pUWnYwNDhzcENiZk9DOE10K2FUL0lOU2pRWkVTNkovaDZmeXRT?=
 =?utf-8?B?Zm51TnZQV3Q3TTREZUkra2c0cm1jS2NqbWhYaHdndzE5WmV2ZFIvNXZyS1Ey?=
 =?utf-8?B?aVJSR1Rkb04wa2x2aWxZZjZQbGViQWF6NGpHYVZYRnNTa2dsRUpBRzlkZ1Fj?=
 =?utf-8?B?WUYrbUhIeUdaWWRZZGlSVHRZR0VoYkt0SkYxVlFJTFF2cTI1TWhQRE93UFVq?=
 =?utf-8?B?akN3a0dlMXFkZmxNSFdRY2hBekoxOHJZL0lEc1pHUk9qTFJrVnBhQWdaS3lH?=
 =?utf-8?B?eTk5R0lsVEMwa1pJUjhzQnQzcHBmaEhQWTBtNDBaSnJ1UXBURzN3a0dJaW1J?=
 =?utf-8?B?c3N5VTEyQlFIaWxsL0ZFbE5TWEVHaXJna2Z2czVZWFlvT1dCOFMxREVCNkhO?=
 =?utf-8?B?cWkwYU5YL0tHMXJUTEhBYUxPMmV4eXcyVFBKa2daZ0F0d0xka1J2UHpUaStS?=
 =?utf-8?B?R3R3QUxLc0RXT2MvRTlIMmxQUmVjTE54eElmTlZkQkMzSG1ra2dCUkFmQ3NJ?=
 =?utf-8?B?NHBqTkxUeWlVMlNSNDBDNGtXKzFPM1JDN2tQSitObUprS2pYYjRqLytPYmVV?=
 =?utf-8?B?SFRhTW1JdTQvZUlCeGtsTjdOM0J5OUY4YzQvYXkvL3YyUmMrRldUa25ORFgr?=
 =?utf-8?B?ZDJpMzJlNncyczNMbVJEVWZkNFV6djV4dm5GaWdGMlV5dE1YSmU1TWtXQ0Jy?=
 =?utf-8?B?aWE0TFNieTNmaXU1ZjJwdXBzMXUxblJvSkZ1MTdPSjBnNzRPOFhsc1hFbVdH?=
 =?utf-8?B?QTJRQzRzQ3MyZ1BucCtSYTBTcysrNS9IbS9DSVdNeHBQeFlBSXlicjkxT2VX?=
 =?utf-8?B?RTZ3T2F5VVVDMk9sUm9lTm9NUTNFemdKZHYwdjkwSGxmcTBVTU5pZmRMN3Vt?=
 =?utf-8?B?ajYwc01nZmhMb0g1NVZXME8rNXpjUEZrb2pWb3VldFJPMGxWME92emorRTFQ?=
 =?utf-8?B?MTVIV0NaSEN2Wm9nV1FacVpsQUZuQlJNRFhGdEF2bU9xWHlCMHNPS2RSSUd0?=
 =?utf-8?B?dkNSZHZKNElaZDFUVkswR042cktKZjNtMGQzSDNpV2N0djI2UlhuZ0sxYzNn?=
 =?utf-8?B?V3pLZkZMTEdVRy9tVk1pQ0dXa1V1cGhwaTlnZWU1RkdFOHRDOWxvSjgxcWhU?=
 =?utf-8?B?NlQ2WkJIZStKeUhnWEJxZHJGU001ejNUZmlNZElHNUtLSFdVaXRzai85UzJq?=
 =?utf-8?B?WjVJNFFXQ0d5WDZvTWloamc1aTgxODJlL0NZZXBuM29TaVBSRVF1RzdWQk5l?=
 =?utf-8?B?WVZVUmtCOTRJLzdTVmtEZzRzbEZvRWtBYmd2S3dvYzJMK1IxSFh4Q1FESm1X?=
 =?utf-8?B?UU1UakdBWFpKbFlCaTBIQ3RIZHZJTW95M1NTVGN1SjgweGtBTGZXc3hqWVJU?=
 =?utf-8?B?SGNycWg4ODJSVzR6R2lvUVdMOVVzdlB1aVJ3VWluMjdXSnlBcTBDNytLVXJo?=
 =?utf-8?B?REVLTSsvWldKTDBqa2FFRFlvc01iQldrQnpGOFNhdHBhaC9IQ0lSbDV5bGtu?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf81ecc9-5a27-4ec9-7bf4-08ddf0363fc7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 06:49:54.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoBnL9VRTgV3dbc3pOdYskC6VRseNbgtHCdz8YCSfwWKicOtgzqcEgCWfWDrbz0pCEP7fxWhtljnm9/dLccypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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


On 9/4/2025 10:27 AM, Santhosh Reddy Guddati wrote:
> Restrict the crc,dpms,hang subtests to execute on a single pipe on
> the simulation platforms as the crc calculations are slow.
> This avoids timeouts on CI during execution while ensuring
> functionality of the test is verified with single pipe.
>
> V2: Update commit message, refactor logic to use single pipe (Karthik)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 17c737483..cbe38889e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -151,6 +151,7 @@ typedef struct {
>   	bool linear_modifier;
>   	unsigned int plane_format;
>   	bool async_mod_formats;
> +	bool single_pipe;
>   } data_t;
>   
>   struct format_mod {
> @@ -935,6 +936,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			test_init_fbs(data);
>   			test(data);
>   		}
> +		/* Restrict to single pipe in simulation */
> +		if (data->single_pipe)
> +			break;
>   	}
>   }
>   
> @@ -1213,8 +1217,10 @@ igt_main
>   		test_init_ops(&data);
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
> -
> +		if (igt_run_in_simulation())
> +			data.single_pipe = true;
>   		run_test(&data, test_crc);
> +		data.single_pipe = false;
>   	}
>   
>   	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
> @@ -1223,9 +1229,11 @@ igt_main
>   		test_init_ops(&data);
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
> -
> +		if (igt_run_in_simulation())
> +			data.single_pipe = true;
>   		data.atomic_path = true;
>   		run_test(&data, test_crc);
> +		data.single_pipe = false;
>   	}
>   
>   	igt_describe("Verify the async flip functionality after suspend and resume cycle");
> @@ -1246,16 +1254,22 @@ igt_main
>   		igt_require(is_intel_device(data.drm_fd));
>   		test_init_ops(&data);
>   		data.hang = true;
> +		if (igt_run_in_simulation())
> +			data.single_pipe = true;
>   		run_test(&data, test_async_flip);
>   		data.hang = false;
> +		data.single_pipe = false;
>   	}
>   
>   	igt_describe("Verify the async flip functionality after dpms cycle");
>   	igt_subtest_with_dynamic("async-flip-dpms") {
>   		test_init_ops(&data);
>   		data.dpms = true;
> +		if (igt_run_in_simulation())
> +			data.single_pipe = true;
>   		run_test(&data, test_async_flip);
>   		data.dpms = false;
> +		data.single_pipe = false;
>   	}
>   
>   	igt_fixture {
