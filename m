Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEBACD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B50910F48F;
	Fri, 15 May 2026 08:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcJzLGv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0910410F48F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778834590; x=1810370590;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=4to1HK5OHrO206J9wXcBICbBREw+ewWi3ArQd/rt5WQ=;
 b=AcJzLGv4TgZ5yFMthiE6bQQguPBxrMbsmmrHytBh+xv5Vhs5NpEHn3Cc
 nALliyrJlorVn2s0+bn+XymJsaLErgVcG3YSGq58OLgeH4b50xjddcBHX
 0S3uhQjysFGUZRHJ17eodwkWpvx8P6bQ5vmP7YgUoEOarXw60NdmRb2OC
 ugi36QDMguM8mXydZNDiv/PGJyRQzXb2TnbI1BZDMaHwhm3fNGzHYuW/v
 YD0/rSPchypDUy1HCPi/bViGxXdrTN3LNu2PdyN2Ol1QwvX3iQbRxwvwn
 q1oEUOfQZZZSot4pbZRk2bX7k1sR83AdT0Le3bhJNawlIrPQrPCtCCfUt Q==;
X-CSE-ConnectionGUID: XKYZfMeVSCWFpV7oqmQhTg==
X-CSE-MsgGUID: TS8uaOvoQfiQqYF6AWsuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91249443"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208,217";a="91249443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:43:02 -0700
X-CSE-ConnectionGUID: wCn/yUEyQWiRHMGGu+xLiA==
X-CSE-MsgGUID: A2HAqrwsTDiW0BsGvfwXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
 d="scan'208,217";a="232241666"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:42:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:42:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 01:42:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOyarWbYuToqF5LB+EyuFd7l/JXjWMddXWBwowwQcduSJilLeuuJQzw6+lCzNKRWClBoAfSEPwICefzNLSW/kqgSZ7IUT6/p33dC1lP92kBzDBkHOJMNyEpsApFjE2N+3jbR59mNy8WaHNAfqVtB5mp96LkDUfNmWELyak66VG1j6bsJdlgcTSwHr4JmyECty8OUtqor+1d81wfcbMSdb2qRNoonfh3kfWqKPNm2fdD3EpMNmuF6pu3kOvVju6oj3mEdsWRZxtaN5yYQPSNeaAV4R9rF1dcFv+X+mlFTKn00f33ItIdCq0tN+MZUzmO3oJzCbtzm9riNIRPZAgAS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDsYgvER0YAxn1J01HaapN9GLkx0IOPsJIyM/6KZMkk=;
 b=mTejA7DUe510FMj40TYkD1D9vH9Ak9aZtitW6G50u9d7yf1euW7K4ujqgXdEX0unZ9B/Oo8vTnkM051Him/knSm/QFVXmmXMWsGHVqDWIaZIgFpSX+rwIqqKzF3faSN8hQGF3ylMEbZTiOsHEKzFzHvYKdxRpf1G4UIE57vL0eXvf/FUQ56kCgoTm2T9z6EZsP38LS7Z0TXbL79nYKAXEzTzbNSfl8Hd/zn5RF30dgiAHMxMOO4hQqi/I3okmP28nmB3RRuaUcEyWq7v5jetMi3DexRAO81DAN6ksx/deDmviqEoQVUrduwHY8Blcpt/lsRzT/bN6pP+HXb6MaVnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:42:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:42:53 +0000
Content-Type: multipart/alternative;
 boundary="------------HNgmF69zotwaUCj5sJprHCPi"
Message-ID: <cd2a331a-f3bc-4de2-9008-e2a97bdc4612@intel.com>
Date: Fri, 15 May 2026 14:12:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v6 4/4] tests/intel/kms_dsc: Add force dsc and
 joiner test cases
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
 <20260430190947.2347314-5-swati2.sharma@intel.com>
