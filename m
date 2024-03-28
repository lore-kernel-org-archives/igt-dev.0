Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D83CD11DD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 19:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57F10E1F5;
	Thu, 28 Mar 2024 19:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2nDPkvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A8610E098
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 19:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711654024; x=1743190024;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LasArNzetEOHBMD734Ut441snTBT/me3FAu9XwRDCJY=;
 b=I2nDPkvkHxkPzw1DO8DIcXOZoUlTqbekwJlCt7p8ICiqGDaApc6CcdVQ
 rcmsxgOFSWZ4IKfuz8p4Jbds8gGBAoBEyxrzjMZ+XHASX7CapovTa01Fv
 R2Cmyh3zmg1pRZJm5HjUnRmUq+usIhZKCt9qpfpeJfj+gl2Z06EqT++uR
 Bg8TFl+pSnWzXwJUWsR6cukEEuONAuwrfyGjhn4YzChwKc2I/5kijRn2b
 RuaSCyPXhOluw3LF+LhCM8BmLUMNeaRs5SWlcteEz47NyjcWro63ga7HC
 2/IsKElxHN899no3FtbjgRQjRICn1qnwEedS4zeTVeItqFjM2SitnjHog A==;
X-CSE-ConnectionGUID: FT6xIvGARXuniNZg2NkpjQ==
X-CSE-MsgGUID: VqAei5nVR8a7fXYWpkhn1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24320992"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="24320992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21452348"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:27:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:27:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:27:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:27:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNStM6gqOkgwP+WI6Nw2k65751gOrREd9gYpEU26nUbFYJsoblUZ/HZtJ71t2xl681soJv9u4oKY2wlGJqHiuMnewj7S5rVzlDS0/fpt6OOQ6IOoW+CtEfpF8V6AN0ZRHs7sYC7/rMRPV9F3KxnRDZQkUA2yTPrKmFQcUdcKtDwi1ahdn8RfaZDSjgL0OE8Ukf6sm1G9Cm92cyDP5CSximnHlyGhYhMTx9Sn1rSX1ou5MHEQyzSztj5y62NdrxUyynsEBRzO3sgPjYZWZ9JvlQv2etKdu1EZTjdtytN8WLEp7fM482LX7FJs+zlqRQnTQG9rEc1tEqX51rtrTQ5W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7M9STA3ksI8Pv7ipRilRquDlKVA43BMQiVgDan7guA=;
 b=RxG1kzGWyI6kN4d+LNnwVjsaJtmAw+Glkfv1a5MNekmeatOd8hM85FjOBudUPe05eaeheADkmBNkk4ppQ+MfuTXLCLil5bryyTU14RwTftACHYU/L+r3lQPXHGsEOkM9tGgwRPz+8MRtnw5fqgVQ7oRXVXMLPldBMeKIGVergJ/M7HL7PzPLLPV5JiEcEI4o+wSZksgmcf3Fu3vI0Sf/y4LI8GWdXekjawUBjC3JLA58cdjRbkkMNES1yRpKURb7LI0buogElcLE0I9SPWPqwV88rn4u6SbpyEnm0FTCYqnq+9vD+JTI2BmU6SQ10OXzjLnvHNnrR4a3DBdfMiljWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 19:27:01 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 19:27:01 +0000
