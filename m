Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9670BCDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 05:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202E910E4A2;
	Mon, 22 Jun 2026 05:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtsmTz+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009D10E4A2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 05:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782105871; x=1813641871;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XJFlFu42NyF9nur6lFNM/tXeMOmE8Ne4GSbJpqyi3t0=;
 b=QtsmTz+GSFc/6eCBuwY/GeyDLNQ8f/xocoiR3iNWr+FVxw7IeewPr50v
 OGSR7NQ64kVBNB2xs09JCeXOrlGI58KgD7RE64OXEdVdSV4FGivZXinbq
 PY4oNHMDrR6bsc2Wwhz+7g9izAGT69DMnxpB/W4dU6ycEBtnu6fJq4xUA
 tgKgQIW/EspQXsHQiNtesDtky5lziMHzYVBmCbtERE/0DO+3ziPdAw2b/
 tFMnoyvV77lYISyeuXJzBkQGwVKz06+6ORO9xHdpq5vPohXFK7nA3BJv6
 lXm8SVMN2bZp82Kw+F9JEYSckVoYSRoz7MttFMbrMWGmY9Y1KiKjRCaVQ w==;
X-CSE-ConnectionGUID: +T1hXTMmRIua62ysUUIjkA==
X-CSE-MsgGUID: ZoU1AMiLTSC2LAdY1Aw6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86512451"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="86512451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:24:31 -0700
X-CSE-ConnectionGUID: oYQxuBIeQmagH73Rjn7scg==
X-CSE-MsgGUID: ojjpw4h2TZCOxpyqcSCwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="242780947"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 22:24:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:24:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 21 Jun 2026 22:24:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 21 Jun 2026 22:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAzcfOan8givh7khBFgoM4RDUdw1ZP9VRkkBKkEeu+m8KWSPb7nYt9YOk+aAXQVa+v9I0RbP472PKMPYGIMS6KA6Y6ii8ozcxEfMsSat1q2ErYiohV4CnMWYkvvNbEZZR9v2vE7RbuD+kVjGxNXxC098KCJImSRiOBOqH9p369aM+fa+8UZhn68/mKokqjrDF/EwtMNrO2P1qokkxQn8i+Jp0ApszaQCS3C4I7INDpobFayVNZN5WE4YHKPrELaIuAd/pcpjsdnkXWHcGBvdUCUTaUscsVT8lC2/XvauSuPeJZWKs6KyfAa63WawgALEQCk55EVFOA8xUyxmhgTN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsTnlnJOEDM3DYOX97C8MpswTzgkD6qoDMr+ikd91jI=;
 b=nk90ZRsE94x72xlHjVJwmscFN2pXtA0p7dwLSaIgxmYBZAL4OpEIS7f857dYX9CYqyqK0/jHP91UCZVb4ZX7pK1jAm18M905K4QtSAxw6qhB/hR0nRZ1Z6jEY0SKODoaap92JeZaEeEX+6YEfHObzwd/udQTGQjCgU1yRqjr5mObfmyEKpK7mixpG98aVlK1haMmTu0pWvYVSh8fMxYmYQ+jyknM2PK2ZlaHTU4TBlBfOluuF0WE/085tYLBZfLcmHdQzWXPhNvbUHsBV3v3Vzjp7cksY5913xS26MF1vhOhwbTNxB1zYx4g0vmUxpPWuwyyW8QTMn7cFb1muZvUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 05:24:23 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 05:24:23 +0000