Content-Language: en-US
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260430190947.2347314-5-swati2.sharma@intel.com>
X-ClientProxiedBy: MA5P287CA0276.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 385b8e42-8f1b-4c2a-d477-08deb25df465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|3023799003|11063799003|22082099003|4143699003|56012099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: dJDDDmlOxaytzubuRkddckxU8/g1bOu/4b9xMmm39G/Ns0VvEyw+r/htJO7HnyR+UCo4sXBfKSE+Ze0FI2XE9FjBa0/hjMUS7oolcHMc7+n67Uy7CewGgIUElcKiSbt/PIZ6IxxCUyw9WLZNBzQDry01e8XS5d3y4IL1wlKgyBfvyTyqrFqLZc7LWXh45JR9iUmI2Bgf0ukg9/ugbg17MXWRXMvtNEmQ3dSiJCMZnnmQHqpJ/jfSDWz+8jg/HiH/Y3P0IW8N9FV+hTOKdfKtAOoM5w1+hUfYd1ofLn56l087hxWkuNqLhURAdwjRWVoZDARULaEUg0Z2j6J65k5o4QsnjarXTOytSBUrEwqNE+Pb1A1g6cnupD678C1UIsg1sHSzhINh8mWnMkXAymnkuF2DoLfZgVitFXI1poFLAiCGdIuefALC4LnYaV1C+eCHaUTDlD1bmIjq9hdiOChMm9BqwOJEskQ6MOqNxLt9RPZNQ/WZDbSdJnfQsXdKFcSbZIFwuIcP0ac7BFD6Jz7UUneWTjpDfmv0eBfxSHSR1EGPwZkcmYsos9WqtPqMUGfmDmFciV6I0pWgDSdJ/Scy+9owS9wS6PBrIN9zUg8b8KSfAtrmqXhjIf/meN2Ymrhr3i7sSRF92EYE1ObWHzICA4tmoVFmJtP6IjmQCug+78CSxy1rXLrC3kzJRkv5aHLY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(3023799003)(11063799003)(22082099003)(4143699003)(56012099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVvOUY4OVZNb1N3WTZYaUwxaC82OUoyL0R6V1IrYmN6WmVLaHhZZzJJQkxq?=
 =?utf-8?B?UGVObDVtSndMaTQxMENJcHpHTTQ0NWVpRjA0aThITDFNRy9KWkpsaDhNbUhh?=
 =?utf-8?B?N1hpUE1hRG9QOG83TVF1TmxRWDZnRy93THFmOG5PN3loRWY4bEhmMFl5bEtX?=
 =?utf-8?B?Y2REajJBYUtRdEZaY2VUOG5ucFg4Nk1kZ2xoenZiMG1iUmNZcVdDd0FKNVk4?=
 =?utf-8?B?R0VEWm5NMS9XZVZYcWdrVlVST0MvejF0aDFEeEpsU3F1UklrR0RHam80TktK?=
 =?utf-8?B?a2I1TU9pSDJ6M0tucTNpYy8xeGhLdm85bzFxaU5IYzFLNnFxYlBvRFBOck41?=
 =?utf-8?B?SWVxV0FxZFJOTDZISjdOc3BmS0RxcmZyaUJmY1h6RTVyQ1NQQzJTZnJnSHVx?=
 =?utf-8?B?UU9hc1RIM1JlaE1MckFVUmlxNG8zdHQ4dEhzc2FoaDlVa0wwcG5tenlOcnZQ?=
 =?utf-8?B?ZjA5OHYwemJVN3RldFM3NHJDcHR2TVZOWTR0K3JlRlZIVXY5N2g1WUtTaFZF?=
 =?utf-8?B?T2o0YWdwRVRldExPOFFMcXpwd05VVFh3RExTMklvUDVPbis4OEtLNHpqM0gw?=
 =?utf-8?B?MTh1WjgxL0Y5cmtPT0VXR2JmWTZaaTA3YnRHRzY2ZVJaR2dTY0ZMRjZ1Vk5z?=
 =?utf-8?B?dXJSWC9aYTEvU1JLblhBY3RxSHYzTW16dW5iMDRNWUJ4ODk0T1BjQ25WNmN0?=
 =?utf-8?B?Q3NlZEpPeXk0SkYwbHIzdzVHTHJKYjRkeE5sQVRLbHc3eTBJVWNXYURIQ1Jw?=
 =?utf-8?B?bWNXdVlzWC9WdUlJMFY1dWVIajVYOVJCQkFZdlEwUDhic0RIb1hYeTJYcmJQ?=
 =?utf-8?B?OWQyOG9WeGNCL3FYSW43VnZLcDdLT1pVZ1cxbzdFUzh0ZFBDaWtaQW1mcno1?=
 =?utf-8?B?cWh0TE9PZFV5a1ZRTTB1RjNsSlU1b3Ziak5CVDl1VGxUNkZxbWxGRDcycmVi?=
 =?utf-8?B?KzF5MEFQaVk4cHlldVBQeW1JUEJqS1laM1czWERYMEVyMDFWMk81U2UyZmFL?=
 =?utf-8?B?cGNxd3JrckZsVnJVZThwamxnaHoyLytLUjhpdHNGcWxvT1d5MUhjWm52bmRu?=
 =?utf-8?B?SHZwLysxVlNEZEVkelhnQmpqQUIyNjRzYndSc2ZYRnN0Y1dILzNTSXdiQW9S?=
 =?utf-8?B?YzlkbDlZMmxaVk03eURoZXF1c0tNR094TUVlUjF6dDc2Z296aDlxYm1GQjZz?=
 =?utf-8?B?Q1hvcFhsYnVnc043amRqY3BjQjJHWnhLbmp2ZmJvdEIxSHUrcVE5eVp6Q1hD?=
 =?utf-8?B?bjg3ckRXNXU0Qk1GOERIZzhtaENtczl0STYyTGhYQ0JUczA5a2ZNME45UVhD?=
 =?utf-8?B?d2IvVFZRc09SdzYrMWlJVnJGU21FVGVjdGQ1b1lvak4wa3U3WjF1dG1tSUhN?=
 =?utf-8?B?dGJydEFXV3hFZEJ0dks0TDZCYnhkVjNmSkFIMHJvMVpNVTVRUXVlN1BIUXE1?=
 =?utf-8?B?eGthalRIRmxCbXhMTHNSbWpBbzJWVUxpVHM1RDNmZHR5VVhMTm5PLzNKZlFk?=
 =?utf-8?B?cjA2dDVjUVJrbXZkMlZ0UWk2dkp0YjFrb09CMEVLRWlGdXpYVVY5Y2ZHQ0N1?=
 =?utf-8?B?NlJPOE83Nkk4NGFKdmEvVWtEL0g3V0pPb0tyRlBuM0NVSlRiamNZNkVrY3JJ?=
 =?utf-8?B?SWszZlduZ3FrcXR0eWFveWxCYXhnSUNGSTlscWFBWm96WGQyV01sZ3owd29R?=
 =?utf-8?B?QkdyOVFaYlRoc2pGcDdhVUJ4ai91VzRmSVlRN21jYUd2Sk1xQUw1dWFiR2dl?=
 =?utf-8?B?MnZKZGRaaEU5QitmNENQSHJhbHUvcE1XeFhkb1lPZjhCVkRscmdFVUpkbEZh?=
 =?utf-8?B?WVNtZWVOT3poM2pyMGFqeGFtK3hRM2R6czdTWW1JOUk0a3hOeXlESlVGenRi?=
 =?utf-8?B?WldabktWcml5MktkYXJ5Zm1sQ3UvRTc0YmpMcUFLSFozdXc0SHlzTGZyd0RU?=
 =?utf-8?B?bGp1UnlnU2laOUlIQVFHQ0F6L3JFWUMxdGFxY2o1VWVQWlZtUmFORmhhZnBw?=
 =?utf-8?B?TXZaYjhqN05VdU5KR3YxeUVEZ3pkUm9VUmtUbW81b292RG9XWmhpY1V2RlRL?=
 =?utf-8?B?em9rRmQzYk13V1BqZmI2SitNTldhUGd5L3FvR0NOdzZUaEluZW4vdzNMcG5O?=
 =?utf-8?B?ZWNzQ1U3Rjd0dDgzSUs1Z2dqVHRsWStTbDE2SjNMYXNCeEczaWZuNVpBSGll?=
 =?utf-8?B?Q1l1S0lEWkE3TTRsaEVZOGtwbG56M2RQZFA3RVlnRVBPVEh3akd6Nmt3K3Zy?=
 =?utf-8?B?OURvVHdJTFQrUlVBQjVxREdiSytXMmdqZFVtbDROcEpDbFdaOFJqa3M3Tzdx?=
 =?utf-8?B?MlJKK1A4WWk2Q0xiOGhiVDNjamd3UmxJNjVsYzhDTFhnbVhNZFVSdz09?=
X-Exchange-RoutingPolicyChecked: Pekmt8sUIaziBT2dL/TJdDoaZneIdNIvuy3WX+t1I2FIPjUEm+A4f/p8XIcTR8mjmBxJgFvLUfO+fjaTJbCkwZdA9wAylEPf4PhK9qhFNz4tR7cz66ZOxWK8rFptgifxsPUPB0Ov+eAhFu9E/Gh4YbO95eVqCkY+3qg9KEb0v+xcVNGblwN8GT+vuywnJwbieQEXH4zkJ+8AbTc7Fp24VbSvexC1YpoHGB542KgAVr1v9cYFUu3kx+ZykiPh5YAcDGb/FE3TRjKpaxsxosW+Xt5xbv5oCY6ZKg1hPkUzP7ZNopPuMz9yBEFGvhxh30NcwJjslv3HQWawjSse++XJLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 385b8e42-8f1b-4c2a-d477-08deb25df465
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:42:53.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNGh9urat/SeRGReSa0sc3Byw33g7RRClAkvajpX0Qxvr5HoGIcNNVtM/50tBT23W7wLhUNXBxaFOPcmrmmHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

--------------HNgmF69zotwaUCj5sJprHCPi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Swati,

On 5/1/2026 12:39 AM, Swati Sharma wrote:
> Add test cases where we are validating force dsc and force
> joiner.
>
> v2: -fix if() for ultra/big joiner (Ankit)
> v3: -Add '-' separator in subtest names when using
>       igt_get_joined_pipes_name (Santhosh)
> v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
>      -Use dsc-basic-%s format for subtest names (Ankit)
>      -Use igt_crtc_for_pipe() to check consecutive HW pipes,
>       handling fused pipe holes properly (Ankit)
> v5: -Use igt_display_n_crtcs() instead of open-coded
>       for_each_crtc counting loop (Jani)
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 203 +++++++++++++++++++++++++++---------------
>   1 file changed, 131 insertions(+), 72 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 69f335da3..9a19de1c4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -55,7 +55,27 @@
>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> - */
> + *
> + * SUBTEST: dsc-%s-%s
> + * Description: Tests Display Stream Compression functionality if supported by a
> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
> + *

IMHO, better to call out the default/existing tests as non-joiner to 
avoid any confusion.

May be we could have something like this:

 1. non-joiner: If display is non-joiner go ahead as is, if not force
    non-joiner.
 2. big-joiner: if display is big-joiner go ahead as is, if not force
    big-joiner.
 3. ultra-joiner: if display is ultra-joiner go ahead as is, if not
    force ultra-joiner.

> + * arg[1]:
> + *
> + * @basic:                        DSC with default parameters
> + * @with-bpc:                     DSC with certain input BPC for the connector
> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
> + * @with-output-formats:          DSC with output formats
> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
> + * @fractional-bpp:               DSC with fractional bpp with default parameters
> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + *
> + * arg[2]:
> + *
> + * @bigjoiner:			  big joiner
> + * @ultrajoiner:		  ultra joiner
> +*/
>   
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
> @@ -81,11 +101,13 @@ typedef struct {
>   	int disp_ver;
>   	igt_crtc_t *crtc;
>   	bool limited;
> +	enum joined_pipes force_joined_pipes;
>   } data_t;
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>   static uint32_t bpc_list[] = {8, 10, 12};
> +static enum joined_pipes joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>   
>   static inline void manual(const char *expected)
>   {
> @@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	int current_bpc = 0;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
> +	bool status;
>   	igt_output_t *output = data->output;
>   	igt_display_t *display = &data->display;
>   	drmModeConnector *connector = output->config.connector;
> @@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
>   	save_force_dsc_en(data->drm_fd, data->output);
>   	force_dsc_enable(data->drm_fd, data->output);
>   
> +	if (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER || data->force_joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->force_joined_pipes);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +
There seem to be few more issues with checkpatch here, mostly the 
LONG_LINE which is okay if unavoidable but I feel in most places it 
could be handled here. So please check.
>   	if (test_type & TEST_DSC_BPC) {
>   		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>   		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> @@ -246,11 +274,13 @@ reset:
>   
>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     enum joined_pipes joined_pipes)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
> +	int n_pipes = igt_display_n_crtcs(display);
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
> @@ -259,12 +289,17 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> +	if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
> +		return;
> +
>   	for_each_crtc_with_valid_output(display, crtc, output) {
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
>   		data->output = output;
>   		data->crtc = crtc;
> +		data->force_joined_pipes = joined_pipes;
>   
>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
> @@ -285,6 +320,26 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   						      data->drm_fd, data->output)))
>   			continue;
>   
> +		/*
> +		 * Check joiner constraints and verify that we have
> +		 * enough consecutive HW pipes starting from this crtc.
> +		 * Use igt_crtc_for_pipe() to handle fused pipe holes.
> +		 */
> +		if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +		    !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						  n_pipes, joined_pipes))
> +			continue;
> +
> +		if (joined_pipes == JOINED_PIPES_BIG_JOINER &&
> +		    !igt_crtc_for_pipe(display, crtc->pipe + 1))
> +			continue;
> +
> +		if (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
> +		    (!igt_crtc_for_pipe(display, crtc->pipe + 1) ||
> +		     !igt_crtc_for_pipe(display, crtc->pipe + 2) ||
> +		     !igt_crtc_for_pipe(display, crtc->pipe + 3)))
> +			continue;

