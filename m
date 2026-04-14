Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7370ED7B82
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EC110E5B1;
	Tue, 14 Apr 2026 08:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkB2/WGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB57710E5A0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776154722; x=1807690722;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1iNqLZaJhuA6ug2f7Vc1Ka6e+9Ai5aTIWKRX38cuHnk=;
 b=EkB2/WGs8hxHGvWsyV+lTHgvh/fyQCAsIhyFOv9cETXJHmiLDclf0VGa
 IDXHxS3QUxXoZ2trYddwmXsV40y+ZcQzbc39zEP5H+rIQGZ70Skesa93N
 /lUuxZFseK41ot9mPgIxeSig9hJNeSDNeIgH33BvZkXSlFV43xEHEEAbt
 gjLOseOnSHt9iWpjH4h7axqPy3k8SYWMNniolM+4rpveN/FFti8Nafgr9
 uJMTUPD/e+bqfz+hv6Id5eZ/16gqdnfdPCDaTT81a6vR7eelBA6bsVBpP
 //HzzeVrS+mrnpEeXyWZ5muXeHzfVVV9wmSRdnICqKP5HWuEp0V0Vf0YS Q==;
X-CSE-ConnectionGUID: JiG7+oJbQz+NFtpNsfI3IA==
X-CSE-MsgGUID: Wu9z/f1jQFCXE4iswSgasQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76268043"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76268043"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:18:42 -0700
X-CSE-ConnectionGUID: jEMfCZNuQliMGabIwyy/KA==
X-CSE-MsgGUID: ZHTMDbjRQGCUYN31nXlL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="223529623"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:18:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:18:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 01:18:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+HQZMEqI3cM2wtSsANCNtTfJtBjvjQ4YWJ+wOHIz1Y6l0hYEB+z8yPzQuXGROBaxo0NiHvJUtXaB1hfCpLULqWDDoHDf+3BxcV1l9Ueq9WmJAVuWxACC9S56oyk4MgwjvVs8xIExgyeRDdjgnAcAIaRn6Jpg5aHDz/QgHg9+3PImB0a9vzoC0vPxExBJvhUthQRMy49PoIqAkJyMpNSqL8ZaJbsv1Hrqz7JB3pSyPXSqt7UL5UQjhp8uATn6ZEjYWpLMaha8l5IQaYfJn4FNmrXvGjztT0oErhvks5LTRSAH4H5ns+kgEBmv9Rri8qlzJZBOcD4hDoRdbn/4r9HWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4Hk6F7k3O9/DbkmsYAQA72kHLsZ04+sbkw8V13Iz6w=;
 b=U89uFlN1tszCjs5nl7KskbM/vIGIdCa6W0bIxT7HlCltoxP8TBD4IUFZtHn4Iwdqp4TEZs/OH3lzfape3KWFEUeApIe6QXbeZfw1ja2eH3nSs9Epf6eic/qv/z0YAlOe6ae8jiowtuR2Tsvqks81App+eiyOcMrvt25srfSE+7KMDs3r8etKMro07iDZ3395DAcsPeXVy0QoA8ckD1l122Zi8doPsOEVIsWR23NF3K156uQywEc/ELmVjLpwTRPBd0OeIT/68MZ4YoS+S5fID5TmYPBrS5fCSwy+Kd65JJ79brkOG4HwxKmdQX7LFyp7P00xgW4N7pX+nkPZVSOIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 08:18:38 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Tue, 14 Apr 2026
 08:18:37 +0000