Message-ID: <4821b2b1-1c01-45f6-b273-201a6c95e74a@intel.com>
Date: Thu, 28 Mar 2024 12:26:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe: Update __xe_exec_queue_create()
To: <igt-dev@lists.freedesktop.org>
References: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MN2PR11MB4758:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cD1w3GfnTdZTRyyiBBV4lcMHatZKm2Q9YRmZSUr+nUZ+8pmbYIeOxtCu+TA1hgWmp0RjdICp4jpvxt1ONLvYz3SESHMF/7e0QvoIWdw7Np5mTj0TPJ2zY0tDbvLa49t763MdF1bqPTdoVh0dA3h7D50EI91DGRDvmMF+J8/RlEaEKnGPSAewQDBpA0+3eWE6IJmSoD8McFEzDzd1bWdh7OFPc9DbBl0VBx8pTqESuezpu+Uc8VqcdTRLE9xdZjAe1EyaHCU7G2+Xogna0mYF8gbPiaWrbjrRO6L10+dtGBhdAgHEDPKD2B5iDnAfWw2Hs40kBc+5ylBCExXQkIOBVPhVvYSJilXuYj0ke7rQ287Cu6KSD6VxRPc1lobxecHlflxfIb6WkBwVXRIGQic5Y4hvfsH8PnBF99s9NWw5FI/YZyYZumQX5T8snKwQlm8Zy/eoM4QmHx8cIT5fzrs3rs2xL0FCUPSiYOLmul6oGZhBciF6gQLWkHu6obxAd91XiQ+ogtHreSYZFRN8QQVtDfJSq9ZDg92D2jVCx/woXWTjqfv7wY31ETG/WWg3Y3ej36eKXlaSyIBfQD7uVGsV4+Fp26Pn/QOvD0MGK6l6fkN4S6GQsKdHcNgycb0vbfte+kyAbOpsBs7E+US5HH5zj0gBpS61qC/mAdnypyxh9W4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUVuRkh5TW5EWmhXQWcxbUo0R3FYblZEaDViaFU0NUlFWXFqRTEyTWtwWW5H?=
 =?utf-8?B?aHhPa1ovWE82d1Y5S2QrbGJrWjg1bGRwSnlZWENvcWljQkx3NkJsckZJM2dE?=
 =?utf-8?B?THlvNFdVWkNaVDkxbTBKc2xzNWlVV0hQNjhnL0FoakQ2UTU3dWJDaGZrc2pJ?=
 =?utf-8?B?d0tXbW5VQ2FUVk93bU1VMGdaNkgvajNoWlR4Zy9rcDdMQTU0ZWpHWlRUS0Iw?=
 =?utf-8?B?WTI5T0NIVWQ0VXA0ZFFKbjUvTzVjMnBxcG0zVEUrd0MxLzAzeUplUnF3RTlT?=
 =?utf-8?B?eXVlUGZZMWUzYW1tZCt2SmJ2VHl5NjdjWjg4YlY0em41RElSM0kyVnl1aVBa?=
 =?utf-8?B?MWVqZE9meStNNHZIWllEMnRpaHNoRFkwY2wrYXFnU3VNOXVtUzVNb0hodWtJ?=
 =?utf-8?B?TjZNVUVTbGlIU2dpZFFycXZjN1MxbjlnT0FYdlFGYkFKWklEVHJqN0R5OTA3?=
 =?utf-8?B?Witra1UvcVpTRTUvUGRGbW9TbkhjakY3cGRrbExCSEEwRzRZOFNoUGlQK3lZ?=
 =?utf-8?B?VmoraVdTR2F2Mitzb0h0RHJEMTk3aTlXQjZNdFpVTzJvNVZDdUdDV3lFaitV?=
 =?utf-8?B?aGtrUnhnSG9MNDJQckFDYnY1N3NyTm9XamNzZnUwWmtJMDl1eXd1U0I0bFhl?=
 =?utf-8?B?QWpRWWwvMVlsdVlOTHpWcGtDay9MMDRkMzFuZlY0bDZpdVUwem1kbWJ2N0RC?=
 =?utf-8?B?cVVJd1RqSVYzSDFFWDlpU1k5bHNCQ25ySTFmeEZvOElSc29wWmFyb3NZR2xx?=
 =?utf-8?B?YkJ1eU93R0t0alEzeW1tc0M1V0x6dlF3OTJZUzgwbjZ6a0VJdzZHVUJ2SnI2?=
 =?utf-8?B?c1NMUUh3TDBrUFVkb1diVFZFUUgrUGZrRDIzUHhFZmRQUkRCV3ZPRGRZak0v?=
 =?utf-8?B?WjFXb1A4R2VkWWtqT21PNjhhT3RaYWExRmNzd3kyM2lPaDF1NnRSajZldnFk?=
 =?utf-8?B?RXBhTXdwOUsrOEZaVzB4VDRqalI4TU5WOWlVa1dFaHdka1c5Z1hrc1BDb1Aw?=
 =?utf-8?B?akEvN3BWNWZid24vRnR4MWFWcVVNQ0xaZ3lVUUNKbnJCRE95cjhTcDBaSUQy?=
 =?utf-8?B?T3BVbWxaejJHYU5KSFRBY3hpNUlhY3RwNTdhWjA0TEZWbjdnc2JmOHJYZTlV?=
 =?utf-8?B?aExJbHo3WGlxRTNhc1ZCM1BNdE9wWldsRGRiUCtTQ2MyanVIMEdjQ2hyV2Fs?=
 =?utf-8?B?K0IyRURTQjdsMW1sWlJ6SDZsTEdETkhNeWNrbnNKMkVRQWR6RmQzaVNRcXQ4?=
 =?utf-8?B?VzJkcHpKV3NyaGM4MlhOZ2xSRXJtQTZVMWZFdnF5ZnhXZzErTDhmV3dJSXpa?=
 =?utf-8?B?WEgzdzZRR0Myb2lwbTZYdDd2Z1V0Y1BUOU5zN0xzR05qQy8zVXlkT3F1SzB6?=
 =?utf-8?B?MzRrd3duR05Uc3Q0SkVET0lRMC9VQ1hMMG4zZWZ4T1ZUaHhNaS9yZ0Z3SUxG?=
 =?utf-8?B?WXI4Szl2d0lxWnNtVm1kVklEckxhZ1BGWVRFU1pzSUh1amdCcFNRYTRHblhI?=
 =?utf-8?B?TGtLWWpNdkNXTnRWa1BrWWlMc2lRbll0czNLY2NSUW1nTEZwVlRzZ3VtcWpL?=
 =?utf-8?B?S1N1YXo2SVlIWmR4Z1Z1ZVBaSjhzS2tXQTRWMHJtTTdvS0g3RzBobFhuUklO?=
 =?utf-8?B?OGJObHE5ZC9xK2RGV1ZzcituWndHdlFaNTk0dGFpL3MxeFpyV2tGZzBXS01E?=
 =?utf-8?B?UU53NlF6eGRkMVRFd2dIU093SWNFbjF5RXowRmsyWUJLV2VIYk1pTFlUejZx?=
 =?utf-8?B?WGlVYk50M1cram1zNWlpWXBKSEoxdklEWG1YdE5vblk5KzVWcUlQUmhJdFI2?=
 =?utf-8?B?OFZ5RzRJbFpFZlRFa0tINVAwYks2UHdLSmtDRDBBYUhhTTV2Q0x2MEpMT1RK?=
 =?utf-8?B?YUdZOVFUNUIvNnJqRWZhOUpwTFhURUtQRnFnWWpOL2NJUzc3Q2VRU2ZLNW1z?=
 =?utf-8?B?NmJicGtWeExUVmZqSGlqVmd5MWNoK0pvRmNUdlBLMXkzajZ0NjlJYTFPMVl4?=
 =?utf-8?B?Q3hDZ3YvYjUxdGxiTjhGdnpGZTd5ZUFJQU10dTNxTlJ0NEtBODdxWWdUV2pJ?=
 =?utf-8?B?Z0FWbWVhR1pBMHVCUW9ZdFdzdzBjU0Q5QTVHQnJwNmR0WWpadllOVDMrQ2tR?=
 =?utf-8?B?KzQ3UlFYWWRoREMvRzdGREdSRS9QUFIxcERuV1RBYkd0Ri9RWjFHZ0x1aEpJ?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e729bdcf-3f6c-4926-ac8e-08dc4f5d0ae2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:27:01.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1K9ymhu13Rwfug9Awwu75xX3yYrCTQl9TLngIO7OokhIolNkdtX1KdS64HtE6ecPPL2/gNLjU8llPEBiEL9Jd9+uvpgQoJSp1TTU3g/KxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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


