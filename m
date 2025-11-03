Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD367CCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 09:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7F710E050;
	Mon,  3 Nov 2025 09:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRJLcQ+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B160710E050
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762161069; x=1793697069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O14F82xxGpc/rdc6I1trZhWkvZAuvCM6CgVMK9u2+s8=;
 b=nRJLcQ+klJ+y91Ml+ivBUO94h73u0HOs0z8lnroBXkqHguhRkEKjJd1q
 gI78H+qlq+MrbshzN3kl5lkNHUyo9YffBrJrncjCTJhP97if4yWAWZhS/
 +7Yw4UKgfwjgn/boQtj6gcQWeaS8OquGOSVDBG42aFd/B7ij7M50Cc6KA
 s2zsM4MUjTLo3FK+9EX/dd8ObuBQ/+ZAlbC6IZBIs5aiDjXmxc0fHK04Q
 75Y1UDjk6EL0xFNXrecK1ILBxrRMZPX5Ywi5yzNPBcyoBKgrWxru33CQS
 q0ac1Dgf9ZFTN3M/6kuxF/M71q1av+X3I0FEyLNv7AfOPsp/PRVNMT4qS A==;
X-CSE-ConnectionGUID: rPYxeyQkRGynnCby709DWg==
X-CSE-MsgGUID: Vhjz6c1XTcGTXMA94VATQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63928944"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="63928944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:11:09 -0800
X-CSE-ConnectionGUID: DIYtjgZ3SwiXOC3Dz0bc2g==
X-CSE-MsgGUID: FXf0MNagTd2l/32l/th7eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186769884"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:11:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 01:11:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 01:11:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 01:11:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEwNMuCajPdkVcn26aItYOBcmbKuiiM2di4FwEJwdgVmFrAdwZQKpKCCf+ths4RxD2N/Sg9pbCkUOCyx8jeffwqG/LBF/Q1JZuSRuDDxtpZsFshySm46KCW+LEs1l5+bOTvLrmufGa9X3ucVgsjeKcyt1iG0v98OdN4TKDPRDjLKfTDLssaRIqoLPa69evwg1z5uov6NvL5mg8PdePSfYJIDd3SUjt0o/hjIUQW/M4lpOWQf2IznrgSn+JrbhG/9onHlJ+vVCK/hUxYbIX4nLcPtB6OzAyCFA/Zc7NlcFp+saMOhBX1XqXOcHOo2aZsSkoT+rYAyWTeLQ6gcwbeOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3eg3l6xmfkaZ2gog94CgGnqTFdJhmRuOhuqUSY2D5w=;
 b=aD8r9/4r6ZwczS2xRd7bHzDAeL4nJdqWwQwNKzqApL/wNEw3LYjHEmPxeatadHpldOcz8NccPW6R7SVkIdaZmsNWLXenDbikSgOck7S4XkHzeSR1vfpeDNMnAmmNW72U/N1EjLTJphqlv6Be+wxd3J4Iho2bAnJKUzSYII68Th1LczlESBYjg2CkObCOdmvF6cCCDu0mjLBE2SwAd9o0ZD0Vwz3CaMRD9fz8kDIkGRXPtp5jVgnpnGIHeVIPvxgyexpH9INJjpZ1Y5PP8uEAezYvymTScD5oBG4n7E98w1v95wI1QJZSSQb3VdfbqOo3MM2JGbPF9llGPgOjkRTO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 09:11:07 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 09:11:07 +0000