Message-ID: <bf554d76-a2a4-47d4-9ef4-558a74d06784@intel.com>
Date: Tue, 14 Apr 2026 13:48:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix redundant
 mode override
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260414060927.3182287-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260414060927.3182287-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9dc231-70d5-4add-00b9-08de99fe6db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|22082099003|18092099006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 68vywACDbE6hSIlaWfXyB9VXiu73UJxltzDl+LqXMAdwl3ul5bqvEgc+zTPxYoKXCf65RYRNlWqSbcjH//BNimi9aPe+dlB11uSMiVzMFNpvBWNBhuaHumv74jjrgI1bfQpMPPgWprPkTSte51q+2GekSLHc10EtvPaLiMys9+iz8CN3nzw3uurQuqQJez2ZROgN1+f9Ns0EBe2EJZNOpK8IapMcQgvVvoogF9Mcw4b4oo/6lejk3EG2OjmuMUecAsJCK815+lePwf0xxKNwFdtI5/HKE+XoYj+9a+v8vWguXDOdZw4LGsmfdym8jJQdJVJ9wRD0rxU8uq+CjPK8upKecoLbTtmfly8x3XH3Snqdx9FhX8LK72RM/ciCKp8QpuA6YFnAjgvRaOH+v7020NlT8YNOFQvdgONmCT7eVVsw05UB4XW8gbwVKBlHCDk7E1ZTJ/j/diPVDmJvmVTlp5FIgNg0TL0IgCAHBatHat6oaSV0pPJ3s6UUf4t1kXl6BoSxWZkdclWCMN60Jjy8xdQj/g5apVhkSPK//v+6iprUpfYpWLnUEYx5dnkp+Y3UJJFbFnXVehZpOa50O0MMZ9f/Q+gIQn4j6NDnn1bVPppFu5IJvdDMmWwx6/EWjF0nT9qndb05BnuLJZKxY0ViV12o4IJ6Sk5ThVovNutJKXUD58pHeAI6p9QLt7ZupZxM3bCED8imRaXlNkWelMwKRTLe08us3qU3i5qkiKseh3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(22082099003)(18092099006)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZnSWtGZGhiUWxTNDlvWUdybVVSYVRMMnlRWjAzaGVMRU85VjNyTnRhNmsx?=
 =?utf-8?B?OEZPbmtYQ2ExeDZTbmZEaDNxQ01OVTRCUFFMS2NITlh1MHRzd1V3YnNyWTBk?=
 =?utf-8?B?ZzNqemgveUVqVzNQZVZWc0VyZU10V0R0RFlFTWZTRnYxWUFncmVhMUdYVEFO?=
 =?utf-8?B?enhvcGtiMk4rdmhsT3M5enFjd3pBOHVudURLVUZwS0szWWVQQ0VsdDFCajVp?=
 =?utf-8?B?M3hYVHhta1o2M3BQOGl3ZnMrNlRLUzQyMURTMGQzNTZpMDNYMWREaDRZK0Nq?=
 =?utf-8?B?c1ROZGkyWWtnNnZScGkrK0hDTGlvVWhybkFWSTJ2NFp5SmpwR2F3WmUrWkRY?=
 =?utf-8?B?VUFwZy91TDk3elhsbk9iMStqUTJISWdkQUJtZi8xdlMwbnVwKzAwbzIrV1VG?=
 =?utf-8?B?V1pkckU5Z2U4RUNiZDltMFJHUDJMcG5QWDJIYXBYYUMwSW1ucWpKVS8xcWhv?=
 =?utf-8?B?dVRpUStDS1pGVlUxUWlZeHN2TXlOekI0dmRCcmZRQVdpYnFYR1NFRWZDeXpV?=
 =?utf-8?B?aDdVVWNsVEh1Z24yRnA0V0JpMk9OUWVneE4xSzcxd0ZkZjU0QisrY1BNM2p5?=
 =?utf-8?B?RktTUUlRWjM0cHNYK29lM2JGSEtmVzVKK0pDZzlyd1ZxSm5RSmU2Um81U2lm?=
 =?utf-8?B?U1RHKzFJWGZsWXVGU09NZXVyU2pQVnVzY0tucWpFNk8xUGJNK3UvVVUzb1U2?=
 =?utf-8?B?YnFlS1VNeW43cEhNQ1NORHRNTENOcENhbXVNTGRwaEZ1WTZwQWRvVmxteVZM?=
 =?utf-8?B?N1ZYdkNCQ1k0WEZXMVAzZWNVWVc0akZMdTBvUXNZQmIvd2hCc3NqQ200MXJt?=
 =?utf-8?B?UUN2OWtaaFFqS01aR0kwUVhkY3lUc1JCb2kwbUhBRncxTGc3SnVJS3pqWnda?=
 =?utf-8?B?aS9UTm9Ob0JDckxkczl4QjlRSXRhQU85UjlrbjhVa1FPNzFEUWlLNnlGTDZs?=
 =?utf-8?B?ZU1tLytuQXczcTU1aFU1SVBkampnUlBLbDBFUTBiWXI0UUNXa05Scmw3cG5j?=
 =?utf-8?B?eGhHL0puRkhkSTVKanQ0RVJuTzZ5NkJkaUE0Wk9TSkpYaFcxemFrZ1VJWWlV?=
 =?utf-8?B?WUs1WHRZQ0s4MTMxMm53elFzUklJWDB1ekdxOTlORlYxT1VJU29wQ1RLSndG?=
 =?utf-8?B?bGM3UnhYaloxYlF5clFiTndLYXk4RU5QQlc3eHVrZ25reUlNeDdCbi94a3lL?=
 =?utf-8?B?cWZ6TXg5T3dYU0paSkd5cWsxWDdHeStySTRYYWVrelg4eDVmcGpxWElTNkJD?=
 =?utf-8?B?QUNoM01Jc2hPKzdQdGtkUzlkT2xRZC9TSkpNbFdkVkE5R3ZNV3VxVnFIK3BG?=
 =?utf-8?B?UWxaU1YvZVFHdHpnNTJNN3p3VG14b1dZSC8rMnlyUmwxaGtZdEZCY1UxUGli?=
 =?utf-8?B?NlFmcnM0Y1VuQWl3QitrdjlGUTZPRVFxb0M3MlExT25iT1pVQzZPRjNWYkNo?=
 =?utf-8?B?c0JxZU54UndyeEtlYjB5ZVFHMXNCaVlGQXRIYWRGcnpwYmU1czllR2w4emJW?=
 =?utf-8?B?Zkx3VVFRMXlTb1p6bXJSa3FsenBwdnlmQlpwT050dy8vLzMxNkRjWVViSU95?=
 =?utf-8?B?OThXeW9Zd1M0ZURpWmNmNDFpN1hTUmJ6V1JNK2t0Rm1LSUpFTlc5elBJVmxF?=
 =?utf-8?B?UWFLcmRGNXl6bjdVa01LNmV3cXJydU8zajcxaXlGNW1QWmY1UUtPeUI5RDUw?=
 =?utf-8?B?VG5pQ2lJUlhmblZ0cU85eDc5dFNUdzhKaFByOHh0dU53ZXRYL0UrNU9PMXVs?=
 =?utf-8?B?eTZ4K3hqM3MvbytwS1duRmlhL1FTcHQyUFFVR0ptdlVuMnE5d1NPSmFYZm1R?=
 =?utf-8?B?U2cxQVE2cUlvbGQzc2hmWGx6QUVKaDdhclN3dVBhMUFYRkREREFYa1NBRDVB?=
 =?utf-8?B?cFFwNXZibFNDWWlmS3VtdVgwYm4wUHFQeXRGWmI4L3lUNDhqU3RvM3pFWGVZ?=
 =?utf-8?B?VDZGMXdaOGw1K3NkeE5WNk80LzZXQVpRcjhVcFBjcVdCcUQvMEtzRm14Y0Iy?=
 =?utf-8?B?NTRlUGR5eVdNL1FkWlpGc0hYYVNhQkJTM2QxVlRWcEcvL3RMRWhwcnZGZWV6?=
 =?utf-8?B?MkVOWVRKd1k4L2FkdWdmWWVMRnR2QzEwUXlORmw5enc0UVRQZGJ5dXFTcDY4?=
 =?utf-8?B?T1Jzc0x5bmFzSnlyK1FBWHJmcVpJNUpSTWF4SUo2bFdVcThvdHFwd3JTTDdR?=
 =?utf-8?B?dEhuZGRSK0hzeW85VTBUa0V5WjMzN0N4RWJPMG9aNCsrdXh1dndvMzFBeUdv?=
 =?utf-8?B?MjVnMUNOaWZKNGgwVU0zd3ZoWGRZVllQWk1EUVIybHJ4cG5XVGk2NkJWU3Q1?=
 =?utf-8?B?V3VMeTZMdlppSkFkeG1TNjdFSWRPSVhESGYwN2ZmYmJ5bUZoTDRuQT09?=
