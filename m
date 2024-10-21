Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C17D17138
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F43D10E056;
	Mon, 21 Oct 2024 20:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp4JNp6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8C10E056
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729544138; x=1761080138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eOptjr9hNZGURVMXLcJH+StXHW/AZpcW9+L8TSy9oMA=;
 b=Dp4JNp6+o3TGGgiaFeNlic1iPbTTsOn4sbtCxDv20jcauqurhoiK/u99
 IqwUoMyosWo40YOdGe0V/Hsv5BuQRdtu1LEFvqg1zSH/SfTARwoguMgNJ
 XPRSEcb9Z1E3V1d6gokf86m8LDHZPoy2KRQHxbXqXresEXnaKqeIaYBo/
 U3slc09zh0yLorwEfind7E7OuTSd314hTklYvgnnmSaEiuzrD6M4x7h90
 VH4CV+7hEF6V23a0Juv7e5KPnyOeBXqeuxQsM4iSIifuAKKwHLrwvTZaT
 k/YRZ1WLNK7gweurSCXPov0y2rcVtMsX3LrMvkjBpx804gybFsHTDt6aj Q==;
X-CSE-ConnectionGUID: KlXgxKXJTWSqkKDzyf5FUA==
X-CSE-MsgGUID: SQk8xJlDTUCuQ0znTrqU6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28822353"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28822353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:55:36 -0700
X-CSE-ConnectionGUID: KbdxVLxzQ32KHfaOhp/qSA==
X-CSE-MsgGUID: FqgoID65R+KtDUsVTp0oxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79725381"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 13:55:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 13:55:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 13:55:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 13:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fkq9xS7W5/GqTh5Ys5mDjXzVbBSBlxLd4kzSEIC27YWjGjDq6rLP+6QCmNzqg2+d3FD8aci/ANfV/JwcLcKCDYaeMFJ0HXV/jZR33v/WU4/GWTVu6aWVCmNIXAdVi48o5L1OtwTl7Ik7mxSYDHRg2cTFsGvKseoL9Rat46CZyouz7+qMS6fOeQ3zbyUwkx4TP6xJrDvwRhTLOsdBrMH7D7mOLHWHI+fcfTTdcPuMbcZ1eOcFRRJuiCPB3h5qn5TpIzzvfyEFkrqZwcEJ62glSgIqc5I/cg7PpSCEr6JPZ5plpM2PFlCn5kpj7wGqOsH6c+IuaQCt3CEeTZkxchJi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq2ePad2mHXOWE7tJ78XD241iXJzdyaz4RqHYrwG2K0=;
 b=BMJmT90N5XaWkjSMWcpPsgfyUpCM3p6gbxBKrxsBu8pzZTZqkGWFbILZipuxCnXdp5yjnglz/Ahv6Oiqs3rwinaTR/A/Twua5Ej08xiDPPvWMJKBgNEnj+vRt+zOHK2h9fDfTqwARvttiXjI4wv0Sj3gLrkbB2l7vf/+e7XM5kWAQWWMQ03ZE+wOs4geJelSBtzmKGD3M1jFPGHpgfLLEwQrBFGBYY75quvr+UhnbjAdLJ/cJjjTP/lX4K3kt1w+NI0jF3YbVDlvttpXCnKxkKoz65V/u3g2rw7OSJiodHJjqSKPcE5ZQMuAtOgryK3q6f+8BCbd5ga/Q8iYsEOTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 20:55:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 20:55:31 +0000
