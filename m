Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01BFF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A7C10E199;
	Mon, 27 Apr 2026 05:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFt6jU4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FDD10E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266904; x=1808802904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fHxBZbofCGOJMRpKfp6C0IEEtmEsxKylGrX5ytLfRYs=;
 b=HFt6jU4qL4ofmdGH1Hyjg4MMWqfZQ+rKzKF/YmTLWHSr971/imnqPjC8
 7yLOSVI0yUNQ/uR44tma2wDbbF9P7+J2QRjwonDCU32NA8Ak1doV3lvWM
 jcNff3T4r2xIioaq726bDfGwDTUvHjJfoF8+Rhc4O7f6pzrb9nKSz4o4V
 qyGIaGH8pEj0RQUR1m3dwLatSYYdzyC7R9wkOW239dTPGmRYUdY4AFHyC
 L5BpoW80YWWtxrCDNPd6xPbWoMFDGGHdYoPs+1rDkRb0JMxkPbdUyXE3h
 xvsolSn1gJeRgXT13CmqL95iZrcItApxjFmfnVxfiJJxSSn9NwNgGSPCV w==;
X-CSE-ConnectionGUID: 7z6nX706RSKS9aM0T1RYSQ==
X-CSE-MsgGUID: moaAdfwrTaCcjXfAFfAo9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78259540"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78259540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:15:03 -0700
X-CSE-ConnectionGUID: ATherA6GRZWAl+N6ccKaLA==
X-CSE-MsgGUID: nNY5cuPfRSShEYgPd+QHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238522128"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:15:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:15:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:15:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFuK7JYteuokkTc3jsc5gNPiFZVGfX/8xYT86dc3vwxl2iBrAi9+Gy80ttybzIdG8C3CnFH2l3hnXDTX1hI7gIL5G/nyn8a07+D9bEgTH0IYlgB5VH7qML7R4FaqHTx8blgI0VX0i0WxxVZcZ2vmcPpCunbZPOSWFzd0A7Y1GRAd/k+WTSnO4VswB1Av26UNqrugdP/0i9+a7i+09h3l7VKgWYL/2RQsBFKfXuPiVi5gOK43Ix4JAjm05Pql/eyuzKYxJRroTV30988ARegK8tunu+l/589GjPZClb9cGIIYzvZ/1gT2wU9SLtFPWrz7Cg2AMXvMWEL+QbjZdKZfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSuJpxi0vsqzv9HYmwjYHLiQOAR919k/1i0sKSLo9uw=;
 b=epUSBOGf5eeDO/NZTMSxt7T9ZUF9nL5Df+TkOz2QO7NW32A7PSgFJ1gyyoSYJBdL6fAlLT4+JmVwVmcrl3KtyrwTzePISbnS9gJO+WOraNh7qAvplxhsL+FPOH/Uyn1ozBxOcNk/Rbapf1/9r5GYc9AyYqCTNj4uYfuZ86bgKrGFCP+dTJwdPXiWigKDr3KBT4Jhkt8a6Ji0ZzVTiL9LJn1rLf0YIuXxrHW8ih5lk4IMeD+dCbZcbqj1djx9bfz+exVhKFuz/AvbU6n7hbWaYdQQdC6XLvcctol6Yg3CCf9vXzly73yRcnIilQfFAsq80KCm+XbsbpxW6LaS6Jv1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 27 Apr
 2026 05:15:00 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:14:58 +0000
