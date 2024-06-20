Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC11C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 16:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700F10EB2C;
	Thu, 20 Jun 2024 16:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoJK7Gin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9110EB2C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718900583; x=1750436583;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eckmCRhjGAfds+Gjl7M71CKlKtaU1yCS7MNhMlqhvOc=;
 b=JoJK7Gin6aWegXAYVKqzWAJfNj3VeNRvl/zcRs+CNE2sRbHpVZUGlLKj
 oeaNh0TSjm+W0nH0N/hP/RLl/khSJ686RTBMnEr1ZJwUsV8mfEOKh9nkh
 9HbVJi8/vL9uRWdFk2F6kutA7n2QBNzl5KOUxk3SA5iKHI/IuXzg313J6
 CMslIN/IeIKxfwNcrS5wcpOxcyT9mkXwsuSsy4yyJPF/BKLHJA47r8FSl
 q0BwCH05vuVueH7xCFOu49AxBYHbMVt46xjm1FQ/dNz61uDLyDoTw9mnC
 pP+aqWoGwDg0hHu1zfiNxwLK01EavJCY7LayyQ9ZNSd2GzfJBeFLHkdMV Q==;
X-CSE-ConnectionGUID: FWvtsZ00R1u8yKmkLkZ/BQ==
X-CSE-MsgGUID: ORzhuSbYQzqvBZL1QizGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19771576"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19771576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:23:02 -0700
X-CSE-ConnectionGUID: n2p9lr9STJ2zs92Ey2FmPg==
X-CSE-MsgGUID: EzoBCKyDTsG9AcyYuQFiXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47250377"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 09:23:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 09:23:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 09:23:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 09:23:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 09:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGIDjKlCusq1irLfi9ZaOsOTVtqXSvi3vDo4SLB2d+PmmV91xG1RCyvkapNsaXg4tJQ8gaAvQvAeF8Z5SdKtQbjpauGsS5l8U3nRVlWQUxY8RHVQAEcVspLkPC/vWuVWZaFkQKNB0dzj62Fz4a7EcZDf+FDfkh8053r6+rP1pkOpF50MR169S6QM0wwOAJN2SzzoCLfCt7IgFvFFbVQQfL5miaWpmissxWUIo7/u+jg6lu/8+UKLQiLe7lXfS1746016lIFpVT12Xp4BBf155vqJemc2ux0hECrGJ1GfDXNSyH9H2Or9fAlGp1RPg9x7ITLQ/UDlBULbNdsbpLm3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm5LgVibfiVgci0mBezl2T81CR8/GwBw0bdTvQmnKMo=;
 b=fRLCa1/0GOjR6koqRXEQ+JaVku1DMO/uf3+WLRnh790vM0vpTSF27WjqZb+nacPHpwOFAduIKv9/jEeKeJQ1nVMsT5gLo11NJ0NxRZantlpnWiG3Yf4Bygr8JHtzb6fLqCIN5QJBHUScIewhrZ6IGVg0gZumwEBKZF6WSVnqCIO3dNK4WoFWjDyLjsw4Qeh02W3mfh6bCP5VKiVyBcI+sXROqfkMoCczTU3vNGK0vwnCJ64kC5Igy9MiZFOthmEdkRQhRcNBfiewH64AOziO+04wmexD+RoCHUazoGybzDdod3Um+OQzQrgX/CXA8SscQ5WK2gwa4MWrCboSVfMf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 16:22:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 16:22:56 +0000
