Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACEE9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 10:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCB410E291;
	Thu, 19 Feb 2026 10:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df0xvMeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7724C10E291
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771497838; x=1803033838;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Bx6b6ffJ9lWDujMXLvTEgMQbQ8wObHF8uEw4qYhwHJE=;
 b=df0xvMehIIxStb1LBun3Ik1gxc1Lxyy8P36e3IhZ/ihcJmvo8DnuQwVn
 JcYjEnq885LmEu0SAFtNvjWePf9FguIbisVfGJPYSt969V7C3fXDPYKSp
 KiBX/TuQBzglC3LK2spUYpX8NSeowTOOEgId+zBVFdskcQKSzfHTQz4G/
 fO0NL81uW8TUrw/h4jAXxhIYTKjwY62XMkYWLoWBnWq18IjFim5js5tZi
 gNuT4/8gLuycd3bHNZJVTeZj3YKHOAIU0PBetP6SWURYqf1UIES2y1Jug
 hKYeRNCkmAZsOCuCJr4Ltdtb7NDtjmj0P4AKhmzlUW5Km4N9Sf8izQHoS A==;
X-CSE-ConnectionGUID: 85RRNSS6RMOdfVGKOxTCcg==
X-CSE-MsgGUID: rcSDYkAdSzS7KfxA30JoBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60154079"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208,217";a="60154079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:43:57 -0800
X-CSE-ConnectionGUID: 1EDdeT+nQrKUR4dIECH9Eg==
X-CSE-MsgGUID: 6A7Ufuv1TxiLtCSBIzye5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
 d="scan'208,217";a="252183515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:43:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:43:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 02:43:57 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:43:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ei29y14wGyspI+qQpOuYB6WUYrjHYA1Re+iBCgb9LF9SQSfdYrCyBNcNiutOtf8rV2lJXpS7lC53fHZNIY8Tp+FNAnwZk5IUGPjEloMg08bzNP1kIKM3yuI+LwzZ8TqNYR0vjL2Wr8M5Hrp0CumeSG6IzLpuRgezc6q1Ko5boCe4kldub1yQLS8GtdPb2L6pc/0QCjQjcl46+pJE1vMZrtJPHsnxzFyRHjmF/Kxr7M3cfgc/u7rI2sMogWYm7+oj3Gd7UgM9m2gmUBHmD6P2UmeIAV/3F6M3wZNVjjOXWZHpr0wGW86ykDjTk1oYKJzGDyOvohalFD2OmMf56PU0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZrpKh+AS/G3qyq9Ikak4TekOQpjn0gd9Ji7yo1BgW0=;
 b=nzGgYaa07q79AXkNHv5iXt6XE+TJYF8pgUJuLQSeadxCM/uUoJZE8HbRexAZuXbAUnAn/CA1nDJz6j2/TncQe0dpEJKIcaJrurKRGLUU96FE+MKYdvlz0M/8A5Q83YCOxFTmqCquGsncwkZgVrMaH4Yu6Oh06/WKMyfcFNDRaZ3JQQJdG7fwiMsMqT/6hxWTj6TVcWAvgT0q+iKa8Gyp2aiIffFpEsA+XEhSlGgRWO+zvH92KnikWOmlFhj4mkhKfGuV7y/b/4xp2e1qJt/c+2iXviV01RTpgj+2L9Jvnr9JSCSOFqwLaLsVD0fB+9zKmQP77MdDjo5YrRTqx/b9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 10:43:54 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 10:43:54 +0000
Content-Type: multipart/alternative;
 boundary="------------yQszmlN51VMlfNCJxSCxu1Hr"
