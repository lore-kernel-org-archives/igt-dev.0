Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA09C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 20:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042E10E5B6;
	Thu, 29 Feb 2024 20:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT6sUH7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E989910E5B6
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709237352; x=1740773352;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=27VfAoz2Fh4cySeROC6mnJXpRMzsrAIT3OlvABujmlk=;
 b=UT6sUH7qwbEqJS7MeWWKch7i6vuFLbr7ToEK+kiskDPldEdp4ebOjNp7
 XCz9YWfHXOvwT7vQIQAwfqi3fwiWJlV7Im7OAm1oUBCQa5Xv4e16+WLRR
 EoSmBzXFFcs4h9nNItynohzg8Xwa9THOxusu/2rVfAetLT1CNt5mVyR1U
 wvDXSXQJf+srt+KM4RO0hPkvVX1SlZNiRvdPMY8ry6z1FREjOpO0syN69
 eTHhxAQpMI3TEFCxs4xth5hz9JlHYUYrUXxoYeMpNDaZEOiOPBDtPJIy3
 vFQVe5o9AaZZgE+ZA0BTvdfrUV1apWyhl+sj+9mvMPK8eYIGJkX90tnSJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3589377"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3589377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 12:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7866112"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 12:09:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 12:09:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 12:09:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 12:09:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 12:09:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtCpEvM8v3xGHzTTH99++K3/8ochAe0pCabBNb93nYoXnCjaZXJFD6OQ2OaFbTtnlQckUko8CN0sUnuqy9dz2R5NgZhRYePV5Hskehohw5GS1NFzN6vu+dYxrpCg3/HDRT/m1GM4qjPqxr/kaW4LyB+y/nNM1pzXeqHi6+Hqm0RsNIOKrHYcSk3dINCAPHmhNmAwBw0PI5HQXO2RsZ7jvHbJIne2ZfFVTDIH2sl6kihXMCbf0wBuJWFM/ZDx5tmBAYr1+8Tt+6mcV59mLGDdSBULLmZY0GxM0/zb50c1a6xea99dHVkU3IcXNjWvnX8vKRbiDtz2lL+tN4YVkB77CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+g3rU40ApGXGHaHYr20LH8lUC6Pat0SW6ZMe9NwojI=;
 b=TpldaLas6iy/vQ9NV/QItdSVq7n6MUrdLUZZmM8LZ+JQmLVCc0lPakzsMP2IAjoJBKic21+7PyA94HoMAQ+XECHWnvfoS1xLQf8hD5kehDH6uXvbrAVCdy4a5mjVLBivzbeR5XtH97pSb+YnVEQZODxFKjdnN07pZua/dvTeGIesN4psvfJk4+g+PHCTJJNASSxSyR3pklCN8RIL+uDQPek1Uj2kD9gTc8IaKHJ9I7BTuHt1sdJF8U9hhD81JK7RqQCOxJg5azVKcQxrm6TiWxKcUA0jsJ3M1/pYLTe+GnIulhJV+/GiOMTgdi3G4NiNSwYGWHNr3imBJOd4frogdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 20:09:03 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3%4]) with mapi id 15.20.7339.026; Thu, 29 Feb 2024
 20:09:03 +0000