Message-ID: <6d4315aa-01eb-4795-9744-f22e46111a52@intel.com>
Date: Mon, 22 Jun 2026 10:54:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Add dc3co tests to LNL, PTL, BMG and I915
 blocklist
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260622051641.3007639-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260622051641.3007639-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0325.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8940c252-2025-408d-3b39-08ded01e851c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|42112799006|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1+70k9UWTVUKqdhZEG5xyUA4cIEjhqjoIN4/JJRTptuYOGwQMWKXMjT0+SCecuugZoCII05y88GTTtMFP2dBuEAXhvTmk1x3T5qHpr612QIhf/ArUq/rEeV/IALQKRIaKvsdzCAPSHjfK14/xNPyhoXSO64gIs4zVGb5XajCtnS/wxZSJJ7eoaatkSufDBFA/CoheKfe+LRsHoZX9y920d7mog7DS2CNkpH0QWJErcNzbjbtwFfI46JgfCOi65IIlQBNHRLnWHETLgZqUeft8gVaRND32uzZVjeFsYkcIG9nxQVrTVLg0YmdhqaF4KKLPBfcq6DDeabQNp2mSbaRRNjWB+5DJey/LvHkrLGxi9bqTaiku3u+XbA9lYo+180Syl8KcLio7x5HVlCFkbgDS+c+3uhZUDAefVxY4TSe9z8DXYfw8Aeo5rcMrKfdIjoP9/o0A1UD93bs/BDWfgdsfKF2gYZT1Qsf/6b+y1fkZ1IWvgtla4FhE0nD9ZyotavdebE8sqqq7q+EoFtGR3sQwQeBzCZEs9+ZcUS+MOlQ+huAvz43DLsUtoL2EWztmLBpfeSk7tpP4+sISOaOADQoSrdZgMmYpqoSzBBoEBUONiTsc83frbqpcVvOf2tBhGRjqNOgYHZokTKkopkckWgCVD+lMbK6yQ/+ET+ZFhXLSVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(42112799006)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZktLK0FVR0VXclpPK2o2cVo0ckR2UXJBRXFmaHM2M2RwQlZQMEFrclFmbXoz?=
 =?utf-8?B?TUxNbU16NGV3YU9yMXBWWUVoNlhaUE1EVjh3aWg3Wk9Dd0xKcTVyZVpkMUI1?=
 =?utf-8?B?Q2FJRmFkWjZWc01YVFpRbkUyRWdzNXk1Y3lHaDZDbzJaUWxwdEIwbmdvSUpG?=
 =?utf-8?B?ZkFRM3MwNHo0YVN2eHVFc2IzRVpCVjBuN3prZTBJQVBNWHJLNVV1NjhwbWh4?=
 =?utf-8?B?cHRmYVV3aG5vak5CL09Cc3lpVmFBNFRwaWxMblVrelpCby9MRGs3eThxRzZI?=
 =?utf-8?B?VkpjWVBsc0xJOHhLUzRGZGthTHdtYzFEQnRmdWVCQWE1Mk0waVhSRWJqQnln?=
 =?utf-8?B?c0t1OTQ0N2dlWVZ2bm90SFNyMUl1NVF4eVYrdjUycWtkQ3BwbUFNbkhrajdk?=
 =?utf-8?B?V3lXRFFIaDEwMlV3dXJCdGFqeFFuaFoxa1lRUmtxMWFOZEMrVFQxUnJXSWt5?=
 =?utf-8?B?U3ZTVlN1T2Z2SjVmbWxJUVFCdWQ5WEFuTTl6Zi9IT2RaNHBXWlUralBUaEFH?=
 =?utf-8?B?dDgzc2duUEJsSzlyUitpbkhVcFlHak9pSW1JN0p4RU10Ly80bi91ZW5wTTdu?=
 =?utf-8?B?b0owTlo0a0w4U1FqZk42OXNxUFpEYlhyZW5nZzJvZjZEanZFR3JTSFFvN2ZG?=
 =?utf-8?B?U215SUc4Q0lOcVFaZisxWFhxS2E0dXBLWXhIOGthTzR6MkpWd2U4WUEzMFd0?=
 =?utf-8?B?ZDdpejg3THhZcWRkTGlWbjNUbCtxOUlYc1hRa3I0eDhSazVoSW5oc2hTV21t?=
 =?utf-8?B?dVlZMHYzSmd2VmxuOUtJSzRIZzJVTW5uVFlOQjVLQVlDYkowTkhxR3JiOWNs?=
 =?utf-8?B?Uzk3OUtGaEVKcnBFN2dqT0VMWFhHRVZNaWZJNFArejlKMUpPUFBxYzJMWnQx?=
 =?utf-8?B?U2dqQTJBTjVDTk5nZE0reVVZVnpmVmt6QlZPWkdtbVVheTNzMUlCTXRaSitr?=
 =?utf-8?B?dE9DeGVucmdocG9lcklBMjhzeFpQRmxGUUJaQ1Z0NC9Oa1ZzMXdFR3R2bzVk?=
 =?utf-8?B?WjhiVlJtVmI1TW16NU01MXBsVDB4RXFLY2hGV3Y0QWpUTWo4UHpTbTNyZVVI?=
 =?utf-8?B?em1hT21jRHpFMjVTTFRUOHZjb0Q4ZGJ0OHYrdkJ5bDlXVkNhSUFkbm9Yck45?=
 =?utf-8?B?MzVVRGR4dnRYZlVIZTdnV3ZpRjdmMWR2Vm5QYjJvSzhJNVFVUytaRWJxOXRt?=
 =?utf-8?B?dDdTNW9aVVRMRks4Y0U1Uk5GdkIxcHdaeTJGOWtrVGZiUzJDTEJPbWl6a0cr?=
 =?utf-8?B?UTdKWkZlU25JQld1b1pBUnUrZitMT0xGdVdrbnJPWWExZkk5MFRVWFBzMEJm?=
 =?utf-8?B?R2RIOUkxakZncUk4eTVXS3luS3dGK3pXQzY0aStPUXFJeFRSaHRmeEM3MlZG?=
 =?utf-8?B?NDRENmUrZm9pVUtJeVhuZGdIVWlUNHRNVlVOQk55S2l1c1lhcHplUSsrNnpp?=
 =?utf-8?B?MVc4NTR6U24vMzNyb0dLbUJpNXlKKzFRYnJKRmVPUkxHOElDaVcrUDZLRksv?=
 =?utf-8?B?WnZlRU9iVWxzRUp4TXI5MndYaEt3Y0RRSzJiK2JNdnd0cElNR0RodnlqQ3pa?=
 =?utf-8?B?b0twTEFFTVd2dDdUZ1VqSk5yT0VBc3dxK1Q4VjU4WGVoeDRRT242TmJRWWVQ?=
 =?utf-8?B?RCtXaGNETTIvQWRjbVd3UWFQTjBaQ0M4bVU2cHJFTllMQ0JRZUt1Y3F0c29K?=
 =?utf-8?B?NDI0TXEzaGRzRDFXTGpVU3lrZnZobHFxKytMNFlSc21rTjl4b2tBcUg4eXRP?=
 =?utf-8?B?TERkYUNjck43VXc2TmxYcjJ0NXNtMnNwL0NiYy8xNCsyWjAvT2d2SDAyQ0NJ?=
 =?utf-8?B?ek1FNTB4N1IyNi9DbE1FalFNcjZGNTBnMXNqT1BkcEhvSEVmdWNUdXFOdmxv?=
 =?utf-8?B?YllRZFE5RUl6QUJiL3NsbmhVUkdIaTdSbVQxbmY4RUVRV2tBOHkvSUVIcHVH?=
 =?utf-8?B?bWppMXFTTlhPeEowLzI3TWVsTy9YankranIyZXliQWZsVUZ5STFQT2RWR2Z0?=
 =?utf-8?B?WTJFUUM2ZW9hbHhWWW5BRFB1bGVWeWtKd29ZMGlKcFVkMzQrMkwyemphbytn?=
 =?utf-8?B?RGZnc3BXT0JZWThyeVdBN28vN3NMRkl4NTVnekxTSzhURDNFQTgvQWVXYUl5?=
 =?utf-8?B?bE5aWlN1SHhKdzVpcmdiRWF5ZVRCUmFSMHFKVFMzdEw5Ym0rSnFiL2pTbjdB?=
 =?utf-8?B?ZmhKcVU3RWEvSGt2ZU5KVzIzVGUrU001ZjZhRG4ySTRzbTFaWFhkR01oUkZ4?=
 =?utf-8?B?V21wc3RBYitYai9vM2hKa1lKbVkyK2VSeDRIQVdJZlU4dy9qZVUxa2lUZWJK?=
 =?utf-8?B?ZXZWOU9GN2lCMmFIZU9BcEo5WEVZVVlGY1ExYzdaLzNibnNBU2ZFQT09?=
