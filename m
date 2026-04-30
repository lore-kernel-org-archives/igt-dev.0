Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BE2FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 02:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752410E033;
	Thu, 30 Apr 2026 02:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENvjfcYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB7A10E033
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777517778; x=1809053778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q76orK91QOBR/WCWBtOJHFFyT6xON+1jPA2xT8eB2ag=;
 b=ENvjfcYPpZdSC+p0/uJuF7h7m+Lped9FPHoT7La1m5PfFev1PyP1/iDP
 A89egFlxl5cNknPs2Q8FaHg9xFGaGOYV1qveUFe9Vg6M689hbSqB2Q3WW
 gvULnelwS6w0AkzQrQETp8tMx8mAEQ/U/M2X2DeE+xIFBj3ot9C1lvi6B
 iHXGpJgKNpce+Bg9cR+hSVwzRzx9TxRgXSjW7xHDDxo2i+Wt9oMh3MUTE
 Iz0YiGzN/HT4HyrK07Auc6NwNWD+OkFNGYTxpW+noNgjaVA8Ly5wwO0P1
 SIQMDt8IH6pGO06s+f4zmeg/lFyrUgILyEk2ivSLZ2XD/nJq2jOZDkH8E g==;
X-CSE-ConnectionGUID: +2VgN/tDSKeE5JF2UwKoDg==
X-CSE-MsgGUID: 9Rhi6xXkTKGpGe0kbKOJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="103914275"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="103914275"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:56:18 -0700
X-CSE-ConnectionGUID: UKJEVLW2Rt2aZDlIdj+Pnw==
X-CSE-MsgGUID: 6LwJ5gNwSoqld/SD07tCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="264830032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:56:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:56:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 19:56:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv9hkvT8unkTZbXtb1dhxqj4rmgliYj/cGE5b+Z21KAjVy8COBXkdcveHhfbFLJP8D7gISlM2EqLUNikB1Tuteu6DXjaq2ivZJISDVMJ15UV76VpvTD492k1phsvuV8khIqgvc7mVjxfyC9m7qSXWYcON3JTSFPgHPOlckKflZP22aAbInz9GAPewJaQpL5HABDBInSb4guDFMhkeK2EctPU61N7KvFXFevNU4e8ikf+u0ZH2XdqNMPF5e4oBSLMiVbNltghc9T/y9cIT2Y1KXjZlOtNP+zAkJygNixGNRAyarNeASWetsMZFgkuhD6EwccWAAAsRgK1wEqlTO884g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRA4NZ/sO2IoWzwhFkkkQ2cg5Mry8VznClLB+tIgbII=;
 b=ZUGJ8wGFdqnu0DiZ747EB6TV2k3UXneGZLr9Mrn1dTmbBsJ8+gmAmZMPpehUr9xLF5/+Eph7lr6bwTf0X0zqRnc8wSk6uVXZHKtD8xa6ECVQlCTdS3vGWjBa1tYU86BR+2+6VkeTeNyPpGvwvDkWUjr/etNxQyfIBPR0dCEl2Ynu0n94OuHt73HZ2nvDBeKOiQumEiLNJQ71AXdEeAikd9m8lGrNUnPfC6pCXDbzlXeuRKn9/sBtZKEY3DztQ2TVxXV3No7yOPaCDl5SvnqvPc4JbeuQpu/RVw7fh3MnXcvRUmoJdsGgVgF04fkVVOlAS9VVbkm365zJvgXB3+S/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 02:56:14 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 02:56:13 +0000
