Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9394EF4EDE
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 12:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508B510E14E;
	Mon,  6 Apr 2026 12:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KD9av+xN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612E10E14E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775478868; x=1807014868;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YP1StJfByy05GppY7RrFHCAgbKQNQXg2P/lSUtuUls8=;
 b=KD9av+xN0IZ8IwHqXL3QhWB4g0CjjEcTaNqxas6bujdFTK0C+36yjonG
 XwarFN5anyuH7RjCKur+8tR/el2GLu33z9aOVa73lJdW6QGhy+HNWk17A
 j6fQTsrK0zj+s6oL07HSkbNe1mFVx8cW/GSbklFIXFRKA5OpKR+4cRPyG
 my705qZsm3sxceR5121VRL/7fnpuknxYBqI0YSm3WMVSlZomet2g/M2p9
 N9dibHOQV9JHj0eRSW/+2KOxjG5guA2ma53UGjQ96WRIEfHT0Tgn9gBLx
 ST67a69BoVKuhcuVKlvZRL+AAEPrRnyvE+AAU6V6f4eN3x8HM9yjiz+hP A==;
X-CSE-ConnectionGUID: FUd6NL5hSpuZkeC6kOJfog==
X-CSE-MsgGUID: TzeuxcfhQB+wrOMJGZmFNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76438480"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76438480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:34:27 -0700
X-CSE-ConnectionGUID: xVKF5SzZRDWuHTjUXjI7Kg==
X-CSE-MsgGUID: /xwaZprvSXKTxKw43Lb+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232805307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:34:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:34:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 05:34:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miLqplW8gm8QsGsnfC9kLMfCjwQgRbQF0C0Tmwk2aS4rcTtCmifS5EuMzVeicMTM5mxw7hldIoYjx8RP152+MbJEc5ghpCEn6HgElfN4EvoJMzKMNhmQroR0ck6LJBNqPUp8UJfTXieMgN4fKlek1wf8pIMyP51RdL8vgACH1cARHpehh+5iH4a7qc6b7FANOoD6TH1tm7bKVRuPym/avskJoKqc1sLNp5MSNhwJIBq7E8LDiPlNpc/ndEwJXIX8MnM+ykQfwNeKy5tIhgNbrV/0Uv827+Ibezdf3sYv9EFO5UtFm+VmWBzwU9UFZ8l+bPLw//A4cBynzW8OQZiz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFzI4ze6Fu5ow0sSUvczaNwlSe8eGUdti0t/8nFrYJs=;
 b=I07wMqW3QuaATpt2R1JqbzqMv8z4yjYCGT96vMf0Bnwp/9weMSpl/sodCaSRKGttrnxGY5lVrZgzjUpDWJ0aY3NhxKrPI6bZzVZPNx/n9C2GunE0pQJW3XTAIOu5QOmrsSG28tW5x61TdDTgR1MpnwPZ3lJq6iukAoDUK5T72w8UE7IW9aPv9FhOXZ4FvIOw5K5BdxA7VYpfqFjp4v92JWIOS+MNc7vMY5GJq9kvwbcAG9LC5XkG7j9KqABrGt4CBZrtdDp7h6O+6KHI471aKvbQXzGPcd4uWBrvsneRwrlA+MBeJbCyaolmtQhk3YoJr13IOzUB/gOwsXyR3wOlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 12:34:25 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 12:34:25 +0000
