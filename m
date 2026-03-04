Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1204EEB7ECE
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9618710E9AE;
	Wed,  4 Mar 2026 11:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfwXgJ3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EAE10E9AE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772622232; x=1804158232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XzHBqCLDCwyGOqQxnsz/HIg+ZUON9p/9+0jIndzGfp0=;
 b=RfwXgJ3kfiCAoXrznVH/YnqcBZ0TtomkEf0fd7YKzs3bvcKnyrVJh6i8
 xVP5dJh0kq2laMdMtTaWs0lHUQqnTQNtn4CJgeq7orHBj97wZdg2hf93x
 L98T6sPuoCIDXaD1ModiIZpGU7Bf7HTCRGZqQlRXL4bzPOXkJaz7au+pA
 IkPNwdzDfXG3hR8OnKHUyLfdPRig+myB21M2LRsjcQPYSOw27D/6Z94gI
 EVsyZSHyjF73B3FBcUxFTorIZCv/cL3rhFlAijKoyMQGPHfzZRLhNa3HG
 pfdB290Y/LqcKiGGgTuTSx1PEhTqfus84shbFek7hk+fWve/PQpY37/PM Q==;
X-CSE-ConnectionGUID: PTzmPtowQAWpM0QFk2trZw==
X-CSE-MsgGUID: Egr5f59CQKGdae/GDuZC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73553664"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73553664"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:03:51 -0800
X-CSE-ConnectionGUID: tjlYvwPyRt661AayF5rCMA==
X-CSE-MsgGUID: w21jRna3TyW8+szueyvyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222482337"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:03:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:03:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 03:03:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnHi1N6885WgSl5tt4C+8p14beyHSwILXcPxtpRk+DgZuRgfhya7ZZMbi5bkukhV7TagUXvahcDNThUDECX8bNMQ3yaBZHr/ZRqYyd4iwnCHi8rFg2zNUlTwLbPNcZbOHQ4IAWH231knZlcjqHBEl+Sk6OePgrEYoSNeWiBA590pMDcYlW/IxzAXJQTGnLD441KpB5Q6VE9jRpMIHahA4HKbscUzQPs8C3QAVQVV1b2bzfeBxoqX+i6y6dXsiAZWUT2Pm+EjUO5D4Wl4e7Hx4ddCf3UwtosMogi1zW6NIl4lS8VDBb4rdoKsyV79CpyHXWZhkM0cIxSuKp72Q4X0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAImhBjpZtnu5w4+lmuyOayfoavWvAsCQepPYKa3AnI=;
 b=MWhJHiqRa1AOhSrfG1NVWbRA1MAuPR/MS3CwQDErOJoj7JyO0SALrHhFs7GEXWc0sRSL02T479R+eVhsuGmqTI7uf7/SrFuAe4np2MbXAIF2Xpl2L9vVA3yQzoBvIEhluNHLyUItwPT9g0rQjq8EjCNxC6aQtMM1+ct3Gmtei/bD1hocU2RF4fzpR+nvV2CmIV7JiQO/EurQyXne4Q2450inPjJBIeEf9NOj6Hafr21j/CzET+MisjSIL1jLjI1VLdBihJHz7JCmBgTiCYPK9CKpe1fpa3jXdWP/1L2KPt4P9LVvCZ/RjLM3DrY7Rb8NLOZ3fe+Pufbxa+vKjd4SEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:03:44 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:03:43 +0000
