Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2065C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 11:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5126610E277;
	Mon, 31 Aug 2026 11:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPkj20Wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8A410E277
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788175434; x=1819711434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ibglkaDAKai/xDO8Cd5pzrRVzXgdB8/iIxT/UrRcx7A=;
 b=FPkj20WpPFlHbDBVaQDh4O7DmX4mhTc4MOYlOQdE7A5X9eYU8EHquEpz
 9AgCUqmX2vqvLBEQ6yQLCFP8t12Pj7BDrE9tEhEVrcLxPxBPwIjSDhNz0
 GWfm/fqZdiNqYCJrGPe7hnvHDfZjcfkGUX8bqydKz4UMq26kiWnNqVm1e
 1itbTs6U4SJsxseDYFjanOhHe7WIsRiXu6wp81Jt98ENKUXTI4bePo4iO
 NnjY0y+13hyTGyeL2nGvlQfHOZ2ynJYEQlGZg3nOosAQvZjR7Jvc396GQ
 b5DygIAhrBxB3+z1W51S6WzZG/on0/rhj16SpgYF/UCfpbY44UFFaweAZ w==;
X-CSE-ConnectionGUID: kd7h56KoRAq2yrJArslTWQ==
X-CSE-MsgGUID: KM42QNVNTGGgVICaQtztdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88591156"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88591156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:23:53 -0700
X-CSE-ConnectionGUID: OOqX5wYbSESDKKwnNcU2FA==
X-CSE-MsgGUID: z5oeetHsRdyVZHYQvFyJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="265052303"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:23:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:23:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 04:23:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utqPs6GJpyCZspt3EKxdZMdHRSuGnu5/HVYXl7ygXtJjo2opDNUsgoc4itvhOJ45vkFq/3GaAqPMW2mMMrGs6LUEtMNLIXvhQnXJgZjE2b5uGxGjruDb5TQ/RdZ7qYGfHDOZ3liqIH8GJvyfrmmvV29DN6Uzk9FBIykPQSqnW5u7CH4+1kVVT2FSaTzuqnTDYCCgaaOKwEB21GsLlT380AkM3ZW4/7D5QphriB5Uj3rFFHwlflg4yvDDoH4N/WnpfJYfuWGhhC0XLQebYSeWCH0qdOmE5eDnX6rdZRB2bdJZ5wlLvmMKHk1a+LOx4c3x241lx0zjSCLz/+lH6PtuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdJrq6Lp0pc0gWbVLnZ70iRKDQ1N5WCpGxh+GW2wWvw=;
 b=Ee0KxHp25bUWE/SMFaMx99F6wDfsgzsQpEya0OHDRaowkf7iPWY1TaTNqrkGfwIv8deQjsFdyFNw+3MFSlqhp0tcbEHNoJhljOfzyDJugtfrvLTUZmCA1Kb2k+/uZS5Fq0JUHttwSY7F7iyriwZmLlstg/8m8x0EagpzetmFE/3qwrqcUQKA8YWxCI6gTJeG+I2DWVrodQGNSsWbqNt3oyB8RYqG0ZZzaNURuD7R9w56Oy7G8urOrl8wT6leUgJrUaTlIyemw02L918OytTvptGe5x2AYrYXKsGiEv4Xd+6nFOYb1Ve+gt306twh0MnFbH0+k6Bx6z6rcYeOHHAy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DS4PPF0084F97E3.namprd11.prod.outlook.com (2603:10b6:f:fc02::4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:23:50 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 11:23:50 +0000
Message-ID: <cb23ad61-d462-48cc-953c-5b053c0152c8@intel.com>
Date: Mon, 31 Aug 2026 16:53:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-5-ravi.kishore.koppuravuri@intel.com>
 <84ff04863f33194b966399d4593d1363339866d7@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <84ff04863f33194b966399d4593d1363339866d7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DS4PPF0084F97E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 602cc501-d9c2-4790-68cb-08df075254c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 9k+ATIKzdJood05ddOAup7nAFrWyr9Yd/VTrDNkIpUF1LXAY5RAW2uR02nCrHWrWxgqxhkISrtAC/NW3d0Rqq4hNUt6E60Tud39QV5zEFWJ94ZvXMvpSQ2fHY0B1Wmr5YlJYzsBk8oL9lk2MHlt/yz3DxlnJZydEgifKKgdotil6cZQscC9zAfl0zVN/8IGQHabVLyIp/xzm+pHK75srSD6rv+aNuvzKXgTa65TDrxXN0Ehr6Gp9knKdfIZwFT5tWq+wDFiaYXDn46f37Mp4KncMetvRBa3CDOVcvWibf9VwkDAj7yPXgaKWhLxAw7HMkvZbK+pMWg04eIVczlNzgy1M39RlQRJutodzh5CdLUvgZ0CaJQVna+4jjN40RwY3YTSF8DiUaM65zcA846IlWROq2SbO8MvM6J2depYNdg7Wp6WaSjFwm7R0C95zwqaA4ZPlYHMox7p9YHn0MrjILj1jdiTW0jM7joH5BdS9g9xqBQ0OAYHHnGKJOrsHZvGwFKVvh2Z7LBlXx6Fhg6L9C+/uifxTntCliYPBMxL6ItK16LGNXB6BIpUXXGkDmYMfAYJ9Cqhe2N54/D0i08CVakIoPsXTYLS5e4tFTy18xvbKos7atr1yGScyvnBeNrp4nobsrmBqE3a9808Kt5u4M22c94tQQ/ksUMT4LBGylt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hyYk12ckYyVmh0UGhFVVhiaHpuOVhGNE50Mi9LYTU3Rk1XNjhMRll3M1dP?=
 =?utf-8?B?K2ZzNWxyUUliMjJnYkZvd3paVkFrZU5LbW5sV0xyeFpBbWpEcURXcDEwRzYx?=
 =?utf-8?B?SWVMalMveU4zd3VTKytCQ2VBWWNPK1JabFNQSi9yczJXaHZiSTIxUEJXR2Jq?=
 =?utf-8?B?RHZOQytROWVlRUgwdXN4UEwraW5RT0JCTkcvdnh4L2VYRFYrZDFoQUorRXJC?=
 =?utf-8?B?bXBKWHowaU1CbUZEVUR5Qlc2OW9xV21HVU1ncmlPcGlFK1VWTy9nVUszOWhL?=
 =?utf-8?B?VHkzS3J5SEJkQ0VkeXJwUVhUc294SUxUclZHYno2TURlU1JTNTVJQVc2dnpa?=
 =?utf-8?B?SktTVHFFMzlrRVMrQ3R2UnJ5d3hEb1luRk54WkZVVk9RZi9obWdSTVdXQTc2?=
 =?utf-8?B?ZnQxd1ladmdoQTRJNzh5bkQrNGp4emlEa2RTQTZmMnFJRDg1RVZ0ZnBSWWVk?=
 =?utf-8?B?WXN6ZDU5Uk5yaEEzMFEwVElRT25uUjVzeTg2RHcwYWd3NWhhaGRzY0FSd0U1?=
 =?utf-8?B?cStPNDdLVm5wRGczblFvUWcwSWlselZtVm4vc3hmZ04xbld5VFhibU41YWhs?=
 =?utf-8?B?OG03WlpBSCs1ZWphV2NYZW1BczdVRGZEZzVYNWpKck1jMzc5TTB4bWNyNGMz?=
 =?utf-8?B?Z0FaVHorSFRkbGdTanJvRHc1elhnOWU0bGRLUVI1QjZlUVhBTzJnMk9wTnN0?=
 =?utf-8?B?NXo0d0dYMzdFanZzRmFsNHJRdmFsZUlLSHlqVWNMNjM2Q1RVQ0haTERLT2FL?=
 =?utf-8?B?dWtJSGtMb0wweGlsY2Z5K0J1NGwzL1ZLSzZwWHR3U3N6MGFGbmx3RmJ5UlY5?=
 =?utf-8?B?OGdFZ0tSOHdTYWZjU0xmRkRmNE9KdmgrUVZGZm00cjE4MkZBR0hhZnRLUjg5?=
 =?utf-8?B?bWI4ZkMvTVJkQ0dNSHZxL3VmdTZOVmJQWnN5cmozTWpZUEhISi9oOEtVRDl2?=
 =?utf-8?B?c2cxUjBoRGE0VGdrL3pHUXRnOUxvL21xKzRidXF5c0p1djRyb1N0YWxDc28w?=
 =?utf-8?B?YnU5TTQrenU3NVJtcnNTTUZkM1VpUmoxNzFNN1R5M0tleU9tZkk0c3M1bGlW?=
 =?utf-8?B?RVRHWGJMdldQZERDcWxWeWppWkVWbnhoL29hT1IvTVpRekdSK1Z0a1p6akM5?=
 =?utf-8?B?NGJYbG43YTBtTmhKOXA1Z1M1MnY2RzlBNjVrOVZaN3ZKOVRZam5KamdoSVVw?=
 =?utf-8?B?NWpaU0ZTUS9pZGJiVDRSb0RMemlUVUMxbFhzcjlvREcxOTFyY3hFbjY4cWpt?=
 =?utf-8?B?dkM0MjB3c21iajJ4bnArajFOMnNHQ2d1YU9yb2hNVHVCTlp0UXg1TW40RVk0?=
 =?utf-8?B?NytTMEVWOFhQbXVnL1REdmc4azY0SHpaNElLQlZTUnVHTWx4djNjaGZZZDZ0?=
 =?utf-8?B?enRpTElXcytCQmpNb0hINmNxVmNwVlgxRnJ3Sk5FMjNzRVdpOHlvRjJzVUYr?=
 =?utf-8?B?V3orTmFIRy9VTVNRM0Z1VUl2MlVPRWxlT1hUZjNJTmFqUzFnZ0ZQQm9UYlZQ?=
 =?utf-8?B?ZHZvSGUySXVlSnk0Z1RPdFB2K0Y2Nk5aTytjWCtNNkswV2NzVlI1L1F6cXZv?=
 =?utf-8?B?MU5uTzE0eXNDeTdBdWt0WG5LSCsvS0lYRVhUM2RlcWpYczlkOEY3STl2SVhR?=
 =?utf-8?B?WEJ2YzhVc2JaRmhweUw4UmtPZEc4RXRlK0lTQjRoclRjTXBVemRaUm1OcWMy?=
 =?utf-8?B?TzFKbWJyNGJqdEFlei85V1UxWHltbFhhcjMzV05weUR5RW04MzRHZDBXazlI?=
 =?utf-8?B?R0d5L08yMTVXc3l4aXhmV3VKTXN3V2k3dlJyaVh6eEk3YXZwdjRIQXVHL01W?=
 =?utf-8?B?RkFPY1BsSHNYSXdTN3V6V1cyczlZaGdDL3BOeTNRMUZyQndIVWE5Wm04Y01Y?=
 =?utf-8?B?azVvd2hBYWJmNlJoeHhQZDBUNzlKNDNHenhsdEllODJjblc0Y2VQVVlYNUJq?=
 =?utf-8?B?M2RFWjNBTmVYa1dibFZ5NTE2ZU1YeUNxVTZ5aTNhOGtqMExwek5ZSFJDZ3c4?=
 =?utf-8?B?cmVzUS9ZK0d4U0JQd1FDaDdHNVozSnJOTWtjczdSUXFFdXh0SW1WbUVXU3dk?=
 =?utf-8?B?SjFZaHUrNE9GU3pPVVVSbW9ock9DYWh2OGUzaU9YY3FteEN0YjJvblBJbHlu?=
 =?utf-8?B?K01lVEl1MnIwaUlkdWJzRUN6aFp5d1E2YStuaDFZOTVlUThzYVk0TWgzZkYz?=
 =?utf-8?B?RDZMWW12b21rWU4yZFl6M3pVaFVmOGh6TWFjM01iMW1CTWw2V1hEdW5GTDU3?=
 =?utf-8?B?SDE0STdEeUxJa3hGS3dOcUI4Z0MwQVdkK3RMK1hIOW9jcnhIdGtGZFIzclpK?=
 =?utf-8?B?Nm13K2p5V0toT2h4WG9FTzlIM3FnZU52R0RXaURSR3h6UFlWYTFCR0Q5STJP?=
 =?utf-8?Q?0Vqsx1FPhzQ71iaPMcAwIvkl1lQbc96+vCuVN?=
X-Exchange-RoutingPolicyChecked: xtx3mggp3Lp/BQM5jbfDIzwygPavwYEKtaxO2xY5R/cavqF5TZIsNWu4YbD4WGeesVRwy9jj/ePbXeVluXOA4YggyYxDUyzAzsFZBTuOqAV3ZgWnM7bIEiPgjyy/leUjtP0RjygJtT+2Xxf7japDFnJKcidrr/G0srz3HDRU158NQoFsQl2+7qYqDFX94jCjV79JsramV+weLjDlAhbtMNMEQ34DszCy2D3rf3mX970aJMgGOOT50MbXb56ttg+C/TcWNOsRjFcomtd5ZnjGjrwsKFXrJXSJTwAT/RfMEOs0eVFXiG+w6/MyAY67FkEAYVUjhXE65TpmpM/JvO2pXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 602cc501-d9c2-4790-68cb-08df075254c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:23:50.1944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqJO+VMhUa22yx5MJC4jNSPi8msQ2BZ+vk8FNiRlVW0cWXG3nq68UHPM9j7fDLTd6QbNXVvfl/oMV1SMKkj7SQi19y7JhtKMCScWCPBVCTZPYjdlxb/UCHCWrKCxAf6S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0084F97E3
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


On 31-08-2026 14:18, Jani Nikula wrote:
> On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>     Added a check whether error_value updated by valid callback or not
>>     Added a check whether response required for the command or not
>> ---
>> ---
>>   lib/igt_drm_netlink.c | 264 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |  14 +++
>>   2 files changed, 276 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index fec1639b4..76223f3de 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <stdbool.h>
>>   #include <stdint.h>
>> +#include <errno.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -17,6 +18,225 @@
>>   #include "igt_core.h"
>>   #include "igt_drm_netlink.h"
>>   
>> +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +	struct app_context *ctx = arg;
>> +	struct nlmsghdr *nlh;
>> +	struct genlmsghdr *gnlh;
>> +	int ret;
>> +
>> +	nlh = nlmsg_hdr(msg);
>> +	gnlh = nlmsg_data(nlh);
>> +
>> +	switch (gnlh->cmd) {
>> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +		ret = genlmsg_parse(nlh, 0, attrs,
>> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +		if (ret < 0)
>> +			return NL_SKIP;
>> +
>> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +			return NL_SKIP;
>> +
>> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +		break;
>> +	}
>> +	default:
>> +		return NL_SKIP;
>> +	}
>> +
>> +	ctx->reply_received = true;
>> +	if (ctx->ack_received)
>> +		ctx->cmd_done = true;
>> +
>> +	return NL_OK;
>> +}
>> +
>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
>> +{
>> +	struct app_context *ctx = arg;
>> +
>> +	ctx->last_nl_error = err->error;
>> +	ctx->cmd_done = true;
>> +
>> +	return NL_STOP;
>> +}
>> +
>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>> +{
>> +	struct app_context *ctx = arg;
>> +
>> +	ctx->ack_received = true;
>> +	if (!ctx->response_required || ctx->reply_received)
>> +		ctx->cmd_done = true;
>> +
>> +	return NL_STOP;
>> +}
>> +
>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>> +{
>> +	struct app_context *ctx = arg;
>> +
>> +	ctx->cmd_done = true;
>> +
>> +	return NL_STOP;
>> +}
>> +
>> +static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>> +				struct nl_cb *cb,
>> +				struct nl_msg *msg)
>> +{
>> +	int ret;
>> +
>> +	ret = nl_send_auto(ctx->sock, msg);
>> +	nlmsg_free(msg);
>> +	if (ret < 0) {
>> +		nl_cb_put(cb);
>> +		return ret;
>> +	}
>> +
>> +	/* NL Reply and ACK arrive as separate responses */
>> +	while (!ctx->cmd_done) {
>> +		ret = nl_recvmsgs(ctx->sock, cb);
>> +		if (ret < 0)
>> +			break;
>> +	}
>> +	nl_cb_put(cb);
>> +
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>> +{
>> +	struct nl_cb *cb;
>> +	struct nl_msg *msg;
>> +	void *msg_head;
>> +	int ret;
>> +
>> +	msg = nlmsg_alloc();
>> +	if (!msg)
>> +		return -ENOMEM;
>> +
>> +	ctx->last_nl_error = 0;
>> +	ctx->cmd_done = false;
>> +	ctx->reply_received = false;
>> +	ctx->ack_received = false;
>> +	ctx->response_required = false;
>> +
>> +	msg_head = genlmsg_put(msg,
>> +			       NL_AUTO_PORT,
>> +			       NL_AUTO_SEQ,
>> +			       ctx->family_id,
>> +			       0,
>> +			       NLM_F_REQUEST | NLM_F_ACK,
>> +			       cmd,
>> +			       DRM_RAS_FAMILY_VERSION);
>> +	if (!msg_head) {
>> +		nlmsg_free(msg);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	switch (cmd) {
>> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +		ctx->response_required = true;
>> +		ret = nla_put_u32(msg,
>> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +				  ctx->node_id);
>> +		if (ret < 0) {
>> +			nlmsg_free(msg);
>> +			return ret;
>> +		}
>> +
>> +		ret = nla_put_u32(msg,
>> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +				  ctx->error_id);
>> +		if (ret < 0) {
>> +			nlmsg_free(msg);
>> +			return ret;
>> +		}
>> +		break;
>> +	default:
>> +		nlmsg_free(msg);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +	if (!cb) {
>> +		nlmsg_free(msg);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	ret = register_callbacks(cb, ctx);
>> +	if (ret < 0) {
>> +		nl_cb_put(cb);
>> +		nlmsg_free(msg);
>> +		return ret;
>> +	}
>> +
>> +	return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +static int init_app_context(struct app_context *ctx)
>> +{
>> +	if (!ctx)
>> +		return -EINVAL;
>> +
>> +	ctx->sock = NULL;
>> +	ctx->node_id = UINT32_MAX;
>> +	ctx->error_id = UINT32_MAX;
>> +	ctx->error_value = 0;
>> +	ctx->last_nl_error = 0;
>> +	ctx->cmd_done = false;
>> +	ctx->reply_received = false;
>> +	ctx->ack_received = false;
>> +	ctx->response_required = false;
>> +	ctx->family_id = -1;
>> +
>> +	return 0;
>> +}
>> +
>> +static void cleanup_app_context(struct app_context *ctx)
>> +{
>> +	if (!ctx)
>> +		return;
>> +
>> +	ctx->sock = NULL;
>> +	ctx->node_id = UINT32_MAX;
>> +	ctx->error_id = UINT32_MAX;
>> +	ctx->error_value = 0;
>> +	ctx->last_nl_error = 0;
>> +	ctx->cmd_done = false;
>> +	ctx->reply_received = false;
>> +	ctx->ack_received = false;
>> +	ctx->response_required = false;
>> +	ctx->family_id = -1;
>> +}
>> +
>>   void igt_cleanup_nl_socket(struct app_context *ctx)
>>   {
>>   	if (!ctx || !ctx->sock)
>> @@ -24,14 +244,20 @@ void igt_cleanup_nl_socket(struct app_context *ctx)
>>   
>>   	nl_close(ctx->sock);
>>   	nl_socket_free(ctx->sock);
>> -	ctx->sock = NULL;
>> -	ctx->family_id = -1;
>> +
>> +	cleanup_app_context(ctx);
>>   
>>   	igt_debug("Cleaned up netlink socket.\n");
>>   }
>>   
>>   int igt_init_nl_socket(struct app_context *ctx)
>>   {
>> +	int ret;
>> +
>> +	ret = init_app_context(ctx);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>   	ctx->sock = nl_socket_alloc();
>>   	if (!ctx->sock)
>>   		return -1;
>> @@ -58,3 +284,37 @@ int igt_init_nl_socket(struct app_context *ctx)
>>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>>   	return 0;
>>   }
>> +
>> +int igt_get_error_counter(struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +		return -EINVAL;
>> +
>> +	if (ctx->node_id == UINT32_MAX ||
>> +	    ctx->error_id == UINT32_MAX ||
>> +	    ctx->error_id == 0) {
>> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>> +			 "node_id should be >= 0 and error_id should be >= 1.\n",
>> +			 ctx->node_id, ctx->error_id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ctx->error_value = UINT32_MAX;
>> +
>> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ctx->error_value == UINT32_MAX) {
>> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
>> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +	}
>> +
>> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
>> +		  ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index f681a3a81..92ac665e2 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -9,17 +9,31 @@
>>   #include <stdbool.h>
>>   #include <stdint.h>
> Okay so this change should add them I guess.
Ok. I will update it accordingly. Thanks
>
>>   
>> +#include <linux/genetlink.h>
>> +
>> +#include <netlink/attr.h>
>> +#include <netlink/handlers.h>
>> +#include <netlink/msg.h>
> None of these are used here though.
Ok. I will update it accordingly. Thanks
>
>>   #include <netlink/netlink.h>
>>   
>>   #include <drm-uapi/drm_ras.h>
>>   
>>   struct app_context {
>>   	struct nl_sock *sock;
>> +	uint32_t node_id;
>> +	uint32_t error_id;
>> +	uint32_t error_value;
>> +	int last_nl_error;
>> +	bool cmd_done;
>> +	bool reply_received;
>> +	bool ack_received;
>> +	bool response_required;
>>   	int family_id;
>>   };
>>   
>>   void igt_cleanup_nl_socket(struct app_context *ctx);
>>   int igt_init_nl_socket(struct app_context *ctx);
>> +int igt_get_error_counter(struct app_context *ctx);
> This is really inconsistent naming, though.

igt_init_nl_socket() and igt_cleanup_nl_socket() are the library 
functions to initialize and cleanup the netlink socket.

igt_get_error_counter() is the library function to get the error counter.

"igt_" is the prefix used for all the library functions, as suggested by 
Kamil.

I am not clear why this naming is inconsistent. Could you please 
elaborate your suggestion here.

Thanks.

>
>>   
>>   #endif /* IGT_DRM_NETLINK_H */
