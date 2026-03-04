Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A0EEFCE21
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165F210EA87;
	Wed,  4 Mar 2026 17:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBBhHA1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA94510EA87
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772646730; x=1804182730;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hRqJ0ebt3yp224B6Ji9s41ZethbVHn9TvpTVaXUr/zg=;
 b=RBBhHA1Ss/WYvyku3IrrI/8shL6OnyUvRHE3oFACFkATDfvXFfCBIDlB
 +HyepJ4lnZEL/atTCoQg71fCzCXHnfEVnmCzdGeQfStlWV6r7qHnuv5Mx
 mDjwboLbVO5ItsyxZmftUqX+CWcTk7dRoCZGAcr8OlX7HcVCECOMhqxcQ
 HqP9q1BLikRddHdaNjIxJK7+/pmqqKIUGrQsTNAJM7w88IbfuDrqFJuxF
 Ag+7ypB0CQ/0A8/5cQ2EkykFm6p3zhH0j9qfccM2g4L08+BthUAdirDy4
 LwRQDOqpO3Kv4ky3MMkgZSpfDrnYQLjVq7LJ6elw5/YdPqYxY83Y+CMIy g==;
X-CSE-ConnectionGUID: C0byjeXMQseDiRbyorWdwA==
X-CSE-MsgGUID: 8V/UECqmSUKM0pmBjJtQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84427761"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84427761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:52:10 -0800
X-CSE-ConnectionGUID: AWi3bL55SbKX789HLxlMqA==
X-CSE-MsgGUID: onWpynlqS92hZtBWkDg1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215326288"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:52:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:52:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:52:09 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:52:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRl6TSrVPXM15rliig3bqIzDliZgnurQlcu+t0qVB4HSTa0bU08VlFCl3ek/JKIsZ8P5U78spBGb52ybN1aF9qSIDWy00z7vmnMWQv3ehehUZsNC4kjyijBfsieqyEyXKOuYuC030+smQL8Qn/IINdRCtnhngKYIS2WrslBI0YU/TEkNzqMMRmMZo2C6UZgc9ETDnndFaJI7VpQVJ3RbbE2udj+oE1jsKdUzxG8xCOaFqyaOjYAX66bFfaWA/u3+4Z4bVDmIQNmKUCUB/iLlGph+3TuEL0v1izd9duLXNzGD9Yc2YNqGcU8Sa/gdcxcIAaJ+3iz1SomlPAG0g88i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL9tBDixbwkQZfPAritkg8QjaT80j06tGHGurl+5Vjo=;
 b=PsJ6j7N9NEnS8PzkArIrjhVYu4l8wf353rneYc99/I+X9zWaYtpCiuR3M3T0IoE2f8jZ7SLYrgSUK1Y5eCHh6QyH3D2OwpX92Hi4MPCSw7hxXGXMMP30ThyOnbY/g4H2Bk12fhxAIGdU5KU0rNlWi6Xg3jd80MngIRr7kF+1ZJN0wCviaTdzwc0+YVR8wrmxBiTSfkO0G5iJ/WvWaSYQNRMGt9o92FnT4iA0IHUwZSxkmMUPc/KeKeYy63TjeiYE7FKP2HTeqsJcJQypfgCjEHk3AhrvGshCCboRL0/gKgWwDSZB5gXJA6KWdQEw4D9WLVqKJfKOICa32AYQNBox+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:52:06 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:52:06 +0000