Message-ID: <1d6ef0db-7074-42d5-93c4-c01001bbdc1d@intel.com>
Date: Wed, 4 Mar 2026 12:03:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_eudebug_online: Set timeout for
 debugger VM fd sync
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20260227114133.2850125-1-jan.maslak@intel.com>
 <20260227114133.2850125-2-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260227114133.2850125-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0209.eurprd08.prod.outlook.com
 (2603:10a6:802:15::18) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ced9b3d-c0c8-48b5-0dd3-08de79ddb31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 7a5Nv620kSqsh6ZKohpJBceNAPJnEnSaozoX/CK8WJ/P5htXTeESUBgmzCT1/boqnDRGpLjAl4hpM4KRLQvcC9O46r5s5EnNL0j5IWUJvN5MsL5nml42lNu82yChGVvSR7r3OYMI+BGy0NcLWTbtWDyeGXm5M+RxuJmir09GdYC6m6hfghF3N0fCgpOPBYiO/s7xcp/f/JVVa0JKLPF4040pRL4ys23J9yfJn0qBl50r3s14MYMIR/TsNywl2sHgkxERfRUc16tz8t+1fKGTNPJz5YHpi7woxWQlsPzXGH3VwCB7XIYMEJG0Dea2f0Zwu+1XpLhEV5b5t/796IDNNgFSxwZCuLjDAb6tjn1FsawvMWGji3EPTgX+KGa63nIGOYJJ6w0xDxpA1uUj/IEQmkY5wsgWaITcTh54Ws1I03UR753tZfIanF/qqyGc9YOk+ScpRHb6qaktk9F7lT8aXyfHXwfWoWdj2D/ZiRwQlfOe0xo30FdP7nERvl5+APYwA7HziQPnx7xdq8LjLRlt9rrKduK/xC4cm1BufvERc81SbATe6YDfpYnB1W3zqcNINFOmegiP+ssElS6PQId2Z0dzsB4HL3/6ig1+bxoQC3WSCXUfR4izCqFmBY1bepr5gKyTa8LQe8LNtieZ65baCyNW/ueUY6SJ2PrjWP+XnVoP+GAMcrICkZxTNhsxVGjfydITVgD8J2vqbYUw+qIy2iL2tpUZOv4s83ztQvu1PPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjQ0ek4xck5Nbmdyc3kwOVRhY1pnK2xScWFrTTV1U3AyZUxpRkFJRGoyb3ly?=
 =?utf-8?B?STRSeGk5NHd1OG1hSTlLTUVlTnNUT3FPdUs2R3JoSk52bWRPMmpCNG5JQkpU?=
 =?utf-8?B?K0JjU0FzVkJxTXVkaElkbXZFKzhuRmtxdkljRG9JQXJoOWNhcTEzejZ0V2xF?=
 =?utf-8?B?dzZyQktaSVc2UkxiQVBZZnhvOWtUb0c0azI0UDJRWnhCU1dyY3Qxdk5PUlZN?=
 =?utf-8?B?SkF6TUx4dXFJY1Z6ZTcxT0UyY3FqWGlPY3RFdVBhK0ZMcXVsMml2TStXNEow?=
 =?utf-8?B?N1plOG9RdDIzaE14MVl2dW9MV2lhbjdJZUdtOVloVGM2WmU0YzhGcUFtalpB?=
 =?utf-8?B?SC9LeFZXNFczcjIyOXFUTDFNbnhCV0ZWMVE2enprK2NUdldmMElaeTZHa1VQ?=
 =?utf-8?B?RllYdjFQVFVhbDl3Qno0c2p6WkdxbE9aT0dlSm1xYUU4WGg3Uk04QVVoSld3?=
 =?utf-8?B?WWxqazFjY2VteWs3QXZhL1NKNXlWV3BYYS9NSUllNjZuZGlEbXJoQVVEaWNR?=
 =?utf-8?B?ZmZOZFNJRkFXSmQ1NWVoWVNWMEJNeTl2ZVV5dkZDTUVKbFVqSWRvei8yK3Bm?=
 =?utf-8?B?ZkFwSXNpVWwxZDFnMGM3NHFIOVhGNWpNaFFkbksxcEpPbnkyYmpVRXI5aVph?=
 =?utf-8?B?SnErME1ZUFBVUE0vRnNNNzJCb0hJQi9PS0llby9lNi9KRldRY0RmQkpSNlVq?=
 =?utf-8?B?V09wNU5Fa1VIeEVjVEd2RzNnd1p1bnhOWXBqRlhXV21qM1hnTWZZSEFhVkQy?=
 =?utf-8?B?VU1yc1NYTG9oWWtnRGJkelFoWFFFY2F1S01nd0p2SkhNdU5rM2VkSGtzVkRu?=
 =?utf-8?B?K3VkNDNIVHBiQmxnVXJnbkJGT1lLU1ZCQ3c3M0Y0VFdQdG16dC83Vy9jTHN2?=
 =?utf-8?B?OGRvZmkraHQ1Uzk3aTlSdW9kMEZrUEZXckdrOHlBMXF0dENaZUtMTW9UYlFq?=
 =?utf-8?B?ZUVzclg5clhINUYyTlI1TXBGS1dSRnZQM0w3eXQwa3NUSDRqWGhza2JuOHpm?=
 =?utf-8?B?ZzcvQkk2b0w0RzMzclFTS0JxRHNoRGoxSUJ0U1Z4Q1hVU1FFNGFISDBQSkc0?=
 =?utf-8?B?WHFpR0U1azFWdzI1aDNaNTljR2ZEMzZrKzFlbzZjMmUyTTN3WVdBU1lGOE5p?=
 =?utf-8?B?aXQ4dy9INW1WdWVJR1B4ZnhWOFlIcVZneDd6VUF3dFF4UUdKYlhuOCtqWStq?=
 =?utf-8?B?UUNDT0lrRDR2SVFRbHdWQ1FteUJvaFM0c0ExR0k3Y0N6cThwdzgvZTBtbjdO?=
 =?utf-8?B?NzVONXZrRFRqU0E1aG45dDhScTF6SnpWbXFmZXhaWFNXK1ZlSzlRdkU2WUgy?=
 =?utf-8?B?ZmYxbzk4VGY2WDd2NnpSSEdKdG5wUDcvRzdjcE13dEpFeVBnMzlGRDhTN3Qw?=
 =?utf-8?B?RlRaTjU1cTFERHZGTG0wbmNydXJVK3ZPYTdXRWFDZWY5cUw2M3pYMGtCenBj?=
 =?utf-8?B?YzFIYlY3UkM1VVdpUy8wMm1lM20zdlNYSU1yQkdkOHB4V0RCK3JTRUZIOTdv?=
 =?utf-8?B?TmVNamQwcmVOOGtKQ09pT3F1K2FrRGExZGNqcFZ4VnhCSjVoWFVpeC9kUmhZ?=
 =?utf-8?B?OEYwZGMyNGN2TjB1SXdnMXBidnp5OVloNXFhZXZvYkp3TFVxeFhSeUJrVk0y?=
 =?utf-8?B?Y2xJS2g0Z05yOVNIYlBPL2dCTENpMTlic0ZnL1BPU3VWU2drdkFyTmFkdXRT?=
 =?utf-8?B?azhJZzRrc01XYUFMM0tqa0xzNEhjL2F6MFh0ZDcyc0xVa2dTMmE3dkhzRTF2?=
 =?utf-8?B?ZlZTMTJ6QzI5eUhqMFo4VkgyNi9PY3orUFlsdmFJOU1JOThNWTltYTVCdndt?=
 =?utf-8?B?V1JZcnpVVUEvYmdvT2tRV3dSVDZSSG1uZDNQbWEyeGdjejY1S2lYd2FscDRP?=
 =?utf-8?B?alA0L0NNdTdIbEEwdHFiZ1VUcEdBeFpUN084WTh1bTZPVHhuRVZTT3J0SHRt?=
 =?utf-8?B?dHpMUDU3UTVYblU5eXJQVmQwcVVHTjNrUHBjU3ErQnVZWjNNdERsZE1oR2JV?=
 =?utf-8?B?OHowRmZZTXhoYzZmR3krMEk3WER2ZEcwbHJtdE1GQWhzZ010MHZseG50RGJU?=
 =?utf-8?B?Wm5raE5WdGlmQmRjdFZUYVI1R2hrZ1M0VGRhZTBkOWR5NVZEb0o0TVExTjVp?=
 =?utf-8?B?Y3RMekV4VWt0WTJuYmkwNkxDOWg2TndoSEh0SkhPMHkvb3dEK3lsQm1sNk5H?=
 =?utf-8?B?RjV3Z2V2ZlpCbXhaYXZBalR6RnVLWUtSeko4bkRQbzN1elNlTlFQV0E3YXQx?=
 =?utf-8?B?L3JNSEJnMXVYbzMwYmM4MU1LUjVkSlo0dlA1SnhLenFMM3Zjako0Rk9HOTFv?=
 =?utf-8?B?Vm1EdzZsQ0Juczh1NFdudGdJOC92VmVlbmhoeGdmM2llSm5VYWlXNmlVaWVm?=
 =?utf-8?Q?Gi6BKfyR5+8sIIlE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ced9b3d-c0c8-48b5-0dd3-08de79ddb31a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:03:43.7413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6LAdncwQHIJ302EjvR7Emo/17lZAzmE5uWTu64xJa+0r8KiSpZaPLbgpwO61BHDHUUpC6xyBVtUwJVn823k07B/dFd7MvybBY5cHeKpgHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

On 27/02/2026 12:41, Jan Maslak wrote:

> The vm_open_trigger() function opens a debugger VM fd via
> DRM_XE_EUDEBUG_IOCTL_VM_OPEN leaving timeout_ns at zero. With a zero
> timeout, fsync() on the fd may return -ETIMEDOUT immediately instead of
> waiting for GPU cache invalidation to complete.
>
> Set timeout_ns to DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS to allow
> up to 10 seconds for cache invalidation to complete.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 059f918a6..6009da4d6 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -904,6 +904,7 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
>   	struct drm_xe_eudebug_vm_open vo = {
>   		.client_handle = vm->client_handle,
>   		.vm_handle = vm->vm_handle,
> +		.timeout_ns = DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS,
>   	};
>   	int fd;
>   

Oh, good catch!

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

