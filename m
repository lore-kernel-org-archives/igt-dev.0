Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F5CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 06:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581B710E49A;
	Mon, 11 May 2026 06:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqieoY2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAB110E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778479440; x=1810015440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vqlngCLGnMIFPfBCcS0m3uKHvd5TJA7bcHpVsyi6EUA=;
 b=cqieoY2OGs7V2FIDEGqDygQSkR2xuoaIbZ0tnf7O+BpNxRFeaB2VHhVy
 1QOdxiaDyR17bT+fk+4BHfkEQxTKtzlHbl1np3ASJok1+aY49Mq37heDJ
 EqLz0NVqndk8TgiRIqwbIpe3uJiP4m0/7qkkdAXQE9CcpHZXkS4GObrnL
 yMhQbKiyVwSCHgezkbWS+JPlEtcfZehhCqiFxVihcS+2h8kkiJaQvcNz0
 RgFUFWbvbY8GvlXKX3vchZ04JYpid947MKwUrsHZ1M3UZOHyZin2pqYoj
 PhAk80gART04rox8I4HaTAHcvjFJ5jPNfQksI6VdkLrK+rDN/Y9HoJv4k Q==;
X-CSE-ConnectionGUID: qn1nBjcMSmus6Xtc02k5qA==
X-CSE-MsgGUID: Iqxrw/ScQ/2ligI/FbNsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79541716"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79541716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:03:18 -0700
X-CSE-ConnectionGUID: 8NeXNZ93Qlu5fG4Rx2mNOQ==
X-CSE-MsgGUID: s7QHS8WXTwu7gnD7GDqGaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="260822689"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:03:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:03:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 23:03:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+Zv6FLg/53NRuzlvgE6Q38WAT6Rjw+5ZjV6AT6B6BW9EqprNFjsKxtnOz+EIoMHP0qIwPCtDHT8tYsctKl3B6/zd87H4fGIFyWyvE/gOLp6P6MxfCshAxKRqSB5k6n9li1QbOpCjbsjs50siW4zq5qJ9Fh42XWBqqmi/a8p25Y0N2H+ph57x7LksXDEL+DoQKmpaL7woFmSsJk3dJZSebSdAwLVJ16kw0mjQmF/mAqdWifFIbb54Cn18IbiKjaLQgO29xQKutrbapZf1YrcgfqyKSrBptVZWm3LAbYb6UNC4K0phExMnB58ino+/Ke5zzzI8BR7oNsddJabDU59xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRGytCNQOrrZEHsJ4vHH+TUnF1gTeeuNwctokQb2RVo=;
 b=GoyCuzdFwXyg0JnB+U7W3IFohhe2HDgCHWxhLjPPaWhz5TSP2htYPk4tVCtsWQvYl5KX8kHraXT9LZLEReHwTtzaROj59Cti1I5/3wxNZoZYqfiBcuhbsACShRVFgmzWLwg4VYUxCDfvcLrU8xeRZMYDOcCysHXSKtKHlXqU1J76EhtrBnyM3mArHvJhJeQCz8mI4kzFSK98Gfm23CzA9NHZ9cxMMQv4OZ4YujdyQ2/j7RqNFkamdDWnSZn2wWdu5bZ8VR5H5gcx4UzZNRopeX5Np+rl7Ju/6zLjqXfc3uDVrgHWqlvM1iy+opgJ3CVkPcRSlEkEqtBQLZZf+HqXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:03:09 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:03:09 +0000
