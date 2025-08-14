Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03031CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 20:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A944710E213;
	Thu, 14 Aug 2025 20:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXof8vRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0610E213
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755202747; x=1786738747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eJu2ij7xL4cBF0ZpUSgThu3Anjep6kXsmIObnyKbk80=;
 b=nXof8vRe/ejTXxpm4ZLE6eq0TknFhlxEe7dprMciXeE8tzC0PrmJYZbB
 UK8h5FjGweX4ATximrOcU/7xmGRRd//fxZaDPTnDge7pFB3Y8Y5oT9AxH
 H3NqHW/aOCblgUROKcco1oql1rt/Wm3RlUYrYHp0IJ2dk8xL6/paUBkZ6
 DqCn2kw4iBmlMWic6z5cHjkwZINAqwRziOyb5B5geMUd4ikCJS9m47Tlk
 jGgFNchaE2iLroybo2FNyCNbmvcElHEXvDBA+ZneJ8pNl4LBVddiMfYi+
 iwDLs+qIpO7ZEYpdmZO3EtJyM7PwT9paclzwOP/W7sfqHWfMLL8UEW5J2 Q==;
X-CSE-ConnectionGUID: c6xfNF7WTt2t+PQbVgYmEA==
X-CSE-MsgGUID: 5HMU/WYlQ6i+d/jagF2+hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57608444"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57608444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:18:57 -0700
X-CSE-ConnectionGUID: +bbPEfwERbuhGaKLtH29og==
X-CSE-MsgGUID: LTM9ZnTtSDmsHhJzLqbKIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197842962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:18:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:18:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 13:18:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEmi0NUuQn2TiG6y5pFdyf3gRng6Y6/0VAP0j2LR6kiKaesDUEUCwgFVm+Nae64ievwIpVrOssBclos7n1Fbgno6RMh68brB8rtrkjqx/VRhcmOr5Kt8pInBIjIboPykhx2bfgYDzY5LmotVha1DSItHYx/1G02RFBtygAtKTEKnhX7sUuoP8OBJB4bOWer5t/LzwYyd4kRYf9DuZz2XtHkCNmlUYQZROeawGDa+16xOFNtPtex5AU8RikRVb9igLySgDNph9cJGkceekwTdgQxUa8T9JKEztSe5Utd/NhAyOyYOA8lWJ2EIm0CgrhLoZ/07jE9oQgCmpCtnkSAleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHQGKHKGlKd7fWe/Tm1txZ7NJmh8HwQUa1+wHTjniDs=;
 b=vuiuz1iIHZh1Ys8AAfRDjYWftF1SggBdmU4FtI1G1ELTslwJvexSIpbh9Zq5//EUUpQkYtGoFZHnVRZOq332qkEYpf20PGSZdRBGv+CWvrbdqqzBgP3BiDSJk/C+qIpwTn8T2YV/pOPk9WJh/BBpeAyLAIM21slo0k1l26B6zj9o1VOMJQzPzwKCjJch2MyzN3zMqPQoVTa7ZXI12f/SePqkLVUY+7tQDzQL8i6MiD9xt9xPq4K74LJscLsGBsvlyfxOrrdsHto2BdHFHF4ia8/6SwB2HY0Y1l0Tm0raMOqsYJad6m47l8B3eAuRtEqigVPbLapXdcAPNuDf59+NRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB5871.namprd11.prod.outlook.com (2603:10b6:303:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 20:18:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 20:18:51 +0000
