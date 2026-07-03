Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53EEC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 19:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4652610E179;
	Fri,  3 Jul 2026 19:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOt2vBCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E3610E65B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783106673; x=1814642673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ibnrarCUJ3R8uGCe95AGrYIcBu/npwwxZ2YEjNdNALY=;
 b=bOt2vBCYK15gcBN6cxTF95S9DymZBt+tlVa2dLhq2btg9t/KgEbgPO3I
 MfsiG++8az1IdZKWYjg6ae9w467qNyKYhU3vSxaGkJulXf6/MbNNxo3rY
 7Iz6uqVPgT+aLwqVLngaQ0hpQ6jdmZKTqLcuejtpV+eiNUJ86ZcyDbe3t
 7tqRFQ0Qpndra+S/akK7iVp0yTS913QXm4tvEQq/38gVmQ083RQK8Rilq
 zrfKtInySDBpqI0LIi3GhVBMnkdAOVoliencxyHJ2WvOG6C+zimP7HVvr
 UKFNOlrZIk3x0IMwtUEseriivmIaKF1ULwKZP0ZZPw6F3cRYcoa55/UuK A==;
X-CSE-ConnectionGUID: 1e6GBxxTQ32Dz65bWeIScw==
X-CSE-MsgGUID: ts2GoE6lSF+h3xjrGiBvpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95015675"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95015675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:24:33 -0700
X-CSE-ConnectionGUID: CfodufpxT6u9qABbUWglKA==
X-CSE-MsgGUID: OER28E1OR3G+zBadZDRn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="256749650"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:24:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:24:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 12:24:32 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwX7DMeRgJoRxTMpVtxXbUdhne7fqWWtynCFtq7USUjPjGwNreueG4DmdduIvN7eYSQ7AVOyjKjW5XDuqgXm4irZGk1YXMNSuDgHb9JPvxQqVjM/ME0nBkZm1RY5zUcEAx6zixtnmpdBIbgxnbPC65j92ftwH0jU66zirjqqJoC9xXC8qNbGvqgPHNt74guOyS85W4JMIvmbpGuH3uNlC0Xb27UGGPJQ8CdpOq4DnZrPlhnSYeWIGEo4ScAx8WCcf34v8lu5JKMuxSVKTgli9r8nwxf8VWh9tYZTo1+g6bFKTCSGsRtLayaWdgPF52C6969J2JU0oNPWURZJoYEjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKJfdGn5WPRNGZ/C45ZWQa8uFMjjBfYOMmSDicuYnXc=;
 b=xbt0ubWTXpj8UwZ4Q2itHAloIKWf2b587Grja9u8P6vP/uoOdJCj6Ff4kJTt545zMsxJppRQy4lSOaWyfQzXttoC42fArY16nuh7kly7mKBmZFnAQN1rJZjjsL/Gmp/W5NXTi7607S60PoY7nAoXI9XW8vVq7XhPl6J5oqHHJsm7acJdkBNOiF94WurutbVQlOYoEyEHONKobeTQtqR5U/erI2NRx/q9Kabdq1jknBIjO6Eie5RJluLN8LLbN+gM4z0PNza6CWuojiLQGd0VYo+eDY8anWf42S5pWWL3T8WvS0SgvcXl3fI6POnyi4IrTa7Np7B1URZh2XGtp/Vp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 19:24:25 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 19:24:25 +0000
Date: Fri, 3 Jul 2026 21:24:19 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 04/31] tools/intel_firmware_decode: link with
 minimal sub-libraries
