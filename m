Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1D5CD37B7
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 08:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E8E10E18A;
	Mon, 11 May 2026 08:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhO0El2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE9610E4FB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778489677; x=1810025677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/aEeVTwCA6KTWKKKjIr+KHzfxM/gfSU+rnoBDx7SBRU=;
 b=jhO0El2IHVXGc5j2SCbLNaFimkt0BURMk1Klu+DckSmkiQxqY8lgBu1D
 k49PZy2jzj3bKBsKvIRuzzclyNETRxafEcFSPlxoGb+cKmr2k+fTOUbu6
 CI/Fw5c0SoyrqnQ/JKXZ2oOaNeygvv0+SbRfOPVEvHEY3xVEzNkAdcK9H
 lVw7vq52ZioqC+b/I6AsZnV075OQmW+DgVgBJwlbtnNPgT6v0UAlWxuB0
 Im0XQBmVskE8coMVbyXQK4zYJexfU6usson1LcUFVcJXmeebmITJq5PIN
 zaaPZLnQSbCAh9nK+h2eBSN+66qP2ybuPCEIHeyECkhMY/O+FfqAMpRIV g==;
X-CSE-ConnectionGUID: paUy/kwvQomRPKQ/Hd/UZg==
X-CSE-MsgGUID: XsWpTdaeS4GPuoLEpGXlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78515404"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="78515404"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:54:37 -0700
X-CSE-ConnectionGUID: i/G901z0QfG4aFUw0JqRWA==
X-CSE-MsgGUID: v88FAWC+TyOe+XrX9FOPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242364354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:54:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 01:54:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 01:54:36 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 01:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4BaMICQL8zSCOEGjUs2xRxsH67vQOOSqwgy/57Sk9ZOntIEcE+KO9rE7udDdUoHqGx+jRcs7/5NgaIcMJJoMdHfjvVvxxcM9lvtWAXgCSQX0URm0WdptZYhuG14q2jQKD2w9BfyLTOH6kMoFjG7pWaLvjNxFfxhAodHrWB1mVWCv5Jx9jv9LNA/a0vPWrVgndONk9jLvY3g6i9oGRWiSvIokAkgWUE8cUACIX3ZabYyG+mCkXGsBcoWrldR2WbYvT2aQIFMFJKyOXfb71YFoqgKxVheigfGOysDJKwe7PO1wps0jDQfVAq8eM3OftIp/yoz5dF15jFcEktfZrWujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hRAeIjsSK5uSiXRRntSMK+KCUY8vYhg6JjS1uXqqPc=;
 b=XccR1wDdYOscWGJAmYcuOEtLVTw4Ec9P8zeVIGX9VhMPtxwc/oLFANpK/QH9PyCG4dSxxW11MLcTY7GBcCLYQ8klV3Mz9/0KYzMdJM6BujdZ/X1z4GhWqVxs3xbc/LoBa9JPUf732PhjNqDpiKzs1K9seCA19Sddjna9m23sqIWQCkx7K7G0bk7RwxWEHCFwSARE3jFS3rPC7hdrn9ZiZIJxMQRkoo1EXwlMR/Q7mca9fswroBinRXw140wwls87eSjp9AaYUbY+j75gIJHa9hqz87L7s7EetxTvuZi3Z4xmMb3c8BD8rpkWpvF2fi9VXXjGBsmBuVwG8/PZs6GJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:54:33 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:54:32 +0000
