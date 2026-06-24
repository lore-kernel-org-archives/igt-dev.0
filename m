Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ABCCDB481
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EB910E065;
	Wed, 24 Jun 2026 14:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3V4YW1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959C10E065
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782310638; x=1813846638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jm9vL/qQsC2/D1bBxv+QuCxcnX6HpOdmO/zu+vIRFtE=;
 b=J3V4YW1NPuqcdn+h1xkb4yta25CFw67Pf0ykZ3XMn2Snt6DR7bZATPUI
 ZYGxaCIEWcEh+G5I8Lim2aCiCbOfnn+12cDuzDBQ6WEzaAY41GhkbsrjR
 tJVwCe1XrsBhJe0bZFL7RMrHZ2KuW8keQi+we130+vOJcu3rFMwanqHVD
 zvb6b5rAePSg0aOBION81ffU6GG1kWNzBsqwI9gzxSIo9I3uYXnNxaYAI
 8Z22Oowx6NOaa7w8gnKpT0Bif2SlY0JieB0Q6N2slcem6Vm/EHJsPsb5s
 5Q7BZuzUkXn2IErb6TXqG0ddmQlpMAc9kgmC3kgQ5nMuLCnJzFSHwoc+i g==;
X-CSE-ConnectionGUID: lMoMLQuVSRiVZZge0YnO8g==
X-CSE-MsgGUID: QATMUUMLQMuOqh7Uf0jS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86754483"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86754483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:17:18 -0700
X-CSE-ConnectionGUID: WlpwDE2VRhekWIg+dON36Q==
X-CSE-MsgGUID: ou7uKuStTBGFgW3+8QhHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="280033879"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:17:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:17:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 07:17:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTWz9mmpV6EDZS2gBCYdSfsDGcY5SSTx+DD01c4asTWnZeIV8qw/Nfo3SpOyC9ElOoFGUqhCkeULyJnyByGX54imDZduFCVn0+at/XcX4ws7eRi3CfAiRbR0C6sCkz5NMZ1S4WtfmOMwla8zdcYJyXeA34OpYbE8gZcWhj6zXr0J5TS9ku7pfCeA1aLXC8zprrgdEsKC1e5ua6sflt2/nkvQl3v/JcCTSSouiYGEnpBvHjycKDWbQSgQ2EjmfcnWF/UdyrhUtLLyhXXkQJEs2jeTUjUToxh9hyg5b7JQ4fJ7jmsg20aMDcxACa+87bfEdN+1m1xNVvcwDUSsnKYw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ID73c4MOE8FLodJeBAGeUO6YzS7LeoUM1gn5atw0f4=;
 b=N3VeGdhuJW1gxknCsHph2sPjL7pdAPJ++c1zcqMnoTSQ5RmkRJSqHvFyniqm/UABS80Pz0AjiOR+Rvr6cR6b3pFALDtu2cYRA9advx7kW9WNIIbhfj0I5nCKw7E1ypoIa6FZRhFoFy5mHUPNRpeYo6C1ohpCrmucfr3cBImC0zUxfTenmSTYmb4SOHckaVRs/5QCeB+pGxAKU8viEXjXXWclna4TOscXPEVyCA/Ez/vUiqQ/fFMDk5crLHHH4NJnXOIyYDGw0/tWvLLPpstSiz7z0spLCT/aiWEA1UtZOZtXqxK1TFcTuojzgWze1dhR0NKqwoLevhBoSIVKrztTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS7PR11MB9498.namprd11.prod.outlook.com (2603:10b6:8:261::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 14:17:15 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 14:17:15 +0000
Date: Wed, 24 Jun 2026 14:17:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel-ci: Remove dmabuf tests from i915
 fast feedback
Message-ID: <i4wnzkgrb62cq2cadfw4iycocnftcdzchg7suhr4ez67jptwtf@lss5bvinmm5s>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-4-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260623200152.12996-4-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DU2PR04CA0305.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::10) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS7PR11MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: fa01e9bb-4a0b-4d7d-761a-08ded1fb4a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TWo2FwhQOj2t6nO7+KnZOw/1lKk9ZNtNvU94ls7yO3hAfzjsS1hWTvJAJ1YfPDCugc9nd3pmCe/7XATIcjbIHqEFWxQCCAe23mF/6GuRWXaIdk6CImvt+4DTSrADZfSjqWL/Ln6Co/Mtl06CA7LRTyshqdvXWKz2AhGtcMuyNmtH4/WagCaDDgBFCoylQm/hd+YcYHERUuUJR9h24ltWcLAhnEtwZADQj4G+p6p6v24NKHNbPQ58OiLMJ/6qtnYhgmh7+uyWLVmohCBdYtjDZ3b+64aXbYIZU3eE45Fn1yYJDxu/8Y7AXUVp9ltXY2/IX4Q9xlT7k0ji/u6n0WDVCeBxS0b2HYM4Joc2QIMWoTu7hWTEOIcLvaarPKbAZdDsmSrYj1fruJ/jjcvXmi+mZ3kVZcGRWt5lZymrkXqH2RAFYUCi4V91lVOhq2RbQVpbbrZiEYsfhVCQ8rHoEBJgBCPWD/rNbYz/sLQnlMziS4pcN0e5ugi8In0pf/imqOtdoZE4HvE6qSOBIySsGVe8ffr3OCf+t1pJzbp6qRqrbsL9Ut4EciAE06PMJahX2wGztf941H90lEfQQuQdaUjjUEQDSh3gy9FBmdr7lRfBoiBPFtjXYvPDoG/tY1h7o0hyhqcYKSepP2/hrEhBJgxw3CCzRvrpFrZJiv04/cMU07M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?USs4YmtWMy9mSjMzS0h2MC9IcVBwWGR6aTJMbENrTFNORUkvWFYvSTAzaEp1?=
 =?utf-8?B?YXJBSUNJYy9DYUZtcFpCdld4bThibnJ6Vk5NQnRBeCtvdG43eXpVdWcrQ2ZR?=
 =?utf-8?B?T0crNGtCVFVxakcxN2o0aEZia3JjUG9VQjJYc3pDMTBpdEdQY3ptdjZPbFo4?=
 =?utf-8?B?MUJnTHhxRXhqS2dNdkxPRjFrNGNSLzFTNkJMVEEyODRLbE5kTWF5dmptaGIw?=
 =?utf-8?B?cE8wL25RYzkvak1zcy9GbzhTRk9rM0RMWGd0ZjBNMVZ3MDRERFZKV3ZXaUF4?=
 =?utf-8?B?bnVwTEYxN3JGLzNKMFFXMVhsWmVrdjRqTUtNMVdrbDB0NFc5cHFIRWxSV3pz?=
 =?utf-8?B?eDdZQzVVMklaMDQxenpJVUpnSTdyZnRmL2dXOEdsOURHSG96UHYzaU5ic0pX?=
 =?utf-8?B?M214TVJQRlhoWGVMUXBITmt3cDhseXZzOGUySzdKbStDY2JoemZRRnQ3S0I3?=
 =?utf-8?B?SjFwWldkNituaVlNS2ErdTQvVVlDeC90VVNhRktpa1lxSlM3aG9qVllmS01n?=
 =?utf-8?B?dkxwa28rSzZMSFg5Rm1WM1ZFSUdTUmVTOGlFZ2NWR2NLbEE1WGY4VWVFTEhP?=
 =?utf-8?B?bjRhcE45Qm5Xc1ZxYVNTdHpoUTVhQzZXMTh4WGVtU3VRWk5TZWpPcklBYzVF?=
 =?utf-8?B?c09VbmRPaW9Pd2pGOVVOZ0tUWkVvbmN3eWs5dys0YjJwRW5qa3ZVZlZhcGpi?=
 =?utf-8?B?bk9ZYzIxaUZ2QlYxRVdSNzlONXRhcW5sVU9BaDdhb05URXBKNXhrWHJOVU1k?=
 =?utf-8?B?dENubWNCQzFCa1NXRnp6SFNTcHo1MVFRVUFubXZTRGxQUS9IdDY2a0xTenFj?=
 =?utf-8?B?RlJuRDZEWmloZ0dmWlJ2aXhpK0JFMlU0c1p1ZHRFQ0h0MHdObnVpNVZDazVC?=
 =?utf-8?B?cThmWllMdVR4QmxnTS9BemlBY2ZPcCthRnhTeTRPZHQ1Z3E4UXFaQUN5czlD?=
 =?utf-8?B?bGhjSzJMeU5TVVBveGdzMDZEakc2YlNiRmtacFFpcW5PdUNnZk1DMHlHblBu?=
 =?utf-8?B?elArL2xGRXNyQnhEOWZzRkNjc3NFMWZvWkFocWl2R2pLblgwcU9vUUJDV1h6?=
 =?utf-8?B?MTlaNEx6clpIQzFyZ0k0b1dDbjVjYlFEY3BtUlBMY0FsL2Qxbk5YRnN0WFBp?=
 =?utf-8?B?ZXRkclhkTlJUVXo1K0dkeHVtUXk5eTMrMkt2V3VTTGJkMFhRNXZrRFBLVEZ4?=
 =?utf-8?B?cTYwTXVhWmdxWGsxTXZCQUorbW1hbGhLbUliNXlmK3RnNXdpMHpzZDd5L2RN?=
 =?utf-8?B?dUhSVjVkMUlMdWRYand1TkE5Y05TSFJGM2d3cGRQRWZ6RjZDb2FSZGZDZ1VR?=
 =?utf-8?B?K2w4YmE1bDB1a1lsYkZsMUFCbkxSQmtjRXZCR1h5ZngvTjlyVDhKam8vU0Fi?=
 =?utf-8?B?eE1wa0V0MDErZ3RVOEgwWDJxZU5lSlQvYUNtUnhYR2hWV1lMaXR5cVdZb1lJ?=
 =?utf-8?B?RFZMbGExSlB3bDBTbFpubjdsTXM5Skd3T1MvaVdxc2phM3RLT0d6VC8wUGtr?=
 =?utf-8?B?aCtZRUxqS3loN1N0QmFNemQwMWZvcGZsTXJxbk9qTUh0aFB1TVY2VnRPVjRZ?=
 =?utf-8?B?b2tCU2dtZXZwcXFYTGNjTmw2WUJRNnlTNVFrd0VOb3BLYks4amxkOWQ3Q0FT?=
 =?utf-8?B?SXVTczBGNEdVSTZuWkRtczloLzd4V3VRTjlrQllpc2ZwOTNpZVZ6c3IyOUdo?=
 =?utf-8?B?bmRzZWpSSWdjS3RsRXVDbXprcFV1aWluOCtVL0I5b0UzZ1Z4eXVvckpIbFVN?=
 =?utf-8?B?bTBobnR2ZHBxNmJOSS9TQ3doTit4YkdDTHlBMm05NGxKSzc5TGRsQ0xTRTFQ?=
 =?utf-8?B?a3U2U01iUlhLKytxL1l6YTZNVnVlYW01MUNiRlBiVHFzai9uQXFHbCs2SnFz?=
 =?utf-8?B?S1JYaWdCNE5ocURiZG5YZ1hhTjlkMXVSNm1ENm9uUys1eVd1b2ZkMWlnUFdV?=
 =?utf-8?B?c1RCVytpUEVwVFE4OGtPYU5oVnZzWjA0QUh2NERINUI4K1ZpMUFYWDdaT0Zs?=
 =?utf-8?B?R1NYdmxMUnRhVnN4WEljbHdxZmkwTmhwdHdyOVVEcmcraWUrVzhLK2RjL2VB?=
 =?utf-8?B?cTZSSXNVbzkzZ1dxZjR4N1I5c3AwOTVna2NKeGNlQ2YxYUZWbjVpbjlvTjFC?=
 =?utf-8?B?OGFGOWo3TmgvLzZrT0pWOXlpdVBwWkN5c0E2eW5XcGo0cnpGclF3eWJnT3JE?=
 =?utf-8?B?dGliOWhyRHR0eVVyelBLT2d0N1huV2FKSXhuYVhtVVVSRWxQTENQMERVUXky?=
 =?utf-8?B?WnNPeWd6U3RwaDVsQzd1bEZyUkNWRXlVVE0rMkhId25uVmZTZzEyamxHeGxS?=
 =?utf-8?B?NUlyT01oRkg5MVB0a3VhMU56UEdYZ0JQb3JoNVV2cXA2NTJFeDI0UkZURGI1?=
 =?utf-8?Q?yNi3+nSLSZZQJ0No=3D?=
