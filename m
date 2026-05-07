Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B44ECD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 20:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148A510F222;
	Thu,  7 May 2026 20:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIMsHaPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ABF10F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778184717; x=1809720717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mk1XooRCgCNOAduBgdbzaM7vyK17Azsi/WSPR1kTmww=;
 b=fIMsHaPL+UJ+H2H8b+ujty6ctXhBjYUVuhghdYDe+GufhN8PJPDsphhT
 2Cy/Ck7Cu6j4WSPFGXd/7iw0XZsPw0f2muoNoZc1Lnr22Fq3kcTNP8Rkp
 EvD9Y9bec8+peq8Uo9Xobj6L4ISMrOzYUxidFi+fFoh9tzjaR1gT5kVMk
 1YGmWynrhbgaiQ/R+5d87T39L4ou0E34ZpvmKpb+PdCPzZxQlfC0oCAbY
 CMoME9FcO+dtZiwY6dITge3b1Ope+y7NEQ6VRdqB0jJhEuBkbKwSExNYl
 xVbg9WHyhIUI07Sk21f9uC1aRTVBT8E02IcBI99HhQ2BS+aZSLJqbX8PT w==;
X-CSE-ConnectionGUID: +GawtJ3YREKlx/NKEl5cmg==
X-CSE-MsgGUID: jO7nmP+CS3+AlvGw/z3Wiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79257445"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79257445"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:11:57 -0700
X-CSE-ConnectionGUID: beY7J1auSOC6vpWXbu5u0A==
X-CSE-MsgGUID: w5I+W3RpSPurIJGMR7DBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="260006304"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:11:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:11:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 13:11:56 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3qTKqDiFpSyj7lgziZgsRUmEgBkq5l+GOYAnqFMXH6oDNBwDV0qRx8tENy3ByMuZIm+c1SWhOeCHyh9y/OiQjd2L5w3umhDgIZwknnTdF8wSOlgYdjVjZZZgeoRnJP+f3PoX/DiOi40HJ1TrC660HZdC0r8SONaJIBqyrdZbjV7lhEkHH+8Okir+uG8r/wOyq1NyUuOD1Rr77Z12R90SKJ4bWB14kaTyJHPIOLrdnD6ffurJxwCn/IN4FNYjReFa/tA7IqsUSGlDOmaIljqdGhuOTo4Ch/aYELHPD1nTmrbg+tFnYqBv1oRdM7LaMfvZ5az0+vNMLSLMBsARkPBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6xGD+hPoEZ/DFPtrLAZ9dm2GCk5YPiZl93dJDIozHQ=;
 b=dnvQf73fO52+fY0Vyp3DKvHASaNAik+vxj5kHpAoKnSJvd20/poYoHiHGgGcKXj9hONxE/z/8BxwG2PKUQ6F1K0VWn+lfB8ZoLEvJWhQPLtTZoHEtqfT9943HmigZnD7W5Pf1pAv4hdnkeM5ibslUaDkQKsOWfe+rRCXFMGmZyZcjAhxaX+ruwK/7oVzPtmKBZxh7FH7OzrmWkrGhvw9dJhbvy1Zb8LQTr4GF8e0+l5V2RPMfe3Y0bvEdWgp8qtzWROjyo4FkFQ+LzAcB7UaAfPzL+flQ44kC6py0HFptPrZUvdkYG1W6Ahq8omLyQY8Yyu4jNMSELwcibYRuM6o0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:11:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 20:11:54 +0000
Date: Thu, 7 May 2026 13:11:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] tests/intel/xe_exec_reset: Add multi-queue long spin
 tests