Message-ID: <691e9c48-e525-4b53-9571-1e259850a770@intel.com>
Date: Thu, 29 Feb 2024 12:09:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/gem_spin_batch: Skip compute
 engines on MTL due to w/a
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <IGT-Dev@Lists.FreeDesktop.Org>
References: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
 <20240229193930.2933130-2-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240229193930.2933130-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: d18d7f85-76cc-4988-5b4e-08dc396246a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUj8t8CRuipAFw/SPU6ofEyms02gjPdO/X/sfkjU074/yNq3n7GM9OVER72HQ/jZTbLfYUXdi6VjNsudCZFIkIvkhbKbDAMKvoqaGz2a4kKZlYbSrl65cVrT/comfL7QOG58DiZgGH+PcXb/KIzncvgqX9Dt794NixLoAHp3PpGaUjcMurHp+R4eLyS8p14L1121ABeXLaIUhkMLFeK5Kap77o+W4wpdx6RseINS9xO+IXe8Kl4BRmLqgijJxzWBbCxk4LoYTvY643heskjmU/1iBUoWfn7qLv25WNfykqdu/QoKLdFy5vVGVpxC5taKQaZBinkoKXvU+/kQevNVfnM3D21aPTI5SYzShsGbusRyQRKN9wvxRNJhHPM8AtMBkUuwDKIZnWmo1qtrMBs2UediMPzkRGKrUc0NH0f4nCRuRYQv2EyzRF7+Rumy9LR7AEmfPfnC9qtqDuVfgRph/DO9iQ1pavWsfItwxQm2ex09KCjlRHT0znYJQMFH/H8aFpuVZ/DshYZvNEOjAnbRz2Gp8nW+Mv8++6SZHt5qCQcByh7V+SXokt2cB1nOKm81GKOoshevazd/+3IlQfSHAhhvJ/8AQAx+xdpfEt38fVgF6V2fv6aydzll/Cro2+TD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRvNzMzUzBkOFBRcjU3d292ZndkaXhLOWxZVFcxWnI4c0dMZ0szYS82VkI4?=
 =?utf-8?B?WmtyeXJucUdBcTh5Ym5uRDBZUjhyLzZWWG5NTTlNUEsrb1hwNklFdndoaWU5?=
 =?utf-8?B?OW5LMldUK1F5bzVxUlhKeGVXVEJFclZiWXhJTUxPaXlIVGJldEg0T0lSSkZY?=
 =?utf-8?B?NW1qY0c1MkVkc0srbDIzU1hlNENFSEY3WDBWcEhvYU40MjczbnhOQTJ0cXNt?=
 =?utf-8?B?VnNiOTdJOHJrUnRKc3ZnWWdPaHhTRS92SE1UZGs4bExGQVI5VFhRU3diSGZH?=
 =?utf-8?B?M2V4VzJuY0c4MnNGKzRoMjdadCtrdTQ5UFdmRldZd3JLeGxCdzJjTUlSYlJy?=
 =?utf-8?B?NnJlSEtzcXpUem8vempXMk0rY1JldjBRRnZLQUpUd0dKbUpCdUJ4cGdNRFJj?=
 =?utf-8?B?ZjVVS25rR2N6V1VpQVIxRU5QSW13QWx5ZEJvQVZDYTBzM0djQis4dXBPVnBG?=
 =?utf-8?B?bUk4MG10ZlgwdmZEZUJWWUlvQzl1REtxa0xXYVdOU1lYQ0hRT1FGbnFJQU5T?=
 =?utf-8?B?VCtuL2srMnVBdUNNQ3J3aUFBN3BteTROSFVvUlpwN0Jnell6UmJkQmNtUVB3?=
 =?utf-8?B?dStDQmVOQXNEeGFmM01aK0pDMnhnVEpaV1FGUGRFYU9ac2NBY0U1bnR2VFBG?=
 =?utf-8?B?WFUzVldQSGtsNEdDbVlyc0krYUhFaGZ0ci9ma1Z3Q0dYM2RiN3BTNy9YTFd4?=
 =?utf-8?B?eEZCVnRNdkhuZkVqcG9YZSs5a1NwellFeHBPV0FkQk9KL2hiUDJTZXpjOVcx?=
 =?utf-8?B?Qnl4V3JQTzRNS24vNDhvU29IdWw2d0t1dVNON0s0SDA4SmZ1MWszZjMrMk9u?=
 =?utf-8?B?NDl0Q0o3MU9PMXR2R0p4T01MbVdPYWdBa0xLWlFaTDF3V2kxb3NXbFhFbW5Q?=
 =?utf-8?B?aGZYTWxPUDFGdWZkck9IdFJiVHR1Ym5PV0pleE5xMGlVNTJtSlVxM2FkUzcy?=
 =?utf-8?B?T0tGdnF5cUJJcCtXa3NtM1pOSHR2OHY1d2JuNUlHRzV0bWZRSmtHSmNoWFBr?=
 =?utf-8?B?eGFCMVR3eUtsQVlTYzNGRzN3QnJKTXBrdXd5WXdoRDZ1SHRnTVJrTDdabEps?=
 =?utf-8?B?Y09ReGplTk05ZDZNWThIM0FpaXhXNXl3NitYaFhpN2hqYzd1NnljajZTR1Z6?=
 =?utf-8?B?dm8xUFp2QmJYZ0lUandKSmRWT2Z0Y2pmanlMY0xYdDJqRmZLcVlMZ3d3SjFw?=
 =?utf-8?B?ZGtyb0NXMWhqQXlhRmh3bEFjYXhVV25oeTdzVUFQZ2lLbzl5OXdGak1NV01P?=
 =?utf-8?B?Q1BDaFVhb2JraFcvcEtGdnc2ZEF6NnZIc3BaOU9GbTNrWUU2QTBEQ2hZUUFX?=
 =?utf-8?B?QnR3dkdNclY4TEc3cFh5eG5CYnBnVXU2RExiT1BjVFJZa1NLNU5hdnRLemZt?=
 =?utf-8?B?eWhrcW1ycitMSUFKS0RoQXlmTTRFemZTVm9QR0UyTm5UcytSZ2cvbjQyUk1K?=
 =?utf-8?B?Q2t3Uk5sajc5b2g5SG1JbC9NQkZhaG10K3ZLZGpSbkplMktXRVhFdW10Q3hH?=
 =?utf-8?B?QUFIYjVEVmQyRnRoUERONW4waG95T0lQeGlpb2V6UVFCMXBPbUl3eCtUUFZr?=
 =?utf-8?B?QjhxZUg5dVlVSzNHNTBpeG9UZ1FBNlVvb1AxUm1LWU9BUDJZS2dTVUU5bzlw?=
 =?utf-8?B?SmpXUjNmTzZRdnlqck1zWE85WllvOU15R2RFNEZzV1ZFR1FscVU1WEdFVklN?=
 =?utf-8?B?TGFaOG02UUJuT1VQempzSG9ScmhGWTArY2JaOUZzMUlPTDJ5OFRXS0Nma241?=
 =?utf-8?B?TDJweW5tM2ZtcXVFeForeEV1Q3h4ZEpzdlpvLzBjMGRpNHNYcVd5bmIrbjZ4?=
 =?utf-8?B?NjF5eXFhTjdmZVdWZU52b0d3YkI5N2ppclRqbEtzQitpVEdyN2RWQjJKa2FC?=
 =?utf-8?B?eTVLVWUwNXZUMkJhaGNoSlhkRnliUmhmU1VON0hLRWMzUU1wZk9lZDBkK0Nl?=
 =?utf-8?B?K2dtRGtRRWxscTQxUFdYVmJxTWtFRDhkVk84R1A5a2RQM0lmdVdTNkM4dTdB?=
 =?utf-8?B?emlDTXdweFpPc0dMUmEwTWhwUFUxTkxjS2RuUmdiUkNLRlFxVWVNbWtuOHZI?=
 =?utf-8?B?Z0FxcnJvNG5qTUZnaXJtQkdyZVlVQkYxaE9aZGtQckNmdXRwM2F5YWxndXV4?=
 =?utf-8?B?V0w2SjNUOW9TZkF5eGI3cjVpNVZkRFgrMHhlRUxIUTZtRGtwM3RxbDlranlX?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d18d7f85-76cc-4988-5b4e-08dc396246a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 20:09:03.6533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N90eqaC6vPsTJpvREpN1HOJ81TlJVIHeSRiiaFD89A6SEm9sD7k4ni2aoTfZqs4p5N0RR5ye41TRynazDDilFGFbm2EynQrrsOBc0tJr7Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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