Message-ID: <8f2fe684-bcb4-49fb-a743-225a9cb86d86@intel.com>
Date: Thu, 19 Feb 2026 16:13:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/xe_vm: Add oversubscribe concurrent bind
 stress test
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
References: <20260218164417.856114-1-sobin.thomas@intel.com>
 <20260218164417.856114-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260218164417.856114-2-sobin.thomas@intel.com>
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 58414f6b-845a-4756-ef0b-08de6fa3c71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHZkOVhOM2xQbXBlSFZ3blhSYnNxYWM3d0xrOHoxQThuY2tNajVjWFBPYjhn?=
 =?utf-8?B?UEFhMmZId3JaTEFpb0VwNXdlYU1VcFdPYkNKUWMrSDNwWHV4aWVTbThjdERh?=
 =?utf-8?B?aHNNd0tMdUNzUkJ5eTZKZlZBeElEOWRPY0E2Z3VHYVVkWWVhWmwwaVQ2UHd0?=
 =?utf-8?B?WlBKZkhBQ0RUaUhFZHgvbGdKMkl6V0MraVZLN0ZlWFlzbjROalRvN21VaFBq?=
 =?utf-8?B?aU1maXhMM0NCZ1d3ZlR1bG5qQ3BXK012SXZORmUwNysvWkFQYStQanozcXpt?=
 =?utf-8?B?MXA5VFpxN280V2FSWDdUbm5nc1FiL2JuclN3ZkFWTHRFQVdKVXBaYkJwdDNX?=
 =?utf-8?B?U1kyYTZiVkRnWGgveU5XSHBDZTI4dzlzRFJ5RzcvZ281SXNNcVBpUi9lVW5x?=
 =?utf-8?B?WkV0RjVSTXVQUDZGMXMyUGVaQjNJWTl0bFZCMHhKQzRyc3BEaUM2dFNKNGRR?=
 =?utf-8?B?VkVJRitWTjNsQWltVnB5SFZxRVFVY0U1enF4RzBudEJzVmFqZ2pzWVMyQTRj?=
 =?utf-8?B?aUQ1b3EwUitZT3VHTVNOY0F3Zy9lR2FVUEdGbGF0dktYU01oZ2FtWDM4NzJR?=
 =?utf-8?B?UkwzM1BJb0xvZlFZa0FNUUpIenVENk1pemZMc2g3b3NLQ1hGcGx6NUY2b2wr?=
 =?utf-8?B?N2Q5Mlh2RXBmb0d0SUxqcE1ZQUxsQ1VBYjQ2ZU41cTFLSVJCeStxblpVM3hu?=
 =?utf-8?B?VFR1bC83NVRZYmlYSm9ROGVOUmJHNHlLNno2bHdUVUFoczk5Y2RuWVVYQU1O?=
 =?utf-8?B?aW1uclJrTU1oY3RTZWF1OUJzLzAvVGt1TTRRSkJpTlJnZUlXM3JUNzU4YlNT?=
 =?utf-8?B?R25MMWs0T3VYeDlJdE9TdVllZ0NTbGFKcWlBL3BSam8yMHBBQnZScDA5c2dU?=
 =?utf-8?B?ZDd3Z2VxR2grTkhYeWxRb3VxVW8vZDZtSkJXYjFUSjdqYW5Ja0h5V2ZENDRK?=
 =?utf-8?B?cVhzZExwSzdPdlRySlJRVXR3Qmc2bnRIclhvOWp1YTJDckpKem5wRmx0RWhI?=
 =?utf-8?B?Q0ZLL3NDUzNwWkUzUGkyQWwzeThXR0R5dlduL3hKMVZFTkJyNUVvK2U0SExn?=
 =?utf-8?B?aDUvYmdWQnpEaWQrNmIrTnpLbzhTMC9oZmhERmloNEMzYk51SlR3OTMxQytW?=
 =?utf-8?B?UEVrcHZBTnJEZDNEK0JvdXllNGJEMkdEMjRNUTlaZ1lJdFE4SXorckhFaUdo?=
 =?utf-8?B?dG5KQjNaSW9vNFU1TjR0VmhncW5KZE9FNlFEUWs0Z1dteFJrVndQSVlGT25U?=
 =?utf-8?B?aVlSbWlveVRndXpNVVhvVmc2NGtTeHRucWw2V1FJVDJLRDIwTmNudzZUMkRZ?=
 =?utf-8?B?ZVJzNlE1OXppYmtCNFFMdHBvTDllYzFQbWFNYnZ0MkFqeXBTQ3pNR2dEREti?=
 =?utf-8?B?MW9NMTBYdFNBYXNWVUFPdElqdHdWQTBNWU9SNlJyLy9aVjlJemc2Nzh4dmFN?=
 =?utf-8?B?dlR1VGd0UWhZbzBJK1VkaXVOOEVQakZscUxsdVhrMk1HRmgxTGdlTUk2VGdE?=
 =?utf-8?B?WGFKazV0cnRvS3ZHOFlWMmN0TzZpK0tOU2FiNXh4WHdPMnRxNndXYkZSa1JE?=
 =?utf-8?B?NVlCNnlwQjZmOTIwU2czSi8wR0ViajBGVTRVRjl3ekRQTGJTMmVqYnBmL3RO?=
 =?utf-8?B?YXVQa3VmS2VUanpXanBwZnlmNXNEVE9JUTZMVmVLK1ROdCs4OUZ6VXBjZFJK?=
 =?utf-8?B?U0VNTlNNUHRiOVBhM2k2dlIyczA5ZFFzYXVxb0xHU216TW5xM043UWZUU05Z?=
 =?utf-8?B?eWFucnpES3owTEIyR3piWjl6dVhuM21hOEsxcElhaEtIM21hb1ZMbklWSDY5?=
 =?utf-8?B?dVh6dUNMOEZkdyt3YVZINXdYVE9ySHAvT1VWcytvZWJYeFpTVWtvTmtuL3pj?=
 =?utf-8?B?YXVKbUVnS2Vqckc5NUhlWHAwNEg5QkM1b2xXMEhGQVNua1I1Vjc1WFpoYmU5?=
 =?utf-8?B?RU1WQWFWNXQ2Mk1JYWFCeHJoN1lkdHVQaGR1TDlWZzRqd3AwZllnMXdBaENK?=
 =?utf-8?B?MGE5UkFRdVVQbitPQUgvdDh6MGhCR2RPTmVjQW12MDJGWnd3MVB2YUVOWFli?=
 =?utf-8?B?NTludzkxSEJxUE42bzhvSnNxMTlKMzU2d0M3NnNZbjJOaWd4UXhiUy9NMWM2?=
 =?utf-8?Q?zda8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhDMjVMcTBITGF2UllnZjN4YWRGTCtDeUhVZ3NJa3kzNVA3U2RaczFod2ZL?=
 =?utf-8?B?UHVDc1kwa0o1TmtkSkxvQXdBc0tuRzNnTmFOZjQ3czR2NmRWU1ZDbFU1N2JB?=
 =?utf-8?B?bDUrcGRacmM1QUJLMFpzL25VR2J5U2I0SVB5WkFYSnpFTzNCWWI2dmtsRVhJ?=
 =?utf-8?B?cmErV2hlYTRVTE5hdGtwMm85V1RTd2tyUXZQUXlPbkZpMldZQXl3N3B1aUxT?=
 =?utf-8?B?RTNVbzR3Z2RtT0NxWWZ5VWdkK0xaeDZyTllsUmtSMHVBb1pMRzhnWnZQOEVv?=
 =?utf-8?B?UGZjOEI1V0oxL3Q4YUdpU0dDOU44Nms5dnp3VUNuNXF3UldaYXVPeDdINDVx?=
 =?utf-8?B?d0pOYTZhMEE2SmhER3lXcUZRYUxNcUVPQjJQYkhQS0JMMWtMWHk4NEhraS9l?=
 =?utf-8?B?eUc0NVhSV2MzZ21VMCtQaVVyV09seVBURGxSNGRBOEJrQ25LRWg3bXdYdVdW?=
 =?utf-8?B?Zkd3Y0ZRUzRlYXBSTnQvQU4wa0FlekRkMVZXNWNlRHRkRnhQNDJvUjBEM0hL?=
 =?utf-8?B?TzBQMTBaUmkxYUNHMjRlS0VJb3RQZkRtdHI1MEJlbm9VeTVHdGJiNEJwRVA3?=
 =?utf-8?B?SS9UNDNTSTZweWphdHFFTFVldWd6cEFPdDlpRHRqbUovNk9pcmUydm85M1F1?=
 =?utf-8?B?WjJjMU1rV2xuaVNVZ0RVaFFDY3VTQ3JseldFS2Rzc3JvUXFwKzBlbzlTYXBM?=
 =?utf-8?B?L0RoaGVrVXd5WE43cXJRQ1pLeDNmd2Q5QTZzeVdRYWJHdjVZZTEzdUkyRzRK?=
 =?utf-8?B?VVVjNllycC9GZEtCSVRHeUppcHdtTEVsZmNhYW5IbmNhVjhWMEVocmZobVBz?=
 =?utf-8?B?ZXA2ZXM1ckszdFl5UEpWUG1nNFRsK09tUVVXRitmYlBsblllWTZHZEpxLzRn?=
 =?utf-8?B?Ty9DcjFIcDJwUmtTQjIxZ0tvM3NHUkdKRjQ0Wk95UUEwSGIvY0tneHZZTnAz?=
 =?utf-8?B?azFlS2RBaXZ2MUhJTjJZd2RXaFBZU0xDUC9IeklNMzFJWVNjLzdnWEhNSGZp?=
 =?utf-8?B?amt5Y3R1eklwSHBJRE0wQVdSZVBYNWdBVUpRVFJsMHRGaWJJSWgvdldrSW8y?=
 =?utf-8?B?cnhBc0hBcEpEaXNlMExtSHRpVmxtYkozTnMvMnpXMGZiMk9lQTcyZ1JSZG1m?=
 =?utf-8?B?dFZkVk9WSVd0bDNHNXhzQkNQL2xzRDdGZVlaWU5UVCt2a2o4TkxtVEtIbFFG?=
 =?utf-8?B?VlhlajdUQnVKN2NGMDZkSjR2VFNoeUZsWElvT3NOUEMzdkNjYkd2bExpY1FS?=
 =?utf-8?B?eFBvNWppVGd6STBpdVNiSmVCU2FibGtFaVcxY3F1cmVxODBYL3hFMnhjOU15?=
 =?utf-8?B?RlZlSnVla2xFdlZUeHNQNGJpRW54Wm9EcWJFVFBPb2dIeTBpUnRKa0hjREtu?=
 =?utf-8?B?YS82TTZjY2VPSWxER3NNWXFQN205RkdMVG0zQ1JzNE5nbWcxMk93Z1RhbzFP?=
 =?utf-8?B?aGxacWNZRzFNeStOOFpYWG1TL0tBYWNBZDZqT1NUN3FzczJ1cUI5c09IcXRX?=
 =?utf-8?B?WkI5WUFma0ZnOWhoTnU4cFcycXZQK2VMcVZBaEtPQW5zY0VzaVdOSkkvUXNI?=
 =?utf-8?B?N2lDR1NvaTMxaG5qOE1LUUw4cjN6SSttb1lSc2VWZDdIMThwRGd3T0FLUUhF?=
 =?utf-8?B?OXNmSlRKMEdVYnZQSWJiNkl6NkVVWGhzWVZKSHB0UWtjbGQ4VWJ4djEwVTZX?=
 =?utf-8?B?QTIra0hWY3dIZmpJNmpySm1lNDhVbWZTbHYvbHFRNUJ2Z0ovVWsxUHhWTkhi?=
 =?utf-8?B?Ni8rQmFYRlNiNVYwNkxXc2htNHRBU1QxUXE1aXVMNGZ4UUlNamFYREJlK3Fo?=
 =?utf-8?B?SXROWHFNMnlqMjBvcnNSdDlIelgrTG9tN0gwOTBwbWVxdCt2VFRVSTlweTVs?=
 =?utf-8?B?MGZ5RHFlcWlHRFpxU1I5UlJ4T25ydWpSSjZmK3VuaGNIYXFJVjZzUW1QTkJN?=
 =?utf-8?B?UytxaGhCMXhMNitSRkpSVE0xQmhLdGhKaUg5OGxUcEFzWUlXQ2FuUVR6bmhZ?=
 =?utf-8?B?R21JWk5Db0VLMTBMVlhXMHVVQWNVaDA1MzZreklhbk9mUEFETDJibmJnRXIz?=
 =?utf-8?B?Z0dTb2Y2WlMxZTA1QnZPbVlnMGx1by9zeGE0bnAzLzU5QzFLWHlxQXBLWlc3?=
 =?utf-8?B?Q2hqWWkzMlVGZ2dmRHJSUlpTMUU2Z3lsRGJhbDZYZEQ0SHlsRnR0QVFQelhE?=
 =?utf-8?B?YnFLNEVHc011VkxCV2hNV2svZmhNdEVYaDlxTXoyMXF1L0pVQ3c0UDlEY3RU?=
 =?utf-8?B?ZHZ1UHMzWEtsYThqbHZWN0N5SXlaWDJCWjBvMy9zQWlVZXQzMll5Q0lNaVNt?=
 =?utf-8?B?RFhRSjJZNFVPemlXQVZ4L05PVmV0aXp2M0JwOUpBdjc1Syt2L3FDdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58414f6b-845a-4756-ef0b-08de6fa3c71f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 10:43:54.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugOa8yOZigKxMgYYY2Tmv71AfjX7i7zB3Q/dS1Tg5FdN447eEe3LOoVOxFdVWgvyqIuTltbu74XdJuxEb0nR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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

