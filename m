Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864A3CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 03:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AD810E051;
	Wed, 24 Jun 2026 03:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDnicxIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6BF10E051
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 03:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782272406; x=1813808406;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ecxGU9B3tTw2J39pa1z9VK6TnFvbetINbnBa0NBatr4=;
 b=fDnicxIQgE+/cM32x3+Pvg4WBcBR7TMM0Z8SRTfd1dJpnSqAU7Qy0+uJ
 bfd6u0YgXGPYdYCkUBx7hVbrorGU9NaW89ru/e/8HunkUJiirP68NMS9U
 Mlmh/G6SHD2Zo0FpZiL6hfH+a2Ow9ZSEeCDknlKBTUJF8PlIRVFzC7NAk
 8IifNcYFmHJ/N30vusnOcpVLMMt+R+hQ8IQLN2Mw2hHkdjMsT/SflVgVH
 R0D+aVK2QAUYQzGgq9Bb0qTuYWgaaRII6I4wSo+12kkn06wldzJSLOMA4
 /B0vBT1wM2SS9ezx4faSpEaJJYr9DcX4/esXH+eZvSHnUO1PcTPwo0s9r w==;
X-CSE-ConnectionGUID: sgrPFOk3TRaQ8aOl4O4p0Q==
X-CSE-MsgGUID: e5NJDDpWR9CY0gyJsZ2sPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83064372"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="83064372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 20:40:06 -0700
X-CSE-ConnectionGUID: ho16yiASTBGtANDxgMQjoA==
X-CSE-MsgGUID: WtY1P8nnSEK5e2ryk25hOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="246779247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 20:40:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 20:40:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 20:40:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 20:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn6a2Q/z4xXuvegcDu61U6/JZaLoKTM0pIBfQA8ES2aIHxyMQ/Q6fQdrCFaJ0o93hNYJEvvZpYAOSwuHJbpGIKQPy5WKxHMMIyoP5FdWHXDHcosZ4zvRb1+Qqot2bXtAvauKlb0q1iEO5QAKWZ+he0y4bME1Gjb1PU5VaLpWTreE8xs0UWpK4FSApoMZAo7iBLDcqlnzUpRnT5j0JV8EhiioW0saZ0zt/c6jVvMv8U9+30vR5bbL76FgNu8HiqfZp78j2zdo9ptdotnGOyTna8EoeTiVbXx2nBMSXaIxnECYizewK8k9P++8ibfGnBGsDTeH4HkwWHBQXz49gmn8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91zGZXFIUweUNiYgDWKN2Wn/fMHAsJUixu2+hWqUHJY=;
 b=q7dJNTiFY9BpBIkhFAG8EF8+rh7AN3rzs+Zapf6f/jqUxr4umZWMVAL/yZnqS3eHLyK0ugyA7O+LmE5GXTfPNVpEKNYg5CvDmgCI3rhTHgIINpXLCYncQEh/T4LYG3JcrOfbr5g+GR4g+HO7SCw7EvH9niSj/CXgZ9/Pd1sP4tVcKac4RWe79V/4tvjDRyPMb/1weY+IsJqutP1LOqCwGPg90KgJjlhqBFTsklhXWtYasOp6M7Pw1bdDJsgAXL6zYSUyqJockWHYdxIlpg1ur9JEjkFEliwWVSQ7/66x7ozRovE1JcGaBG8cSBF6XwtIX+eYvFwMgMuM1DPtKivyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 03:40:02 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 03:40:02 +0000
Message-ID: <0f903eb2-942d-4fb8-8f08-108157a9aec0@intel.com>
Date: Wed, 24 Jun 2026 09:09:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic_transition: Fix retry-path
 resources in modeset tests