On 2/29/2024 11:39 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a w/a on MTL that prevents concurrent execution of multiple
> processes on RCS and CCS. The 'spin-all-new' test is explicitly
> testing such execution across all engines. So either the entire test
> must be skipped on MTL or just the compute engine must be skipped. Do
> the latter as that at least leaves some test coverage in place.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/intel/gem_spin_batch.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index ec1458e35197..a0f35b23c718 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -214,6 +214,19 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
>   	igt_waitchildren();
>   }
>   
> +/*
> + * Wa_14019159160:
> + * An RCS/CCS workaround on MTL means that contexts from different address spaces
> + * cannot run in parallel, they must be timesliced. However, a non-preemptible
> + * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
> + * across both RCS and CCS engines, one or other must be skipped for the test to
> + * not hit a heartbeat timeout and be killed.
> + */
> +static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
> +{
> +	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
> +}
> +
>   static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   #define PARALLEL_SPIN_NEW_CTX BIT(0)
>   {
> @@ -230,6 +243,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   		if (gem_engine_can_block_ggtt_binder(i915, e))
>   			continue;
>   
> +		if (skip_bad_engine(i915, e))
> +			continue;
> +
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>   		if (flags & PARALLEL_SPIN_NEW_CTX)
>   			ctx = intel_ctx_create(i915, &cfg);
>   		ahnd = get_reloc_ahnd(i915, ctx->id);
