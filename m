Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F149AC3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 17:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE31410E224;
	Mon,  8 Jul 2024 17:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3gnO09U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683AB10E224
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720461288; x=1751997288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TthusON7z3RQrzLFGD4GIrVAaQ5YOYLhwcQ/s5kRm+o=;
 b=m3gnO09U9SvpHszUR4gmiNUcB8kik8ugROxOS1aWE0W9ugpJ1jHyabmk
 NQPtAAetWowBvCIOTWzkKsVZLrYwa1VMQ4Ihl/dw+4qC0V1wI+/lyek+g
 hxx3gNtnslYOM59HncSwDXKVRc3K3nCcrzO5rFAUamrvID8fTQ8QgbFQM
 8qwOGLJ2UzxIBRq/RlZcdk7p6k6kS1xfQW62JlW0l733YgNgmb8mn8IXj
 N2u2j6tKISI7ZgyH3gyjbX6VLKWwH1bxyNIjpliUZGtR6X4gbVtfblE1E
 +cxvDMOMsneLViRlQHvH2W+SaBZKh1XF0yU0Bf2vRwACchM9erxT7lOXD g==;
X-CSE-ConnectionGUID: xNNTs/fJROOqW7mFRmbe/A==
X-CSE-MsgGUID: LgXIWdzqTpSRgmZqCyI1Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28286159"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="28286159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:54:48 -0700
X-CSE-ConnectionGUID: T/2DzUSjTE2nHfsUepqBRA==
X-CSE-MsgGUID: GG761JAnRzq52baINJEHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47349693"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 10:54:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:54:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 10:54:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 10:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOOZFaL5cm5T05rR+wMGQMr9v+Oj2O2Isq9ZDdmEZFftWCKCndy1z02NPC6WDXNiwkdf0BQGnuUi8Dtga3oAY1MGht5We+ecxRoOe/2iA4hljFlk2NYtuEw4nf2XMqVAbhtBoLfygrhrhyzvfN4ywjqTQQcH5bRIhaXpqcGV6fTPQm7eQrRWEAULrnfPx4LrXEg9Jmd7x8eNDVTK69N8JpvQ+dag6ttsJPKG1g5gZe1M2981Zq9Epml0wVLSUjDb3wJwmYfwRmItTx8lMuTQdw72qxwi6vZ659x9mKMajGYiA62hhW2Gl4ycIGkBonjSMD/VW1LhweOcWrYlCyl/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkq9vJBCCnNtSup/0a5KXzvYNu/oMZr7ba40hA6cDOc=;
 b=kGdKTMb8XbK+xNTPuUpldDdiMq+7TtZ8XCAs/rbS67Iobqq+bttA808WnOEJ9+89KPCU2xI43dIAqnPegXQE+Tmo9e/Y3+vxo9+iYue9PSAFOyCeH05Pa2cToU+Ag3/V/8prAU9udzTJ8FHJnyu+WCkiAC8S9999+LAdFSaJrfnUvXZEMdUrL+lLTejJ37eojCHSR5VEB/oCXIc4BQ2+hPcFhPskYCImRgPDZJ3qzt/wVBpBUHwLx5SX/BF6dq+BayI+fbtY+jZNTYNrnA4IpKiE/RZfuHTgczxcT30ZQ65Rzsy62ybuv6Nr2t8Rz1tsv4y9uDd3uc7SSgP7Cgqh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 17:54:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:54:44 +0000
