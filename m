Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04C5F557FE
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 10:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3698910E50D;
	Mon, 20 Apr 2026 10:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao8X0DV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425510E160
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776681787; x=1808217787;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wYSEM2gm9u4rTSE3c9uf5Sd40Vf44tNKY9LWzZNcOD8=;
 b=ao8X0DV6xEWx5zs4hLtXeCPwitnYEs8sBnLwM6CYgRGK62trReitUNoI
 I15i+fhUUeoqIo8xdFYgV3h25t48uUjuf8w5hk8vCCsxJEsmqxZ51KU8v
 Ur3bv8LjZ40Zg+V+tGj0NHpSR45ohO4YTFR4C4/bFmUNjzkPVVq0Azw4W
 Xyau9lX+P6HyVgQDmI8Z1RjLTEYTWG15p+G+MWah59xcckBwzd4+QCe3t
 ENzIl1CdTcldbx3c44Hh4lBvT+jsJaJ9/GuC2WvhIQcZ+Z+IukRC0ABlO
 bSzGl5ojdfjVKwZTUC6MBbNWgggkP9z9LCT37/3N4lC9kFiYmw/ezUn68 w==;
X-CSE-ConnectionGUID: D14kgXmhRxeagudXdffupA==
X-CSE-MsgGUID: nm8ZLdneSpO2mDUMOWLU2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89061071"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89061071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:43:06 -0700
X-CSE-ConnectionGUID: x0op9tGDTa6A9+zYrCuB6g==
X-CSE-MsgGUID: rv9b+JeTTSGjygqdtnA5nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="254944817"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:43:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:43:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 03:43:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C49qQLgzDeS/QojE9OpTx20hazXxphADkRjfH86M/ILPZqFuePNgexTdxrsj+wZIVW4TP4E4wtpU+gCdWfXx5/7N4jtkZReIyhIo3Y9/u/ZzfZ2rCRG1l4zRutwNaxMSBBFEO/vSu9eFSdnXE9z5ZFW17OK78zR9dD6zv+m7DM5broQ0uFfugCULeFdO5Wg8i9ttFOy514wAzcao6W+KirXIxz07tym5cTBqVF440XWeDMvh3Hlejvpdvfxkyw0KHtpjCQRz1I7kRvEfAMT+Lo7Oku1RxBQBKFiKCxGl5CzO58d8h3QqPZfn5Cs3zXwBFLm+5CE/NpfADTeBNZKPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Xi12sFZplm9bCUgj2wTFyyJiY45IaQNPxW+6TfzRAg=;
 b=ZiCCsYtNoxbaXTFV1hZgbaXD8bNzEu1JywcepRkjo8Fz93obhEvk4dr2cqrhe8jwqpvn2L10+vpD6+KCbC7hi+SqhiKZ/jlmDXF/JPxtmplZsyTwC77yFSjvwsk3rTZwDrKTRpkjscfrIN6KK9+eSvO+Xdv9JbtO75adlaN8azEgKfrP9z1/SRlNYgafC1124/WKjAc6Ij2Fclalij5GUaV+I0JiifuLZaAYCLx1iqDNBoasYT4lsFJPZGt+E+DwdYDKm+cpSLfgX96F49eFKqvETFK4fk+LYNdWXcNlws/XpZg7zvtgWEmpvtriwZVGCRBcv1ddsv75EV+mb2vjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 10:43:00 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 10:43:00 +0000
