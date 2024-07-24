Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE63C3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 17:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B873010E772;
	Wed, 24 Jul 2024 17:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmRMCULs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1910E772
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721842184; x=1753378184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zepmJ2QUuYuaYYLv0W1W5mPdAnl5GVTmePTWqUoJzko=;
 b=MmRMCULsk+B76/VsdwwB7pUOsu1ngYofsZQYyXOeE3zS1o7AZQ0FKBpJ
 66sb+KBSakH7WHJC8T6nHl/pwv6wk/VFtA5nfxcq7ZO/lauqE9esclIjA
 6YOP0f2jC53VnL9+bL7pKuehGNbo9e7Di2ah9t4+XWZf7uSTghvsWLraG
 pgUxm6cVBAg8iEpAotNVtjK2eAxZ6dTjTV66oImUNDl3AARGKwafKsr0p
 b1b7wBZlzLSEZuD9h9lD6jVv05OIY1XcidUJPu0fRPWzJE0UWQ1i5/mYH
 LYkpd9/wSlN8jw3qdX8S5dUVbBunOJ+CHI9Np5wMlJ622PMRfaH7pMdwP A==;
X-CSE-ConnectionGUID: qD2SGJFfRnywZ0GMUsibFw==
X-CSE-MsgGUID: /BwLlHYFTOe8O5Qz4uE4iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="36993782"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="36993782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 10:29:44 -0700
X-CSE-ConnectionGUID: yhmoRV6MSGC4gG1ZBdXw2g==
X-CSE-MsgGUID: oLFLCKgWTZGR/w2w69qbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83261678"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 10:29:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 10:29:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 10:29:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 10:29:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBD72nf3UHrD8+CB7CqcAiU3gm1za32TosW3KPuRi4Y5TiLG4xCbQ4iepIA+4P4tw2Vw0US5u0Lww/CGXC/FFUOdw1ewYIu3vlX7iiEFKxfsbVxHR9bULe9eghSGAK+lN4lobgBPdszd2/n8C6ongP//c3mMn/aO9OtCzHA2/Wb0bJJDQGjbiM51k4MFF8Uz3/BRRBMmeImP+XwPVmjvWcK2eqLYc7xudwobgV03wzzUDmNVHFXpUUd8AtSouXF6xH+OoXN/uzfboKkiSmWO/uogqjzRn/PWZW6UTVZYtAg6GqoMegG3Kht1bcgDS2CCqbQUga6jp3u4/ip0N2P3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IliDIEW+pUiKVnXROeuFn6DHLoAN8WhsH/jZdKkUTOU=;
 b=IK6lCQ92XFy0dAvEm2zBOKyddXBPqTIIUz8J7JnM/MoXli+G7PlCvtqciPzWLyDaPDBtR8fZcazlPS/f50gmNN+X3W4JxpQurQgksqewMrbqAEiJGlW1T4/aQz06j3MuTGrjvShzgEWUnDhUeLSh5yKy+zrsGYLPRrrQI1ENEta8umkfCN9bDJNIbomqDcQK1PjBPc9eTrSkKPu+7CmELiv2hcPHeG6fkBK4kFsp+4F0DKCF/X5q3LscfC+CsUaKKWqrtUfTYBZS7/c3DipFPfoamkA9+DToqC1Fw7gXovm1AtzuoerWa1DvRZWR3veocpuPOwsehUv4yv9Toa626A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 17:29:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 17:29:37 +0000
Date: Wed, 24 Jul 2024 12:29:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v2 1/7] igt_hook: Add feature
Message-ID: <vmcmprgdzmvjpd5sf7twsatgpi7n3b7aiyz4a7lytiewnk2exq@46gtajd43xah>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
 <20240621195150.390462-4-gustavo.sousa@intel.com>
 <d2bmnw6jnz4encqian5z4xy5uk3f3kmigew7zjdpjsuq6ud5p3@nfsu3lszt4eo>
 <172183958665.1506.3418213799642416402@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172183958665.1506.3418213799642416402@gjsousa-mobl2>
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fe678e-6864-4632-5e1d-08dcac06310e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zX2AWK02awKEMwvGNv6jqRaUKiw4ghzALI343Xr0xQl2otvmZ0jF8RZsMKsE?=
 =?us-ascii?Q?2KDqvOt1MdUUDorTCM9qT9y9fOaFPdSMX74ZMTgsaE2nJFjApIKb2nuKouXF?=
 =?us-ascii?Q?X9/sSoBOS/bwxaLSy1uCTG38D67Utpt6OEaiDSP6WvzJ8M2/EW16Xsf2D7M+?=
 =?us-ascii?Q?y2c0FZ7o6rF08QIFTKCITiZIP2IOtijYXEiGDs9PvALLHk0TB3kQAMBIqfCB?=
 =?us-ascii?Q?hG9uMjuZOR4Nk56NHHk0fgg5EMZKxVDp4R7eaCj7ukYaGYfSKxe8/73MTgrJ?=
 =?us-ascii?Q?9J/c8qVVAHzUo7nwss0kqBLyoD9l1WsBVMM4kwfE6RvxoY5szbf76/UT7t9I?=
 =?us-ascii?Q?hzOpSDRul5Nz64xFKkP3Ht4UlPBPC9+rc7+Ne3UaBybB8y13m4T8SGEHsheT?=
 =?us-ascii?Q?Dygt8LXxIc+eG3w6bTcQDQEnBYRc5jOH44Lc1l3+DJ0eBDgz9nCdv6Uhyykh?=
 =?us-ascii?Q?16JneYZX/lZ/xIATX+sRKzUIXwkAKhJaIkVujUlP4hrRDc1LwoijHF5NDDdN?=
 =?us-ascii?Q?c5ca7iEMAcrjH/MjZyPEp+YOi5tSIJxqWC9hHKM2oDUiTp0DL29hoSMB8il/?=
 =?us-ascii?Q?pxOC/GYgoJWkIcxp3W7nBHGOI32hBHr+aRB1TKRvpjIdYTrCwdi5oPTuzukj?=
 =?us-ascii?Q?GbpdgfVwE4/yJ9ogZ+AimK7fXzhx5wxo8c0QwZxFbNRu6atVMdENDsakFJD1?=
 =?us-ascii?Q?yk/zODVSrTcMUNyUyf4bSun77vTUTPSJfDyCTIOkAC7zwA43P5i9Bce89SiB?=
 =?us-ascii?Q?ZlIXoxJS+B80m7N/NsX9lLpvF8wibYPH21mH6dni7mbq/duG79sDrbgHaeu7?=
 =?us-ascii?Q?LWWvTI7zcyRXW/tOiUbvOkiueMKT8LxlJq5vSBnFhJP3EVgK0BLWqTTHtPa4?=
 =?us-ascii?Q?dDPI+D5GbWMFrvMRoVlGrEjPkYBK2qF0kzqFitOwyVHp6k2UolMqLwiN6EUP?=
 =?us-ascii?Q?lhBlLvyN5TYaGvtjoowV4dRdZODRVviug6nKFL/KpstkPKX9MJxyAFF3PzmA?=
 =?us-ascii?Q?RnZ92/zTqUaVvSQCIGVbfvKsG+LdeyJy0hVhzByw8RtmsaHP2H2y1/L6bI7J?=
 =?us-ascii?Q?z7fjE59Vx+rruVSjCPDYCa3v7njm8UZyN9kLnHfCjA7qdJJ4pDJVMcSBAtft?=
 =?us-ascii?Q?8Ugppu58d671N9/9Ftl0KtEMk8afYsyhggHQELOnp+3c9oNnH3RBUftbz/U9?=
 =?us-ascii?Q?wp4PDdCzaKe+5V9ee3K43tynGKYJy6PtApwIarCYSptb0JgOZaHzR+z9yi+H?=
 =?us-ascii?Q?o/QIEQ+S0oVZXmTCE7OSq8YCx8kx4HMOqKLQBNBjpkOUtoxM7sLlv2glHNK4?=
 =?us-ascii?Q?cxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mCBOq8cN4BHKYLmlvBvqDZ0+61zPVACmB65VFJqf1QuknrbWpr+TBeuH/+kj?=
 =?us-ascii?Q?ITfeck9jDfyfUZvGBPL10nvrWDcuEZl9J3hieJMiqj4J6ONKbthtvmv1y/SQ?=
 =?us-ascii?Q?qQ7jpMHBB2yiKqnFG6i8oIS02UO+aOCoe1izkCa6ie1Nt2jZJVwgCYBnwZJC?=
 =?us-ascii?Q?NY07/qjQCxG2tt8xOiin8/1GMhHrWN1ZBK/T5jXO4ZRzPI08dNdcDPwz/2Jg?=
 =?us-ascii?Q?biR+4u/Xo5KCDO8cG5/lEiXdSnM4w6fJE6TdJmxcC+IXhgfBHoLR/WxYIKQg?=
 =?us-ascii?Q?PF5dvl3HoSr5Dcb75EMwllnHVKWcS8DG7mo4OP4HKs2mi0BxE1TgTBQBTTC5?=
 =?us-ascii?Q?lgDAb8BhLx5aIHZ4Lc7Hce32hMkz17YamjGFxnXkXSVW9da+zwkm/ngGN1h6?=
 =?us-ascii?Q?OtKir0kgJ8M7bOXFKWgbArNdKrnYYojU4MyeFugM7JTtMq/Q86WD34ssh9+m?=
 =?us-ascii?Q?ts7QgHiUdq3GIrkSIBgpfNidSFaGJZ/WClKT4kBICd3tiMV2Sd77tuMYvlDI?=
 =?us-ascii?Q?YmBkz4XQ8hXQeO/88t4Rt6cR+a1ZV21j5mBAtwKq0MW7sKjbhFjwb7hVbu7A?=
 =?us-ascii?Q?tucBo2CKZdLfsIG7wDf0GYYkHEYfE63W4qzI4BQ5j8NVEqqRmqDfmAMddmIq?=
 =?us-ascii?Q?97m8v/91h8Opv/JIMvbZuF/8wXvFANY1KYo9CMKjhxjX2ogg8Ntdxkb7Bk9k?=
 =?us-ascii?Q?2Ph9axjXBAj+vknJWUBgJWkNg8bR+YFq2efF6piuW01FjxO7XONJ1X2C0grM?=
 =?us-ascii?Q?EuNY8e+SdeMTrBWyanNXkgLiZgkAzXmKq7QYRixB7X4U8lazcEhlLmPTgu0a?=
 =?us-ascii?Q?khKcyUb4Yb2yQHg+4oTtk/xAhyrmhaRq1BeVuYoYUS4rNRaI5uJOFg/u0DFv?=
 =?us-ascii?Q?s2m7ey7F8xH3fuP0PY0uztPhcJP71ckok9lKdtpJnfDWzMZEDuAtbxuQ7g2K?=
 =?us-ascii?Q?yd7CZS4mXXgPsqZ0wGsWXkhIp77aWo4IxhK0NdPsXj8NagIqwB0qPC2zfob4?=
 =?us-ascii?Q?uIPTI4fhds0RPx20/ryGI1UE6jRTWfHyMnegW6ME54Btj5eQa3B0ky+lRpGf?=
 =?us-ascii?Q?V7kl6nQKwvYiFcZHjtIYayIBeFyM2Z+7teZLqHn9b6x0hXpTaHpXdj+7KVSP?=
 =?us-ascii?Q?gngjqaxaK/NwIlAb35W/05ZN2ZVaW2ViXDRZ4kcDAtSxVAIFPujtt2SOFpyc?=
 =?us-ascii?Q?Sz+NjQFlcMlX3c62ZTMMY+T3ZLyDLBMfDGYtovSaQNX1cFemgk9sKVrbAxG9?=
 =?us-ascii?Q?a4SyjI0NarH2HHmVYUAGDY95wGLKrHZHd7HnQ+ja8d2st8LXyGaWBT+lGAIA?=
 =?us-ascii?Q?oYOsHfwFs/ppa67m8dmQTJz9QvRQaLYNzS/xL2K8wj03absmdKQY6sFFTfBK?=
 =?us-ascii?Q?SgtZUfJeDydDp7RNIqfYUCuIq9MyeV38h5H9FmipgDWWZlQKM/640KF4bNND?=
 =?us-ascii?Q?WhLCBtp3KqsbPO4HZWXRSW2f1G9HlTB0wkntMc4Cnskwm61ia86oyUHG1mVm?=
 =?us-ascii?Q?4yB/XybqeJ7IUQOEomVGdGvzsl/Q6UKBgHt2PkJ8wXLT6K2V6bdgtak/AikQ?=
 =?us-ascii?Q?RThito9yLCFdlnxyatQJSvK4ry5LK3KFbxYNkatIkrQzHmaqsL9xyOsqkLtE?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fe678e-6864-4632-5e1d-08dcac06310e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 17:29:37.5090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0GrZXAceLkSMS9HOZPPerbgPi8FJAu6TgGQit4Fo9WobR6uyS8YSuoxsrr9AP30DM6QabjkS18riI2m1djw+WtLpwHkXw+mkpAKmueq0UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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