On 3/27/2024 8:10 PM, Niranjana Vishwanathapura wrote:
> Add ability to specify width and num_placement in __xe_exec_queue_create()
> call. Use __xe_exec_queue_create() instead of ioctl calls in the tests.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   lib/xe/xe_ioctl.c                    |  8 ++---
>   lib/xe/xe_ioctl.h                    |  2 +-
>   tests/intel/xe_compute.c             |  2 +-
>   tests/intel/xe_create.c              |  4 +--
>   tests/intel/xe_exec_balancer.c       | 45 ++++++++--------------------
>   tests/intel/xe_exec_queue_property.c | 35 +++++++---------------
>   tests/intel/xe_exec_reset.c          | 25 ++++------------
>   tests/intel/xe_exec_threads.c        | 14 +++------
>   tests/intel/xe_spin_batch.c          | 12 ++------
>   9 files changed, 43 insertions(+), 104 deletions(-)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index da2a7af51..934c877eb 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -332,15 +332,15 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
>   	return create.exec_queue_id;
>   }
>   
> -int __xe_exec_queue_create(int fd, uint32_t vm,
> +int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width, uint16_t num_placements,
>   			   struct drm_xe_engine_class_instance *instance,
>   			   uint64_t ext, uint32_t *exec_queue_id)
>   {
>   	struct drm_xe_exec_queue_create create = {
>   		.extensions = ext,
>   		.vm_id = vm,
> -		.width = 1,
> -		.num_placements = 1,
> +		.width = width,
> +		.num_placements = num_placements,
>   		.instances = to_user_pointer(instance),
>   	};
>   	int err;
> @@ -363,7 +363,7 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>   {
>   	uint32_t exec_queue_id;
>   
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, instance, ext, &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext, &exec_queue_id), 0);
>   
>   	return exec_queue_id;
>   }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 2b30f1d98..4d08402e0 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -70,7 +70,7 @@ uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t pla
>   uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>   			      uint32_t flags, uint16_t cpu_caching);
>   uint16_t __xe_default_cpu_caching(int fd, uint32_t placement, uint32_t flags);
> -int __xe_exec_queue_create(int fd, uint32_t vm,
> +int __xe_exec_queue_create(int fd, uint32_t vm, uint16_t width, uint16_t num_placements,
>   			   struct drm_xe_engine_class_instance *instance,
>   			   uint64_t ext, uint32_t *exec_queue_id);
>   uint32_t xe_exec_queue_create(int fd, uint32_t vm,
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index e773e798a..75378595e 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -86,7 +86,7 @@ test_ccs_mode(int num_gt)
>   			hwe->gt_id = gt;
>   			hwe->engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>   			hwe->engine_instance = m;
> -			igt_assert_neq(__xe_exec_queue_create(fd, vm, hwe, 0, &q), 0);
> +			igt_assert_neq(__xe_exec_queue_create(fd, vm, 1, 1, hwe, 0, &q), 0);
>   
>   			xe_vm_destroy(fd, vm);
>   			drm_close_driver(fd);
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index fd5d71d8a..6ea5ad38b 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -206,7 +206,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
>   		for (i = 0; i < exec_queues_per_process; i++) {
>   			idx = rand() % num_engines;
>   			engine = xe_engine(fd, idx);
> -			err = __xe_exec_queue_create(fd, vm, &engine->instance,
> +			err = __xe_exec_queue_create(fd, vm, 1, 1, &engine->instance,
>   						     0, &exec_queue);
>   			igt_debug("[%2d] Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
>   				  n, err, exec_queue, i);
> @@ -349,7 +349,7 @@ static void create_contexts(int fd)
>   	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
>   
>   	for (i = 0; i < n; i++) {
> -		int err = __xe_exec_queue_create(fd, vm, &xe_engine(fd, 0)->instance, 0,
> +		int err = __xe_exec_queue_create(fd, vm, 1, 1, &xe_engine(fd, 0)->instance, 0,
>   						 &exec_queues[i]);
>   		igt_assert_f(!err, "Failed to create exec queue (%d), iteration: %d\n", err,
>   			     i + 1);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 6e467e34a..8ce8cbf7f 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -75,16 +75,8 @@ static void test_all_active(int fd, int gt, int class)
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = 1,
> -			.num_placements = num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
>   		syncobjs[i] = syncobj_create(fd, 0);
>   	};
>   
> @@ -231,16 +223,10 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	}
>   
>   	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = flags & PARALLEL ? num_placements : 1,
> -			.num_placements = flags & PARALLEL ? 1 : num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ? num_placements : 1,
> +						     flags & PARALLEL ? 1 : num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
>   		syncobjs[i] = syncobj_create(fd, 0);
>   	};
>   	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
> @@ -458,19 +444,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	}
>   	memset(data, 0, bo_size);
>   
> -	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = flags & PARALLEL ? num_placements : 1,
> -			.num_placements = flags & PARALLEL ? 1 : num_placements,
> -			.instances = to_user_pointer(eci),
> -			.extensions = 0,
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> -	}
> +	for (i = 0; i < n_exec_queues; i++)
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ? num_placements : 1,
> +						     flags & PARALLEL ? 1 : num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
> +
>   	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
>   
>   	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 51ecd725d..57baae305 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -56,21 +56,11 @@ static void test_set_property(int xe, int property_name,
>   		.property = property_name,
>   		.value = property_value,
>   	};
> +	uint32_t exec_queue_id;
>   
> -	struct drm_xe_exec_queue_create create = {
> -		.extensions = to_user_pointer(&ext),
> -		.width = 1,
> -		.num_placements = 1,
> -		.instances = to_user_pointer(&instance),
> -		.vm_id = xe_vm_create(xe, 0, 0),
> -	};
> -	int ret = 0;
> -
> -	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> -		ret = -errno;
> -		errno = 0;
> -	}
> -	igt_assert_eq(ret, err_val);
> +	igt_assert_eq(__xe_exec_queue_create(xe, xe_vm_create(xe, 0, 0), 1, 1,
> +					     &instance, to_user_pointer(&ext),
> +					     &exec_queue_id), err_val);
>   }
>   
>   static void test_property_min_max(int xe, int engine, const char **property)
> @@ -183,27 +173,24 @@ static void invalid_property(int xe)
>   		.property = valid_property,
>   		.value = 1,
>   	};
> +	uint32_t exec_queue_id, vm = xe_vm_create(xe, 0, 0);
>   
> -	struct drm_xe_exec_queue_create create = {
> -		.extensions = to_user_pointer(&ext),
> -		.width = 1,
> -		.num_placements = 1,
> -		.instances = to_user_pointer(&instance),
> -		.vm_id = xe_vm_create(xe, 0, 0),
> -	};
>   	/* Correct value should pass */
> -	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext), &exec_queue_id), 0);
>   
>   	/* This will fail as soon as a new property is introduced. It is
>   	 * expected and the test will have to be updated. */
>   	for (int i = 2; i < 16; i++ ) {
>   		ext.property = i;
> -		do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
>   	}
>   
>   	/* Correct value should still pass */
>   	ext.property = valid_property;
> -	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext), &exec_queue_id), 0);
>   }
>   
>   igt_main
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index cc10900d9..8d731e689 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -177,16 +177,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = flags & PARALLEL ? num_placements : 1,
> -			.num_placements = flags & PARALLEL ? 1 : num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ? num_placements : 1,
> +						     flags & PARALLEL ? 1 : num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
>   		syncobjs[i] = syncobj_create(fd, 0);
>   	};
>   	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
> @@ -621,25 +615,18 @@ static void submit_jobs(struct gt_thread_data *t)
>   			.engine_instance = 0,
>   			.gt_id = 0,
>   		};
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = 1,
> -			.num_placements = 1,
> -			.instances = to_user_pointer(&instance),
> -		};
>   		struct drm_xe_exec exec;
>   		int ret;
>   
>   		/* GuC IDs can get exhausted */
> -		ret = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create);
> +		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
>   		if (ret)
>   			continue;
>   
> -		exec.exec_queue_id = create.exec_queue_id;
>   		exec.address = addr;
>   		exec.num_batch_buffer = 1;
>   		xe_exec(fd, &exec);
> -		xe_exec_queue_destroy(fd, create.exec_queue_id);
> +		xe_exec_queue_destroy(fd, exec.exec_queue_id);
>   	}
>   
>   	munmap(data, bo_size);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 05ea1d35a..d6d39814e 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -114,16 +114,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   
>   	memset(sync_all, 0, sizeof(sync_all));
>   	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = flags & PARALLEL ? num_placements : 1,
> -			.num_placements = flags & PARALLEL ? 1 : num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm,
> +						     flags & PARALLEL ? num_placements : 1,
> +						     flags & PARALLEL ? 1 : num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
>   		syncobjs[i] = syncobj_create(fd, 0);
>   		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>   		sync_all[i].handle = syncobjs[i];
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index da8fd0a30..68cbd1bd1 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -114,16 +114,8 @@ static void spin_all(int fd, int gt, int class)
>   	vm = xe_vm_create(fd, 0, 0);
>   
>   	for (i = 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = 1,
> -			.num_placements = num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placements,
> +						     eci, 0, &exec_queues[i]), 0);
>   		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queues[i], .vm = vm);
>   	}
>   
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
