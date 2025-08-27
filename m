Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07088CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 23:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325510E7E4;
	Wed, 27 Aug 2025 23:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5qWsCob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44D210E7E4
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756338005; x=1787874005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tn7sium8MtRzz9QQ4SEhGeoCgaFdLYaKxGDsdCpnOSw=;
 b=F5qWsCobd0S4uG6aUoPes/RLFwahH8SaMWFeNVIgJRuuLKLR+ZZ64zKZ
 B142iBb+5GnKX6PNBpf2vWGy/mGO/cvqY0TKFP94mjGmdrs2ksOcQAGWF
 LfMH3DZPc+8/eV/4Ay+FrtdxKbvG0LxtUg99Raa5ZpEym6+iumkE0/KU7
 KINOWCw0tfoeKEJhNnVJJdFZD8XLwWX1IzNSytZ5gSmxbizlllc1RdwoU
 T9XFh1R75e9KwD9Og3fFlOy0nSL6EmeenwHfsQT5pR0s8/2HGVMpfN4Kg
 ULUDuKFzPTNDZDwbhfajn0+/RjEvluQ6fozXqPxphAcY21Lqr6swpVdTU w==;
X-CSE-ConnectionGUID: UU6vEsWtTOKG3a7yWX0bNQ==
X-CSE-MsgGUID: khkI4PU9RFGvjCMJy/EN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76049846"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76049846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 16:39:56 -0700
X-CSE-ConnectionGUID: Qvz2cu97TOKsz/ieRxKE5A==
X-CSE-MsgGUID: 2s6+G8okTbW3jbNWGtln5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174133306"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 16:39:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 16:39:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 16:39:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 16:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjddhsiRO1DqxrEj0NofspzSMZ1kQ/ZcFyshXkZxmUG2yP1I/uJn93GrLA8L1RLxnfmOSVnF6pjGnF/g95JkAp2ILjIFXzJ3NUj2ba/wYVCYM1SfHduSJIitL48ZmCfLvaCFD30uwVNqzV7HVk5SqDC6eFeHAUflhi1JcGe6uNWZ7LW/jHduafX7izEsFfrBlLMePbd+oEZxRHGU8cac+dGosuJWkaJR1KriL2LYWBRZXBjDE5qYho8PcG5zg9QouIkZRmqPRXkWVfdH7IcFznOTOMJr1NIyPeviWIoiG4BaJ3jVmJ5ct3Bvcx/vKMzAkJo+5GoVAfUwqKRmaY3oQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV1lKPTg+LDs6NtYXTSVzdo/gnbtSzi9a4uQtY/oW/w=;
 b=iHiBPNHlUcWbR6RR2f+6kFu1YrQkmyPCet8sFM+9mqhhl5tArtE4bMrOcrRq0EMY2HeYA7HgELU82mANb+hyuAOrv7duzUJzQpirpW1MQN1GGa2cKqVmW1ReBsXPUgDxRN0lze1+GnEIMAgWaHumEbbIBJFBF+X+S4CXOgOZg6+WQFA73L7q6wvHXkzyoQWUl1HufuOUKuf/kGTCDdVO37fvwp5aELPUZYIwl5tz6JYC61mVFOXDwfBvfbww8AkAC2YGgNd5g0OMtRlXi2s0WZANJ+xMBMJa01kl0c6BUKB7dI8URjZp9TRtf7JC+OsDDszlRfKaknx27uxg2BKCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 23:39:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 23:39:51 +0000
Date: Wed, 27 Aug 2025 16:39:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/xe_oa: Add a test for tail
 address wrap
