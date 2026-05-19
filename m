Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E41CCD4F57
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 11:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C9110E187;
	Tue, 19 May 2026 11:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2PvZhw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282EF10E187
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779191223; x=1810727223;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=f2ry9qjuXLpp2vWf7x3/nFqy8UfG6L4qG1233Z8uQig=;
 b=O2PvZhw3WEISarKHHdhYAJv5oRWfCRzQgDWRMswuwvS598CY6aHFFNPT
 eoEe7jq44jzzSX+Xt9YQzniSvPrt6T6w+3LL8kpITEhaf6lqRkClMWaTn
 x58WK2T7MRkbM/pjlwJYPrbi9a2mRCvJVO3v9m3HJXCQ99770o/048ZE9
 lFwwZj3H59QBN9GtlVhxpKCmqdvsP2d0A3ji4k8qO43ysZHUvfDnnbU3L
 M368hy5o2RXZS2BmRIoa8qE/simoPYlKrjJqG8vTrQzIpmg/+FDxbpfVJ
 tMfW1OQ7rvPKQr6v9jU+u/dWmTHBfafFIoigCZjwROgnAVw6PmbnIhSYl Q==;
X-CSE-ConnectionGUID: GiZzUCV4R/O1CxUuwRRcyw==
X-CSE-MsgGUID: EdG5bdHGSdKGZhIs6Y21nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102740598"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="102740598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:47:03 -0700
X-CSE-ConnectionGUID: fpU9r1TXTpWRWiw1iPhVIg==
X-CSE-MsgGUID: Y1IDtbPoRnaC7Jpj3VcBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244039761"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:47:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 04:47:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 04:47:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 04:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q19GR/oOj9wezjpUohz0d6M1YRJ7/h7+Zif/uCZ/Xhc8inWtpFeGYIr5DF/yFgMkfAkybPVXEO2qwGf3zbqoGbE6JIJzoki+JYwikkQjmsSIEmbrf1vqA4UFjVOERyf/0bQGJWeK9S1UOyYIBY6XHMnygEJgeIHgU35gvRaznkOgeA680uqHGEPdzUlseanz5bXHdGQEXPHEFQP+Iw2owIO1RA4Nk3tlatWzgMBLCaWYaGhRG/OUz9p+ey4LMcX/vAW3WXf1Giu2Wx3CUj+qiZ4t1o7V2x9U838DKWtfR1QWT0hLoqTGzkYSLvqM6KC02MamlyuGneD2i9muWXJUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7XLyATwrcxnAACPQ/CAthGtrTTENiIlDyE38gcYrMo=;
 b=XjDCEsh3vzptUD348BTladiPhQQtqMM9IA0RsDowgcBBSBb3ETO5ppOMkQbT/vBD4IPBwaIYnTDOztvbGOUtv6qI8oFvSDAUhk6h9FsbFEAfMKjg4DsUh8+KY0KSXVIw9AsE05YVyPJyDdwHbB9CJQxVchEg3c0ExICefYZbF+JjKnvcRn4HvC7mr0bbb4zEBwEFbZ8Isb5mMJj39NdBJy2OwS4iRhpL4hjGVmQNfhlFRC55TLb+7aBj/tjZMZc9MMUn5pjmQlNrxxlcJf8lfmqyEwoS9ZwtC9FJwhi0ZW+x1WRmKndD/jWN3yXHapXeEGhmsWmmkln28UaKQBi0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 11:46:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9846.025; Tue, 19 May 2026
 11:46:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 May 2026 13:47:01 +0200
