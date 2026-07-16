Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E4C44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 08:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A8010E2B7;
	Thu, 16 Jul 2026 08:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW2H/4I6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD1610E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784189814; x=1815725814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GINphzpUqWXNWJogwf/lazPd2HPBHYGPmNhYR8Uxnwc=;
 b=HW2H/4I6u3ZityWyaLbykwhbcHtQX2A2ZarK1duojKFaPcFiO3dqYHUN
 c+8FUnEko3LYM3OHjNrZSGSm8MQ6QgucnkijsZlWlasPhPwwNOTJ9obzy
 MjbhkrqhVkoYW8PuwByQkX9W95CYoUiEEBLnHWXFqyywzc4MEU+Vs/1ts
 Wqm6sCfezfK6Szrdr0ivZq90tI1geD9BCySGckT8c3ucH7q9SMl4ybf1S
 eDUjRz+RHEGtZWhQDGMDcw/BR6oWazh13CA8bvNPe95AWsitrID25hNJL
 jIWW6TtX+C49Q1HV6BTNXb86dtO8HJ+v753GrfwTnXXSfDkkbiZJ2aSnT w==;
X-CSE-ConnectionGUID: am7b+FdkQcGtZ3q2hdiSkQ==
X-CSE-MsgGUID: FqBHS7psR+eqDwDc0w7pWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110390078"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="110390078"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:16:53 -0700
X-CSE-ConnectionGUID: 3KIQuwvNQnKoKwJ6nfumIA==
X-CSE-MsgGUID: Ru8IY97HSNykYc3uNyPs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="257075043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:16:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:16:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:16:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af7Jhljz/c0IYBszSjZFBZ72qjCqVHR6Rs8Na5yv1u0EpgsF39QWmaS1qp8lqL1uqt/0kR5nJDRjx8jEXB4LNZOq4yDepi2JmTWKYnJ/tk8x5DlnP0Dk7SIg5W/Lzn7Bq6BOYcjBBSOYue+en7KU1Hi6HeEVOJ3PTyH6Jh+ozEt/3v9uRY9CGjuND96EuiHxGd9yibT+SotSevrj1lya358ydxWT2dKlFnc0Q0k7XdBGPOQyJBAv1DBqPATTxLPWxlHNq5ElaBNeMInZ/hoojhhH2CMcSEAvupU/T7VRhP5tznv0bsEUYCmZ0D0UoHyY1xta2Stvk7odL9XnF7TDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv/FfuXwBXcmkfV0DVbcTwDjoCwS4ruyxMNGqv+NRW4=;
 b=himJK7O8t9UbfLqMSXz5BUghf1RYkisiez6W+De0Q3VHl3pW/4OA2zmiQb2tOLhU9U4t2DDW9vcBCAc9GuIVcsjrTK8Y/lMjPfW4liIdAXXKSKiGpOpPsbkLheAF6SY6Bs4rVm4iK6Axz3L8Kz6OtFt2w1veN1nWCUDWtS9iHUsoxCxz/WMlkdrlY/WMPqyJmwzsJfq49cyQ0XpUKb/xMMNI6cS7+ZI1AHy7kUdCwH5UWiOCJ91YY8g1OpO9FyxGOZTvUIvvEmnkQz2pF5y6QDgfGDkgwozgq5ozPDDQmgG0KVpXVvcFyw13UgsBdjf/p5grXGBcxDPcdE3Nq5bNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:16:50 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 08:16:50 +0000
Date: Thu, 16 Jul 2026 08:16:39 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 10/31] lib/i915/intel_decode: replace igt.h with
 minimal headers
