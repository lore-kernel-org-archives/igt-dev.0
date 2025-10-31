Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E60ACCF9F0
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 03:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3010E188;
	Fri, 31 Oct 2025 03:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htiOEk6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD410E188
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 03:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761879848; x=1793415848;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eqf79aoEiRdP087ZaBmTYbXHVgGqjY6N2BBgmIfWrRM=;
 b=htiOEk6w2rm9bkDkQftUYynDx/LGTc3y5TWw459QeCqIIyxeWfUiDlu1
 hCcoxQTR+WU7HtRXzlZh06Y8oMmSyyPcU+s6Va1FWlqDWtIpLBMmHP8X3
 MtqgYdl4ZB68xVdCb76jzGuLB8QnUmK1iuvk4BX4KMjYHpXOxaN0e5Sfd
 Oh8UxY/VfyU5Oo2ygBFG/QC1Q+XiWzv67WypYlTSTEtw+Zx4Tm6xehNbN
 42kh9qkFECv1/OMSdKU16wvSuuccFhOuMffEuOW77thueaGW+SZivBHB/
 2vbZi8yqWT+5lj9MCgp04370cn4t2ZjCexbI6fO3ur6Rc/Qe+x/nP+Ltg A==;
X-CSE-ConnectionGUID: CMJoghgGRd+eSJ+GlJKr/A==
X-CSE-MsgGUID: mf8TxXrOTz+//r4ElHlO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63055796"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208,217";a="63055796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 20:04:07 -0700
X-CSE-ConnectionGUID: bAKzJNm9RdWaZF9pGmHygg==
X-CSE-MsgGUID: /EEkZ+fGTf+W77YnrQ6UEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
 d="scan'208,217";a="186861654"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 20:04:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 20:04:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 20:04:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 20:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB0eO+mqDCX8js40QKKt/pW7oxQV0cR9GvJTOyHHDuvmhXAYEgSTQZMrfE4XXLgSP0eMiT8+uaUYK4uOFwsHz5dMsNjrb6YQ5RAumsDC7Oq2aLu129xpmi2ENfSN2EOcrk/9SZVpdXSj3gEgUWMnIrt8xb7J8qX6gTqqejh3n0FiKEe1YT2BMA7XAtfu/+TcYrneVHYGMlqZv/8ylrUttzkOarQUbL9ndORIcUrmg5irvIDZ0lGgAG57gxSzK3rv2ewXgj5fWmHprfwnbTnTmrgDS8vOVzd5clDIqU4/B9NabnkVAjGsDHzz8b8XZriTmZpqZaH7foq1icwxl53/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFQp3hwYilnHiAX3REjY2CipopYPd1Vnbo0uFUr1ivE=;
 b=skYestQn7LVTGf3fHZWpWbd7eXt2JJ84yf/Us2vrsLBQP60CRXYq0aT7WLBDx2/rPAIpdH7/lTCn6r/gzKCRWijT7eQoLoRwYtCSRvjGB/15voC3yYUkJCCvMi3mlVXKQ8iyIElKFaGLT5LK4vMzEaEPtWBk2uE0CCaWsHytmaxNoY8rh8lg8ftSa460cA5StdHsvuj9kG7SjythVxubPyHu34E3cSUfDlh8KTs/vkhHDwukyXsotiyQGkTnu/Vmx+OAysHk5X4mfVewkc00Pqq8hCTMRdYv+sfNMLgaOoJ8o1F/eBf46yq+80AYDcxe3nGC5fER4xkq6Id7Pk0NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 03:04:03 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:04:03 +0000
Content-Type: multipart/alternative;
 boundary="------------4ayZagCU7ZtFoX1ScI9sw0od"
Message-ID: <a15b0aa8-8521-40af-a656-f860cd413100@intel.com>
Date: Fri, 31 Oct 2025 08:33:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] test/intel/xe_pm_residency: Add support for ASPM
 Link state residency
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>, 
 <raag.jadav@intel.com>, <sk.anirban@intel.com>