Message-ID: <1e42db91-75f3-4e6d-8091-5479f098e9a3@intel.com>
Date: Mon, 20 Apr 2026 16:11:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel : Add data structs & helper utilities for
 VM_Bind Neg tests
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>,
 <matthew.auld@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
 <20260420045724.1053946-2-smitha.balasubramanyam@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260420045724.1053946-2-smitha.balasubramanyam@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 38eeec8d-92d6-4b4e-ec9c-08de9ec9977d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: dI44z+ES9XzeIwfrcc7WyDR6ibkLWBLzkDe2i5/kzKEoPtYG2bO4P6lyPuW7y5VtY/CHYHZaULCbrYh1o6SusEy616H9SelSUW7zfCoDS3dmknzrd8wmPYwvEnAjLRdlbhs0+haulizOGSc/pO0DItTzHkWT6IErTw/EyYk2fs6KarDKhTR+KMo575wIAcQjyD5n1n8sPcuqrAuckwBpkb8jLeDUuOY2lFRSoggab9uu+r+gnzbbBqwd4vkcaTkZVGW7km31a9FlPGqySGxxmVNv5RmvghOW0UBwwT3A2RF8e+ZhdQ22Uhybyw8nC3uvhHUDvW2Dpa6ucbkUtvIzNyRzLrqte7buX+WB+qlzcO2PJ3IpqvFqhGjgTB16ydvgzJ9jUw48JocwLUV5jRHMF0O74sG2zMZHCVrnVg7GxchSPKfF5L5mr4zzGssgOfzqqo2GfiCxs/Rtz4UoyOHPFkHwCDz2ELQ+DCF2XGwn/KJ1qPtCDeu8r3EOJvfJW98en9MHdyThnHwdWBD6VwhLtWGGtUmP0U4HankpoWuIyASAQq6jYKtO7/pr53Y35ljfIoRjYk+0v0kDTU2EHYXtPjeH7mqph22Ikqb9XbMoA/uYzV5sjdh7k+LT1eLQ2aINGmtMpR7m0A2TGlhYUS9m8zTqUPdocJ5HMt9hCcIpXG8mllISHb/V3uXMZXJSciQA5epD8MagKinXE7DOSuY6i+B2HyAkvxm5uokiHKV2jng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWdtbnlBbzc3NkpLenBIN2NOdXVSbzZkREtOTTlXSWgveXQybFlGbjBlejM1?=
 =?utf-8?B?ZGxFbHlFekUzMWg1N0kvMjdxdmZQa3RIeWhISGVoK1d1N0hwZUovOWV3MFBF?=
 =?utf-8?B?ZnpyRWJad0c4ZVo5dzh6cEk5WTdKUklTOWtYczVQWHE0VlJObThjMUZ3VzJ2?=
 =?utf-8?B?NC8rdmQ5cmNZZVdxRW9DUVE1ZlFXKzVxSlB1ekJ3dW9qM3VxTmRCNHhEbjRk?=
 =?utf-8?B?QmFNZlg2eGllTFpUMnptS1pwKytodlJLZWNLRmJKNmk0RStxektsNncxVCtn?=
 =?utf-8?B?U3E4SHk2T2hYVEFubFpOVUpvSkFBK0tDSm1iVDNENlF2ekxSVlJ4c1YvZmRV?=
 =?utf-8?B?bzd0UVRQcHlNZkhyRUJ0Wmp5cmM2UVh0NmE5bHhZVEM0ZDF1eWc0LzhNSTRK?=
 =?utf-8?B?MzduL2FoOWFYbENmUWowUXdLQlhOZHhzRTRYbG1vRXdCWjNIaCtoRTl0dW9E?=
 =?utf-8?B?SmJKbWhpQXpjYi8wajM5SU5DK0d3MmRWN0dCNGdoNU9nZWZqWmEyV2g1V0Ri?=
 =?utf-8?B?ZUhQUFUxM2RnbjdBdVhQbjRYbWFiK1RQNGI4VzhBU2VRQTJoSDVjRlFldjhk?=
 =?utf-8?B?RnViVkNLWS93WWFhNE5vMWRPdlhkS1loZWF4ZFFBUWVLcjJxbGFhd1RXVndt?=
 =?utf-8?B?TEw3QmN4dUdlcnFiV3g3VHJ6Uy9RRGpMREYyYzM4c2VPL3gzS1NHSWtqWmVO?=
 =?utf-8?B?VmthNGFKamU2RmdKL3NjU2ZhVVNKeGI3MjQxaU1ObURSMEp3Qk4wUGdMMURG?=
 =?utf-8?B?NndQVGNVaTZUaVNrMFptaXA1MWV0WkF0WWhqdGVKZnU1YVBTL0d5OEVaYjZq?=
 =?utf-8?B?cWJRNjFmS21HMmQwZGlrZ1hwQnJZak01VDVTb3FNTVhRZHkzcGVwRDU1TlIz?=
 =?utf-8?B?bnZhUWFrUXJ4cFFrcU0zclpoVldsc3E1dEpJTHgvMFcvNGwxc01xQTgxeXNJ?=
 =?utf-8?B?RitPU0RTVVE4Q0VUenByTjhlTzlYbk9ma3R5TVkrTXZDdml3cDB0QVYwRU50?=
 =?utf-8?B?bDkwN09idWFHcVR3SHBWYXNCa1N2S3JsZ2p1b25wWHZlaUF1OG54UE1QbmFz?=
 =?utf-8?B?V0k5MjFGMlB4L1J6MFBqcitrcDVhZnM1Qmdtd090bWNQbjNrRWNmTFl1bUJH?=
 =?utf-8?B?VEJLR1FId2M0M3p3TDl6cnJDVTFxVzdGSnRJTVl2SHZhZXVKTmlWazJqajBl?=
 =?utf-8?B?Y2JzY0RVbWV2NVBiNTF4WXVQTElqenc2RFd1clJEdkdYUkc2bHhhdXZrUVdj?=
 =?utf-8?B?aVRvbENGU0l2a1c3R0QrT2FpcndBSlkxYTFuVGJJSm1jVk9OZlk2aTkxeEpj?=
 =?utf-8?B?TTMyUGhlYjVrT3pFYkdyMWlpSWhvTFlIZEZkWEQ4Zm52RDV5ZVY5WDRKdno2?=
 =?utf-8?B?Q0R2emY5SEh1MW1vNDBvQTRySk8xMkVvL1Y5Z2dOeVhwSTMxeDQyTmV1OXpC?=
 =?utf-8?B?a1B2VkkrSXVVdWhGeUJ6eExlQ1pkN1p1bk1MdjZvZTNLVUhTaC9VdHFkS1pz?=
 =?utf-8?B?Nm1XMXVyblF3NWZ1b3MvQURGSTNOMG5CVk9WdHpKaW1ndDQvd2puNDZNUkds?=
 =?utf-8?B?MzZQdytuTlBCbFRiV2hjSnhYeG55Y3dmdXdna29ta1M4MHZWZ0tUZ1JNSU81?=
 =?utf-8?B?aG9VZzBsMWpnQ21uY1FndnpPdDNpL3diK0xFeFNQZlAwcS9RZGtnVUIxVVNE?=
 =?utf-8?B?eWlQL1dGcVR2SjVQQ0JYb25MV0JqSWY1aXNCQkd5c1BwRXExdU85bnJhYXhu?=
 =?utf-8?B?ZHZEaEM5dkoyU2FjNnhKYXNRMEM3dzZ6YVEyS0o2UE5IT2tTZmtoN2JtbEJS?=
 =?utf-8?B?TWZ5Y29hSGVFQ096Tmd3Zkp6QW5qaDkzTDk2MzVudXh2bUoyTGZEOTVGVE9t?=
 =?utf-8?B?eUFwNjNQWEQvV0p2K295SEhHUDVFNFFzTVV6aTBtZWd3aTdWNjZPdXBJcks1?=
 =?utf-8?B?T3hvNjJ0cEppZFBzNmJUMit1OW1BS0hWWTUyMndteWwrbHZaMzVDblhaWC9P?=
 =?utf-8?B?OVRUbStKQlRqU3R4eG9BNndWOEVBa05aVWxtZEJCTUFjVXV2MVVVSG9GdXdy?=
 =?utf-8?B?ejBMbjRNNnpWaExqL2xza29JSytxTlNyNDJZRE1MR003cXpqWm16ODVyUjd1?=
 =?utf-8?B?V1AyVGdSQjRTNVFqMmNoMlNVUGtWUU5LanFoMTNlMTZTRGtPbGJZM2Zld0g3?=
 =?utf-8?B?cGl0VXUvMDRKSFlhdFdjcE1xeDB3YUM4M3JxdDZtbHBqRVV3VFNKRkxMRGh4?=
 =?utf-8?B?UDFWK3NIdlVmcWdpaGlhVzV4RzdJeng5YjRreW53ay8rczkwSm5ZY3JBaEFz?=
 =?utf-8?B?UHpZaU1aSEFYSEJlQlBxRCszYXVmcXJlejFUU2NNRG91WXVoM1N4dz09?=
