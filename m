Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0752FE78D44
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1B10E2DE;
	Mon,  9 Feb 2026 08:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXy8Rk2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3DA10E2DE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770626329; x=1802162329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ngfj3S1IfujH9Zqzbg4Am6OoKOIPNZZiFhWc1SxmKgo=;
 b=WXy8Rk2N/wvOBGBcC8guKRi2ktx6FVGq2WCPAfRDVV7fi44qFViGVm7Q
 P6huDRgnNXGq5IYB+EwEgPxwu2c/kOQugrjbv36nRkkC5Qhj1VP9jUMO2
 M+4boiDF/sqC/idaMxaegQI37n79APog15VmGok5ppKY650VgmHh2Qi1N
 QCFYd6T/bVpT3HTqKy95zQUz6ic+SZvn2Ii0JtJzIzi1FRF9ukUEM/2IW
 GadHxNW7Rr6fk0nKMo6MvfU0qZu3ImKwK6gpO1NHa6SdygVi5xmdBR12q
 upstw6FVoVbLgXifibo5VIu1HoQ1KBBS6HmCXa6Zu+uapCZU9PL7MmZIs A==;
X-CSE-ConnectionGUID: Q9cXS31AQniA0XHdzSLysQ==
X-CSE-MsgGUID: mJUiRD8gQ9mxAF+xHJCtRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="97193101"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="97193101"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:38:48 -0800
X-CSE-ConnectionGUID: p0dUoNOlTwmrTkpJKSgZHg==
X-CSE-MsgGUID: 75hjjNE5SDSsOL5/iynQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="215946055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:38:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:38:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 00:38:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+TClc82lj3s2H2ES9K0vrnjXbLAD2a4wp340KAFLWpb2KRlpxwYkvlKOeRbjSIbfoTY9Tyd98CWZgPAhPQZvN/u/m1tIB5rbtKU2YiUQZdGsUIPFxk7BBH/RB6VcqdPOtlGDDv1ZEJfKhPWEIfWi51o6wfUmvaMduvnU15dJqLDGpB9MqgDtJgmF7U2rMIcjtV1KeZNtbJQgyP3JVQhdi2gNJRVpse1+tNpyoBdIcf4Q9EQ6esGaABqeGSVW//+RHhztFwxuNn4V1lgnPQqRUszGsNgHTKVDBLlrf+662SN0Mz+LiFwrw0ZWkVMi1gHKKEy+2Dv8zqw6QZM6FIe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zewoJQOW0soqZANAbIVYpD3GplUZPTGKgCO6Bt5euPc=;
 b=q1E/F2rl0kqayAUDCwp6m1r5vpIDA/8SU8NVhphy9KfZrvOZJLMGGmnvIj8w3vVk9AOlPcD3vZfd9XFS9H6LxjkbM1S6+KOEH9SCgH/5xzoYwAtfw9TVNRpn5iFQMmuAREtMKBxZPK3/W/ZsSlb0v6ci+nifRJQ/rZqTjDdu2ut6JVrcSKEk7a0qpLWQBuf233a0MUMfaCuRRUPOTt8IRZT2jWzxZe8cQVO7sgjiPn7CEHN/r/kBi6hUyvK9LQUUC6pJ5JkH1Wxkr/mt2GI5zikANzfbQXXOnrVTDUX1xmd7QcSfzowmJMnaITChUg0FdaqSvqY700OrkZSOEeys1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:38:45 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:38:45 +0000
Date: Mon, 9 Feb 2026 08:38:36 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] tools/meson: normalize tool dependencies and
 executable definitions
