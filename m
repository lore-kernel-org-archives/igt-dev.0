Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B37CC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 05:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2646710E2BA;
	Thu, 20 Jun 2024 05:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShEELzYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDBC10E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 05:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718859964; x=1750395964;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0M8Jq9U6j4RSIvPFCWHYKfBs7Xe94LSMbtQbE/4r/O0=;
 b=ShEELzYTZhP2cBHWaNWONd/bt66HCw3osagUyihXOjqlIEVk6JDA8Ubj
 2ZBy3eylNVWvwQP5aAJpsYU3zapihl3/jm/svIgFs4NuKr4JV4iipZjFZ
 OUaY9ZzpmaSCRjEDRq4+13thiqjVrgPk2kKUZRrkhKwgUr5kNHstuNy4X
 WHhE+NWTPKPi4C8UB9f3oZvMaec6+UOLYaXmz8TaCbtNMaRIDiefwZgp+
 Hq5BlYuVM8A5zXmAklGQlBXYzVoLFgvzrzlh5Oc5u0aW4A7wKPodj9EN7
 RqINo/jJMx3xTaO8ZAwH51G6Gsg2uP7FGjTjkYKFBNkklenTZqxZvJ3iF Q==;
X-CSE-ConnectionGUID: O7cd5Y1NSm+HLHLeRBoiHA==
X-CSE-MsgGUID: 6VapRlBRReyideUl3JHULQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15646596"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15646596"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 22:06:04 -0700
X-CSE-ConnectionGUID: 6KyJxBbGQJi2KZtL4N1HSw==
X-CSE-MsgGUID: BzMx6Nm1RByLhkZQMX14dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46646833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 22:06:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 22:06:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 22:06:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 22:06:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 22:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAlv21rkUJwx9ZQaZ4oq3oFbaA88S4xzJQmDeX8RiY2WJy0ujBWTGGLY0Z72hgLWauHxn+URGJPr6plAT4hDNIgkwPEtoveWldLHYS5McLNVYscLZoDZ3NOEp/BxHythtKafYktsfdb0RzyZ2srH4HoX0IQ/HSDal5bmKHvwm3EBP8vXP+nAV1Z0nn4TYmRcQWb2Fh9V3Wk56n93wPVv714YiBT9VFpGUkRPbdY//83yuCKTupipHvocf2gyC821irHqGHqSLNvs556QLGU2otbJNWAqGpwLeL/z1j7MJPFFRU5PM0FThj2H+9FpcWU2DkVjc82o2LJ0RUTwB5xpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMnxmWD6g8ZoW6Rx/nsuXNVMCzin9a2d10ZGmrMmDSY=;
 b=GYeWjHNLrLocSpWdQ626UlZNM3idl6roctpF8/EpxsH57jeIzVbRHHEfaNeIKzU6m3jfplItvOGuQxOIo5EEado84NEwAnUIsAxW8H3Gzi77wzR+MgoLdqfTM99dyyIWWrUOfaN2uElaAOUI6aXFFEvhdg++f+ZaVXwH5UDWEwjUUNqciV94fabOZp6/avcp4wv5urOGe6+5IL3MdPV/boggviTSvH/XSuvbIkIkkb4zZkiLF+E/r3Nlb9MDcr3fnALatRQfNgsWGfbWDe6dZVvHS/r17ZzHaRwgcq3ABKAICdXXAI9hH4W064KbQcaH0anM61T9sLfeFvDXd1+w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 05:05:59 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 05:05:59 +0000