Message-ID: <d3d87ae0-f43a-4e6a-ab1e-a78e9aaa4314@intel.com>
Date: Mon, 11 May 2026 11:33:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_joiner: Fix mixed_output subtest
 skips
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260508035940.645143-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260508035940.645143-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f768802-5451-46f7-cfbf-08deaf22f9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5hQ9MsWzuhkhuTJOtsoSkMM0RHdUPDR1XPO6pvXxea3SNJWSshAZGzYe6AjiXmMaduqE5PAUG5MtKMV7pI+xGtsMOi3GfZnQR1svYqMheVV8FxQ5hhQUthtalaazeBWUrYz3FSLsg5Lw1WvBnrPI6hKe6rG1DdYVAZFuMCDI0W03m/Pq5o9vR8ESso+f5I01TBt4e0rFVkfVX7s2+pbNesFXiLvlLVqrWtBybWwTGiw25rzbT23Byqe6GYvGFucyJ4teUW/ZwDSX9hYkd54P2jzoVMWX+vSlLvAoX+no0QrMAz5+wa+Lxr5veRPPM9OSZQ+jhtgITOTMgALlKXmB4PjttT7uiE9L8Dv7p4zvH/hEKn1ifNrQA/sR/G3iGcuO8B5NBRPeBJggSWTvY1r8yXRWBMXPKgU0zN+fVYMcQJx07OWHR8Uu0Yh1rxV1G9/OTNhCNpflU8qZrUIcqCW+Jd4CU1T3isFJu94GYAXKwNDz4XPlTNmbplAXH31khlk6FUANOzaGHgDuO64UJfaBN5FfOeRD4qaq+dsHf/s1gubrK1AOOM0iZDQrSeSU+QLbVLXZZVMIIZsUkSS0ZVp4VYDBejbipLO/d8Ch+xOKejCzh/wes1EIaYgEFeIzqN6G9FVjZ9VBcZqSzHgCyTgz4QleUGxXNioUEjQ0LqvAQy/+oRlww5k3PCaYGICNXQWx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(56012099003)(3023799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3kxN2FCN0RhRjhYQTZiSWdneDdEM3BmSWw3TWRsUnJqakpYd0ZsRksrZWJy?=
 =?utf-8?B?L2EwUWJhN0lVbktaRjZyMnJweC96SnBZVE9nYm5XY3RBdlJUb0owaTUxRkZJ?=
 =?utf-8?B?THQ2cHlJYnQzS2lPek5vOHk0Q3FsQ1RnQlFCcWlDa2pKY3R4UHJnOHVsMHE4?=
 =?utf-8?B?akNLOUNuZ3pmVFNNeVlURHg3R0FYc0hKblgzbHRIbXFNQVFIanFoZkIzUi8w?=
 =?utf-8?B?NERKcmRYZjN1bUhIMU9jTnk2UUtaY0xvK1FUZmFadFJNZmFkZU9mS0padXo0?=
 =?utf-8?B?NDVnSzRIQ0hxNU0zajhybkRaZGhnN0VPWThLYTB3cDFCK01ZeFg5SG5JSTUz?=
 =?utf-8?B?YWcxSFhMNURpSW1xZ2hyZ2tHNS9lNnB3VW45TVIrSC9oZ2VWQ3FidW1mTEF4?=
 =?utf-8?B?WU9Cb3JzditWSGY1UElPcnpxdWhwdDRiYzRNMXdEdkZIL0daTDZYbWNZbVkr?=
 =?utf-8?B?U05tcnVnT0p2Rlo2ek8wMnc3VmJoUVkyWThpTzRyS21iT0JueWs2ZUNyRlpL?=
 =?utf-8?B?NFpxZCtjR0ZHSHhhbUk2RlcwUitoK2daQkszY3poTnI3MGNtRHFTaHdWZDJi?=
 =?utf-8?B?ckVES09JZHdIUURzemVmdjljRC9XcU9VYVdCVS9pTEd5R1cremxGVFMzSGlZ?=
 =?utf-8?B?YXFvNzNZZjJMdVBoaGphaERVZEFZYWlHTXNFc1Q3OUZFblZvUTZXQkg0UWM0?=
 =?utf-8?B?KzJDMlhtR01ZVUdLSy9acU5zdk1meFBLSUZ5UHREYUFoRHo5YWpRTDl4dDF2?=
 =?utf-8?B?U1pzcXNZZERIQ3EwZDFZTGZaTUtUQnIzYUtuQXJQa3V5UW80TTc5ZEhlRERI?=
 =?utf-8?B?OStFUlVNSDBXdkltd3NvbGhST1JBdHlNYXVXdk5pa0NwVTlLRzNyUnRCSXBZ?=
 =?utf-8?B?Unp1Z1hrdGJDNldURG03Q245K1FsTlR4QzFCR1RUYXZGdW1zblUvL3VQdFBS?=
 =?utf-8?B?TUJJVDl6RVdIMG1OZ2tJVEtpcVZQMnlvTkJ4TThiblFZTXJBM1BwRXJXdGxP?=
 =?utf-8?B?U3ZRc2E4MEV2djRxdUJGZU9tdWNoT3JWS1haVlVGdGtLcDZFTkpkMS9aRmNZ?=
 =?utf-8?B?YUNoNHZiNjRVK0lZU3M5eWRLcjJkUzN2QVVrOGpSTjRoZG8rbk1Ubk45REZ0?=
 =?utf-8?B?enJkVkJuVFB0dzNnL0F1YjlvSTR4KzZwcFU2eExoUFlkeUhQN0ZFLy9BWU1G?=
 =?utf-8?B?YittOGg1akJHV0NzR0xMTENjd3VkSTB4dEV4R2c1MDVVU2lyR3c5UUlFOXU3?=
 =?utf-8?B?Um1OM3RnL2NDTkRBSnJoZk9xWG9yVlp4TjhUc2M0WTQ4bUE1N0pwQUw1ekps?=
 =?utf-8?B?V25HSFdKWTA1d1NyRmloVHYrYkhDaytHMWZ0czFZam9KRkp5dENBUGZWUHFT?=
 =?utf-8?B?SFpjYW12NzcyWGdYYTVMQU5ialQ2bmFsTlZEbnpacXVBZVBGT3VMTGhLVkFp?=
 =?utf-8?B?cGJKb0dkQU9LTW5UUzJFNGJnVm16UlhYd0MrMXcyRm9KeWgzV0dIaVFBaEhX?=
 =?utf-8?B?a2o2djNzWm56L29aWWtkSkljbVR1OXdDY3BKOE4rVHVxMFowc3FsQzJXb253?=
 =?utf-8?B?WldsNnk4c3Z4MGQ5NjhoNzhmQmJHQTd4bTJpSytONmFpNFhhcnFMK2kyQ0I2?=
 =?utf-8?B?eGV0UkJ4WXl3cE5ZMTdYSmFPcVZySFA5aEExZkd6VDQzcS9ZbTZORHVjR04x?=
 =?utf-8?B?MW5CNU1nTzVHSEp1VE0zZm84SFNXTU5nSFloRWdKRXNnTWhQQkJDbnFYSU9T?=
 =?utf-8?B?VkFIVEE1SWs1RUlmODlmTkJyYTZhZVFrdjFPbFNodm02ak1mR1JJd0tMTGlF?=
 =?utf-8?B?WTE0OXRWSFVxNDRIVU02T1NSYjRwWGZzS2hZdkgyS2dCcHh5WkQrdEVRMzc2?=
 =?utf-8?B?QWRTdzZlSmVqV1hoZll4VFlMVDBLMDl5OHhZclE4ekRURWNZWGRyWHAycU44?=
 =?utf-8?B?bXZabC9vM2JwNGoxSFBsbTUxK1pXMjNTZWJYazlHVm5FTi9xME9DeDJick0y?=
 =?utf-8?B?YzBrakhuVHpYb0tLZVpCMFZ6TjVSUERiaWZzR2VEdkwxMkVPV0w3WnkxazUr?=
 =?utf-8?B?bXhuZ2RpMHBqTGJ0S0o3cmluTlcxc1VuMVZyNXV3OWtrdkxBSm5QSVFsQWxD?=
 =?utf-8?B?bTBkbUFiM0M3djRMem11VFZ1bk9ObjVOUHBmTUVaTVAvVkRyejlSQytKbDFM?=
 =?utf-8?B?ajg4a3l1Z2ZqVDhkUWRMTDNEa2ZHSHVGSzQ3cmNtKzFiMGhwck5ycXBNVFho?=
 =?utf-8?B?N04reEdYYnMxUTdkT0swa1JkNjc2RFpTdUw3cmFOdWRZS2E5QnhxOUFjZWVj?=
 =?utf-8?B?SzNTdHVDOEN3TjFTY3VPUzBsZUJ2SGdjZk80dXp6bDU5ek43Q0tWZz09?=
X-Exchange-RoutingPolicyChecked: L4V6SUu8MD13WVHXOS86Hb3id6kqwRoOoY16h9n8A2OGXJ3UUZ9GLBvSQZ58bkWZkLlZ4ME6CgG6zYFv64qrF4LSOypyNYtlSMZpogdJ5xEg3EQ/UjIRPSrxIzNguGZs6QjvdnZGXHVBHJx8/i1DlWYxeYN7UnRvmIs1FA/TZjKL3SOoA4DVenv6F71aQvhncYmDiy0eKOAajw39nnS9xcrLpMlwTGWl5rCy/GBX6Rcg2IZFScso2EWJZwih4bjK8mPBX1FIVxvSJBuscq0JE06ETAdZInYkqvamKnHepKZcOrTXDyS25QgLclJ72Ugfzjvzp0HKfsbTVt2HCwpD8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f768802-5451-46f7-cfbf-08deaf22f9a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:03:08.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c23Q6JlMIiqvW9+kLKWjGaSnJ6RfnNM52VoiGOZZx9EhPMI6kUGOgvzrN402voTe77odXuvMsK+2DGoLcAa6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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

Hi Santhosh,

On 5/8/2026 9:29 AM, Santhosh Reddy Guddati wrote:
> In the mixed output case, mixed_output[1] is a non-big-joiner output,
> but bigjoiner_mode_found() was unconditionally called for both outputs,
> causing the subtest to skip. Only require a big joiner mode for the
> first output (j=0); the second uses its default mode.
>
> cc: Karthik B.S <karthik.b.s@intel.com>
> cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 86226a3ba..20f39ceef 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -386,7 +386,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   
>   			output = outputs[j];
>   
> -			if (!force_joiner) {
> +			if (!force_joiner && (!mixed || j == 0)) {

The patch is correct logically and required, but IMHO it would be good 
if we can rename the existing variables to make it more clear from the 
variable name itself.

Thanks and Regards,
Karthik.B.S
>   				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
>   							  "No big joiner mode found on output %s\n", output->name);
>   				igt_output_override_mode(output, &mode);
