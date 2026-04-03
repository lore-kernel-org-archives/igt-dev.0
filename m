Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AF5D730AC
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17E310F2D6;
	Fri,  3 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASqNwiGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A8D89453
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775199615; x=1806735615;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LNC4KnNbe8hyAVYl1bD1SmP2CsYYskIlSMkYAYTkT2k=;
 b=ASqNwiGpw9Ag6HLMeesjv/R7eE1q/W0YcUFij3zN/hhQlS43FTTQRMHz
 hpdVXA6dj0d17RKg4S+RxILRCDZNkS2Z0p+VeiZzZw1Ru0woBdNTL8Qpn
 kwXBC50N/+gQG8IUjUPU0dftqvO4q2E/vPwm7qV37zWvELckLVSS7Qpm2
 tFPd6HSDtR10RtOAw/PBAHVdFKjpD3I5Zdfx83ZvrVU+i7jylM7aFOTLm
 hNQgeMOLKPeiVUFH/07TPds0u9VeglxsNT5EIVRQTjBcvEZ7e85hJ+dRG
 /iWcrhY1LzhkPtMu0pvhg8vRsPwMzq6Q1sXjcrWTVw6npAH6rExIHFeiu g==;
X-CSE-ConnectionGUID: 9sP1qGIsRq2fomzO0vt/IQ==
X-CSE-MsgGUID: yybh7rzsTwOc9zCI21ic4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80123149"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="80123149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:00:14 -0700
X-CSE-ConnectionGUID: wc85LtEGRR6+98emDH1IVQ==
X-CSE-MsgGUID: 3m47JJQvRjW3FOUlHjEg/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="265115990"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:00:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 00:00:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 00:00:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 00:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieYRurTZDsTcpQ8NyLSocjo89GcjGR5aXGMlW4qb6/YbwetQYioQjz5/bTUCGxGPns8CuAsdyXBUC98PoIK4NpARgzNg3XeAsthOwerjtiyrefgmTSfyvs2te52lTdqyHhpanf9H2aOEcELvbYk/1rynDVVuU54MaKuOstn7oUMgftTw1hX6PcISc0yxInb4F66BlPn30Gkc2JVgonkzTBfiVD5OYSqHw08Insp07KhKfvgyAgvzGDC/ByY6hFbrlusqjIM5GHpOEvKqNJt800c/3Xn6agP9oI6STYtwj/non0qAE4pwWha0NeTnUmdKz4Scq/cYHl2ZQYd3Elw26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhV4EtdOvpjxcI21lAbs5utLerrqdK13LsKKDUR57v4=;
 b=VEfxR72h8D/oEat5x+Kj+FoOGCoSBWz87e3N7anHnZQ0NZQ8EmDuAdqO6USL3pr5XQYW/duLu+SHCvg2r8KBbJK5wQI8YFG/fiVwSLfs9Sq0Lvh2+G/XCKtuZbfHhwE8b63UuD6Mzxz5+yQvV4BgRzedMzhlLhrjz17uAJuyJMcO1vR9K1cXu1AwBSTtO97DJlq3f51Ji9SApAbYIbSVlkPwOmh5SrLJaEU4zunpydmGvIvtkfBDPPf8wdDbJ7YGin63oWn8jIzDo8g80xk4EI87GDafOZTi9GQ1QJUFPyhiHm7epedkcZZViR2AQluS6q7KRbq+ElwJZCxfHkCenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 07:00:10 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 07:00:10 +0000