Message-ID: <05c5f683-9b2b-424e-a07e-5798393c0d2e@intel.com>
Date: Wed, 4 Mar 2026 23:21:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] intel-ci: Rename chamelium-only testlist to i915
 specific
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>, <kunal1.joshi@intel.com>,
 <karol.krol@intel.com>, <ryszard.knop@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-3-mohammed.bilal@intel.com>
 <20260304170210.c32pclliiwc7emxh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260304170210.c32pclliiwc7emxh@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: af2e715a-f63a-4b9b-7d0f-08de7a16bfe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: czhx+yRMDnKCAmksvLot7mYzLX7QoQe2no+IkyYjEImk+7Yj/+BMVcdCQuM2aUCxJ78bke3AKED/zyYj6JJNLVwthqmSF7C/Krtf0PcvNQUskXD1I1qZk9xutY+DtDBPXt3JVnC54Msym4q1GyAeAgU28LWjM2Sc9lrCk7U3uwU0i8tDPEgQUSVt+llVDavjmuQa+dvIqEEPXOX9izVlXuvtBYi2PQByzRWMW5/Y+dO5mJ9MQswwj/YBRaTtLTyu/UkZfpBEtGfW/JeoNpoSjpo0L2f4VHQBTOVBgNzYMSwpArcixEsjIX4en3YcheAalwNlvqbL7Hncj5IV41reMj2N1d70ebsJ+X7nW+nP4n6cmBWtFvs7fFPub0gbWGw3DcMFeLeDLg4QDX7mP7lGuTxIm29iCciUf+mxqiY9sOFVymsYQy1446Pmchc0DcGmy75+R6ge5zY3L5WQWp9m8ko/wenCpWwo6dUa7eduB94leuO9RMS7aNZqk08IH0ecNlwGcepW1W/npKSds08NO6EP9ruDGz7CEDKUOc4dE7BXwpVbL04C/jwqZh/73zpuRtRFXuIePb175UjM/hz9HcfT1EEwPqWzwfuOl+phlz5CUp8z5H0zBBYAFB/e+lCk8eyv/4Vc2pzrOLMMcc0JsX7/qnFf3ID88lGV4SiPGKUnrKYQPaHYw88j12nqADJWx7Xe/fYDUllupGo/GVQpeeFt3IurtcNCLCCfP8My2Sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0wxWDBwL1oyRkhxZzBabXJZSkMrMzhDcVlacEpGV0dHMVRJRVhtV0gvb0VK?=
 =?utf-8?B?d1VmYnhuak5vVXJScDZway9Ma3YvVytzYUtPRTJlT1M1Q3hoUmlpMldjbjAx?=
 =?utf-8?B?NGx0VHdEYWhWbzNuRng1REVpRXNKdUVHY0s3UTZhWjU1T3ZXclNXYmdQMEhi?=
 =?utf-8?B?d2VlcDYrYTlZekplNXlGeHljNndnY0hDUHRzbTdFQmR1NmRmTlJSRkptM1BE?=
 =?utf-8?B?VWZjRjh5UHMvQzh2SHZqY2Q3ZkFkUUI3WlB6c3J4dU11VG5NNWNYSGNIVnh4?=
 =?utf-8?B?NWxVTmUyY0VaSTNHYkdZdWhBYVpuK0NNbjNQODRQQVF4ZklXU05xNk1BdG14?=
 =?utf-8?B?cEFFSzFzWUEwUElhMldzRVZyL2lHblpJb2pMbmovbHl4alpQeUd2WVArbWFl?=
 =?utf-8?B?bm5uMjVyRjVPeUFwWGh0bzdjVkFMRTR2SzlLYlNNRXRuY3RHUStQYmJ5aEVK?=
 =?utf-8?B?YkNTa28rR0VscDl5cnAyNWEvZGtWalQvVmt1UG1PaWtxazkydTFabnU0cjJx?=
 =?utf-8?B?NkgwWnFhSldhQVl4dmJEeGl2WFpkcHg3cE5ESXRxaWUwSzFqNG9hMmxBV0Mv?=
 =?utf-8?B?eUpGQW5TTEcra0Nnd0ZhRjRHUE1lRzExeUNJZnU0MHhuVjdMRXpmS2JObnhS?=
 =?utf-8?B?WFRubFgvOExRdE80aE9EVnlZZ2lPRnJ3d1VFVm5yWUZhQjdNaTgzdzdiY0ZC?=
 =?utf-8?B?UTdpTFQ1NTVWTWFTaEwyY2UvV3RtSmpkaHJDUm5ieHUwYVNNbWpmSGM5dERF?=
 =?utf-8?B?cTZYU2U4UkNuR0FYQ2xMRDdYNEl6NkxpQ0FpZWRkS25vQVpUKzFld2Q5Uldy?=
 =?utf-8?B?Q0hTWURFa01KejU0eEJuSzkraG5CK0hETm9mWmY1ZTRHNlVHNnhQWTJWQ0c1?=
 =?utf-8?B?Vk9SSVBmeWhsUkM3NERTWm9DSlhXcnlqN1V6d0VYRlJTRGVYWXc1TUxhUHpq?=
 =?utf-8?B?OWMyQVJESGVzOTVqbXlOUEExT3VCSmVUL0NWTDBlam9MT21KMXdZc3RCZi9X?=
 =?utf-8?B?YkV3YjQ4OGNkcXJNNHhNTmk4UmFCMWRtcUNrMGg0bmhWbUNXU1RrM3phSWwy?=
 =?utf-8?B?U0tRWk1xNUg3M0ZBT0FmeHhuZC9QOHJweVBiL2lmZ0hWMi9vRVo3Q25IRTRD?=
 =?utf-8?B?aHFkdjNEc1VGRGVQQ01IMjVNVjdWZEFzdXQ0WUMrVzRocEIwZjExajJzK2xS?=
 =?utf-8?B?OVJkRmI0U0Vzb0dOY3JzNzhLNkdTT3EycjhDKzZoajlCS0xYR3ZpOVJDdG9B?=
 =?utf-8?B?ei9adjVqWGlzY2lDNDNINHZMYTh5b3ZCRjFPVllIbytKMlNBR1UwN2llU083?=
 =?utf-8?B?WW5NTWdyN0krWGVqUG5xNGxZUDFJSFNOcUU4Nm5wNnUzd01OVE1xUndEcnhr?=
 =?utf-8?B?Q2R5elYycTQ0akFiNVV6eWlHUjIrWVdYY1h6WXNjKzZxRGoyYWJQYUU2Q1Ax?=
 =?utf-8?B?NGxDUEp0UW1oMWN4R3phQXlncE50N2YzWEU2M0hqNmxoakVsRjBZNExMWHJC?=
 =?utf-8?B?dXMzMXlyM0tlbGwzdCtaZU5qa2RRODJXZUl0aWlBSEovSTI4bjMzSXArQXRn?=
 =?utf-8?B?OTlnbjFCU09OVTFoeVVndkVQUjdzWWFKU1MrQkNhOWpSMDc0R1U2anRmRlBq?=
 =?utf-8?B?SnZZeVphbnNyNWx2eG5LZ1BXZXA0Smo5dHExMDhiYTgvOTBrb3hjVWxFcnY1?=
 =?utf-8?B?SXNua2hCRktkSU1wMmJvY3JENEl0amd0bUxoa1grZzBoaklyT0l5amVrS2VZ?=
 =?utf-8?B?TlFwcVNXRVRBVVZrby9Zc1RiYll2NGNMRUNyckNWeG5wbGxjcFhtT2YxRXRG?=
 =?utf-8?B?REpIN3RRRVVURmE0UCtmTmdHc0NkclAxSEt6LytUZjQ0aTBkaVR0eG9BVGwr?=
 =?utf-8?B?M2M0d0owaGlzTUVlMUFocUdRR1F6djBwbEJEMUk5Z0g2SmhnZEVGeVduK0tu?=
 =?utf-8?B?K1VqTWJuYkpHTmxkekJwSHhIdlBheHNsMVhjZHIwaUNIVXpKTXVkcmlnYUxK?=
 =?utf-8?B?YXpKVEtzZjNzNVV2NXlCaWE3U3VudXJBMks2a3llM3lXRG1NVTcvcWhpWk1m?=
 =?utf-8?B?SGpDR00yZHVvS0VLOWgycjBVK1RvdzFKLzdzemNiYTZBK0E4czd4RFE0YWky?=
 =?utf-8?B?NUp5WlliNFEyT2JNUEJvcDZiTEdHNnFpN0VuVlJXZmZvTkp0RUtXSGZWaXk1?=
 =?utf-8?B?aTRKTjc0ZmpTcUxxSGdZREVWQUszM1VCNWdlS1JoTHRpcUtIaHA5dEhBTjRN?=
 =?utf-8?B?WTVheFZYYnBRVjl1NFJTNU5LZEcwU1l1ZHdtdUJ1RHNCdG1IWEdVQktxSE1m?=
 =?utf-8?B?aGpBTUJqZmNCU1NWL0toQWxuVVZJMWhtN28yeDlWNzg4OXNmQzNxTG92Wko2?=
 =?utf-8?Q?6lmCgSJ8e035hD2U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af2e715a-f63a-4b9b-7d0f-08de7a16bfe9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:52:06.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8YE4QCIxHy2qre5Fv6/VEaVzyY90iQERGKASMlM6LVZRLI2YnhK2Yx0XPwUbFOw6B27At5+1bKe7d+2liwbgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
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

