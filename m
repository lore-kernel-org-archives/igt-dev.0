Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4579BC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 18:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DFE10E52E;
	Wed, 21 Aug 2024 18:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEIYhxRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47F10E52E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724265435; x=1755801435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eQO8rLCLewfU1/0wJsuzehpdPHHO84y16UcPAMDNTN4=;
 b=LEIYhxRcS1S5/5ojIKx9TY+fK1PdhYlTEjn3FegBAzSo+ZGH0Q6+jH2l
 RlXx7fUyP6h3Sa9PeiDQ1a88aN+4LuJQSPdDNeFl9aP0iL5GVGm5jEeuK
 s78A/v2F42K30nkmvYEY93nYQI1AJuwL7uulpItPVeLhFjdT/JOUfWJlO
 saB1YXGvtfo/lzT5VbIVadBym4HcllFxiqa/nT5oApFNKwd/7biHfL+sf
 NLMkvAplxT6OSX+8tObvCazt4m01esvnl/uMK6P427Fx+vLej50ORE8CE
 61cc70xqS/6QzdAf7ks91EzITwQJL9C41yyA2SnrzC1cojGXS07yKpXxP Q==;
X-CSE-ConnectionGUID: aH37JC0bRjiL8RgRLdF3Dw==
X-CSE-MsgGUID: pRG3riMDQfyvHDB5ZQPsXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33215228"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33215228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 11:37:15 -0700
X-CSE-ConnectionGUID: hEIrgK94SsCgdCZQ8yKt3A==
X-CSE-MsgGUID: n7KSzq60Q4ucHy5q9jcj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61480881"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 11:37:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 11:37:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 11:37:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 11:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEH/3k3YLUl4deCgfnXVVg9OiXcaKNR857DbqxHM5MERWAMZIZKKyDE8U19p0ge/h5c70z/xSMIEy+nN0rA2rNXUyXDfbkcauK2GnTRfIDNtBA7jWVc8kyChL5aT4VWgc4KLEHUx4pxGBx36GaMtMvpPfScS018TxH+9mLAFaMEPnRy2/VnzxEqb+H0kI5eSPv5pyVa/hG62ZgVIhoc9MGm6L+jrJ9aTkcCkci0jJhPwnYcMvdHE+R/iyEIK9Jxrh9Czvy+5oOAVjVB3FBEaN21t0vflU5VthDwVh56ETFLpzrscdsH4vUJlMMAQ59wdavxEhV+p8yNPBdNJvGMwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRINsXALwFJiia6MZXWbKJLiUHT1nEE6LsOI2wqOeBE=;
 b=hdgZdbUP3mT2FN5N9MOfj7GymsifypeP/IPGEgPOesWXjRsuP0ydJIKpzPnhWayVv/ir5q9a5FaRPD25PbhVrUFEmtVhnW/q6RTnzf2hdfzRMXr/OvcTuJan79ZQJHasaPPWK9n74RoYTMYg348p1t8FOyFJLuMQl1m4quHJmwkNEwXDeV1VszxtlXn1yvgqFb2dFyefed8jls3SB4SNei9ORFZ1gpui56JJJmCvosnAoMInFHphJOcsuvdUp5MrLcMllMAFYEr0ZuL8OWU5d6ZhxIQaxHIeR8f47HPkXnwR/I3oi84irqdS2B+Rpc7kEUvVJe5YwuAY7hs0x9AoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 18:37:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 18:37:12 +0000
Date: Wed, 21 Aug 2024 13:37:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] tools/intel-gfx-fw-info: Override kernel
 types
