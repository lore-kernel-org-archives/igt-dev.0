Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116FFCC9C8
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 06:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085B10E652;
	Tue, 10 Mar 2026 06:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/pQAxYE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD710E652
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 06:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773123336; x=1804659336;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6rGLAytyQ1BHEnxeT+me9VRHFdb/hZGPwec3mo+amT4=;
 b=A/pQAxYEByWFaT17g4FDIJjJ5w6//IRUIzPKtH7568JCe+M1tNlwHzTx
 5X9FY4MCgoIARMXJSd+5h8KdGLGCYWGdHG93R0nedZ/F1e/73C+L2sy+Z
 5fHth30XVbs6mBJ6Cqlrvxl9Nc23mw9wlL7MVMVmADg7CB/13f++f8+vt
 m/V5finQtXyi7IKRDlY7loVxdZIK4cV7jyEYnVZwyOerKpFRMqe82G90z
 D/xjE12Zzi7yvHfEaWR2HIGVybbrVEF7MZr8oqFm5uXPZe7nACAnZa03d
 av8veEkeADQ17YwwgGfksXKgH52mT/0r1jSUXI3GdQVvO721krLukhpYY Q==;
X-CSE-ConnectionGUID: Y0pW9tHkRJWd+5Z7t4w6Uw==
X-CSE-MsgGUID: U6BWTA8ATOKn0EJM0jVNVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74238910"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74238910"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 23:15:35 -0700
X-CSE-ConnectionGUID: xXhi3hlPT12uFn0+qwyz3Q==
X-CSE-MsgGUID: ErCAr6tGSC2s/M/AtXfLhg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 23:15:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:15:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 23:15:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL/XUmZ0mUdCVXsQNkEEgqXtQP+Imo/Z7nQDEnpSs28HQFFauEOo1IqzuJt6LzCjbXZyCmGy38srIFnPW+HbEo7TCpChJT3Z1kV2SCNYJWYSI6lNu9tEcbglbvSDRGeuqMHCyA22HIrc4svLkiXx+r4a3ip0Kk5iU54QtTksd6Uvc7Q/jymxu3s0dnVoaXpjFzYadLRbBSGRjilui7bgffbEvWFtYngEbrR0gFXyMBopQ1tC5Xc3INdxANysFCq9Ll386nmvW4bgZrNcGx8nhz1TzkQtGxH/bo2w1zIdvOvUIvM3HMFKzbAaa3eY9/fbwgY4C+doYDvKgV+JClBRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M077mN7qrsz5+6wynkDH5J7d/EAiC3u3i8VVA/cWHk=;
 b=q+ycU9sy/UqlpROJVDxOMxLEG5ahukSFyfdYnYtWoiWgGpLxqXsFCriWh91TlTG5cXURX0JirAWn+O06GmAFlHKldsL2L4+nVOpKvhCvRhYxWxoGIb6QnQ1yrxeR90SmKVjZw2aMmSYRgUxTg6e+izFRFe4JNmKXmFuxQeB1DvDoNY0yVwAnUiBKgGldx8c5xipLTGei+qAmmS8B7aNX1FZh6lqp99Lz77qI9Jj+2vZNOgFZgxr47o3KCb7WRIGojIr0T8hFudkaVm5qQFsMHddT6Itf03sapu/jfMQRXHczbJcAAe27mNt6zbV0wAM4W8jLMTdyWA6JER76lDW2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 06:15:31 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 06:15:31 +0000
