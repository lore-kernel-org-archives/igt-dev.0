Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08436C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 15:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A084710F102;
	Wed, 23 Sep 2026 15:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk/e0tiH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0241810F0FE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790175723; x=1821711723;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I1ygjoVL0o8EFIZVtBjQuab47RNlxIpeY9y5TJ4BbXg=;
 b=dk/e0tiHT018C+kkGhC7LNP60BpRK9iFe59BlLv7sdT8Byr7ztrN5WkP
 Hpg1/bYHPSI8YyD1Ktia+agLm3RSte6RwuBV/LZjd0vpTwWWY3YTAs+G9
 cNwlqNdMGTPhXFId/7+pXM7r7fYzJChvxRVsF/72I/9QCfhmMW5Aqrm/R
 OxIjShRhwxiAONo9lkKdG+tRVMVdK96P9yEtOjLKDqTolvsoSAT3RBoOJ
 ZhI4iQwuk3aD13519WLe0jblH3xwQ2eZ1lr14X7V8k5abqjdj+LF2uQTJ
 7W6946yXgs2IM6muTHpIV8ndcUGfpmWqvMnOEJH3IdcGoT4kzxNjwSNo4 w==;
X-CSE-ConnectionGUID: 7dR3rKSoRwmUH8kc0EL0VQ==
X-CSE-MsgGUID: nRidXAzhS66pBWDz5RDwAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90901656"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90901656"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:02:02 -0700
X-CSE-ConnectionGUID: P0JnikcaSNiNHvxt60sJfw==
X-CSE-MsgGUID: OlI38x8SRjOTupgR8q7Cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="299890336"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:02:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:02:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 08:02:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 08:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKadn0/DXPxv4sHUgOeuNAPXt7jZgj28tHDG3vLRPj+k4NpGF2ReYyD8flbhzlGmdQ7WPZLwl5BAhLfmBHy1Ap0WjH9XrjVVOldM26CM96dX9inIy1rC+Wx0IcsuKIw3X2DzCwrm8tuZn70oVPwv9W0XWPfq58jNF0Kw6KOXdWcxmeYdpMNfSoeIoVKORYhkX63gbbm6gHAmB6y4L7wBNOfkdrwRPIiUIZUFgSKiEEg2kOhsDRGFc2LVmdZ8j/EKZZQ0S8gC4uy4aXeJgei+I+faDeb8kwwSSWNs5Yar1SLXeWcvYF+sYLrTymfhVBBSyLCoeg2wURvyUMXkk0/aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7dgx1qymGBSlFRHgGLJqawJk1nwv04351WuRTIUj6g=;
 b=aQM7c6hn4IX1ND5N5qMDI6jcvR6BQ4mYpCMyi365rDqSu/evmqv6cCltJGQ5dkOsGSAH1Z0oBgL9Eod64cplTqyEBsjCrKLon1+fH9hvasrJTrYtfrvDv/omjzfWqzatTkXOUB7LhZEoIeKKfGGLcwLlQvUDjhhEJRNI3F4jmeRbPIverXmeO6GQxY5dT6iiez7js6oYiSMXZncp2lG7uT22+NWh4JKsnOQpMaS9kXBOppNqZLRGkvBD9pN4d++B9pBYlobATRGMdGiKWTkjg94H+sSaG2Kn7A2lL6HFbLOXzwH2kkBYrUfUY0txYm2EGFUfogmQiT9UGg6CB7tyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH7PR11MB7097.namprd11.prod.outlook.com
 (2603:10b6:510:20c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:01:53 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 15:01:53 +0000
Message-ID: <4fbdd627-d637-4d11-9415-d73b6ddb97f2@intel.com>
Date: Wed, 23 Sep 2026 17:01:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Dockerfile: bump fedora version to latest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260923140806.189792-1-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260923140806.189792-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7e44b5-343c-431b-ed81-08df19839a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iLJ1NCoUb/dPeDXRVBgjysSZbfRm5oTmHlZEopDwALs/CsY44yJ78oaj8ENWgFBTfcl1NaIWTcu258V7fmDDIIegMOoV2OUgkF6NOFA7+oOSRr68bwd7BZsSyd79fPvFayNfZFJmDh/EyuBlMTskxQ0ojih0HplcSNXFTugT4qlNsOXHUswTKxfoigHto2UI+Y6f7wKFt8SuSLfv9CbxyEr1o0T9ADuJziEOyEpSalSnCDVYiK4qUhlS1GJR6R6maoFKO2ulOGo891Cemj+mq8ZYJOsvZHN3twBfoUYdgQBcSXdAobh7MmN4Ic/gKJdPBAndBJokL6OKfIHuhNCIeg1ssHPtrij41Vl/596+XsqETsIWchpXNraldC8dc/BJLZ8UaXODRoTw1jrdXSHSd93WD2BOyT0gBzVmHwv5g4xhtLOM2Xr+zttO6qpaSiykSIE+F0we4sAavVRvguGuVhuQ5WzhmPpo8EoCh8klPafM/re38ax2su+sKiqtLZa+x4Q1RNAbuB19O8PGskHX+W9NACfgEahRwpThwT3GQbDh42EkUEms0R49YgdfJruBhjCqqz/7+RMFkTnTNBgggN5XUrYsZUygGti+labvt1mSpVKguMOZrOeHxRYl+7EgIUDT8gy3oHhFJ41any7eLzCHnuyvJh1PRXjaKtStaLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZlUUdNMU1UR050QjN4ZmlOaGF6Ylg1S1d1OUF2YklWdmNtd3VNOXBwLzY5?=
 =?utf-8?B?VVpmcGYrcEZRUmZtdkwzM3lncGRrWG5CdWduNW1BQ2RxVGpkQVRyMVF1bTU0?=
 =?utf-8?B?UU9ZRkRXUFFJWXlKOEF0Ymw5V2N1TFRCZjVQa1MxaGlFV1lQNGJydVFCbUFr?=
 =?utf-8?B?d1BsdEhiT1hxazFzK1BzOU1LWXF2YjJzMWExbDRBQ3VyU2EvTTJyeXhPTUxN?=
 =?utf-8?B?dXhFQXM5ck1HZm9NSUE3K3liWTJ3cm5iRFdCWlVYZno4M0xqcXV5UmFmUGdP?=
 =?utf-8?B?RVJtU05GNnY4enpjNWphZHM3azNKSkhkbkFWcGppbURUbElHUExFc2xlNTNF?=
 =?utf-8?B?NkZ1NHRmNWlib2dpVFNhbU15TzAzdlE5OS8xcStxV2VoZlNtWDkyTFJpUSsz?=
 =?utf-8?B?djhMcHVsVUZJMGR3ckVMYllxOW02RTRBT2lqMVJnWlNtc3AwRGg3VnpiYzVh?=
 =?utf-8?B?UlVBcUtaSHVKM1p6NWlvRTBlbFZjUWpySk9qNENiRXJ6ZzhLVDFaT0d5cjVx?=
 =?utf-8?B?SjZuOUxtU09mQ1YyMnBFaVdvOG90U0M2SUdyaVNSYXpvMjQwb0hmMVNHY2JJ?=
 =?utf-8?B?OTdRNWlzRnVFcVFpTXQwZVpKS3pibDk2LzNabzZOTFh4K1lqanFIQUlQUXRk?=
 =?utf-8?B?UDRJZVg3VEo4czNsTCt1OUtwSmpONHAwckE2RFVnVEl4WWsrMHljZ3JPRHQ2?=
 =?utf-8?B?cE83cWZRdktaYm9DT0hIVG0rL3FCL0xTcG1ZYVdzYXdjTHptSWhWUkptNzA3?=
 =?utf-8?B?Q2lkdGZ4MHV0OXhpcURMeWZkTnRhdUVNd0ZnaVpwc3MxVWs1bWtVRk1jTldB?=
 =?utf-8?B?VllWeDdNY0lXalNha3owV1BKNE9QZDVyN2txY2t2Wlp2M0xJK085SjFCZHgy?=
 =?utf-8?B?d0RuRWVxZ2NiUzBKQy9aQTU3cVkrODU2YXlCZHREOTM5RnU2ZzNKais4Vmc2?=
 =?utf-8?B?bCtJdjByRXhUeVVOT0ZIWW9iU2tkRjIxNEJxZ3JiaW9qMTlLakgvSTBmclVp?=
 =?utf-8?B?dmE0QjBNVFlpZHR2NXMrNEh4d3UvMmJxSk1YUjNJTmlVTGxYTnlOSWtBd08r?=
 =?utf-8?B?czYrZFVkMjRTbkU5bDVPQlB4SDZkTUU1OVNielBDSzZIVTRaR1ROdENUODJ0?=
 =?utf-8?B?VGRwZGwxUXlacURPcFd6Tk9VblRVTWhzSEdZamYyZlJzRjRxRFBCRVcwL3dl?=
 =?utf-8?B?R1lqb0FFc0htbnNKNFk4NXFydW5oQjZzYjlBbFg5WHlPNlFoSDdndUprVXgr?=
 =?utf-8?B?WWtNdGlrb0o4Mk1XZ0FPVFk1N1JielhrWG1aNUkrRXRsYk1WdDA1WWtEQmlq?=
 =?utf-8?B?ZTEvS0o1ZE9RaThjSkg0SVgyYU9YSnMwSHZZV0dTaE1tL0p2VkU1NFNqWVpU?=
 =?utf-8?B?NzFBL2ZMZ2lzSWU0ZnVKV2FGejE1aWJma0ZIc3IyT0dRa2IxZlNHZnJuOE94?=
 =?utf-8?B?elRnMDlzS0h2M2VLeERBNlI0K0dlci9Yb1ozZ0F1T094cUNFOGFheXRFMm5Z?=
 =?utf-8?B?ZHlGMStjcGZHdE9DTkVIY2NUYTVZcC9OV05tRDhNZ3pmemYrNkJuei96YThS?=
 =?utf-8?B?UjZNNHFENEh0cXJRNVAwQUQ4bFVnbjlPNzBMa2sraVVEdkdvOEhJc3BDK1pZ?=
 =?utf-8?B?VzMzTU53dXE3RzRWMGFmUjlJWUYzdnBKY3VlTTlDTmpsaWd2bWVmV3pIWEp5?=
 =?utf-8?B?akZwancvSTUrNTF5WlFvbVcxUk4zUVdZS2JNVEF1VmdHY1c3R0NOdUM1UjZZ?=
 =?utf-8?B?VXNyRW1OT0xXYlY4QjUxUGI5N29WK24rMWtWZURqS1NaWWJnZkRTZGFlNXpP?=
 =?utf-8?B?Sm4zYlVOYU15eWw2WXVOMzhMUzUzZ0dBN0lRcCtiQ0JYOFgwREhvNU1UVVZo?=
 =?utf-8?B?ZEN6TzFHVTRBdm9ib1p2T0lsRzZ1S0xGY3dVWW85NGJJN2VSeU1TV0dBTm1i?=
 =?utf-8?B?Z3p1dTFBNnhCd0JXOTNSN3NuWkNuZXcrcHFONmhSWk5VUmI4UmVHM1ZQQVdl?=
 =?utf-8?B?WjhiSjdOS2hmam4xMXE4clplVStvRkJFd2RhaEg1Tnh1ZEF3bExISUhmR2JF?=
 =?utf-8?B?bHFKSEhPOUUzR3F4Z0pTcGQyVkh0UW11MUc0RTRpdStHL0dkSitYWWphOVBW?=
 =?utf-8?B?Nkg4YktjZzNTTzM2MVpSQ3haZkkrYTIweEFDMVBzcVNCaDRxT25ZU3RhUlNz?=
 =?utf-8?B?eThXbnZKSDdBYTVWMzN0ZEZhWXZNaG43VEdyYy9vR2VDNlJFcXcxNks1ZzJ3?=
 =?utf-8?B?d3krR0ppczk5c3hRMWNyZ01YWTdqOVhic3ZZZG0raTB3QlRETy9nNUFTN0or?=
 =?utf-8?B?elFld1FwaFN1L0NQQm1GQzZiZFZZbmROd2RxMUE3WkpoUEZkQWtydz09?=
X-Exchange-RoutingPolicyChecked: I0+7P+xyJUJAIqOog25xl32B5CCHLmVCACKgonR1OT3d/khsZGwv8QO2ujPL9UU2Vz3lKcorX5KljcJAwiO+yyRvje2HewW9HyPOjl4HDFYQOQdqGeqGnGAxn1wipesGC30DAF1gycQkgZUbYbfenLHL3XUWKWBkepLbSsQbwFJpF3A1ejmAqh5RWXotyz920DF8FGPINTIIoyrFznlvS/o3jAiYnPKe+Er41pON5c1xvSHTMPbK5Ar6SfPgksauvZMG0vaNMq4mEGElRi/pGy9qgG3S00n53XROQ2wm1nwzCN6xxbzDsmPufetJRkWaSm8hVo559CV75bY20VwQNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7e44b5-343c-431b-ed81-08df19839a06
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:01:53.0120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BelyFgzYDwKmqL8R8KyQ4pMdfpwzV7uq8hahG48ptUad9vvw4Z3x201M1Cgmew7d4O9ALefOTbZgodux/4CAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
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

W dniu 23.09.2026 o 16:08, Kamil Konieczny pisze:
> Fedora 42 is EOL so bump up it to latest.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   Dockerfile.build-fedora | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index 30791faef..a65f1030d 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -1,4 +1,4 @@
> -FROM fedora:42
> +FROM fedora:44
>   
>   RUN dnf install -y \
>   	gcc flex bison libatomic meson ninja-build xdotool \