Message-ID: <41012de6-8a70-49ed-9332-1746598c8e51@intel.com>
Date: Mon, 6 Apr 2026 18:04:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 4/9] tests/intel/xe_madvise: Add
 purged-mmap-blocked subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-5-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0219.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e01f8d-e9ef-4c8c-48b9-08de93d8d63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: upPU02MigEQxYMF1XkUCN0rAqy56NEG+BIAT0Vnm3zFeGWoiuapR5UPM+fYMWmezFhhr9ep67NIMiWbF1XfgFqVLq0Icp/6EqFaLSTECw8r+82+JTqI/EVrAM2gWONVfGJDGOwUdG3vXebYJqFf9J9jAvwW2bEOBGvf3ajIA0fOeDfaOapiYQ3FBVzI+mlVE8Ef2Q1DqtJq8v4y+EOCnZEk/J1UdWcUS8WPgJchyfijq5egP84lLHu1lowCVMAi5q8UeAvJIiRNtz7rK3WYiNrke+T8UTjP1v6+xWfJtjZCmA9oylzkocHc9YOOW+OHUGz+5hsRYMP1baXF7TklcFwdptQTVZPnhI7zzYiFU/JI2moT9rE8efN1TNIBuQdMMfGedhynybr9/zxcr3x4L33EExShISfBBhghbKhpjax6cR7ZGabZUS4n16KGccqalirKgoA/su/tKmJmPffjrITX6DZY5DKXbCdvKKxXdsvrzSRTQRMsSuptW1CSZu/HgUu/vBRUv+hW6O04iENupr5lTOS8qkiNzGqY2D0Jq3aBmUpTub/yvBBBuI/qrG6CdhneLMJNQvzOhDKlWN/M8pzCx8qTjZre9jxKhDUxZHr1iZ7Q5kCC0P+316saJRltAIaldTqAqiJkjFhKy5yO7a7/+dpN6wTU2it+2ljYTCraPrr3tHvUANB0IUXa8ZtHDxtLo7mcEGTBuBYXVK7pg1RF7la/ells3MaAYwqrI5M4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlBqK0pYVFFIN0hKMnA4elA5NWFweHpBQy95SFJxT3dSOFM1anNqMUlCQm00?=
 =?utf-8?B?K05XRzRLanVQbnlxQzVBM2JhRjB3MGxZMUx3STdVSENKT0Ric0FIeG8rQ3M5?=
 =?utf-8?B?MG5CZWlDQ3VLT0NCOGRKQ2Z3T0Z5bm8vUWlUeTdKeVJpR1Fnd1RtYnpEaFF0?=
 =?utf-8?B?bjJjb3UraHNIQk1sbmJDeDB0d0xUaldEbTExNkhySFQ2TkxpTkFBWS9yRXV2?=
 =?utf-8?B?T003NDFIdVRDR0QwRExtSFVaVFlWYXFoWG1RKzBNYldDWTNNbEtPbm9aRFBx?=
 =?utf-8?B?eDhESUkyalJWQUtleFRFRUNlUVZ0UWhSVGJCTitwV2luTVg5ZkxSbDVWblQr?=
 =?utf-8?B?bzd1dWxEbkYvcnhKL2xZWGhoV1VwbWEzN01wMWZVN0pWd1pqNXNsV211SHY0?=
 =?utf-8?B?OUtCS3kzNTdpL08zYmMwWHBlb0RDQWJNTjdtbkE1NzVBOEtQOFg4UjhTZkF4?=
 =?utf-8?B?ekt6N0RhS0U5cFVaa0lTZkJtZkk5QllWRmkrbjBWT2d3QkpLR0tJd3h0MW44?=
 =?utf-8?B?QitiK1hGY3hWVEUxWStEcjBEdDZEdkcwMTNsdmtYbXVrNmV2Zm52bGo3UXVZ?=
 =?utf-8?B?Z2Iybnd1Vy9iWXVhckNuOVJwZm12NzhObjBkL2tQMGZ0Wks2RlpLbkpPaC9k?=
 =?utf-8?B?ZzgweVdFTjlBYi9kLzQwcUZySEs1T203cHp2bDhYZzZpUW5EUFlZMzFPTWlz?=
 =?utf-8?B?dzVGT05Sdy9QOExOZWJSMkxXMnZPOEcxS05OOFVLZE1ZMFJSdmNnTTVFQ2Jy?=
 =?utf-8?B?aDNWVXlGMWNvVVZ5T1dTZDljMUtJbEN3VjA3NHR3c1JqRU1NVk9qcVMxZGNJ?=
 =?utf-8?B?NnMyejUxT2hVZUl5T2hkV2tTQVpiMlVTdlA3SG5XdThyWnFMU1hXK0dWSFlr?=
 =?utf-8?B?dHlLeUc5eTJwUXh4amlsMy9tb0FLNHE5Q21yVGdhZmdiRHY2Y1pNWCtTRHpz?=
 =?utf-8?B?U1orSFh1ZXNWZnFUOFhFV1N2czZnVThYaFFhRVpGYXltNjl6b2x4Ulg2TS9T?=
 =?utf-8?B?SytNakZKc2Z2LzFRQ2p6TlZnUUZtamd3Uy9VUDViWVRmMUE4TlpzaS9tdEgz?=
 =?utf-8?B?cUFnUi9rTkJpUGZtcHE2VWMxcTBRbmpjNUNJVmhzbFQ5UHVWWS9IcVN1bDEw?=
 =?utf-8?B?R05WNXU1bEh5cGZkK0pWOUVrWWthTTE0Tm9nOWVqZVZ5UUtUUUVBMjdjbEt0?=
 =?utf-8?B?dTUvVnprOVNyR2ZHeFdqYUJ4SDg1eGllRU1mcHNUN01iOTZSb2V1SDdMT1Ev?=
 =?utf-8?B?NjhqdXRHc2RjWjRCekhEbGZEU2d3N0ZLZTlnQnFGbS9QUEtvdDh6TEtWMzlr?=
 =?utf-8?B?VlBLV3VRWUFwcUdoMXNmclR3L29mbUpFVkpEc1dqZy8reEE3MVF1TWlZZlJ3?=
 =?utf-8?B?MzhiVllIbzJPUjZlcjZQUjY1eHhvY3loeHJSS0NHemlpVUtaalNSVTlERG9I?=
 =?utf-8?B?TGFZem9iMHJQaldZcTVDUjNSRE5YZUttVGhqTDBpeFJCQjQyUEhYOGF6TWh3?=
 =?utf-8?B?cnZaeVV6cHpLcW91TS9EU1V2by96NjdnMitzOHlYZklMODBWUnhwNzBqM3lL?=
 =?utf-8?B?NzViWVVsU05ET1c3VU5RSm8vSVNsOVdKTE84b2gxdFZidjcrem4vZU5ERVZj?=
 =?utf-8?B?U1M3RDJMQ3Jva05KeDZZek5MRXdJb3Q0NDhObzV6ZmxFYjZzWjJ3cW43K0ZY?=
 =?utf-8?B?V3F2c0Q5aHE2UjVOd2RDb3Z6bHU2V0hMb0l0WHBHQTJ2ai9Hb3VTalBneUkx?=
 =?utf-8?B?K1JLRVc0NVk5emRYRW5KNVpEb3pBK01CWUZJdnhFWEVuM3NDWWNzY2hmdzJI?=
 =?utf-8?B?WFNRdXhUOEU5K2h1L2pFV1VMOUllaGtMZWdJVHFaRTFBcEYyWS9mYUR6WFd6?=
 =?utf-8?B?YloxZ3F1M3p6T1ZnQmRHR2xyNGQxUENBWm1nZjhvcjlmTHBCM1lFSW81SFNR?=
 =?utf-8?B?N1hzaHBtU3FvOFdnZ1Y3N3lHWlAxajlka2x1eTc2RWtwUnJIcVp0YmsvZEhy?=
 =?utf-8?B?S2dkR0sxZXA5MUFJSnRwTGxGMXRmNU1WMXNqeHU4eTBRV3A4eEh4cFkvNHA1?=
 =?utf-8?B?Y2RCZ0ZodXQ1ODJGWE1MMVdEMURrd0tHVEYweW1Hdlp4MWdjN1g5S3AyMTdt?=
 =?utf-8?B?cDc4alF0NGFyc290VDRQdVdJOWFWWkhiMW5wbnBKTnhVVGpaQzhRck4xSmR5?=
 =?utf-8?B?QTNWSTA3OVF2MHE3ZitqN21EanNVcWVqZTZWYklaU3AyanZYYkxhYzRUWm5Y?=
 =?utf-8?B?MWk0ZVlPVGpJVDV3dlRxUnNPbGNxWG1ZUGlrc2pTbmZhT216cGhYdTNHWUVj?=
 =?utf-8?B?NFZnWHNxU096a05vN1Vjb2lXeHF6cmgvaHFsVEUyVWVMT0R1OXNRUWdQYXFy?=
 =?utf-8?Q?jkaVJwGL6W4EkE/s=3D?=
