Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE5ACD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C54410ED53;
	Wed,  6 May 2026 11:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKnxbvKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896110ED53
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 11:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778065705; x=1809601705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iNE6q0F39lAG99XrB3WZfHkmQsKcO2aqb1weFv9gWpY=;
 b=eKnxbvKBx6VVDSbjBQ3uo77iD17Sa1u23HY2byRteg+UdAdRxYHM0OJD
 ZQm/1PGM5RgPWdgnOeZ/3rL3PiNMpSG0QNDmXwYYVuiJ7yysUYwvxG+7V
 4MaOeU6Ut4ta+CoXzNuBgJVC/LhsmO1jveD/VP9bYvv0fzdPnhVHBHKnF
 2BqQhlPMSUYUGHDrECmQknADmqQE+TrHknMHEqnGtE57klvFzOYTUeS3Y
 Rd5egaHBtem9S3ZosFMLUgGAozHrPI8YgxfCbTLRq7njwgKMQZ6pdpsNZ
 4Txzzl5LGM/R6qbGhfZVlUrHUGTtjeFwk+wn2VvNkEMDs2ydJjudTgVev g==;
X-CSE-ConnectionGUID: 9I0MPaBwTv+3LHy7BQrGgw==
X-CSE-MsgGUID: TLkW0Ec9SdOx1v5U+3KhfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79002730"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="79002730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:08:24 -0700
X-CSE-ConnectionGUID: W8cCr0ycQHOWfK9V36CDwQ==
X-CSE-MsgGUID: QN2y9DGtR8C/bUnxxfcQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="236003594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:08:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:08:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 04:08:23 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPLxmP7NitOfb53t8N36p228mhUBhsX7E+cshmT+6wjmkkYWou7tHfCG7q+tanU/YZyd/W+gFRAayFtwH6Rwdz/Ct2cVRHDENIrnr+gXoKxoMv+tEBdglFkYqQJfz1pGfwdWUWCYyXUfs93uh/BcKkxGQKllpoMaEtIRYOze9K6JGS5DmEh0AWvgvfque86EFAOY7ePfZS98XFRHyQopZ07kY35a3k4Voi2Q2iowazp8j15+qjM8t3GR4QAEYf3EY3WYMn36tILNhH6GHT3dm8hMXRPhzQyZrKiBKxeUPFTRE0v3iWNs2YJxf6CZH0M2bwCaFU/+BoWNyQASzMeI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl4qAVmXBOLArrCgouX1d/6AYlDDM+6Zt+Zuqv0BUOw=;
 b=QK+GzRf86fhw8MV0fC1csmgE1Iz6Ut/cd4T2fWmy4PpMt5RIGFOvK+Nsp9FOeqYx/w4Ojmp+Wni1YQ7W/RsIUIyk0Wchom0Gm+kyZbiAvATRtu4ZXT08KopfO/V5GsucLpRcFkgNRkn7AOVJkl2LmbHdWkeBWUTnroKwH4afdvxkqTKpvE5q0RbQg/0KhZzp2NgyYzX+hiAlolGjeoQbzUge3GxgkElu4OdhKd8U3CA8zcmUDKTJEnP2V1Fnlh4KDigtuxCYUpil+EnmYxYwLjQQECTxwsV/IUsgoSaWWPZ7Zsz35Ic/TPWKZfuLNBbOmGncAiVPz8Ig0HWSpQg/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:08:20 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6d22:9433:de57:68ee]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6d22:9433:de57:68ee%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 11:08:20 +0000
