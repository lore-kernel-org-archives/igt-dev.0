Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADE3E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 10:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36F10E8E2;
	Wed, 11 Dec 2024 10:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPCtGfgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B0510E3D6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733914546; x=1765450546;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EEuQb5J5K/9h9itDHSEyvvE0d1RoktBisNHxUwXQ5CM=;
 b=JPCtGfgrbm96EwxrHj2/FGc1eaL1aQwg2vLrNBwwqGtg6kKQs8mQQPvz
 bfI5Hoe8zZ47dSFZjIo78472bnB1JNSfmFAjX50hoBxmw2aP10MkKKNBZ
 31/fGD7dX8RhnZm0kQhEDioIayloP1Y3FbfXaRaTK/lLo5LeNXP8zrNK0
 plem+qM1DH0KCOtm0ObxUAQ57XMY7pogRR8BwFi8xE+Qx7J2IqqVFcp+w
 D9kouFWZE1VjGHUWiBZ0k4qkmSsJ3t4DAukRR64I4YLkwviGNz6HazKin
 RKvxICEMWX4PdcjZYx4OSZ4zbunqXRuylLuGBCMxYf+iw2S7wFqhWRCkV Q==;
X-CSE-ConnectionGUID: UjdhvpQoSaelUYCIQM8qxw==
X-CSE-MsgGUID: +gdF1KRaQrWSs5z0KPWTqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34212330"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34212330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 02:55:45 -0800
X-CSE-ConnectionGUID: Z7QFd1UgRw24cJpqulXQbA==
X-CSE-MsgGUID: xh1k13BcRTS2e/SiDcESOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="96120216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 02:55:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 02:55:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 02:55:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 02:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4v/5IG2aysWBtWnsvYBdfHt9/p4Y+Y3j7ODEpdSy6XIpArePA9DbXvqFPZVnG99BZRMD1JFU6f2DndnVWKJkyogsJXL7lr9PcgraDoYnGJh076zC3nMRhGm7/SdUvOe6fQihmlxMsOOIa9Y+yVpOaYeZKeBualIXTWIgTn3pYtpQh14iufqmpz7R14mRebs70iratgho4e4l+pVr2t3l9/snpi1Sz9RYwiU3ywLQOvF1T57gzdNOyGllbQG2lLcXiHG40E4PyLKd1hgqg50+De0ykLMbVyvqJRSHwBNw0mQ9TR7eCoHFJF61MaaXlkSZCUKl8ZgZYPpU4NpeK/DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd838EXHE+CybZTzoVkZJnq15TKqWcn5jHth8jemNY8=;
 b=rS+KqsNBDHVBSptduCix6KtLGbLH94P6NqETq04bH0ojA1yJeZ3YRyUaae5ozk2crANK6l2YoCFvzUScZGYHdWJIcgJY7SVNF0u3UvPI7ftiTtEiks2Rd8BOJcd5gqbSgI2xxMdF1Ex0sD0uXyLXJYFJ7F0DZnsFSuk7Tm13i/nb+btBQ0Wcm4vbXlGSOKMr/s5R+jAkDlMwVQ9s96egjsjOmFU7MQPsk+cD0pr6Mt5uI4ZwwVVGtkFQsjNT+C3x/NyJTHa82Zc2hcIAhPNEHgRoHvoGBGH0qocwC1sZT7CMii+Z9YGSnCGpAFh3Ewi9uc32qT1vlXLHT+KWOlitBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 10:55:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 10:55:41 +0000
