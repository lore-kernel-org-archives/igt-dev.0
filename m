Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3388C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 14:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6210F0BE;
	Tue, 16 Apr 2024 14:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5XK74yT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80BB10F0BE
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713276152; x=1744812152;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WIWX+9nVROeof5LfDua0JTXzFT7zqfc3JBxZpGGuVwM=;
 b=f5XK74yTwBOWWzvtjlZH8/YIwWtAAwHIAQEWyGMMv6wehHaD9RPP3Rvq
 xtc8yEbZLiv8L1U1n/ngfrJvj4aX8RYVmIhn0KkcgM3leyiwJFrGpatgB
 nbITWifRiYdN+J9Lii07C6l1xzfc7vd9IFNuWJlqCqgzBuQaktP7Zg8H4
 QOPfFSOPa+NbzjOB1tZY5DpZ613TWcx0mFljli2MIWUF3AXAUrsbMPZyl
 PiD0/Ovx7bYAX2CfoRG/WbdClEmaOLncnG4YqNIpL7izUu+rw7GmrZNHh
 Cj3LA2W1rWBXj6RgEmovsk24xFbzF87W/uUSYbPxRIdcilT0cMc99WOFg w==;
X-CSE-ConnectionGUID: rQPUhAsNQr+00EEap9lmVg==
X-CSE-MsgGUID: 66fJ/D4xS1uV5KRAjHC+qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8840950"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8840950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:02:12 -0700
X-CSE-ConnectionGUID: N/zRM5eATYCQhrbbwvDtGw==
X-CSE-MsgGUID: hZLdH1MDTfahAoA4NC3EbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53454709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 07:02:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 07:02:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 07:02:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 07:02:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 07:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aETA1eY3wrESOnU6K9OOjZs5itA+3iRj+f8C4/cS7ZOQofeJqplvCVvD2NhFFF9j/muJ0A2iNsZJnpa8MKNUsvMs4EHfWC25mhIluPlCHfOsKFUguiUAwxijQ0TT+NzmlNMw5XzyuSGkR9AWtAnnfhuWW1KCKPBvvJX++XDFqQcCjq7ifZy6SWOGsf3Rv/2hyQK2Oco1OtR/DOtBzzK3jn0nZVeUPd1JtsRF10K3/rOR2T9mFfwJaQjNREJj1+J+8r4/EeS2OHcO23k3WUw799pFDMjBfTfYK0pnDtbUfPqSmjOCCK9uHXd4j96furiAwVl2n4tGtvY2s3SU8ejS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/v+wbFRaJqglO8/HExLYiXzq/Y3MTiBCdtvNIPECD8=;
 b=jBDW6ik5sx4tEOs2OVMerTM0sCxzbzNuUFNM3K/7a8fLof0VjahRyh7SGBh3n+mqppvOApL+ZMMYNprB8eh+2M/zZu5rTAsYT8Saxf43SCMOHyv4e7F2DJ7y6b69oDELROZhqmPqq72RqPRVQIJjgbPlfIsfajMNRKxXq5BZ7XU8+L5rwEGEbDqFdLNQwxnfdjkBOwECvPQrdUHgYaH4vI2CLw9Nxv5x2vNQq18UeSkjBsrxW1Z+pL1JpNUsRE/wFccKrGA8lrJWWKnIcyaamHWGW25hXCd+2lFKOhuRjPlMjrR2B0SXz3+YF2swBxslHDjDClUltdU/Sbob8sKKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 14:02:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 14:02:08 +0000
Date: Tue, 16 Apr 2024 09:02:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <boris.brezillon@collabora.com>, <zbigniew.kempczynski@intel.com>,
 <healych@amazon.com>, <kernel@collabora.com>
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <lfh2dutokrcbjb74txhsxhskrrpfyqga7xxasywv2iqz5s5kai@h7jrpfkgqn4n>
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
 <20240403172236.zi7ruqdyzdto2q45@kamilkon-desk.igk.intel.com>
 <qzyjvkeieoxxalgsrv33zau34b6onf6bdababiynvy7ffbxkoj@lrfaipvmlc4n>
 <0b34d35a-dd06-4700-a2ab-7118fc5b660e@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b34d35a-dd06-4700-a2ab-7118fc5b660e@ursulin.net>