--------------yQszmlN51VMlfNCJxSCxu1Hr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/18/2026 10:14 PM, Sobin Thomas wrote:
> Add an xe_vm subtest that oversubscribes VRAM and issues
> concurrent binds into a single VM (scratch-page mode) to
Why scratch mode VM? Requirement was to create VM in Fault-mode. Scratch 
page have different path to handle faults
> reproduce the dma-resv/bind race found under memory pressure.
> Prior coverage lacked any case that combined multi-process bind
> pressure with VRAM oversubscription, so bind/submit could
> panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
> The new test expects successful completion or ENOMEM/EDEADLK.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 421 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 421 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..5c9d5ff0f 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,176 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   
> +#define MI_BB_END		(0 << 29 | 0x0A << 23 |  0)
> +#define MI_LOAD_REG_MEM		(0 << 29 | 0x29 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_STORE_REG_MEM	(0 << 29 | 0x24 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_MATH_R(length)		(0 << 29 | 0x1A << 23 | ((length) & 0xFF))
> +#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +#define ALU_LOAD(dst, src)	(0x080 << 20 | ((dst) << 10) | (src))
> +#define ALU_STORE(dst, src)	(0x180 << 20 | (dst) << 10 | (src))
> +#define ALU_ADD			(0x100 << 20)
> +#define ALU_RX(x)		(x)
> +#define ALU_SRCA		0x20
> +#define ALU_SRCB		0x21
> +#define ALU_ACCU		0x31
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
> +
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	int fd;
> +	uint32_t vm_id;
> +
> +	uint32_t exec_queue_id;
> +
> +	uint16_t sram_instance;
> +	uint16_t vram_instance;
> +	bool has_vram;
> +};
> +
> +static uint64_t align_to_page_size(uint64_t size)
> +{
> +	return (size + 4095UL) & ~4095UL;
> +}
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
> +	};
> +
> +	/* Find first render engine */
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
> +			eci = *hwe;
> +			break;
> +		}
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t handle, uint64_t addr, uint64_t size)
> +{
> +	int rc;
> +	uint64_t timeline_val = 1;
> +	uint32_t syncobj_handle = syncobj_create(fd, 0);
> +
> +	struct drm_xe_sync bind_sync = {
> +		.extensions = 0,
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_handle,
> +		.timeline_value = timeline_val,
> +	};
> +	struct drm_xe_vm_bind vm_bind = {
> +		.extensions = 0,
> +		.vm_id = ctx->vm_id,
> +		.exec_queue_id = 0,
> +		.num_binds = 1,
> +		.bind = {
> +			.obj = handle,
> +			.obj_offset = 0,
> +			.range = size,
> +			.addr = addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		},
> +		.num_syncs = 1,
> +		.syncs = (uintptr_t)&bind_sync,
> +	};
> +	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
> +
> +	igt_info("Bind returned %d\n", rc);
Both igt_info and igt_assert used. igt_assert() is fine, I think 
igt_info() is not required
> +	igt_assert(rc == 0);
> +
> +	/* The right way to do this in the real world is to not wait for the
> +	 * syncobj here - since it just makes everything synchronous -, but
> +	 * instead pass the syncobj as a 'wait'-type object to thie execbuf
> +	 * ioctl. We do it here just to make the example simpler.
> +	 */
> +	//wait_syncobj(fd,syncobj_handle, timeline_val);
why commented code is visible?
> +	igt_assert(syncobj_timeline_wait(fd, &syncobj_handle, &timeline_val,
> +					 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, syncobj_handle);
> +}
> +
> +static uint32_t
> +vm_bind_gem_bos(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
> +{
> +	int rc;
> +	uint32_t syncobj_handle = syncobj_create(fd, 0);
> +	uint64_t timeline_val = 1;
> +	struct drm_xe_sync bind_sync = {
> +		.extensions = 0,
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_handle,
> +		.timeline_value = timeline_val,
> +	};
> +	struct drm_xe_vm_bind_op binds[size];
> +	struct drm_xe_vm_bind vm_bind = {
> +		.extensions = 0,
> +		.vm_id = ctx->vm_id,
> +		.exec_queue_id = 0,
> +		.num_binds = size,
> +		.vector_of_binds = (uintptr_t)binds,
> +		.num_syncs = 1,
> +		.syncs = (uintptr_t)&bind_sync,
> +	};
> +
> +	/* Need to call the ioctl differently when size is 1. */
> +	igt_assert(size != 1);

This assert should be used in starting before initialization of arrays. 
Also do we need to exit the test if size != 1 or we need to take 
different route for ioctl?

igt_assert() will terminate the test, if you want to continue after size 
!= 1 condition use other variant.

> +
> +	for (int i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.extensions = 0,
> +			.obj = bos[i].handle,
> +			.pat_index = 0,
> +			.pad = 0,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +			.prefetch_mem_region_instance = 0,
> +			.pad2 = 0,
> +		};
> +	}
> +	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
> +	igt_assert(rc == 0);
> +
> +	return syncobj_handle;
> +}
> +
> +static void query_mem_info(int fd, struct xe_test_ctx *ctx)
> +{
> +	uint64_t vram_reg, sys_reg;
> +	struct drm_xe_mem_region *region;
> +
> +	ctx->has_vram = xe_has_vram(fd);
> +	if (ctx->has_vram) {
> +		/* Get VRAM instance - vram_memory returns a bitmask,
> +		 * so we extract the instance from it
> +		 */
> +		vram_reg = vram_memory(fd, 0);
> +		region = xe_mem_region(fd, vram_reg);
> +		ctx->vram_instance = region->instance;
> +	}
you can avoid using vram_reg, sys_reg by using region = 
xe_mem_region(fd, vram_memory(fd, 0) and region = xe_mem_region(fd, 
system_memory(fd));
> +
> +	/* Get SRAM instance */
> +	sys_reg = system_memory(fd);
> +	region = xe_mem_region(fd, sys_reg);
> +	ctx->sram_instance = region->instance;
> +	igt_debug("has_vram: %d\n", ctx->has_vram);
igt_debug() not required
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -2450,6 +2620,252 @@ static void test_oom(int fd)
>   	}
>   }
>   
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd, int n_vram_bufs,
> +						  int n_sram_bufs, int n_proc)
> +{
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = GB(1);
> +		struct timespec start, end;
> +		uint32_t vram_binds_syncobj, sram_binds_syncobj;
> +		struct gem_bo vram_bufs[n_vram_bufs];
> +		struct gem_bo sram_bufs[n_sram_bufs];
what if n_vram_bufs = 0 and n_sram_bufs = 0? Below code will cause issue 
is values are 0
> +		int expected_result = 0;
> +		int ints_to_add = 4;
> +		int gpu_result;
> +		int retries;
> +		int max_retries = 1024;
> +		uint32_t batch_syncobj;
> +		/* integers_bo contains the integers we're going to add. */
> +		struct gem_bo integers_bo, result_bo, batch_bo;
> +		uint64_t tmp_addr;
> +		struct drm_xe_sync batch_syncs[3];
> +		int n_batch_syncs = 0;
> +		int pos = 0;
> +		uint64_t timeline_val = 1;
> +		struct drm_xe_exec exec;
> +
> +		rc = clock_gettime(CLOCK_MONOTONIC, &start);
> +		igt_assert(rc == 0);
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		query_mem_info(fd, &ctx);
> +		create_exec_queue(fd, &ctx);
> +		for (int i = 0; i < n_vram_bufs; i++) {
> +			struct gem_bo *bo = &vram_bufs[i];
> +
> +			bo->size = GB(1);
> +			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, vram_bufs[i].size,
> +							  vram_memory(fd, 0), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr = NULL;
> +			bo->addr = addr;
> +			addr += bo->size;
> +			igt_info("vram buffer %d created at 0x%016lx\n",
> +				 i, bo->addr);
put in igt_debug if they are required for debug purpose or remove this
> +		}
> +		for (int i = 0; i < n_sram_bufs; i++) {
> +			struct gem_bo *bo = &sram_bufs[i];
> +
> +			bo->size = GB(1);
> +			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, sram_bufs[i].size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr = NULL;
> +			bo->addr = addr;
> +			addr += bo->size;
> +			igt_info("sram buffer %d created at 0x%016lx\n",
> +				 i, bo->addr);

Same as above

Also if both n_vram_bufs and n_sram_bufs are 0 then there'll be no 
memory buffers that'll bound to VRAM/SRAM

> +		}
> +		igt_info("\n Binding the buffers to the vm");
> +
> +		if (n_vram_bufs) {
> +			igt_info("binding vram buffers");
> +			vram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, vram_bufs, n_vram_bufs);
> +		}
> +		if (n_sram_bufs) {
> +			igt_info("binding sram buffers");
> +			sram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, sram_bufs, n_sram_bufs);
> +		}