Could this be added in the joiner helper rather than having it specific 
to test?

Thanks and Regards,
Karthik.B.S
> +
>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   		if (test_type & TEST_DSC_FORMAT)
> @@ -334,85 +389,89 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>   	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters");
> +		igt_subtest_with_dynamic_f("dsc-basic%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> -			}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters and creating fb with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>   		}
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>   			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> +					bpc_list[j], format_list[k],
> +					DSC_FORMAT_RGB, joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888,
> +					 output_format_list[k], joiner_tests[i]);
> +		}
> +
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k], joiner_tests[i]);
> +				}
> +			}
> +		}
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i]))
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with certain input BPC for the connector.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +			}
>   	}
>   
>   	igt_fixture() {
--------------HNgmF69zotwaUCj5sJprHCPi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Swati,</p>
    <div class="moz-cite-prefix">On 5/1/2026 12:39 AM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260430190947.2347314-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">Add test cases where we are validating force dsc and force
joiner.

v2: -fix if() for ultra/big joiner (Ankit)
v3: -Add '-' separator in subtest names when using
     igt_get_joined_pipes_name (Santhosh)
v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
    -Use dsc-basic-%s format for subtest names (Ankit)
    -Use igt_crtc_for_pipe() to check consecutive HW pipes,
     handling fused pipe holes properly (Ankit)
v5: -Use igt_display_n_crtcs() instead of open-coded
     for_each_crtc counting loop (Jani)

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel/kms_dsc.c | 203 +++++++++++++++++++++++++++---------------
 1 file changed, 131 insertions(+), 72 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 69f335da3..9a19de1c4 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -55,7 +55,27 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
- */
+ *
+ * SUBTEST: dsc-%s-%s
+ * Description: Tests Display Stream Compression functionality if supported by a
+ *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
+ *</pre>
    </blockquote>
    <p>IMHO, better to call out the default/existing tests as non-joiner
      to avoid any confusion.</p>
    <p>May be we could have something like this:<span data-teams="true"><br>
        <ol>
          <li>non-joiner: If display is non-joiner go ahead as is, if
            not force non-joiner.</li>
          <li>big-joiner: if display is big-joiner go ahead as is, if
            not force big-joiner.</li>
          <li>ultra-joiner: if display is ultra-joiner go ahead as is,
            if not force ultra-joiner.</li>
        </ol>
      </span></p>
    <blockquote type="cite" cite="mid:20260430190947.2347314-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ * arg[1]:
+ *
+ * @basic:                        DSC with default parameters
+ * @with-bpc:                     DSC with certain input BPC for the connector
+ * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
+ * @with-formats:                 DSC with default parameters and creating fb with diff formats
+ * @with-output-formats:          DSC with output formats
+ * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
+ * @fractional-bpp:               DSC with fractional bpp with default parameters
+ * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ *
+ * arg[2]:
+ *
+ * @bigjoiner:			  big joiner
+ * @ultrajoiner:		  ultra joiner
+*/
 
 IGT_TEST_DESCRIPTION(&quot;Test to validate display stream compression&quot;);
 
@@ -81,11 +101,13 @@ typedef struct {
 	int disp_ver;
 	igt_crtc_t *crtc;
 	bool limited;
+	enum joined_pipes force_joined_pipes;
 } data_t;
 
 static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
 static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {8, 10, 12};
+static enum joined_pipes joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
 
 static inline void manual(const char *expected)
 {
@@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	int current_bpc = 0;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
+	bool status;
 	igt_output_t *output = data-&gt;output;
 	igt_display_t *display = &amp;data-&gt;display;
 	drmModeConnector *connector = output-&gt;config.connector;
@@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
 	save_force_dsc_en(data-&gt;drm_fd, data-&gt;output);
 	force_dsc_enable(data-&gt;drm_fd, data-&gt;output);
 
+	if (data-&gt;force_joined_pipes == JOINED_PIPES_BIG_JOINER || data-&gt;force_joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
+		status = kmstest_force_connector_joiner(data-&gt;drm_fd, connector, data-&gt;force_joined_pipes);
+		igt_assert_f(status, &quot;Failed to toggle force joiner\n&quot;);
+	}
+</pre>
    </blockquote>
    There seem to be few more issues with checkpatch here, mostly the
    LONG_LINE which is okay if unavoidable but I feel in most places it
    could be handled here. So please check.
    <blockquote type="cite" cite="mid:20260430190947.2347314-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	if (test_type &amp; TEST_DSC_BPC) {
 		igt_debug(&quot;Trying to set input BPC to %d\n&quot;, data-&gt;input_bpc);
 		force_dsc_enable_bpc(data-&gt;drm_fd, data-&gt;output, data-&gt;input_bpc);
@@ -246,11 +274,13 @@ reset:
 
 static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
-		     enum dsc_output_format output_format)
+		     enum dsc_output_format output_format,
+		     enum joined_pipes joined_pipes)
 {
 	igt_display_t *display = &amp;data-&gt;display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	int n_pipes = igt_display_n_crtcs(display);
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -259,12 +289,17 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 
 	igt_require(check_gen11_bpc_constraint(data-&gt;drm_fd, data-&gt;input_bpc));
 
+	if (joined_pipes != JOINED_PIPES_DEFAULT &amp;&amp;
+	    !igt_is_joiner_supported_by_source(data-&gt;drm_fd, joined_pipes))
+		return;
+
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		data-&gt;output_format = output_format;
 		data-&gt;plane_format = plane_format;
 		data-&gt;input_bpc = bpc;
 		data-&gt;output = output;
 		data-&gt;crtc = crtc;
+		data-&gt;force_joined_pipes = joined_pipes;
 
 		if (!is_dsc_supported_by_sink(data-&gt;drm_fd, data-&gt;output) ||
 		    !check_gen11_dp_constraint(data-&gt;drm_fd, data-&gt;output, data-&gt;crtc))
@@ -285,6 +320,26 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						      data-&gt;drm_fd, data-&gt;output)))
 			continue;
 
