Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123ACC6B03
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 06:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEE910F135;
	Thu,  2 Apr 2026 06:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWqivxhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629A10F135
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775112184; x=1806648184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Qes8bH6NZxJEC8TRBxRdzEJVw4waVi7Q+2rhQjiCMVc=;
 b=LWqivxheUmJxWgomaKoCuvX/6wmE/p+EplDeSNRA6NSG2Slj3KUqQUIk
 DGSkeoePnmb5mR4BSZDOpU7PpMJrYg1NN9ZQcE5emQUoaR6jT9xk6RWdL
 q6vKTX/LezqVNuh2fav0CQSvWj6VHQhlPWhKx2eHsvccRbej9mtGwz17K
 U5r+o2Le0td7aFFJR/9nFXXCo9FT07A/fk1v7bTydOH1uM/6nR1d4E6NP
 greLlnAdGctTlXcR5VMRVGufDkY1EuUTlZTDHVGvLULcgilzD1KeGakLY
 acKm8hrv558rcZUYi2kOY11eNQyQsAysh01IoERw4Ssx7S5C0otHVQSGZ g==;
X-CSE-ConnectionGUID: N7YPX/ikRciiVsB4zpXwXQ==
X-CSE-MsgGUID: NjsI7wXYREaoMPL3IM5kaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75885434"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208,217";a="75885434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:43:03 -0700
X-CSE-ConnectionGUID: sSS7PvbTRHmpULmaYIFqDg==
X-CSE-MsgGUID: IKzCavFKSbim/9tTgv6Mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
 d="scan'208,217";a="222043985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:43:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 23:43:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 23:43:01 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 23:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPnuPU/IOdmPq5mpr3c0Lpwl0ZMRrlfPgJa+NP2bFYUX/RCmsD9tOVRlflMSiasW3R2BMAOWp87dUMm9Gr3iM+k+N9P87k+RoNnX6LYB+7zoDHYrBRAxlh9WTe5gK3150ZEsZHFOMBIyFb/5n8JYvJA5AoLqq++tL6eN/3Jedd7OxICTCJO9Lsbut9cXKDeLPerc7RAj3hU3MF+rdkigKvA0LiUg7guP2dsPG9He+v3iAZRUYzBqBNfQsHiILeYKS8B3WfeYQtAGGvf2lg3XfN4er6JkBIQMqFfqNJTh0dhqtPXznRqYF1e5rHQeNXr/nRCai6dSmuQpFeNrV2VPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERmzo5Um9s1GrbzxUiy8z8zzLaaVa+M1WWsobg9e6EQ=;
 b=lRDI9jhkZv1LrH4rfCEne6CvRBwDcSTQ+qodTTa46BbZkhv5+VXc67QVld+hZz5WNRqQvwf4dCtYVoe/cYvKcMotyQe7zSInZQu0ct+UKegHaRvElzddoozroWEW9TLHcN50nlBNkjE+q57iJEjG4hVJ8tBoJvXhB+/YjcLQ4bFkCeluUQyftzcDxWjcSFrCva/jXRUiNxKMBR8zlyUBIYXkfx/Ea6WYVzJ6s/46P1SykwEf7MrKOPhZdA8C0/wXvwOw8ZQXeoIwuHKMoqn3ZOFy7DFIIFzhVGTLLbnrBogcyXEa0ADW1pK+PQeLrCpSKEYgijaeK8oDHEjf7+a+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Thu, 2 Apr
 2026 06:42:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 06:42:58 +0000
Content-Type: multipart/alternative;
 boundary="------------0yx1jVpcvF24HBQNC0siMpaD"
Message-ID: <6fbd523b-5482-4ea4-afbf-69bd2187a10c@intel.com>
Date: Thu, 2 Apr 2026 12:12:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <ville.syrjala@intel.com>,
 <jani.nikula@intel.com>