Message-ID: <afzyB8qbkY8_1yNi@nvishwa1-desk>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-8-niranjana.vishwanathapura@intel.com>
 <130b948c986be91a0bf7be181d213fcd74245a51.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <130b948c986be91a0bf7be181d213fcd74245a51.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df6c813-02d0-47a2-6d72-08deac74e213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: dC9Y8GTPPAl2yOjh0BNVizA7RrgyEIYEPVvKHukYZRp483slh8oO+Xyd+L+zFiDG5WgHvUCz6635TIP2oiWnf3DEx1zCuU1EIO6KOvjjaGo4Am4825UZvj77czxzYKoDYfcx5FcsJwVoFSfNqRfKMgzmT05X1625qxoY1Xdc3dN9579lgWyqXzH2ViA0VBu9EwK/LuXlTl92/auJ1TcOd8cmuVMcw9EJEc7JmQFWrugooE4jl4uPAAQycIV33XWs696vQjqTuc6wH++QgdU0tLngQBHT8qIk5U2syIrTV3JCehqb8pQBlsKlAtyWfcsN9QAoKvdHYTb38/PqGIyqBbZBZeGSw7EFU1gddw8wpGss2cjkec8wCeCB9V3StI5QmvdPlN4rc4EntZS3fI1N1bVUkZweX/0a/lfdusZpTlwZPVb3SuJ8hmLIJjBm/1a0Q/wJQAiYvT7MRHwnFGbhfleVD3mioP0MuEiaoGrjkCEb/4kb/t4H6nuiw6ecV5PpaMUSk5li8QUCRuixG7q/2olAcrun/y0ljDtry+PJ9aGj3yVenkncz1JFTkbBgyUymWG9285is5p2+xu+XbhwhaZvAWNI+EDSoTDX+12AMNQ2kklOFqO5q6sKYvtYX/7Qi/5bOv8lJM1OJhoAEOqcxR9DSwJJazampAISWLdkTqDK7gfR5N/5xpIT0nl9n4Xo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hYcFRIVYxz37goR1IK3bVvBGhRb0WVx56FxuBj3Y1MIkTwUVYT5Hsv1tji?=
 =?iso-8859-1?Q?HADhhiRB9CzkII61ey7SzG5PNzYI9gE8qxHwJIWPoUPalkRnRgFlTslHGI?=
 =?iso-8859-1?Q?DphQbO54aoFPcnjuAi0ZdsG3H9oN9kI83wWH8VYVvE87fyW4zZ617s/CY1?=
 =?iso-8859-1?Q?YXoVdvYsGT1ODoqD9mXy+k0GlpxdpA6a9WzLosaTHdqwqaG8+pU6dvAw2L?=
 =?iso-8859-1?Q?6qJFkYveZaLqp/Tqg/tADM4u09h9Liaz+KnQ8dv0qjt7RU9vwxx43ywQph?=
 =?iso-8859-1?Q?2sqcv2zTwrgncPt7uHJpXSkFNuXRCvx+QQEit41SMgXhoqDE18miAOFrdT?=
 =?iso-8859-1?Q?/ZiznaIKHebeECvPU5Ai/C265MpGj61t98l+WMqDGyhgvIaGwGFUe2cOV2?=
 =?iso-8859-1?Q?HNBcfK0/EecvtjRiArlqTfy8stc3zpbLQxOc1rCwZfCY57RD6liG4spcuU?=
 =?iso-8859-1?Q?/ISQm1JIsukGPB7DitRKxkgOJYbcZrCRP/6owWVz178DtfooDz1O2BWf6u?=
 =?iso-8859-1?Q?ukzDzx3XSGAP5NOvLhk9rihbnxJjMNvBh1y/xC/vm2ZPRsQhVh2HzJZ7Vz?=
 =?iso-8859-1?Q?YgVkf9AEGgZAda7Js70jXhYRQzPcK0r1hfRO+swoSbHnL5Ocx7Tj02dMbD?=
 =?iso-8859-1?Q?HlFDHZG66b4R/pMikBVQtGHZVxuKjT90J175s6kkUJF1ftFaYQAM+8zRI7?=
 =?iso-8859-1?Q?N1tUcMjDQTIF6qTK8xFSBV0APSc1ZQY81rmK4qnPeahNge/8VJFMYu44Oa?=
 =?iso-8859-1?Q?kz+iEechlkv0yiJHipECDeXI6OVDwTpGS4PeSh9jKkj0R7UtunwASueeTv?=
 =?iso-8859-1?Q?UMAGLCCnbq+ppOIWWeCWOVRBxBIRgj5rNNk7v/FfR4ABgMHMsKhGvOJOsO?=
 =?iso-8859-1?Q?H4h10a8l+NO9seR/OpMyOZY9C/QQhDhoUrek13S639iH2E0Z3niVOIkyyi?=
 =?iso-8859-1?Q?LoYRoKae5/Oh4BKGExEUfdJgPMA8iHbPeFlhzIRywkvsXpQwX/+Gdyf4aa?=
 =?iso-8859-1?Q?nbloWGtk7irLxjI5HSQckR3yAXL9j1ujuvi5jGFlu1UB4H+K/DbdsJ8FiJ?=
 =?iso-8859-1?Q?VFkyoAmGktfnVfLlDaQbH+fZhDLcgCX5XFx+wXp23gcnaHAYm5qUrGsXu8?=
 =?iso-8859-1?Q?/9h5oAxxk7cBTGC6nKQ/Q9E/npa8An4ooLwYvhHkGRd8vpksmzVsTVJi3y?=
 =?iso-8859-1?Q?98kc2zjQk+uBaoUDpcst9jhrXX6Mc7aPFeJhZ+GqKaiD4CHjJNyvKc9/Bv?=
 =?iso-8859-1?Q?StVhVuOdoEOBlnQNISziv32QfoJsD8lcx7Rv6WW9vqoE6r2MFA9Es9kaZy?=
 =?iso-8859-1?Q?1EpEaTj6+UFIl9fulBE1U3oPJzyE99AY+bSXimnJdIurfMIf+cyf8Xnw+7?=
 =?iso-8859-1?Q?0LsAQg1VSSqQVdw5rebqag5o9W/xdeAy5itni18KEXt0sUeScSEsv937FW?=
 =?iso-8859-1?Q?CP7kih+hhvnz6IVHplx1PXxFIiJwoKn1aWOUfxpyejXnIsPh98mbcamqI7?=
 =?iso-8859-1?Q?rBHBR4gj59Dr3/YO+NbJmxRyDnRBLmXCahaySqEVNDuWhgfse6LvsGL22/?=
 =?iso-8859-1?Q?wZBRq2RubEzzA65zPZqMOPPYO9S2Rjjpv90/Ya1wZo+zGo/3m2RBG2Nt53?=
 =?iso-8859-1?Q?P6bR5WRMF4sGebfVvbB+v4jyA0WodVdTAQVcz0IjrM28p5+y0v35O+g/+4?=
 =?iso-8859-1?Q?dl9uZj8LgrpSB7TSype0eWsp1MFoMeECK0HIlbvcErAVdWDZ8CqdpW6xqH?=
 =?iso-8859-1?Q?+cxj3a9hmzwuioQKCqPrHPA21jSxSdX621jgHmuw1g3sShAoqGqK573sLN?=
 =?iso-8859-1?Q?GzhbMG2VDpwXu2Uge+xRktOm+dp2ICxcXYbQD/9ECtkD6BIDcJSY?=