Message-ID: <uenkalsey6efedsnbam7kys377yt5i2mqdo4fz5kzefpxwsfuk@kp7hvecfnzuy>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-5-lucas.demarchi@intel.com>
 <172426068263.2071.3467208225849587363@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172426068263.2071.3467208225849587363@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:303:b8::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b178ce7-49f6-423a-4da0-08dcc210454e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5M3a3IVAuPn0PpvQlVDrppEBA+31wXJy73VlsqHi2bWbU/KmSs+HjKRSe/0o?=
 =?us-ascii?Q?7nk9iiK1AuAPSM++lTdophveyn/Qra6gdVdIRe5M6OjF5KLuN1knT1uTZxV9?=
 =?us-ascii?Q?MODHbwvHLHXSK9xcewxr9L7G1obCwh6j93PfjCh9dcQPs2u9uVTcWj3OuLcm?=
 =?us-ascii?Q?2CI7087B1ZGj63AZ2qbvPXafo8hBLnDdHpKyph4rnsQmn+B2J72+6rLMz4l+?=
 =?us-ascii?Q?qIN/SCR5/zozwDAgfTKxn3jj0UK7ipZRQU7jdLrj8o7zBYTBoVvOzxjL4Byc?=
 =?us-ascii?Q?ThVBXT5uH1k0sYVvSJ5z92J97W5qYRIld8e7Cq+tbTSWqe/RNd7yddPlElsS?=
 =?us-ascii?Q?UhUDJAAZUlHnkN3UV9Gwr7PY9PeY0uIrOnDYgtgotPHydF9yoBfxk/Jsbi75?=
 =?us-ascii?Q?BO5ar45nsJgGsLLctQZIz9y39FNXcFz0e5abBBZJvNGHSi+hzLBSDUfKVtWp?=
 =?us-ascii?Q?9I0gIzKGSpPJNGa4y1/0Mr1WuKwYP1HKstIhCj7k6+Hgh6W5T6JLxSi9EfQR?=
 =?us-ascii?Q?FzzLsuT/EISxmGrhB6f35iZkuK+yrmjJ0ltixMxE47a5HOohF7fEGG2In7LQ?=
 =?us-ascii?Q?voe2HdBuXF76SDJVyYDOa6C/6AeSn9HXGnArGnNZZI6WMwdc3FYC5UblsBTo?=
 =?us-ascii?Q?3JxXYJd3iTYWduxo4OXCQyKmC9LmAz2EU2WotIDb8JpWnj0IImyTBv+u6rZV?=
 =?us-ascii?Q?uEEVCa7rZzACjgznXDR6OvV/0+rpO+uqdjX6oN4hbv5Zn8uJ3OzvCw3JDZs1?=
 =?us-ascii?Q?LsxHwg7S9PN5r4qS0hZDOLantRvMCNZenYUjJFxkaAwB8YW15pPjZ8EuqQar?=
 =?us-ascii?Q?Spz0HGQmHEWRvTrhKAP2ERhXpb+IM9aM0lUJFksx0xYw+3YCodCK4P12mJZB?=
 =?us-ascii?Q?R95DM+1z8jn9wvegmDjAD/E98oDIYouKKliOzALv0v2XBWkBnK1IbKWxcDUg?=
 =?us-ascii?Q?eIltELE9RC1e4NdXozW2IZvr6tyx4M7EHYBhX2TmWYhGkU++hBg1/i1QMb+d?=
 =?us-ascii?Q?1I6z6NfNhKB14UaPd9TKGUGcGpErEpalYwxA+TTkkfwO+24TNkeATfcr55xE?=
 =?us-ascii?Q?tl5nG2K/alqPanh1oh18fpFFOB332WlDAqcfHiLuG1LhcoR1rxUJDL0DCsap?=
 =?us-ascii?Q?z57ps+0uKtfogdHcjpEzl02VjUhj3mjLyLZwq9SSp0r2qgpJSIDEe9nPSXwm?=
 =?us-ascii?Q?v0FmQgulefR8ixm0nkqRCz9joh6UOIc+1bRGOhVfVMQGU9j4DIN1Xw+8jr23?=
 =?us-ascii?Q?BLWLVCPQOO4EoGcWYNANWN98EYD88FjHhokXVjCs7BJ2kglDIkKneIOpAn0Z?=
 =?us-ascii?Q?1vk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYY/s/BuNEXcaMVwx8rwS5evnI1L2B3k/3GRaUzQwtlBvBD/iHb1Zc26hxME?=
 =?us-ascii?Q?LnT/uNuYm1RzI9yDvOijZS0oTN1qUBvzVvEoEFXAfUH/C/7v2EwBhZb4Yu01?=
 =?us-ascii?Q?iTfHM6twAcc7nL5FlwZLfnoxY9wAugNJLWsMPltBrIL4PuNAgGMbFNp2daOL?=
 =?us-ascii?Q?cZTFy2beYrqFCP8Oli4TvF4MpEeZneAmSoWRKT7TbTE0gle/AXE1WCum2Rt1?=
 =?us-ascii?Q?lhbxd7fFVZ+Oq3YJLPVHnRVFWwFAamYBbSsYlwWXXetCLct0rtdXLXN60WG9?=
 =?us-ascii?Q?0j6KaMCJ2GuYnJME/DXzeeSyBrIHQgslj2PneYX66Fi9LNYUTq4aQt9YRrXt?=
 =?us-ascii?Q?3qqrIEKwQ8OavO9MGEYDZG4xPAV5gBR8OVymEgxYnWGxzgmDM1sOQltOeUnb?=
 =?us-ascii?Q?wtWEQmsvYr9ePh5mkbnd8OMvQPoAI/G40+nVUT2FmmD1szOjMrAlQ3eU1Df2?=
 =?us-ascii?Q?rFUK2A1nen4Q2vCtaTWdHVMKNfDPZ0BEuZoWvSdN+W2YMxCUILmN/tcKQn8m?=
 =?us-ascii?Q?014N07Y8bgs9Y41zdDuNWlt0fXvuxKln8Kop2MsJbCnPaD0eQizQVIjQYxL1?=
 =?us-ascii?Q?y6wDKX3i/zFDFQT85ltz6PzNiO695MdvHsKdnWQJqS+OZ80YiaoJ85ejBb4Y?=
 =?us-ascii?Q?2p87yHnJnR+q2UigFDm7iIHJJEgZLO2TBLHhhJ0wPnpxvNj7tmA6vPxK4FwF?=
 =?us-ascii?Q?I3mYh86EAfT3/XV34DVkyuVDi8usSctC3l55jHuy8nYGh3pLXgcmtPTEHMTP?=
 =?us-ascii?Q?mI8gTa/mTimwp0BXLeytHHLeQxn2fRFVCukbjA8egutmjefrboov7TI3wBXx?=
 =?us-ascii?Q?2ycAH8juQYyNKYHyYHP/8csUZT5/uHNkXje4n+J0UtifdGx5GKq14tSwNawH?=
 =?us-ascii?Q?O/+4zuYoR8suDSDbyUUcvQw2lS+upc9/dBmJUWV8+IIJjd5DxnRUWxPm9p7F?=
 =?us-ascii?Q?f4fnPOHHtBDxHg4O3vt7CoKp2esBJwNHLpZSGnfY7JA+8nPGRQnd/bdRTEhD?=
 =?us-ascii?Q?L+FIK3ZAe/RyLCOSJOAj5NmnVU56c0tyl9qUSseFSVBySXRTVlkCzYM5qKns?=
 =?us-ascii?Q?jgRGxneTgRgNlFV7GWQr/wl9WmRFixTsAbqj+noKIdvU/+SA47fqQ1wb6XD0?=
 =?us-ascii?Q?mR8pQKF3iF2+ad4IYnwGs0u+jc8W2IdwH5Ye2yXrxjTMOnKZQVr50kYqaZhe?=
 =?us-ascii?Q?+uVPl18a9wy4ni6yk3j6xRq/sL06p4ZgMmkR+rPLwJDmug2muPN7V8uJLR1f?=
 =?us-ascii?Q?y/dZigcFdSlPeauD4hESxZsx4gzG4zMyayctAw0k624seuTN0utX/bwgS/qN?=
 =?us-ascii?Q?YrnIId9Yi+QKedWvxySLwIBVg12pWqTV9f6JUZd1zxd3Vb8qlsRwBb1dStLQ?=
 =?us-ascii?Q?SDi4fOmK7a/hdcqlN5s2PWZaqpCtfLk4shKTHkIfdKa/BpEy4zMS5QI66L7X?=
 =?us-ascii?Q?BRLR0RQo2e7TryMb7n1QfXH0fnGvLkvcphhAa0WzmQFuLyQ7nZ1rSlFcOyKr?=
 =?us-ascii?Q?BcS/dsBLMPB0s7a22ayHC80hqd7YKGuoocY71VpBgH0bvKJfSPKFCSp3H8xa?=
 =?us-ascii?Q?VStZd1jVtpGRNo5L1jz7j7ixxRVSNClOO9ELzuPY1DRQ/iFnEgBYXMEc+4+I?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b178ce7-49f6-423a-4da0-08dcc210454e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 18:37:11.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5bTSszJADNutuPD/ImDfuwNAPahvmCAPy8Yi4v4Al9rDqa+fZSggF66f4muFvrOK6QH+o1RjN9hgTdhaldiFRHYhCMk/ZOmebhRUIgLdyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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