Message-ID: <22bef27c-adc9-4747-b948-87f1a5501b5d@intel.com>
Date: Mon, 11 May 2026 14:24:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tests/intel/xe_madvise: Add atomic-device
 subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
 <20260511035310.32323-3-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260511035310.32323-3-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a749730-a202-4f64-631c-08deaf3aeb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZJeSnryyNpzKMJGnTA81ussB5LuYUfPkQ1ilm4jHnHaGui9QndJL41ECkFHbgnjt+iQmh8izi5PYxzky2mXjyAURnmh2Eu9bXIp8hpxoAZBXuem15tgUCo/EJrNN7/Gckuo8+CyuHUoYHD5Ks0NhJof3cvpZIWPC0RTIxDroGwdGf2FVdlZO6WLp/3YYmffAu6N2YTXs/Q14FNjZ3jSHl7IxdHTckhr5NC8SFKp+dwvFuwQMSmYbXkjlQ/GTrTMGZIza+hcmshi/IKmnSA0GLQZmLYbFzkvtGcdlx2wSx/pVnfeHxSYgMQaGSmjVjNTIHASdiHHsQ9J9D9mbFhR8WlX1TO0PV2MiSQG9uPBlJXBOYThlzWW7kv2OZOGkubFlmxrsAJbDeF4H0qsFxKYCt/nloNIKDwUIHzrfb/dSoRHcLtHfJPAf8r9aJUG6oKegmfm5Xt+w1YWf7EGhu6y832SSNvK3z9fyCxm6L1nY5U/YGrFZGeW/mZXHAaYqIqkJ50qj5RfQi2Juu6lJTgdJG9ymoCq+9vC8VLil9CfJ7+oUI/gC9yykN1GJ9K7jZ1BVepf7Sy8JI821zVpHakgKOoUNmK2KPQcbjkbMeOuyHee56TdCTt2bQZzJAnCCrGNC3EpDZGu/cNPkvgOOMvNfHH5/qKUIlcbIbobhrMq0zq6AcbqaFPUPxdJjq88/bhCE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZBaTVqVHNaSTBtcURUSlFIZ051UXFhVjl5NmpKeEYxWHZBK1pxcGQ2eUlz?=
 =?utf-8?B?dURLOFBsaEJCa2phdmxCSWVEZU41RVRkM2N2RXFiUGRabmpHdy85ckZpeUpD?=
 =?utf-8?B?eDl0cUtkT2JKZ3Q5UVc0b0huYmdKSWJRdm41TGxaOHRIaUVqeVlEb3dYRmFt?=
 =?utf-8?B?NG00K2s0SzdzYXVrcFkvYXpzNFIxNEpSN2czYStBNzJQVW1hbmpxVzVZN1kw?=
 =?utf-8?B?VThEV0ZZYTdFalhsaHQ2QTRBWkxMdFNVUFQ3MUs2d2VjMkhXSG9YTmpCdnlC?=
 =?utf-8?B?OEtvU3hzaWVNR0YyTWpuOTgwYU85aFhtRys3ak1ROXZYSEJqKy9sM0N1VDAz?=
 =?utf-8?B?REhEb2dFQVBiSXhqWDBTbDBWQzFMV0JrRlk1TlZGUUdCY2EwS2FtNHdxcDBV?=
 =?utf-8?B?cDBXa0VYL240NzhDYlpyYXU5ZnFzbmQ5Q24vVGNJM1pWTFA3NXhYYjJmK3Jp?=
 =?utf-8?B?Wk1rRVh3QkxBeGZKbzltSmM2S2htbnZnQ1V3OFdCdElUZUpETUpMd045bVYy?=
 =?utf-8?B?OFNMVW0zekp3ZFFRZnpPVDNnWDIyYVBKdmdlN0JqQXAxK3NFbG5CWkdxM1V5?=
 =?utf-8?B?WWFtNWNHc1lSbWtEOXd1SHkwOUZjVjJxQjkvYjNCSEtNd1BzcE0wdkJuZDZZ?=
 =?utf-8?B?ODhzVmhISjFhK2IxeHRQaEJhVWFEcUZaczQ4VVJ5ZWVRQytuNUhiUFZnTUs1?=
 =?utf-8?B?WHRodUpqcUxlWTIyby9aNVBlWUNUeEJzcnJaS1czRFZEcE1tWnU2REhFdjFk?=
 =?utf-8?B?MkN0ODJCbXRnQVF4TmxBVjVPaWdXUEl3MzlQUGk1Kzc4S2xYMC9ndk9YK3hw?=
 =?utf-8?B?eVpLZmxjSFVyZlhBODg1cmxGdExnR2I3VVdNeis3aDVoY0lQcGZ3TGRRVHRK?=
 =?utf-8?B?L3FnWXJqSXU0dkx0R3ZNV0ZaNkFQdmhkT1FnQ1JFeFo1cUUzMUdaR01ZQWlk?=
 =?utf-8?B?c1dCT0dxSm1iVUh0dlA5bUxIdkhKQTIxNndYb2M4VVhjSm5vNDg3Mk9ianY5?=
 =?utf-8?B?Qm9lckJFMHdDTkNwY3l4UTlDS1c5REl4dWJxdEZPSEE1LzB4dGUybnE3RjlK?=
 =?utf-8?B?NDh5YXNqeFEvV2gxMjV0TnVxazBJVVFFWEdXY21IZ0JuVTBSVVFIL1B6M0hr?=
 =?utf-8?B?Si9kUUkxR0dxd0p0VmJldVhuamRYVWNucHhMNGtSalErbmw1LzJGYVBvNk1j?=
 =?utf-8?B?ZzdRS2NnN0xrVWM3RTdrYlNmcXZMRkdlNFozVjVmYWRyV2FiUW5MS0VnREUv?=
 =?utf-8?B?YWN6eU80OVM5YWRMbGNmb0VxWDZ1akhzaklaZGFnYWpWVFBZYXhKY0lzQXZw?=
 =?utf-8?B?cXg3VkdVUERBQ0dzaG5Bd0wzUHo2RU5Rd2tkVTFGWCt5RUFHZ3psU0RRUzYv?=
 =?utf-8?B?K0JJZEhiNEM4ZndETXlZUDY4bG5VUk1oVldhWDNkQmtiS1UvM1BKb3dVR0U0?=
 =?utf-8?B?TFRaOTZrSFlOQXJWdFpMVnA4UElOWXkySXZscllpTm83MmRxdEJoNXpHaFYy?=
 =?utf-8?B?TGh6R1o1cHZRRU5md0dkT3ZZRHFHck1RZW45M00zempCUFpLN21keU16Y3Na?=
 =?utf-8?B?ZnBPanZJcmQrRVlEUmpLa1lYeVFmMVpzL1IxeVZzMXlJdmtodDdib1Y2WTdL?=
 =?utf-8?B?d2pIQlVaeDZoeGZXSmdXcjA1czR4UFBpYTg3U01CQ3drZTViVFFabWlCQXkw?=
 =?utf-8?B?cmJLL1ZudW9JbnlFTHJEdSsrdmg1MnpJeUZEUm5KS2RHc0Y2Z0NCaXNPRTRx?=
 =?utf-8?B?Ymx0Q2dzMkd1UE42OGsrTFUxaE1TTFFWNzZRWmhmSWdENTQyaFliVGtyVkMw?=
 =?utf-8?B?Y2ttYys0dEJzN3RZTzV6YnpPcnowWjZ2NjhESjBhT0ZHYzZWVjFsUUJkKysv?=
 =?utf-8?B?RGdLOTZLbDM0VzZmUGc2ZXpzMEVxWUwrQnU3S3ZheVFINzF2NlMrOU1kRWdN?=
 =?utf-8?B?UlFRU0dINU1QMU9LSEdjYmN4eGZVQjNJbDl2dElkeVZ2cWxXREFaYjVNVDRv?=
 =?utf-8?B?di94R09zSCtDanV6RGgvOXk4VUJYendad2R4azNCMHVWQzBRMEZyZEhoaUtz?=
 =?utf-8?B?M2FZb0YxRHZVMTREazNCZ3BXb0wwZ01YcFFDcnR1bVhNdmNvMWNNbDhXM2dY?=
 =?utf-8?B?TExkUGNVYXBPSDF0Ni9TdEVPS0xXQVQ0WXorNUkxQU5YbEQrKys3amVjTEFz?=
 =?utf-8?B?RDdvcjNGd2dtc3JVcUFyZ2hGZk5VTWQ5REFkU2xqNDYxUWZXbzdYR2FScXdH?=
 =?utf-8?B?V0t2TlFWSlVSdW56ZW1qdDQvcWY5d0dtNnQ2Y05aRHlkMisxTVJsdVhRamFS?=
 =?utf-8?B?S3Y4amRLWVdWejlIKy82NDFPbS9iNnM2WSt0ZVM1S2NRZ2IwYmptQT09?=
