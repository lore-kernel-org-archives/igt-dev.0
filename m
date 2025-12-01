Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EFD111A8
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 06:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6329110E2F2;
	Mon,  1 Dec 2025 06:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkDcnP0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 06:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570995; x=1796106995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JTQvhoWEBPFAXqSlq7uFC2woVii/1qsKBvVaWA+mLGw=;
 b=fkDcnP0oPX3iTCk6IQ0ljLqUi1PObuiNUgWGHRpVB8wiD5cSu0+E3s/7
 K3IUVmQ1zNVThDBSMKQfWgK/4q3PgfGaiRX5EpL1TZY3Bwzs8QIdAE8sG
 KKvpkr68Z/WF4JrXJONTw+JVKw4uo9WxzoF7oiRURAtZ+n/veywgTWXT+
 10lDxFEP3wb8JQyK8JWVSg2xZD30weS1qHVi25pDhL190CynRSRXPC6MI
 wlzwLSFOQbDywt4XRSChDn9cAsQ9r1tHmbHUrjr+CegA0w8Ljg7DAG9sj
 fJIp2VLhcPBqpDUxfBf4RGvFjEn/A9flGWQgRt7S+sI4XxvWtvSL98lKd w==;
X-CSE-ConnectionGUID: xCXkX6WFQ+mda0LGJ8DVhA==
X-CSE-MsgGUID: 5xAZ9TMFQyW6VN58Gk0uag==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65506142"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="65506142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:36:25 -0800
X-CSE-ConnectionGUID: gdSP5BhDRlS/rPda0hN4Nw==
X-CSE-MsgGUID: ZIc/P5aNRBeCfMKngqfTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="217347602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:36:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:36:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 22:36:23 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:36:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDVQTzV38Szldsjw1itc84oB+gZRHxxk4QV8a9eSOVh7Lj+asA7RrDdGlgtepihIfp/mYPoKDTuE13/+5u6ooJcbOB0p4xF50KIJ83h6C924CveccP2uJiVC+If2voRAuGi91UWN5OP3k+TvRiKQjL9KCNtpSKM3hWksYPAeujGvWsyBqUfuwETiOuT+At0lj/ebLQg/msD6OqjVV9E/n2a2kFGlGB8RAv+k0rP3XaQDcw331q3v0O6RkSrDh+0l/vicnLkW/wm4DyAYHhWooLC/29ldXmVJ7khFkQ29UgL1ox0flo7f2gLeP5Xebp5K/W8Quq0wRpbh51O/ew0VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/FQVwfUNBe+9yTnp12cAnyKPN+XAKsKefBhjCsPkNw=;
 b=Yy0J5arLZN4G+5riw5+VKe70vNVHs+XQWQsnTL2VfFeua65c1qD0aZjFqoyRlfwUget+8NW+yV6TaVOYKlzH5twz8WB4DGLbKJPCWZM4qK1q1vg1sac34eHu3UTp/ytfdXN2ZJ/jC0qiDNQ30jqmcBCR3v8XcT9QLQSvYbBNpdmfl59ggYzuG8nm0rMCb97PMYVSa/kw0e7opMX77HpL8xVNvyQDCoYoA6nxWL3PdZX4P98DgNV9og6z0XPWS7y0m84xKm31I2EIhX3UTeZf8jydeYHwQDe4uc6DsrWd4f5ZcCgKqKG0aUL6tEL9ZSB+r5REb2aHbb1gC0SzDN/enw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:36:22 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:36:21 +0000
Date: Mon, 1 Dec 2025 06:36:11 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Simon Fairweather
 <simon.n.fairweather@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v4] tools/intel_gpu_top: Add iteration option -n
