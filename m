Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D136CF318C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 04:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37E010E7A0;
	Thu,  3 Oct 2024 04:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZlM8l/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C824110E7A0
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 04:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727930375; x=1759466375;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wXuEwdx1UN+GpDRIqbJvqXgMM88n4AIs0LoKN27ZhPc=;
 b=cZlM8l/LrE7fdzRehAnkzebOCxu1wr/sAIrhNT3iNaJKVEd6gIeUXuD4
 y0antQjczsPelSQFJIapb0i8ip3aoApUSf2hoikJTGXgddbFhvrkRwoca
 bdGwqRJ4OvuTCBlasDjhf4FbhuM71nGhlpYd6r4MyglPiB941x45HBvaq
 rWvLfpXWe6xxpbyVAvSfZxMgI7MvcuX54w2OfczdpIlEKtG2AyeZD8nPz
 UvBZODj/dR6ifZ0uHX6TGMC7HLvT6Eud/e0tCHQV/UBGZtSwPD1M0ILeK
 v0h7vfR5HB9JhBkJTaFVjWKC1Bi5Uz3eFPArXWJ/JEPwhDiHtvm91TSRC A==;
X-CSE-ConnectionGUID: 7IhIzsDIR2isjYs14ZcDbw==
X-CSE-MsgGUID: DxVq3D0xQR2jFf7eYab5cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27291865"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="27291865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 21:39:34 -0700
X-CSE-ConnectionGUID: rT/9g2ENS7Cksx+ezWjEPg==
X-CSE-MsgGUID: zflgASFdQMGgvxjthehaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="79075221"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 21:39:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 21:39:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 21:39:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 21:39:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 21:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJne8U9qfNqRRigPRD3V1vWF6y0EhxDsgqjzHzlsEzc7QfNny8GFZMHgPFO04xpr/ZZGITYdfOjVCIAZ6U9n8C3bmo272kNiJPIyTQ+A+vJVnHseL3cBiztNjIRtI+XhoruU3kGzkkV08Erv5S33PB9uMqyzsyWpRjuFZwM59Y81392RPBgSoKB8k34wx+m77k5zxL3WkWZk1oaYMPr7oldrMlNilH43xqNd5eHIpSX8wE5awevN/c99E4XIkcrNj+OXRlmmT5tY414Jc/GvxFtAU31YVx7PqKc7PKggmfxDtKC8c/zHH50M/385tXlYh7mN43WIhIHqadE6m3jEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQJBe7hJKGjP0WiFL8JvytwN7/1WPkB01DiyoR3PNTY=;
 b=kWXpdKzqG4jfeYkjsoATwMWR+op8N+86h/3Swir6DiQ+TUcdg7HT7SjW1Z9Yq34FJCjlwm2bl+ys1Pcg1TQ4cW9ZJ7mnyvxCg/Ow8B5ywAxVo0OCA6zVeNHkw5zNxx0vne/+fyu8iZKssuve30vp90uxg+s/V7Mh05Mt5RV2fySy8x2gB0vznypb6hS66iwz/Ep5tAb6u4vrufAhNJixOooWr6FtFuiDNoWZReNH1cBMy2eZEHyfrA+cBy4ppVBGO0x+SI1jdOZ71BVxrumuH+p9FNBpQLsl86pIn2+NuuLet7/q27SZug+03988GhQRaz4HE7gBKaF90FOSaQfD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 04:39:29 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 04:39:28 +0000