+		/*
+		 * Check joiner constraints and verify that we have
+		 * enough consecutive HW pipes starting from this crtc.
+		 * Use igt_crtc_for_pipe() to handle fused pipe holes.
+		 */
+		if (joined_pipes != JOINED_PIPES_DEFAULT &amp;&amp;
+		    !check_dsc_joiner_constraints(data-&gt;drm_fd, data-&gt;output,
+						  n_pipes, joined_pipes))
+			continue;
+
+		if (joined_pipes == JOINED_PIPES_BIG_JOINER &amp;&amp;
+		    !igt_crtc_for_pipe(display, crtc-&gt;pipe + 1))
+			continue;
+
+		if (joined_pipes == JOINED_PIPES_ULTRA_JOINER &amp;&amp;
+		    (!igt_crtc_for_pipe(display, crtc-&gt;pipe + 1) ||
+		     !igt_crtc_for_pipe(display, crtc-&gt;pipe + 2) ||
+		     !igt_crtc_for_pipe(display, crtc-&gt;pipe + 3)))
+			continue;</pre>
    </blockquote>
    <p>Could this be added in the joiner helper rather than having it
      specific to test?</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:20260430190947.2347314-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 		if (test_type &amp; TEST_DSC_OUTPUT_FORMAT)
 			snprintf(&amp;name[0][0], LEN, &quot;-%s&quot;, kmstest_dsc_output_format_str(data-&gt;output_format));
 		if (test_type &amp; TEST_DSC_FORMAT)