Message-ID: <a0665104-64ee-41cc-8857-6145017c5de4@intel.com>
Date: Thu, 30 Apr 2026 08:26:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 01/11] lib/i915/fbc: extract
 intel_fbc_get_fbc_status()
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-2-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0538f5-9ba4-4071-325d-08dea6640a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: fFfpsp8wxkWQDiTCEXiMKA+rBBMZzhxNffajgQbm43SHT/GBatb26iDRLZj5cJH8UXYncIlRb9foDyKvPRbDs/PTw1N2qStRjrdhRuIIQqt3H2UkzzYN4X5983gLaRuoHlZORny2WKhjFdT3+faJMHEEA0c++CiqyInLlMzgpJ11ucY3Tzq3J4miyGI2b+POFh84bzRFnL5ekDbKj+2APljDEz7MzuQ+HSpekheIe6mKk4zAJW5S+vUkrlftpXXcS/OTebtZ5vip7IqWjFL5r8pqgIf07DTH9TzS8R5R3jc+x4Irp962auFYYJXi9fhbtrncb6EGbXEs2U9KhYJV7hQckpX1FlQfkwhT2shxMil/8vgtxUiMLBiNLSop6PW6sr1JE9KVPPLehf9dOOWQ1bNlDvvk9WhNv9nNScfHxkhwBXu1JPKNBndpTFwIfATd1FipiLceXlHlkFVJEL4mkszpOlNhpKVnQaanT/nuX9sf+6Mah+83qdqTRMLMNnMknSjI+k4bIqW3OEPdyZIqnn+KaDvfoZNC+o26PehN/AehR57uhHT9b52QFZxEQj/RzBa94Ed/l/V7UhivI+rormdnbS116NzZvUFLLDFv3C7WCM0XLkgOmPdBjELKHXYzmo1ZVwS0DhKgk1c3w1c3qryi0ahPJACe+7e7CtQ5oUL4r4UFXJM2A+AtNh2yD/suj4oO5mcUxGW+jYlp3vLlCOiVxyUFXMZn/p7wcjGige0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZJSDBzdjIwTDZKaW0rek1zSUJXNzNTTHZxZnVaazY0aFh2RloyV3JNc1pB?=
 =?utf-8?B?c2dNTm1rWmxrVVZGZEY2dnRUWlI0R2tpaVdFUlBxRWo3enRaUC8xNEx2VmM5?=
 =?utf-8?B?a29YekhvRFZET1VmWEMyZ09NdlM5NjB1UUlvV2tPOTM3dzc5SDNaSHAxMnRu?=
 =?utf-8?B?ZU5pa3dKZDB6b1dTL2FMWmNSWWIzZXFHaWR6UDdvNStiWngvdXVsd3FjeUVZ?=
 =?utf-8?B?aXNyQmN6cGNGQ3lZa2lMU1hPbTZjcHdZUzhiU2thVkhuejJmTjc4TDhUUVRl?=
 =?utf-8?B?ZWV5TFkvUGNjZG8xQ3czVVNyYjIxVEhHOVhuOVZDay9sK3hJVVV1MVUyRndP?=
 =?utf-8?B?OTFnTlhNOVJVVCtWU015T2kxY0R1dTRVMWw1YVd2OEtxWkFUcEdMaW9YSC9a?=
 =?utf-8?B?Ry9tY3d0NkR0ZXFQdVRIWmM0S2M3M0JPaHBmeW9keHRhMFFrUk4zV3EvenpH?=
 =?utf-8?B?enhuV3FxK1hnMUE1OWZWR0hmK0JhN1pJeTlDeHRmUC9iTG0rU3hycityWnVh?=
 =?utf-8?B?VXNLdGJjZ2lwT1RHNENuZHRWOFpBZHlwZUh1RzYvWFp5Z1J5UHhEN0J1WFhH?=
 =?utf-8?B?YUtKQTlySXZ6MEN4aTBFYXVocFpUTFVwb05aQXg4cnJaRys1Q1d5NGZmcGZz?=
 =?utf-8?B?Q09USmV3clVNQlVkcExLV3dvQVNSTzFjZjB3MWsyWTBZaXdwMFQrSGZKTW1N?=
 =?utf-8?B?Mks4WUhPS3Vzd2JZdDdvRGZ3SXZsQ1RUYVN1ZERZaTZ5Nnk3NlBXb2hEZkgv?=
 =?utf-8?B?M0habWFSNU5kZ213NE5WdlBuRDgvM2hUOEcvVkVhU1ZydGQ2S2g1ODM1R29O?=
 =?utf-8?B?V3JNbEc0M0N3bHVUeHcyREZDb3pmMVcvS3JBM3NhWlJxQjd1YU5EY1hEZU9U?=
 =?utf-8?B?a1Y2Tkkvb3k4UG9qMy84THdTdWJiTUdOU3FwME9yUzVXSkFIUEZ0NHE0d1Rx?=
 =?utf-8?B?dEhkU0VYZ25oT29ZSnRZVVJLWUVtWHAyRE5zQ0w5Y1lRelJPK3dPNnVuQjFI?=
 =?utf-8?B?bElEMUFoMG1WeGx1UFNTak9mcXB4Q0t0alZaTHlUOSs5ZCswbWtRdU1MVTBJ?=
 =?utf-8?B?SHZ6dm5hUzREZmZQMmt1andjb2RsT2l1dVpoTURkcWtWRkFLOWJ3WHgvaWFz?=
 =?utf-8?B?R0cvcnhyeExTdnJqS0hKMVhDa3dTNU1hWWFqbzVEOHd6dTRTR2NjZHRJSklo?=
 =?utf-8?B?RU5pYzJERjA5dlJNZUdZMk5QRG9Ra1pyZUw2QzQxc3U4algxOHROWE8wbGNZ?=
 =?utf-8?B?ZldPRE9WMEc5YVd1K1kySEkrOVE4NDVidkl4a3RMdzBZVUFJQzZSWC9QdFpm?=
 =?utf-8?B?dXBROVhtMFdEOFJOamw3QmNSY3lCS0J3MExEOXRIWXJMZW10MDZjT2t4OFBr?=
 =?utf-8?B?WElMTDY3b3RVajc5TzNTU3pXME9lZDBGNEhxODk0b0RtZEVybWNiK3dBS3NB?=
 =?utf-8?B?WDQzWE1MUk1ISzdNY2JyN25CSTBHQk8rSzVWanlhZElYcGprcGhxN1g4emFO?=
 =?utf-8?B?L2FBWjBYTDAwRjN5QW9uY3E4NHA1bFNGM0E5YllueHBha1BUOW5wdm44RERx?=
 =?utf-8?B?UEhmMzRUNm11U0tKUDNlRGxoVno5eW5Jamc2cTk4UXhGejF4RXp0MUQ5eTg0?=
 =?utf-8?B?ZytRSzJCTzNJQTkwTXV6aXhMYzN3WWN5VWt6TGdyMmVmWlBFZ0FCaHVKTVpS?=
 =?utf-8?B?OHZxd09SSG9HT2YzS2xNQ0lUSjlJbDVxYjhBQXZscEtKdlpLM0E2M2RtZGha?=
 =?utf-8?B?bEl5OHFyRGhQOG53WGNRL1J6eUZzeXQvNkNMK0tQNUpXNXcyWmFYUXA0TXFR?=
 =?utf-8?B?T3l4SXJ4cm1vY2s2MWY4YzgzM1cyRmp6cCtVSVBXeXdyT0NvUUlxTGJBTE41?=
 =?utf-8?B?a1BaZC9reTFhay9KWVpxcVRPOWpOaGhmbjN6K0FUUE0vbWRQUUtMblZQTnhU?=
 =?utf-8?B?N3BPeWFRWXJ4aDlwcEI4bitVYm9EYlU3YXd3MGJDbXJLWnNvQ3ZpanZrYUZ1?=
 =?utf-8?B?eWhlbVhQOHJ4TDdMUE5nVTROODRqRGZsMkZWWVBWRDcyM3I5QTIrbU1YMmw3?=
 =?utf-8?B?OWtudldobXpPczgxblErOWJjWE5tSUxyWGprdWhCbTA3QUtwZm4vYzZvSVJU?=
 =?utf-8?B?UnlZeXp5NDhNWENVSmh0NlcwVzl5dUJEWHRwQTJFRmdTbm5RQnVQRGpNQ3or?=
 =?utf-8?B?K2piRG11UUl1cGxpTUF6aFE2T0sramdnUkNTTWFYOEZYeEVaM2c4WlVaZjM4?=
 =?utf-8?B?TEI3c3d6U0tCby93U0NoNHdtTHlRQW5ST3hYM3pSOEduSEtHUURYRHNzZFJZ?=
 =?utf-8?B?T2VCVkw4blVIN01pNWtpRGZ5b0xRc05qZGJUVmE3UEN4YUQzaW04MFVHaWpz?=
 =?utf-8?Q?nM7D2hrgmanyCB5yonJzPLYnFyJRaU7pNfJ9q?=