Message-ID: <3b728aba-8fed-4adb-839f-906f825b2274@intel.com>
Date: Thu, 20 Jun 2024 10:35:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
 <87frt9fdwh.fsf@intel.com> <515d6191-11cd-4b65-a142-ecfa7b5bb739@intel.com>
 <878qz1fc48.fsf@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <878qz1fc48.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:4:7c::28) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 251c9b59-e49a-45e4-96c8-08dc90e6ac83
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWkwNEtVYVV2VHpzYmx5ckxUUlFzbjJxRkZpN2U0S21aV0QvOHJ4a3JBVngx?=
 =?utf-8?B?YU03ZHIreWwzK3lZd05uazI3Qm9VTkVUdDUwRFlvNk9vNCtaUXRabVJQZXpr?=
 =?utf-8?B?ZHplR2VoU21sdDg5K2tGcGJobklITzVFYklkOEhDWUd5YXRHTk5Ybm56U2ZX?=
 =?utf-8?B?cHR0MkhDamhFZkxxR1UwM0w5Q3ZvVWtRMGNiV0c0UVF5ekR5MG0weHFBa3lU?=
 =?utf-8?B?UXVyQkJOOE1TbzZjQlFXdmJtZ2Z0WjEwVStzb2Q2VHlyMDlPQlpPQXhUZHAv?=
 =?utf-8?B?U290U21NQXhnSUtjSjA1ejNzQ2t5MFM5Rk5NcWdkTjhMQXptNGZWRzNvaGp3?=
 =?utf-8?B?SjlNUHBXZmY5QTZZTHkvR2YzT0tSNHZmNWZsZ3QwZ3o5c3VCWllnK20zUHhV?=
 =?utf-8?B?SE84WVVIcERDYzUwVFhyOTAxL3RaemtxTHM5VUVqRWlWTk9Wb0wzdm1zeXQw?=
 =?utf-8?B?UU1HaEhLUm9RVlEvSWpaRXNZS0FkNE1naVIzRUdyaVJNMFU4RXJ5S2ozc1A0?=
 =?utf-8?B?bGxEbzlCK253TDJiNTYvOXd2SFlJaTA0blMwNzVvbE5BWEs5cXFGd0I0V3FE?=
 =?utf-8?B?MW0wQkFjcW9YZENsZC9kam9lcWdQa2p5M29FOENoT0VtdDlTenVnVVZMM05N?=
 =?utf-8?B?NXc5OUREVEtvZXFEYWtPWnVmV1A3TWpQOWYrVlhrT3ZvZy91M1lYcEpNT1VJ?=
 =?utf-8?B?b1FkQW5lNnNnTlRaR1doRnR1eG4ya1JaSVd0blA3WXo5NlZKazdRRThUTmYr?=
 =?utf-8?B?MkZIcHJsTVpJb1VNNUZ0UEdteXcyV0JQcHZHdFhOTHFsMDh0L3RoM2xUNU5E?=
 =?utf-8?B?UmxvSGF5eFFkTXhPL09nd1dLOER3alY1ZGdTOHByeTBlSVY0VnNlQnVad3pt?=
 =?utf-8?B?cGhsS3FuOStrSGdaL2owZERXb2xSd1hiWm03eFJPM3hDY2FIbS9wdHRWblFu?=
 =?utf-8?B?OStKZFNQV0xpUk5JdHB5bVZGQzZFZXBydEltUnlIN2RGVmQ3L2NCMHFwS0tG?=
 =?utf-8?B?QUx2ZFdmSTZtWEtFcjZmL0ZHaXlqSlJwSHlHQjZkcXpvUGQ1cmpENEoxS3g1?=
 =?utf-8?B?aWphV2NUV3NXclZFR1dJUDA5eWxndUhHdG5DMlY1OHUzZk94QjN6MTJQcDli?=
 =?utf-8?B?MytZNHZHQ3NTbmhwSThNSktLOUJpb25ZQUhkeW9WYzI3REtkODBIcVY5NHJa?=
 =?utf-8?B?RG1wREF2WWk0bVVkRytkcGNUSmxtMUhkR3VJNU4vbElTWUdQQ2xzcXlVdEJv?=
 =?utf-8?B?WG1rMzBXb3FUM0lzM2daTWpJTjl5Z0Q0RmxYbW5YUGpYQy9QZ2NNZTJDOTJE?=
 =?utf-8?B?cGNLRWs0Z0svRXpLbHNCclFSdC9EaXJIQVMrVTNFbWVFVitveFNsaGh1NHZS?=
 =?utf-8?B?eWNzeUwxT3VwY0pJamFZcWt2YS9JdGs3VExMcmI3UG05Ync1NEJZcnJodmhL?=
 =?utf-8?B?MnZJdDhzSnhYd2VXYzVLeDd3UXY1dFVMTEp5MUU4bE5GeENRKzNhWmhZQXFG?=
 =?utf-8?B?UXBJaXNsYWd1aUIzMkdLaHdDOHlqVUpGMVNlUEMzajlUc2xIQjZhbmNIWFV2?=
 =?utf-8?B?NVJHMGY1NnJmT0U0ZzJiV3djV0l2K3Nwa0ZvbmZPZE9kd29SZnpibHYyYzMr?=
 =?utf-8?B?WEFNTU16OXFrTmZ1R29YY0Zhb05QM0x5VXVVNWlCalNPam43VWNYUW1TK25N?=
 =?utf-8?Q?hA4lO4Ws7TBBkX/8rGYr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXE1SFBGeEhUdXQyME5HYW92Z2ZWd0R6UTFnSlBZa1NVVG5YNDlFL1VhWlRY?=
 =?utf-8?B?MHFQMXpzU0hNbjYrVWdqcWl5Q1B0cStCdWpqMnh3MHBzZ0J5UlA2OVEyTEJT?=
 =?utf-8?B?aGZmTTlpc3VnTm1UOFlBM2dTUjBoeDVKQnVGeExGQW9ua29IbUFmQ00vZ2Q5?=
 =?utf-8?B?RWt6Q0xheXp2OXgraWxrT0JvdmtrYXVuS0g1dXJxY1NUVUJYNTNRREcwVml1?=
 =?utf-8?B?VW9wZmJJUDMwYzFLb0p4MjlnOVoxbkJkczRkZmxSSjQyTjdsYkczQk82ZGYy?=
 =?utf-8?B?UjZVa3ZBQjExazlFQS9ROTlabldidjV0ODBTMmROYnJxbEN3ZVZBN2s4SGx4?=
 =?utf-8?B?aEJaaGREOU1ZZTRvcVVROWFqS0NvZ05xRnJ2bUR5ci9kWW45WHZKQ25rN0NB?=
 =?utf-8?B?NVlMcHJZdDFHcTlreHM4b1o3OVVBZ3hONGNEakxVdkpsektRZXlETGFxMG9v?=
 =?utf-8?B?K3hScHVtZzNyNFlEeGg0S3RVY3JxUGZUSGs0RUVRbGdiMjFtTmkzMmpHZy9W?=
 =?utf-8?B?WWVXWG9ESEhnVkJJcTZyNmFZZ2lyODJrWlVtb2FDUmVweldHTjhCWnFEQUlM?=
 =?utf-8?B?R3ZhQkFFeWg5RXBFamhDMmNPTllEQnZBQ3V5dDhPRzFTcktuSnBHT3dFczY3?=
 =?utf-8?B?RlBPdVpEOXh3NDcwRFZDOEp2eEx0bkhmMTU3NEM4ZnRiS0gzUFpLWVl0UnFK?=
 =?utf-8?B?aVk3bXI4dkxTc2xIWTQwZDYzck9kaCtzZ2EzOGpYdXZZbTJXSUIvR25MeVhn?=
 =?utf-8?B?em5pNjBWVDlpMTBQMVJWTTlxQUQ3WmNFb0NnbmcyRUdBcFhtMXNtQkZkRURF?=
 =?utf-8?B?TjAxanhYb2NOZWo1MS8rdGQ5aHI3TkNiWWNNdFVibDBHL1ltZFQvVjRRQjVI?=
 =?utf-8?B?RUo5RU5xbjZpOCsvMkxrQlBjWW8wSk11Z3F4L0tTZjVIRHJLSGM2Q1hrMTgv?=
 =?utf-8?B?TWJvVnF3Qm80M2Y5WGpkUmNSNG03aGFZcW0wVjZJZzhNMlpDVWljNlRudy9L?=
 =?utf-8?B?b2x2NTZ1c2thZFYyUU9hWFJQSTRWKzhHQm9iazI3V0dFQ2ZUOWk3a29aSWds?=
 =?utf-8?B?KzdIb2prT2tWWG1oaXpiby9zQUxZTm9lZFV3b3R0V0VkL1dEeXgvUk1lS0ZD?=
 =?utf-8?B?aHIyNnU2N21WVjRDcU1rSmx6ejJsWWR6NFRFZ3hGTlZvN083V016V0U5VmZp?=
 =?utf-8?B?QnBLc2dvczRtcXBaVHdFWS9CZXFlK0ZSaVVqcGV0emg4UGFYMjNLZnJjeUFB?=
 =?utf-8?B?MXA0allobUxuNlFaamJsK1ZRekRYZGFjWXArWFlKMDZ0R1hrUHo0VVQ1TEY1?=
 =?utf-8?B?b1VLWGV2a2JHcDAwL0wyQ1NGZGxUYm5tSTlneFBPbmoreStpQUp0eG1VZmhr?=
 =?utf-8?B?R0xYeDNXU2JncWdoOUx5QUk3ODhaaEFzOHJ2VEhsNjUwb3lFNmF4aFUvajFY?=
 =?utf-8?B?N3FSc0tPWFlrYlZyM0xWeXVFRGw0dERtajgyZHpFbWRNamxzclA4WW1oazhG?=
 =?utf-8?B?UTAzRzF1N1d4MVFuS2YwQVpkS0hjTjlrTzdSR0pMQVVTc09iV2xmVUZiUHR6?=
 =?utf-8?B?Rk9jWEdaYk5Wd0tuSE5WQUkvNmhFRGpLc3Z5SS9uc0VHWFRibFE2WTNjVWF6?=
 =?utf-8?B?cjBWa3JmOWU3VUEzcGFoNjAzWEsvSTZPWFZ4UlRmdHJCUllTYzVMb0wzUS9i?=
 =?utf-8?B?R2tLclUxZHZpT0w1SzdURWQvcWVQd2tkREZ0VUFPVUZaa1lhMjZNVzNXTExu?=
 =?utf-8?B?WHNPNXZkQUVJMm1sRFZnY2wwL3dxS0NSYXlWMTJsbHoxL1UyQXR4Z1NFNm5C?=
 =?utf-8?B?OVRTeEFBaXFocTVNeWNLMEJadWlxYVpUakVGeEJFajZERnJIZzhMYk50Qlcw?=
 =?utf-8?B?bk1wRGV1dVlDUStWc1l5b1lFQlAzdGZyMnFMNXN1NThCdk5McUNQOGxscDkz?=
 =?utf-8?B?TU5OZTN5NDdQa1NPY0xiK0lRNEY4bTJHck9CUVVqblErOTZoRjNybHJiN2M3?=
 =?utf-8?B?ZlhGNGJnMkFzdSttRUdZNDdWT2wvSW5pS1hSd0xnL1R2RE9MQldMQnlJTy95?=
 =?utf-8?B?M1VWWjcwdEdHaEkyNzEraDA1VmVNb3NUNlVoOTQ2R2FzcjdrUStYaCtPcVhC?=
 =?utf-8?B?bEZZUkdQck1GSTFWR0p2N1NkVDNnaGFkazBialRjaW9MMFoxaWwwbmw3dzhz?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 251c9b59-e49a-45e4-96c8-08dc90e6ac83
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 05:05:59.2281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTUQcZVhuWSsKWNHCTb7z4DY1VcgYV2db8c5dIUGplEwbRGC3oX3cX5ALpigDs3NIRNiyiV7rT336lie/x9FFg9JdCWvZsHx84QDegdMxoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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


