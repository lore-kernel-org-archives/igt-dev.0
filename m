Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D26C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05B10F0AF;
	Wed,  9 Sep 2026 10:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTKmvYad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70B10F0A5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949771; x=1820485771;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BYfNR/Nmpy1193aInaF3+0zBD8/EMKk6PzA1zte04n0=;
 b=CTKmvYadMnPlS/+t3LeErkOPtkpbcj8R9tL86OeA27UUWImGRDsfEBR/
 26/OF6u0KfWd4acHv7oN26BCdOt2UVLSKM8dmEYUWwImSSdlghr2ruzlG
 lc9+GioJcLxqNm4uDunYlDAuSNPjvidY9s7lHNrSuogSNHoh6AG2SC8bJ
 o/tQ9gqib5EP6brt+QvKwhgbPOTvVJMCdr5ezfrNrWqDnSUTdWe+e4JTM
 ud2ZNjmL9xyOT6DOQcWv8xy+D++2msnLHNU9lZJctKHsbcWOXXvXGi0Sz
 2q3z3g0s9tofyke6dXC8fKQkP5jaYH0kzNh6a5jGqgwCz0sLMwgrjsK3C w==;
X-CSE-ConnectionGUID: 8P0ONRvCQ1mtn4oztDa5tg==
X-CSE-MsgGUID: UhnI5pq7Rw6Aa+s7NY9cgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91885233"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91885233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:29:31 -0700
X-CSE-ConnectionGUID: scm1RvuZSDCXTxe3hMGzFw==
X-CSE-MsgGUID: AfqteTVbRZCR2enrfiUuiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="294784818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:29:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:29:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:29:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chuasPtiJcAw570fuqqXehzu4Dx8BMWKDxPxcnGcBmXrxpKoQQFPYErR8QEqCGELMLzm316hSVVWrOGUInOX4Sr/2c8HzypmoXZVDXMDHSPZ4Jw/L6RRp1YKT3CXiVSNy8/Xtfwza9gcu/7S40/rLqLp0t21Py4uYj4zEjckjw5wkbUtZiDyp4ae5KXYDB6lMuwbRYPJANmV7GjhefjLXkvYWdVq/BqpQQODflHrdqsOlAyMt9yBiy/l0j2kLtkU+4LS4RFfR9NKjVcbMHkN0kjHQGLkCFXLUc7SEDPovEzANip+OFL9uGJu+WVxnDe8KWlRiLqInPk4QsZ20uO0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYTcHy4Nh6rrlKlDN9eb/ZoUPUpzTz/4+syCVui8tjU=;
 b=B1K7DU8hDIq/saQoK2+UmasXTEMvPrW3xKkm8Jy9yrhUTGehBwnjergaSRXfL/2eOHdBPU7JLgXWrns5NezeiJafP1YUJreFEf5G49+yj8DJII1y4mzXXHoM/tZytCZW1ziHe+qUW5PDrS6rOo0mucFzTM6fXN3NXfQ+2nTfpKsZGkQ+NV9+Iq2IyTtkknFyZaBxmLObOdDoGjxPozC/AgOAi44KEBrPX5uAW8WN4rPfzxw8Pr4gTtqlGyYTKjvKrf18tKASy8rYW8MkuDHfAPDi90YBR25XH5RNZPzXfakUUc8Boruz4ULnqgZ9nBg8ILFhlpg+nIgcBsVLZUF+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9828.namprd11.prod.outlook.com (2603:10b6:806:4d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:29:27 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:29:26 +0000
Message-ID: <f6565b4a-5b85-4232-970c-62e572bb0152@intel.com>
Date: Wed, 9 Sep 2026 15:59:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 4/7] tests/kms_color_pipeline: Add FIXED_MATRIX
 colorop tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-5-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e03b432-73e7-4554-62e7-08df0e5d394a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|3023799007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: kJ/ShsnbnE1liyY1OR1wwh867U37VGM7SYsOzDiBKDBme5SXtcJf5HaJihhoCR6I4lzvraEYmxceAtSy3bApe7Jj5+4aoiRJ1hapGGOOCzA4MS1DqRxyGADFnA2zWlPGYmYHyZj2B7kBxxvj6uhLqqBIw8rB6R/uzIQegt8re5ceEWj3Flrfht6EY1Vcl0477e1sYWCyuz2bvLbhnoGvIK5TiahWzAnO5Eww4IPIjySgT9e2EpyepTiUUVLwtNCfA/ukL0fTBwL3+FJTcVOzCqY9DuZ1z98hWRe63N3AP99gO5TVEWLVs1w/1++7NtYw3+KmGtcpdt5aioLqy+aL5Plp8PHGSDguYEp93Qxq3CeWXj3g9TTWUavuqE7Oz1+8XZXs5HJVuYHSYkGPAwzJ6wkNkNqKN2Ikod+h7Kdc7/8jydrSSx2fDMC27X1L7avfCFpQ9Huwo9beIEowt6v4djT0u1bPlcuJ9GJ0+Avg/ozRUov0J6oaqXV4vHMRNdGzo5wfdNMTjgYBFy2yu1TnQE4p5XqHNoB72PT6xX7mYHGA6PjD/1rkd3Zeps/y5+OQoS2SJICiyhupgrWea3gcyUdlmf3TVlNSBJfqivvuIBEqylBbwUeQJfnkzVhHwF1+GyIwXIXQYX4RxzutkGhb6j+Z7eMn5N86PIPqEoR1ahY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0w3VzRxUStqbUVFVmROOG5TQzVsNjFNQzFtaVRDbE4rVXg1Z0srMyt6c2JI?=
 =?utf-8?B?YVZKVi9nVUQvQTczbmIxWEgxUTEyMndCTmVuQjNsWXRuT05pRUpmRHdXVnJ3?=
 =?utf-8?B?eHNFbzR4Q2Z4bHhDUHNiRmN4ajZ2TDZKSTBITDlpL1VicCtlSXNSNjlaYWdK?=
 =?utf-8?B?R3YzR1FBUDY4RHF5MHJWaTZ6RXJlL01SdFJIQ1p6THdtaWJ5VkdEVzZmemhU?=
 =?utf-8?B?ZFJLbWRmOFBVem9TbFJERHV1S3drVmhlejl5bko1V2llbzE2NS8vQ2poc0dV?=
 =?utf-8?B?b1QwaEtvemFvbTZoWGVtOS91ZWM4SUVkbXJlUXZKSDU1aDk0MXhrNjBSd1Z4?=
 =?utf-8?B?WjI2MndXeDZFd1psTnZRRm55OGI3eXpJWHBuU2pPV3prMlZTeHMwWjhqYVZ3?=
 =?utf-8?B?T25QMkNVWUZpZ2d5WDk5TklBWlJHc2I1dUUxWmpBTEhlOWYrK2pXa2huVjRG?=
 =?utf-8?B?enhjR0lqc2RZNkxCdjRUUU5ZelUrMVRnT204WitJekpvWmxRTHdWSy9WWDBm?=
 =?utf-8?B?MW5LUEdnRnB6c1gyOWxHWWxVZ0M3dHhCSFlJSHZ4amJjVldNcWpVbGp1SDJj?=
 =?utf-8?B?aWhva1NzQjZOMXJFeGtSZFVlbTlUa2MxTjV5WWlEVEFpeGptME5xZlJiZ2d5?=
 =?utf-8?B?M1M2L0NIZUVIR1FBOEVJVFpnUGRIa3NmNWYrR1BEaHprUUlFSFNPcGNhSndr?=
 =?utf-8?B?NjhrR296ekJoMnp2Vmd4cEg5M1YvKzNVdWJZSDhPNkd1V2Q0U0hpMEl1ZVg4?=
 =?utf-8?B?R0t6MUZYUHBkeTRZV3VHSmtYMzJyN29WdWQ0d3JtU2xLMTZwMjh3Nm0zMUtT?=
 =?utf-8?B?bHAwa2hjbGlIanF1ejY2c2VrdHpyb2ZORzRDbWR3MUJMaVZvTFJrZ3ZQa2p6?=
 =?utf-8?B?ZDI4NXpXbVo4WFZSeFJBbnZlcE9DQzRlVEQxMzRobDFOOGZhQkhiS3Y2dzdw?=
 =?utf-8?B?Z1pCakE4Q09LM1hHTnFsczkxRitLSTdjOXU0TGM1TTE1U2VSOEV2UUhCcVYr?=
 =?utf-8?B?TkJGTzNnVS8xOVhMcVFhdlJZVmFmcmFVbUxKVFZkamQzY0pqQ0IycFI4dWVI?=
 =?utf-8?B?TWdxUENjaUJBclBkN0VkdW1FNktodTFXWlMrMWxqbjd4Umpndjh4dkxGM3Q1?=
 =?utf-8?B?TkJJL3ozYmk2cHdaVDVqUUszVUNEL2Z3ZmRlZDdmZGxYdnhwQUtJUjk1cVM2?=
 =?utf-8?B?Y3BRVDhMRG91UmVFTTlneW9ETDRvVG52OU00L0ZDMW5DNHdYempwVFhmYWlu?=
 =?utf-8?B?Um5hZm9TblBVRSs0QlBEMnVWdHNhbkFDWEozQzREdnZOQ2xyTjg2RFJETnFO?=
 =?utf-8?B?YWJWbDErY01mZjNWWjhqdVpGTk8vSXQ5djJOaEZzellPVUdwb1lSL3ZLZkd6?=
 =?utf-8?B?Y09IdzhEMzhmb0E1Mkh5ZDFlRlRBcW9ISUYxVndiS29VNlRJTTI1UGRPUW5O?=
 =?utf-8?B?Qzc2bE5IU0hJUkVBTFJydk91bFY4T250S2hQNGZkOFhFQXhqVmVCUXVFdU5M?=
 =?utf-8?B?STdDTUpSMDJ2NnFjNXA4OHZkTzhKd1Y4TlJLaUtXYlVYSzRWR3JPaG8wQm5W?=
 =?utf-8?B?NStSeWUrVmhlK3p0TTh5eHZKdC9Ia3hBd3pmN21yMUhEUkJmNmNPRzZhTzQ5?=
 =?utf-8?B?VU9MK3VrSG5TT05oZVdmdUxzaGFOb0FiNENlWldyblc1b0dXNjJjbFl3djAw?=
 =?utf-8?B?VGlQMTBlSlNaOVJ6U3BZN3hzcU1rblQ4Uy8xOFV4MmtjNmZ1S1dZNWNXdmpE?=
 =?utf-8?B?ajVEa2FIZW1rWnkraGNSaHpMdVZDeWszYTVPaWdHelBKU2dYWDlrUW15UWtR?=
 =?utf-8?B?VE9WYjVQY3VNK3Jnc2hSYVV0bG1SOFVNWjJnSk9YUlgrWm0vbG5UTXRDMHRD?=
 =?utf-8?B?OURQQWY3eUJvRDdhVm5WVkd4VmVPWi94NHdzWVdFcytNbTdQNkx4NmszT29x?=
 =?utf-8?B?ZVFwNEJxYis4cm5ZU0E4SzFTYjRTWUVOcUpGbG05MXl0NWwrVWpGSXViSCtl?=
 =?utf-8?B?bGtMMEJCQkxpa0NtaEZ5M3MzZEFUaGIwVW9USTVETk9WaGRQR1JXdS8zTzRo?=
 =?utf-8?B?NlNVNmJrNlZ1TFp3NkNyd2hsa2tLRGJ4c2JYLzhESjNKL1ZVSWd2RE1oSFF5?=
 =?utf-8?B?UkFZdG9NMmFSNVlRZ0VVdHRVcWF5UDFCWE9jUlgyejNNK0h3VXVJNm9rK2N6?=
 =?utf-8?B?WllrYXVoV1NGNzFoTy9JWW8xQjRLRUQxQ0FybXFvandPWldNWVphbnQ5Tlo1?=
 =?utf-8?B?Y21HU3Q3YW5MbXh1OXRPUFR1dEJVQU9Tb0kxV1BJOTFuTHRrRlQ4T1IvRzJD?=
 =?utf-8?B?b2pSUEYvQnE5Q1poNFROZUNoK2hHNHhVNFcrWVNpSWVvQTZBTGZkYzFoS2Jv?=
 =?utf-8?Q?xnTdmiGlj9XWaaKo=3D?=