Message-ID: <5vq5rzybp3xqemlmgc5v6ixfduy7o4lobejzciclajx7bane3j@wynnwk5papcy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <40f39262ecc50f3dc94d69cd37490bb98df98962.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <40f39262ecc50f3dc94d69cd37490bb98df98962.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6b6b56-516a-4dc1-3c12-08dee31295f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qH5PJon6rjzEGEfvrRctWP3sVKt4qujOr5/FF+Dh+VMQGW8djr5fQH5HnbyzMIi1rnsR5+9OckczanFxQFPjX8/wqr/gqtOvP+7OCTuPjo/invXjb3BNF9BuGcgFyv7oRzzxRLQ9xMH7nYGBVaYz26OIf+u+l5Ab6TQjd8TKd6uN+XsSmV03o28k8P9qhovL/s04GwidZIyKK4jydS5/tRy+FZuVzX92ePyID/YDEyC2eEo0uNVWaJohDPy8Fhs6OzJOxCVg5qlGxN+L06lho8AV5FPqpErwziYVPKD1n/JzayAauGnciHccUDJlvBufGyJZ5mf+aj/j6MKzMjOvA07Qrm8VHmAYsjwuMCXW8ol+KSsNGOXN9j1LMoGvZPNHndRFrsxRCABimWf2M2qpwgmYGTSnXAdvpnGvje3hrbnKO/P29d3LfQqwI52vmlBNJMXOiVJ67ELj/4VMX6EG5cBvT1lFG/JEMqfQEJGkKRbLINQ72VM4dvBI8i3XUAQvIJD1Rg+LrwixbGoq2QztTaMm+P5dOdwpzDiM6nV+Duf71ze0JG9pcAf5J5htmrPyMn7K1lRu0iCmGLagehfxXjmWWxlKkq+GYOCXy8aZRmWFbeRA0M8HClBCyNnwUAmWp1sImTI/sP3n/CpTHu7ZyjH/9N3AmQ/W6NPsfc8f2mY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzQ5T00xVldEYUl1cGtKMUhMVDlzUFlTQmxmUTd4blhjWHBqY3d6b0V4alpI?=
 =?utf-8?B?ZWVRcEc0bG5DWWwyUldKWnI0ampkVnNLYm80WW8rRjVLVkpTREN2Y21ta3gr?=
 =?utf-8?B?T3Z6alVGbTh6U1ZUajR2ZTUrL1BhSjJJTUhoNHB5d2lJKzlsV3RlMkhYL2I5?=
 =?utf-8?B?akM0TEhyVXdtQ1V5M1haMW9DR0lBRjZuQ0ZzcjY0Uk9ncXBINlB5QU1LVnFB?=
 =?utf-8?B?ZHlFaGVPVkE0OEt3OFZXRk81VHU5MEM0WDNjSFQwVlRhcUVYblQ3UktzMXBE?=
 =?utf-8?B?L2VpMzZjRmdBbmh3aENmYUxaUzR6UVVBUE9UU0oxMjZvWUxWc0J1K0FGaFhC?=
 =?utf-8?B?c0g2dm1lUEtnd1BYaFlNTnFta0tOY0IyOVg4MkNlaW1XMjZWVG9RZlk5UFRv?=
 =?utf-8?B?SG9QVlJjdWdPSFF1RkozYVZhQXdyOGlKS2FtdmpGOEVHWWdLRllMTjduc3da?=
 =?utf-8?B?NG9tOXJFRmJ0Z3dod3FkdERZNEhyVkUvTDBPREIyZHY2TXRORDBRdVNhMzIv?=
 =?utf-8?B?RUFkekdLeFFSUVJyT09aaW5GdUY5Z25XQ3o5U2dpQ1U1OCt2MnBmOFBlT3dL?=
 =?utf-8?B?QlJRK21DdHZ0Vm90aWhhVUZVbE1uaGxYWFg4Z052SXhOa3JJditGbGs1U3Az?=
 =?utf-8?B?a0VUVmlCa1B3R1IxQnQ0a1h6dU5qL3FxWVFxRUdUcThSeDBYK21Bdm02Z0F6?=
 =?utf-8?B?MFN5R05WNXVaRzJ6elE1RVVwRU1NU2NsREtVSlp1aW1uUldhR3I0MmxnQlk5?=
 =?utf-8?B?cW5Dcmx6R0hCZ0hBTFdBZjRkemQ0TzY1R1IvNXBtOWRYdjN0cXZtUFl3Q2xi?=
 =?utf-8?B?SkV3YkhmWE1sNWMrbXpOODF0TmpQNndTM0cwSGtKaE1rWUhPdHRVb2dlOWE2?=
 =?utf-8?B?WGUyK1l0Znc1aEUwSXlmY1ZUY0tzVlFQYzBYZjM1ZkpteUNMcnc5VFc3NE5v?=
 =?utf-8?B?emJXQS84R3kvZnRqcm1VOVFESHV6RFJOSWlQN3JuaUlNRTNjdmNDTGhnMXRu?=
 =?utf-8?B?bHc5N2lJNkpHeW56cUNWYUVBdS8xajdIWkhmZFdaMWIzRWU1bzUwNXdnMFVM?=
 =?utf-8?B?blBxL0J2K1RCVlJYZ3RSN0JEaE9CRGk0YnRVOC9CelRNajdEQWlzNHh5SXha?=
 =?utf-8?B?bjd2aTVza1FLdk45NDF1RWs4UUxIemQyYnBtOVRWaDNnTEwvaFdIUGRHSG1v?=
 =?utf-8?B?VEJvNGNTVFY3UHRubXNaTWM1eWEwWkdFbi9qTnpya1pLTW1wUFpKNHRDNk9h?=
 =?utf-8?B?OXNJZmc2eDJ5Zm0vTW1ldElnZDhOR040Qmh4aEdsazlkd0MyNnpwNGc0TnFH?=
 =?utf-8?B?bjBpRE1ISDVzNHUwUytWYjRoSEhlbTZYdVRacVlPeVZ2SkV2L3FlMklzMHl5?=
 =?utf-8?B?aU8rTUh2WUx6b1VGVEVxeGdDMUZtVnVadHhDaFpPL0E2bWx0c1ZJTnI0T3lx?=
 =?utf-8?B?ZXY3QS9NWDVvTzlSTWdnV1NPN3F5MkQrZ2pkVjQ4cDcyNkdvZHY3NHFwekFh?=
 =?utf-8?B?RFdheXdIdy9ZdlRYSWdWbEo0RmNyREZDN204OXg2ZmRwUE1nZ083QWJ3US9K?=
 =?utf-8?B?QTJEQjRLM3E2WFBUSUlicEs0UUVrbm1vQTVkdTVtZ3JtR3FQWHpuWjlqL1hn?=
 =?utf-8?B?RHUxdFVxUmQ0MkdaNVUwcUM0Z3pxTDVaZ0s4VkhhNWtTUHF3Qy94TUd3Z3hi?=
 =?utf-8?B?RUowdFV0U1c3aytHd2VmbmJUYmJDcHF2YXhxdWxBeEswZ3lET3dCMDIrbmt1?=
 =?utf-8?B?d1ZKQXRydWlNSzFjdVZiZDZrRjFRemhpdXRyOUxrUWFoQjdnN0QwZXk3d3lK?=
 =?utf-8?B?ZFZ0UEw5ZCt5TkU3ZG1NMlRXaFlCUGxDYmg0c3VQSTlUdWVBREQxTjRzaW9M?=
 =?utf-8?B?UGVhVThVWXVjSDVBc1VFMW54OWFKTDZ5d3hubUdEUms2eTYwK0Z1VkZ3b094?=
 =?utf-8?B?VmlNVEJPd3ZtUlVNR2FWUDF6Sm50Z1k2cnVCVTkreWpKRGRhcXRxUzI0UGJ6?=
 =?utf-8?B?OSsvcHlPNzdGcGFNcVl4dDdWRHU3OTRVYm56bUpNbXBtbDVNWTAxaENDSzkz?=
 =?utf-8?B?VWsvS0NLUjVkVGpOaVNIMkF4bXNvY3FCcktoOEM1QlJaU3JDVFNHS1pFejJl?=
 =?utf-8?B?SmFEK05FM3R5TTYxNEF6QjRmalcxODFDNkZtV2U3Z2YveElrdjJ4WTNmTGRB?=
 =?utf-8?B?WmdnMXRCZ3AyeHJFMm9tSTVSd2Q5aEVRL2ZYbnUzTzFkd01rR2ZWRklhanVL?=
 =?utf-8?B?SmxsWUNHUGl1NE04aERkNGpnTGgyMHpIQy9Na1RvVlVtRzhTTHBoYi8vOE1T?=
 =?utf-8?B?NnFNS3NyaTY0cm1BMGFJSjUvdXZZWWt0VDNmY045cHg4cEYwcW43WmUwZkZi?=
 =?utf-8?Q?/CnoOXeRw/wdFpBQ=3D?=
