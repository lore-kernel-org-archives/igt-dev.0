Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC8CD37AC
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 17:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D810E076;
	Thu, 14 May 2026 17:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fL5NUkVc";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389710F2C9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 17:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRPg6v/zIn+T5DZ1NdXUm1WcazBbhZ+DVjV8B0Gflgw/XrHaJjBYflfQ0UPhPJ0URGZnGSe+Ksn18O3kV+2wmgExX/SyFXUsRjbY+bbtse3Jfk3okoP8herKd/WphxwpQighhLph3pt+eK/bddmEjbdShdEljtfn/lWU4O8bYV+bOE+GOSR2zaGkoKBPRVIbwhhJMyttVS0sW363KtKzwAdPv1irinhWGk9ZP4/3mdB5F1Qgpmitd5MwuHvIu5SYiFWbqG8IZ0kH4Gnz0IIcZ2xYuhGqAysRGRjorI1mClQIMLgns/IzGRs1qfjkXtwdFRGxGIfHjhG6l0d/nH0ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAbEtMySOnCTznwqR11nEorxjUbHGfTCCYqQTnzax74=;
 b=UwR8KW8ymMVpCJcaMWrhgbAxLtWBpmJPPvpAyS0UP7x4ocTsXxJWX2sPMUrY7S+D/Kz/gQAkNMyb0yjTrSV6I1+ZfxKwZPpT0VCiGSiTrTAVDvUWirkse1zB7jBZl5EMCoD27DeKkU11QZ182NJOgb1pvwksVFJAcKeg79RJP4/AL05oBodr4P4ScjD+wdx6W1rEqAf7bza//xc91piys45hpfMK4CM0aMVz9ra43Sf/WWHymybAXEEOq1yKVyzUP5ReFmybhkXGDUKziNkSmm52+Ndnedy+HjrB6XS0flIotKybFtn/wxvXCcRDSBcUM32SqUTCPrIjuRVUjOAOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAbEtMySOnCTznwqR11nEorxjUbHGfTCCYqQTnzax74=;
 b=fL5NUkVc/3/IcvVZtHwSMMKtBpgNtPxz2/uSxQn+v4wSU3hbnt16nSq25gPeYy/T+11qj/5RrrmCXuUblrqJ6YWWNC8EAZwkThkofpMVGM7RvdkSMhD+ubc3JP/lPr9X1iA9JSSa9Eh0aP+O60C9RiqcXts7Rjy5gomubfDiEvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 17:59:27 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:59:27 +0000
Content-Type: multipart/alternative;
 boundary="------------bYp0RGfOpzhuSH0HFxzDZmrw"
