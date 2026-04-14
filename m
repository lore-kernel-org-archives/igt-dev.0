Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03275F9D0C1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 11:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512010E597;
	Tue, 14 Apr 2026 11:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybb5BVnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0110E4ED
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776165593; x=1807701593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bJJRF6EiG7vTfqawK8+goH2EVuOHPXVC5ufzNbZKWww=;
 b=Ybb5BVnJ9gntl4q2Sy/4nhQMrGPjgFBs+pQ4XG8MvskDdZXfVKU8SJr+
 iFx0S/Sz+wrAb7bzVCPC/xZLaC4TlftLGqJc3KZxcyp+g5r9RgwqmXdtU
 XgUOPy+gldfJnrKlpUkaNx7b3hZysiazmHp5it7VfpxD7z/LH8+L+zWfG
 8WQBU7js3QcbF8mXA1pkteVng10EFmN/B5W6VWm3DJy4I6syGfeH8eK9y
 XONN1tNvR57rklYR3JjUaI/XPkPxu999l5PuKX6elKyhG6e79sh+VEbDI
 lwztzGB6XUyeFOtdmmf5o5Sp9Lx3BjxVQwax306X5L/MExvR5Cs2B18cK Q==;
X-CSE-ConnectionGUID: nrQNBc2cShuXE0F1o8su/Q==
X-CSE-MsgGUID: chkfMd5yRnGbEZptevc1Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80712652"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80712652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 04:19:52 -0700
X-CSE-ConnectionGUID: yv0lSwmlTf6fGmF84605dA==
X-CSE-MsgGUID: L8BUE7kgQMSeqVZNckJIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="268039031"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 04:19:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 04:19:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 04:19:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 04:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOLJ3xDaP6P2TAvKrrmbNSyjuG29q73vTvWxmp2jga29CKQrHOMDyAGq93KTTotPSE3WYmSdlb1bsmWqXPsbeOiSsRr3dhtiaqT4PfcbBJdtIB0hKZ/nuUkXUl0nadjtrUXNLeQKt8BCgk/h53FUQtzdbA7sNvmc3JPgkoxIBTgdY4w1c6MD0e5suVRoAzDJJSh8UK5McLCax67Nm17uWKeEQaoUHgt2SIdYxxMJsxIgTQKszuNoOB8U1CTdXHDWnKjvvca9BFaRlIzGcmZcHl7ExTtfLAkoy8mS6xy2LRgXups209pbv1tFl8D87zF0AmvqaeNoW3UIySXABFCJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hpFy6ZhQzbD1QUGz+v3si8a6/OcV8S7Gc1tp+f/zlo=;
 b=lvDtEeobPO9fr8zF81h2Ponhd/Pe3vXEa1s0QgqsUajNQC3sj86H1hYItb0ipeGNvlURwxNxQgxBsQffA2xx3A4yI3kNP0cPRgWwjyee3kxRyZJWyG3316Xm8fGVhKbIR/U1uFj2v5I8y/u6ZtV1AGbLThnSk5CS185owmmCh3UgCHjYFwGilt+s7Pk2PUzJMqFBQb+gw0pqALyFmah7y9YkxOjzuqN5+KXOOehDRey0vJCQJC5Kh7ji4qpdK/ZT50JdX+O44PoSdVHzZW2sPoFRNgGNsdD/AWXMoIyTkLQj7SXNCsf1Ph+UqN4pFGI4fIfN3Qe3QSgjPVlx4nSogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Tue, 14 Apr
 2026 11:19:48 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 11:19:48 +0000
