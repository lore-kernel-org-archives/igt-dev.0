Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E335C2A09B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 18:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787410E479;
	Fri,  7 Aug 2026 18:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4EBLpWR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA94810F577
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786125629; x=1817661629;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=afhUcVTg8ZaRGHROa/1irOH0wTCfGTbCJWiGCcAtiiE=;
 b=h4EBLpWRQgQbMhqgwHpw5KghsdchE6gQReJGXYV2mfnSSV6u2RidXCLF
 bFQtS+IGb4Fa2O7BMoyo7Gybju+VxIQcLVZ5mz3Oyp8hDruHvoelIERwX
 0+hbVtsJDLDMo/OxUdlt54BK15LxPv283yXiPQid/GbiwuTVhgJxewdZn
 zIVZwreyo7YCrkkA5AhSXNfd8JYoISvuaX27J3+/YomIC4v8dArje+RCl
 QvjBa6tBqiw+jZ3lgyFeIVeQrMWShw+2f5f0WAvgfiMKrOQrHz/ccoidh
 U7jHRtCrkcHGGZLTlSmiIVNy+rtUSJo4LtIi1c7IUPwtVB1cdMDSsWNCj g==;
X-CSE-ConnectionGUID: TKfNkVzrSUSAWe2pv19cwA==
X-CSE-MsgGUID: rkI/RxzkSmCf2/WbJTTcgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86765855"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86765855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:00:01 -0700
X-CSE-ConnectionGUID: TrVpDJG5R3+nLDN2H272ug==
X-CSE-MsgGUID: DpfdKe6oRHq/wjYt+7MCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="267613585"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:00:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:00:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 11:00:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKSH0uofPYhf7Rs9vMWdVuMtxLjmmTgcR9pJnaRh3fOFcrRI1yQXuowRYtb7Fljvm9LuPvSQG7BysJFOAeTeCbla3sjqL0xz+iuvrAlUS+Sx+EkTYLyyNIYDauSTpZByCtMO6ZCyj5PHk4xpTHeaA+vh3o5t+V0yrxwTukx8VXZv2Yf5D4zS8QRjLR9DicnJBwK1N/UWjToH6DtFhxHG1YKePLi9OFn9EADxbAsBZoOoGg9Waq/LFhxwQ4/kgoBkV4lB+XrfpV4nyNBV4u5UVOSQur1xbjPfDFWs7pordeUSV4dwQ6bVfz01Z7bIJgJeVf+U5XNBnGiijYwCLKdU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nopVKo1HcNptY+/zD2+hIbl/AJUjNMb6mfl7MTJNJgc=;
 b=lGlFHtZhXYcJh5BlfkdOfKfuqcHD0TteliD3AUJ6IUddEs6T8zyUFgjV2HY9P4brZKUKlSUTAg7pSnUt5snge0J3+a8VUxHqVuYWS0ZSsPsbUzGmPg/4d2Sh5UU8PV/serXAfflEJS0P7JkmE+9qRs55MhJQ1UDwLiWCBeBTVbvei+1zUxfIeuqeZ9g6NVDLwGS4RVHzRNdPhyjUe/YnYdDWylUjuQk+FZsvtl6AImJiPNx3yKxUIv7sP7SeamP1WAzs5f0rOrVAKhpFTwRnM1xVLuCzV12O0kLp6UhvrNvx2YttDtqEivGehShqfaxUrNCK636IRjnXHzduQc9u/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CH9PR11MB9927.namprd11.prod.outlook.com (2603:10b6:610:344::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 17:59:58 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 17:59:58 +0000
Message-ID: <cb87a07f-f417-467e-8d92-55df62fa5e40@intel.com>
Date: Fri, 7 Aug 2026 23:29:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_ras: Add test for GPU health
 indicator
To: <igt-dev@lists.freedesktop.org>
References: <20260716153739.744575-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, Tauro Riana <riana.tauro@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
In-Reply-To: <20260716153739.744575-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CH9PR11MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ec64d0-a0c8-4ad3-021f-08def4adb1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Dr/18L/P3Ybm2TnDcXtgpO5KFeH8sH/JT3cd4kyyP+PMbc0kbzSEf/mBc9vK/2zg3A1J2nJC7WcXbYQ54PGmSlh5E3iddK6+FG8LfsOziDRYhWl/RyQ7o5V/jXThyf2dBxIRltMNeZPoUsKX9j0e1/GYPWuwvqVzVx8WF0f104DR6c6mWjW+ELfHpGLPW8nU/evrAPwaAkfztk7KBUT0h18Lav99UWzvK2WjGnFcFQFlr5Phuxh+0fr529at/5zhHilUwRNHOJXbacoL3Of3JPeXhMboIXvqIbUFqm5BXMCEE9zHs6XnpdtljNR7CFwt2Y/Wz9iq76ybKhc1soFXutk+PkPakw2Gy7mh2L2umfW9OsC/jpK95o+Vk7+IEq8wsM/7x4uc4KQmL69ZtLyoj/+zf9UfGbasAtyL+ehdUyW62/5AmceT6h+WZlGs8qYNMfQqSVmPDT2lUhleXuVkIcLu6H9bI2xTP+GI976n4/qgzcwZJs922iAUHZhVaWGmUsQuUKSJK+LkUozegg8kD+ncxK/4vwdY5V0lcqBgAoMrgS0lSg6lhp5f4z7xEMTSTa6CWEnh5rixNj/t1bJPkhH0Vv7bWdVF4QssmhUB+BT3dNjTsLR0tTLzATrkDPlq54IJ1OeJ6QJmqHGstMxyXjqL+0CXNp6mpcNcV/lTPc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXo0TUNJTm1RYkgxWCszUElBaVRZemJNTWZiOFZlOEI0MFkrcGljMEExT1Qy?=
 =?utf-8?B?SWUzaXdrNkZ2N3RxNmJLWmFqWU0rYUtHUmgrcDE2U0ZVS2tSOUxveTlUV3Ez?=
 =?utf-8?B?MERYVGtTcHA2M3E0RlZ3SE5rRnlGRUhKMEI4TDdJNzRJQ1loR0h2TUxRRkl2?=
 =?utf-8?B?cE9YaDFJTHd1dE9BdHkyaWYrandrYlRsQ004QzFpeStoRE40cFp1S0lxK2cz?=
 =?utf-8?B?N3pwb1NQSm5RcFNoVUxjTUhzdjB3dGp4bGpYNWp2M1dLZzdKWktwTHhRZ1k3?=
 =?utf-8?B?c2NlcklIUXlnMVZZelNRTEV6Q0hvUWZlQUxhcncreGYvTldORzlXODhqdWZ0?=
 =?utf-8?B?TWh2YXVpeW12WnhlWnV6SWh6Q1d6d2R0VUtTZzBqOUVnZmZLZHlldmovaGQw?=
 =?utf-8?B?a3dKRGVCSjRZcGJOZVZpd3VXSTJtOUJKYkxIeFlaUlNMdlRKeWtmV3FvYXVv?=
 =?utf-8?B?TWdDMzVwR0U3WGV3cUU0L3JYNXVQcC9PMlVHdFRqMGE1UzdHc0hqYnliYVNW?=
 =?utf-8?B?NXhOaEJKeTAwVzNmd081RVhiKzNRQ0lNZ0xLVFUrUy81WEtmcXE3eTJnM3FJ?=
 =?utf-8?B?WGZHR2c5b1ZIRnVqbVlWamdqUTlzUXJHUEJnUEg1eEpQZVF3QUVLY3FnUjJY?=
 =?utf-8?B?Nmp2V29UdTRTbTJvTm9WVjEwRit2SnpOMzExcXBWK1VnT1RPdnM5Nnk5M09t?=
 =?utf-8?B?ZTQ3eTVnbFcrb2NFOWRKcUJIN0ZlS2Z4ZUE4VXh0TWNNQ2RNNXhEZEFzTmFh?=
 =?utf-8?B?QXFLSDdNWitPS2pEaGpYN1E0ZUY5bHcvRitYL1dqZXlKd0hGRDdhK0Fnb3dQ?=
 =?utf-8?B?d2ljY3BSbVkvWFlXc0ZUVDkvdW9jU3ZvSmdrWHZ3V2VLUHBKRC9ucno5Z3VI?=
 =?utf-8?B?M3pMcmJzK2VlNUNEMnh4OUw5Tk5ldjV3NHBDMlc4VFV4cFhHMERMbmZZQW9t?=
 =?utf-8?B?YkpSdFNHb3p0UldwWk9Eem54ZUtXdTcvR0NyRFVncmZMcEJEVXJabmFpb0Rl?=
 =?utf-8?B?VVJwTlBsbXUxSFp5K2dhUUovdjNoWGlWYitJNk9LczhlQXlhYmo3RkJmbWpZ?=
 =?utf-8?B?Uy9aWXl5VnZnZGpmc0FUTUxSS1ZTQmRUKzNLU0d4NDQrcHNMREVxelJQaCtV?=
 =?utf-8?B?d3Q2NTkwVnJ4L3dyZUJGS1hxbzNER1czcFpIVTdOeWFNaTA2TFRyWlMybkl3?=
 =?utf-8?B?UUxrdlZtSkNCTjlXbzBNRnJ3R29MMEg0M1Y1Mk9zSEwyblpDNUVldVhIY2pN?=
 =?utf-8?B?VlNPM2V5cUxRd1NCOHQ1YzAxd0ZjMTZxWll3Wkc5WUlvUzNDNEM3YzFOQVlZ?=
 =?utf-8?B?d3V3K0Z5c0toMU9lc283MjIvZDEyRGlCTGdEQm9pWDJ6ZmdjMzhWczNWV2s0?=
 =?utf-8?B?bnBEbmVrbmlTYTVNZ1RRS0dQajMrUWptTWl4RHZ5dFJvV1hQZkNXSFF2K3Bz?=
 =?utf-8?B?ZW9hMVJsemxjblpIcXRTK25ieVlaQkpEbGJtZHhoVHptNEtXdmFFcmtkTjlF?=
 =?utf-8?B?RkZYbkVRalJ1S1ZxK3BGMkdOVjR4MGczR0RxTlJtTW5ZZEJiTWIrSzhZVUlK?=
 =?utf-8?B?Mm8vRGErS2Zvd1U0Ylh4dFduY1FRbmRrOFJ3MXlqUHZna1ExKzV0RkhvSy9G?=
 =?utf-8?B?RVFIY2lqcGRweUNLbGttK0NVYldueTZJNHlzbXlCRE5rZ1lvc1BNUms0ZHp2?=
 =?utf-8?B?OFZ6TjZPbStkM2N3ODY4V0dSM0xqWXhLS1J1aHA1NWZ1emJ1UFFHYWdLWEZV?=
 =?utf-8?B?WE5WL1JUckQ3Zi9ZV3F5c2pMVkxTMjIwZVAydTFxZkJGM3gwTkFjaEt0b2xh?=
 =?utf-8?B?S2ZYUWt5QVFxK2REQ1JSOUJheXZyTzVFVFYray83UG1rSlRPUGlCTEdlaWE5?=
 =?utf-8?B?ajIxQS83aGRzR05UQitWeER3VW5aYjA1ckZjSUc2VjNqQ1hwdU9aRW5mWGRy?=
 =?utf-8?B?NW9CS2lid2lqNmRBVHY1SGdWQ1ZsR0hzdG5nWTROWEpIeSt6Y3lnbXc2SW0r?=
 =?utf-8?B?ZXpHTkdYL1dCKzhFNEtmSjdhTjBNajdtVXdWSk1YOWk5Q01QK3VaNTJDcHg1?=
 =?utf-8?B?T3FNZjhiQ2UwVjhpSmdKdmF4WVR2RnY4YlVlMzVvZXI4TUxLVEJJT0NWTzJn?=
 =?utf-8?B?ZkdzYThhTGZiZ0lQcDM1TFhmd09ZcUQ0TmVBTXJaUVpuY3kxOUREajBGUzlp?=
 =?utf-8?B?YkVpdHcyeDRya2kvNVJ2RFdiNGZCR2h5b056WXFkUlRvZ3k3YksyNlhNYzFx?=
 =?utf-8?B?NGZLNXVqOHYyTlFVTjlhTTVvbVJ4M1FzbGlJejZBSDVQeXpYaUx6NnpVL1pZ?=
 =?utf-8?B?azZyRFpwb1RDeEtlOWY3WW1uMVpscUljbmJvOEdWQm1pYWk0OXBlZz09?=
X-Exchange-RoutingPolicyChecked: RC6Ac4iHKy3zcdZDz6FHDhVrdC1qWyHbA+y2nj3wjyC6qf8u3wbu7AXJJ3X8ukgcdOQ/3Fo/BJGaczwnN6oJo1orQVGc7b/qM2nM/zxFIX6IVH74cDNbRkDuW32RFoc0zfUeTSfumRbAPpCk28JGsJtjF3VCRrys78AJCve+Z0DaFFuSBdz8ISDJkOFG+s8io4kiErNefE1F3DnAGtkRo2Zy3PWTZj95Cjw57JBSELaSFArbvpIWdaGm46Oi2bTv+JYIw8i/NfcBdIOVexHdO6uZGu8+StPMdg3lemOyfzWiNP7wVB7r5JM5n3BRNkTPF8TF5PXoa7XnmcFtqCM+rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ec64d0-a0c8-4ad3-021f-08def4adb1ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 17:59:58.4877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UDMcsejdhUj/4RkXsl5RXb8A7p5SUNlFmDgu6/E7cfYCFHE5FP1OmZ4ES7raQg4oYvLke4NSF/Ue20vNDdP4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9927
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

Hi Soham,

On 16-07-2026 09:07 pm, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions in the
> implementation.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_ras.c | 127 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 128 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..e2465cbb1
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Functionality: ras
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid
> + *		state (ok/warning/critical) and rejects invalid writes
> + *		with EINVAL.
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_query.h"
Add the "SUBTEST:" description here.
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +/*
> + * gpu_health lives on the PCI device, reachable via the "device" symlink
> + * under the DRM char sysfs directory returned by igt_sysfs_open().
> + */
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +};
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void test_gpu_health(int xe)
> +{
> +	char *orig_health = NULL, *health = NULL;
> +	int sys_fd;
> +	int ret;
> +	int i;
> +
> +	sys_fd = igt_sysfs_open(xe);
> +	igt_assert(sys_fd >= 0);
> +
> +	igt_require_f(igt_sysfs_has_attr(sys_fd, GPU_HEALTH_ATTR),
> +		      "gpu_health sysfs attribute not exposed by driver\n");
Is this sysfs is available for all the platforms out there? if not 
better to add a condition here before directly skipping that.
Also in case of skip the sys_fd will be remain opened.
> +
> +	orig_health = igt_sysfs_get(sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
> +	igt_debug("initial gpu_health: %s\n", orig_health);
> +	igt_assert_f(valid_gpu_health(orig_health),
> +		     "Unexpected initial gpu_health value: '%s'\n", orig_health);
> +
> +	/**
> +	 * Invalid writes must be rejected with EINVAL.
> +	 */
> +	errno = 0;
> +	ret = igt_sysfs_write(sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
> +	igt_assert_f(ret < 0,
> +		     "Write of invalid value to %s unexpectedly succeeded\n",
> +		     GPU_HEALTH_ATTR);
> +	igt_assert_f(ret == -EINVAL,
> +		     "Invalid write to %s returned %d, expected -EINVAL\n",
> +		     GPU_HEALTH_ATTR, ret);
> +
imo only one igt_assert should work here.
> +	/**
> +	 * Write each valid state and read it back to confirm the driver
> +	 * accepts and reflects the requested value.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
> +		const char *state = gpu_health_states[i];
> +
> +		igt_assert_f(igt_sysfs_set(sys_fd, GPU_HEALTH_ATTR, state),
> +			     "Failed to write '%s' to %s\n",
> +			     state, GPU_HEALTH_ATTR);
> +
> +		health = igt_sysfs_get(sys_fd, GPU_HEALTH_ATTR);
> +		igt_assert(health);
> +		igt_assert_f(!strcmp(health, state),
> +			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +			     state, health);
> +		free(health);
> +	}
> +
> +	/**
> +	 * Restore the original value.
> +	 */
> +	igt_assert_f(igt_sysfs_set(sys_fd, GPU_HEALTH_ATTR, orig_health),
> +		     "Failed to restore original gpu_health '%s'\n", orig_health);

The restoration should be done through a exit handler call, else any 
prev error can cause skipping this part.

Thanks,
Anirban

> +
> +	free(orig_health);
> +	close(sys_fd);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +
> +	igt_fixture()
> +		xe = drm_open_driver(DRIVER_XE);
> +
> +	igt_subtest("gpu-health")
> +		test_gpu_health(xe);
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 6d90627b9..4ab4ef603 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
