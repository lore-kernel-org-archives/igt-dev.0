Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D293DC54764
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 10:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618FB10E29D;
	Mon, 19 Feb 2024 10:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRPdvkcq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBBD10E29D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708336888; x=1739872888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=xyCZaSFG55b88BXs1xc8PF6Er6kDzeqbJ2DdJOIxrvc=;
 b=RRPdvkcqYsvGIDrWiFRQO6fUwqP2h5dqaOtlZwRWSHqDV+v4m1HAf0hG
 XNJi8n2SpQlf76s2/xetJuPvA5OQlN3W100XFZinPDyEiGdQWWCK3EtkS
 fFDV/lnkLaBlPN3XklT153SVomyLLm+GMdOgWaxPTNR7JQGTqd1uzy51+
 B7ccIdoyfVaAwLfbFM4q0Pmbt/SJtBrA8Dh9pAX5zSQiMzV+9JGiaZoGQ
 U/cDMLi1yNg9oWOEjjqW1tbdAN/gt+VmfYWq8Cdej8KACBq+p3+566fbc
 iwMALIX7Pj/OuUg88vws62vO+Km+eeEjwTXEkrRzXcJiML4QXEVl9y8RQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="12956630"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208,217";a="12956630"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208,217";a="4739790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 02:01:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 02:01:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 02:01:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 02:01:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDR3N10ZuGLuLeXCKBkc2pxgCXAlC1o+Hq3bkFHvd2+/WgzPHPdU4h9fk7W10r4J5LQ0hXCy68pODduBe+189js+f1PFWEdpFtY3jmMbHZWpKW83TVfX81hAqozFBDRdscv+HCfGjSyJhsULCP6HH3jNfrOmCHHKdpGjQAuAzjpm2wISpsdF2WyqWHfCWDlwoWlNa2fefVkluHt4sK6ZG8MVbLh2Bvn0Hgcju8Ma2b6qFh06e2GZlj1ZAuSPxFAq1R4IUvSuyUh2qh8IeRRlZbNCPIrST5Q8G9iJQkzvWD40enpVF4WxzzvVChjH170n4BFwpDERV6zaoGzmha8jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAa+906Wc16nnmSzdfP6VS7VwTKp3tXHaYZ83QpEs0o=;
 b=WPa0h2rTSEU2LCjLfS9BLEUVqiQTJKzZcHhSzr4Wg1p6cPz8J1FfQc/V2mIWyd/923Gp0ixEE5Yg90rLgmff5auynsGPB+64WY7pD4A/Q5dDSccfS4BlfXncQwmUCqWxYXabQ4pY6T+tdzD31UjKS4hbmLYxYi8hp2EVqFTyY05VYAgQ2u46wpfZLh8sbUKj8KoIGKZJ6T0Ud9f6OMZX0yuIcU9ViXlCHdUcOXaH9x+Kabx8r1WTFdgeigM+XSlYfeGnqmKed1yGetpFqfjqyu4ggTtgBT5hiDwT/6MhH/AnfUgW91yzDbL8QxHEE7O8FAxRlVAMTQj2GsCJSu8bkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SA1PR11MB6664.namprd11.prod.outlook.com (2603:10b6:806:258::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Mon, 19 Feb
 2024 10:01:22 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 10:01:22 +0000
Content-Type: multipart/alternative;
 boundary="------------ecO6iVJpD0PgtzqMKnJLSEux"
Message-ID: <bf9a4415-3887-4b9c-ad84-7426e37c1d47@intel.com>
Date: Mon, 19 Feb 2024 15:31:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, Animesh Manna
 <animesh.manna@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
 <20240218091704.2259937-3-kunal1.joshi@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240218091704.2259937-3-kunal1.joshi@intel.com>
X-ClientProxiedBy: BM1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::17) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SA1PR11MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 3062affe-5b63-4246-9711-08dc3131b9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4hWn8s8uMxgUktJB3pHRJAfc8kHtAsZ50pt6KjsqHIZpWEKHWYekvf7fYJOKbYW5bfOsR46eKETRGlVQ7CwN0zJ9r+iC8Ujcvjv0nmN0VJcmzyto8O5zCFHuiho9Rjp0Yqb+Bq/mXRv63KlLw+SwxbzVUbI+qGB3tgPkMHk1zQlj4lNtRM78/nRKfsQn2vkgkhW3ZLzPnpX7PSgxL7vRpDO53UTjRTFIlEwk0oIPXGtjoTnfuXZ3YCMk2iDxC3ryKXqz9aCK8kyTkAd/TP3iP/DUkISWu0+XxdmJXjcYeT7Lbw7h0dkVy0JMh59xUUYQZt84VZuBleryeRrNZ356wqQeR5q9dv5bLUqGZynoUSGLk5YAS9c0AwfbK6zr4vjMXSCdOtZRGBYXIeQXncW0CI0t+GqUbneCu6D7e3BHUKW1cT3f2tw2/UjP5krvajiLjHmmLzKS35Zer56eD2uvat5vd9dQPpeQ4jTN+Opb2c/emmghN24vBrIwQDC2JBSnGiD6lNklWmM87uPGpl8iGOr7i+7+63ybAq20aGKujbBw4GSc2LLko1tawNy5bAJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(86362001)(41300700001)(31696002)(54906003)(6916009)(316002)(6666004)(26005)(36756003)(6512007)(33964004)(53546011)(2616005)(6506007)(6486002)(107886003)(478600001)(15650500001)(5660300002)(30864003)(83380400001)(2906002)(66574015)(8676002)(4326008)(66946007)(66556008)(66476007)(8936002)(82960400001)(31686004)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlByeHhrZWREcFBIbk92NXZZSTJnQ3ZDTUZrWDRKa0FONlRGOUZwT3pMUWJN?=
 =?utf-8?B?R2dwWC9hYS94QnNxMjVMaXFrd2NFQlBHMkYxRGZaRU9iUG5ERDZXUDcrZ29j?=
 =?utf-8?B?NU80OSs5NEswWDZvNm1wRGFHcmMzdXFsL2t1VDFFT3crVzJFVmVZcDVFRGNE?=
 =?utf-8?B?NFZ4Rk5YdEo5RVlhUWFrTWR2MHRkajdaMVErb1BsYlN5UnJpSC94YkJKT3lv?=
 =?utf-8?B?aENSS1pueHd4S1pqMjkrYWx0bzRMa3J5NkIvM1JsY0FSc3Z5L0NRT010bERR?=
 =?utf-8?B?cTUyVmo0c2NDYXZaTC9ocm1JWG1XYU80QXlQS3g1VUJkM1ZZS2ZVVlB3Vkcy?=
 =?utf-8?B?RnFFOFJFRUdndjVVUStnVXJkT1B4YlY1T1JaZTlTemxXTmtNV3lFZlpUSTlY?=
 =?utf-8?B?d1RWVjlUS3R2VU1QTFk0SG5IL3p0MTh1K3dRTisvZStFRVJEVzVvdVFOMGpy?=
 =?utf-8?B?SlAvR0k4cUJjNElLZFhMU3hKOWp2SEdZZjA3QkNIQ1h2K2ZhTndiQkY1TTl5?=
 =?utf-8?B?OWV6U2twZU11MTdHRDZUSXUyeDk0VXhoVU5qNit4ckRSVXJuYTAyTnNTdVl3?=
 =?utf-8?B?TlhXMlY1ajJJMmN0WDZFN2VCWlFBVE5TRGN0SFFTbDRNZlVHSENYb2IzNm5Y?=
 =?utf-8?B?cWV4T05HcU4rbFNFM1YxVUlIYXBiYjFQNVFkdE5aUzYreTBzTkMydHp4QWxm?=
 =?utf-8?B?SHMybjdHREZhTzNweWZVTFN5dEFWTjhsRWJxWDQrSWQ2N2VsYWRJeTljcWJM?=
 =?utf-8?B?N0JwaDVPS3craG9VQkMvNjdqbi9UZmRONzV3U29RNWVqYXBYN0J6V1IweGEy?=
 =?utf-8?B?bFI5L1lVR25CditKMVo0bXJhQ3BDdnBjcko5MUxNODFhSnNIMmdaZEdvME1C?=
 =?utf-8?B?SHp4MS85LzlDdVM2bDJ6eUJGNGdRYk5nSXJXZGgrVkxsNE80b2YxdGpNS0xP?=
 =?utf-8?B?aExCTnZLaS9HZVZFUGRZZDlDZzRIa0xZc2ZlVmhkNHc5ZC9SWmZOWUhHWFVv?=
 =?utf-8?B?TExUVjczUzQ1UG13eUpxZzVBeWJKYlNzanRrSjdCNGJkbjYzeXgvUlg4YmRU?=
 =?utf-8?B?WjBrN1JUR0hWTGdEY1JjSXlNdW1lOUw4NUpZbEhubkpqb2o3L0FGbkpTZEIw?=
 =?utf-8?B?aHQ5T1pnRS9NN21GMHBYdU85ZGNPTWViakJhTHdja1Iwc1hBY24wV2c4anRY?=
 =?utf-8?B?UVEvaWhFZUdwZ28vd2x0aGZLZFhueXhYdERkOWhtdEc3NWxrWWk3VE83VWJq?=
 =?utf-8?B?RGFYOEpXVmF4QWIyb1Nwb3BnYlJHcXBQNXdZWTR0dWt0U2VKclVsY01zMjBi?=
 =?utf-8?B?aDRrZ0crdFVZSXdFczFGZThUL0hYekErMUU3TE5ieG11dTZXY1FoTms3UHBx?=
 =?utf-8?B?RGhab3l1M1dLQzFLUXczdW94aUlob0ZqbzB1SU5zbk1oQlBqUmhuOWJMNnVY?=
 =?utf-8?B?Y0VQL1h1MVBBbHlmbjFWVWMzK05VY3FMZnRuNmFsQld2M2xCZ1dWanZCNm05?=
 =?utf-8?B?YkZmWGQvbjFodW1LU1NQMXpCbzhPdkI1MHNWVS9jdTVyb05DY3RyNU5KdDFh?=
 =?utf-8?B?ZVJYbTVudWo1U1FmaXNkZjdkZXh2c2R6TUdpd21EdFovSTE0b1hJSENxTkh2?=
 =?utf-8?B?Y3ZSeGFVeDkwb3lQdHlRY0JLZ0thZG1QWmNYSnNSTUdacURGeG9ZaWtSZnpK?=
 =?utf-8?B?V2p3V0RJYkQyeXFPbUF5U2xzenJLUDM2b0hTUWo1ZWZDWjRzVGVjYTc0cm10?=
 =?utf-8?B?a1hKYTRmWU9mRk53aXB1blNWSCtYdEhvZVpUNUhOcjNvcGovVXkzNXVEV0pj?=
 =?utf-8?B?QjdiOUJLWWpZRnVMQ1p1REhpbVVpZ1dKUmxkZnEzUmlwRmFjOEZJVncxQzg0?=
 =?utf-8?B?MWlqNnNZL3ZKZGY1Y3VWRjR0TUo0aDU1YnY1bXkzU0l0aEFZU0xnUnJ0WUdi?=
 =?utf-8?B?RWRod3hoWndtbnhVd0JFVnlQU2VnSlFkdVg5ZG5GL0hjU2l5R093dWZlZTV4?=
 =?utf-8?B?VHo0RE1XWWtFMVIwdVNVSk9wOUJ4UjhCWTVJM1dXU2h6MktacHpJVEVBM202?=
 =?utf-8?B?WXRNVzNheG5NUzJaY1Z1bC9FTWM1YkZ3N0VHbnFlTVFFa2hIRjlSWWtBVUhY?=
 =?utf-8?Q?elqXXgpUOeXjfYoQnRgD2DrXT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3062affe-5b63-4246-9711-08dc3131b9f8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:01:22.4090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yRTUyA/iqNWMfQgLw07T4xPSuTMcLHpHLxZvkcG9ucncjLgKdszf0YotAtUsDdUY+phQYx5dfcTOVXR7SioLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6664
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