Message-ID: <nxk6hkamhv3invx76tjcq6relungkjbytgt7upohet3jfxybkn@37hzzebcv5b7>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <0bec7a4c3cea13d25059c26eebb4ac1446e161ea.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0bec7a4c3cea13d25059c26eebb4ac1446e161ea.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::19) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ce3052-5b1b-4897-44be-08ded938b189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|23010399003|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ABVAsJUKo7+VrJpnt0fJLnX/5EWcSSac51A7bdWmPo22dTKQZ1qiVf1cfDHhbN9nx1DBQn6FWjrazQIsnVbUKptBm6dUumBD8MFun+AafAXm4LZX7dWhLCwq+syYr+WQmCQSHy2gcuIW/xXC3aP09YGes5bZJdkQfHtuRaJ4szjzFGgeHS7XWQIH0owKSE5XUfITjO2a+xgv40jWBYRWZuPap3ADnz9enGQlgR4Hf4xrF0xetInZvBGSVyXMW6haISHgo/UK8Wr+o8J9esWskbdPPFA/7Ok5TQhDk22ieyUI7R5QvmZ4M+fwYmJbEJeAioW6hftHdPom4z31NtO9ZEwLlhBXo1vtQnMPxBJ6+HsUlSajmWD6mDxBjlZp/SepBkYLHlDhPvPvq/DDsM0nagw/Pn5+0GvLRSQZ38BB9ZdI9t9Do0lI/oRmwnoeqjxi0GhSPiyoluE1HzQdD0NgJLu9abS3+wgDmKkLBzM/cHsbOh3mvTAebKVvUuBD6+uuunejsFQmhOR2F9nf0udqEqKFf7iZ6WuPxpsAVLZj6W/i0ZkadZN9RQ97N8hYU7IzmXw70r8wFmLnA66P018TKsZE7cKSRXcjvVdoDityyb8A74ORkARpgu0UgFVNEf+PBf694zSW3k2GxeTnSGdm3BVX6OGy6ss37NdKHkRpZ2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUF5YzQxNW5PNXoyYUttekdweXN6bHZpZmVodWZoZ2pCQksrdGpaanpDUHpT?=
 =?utf-8?B?TVZtY2lLVnRlT3gxdmlaZklyWVFRUTMyR3l4RWdTZno5R05mWlRndWppZnk5?=
 =?utf-8?B?MUNqMEtyQWROQ2h1UUZFWTdFYi9vajhSZmg3U0lUNjk0Mm0xaTU4emd0TUwv?=
 =?utf-8?B?MTFHVCsrdmxoTlNjdlE3cHEza2JBWmxuZHpBYjJKRU1UaFRBeGlHa08xMDlY?=
 =?utf-8?B?TXptejZEYnRyaDA4WE9OUlJXQ05tSzV1VjJ6TVhqQ0xndDNMczdHVzgrWGZr?=
 =?utf-8?B?bzhMOWlBZVpzd3g0c0EyY3R1OHcvRlFKWVpiWm1RMVVGWGdYUURock14M2tZ?=
 =?utf-8?B?b28zWDR3ZzhCRE1MVkhuSWRuV1VJN01DQmFjcy8vejlCQWlWK0VFcGpmZkJK?=
 =?utf-8?B?dmdKa0g0VmpnUWsycVRuam94UVRnMVdXZ0JSL0VwUmNRczFZRnpsLy9UZXNp?=
 =?utf-8?B?Q2hKWjJYT0FtRk4rMXRTc2l4Ny9JZWVoK3ZBNUVNUnVIM2d5MGMrYU5BOTUw?=
 =?utf-8?B?YmJMcG8vV0RsNzVlR0p4dVhaTldqbWhYVnVPWmNsQXVIU0RiWUpMTm1SV1ps?=
 =?utf-8?B?ckt6VlZldDF2QlYzQ1FqdU9Sbi9ZSWo3b2pUMTFEUmJPOGVmblp5cS9hMGJH?=
 =?utf-8?B?NjlTamhMNG9UTmVtQzdaSnQzZE1EVndQcjZuSXhQZGx4cXJabVhadHVFWGh5?=
 =?utf-8?B?b0NMdHpDL0R1VDB1RlF2UmF1L2RRMEtTblpOYkUrQWpSbys2WTNEVHlBN0FJ?=
 =?utf-8?B?dk1qVkJqWHpkK0VQS0c1Q0pHNkFwc0pmS3V0aXU3dmVpdVRWdWpMdldEVTdS?=
 =?utf-8?B?b2lVUTJYVmNCczZQTXlxcWNtSDQ2dnRPOERFWDd5Um1ZMzZmSW9hbkFJR2xm?=
 =?utf-8?B?Rlc3dW9jdCtEdmpoc2NKVVpIYXp5L0xQT3FpSVRTYTJKZnJiM2p2ZUpWNlZH?=
 =?utf-8?B?VXhreFhLQzN0MGg2UnlPWSt5TjFsNnZIYmxuN0s5ekNVTlFjeFkwSUNoSXQx?=
 =?utf-8?B?S1d5OU9JcGltMnRuOHlkZjBsTXhTLzZhQ2ZuNGlpbW5CQUVYWmlQanAyTEtB?=
 =?utf-8?B?V3dJZDBoUzZpdGlnWk1mY1NQRzdXcG13cC91d0UzT1QxNzlYMHZHRVZkaGNW?=
 =?utf-8?B?YzFSdVB1b0pIYWxaTkNKVlQ2c0p3czh1RTBlVjBHQkVmc0c4WjBGVWExZUcy?=
 =?utf-8?B?MjNZc1JNZmtlZWxuM00zZGlkb3RMOFRkaVNNbis5SHZpMG0wWlc0UUtKOFBM?=
 =?utf-8?B?TXR3U1BXVm15YnZ1c2ZHNEkrNHhtakJGYVM0MGtPbllScmRrU01scDZoaStJ?=
 =?utf-8?B?SkdSUW9aYUdVclkwWVpPczU5Z2MxOWdvOGIvY2FHT1UwNTdEN2J3b0w3cVds?=
 =?utf-8?B?cTU1WTVoTXFtZk53Q3pXYjRPUEtKb0ZsZllRTjZUamRPamFOSE1VOUVYb1Bj?=
 =?utf-8?B?WFFVN2ZpQ0JxUzg0Smx0QTcwOUZ0MDc0aGgrNit3RUVKbTVyY1dBaDR2SUtI?=
 =?utf-8?B?cGNNVFZGOS82TXFmaGhJRXFlaFZ6ODd2SUtlcTFDRC83QzNBQW1ndlRoSlJa?=
 =?utf-8?B?VnBvS2FZbllRd3FudzNYQ0ZQUnBucG44bHIraTNaOWNGNFA1NnJSVzNNS3d6?=
 =?utf-8?B?M2ZpRVY4VHFjemR4elMzRWlyZFIxdnNoVTZycGNJSS8xUTQrNzZjUHEzaHdO?=
 =?utf-8?B?clZZUFBDdDk5T2s1K2dDNzc3NW1kTnJGN2t3ZitVQ0QwZFhBaFh3SGNURmMv?=
 =?utf-8?B?SWNUNGJ1RFhLK0JPRVpIbmZ4NHJBQWQxMXVNUnZsVmtOTHp3RTFEYVBCQ2lW?=
 =?utf-8?B?Q2ZjME4rcnUxcHIvSjgyaEppYUYvS200Y3lpcUNNV01XdnhGSEhta3hDWEsy?=
 =?utf-8?B?SHRoRHcwODJBZm1TOTJvTnVpa2FOYTBSV1lHMzhERUczcUE1bk1mUXFNQmNi?=
 =?utf-8?B?UG9xcHhQaU94YjZmYll2d0lnV0FYR05HSktmUDgwa013eTVLZFJEQi9tNGdj?=
 =?utf-8?B?YXNGMXVjVk5WUmhHR2ROTTEyYlVaa283MDI2R2YxZkhwRGt2R0xiaHRuUWpw?=
 =?utf-8?B?ejMrNmhRSUs4YnBVWkFoZCtOM0Z0UEg1d3BxUHlxbzF0eWZkRFBUOTh5NFF0?=
 =?utf-8?B?eUdzMXA2ck9iRFhNVytBTTlvdmJFSDZDdk1Yd1E2ODM1RloyOTFyUUEvUlJp?=
 =?utf-8?B?a1pVb1pVTGFPZEU5NzZPOWlYSStaYjkycFN6SFRJQ3BubVR1SlhHKzNLNElR?=
 =?utf-8?B?dmR5bGlKVGpVOUl2d1pINzA2Si90VmhKaUozc1JEZmZnZ3RvK2lSSThySjMy?=
 =?utf-8?B?VmhMTTM2c3VSUFczRWNTZFlFd0xJZDVlVTg3WFdGZmZ5U0VqRkhteEI5eWlT?=
 =?utf-8?Q?/i4jAKyrBRPn8fs0xhp4yQt4AeGWYR8l4K+75DjbLmVf9?=