Message-ID: <ce53bed8-5779-4751-95e2-052dd16726e8@intel.com>
Date: Tue, 14 Apr 2026 16:49:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 3/8] tests/intel/xe_madvise: Add
 purged-mmap-blocked subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260414061703.2604112-1-arvind.yadav@intel.com>
 <20260414061703.2604112-4-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260414061703.2604112-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SA2PR11MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 0100ca9c-b94e-40d6-1cd0-08de9a17bd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 0Odd5KxT9sSRhsbV/9/uXjF58KIgQ4jwc1PQI1iqp3b47/mhtrKJfB0YDZ1wKr8XxafYNq3KYMCAhfR+P8yQ49khi1kNWVB/+lIVPSkR5UdOsYT8fUasVdWJxD7UCxGsBXpyspSTNVScoQFKVPLCy7tfKf7XjVaUw35La4euFHPzuKQ27vTPW730+kALE6klNctoTmIs1QEcx5Oyc4BSx7KK2FOcNFmKP9QeUMLi3FND1cL64X0c/WPae7zLfj6QMfvPRmRjJW4S0g12Q5V4DIqpWZt5Kyethxi1IvjGpCqxzMLF98K2q6ImgCxUtzTqQAgP0i7h/vg2LW1Qqbcds/N1Ihv7aM+StwTaCdtcUJ9WvYW1vR0OCHGyEHuQV1UPhhRBbjdzTzx9UrHwjKiU27v0Y4ATkHeNmI/uo9O30NnH4ZK8mnnYRkvwqmQeMQqW5XzzuXVVf7uapXMdUxCUUDYKmSkJVleHwHF18VLJtjfUKP8Q6vFuPq8mA8rjRIBnS2GUWEOrWJrVAUjtLOFUgXeYqySpxHZlfP8kRPgt2Re6ICe1qG83Qqojxi7b7+80ahoaAMI+lGI3KjdAmQyffuU8k6wIXKMmWCieN1Z0cmPsIg/mNFRCTi2Hig/h27ktWuTk3nb6fRFWhNnTB7h/JP4vTcvOLW6TbXrZFpHg74QE8R9BX5PxsLMlNO6y08lQmp36Cx7RcQvT3GQ81YBYWvf9jZu4XJzOgs7NBh+gxKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG1leVFxTUZpakpEQTdUUHhrV1hzOS9pTTFtV29oeDU4Vkg5T0VNUmpWLzRs?=
 =?utf-8?B?RlhlbFdqUHhmMWZZeTRpcEU5b1l5cVNHUVFkYy9NVGJkUUFOTWl0SmthcEFu?=
 =?utf-8?B?THdwNzUxcG5Oa3QybFBCSm55SitBQll1Mld3cXl1QVBXSFJ5d0pVQ3drOEZh?=
 =?utf-8?B?OTJTUlRXdFZYck11bS9NV1VrU05LZzVGdzJOcGRFRzN5Z28wcy82UUJ1b3BH?=
 =?utf-8?B?dlNZUWpabjNDbmE5TDRQc0hxS3pGemdsUThQYVJUclRNWHdxZmZOYTNqTmxJ?=
 =?utf-8?B?R2FJK1UrdVlHRUZxUWRFNkU1R2ZVK2swSDRoK0VnZGVVbkY5Z2Fmcm1qa3lz?=
 =?utf-8?B?c09WUXFVTUxHOWJBSDBiblZ3clkyTnZSbWt3K0pmQXF2V3k4eEgvOTMwOUps?=
 =?utf-8?B?L2g4YlNoaVE4aklJWVVnKzhud1VmaytLMkdkWFhLOFNpTnorL2E4TnlmRDNX?=
 =?utf-8?B?UkN1TkRYL0N2b21ybkVZUzdWM2R3U1o4YU1hTHZuUmI0OVFhamhMY0JlNDJZ?=
 =?utf-8?B?blBSem5CU3JyQTk0MlBDRW11aDFoZkFxcGhJR0tnUGpCUDBVM0tNbmZxVUZs?=
 =?utf-8?B?WEdMVHVvdFJDcjdiNkN3aWNSb2tnS0pYLzU1eDRmZEwvNGtmZE1ZdFhlR2l6?=
 =?utf-8?B?NEYzelFJWWJCMkxrTENqeHh5TEZPenlZZit0cmlpeU1Ld2Q0L3R6UnAzVENE?=
 =?utf-8?B?azJRT2tnc0FyN1laMmJsSkwvQ0VpTWVGbHh6bW1oVnJweUd2M2FsbXA5QURP?=
 =?utf-8?B?YUIwYzBpdmFyTVM5QTk5a3ZPeFNGd0U2cWpMRlN5YUhoSWJxYjB1ZEJCeFgv?=
 =?utf-8?B?a2YybWFwdlZxZGFMQmFqSFRwZEphVzUrSm9FYzVja0pNbnBMMjMySnFJbzlm?=
 =?utf-8?B?N0xVQTNtRy9jeFZLNmFPK0JoUXZPTUxhOERXWnZmOGVWZEMwR0d6WC9qUW1M?=
 =?utf-8?B?aXlINkluU3FOU3hrU3ZJVkl6Y0ZoempEV21nV3dWNDlLMkpKL21BdWVnbzRn?=
 =?utf-8?B?UWRHYWllRStSd3ZpQ2szeGN6QVdVMVpudk1XVGdxdWJPNXF2cWJHMkpURjQ2?=
 =?utf-8?B?SUd4Y2ptWm5sTjRaVVg0VlpyOElLb3YxM1I3UFBvSEFGS1ZPd3kwMzFyK0xm?=
 =?utf-8?B?R09objIxT0ZvSkdxdnJqcjZiNm11VEZ3RjdtZ05yQjhYVTJnNm5mekVuNWV2?=
 =?utf-8?B?YVdBWmVvSEtsZWVxVEJGVmxLNk9XeEtUUC9UQ3NaQWRWbDVYUUFWWmNmQXRq?=
 =?utf-8?B?ZWhZNC9vVERXSG5GUnBOZFh3K2h1dlNzN2h5VWMwY3RXMCtwRkdkdkE2M25K?=
 =?utf-8?B?dE5jR2RoOForaXJZRFNGNUdKVDdjM2hiMU5MOGtVd2QyWjEzc1VsRVJ2VERU?=
 =?utf-8?B?dGZyYUxrU0pHVzZkcnFxOGM2bHRxeWNWVGFBZUZ2UkFDOHJVUFRkdnlSd2Qr?=
 =?utf-8?B?Vm1NMjE0cTh4WFovMXhLTTB5KytobDRPc0dWOGJXN0RwWWxKZHRVNWRCa2tm?=
 =?utf-8?B?UHFLbnk5NGpHcElFdjJ2MUVydmFMaEUwalRnc2dZTVJ5OFcrS3RzbGVTWk9T?=
 =?utf-8?B?TzcwYjFYbE9qUTdJdVhqcGx6TkVTTkhJTlJGZU85VExnTkZxTDUwdm5ubFo3?=
 =?utf-8?B?d1hldHJUVENJdlloUll3WWJCM0FTb0ZtTXFRK1VReU1YVDl2RjlteGlJVGhL?=
 =?utf-8?B?TmhWSG56d1hPTzludFhSNDhxSnoyVURLVmFKa1Erejd4dWRRYlJ1R1lSYkNk?=
 =?utf-8?B?OXZUc3Nhb1dLOFVYdzcrUy9aYzNwK0VlOGIxRnExNmhlWTZFZHMvSGxTb2Ru?=
 =?utf-8?B?Q2IzdHBlTFBWSWxxTW11NE1GT0FKY1pOSWJMK0g5NEtEaE1adzh3bTR3a1ZM?=
 =?utf-8?B?a2FYZlp6dlNZRlpYTTFZdFBWN0kxK1lmeU5uY0NUZWRGQ1oxcmJnYXFpSHNt?=
 =?utf-8?B?WDNIMnJvR1lNQWpBUWk0SDAwb0ZZRnJldXI4Wmp4YlFtSVFjMmRYcVRnR0hn?=
 =?utf-8?B?QnIyS1RwdW50K1VJYzA5Z2xUZXViR1c0ZmxTOUt6LytKYmFXWEZudW5JMUlm?=
 =?utf-8?B?bHNNMG1TNHFaUEpSSHZ4ZnNYa3J3b29kWFU1OXZ2U0RoL0locjRjVG1YMnZY?=
 =?utf-8?B?VWd5WXZjcnhSZFFkaVgrTE85Ukk5MkZxNWdGcU1tb0MwZmlRYk8vSHQ5aE12?=
 =?utf-8?B?UUV2M3h1d3pFa0xScnhwOUpBdWk2NFpFdGdpNjRQSWY1ajJyYjRPTHlUN1M5?=
 =?utf-8?B?aDJrd012QXNkOXd0SFdySkRWV2pPM3BQMUNtVjZYTjJYUnd6aFFMSGZZWHlC?=
 =?utf-8?B?Y3M3dXhxUm9rNkFvRml3cC9YdWxsKzRhV0tVMmNkWm1aQ1ZRbFp3Zz09?=