X-Exchange-RoutingPolicyChecked: JhmeakylgqFhmqou5kQuOg1AJ81nFAu8iuBLVS8hU75v6LZ7Y+w0z9hBqqKRzXua4G43POU4RS3OFNNoqpXfUGSESFumGMVb75MQtH5fWcmlIM5boZu98s2xa1Zgb0FfRd2zCE2MTtVsf6YSVgNgwOQnkm1t99VExFkdDH44flafDKh7X3fHOKhUwqcQVgh05CNhSRyUjJA/2Cee3RoBftxdSYAaMSAsbqWpUPY++gh5+/vDkg989+3zPfhBwp1Olrmv6Up9P6HgC+tUQjvhWahZeXYNFXENMuMQbuw6rMG6EFI8Yvrcfv5wixyQMkzsvmJ8ANpiCdn+jt6yJW1Ktw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6b6b56-516a-4dc1-3c12-08dee31295f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:16:50.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnU3rN0RIc0QgV90BX5gCR8GZXz5UxZ9xkTrTKwTs5H3rbC2pQm7pKfwN9hsqp4/LYP5s+ExKS/36s01CztTxQy5aPAuae7JBwTfrmPAkq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
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

Hi,

On 2026-07-15 at 14:15:20 +0200, Sebastian Brzezinka wrote:
> intel_decode.c only uses two symbols from the IGT: intel_gen()
> and intel_get_device_info(), both provided by intel_chipset.h.
> The DRM_PRINTFLIKE macro used for the instr_out() format attribute is
> provided by xf86drm.h.
> 
> This is a prerequisite for building intel_decode.c into a static
> sub-library (lib_i915_decode) that tools can link without pulling in
> the full libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/i915/intel_decode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
> index b78993c47..0b404ae53 100644
> --- a/lib/i915/intel_decode.c
> +++ b/lib/i915/intel_decode.c
> @@ -28,8 +28,9 @@
>  #include <stdbool.h>
>  #include <stdarg.h>
>  #include <string.h>
> +#include <xf86drm.h>
>  
> -#include "igt.h"
> +#include "intel_chipset.h"
>  #include "intel_decode.h"
>  
>  /* Struct for tracking intel_decode state. */
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