X-Exchange-RoutingPolicyChecked: J+G07qQKn7Ab8vGEDMRS2tfX5DGZAye1+iATy13urEyeiLvNzX8DjtX4GPY2tmHjiV9ltbUghgL7EvEALHSS5eShZ122MXdEUy9ZBRd/faG1NQmmSW3+O75ml0rabi2/rt3jFk9/se+1H2CAX5cNzlGNy9QXbZnfoOMUL0yF1Sc9In5tqxIZ4YHszRyb2wGOJSBAIxIOdMAzkoDSvVdCKDd3O3Hd8kWHKNolZJFcIcBYC61W1UwyyTM1omUafMA5yreD/sdtbwqw2g/NH0BuDrwNn2jpCMRKNQwT+PzWIFBNHSnGpSqyHz8bgwSf8QDyA6MTeVoXQ5t17hKc/bGSTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eeec8d-92d6-4b4e-ec9c-08de9ec9977d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:43:00.1602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDS0ljpV7qyxMmE+foF0CL8/9bPkYxOB4/rb4H0QpU9sesBeZTgQVVMFxC/lOO7gdM6IE58iirkj8X/PrPNsug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
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

Hi Smitha,

On 4/20/2026 10:27 AM, Smitha Balasubramanyam wrote:
> Introduce data structures and helper utilities used by the VM
> negative tests in xe_vm.
>
> These helpers provide resource management and setup/cleanup
> logic that simplifies the implementation of the test cases
> introduced in subsequent patches.
>
> No functional tests are introduced in this patch.

