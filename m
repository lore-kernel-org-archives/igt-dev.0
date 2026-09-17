Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799A5C982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 15:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2A410EF78;
	Thu, 17 Sep 2026 15:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmRI1CSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7010C10EF96
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789659517; x=1821195517;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HUedXVZ7k3SM3Gli1NtysUHA1SYXwZATXs90RhWHxBU=;
 b=lmRI1CSVtwZ10ksEQBHcB50aiiex7a07lSCz3W487Lp8LQphEhKexzJw
 4m4Bu9LJgORcOzV3wd0XLNkBx+EGxgz7AZzuW+nSIXdZMyFbjKgEgBtx5
 A6TwRhbIbIAe3stZovomROnJdn08i4J+4n/fkAN+SW72slH9gISsm8yZM
 6Lo1usLwgGGVuuYZ1/SPECTMKIn1O1w/KFLhMYeALn9Way3LJ5/s4YQkV
 +chqbARCC4fHRJ3zFBdf6nMC/UpZHwgznZxHU5nIM0iN/CbvlRNr5Eam5
 sv02InLhlG2wZj+lShivD7wpooZl810XZ9PPWFTFbmACgYCXpVx6nYP4o A==;
X-CSE-ConnectionGUID: jQe77XYuTJ6uaW2XSaKCZQ==
X-CSE-MsgGUID: hUGEYV5eSD6WUKgtZyO2sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90113915"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90113915"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:38:32 -0700
X-CSE-ConnectionGUID: /zVT5w4ZS022VpPU2xxXjg==
X-CSE-MsgGUID: pUqfG2ESQEqf4dd2Guk3qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2298131"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:38:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:38:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:38:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we67jQExNEOCPYWjJFhZka8Y4qI5gU8hG+y263RDmc3vylc+3jWHlSouN1utlXic+CPXNHaAwJi4kilVKWkl/55dnbLJhjkiubNeJWWfynWRXEx3AKPl5qt705O5XL1zPUw5WVERMFDfc1aTMVFtlT0FIDUSehTE+ktHojEk8EwhowGITXqAswjMjtjA75Jzs8KG9woPT4aMKb1q/TN5LM82b7FJ+Sy+DEsV/zetVF3Qx52udbq0vozpJoo0Ip07aOClhVt66ZY4C4SZGIotTT1jHdZvvvM8eO1JQMvYbcvE+VC+j9E3M4hd9rJ4XO0Oz6PYRcfgoHr0kTz/zLcJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuZRJLDAAwYzwL3KPlGUqvsOdNzuZTV4NyRFTdD9TZQ=;
 b=eScINiDg1A4SucZkIxCwiA4HhaSVKea8r+aZBqzCy80+0eqdkhWHYeWKUsEGZKBr8+0PhDMiCfDEG4iNU6NXJ9oYf+ynYmvRXFhwvfifzWjzEJi9JV4KMOGLAak7NjSA1mo63Y03eBvlXhxPvxVluu2oi5PcB0Z373/kPgAIXua/bKDvJ6OT61Lf5vh/IjwvfOP49+xV/KQ++WssW2sFGcqeiiymmBY6krupkOsRf1OApFwWTTf/lL2vuDldAKlZjR9k3JutzvA8f/FC5HFGST5Gf19RMLDVuEftDeGLlBjd3ir7l8yI14ncYJzhOYe2vEUDGiJJEjJyK1mzPB2Ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 15:38:22 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 15:38:22 +0000
