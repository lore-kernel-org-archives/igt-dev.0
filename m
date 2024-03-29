Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8426C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDE9112613;
	Fri, 29 Mar 2024 09:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOFVtHNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C65112613
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711704942; x=1743240942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4S66IX4Fs0WacUyHRH0gpN10nbrYKszWE3HAotcv328=;
 b=bOFVtHNZruP+VJTE/CS5wMSlY0wbsJMtz3RAqTFAFg3eqro/wSGThoFb
 Pu6Izp4vrsWeeb30sGLclMIjhE2nh9JLp/WIKHD32DFwf5sFhIb4MgMRx
 NH9DNPgs6d+UXQCvqHvhbB33TC8eJG3wbRBksceSl+cKP3qDMp+l5FK3m
 mTgMcqao6+95joinGR4lNwt91YRJeELHaU/7usNK3VgC+jmQ2LaQee4E8
 xmwzjblvfX/GqPgBC3CGDq/rL0AKmaBZnId7GvYL2VJs7gsQA5rNRe8j7
 N3FjlvmZZ917S3c3Hy48Z20mL7eqKf1nuHMrGD2IqvlZUL6GZ+UpmfIXQ A==;
X-CSE-ConnectionGUID: W4DoZhqBR0qTJQ4/wvdAZQ==
X-CSE-MsgGUID: VD8fT8kwT0edOnkvU9lb+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24343164"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="24343164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="17331888"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 02:35:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 02:35:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 02:35:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 02:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fz99QobRsdTPR4XJIa+XJofhAAYJwYNUaYBpr7qjthKhPkbo9Lfb41Glm11uiInFbiwlqNJpnR1lmZh/WsTjltiafVnL9wzMOPSf49aV3QFf7MaPUITMcejZJO4ADc0pMDS9kduEefnfr7Zn69y4KeruFttpuV7DX91zTGsY5TPfAHNt+xzwVQdajQNItHCBeZ0WopvEJxKA3Q1LlL4dDNmjRL+aGfv8RkGVRnJEHuLqpFoav8MwOC7yPEzsUzb1eTeG0/oKT4duyo7Sj273IUHypgBzeDUpj3p3QLeJhv4M5WbXlLIoqd/LoJuYXuspZ8Q0MKacPqsQWgCQA+QopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE7MAEaTWQjt0Yqx0UNzugIyZJ+CtzsthXDXjj6ax0k=;
 b=kPorC26WM2+4FcFhQHuQuPBfxup2HhuCk5AoSRgZuMW2o0X+9YS6sWkmodmOBIQFdO/mDaQbsCuyXi2MZLMZVUvH4R37GzV2AajAivmoGuNzCO6cJHsqFF57ZHSrgZ4sug176vocvrc3umAUoKToU47Prttli5BT2Gm+ygilwp7IUeUyesfvVEd0A3egzRKVeUXcAZ4BQ1JhHWyTa0AvboltOIGur8KdUponaWoHxgoXWMWdfUZ0s81OmN5KVh5JCHDYSPih9AtuS5+0LkuwwBiVwqaMEoDTfRmuvNXYhlXJR9cMDEwd37eYfVtWEWO46f5bPFD25yrt4ec5YgRxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 09:35:38 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 09:35:38 +0000
