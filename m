Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A570D2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 04:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AC10E35A;
	Wed, 23 Oct 2024 04:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWyB1xzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE9410E072
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 04:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729657266; x=1761193266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y3X6khemZurpmq6WMFI7cMQCLYsXY0S5++AtQ323wKU=;
 b=dWyB1xzNmsmlM3rRpa+UceeQpENyRKpEWTkghCNLiltCxAh9BuqwPaYT
 fsHdaTnol1Lgx4uMVyDWGXRr0gVKerRYbGKQ0JHVc+kKjZudkJpKfPAdg
 Q1++iHV6GUHHfvJ4L3WMoUEYfkxpoHqw/f41oIadBxNmeTY/o29Hl8pUQ
 20F+Itb0GXBAADZpBrcFlJ1C69Gpzu9+xJp543dVrw60yP96hhxC+k1cC
 N7W/c0GjyQ8BHAmKuXhMQWd1T/Dqso3BrdrJ2ourzHvp7pML8Mm4tPnPb
 SLDg06MhnVoOCYlJk8fhIHmVU6iJDzFcLEXSBea2sT3/qrfg5BmG9ZmWL A==;
X-CSE-ConnectionGUID: M0AH6SLiShWQ7NS6+jc7cw==
X-CSE-MsgGUID: 5BGxyusDRJKBUwUy81Cgvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29164527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29164527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:21:03 -0700
X-CSE-ConnectionGUID: YumOidYyQ6SryIRY6NW0fQ==
X-CSE-MsgGUID: gHHYckaCTwu47QNWqoMoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84054371"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 21:21:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 21:21:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 21:21:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 21:21:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 21:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMCPq7AUp9KqvzSztT3/+mDlUw58ctiXcUZujXUryeTv+GG3N4EvtRpZ0oWs4iHUuDp/sUwWkrDd1vnrOb58+hvMPzpSNiAcViDsH1OvhE4E9Lc9eoWjTyf/u49sk/+8qCrl4WkDT29PQIb+idHaHqC4MqGFksqt3ZEY+NAoE7Vw+aBf8sOJlr7q8Iv5ytswtP/OFap6s/UbPwZBS4IE8jBe81F9H9NV2KC04nzul8va9/8ePBUNRX9Bs2WZlFt5GQIYNQ2HYeTj7RRheLiqutVZ+dlkIejOku7JrDEi/2czL77lW+8dl6DOydzPfLEltCVwmgZof2Ud1ow7ZYKFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+Q3g56lc/h2sw0DmxHLse6POHow6ZcbTRzq+/1IBI4=;
 b=WAWVnoapBRQcauewOAjFfAJJdK/l+k77+MYNS8Q6pRrZoqU52x4TnXuXXSd37si9AUlW0Ux2Wyw+Ly8ykiusJe6eJsw1EEtOYE8XssUsSqXr6WXdlb2KTduwVnPs3tcOdeg5F84xptPjspLv3XWISqXWHv+5A+x4o9tVyXwOfjslEZYQahsuOzwu0CVuDXa6imqJb/gpmnfQM6yk8byyR4zOBggnlOr/92wOH35sk/oPX+qczofLsALg7Tx7MN8y1onHUKfq1U+H/UqFgTfGr4ymmjyg397y6UrSPsvJdVOiLP3QufIK+cTcupTY0VhyHjFuqLxwJBbj1nJQESPe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Wed, 23 Oct 2024 04:20:58 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 04:20:57 +0000