Message-ID: <564aeb77-6810-42f4-b2ea-65077e37da29@intel.com>
Date: Thu, 17 Sep 2026 17:38:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,3/4] tests/sriov_pci_config: Add VF core config checks
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260916115201.1973752-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260916115201.1973752-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::27) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c27f9bf-a1c8-4aa4-7fe8-08df14d1b4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: dEGSkFl0p4G24kU5rRRPfjjEDxQY/MAtRCSgnSdXRH5JombrdYyYC7BCjQkXX0dgTsmz7Mh3d206H2CyqPzyLagdH4UFH+YJd4r2d5s+NVi/AD4CghHjo6MF3O1+iMbANKZsJ0mQz7bKDtPJGBtvalRU7SSOGzk/tvxx4fqennfJNQOEzBPS2vMZ3rCHpW0JN0IGZwGdOCtPXnEwlKfQwF+PZPiOEfItoid6MshrbO1xq54zKbmM1m8R4cuZnHmIjsL2gXvv9CoSfos6V1O2E6OGU38hwwsBHd/uf+gaSxOnd+ElLwGg/D3tflIC50Wp400BOyR4YCvdvRm7j9gO0J8nPdrAVLV9/938k0dht26xplW1p3a+bglhaqn/VFTOv5DqGAQbAcl+VSbrjx1/0FPE8S5jzeb0ND0ii0X5HKZx8bTE4Nc6lQRHgr0B1yBvM3oa3XZFbVSuBYsNd2pidS3u6RvfG8CQYqjW2D+e4EIZK6WsgrpU6LbLOIZFoeV1vJp8bG9JM4eJm17QzPwwkkHXWIiu0bj+hPbZKHCCNGcasDVwcQyP+qQNjfQPc2dzkgqsdkuz7rMiiPQGUuAJkwvUwxYedUmDI72vcmQsA2GYw6U778GPs+wC1Pl4W3ZpEyZkH7nuvc+IB+mzviC7w714MxBPlf/4J6JyXQkG1RE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjRJN2hmSXgvdnpLM0JCQncvUTMzUzJkOXN5V2VuUlduQzhSNGtsWUM4MHRx?=
 =?utf-8?B?NHkwSi83SEV6SXRFSCs1QzlqcWZwVEc5WmNOUEo4RmpQMzlOd1RDR3hjMTYx?=
 =?utf-8?B?cjFYT2YrM25wcGF4bmdyMG5hK3IwYi9aaUU1Nll3Z3drSnJoSlZLYmgzV1BX?=
 =?utf-8?B?SFZoK1RjS01nL1h6dXluMnppaTNWdFhhczB5OWY1aHhnNHZSN2ZoekRoeXBH?=
 =?utf-8?B?aUR2S2ptZFNGVmpaQStON3Z0OGErTzJMZllObWpQR0s0Wkw3RDBNWktGYW1h?=
 =?utf-8?B?T0lKVDFzTUhSZjdiTWxZZmpEWHE4Rld3Nm8zRWpKTnB4eGVRU2k3eEx3Q2dH?=
 =?utf-8?B?bjFnSnFDYVhuTFNDbVJ5UFhYU2RPMDUxOXBSTEdzQWh4ektwdHFMd25VbmRB?=
 =?utf-8?B?ai9pNW1sVHhpeEpBTDZiTGdmY0tRYmN2MXNqUUFUSmdOUGVOWGJqQ2tYQWE4?=
 =?utf-8?B?NXZFc0pWTkFwbC9zbVo2Y0JReUZTak5jV0RLeXdsZ09FT3pMdUU4Qy9rV2FT?=
 =?utf-8?B?dFV5alNFcUZ2T3A5ZEVxYS9GWnFRSEJoUGZkTkQxRHBSZ2FxS25XQStGc05L?=
 =?utf-8?B?MnRFTVVUMHREU1NPWkI3L283Rkt3aVBibUdLaC9tNllQNEZud3JmZWNtSlRo?=
 =?utf-8?B?RjFJUWhOSzNhMXFRaVFwUG9ZdUFtdHFMOTBuNytGcG9LRkFhMGFnVW9oNEFz?=
 =?utf-8?B?Rkx3d1FjTDFsNWovWGJQREJGVUozNHp6aGh3N2FQRFlORTF5SDlGbWFnV0VB?=
 =?utf-8?B?SlFyaGZiWVZIQlhwNytaUVBJd1lyTDhsdEZMaDA2ZnBXNkpZNURyTlhBMHVn?=
 =?utf-8?B?N2x1dzJYNVY1SXBHelUyeG5xRU5nT25iZXZ6RFMzL3d6ZGxhWUY4NGdOT29h?=
 =?utf-8?B?YTlHelVWNGhhRmtwV2ZQbGxSMU9GVnJvbThRRU9lS3U1VmhoTG9ncWhKeG5M?=
 =?utf-8?B?WkoxMGEzMG1XS0NFajcrc2wxNjd6ZFhrNzVWV055dTAxb3ZES3hRWSt6WVdK?=
 =?utf-8?B?dHFYTFlvb0JsWmkxcFoyZktuMzRNZXVaSjBFVm04cTZwaHNudWFUVWNLVFMy?=
 =?utf-8?B?TC9WaS9lTVk4MVhXT3ZLMHpjNzBhM1VzTmlWb083RVRrd2Z4Z3E3Qk1Xd28z?=
 =?utf-8?B?bEFPdUpCWnluQkxQR0x0M3ZleUFlbVB4eUxvZUxlUTN5MEd6N3hyT25EaC9W?=
 =?utf-8?B?UHNFdWFUVC9JeURrM2tWYk5MTlhnSkxacjZua1VSTVMzc1E4amFUbXNGK29h?=
 =?utf-8?B?UzNFc2V0Z0tGcGxDaFkrcHlRV21aeExUZWdlQlRxekE1TVdDeVpYRTRjU0to?=
 =?utf-8?B?RWhaVy9WY0hxaVhoVHhrZEVwRVAyMnF3YlNRdDF2MzN2TVFSbkRrdWxPUXF3?=
 =?utf-8?B?UzgxaUNJUjRnSUNMRkN3aEkyRkp1Uk1XUHhzejc0TFBkQlhkL1NYd01VZUl6?=
 =?utf-8?B?a0JxOFpSKzVPMzgzMU84c3QvemJaQ0E0cytMZm56b1ZqVFY2aWNodVpUbjg5?=
 =?utf-8?B?RG0ySjRKMkVoaHlDOEpUbEFUWHp4L1RxVkoxc3VqU25RNFNIalJYdE1GVVNK?=
 =?utf-8?B?dTFnUEhLczRSQjZqYko1NGozaU9IRjRIemZKMDdnVEIyeWlpRkRCOGZMa2hQ?=
 =?utf-8?B?d2Rxa2FPdHVmYjdwRk81TWRWL3QyTTlKQ2g1M3FZYi8rUGFreEJyL0pTMmpj?=
 =?utf-8?B?aVQ5SHNmRFFQUitLT3psWHQ3RThxeDVsbGdpMm9xQmh2VlRzUG9XRStGOGE3?=
 =?utf-8?B?ZU1NOU83YU1URkdTeDR5SUNZalRJMEhDcFVyeGhjZ0JWS25iV0lRMWRZMG1O?=
 =?utf-8?B?dTQyN2xnZUluR1ZSRWd0alpHdnNaNUJVelgzZE9lSXN0MnJ4aEEyYjF5dldR?=
 =?utf-8?B?djhSd1RPcjdGaGhBdnVnRXlGV1NyYTJZcXJMMkFOQXYwMVVDRFlrNHpydnNp?=
 =?utf-8?B?ODZLUUpoSFgzZEZyN014cXFLeWxCTDdiOGZQMjZIeUhKaUJ3c3ZYdUJkRGNJ?=
 =?utf-8?B?cHhnbXhoR2lDQzBsWnYrOENWTUdkcDR0UDJxL3BBSDZTUUJWcXZYbldrdXNQ?=
 =?utf-8?B?SjlZR3ByU1k0RHJnZTIwdFJJV2F3V3BVeXBnVGhxdkJLdWFUR29zeC9KdlQ1?=
 =?utf-8?B?VUtKZ2dqeGJ2TUs0OW55VVZsK3Q0WElCdkY0WlhUY0NFK1lIZmZZNVI1R2VD?=
 =?utf-8?B?b3JDalAya2VaM2I5MmIwdUU5Y2R6R2s2cXhZMWlnRXBaNElZRy9yTkQvVnNj?=
 =?utf-8?B?Q0NUdlB1VGV4TlNMV2IrQm1UUjRjY3lmOERPNUZUZ2ZORXpqZkZteXo2Wm5w?=
 =?utf-8?B?TktlRW95bVdDNnNKUGpmTUgvT1B3RUZOOGxqazBOTWk0V2ppVlMxQT09?=