Message-ID: <a3869627-0240-4afd-9972-c2f7908a2748@intel.com>
Date: Thu, 20 Jun 2024 21:52:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/intel/xe_gt_freq: Remove act freq check from
 freq_low_max test
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240620125437.181215-1-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240620125437.181215-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:3:17::27) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c5faa7-884f-4a7b-3040-08dc91453e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWdnR1RBaTZlQmJVcU9RaXFRRWlTcGxWaHR0eGdCVTloZ3BIRC9KRVhkNllx?=
 =?utf-8?B?Z2FPTzVqS2ZybXVwS0FKdG1sbktJbURybCtJd2JDMmRaOE56Szd0K092SlZ2?=
 =?utf-8?B?SmY4OUV0bWtjbVFPV2tBWUVTcnpiN1d5TW13Ly9yQ09sQTlMN2dXODFJaG5y?=
 =?utf-8?B?RGo2YjVCQ2hHclhEWmZJWkpxLzZwSzRVUFhBRjNmVytYeE0yck5vZGhIeGRX?=
 =?utf-8?B?RHhoN3VnaW1Lck9TekhjTys5cW1EUHVUWnloa1lFeHVheFM0MXkzTXNaU3c3?=
 =?utf-8?B?S2xEbUMyM0tZRzdMTHE0cXQwWVZKdCtvWGhLbDZaaHN3L25wdnBDL0FCNWpt?=
 =?utf-8?B?VXdkaWQ3SmRzOVdMSkRkcDE0YnJxbGhYY2dDREhaZUtBNnRvNG1JaXg1c2xU?=
 =?utf-8?B?YTRBWkdHWFIzSVJYcHdlOEpRQUlPR05aOFV3WnVta2NPMFUvNWJ2cTl0eDhy?=
 =?utf-8?B?cUVMVnJ0eGM2WDgyM3pzTmlvUmk4OCtFY3c1Y3VBVmwxY3BHRmZiS1ZQdHdF?=
 =?utf-8?B?ejBQbGl1cU1mMlFvUTJXVUdMZmlCb0xUWDJQRk1tU2J6NEFpYUpza1VLWkIx?=
 =?utf-8?B?YTZ3VDYrZkVHaDJzQmhtNEM1N0dHbWtUUktFNlpRUzJoeXZGRkpIUExVS1Bk?=
 =?utf-8?B?ajE4N01tV0Z4bUtuMmxFRFhJSEVSdzBHbkhYRU1NQWpQditXTSszMzJCV2Zh?=
 =?utf-8?B?SFBjSXI0dVlxU0MxVmM3UXVnaDR0LzBiMG9ZYWhSNXRndWd6TlZHYWhnRTFG?=
 =?utf-8?B?ZjFQWVQ4SVpjV3JJaVlnV1UweFh6Rm1iRU1EM2ZNc0w2L1JkYktnL25BZXRB?=
 =?utf-8?B?K0FkcHdmVkJIdDdGNmVLODNuWXpLdi83VnQvTjB6T2VwVjFjMlhOYmFndFB1?=
 =?utf-8?B?RnE4a2ZpRmFjVDNoRmdPUHBXazVvV3dLNmxSVmFQZTZIekNydGZybFEwKytP?=
 =?utf-8?B?Z2JuUXVMbG9VZjZ0cDBRZDJObDJieTl0bW1TWkF4Nk5NNUtUQWs5TjlvTFU1?=
 =?utf-8?B?bXVIN3IvTDQzc1I4N3hpbnYwSEtoMytJYktHdkMyK2ZISDJPRGY5SXl4R0sv?=
 =?utf-8?B?V2J2MmUyUjZLTHNpemZPTDkyWU8rK0NGSGlCMzBoc3NYeE5wcldRc0dNbDdN?=
 =?utf-8?B?dnEzQjB0a3ZLcitHMFRCOUx6ZFU1ZGYrVVovUlIxVjRocGJiakdyam16cDZU?=
 =?utf-8?B?Mlc2TDFXalB1R1BvOWxZNFhJdnlMYXowN256VnZkaHhnRVRMMjN3aVhUTmky?=
 =?utf-8?B?b2d4ZGFUMG0ydWIyVTU2TDlhWU9ERGVwSTZRaGhxelBiamVYeWN1RXQvTVNY?=
 =?utf-8?B?ZXVqc3ZxaEhZNjZZLzFoc0Rnb2hIYnJxRlVzSll0K1JJRStGSmJuUjV0Wkhw?=
 =?utf-8?B?RWJBdGsrUVJKeXZuNk4ydTRuYkdKc2F3VjZ0SU5QUGZ5NGdFcUpMRzlUTVor?=
 =?utf-8?B?TENiVTVXYWowNnNGang1cC9tNlFzZzBkU1lIaUMwY2ZEdDNHZ2hibndvVTJ2?=
 =?utf-8?B?anpGN0lNcXg0Y3RadXA4VlpUNG1iUHZwTTBacVZNRDFzNjI1S2lvK1NSbXBD?=
 =?utf-8?B?Wmo5c1FVWnR4R0VvVmR0ZTB4QysybURSOWRabzlLUGM0Zm5FSkFJMGtic1Bm?=
 =?utf-8?B?a25keUVnU0xCMGkrczNPRW1WVmFZd25pSU1qTnFhaHJ0TkZabW5VUWd1WXhI?=
 =?utf-8?Q?SkU76Mka1cA/vV2rkoWF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVh2Q2c0bXFva1czbVlEQ1NOWDkzL29JQ1JOaHRDdkRyOHdRWGREcW1sQTds?=
 =?utf-8?B?Z2tyUk8well6d2JBQUNZNFpCS2VnSFZ4YzRYY1pibnVIV0dqSEx6UlN2RW5p?=
 =?utf-8?B?VUlHdUtDa2EydkQ4anRMYWtsbzN6Yk11QTNKUTA1bGJEN3VPZWc1c2J4aENo?=
 =?utf-8?B?L2xKS2hlTHQ3eXNLQjBHQ3FEVTUrdVBBMGlpVzIvVHhMZ2YycS9Id0xpM3RF?=
 =?utf-8?B?OUlGb2hmRk5KeDlzaDZtQmJsZzNBSHRxUjZTYnRMYkZKOWJOeFFKaFgyNFR0?=
 =?utf-8?B?Sk0zcWZGaFJzSnJhU3N4bFNkNm1SeDJGcTVZUW9tQmo2RlpQK21yb01vQzJE?=
 =?utf-8?B?ZnYzVTB4WThYSUdkQkJ4WURKMUpLY1VDbnd4c042UDdqMUVkbTFLTE01Zzdr?=
 =?utf-8?B?QlpvcURuelFtUzRXSHl0NFljUHgweTJqMzN5WEhjV3N0cnRjU1ZQK2NoMEtK?=
 =?utf-8?B?RVlYdXUwdXA4dS9kS2JSS2VFWklENFQwMVhGN29wKzBvYWNreXErRHU5Y1g0?=
 =?utf-8?B?UFViM1BwcjhEbTBOYlVaQ1plNnhVQlJyeUpHanQ4VElwSDNPY0pzcGNGZEtm?=
 =?utf-8?B?aVRuK0xCaHk1cWh5SWMyemZQenQ0SjEyYjZlVHpSWHNnNE80cDNLRUh5K1lR?=
 =?utf-8?B?bW5NcEQ0TG14R0wxYTJOeURCKy9weVcvVmpRQVBCSGQySUE2SEdhTFg2bjky?=
 =?utf-8?B?NDl1Wlh1TjIyRGw1YzFPSXhMdGpuUjNlZWN6YUoyUlFKTTFHUVRjaGU3SHFG?=
 =?utf-8?B?TVJTUDVsQmZidUphVk1WbmNuaTczRU5ZMlBsaS9uemMyVVhPSUFQVDl1Njg2?=
 =?utf-8?B?NnFBRk84MDZTMjZWVVYrUzh1anNwQk1VVG1ld3QzYXhLSGRJS05Qbk9LT01j?=
 =?utf-8?B?cmloNG5LOFNYQmJDcUpXRFM2UUNTb2NkVFJHNHpBTDRnZERNVEROZmgxRkIz?=
 =?utf-8?B?bnNCUUV4aFlEN1dCd3lhOEhmb2Q5cjJhbEtXWmZmSTVOMFBlWnlLb1Fxc2Yy?=
 =?utf-8?B?bVp4UTJ1R3pXVkJTUDMxYWk3Q3NyOHF1U0pkbjFWTm93UVh0Tm1BZ2ZPQitS?=
 =?utf-8?B?WHNONjlRR09HOTBEYkNqMVliUzZCSWxVM2t2SmVwTjJVeVQ5bHhodW1jRDJW?=
 =?utf-8?B?N3pKNUk0bHZINDM5alRBQ0JCK1BncUtRZFhwUWxUMXlISkJ0di9hbkpBM21S?=
 =?utf-8?B?NjZxSGhTTHJtOU1qZGE1eGZmRVk2eU9yL3J5eEZzUmVYa1JndmptalpGKytz?=
 =?utf-8?B?SHRLdlloa2J0QklQSCt6WnZzSWlMZitOUHpncktqVHlOQW52SGRNNWJKYmNZ?=
 =?utf-8?B?TkxtbC81cHlBTjM1Z3VIRWxsQnFSRElJdElQZlE2bHZjbnJCVkVubU5PaWpo?=
 =?utf-8?B?M3FtWWdhRW90bE8zUTNLR3I1dzI3akxOTmxWamoyekwzcm9mYjVuRzNqcGpT?=
 =?utf-8?B?RFhSSHJTUUZJT0kxMXk5eGI2S0tJZUpZZU5QZndab0JWSVkwTWxyaXk3OGtR?=
 =?utf-8?B?SnErcW5COVlJTEZYOG1IN09TYXR0N2JybFpGVERkZTJ4MjJYcHBlYlpBakk1?=
 =?utf-8?B?eGdwbmppYnVEcDg2a0dhSjlsSTZzWG13TW9DdEFKVkVERWxra1g5eXk2dGE2?=
 =?utf-8?B?SzljSUhLOVV2ZGZpdVZxcDFnWjV5TitpU0V2YklESHNobEZxa0dJcDNjdXQv?=
 =?utf-8?B?Y0NCY29nN0JaaDhvUXRMQUxZOG91NEZ2Z0FHOEF0MlltbktQSTUvQk5tdWkr?=
 =?utf-8?B?YVY2OGdUTklvWDU3cVJZZXBlWmp6VU9QVTJaM2FZVkpXMXg3WUUwbnllQ2JJ?=
 =?utf-8?B?L2gzN0VnTkVqMGljb0ZnbFJjNUpwZDlBMmVuMDVPSnZCa25HRjNKY1R1cHhm?=
 =?utf-8?B?c2JvRFdKc29ZdFZKQXlNbGhKaFo0SjdXNGJqTVNBOUVGMmFCOU93KzM0UFZ1?=
 =?utf-8?B?S0lPNmFwMG4yYm8ybTBhaXhGZTliSUZZVXZRK0t1YUFnajVPVlpPRnU5VFc5?=
 =?utf-8?B?NmVsM0Z3cWZkZ1M4SytHYlRkNVprbFBmNlFGaUluU05iNWhzVEZheGl6WUR4?=
 =?utf-8?B?bFFIQmVJWk9HbDYvdG5BMW9ZRzd3QjA5Y2l0YVUzcW03cE51ZGxsUU9wRVRx?=
 =?utf-8?Q?YO8i2l1aNvUXo9Y8lVJgiXlny?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c5faa7-884f-4a7b-3040-08dc91453e43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:22:56.6689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGs3CK10KFeF+4moTlhHjPbrKdbR53cwLRANjuPbmz+bnhti8+7ILaSa+pAo3t+D3zjRTirnz11X5kU3ilXc1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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



On 6/20/2024 6:24 PM, Badal Nilawar wrote:
> First we check gt idle status and then check act freq. However, it’s
> important to note that there may be a race condition where the gt
> transitions to c6 before we complete the act freq check.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
> Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index d2e4d1a09..b3562181d 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -277,9 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
>   	rpe = get_freq(fd, gt_id, "rpe");
>   
>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> -
> -	if (!xe_is_gt_in_c6(fd, gt_id))
> -		igt_assert(get_freq(fd, gt_id, "act") == rpe);
>   }
>   
>   /**
