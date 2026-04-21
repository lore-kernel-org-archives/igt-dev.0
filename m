Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D63F5A8D3
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 03:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411DB10E763;
	Tue, 21 Apr 2026 03:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpG0ABYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37D10E763
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 03:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776742102; x=1808278102;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SE9Y5ROziBqaqbHF1fqCweNjqKwiZbpV434gg0ACAbo=;
 b=QpG0ABYSxX7o42TEnQFh9Ms1VLMpO/4qM2RbUPGN1dIvOrIWyHlDuf/r
 pLDogfoMMsxKTIzJQtTBx4t1cwCSYQKYIkFGBclXWNXx10KF5kIhKEiC5
 t9N1HDarNcFdY7zjybCdaPqCeWhoV+q6r+4pZ5jFM4O+4AZzG+ql+0m6k
 Wyu024OD1W/fLLgTDIFXnhGSzVEIZqAYMpNz0g8FQ0CraEslpOMKBpnKr
 dWG3TSspLZJvC6UuPCgpN1c9h0eHJMP1lEM/U9fIIM5XA+uZ3NkYckTW/
 th9wiOsAj/UNWkh8SXALkH9Q1Nz8nAtkYojnDAyqNnPunnLUGt7jg6AzX Q==;
X-CSE-ConnectionGUID: rtGJNJEBQXKEOLO9nbHZSQ==
X-CSE-MsgGUID: lgpUsM3AQ7iubHXAWWaRxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88287540"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="88287540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 20:28:21 -0700
X-CSE-ConnectionGUID: MIz6rBEURpS5qvJ8/aknKg==
X-CSE-MsgGUID: unUD+kzuSduwRd7kTMUiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="255176414"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 20:28:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 20:28:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 20:28:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 20:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFmv7Aj0tJ8FihJbzMhJQ2W45JfXxhjIuIzzNcbtMvBi6ouXA6mYnu75SiQ0nKFwiJtFFXdTqgfESA2v1JjvG/xbKryZGKrDeSmG2LpZS4EMREGKhc4L3Rb0RG/zq6288WZ5vcMm0dkVQBpr27rYIRO+SOpg2Wp66HudStbB5o7rhA0MjFpz4mYCG9m45EXo2NR/8cpCrHMd9QzYWZ230QrGQHMeK19Q/iZrBfR+fnP1vYxe6bN348KEPG+n1+sYLEtkcxDHoT9QZl537cffPL7GgdELkePLv4K+ukvqJl6DckZOaxfYpOXjAsd07mZNInkYJci25w5VOEQotoL/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ozB6TvVTMEogTliPNrDAiKYcjbIYII3yOfcDMVxL3o=;
 b=muWpwekgh8sex+65NEevX2ikhxOqHkE9/XpVyiOiKJRSKdrEU0StbKF726i5S4yq1Qzkfx4N7FfBp8Q99V+RnWf8tAzz3DSjbaibyxNjy0nc29tblwaTQSvGcZ1z9uGaxfeAp/O3qs11n6iAuF2+GadnxhZsQMSJr4yaEtnrf3yvPNZsk4epe2IIpKU1d6FB0SAHrZ4y6O9oRLLg2V3YH6VMj0npL5zGnnqVvkbujktxi5QhfhB+alWxpL9AQ0c3ixd+IUqvuNPj3d0spCqPQ1opJt1Yv+EuQppqIqy0STs0zMJJsuFGsM3WVseqxGq5vPbCBrtTp7QMfF4pLSq3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LVUPR11MB9858.namprd11.prod.outlook.com (2603:10b6:408:38b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 03:28:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:28:10 +0000
Message-ID: <409b4955-27be-4be4-9740-2f5f3f0582a1@intel.com>
Date: Tue, 21 Apr 2026 08:58:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pwrite_crc: Create basic subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260420150753.96250-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260420150753.96250-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0277.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LVUPR11MB9858:EE_
X-MS-Office365-Filtering-Correlation-Id: 5705b686-1dbb-472e-3637-08de9f560274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VzyrHxtiTf4mn4iPIUGBr6ud4CD6zgo9hTS4T2AVW6O3TAXFun6eiC2JQTIguQaSWT5OOLO8/234lsch9MP3OrhYmemrfy6PhniYIsetm8JkoPgUVWo5Pq1Z5WBDztW4MGCHQsFtAYBci0qkMYOaRT+paDf+vE5SY0ryiAv6RxN2HhPtvc7uIvuh2aNxpeo1J8NpvssNiNc4VHpUut+0a8mNrFTJ4kYCeaUgzWn31W+EjQmL0vMrXrcz+cDrjfKZY69eMPLw4ycxhl8vqafdHPZvne/Umu5ljAS1hEZyBHD3eqxi4c6A76gGX+9IsNGvKu2HPVIEOKlubEsRyk+Xqhd84h1cxNPsqDjCIbUrUFPtPhxABW3xb3l8w9hgZTakJ+SPAwkPiJPc2Kx8pL/a9KfowDImxX8Szrv/7ej27VaK2iEbQ5YGx80QNP6tvf1XgPbmSKp3gm8lZw2Zl54GpUMJVGWizdTeGz9Wu9C1LsRLFN9lvlo7iV6bjyFwY8QBWCqvHTgopqOXUiQPk1Pc9qRWhYbxUIAnH9zwf6Xds3T+oLG32VFDmRoq3mPs0/l4uHflgCh6hkW/NcfrEjzkQPXhaVTe7JYP1OuGC3F35A8WNPL95VqCp6pb3x/UFmRhMacs8Z27oXUu2/8jxBC9B/EzSt2dXKFbNSY/2Y0bYaDC5bFXdOJskarc0ao222YZwBwIwajnjh2FZOZpNgu5PPqcYzIKQcro3KruVuysEFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3FSN1dqZzM4RUVuRFNVdWhQb1Vxb08zbk5iUndnamFycGpGaUpDdG0wU1ow?=
 =?utf-8?B?b096aGxJd2oxN3hkMjB4cXJwakhZNEpIYWorSWJPNFJYcjM4VVBXcGI3OTBp?=
 =?utf-8?B?NHhjMXdTTjZDdDFkZzlHRnRLOEpoWEJWelZGcHgrQnhlQ3Z4aWZJMTZZdUNW?=
 =?utf-8?B?ZUk5VHozVHFkUDZsa0trUjcrT1Y0aTlyQUMrVWVubUZTTkhmbTRCbFVLY0Qx?=
 =?utf-8?B?QmN1RE9pWHhvQmNSWHF5OWx1Y3QyTzVPYS8wY3hRM01pZWdGd1RYNjFsejhw?=
 =?utf-8?B?M2xHQmJXUVFleFRhbk41OSswcmQ4RWRicjNDWW5PRytrajh4TXVEUmp4Sm8w?=
 =?utf-8?B?TythMEh3MW9wZzMwTk0zRVg0WktqOHl6UG9VZ3FLYXVaa3JQWjRuc0xnTXVP?=
 =?utf-8?B?WUtaM2Z1R09QcndwV1VqeEtzUHpKVjIvWC9EMTl4Mys1Nk9vbThqZE9aWnNH?=
 =?utf-8?B?cjNuK1h0RnJ6L2pHMTZqVmszS3J4di9DMGRQaytKNzRocDR2Z01QWHpuL3Bp?=
 =?utf-8?B?QnNXb0FGdkZRVEx0ZzlMS0dGeHB6Q3k3cUdFMmNKNHlVcnRXb1FPczArMEJU?=
 =?utf-8?B?Vnk5VG9MWnhFdDlBbUREblJPY3NFWFBtdWRsR2pnbkhuYldVZFZiSC9ZNTMy?=
 =?utf-8?B?M1RVUWcvZE5NZW5KTDhzMVVSNG5TUDV4eUtzWjcyTFAxQTFwL0R1T3lhV0dn?=
 =?utf-8?B?VHdJL0xZL0FGYTkxT1kwODhFNFI2MHZMdHlpa1pXbElXaThscVVadi9CQTYy?=
 =?utf-8?B?VHRsUlliSzdVQyt1OVNscHpVMGU0QitWelRMdE9VTjY4L3pUWjhSaE1WaUZw?=
 =?utf-8?B?QWVYUjhuOU5FMElQOVdaS05kQ0loSVdoNUZLZ3NLUVhxcmlMUys5SDFCU0pl?=
 =?utf-8?B?TXZOQjVTTEdvMFBDRy8ya05xWEY3eHdLeklBd0JOaVgva21xcFBHVnRxTUtH?=
 =?utf-8?B?TDNKc1JDZVhmVjRWTWtHT2gzY3ZzM2R5UmoySHVXVUpsSzhnUDJoM2JrTURs?=
 =?utf-8?B?WnBLYVdhUFA4RHhmamxySXFweUtvdGlMajArU3lXa0VMeFYwT1RtR0FvUU5P?=
 =?utf-8?B?ZlZka2Jid2JHNWNRbVEwdDRKb0pGV1prM1d3V3RiaEF4cHdjUXFlQ3k4czc2?=
 =?utf-8?B?YVl6TVlFV1BSSitza3lTU3EvNzRyZXZzbTdzMHpudEt2Sk53dE4wLzN3Rkt5?=
 =?utf-8?B?K2dHVjVxbGhwYkZxOUhnK1M4RkVRNW8xZTVGd3VsSlBRVEFZWm9oYkQ5VVps?=
 =?utf-8?B?QjBUU3ZPczJMRURZcmREN3IwZTdwRjQ5YkVOekFpTHRqcG1LdVVBZFBjb0dy?=
 =?utf-8?B?SGlEcWhUcXVjM20yejNSaFEzeGZMTHNjbzFRQlJ4UktreW4yY002U1Nvd2ho?=
 =?utf-8?B?MTBDaGY4QlVxNExUMXE5ZEhVNzg0MDlWdjZocVpxbFROM2FrdExGbEp0MWhO?=
 =?utf-8?B?Y29JRGFKU1pUMGdZajFQQUdpK21tcVF2NFlBcVdZV0RFUkVDZHNQaGdSSmJq?=
 =?utf-8?B?ejB1ZEFuRTd4QnMwd3JzWmEyQTl4UnF3Zlh2RE0rZnltRXhrMzZUYU1jWmE2?=
 =?utf-8?B?TW55UnJRS1lpQmZ0VDNycFpTRTluUFRRamY5UFcraGpPYk9VQWJwZXpnbWM3?=
 =?utf-8?B?dXJVaVp6TTk3b2NsSXAwaTc1L2R2UnZ1NHZDdnAzYjFoUXpWNGZjTk5VNXF5?=
 =?utf-8?B?M3d0UjE5cnhPNzZ3cXFCa3RNWENkalpXU0ZiS3lTRVRnc2lISkNoVEI2N0JH?=
 =?utf-8?B?M01yYzhrdHlaL2ZUbFFiTWlJNGlrT29xWkpPK24yQzUrRHNSdURybTg0dS9S?=
 =?utf-8?B?cTh4VzBJU0xrSmRKZTVlNnFSY3BiNW1qaks0WUlRVXdOd1FaazlVTVhuVnV2?=
 =?utf-8?B?Q2xqTzUwTG9JMlRlQllZWllBZTlLN2FUUlFoSm9GaDBFNnQ1YVNkWUNWdTE0?=
 =?utf-8?B?TFhrZ1EyaFNPNXB0K0VPQ0ExVS9FVFJzdU92K1dIOTg2R2xhS1JPakJuUHdK?=
 =?utf-8?B?eGxDbDVkL011K05ZNkZmOXhmNVhhQ0ErWEd5TWVBQk1lYWFkbXE5TWZaOFdU?=
 =?utf-8?B?TEVwZHhTOTl3MXNVNmtXNHZHNDRnZzRYWXIrMGhnVFpHQ2FZNlI4SytEZzhZ?=
 =?utf-8?B?SjcrSzFGb3IxbThqaXZmczlEUHE4RjZtMTk0T2RJUzg2V3JMT2Q1QTY3Sldh?=
 =?utf-8?B?c2FBKzNmN1VZWVhRZVhMWW9SOWRSSXFKWlV5bU9ieUFNdG95RjBnVzROUXBi?=
 =?utf-8?B?VEtWOFdaNjN2bDZxMDZWRldqVTRZL2VadWgzdkhDWVdJUVhCRm9QN1VDdmRw?=
 =?utf-8?B?c1djcFBLRW1kaWVjWjlYeHNTNWFDSE1nNXF0S2VaRXVpajlaVWV1UT09?=
X-Exchange-RoutingPolicyChecked: iEWMsaUWHaFPIU8Uf8gaj+mvmhdBDk+6FX6LL9F0HpZzP+aa08Rz/8Vwn1c5abgEN3xYL6/18PD1vQjRC0pKUsJckBkN/pBdOTV+QgShSDxFrYM6bQT8TRsgpiNCv+VAgan5CANtIZNDj2c3/zRtvQXmt7aW0dmwfoHx9bY58urF0AlR/yxh7n/ARVEBVvIX9hMSpDtND8uQ1Bsewk5Zy18gp7pCUBsaBKiNz2Xp7VaYCNnHC/CtXDoP5+W5wvsYqJIt34Rj1tGbXHpXGbRYQ+BURIkuLG+GsfnooGh6btEEll7V6AfCpKMdTRWVJBJfwrQNwzVjczDrpWDEPWqbxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5705b686-1dbb-472e-3637-08de9f560274
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:28:10.6753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/LIyVlRw9sYf1frMnIRlmR1D/o/+UjuR8eUg9RSBUaV6h4h0+FwnRwoz6AK1yExWT5Kri8OdfjcJTJBjLYBjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9858
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

Hi Kamil,

On 4/20/2026 8:37 PM, Kamil Konieczny wrote:
> Create a basic subtests which allows to properly cleanup after
> any failure or a skip. Also while at this, move an igt header
> to proper place.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/kms_pwrite_crc.c | 39 +++++++++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index bd536007c..92f5292dd 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -30,15 +30,16 @@
>    * Mega feature: General Display Features
>    */
>   
> -#include "igt.h"
>   #include <errno.h>
>   #include <limits.h>
>   #include <stdbool.h>
>   #include <stdio.h>
>   #include <string.h>
>   
> +#include "igt.h"
> +
>   /**
> - * SUBTEST:
> + * SUBTEST: basic
>    * Description: Use the display CRC support to validate pwrite to an already
>    *              uncached future scanout buffer.
>    */
> @@ -192,22 +193,32 @@ static void run_test(data_t *data)
>   	igt_skip("no valid crtc/connector combinations found\n");
>   }
>   
> -static data_t data;
> +static data_t data = { };
>   
> -int igt_simple_main()
> +int igt_main()
>   {
> -	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> -	kmstest_set_vt_graphics_mode();
> +	igt_fixture() {
> +		data.drm_fd = -1;

This is redundant with the next line?

> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		kmstest_set_vt_graphics_mode();
>   
> -	igt_display_require(&data.display, data.drm_fd);
> -	igt_display_require_output(&data.display);
> -	igt_require_pipe_crc(data.drm_fd);
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require_pipe_crc(data.drm_fd);
>   
> -	data.devid = intel_get_drm_devid(data.drm_fd);
> -	data.pipe_crc = NULL;
> +		data.devid = intel_get_drm_devid(data.drm_fd);
> +		data.pipe_crc = NULL;
> +	}
>   
> -	run_test(&data);
> +	igt_describe("Use the display CRC support to validate pwrite "
> +		     "to an already uncached future scanout buffer.");
> +	igt_subtest("basic")
> +		run_test(&data);
>   
> -	igt_display_fini(&data.display);
> -	drm_close_driver(data.drm_fd);
> +	igt_fixture() {
> +		if (data.drm_fd != -1) {

Similar redundancy here? If drm_fd = -1, the test will be skipped in the 
first fixture itself and this check is not needed?

With these removed the patch LGTM,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +			igt_display_fini(&data.display);
> +			drm_close_driver(data.drm_fd);
> +		}
> +	}
>   }