X-Exchange-RoutingPolicyChecked: RHw9G6tRylipY5sQiXD+vYquCZ+JgNq6CZlMB3dI/DEz1XYjKXqgTAgVlQAAIBEr3DF18yvPTrmG8BkJtq3JHOmQzoCP6YAjlC+xbNxBKJwWMWtD4hUxuiSCY38Ts21gK6xlcBOJC3/McA0RFOEmSh2H5o6WJdViofPiJrOsmuvzX6Lhsr20/4neak4ykqG+31QmI2zvSUuZpHTfSFCy7JgkxMVf5VvOFR6oZx8cD9Ibw4JesiVVIRggYSvoKjJkUzFSBq+EeV8E/uCWhTWollhFNhnLNFu9xCuZB9htZkUbcCFpwpFnxRdvvMhu37pWdIW7RRY6xOIgiPmMbp/PBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8940c252-2025-408d-3b39-08ded01e851c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 05:24:23.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUksUn/JkZDGq1TBOiH/TeiB4+g+V28njoyWqpqw5jsOcVo6PKpzeetYeilDhQnUasM5OuKVAk8CXl8C5iLKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

Hi Jeevan,

Nit: May be subject could be just "intel-ci: Add dc3co tests to 
blocklist". Details could be added in the commit message.

This can be updated during merge.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 6/22/2026 10:46 AM, Jeevan B wrote:
> dc3co tests are only valid on display ver 35 and above. Block these
> subtest on older platforms.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt           | 2 ++
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++----
>   4 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 1068e2e15..17b2f1f3f 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -206,4 +206,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>   ##################################################################
>   igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>   igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>   ##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 04f23af28..4c2a7390a 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -121,7 +121,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
>   ##########################################
>   # Valid skip :- Simulation specific
>   ##########################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
>   igt@kms_simulation_hpd@sim-hpd
>   #########################################
>   #########################################
> @@ -179,4 +178,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
>   igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>   igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>   ########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 5f918a003..1dbb24ae3 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -91,7 +91,6 @@ igt@kms_plane@pixel-format.*(mtl|dg2).*
>   ##########################################
>   # Valid skip :- Simulation specific
>   ##########################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
>   igt@kms_simulation_hpd@sim-hpd
>   #########################################
>   # HDMI/VGA subtests on chamelium are
> @@ -189,4 +188,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
>   igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>   igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>   ########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index c897f3c69..1041931a1 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -88,10 +88,6 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
>   igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
>   igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
>   ##############################################################################
> -# Valid skip: Simulation specific
> -##############################################################################
> -igt@kms_pm_dc@dc3co-vpb-simulation
> -##############################################################################
>   # Feature Currently not supported
>   ##############################################################################
>   igt@kms_pm_power_saving@.*
> @@ -183,4 +179,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
>   igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>   igt@kms_flip_scaled_crc@.*linear-reflect-x
> +igt@kms_pm_dc@dc3co-.*
> +igt@kms_vrr@lobf-dc3co
>   ########################################
