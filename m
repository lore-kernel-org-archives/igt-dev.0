Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C515C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 20:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEB310F926;
	Fri,  3 Jul 2026 20:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDqtd0gD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1110F926
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112201; x=1814648201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3ey+CZSekKBScFNgXZ7jd42IlnF5fonAolIM/znVEKI=;
 b=YDqtd0gDbBuDkFDyYeTcLM89E4cjc8uAeyqmSfd5NCJg1AyoEg6DVKoi
 V7OBgULRt2uee+9Ged+4BlEq9/QwoOKqgrRk7o7yAY5OitvLR8OfL62b+
 revjqAY00Ih5SccJEktSnFBFs/2wRQn+Y7Z0rOylM8eiCPnk3jjtr72/N
 AXH9SvGp5ohsZssrnflErRWscSdG7RMHeuWyBBVvYOH+1Uw3XvbvVJf0k
 xGDFX/XhQBc8Os2TFAP50olY4tgIUrFW8kqcDmXcSXwTT50PDx38OGHqu
 1EzySkzzhV4LZKJZGK0k1aX3KSPIMQWXSIrCocIYFaXb+evD1Y5zd98pC g==;
X-CSE-ConnectionGUID: qO6M2qC3RbC91BoCHkLNiQ==
X-CSE-MsgGUID: pCtOkB68Tc+rxEPGhC2YNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="101405395"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101405395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:56:41 -0700
X-CSE-ConnectionGUID: RRcxhFEyTBahUldOjifOeQ==
X-CSE-MsgGUID: vOc0RDZEQUqKp1ozNkMxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257078718"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:56:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:56:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:56:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiclMG5jyvIC9qKxe2V5lkEXdgZuA2Ws1T1Pt2RB1qTiHa3ShH1iIiOb/i5jqPAaQEIWcvbSdIqI7z48Xu9xhW6UHgZr0ECxqDDOCUP7GnBYKj8nM/rp8biwXYoKf9vdmEisU9o6mCLGXSaXukbgmyL9qiaIrVZQ7Z/2mvUdn4n+7R/vSOKoulUZF2G/AUgKJxUvcVwmMMob3jfZA+CcQiKYangZdLPwm0r1k0Z2cxsHZu9zMgSx/HwLn5dW7B6krws6CQz7tCmWZRoqA5ZNMPd6unBSwuRA+oz1E6+kTM4Hd/216hrRzoBKqJ80fa/m1oAl0DlumYxzcUeGAvVvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brCPfQulrIHSXwThT2BI3auf43sXT4WsuHTyZei6vrs=;
 b=y5Xpc0eKmdrs4/lQMkYvGzVSuH9JT6OK8qBzScdFg8K6mM6mME0M0N/3HVb360QWt7XC/ILZqHaFh25xyeEKj1SZitpik/FbdUPrzcR2gi7PxN+c5OjFbP2gG51JuMN+3x4RUbKItwmcWlyIpia0K+MPuInJlOGpZI+YHS29BfbJ6pzusMw1oEU+BPxp8E1tmOiviNuDS4l4jZWCF0uQ9iNarw+25aJJiLFan0XyebQv9P/hZksoXnswtEVX1+U0g7VXpCpgLGBbJ/dPs41V1I6QLup3Hb6EkusBjrmZUu0loPEUAMV0XcgFKmAbrZjncAIvdHcQ9qWF2ffN09B9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:56:33 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:56:33 +0000
Date: Fri, 3 Jul 2026 22:56:27 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 07/31] lib/igt_device_scan: wire to use static
 sub-libraries