Message-ID: <9a7334ec-27ac-4245-9916-0c993f15506e@intel.com>
Date: Fri, 3 Apr 2026 00:00:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tests/intel/xe_exec_multi_queue: fix expected error
 for parallel queue creation
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260403014040.310758-1-x.wang@intel.com>
 <20260403014040.310758-5-x.wang@intel.com> <ac8yY4EbPkjA1XnG@nvishwa1-desk>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <ac8yY4EbPkjA1XnG@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb593f6-4006-4e97-e2c2-08de914ea57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: hA1jCgH1XSJsXNjzWi4vtVpIeerQp22VhqohEtZXN/oJ6LoCPrmSpu+WMehTBpCwyLRXd6waOVYO/LfLZtf/YJ3tPK44UiEqicpcuHr98c1rfU78T4CgxeoKyPwWIdudqhre7i6/RcKQGLHYsaWRQfL1cS6JFum//+GVzjzqeEGLDHIDmzUEwqPrMrEs+Um8cbKnz5z8tTMBJt9kXmiDAEzFw4wBvvop1f5r0qBaPjYG7nzNOBlZjq4gtdqrVUsKNObOyfP3b2vTH+5n3gjpaJW4zYo9UROTrLkKXJH480pQgHmglsadFUrKnNou3t5tfxddCN1BK/6USSyp18iRTL5Z7Cs9txKS0hxpMw38D3/IWUJk2I8LfsEOYI2SUI0T5RxnnFmSROOpsYbXl+Z8lJz+5s6cLYzitfcSiAUH3VVOOaOwjiwuU6mLD/k0SJJ3X2jSFLpbGGyBeIpCyRCcIuvqnqX/F5r+M8EhIwbEfV2zKaVXENRnL9X0EI1gZ+1hwCCCqgbuvix+Ve7yFT9tNczibs7vFu3r8c0hsKwOlbyhU85Q3q8ZbPF6ulb7z0buaeWN2pAUU5m04RgE2d/50/Whw/cerFWEqKE9dhhCncTLyKw5KI6AlWgk7SfTBbDO5GrcWa1aFRpBMzMOB4SGTDpy/RyppBENMqhk5nm5rIBATxrfWFzl9pel3gvOqm4mmgOPE7h9w/lSKLns1e4yE08EUPP62SeC8Txt+/k+yxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNscjh0a3B4TFhVdWVSdk5kSkZsWVdDaEg1SEtaZ0hrQXVZMWhLUUtNZ0Vq?=
 =?utf-8?B?VFJvUm5idkM2eWdMZlV2Nk50N0RxQi9Md3V0Ylk4N3RQZ0d5dFBMeXZvZlJO?=
 =?utf-8?B?bHpzakd6SEIrLzRBaWMwdlpMQ1JMK1hsbkhlS1hsalVxKzBkV284cnJESGlV?=
 =?utf-8?B?STU2WFFnUFFxeE1ud3hzc3daVUtaSndlblZVaFl3ajJFV3Rva2QwMFVlM3VI?=
 =?utf-8?B?dklDb0M2ZExtNEVucE1pWFE4cGI0ek56RUJyZU00YWFXbTIrWXE5S3VYT0dI?=
 =?utf-8?B?WjhXcDJDblFIR2lhZVEyVXFKUEVJREptWmZSeTNUNStNYmxjSWQ5ckFiVkJT?=
 =?utf-8?B?bjAyWFhpc0lxTkxkYXo4RUZDRWt5MTBQaGhXS1huYkRoTXkra3BMaEVnUlBa?=
 =?utf-8?B?YnpVR2FRRm5udmVpZ1I5NC82NWd4L3NaZ0lGcXg5SHJrRW5ld0cwdVNMSm4x?=
 =?utf-8?B?SXpvR0xldWFQOXA5ZVlUWmNKOHlwdWpBNTkwbjlYVzEyOGJWZkZwSkRYRWg5?=
 =?utf-8?B?YWxuQjV3ZzNTWlBQcE0yNm0wdS9HVytrUzFOeER3SFk1MmZzeWRuZ3hXeEp1?=
 =?utf-8?B?MkEvU2pHbm1Ra3YzUS9kTFMwcndYOTFCbUU3K3VGTUtXWEhEYm0yaW9tUE9K?=
 =?utf-8?B?MDZYaXRqQkhSR0tVVnpxdmJnYnVoTEI5RytVN1U1SXBBci9oTDlzS28wMW5F?=
 =?utf-8?B?QktZdUR0NTlCYmdpcWVNVk85d24zSjdGQjJnMG5BQjlrcFEreXNWdFdyRDhi?=
 =?utf-8?B?YnF6MGpkOGZkYTBObVY3QklWQVhWM1UrR3kvZkp4NktiK1ppcUROUFpuMUJx?=
 =?utf-8?B?UVkxQm1JOHFHd1NiMUgxTjNOR1RDTSszTnJYYnpqeWNlNkhGU2U0ZjMvRWhx?=
 =?utf-8?B?VXdwYnlYOVNURnFueEpjemMyK2hrSTJaZTV6TFQwZWNsNnRDT284QmRpSDgw?=
 =?utf-8?B?eWVVdXZUYVljWFNyOTRrWjIrdGxLYVpZZXhwc3ZYR2RKSnBEUlg1VjUrOW1X?=
 =?utf-8?B?Yng4QWpFbzZ5R0NtaXUrT3pwL01CWTlPOWR3bE1TWllCblJ3T080WjhlbnRs?=
 =?utf-8?B?N01tWlJZMzVKSkVKdThYcEJYczJrM1Y0ZlNlM1cxWGU5T3BwNkUxTW8rTnk1?=
 =?utf-8?B?VFNJWHowMndlWDk1R1k2QUN5alE5eG52VkpiQVZPWUlSNVcxSURLVzZYWjBy?=
 =?utf-8?B?aCtxRzI1djZoOGh5U0VLeGFMdzN1d2hhK0UyNDNZZEhtRHFvcTYxUE5hU1BC?=
 =?utf-8?B?UkJQQTlnOXIvWXAwdERaajRUUytTanZsY3F4Y0JBYisxcE05RXdZV1pTaFFE?=
 =?utf-8?B?N2JqbkFrTHRXMm43TGZienUzNWJYMis4L2pHRURROTlteTZRb00rSzVKZzJF?=
 =?utf-8?B?QlZGTnVRbmk5VjNHZU9BSG1WOUM2S1lReDRyUHp2UG1CQ3lFcWRxaXFaWFdL?=
 =?utf-8?B?cHRyVi9Idko0OUlzY2NheHRHZksydFM2SUxZNCtpUE9TK0w0cDQvTVRIbm5H?=
 =?utf-8?B?YUV0ZTdDb0U2aURiOTZMci9XU20wNnhVQUszSWxaSXMzYmVjQkNTUDFZV3B4?=
 =?utf-8?B?THI1SFVsUGZzeFNpTTJmWW1NcHQxMUgvbUR3cTFodW9oeXZUT3pIM2FUc1p1?=
 =?utf-8?B?WjN4cHppcHE3R0pUeGVoaktuTlI5YWRNYTFmRllJQ3dHdjRiek1GK05ueVI2?=
 =?utf-8?B?OENqVFpNTWhOd0lJOW41dmJIc2xabldkZUlIWmVYTlZGemV2aDFrSUlEWXpm?=
 =?utf-8?B?TThBdXJtYWozNDlaTUhnOHVDN2c3T2VvMUxZVVg0c3JzNWtkM3EvK0NqTmxm?=
 =?utf-8?B?eDVTajViTSsyNE43eUh6QWJ0NFF6RnNnR3J3UHdwSEFsUXdPQVVkVGxWSDhh?=
 =?utf-8?B?alZ5NWh4VktkUUFzVjVFanBPM3FOOTR4d3ZIMGxCcDdQQ3dPa3p3aWtXWFlW?=
 =?utf-8?B?UHRoYzVBOFlnVElCL1k4dFlHelc1ZXN5QTlwbzVzWHpWZ2lmTERrMDJ0WmN0?=
 =?utf-8?B?aDV0eGRJS0FaK2RzNGlRUnlXVFpoVDJialR6Um1TdmdUTDRNbHNTWUdleFdP?=
 =?utf-8?B?NitFQSt1Z2pHZ0F2TjdPRVNoeEp4d3FlSkZsUkxQQUF5Q2hWK0hqU3JYTFkv?=
 =?utf-8?B?TEZnVVdETG9QUXg4SW1kWWREb1hjdkM2Y0tXaXM4UVQyRXdvTGI4YnJOMlht?=
 =?utf-8?B?RENvRFZnbVlmYzd5WWRNS2ZCY0w2bkg2VkVNL2JicmhqaENqMzFDKzBETHJ0?=
 =?utf-8?B?elZKN0hteFUybmF6VlJsdTZMM2VSK2xKczJQdDZRVVQvMzh5dU9kZWluVkpl?=
 =?utf-8?B?b2t4Q2xkS1kwUG9hVUQ5djBaQm14WVhWc2QwNisvY3NsT3BvQll1Zz09?=