Message-ID: <b26d474d-79f9-480f-9bf3-71cb64ffe0de@intel.com>
Date: Wed, 23 Oct 2024 09:50:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 3/4] tests/kms_sharpness_filter: Add adaptive
 sharpness filter test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
 <20241018190627.1367970-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241018190627.1367970-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM3PR11MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: e73ebaa5-87f3-4064-f4e8-08dcf31a17d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXhoNXVQbXF2U3NvMnlTd0p6MU00UG51YXpHdmYrbHpkZmJTbTVoVlBxUTli?=
 =?utf-8?B?K2s4Z1lEVXA4VHpKV2krOE9OVExaRDE0bFRZSjNNdzdnZkdEMnlZenpZVzlI?=
 =?utf-8?B?RENwaUFiNW1LbDRmNjNydmFYMzJWbE10WDRPVUgxWktMaSt5T0pmRjkvVUlo?=
 =?utf-8?B?Z0xNWGhmc3k1c09iODVNZW9vdE92a2N6cVRKQ3RLc3U5VllPb2dsYUVwcG1E?=
 =?utf-8?B?MU9VaWhnTVJnS1FhMys2SlNLWStQbFAzTzBvdUtyRXpPcUV2eW54STJKYnZH?=
 =?utf-8?B?U1FQTElzZWU1Vko4c0hrM2REM0o4OEV4M1I4YkRGNWMyWndEeEU3VjdPcTFE?=
 =?utf-8?B?RmxoM2VYVTVuVkYwMVYwc29hWEc5Sm85Rm9xRlV3b1psd2RlRlZNRmh4eENw?=
 =?utf-8?B?QklmWmRhL2JOS0daNmRVOVNrZ0VmcWdTRExsN1ZmYTloOWVIT1dWblBGeVQ2?=
 =?utf-8?B?R0hneVF6WnlibnJUY3ZkVDJ2V1lSdDB4TEloT25SeE42UHRsOEg0ODdMRk9S?=
 =?utf-8?B?RHA4a25SWUl4aSszeks5S2prK2R1THZyOFhVSkpDQzBiS1A1ODdSbEVhMy84?=
 =?utf-8?B?V1lxKy93RXgwQmVIcEhCNzVYK2J6ZENBclZXcU03anNIRzUzNEJnNEFybVc3?=
 =?utf-8?B?YXhtb0FaMFRZcHdQVXBGMjJMSkIyaUJNN2JnTU1JREQ0Vnppa0piWGN3aFl6?=
 =?utf-8?B?dFlua3c4MmRMY3Fyb0l5ZVJCSzlvUTIxWXlzWGhlbjRqelZjalpRNElzK3ZW?=
 =?utf-8?B?TlVRalM4Q0FuZXp4UU9qczU2Y0x3UFVWU0Z1b1FZYXdlT1dMR2pyT3NUM1Bs?=
 =?utf-8?B?YWFVRVdGMjRmM1cyd01JQjBYSE1Wc2hUSjFUdWJ1M3VIOTJOUTJzSkpTT3RY?=
 =?utf-8?B?WmhGUnExMnpqRVlBT2srd3hYM0IxdUpCVmRqTDRNWXJMZ2dNRmk3ejFvZ05x?=
 =?utf-8?B?UDd1czROK2l4K1VIQmVoQTdXQ2RyMmFkWnJmeTVqcUh6VUZVUGJqb0FmSWM5?=
 =?utf-8?B?ckltM0RUNXFJVlN0Z3g4YnBwcDRSNkhJdWFMazVXZmtlUnlEa3RJalBIL0lw?=
 =?utf-8?B?SU84T1hCYXRQOUJIbHU0QitiZDZpS0FKcGRPQytDcUdNKzhoN3liVmFYNk1E?=
 =?utf-8?B?UUZMeWVETSszeVpHaVJSKy9jVERocXh6UURnRWRwT0M5djVZU2RHK05hUU5v?=
 =?utf-8?B?dGhtdGY4cUlVaDY0bmZIQ0xXN1hadHJLcURNTmt2QWw3dDJ4Rkt1REdJK08r?=
 =?utf-8?B?REMxaTJsQXJJN3hheStVaDQvL0xaWVJtQXhEeFJTTzBWRElTUE1DUkpPMGJ3?=
 =?utf-8?B?ejQzRTMwS3JYTG1mQ0w4VHFEYWNUK0l2LzFnWk9ZZEhHNjJ6U285Vktma1NF?=
 =?utf-8?B?WWRjYklhcHgvRmFoRk9QK2EwKzBqTHJCTHBTVW50bEJyRHVsTEVkeFR4WjZw?=
 =?utf-8?B?a20yc2dRbG5BZjdQWDJtdEd0b1VBVmxtemFkY3FSaTFZMWFCb0pQNnpSUHJ6?=
 =?utf-8?B?TmhiMmdWVWR0VThSSVkyZDhvNjV3UlU1NkRDRnhVQUNmQkNOb3l0Y01hcm93?=
 =?utf-8?B?aEVTZTBsZ2pkNHMyRmlQYllDd1d4Y01xUFNVa1VuUVJJUGVWdFB4RHlqaVpR?=
 =?utf-8?B?allvU2xhSnV6OWdmWk9QSnBLTU0xeVpiZVlPYitjR2JLMXFFb1B6K2pVcm8x?=
 =?utf-8?B?U2JkR0tGNlprejAzbjV6Z01xVnF0NEEyZTlteFU0VHdUQkhUR2NZbzR2bUxV?=
 =?utf-8?Q?N45njhJTBwd0hNPCQyoFcdRyVxsfES5RJ5Ymi6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NvdWZ3RDA2ZFB5S3MyVzhVNWpLUTF2N1hDZGhKRGVROXFvclE5TlFaeElM?=
 =?utf-8?B?ZHk4emlZWFVFTDBpeUoybUNzRUF4bWJ0SEo5aUQ5TzZKNFViVXFpcHZvdURY?=
 =?utf-8?B?ZzM0dHo1dGRPUDFBSzlnSkRpV1lGQ21CbVMvSVE5Q2REMVpBc0hKWDViTDh4?=
 =?utf-8?B?TDgrZTQ0aDliQnpzZmpoMXBSbHJuSW9WNmdpczFCblRjamM3dkhGNWYva0Zj?=
 =?utf-8?B?eWFySHo0WDVBRkdmUkNWRFBMVEEyaU03SzlvcUwvazQxOU5wWlNBQkRpUU5v?=
 =?utf-8?B?eStBQ3ZTbDhsWlVlWWVTaGpaTVA4UjdXQ25RNjVHUWlRc2tLRisvWVJjOEtC?=
 =?utf-8?B?U1grTDRKNWEvNkYxY3g1YzRCVTlxUjBlbTVHYkN1bG1IUmR6WEhYdlZCUDNX?=
 =?utf-8?B?RUtMWDBMQU9XTUE4MXdaSjBKUFgzRVk4c0s3dlhlb0UvT2tIVFpiYXBoalZ0?=
 =?utf-8?B?dUpDY0gxMThSZThmM3NZLzA1U1BmQ0FOd3Q1RXdFbEdIRnBYc0lPZXdZM2d4?=
 =?utf-8?B?aGpxL2pZdW52eDFmSUp2Qzh0a2xzb2VTQXRnL0NaYWpXSHhZUnI3V3l2ZXFD?=
 =?utf-8?B?ME0xbCtlVktzVEFZQ1czVWhBNWpqMDB6YzIzWFczZDNvYVVuVUNCY2JIRkJo?=
 =?utf-8?B?RlNxRktFdjA5b3BsR0Z4S2JmckZnd1k4L2hPcEJlZFJNZlcrL1Y5UDgrWEVr?=
 =?utf-8?B?NzN3MTAyL1FXQVpzbjQwck82MXFwdnM1aFBxTXQxd3EyajVuKzhrVWsyUHNz?=
 =?utf-8?B?Sm9vWkJER3ZVbG1uWFNEN1ltdWhQYUFBaUZSb01vNkpSdE5pY2VoWFZNN1lx?=
 =?utf-8?B?ZDE5L3A4eVlpTVliUklsb1IvOHdUTFozUEYvNTZNYVNpRWhzNVFpZU53Vm9w?=
 =?utf-8?B?dW1zK3FOL0NoRUVYTEhRWmttL0xSd0FndjgrWnJyWkhXOTREVzJnUVJDT3lI?=
 =?utf-8?B?bDBSbmFQcTJ5bDNCbklHS2xoWjlicGdPR2VEKytJd01OUGtQa0N2TWFnZXlJ?=
 =?utf-8?B?WGZkS0JFTHVHY2hZMW40b1FPckdybGZzYndhS3NrOHlSdEFUODJ3ajZhb2cw?=
 =?utf-8?B?eFFuQnB1am5IVVBIRzArc1hQOElrVkRkNTd5K05xaXpUUENEWDE0UzVTVXBw?=
 =?utf-8?B?WUdCNGtUNXN6alpFUldFQ2krT3c5RWpkUXlDTSttaVFCMk9BR01pV3ZFay9k?=
 =?utf-8?B?SVhhUTdWT24vWFpmRXppczd2YXhEVEh6SmF4M0d4eWhjTk1nb1czS28vTVM0?=
 =?utf-8?B?eHRqQ01yL3JzajJsSkFIMXJmRUtvVE1Ncy9GaEx0Qk1wVUJianpNSGcwNmRr?=
 =?utf-8?B?bFNIdnpESUhiejNzamxHNVZHYlRaV0VrM2Z5b2lSRnhhVCt3ZkhUMFg5MTQz?=
 =?utf-8?B?WXVwaUxzYnpiNTkwMjVraUUvWG5rMHJoU3VKQXdURlVLYmFmYzhncTRuTGRs?=
 =?utf-8?B?T2VUTXFkSjVwTCt6RkNxQ0tJWU1VeDI4SDlUa1BDbVFWc3l0dDcvNUt5bnY4?=
 =?utf-8?B?Y0NqWmxCTDZCZ3BGOUlpSkZRRUVMalAvZ3VjMjU5VHV2NkdyNnpKbnppaDNl?=
 =?utf-8?B?Q2xBRzJOVUdMRXFtOHlMQ1g2U0xtbnpQWUx0ZG1nNGpEK0JxdmluQytpM3Rk?=
 =?utf-8?B?aEoxWUYrWnUvV0N6V2RIM3lzVjhMeWpqTGUvYUNuOXBzb1VDVDlaRDQvdzFp?=
 =?utf-8?B?U2owS1cxNDMvOUZueGxBQThDcWU5blBtWE1HUXdjREh1L3k4YVFtMWRTL1FP?=
 =?utf-8?B?YzZENERHUzVTMHhuSlo4WEM4QjFuK3kvbXVLbG1MT1hiK1BqWjNSY3hxZlJl?=
 =?utf-8?B?SkUvVzA4N0tlZFMwVkZxUmFnd2VTVWlSNFVVM011eEl6Y2gyY2hWUUE3SXQr?=
 =?utf-8?B?UEYvZVIvUzQ1OGoxSnQrYU4vcG1DdjR3aWNhNkVJQmtLOW5pTXcrM2UxL0dx?=
 =?utf-8?B?QU9zSkZrRDVtbUpoVElLSWJ1STJ3NXJxRnZlQXNkQVpMb2VXQ0FyVUxXWWtZ?=
 =?utf-8?B?dHNFN3NQMGx2ZlMrSmFEMTNvZjlxaUNKYTJiQlVmWkl1dmtBUHF2STVXdzZ0?=
 =?utf-8?B?UjhETndwRSsxUGJ5MEVrUWtONE9nbTd5MXhvOFNWZjN3YmZhWGNwMFgzREQy?=
 =?utf-8?B?Z3lUL3NJOUlLa3UwTTQxNmFJcHdGbmJBSVVzMmh2Y0luQzVNRUZpdk9keWxV?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e73ebaa5-87f3-4064-f4e8-08dcf31a17d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 04:20:57.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLrzqCw1HzYObRNVw+csgz4gNGfwGetcL/OTzGtbMRMAzkRY6+vznIdPV6ZIkZVVzCBvaEo7110rBnkBt+B/4OxnYCDz6ynAc6BXTD0VtbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
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


