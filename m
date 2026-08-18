Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0E4C5DF84
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6E710E00B;
	Tue, 18 Aug 2026 14:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fblbiaf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFD910E2FF
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062574; x=1818598574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1hQWGpELhYPyBIHSIZWvKmDaKUJkgwqQ1hxOVC14gRk=;
 b=fblbiaf8q0Xr+r7RApDgEeN0seSf+HlSuxOJAqObNLaB7Ku8akwxdihw
 ooCAXudgp89lr/IRkJht3OUyzhCUBCrtyYyq6sLYfRhCtp2zqLQZ6UZyL
 QQ8ns3YFy933UJC37LnsMCHet6zA6MeRYJAxWsIUCggHlyG4j2u6zcpV6
 cyNFJPuSK097i7QV3hv5bF4gIAPvHvGW7ZCKlZG54Kx81Wn8ao2TEXPP/
 lAxw2MLXtU/jRHegT1ACNjcKFKAk3plJp/J0Y7QhDUhP8edP98BF358bN
 RU1N9nwr6JGWnMqHYtyzNtuipCKThuUCfHPC5i+/lXBu14J+CEBhPVSQ8 A==;
X-CSE-ConnectionGUID: 1FmXW2y2RR6HPaQINUsHbg==
X-CSE-MsgGUID: ed8kSADcSZ6b7ZqR6KVVww==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98918547"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98918547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:16:14 -0700
X-CSE-ConnectionGUID: RZcxlUMLRlGPmwbaE9klAg==
X-CSE-MsgGUID: 6Am5ASQERiuYZJuSimxLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262611478"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:16:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:16:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:16:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhgFW79q0cLmOOuXaRf8OTtoLUhx2X6E+WzIrawG6QM3ok+WnQ+WQrWUJnt694cH/vSXTO8ecoJoyKvdO9b0JJVzmfODME4vHhrUsZN/e2vWTudM5Zux7Y1BdqBeb6JV2HbZ3hfO3UATbP6wUe3jpYbqScIkdf+jZ81IEYW+TQGTS10lu/ZQ4WlbD7Xh/oNYIqUFpYLuHkySdWb7X2wV1TqUNP7yJiNX5WyVSV6DuOf7k3MdLDL8SGBM6K5L7padkVdVacRtlYBjbSxs0vlJ5EYQkN4vWN/FZdSEthLh6dBSDk7mR+iYtweldA/ht+WLBZh+HWHpDIvetD66/bkP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyJ5YWpTeDIxuofYH6E7lsby6j8/e4E/uSVQ/PY0PCA=;
 b=YNfLYcUOzss3VmTJ++lQOcsXpUDGBX6ymXtQ0GyC0nKBBCzybOE+FVwEfXMBYLzVhFeW2et1GpwKvsRA3ELH1FMRKy9EHApaNpfof60BGCVNt7h4qSmfE+pxWPjAWNQ/+FsPYbkovZgM/cm2lMPwEJYNFUXV37GFAhBEZ9AL2WRs5muxuJSJWfLINaGnRp9MXrcvLPPt3JGIumCq9WO6vEcW9e3WeHUTlsLcF+ZvjBNOLQ65FqzuxFQ8Hsw8bGdLtFng1NLqB9yutm0QkvF+fQ3ZSCn2VB5QZsnq7X05InFwYTxg5Jpn5aEOZw4ULO48kHVDuJELQlUApGIOC/Sk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:16:11 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:16:11 +0000
