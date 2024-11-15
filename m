Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E665D6DDD7
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 06:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935EF10E38E;
	Fri, 15 Nov 2024 06:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoCiYsms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897210E38E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731650843; x=1763186843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CPzX5m48iPfpaf6iLE0aXgKyay1s7umphijvdSMP5uQ=;
 b=aoCiYsms7bVSmvAaXOM/uCb5KOaZnraSgcD1oMxBgKDqU+CjwxUHvh8H
 T6g1dw+jINae+Oz6js4054HlSFnZunM/YnDURk9dorr9xnGWIRi6RvYQM
 9JmMJk4Vd0ha9YnjurfMMRJ5SygMyIpfhNwsP/XB2jrOoe96L12xNz8cq
 0S2ejZsuKLFQW8Sl8+6roQii3OqQf0d7eOVXvOSpn7p2eu6TcnqjtniT2
 5C1G9pDQVLONSlse/oH2tu41BU8+zm2pKAfunpXgnN/vve03ZbMUHEiQw
 RZ67nOWRiBK3j8t1kFuwqEfyZXQMkTF030NlBWnVrVRmojFUYpEi8eJSW w==;
X-CSE-ConnectionGUID: +m5BhC7+Sa206II+wBh1zg==
X-CSE-MsgGUID: hj4DaDf4ROukyN8mEV8wMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35564663"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="35564663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 22:06:37 -0800
X-CSE-ConnectionGUID: 4eZbg+b0Rl+f/VmAjh5Png==
X-CSE-MsgGUID: MyFHTJB5SuKuc3rxp5qqhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="88439497"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 22:06:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 22:06:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 22:06:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 22:06:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llNmQqyu7NWBGexsnq1fV2an2qHdYQ5/tksdlV+xWiG4wrq8xuzlMr8h0g9s/+OqYFDnSvyYQdgnFCywXc4sNFeGWoN26c58aUu0WfEtJ6ZmsrPNBdrfO1LL+KGM2FkOMyd7ExVKCOyUmsA8gWUMps6YE6Dfhoc0MLk5klMnXrBkaO88kfmZ5a+2AbvYYSVEx5BXyfRPSiYpY5uG2Etpfg4Gq6ZcVdlzK5zUaIfLgcSRXpQW6JF4Tn1+Ub20Y181PmrcWPaWjpajcRZlwR69jxjl8za9ASua2rYAawW4m+BPefUoZqBXgOmgmgh+f8IDRd5wIiz2kht8P1UnSrIDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDkydAvEQXSCfovjvbm5UOoqpmeqH9cyZhfwD1uc98s=;
 b=pOEuntsxv8OU1p1hug8v1yEjtyEvx6ZV04wtQ9kyAPDHP6yVzEr1mSAwaMLoOrPF8o6fWR4/FCg+PQCfsE6VtpP/CnQwh9iPLHW4lrtsCphpia6sLARyG8bkGASe+3Z4d4OzZSzrlX8XXeAuk9Cwq9sKfovwEd9xoeLtgv6uEhQz51QTOqdmMcFP/obcJrJGh4qOu9q5IaCgPoBiGv01GwyO2XqZG+Q6a+yK85t8vydOM7oKua7NzuPbKdL4GzAs8xt60CvjX2bQgutnc2ExPd+5zvIXVIPqRU0FrJwbvy1is1efJ0vN3OrqSqGA7pHwm4VRjAhlFk8/w7JU3ItzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Fri, 15 Nov
 2024 06:06:33 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 06:06:32 +0000