Hi Bilal,

On 04-03-2026 10:32 pm, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2026-03-02 at 15:49:23 +0530, Mohammed Bilal wrote:
>> Rename chamelium-only.testlist to i915.chamelium-only.testlist.
>>
>> v3:
>> -Use move-fix-add approach (Kamil)
>>
>> v4:
>> -Restructure move-fix-add approach (Kamil)
>> -Rename run-type labels(Swati)
>>
>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
>> ---
>>   .../{chamelium-only.testlist => i915.chamelium-only.testlist} | 0
>>   tests/intel-ci/meson.build                                    | 2 +-
>>   tests/intel/kms_test_config.json                              | 4 ++--
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
>>
>> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
>> similarity index 100%
>> rename from tests/intel-ci/chamelium-only.testlist
>> rename to tests/intel-ci/i915.chamelium-only.testlist
>> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
>> index cf0023c63..1a13dd52a 100644
>> --- a/tests/intel-ci/meson.build
>> +++ b/tests/intel-ci/meson.build
>> @@ -2,7 +2,7 @@
>>   
>>   intelci_files = [
>>     'README',
>> -  'chamelium-only.testlist',
>> +  'i915.chamelium-only.testlist',
>>     'fast-feedback.testlist',
>>     'fast-feedback-chamelium-only.testlist',
>>     'i915.blocklist.txt',
>> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
>> index 61a70a9bb..4ed6e5405 100644
>> --- a/tests/intel/kms_test_config.json
>> +++ b/tests/intel/kms_test_config.json
>> @@ -15,13 +15,13 @@
>>                       "include": [
>>                           { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
>> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
>> +                        { "i915 FULL chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>>   
>>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
>>                           { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
>>                       ],
>>                       "exclude": [
>> -                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
>> +                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
>>                               { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>>                       ]
>>                   }
>> -- 
>> 2.48.1
>>