Message-ID: <66c16aa8-931a-4825-8e59-cbb023bd000a@intel.com>
Date: Thu, 3 Oct 2024 10:09:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/1] tests/kms_async_flips: Async flips suspend
 resume test
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240930120410.1023320-1-santhosh.reddy.guddati@intel.com>
 <20240930120410.1023320-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240930120410.1023320-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 946ec33c-e10a-4264-1d4f-08dce3655d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUJlYzl2YVJLSFliamZiNDFNVDc5ODZQUjZwajZvNHNXdENNYWFQQWVaLytm?=
 =?utf-8?B?dWRzTU9SeS9mMXRlR0V2VTlqbVdWR1VJQ0JWYlB6NWgwYTVkQUFOK1NKaGxK?=
 =?utf-8?B?MVEyQ1BZRVdDK04rWnJpbnZpQko5d1dWanhYWDFGeXBpOGM4ai95MkU1ODRP?=
 =?utf-8?B?emMzOVYwZVY5Uzc1eEptNnViMWpLY0lpVHpUcVlhendoUHEwdXpRMmRQUlk2?=
 =?utf-8?B?REVQMjBOWlFKVzhHWkxRZDRJQ2M4allMbnBuUkJaODJieVFxdUtNeW9NRnM5?=
 =?utf-8?B?cnZyekFSL1N0My9BcDhnOTJIT3RsMmNqWUU3N1dxVGF4N1ZVVFpHYWxTRCsw?=
 =?utf-8?B?dCtqYXBOYjg2Y2hKQXRsRXY5NkoyQVR4WkE2K1lWMk5WeTdvWWd4RFQvU2Nj?=
 =?utf-8?B?eER3V2hJczh4UnltNXBJTGRSQnpxVUp0OEUreXpoMWV5enlkWjhqcHpuVlAw?=
 =?utf-8?B?NlZFSEZmZUhSSEZYTi9tWUlWaVJKWUprd3JNeWRKRDBjaEw2VXlPaGJha2xO?=
 =?utf-8?B?WXV4ejFoTTNEcmpFU0U3MTRwZ2t1ZVQ4MTNFWkRhcllkOG1Rd05FMzIwYjUx?=
 =?utf-8?B?N0VCL094akU4bEhJL01zQjhnWTl6MVRmWXpLRU14VUw4U3dieG9iWmhnVHpY?=
 =?utf-8?B?b1FIRFJwMThQMUdlVjV3VHdxUWFPWEw4Ry9sSHhVVzlVTmZoam04MWl0Uzc0?=
 =?utf-8?B?ZGFlb0FydU82cXRrYUR2NCswZ0Q5OEtpVlp3YVJDVE9FUXJRZUVRVUpUL0gv?=
 =?utf-8?B?QklORERjTW5wL2Raa1hsQTAxMmhLYlp2VFhuck8wRjZyZDFHRFZSeGhNK1lB?=
 =?utf-8?B?alBEb2kwQ2puRDlYRXdJQUxWcWlnR1RZUU14TTA3QitpbmttQUVJckN3UjNk?=
 =?utf-8?B?VnRsQzhZQmhpVVBUVVh2clNJQ3F1YlE4STJGQVhYMzE3K295YWk0QjFKbnhl?=
 =?utf-8?B?dHBMWTJUcWVDS0x1U2psWDJ1a1V1WDhWRm5EdlgwSmx5M2NqcklkMGozZGhm?=
 =?utf-8?B?R2ZhOEVSOGZpM215eXdZUEJkQWFYR2RkbUZoSjVIaFZlMHArbmVlbERQYjFt?=
 =?utf-8?B?bmxqZGtYZHlFTkp5a09NTHNFMk5kR3VWTEtRbzVSVTBDR0RmYTZRY29Fenlo?=
 =?utf-8?B?STNyaFhNdUg4aThFV3RzWWxCSkdDUUI1VkJaNEluay9tWDN4Q0RaY3lZcHU3?=
 =?utf-8?B?NElzWk9lV2RwRVRETW0xeFJNeitUeDdKWkNLekdlNkJVRXV5RmRTbEIvSzYw?=
 =?utf-8?B?STArQW00OXZqS01jSU9TQjU0akJLTGU3dWtpcjZ2K2tKYTk5dy95WUswOUgx?=
 =?utf-8?B?a0l5bllUZ3hpTTZadWI4bThMekJLeXozSHA5aEJmRXA3c2JqZ3lLZ05KTHAr?=
 =?utf-8?B?eE5RU0VMVGNpekJhZnpOeUxFbUM5bVJOc0lJcCtsYkkvVUxCQVk0TFJCajlE?=
 =?utf-8?B?SUFvU3ZEOHA0WlR0YW56YzNYQlR1djNpKzhrKzEwbjdQeHFDZEFVTThTa1oz?=
 =?utf-8?B?eGR5YytneE9Fb042aU93MC9OMEpIL1I4QzRXdnQ5WGFpZ1lwYkZmL0krOFp3?=
 =?utf-8?B?VDlZYmdJNWpsQ01YQzl1dUFNZ0xhSjlmZlduUitjcWRHVjU3UGNkcUVnb1hS?=
 =?utf-8?B?NTlnUzNQaUttMmMwQjh6YU9TbnhhMzFUeE1wQkZoenMxdkhNSFFsN1J2bUZG?=
 =?utf-8?B?TnRtS0V0SVMzMkVxM2xMZEtkVlVJWmIxVkJNTXFRWCtyK0hUYm1MRmtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytTYmJSbnVVdXgzYzhPazltMzlBeGF6bE1xSFZCUjFPbUFDMENvN0NTSmFU?=
 =?utf-8?B?eDRsbjhMMTVNVnlYcVkzdUgyMXllWUZ4UWc1a0Z6ODcxcFFBS0R0SWZCUXYr?=
 =?utf-8?B?R0FqWW5mZi9tT2NJRHRYSGdrMDJrdm9LTm90ZlBKSWpPVmR3V2ZjR1JJcVYr?=
 =?utf-8?B?clJRNWVVMXNpNWczaHVPMDVpWW12Y09qemw5SWdlam9LTWNGVnVBWFhVN1gr?=
 =?utf-8?B?T0lwc0NDS0ZPK3krVGtiK3M2ZHNVRXlGT1VuU2w0MmtqWTNYRGhUUVU1NzU5?=
 =?utf-8?B?ZnVzbHVaSHNabTh5WG5XK0EzZmt3MlFBSW94dVJSVkxsZVVKb2s4SGhpa0FQ?=
 =?utf-8?B?V09uV0Q4VjVxNVpQbGZQWFBsR2UvdnkxcTRHRDF1bXFybmcwbDVFVE1WSGNI?=
 =?utf-8?B?MW1nWmdZc3ZxbURiMzZJTkM1RThHTkxoTzZHOUNrbUQ1aDlrUXhGQXJpa0xM?=
 =?utf-8?B?RlBxMFNMQ3Y1T1BXcEg1V1JOYk9FWmsxRjRsN2t1UWdkbS9hL2pHbUNFZG04?=
 =?utf-8?B?bG5hWGxGRkRWR2RRSVd2VFpXcjA5T25oVEtVRDNxVGhHS3pKdDhUbjh2Y01k?=
 =?utf-8?B?NlFBVE1MZlJVcHo2eGEvWVo4RTkxM1IyK1ROWWRjNU5sNkY1b0xtTHBla2Q4?=
 =?utf-8?B?L2pROHpuano3cWNXWklHdlBCcVlDeUZJajBxMWFWOEljMHpuMVZLRHl1RDBB?=
 =?utf-8?B?OEdpbHBrSmgwUjZ6cGJ3WmUyLzM4UldkUlMydzM4OXd0ejFIYmJOV2ZiS0gr?=
 =?utf-8?B?STlQSTFFTVptMGlLaFFueldLaVY2N0RlZjgwdmdpejY4SWc2YmxHYmp3d21K?=
 =?utf-8?B?WjRnbkJJTEprcHhGd29lUStOckg3M2ROSXpWWi9FbTBTaVZicUVLYzdVZ0hF?=
 =?utf-8?B?QjVxRG1zTytwQzVaYkV2UDlnVnVuZTJ5T2ZRbUJLTUtreU9JSVlhdlRjendu?=
 =?utf-8?B?ZXFkSjM1S0g2SENqUmJNam1iUmNWcjBOTjJkM2JPT2hiRGJ6ZVFLeVlSMmt6?=
 =?utf-8?B?L1A5dTV3UXNDZHlFWG9RcnRDOTB1RjBHYTgwQ2gxZDZGT1BYQk9FM0ZnTmxY?=
 =?utf-8?B?MXFVVzg5UEc3OVdUeW9LMXo1OTYrTHJpN2FpSXJPT056dGhlWkVaQ0NqR0gv?=
 =?utf-8?B?NVR4QlF1Rk5KcWJOdEZzSkMwdDE1eWhtdXZacWs2aVF1UnFQTnovdnRoZDFm?=
 =?utf-8?B?NXdsanZ0dC9zbE1aQzMvN0x5RFlESmhmQ1EwYm1OTXF3bEVVbzhWdFpvWTlQ?=
 =?utf-8?B?YnBNSFU2a3QrWWVHeisvUmh4QVo1QzNFUnNpNDBsOE9KYWdRV2RHT2ticXhu?=
 =?utf-8?B?bDBsTFQxSEplV2xkUnVBQ0pCOHJxNVR3MXFwMllWc1dqLzNGaGhnSk1XOFNJ?=
 =?utf-8?B?TGRzelFZTytNSlJPYzRCWjYyTlFsZVZudHZtVmhaUmZ6UFJMVXNwQkh5d09u?=
 =?utf-8?B?WTZVRWkwWEFobmxSMWlTNnEyVFlYNUVNTFZRMHh0VGFVek83VFpJNjdmekRL?=
 =?utf-8?B?a1pVWEtEaEcxeHd1Z09FN1NlRS9wYlZ6UlpIWkJtV1NJTktoamNZeUtYbGQ5?=
 =?utf-8?B?dXlkU2pBUWkxRkhJcTY1SUl5eWtZOGRlSkxzMXB3TDlwNUJ0NnQxQXZTVXM5?=
 =?utf-8?B?YUs5djBqbXRXRkJrTFVzQkZtUVNYR0FIQXdmUFBCSHFmeXpKaC9DWDVmTjFF?=
 =?utf-8?B?eG0vUHM4azQvbDdHbTBOaUpycGo2VDJpd1RUenA3V01rTkxTQ2pOYlRBY2Ux?=
 =?utf-8?B?OVVPdkMwZlNqZDZFLytSUE5aVFJobGZmSHBQVmk3TkRJVEx1STZNSWwwL1Fq?=
 =?utf-8?B?K0RXY1lBdFFUeUoxb0YwRjduWHVrclBrS1lVNzZxaXJNWWZHMzJtL3dGYTFR?=
 =?utf-8?B?SUFmTXNPMFJ1SHhwRi91TWQyb3B5eWpndlZDZWw2U2xwQWZKM2RzeFdKYUhk?=
 =?utf-8?B?WVpFbWQ0dVV0UG1IdXZadzhpeGJhQmpWVi82Z0JhbFdHSDQ0Y2lIQlRvUHJp?=
 =?utf-8?B?SmpIdENQZnBJb1l6ZURWK2t6eC93WmJuRjlscUFXNmpUalp0UksyVXIzdHMw?=
 =?utf-8?B?OXIyMk9NZ3hqWUdxOHQyelVnYVlrVnMxR2RIWi92MkFnVGF3OEdJN29CeXFV?=
 =?utf-8?Q?EEexA+1EuYwSvlQ5SSNn46AET?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 946ec33c-e10a-4264-1d4f-08dce3655d91
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 04:39:28.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gONfcibuWiSSO6YePCwh553NxWgG9dmmor3aKBwtRDn+ubOBToWJfyCaF+zw4pRmJ31CSJ9dyxhtMRG1ByjrnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

