Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B31BC3DA63
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 17:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F2510E1E7;
	Tue, 23 Jul 2024 17:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxhxDAQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116110E61B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721756128; x=1753292128;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+Op6hveCSpagdNxVkNGNq1vZ6PKBnKcO7vy8QsK0BE0=;
 b=GxhxDAQNEbhwJVCgYiDjQQfwd8jVuoznXI9q5oW+N+yN5oG2nCYxf+DX
 wzO/orcFimRPAcIydu1Jw9EEL8/Mf4HdaB1d2yyNXyqe3khq9LzDJm0VA
 ne5jhaYqSDWouCAomzfp1/g6AOJm8vUelOJa37Na8OaD5S397Tk0GociJ
 6jG3gwCdBEB6Hj/Aw6P/mUfMnykJgNgupLf7bWgajTYOkU2clSWle9IU6
 qt/d0KPiWk7ou5Yo/m3pK7TqmCQcexa0m793r28wYlwdw/ZC1rttMvjnu
 ksFeT9sUenp5rZlNIDMr+pvifLg/MjP/KR+nsMeuRqtvRBiaESjnX5Lik w==;
X-CSE-ConnectionGUID: TIg9itakTpiPknupLX4P/g==
X-CSE-MsgGUID: 10KkdZMmQSSHYNR98HR60Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="29987427"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="29987427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 10:35:24 -0700
X-CSE-ConnectionGUID: YgDRzjz9RY+og1A3vJ5fdw==
X-CSE-MsgGUID: +HJA1d2TQ2mHENItzUaPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52328472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 10:35:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 10:35:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 10:35:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 10:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diZGxj4ETQKbyzhXFcrATbwyVTLDFOjCHCchWE9UsMPEA3YBtm9IGB6JH8IsLPYkcY0WnuLY7LxDYSJ80tOwbqtm4EbNgl7OWYaChzwtZMEddZaXqXiN8bEK3ySV2oaYNh4X/7H5+sIWcirWOZy3/VDrWktN6IWMTv5OUYuGoHmZr7yPZwAcOXxDSFED8V8oYI8BHhzry5CUjuEHatOMehOlD2Q7kyQncvpE0cAMwWAAiKZUpgMfnFzibM/eoIwhCoaDnKVjntAObg2bvgkUnl1SyZ0Q6EJIAPqbIHX6GY82/ElNUenZhD1LB7jecQQOe9fkbcZIN6g1RvQ5HQrHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z12NzHZrYElSaXzh1312k9/K8Q4CHpYxDJ4HVjxo/II=;
 b=ga7G+REUEMqE1e28Jrt9PADMvQFBI1GyW5tSeR4kjzZgeJJzhfMo5FG1ENTxObtzMUO4snjrbCMpaefxnGi1N0Jg7+14W/KwXce30RIH9Z/fYXPoYE8z4kSP9YfFBSmcnKBC/B55meeAqC5OWvuGCtzQm+EQDvBdKmeDHnyucCT4/7y1SxJOZVU9thPuYUXUG2Yzz92iqsXIigZ+HMBafEAyVBruwgyPUyZueklg6xiUOvZv2yiOdPOTbqluvCSow2H9YyJaQc6C0aw/LH6nzouqU2c4ij4ixhrOYRYoDw7A7fhgAA8Rx8mZFSO8cHu0WRoizKqLEDrVwbf4JzuQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 17:35:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 17:35:17 +0000