This binding will be skipped if both n_vram_bufs and s_sram_bufs = 0 
then below code will not excercise vram_bufs or sram_bufs. So if want to 
continue only integer addition batch below

without using vram_bufs and sram_bufs then fine but it's not the case I 
suppose. So you need to check if 0 is passed.

> +		integers_bo.size = align_to_page_size(sizeof(int) * ints_to_add);
> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +
> +		integers_bo.addr = 0x100000;
> +
> +		for (int i = 0; i < ints_to_add; i++) {
> +			int random_int = rand() % 8;
> +
> +			integers_bo.ptr[i] = random_int;
> +			expected_result += random_int;
> +
> +			igt_info("%d", random_int);
> +			if (i + 1 != ints_to_add)
> +				igt_info(" + ");
> +			else
> +				igt_info(" = ");
> +		}
> +		igt_assert_eq(munmap(integers_bo.ptr, integers_bo.size), 0);
put all munmap calls at single place as done below. You can move it 
below and after munmap why doing

integers_bo.ptr = NULL?

> +		integers_bo.ptr = NULL;
> +
> +		igt_info("Creating the result buffer object");
> +
> +		result_bo.size = align_to_page_size(sizeof(int));
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +		/* batch_bo contains the commands the GPU will run. */
> +
> +		igt_info("Creating the batch buffer object");
> +		batch_bo.size = 4096;
> +		//batch_bo.handle = create_gem_bo_sram(fd, batch_bo.size);
why this commented code?
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		/* r0 = integers_bo[0] */
> +		batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
> +		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
> +		tmp_addr = integers_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;

