Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DA8C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 04:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141410E8AB;
	Wed, 28 Feb 2024 04:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auQKL0KN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BAD10E8AB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 04:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709092868; x=1740628868;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GAvHaoXbIKwmVHWc56nx+c4eY1q2ie6829edlYdFMxA=;
 b=auQKL0KNo8ftM2znXSnS0M4JHJaJhiggGdLNGipFDBylmJo+Bn622iUg
 daSsTSYOLjZ8FwMu6I2R/WZz7K2oWG36P2kRKXujzbgsbwAU6D/8Bv8XE
 9cPQyqplktDoqxIfK6AHbxDa+uuP4bt+YbwVeTW7YEblVULqj/GvHhddd
 YcpmGgwTjJeL+eddh5tyJc/VjUH2uW1b5ufQQLZyuekKnEwefjLepNmZR
 sgA6hbFxqX6+tPhRCy7nmBUG6xrGFR7s5TcFQxfI7jvgQQOvzfy/VMcls
 y8Z4HoOPhEyinCzGK22++w2eftgYaifV04UYUCOXOT+zifMxTN3POIvNG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14624507"
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; d="scan'208";a="14624507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 20:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="7714940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 20:01:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 20:01:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 20:01:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 20:01:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 20:01:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdKKuHkLi1V16XGkAJDEy+QnFwGs0B3PAdLk2XM9Cwdw08VMTXRtH5kewmceRCu+zXfhA4bT6BIYsE92Og/PaWFv4BeiTCg8s6a3OrzvgW643gGZ41YLoBmL+wDEe+n10rU2Tb6ZOIh9tk2yoMKViGx6BsM7rgkywLvyizAIDjiNhYBD8gU06PU3hdO00cw5eNU0lUXuRIYu2nekj4nTHR0tzYjDxQY76RuJC2uuZMx+/kCKcFNevmhuyyLhFsc03yn7HbByy6Apguk8LPyO+MiutsEsqhzRGv2UTZHSVN+wbnhaIu9NFsiGfSJasDTwKipMBA/t7/NSbSgDeCaHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7O7W10AK9+vpgJGjFQcdtxcMUcLrUDIBUg2k+6UguM=;
 b=WK/6++Yy6BpaPa0UW5sgdK5CIJKTEI1HX2Np+SaH4lHkvkmiZXTyUTIv7AHqZk7t/21ukYIZNWB9lWgSWaf8m3t3vOnhJl/Swl2lhWKgbTyah3lZemjvLDWulvnUhWMxfpJHVy20BZ43ja/pHcmxZuOLmHjhMsEsVs+JahIwlt7SaDQ9Lzr/uqZqoHYU9SdxlgWQAkLR4umQl46bHjuXbsA2oCBqmYkLkFu2kqcERCARH9NZ06i/Ai40KD7LBqQRin+P1FHZpnVTdN1kuqLvgJ5rz/lPCo6U8TidFIkrXxB4FGxRUHI6VNufrjC0bgayd3iAFLCRegVY7er7oYre2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 04:00:57 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3%6]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 04:00:57 +0000