Message-ID: <12a73707-f04e-4c25-80f0-502200f249fd@intel.com>
Date: Tue, 10 Mar 2026 11:45:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/1] test/intel/xe_vm: Add oversubscribe
 concurrent bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260309115416.1704717-1-sobin.thomas@intel.com>
 <20260309115416.1704717-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260309115416.1704717-2-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 3374aab7-66da-4bc7-0c48-08de7e6c6edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: QWHP1CBE4h8HRbUsUnyW2wfHFBvoiVzxH2AMGekwvjSf4h1EiUdsOob6uhad+EtT1wvySytMDbZ4v3PZSxiSZahTxnRMkATTS7YBKRXLsMBJIyhSgnU266ZC0kDbWnMGsmmQw6qCQgGI9FWRcqVYAZtdqdAvcMxDTWKe1SBG4XyJ9n3fD9RwD1QvMDS07ObewxgVW/Zsd4grUt4CqmQxz5V8rWm6C32XkKbIJFNLqilTS3RjbRsMamNkjhHxwRQwn9+DKM0lRy7NYFVSFU37ElcesEY7wyIUerEXyGNGt+SDtMpBZyC87q1xjZDIw7+5P+VFJnVLOpgaLlP+Q3TTi1plodgsYnDsieTza4A1seC160X//YNAwnteTrilhvqpGNV6TPSomhIAw1gVeOz3r2N+DANZeGUm2zxktc6S1wcPmPkPop/7VoT8CwgN759F21mCPjI4UuyOBE3ssGOdhhxBBfUriCUnVg9b+4EFvOkCrhPsrzvLp8/oLSKXWuKydCJmWOUZGD+XawSV4nQ/0s2tmK/kd4gtkShMC2e/5g4A0+K3mvA0JsaJnKw1V08xbLRHgl54YryyfLwUfKGFf48rYF7SrzbY5iuaMOk5h/FlPyJmSUv7Sd/qLbVr6iuCJgUCGw6iUq0nWdjlaOmLS9NsJjGwB0OKfKkfE5NzZdy3VnH3Gnk9qqbKZLilK6mMo0JexifrALvC1C74pws2v+r64qh/rep/5uskFsgwbYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzc3M0w5TFM2YnBDb3o2MDFaV0tUeDl3bWNkSy9sRFYzeTJNOFFZYUgranJl?=
 =?utf-8?B?Y25UQmI5NG0wdGxEWGpEdUNxQnc4MEpCSisvbFBYVXlTU09zcWZuZk5PeHJn?=
 =?utf-8?B?UDhCR1ZEVkZLMnZiWC9pSVFsaGExdHd3NE9XZ29Qb2d5NUg5RXlWTXhHalo1?=
 =?utf-8?B?MEV2b0xYMUpIZVhYaElqVWhjcGNQUjNrbFhhbGtnTCsvL1I1YlM3dy82cndY?=
 =?utf-8?B?TjBWV2lncW5JSFRZMmVXTE5jYVpwQmIvNGRpUEtmR2pYYVZvcDFObjhoTE9T?=
 =?utf-8?B?cHVVNmt3OEZBY1hxR3ZlMFdrY3JKcTFiUTJQLysrU1U3TFliZEc0OXdDaGxD?=
 =?utf-8?B?RWRvdWFHT2pQNlRRekYvYlAxN1RFWTFlRjJzSlNqa25ndG52aVIxUnFKeWV2?=
 =?utf-8?B?RDZvQzBiVWJxU2Rmc3UyUVNrUTNXUnkvWlRuencxUjM3bG4rQkJNQzBRelZY?=
 =?utf-8?B?UlBDNVpvQmtqeEF0OUE1bVhtMlh2K2NieFdSN254Tjk3RWlTZmNmaC91QnAz?=
 =?utf-8?B?aVhuMEp3dmJtRUNJc1E4SDlmQThLWkZBSTQ0MURtWmxIVHF5ci9Qalp4a0JY?=
 =?utf-8?B?Q2grNHd1RStSbGFEL1RJU1o1MGNFMzFKbVc4YkpPUGhkbVdoY1FISGZINU03?=
 =?utf-8?B?ZzNFOWIrTjlMQytwMjJ3cG9wU0RCb29KSk55aU9ib21XYkxKVUtETFpLdGVT?=
 =?utf-8?B?dXhPbUxPZ0lQN25Ud0h4RnI3SWh6YTZqQUFvcEl0VGRMWlZhTmg4Ukh5b2Js?=
 =?utf-8?B?em9RMG15bjFCbFRkV0NqamlOOXc1all1aWwyampkYWpjZ3M2WU4xZlBrYXMy?=
 =?utf-8?B?SW9rbkhUcllMclJ0WGdqQXpYamtUYWFUZGMvTHN6RDZsUjZab2tEVlQ3ejhz?=
 =?utf-8?B?QTZ0dXk2MU5sY2NoZmYydGpIMEg1UzR1QUVEYlM5a25EbVpCMnFzeFhQOTFI?=
 =?utf-8?B?R2JLaXV1czBZb1hEbXZVS2xmYkI4bmxFUjUxODhFYlp4MjlBait1by9TNC8z?=
 =?utf-8?B?SGJWSHBvYzMrVTFXQmpuc3BIbjJKbWRKVjVmaFU4bmQ1NGcrRXVaT2U4WWkz?=
 =?utf-8?B?QVV6RC9XdWIyR00rSXpsTlYxSzlMUkg2eEttZWRTV2FuKzExUzZYQTZ0SnJK?=
 =?utf-8?B?bXplVnZUSzA4OEJyMUEwWHhOUGJKY2c5akkxVDdMaFJjendod1RkUFNiQXdk?=
 =?utf-8?B?MTVzWHJPZE5nQXdyMkRDb2tYMXlONlZ0c3RsWGUyN3dWNmtMbUN1UFZWOXp1?=
 =?utf-8?B?RkJzaFBSNXJCbDc2bmdVRjJnZElWbHk2d0l1Z3ZXVTdYWVhwY0I5NVZ3Zjdv?=
 =?utf-8?B?TUl3Z2hqa2lzZ1pQOHkxcHh4OVVKd3p6UU56QlNVTXBwamFLdWVUY1dKYW11?=
 =?utf-8?B?WnlDK0thZ1laRlBXd2tJSVhPbGVLSVFYNHo4YjB4TnNRd0tXbXdESytSN0NG?=
 =?utf-8?B?UFNWenArdDdNM2dyWXJpYlVENXRqN3JnckZpaGRuM0YrQVRMNU04N2UyV3Jx?=
 =?utf-8?B?dWJEamppMG5hRzNxWndSYjlrNW5qRWlvU2RaRStJdndNYkdPMmQ1VjdsQVBG?=
 =?utf-8?B?THdmNFdUYSthV3krYUEvN2pWdC91eUN4Sm5JenF6VzVEUzhBQlNKSzZlV1dj?=
 =?utf-8?B?K0psRzc5RlJ4SG15bGZzcVBJcTVKbE1MR0ZpelA4ZnY2RDNFQkdXTGJFNXBI?=
 =?utf-8?B?OThvWGI5VVVyZkgyaFBzOEdmQW05dk0vRjA1cDF6bXB6NnpMbE5jZ29FQnNZ?=
 =?utf-8?B?MS8zUU1GalFJU3dEOEpzZzE5dk9tdkFZazFrVzhad2hkNUJGeVE0REhFYURs?=
 =?utf-8?B?OXRXV3RhdytqOGlHVElzNTVYbE42SGZOb0VNYUVMajhQcFFLS0ZKMEhyMVlz?=
 =?utf-8?B?TE5ZU1NnQ3RyVHpvTlZKbUg5TnBCSkFOemwyeDcwRWptQm5YRG1xOFBEWTNC?=
 =?utf-8?B?eWJ4WHFNTWNZTFlmUlc5SURTV3lIcU1icUN0VWt5N0xmdGhiamJQQ0x0VU1v?=
 =?utf-8?B?OCt6eXhBV0I2SWFrcWtGamMvM2JjYVB6YzFkNFY4d0NuWlAvTnR1eVRRUTk2?=
 =?utf-8?B?bjlMWVJkNWxqZlpQOEloK0JCdWdPWmhlOGFiRnZiMDZXZVNrWTBoNUs5S2VQ?=
 =?utf-8?B?dUVrSTdNSXQ2SVpyZ3Z1UGh2bmxUWlIzR25FUEdIZytDaG0wMHJLTENQYTJw?=
 =?utf-8?B?bHFUejJCOVFYWlZycUQwVXZNRVh0b2FqeHJDWFJmV211bXorcjJ1bWRvNGU2?=
 =?utf-8?B?SXE1MXYrckZrdUJmUExzSTNJa1BpdXJQVkxQSGhxRXdtYjVKUnp6VHVoRzFa?=
 =?utf-8?B?eGRzVCtjM3prS3BMUDdLdGVzeUt3Zm0wODAxN3VZVjRkT0ZTWStVdz09?=