To: <igt-dev@lists.freedesktop.org>
References: <20260623184233.3015156-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260623184233.3015156-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1b88d8-4260-4a91-b57b-08ded1a2458c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: buFf/2oYJzDkQjrZln5bwJFrHymfXlQSWcqGlDjHzz49xbmiYXN+tdSGZN797+weh1A5qf69YiP0HNfcly1RUdMBYMYYLajJFpPCIL/e/PO5y8kYUCEyEb58s8uaUrRAPOkPCKbnOqeq20cMJFhn1fHd71pXUM2ItD/vc22T+9mroES7zwW3Wx1GsOsIMpEwIIjFoVd5zbP/JPeGeZWLajee0DhN0wFPCc1WCjMxGfamNN68xkC85rN2VGwWfHdK/z1tNjlAe7CgaFm9NAJFyr1gFfepKStz+03G7h0mLScqkZxj5oBmD5hgxdyu7cCBInd6u4FuizsXcAtRLlYlgpopPA3hwQAzOA/xU7BSWZXeccx4QFzcHXL9f67i9tqFzmpllq7qHJ31ZI0UxtLt2SroKxLZ5bdWsgQw+HYZfQVllg4t3K9efGuk3tRfZBSthZMjE4DHyYDSnHmkdLKmt0cDA6FPss+9Rmu/BBU5f2Qocumi+ks+eLkEIU3Uzv/K1AExOMVEp/r4hG/0wIek6YPimJU7S0eaLkpRh5AylhRpzA6DgRIsXHFkCIIhZqiWVIv0plZ+gsEptXHUez9THxu4oWw2oIuA+67DYcX+l8feJD9ilqTaWUC0etwSK1rDpUXNGAnVTchfqQSIrgWHIkdseNlJynsYt4MAYV8dfEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hXR1pzNzVRTFlCeGI4dEUwK2VtSmRVNWQ1MW0yMjd3UnBxaGk3VDIyZkc5?=
 =?utf-8?B?VkdoNS9oYU1IcTZCUWFVVnExNDZCc0REQmlaODU3VjVSYnc5NHgrQWVGYW5j?=
 =?utf-8?B?a0h4T3RRWVZtWGh3c1NrZk1PcmNKK2xZS254QzV1SWd2STBKNVQrbzZqNXlj?=
 =?utf-8?B?Wm9rV2p6bGl0c2RkbjZMYkRaalprcDVXTW9oL3JsZmpBM0hBR2l0UWdkZVYx?=
 =?utf-8?B?KythM29sbHoyOTVqbVFlcmJlQWdpL2R3K0NhMzJ3WDdIRjJBclNoNWVYMVd5?=
 =?utf-8?B?bVZ2enVqL0tsL01JM1lDNHM5SUtrUFZqSnlrUXdoRnF2WXpQZE5PZGczdDZp?=
 =?utf-8?B?SWpUdkxHWkhZbW9DeDRmZ3NNNTZuRnJBZWQvQ2RGdWhKemhVcDFla1pFY3A5?=
 =?utf-8?B?cUp1bytxdTdkZ3R2ZzhxanZxMXd2VFZUMjFSdzR4V01EVk1vV24wcGdoa1k4?=
 =?utf-8?B?YytOTXNOWHBQeUgxdWdYR1Z3Si9zU0ExQmxkQUV0ODJ6cnQwc1NCWkRRSTlm?=
 =?utf-8?B?UkNWdG5QM3VMRjMwMXNJcmU1T09ES1lSaWRpcFdBZHltYkJVOGlWVHZYQVBC?=
 =?utf-8?B?cUt5dVNPdEpPYU8wVEdzQTZRanBQZGM3cURiKzhPRjJ4dk5NV3NYYVI4c2dK?=
 =?utf-8?B?V01yU2M5TDBITlpLQ3lTZXoxdDRqVUU5K05yYjdqOW9KNk9HWmIvZ1JQYmsr?=
 =?utf-8?B?S3ZTanR6ajZXQThud0JiSFlxeHI1a3g4a1c0NzlPSWcvZm45WUFIUmhUcWZE?=
 =?utf-8?B?YTAzMTl0NzVmcDVhM1AxWXNDNGNFUVJUSzB4bnNrZHYyOVJEWGx6VTlXU1p3?=
 =?utf-8?B?NjNiN2J1cHZCQXlxdjM0K0dIWFg4VU9xNlVHeDROLzBMeGh4WG1KVkU0ZWt3?=
 =?utf-8?B?c3A2cXpGUWh0UVdnbmZTdE4wKzlIWU5rZnZjNXhrUmZOb2J1dFpxRDdDNmo3?=
 =?utf-8?B?Q2tCYkRlVkpKc3V1UWs1Nko0R2lNa0g0QUNMRnFPUjN3aitLU0ZRdTBnbXlH?=
 =?utf-8?B?cExnbUZlem5ITWJqUEhMOEREcTN5b2pCZVlYcTZXMXB2d1ljWm9ZMnd1by8v?=
 =?utf-8?B?cEcwakFnSUFiVGVFZjNPNWxEelRpZkNBT2sxeVY0aEtXTjR1azgybkpzbWJm?=
 =?utf-8?B?ckxSM1FiYkZVTWg2NEY3cEFOcmg5Nm5zODVNRG5JVUFLdUlUamlKaWsxTVpC?=
 =?utf-8?B?QUc3UjFEWVNZbVBUMGVLTGhlZE5iTTFFQ3MycjZaMUpxSXFVOWlnTXUzUGlx?=
 =?utf-8?B?SXQ5Vnd4U0lpeERFTDVFeHZWOEtIeXpZdDY5Lzg2dVRGVC9rQTNZa3IyUVBI?=
 =?utf-8?B?d3VKZi9kSmNMN0dzWGwwcmIrdnBjd3l4S09XSXg5NFBYTGRkTDhQcEt0ZzZF?=
 =?utf-8?B?ODcxSTRZZnhGWlpWVkxoYnVLaTRScWMzdmhqRVdpenRPT1BRak1CTG8wOUNW?=
 =?utf-8?B?RXlEWmdYeW5Vc1JSOElJdWRNbEkrNkFLZW8vOFJseFFzWFpJUmY0ZzR5d2Zk?=
 =?utf-8?B?SWY0QkZhc3ZXWFZHNG00UjJpbG5IVDRqbTc0QkJxK0hrb3N1U2RwOEttWU1y?=
 =?utf-8?B?eS9LYkl5QTBocFhRc29nZzdUMlh2QWxYczBjekRGSVo4MHEwMUpjdzBobUxw?=
 =?utf-8?B?c09pbDZacW4zakZXa3M4SW1Wb2ptWlgrR2hNeURjSnppbERKL3drdTJmU1Mv?=
 =?utf-8?B?dkVVWDVUajZyOUN5bjNhNWd4UlpsSHYzV1ZrZDRqT3dUWTBWTVFEaXpBM0F0?=
 =?utf-8?B?Q0dPS3hiN0Zock5FSWJmcUxSZGpDNTVlTVNmSHk3cG1YZmYyMWo5UU5PaGxT?=
 =?utf-8?B?SXhVVTErbEFvdHZibng0ektnNUNHWms3cHBvYWJlMlN4dUxzSFg1VHRib2Iv?=
 =?utf-8?B?M1dXNUpOUjFyVGhyc2dOb1I5WXBTd1JBQmJjU2RyWUhYbHFkbHo0OUJtM0Yz?=
 =?utf-8?B?cHRnck54WXBlVzYvUG1iVEF5QStrMGZvU3EvRU1VdGp0WVdmUFVrU3JOMHJr?=
 =?utf-8?B?MStpdEdlVzAwWG1nWm9wTkUxZ2ZUNk1FemxWc3dZNjNTL3F5WkZTenhZLzBU?=
 =?utf-8?B?RGtlOVlBMzBiNlRHZzVlQ1BranRNZ3hpTndFQ3pZUzBZSjl6NVpHU0dDZHp1?=
 =?utf-8?B?aW4yc29oS0hzS21aNFcwN20zT28rUXV6UmhkeFI3OHcrSHUxdEw1S3VORlAr?=
 =?utf-8?B?OWRUa21VL28zbTdGYnhWOWtURjd3RGlrdFRoSzhMU1ptVlkwRlRXQjN3eWh2?=
 =?utf-8?B?Ky9YNUt6VG5OWUdyS3NkWEdST1d6WTd4eUpQN3BpRjk1ZUg2Z3c5YjBKNmVD?=
 =?utf-8?B?NGRWWC9IZ1VRMHBtRmgyZ1lSblNZdmZpVE8rUUs3TGhCZ1hsMDhteEVLcE1q?=
 =?utf-8?Q?fH2MLzda+TkRoXBtGyMRz1e8O/2VCcrwg7E3K?=