Date: Tue, 23 Jul 2024 17:34:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_vm: Add test for 64k page corners
Message-ID: <Zp/pohEkyEpZwMIM@DUT025-TGLU.fm.intel.com>
References: <20240719191126.1535811-1-matthew.brost@intel.com>
 <20240722055738.wndtosfozamza3fd@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240722055738.wndtosfozamza3fd@zkempczy-mobl2>
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: f601165a-b8e8-4430-c645-08dcab3dd11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjNzY0FGRmpXYXFPRERra1ljTXdLdTVmYnlXQkQ2VkVOb1pVZVc4MENjbTRt?=
 =?utf-8?B?cnYyMUdTU0c5VUx1TXBEYzE4WUJTb2o2Zjg4dWxpajRkVW9LR0NwcEJ0ZW0z?=
 =?utf-8?B?eWkyaHlLbFV0QU5kUlFvKzZVT0d1b1FIZVdBZm8rUFpZU0FuM3RvWDU2U2E5?=
 =?utf-8?B?K2g0bGhGSnBUeU5BTGZlUlJia25uQWRTVW53V0dKQjRscG1EbGI4L0VxeFlO?=
 =?utf-8?B?TE9jb05JRTBjazdnVEJPaktTVm13ZHFQVURDSXFoYnRPQlQzYXRLZTdoNXNU?=
 =?utf-8?B?NjQ3Z2t1VUNjVUJwVkNlNStiQldlODJUaUhkeWJ1UmtENFZnVFRHWDNCSVlY?=
 =?utf-8?B?QzlRM2dtZmxuS25UQ0lHMFJ4a0p3bk5nd25wa0syVHlyTHV4NFB6VUxKb0xE?=
 =?utf-8?B?bnJxYklUcTNDdTBJQWNDUVRCa1NkbUFoSkFNUHQ1Mnc0ZVJYSFZUNTJDblR1?=
 =?utf-8?B?bGk2LytrelFZaGN5RDVldXlndk1OOTFaamtSRUNsUkZ5aHJoWkE2M0VyZDFD?=
 =?utf-8?B?SlVZYWdISTdUTUEyZzhkQ01hWlNPQysvV1Z3NThnNHNleTN5Y1FHSWJLNzA3?=
 =?utf-8?B?ekJaRmpGZ1k3VkNQUGF1RkYrUG54YW1yZFRvKzRKYkhDL0tkakRhVjQzdGNK?=
 =?utf-8?B?SkZwSzZBbHc4V2ZaL0xtK2NEMHFSOTFBK2VYMmtCUnEyWGNVMUVIKy9nanBP?=
 =?utf-8?B?M1JNOTFzODdUL2lFUzYxeUQrMXd1cG1sd1pERXpSVzNuMHFQYUJITURkVVlG?=
 =?utf-8?B?UmRFOFZjeWgreXVKOU9qYVBiZUZNOGZocDdpQzg1TW9mb1VqQkFZczFnVDVI?=
 =?utf-8?B?ODN0cmtiL1o2dXdnV3VMajhULy91Nng1d0tLQWIyTXkyUnhzVVZlbGdGbWpy?=
 =?utf-8?B?cmR1ZDN0WVhvbjZvUXpuMnRPRVpnQ3ZYcVZ6Tzh3cmFQMThEd3FxUS9UTFla?=
 =?utf-8?B?U2RlYUNXdXFOdU5tNkNETE81Zit4RFJTKzRNQ2tPWWZ0Um5xZHR3MGhtZzlV?=
 =?utf-8?B?NUtKRGpJMDdzSEN3WEo3WmhrZzFaNXJKWEs1ZGprRVhTWDZnTXJUcTR3MDFs?=
 =?utf-8?B?WWU4T3kzTVBCYk9aL0tBNWo4R0paYnh2cGpqUDRvOWNuWnVJQ256SzZmNDl6?=
 =?utf-8?B?M1J3Mk5acHMraTZRZEJEREppTW9HVUh2TVBLZ25LemQ1OHJvOWwwU1FnYXNv?=
 =?utf-8?B?SmpNQkt3R2tHWW4zWHR4Q2RyRDZ4MWovbGwrVlliandyN0dOdkN3SjJhZ1ht?=
 =?utf-8?B?V1FhYzRVenMyMkpkTnhPRklKRVZuRVA0MGNQem51YUwzUHllb1U4YlZQd2t2?=
 =?utf-8?B?ZXVRdjhaU2J3b01IcU5YY0xnSlRsWDRMamdTSXNoNzhDdnp2MzMxeWlUc3Fa?=
 =?utf-8?B?Q2lUWk5sTzAzTWJINkk0N0hRTC9kU3VqZVBHbjE1d0psNkhmUkdNc1pqSUtH?=
 =?utf-8?B?cFNGcUg2L1VvdE9zbVlkVTcvc0ZQTlNUYUFZTnpkU09xclhibDhiU0ZZRGRK?=
 =?utf-8?B?ZWxCTEQrSVpxbjZCK2pDKy91MHRtbU9VRFJlZmNyZFpROVBzRENXb3VCOWl2?=
 =?utf-8?B?UXFRNVVuWm40YTFXVWwrZktSTERZWUNEdVVCRyt3eG9VRjU4cUdxeHFrWkJT?=
 =?utf-8?B?cmFnQnlSZ3BVU2F6RDdJWEx2SkowdDBNMWZ2M2lXUEs4eFVkUERLNzRwOFlX?=
 =?utf-8?B?bWk2ZjRnZ2FSUnRuL25rOUcrRlQzazgwUFZ2TFVBZzdhSTUwNFVWRXlOdUJD?=
 =?utf-8?Q?DpBMjXZFbxiPsQ0USg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3greGsxR1hsSERKdnVrVVhyWUpRSWJSM3JPL0RMY3BTUFNNSk9hNmdFT0tt?=
 =?utf-8?B?Rm52UGM4eDF6TWszZml5d3dwS3V5QkV5TmVpalRQU2RpTWVsVXYrNE13cmpS?=
 =?utf-8?B?dzJnT0RNaXdtS0ZQL25aVjM4KzhyYkQwbzVnVkN0U3pvUzZwdUtpNXAzWFg5?=
 =?utf-8?B?N2RPZnVCV2szeDNyUHNnMk16VHJaaDZBZmZmVWdvQnZRbS9NMThWbVhZclRI?=
 =?utf-8?B?OWN3aUFCb0lpY2k5bExEeWRqTHNseTkza1FKVDdvOGlvMnBmaU1OYkRxd2h3?=
 =?utf-8?B?Q0ltMDB1V2dOUHNJV0N5eTNFa0M4Rm8yZGk3THVKWXlNbnBac3VGMUJhVktC?=
 =?utf-8?B?ZWM5QWd3QURZbTBYRWEyVWZXRDd3a0psdDE1dHJ5blV5QzZpVk43bDFtWkE1?=
 =?utf-8?B?RmVVZ3BuMjYrQWhaZTM1bkIzUEU2OWNIZmF1RFpkYWVEVnh3M0RUYWw2R2Vm?=
 =?utf-8?B?VW1kSTc2WE1rU3E4RTAydjBEYjhwUHJuSHJBMC9UNHpYZ24wSHJ2VlFnVzNR?=
 =?utf-8?B?ZllFaFhKOEIvTDA4dEhQTVBmdm5tOEJia1BXMHhmYjNDQTVhNHBQK1BqcmxX?=
 =?utf-8?B?eTBBMVVXU0tpZml0OU45TGNmSGZOK2tJWGtKVGNLZnlCeTJ6dUdQaDJ2NTVF?=
 =?utf-8?B?dlR0WmpHbkN4NmJxbnF5ZEhWMjYzai9kYnI4QWhZK2RwTHpieEFYeW40cEh3?=
 =?utf-8?B?Mnc5U3dia2pJa1NzbDcvcW9IYnM4bEtJWmZrU1U1SjlSdVYyR0lwcFlIZGtV?=
 =?utf-8?B?YlF4N3FYNFYxQXBrcXUxSWh4QzNEMWtpZE5WN3QwK0loWWhVSFA5S2hueHlu?=
 =?utf-8?B?V2FpVzdEdERtS05ROFJWK3BhYW10M0phR1VsR0FxdWNNT2hZOHUyQm9uS2c1?=
 =?utf-8?B?Nk1PL3JGeTEyYmJua1BvV056bkg2NThsRFpwNlhkNGV1WWVkb1FqVGV5Q1Jy?=
 =?utf-8?B?S0hOWHppVFRoVEliV0JlTnNhU0FGSWIzZDlOdFRIWXcyYTc3MlJ6azFFUFVC?=
 =?utf-8?B?dlNxd1VUcTZiV2hHY1JGNGFSdjNjSGJvdU5vRTdhTDUvTkl3V21xWG5jR0p3?=
 =?utf-8?B?RTVHbkU5NWt6TWw1V2ExTE5GWUJNQVVKYnAzR3FlR3VUbjFIelNrYVdjZzhH?=
 =?utf-8?B?aGc3YWlkSnF0K2haa0M2MCsvUU5mM1lhYTAzVUN6UU5nd2Z1NUIrekxxVjZh?=
 =?utf-8?B?R0pINnJPSFVTY3d4SGlpRFFLcDZuYlIzdE5VWGg2NHFkZksyK3JkTFZQY2d3?=
 =?utf-8?B?UmNZMmdzdzF4UnlrRk1OQS9UcFJ2aVB1UVRJWUV3cjV1ZS9sMTM4bzFqcnNC?=
 =?utf-8?B?U1BGYkliQ2pLT2tUci9RUnlRQ2VXNUtaY3BNU2J2N0VKVlgxd2JmUzFybWxI?=
 =?utf-8?B?YVZmT2UwdXorRG51QXY1MmcyaGhHenJqU1VCbUdpYWRpMTJYSXZ0UGlUUkVH?=
 =?utf-8?B?eHFYMVFsTm56M3lPMGF2YTA4Z29NQ1o4b2Z2Vm5lY0twWHR1SDZzdG1tKzZN?=
 =?utf-8?B?TVRQOStUN0V5ZEtwWm1rL2FzdmxWVzlMa00za2NDR0EvZ1F6cHViU0F1Wm5k?=
 =?utf-8?B?Ykpjbm5ySzRyZS9jMktHbVljamVUb0d5eTd4NHAwV1gyZ0hIMkhGL0dldTlE?=
 =?utf-8?B?KzRQZnYrOFd5Rmk5ZEJWcVhRblJjcUxEZDVodFJsNzRHZkJidzY2a1dTdS9D?=
 =?utf-8?B?YVFLRVZzUWhFZW5rMWkybzFVb3cwOVJQNUErNnBPWWdhVHZDMUVtL2sxcGFG?=
 =?utf-8?B?ZGpVRlJ4eVNDRWd5ZFBHcFdDTUtOeVhLaFFXd2pLVitOb3BYNmVHd1lpV1kx?=
 =?utf-8?B?U3lUclFQUHJqdVpERmhuTjE2MUx0QWlqeHcrVnlzenZ6S1RmWjF3azlKQXVE?=
 =?utf-8?B?U3U1S2Z4clZqWUw2enBtdmJOTHY3WXppL3RabFhXMlVCbnlYRmpYaXdEb2Fi?=
 =?utf-8?B?SUJ5TGIrVHhJR2tPcmhLWndTaS9vNTkyMmpSNy9mRTllWG14VXJFS21tWGhZ?=
 =?utf-8?B?Z0lWU2JJNXhGdG5zbGxHREQ0ZVBaem5lMVpWdzhYcm5EMEFBNnpTdk1uc3Mv?=
 =?utf-8?B?Wkd5M3g2bTg0TW4xVjA5VXlxQjhMT0lRSjFHNkRHSXdYTk01Ri8wNy9IWnlm?=
 =?utf-8?B?YWlLWGlNckRKQTk4NjhQbDdHWFpYbjdZWmlUYW9SVXQ3Y25ySzZ1Yjl2aWdq?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f601165a-b8e8-4430-c645-08dcab3dd11b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:35:17.1073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ISsghFgC6o4kKPVhtRvJj39m86hU3pwbgx0S6YR73lAa99XimrewAOkwG1/EP+p4Ua7yIcTSbUV46g/dAKbOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