On Wed, Aug 21, 2024 at 02:18:02PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-08-20 20:29:26-03:00)
>>Previously we were defining u32 type as part of the string we are
>>loading. However in order to use other types like u8 and u16 in upcoming
>>changes, it would be better to have them all defined in a single place.
>>We can't create a typedef like done with u32 because cstruct already
>>defines a few types for convenience. However it's very surprising it's
>>defining e.g. u8 as a 64-bit variable.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> tools/intel-gfx-fw-info | 9 +++++++--
>> 1 file changed, 7 insertions(+), 2 deletions(-)
>>
>>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>>index 0f1da8bff..57d6f935b 100755
>>--- a/tools/intel-gfx-fw-info
>>+++ b/tools/intel-gfx-fw-info
>>@@ -23,8 +23,6 @@ import typing
>> #          dumpstruct(): give it a name
>>
>> CDEF = """
>>-typedef uint32 u32;
>>-
>> struct uc_css_header {
>>         u32 module_type;
>>         /*
>>@@ -120,6 +118,13 @@ class Fw(abc.ABC):
>>     @classmethod
>>     def create(cls, f):
>>         cparser = cstruct.cstruct()
>>+        # cstruct defines some "convenience types" that are not very convenient
>>+        # when parsing a kernel header - e.g. we don't want u16 to be parsed as
>>+        # uint128
>
>Yikes.
>
>>+        cparser.typedefs["u8"] = "uint8_t"
>>+        cparser.typedefs["u16"] = "uint16_t"
>>+        cparser.typedefs["u32"] = "uint32_t"
>>+        cparser.typedefs["u64"] = "uint64_t"
>
>Well, typedefs is exposed in the documentation, but not properly
>documented [1]...
>
>Have you tried using cparser.add_type()? Well, if that doesn't work:

yeah... if we pass cparser.add_type(..., replace=True) then it works.

>
>     Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks
Lucas De Marchi

>
>[1] https://docs.dissect.tools/en/latest/api/dissect/cstruct/cstruct/index.html#dissect.cstruct.cstruct.cstruct.typedefs
>
>>         cparser.load(CDEF)
>>
>>         magic = cparser.magic(f).data
>>--
>>2.43.0
>>