Message-ID: <5e1aa4d3-0411-45f9-85ef-6082bed6125c@intel.com>
Date: Mon, 3 Nov 2025 14:40:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v9,1/3] tests/intel/xe_survivability: Add new
 xe_survivability test for i2c adapter
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251031093452.3842245-5-sk.anirban@intel.com>
 <20251031093452.3842245-6-sk.anirban@intel.com>
 <b062d08d-8405-4b14-9c64-7379c21da21b@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <b062d08d-8405-4b14-9c64-7379c21da21b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb47535-5b95-41f0-6fa8-08de1ab8ebb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2hwM3Rsa2hkejUvVjJTVnBMZ0pYSEpjempaeHNoaFIrcUQxb1FvUUtJN0E0?=
 =?utf-8?B?cUV5SytEVkFQT0FMWVJFUERLck1lWUVlY3ltNWpQK1E4RlF3eittSExTa0pM?=
 =?utf-8?B?aWhHZEZUV3dIWFJzbVhJejgrUHgyWXNSRzNXTGNtTXZENFZTSmFJMHZ2RHVW?=
 =?utf-8?B?RFVxK1R0V050cXg0cHFoWTdHQmVZalJFYmFIa0hBbzJGSDZkSkVoZ1RwTlB0?=
 =?utf-8?B?K1VBaTBWR1hVNnFRZnBLM09YZ0U5d3FZbUxnRGd2Y1Y3Z29vQW55emZWQmRz?=
 =?utf-8?B?dTJDT0xYTWs1TEtuQ0Z3OEZCKzl5WkFTN0VVN3hENlJhNnBUelBLR1dIVjBE?=
 =?utf-8?B?YkJvS1V4d3QwaHFONmZLVXVpcHdZTElwM0doUkVGWml3VUtSWHZSbTNxNzZC?=
 =?utf-8?B?K1J6dEd2VVZvVGNZRXVCZjlNWHFMV0U1QXJ2NXBMVXhiMEU3V0hGRmozNlZm?=
 =?utf-8?B?SjlvNHo2SVBxVVpvYVVyWUhnZkorZUppU1hvVjZXTGd1Wk8ySlhHa25Gdytt?=
 =?utf-8?B?SGduSWpIU3l6M1pkaDlmSmM3by9TL2V4cEVWZzlaMi9nRUVUdG1KZlBiOTlI?=
 =?utf-8?B?dElGNUNrVVNMWllFZnFuNGhmb0xQNWRINkNBNnFvSU1BSHJTWkplS0Flekln?=
 =?utf-8?B?MEpEaC92a0JVanhMd0RSU3QxYmhQTHhvNnRhR08rbVFhUG85S0pKOGpIQm94?=
 =?utf-8?B?TE5SRHA5VU1SRmgvYTdwdkxlQlZ5RWxFOWJCdE1JalZUbGxHRmR6ZE5uMmRP?=
 =?utf-8?B?SHBwb3pLV0tPSUhaVUszbDI1eWFycVdST3pKTVovOGlTYXZ4WklDSEhqMTUy?=
 =?utf-8?B?cXg1bGhVditmTTlwRWdGRDhrNEdQdktLTVhDMEMrRVpNbWVlbWdZc05VbWNL?=
 =?utf-8?B?NThvNlBTdVhvWStpdnR1QU5YamZUTFFRSVloRlBGb2lzK3UzWGlkV0NmQ0NE?=
 =?utf-8?B?TXdsZGlKNjFLdUxtTlFnVGhnemVsdXNwNEdMYzV1cGt1Q3VWTmVZZmhmNXZx?=
 =?utf-8?B?cWIyNUJpVjl3R21CS2FITXp6L2xOaHhOOHNWK1ZjNDVXeWl0THlGWE1TMGgz?=
 =?utf-8?B?aWlFZXZRd2dYTDdKbFNJTWdWZjk4WDI0MExFUmQ4YWp0VFRya2NkTXE1RjBI?=
 =?utf-8?B?bDh3SkhFaEJZY3V1ZGxIMVh5VXk0MjZCeHpGZnNOQXIxSEhacUFqK1NqVEF2?=
 =?utf-8?B?bis3a1pkcGRad0VMUHE3ajNBZnhMY0xkeldxYit4cWZPQk1NeXVwcWtlZ1BN?=
 =?utf-8?B?Z2ZOTnhLMllqS0NZditGMUMrcG44MmhHOGZrVFExTUxsTGt5V2xtRGxUMjl5?=
 =?utf-8?B?NnhpbXpvR1JWL1gyZVpHbmN3WnRiSU1lTHc5dTFWOGgwRUplTGNuN3I1NDhD?=
 =?utf-8?B?Qi9qQjF2Vk1JSTUvTVFDZnpKN1JycmpldlcxVHFTRVBYMFp2bGRZbWo4ZWJH?=
 =?utf-8?B?dGF3UzBzZkxlQ2Izb2Vac3ptQVVhbzBsekQ4eGJZWmxvWEFEYWJEV2txLzRx?=
 =?utf-8?B?Q3AzdU01cldBcHlrM0VORmNFV245eVcya2x6UWlMRituTjZ5akhnRkwxbEdh?=
 =?utf-8?B?TVdmQzJvK0ZuczhCMS9LbnZ4ZjRPTGNyMXpHSmc0VE45a1o0WUQ2bHd1RXZE?=
 =?utf-8?B?UVNpa2VENFVySVR4RGVSUnFkQU9zSTN1STB1Rm1NeVJEazgzOWo5VzJJbVZv?=
 =?utf-8?B?Y2dsQTZHV0VHcVd2b1FhL3VYL3I5VlFvVk9JQ0tpYjhXTmJQZHhSZkZWM0FC?=
 =?utf-8?B?djlkclJaejh1Zno0TjdGTWg1RlNURk9JNjFCQTdZYmpJaWs4WTRIMUNEdjlH?=
 =?utf-8?B?ZlZHeDkrV2pONFdpOEdJakFXZnN3ZE94V3kwYXZCM25meGw3UXBlTzdZTjI3?=
 =?utf-8?B?U21vL0pmWkZjWnpRc3pMUEtkbTVTRUd2QjJ4eXQ2KzRzd1RnRlFIeUtJam5h?=
 =?utf-8?Q?rOqNtEKyc0Lo+t/vTNf/xvWltSymGgX+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pJcm1JYkdYUzBzazN6MENPYmNpQk9yOGgxV0crMW45cnNVdHZiK1JwY3kw?=
 =?utf-8?B?R0VXSk5kbEFkSno3dFdxMVM3UWsvcXdBMjZPa3hzcGhLcStJYnZYaC9aSU5m?=
 =?utf-8?B?Z1VHQWd0TVhHbThIWDZhd0tEM0t0ZFpCYmxIc3VBN0Z5cTdveWNSVzhLbG9v?=
 =?utf-8?B?QmczOXY4S1FsSkxmbENmeVAwLzRkMEQzQjZ6c2NhenlMNFNZbHExbzZkNkdM?=
 =?utf-8?B?UDRSdWs5aVFYNW9IUVhSNnhxU1dHZUJ6WGhZOHZGL3JTK042Z1JPZUo4R1Nj?=
 =?utf-8?B?NzRsMHRsSW5EZ3g4UXdKSk4xMTNRK3FMOFU2M1BZYS9HTU9wUmQ3cCtDak5i?=
 =?utf-8?B?VTU4cXFtOERVamtSV2hwVWh4U2lJcDErQ1BUVUFlMDBSZ0VZbUN6S1F2L040?=
 =?utf-8?B?RDJydVZjU0c1MHVhYkxNR3MwVExwM1dCTC90d1FaL3ZtN2k1ZXFOdTFRU0pu?=
 =?utf-8?B?cVNoM1JZNVpqVy93WnNoUGNCUDVJalZXQmo3dFV0T2xtQVJXbUdlYjlhUjRt?=
 =?utf-8?B?TnEvVWNYcnRBN2MzSFc4eGFMcVNoVnh3WEZiclE4TmxkTHh2QWROVEZmTlNY?=
 =?utf-8?B?dC84dlEyOURVS1ltM3R3cG94Mnp3YzlnZ3M4L0tSSm9GSFpoU25NbkxwRjZH?=
 =?utf-8?B?VGNhRXQ2M2J6ZVd6V245Y2ZUNVBxa0JaUU5BVUhNVjJIVkRYSWh0SUU3R0J5?=
 =?utf-8?B?QVIzVkZwdWlYNktZR1hzeXRWMjVQaEdvelJyZ0g2dlRFVFFONkhUaEluRnhk?=
 =?utf-8?B?NWIrQkUzMi9YUGRBY1l1U0o1bUxQazRaeUR3dWd0cUFhWHVERGJqMEo1UHlY?=
 =?utf-8?B?SU1CS3A1b2xSY1BkaDI2UjJJVzk4T1lCNFZWaWRlT2h0SmZUa0M4N2E5Zzd0?=
 =?utf-8?B?RkI4Zk10dzJqenBxcm1nd1FlOCs5bjVYTHhBbGZSWjdmeXlyaDhBZk1xblpK?=
 =?utf-8?B?UHFGZldaNTNUZUFMQVU0UEFRSWJaZWc5cGFXdXR4ZUs2ZkR4R1VkcUZhSWhZ?=
 =?utf-8?B?bmhxMWgzSlZJeGRqbEVFZmoyZHFvZ1VwRzk3Q2lsSmNrU21ycGNRQjFuRnY3?=
 =?utf-8?B?ME9LNWV5RWhmd1dlMkllOEVGbmlURzVvVkdsRFhrSHRMQ29ibmZzbFRYOUts?=
 =?utf-8?B?TlgybERlZHRVMzFYaTdnblJ6azZFSnNzU1ZmYVVsN0QxZnRuOENCTjRFb3hH?=
 =?utf-8?B?Tjc5cGlPOGtoSE1GWDRQb2NuQjZOd0ZaWGQ4a0pEZ3gwb2lWc0NrbEFhak1t?=
 =?utf-8?B?dnB6d0hDajFTSDRFSC81Qmp3YkRvbEcxL21Gc3hGT2hEWlJtWm1pWlFKVVo3?=
 =?utf-8?B?WjNvSDdjaFZPQXpZVjcvVGRzbUVDaVd6R1d2VHRpMWRMcC8ySndEclhNTFJ2?=
 =?utf-8?B?WkZtWXNvV0I4RU16aCs1SEY4cjNoKzJVN3htQzY3bHNrSGtkd041MjdnRFdk?=
 =?utf-8?B?dkI4ZlNJNlhQNWdXK2txU2NEZkJmVUpxRHhXRnJIbHBzTlpVTXhHVlJrYWVJ?=
 =?utf-8?B?T3BzZlhOTUtSY2tCKzZlVGJqeEVwMm41NVEzQmNyY1Jjb05oVnYvc1pZWlB2?=
 =?utf-8?B?ckY0WEhpTEtqdmlETk5UK2t2cTRYd0FoRlBjNU8vUVhac3JVaFRDL3Zad3c5?=
 =?utf-8?B?d1hQelltZzYxM3B3cEhBdkRsNUxqZGx0MURhMC9ERmxMeGJ6ODFleUJ3Smgw?=
 =?utf-8?B?NWpwZEFOWXd3K0xCZHlHOGVTa3hMREEyakx2Y2o3cnVSU3JsVWtWQjRIbXRp?=
 =?utf-8?B?N1F1ZGlOWmkvQUhGSUQwL1gzVnVxLzFMcjNJN2x0cTFTMWllZFRrd2FTaVcv?=
 =?utf-8?B?VVJhZndkby9HSmRQNWhFU1RpZTRBZnd5emlSM1NqRmJicW5xMXpoUndjSklx?=
 =?utf-8?B?TVpIdXg0VHBhQ0w1NjAzay82OS95TzZJMTdyRzhSMHV0b1gvbFNJekZRSlJZ?=
 =?utf-8?B?MUR2NlY2T3cxR2dxQy92N0VlUlp2QnFJYWFhZXB0aDZIbkJGNzkyMkNNRUlJ?=
 =?utf-8?B?RUNmZ1BTdDBrZDg3ZURtV3FKNjBHRmpBWkVsUWk1bDZoWVpGdFRjSXhoUHZl?=
 =?utf-8?B?a0hxdUwrN2gzeG5VRDkyQVVid2ZlSlFyRTJjUTZ6cXcwT0xGVytiSjV0QkdX?=
 =?utf-8?Q?4lUORbyYMFs4DJf0VRVNcQKWo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb47535-5b95-41f0-6fa8-08de1ab8ebb9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 09:11:06.9604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TzgitF0nagWgWJW4D0BU+jU/ETQethI6jrThLx+cXlmwEZhBdPb9SgPKYG0jlYnN6LXKl9oepce1+La87faPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

