Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2ECD2E01C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 07:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8DF10E772;
	Wed, 23 Oct 2024 07:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lt47lpam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3529E10E772
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729668364; x=1761204364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HeG53JYb01XqHP1Ln0fvDRVJvAwjI2/qfPhmhphzAc8=;
 b=Lt47lpamCrzMedcyAwqlnw55RjrE/C3LNK0t8B1UfJoJ2rogtUuv8t4b
 85iN+VhgGkHcqTZaNbK6OCwfoCXDHGityWbICaRPvhAqMzwP5cbH42EG8
 nliaJXFuzY9Gm+inVKrKdQX25g166u5+VRkhLIjtM48VJflPCg0Bo4BKE
 eHhERFZyTvI1tOvReNC9DORVKYGDVZw/P3NptUacZmHS8J50LglFN14mJ
 YKiJN3G+qLmi4tnF8hk5h5n1y1F7aVhK2w4BL0kOvr7q3w55eDnFMiGou
 lEVIFCyaAbaCzPe8jfdezVZBNqutUxnvLIqChO76x1e+z+bgA5dpyhPkj g==;
X-CSE-ConnectionGUID: VOjJc50VQ0qIp67bQ3hCaA==
X-CSE-MsgGUID: yopwsxj/S3q7oAbFKDpLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33051570"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="33051570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 00:26:04 -0700
X-CSE-ConnectionGUID: oQO65oGMQxio2Ea+RAklNw==
X-CSE-MsgGUID: c/CCz+mAQPykKmJ7G4fx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110913936"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 00:26:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 00:26:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 00:26:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 00:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPYE1jg4Th8Xd43L/HvV+FrXtctyrUALPXBa+o/boHGV6VQkMK8VkfA749q/+e09BNAB15ezLOEkyYWQVJKVHFEUeatdeNgMuJf8/CgYF+uNg6iLlOLipGBlxIzOAM5/DKGOl53FlQWz4L3uA0oJbjFGDOHtZScWoObJhbDsS1S3rLxrmOdTUY8I9oxtgoEwZ9mHAetdziKOiDhTgmyfFItnrTiCowMC8s00/EQH97eu2fGEdKNApQ31Q6Vy3abV0N3kOQ5aaob43FtEK/3apJTKK6O4j7O/YE4yUxZCxaYo1jRZh0L8mi/nXjVDSS4f5xZ7Wf7Si91VFFZ8h0GLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkEhpyABG4UcIuWj6obNwqufZYJY+MsREtCc7rxbIMc=;
 b=rOBoSGAt6DQmdBZo4L0RR/mAmOrDFbaHSLLttv7CisFcKspojrlefd6klc7KbaNnv7r/8cX/GzCkQaqshKa9Yyfila8QYbIjI69uvnv29uQlUvc2ZlcEec5dXbBO3IMkdfdqdK6Kv+srZYPbBgdSHpL0tsGxO8A4y6ZVZFCWuvTQYwoZfgyi3Z4S15u4McckugXN5+huF5VTPVMQKxL9gAdHOVIu0i5P0kLNXBSWvCMw+0413oe5ZtaL3y3+hWBdPqqCwqG5xoyHrMEYEZT5KBtL8YGcZp8o9fRQqfNoeJ1IoVrjotV1dJXWuN9CKYpsfTPnJwNuNsuooRhyDJK+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Wed, 23 Oct 2024 07:26:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 07:26:01 +0000
