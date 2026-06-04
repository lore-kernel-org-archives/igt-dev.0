Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E360CD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 05:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BF8112647;
	Thu,  4 Jun 2026 05:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgNEITiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B971112646
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 05:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780550857; x=1812086857;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZUdtHQj8o+Q6t8YeO+XOET3yJ8KMbRLVHGchg2X0t5A=;
 b=MgNEITivca3Cg5Witb3bP54M/pzsshz3dwoJTs010G2cCwoho7XgC32/
 Ser4tQTWS4nrbU5qY24On1/z+CTx98/O8bH+K6tI8mUjsUdyYCf8VM4DA
 zxjD3iBpiLWRAVBYLf3tyX2ZMly2PirDsfpwW9riu5X7XJGxYXHAGLDXY
 06yXwNfCZq6VL9OHWK+csz0VaBXcU/cS2LZkKy9+trSMXDC8T49Oz9XEe
 rAT60wuWK0P72Nm8y6CqK3ldFl+5kfA28UZFHLlnxddlAuxceGtbD7DQN
 WlDQepahaV2/O8d+9t4sAqqQwkgQ9hJR1fn4Yf5Ty28d0r/63p/OPqo8y Q==;
X-CSE-ConnectionGUID: c9GZIlh7S+GwKyoKmFIJIA==
X-CSE-MsgGUID: WgcwIE/iT8yecWQZ3p3iZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="83947355"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="83947355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:27:37 -0700
X-CSE-ConnectionGUID: 2a1S7k4RR9O44cwzuxCuug==
X-CSE-MsgGUID: 0Kz6o8FGSn2hRmJRgdDv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249365581"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:27:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:27:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:27:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KppdZdW8xif9s01BDZBe/CmuFvWO6UwoUv5hJ0KSxkgLseGhilvJb3cO2K8tUxJfrTezcdD9dbUWZXfl64Ng5s5hsxZ88QfdRSBuhgmNYRQoMRrNkImB36UYB+Q2pbKCG7neTuqyPtM5eXoGtVbSJnB9LyDBxqNV2E+c2fRrA+HLmcfuTowepxwC5fKxKaB/Ty/sqorKnqrQALP0Cu0nZ3EP352uW3R/IdIXQ3Fqj09lQ0YukS1Wtu5pI+G/6AZ2/v3IHSx3wq6l98AOXYWTmY6WwDeOHAvKbllQYo3yS491qpDOlpKFanoIbNLqEqJhMJWQDmm+i9U6bVieeoxLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eVE7OQXz9AQr2LtrwekfKRRUTzhVHnzP2UAaDIJhg8=;
 b=yZO2k5CsJ7lQJ9+GcxSLunf1bmJiBA9bIS2N2FI5bMc5wUJopTpVduaXAGNfY3s8KspDtp9Z5jmJU7+moMzYhj9TCpRNphuzZr14QnX67FB71v0LmOrD5VXpWddY+gUCE9awKjHOanWZxUWSnmH3bJE1GiQDNKcltXl3+nWSpZU14vMU8k9JG87X8Z6hAIhyiTzGRUoJTUROTKfqEGjaqd1d5Elf8sW2ABNOFPHQqim6h/QpCLpFFfl+DiFMD/m3rGdmS2YMF8JwffYo66YrSi8/ZMMcmOwFv2UeXqmpGUyjQOQeEEe/lk6laVhMPQXvq9c4MHBuiQx3IoOBP/Nugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 05:27:27 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:27:27 +0000