X-Exchange-RoutingPolicyChecked: Y6QUHS3sjQ4tENCtkg4EUZ+MQYyeOWSO103QVr56dlRLx9YzZSEbY+BNU1e2LB5yjbx4N+leHOFulJT3eL9E89Pm6m1a0b51JMIMPFH4SwQVlhmvNqguzf4J1qVH3+l3G83XjtdMfdAXiEfk7IaECDPWUo/ARlmZuJOAxaU089v7qKZO1LjOE7tGjWNnxQmqOvX6y/HoEMKGzUUx/RtXpuKsVhaYGM1K79y/k3jPPL3izdgY7qMVtnJZXXQ56Su5gJbaUZvHUdiTels7g98+98ADc3JsfZZcUGi14/ZdtmBwEA3nFsDn3yITut/rG3AAROWaz1J7HXsBqrwJXWrzLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df6c813-02d0-47a2-6d72-08deac74e213
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:11:54.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT4Fbtb+m3uXrQPmCbKYi4lfApUlenrtPJeVDGftSs/cz4J7vwOxH0EBY1T8lK5Cx58k00vrrOB1LvhI/jhmNuj3LCLYpQa3RrLH2V4WyqUgUBbtvyxO0pQ2VISBEe1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
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

On Thu, May 07, 2026 at 12:37:23PM -0700, Summers, Stuart wrote:
>On Wed, 2026-05-06 at 11:31 -0700, Niranjana Vishwanathapura wrote:
>> From: gta <gta@DUT4637NVLP.fm.intel.com>
>>
>> Add the following multi-queue tests and update xe_legacy_test_mode()
>> function to use queue_timestamp and multi_queue_switch spinner
>> options
>> for the multi-queue scenarios.
>>
>> multi-queue-long-spin-many-preempt
>> multi-queue-long-spin-reuse-many-preempt
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  lib/xe/xe_legacy.c          |  2 ++
>>  tests/intel/xe_exec_reset.c | 17 +++++++++++++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>> index f9bd5bcb61..b7054756cd 100644
>> --- a/lib/xe/xe_legacy.c
>> +++ b/lib/xe/xe_legacy.c
>> @@ -67,6 +67,8 @@ xe_legacy_test_mode(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         } *data;
>>         struct xe_spin_opts spin_opts = {
>>                 .preempt = flags & PREEMPT,
>> +               .multi_queue_switch = flags & MULTI_QUEUE,
>> +               .use_queue_timestamp = flags & MULTI_QUEUE,
>>  #define THREE_SEC      (3 * 1000000000ull)
>>                 .ctx_ticks = flags & LONG_SPIN ?
>>                         xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
>> diff --git a/tests/intel/xe_exec_reset.c
>> b/tests/intel/xe_exec_reset.c
>> index a3cf290abf..f7ae94a424 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -1179,6 +1179,23 @@ int igt_main()
>>                                           MULTI_QUEUE);
>>         }
>>  
>> +       igt_subtest("multi-queue-long-spin-many-preempt")
>
>These need to be documented now. The existing non-multi queue tests
>talk about preemption being the deciding factor in ensuring we aren't
>getting engine resets. So here would be nice to call out lite restore
>explicitly.
>
>Other than documentation the changes look good.
>

Sure, will add.

Niranjana

>Thanks,
>Stuart
>
>> +               xe_for_each_multi_queue_engine(fd, hwe) {
>> +                       xe_legacy_test_mode(fd, hwe, 4, 8,
>> +                                           LONG_SPIN | MULTI_QUEUE,
>> +                                           LEGACY_MODE_ADDR, false);
>> +                       break;
>> +               }
>> +
>> +       igt_subtest("multi-queue-long-spin-reuse-many-preempt")
>> +               xe_for_each_multi_queue_engine(fd, hwe) {
>> +                       xe_legacy_test_mode(fd, hwe, 4, 8,
>> +                                           LONG_SPIN | MULTI_QUEUE |
>> +                                           LONG_SPIN_REUSE_QUEUE,
>> +                                           LEGACY_MODE_ADDR, false);
>> +                       break;
>> +               }
>> +
>>         igt_fixture()
>>                 drm_close_driver(fd);
>>  }
>