Message-ID: <0319a99a-171a-4215-a568-672ae4049a56@intel.com>
Date: Fri, 29 Mar 2024 10:35:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,2/2] lib/xe_mmio: Introduce Xe MMIO lib
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240326100921.3539141-3-piotr.piorkowski@intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240326100921.3539141-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA0PR11MB4559:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lfCoIgmHYP0C1c3eN2xSMAh1S91N1SfCJc8eima2zHd46SQn7dDmnZQQe/ZW8F/Br5anmowh5CMUA2OzBf+Byj1gZrHG5NZqs5cUZSSahliDAu+FpguI5a4fH7OCznA7+IloawJJc7EcqKoBM/SNSHEVtYi01Pt5HzXj7m//l1lyOiArVtj63uzcr/FC7YC65wmTedF87M2sYJqf8SwWb2U0gZCBClHT42wnlGlhY4KkBgE/vVoFeZTCCtOc0sr2a18SppFWqVFBuK56wYkiCd5emCWrB6wLEyLFDYvIFpd3J10e74NGcgbIXRymLcGCnz5jkV/Y1/MgdnaosH8hItU8y24y/l+v5xAk8K/U3KqeZjF0+gKcCwgqLlG3rS0w8MXixqLwDyfi38Whgx66Hh2864RCwPIF/s1PZ1jRKamdBJM8zDhne3ZdtPmtstPyMIjq9pPZYclIiP9jy4xTRHpXoOD2+UsZklZpQVXgLp22LwKma521P2StfElIpUZUL7kMCdBp3+OOF7SD1eUiyTDq6NVCvax1c9HKL3kicR6gPd+VAVEvRruIDNT4x0vzMy3CYDWYcFxJV30AuMjWwXax+Z+BxDgkl6uvxVug2wcLGZcVg2Wdjqt7UHhuX5E5Hl5/QHqgX2vFmIfqyxUhSYaRQiPfJlHqrrfnVl2Db5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dMMFVEZ01MUGxyWS9KbmJ0aGlHQ2tObCtrLzVWQ3htRWt2YVlTS3FTbnh6?=
 =?utf-8?B?WGdFQ2hDd1pyVjNETVN6RHFnOFNqTU1ySi95VGVNdWhDYkN3Q0Z3Vk5OWEZT?=
 =?utf-8?B?cFpocWxzQ2xHVGRIbno2UHhDTWZLR212ZDI2Vnd4Q0FZZFcwRGJqOGxtbXBY?=
 =?utf-8?B?ZTBjNFZRYlRpTTNVOGFnRTAyREh0ZTZBYjdWaCtQUXBZNHlZOGpkWUZDZTY1?=
 =?utf-8?B?L1BIYlJDOXBHZ2svdzdlTW1jejd2TXo5TXhTTDNMRTcwcFh1MG5USmtJeWJB?=
 =?utf-8?B?dGVxQnpDV3VjU1F6YkV5MHBFNUo4TW52ZWduei9lS3IrOVZGQXNsZUJpeWd6?=
 =?utf-8?B?SWNHdVlpc2hQSW9uUy9PaDEwdkE2bmZ4Ny9RaWE5Mkp6VlEyamdmdVVrd05j?=
 =?utf-8?B?TzVENTFTekdlNWExU0pFRENFZTNRVGhqSWtwckV2QVhXYkl3clB3WG5HZlJN?=
 =?utf-8?B?Ny81R0ZXdElRNVYwZXNtNkhlQVhpdG1RRzkzODE1N0NNVnVVL3ljangyYjBG?=
 =?utf-8?B?YU9rY1pFN240Z1ZkOC9nTEFkaHNVUFFlbldxREtPdG1hR0lZVll4cmVYN0k3?=
 =?utf-8?B?ZEpKb2VSZmhPMmpJQ0pQNDRIQVQ1cW45OFVOakRBTUo4WXIweTlFYjBzTi8z?=
 =?utf-8?B?UkUvSWE1dldnR1Vaajh6U0RFS0hRMUU0aHlqeFFrRGdXd1VncktYa09jVGN3?=
 =?utf-8?B?OTNualVmSDl4R2kyNzdBaVpnRHl2TUQ3OWpkWXhQQWlZdzhra2E2d0toSFRw?=
 =?utf-8?B?dFpIRzBSNXFnT3FrelI0MzJtNnVrcGp6QmRrU2VvU0pkY204aEpwdDNwZy9H?=
 =?utf-8?B?MEYwUUhpblhQdUROSGEvRzBiRStMbWdXWERDSWNJYmRVYVpCZHplQXIwVHVR?=
 =?utf-8?B?MUd6VE9KSEdEMkVNOUZQUkFvY0h5N1QrdnM5Nmcra2J2WnpRRTVpR3RtM3VX?=
 =?utf-8?B?N0Z4eWZPckc2dXFSMmgxUzQrY3JMeVgxdmpaYnlxOXZTRXZZa0QvR2RjVXpz?=
 =?utf-8?B?SmZKb3h4SGZaSUhSTE9ZRU8zSm5KcjAvcll0L2d2cklaeEZhMW9IakpPRjBZ?=
 =?utf-8?B?Q1JBWWlDWkp5TGNCTDY5dnBBNHJ2Q2pMN0Rsc0NyYzdnSVRxaGRsUnhTM1J6?=
 =?utf-8?B?UG9oTmVOQ2h2cUVDV2RqSkFEYnBudktYSXBZamtQdlNRcUZid2FNeitDTExW?=
 =?utf-8?B?aHZjbW01KzJrcVljU1MxYlV1cG80aHNHR2s3UHlMYmV6UkpjYlRLbUtxUlUy?=
 =?utf-8?B?T293aGNXOHNaU2twUkxMMDZjSFFUbG1QVnNlZG1TeFU2bERGTGpTTXZxU1Yx?=
 =?utf-8?B?NTV5Y0Q2RytFbWZaenVVMXRORzlqNEFjSlNXTE5hTmt5MDIxRG9SN3RrUGRx?=
 =?utf-8?B?bGtUTmMwRmIyeExycUt6elpGWjBwR0FoUnBYcFc5NUdnMTdJdEV4T2hOL01G?=
 =?utf-8?B?bXlzUjZHeEE0QmJ5K1I3UWRDRjZ6NE5xTVF2MDVTUTY2cGM2V3hBV0FiUHVy?=
 =?utf-8?B?T1RqM2lJUk9laEd3MVBad3RBdHZwb09FOFRIWm5VRnlTbG9CTCtqck9Ld3M2?=
 =?utf-8?B?VGJGeVkvcTlVS05aZlNFSDZhRnBPWW1MTmRwMDEzRzF2ZEkza3A1eW14MjhB?=
 =?utf-8?B?N1pILzlmOFNZSGhYUDB1RUpsWHpwSzRkcmJFbWdJRVZqSXJSMjdNbG4rYnMz?=
 =?utf-8?B?QkFjdnpBT0NZeHRlcjNFOTZjVGlSVFRBN09PWERMcm5xR3N4UE02aG0yNVEr?=
 =?utf-8?B?OVV1Lzc3T0lSYW1qQ2hSOGlxL0dDOTFBMVZEWVRqSHBqT0liSlpSWmk4U1pB?=
 =?utf-8?B?TU9DaDUzS1U4ZXhBQjBhMVM3dGpuUXZyeCsyR3gwWFRIbnU2N2drK2VwWlVK?=
 =?utf-8?B?aEF4ZlVRSXREdDNwbkJEV0Eva0hQRHVWTHNMTWZFRjhWWFlEdVFxOW92WU5h?=
 =?utf-8?B?KzQ4alFhQmNOYUxqTnE0U29RcXZNRkVoWVVhSUJnTW5VamtUWEJmV0UzVzBn?=
 =?utf-8?B?TlB5dmRZUHBwNWxZVUNzcUlBcm16WnQzU29jT0ZxSDVWZEZ3ZVVaQnhEWDBZ?=
 =?utf-8?B?TmxGdS9iOUJBVllyR3MybG10Nzl6N0k5T1lTa093aWJzUFVpbjdMN1UxbWR5?=
 =?utf-8?Q?D6YUYvC9iwT2RXgAfsN21MAOV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a6c30f-2c26-437c-50af-08dc4fd39797
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 09:35:38.1500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9hQuWskgiLIez3isqNBD/SRk2dLDw9ay4Y/w/GHMQdOlyb/93cWdVnVLX0s59S8iDSyWk9TBmeGg4RZKrSK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
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