--------------ecO6iVJpD0PgtzqMKnJLSEux
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello Jouni,

On 2/18/2024 2:47 PM, Kunal Joshi wrote:
> Extend the tests to cover panel replay selective fetch feature.
>
>  From kms_psr2_sf test point of view we have check_pr_psr2_sel_fetch_support
> function to check if PR/PSR2 selective fetch is supported for an output
> if output supports selective fetch then we check we enter DEEP_SLEEP mode
> in run function
>
> v2: fixed dynamic test name
> v3: use check_psr2_support (Jouni)
> v4: split patches (Jouni)
>
> Cc: Jouni Högander<jouni.hogander@intel.com>
> Cc: Animesh Manna<animesh.manna@intel.com>
> Cc: Arun R Murthy<arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> ---
>   lib/igt_psr.c             | 36 ++++++++++++++++++++++++++----------
>   lib/igt_psr.h             |  6 +++---
>   tests/kms_cursor_legacy.c |  4 ++--
>   3 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index cad8cce05..9accd2047 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
>   	return strstr(buf, "PSR mode: disabled\n");
>   }
>   
> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output)
> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>   {
>   	char buf[PSR_STATUS_MAX_LEN];
>   	char debugfs_file[128] = {0};
> @@ -248,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   		       (strstr(line, "PSR = yes") &&
>   		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
>   	case PR_MODE:
> -		return strstr(line, "Panel Replay = yes");
> +		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
> +	case PR_MODE_SEL_FETCH:
> +		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
>   	default:
>   		igt_assert_f(false, "Invalid psr mode\n");
>   		return false;
> @@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
>   		return false;
>   
>   	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	ret = psr2_selective_fetch_check(debugfs_fd, output);
> +	ret = selective_fetch_check(debugfs_fd, output);
>   	close(debugfs_fd);
>   
>   	return ret;
> @@ -334,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
>    * Returns:
>    * True if PSR mode changed to PSR1, false otherwise.
>    */
> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output)
>   {
>   	int debugfs_fd;
>   	bool ret = false;
> +	enum psr_mode mode;
>   
>   	if (!is_intel_device(drm_fd))
>   		return ret;
>   
>   	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	if (psr2_selective_fetch_check(debugfs_fd, output)) {
> -		psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
> +	if (selective_fetch_check(debugfs_fd, output)) {
> +		mode = psr_get_mode(debugfs_fd, output);
> +		if (mode == PR_MODE_SEL_FETCH)
> +			psr_set(drm_fd, debugfs_fd, PR_MODE, output);
> +		else if (mode == PSR_MODE_2_SEL_FETCH)
> +			psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
> +		else
> +			igt_assert("switch not possible from current psr mode\n");
>   		ret = true;
>   	}
>   
> @@ -358,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
>    * Restore PSR2 selective fetch after tests were executed, this function should
>    * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
>    */
> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
>   {
>   	int debugfs_fd;
> +	enum psr_mode mode;
>   
>   	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
> +	mode = psr_get_mode(debugfs_fd, output);
> +	if (mode == PR_MODE)
> +		psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH, output);
> +	else
> +		psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
>   	close(debugfs_fd);
>   }

What do you think of this change, do we need to care about PR/PSR2 
Selective fetch or just
write PSR_MODE_2_SEL_FETCH? Thanks and Regards Kunal Joshi

>   
> @@ -389,11 +403,13 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
>   
>   	if (strstr(buf, "Panel Replay Enabled"))
>   		return PR_MODE;
> +	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
> +		return PR_MODE_SEL_FETCH;
>   	else if (strstr(buf, "PSR2 selective fetch: enabled"))
>   		return PSR_MODE_2_SEL_FETCH;
> -	else if (strstr(buf, "PSR2 enabled"))
> +	else if (strstr(buf, "PSR2"))
>   		return PSR_MODE_2;
> -	else if (strstr(buf, "PSR1 enabled"))
> +	else if (strstr(buf, "PSR1"))
>   		return PSR_MODE_1;
>   
>   	return PSR_DISABLED;
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index 372bef2b2..36ba7f068 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -46,7 +46,7 @@ enum fbc_mode {
>   };
>   
>   bool psr_disabled_check(int debugfs_fd);
> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output);
> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
> @@ -59,8 +59,8 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
>   
>   bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output);
>   
> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output);
> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output);
> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
>   bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>   
>   #endif
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index a430f735a..91e5e9b07 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1849,7 +1849,7 @@ igt_main
>   		 * page flip with cursor legacy APIS when Intel's PSR2 selective
>   		 * fetch is enabled, so switching PSR1 for this whole test.
>   		 */
> -		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
> +		intel_psr2_restore = i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
>   	}
>   
>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "
> @@ -2074,7 +2074,7 @@ igt_main
>   
>   	igt_fixture {
>   		if (intel_psr2_restore)
> -			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
> +			i915_pr_psr2_sel_fetch_restore(display.drm_fd, NULL);
>   		igt_display_fini(&display);
>   		drm_close_driver(display.drm_fd);
>   	}
--------------ecO6iVJpD0PgtzqMKnJLSEux
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Jouni,<br>
    </p>
    <div class="moz-cite-prefix">On 2/18/2024 2:47 PM, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240218091704.2259937-3-kunal1.joshi@intel.com">
      <pre class="moz-quote-pre" wrap="">Extend the tests to cover panel replay selective fetch feature.