Message-ID: <48a445f0-bd77-4b1f-a58b-a0484d15214d@intel.com>
Date: Wed, 6 May 2026 13:08:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/gpgpu_fill: Add support for xe3p gpgpu
 fill
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
 <20260506065500.162563-5-zbigniew.kempczynski@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260506065500.162563-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:802:2::19) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d5b902-c9c7-4832-96f4-08deab5fc820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: bfPKDUNDw27M53Jt9Foa9aM0LK1pN9j2lDJ+mxzndM6WbwAZQyDcB7X0m/1i0TgJ6FOJCHEnaG8pBEfv0xFaQwykU6n59NIJYDzYK2llwu6Djgo1j97Zh3kwTKavnXgQyxZBIX6J6Q8PT8mX6+xM9oJVDe3o/jxXPbbdhC0x0FtWF9ymO95giMrVk6IKUnH2q+k0UXvAeuL7PWIxWSU4IilugV3VcYFjaUc+Cj9A3yTUAksUOsRAnOxryPYXhoqihBeMQxs5vov7hyzEBX2HkI8unUCYkL+zzcBet4XiTyzwfXlRuPdH6ByAz9EFHVVhEfcpmIMciAknplvaDn+0kNlx/2iPjjKfLPTVWpnVmG7sK4sZqG0UuNSsdK8YbNeqCvpm8uvkITUXezRgzEdbNy1PRmqUqwzK/6ikS4EUMe1lxOTTcIoTH3b9co+vLhKPthBT5Ksin62g1YWj4vJ7rVFWwGwlbxYhd4JHBsuZKQhbF0WanScQEQf570cHmoWxJGHgmxKSKCbz785d9PICB+3d/AVMTwgREvM0OiYfrm5PU0SMC9SvZ7b/pvnmA9vbtGJc7PzMTf0a+fkirTN9cXiJMAhIH1xzplmxSwHpro80tTA3KcLGr5O6lwR4nrUiPYuy5TtpUFonEl4BoljSgeIFtT6fyRnUmrXOn570BZxe7+4IZpk8P4SHQOPVEsFu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0pBQ3pnVmRSeGgyWC9icWFYMGRVS1lZczNTVnNnam5EZFpHRFdFM003Uzl5?=
 =?utf-8?B?Qmk3UUd2Q2swM0x0aTJTM1ZMdHEzTTRaazlHbXQ5RHRubnJnT0ZXMmFzMVc5?=
 =?utf-8?B?Q0Q0cFdVYm5vVER0WUd4U3NLQWZQNHlTVVM5bGhkVHgvN3JReDB3cDFBZm9N?=
 =?utf-8?B?NUtid05LclZkR1RmYkxFcUFPdHB6U2VSRFdIUWxicjhFTFdvN1VQMWFpcnVJ?=
 =?utf-8?B?aGRDRVQ0OWpuRTRROHRacDAwK21MelBTMHVMNnJmQk5nY0VGajFSSnJPZjVu?=
 =?utf-8?B?Z1k4aWp5S0txeEc0WWJvQWxFZ0dsTmE3NUpDUDBCVE5IamlLL1llVSt5UFBw?=
 =?utf-8?B?N2I1U1IrWU83Qnl0eVlOVXZMK1lnYkdySFdVdytwMjlWMk95clcrNUpSQVho?=
 =?utf-8?B?SXpaQ0VVd1l5RDVZTDFFKzFaaVJRMzExR0ZVZlR5dFRyUy85VGllVGtjQTBO?=
 =?utf-8?B?LytOSEhpOVRpUGMwMGJpUFFPaVBnMDRHdkk4cEJOU09Ebk9jR0ZHWnhuNDFG?=
 =?utf-8?B?TkZJZHhXbHBzblFRWEVsUXpNZGRsR0RBeVFaMUxsVWN1TWt6eHh3aTNLbFdv?=
 =?utf-8?B?U2RKUGFNLy95Q1B6WWZJL2FGL1hXcDc5bitCOEtYYlBQckxTa3JmMHFFUFU4?=
 =?utf-8?B?MnAzWXptVi9qM25vUlpUSCtFeVZGSXBwbWJFbHVzNUZ4ZlZCNkEzRWtpZlV1?=
 =?utf-8?B?eHdUbFFLMFppUkhmcjNhd1d4dkQ2RC9FWFNsUWx5czNWbmlSVzlLbHFCVDBm?=
 =?utf-8?B?QTI1RTJleGo1U3doZG5CVVkxQWw3T1BBeUFjeTdpeVpUK1RzU2JWbXNibFgw?=
 =?utf-8?B?UHArTFNLRnFQRC9laGtVY3I5WVMwWUI0OG5hemxRKzRwLzMrMElYeGVYMk5R?=
 =?utf-8?B?TlovcThiR0ZEZWQ4bmtMdDQ1ZCt4NjlDTjFEc0NoME96cTBINlY0MkRvcS9x?=
 =?utf-8?B?Yk0vVk91bTRUVWV0T2dXZGVNWDQ4UzQ1eU5FTlVLZXpWTlBSYnhHRkFiMUFU?=
 =?utf-8?B?Wmo5VlI4ZVZkcEd4WE5jUm5ISE8wTlVSQ3V2VDNLYzNDdUxmbER1M1laQVlW?=
 =?utf-8?B?OFB4VWptNU9XTmZEWU5tbHJhK1JqK0wvM2pyd3FBMlhXMHhHL1UwWUhrT3hZ?=
 =?utf-8?B?aUtNWktndHdDalk1NjZETjFiWXI2SzlVMm16REpMSzVaRmtlYnFXU3Zjd0pE?=
 =?utf-8?B?UkRJdkI4U0QyOWZVNWJ6akpTeXJOdHp6OXJPYk96Mlo4RkEzWFhtaEhORmNP?=
 =?utf-8?B?RzVhY2IyOTIyMTlaZW0zM1dmK0ROQm14VzkvYUdGR01PcnpFTzh0S0FRY0JC?=
 =?utf-8?B?QnFTNWRVOXJZYjhsWnZnV3lPTVZUUU8wdFk2ZXVtUW9oUmJTdENnNDFZcWhv?=
 =?utf-8?B?RXFEQzBnQTU5Qi9ST1R2TjZKL2wvYWRaWkF4T2tlaWMvdjN5aWpYdXFPZGEw?=
 =?utf-8?B?a0psVlVOd2tJRkJCY1I3MUpacSt2cityTHZXMHZXYlJBK3ZVamptZEZRUUNt?=
 =?utf-8?B?OU5TUitqRGo0M2xPZ2o2SWRUdHQrdnp2UjA3V1lCWFlpUllZNEFQNEJCTysw?=
 =?utf-8?B?TTV5MlE4RThtUHBoVldPOHVzRkFpSFFQeENJOW01THUvNlZrY1N1NWNrRSt4?=
 =?utf-8?B?VENQdW83QWtHdDRYTDErNXBhblVSa1JYT2tHa3pHY3l0Q3YzSDNVWnd5Mnd3?=
 =?utf-8?B?Q1JOR2x0NHFCaFdmRVZhYnltZm1iOERwdWIraXBrckFhK2pHMFZaOStzZ1Zs?=
 =?utf-8?B?ekpFaXJKeWNVbS9VRTZwZnh1VmJXZXY0MmR1dWFQMlQ4L2Yra0wxcWR6QUF6?=
 =?utf-8?B?SXFUWXExaFpQQmlvUVlxYStFRE9DRTA4K0VPazBWY3lFc016bW5kSUZxRlg4?=
 =?utf-8?B?OUtudHMzNDVlSCtET0hUMEl1djFzL0lEQlh5V08vRHROd3dtU1NNam9tYWFm?=
 =?utf-8?B?Zm5rM21WWUJORkVSdE9acERUK2FMejVzbk9oN0NUbWZxSGp6bmYrMTNjbU9M?=
 =?utf-8?B?MHpJSWdzcDE3UEtNSE1idFMvMHQ0ZnBGOUtmMjlzL2FLblZUQUY0VFI4OWNx?=
 =?utf-8?B?RXQrL05EU1NpQkYxNXdyUDNCTVhycE82bi9BM1ZlZlNzVUF5b1JUbCtRTFNI?=
 =?utf-8?B?SFJnQVV0TDl4S1lzcjNvTUNmaHNoUENlMGdxUXZsS2FiT3cyM1pCWGJRUG83?=
 =?utf-8?B?N1A5QjU3SzNCQzQ4UThFUExzbHZOa0pXUlZLb1dKSEVoSk9VbXM4Sk83NnJw?=
 =?utf-8?B?ZFRqdjQycTNEK3AzQ2dXYTZOalE1K2loT2laMFlOTUZZdGtFN1VGSUNaY3E1?=
 =?utf-8?B?aldlMVY2NndVN1NTcEY1WWRNRWdKQXl3dUR0b0pCRENFM1lXZkVCZz09?=