References: <20251023193458.3371835-1-karthik.poosa@intel.com>
 <20251024095638.lgelss2hz4lg6k5n@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20251024095638.lgelss2hz4lg6k5n@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2fdb44-9624-4333-b15c-08de182a2578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFNudzJUaVF1MEZRR0ZDd1l0NGVscndBMDZDSWZOMnFBcG9NTEZPZXU2T0xG?=
 =?utf-8?B?Q3YzRUl0NnZNL3VKNVFtczhyUzErUkMwMHpWemUyRzZnWVhCWnpEZDZNR21Z?=
 =?utf-8?B?S1NDQVd5U3RSa3puOGNhd3NobFN2VGpBSkFWQ0lDei8zbmx4SklXdnVuRE16?=
 =?utf-8?B?b0tGY1NBUkUwK0hvWnZDRVV4QWVSMkdBWjFWWk5ITmdqTVBweDQrRExUUk9y?=
 =?utf-8?B?S1dYWGNJZmdiUTFvQWtOS1hvNXNsUzBCbEhYSitNV3V4SmtpaTJ1VkxJRzhS?=
 =?utf-8?B?bDNPUmdQYW04RC9kVnBzYXZVcjlEaERxeDdlT0lCSmdEdFhrUlkvaTMyQVI5?=
 =?utf-8?B?UU9NQ0VNbmN2Zk9LY05FZWxQZnJCSmxRY1ludHc0VktjdnQ1dzREaThEWGhD?=
 =?utf-8?B?ZDRxOXI1NTFsRm4zOW12Y0JzdjFpYmsrcXd2MDFmQjc1aFVYQTlYMW1XQnND?=
 =?utf-8?B?QUIzUnBMMFFpR2F0SlRXenRHb2F0dU8zNDgrOXZNdCtqbVlYMjhLNy9FR0h6?=
 =?utf-8?B?N1U1SVc5ZnFwVzYzelJJWWVRYWlQKzlqNElzamVXMlp0UlFOQmhyVExGbGVj?=
 =?utf-8?B?L0hZVE1UWUdTeFh3YUVxZC9TWU8yZVYveWdlS2ZaeC9GcTRsd3FBK2ZmUkJ5?=
 =?utf-8?B?bVU4ZDJqejFmbEpvbjFxWWlsajNlSEVyejlGa1VIR1pjc1EzcTlEUlV0dUhw?=
 =?utf-8?B?MWNOVjQ5dXFESkJCS05wbFRON1ZLbEQ2eEM3bGE3Z2Q4YkEwVmxkYzVucnY2?=
 =?utf-8?B?VTFyc2hMV1EvRXl6bEE2WTRtRXFjK2wrSEEwRi80VHh4WUh5M1VDVjh5czRF?=
 =?utf-8?B?S1B0Um9NSlVycjk4Z3ovY0ViczNnWllXZXk2RVpzeHZ3Wkc0VWxTUCtKaEpm?=
 =?utf-8?B?SE1Va1Z5T1FSVm5MN281RGVxaDVOY1ZEY3RndkxiTkNTT1RqSENXWUlhaHBi?=
 =?utf-8?B?QWI3UkpnZWp3eGNScENTcDA3ZXhTVlFmVmdNcG5uTEdiRUVpalV4L292V1JL?=
 =?utf-8?B?bGdiOEJobWg5WlhkWHZxU2o2WUk3NmYzUzhZTkZISVNxM0dBVGw0NzNzWVFF?=
 =?utf-8?B?MjBXWGRRb2dpdGw4dzZzTENQMDViNldSSkRCTXA5QnZzNWVDK1dOeC93ejhz?=
 =?utf-8?B?bHhhTVRoQkV6L0FlRGUvZi9MRURDL1llYVpDcytqYWkwYlFuSGhVbHVpSzVH?=
 =?utf-8?B?Z29HSTBNNlhlS0JmTzVHekplS1FGU0VFalUwM1AwMTUrM3lzdkVuSW5hMi9L?=
 =?utf-8?B?ZWFUeHQySU0zTHAyWStPOGRNUDdlM1pOaTA0RHNVc05SRjBGdGsrbVJKRGxT?=
 =?utf-8?B?RFFGU2ZaSzRxUkU4U1Q1dlBoeStJZG9MVWtuTHlnc2lKYk9ESTU4eS8wV2Qx?=
 =?utf-8?B?eTVHcDNFbXVId0ozMkJFamJFbUszNERkNDBLanRIRFNJblQ0ZUo3VUxlNHJZ?=
 =?utf-8?B?emthK0tlbHhrbndkSVV1ZkVuWWZDak9uQ04wUFZjWVFmcTVUVUVQRnJhdlBh?=
 =?utf-8?B?Q2d6UTFHNng2cVBiNXR6bzhUNzVaR1NsSUFBaGFKZmVuaVFnZFFvN25OQ05O?=
 =?utf-8?B?enUxaTVjckNrTFJpV3MxdlYrUlBFN2Y5VTZMTmRyR3ZUMmg5WGFDY1hoNFg5?=
 =?utf-8?B?UnRyWXBvb0h5VmpxbTdkK2k2aGxRWVc3K2h3aTJ2aVovNDRkZVRsYkFTZVBH?=
 =?utf-8?B?NTRXZ04vamZUY3RHSnhWQU94VyswSmp0aDdCUTcxVGw1ZElLcjFWTm5PcU5L?=
 =?utf-8?B?QTc0NGRkOUhsdjZMNUw0ZHI2R2MzM2NHUWZvUXl6aWlSNXRyTWpCMVNHdzNH?=
 =?utf-8?B?L1hSNUNHZVlMRVBXOGVnVmNRanZ5MDhjUzRtRis0NXMzeGlBUDg1b3NGWWRS?=
 =?utf-8?B?VllxUHFzSzdwMlNFQWZjM1NyWExncUJwVXlZeFRIeW96K2hpclhYYnlqNlNP?=
 =?utf-8?Q?ltcFsJH0lJd9iq9NakAIodmUZZ6S4+Tg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NLZVVZWW5DM1owMTBNN2tPK2VMZWNYSkZXaklEVEhqRkphVldDNEN1cDVs?=
 =?utf-8?B?V1FUUllpb3NSNytocjZzdDJDclhXbWpnTUNwSThyNS9LTDBnMDBTanRHQUM5?=
 =?utf-8?B?SkErQ2t4dE95eTZTdjVoSE9rRXZQa0pzdTdaUmoxY1NUY3BQTm9zMncxZlJE?=
 =?utf-8?B?V0hNMU9YMk1UVm1lZVNYZ0FsS0NnZ1IvZldkQlFuWER6QUx5MXlxSW8xcTFj?=
 =?utf-8?B?MnVqbVcrR3hjMUZkZEl2VkJsWFRnVWNVZWtsbVp1K09kWmJxQ3Z0ckRNcHZP?=
 =?utf-8?B?MVo2cGE1Y3Jsb1hPUHI1S3lVOW51V1pOazUvNE5pQk9ZUUlrZU9DZ1g1WXlj?=
 =?utf-8?B?STBObFExUEsvdUFtSmkxWEgxT2tPblBPYnpzUjRCN24rMTNSVzhod0NEMFFM?=
 =?utf-8?B?SFRHdWMzUFE0aGNMOEdHVDFHZ081dU5nSFZDa0NYdDVpTnE1NjF6eUVINVVO?=
 =?utf-8?B?Vlo4U3RYMTRmVFBmU3BwOHJacGdqeXlJZnZDbjhuZkpUR2I4NjhEeHhQZmZx?=
 =?utf-8?B?WjhBbDJRZDNwSXBKL05ERnludDY3K2x2NjhwTC9VWndzd25kMis4UHA0QWQ2?=
 =?utf-8?B?YzFTY2RKMUowQllWTTV3MWtNWlp2NkgvK2cwSGc2RVRiVFRvRXZ1aW95RENi?=
 =?utf-8?B?b0duekNZWWYrTTZhNGNMblFzbTI0YzBHaHp4cHZ2ZWdyS3RGZWpWRkJOUy9u?=
 =?utf-8?B?WC90eVVPT0ppaWhyZXRGbzYrRDBqN0FKL3JyeTNiTitYeUN2cC9pNEgrS3Bz?=
 =?utf-8?B?anJMeW9GOWVXRHhoNVFBZkJLUUVZVkV4K3Fic3Q0UVBpWXRtZDFNNEs5L1hV?=
 =?utf-8?B?ZzlxMkY2WE02V3lLT2hxY3hXWTQxQ1VLUHNDbE1kZkp4R2ZZSFcraW9TZmFB?=
 =?utf-8?B?YTVDZkIxaTh1TGNGZE5lWlV5VmNNT2wxVXdOSUpyeEJNdjNlK3hwT09IRitT?=
 =?utf-8?B?aGUyOUxBQ1dHM21sdmE3QjZOZ3p4WFE5R3hjT0U1MHNYckxGR1BPRW5ZU0ZK?=
 =?utf-8?B?YzFqR0haNEhYRXV2ejF0SVArdlQwcW0xYUc4Ymhnd0ZnQ3MwVlZUZUhQRlN1?=
 =?utf-8?B?cmNkbWpXeWczbDljc0FzbjVaVFZ5eTg5ZjJlUGRxbFZsNHM3M0l4eG4wWFhw?=
 =?utf-8?B?cGVEeUJTd05KNkxibG9uMVBPNWoxV1l5UHMveUw4TnBOaWI5TTBhRGZ1aERT?=
 =?utf-8?B?a2lrUWRwYVhPOWo0a2tyUTJDaFMrWUx2WDhETmtmUDZsNVpqNmNmLysvb1N2?=
 =?utf-8?B?bGI1OTBMWjEreUtpQ1ZHdFkwOHY5akhMVHpXeHlVV3lDNUExbS8yOHp5MDEr?=
 =?utf-8?B?WG9yd1prL0k3NkZFR0VSajhPNnRTQkNHVnhEYXhYMGhLOStyZmF5L2tZWDBQ?=
 =?utf-8?B?S2lML0QxdkM2SjVyOTVvS3VJMjlVbENxUUI4V3pjOFZXMW53U3FrZXR0ZHkr?=
 =?utf-8?B?cWhBeWUxYzZTUllLb0NYMFBZV3Q2MXRzczBXVDN5dG1lUVNvRnE4ZS9KUzNZ?=
 =?utf-8?B?RGd6ZWRBR0V6eE1WcVVMSjJBOVlDY2FHcC9wUTVkRTBxSmFuMzdXY0RRRGtF?=
 =?utf-8?B?OFE0OVkzVHNVMDR0WEVqUkFXWEloZityaWlNOWZ0S0syL3lZWXNpZ0NWNEw3?=
 =?utf-8?B?N2Fpcmd6V2FONk0rUldpTXA2OTh6MFlEMTU3NDI2SlI5allmbW1KdE9DUUJu?=
 =?utf-8?B?Q1lrM2NxdFpxa1BQTGxJcDQwOWs3a2JIQ0lTRlJEdHdla0hNaHA2b1QvWVdK?=
 =?utf-8?B?a3AyRzhicHFjdXVCcmM5aTdSYmhHbkhyZ21pc1hGRE5vdmxudUd2OG5zNVI2?=
 =?utf-8?B?Q0YwakhucjFoTGtFeWNobTlzNXYzSGhyZUVMalF3L3pmeE9rMk5VZDRLcGpk?=
 =?utf-8?B?Z040Wm1zbEFtdWRLL3k0NlBWUjBUaXoranlFQmdKZHJUZGpBQVY2eGhoVW43?=
 =?utf-8?B?cUM4aU40UFRESjJ3a1BMay9NSVBhbW1rTmlTdEEwUEQ1dTNnR0FHam0xUHNk?=
 =?utf-8?B?WHh5cmFHOFpsb09CTW9OK1doTVZRMWVnU3hIVk9Wd3gvcGVSbmJZTnNtc2Fk?=
 =?utf-8?B?eWFPbXpjbXRvRk9JNU1iMXlBTzhwaGJxNlkrYlNvbHhRd2Q3djBYZHBUUWNI?=
 =?utf-8?B?V3hiY2RDVTRjbXFMWUtTZzlkTWlITEdmZzkwVjByU1Z0Zld4QWtkaDB1L1Rm?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2fdb44-9624-4333-b15c-08de182a2578
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 03:04:03.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVZqyAkS9H/p9OwYuBAbwZ/WiQ/FV+hI9l67aLB+W2olJqAFfFHU3UbGUofVUdzH3VpGaVIXy5JNWyo7Gv0I9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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