Message-ID: <uflfen2kwf45bvyglarvkzhsetjnp3wttdarwcgok4l5yrv3s7@qfgq6xvfa262>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <6a920d28bc86c866fc92d35434de0a04b63bbd3d.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6a920d28bc86c866fc92d35434de0a04b63bbd3d.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0195.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::26) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8ec4cd-eb73-48b5-bac7-08ded945903f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: oDuJIJFsalz/0sJGAP7uUVHFm0XSyUcefknPe4jkJaqzI0687VlFlyj5Jf5vVHSnXQFlPUKy9rVbTY29mZjheMkOOBEeyVV9QD40zfNIU5Nj1NyEdXWjnnU4VbstR7ritrmvDtTlwEMT4wpAb7j7WisKvhJcuK6PwcZ4ZjVCE9/nZSKMJZYozPoIesLZXwemOVyyRfrRZaYYrgKNlla325Q/AhKbeKJOqsQPojcmRfRAU90a/W71bwEHU34Pj5waNwcOuWEDm12YiJth9gx9X0LkVAdYsuGV4lxsNvt0lZPJwD7AwSAwwZvh4KmTsoTJoz6oKHPZ2+BBC7KSDIOAO1+j7uXqmYUkYCBI6wsgHSlByJRwdErFRmEQRFo0+TqCM/jvfSSqerHoVRH/F6LB+qLH4omsQ8ci2vACtntc5kNa+4mlJ/t5kfkKyAMfC3m/PwQpLQzTSO//049HoedLbZvdOZVge8xbwzhmsp/j45XXpDpAvmE6aC4uY64Yql2CARWm1+0v8cV5JNNMczijBtiVTW1lSk1/lE5NZdZoY1ZIp3bHh67l9WSFLrBl2ptAte7CGF60kH3nYRhBvkRLmQ3sUgbuqrRllBLJZcVlYAmnYJNzMZOtRilTjR7goPlRfWFQHRSu5qnmJu8xvshqWqXmAEBKTyjvtWRTynqtCzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZEMFRzZmJZQ3U1T2M4d1BSdmtiR3dTTnZaVWN0RHBFWkU1MXB0SXFNUEww?=
 =?utf-8?B?U1lsTnh4SXFuUHpHd3ZOeC9Qc1IweGJUNlQrajZZTGRtRUMyaVlvQm4yZTlS?=
 =?utf-8?B?Um1KTW5XUFFBL0VPbm8xRjZFRHNZZDFMSjBTanFKTkFpbEk0ZGVzZEMxR0Zj?=
 =?utf-8?B?NUlKVTdObWswakd3NlhjSGpUU3NPUEpKY1E0d3RFdWtzRE5nYmFLV2JOZm1T?=
 =?utf-8?B?aUtxbm1lOUtaNHkwKzV4Z3BxZGZPQlM5ckRvdTVZa2prbXErUFhyL05DSVhv?=
 =?utf-8?B?STdWNkdZdWpmU3BTLzhuRW1wYXI3VDhsMnZGTDVBeGNjV0owNk9xZWsyTVdJ?=
 =?utf-8?B?MDEzZjdVU29KTHZ1OCtwZnBJRlhGOHpUaEpMYUJtYXVrUGtHdnE5QnJRM3d5?=
 =?utf-8?B?THc2QUFNTnBWcWppalQ1aUJHQ3hnaVZJTUNFSWdKTi9ZcCttcExoYldiVnA5?=
 =?utf-8?B?SGlmL1ovRG5SaUNPY1dyVFJRVWM0Z0ZRUGVsT2t2aDVLUXpUbUJlRFR2OVkx?=
 =?utf-8?B?cUxDTmdVbDhtZWFYWXA4aUs3VktjYllEWVRTUmFoMVlVZHNlS3FieHpUNldy?=
 =?utf-8?B?RGlCY3F1QmhhcER3c09adXJPek1xY0FLZGl3aGxXWnFwMEZiVnlwZU1XbFdI?=
 =?utf-8?B?Z2l0ODBibkRhdTFWWFFJZlRlVWFHbzRReGZQNlczVG1GSXkydW9qOFgzY3Zw?=
 =?utf-8?B?Q0V3UVJsZ0dtZ1NtM050bU1ydm5CQ3phbjkyRVpXT2Rka1c4NGxpaUcrcTdN?=
 =?utf-8?B?dDh3R0E0YTI4M2hpeW5UamJtOHVkQytWVnAzcnlOeWdIS0R5QTlodEEvVDlO?=
 =?utf-8?B?bmlFNkpIVmJCbjhwdzIwbEV3MjV6OWthTjZFT08yc09qSXVLMFpNSkNyNVE0?=
 =?utf-8?B?elc3eDRlRmRxajY4a2xBbW9McnRBdnNPUkJDcU9EbGF4bHY2N1cyZmY2a29J?=
 =?utf-8?B?cXBvZlRPWlVZSTlmelcwUU5wM1N4SXFLSnBtL1NEcXNKY1loNk1SZXdxV2Ju?=
 =?utf-8?B?MCtYL0FnK1ZnVjd1WXFwMDlTd1lsVWRKdDdrcTVJWU5xdU52elNucWtEbzNN?=
 =?utf-8?B?NllzSVZDNWdpZlE0ZzRzdGI1MjU2bmFUc3N0YzNSUnk4ZUo3VGczb2RmVjVt?=
 =?utf-8?B?NzNlNXNydVQwTUVJWGJseTdQMm5HcFJTT1RMWC9HRzdPc3dGTjByeVBBM0pJ?=
 =?utf-8?B?VmcrTWlFOWFhU0xzQ0l2aVdicklmZGkwSk4rSVZSU0VlVVR6S2Vkd3RxLy9s?=
 =?utf-8?B?bFd5R0hHSklYRHp6Yk9oU29FaVpNYm9xdUhscDhsVmIzLzdYQ1VIMGRlWVVu?=
 =?utf-8?B?Ny9sK2RLWDkzYWRXSTJXTzlZTTFucUVFSW4zYmh6M1ZIaWlvN3BPcFNTRnBz?=
 =?utf-8?B?ZEFGd2ZQRE5LTjZlZ3Rpb1NmL0dSLzVNUW14TlNvZHFxRGNXTXJTODk0SDlZ?=
 =?utf-8?B?eTZYOTdzc2R1UEh5Yk8xSXZaR1A5ZWZ3QVNPVjd5VldQRm1WOTNaemhXS1B0?=
 =?utf-8?B?ZmNaZlcrdVpyNndOdEN5K1NJSVVFWjM1c3h4WFpRb25rMlBZcnBSbTUrdzh6?=
 =?utf-8?B?L1RFVE55TkNqRFRrTGlRRGlEcDNrVDI0NXNWZkNvTDVaRGpBWllvWVVYVzFZ?=
 =?utf-8?B?bVNSTFN6cE1kdmpyL0xmTWk1c3FHSmFhRjcwc1RmM0dIdWdnczN4SzlXZDdl?=
 =?utf-8?B?cXI5NEdsUzJQSDVEZzJUaDVwdG5XSG94aVZ1VjRBYU9PTlJJWHB5NndseVpW?=
 =?utf-8?B?YzUxOGFac0E2RW9TeHdidmhDczBqb25Vb3ZrNjZkSGhLMzV4RFQrUCsxWWMv?=
 =?utf-8?B?SS9IK2RtakVtUkxIWW55eVA4Yk04SWd1MUZ1eVJmRFY1TTM0OXBQREltR1pj?=
 =?utf-8?B?ZElpbUNNN1pjUVRtaUdQQmFIS1ZzcmlTRUo4eVlQR3NwV09oZEFXSU1hNjc3?=
 =?utf-8?B?MjlzOTZqYk9MaHlRTEcxRlNoUVhScDI4bFBGVUZuYm4vaUxUM3c1UmVQeVUr?=
 =?utf-8?B?ai9mMmRvUHFEb3pDY2x3RlNwby9HWXpxdDQ1aWZza0QvU256K1BFWGc3Y284?=
 =?utf-8?B?YUpIdEdTdnplRm1OS0RmRExWVGV1OWFvMVNIQzl3Q2ErUHVwNXA5Ty91ZGYr?=
 =?utf-8?B?Tzc5d2NRMThISW84NGZpdE8vRkphZWVoZXNLeExSRGs4bGk3cVRmY0c3WVg2?=
 =?utf-8?B?djVIU2x6dG5obi9xNm5vcHpGakdiUlZMUmNHeFhiaXgrVUduT1FYeXdWSk1m?=
 =?utf-8?B?RXJ4Q3dHaWtxWndwdGZnMllmcnhMWVJPSmwyM1RZUFpERGJOWUd0SkpJY24w?=
 =?utf-8?B?R0h2bmtMSEJYUTU3bWd5RGUrNzBNaGVSRU1EL2NNd01kbk1YT1R5LzRVaWFW?=
 =?utf-8?Q?Nightf+YDlwX7kK77vdvOt1E/fhACXZYGgMw0AarPFoO9?=