On 19-06-2024 04:11 pm, Jani Nikula wrote:
> On Wed, 19 Jun 2024, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
>> On 19-06-2024 03:33 pm, Jani Nikula wrote:
>>> On Wed, 19 Jun 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>>> Block KMS tests those are specific to (display_ver > 14)
>>>> are not applicable for i915.
>>>
>>> Feels a bit wrong to list features like this in a block list. IMO the
>>> tests themselves should be aware of what's supported and what's not. I
>>> imagine the rationale is performance? What's the impact?
>>
>> I believe there is no point in running this test for i915, as it will
>> always be skipped. The test already knows which platforms it supports
>> and which it doesn't.
> 
> The question is whether it's worth it to start maintaining the info in
> two places, the individual tests based on dynamic info obtained from the
> driver, and a manually updated static block list. >
> Are you also filtering xe testing for tests applicable to old platforms
> only? Is the manual work worth the effort?

The only advantage I see in maintaining an additional list is improved 
reporting.

Yes, we maintain an XE specific blocklist[*]. This manual effort is 
worthy for someone looking different execution reports. In fact, some 
efforts are going on to develop a platform-specific blocklist.

@kamil, Can you please add some details about upstreaming 
platform-specific blocklist?

[*]: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/intel-ci/xe.blocklist.txt#n65

- Bhanu

> 
> BR,
> Jani.
> 
> 
>>
>> - Bhanu
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> ---
>>>>    tests/intel-ci/blacklist.txt | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
>>>> index f6e9bb474..d01ef5e16 100644
>>>> --- a/tests/intel-ci/blacklist.txt
>>>> +++ b/tests/intel-ci/blacklist.txt
>>>> @@ -140,3 +140,6 @@ igt@device_reset@reset-bound
>>>>    
>>>>    # not working for i915
>>>>    igt@kms_bw@.*
>>>> +
>>>> +# Tests specific to (Display_ver > 14) are not applicable for i915
>>>> +igt@kms_vrr@cmrr
>>>
> 