X-Exchange-RoutingPolicyChecked: Hw0rOFqws7E65gldjNeTtO6CiUDJcrye8ZGEe2wowiUGiuSx173vauCEo28hRFgmw5t9Gpg2twzNjneUtXffCmLXLn+ej/v1D6tMQK1zRhfRVAIOzz6MDC56THha/pa6C7xyY5v5olqLyJvbd5mH4Assn7rh8wCeFShrYHUdwmN0xf6qF5Ii+fQ9lUIibwdMM0lLxUo6+CvKsvtWw4mdBw0bprVkQUhNu8prYQ/y7DdqNITgh8+uhXFrEp9V3R8sseeg1INDc+0EZgqrxtEJkc51ArroF9WVp5Bhd+oU35q0UuGxEhKQe40W7pQ/o+l4V1Gg7KdpHzXKX8bvemvBqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3374aab7-66da-4bc7-0c48-08de7e6c6edb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:15:31.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1DQBYs9Qoglc3dnxUbqnxZrurZqls/IGSYD7Jn4FQLeXZEhw2ogB9ty+6L3QS9HusDwKpLxH0gZScusGgSUew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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


On 3/9/2026 5:24 PM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, excercising
> the bind pipeline under eviction pressure.
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 438 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 438 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..ed46f4bee 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -19,8 +19,176 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
> +#include <inttypes.h>
>   #include <string.h>
>   
> +#define MI_BB_END		(0 << 29 | 0x0A << 23 |  0)
> +#define MI_LOAD_REG_MEM		(0 << 29 | 0x29 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_STORE_REG_MEM	(0 << 29 | 0x24 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_MATH_R(length)		(0 << 29 | 0x1A << 23 | ((length) & 0xFF))
> +#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +#define ALU_LOAD(dst, src)	(0x080 << 20 | ((dst) << 10) | (src))
> +#define ALU_STORE(dst, src)	(0x180 << 20 | (dst) << 10 | (src))
> +#define ALU_ADD			(0x100 << 20)
> +#define ALU_RX(x)		(x)
> +#define ALU_SRCA		0x20
> +#define ALU_SRCB		0x21
> +#define ALU_ACCU		0x31
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
> +
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	int fd;
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +	uint16_t sram_instance;
> +	uint16_t vram_instance;
> +	bool has_vram;
> +};
> +
> +static uint64_t align_to_page_size(uint64_t size)
> +{
> +	return (size + 4095UL) & ~4095UL;
> +}
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
> +	};
> +
> +	/* Find first render engine */
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
> +			eci = *hwe;
> +			break;
> +		}
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t handle,
> +			   uint64_t addr, uint64_t size)
> +{
> +	int rc;
> +	uint64_t timeline_val = 1;
> +	uint32_t syncobj_handle = syncobj_create(fd, 0);
> +
> +	struct drm_xe_sync bind_sync = {
> +		.extensions = 0,
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_handle,
> +		.timeline_value = timeline_val,
> +	};
> +	struct drm_xe_vm_bind vm_bind = {
> +		.extensions = 0,
> +		.vm_id = ctx->vm_id,
> +		.exec_queue_id = 0,
> +		.num_binds = 1,
> +		.bind = {
> +			.obj = handle,
> +			.obj_offset = 0,
> +			.range = size,
> +			.addr = addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		},
> +		.num_syncs = 1,
> +		.syncs = (uintptr_t)&bind_sync,
> +	};
> +	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
> +
> +	igt_assert(rc == 0);
> +
> +	/* The right way to do this in the real world is to not wait for the
> +	 * syncobj here - since it just makes everything synchronous -, but
> +	 * instead pass the syncobj as a 'wait'-type object to thie execbuf
> +	 * ioctl. We do it here just to make the example simpler.
> +	 */
> +	igt_assert(syncobj_timeline_wait(fd, &syncobj_handle, &timeline_val,
> +					 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, syncobj_handle);
> +}
> +
> +static uint32_t
> +vm_bind_gem_bos(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
> +{
> +	int rc;
> +	uint32_t syncobj_handle = syncobj_create(fd, 0);
> +	uint64_t timeline_val = 1;
> +	struct drm_xe_sync bind_sync = {
> +		.extensions = 0,
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_handle,
> +		.timeline_value = timeline_val,
> +	};
> +	struct drm_xe_vm_bind_op binds[size];
> +	struct drm_xe_vm_bind vm_bind = {
> +		.extensions = 0,
> +		.vm_id = ctx->vm_id,
> +		.exec_queue_id = 0,
> +		.num_binds = size,
> +		.vector_of_binds = (uintptr_t)binds,
> +		.num_syncs = 1,
> +		.syncs = (uintptr_t)&bind_sync,
> +	};
> +
> +	/* Need to call the ioctl differently when size is 1. */
> +	igt_assert(size != 1);
How ioctl called if size passed is 1, here it'll assert and terminate 
the test.
> +
> +	for (int i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.extensions = 0,
> +			.obj = bos[i].handle,
> +			.pat_index = 0,
> +			.pad = 0,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +			.prefetch_mem_region_instance = 0,
> +			.pad2 = 0,
> +		};
> +	}
> +	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
> +	igt_assert(rc == 0);
> +
> +	return syncobj_handle;
> +}
> +
> +static void query_mem_info(int fd, struct xe_test_ctx *ctx)
> +{
> +	uint64_t vram_reg, sys_reg;
> +	struct drm_xe_mem_region *region;
> +
> +	ctx->has_vram = xe_has_vram(fd);
> +	if (ctx->has_vram) {
> +		/* Get VRAM instance - vram_memory returns a bitmask,
> +		 * so we extract the instance from it
> +		 */
> +		vram_reg = vram_memory(fd, 0);
> +		region = xe_mem_region(fd, vram_reg);
> +		ctx->vram_instance = region->instance;
> +	}
> +
> +	/* Get SRAM instance */
> +	sys_reg = system_memory(fd);
> +	region = xe_mem_region(fd, sys_reg);
> +	ctx->sram_instance = region->instance;
> +	igt_debug("has_vram: %d\n", ctx->has_vram);
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -2450,6 +2618,271 @@ static void test_oom(int fd)
>   	}
>   }
>   
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	uint64_t vram_size = xe_visible_vram_size(fd, 0);