batch_bo.ptr[pos++] = (integers_bo.addr + 0 * sizeof(uint32_t)) & 0xFFFFFFFF;?? Upto you to use tmp_addr here and below also

> +		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		for (int i = 1; i < ints_to_add; i++) {
> +			/* r1 = integers_bo[i] */
> +			batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
> +			batch_bo.ptr[pos++] = GPR_RX_ADDR(1);
> +			tmp_addr = integers_bo.addr + i * sizeof(uint32_t);
> +			batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +			batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +			/* r0 = r0 + r1 */
> +			batch_bo.ptr[pos++] = MI_MATH_R(3);
> +			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCA, ALU_RX(0));
> +			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCB, ALU_RX(1));
> +			batch_bo.ptr[pos++] = ALU_ADD;
> +			batch_bo.ptr[pos++] = ALU_STORE(ALU_RX(0), ALU_ACCU);
> +		}
> +		/* result_bo[0] = r0 */
> +		batch_bo.ptr[pos++] = MI_STORE_REG_MEM;
> +		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
> +		tmp_addr = result_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +		batch_bo.ptr[pos++] = MI_BB_END;
> +		while (pos % 4 != 0)
> +			batch_bo.ptr[pos++] = MI_NOOP;
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		vm_bind_gem_bo(fd, &ctx, integers_bo.handle, integers_bo.addr, integers_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, result_bo.handle, result_bo.addr, result_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, batch_bo.handle, batch_bo.addr, batch_bo.size);
> +
> +		/* Now we do the actual batch submission to the GPU. */
> +		batch_syncobj = syncobj_create(fd, 0);
> +
> +		/* Wait for the other threads to create their stuff too. */
> +
> +		end = start;
> +		end.tv_sec += 5;
> +		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &end, NULL);
> +		igt_assert_eq(rc, 0);
> +
> +		batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +			.extensions = 0,
> +			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.handle = batch_syncobj,
> +			.timeline_value = timeline_val,
> +		};
> +		if (n_vram_bufs) {
> +			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +				.extensions = 0,
> +				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags = 0, /* wait */
> +				.handle = vram_binds_syncobj,
> +				.timeline_value = 1,
> +			};
> +		}
> +		if (n_sram_bufs) {
> +			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
> +				.extensions = 0,
> +				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags = 0, /* wait */
> +				.handle = sram_binds_syncobj,
> +				.timeline_value = 1,
> +			};
> +		}

if n_sram_bufs and n_vram_bufs = 0 then batch_sync array will contain 
the batch's own syncobj but not SRAM/VRAM syncobj and hence test will 
not stress oversubcription of VRAM/SRAM

and basic validation will be done.

> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = n_batch_syncs,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +		for (retries = 0; retries < max_retries; retries++) {
> +			rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> +
> +			if (!(rc && errno == ENOMEM))
> +				break;
> +
> +			usleep(100 * retries);
> +			if (retries == 0)
> +				igt_warn("got ENOMEM\n");
> +		}
> +		if (retries == max_retries)
> +			igt_warn("gave up after %d retries\n", retries);
> +
> +		if (rc) {
> +			igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +			perror(__func__);
> +		}
> +		igt_assert_eq(rc, 0);
> +
> +		if (retries)
> +			igt_info("!!!!!! succeeded after %d retries !!!!!!\n",
> +				 retries);
> +
> +		/* We need to wait for the GPU to finish. */
> +		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
> +						 &timeline_val, 1, INT64_MAX, 0, NULL));
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
> +		gpu_result = result_bo.ptr[0];
> +		igt_info("gpu_result = %d\n", gpu_result);
> +		igt_info("expected_result = %d\n", expected_result);
> +
> +		igt_assert_eq(gpu_result, expected_result);
> +		igt_assert_eq(munmap(result_bo.ptr, result_bo.size), 0);
> +		result_bo.ptr = NULL;
> +
> +		end.tv_sec += 10;
> +		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &end, NULL);
> +		assert(rc == 0);
> +		gem_close(fd, batch_bo.handle);
> +		gem_close(fd, result_bo.handle);
> +		gem_close(fd, integers_bo.handle);
> +
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();

what clock_nanosleep() for? is it for synchronization? if it is then it 
can lead to false execution if timing on platform goes wrong.