X-Exchange-RoutingPolicyChecked: XQsVMy5Qk8hv20lx3lxuVOtcyC3Vp1b0wfPGeXp7XR8xX6I89jCJa8Ij6RfukaL9uLorqo7NetzgLQBVNHyrNEe/CiA/P9GD8j8DusWkmPzIwXrghon9J8CSiDCxRSPO+vFwVsLVwOTmHJEl2iw01XfMv6lq0I7f3ETQXZeLqPKByu8TFd3hzGXzikrYChpI2DlpF/wmAJu9hRkEZVKLwxgLJpMpxZnDbzQK+wTVY+Rbh6YFj8csXQ5piHd43sWMDxR8VUiHEoXM3ImRoLLBjGlepr2hCzmspNxI5D6GM7zLGMKEpwEx1Dnni3objHw4ajnqDHl/nbY1gBDaqgAk7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c27f9bf-a1c8-4aa4-7fe8-08df14d1b4a8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:38:22.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpMIdlBnfF9M93hO69Y2R4WWJKjjDbvTrDONhkhW9hXxB18Q1O3KjrPUe3tehVI6YmkmagdGiHWPXLnJ8y/ZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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


On 9/16/2026 13:52, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add checks for PCI configuration fields required by SR-IOV VFs.
> Cover the common header, BARs, and PCI Express capability fields.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna
> ---
>   tests/sriov_pci_config.c | 234 +++++++++++++++++++++++++++++++++++++++

