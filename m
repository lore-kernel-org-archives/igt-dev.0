Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C3BC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 14:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C33112D00;
	Tue, 16 Apr 2024 14:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYvTqT+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED3112D00
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713279419; x=1744815419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CpQ89wuMOR4c3rUNIFtIdaQ/hOkadHY3LivpkUYCgb4=;
 b=aYvTqT+dqAIjwYUgMlyRtx4t7DPtmjjkDhc6vE5lO8jkM7scJletJSYJ
 PfvaSS/VYlnKwcoaVE/ZiCoeNl3awISxFpsNo5hmsNjixC2rS71kAqpIa
 +HXJuJgf1lBe2g72diJGJkvzYIkh30vkxnAaSef/EidTVphdGX4KYYLOJ
 vTkm+tCiH4blyiuDaHge1WZUeqxlmKTHYPtMUfKB45hG3mDC2dN5mZjsS
 CE/e5AwVC9n460yAjzE6NvAMGfey3X664BsRXU/i8y2fwTTxqFtQSflPl
 f7/9FSKg27ABAlVbinB72yIefQvv6W7YCgVfGeB9oQOfdc52E1aOi1X/m A==;
X-CSE-ConnectionGUID: aU4OYMKARG27z5WC3RRn1A==
X-CSE-MsgGUID: Hn7+2/mYQveNMlhvOxOnIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8554000"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8554000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:56:59 -0700
X-CSE-ConnectionGUID: 8tFxmXleRkGE1KQBuU09Kw==
X-CSE-MsgGUID: WaRG2279SoiUgq6XgrHb4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22176588"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 07:56:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 07:56:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 07:56:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 07:56:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 07:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvZB/kCaA0n3oQt/cHb4W4IYyU3W5XCcRM5dviPDEFxRURIXktifZ5rZyjkgBWA8pVtCVEaA4HfMw9BubXX+6E4/teD0VN38ie4hS06Cci1pQDDzeMf7d967FTF2kz696nBIo53s0TNdStKH8IPFgXlNe13BAtHqLUw0Yyws+x72ZRkvzxX5z3gDfuUcBj40oR+LIpc45Gtepu63tyVm09TAzVSofeb7ePBQHy2KMlProw7sf7GtjiifzweLNTeZVRCLu+bALdF628kxSAm0KCyMdIGMG8NOHZCUCNkNtJ5TCCSEIxcm6ud4y/HyYp1ZvB6kIo39Ew3IB9XpVpbvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex7vvAMncFq17/zfscAwg4b533r867W4j8tqKxlZtpE=;
 b=nkoRXRjobPRVvHGLvAv78AYfLXoH0kJs1bK/8jq5mecBYPzFhYGhZ/3XuJNVMh1PKjjcP07oP7tcJRvDARCTvn6Rz3JyxHlQeQdHd8jfilJ75qTs6nFPxna6ige6MRASsbUdOhA17y7k9M+/CcHS5ME7U4L+X2E73z1AIxOM2xoL+RIGVBoDVUgw4Y8f0oAoiRwOLuv7waUvk2toDGb8le7nCrcellZ5+POeU/t3VUAy/NNi1egbOktSako9/7jPSedmOCtiXWx2tVfoJyZ9G8UTq6Jl5A38WL1vv/hSDDQ/BW9xZGPmtcWhOrtVQeSZtqNR3hDO3EUhSMq55qXFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Tue, 16 Apr
 2024 14:56:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 14:56:55 +0000
