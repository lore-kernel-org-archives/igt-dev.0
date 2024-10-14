Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E6BCFC500
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 08:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938B10E3D2;
	Mon, 14 Oct 2024 08:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTs5mK46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B171110E004;
 Mon, 14 Oct 2024 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728895033; x=1760431033;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K4xyFtU9QQKlGw0FizZ+0Hqq9vNVHgvQfJAtq2jpr9c=;
 b=GTs5mK466ie9CSeP7uwYq3cSKgK1jpdZzrWHFnc19ofZSOkDWJD2mRZG
 9NOpSBftUcmPA8CrZt48KSknej+hppUb+76zpsM/D/yeJlXFMbugIfixt
 dKiDA/hO5XV1CFcuwijbov2KQPX4PoyjXTktjgBUDuVSnyYGzjwtE2yB5
 ILXGflXHnUUPGcAX2hmbgn0goVYeS3m9gbIURX2Aq92R8RV50QVUBnHHF
 Lbp505he3ORyr6jhcMCFVhiEP9UOEv2LntuVR8RvsZDaaSYJnJFrHw869
 gGng5Pxr6HkDQj2LSotUdi4ZyY7TglKya6+HaYG+j6l4w6ouP+e27SUmI Q==;
X-CSE-ConnectionGUID: Q/tDM6m5T8aJYAZoQF3sVA==
X-CSE-MsgGUID: HPXMsPEURTaDBKcGTgn7tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39629111"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39629111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:37:13 -0700
X-CSE-ConnectionGUID: glQuXxmoTSWyHPhTlv8pmg==
X-CSE-MsgGUID: q+234PAtQkuQtemjgBULUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="100842284"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 01:37:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:37:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:37:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HARDII2GIGlgYPnVej3YzPJhu3gZD5FtWB6XEL5xql1qm5Z2EyCsGE9AwzJsiPLggONfQH76PgVMl14uhj/IQHtd22/nD9KzUbOpWrWV7j9hd4MYUzF110tthrQT8fLCwe0DFZU1H34GUqWwcOZ5YgxMY2YvDa2RD/PJXg1M5ZoILFJYr6yJHyn6G6n28QROQj+j1Dh5ty504HB6bVVOUjvj7WK8YyQDUsn9+Cnub3WCq/olab++SeyHXDg2YAK52rxQPGJkiFnIXfao/iQNItmvUXv01sO/pFZq+I97Cn8lTu6QY/d4bS2Ex617Vv2Ta0f7vHjcXnmBx9FAn7Bciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul655yXsRLSplheBFPOm1UY2Ol+qJoHwsy0Z4dI/Src=;
 b=mh5CmX7FHGsa7GOYpKsEM3D/S3jUDjvpV0WhVLcUQpmlWJYZCwvME4JmfJFSCyLUt1LTNQDUqNkTVk/3nuo42w1trB9IZCAdZJT/9NhPRmxpJbyuaXlcKGK2WLOGP2chjUeTUyQYTy63irw+6eHLlMHlhUQnYmIZYQ3FGulvYUkNb7jX10F+2L3L0QlJlGKj8CH7ZtQ9SIBEcrw4rLhrsvv3R9+TCqnPqe/8GmQAk8dEey8TtHve1nkfkfMCT70e6609ck+gBTLdDWQRiCfX5kVnazTXMPFPaD5ZQF0o+q7mWjLvIlsucY7VyUBcgM8o0hc1iM0XHrVBVcUzfT7Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 08:37:01 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:37:01 +0000