X-Exchange-RoutingPolicyChecked: sUG9ZZE9T/xqvC0Hqn+M0oTqQvcO4jPwEN4IcGAANozmaie2Myl7U+/oMQqJXD9wJfUdTdloS4DZvMAF8JBJV+VKpfZiR7IuZW5WUrB5aw6NuSZWM3OgFop1uz51wuIu4jSUA8sKn/Kar1sctOwFNezXCSATQMcM+KjLa3WB1KcEmBR2f7jmcI6aeh7PIwzxku/njLUpYzchNsYsQ2Q+sgYR+mhNRQdZBQMn+2DHwULbpiCyIMR3AhEj9jON9U65l9EgOsB8Vpio80vY2FmY+N48EsPopWxAQlBcH9Zw7BH7vXoe/LqKXtwI1bnc6x0aFbQczXg3HPP1hAy4z5/nOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e01f8d-e9ef-4c8c-48b9-08de93d8d63a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 12:34:25.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO2Ln/8EMjh5GpDEkcGrQnLAGAmGyjWroT6UYT3gnqgg+dpfhXc1QGA26KfURxdRCQfMbQKxZ561DZXL5DbpUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> Add a new purged-mmap-blocked subtest that triggers an actual purge
> via memory pressure and verifies that mmap() fails with -EINVAL once
> the BO backing store has been permanently discarded.
>
> The purgeable check moved from xe_gem_mmap_offset_ioctl()
> into a new xe_gem_object_mmap() callback, so the blocking point is now
> mmap() itself rather than the mmap offset ioctl:
>
>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET: always succeeds regardless of
>      purgeable state (just returns the pre-allocated offset)
>    - mmap() on DONTNEED BO: fails with -EBUSY (temporary state)
>    - mmap() on purged BO: fails with -EINVAL (permanent, no backing store)
>
> v5:
>    - Add purged-mmap-blocked subtest to verify mmap is blocked after
>      BO backing store is permanently purged.
>
> v6:
>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET always succeeds; the purgeable check
>      now happens in xe_gem_object_mmap() at mmap() time. For purged BOs,
>      assert mmap() fails with -EINVAL.
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 42 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index de4a6e34c..81e05b6d4 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -170,6 +170,42 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>   	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>   }
>   
> +/**
> + * SUBTEST: purged-mmap-blocked
> + * Description: After BO is purged, verify mmap() fails with -EINVAL
> + * Test category: functionality test
> + */
> +static void test_purged_mmap_blocked(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_gem_mmap_offset mmo = {};
> +	void *ptr;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {

This function should be defined in this patch. Going through 
implementation available in Patch-3/9. In that below code used

     vram_size = xe_visible_vram_size(fd, 0);

What it returns in igfx platforms? Instead we can use

/* Purgeable BO either in VRAM or SMEM */
mem_size = xe_has_vram(pf_fd)?xe_visible_vram_size(fd, 
0):igt_get_total_ram_mb() << 20;
         if (vram_size > 0) {
                 /* dGPU: pressure VRAM to trigger purgeable reclaim */
                 mem_size = vram_size;
         } else {
                 /*
                  * iGPU: purgeable BOs reside in system memory. Use *total*
                  * RAM (not just available) as the baseline so that we 
always
                  * over-commit regardless of how much is already in use.
                  */
                 mem_size = igt_get_total_ram_mb() << 20;
         }

> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, 
uint64_t addr, size_t size) --> this should be part of this patch
{
         uint32_t retained;

         /* Mark as DONTNEED */
         retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
  DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);

         if (retained != 1)

So here if BO was purged after above call it'll return 0, so if (0 != 1) 
will be true and it'll return false.

                 return false;

         /* Trigger memory pressure */
         trigger_memory_pressure(fd, vm);

         /* Verify purged */
         retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
  DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
         return retained == 0;

}