References: <20260331103816.2489563-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260331103816.2489563-2-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6cf925-da61-4133-fac2-08de908313e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /DMrIb1AfjN7N8IExmjwPiWcQvrz8wt6ieDUuVndnwVZS/q7lL9w+pG4LZRpvs8n6Jc1+J3RnV8HE5Hxz1UYyKlerdvOOIZjlJSncNepG9grywtdK65a+Dl4uXywTjKuuCHmkewG2c9FFcr+JbEb8pb2a01uil7Pj3BEZ+DbfRvv+TVZ2C15noGW1pDC4wCw4HVJQBlAvdzHI4p9+qIollmoeZNkZecFJDnSzI9yNcL1O+b7hS57dKgbzPt90jjTNtj6Vo8f32D+qdHwDyDk8ILVuXxPrbNjwWuUipO+gIHMThAhZQ5NqZmgqiK1Mxkvva53lvmcWQ4wyFsRDZcE/huBmVx+znjl0THyHjQuxxMqW9kTZ9zwAPgtYs0Gf6JdG3Fx7Bxm6uIYUWlZZuihZ+EKp3FiipO2/I4hv4SAqAj2kD1P8IKQRdsRlNshZJDcq+99ozTzmir3O+okcWC7/6rRXCRVt2qEqdYxuccKyYebnpRWky0QLVeM26eVqOE+QRQXL5/RyTaLz2pSqYIZtao2xQNpiw/y2rhockzhk4RsfQCqaS14FkPgEuXQ/RI1i+fZs6veBVEffI4dTvGBFExtt89ct9o1eJZHdNhmbgXLBXA+4y48d6yqRCN1ncUm4HY/wHcNt5T62SsnNLHgiZ1+IURipnAwLw8EOq8SmQYFye24892UvAjgnRkm8+ajo4LhiC9l3g7ZTHAWORjdK/B3SmxdYvmwwMy3vAsRACs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGc3UVJWR2NWcENRcWEyL25BVUhoWnJwTG9sVzBOT1g0SkMzdDIvOWtDV09w?=
 =?utf-8?B?RDFuNE1sLy9FYklZdFYyaWFsdURRMXEwdzJZUnVubkFaYmxQMGhkRU5oRFFQ?=
 =?utf-8?B?ci9CTGVYSVZsSWtiWkdOOTJENDl6UmJYRVkzc1NwSlpXQzVnbEpSVFVsbnZl?=
 =?utf-8?B?V1ZpMmljczhCTUV6bmQvaGhkWEd4RGRpaXUvTnpJY0pDVmUveSsrUkR4bjZz?=
 =?utf-8?B?cnVjMVhYNnl3emR5aFNKM1JsR0o2NEpMR2hNdXkvdzZTaDIxeXhLT3lMY0t0?=
 =?utf-8?B?aWJKSVVTTzRCejBCUFZYT3dWVHYwSXd2UCtkMnZSYWpmSVlMQU1MZ3NZMk9m?=
 =?utf-8?B?ckx0LzdXaStVSVo4ZDU1NWEzVXdVOHo2UHlYVVZvSWhpZklBTUVjYU1VNjNQ?=
 =?utf-8?B?Z3R2L0pubjNpVXFSOXBvNEg5K3IyMVdpcmtwYzk2ZFlYV29MRU1kUFM0YTBL?=
 =?utf-8?B?RWRLd09xeG4zeUd3QkJCbmN0aTJkZkNqdDJWakVIbW91WDluMEJtcE9TQzdw?=
 =?utf-8?B?RWMrUmdFY0VaM0pNaURBbFlacHluNlowZUFTRGs2T2Uvc2dBMjRxWWVYTG1W?=
 =?utf-8?B?ZjZxdjVmcVZNek91bFZha0w0V1JFZlAyendpZjFFVGxDdnhkeDVvMFlGMk0r?=
 =?utf-8?B?OVFQNlhhSjRtS3hmSnlYVnR5cUVpd3RQd2kvNFNQTWUwRSt2ZkRqT1FqbzJD?=
 =?utf-8?B?SHVwSC9naEFlR2dKc3BlaHN6YU5UZkN3OUxsU1FUYzhVa2p6QWkxNXI5YUM2?=
 =?utf-8?B?UVMwdzhqekhKa1VWUWdnczAzQTdEZ2RRRVdMWGRWTlZ2UzZhd1lHdCtZZHV2?=
 =?utf-8?B?ZTRMSkxrWDdJSEFPK2F4b21PVjN5c1VYRUZ2a3BpRGZlcmlOTUZPUDlyTWpr?=
 =?utf-8?B?b21nbHFUaHA2WjlvM0libkRPdjFDbEdKOXhvZGdrZ0o2MVBwMUtBUUtZeEov?=
 =?utf-8?B?TlUrZnlwa0NxeE1HR25ObkxwRG9YNERmNjJmZ3FWWU1oSFlQSzl0dWpJcmx6?=
 =?utf-8?B?NSs5MHJUZVRUN2pJeVpXa0xjNGFMYUNUa1NFTmRWVTZXUGZGeEo3bEZORDVv?=
 =?utf-8?B?ZjUzREFKQ2U1Ri80TWxZMDl1L0w5REJDdVliVUZIanZEbUUxTWhkSitXeUcw?=
 =?utf-8?B?eFdnaERKU3BkMm1CYkVSRHVRUFlzVmt2OXMzYXJPQVI1eFpNT25aRTIrUDJL?=
 =?utf-8?B?MzVFRjhmODMyNjBCalVtdVdSaWtHRzVRKzRCREJ4SUNONFRqT3BVTHdMRHdV?=
 =?utf-8?B?amRYS0NhaG5kcmlYVFJybTdKazlZc1VHUUNWbVZHTGhZTmovVGw2aWpsWVBo?=
 =?utf-8?B?VTEzMWt0Y3pRaDBzRFYvdTR3OVhVakRML3NvdHMyUzVXa01aV2VoS2VhNDd0?=
 =?utf-8?B?em0wUEdlQ0dCQ0dLeW1zMWphVzd3SDZJRGVOZVJTaEdiRXJncklFSUI4MjdJ?=
 =?utf-8?B?NE9nSHFMWG4xbW8vRXFaekV1d2NkazFuanJObVFVSE1pbXZMMXJDQ2dQczdZ?=
 =?utf-8?B?ekFPVlVKcEJMT1lVaVVnUkgwMm9sdTdQd3FmcXZUQUhXZkh3aWVTakxFSng3?=
 =?utf-8?B?Z2RuMGsyWko1YWFxTWY0M3h6cjNBMUUyalo4eXpIVDMzTVFLMTlSSWtMRXQr?=
 =?utf-8?B?SXdPL2Q2OEJpTHFCU3JhaDNTZEtkT1ZJcWFCWjdYOXBWcnZMVEZ4cWx2MjRS?=
 =?utf-8?B?ZUpvWmN0RnBGMHRCckJxV3ZLRDhoNW55bDk3QTBXYWJPTVlUOEViKytLVTdT?=
 =?utf-8?B?SjhiM0FvSzQ2T1VKcDREajk4YndkRDNqZlJmVEZCUDkraW5ZR0JaUVZWcm5I?=
 =?utf-8?B?eUpIcFVIeVBnMmYxNitSZGZlbW0ySllpWjdUZEF4ckl4WENQb2xKSXN4TlIr?=
 =?utf-8?B?UXN0emFvNXhyVWtQb3ZUbGh4VUJCTVFEUENUdTZEenpCd1lidWlZeXhPd21O?=
 =?utf-8?B?dDhWdHJ5R1NtT0lRNU80bm5NUUhrc2xWYTltbXRHUVdZN2pkOUlKMWVqY3hm?=
 =?utf-8?B?aHdQQk5PVWg4TjFmeU9OWWhxUTBTdVhEY1hSa05EakdZTEhhcmdYTE0yZ3BT?=
 =?utf-8?B?aW5jbE80WWo1UzdMYlB0Vkc5NUpyQ0hvUTVSNk9QeENZblRsd1FWTGJWbktw?=
 =?utf-8?B?MVpDdTBLOUpGTm9FZUx3cHNVYnBCOTZFbUFLS1E0aU4vUk1UWlVZYW4xRnlo?=
 =?utf-8?B?UzRVMDNBUHdGempyRGI3L2taYm9LNWIzdFBiVVdITXZlUTJxVE9Oei9waGJF?=
 =?utf-8?B?SkpzZGdlWlJtekJXLzB1OUZpVkp1RUxyQXE1ZzA2ZytLN09tL2ZidGtPK0F6?=
 =?utf-8?B?NlFRMTlHUVAzK2RWdm9RcDkvWUZKQWZveTVzZ1J5b2ZoUTdJdWlrZz09?=
