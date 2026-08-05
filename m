Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD16C55ABA
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 11:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57C410EE21;
	Wed,  5 Aug 2026 11:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAu3GxoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA84510EE06
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785930897; x=1817466897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hykLQiNTYq9HCzoxm59SBQMNi26JqJ4dFpEkkB3zEGI=;
 b=JAu3GxoIgJUTiGraF2UdzZeGMiCrhKTULaIlmZcY1X1//XkOnv2nC8JZ
 9LjanFswlbFmnsdD7/hozVq7S4YZ41aZOaE7wUR07E0Zv6ENzOTmMagOK
 j+Tgw3cofC6TAitxtNFCNUoz9lrUR9yABWyAdsZcXCxrBvGL3d3fyFu4O
 JVj8LGB/eTygc7jHugU0uBVNjI46907GKcGVq+X8HIDyn/gPh3X9dksMB
 t87kJOAecQU6/72P1U9kco9tc7dYJYi7dCMQ6tl7g87jxB/sC/fEA80WH
 XluLOH+lRYNLYy7qsOC8Wu6PrgpuXh2WU7aFJ3LJFayTS+/PyLEXac7mA A==;
X-CSE-ConnectionGUID: A/qW0ytdRNGAdV5r2KHqmg==
X-CSE-MsgGUID: VVN31GrdRR6jztfbtdbbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96855430"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96855430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:54:57 -0700
X-CSE-ConnectionGUID: SvIS0bKIRr69Ja/Kc9tCcQ==
X-CSE-MsgGUID: p0X8grq9SBKsz63PSc2pKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266912628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:54:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:54:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 04:54:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpCFSUSRwU+ehzG3gIZfc9DAbMXBJbA6LZyuOBj+MEzgV0Q+4Ul8IudHDtk9VeOiRqefSJgvgtkjTrE2LNvY5z182Cvhb0rfuYGblPK/dRO2Xk+yZ3eP+YUV+jIvyWPRHzRDBbyWlU3u23VwSbhDDNLgdEOR0uiLUs7N+BTnnsLYKTYFDJM1NBR0+B7dcwoduqDgSBM9LIlG+G7spxWVYf7W9Qry/A13uvbhHwDXf8LjzREXITywdcEBxXWYyZ1prCELAKRe2dzohbkIaHtJoACQ+vsnbWt0Y4PELqcMfd8rfe6OtOwMb6xCgVffuGC14MomtOGdl54rfA9VpQf5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TDL9BWekBh1oD5/fJRmDeSPAGIT4L9VQkvf+FI+yAU=;
 b=fSvUTm3BkeQ5AtKBusAL1u3nKiShtiat0vCQwQLwASCYW+keuNZXT6bhozq5nmfIMxjWgszdrGhrUV+7TEK5LFF1pnyi1b+jC9zkfQEe7b3GanJUtnzbV/oi2EzhmuNz4jpvbtE/6uTuljv2y4Hv115A5Qr17eKTOuEamqyAm3ohBi04Cg7aLtuuRAb/nTVcBZiJFrvAGYfmDI5QN5ecga0fdBdRfFxXoOrCa9Uyym4O1Vna8ukjtPB9/+FsBlAnJNsxkef5EEYjLTHsXERWz26tIJNu4aTXNffmvK1FE2lSRf4Z+tZ2M4h80EzpCzvs1YRCSuToGI8jtGCXH1de/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 by DM3PPFA4B6D88E3.namprd11.prod.outlook.com (2603:10b6:f:fc00::f41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 11:54:53 +0000
Received: from LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf]) by LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf%3]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 11:54:53 +0000
Message-ID: <7c01f1e7-7b72-4c66-b6bd-05f7b45e200f@intel.com>
Date: Wed, 5 Aug 2026 17:24:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add expected skips to VF/VM
 blocklists
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
References: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To LV3PR11MB8483.namprd11.prod.outlook.com
 (2603:10b6:408:1b0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8483:EE_|DM3PPFA4B6D88E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 1610927a-6f64-4579-75a8-08def2e85c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6n0NgOTxCN2GNcc/qcVhODzC3xDLpMEwKrCT7QkmrFj0VDz4f3mpR3wvOAmw5BiJenFulKx9zzczqBzRpZiX/7sKR0qHcwekFblNKiyC6W4jqXJ1kEZ2AzkbVjzFKZ+bXas8Ub93moNIZ9gmMhb3Wt6IFlsVzDruwcx8cP3PpkwunzcbKwUOPG69c8GBHPSV2BHlyjyHXuz79piiMYrBIcIG2/to1kFyqfKKVSTsNBJ8kK2xmCtSVZ/WjLW/caQP6IcvDgRHoTl2jiyiiIW2DFmHNBf411dm8XXEurlxhg6gst1a3p17gFTo/8/qQYTVxG80ncDJcrxaZoF2+NwPSBxTgfidZankyYk+ty/7rJWW7diT6LfUyhWhApjLhg4pijJ0zNDeA9sPsimK6DwdpdHurCUjA9lHYlPwYpe2tyRRJHTzDyl9hHuz3tcWD3qXiewyQ4gZiA/L8LjlcTVd3l9JBXZlsuJb+eGdlDIvN/wAJ/92TWbN/j7RpfffPQIXuicAi9WRZ0MhXAmvnuuOty00gjby6Nf+lUSkp4vtjc1YBkOczt811smcYDBl3gK25Z8aMQKkAOR95yUBHC2AJrvWpZu4mxeDQmllGaTgSl+COri9qevYOrMvs1c/NPDm1nB3nuUR5z8rjBcUR3XXD8oa41k3CQI0EHBbNJa/8UA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXByc1NpZlJSTmdGeCtlM050QU53UVBGNkhBVjJhUWtmRW5yV1YyZW00VVls?=
 =?utf-8?B?SzR0Wm5LbGt2K2hvRWpjdUlsUTh6YUR2TWtsUnc3OEVrY2c3NGVkTFZ5aUR3?=
 =?utf-8?B?MXZndmJXdWRSYnZyQm5Jc3lVbldvSTB2blI5WHQvZmRxSlRpd09BM245ekF5?=
 =?utf-8?B?QmtZakp3T25ZVEp0VkNFZWhSaDNMWWJMOHFpWXl3Skx6dW1pMjhWNU5LRW1Y?=
 =?utf-8?B?QzBTS2xHTm1sYTJVT0g5ZUwzbEczUnhtcEFEejdCQVFhM0tHRUFHNXdQS1pj?=
 =?utf-8?B?emVZZTY4Q1BMV08xbXVGZjgxS1FPVHRPQlViNGpPMjRpeUpyODNhc3JuVXZ2?=
 =?utf-8?B?T1JZNXlBcEwrMkptemJkVjdIWXJtcDJKYWlPMUIwT0hDU1BKOUlXSlN5L2Vh?=
 =?utf-8?B?MWMreFF2WGlycC9UcFJ3S1hFNXVobHNKQjF5U2ppU3JaWTlFM25aamJiTUxZ?=
 =?utf-8?B?VXhwdlMrMSswVmR3YW1Db0Uvc0JrQ1Z2UkNUcDB3V0hzZmZ5aUU2Tld4UW5V?=
 =?utf-8?B?ak9RSllTbFRxOVZEdHJhN0FpM2dnZlRRckszSlREZmhPMnhJUUFqNHRhZm9Y?=
 =?utf-8?B?bzNjd3VnTlZmMEhNRW5TcDFpbEZRaXdxcTY5aWZscWZmWW9lb2VZbFR3ZnMv?=
 =?utf-8?B?S3pJVmpRUnZMWHZLNXNPSjNUL2hHR0RUamhST0I5dDF6YkpRVDlXT3AwVWxw?=
 =?utf-8?B?SmdkcjhDajk0NEczeW5OSjgzMkdSRUVtQ3lweEErTG9WVVorMFcxaWRWRUNF?=
 =?utf-8?B?V3Nhamd0U2h5WHg4TGgwY2F1bm1xVkZKTG9zOHQzQlUxY013RWJ0MXdDOGM4?=
 =?utf-8?B?a1UyakdQYUR2R1AyM1Q3K3MyMmxaTVJxbFhjS1BGVnBCd1VEWUd5OWs5S2V1?=
 =?utf-8?B?ZXhhV05VTVJZU1Era1hFei9nTnRCajNqVFpjUmE5OVR6TURoL1JILzU2ZEVM?=
 =?utf-8?B?R0c1cmpid3VLV1pzRm5PK3MyWE1qNlJMU3IwcityUUlMUlNYaGdqTysramFT?=
 =?utf-8?B?SlRBWGdWbXo1b1hSTmdCV01Qc015UnN6ZjJkaDIvNy8rRWdId1BISjZOcnVH?=
 =?utf-8?B?NXpYWUx1djh3N3VpbklET0tmSm1OSHQ4djExMEkzSHZwNjVqKytVYlQ3ZzYr?=
 =?utf-8?B?N2hyZEN0QS9EVS81eWkwbHlZTWxxS0kwZ2xhMmFEbUpQalRrZ1R3bHBkWmFm?=
 =?utf-8?B?VHE5N2MyTmhJMFdnNXNhbFVUTnJVd0FreFIzQjR3K1pzb1dlTnlKN0tWU25Z?=
 =?utf-8?B?WnFxVWhuWi9LOTVEcWM3Vys4Q3JDdkVaQ0NmUFBma3VnT0czYXphR2l4VXc0?=
 =?utf-8?B?SEVwR0ptV05uRGczMGQ5VGgxUWxDdkhFSUlob082V0oxWjBTeUMvT2dBOHlH?=
 =?utf-8?B?UXhFY0RkRnc5eEp4VU81RzZTZ1dna2hRUkdwK2xVQXJqNFlGOHFFU3hieFI2?=
 =?utf-8?B?ZFlUYTBVeHNEMjkzemljcmlqdXdabndKNGM3RGdxSXpUcXpueFdoeHR5dENP?=
 =?utf-8?B?d0l0V1R4ZmRaZUd0czF5dmJBSHVmR1FIdWcrYklpdDZ0RVNjYkIvNHpVdEM5?=
 =?utf-8?B?d2YzVFVMTEl2dWJmRmpuL0RucEIvYUFWZUg1N20zTUVpbmNHcjc0UFZEOG9j?=
 =?utf-8?B?dU5HZU9RYm5Ka3Iycy9ITVp5OXNVTFc5S0c1ZUIzOTNwNCs5ZWJRYmRHZUJ4?=
 =?utf-8?B?NDZOaDRzM2RQdU45Qm5UWTdGRThndGJBRHgxa3poSk5nUlAyRlBuS05qOU9R?=
 =?utf-8?B?bU1YenNpTG5MUHB0SmdVODNQK0F5L0hrQ1FJVzhXVmNreGM4WURhMTR5T0g5?=
 =?utf-8?B?T1MvY3Z5WVZLaVZXMEJYME5TR2lSdTkyS2FRajRBSnZFSjgzZDZXanI0SWNM?=
 =?utf-8?B?R0phWU1ETStxd1BEUlFFaUM1aUM3VzZVQ2h1Z2ovaXZhSEVranRZRG8wR29J?=
 =?utf-8?B?K2lOVEJaMHpaVEJRNGNCbGJWMmRvTmp2U2xGZFRPZE1FSlhqUHFxSnh6ZDUr?=
 =?utf-8?B?Tk1QaDc1Tm40QlN5Z1lzOGhFUHdlSmVtemdrZGllbHBtK1owc2VNK2h2Tkt1?=
 =?utf-8?B?KzZZWHlOL3dVb1pnUVI4YkFRYm5mc2NxK010eHBXQlNnL1ZVSXp0Q3ljYlRE?=
 =?utf-8?B?eGVQcFdBMFUxeXBqTnFUWVhsbjFwKzdhSGNCb1B4YlhjeVFNVFBjRVZuSmZ0?=
 =?utf-8?B?RWRydG53b0JvK3pMN0FGSUJ6K1lsTjY4aDVWRFVSN3hWK1BhaVRhY2V2WmpN?=
 =?utf-8?B?Y2VxdzhGSG5jOWhRTlk2dFl2Y1dmNmFOdWxpM1ExS2tzcnkwdkVJSWcvT3F3?=
 =?utf-8?B?WlZkRVNGS1c3dCtBaFVuK0Y2WTZBa2NhbDlmcDY3UDZlMFkzZWJIV25iT1lz?=
 =?utf-8?Q?DLLSonfNuGR3SPwWM7vWUJ1JjUt2/5xDNWrNA?=
X-Exchange-RoutingPolicyChecked: KByIv5qBFFqIpy7b0Dm0jp9h0pVq6lZuJ8vmZGx554gANnMcNW5dTfsrBVVoQ1jyWJV3aa0BdPJp6cha6/2TCNagRMA+rWbyDOWgXlEGX4PrpIkUKxleXy/vBTv4hcenWk0w2rSVhySmVssX63KMFRvcc1zkX2bKwB2MgEiZRPVtcF2dCs7MyQCA4kJDZg04q3vi3lwGKzphP8yK11oQ4ClQ9L9f7Bzx1RfvnLA/xBXb94mpS0bz0K2eFG5aU5BBR5yGP4rfQKDQ8JIx5kKloyZMilCf4sJhxk7j03qUsqhOOgrI//9ssx1UaYGw+Pn4J13DT5p/5Kg+da4xxn5dPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1610927a-6f64-4579-75a8-08def2e85c3b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:54:53.0527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+hZtosDedRMV4hI5CH/ETHN0dlQ2rfMGYCGn6ExW/n7r7+IKv5DvQdPKz1SZQaOD6zYF4LHItmmoycJhQP3a2TYhVuzCyqpEJLMLXT3XEG25Wbu4S6M/FbmM7o/r7QE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA4B6D88E3
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

Hi All

On 8/4/2026 9:50 PM, Jakub Kolakowski wrote:
> igt@xe_wedged@wedged-at-any-timeout, igt@xe_wedged@wedged-mode-toggle
> and igt@xe_pat@pat-sw-hw.* are expected skips in VF mode.
> Add those tests to VF and VM blocklists.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel-ci/xe.sriov-vf.blocklist.txt | 11 ++++++++++-
>   tests/intel-ci/xe.sriov-vm.blocklist.txt | 11 ++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 4a19aa943..ea0f478f4 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -60,4 +60,13 @@ igt@xe_query@.*cs-cycles
>   #
>   # Tests that need to be executed in VM instead.
>   #
> -igt@xe_live_ktest.*
> \ No newline at end of file
> +igt@xe_live_ktest.*
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*
LGTM
> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> index 6271b1a70..09b3540aa 100644
> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> @@ -57,4 +57,13 @@ igt@xe_pmu@gt-frequency
>   #
>   # The feature query_cs_cycles is not supported on VF
>   #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*
LGTM