Message-ID: <501659ef-b454-4670-a5ff-c8d855a63787@intel.com>
Date: Fri, 15 Nov 2024 11:36:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Set VRR_ENABLED property as false
 for non-VRR panel as well
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>
References: <20241114111445.3249373-1-jouni.hogander@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241114111445.3249373-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c765904-422d-47ae-cb42-08dd053ba75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U05TMW5NR2tVdXdMcHlNRGUycjJWYmMyWG5lNUZtM0tqSlM5K1B3TXBLcDdh?=
 =?utf-8?B?UEVXY3JRZ2RweHFVN1FGcktmUTNEYngreHlESGJyREgvT1cxckdrS0c3azlU?=
 =?utf-8?B?ZWNveS91bkxsUkhLZGdvYVo2ZktZbkNrMVc2TnZ2WkZpZVZDbkZtcEcrRGYz?=
 =?utf-8?B?UXpZcFZuL1ZMMzIxNFFaVVRrby9tcTgzQXlUcFRnNitLcW12b2x2QTk5TExP?=
 =?utf-8?B?ODQ5c0o5TVhOai9JTFNUbkNEb0JkQUN4dkV1N3ZEU0lnL0NYckNyZlEzSXdk?=
 =?utf-8?B?TXRhZTFHclk3dXJ1RFluYzREaEd2TE5ZV3kyYkc4czNtVEx6RGRoQUVTeTRq?=
 =?utf-8?B?MXo3Yjhna05VbmtOS3BQaUxoWEVZMlYwaUk2ZXVTVXZWbTRVb0VFRlM2RVJ2?=
 =?utf-8?B?Wm56Q05jWGFUY0FmMS9rUGsvM1VoTkdSKzJPcVMvekdhaVFtbVppWURYMUYv?=
 =?utf-8?B?QUo0Q0g5N3FhN0xpZDhmL01GeFNZdk5vczVFMERRQkRuSlNDVm43TSs5b2dT?=
 =?utf-8?B?N3pIK1N2MXNxSnhpaERnL0tUM2haMkxRUUQ3OGdrZlpCQmhQVFZodlRxbUpv?=
 =?utf-8?B?UncrUlIxdGU0b3NvSE9QdjNNb2Nxbld1TE1SRnpyNjhIUitNNmVhcVRYV1ll?=
 =?utf-8?B?TmU3cG8vdEI1V0cxdHBUa2RHblVPeUJLQUJOYmlXTGV0eFJMNjlUUS9SWXd4?=
 =?utf-8?B?ZndzNWpsM1dSeFNwSW14akNkcDd6eHFOSHFwOFpMd2JqOWVIbHdhcThadUY1?=
 =?utf-8?B?cHJEVzNwYWRYcXl0eGMwdG9UdUlLaU4xQVQ2WExVZkFqUnJ4NWQ4ZW1CcVdw?=
 =?utf-8?B?Nis1OVJlSWxwWkpSUTNIT1lKeG1HcytVcWVxZ0FmZFo2SlNVb2tiTGN3T2VW?=
 =?utf-8?B?MkpteUNYb2wrOFZmbm1WWFFZN2ZWMnRVekJZRDh0cDZNRkRZRVU3UGpuWDd4?=
 =?utf-8?B?NUFOUW40eWxodnpoUVdibmI5QjgvT0hsMDNXTGZJb2tZMHlQd0h4ck9hWkxn?=
 =?utf-8?B?QVptV1JsTk5xb0VCR1czMEZYTWY4aWgwSTJBZEJiWVFKN2VSQzZPclZOdzE1?=
 =?utf-8?B?OGJIRDlsQ2dYM2RwU2t2b2FiWmV0ci95bml0aWhhVkU2TnlhYlVJZERTbVA4?=
 =?utf-8?B?cUQrTExCemxkT1RLS3BKVjVoUGVFaWZqT09LOTI0SVVqM0FleXQvcCs4R2Ev?=
 =?utf-8?B?eG1QUW9adHhhL0E0STB1ZGZubUE0ckFwcURJQ3FaeWtvaU1hK2h4UXNuOTVu?=
 =?utf-8?B?ZXdyT3hqaVNWZDhYUnprZE1ENlh3THFGaHRXbnFoZ1JPM25NZ05pZzZjVTR2?=
 =?utf-8?B?ODV3RU4xeUt5Ykp3cEdiWmdGU2pJeVJCQXgzbjdPdGR5S0ZhcGFNNmNnL0R5?=
 =?utf-8?B?aEQveERITm9iT0Nlc2JVQzZVaExZOEQvMjR2SzN2eVR2TE5BNmxXWGk5RzNx?=
 =?utf-8?B?Smk3VDlodTkreUtUVjYvOThYeVBKM0hSV2I0R01ZamZ0dElIN2lmbGdZeFFR?=
 =?utf-8?B?L0FWaEN1NXBJTXBsdE5NS0lXaHZSdTl5ZGpRMlN5OEViVWtLekJqT0hoRTZ4?=
 =?utf-8?B?SjhDRUM3WWRtczdLOVBVR3JzRG5CSjRJL2RYUkhxb01OYUVDbGl2SkdQRXhD?=
 =?utf-8?B?MmZNYTEwMlY1NVUxcFhCVVVITGpLVFdlanFHOUQ5Z0krTTRkOXZDaE40K3ZB?=
 =?utf-8?B?WVpqK1JuQVFJUzZGQzVLdnZkdzltbGN5bXV5MzRZNlk2QVFVaG9lM1RJWGN4?=
 =?utf-8?Q?r6B2oHxN00412pQ5GGeGxtQwfjEVriYPTiVUzs1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxyVlFmNVJnVTN1aDVZcHVnYmRDVjZubncxMWxUMmtnekNwemRFT3pWLzVz?=
 =?utf-8?B?TzlNbkh0VmUxWUUyQXVQWnZxNmJneTQ3QW5TTktFU0hYdU5xY2FyRnZpZ1hW?=
 =?utf-8?B?OVB1Q1FEZ0NXSUF5Tkg1aVplTVVpek1RNUZjQjNlYnBZbXZEQnJGcmdJa2xj?=
 =?utf-8?B?aktQWE5iSFNUQ2Z6Z2J5R2c5cnkvbUpJN2pwUDZoWjJUdnFiMjBZWVhzU3o5?=
 =?utf-8?B?aEg1VVNXQlY1UGxDKzQ5ZjJXQ0dMSTRrZVA4cm5OV0RCc3dZU1dVUVJwbEZq?=
 =?utf-8?B?dGpzYUF1WGZwRVRYT3ZFdnh6cTA4NTZONzUrN1VJUDhXNDcza3VNdk1rM3la?=
 =?utf-8?B?T3ZlT1Z0RDdyTThyampFVFZMZGU4djhGc3VtWUMwZUlob0tKb0lBSExrVDUw?=
 =?utf-8?B?U3o4ejM5eXFyWUtGbzc2UzQrMW90M3JoZmFGK1ZVVHoraG0xaFZlUzRNQ3VK?=
 =?utf-8?B?SmRKS0dSN0oxKzd3MTBpMHQ3Q3ZUMjEyaVAxeHRHMnhNRENJTW9WNVMyb2Rw?=
 =?utf-8?B?cHFQaTF5TkdyMTMrWC9qVUZ6ZTZsSXNTbjZka05YMkN3aFU2YitCS0tDVzdx?=
 =?utf-8?B?RVh6MEVsekdmc2pRN3pzSy9hK2FCaU9lVmxNTjZsODJOYktad0RGOEZaclB2?=
 =?utf-8?B?UFlNUnZRZmxxTFZtQjVvMHBteFEzOWx1cXgrT1c2Z25EMEtCMVVkVmt5WUl0?=
 =?utf-8?B?Y2k2MTczd0YzeXBNVFBHZi9oSSszV2hsQWhPeUZpWjNSdEdKNGFjTkFiUmFZ?=
 =?utf-8?B?U2ZJUE5Xc1ZJMjFvWEd2NC9DVG0zbTdiUzFJVXdwVjAzWnMxTW10R2VvYXE2?=
 =?utf-8?B?dGdxSGhUdzgwdXRKM01adVBQNHl1K0V2a2s2OFBSaGhldEFuWUk1RWlIS2hn?=
 =?utf-8?B?ZHEyTXUrZ1dUWnd5djR4MHhKbERCbk5NQzUvS01mN2dZNDdiTnZyaDZVRWYy?=
 =?utf-8?B?TWVmcW9YRFZtV3Y3aFQraTNBV0Vta202MUozY2xBUnhBVlZIUFppWUhUQk9C?=
 =?utf-8?B?b1UveklMMysvYXlPN0ZqUlk2amtldU45UUcxVmRzR3poTXBwM3loQ1dwa1Vh?=
 =?utf-8?B?VnBZbmlINHMrRiswdExNd1BqYitsOHpvZnJCTnEyV3R0b2grdDNKMU5jNHho?=
 =?utf-8?B?NHVzMmhoWnpGZ1o1QnhQQlYyUVJ0MDg4R0N2b1Y1dnJMS2lUbTZTT1J2WnVO?=
 =?utf-8?B?VDQ3WUpERHpWTUR2SDNnSlpJK3JGZDhIRkRtdVVyM0R3Z2J0WEZZNzcyVStV?=
 =?utf-8?B?M0lIbHdpbUgrWDJCTG1RNkNCeEZGV1R3eW1qYitRcGhzaVhDZUNVYjVHYXFh?=
 =?utf-8?B?UWJ4ZG1ldmNlbVJIakt2a1d2dzZ1cEpYQU5UdnNlQXpwdmV0QW50eStWalJz?=
 =?utf-8?B?RDBJWjJDYWNKc08yTHlKMWNSTXNPRnovYnlEcHNXNUNTZUtHcmJnakVhUG5D?=
 =?utf-8?B?bGxMOUwyZFdQQkZ0V2V4MVB3d1NZQ0JVV2ZvOGp5Q21IdVRZakJTQjRhd1ZT?=
 =?utf-8?B?dlJ0a3ZMZzg1b1lqSTI0Q0ZPWVlUdHdqR2ZNcnVVcmRKK2lmdDBTYkRlWWdW?=
 =?utf-8?B?S3Via2lHaGpQK0ZpKyt6U3E4OHBjOVlrSFlZcVNMVExaclRBRnZhR2tSck01?=
 =?utf-8?B?b3ZlL2FBUFk1NlE4ZWl5K2xINWxIazhqNG5KbnU1R2YxUDBzTkZwQzhCL05M?=
 =?utf-8?B?WGkycUprK0IxRVJJMlRuT2VIWUwxejF5YkZmV0FTYVgrcVNUQW91VFRxdHFD?=
 =?utf-8?B?T09wdkQ0d1dLRFVqWjd6TGpybllub1FCenplaVlzVTdyQWw5ZndTZ1hWRC9r?=
 =?utf-8?B?TmhOeVhkQyszZTRWL2xtU3ZJb093R0R1U0pGU3NQdk1hYVF2M3RuN1hUMHJR?=
 =?utf-8?B?RXh4ekE3M0JDNTluanZRdHlpLzJ0ZUxLSDZQM2h3QUJlRXJnVnpWTmdkenV0?=
 =?utf-8?B?UzBUbUtYUmtyUExVenUxK3VkbG1zeUt2OUxoZW9FTDBqZG1PbEJibDR3MmJR?=
 =?utf-8?B?VjVadjhYdUJtVC9rL0tWZXFiOEtqd2w3UkhMZStHYkt3anVMNUlycm5Zd1Bl?=
 =?utf-8?B?Z3V6a1RtQ29nWEpOOFpjaGhFYzV4RjIwWFVldGZNQ0VZaXg1VDJRNVBCYkJD?=
 =?utf-8?B?eENmclF6Wk9jK0Y2SFB0aktuVjc1dzdLZDJYUFpvMTZFTUNjVUpCd3dybXJp?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c765904-422d-47ae-cb42-08dd053ba75b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 06:06:32.8605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNbNNVKSJGynylG4MyxehzY8CyLXmFwmZMxgjP4B9eJY+CbVI2hmVMtBcK8U2441oITnFYY86zOu5yJ5i625TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

Hi Jouni,

Can we add Closes tag?

Rest LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 14-11-2024 04:44 pm, Jouni Högander wrote:
> Currently we are facing problems with PSR testcases after running
> negative-basic subtest. These are because VRR_ENABLED property is left
> enabled by negative-basic subtest and having VRR enabled disables PSR
> currently. Fix this by setting the property as false for non-VRR panel as
> well.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/kms_vrr.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d0db954fa..830fd8ba8 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -862,8 +862,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
> -	if (vrr_capable(output))
> -		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
>   
>   	igt_plane_set_fb(data->primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