@@ -334,85 +389,89 @@ int igt_main_args(&quot;l&quot;, NULL, help_str, opt_handler, &amp;data)
 		igt_require(is_dsc_supported_by_source(data.drm_fd));
 	}
 
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC on all connectors that support it &quot;
-		     &quot;with default parameters&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-basic&quot;)
-			test_dsc(&amp;data, TEST_DSC_BASIC, DEFAULT_BPC,
-				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
-
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC on all connectors that support it &quot;
-		     &quot;with default parameters and creating fb with diff formats&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-with-formats&quot;) {
-		for (int k = 0; k &lt; ARRAY_SIZE(format_list); k++)
-			test_dsc(&amp;data, TEST_DSC_FORMAT, DEFAULT_BPC,
-				 format_list[k], DSC_FORMAT_RGB);
-	}
 
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC on all connectors that support it &quot;
-		     &quot;with certain input BPC for the connector&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-with-bpc&quot;) {
-		for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&amp;data, TEST_DSC_BPC, bpc_list[j],
-				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
-	}
+	for (int i = 0; i &lt; ARRAY_SIZE(joiner_tests) ; i++) {
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC on all connectors that support it &quot;
+			     &quot;with default parameters&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-basic%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+				test_dsc(&amp;data, TEST_DSC_BASIC, DEFAULT_BPC,
+					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
+		}
 
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC on all connectors that support it &quot;
-		     &quot;with certain input BPC for the connector with diff formats&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-with-bpc-formats&quot;) {
-		for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++) {
-			for (int k = 0; k &lt; ARRAY_SIZE(format_list); k++) {
-				test_dsc(&amp;data, TEST_DSC_BPC | TEST_DSC_FORMAT,
-				bpc_list[j], format_list[k],
-				DSC_FORMAT_RGB);
-			}
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC on all connectors that support it &quot;
+			     &quot;with default parameters and creating fb with diff formats&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-with-formats%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k &lt; ARRAY_SIZE(format_list); k++)
+				test_dsc(&amp;data, TEST_DSC_FORMAT, DEFAULT_BPC,
+					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
 		}