Message-ID: <f2e6977a-068f-411c-ac48-1338c0903f5d@intel.com>
Date: Mon, 27 Apr 2026 10:44:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 1b85a9b04681
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-6-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-6-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e07195-7767-45af-a707-08dea41bed4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: E3dFbcu9krM57TYi8T/w8waigDFkR9oOktv7u4IGQDqvFVTDaYjk2VBnvdWC/xgpNxGLL/aOOnsBQNuyiyNEM6i3SwyV+4taRjEcczy0RTz4Bqyx7VxN4rIXvRnECIcWZn44XyXOANCZkRA0H9NufOgQdRZn35Cu3CSbhtrMtTKU2M//pbanttNdM1c+eqQsYmvwCjalgCK8zHdu4YOJc1ERJpCu3xLxZg55SB9Tq4jfp1/CCCG3jfXSS2wFYESGaGvmMABeQ5yjDJC8ItpGEcQGxvPP/Wm46uJsqYjN83BDvgog5q3rVQ120Q93ORxvWg3xGLIS6tiRrZvvH8bGo6X8GZkpQGFsXE9J/bBygwLknM9QlTSDPywjaUGf8jTUz35MCvqZryugDMSzsAKlHRkcyzws6nVqX+1tN/3H7pydD40z66H8FofIUEBV9/FK8F5IQCaOa0fOFE917oHEs66vN6ICSudJmyy4U5kPf0pG5rS2Ci0e0doSz9lg9Q4vJ9kG3Edu5baP2lZOhsEPef0/vfDm/4Lb2XD6p6o2FGHskVoKKfMcWQTEOvO7N7bp4zeDYDlQpOQ5BA4cHcUMTk7/roSmZnl4El/75cNaPrbeFgxO7g+jL3fdsj3eFIwL6v3+FgnlFVOXNw4ALMJut0mlarnuWRDF7RWnuXRJ1VdUBvw2VoXUUqnLlcdxjqILIVyp4rXcTtdoHZHlbIMf3n/YMC4Nb1oT9pF/3orDzfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUFYdk9TOWhNandrSjNndS9zd1orVlhOajVGTTdYSTBpV00zRGNOd3NsQ2ln?=
 =?utf-8?B?ZDJOQ3RheE15aC9EcUlwNVJMdVJ6cG5pV3FoK1RhaUhwT3AzU2NjcFkyOFZX?=
 =?utf-8?B?L0FGc0k4d1M2V0RueUxoV0U4cDE2SEVaTGYxVVlrc0NDeDBXMTdQNWhYSnB4?=
 =?utf-8?B?eGtiMWM4NDFSMVl5elArc3AyNEEvSjF6SXlNRi9nL01rdEFuaWdxaHRzcXNy?=
 =?utf-8?B?aW1peGk2dHRvZ0hOYWJTc2V6ZjZJNWM3MWxNc1dvazhhZ2VQT01RdmlKTmNB?=
 =?utf-8?B?NmprYjBLWVNOZ2t1dFhjNXFnQ01SWmhkdytKdDEzUDJ4eXpFQTEvdG9qOUdK?=
 =?utf-8?B?ZXczR1JlMUErdG1DVGpIWkU1U0tkYUk2a1pvaDFOb21JaWd4dTdEZHFnSmVx?=
 =?utf-8?B?TmFNU2czL3RVVjZiRFBsemhaWHF1YlZ0SFlPV2lGcTJXMlFRWGk4Z0ZsT0VR?=
 =?utf-8?B?dmVueFp1ZjcvMkxhT1R6MzNBZjJUSWhrL21aaDlxVGEyM052eG9pUjd0anF4?=
 =?utf-8?B?OUlHd21HRFVTYTRaVk1JM1lmL2RNUk9pb0wvM3NPYjArczJFMDRMQzJJYzFO?=
 =?utf-8?B?aEcxejR6SFplMXpyR3c2VHNtSE9KNXczYlY0cWp1eDcweXBXL1Q2ckpSR240?=
 =?utf-8?B?WS9MMUxsSDBnbEhZT0NSS0hrVkFmN0lzbExDRGFuY2pSZm9XYjI5Z2hsMGRr?=
 =?utf-8?B?TTY5UW1wWkg1eXprV2pYbUJiMk14aDdNOUNubVp6NmRLaUs5dTRzZVJRQVps?=
 =?utf-8?B?WlJUVklFMUluVklmdDVzdVJ2YTQ5SWxxa1VWM1plWVhITDhQUDJ3eDdRTzJY?=
 =?utf-8?B?SUdWYUN0emNuNThyT3QzZWw4ZHdOOHBpVkloRFdZV0JDUjlJcTNWQzNpdXpv?=
 =?utf-8?B?cUVxVDh0THZYL09hcHNnRTVXczN1a3I4U1hEV2tPU2s5dFdzRVhzcFQ3TTEx?=
 =?utf-8?B?VE1DNlc4aHVXcUFpVjQyOXpPQTdsZ0didEFnZE9ON1YyeW0wWVZRbWRWMVpX?=
 =?utf-8?B?SkdGVFZxQWloNDlmelllTWZiVGloYS82NmVWanRNNSs4eGQwTERhSU1IZmlw?=
 =?utf-8?B?NWxPSzRsTzNBbWx3VHluY2ZuNldUaTE1NzQ1Vmg4UjJ3Mk1YVFF5U3BkMFZX?=
 =?utf-8?B?UWlOL1o0NWp3UWM3VFQ3eDgrV2pEcXRXOVlQQkpwQnRsUDJZeFlrRDg0WURT?=
 =?utf-8?B?U1N3T3lFUHo4RlUvMGd0R3djQ1A3WUhhaW55VHQ4SDlmOHpFeHNrRnVXUG1D?=
 =?utf-8?B?SGoyZEZLUm5qb25KQVBHMGpLdUdvOXNwMnpTYXFITGhGMWFKbzN6eUZjWVdH?=
 =?utf-8?B?cXFlMWdCN3RQY1l1eml1bm5iSFUyaEhoUkZIa3RBWmNiYlMrUDVYSW9YMkNi?=
 =?utf-8?B?TmpiNXlGQXB1VTlDeUpoWFF5dDZJZ0U1WFBNU0hyMmJrc3VvZGg3WFQ2SWZy?=
 =?utf-8?B?citPeHFIdkc5MGtDT2FVbjAzMlQxa1BEdzFEclNrSFBMRUVCdDNxS2RkM21D?=
 =?utf-8?B?L3VCZVRQZ0Z4SURMWEkvdjA4RVQvZjAwMyttakZOY2Nia0JDUnBpZVZmZ09z?=
 =?utf-8?B?OHNGUGlRNkY4dFpWNFlJL0J2YUI1Vnh6V0IwcCtBaWNwVmNlYi9JdnF3cHZy?=
 =?utf-8?B?M0NudmloMml1WTZEeVVWb3g1RUo3S3dFSFV2VWNLL2tKQ3lyZVJhT2ZQWndV?=
 =?utf-8?B?L0pBMDJRbWU0dE92a2pzOGtIWTViMTFOeGM3VlBRNWZWZjZPdFVPZTVFb1kv?=
 =?utf-8?B?Um9UWGswbXd5cXMzT2FCbWF1a2dIaG4valh5WE9xdXJ5dG1OSG5oZHdCOG5J?=
 =?utf-8?B?M2dEYjNDUzFBaythS1N0ME1ZaVp3NVhCSEx6YVZ4dHJqRnZjVm1BUkZTVXFo?=
 =?utf-8?B?MnF0Mjd2NmtHeVQ1TkhZMEVjbmlHR3ZZNkdCa1pScEM3bzAxaGxwTUMzYUhW?=
 =?utf-8?B?djAzM1BlRG5wWDJxZVU2OTVZWkw2STkzTEdOUFJUb1FlbUZpVmZTcnZQYVBH?=
 =?utf-8?B?L2lVNTlZeDhaWFNrdlBhZlNiU0M4NktZZHE4ays4aTdkVlpEOGprb2phY2Jq?=
 =?utf-8?B?ckRjYWRsSkZJSW1lOGR4elJ1Y0hSK1hlOXpOZkJrSGQrZGlHcnJWcFl6Rm9M?=
 =?utf-8?B?bk5KNlZXcjJ0cjBvTXU1b2pKL2M4OUpqM2RHS2pKNlBJbm92eEVac200OFZZ?=
 =?utf-8?B?L1M4SlN4d3JZeUludWowVHlMdEx2TzNHUnZiOHNIZTRCS1IwMk9mVDB6bi83?=
 =?utf-8?B?L051a1g0QVlUMm5PcnR3NFJQdmFWNDFGcThhajVzdXZkaFZlbE42UG5icHBP?=
 =?utf-8?B?TGF4WE9DVTFobkFCUzlXVisvWktMSmtNTnhldSsyTHlzajNBdEFldz09?=
