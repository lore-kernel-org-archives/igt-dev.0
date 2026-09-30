Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30835C9830E
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 03:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE9E10F166;
	Wed, 30 Sep 2026 03:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fs4pCogi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F074E10F166
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 03:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790740155; x=1822276155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J+U75NHTPsQva1l/TSaTCKqg6Ex5Wn52E8CoVi+adUo=;
 b=Fs4pCoginDA+iW5TMyEneketdoAEp/KmrWDKnJX7r5JUH+3ywl/rC4mD
 PAAQFDjFL/rZJp4dVswyVe5NKyKrddxhWE/yEF1x8WGJV06XX8F4kyP/S
 f0vSnrLjbDitmuIyr5NUOQlv40b8aWxMVvEP4hcHeLg4COWMvUw2seoRC
 77HdzS2oZNsnk0IKvQxCI1VstWf+DzOi/x1geaQhZUEstcooQTQfkZVKn
 P3wX+rLZEHtr5ysvFRMhzsS1Xuq9HAHzXdAzI80dd4e76eAL/j4B3AYUY
 K+UvvFM61ko8x5r87obWmYzfVX03xaH1HQjCWUMvc+Z0yv1O8fofIPJIh Q==;
X-CSE-ConnectionGUID: axwKw47sT+659DBO73CNMQ==
X-CSE-MsgGUID: lCpjuUqUQW+0Zt9dSdp6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113254436"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="113254436"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 20:49:14 -0700
X-CSE-ConnectionGUID: 5r2GIa56RIGI2yWi9BS/9A==
X-CSE-MsgGUID: Qr8rNs7RSFSaCLTZO0j4ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275711319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 20:49:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 20:49:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 20:49:13 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 20:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMYCOWtMq4q8oLawg7hspYdUw6iZrcO0F4Jlx5GRz0CfMIE+7xksMWPxqNzSMOQkAHfstYZOOTanlOMTkSUKR7iZwg41bsI7oO+XJNriFJ4hjHBybfFi7s/0zQ2H/x3Nit4FBS+iMU2eq/cPEj40kBr45/jUm4Wz4IdqwuajYyhiZTBqgFQB+7BldOnYS0aVJ5YEdeSx/l1jlRH+R3OaGpzI+ZRpf1+560HdLb2S+7DHuTRQh6pOczAbC0hJmYS2uEw8pwaGxibvL3GZ+lS8IUXcsbPq/o9Y1q+OSdTjsBz/ZAGWbWlNxWFCpxGrM8rmyFwvom60HUt6LS086XKHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO91u0D+xOkT4CK+znq9qJk1VejtlB6iSq9noxAUD5A=;
 b=s7SrjKxHTt1I5VTHyo8q8StHbi2zOqh/wj074uOaBg7/hm0SFOWsGDVLxIRK/JClLNWfXNcgI8OCh1dx/JdPLAwepFnmzJrJ0C7XaN240knREi/C0+N9HFhDGgOMZv+x3POrav+IVF0Ih9nL6bVXAV3o9JCp9uxvVgEXG4cL/FU5XJE/eIZySKtC3fQTOuZG7z2643H1Dp8xmhNFcTEWxEAxhYyn9JK/IsikBxuqObG+qtFl0qoUreu5vNBx6MZGm4puFFxh5+fz7leb5nAkJecrMKfiuRcoLj9SLsiWEskkkS5ZVp3UzsHeIzBixSOSFhmrK0ohqxAFTmhig6CYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 03:49:06 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 03:49:05 +0000