--------------4ayZagCU7ZtFoX1ScI9sw0od
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-10-2025 15:26, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-10-24 at 01:04:58 +0530, Karthik Poosa wrote:
>> Add support to check ASPM Link state residency entry using
>> counters from PMT Telemetry.
>>
>> v2:
>>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>>   - Read residency counter as unsigned long long int instead of
>>     unsigned long int.
>>   - Print residency counter before sleep also.
>>   - Don't assert if sysfs not corresponding to aspm_link_state
>>     is not present. (Badal)
>>   - Run workload before validation of aspm link residency. (Anshuman)
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   lib/igt_device.c              |  26 ++++++
>>   lib/igt_device.h              |   1 +
> Please split this change into separate patch.
Okay.
>
>>   tests/intel/xe_pm_residency.c | 144 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 171 insertions(+)
>>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>>
>> diff --git a/lib/igt_device.c b/lib/igt_device.c
>> index c24f6a58d..ac676d9b6 100644
>> --- a/lib/igt_device.c
>> +++ b/lib/igt_device.c
>> @@ -308,3 +308,29 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>>   	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>>   }
>> +
>> +/**
>> + * igt_device_get_pci_usp:
>> + * @fd: fd of the GPU endpoint.
>> + *
>> + * Looks up the graphics pci device upstream port using libpciaccess.
>> + *
>> + * Returns:
>> + * The pci_device of upstream port of the device referenced by fd.
> Update doc (see below).
>
>> + */
>> +struct pci_device *
>> +igt_device_get_pci_usp(int fd)
>> +{
>> +	struct pci_device *pci_dev;
>> +
>> +	pci_dev = igt_device_get_pci_device(fd);
>> +	igt_require(pci_dev);
> return NULL instead, user should handle it.

1. That would need NULL checks here and at the caller, both places !

2. Other APIs in the same file are not returning NULL.
Ex: igt_device_get_pci_root_port, igt_device_get_pci_device

3. Actually igt_require also not needed here as 
igt_device_get_pci_device does that check internally.

>
>> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
>> +	igt_require(pci_dev);
> same here
>
>> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
>> +	igt_require(pci_dev);
> same here
>
> Regards,
> Kamil
>
>> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n",
>> +		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +
>> +	return pci_dev;
>> +}
>> diff --git a/lib/igt_device.h b/lib/igt_device.h
>> index dad7bb047..7de464c0e 100644
>> --- a/lib/igt_device.h
>> +++ b/lib/igt_device.h
>> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>>   struct pci_device *igt_device_get_pci_device(int fd);
>>   struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>>   struct pci_device *igt_device_get_pci_root_port(int fd);
>> +struct pci_device *igt_device_get_pci_usp(int fd);
>>   
>>   void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>>   #endif /* __IGT_DEVICE_H__ */
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> old mode 100644
>> new mode 100755
>> index 1749d6467..2e536f589
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -37,6 +37,27 @@ enum test_type {
>>   	TEST_IDLE,
>>   };
>>   
>> +enum link_state_index {
>> +	LINK_STATE_ASPM,
>> +	LINK_STATE_ASPM_L1_1,
>> +	LINK_STATE_ASPM_L1_2,
>> +	LINK_STATE_PCIPM_L1_1,
>> +	LINK_STATE_PCIPM_L1_2,
>> +	MAX_LINK_STATES,
>> +};
>> +
>> +struct link_state_info {
>> +	const char* filename;
>> +	char state;
>> +	const char* parse_str;
>> +} link_state_sysfs [] = {
>> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
>> +	{ "l1_1_aspm", 0, "NULL"},
>> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
>> +	{ "l1_1_pcipm", 0, NULL},
>> +	{ "l1_2_pcipm", 0, NULL}, +}; + /** * SUBTEST: gt-c6-on-idle * Description: 
>> Validate GT C6 state on idle @@ -64,6 +85,9 @@ enum test_type { * 
>> SUBTEST: cpg-gt-toggle * Description: Toggle GT coarse power gating 
>> states by acquiring/releasing * forcewake. + * + * SUBTEST: 
>> aspm_link_residency + * Description: Check for ASPM link states entry 
>> while device is in D0. */ IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>   
>> @@ -255,6 +279,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>>   	munmap(done, 4096);
>>   }
>>   
>> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
>> +{
>> +	unsigned long *done;
>> +
>> +	igt_info("Running on %s:%d\n",
>> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
>> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>> +	igt_assert(done != MAP_FAILED);
>> +	memset(done, 0, 4096);
>> +
>> +	igt_fork(child, 1)
>> +		exec_load(fd, hwe, done);
>> +
>> +	*done = 1;
>> +	igt_waitchildren();
>> +	munmap(done, 4096);
>> +}
>> +
>>   static void measure_power(struct igt_power *gpu, double *power)
>>   {
>>   	struct power_sample power_sample[2];
>> @@ -370,6 +412,94 @@ static void cpg_gt_toggle(int fd)
>>   		powergate_status(fd, gt, "down");
>>   }
>>   
>> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
>> +{
>> +	struct pci_device *pci_dev;
>> +	int fd_pci_usp = 0, fd_debugfs_dir = 0;
>> +	char name[PATH_MAX], *ptr;
>> +	int ret = 0;
>> +	char path[256] = {0}, buf[1024] = {0};
>> +	uint64_t residency_pre = 0, residency_post = 0;
>> +
>> +	/* Get upstream port pci_dev */
>> +	pci_dev = igt_device_get_pci_usp(fd_xe);
>> +
>> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +	fd_pci_usp = open(name, O_DIRECTORY);
>> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
>> +
>> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
>> +	igt_assert(igt_setup_runtime_pm(fd_xe));
>> +	igt_disable_runtime_pm();
>> +
>> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
>> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
>> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
>> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
>> +
>> +	/* Save current state of all available link sysfs entries and enable only the one needed. */
>> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +		sprintf(path, "%s", link_state_sysfs[i].filename);
>> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
>> +			igt_info("%s not present to save\n", path);
>> +			continue;
>> +		}
>> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
>> +		igt_assert_lt(0, ret);
>> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
>> +
>> +		if(i == aspm_link_state) {
>> +			igt_debug("Enabling %s\n", link_state_sysfs[i].filename);
>> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
>> +		}
>> +		else {
>> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
>> +		}
>> +
>> +		igt_assert_lt(0, ret);
>> +	}
>> +
>> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
>> +	igt_assert(fd_debugfs_dir >= 0);
>> +
>> +	/* Read ASPM link residencies from Xe debugfs "dgfx_pcie_link_residencies". */
>> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
>> +	igt_assert_f(ret >= 0, "cannot read pre dgfx_pcie_link_residencies.\n");
>> +	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
>> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
>> +	if (ptr != NULL) {
>> +		sprintf(path, "%s%%llu", link_state_sysfs[aspm_link_state].parse_str);
>> +		igt_debug("searching for-%s\n", path);
>> +		sscanf(ptr, path, &residency_pre);
>> +		igt_info("Link residency before %"PRIu64"\n", residency_pre);
>> +		igt_info("Waiting to enter ASPM....\n");
>> +		sleep(5);
>> +		ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
>> +		igt_assert_f(ret >= 0, "cannot read post dgfx_pcie_link_residencies.\n");
>> +		sscanf(ptr, path, &residency_post);
>> +	}
>> +
>> +	igt_info("Link residency after %"PRIu64"\n", residency_post);
>> +
>> +	/* Restore states of L1 sysfs entries. */
>> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
>> +		sprintf(path, "%s", link_state_sysfs[i].filename);
>> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
>> +			igt_info("%s not present to restore\n", path);
>> +			continue;
>> +		}
>> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
>> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
>> +	}
>> +
>> +	igt_assert_f((residency_post > residency_pre) , "Link idle entry didn't happen\n");
>> +	igt_restore_runtime_pm();
>> +	close(fd_debugfs_dir);
>> +	close(fd_pci_usp);
>> +	close(fd_xe);
>> +}
>> +
>>   igt_main
>>   {
>>   	uint32_t d3cold_allowed;
>> @@ -444,6 +574,20 @@ igt_main
>>   		cpg_gt_toggle(fd);
>>   	}
>>   
>> +	igt_describe("ASPM Link residency validation");
>> +	igt_subtest_with_dynamic("aspm_link_residency") {
>> +		xe_for_each_gt(fd, gt) {
>> +			xe_for_each_engine(fd, hwe) {
>> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
>> +					igt_dynamic_f("gt%u-engine-%s", gt,
>> +						      xe_engine_class_string(hwe->engine_class))
>> +						do_exec(fd, hwe);
>> +				}
>> +			}
>> +		}
>> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
>> +	}
>> +
>>   	igt_fixture {
>>   		close(fd);
>>   	}
>> -- 
>> 2.25.1
>>
--------------4ayZagCU7ZtFoX1ScI9sw0od
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-10-2025 15:26, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251024095638.lgelss2hz4lg6k5n@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Karthik,
On 2025-10-24 at 01:04:58 +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support to check ASPM Link state residency entry using
counters from PMT Telemetry.