Message-ID: <hh6rtxzjpxtibo56cepriq7ufvj3d7jwe2efcrof6r5cmblqi2@lco6s6ovy3ei>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251128172326.92483-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251128172326.92483-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e549d0-c88b-497d-ec77-08de30a3f104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVdRcmxlQ1JBQzIvVnN6M3pydTE5Zm5CNWVpK0lBaFQxZ1BHMEs3N3JGMVBT?=
 =?utf-8?B?bU9rc2NTM25FTGNiS29keHlTSHI5dHRWLytmbFV4QW1IV0hNZ0EzNlduOFh2?=
 =?utf-8?B?TzRRZ2ZkWWUrUDJpNGJSMW1ZejVCVnRoTGdkYWluWHZjc2xBdTN3a3JVNHVL?=
 =?utf-8?B?WEVwWEgybGxOY2hHVXovM1ZHMlduRHVDY3E1NGNMVWlHK1JMTCt5bVdIMGFh?=
 =?utf-8?B?VEhFYk9oeGJOUnVYZTZjQ0RQMmQxQ1dJSmpjT0x1ZlRYOWlRa0FGSjJ5aVVF?=
 =?utf-8?B?WWNGdmxENXpFNFF0NzVVbFZBcWQ3RjFWb0NjMTBwT0FDQnJEK3o0eTZXK1NJ?=
 =?utf-8?B?cFVNSXBjSnJKbm5SeE1qajBJTGEyNlJ6Mmo2dC8zZzBYSjV6RjJGZGtvZ2lO?=
 =?utf-8?B?blpKeFZGMFNhZURZQ21hdXVWcjJhb0NKbjJQc0NCTEtEOHJQNm41aUk2MjJN?=
 =?utf-8?B?NlJSRFhqZGRiN0dQY2hUM1VxRzF6bE5tdzYxQ1FuT0pnOFgyeHQyM1h0RnFj?=
 =?utf-8?B?aUltcTE0NzAwaVFyWE1ZVFJxcldENUNCM1RWOGYwektpNG01Zk8xYTY0OE1B?=
 =?utf-8?B?SDVrMUt1V3IzQUlyYi9NTWhGM09PWWllbmF2SDlGSmJhYWV0R0xSZCt0WmIy?=
 =?utf-8?B?SWxhd2Vjbnc4aTBqK20rODUvME4wTnZXSm9lYWF3TlVpSVlhbFY1ZjI2Q1lw?=
 =?utf-8?B?bnEva2c2ekllUWd2aWgrZ1FPUVlBWS9YeXl4RHBWbW52V2VpZ3NocFo4WDZp?=
 =?utf-8?B?bkNaUUlCM3F5WXd3anQrcGhLbjdieWNQRTV1eG82Ry9aZC9mZUd3SkJnZU1P?=
 =?utf-8?B?V1RtQVdqRnhGbFhYUC9FcWtlSjJXOTQralhibHA0eFhMMHZSMnZpb3M5a3Mr?=
 =?utf-8?B?dXhIUUl0UUJrd1cvMklBRUczOGtrWW9uL24wUXVLaVpCMU5ab3FaTFpwcEdG?=
 =?utf-8?B?UVdqd2cydnlIeDNMM3BlOHVjaGUwOHorbmFUT3MyVytyU1pSc2J0enBpNWJl?=
 =?utf-8?B?aFJEZVkwUi92Q1B1Y0xmUWcvcndWdytTejNHanVQaHBLMHd4OEs4cENNZzRP?=
 =?utf-8?B?TkV5SlBwYW9rUEVIOXJ4bWxvRm95azZwOGs3c0lsMmJQdmd6azluZnpTbk9Z?=
 =?utf-8?B?M3kyTXF2NDRCaDZtMGlPQ2xkUFBMelZIeWcxTGRUTVBwT1NGU1hMSnI2MmRX?=
 =?utf-8?B?dVE0anFGVWJzRWlFeVhKdzBZODh1TkZNWDg1K0U5K2hnQlk5dWZFK1JRQzJs?=
 =?utf-8?B?M2daTngzS0JPWHJtZWVCWndvcTRjZXJ2RDhaUW9sUWJ5VUVYOVNEZUVad25n?=
 =?utf-8?B?VHVTRDJORCtKQ0FQdnh0UHR5bkIrMFgyQmlWRzR2cDIzbVRxclB6WjhUeEMv?=
 =?utf-8?B?all6ZXJadTBoMXBoQzRYK0l6RGF6V3VUcWQrdlJJNElocElJd1J5bkF3QWQz?=
 =?utf-8?B?QndZMUtsUVgzaVcxTFlLNGs1YkVHcFhQTkppMjY5cjRNZUZLTkhQMUp3K3pD?=
 =?utf-8?B?eDBDOCt4WGh4ZkJkSGlJbWlrNWUzZDlIamdyTFM0blZpYVIzdW5FU0tsL1ha?=
 =?utf-8?B?UGkzQjZ3SnliYmNuVDF3cFArUHFRZ1FoT0x5NVByZEJRc0gwaENHVWpNejRF?=
 =?utf-8?B?b2daY1JHSC9lUHJIYStuV2JwR2dIQ0N5VVhRb0F6dlZaUkQzT1oyRVIwYmxX?=
 =?utf-8?B?eDU3V085VFEySVN3djRvZ296cXBVNDFTUHdCa0I0Y2JWZ3BHL2tydmVEdXRx?=
 =?utf-8?B?Z3g1aG8wS3czZkcvaXU5Vks3S1QyczNKYUVVOEdzYUI3dVR0dTdSUC9SSml4?=
 =?utf-8?B?VWlMeWpYRW40dC9icUxoMFFOR3N5Yk5SMFIyT243dm1MWHFtQnIzUFB1bTFh?=
 =?utf-8?B?TE55R0FDeGNobExTNHhSY1cweXBiak5iZHJPNTgyWmxSNEpMZnU1b1RTZUdW?=
 =?utf-8?Q?9aRoE1KhHLOEnbU8OwDWTq36RmjMRVry?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJ5YnNWbkJKM3FmZmFVTEFaQU5ybU9jSmFZM3U3SEp3dnVZV0JTb2pibGlk?=
 =?utf-8?B?NjFXSGFMUkRoY1ZpOVpGT3o4R2tza0VDOUwrQ0w5UzRYaVFBb2pxeU9mWThh?=
 =?utf-8?B?UE5WL0poaXBHUjhhN0RMdGVGT2RmMjRGM05BRHEwRndVLzYyMEtnTEJtYStv?=
 =?utf-8?B?YzNaNjNROUUwRmRQSVlSZmxKanhHUXFDZ1Rka2xvTngyUzA4Nm15SUNqZVha?=
 =?utf-8?B?M0haQy9Ca2IwaGdVenIrbmxCaVJMT2svMU9NTEFTaU5mTjd2M2thNDFzQ0or?=
 =?utf-8?B?SGlCZzI3cTJZZk5jSTgxZnFVMkE0NDZsd2NHWi9mTG91SjBJb3FDcnlIZTRm?=
 =?utf-8?B?RVNzN0tUWVlydDUzZVJYd2lOOGR3N09OS2ZjaktHSEMwdG1LTURZL3NjcGF6?=
 =?utf-8?B?ZENhcDFHa3pGaS9qTUJpdnRMdVorWkRTMFdzMUxMN0RvcWNNK1JZUThDK010?=
 =?utf-8?B?Q05RbU5qTjA2dVdBSWZMMWRoNGxCSmlpSnphRW1sNkNDQ0RhVktjV3NIWldq?=
 =?utf-8?B?a0VaSUhxdThjTmJsVWpRQTZMeU9JZEkwZVhLWDdMNVNERU90V2ZaOG9aR3FR?=
 =?utf-8?B?WFBXNkN4bGR5K1lRZGlZV1dyT0dtL1NQZk5YWG1hbHlFRHdDd01KZHhuY1cx?=
 =?utf-8?B?anNpcDZNVS9pc0U3QkNrT1dkU3B6SFlSVDF5UHJmL2RyRG1vbG45Rm9JbVFE?=
 =?utf-8?B?SmN5U3RrYWg1QTBtcWpBVnVkbzlYUXdxbDR1UHE4UmY4eEhnSkVES0cwdW15?=
 =?utf-8?B?N3FwRHIvNzdOakx2WVhUVTdIdkROWlJJVTBHYVdvbFIyaVpqWVI0a0FwSUJL?=
 =?utf-8?B?L3F1eW5xeHR1M1EzOWxhZVE4QWpqTDFHN2QxWEpYYkRlT1U0OVVBa1cybW0y?=
 =?utf-8?B?eUFJSHExMzdQKzRZc2RhRWpQOUVWU1c5enZ6dVlwQ2UrL3VXSWlnNFFURmk5?=
 =?utf-8?B?WTZ6bUpqZ0d3ejhWemU4aHcxQnArMlhIUENDOS9yZ252dFJ2Mk1CcWdnbXIr?=
 =?utf-8?B?aXBrQVp6SnlnWktXVTU0RENPUzRyVGtLNFIwMEoyMmw2WTMyMFZ3aUkxVlpY?=
 =?utf-8?B?VkdQem96YllLV1BqTGV2QlFjUXhQWVpYaWxDTGFqWi9SNlFyL2JJSVhVMHVC?=
 =?utf-8?B?NVREY0F6YnpaakczRmFocTdBOWY3VEhlSEtHMFBhMGhYMEJ4ZlJwMkcwaEVP?=
 =?utf-8?B?NmMyQ0hzcmZ4L2g3ci9LZnYrUnBHWGhISGs1dzFrL1kzK2ZUZVl4aVdrekh4?=
 =?utf-8?B?TGNZeXp3eno5N0hwVEp3QU1hZ2dxUXlmOERkSUNZN3VqcFVmRTJhamNIbFFB?=
 =?utf-8?B?L3NSdFNTREJWSjJHMCtsOGljekdDYTcvdVhpUUVwbDNpYmhZNnpKT3VINVdY?=
 =?utf-8?B?dGdHb1hSUXlZNDRwdmRveDA3c2lhR2lQZkFRVFlZbmw1b0lyb0krYzA2WlRV?=
 =?utf-8?B?azJtdEE3dExIK3JIbjlvQmlRRVRmU0g2ZndMckNZVnllL0k2cnRUK1M5K3dG?=
 =?utf-8?B?b2lORExPU3dWb3o5UVpFSEpHWXRJckE3b01SSVhXWk5FNlFJWUFzU3F0alVQ?=
 =?utf-8?B?S01vRE91S05vUlJ5R0l2eGg3Uk5JVklsZUIrR2RqODlkZndyWWlXVFhYcm0w?=
 =?utf-8?B?bnRqUGV2MllvTWxDb0t1WTdnVnZId2FQeDNsVkgrSlFhTHlnTllQTDlKSkxY?=
 =?utf-8?B?K3JvMDY4Q1BnWVBsU2J1RDhabkFJS2NRbmpzZ2U5UHprNEpvYldWeEFGTmMv?=
 =?utf-8?B?cGp6c2o0VnZqMC9hbENWLzNTUVhCSE8rL1BxTDJ4Nlk2WTM1QWJabjBiTklJ?=
 =?utf-8?B?TWREMkR4RDdzN1M5Y095THNoaE9OMDhjVWdwbnlVSHI0eGVLMityR25sODV2?=
 =?utf-8?B?N21pbWM2MmNGZUcyWnp6TUtmSEFmWDZWOHVZanIzQmVjd1FFS2dLYmFHS2p2?=
 =?utf-8?B?cEFFVlVJMHNweUtrYUQwTlZoSFVVejB3eTN6bENuS1h1L1FzSU1uTyswWFR3?=
 =?utf-8?B?ZSt3eFc2M05IME1DMU1ib01mNnB0S08xTENrbkdvZHNGejhXS2Rwa0pUU3ZI?=
 =?utf-8?B?WkorQ2htazJSL3lIK0NRcllzMGJLYVdyMk5QZ01YMWdoNWFqendkcXcwNlVm?=
 =?utf-8?B?SE5qYnBkcUVITy9ObnJLV3V3cnJxclZzUFRCTzIrc2dNV0hhaGZmSXZ0VDU3?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e549d0-c88b-497d-ec77-08de30a3f104
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:36:21.5833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NM2CmydPhBpBmtGUYugKWhk9jvksaKAMFMUtO42V0DX8sZrmEQUf+MJJnF45wImac37IMj3DZ2xu8zSx08KZjNSxt/JczGUYPU8GwTsYjbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
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

Hi Kamil,

On 2025-11-28 at 18:23:26 +0100, Kamil Konieczny wrote:
> From: Simon Fairweather <simon.n.fairweather@gmail.com>
> 
> When using option -c, -J or -l default is looping forever until
> user break process. Lets introduce new option -n <number> and
> break printing after reaching given number of iterations. Also
> while at it, update copyright year in man page.
> 
> v2: corrected whitespaces, extended description (Kamil)
> v3: reduced number of vars and changed printed help (Krzysztof)
>   added description to man page (Tvrtko)
> v4: improved help (Krzysztof), changed var to long, update
>   copyright year, added also -l option in description, added
>   closes tag (Kamil)
> 
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/173
> Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