X-Exchange-RoutingPolicyChecked: rLZKZbdWCdbi0O0wZ6dteiJDZpXKZCy5C/F476yBPB9IG2mfN/8gn7KcGdz2iAnrJjFIgVIgp/3Iw4jVj09UEgqtF3Xv9GOC/APqaGMSoi1hqOqfe6JitqTV59wZrMF3EPZjSSZpG/VroqPkT1uZ+r5pfh5OP7dam/45RRH5OlxMplHTbkXm/QXZqsxIPfWO5Bvb60xOXvvGirEKVpgyLQxmnR7k3z//jIYJi9xEHpVE0Ftt3SXAvXjlEnyS4nXahW9NqbZpMiF9AQxlx4ICJ21JbxNbzBx1VMNAlisGqeVt/GjWCRDl2dFpsakFvoZIs5tQlwQQwJCpZ/X+oxNSIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a749730-a202-4f64-631c-08deaf3aeb43
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:54:32.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMoUJTw+BiEkNScH/GNh1bXYxkMQJNR/l8vSy7LeYWvNGz7XXUcd74TQlbHTEgmZ3uaRgzb5B1Rt7t+YhePGcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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


On 5/11/2026 9:22 AM, Varun Gupta wrote:
> Validate that madvise ATOMIC_DEVICE allows GPU MI_ATOMIC_INC on SVM
> memory.  The test creates a fault-mode VM with CPU_ADDR_MIRROR binding
> over heap memory allocated via aligned_alloc().  After setting
> ATOMIC_DEVICE via DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise, the GPU
> executes MI_ATOMIC_INC through the page-fault handler which migrates
> pages to VRAM for device atomics.
>
> Also adds the shared atomic test infrastructure: struct
> atomic_data, atomic_build_batch() helper, timeout constants, and the
> atomic subtest group gated on VRAM and fault-mode support.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>
> v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
>      Add pagefault count print before/after exec (Nishit).
> ---
>   tests/intel/xe_madvise.c | 122 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 121 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index e79cafbff..f343f3c8c 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -14,9 +14,12 @@
>   #include "igt.h"
>   #include "xe_drm.h"
>   
> +#include "intel_gpu_commands.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> -#include "lib/igt_syncobj.h"
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> @@ -27,6 +30,11 @@
>   #define PURGEABLE_TEST_PATTERN	0xc0ffee
>   #define PURGEABLE_DEAD_PATTERN	0xdead
>   
> +/* Atomic test constants */
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +#define QUARTER_SEC		(NSEC_PER_SEC / 4)
> +
>   static bool xe_has_purgeable_support(int fd)
>   {
>   	struct drm_xe_query_config *config = xe_config(fd);
> @@ -768,6 +776,107 @@ out:
>   		igt_skip("Unable to induce purge on this platform/config");
>   }
>   
> +/*
> + * Atomic madvise subtests — validate DRM_XE_MEM_RANGE_ATTR_ATOMIC
> + * modes (DEVICE, GLOBAL, CPU) on fault-mode SVM VMAs.
> + */
> +
> +struct atomic_data {
> +	uint32_t batch[32];
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +};
> +
> +static void atomic_build_batch(struct atomic_data *d, uint64_t gpu_addr)
> +{
> +	uint64_t data_offset = (char *)&d->data - (char *)d;
> +	uint64_t sdi_addr = gpu_addr + data_offset;
> +	int b = 0;
> +
> +	d->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
> +	d->batch[b++] = sdi_addr;
> +	d->batch[b++] = sdi_addr >> 32;
> +	d->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(d->batch));
> +}
> +
> +/**
> + * SUBTEST: atomic-device
> + * Description: madvise atomic device supports only GPU atomic operations,
> + *		test executes GPU MI_ATOMIC_INC on SVM memory via fault handler
> + * Test category: functionality test
> + */
> +static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits;
> +	int pf_count_before, pf_count_after;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	/* Bind entire VA space as CPU_ADDR_MIRROR */
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_DEVICE, 0, 0);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	pf_count_before = xe_gt_stats_get_count(fd, eci->gt_id,
> +					"svm_pagefault_count");
> +
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
> +	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +		       exec_queue, FIVE_SEC);
> +
> +	pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> +					       "svm_pagefault_count");
> +	igt_info("Pagefault count: before=%d, after=%d\n",
> +		 pf_count_before, pf_count_after);

small nit: this will print pf count all the times whether pf not 
generated . Add loop

if (pf_count_before != pf_count_after)

igt_info("pf count prints);

> +
> +	igt_assert_eq(data->data, 1);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -826,6 +935,17 @@ int igt_main()
>   			}
>   	}
>   
> +	igt_subtest_group() {
> +		igt_fixture() {
> +			igt_require(xe_has_vram(fd));
> +			igt_require(!xe_supports_faults(fd));
> +		}
> +
> +		igt_subtest("atomic-device")
> +			xe_for_each_engine(fd, hwe)
> +				test_atomic_device(fd, hwe);
> +	}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

With above change LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

