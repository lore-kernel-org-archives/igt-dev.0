Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E666C5DF9D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 05:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C610E38A;
	Thu, 27 Aug 2026 05:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrVy2hG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93310E09A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 05:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787808698; x=1819344698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZBgNiJUYHhcitltiNpTYLPAiXagKRDCCvFZszl1xA1E=;
 b=mrVy2hG5JLTIUILR++WCUE8Ls1A3b5ffizz7JAnINMllLNgp0K3e5EoS
 HhuwcdClnKLyNLkkMtKKEZ6l6usWW05IWKO1Ai57PQLUVli2Q9CfeHUTC
 Acupj1ZRL0VSxJ/4PMrku6plfBs84ioBG0FIVv8xaMJV2HbzGDvDjuA0/
 3O6G461DP3LxdzFIC5p+dGICI3DEQBLLB8A4kovqGUxnADtOyqBFySpnn
 1NIkdCjR5X/NYYjqR6Q6WbZ1LsqQpO/m72k61AmOZub1iFkRgNX3U2ncN
 OvkIiHOcmbRcZHCwsqU1Jhw9W3A8tmjOBsProzS0K4GAEP9Tyh0GJEpTi Q==;
X-CSE-ConnectionGUID: 7ZtP/iz7RLez8FJ81J25Pw==
X-CSE-MsgGUID: I8cUo53dTXaIy8yS2Katgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88327500"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88327500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:31:37 -0700
X-CSE-ConnectionGUID: j9TdtrMcRZq1uiIsTB0Mvw==
X-CSE-MsgGUID: sbhNE50YQROS6XjIfCvfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291286869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:31:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:31:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 22:31:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5ditBuyVTqLr+GpiMQQb/7o3jvsrHvmM8j3EQnKGHI1H9lnBKiWdgaKT7BYYKMJfq0I5st15r5Xwuqe9N5AKSOFN7pQULDSPZ4w29fgjem2Dc1x8c0vlaGqEgT5zZL/sgk/s/QQKsUCb2JZj/NU0v1SIwXeHOgxapxFTC5oSyynMfQv5zuIYhi/5WP0jYqMstcCUOgVTnwvdX9mOfgILkHKg81yrmlo2Yf5vSbJPZv7MUy4gb50k1eL4iATFP/4dPTFK8It3QduybfKempppReFZyJ1XSeKN//EupvlIyVx8m/DGWaHNVhdyVZiJyIGPLYFKaLFu3UMtJ/+GBbQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA8dqlSCWXyF94lS3ZXXPBSQBm/BVDi+SIPP8++ejTw=;
 b=lF0TZRLOrIv93gipB6878jFW1wQNu/LEz1sw9styEXQmFDLndNlCNewJHFnJQ5J/ASYanrN3pex9kGocKAcONM1o89GNyAr0OZRSnxSs/zl46lVkT80vseNmCnSZq7b0gHUsx7pumB+QKaQLVcurLLpbtzUrqeYekmkgowYqLr0lkGCW6MEk54PEeCokQfDM4z00OkXKnqk8TEq67NCQbnnwgrRtJysM6gExSoG5+bTs0xKLz0iZbWFwX8GCYq04hW4xXIEyBav+PNLfOy19o0ODy2Jh/QXrAx4iqETnoKFWIQs+0Qwekzzy/Dta0MBNEIpWOKtB/o4KrvZvkUgJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CH8PR11MB9460.namprd11.prod.outlook.com (2603:10b6:610:2be::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 05:31:35 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 05:31:35 +0000
Message-ID: <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
Date: Thu, 27 Aug 2026 11:01:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::10) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CH8PR11MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9d96c1-dd40-4c2c-b87a-08df03fc75a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: y7lC0EJuopDT7UX+BRIgn5I1roCydvOGHm7fW5lK3ag+lUXPiKLh73NL8e8WZIZbmhcK3GFhpgIFqVheach93nVJXjKrTOGFk61Rxca5QSwadTLxKJ6uIICaXCdYEPjnhqvtfGuIlxKYx6025y9yCqQTaw8rf8DXDvU1g3eQKGLM7lzohhab4qGPUTdPhnmVCTaDj6SvqA1TT67Lx5qz3NK+B8wkl7dnZVqzM9m2W6X04i8uK1/8Iry0pd0pxLXNZsGK2zk8bz0xS+DEmexjCsayd4hnVWtWtdkW6PEsaYuW44z9sSZ6nSzrRrBQMojMl8pCraVIl9zQoGaEi48SycTrfwf87cbSH6cHDaWRnkFDc4UVVNkQB4sjSX2NWyzov7w1qVSW6IvRyboXPd1ytV2LQKtYw94KMSznKQEdpSQBGbf6IAawfWes63gJfqJCbAKmUITLvuUuuEtn58FkYjxVPnWck8QXdupl8MBNFyIV5z4FU5458LqxPQqWZu1ZG9ncYBSWgSBK/UgVCq/NryU0fzoG01EIVj/SywD/a5u9RMStFKG4A6ehuW8xNy8DGZCz4NUvuDzKjTOqM16yFVb8iv3KX+Mfwahm7Fn4TYDYKrIb8xSDz7mXAp86CnxPcZy8jyFwyjd8VLPqAih2NGvXUK9CPD4HVFPJ6eo2m+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nnhob2s3bHRrWnFKVldQTEhieGFITDVldk1iL0N0TU9kd2tVc2RMS09uMUZn?=
 =?utf-8?B?QkNqdXB6TTBjMFVJNFc3a3FSNitJQmw2OW4wUEtNTEwzSENWcVZ0T0w0UXZX?=
 =?utf-8?B?Tlh0TVFYN2hpbDQxeVNaK2M0Ri85T214UGZrQzY1U2VrQjgrcjF1ckFiNnVE?=
 =?utf-8?B?enpWcjNlMjRIcVRtYy8wZkEyc3dVeGFWN1ZnUXkxV0t5cTQ5V2JxSmtmdlNm?=
 =?utf-8?B?V2lVSGR0TzQ2bzVxV1ppbG0yemdjTkVsOWNCelZyQWhxWDJpckordG55eHJk?=
 =?utf-8?B?TEJTdk9zanlRSHI4NzBNaWFmaXlPbGhTemYxc2VDYkE0SWdka2NLVzcwdHJy?=
 =?utf-8?B?L01VRmdxZXltcmdSWGlHODZ6d2pCZEFjZllXZDZLK09Ra0xrbkl1b3BKMVJt?=
 =?utf-8?B?WGl5Qi9QSktuaTVMT0hEeHVrTU14ajNwVmpjVUZDR2xEMFNQVXVwcFRzVW9W?=
 =?utf-8?B?b3E5OXIwYUJpei9vcGMwN3k4R2QrSUVuZGlvR0pBY055SXhKUHlUdFNpYStZ?=
 =?utf-8?B?MjhRcll0c29vMndoSkRGVWExR1Fmd29aNWd4NEVZcFJFWUg3Kys3WmtSUWR5?=
 =?utf-8?B?K3VJd3BzaWVDU1ErSEY3U0dmTlVRL2R6ZjBHRkwwWUp6aEtGbVdLb0xzVE9D?=
 =?utf-8?B?d3VyMzhUaWFCajkrbGVHRGZMdTUvcUpXdGZiK0lRVnFNQ1BsUHRvSXFRMkgy?=
 =?utf-8?B?LytEb0ljK2YvVXhQQUxOVXA2NWZTTm1MZUc1enhFTDBSSWZvTHVzZWc5eEsw?=
 =?utf-8?B?WUc5dG4rNVpPMHRvNnk3TEdBQlBnSDhCWGRSMW4zUGVqc2ZPSkM0WjM5T1VT?=
 =?utf-8?B?bkprVmN6VWw3c3FReERxM1llM1g0ekg2YmIzQ3lVQnVTaXZqSWJxMEZTM2Zp?=
 =?utf-8?B?Z3VQQXpLZnR2azJsTEl2NDNxSEc4dGJ3WUl0Uyt6QlorRHJ6NVVWc00zSi9U?=
 =?utf-8?B?OEZqQkVLaEtRN2Z6dTQyZE4zNGUxUFJVbDR6ZllVbENsZVFwbXZZZmdzbHJt?=
 =?utf-8?B?YmZzWFRwdExtQVR1MjM3a3Y2M3BQK2djNzJGWHpxNkc3YzlwZjRVdURzeVhx?=
 =?utf-8?B?OFNzZS90bWd6MTNkV2owTTcrQzNwZE1kYko5ZnllbTZlSFd2L0ZDdHZsOUZu?=
 =?utf-8?B?QVdpNFVuOHE5dFpiZWFJeWZYOTFZdVljekppV085LzBTZjRrNUtLQjJtTFJR?=
 =?utf-8?B?VFMxdVl0WDhMYVQzVVVNVEZMTk00bXkvQXVWcXJQTk1UallHOXhVY2R6KzNG?=
 =?utf-8?B?MWY4S1d6WFV0VHZZRnd4STBxbER6Q2o0bHBtV0Z4eGo3bjdtTkZmRmVyKzNo?=
 =?utf-8?B?VE5OT1hEc1ZpMXNlMXlQVUJBVldjblJnNzd2Zlh1T0pCNkxkM01IMlpYVlQx?=
 =?utf-8?B?TFE3SXIyRWNvSERTOVNXRGtyN2F3MUJSNHN0Ui90b3lBSU80bm8wVFdOa2sw?=
 =?utf-8?B?LytITzJ5VXQrWndmYTI3Vk5vTk5WSTRISEZwSzZ0WWRZakRuck56bmFXWW9B?=
 =?utf-8?B?L2t1TVJFeXVRNTNGRUVKeXdpSGdVaTdHczRmd3pJeWcybVF6aHZhRy9nYkc2?=
 =?utf-8?B?TE5zZ0w1all5U3RiRHpPeElocEhWeVc5K3dJTGNxOE1jZE1Iem1ORW1hMGdS?=
 =?utf-8?B?aEFCY1VsZWNFMkUrcGVxS3Y2YWJhV0hzOTVLdFAwbVAyaVgzTFZzUjJQRUh5?=
 =?utf-8?B?dzlTWTk2UWVDUTdsK1RFMGw2Y0IrSEpBejhvSjBvL25nNmNxTVdxVlk0b29F?=
 =?utf-8?B?QWRERFgreHo5WFZJb0VodmsxaVN5eHJ0eE90RlFaaGx2RjBLNkl1UnI5eHdh?=
 =?utf-8?B?ajRUMGlEZE9lanJWOTV1NWQ5aHQzZDI1YzZkL2l2WUxJNjF1bkYwTEhlYnRx?=
 =?utf-8?B?QTl4Z3BVOHdTZFhlcWx2NkZ0UmVidjBubFdXaXo3SlVRcUVXZmFpR2VpNXZ3?=
 =?utf-8?B?TW52MWZCdTBxSkR5Ym1TVGVhbllSZ2M0bzVUSFFGL0xqTUMwT0Q3Y1BDV3Vn?=
 =?utf-8?B?RkpTalZVN21BYlFBQys5QUZxUTVEc01IanVJSTd3Rmw4V296VEpiM3ZURTZp?=
 =?utf-8?B?M3hzQ0xjS3VwVmVlRlBGaDM1UWNKa09XU0NRT1dxdkVobFhXSXM3RGxFRklG?=
 =?utf-8?B?N1JDdUxURGNHZVdXV3FQbjhSemhpaUp3L1pWKzJQNCtPUE16M0VBeEkvVHJY?=
 =?utf-8?B?dWFCUXcwbVcwbkJaemJoMDBRYVJIVTVDbkNDUUtSV2FjbVZXK29VdDJnMDNn?=
 =?utf-8?B?WGhKOXZPVTJMVitDVDVzOGlSNEptUE9QZTZGMzFHbFU0UnIyZGJIVVBpczNv?=
 =?utf-8?B?YVF5dlMzajhsQlZNNlJuOHlLVHZJZ0RxWXM5ZWd0Zy9QQjNwVFJ6Zz09?=