X-Exchange-RoutingPolicyChecked: ZgumpDlyG8HIg7WQ3OxPoR8e7N3EaezwvhcEIev5leqnpvgbkOfhZL0aPGdoMyr7R4YrG2f5XGO3NMwXGsA8sWVhudsRIp4tTEB2yFh28WDxV41lYRCUDOXWW/Mui+NjrUG+5J4KB3q6FrlLD0ZZGdF/cxYt+79CEMjc9EQqjCDWsOpgnC0lkLDR30JTuBhshadiIbSwvbrvL3GHcvIGqvWByeWhHCnNGi3aMKtS5o3I2SeXrp19t/xbGWRV2KPqE4eH2zVZu7bqR1+8uUe+XS3ApFAIpyl99/5gMX7deGrDXQP/uIkCXVx9wqdnedE7RO1zCcwRvc7xKcKhyVhV0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0538f5-9ba4-4071-325d-08dea6640a4a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:56:13.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK4iX9bWUcm9SMignKUsg4y8x3Gj6TzvhLP6/f8gpUGBse2ftWFUwDNkbFCmU5tsh9aO2nmJ0zH/xdAHXeW4j0d4DybCGO7YmBhKubKKFuy/IWgZlFBD3xyxxMGFurA2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

Hi Vinod,