v2:
 - Add dedicated function to get pcie endpoint upstream port. (Badal)
 - Read residency counter as unsigned long long int instead of
   unsigned long int.
 - Print residency counter before sleep also.
 - Don't assert if sysfs not corresponding to aspm_link_state
   is not present. (Badal)
 - Run workload before validation of aspm link residency. (Anshuman)

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 lib/igt_device.c              |  26 ++++++
 lib/igt_device.h              |   1 +
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please split this change into separate patch.</pre>
    </blockquote>
    Okay.
    <blockquote type="cite" cite="mid:20251024095638.lgelss2hz4lg6k5n@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> tests/intel/xe_pm_residency.c | 144 ++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 mode change 100644 =&gt; 100755 tests/intel/xe_pm_residency.c

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c24f6a58d..ac676d9b6 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -308,3 +308,29 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
 	snprintf(pci_slot_name, NAME_MAX, &quot;%04x:%02x:%02x.%01x&quot;,
 		 pci_dev-&gt;domain, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
 }
+
+/**
+ * igt_device_get_pci_usp:
+ * @fd: fd of the GPU endpoint.
+ *
+ * Looks up the graphics pci device upstream port using libpciaccess.
+ *
+ * Returns:
+ * The pci_device of upstream port of the device referenced by fd.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Update doc (see below).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+struct pci_device *
+igt_device_get_pci_usp(int fd)
+{
+	struct pci_device *pci_dev;
+
+	pci_dev = igt_device_get_pci_device(fd);
+	igt_require(pci_dev);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
return NULL instead, user should handle it.</pre>
    </blockquote>
    <p>1. That would need NULL checks here and at the caller, both
      places !</p>
    <p>2. Other APIs in the same file are not returning NULL.<br>
      Ex: igt_device_get_pci_root_port, igt_device_get_pci_device</p>
    <p>3. Actually igt_require also not needed here as&nbsp;<span style="white-space: pre-wrap">igt_device_get_pci_device does that check internally.</span></p>
    <blockquote type="cite" cite="mid:20251024095638.lgelss2hz4lg6k5n@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	pci_dev = pci_device_get_parent_bridge(pci_dev);
+	igt_require(pci_dev);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
same here

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	pci_dev = pci_device_get_parent_bridge(pci_dev);
+	igt_require(pci_dev);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
same here

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	igt_debug(&quot;Upstream port PCI device: %04x:%02x:%02x.%01x\n&quot;,
+		  pci_dev-&gt;domain, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+
+	return pci_dev;
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index dad7bb047..7de464c0e 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
 struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
 struct pci_device *igt_device_get_pci_root_port(int fd);
+struct pci_device *igt_device_get_pci_usp(int fd);
 
 void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
 #endif /* __IGT_DEVICE_H__ */
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
old mode 100644
new mode 100755
index 1749d6467..2e536f589
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -37,6 +37,27 @@ enum test_type {
 	TEST_IDLE,
 };
 