On 10/19/2024 12:36 AM, Swati Sharma wrote:
> New test is added to validate adaptive sharpness filter on
> LNL platform. Various testcases are added to validate this
> feature. These are non CRC based tests and manual verification
> is required.
>
> Pipe scaler is repurposed to perform a portion of this work.
> This means pipe scaling will be unavailable while the sharpening
> function is being used. The other scaler can be used for plane
> scaler.
>
> 15 subtests are added:
> 	-basic: verify basic functionality
> 	-toggle: switch between enable and disable
> 	-tap: verify different taps selected based on resolution
> 	-modifiers: verify casf with different modifiers
> 	-rotation: verify casf with different rotation
> 	-formats: verify casf with different formats
> 	-dpms: verify casf with dpms
> 	-suspend: verify casf with suspend
> 	-upscale: apply plane scaler and casf together
> 	-downscale: apply plane scaler and casf together
> 	-strength: vary strength and check difference in sharpness
> 	-invalid filter with scaler: enable scaler on 2 planes and attempt
> 				     is made to enable casf
> 	-invalid filter with plane: enable 2 NV12 planes and attempt
> 				    is made to enable casf
> 	-invalid plane with filter: enable 1 NV12 plane and casf and attempt
> 				    is made to enable 2nd NV12 plane
> 	-invalid filter with scaling mode: enable scaling_mode property and attempt
> 					   is made to enable casf
>
> TODO: -Enable casf with varying output formats (YCBCR/RGB)
>
> v2: -Updated modifier type to uint64_t.
>      -Replaced IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
> v3: -Updated setup_fb with height and width.
> v4: -Renamed tests/intel/kms_sharpness_filter.c -> tests/kms_sharpness_filter.c (Ankit)
>      -Added subtest invalid filter with connector. (Ankit)
>      -Updated documentation. (Bhanu)
>      -Used driver_close_driver instead close. (Bhanu)
>      -Added check to avoid debug print for invalid tests and filter strength = 0. (Ankit)
> v5: -Instead of using default strength as MAX, use MID value strength.
>      -Add relevant debug print for test skip.
>      -Fix indentation.
>      -Renamed invalid-filter-with-connector -> invalid-filter-with-scaling-mode
>      -Reworked on invalid-filter-with-scaling-mode(), added provision to
>       validate other scaling modes.
> v6: -Skip test if ret=-EINVAL for downscaling test.
>      -Change if() for tap subtest.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 750 +++++++++++++++++++++++++++++++++++
>   tests/meson.build            |   1 +
>   2 files changed, 751 insertions(+)
>   create mode 100644 tests/kms_sharpness_filter.c
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> new file mode 100644
> index 000000000..5640b40d2
> --- /dev/null
> +++ b/tests/kms_sharpness_filter.c
> @@ -0,0 +1,750 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter
> + * Driver requirement: xe
> + * Functionality: casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify that following a resolution change, distict taps are selected.
> + *
> + * SUBTEST: filter-strength
> + * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + *
> + * SUBTEST: filter-toggle
> + * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-modifiers
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + * Functionality: casf, tiling
> + *
> + * SUBTEST: filter-rotations
> + * Description: Verify content adaptive sharpness filter with varying rotations.
> + * Functionality: casf, rotation
> + *
> + * SUBTEST: filter-formats
> + * Description: Verify content adaptive sharpness filter with varying formats.
> + * Functionality: casf, pixel-format
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-scaler
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 plane scalers have already been enabled and
> + * 		attempt is made to enable sharpness filter.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-plane
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 NV12 planes have already been enabled and attempt is
> + * 		made to enable the sharpness filter.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-plane-with-filter
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 1 NV12 plane and sharpness filter have already been enabled
> + * 		and attempt is made to enable the second NV12 plane.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-filter-with-scaling-mode
> + * Description: Negative check for content adaptive sharpness filter
> + *              when scaling mode is already enabled and attempt is made to enable
> + *              sharpness filter.
> + * Functionality: casf, scaling
> +*/
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> +
> +/*
> + * Until the CRC support is added test needs to be invoked with
> + * --interactive|--i to manually verify if "sharpened" image
> + * is seen without corruption for each subtest.
> + */
> +
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
> +#define NROUNDS				10
> +#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
> +		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> +#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> +		||  (type == TEST_FILTER_DOWNSCALE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
> +		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
> +		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> +
> +enum test_type {
> +	TEST_FILTER_TAP,
> +	TEST_FILTER_BASIC,
> +	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_MODIFIERS,
> +	TEST_FILTER_ROTATION,
> +	TEST_FILTER_FORMATS,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
> +	TEST_FILTER_STRENGTH,
> +	TEST_INVALID_FILTER_WITH_SCALER,
> +	TEST_INVALID_FILTER_WITH_PLANE,
> +	TEST_INVALID_PLANE_WITH_FILTER,
> +	TEST_INVALID_FILTER_WITH_SCALING_MODE,
> +};
> +
> +const int filter_strength_list[] = {
> +	MIN_FILTER_STRENGTH,
> +	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
> +	MID_FILTER_STRENGTH,
> +	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
> +	MAX_FILTER_STRENGTH,
> +};
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} modifiers[] = {
> +	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> +	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> +	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> +};
> +static const int formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR16161616F,
> +};
> +static const igt_rotation_t rotations[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_180,
> +};
> +static const uint32_t scaling_modes[] = {
> +	DRM_MODE_SCALE_FULLSCREEN,
> +	DRM_MODE_SCALE_CENTER,
> +	DRM_MODE_SCALE_ASPECT,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	bool limited;
> +	enum pipe pipe_id;
> +	struct igt_fb fb[4];
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane[4];
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	int filter_tap;
> +	uint64_t modifier;
> +	const char *modifier_name;
> +	uint32_t format;
> +	igt_rotation_t rotation;
> +	uint32_t scaling_mode;
> +} data_t;
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static bool has_scaling_mode(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
> +}
> +
> +static drmModeModeInfo *get_mode(igt_output_t *output, int tap)