X-Exchange-RoutingPolicyChecked: G/P4JDCznMNhiwJzWlxiMFVUi4rh6qEBt6oR/avYzi5nou4i7HnokTXFc+fZhzR6j2Gfs/bgX0zu/ni83LJjXznEl76jb3JvwDzumHSQEAwNlnxoREPgVvwncZfT5SMKI/8JLe4WoLs1RswMjPyX5owzDW9521WTqwN2954WeZKFew4r0Ex8ylNqGXHd99AxHzxu6ElkS6EML4REjso2PcW/BurE/3FadFSme0gp4j7akkSUl/40169vKhdtxMKJ5sYeuixkfq8szmrVaSiBeFL9sn5i9YWpBgGOpZbVvwJEb9lLRN7AW3TFqUndWwKGPFyj3w8e52hLYFCwnRxJGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e03b432-73e7-4554-62e7-08df0e5d394a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:29:26.8629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ2GflSw7a36QzxWo+WH+U4CbAs41p4icHb/olDKMfFNLr2oB14crrR0cAsg0WUm45rmuATkajdRMprBszepluCNpFj2AatGML0efYiwk6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9828
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Add plane color pipeline tests for the DRM_COLOROP_FIXED_MATRIX colorop,
> validating color space conversion through the color pipeline framework.
> 
> With this, the SDR plane color pipeline looks like:
> 
> [YUV Full/Limited -> RGB] -> [1D LUT]
> 
> A single FIXED_MATRIX colorop handles both full and limited range
> YCbCr to RGB conversion.
> 
> New subtests:
>   - plane-fixed-matrix-yuv-rgb-bt601
>   - plane-fixed-matrix-yuv-rgb-bt709
>   - plane-fixed-matrix-yuv-rgb-bt2020
>   - plane-fixed-matrix-yuv-rgb-bt601-lim
>   - plane-fixed-matrix-yuv-rgb-bt709-lim
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim
>   - plane-fixed-matrix-yuv-rgb-bt601-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d
> 
> The test works as follows:
> 1. Creates a YUYV framebuffer with the appropriate color encoding
> 2. Converts it to XRGB8888 in software using igt_fb_convert() which
>     internally uses igt_ycbcr_to_rgb_matrix() with the matching
>     coefficients
> 3. Displays the SW-converted RGB fb and captures its CRC as reference
> 4. Programs the HW color pipeline with the FIXED_MATRIX colorop set to
>     the corresponding matrix type
> 5. Displays the original YUYV fb through the HW pipeline and compares
>     the resulting CRC against the SW reference
> 
> This ensures the HW fixed matrix implementation matches the expected
> YCbCr-to-RGB conversion behavior.
> 
> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
>      -Use SW-generated reference CRC (igt_fb_convert) for YUV tests
>      -Remove redundant tests
> v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
>       until we have non-IGT userspace that shows their use
>      -Add limited range YCbCr to RGB tests
>      -Consolidate all tests under single plane-fixed-matrix prefix
> v4: -Revert colorop_type_only() back to ctm_colorop_only()
>      -Reuse _test_plane_colorops() for FIXED_MATRIX instead of
>       separate _test_plane_fixed_matrix_colorops()
>      -Move cleanup before assert so failed plane doesn't affect
>       next plane
>      -Store encoding/range in colorop fixed_matrix_info
> v5: -rebase
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color_pipeline.c | 302 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 283 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..c8ee68992 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -130,32 +130,41 @@ static void _test_plane_colorops(data_t *data,
>   				 igt_plane_t *plane,
>   				 const color_t *fb_colors,
>   				 igt_crc_t *crc_ref,
> -				 kms_colorop_t *colorops[])
> +				 kms_colorop_t *colorops[],
> +				 uint32_t input_format,
> +				 enum igt_color_encoding encoding,
> +				 enum igt_color_range range)
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
>   	igt_crc_t crc_pipe;
>   	struct igt_fb fb;
> +	bool is_yuv = igt_format_is_yuv(input_format);
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
>   	igt_skip_on(!color_pipeline);
>   
> -	/* Create a framebuffer at the size of the output. */
> -	igt_assert(igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fb));
> +	if (is_yuv) {
> +		igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +						      mode->hdisplay,
> +						      mode->vdisplay,
> +						      input_format,
> +						      DRM_FORMAT_MOD_LINEAR,
> +						      encoding, range,
> +						      &fb, 0, 0));
> +	} else {
> +		igt_assert(igt_create_fb(data->drm_fd,
> +					 mode->hdisplay,
> +					 mode->vdisplay,
> +					 input_format,
> +					 DRM_FORMAT_MOD_LINEAR,
> +					 &fb));
> +	}
>   
> -	/* Hardware pipeline CRC */
>   	set_color_pipeline(display, plane, colorops, color_pipeline);
> -	/*
> -	 * Use flat colors only when the pipeline
> -	 * contains CTM colorops exclusively.
> -	 */
> -	if (ctm_colorop_only(colorops))
> +
> +	if (ctm_colorop_only(colorops) || is_yuv)
>   		paint_rectangles(data, mode, fb_colors, &fb);
>   	else
>   		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> @@ -165,15 +174,14 @@ static void _test_plane_colorops(data_t *data,
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> -	igt_assert_crc_equal(crc_ref, &crc_pipe);
> -
> -	/* Cleanup per-test state */
> +	/* Cleanup before assert so failed plane doesn't affect next plane */
>   	set_color_pipeline_bypass(plane);
>   	reset_colorops(colorops);
>   	igt_plane_set_fb(plane, NULL);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
> -
>   	igt_remove_fb(data->drm_fd, &fb);
> +
> +	igt_assert_crc_equal(crc_ref, &crc_pipe);
>   }
>   
>   static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> @@ -196,7 +204,8 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>   
>   		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
>   			_test_plane_colorops(data, plane, fb_colors,
> -					     &ref_crc, colorops);
> +					     &ref_crc, colorops,
> +					     DRM_FORMAT_XRGB8888, 0, 0);
>   	}
>   }
>   
> @@ -347,6 +356,258 @@ run_tests_for_plane(data_t *data)
>   	}
>   }
>   
> +