Message-ID: <8bdcfe8a-c7be-4dc4-a4d0-507ed74a9ece@intel.com>
Date: Tue, 18 Aug 2026 16:16:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/6] tests/intel/xe_pmu: Disable VFs before
 restoring sched params
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <d0b59bb2a7b41f0087ed85e71cfdce29ea21b902.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <d0b59bb2a7b41f0087ed85e71cfdce29ea21b902.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::15) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f704d29-e9bf-43bd-39f8-08defd33412b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ZDxjqhurg6durQ4nb7vSfU9saeHH5vvvoRE+nr4bo3f1DjqsMdbaBKo8Z6aBg0hxHNps6cuguQV+HuDa/ETYz4JFipX5pnrSgAHAq2Ey+M1HB/pVyhf0hfKkGqQeTgX0cXkBm4lCZ5TcIM3xwazwMBrbpgLnLYxRa3Tt9jGd0IpUc+8qcytWOMV/tEsxVe9Rf8M9ckl/hbGrvaCN1NdZ38BVjGkrEwFj/OQl4+jzPgQ9Wlp1wmC5S7tuaBxLiY6duT+l0yCDWBvC9DbUxVX9QmdlO9BcImDsqHZlw1vfpxqGPq5dlNFze3DQwhs9xqCr3iINucfAVr7a4CdUUQAmogDJ87chyfrBUFzD8A+CvYdeGw2xMGwJqeMYv/RU/MoCnHr38drOsS5IWGEcu6FzZP38vJUWQv2zdUhTESHUwZuKUKZa+IuNwed7enVCY4W7LHU7j10+5DffMmKQUCzdtCGZCnVT8vQ+UwFu3DJ/k2dYIkGGAyci8l8PSugrkW7xTPFCbCk1XRQJ8erzv0N5fHBQ2gipRLB0s/kR56UlbpjqQ4ULnfKWz/1/knPvl3y6lJLsRYZqdf1JgnF+UUZHS/FCD41pSyRvr61VFmpXyMCkUck8mt+ZC75zADbJhnQ1TzlgV+Vm+HZIosGEhlFDqU4PlBZSOdRlY02abo1leIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnkrVWp4cUtOaTRkWnZXUmZMN0hEU2gxM3NxU241RHYrVmJzRzRYazRBM0Vy?=
 =?utf-8?B?MFpQNXptSi9aQ0hCV2hLdE1wbWFuVkZEbDZwYTd2NnJ5dEdpTlcxd2grUXpB?=
 =?utf-8?B?T2FmcmRtTVNqVWlBeTF1bVk0Um1IQVNXVFU1UDRrNFBKMThWZFAwZktBSy84?=
 =?utf-8?B?WkM3a21aL2poTlNaYUlkalZldnlBdis1TjAwc1BhQXFjS09FcHpTRHdrVjY3?=
 =?utf-8?B?Q2R2T1k0SHpDeTcwN29aMHlrREtNZ2VlYUtFbUJkaXFxL09peXJlWENDUGxq?=
 =?utf-8?B?UWVDenhTcXZpbzJMMjBFVTg1UFNBNzNzb2dXLytnYjRhUVZzNGQ3bnVOS3U2?=
 =?utf-8?B?TUJnV1A0ZzkySzQ2ZXowd2l6eHlIb1dIQTVBdC9GOWRQeFd4c1ZFZm5DLzN4?=
 =?utf-8?B?QVMyR1U2amRDZDFlTEJNMHRndndxRDBGUERtSytteXpQTGtwdnVYTG5DWDkr?=
 =?utf-8?B?dFRkWFZ6eUNiQkdsMlBGSkF3OXhzUXFQQUU5emxHU2xyYXR3RFdHK3NodEFx?=
 =?utf-8?B?aGJCMmczWUlkSkxVdEJHYzMrbHZDZnkrUkFGMW9OR1BTaGhqaVVjTXVCd041?=
 =?utf-8?B?OGhscmJLRWJXRS9FbXByT1FzTzR2QnBTcXpKY0JNUWJhTUZMNk1LWllqcE5t?=
 =?utf-8?B?RUhhNFBsMEZsQ2JsUHd3NVFuY2xRaVV3REFoeGJlOWFacThiTmJRdGFzY3BV?=
 =?utf-8?B?N1gwbWlLQzNDbll6N3ptQ2xCVUMzVW5XR3owRW9yeGxvWjkxenh5NnBwaGFQ?=
 =?utf-8?B?enFNdXVPOXpJNXZrREtzbGdPTG1INVZrWU5mVUs2eUR0RCtsTGZoUDEyNDlT?=
 =?utf-8?B?SHhGUStjZDMvRkM1STE5MEpMNE0ycTE0NW1Ra3ltSkdmSDh0QnRjVVZwcUJY?=
 =?utf-8?B?L3VaNHk1b3JmVXpCdnNCRUNRcUpKR25Jdm01UHVpdG9xbVJDZS9SUFRTeTNv?=
 =?utf-8?B?ZjNSQ3N0WCtVQXI4SDlqeG9Iczh0bllDVGpXVVZXcUFOWWhlSTBsK1ROK1hl?=
 =?utf-8?B?TzNuM0V2UUMvQjNoRXovUnBDQnJjTWRYTzNyWEVGQ1QzeUwrVmJLREw1YVFt?=
 =?utf-8?B?TTQ2VnhwN1p5LzNweEJvUDNabklOakRsWmRvSGsrL1huVXoreGlKak4xVmN6?=
 =?utf-8?B?ZzRvN0Y2MlFSMEdYZ2VvQWs1TmRoR2VIMWpQUk03TU5tWWFIdC9xK3VHV3VB?=
 =?utf-8?B?SnRJWlNBUUtBd2JGU0R2K1cwVENUVzhWQTk3TmRYM2VzbkpyMjczclhJK216?=
 =?utf-8?B?Y1hyaWtFd3JRVndiT1cwTStGOVp4dU92UnBPTHV3ZnE0Y0ZveGphN2ZTSWRY?=
 =?utf-8?B?ZUU0S0VhMUtBdGlTYXJva2wzYnpFdVJpVy9uTi83ZlNqbFlIVmJWUlc4S3Bw?=
 =?utf-8?B?aVBubCtTMGtlM1JVajlNZlJnNG9lbCtteVFZSE9mTExiUFFnUnZiZkFUVm5x?=
 =?utf-8?B?RDZSRDRnWlIzN0hxVHZvdWwwN2x6d3RCZTRhYUNYdW8xMSs3anFOSWxUcXJI?=
 =?utf-8?B?aldSWUVvRE1TaVl5ZjIzb09JckFXYkhnaTBNQVpnVEVaOElZSVF2Yk9Da0pJ?=
 =?utf-8?B?Y3lxZHJoanFtTzA4dFYza04vbktvSmJmeUcrUUFiQkJyNXFaSCtXMDh6RXlw?=
 =?utf-8?B?QW01Uk9lQU9Wd0xQSVRRY3BRN1VFZ0NDK21vRnI1a2JQSE92cmhhMjlqRzIz?=
 =?utf-8?B?QU5lc2VtdGJJK1ljcHRVb000K1RqaklydFdTR3ZDR2hHdHdYamdUQndaZkx2?=
 =?utf-8?B?aGpQbGFubzVPbFZ4RFNwOE9oTVZEd3RzRW80emJHZVpSMktmVGNkTHRSNlMx?=
 =?utf-8?B?TFdiUG5hNHhEYlVPWWtHM1RuTS83NUMxeDRRTjlQTER4b3YwOUI5Rno2QVh2?=
 =?utf-8?B?UXdSUVp2dEJGM0J3MDE5a3RkaEczbHAvcVR4cHMzbHJkdytyclFzREFBbVgv?=
 =?utf-8?B?bTBJeVJwZU5vN1A3ZkxhdmFicWRpOU9EN0xLZE1kbFdoYU05QTkycVIzQ01J?=
 =?utf-8?B?aUJOeCsrOWFaZ3BEU1dlZFJ4Vzlhb3E1SVdQM2t1akgrYWZUY0lLeEJYdkNm?=
 =?utf-8?B?VlhUYndoVzRTZHYzV1YveDJmSnFEMnF0NXZCV09CNzJrWElBUFl4OHRZUUJ3?=
 =?utf-8?B?SDFNRXZqSzFBL01nSVd6S21kRzhhYVRLc0k1dUdqNjl2MmdrTHhqVDRYSDVu?=
 =?utf-8?B?b1A3eHc2b2pDdmUzRWtWR0toZnJDNXJkUE0zZUt4RUp3Z3phWWNHRHh6WU5N?=
 =?utf-8?B?c1BGTUxST0V5L2dWQUVzRGc4R01HYzJIeUZoTEtOaVRod2V2S2JVVEEzRkl3?=
 =?utf-8?B?dXhabzZIMUl4NzI0dml1bTYxdmtUbEVpMmp6RW8zNndqaTFOZ0FCQT09?=