Hi Riana,

On 03-11-2025 11:50, Riana Tauro wrote:
> Hi Anirban
>
> On 10/31/2025 3:04 PM, Sk Anirban wrote:
>> Add i2c adapter presence check in survivability mode to ensure
>> the Add-In Management Controller (AMC) can receive firmware updates
>> when the device is in survivability mode.
>>
>> v2: Create new file for test (Riana)
>> v3: Update subject, description, nitpick (Kamil)
>>      Use drm_close_driver() (Kamil)
>> v4: Update test details (Riana)
>>      Align with xe_configfs (Riana)
>>      Create separate function for sysfs (Riana)
>> v5: Remove duplicate close(fd) (Riana)
>>      Modify fixture (Riana)
>>      Move assert to function (Riana)
>> v6: Move VF check (Riana)
>> v7: Clear survivability mode (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_survivability.c | 157 +++++++++++++++++++++++++++++++++
>>   tests/meson.build              |   1 +
>>   2 files changed, 158 insertions(+)
>>   create mode 100644 tests/intel/xe_survivability.c
>>
>> diff --git a/tests/intel/xe_survivability.c 
>> b/tests/intel/xe_survivability.c
>> new file mode 100644
>> index 000000000..b20192958
>> --- /dev/null
>> +++ b/tests/intel/xe_survivability.c
>> @@ -0,0 +1,157 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +#include <limits.h>
>> +
>> +#include "igt.h"
>> +#include "igt_configfs.h"
>> +#include "igt_device.h"
>> +#include "igt_fs.h"
>> +#include "igt_kmod.h"
>> +#include "igt_sriov_device.h"
>> +#include "igt_sysfs.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * TEST: Comprehensive survivability mode testing
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: Telemetry
>> + * Functionality: survivability mode
>> + * Description: Validate survivability mode functionality
>> + * Test category: Functional tests
>> + *
>> + * SUBTEST: i2c-functionality
>> + * Description: Validate i2c adapter functionality in survivability 
>> mode
>> + */
>> +
>> +static char bus_addr[NAME_MAX];
>> +
>> +static bool check_survivability_mode_sysfs(void)
>> +{
>> +    char path[PATH_MAX];
>> +    int fd;
>> +
>> +    snprintf(path, PATH_MAX, 
>> "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
>> +    fd = open(path, O_RDONLY);
>> +    igt_assert_f(fd >= 0, "Survivability mode not set\n");
>> +    close(fd);
>> +    return true;
>> +}
>> +
>> +static int find_i2c_adapter(struct pci_device *pci_xe)
>> +{
>> +    char device_path[PATH_MAX];
>> +    struct dirent *dirent;
>> +    int i2c_adapter = -1;
>> +    DIR *device_dir;
>> +    int ret;
>> +
>> +    igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
>> +
>> +    snprintf(device_path, sizeof(device_path), 
>> "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
>> +         "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
>> +    device_dir = opendir(device_path);
>> +
>> +    if (!device_dir)
>> +        return -1;
>> +
>> +    while ((dirent = readdir(device_dir))) {
>> +        if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
>> +            ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
>> +            igt_assert_f(ret == 1, "Failed to parse i2c adapter 
>> number");
>> +            closedir(device_dir);
>> +            return i2c_adapter;
>> +        }
>> +    }
>> +
>> +    closedir(device_dir);
>> +    return i2c_adapter;
>> +}
>> +
>> +static void restore(int sig)
>> +{
>> +    int configfs_fd;
>> +
>> +    igt_kmod_unbind("xe", bus_addr);
>> +
>> +    configfs_fd = igt_configfs_open("xe");
>> +    if (configfs_fd >= 0)
>> +        igt_fs_remove_dir(configfs_fd, bus_addr);
>> +    close(configfs_fd);
>> +
>> +    igt_kmod_bind("xe", bus_addr);
>> +}
>> +
>> +static void set_survivability_mode(int configfs_device_fd, bool value)
>> +{
>> +    igt_kmod_unbind("xe", bus_addr);
>> +    igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", 
>> value);
>> +    igt_kmod_bind("xe", bus_addr);
>> +}
>> +
>> +static void test_i2c_functionality(int configfs_device_fd, struct 
>> pci_device *pci_xe)
>> +{
>> +    if (find_i2c_adapter(pci_xe) >= 0) {
>> +        /* Enable survivability mode */
>> +        set_survivability_mode(configfs_device_fd, true);
>> +
>> +        /* check presence of survivability mode sysfs */
>> +        check_survivability_mode_sysfs();
>> +
>> +        /* Check i2c adapter after survivability mode */
>> +        igt_assert_f(find_i2c_adapter(pci_xe) >= 0,
>> +                 "i2c not initialized\n");
>> +
>> +        set_survivability_mode(configfs_device_fd, false);
>
> Use only this for clear. No need to unbind rebind
> igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
Without unbind the system is throwing error of "resource busy", so as 
discussed with you
I will keep this & below rebind operation will be removed.

Thanks,
Anirban
>
> With that
>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>> +    }
>> +}
>> +
>> +static int create_device_configfs_group(int configfs_fd)
>> +{
>> +    mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>> +    int configfs_device_fd;
>> +
>> +    configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, 
>> mode);
>> +    igt_assert(configfs_device_fd);
>> +
>> +    return configfs_device_fd;
>> +}
>> +
>> +igt_main
>> +{
>> +    int fd, configfs_fd, configfs_device_fd;
>> +    struct pci_device *pci_xe;
>> +    bool vf_device;
>> +
>> +    igt_fixture {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>> +        vf_device = intel_is_vf_device(fd);
>> +        igt_require_f(!vf_device, "survivability mode not supported 
>> in VF\n");
>> +        pci_xe = igt_device_get_pci_device(fd);
>> +        igt_device_get_pci_slot_name(fd, bus_addr);
>> +        configfs_fd = igt_configfs_open("xe");
>> +        igt_require(configfs_fd != -1);
>> +        configfs_device_fd = create_device_configfs_group(configfs_fd);
>> +        igt_install_exit_handler(restore);
>> +    }
>> +
>> +    igt_describe("Validate i2c adapter functionality in 
>> survivability mode");
>> +    igt_subtest("i2c-functionality") {
>> +        test_i2c_functionality(configfs_device_fd, pci_xe);
>> +        drm_close_driver(fd);
>> +        igt_kmod_rebind("xe", bus_addr);
>> +        fd = drm_open_driver(DRIVER_XE);
>> +    }
>> +
>> +    igt_fixture {
>> +        igt_fs_remove_dir(configfs_fd, bus_addr);
>> +        close(configfs_device_fd);
>> +        close(configfs_fd);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 73edd3e71..31487f62e 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -329,6 +329,7 @@ intel_xe_progs = [
>>       'xe_sriov_auto_provisioning',
>>       'xe_sriov_flr',
>>       'xe_sriov_scheduling',
>> +        'xe_survivability',
>>       'xe_sriov_vram',
>>       'xe_sysfs_defaults',
>>       'xe_sysfs_preempt_timeout',
>