unneccessary space

> +/**

Make this a non-doc comment

> + * Capture reference CRC by converting a YUV framebuffer to RGB in software
> + * using igt_fb_convert(), then displaying the resulting XRGB8888 framebuffer.
> + */
> +static void
> +capture_sw_converted_ref_crc(data_t *data, igt_output_t *output,
> +			     struct igt_fb *yuv_fb, igt_crc_t *crc /* out */)
> +{
> +	struct igt_fb rgb_ref_fb;
> +	igt_plane_t *primary;
> +	char *crc_str;
> +	int ret;
> +
> +	primary = igt_output_get_plane(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	/* Convert YUV fb to XRGB8888 in software (uses igt_ycbcr_to_rgb_matrix) */
> +	igt_fb_convert(&rgb_ref_fb, yuv_fb, DRM_FORMAT_XRGB8888,
> +		       DRM_FORMAT_MOD_LINEAR);
> +
> +	igt_plane_set_fb(primary, &rgb_ref_fb);
> +	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	igt_assert(!ret);
> +
> +	igt_wait_for_vblank(primary->crtc);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &rgb_ref_fb);
> +
> +	crc_str = igt_crc_to_string(crc);
> +	igt_debug("CRC for SW-converted reference fb: %s\n", crc_str);
> +	free(crc_str);
> +}
> +
> +static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +					     const color_t *fb_colors,
> +					     kms_colorop_t *colorops[],
> +					     enum igt_color_encoding encoding,
> +					     enum igt_color_range range)