X-Exchange-RoutingPolicyChecked: sVYLQ+zzzDBRfyrgcqB6+sM8UQrM5KLoaWrIMTzg3s+UKTbEhW5eAiS1YPHggcllq4ny+Abh9IWcA632NJUxyOUl/Nn/ssfxuLBp23ZDL/V8Xb3vW7ESb6PV3qajKFjAANkz5I8qQA53wF03MtGsEwk15jR97PJX3rCGTFGWKvagp3B7wp/36GAe35WBK8BQwB/ZQGiTTjW8LHjn8GihLrob/SCymoMUqtCv/YQMTzOa9qor8Ee2mV98efi11AhpZDtuJfdvEH9+rwWtADZ6YMxQEdQPB7M4MhsDDb9zSlBUvhfjaN0uLiydqCd5W+Rjzh7bOjDXzT7oSKWbBJw6xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f704d29-e9bf-43bd-39f8-08defd33412b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:16:11.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVMybBYsnmt9l1AQJiAh+vY/sKRH/02JKFkwhWjEffSh9dMEH1rCYLsbRZbemyVmPsz8nKIysX1zDvyzwwXt1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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


On 8/18/2026 14:39, Marcin Bernatowicz wrote:
> Restore scheduling defaults after VFs are disabled rather than while they
> are still active, matching the cleanup order already used by
> xe_sriov_scheduling. Resetting scheduling parameters of active VFs can
> leave cleanup incomplete and cause subsequent VF probing to fail.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 2d1bc1f61..a8ceac46c 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1023,8 +1023,8 @@ static void unprovision_and_disable_vfs(int fd)
>   {
>   	int ret;
>   
> -	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
>   	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
> +	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
>   	/* abort to avoid execution of next tests with enabled VFs */
>   	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>   		       "Failed to disable VF(s)");