Hi Santhosh,

On 9/30/2024 5:34 PM, Santhosh Reddy Guddati wrote:
> Test functionality of async flips with suspend and resume
>
> v2: Re-use existing function and use s/r API (Swathi)
> v6: Remove HAX patch
Please remove this v6 comment as it is from a separate patch.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5b70c4033..08510e70d 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -66,6 +66,9 @@
>    *
>    * SUBTEST: invalid-async-flip
>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
> + *
> + * SUBTEST: async-flip-suspend-resume
> + * Description: Verify the async flip functionality with suspend and resume cycle
>    */
>   
>   #define CURSOR_POS 128
> @@ -99,6 +102,7 @@ typedef struct {
>   	bool flip_pending;
>   	enum pipe pipe;
>   	bool alternate_sync_async;
> +	bool suspend_resume;
>   	bool allow_fail;
>   	struct buf_ops *bops;
>   } data_t;
> @@ -260,6 +264,7 @@ static void test_async_flip(data_t *data)
>   	int ret, frame;
>   	long long int fps;
>   	struct timeval start, end, diff;
> +	int suspend_time = 1;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -312,6 +317,10 @@ static void test_async_flip(data_t *data)
>   				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
>   		}
>   
> +		if (data->suspend_resume && diff.tv_sec == suspend_time) {
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +			suspend_time = 0;
> +		}
>   		frame++;
>   	} while (diff.tv_sec < RUN_TIME);
>   
> @@ -750,6 +759,12 @@ igt_main
>   		run_test(&data, test_crc);
>   	}
>   
> +	igt_describe("Verify the async flip functionality after suspend and resume cycle");
> +	igt_subtest_with_dynamic("async-flip-suspend-resume") {
> +		data.suspend_resume = true;

The suspend_resume variable needs to be reset somewhere. May be we would 
do it once inside the 'if (suspend_resume)' itself.

With this fixed, Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,
Karthik.B.S
> +		run_test(&data, test_async_flip);
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++)
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