Message-ID: <94ab51b5-d08a-46cc-807a-5a9f1cf281e4@intel.com>
Date: Wed, 30 Sep 2026 09:19:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Drop blanket skip when system
 memory < VRAM
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>, <thomas.hellstrom@intel.com>
References: <20260929173928.3098760-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260929173928.3098760-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::16) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 00612465-f7f9-4633-8081-08df1ea5c631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uOtGHzrDOC52YR+uKwLJU8b17jxtiNvLU+JGSQaieDxCO0hZrOlA4MQf7zf7+yiVDAPGXa3xrDKN+1KGxXH1xAt9nQH/8ZT3dyub1stQD+lfxKoAPk8KnkTZfuZidupHD/Byfkb/jtdGihFnlzCFyVjhn0oan1wUprlleP4izxxnzkk+1Djt5+I//IObbLV+CA0ChoBHorwtCviYKbZ4r45P/+9AENCpDm7tk+7o0wsnY1vz7gg6jqw0baE/FYO8aND87yZy2Mi8hSFbChwYkEOiZ8T+uJ6YUG+Da0NAs7Q+osAQgu4+32Lv7LMPZr6B53/29DL6Hm68AoCc6WvDIUxYlH0NuLlR0CYpeq9GmoaZeJf1shL1GLvDYizFii0pQNLJkzIrbnxVIjR3B5JmQ1MQZmjDz7D0GRCK31BGw2q9l71zbHrjiDa2icu4m04+XEuBvlGLMYTQJPvZfLkLmVusVsUsWVN3m2F2XdEATnIKx+WPwX64EYL1vLWlVe6TqQ+4zyDblITqReeWMXSNUo07a5dhvPTEx/rT4EQEbAKzhNglhLWNlPfDIkdr/AQZw8647FDmjjeI3dd4eY37Woxupb5sspjtZuwY9aooZMVs6/nnGHK8gavobG1zkTWeh4jF9pexkoY21DEQDV1KfGHdsdn0ooNBWnOKBa8wINw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFlSTTlQY243NWk3aHNndVlPVmcyZXlmenpqMDBZTEFSczM4Rzl4NnhQMUx2?=
 =?utf-8?B?dlB0SjkweS8vMlpZZk1KM2ZsQ0kvaEtlSVBKWURpdFRiWEVHOGlJTmxKMEVK?=
 =?utf-8?B?V1g2U215M094d1hpaHNKMUtMWWZPSjRXTUV3SkFpVGx1alhQYjk1SGhkQ0Jh?=
 =?utf-8?B?VVJOcnYzTC91K0tONklVOFZOQmo1cFFDVVJzWnYwT3BYRC9tcGtDM2FxMk5K?=
 =?utf-8?B?TkliVzlWbFZwa0hvMXNMZktrczhseHhZa3NPS0dicEJrbUZzamxYOHUweXRp?=
 =?utf-8?B?WWxYbnB1YnNoZ1JGZmVOTG1FK3lBUGxacE0ydHdZSlk0b2J2WFlvRHRCcFZw?=
 =?utf-8?B?emwzNXE1M1FGblZZckNWQlozbFdqNGhVWTRLdlVxcXRWdkpZaWdmU2IzWEl1?=
 =?utf-8?B?YmJjSVY5OHJtV1NrSlpkeVVWZFpYL2NwT0p5aGk0QkNBL2czS1dVa0RNdnE4?=
 =?utf-8?B?WVZiOTNJRDFQd0YzZFpzcUhTdThsbi9OWDVCNWVWTmRRNll0MVplUWNiZnZK?=
 =?utf-8?B?NHk3M0VPbVFac1JzNUV1QS9HbUw1YnZiUzN2WXFKbk1Xd1RIVG1BUW5FZDJV?=
 =?utf-8?B?TlIxcVkxTDBBbytSc1pvWHk4SW9ab1ZiREsyS045UEZWbVNtVGNTWUxvV1hV?=
 =?utf-8?B?UG1mekVGNHpiRVdXUWpFSVpiVm4xYzhrOGZucWJKc3dCTXAyMmMxY0NpMTlW?=
 =?utf-8?B?cTZtNFRlMWlLc1E3dlNiWTV5QTZ0N3hPTTl1dktPSXZvdkJReWJ0Qzg1Ukpm?=
 =?utf-8?B?dktQRGFLQUdCbmZBbVhhM3FMY1JmbjYrU2ZuMmQ1MlRCTk9NeStHVzRNWnBo?=
 =?utf-8?B?czBlTGpsKzNINjBvWURjRmFsbHdhYjFtVlVGLzBLVEdFL1lTRVNzSHlHNlE1?=
 =?utf-8?B?VlJ6Zlhaby9MZytWY3JnVGFTc29Zd04yZzlXd0YzZjUyRkdHUUZRR2dkdlcw?=
 =?utf-8?B?bzdwekpHcDRFd04wR0h1Q2pCc2IxeFkvSmJOcG90dUcxQjltQTJzT3NyK2Mx?=
 =?utf-8?B?U1ptaTRmMFBsZktYdG1ZeUZiN1F6SmpXSlFoSlBzWktTczdQeUsyTDhwSWZ4?=
 =?utf-8?B?dGI0RjJNQStjRWQybGx1ZmVpTFU5akw0WEY5TDJTbkZvbWlnZS9sQjdINmJx?=
 =?utf-8?B?Y0ZqNU9mL0dwRW9PQTJ4dEFGWVpIck5JZzdUd3BENm1oMjFBYTg1TklBNk1v?=
 =?utf-8?B?ZXptMXd5bzFZME1FckJUWm44eDQyY0pmMWcrRjJJV3RHK0dVcEs0dGtLTjFL?=
 =?utf-8?B?ajMvdXk2QW9ncUZ3VCtWZW5HbEdNbUwxcHBKbGJ6Y3JTSk9kRGpSeXYyN01U?=
 =?utf-8?B?N1Vjc0tLZGkzQXptMy9FRVlvejF6ZnA5SGwyUTFZc28vMzFObWdNamNwbnFV?=
 =?utf-8?B?UG9IV0VYM1A1V3NyQkdZNnFjSWFXRnFvcWJnaWh5dmU1NDhRSWdkWXZoUkxt?=
 =?utf-8?B?d2RORXpnVDhCUlk0OHpsTCtrdFBVWWxYTjRwUlVCOUFQc3hvZzF1T2dVZGxK?=
 =?utf-8?B?YTUvaktoZkVpTFFqUFRpai9nM1pyMEk1QjQ0Y0NCdGhsSC9vZGM4clk5TXU1?=
 =?utf-8?B?clRQYmkwOEw4R08vbU8vdGl0bTRyVzNGT1dBQU9VTVBGYlNhMktTMjJ3dVpE?=
 =?utf-8?B?WHIwZWJmK3grbk51SjRnOEFQRDJVZW9RdU1xZWYyU281TEx4RHIrQk04Qyth?=
 =?utf-8?B?MDVyNXhYZG1wYm4rUDF2SUVSdDBjR3VFNEFRU2FPYXBma2JVR01rU2dCSXln?=
 =?utf-8?B?TWVhK3ZUemhvZDNzeTNzcTFQalNpWWJGZ3VKNi9KTGtHUEpvN0hPOWp1UFV2?=
 =?utf-8?B?ZWsyNzhFVkhkQXFOY0FDZnNDMGlrUlNQbFZKS3BiSWJqcUNYSnhZNHhsQW0v?=
 =?utf-8?B?V3FQOXdyNjRxZ1dMc2JJeVVSdGpmYWl1aXdXQzZDZ0I0clJJTEh5TEsxcEZX?=
 =?utf-8?B?MjJzQW5UVUJ6MlNDMGgrTld5U3cyT3ZOTDJKLzRYM0piWjMyR2F0bkNTM1FW?=
 =?utf-8?B?am5HOGtHczh2RnlVNGhKbXNiVnpqS0liOVhTZHd1Qk9aTHQ2ZHNaZ1BFR1Uw?=
 =?utf-8?B?SVhuRnJVVVg2c3MxYXExdFVuUk1VVjNJMUVJdElpaGRVYzlkL0pYVVhNMnhI?=
 =?utf-8?B?U3NVUFNNZHBoNVRBelFqT3IwYm9PaGlLMXhYdGZid2FIM0hwdmsxdUVwYThR?=
 =?utf-8?B?cHQvaTdoNlpxbmRTdmsvNmxnOTloeWxzcnlwZDVzMDg4dVRQS012Y1BhQjk5?=
 =?utf-8?B?UGxCcDJiWDBuNmlzZHJFQkdRbUJta3hVRjJQRTlrZ3YxdGdjeWlleWN3czU0?=
 =?utf-8?B?VGI4eDFqam5PdjVVdjVGeGs4N0EvZGxuNWk3VHVwTzE0MmdYa05pdz09?=