Message-ID: <5b07e380-e1c2-4539-9b07-224f29950f28@intel.com>
Date: Wed, 28 Feb 2024 09:30:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_gt_freq: re-introduce exec tests
 of xe_gt_freq
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <badal.nilawar@intel.com>
References: <20240227093337.1151505-1-riana.tauro@intel.com>
 <20240227093337.1151505-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240227093337.1151505-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 972451fe-face-487e-4b41-08dc3811ddd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hS3lyNAgVnWsLMhiZczHXtuCzCGsy3aeNCOShKt/2aQJL9fthPm4qCTdKZgrBR1/CrLihRwO4biFyH4IMDQJAH5yRDF+yt01n7kCN3JaJ1EW+eBPwv/X95z4Pw5/eZOrZRRkFhC4PiyD7t3fvsh5ZqzKj5BxcDBs8Q2WKrYdCwoAQN9CQD1Mei6Zr/IufWVhSyzH/Hcmjo2TpEOIeSjeApahqkpFpSmsuPLpPss8vlT0zRc8L7m4S7GVMg/+MpDD3/yzJmfYU3VEikSuYoBskx5RL9pxQFLt13pQA8f6jy8+qCF9lXoRnJANUX9RHcU3nrZNsHWA59eCoCVHHxjC6grCLqOuzHDK7KE8KoZfd5+BBKsO1xlHv0AZzXqq1+E+0Q/QDpiQVxAe1j1mg5vYE2O2EmUTIOMLI+pazt3GkWjvd+arVi4Oyf3qb6Dw13yPP7+XtYWb62AMqLuI99NaXch5oFEBkV3l8V40Tk52tLCmGhPJX9jB01wsdhuJRdSjStC7mBSWwNS29CXTZj0KvyYr7VknNq4x6UG7/qhlY73QL4ANt8jZEfRujwYQEms7PlOYOs7cIdDsBYmvTl8KaXCzqtIZ0gGQO681HoLRjoEOfltOo40wticS5NJsMMskHViACp12xppyIIO+ktWOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRLckphUXY0dWFpTFFCL3daeVo2YXlvaEJSWnB0ckZlTWphUXFhanppeHFH?=
 =?utf-8?B?QlRzSUtROUNtT1hLa0h0ZmtvbFhhTit3RGcrUXU4SlF5aUg0dGE5M2s1NUFl?=
 =?utf-8?B?WkxnbE5JTjAzZnRzalI3dVVlRFJWd0cxRnZZTzMrSzdXNmhtWDFDOU02YXFR?=
 =?utf-8?B?NW83RndpdEtPYXdGUUNQc01DellpcWVHZFlIT3UvMEhLRTlSUWhkdkVxbDlJ?=
 =?utf-8?B?VnI4dlhLSUdKTHB1UUFodHhpV2dQNHNONE1qcy9OSEQrR1dWVmVJYWowVXVm?=
 =?utf-8?B?UlkrdVkzWGhPQ2Ixci8xN2NzWmp6WkJ5eXEvVm9qa01ieUtjNWszeG1FOXow?=
 =?utf-8?B?NzY0QXdSS2pVSzJ5VVpIUmRabitLNjNtT21mV3d1K254YmxBek43OUFrSUJj?=
 =?utf-8?B?RC9lODBiUnFTVTFsczVrRWx5a0N3a1J6WU9ZN0Q0dmVHSWd6RkZNUys3MkZC?=
 =?utf-8?B?T3RNY2xvRkwrTDJ6TzVmaEJwQS9rQkg0Tm5hTTZKUTJjOTFmRDlLRGI3bU83?=
 =?utf-8?B?SkgyUTVDNC9FZS8vamV3bTRvbVpkdGpORGdKRTdrMHo3M0t0d3dVVnJqMTFk?=
 =?utf-8?B?NUFwOHovKzJQMlhjcVU4Z2tiVk1rc1pJanI0QlNyZDV6eERlNHpLTldkSko1?=
 =?utf-8?B?L251NkZYVFhMVnE2MSsxWEZlR2NleDNxa01YMngvTFU3ZzhCTWRhVG5nQkQv?=
 =?utf-8?B?OFRuRVlzdEt3cVJ6UWl1RmJ0RDJxQk1mQ2pIZ2VKcFI3WW1XMmQ2elRrT01j?=
 =?utf-8?B?TEUvZTlWSmdzVkVFdFpYSnNqeTVpenFyN0tJRVB3OWUremJQNTk3SFlYNWZO?=
 =?utf-8?B?VzFHU2h2NVNhZi9NR3NjVjdpVlNvRHJWc2tiOU5ZRklVREI4S0Y3Tjk3dXhs?=
 =?utf-8?B?Sy9PM2dJVHJFdSs1aDB1c2loRWFTNVlZMVE0aVNQdjcwdy95RTh4VU92T2sz?=
 =?utf-8?B?aG5VaGN6NmlzYkhxNU9iVjhuOCtuT1llY0FhOVpZZUN5SmsxeE11aEpWRDF0?=
 =?utf-8?B?UEtwQWZKTmtXcWt1RytMS0RXamRFOURHai91UmFXK2V6WUViQVNqSDBMSWNX?=
 =?utf-8?B?czVPZHRyT0plMWkyV1A1VFpyenUzajNoK3pveVkrbzBPQzJmVThvOWx0QzIw?=
 =?utf-8?B?RG5kYkdoMm02ekM3M2JtTDdDbFFnSGtMZ3cxMVFZVHE1dE1LemE1U2s1Wndz?=
 =?utf-8?B?SXlXM1BMdzh1eDRWNWtCZWNFY2pyNThjZjZBR0F5eXB5VTlpaW1zRWZ0Q0hU?=
 =?utf-8?B?QUhGVWpXbHpHUmFjbTczWFlBUDByUUtwbnp0YXhySStvNmw4bG55UTRmS0dW?=
 =?utf-8?B?S0N0ZDJROFU2OVdJQTExSE5qbHR5U2s1bjAzb3NvLzZrdkdDZVhUYVBUK0dW?=
 =?utf-8?B?OWxtTWs3Tm9EekJtdGRNYnlmMnM0S2d5TEU0WS9Pa0QxV1l4NnN6QmJtenE5?=
 =?utf-8?B?OEl4b1BoQVFRMlliZ00wN0dsMExLK0FJSlVzaHUyOXFaSk11NGo5eWJyV0h2?=
 =?utf-8?B?MDN1ZSt2RTVJTzNJTTIvSElGUWNwVnhPbHZseWZMZkpsNW15RWZWVXMybWlY?=
 =?utf-8?B?N1Y5SmIzMFpwZzFCVmJVKzloWjJpcUYrd2xPZTNsVi81MzVuYUxTZVUwdHhP?=
 =?utf-8?B?SVNPQ0lLL0FSaWRzbTdSY0J0Nkx4WWJSMEVDY0lvOHVoOWlWUmJsemY2VEJ5?=
 =?utf-8?B?STdtMTQrMElVN2tpS0NtanVPOHBlVEFIVmFiRVZwNG1ydWdJM0h2K01Rc2dO?=
 =?utf-8?B?bDNrbTYrd0VZN2lvdStzemNaUlZKMkpDVEVwTzhyVDg3cUM2d3FRbjJBVDI2?=
 =?utf-8?B?ZXVsZWRxYVRwWUpNR1BnNFR1d3lKK2pDLzZSYXgvVG43azFDcnVwOWlrM2Yy?=
 =?utf-8?B?a3d1OHpmamxIM3k2aDEySEpPY1gwVFkyeDRVWVVmTktGcjMyU1dHYXQvOHRx?=
 =?utf-8?B?VHh4MXdMZXNIWWJ5RHZRQkFvcEVlS1NuRU5wUFhtMzNHUkdXc2FwKytrOXRE?=
 =?utf-8?B?eUowTzFzV3Y1anNmSENBVHRqRi9PV0pGZG1qT3RSWGtxVjE5OVdUTVRYdlcv?=
 =?utf-8?B?WEU5cG9NNmxrbjB0MkR1NXF3aGdRTmYzU3dBa2FKeHpzeXZHSUNZenRianU3?=
 =?utf-8?B?K1JwY0dadGMrdVF6RHRFU2FaY0pMNWVnc3BSbGZLa2lrT3BHYmk4SGZqNmJz?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972451fe-face-487e-4b41-08dc3811ddd0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 04:00:57.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp6HoRfEbuNNu6f08kqE8PrARhw83z+BLbSZ4B/q4JZx2ppv+8YL8yUE+H1goHd3+290pBcuwda7ZXpfQx/uxfarJfD1v7XAPyJ7eM1fzws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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


