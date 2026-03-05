Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4BEEF310
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 07:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65BB10EB1E;
	Thu,  5 Mar 2026 07:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTV8hZTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7210EB1E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772694656; x=1804230656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hfvgtgfUwLVc3PMn/xMwD+KLA0LnsJo+FUniEPytmZQ=;
 b=XTV8hZTAf8EP72ll+ohO8hIAG4PahVno7U5yvJwY45ewSCm5dMm7f+yX
 QYkefJJ7/n2jv3j1WA/ZuxA8hMpW10zatAcs9JhM0C1SJ41zo/TVWJYeG
 bG8Od3wdV1BP8vJ8XtHhcfm/C+R+bQI3MQHeHVWsPk6DIUQxW5LY9qI0O
 +mL0qBjDVd70e0E+FMDT17KzMF/0cySWPuy16aeXrEDyG8y4rrA9jx98m
 66OII/OEaI9CFVVb0aUEfG5HWSUpw3Lig985qpLEg40Qfh49e4d1BVtSj
 b+Z/UUwA59rKogFFtuFO4oTtXv7JHbVjK8C7wPsB0uyVcofdzIq3zMZHv A==;
X-CSE-ConnectionGUID: f5VUjtgTTdW01hycmk+0zQ==
X-CSE-MsgGUID: dD8+QpY5TkeyVD1gwTY+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73893058"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73893058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:10:56 -0800
X-CSE-ConnectionGUID: 8b8pDzb9Rj6J+ziHKQtWnA==
X-CSE-MsgGUID: 50AviRIdQBOkpbntOC7/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="215434357"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 23:10:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 23:10:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 23:10:55 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 23:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6CJBTA7pKJ1UCS6fg8DNqpdTIJltyY2hEQwNDj/KEtenqFDhX2pD04/9r+G3EQawoyM3Yt9NaQQCM+6C12/WWaPynvSwy7mnre0W6Th8PLyg/ioTQwjw4rdh3MDAo3rx8MtDBkbFnFUPla7se+gkV6RjosgccIA0zZ7dFOMKWz7OYqaEGmv4A/xr/bLPzr87+5i8OtGgqdZ0yCVYQJ4727xqYLGpl7DH7HjamM/8RD+VKqij3X7uf8icaOKmkotEzlmOgWfqurMBGYflTaye14hUKYk/3N84meXEBjNJ8hUBhzX+FKG7ZQdxkXP1quaxAIV5RUlKzQ/XBpY67aukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD6lUdGlRt7NOjbQ9rCyQrWESILXXLgBw2CoJRmOGBg=;
 b=EwwcYNpLE9yS1OhqoTVP9SntzoRMGLU69wyvO127HUeqPbwEEaBNZpBNEhEdI1LvHJiysacTHidenacC/O+bEKh/tUrWgoi8VUfthEJ1qm+zpYP1S9y9xordq2iY49nmWH7LoR1YK9BUrun80D+3lklVQghU8HelrJVCJ+kVDMAwm7fMOlKjyBItLTJ9TNZGrPG5dsbLlgAi5KEqBqKD+FO5SIOyy5KesOpacy8HT+DHLpH9bH3ZZ3YcQEu5VIZHCkkjsoe0zaXNwHqVp0R4cFNogNZVe+DpQ0PewIUQXMymVFbq0GKpPpGlKnpVOUooVcDt8ChXrdbsG8nxtnri1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 07:10:44 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 07:10:44 +0000