Date: Tue, 16 Apr 2024 09:56:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Tvrtko Ursulin <tursulin@igalia.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Message-ID: <acrvhljftkhohd46lbp76ndzp6n5cvxgslruohyolkyfk5ibqk@falbxk7rj5vj>
References: <20240403150057.25765-1-tursulin@igalia.com>
 <zpnpvxz7bvryul7c5awkiqj3xdgm4ihat3u2obl4rdfszfmjq4@scbuwrratvhx>
 <4e09815e-9c17-4c02-8be8-9d106738f2b9@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4e09815e-9c17-4c02-8be8-9d106738f2b9@igalia.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: fba0972b-d522-4e0d-4f42-08dc5e25754e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4nNuBA7E2hekCo7x/e7G6prsS+sspBn9V90wlcArFISGmREvJIwV9Q0GLu9dEqcxYGuxd2xmARSyq6ISuY054df9soFSirk6gDFSDIGvwV5Oh/WDnR0CXyAOyYGd8+IQpz7hslLWVKJgpfH4fBa8lrjEfzIRG88ClYjkcawxkfRMeKpg+PGKGfCloU4q+5/zkWscynVD7PvlvQj6OA8+OyXhN71OTsiQ3QDGorqFMaxzodQxSN6Ax1U2eg1WLJLQxQsf77SbKToW5XQ+HU7B3EeFZo32Q6nSGPeQVmCiX67mxNh0wWsEtYVvDKbM7dWNnmF2KpEmawDQwTPMmTvossq40xn/9bSwFzfWZ4MBjXkRl2ipaiKeX5rG4D0Fb232eWkFanEWqwFJUrziTj15brs1PvZDdL5PoUbjAInVwGFme/Aec9wgV/2b+qYuzzCo9Cz+feIziOW2NI2LuqPrcjkcoo7P9BnlZDa3TGgOAC4gbh88BHXHi+yFa5Mt+/b4LQw6IRcXzOLsWjj3jOqNCxof2jtr0a068Cch2S6N+bX2Cuwd8uXKOgwsqsTArndwaBKl9qeVdS8p2BVALhPt+SGRj52hCdCSp298nTQYxP1s2nfTE5cP2vO+SJNlmMVIK9czDTLLTB1MsoDA8VkKMXWjxT1B14z8z5jiVK5TPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L61FkQiv5YMPLrdW78ughfEuPPSQNkth68OelNmYaxqxJrrVnHyGoRYSMsWk?=
 =?us-ascii?Q?XZTHlskfu1auRv8RZ2FcTtL7X/5EAWAS/+R3daRvw8SBmqwYWRG1KWXVkOwU?=
 =?us-ascii?Q?ApOikEeTett1jpbDNoZDmoFcm9DzM41aG6KYOCnHX4YG+TJq1/hkE3+NiE2V?=
 =?us-ascii?Q?N32eRn28MNplG4oGigbTROvBoxPY+IMbw4MPCTI/MsRSN62beIqfez4plfHb?=
 =?us-ascii?Q?/JoZMZLIhKt/gBPl9SsI93/9uAjmKJ8guTpeSQI1+6U3wJ5SCexjOsFLdcJI?=
 =?us-ascii?Q?X+/sCMso65mK5HnK9yST2eA1sjWfSIrCsn8P8Eh5cyMYIjsW0PnL067h/cW7?=
 =?us-ascii?Q?WnSPXsABoejeEQMXjyTzzPU6mH9yght3dkU+XXRlpjLPDB8pneiSX0ulebWV?=
 =?us-ascii?Q?sfVf8gQrdMfflqcrPlHY5XS4l5D7r2noqpDIookKNL7AQM8jzK9Ufuv+cexG?=
 =?us-ascii?Q?Lp7lg2Bg5jdXTm8kAOV3UOpUW4eZ2ojeBxRf+7X8IB3x3fQr45UKdQoCdGS5?=
 =?us-ascii?Q?MFOcVgw8I+RoTgC1ToLWnxIcrd8DsSAAEptrE2mLl6WF8DnMX10pfxKFRga5?=
 =?us-ascii?Q?pJRsqNyXgo4TbH+g48+fgh+CN1h1YyuJIi/+DUZfw97jFRPVGR5ipA0OB3Bb?=
 =?us-ascii?Q?RaPSgDuPtCORHoQINkowVfG732VR1vJ28Qd6iGHlU82Xms7bI3C5+0H1/BSw?=
 =?us-ascii?Q?ywXWFWnANAi9OoViHhL9uEZTRYImeEakaFnWjd2mZVZM7dYMnwkN+l9sLZed?=
 =?us-ascii?Q?lJljXNvPoAbx4ilxY9sTx/olp96J/Q7DO/QrLGMlof1iKR8EJRmFRRBiLGbn?=
 =?us-ascii?Q?+EjODgrB/uBiP6YnRr6WoWLWbyz/i/5XzW1qqv8+VI2bpggLfpEYbSs5QYAy?=
 =?us-ascii?Q?7Fsz7LjDn0M9I3WFAn9GHHVCkQv0qOi8K8Eskk9Oay4XY7UjVpx0/ZcIFBHA?=
 =?us-ascii?Q?ADBku3ghoDxlT5OdSDp47MLzqXvMTndzY1+H3VuOGxKfFFTDiFI3EZmF1D+5?=
 =?us-ascii?Q?6dAL5ejZ6sOZ4PWHD1B/1oVrbFzonbwDehonvhg9Xh1BzzH+kHsQJmrDS7mU?=
 =?us-ascii?Q?y4LmjhO3Ax23cGR0ZS1JKlek7/PXKtoEeiwtx4umrNjbDInVdNCHi8/oTDgr?=
 =?us-ascii?Q?udxvEokr3fiSIFmMkXkFZ/5s25zOD9NkLM0JmDNlLvex/2epCQ4n/Vt8nqHx?=
 =?us-ascii?Q?8hX6kju2nc5cn9hZNTK5wLx9nozDjUgb6wyKw/n1JE8nz/5r0ixEchaZBopP?=
 =?us-ascii?Q?fbJ0OrI7lJN2zBbjz5v0c7eA/7J87JV8H9IvDrt/5lOnigjnQdMAU+Urw0ux?=
 =?us-ascii?Q?1L0yTkOX9+iE1YmRkLAmU39POkL5A/Ep2nwM1TG82UFrv8EbXh+DDCM8QZID?=
 =?us-ascii?Q?Eg4EI9p0D6U44XQA82GcSCCkHNoKp+aGUL6McMrQqNgga53ZNQOHnvBUGifu?=
 =?us-ascii?Q?EWsc9jTlZqx5p9F/oF0YLG3kiUzpEXJtht1PjmcwM7b1Ojyt92XQsWyRYv+x?=
 =?us-ascii?Q?wy+uxEFnuQJJKTqfHEe7UUwTt/2pXUqfz1xf2FSl3ssGEHX92yCvSc8uwlwO?=
 =?us-ascii?Q?9QT21NREFAYM3aNvqBxgaJhynU70GaQCcw4+CGbgSEFTLvdvwCTKOW+Ijr9q?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba0972b-d522-4e0d-4f42-08dc5e25754e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 14:56:55.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr1zX1empHScMPJP+tC8KZTFgAaUbJnIRhk2yqoc3VmXTgh9V7f3zHoVf0ED/O6GjkO5ZWFSFf5wZTgKuIBfqp8FJh6W8z7NTMjEcIrgJTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
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