On Mon, Jul 22, 2024 at 07:57:38AM +0200, Zbigniew Kempczyński wrote:
> On Fri, Jul 19, 2024 at 12:11:26PM -0700, Matthew Brost wrote:
> > Add sections which split compact 64k pages in 4k pages.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 128 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index a4f6c7a0b4..d507e7cb16 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -366,6 +366,128 @@ static void userptr_invalid(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > +/**
> > + * SUBTEST: compact-64k-pages
> > + * Description:
> > + *	Take corner cases related to compact and 64k pages
> > + * Functionality: bind
> > + * Test category: functionality test
> > + */
> > +static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
> > +{
> > +	size_t page_size = xe_get_default_alignment(fd);
> > +	uint64_t addr0 = 0x10000000ull, addr1;
> > +	uint32_t vm;
> > +	uint32_t bo0, bo1;
> > +	uint32_t exec_queue;
> > +	void *ptr0, *ptr1;
> > +	struct drm_xe_sync sync[2] = {
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	struct {
> > +		uint32_t batch[16];
> > +		uint64_t pad;
> > +		uint32_t data;
> > +	} *data = NULL;
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 2,
> > +		.syncs = to_user_pointer(sync),
> > +	};
> > +	int i, b;
> > +
> > +#define EIGHT_MB	0x800000
> > +#define SIXTY_FOUR_KB	0x10000
> 
> You may use SZ_8M and SZ_64K.
> 

Will do.

> > +
> > +	vm = xe_vm_create(fd, 0, 0);
> > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > +
> > +	bo0 = xe_bo_create(fd, vm, EIGHT_MB,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr0 = xe_bo_map(fd, bo0, EIGHT_MB);
> > +
> > +	bo1 = xe_bo_create(fd, vm, EIGHT_MB / 2,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr1 = xe_bo_map(fd, bo1, EIGHT_MB / 2);
> > +
> > +	sync[0].handle = syncobj_create(fd, 0);
> > +	if (page_size == 0x1000) {
> > +		/* Setup mapping to split a 64k PTE in cache */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SIXTY_FOUR_KB, 0, 0);
> > +
> > +		addr1 = addr0 + (SIXTY_FOUR_KB / 2);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SIXTY_FOUR_KB / 2,
> > +				 sync, 1);
> 
> Won't this bind assert as it's overlaps first addr0 (+SZ_64K)?
> 
> 

That's the point of this test. Create a mapping with a 64k page and then
issue another bind which splits it. At one point this would fail in the
KMD before this was merged [1]. This bug was exposed by mesa, hence I
created an IGT for more coverage.

[1] https://patchwork.freedesktop.org/series/130097/

> > +	} else if (page_size == SIXTY_FOUR_KB) {
> > +		addr0 += page_size;
> > +
> > +		/* Setup mapping to split compact 64k pages */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, EIGHT_MB, 0, 0);
> > +
> > +		addr1 = addr0 + (EIGHT_MB / 4);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, EIGHT_MB / 2,
> > +				 sync, 1);
> 
> Similar to the above.
> 

Here we are spliting 'compact 64k pages' in which only the lower 32 pte
entries (of 512) are used. The second bind makes the compact 64k not
available, thus a split which needs to be tested.

> > +	}
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	/* Verify 1st mapping working */
> > +	i = 0;
> > +	{
> > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > +		uint64_t batch_addr = addr0 + batch_offset;
> > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > +		uint64_t sdi_addr = addr0 + sdi_offset;
> > +		data = ptr0;
> > +
> > +		b = 0;
> > +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +		data[i].batch[b++] = sdi_addr;
> > +		data[i].batch[b++] = sdi_addr >> 32;
> > +		data[i].batch[b++] = 0xc0ffee;
> > +
> > +		sdi_addr = addr1 + sdi_offset;
> > +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +		data[i].batch[b++] = sdi_addr;
> > +		data[i].batch[b++] = sdi_addr >> 32;
> > +		data[i].batch[b++] = 0xc0ffee;
> > +
> > +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > +
> > +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +		sync[1].handle = syncobj_create(fd, 0);
> > +		exec.exec_queue_id = exec_queue;
> > +		exec.address = batch_addr;
> > +		xe_exec(fd, &exec);
> > +
> > +		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> > +					NULL));
> > +		igt_assert_eq(data[i].data, 0xc0ffee);
> > +		data = ptr1;
> > +		igt_assert_eq(data[i].data, 0xc0ffee);
> > +	}
> 
> May you introduce a function instead of adding block here?
>