Message-ID: <a33c8dd0-46c1-4b12-8610-6fa4e3129115@intel.com>
Date: Wed, 23 Oct 2024 12:55:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20241022104918.2120652-1-sk.anirban@intel.com>
 <20241022104918.2120652-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241022104918.2120652-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b236ee-5e14-4ff4-b859-08dcf333f1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnViR0RFZTNvRXJxMlI2MFV0MFZtbm9zZzRycEhPM0dwVTZaUHIzaTVkVWcr?=
 =?utf-8?B?bUxoNkE2YWpGM295VEZ1R2pQa2N6TEdlTnc0akVtRHpsNmc0T2FndDBENHN3?=
 =?utf-8?B?MXZUZlMzY3RkOGtLbXNNbXhCR25EdGdrTHlYYVNBc0IvVnpHclAvZktlZGdv?=
 =?utf-8?B?ZVR3SUZZcEFEOEVlVjBDamhDUm1KL3lJbnpGN1pPSlV4dmRjekk3SklEY2Nr?=
 =?utf-8?B?VzBkbVduRVc4N0JlRFluSkNxYXRwMVdkZnVwOUVzeDYzeEErNnN4K253R3RZ?=
 =?utf-8?B?dzBDU0dKZjE3MGJEaXE1UkNWQXZ2RW41WVN4NGt2WjdkSlRVUnRuN1NlUFVB?=
 =?utf-8?B?RDVmN01CRFVrQ2Z1SEZlMEs0eDRtMUtBc2lNZk1EUk9GZ2tudzU4Z3JOcmVT?=
 =?utf-8?B?QXE3N1F5NXJUbHZqVUU1QWVhSFZacEFXZFNML3d0bS9lL3U3TzdvbXRvdWJT?=
 =?utf-8?B?R2VRbzhuL0tpYkE5QStGRS9TRjFya3Nqd04vQTM3TXhEdXJpM2d6bzVMbkVP?=
 =?utf-8?B?cXQxZ2U2c2s0VFlSdUZtTjI0bUFzZVJmMzhMMERpVGgxZkhYRzlFSk9mMHdk?=
 =?utf-8?B?citKRXhEM2tWa1hYU3psY3pseXJZV1B2VXNvSXYwVWlCR0NIem9TMjZGR1NV?=
 =?utf-8?B?UjQ3eHlCckVIcmRwVFc0UlhPZUp1aFQyZzlBeGFFV1cwemVmeDZFaFR3cFpH?=
 =?utf-8?B?b3pPOFcvS0NhUlRQZkRlN0pXS2gvODE5TlE2QUM3ZE9mTTM2dXhPQTc0LzBH?=
 =?utf-8?B?VEJCQ0Z6OW40clFJdnNrZzRZVUxKbGdqWktoc1lLei91OUZkYnRNL0xQMUZN?=
 =?utf-8?B?SlpkekxLVElGWFJEUWhqRGRJdzJuK3NPR1JCcmw5d1c1OFVweDJVYktXSlp1?=
 =?utf-8?B?VWZmWEtuWkcwQlJDRU1HVEpzd3cwK3FXUTN2VFh4TlkrUHNmUHl2OFBoRDhD?=
 =?utf-8?B?azMzK3hwT3FDTVZ5bTVoTG9HS2EzNkhPYmg5K2U1ZGUyNHRzbUx5WDNpR1ln?=
 =?utf-8?B?cnBwTlZobDFpNTZ4NkxaeGd0SVFNRGNrb3pva2V6R0FjWkZaV25hT1pXdW1u?=
 =?utf-8?B?VkJaNFhXcWpwQ0xNa1Q5RDUzbGhBRG5qdzE3aVc0MEFKMDZaZXNPTTVUc2RI?=
 =?utf-8?B?YTlPZUVoSlVXc3FBbmFLS3dsMG1BeGl6SzBHWDNBbElHTkl0UUR0L3Q3cjdY?=
 =?utf-8?B?cm00RTczRWhlVlhLVzFuVzJYM0dORFQ3czRxYkFQN3NqdVJjbkRac25paUxt?=
 =?utf-8?B?ZURuUS95THF0OVZXVHQraVZOaXQ5dWVZemFyZGxUR0dzcnk2L1hWOER5TU5a?=
 =?utf-8?B?dzB6NFU5bDVRYXZIODcwckxIUjRnN3lsbzU3QnN1eUhSTlMxcmtvTENOYlZt?=
 =?utf-8?B?bnNKNjBDYTllN01ORC9CcW9xTEk5UkV4QnNPa0JzRmhZN0NmSTZzVE5ER3Bp?=
 =?utf-8?B?R2VuVk5FSitGbmVnSjk3eURBR3RFdzFON2NrTXQxaVUrN0NJN2w4Uk9iYStu?=
 =?utf-8?B?aVdiQllpVGFvdWdhLy8vQThQR1JOeGR5cEJzbUc5RTRhNVlsamhLa0ZpeVZr?=
 =?utf-8?B?dHBIalBsc3c4NlJPcXg2VzBLZk9xYURxUWdZMFVqME80ZG1VNC9pRi8zUERy?=
 =?utf-8?B?SzE4bDFEQ2pFZ3BmM25UNER0K2tPT0I5T1Z2UlhvL2RTT2kxN3Q1ZWl3UkMw?=
 =?utf-8?B?azhRelZlamVqcWc2ZGJjY0V0Ty9yeUgvL3ZObGFZMVFmWUlmYmxrVnRqNlUz?=
 =?utf-8?Q?AN6Q4ojPY1kmOTmg1W437dt6N90m1IMLw8Ve9r2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5QdE85YzRGa0JwQTc1cjlXalY0bDJMTWR5cEx1QXdlZHh5aDVGQmN1Q0hO?=
 =?utf-8?B?TERuRnBpK2N2bTNhcDRscHRFSjY0R3FDbC8zQzZ2T1JUUnZ1aWJTTDllQnVy?=
 =?utf-8?B?REF0Si9qK2gwZ2JNSFg3ZlN1NnNnSGZhRG9jeDRIUktUS05VZitLMmlKVjhp?=
 =?utf-8?B?UnRzMW9HMmRIcDJ4bzFrWmhac2JOTGV4RnI5NU84ME1xK1pKQVpMU29ISmlp?=
 =?utf-8?B?T1NvNmNVcHJLdUVQL3FuT2RKRkgyV05jazR0TjVtYSttYXlnaXFJaGcycnpO?=
 =?utf-8?B?OXZBd2hkcFk5Q0dtUU5naEIyK2g1U0Jja0tlZFFGSjJ4VnA2bDRvVHlPZWtt?=
 =?utf-8?B?QSszcHBQdlJoZVBnTmZLYytwUVV0SGdTUTRGNVQrOTh1UG9FNkZYc2N0VldO?=
 =?utf-8?B?Sk5hZ2lwdkx1S0dCV2duaFkxZ3VWQkxNWmZuKzlhNVY3T2Q3TzB0VzI0djdx?=
 =?utf-8?B?NDQ1RVFtUjJsQkIvVm81U25WRE91TVhvYjdTeVh0M1gyMTkwTUNUNlc1NXBs?=
 =?utf-8?B?TE5xWDZJMlA3LzJzdUQ2TWN6SjZIa2gxVEFPVC84WEEwTmFMSS9qWXo2NW5m?=
 =?utf-8?B?Uk9yQTdVRkV2bFJJQ3EyWGczak1rT0FtdURLUHRBck9rcFB0T0txREFoMDhz?=
 =?utf-8?B?L3Zjb3EyN3lJOEp1SEFVS0tLRTl6cFNrLy9IR3p3TUJVYTM1NFN3Mm5tL3Yy?=
 =?utf-8?B?Mi81ODlOUllTMHR4RWhoV1ZiNGZqU3N2Kzhxc1k1cmZNbTJNT0cwNkRzR24w?=
 =?utf-8?B?OW5PcUcxRTNzNXQ0Z2NRNlJHS3dZNXpDS3U1V3hPaHFLSG1wTFptSHVqSlZx?=
 =?utf-8?B?eHVkc1lsaXhSWVJZNDlOTGk1UzVMcWluK3hJVTY5bEJ4ZGFVbjVNeVlZUkhM?=
 =?utf-8?B?Q2JSMUVTN09LaS9lR3NxZVBaWkdXakZaR0dsV3hSS3laOHE3TCszMlpoaExx?=
 =?utf-8?B?Q0dBTHR3aDZmL0ppcWJQLzljbWVaL29pNXBSbVF1Um93R1AwWExFSTE2bkh4?=
 =?utf-8?B?MzVXVUphVWxtS2l5cjVCd3NhcEtmcXRPVmt0WGhHdzdDTnZPTDRPanJRS0Za?=
 =?utf-8?B?N2RvMFFDTS9hRGd6c3pKSVIzK0ljaTdPcDAxOWFjNFRTWUo5RnVYSG1MUmVy?=
 =?utf-8?B?MnJsNnZueVFmbVVUUWNpSTQxaGFxQllIWjlBNStZZDdqMlpMdkd4TUdtaFJk?=
 =?utf-8?B?Vmp0REM3V0RPd1YyU1J0SzdzeXFEZUFYOGxrSUtHc0tIdWk4L29pRkwzTUF4?=
 =?utf-8?B?bzVRRFBQdlI2MGtZcGZ5UEo4NjFjSDlYaDZrUUJJdEp4RXQxaWxjTS9XdEJO?=
 =?utf-8?B?MUNZSnpLVjQzZVp4Sk9CWTNnRERoZ3NTTFRJdmxiMFhtRmYwUE52SlBGdjRZ?=
 =?utf-8?B?VXVEa0VveDlaNms2L3kvRnhscWFFakFxSlpBYzBEaUZ2VnIvRkFjR3ZCL25k?=
 =?utf-8?B?Tm1sZTlyMW9JY1VzRjgvT0d1UmVtQmNZWGVkeVUwY3JKYWZTOWxJQXcrWGhz?=
 =?utf-8?B?Z0t3YVY5TFF0bE9TT0d4UUZPZzZmODd6NzVEaHIrSGw2K3B4Ymx0TTFmRmFF?=
 =?utf-8?B?ak1MdUdEbEJPRmRhNVV1TWxoamRtTUxNcnJua1lQMzYyd3pkcnFvRk1mNEdo?=
 =?utf-8?B?UE1OQTRpZFJNRjFPRjBNS0V1VDJVKzZVS0JVQzM1YS82cmJqWmNicFMxd2dp?=
 =?utf-8?B?aXNHaUJ3K2pucmJzUW03aUlQM1V6Rk8xMy9kZE1jTXBJY09UR0s5c3V2Y2x6?=
 =?utf-8?B?UGMvMEJZUmRRem5UUzhNYmYrVjdMRTYwTjdIYkpVUEljTUZFc0RpcklSSmhB?=
 =?utf-8?B?dXNhQ0lMRURITXFsZGhBc0dIdXh0UW1LQVdBVmplWUYxVUkvUXNFcUh6VE9B?=
 =?utf-8?B?VXZaNy81SDUxT013VDlLWE9tbjJnNWh6ejlPMzZCMFArL0dnM3piOHNuQW1S?=
 =?utf-8?B?VEJON3h5MjBwOUt6T0lNSDQrUXBMTFVoVDBIL0dNRXdjNzNKWEhvY1BmQWNy?=
 =?utf-8?B?dERNdXhPSDE5MUlDWlNkaFhPSVF4Ym5XWktqUnJJUGl3SWRzL056blVpeEFO?=
 =?utf-8?B?K3kycTlaVml2eGEvQW94SDJvSW13d1pLelU1ekNwMUNOZk1DblVHQkg5Wk5s?=
 =?utf-8?Q?d7nGqwNofQurK8GS4jke8Fyo2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b236ee-5e14-4ff4-b859-08dcf333f1cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 07:26:00.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gpuu4edCMMpEzjIg/W3jFCg71AmZ884ygZjgXtbH1BbzK+YYbFovzeYEwyB0b70buhAiivwyGf+UrI0zgRjz6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