On Mon, Apr 15, 2024 at 12:29:06PM +0100, Tvrtko Ursulin wrote:
>
>On 03/04/2024 21:27, Lucas De Marchi wrote:
>>On Wed, Apr 03, 2024 at 04:00:57PM +0100, Tvrtko Ursulin wrote:
>>>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>>Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
>>>is completely legal but corrupts the column formatting in the current
>>>code.
>>>
>>>Fix it by simply treating change in detected engines used by a client
>>>as trigger to re-emit a new header. This ensures columns are always
>>
>>That would be kind of ugly if each client uses a different engine.
>>
>>Why not outputing all the engine classes regardless of what the
>>clients are using?
>
>It is a bit ugly but gputop doesn't know what are all the engine 
>classes - it simply auto-detects them from the ones listed in fdinfo. 
>To know "all" would need more code to be added. See ->
>
>>
>>Lucas De Marchi
>>
>>>correctly aligned, albeit with a cost of potentially duplicating the
>>>header for the same DRM minor.
>>>
>>>This is considered good enough for a reference implementation. The
>>>alternative would be to add some real per DRM minor state tracking which
>>>sounds like an overkill, at least until gputop gains a nicer (any) UI.
>
>-> this paragraph.
>
>Can you live with it for now? Until someone decides to write a nicer 
>UI for it?

I think it's ugly to repeat the same header over and over when
there are different engines used, but I'm also unaffected by this
change, so fine by me.

Lucas De Marchi