X-ClientProxiedBy: BY5PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: d1363181-c362-46fc-8596-08dc5e1dcdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYUKu6ZdgLnVBwIrgQ+29dborXbvlxU41LqsiMYlTOa+jP5SJ53nPa+J7aMsmraCa15Gpv19FcSXGRvDQmJXADbMuh0ozjQMTAhiHdWOlw2EB8xVYlmDTM8z8Ud4rd3orVOzXzjZ0Qvf2BeP99eXmz+DS2Qs3HHtvI1ijLUjegWoQhMxvLpRau3GiFJq2rVnVzCrfjLDfJ/D9KDAPBhGidn1Uu4gK/Fc/C1gZ9WNg69v89rviYUHghjhr6smVP+pUmBOsxccGkcfpSGbVRacE6oO6enWbD00MidzJJmw7opRzdnFuxIM4zmY18EAO/7g29D5RkqmaOkq7FlQJK9VU4FMxjLY6ZKFC9KeAV0d5VkIuxg3zDJLUAYlEO6wA/1q4hlOXETvj597HkK6RHeuXQAXFJ+ia12JgV23vt/ypJLL8wu36KlU6/RgPh6JR7d7Hay7ux0D3ACdxloe+CS67MWk8zqFfw3avN1aSmcMH+u1oMoE/YU2pYID9VQwekmjRbmOg3KgonF/aHKxRHLx3hDunMYs0Y6rcl01tSGYOIIng1hkKAyLHkTdAStUqM5hIyL6ezu/RSmSVxnIoNuMvf6qJtiw7nFypGnsFdQBBX8ejzjl4aiB/wo5s4t1VMU/uNSznDwlW/CBgwUBJw99vN2mzqziyd13CkgBqpI++yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVR0L3dLTzlNWVFtZHZtZ1Y0bUtKRjZoLzlHQzZtZkZOc01tVmMvRUY2Zy9P?=
 =?utf-8?B?Qzh0SHQvdTZYRkhrQmtTcVhKbVBVZmpGMGQwcEVUT1pkMlUycTFtdlk4WGQ1?=
 =?utf-8?B?a0paN0dzOUxVcElpNWxyakUrQVVYVjZYRWtDZWd5ZGVHUHpnb1FzQmh5K2pv?=
 =?utf-8?B?allvczJRMDNTUmFkYmF1VnF2Ymd6N1MyQlBTSUZhZlNydDB4aWh4YUR6Wkhp?=
 =?utf-8?B?c1R1Q3VtS3lhUFFSM0FUaGZ2VmlrVk5qRVpFMzREeVYzQmRDL0lIQ0NSakNi?=
 =?utf-8?B?U3VSbVZraHpQM1IydUVxNEpXN2ZKc2dWQU9tNEtCY28rczh3c0RwQlV5MVBn?=
 =?utf-8?B?VENHaUJRei9adWxPbGEyTWVnUE1IalUxVWQ2M3pIbHNoZ3djcUNWRnlYUFZa?=
 =?utf-8?B?WHlpWEU2UEdYQUtYeVUwdlF2UVdTa3dIeXJJa2Z5Zkx4ODdlVkhWdlYyclFC?=
 =?utf-8?B?QjV1UlVNTXR6YW5zSjRRU2Ryakx0d3B4Mk1SR2JmL1p1Z1ZnY0dwY01Sbmt0?=
 =?utf-8?B?QkwrTjhXQndNUzh2V0tVWFJxRnQ1aDdZK3l6YjdtMjNOTURMSStOVjdGSXJm?=
 =?utf-8?B?dkxDYkdZejhwd3RLd2o5MFFYa3pSQmIxamhjZyt4eTdJWDVVTExERld1dGpm?=
 =?utf-8?B?cGFjYmEyUmZvZnkvRWorNlJURmVMNlVWNVhlN2hjY21ITE4wdzRGblFSL1Ay?=
 =?utf-8?B?ZUJkdXlicHRzUHRaTUJSUGdGdHBZMGlkU0RXYlljUUg5eVZNWFFmQnBTSzMr?=
 =?utf-8?B?ekM0S01MbUVMVkExN0pkUEo0Q1ZHSW5oV2R1UW9kMk9jdm5MY29iU1RoeGNH?=
 =?utf-8?B?SWZiTEt6OWovMURheXBwWFQ3SXpYSU9JdW1DVzhEOEtIZVI4U2tkQ28vQTBz?=
 =?utf-8?B?M2J5RTFhR0tmVVJhbUFpRlFGNXNHK0hvVnkxYnd6aiszN3Qrb2IrdmUrT1ow?=
 =?utf-8?B?WWp5bys4bm5QSGJGeGRvcVArbnFXZnBiV3FJbS9uOHJyK3g1YTJId2lhbUh2?=
 =?utf-8?B?c1luK1hHaHlUTUVjOVRua0F3YklDRnpsMnB3dk51V0EraXpkWWM4azh2MW8z?=
 =?utf-8?B?cEltZzJjVkh4L3BUYThVM2IrSXZGZFdxb2Z3Ti9EVFNEQ0laYmh5T3VqLzdM?=
 =?utf-8?B?TndpS1JKRm1CNkloQjFyL2liM2NYQ1VQcjh0VFlHY1BSMjVvM0RuTjZ3YjZG?=
 =?utf-8?B?NWxSbjlwdERDQzIyc2FSMEpNWmZaVEpUcWJNSVNWQmZLazZOU3VKanNaeFBp?=
 =?utf-8?B?TmhIOEF4VVZBUkh1cG5LYUl3dDlZTXp3Z0tnMGM4ekd1bnlwVEpYOGRPTjcv?=
 =?utf-8?B?V2JDVldqR1c1TkdONEdjTUZkVW01aFYrb29EeEVNaGYrV2d2L0ZtNUVOUUJt?=
 =?utf-8?B?NW9UeS92L2lFQUVGSzZxUmo4a211L0xaSkkzeUhoaWpURXJzT043dGxsbDBN?=
 =?utf-8?B?SUV1cG15c1cwZ1d0RFFON0ZXRVdCaXhZc3psZTZJZlJnOFRPclQvalYyUXBW?=
 =?utf-8?B?NWYzYlR3R1hsNXh0cHQyeVdFR0ZnWkFBM2hoUXFMbzhqRnpJcnN5WEdyN3RH?=
 =?utf-8?B?WWx4bDBSbFFxTkxVS3hBNzk1dG5YRTdrYitXTEtlT1NwYTF4WlRzTkpXU0l2?=
 =?utf-8?B?Z1BHdTVMNUhlclI1bDRtbzlXdThrTnNDazhLdlN4NmI5dmlkQUZkNnUrU2tZ?=
 =?utf-8?B?N3VEc0FwR1V1NHFTaWdZL0U2bWN5ajVneENEMWFCOW1FV1RnUCtJRUV1L0hV?=
 =?utf-8?B?VGVxYS96b2FqRVNLem95WjRvSmdkZHE1NExFU29hZGYrRnk4QlRFZ04vd3ZL?=
 =?utf-8?B?dEw0dUNSQXBLWEh5TTA2N01vZ0dRTlM5cGVML1JTeEFJUm83U1NRa0tlT0ZI?=
 =?utf-8?B?czhxWC96bHI4Q3QrMmRrbFE0V0J0UU12S0RQVzFuL1Zva0piSVc4RjBRZkJo?=
 =?utf-8?B?bXdBZGZCNnpRcDd6c2tld1hycFE5cHBJYWhteEtSWWk2NC9qQjljUFpQSWxu?=
 =?utf-8?B?L21TSkR0UWZRWjRmOXAyQ3hPbnA2MS9LM3AycU0wdHpNNmg4dFZuTXVIQVcx?=
 =?utf-8?B?WUVzbmV1YVZ6dHNkS3NvVDdORzlxN0ZJOG1ZQjFNdXhzMXdwQjE1Q25WYnNi?=
 =?utf-8?B?M0ZIRy9FL3VkMndVcGJCUUtxdEFJWHNlZHM5M2Q5TDhRTHRHZ0NyNzFRdkZm?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1363181-c362-46fc-8596-08dc5e1dcdf1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 14:02:08.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLHZWs0F3HQ6V2UkhtcypN7u+Tk3TYdktwXuif8vCdnnEehNNinFW3fYYPQPmsnpLM65KJVLYMGQGvpts2tDhWr2sc/DvCQnZ+Wl3OPYKyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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