On 16-04-2026 14:55, Vinod Govindapillai wrote:
> Code to read the FBC status from the debugfs is being duplicated
> in many places. Extract intel_fbc_get_fbc_status() to be used as
> the single source to read the current FBC status.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c | 55 ++++++++++++++++++++++++++++++++++++--------
>   lib/i915/intel_fbc.h |  3 +++
>   2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index b8c714d43..47f0e2fc1 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -22,6 +22,47 @@ void intel_fbc_disable(igt_display_t *display)
>   	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
>   }
>   
> +/**
> + * intel_fbc_get_fbc_status_crtc_index
> + * @device: fd of the device
> + * @crtc: crtc index
> + * @fbc_status: Buffer to fill the current fbc status
> + * @buf_size: Size of the buffer to be filled
> + *
> + * Read the debugfs entry for current fbc status of a crtc
> + *
> + * Returns:
> + * None
> + */
> +void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
> +					 char *fbc_status, int buf_size)
   The function name has redundant "fbc". Please consider renaming to 
intel_get_fbc_status_crtc_index?> +{
> +	int dir;
> +
> +	dir = igt_debugfs_crtc_dir(device, crtc_index);
> +	igt_require_fd(dir);
> +	igt_debugfs_simple_read(dir, "i915_fbc_status", fbc_status, buf_size);
> +	close(dir);
> +}
> +
> +/**
> + * intel_fbc_get_fbc_status
> + * @crtc: CRTC
> + * @fbc_status: Buffer to fill the current fbc status
> + * @buf_size: Size of the buffer to be filled
> + *
> + * Read the debugfs entry for current fbc status of a crtc
> + *
> + * Returns:
> + * None
> + */
> +void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
> +{
> +	intel_fbc_get_fbc_status_crtc_index(crtc->display->drm_fd,
> +					    crtc->crtc_index, fbc_status,
> +					    buf_size);
> +}
> +
>   /**
>    * intel_fbc_supported:
>    * @crtc: CRTC
> @@ -34,12 +75,9 @@ void intel_fbc_disable(igt_display_t *display)
>   bool intel_fbc_supported(igt_crtc_t *crtc)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
> -	int dir;
>   
> -	dir = igt_crtc_debugfs_dir(crtc);
> -	igt_require_fd(dir);
> -	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
> -	close(dir);
> +	intel_fbc_get_fbc_status(crtc, buf, sizeof(buf));
> +
>   	if (*buf == '\0')
>   		return false;
>   
> @@ -51,12 +89,9 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
>   	bool print = true;
> -	int dir;
>   
> -	dir = igt_crtc_debugfs_dir(crtc);
> -	igt_require_fd(dir);
> -	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
> -	close(dir);
> +	intel_fbc_get_fbc_status(crtc, buf, sizeof(buf));
> +
>   	if (log_level != IGT_LOG_DEBUG)
>   		last_fbc_buf[0] = '\0';
>   	else if (strcmp(last_fbc_buf, buf))
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 8e2662824..f8a506f23 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -17,5 +17,8 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
>   bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
>   bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
>   bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
> +void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
> +					 char *fbc_status, int buf_size);
> +void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
>   
>   #endif

