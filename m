Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE55CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 12:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8697A11268A;
	Wed,  3 Apr 2024 12:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRZ09u0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9E11268A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712146226; x=1743682226;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RpvoRzvFoXQd854dtUolvYpbEAijR6HdWUTkssyyWI0=;
 b=RRZ09u0zeI4zZzR6K9UsxpgiqqdX7sPiumdQYnbsOwf0xUmUs/g26oYC
 MaU4NS58hN7mwjKNUfk4j55AKHCz4IYASR53M6tX3GP6Op72yRLWkUaC6
 SGq+/2VnDpmW7p+Yh2D10V9HmcMbQoTpuNzqzGkwW3j22E+6xEvLSJcr1
 mNPYbCIAS3heguuLlmXddMOAXL8LR0KRIzo1GGfO1NDlwc/GitCEn7BAj
 QR4pU53WcM1gL0xVlDYViA03ppdqfH2IF+eHwZm032gMNZcNRwDaqk4nC
 x+pcM9MCfS07OATHUOoorpZmDsyhBfAGgq2ydDlCVE+KySpD9lxV0b3qs g==;
X-CSE-ConnectionGUID: WnsRdYnYTGG3b3ezjntimw==
X-CSE-MsgGUID: DPgqvtH6RPGLac3hpH9OIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11147364"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11147364"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:10:25 -0700
X-CSE-ConnectionGUID: JzEoXdrERM6aSzzBRgciSw==
X-CSE-MsgGUID: ylvqUZv0Sxeu78F0q7Pnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18857759"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 05:10:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 05:10:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 05:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuijWxrrg9G6P9E4NSHg3G4Ov37Msdfm+GqVSNTCTF9ZDkjF3b5XEqr9TLnJ6MleH+sYQxEpY8fS0UaeS0nNhP2qZgJqUvw1ddv6/bMTdM+BwXWwkP5bzcr3b7JlCVRJPh8RkM4n69txtK/eif2mnfvJf/zWSZbs5zZX19QCiqIeRuNctpX05DbIc3mKcxCUJUmxHarjroJYJDZ5Yff8SNHBQoye9f/XeyCEIRJfOwJXJr1FATlk56ur6sa6S/GvhnFb/kDmN2AKEVYLntVZzKUNFD6uBbMs8ICFA3Y+OY8IqxtafiqtSV8AE0k2BEclGTlBHZw38wBsA3eWsZem9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEUAH9mJbjsjeKeiv2r6m5kp+VgrUWG90EW5jR9L5pI=;
 b=aumFd8blhlhSpRuhVI0GF76YwLPIWWVELJ0AH0MpJpYErT9eYsC8+d0qDoOUek6jPxaPvyD8hm+F465oThJHQOQTkRw6YVQt9qVEt3D+9hWNJx7CX9m6EZDhihIfbrIQJHi5jA7l5LngVgc8Qjp3la1GtV8NAE+bygFCAOyxgnSSkyeqXDgisTtRFGBfzUgsAzRZBQP27ZdN8K3pHrWgci475IGQc37Irjw3N7sdaqL2VmPLUmPtXqOnPIsC7KrViUglQtZRXoCmReC0/bL7IQopsmvdgkX0cmvBr50KIS1lG0mJ+IlZl1Nx4pbaKu9l44Zuc7N2IGaANKoMWYWIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 3 Apr
 2024 12:10:17 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 12:10:17 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH i-g-t,v3 0/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Wed, 3 Apr 2024 14:09:53 +0200