Message-ID: <aK-XPcRQ27iGv66y@unerlige-desk.amr.corp.intel.com>
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
 <20250826224256.510692-9-umesh.nerlige.ramappa@intel.com>
 <87cy8gmwyw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cy8gmwyw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:303:2b::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 179602d0-b68f-4df1-786b-08dde5c3048c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0xLQW9hSXZ0N25pWDhlbGQxYUFqT2tOaVRveU10QzJ4QnBQazVtL1k4SWNJ?=
 =?utf-8?B?L1Z2VFlTMlgrWGZSMVc1QmMrUWVuZjVmN3V5YWI5TzFJM09zRUM2a0tzSTJk?=
 =?utf-8?B?VE1vY21ic0s1dUR2L3BpNXN5Q29WOEY5TUwwbm5RU09rUWszVDBuRVhwR1By?=
 =?utf-8?B?aHNqZXpob0JMUTA4KzlseGVKSWlSRTJVMC9qVSsvZ0xuS2lzOHU4bHNQMUV2?=
 =?utf-8?B?cWV1RTJtemJ1K3h3cXhlZTIxMHFjd3ZUeitpRHEvQzVjTjVhQXQ4bktSb0Ny?=
 =?utf-8?B?b05NU0k4VlNIZ3EwSnU2ZEtGVkNFcUZoSGJ6YjdoMmNucTVqUWZ3VmN1L0Zo?=
 =?utf-8?B?M3J2a2R3bWhqaXBEMFBSWHh1S2xpT3JnY1lNcFlmYUpGUDhzOXB5OEtOb1o2?=
 =?utf-8?B?YUhkMzNFcDJCbWt0OUdXZGZNM3FHMWk4bVVTZHJnck5IencwNytUNkpURWNm?=
 =?utf-8?B?d2lGSlk0dk51aUphN3ZQUGFCeVZsQlJMcHB3UUhtazU3WllJZVdtN1pMMHh5?=
 =?utf-8?B?V3hXVkQzYVlZbUR0NWJiZnpXYVlHRjFVaW1GSGk4NkhPdVNMZkxDWVl2SzBm?=
 =?utf-8?B?UUpiYkhSK2xOd0ZXQXRRV1V4WDVSSUs3YThPM1Q3RVdmbmRHZHRrMS9uU2VY?=
 =?utf-8?B?VC9DeWFORWVuNEF2Y21qZVZCQzlOMXBhd0Z1M3pLc0NlYkJnbkZWS0dVYWd5?=
 =?utf-8?B?d0xhUERSYzhnSGJjSjhVbmdmdlR1Y1BrbldTYnpCbjZQcHIzcitUWm9aWllB?=
 =?utf-8?B?bDRXT1dwQW9wRDN1eG5Db213R2hMWWIzWXdUTVpWREloZjJRRlpGd3IxSUFk?=
 =?utf-8?B?N1RBTkdvMmpuMXIyM0lSRy9JSFBrSmowMTA5TUI5N2RMSHc2UG9NcGxrWWF2?=
 =?utf-8?B?QkdoZnZaOFp6M0RPUldyRXRBRjluQU10Uk1EYkR5SWZVM2tKanhUb3Axd2du?=
 =?utf-8?B?STR5KzE5VS8zdlpvTG45L0hQaW9JK0hHZldaV0Ywdy9MU1JRNHVMSHU3R2VO?=
 =?utf-8?B?OHZYUzZ5OWlzc0JIVTFQN25ISmtNZ1hiWklqcWlocUdkVHpieWdtRE1RdnpZ?=
 =?utf-8?B?Vnc3MWRCQXJnYW5wZzY5dkdnSzIxSmxIZnhsY0REL0x2WkRhWDF0UDAxUnNy?=
 =?utf-8?B?bm1LcmtOM3hVSzlySjNLcVIvZzRiTWFmM1QybmpsTDVBY21Ob2hneVdzWjJ4?=
 =?utf-8?B?R3N1eEZHblFxNTlOcmY0K09jQzZVeEdTUXlxYTF6OHdiM3p1NHNFUTNIaWtY?=
 =?utf-8?B?VERJaXhBc2MwT1RWazd1RHZHd29uOFBWamZHV3BMeXM5L09zYzRhZVBoK29V?=
 =?utf-8?B?SHVscDhIMXg5ZnE4TkVCMmxZSVppaTFYL3R5YnZENmgrd0hjVDF4ZVZ3MUJT?=
 =?utf-8?B?M0ZiL1J2OXBlTjRaendLdFF2cnE1bkpPaS9NVndjeFJlQVNnd253dlBjRFZv?=
 =?utf-8?B?czRZR0R4S2VlVG1HVjdKSUJBTWdqVmgzOUVENWxzTjRBazdqaU1mKzE1LzZl?=
 =?utf-8?B?MmV5NVNHUTNqajQreW1mZWtSZk5GSFJSY2ltY0lhOWtaWlNVc3JhT21ocTBh?=
 =?utf-8?B?VjlmU3NwNFQybFlEWUhjVFpRcFhFb3lvVURaWWIzLzE5Rjc3WlVKSDV2S0xV?=
 =?utf-8?B?RFdVdm1CTzdLRXJoL3FIdURDT2FwaUNuZi9RSUt1bXVQa1FETTVGUUNTOEs2?=
 =?utf-8?B?N2Y0eDYycXRyTzVtbkVNODZqc2R3eHlGK3FWMkxvZk9qQzRQMjBkY3BqRVc0?=
 =?utf-8?B?SEEzQlFMbHRIandXL1JRaERvRWwxbXB5NDErMldTSEgzR3h2Rmp4Z3ZnMS9o?=
 =?utf-8?B?dkh6TjZrdmxSTTNNYWZGZDZ1bU1CVlZBYVAvak9UYW9UL01uTHRFSzNEZisz?=
 =?utf-8?B?UDl4VlQ4UkNyUjErTWRiUDF5LytublBTdUNhQnNFQXM3TGV0bUpWVE5qWFh1?=
 =?utf-8?Q?l2qbHiozzgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzcyRUh6VDJuVXhKT3NHaFgyaks4VzlPZkFseGFUTzIzOXlyRDltSTlGdVBX?=
 =?utf-8?B?VlZjQk5nZ0Z4MTBVUFRSTlUvakoycUFtVzh2Q3FiYnBPbzdtc3U5NHVudS9x?=
 =?utf-8?B?Vm84QktKNndyQW5FOUJRUTZUYmEvTWx4TDNUclFNOGhaMlFqUVBySTh3RTRP?=
 =?utf-8?B?dVByL1ZGMUFHVFp4YVlHMnliSkVDNGxQU01XNXUwWWNKb3J3SEVEODM3TXdq?=
 =?utf-8?B?L3lmQXRQQ2JLSXpHOHB0ZFc2ZEdETzhpQldpdEI5U1RHVlprWFViNmJKZmh2?=
 =?utf-8?B?QUFlSGxybldKTlpDUHV1cVg2RWRGcU9jd2ZJT3JBbmF6QWxoMno1WmZROExr?=
 =?utf-8?B?WVJ3VHU3UzFkc3cwWE5tT0RsZG9zOFRMbzU0OExjR3hxcFFtWWczZXdjUzlU?=
 =?utf-8?B?SFdMd2xzeDJWM2c1dmxiWjgyTFBYNlhpeEVwWHpOMk8rWVIyQVZVSG9VNThM?=
 =?utf-8?B?bGo3Vjk4a01nVFhHVytEamp6dDlxdERUamtKZlhzOElEQWx5R2t0TllXR1Mr?=
 =?utf-8?B?d3FMbFU4Y1V4blNtOUM2MENTcG9DYWxoTUVoMmRTK3hUVXEzTFcyZXRCQno0?=
 =?utf-8?B?Q2pycFA1WlpRR0VBTENhNm5kZnlOeHdGaDIxRVBFN2U3VGt3M0tabkgvU0Rv?=
 =?utf-8?B?Z2Fzb3E4ck1QaGFDMFZZN3BIR0JiYk5uMlcwdVZlMlIwT1BxMWRnSFEvdG1U?=
 =?utf-8?B?QlFsNnV4eVhVMTBSTXFDY3VyRFM5dG44eTZkMGg5V2J5eG1ueHhlNmNpQzlC?=
 =?utf-8?B?aDF2dER0d05kdklXVjFPdnNKdThRb1BWSVBpL0s5c3J1REpWODFlU08waDRF?=
 =?utf-8?B?dS9lNUtudDNvWlJXMnM0VlVIdDY4TytWbWhkOFFUeVh5Y0Y3TVAwRE00ejhn?=
 =?utf-8?B?aDFmNzJPQ1VERURjUmJhdVY4QzFEeFdoYmg1VkVsai90d3JmSWNOazRDMVJ4?=
 =?utf-8?B?UWZCK0RyYjNBb2JRZFVVSDVsZC9oUklLc2xiSGNiWUsweWJNYmpZTDlzWWov?=
 =?utf-8?B?c1dZTnJ3VTZac2dPWkhUK2RPd2RaNmpBRUVXMU1DczFjRjUyZ29WVzhRQmU2?=
 =?utf-8?B?b2ZDQVdOcFZ4aHpUSXFscFZ2NERVU0hKMFBDTWo3VEFVYTRFQWg1UFV6TVZv?=
 =?utf-8?B?aEp5VEVsUlBSaW9WdElzRGxvdXBkZVhuQW9WREJyU0twbkxBMnlTemd2V2g4?=
 =?utf-8?B?Y3hQVmQ1WFhBVTZJSEVGZkNIYjRTYUhheVB6TGpDbFNiUDRpZm9MUTdERzFp?=
 =?utf-8?B?SUF5bkV2V1E5WFRoMXdOcmdsNHl0Y3I0bVc4S0grZUFSUHA3YjRHQ2JTOHlz?=
 =?utf-8?B?dGdsbXQyUlFRNkNJaHpHWjFLU3M3WlhZcUtETlB1UjhwQ2NWcFNmeGFXUXpR?=
 =?utf-8?B?THVBWEVmMWpJMXdvbUwvNVdoZ2hYVmN2YTk2UDlOTlVNV2RRM1lRYTlwNkd3?=
 =?utf-8?B?eFdsWlFxTW1NMWY1bklLN0t3ZnZrWndKSFZWYXdTVnVOK0xPaVZhUkg5azI2?=
 =?utf-8?B?RmhHbnYxcUR6Q0FYbkJ5Qy9iWjY2WFJqNi9yN2dHQmk4VlpGS29sM0N2VzhL?=
 =?utf-8?B?SHY3ZGlZZ1V6ZGl1VHNkK0hTVW1wbTc1YVRGNllrYlRQcHFtNUpqYlVzbHUz?=
 =?utf-8?B?bXd2Y1VtK1VsUGV1dkZsRVZCWkNYaGJ5RXZUS1VEWDRlZmVBNzl1dGQ2VWxD?=
 =?utf-8?B?a29mS3Yrd0hVYUNYeTBzd0ZTMmFPbWR2WUlxcTJ2L2w4WnY1bmswVDk0YjI3?=
 =?utf-8?B?OW9PRXR1bUxPYmt6WXZoMytXd0JBdGNSekZ1citQRUNHM3AyMTZweUwwM2Zj?=
 =?utf-8?B?RG5hYU5TNndJdlhMQ1R1Mi9seEpKdnRvalBtejVVYVAvTFlrSFJkOENibkIv?=
 =?utf-8?B?NUgvTkxZUGdsVzF6QUQyWS9aeThQK1NLUVRzS0tiNTBVTjRrdkl2WkZNRDdC?=
 =?utf-8?B?eWJ1RklwZ0FtNVpkMnphN3FsVWVwYm90OWV3ZG1wWGdiZURuVzhjNnZDUk1R?=
 =?utf-8?B?VWJpbGRzRENhamh5UHFxbW5YMUw4VmNYd0lobzhBdnhZcG9YbTJoY1dkOWd1?=
 =?utf-8?B?RW80TitXYS9GWVkvdVQxbi8rRlRXV25kZ0Z0eVZXcUFZRGhvLzIwWmxob29m?=
 =?utf-8?B?Tnk4TU9lbGsxV3FWR0I0Nmh0R3NQRDFnQVdsTkpGN3ZPN2JJaWQwKzJyWU16?=
 =?utf-8?Q?JcBnd9ngGHZVWi7YxWntNHU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 179602d0-b68f-4df1-786b-08dde5c3048c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 23:39:51.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXLjf1guPdCDaThPP/BAY7MKbUJBthheGbbk3YYShDeCD4l3jxpNvg/moh5iYdubgPnV5h50SX5uh7lVtZoEn3k5IWhAKDK+YWRYTo5dUu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Wed, Aug 27, 2025 at 11:38:15AM -0700, Dixit, Ashutosh wrote:
>On Tue, 26 Aug 2025 15:43:00 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Add a test to verify that the HW wraps to start of the OA buffer when a
>> report does not fit in the remaining space in the buffer.
>>
>> v2:
>> - Make test more robust
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 97 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index d10ef00d6abc..24442e4b83c6 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4537,6 +4537,95 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
>>	try_invalid_access(vaddr);
>>  }
>>
>> +static void read_reports(int fd, uint8_t *buf, size_t size)
>
>> +{
>> +	int len, total = 0;
>> +
>> +	while (total < size) {
>> +		len = read(fd, &buf[total], size - total);
>> +		if (len == -1 && (errno == EIO || errno == EINTR))
>> +			continue;
>> +
>> +		igt_assert(len);
>> +		total += len;
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: tail-address-wrap
>> + * Description: Test tail address wrap on odd format sizes. Ensure that the
>> + * format size is not a power of 2. This means that the last report will not be
>> + * broken down across the OA buffer end. Instead it will be written to the
>> + * beginning of the OA buffer. We will check the end of the buffer to ensure it
>> + * has zeroes in it.
>> + */
>> +static void
>> +test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
>> +{
>> +	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>> +	uint64_t exponent = max_oa_exponent_for_period_lte(20000);
>> +	uint64_t buffer_size = oa_buffer_size ?: buffer_fill_size;
>
>We are providing oa_buffer_size in the caller, so maybe can just use
>oa_buffer_size? But otherwise ok to leave as is too.
>
>> +	uint64_t fmt = test_set->perf_oa_format;
>> +	uint64_t properties[] = {
>> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>> +		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>> +		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
>> +		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> +	};
>> +	struct intel_xe_oa_open_prop param = {
>> +		.num_properties = ARRAY_SIZE(properties) / 2,
>> +		.properties_ptr = to_user_pointer(properties),
>> +	};
>> +	uint32_t fmt_size = get_oa_format(fmt).size;
>> +	uint32_t fit_reports = buffer_size / fmt_size;
>> +	uint32_t extra_reports = 10;
>> +	uint32_t total_reports = fit_reports + extra_reports;
>> +	uint32_t total_size = total_reports * fmt_size;
>> +	uint8_t *buf = malloc(total_size);
>> +
>> +	uint32_t wrap_offset = (fit_reports * fmt_size) >> 2;
>> +	uint32_t end_offset = buffer_size >> 2;
>> +	uint32_t *zero_area, *buffer_end, *buffer_start;
>
>You can just use u32, instead of the longer uint32_t, for these...
>
>> +	int i;
>> +
>> +	/* Ensure report does not fit */
>
>This comment needs to be more specific, or just drop it.
>
>> +	igt_require(wrap_offset < end_offset);
>> +
>> +	stream_fd = __perf_open(drm_fd, &param, false);
>> +
>> +	/* Read fit_reports + extra_reports */
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> +	read_reports(stream_fd, buf, total_size);
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>> +
>> +	/* Quick check for valid reports */
>> +	for (i = 0; i < total_reports; i++) {
>> +		uint32_t *report = (uint32_t *)&buf[i * fmt_size];
>> +
>> +		igt_assert(report_reason(report) && oa_timestamp(report, fmt));

Maybe we can hold off on this patch.

It looks like when the issue occurs, we will not be able to read reports 
greater than fit_reports because the kmd will not be able to find valid 
reports in the OA buffer after the wrap (since the TAIL reg is out of 
sync).

Will think of some other way to test this.

Thanks,
Umesh

>> +	}
>> +
>> +	/* mmap the buffer and check that the end of the buffer has zeroes */
>> +	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>> +	igt_assert(buffer_start);
>> +
>> +	zero_area = buffer_start + wrap_offset;
>> +	buffer_end = buffer_start + end_offset;
>> +
>> +	/* Ensure HW did not write to this area */
>> +	while (zero_area < buffer_end)
>> +		igt_assert_eq(*zero_area++, 0);
>> +
>> +	munmap(buffer_start, buffer_size);
>> +
>> +	__perf_close(stream_fd);
>> +	free(buf);
>> +}
>> +
>>  /**
>>   * SUBTEST: map-oa-buffer
>>   * Description: Verify mapping of oa buffer
>> @@ -5095,6 +5184,14 @@ igt_main
>>				closed_fd_and_unmapped_access(hwe);
>>	}
>>
>> +	igt_subtest_with_dynamic("tail-address-wrap") {
>> +		long k = random() % num_buf_sizes;
>> +
>> +		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>> +		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>> +			test_tail_address_wrap(hwe, buf_sizes[k].size);
>> +	}
>> +
>>	igt_subtest_group {
>>		igt_fixture {
>>			perf_init_whitelist();
>
>Otherwise, this is also:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