X-Exchange-RoutingPolicyChecked: 0U8rQbq3hqIeWpTDtnBmj08lfrsf1T/GWIUFLvz7rNaPuVf2XlM9c/badsC6kt+Iqz1KxUPze8x3m7Cp8YFzty8W8wvBPyGNXY6mwym/my4ctBYZPy1UvFMoEXq5ph1bF+rOpMIN9XA3reDv+/x1FCQLS1bpceMrUeNAgL20znVKBo8EXPCVr9k7Qu4GBH1EagnWs7cO49J7/WLcfjDVfni0BKazFnmaCr8755Up9QFT0jKAGcT6HkEkqXPzcJR05ovUY6DDVSThAzHsF/pH2BRcKbG/G5SmBVoGr/DKM92SmiJQYurr82/5pvabbkqciK9NijJKbPSbfkR2MHtG1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00612465-f7f9-4633-8081-08df1ea5c631
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:49:05.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTYcSbzUDBqZ34xauwikwQll6zLBm0H+mp+76enKxWSmrbhY6nD3tXuKNsV0pvUM2Om5KB4bEzVjrEU8b5rG0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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

Hi Varun

On 9/29/2026 11:09 PM, Varun Gupta wrote:
> Since working_set() already clamps each subtest's allocation to what
> fits in VRAM plus 4/5 of available system memory, and every subtest
> loop has its own igt_skip_on_f(!ws) for cases that end up too small
> to run. The fixture-level skip is therefore redundant and skips the
> entire eviction suite.
> Remove the skip and rely on the per-subtest working_set() sizing.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_evict.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 5a7298db0..230357419 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -911,15 +911,6 @@ int igt_main()
>   		igt_assert(vram_size);
>   		system_size = igt_get_avail_ram_mb() << 20;
>   
> -		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
> -		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
> -		 * simplicity ensure the SRAM size >= VRAM before running this test.
> -		 */
> -		igt_skip_on_f(system_size < vram_size,
> -			      "System memory %llu MiB is less than local memory %llu MiB\n",
> -			      (unsigned long long)system_size >> 20,
> -			      (unsigned long long)vram_size >> 20);
> -

Can we put some message here why skip was removed, Something like:

No System vs VRAM size check needed as working_set() below limits each 
subtest to what fits in VRAM/SRAM

and a subtest skips on its own when nothing fits i.e. igt_skip(!ws, ...)

>   		xe_for_each_engine(fd, hwe)
>   			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
>   				break;

Rest LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