Message-ID: <d9cf9efc-81fc-47c8-a533-da18c4d02d4c@intel.com>
Date: Thu, 4 Jun 2026 10:57:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v7 4/5] tests/intel/kms_dsc_helper: Add helper func()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260530193640.2551688-1-swati2.sharma@intel.com>
 <20260530193640.2551688-5-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260530193640.2551688-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: dac20593-3a8b-4dd7-5c58-08dec1f9f753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|3023799007|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9kgseoVmWDCjaAiJd1ZkM51bWI3Mcef3BY7nWApm8LjMm0LV6BUR4K2rHq0gZVP3FqUwq0S0EDDiEDYCHwutAkqXLNegqhFANgrX23zfPBkJIrLoGI0Vw5qNS1zH1JePQbIz20LZQ5Z4kfxjwjObeXcN0yY9RS3wU7H/A43CfcO50pGE8DeYrhhQKKYUDttBHjzvRsN/xvnef04vn/qvj3mBdLW5zvKJDRcLqFesishlw+RF4gzMc2uuEoOoMNew7QTHL3oDMGUBgb0M2dPOqAmHsiZmWp46DfJ91XVXoLqUQLBhCY1m32rP79e5nVMnn8baYnotUhoGC0NJLMUqBP/1jNQipZWy9PuGVPWgDc1w2RUZMkrJZXML78mWU0KpCGcoaJOKDzuR+S2N/H74lc7d4hmTe+q/VF+w3Q/G0w+p1VmtE5EfpFMypsQ/tPPgh42VT7IuemNfumTtAhxHQ83Gd8qKeZGKGHgo+u53xsJWyCIWz5K1bxq2ldWmDm5CSgltHzUzMr+mBNL4jFQN1IcsGgPDzS3seEB4p6z8M2a2iEZR5lArdNdiKyjrtMk+JMPUvA3AMYzgg/DRixfJIACJsNeD3UzwRUejAJOg4WiwWaM717kggGclD0lRXS3+8C1S1YEjRaN/NgGjp31dCVHgF1lzFHKvNGMWV7dXq8AvyzPh8zA8yixkuQUAOVHT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(3023799007)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENRNExmS0ZORVl2MFB5NGZaWURqNmVrV2IzcDJsVG1QcU9iU0orU0VGaVZ1?=
 =?utf-8?B?Q0FIWlBESHo4aStmZE1uL3VMaktlRnlMODRNV3pUbkswOHUvY3FPZ1JiY3FJ?=
 =?utf-8?B?aTRQeENyVE1VQnpJVENncnd0eS9MeEZmQzdBc21MSFF4eGRUYlNNM3BIQ3li?=
 =?utf-8?B?MFRpVG9jVWdSZkwyaDNsUVRQSEZMVzJSeXN4UU1KalF1cEt2MzFKcG1jZzh0?=
 =?utf-8?B?aUdzQVJPUU1TRHBxWUlBbU1iNW9Ma1czY1FSLzFTYzdTV3NmcUN1VW5hNHFK?=
 =?utf-8?B?L042eUxJaTYwaXNjZGxnQXVQa0tvVkZUZEV1NlMwU2I0dklLWHQybytwdVhV?=
 =?utf-8?B?UE8rVTNackVOQ2hac2d3U2hJN3J0b1lvcXIreHpudTJtM2NPblNnSGRwMmV6?=
 =?utf-8?B?bm1JQXZVZ0ZSU3hMOERHM0FSdUovOEhZTWE0NzIzUzdpdHVLU2RxL1Q2Y0ZR?=
 =?utf-8?B?YmJRWnJWUm9Wd25yWXZPWVZmejg3Z2M0S1NSWG5zRkRURzVDeHBRc0pZUGEv?=
 =?utf-8?B?aGRNcnBFdlhZeVlRc3RCNGNYVWNoNUs3QTZBWEVwcWtYNlZoM2F3b21DNmlt?=
 =?utf-8?B?MThJbEdvSnlGQ2QyMlBkbE9lNmN3dGhmc3hUdkxWRkc1b3hQT0IrWk1UVTdS?=
 =?utf-8?B?M01Cb0pHemdPV2NrMjVPNC9uL0VWZW1SSy84WVJQRSs3eG5lUmFXQWFhK210?=
 =?utf-8?B?S2M3bDBHUWxNS0p5UXZGL2I5eklmc0dLbUFkVlhZbkZhL1cwc3dFbXp6aUUx?=
 =?utf-8?B?MGE2RG1TbG9pclRJWmdib0J4YWxTT2JQemFySjlyajVjaTVkeitxZlpXYkRj?=
 =?utf-8?B?d3BEd3FDWFdmZkt0dVZsRktueWl0TEM3QWlWM2tWTTNoSml4blo0Sk0ybnkv?=
 =?utf-8?B?K1RUR1BHK25JRlk4eTg1emNoZU1sdHJpTFQ2TktQYWhZWmZXZnhhZjc5TEMy?=
 =?utf-8?B?SkoyTjhOY0grVUpkelpHSklNSGZVL2JMZVpXNnhkRW82djhTZ3gvTTdXYlEw?=
 =?utf-8?B?a0ZkWnVkb1RoR1JTdnE0T0pCeTd1eHVmeGJRUU0xZlVvWlBMUUhSUTdLbGtC?=
 =?utf-8?B?VC9wZmV4ZE1qMytVUkpkQ3FzRy9yQjFtL3ZyaTlwVDJnTVRjaFlhN3BRR0Ew?=
 =?utf-8?B?Y0habFU2UmNIdC9hWExrbzNtbnY1Z3gvNzdHZ2Nhd1hTa1JHa1I5RnVGTjNR?=
 =?utf-8?B?bXhvRFRUSmxjRzROL1NuaWxkSkNBQS91Y21UZVlpMkxQbkZORXNIMFBJamk3?=
 =?utf-8?B?ZDVndUlFQi82RFJpMElrckNRZEF4RG5XZ05Ec1cvWlRRMndNc25BbGpVODhh?=
 =?utf-8?B?Tmt6OWo4NXJmRE14aGQ0UWczOENCM1lDQ052NEQwSE8vSzM3ZlZzTTZybmJ5?=
 =?utf-8?B?Yy9jRk5ES2NrVFJYcWRhUU14WnBhQTVrN1I2S1RRajIwMFpWZVN1b1JhSDhC?=
 =?utf-8?B?bVM5MVdQVFZFMUwraHBVdjdQRVF1ODJpRStFdSswTFV3YmlocnVXWkNwdEwz?=
 =?utf-8?B?clVNT3kzRmRXcCtSYXdQUjdUVU8yYnVnUXpFcS9sYnpHcmRsL2tVMGNraW5i?=
 =?utf-8?B?NkJzcUFTWHd3aHEzb1kvRWV6UnVVWmZ1MXlrcFNjdnhiYngvSFZIMWVjeThv?=
 =?utf-8?B?R1JHTkZMOHc1Q29uOFNlRTgrbkU1aHZKcm4xcHd3VU5RMVh4NXVHb051SjJC?=
 =?utf-8?B?Q0l1NmluTm9QSGJzSGFrQnpYR3JjOVRRREx5UXMvM2RBK1BzS2tJUFJFMXR5?=
 =?utf-8?B?M2x4QStCcDdVNzVrYkFwTUV1TjZoL2ZZTzZDRHVvQkxIVE5xeTZ4bnhsZkJ2?=
 =?utf-8?B?R0h4NkZHSDEreURPRW54MHczUlAvWDV0UWFpaXB6VmR0U2RVQ1dTZkp4Mkxp?=
 =?utf-8?B?WlNMemNpLzdIZHZycndqRUtoZEJBbFNzVWlsQzJoN0N3ZWF3cFFZdHJTMTNy?=
 =?utf-8?B?OHpNQWZQOXhvYzFKVVprOUVaa2pLekh1dXRMZS9aUERlZnVZUURoNElBTUky?=
 =?utf-8?B?S21oamtZNUhFUDVOYzRZSWlVMThaUi8xdGR3VFIxWWpZWDVlV1h6bDNqMDY1?=
 =?utf-8?B?Sm1PR3lDdlc4ajN0ZGtZNXU0RmJIWVlNWCtxUW9VNlJGeXFpZHZGeUVCUS9K?=
 =?utf-8?B?OWFYMndiRE95SVdYQXhvWTZLb0QvTUc2L2pOOEIvb2ZvVlVLQVNCYWNwblZ1?=
 =?utf-8?B?Ymcyb3JSMzA1Szk4Si93MVpvWkRMSjl5TmMyck9DcmxIWUhkd2ZndWZhRWpo?=
 =?utf-8?B?blNEY2ZmVG42YWszVjVxQ2RWenFpVm90L2xqRnNCSDJuVUdJYm1zcFZBVktm?=
 =?utf-8?B?bk9wWGFMbUhkOUxqeXEzYktNYnIzcXpqM0dBZEhsTTl3enJ5Vm1JZz09?=