-	}
 
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC and output format on all connectors &quot;
-		     &quot;that support it&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-with-output-formats&quot;) {
-		for (int k = 0; k &lt; ARRAY_SIZE(output_format_list); k++)
-			test_dsc(&amp;data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
-				 DRM_FORMAT_XRGB8888,
-				 output_format_list[k]);
-	}
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC on all connectors that support it &quot;
+			     &quot;with certain input BPC for the connector&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-with-bpc%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&amp;data, TEST_DSC_BPC, bpc_list[j],
+					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
+		}
 
-	igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
-		     &quot;by a connector by forcing DSC and output format on all connectors &quot;
-		     &quot;that support it with certain input BPC for the connector&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-with-output-formats-with-bpc&quot;) {
-		for (int k = 0; k &lt; ARRAY_SIZE(output_format_list); k++) {
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC on all connectors that support it &quot;
+			     &quot;with certain input BPC for the connector with diff formats&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-with-bpc-formats%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
 			for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++) {
-				test_dsc(&amp;data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
-					 bpc_list[j], DRM_FORMAT_XRGB8888,
-					 output_format_list[k]);
+				for (int k = 0; k &lt; ARRAY_SIZE(format_list); k++) {
+					test_dsc(&amp;data, TEST_DSC_BPC | TEST_DSC_FORMAT,
+					bpc_list[j], format_list[k],
+					DSC_FORMAT_RGB, joiner_tests[i]);
+				}
 			}
 		}