static void test_purged_mmap_blocked(int fd)
{
         uint32_t bo, vm;
         uint64_t addr = PURGEABLE_ADDR;
         size_t bo_size = PURGEABLE_BO_SIZE;
         struct drm_xe_gem_mmap_offset mmo = {};
         void *ptr;

         purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
         if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {

Here if returned false from above which is basically if BO was purged 
retained  = 0 then skip is called which is not the intention
                 gem_close(fd, bo);
                 xe_vm_destroy(fd, vm);
                 igt_skip("Unable to induce purge on this platform/config");
         }

         /*
          * Getting the mmap offset is always allowed regardless of 
purgeable
          * state - the blocking happens at mmap() time 
(xe_gem_object_mmap).
          * For a purged BO, mmap() must fail with -EINVAL (no backing 
store).
          */
         mmo.handle = bo;
         igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, 
&mmo), 0);

         ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, 
fd, mmo.offset);
         igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
         igt_assert_eq(errno, EINVAL);

         gem_close(fd, bo);
         xe_vm_destroy(fd, vm);
}


> +
> +	/*
> +	 * Getting the mmap offset is always allowed regardless of purgeable
> +	 * state - the blocking happens at mmap() time (xe_gem_object_mmap).
> +	 * For a purged BO, mmap() must fail with -EINVAL (no backing store).
> +	 */
> +	mmo.handle = bo;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -226,6 +262,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("purged-mmap-blocked")
> +		xe_for_each_engine(fd, hwe) {
> +			test_purged_mmap_blocked(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);