Date: Mon, 21 Oct 2024 13:55:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/xe/oa: Don't skip if freq sysfs are not present
Message-ID: <Zxa/wYnP2t3JYu7b@orsosgc001>
References: <20241021181203.1094596-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241021181203.1094596-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bdcd20-d231-4c85-c5e8-08dcf212b35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGpyS2pDSTRiVURMOVhla0lXYlZuVGN4bFVLMDhxNk5reXFUWlNTeHRtU3Zl?=
 =?utf-8?B?ZnIySnhUOVFpQ2NqRklZTUtNdE5HWmRBeUpQMmcwaWVFcC9POFpsSGFSNFN5?=
 =?utf-8?B?dmpLc1VIZXRsNmlSUllpSW13SGxBcStjSFdOTkVXbXp0cW5QMFhoS2JsZ3RE?=
 =?utf-8?B?YndzODl2UVBxbzRzN2VtQkZ3SVdMUFllR0ptZ0hKV0VOdmE4WmhUT3liOVNo?=
 =?utf-8?B?d1BoVU9ZTHhiMlJ0U0RuMzFCOUZtekpLdzBtMUZDT1g0am05SG4yM1loQWpQ?=
 =?utf-8?B?VjdrRk5BRXJlaEZTdUVXdkEvQmlHZnNIVUIwcDd4WUl2clpWTWpqMTRLS1d5?=
 =?utf-8?B?Ymhpd0RtVlErMitwSm5CVWlheTdmWWJXeC9oTTZicDQ4OUVwQzEvNFJ2TWM2?=
 =?utf-8?B?aTdlREtnQnZKN2hiZkxNeDBLMkgzMGhVRW9kTGdJenZxWEJ2ZnY0aG1PbnQw?=
 =?utf-8?B?Zng2Mk5ZUFBhVFMrT0tKVlJxdFdUQVdGM25iMWFkN0hCZjZJcEMxMDRpeG5I?=
 =?utf-8?B?UXcvNkpDekdnMGlFQXpIakFlMkxVckVmVFNLYWN4UzY1WTFxU1NVQzM5TmxH?=
 =?utf-8?B?Y2VGZXFWRjJBUnNnOEJGT296ZUtCSi96QnBUNTAwSDNPTkxQNFA2TmZYamJB?=
 =?utf-8?B?ajZyKy9abis4TTVLOVEzVE1vMzc1VGdkS2JMUERuQTBlOXFjZUhTNTBrTWkr?=
 =?utf-8?B?ZDZPZ3d0bFBCM2FDZmI2aGlWVStkK216ZkV1QzJaN1J5ZkprUUJyWFplYjlw?=
 =?utf-8?B?WVJTeDltVTFjMU5zdTIrNHUzMEJQbyt4MVlsSWE4eVVVOVFzYVphbGg5UWgy?=
 =?utf-8?B?V3krTS9PWXl1RkZuLzZWN1Q5QjJFdzRHdEZDZzU0K0hTZVh1MG1NUVNybmJF?=
 =?utf-8?B?dnYyRVREUStmN2hXaGFPaU9pdzFTb1RuZ1FKZVo0WXg4WHBnT2l4YjA2V1Rr?=
 =?utf-8?B?cnQwR0hyb2k4SjJpLzQyakdQVkQ0T2M1aEpsQzQxMGhpWldWT2c2OEw1UnBi?=
 =?utf-8?B?UEV0RW5BaitrSEVGK2EydmJMbnVvdHdKWm9HMGlkUjFkVTJaR3Boa0xYRm45?=
 =?utf-8?B?cVRJRkpQMlpEQ0hjQ3VtUVRxQW43cnpwMlZFT3liQ2RCU1kvWlljVnJxV1hD?=
 =?utf-8?B?S0RnV1dBRnpqNTBFMmdGY2pSRlpyMXZiN0l6YWQrKzFYcnhWRzhYWlNqZDNs?=
 =?utf-8?B?U1k3NlVham83VUVVaTlycmRnZmNNckFGTmVNeHJ0RktkTVQ4U2RJdHRvNVFt?=
 =?utf-8?B?ZUlhOEJ3dFBQM20yMGJhczA1dHpYbDJCYnlzUFFjUmlvRjdmMGJPc0p2aTJW?=
 =?utf-8?B?RGV5dEFHOUFWcWZ0VnBYbWZNMEhSaVZBYUpDbTRPZFpmVExDUkdmUzdmYmFy?=
 =?utf-8?B?aCsvQkY0ZHJUUGszWUxHVHNzL2c4TW00SUtRbkhUUmNBQlFuWEVjb2dHTU1Z?=
 =?utf-8?B?UG9yeXFZa2lUTWgvSUdGQzJhMkZFa0NjVmZrUndZcytEREtaU1ZpMWxHNkw3?=
 =?utf-8?B?NEZhQUtVdXcvQ0htazJGLzNnSTVuajNGUTArVWFkQkhzOW1KWldtS21paWhM?=
 =?utf-8?B?MW8rWFJOZmRsak5wanNvMmxQaWNmeXdaampXZG1MUG5NYWRiWUl3Z0dsbm1K?=
 =?utf-8?B?Y0M4NFg0c21ocUh6OUlYaVJ3UEYySEh3ZnBqc1cvS3lXL21rVmhwTHJ0MUFX?=
 =?utf-8?B?R1RXUitCUGtQY3JLaFpkeXcrQTRBODJQaDNzcHRIRzdKTm1jVWlvZFZjZW1y?=
 =?utf-8?Q?S5s2zvkHj2G1RNhk0Fcla4B+dcmHWTYq/LXdluL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUwxYld3SWRBc1JJWUFGUk96Z0hXZXdaS3ZoNHhSdkIvQlBOaHZIT2pFbHVJ?=
 =?utf-8?B?RVIwUlF4TGo2dXdoZHdMNFJVTURiWU0xaHo1QUZWaGNsY1RuaDhIcVA2V3M0?=
 =?utf-8?B?SWpIV3ZXYXdlZFZ0U3Y1V2h4OFhsVmczQy91dFY3N0ZaQ3Z0d3QrYW1qRm1u?=
 =?utf-8?B?U2k1VXlrbXpVT3VScEE1ZTg5NktscEpsS0JNZjJpeHlPcEdiSWdrd3pQOUVi?=
 =?utf-8?B?cjVWVmRETlVjaFkrQ0k4TWNZRHFRZjArVGdxaWJQWDA3cFgxU29Vb0d3QTgy?=
 =?utf-8?B?TUZ3RHhPTEdpM3ROazc0M2RQSFNVdWl6N200L1FBMWpjaG93M0QwcTlTdEhW?=
 =?utf-8?B?d2NPUWdESEpkOXlIS0NSeVZJclJIa1lscE5OKzkrYXpNd0lDaExaRDEvVVNt?=
 =?utf-8?B?QXdHWW8rRWpKb3BKKzJzM3o4NXI2UFZmNlJhQXBTak1zY3ZmWDhZTjZrQTgr?=
 =?utf-8?B?VGFzSktjUTRMa0c1OG5JYmVIb1JyZjB3Z3hveHJOeUt5QUxIZjNTNzZscm1G?=
 =?utf-8?B?a2ZxK2hkQkY4ZGRiZWU2ajZlWVhKa1pBeU1VOTBlQjdVNG45Rmg3Mnk0dzNU?=
 =?utf-8?B?eHRvU0pSa2d1U3U0RUhDeUhJUnZINlhzamZpdDZwam5mUXpkc2hUYUZUWUFG?=
 =?utf-8?B?cGJiUEx0QjFEWTJhaURaUzc3R21FN2J1dFRmbk1laHdCZGRSRjB4bExFakZl?=
 =?utf-8?B?TDg2SnIxMHdhazl0NEhVZ0ZZOHFqWUp4RjRFcitWZzhPQUQvQVNZZ2NISWdp?=
 =?utf-8?B?TVBXMW9IeHdGS2MwRjhVRzBBRmRNZlhvYjdqdGNOQUdibUx6R0pOaXFyZ3Ay?=
 =?utf-8?B?MzVwbHJMOXZSZHE0c0JEcnJQemFTZmZOZmZPM3ZBbHJ2cVYwNkpSd0FZYUtM?=
 =?utf-8?B?MWp2NUUvazAxeEk2SDhtV3YxS0Y0Ulo2TEQ5TWdtN1BNRUtjU0ZMcUNybkNS?=
 =?utf-8?B?Wm53WGxGemFqQ3RTc1lsSXZFdERoczRVV1NFMW9hYWpzRUltWmg0bUNIeTUr?=
 =?utf-8?B?aWM2bXZnaXV2WE5FdW1pYW5uQWxIMnVCU2V1dVJxTDcxdHZmUURDWExMWWxL?=
 =?utf-8?B?d01oZ2lFSW8xRmxzSmVkaW0zVmZRRlR6NHQ3d01weVZVQlpJVFBldmhvcElJ?=
 =?utf-8?B?UXJ3V3JzWEdJNGsvNldFVEs4WUNDdkdtci9RN0g1c25Oamt3UFBSNmhSRlpW?=
 =?utf-8?B?ZmZvTlY4K0d4ajcxWGQ3RGswV0xCV2kxU1YvbUhuVkVEbDFMd2x4UGJ1TGpo?=
 =?utf-8?B?YWk3VEhpUU92dUp6bGJpb3VaMmNSV3dYejU2UGFNblgwSCtmQTNrRXNhSkZB?=
 =?utf-8?B?dmZZYzMrYnZkK2hTcXdJSHg1SHF2QzRPeXJGVjBPZEZkZzVlSFNxeTRwWHpG?=
 =?utf-8?B?UC9WcWZHWmNid2t2a2c3d2svWnlDVzJ4UG9jMmlKUE50L2llZWcvbmY4eFNJ?=
 =?utf-8?B?NXdvbmJpMDJzaGExQXF4dk1vRVdDZjFtVy90NzNVMmowZ2ZudWI4UCtoUjRv?=
 =?utf-8?B?dGcza2VLbmRWd3VTTnFwRlJRSW1lNHZ2S3VMbFhTUWZjRkUyQXBGbWNwMEJG?=
 =?utf-8?B?T0dnR3lqL1QyOEpYZHlxaE1rc2xDMUNqS2dwdDE2ZUJMRTRaVzZVd0tXc3Fu?=
 =?utf-8?B?bk9acTA2eVpyQVBicm45d01kZkIxNXNjSzdTUkdEOVBzY0ZVTml6TWdER1VJ?=
 =?utf-8?B?Yks0M1ArRkt6VEFJOEgrd3FDajR6TE5MQUQ0RkR5TnM0UmlxbEhjdHNpelhs?=
 =?utf-8?B?WkRXVTBoRkJMVll6R1AxeFlacFl5cmRPQlJwdGNwKzdZTjdQcWFCVzZySXUw?=
 =?utf-8?B?eWVid0dNSlN3L0tXb2RkbXFtWkYrUkpIWVJOWXpURzc0alEwdWFYZ1FOSFZV?=
 =?utf-8?B?YktabTNvOTZVOThNM09KWXIvT2FzakpQcldHTEUzY2d2T0tDamlBSHFraFZ4?=
 =?utf-8?B?RzJGOG5jU3ZWMjY4NGpPL0hTMCtqU2tubk9BOG1Ra1JlRmRZcDJZa0E5a21D?=
 =?utf-8?B?cFJWemNXdlR3Z3BkZU5zeFZpR2phS01SRWE5ank5YjgxbGdBVGx2bmF2VGhT?=
 =?utf-8?B?VHF2aDJJSDZ0K3BzRnNuS2FQZmVyMXZJb1NaRHFtR2QybzVpQy9SQzFzRCtV?=
 =?utf-8?B?ckJ6bVE3ak9YSXc4OE80ejROUTRZOHVCNHpiMlE5MGU4SW5jL2MyVkJSbjF1?=
 =?utf-8?Q?N4GzhF0HJnbdPwKXU13taow=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bdcd20-d231-4c85-c5e8-08dcf212b35c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 20:55:31.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNu23GVHgCFAqlzmw4oF5OSCa+09/tzYoglBaj4zeM6rxIrPso8XFgEo3UCrY3T/hFJTNhAH86E8swPAy05ur5HALoOmzB1gxYgaHZ6kJgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Mon, Oct 21, 2024 at 11:12:03AM -0700, Ashutosh Dixit wrote:
>Freq sysfs are not created in certain environments. In most of these cases
>OA IGT's will work just fine, even when GT min/max freq's are not
>known. Therefore, just print a warning if freq sysfs are not present but
>don't cause tests to skip.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/xe/xe_oa.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>index 86264230c9..189388b76b 100644
>--- a/lib/xe/xe_oa.c
>+++ b/lib/xe/xe_oa.c
>@@ -571,11 +571,9 @@ xe_perf_for_fd(int drm_fd, int gt)
> 	}
>
> 	if (!read_sysfs(sysfs_dir_fd, path_min, &gt_min_freq) ||
>-	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq)) {
>+	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq))
> 		igt_warn("Unable to read freqs from sysfs\n");

1) Well.. you would still end up with an igt_warn. CI will still 
complain, I guess. Is that acceptable?

2) If called from an application (i.e. gpuvis), does the igt_warn show 
up in stdout?  

For IGT, I don't see oa tests using this, so it's probably okay. If the 
answer for 1 and 2 is yes, then this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>-		close(sysfs_dir_fd);
>-		return NULL;
>-	}
>+
> 	close(sysfs_dir_fd);
>
> 	device_id = intel_get_drm_devid(drm_fd);
>-- 
>2.41.0
>
