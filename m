Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F27CC6B27
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 08:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE9510FC06;
	Wed, 14 Oct 2026 08:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69DD10FC00
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791966841; x=1823502841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WgcM3cpSYEOSap7zf42T2/aJi5NNjBB0CB4ybOZrOx0=;
 b=EY4qbfLWg9XMzCxt5+WBqaZAwAyOPiZrzC3aUmbwEEGPk7Zc+TYXK2h7
 IOuq2/rbD3zg7/l4akiY3UTiCpITztVy48UZeTiHkgQppAFBO9xc5jpoK
 mHsohcc/kOO0UL14PGrXgJlmrFWMK8lnzQ57p/wsjQ6lzjdKB7aHcnPHn
 r3CIlQjm2/TaKP3czpCpl+/wUPmKglrBiCFoJgCbuczcEsE/LDluC9czH
 pRyKky+U87QC+c5rHy4vm/P04qUwKbGp2oEH1Kcz77o8p2S9ze6bdWppy
 u3VsjD33QbRNStv/hOFHfeufcW9XwfER1zihY4Zd5k0rpXMs+k2qPFETZ Q==;
X-CSE-ConnectionGUID: DtOrjD8aTzqkoYH7c9FuYA==
X-CSE-MsgGUID: 5/uSP40BTz+0+WIuv8jXPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="695247"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="695247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:34:01 -0700
X-CSE-ConnectionGUID: auG1K8o4T9Gptabmka1kfA==
X-CSE-MsgGUID: +E4rgDrVR/+2aaFs36nrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1454100"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:34:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 01:34:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 01:34:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 01:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebKDOT4ZGno1f0IT8Pq3T+ZRJYFyDcBFZDyaRaZjjF5XP+DaWvaSNHDcmpL7gFTxwasRiAoDHxRNLsYnS+k6yScdkSXaLQhtEPYNkakMW1CSjNmd5Dx9risE4UKJpwPI36MBLPu1B+VltqubXmDi7Tfjs5TvT1Fgs7XWaW0rIxOp7ghVbNHdIQfgBgoV9H4AlqKwZXlgTxB+M+lL1oJjWKOC5fQtgRz/pvub8kf36zrLlJTum4bYVBNIxpWH/Gj5SCpu2hS47mNXVJJH5Op+lD0E+IM96mChTds9+6CeSOkoxkqiA1DzVOiAezFqZkXWui2hIKsIeoybBrew3CX/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/pd552jemlD3TiPVxGx6ZKfLf3+fcS0NBmhiN1RP5M=;
 b=dNZ2YDIdFGXhiOJCaCf0DhvDYE9ZvI+DtZhwgAgSJdlz1hMvjdD/3lpPasG0Orjl49qPBrGAH+pwDeVloAGqFy58n/ayMVWS0K0wzKeMfkCD93KmwJYqByRE8Kdk9/ZfQf9z92pGoWn1KpbB7nN3aVHXUTxA9Rq9OJ0CweARGwi9kZ/3vt4tM2wrgUObox4Os+5sN0Kn+ujysWjrufLZFy1SX7iYBF41imhkSofLTjdjUmkaXoWkKUn5Upled8OYdAZq8wvgOLlEQHofZjeJeSMA2hyS1024Wm37/5CN2ZO24+RYtC9OYb3tjSgf6LkFc6GevBq84zStM4tKiIL/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CH3PR11MB941921.namprd11.prod.outlook.com (2603:10b6:610:363::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 08:33:59 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 08:33:58 +0000
Message-ID: <2f7536ef-9595-404d-857e-19c26855c4a7@intel.com>
Date: Wed, 14 Oct 2026 14:03:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_force_connector_basic: Add EDID
 bit-banging read test
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
 <7177489852a712f06485a2f0245fe8ff4a48e233@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <7177489852a712f06485a2f0245fe8ff4a48e233@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CH3PR11MB941921:EE_
X-MS-Office365-Filtering-Correlation-Id: d507bb29-acfa-4955-9206-08df29cde453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|4143699003|56012099006|261009221227099003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: LMcEwVn1sru1TgZiGclyCSrCWy46/w/D2UtPWXCZ/SIJji0oC+xdedL45MhaZoJMyCC+Zp53c+WcKQEMW8B0k52nNRVotHodexjoWD8nhplTRW3KKRgYCk2t8uDvEOpMPAaAgGlceSM9JCxoMxjZktD493oEt9uOPuiuO9gEpgLFu3M+gZaLLvj7zmxSrsgD6Ff+xRBp6jEjGW2T2XpPThuduIXgLlO6WBR0L10BxXUpD3+Fax7zvuq7lHW9WdthHtT+aj3fcekgGu2x1Cw20RtMfJliPpFSXcb8mRQYVDBH+Nd88utS9CfHhTGUFkXw5fLIUeMxRNEdoxNqZbNtuUG5a8CqHA8a4qaaGx+MISTywSJYKR9BTO+Nfsn311rAzb1XvXS8ovJgsWm/tBUmEpFIAUL+47j67zqgAhFjgTHEteKzXUHckCHAbV6PkQ3ZxHz9CapIxaqsexDnhzGcl/3Z/izjCHsUZN3Fr5I7dsNpABYQ1UXDoj9HVOZFQdJq7kEgpupsRkaFSV6vBx1F2qTWo1dnDCKl2qQ5VNa50lc4FVv/g4Kv/v4G0HFAhTQ11hQtvwqCQvS2vLxKTgBoc6rUWQNAo+ejKsJImUJOf45L9rQpwqNNDs4ZSAywwLz2l6vE/wD+gnjUDPuk/zVU76Iy00cc1GY5Sf2Ui6+Z+mM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(4143699003)(56012099006)(261009221227099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2N4Wk0rOUphSVI5Qlc4eTVrcm5sZTlSUzFhWE1NVXB1eERUMjhWZkRrV1dz?=
 =?utf-8?B?K2xxWHdXWHB2Wk95Y2lBaVFFUk1VOTluSkJkc3F0UGczbGpmdVhKd3BnUkNH?=
 =?utf-8?B?NzNmY3N5L2VyR1hvVVc0Yy9tbUJWQzVWWmtBdWMxTDhuMm5jYXRzbUtIOUh5?=
 =?utf-8?B?SCtUSHhzVW85cExOVmhuRlloYnhPSVE3SGxKbW5WTHZ4N2V1VURFajR4TFZu?=
 =?utf-8?B?VlNNY2ZFbTRWbUR4TWhwejZMWndCeHJKbFVWTEpsaExtbHhDa2l2RVBIQ0xa?=
 =?utf-8?B?WFlZVVlqVHQ4WkV2cktJbStIVzN0eXNtOHB0Mm9rSklnREdNSmZVMm51cktK?=
 =?utf-8?B?NlFjVEtXZFA0bGlsYWJDWmh1SHBIVHV5TEN0dXRDQ1hXbko5dHRNQkZKNkE2?=
 =?utf-8?B?SEZPOFJzaDdFVS90NXIxK0plZDJDRXM1VjhkK0NKKzNPVmJUc0t4SjRWMS9L?=
 =?utf-8?B?U042Y2NEMGEzNTdrYi84eEUwQ2xYRGFvaUFMODQ2Yk5hSk1YUkMvYnZJeXdG?=
 =?utf-8?B?K3ZJKzB5RitiWkhsTkgzc0IxQUFuYjdoM2lVWmU2bjFudkJVUDJESnpMUFRI?=
 =?utf-8?B?SkFvUmc5V3pmc0tCdEovL2huK3JmVzVDV2dyWFRKUUh2a3BUd1luRndQS3hK?=
 =?utf-8?B?amJscmJ3dFZ4TEZMOFdHVHVTWkhHUWU3bE43SnNJdTdGdlp6MjI2OTRYbXR0?=
 =?utf-8?B?c1J0RlF2YW5nR2JSU3BTTGVCT0NBUU4vOEpNeEtpWVE4alpSNUxZUDhMWVFx?=
 =?utf-8?B?b1FubmZ4TnhUYWIxT0JmSkl6OWZmb3Job2JOV09QMUFLY1NHQzB1VVlYL3Zp?=
 =?utf-8?B?amI3Vmd1OGtNMThiSXFIb2VMajRQRk40SGZwcEJLU0IrUWZhbnpxRi9OZFY2?=
 =?utf-8?B?VHlkNHY5bE04a3AzenpyamRTYkJHQzNnb25NMzJxN1lzM09EeUg1VkhkWXJQ?=
 =?utf-8?B?RXZKWTNadDNuMTk4b3BIV0pOK2p6UFM3SUU2cWd5RVlycWppUXpyeHVlWEF6?=
 =?utf-8?B?QTdsSUc1bUM4cnZ6WnRHNWt3cVUyc0V3dWRFdnQ0TndhY0FYeXl3N0tkdHdp?=
 =?utf-8?B?Y3VRSmxjYWdPTEw0Uk00cVJBQXE5VkhOVWVHbDU1cm45VDFYcUJCTEdmc0Ra?=
 =?utf-8?B?ejdubE4yOXZ0WFY1TC9zeE50YkhpOWh6eCttTFBPcEFQTHQxOGplUmo3TEJ0?=
 =?utf-8?B?MFlqL2NmVEJaUGNjQXN1UGl0eHFOOWlVMUNiMkpLUFVQV0dKcUhzL3BMQVBi?=
 =?utf-8?B?L0kyckttQzRvN2JaSGFFV3MzU1FLUjRQbDRMZTZ5WGc3M2lzL0hsUmZ4dWEx?=
 =?utf-8?B?T3FoYi9VZC9oa2I4MnFVc2xEMmNCWWt6SVRRNVJ6Mk0rZ0ZEZTY5cnlWV015?=
 =?utf-8?B?Z0VXMmVyZERnZ1dVNDkxV1E5WWZISWRidy9pblhaRCt2WTJMQzFEdTkwK1Er?=
 =?utf-8?B?UHlDQkxES2JZWXhCRUpoM2FlaDg4K1B1OStmaHNmTVlzN0dIckIrSDdkaTdO?=
 =?utf-8?B?bDZzVzN2TWpheU1IMmtwNEtHWng1RlhlaU1KTSsxZVdUSlovL0JhY3BTdkhK?=
 =?utf-8?B?ajZtWG5tL01OcXNZQ3F4cjJhdzAzYnB5OE5UejQzdkJrTHA5bXhSL0l4blRS?=
 =?utf-8?B?WnpxaUdnNXhndG1GYUp2bmRWU1NyMlNVZVB3aDZkZndFNnAvYWJLL3pIdHRq?=
 =?utf-8?B?V2Jhc2x2dE95MzJ3VGhLQUx0VFJEOUZQQWpkbjVVS2U3SnFUUStPV0VyNzBM?=
 =?utf-8?B?QjV1K2dFbEszK2lYK3E3aXNwUWVWZGtXa3VQbWVnOWlObzZZc2ZXbnBIOU05?=
 =?utf-8?B?ZGpLbUxMSDVXakpnVkNVM3d1SjRXOXhJSWI0RWpZQloxT0NtV3A3OFF4cjBQ?=
 =?utf-8?B?ZjBFT09rM0xYQzBGR2NIRmFTRURNdGU1TUYyUjdSeWJBWWQxTk9ZSDdRVU9R?=
 =?utf-8?B?VXVWVTdZYXlqbmY4RG1qazN6SktBOXRUQ1JQSmZicDcwcGVPVGhQQUNMRzRh?=
 =?utf-8?B?Y3ZpSVg4NkozRmtyM1NEaHhOMXB3eE1KMWdwbEtqd1Y2V1JQQnRibWNPTTRw?=
 =?utf-8?B?ckhHMlJvOS8rWjE4Q3RqQnEzcFdSNWtZNVdCZDZPcnZXWVdGVzZ4WDdsS1l3?=
 =?utf-8?B?SXd1d1RsQy9BT2VabGR1bXcyVzMzQmdObEVuZUMxeTlNS1dXOHBuc1NZUkt2?=
 =?utf-8?B?cnBGZDVhVVdSNXdTOEY2anI4anBvaXZ3VlR2d0JYTERPdnBzdFN4anV5ZDVJ?=
 =?utf-8?B?RXg4cU96V3BBSC9Zb05sVFZWbTBaSlpaZFlhU2NEVE1Bb1E1cHJUNmwzSHhy?=
 =?utf-8?B?OXpvSktCeUJ3alZENEtWaVg4c3Y0N1BqM2krVCt6YStVL1pHa2lJTGdKMnRD?=
 =?utf-8?Q?WM0j0lovdtrBry64=3D?=
X-Exchange-RoutingPolicyChecked: Y3woiUbHJNBlHjEgmMz0SvrHpr8m6c9Va9S04p8NPGD3itsPmDSebT6nk23x6d/JuwUHE81uS7HSNmmqDpdagnTu3f0bhC7Cc5mtbYBwsGHCdOdT6G4MOhSd+cPW1FAEFtn2kj+/xB+DhqL/Hmr6FfGMJbsHL6eSroc9thzh3iRKhveZW9XYTMk+G1TxcpG0+7lwPM2/lWaZCs/uV0xvIPcjFkr+P2XT2G9nvYbmpK7MwlIxAhECEUcJLAngcQ9kTtoe0GWvXgT3+wcCsO8rEZf4mG4dHTROvrgmNY9omZOLL+XuyAq3m/j6lUVeWDD9mx1gKbeuVxmYGZWFEoclhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d507bb29-acfa-4955-9206-08df29cde453
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:33:58.6571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/mg1bbhMkiIHS+TcA3bCDUzxSOrJFYCjs2bjS0HJCvttc4MqEWf1QALZJyS6bNKqMQjXO5RIS5tSaCCmCQDM6hAclWrmLkCksxJpNQGgLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB941921
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

Hi Jani,

On 9/30/2026 12:39 PM, Jani Nikula wrote:
> On Wed, 30 Sep 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
>> Add a new IGT subtest to verify EDID retrieval through the I2C
>> bit-banging path.
>>
>> The test forces EDID accesses to use the fallback software-driven I2C
>> mechanism, triggers connector reprobe, and verifies that a valid EDID
>> is exposed by the connector. It then restores the default EDID access
>> path and repeats the verification.
>>   
>> This provides coverage for EDID detection through both the fallback
>> and default mechanisms, helping to catch regressions in connector
>> probing and display identification.
>>
>> Assisted-by: OpenAI Codex:GPT-5
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_force_connector_basic.c | 91 ++++++++++++++++++++++++++++++-
>>   1 file changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
>> index c4252ea02..1f2ff3595 100644
>> --- a/tests/kms_force_connector_basic.c
>> +++ b/tests/kms_force_connector_basic.c
>> @@ -31,6 +31,7 @@
>>    */
>>   
>>   #include "igt.h"
>> +#include "igt_edid.h"
>>   
>>   /**
>>    * SUBTEST: force-load-detect
>> @@ -45,6 +46,10 @@
>>    *
>>    * SUBTEST: prune-stale-modes
>>    * Description: Tests pruning of stale modes
>> + *
>> + * SUBTEST: force-edid-read-over-i2c-bit-banging
>> + * Description: Test EDID readout over bit banging.
>> + * Driver requirement: i915
>>    */
>>   
>>   IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
>> @@ -300,6 +305,87 @@ static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
>>   				FORCE_CONNECTOR_UNSPECIFIED);
>>   }
>>   
>> +static bool connector_has_valid_edid(int drm_fd, drmModeConnectorPtr connector)
>> +{
>> +	static const uint8_t header[] = {
>> +		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
>> +	};
>> +	drmModePropertyBlobPtr blob;
>> +	uint64_t blob_id;
>> +	uint8_t checksum = 0;
>> +
>> +	if (!kmstest_get_property(drm_fd, connector->connector_id,
>> +				  DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
>> +				  &blob_id, NULL) || !blob_id)
>> +		return false;
>> +
>> +	blob = drmModeGetPropertyBlob(drm_fd, blob_id);
>> +	if (!blob || blob->length < EDID_BLOCK_SIZE ||
>> +	    memcmp(blob->data, header, sizeof(header))) {
>> +		if (blob)
>> +			drmModeFreePropertyBlob(blob);
>> +		return false;
>> +	}
>> +
>> +	for (size_t i = 0; i < EDID_BLOCK_SIZE; i++)
>> +		checksum += ((const uint8_t *)blob->data)[i];
>> +
>> +	drmModeFreePropertyBlob(blob);
>> +	return checksum == 0;
> The kernel won't store the EDID in the property if the base block
> checksum is invalid. OTOH, the kernel allows checksum failures in the
> CTA extension block, but that's no indication of failure here either.
>
> BR,
> Jani.
Thanks for pointing that out. I was using the checksum as a sanity check 
on the retrieved EDID, but since the kernel already validates the base 
block before exposing the EDID property, that check is redundant. I'll 
drop the checksum validation and limit the test to verifying successful 
EDID exposure through both the bit-banging and normal EDID access paths.
>
>
>
>> +}
>> +
>> +static void force_edid_over_bit_banging(int drm_fd,
>> +					drmModeConnectorPtr connector)
>> +{
>> +	char connector_name[32];
>> +	char debugfs_path[64];
>> +	drmModeConnector *temp;
>> +
>> +	igt_require_i915(drm_fd);
>> +	snprintf(connector_name, sizeof(connector_name), "%s-%u",
>> +		 kmstest_connector_type_str(connector->connector_type),
>> +		 connector->connector_type_id);
>> +	snprintf(debugfs_path, sizeof(debugfs_path),
>> +		 "%s/intel_force_bit_banging", connector_name);
>> +
>> +	igt_require_f(igt_debugfs_exists(drm_fd, debugfs_path, O_RDONLY),
>> +		      "%s is not available\n", debugfs_path);
>> +
>> +	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
>> +						       "intel_force_bit_banging",
>> +						       "1", 1), 0);
>> +
>> +	/* Reprobe the connector with bit banging enabled. */
>> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
>> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
>> +	temp = drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
>> +	igt_assert(temp);
>> +	if (!connector_has_valid_edid(drm_fd, connector)) {
>> +		igt_warn("No valid EDID found with bit banging enabled\n");
>> +		igt_debugfs_write_connector_file(drm_fd, connector_name,
>> +						 "intel_force_bit_banging", "0", 1);
>> +		igt_reset_connectors();
>> +		igt_fail(IGT_EXIT_FAILURE);
>> +	}
>> +	drmModeFreeConnector(temp);
>> +
>> +	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
>> +						       "intel_force_bit_banging",
>> +						       "0", 1), 0);
>> +
>> +	/* Reprobe once more after restoring the normal EDID read path. */
>> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
>> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
>> +	temp = drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
>> +	igt_assert(temp);
>> +	if (!connector_has_valid_edid(drm_fd, connector)) {
>> +		igt_warn("No valid EDID found after disabling bit banging\n");
>> +		igt_reset_connectors();
>> +		igt_fail(IGT_EXIT_FAILURE);
>> +	}
>> +	drmModeFreeConnector(temp);
>> +}
>> +
>>   static int opt_handler(int opt, int opt_index, void *data)
>>   {
>>   	switch (opt) {
>> @@ -338,7 +424,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
>>   		  force_edid },
>>   		{ "prune-stale-modes",
>>   		  "Tests pruning of stale modes.",
>> -		  prune_stale_modes }
>> +		  prune_stale_modes },
>> +		{ "force-edid-read-over-i2c-bit-banging",
>> +		  "Test EDID readout over bit banging.",
>> +		  force_edid_over_bit_banging }
>>   	};
>>   
>>   	igt_fixture() {