+enum link_state_index {
+	LINK_STATE_ASPM,
+	LINK_STATE_ASPM_L1_1,
+	LINK_STATE_ASPM_L1_2,
+	LINK_STATE_PCIPM_L1_1,
+	LINK_STATE_PCIPM_L1_2,
+	MAX_LINK_STATES,
+};
+
+struct link_state_info {
+	const char* filename;
+	char state;
+	const char* parse_str;
+} link_state_sysfs [] = {
+	{ &quot;l1_aspm&quot;, 0, &quot;PCIE LINK L1 RESIDENCY : &quot;},
+	{ &quot;l1_1_aspm&quot;, 0, &quot;NULL&quot;},
+	{ &quot;l1_2_aspm&quot;, 0, &quot;PCIE LINK L1.2 RESIDENCY : &quot;},
+	{ &quot;l1_1_pcipm&quot;, 0, NULL},
+	{ &quot;l1_2_pcipm<a class="moz-txt-link-rfc2396E" href="mailto:,0,NULL},+};+/***SUBTEST:gt-c6-on-idle*Description:ValidateGTC6stateonidle@@-64,6+85,9@@enumtest_type{*SUBTEST:cpg-gt-toggle*Description:ToggleGTcoarsepowergatingstatesbyacquiring/releasing*forcewake.+*+*SUBTEST:aspm_link_residency+*Description:CheckforASPMlinkstatesentrywhiledeviceisinD0.*/IGT_TEST_DESCRIPTION(">&quot;, 0, NULL},
+};
+
 /**
  * SUBTEST: gt-c6-on-idle
  * Description: Validate GT C6 state on idle
@@ -64,6 +85,9 @@ enum test_type {
  * SUBTEST: cpg-gt-toggle
  * Description: Toggle GT coarse power gating states by acquiring/releasing
  *		forcewake.
+ *
+ * SUBTEST: aspm_link_residency
+ * Description: Check for ASPM link states entry while device is in D0.
  */
 IGT_TEST_DESCRIPTION(&quot;</a>Tests for gtidle properties&quot;);
 
