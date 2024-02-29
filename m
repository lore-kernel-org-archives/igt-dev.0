Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19504C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 19:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831B010E1F8;
	Thu, 29 Feb 2024 19:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7O2Meuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C673410E1F8
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709234359; x=1740770359;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fo2rLDLiXjo8TAkX8GqBS/euZDqEE21kUYBDzNRSQyQ=;
 b=W7O2MeuvfDnSj1eD1jbETkCKWAnYoMgUkINfUEud2Hi3xnqDxttIBFh9
 3PFPP+1okpw8tMhgLeZQcVPm9u19+IKY+6p0HRJZsvbvTqS6cLRvmhoPM
 9V+SNnMT6cD3qjtVKErYMVSoGxk3Eec68YaOrT6JBJlRf9koHqPGH2ufV
 4WqhG9BSDB8GjLrzBQmUfLzNHGxDj6ft+SXMFg6l7bJg1MYUO4OnBBQnQ
 +GVIIZUh0lfq5t23B3822800i7ceDWa9XpYy2pn61LV3uQi1/19zvcLWr
 l2fPn4sp6NUXJn6ufIq8MKWd8qRo+1lFiaHQhZU0dirbuIarAeF3X+y8y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3601150"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3601150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="31122118"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 11:19:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 11:19:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 11:19:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 11:19:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 11:19:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOf75pMFUSKU4/8gb8DU3alu8cdfTUz7BausZLQW4e2YvCXFzfORs+MD8zjPJUJoTjHRzbZe0W6PlfZQgzowasMmyiXk3POpBAeawvlxBSh6CAoCwgNfsbzfrHp78PimCFo7e8ySsF86d3/2yfvgkbj0gPQhf2mgrHBwK7Ff/AGk5MZBu1MFH64U0eaFY+BS8aJO4LHzUFE4Uom3IOsqm4oQ/lt/Kr26ZxFT08R3JkN8SPgH+pnHP14TrYE+dbRUutZO37W38qPiVYhM4PC803v62ZEI6Gc+MO2mGOcZvH0oJrnebzL+3+S3UHKZsuLI/tVcUZMhUf+86oSbAnzKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP2O47VEm6fWf2S1ue6WPA+Sy4IdjtESQDc84svcWpM=;
 b=RBKdhDrEn/weF3HZEh4Hh6ULxFMJUCzNEzAoUTtuoRqbIoFVSwHmD+D49pWfyKRiKtrgboYttzGs4GFF9xJ2Ow/u1lQFl3RHRNROsBmjFsLYjI0kdviH5KzXuJ9DNaH7einn8LxF2UsMuDq1hFc8XzM4i8gymOIxN65zzK0kVY6zmHPILj6G7xDY7lZIMZFTb+vF95akgXm2DMlxts8Z8a9DTdc06yzIpDeEpNfigpTHAogddbfHAkQU34u65g42+vJ/giE0GppVrtuLclfll+JUAAjh2qzmYLWRYOzDesflNimKd9Vg29NhsLeXpa5SYsDE6jsU28BJkNahKu6E9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 19:19:14 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 19:19:14 +0000
Message-ID: <50a27309-3492-4ca1-8d64-71dd50175cab@intel.com>
Date: Thu, 29 Feb 2024 11:19:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/gem_spin_batch: Skip compute
 engines on MTL due to w/a