Date: Thu, 14 Aug 2025 13:18:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Message-ID: <aJ5Epw7QohBibGI1@lstrano-desk.jf.intel.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
 <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
 <CH0PR11MB54440D656813901A670CCE7CE535A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54440D656813901A670CCE7CE535A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f63816-0458-42cb-df21-08dddb6fc8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3p0dmtvRXkzeFBvNXY0OWJvNzIwNHN1V3BaQjhpUjludmFXL3F3cWg4amVn?=
 =?utf-8?B?bzUyZXc2S1I0akVzRkg4UENrM1FQRHdnbG9pWjdsWFlCL0VEekM4akJXOURZ?=
 =?utf-8?B?VTZLYk9pYUlkZHFtZGFKYmIvOGc4V3VseGRuaGY0elgwWWNpaHkzcFQrUjZU?=
 =?utf-8?B?ZzJKMTdJZW5ZeHhBUllwQ1crYW5udTk3R0pLQ1B2UHFvdjZDVmhZcmNqUnMy?=
 =?utf-8?B?cDVtMktab3VONmNrWHB5Y2dZNm9NYzRmcVpwZE5aTDNPZFdERVVwSmVQbzB6?=
 =?utf-8?B?RjlSZGlvc1RIOTRhelNkQkVvaTZGdFA1TnVmQkt1cFZvd0ZOb1BIeTN5NnU2?=
 =?utf-8?B?eFI2Q2lNQkpGWWhobEJBbk42VmdhWTZXS1FzRU1NLzJSUnJuelg1SUJibXdF?=
 =?utf-8?B?MmhJdGF0cmljVmxYQUo1TWtPcHRHeVFmVGtuYUVacnlPQWJCSEdxcUZXeFhL?=
 =?utf-8?B?dHhDK0JCeGlrck9TNHlianZDWmZtOVBDKy9EUkc2VU1MNDRoL0RSZlo1WHg0?=
 =?utf-8?B?K0ZZU09qd1VpQUUyRDVDNUdCQkhjYTFCaHAveFRwaEtkb1FRb1V4Q3NXK2to?=
 =?utf-8?B?SU9DcmpqNVhwZ0grNGErRkNxY3ZydTN2a3dMcitibGtNMlMwckJNVk1IWGF3?=
 =?utf-8?B?MU5vTklMd1FVVHFIQnpYeEZEbk1tdmpON0hWblZXL09rVGU1TjkrT2ZUNUtB?=
 =?utf-8?B?MzhJV013eU4vb1BldGJNYW1rYmR5VW1tY0NsNkRHQ29tbGJ5cWdxdE9wNVMw?=
 =?utf-8?B?Mm1NbXB3WE9vUlRGbjVjcnhQNzQwdVNwK0Rsa3VwdnZ6aVUrdWIvblRiZzhk?=
 =?utf-8?B?UHN0bmFtandieGRZY1Z6bXJneXJSRXgySnEzWllVWHBGVitYcHFRanF3cVpu?=
 =?utf-8?B?a1NCZG1MRkc4NHZHbUhEblAzMEU1WVFYTEJEMGhRcFRuY242S2duUVYycnNp?=
 =?utf-8?B?VzlWMDhHTm92WTlndG9ZVnBhYUVFZGZMSER5YWx3bGZZb1hmTWJjUUZuZFhH?=
 =?utf-8?B?dmVlblBPYmVVemxCajZkK3I0eXZEb01GYUFnZGsrMVgweHhWdW9iR3VwWXlw?=
 =?utf-8?B?K2RPb0hwaElHUmdIaTFDcnk3ZDZzZWNFZVZ6M3M3NUxYK29zNjFKYWpvNDEr?=
 =?utf-8?B?STN5dVEvSnF1VDI1NWtaU0VVVXVDYlpyR01UYlpOK2JlR2hFVmFWSS9YKzVT?=
 =?utf-8?B?Tit6Q0lBTk9paGdDUWxhUWg5emU5YmVtOWRYVlRUdW5wUytpNWxDM2w3VkhN?=
 =?utf-8?B?dFRPV01NUTBFZWpHSDhXczZ4aUZyWVhLUGpHNnVsWmZuRjgyVWYvLzAvU25F?=
 =?utf-8?B?cDdSZ2ZUSC93SGR0WnhWOW04cFFSdjY2VGhZK3A0QW5OL1kyZklQNmpLbUUx?=
 =?utf-8?B?S3R6cXBCTC9URWFCS1Q4NEtPQmlVY1VZOG5jVHBBa3k2MTMySE00bDBob1Jx?=
 =?utf-8?B?MVYrdEZOSHM1dnhiSHRrVzBINVNBaHhiRG1KU2w2Q2Y5dlVoL0J0VHNlcGJM?=
 =?utf-8?B?MGFYUUZYTVlmUjlDRWZKLzMwcmE1bkp4OXdIVFRlZXczUjlMdi93bHQvS0J2?=
 =?utf-8?B?RzlnUGNSZXc2U1RyUjNwa2cwQUk1MFA5emVRVDM2cHRXMzVtWlV5WlAvUVJq?=
 =?utf-8?B?Z0t4N2xXd0tNa1EwUkY3Q0RXNms5WDZuSk9qWEtyM2xIQkdhdXNRNUlQbmxP?=
 =?utf-8?B?dTdVMjcvMWxWUzVwZ25iNng3T2x3Ky9NZTB3aDRGUnVOWFdyRVNkZ01PU0lp?=
 =?utf-8?B?dkFlamdhUFMvUmNONlU1WVNoWEhOeWxDWU15SmJ6bXdxL2VnNXQ1MGxXT0pF?=
 =?utf-8?Q?VK0fvANKKmrDR4rqiXJRn814z/mYLST2v5YvE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEIwSmxyVU1yWFlYei9oT1FVVHRyck5JbTN5Tk04RTIrTnZXNnIyTFU0dUdu?=
 =?utf-8?B?Q1hsSTNWZk03TzFWKzdUNUZENGlrZUh6cXI3K05tL1BGR3hQbXlXcVVNZmFw?=
 =?utf-8?B?NGt2bE04VU1LMzEybWdBQVVISnlqd3RlV1B2dzgyQ0NBb2tBQzdwMmpzWDh6?=
 =?utf-8?B?cXhTa3RaZDFWZ2htYlJScmZmbm5QanFjV3JTc1V3bDZTbHJTaGVQTkhzVUN2?=
 =?utf-8?B?dEovU2J0N0FxQTZBc3BCeUtLeW9NNHh3MmJuN0JQTVFUTDdOSTI3QWdqVnN6?=
 =?utf-8?B?UVJLNHpRQWZHanduM2h1V3JoQTRSUGVLanBOemRzVDNZeFQ1RzdjUGU2Tkw5?=
 =?utf-8?B?SExYU2tFNXQ3cmIybDVnS21FdjBlT2JuVHhXRDM0Wlp6Z2REZUwwbnZIem1r?=
 =?utf-8?B?SlQ5R0N4TnVTYjcrR1lYemJXVjZuNUVFUURIQUU0ZktHbFZib3BENnNObzZC?=
 =?utf-8?B?OUdtZER3cStqc2Y4YWJLc2RUOE9zQjVMSHpJR3dZNmNPTEhRR0NNN0VnZkJZ?=
 =?utf-8?B?NHVTbFJiN1hTSDNOKzFodlNiZnRQM2F0alQ1dHllQ0VHWjVrMVlDNmxCbnlH?=
 =?utf-8?B?clFhUEVxOTF2NFMyb0RXNWhGUFMzZ0JNNkdPaDFacS9JRW9SV2RraHlHMWZx?=
 =?utf-8?B?cjB3Z2ZXdjlmWlNveDNqb0ROOGtmTzdoaEc3dVVxd29XS1BEWkJPRXMvUzlW?=
 =?utf-8?B?b0pGLzdPMXdRWlRPY0hVWUp1d0lyZ2JiblJkVnI1aW5nYmVLVkdnYW5sU0FB?=
 =?utf-8?B?cURoQmo2YWJ3eGgxMzRINkFsYTk4UFhKbERzU2dpUHNjeStBaHQ2U09FS0VU?=
 =?utf-8?B?Q0lYT05GNTArNDE0MDZwT05rQjMwMmNCM202T3RaWmJ5VHF0SnJVeXl0OWd3?=
 =?utf-8?B?OTlocUJZb3ZlSS8rUE1LdU9KdmxtaTVzSzkyWTZ3N2wvWUo0UGsxM1lVSlM4?=
 =?utf-8?B?akp5aDdHcjI0VEcvUGJiL0ZvYktCNkJxTCs3MFpBVzJWM3ZQZWJGV0p0M3Jx?=
 =?utf-8?B?ZFI5SlFtQ3BKMHVIZFBlZHQxVXljOHZZL0duSWZMVmlZS0dpaEszZlZFTGRl?=
 =?utf-8?B?c3FoOHJOeW5ieXV4czQzUEJiVzMxcVpPSDZ4MU5EL0ZoWGxXVTZwOXRLY0N0?=
 =?utf-8?B?c3lqUSs1OS8rM1ZEWWVFVGhieGd2dG42NUZlUlM3eEd4MmduZm9zdE9wTUZZ?=
 =?utf-8?B?VE1FQTQ5VmtsR0NIaXlrSHpVWFYxV1Q0V1hmWTMwVVQyc2NUeWFuV3FGNWQ4?=
 =?utf-8?B?aTRsOVQzdmYvZmdISGNPREV3TjFBUXlYMUNhd2kreVI0eUlnSlJJUUNOY1dC?=
 =?utf-8?B?T2dza3lZR1ZrMWRNWkNDckJvSTVhc3JYeEtiS01yK2k1R3FyZmxidWo2cmRq?=
 =?utf-8?B?ZzBsa0tibmhDVnM0RGl4NGJpQ3FsdEtIcWpyQ2hvVVgxK2Qvak8vYWdVYnZ1?=
 =?utf-8?B?eGgwOTNhVlZjUmNDU0RzTHNlSXVNTnpPZkVrK0t2eVZlRUV0eUhnN25Gd2xU?=
 =?utf-8?B?SnFQL0ZzNW9IOGVBdkpXTURwNVp1eGhmZW9FRGZ4ZEhvTWJ0TVV4VEdZK1Y3?=
 =?utf-8?B?WFIzeGorVDI0TlR3MXRCWkNaSjBSN1kwWDFBdStPZzU4NXlNL0tVT21jZldI?=
 =?utf-8?B?WTJSS2tITEN5SDdTMmNVWjFKSmxTaDZlV2RtUnpuNE1kbTRPYVRGdE5mc1g3?=
 =?utf-8?B?bGFPclhMTkw3S2U0MXRyRHIyeU9VbmxqUFVYRk5zREMrYVZXM0pzeFJiRUE5?=
 =?utf-8?B?Mk9NaEVCNUFpNFU3MUZtMTA3VGZHTFBaQUxQS3FVeUpjaGo0b2xSbWhCMUtx?=
 =?utf-8?B?ZjZueVhLQlduRTBmK2VFNlBhOVNhOFNZVW5CYjdJa0ZDRGNPNWFtazFocmJ1?=
 =?utf-8?B?bXhHQWlDY3dhR3lQQTdCMUxjQkluYzBQeURwRy9PZmp0T3BSU2JYWStaRkZR?=
 =?utf-8?B?dmhwSzErQjM2UmFzTzhqbm4raGRhUVVmYytmUjR2NWtUbWJQc1JOMkRHNXl4?=
 =?utf-8?B?M085WWp3YTdCWjNCWC9rdWhZYzdKejQvTjdIRjRiVEc2U1J5eDhOWEc4T2NF?=
 =?utf-8?B?anJsSmtRdEVKSUk2dWZDT2p2QTVWbmhYQXVyek9NUzBBQmRNYW43QW5ZVTB3?=
 =?utf-8?B?SFVCZjBQSmlndWVmbmhLSm01SlFJSWQyaGdrWm5nOTI4K1R3bWtnQjR3SUg2?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f63816-0458-42cb-df21-08dddb6fc8af
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:18:51.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wARsbGHyVp6DZGJZd2ylB2rKhReTGmEOci3j0ddhLgrwLj3Etf+kbpvAw7M+7m87WDlL3dAOaxjpNNHirj1Uhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5871
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

