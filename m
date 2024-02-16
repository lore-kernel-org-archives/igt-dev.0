Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA467C4829E
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 01:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0910E38B;
	Fri, 16 Feb 2024 01:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8mjDsgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C571A10E38B
 for <IGT-Dev@lists.freedesktop.org>; Fri, 16 Feb 2024 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708047227; x=1739583227;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s7uETrwbvCA0FVHWWtdjACclxiEajhKg+cPqpfsV31A=;
 b=P8mjDsgDbKp40PYZPmCRwpGf1NZZzfEDJUCiRZ87GUMVkBZiD/XH/Yna
 80tT4H1SCjyJsEoM776P4i++yFePy9hHDi178uRSX2zDsNYXhzhcKHvIE
 UhdTaNnFRo/rA3px3LDheOBM9H38GmKgvz8qTAkFW8/rL/h+yLtsG5cR3
 A3VVrew5GuC0ASEOVDCkKUFgR9N/e7YeDsXgxVjiB3yVRW7futN3D3Crm
 NvXwfv9I8xBHnhhW2/zKQ7+aGcIi4iuFMN7yzhGLyXC5DZEwJZV5lvR4E
 7//pmxKyUQY5ovO7KvuoeoZ8Corx1ARNyMczmMqo34FTX3fC4lnkTpY+b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2309754"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2309754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 17:33:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3679768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 17:33:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 17:33:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 17:33:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 17:33:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 17:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jawb242rcX3AJrNhF+9GfT66A9F66MrBavXRkwr/7zp1tWCmk83h7u5kjVHhauy0joYs9og10tp8lPDoNvk2u5+YPSX4b0UXC+KZ1OryTbnABWQRnGw6qnmcotWXLaruANxUz9HgGs66hppNnRZ15GgamowKtmsso37Ch/uyeAkOnR7lR0r37x3gSn6fpRYzyNE1NK1KE51mJ62d2tD2bLNBfOxaWZ7RTmRwkSjNV1w3YUj6ReM/dK327DksgOKwCSRwSsgOV6n49wNgavEJ8n+fEmghPUSeFe3ChsVkwwAB/uUNq7oISxNB1cpLIHXNifQm6HHovoSNfoQZ+DaQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY4D+Zs+sREpRqJ2P+3426MDgRGw5vzcRBwwK2y4s/8=;
 b=Bs3mFJKTooMZuvcPdK62C7gYk34LWUpymZPfohq55Ood6nqOn1uSbjaRbY8q7yc1o6FWUII0JbPBp/2cTd2/dqgXkbW9Q9jPbQtF9voMuLU9pm8InwUnKyB23ykPnXGcSL0mIaQ9aJtEG64rpsWADENzQBwe5GizNwoxvDua/x+W53jP0v60gLbO9iiTsoSvPx8xW/4QR+oEhPgBLpb3sPCj562+JUIGg6hEq+bXklZ6l54PJgh1ygeR+sgS7/ox7fTHxL80oCiMxHDnKAfUGfYvHdeW5af43w64zbUn/JynP2YWI53SvjouD9qG3qeWx/XOOLDt4QFfYjx5E2Cgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Fri, 16 Feb
 2024 01:33:42 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 01:33:42 +0000
