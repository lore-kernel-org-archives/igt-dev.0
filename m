Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A4AC48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 09:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EC910E115;
	Mon, 19 Feb 2024 09:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkBM4UM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756C510E115
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708333294; x=1739869294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fT7TEpiSYEG6qlC2EWyKgos2xqK+d9C2ha7tOyWNcTQ=;
 b=GkBM4UM0wZ8lt3gDVN3vP6lTA4upY2TXxWBr+Mf/Uz6k1dVLfbWm1WfO
 lfwCdqMMRlp1tyyofgm/nIrNvuEa76jcz0h7+Kd2GpqvjzGRYMIYZgGg0
 QmRwetnhKOHH+BDiYyfj7/pLZ3+8VRBK7LwlhbIlNh8kfN3S3wLzhJa/Y
 n6/Sg3A5+l9zvTSM0bqevvQSwz+R6uUvfnAd8zFPlFecHQ3Hu5yGihHsq
 LUAhapWKOa6oY3Zxb4P0SeG3R8m4u2dSz90i/hEIEwlT56VFqglHwiDCU
 xjSxdxp4IsmQUk9fhQp5BP4qsoq7gn13bMe4kiQ2H9aTzEuDFER/PmGi9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2543933"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2543933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 01:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4691335"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 01:01:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 01:01:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 01:01:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 01:01:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 01:01:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKjkZTrT6Wu6bKlTDhxcgkiNQPZlnLWD1jhhW7APRMwkzwCRcXbJYBmqPk9nh9JSpZcWb4czcmv6aiXW4V1jtyeCDFKEo3Di3rjbAkBHOFxokblfB/8D6jLvQODQMu9gXQMml316Cmu06owcz4eoBbl/W24ghjmdcNDAdo3nbul08IUw2RaPTTLf9SHd5lYOuiooKrIzpBCZbBu85DA9hbG/HYRMWrDzERirVuXzf2DbCBekA8hLdjSKopFGdryVIOgIbFXSbEkbaLf0+6fpTw6xUixUcWcQrBcjZw71Oo8r4zw8uoUMKcf5G3XQfezx4nOQjtznTvLz3thP50SVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAHwqZDNo9QCz3YqKZeidb6EqYBjtn6dBCO5xpLM1rI=;
 b=EbyoFGPdAQRTUQUDxEZtM2NvTk38zF3Lf5DwWfDV3PftnvL+pezf41tfsyANANdero1zFMmyyj9XaRZhvIfbMIb7LYSAHJvtqbUt0+fbhGHmewrsUKNwAj0+2Cci5cBchcs5ej2oFEPlVc94yfdOT26OsOhU+LhhWSQa5YHhdRJ3ZJxKx7V1MPNMn25HgJ0j/DIsxJH4VA6UQcLtWisMHuzj6YpyFpC6h0UAGR+6Ax8UuIrJrZuztjhFqEozGnBzsnza1X3XDTCoqQf867Um072V6D4h704n3580P8JRIdqysn2s1VW4etDFJSoJOOQ/oiDi/DuFRE5dhI1VzfU09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Mon, 19 Feb
 2024 09:01:23 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 09:01:23 +0000