On Wed, Jul 24, 2024 at 01:46:26PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-03 16:27:10-03:00)
>>On Fri, Jun 21, 2024 at 04:51:46PM GMT, Gustavo Sousa wrote:
>>>For development purposes, sometimes it is useful to have a way of
>>>running custom scripts at certain points of test executions. A
>>>real-world example I bumped into recently is to collect information from
>>>sysfs before and after running each entry of a testlist.
>>>
>>>While it is possible for the user to handcraft a script that calls each
>>>test with the correct actions before and after execution, we can provide
>>>a better experience by adding built-in support for running hooks during
>>>test execution.
>>>
>>>That would be even better when adding the same kind of support for
>>>igt_runner (which is done in an upcoming change), since the user can
>>>also nicely resume with igt_resume with the hook already setup in case a
>>>crash happens during execution of the test list.
>>>
>>>As such provide implement support for hooks, integrate it into
>>>igt_core and expose the functionality via --hook CLI option on test
>>>executables.
>>>
>>>v2:
>>>  - s/igt_hook_init/igt_hook_create/ (Lucas)
>>>  - Use SPDX License Identifier instead of license text. (Lucas)
>>>  - Do not rely on hard-coded length 3 when generating full test name.
>>>    (Lucas)
>>>  - Do not pollute current environment variables when running hooks.
>>>    (Lucas)
>>>  - Change hook string in run_tests_and_match_env() to use "printf"
>>>    instead of "echo" to be compatible with CI environment.
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>---
>>> .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>>> lib/igt_core.c                                | 116 ++++-
>>> lib/igt_hook.c                                | 489 ++++++++++++++++++
>>> lib/igt_hook.h                                |  69 +++
>>> lib/meson.build                               |   1 +
>>> lib/tests/igt_hook.c                          | 170 ++++++
>>> lib/tests/igt_hook_integration.c              | 281 ++++++++++
>>> lib/tests/meson.build                         |   2 +
>>> 8 files changed, 1120 insertions(+), 9 deletions(-)
>>> create mode 100644 lib/igt_hook.c
>>> create mode 100644 lib/igt_hook.h
>>> create mode 100644 lib/tests/igt_hook.c
>>> create mode 100644 lib/tests/igt_hook_integration.c
>>>
>>>diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>index 9085eb924e85..11458c68124b 100644
>>>--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>>@@ -32,6 +32,7 @@
>>>     <xi:include href="xml/igt_fb.xml"/>
>>>     <xi:include href="xml/igt_frame.xml"/>
>>>     <xi:include href="xml/igt_gt.xml"/>
>>>+    <xi:include href="xml/igt_hook.xml"/>
>>>     <xi:include href="xml/igt_io.xml"/>
>>>     <xi:include href="xml/igt_kmod.xml"/>
>>>     <xi:include href="xml/igt_kms.xml"/>
>>>diff --git a/lib/igt_core.c b/lib/igt_core.c
>>>index 3ff3e0392316..6463a5bdcae5 100644
>>>--- a/lib/igt_core.c
>>>+++ b/lib/igt_core.c
>>>@@ -70,6 +70,7 @@
>>>
>>> #include "igt_core.h"
>>> #include "igt_aux.h"
>>>+#include "igt_hook.h"
>>> #include "igt_sysfs.h"
>>> #include "igt_sysrq.h"
>>> #include "igt_rc.h"
>>>@@ -241,6 +242,9 @@
>>>  * - '*,!basic*' match any subtest not starting basic
>>>  * - 'basic*,!basic-render*' match any subtest starting basic but not starting basic-render
>>>  *
>>>+ * It is possible to run a shell script at certain points of test execution with
>>>+ * "--hook". See the usage description with "--help-hook" for details.
>>>+ *
>>>  * # Configuration
>>>  *
>>>  * Some of IGT's behavior can be configured through a configuration file.
>>>@@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
>>> const char *igt_interactive_debug;
>>> bool igt_skip_crc_compare;
>>>
>>>+static struct igt_hook *igt_hook = NULL;
>>>+
>>> /* subtests helpers */
>>> static bool show_testlist = false;
>>> static bool list_subtests = false;
>>>@@ -338,6 +344,8 @@ enum {
>>>         OPT_INTERACTIVE_DEBUG,
>>>         OPT_SKIP_CRC,
>>>         OPT_TRACE_OOPS,
>>>+        OPT_HOOK,
>>>+        OPT_HELP_HOOK,
>>>         OPT_DEVICE,
>>>         OPT_VERSION,
>>>         OPT_HELP = 'h'
>>>@@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
>>>                 bind_fbcon(true);
>>>         }
>>>
>>>+        igt_hook_free(igt_hook);
>>>+
>>>         /* When not killed by a signal check that igt_exit() has been properly
>>>          * called. */
>>>         assert(sig != 0 || igt_exit_called || igt_is_aborting);
>>>@@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool output_on_stderr)
>>>                    "  --interactive-debug[=domain]\n"
>>>                    "  --skip-crc-compare\n"
>>>                    "  --trace-on-oops\n"
>>>+                   "  --hook [<events>:]<cmd>\n"
>>>+                   "  --help-hook\n"
>>>                    "  --help-description\n"
>>>                    "  --describe\n"
>>>                    "  --device filters\n"
>>>@@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
>>>                 {"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
>>>                 {"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
>>>                 {"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
>>>+                {"hook",              required_argument, NULL, OPT_HOOK},
>>>+                {"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
>>
>>I'm not a fan of having --help-*  for the additional options.
>>I think this is being added because of --help-description? However
>>--help-description should really be just --description (or removed at
>>all since the tests aren't documented like that anymore, which IMO is
>>sad).
>
>Yeah, I saw --help-description and decided to have a --help-hook. But,
>yeah, now that you mentioned, I agree that those two have different
>purposes.
>
>>
>>I think we need short explanation for each option, and then probably
>>refer to a man page where longer explanations can be given. I'm not
>>blocking it on that though.
>
>That sounds good. Since all options and not just "--hook" need the short
>explanation, I guess that can be done in a separate series.
>
>>
>>>                 {"device",            required_argument, NULL, OPT_DEVICE},
>>>                 {"version",           no_argument,       NULL, OPT_VERSION},
>>>                 {"help",              no_argument,       NULL, OPT_HELP},
>>>@@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
>>>                 case OPT_TRACE_OOPS:
>>>                         show_ftrace = true;
>>>                         break;
>>>+                case OPT_HOOK:
>>>+                        assert(optarg);
>>>+                        if (igt_hook) {
>>>+                                igt_warn("Overriding previous hook descriptor\n");
>>>+                                igt_hook_free(igt_hook);
>>>+                        }
>>>+                        igt_hook = igt_hook_create(optarg, &ret);
>>
>>usually functions like this are done the other way around: the return is
>>int and the pointer is passed by ref.
>>
>>ret = igt_hook_create(optarg, &igt_hook);
>>
>
>I'll update to match the above. Thanks.
>
>>>+                        if (!igt_hook) {
>>>+                                igt_critical("Failed to initialize hook data: %s\n",
>>>+                                             igt_hook_error_str(ret));
>>>+                                ret = ret > 0 ? -2 : -3;
>>>+                                goto out;
>>>+                        }
>>>+                        break;
>>>+                case OPT_HELP_HOOK:
>>>+                        igt_hook_print_help(stdout, "--hook");
>>>+                        ret = -1;
>>>+                        goto out;
>>>                 case OPT_DEVICE:
>>>                         assert(optarg);
>>>                         /* if set by env IGT_DEVICE we need to free it */
>>>@@ -1274,9 +1306,24 @@ out:
>>>                         exit(IGT_EXIT_INVALID);
>>>         }
>>>
>>>-        if (ret < 0)
>>>-                /* exit with no error for -h/--help */
>>>-                exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
>>>+        if (ret < 0) {
>>>+                free(igt_hook);
>>>+                igt_hook = NULL;
>>>+
>>>+                switch (ret) {
>>>+                case -1: /* exit with no error for -h/--help */
>>>+                        exit(0);
>>>+                        break;
>>>+                case -2:
>>>+                        exit(IGT_EXIT_INVALID);
>>>+                        break;
>>>+                case -3:
>>>+                        exit(IGT_EXIT_ABORT);
>>
>>I think ABORT shouldn't be used... this is for when tests can't be
>>executed anymore due to one of the monitored abort conditions. Not if we
>>can't create the igt_hook, which is more likely because of an invalid
>>option.
>
>Yeah. This comes from the first version of the patch series, where a
>negative error meant something else than invalid hook str. This can be
>removed now that we only error out because of invalid input.
>
>Thanks!
>
>>
>>>+                        break;
>>>+                default:
>>>+                        assert(0);
>>>+                }
>>>+        }
>>>
>>>         if (!igt_only_list_subtests()) {
>>>                 bind_fbcon(false);
>>>@@ -1284,6 +1331,15 @@ out:
>>>                 print_version();
>>>                 igt_srandom();
>>>
>>>+                if (igt_hook) {
>>>+                        struct igt_hook_evt hook_evt = {
>>>+                                .evt_type = IGT_HOOK_PRE_TEST,
>>>+                                .target_name = command_str,
>>>+                        };
>>>+
>>>+                        igt_hook_push_evt(igt_hook, &hook_evt);
>>>+                }
>>>+
>>>                 sync();
>>>                 oom_adjust_for_doom();
>>>                 ftrace_dump_on_oops(show_ftrace);
>>>@@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>>>         igt_thread_clear_fail_state();
>>>
>>>         igt_gettime(&subtest_time);
>>>+
>>>+        if (igt_hook) {
>>>+                struct igt_hook_evt hook_evt = {
>>>+                        .evt_type = IGT_HOOK_PRE_SUBTEST,
>>>+                        .target_name = subtest_name,
>>>+                };
>>>+
>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>+        }
>>>+
>>>         return (in_subtest = subtest_name);
>>> }
>>>
>>>@@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
>>>         _igt_dynamic_tests_executed++;
>>>
>>>         igt_gettime(&dynamic_subtest_time);
>>>+
>>>+        if (igt_hook) {
>>>+                struct igt_hook_evt hook_evt = {
>>>+                        .evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
>>>+                        .target_name = dynamic_subtest_name,
>>>+                };
>>>+
>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>
>>I'm wondering if we shouldn't make igt_hook_push_evt() accept NULL as
>>argument so we can use a compound literal like below:
>>
>>        igt_hook_push_evt(igt_hook, (struct igt_hook_evt[]){
>>                .evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
>>                .target_name = dynamic_subtest_name });
>>
>
>That sounds good, however I don't get why we would need
>to make igt_hook_push_evt() accept NULL for that. This seems to compile
>fine:
>
>    $ cat /tmp/foo.c
>    #include <stdio.h>
>
>    struct some_struct {
>        int a;
>        int b;
>    };
>
>    void f(struct some_struct *s)
>    {
>        printf("a=%d\nb=%d\n", s->a, s->b);
>    }
>
>    int main()
>    {
>        f(&(struct some_struct){.a = 1, .b = 2});
>        return 0;
>    }
>
>    $ gcc -Wall -Wextra -Werror -o /tmp/foo /tmp/foo.c && /tmp/foo
>    a=1
>    b=2

I meant igt_hook_push_evt() to accept NULL as the first argument.
So instead of doing this everywhere:

	if (igt_hook)
		igt_hook_push_evt(igt_hook, ...)

we do this:

	igt_hook_push_evt(igt_hook, ...)

Without the compound literal accepting NULL as the first arg would be
kind of pointless since you'd still need to setup the second argument
(struct igt_hook_evt), probably in a inner scope. But having the NULL
check for the first + compound literal for the second, we can reduce the
boilerplate code to add events.


>
>I tested that on gcc 12 and gcc 14.
>
>>>+        }
>>>+
>>>         return (in_dynamic_subtest = dynamic_subtest_name);
>>> }
>>>
>>>@@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *result)
>>>         struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
>>>         jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>>>
>>>+        if (igt_hook) {
>>>+                struct igt_hook_evt hook_evt = {
>>>+                        .evt_type = (in_dynamic_subtest
>>>+                                        ? IGT_HOOK_POST_DYN_SUBTEST
>>>+                                        : IGT_HOOK_POST_SUBTEST),
>>>+                        .result = result,
>>>+                };
>>>+
>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>+        }
>>>+
>>>         if (!igt_thread_is_main()) {
>>>                 igt_thread_fail();
>>>                 pthread_exit(NULL);
>>>@@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
>>> void igt_exit(void)
>>> {
>>>         int tmp;
>>>+        const char *result;
>>>
>>>         if (!test_with_subtests)
>>>                 igt_thread_assert_no_failures();
>>>@@ -2318,12 +2406,7 @@ void igt_exit(void)
>>>
>>>         assert(waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD);
>>>
>>>-        if (!test_with_subtests) {
>>>-                struct timespec now;
>>>-                const char *result;
>>>-
>>>-                igt_gettime(&now);
>>>-
>>>+        if (!test_with_subtests || igt_hook) {
>>>                 switch (igt_exitcode) {
>>>                         case IGT_EXIT_SUCCESS:
>>>                                 result = "SUCCESS";
>>>@@ -2334,6 +2417,12 @@ void igt_exit(void)
>>>                         default:
>>>                                 result = "FAIL";
>>>                 }
>>>+        }
>>>+
>>>+        if (!test_with_subtests) {
>>>+                struct timespec now;
>>>+
>>>+                igt_gettime(&now);
>>>
>>>                 if (test_multi_fork_child) /* parent will do the yelling */
>>>                         _log_line_fprintf(stdout, "dyn_child pid:%d (%.3fs) ends with err=%d\n",
>>>@@ -2344,6 +2433,15 @@ void igt_exit(void)
>>>                                           result, igt_time_elapsed(&subtest_time, &now));
>>>         }
>>>
>>>+        if (igt_hook) {
>>>+                struct igt_hook_evt hook_evt = {
>>>+                        .evt_type = IGT_HOOK_POST_TEST,
>>>+                        .result = result,
>>>+                };
>>>+
>>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>>+        }
>>>+
>>>         exit(igt_exitcode);
>>> }
>>>
>>>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>>>new file mode 100644
>>>index 000000000000..a4421e2b1543
>>>--- /dev/null
>>>+++ b/lib/igt_hook.c
>>>@@ -0,0 +1,489 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>+ */
>>>+
>>>+#include <assert.h>
>>>+#include <errno.h>
>>>+#include <limits.h>
>>>+#include <stdbool.h>
>>>+#include <stddef.h>
>>>+#include <stdint.h>
>>>+#include <stdio.h>
>>>+#include <stdlib.h>
>>>+#include <string.h>
>>>+
>>>+#include "igt_core.h"
>>>+#include "igt_hook.h"
>>>+
>>>+/**
>>>+ * SECTION:igt_hook
>>>+ * @short_description: Support for running a hook script on test execution
>>>+ * @title: Hook support
>>>+ *
>>>+ * IGT provides support for running a hook script when executing tests. This
>>>+ * support is provided to users via CLI option `--hook` available in test
>>>+ * binaries. Users should use `--help-hook` for detailed usaged description of
>>>+ * the feature.
>>>+ *
>>>+ * The sole user of the exposed API is `igt_core`, which calls @igt_hook_create()
>>>+ * when initializing a test case, then calls @igt_hook_push_evt() for each event
>>>+ * that occurs during that test's execution and finally calls @igt_hook_free()
>>>+ * to clean up at the end.
>>>+ */
>>>+
>>>+#define TEST_NAME_INITIAL_SIZE 16
>>>+
>>>+typedef uint16_t evt_mask_t;
>>>+
>>>+struct igt_hook {
>>>+        evt_mask_t evt_mask;
>>>+        char *cmd;
>>>+        char *test_name;
>>>+        size_t test_name_size;
>>>+        char *subtest_name;
>>>+        size_t subtest_name_size;
>>>+        char *dyn_subtest_name;
>>>+        size_t dyn_subtest_name_size;
>>>+        char *test_fullname;
>>>+};
>>>+
>>>+enum igt_hook_error {
>>>+        IGT_HOOK_EVT_EMPTY_NAME = 1,
>>>+        IGT_HOOK_EVT_NO_MATCH,
>>>+};
>>>+
>>>+static_assert(IGT_HOOK_NUM_EVENTS <= sizeof(evt_mask_t) * CHAR_BIT,
>>>+              "Number of event types does not fit event type mask");
>>>+
>>>+static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
>>>+{
>>>+        switch (evt_type) {
>>>+        case IGT_HOOK_PRE_TEST:
>>>+                return "pre-test";
>>>+        case IGT_HOOK_PRE_SUBTEST:
>>>+                return "pre-subtest";
>>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>>+                return "pre-dyn-subtest";
>>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>>+                return "post-dyn-subtest";
>>>+        case IGT_HOOK_POST_SUBTEST:
>>>+                return "post-subtest";
>>>+        case IGT_HOOK_POST_TEST:
>>>+                return "post-test";
>>>+        case IGT_HOOK_NUM_EVENTS:
>>>+                break;
>>>+        /* No "default:" case, to force a warning from -Wswitch in case we miss
>>>+         * any new event type. */
>>>+        }
>>>+        return "?";
>>>+}
>>>+
>>>+static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *evt_mask, const char **cmd)
>>>+{
>>>+        const char *s;
>>>+
>>>+        if (!strchr(hook_str, ':')) {
>>>+                *evt_mask = ~0;
>>>+                *cmd = hook_str;
>>>+                return 0;
>>>+        }
>>>+
>>>+        s = hook_str;
>>>+        *evt_mask = 0;
>>>+
>>>+        while (1) {
>>>+                const char *evt_name;
>>>+                bool has_match;
>>>+                bool is_star;
>>>+                enum igt_hook_evt_type evt_type;
>>>+
>>>+                evt_name = s;
>>>+
>>>+                while (*s != ':' && *s != ',')
>>>+                        s++;
>>>+
>>>+                if (evt_name == s)
>>>+                        return IGT_HOOK_EVT_EMPTY_NAME;
>>>+
>>>+                has_match = false;
>>>+                is_star = *evt_name == '*' && evt_name + 1 == s;
>>>+
>>>+                for (evt_type = IGT_HOOK_PRE_TEST; evt_type < IGT_HOOK_NUM_EVENTS; evt_type++) {
>>>+                        if (!is_star) {
>>>+                                const char *this_event_name = igt_hook_evt_type_to_name(evt_type);
>>>+                                size_t len = s - evt_name;
>>>+
>>>+                                if (len != strlen(this_event_name))
>>>+                                        continue;
>>>+
>>>+                                if (strncmp(evt_name, this_event_name, len))
>>>+                                        continue;
>>>+                        }
>>>+
>>>+                        *evt_mask |= 1 << evt_type;
>>>+                        has_match = true;
>>>+
>>>+                        if (!is_star)
>>>+                                break;
>>>+                }
>>>+
>>>+                if (!has_match)
>>>+                        return IGT_HOOK_EVT_NO_MATCH;
>>>+
>>>+                if (*s++ == ':')
>>>+                        break;
>>>+        }
>>>+
>>>+        *cmd = s;
>>>+
>>>+        return 0;
>>>+}
>>>+
>>>+static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hook) {
>>
>>{ <--- here
>>
>
>Thanks.
>
>>>+        /* The maximum size of test_fullname will be the maximum length of
>>>+         * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 for the
>>>+         * null byte. */
>>>+        return (igt_hook->test_name_size +
>>
>>no need for parenthesis
>
>I used the parenthesis (and should have probably included the "+ 4"
>inside) to lineup things like they would be done for kernel style [1].
>Although that applies for function parameters, I remember seeing usage
>for normal expressions as well.
>
>But I can live without them as well :-)
>
>[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings

we shouldn't add random chars (parenthesis in this case) to align stuff.
In the kernel it's perfectly fine to do:

	return igt_hook->test_name_size +
		igt_hook->subtest_name_size +
		igt_hook->dyn_subtest_name_size + 4;

>
>>
>>>+                igt_hook->subtest_name_size +
>>>+                igt_hook->dyn_subtest_name_size) + 4;
>>>+}
>>>+
>>>+static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>>>+{
>>>+        int i;
>>>+        char *s;
>>>+        const char *values[] = {
>>>+                igt_hook->test_name,
>>>+                igt_hook->subtest_name,
>>>+                igt_hook->dyn_subtest_name,
>>>+                NULL,
>>>+        };
>>>+
>>>+        if (igt_hook->test_name[0] == '\0') {
>>>+                igt_hook->test_fullname[0] = '\0';
>>>+                return;
>>>+        }
>>>+
>>>+        s = stpcpy(igt_hook->test_fullname, "igt");
>>>+        for (i = 0; values[i] && values[i][0] != '\0'; i++) {
>>>+                *s++ = '@';
>>>+                s = stpcpy(s, values[i]);
>>>+        }
>>>+}
>>>+
>>>+/**
>>>+ * igt_hook_create:
>>>+ * @hook_str: Hook descriptor string.
>>>+ * @error: Pointer to error number.
>>>+ *
>>>+ * Allocate and initialize an #igt_hook structure.
>>>+ *
>>>+ * This function parses the hook descriptor @hook_str and initializes the struct
>>>+ * to be returned.
>>>+ *
>>>+ * The hook descriptor comes from the argument to `--hook` of the test
>>>+ * executable being run.
>>>+ *
>>>+ * If not #NULL, @error is used to store a non-zero error number if an error
>>>+ * happens. A human-readable string for that error number can be obtained with
>>>+ * @igt_hook_error_str().
>>>+ *
>>>+ * Returns: The pointer to the #igt_hook structure on success or #NULL on error.
>>>+ */
>>>+struct igt_hook *igt_hook_create(const char *hook_str, int *error)
>>>+{
>>>+        int err;
>>>+        evt_mask_t evt_mask;
>>>+        const char *cmd;
>>>+        struct igt_hook *igt_hook = NULL;
>>>+
>>>+
>>>+        err = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>>>+        if (err)
>>>+                goto out;
>>>+
>>>+        igt_hook = calloc(1, sizeof(*igt_hook));
>>>+        igt_hook->evt_mask = evt_mask;
>>>+
>>>+        igt_hook->cmd = strdup(cmd);
>>>+        if (!igt_hook->cmd) {
>>>+                err = -errno;
>>>+                goto out;
>>>+        }
>>>+
>>>+        igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
>>>+        igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
>>>+        igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>>>+        igt_hook->subtest_name_size = TEST_NAME_INITIAL_SIZE;
>>>+        igt_hook->dyn_subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>>>+        igt_hook->dyn_subtest_name_size = TEST_NAME_INITIAL_SIZE;
>>
>>if we store test_name, subtest_name and dyn_subtest_name individually,
>>why do we need to store test_fullname?
>
>To make igt_hook_update_env_vars() as simple as a bunch of setenv()
>calls.
>
>If you prefer, I could update the code to build the full test name on
>the fly when setting environment, but like the current version better:
>we have everything that we need already in the igt_hook struct and extra
>memory cost is small IMO.
>
>Now, if your question is more on the lines of "why do we need the full
>test name if we already expose the components?", I think exposing the
>full test name is a convenience.

humn... but we still call igt_hook_update_test_fullname() to update it
Anyway, nothing critical here, I'd just do this differently


>
>>
>>>+        igt_hook->test_fullname = malloc(igt_hook_calc_test_fullname_size(igt_hook));
>>>+
>>>+        igt_hook->test_name[0] = '\0';
>>>+        igt_hook->subtest_name[0] = '\0';
>>>+        igt_hook->dyn_subtest_name[0] = '\0';
>>>+        igt_hook->test_fullname[0] = '\0';
>>>+
>>>+out:
>>>+        if (err) {
>>>+                if (error)
>>>+                        *error = err;
>>>+
>>>+                igt_hook_free(igt_hook);
>>>+
>>>+                return NULL;
>>>+        }
>>>+
>>>+        return igt_hook;
>>>+}
>>>+
>>>+/**
>>>+ * igt_hook_free:
>>>+ * @igt_hook: The igt_hook struct.
>>>+ *
>>>+ * De-initialize an igt_hook struct returned by @igt_hook_create().
>>>+ *
>>>+ * This is a no-op if @igt_hook is #NULL.
>>>+ */
>>>+void igt_hook_free(struct igt_hook *igt_hook)
>>>+{
>>>+        if (!igt_hook)
>>>+                return;
>>>+
>>>+        free(igt_hook->cmd);
>>>+        free(igt_hook->test_name);
>>>+        free(igt_hook->subtest_name);
>>>+        free(igt_hook->dyn_subtest_name);
>>>+        free(igt_hook);
>>>+}
>>>+
>>>+static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>>>+{
>>>+        char **name_ptr;
>>>+        size_t *size_ptr;
>>>+        size_t len;
>>>+
>>>+        switch (evt->evt_type) {
>>>+        case IGT_HOOK_PRE_TEST:
>>>+                name_ptr = &igt_hook->test_name;
>>>+                size_ptr = &igt_hook->test_name_size;
>>>+                break;
>>>+        case IGT_HOOK_PRE_SUBTEST:
>>>+                name_ptr = &igt_hook->subtest_name;
>>>+                size_ptr = &igt_hook->subtest_name_size;
>>>+                break;
>>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>>+                name_ptr = &igt_hook->dyn_subtest_name;
>>>+                size_ptr = &igt_hook->dyn_subtest_name_size;
>>>+                break;
>>>+        default:
>>>+                return;
>>>+        }
>>>+
>>>+        len = strlen(evt->target_name);
>>>+        if (len + 1 > *size_ptr) {
>>>+                size_t fullname_size;
>>>+
>>>+                *size_ptr *= 2;
>>>+                *name_ptr = realloc(*name_ptr, *size_ptr);
>>>+
>>>+                fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
>>>+                igt_hook->test_fullname = realloc(igt_hook->test_fullname, fullname_size);
>>>+        }
>>>+
>>>+        strcpy(*name_ptr, evt->target_name);
>>>+        igt_hook_update_test_fullname(igt_hook);
>>>+}
>>>+
>>>+static void igt_hook_update_test_name_post_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>>>+{
>>>+        switch (evt->evt_type) {
>>>+        case IGT_HOOK_POST_TEST:
>>>+                igt_hook->test_name[0] = '\0';
>>>+                break;
>>>+        case IGT_HOOK_POST_SUBTEST:
>>>+                igt_hook->subtest_name[0] = '\0';
>>>+                break;
>>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>>+                igt_hook->dyn_subtest_name[0] = '\0';
>>>+                break;
>>>+        default:
>>>+                return;
>>>+        }
>>>+
>>>+        igt_hook_update_test_fullname(igt_hook);
>>>+}
>>>+
>>>+static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>>>+{
>>>+        setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_type), 1);
>>>+        setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>>>+        setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>>>+        setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>>>+        setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>>>+        setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>>>+}
>>>+
>>>+/**
>>>+ * igt_hook_push_evt:
>>>+ * @igt_hook: The igt_hook structure.
>>>+ * @evt: The event to be pushed.
>>>+ *
>>>+ * Push a new igt_hook event.
>>>+ *
>>>+ * This function must be used to register a new igt_hook event. Calling it will
>>
>>"register" IMO is an odd term. This is notifying/calling the previously
>>registered hook, not registering an event.
>
>The term "register" here is to mean that we are telling that a new event
>happened. Whether a registered hook gets "notified" (or "called")
>depends on whether the event matches the event descriptor passed on hook
>registration.
>
>If you prefer, "notify" could be used instead (to mean what I just
>described), but I don't think "call" is suitable here.

notify sounds good to me.

>
>>
>>igt_hook_event_notify() or igt_hook_event_exec() would be more
>>appropriate I think.
>
>On the same lines as my previous comment, I do not think
>igt_hook_event_exec() is suitable.
>
>Let's go with igt_hook_event_notify(), then?

yep

>
>>
>>
>>>+ * cause execution of the hook script if the event type matches the filters
>>>+ * provided during initialization of @igt_hook.
>>>+ */
>>>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>>>+{
>>>+        evt_mask_t evt_bit = (1 << evt->evt_type);
>>>+
>>>+        igt_hook_update_test_name_pre_call(igt_hook, evt);
>>>+
>>>+        if ((evt_bit & igt_hook->evt_mask)) {
>>>+                struct igt_helper_process proc = {};
>>>+
>>>+                igt_fork_helper(&proc) {
>>>+                        igt_hook_update_env_vars(igt_hook, evt);
>>>+                        system(igt_hook->cmd);
>>
>>humn... we don't care about the return?
>
>Not at the moment. I had considered hooks controlling the execution. For
>example, we could have a hook causing a test to skip or to abort the
>overall execution.
>
>However, I decided to keep it simple for now. We could extend the
>functionality to allow hooks to influence the execution if we see the
>need in the future.
>
>>also... Why do we double fork?
>>
>>it rather looks like we want an igt_exec() to complement
>>igt_fork_helper() or at least a small wrapper around
>>execle() do exec /bin/sh passing the command and env to use
>
>I was lazy and did not want to have to deal with stuff that system()
>gives me for "free". Let me look into how I can improve this with
>igt_exec()...

what I find odd is that now we have a double fork, with the seconde fork
exec'ing. If we keep using system() why do we need the fork helper
since...

>
>>
>>>+                }
>>>+                igt_wait_helper(&proc);

^ we are just waiting for it to complete.

is it so we update the env only in the forked context? Any downside of
having the env var set in igt_runner's context?

>>>+        }
>>>+
>>>+        igt_hook_update_test_name_post_call(igt_hook, evt);
>>>+}
>>>+
>>>+/**
>>>+ * igt_hook_error_str:
>>>+ * @error: Non-zero error number.
>>>+ *
>>>+ * Return a human-readable string containing a description of an error number
>>>+ * generated by one of the `igt_hook_*` functions.
>>>+ *
>>>+ * The string will be the result of strerror() for errors from the C standard
>>>+ * library or a custom description specific to igt_hook.
>>>+ */
>>>+const char *igt_hook_error_str(int error)
>>>+{
>>>+        if (!error)
>>>+                return "No error";
>>>+
>>>+        if (error > 0) {
>>>+                enum igt_hook_error hook_error = error;
>>>+
>>>+                switch (hook_error) {
>>>+                case IGT_HOOK_EVT_EMPTY_NAME:
>>>+                        return "Empty name in event descriptor";
>>>+                case IGT_HOOK_EVT_NO_MATCH:
>>>+                        return "Event name in event descriptor does not match any event type";
>>>+                default:
>>>+                        return "Unknown error";
>>>+                }
>>>+        } else {
>>
>>no need for else
>
>Right. This is also a leftover from v1, where error could be negative.
>Now there is not need for the "if" either. I'll fix this. Thanks.
>
>>
>>
>>Lucas De Marchi
>
>
>Thanks for the new feedback! I'll start working on a v3.
>

thanks
Lucas De Marchi

>--
>Gustavo Sousa
>
>>
>>>+                return strerror(-error);
>>>+        }
>>>+}
>>>+
>>>+/**
>>>+ * igt_hook_print_help:
>>>+ * @f: File pointer where to write the output.
>>>+ * @option_name: Name of the CLI option that accepts the hook descriptor.
>>>+ *
>>>+ * Print a detailed user help text on hook usage.
>>>+ */
>>>+void igt_hook_print_help(FILE *f, const char *option_name)
>>>+{
>>>+        fprintf(f, "\
>>>+The option %1$s receives as argument a \"hook descriptor\" and allows the\n\
>>>+execution of a shell command at different points during execution of tests. Each\n\
>>>+such a point is called a \"hook event\".\n\
>>>+\n\
>>>+Examples:\n\
>>>+\n\
>>>+  # Prints hook-specic env vars for every event.\n\
>>>+  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>>>+\n\
>>>+  # Equivalent to the above. Useful if command contains ':'.\n\
>>>+  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>>>+\n\
>>>+  # Adds a line to out.txt containing the result of each test case.\n\
>>>+  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.txt'\n\
>>>+\n\
>>>+The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:\n\
>>>+\n\
>>>+  - <events> is a comma-separated list of event descriptors, which defines the\n\
>>>+    set of events be tracked. If omitted, all events are tracked.\n\
>>>+\n\
>>>+  - <cmd> is a shell command to be executed on the occurrence each tracked\n\
>>>+    event. If the command contains ':', then passing <events> is required,\n\
>>>+    otherwise part of the command would be treated as an event descriptor.\n\
>>>+\n\
>>>+", option_name);
>>>+
>>>+        fprintf(f, "\
>>>+An \"event descriptor\" is either the name of an event or the string '*'. The\n\
>>>+latter matches all event names. The list of possible event names is provided\n\
>>>+below:\n\
>>>+\n\
>>>+");
>>>+
>>>+        for (enum igt_hook_evt_type et = 0; et < IGT_HOOK_NUM_EVENTS; et++) {
>>>+                const char *desc;
>>>+
>>>+                switch (et) {
>>>+                case IGT_HOOK_PRE_TEST:
>>>+                        desc = "Occurs before a test case starts.";
>>>+                        break;
>>>+                case IGT_HOOK_PRE_SUBTEST:
>>>+                        desc = "Occurs before the execution of a subtest.";
>>>+                        break;
>>>+                case IGT_HOOK_PRE_DYN_SUBTEST:
>>>+                        desc = "Occurs before the execution of a dynamic subtest.";
>>>+                        break;
>>>+                case IGT_HOOK_POST_DYN_SUBTEST:
>>>+                        desc = "Occurs after the execution of a dynamic subtest.";
>>>+                        break;
>>>+                case IGT_HOOK_POST_SUBTEST:
>>>+                        desc = "Occurs after the execution of a subtest.";
>>>+                        break;
>>>+                case IGT_HOOK_POST_TEST:
>>>+                        desc = "Occurs after a test case has finished.";
>>>+                        break;
>>>+                default:
>>>+                        desc = "MISSING DESCRIPTION";
>>>+                }
>>>+
>>>+                fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(et), desc);
>>>+        }
>>>+
>>>+        fprintf(f, "\
>>>+For each event matched by <events>, <cmd> is executed as a shell command. The\n\
>>>+exit status of the command is ignored. The following environment variables are\n\
>>>+available to the command:\n\
>>>+\n\
>>>+  IGT_HOOK_EVENT\n\
>>>+  Name of the current event.\n\
>>>+\n\
>>>+  IGT_HOOK_TEST_FULLNAME\n\
>>>+  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subtest>]]`.\n\
>>>+\n\
>>>+  IGT_HOOK_TEST\n\
>>>+  Name of the current test.\n\
>>>+\n\
>>>+  IGT_HOOK_SUBTEST\n\
>>>+  Name of the current subtest. Will be the empty string if not running a\n\
>>>+  subtest.\n\
>>>+\n\
>>>+  IGT_HOOK_DYN_SUBTEST\n\
>>>+  Name of the current dynamic subtest. Will be the empty string if not running a\n\
>>>+  dynamic subtest.\n\
>>>+\n\
>>>+  IGT_HOOK_RESULT\n\
>>>+  String representing the result of the test/subtest/dynamic subtest. Possible\n\
>>>+  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
>>>+  events and will be the empty string for other types of events.\n\
>>>+\n\
>>>+");
>>>+}
>>>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>>>new file mode 100644
>>>index 000000000000..a7b67837e5a4
>>>--- /dev/null
>>>+++ b/lib/igt_hook.h
>>>@@ -0,0 +1,69 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>+ */
>>>+
>>>+#ifndef IGT_HOOK_H
>>>+#define IGT_HOOK_H
>>>+
>>>+#include <stdio.h>
>>>+
>>>+/**
>>>+ * igt_hook:
>>>+ *
>>>+ * Opaque struct to hold data related to hook support.
>>>+ */
>>>+struct igt_hook;
>>>+
>>>+/**
>>>+ * igt_hook_evt_type:
>>>+ * @IGT_HOOK_PRE_TEST: Occurs before a test case (executable) starts the
>>>+ * test code.
>>>+ * @IGT_HOOK_PRE_SUBTEST: Occurs before the execution of a subtest.
>>>+ * @IGT_HOOK_PRE_DYN_SUBTEST: Occurs before the execution of a dynamic subtest.
>>>+ * @IGT_HOOK_POST_DYN_SUBTEST: Occurs after the execution of a dynamic subtest.
>>>+ * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>>>+ * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished with
>>>+ * the test code.
>>>+ * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the number
>>>+ * of possible events tracked by igt_hook.
>>>+ *
>>>+ * Events tracked by igt_hook. Those events occur at specific points during the
>>>+ * execution of a test.
>>>+ */
>>>+enum igt_hook_evt_type {
>>>+        IGT_HOOK_PRE_TEST,
>>>+        IGT_HOOK_PRE_SUBTEST,
>>>+        IGT_HOOK_PRE_DYN_SUBTEST,
>>>+        IGT_HOOK_POST_DYN_SUBTEST,
>>>+        IGT_HOOK_POST_SUBTEST,
>>>+        IGT_HOOK_POST_TEST,
>>>+        IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>>>+};
>>>+
>>>+/**
>>>+ * igt_hook_evt:
>>>+ * @evt_type: Type of event.
>>>+ * @target_name: A string pointing to the name of the test, subtest or dynamic
>>>+ * subtest, depending on @evt_type.
>>>+ * @result: A string containing the result of the test, subtest or dynamic
>>>+ * subtest. This is only applicable for the `IGT_HOOK_POST_\*' event types;
>>>+ * other types must initialize this to #NULL.
>>>+ *
>>>+ * An event tracked by igt_hook, which is done with @igt_hook_push_evt(). This must
>>>+ * be zero initialized and fields relevant to the event type must be set before
>>>+ * passing its reference to @igt_hook_push_evt().
>>>+ */
>>>+struct igt_hook_evt {
>>>+        enum igt_hook_evt_type evt_type;
>>>+        const char *target_name;
>>>+        const char *result;
>>>+};
>>>+
>>>+struct igt_hook *igt_hook_create(const char *hook_str, int *error);
>>>+void igt_hook_free(struct igt_hook *igt_hook);
>>>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
>>>+const char *igt_hook_error_str(int error);
>>>+void igt_hook_print_help(FILE *f, const char *option_name);
>>>+
>>>+#endif /* IGT_HOOK_H */
>>>diff --git a/lib/meson.build b/lib/meson.build
>>>index e2f740c116f8..10b8066647f2 100644
>>>--- a/lib/meson.build
>>>+++ b/lib/meson.build
>>>@@ -109,6 +109,7 @@ lib_sources = [
>>>         'veboxcopy_gen12.c',
>>>         'igt_msm.c',
>>>         'igt_dsc.c',
>>>+        'igt_hook.c',
>>>         'xe/xe_gt.c',
>>>         'xe/xe_ioctl.c',
>>>         'xe/xe_mmio.c',
>>>diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
>>>new file mode 100644
>>>index 000000000000..c8a93952abed
>>>--- /dev/null
>>>+++ b/lib/tests/igt_hook.c
>>>@@ -0,0 +1,170 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>+ */
>>>+
>>>+#include <stdbool.h>
>>>+#include <stdio.h>
>>>+#include <unistd.h>
>>>+
>>>+#include "igt_core.h"
>>>+#include "igt_hook.h"
>>>+
>>>+static const char *env_var_names[] = {
>>>+        "IGT_HOOK_EVENT",
>>>+        "IGT_HOOK_TEST_FULLNAME",
>>>+        "IGT_HOOK_TEST",
>>>+        "IGT_HOOK_SUBTEST",
>>>+        "IGT_HOOK_DYN_SUBTEST",
>>>+        "IGT_HOOK_RESULT",
>>>+};
>>>+
>>>+#define num_env_vars (sizeof(env_var_names) / sizeof(env_var_names[0]))
>>>+
>>>+static int env_var_name_lookup(char *line)
>>>+{
>>>+        int i;
>>>+        char *c;
>>>+
>>>+        c = strchr(line, '=');
>>>+        if (c)
>>>+                *c = '\0';
>>>+
>>>+        for (i = 0; i < num_env_vars; i++)
>>>+                if (!strcmp(line, env_var_names[i]))
>>>+                        goto out;
>>>+
>>>+        i = -1;
>>>+out:
>>>+        if (c)
>>>+                *c = '=';
>>>+
>>>+        return i;
>>>+}
>>>+
>>>+static void test_null_error_pointer(void)
>>>+{
>>>+        struct igt_hook *igt_hook;
>>>+
>>>+        /* Ensure passing NULL error pointer does not cause issues. */
>>>+        igt_hook = igt_hook_create("invalid:echo hello", NULL);
>>>+        igt_assert(igt_hook == NULL);
>>>+}
>>>+
>>>+static void test_invalid_hook_descriptors(void)
>>>+{
>>>+        struct {
>>>+                const char *name;
>>>+                const char *hook_desc;
>>>+        } invalid_cases[] = {
>>>+                {"invalid-event-name", "invalid-event:echo hello"},
>>>+                {"invalid-empty-event-name", ":echo hello"},
>>>+                {"invalid-colon-in-cmd", "echo hello:world"},
>>>+                {},
>>>+        };
>>>+
>>>+        for (int i = 0; invalid_cases[i].name; i++) {
>>>+                igt_subtest(invalid_cases[i].name) {
>>>+                        int err = 0;
>>>+                        struct igt_hook *igt_hook;
>>>+
>>>+                        igt_hook = igt_hook_create(invalid_cases[i].hook_desc, &err);
>>>+                        igt_assert(igt_hook == NULL);
>>>+                        igt_assert(err != 0);
>>>+                }
>>>+        }
>>>+}
>>>+
>>>+static void test_print_help(void)
>>>+{
>>>+        char *buf;
>>>+        size_t len;
>>>+        FILE *f;
>>>+        const char expected_initial_text[] = "The option --hook receives as argument a \"hook descriptor\"";
>>>+
>>>+        f = open_memstream(&buf, &len);
>>>+        igt_assert(f);
>>>+
>>>+        igt_hook_print_help(f, "--hook");
>>>+        fclose(f);
>>>+
>>>+        igt_assert(!strncmp(buf, expected_initial_text, sizeof(expected_initial_text) - 1));
>>>+
>>>+        /* This is an extra check to catch a case where an event type is added
>>>+         * without a proper description. */
>>>+        igt_assert(!strstr(buf, "MISSING DESCRIPTION"));
>>>+
>>>+        free(buf);
>>>+}
>>>+
>>>+static void test_all_env_vars(void)
>>>+{
>>>+        struct igt_hook_evt evt = {
>>>+                .evt_type = IGT_HOOK_PRE_SUBTEST,
>>>+                .target_name = "foo",
>>>+        };
>>>+        bool env_vars_checklist[num_env_vars] = {};
>>>+        struct igt_hook *igt_hook;
>>>+        char *hook_str;
>>>+        FILE *f;
>>>+        int pipefd[2];
>>>+        int ret;
>>>+        int i;
>>>+        char *line;
>>>+        size_t line_size;
>>>+
>>>+        ret = pipe(pipefd);
>>>+        igt_assert(ret == 0);
>>>+
>>>+        /* Use grep to filter only env var set by us. This should ensure that
>>>+         * writing to the pipe will not block due to capacity, since we only
>>>+         * read from the pipe after the shell command is done. */
>>>+        ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
>>>+        igt_assert(ret > 0);
>>>+
>>>+        igt_hook = igt_hook_create(hook_str, NULL);
>>>+        igt_assert(igt_hook);
>>>+
>>>+        igt_hook_push_evt(igt_hook, &evt);
>>>+
>>>+        close(pipefd[1]);
>>>+        f = fdopen(pipefd[0], "r");
>>>+        igt_assert(f);
>>>+
>>>+        line = NULL;
>>>+        line_size = 0;
>>>+
>>>+        while (getdelim(&line, &line_size, '\0', f) != -1) {
>>>+                ret = env_var_name_lookup(line);
>>>+                igt_assert_f(ret >= 0, "Unexpected env var %s\n", line);
>>>+                env_vars_checklist[ret] = true;
>>>+        }
>>>+
>>>+        for (i = 0; i < num_env_vars; i++)
>>>+                igt_assert_f(env_vars_checklist[i], "Missing env var %s\n", env_var_names[i]);
>>>+
>>>+        fclose(f);
>>>+        igt_hook_free(igt_hook);
>>>+        free(hook_str);
>>>+        free(line);
>>>+}
>>>+
>>>+igt_main
>>>+{
>>>+        igt_subtest("null-error-pointer")
>>>+                test_null_error_pointer();
>>>+
>>>+        test_invalid_hook_descriptors();
>>>+
>>>+        igt_subtest("help-description")
>>>+                test_print_help();
>>>+
>>>+        igt_subtest_group {
>>>+                igt_fixture {
>>>+                        igt_require_f(system(NULL), "Shell seems not to be available\n");
>>>+                }
>>>+
>>>+                igt_subtest("all-env-vars")
>>>+                        test_all_env_vars();
>>>+        }
>>>+}
>>>diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
>>>new file mode 100644
>>>index 000000000000..f5ba25e92897
>>>--- /dev/null
>>>+++ b/lib/tests/igt_hook_integration.c
>>>@@ -0,0 +1,281 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
>>>+ */
>>>+
>>>+#include <stdbool.h>
>>>+#include <stdio.h>
>>>+#include <string.h>
>>>+
>>>+#include "igt_core.h"
>>>+
>>>+#include "igt_tests_common.h"
>>>+
>>>+char prog[] = "igt_hook_integration";
>>>+char hook_opt[] = "--hook";
>>>+char hook_str[128];
>>>+char *fake_argv[] = {prog, hook_opt, hook_str};
>>>+int fake_argc = sizeof(fake_argv) / sizeof(fake_argv[0]);
>>>+
>>>+#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
>>>+{ \
>>>+        "IGT_HOOK_EVENT=" evt_name, \
>>>+        "IGT_HOOK_TEST_FULLNAME=igt@igt_hook_integration" fullname_suffix, \
>>>+        "IGT_HOOK_TEST=igt_hook_integration", \
>>>+        "IGT_HOOK_SUBTEST=" subtest, \
>>>+        "IGT_HOOK_DYN_SUBTEST=" dyn_subtest, \
>>>+        "IGT_HOOK_RESULT=" result, \
>>>+}
>>>+
>>>+#define TEST_ENV(evt_name, result) \
>>>+        ENV_ARRAY(evt_name, "", "", "", result)
>>>+
>>>+#define SUBTEST_ENV(evt_name, subtest, result) \
>>>+        ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
>>>+
>>>+#define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
>>>+        ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, result)
>>>+
>>>+const char *pre_test_env[] = TEST_ENV("pre-test", "");
>>>+const char *pre_subtest_a_env[] = SUBTEST_ENV("pre-subtest", "a", "");
>>>+const char *pre_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "success", "");
>>>+const char *post_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "success", "SUCCESS");
>>>+const char *pre_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "failed", "");
>>>+const char *post_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "failed", "FAIL");
>>>+const char *pre_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "skipped", "");
>>>+const char *post_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "skipped", "SKIP");
>>>+const char *post_subtest_a_env[] = SUBTEST_ENV("post-subtest", "a", "FAIL");
>>>+const char *pre_subtest_b_env[] = SUBTEST_ENV("pre-subtest", "b", "");
>>>+const char *post_subtest_b_env[] = SUBTEST_ENV("post-subtest", "b", "SUCCESS");
>>>+const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
>>>+
>>>+#define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
>>>+
>>>+__noreturn static void fake_main(void)
>>>+{
>>>+        igt_subtest_init(fake_argc, fake_argv);
>>>+
>>>+        igt_subtest_with_dynamic("a") {
>>>+                igt_dynamic("success") {
>>>+                        igt_info("...@a@success\n");
>>>+                }
>>>+
>>>+                igt_dynamic("failed") {
>>>+                        igt_assert_f(false, "Fail on purpose\n");
>>>+                        igt_info("...@a@failed\n");
>>>+                }
>>>+
>>>+                igt_dynamic("skipped") {
>>>+                        igt_require_f(false, "Skip on purpose\n");
>>>+                        igt_info("...@a@skipped\n");
>>>+                }
>>>+        }
>>>+
>>>+        igt_subtest("b") {
>>>+                igt_info("...@b\n");
>>>+        }
>>>+
>>>+        igt_exit();
>>>+}
>>>+
>>>+static void test_invalid_hook_str(void)
>>>+{
>>>+        int status;
>>>+        pid_t pid;
>>>+        static char err[4096];
>>>+        int errfd;
>>>+
>>>+        sprintf(hook_str, "invalid-event:echo hello");
>>>+
>>>+        pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
>>>+
>>>+        read_whole_pipe(errfd, err, sizeof(err));
>>>+
>>>+        internal_assert(safe_wait(pid, &status) != -1);
>>>+        internal_assert_wexited(status, IGT_EXIT_INVALID);
>>>+
>>>+        internal_assert(strstr(err, "Failed to initialize hook data:"));
>>>+
>>>+        close(errfd);
>>>+}
>>>+
>>>+static bool match_env(FILE *hook_out_stream, const char **expected_env)
>>>+{
>>>+        int i;
>>>+        char hook_env_buf[4096];
>>>+        size_t buf_len = 0;
>>>+        char *line = NULL;
>>>+        size_t line_size;
>>>+        bool env_checklist[num_env_vars] = {};
>>>+        bool has_unexpected = false;
>>>+        bool has_missing = false;
>>>+
>>>+        /* Store env from hook so we can show it in case of errors */
>>>+        while (getdelim(&line, &line_size, '\0', hook_out_stream) != -1) {
>>>+                internal_assert(buf_len + strlen(line) + 1 <= sizeof(hook_env_buf));
>>>+                strcpy(hook_env_buf + buf_len, line);
>>>+                buf_len += strlen(line) + 1;
>>>+
>>>+                if (!strcmp(line, "---"))
>>>+                        break;
>>>+        }
>>>+
>>>+        if (!expected_env && !buf_len) {
>>>+                /* We have consumed everything and we are done now. */
>>>+                return false;
>>>+        }
>>>+
>>>+
>>>+        if (!expected_env) {
>>>+                printf("Detected unexpected hook execution\n");
>>>+                has_unexpected = true;
>>>+                goto out;
>>>+        }
>>>+
>>>+        if (!buf_len) {
>>>+                printf("Expected more hook execution, but none found\n");
>>>+                has_missing = true;
>>>+                goto out;
>>>+        }
>>>+
>>>+
>>>+        line = hook_env_buf;
>>>+        while (strcmp(line, "---")) {
>>>+                for (i = 0; i < num_env_vars; i++) {
>>>+                        if (!strcmp(line, expected_env[i])) {
>>>+                                env_checklist[i] = true;
>>>+                                break;
>>>+                        }
>>>+                }
>>>+
>>>+                if (i == num_env_vars) {
>>>+                        printf("Unexpected envline from hook: %s\n", line);
>>>+                        has_unexpected = true;
>>>+                }
>>>+
>>>+                line += strlen(line) + 1;
>>>+        }
>>>+
>>>+        for (i = 0; i < num_env_vars; i++) {
>>>+                if (!env_checklist[i]) {
>>>+                        has_missing = true;
>>>+                        printf("Missing expected envline: %s\n", expected_env[i]);
>>>+                }
>>>+        }
>>>+
>>>+out:
>>>+        if (has_unexpected || has_missing) {
>>>+                if (expected_env) {
>>>+                        printf("Expected environment:\n");
>>>+                        for (i = 0; i < num_env_vars; i++)
>>>+                                printf("  %s\n", expected_env[i]);
>>>+                }
>>>+
>>>+                if (buf_len) {
>>>+                        printf("Environment from hook:\n");
>>>+                        line = hook_env_buf;
>>>+                        while (strcmp(line, "---")) {
>>>+                                printf("  %s\n", line);
>>>+                                line += strlen(line) + 1;
>>>+                        }
>>>+                } else {
>>>+                        printf("No hook execution found\n");
>>>+                }
>>>+        }
>>>+
>>>+        internal_assert(!has_unexpected);
>>>+        internal_assert(!has_missing);
>>>+
>>>+        /* Ready to consume next hook output. */
>>>+        return true;
>>>+}
>>>+
>>>+static void run_tests_and_match_env(const char *evt_descriptors, const char **expected_envs[])
>>>+{
>>>+        int i;
>>>+        int ret;
>>>+        int pipefd[2];
>>>+        pid_t pid;
>>>+        FILE *f;
>>>+
>>>+        ret = pipe(pipefd);
>>>+        internal_assert(ret == 0);
>>>+
>>>+        /* Use grep to filter only env var set by us. This should ensure that
>>>+         * writing to the pipe will not block due to capacity, since we only
>>>+         * read from the pipe after the shell command is done. */
>>>+        sprintf(hook_str,
>>>+                "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
>>>+                evt_descriptors,
>>>+                pipefd[1]);
>>>+
>>>+        pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
>>>+        internal_assert(safe_wait(pid, &ret) != -1);
>>>+        internal_assert_wexited(ret, IGT_EXIT_FAILURE);
>>>+
>>>+        close(pipefd[1]);
>>>+        f = fdopen(pipefd[0], "r");
>>>+        internal_assert(f);
>>>+
>>>+        i = 0;
>>>+        while (match_env(f, expected_envs[i]))
>>>+                i++;
>>>+
>>>+        fclose(f);
>>>+
>>>+}
>>>+
>>>+int main(int argc, char **argv)
>>>+{
>>>+        {
>>>+                printf("Check invalid hook string\n");
>>>+                test_invalid_hook_str();
>>>+        }
>>>+
>>>+        {
>>>+                const char **expected_envs[] = {
>>>+                        pre_test_env,
>>>+                        pre_subtest_a_env,
>>>+                        pre_dyn_subtest_a_success_env,
>>>+                        post_dyn_subtest_a_success_env,
>>>+                        pre_dyn_subtest_a_failed_env,
>>>+                        post_dyn_subtest_a_failed_env,
>>>+                        pre_dyn_subtest_a_skipped_env,
>>>+                        post_dyn_subtest_a_skipped_env,
>>>+                        post_subtest_a_env,
>>>+                        pre_subtest_b_env,
>>>+                        post_subtest_b_env,
>>>+                        post_test_env,
>>>+                        NULL,
>>>+                };
>>>+
>>>+                printf("Check full event tracking\n");
>>>+                run_tests_and_match_env("*", expected_envs);
>>>+        }
>>>+
>>>+        {
>>>+                const char **expected_envs[] = {
>>>+                        pre_dyn_subtest_a_success_env,
>>>+                        pre_dyn_subtest_a_failed_env,
>>>+                        pre_dyn_subtest_a_skipped_env,
>>>+                        NULL,
>>>+                };
>>>+
>>>+                printf("Check single event type tracking\n");
>>>+                run_tests_and_match_env("pre-dyn-subtest", expected_envs);
>>>+        }
>>>+
>>>+        {
>>>+                const char **expected_envs[] = {
>>>+                        pre_subtest_a_env,
>>>+                        post_dyn_subtest_a_success_env,
>>>+                        post_dyn_subtest_a_failed_env,
>>>+                        post_dyn_subtest_a_skipped_env,
>>>+                        pre_subtest_b_env,
>>>+                        NULL,
>>>+                };
>>>+
>>>+                printf("Check multiple event types tracking\n");
>>>+                run_tests_and_match_env("post-dyn-subtest,pre-subtest", expected_envs);
>>>+        }
>>>+}
>>>diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>>>index fa3d81de6cef..df8092638eca 100644
>>>--- a/lib/tests/meson.build
>>>+++ b/lib/tests/meson.build
>>>@@ -10,6 +10,8 @@ lib_tests = [
>>>         'igt_exit_handler',
>>>         'igt_fork',
>>>         'igt_fork_helper',
>>>+        'igt_hook',
>>>+        'igt_hook_integration',
>>>         'igt_ktap_parser',
>>>         'igt_list_only',
>>>         'igt_invalid_subtest_name',
>>>--
>>>2.45.2
>>>