Message-ID: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FD6hTIjQnACivPeJ4IlTtVn8hyHETK4efa0LPYwn+Uu2Y1ON6MGJb7qX7wD6/5T/VGhz5SmakF3Dnd9i37n5jOyXMiaoW57TrQIOzzOj+4NMO+M5popTXa3MXCfEQQ7+TPPCwArPcsBQnDJB7M937f/bsfbFF0eNvuyaNuXuo3NLI1HubYHwxPT2QcHBr81NeS0vGG5ao0U9es+1PTfRhP72TdQloabIybAfp50qgmkAMhASU4MzpCbppA+XODkWEp2un17DhU/Z/+lowMyMxhj6svf02EmZFM4G+Ax22OlyuvXVLxe88G4oHuQRlKIgG0id7J//wHWYmnvRJJwkuzgVcbUKyAPR6cmBo7SNVVaONFDeDu3bnqn2trEKBwNie66WY9YHu8XTpuImK4bxe2EGDYjp8QrfxCAlgjdRNnIrZMtZLiMwcRjnnAstjhluHhC82q5ztyel71ZeXHH6oi8oq61hA3CLv7mL6t0CEtHY9vjHLlvCXARG1FcO0XXuylNQ3/FDXHJp7T0IKFdxHeYF2j9CDJvxDjnhuxHitaQg+cOJmVsueMvx0GPEa+aPcWWhBZ8Mb8kk0/SthUNx2oDxPjdfb0G6Z6Hk4o7RCXYLZVmFofDFJ950h6A4qa0q++pGeZpmBJxYjAcOXnSFF4yjI6+B0jExLIIYpGJic8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VOUTZtamlRaWVKazhaNWhhaVVBaFZXWk5Gam5ZQTFzcCtZeXV2N29LOFZ2?=
 =?utf-8?B?RVpwYStsNXpTK0d0bk5VSUhCRTFsNnNGUnpLc3ZwMnpVYXVCMDVFZVMwUThV?=
 =?utf-8?B?V3J4NVZUMzBHUTA3TVhwRXdIMmxXNS9KTGNQc0hGbE9EbkJwMUpvUXd2VzVT?=
 =?utf-8?B?Mm8xM3BvMkg0Qy9QbWREbDlxMkFVQlJDb2dCOU9XbnlTblJuVjZwY2xaYkR1?=
 =?utf-8?B?NVZhYXQ3ME1yVGg3UENER0Jxbk1Vb0NORlFoclI2azBKMVFiMVlVVEx5aUxO?=
 =?utf-8?B?di9VM0FqR3B4a3JZSy9XR0NvTi84eVdoSFRvSzZMdi9Dd2w5MkFKQzRkVlVR?=
 =?utf-8?B?U3ZtZEg5aHB2bEhITW92bmtvK0EySExwUE9IZVpQZmFEQXJXVG1oSmF2QzRO?=
 =?utf-8?B?NmJQdldXREZHUVF2SWhBQW5vMm9HSTRZNXM1ODg4U0tDSHNidXZrZ1M2VzBv?=
 =?utf-8?B?WkV3OG1YOVdJZGY2d2twaDN6S2FwbnNKNG5USCtKY1R1UTlvN1BWSlExZjlM?=
 =?utf-8?B?N0pDNU0vbFZRNjVhTGZxcFRHVFBJRXlCeCtDeCs0Tjc5R0dxVkRabE0wL3BM?=
 =?utf-8?B?bktKa3Bha1BqOERoTXNKNysyRGlhUHk5aVE1T3RjZ0ptSllucnVBSnVrcG1T?=
 =?utf-8?B?eG5RZWc4WVV2ZzVZYXhWcjMzY3NYYzJZOEVjUnFwTEQ2bURhaVZjMWNnK1pC?=
 =?utf-8?B?b244RVBxSk5sVDljcDF2UGdVNGR1Mk53Zjl2ZjZ0Ymk2TlpRMEFjSXh1dXVC?=
 =?utf-8?B?ME5mUlZsY09GaHdOWHYyV3RQZnMyR3BSUzVpTktuNkRnbzZTNU1tL25keUpq?=
 =?utf-8?B?bW5jMUR6VG5EQnJadElNTzBXR0J2U05RT3A3ZkgyVWNicUVGL1ZaNjB5Uklr?=
 =?utf-8?B?WTZ5UnJpMCt0cTJqeUZzN3loMzVSSG50Q1Z3WHhrckNqNXRZWE4zSUJhZFRX?=
 =?utf-8?B?K21VZ0JNcEN2ZnVIM2VBV1c1T0RqS0dBVzQzdUZqTXMrekpUcW1tZ20wN015?=
 =?utf-8?B?NXBZK0tPSUJnVWVwSEVPbC9MbGJnZHJjQmZNL3FlTjFXampDcGRpK1R0aUU0?=
 =?utf-8?B?U0d0Wm1sR0pQeVJFK3M4amRmam4vbzdLNTkyNUdVckRBZVhJOE5iOW4wNHZT?=
 =?utf-8?B?bTRVcWxnN3E5cXFWR1FEWXBKeDVkQ20zSWhtWG5zM2dZckFlUXZ0RmdVckpC?=
 =?utf-8?B?Rk92UmVPSXVqTXFYenhiVXdUZGljZDRYR1VhRTFqNEZ1RFl1cHdEb0JJck40?=
 =?utf-8?B?RGR4dzBtYmcxN0JTbnArcjBBU0lLYyt4SW1jT1htQlY2WXcyS2d3R1dsSTNM?=
 =?utf-8?B?QVphWUZvK3dyV0ZJajU0V0VzL1ZlMG41ZEU3VmtRQ29qUndxMkpDTk9zWG5I?=
 =?utf-8?B?N3VKUkl3YWFYSDdmSG8rT0JmcFB0NG9HL2JQN2loUm5IRndaMWtPTlZQUjJY?=
 =?utf-8?B?WVhmb0dQb1dFY3QxQmp1UndXSXVKd1ZoQXlobndqcnh2TkRhSytvY2JDV294?=
 =?utf-8?B?Y2N4S0thUU1USVBIYU04M3M2VC9zdzBDSGF4b2xxbHVMZEJpR2g4bU5UTjVq?=
 =?utf-8?B?Y085SU9ZTzRlQ1pqRlFqcVNQM2dHYUlBbzlFN3g5aXhDNkpDeHc1V285UGdx?=
 =?utf-8?B?a3cwRzc1SmpTZVBRaHY1NHlxUmQ4WXdqZ3VZd0FoK2xkTFdHcFNld0szZ0xU?=
 =?utf-8?B?Y1ZHQXh5aVpiSURlTzhmcjhsZk12a1BjMkF6NlB4REd2ZWFIZVVaUDNNaXdh?=
 =?utf-8?B?cTdKNUV2S1FxdUVZMnNMdWFnd2NMTEhlWUc3T0NmWEMrSDhRZ1cra2IvanBq?=
 =?utf-8?B?bXdVWEJFRmd5VmZvL2hJWkg4ODJKK010QnphSVlzMVR0QkMzK3lSU2VDc0RU?=
 =?utf-8?B?c2tKZU9MWC93R0NOcnF3NDdJeUo1eE8rdzIzTmNab1JRb0h0Uy9PS050SVE4?=
 =?utf-8?B?dFJYWXA5RnkwLzB3TllSMVhKUW5xbHlKMllaZlpEOG94UFlkd2M4anlITExQ?=
 =?utf-8?B?SVZyUm1jS0dWV2YrVFlKUVZ0L1dWQjNEVzNUdC9XWWRSTDFVdFlKbm1uYVdQ?=
 =?utf-8?B?d2lVZitsSlNrVGJkSUtuKzc5MWpXSjlsVHd6NVMrZSs4anF4cUFvUDd5Mk90?=
 =?utf-8?B?NDBrL1FRNDlGSHRRTEZLWWVEbjZlaGZNeUpuT3ZkcmZnczNsSHlLaXIxTFc4?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b65464a2-8d2f-4352-5dd1-08dc53d7066f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:10:17.1856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cd2b5GQ3titlqTH9BWQEKGkSH/h9AoEcIs8IU4NBh4qc7kUwPUpqaUepujeJRCpnCiaOykJ+yP52PPiKeFT/RHmoG/Nx22oyiLFDaFMXQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The series includes a simple set of helpers, dedicated to Xe, allowing
access to registers and GGTT, on various tile, using MMIO BAR access.

v2:
 - add missing header std ifndef/define in lib/xe_mmio.h (Kamil)
v3:
- remove unused vf_id from struct xe_mmio (Lukasz)
- rename reg to offset in funcs params (Lukasz)
- change return type for xe_gt_get_tile_id (Lukasz)

Piotr Piórkowski (2):
  lib/intel_mmio: Map the whole BAR0 for gen12+
  lib/xe_mmio: Introduce Xe MMIO lib

 lib/intel_mmio.c  |   2 +-
 lib/meson.build   |   1 +
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  41 +++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 6 files changed, 270 insertions(+), 1 deletion(-)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

-- 
2.34.1