Also Thomas has earlier commented to put tests in structure and design 
was agreed so please put all tests in that design only.

> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -2850,6 +3266,11 @@ int igt_main()
>   		test_oom(fd);
>   	}
>   
> +	igt_subtest("oversubscribe-concurrent-bind") {
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd, 2, 4, 4);
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }
--------------yQszmlN51VMlfNCJxSCxu1Hr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/18/2026 10:14 PM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">Add an xe_vm subtest that oversubscribes VRAM and issues
concurrent binds into a single VM (scratch-page mode) to</pre>
    </blockquote>
    Why scratch mode VM? Requirement was to create VM in Fault-mode.
    Scratch page have different path to handle faults
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
reproduce the dma-resv/bind race found under memory pressure.
Prior coverage lacked any case that combined multi-process bind
pressure with VRAM oversubscription, so bind/submit could
panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
The new test expects successful completion or ENOMEM/EDEADLK.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 tests/intel/xe_vm.c | 421 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..5c9d5ff0f 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,6 +21,176 @@
 #include &quot;xe/xe_spin.h&quot;
 #include &lt;string.h&gt;
 
+#define MI_BB_END		(0 &lt;&lt; 29 | 0x0A &lt;&lt; 23 |  0)
+#define MI_LOAD_REG_MEM		(0 &lt;&lt; 29 | 0x29 &lt;&lt; 23 | 0 &lt;&lt; 22 | 0 &lt;&lt; 21 | 1 &lt;&lt; 19 | 2)
+#define MI_STORE_REG_MEM	(0 &lt;&lt; 29 | 0x24 &lt;&lt; 23 | 0 &lt;&lt; 22 | 0 &lt;&lt; 21 | 1 &lt;&lt; 19 | 2)
+#define MI_MATH_R(length)		(0 &lt;&lt; 29 | 0x1A &lt;&lt; 23 | ((length) &amp; 0xFF))
+#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
+#define ALU_LOAD(dst, src)	(0x080 &lt;&lt; 20 | ((dst) &lt;&lt; 10) | (src))
+#define ALU_STORE(dst, src)	(0x180 &lt;&lt; 20 | (dst) &lt;&lt; 10 | (src))
+#define ALU_ADD			(0x100 &lt;&lt; 20)
+#define ALU_RX(x)		(x)
+#define ALU_SRCA		0x20
+#define ALU_SRCB		0x21
+#define ALU_ACCU		0x31
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	int *ptr;
+	uint64_t addr;
+};
+
+struct xe_test_ctx {
+	int fd;
+	uint32_t vm_id;
+
+	uint32_t exec_queue_id;
+
+	uint16_t sram_instance;
+	uint16_t vram_instance;
+	bool has_vram;
+};
+
+static uint64_t align_to_page_size(uint64_t size)
+{
+	return (size + 4095UL) &amp; ~4095UL;
+}
+
+static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+
+	/* Find first render engine */
+	xe_for_each_engine(fd, hwe) {
+		if (hwe-&gt;engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+			eci = *hwe;
+			break;
+		}
+	}
+	ctx-&gt;exec_queue_id = xe_exec_queue_create(fd, ctx-&gt;vm_id, &amp;eci, 0);
+}
+
+static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t handle, uint64_t addr, uint64_t size)
+{
+	int rc;
+	uint64_t timeline_val = 1;
+	uint32_t syncobj_handle = syncobj_create(fd, 0);
+
+	struct drm_xe_sync bind_sync = {
+		.extensions = 0,
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_handle,
+		.timeline_value = timeline_val,
+	};
+	struct drm_xe_vm_bind vm_bind = {
+		.extensions = 0,
+		.vm_id = ctx-&gt;vm_id,
+		.exec_queue_id = 0,
+		.num_binds = 1,
+		.bind = {
+			.obj = handle,
+			.obj_offset = 0,
+			.range = size,
+			.addr = addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		},
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&amp;bind_sync,
+	};
+	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;vm_bind);
+
+	igt_info(&quot;Bind returned %d\n&quot;, rc);</pre>
    </blockquote>
    Both igt_info and igt_assert used. igt_assert() is fine, I think
    igt_info() is not required
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_assert(rc == 0);
+
+	/* The right way to do this in the real world is to not wait for the
+	 * syncobj here - since it just makes everything synchronous -, but
+	 * instead pass the syncobj as a 'wait'-type object to thie execbuf
+	 * ioctl. We do it here just to make the example simpler.
+	 */
+	//wait_syncobj(fd,syncobj_handle, timeline_val);</pre>
    </blockquote>
    why commented code is visible?
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_assert(syncobj_timeline_wait(fd, &amp;syncobj_handle, &amp;timeline_val,
+					 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, syncobj_handle);
+}
+
+static uint32_t
+vm_bind_gem_bos(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
+{
+	int rc;
+	uint32_t syncobj_handle = syncobj_create(fd, 0);
+	uint64_t timeline_val = 1;
+	struct drm_xe_sync bind_sync = {
+		.extensions = 0,
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_handle,
+		.timeline_value = timeline_val,
+	};
+	struct drm_xe_vm_bind_op binds[size];
+	struct drm_xe_vm_bind vm_bind = {
+		.extensions = 0,
+		.vm_id = ctx-&gt;vm_id,
+		.exec_queue_id = 0,
+		.num_binds = size,
+		.vector_of_binds = (uintptr_t)binds,
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&amp;bind_sync,
+	};
+
+	/* Need to call the ioctl differently when size is 1. */
+	igt_assert(size != 1);</pre>
    </blockquote>
    <p>This assert should be used in starting before initialization of
      arrays. Also do we need to exit the test if size != 1 or we need
      to take different route for ioctl?</p>
    <p>igt_assert() will terminate the test, if you want to continue
      after size != 1 condition use other variant.&nbsp;</p>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	for (int i = 0; i &lt; size; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.extensions = 0,
+			.obj = bos[i].handle,
+			.pat_index = 0,
+			.pad = 0,
+			.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+			.prefetch_mem_region_instance = 0,
+			.pad2 = 0,
+		};
+	}
+	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;vm_bind);
+	igt_assert(rc == 0);
+
+	return syncobj_handle;
+}
+
+static void query_mem_info(int fd, struct xe_test_ctx *ctx)
+{
+	uint64_t vram_reg, sys_reg;
+	struct drm_xe_mem_region *region;
+
+	ctx-&gt;has_vram = xe_has_vram(fd);
+	if (ctx-&gt;has_vram) {
+		/* Get VRAM instance - vram_memory returns a bitmask,
+		 * so we extract the instance from it
+		 */
+		vram_reg = vram_memory(fd, 0);
+		region = xe_mem_region(fd, vram_reg);
+		ctx-&gt;vram_instance = region-&gt;instance;
+	}</pre>
    </blockquote>
    you can avoid using vram_reg, sys_reg by using&nbsp;&nbsp;<span style="white-space: pre-wrap">region = xe_mem_region(fd, </span><span style="white-space: pre-wrap">vram_memory(fd, 0) and </span><span style="white-space: pre-wrap">region = xe_mem_region(fd, </span><span style="white-space: pre-wrap">system_memory(fd));</span>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+	/* Get SRAM instance */
+	sys_reg = system_memory(fd);
+	region = xe_mem_region(fd, sys_reg);
+	ctx-&gt;sram_instance = region-&gt;instance;
+	igt_debug(&quot;has_vram: %d\n&quot;, ctx-&gt;has_vram);</pre>
    </blockquote>
    igt_debug() not required
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -2450,6 +2620,252 @@ static void test_oom(int fd)
 	}
 }
 