Message-ID: <DIMMNFLMXWP9.248NDUD1GYKFC@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ashutosh.dixit@intel.com>, "Krzysztof
 Karas" <krzysztof.karas@intel.com>, =?utf-8?q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] tools/igt_power: Fix crash on Xe devices by
 initializing xe_device cache
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
 <20260519112825.7c7gpzdpevydhkjt@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260519112825.7c7gpzdpevydhkjt@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e34436d-eb27-477d-f856-08deb59c55ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|56012099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 1PrL/3zCvmVTPcbnObpJTE6NzTpXDWl2hzN2E5D9zrmN1Jt4/b5BxffkKYl9Vxpex0/QHHd0eqTtI7HZU7a5gCxmvJZVpW3KKNmsHN1YeX7M70/IdDP92RGP+04pMc1bHMP/sCUZEynXcEBU+jGPyuluT9FX9WG32IfRbmzCdc5IVjSCs+P+86yzPW5Yn2/sMApOU3AjlJAJVf7U/KE6pUXXyYe+5U/2kHM3zps+ce8S5RKNO8I6/erQ5v5NEZP1rV7q8zHgqdh33R+yJeFlJVKVOXBk2q4SV2KxaQH6TVp/EI6OE5qGOjblFE+lWubyni/grZ7BYOtwM/NmfvZPxeTsRX1V5nVGmi+LDep+Ch+LudonkCWMGQtlVN4c83OD8Izjhff7HGtqSDf9Pd7NMakgzEG9ZdYA8aRCWIeUbqDqKRqPXQzE0AgCgUVHeu3VKV/cvZZ8klmurTTCsCIiDO2ZlqfGwaZa40wKutTWnFl29pxf7bq57v5g//eXaDyVOSfDOBa9QlxIHpJEDZU9+VNxiJA0HlQhisxwLJdl7Hc4qYXmF21AUjrW2e/S5mxLtt0ljbQeRifg/cQ/FkMAGNM6W8zAp91BYerec2cCQZ/B7JX3IKBStoxEupFrQQzzvYc8nGv/APvd8Cam3LFVCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bThiOXVaMGJaMzIxZDdGOHkvUEF0T2dNRmxBNlFLRmhYajVtaUFJK2hXam53?=
 =?utf-8?B?S0lscWZPak9HVDZQck1IMHhyVzFaamFTQ1ZHdnZkWFc0aG40bjVIRlVOQkFn?=
 =?utf-8?B?MEJhOW1URUN0VWxwY3Bod0tTWnVsRkJqeFZMRCtJWlMybStncXZYNWczYUxR?=
 =?utf-8?B?enF2RVBoRVArZG1sMENhN2hpSWJHTG1RNjBkZG9YUkp5NGRVdFJoam82YkNE?=
 =?utf-8?B?Zk1RRWgyL3BGU0ZaU1E1QXRnM3ZsNmtoU2dGWW81WlFmZWtscDQvWWd5RnRS?=
 =?utf-8?B?SSs0Rk5QbHpRMmZkM0hnMjRVSWNQbzFBY0R3V3NRNGxQVUdIU2xZNDJnR3pB?=
 =?utf-8?B?dzRnNkZCcmlPd0E5OGlhS3A4QkxhQ2o5UHBXR0VDRE02VkRLTzMzWFE4aU8w?=
 =?utf-8?B?NFFNdzNPVU5DWjAveUk5a2VpMDRGMVhrZHJTR3J1MThKSytwbzB2cEUwWU0z?=
 =?utf-8?B?K1o4eFdWVFpMN2k0OU1GdXg4Qlgvc3ZvZW9mcm9scnY3S2dZa2xaeFBSU3lw?=
 =?utf-8?B?TGRrTU5SWjBrTjJJZmlJeU1KMHE3U01qR3orRm12TEYvL3YzYVdFMUlzVXRl?=
 =?utf-8?B?ZEYvTTE0VHVRb2F4UkRlWmhXN3BrYmc0V1dmczgweFZzN3ZHemkvZnRXZDZH?=
 =?utf-8?B?SFVmaWszY0VjRHc0azhlR1lhbzZSN3BaelZGU2RYeGF3SHE3NlB4ckU2T1JU?=
 =?utf-8?B?bk5taVpnY0k2SWpZcjIwVU9DQ1JhOU1rdTR2Nzh6ZEVGczYvKzVxeW56eUJq?=
 =?utf-8?B?emo0aTRpcFovL2kvQ0tNN1psN0F4eHFybHBGRkttVkRzYnhqK0J1SmJucmxD?=
 =?utf-8?B?UXVBWUZHU1djNjhRb2EzTE5GemQ3K0pzM1FlR2p2NXg1RnljdHM0UUtBV2Fj?=
 =?utf-8?B?VlYxalA1Wk5mWGN2UForSElKVlFHL0NRS3p2SThsQ3NpZWZKRTNBcnF1WDBP?=
 =?utf-8?B?NjN6a2UxUzM2Q1l4QmNEK2cxaVdhY1lOSDZZajhORDhMWVRPZ2JHY3Y2WXBZ?=
 =?utf-8?B?U3FVQURuT09rYitHMVpnWTk5cE5jUEVUTHk0RTlWRTBQNFVvbm1BWkczWSsz?=
 =?utf-8?B?cUdHUGhuYlNzOUR4R0ptZTdMMlpSd0tpTTk0akxVb2g5TlpHTHg4eEVRRk1C?=
 =?utf-8?B?TExESHdpSmg2RUZJYlRtbVp3akNtWjY2N1pDQVNySkkzakYvZ2J2aEJQc01I?=
 =?utf-8?B?cWFGQUp6RHlOODRxNDJ0WHNZZ2c1U3hlT2NIckhEdjdPUHU2TU43SE5ya08y?=
 =?utf-8?B?c3FER3Y4RnliRlJXSkVJcjd0VDdUVVJlVzU4WDBiTElWU1ZFenNqUmxhY0Zl?=
 =?utf-8?B?L1VsRFMvenRIcEpXVi9RRE8wRkVacFNHYXpXak81amdiL1B1UjcwZlpHV1Jp?=
 =?utf-8?B?VFMycyttSUhsSkpxN3BTTFI4ZWhzRi9lSnRBSFcrVEZsRGs4K3oreVlrV2xZ?=
 =?utf-8?B?NnRSTVZWMEYrS2sxSTBocG9aTitEa3FEK0FKNnJkS09hN0pDSGNGWUJKektP?=
 =?utf-8?B?OThnakFZWGVOUHZMTTF3REJSOUhoSkEvaHpQa05RL2FYY0s4ODBtQ21jOXlN?=
 =?utf-8?B?S3ZyMDIyblNoVTdCWWRkbjRocHIzWkp0OHhzQWVTV3o2QjV5aXlKdEs2TEFI?=
 =?utf-8?B?NUVrdSt5d09Wd3pTbWcyTzJlMzE1YytkK3d6NkUranFGMitRZHlXT1h4KzMr?=
 =?utf-8?B?c0FwQndVVTliNS9hMElreEpoNVd4YnFwemxQb1d4UXZ3dW5tLzA4eG5XU0ZC?=
 =?utf-8?B?U2lINVBET3RCWDRiM2doWnBOTzNuODdqWE9nb1kvOWRMNFVuQXM1M3F0bzlD?=
 =?utf-8?B?SUxIRkpDdEZ2REFzZ0tyQUxpY2lRUTJ6ODg0SnlTNko4eGthbXN6aFpiZG05?=
 =?utf-8?B?MjByVy9GOU40Ylk0SU1ranRtRzRXcDFqZ3lva1I0UGZUZ3U3TmN0eTZPdGE4?=
 =?utf-8?B?aTZHUG9KYUxnbjRyMU5lQ2hWOEtDMjN4ZEtqa1pnMlJKQlB3R2dJUnVneGMr?=
 =?utf-8?B?WnhmdWJaa1ZaMEtKVkhPaUlTL3A2Qlc1eDRLNGZmVFRBa29zQStkUkgrQVY3?=
 =?utf-8?B?OW5BWGVhMlBmMTRpbG94bzU3MkdveDNOS24rQTU2eWZtMm9iNEhKSmJSTnJI?=
 =?utf-8?B?c3RNRGIzU05LMjBQWmlNQlYrREkwNzlobGYvbjVTNThpa0h4aURpQVRnR0Vr?=
 =?utf-8?B?NVFVMldWMVBHUUIxOVMzak0xS24rcXpPWlFMOEdodmE3N3VDU05mU3lZOXpH?=
 =?utf-8?B?R2JBREtUNC8wTGZ0eEdzZEJQSmkwVXY0Q3VMV3V5bmF0RGxlNmJIRnB2MjVQ?=
 =?utf-8?B?WFJnMi9IWWZ2aVBTZWdUc3BwS3VtUUdLeEp4ME5BRzAzSkJJUU5MN1pEV3VR?=
 =?utf-8?Q?JaR2bK4SjAYVI3KM=3D?=