X-Exchange-RoutingPolicyChecked: AbxEbrXi1IHZv2HOy3KZ9i6pZeW0qwskjAHCHxDrnW2wHnUtYajpQbhhxDauw2UB35oAklKFiMikwNphGqigOHL3oC3QB2HTwOXXaJBbvnbA6ZmcCAbMM0H2o+OyF+YfXE1VngTAZAVKyaZ7AiBqjfLbD6quK1M/cXKfHCw5KuEGAwFZSH5euGhkednuDJ+G8AwOEslpWDiSysFFE68AoYgVs9wliB/h8K11YvDJ0JQwSumPVpXp5ctS7a/qMlP1f1LDeGYcKFrnNMPF4o9sCQ8Btrid6iNuWB2+3pK7CW5xBLcGUZhz/2T+dRDnfhjN6IpC0/i4bE3MC3+LZ8EIZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0100ca9c-b94e-40d6-1cd0-08de9a17bd21
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:19:48.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhvoXF0dalF8ANM4OqDUUhn7kaHu1tRm0m3xvWNzN1da6AhMS0P/YDpWqKf1k4DPzpx3UacUMGj+xl148eZf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
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


On 4/14/2026 11:46 AM, Arvind Yadav wrote:
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
> v7:
>    - Moved trigger_memory_pressure() and purgeable_mark_and_verify_purged()
>      here. (Nishit)
>    - Use xe_has_vram() instead of checking xe_visible_vram_size() > 0 for
>      clearer dGPU/iGPU detection. (Nishit)
>    - Fix purgeable_mark_and_verify_purged(): handle retained == 0 from
>      DONTNEED (BO already purged) as success instead of incorrectly
>      returning false. (Nishit)
>    - Drop unused vm parameter from trigger_memory_pressure(). (Nishit)
>
> v10:
>    - iGPU: use igt_purge_vm_caches() to trigger shrinker directly
>      instead of flooding system RAM (avoids OOM on low-memory machines).
>    - Simplified comments in trigger_memory_pressure().
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 139 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 139 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 2c8c27fa9..14e39ff96 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -59,6 +59,139 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>   	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>   }
>   
> +/**
> + * trigger_memory_pressure - Force kernel to reclaim DONTNEED BOs
> + * @fd: DRM file descriptor
> + *
> + * dGPU: over-fill VRAM by ~50 % so TTM evicts purgeable BOs.
> + * iGPU: poke the shrinker via igt_purge_vm_caches() (avoids OOM).
> + */
> +static void trigger_memory_pressure(int fd)
> +{
> +	uint64_t mem_size, overpressure;
> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
> +	int max_objs, n = 0;
> +	uint32_t *handles;
> +	uint64_t total;
> +	void *p;
> +	uint32_t handle, vm;
> +
> +	/* iGPU: use the shrinker, no need to flood system RAM */
> +	if (!xe_has_vram(fd)) {
> +		igt_purge_vm_caches(fd);
> +		return;
> +	}
> +
> +	/* dGPU: fill VRAM + 50 % to force TTM eviction */
> +	mem_size = xe_visible_vram_size(fd, 0);
> +	overpressure = mem_size / 2;
> +	if (overpressure < (64 << 20))
> +		overpressure = 64 << 20;
> +
> +	/* Separate VM so pressure BOs don't interfere with the test */
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	max_objs = (mem_size + overpressure) / chunk + 1;
> +	handles = malloc(max_objs * sizeof(*handles));
> +	igt_assert(handles);
> +
> +	total = 0;
> +	while (total < mem_size + overpressure && n < max_objs) {
> +		uint32_t err;
> +
> +		err = __xe_bo_create(fd, vm, chunk,
> +				     vram_if_possible(fd, 0),
> +				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				     NULL, &handle);
> +		if (err) /* Out of VRAM — sufficient pressure achieved */
> +			break;
> +
> +		handles[n++] = handle;
> +		total += chunk;
> +
> +		p = xe_bo_map(fd, handle, chunk);
> +		igt_assert(p != MAP_FAILED);
> +
> +		/* Fault in all pages so they actually consume VRAM */
> +		memset(p, 0xCD, chunk);
> +		munmap(p, chunk);
> +	}
> +
> +	/* Allow shrinker time to process pressure */
> +	usleep(100000);
> +
> +	for (int i = 0; i < n; i++)
> +		gem_close(fd, handles[i]);
> +
> +	free(handles);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
> + * @fd: DRM file descriptor
> + * @vm: VM handle
> + * @addr: Virtual address of the BO
> + * @size: Size of the BO
> + *
> + * Returns true if the BO was purged under memory pressure.
> + */
> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
> +{
> +	uint32_t retained;
> +
> +	/* Mark as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	if (retained == 0)
> +		return true; /* Already purged */
> +
> +	/* Trigger memory pressure */
> +	trigger_memory_pressure(fd);
> +
> +	/* Verify purged */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	return retained == 0;
> +}
> +
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
> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
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
> @@ -115,6 +248,12 @@ int igt_main()
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

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