X-Exchange-RoutingPolicyChecked: MguvD1TjNjRFUePXc/1ftGQB6iwQJWP/iyXzFtTC2v82EBnluhmM56zv09lNznsrmHpEYrvx01KrKU4liAw8hiM3CHRBdpxIlurc9krtbPmUDY4nkcV9yk0Z47iW4c7EJl8QvFUYn0B5+j5infuGy87xZTLoSvvm2Or47fJjuQfD31xvSS8Sujz8wSRmV4eynSt61JdQ1nB/xkZ1qJgGhVkVVUJiuXxlLfEo6paqkX5Q3j9I//mixOfmew3hPkD0F9bTcQukMJ6KcV6DFjSwCJoTs5XEOrH3f2vWYoq35QswjvVlKQc3vnLd2/nUCpkeBdaflg/OcPyO2YwRCtTiXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa01e9bb-4a0b-4d7d-761a-08ded1fb4a8e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 14:17:15.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkKWowRwKUwNGHSeqqXw1m6tdlRaiLFkwFe/08Y15mioL5sFwauDaOyRFoZ0rTcIHhX+rn0i4e0yQDGDpdHg6cFUEjiBkvCrKqeEp4JaXBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9498
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

Hi Krzysztof,

On 2026-06-23 at 22:01:52 +0200, Krzysztof Niemiec wrote:
> Intel CI runs KUnit tests separately from regular tests. Remove the
> dmabuf tests from the i915 fast feedback testlist, as they are now
> KUnit tests, instead of selftests.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
> index 2799bbaa5..5b33f29e4 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -168,4 +168,3 @@ igt@i915_pm_rpm@module-reload
>  
>  # Kernel selftests
>  igt@i915_selftest@live
> -igt@dmabuf@all-tests
> -- 
> 2.45.2
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