From kms_psr2_sf test point of view we have check_pr_psr2_sel_fetch_support
function to check if PR/PSR2 selective fetch is supported for an output
if output supports selective fetch then we check we enter DEEP_SLEEP mode
in run function

v2: fixed dynamic test name
v3: use check_psr2_support (Jouni)
v4: split patches (Jouni)

Cc: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
Cc: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
Cc: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
 lib/igt_psr.c             | 36 ++++++++++++++++++++++++++----------
 lib/igt_psr.h             |  6 +++---
 tests/kms_cursor_legacy.c |  4 ++--
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index cad8cce05..9accd2047 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, &quot;PSR mode: disabled\n&quot;);
 }
 
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output)
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
 	char debugfs_file[128] = {0};
@@ -248,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, &quot;PSR = yes&quot;) &amp;&amp;
 		       (strstr(line, &quot;[0x03]&quot;) || strstr(line, &quot;[0x04]&quot;)));
 	case PR_MODE:
-		return strstr(line, &quot;Panel Replay = yes&quot;);
+		return strstr(line, &quot;Panel Replay = yes, Panel Replay Selective Update = no&quot;);
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, &quot;Panel Replay = yes, Panel Replay Selective Update = yes&quot;);
 	default:
 		igt_assert_f(false, &quot;Invalid psr mode\n&quot;);
 		return false;