Message-ID: <addb89bd-2c2a-43a9-8492-ca541b48de33@intel.com>
Date: Thu, 15 Feb 2024 17:33:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/gem_watchdog: Reduced timeouts for
 worst case scenario
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <IGT-Dev@Lists.FreeDesktop.Org>
References: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
 <fc965672-a30a-4f5a-98af-2cdab1f53153@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fc965672-a30a-4f5a-98af-2cdab1f53153@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d03721f-ec96-40be-9996-08dc2e8f4ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DpUcXMOqtPFWFsz4oHqurMdd2NzWzMfV6+0iAhAMCoCM6E2Edl7j9yzrmsI/ADNLg5YXMXYY7NUHUuPzfsCtWIu9e2grZ2mM8+CwWM3A4Ar6+ba3y/kaFMr5gvzey2WAVVeulvA4jxmf9RX5pUvpYR23DXIi+7/UPuGlepB5FEM+oZmHaUOB9RSV7fihSL5kqbHOnzYfr5GHsIIbu6LTKt+GfnnAiWAulHwr+WnMqbeucTEw/c8n/qap7gxb0iWKZKCp/Ir/BpXUS3099ug/UH9E5cTI50sHWILg7Z/QndHEIXaPHw+pWjydc3EW5BTJX/ftY8BaUeJZbgYnNhT1HtIsoMa0t8bzZLQxFvTgsKAMphClrjqmZyzFuNAnhZ9hvZ6oz/i8EV07csvxlQRtGgEc/aKZOsOApwNjOcXLCmNG0n47RrMoIpvOELF3JvgyLQ2I/Uofv6C/wjPEHjjMYoG97IkuE7DxKwdNDxyTH/8T4E7pAKQS6DNSlsBc+Pv+ZdQSx5JitdFaBWBg/DX7VNrULUFm3UcGhr3W8JdAsdg+YxyXrBmH16sybXGsVVrR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(2906002)(66946007)(316002)(6512007)(478600001)(6506007)(26005)(6486002)(6666004)(2616005)(66556008)(66476007)(8936002)(8676002)(53546011)(41300700001)(83380400001)(86362001)(31686004)(38100700002)(36756003)(31696002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlqM21icTZGMDRhUlVWS3czeUpHS1JGb1Q0MWtsQUJvWDRrVWJrSkJQWlRt?=
 =?utf-8?B?MlpzT2NxazBrQmtsdE5pdGJWakxOZUhhQWFLTFRibDh5Nmw3MGdpSDVnZGc1?=
 =?utf-8?B?d1RDR3RzdGZXTm5KcDUxSnNpNFY3YU9ZWjNGSFAxQVB1VVozTENydG03cVRL?=
 =?utf-8?B?OGJ4blY0cElURW9yZnRMUVJ3SnVsRDFGUTJNNFpGQjFGNElEUDRjMTh2eWxC?=
 =?utf-8?B?LzIzQUt2MjVRS2lmcFZVOHV2TnpqNXdoUVhibnFYczZmWEt6Yzk4aEU4NEpq?=
 =?utf-8?B?ZXVUcVVnTGozdU0yYmkvN1R1eldPQW41V2krNUZscGVNMjFDQWV4UzNZTmZF?=
 =?utf-8?B?K2Vjb2RrQlYvZlphSWtRazN2TlBvdlRuZWRZdG5tL2g3aVFSWHVXTGFZMUV3?=
 =?utf-8?B?VWJ0ZXlQL2duK1hKZGE4bVhLaldrWEUzSGgzQnpNT1dhWEo0b2hWVTdrSVlL?=
 =?utf-8?B?TXViN003VHUvT3dpM1BJOE9SbVRWMUhVRlRKS293ZUMrdjA3Rk4xTnhvazl0?=
 =?utf-8?B?SHVKNlIyRktWcHUvR3JPYWZzZ3RVM0dWdTFOY1g4akUxelJjaGI1a1JHenpL?=
 =?utf-8?B?ZjJsbFZlVEp6R2pYek9qOWxqK1RkZnNndHR5UjlkMVFydWpIM0dGazJqSVJ2?=
 =?utf-8?B?bzBMRmVrQmtNQ0pFcmhJd0JlS0E5TmovQkVKRWtRZ2ZuYXhyR3N6RnBCSjY0?=
 =?utf-8?B?eHNQejZVQ05GRlN5Z3QvS2ErU3pJa2trOHhFam9vazhkZXYzVDROUG42Ymdr?=
 =?utf-8?B?WThRTUN6SVZXZGFUKzBMT0lVelhoa1A3bE1DamRFcUtMV0VPZ1hLNll4c3kr?=
 =?utf-8?B?QlJTTXpmSEZJWlJiKzM4QnVVMXNMeDhxMkhGQ0RCL2hNNzlHeXFHaytoNkVh?=
 =?utf-8?B?MklyYnJjN3JYWTdkenBjVkJvWXZQR3pBa3ozTFJWQ3Rqb2lETlBreW40NGtD?=
 =?utf-8?B?V3VacTJkOGdMcDlLcEhiUnJhZnBJMStySzQzeWs3ZVYzenMwQk01UU9LMTgx?=
 =?utf-8?B?YmdOUkVGcnFnaFk3OVJycXlCTSs2dUh4eENaZWRXNkpRZjV5TFlKYzVQSi82?=
 =?utf-8?B?bDBnUHYzYzFDNitONVhjRHVWcWZYd1ZsaU9EVXlmL2kycHJSaU5yTjdYVTlm?=
 =?utf-8?B?ODI3NkFvNENqa05xeW42UUU0bS8rZm9kZVFiSzhqRTlQRG1SOHVrQ3BLRzVH?=
 =?utf-8?B?eWUvWTBUMVZmRnR2S1ZOMmFlcktGVTdIay90M2xGYWp6NzZtQXFhWGhLaG10?=
 =?utf-8?B?ekt0d3ExUS84UVFhMjJFUVB5Y2dhQ3hFcTFhdzZYNmNyZ2dMRWhWTkZhUVNz?=
 =?utf-8?B?bTVzQ0lzUW94QXVlS2x1R0xaZHNrVldnZEwvanF6emJ5K3d1YjYvMythTnU1?=
 =?utf-8?B?UWxRSHVSaXJQUkFVWmh6TDFZa2VydFlQRmhYazBVZGt2M3N0QWdsd0gyS2Zl?=
 =?utf-8?B?VkFUeUdSY0JkbmpvVlgxcVdzbEw5WlBWczVnRzZPRi9pTWNLUUJHOVFJdVRq?=
 =?utf-8?B?a0gySUE4WlN4Q1pNc0RoT3hyYXlEMVFMYTJLWXdZcEhDWFc4dFVMTEdBZFVu?=
 =?utf-8?B?a2IvS2RHNlVaQmI2dGg2eG5YakVmcFVleHBwbEllVEV2Z0xMa2M0Y1hrV2kr?=
 =?utf-8?B?SjIyOVYrOGI1Q3VrNTg1bDhJZlJQK0ZmbmQxcVBzQmFHMEx6VGlya3BFUUFu?=
 =?utf-8?B?TjYwNWE4bGZkQ2hucXZ0S1JYc3dWYlFmbFYxaGhCaE9hdUYwc25mNGpsNzhv?=
 =?utf-8?B?YitwRXNPZnNqcHUzOEZjS2l1cTRjeWlvWDV1WUxrWGlaWW9ZNjNQNGRBTjRI?=
 =?utf-8?B?T3NDWXc4UCtuSGpDRlZoQ3Ric0xnNkUxUHgraXp0dDlrTUdHWjB5NUFTeWwr?=
 =?utf-8?B?b2szRVVLZzIyVmdKNXRLa1JCUXgyNDlvL3RoOTJQNTFrQzgrRTF6SmFWOHBj?=
 =?utf-8?B?aUpXRGZuZSs3K3ZEZURjUjdwZ2ZPY0J2Uy9PTjdKWi8vOGdEanVuZm1vQzJ6?=
 =?utf-8?B?WUNDQWU3OVpWeUt1djk2Y0VBeGZiOEtCRHppVkY5ZVI2bEFxRmdVT21zMTRX?=
 =?utf-8?B?MDNDVGduaUN4c0Z3UU1vcVM4THpPZTZzTUpuVHlXQnpGSWNmUkRsT0pUazNN?=
 =?utf-8?B?dnBWWTM1aEtORlc1OWUrK1gzWU8vTmRNSTZNeTR5S2g5OFJsM1BhWU84cnVH?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d03721f-ec96-40be-9996-08dc2e8f4ee9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 01:33:42.0580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIMtFR1vNz/LkcDpfar13e5DQvtk2jWt3xsLvR1Ca3RG4AXPuUEDXtrdZPzkU9D3PBpOyXiyDfSZv6MWH0VxjMBExwS3jrfgtMrBuVPHIbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On 2/13/2024 01:34, Tvrtko Ursulin wrote:
> On 12/02/2024 21:23, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The watchdog test reduces the watchdog timer from 20s to 1s and then
>> uses a 5s timeout waiting for the watchdog to do its stuff. This works
>> fine in general, but if an engine reset is required by a context that
>> is actually dead for real then a pre-emption timeout must be factored
>> in. For RCS/CCS engines, that timeout is 7.5 seconds by default. Thus,
>> the test timeout expires first and the test fails.
>>
>> Normally, the system is not so dead when running this test as to
>> require an engine reset. A simple pre-emption works fine for the
>> spinner contexts that is uses. However, there is a hardware workaround
>> coming which prevents context switches when both RCS and CCS are busy.
>>
>> So add an explicit override of the pre-emption timeout as well as the
>> watchdog timeout. That will allow the test to keep working after the
>> new w/a lands.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/intel/gem_watchdog.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
>> index 1e4c350214c0..c9dd0deb51aa 100644
>> --- a/tests/intel/gem_watchdog.c
>> +++ b/tests/intel/gem_watchdog.c
>> @@ -577,6 +577,16 @@ igt_main
>>             i915 = drm_reopen_driver(i915); /* Apply modparam. */
>>           ctx = intel_ctx_create_all_physical(i915);
>> +
>> +        for_each_ctx_engine(i915, ctx, e) {
>> +            /*
>> +             * Context termination by watchdog may require an engine 
>> reset. That only
>> +             * occurs after a pre-emption attempt has expired. For 
>> RCS/CCS engines,
>> +             * the pre-emption timeout is longer than this test is 
>> wanting to wait.
>> +             * So reduce that timeout in addition to the watchdog 
>> timeout itself.
>> +             */
>> +            gem_engine_property_printf(i915, e->name, 
>> "preempt_timeout_ms", "%d", 640);
>> +        }
>
> Restore at test exit for subsequent tests to be in a known environment?
IGT actually does the reverse. Part of the framework initialisation is 
to forcibly reset all the sysfs parameters to the official defaults (as 
exposed via the .default sysfs files). So in general, the tests don't 
bother trying to preserve such values.

John.

>
> Regards,
>
> Tvrtko
>
>>       }
>>         igt_subtest_group {