X-Exchange-RoutingPolicyChecked: ceVbY6rJl71gMTdrWezvpSUfUmxcAzHNoIdxnBnI6E5Rf4P1V7SldrjLzWLS9pTpJij3QVgcUtCYIWFXbo0zTquoAnkFAdRITJk5U74SZgHZOYoVEDRoY6LjykabSczTRDtVKi760uEV3BOhQPo8qmIzl2pxymjVdSDCroqgvcloEZXpVtXOZRfljfMdg/KFw4r4AwLFU7iIXs11HLKJtLyGliFraSNBWFBBb4/vwZwwWfWBCww2wlyHMigX6FWz+zNPBUWygS4+y3G2JmhJY8rqbCgY3OpcJ71kmXJq16/WihAVy/vG1cRCCfkkN+mOvt9sT3L+ZjavdcUyTmBSuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d5b902-c9c7-4832-96f4-08deab5fc820
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:08:20.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57TLX27kbAR2dn6/tNvtwa1vEIqB7E6hU5LaattS+1oV8eGTMkDxoODstpgMsfW8AZNNh6wbDSB9ioYnYTF/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

W dniu 6.05.2026 o 08:55, Zbigniew KempczyÅski pisze:
> XE3P uses in non-legacy mode COMPUTE_WALKER_2 so adopt pipeline and
> shader in gpgpu library to properly handle gpgpu fill.
> 
> Difference between previous platforms shaders is no surface state
> is used so all geometry must be handled by the pipeline / shader
> (accesses to memory are via untyped global [ugm]). Threads spawned
> here are still SIMD16, but due to conditional writing to ugm memory
> with 4B vector using 4x1 sizes and positions become possible.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> v2: drop buffer patching and pass its offset via inline (Andrzej)


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


