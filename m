Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DCCA5FD2
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 21:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9402910E084;
	Thu,  1 Oct 2026 21:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkOfw1E4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803C10E084
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 21:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790889603; x=1822425603;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=wAp6zeCkikIwpOh7T7xjUU9PYJfiGPqSE1Tgx8myZTI=;
 b=PkOfw1E4kLikSfV4bKHCannB+0bRUnACN4cMbgFOyGKUxWVbT4YljkFB
 AsVvPzlzweBQj0XxRxw/M91FSgrmWe5njPMAotyPhGdP2UHPy2cVXuHjd
 6jUccMpSg2gyP/6E1viBTnM0MJZO4JNvXhc9IHhG1dX9k1t+avRJiYG+D
 D/WjjhKhFZxsYx8+JmgFqQzNtOratZapaIBEzEFCRO1aW3JbeDHqSbcZS
 2WCIZ4jhGrFtK6lGyXshR1r7adb3+myMd4HWBtN+L2vfR2fQDZo/mTIqA
 VZhqWfzHW2cuwOIa57E8ewuy20I7x9PC7q9gE9rHvuNs5aUGe5tXstGAa Q==;
X-CSE-ConnectionGUID: EzvzjDIeSViYNfg9PScsew==
X-CSE-MsgGUID: zwnzaOIPReylRQnnEwztHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108039539"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="108039539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 14:20:02 -0700
X-CSE-ConnectionGUID: iTjsjMKMTKOwtlWelRnmRA==
X-CSE-MsgGUID: LrrEMUSdSsuGl5Isn3Djaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273913653"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 14:20:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 14:20:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 14:20:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 14:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4HFM8ssC1f0nwDi35p1VOeoimuv/eHgfdSoW3+prIOTVPnFXweIr9P1axAiYs18R5ZfWEQFzMLwd9w5SaeDGsk42LMl31wvREZPRBaJgMBJOf37eCXF5QrzOod8XMuCAy+bwNUBcNS/BaaKDU0a+HohLu0wmwfe2bCbtTlB8CNi+nK/wqBrGw2NT07GVEUqvLKQJNklHdeF4WE/0kcZdaUNRgcgiXAyVFwbB6gIGGvJP9v1laLHAtvplS88DTYTLcEfOYt9xxmIJ9N4EjnHe1gBAfyi4QBh+/5Us4zCXo83g/PPd4kaaGP+ICTKVdzQXy06zz1wtLa+pKhMXU/0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TUdbqMl15yKJvuR2K8XXweai3nENcIHZYV5pq1NKn0=;
 b=nLjdynZpLdNuRsubg9sc8LrOlyg8f2OpUvmZ9gnWJn8L5DJaD61YsGgBU9JB6wG1uU7ce0aWT3U7bp6TsoWAj8DiedMcZGRLJT3mEYIbYrCgNR/eKQjuXoSZCv10ZGPPm8AcgR8v/dvJZuoBy1CiyrQUbyRAOwnxuajT8NElwe47LH9sDfblOMSq6jpARhZkgmT7HdEUxlRIrbzuuESYBkFIUIedkCmtb047qW+LkYCC4txyPUyHrnU68lle+1R+k7V66dmVnOX/jnL6uDU9pN+aAbzU0kqUFV9J5XQchN8Wypswi27/nRidtQP3CKdgVAJ3oEu0j/lZy+rms2CU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH9PR11MB016272.namprd11.prod.outlook.com (2603:10b6:510:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 21:19:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 21:19:58 +0000
Date: Thu, 1 Oct 2026 14:19:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 tests/intel/xe_pmu: Fix test to accept single VF configs
Message-ID: <ar7Oe9XhDXzQXxs1@soc-5CG1426VCC.clients.intel.com>
References: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
 <179065552019.216888.5852758021529793951@61270ab9df2a>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <179065552019.216888.5852758021529793951@61270ab9df2a>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH9PR11MB016272:EE_
X-MS-Office365-Filtering-Correlation-Id: 962bbe7a-9310-4c0d-6d0c-08df2001bf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|10067099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: VtSCrw5dpr8K/qddnvmBTYWLtHp7Vr6U1+QA8SeJ2kDuw58LfRrZvexfJuigrbg2X9Ht0kM2jjZVNw8cBM7i3Roa5mKT8Io/kPR9S+CYMNqKh5eEMUI9Ve0BXK5fe7oKKKmuZcWZZ/1f0pc9OgtZRjT3+zpPy0t8ZxmobAtfnD5mlnd7HOZlbq6o5/+tNKAXH7IHbu8vvw3AZu7cwZ2GDMk8yIrjciakFm382mYkwlCLgm8j8BAwiO0DdUuG104rNsZbTYAPGx+i8qFyi6E+GXSdfDLAeeW09aWcGsvaOb0Mm7p2/YA0ZuhS7laoOKh8xhYM89Qll3dvbtKcQY/wvMUIdeWJYaLBbI6cnnu2nAIMVvQFN5DqeEJh+Pot3hpHG7Xf2RbfHkfhnP1GwmWSoE+6oPZPRxdWJdrHZyXj5YKrfcACY91SENm8uQZ9/Q8mZZDijZEdb7bsMyDlwVTBgNNES7lLNAxjtkpr+P5QyRbN7JHFzxbabzcbzgi6WFcFvQFYcHsxZOO/I6mZDcw/oYXVmvMoB3Cc8M7Tj4DJH+xMNJx0fhYrVRJgCOIlwKiin6G4GuBs1PM9MsXhF9xqep+Ck4U0UznRpvfB9X6Rt94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(10067099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhQZEFENE9yaHk1NzEwYUM1SWJ0dVdpYVJocElONUdlSjRsTW5jVWtpVGl3?=
 =?utf-8?B?dXMrQi9ZL2pKamdPVk5OVytGaCtYNHNpMnNUbmFjU0pac2p3cXdadlYrZGVI?=
 =?utf-8?B?R1lTcnQyMTZzWG9QdkRhSGNleTN4c0FSL1RIdUkxYkZXREdTZkF5K0x3U2M3?=
 =?utf-8?B?RlBKSE1ZN1J2dHhnRmtEWHd6QVZvYjI5WmkwMzV5YTEwbXdtdlowaEJ1Q0Yw?=
 =?utf-8?B?dkJhZG42UW1NZFc3S1lTR0FOR2tRQ3pGOGtnbFlMeTdYSysvRWxjMkFvaHdn?=
 =?utf-8?B?QmozTGJpZnFKd0lsRUc2L3QzN1R1UlJVakluM3N2b3I2OUVaVGltYncyRU5w?=
 =?utf-8?B?OHIwMTFjaHBjNHd1Y3UwaVFkOHlyN1RIeHExL2Z6QndNMjJwYlZhSUYwUVdP?=
 =?utf-8?B?MzBMckhWWDVQVGx2MnNkNEFJeHRwTGg2UUVWUENUS0VRUlh3QzZucnpmSU1o?=
 =?utf-8?B?VUdJSHQ0UVpUTmpNYndDNTdrR01DS2N3TnhHdmVtMnBWM0d6cWpjRlgwSzdY?=
 =?utf-8?B?bjlpTnU1N0tVSUdnMEd3TWxyemR5NE5OS3g3NDEzM3lLc2d0TjQ4bk5FSWox?=
 =?utf-8?B?RlNxQW80Mk81SEJJQko3OTgzVVBoUm1uYXpxdTRIejI1WlpYK3lScWRSTklh?=
 =?utf-8?B?T3RtUnRGdVVHaHJWV2FxN285Vm5WajdVQzZzcW5yZnNaeGgzUEc5ZGVhb3BH?=
 =?utf-8?B?TE4rR1phRk1lSm1pdkJaSTZqSjRBbG80dEN2ZFZicTlYT1FPdkgxTjFhVWtF?=
 =?utf-8?B?djhtR3E4Qi9aaGo4Wkc2NDF4aXRFZXFyRHMrVDBaTWJ5elU0V0NQMVArMFhW?=
 =?utf-8?B?dC93ZmFCM3BQQzJRTzg5WjM4RC9kRGgzTm5kTjk0dEdhN0tFWHhKMGxSTDh5?=
 =?utf-8?B?bVRETFpwVmx6emNVUk1IOVB0N1FuL1U4T1JyRUk1dHFEVXArZldrRUlZc2dh?=
 =?utf-8?B?eTd3U0ZiWGhzMHZqVnlWQmJ3bFc1bklYK3ZGVEptREI4Z1c3NnZkTGl0K0t1?=
 =?utf-8?B?UENlK1VMRnNxdVZlVmRkSTNYR2tqdG1wbXh0czcwQm1rNVQ2Nk1XSVV4bXQv?=
 =?utf-8?B?djk0Wm90elp4QXVJM0l6SW5GK3RQdUNOeUpZb3owaldLNlBOY0dMaWZJWGdV?=
 =?utf-8?B?VzR1UzhHczVvb0F5Undlb2JYc2pmaFdsZ0RJWG9nQzkvTmUxVGRnZ0lWSlYy?=
 =?utf-8?B?VjllRTducmEzUnZraEtKSmFoTHQyc3dDb2lwbWlkNjFaK3ZSNHVEWWVXZFdQ?=
 =?utf-8?B?K3JiUW4yMXhGR2tWNmhEN1owSnV2UUZ0Q1VUWm0xVXJabzJWYUR2Y1VSa25E?=
 =?utf-8?B?K1VSd1hqUTV1aW1xRFM3Y0JBWEVwT3VjQWdQWk1RT09RL3dyZXZqUllOU2w1?=
 =?utf-8?B?WUxRT1N2bnJ2Sy8xcVgwclFyY1JJK1luV1NpRUdlRDlrSUdEVGRVOFZVUnlv?=
 =?utf-8?B?MmVZWnpCUXBoWTdvVFBGN2ZnZWt2SUhGYXA5K1JLWWQ2eUNLSkpNSEl0NEtF?=
 =?utf-8?B?eTB0WC9kR0dNaGxvVTlpQlA5OHFoWWR1VC9vUmQyNTBMQ3RhZzYzbDZiSUJJ?=
 =?utf-8?B?N2NNdldYcUFTY1dZTFFEaENhWDhVMDJ6cFRXcHdPaStBcTRma3lheUFJN2VE?=
 =?utf-8?B?NnJWSHBqcUlJY21Fb2NDc1c3UDFVY2NxWldXaXV6K2IyL2h2ZFhyK3A1NFln?=
 =?utf-8?B?OStEQmtqNzl0WkNkTXdlbW1TbDEvQXVFeFVrWVFvZjhmd0ovN3R5a0RaVXdO?=
 =?utf-8?B?UjBVajQ5UFMrdTIreFV2dXppbEZwbnRNQnhKY0lIWENNWklCWFdKZkdzZDYz?=
 =?utf-8?B?VWFocUcreCt3aWdRVk9aQjdEOUZmOUtFWEttaUY0eDZqZFV3akVtK20xWkxq?=
 =?utf-8?B?a0daREhZQ1FBWENKTk5ZR0tJelNJcDdRV0NtSmNsRXovSlBRbGRRMzh4dWFF?=
 =?utf-8?B?aXQyU2RiczQ5c2dGMFVuWGJ3eWZ5bjZJM1JvbUJTREZ4ZHNpcitnblhFL21l?=
 =?utf-8?B?QnM2bmtnTVliOC8zWUNkQWQ5d1pDeEg3a1YyVUQ0UWlOajV2OUl5c3lJWlV2?=
 =?utf-8?B?cnZrak9zYTNGcUZ4MWxMYXQvQ2ZGMnpVeDlKQzdXZ1F1SUhFS2piNDVTT0p1?=
 =?utf-8?B?ODhVMHBrN0k1cDV2Q2hwL2ZzMWJWZldlaXRpQ0V4MTk5WG0xUENYekVIMDBh?=
 =?utf-8?B?eHk0YU5ZL0cvVTNVUVNxK1FKeE85a3cyNy9LUVN6cjNVcXpUZnpyMmE2clo1?=
 =?utf-8?B?L2lUbmk4Zjh4S0Vlb2ZsNDVVVFAva0ZCSFVaNnlJMVBnZ3VuemgwZDR3bk5I?=
 =?utf-8?B?YllMd0ZDRkVFMkNXakk0b3ZhNVRmZjlubWhsZFZPVzVxclFEamR0TGlHTU1y?=
 =?utf-8?Q?/nJjoQXmsXtOPKRY=3D?=
X-Exchange-RoutingPolicyChecked: Y0kgogxCBL22ybnZN8kk7rU+jwbw5zKCN5/uuYkEbkzqGTgtFo4RRuBu/AayLRVFiwFxfoOaJG2RqNEgH+MlTtBklCmo3BZxtz6yqjaA+4NjmXGS5RklQ1kfEUYF8Xj00UXMU5vQZ/6l/UZH2JZnn72M1YlPPNY6Ye/+PpYPw71sjPnXzaVT2XkiZg+vGyaZRPHRzanbOVvObnhkXN1RDHqLlES/xZJz0l0UmKyguclxY37lFlVrKcflWkmkTWE3/uzjVW4xZSvHJrMEBRC5C6+FX/z4gUU40vv7Dz+VXCJ5JZ0BQUYivllsosZXUfakRiFK8SeDUu3DxpMl2Q+Zrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 962bbe7a-9310-4c0d-6d0c-08df2001bf04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 21:19:58.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qead3+MdNTKnDBHQs/05jIbBnJpZLTaqzgKxfzySybpRSNW9anvb0djkvDwLbDMo22B/QfZ6YpsakA97EADPFSUTsK/fFd6673xL6fvFP9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB016272
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

On Tue, Sep 29, 2026 at 04:18:40AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_pmu: Fix test to accept single VF configs         
>   URL:     https://patchwork.freedesktop.org/series/175142/                 
>   State:   failure                                                          
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15912/index.html 
>
>        CI Bug Log - changes from XEIGT_9114_FULL -> XEIGTPW_15912_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_15912_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15912_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (3 -> 3)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_15912_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@core_hotunplug@hotreplug-with-load:
>
>          * shard-bmg: PASS -> ABORT +2 other tests abort
>          * shard-ptl: PASS -> ABORT
>          * shard-lnl: PASS -> ABORT
>     * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>          * shard-ptl: PASS -> SKIP
>          * shard-lnl: PASS -> SKIP

These are unrelated since patch is only modifying xe_pmu test

Umesh
>
>Known issues