On Tue, Apr 16, 2024 at 08:49:46AM +0100, Tvrtko Ursulin wrote:
>
>On 15/04/2024 20:35, Adrián Larumbe wrote:
>>On 03.04.2024 19:22, Kamil Konieczny wrote:
>>>Hi Adrián,
>>>On 2024-04-02 at 23:27:45 +0100, Adrián Larumbe wrote:
>>>>For every DRM device that enables its job accounting HW from user space,
>>>>toggle it right before obtaining per-client fdinfo numbers.
>>>>
>>>>Make sure profiling status is returned to its original state before
>>>>exiting, by handling the SIGINT signal just like in intel_gpu_top.
>>>>
>>>>Also dynamically link gputop against igt lib instead of separate per-file
>>>>static libraries to avoid dependence cascade because of using igt_sysfs
>>>>functions.
>>>>
>>>>Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>>>Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>>---
>>>>  tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
>>>>  tools/meson.build |  2 +-
>>>>  2 files changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/tools/gputop.c b/tools/gputop.c
>>>>index 71e28f43ee4c..5b390cbdb3e7 100644
>>>>--- a/tools/gputop.c
>>>>+++ b/tools/gputop.c
>>>>@@ -26,8 +26,10 @@
>>>>  #include <sys/sysmacros.h>
>>>>  #include <stdbool.h>
>>>>+#include "igt_device_scan.h"
>>>>  #include "igt_drm_clients.h"
>>>>  #include "igt_drm_fdinfo.h"
>>>>+#include "igt_profiling.h"
>>>>  #include "drmtest.h"
>>>>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>>>>@@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>>>>  }
>>>>+static volatile bool stop_top;
>>>>+
>>>>+static void sigint_handler(int  sig)
>>>>+{
>>>>+	stop_top = true;
>>>>+}
>>>>+
>>>>  int main(int argc, char **argv)
>>>>  {
>>>>  	unsigned int period_us = 2e6;
>>>>+	struct igt_profiled_device *profiled_devices = NULL;
>>>>  	struct igt_drm_clients *clients = NULL;
>>>>  	int con_w = -1, con_h = -1;
>>>>@@ -253,9 +263,22 @@ int main(int argc, char **argv)
>>>>  	if (!clients)
>>>>  		exit(1);
>>>>+	igt_devices_scan(false);
>>>>+
>>>>+	profiled_devices = igt_devices_profiled();
>>>>+	if (profiled_devices != NULL)
>>>>+		igt_devices_toggle_profiling(profiled_devices, true);
>>>>+
>>>>+	if (signal(SIGINT, sigint_handler) == SIG_ERR) {
>>>>+		fprintf(stderr, "Failed to install signal handler!\n");
>>>>+		igt_devices_toggle_profiling(profiled_devices, false);
>>>>+		free(profiled_devices);
>>>>+		profiled_devices = NULL;
>>>>+	}
>>>>+
>>>>  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>>>>-	for (;;) {
>>>>+	while (!stop_top) {
>>>>  		struct igt_drm_client *c, *prevc = NULL;
>>>>  		int i, engine_w = 0, lines = 0;
>>>>  		struct winsize ws;
>>>>@@ -293,5 +316,10 @@ int main(int argc, char **argv)
>>>>  		usleep(period_us);
>>>>  	}
>>>>+	if (profiled_devices != NULL) {
>>>>+		igt_devices_toggle_profiling(profiled_devices, false);
>>>>+		free(profiled_devices);
>>>>+	}
>>>>+
>>>>  	return 0;
>>>>  }
>>>>diff --git a/tools/meson.build b/tools/meson.build
>>>>index ac79d8b5840c..a126d6cad7ba 100644
>>>>--- a/tools/meson.build
>>>>+++ b/tools/meson.build
>>>>@@ -68,7 +68,7 @@ endif
>>>>  executable('gputop', 'gputop.c',
>>>>             install : true,
>>>>             install_rpath : bindir_rpathdir,
>>>>-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
>>>>+           dependencies : [lib_igt, lib_igt_drm_clients, math])
>>>
>>>Why not creating lib_igt_profiling with only needed dependeces and
>>>adding it here? Before your patch:
>>>
>>>ldd build/tools/gputop
>>>
>>>linux-vdso.so.1 (0x00007ffc5e120000)
>>>libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007bf0a4200000)
>>>/lib64/ld-linux-x86-64.so.2 (0x00007bf0a452b000)
>>>
>>>After:
>>>
>>>ldd gputop |wc -l
>>>78
>>
>>I guess if dynamic library dependencies are seen as undesirable for gputop, then
>>I'll try to do as you suggested, but I suspect a hypothetical lib_igt_profiling
>>static library will contain most of the object files in igt_lib's lib_sources
>>list of files.
>
>It is correct that a goal so far was to avoid linking tools/ (outside 
>tests/ even) with igt_igt. But you use quite a lot of lib_igt stuff in 
>this work right? I am not sure it is easy to split it all out into 
>separate libraries. Question for IGT maintainers.

I think we need to consider what gputop is. I can think of 2 things:

1) reference implementation of the kernel interface

Then maybe hiding the real implementation across several igt libraries
is not a good thing.

2) a tool we really expect end users to use

Then maybe it's ok to depend on those additional libraries, but
ldd gputop |wc -l == 78  for what gputop does seem too much.

3) both (1) and (2)?

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>>Regards,
>>>Kamil
>>>
>>>>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>>>>  executable('intel_l3_parity', sources : intel_l3_parity_src,
>>>>-- 
>>>>2.44.0
>>>>
>>
>>Adrian Larumbe