X-Exchange-RoutingPolicyChecked: tMx0jSSnQu1yBE8RnrDxUmEZfzR3Rc2GzV/J8yJOvQhzHmmKCYrOQwCT5mYeA7J2A+bEl05XrY14f+3gOLkaDAT4hr9mtby3kcaFee2WMELYh/f3/pmWeQTAFJ5VsUKODOZAjD+wanyHREP3qUMMfeOHwbpmyfWxOMFeU6V6IQXWHlBiYVfAgd+mX0Z32HORc8G9iObx0/HUG//Wx+R1jcO0NrlCsP7hMR1/rwaxLN3uIHtTE7WNq8DZykVnW+CKxK9CzrmECsKQZdzmWB2cGUOKMYSFd3yL6NizjOR16ff4xJY8yX8ZH31vKXjJ2UER5x8F7YPLWeJbqc6bQiP/dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9d96c1-dd40-4c2c-b87a-08df03fc75a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 05:31:35.2115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLplGWUFyAI5FtgPmnS5QYQX5iojcvGVGru6ier34hB9N9gouwSg29Jf1M9vXmLA+uiGLmq8MiSawDVYHlMv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9460
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

Hi Chaitanya

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Also, it seems we have duplicate igt_display_require(&display, 
display.drm_fd);

It is required once. Anyways, its a separate patch.

Alex,

Can you please test on AMD driver with above change?

On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
> Following the pattern in kms_color_pipeline, set
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
> local variable, then propagate it to display->has_plane_color_pipeline
> after the final igt_display_require() (which reinitializes the display
> state). This avoids calling drmSetClientCap() twice.
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_colorop.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 16db0b8ad..d573d2ceb 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   
>   	igt_display_t display;
>   	int i, j, ret;
> +	int has_plane_color_pipeline = 0;
>   
>   	igt_fixture() {
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   
>   		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>   
> -		igt_display_require(&display, display.drm_fd);
>   		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
> +			has_plane_color_pipeline = 1;
> +
> +		igt_display_require(&display, display.drm_fd);
>   
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&display, display.drm_fd);
> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
> +		display.has_plane_color_pipeline = has_plane_color_pipeline;
>   
>   		igt_require(display.is_atomic);
>   	}
