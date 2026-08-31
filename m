Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86A9C61DE8
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 05:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E450410E5E7;
	Mon, 31 Aug 2026 05:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijt3wHko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B1C10E5E7
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 05:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788154643; x=1819690643;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OaQT/Zip4HPzVArsk+hXmIT397M+uYk48kj7qh3WkOQ=;
 b=ijt3wHkohKVDhdwbaNBIT8kzW/4267J2xFge23ZwM/gIsusSzddTjdTt
 oVkMFDddZ1xulX/o1vC5C+2gqWdtXPAwB3DXNaF3zxllnIZTVVJqwMKUL
 FETibN3MuFpJvYxIjJVk9jXbRlR5iKphbMA/Dob6QGskuuI1t6X+pDjgJ
 /bcO30m5YH9xT/ATzSIAtur2pkIL2GBdmw/ZKUAIYPeHbR14koVurQ/8b
 U/0fB09Fim9+QyTIuFdjG8D0Cvhqw/aRMojr6erC5nV6WS9xdomuFsGZy
 /qLHm3Zf0J6aMTaXW8T7nxaCONcfeRB5kHFFDzS91sIjjk0NNMI99CZVc g==;
X-CSE-ConnectionGUID: qrXSHMKKQz2fEux7PtT1eg==
X-CSE-MsgGUID: mye2kNCeQK+97hULusvxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88756224"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88756224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:37:22 -0700
X-CSE-ConnectionGUID: +/n0qttcSguSrRP1AoBTpg==
X-CSE-MsgGUID: OVkiZ3BiTlSH3pcno0tHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272886022"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:37:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:37:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 22:37:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uV1rw3GvBVIr+3rQSIejqXNz/wJItWsSqR/yCezE4rAwHt7gPusR7aIXLqnWCR4zJ7NLVYK85LhK2eeJF9TSmJWWMw3UOQYftX6Gq9nTvopQglthVOfmWZdUYTbK2inKga/TVViLE/5s6p48sMITtduLZVPt1vLWD+q5Jc6Qe1BLq3fTVsM7BabzIXaRq/NzfXiX17brYkkMNuvFlkTK40SX1Xi94XYCg2jAODpRbbvfucqUZKJf/Yv2H6kXpfhfztbFnEkbnDE8HdfIrkA19UrnKFXsVtLdIOZ97o0qF1EW+B/pd0KPMxCltyjVwc4pF38/ZfQMaqHQBvbArWXu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kFffHmcfe4j5wklu1w8t1rVaR3FG4wVfs8gSGLvgRc=;
 b=s4vYC4iGksi4YDJVpAVMwbA1uEoUrgGqj8k4PHKFZOnbDhKc040i1galQHzeJH6aYL2dzC09ca/649jsj5JXV3yHuADr74qp/scIELl97Mu+kGNZ1mZt2jnVJGTf87FKGc2ZMS6k7n4AgNgGrbJtK5BLz5qNKzcbkvCI5LmhM2nhIuXv05vIIH1p/ktNwAzYgLyv+8Xl83oYtuwbFxMVkmxg+nQfL0Fp9mS/Z41HoyBvXq7rSPSQf5e7hK3ZUHA43I5tuKzCkdRV1WJxyjRJfFGp0g5iUivXwzgVnqhG15+yl8k4eoiJ5RjL9IkaTsseHy7bHsW54Uh+WFUNqH9TGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV4PPFA6EB48437.namprd11.prod.outlook.com
 (2603:10b6:40f:fc02::22c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:37:19 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:37:19 +0000
Message-ID: <872b35dc-96c3-40a5-ae7f-3aa5ee333b0f@intel.com>
Date: Mon, 31 Aug 2026 11:07:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_ras: Add test for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260825041252.1440299-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260825041252.1440299-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|LV4PPFA6EB48437:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3b6f28-a842-4560-33c3-08df0721ec38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N92TiCH0r91f+5SrDmyutUzMy4TtfQqCY/S9cXbav1qQU83r1+dxgMLO4RJUXaG/tAxxcu4OAdJaG7lT8w8R3ne1Rxdp++SbwMNDokS9IL3DGzB7xZvOAraYkIuA66IS0qhrYLfvqSqEc51flqZLsMU6rj0bdOnj4t+UiPP77o37YucN3el1uKw5FB0juj2CxKGLvjyGyTx7lVgkH7pmtP8kyZiLtixS6souJsA1QRWswM2A0brtY0ES4aBmgPIjObYzCukM5wXAfD6zXeFleWjFKCISXcHRCWoVRRWU3dED2E/jbfOap/VrN/7VXJqnNbJ05FB5HhXKlBzCl4Nn/KcdxkLgPtlRzCLhgboNmAbNVkmCIv06KtyFbdKZkyka+pqACHYegTrNyXtmY6TOLUdeWgkzs6loxkTiw0/7B9dqwwLgCGuRBAVem1mMEdv0PFa+nYNKqd/ESW4HJKAO0Zi8IQnEleDWtoPm+y2WeBhtcjt6BaRv0QRHqNs0xohFH49oT/Tk7G1BrKAMolPFT9uyV1pYYVVQi9yImmpkgWrTTdg1RxOqlucF3DQmF4oUXwuv90U9hj5etR86byt/r8DDFUh9KAzHFnFEB/ZsP2FfDEhyL5fVCOrmXfB4R3XdePpiGmqCC55Hiqn3q9I0l9+8tIyht3mxoebI5p60Yy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGMxMTNDTHc0Slo3SVhBdkd1aE5xYzB4clUrZ2RtK1Y5bk5jU0p2SHF1SjY5?=
 =?utf-8?B?UXlIQVVWWkk1dFVXTm1vYWVJU3NoZElCcDRsRmdhZ2xiWEg1WlZSNEtFSjZy?=
 =?utf-8?B?R0RmK3FvcmxCUlVuRm1WV1RmS29tZWtpQmZQOExpNUNRR0ZiMHFSU0d5YnI2?=
 =?utf-8?B?Nmw4NmlObFpMck53TFpnVk9hL1QrVXZld2ZxY01Wd3B4aWRIZVd5QUJtZU5l?=
 =?utf-8?B?cnpmVmUrc1gvWHB1Q3NFYXVjR0ZUM0FBS3JiQ1cvWGdGNnYrZE9rc1U0Tzls?=
 =?utf-8?B?VU40RnIxdEdpMy8wZ3ZxdTJBWDdmWHdZTkV3bG1BditYT09DVXV0bFNmc3B0?=
 =?utf-8?B?WGpZSkd1cXdzMHpZT1pjdTY2MFdPVGRpTXF2c2tBbzA0ZGtiUENTWDFMSXV2?=
 =?utf-8?B?Y0ZuZk96ekNnZlJJWm5ZbGpubS9JNG9VUE4yTnNqdG1qV2VKZkxvckZHZ0s2?=
 =?utf-8?B?dGJuVERvM0pJd0xmdEdNYUNtOExBZEFUOWtuNVNkYUdJZCtYNk8wbFdlNTNP?=
 =?utf-8?B?MGFTdEF0aCt6T0p5TkVpd0RlSnE2eWVOcDJjN2xRVGcwaDBQSElIMzRCN1cy?=
 =?utf-8?B?c3dVUmxsd2RyaW90c0lsS1FManhFN3p6Q2ZnSyttbGlYOTBBbENwY0JYencv?=
 =?utf-8?B?eC9lelNUdnpmMW5zR2hhb2REdm14TXkxSVAvU1kzcWhBa3ExUzZPbEM2SlIz?=
 =?utf-8?B?amlFRVpjZ3JVQ3hRVEFWU0RTblR0Z05tNGZQMjNNZWh1MVJOK2dXT3RmMXhi?=
 =?utf-8?B?QXozbEtuNW9USjdCTEdIWlNSZElrbS91Vk5URTg3Y0I1TzBVNDdKL0JQakxh?=
 =?utf-8?B?TE9PWWFvOWNyWkx4OC95NDVLRllYNjlvMHBTdnA1MGp5L1lYeit2b2xVaTJC?=
 =?utf-8?B?SGMwNGg3YWh6MXo5azRDbzRDRUw5dXdKQk56dWVkQ0FRYk1pZFFGQ0FPU3RJ?=
 =?utf-8?B?dU1Ea3BRZ1YrSWJaMmtYZi9Cd25HQVFsV1RNdjdqeVBpUWV5SkpWMmFnS2dR?=
 =?utf-8?B?T1ZQaHJERDE3TERQTWJmTWFBdGM2dzQ0WGFQb2RJKzM1MmFhYmszdUVQTkNM?=
 =?utf-8?B?UEs0Qm55dXgwcDlXZFJFbHBvTHJCWTNUQ1A3ZkhzdnBmaW5oRWh0MzBuMXc1?=
 =?utf-8?B?TzUzUmJ2bkg5U2M4Kzdzc0MrMVF2T0VwQSsxZFFoRHU2K0s3c0N5VzRHaU93?=
 =?utf-8?B?bllqcFNmdCtldzVublZ5MUovdnNGNW5yWW40WldOVGdSdWV4ZGVDUUl6Nnpv?=
 =?utf-8?B?dDNOOUJLY1AvS1l2TmpuMURTMmFRRjVCWUZFdG1rODZGTEhvdW92dExhOW5K?=
 =?utf-8?B?YTArbHZlWUZESVU5RjBCejBmbEcvTnVQL1pJNUc1WldyeXgxaXM1cVIzcHUr?=
 =?utf-8?B?d2d0cDQ3MkgzU2YwRHcvMmR0bGZWVVQ3NlFhWnF1TFhXMmZrL0QzaGEzVCtl?=
 =?utf-8?B?WE1ZV2dXSS9ia0JQZ0VyeTRabVdPUWlsQW9heEFqaDJCeVRGcEw5U28zMytM?=
 =?utf-8?B?Qjh2NmQ3ZmNEZHZFZXZuQ0dYYUFUbHE4Z2l5RE1BcFNsZk11UXFpc0hsaDV1?=
 =?utf-8?B?S0hOTWwyVkpjRXNJcStFQ3hMWTl3eDQrcnhZNUptanpiQXVmVTNBTG9hSFFX?=
 =?utf-8?B?bFIvV1Bta0dHbWE4Qm9rUGg2ajk0aTlSbkI2ajdudnlqa29BdXpHM1VnS2RK?=
 =?utf-8?B?eko3d0ZpNTFsRUhpOHgwQVVxS0pzZFNEd3ZuTk9NRHhlcFZWa2tQcGNnQUpF?=
 =?utf-8?B?Q2xTODJCYVoxTWtVZHdmWURndENBYXFwOWNFSHpOSE8zVkdDNVYzMUJmbzhG?=
 =?utf-8?B?RnM4TUtRbjA1Y3F3NWtYTm5kMjZUQWxuQnNsQ3lHYnNoZThiaFFJWW9KeHZl?=
 =?utf-8?B?bmRpR3NKZmZrelBOcmhreTFKN3VTUkgvL2xpbjQ5ZlNsMXAvM1ZwcjFiSFF1?=
 =?utf-8?B?VGxub3JTNkg4OFBQT2l2aEZqbkdtcnVQQnlSK3Bwbm16emtzOHlNZS9zS0dK?=
 =?utf-8?B?eWl2R3lyK25GZTgxOG1QY3RvZ1p4Mm44dE9BbUcvbjVmT0lvRXNjRFMwN0hh?=
 =?utf-8?B?K05PdkRnRnYzenZjU3ErMTNkL1lUTXJ3anZLcko2dnpCajVWbDJVNXQ2dzU4?=
 =?utf-8?B?RThXcTFKMzNSY2kxUzErYWZrRjVHS2R1QXpDdDNwOUpjV3Y1N0Jzbm1jSkRM?=
 =?utf-8?B?cHlEMXlaVFIzZjBKZU45alEzdXljZk56TW14bWJKRUl0bWZIZ0dHTDVlRXRj?=
 =?utf-8?B?bWwwM3l3ZlNvOVk5SHNaSEVlOFc4Vk1ub0doWk5DRHJMQ05TcXllbytLS1BF?=
 =?utf-8?B?MlRBUUZMR1BsMnlwQ2NCNytqbFJ6YUFpZlA5SnVCNmR6dG84WEx6Zz09?=
X-Exchange-RoutingPolicyChecked: 5aaZ1JzWxXwVahQ8ah23WfRN5KLddC49hu4swDde4ydhlbHs2HfORNtyh2EK7ZFBLKiWVEeaDv/Z42yjG11wUKcVv6b/Y0NLy64jzDQtHjW+SyF6jVtCR8OX8JEXZCzr6f26igI3lF/Afp1Pa+swdod64ptYHMQNdm5nFqoDbfUXhlnKxcwTHKxnz5QZGcmInGOiK/9cKDZq3rFCGM9LW2ETluUbrz/F6RVuXvVjbFVy7eVcft7LJ2HOMaMzYzfDATBMjcxxhW+LnVJW8KOnYPI5k0ssfa+dPD6abk3zr+evuTVQmYNRpsNYmpD+SndX3KKpmSRtUFJOAksvQjfFAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3b6f28-a842-4560-33c3-08df0721ec38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:37:19.1699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVuFyhzfX0M9cr+b1fzlBPvVVDIDvKqeLq4r+RmGvjtFIhWFp1j7EZLJFWjutMzAVzzId672PIPpb2daC6UVYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFA6EB48437
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

Hi Soham,

On 25-08-2026 09:42 am, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions in the
> implementation.
>
> v1:
>   - Platform-conditional skip w/o fd leak. (Anirban)
>   - Restore via exit handler. (Anirban)
>
> v2:
>   - Remove dead-code and extra comments. (Anirban)
>   - Initialize exit handler under igt_subtest. (Anirban)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 132 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..2452f6ff1
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: ras
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid
> + *		state (ok/warning/critical) and rejects invalid writes
> + *		with EINVAL.
> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +};
> +
> +static struct {
> +	int sys_fd;
> +	char *orig_health;
> +} gpu_health_ctx = { .sys_fd = -1 };
> +
> +static void restore_gpu_health(int sig)
> +{
> +	if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
> +		return;
> +
> +	igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, gpu_health_ctx.orig_health);
> +	igt_info("Restored initial gpu_health to '%s'\n", gpu_health_ctx.orig_health);
> +	close(gpu_health_ctx.sys_fd);
> +	gpu_health_ctx.sys_fd = -1;
> +	if (sig)
> +		return;
Keep the igt_info() after this.
> +	free(gpu_health_ctx.orig_health);
> +	gpu_health_ctx.orig_health = NULL;
> +}
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void test_gpu_health(int xe)
> +{
> +	char *health = NULL;
> +	int ret;
> +	int i;
> +
> +	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
> +	igt_assert(gpu_health_ctx.sys_fd >= 0);
> +
> +	if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
> +		close(gpu_health_ctx.sys_fd);
> +		gpu_health_ctx.sys_fd = -1;
> +		igt_skip("gpu_health sysfs attribute not exposed by driver\n");
> +	}
> +
> +	gpu_health_ctx.orig_health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
> +	igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
> +	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
> +		     "Unexpected initial gpu_health value: '%s'\n",
> +		     gpu_health_ctx.orig_health);
> +
> +	ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
> +	igt_assert_f(ret == -EINVAL,
> +		     "Write of invalid value to %s returned %d, expected -EINVAL\n",
> +		     GPU_HEALTH_ATTR, ret);
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
> +		const char *state = gpu_health_states[i];
> +
> +		igt_info("Setting gpu_health to '%s'\n", state);
> +
> +		igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
> +			     "Failed to write '%s' to %s\n",
> +			     state, GPU_HEALTH_ATTR);
> +
> +		health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +		igt_assert(health);
> +		igt_assert_f(!strcmp(health, state),
> +			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +			     state, health);
> +		igt_info("Verified gpu_health state readback for '%s' successfully\n",
> +			 state);
> +		free(health);
> +	}
> +
> +	restore_gpu_health(0);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +
> +	igt_fixture()
> +		xe = drm_open_driver(DRIVER_XE);
> +
> +	igt_subtest("gpu-health") {
> +		igt_install_exit_handler(restore_gpu_health);
> +		test_gpu_health(xe);
> +	}
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..3c2d4fdda 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',

With the above change looks good to me.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>