X-Exchange-RoutingPolicyChecked: kfzOZ/IskFxzjPNv2rxc1ZqMr2cmP3dHzJoevMfLdFNxeteo5ULkEADmzyRbVKWeS/6S/yAi2wtOto0eNEWSNI4M3MwlEw3d1qZ5aXa6f8PsCg9N49qDcID7UklWRnrnJNEHpFBDIDJlXNg+csYLwn1FSpfn2lNPUc6fEaVEEfuzj62EDQeviMSAdJcASuuZzmdC7LKjmhtO6mXw7CkmzdMG5+O5wfmzrUKA9dT15jjkFMgFCwNmMOPUjQ9728OuQtPcozX2g0HMNhJRmsibM3afioh1PxBNlM1zhtEYL2beKWtIYHdWf3YyhPwSM/sghdqR7kgD5HHCfb9Mgg644A==
X-MS-Exchange-CrossTenant-Network-Message-Id: dac20593-3a8b-4dd7-5c58-08dec1f9f753
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:27:27.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qtk0kbt/mN+3U/XatVWRCDVlXsBlQBJ0Uquy8yijcYFEoT1FyIV8pDYI3lqcWx7Q7s7+m3tgLDyOCjlKozKvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

Hi Swati,

On 5/31/2026 1:06 AM, Swati Sharma wrote:
> Introduce check_dsc_joiner_constraints() to validate minimum pipe
> count, consecutive HW pipe availability, DSC slice requirements, and
> joiner support for DSC joiner scenarios.
>
> Update meson.build to link kms_joiner_helper.c into DSC-related
> tests so the new helper can call igt_is_joiner_supported_by_source().
>
> v2: -Avoid hardcoding min_pipes/min_slices, use enum values (Santhosh)
> v3: -Handle JOINED_PIPES_NONE/DEFAULT explicitly, return true (Karthik)
>      -Fix indentation/style issues (Karthik)
> v4: -Move consecutive pipe check (igt_crtc_for_pipe) into helper
>       rather than having it in the test (Karthik)
>
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 67 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  5 +++
>   tests/meson.build            | 17 +++++----
>   3 files changed, 83 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 29b998c2f..7856e33ef 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -203,3 +203,70 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
Please add a description as to what constraints are being checked here?
> +bool check_dsc_joiner_constraints(int drm_fd,
> +				  igt_output_t *output,
> +				  igt_display_t *display,
> +				  enum pipe pipe,
> +				  int num_pipes,
> +				  enum joined_pipes type)
> +{
> +	int min_pipes = 0, min_slices = 0;
> +
> +	if (!igt_is_joiner_supported_by_source(drm_fd, type))
> +		return false;
> +
> +	/*
> +	 * For joiner, 2 slices per pipe is used
> +	 * i.e. min_slices = 2 * min_pipes
> +	 */
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		min_pipes = JOINED_PIPES_BIG_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		min_pipes = JOINED_PIPES_ULTRA_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_NONE:
> +	case JOINED_PIPES_DEFAULT:
> +		return true;
> +	default:
> +		igt_info("Unknown joiner type: %d\n", type);
> +		return false;
> +	}
> +
> +	if (num_pipes < min_pipes) {
> +		igt_info("%s requires minimum %d pipes\n",
> +			 igt_get_joined_pipes_name(type), min_pipes);
> +		return false;
> +	}
> +
> +	/* Verify consecutive HW pipes are available from this pipe */
> +	if (type == JOINED_PIPES_BIG_JOINER &&
> +	    !igt_crtc_for_pipe(display, pipe + 1))
> +		return false;
> +
> +	if (type == JOINED_PIPES_ULTRA_JOINER &&
> +	    (!igt_crtc_for_pipe(display, pipe + 1) ||
> +	     !igt_crtc_for_pipe(display, pipe + 2) ||
> +	     !igt_crtc_for_pipe(display, pipe + 3)))
> +		return false;
> +
> +	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
> +		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
> +			 igt_output_name(output), min_slices,
> +			 igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drm_fd, output->name)) {
> +		igt_info("Output %s doesn't support force_joiner debugfs for %s\n",
> +			 igt_output_name(output),
> +			 igt_get_joined_pipes_name(type));
> +		return false;

Is this check required inside the helper? Is the test fully blocked 
without force_joiner_debugfs?

Regards,
Karthik.B.S
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index ee419c849..542fe46de 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "kms_joiner_helper.h"
>   #include <errno.h>
>   #include <getopt.h>
>   #include <math.h>
> @@ -39,5 +40,9 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output,
> +				  igt_display_t *display, enum pipe pipe,
> +				  int num_pipes,
> +				  enum joined_pipes type);
>   
>   #endif
> diff --git a/tests/meson.build b/tests/meson.build
> index fe0818118..3255e9282 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -399,14 +399,19 @@ extra_sources = {
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_dsc': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers
