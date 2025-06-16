Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC691C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 14:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D0E10E3D0;
	Mon, 16 Jun 2025 14:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1JHz6/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBDA10E3D4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084112; x=1781620112;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=oMLbtJGFKl5sCD8agiFqFKbqSFwono1Nn28jogPiDD4=;
 b=F1JHz6/v3fx7oIg4rC1kGy4Uh/SkCwW6wop/UupPJJAIZeCBfEsU7fzi
 o3Xtkf2+NXuWWygJ8u4e3ZuyBFdUlvrsVJoc/PIMaT2pHjp+AG01Nvi3t
 IBMnT3c6LIYg6Vf15R3RyQjvSt6mhsLndy6lioWC9nVrt2Xkwe+J9pUvg
 t6WtH+BnFvua1DqB1q26naO/birI9KWHUkRVZ5VZFEGiAKRWBIQZCymEz
 ggWUOO6eyPc81mgkhPUvPsRSbKPUdYAps70wVuKnMEA9S5MuLsSD+hREu
 An6YlBfh7QwhldmBfFzgWEu8y9r1ZejApszYAm0w6wQXMAGbN/BqzVPUr w==;
X-CSE-ConnectionGUID: /poN09l4QsOJAjBJ0ckoyg==
X-CSE-MsgGUID: cXC6zr93S/exkxbZbcOD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52099192"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52099192"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:26:24 -0700
X-CSE-ConnectionGUID: R3taasXKToimf9wilrqUdw==
X-CSE-MsgGUID: xpeRHwHVTp+/02n5hqRBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="179382769"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:26:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:26:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:26:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIA4ll+MaePTYAIKyxXJ5F+HBD6ZsD5CZI3VcBq1SWqUSBDcqfj8XBxuljpC8hmHxQLIYpQsXZRWZTZdA28dplLpwKgPTxW2T5yx0nj8r7rlKL/o1i7bO7AyyfTv/K9MHNRJ3sN8G3q2kziEhAHHbfTYp9gHCZK5C8sPv5pkQtE7NF8w9RdjZVNsF1QRW8Ad2RPvxpH7RYkvahYX1z6CiSfZCUhdkTa68luVIHDgvlTlOv6eSXGZaYQb1hbRFGROE0UFR3KVZvnNGj7BFfrV3DMEQ3bBIon+YlJv3Vap3D4kq51PEPuhMpuwLXXky37nQOY+xyTyVQssm+WhrexPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9FIfxx825OrVJ7kmY53ZHoJgQmk7Lwl8HSEq0jcdOc=;
 b=TUbQJhLdssq+sULtXqTF9oKH8AadPpCJQkoszgYn1akZTQeRBdiAzlqS1YUFoBRcZ0iN5iJwztjdrISdi6CLwsQbFKiexALZ3MroC+UlDYGY9Exz+937M4f26x1fxmKmDKKa/z5XzxPhe+3FXfNKPz2JZXJZIvuCnpQC41KhGXC3Un4D6LguDy7+FFYyNHdj9JjutkB1HcyM0y3flnJmwwfmU9tih5Z/XHXWW1g+p0zZf+NbpK9ypA+LXmDMgrp8osdS70WH+ktiH2BvXEMixVjZesUxpuG4Ri+Dcf1/hFN/oHrqwl2Uv5ds22XR+03z/M0vOjdq/narRCJlhGqn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS4PPF4B1ECA5EA.namprd11.prod.outlook.com (2603:10b6:f:fc02::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 14:26:21 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 14:26:21 +0000
Date: Mon, 16 Jun 2025 14:26:15 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <andi.shyti@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference in
 gem_has_relocations()
Message-ID: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS4PPF4B1ECA5EA:EE_
X-MS-Office365-Filtering-Correlation-Id: f92c1fbe-43e9-4d67-ed46-08ddace1c3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXg5OUNaaDdKUkR4L01NVzJtSlk4WTBFa2pSazlFSGhuRGkyOVlUOXJkRFNW?=
 =?utf-8?B?a1lkMHQ0VGFtMnQ0NEZGNlRadkYvMXRvSFE0Q25oTUZ4WGw2dkFCY2NzRDdO?=
 =?utf-8?B?L2JEajAyeVZzdklkWFI1d014ZWMzeEtUWERzK002c0VRb2wwR21mb0ZWMW5H?=
 =?utf-8?B?eG8wZkNzNWdyS3pzeWt2czJJL3dpRi9oZUlQSUdKL20rSmdiKytva1k4WTRW?=
 =?utf-8?B?aHVSOWlLNGFHN2o4eXYvZHlCekd4SHdKZ1o0VVk0NkNBS01wcUVOL0hsaEYz?=
 =?utf-8?B?QWd2S05ieVJqcmxaek5wYUpxZ09JaVhSTzlVWGVhRjVUOGx5QWU4Z0M4N2lp?=
 =?utf-8?B?a29wYW5pV2U0QU5RaW1JdHBGT0hKV1FyQWR5VGwxNTZrRk5tdE9LZGJ4Qkw4?=
 =?utf-8?B?RVhaN2xMejI2d3N2MUlGYnBrZW00KzErZXpUVGdSaTB1ajduVm1aaXJjMW9l?=
 =?utf-8?B?TElVWmJwU2N6TThkdmhtaUpwZ1Q2YWUvbUdVTFNSOGZQZUZPQkdxdS9ibXFy?=
 =?utf-8?B?SjZVMDhnVUlUemczbGhEWXQxc2lYMlVrbkZ2eTlxdjhhK25ZeEROaGZoMG4y?=
 =?utf-8?B?WklaSXNReTdpdmRBbFplNnhqYkoxc2lxaUQ1N2x4VnBTU0NZMUIrZm45S21s?=
 =?utf-8?B?ejg5YmY5Z0cyTmVINUorUnZhWXJXekVaanFHaGYvVGNFTEJhSHFCSmhrcUFV?=
 =?utf-8?B?bFFpQVRlKzFGOS94ODJwa1I1ZG45OUZ5T0prd1g1ZFY3Yi9hdVNYekM3dG0r?=
 =?utf-8?B?azlYempQOHowcWVWOHpyWnphZGhUSjA4eGgrZm81MDU1RUxaeHlod1l2c1pV?=
 =?utf-8?B?TElwdG5mSitTSkVkR3hNSG5La3hrOW4vVDdPYlAwZE9FZGdLL0ZqeEpoUWEr?=
 =?utf-8?B?d3BkQWdENnRoVjRBZDdaRjJ3OWs2QjN1K2RjOVZDTFMwNTI3dWRoVGVhSWp4?=
 =?utf-8?B?cHkrbXpMbkhwcS9ubUZwYU9iZ1grMkZEVG5TT0tHR0wxUWFvb3dSVnJKNlBs?=
 =?utf-8?B?Y3djdjd6RVFnL3Q0RWlMNEFuQXFxbmsyY0NlNTNGTXo5TmdlOVJjQXp4ZTZJ?=
 =?utf-8?B?Z0NyT2YwZkxqNnl5c0hvTEVzNUxUb3pSMm54RmhjZllpQ3BjODFVOFZWTXdm?=
 =?utf-8?B?M2JaaGE1cU92SDBnK1ZaUUlnUjlkOXZnRlQ2NVN6eENEcXU4c0Uvd21kd05v?=
 =?utf-8?B?SmQ4UWJ2MEp5dWxJbVlHaFdEeDg3ajk2Z0FXUHVCNFhpdlN0QlJ2WGZveTRU?=
 =?utf-8?B?TlhQMVFUK3dkZm5QdUJGOXM2alVuSFp6NlBHK0R4bDQyMmk0QVBBK1YrZUhj?=
 =?utf-8?B?WXFBRzVRVFNDUy94T2Zpc2hrNmg1c0p0NWY1aXE4ckVnN3plTE5iWTlwRkgy?=
 =?utf-8?B?SGJaWGhPVTc0NVU0Y1dDWVZ6R1lzUnFiTHlsbTYwOTJwdTllemtoMW5URExy?=
 =?utf-8?B?c3VJVmFmVjRDdkxyYkpyQXpINUpJbWxaS3dTeFVyRDVuZ1pkNTkvRFlKV3Rl?=
 =?utf-8?B?U2hxWVRwQzRQN3ZCNzZoL1ZpTnhYU0FJMktEZkhYTVVvbS9nSG5NTWphWnNH?=
 =?utf-8?B?azlQYzBJOVkwQkpOK0JuTzZNenZGcWlONnRBcU9QQW9PSi9rdVZRSFEraUtX?=
 =?utf-8?B?UW92TVM0aHJqNjl0MVlBY0dxNjhKZnZKdFdyL1g5TmtCMDE0WWdKM0R1Vi9p?=
 =?utf-8?B?WWdCZklVbENMRUFHZWhtMi82dEwxM29JRTA2aGJtbEpyYVVCRmJHNklZVTN3?=
 =?utf-8?B?WHA4S05EOWVrT2QvVjhRU2wrT0c3eGRIWXFhaFBpaEtuQ2hBdDNZVWFSMzZs?=
 =?utf-8?Q?tXoF4rXMkdPHG2FD/I/RjwA4kopulqO05fK5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnhXSnRPYTd1SjFaeXZIN3czV2w1TXorTkxIR2dSMWJYWDdvTGxWbGcxa1pt?=
 =?utf-8?B?WE1xK05XM0trb2IwekVhdng3ZVFvamRacU14SDBybTR5WkpOcENoNTE5dk1E?=
 =?utf-8?B?VUJTSVFsQkVNNCtneVMzalF6c3JlVGRXcWRkeThENktmSlJTNGtjdnF4Q1kr?=
 =?utf-8?B?WnR1a2FNZjBYMU5qeUQ2bXRkeGR6YVlZYlRVQlN4T013NnQ0WnJZUzc4Njkx?=
 =?utf-8?B?eTdoeHBTbTZRSzVldThOUjRpL290NDdJbXNYTjhnQWRtNEEzRFlOK2Y4aFVr?=
 =?utf-8?B?TkRSNkFQVFhUaTBUaXEwVmdneHZCenMvYzB3UzVRcE01L3dkcFg3dlpvSFpD?=
 =?utf-8?B?NFBYU0w3Rm1tU3VaSUpaRVZCV0o5SDBwZnFiT1hLL29xV2JPNC9PS0xvNkRY?=
 =?utf-8?B?d2ZHMkpTMndndU42N0ZQWTA2bE9PeGdRUENnUTA0cnRNWVMvSDJBZndwUytF?=
 =?utf-8?B?ZURlTGlKcW5VQzdrelJ3R2paVWlkTWVuaG1oT3QySXVOOTJkZEt2S1M4bGN1?=
 =?utf-8?B?TUx6MzVHdExjQWJaMG02NEdIWS9OQVF3Q3pzMHl1NElEaGMvY0xZZnRIc09m?=
 =?utf-8?B?M3Ntd3J3bDFUT1lPbjVQU2w3TUM5akVWODNBR1Y4VHc2S05rTlNtMzlTRXgr?=
 =?utf-8?B?VU0xczRhS1RYWnIxK1dIQXNIL3BuSzh1NTRTMW9HcjNrWjY1ZEo1V2RNMTRV?=
 =?utf-8?B?bGlmMFFJbHdiMERUdDgrRzVxQmZ4MzBCRUNwdXpraXZNYWFvaGk4SXVpZVM0?=
 =?utf-8?B?MVU4d2lBcW1hVWtrMlllSmwvNXVML3psdk9ubFZlK1dSdUJMbHVKU3dYRWFM?=
 =?utf-8?B?S2ZEa0NLd0ROYXZvZXhMaWRpWS9WbVJ2SnBIdlV5S0xaRDdMRWlIbkxLQkpt?=
 =?utf-8?B?RlZmdnZBclBwT21ndU1hOU52bGZmdUxCYWxhU0U4TmtyYXBhdDc4cmFqNHd1?=
 =?utf-8?B?Q3BDUXlQcWlwbkg4eVk4ajE4K2JwM0ZSUk1QOWVTMkNmMFBVWnd6V0QzNkRm?=
 =?utf-8?B?ZDA4bWdwenhtMUhuL0FmZnZxTEJZZE1teXdIbzFncXIzdUNIQXdkNGYvVmZJ?=
 =?utf-8?B?dStkTCsvWlJYVUt1ZXZUeC9ibzcrdUZ6NXc1TGJpQ2dvd05NV2w5YkJBUmgr?=
 =?utf-8?B?OFVXdk1PVEV5VWZGY1dGcXhyVmE3TkRSbDFjSGxRbmo5bGZJcnFiRFQ2b01H?=
 =?utf-8?B?Z3ZPQUU0UU8wVEpHQUlCcXB3bUFnaTNVT1MvUk9oVUQ1M3lsS0xycU82YWZv?=
 =?utf-8?B?dlkwVnhONDdJUXFKOTY3Y3dHRFJoV1RjSTYwZVdPUVVHc0FMZWlGZFIrbnVI?=
 =?utf-8?B?OEFxSkl2WDlFdVJzcUpSK3FzY1BWVU1wYjVuVE5yK0lpOWg4WkhWSVFNU1ZC?=
 =?utf-8?B?bWMzNWxodFhCZktmMytueHRVaXdCOHpFS1pKVlQzODl1NUlvVTk1U3k5SmF6?=
 =?utf-8?B?RHBySDEyVTdQTDE1anBwbDNyZFRKRGRnRGJIbnFKckNoWFNQZnkwaVdRT0hO?=
 =?utf-8?B?Y3BXeXAvbnJjWU41NklTSnFqRkNvcElHSkV4bEdyM3JldlphWVlxdTMwcmh1?=
 =?utf-8?B?Z1c1REZMNzMzb3M0dFJxL3QvU3NBZU1TTXBobUdmSnA0S3YzTW9aMWlGV0th?=
 =?utf-8?B?SzRSNmhFaXNad1BNN1dhS1MvdmdMRHM3Tzk4TTFTWS9uRjIxaG5aY1RiUi9G?=
 =?utf-8?B?QjJ5UU5SOS8xbW1UNzBhaTlBQndhVk1OMmExUHFxcU1DVm4yR3RwenR3STJs?=
 =?utf-8?B?TTNnVEJXUFZrTjBTMisvamVJKzVOTm9VOXpjUjI3dE8ydmlQb01Idyt4ZXpy?=
 =?utf-8?B?dEpJd0xWN0htT0loeWgvdG9JVHJQcjQvOGVkZ25tVytsUzIzOERkd0lvM1Av?=
 =?utf-8?B?Wnd1a1AwbURqNCtqRzYxMG1QQnJkZk9rVVVISWgwMEUwNWlMSlhYTFNwOHBI?=
 =?utf-8?B?RklZWlpVUGFpL3cvTW5uQ25zRkdwdEhXZnBlRGp4OVZUWTE2dlY2bmFoMVJG?=
 =?utf-8?B?NkRFMTF1Q0V5TkhWQ3NHVFh2c0w2cDdXc0YrRENIQUl4YmhBUWlEbjhkUXg2?=
 =?utf-8?B?ZHhPSmRVV1NER2cwcVRKMHI3aWNuV0NYS1N2RGMwdWptWmNDeVJwN1BrYmZu?=
 =?utf-8?B?UklxM01tdDJNbDZTOW1HTk1rdjZxQmZRMS9iRnMwOW5iOThra09DakV2S0Vm?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f92c1fbe-43e9-4d67-ed46-08ddace1c3d8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:26:21.2752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOJ/EQb2GDNWgEpSeMTe5vYO0deDx6VnVl9UoynQIxUvpHlJWYdpMjc2LOvVMalgveovf2umrMTXrDSitLTIHei+6zTTnHwN8az41x6jH6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4B1ECA5EA
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

Fix a general protection fault in igt@gem_exec_big@single caused by
passing a non-canonical address via relocs_ptr. The test previously
used a stack-allocated relocation entry, which resulted in an invalid
pointer being passed to the kernel, triggering a crash.

This patch replaces the stack-allocated `reloc` with a NULL pointer,
ensuring the kernel correctly interprets the absence of relocations and
avoids undefined behavior.

A corresponding kernel patch to sanitize user input for relocs_ptr has
been submitted to the i915 mailing list to further harden the interface.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/i915/gem_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 7d1c3970f..a03b2e369 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -421,10 +421,10 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 
 bool gem_has_relocations(int i915)
 {
-	struct drm_i915_gem_relocation_entry reloc = {};
+	struct drm_i915_gem_relocation_entry *reloc = NULL;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4096),
-		.relocs_ptr = to_user_pointer(&reloc),
+		.relocs_ptr = to_user_pointer(reloc),
 		.relocation_count = 1,
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
-- 
2.34.1