X-MS-Exchange-AntiSpam-MessageData-1: WymUZNgvHFOgqKGN+LMl09wj3MyJtpA9ISw=
X-Exchange-RoutingPolicyChecked: TYhCC0b181PNAAZNhpiI1Rywfpk2NnHnweETKzz6yI4YnZzvEKx/h0UlNy8Q0syYScOuLoKkP9JE8MMIVgncGTNcPLU/7SWW9Q9AA0Td9MKmqhnKaN4OGNE9n6F1QHWqZcKaV3SElt3nYPQYHZ9RQtgyR8mZWl2DAsYfYb7ZybacoLbGFNQnge72rjrGXj0XFzGvOJtotUG0IgqcuZpmwTDq1GHlIUx9N+GrvVkejyfzz486em/Fv0p5qK1DH2nQlyO0oNzk6oGZnCxlpVUYf2j0ij5ZGwOiZt4m89M4OL92x1iLuda9DP3tjw/CQOfqE+yb1uP0lvYxnuNAhAfasQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ce3052-5b1b-4897-44be-08ded938b189
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:24:25.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzPrjZq4ECDP7VjnfFQD1fkHYfa5A+XD/nFDLAao3bd6nysFvcmALtjUcEAWuMjLDsqxasv/3ZWm20NdlilGi4yq7Vgq739GfHF8m+P8dr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On 2026-07-03 at 16:28:38 GMT, Sebastian Brzezinka wrote:
> intel_firmware_decode only needs the lightweight assert stub used by
> igt_assert(), so the full libigt.so stack is unnecessary.
> 
> Switch to linking against lib_igt_tools_stub only.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 286a718c8..4c67dde4f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,7 +24,6 @@ tools_progs = [
>  	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_gpu_frequency',
> -	'intel_firmware_decode',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
>  	'intel_gtt',
> @@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_firmware_decode', 'intel_firmware_decode.c',
> +	   dependencies : [lib_igt_tools_stub],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