Message-ID: <9c091d16-5bb0-447d-9987-cfdf1a802a0b@amd.com>
Date: Thu, 14 May 2026 13:59:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: Add KFD IOCTL fuzzing test -
 Apologies for build failures
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <a243c8c9-7681-4633-a25a-2b01fa33a53a@amd.com>
 <20260514150617.d3jezd4ceun7lg46@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260514150617.d3jezd4ceun7lg46@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YQZPR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::28) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6820ca75-4558-49e5-0ce8-08deb1e28a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|4143699003|11063799003|8096899003|18002099003|56012099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: DZURGI4kAEI6LdeqkKzk65nEleP38/Pz2+u/0CTQURbo0h3cJioddZ1euWv8sBQ6jQogo8+ox9RBog79F9To+eeWb+I3HhBhycOfBkP+ELbpoPvh76TBULw/Uos7BKmJPaH8HY0BGW9ctJOG420mWydTmj9DCC3mJpNRR3VMRj43HsyTQk/YIL133+jPfgLYtEI/HTkAcQovqZcomIh4rCHPWnW3A9a0eG/9z+w14gfJAy9FwOdpuLo7aiv8FKgwISA0U34STr0lFvfjkL4OSnPZLVAD+5GA1BL+IYjuQgJSjfzxuM+CSNNAVy4MAvHIKRQH6WNmBpZzdaaoOCeMTEmASES76N2DsroUrOlC4EOvRtI9X61u37ub6TAF0ev5SelumAex/FYP2GN/yI3GAS51DvdYuGfon/NctdRlHJu8s4OcQyyaN4dONMpex2pBIQwcG0oeHXtrYwjjlR/sORVSA3vvUs4KZAuXhnejIKISOXXq/ahyNuxbKgxNA63OYm8GFdqKKgtHkZLgAXbDUgwjwVu2ZZafhGHCVqW5fhJ+3G+MGrwwuuz5v3jZCPGVRc2Fmg2jFhMecp0EZVqfAdvUSUqhk+7N+SKUc1CsxrQaak4lKs0w6wUZCHMTXshhDqeDy/T29Lgzh6mi1MzXZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799003)(8096899003)(18002099003)(56012099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5VanJWcnNjRVBOZGV0OXJlbWlHRCtQVi9OOGN3UFBZenplRjUwNGRMTk5L?=
 =?utf-8?B?ak0zR21lYWxBUVdXTzkwaVQ4V3UreEkrUnp1bU9Qd1V3c0JveTJMY2xyYlRM?=
 =?utf-8?B?Z1Zudkg4aDlBd3FRbU5CZ1FWeDhDVGNkWnV2WXJ0ZksxbUtsNHFnV21ZdVVt?=
 =?utf-8?B?bVdiR0d1UEtKTzduSVp6THg1OEJaZnRSc2FJV21kWjBrd0s0aUh2WkM2MzAx?=
 =?utf-8?B?MVhNcmllSGM1UVRXMzJTVUE3blpONE96eCthdmRHUWRnbVZVZVpnbE40Vkd3?=
 =?utf-8?B?b1VHV1JkOUZlVnpsYWJLTlIvZjV4SERUK1V1NTVEYlJPaXJBdDc2TW93SGx5?=
 =?utf-8?B?Tzl3bzlmSGV2L1g0WGhJL1dMM0k3YUdMTEpDczliMy8vbmZmbE5zdWtpRENC?=
 =?utf-8?B?MWZsWllUeDV3L0sybmUrVytEZWhVa1JTYmFXVFFxeE1pWU8rcHZmaHNmWWJE?=
 =?utf-8?B?K1NFR3hYRTBkWS9Lem1SenZVSGtIUGJmSFplTU5INzFxWWViSzd0MDJYUmVM?=
 =?utf-8?B?VWd1WnRNK21NT2tLVDZKL2hCdUZ5NDFuZy82UUlESEJraTlmeEo1bCtXN2JG?=
 =?utf-8?B?UjhISGVrNFJXUDRCV3R0aEYycUFOa3JNa0RJYk9UQVp2U2I4bE1oVkhRWUhX?=
 =?utf-8?B?N2llS29ZcExhZ3NxVklhMUNUTm9HTmhpNWtNV1dZVTBINW13OFc2THQ0S3pv?=
 =?utf-8?B?ZS9xVUlnY2JmYXVkVmZwRE9iWGNWZko4R2FuZzFPMTl2RVh4bS9iazBUeC9I?=
 =?utf-8?B?a0xucm9FZXhnaHJFS0w0ZVdpN0pUSE9Jc1ZQUDVUYUEyMThjbmpXU3MyNzh2?=
 =?utf-8?B?S3BiZVk4dWtpWU9xVHEybDZEeXd5QklFcTB0bldZS0RxWHlWZmpnVWdrNnNT?=
 =?utf-8?B?ZGVjRnNpYmMrYkRnTVFDRHBybktYSEl4ZERQL3NVY3Z0MEt1Sk9WVmRHVlNF?=
 =?utf-8?B?TXJ0L3BuS3B6MEh2Mi9UWG5GMjJ5Vmo1UmxuYWZselE0Sm9sYjluSnhUaGdn?=
 =?utf-8?B?dFJoWFhkRDd5ZTdXN0lIcTVtWmUyQ2Qrd0xUQVcrSEFqR0hYN1ZqMk9zMU4x?=
 =?utf-8?B?S0g2TFo0eXg5MW42UE9nM0RiYTF4Y254TUdHOHl3V21rT2Y5a3Y1eTcvNUNQ?=
 =?utf-8?B?bzhKSlJPMjF1YjdYTXJRMjRYb2dlbk0xZGpUZXJobU1iTHBwbW04REtNLzdD?=
 =?utf-8?B?TDZOS2VMTXZFc1hJcVRtWFJIbE5TaXlnZFIyRm1mZEQ4eTZIMUZGS2hRT0Z0?=
 =?utf-8?B?YXV5d3ZyaWd6M29nWHJqNUpUT284R0pDdnVxU091TnFwSlFtYmx2c00rQVRl?=
 =?utf-8?B?ZWRmaG4wNkJPU01FamJQTzVsbE5rRlFZMWJPRndqRTVaZUEzQWVwb1VZSFh3?=
 =?utf-8?B?OENLWXF3VjJwb0tDNmZEaERmMTlnM1owZmQ0RFY5VFBqU2RrbXpCN2VJbmlR?=
 =?utf-8?B?QkZBN2lZUnIrQ25hRHNwemlma25tTFNGdlpnUFJrVzU2QlhyOEZEZmNUeEhT?=
 =?utf-8?B?QWp3Mk1Od3VhdXJCTTRnOGQ0MWRGTEFaMHlsU0huSnNxMFFYRXZPNHhteUNF?=
 =?utf-8?B?U01FdmZobm9JakVRY2NRU0NZSTlmOFhOUitPekxxTUNhK2o0M3ZlOW85bnRq?=
 =?utf-8?B?bDExQkdFU1hCRnNhMkpiNUhhMlhXTldKOEhEOHh1NjgyMHl4eWhkWWJHcGpP?=
 =?utf-8?B?REZnY1ZoWjQ2M2pPbFptWlp2UlpHanRma3FHWDZzTEs2Wk4zVnpyNFlSYnJN?=
 =?utf-8?B?U2oyQUsxWVVFbHdJU3NQTjRsWmREb0lYbmhKWGVYTlQ0cHVuTUZ6aXptTWZm?=
 =?utf-8?B?U3VhSmRCTDMzWCtUTUlqNWh2RitQejJlaTRKYmZmbzd5UWQva0hMVE9VK0Rl?=
 =?utf-8?B?eHRYVmpqN3h3MmZseHZndmEzaWxvbnV4c1JhMWpvMnIrUFUyNHRFejBoVm1z?=
 =?utf-8?B?TmQ0VVJwL2duU2lIa0oyS3ZxS2JjK0x6QVkrWUhKYkZCZDFuYUFKVFIzbWtu?=
 =?utf-8?B?T0FFdExQbHNkYTg1aTBzZGRZM1BGWXM0OHFtK1JXNnNjb0dPWVYxaU92VVIx?=
 =?utf-8?B?S3RBUHoyOGlXNlUzdGEvc1pWS3FEWlJZU2U5T0NnWE8rZUhTZnVCR0F1YWlI?=
 =?utf-8?B?K1ljbW9OYUN3TDlKTkJkY2dVcHlyR3VyZXUxcHduaCs3c1lLZ1IrdFE2YXli?=
 =?utf-8?B?RVhoYktLSVJyODNjSUt1SUtORjY2YmE3U3ZrTFBOSG53S2lKQXA0MUNxa1px?=
 =?utf-8?B?dFYrTkxwZ09jcmM1d3ZLZEZhNDAzaUtSZTV6bmlKR1VJSFpKWkNBMjVQRjJG?=
 =?utf-8?B?QUlaTmRUZ2Y1cWxDZVFYN2xtME9xWjJaMllhcU9FbFAwVTFBQTlqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6820ca75-4558-49e5-0ce8-08deb1e28a53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 17:59:27.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNRHmRZVl8tpyrml57hMZFIKeE/Atjt3DMCdoHsLV6FAw5HxTt0ppiT/0IlIyhdal271TLi7V87cn3FIQ/ON4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
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

--------------bYp0RGfOpzhuSH0HFxzDZmrw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,
Thank you so much for your explanation!
I spent quite some time searching the interface for those build results, copying and investigating links, and honestly started feeling a bit foolish for not being able to find the compilation status. It is a big relief to know that this feature is simply temporarily disabled at the moment due to the GitLab upgrade.
Regarding your previous response about the filtering mechanics — I haven't forgotten about it. I will review and reply to that topic as soon as I am back working on this specific task.
Thanks again for your time and help!
Best regards,
Vitaly


On 2026-05-14 11:06, Kamil Konieczny wrote:
> Hi vitaly,
> On 2026-05-07 at 00:08:18 -0400, vitaly prosyak wrote:
>> Hi Kamil,
>>
>> I apologize for the build failures in my recent amd_fuzzing_kfd patch series and the need for 3 additional fixup patches to address ARM cross-compilation issues.
>>
>> The failures were due to:
>> 1. Missing drm/drm.h include dependency on some systems
>> 2. Incomplete KFD IOCTL struct definitions on ARM (forward declarations only)
>> 3. KFD being x86/x86_64 specific (AMD GPUs not supported on ARM)
>>
>> I've now submitted fixes that:
>> - Add proper header dependencies and guards
>> - Restrict KFD tests to x86/x86_64 architectures only in meson.build
>> - Follow the same pattern as amd_kfd_dmabuf_unload.c
>>
>> I'm curious - is there a way to see build failure results from patchwork.freedesktop.org before patches are merged? I couldn't find build status information on the patchwork interface, but I'd like to catch these issues earlier in the future. If you could point me to where CI build results are posted, I would greatly appreciate it.
>>
>> Sorry again for the extra churn, and thank you for maintaining IGT!
>>
>> Best regards,
>> Vitaly 
>>
> I will talk with our CI, I hope they could reintroduce compilation
> step for different arch like armhf or arm64. We had pipeline
> with builds but that was disabled during recent GitLab upgrade,
> when no GitLab repos were available.
>
> Regards,
> Kamil
>
> PS. for reference how it was before:
> https://patchwork.freedesktop.org/series/138642/
> with status line from GitLab.Pipeline
>
--------------bYp0RGfOpzhuSH0HFxzDZmrw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBhAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil,<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBxAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thank
      you so much for your explanation!<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAICBAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I
      spent quite some time searching the interface for those build
      results, copying and investigating links, and honestly started
      feeling a bit foolish for not being able to find the compilation
      status. It is a big relief to know that this feature is simply
      temporarily disabled at the moment due to the GitLab upgrade.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAICRAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Regarding
      your previous response about the filtering mechanics — I haven't
      forgotten about it. I will review and reply to that topic as soon
      as I am back working on this specific task.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIChAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thanks
      again for your time and help!<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAICxAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Best
      regards,<br data-sfc-root="c" data-sfc-pl="|[]" data-sfc-cb="" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">
      Vitaly<span><br>
      </span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAICxAA" data-complete="true" data-processed="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><br>
      <span></span></div>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-05-14 11:06, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260514150617.d3jezd4ceun7lg46@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi vitaly,
On 2026-05-07 at 00:08:18 -0400, vitaly prosyak wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Kamil,

I apologize for the build failures in my recent amd_fuzzing_kfd patch series and the need for 3 additional fixup patches to address ARM cross-compilation issues.

The failures were due to:
1. Missing drm/drm.h include dependency on some systems
2. Incomplete KFD IOCTL struct definitions on ARM (forward declarations only)
3. KFD being x86/x86_64 specific (AMD GPUs not supported on ARM)

I've now submitted fixes that:
- Add proper header dependencies and guards
- Restrict KFD tests to x86/x86_64 architectures only in meson.build
- Follow the same pattern as amd_kfd_dmabuf_unload.c

I'm curious - is there a way to see build failure results from patchwork.freedesktop.org before patches are merged? I couldn't find build status information on the patchwork interface, but I'd like to catch these issues earlier in the future. If you could point me to where CI build results are posted, I would greatly appreciate it.

Sorry again for the extra churn, and thank you for maintaining IGT!

Best regards,
Vitaly&nbsp;

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I will talk with our CI, I hope they could reintroduce compilation
step for different arch like armhf or arm64. We had pipeline
with builds but that was disabled during recent GitLab upgrade,
when no GitLab repos were available.

Regards,
Kamil

PS. for reference how it was before:
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/138642/">https://patchwork.freedesktop.org/series/138642/</a>
with status line from GitLab.Pipeline

</pre>
    </blockquote>
  </body>
</html>

--------------bYp0RGfOpzhuSH0HFxzDZmrw--