+/**
+ * SUBTEST: oversubscribe-concurrent-bind
+ * Description: Test for oversubscribing the VM with multiple processes
+ * doing binds at the same time, and ensure they all complete successfully.
+ * Functionality: This check is for a specific bug where if multiple processes
+ * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
+ * deadlock in the bind code.
+ * Test category: stress test
+ */
+static void test_vm_oversubscribe_concurrent_bind(int fd, int n_vram_bufs,
+						  int n_sram_bufs, int n_proc)
+{
+	igt_fork(child, n_proc) {
+		struct xe_test_ctx ctx = {0};
+		int rc;
+		uint64_t addr = GB(1);
+		struct timespec start, end;
+		uint32_t vram_binds_syncobj, sram_binds_syncobj;
+		struct gem_bo vram_bufs[n_vram_bufs];
+		struct gem_bo sram_bufs[n_sram_bufs];</pre>
    </blockquote>
    what if n_vram_bufs = 0 and n_sram_bufs = 0? Below code will cause
    issue is values are 0
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		int expected_result = 0;
+		int ints_to_add = 4;
+		int gpu_result;
+		int retries;
+		int max_retries = 1024;
+		uint32_t batch_syncobj;
+		/* integers_bo contains the integers we're going to add. */
+		struct gem_bo integers_bo, result_bo, batch_bo;
+		uint64_t tmp_addr;
+		struct drm_xe_sync batch_syncs[3];
+		int n_batch_syncs = 0;
+		int pos = 0;
+		uint64_t timeline_val = 1;
+		struct drm_xe_exec exec;
+
+		rc = clock_gettime(CLOCK_MONOTONIC, &amp;start);
+		igt_assert(rc == 0);
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		query_mem_info(fd, &amp;ctx);
+		create_exec_queue(fd, &amp;ctx);
+		for (int i = 0; i &lt; n_vram_bufs; i++) {
+			struct gem_bo *bo = &amp;vram_bufs[i];
+
+			bo-&gt;size = GB(1);
+			bo-&gt;handle = xe_bo_create_caching(fd, ctx.vm_id, vram_bufs[i].size,
+							  vram_memory(fd, 0), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+			bo-&gt;ptr = NULL;
+			bo-&gt;addr = addr;
+			addr += bo-&gt;size;
+			igt_info(&quot;vram buffer %d created at 0x%016lx\n&quot;,
+				 i, bo-&gt;addr);</pre>
    </blockquote>
    put in igt_debug if they are required for debug purpose or remove
    this&nbsp;
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		}
+		for (int i = 0; i &lt; n_sram_bufs; i++) {
+			struct gem_bo *bo = &amp;sram_bufs[i];
+
+			bo-&gt;size = GB(1);
+			bo-&gt;handle = xe_bo_create_caching(fd, ctx.vm_id, sram_bufs[i].size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+			bo-&gt;ptr = NULL;
+			bo-&gt;addr = addr;
+			addr += bo-&gt;size;
+			igt_info(&quot;sram buffer %d created at 0x%016lx\n&quot;,
+				 i, bo-&gt;addr);</pre>
    </blockquote>
    <p>Same as above</p>
    <p>Also if both n_vram_bufs and n_sram_bufs are 0 then there'll be
      no memory buffers that'll bound to VRAM/SRAM</p>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		}
+		igt_info(&quot;\n Binding the buffers to the vm&quot;);
+
+		if (n_vram_bufs) {
+			igt_info(&quot;binding vram buffers&quot;);
+			vram_binds_syncobj = vm_bind_gem_bos(fd, &amp;ctx, vram_bufs, n_vram_bufs);
+		}
+		if (n_sram_bufs) {
+			igt_info(&quot;binding sram buffers&quot;);
+			sram_binds_syncobj = vm_bind_gem_bos(fd, &amp;ctx, sram_bufs, n_sram_bufs);
+		}</pre>
    </blockquote>
    <p>This binding will be skipped if both n_vram_bufs and s_sram_bufs&nbsp;
      = 0 then below code will not excercise vram_bufs or sram_bufs. So
      if want to continue only integer addition batch below</p>
    <p>without using vram_bufs and sram_bufs then fine but it's not the
      case I suppose. So you need to check if 0 is passed.</p>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		integers_bo.size = align_to_page_size(sizeof(int) * ints_to_add);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+
+		integers_bo.addr = 0x100000;
+
+		for (int i = 0; i &lt; ints_to_add; i++) {
+			int random_int = rand() % 8;
+
+			integers_bo.ptr[i] = random_int;
+			expected_result += random_int;
+
+			igt_info(&quot;%d&quot;, random_int);
+			if (i + 1 != ints_to_add)
+				igt_info(&quot; + &quot;);
+			else
+				igt_info(&quot; = &quot;);
+		}
+		igt_assert_eq(munmap(integers_bo.ptr, integers_bo.size), 0);</pre>
    </blockquote>
    put all munmap calls at single place as done below. You can move it
    below and after munmap why doing&nbsp;
    <pre wrap="" class="moz-quote-pre">integers_bo.ptr = NULL?</pre>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		integers_bo.ptr = NULL;
+
+		igt_info(&quot;Creating the result buffer object&quot;);
+
+		result_bo.size = align_to_page_size(sizeof(int));
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		result_bo.ptr = NULL;
+		result_bo.addr = 0x200000;
+		/* batch_bo contains the commands the GPU will run. */
+
+		igt_info(&quot;Creating the batch buffer object&quot;);
+		batch_bo.size = 4096;
+		//batch_bo.handle = create_gem_bo_sram(fd, batch_bo.size);</pre>
    </blockquote>
    why this commented code?
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
+						       system_memory(fd), 0,
+						       DRM_XE_GEM_CPU_CACHING_WC);
+
+		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
+		batch_bo.addr = 0x300000;
+
+		/* r0 = integers_bo[0] */
+		batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
+		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
+		tmp_addr = integers_bo.addr + 0 * sizeof(uint32_t);
+		batch_bo.ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF;</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">batch_bo.ptr[pos++] = (integers_bo.addr + 0 * sizeof(uint32_t)) &amp; 0xFFFFFFFF;?? Upto you to use tmp_addr here and below also</pre>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		batch_bo.ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp; 0xFFFFFFFF;
+		for (int i = 1; i &lt; ints_to_add; i++) {
+			/* r1 = integers_bo[i] */
+			batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
+			batch_bo.ptr[pos++] = GPR_RX_ADDR(1);
+			tmp_addr = integers_bo.addr + i * sizeof(uint32_t);
+			batch_bo.ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF;
+			batch_bo.ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp; 0xFFFFFFFF;
+			/* r0 = r0 + r1 */
+			batch_bo.ptr[pos++] = MI_MATH_R(3);
+			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCA, ALU_RX(0));
+			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCB, ALU_RX(1));
+			batch_bo.ptr[pos++] = ALU_ADD;
+			batch_bo.ptr[pos++] = ALU_STORE(ALU_RX(0), ALU_ACCU);
+		}
+		/* result_bo[0] = r0 */
+		batch_bo.ptr[pos++] = MI_STORE_REG_MEM;
+		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
+		tmp_addr = result_bo.addr + 0 * sizeof(uint32_t);
+		batch_bo.ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF;
+		batch_bo.ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp; 0xFFFFFFFF;
+
+		batch_bo.ptr[pos++] = MI_BB_END;
+		while (pos % 4 != 0)
+			batch_bo.ptr[pos++] = MI_NOOP;
+
+		igt_assert(pos * sizeof(int) &lt;= batch_bo.size);
+
+		vm_bind_gem_bo(fd, &amp;ctx, integers_bo.handle, integers_bo.addr, integers_bo.size);
+		vm_bind_gem_bo(fd, &amp;ctx, result_bo.handle, result_bo.addr, result_bo.size);
+		vm_bind_gem_bo(fd, &amp;ctx, batch_bo.handle, batch_bo.addr, batch_bo.size);
+
+		/* Now we do the actual batch submission to the GPU. */
+		batch_syncobj = syncobj_create(fd, 0);
+
+		/* Wait for the other threads to create their stuff too. */
+
+		end = start;
+		end.tv_sec += 5;
+		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &amp;end, NULL);
+		igt_assert_eq(rc, 0);
+
+		batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+			.extensions = 0,
+			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.handle = batch_syncobj,
+			.timeline_value = timeline_val,
+		};
+		if (n_vram_bufs) {
+			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+				.extensions = 0,
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = 0, /* wait */
+				.handle = vram_binds_syncobj,
+				.timeline_value = 1,
+			};
+		}
+		if (n_sram_bufs) {
+			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+				.extensions = 0,
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = 0, /* wait */
+				.handle = sram_binds_syncobj,
+				.timeline_value = 1,
+			};
+		}</pre>
    </blockquote>
    <p>if n_sram_bufs and n_vram_bufs = 0 then batch_sync array will
      contain the batch's own syncobj but not SRAM/VRAM syncobj and
      hence test will not stress oversubcription of VRAM/SRAM</p>
    <p>and basic validation will be done.</p>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = n_batch_syncs,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+		for (retries = 0; retries &lt; max_retries; retries++) {
+			rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &amp;exec);
+
+			if (!(rc &amp;&amp; errno == ENOMEM))
+				break;
+
+			usleep(100 * retries);
+			if (retries == 0)
+				igt_warn(&quot;got ENOMEM\n&quot;);
+		}
+		if (retries == max_retries)
+			igt_warn(&quot;gave up after %d retries\n&quot;, retries);
+
+		if (rc) {
+			igt_warn(&quot;errno: %d (%s)\n&quot;, errno, strerror(errno));
+			perror(__func__);
+		}
+		igt_assert_eq(rc, 0);
+
+		if (retries)
+			igt_info(&quot;!!!!!! succeeded after %d retries !!!!!!\n&quot;,
+				 retries);
+
+		/* We need to wait for the GPU to finish. */
+		igt_assert(syncobj_timeline_wait(fd, &amp;batch_syncobj,
+						 &amp;timeline_val, 1, INT64_MAX, 0, NULL));
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		gpu_result = result_bo.ptr[0];
+		igt_info(&quot;gpu_result = %d\n&quot;, gpu_result);
+		igt_info(&quot;expected_result = %d\n&quot;, expected_result);
+
+		igt_assert_eq(gpu_result, expected_result);
+		igt_assert_eq(munmap(result_bo.ptr, result_bo.size), 0);
+		result_bo.ptr = NULL;
+
+		end.tv_sec += 10;
+		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &amp;end, NULL);
+		assert(rc == 0);
+		gem_close(fd, batch_bo.handle);
+		gem_close(fd, result_bo.handle);
+		gem_close(fd, integers_bo.handle);
+
+		xe_vm_destroy(fd, ctx.vm_id);
+		close(fd);
+	}
+	igt_waitchildren();</pre>
    </blockquote>
    <p>what clock_nanosleep() for? is it for synchronization? if it is
      then it can lead to false execution if timing on platform goes
      wrong.</p>
    <p>Also Thomas has earlier commented to put tests in structure and
      design was agreed so please put all tests in that design only.</p>
    <blockquote type="cite" cite="mid:20260218164417.856114-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2850,6 +3266,11 @@ int igt_main()
 		test_oom(fd);
 	}
 
+	igt_subtest(&quot;oversubscribe-concurrent-bind&quot;) {
+		igt_require(xe_has_vram(fd));
+		test_vm_oversubscribe_concurrent_bind(fd, 2, 4, 4);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------yQszmlN51VMlfNCJxSCxu1Hr--