X-Exchange-RoutingPolicyChecked: CnyZRCFK/tE9V/ueviwgAcykYQE8BSwZ72eI74EedISRQ11CeDKgtr008lm5QUfCa9DRItNpZofTwODLNUFMHzbc2rEY3CPEoemqy1pKDaR9S//8IaCh1E1z8GnpavzE/d8iGClrAlCbgfsFdMJbguonquh4XgAjBsv5jo50yirZ5iCBrNCUTip+L+SIeBujD/tPsuS2C5DLoqV1eInkkWZSIoLokDnqrXpC4VD6cJqhykd3a+NItbIBVcMPHQfuZCeKitgRfDZr8KnRUJyte0DazuXXxE/D5gsIsbfHjmUeywQC4bFlmGFi7NeFILx8tUyU3+pjZZEndtWmVT9glg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6cf925-da61-4133-fac2-08de908313e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 06:42:58.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gz04XJWg/zgnb35cU1DCQ5PjrfnaeLSgkZFn9LWXskVFU0WRRBlqB57s2PCCxIp1qH81XomFVx/2hEf6GpE0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
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

--------------0yx1jVpcvF24HBQNC0siMpaD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/31/2026 4:08 PM, Sk Anirban wrote:
> Calculate actual suspend duration using CLOCK_BOOTTIME instead of
> relying on the autoresume delay approximation. This ensures accurate
> validation of idle residency measurements during suspend cycles.
>
> v2: Use CLOCK_BOOTTIME (Ville)
>      Use Fixes (Jani)
> v3: Use igt_time_elapsed (Riana)
>      Remove check (Riana)
>
> Fixes: 5c85b336f75b ("tests/xe: Add a test that validates residency during s2idle")
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 61b63ed4f..70dcf432e 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -215,18 +215,18 @@ static unsigned long read_idle_residency(int fd, int gt)
>   static void test_idle_residency(int fd, int gt, enum test_type flag)
>   {
>   	unsigned long elapsed_ms, residency_start, residency_end;
> +	struct timespec ts_start, ts_end;
>   
>   	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
>   
>   	if (flag == TEST_S2IDLE) {
> -		/*
> -		 * elapsed time during suspend is approximately equal to autoresume delay
> -		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
> -		 */
> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> +		clock_gettime(CLOCK_BOOTTIME, &ts_start);
>   		residency_start = read_idle_residency(fd, gt);
>   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>   		residency_end = read_idle_residency(fd, gt);
> +		clock_gettime(CLOCK_BOOTTIME, &ts_end);
> +
> +		elapsed_ms = igt_time_elapsed(&ts_start, &ts_end) * 1000;
Use MSEC_PER_SEC

With that

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>   	}
>   
>   	if (flag == TEST_IDLE) {
> @@ -238,14 +238,6 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>   	igt_info("Measured %lums of idle residency in %lums\n",
>   		 residency_end - residency_start, elapsed_ms);
>   
> -	/*
> -	 * When suspended (system or runtime suspend), device needs to be woken up to read
> -	 * residency. Idle residency may increase during resume thus being greater than
> -	 * elapsed ms.
> -	 */
> -	if ((residency_end - residency_start) >= elapsed_ms)
> -		return;
> -
>   	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
>   }
>   
--------------0yx1jVpcvF24HBQNC0siMpaD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/31/2026 4:08 PM, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260331103816.2489563-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Calculate actual suspend duration using CLOCK_BOOTTIME instead of
relying on the autoresume delay approximation. This ensures accurate
validation of idle residency measurements during suspend cycles.

v2: Use CLOCK_BOOTTIME (Ville)
    Use Fixes (Jani)
v3: Use igt_time_elapsed (Riana)
    Remove check (Riana)

Fixes: 5c85b336f75b (&quot;tests/xe: Add a test that validates residency during s2idle&quot;)
Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pm_residency.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..70dcf432e 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -215,18 +215,18 @@ static unsigned long read_idle_residency(int fd, int gt)
 static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
+	struct timespec ts_start, ts_end;
 
 	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), &quot;GT %d not in C6\n&quot;, gt);
 
 	if (flag == TEST_S2IDLE) {
-		/*
-		 * elapsed time during suspend is approximately equal to autoresume delay
-		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
-		 */
-		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
+		clock_gettime(CLOCK_BOOTTIME, &amp;ts_start);
 		residency_start = read_idle_residency(fd, gt);
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 		residency_end = read_idle_residency(fd, gt);
+		clock_gettime(CLOCK_BOOTTIME, &amp;ts_end);
+
+		elapsed_ms = igt_time_elapsed(&amp;ts_start, &amp;ts_end) * 1000;</pre>
    </blockquote>
    Use MSEC_PER_SEC<br>
    <br>
    With that
    <p class="MsoPlainText">Reviewed-by: Riana Tauro &lt;<a href="mailto:riana.tauro@intel.com" class="moz-txt-link-freetext">riana.tauro@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260331103816.2489563-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	if (flag == TEST_IDLE) {
@@ -238,14 +238,6 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	igt_info(&quot;Measured %lums of idle residency in %lums\n&quot;,
 		 residency_end - residency_start, elapsed_ms);
 
-	/*
-	 * When suspended (system or runtime suspend), device needs to be woken up to read
-	 * residency. Idle residency may increase during resume thus being greater than
-	 * elapsed ms.
-	 */
-	if ((residency_end - residency_start) &gt;= elapsed_ms)
-		return;
-
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------0yx1jVpcvF24HBQNC0siMpaD--