Date: Mon, 8 Jul 2024 10:54:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/i915/perf: Add ARL support in IGT perf library
Message-ID: <Zown4sjKCbinKDJ0@orsosgc001>
References: <20240703224405.3172164-1-umesh.nerlige.ramappa@intel.com>
 <87ikxl9dkb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ikxl9dkb.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a500cf-651d-4e42-e695-08dc9f770c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlRKa3F2TUU4ejhVZFNaOEF6QjNpWm5pRUpoTW9UOEl1Y2NRZGIwS1hnNDNx?=
 =?utf-8?B?VHFjSThKWHE4WW1Yd3NOU0VLS3NVTHcvUzNNWkdZMUhscU1qM2JEdjJjT0tz?=
 =?utf-8?B?U0RYNm8xZ0cwOGtnZUVHUGU1cnE5ekRzUHI0MDdpYjBmUENyVkFmY09jV2tQ?=
 =?utf-8?B?MzZ0REZFS3NvcFF4bVlDcjJEcGU5eGJ3VkFvclJLaWo0aFhsbEtDaWZNenNE?=
 =?utf-8?B?Rk1nQW40NXoyWWVqVFNDRVkwclZoVDdCdXhjWFU2SVhFc21TYzVWN3VodWlC?=
 =?utf-8?B?NnRBcHQwSVpoSGlxNkE2elFmM0hSL3Q4U0lFdGdrTmh2N0ZpZmlBOEtmSkp1?=
 =?utf-8?B?UWcvZVFGMC9xV3ZGeFh6SFY4VktHWjhoMEJrbUxDVkd6WTQwNm9HL0t4ZGlm?=
 =?utf-8?B?bFhKamNjQkpUdHZzd3oyRkViZjQ0V2dabnlFVjlZL25sTFRSTzFJQUxrbkg4?=
 =?utf-8?B?WFplNm0zSUxzSHQvS21ka3dXWU9hMm5rOFNNVmQ5UEc4Rzh2OVB6bEtIVEdV?=
 =?utf-8?B?bCtPamhvTGhVek0xZTRVbTdQUXVKV2RIekg3SG1PSkFVRURRcmplQkh3eGZF?=
 =?utf-8?B?eG9ldDhhSitBWUNQTUFwRkYxdDZGZVUrVlk5cWJoY1hDYmZtUWxjVG1zQnNy?=
 =?utf-8?B?aUZYYzhTRXB1Qm52Nm02QVVZcTE2QVFlcnRHeW1tWXh4LzNYYTF4Sk9RQ3po?=
 =?utf-8?B?Nm5IajhIQ1JXUm9OZXE4Vkd1SzlrSmhYcjV2OFhuU3lPazVUMXRHQTVqL1ho?=
 =?utf-8?B?MTNsOVpiTndaMjliYjBLRW9pbmxCdEgxQ1JKQ0E2RXViZGQyZndOb3BNa3Q3?=
 =?utf-8?B?bWcwc1hWWDZXMy90Q0w2bVNSWTlsTU84QzZzTHJGYUFNUDJFQWIwSmFKcTBw?=
 =?utf-8?B?U1N6NXFoK1dHSjdyOFJGQXRCQlJVNnh6bVh2dCtkcW9EZDRlUjZ2VUJjeW5X?=
 =?utf-8?B?cCsxNWZBSWx1dmhuUXhjdnZxa2NydU1Ub05KZGhCemlEUnhuM1ZrU2VDZEEw?=
 =?utf-8?B?aE1xZm9jQ2xiZ2wwUHM4bWh5b3JXQkEyYWVtTXV1NUNnblJVd1dGdGhWc29K?=
 =?utf-8?B?b2xkZ2JsM1NxV2xFM0dEVllqRXV4Q1N1N285aW9nYndNNVRCcys1VENCWWZE?=
 =?utf-8?B?aDlqY2l3Y1B1T0ZIRmVFZXdtNlA0dlNvS3NzeHU3M0FNc3FZcW1xTUhYOFlp?=
 =?utf-8?B?Y3BsTGVacFdPTUxZRUxseDZvUkpFdXVGZC9GQzFRMCt2bkhpYlpPVVpLTDQ5?=
 =?utf-8?B?SGxwM25tQStmODdySVlpOXErSTVFcGVCVUNLNm1zZUtEbEdGcllNOWNVMUhB?=
 =?utf-8?B?VUlOODZ3Z09lZmx0SlNVZGEwelBFcTcvNWh1djVIUHFCaDZUenRERC9KTzcv?=
 =?utf-8?B?SXlVTVNQdmxBNkFWZWl2Z01relRtS0VjSm1JN2dXWmZFSjNiaWFuY1JWRHA2?=
 =?utf-8?B?Yjh3bHNOQi81Q1FBWHNCZWdiWHgzTXpyTnU3NkEzcG9va01JZ1Q5S1Y3d3RU?=
 =?utf-8?B?VUlsdFhuQW9pRktYcXV2eHNFR1YwNGpaOHBFN0c3emo5b2JFTkt0UE9QZkVa?=
 =?utf-8?B?TnlnVjBNRDJvRlcrNmVXYjkwT25SNnd4MzV0SktJaTZhdmpnWUo1alVWNk5E?=
 =?utf-8?B?WXI3Q0E4RmNNZWZsMkplUnJqU0xhU3pKemRaL1ZEcFd6aDlnTE85S2Y5c1dB?=
 =?utf-8?B?ZTF3V2h6aWpOMkNVQTZCa1IrNERJNTdSbUVVeGR5M2hPd2ZtU3FmOThnSTZm?=
 =?utf-8?Q?4cJ3tzBKeQUzYm7COM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRBZ0Q3bVRlRkxENkcwYS8vMmJWcWhzNllDREt4bjlyT21XNzZIbzcyOFR1?=
 =?utf-8?B?U0Jzc1NVZUNpNWFMZ0tCSVREQm5jS2pzam9TUjdBSVIwTFlUTG85OVVyV2xR?=
 =?utf-8?B?WjhLbXBPR2dZTmpUUTBZdnhsRjdqVFF5bGI1N1YwNnNZV1R5cHFpUWQ0OWtP?=
 =?utf-8?B?MFFKdkl5VGxHcjhUS2FOTkZTYUptRkNrYmJDUkxBczJYM3FURmd6dDNMUHc1?=
 =?utf-8?B?YWJ6MU13TjhtT0tnVFh1em9YTXdlRWNwM0RKMzJiSFBMNW9LVFo1YU5pL2tN?=
 =?utf-8?B?dDN5dWlURzFMR2FlRzlRbk1zVHVFalRkTDZqcjdvVkx1Q0s5elRDTmNnbnBH?=
 =?utf-8?B?T21PQ2t4R3lYUVhJY05VOVlTeE44VFVLVVFnNUdHT1V1RzJMKzZWVUVCYlE5?=
 =?utf-8?B?dStXZjdYRkNVUzYreWNGcU5razhBS3oxWk9FWm5uRDRGQmR3RUM1WWN1emRI?=
 =?utf-8?B?OVF1a0puRU14NC9MOGFmSVBXRHV3bHB4VGpLN3laNkV6Mld6bDJIdnA2U0NR?=
 =?utf-8?B?VmNMM3hHZ0IvSGI3a2dmdFE3UHNJTmgwQm1veFJoSms0djNLUXZubWE5ZVZx?=
 =?utf-8?B?TUZIaGJmalArQTl4NmtvNXhJVGlEUHBxWDJ2STRPY0VPcjA2MHQrLzJpaWtk?=
 =?utf-8?B?Uk1wVlppTnRJaFc3aXJjeTlqUHkzRG5rMGNBMmh4OHlHZnpaMkx0dW1NTldu?=
 =?utf-8?B?bWd0L0ZVZVJIWnZOc2RmTUowZW8zNjAvODhZWWJXSkRpN2RPMHlXSGxxSHFZ?=
 =?utf-8?B?T1dFQzJacVpzMUJXaUZ0NGJkTGZRUzBvU1ZRTExERVhkZTdjQ3lMTTQ2dmhm?=
 =?utf-8?B?ZzVIdzdqeWxzTkV4dHkzeURkTDBuZG0rSVJCa3g3d1FGSFc1eERkdm1PbVBU?=
 =?utf-8?B?TGhhNEw4NUthMzhwdDhHZ1FzeGRsQ0FNMUxCSU5EN0lXTEQ4M29KM0N1anky?=
 =?utf-8?B?NXFiaWpuVkNvL3VrQnJvZkM1dU54MkdmeU50cytvMTVmSEFRSEdoWUowZzhr?=
 =?utf-8?B?bDNQblBaTzRoQSs2QXpnNFpjMTdjNjdCdzZMWVhyVWQ0R2xnMWtNV0tUaHVq?=
 =?utf-8?B?bnV5ZUlXeThhVDN6S3pUOURCUW9xZmRhWkFHR3BSK0d5Ukt6SmJUZG1nY3Ny?=
 =?utf-8?B?T0gzcGhrbk1JWDVlTjIwYVp4UTgrU0dneWx6QlkzOTFWaDRRKy9wUWlzaSt3?=
 =?utf-8?B?eHlORWVROUFrQ05CakRYN0dnU2ViVTBrWGVOSmszYTh2bDFGMnlyUDJLdjcy?=
 =?utf-8?B?L0Z1a3M0ckRQZm9wZXhRL3llVTF2b21XM3lzbXEwdmJidG9YMVB6Zm90VDFt?=
 =?utf-8?B?dmNCZklHakNaTDd1VU9BQi9NQ0RFejZkRllTaWI4NkprZGdWbysxeStBSVRF?=
 =?utf-8?B?Um9PL1Z2TXVrQTV1Z21OVTROVVRORjcvbXFVYS9zSVZRR2o0bGVyLzFBNUdT?=
 =?utf-8?B?VkRuRVplLzJwMGxEaHRVUUNIbldBTVRyU25lNXkrOE82QTBZL1VUb0wxcmFO?=
 =?utf-8?B?d0ZTdjF0TlZ4MkY2djI3WVNMOEtsKzIxUDFDYUJLeEg2UlRRVllsREJPV0lz?=
 =?utf-8?B?TDlpVndSbTFyNURtcURMU3BLSzVOQkdaeW8zeVBpayt0WFlPWGdFaGZpcnRK?=
 =?utf-8?B?WFY5eWJySFBvbzJCNUR2RzZBQnljWVdidy94bTAwZDkvRlgxVEpyS0phRzh6?=
 =?utf-8?B?bWx0VDZDUkVnZ216c0F4L0psTFVTbTJ1ZHQ5RmFRdmdzT25Kd3RQSHozWXBj?=
 =?utf-8?B?WXRDTGhkY3o1c2FmTWNjK2Vrdm9NUWVjSDIyYk95eVJFRFhBc25DREhrOHBv?=
 =?utf-8?B?d3haRVZMTXpPTVZEOFhzWTlHb1ExOWpSbXBSd1FheUhyQUNpa2JrTkl6QTlW?=
 =?utf-8?B?VnVSNUp0Sk9pVXRzanVpdHFCZkpHNVpRVjdRZmhMd3RvZk81REpHS1J3SEdV?=
 =?utf-8?B?OXM5ZGNCVGJFbWFvZGROZXY5aGNHd2hRY2NFL0lHemsreEpyTkZaczlETU1I?=
 =?utf-8?B?cXUvOERpQVpVZCtrcWV4U2Zkb3RpTzg0aXJ1dW91aGtMc1VuWE5WNGtHdkx2?=
 =?utf-8?B?bU85RGl1R2VSa1RzemdCZ1JGbTRRbXFqUzJ5RC9keGJVRWxlZWNTTmdLTndn?=
 =?utf-8?B?WUorQ3lEWk1uSTJYeGFwVmJFQnpKT1N6Q3hHWUdPNThUR1RYMmhDRHpSSWJM?=
 =?utf-8?Q?+zDKpmmP58tnMg2oVBdbprY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a500cf-651d-4e42-e695-08dc9f770c73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:54:43.9736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQTLeKtC93QpnN5xRn3xTQsfL7qDHdqLm0rRTVcg4y2ExRhjHEacpvrj9wlCYwlGZDbj+UAS2trqQwP/IQzK/+ljnHZIs6yBgr8dt4RX0XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