@@ -255,6 +279,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	munmap(done, 4096);
 }
 
+static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	unsigned long *done;
+
+	igt_info(&quot;Running on %s:%d\n&quot;,
+		 xe_engine_class_string(hwe-&gt;engine_class), hwe-&gt;engine_instance);
+	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(done != MAP_FAILED);
+	memset(done, 0, 4096);
+
+	igt_fork(child, 1)
+		exec_load(fd, hwe, done);
+
+	*done = 1;
+	igt_waitchildren();
+	munmap(done, 4096);
+}
+
 static void measure_power(struct igt_power *gpu, double *power)
 {
 	struct power_sample power_sample[2];
@@ -370,6 +412,94 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, &quot;down&quot;);
 }
 
+static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	int fd_pci_usp = 0, fd_debugfs_dir = 0;
+	char name[PATH_MAX], *ptr;
+	int ret = 0;
+	char path[256] = {0}, buf[1024] = {0};
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_usp(fd_xe);
+
+	snprintf(name, sizeof(name), &quot;/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link&quot;,
+		 pci_dev-&gt;domain, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+	fd_pci_usp = open(name, O_DIRECTORY);
+	igt_assert_f((fd_pci_usp &gt;= 0), &quot;Can't open link directory upstream port %s, ret %d\n&quot;, name, fd_pci_usp);
+
+	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
+	igt_assert(igt_setup_runtime_pm(fd_xe));
+	igt_disable_runtime_pm();
+
+	sprintf(path, &quot;%s&quot;, link_state_sysfs[aspm_link_state].filename);
+	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), &quot;%s is not present\n&quot;, path);
+	ret = igt_sysfs_scanf(fd_pci_usp, path, &quot;%c&quot;, &amp;link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret &gt; 0), &quot;couldn't read residency for %s&quot;, path);
+
+	/* Save current state of all available link sysfs entries and enable only the one needed. */
+	for (int i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+		sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_info(&quot;%s not present to save\n&quot;, path);
+			continue;
+		}
+		ret = igt_sysfs_scanf(fd_pci_usp, path, &quot;%c&quot;, &amp;link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug(&quot;saved %s = %c\n&quot;, link_state_sysfs[i].filename , link_state_sysfs[i].state);
+
+		if(i == aspm_link_state) {
+			igt_debug(&quot;Enabling %s\n&quot;, link_state_sysfs[i].filename);
+			ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, '1');
+		}
+		else {
+			ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, '0');
+		}
+
+		igt_assert_lt(0, ret);
+	}
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir &gt;= 0);
+
+	/* Read ASPM link residencies from Xe debugfs &quot;dgfx_pcie_link_residencies&quot;. */
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, &quot;dgfx_pcie_link_residencies&quot;, buf, sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;cannot read pre dgfx_pcie_link_residencies.\n&quot;);
+	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
+	igt_assert_f((ptr != NULL), &quot;cannot find residency string %s\n&quot;, link_state_sysfs[aspm_link_state].parse_str);
+	if (ptr != NULL) {
+		sprintf(path, &quot;%s%%llu&quot;, link_state_sysfs[aspm_link_state].parse_str);
+		igt_debug(&quot;searching for-%s\n&quot;, path);
+		sscanf(ptr, path, &amp;residency_pre);
+		igt_info(&quot;Link residency before %&quot;PRIu64&quot;\n&quot;, residency_pre);
+		igt_info(&quot;Waiting to enter ASPM....\n&quot;);
+		sleep(5);
+		ret = igt_debugfs_simple_read(fd_debugfs_dir, &quot;dgfx_pcie_link_residencies&quot;, buf, sizeof(buf));
+		igt_assert_f(ret &gt;= 0, &quot;cannot read post dgfx_pcie_link_residencies.\n&quot;);
+		sscanf(ptr, path, &amp;residency_post);
+	}
+
+	igt_info(&quot;Link residency after %&quot;PRIu64&quot;\n&quot;, residency_post);
+
+	/* Restore states of L1 sysfs entries. */
+	for (int i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+		sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_info(&quot;%s not present to restore\n&quot;, path);
+			continue;
+		}
+		ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, link_state_sysfs[i].state);
+		igt_debug(&quot;restored %s to %c\n&quot;, link_state_sysfs[i].filename , link_state_sysfs[i].state);
+	}
+
+	igt_assert_f((residency_post &gt; residency_pre) , &quot;Link idle entry didn't happen\n&quot;);
+	igt_restore_runtime_pm();
+	close(fd_debugfs_dir);
+	close(fd_pci_usp);
+	close(fd_xe);
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -444,6 +574,20 @@ igt_main
 		cpg_gt_toggle(fd);
 	}
 
+	igt_describe(&quot;ASPM Link residency validation&quot;);
+	igt_subtest_with_dynamic(&quot;aspm_link_residency&quot;) {
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (gt == hwe-&gt;gt_id &amp;&amp; !hwe-&gt;engine_instance) {
+					igt_dynamic_f(&quot;gt%u-engine-%s&quot;, gt,
+						      xe_engine_class_string(hwe-&gt;engine_class))
+						do_exec(fd, hwe);
+				}
+			}
+		}
+		test_aspm_link_residency(fd, LINK_STATE_ASPM);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4ayZagCU7ZtFoX1ScI9sw0od--