@@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	ret = psr2_selective_fetch_check(debugfs_fd, output);
+	ret = selective_fetch_check(debugfs_fd, output);
 	close(debugfs_fd);
 
 	return ret;
@@ -334,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
  * Returns:
  * True if PSR mode changed to PSR1, false otherwise.
  */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret = false;
+	enum psr_mode mode;
 
 	if (!is_intel_device(drm_fd))
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (psr2_selective_fetch_check(debugfs_fd, output)) {
-		psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
+	if (selective_fetch_check(debugfs_fd, output)) {
+		mode = psr_get_mode(debugfs_fd, output);
+		if (mode == PR_MODE_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PR_MODE, output);
+		else if (mode == PSR_MODE_2_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
+		else
+			igt_assert(&quot;switch not possible from current psr mode\n&quot;);
 		ret = true;
 	}
 
@@ -358,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
  * Restore PSR2 selective fetch after tests were executed, this function should
  * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
  */
-void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
+	enum psr_mode mode;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
+	mode = psr_get_mode(debugfs_fd, output);
+	if (mode == PR_MODE)
+		psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH, output);
+	else
+		psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
 	close(debugfs_fd);
 }</pre>
    </blockquote>
    <p>What do you think of this change, do we need to care about
      PR/PSR2 Selective fetch or just<br>
      write <span style="white-space: pre-wrap">PSR_MODE_2_SEL_FETCH?