X-MS-Exchange-AntiSpam-MessageData-1: vZC+6Q34r4UxY+JKc2dQTdCTxQOxtCXK8EQ=
X-Exchange-RoutingPolicyChecked: BkIta/bi8bfe3Npi8iYgDuk6DKu1u3YJ0RQ+mQuKPB40jqYZoMyL3zG1asqnOwxLOTeIOcTKG1/5AC3XJqqlLIX77v5QYznB1xQ8iYlfFVRxaQjbsOTx1SXvDML/0zkoEemgQC26MpIjAA+Go4VK3iTfUu74tRC9Mm6ZX87KUyQL6FtXk9OftyV9HcB6l9zsCGq2uvRtZMIWbgvtx6pVFKeORo4e8XyiSYGXHwfMdwYVSNVW6zMQ0whM7g7cybsnvUnQeDzP4+gUlGF+NDa74gZZYGJFawFZyf09LM+m6hK5ODiyme/H32CIZRp94U8mHk9+Y0UKf0Y0MkJGHQbPGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8ec4cd-eb73-48b5-bac7-08ded945903f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:56:33.0287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv8b8GmKT9f2+j0WXAOCbjeh6870JQEia01eYi14jYdGe9BgwvGKanXii0w9EmM2d7Iw17OGRJB4IEbM7ARCdNX5un07sVLAl+VUZA1kPh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:41 GMT, Sebastian Brzezinka wrote:
> Drop the directly compiled igt_tools_stub.c from lib_igt_device_scan
> and link lib_igt_tools_stub and lib_igt_drm_stub instead. Compiling
> igt_tools_stub.c directly would cause duplicate symbol errors when a
> tool links both lib_igt_device_scan and lib_igt_tools_stub.
> 
> Add libdrm and pciaccess to scan_dep so tools linking lib_igt_device_scan
> pick up the right dependencies.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 484a912d7..2c1fbcd43 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -367,22 +367,24 @@ lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
>  
>  scan_dep = [
>  	glib,
> +	libdrm,
>  	libpci,
>  	libudev,
> +	pciaccess,
>  ]
>  
>  lib_igt_device_scan_build = static_library('igt_device_scan',
>  	['igt_device_scan.c',
>  	'igt_list.c',
>  	'igt_map.c',
> -	'igt_tools_stub.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
>  	],
> -	dependencies : scan_dep,
> +	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
>  	include_directories : inc)
>  
>  lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> +				  dependencies : [libdrm, pciaccess],
>  				  include_directories : inc)
>  
>  lib_igt_drm_clients_build = static_library('igt_drm_clients',

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> -- 
> 2.53.0
> 
