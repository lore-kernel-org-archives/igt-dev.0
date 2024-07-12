Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6412BC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 04:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5C10EBEB;
	Fri, 12 Jul 2024 04:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+ktYLfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB44910EB22
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 04:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720759970; x=1752295970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ok9gEx8rW4cV9Sir0RBEsmvAAXizwyUxABqOteMuwYU=;
 b=P+ktYLfXzovru4t8CENsq3nQ820UsigFaWeFQ54cgfOFiJ+a2XcABxgU
 I9uWfpNYoKsfe321C3oj9sJyLrCy1sSxBZ3DPmeH2RSiPr7M5gmnS/jmX
 Q0um02+YmfGJyzsHWcbGINvC8yhq/4dI5vOPpWNRsl4nRaUqj5RXQ7reP
 Cofhe1pOJtVLLYRUnwSoRBIMAuHZL8aKBQBAUyovhPJnLfJjJXJ/VHKXF
 dkj+qqmaqUfHeq9g3TS7TwgI39Df3M80/XVA13vLis0bgcoZjWYv9sp9B
 eeOP0SQDq7+Tl+U5DaXTCgH4nuvmUQ01AdmzRVFQHSHSA2aq+lT5bhLV9 g==;
X-CSE-ConnectionGUID: cX5psNtvSuKWqH6MGaY63Q==
X-CSE-MsgGUID: NsirX4KwT2mImHQ6Ckipyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18338207"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18338207"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 21:52:49 -0700
X-CSE-ConnectionGUID: IIxHyPexQTOBnNgtz7phvw==
X-CSE-MsgGUID: cZv4OidcR6iiCo2h3tEjiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48682076"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 21:52:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:52:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:52:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 21:52:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 21:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICeY/04Eax4gUTmzEJgP6sXBs1loGZtyocWAD2o74ol+Ct14PcfMbs2wbNMEQyKE3ybsaeLggVOTWjPw10nhmEN5W2l3ajrQKnEO0VYFdBoEkubC60PiZvc6rwYs07nM7n80yRRBQIXnn6T9n6lfAmMu0H/E5jJUNd00VD0W1PnkUIuhHl4mzooBPfLJma91j2+yOnvLIX+TswVVmlsmpIiJTwPITTDEZf00+6fkffJwqdl0AUMfu50cIeQaZovlHwoLDdI6ri0X5psN/dvCM3tUhG7ecKJoRIDjRQN3ixSZJM3bfF6M1bcMKbRq2Gko3utaS5O++h5uXY9E8f7VyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Iq1JtS1xJE4WrmuobuqwdRsR+zsr8HqIZP+Z1qVPjQ=;
 b=lozDb1IdTG+GrlOsjKERnTXP5o6bYHER0mCYAUAMoamH14u+kvzeisJRKYT7ZBx2ynaenDibAWBD49tHOKhI2Duq6XBUrVYgHUYC2WQy/i6b+TabIMEixNhZ/Oh+Zf0JJNOzpys8n3DvUO9Ay1vuUTEvrN7tg6T7jRBCAm2bk2YJNalLEmtJPg94X5wgrRWlbodAGDei+ktn7s5Ounvmp3C4//Sb+X9plS5guP85hzYUGw008lep9lNa4ifOAHp2fS+bulbA0aXW+vV0r6+MbZdoYQaFUcOEfiK3igHnNxz5WUQbOKLXIf2QC9btvuj/4jK5jqaLazSSN87teZ+zNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Fri, 12 Jul 2024 04:52:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 04:52:38 +0000