X-Exchange-RoutingPolicyChecked: TBrRGVKglvPWzsoWn8Gb/jAEdd7HS4xbwk9tFnRLRRfYPeOtAe2g2+5XtiSgmPwbeEvcbRrJDad67LJ2iGUT3Gx34wxHyT6gNRLuPHgN3R+R5l8di2GaT5Ekp2Vp+t0JnVelLaT0Ff/DrnXRDOLz8IRx3up/rIQl488wkXKZ9VAR7VwmNp8t2BMm0X+ofzOHKue3aqGnqMotVI1bK/s2hUxSkUcLFULtygFm6T8Trqx3XoTZXc+/NPGbcV+DNSc774os9ymjdYAEBhMzf5j+Y6k0DtUm/tA4WO58BG91qMr7UaRCY5FQ+0pjdrx3QqsidFHA+qO3p9BVwUefLBtNJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e34436d-eb27-477d-f856-08deb59c55ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:46:59.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO6VOAJ4ggve2ypArFJvBw2EzTyzr9H4tJFQ0RdknxvKEoBwSxkspeDFoCNY16vYE7OP5cGolueXFf9VPUdyI1LHwxOhtbjDDaBWRZWWe4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

Hi,

On Tue May 19, 2026 at 1:28 PM CEST, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2026-05-18 at 14:32:24 +0200, Sebastian Brzezinka wrote:
>> Opening a DRM device with plain open() does not initialize the Xe device
>> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(), it
>> uses find_in_cache() which asserts the cache entry exists, causing a cra=
sh
>> on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
>>=20
>> Fix this by opening the device with O_RDWR (required for DRM ioctls),
>> calling xe_device_get() for Xe devices to populate the cache before
>> calling igt_power_open(), and calling xe_device_put() on cleanup for
>> proper cache management.
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  tools/igt_power.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/igt_power.c b/tools/igt_power.c
>> index 6dd180d34..11da0430b 100644
>> --- a/tools/igt_power.c
>> +++ b/tools/igt_power.c
>> @@ -11,6 +11,7 @@
>> =20
>>  #include "drmtest.h"
>>  #include "igt_power.h"
>> +#include "xe/xe_query.h"
>> =20
>
> While you fix it now, your change make it even more difficult
> to remove 'testing' dependancy in tools, see work item
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/16
> IGT command line tools load redundant GUI libraries
Yeah, I know. I can probably handle it in igt_power_open(), but I=E2=80=99m
not sure it helps much with the dependency issue overall.  Still, it
should be a bit cleaner, so I=E2=80=99ll go with v2.

--=20
Best regards,
Sebastian