You forgot to update tests/meson.build.
It doesn't compile without it.

>   1 file changed, 234 insertions(+)
>   create mode 100644 tests/sriov_pci_config.c
>
> diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
> new file mode 100644
> index 0000000000..9f8fd9fb50
> --- /dev/null
> +++ b/tests/sriov_pci_config.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_pci.h"
> +#include "igt_sriov_device.h"
> +
> +/**
> + * TEST: SR-IOV PCI configuration
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: PCI configuration
> + * Functionality: SR-IOV-related PCI configuration space
> + * Description: Validate PCI configuration fields required for SR-IOV,
> + * including Virtual Functions.
> + *
> + * SUBTEST: vf-common-header
> + * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
> + * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
> + * Readiness and Interrupt Status bits in Status, the Header Layout bits in
> + * Header Type, and the BIST Completion Code are all zero.
> + *
> + * SUBTEST: vf-bars
> + * Description: Validate that VF BAR address bits read as zero. The BAR type
> + * and attribute bits are static and may remain set; the upper dword of a
> + * 64-bit BAR must read as zero.
> + *
> + * SUBTEST: vf-pcie-capabilities
> + * Description: Validate that FLR is supported, Phantom Functions Supported is
> + * zero, and Auxiliary Power Detected, Emergency Power Reduction Detected,

nit: Validate that FLR is supported, and Phantom Functions Supported, 
Auxiliary Power Detected ... are all zero.

> + * Current Link Speed, Negotiated Link Width, and Link Autonomous Bandwidth
> + * Status are all zero.
> + *
> + * SUBTEST: vf-pcie-capabilities-2
> + * Description: Validate that the Current De-emphasis Level field in Link
> + * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
> + * and later.
> + */
> +
> +IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
> +		     "including Virtual Functions");
> +
> +static int pf_fd = -1;
> +static bool autoprobe;
> +
> +static void read_vf_config(uint8_t *config)
> +{
> +	char *vf_slot;
> +	int ret;
> +
> +	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
> +	igt_assert(vf_slot);
> +	ret = igt_pci_config_raw_read(vf_slot, config, PCI_EXT_CFG_SPACE_SIZE);
> +	free(vf_slot);
> +	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
> +}
> +
> +static void skip_vf_test(const char *reason)
> +{
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd),
> +		       "Failed to disable VF(s) before skipping: %s\n", reason);
> +	igt_skip("%s\n", reason);
> +}
> +
> +typedef void (*vf_config_check_fn)(const uint8_t *config);
> +
> +static void with_vf_config(vf_config_check_fn check)
> +{
> +	uint8_t config[PCI_EXT_CFG_SPACE_SIZE];
> +
> +	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, 1);
> +	igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +
> +	read_vf_config(config);
> +	check(config);
> +	igt_sriov_disable_vfs(pf_fd);

It seems that we don't need to enable/disable VF and read the config on 
every subtest. It should be sufficient to do it once in the fixture.