Content-Language: en-GB
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <IGT-Dev@Lists.FreeDesktop.Org>
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
 <20240226235737.2150915-2-John.C.Harrison@Intel.com>
 <20240229134216.4ut26aezfbrtunyi@kamilkon-desk.igk.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240229134216.4ut26aezfbrtunyi@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7aaf1e-a376-43e9-447a-08dc395b50a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHdAFaxq6OI+r5ANqhDXfrv3oPlYf52SsTNs2mj8Ew8EFkNqM4oIkCkUdTGk2KC2Ufy6ksDMXfYCWSp111lLxdta401OVBEAZ1rt73yJPAEkFruQWkGhjwW6S/+/vAaLCzocnUgbw8LHNpWYAEwzZR3CSygGIubylFu6uieDDD9Q3QmkN0s2c4PQG8g5KDZ3V759YBse7xnxaczZvkJNDNLknKlSbE5hgP53MCAXizFCnIMWqoTzo0qvdfQayTH0QbHBwypXrjid9G7X8aMxRFnf2VGTghEjkLdZNd8+d6z4uUs0YsTex6BnMCiQcFPtUsY7+hPSNCpK+gzsTk1burMDGfiy7tWCXcWaXiG57uocxvpPx/7o8HrvTWnvQkLYr/zeClTJXO5tvlCLSWxeiBberrO1/bEitNn650JkJ4KXRpOUlmfQ15NjQU+f6qNiKKAuHte+YZ4RM8tc/49PsMCCOaSnvDF6WCbvGPqCfCTqosQXSKczlC6HJaAR8UYy3RAzksR8a4ftX0tS4dKxOhBqsXx8HOjBqYUaMfAfn9ukUh9U5IOURiWnACYTQ6cRMzC08AcVRI2aUgeOjNrw5U1P+NALGnYmT7+3kEd5j3ooJ5bFpwcVjNUp1S28Njrfpvs1DmuIppXeP5dmPJUpBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlUWnU0L25Ka2U1YVlqYVRIcHNMM0ZmdzlyYUduS2IyMUpSMSs1RTlXY21j?=
 =?utf-8?B?ayt4RFphRXpVWFRsWThsblRGS0NTRDNKaFFZRDhUeWRyaVlaYUJLb1VZeStk?=
 =?utf-8?B?MDlzS2tXUlI1K0grbitvVzgrL2pCRXlTOGZPRDlaUlJUc0NwNHZEYVgyMXFZ?=
 =?utf-8?B?dTlEbCsycTM5WGh4TVZkb2lJR0dFbDE2dDdmTnY3eWovQUlVeXdlQzI5cDk4?=
 =?utf-8?B?MGdqU0RvU3hkR0o1SHREdXJzSlg1UHgyYWc5T1ZhRFBlTjlEVjJWbSt4MWp5?=
 =?utf-8?B?clJlQ1lESGxJMEdLd0ZMeExUNHBSdDhQTy9nM2FjMVRNdC96RVRJU09xamc0?=
 =?utf-8?B?T3hqUHNTTThDUTU3UWU4NWx1RG1rdlRSN3VNU3dtYWdLaTRpM1M5OU8yMDNO?=
 =?utf-8?B?YzBWZUoycXQrczgyOStQaE1meGhrM016N3phaXFXdDd2M3lrcG8waXpLRW1y?=
 =?utf-8?B?bUZlYUlZbUgvUXF2MHdBbmVIcG00S2RSU2hOd3pYY2dralZSRitDZU4rQk56?=
 =?utf-8?B?YUNJampNYzZzSlh0RFF0bTJvTXJ5WXR4aGJGcXBlQ2U3MjNsMGdiamFqMnd4?=
 =?utf-8?B?eWMzb2pYSWZSL2tSMGRnNVA1Q1U4N3BuaHBTVFpJKzUvSE9GbFdjd2dTclhu?=
 =?utf-8?B?UjVRb1FkTUhncFhYZDBrek9YM3BnWG14aGtlSGdtV1M5bzlTOUhOZ0V6dnpw?=
 =?utf-8?B?MUFMcXI3ZlpRRFRJdFhGc0ZXUlM5RFNtcENYRkJFcmdwOWs1MC9weURXZHBv?=
 =?utf-8?B?eDFmMVhaSlpoeFR5TjF2aHF2VmNtWnhpcjRHTkdzWXNWTzlkMlR4ZFA2QnRU?=
 =?utf-8?B?am1CMUUzbjFTUGRqR1N1VUZuanl5NHNEMm1yRnlUUlJYclJ4K2FqRnZYM0RN?=
 =?utf-8?B?ejM1WjBjUTdpRjlGbmFXWFA2akpkWks4UG4vdUNzM25oL2FaVUZxZmVOK0pP?=
 =?utf-8?B?b3NUbC85UEM2Zlp5WkZkVStTUEdLWDRaNWVQVUhWM1JTNndQWnZnblNCcE1M?=
 =?utf-8?B?Q1IvYXhpdDRIcDJVYi9rci9iN3YxWVhzVUl2UUFYV3J4aDRoQzcxZ0VBRFA0?=
 =?utf-8?B?Y2dPdE1uRmR1SEl5aEs5ZnZEMnNYd0dRN1BZMkZZZXFWM0M5bFlhTHFnRmhj?=
 =?utf-8?B?bXQzc0lQQTVIN2QzcWpDV2VTRlZmOHZWcDV0dXpNZVNkbjBXZWk3WHNwLzB6?=
 =?utf-8?B?UkhoRlk5UVNyWExEaU9ta0piSTROZnhTY3ZOSXRaVVBuSWtRUm15V3k4WGVt?=
 =?utf-8?B?dGdaSnVBT0lmSDVoTDJqRjdXNC9kTkx6Yk9ydFpKOUlPWU5IdTJoLzNmdlhY?=
 =?utf-8?B?RlUrZFJrczJQZ3Z2akhESWdYRXB6ZlFoQkYwNDQ4c1Z0cWxJTFFIQmc1SUdU?=
 =?utf-8?B?T0dtYkQzdzVxclR2RkkvY2xWWFRZcm9EbTRqSnNYUVVDTXZsNlk1UmdremlM?=
 =?utf-8?B?dzlySkhGNVlmSEZ3TVhiQ20wUjljZDM3V1M3YW1uanpGWUkvUDIyVnZhTFpo?=
 =?utf-8?B?VGMrbkZna21xVXdYa0JHOTRMMW1EVXcwNTgwZ3NGQXV1VnN2M29oSVFMdUNs?=
 =?utf-8?B?Ym9IM01FSDZBcWpmbnMwaGZ3Q3l2a0JnVzh0bStKQzhIenhkRkNSR3g2ZWdS?=
 =?utf-8?B?QzExa1hQS3BYOVowZ21BSm0ySldma2JENjhBOS9RZ0huMjkyMFdidk5Vdnp3?=
 =?utf-8?B?d3ZYd012MW40SmRBRGlxUzVxdVQxNDlkRVRwNEhZcXM4WlhldkNYNzZ2SEtE?=
 =?utf-8?B?cjNTU2w1ZUdDL21FbDU1QkxoNlFiSjhwNlNzQnNmRklDcS8rT1k4OE1QaGsy?=
 =?utf-8?B?bnFqRHFYTGxtVnNzTFEwSmN1cWNsZHEwNW43clVJSEV0Ym1jOStMeTM3NEFr?=
 =?utf-8?B?Um9ZUkVZVVlleG1WdFhaQS9Ib202TFRGQy94Y3NxWXdFcUxtcUEreXBpQ0FB?=
 =?utf-8?B?MS91WDI0SnFJcS96STdiU0I5VE5ia2xQeDU4OUt4bkFqaXpMc1ZMMDZzcWxp?=
 =?utf-8?B?MWo5YTZjVkFXK1NrUGhERXhMeUJrK1kxRmtRRTJBRTdiSkQ0a1VkVE1rREp0?=
 =?utf-8?B?MHl2VG95TVJOMHN5OGZrV3IxQll1RDF3cGNkSjc4K0NVQUJPVUVZbEU0ZDdV?=
 =?utf-8?B?a3p5Z08xcFp2Rjhuai91ZXlDZzROS0hUbWpnMEk2TkRPTW51cXA1N1N4bkxJ?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7aaf1e-a376-43e9-447a-08dc395b50a0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 19:19:14.1720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoqjS+CF5L77Ej+nQUlKqyGgNrp35cZVewByhutxbOtWV7LcISb0XjWUMGZdsB7MsA5QVpbm15HbibHlPWp9faQatmBmYX+coBJshZDDrDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
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