Just a comment on the patch structure, will still need functional 
reviews from someone else.

This patch standalone will throw a warning for unused function. IMHO, 
add at least one of the subtests which logically sit together with the 
helpers added in the same patch.

>
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>   tests/intel/xe_ccs.c | 279 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 279 insertions(+)
>
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 4c5fe0311..029b8bdaa 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -371,6 +371,285 @@ static void surf_copy(int xe,
>   		     "restoring source ccs data\n");
>   }
>   
> +/* Data-driven case & state used by vm_bind_decompress negative test cases */
> +struct vm_bind_decomp_neg_test_case {
> +	const char *test_name;
> +	uint32_t pat;      /* use 32-bit for ioctl param safety */
> +	uint32_t flags;    /* DRM_XE_VM_BIND_FLAG_* */
> +	bool expect_fail;  /* true => we expect kernel to reject (result != 0) */
> +};
> +
> +struct vm_bind_decomp_setup_resources {
> +	int xe;
> +	u32 vm;
> +	u64 vm_map_addr;
> +	u64 map_size;
> +	u32 handle;       /* compressed BO handle */
> +	u32 bb;
> +	u32 region_src;
> +	u32 region_comp;
> +	u64 size;
> +	uint32_t comp_pat;
> +	uint32_t uncompressed_pat;
> +
> +	/* objects to destroy/map bookkeeping */
> +	struct blt_copy_object *src_obj;
> +	struct blt_copy_object *comp_obj;
> +};
> +
> +/* Cleanup for VM_Bind Decomp Negative test cases */
> +static void vm_bind_decomp_test_cleanup(int xe, uint64_t ahnd,
> +		struct vm_bind_decomp_setup_resources *state)
> +{
> +	if (!state)
> +		return;
> +
> +	/* If we left a VM mapping, try to unmap it */
> +	if (state->vm && state->vm_map_addr && state->map_size) {
> +		int ret = __xe_vm_bind(xe, state->vm, 0, 0, 0,
> +				state->vm_map_addr, state->map_size,
> +				DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
> +		igt_info("Unmapping VM mapping at addr 0x%llx, size %llu, ret=%d\n",
> +				(unsigned long long)state->vm_map_addr,
> +				(unsigned long long)state->map_size,
> +				ret);
> +	}
> +
> +	/* Remove allocator offsets if set */
> +	if (ahnd) {
> +		if (state->src_obj && state->src_obj->handle) {
> +			igt_debug("Removing allocator offset for src_obj handle %u\n",
> +					state->src_obj->handle);
> +			put_offset(ahnd, state->src_obj->handle);
> +		}
> +		if (state->comp_obj && state->comp_obj->handle)
> +			put_offset(ahnd, state->comp_obj->handle);
> +		igt_debug("Removed allocator offsets for src_obj and comp_obj if they existed\n");
> +		if (state->bb)
> +			put_offset(ahnd, state->bb);
> +		igt_debug("Removed allocator offset for bb handle %u\n", state->bb);
> +		intel_allocator_bind(ahnd, 0, 0);
> +		igt_info("SUCCESS : Cleared allocator bindings\n");
> +	}
> +
> +	/* Destroy blit objects */
> +	if (state->src_obj)
> +		blt_destroy_object(xe, state->src_obj);
> +	if (state->comp_obj)
> +		blt_destroy_object(xe, state->comp_obj);
> +	igt_info("SUCCESS : Destroyed blit objects if they existed\n");
> +
> +	/* Close bb handle(s) */
> +
> +	if (state->bb) {
> +		gem_close(xe, state->bb);
> +		igt_info("SUCCESS : Close bb handle\n");
> +	}
> +
> +	/* Destroy VM */
> +	if (state->vm)
> +		xe_vm_destroy(xe, state->vm);
> +	igt_info("SUCCESS : Destroyed VM if it existed\n");
Many of these igt_info's are redundant IMHO. Please remove them, and if 
any are still required I think igt_debug would be a better option.
> +
> +	/* Clear fields to make it safe to call again */
> +	memset(state, 0, sizeof(*state));
> +	igt_info("SUCCESS : Cleared state structure\n");
> +
> +	igt_info("SUCCESS : Cleanup completed\n");
> +}
> +
> +/* Setup function: prepares state->src_obj, state->comp_obj, VM and initial map.
> + * On any failure it calls vm_bind_decomp_test_setup() then igt_assert_f() to abort safely.
> + */
> +static int vm_bind_decomp_test_setup(int xe, intel_ctx_t *ctx, uint64_t ahnd,
> +		u32 region_src, u32 region_comp, u32 width, u32 height,
> +		enum blt_tiling_type tiling,
> +		const struct test_config *config,
> +		bool is_gradient,
> +		struct vm_bind_decomp_setup_resources *state)
> +{
> +	struct blt_copy_data blt = {};
> +	struct blt_block_copy_data_ext ext = {};
> +	u64 bb_size = xe_bb_size(xe, SZ_4K);
> +	u8 uc_mocs = intel_get_uc_mocs_index(xe);
> +	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> +	const u32 bpp = 32;
> +	int result = -1;
> +	uint32_t devid;
> +
> +	igt_assert(state != NULL);
> +	memset(state, 0, sizeof(*state));
> +
> +	state->xe = xe;
> +	state->region_src = region_src;
> +	state->region_comp = region_comp;
> +	state->vm_map_addr = 0x30000000;
> +	state->size = (u64)width * height * 4;
> +	state->map_size = ALIGN(state->size, xe_get_default_alignment(xe));
> +
> +	/* Precondition checks - do these before allocating resources */
> +	devid = intel_get_drm_devid(xe);
> +	igt_require(intel_gen(devid) >= 20);
> +	igt_require(config->compression);
> +	igt_require(blt_uses_extended_block_copy(xe));
> +	igt_require(blt_platform_has_flat_ccs_enabled(xe));
> +
> +	/* Create VM */
> +	state->vm = xe_vm_create(xe, 0, 0);
> +	if (state->vm <= 0) {
> +		vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +		igt_assert_f(false, "xe_vm_create() failed: %d\n", state->vm);
> +	}
> +
> +	/* Create BB */
> +	state->bb = xe_bo_create(xe, 0, bb_size, region_src,
> +			DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (!state->bb) {
> +		vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +		igt_assert_f(false, "xe_bo_create() for BB failed\n");
> +	}
> +
> +	/* Init blit + batch */
> +	blt_copy_init(xe, &blt);
> +	blt_set_batch(&blt.bb, state->bb, bb_size, region_src);
> +
> +	/* Create src (uncompressed) */
> +	state->src_obj = blt_create_object(&blt, region_src, width, height, bpp,
> +			uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
> +			comp_type, true);
> +	if (!state->src_obj || !state->src_obj->ptr) {
> +		vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +		igt_assert_f(false, "failed to create or map src object\n");
> +	}
> +
> +	/* Fill deterministic compressible data */
> +	if (is_gradient)
> +		blt_surface_fill_rect(xe, state->src_obj, width, height);
> +	else {
> +		fill_buffer_simple_pattern(state->src_obj->ptr, state->src_obj->size);
> +		igt_assert_f(verify_test_pattern(state->src_obj->ptr,
> +					state->src_obj->size, "SOURCE"),
> +				"Source pattern verification failed");
> +	}
> +	/* Create compressed destination object */
> +	state->comp_obj = blt_create_object(&blt, region_comp, width, height, bpp,
> +			uc_mocs, tiling, COMPRESSION_ENABLED,
> +			comp_type, true);
> +	if (!state->comp_obj) {
> +		vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +		igt_assert_f(false, "failed to create compressed object\n");
> +	}
> +
> +	/* Compress using GPU: caller must provide ctx/ahnd */
> +	blt.color_depth = CD_32bit;
> +	blt.print_bb = param.print_bb;
> +	blt_set_copy_object(&blt.src, state->src_obj);
> +	blt_set_copy_object(&blt.dst, state->comp_obj);
> +	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
> +
> +	/* Use provided ctx/ahnd */
> +	igt_assert(ctx && ahnd);
> +	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
> +	intel_ctx_xe_sync(ctx, true);
> +
> +	/* Verify compression occurred when platform supports it */
> +	if (blt_platform_has_flat_ccs_enabled(xe)) {
> +		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL,
> +				ahnd, state->comp_obj);
> +		if (!is_compressed) {
> +			vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +			igt_assert_f(false, "Surface compression failed,cannot test decompression\n");
> +		}
> +	}
> +
> +	/* store handles and PATs */
> +	state->handle = state->comp_obj->handle;
> +	state->uncompressed_pat = intel_get_pat_idx_uc(xe);
> +	state->comp_pat = intel_get_pat_idx_uc_comp(xe);
> +
> +	/* perform initial map using compressed pat */
> +	result = __xe_vm_bind(xe, state->vm, 0, state->handle, 0, state->vm_map_addr,
> +			state->map_size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0, state->comp_pat, 0);
> +	if (result != 0) {
> +		vm_bind_decomp_test_cleanup(xe, ahnd, state);
> +		igt_assert_f(false, "initial __xe_vm_bind MAP failed: %d (%s)\n",
> +				result, strerror(errno));
> +	}
> +	/* success */
> +	return 0;
> +}
> +
> +/* Helper: submit a tiny GPU batch that writes an immediate dword to the
> + * provided VA. This forces the kernel to fault in / decompress pages
> + * for that VA. Uses the provided `ctx` and `ahnd` (caller should have
> + * created/validated these).
> + */
> +static void trigger_page_fault_write(int xe, intel_ctx_t *ctx, uint64_t unused_ahnd,
> +		uint64_t vm_map_addr, uint32_t region)
> +{
> +	u32 cmd_bo = 0;
> +	uint64_t cmd_off = 0;
> +	uint32_t *cmdp = MAP_FAILED;
> +	uint64_t local_ahnd = 0;
> +	int ret;
> +
> +	/* Open a short-lived allocator for this command BO to avoid colliding
> +	 * with the main test allocator bookkeeping.
> +	 */
> +	local_ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
> +	igt_assert_f(local_ahnd, "failed to open temporary allocator\n");
> +
> +	/* Create a small command BO in the provided region */
> +	cmd_bo = xe_bo_create(xe, 0, 4096, region, 0);
> +	igt_assert_f(cmd_bo, "failed to create cmd_bo\n");
> +
> +	/* Reserve an allocator offset for the BO using local_ahnd */
> +	cmd_off = get_offset(local_ahnd, cmd_bo, 4096, 0);
> +	igt_assert_f(cmd_off, "get_offset for cmd_bo failed\n");
> +
> +	/* Map the BO to write the batch */
> +	cmdp = xe_bo_map(xe, cmd_bo, 4096);
> +	igt_assert_f(cmdp != MAP_FAILED, "xe_bo_map cmd_bo failed\n");
> +
> +	/* Build a tiny batch: MI_STORE_DWORD_IMM dst=vm_map_addr, value=0xDEADBEEF */
> +	cmdp[0] = MI_STORE_DWORD_IMM;
> +	cmdp[1] = 0;
> +	cmdp[2] = (uint32_t)(vm_map_addr & 0xffffffffu);
> +	cmdp[3] = (uint32_t)((vm_map_addr >> 32) & 0xffffffffu);
> +	cmdp[4] = 0xDEADBEEFu;
> +	cmdp[5] = MI_BATCH_BUFFER_END;
> +
> +	/* Dump the first few dwords of the BB (do this BEFORE munmap) */
> +	igt_info("BB dump: cmd_bo=%u cmd_off=0x%llx region=%u vm=%u execq=%u",
> +			cmd_bo, (unsigned long long)CANONICAL(cmd_off), region, ctx->vm,
> +			ctx->exec_queue);
> +	for (int i = 0; i < 8; i++)
> +		igt_info(" bb[%02d]=0x%08x", i, cmdp[i]);
> +
> +	/* Make CPU writes visible to GPU */
> +	munmap(cmdp, 4096);
> +	cmdp = MAP_FAILED;
> +
> +	/* Submit the batch */
> +	igt_info("Submitting faulting batch to write to VA 0x%llx\n",
> +			(unsigned long long)vm_map_addr);
> +	ret = __intel_ctx_xe_exec(ctx, local_ahnd, cmd_off);
> +	igt_assert_f(ret == 0, "Batch submission failed: %d (%s)\n", ret, strerror(errno));
> +
> +	/* Sync to ensure completion */
> +	intel_ctx_xe_sync(ctx, true);
> +
> +	/* Cleanup */
> +	put_offset(local_ahnd, cmd_bo);
> +	gem_close(xe, cmd_bo);
> +	intel_allocator_close(local_ahnd);
> +
> +	igt_info("Faulting write batch completed successfully\n");
> +}
> +
> +}

Remove this extra  braces.

Regards,
Karthik.B.S
> +
>   struct blt_copy3_data {
>   	int xe;
>   	struct blt_copy_object src;
