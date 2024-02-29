Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B6DC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 20:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DEB10E12B;
	Thu, 29 Feb 2024 20:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5q/qIyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1F410E118
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709238952; x=1740774952;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GElbVlPVjovAK5cHNsbU86OsiX5gGgQa8tuEcDgzuLs=;
 b=j5q/qIyJv9HQjT/F+Evv/EBiKsufU0FWG11FoJ8sYUyxreuAr/tljwII
 Mn78xVQ8ixyjNXSUwLv7qVAtUaDbu49cwyirx+Jl7Io8YbE2xN8s4VoyO
 ZI+nyrj0lKCRNmkUPFn7pZjmKX75O5n1UnoRAjDuW2c0CrTenNNTgs6CW
 aNcjmTedoNmHjl+vTJ8mIPY+DPb+mEicEgb2EEnlFfH6lGxYv22Z82cEe
 HVM/o85aoSTNtKMShFSZ1l6QKdLjgcQ+ZfV0R058WQ1RcJNGmr5UDW1B7
 j48846BXE4JMm+eotjpJxotbJ7JnpjrhUHdbX+3nCgTkYRaIW2OZFR0hI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7566000"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7566000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 12:35:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38964850"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 12:35:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 12:35:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 12:35:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 12:35:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 12:35:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRr6CAwJKS17R9tz4hQXgA+T/zNy5lJYF8JB30DeeSBxocg7SILIlS0EyXfYNHcuzgnfHXBTR3gm9qqCZtkfHIPaiKUf9l5iheRsfZvPwYbH5CCuW6KCzNpASgcCeJgQNo4fFjhFTtDP+r85WqLksA6r6J4Cn+f5wzYgnlJxQPSufblfzYPmEBxDjYjhKOWPvdSNxEaXti87WOhLx0RioTFpABAd1xEAqXee56kH1cRhubwzn5jmBT0ARk+cklxjjjkR0+oC08vz3KNOfvxc49pEn+IAq0iCRqWBP5M1rrsDSRspMX5cFdm8kd2DCs9EX/FYwRLuzRJ378iGrNNIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx4e/77xs1OgEO0Ze2t/ir2DgJspQe3Wkt3a10hBOdo=;
 b=FNp82//5O0Vs2i/JVrDOwdPru6zpQw1KcDUCypbHVLqd7i4oWxk6j5laEju4EUizJrLKtiwWRLOuZDWBSIzTq+y5Jx8OUNW2dfn078gosgUtcn1wbQBQLyHTaI+nMNL04zyM8zv5P+6TYUlnlGA1K6RwPovkQdqyHbY/rFuXgYfnKpIimv00Jw1FMtJkGvXNLjKGhPoUPEMM//YQZJCtUKl+VFeacuufz6b/ugBSXVNC9udNojgjGFoGxMP4fPxWf0R0Yp0yVIuLTN9n9vdWgHe2Ep5wzXgAAndrdMDtXMh9ikj8ky3h8Z9wDuHCsMw06YVqPPW42uH7Da4ynLBNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 20:35:48 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3%4]) with mapi id 15.20.7339.026; Thu, 29 Feb 2024
 20:35:48 +0000