> +}
> +
> +static void check_vf_common_header(const uint8_t *config)
> +{
> +	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
> +	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
> +	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
> +	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
> +
> +	igt_info("Checking common header\n");
> +	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
> +	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
> +	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
> +				  PCI_COMMAND_INTX_DISABLE)),
> +		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
> +		     command);
> +	igt_assert_f(!(status & (PCI_STATUS_IMMEDIATE_READINESS | PCI_STATUS_INTERRUPT)),
> +		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
> +		     status);
> +	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
> +		     "Header Type: expected Header Layout 0, got 0x%02x\n",
> +		     config[PCI_HEADER_TYPE]);
> +	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_COMPLETION_CODE),
> +		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
> +}
> +
> +static void check_vf_bars(const uint8_t *config)
> +{
> +	igt_info("Checking VF BARs\n");

Not needed

> +	for (int bar = 0; bar < 6; bar++) {
> +		uint32_t value =
> +			igt_pci_config_raw_read_u32(config,
> +						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
> +		bool is_mem64 = !(value & PCI_BASE_ADDRESS_SPACE) &&
> +				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> +				PCI_BASE_ADDRESS_MEM_TYPE_64;
> +
> +		/* Only the address bits are hardwired to zero; type/attribute bits are static. */
> +		igt_assert_f(!(value & ~0xfu), "BAR%d: expected address 0x00000000, got 0x%08x\n",
> +			     bar, value);
> +
> +		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
> +		if (is_mem64) {
> +			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
> +						    (bar + 1) * sizeof(uint32_t);
> +			uint32_t upper =
> +				igt_pci_config_raw_read_u32(config, upper_offset);
> +
> +			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
> +				     bar + 1, upper);
> +			bar++;
> +		}
> +	}
> +}
> +
> +static int get_pcie_cap(const uint8_t *config)
> +{
> +	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
> +
> +	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
> +
> +	return pcie_cap;
> +}
> +
> +static void check_vf_pcie_capabilities(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
> +	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
> +	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
> +
> +	igt_info("Checking mandatory PCI Express capability\n");

Not needed

> +	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
> +		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
> +	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
> +		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
> +		     pcie_devcap);
> +	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
> +					  PCI_EXP_DEVSTA_EMERGENCY_PWR_REDUCED)),
> +		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
> +		     pcie_devsta);
> +	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
> +					 PCI_EXP_LNKSTA_LABS)),
> +		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
> +		     pcie_lnksta);
> +}
> +
> +static void check_vf_pcie_capabilities_2(const uint8_t *config)
> +{
> +	int pcie_cap = get_pcie_cap(config);
> +	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
> +	uint16_t lnksta2;
> +
> +	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
> +		skip_vf_test("PCI Express Capability Version 2 is not present");
> +
> +	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
> +	igt_info("Checking PCI Express Capability Version 2\n");
> +	igt_assert_f(!(lnksta2 & PCI_EXP_LNKSTA2_CUR_DEEMPHASIS),
> +		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
> +		     lnksta2);
> +}
> +
> +int igt_main()
> +{
> +	igt_fixture() {
> +		pf_fd = drm_open_driver(DRIVER_ANY);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_vfs_supported(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
> +	}
> +
> +	igt_describe("Validate the SR-IOV VF requirements for Vendor ID, Device ID, "
> +		     "Command, Status, Header Type, and BIST fields in the PCI common header");
> +	igt_subtest("vf-common-header") {
> +		with_vf_config(check_vf_common_header);
> +	}
> +
> +	igt_describe("Validate the SR-IOV VF requirement that BAR address bits are zero "
> +		     "while static BAR type and attribute bits remain valid");
> +	igt_subtest("vf-bars") {
> +		with_vf_config(check_vf_bars);
> +	}
> +
> +	igt_describe("Validate the SR-IOV VF requirements for FLR, Phantom Functions, "
> +		     "Auxiliary Power, Emergency Power Reduction, and PCIe link status fields");
> +	igt_subtest("vf-pcie-capabilities") {
> +		with_vf_config(check_vf_pcie_capabilities);
> +	}
> +
> +	igt_describe("Validate the RsvdZ requirement for Current De-emphasis Level in "
> +		     "Link Status 2 of PCI Express Capability Version 2 and later");
> +	igt_subtest("vf-pcie-capabilities-2") {
> +		with_vf_config(check_vf_pcie_capabilities_2);
> +	}
> +
> +	igt_fixture() {
> +		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)\n");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
> +		close(pf_fd);
> +	}
> +}
> +