Message-ID: <586ecd9f-0010-4c0a-927d-082b4b149017@intel.com>
Date: Fri, 12 Jul 2024 10:22:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_getfb: Skip getfb2-accept-ccs subtest
 on Xe2 platforms
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20240705044515.700219-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240705044515.700219-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: aec53e54-b338-451c-67f0-08dca22e743a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1I3UW5UZHJob0pFRS85Z3dBU2dvaHo2UWU0YXhmZnd6Si9xNE56R2h4TzFM?=
 =?utf-8?B?RWlpRlFCblNBZmpxZ0ZjZkhtTjJyWi9RRTNRcWtycGdNdUM2R3J2bzF6YUVW?=
 =?utf-8?B?Qm0wUi91ZVN2d2pMTFMwSFFRenV2Q1R1MmhCRFZBdkkraFN0eUlVK0V1aU5R?=
 =?utf-8?B?NkxuZ0dVUGlPdWkwV0IyS1JNcEZYRXArWXFCQkg1M0o5RC9jalpOV3ZYZ2dB?=
 =?utf-8?B?WXVoYWVjbndsMjlNRHNUREZGcWVEckIyQXA1ZlYzVW5UaHJPT1NWVGxId1hh?=
 =?utf-8?B?U3oxb09vaW4zbkZPSXcyT3YwUkYvMTR2eWlRekR2VVY0a0VEWEphYldRcEN3?=
 =?utf-8?B?YjZIcEZldklwcitlN1VmYjloVUYyTDVkMGJqMCthR1hMZnJ6RU1aZzhvRTd5?=
 =?utf-8?B?dFBMTkNJUGl2dUY5S21hL1pHb3dXa3NYaGdIV0QwQ0h3VUdUREhuUTEwY1RT?=
 =?utf-8?B?dFFRM1lvcG1HQnVUTE9pSXl5ZGNPZlZWVnNITWVjOVRnUythVXBPQU5DRHgz?=
 =?utf-8?B?czRrcDZqeXFkRGtvWStaTHdFOXNoV0c1b3VQZDhXZDJWaDZkQWF2QkRoVUZm?=
 =?utf-8?B?UlpDd3JPaTFHSHFtVXJuSWVBTFkrbEI0anpCTFJNMWVNVm00dUtZOXNxYjM2?=
 =?utf-8?B?UWNJYkVRbjhoR0hOWllLT0NldEZFYlpwaHBsdlROc2hUcUdxWUkzRzNveFZt?=
 =?utf-8?B?cmFRQzVvdm5aa25rRzM3VmlmQ2xHYWJvL3p4a01iTStYMURYQTJ6SGtsU3pk?=
 =?utf-8?B?YnNpQzViM3dVOXFvOWVmdXZZY2Rrb1VlS1lBTTAzSlVMN3dBR1lYeFlNcnZR?=
 =?utf-8?B?YStpQWxBa3Q1aVMranAvRDZtYVV3bnREdnVYdWNDaElNdk83YkZsL24wRkFB?=
 =?utf-8?B?UVpjbmt1Y2NWdXV1NTIzcmFKNGVyYVAycUJOQjBtYVpJNFhqWVlHZmFOcjd4?=
 =?utf-8?B?M2M2cEtnMGNHcEJaN2pmVFk1L2QxM2NtNUZOelVNSHdteHdXQml1d0dRMnNl?=
 =?utf-8?B?R2tMOFNtMEJuV1d5YjdiRmpLZGs5YUUvQXRqNXJ6d051Q3BIak40Z0dQVFBB?=
 =?utf-8?B?VXFvTzdFSTdmZUozNHBVY0syZ0NUNmpVemJkemNaeENhMGFCanVvKzhWNHh3?=
 =?utf-8?B?SXhxREdvS0Z5TnpSaUdaV0VlcVl1SkFBaWVYVUlzK1BMdlk2UEtOaEd1dXd1?=
 =?utf-8?B?THRtMzhld0hCM2Jod2x6Y01JQVBnY2ZtelBpMFU0Y1B0KzZkelhYWnBsaVlq?=
 =?utf-8?B?MCtmQ3N2MjJJUWVjM0ZTRDhBY0Y1Sk9FSnp6UURhL3pUSmxiUHdJbGEwdlM0?=
 =?utf-8?B?anJQMVhUc3UyZTVXaHdqazZ0ZGFWNzU2LzZwVkJSYnV0VmVpNDBURXVxWTN3?=
 =?utf-8?B?cmZRZmVlc0lsVzRSM1h1OVpiR0szZ0srTnhXQmFYekZTRTRkdnRZeFM4OGVi?=
 =?utf-8?B?a2gzTWliWjBMSU0rMDl6bTVPVE8zSHdGOTdVZWZxN0J4QTB2dXlCOVo1NEYr?=
 =?utf-8?B?c3lpd0FLZlQzWEtPeUkvWGFmTGcwM25jUFphdmpCdGlvZ0ZjUFRFQ2ZJYVRB?=
 =?utf-8?B?MEUrWWpDNlNLVU15bnhDSUthYktwMG90M0lvNS9pUnZyUEFFcGVRbVQ4VmNE?=
 =?utf-8?B?aUZRVEhTbldManpBVTN3T1dYUjJKNHd2MUlvNlhnYWx5VDZPQnJURExhWTVt?=
 =?utf-8?B?bGVOaGxndWNLaUEyNG5SY1pDOUxCbURQdUpuZjZMQmNjVGhHajh2MUY4Mk5w?=
 =?utf-8?B?MFZFc2psaE5nUnhxM2FvU0tWTjZIdm9NNGx4T2lYeC9LdnBucTVPSkVOamhF?=
 =?utf-8?B?SUFXaDQ4N3RGVHlZMzk2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mms4OFAxcUVxTzJqdzlOekozdDU3dXZvbXRCNkNyeHlZTjlvL2NydXowNktv?=
 =?utf-8?B?endwRlJzSUROZXUwNG9aUTFzcHRoUFhvbzRaTjBnNHpMZlpMSW9vNVNNSHg0?=
 =?utf-8?B?c2ZKZkt6N01kcVBOYm5CaCt4RVhzdWtkU2VhR3A1STE1dHV3RlNWMGgyb3ZF?=
 =?utf-8?B?bkIyYXNBQWt6WnRiMENsc2F2bzVUWStKQnZrdnJMQVFJcUhGK3Z6SUVrenRl?=
 =?utf-8?B?UFAzaXArMk1HVUJ1KzJKazJ1bkRiMGRMZWZKbXZmMXF2Y3NxV2wxRFpFZXFF?=
 =?utf-8?B?WWFMY1Z3bHBOT1lRcXoyUjE5T3BZckVYMjhveG9CVjNiMlpHZTFQQkoyRzJG?=
 =?utf-8?B?TVZHalFaR3VlQko2Z2xZcXpMOVdUeHBZZWxUNGFOTnhuQ0ppZjFqaGhBTTVK?=
 =?utf-8?B?aEM5SW8zbjRqUWduVDkyYkgrS3I3OGQwWnhNNlZvcWt1RzhGK0NtbFp2WEdQ?=
 =?utf-8?B?TEtTU1JJSjA2YUxkSXdGTW9ERllhellERHVpbk9PM0VSZzJGUnFYNFk4TmtJ?=
 =?utf-8?B?QVZxaVVKb3VrQWlRLzNLYlgyN1crdkhSUWpXU2VwTmE3bzFlME1DajdCOWRS?=
 =?utf-8?B?Z3RZSWJCTlcycU9EZ2hwZkV4UVJNeTYwMWt6MWQzbzB5eDJCdkE0NGNJVW9D?=
 =?utf-8?B?aFMzaDlwU1RDUW9SK2pCNWtRK0RYYjdJWVgrYlAxak9STDRBM2JFM0I3T1l6?=
 =?utf-8?B?b2NQUUdralZualVmcHY4Z25vTksyZVFSbW9VNFVTOVIvM0ZBRDRPVGFWRmh3?=
 =?utf-8?B?WHY1SEFhTk9Ed0xkNEJjSVFQWEdsZDl3N3FvQWtPbWJVbkRrTHFoaE9uYkhx?=
 =?utf-8?B?bkhXT1lpRmpTckx0SWhWNFdZZWwxTlMvT21kb0FxRDMycHZmWmd2NzI5eFJB?=
 =?utf-8?B?MFZGa2RtRDE0b0ZCNlZKcEZGQ3NtL3liRldtVGQ1cGJCOTNDOXRXV2EyNkRj?=
 =?utf-8?B?TVVtVkNJN3NpRVdrOWFjeDl1TXA0NndhU3QzTVBleGV2dVRzcHR4Mi95c0dB?=
 =?utf-8?B?Wm91Y2wyYVQ5anR5WEVZVEg1SjFSNU11aWlrTjdjVGJnSGtkU09kMUJnaVp4?=
 =?utf-8?B?UllZaTlTYk5vQTJ1SXlxNlNVaW95emprRWgreGFSUG1uUW5Za2dpMDZ1T3hQ?=
 =?utf-8?B?d0VMVXFPdmJYT3paUjN4bUVZVkZucVZzWDJ6b0taOEg4b0k3Sk44eEZuVW9I?=
 =?utf-8?B?cWNEMUlJeUhlZHExQjBQOTJHQlY3dkM1T3g0UEpZbTBqNUpLMEFDS0RncmpN?=
 =?utf-8?B?ZFhPRG1tdzVIZ2JDSTJJRHBUUEV4dDFOMG50S1hzN3hpNjhHc3dzUzR4aHBG?=
 =?utf-8?B?N1VWWmlkNmxxczRFV3JxYXZxWHVLQ0ZJdWRPNzJVOXI3eWVuSEFReUNzRGFP?=
 =?utf-8?B?OXhhS25Ec3Q2NThFT3o0NUlzMzhadlhna3ZRV0xLOUxFUGNObHdxTXB4ZkpZ?=
 =?utf-8?B?R1llU0ttaXlDTXUybUhxVmVHRTliVVBlYjFXUE16SWhTRk4yRnYxTEtYZXVj?=
 =?utf-8?B?V3JXQXZsN2FxaEdsT0VPZDI1STJQSG45c2ltUnNlN1RzYllXYWY5bmhIdkc4?=
 =?utf-8?B?WTlxZjBKWjhJdlZ3bDgrY1RJdDhzZk5xbXFUeitvS1hMMmxwOGZsRGRBRDBG?=
 =?utf-8?B?VWN1UFRlRVJwTUZidGhpczgwYWVIOFZuV3RiTmM4d2FpcnhILzhtYUVnR09J?=
 =?utf-8?B?ODNyc0RSNGpNNVlUYm9ZNUVYRDVaa2dHOGxPNXJycG4xd2h1UUE0U1FTQ3RB?=
 =?utf-8?B?VkhJVjVBQXI1N2Y1VEdpU2dKd1JNWDMxdXRDNmk1dHNhTC9iQnpQUkJWYm5S?=
 =?utf-8?B?SWZyd2dsQjdSaEdjU200MmJDNmFZS09tKzRiM0ozZ3UwdHhZVW9CVkZhWmJs?=
 =?utf-8?B?R1pCMXB0LzFrdm1kbUJ6cjRGZ3VMQjZGaHRucm8waDdieEdoa2pCRUVjUEc0?=
 =?utf-8?B?Ukk4VndDWUJubWR3WTY4OVVOa002bFhyWjBhOG9qTUlpY2daREE0RCt2OGhP?=
 =?utf-8?B?R3ZyQ0NYQnN4cnRWbFkwb3ZYU3U4NzZkaHU2TmFZSVBGeGF4NEJzYStocEFi?=
 =?utf-8?B?V3BaY0RzSXZuSkFMdUxvZ2Q1SlNvNFZRRDJzbXdsMVpZbFN1dmM4bTArOGlY?=
 =?utf-8?Q?Ehz/IwXeScdy1niSw5Q8Sc/LX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aec53e54-b338-451c-67f0-08dca22e743a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 04:52:38.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOuYYV9qzpKsd9dcFbBLlDPPGlAEXo9bAkK31/t70h2ATQkScePbCMcnJCvTg8aqzWkQbw9/HOd5PwUfLjwrZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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


On 7/5/2024 10:15 AM, Pranay Samala wrote:
> The getfb2-accept-ccs subtest tests on ccs modifiers.
> With Xe2 platforms we no more have the ccs modifiers.
>
> Adding a check to verify the platform. If it is
> Xe2 platform then test will skip, otherwise it
> will execute further.
>
> v2: modified the check as
>      intel_graphics_ver(devid) < IP_VER(20, 0) (Juha-pekka)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_getfb.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index bb9679bc9..9cc783776 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>   	igt_require(has_addfb2_iface(fd));
>   	devid = intel_get_drm_devid(fd);
>   
> +	igt_require_f(intel_graphics_ver(devid) < IP_VER(20, 0),
> +		      "No ccs modifiers on Xe2\n");
> +
>   	if (HAS_FLATCCS(devid)) {
>   		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>   		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
