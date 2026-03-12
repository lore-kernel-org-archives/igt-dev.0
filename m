Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29785FED2E7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F510E9D8;
	Thu, 12 Mar 2026 08:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDT7/7+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AF410E9D8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302945; x=1804838945;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pcpl5GW15Xipy6g+wIAdB+X0X84Lq8x9S8pZ4vGj1g0=;
 b=hDT7/7+wDHdaSizeJ17t3ogidfbZGjN6Faj1cP9fP9/rr0vZLBrYV55w
 zs/wUDkiqEX9owzY4voYplsIb8g0laUhCVS1yiTnl99PyP6tt6ogui61D
 VHc0aH0FPm4kbAySouec8kkEXePRcWCdO/gOcKnoZbdyUV0423/27zYsn
 3vHkjLdjl6csfUbeTSZG9p7hUIfMQBHBQezVAPlbkpR0Wt1fIZYaUAAjO
 luG4UA/qSxoApU0USCQNxGamsluh2zxasMtpXwRY+L68sIjqeVfI7BBoz
 2eFSxrKGXv40fNmkL5G2T5LR3t1dwm36k/NJHkZxuQ99lvmvATpA7U92A w==;
X-CSE-ConnectionGUID: ks0ET+tYRWe4owB+9+mkCA==
X-CSE-MsgGUID: HrlB0ktmRu2azlym6myD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74501733"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74501733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:09:04 -0700
X-CSE-ConnectionGUID: wX5AvwDDR5CV8phrXobijw==
X-CSE-MsgGUID: oIDqzAO7QhirE1X91Vue/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220007431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:09:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:09:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 01:09:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxUyd5eL3cZemJv5Ew0hr2EaiqZQwopvOo/LfFzn2FxEddqVcKHiDDHiyMz2dXhZoYF/3Y7sj0WDZKNXsxC5VR0ArnSmDT/zmLXhng9Vcy3F51+40VwnE78bY1+FrRS4tqAP2MNDfq7zxP+jg9re4Cyhop1hVuAigFnz56ckGMT7JY3nVXFy4D+NAQTUBoeuEJO4XcrB5zbcBKOxjjtiTPb4yUZFBGxbxyIPfCBZcYQA8vlfwCj7y88TWX2Bma6hNMFIi9ZnairExH6d6uyKL/UcFOJlcz8EvlJqs/14hRNPqE1Zasymyn8RYTxJ/+ka6zqBjXGbUyeq5f8GygY9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWUQ0WfzJDgxEUFh2P3MQ+rbhZwWkdNAKWLkTsM4d1Q=;
 b=JMpnbgo8yxWMDEB955IQ5u5YAQ1tnu0GldXsRlp3OmtdcMJXnx2AK880B9vJbO3XOVAa5UTu3i+rKnfCTuRqVFIoulUPzDBBXZnEyLDbq6vLXE9PzddVxq5ANCtk+Lae6xCVb94el4u4bHZMgkVl+SzZx/IcQQtKrf1m45fUtF2r2lZvjJ5N79bSQcYSR6LYKXdO4ZveeVnr/WTM8OEAXspeJJ1bwd1sPUbWJiCk9C64zHHgnAyfGHyL031D7SmATatEJCBQhrWS6PStR160h1eu4GsIomWpevUMfmGdotP3DHbaxOTreYBJeqXVu104rFfQsrjCV8ysspqhZuMvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 08:08:59 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 08:08:59 +0000
Message-ID: <8f9c5b0f-a7dc-41b1-a65b-d7480abd119a@intel.com>
Date: Thu, 12 Mar 2026 13:38:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/2] tests/ci: Add NVL Display blocklist to
 meson.build
