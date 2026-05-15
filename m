Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F17CD4F3C
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 04:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C910F3BE;
	Fri, 15 May 2026 04:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVqBi34K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4010E04E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 04:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778817793; x=1810353793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dWtpgMuNWR3frlA4jsPleW/U9B9KwJxS6MQqipwfSY8=;
 b=KVqBi34Kbr38f4/iabbng3DoTe+CvNxkYuumbhTs+uY3A/oMEJtGsxCi
 ZEpvVLtSxKQhCOOUvd6AvFuJz067ozvVq0xWSVVXTXtFJ53eREXS5lKQH
 +NDY8o7zbbi8MAPSQfNergoseGUxhpzozPxGnzV8RJeBWEXDFnKLj2kmQ
 grvtj7DKPPfIetnpYmfytUytOKo6vfJzH74yGI+F1GgOxWiinnXzCuyj8
 ZiaUwN5mLrRLaW4lure+iDl01qXWA45KFOIacNIx0NayAiBvML6ztnBdN
 I2xNiuWGm3Jlw8qDeVPJYv6BwZZ9TklL3Xnl2pe2V4J8MvSDeV3/WQUpN g==;
X-CSE-ConnectionGUID: EWqkgOzHQ6ixFJfdeUhzmQ==
X-CSE-MsgGUID: 57eVz/tzQjObTMnXpSnpxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79753378"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79753378"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 21:03:12 -0700
X-CSE-ConnectionGUID: 5k002P3BRZ22wyGrletS8w==
X-CSE-MsgGUID: PiVxM4fMQyOkCZ2/4BxwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="262103535"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 21:03:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 21:02:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 21:02:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 21:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myH6mM6D2Z43JmgiA9tNMNIk3VdnNpOjoW5EH69pA5oCP6TshsOs5qhxqvNSAeeSJLW8sFm5ZE/YZd9IbMbf8l7NxS0/q1Wo3+trkKe4hD6PRDS3mnfYofN0jdaPQcS8BhH2/nl/Q/oNmuuVHBPA9czEysXy/Dne5ZqkACNiR5QICKvOuTyV0VnyYlwEtpLNV8Zk5Oln2RSXs9q5h3jMTd7FF/Xmk2CM/oAlt/Ais3V1AkyF+Jk16+ZwxgQ2dFWo1H2mOERSa8en24ExYUUN9fjzE8YwFYot10Or6+ffo9bSHhkWCgigHD/izhWM3tBpCNG3nCcg+o8B7S4P0/lLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzh6YHw48uy0EAT7NFdU2S2Dvl5xILdoXeBm3nQnjy0=;
 b=BmWBHpOeXxVZrv543yFEXmRmPune8cPvDGR/fpCyufoSOMQUeAnhmpUljwBZQmdeHwkObQMdbwDgnUNMZO2qy7T9UI0OWsZABQYS0Ww5MN7Obn8bYAqbsdGy1fqZjy9Ns9O8c7jB2sv407VQIcBk1wg3Yxd8vK1jwL6mqvdsEo3gVV2u5GtnckNDVsKXXkHV2bJHCvYWAtJIoDol+vBOjBe7XkYS0Fxit0RgVQP2sauvidLHu1UlJpYxnRFHkQ9Y5HsgjBYDqQv9hMPpOVQxT2umLNyKFCb7mLMcvoIhrvXcKQz29+5JnhheSygAX6zp03F5eFIawI5nclhu4pzyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 15 May
 2026 04:02:34 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 04:02:33 +0000