I think we can optimize this.

We are currently looping through the modes for multiple pipes x multiple 
taps.

Instead just like filter_taps_list we can have corresponding mode_list 
which we can prepare before the test.

Something like:

int get_modes(igt_output_t *output, drmModeModeInfo *mode_list, int 
max_modes)

which can fill the modes and return number of modes filled (we may or 
may not find modes for each tap).

Then we can just use the modes from  this mode_list.

Regards,

Ankit


> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *mode = NULL;
> +	uint64_t total_pixels = 0;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	switch (tap) {
> +	case TAP_3:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +			if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_5:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +			if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
> +			    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_7:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +			if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +
> +	return mode;
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup_fbs(data_t *data)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	cleanup_fbs(data);
> +}
> +
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	int ret;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_output_t *output = data->output;
> +
> +	data->plane[1] = igt_output_get_plane(output, 1);
> +	data->plane[2] = igt_output_get_plane(output, 2);
> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +	}
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 640, 480, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(ret, 0);
> +
> +		mode->hdisplay = 640;
> +		mode->vdisplay = 480;
> +
> +		igt_output_override_mode(data->output, mode);
> +		igt_plane_set_fb(data->plane[2], NULL);
> +		igt_plane_set_fb(data->plane[1], &data->fb[2]);
> +
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_SCALING_MODE, data->scaling_mode);
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum test_type type)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +	int ret;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	if (type == TEST_FILTER_TAP) {
> +		mode = get_mode(output, data->filter_tap);
> +		igt_require(mode != NULL);
> +		igt_output_override_mode(output, mode);
> +	}
> +
> +	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
> +		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	igt_plane_set_fb(data->plane[0], &data->fb[0]);
> +
> +	if (igt_plane_has_rotation(data->plane[0], data->rotation))
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
> +	else
> +		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
> +
> +	if (SET_PLANES)
> +		set_planes(data, type);
> +
> +	/* Set filter strength property */
> +	set_filter_strength_on_pipe(data);
> +
> +	if (!INVALID_TEST && data->filter_strength != 0)
> +		igt_debug("Sharpened image should be observed for filter strength > 0\n");
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
> +		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	else
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		data->plane[3] = igt_output_get_plane(data->output, 3);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
> +		igt_plane_set_fb(data->plane[3], &data->fb[3]);
> +
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE)
> +		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			      "Scaling op not supported, cdclk limits might be exceeded.\n");
> +
> +	if (INVALID_TEST)
> +		igt_assert_eq(ret, -EINVAL);
> +	else
> +		igt_assert_eq(ret, 0);
> +
> +	cleanup(data);
> +}
> +
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data, enum test_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	char name[40];
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		data->output = output;
> +		data->pipe_id = pipe;
> +		data->pipe = &display->pipes[data->pipe_id];
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!has_sharpness_filter(data->pipe)) {
> +			igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
> +			kmstest_pipe_name(pipe));
> +			continue;
> +		}
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +
> +		switch (type) {
> +		case TEST_FILTER_BASIC:
> +			snprintf(name, sizeof(name), "-basic");
> +			break;
> +		case TEST_FILTER_TAP:
> +			snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +			break;
> +		case TEST_FILTER_TOGGLE:
> +			snprintf(name, sizeof(name), "-toggle");
> +			break;
> +		case TEST_FILTER_MODIFIERS:
> +			snprintf(name, sizeof(name), "-%s", data->modifier_name);
> +			break;
> +		case TEST_FILTER_ROTATION:
> +			snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> +			break;
> +		case TEST_FILTER_FORMATS:
> +			snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> +			break;
> +		case TEST_FILTER_DPMS:
> +			snprintf(name, sizeof(name), "-dpms");
> +			break;
> +		case TEST_FILTER_SUSPEND:
> +			snprintf(name, sizeof(name), "-suspend");
> +			break;
> +		case TEST_FILTER_UPSCALE:
> +			snprintf(name, sizeof(name), "-upscale");
> +			break;
> +		case TEST_FILTER_DOWNSCALE:
> +			snprintf(name, sizeof(name), "-downscale");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALER:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_PLANE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> +			break;
> +		case TEST_INVALID_PLANE_WITH_FILTER:
> +			snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> +			break;
> +		case TEST_FILTER_STRENGTH:
> +			snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +
> +		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
> +			test_sharpness_filter(data, type);
> +
> +		if (data->limited)
> +			break;
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'l':
> +		data->limited = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +
> +data_t data = {};
> +
> +igt_main_args("l", NULL, help_str, opt_handler, &data)
> +{
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> +		}
> +
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");
> +	igt_subtest_with_dynamic("filter-tap") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_tap_list); k++) {
> +			data.filter_tap = filter_tap_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +		}
> +	}
> +
> +	igt_describe("Verify that varying strength(0-255), affects "
> +		     "the degree of sharpeness applied.");
> +	igt_subtest_with_dynamic("filter-strength") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
> +			data.filter_strength = filter_strength_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> +		}
> +	}
> +
> +	igt_describe("Verify toggling between enabling and disabling "
> +		     "content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-toggle") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < NROUNDS; k++) {
> +			data.filter_strength = DISABLE_FILTER;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying modifiers.");
> +	igt_subtest_with_dynamic("filter-modifiers") {
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
> +			data.modifier = modifiers[k].modifier;
> +			data.modifier_name = modifiers[k].name;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying rotations.");
> +	igt_subtest_with_dynamic("filter-rotations") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
> +			data.rotation = rotations[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying formats.");
> +	igt_subtest_with_dynamic("filter-formats") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
> +			data.format = formats[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 plane scalers have already been enabled and "
> +		     "attempt is made to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 NV12 planes have already been enabled and attempt is "
> +		     "made to enable the sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 1 NV12 plane and sharpness filter have already been enabled "
> +		     "and attempt is made to enable the second NV12 plane.");
> +	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when scaling mode is already enabled and attempt is made "
> +		     "to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
> +			data.scaling_mode = scaling_modes[k];
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e5d8852f3..7f5bc68d3 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -58,6 +58,7 @@ test_progs = [
>   	'kms_sequence',
>   	'kms_setmode',
>   	'kms_sysfs_edid_timing',
> +	'kms_sharpness_filter',
>   	'kms_tiled_display',
>   	'kms_tv_load_detect',
>   	'kms_universal_plane',