X-Exchange-RoutingPolicyChecked: s/wGQkGQpKNGoG9M3XONdIwGd3QnBk975GZOKXoXRUGcT8jOYj1aWomGSJ7o6MlwN/uHoMJA8wBrzBucU4OLrPT/t7OMcDaVI8oFBMtMJHod9N2ei4tVtZX0xyMopKiTTBdfZR2lpD4ydYQqrvehAfNFCOihAi+RGBHMapkp6eW/oA0QFrNO3xW+56wKQ/rCBsUOfw4ajBxXFcOyZybsPOMmD6YTMPsDigL6TBGvB9enOtp0VNFPzjF4GxKTiYkQOplmw+tUZrq43Twj/Q4SxUfSbl96C89OJ54V2ksA++GTL9TrYw0fimQ1G6DoBJN8nTCbbUfQufr96FDQYpxS2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e07195-7767-45af-a707-08dea41bed4b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:14:58.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Dldkm3P6Nju1HwXdjTOsG7jsqTCCwSB9LoPe5Fcp8Q5yqZThFGWjwTTszTzqKqmHqbLIS3EEJ3y3ZC19j8DiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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


On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
>
> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tools/intel_vbt_defs.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 57fda5824c9c..0dc13d080e8a 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1109,6 +1109,7 @@ struct bdb_edp {
>   	u16 edp_dsc_disable;					/* 251+ */
>   	u16 t6_delay_support;					/* 260+ */
>   	u16 link_idle_time[16];					/* 260+ */
> +	u16 pipe_joiner_enable;					/* 261+ */
>   } __packed;
>   
>   /*