X-Exchange-RoutingPolicyChecked: bJyX100+9BjuqGeEpuraOM0dhSa61Pvhm+OBqojVHLEJSUl2J1TTvN9YO4jdqUiwgzF5HDV7C+2/pEO0j68hCpun+VP2Sh2OBW1ZNs2+WUNSFI1lzkPO5WqAXYWMTVoFWiTfSr/njbucljIAtV1T3WVDR/vBKI/L3y+DAglD7RvfLCYJiJ2rdOmifv/gYYhYKFrKK7CvaUKt//GOUhZAuzkQOHUZ6u7LzuD2EcbO4x3lsrl5PdAJKaqqhWJoTKtzQNqiIGAB5l1OUcFIHPXq0m0UhtNm2KvYD9tqu+fri9vdd6JLpA7udGa9FQdtC4N0QzernkqUyhmJl6ZgVLYE8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9dc231-70d5-4add-00b9-08de99fe6db1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:18:37.8527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmvaSoHCHln308TwMFU0uPtE59qpJPxatzFtTl9q9Z1HQxWYrhXrdO7C0Fw2eL1tqB9MMUIiS3Po/FG0a0DOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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


On 4/14/2026 11:39 AM, Pranay Samala wrote:
> Move override mode into if block to avoid redundancy.
>
> Fixes: 15663498141b ("tests/intel/kms_sharpness_filter: Fix stale mode pointer in joiner bypass")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 15c5e6006..bdfdf1d08 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -453,6 +453,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   					continue;
>   				}
>   
> +				igt_output_override_mode(data->output, data->mode);
> +
>   				igt_info("Executing on non-joiner mode %dx%d@%d\n",
>   					 data->mode->hdisplay,
>   					 data->mode->vdisplay,
> @@ -461,8 +463,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   				data->mode = igt_output_get_mode(data->output);
>   			}
>   
> -			igt_output_override_mode(data->output, data->mode);
> -
>   			if (!has_sharpness_filter(data->crtc)) {
>   				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
>   				igt_crtc_name(data->crtc));