Date: Thu, 5 Mar 2026 07:10:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <karthik.b.s@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v6] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Message-ID: <2wf2aebazvprqlnnukn7doq4u2hpzrkqwwfeio7tgfgduyeltu@vttxi2ol6qrw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260304114958.959180-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260304114958.959180-1-s.sebinraj@intel.com>
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: e25689c9-04c9-4a26-6565-08de7a865119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: J0I2YaGlHroFQDDZUqxjiQgR16z/20rtZTCUur96cbjBkErr2EHz6IYw7TN73EYKMaq3GsjQTaERaAOFb5q6Fr9piOicdShkRK3ysHTw+lEXldBnRVsHotX8YZhYHyVWNLG76Eebee2H9VxqsOuZXA/eM6U6mBWmJ1/s7tMmuQ44KGILSbVOip38cb3VNh8CNa/Djrh0DDgSJn5S6DGTKDAYvFX0AHm+ui7WCCtXF79/udgBX8pwk07h3HUv/IR1mulVGgJuNMhr6pXwYOs4fge4eR2S5hQMNmuReBV5PWjt11ZqWHPzYT7DXeKHsKZHErr33D4Lef613rp+ZssrsiyvPwBj2P12s1jmTeC/zHUXynyT20lpKzv8wUFo2qwcdifYPDDW8kCgmqHieBD81VEiEG4LVbjgAnHKVXf5H953vQk4vuq1bWeCwOPw6zPtrKz5yCXGRlsKMb7kcPjnSnNDjsxfCc6UWgWxCg7Brna6el0UXxg78Y8SH+dgyCdoEoytGIlAuifLmaToUxgZdK7qd1xNGRf7s8SCBBswTZEbWYouvC2GoPL7vdx7ucpeSavn8LKolpXoePtXwTZhp0LQ4RUMbGJtLgq/Q7X1QHdb/wrkyW2CZe3kGWrpxrdhS+DCiXSYV6Wnpq+N+mvqkvoI4Qsa9W8n8W2zdZPyvA8+spvxmIRbZlbvHLLwjLZl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkJnNmFwUUJrRnQraC9MWTl5YmRUOHh2aU90YmZqZk5RSS8vWXJNWThLOXFu?=
 =?utf-8?B?ZGhHcGtLUDRBWlllYkQ2aGJGaklRLy9VVmhLOEo0R0JzM2dYS0h4Vkw5RTlV?=
 =?utf-8?B?TlRtV24wc2ZTMis0T3ZoVDI1MlhibzhlMTFRNTViYTNzTUJWQmFDWkY0YW9S?=
 =?utf-8?B?VThVRU9aMnJxU0VtNVh0Zmt6RGNWaTJsQzIraUFib1N5dFRRbVE2Q3ZtL2xK?=
 =?utf-8?B?cEd2bzlJa2RCTUpxRmlkMW9xc3lBSkozRnFuTEIvRTZvV1Bia3BuRkdZV2s5?=
 =?utf-8?B?Y3hTWnVqRVdvTVFVVUpjLzdDRndDVTFWb1dhWS9ZYS9PMDNIdDN2UlVvNDBC?=
 =?utf-8?B?SWJiZWpDRHkvOE10RlhWL3p1UkZSY1V2OUdwOUU5SmlQeTVoV3l5WUdLMnFj?=
 =?utf-8?B?ejB0MVp0NWZNZVNpaUFTdWhhWXVYYWlYWXpMcmhyN3NrYjVSM3dEVlhUM2xL?=
 =?utf-8?B?aXNZalJINEtNTndjSklkRmdlU2RJK1VvVTRBWHAvclhUcDZLMzNwcWJxZlRa?=
 =?utf-8?B?RWUzTXdYWU9JdEJyS1pPakpqUEdOdkxlYThBWnFLeEFHRSsvVzRoWXNRclZw?=
 =?utf-8?B?OHVSRElUc3poNGJ3Z1RPUGgyUERmWFMrMSt1OVJiQ0xPUU1xTFVOdGZWQmRI?=
 =?utf-8?B?L0Y5MlkyQzIyYmpWM3JqWlY5SHFJS3o4SEg5Q1RISXN4SzNxWjdjUFA0VzhH?=
 =?utf-8?B?ZlpIWTBRVnM5UXpuZkkzZ1kvNTBKYjFnMzdINDdkSytUU2l3eEl5a1ZpcERJ?=
 =?utf-8?B?OE9sQyt1b2lqMDlLSlJ2Ni9XcjI0dFZhRnE4OW8zSWJ3ckdjN0pNZDl4QWJr?=
 =?utf-8?B?OGlNY1gvRDNYek5TTHhta3BJVFpCby9TUDZYNy92aXZScjQ2R2MzdFBRZ0VO?=
 =?utf-8?B?YnZHTWlvcGd3TXdXNlczS0VXYjZTMElQZEV6b0pveHloL25iU0JvTFJWdEpV?=
 =?utf-8?B?WHpQSTRBOE1HMGtVOTNoYWdwYUk0My9GZ2tHOGVmNGVTejB1dHBkeFhVbXlP?=
 =?utf-8?B?M2xhRThsWGRNWHMwNG81ZkFIWUlacHdGQ0t1RWJYeTZ0VDlRQkZ5dGtxdVRF?=
 =?utf-8?B?dGh0OEE1eDFEZEk3N0N0c1JGV3dWS2hkU0RMeEhIN0V1MWFBOUJXZzU4eGJT?=
 =?utf-8?B?MTdnRHV1c0wxeW01SHN5OHFFTDFlR29ra3FWYTh5YnNRK1NzS3RlOVREblNs?=
 =?utf-8?B?WWxTUFFLdlZDS3h0T2lsci9rbGRMazlGakVvd3kwNWpYWmpyQ3BMcGx3Ulp2?=
 =?utf-8?B?Y2xEeGltck5Gd0htZ1NHbE10bkpBTlVVc20yZHByenNvS0l2VVQvRmZxVEQ5?=
 =?utf-8?B?R29rajB1M1BldzJQdFhCT1pRL1E0aWNUdVQ0WDVnWVpWQm5JekdDY1ZDUTJn?=
 =?utf-8?B?bEE1MnVlQXppRXdaazJuRGdxcmlxZmxkTE1BRE1oSkJ4STI2U01VUnRHdnhs?=
 =?utf-8?B?aFd1TExOQjJKNitDdk1pa3dwN1h4SWYyVDYzUXQ1ajI3elV0ZGF1MkFsUDhs?=
 =?utf-8?B?MDdnMTJGaXlKNnZyVGlsSEl2bFk1RG5JYkIwcXNEV1cyRVZzZWxGOTAxSExZ?=
 =?utf-8?B?NU1kbnhaTVZWVS9MclpyQkJHa0swVTliOXJxVy8rOHA4M1hyeWV1Wk81R3NS?=
 =?utf-8?B?aXJEL0x1NVZlSE0yQWw0MjdQaVVkSXNpUmVhRkhVWXVmaVY4WVA1OERLdXRT?=
 =?utf-8?B?cnRKcFc3MWhhNEJqZnY2aXNlSlZIM0RjdGJRbHRZUFRadEM5VERWR0dDa0NN?=
 =?utf-8?B?R0ozTlVFbkFERGNlb2RkKzJPWG9OdXhFUWtVYWpLb3hXYUdQUElsVXFVMUl6?=
 =?utf-8?B?cU9XTk93RkdjYVJGaW51QVlEOEFEZHhxT1B0SHJFa3ZjMVhNSUxvaXo5K2c3?=
 =?utf-8?B?dmJQY0RoamhlS3p1THVCNEVpeWt5ejFmZkxrRmNYUEpqTUFLZHRwdHpwKzFH?=
 =?utf-8?B?a3NrVkFMTEVKZk0rMElzbE0rcllMVyt4OU1qLzNWK0pSTG1GNDJ1TUlna3hQ?=
 =?utf-8?B?R05sNnFWZHZNNGxsbDF6WE1heGtjKzRFU3dyUjlUb3J0cUZvSDR4QmpraDhN?=
 =?utf-8?B?SVlRTDN0bTlFVzJwbCtyRzhnTHhuWHJmWnFKc00xTWtOd3ozYU9CZ3poTys2?=
 =?utf-8?B?QVZtOEZOTXc3QlFBYVljRU0xVlVzSDZZalFCdnp2Yk5qNWg5SkhqdHd2NDFG?=
 =?utf-8?B?SkIvTDlNQnhsa3VjNytCU3VZVWpwb2Uyd0xieU95NXpLclRiZUt2SHVobkxl?=
 =?utf-8?B?VXlkQkhTYmpBaTdYT1ptRXY1UVF5UVorakh5RnFTcHEvYXNvQmIrcUVCbEE4?=
 =?utf-8?B?YUhqSzlpZ0VNelkwVUo1QXh3SzhZU2k1SVkxM0FnRVJoQ2U5d3FKL0c0VS8w?=
 =?utf-8?Q?GsexIeV/PsLzTmLc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e25689c9-04c9-4a26-6565-08de7a865119
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:10:44.2505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLRtee7XGI/HephsbWQohSlHRJNVYAyrdG8l4T5xtcRBAhFW20uc6DDiSYaWMQQv8wyMISk5D3131snRVvtoZRI9sC6rYTQEemnjLczlCTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