Thanks and Regards
Kunal Joshi
</span></p>
    <blockquote type="cite" cite="mid:20240218091704.2259937-3-kunal1.joshi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
@@ -389,11 +403,13 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 
 	if (strstr(buf, &quot;Panel Replay Enabled&quot;))
 		return PR_MODE;
+	else if (strstr(buf, &quot;Panel Replay Selective Update Enabled&quot;))
+		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, &quot;PSR2 selective fetch: enabled&quot;))
 		return PSR_MODE_2_SEL_FETCH;
-	else if (strstr(buf, &quot;PSR2 enabled&quot;))
+	else if (strstr(buf, &quot;PSR2&quot;))
 		return PSR_MODE_2;
-	else if (strstr(buf, &quot;PSR1 enabled&quot;))
+	else if (strstr(buf, &quot;PSR1&quot;))
 		return PSR_MODE_1;
 
 	return PSR_DISABLED;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 372bef2b2..36ba7f068 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,7 +46,7 @@ enum fbc_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
@@ -59,8 +59,8 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
 
 bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output);
 
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output);
-void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output);
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
 bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
 
 #endif
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index a430f735a..91e5e9b07 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
 		 * page flip with cursor legacy APIS when Intel's PSR2 selective
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
-		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
+		intel_psr2_restore = i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
 	}
 
 	igt_describe(&quot;Test checks how many cursor updates we can fit between vblanks &quot;
@@ -2074,7 +2074,7 @@ igt_main
 
 	igt_fixture {
 		if (intel_psr2_restore)
-			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
+			i915_pr_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&amp;display);
 		drm_close_driver(display.drm_fd);
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------ecO6iVJpD0PgtzqMKnJLSEux--