Message-ID: <678bbfb1-6bcb-458a-bffa-cb871ffa15c5@intel.com>
Date: Mon, 19 Feb 2024 14:31:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
 <20240218091704.2259937-3-kunal1.joshi@intel.com>
 <18efe76c653963719a02755b432e754c9daad723.camel@intel.com>
 <53d147f8-eba2-4030-a506-bb7fffd65eaf@intel.com>
 <d1811ba1ce0f1f5a80be4f273464a5296fc24c9b.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <d1811ba1ce0f1f5a80be4f273464a5296fc24c9b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::31) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: 516535a9-2e76-4f7c-46ee-08dc312958de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IAaxI1OyTv1qi/nXfRuhSQQUqI6hoGe/ZHi8YAjpQeCqX3AaD3xJO4CrFjXY4iwkwuq3kzFN7hj70X7lCbliQQY3eMliiXDVawx5ic1uAmcI46ZXbFpqYg6sxz36oCvpxLHbXRBPzMeiqIAnCXNS0dz75AMuy/0E7tdNAl+dfAH0XYx3cSRk8HRPwqt6yrMK/oilui6cI9P0lG4CLNit2b6Oa/h8wfrUx+CDCWK2DaAyetRKpy6iJ8amrd6b01tqDyFFIueTVw8fHRAg/Hkw+17i9crSUbykkXvOwLlUK/7im4818KPlC2DBjkAEddOyfm7rXDWeoUot5dM7FZM4teikthyiSJgZk/i1vt9yISb93dtqD2BH54v1qOx9JuAKfPqLnMTourDeHsooQRqbWiCjr5vTWzbHsARViPEghtAcAk+1s9F2XiDUmFwsRAvW/2SXfPYAJ9BJiVfLntszoWuWNO3VfWk9oSEErCodRF0qc0rdeSJulp/4ErzuDeSCdjHiXKxc1oc9NNL3OxHTPnL6kW3GqFnU2guPLQW3QU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(15650500001)(82960400001)(83380400001)(6506007)(53546011)(478600001)(966005)(6486002)(6512007)(110136005)(54906003)(6666004)(66574015)(26005)(36756003)(2616005)(107886003)(4326008)(8676002)(8936002)(31696002)(86362001)(66556008)(66476007)(66946007)(41300700001)(316002)(38100700002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU02MU8vQWVlM21SMkhvSTJHbGw2ZkEwNEQ0Si9lbFJOTXJKemI4THo0SGY0?=
 =?utf-8?B?RjBxUU9YV01PZzZiVmpPNkphNHhhdkc0aU5zY1dBdERFQmpLcFVxSFlrTXgv?=
 =?utf-8?B?RWhrTzQ2NnZrQ3Y0emx0Sk9iQXFweGRxTXA0N3BDaXREclY5cGFEY2xIYkdo?=
 =?utf-8?B?ODZWWk1SSE85NkNIV3hsVlJmZXJUZkdHSlpVVDZQdVNZd2g5QWFPWjVwaS9E?=
 =?utf-8?B?TW1qMWNySnJlVEVnWDJ6Q0NPU0FoazNTRkVWc1c4ZWVSclJjUHdKbDg5czhP?=
 =?utf-8?B?bE52cE4zTWpIb1drbjZScTQ0Y09wWXhtRjg3eUIrc204MWN0eElJdytSeHRD?=
 =?utf-8?B?RkNMREhKOG9HQ2lYODBmVFRJWFRiQXFLVzRuU3drUzlhd1VDK0h4NkpaRXZJ?=
 =?utf-8?B?bFpDeTVJNlFscW9SaVc0WG9aMVE5MmppMG12N3JCR3N0NjdSczhrT2d1Q2JX?=
 =?utf-8?B?VlRtenJ4Zmp0a09idU9VdkRlams1VWhwRXRDV3RzWjZYWEZPdFhoaVdEdXhY?=
 =?utf-8?B?TGtIMkZLeEMwTjg4SHRGRWJtVjlucTZWTEdOblZqYXRzM0Q2NjFIaDdYNFJ2?=
 =?utf-8?B?Y0FGVzdWYXhHcnRBbFBEaGlydXA3ZXU4VktxTW5peUgyWUw5bUg1U3laTnVn?=
 =?utf-8?B?MWMvd1FLNnN2MHZUcDZidlY5V0k0eWR1ZmFsNnlWeUhPVGI5Z0tnS2wvalpJ?=
 =?utf-8?B?MDRMcnZUS3lZVFpXdklpNmV3dlgwSkZkM2IyV2VXTXJTUlpRUGRneFJLdys0?=
 =?utf-8?B?OWZsMVduSUcxMWc2Mm1ZeDBnT293VU03UFNxUlNTUFR5a1pUS3p4NG5PTUVG?=
 =?utf-8?B?WnVjZVY0eFhZV21mMXI4YnNDOFRyaW5NZll6SC91cy9EQWJZbTQ3S0lLbWlr?=
 =?utf-8?B?YTA5Q08rVE1wcWwwcUpxb2JoYXZDMm5oRG1iMW5aOGNMTURsKzhzcXNUcnll?=
 =?utf-8?B?Z2FNa1dPaEZRNGF2SnF1VUJPNG5jcTBGSlJBeERQMUN5RnJxcUh6UFE3T2kv?=
 =?utf-8?B?QXh6WkpZNGNybHU0UGM1M1lqdFE0bU9QR1d4VzJDM29lOGNoRWJJTU9ac2F0?=
 =?utf-8?B?S3U4aC93U1FJM1JjQUZkVnpUa1QxMDZSRWsvQkZxZ3Voa3B6Sk5LSUNqMEJk?=
 =?utf-8?B?bW9Eck9KY3ZLNXBSQUZnME1wNXhQVzBENTBiNG9KeXdnMno1NkR0NTZVdzdT?=
 =?utf-8?B?OGpBVjB4M00zZmIvRnk1OEQ4UllhcEtlblo5cHltajQzRENSVDkxdXc4Tmlx?=
 =?utf-8?B?SXFUL2RtYUlnWTZ0OWVtRVRjVkVhY2cwWkdJc2Q5WnpkUXdsaXIwV2ZPaDJs?=
 =?utf-8?B?dVFhOUVhcHRHWStMSTE5cXcwZEhnUnBHZW52OEFrWS92M0FpWUNlblkrSHV1?=
 =?utf-8?B?RVNCMVdyd1pCeEJRT2VMNG5BVkRjOXhJNDk4L1dXVHBJN2ZZNUNvRjFwY3dn?=
 =?utf-8?B?b1FKRkVOa3U2Q1BSZ0FzM0dYeGFBZ2RsNmhMLyt4QjFPTlZmdmF4Q3lJdUZJ?=
 =?utf-8?B?blNCQUV4R1p1TFliNVNNMGVxQUN2N1pjQXFjZ0VucnpNV1Nka24weXFVcG92?=
 =?utf-8?B?aWtTVlVvQTZCYlVsaG5kT09JTUVlWmQzaGdvTzJKcU5ZNi9neGtOMGtKVWlE?=
 =?utf-8?B?OVJsdGZMRlk5NVlSbDI5VVJiV01oOGtTU2dpbkZ4TFFaVkVxN0FrV1Z6T2w5?=
 =?utf-8?B?YUFPQzRqbU9QUFVyVEh2c3UvWmhvZGxxUE5tZ3NSQnpwcHAzOUlQbmd1a2hN?=
 =?utf-8?B?UXR4VEtvbndza3dmTjZISFQrL1A5UTg3aitUdTg5QXI4Rmw3MUYvQStZVXNP?=
 =?utf-8?B?M1I2ZWkrdzNKNU9kenRQUWR6T1kwcDJQWkk3VStEZ3NGUUhQd28yZUtUa1lB?=
 =?utf-8?B?VElkWkZ2dXlOQkV1VGVvZGh4Nk4vWWZVUEd1TEFKK0duNFh3L0swMmx1YXp0?=
 =?utf-8?B?QldGSzNxSVV1NEp6Sk16Lzl1eUVkZ0UzRjlTeldCYUpjY1NCVlFlUlpnVDVn?=
 =?utf-8?B?TlV6UHlNemowQmZnbW5qUWtCamtGaUE4V0pBRThaMnF5aVdiWlpDamdxMHpL?=
 =?utf-8?B?VDFQcFdlQ1ovWUs4RkNVcFFkNVJFeVJBbVBKK1JhbEhKR1FBRGtodHVVSW1N?=
 =?utf-8?B?bUQwSXlnOUtTNTM0N3pGUXN1S3o1MXVqdTdtdElBcjF0S2x4MTBubWtJNjRk?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 516535a9-2e76-4f7c-46ee-08dc312958de
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 09:01:23.5195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Kg2H/5VpVzsso0RZZraCH91kUjAktGZHZVff2lZK5H+n3tC4LrUdNOF6Vt7KAKzGypVgJLUOZJ4uXTLbl8UYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
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

Hello Jouni,

On 2/19/2024 2:26 PM, Hogander, Jouni wrote:
> On Mon, 2024-02-19 at 13:42 +0530, Joshi, Kunal1 wrote:
>> Hello Jouni,
>>
>> On 2/19/2024 1:30 PM, Hogander, Jouni wrote:
>>> On Sun, 2024-02-18 at 14:47 +0530, Kunal Joshi wrote:
>>>> Extend the tests to cover panel replay selective fetch feature.
>>>>
>>>>   From kms_psr2_sf test point of view we have
>>>> check_pr_psr2_sel_fetch_support
>>>> function to check if PR/PSR2 selective fetch is supported for an
>>>> output
>>>> if output supports selective fetch then we check we enter
>>>> DEEP_SLEEP
>>>> mode
>>>> in run function
>>>>
>>>> v2: fixed dynamic test name
>>>> v3: use check_psr2_support (Jouni)
>>>> v4: split patches (Jouni)
>>>>
>>>> Cc: Jouni Högander <jouni.hogander@intel.com>
>>>> Cc: Animesh Manna <animesh.manna@intel.com>
>>>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>> ---
>>>>    lib/igt_psr.c             | 36 ++++++++++++++++++++++++++------
>>>> ----
>>>>    lib/igt_psr.h             |  6 +++---
>>>>    tests/kms_cursor_legacy.c |  4 ++--
>>>>    3 files changed, 31 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>>>> index cad8cce05..9accd2047 100644
>>>> --- a/lib/igt_psr.c
>>>> +++ b/lib/igt_psr.c
>>>> @@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
>>>>           return strstr(buf, "PSR mode: disabled\n");
>>>>    }
>>>>    
>>>> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output)
>>>> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>>>>    {
>>>>           char buf[PSR_STATUS_MAX_LEN];
>>>>           char debugfs_file[128] = {0};
>>>> @@ -248,7 +248,9 @@ bool psr_sink_support(int device, int
>>>> debugfs_fd,
>>>> enum psr_mode mode, igt_output
>>>>                          (strstr(line, "PSR = yes") &&
>>>>                          (strstr(line, "[0x03]") || strstr(line,
>>>> "[0x04]")));
>>>>           case PR_MODE:
>>>> -               return strstr(line, "Panel Replay = yes");
>>>> +               return strstr(line, "Panel Replay = yes, Panel
>>>> Replay
>>>> Selective Update = no");
>>>> +       case PR_MODE_SEL_FETCH:
>>>> +               return strstr(line, "Panel Replay = yes, Panel
>>>> Replay
>>>> Selective Update = yes");
>>>>           default:
>>>>                   igt_assert_f(false, "Invalid psr mode\n");
>>>>                   return false;
>>>> @@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int
>>>> drm_fd,
>>>> igt_output_t *output)
>>>>                   return false;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       ret = psr2_selective_fetch_check(debugfs_fd, output);
>>>> +       ret = selective_fetch_check(debugfs_fd, output);
>>>>           close(debugfs_fd);
>>>>    
>>>>           return ret;
>>>> @@ -334,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int
>>>> drm_fd, igt_output_t *output)
>>>>     * Returns:
>>>>     * True if PSR mode changed to PSR1, false otherwise.
>>>>     */
>>>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
>>>> *output)
>>>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           int debugfs_fd;
>>>>           bool ret = false;
>>>> +       enum psr_mode mode;
>>>>    
>>>>           if (!is_intel_device(drm_fd))
>>>>                   return ret;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       if (psr2_selective_fetch_check(debugfs_fd, output)) {
>>>> -               psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
>>>> +       if (selective_fetch_check(debugfs_fd, output)) {
>>>> +               mode = psr_get_mode(debugfs_fd, output);
>>>> +               if (mode == PR_MODE_SEL_FETCH)
>>>> +                       psr_set(drm_fd, debugfs_fd, PR_MODE,
>>>> output);
>>>> +               else if (mode == PSR_MODE_2_SEL_FETCH)
>>>> +                       psr_set(drm_fd, debugfs_fd, PSR_MODE_1,
>>>> output);
>>>> +               else
>>>> +                       igt_assert("switch not possible from
>>>> current
>>>> psr mode\n");
>>> There is no need to change this function.
>>> psr2_selective_fetch_check
>>> (now selective_fetch_check) works for PR and PSR.
>>>
>>> BR,
>>>
>>> Jouni Högander
>> Have modified selective_fetch_check to check for a particular output,
>>
>> bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>> {
>>           char buf[PSR_STATUS_MAX_LEN];
>>           char debugfs_file[128] = {0};
>>
>>           SET_DEBUGFS_PATH(output, debugfs_file);
>>           igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>                                   sizeof(buf));
>>
>>           return strstr(buf, "PSR2 selective fetch: enabled");
>> }
>>
>> Will this be not required?
> No it has to support providing ouput as parameter. My point is that
>
> selective_fetch_check works for PR as well. and:
>
> psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
>
> Will switch to Panel Replay Full Frame update for Panel Replay and PSR1
> for PSR. If we ever need to take into account panel supporting both I
> think we should do that by adding disable flag for Panel Replay
> instead of setting the mode. See:
>
>   https://patchwork.freedesktop.org/series/128193/
>
> and specifically:
>
> https://patchwork.freedesktop.org/patch/575161/?series=128193&rev=3
>
> In practice no need to touch contents of
> i915_pr_psr2_sel_fetch_to_pr_psr1 at all. It will switch to PSR1 in
> case of PSR and Panel Replay Full Frame update in case of Panel
> Replay.
>
> Also psr_set should use same values for Panel Replay as are used for
> PSR. I'm sorry if I have instructed otherwise earlier. This has somehow
> evolved during writing the code.
>
> BR,
>
> Jouni Högander
Ok got your point.
Will add your comment as a comment so nobody gets confused.

It will switch to PSR1 incase of PSR and Panel Replay Full Frame update in case of Panel Replay.

Thanks and Regards
Kunal Joshi

>> Thanks and Regards
>> Kunal Joshi
>>>>                   ret = true;
>>>>           }
>>>>    
>>>> @@ -358,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int
>>>> drm_fd,
>>>> igt_output_t *output)
>>>>     * Restore PSR2 selective fetch after tests were executed, this
>>>> function should
>>>>     * only be called if i915_psr2_sel_fetch_to_psr1() returned
>>>> true.
>>>>     */
>>>> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output)
>>>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output)
>>>>    {
>>>>           int debugfs_fd;
>>>> +       enum psr_mode mode;
>>>>    
>>>>           debugfs_fd = igt_debugfs_dir(drm_fd);
>>>> -       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
>>>> output);
>>>> +       mode = psr_get_mode(debugfs_fd, output);
>>>> +       if (mode == PR_MODE)
>>>> +               psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH,
>>>> output);
>>>> +       else
>>>> +               psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
>>>> output);
>>>>           close(debugfs_fd);
>>>>    }
>>>>    
>>>> @@ -389,11 +403,13 @@ enum psr_mode psr_get_mode(int debugfs_fd,
>>>> igt_output_t *output)
>>>>    
>>>>           if (strstr(buf, "Panel Replay Enabled"))
>>>>                   return PR_MODE;
>>>> +       else if (strstr(buf, "Panel Replay Selective Update
>>>> Enabled"))
>>>> +               return PR_MODE_SEL_FETCH;
>>>>           else if (strstr(buf, "PSR2 selective fetch: enabled"))
>>>>                   return PSR_MODE_2_SEL_FETCH;
>>>> -       else if (strstr(buf, "PSR2 enabled"))
>>>> +       else if (strstr(buf, "PSR2"))
>>>>                   return PSR_MODE_2;
>>>> -       else if (strstr(buf, "PSR1 enabled"))
>>>> +       else if (strstr(buf, "PSR1"))
>>>>                   return PSR_MODE_1;
>>>>    
>>>>           return PSR_DISABLED;
>>>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>>>> index 372bef2b2..36ba7f068 100644
>>>> --- a/lib/igt_psr.h
>>>> +++ b/lib/igt_psr.h
>>>> @@ -46,7 +46,7 @@ enum fbc_mode {
>>>>    };
>>>>    
>>>>    bool psr_disabled_check(int debugfs_fd);
>>>> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output);
>>>> +bool selective_fetch_check(int debugfs_fd, igt_output_t
>>>> *output);
>>>>    bool psr_wait_entry(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t
>>>> *output);
>>>>    bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>>    bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>>>> igt_output_t *output);
>>>> @@ -59,8 +59,8 @@ enum psr_mode psr_get_mode(int debugfs_fd,
>>>> igt_output_t *output);
>>>>    
>>>>    bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>>>> *output);
>>>>    
>>>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t
>>>> *output);
>>>> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output);
>>>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>>>> *output);
>>>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>>>> *output);
>>>>    bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>>>    
>>>>    #endif
>>>> diff --git a/tests/kms_cursor_legacy.c
>>>> b/tests/kms_cursor_legacy.c
>>>> index a430f735a..91e5e9b07 100644
>>>> --- a/tests/kms_cursor_legacy.c
>>>> +++ b/tests/kms_cursor_legacy.c
>>>> @@ -1849,7 +1849,7 @@ igt_main
>>>>                    * page flip with cursor legacy APIS when
>>>> Intel's
>>>> PSR2 selective
>>>>                    * fetch is enabled, so switching PSR1 for this
>>>> whole
>>>> test.
>>>>                    */
>>>> -               intel_psr2_restore =
>>>> i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>>>> +               intel_psr2_restore =
>>>> i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
>>>>           }
>>>>    
>>>>           igt_describe("Test checks how many cursor updates we can
>>>> fit
>>>> between vblanks "
>>>> @@ -2074,7 +2074,7 @@ igt_main
>>>>    
>>>>           igt_fixture {
>>>>                   if (intel_psr2_restore)
>>>> -
>>>>                         i915_psr2_sel_fetch_restore(display.drm_fd,
>>>> NULL);
>>>> +                       i915_pr_psr2_sel_fetch_restore(display.dr
>>>> m_fd
>>>> , NULL);
>>>>                   igt_display_fini(&display);
>>>>                   drm_close_driver(display.drm_fd);
>>>>           }
