Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F08D6DDF2
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 11:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1D710E854;
	Fri, 15 Nov 2024 11:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyRk8idi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596AB10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731671720; x=1763207720;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xw5bT+plTLmX7QLxW8DD4DNw8ookHjwynYqaSgtJH/Y=;
 b=PyRk8idiHWFjI6ABKQi9tHtljzOhWQfnhul4QjfN7Aqant9N/vlgxYjd
 XbpuJMfE3CXyAlzUQI18ienuIwZRiprAZlnf8zbNC9H8s1fcijorbDrr0
 wnMHqtr3p9u3G2xzXANOv47utcT4LTCHU8roAxKXlRJFfID7lADvYKxfo
 LRK7vqEka6yblODzZlBP8EVYm2Gc7bA/eTy7sxJ6qlScwOxJf29GvEIaV
 /hlXvS/ZD2yQEf+UG4ApSdFZlmguRgKTUqF+tHAvVdb+X/cYNjdKAwxJs
 UyX7Iyz9X6xt4TzRCIGbcYVFf40CMJ5wKgYSks6K/nO7U3PZ6s7cDi9oB g==;
X-CSE-ConnectionGUID: OSbh6OgFQGuy7SYY61HLPg==
X-CSE-MsgGUID: WuQ4y9LCT1azbVWDH9ccaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35603511"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="35603511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:55:20 -0800
X-CSE-ConnectionGUID: dvFqFV6DRc6l+SZ0SEOT2w==
X-CSE-MsgGUID: MzCaI8imT7WF/5s3hLJPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="92614788"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 03:55:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 03:55:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 03:55:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 03:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s23EPdVGC8TymngRMziMmpPegruZRXQa3v80RRti5JSWyDRKt7YXJB3Vr1W0VGDar+AVWHFk6uT7ilMY3gMNaArrFFZ3SDFtb3tGVh6frENnJTO3SxbG6zBGwOhDfnaVgNaTfGPt1+fNSagULpoF62vAyNSIB1gF5hUXc3Fy5WS3dgiOvhY+S8NX29uHn6s7WY5G3maJFs1ViWof6XMsqm2FnuyBt51ON20EoEgQ52EL29PL2RgTQDpU7dr1JzQSWUS5+6hRUH36Xyb1kCZfUyL2mhUAii6t5JU+uasz9P+stIIk9c6i3NlfUfQ2KsPqqStszDb92rRtEoSRISBPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XREg+HzbxgWmMGvDoqb0oFds6+mnrs4bkY3bAk8Dm88=;
 b=rFOy+HSs6PW26wjm0sgIAdhWvmDvleNqdBfb7FSfDbp5ZWfsWbR6VVWftYoLwuYZOuuRGgDPLV8KLV72p7tLK62gz9NlcI/0QGxLQunQo86bGjhObltSmFysLCBbKsjP0/qGqh5nhAEXF8MDAahSNsrECKAixsp7ZhAKDBbci0h/RYpO2y2IZg8UJF0MsMIwIAXCIlvp54XwQEVXWybT/V/KkeLinuEfkoI7eqFzzso2t7HKQjmrblQ25VOGXW7LKWxEOQEIoltg7EVzS0cROfv0YOKNQI4cP10cHXBMg+bQIYTO+ZShadj2Ub9QJ5S2l7lKZIvqS+n2lFpTWRNW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 11:55:12 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 11:55:12 +0000
Message-ID: <32e43ba4-0131-4234-8a57-549fdc3af58a@intel.com>
Date: Fri, 15 Nov 2024 17:25:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Add
 kmstest_wait_for_pageflip_timeout()