To: Aditya Chauhan <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
 <20260312074832.51575-3-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260312074832.51575-3-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::30) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7b37b5-5be9-43e0-9f15-08de800e9d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: CuaKUz1g5mwBWG5rWG+lpiochq4XZn7wCu19B39ZDK7+/+k9eZg/hEeROfmqrE+7k9r3AEBBy0dQnMlqmsoRWIfXOQb9NwxB/5Ucv4czA/CMe8FM83EX2mzbLhbzKXnU/0Jv5XsACuo0J81LI+rlyW1VR1zO0ZGrD1QzJZ00cyajBfDJCDO+Q1+Gtdx2XIlnw8rcAWL4jEbu/7xuJhD0YL/hf1SDKVxTbCrcvnVrBcFIIag/U91duTibnMXZ9HjpNrY+7x4EKs4MH1CLkLhg1yb3X19H2LH5cyo1AGaMLGA5HlmQjzmSaHB21LNADe1JDYFhcIKqUOTRjS6ViRxLOByHHpsKMbfn9rGtvm5qO8ucJghTA1JXUyrBQnvQBBiOtA8YXu0pAz7ndCicIVYGGjF/6Fpe2z3PKIjLQAD6PBwSkps3yHoniUYD0QSM2K4/4fIXg6KonhoUtN4TYkPFqZv8Wb31dkr0RasWM8tV+BUYPDCD6qGWPenei+gmQin3nLhgckhj+2CZ1kF9xD71Msd34UpffI1g0QJlu6Z26mlzjzT4arXKCOEy+l7mMT1nBPp4vx0oZzEqDzQpRapwBauEbGRwFyq3JqeIQttht/Uv6V1e+y/uQqVMFpaoARFDD8PSWmsxHsFBQSDGJPIHu8tmLOtzG/CovJFMVlGY2Nf1A5W06MRtt1xeFtxZ7bFR6NTZGvzwZQ3viSQl6AK91B1JpQfc3ugqnFjN4TZ1168=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBnR2NZaGUwVGk5T1lCOTJ4ZXJpMDlLMWVmcjh6a2VzemRYT0Fzd2VMUno2?=
 =?utf-8?B?UGtZUmhTZE5rSXJFbE1PRlhoYWpPaks5UklwWDR0RHNLQXlWWmxxd25Gem9J?=
 =?utf-8?B?cEoxUkMvRkUxWGsvb1liczhHYVNlN2M1QmJFQnhFYXpqaDZiczIvOTBHRFNU?=
 =?utf-8?B?QnhQeDYrbzlzbmUwMUFndlNQN1B1SjFFWEU3cVV3d2tJSDBnZjVIWm1VZE5S?=
 =?utf-8?B?c2Z4dlNRcmtiMWJpaFgzMGZ1K0kvTndvU0w5KzRxTnd0bGhkelpmNkJSZ2hR?=
 =?utf-8?B?c0FWVk14VHJXbkJzZGdzNkRvMXZLUkxGRnMxRDRxQ29GZjhQa3NSK05aSm1M?=
 =?utf-8?B?STFwWU92N292TjN4eTdJUWx2ZjREQVJCYW9QNDFWTTdNRnNwNW5pTkdES3Z4?=
 =?utf-8?B?d0dJZG5yTTlVVE1SRmFYenZXYkh0clhZQWdMZnBJWEg0aUtMS0RacXc4VSt2?=
 =?utf-8?B?cERiK2lPemhxeWNPc01xSEtuR0RrVU90bnQvUXJhbGY4K0pvTmI5ZUMrWjBr?=
 =?utf-8?B?dHAxNGdMdGdVaitvZHlVbTdLZ3ZkcnhCNjlBODhyQWNFV3c0d29MYmJsRWt2?=
 =?utf-8?B?SE42bDRNbmVFYlpuakxCdWR3cWdnN1laakFZbUJWVEcxTDBBWGtsTElZdTc5?=
 =?utf-8?B?K3B4ZHFlWSthOFo2TkxaNEV2TVhkQVhzblB1ckF1YWo0R090QVo2M2ZUd082?=
 =?utf-8?B?d3QvMS9VNDBWaklaTlRGbndwRERGa0JMeUNNVkQ2bXNFSWVSWGxncUNZUUZv?=
 =?utf-8?B?cGYzcjNxelZLRk5mWG5mMHZabzEvT0V6eWx1NlFFdmhQY0J2MmRmM0JpRjIw?=
 =?utf-8?B?TitJRC9nU21VUzJmS0tMV0VHcEtJTnB5aVZHU2h1SGF2c3Axc0kyNzF3TnBY?=
 =?utf-8?B?VjQzL1p3b1dHcTRlZklSVDVqR0VwNmdGeWdsaStESUZ1WkZ3QnBUWC93Z0h0?=
 =?utf-8?B?TzZUVmppalpsdU5yeXJqMzYxTEJyYmEyRzNKMUNWTG9pWGdzK00rNjlHejNO?=
 =?utf-8?B?b3puS3NpNTVsUktJTHZLelhha3RWRzU4TktOMDdTbGZOdU9CSXZ0Z2FibDBy?=
 =?utf-8?B?d0JpNWgyeEZ5K3RuY0hGeWV2aWZ4azJpbjNydEVVRENveVFxaUtQTnE4USto?=
 =?utf-8?B?eFp2bEhxOFBmKzdNcWU5c1pjUzMwQTZHakhLcGRYeWdjVktSU1Q3K2VodEpK?=
 =?utf-8?B?dDh4SHRtMW5DM003OUpuTlRtVWxqUys5VkdtYjlwWWdGWHhWcHVkc2dCVElJ?=
 =?utf-8?B?WFMrRHlzdlh6SDg0UGV4QW4wZ1h4SUliQmFka3paZ1NSSEhUL1dQc1pUQ1NV?=
 =?utf-8?B?VmNFUzEwcUdXRk5Dcm5iZXlqWitJME1hcDFjbDd2Y1pIL3Z5WDRIejlpVGw0?=
 =?utf-8?B?aEd0MGpYL0ZNYXYvVit6ZzA4ZkY2TjRSNXJKNE5KL3AweDU2eWNqSTRmZjVT?=
 =?utf-8?B?Y2J6N1MxYkdwNnFwcDlSTW5WV0d3MEttTzR3c0llR2hxcjVMS3hidWcrRHRO?=
 =?utf-8?B?WU5QZkVmbGloVFVpSm5scHNNV2NqckNNREliNkFqRld4WDlmQlFBaldPMXE2?=
 =?utf-8?B?bG84WVFWdWpRdGE5dEhQL3IzZFpQQWFnSllvRHNSMjNaSHhQOXFTaTRoNmQy?=
 =?utf-8?B?aTVCaWZQSU8vQ2FqY3U5MEk5Z1cwOW1ORkc5aitTbzZFMlVJanBHSWhjSG5O?=
 =?utf-8?B?cUxwUTBFbnlYN3F6YUlRQjkzUFRrOWhlRUxQaFp5bTFHNGJKYUZVZ0lxWUxU?=
 =?utf-8?B?dVRhb0s3S3EzNHhhNGwxbzZhV01FSkhnenVZTktlVE5wTThuaW5hM20zdmxE?=
 =?utf-8?B?UWVlTEVhMVVjVDdqZjFYbGZlWEs3aWJ5TDVpVEJlWmFGUzR3MndDN2VOb3Y0?=
 =?utf-8?B?a1RzcDVjdGYwMytGaUVhamNEUjI5cDh5ZE5qUlRSNG16QUdNdGZxNy9CeDVu?=
 =?utf-8?B?N2FCUEt5aEVITlpjNGF2eTlQNEJXYnhoM3k4d3N0STBISDRJZkFDY3A4Nm1O?=
 =?utf-8?B?WjdDZEp3cDR6WWM2eWJlTTExWGU2UDFsWlpDbzRyRWJ5cUtuMmdtNmRSeXhq?=
 =?utf-8?B?OEdPS2d3S0YyOGl1bDRqdGZuSEUzeGVHWWVwcWdBMmREQnBxRTJBRisvVXV2?=
 =?utf-8?B?anA4OUpyRUpoOVlBbGFZQW9ZdVl2b0JUVjJZWlJwT1RXWERwSHFQczBSUWty?=
 =?utf-8?B?NS9LOUk4YlVVeExhTWxDcFdKdWpkMkZvVHZkRloyWDhSVWdjb080N0dBTDc4?=
 =?utf-8?B?T0tkbDRQMk1FTjhjUnZseE1GdUM1d3hOcDVWQXk3ZDhhY3ZwWlltTkRXTTRG?=
 =?utf-8?B?ZVpiQTVFdElQYm5hbzNSaFdYRVpHSjFjZFRLNzVETXdPYlFJSDRGQT09?=