Hi S Sebinraj,

On 2026-03-04 at 17:19:58 +0530, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
> 
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>    - Primary plane:   signaled fence (simulating completed GPU work)
>    - Overlay-1 plane: signaled fence (simulating completed GPU work)
>    - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
> 
> Bug Detection:
> This test catches driver bugs where:
>  - Planes with signaled fences update prematurely before unsignaled
>    fences complete, breaking atomic commit semantics
>  - Fence states are mismanaged across multiple planes causing visual
>    glitches or corruption
>  - The driver fails to wait on all IN_FENCE_FDs atomically
> 
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
> 
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
> 
> Background:
> - A bug regressed for Xe driver on PTL (Android) display handling
>   of explicit fences when provided two or more buffers at once,
>   with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>   https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>   use of explicit fencing in the KMS Atomic Modesetting APIs.
> 
> Changes:
> -v6
>   - Add crc check of expected frame with
>     reference frame
> -v5
>   - Make overlay plane validation scalable with
>     overlay count.
>   - Modify commit message.
> -v4
>   - Fix build errors as per latest API name
> -v3
>   - Add crc check on display update
>   - Adding proper License entry
>   - Reduce test description
> -v2
>   - Add crc check instead of visual inspection
>   - Reduce debug logging which are not needed
>   - Add a function for initial modset
>   - Make test not specific to Intel drivers alone
>   - Sort the included libs in alphabetical order
>   - Modify set_output func as we want only one
>     output per pipe
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