-	}
 
-	igt_describe(&quot;Tests fractional compressed bpp functionality if supported &quot;
-		     &quot;by a connector by forcing fractional_bpp on all connectors that support it &quot;
-		     &quot;with default parameter. While finding the optimum compressed bpp, driver will &quot;
-		     &quot;skip over the compressed bpps with integer values. It will go ahead with DSC, &quot;
-		     &quot;iff compressed bpp is fractional, failing in which, it will fail the commit.&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-fractional-bpp&quot;)
-			test_dsc(&amp;data, TEST_DSC_FRACTIONAL_BPP,
-				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
-				 DSC_FORMAT_RGB);
-
-	igt_describe(&quot;Tests fractional compressed bpp functionality if supported &quot;
-		     &quot;by a connector by forcing fractional_bpp on all connectors that support it &quot;
-		     &quot;with certain input BPC for the connector.&quot;);
-	igt_subtest_with_dynamic(&quot;dsc-fractional-bpp-with-bpc&quot;) {
-		for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&amp;data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
-				 bpc_list[j], DRM_FORMAT_XRGB8888,
-				 DSC_FORMAT_RGB);
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC and output format on all connectors &quot;
+			     &quot;that support it&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-with-output-formats%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k &lt; ARRAY_SIZE(output_format_list); k++)
+				test_dsc(&amp;data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
+					 DRM_FORMAT_XRGB8888,
+					 output_format_list[k], joiner_tests[i]);
+		}
+
+		igt_describe(&quot;Tests basic display stream compression functionality if supported &quot;
+			     &quot;by a connector by forcing DSC and output format on all connectors &quot;
+			     &quot;that support it with certain input BPC for the connector&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-with-output-formats-with-bpc%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k &lt; ARRAY_SIZE(output_format_list); k++) {
+				for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++) {
+					test_dsc(&amp;data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
+						 bpc_list[j], DRM_FORMAT_XRGB8888,
+						 output_format_list[k], joiner_tests[i]);
+				}
+			}
+		}
+
+		igt_describe(&quot;Tests fractional compressed bpp functionality if supported &quot;
+			     &quot;by a connector by forcing fractional_bpp on all connectors that support it &quot;
+			     &quot;with default parameter. While finding the optimum compressed bpp, driver will &quot;
+			     &quot;skip over the compressed bpps with integer values. It will go ahead with DSC, &quot;
+			     &quot;iff compressed bpp is fractional, failing in which, it will fail the commit.&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-fractional-bpp%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i]))
+				test_dsc(&amp;data, TEST_DSC_FRACTIONAL_BPP,
+					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+
+		igt_describe(&quot;Tests fractional compressed bpp functionality if supported &quot;
+			     &quot;by a connector by forcing fractional_bpp on all connectors that support it &quot;
+			     &quot;with certain input BPC for the connector.&quot;);
+		igt_subtest_with_dynamic_f(&quot;dsc-fractional-bpp-with-bpc%s%s&quot;, joiner_tests[i] ? &quot;-&quot; : &quot;&quot;, igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int j = 0; j &lt; ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&amp;data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+					 bpc_list[j], DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+			}
 	}
 
 	igt_fixture() {
</pre>
    </blockquote>
  </body>
</html>

--------------HNgmF69zotwaUCj5sJprHCPi--