Message-ID: <428d7e14-e24a-4a5a-b0fa-3588272e2be1@intel.com>
Date: Mon, 14 Oct 2024 10:36:57 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2V4?=
 =?UTF-8?Q?ec=5Fsip=3A_increase_timeout_margin_for_tests?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241011-xe_exec_sip_increase_timeout_margin-v1-1-7adc68a3fbed@intel.com>
 <172872632555.1243659.5340620894637504752@2413ebb6fbb6>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172872632555.1243659.5340620894637504752@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|LV2PR11MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: d71d0ebd-fdc6-41b3-f12d-08dcec2b5f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVNTOFRwc3ZPSWF0cEVpdEZDZzNoMzlKM3BjZEZxbDBxSCtYUDdkeGU3L1F5?=
 =?utf-8?B?S21idzBPdGN3R3ZObWl6VTJwRC85aVE5eTVzTFhqMkhaZmJxYUFQbDVkRmtw?=
 =?utf-8?B?dFIwSC9NTHByZXV1dmd1TVlGazIxZlFDYkpTeGw0czIrUUVKZHJpbDJDTkV6?=
 =?utf-8?B?SlljT1hVVzVUTExSbFlVY0c1WXF2a3JkWGNFREs1L2JPb0QrYUdqb3FMZUh5?=
 =?utf-8?B?YWhIRWU2NlcvU1dRUmw3Q1VVSjhsQ0NEODJDbzIzbHlzSnBVZWMzdEFsUDJx?=
 =?utf-8?B?MEZzclo4Ym1JZ2xxMEZnVUlZRmFyOVVsNmJ0d29GZGxLMTBQbmRPSndoTTA3?=
 =?utf-8?B?YXVHOHdyVHRycWhUTUhTRGdQb1U4cDFldFo4UVFzYTZxalBXOE5yaGtlUzc5?=
 =?utf-8?B?dW54NmhpcEVDV3VocGdNNUV6a0xnUFV1NVVyM0lSeEgwMEVqeGlwWlVRck9o?=
 =?utf-8?B?UlV5b1JadElTMVNNZzRNdG13c0pSVEtTR0F6UVZybjI4dUlTTGRiQzI1S0U2?=
 =?utf-8?B?TEd5alkyQWVQOUpDTE1YR0xtNjh2K1FnUXJxSkMvTlB1dWxDdERCUXl4Yits?=
 =?utf-8?B?TXh6eTdFVlVNRHdkdnQ4c3RKTHNicmhReGVPSUxzY0tXSnJJWS9LUGc0NmFk?=
 =?utf-8?B?RlhQUXRNNXZuZkRERzdScEJTb2o4MzRJTzVLbTFBWkJsKy90NXVLMkhmVVFN?=
 =?utf-8?B?U0hqc2VwNkRCYnRkaTRPK1JkMGlKdHFrbmR1TWkyOHoyaTlmS0FFTGFwRkM4?=
 =?utf-8?B?dW9Yd1VYdStIRWdzbnMySEVWSitWZVRzbTZVS3FZN1RTcVptdllGVjFHOXN6?=
 =?utf-8?B?K0M2cEVYSzFOYlNvOWJLeTFVaXE3dVlubGRzcHBjUStwKzBHUnJsRUFSVzRw?=
 =?utf-8?B?WGpFb2g0TjhlVXhxSXRNOFRIelI1MW1Kd2tPaEVWK3FsdnppSmdsNXFONC9y?=
 =?utf-8?B?V1dPbTVxTjdEN05IME9tZnc0ejJSbThhQVdDRVJJRnFzNE9EeWFJcDAybkFj?=
 =?utf-8?B?Tkt0dDd4SXVjWE9QczVwTVZzalg0Q1FLSzBGWDJLMHBQMkxFZTdjY3huZk1t?=
 =?utf-8?B?cjVvREVwempOWHZkNUxUbnBhaTdCZWdUcEhBdEFBNnNrRHVuRmhkdXF4WTNC?=
 =?utf-8?B?dWVZTXcvb2tydzhkd2NMNldEYWEwQVZGRFpXdmdQNE5jMjFkQlRBM2RFTi94?=
 =?utf-8?B?djJUc3pFN3AxeEhVMTRzWDY5eVBFR2N3bzFEeW9HT2s3dXR2MFN1NDR3YU5Z?=
 =?utf-8?B?R1BtNXdnSXhpUk1UOWFIQWR3cldFaUlSQmlhd1kyODRtTWRkeGVaSm9tZ0N0?=
 =?utf-8?B?K0ZYc0NFZ21zTCtOanpyT1lObTRCdkFpeGRnaEQrOVNhaDYxcXQvV3hqKzFq?=
 =?utf-8?B?alA3anhVQTE0eXFMN3EzR0o1cEhJdjFmb01ROEFNc1FIYk5mdGk2K012OXc3?=
 =?utf-8?B?MFFQY2FXV0J4NkdrelFHNlJJdkNVVU9QZnc3WWM5NytITmw1SUdlQmhuUDZQ?=
 =?utf-8?B?SVgzcGZXTEN0dFQweE8yYVhDakVmLzJZVlBWNzMvRitaRlpRSnBSZHpoVWhU?=
 =?utf-8?B?cFhEU1JzR044cFBJNVhOeDhtb2UxbUx3WVVFNmNaNXNvSjhqWEo5aVpOK1B1?=
 =?utf-8?Q?I07vBzz5PdrYEZarS+62DuNGv5koL/gnfTtDEnJrEMyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNJNEZqVXVmNHZ1Z3padUlxM2N3MkFRTXJXT1RoTlhDbU52Ylh3RkIxMG5a?=
 =?utf-8?B?RzF2MFYyZWV2Q2FNMjNrVmR4UHNpK05xKzFDa1NoSnZHenJ6VFhEOTkzdFFw?=
 =?utf-8?B?NUJWTUgwTXVvU21vYjJHa2tWYVRjYTgvKzMybTdMTzZyY3JxTXhBazdSM2VI?=
 =?utf-8?B?NHBibmFyd2RBMkRwd1UzZkM5Q01DaUVrMzBmV3FEdHh0ME5zN21DSlNaRlJx?=
 =?utf-8?B?V1BENktlZEkvRVZhaTZtdlNjWnBmS0gwWDJGU2grZkE5Q05RWG5ZWk1rN3J0?=
 =?utf-8?B?RVF6c3dtalZmQWF3N2M5eVUrdDgwWDhubWhPRVFIS1VINHdrY0QxNWI1YkJN?=
 =?utf-8?B?RWxVQ000bUd1N1I2Z3FjMnVpL2dDS3A5VEV2OHJ0Yy9WVnZPM1plUkRtZlNG?=
 =?utf-8?B?aUd1dGRqVGpNd3I4eUV4Q3c4WVpjb3kyOTVlTXBzQ3hNaGVLSlUwSUhFdW5p?=
 =?utf-8?B?cCtzaWl1aEQrYW1xZk9RakRDakFncXNiUUFtNGR4ODYrSk0wT3UyK20yS0Ns?=
 =?utf-8?B?a0dPb2RlQjhUdDVpRUVSKzBveUp4NVdpMDlZd3NWTUJYMEtab2pCVnFqNm5H?=
 =?utf-8?B?c3JTTUlnQW90K2lNQjUxdzlkY25aNU0xL1FabVMrOHllaHo3UjB5OE9uUkJl?=
 =?utf-8?B?U2VjSmZwaUw1T0FQOUZaVlFEQVJFMEVsbndRcGZGUmlnaEdQb2crYzhvN0Fj?=
 =?utf-8?B?bjVXR3ZFYys1eDA4S1Rma2hTQTlVK0tGQVVuRjJTZUFpVHoxSnJtVzh1RmpO?=
 =?utf-8?B?U2x6T3pOcUpkY09PL1g2V3ZpcFFwdGg0T2tZRzFoVVBWdDdUTlF6NzkxcVRG?=
 =?utf-8?B?YjIvaEZDSWpZcWNMZGkwQVB4NzlXNlhTa2w5SG5Ha1lBdkd2WVBTWWZNVHFl?=
 =?utf-8?B?TGhycVdOM3NOUEZPYlhVUWVEREFpV1UvUXVPTEdadnR3SDdVRXhUbjlvYXRJ?=
 =?utf-8?B?UytyV29kMThHeWlscnB2aU91MGVkb1BZcUJwQnZVMmt2MWVrdXVxMlkwYWZH?=
 =?utf-8?B?OEc0bGQ2ZFlTTzNjNDJldVpIWGdLVk9qcmw2c2lKcnVnNWVHZnlnL0k4a08y?=
 =?utf-8?B?c2w2ZFZ1dEdoK2VLaUdQcWk2QWdWWThqSHhUQ2FtdUhCb1dKNFNHT2oxUUZE?=
 =?utf-8?B?aG1teWlSajFTTUhFZyszSCtJVzJaTmdadyswNFZBQWtBS3pJQ29UcnNQRmpk?=
 =?utf-8?B?SkN3UWhkcFIxbS9VczFiclhyTHU1VE1rUy9QdTBTSUVFTWUwUmdod1JLRVpF?=
 =?utf-8?B?UEZwQnJNMCtkeTY2NjBUeEp2T3VvS1ZjV3hjRVlERFFiWDg0RDJYUURvaGpR?=
 =?utf-8?B?alhqNGhRQjBjd2w5VlM3b052bEtOa0RTZGZ1OUx1bUw1VzNNRmlqSUNaYjl1?=
 =?utf-8?B?VHJmZTVXU0duZ2lkaENDQUFmYVRJZDdsZEhGVVJYM1Z4NHplOGZNdUV5TWhL?=
 =?utf-8?B?SGR2Q0N4MW1vSDFaYUhiZklMWnY3QUhaUUxqUHV6Q0dxSjdYTHFYbDdhbGU2?=
 =?utf-8?B?MkdhWm15VHNjMDJKSFdnV3JtUkFoNVFmSytXakttcE1VbVIvbTZNUG1jRDNI?=
 =?utf-8?B?aDdMZXZId20xMVJ4MEgzYUU2S1FxOTgvaVNmQ0o2ZExLaDcyVXRETHloVmg3?=
 =?utf-8?B?WERndVFzZVc4dXZTRkNNWWhFTXZBMU0wZ3NRc3pxcTgrbnNUV0lUQkNtcUhZ?=
 =?utf-8?B?eTM4NWp5d1U0NWpVOG5lcHdVTUpxLyt3TWltMlBnZm1zZzBJNVU5K1JaeVEz?=
 =?utf-8?B?SkFnR0IxUVgzUnhTOEMrWDQrVW9Ka0JiVzNjK2pqMEtRY2xUdXVSdG5OSjdC?=
 =?utf-8?B?dFpTYW9zQU53SC8xZzRuQlZTZkhhNmVTUFowVWg0L1hlUWNNTXBIbmlleDFL?=
 =?utf-8?B?cVpZY0FROEFqMUNDQ2lyaXhZbnhpRVR3K2NJekwwajJxRkNDdGVyWGJYaXp0?=
 =?utf-8?B?S3BYc1BjTFJ1S2E2RmpzRXhQSUFNVUxzMVg3NUFxS1RhSk12cUlreTFsdDZa?=
 =?utf-8?B?bmhId3pEOEtYcmlWeXFOcEVGOFRab3dFOTN4SmtoMzdNZmM2ZFNPUVJIejBq?=
 =?utf-8?B?UzR1YlZCTWdNZFFJdnhySXZsUDM3aTZEZCtmSmVvcGVLS0xIbzY4QlNBWkxN?=
 =?utf-8?B?ZWRoT1FjN25JTG45S1BmY1dYV2l0NXVKcDVCczFNd1hCdDI5U3RUQUc5MnZ3?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71d0ebd-fdc6-41b3-f12d-08dcec2b5f54
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:37:01.1318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFldi3ldewCNvsdQinK4mFl+K1qUOmxtGpjXoB1x66hxq35/1ushvMZA8BoOzwUJvDnzU+Vy7yPtBPzn8Jf69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
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