derive encoding and range from colorop[0] instead of passing them as 
argument. You can have an assert that colorop[0] is a YUV to RGB fixed 
matrix type.

> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_plane_t *plane;
> +	igt_crc_t ref_crc;
> +	struct igt_fb yuv_fb;
> +
> +	igt_require(mode);
> +

Do we really need this? test_setup already checks for it.

> +	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +					      mode->hdisplay,
> +					      mode->vdisplay,
> +					      DRM_FORMAT_YUYV,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      encoding, range,
> +					      &yuv_fb, 0, 0));
> +	paint_rectangles(data, mode, fb_colors, &yuv_fb);
> +
> +	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
> +	igt_remove_fb(data->drm_fd, &yuv_fb);
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     &ref_crc, colorops,
> +					     DRM_FORMAT_YUYV,
> +					     encoding, range);
> +	}
> +}
> +
> +/**
> + * SUBTEST: plane-fixed-matrix-%s
> + * Description: Test FIXED_MATRIX colorop for color space conversion: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @yuv-rgb-bt601:		YUV BT.601 full range to RGB BT.601
> + * @yuv-rgb-bt709:		YUV BT.709 full range to RGB BT.709
> + * @yuv-rgb-bt2020:		YUV BT.2020 full range to RGB BT.2020
> + * @yuv-rgb-bt601-lim:		YUV BT.601 limited range to RGB BT.601
> + * @yuv-rgb-bt709-lim:		YUV BT.709 limited range to RGB BT.709
> + * @yuv-rgb-bt2020-lim:	YUV BT.2020 limited range to RGB BT.2020
> + * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
> + * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
> + */
> +
> +static void
> +run_tests_for_fixed_matrix(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +
> +	static const color_t colors_rgb[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "1D LUT (linear)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +
> +	kms_colorop_t fixed_matrix_yuv601_rgb601 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 to RGB601",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT601,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 to RGB709",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT709,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 to RGB2020",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT2020,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 limited to RGB601",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT601,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 limited to RGB709",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT709,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT2020,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};

We might be able to re-use the global definitions in kms_colorop_helper 
but we can take it up later.

With the above changes.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} fixed_matrix_tests[] = {
> +		{ .name = "yuv-rgb-bt601",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
> +		igt_describe_f("Test FIXED_MATRIX pipeline: plane-fixed-matrix-%s",
> +			       fixed_matrix_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-fixed-matrix-%s",
> +					   fixed_matrix_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				test_setup(data, crtc);
> +
> +				test_plane_fixed_matrix_colorops(data, crtc,
> +								 fixed_matrix_tests[i].fb_colors,
> +								 fixed_matrix_tests[i].colorops,
> +								 fixed_matrix_tests[i].colorops[0]->fixed_matrix_info.encoding,
> +								 fixed_matrix_tests[i].colorops[0]->fixed_matrix_info.range);
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
>   int igt_main()
>   {
>   	int has_plane_color_pipeline = 0;
> @@ -377,6 +638,9 @@ int igt_main()
>   	igt_subtest_group()
>   		run_tests_for_plane(&data);
>   
> +	igt_subtest_group()
> +		run_tests_for_fixed_matrix(&data);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