Hi Anirban

On 10/22/2024 4:19 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Implement test cpg-basic to validate coarse power gating status
> after S3 cycle.
> Add test cpg-gt-toggle to check if GT coarse power gating is up when
> forcewake is acquired and down when released.
> 
> v2: Address cosmetic review comments (Riana)
>      Fix suspend state (Riana)
>      Add exit handler for test cpg-gt-toggle (Riana)
> 
> v3: Address cosmetic review comments (Riana)
>      Fix commit message & test name (Konieczny)
> 
> v4: Address cosmetic review comments (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 90 +++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b57..e9a257fd4 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -63,6 +63,12 @@ enum test_type {
>    * SUBTEST: toggle-gt-c6
>    * Description: toggles GT C states by acquiring/releasing forcewake,
>    *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
> + *
> + * SUBTEST: cpg-basic
> + * Description: Validate GT coarse power gating status with S3 cycle.
> + *
> + * SUBTEST: cpg-gt-toggle
> + * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -317,6 +323,79 @@ static void toggle_gt_c6(int fd, int n)
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }
>   
> +static void cpg_enabled(int fd, int gt)
> +{
> +	int dir;
> +	char str[512], path[PATH_MAX], *render_substr, *media_substr;
> +	const char *render_power_gating = "Render Power Gating Enabled: ";
> +	const char *media_power_gating = "Media Power Gating Enabled: ";
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
Not using dir anywhere. Why are you opening this gt dir?
> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +	close(dir);
> +
> +	render_substr = strstr(str, render_power_gating);
> +	if (render_substr)
> +		igt_assert_f(strncmp(render_substr + strlen(render_power_gating), "yes", 3) == 0,
> +			     "Render Power Gating should be enabled");
> +
> +	media_substr = strstr(str, media_power_gating);
> +	if (media_substr)
> +		igt_assert_f(strncmp(media_substr + strlen(media_power_gating), "yes", 3) == 0,
> +			     "Media Power Gating should be enabled");
> +}
> +
> +static void powergate_status(int fd, int gt, const char *expected_status)
> +{
> +	int dir;
> +	char str[512], path[PATH_MAX], *status_substr;
> +	const char *power_gate_status = "Power Gate Status: ";
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
Same

Thanks
Riana Tauro

> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +	close(dir);
> +
> +	status_substr = strstr(str, power_gate_status);
> +	while (status_substr) {
> +		igt_assert_f((strncmp(status_substr + strlen(power_gate_status), expected_status,
> +				      strlen(expected_status)) == 0),
> +			      "Power Gate Status Should be %s\n %s\n", expected_status, str);
> +		status_substr = strstr(status_substr + strlen(power_gate_status),
> +				       power_gate_status);
> +	}
> +}
> +
> +static void cpg_basic(int fd, int gt)
> +{
> +	cpg_enabled(fd, gt);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
> +	cpg_enabled(fd, gt);
> +}
> +
> +static void cpg_gt_toggle(int fd)
> +{
> +	int gt;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +
> +	xe_for_each_gt(fd, gt) {
> +		cpg_enabled(fd, gt);
> +		powergate_status(fd, gt, "up");
> +	}
> +
> +	close(fw_handle);
> +	sleep(1);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "down");
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -380,6 +459,17 @@ igt_main
>   		toggle_gt_c6(fd, NUM_REPS);
>   	}
>   
> +	igt_describe("Validate Coarse power gating status with S3 cycle");
> +	igt_subtest("cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			cpg_basic(fd, gt);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing forcewake");
> +	igt_subtest("cpg-gt-toggle") {
> +		igt_install_exit_handler(close_fw_handle);
> +		cpg_gt_toggle(fd);
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}