Message-ID: <b62214a5-0e12-475c-aa4e-9b90883bd779@intel.com>
Date: Fri, 15 May 2026 09:32:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not in C6
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260504202840.2572025-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260504202840.2572025-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1787a287-cc0d-455a-8980-08deb236ca98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: O/5pfkHU6B1WT0EMdF4VqUQJr2zK9iYOItrHqrMU2W8+8vuydv3g0QREMWwABV/78ShD9O7OszL3qEFh4NdMnxVOzNi9JlQzl3XNsPrmgkLqDdzKRuBJUZTxxW0fGl/KzW4ugTz4tBbygTZxx6XxHYPohNKtfzXUAqSxiyx29/uT2UTtSqfd+W/klgxVJ0Ec4UkH71Otuda0wgm2+aSX/Chkdup5p2IQtwEyR7mULDlaI0hO0UTf0bsHdpu1SWwhjoeDPw0DU4QSMoxkm+O+wXIcYcm7vXafZgDAxMGBWLKtbb05ZbrZ3RkbxjCVmMMNsMrxAtjiVsJr2SF1PK2dX/wqw3mmPuMHf+WReeN9qeQ+jmfDPPj7lq1QyDitXdmoac48lTg3E+xSkY5VgR2MCYT+6/adM09cTRMoGWDlXHXy+It+quTlWM0SbieNqn7EqXMMFnCS1kfK7htfhoGpecf3FkM5Yob6Y4+GGNf14PAQZRPJZncq7NiQgL5HOC3FchiAgeLF6+aTPvTOac8EAM98uf5RgxWSQzGwoFasVniUCGVS3TZh8qINMgHkIJNg2cYzNo9nAFQOZdJuOba1UP7QLFIz1IzE4OJSp3YLu7/U7DRob36l39Z93sHgOPnKQdHr9tGgHMw3ZL5anYjpVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjA4bzcxQWhZYTVRMyt2R3h0cGdPRjloSk1qY01pazdBZmNPUnJJK2VZbHht?=
 =?utf-8?B?R2RxYk9tby9sakxrTkJ5YXFOSENyV24zUHZUZkZ6MXFnalVRbnRjbjlocTNr?=
 =?utf-8?B?V2o5N1hUdnpuZFNOSzVoNVVPWTc1UndjWUJoelFUdWdKbDg5blBuNUhxeHhP?=
 =?utf-8?B?ZlBGTTRySVV2eVREWm92NmJUYnFDaCs4cEVtQ3NmMXorZVhKNEhXbGlqZ2ZL?=
 =?utf-8?B?dHBGNGxJY0lJd1BuZTlwV21Cay9SWSs4MXd5Q2YxZ3p2U1luU3IvMEJhNE8w?=
 =?utf-8?B?QVZqeHNuVDFlcnQxRUJ3WS9zKzNYT0ZmQ2lVM1k4L1hqcnlKQjRsMy9pVUkw?=
 =?utf-8?B?aTEybTJxZHF2ZGg2QlRtZVpLZGo4QWVWclgyRVh1d2dHNTVEYm55citzOHdn?=
 =?utf-8?B?eVZKOUt5ZVVnR0MvTWlHSUdOOHhwbnhHVVJPYlBMdU5RdGZXYnlaQ0lndmJM?=
 =?utf-8?B?bG5jZWZmckFwd1o2MXlpbHdQSjhXTTRZVGN3Y3JralBHV0c4emlTdGtNVk5h?=
 =?utf-8?B?cEpNNi8vR01OckJDOXRIRzlvWnlRLzlXRlFuU2NudG1mNHU1Vy83dE9QV2w3?=
 =?utf-8?B?dVJqWDN6WEhld3ZVbkQ2K0pKSENyU3dDOVl4aHgza0FaL00vekpia1VpN2cw?=
 =?utf-8?B?dk9pT2g2S3cvNUtDODJ4aldsZHJLL2wvOVFYWndMOXM5RG1WUTZuL25XT0Mx?=
 =?utf-8?B?MUFaN2VZeTRyMjYzNFdYQ2ZDZk5lNDdzNHc5ZXdtNGk3UStVSXZCVm5UUHZY?=
 =?utf-8?B?NXRVZGxnWnBRZlNDV3lUbUczSDk2UVR3TitGZVh5NGhTYytaVHJTV0hPVC9u?=
 =?utf-8?B?QitBUncrN3paQ2VOYUdoTzEvdHRiK2crV0dOdUhkcjhZZXhiYVlua3RSNm9S?=
 =?utf-8?B?OURDc2tVdmR0ekVsd1gvdUlhTFJMZzlyRU50eWZaTkprQ1E2Y3ZoTHlidVRj?=
 =?utf-8?B?cGhIdU1yblljZEhpcHo2VmFSZmJlaEZDcGtnYjFBMlQrY1ZobTcxRzNnNGNn?=
 =?utf-8?B?bkljbDlqdjdvM0FsNGIwMFlWcW40RnZUQzRtanpvc0k4MG5XUnN1TGlEaWhF?=
 =?utf-8?B?dEQ1STN5UEgzUE8wNGUwaEFjQ1BYU29wWVREVmpNeU9mVnZCS0ZNUjJVQmJX?=
 =?utf-8?B?QUYwUnYyVWQrK0hCZERoKzVyZlZKNWN6SnFSUHQ5cmN0MW96U3RobWNoSDBr?=
 =?utf-8?B?Vmo4OGVPY0NEQkR3WEo3TUJ5dFU3eENKT2ZtMUJXT0ZJVk4yVFBmbFNueVBJ?=
 =?utf-8?B?OXVyaC8xVklNQytuamE5REtTYm50SGR6VWdMcmdsZUxFcVVEeUlDOGFQeExz?=
 =?utf-8?B?cjVkaGhMdTZaSytiYlIrd1kyMmsxeE5lV21Ccloyb0pPRXc3bWZwUTE1VHFZ?=
 =?utf-8?B?SFZzSm54NlQ1U291WURuZ29hMmZrNGgxR3NCU3pkazlEdFI1TUQzK1JmM0w3?=
 =?utf-8?B?cU9HZVMzZkhYQW42ZzRUVUh2RDEySkxnSEdUTzZGU09oU05ySFBNZktUZUhp?=
 =?utf-8?B?TXRBQkVQM1VJTXJiVDNQSjdDMEIxZEZEVVNqdVFxVStuYlBpa2tkbUE3Vkkz?=
 =?utf-8?B?Wmt0UTRBc21PSi95ZkN2b3NoT25NaGl1Y2NQbFVpMzdqcDc5UURtS2Z3bFVK?=
 =?utf-8?B?czFDSFJaclJiakd0ZXp5cWNhOUh1Nkdzek05NlJDWW11OEc4S1U1SURWVis0?=
 =?utf-8?B?ZnJMUTViL0docmh4SHdyY0JzcDB4dkZzTy9DZEFKTnlzS241QmVuQVRrZ1Av?=
 =?utf-8?B?QmRmVzR1T2hWb2JMeXJYcHBIc0hlZ2MzZ0hORXlTVGxZeFNDU21Iamk1ZnVB?=
 =?utf-8?B?MU44STFvMGJnZkIxREdkWkZIVThZUHZjeWdkSVgyVVJwVFlxMG9WSm00Zy9z?=
 =?utf-8?B?NFpaMVpWOG5sVlRlRXNjN2ozNXpObEhEZUJKK2Z5dFZQWDQ1RnFWZnhNMlFI?=
 =?utf-8?B?RWE5Tkg3Q2NCSFB1eTdWL3BnbEpkZkdDRjk3NDlURkIxbzRBa2RxUStqV2xB?=
 =?utf-8?B?ZHRQMDlXTG9DVjN6dXBzVVk1ZDREN1R4K0NEbGIybzNpRko2SUdqbXRST3Zp?=
 =?utf-8?B?ekRNWG4xUDJRZkxCTk82dzZmZGRNN0VCUDhldUYrQXVVaVBaeXZBcGgvcXNH?=
 =?utf-8?B?eXhiVVluR1dGV09HZGZwVEdQa2xIZWsvZWkzb3IwaW4reGVHbnBNOUI4QWM5?=
 =?utf-8?B?L3hmWkx4SEJzcSthMjlJK1VuZDBTeUs2T1pNL0VhSWJYVDBid2JPQURuQ0kv?=
 =?utf-8?B?Q05FVysxaGhNL2Q2Y1dneE5aZjFmUVlZSTNDUmhxRmh5dTRBdWg4Y0wzWVd3?=
 =?utf-8?B?eERoU3BSYWJTdDlWMEFzNGNoTkROZlZqWU9DdkpNVlBCWXQwaGJyQT09?=