Shouldn't be this available vram in xe device? visible_vram will be 
complete VRAM exist in xe device but that some size of VRAM being used 
for operations.

xe_visible_vram_size(fd, 0) gives size which is greater than 
xe_visible_available_vram_size()/xe_available_vram_size()

> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	const uint64_t buf_size = GB(1);
> +	uint64_t target_vram = vram_size * 2;      /* 2 of VRAM */
> +	uint64_t target_sram = sram_avail * 60 / 100;  /* 60% system RAM */
> +
> +	int total_vram_bufs = target_vram / buf_size;
> +	int total_sram_bufs = target_sram / buf_size;
> +
> +	/* determine concurrency from memory pressure */
> +	int max_proc_vram = total_vram_bufs / 2;
> +	int max_proc_sram = total_sram_bufs;
> +	int n_proc = min(max_proc_vram, max_proc_sram);
> +	int n_vram_bufs = max(2, total_vram_bufs / n_proc);
> +	int n_sram_bufs = max(2, total_sram_bufs / n_proc);
> +	uint64_t total_vram_demand = (uint64_t)n_proc * n_vram_bufs * buf_size;
> +	pthread_barrier_t *barrier;
> +	pthread_barrierattr_t attr;
> +
> +	igt_debug("VRAM demand: %" PRIu64 "GB (%.2fx oversubscription)\n",
> +		  total_vram_demand >> 30, (double)total_vram_demand / vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
> +		  n_vram_bufs, n_sram_bufs);
> +
> +	/* Create shared memory barrier for process synchronization */
> +	barrier = mmap(NULL, sizeof(pthread_barrier_t), PROT_READ | PROT_WRITE,
> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(barrier != MAP_FAILED);
> +	pthread_barrierattr_init(&attr);
> +	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(barrier, &attr, n_proc);
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = GB(1);
This addr should be GPU VA, correct? If it is then why it's assigned 
size which is 1GB but not with GPU VA?
> +		struct timespec start;
> +		uint32_t vram_binds_syncobj, sram_binds_syncobj;
> +		struct gem_bo *vram_bufs;
> +		struct gem_bo *sram_bufs;
> +		int expected_result = 0;
> +		int ints_to_add = 4;
> +		int gpu_result;
> +		int retries;
> +		int max_retries = 1024;
> +		uint32_t batch_syncobj;
> +		/* integers_bo contains the integers we're going to add. */
> +		struct gem_bo integers_bo, result_bo, batch_bo;
> +		uint64_t tmp_addr;
> +		struct drm_xe_sync batch_syncs[3];
> +		int n_batch_syncs = 0;
> +		int pos = 0;
> +		uint64_t timeline_val = 1;
> +		struct drm_xe_exec exec;
> +
> +		if (n_vram_bufs == 0 && n_sram_bufs == 0)
> +			return;
this should be checked above where n_vram_bufs and n_sram_bufs are 
defined outside fork otherwise system resources will be busy once you 
return from here.
> +
> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
> +
> +		if (!vram_bufs || !sram_bufs)
> +			igt_assert_f(0, "Failed to allocate memory for buffer objects\n");
this can be clubbed like igt_assert(vram_bufs && sram_bufs)
> +
> +		rc = clock_gettime(CLOCK_MONOTONIC, &start);
> +		igt_assert(rc == 0);
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		query_mem_info(fd, &ctx);
> +		create_exec_queue(fd, &ctx);
> +		for (int i = 0; i < n_vram_bufs; i++) {
> +			struct gem_bo *bo = &vram_bufs[i];
> +
> +			bo->size = GB(1);
> +			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, vram_bufs[i].size,
> +							  vram_memory(fd, 0), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr = NULL;
> +			bo->addr = addr;
This should be valid GPU address not size
> +			addr += bo->size;
basically addr is holding size and then again size is added. it should 
be offset (valid GPU VA) + bo->size
> +			igt_debug("vram buffer %d created at 0x%016lx\n",
> +				  i, bo->addr);
> +		}
> +		for (int i = 0; i < n_sram_bufs; i++) {
> +			struct gem_bo *bo = &sram_bufs[i];
> +
> +			bo->size = GB(1);
> +			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, sram_bufs[i].size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr = NULL;
> +			bo->addr = addr;
same above
> +			addr += bo->size;
check above
> +			igt_debug("sram buffer %d created at 0x%016lx\n", i, bo->addr);
> +		}
> +		pthread_barrier_wait(barrier);
> +
> +		if (n_vram_bufs)
> +			vram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, vram_bufs, n_vram_bufs);
> +
> +		if (n_sram_bufs)
> +			sram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, sram_bufs, n_sram_bufs);
> +
> +		integers_bo.size = align_to_page_size(sizeof(int) * ints_to_add);
> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +
> +		integers_bo.addr = 0x100000;
> +
> +		for (int i = 0; i < ints_to_add; i++) {
> +			int random_int = rand() % 8;
> +
> +			integers_bo.ptr[i] = random_int;
> +			expected_result += random_int;
> +
> +		}
> +		igt_assert_eq(munmap(integers_bo.ptr, integers_bo.size), 0);
> +		integers_bo.ptr = NULL;
Do munmap in last when test is completely executed. Chances are if 
munmapped and someone tries to access it that can lead to unwanted results.
> +
> +		result_bo.size = align_to_page_size(sizeof(int));
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +		/* batch_bo contains the commands the GPU will run. */
> +
> +		batch_bo.size = 4096;
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		/* r0 = integers_bo[0] */
> +		batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
> +		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
> +		tmp_addr = integers_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		for (int i = 1; i < ints_to_add; i++) {
> +			/* r1 = integers_bo[i] */
> +			batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
> +			batch_bo.ptr[pos++] = GPR_RX_ADDR(1);
> +			tmp_addr = integers_bo.addr + i * sizeof(uint32_t);
> +			batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +			batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +			/* r0 = r0 + r1 */
> +			batch_bo.ptr[pos++] = MI_MATH_R(3);
> +			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCA, ALU_RX(0));
> +			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCB, ALU_RX(1));
> +			batch_bo.ptr[pos++] = ALU_ADD;
> +			batch_bo.ptr[pos++] = ALU_STORE(ALU_RX(0), ALU_ACCU);
> +		}
> +		/* result_bo[0] = r0 */
> +		batch_bo.ptr[pos++] = MI_STORE_REG_MEM;
> +		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
> +		tmp_addr = result_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +		batch_bo.ptr[pos++] = MI_BB_END;
> +		while (pos % 4 != 0)
> +			batch_bo.ptr[pos++] = MI_NOOP;
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		vm_bind_gem_bo(fd, &ctx, integers_bo.handle, integers_bo.addr, integers_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, result_bo.handle, result_bo.addr, result_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, batch_bo.handle, batch_bo.addr, batch_bo.size);
> +
> +		/* Now we do the actual batch submission to the GPU. */
> +		batch_syncobj = syncobj_create(fd, 0);
> +
> +		igt_assert_eq(rc, 0);
> +		batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +			.extensions = 0,
> +			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.handle = batch_syncobj,
> +			.timeline_value = timeline_val,
> +		};
> +		if (n_vram_bufs) {
> +			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +				.extensions = 0,
> +				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags = 0, /* wait */
> +				.handle = vram_binds_syncobj,
> +				.timeline_value = 1,
> +			};
> +		}
> +		if (n_sram_bufs) {
> +			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +				.extensions = 0,
> +				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags = 0, /* wait */
> +				.handle = sram_binds_syncobj,
> +				.timeline_value = 1,
> +			};
> +		}
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = n_batch_syncs,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +		for (retries = 0; retries < max_retries; retries++) {
> +			rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> +			if (!(rc && errno == ENOMEM))
> +				break;
> +
> +			usleep(100 * retries);
> +			if (retries == 0)
> +				igt_warn("got ENOMEM\n");
> +		}
> +		if (retries == max_retries)
> +			igt_warn("gave up after %d retries\n", retries);
> +
> +		if (rc) {
> +			igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +			perror(__func__);
> +		}
> +		igt_assert_eq(rc, 0);
> +
> +		if (retries)
> +			igt_debug("!!!!!! succeeded after %d retries !!!!!!\n",
> +				  retries);
> +
> +		/* We need to wait for the GPU to finish. */
> +		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
> +						 &timeline_val, 1, INT64_MAX, 0, NULL));
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
> +		gpu_result = result_bo.ptr[0];
> +		igt_debug("gpu_result = %d\n", gpu_result);
> +		igt_debug("expected_result = %d\n", expected_result);

result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);

igt_assert_eq(result_bo.ptr[0], expected_result);

> +
> +		igt_assert_eq(gpu_result, expected_result);
> +		igt_assert_eq(munmap(result_bo.ptr, result_bo.size), 0);
munmap for batch_bo?
> +		result_bo.ptr = NULL;
> +
> +		gem_close(fd, batch_bo.handle);
> +		gem_close(fd, result_bo.handle);
> +		gem_close(fd, integers_bo.handle);
> +
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +	pthread_barrier_destroy(barrier);
> +	munmap(barrier, sizeof(pthread_barrier_t));
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -2849,6 +3282,11 @@ int igt_main()
>   		igt_assert(xe_visible_vram_size(fd, 0));
>   		test_oom(fd);
>   	}
> +	igt_subtest("oversubscribe-concurrent-bind")
> +	{
> +	    igt_require(xe_has_vram(fd));
> +	    test_vm_oversubscribe_concurrent_bind(fd);
> +	}
>   
>   	igt_fixture()
>   		drm_close_driver(fd);