W dniu 12.10.2024 o 11:45, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_exec_sip: increase timeout margin for tests
> *URL:* 	https://patchwork.freedesktop.org/series/139889/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15517_full -> IGTPW_11903_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11903_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11903_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/index.html
>
>
>     Participating hosts (8 -> 8)
>
> Additional (1): shard-glk-0
> Missing (1): shard-glk
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_11903_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@i915_selftest@perf:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb7/igt@i915_selftest@perf.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb6/igt@i915_selftest@perf.html>
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3.html>
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-rkl-3/igt@kms_plane@pixel-format.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_plane@pixel-format.html>
>         +1 other test abort
>  *
>
>     igt@kms_psr@psr-sprite-blt@edp-1:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@kms_psr@psr-sprite-blt@edp-1.html>
>         +1 other test fail
>  *
>
>     igt@kms_psr@psr2-dpms:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-7/igt@kms_psr@psr2-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_psr@psr2-dpms.html>
>         +1 other test fail
>
The change affects ONLY igt@xe_exec_sip@*. So all 'regressions' reported 
here seems incorrect.

Regards

Andrzej


>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11903_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-10/igt@device_reset@unbind-cold-reset-rebind.html>
>         ([i915#11078])
>  *
>
>     igt@drm_fdinfo@virtual-busy-idle-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html>
>         ([i915#8414])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@drm_fdinfo@virtual-busy-idle-all.html>
>         ([i915#8414]) +1 other test skip
>  *
>
>     igt@fbdev@unaligned-read:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-5/igt@fbdev@unaligned-read.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@fbdev@unaligned-read.html>
>         ([i915#2582])
>  *
>
>     igt@gem_busy@close-race:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-6/igt@gem_busy@close-race.html>
>         ([i915#12297])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         ([i915#9323])
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         ([i915#6335])
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12065])
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-5/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12031])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@hostile:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-rkl-3/igt@gem_ctx_persistence@hostile.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@gem_ctx_persistence@hostile.html>
>         ([i915#11980])
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-9/igt@gem_ctx_sseu@engines.html>
>         ([i915#280])
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-18/igt@gem_eio@reset-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@gem_eio@reset-stress.html>
>         ([i915#5784])
>  *
>
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_balancer@sliced:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-4/igt@gem_exec_balancer@sliced.html>
>         ([i915#4812])
>  *
>
>     igt@gem_exec_capture@capture:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@gem_exec_capture@capture.html>
>         ([i915#11965]) +1 other test fail
>  *
>
>     igt@gem_exec_capture@capture-invisible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +1 other test skip
>  *
>
>     igt@gem_exec_fair@basic-pace-share:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-2/igt@gem_exec_fair@basic-pace-share.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-9/igt@gem_exec_fair@basic-pace-share.html>
>         ([i915#2842]) +1 other test fail
>  *
>
>     igt@gem_exec_fair@basic-throttle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html>
>         ([i915#3539])
>  *
>
>     igt@gem_exec_flush@basic-uc-pro-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-4/igt@gem_exec_flush@basic-uc-pro-default.html>
>         ([i915#3539] / [i915#4852]) +1 other test skip
>  *
>
>     igt@gem_exec_flush@basic-uc-rw-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html>
>         ([i915#3539] / [i915#4852]) +3 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@gem_exec_reloc@basic-cpu-wc.html>
>         ([i915#3281]) +8 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         ([i915#3281]) +4 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         ([i915#3281]) +9 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-4/igt@gem_exec_reloc@basic-write-read.html>
>         ([i915#3281]) +2 other tests skip
>  *
>
>     igt@gem_exec_suspend@basic-s0@smem:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html>
>         ([i915#11441]) +1 other test incomplete
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@gem_lmem_evict@dontneed-evict-race.html>
>         ([i915#4613])
>  *
>
>     igt@gem_lmem_swapping@smem-oom:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@gem_lmem_swapping@smem-oom.html>
>         ([i915#4613]) +4 other tests skip
>  *
>
>     igt@gem_madvise@dontneed-before-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@gem_madvise@dontneed-before-pwrite.html>
>         ([i915#3282]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@gem_madvise@dontneed-before-pwrite.html>
>         ([i915#3282]) +1 other test skip
>  *
>
>     igt@gem_mmap@short-mmap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@gem_mmap@short-mmap.html>
>         ([i915#4083])
>  *
>
>     igt@gem_mmap_gtt@basic-small-bo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html>
>         ([i915#4077]) +7 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@gem_mmap_gtt@basic-wc.html>
>         ([i915#4077]) +5 other tests skip
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@gem_mmap_wc@copy.html>
>         ([i915#4083]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-6/igt@gem_mmap_wc@copy.html>
>         ([i915#4083])
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         ([i915#3282]) +4 other tests skip
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>         ([i915#4270])
>  *
>
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         ([i915#4270]) +4 other tests skip
>  *
>
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         ([i915#4270]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         ([i915#4270]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         ([i915#4270])
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html>
>         ([i915#5190] / [i915#8428]) +2 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         ([i915#8411]) +1 other test skip
>  *
>
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         ([i915#4079]) +1 other test skip
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@writes:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@gem_tiled_partial_pwrite_pread@writes.html>
>         ([i915#4077]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         ([i915#3297]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         ([i915#3297])
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>         ([i915#3297] / [i915#4880])
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-15/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>  *
>
>     igt@gen9_exec_parse@bb-chained:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html>
>         ([i915#2527]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@gen9_exec_parse@bb-chained.html>
>         ([i915#2527] / [i915#2856]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@unaligned-access:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html>
>         ([i915#2856]) +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@gen9_exec_parse@unaligned-access.html>
>         ([i915#2527]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@gen9_exec_parse@unaligned-access.html>
>         ([i915#2856]) +1 other test skip
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820])
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10887] / [i915#9820])
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10131] / [i915#10887] / [i915#9820])
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@i915_module_load@resize-bar.html>
>         ([i915#6412])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@i915_module_load@resize-bar.html>
>         ([i915#7178])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-9/igt@i915_module_load@resize-bar.html>
>         ([i915#6412])
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html>
>         ([i915#8399])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.html>
>         ([i915#8399])
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-15/igt@i915_pm_rps@basic-api.html>
>         ([i915#11681] / [i915#6621])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-1/igt@i915_pm_rps@basic-api.html>
>         ([i915#11681] / [i915#6621])
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb2/igt@i915_pm_rps@reset.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb6/igt@i915_pm_rps@reset.html>
>         ([i915#7790])
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-4/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>  *
>
>     igt@i915_selftest@perf@engine_cs:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb7/igt@i915_selftest@perf@engine_cs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb6/igt@i915_selftest@perf@engine_cs.html>
>         ([i915#11703])
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707])
>  *
>
>     igt@kms_addfb_basic@clobberred-modifier:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_addfb_basic@clobberred-modifier.html>
>         ([i915#4212]) +1 other test skip
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         ([i915#5286]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([i915#5286])
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         ([i915#3638])
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         ([i915#3638])
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>         ([i915#5190] / [i915#9197]) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html>
>         ([i915#4538] / [i915#5190]) +6 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         ([i915#4538]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>         +7 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html>
>         ([i915#6095]) +120 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-edp-1.html>
>         ([i915#6095]) +19 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html>
>         ([i915#10307] / [i915#6095]) +149 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +70 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1.html>
>         ([i915#6095]) +69 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html>
>         ([i915#3742])
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html>
>         ([i915#7213]) +3 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html>
>         ([i915#4087]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@kms_chamelium_edid@dp-edid-read.html>
>         ([i915#7828])
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         ([i915#7828]) +1 other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         ([i915#7828]) +4 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         ([i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>         ([i915#7828]) +5 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7118] / [i915#9424])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7116] / [i915#9424])
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         ([i915#3299]) +1 other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3299]) +1 other test skip
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@kms_content_protection@legacy.html>
>         ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_content_protection@lic-type-0.html>
>         ([i915#6944] / [i915#9424]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@kms_content_protection@lic-type-0.html>
>         ([i915#6944] / [i915#9424]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_content_protection@lic-type-0.html>
>         ([i915#9424]) +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9424])
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         ([i915#11453]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453])
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         ([i915#11453]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         ([i915#11453])
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         +4 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103] / [i915#4213]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4213])
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-3/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         ([i915#9197]) +32 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         ([i915#9809]) +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         ([i915#4103] / [i915#4213]) +1 other test skip
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723])
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-2/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-gtt.html>
>         ([i915#8812])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html>
>         ([i915#8812])
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp.html>
>         ([i915#9197]) +14 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html>
>         ([i915#3840])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html>
>         ([i915#3840] / [i915#9688])
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840]) +2 other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840]) +2 other tests skip
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html>
>         ([i915#2122]) +1 other test fail
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         +15 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         ([i915#9934]) +3 other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         ([i915#3637]) +6 other tests skip
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html>
>         ([i915#2122]) +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg1: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         ([i915#4839] / [i915#6113])
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:
>
>       o shard-dg1: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html>
>         ([i915#6113])
>  *
>
>     igt@kms_flip@flip-vs-wf_vblank-interruptible:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-19/igt@kms_flip@flip-vs-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@kms_flip@flip-vs-wf_vblank-interruptible.html>
>         ([i915#10826])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#8813]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         ([i915#3555] / [i915#5190])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         ([i915#3555]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         ([i915#5354]) +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         ([i915#1825]) +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-stridechange:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         ([i915#6880])
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#5439]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html>
>         ([i915#3023]) +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         +98 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html>
>         ([i915#3458]) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html>
>         ([i915#1825]) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html>
>         ([i915#5354]) +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html>
>         ([i915#3458]) +11 other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html>
>         ([i915#3555] / [i915#8228]) +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_hdr@static-toggle-dpms.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html>
>         ([i915#12388])
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         ([i915#10656])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         ([i915#10656])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         ([i915#10656])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         ([i915#10656])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339])
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4816])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4816])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4816])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839]) +1 other test skip
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@kms_panel_fitting@legacy.html>
>         ([i915#6301])
>  *
>
>     igt@kms_plane@plane-panning-top-left:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-4/igt@kms_plane@plane-panning-top-left.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html>
>         ([i915#8825])
>  *
>
>     igt@kms_plane_alpha_blend@coverage-7efc:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-3/igt@kms_plane_alpha_blend@coverage-7efc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-7efc.html>
>         ([i915#7294]) +1 other test skip
>  *
>
>     igt@kms_plane_lowres@tiling-4:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_plane_lowres@tiling-4.html>
>         ([i915#10226] / [i915#3555] / [i915#8821])
>  *
>
>     igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html>
>         ([i915#11614] / [i915#3582]) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         ([i915#5354] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#8292]) +1 other test fail
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-6/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#6953])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#6953] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>         ([i915#8292]) +1 other test fail
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html>
>         ([i915#12247] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html>
>         ([i915#12247]) +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html>
>         ([i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html>
>         ([i915#12247]) +9 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html>
>         +43 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] /
>         [i915#9423])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#3555] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html>
>         ([i915#12247] / [i915#8152]) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html>
>         ([i915#12247]) +7 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html>
>         ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html>
>         ([i915#12247]) +30 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html>
>         ([i915#8152]) +1 other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#3828])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#9340])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#3828])
>  *
>
>     igt@kms_pm_rpm@drm-resources-equal:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_pm_rpm@drm-resources-equal.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_pm_rpm@drm-resources-equal.html>
>         ([i915#3547])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_prime@d3hot:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-7/igt@kms_prime@d3hot.html>
>         ([i915#6524])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-8/igt@kms_prime@d3hot.html>
>         ([i915#6524]) +1 other test skip
>  *
>
>     igt@kms_properties@crtc-properties-legacy:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-8/igt@kms_properties@crtc-properties-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_properties@crtc-properties-legacy.html>
>         ([i915#11521]) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html>
>         ([i915#11520]) +12 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html>
>         ([i915#11520]) +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>         ([i915#12316]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         ([i915#11520]) +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         ([i915#11520]) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         ([i915#11520]) +7 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_psr@fbc-psr-primary-render.html>
>         ([i915#1072] / [i915#9732]) +17 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-9/igt@kms_psr@fbc-psr2-no-drrs.html>
>         ([i915#9732]) +22 other tests skip
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-7/igt@kms_psr@pr-no-drrs.html>
>         ([i915#9688]) +7 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         ([i915#1072] / [i915#9732]) +10 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.html>
>         ([i915#1072] / [i915#9732]) +20 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         ([i915#9685]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@exhaust-fences:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html>
>         ([i915#4884])
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         ([i915#5289])
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         ([i915#5190])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#11131] / [i915#5190])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#5289]) +2 other tests skip
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb5/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb2/igt@kms_setmode@basic.html>
>         ([i915#5465]) +2 other tests fail
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_setmode@clone-exclusive-crtc.html>
>         ([i915#3555]) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-7/igt@kms_setmode@clone-exclusive-crtc.html>
>         ([i915#3555]) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_setmode@clone-exclusive-crtc.html>
>         ([i915#3555] / [i915#8809])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#8623])
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_vrr@flip-basic-fastset.html>
>         ([i915#9906]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@kms_vrr@negative-basic.html>
>         ([i915#3555] / [i915#9906])
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437] / [i915#9412])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-17/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437] / [i915#9412])
>  *
>
>     igt@perf@blocking@0-rcs0:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-2/igt@perf@blocking@0-rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@perf@blocking@0-rcs0.html>
>         ([i915#10538]) +1 other test fail
>  *
>
>     igt@perf_pmu@cpu-hotplug:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@perf_pmu@cpu-hotplug.html>
>         ([i915#8850])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@perf_pmu@cpu-hotplug.html>
>         ([i915#8850])
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@perf_pmu@module-unload.html>
>         ([i915#11823])
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@prime_vgem@basic-fence-read.html>
>         ([i915#3708])
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@prime_vgem@basic-write.html>
>         ([i915#3291] / [i915#3708]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-7/igt@prime_vgem@basic-write.html>
>         ([i915#3291] / [i915#3708]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@prime_vgem@basic-write.html>
>         ([i915#3708]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@prime_vgem@basic-write.html>
>         ([i915#10216] / [i915#3708])
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@prime_vgem@coherency-gtt.html>
>         ([i915#3708] / [i915#4077])
>  *
>
>     igt@tools_test@sysfs_l3_parity:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html>
>         +12 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html>
>         ([i915#4818])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html>
>         ([i915#4818])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html>
>         ([i915#4818])
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@gem_ccs@suspend-resume.html>
>         ([i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@gem_ccs@suspend-resume.html>
>  *
>
>     igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0.html>
>         ([i915#12392] / [i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-8/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0.html>
>  *
>
>     igt@gem_ctx_isolation@preservation-s3:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3.html>
>         ([i915#12353]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3.html>
>         +1 other test pass
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@gem_eio@kms.html>
>         ([i915#5784]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@gem_eio@kms.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-16/igt@gem_eio@unwedge-stress.html>
>         ([i915#5784]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-6/igt@gem_exec_big@single.html>
>         ([i915#11713]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-4/igt@gem_exec_big@single.html>
>  *
>
>     igt@gem_exec_fair@basic-pace:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-rkl-4/igt@gem_exec_fair@basic-pace.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-6/igt@gem_exec_fair@basic-pace.html>
>         +3 other tests pass
>  *
>
>     igt@gem_exec_suspend@basic-s0@smem:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-6/igt@gem_exec_suspend@basic-s0@smem.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-6/igt@gem_exec_suspend@basic-s0@smem.html>
>         +1 other test pass
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-18/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         ([i915#4423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-1/igt@i915_selftest@live@workarounds.html>
>         ([i915#12216]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-5/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html>
>         ([i915#9197]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html>
>         +19 other tests pass
>  *
>
>     igt@kms_cursor_legacy@single-move:
>
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-19/igt@kms_cursor_legacy@single-move.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-18/igt@kms_cursor_legacy@single-move.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html>
>         ([i915#11989]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-2/igt@kms_flip@flip-vs-suspend.html>
>         ([i915#6113]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_flip@flip-vs-suspend.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-tglu-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-tglu-5/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>         ([i915#6880]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         ([i915#5354]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         +3 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-4/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>  *
>
>     igt@kms_plane_scaling@invalid-num-scalers:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html>
>         ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_plane_scaling@invalid-num-scalers.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         ([i915#3555] / [i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html>
>         ([i915#12247] / [i915#8152]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         ([i915#6953] / [i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html>
>         ([i915#12247]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html>
>         +5 other tests pass
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         +3 other tests pass
>  *
>
>     igt@perf_pmu@all-busy-idle-check-all:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html>
>         ([i915#11943]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html>
>
>
>         Warnings
>
>  *
>
>     igt@gem_madvise@dontneed-before-pwrite:
>
>       o shard-mtlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-mtlp-8/igt@gem_madvise@dontneed-before-pwrite.html>
>         ([i915#2295]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-mtlp-2/igt@gem_madvise@dontneed-before-pwrite.html>
>         ([i915#3282])
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-5/igt@kms_async_flips@invalid-async-flip.html>
>         ([i915#6228]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html>
>         ([i915#9197])
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         ([i915#4538] / [i915#5286]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         ([i915#4423] / [i915#4538] / [i915#5286])
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         ([i915#9197]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         ([i915#5190] / [i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         ([i915#4538] / [i915#5190]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         ([i915#4538] / [i915#5190]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         ([i915#5190] / [i915#9197]) +6 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html>
>         ([i915#10307] / [i915#6095]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html>
>         ([i915#9197]) +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html>
>         ([i915#11616] / [i915#7213]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         ([i915#9197])
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_content_protection@atomic.html>
>         ([i915#7118] / [i915#9424]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_content_protection@atomic.html>
>         ([i915#9197])
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-3/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9424]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9197])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-17/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg1-13/igt@kms_content_protection@mei-interface.html>
>         ([i915#9433])
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         ([i915#11453]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         ([i915#9197]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_cursor_crc@cursor-random-32x10.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-10/igt@kms_cursor_crc@cursor-random-32x10.html>
>         ([i915#3555]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         ([i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         ([i915#9197]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103] / [i915#4213])
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         ([i915#5354])
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103] / [i915#4213]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#9197]) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#9197]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         ([i915#3555] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         ([i915#3555]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555])
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         ([i915#8708]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         ([i915#5354]) +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         ([i915#10055]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         ([i915#5354])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         ([i915#3458]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         ([i915#10433] / [i915#3458]) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html>
>         ([i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         ([i915#4342] / [i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-11/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         ([i915#9766])
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         ([i915#10433] / [i915#3458]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         ([i915#3458]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html>
>         ([i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html>
>         ([i915#3458]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         ([i915#3458]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11903/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         ([i915#5354]) +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15517/shard-dg1-18/igt@kms_frontbuffer>
>         ([i915#4423]) -> [SKIP][453]
>