On Thu, Aug 14, 2025 at 01:43:01PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Thursday, August 14, 2025 12:24 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init
> > 
> > On Thu, Aug 14, 2025 at 01:11:39PM -0600, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com> 
> > > Sent: Thursday, August 14, 2025 12:05 PM
> > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> > > Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init
> > > > 
> > > > On Thu, Aug 14, 2025 at 06:50:10PM +0000, Jonathan Cavitt wrote:
> > > > > Add an additional MI_ARB_CHECK to the spin initialization function,
> > > > > just before the conditional batch buffer end, when preemption is
> > > > > enabled.  The MI_ARB_CHECK forces a preemption in this case, which can
> > > > > allow additionally scheduled exec queues to make independent progress
> > > > > earlier than if we relied on the automatic timeout of the exec queue.
> > > > > 
> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> > > > > Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > > ---
> > > > >  lib/xe/xe_spin.c | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > > > > index 25f7555e27..b3a937fe80 100644
> > > > > --- a/lib/xe/xe_spin.c
> > > > > +++ b/lib/xe/xe_spin.c
> > > > > @@ -30,7 +30,6 @@
> > > > >  
> > > > >  enum { START_TS, NOW_TS };
> > > > >  
> > > > > -
> > > > >  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> > > > >  {
> > > > >  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> > > > > @@ -167,6 +166,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> > > > >  				   opts->mem_copy->dst->mocs_index;
> > > > >  	}
> > > > >  
> > > > > +	if (opts->preempt)
> > > > > +		spin->batch[b++] = MI_ARB_CHECK;
> > > > 
> > > > But we already have one these at the top of the loop:
> > > > 
> > > >  72         loop_addr = opts->addr + b * sizeof(uint32_t);
> > > >  73
> > > >  74         spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > >  75         spin->batch[b++] = start_addr;
> > > >  76         spin->batch[b++] = start_addr >> 32;
> > > >  77         spin->batch[b++] = 0xc0ffee;
> > > >  78
> > > >  79         if (opts->preempt)
> > > >  80                 spin->batch[b++] = MI_ARB_CHECK;
> > > > 
> > > > Line 74 is here the ring loop restarts.
> > > 
> > > I tried removing the top MI_ARB_CHECK, but that caused the test to start
> > > failing again, so it looks like both MI_ARB_CHECK calls are necessary.
> > > -Jonathan Cavitt
> > 
> > It shouldn’t be, though. A couple of instructions later we should jump
> > to loop_addr (that is line 73 ring instruction) and then execute the
> > MI_ARB_CHECK programmed in the ring at line 80.
> > 
> > I’m all for fixing the tests, but I want to understand what’s going on
> > here.
> > 
> > Can you reliably reproduce this issue and confirm that it fails before
> > this change and works after?
> 
> Yes.
> 
> Before the change, the issue occurs with mixed frequency (about 10%), and many
> runs take around a half-second to complete.  After the change, the test consistently
> passes and takes around 10 ms to complete.
> 
> The primary cause of the issue seems to be an engine reset that occurs due to
> an exec-queue hang.  The additional MI_ARB_CHECK seems to force the second

An engine reset occurs if the GuC issues a preemption and the engine
doesn’t respond within ~0.6 seconds (the default preemption timeout).

> scheduled exec-queue to make forward progress, which unblocks the first and
> prevents the hang.
> 
> Perhaps the "real" issue that the MI_BATCH_BUFFER_START loopback causes the
> execution call stack to fill up, resulting in the system having to clear up multiple
> layers of execution once the second exec queue completes?  I don't think that's
> particularly solvable, though.

I don’t think that’s the cause. To me, this points to a PTL hardware
issue—this shouldn’t be necessary, as I’ve noted and works on all
platforms AFAIK. 

Maybe try some other experiments too—for example, move the single
preemption point to various places in the ring, or insert some NOPs into
the ring (in case there’s an alignment issue with instruction
programming, etc.).

We should bring in SV to root-cause any hardware problems if believe
this the issue.

Matt

> -Jonathan Cavitt
> 
> > 
> > Matt
> > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > +
> > > > >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> > > > >  	spin->batch[b++] = 0;
> > > > >  	spin->batch[b++] = end_addr;
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > > 
> > 