X-Exchange-RoutingPolicyChecked: wZTWtLu83ROp04+YjDznpxXAYDQGS6fm9OCTuzW4ijdLi2Mm8JBHRonpLuvwgjs8Qb5mV3Y0Uz+s1V0bG3BgslHnQ3NIoDPtnQI+75/Dp3CtBdXMyyynYqPVxvJPLf5s7UAtwUA+FGcUeUBvkzFUKeLHFo5sFvcS5iPBrlpVFYj9tH51pKQduBB6tqenkNeoawXuEfrVn6fdkELgrDR9snWgm+1qD8s+pc6H9V5s7en1U9GVVzmOXKPsGF5/pZBiiviMp0aov97YRQHlf7tCw/XPjvjnrsUbtIN3F8xqSnM5lX/ASwOhOmniI2EZoq1zKnWGGeyirFS6fTUebXxy6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1787a287-cc0d-455a-8980-08deb236ca98
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:02:33.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iByFhdguKgOUHjzTwMS9pKZ+ewMhc1IRmQ2Yh8LZ5fcfarWUO26JIo9dMI6dLrh716UlufdxhkSn6p4sfe+uqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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


On 05-05-2026 01:58, Sk Anirban wrote:
> The test assumes GTs are idle before forcewake is acquired and power-gate
> status is validated. If a prior subtest leaves a GT in C0 (GT stays active
> for any reason), the final power-gate checks can fail for the wrong reason.
> Add an skip so that inability to enter C6 is treated as a missing
> prerequisite.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 1eeabd509..bfae1f844 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -392,8 +392,8 @@ static void cpg_gt_toggle(int fd)
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt)
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> -			     "GT %d should be in C6\n", gt);
> +		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			      "GT %d is not in C6\n", gt);
>   
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>   	igt_assert_lte(0, fw_handle);

LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

Follow up this patch with 
https://patchwork.freedesktop.org/series/163104/  adding power powergate 
when not in C6.