X-Exchange-RoutingPolicyChecked: UklASIWRu0DLPrKcBPiFBs2bRIXkphR0XjlgS6GQvD0GR7oUhIIuGbQCpAgoawvD+srlbF1CD7CvhLwRzXeF7deyAz6NzNXQ+Q6au5iZOSt137MJSSum1Fj+Fozakwy9kRcRfU7clIeqvsUTbydgs+VLx7qCbkcweATQRA/RyTHQeehn6foaDacvD8F53MAQk0xwuRN27GTmf/vbXJVU4WSNuUqWSu5Xc2MOPTSZSlYg6f8oUsxHgq2sLuGu/lBFuEz7pJwPZt4/A5j/ibV9IbvCCUyzlMzn+2mMZ7UwCVIkyoypZABGjmbfbU71EtuB3NsqUNTat5q7qVXwgdMoiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7b37b5-5be9-43e0-9f15-08de800e9d80
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:08:59.6730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByuB7lnZQ47eb5px4QENRZvJwLndpD1ZG29hPV8l0tIsNVY1cxc1qthjmrhLjiu5FZEKws0AgQYCfMY0ceOOhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

Hi Aditya,

Subject should be intel-ci:

On 12-03-2026 01:18 pm, Aditya Chauhan wrote:
> Add NVL display blocklist to meson.build so that this can
> be used in execution.
>
> Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index a1e9dff55..2e40b2179 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -26,6 +26,7 @@ intelci_files = [
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
>     'xe.nvl.core.blocklist.txt',
> +  'xe.nvl.display.blocklist.txt',
Alphabetical order.
>     'xe.sriov-vf.blocklist.txt',
>     'xe-sriov-vf.blocklist.txt',
>     'xe.sriov-vm.blocklist.txt',