On Thu, Jul 04, 2024 at 12:12:20PM -0700, Dixit, Ashutosh wrote:
>On Wed, 03 Jul 2024 15:44:05 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Add ARL PCI ids for ARL in IGT perf library.
>>
>> Resolves: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11356
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  lib/i915/perf.c         | 32 ++++++++++++++++++++++++++++++++
>>  lib/i915_pciids_local.h | 18 ++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>>
>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>> index ee950b3c0..ef2f74be8 100644
>> --- a/lib/i915/perf.c
>> +++ b/lib/i915/perf.c
>> @@ -230,6 +230,34 @@ is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
>>	return false;
>>  }
>>
>> +static bool
>> +is_arl_gt1(const struct intel_perf_devinfo *devinfo)
>> +{
>> +	static const uint32_t devids[] = {
>> +		INTEL_ARL_GT1_IDS(ID),
>> +	};
>> +	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>> +		if (devids[i] == devinfo->devid)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static bool
>> +is_arl_gt2(const struct intel_perf_devinfo *devinfo)
>> +{
>> +	static const uint32_t devids[] = {
>> +		INTEL_ARL_GT2_IDS(ID),
>> +	};
>> +	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>> +		if (devids[i] == devinfo->devid)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  struct intel_perf *
>>  intel_perf_for_devinfo(uint32_t device_id,
>>		       uint32_t revision,
>> @@ -432,6 +460,10 @@ intel_perf_for_devinfo(uint32_t device_id,
>>			intel_perf_load_metrics_mtlgt2(perf);
>>		else if (is_mtl_gt3(&perf->devinfo))
>>			intel_perf_load_metrics_mtlgt3(perf);
>> +		else if (is_arl_gt1(&perf->devinfo))
>> +			intel_perf_load_metrics_mtlgt2(perf);
>> +		else if (is_arl_gt2(&perf->devinfo))
>> +			intel_perf_load_metrics_mtlgt3(perf);
>
>Bspec 55420 says MTL has gt1 and gt2 instead of gt2 and gt3 here?
>
>
>>		else
>>			return unsupported_i915_perf_platform(perf);
>>	} else {
>> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
>> index 92879704a..c404a51af 100644
>> --- a/lib/i915_pciids_local.h
>> +++ b/lib/i915_pciids_local.h
>> @@ -31,6 +31,24 @@
>>	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
>>  #endif
>>
>> +#ifndef INTEL_ARL_GT1_IDS
>> +#define INTEL_ARL_GT1_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D41, ## __VA_ARGS__), \
>> +	MACRO__(0x7D67, ## __VA_ARGS__)
>> +#endif
>> +
>> +#ifndef INTEL_ARL_GT2_IDS
>> +#define INTEL_ARL_GT2_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D51, ## __VA_ARGS__), \
>> +	MACRO__(0x7DD1, ## __VA_ARGS__)
>> +#endif
>
>OK, these match Bspec 55420 for ARL GT1 and GT2.
>
>Since ARL is not distinguished from MTL in the kernel, another idea would
>be add ARL ID's to MTL ID's directly, but maybe maintaining separate ID's
>is better?

Wasn't sure about that since BSpec and IGT code has a mismatch on 
gt1/gt2 and gt2/gt3 for MTL, so ended up creating a new set of helpers.

>
>> +
>> +#ifndef INTEL_ARL_IDS
>> +#define INTEL_ARL_IDS(MACRO__, ...) \
>> +	INTEL_ARL_GT1_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_ARL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>> +#endif
>> +
>>  /* PVC */
>>  #ifndef INTEL_PVC_IDS
>>  #define INTEL_PVC_IDS(MACRO__, ...) \
>> --
>> 2.38.1
>>
>
>In any case, LGTM:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