On 2/29/2024 05:42, Kamil Konieczny wrote:
> Hi John.C.Harrison,
> On 2024-02-26 at 15:57:35 -0800, John.C.Harrison@Intel.com wrote:
>> From: johnharr <johnharr@invalid-email.com>
> ------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This do not match your s-o-b:
> John Harrison <John.C.Harrison@Intel.com>
>
> Please correct and resend, rest looks ok.
Hmm. Not sure where this keeps coming from!? It has happened a couple of 
times but mostly it all works fine.

John.

>
> Regards,
> Kamil
>
>> There is a w/a on MTL that prevents concurrent execution of multiple
>> processes on RCS and CCS. The 'spin-all-new' test is explicitly
>> testing such execution across all engines. So either the entire test
>> must be skipped on MTL or just the compute engine must be skipped. Do
>> the latter as that at least leaves some test coverage in place.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/intel/gem_spin_batch.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
>> index ec1458e35197..a0f35b23c718 100644
>> --- a/tests/intel/gem_spin_batch.c
>> +++ b/tests/intel/gem_spin_batch.c
>> @@ -214,6 +214,19 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
>>   	igt_waitchildren();
>>   }
>>   
>> +/*
>> + * Wa_14019159160:
>> + * An RCS/CCS workaround on MTL means that contexts from different address spaces
>> + * cannot run in parallel, they must be timesliced. However, a non-preemptible
>> + * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
>> + * across both RCS and CCS engines, one or other must be skipped for the test to
>> + * not hit a heartbeat timeout and be killed.
>> + */
>> +static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
>> +{
>> +	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
>> +}
>> +
>>   static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>>   #define PARALLEL_SPIN_NEW_CTX BIT(0)
>>   {
>> @@ -230,6 +243,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>>   		if (gem_engine_can_block_ggtt_binder(i915, e))
>>   			continue;
>>   
>> +		if (skip_bad_engine(i915, e))
>> +			continue;
>> +
>>   		if (flags & PARALLEL_SPIN_NEW_CTX)
>>   			ctx = intel_ctx_create(i915, &cfg);
>>   		ahnd = get_reloc_ahnd(i915, ctx->id);
>> -- 
>> 2.43.0
>>