Message-ID: <92272ceb-b304-4b3b-b403-0bc58cd760ab@intel.com>
Date: Wed, 11 Dec 2024 16:25:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/9] tests/kms_sharpness_filter: Add invalid subtests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-9-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-9-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a1bd56-09bb-471b-b327-08dd19d25a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk9EcGpDaEZPTkpJOUZpMGplMWZJL21NZTFvTHA2T3FaK1NEZU9sMG5XUkNk?=
 =?utf-8?B?Z1ZZV1ZjTklHMXFxWW1abE9ISmdXeklKbmM3djFLTTNOQWcvNW1CSHMvaTAv?=
 =?utf-8?B?NUJFbkpUKzVGdm9KRm8yNWlxV0lvN1pSQ1RtUDJUdmgvS200ZmZLNEtwbWlC?=
 =?utf-8?B?Nm5ROXUzaUZVOC9VVDEvcWRzbUlFUWJ0SlZ1VHZxa0NOMHdqUlVZR0NibHRS?=
 =?utf-8?B?VEE4YnZBNEtnZlVONUQ1cmRqVUVqZ3g0QkpxLzNoUHYrdnRtazNNZzd1cVdK?=
 =?utf-8?B?SSs3QzUxQ1VhakJaZ2lFdUFlWS8wZUpJcnBvemMwOXVmMkxZbWpwc1ZIdEkz?=
 =?utf-8?B?K080aDdnY2lCN3p2Qk04T1ppTnZQMFBTOHVNajJSei9VNEN0T1hnR2VxMEIr?=
 =?utf-8?B?WXBDUlp4VUY4aHhubDllZlZBYUVoeFRxdW9LVzgzaFNjYjh5TE5rLzd4eDJG?=
 =?utf-8?B?ckhpWlMxaDBjenp1dXhpNkc3aFY4dEVMbHgzSWdwU0dPbFZ6Y0lYTmpQVWUx?=
 =?utf-8?B?ZGVJVFd4Tk1QWXdSa0hWaFU0M0VSMkplemViRXZKNUwvckRjcnJwQlNuUHdQ?=
 =?utf-8?B?S1JLYW1veW04dEt6NlloYVdnemozakd1RWUzK3NZb1JaS2loalZjR01tU1VX?=
 =?utf-8?B?aDdLUDkwR3RDcWgxeU1rSmx2TGtiaHIzMk9kcXpia0JhSlRPcHVpUnpMQ2FZ?=
 =?utf-8?B?cHFIK2EvQ0l2NWxkNUhmNTdVZHN2Wm9aNHJ1aXRUbkhMNmlQMCtxU1grS2la?=
 =?utf-8?B?VTRqZTZHTW9FdjFiVktBV0Nhd1craHRwT3JpOHVNd1hmS3ZNTDhZTWFZWmxq?=
 =?utf-8?B?S3pRQXhxb1g1R3pQWGQ2eE1aUlppWUNaOGNaV2R1T0JZWXBOOXc5ZUxOR0Fk?=
 =?utf-8?B?eWFwb2dYS3Z0dllPSS9ySnZST0wveVhWT0ZsUXdCNUp4WWgxVE5GY20rSGIz?=
 =?utf-8?B?NDNOWHlNWW85cnF5MDlRcDdvSytMbk9iOTBCL3Qxem1ZUjZIb3JDTTRZcVdi?=
 =?utf-8?B?cGtFTHBDTHhFNG5KWWNEMXVYUVZPaVpZaDBwaktYVDZ0MWV6dmxFczlqcUM4?=
 =?utf-8?B?WVVWVWlWV0o0ZmtBNTdkaWVYK25YaDBkZmJoNkpRTmEzZlFlV2NLakQ3cytR?=
 =?utf-8?B?TnZtcTFHN2VHd3MzS2VxYXR5Q3lBRTFqMmZUS1Z1ajNxTExJa0dYclpDMlEw?=
 =?utf-8?B?VUVoamRIRDg3eVJjZERKY1kyQkVad2Z1RWhaMG13ZlIxQ3N6clNqWElIaTNq?=
 =?utf-8?B?Sktoa0FpMDkweCtkWHJVZUJGcENRSkFzV3ZEbkRVMlJqMFNNb2RuV0JxMkgr?=
 =?utf-8?B?VzQ1Z3FzL3pTZUFTZGszZmUvMGh2aDVZbjJMamtrMUIycjQrYWM4alVBYnhR?=
 =?utf-8?B?Y2p5b25XZm9CZzN3WnkrK0ZKekx5bUNKWURHK1NUUUtBbFN3TExiL2ZwSE5N?=
 =?utf-8?B?TDgwQU1DQVQxcEoyZTlPWkJ2bFNMcCs0QVhZN0hETXE1bUdCMjNUQTBQcklG?=
 =?utf-8?B?K05CUURpWXAxbkNGN24yaG9mUXllT0ZsMWdoNVRhN05VY3g1R2FMbEU3S0dL?=
 =?utf-8?B?WTY3clZ6OGxzRHowOXllc0FyWDNJdkVuUDY3QlpWWVpDRlVxSTVMSGM1L1hM?=
 =?utf-8?B?WndCZlVBM1drbFY5VHBSTGNNNndUQ3ArMmR2Qm5lS1V2aWZrZ2hyZ3pqT1Rt?=
 =?utf-8?B?Zng1SzczY3p2TlFUQ2pyRmF6QUFYeENVNDQwRGdEbkt5S1doY0RNWm1QN3Rp?=
 =?utf-8?B?RHMrZkhEc29MMmRwTXdOOEpXN1dlaUhnK0ZsalVhZEpETEFQM1BKcWJSbk5D?=
 =?utf-8?B?cytFU3NlZThCSzA0MkhkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkthLzVqc0hQTlgvczZJQ3BGK0IrR0ZJZkZGSjgwUnVsek9zaitGSVh2V1hY?=
 =?utf-8?B?cm1nR3dBMG5UZWFUWldCMFBadFRUR0lNZHdWM2F3SUdHdGdwQzNHbHBIUEZ1?=
 =?utf-8?B?MXJLWVBNTTd4bGd3a0l5M0YrazUwTkZvRmxJT0EwRG4yK2xEMzVURDVRclpl?=
 =?utf-8?B?UlQrZ0tqbUJXUHNCSlhBZkFvWDVEMVFhWC96UC9kd3FQa0wyR1F1VTZXN1Ey?=
 =?utf-8?B?Y1lUdDdoY2F6QSsrc05jRldkUDJhL0lsRTlNcGg3WVQvZVhWKzRNd3J1L1Qr?=
 =?utf-8?B?Q2c5S3FMSnhUNFR5WHpCNDJuOTV3R0tMSFhnc1ZkU3o5TUkrTHBGKzFkZ3Vh?=
 =?utf-8?B?Zm10VUMrbTE2Y3dHK2wraWtuVFdSQnZPYzBXQnN4RkFJZmlTQXhXeUxnYTlV?=
 =?utf-8?B?Zjl0OWI0VUlMVmZEU3c1MHhELzJWS1g5dGRpVjZjWW1qbllqcUszRjlLWno0?=
 =?utf-8?B?M09uY2FSZERQTStjM05NTnRmRU5IN1F3TlpGdjBCV2E0VC9rZ3NMNmU5SW8z?=
 =?utf-8?B?Uk1kbGdTaDl0UE9qcnlqRDBhYnBWK3Q0TGpDUlVqN3pza3RMelR5VnVWUGZO?=
 =?utf-8?B?TXdOZzFWM3dmNFQyQnU3dThYUll4UStGMnJQSmhmb2ZGT0g1dXNXQjVIUkhk?=
 =?utf-8?B?TWdpdmNiRXYrb3d2VzlUVUgvRjlOMFNJVTdjUWdvNHVtaXEweENxNVlLK0tW?=
 =?utf-8?B?Zi9oYy96MGhpb1RxNE90U1hBOTVDcnZGS1o3U2pVeDhqSUFlY0JzRktBYjNt?=
 =?utf-8?B?dFlVYUlWWWZ5TlFBS1dpODVTOENkZkgwYjgzdnJGRXdxSmQrWFJYdTJxQWhj?=
 =?utf-8?B?VjhRMnEwSGt0N2lRenc5OHFybzRDeWgybVJxNUt0eXFnT2J5Snd0QVE3blNG?=
 =?utf-8?B?Y1NRRlB3TUlwaXBJZzNVLzNEc3dBcTNkRmxpS255Wi8ydTlMaFMxSy9OUGZW?=
 =?utf-8?B?SkxibFhGbnpzQ2Y4aU41azBGYUtqTlVoU2FkOUNKcFpmcDBhd0RwUzNEeUJC?=
 =?utf-8?B?MHA2Qjc1Q21oeFBTS3o0ckhreStFUWk2SWQ4dHRaVDFReC9GWGN3NmZpMUxI?=
 =?utf-8?B?dDJkWXBKZWNsR2pSWUxyVk4zTmorNjN0RFg3VE5jTHVBS2JzZ1k1c05PSTZU?=
 =?utf-8?B?VUxGKys2OUx4VDhOYXduVFlHem1WRUVoa1liNFoxdFBWODh5c3haQVNvczRw?=
 =?utf-8?B?VHJGZ2xaaFBjTmJtMW4zajY2c0JGNkcxZ09ubm1CdURYV1RabCtabnE0aGlr?=
 =?utf-8?B?N2dzRHYyd1V3YXNPV2xtUklrS25HTTV3NlQ2aXZiVmpOMnNxTDIwdG5uZG5J?=
 =?utf-8?B?ZGVGdjlQWkF2MWhZWE14THVyUHQ1WWlMUWk2L1ZTVklNS1o3QUlBT2tHK2g5?=
 =?utf-8?B?WEY0bm9DZ3NXQUExdFpIL1JSNUtuUjV1aWhuYy9tbGdrK1hvY09lYWtsdmhW?=
 =?utf-8?B?VEY2bU1xWms2blJxK0hySVBWS3ZOUDJlRmJMUUp1ZDhhV1ZlRm5iU3duUHd4?=
 =?utf-8?B?WDA5WXIvcE1vOWhhb1VpYlliNFhKZEZobUFlcTc5Q1VNS090QkU5SnZLR25F?=
 =?utf-8?B?T2JzY2ZsZ0Y3TmlZUkJ6WUlkVWwwMkZCRFIybjdyNlNGRkFQS2hzRS9GbWRz?=
 =?utf-8?B?Q2l2TGhpc2NqcFVzdWoxL2puSklXVjRUQ3cwdmgyRDNiYnAvNUg4eUliOGdZ?=
 =?utf-8?B?NjdmRUhlcjVEaDFNZjJjWEVjZ0FYajZGTGwxdzZjbjZjWHdBZ2JHcy9jZkRz?=
 =?utf-8?B?amtIRHZHWE5UeTQ2SlAvK1dlS3dwWk5MZTZlTFpxRFVDem5HZy9Zanh3N0NM?=
 =?utf-8?B?VE9sdjI5Wmxla3JXK2Y4UGwvbVdiYnl1RUJjSjkxR0pOREZuT3NLc2VRVkVa?=
 =?utf-8?B?VEVoVkcrYnQvWUVNSzhuWnZiK2xZOG15bUJaRWdTeWpvVVFxNU1iRGUwOWV6?=
 =?utf-8?B?TGlIRzM0aGl4OGFrSWJZeGJlb3dnSEYxUHRHK09mVmJvdFpyVzYxYWtMVVJJ?=
 =?utf-8?B?UVgrWE93Vnl4NDF3WHI5ZFg0SDhENVZmaGxtajMvTjNmR0Q5SUJ2cDFTTW9E?=
 =?utf-8?B?RUloWUgrbnhIZVpwZ0VjT2Q1bHR0TGYvWnYzKzAyQVpxWEVBaDU3ck9YLzhu?=
 =?utf-8?B?d0tRRjZ0ZTh2Q0MyR1k2UTBBM3dsY2ZDTllWbTFwQkxmQ3lqdEJNM1FCa0dz?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a1bd56-09bb-471b-b327-08dd19d25a75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 10:55:41.1441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WahwYtB5SsBQQfdBDe5tTDzsor15gAHkTE41tt5XTbf27oO4J0sg2DuXELCLMvE986n0ve5HS/5ybLIzT6NqwxtFaX8cWabyVS07RbkN8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Invalid subtests are added.