X-Exchange-RoutingPolicyChecked: eEEf8DMBdI33t34ryQ6B2qROMo7QrNlTW3d8pzcl17xgLRU7Ugn8mzMaN+m5Z5R0tcngl4aOELq/I8bX59FvY9wKu2DSFJUOleuGpf8jAaQResjxHSI0UQviBot/s7AqXKg/d+k/3FZJrqGT0BocosmnvB6p7cYoQ65w+lNJnwuGEwyA8muwZaoxr9bjOl79uSCr1EqYKn1GfM5Gh7xebLtnsY9QME+NdrzpXoC9kdYyU4WxJqsc0RO4XiwAIcBQBETnY13DuzZLEjrKb6QuXtjf1KZyykxwrlotqiQ2xHondxStGfFczZUTpa5EXUZRgImGF4mwwIb1Hh+I37x9LA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1b88d8-4260-4a91-b57b-08ded1a2458c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 03:40:02.4701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5HiI9NAHCbcTX/7jnpIDLile53b/oexWoz2chFyXqx2ZYYEeU6jxoX+nbNMiV2Ijxq/Gncw/JQKUNVYA+BlQaPmlMHQeNL8eoq6TdlYJov6rPy4QgYthlpYykI1aH37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

Hi pranay,

On 24-06-2026 00:12, Pranay Samala wrote:
> When a bandwidth fallback retry happens, resources from
> previous attempt may not be released, leading to accumulation
> of allocated objects across retries.
> 
> Add cleanup before retry to ensure clean starting state by
> releasing resources and removing allocated framebuffers,
> preventing resource buildup.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 58cadc560..37dc77c28 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1026,6 +1026,16 @@ retry:
>   		bool found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
>   		igt_require_f(found, "No valid mode combo found.\n");
>   
> +		if (is_intel_device(data->drm_fd)) {
> +			for_each_crtc(&data->display, crtc) {
> +				igt_pipe_crc_free(data->pipe_crcs[crtc->crtc_index]);
> +				data->pipe_crcs[crtc->crtc_index] = NULL;
> +			}
> +		}
> +
> +		igt_remove_fb(data->drm_fd, &data->fbs[0]);
> +		igt_remove_fb(data->drm_fd, &data->fbs[1]);
> +

At the beginning of the retry label, the height and width are not reset, 
since the igt_override_all_active_output_modes_to_fit_bw() reduces 
modes, the newly created FBs may still use the old (larger) dimensions 
from the first attempt. Consider resetting to 0 and this is not related 
to this patch. could be a follow up.

Rest LGTM.
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>



>   		goto retry;
>   	}
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);