On 2/27/2024 3:03 PM, Riana Tauro wrote:
> The tests freq_range_exec, freq_fixed_exec were removed due
> to a design flaw which caused failure in tests. The workload execution
> finished earlier before the frequency validation when gt was set to
> run at a higher frequency.
>
> These tests are being reintroduced with a spinner based approach
> in this patch to avoid such failures.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 106 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 105 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index bf63e4298..f0de341cb 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -17,6 +17,7 @@
>   
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_util.h"
>   
> @@ -153,6 +154,9 @@ static void test_freq_basic_api(int fd, int gt_id)
>   /**
>    * SUBTEST: freq_fixed_idle
>    * Description: Test fixed frequency request with exec_queue in idle state
> + *
> + * SUBTEST: freq_fixed_exec
> + * Description: Test fixed frequency request when spinner is run
>    */
>   
>   static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
> @@ -217,8 +221,10 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   /**
>    * SUBTEST: freq_range_idle
>    * Description: Test range frequency request with exec_queue in idle state
> + *
> + * SUBTEST: freq_range_exec
> + * Description: Test range frequency request when spinner is run
>    */
> -
>   static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   {
>   	uint32_t rpn = get_freq(fd, gt_id, "rpn");
> @@ -319,10 +325,88 @@ static void test_reset(int fd, int gt_id, int cycles)
>   	}
>   }
>   
> +static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
> +{
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint64_t addr = 0x1a0000;
> +	struct xe_spin_opts spin_opts = {
> +		.addr = addr,
> +		.preempt = false
> +	};
> +	struct xe_spin *spin;
> +	uint32_t exec_queue;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	uint32_t bo;
> +	uint32_t vm;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*spin);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id), 0);
> +	spin = xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	syncobj = syncobj_create(fd, 0);
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +
> +	xe_spin_init(spin, &spin_opts);
> +
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle = syncobj;
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr;
> +	xe_exec(fd, &exec);
> +
> +	xe_spin_wait_started(spin);
> +	usleep(50000);
> +	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
> +
> +	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> +
> +	if (fixed)
> +		test_freq_fixed(fd, eci->gt_id, false);
> +	else
> +		test_freq_range(fd, eci->gt_id, false);
> +
> +	xe_spin_end(spin);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobj);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +
> +	munmap(spin, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   igt_main
>   {
>   	int fd;
>   	int gt;
> +	struct drm_xe_engine_class_instance *hwe;
>   	uint32_t stash_min;
>   	uint32_t stash_max;
>   
> @@ -352,6 +436,16 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest("freq_fixed_exec") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->gt_id != gt)
> +					continue;
> +				test_spin(fd, hwe, true);
> +			}
> +		}
> +	}
> +
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
>   			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> @@ -360,6 +454,16 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest("freq_range_exec") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->gt_id != gt)
> +					continue;
> +				test_spin(fd, hwe, false);
> +			}
> +		}
> +	}
> +
>   	igt_subtest("freq_low_max") {
>   		xe_for_each_gt(fd, gt) {
>   			test_freq_low_max(fd, gt);

lgtm. The tests are also passing on pre-merge.

Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