> -invalid filter with scaler: enable scaler on 2 planes and attempt
> 			     is made to enable casf
> -invalid filter with plane: enable 2 NV12 planes and attempt
> 			    is made to enable casf
> -invalid plane with filter: enable 1 NV12 plane and casf and attempt
> 			    is made to enable 2nd NV12 plane
> -invalid filter with scaling mode: enable scaling_mode property and attempt
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   tests/kms_sharpness_filter.c | 178 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 173 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index 06c9cce11..677186d27 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -56,6 +56,30 @@
>    * SUBTEST: filter-scaler-downscale
>    * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
>    * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-scaler
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 plane scalers have already been enabled and
> + * 		attempt is made to enable sharpness filter.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-plane
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 NV12 planes have already been enabled and attempt is
> + * 		made to enable the sharpness filter.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-plane-with-filter
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 1 NV12 plane and sharpness filter have already been enabled
> + * 		and attempt is made to enable the second NV12 plane.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-filter-with-scaling-mode
> + * Description: Negative check for content adaptive sharpness filter
> + *              when scaling mode is already enabled and attempt is made to enable
> + *              sharpness filter.
> + * Functionality: casf, scaling
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -76,9 +100,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
> -
> +#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>   #define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> -		||  (type == TEST_FILTER_DOWNSCALE))
> +		||  (type == TEST_FILTER_DOWNSCALE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>   
>   enum test_type {
>   	TEST_FILTER_BASIC,
> @@ -92,6 +122,10 @@ enum test_type {
>   	TEST_FILTER_SUSPEND,
>   	TEST_FILTER_UPSCALE,
>   	TEST_FILTER_DOWNSCALE,
> +	TEST_INVALID_FILTER_WITH_SCALER,
> +	TEST_INVALID_FILTER_WITH_PLANE,
> +	TEST_INVALID_PLANE_WITH_FILTER,
> +	TEST_INVALID_FILTER_WITH_SCALING_MODE,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -124,6 +158,11 @@ static const igt_rotation_t rotations[] = {
>   	IGT_ROTATION_0,
>   	IGT_ROTATION_180,
>   };
> +static const uint32_t scaling_modes[] = {
> +	DRM_MODE_SCALE_FULLSCREEN,
> +	DRM_MODE_SCALE_CENTER,
> +	DRM_MODE_SCALE_ASPECT,
> +};
>   
>   typedef struct {
>   	int drm_fd;
> @@ -141,6 +180,7 @@ typedef struct {
>   	const char *modifier_name;
>   	uint32_t format;
>   	igt_rotation_t rotation;
> +	uint32_t scaling_mode;
>   } data_t;
>   
>   static void set_filter_strength_on_pipe(data_t *data)
> @@ -150,6 +190,12 @@ static void set_filter_strength_on_pipe(data_t *data)
>   				data->filter_strength);
>   }
>   
> +static bool has_scaling_mode(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
> +}
> +
>   static void paint_image(igt_fb_t *fb)
>   {
>   	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> @@ -184,6 +230,7 @@ static void cleanup_fbs(data_t *data)
>   
>   static void set_planes(data_t *data, enum test_type type)
>   {
> +	int ret;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_output_t *output = data->output;
>   
> @@ -201,6 +248,46 @@ static void set_planes(data_t *data, enum test_type type)
>   		igt_plane_set_fb(data->plane[1], &data->fb[1]);
>   		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
>   	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +	}
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 640, 480, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(ret, 0);
> +
> +		mode->hdisplay = 640;
> +		mode->vdisplay = 480;
> +
> +		igt_output_override_mode(data->output, mode);
> +		igt_plane_set_fb(data->plane[2], NULL);
> +		igt_plane_set_fb(data->plane[1], &data->fb[2]);
> +
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_SCALING_MODE, data->scaling_mode);
> +	}
>   }
>   
>   static void cleanup(data_t *data)
> @@ -272,15 +359,21 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   	else
>   		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
>   
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
> +
>   	if (SET_PLANES)
>   		set_planes(data, type);
>   
>   	set_filter_strength_on_pipe(data);
>   
> -	if (data->filter_strength != 0)
> +	if (!INVALID_TEST && data->filter_strength != 0)
>   		igt_debug("Sharpened image should be observed for filter strength > 0\n");
>   
> -	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	else
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	if (type == TEST_FILTER_DPMS) {
>   		kmstest_set_connector_dpms(data->drm_fd,
> @@ -302,7 +395,18 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   			      "Scaling op not supported, cdclk limits might be exceeded.\n");
>   
> -	igt_assert_eq(ret, 0);
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		data->plane[3] = igt_output_get_plane(data->output, 3);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
> +		igt_plane_set_fb(data->plane[3], &data->fb[3]);
> +
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	if (INVALID_TEST)
> +		igt_assert_eq(ret, -EINVAL);
> +	else
> +		igt_assert_eq(ret, 0);
>   
>   	cleanup(data);
>   }
> @@ -401,6 +505,18 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_DOWNSCALE:
>   				snprintf(name, sizeof(name), "-downscale");
>   				break;
> +			case TEST_INVALID_FILTER_WITH_SCALER:
> +				snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> +				break;
> +			case TEST_INVALID_FILTER_WITH_PLANE:
> +				snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> +				break;
> +			case TEST_INVALID_PLANE_WITH_FILTER:
> +				snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> +				break;
> +			case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +				snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -579,6 +695,58 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
>   	}
>   
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 plane scalers have already been enabled and "
> +		     "attempt is made to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> +	}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 NV12 planes have already been enabled and attempt is "
> +		     "made to enable the sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_NV12;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> +	}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 1 NV12 plane and sharpness filter have already been enabled "
> +		     "and attempt is made to enable the second NV12 plane.");
> +	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_NV12;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> +	}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when scaling mode is already enabled and attempt is made "
> +		     "to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
> +			data.scaling_mode = scaling_modes[k];
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