Message-ID: <d20d7685-e453-4c9b-9ddf-f63f63dd925e@intel.com>
Date: Thu, 29 Feb 2024 12:35:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/gem_exec_schedule: Add w/a tag
 to prior update for MTL RCS/CCS w/a
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <IGT-Dev@Lists.FreeDesktop.Org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
 <20240229193930.2933130-3-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240229193930.2933130-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 304bc04b-bd0a-4a5c-cfe6-08dc39660330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vd3Iqirp2mwEc5063EnYgQ09Je0aC356n0Xm5hyH7mtpTznza04Pw9pzkPG8qLq0cKBgqqCFtL1IgBydnFqbvOVOcUk8KV9953ZFwJ51Ux/9deTpfa2n4fJzRX2ByHK2cF26jnlfg5+XbrXL92AZnMkjCzhPvEHXCRhX4px+HnmFLOdAs5YBW5ganC1ivmMdgRk1WCP1XmBLG12W46rrJhKroXU0enVEvSF9emkGjJVO82yN5T6eVvp4dgxQGKhI0gfkeG1WCMFzO2uSXbTvn9IjLu35dgglweM2Cx37aKlqGpyg8McUOQgYp8uk6HzSoFqB6w2dyx+GPy+7GnbBfUxXWgPlfz9UUokM4z5guAFlPgZvmmzX9J+fUkSSsZ94gnXIyQGUW6zbQUzppP7BrfvWoG1s1LbyxeRMzZTGAQQ0eSXv6AC6+DDccva6BWkP3cUspaRFko5XS6BtembDDQGb2OHGMB1dczalT0IrEqmrUy16ud7MJ1k2cBLhGDTqE+AK7cIGytA4YDWmDqVjJd7508mj7strCcUcwt7EcGIFw7WdwKXwbwe/4FQPFQh98W9HdQiCitDxSWwUo5Y0n0t3ClqCgxExt7elMbUKXb5ZLE8z04KG+i9wl3jetvxc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3lmRkFsVmltRUJSTE9veVhRK01Ec3JUWEZiajN1b0dJR2VhdEJsUi9qWk53?=
 =?utf-8?B?U0xwVXdFcW9zK0p4YmdBd2RUVE9YZGJLckI4R0d6YTcyaE9UbWNtSDlua2tD?=
 =?utf-8?B?MnQzSEhiRkhaSjJoLzNUL3VnNmRqUXQveE1yZmVrSGdEaHUwOHEwZS9sT0lt?=
 =?utf-8?B?eXdjS0U4czVqUi9ZZDFqOTc0cDZEb2V5MnFDWXZVTU4xcmFPWkV6Sm5rZXRZ?=
 =?utf-8?B?NVlNOFlyM2FzSWtITElxcFliR0haMDBqRDN4ZzBuVUZHVEt3eFBlS0lLaHJR?=
 =?utf-8?B?VENXZVVndUhOdThJdjlyRTVxVFluNmg5bVFQWEFqaGxaa294K01DUDVrMnU4?=
 =?utf-8?B?dXFMR0VTQ2orLytPbS9Ob2ZRNXN6MVJ2MHJ4aFJxRGFPZ1ZNeE02N0NZaDJa?=
 =?utf-8?B?MFVPSHdQMlJnNlloang1dkwzYnh0M2NqNVNDZkRObXpYeEVwTmp3dUtudFRn?=
 =?utf-8?B?dG91UThDSmt2bnFLOEZPd0ZmVHJVeEhjbTFvQjcwR04vcTBKc0JxczZ4SDdq?=
 =?utf-8?B?Yk5IWmcyT0s0U1FLbTI4M2Q2RE11TVRyem55T3BWM1k1MW1hQkllK3BnSC9m?=
 =?utf-8?B?NU9qSWRJZmE3TjJ5dGRkS0VVeWg2Rjlob0hXNmpPRVZnZ1Zra25MbTdnSFN0?=
 =?utf-8?B?a0FjSENoMWZyRTJzdEZDZ3VNNE5Kd2pDSFYrQ05qem1sR3R3WHFKaEZub0pl?=
 =?utf-8?B?Q3lhc0lhbDdETkJUa2pNVmoxM0hLL2Y2cUZsaUVIZHZvWitlcm11S3N4UHla?=
 =?utf-8?B?Y3ZieXBWdE9rRCtwQkZTcElZUGRCOGFFLzdJVnF5U1R4djg5Y2VHeWRoUm5X?=
 =?utf-8?B?SGpUU1VwNWVPd3JpRU9Ec2VzWmsvZkZGcFRaWmNLdzA1M053Sm1nTUxsaDlS?=
 =?utf-8?B?VWU3ZnBPWXZ4dGNuRXV5Z3RsaUxibk4yd09sTURlRzNzZ0l6c2FzMGU1UVBB?=
 =?utf-8?B?Sm9aMnJKSWhyWlRrQU83cDZKSzZYNEh0eXVHTEo4cUpvOFFYNlljWlhHcDVP?=
 =?utf-8?B?dlBrdUlYT1BINU9TOGl0WXpaVWd0ZmN4VWhQRG9rVU9vTVRuTFl6SXRpUDRR?=
 =?utf-8?B?STV5T1A1RGlBbHQ2ak1pNXZ4OWF6ZzVIekhDZlZyNU9mUDlmRUJKSHdsVkp6?=
 =?utf-8?B?aElmeDUrYmpnTnZZc3RSNXpYcTB6L3l5ZG1uVWRXUFRlb0RYcld1RFFncVNO?=
 =?utf-8?B?NWRrRlFUbU9hU1c2d2lOS1hFWGVxajlzbk9SRnY5TlduNnhqTnBaNUExVjZt?=
 =?utf-8?B?MUtGbVBpNVdKcS9lSDl2RGtYMXF6azBpZFNaN0lydXl3cWU5TGZ6WUFqbkJS?=
 =?utf-8?B?SVhOUTR5ZEFucWMxTXVkZjlTdnp5VUVnc1JQNExJMkU0Yll6RVVKZVFEK2Er?=
 =?utf-8?B?TEtXOUJmNmh0YmIwVGY2NnY4cWIxa2pZTWQyRzBsc1I1cFZTZXo1czJ1MW4r?=
 =?utf-8?B?S3hselhUL1loRnE4eWJHT0hDbElTSWJnd1dnWmRpYzY3YzBBcEUza1d3V29m?=
 =?utf-8?B?Z25DQS9td3YwSk5YUEtzYk1VWFM2U1paUWduYStUaWo3dCtRZ3RKWCt5c2Ew?=
 =?utf-8?B?blhuOVo0cnB4eTRvMHYxTEYydWE3VHJHajluZ2hWY0ozZWY3NXpUUUVScFZ1?=
 =?utf-8?B?amQ3VmppVzRGT0tad1ljdXZ2d2NHaEtnVmlNa05KbzNOQ1VlTk5ZUWVpWVQv?=
 =?utf-8?B?RURTV20zK3RFMkc3bCttZmxJdWNzYXhZYVdZSHVWdi9lMFg1VDhLMlM1MmRm?=
 =?utf-8?B?bHh6NW5mSENVaDVtM0RtZmF0V0sveXFnYXZqU3I1Y3NTSlJrMVRRVThpVzFp?=
 =?utf-8?B?VHpjYTR3dFRacS9OSWd4YXFwb1c4VU1DUzB3ZXJFVmh3MjFaQXdrakNZeUFo?=
 =?utf-8?B?STVORURURDZrOGtsazZIRGdhUmhpWkhXOFpkNHFrcHJlLzdqM2pheWJEMnpD?=
 =?utf-8?B?c3JkNGlyL1VEbWx4d2VRWG83QzhXWHp0dWVEZ0NPOXhKeW1ZdUtJYWw0ckZG?=
 =?utf-8?B?L0U2QWZteVB2QWt2T0lucHZtSklMWUpVZ0dzTTR1eHpGM251czJ6dzVFZ0tJ?=
 =?utf-8?B?Z3VvY1BxYUhKbnNpM0N0MVU3dk5PVjJjUWhXTWRhMTVPZnZjVzQ4WTJYS3Q4?=
 =?utf-8?B?OEpST3FyelRMV3VKbTJkc2pGVGNXZEI4eVUwTlRGRkx2SzZrS1J3cWJ4SWlj?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 304bc04b-bd0a-4a5c-cfe6-08dc39660330
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 20:35:48.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPhN93T8vUA5ZSG0bFd3otLG4a1UnGSM/OWiTHjRlE8bNZmSvy8DXXPiEj+C8fKRH7OHTaANm6rr+1gbsEbnvnnNCz7cZX4JY1kj2iXnC+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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
> This test was recently updated to not fall foul of a particular
> workaround. The w/a tag itself was missed, however. So, add that in to
> make it easier to find in the future.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/gem_exec_schedule.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 3fd91b2fae80..8612929cc403 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -444,6 +444,7 @@
>   IGT_TEST_DESCRIPTION("Check that we can control the order of execution");
>   
>   /*
> + * Wa_16019325821
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>    * The RCS/CCS workaround on MTL means that if spinners are sent to both RCS
>    * and CCS engines concurrently then the system is effectively dead and will
>    * require a reset of both engines to recover. Even pre-emptible spinners