To: Imre Deak <imre.deak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-3-imre.deak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241022155311.2797257-3-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4b1432-2a13-49c2-305d-08dd056c5c18
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzU1VGZ3bGxyTk5VNXBETEMyYU5NQzB2Z2xWdkZDcXU0Mm9sNmx2cVJLSDkv?=
 =?utf-8?B?UE5wdkxXbTNwdWF4WFhmM3FlMndhaGd3UnNsNlVmYXNmSjZUaC9qTHQxTlB5?=
 =?utf-8?B?WE0wWWE0a0RWNWxSTUY0Q1BhNDJDWk85Rk5DSkRqbGthR285N2tPRVNZRHdT?=
 =?utf-8?B?TWRBNEk1OTBFNmo0aWN5ZVM5WmMwRFREdThNb081QUp1N1I1OExvamlFc0Z2?=
 =?utf-8?B?VjJHSWRYOGpuajNYZVQyTVgrNFBnc2owS2oyY0lCLzUzaXc4UzAyODN3cjJH?=
 =?utf-8?B?M2xPai9aaUdjTlJZRFJzeU1rMVpsUEd3Mk11dUZDV0FLVHVQV0h6OFhKY2k2?=
 =?utf-8?B?TDlOZkFPQWgzY3VISi8vbmlSSTE5dkVlYzVidjdGMWZwSE11Wm5qeGtyella?=
 =?utf-8?B?YUxsYzRYVmlYVFBvclVlbi93V09JMFdTUU9INHpVT0ZyeXFtOVBxTU5rOUxm?=
 =?utf-8?B?Vzg5RHVDbitnQ1dDQ0U2VEcyV2NKSXU4VXV1ODk1NUZqYnEvTHpzTk5pQjRF?=
 =?utf-8?B?VWVVRk15aExJcnZhSzVQMC9zTmpFaElTVytaZVB6ajZQVndXR2xuUmdHRVFK?=
 =?utf-8?B?dnRjYU9CSi9HaTdIdm1od3hJMGxyS28rWlh3UnZ5RXVRekU0UnFxR0poL0hm?=
 =?utf-8?B?elBqcDdTOTRkam1NQlpOTmFGcnJwWGpaWEZEOWFveGFialVSL29GZzdubk5k?=
 =?utf-8?B?TndFK254bUlqRXZCNlIrVjhCQUhLRmtmN0xGNk1lK2t5elFsUVdSdC8xUm5W?=
 =?utf-8?B?S1k1MEUvV0RBVGQ0THFSR3dmQWFCbjArQ1dHU2kySSs4bE9qRDJiZmpyTWRv?=
 =?utf-8?B?SlAvVmZOM3cvNExMRFBpeHpsUlQ3MGM5STMzVFJHbk5IYmFRSUdEcDlFd2tZ?=
 =?utf-8?B?VHFXQkszT1NYb1NjNUxudGtTNGxMNlM1ZE1GRzRGZHF5SHdtV3dPQ1p6b2la?=
 =?utf-8?B?MnYyRllFdzQ1bi9CRWRzSUxXVW1pVEl6RCt5bXd6Z0ZaR24wd1NWWjJ6VjJu?=
 =?utf-8?B?YzNScGV5b3ZnbDl5T2o1SDQ1MlJMN0FmTG5QSHg2ZlN4MjZOajJjOUJ2WDNi?=
 =?utf-8?B?RUNOSmM3c2NZT0JLY2NOWk85MTVsM2xta0g1Zy91YWFrRE9xZE52OGRuNzZm?=
 =?utf-8?B?NXdHcnl1UUhBZ0picDZTY29TS0R3eXJDNW5aakxTVCtRZG1xakVLWDZqMk9X?=
 =?utf-8?B?Wlc1UGplMFpMUTduVTV0WW10eE5YbWhyMThjRlpaUmhDVWtQTzFGMjU5a0Fo?=
 =?utf-8?B?VDU2eEpCN3NKajNxcmtRU0poSEtVUUlLSlNYU0ZNOHl3T2RDV1FWTGs3cTBR?=
 =?utf-8?B?VVNBanE5cnlGeWthaTRyQk41VzlmK3hCVFdtM3BVMGtmRU9Fd1ZPVjNrbkU1?=
 =?utf-8?B?ZlZ4U3orL3k0cWF3ZnhhUjg5OERidVBvTXdpN2tvWS9TVHF5Q0VZMFliMllj?=
 =?utf-8?B?bkR4WnVPcTRBQjJDZjloSGhTa2ljOFRDRXVKZDduK1VHaVdvd0hYV0pRYVZK?=
 =?utf-8?B?ODFvSmROUnFxUWdYbS9DNVNtcjZBcHlhTFVNeDAvNFV2WHNhMUx4WUJuMDV4?=
 =?utf-8?B?SlNKNzhMdWxrTUQ0RDVYaFI1alpNY1RDUlJCSFl3bm5OLzdkbTZ4YlV6UU0v?=
 =?utf-8?B?NkNOTGxXU2FlMlljWEFEQVE3RGY4N3VRb2pOZXdhaW5Gc3V3MDFZMVBmYzkw?=
 =?utf-8?B?MVhLcm42RFNHV1RvbHhzWmNnV0FISG52dFdwMEd0NlVtZ1FUNFM2NkJHOWxC?=
 =?utf-8?Q?t/SdWSkkTrc07g4YGlGWXeqZ4f7FzFNrWYBVIoe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDN4S0NVblFwdXVYMGgzS2s4LzRSVE5qc3E1MDVGbHExSDFweGlTMGIrNE5s?=
 =?utf-8?B?Ynhya3RpbGx4b2lZNEVCbkM5YUF4b2xSSVIzaFBKc3A4alpLSlFySmVTcTFr?=
 =?utf-8?B?YlcrWWNtc0FqRFIyaERSOXVQNy9zVXVLVW5sMWt0S0xGQ2VOeWcycUFsWXZH?=
 =?utf-8?B?aWdUQUlVZlNDRzAxSWk5d0Vod2w4aWJEcGFDMkRqSk9JOHg2TmdiaUxzQ1FC?=
 =?utf-8?B?ZHdxZnkzVHpieXBYNElBZG5LbnlIQW81OEQvL2lTVkZCUE5PSzBqdmVJd0lI?=
 =?utf-8?B?UXo0UGtuV1Y4STVPQXRmb0dKVDB3Z3JNU001THE3bmJEUmZqRzRZVWtJL3lT?=
 =?utf-8?B?aXNKV2RNRlF0Z3FmVDZyL0x0U1IzcUJGUHlPR3hwLzk4ZGJhQ2J5bHhwMGI2?=
 =?utf-8?B?S3ZlRmEvT0VBVFdzd1BKbmF3M21jQnpsR1hyNTdRYk9sY2sraUZDam1TZEI4?=
 =?utf-8?B?SzFzMCtOYmpMVDdyWm81Ty9kTmlVblErQlJmSGNIYTZYelhSK08rYUpzRFNK?=
 =?utf-8?B?NmhTeUVYK3hwWnhndFhHUEdVNDI2akQwekRpVWFiOUl6SEtQZFlmOURuMnFP?=
 =?utf-8?B?WllORU1SODJ5dDMzZ2s3T1hzYzFRTy9ydERwcnluR2pKK1A1N0x5Sk1KUkt0?=
 =?utf-8?B?WmdTeERqNStiMHZRaktGVFhQVUNpQVFCN0xSVEJDTHZCUTlpM2twclc2ME1U?=
 =?utf-8?B?L0c5Y29ldVJsNU5taXF5ZjdiQ0cranZYVDYrL3JZeDkxVnk2NGowTHBrV1Ev?=
 =?utf-8?B?QWFCUXFyNkdmazB6ZC9YNWI0Nlc3a0VJL09oRWJ5cG5TTkR3ZC9BVzBFZkxK?=
 =?utf-8?B?QUwyQnZ1cHAyQ2ZON005L3c4U0p1WVZXZ0t6VlVNUGt0bXAwSUEyM0NFNXRE?=
 =?utf-8?B?aDl6Y2JiKzh0b2lvME01OTZTQWJGdU5wM3pkNFMva1pEdlFweTd0NEczcjFL?=
 =?utf-8?B?dFFFdXVmVU5QZHZGcHQ5cXBvZGs0ZGNCNVU3WUkrS003RjhvNnhLZFJtVW1F?=
 =?utf-8?B?U1c4NWJTZTduZmFZTkN5empOMkVVZDh0dkZEbUJIWUVsK1BhR1dXcW0xdGtM?=
 =?utf-8?B?ZWk5Z3hHd3JHOVYra09heWgvM3RJelJOWmE1dTludHVSU043UlJMRDVrenJQ?=
 =?utf-8?B?ak9zWmd2bjMyalMveWszdm5hak95aDZOcXl2N1JhMFcrL2t5bGoxbVFIWmhv?=
 =?utf-8?B?dU5zaGgwTk40aFByaWVHUW8wRnA0RDlCVWZ4a0xVVXBKeG5sUHJMbGt6aFk5?=
 =?utf-8?B?Z1VpZGNMbTdlNXBqNzZ1WUROYjVXem9FYVJhWjErZlFvdk12Q1BsWFcvMFAv?=
 =?utf-8?B?NThEQWlTeFRJcW5FbVhDYk1Rdy9UaGlJbnozQmlMUHNYZThXRDVTU3Vjakhu?=
 =?utf-8?B?dE43c0wxWnZjMEtqRVM5bmI4MHRzR2R0aTBCa3Vjcng2NjhtNXpac0t1NnZP?=
 =?utf-8?B?Sm02dFhjVlJsVDg5dFo5TmZNTTVHT0E3Q05qTFIvVWVicDB2blZIbGRPSlNv?=
 =?utf-8?B?TUpzazdheTZJOUVrRktRUjlqVTB5OWM4L2RGWjBJblgvRVdibzEzc3dwYkY3?=
 =?utf-8?B?RFZNc0EvTm1qRnJTdU16dWsyZWRVNThGR0V3c29hSWREdU03R1o4V0hzUDNx?=
 =?utf-8?B?elR6N0NoQVlsZHNGR1ZBdTdyRWJHTW9oMjFtY0ZIK2ltZ3NHWXNiMjdFS2Ew?=
 =?utf-8?B?MU9HN1ljL1VxOTBndU92MXo1a2VxUnBCSU00RWIvRVVvLzVHOVF5MmdYaW8x?=
 =?utf-8?B?RmN4L2FVNWQ4VHpEemFSTTlkNWF2c0ZkWFRLODAyMldUUjZ4YXd5TWVzU1pB?=
 =?utf-8?B?dU9lY1E1S29JN1BXcTZCV0R0MW1pdUhSTWtCZUZCZWovWVZ1b1lHNlJQOExF?=
 =?utf-8?B?eXZlZjZESDgycXo0NzhCSkpnRzVKZ1pqR3EzblVVckpGVXEza0dwZkhGVDkz?=
 =?utf-8?B?RlBCbEFsRWp2ZXFFaE1uUmRmQ20rMnFGRW5KZDNLTkZwaVM2OWJUY3k2ODZS?=
 =?utf-8?B?WmNzRENDTUhCeWlkaDN4OUhBQ1UydTh3M1orMG5YcE1mbGFrSFJ3bGRvNllP?=
 =?utf-8?B?elhnd2ZkZFhDWnRTanpvYmhtc0tkalNrQW1kZTh6WmpLaFNLSDhGb2tQcDZ1?=
 =?utf-8?B?WWIyM2hUSXJmWURHeWZDWVhzaTBDSHU1dGt0Sm1SM0hKUVpyNk9DSkh4eXg2?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4b1432-2a13-49c2-305d-08dd056c5c18
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 11:55:11.9853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWGe9Vj/8N4GxMhrshcmPKncjRmNuTjNArHfH+YGbQjrGReGWLcs8CmiA4oKp5D4q84V6B7nBatMwIpR7Tyq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 22-10-2024 09:23 pm, Imre Deak wrote:
> Add a function to wait for a page flip completion providing the timeout
> duration. This is required by the next patch, using an Intel HW specific
> pageflip timeout.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   lib/igt_kms.c | 21 +++++++++++++++++----
>   lib/igt_kms.h |  1 +
>   2 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99231d6e7..81a9930a2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2377,15 +2377,16 @@ unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
>   }
>   
>   /**
> - * kmstest_wait_for_pageflip:
> + * kmstest_wait_for_pageflip_timeout:
>    * @fd: Opened drm file descriptor
> + * @timeout_us: timeout used for waiting
>    *
>    * Blocks until pageflip is completed
>    */
> -void kmstest_wait_for_pageflip(int fd)
> +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us)
>   {
>   	drmEventContext evctx = { .version = 2 };
> -	struct timeval timeout = { .tv_sec = 0, .tv_usec = 50000 };
> +	struct timeval timeout = { .tv_sec = 0, .tv_usec = timeout_us };
>   	fd_set fds;
>   	int ret;
>   
> @@ -2398,7 +2399,8 @@ void kmstest_wait_for_pageflip(int fd)
>   	} while (ret < 0 && errno == EINTR);
>   
>   	igt_fail_on_f(ret == 0,
> -		     "Exceeded timeout (50ms) while waiting for a pageflip\n");
> +		     "Exceeded timeout (%" PRIu64 " us) while waiting for a pageflip\n",
> +		     timeout_us);
>   
>   	igt_assert_f(ret == 1,
>   		     "Waiting for pageflip failed with %d from select(drmfd)\n",
> @@ -2407,6 +2409,17 @@ void kmstest_wait_for_pageflip(int fd)
>   	igt_assert(drmHandleEvent(fd, &evctx) == 0);
>   }
>   
> +/**
> + * kmstest_wait_for_pageflip:
> + * @fd: Opened drm file descriptor
> + *
> + * Blocks until pageflip is completed using a 50 ms timeout.
> + */
> +void kmstest_wait_for_pageflip(int fd)
> +{
> +	kmstest_wait_for_pageflip_timeout(fd, 50000);
> +}
> +
>   /**
>    * kms_has_vblank:
>    * @fd: DRM fd
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fc7e4cda1..57e62d86c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -310,6 +310,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t handle, uint64_t size,
>   			      unsigned prot);
>   void kmstest_dumb_destroy(int fd, uint32_t handle);
>   void kmstest_wait_for_pageflip(int fd);
> +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
>   unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
>   
>   bool kms_has_vblank(int fd);