On 3/26/2024 11:09, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Currently in IGT we have a library intel_mmio for simple MMIO operations
> on intel GPU devices, but it is limited only to accessing registers,
> has a lot of legacy code related to the i915 and offers no support for
> multi tile.
> Let's reuse the memory mapping from the previous library and add separate
> helpers, dedicated to Xe, for registers and GGTT access that support multi
> tile.
>
> v2:
>   - add missing std ifndef/define in header lib/xe_mmio.h
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/meson.build   |   1 +
>   lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_mmio.h  |  42 ++++++++++
>   lib/xe/xe_query.c |  19 +++++
>   lib/xe/xe_query.h |   1 +
>   5 files changed, 270 insertions(+)
>   create mode 100644 lib/xe/xe_mmio.c
>   create mode 100644 lib/xe/xe_mmio.h
>
> diff --git a/lib/meson.build b/lib/meson.build
> index a5651571b..e2f740c11 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -111,6 +111,7 @@ lib_sources = [
>   	'igt_dsc.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
> +	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
>   	'xe/xe_util.c',
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> new file mode 100644
> index 000000000..bd4227f25
> --- /dev/null
> +++ b/lib/xe/xe_mmio.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt_device.h"
> +
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * xe_mmio_vf_access_init:
> + * @pf_fd: xe device file descriptor
> + * @vf_id: PCI virtual function number (0 if native or PF itself)
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps the MMIO BAR owned by
> + * the specified virtual function associated with @pf_fd.
> + */
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
> +{
> +	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
> +
> +	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
> +
> +	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
> +
> +	igt_assert(!mmio->intel_mmio.igt_mmio);
> +
> +	mmio->fd = pf_fd;


no mmio->vf_id = ... ?


> +	mmio->intel_mmio.safe = false;
> +	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
> +}
> +
> +/**
> + * xe_mmio_access_init:
> + * @pf_fd: xe device file descriptor
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
> + */
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
> +{
> +	xe_mmio_vf_access_init(pf_fd, 0, mmio);
> +}
> +
> +/**
> + * xe_mmio_access_fini:
> + * @mmio: xe mmio structure for IO operations
> + *
> + * Clean up the mmio access helper initialized with
> + * xe_mmio_access_init()/xe_mmio_vf_access_init().
> + */
> +void xe_mmio_access_fini(struct xe_mmio *mmio)
> +{
> +	mmio->intel_mmio.pci_device_id = 0;


Hmm... maybe better to remove warn from intel_mmio_unmap_pci_bar() ? Is 
it really needed there?


> +	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> +	igt_pci_system_cleanup();
> +}
> +
> +/**
> + * xe_mmio_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + *
> + * 32-bit read of the register at @offset.


@reg / @offset inconsistency
s/@offset/@reg ?


> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg)
> +{
> +	return ioread32(mmio->intel_mmio.igt_mmio, reg);
> +}
> +
> +/**
> + * xe_mmio_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + *
> + * 64-bit read of the register at @offset.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg)
> +{
> +	return ioread64(mmio->intel_mmio.igt_mmio, reg);
> +}
> +
> +/**
> + * xe_mmio_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset.
> + */
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val)
> +{
> +	return iowrite32(mmio->intel_mmio.igt_mmio, reg, val);
> +}
> +
> +/**
> + * xe_mmio_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset.
> + */
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val)
> +{
> +	return iowrite64(mmio->intel_mmio.igt_mmio, reg, val);
> +}
> +
> +/**
> + * xe_mmio_gt_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset in tile to which @gt belongs
> + *
> + * 32-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg)
> +{
> +	return xe_mmio_read32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset in tile to which @gt belongs
> + *
> + * 64-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg)
> +{
> +	return xe_mmio_read64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val)
> +{
> +	return xe_mmio_write32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_gt_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val)
> +{
> +	return xe_mmio_write64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_ggtt_read:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + *
> + * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> +{
> +	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> +}
> +
> +/**
> + * xe_mmio_ggtt_write:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @pte: PTE value to write
> + *
> + * Write PTE value at GGTT @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> +{
> +	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> +}
> diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> new file mode 100644
> index 000000000..96bba6e16
> --- /dev/null
> +++ b/lib/xe/xe_mmio.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "lib/intel_io.h"
> +#include "lib/igt_sizes.h"
> +
> +#ifndef XE_MMIO_H
> +#define XE_MMIO_H
> +
> +#define TILE_MMIO_SIZE		SZ_16M
> +#define GGTT_OFFSET_IN_TILE	SZ_8M
> +
> +typedef uint64_t xe_ggtt_pte_t;
> +
> +struct xe_mmio {
> +	int fd;
> +	unsigned int vf_id;
> +	struct intel_mmio_data intel_mmio;
> +};
> +
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
> +void xe_mmio_access_fini(struct xe_mmio *mmio);
> +
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg);
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg);
> +
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val);
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val);
> +
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg);
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg);
> +
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val);
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val);
> +
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +
> +#endif	/* XE_MMIO_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 53a2b4386..c885e3a79 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
>   	return false;
>   }
>   
> +/**
> + * xe_gt_to_tile_id:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns tile id for given @gt.
> + */
> +int xe_gt_get_tile_id(int fd, int gt)


uint16_t xe_gt_get_tile_id(...)


> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +
> +	igt_assert(xe_dev);
> +	igt_assert(gt < xe_number_gt(fd));
> +
> +	return xe_dev->gt_list->gt_list[gt].tile_id;
> +}
> +
>   igt_constructor
>   {
>   	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 82af2706d..b1b3a989e 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
>   bool xe_has_engine_class(int fd, uint16_t engine_class);
>   bool xe_has_media_gt(int fd);
>   bool xe_is_media_gt(int fd, int gt);
> +int xe_gt_get_tile_id(int fd, int gt);
>   
>   struct xe_device *xe_device_get(int fd);
>   void xe_device_put(int fd);