Message-ID: <kixz3behtmnkqgxtrptr35adah2lftf26o7ayv5bdk75ihf4bt@bx4hobxyccir>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <48b8fd6176a262b4aae80b60cbab39505817925d.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <48b8fd6176a262b4aae80b60cbab39505817925d.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: bb121286-9ce7-4121-e562-08de67b6a313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alBZL3E4WWZKQXY5NmFveUFSeUlFSVBvNS9QcG1NdE9BZU9NRzVMbWtoVWVw?=
 =?utf-8?B?KzZsQ3YwdWVjUXpPZzc4bkIxOTVCYnNQdURSV0hpSkZjS0poWVZFM1BNdzMv?=
 =?utf-8?B?QWt0NzZlNUg2bWtQc0VDSkQzU1VRL0UzN3JiaUovOXROb1JyV2dqR0dOSkU0?=
 =?utf-8?B?WGp1ZUFuQmZJdmMvWEdwUERNZEUvMFdZRXI4a2dnQXc1cDJXK0ZacmEzV01l?=
 =?utf-8?B?VmdaOS9NbEp3MGp2SmkzcHlPRlVtelR4ZktCQkFrVk5Ta1dhVnFDZUpNam5I?=
 =?utf-8?B?c0lUYXRWOVU5akxiWWlxK0xGZ1ljZ2VrUndZd3I4eTJJT09oajFkamo1djhP?=
 =?utf-8?B?VjUwOGZ2ZGxycDZMUjBUczFSL2dSMjF3TVYxRVpNU25jTGRnU1BIaHNGQi9Q?=
 =?utf-8?B?WHBZbVNrcE9nOHdCcU1PZm9SWnIzeG12d3hKQ2ZML29RdzFhMWMzV0tCQ3Aw?=
 =?utf-8?B?bHk2Zm9mRFZZTUJNVlJ4ZUpuQ2JRc1drSVBHSUFtMUxSMW5nVjlZS0dsMUR2?=
 =?utf-8?B?V1lFTmJlSGdKUCtMVGprNTArZHZRMkllWUhRWEVXYnYxZEVjMmdGWGVpNURW?=
 =?utf-8?B?d1Z4UGNkYmNFakFETERRT1VMSStTY0tIOHIrNndyaVIxTkYvWURBVnFvc2hr?=
 =?utf-8?B?cTUvemNiOU1Hc0o3NHZydi81TEh6V3BZS0s3dWRjbXRxeFlEcnNhR0Nwb0Rm?=
 =?utf-8?B?SkxtQWVjckdYd3UxemZrRzZ4STJlbit2Y0FrenVKSHZOK3M1STY2MDZmZHJz?=
 =?utf-8?B?L1prUGtiOURmMDEvaFVRbEFaenljcktOclQwR0R0OHp6OHpRVTVlOWVna1JF?=
 =?utf-8?B?WklPdElxbnRMUERDdWZkZlR0MklscWpmeVRkdkc2U0FydEtyd0lwZ0ROc25U?=
 =?utf-8?B?ckJFREY1SXlzeGtHQkJaM1dOUmh5ZFhnWHRHUTBkOWlmS3prTGo0M0pFdWNh?=
 =?utf-8?B?Qlp2SVAra2xNRExBZ3Z0dVVrQW9CenNJUkRrQXpIVVYvdm5qQVEwUytWcThP?=
 =?utf-8?B?UlAyNDBRMG4rYzJHcVJmUWp4aFlZT0V5cTl6bzc3U2h0cmF5MzBRQ0hPZzhE?=
 =?utf-8?B?WittOE93ajZtQ0VTWS8xTmY0V1RBQmlZWGM4RExzMnhoclZNWEtDd2l4cXhV?=
 =?utf-8?B?NFNBZ3E3S0VBNkx3akVWYjRHTTd3VGFvN1E0ZkpEbVJvOUx0TFJlTlBDTmcw?=
 =?utf-8?B?TXRIQ0hqV2hoQ3E5QnFwZ0M4cExOSFZQdzRmbWU2YTNTZVJ0TlFIUEVNMTFR?=
 =?utf-8?B?MmdYY2JsQ0tVWkNIODVpSHRicUs5cjN4eVc5ay9NMXZ6NmNtSUt4VkZSZ0pv?=
 =?utf-8?B?WmJ3aWxOOWxId0tQdHMwYXZ3MnYwamYzT1VKVy9vSE1WZDBQb1BTWmxQbHBY?=
 =?utf-8?B?VGdxUGNZdnpNMGdob2Y4OEZ6VGF1SWFaS1YwcXJlNjV6dmlkay8zdS94K0R3?=
 =?utf-8?B?emtEWFBhNWk3UnNwNzUxUDRLZEtnZEpKWnJ0U1p1TlVjclRuMVVBQWJWekor?=
 =?utf-8?B?SWdnZEJyc2dEUnFIV3UxbFpMNnFzNFFQNVFoaFB6S3VodGNuQ2dmTnZMV0Y3?=
 =?utf-8?B?dXFyT1luS2hGSVIvS0lkc1FXRTNvanhNUFJlNVB2ekNuZG5RUm9BVk1pcXJq?=
 =?utf-8?B?akJzWnF0ZEhqbG1qdUk4aXpTd1RZVTdXcVc5RFAxaFNKMVdOQmNqNzd1Qitv?=
 =?utf-8?B?RDBaeGVCd0RUajJTRzZGRjZEWTB0TnM0MFQ5aHAvSkZmbDVCUmxUZnM5WElL?=
 =?utf-8?B?dE1yNCtmdDI2WXozaE85U0pYaURPNmpwbXJjTUJwTzQvK3UyQ2U3WUFiTEpE?=
 =?utf-8?B?MURtUTJHTVE0VGdLNVZwVjBOU1BIY1N1YXVLbW1YUFZSY0M1UU02RXR6ZzI5?=
 =?utf-8?B?Qkx5bFRrY3ArVnNFMGZuSnB1WjdoWDN1dGEwTGNCVVd0a0tQdFcrMWQrbkJB?=
 =?utf-8?B?cEw1bE4xMFZBVXplQ0wvOWZnTjltdkhzSXE1bW9KaE1mbVVEd2Z3aVRScGlu?=
 =?utf-8?B?ZVU5bEJhbmR2Y2k3Sk1qTXlIM2xiWHVlSnN4K095RXd2aEY2Qys3a09DZ0ZM?=
 =?utf-8?B?YkprckVHTGFnbkxhVE45dkNJZzdzNVVkNjhSMnZXY3VxQnB4dFBPVkdiTXNM?=
 =?utf-8?Q?vpxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnJSVUNOTVY3M1diZ3psNUJIWHhzbURnSjJPN1ZxT251ZVgwcURpQURHeThO?=
 =?utf-8?B?U2Jxd2NzcE5HeGxLdEJrbm9tT25DUWs0STVsU2tSdDRXcTFLRGlRMjN2Z2V0?=
 =?utf-8?B?ZzRvY2RCMFlkTE53UERjeC93WllZdWlmaWhDOFZ6N1JkMkRpUElLQzRuSlRO?=
 =?utf-8?B?cmNrbXpDNXQ5S0hScTgvd2JRekpyUEdSMG1Ga0drb3EyVXdoQXhxckdDZEhq?=
 =?utf-8?B?UzErSWpYWkVnRjhNNFp6V2c5bzlXR3h1b2JoK2xKQ0ZoMEt5d1llS2dKSDhs?=
 =?utf-8?B?VGtCVHZXT0h5UmFFTkZyb3JnZ2dEN2pTa1Z6cTJHTmFnbzFlVEh5Zk9nNU5J?=
 =?utf-8?B?NStZelpZOWhPKzhBc05CeEM0czYxNzdrSTF2V20wYnFNN1pGaFMxYkkvYTJQ?=
 =?utf-8?B?a3VNZEVDTlJYSS9mQ1NlbzFHRVdJYTRVYVVyazhNMUFPczgrb1N0dC8wWVlu?=
 =?utf-8?B?OGM3Sm9FOFUzQ00yY3pSRGN6OHVpaHJyWGRYMTZZRlRjdG9wcnc4dHhKOFpB?=
 =?utf-8?B?emw5T3h5am9jOEFBS1JBNjdBQzZLeWNPVUNCa1hqYUw2MmMyWjQwREpZTmdW?=
 =?utf-8?B?dUUwS3NtUnREZmNsVXZELzRiTlJhQTVBbngzTFl4dG1tQlVqOEdEWWZWd280?=
 =?utf-8?B?V056NlZuRzdEcXRheGErci94WjFWZkpyYUpIOG05SDU5WXRJcVRLTVhGcWtD?=
 =?utf-8?B?NUFnWjkwMmFxUjdMSGpsdWpMdlk1VnNOY2dFZDY3Tm9HdktXMFdjMTFqaUJi?=
 =?utf-8?B?akMva21lRW13S3JoNE8zY2NmcytXYnEvMEFTeXZUY3lFZ3k1VUNRNDlweE96?=
 =?utf-8?B?QklXUUl3d1RpeTdhU2pLa20ySk5DQ0VxcG1xMzVwZ3E4Nk9IcndtbVNlMXhj?=
 =?utf-8?B?TGo3WitKS0JQdHdCZDlZeVhvbXJaNHNrM1E2Z0puMWp0c3NCdGlLSmFsaVlG?=
 =?utf-8?B?cVp1OE15WWFhVVo2Y0tWZmVodm82K3NSdysvdVVGZ2p4bE02SGVEZ1BHbm1W?=
 =?utf-8?B?WjBOTldIYlZLcFF5MTg0cG9oYktnRjlQZHZZMTJvYWRwU2dGWllWNU1jZ2dx?=
 =?utf-8?B?MkdSWVlwcDhhY1grRUg2ejVuZkVjSDFTR0FOU21scHZDaXpRTVFiSTB1WW9K?=
 =?utf-8?B?MzhFTFpKSVp3U2hCRmJCL25jTEczM2I4L0l0NE1YK1dmeG9CM0hjUEFmSnpM?=
 =?utf-8?B?VEZsSTdVdkVjN3N6MkhycFpXb05CRStSa0RHOFhmUGw0MjRQN29iQkZLTGNN?=
 =?utf-8?B?ZTRLb2FQbmF3WTlRZUJQTy9USU5Rc1UxMG1uTWZkTlUzU3g1dXZ5SGR0RFhj?=
 =?utf-8?B?WFJzR0kvNDlqUTNkZ1JiN3V4QitkdC8xOWx6akdSbEc4RG5vbzBxUEJJN1lQ?=
 =?utf-8?B?SXRNUEJzRDNXOW0zQ1VzU0JwRHRmUlRWeWdoYy9lRmR6V1ZCQ3VTUm55Z3Ns?=
 =?utf-8?B?MElEL01mVldXdHdxdjhLRmdQQTV6UFovTTY2VmlPL2pnVE02a3NPRzRXZ2hQ?=
 =?utf-8?B?YU50Tm56Tkl2azI1K1ViR0ZhdVlWbHE1U2E2V3RIdWtORjd2RDlydDgyZkVX?=
 =?utf-8?B?Z2RVT0JJNllkZkttTlArQ1ZCbEptTXhjRWU4Z3c0L0tUaGk4a3M3azZpdXB4?=
 =?utf-8?B?dlJXTnZXN0dJZktWNHN1aGVUU2thMm41RVJvS3JpTkRjYTVicjE5ZXVRY3hy?=
 =?utf-8?B?QWd0a3E3U1QvRm1ZRkdWOU90Qmw2aXl1V290RE9KQlNkdTRIQzN1UUNyUENW?=
 =?utf-8?B?OHpWWG54TjdvV3FwVkNqUXVDbVRwak9hTzJ3STAxTWNveWFxMFh5L0orUEZt?=
 =?utf-8?B?MWpROTA4YkpMNWlFZjJvV1p1bHFjTkVMbE1ReGhTWXhxTno2Z09JOS9YbUJn?=
 =?utf-8?B?d1RMSklTK3ZVaE01T2RVVTJ3bVlzeWlMODh6ekdVOGE4blZpTkxrNEVTMFFT?=
 =?utf-8?B?cGh0ZTlSZ2ZzKy9DTmVvSHltK0xnTG9GdUNnQkY1UGVUaE5pYzVSaE5iVVN1?=
 =?utf-8?B?T3luQVVDU2VOQ211WUx1QzNlLzJtU3JGZEx5c1A2dkZZaGc5U3doN0JOQStp?=
 =?utf-8?B?blpXWEorNlZSVHVQTUJJbEgweTd4U2VCYlZNRWZ3Qmd3R3J0VXhsdFdlVVlR?=
 =?utf-8?B?SUhpQk5CVWlMT05JZUJGY0hkY1NwS0RBNXkrMGlDRnZyRWk4Y3NOWUtJZEw3?=
 =?utf-8?B?S2tjdWQ0V3RobVlHTTU1RnIwRzl3bzNONGZtam1nQjBlRUdCeHBKTUxadFBM?=
 =?utf-8?B?VGdoaW9XZklsRVk0RVd0MGRqRVpIMHY5eVBqZjR2MEY0ZVVGL0VhQVpSNjNr?=
 =?utf-8?B?R3dWVTRxUm5SdUJKQzBNTE00RjlDbHM5dTBienFWUU1ZbWM5M3pFZ3d3TWRS?=
 =?utf-8?Q?mK/XvVHVDAT7nkJI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb121286-9ce7-4121-e562-08de67b6a313
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:38:45.2475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5lo8tobbdtDChfG/JEl/VMuFSRsV0EzOkGlqeP841scaLNfdJ93OaOxDcCPCrW8X6RfuV2a02CGE34H2Jnfqu0iYzmCJT+KiKUZ/is+clE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

Hi Sebastian,

> Refactor tools/meson.build to consistently use a common tool_deps
> (lib_igt, libdrm) base and layer per-tool dependencies explicitly.
> 
> Fold previously standalone tool definitions (e.g. gputop,
> intel_gpu_top, amd_hdmi_compliance) into tools_progs and unify
> executable() creation.
> 
> This is a build-system cleanup only; no functional changes.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