Most other tests have a for loop here, I went with local block to match
that style of declaring the 4 variables here. I'd rather leave it as or
alternatively just declare the 4 variables at the top of this function
and drop the braces.

Matt
 
> --
> Zbigniew
> 
> > +
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	syncobj_reset(fd, &sync[0].handle, 1);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	xe_exec_queue_destroy(fd, exec_queue);
> > +	syncobj_destroy(fd, sync[0].handle);
> > +	syncobj_destroy(fd, sync[1].handle);
> > +	munmap(ptr0, EIGHT_MB);
> > +	munmap(ptr1, EIGHT_MB / 2);
> > +	gem_close(fd, bo0);
> > +	gem_close(fd, bo1);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> >  /**
> >   * SUBTEST: shared-%s-page
> >   * Description: Test shared arg[1] page
> > @@ -1973,6 +2095,12 @@ igt_main
> >  	igt_subtest("bind-flag-invalid")
> >  		bind_flag_invalid(fd);
> >  
> > +	igt_subtest("compact-64k-pages")
> > +		xe_for_each_engine(fd, hwe) {
> > +			compact_64k_pages(fd, hwe);
> > +			break;
> > +		}
> > +
> >  	igt_subtest("shared-pte-page")
> >  		xe_for_each_engine(fd, hwe)
> >  			shared_pte_page(fd, hwe, 4,
> > -- 
> > 2.34.1
> > 