X-Exchange-RoutingPolicyChecked: HCfAXuQ+CiF4sfebYDtmdpM5FxuLslJkvIdyd5oM95o1+S5lLt3iiyOrwdYH/PjPa3UQ1IWt0D/noiG4/67dv3s0UFaE7L56zhliviB/tBa6L4aXFpWmRPbJ9v6KyGynDwVAq2g49afOjG7wk+wPfSHbUklPkXAeAOmFJR5m4/tJ+XNM6l4V5wKCGg32cQtcHlDrpFs8P9/x4POiH3Ot1HJ02dFxT+vLV/YcvYsuu3Oy2nKg/Ce08QnKmKbTaHLItCWZay8he+AvJtt+/DnDfh06rvZvugJ9PSmIgShUVusAtjQwrpo+u5pJ6DvhENFR6xKZtjPzYbU97PL+VntaQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb593f6-4006-4e97-e2c2-08de914ea57f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:00:10.4929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAWdK5XApt3dIzYBs6IJwgltpKsy87bhpjCgBYdsoez++dn0UmuPd1+jUSzpiOwz0Hj9SRvJCLhNceU/uXkD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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


On 4/2/2026 20:22, Niranjana Vishwanathapura wrote:
> On Thu, Apr 02, 2026 at 06:40:39PM -0700, Xin Wang wrote:
>> Multi-LRC capable engine classes (vcs, vecs) are able to process the
>> multi-queue create request and reject it with -EINVAL when 
>> num_placements
>> is greater than 1.  Engine classes that do not support multi-LRC cannot
>> form a parallel queue at all and return -EOPNOTSUPP instead.
>>
>> Use xe_engine_class_supports_multi_lrc() to pick the correct expected
>> error code rather than hard-coding -EINVAL for every engine class.
>>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>> tests/intel/xe_exec_multi_queue.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c 
>> b/tests/intel/xe_exec_multi_queue.c
>> index b5ded0633..dca791fb5 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -113,7 +113,8 @@ __test_sanity(int fd, int gt, int class, bool 
>> preempt_mode)
>>     /* Multi-Queue can't be a parallel queue */
>>     multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>>     if (n > 1)
>> -        igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, 
>> &val), -EINVAL);
>> +        igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, 
>> &val),
>> +                  xe_engine_class_supports_multi_lrc(fd, class) ? 
>> -EINVAL : -EOPNOTSUPP);
>
> We don't want to validate multi-lrc error handling here. We only want 
> to validate
> multi-queue error handling. So, I think below would be appropriate.
>
> if (n > 1 && xe_engine_class_supports_multi_lrc(fd, class))
>      igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, 
> &val), -EINVAL);
>
Good point. I will merge this change to patch 5 in this series.

Thanks,

Xin

> And change commit text saying that we are ensuring validating with 
> parallel
> queues only when the engine class supports it.
>
> Thanks,
> Niranjana
>
>>
>>     /* Specifying multiple MULTI_GROUP property is invalid */
>>     multi_queue.base.next_extension = to_user_pointer(&multi_queue);
>> -- 
>> 2.43.0
>>
