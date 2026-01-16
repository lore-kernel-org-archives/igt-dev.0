Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F77DD4A604
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 07:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A5110E068;
	Fri, 16 Jan 2026 07:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kruxb9Eg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57D10E068
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 07:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768547058; x=1800083058;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=84FC6j5O55Mh8hmdQ9WJdBwvqA6M0nsShtiFc5lICO8=;
 b=kruxb9EgLQr1eeANpfxvVVpKUYpJW4yR708D/KLUn6TDpPdUvU39ej2c
 wtnqG6k70ynXySeoKVaM2pCJ6TU2Yz2ScntFazk/eAxfa739nzgwZP8wC
 UFgag6cPHSLl8uN7IlkoDn3s7epTUL4XZxhAo14Xoj3iVsaOjIicbciA8
 HmFwtf/Fm8xOOG7NuZ0bATU17Iym782U1izFwsZdcr+DZy5l2CrHoqq8a
 f0+GH507S2mJx50+xwsljcT3ujXOBlzqa0+tGPhfgixfeDyWihKUxky64
 uTeLIvhq8j7uaGYN7dKdRrEIPdJus3R1wq00H3kFBAZxNLZ3ggV7nB4As g==;
X-CSE-ConnectionGUID: 7Z3c9f5YTwStE2E3rS/5nQ==
X-CSE-MsgGUID: OWBIn8JIR+mb7gQaTUXBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80974240"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80974240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:04:17 -0800
X-CSE-ConnectionGUID: d2dIw7XOS/S7FB/R7vmxDw==
X-CSE-MsgGUID: XmY+s+tsQO2SBe3+YZrEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="242712306"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 23:04:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:04:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 23:04:15 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 23:04:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJirNXiBEEATR3Yp1hv0gp0J85qN+Z37qdoFTf5IDcisqxlZwm35BqYk6zBYecmWg2pMXXjj352TyGNoKz4N/cL+HP6qQHaVmRnRAVL6VQ4d8UWXWUv035AbfN3V7bFh6yP4ZmLrSilLLRRkP5UaVfobAtMSEnH19XFROqY9rPR6qKnOgGGHYmvrNGD1u4R3npMJzLTEDpzKR9tuCfcDKohGekaLYxi4gCla6Zku7H0e0hvgoT/dl3BKoPj2qD3YtZVrPnHmcYnvmtWESwGVvLdvQ+ALpxjW/nF+tu3e8rqTnkswvzdRivnZYDuyqxIALTimwbiwN/c6Q0upMf72kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DMPom5KAU2HlcRn2WeTIGCJFCwOLANryNCThW9Q/4Q=;
 b=XA3sfFrTDOJyfK6B0Nwf+UHIP0zxkw9ecVBp6iEZAxrkuuFXGTaXfqHri0MnlC7YAo4Vqobc8fs6tDp2kCWlot0UwXHqzxwCvd7ngqDJVGSy/2Mqln2fGeY2fFGS0pWwAz+xW7bDHFTW4//kR7ZJJcB/Vpplh8jvfvJyQp1BhSUZb7rOCSqubanCCmLM7FJnwM0ixdkv1TBl7BPR7tpQ1CzVfOKKmtDy7Bir3dO8vKkZR/Hh+RIqVPqHPDb0aPcpdk5el/9ucod7wum2hSNu/LXxPrQ7GVeCKncNFr/yQ+BrtTxZyXnwHnRg+aufjTN6V3kHcZQ0X+bv5OPC39CcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 07:04:13 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:04:12 +0000
Date: Fri, 16 Jan 2026 12:34:06 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lur?=
 =?utf-8?Q?e?= for tests/intel/xe_exec_basic: Enable dynamic subtest (rev4)
Message-ID: <aWni5mnwSL6Djq87@bvivekan-mob1>
References: <20260114065732.377106-2-balasubramani.vivekanandan@intel.com>
 <176840456240.153896.10218760365744912251@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176840456240.153896.10218760365744912251@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba581ba-7800-4970-00d0-08de54cd73de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk5IbE40TnpkbGJNVmtKN2xnR01MUnVHZ0ozMy9tSTJIR0RST3FUVkJwbFN5?=
 =?utf-8?B?bXZpK0svTWNUNUd5aE1Lb3g0Vkl2SGVTcm16TlhmS1hFYjFYdXQwQXd4VUFZ?=
 =?utf-8?B?NnlKRTVkcmVWRk5IRVA4Z1NFcm9QUHFGSDFhMlNIYWhIZGJ3TGJSMXU3VGNp?=
 =?utf-8?B?NDA1MlRzQ0xncldnaElVcjZJbUtpd2liYTQxZmprZHRGTC82dE44SFQ5YnlJ?=
 =?utf-8?B?ZWhyQmdYMWdMbEM0N2VZT2N2cnQ1Z3EvZW9udlJnOWltNFFVTmcxUlYzUFU1?=
 =?utf-8?B?cSsyejJjR3BERUMvL1g2bUhRcERwNXRjMUl6aDhaODNUdFAzL0o0c2ZwL21F?=
 =?utf-8?B?VG52MGZZSXlSMFJjZ0s1dVZkellveG1BeVViNEVmUFNaRGxHTloyc05xL1Av?=
 =?utf-8?B?bTJoNkdSczZ2U3BhOFdLRjVpcHFxbGJ2eW1IbmxnU3Q5L2hEQVdyTmF0bldn?=
 =?utf-8?B?L1NuemhCbUpLdW9WTldSZ0tQejRyUW0wdzg1WmcwTVhHWWpzdDdJWEg0eXRi?=
 =?utf-8?B?bittVk5xY1RRWHlCYjdSM3FheERqM09ocDdpdG45dC9PYXQvOVRuR3ZNdW9W?=
 =?utf-8?B?OU5xYnBlY2c5QmRuNXRCb0t3TmpKQnhPZDR3cm9qQmtYYitiWnpwREpqbTcv?=
 =?utf-8?B?aWVQZ05TVFNkczdCNG1JdjZidmMrajZ5MFZaRDJqaFpGWGlsSm41amkzcm1B?=
 =?utf-8?B?ODVvY0o5WElyNk9kNHkxTFZCUzhGMFRPeWlHQWRlVERSZUI5ZDV1ZU13cjlM?=
 =?utf-8?B?bTd5S1ZmRXViamtuL3paN2kycXJ3SUs0QzZRazNsKzR2akgwL1ZONnp2L2lt?=
 =?utf-8?B?eFYrU3VsQjYzekJxVkFVTUJtV3pIWUQ1VVczRWNLdlNQRVdNL2dSQmVVeGxy?=
 =?utf-8?B?bDB4RmxhTmI4VWNFUUFEOVl3T25IU0RuM3NhN0ZNZUpqN3dzTTkzbWY2WVJ2?=
 =?utf-8?B?VG1BOUNlK2pFSWpvN0ZHby9kUzBIVU93RWNUcG5NSUxHVFVYa0tFNGJkd2VV?=
 =?utf-8?B?ZDlJcHJFZkxXREd4ZkkwdkJKZXI5RTNHWVB3ZFdMeUJGay83dWNrR3QwSUZq?=
 =?utf-8?B?Qm9XVGhUNUpTSUtUbEJEakhKZzZpUitFYXVZcGZiMVVyR1N2bVZSVkRNd3Jv?=
 =?utf-8?B?eENuQ1hIODAydHJvRUhsT0NoaEF4WnAwVlhlRktSaWRoL09XYVloUHhnbzdR?=
 =?utf-8?B?YktqQkJuT3hieE1UaVgvOUl0cHg3a2J3WnpSaWQvWUtwamVoM3NJSWtkWWpW?=
 =?utf-8?B?Y2Vud0x6S1NaU1lsblBld2lvVXUyVHdabDJ2M1JKempsRkdyMG14MDdObVNZ?=
 =?utf-8?B?NDhJWUpXVzY4MktZbENJOUMrbDdXci9LRHNOdzZnZTJ2WFAvcU03a0Fxd2hj?=
 =?utf-8?B?VHJUNXIwbldEcjhIcEl6QXgrWVVuS2ljZ041ZUphaVZlWXBNUWJnczFVbEd4?=
 =?utf-8?B?Yng5cVc5T0FEZFhleTZKSnhMamgrcW50UitveUYyMkxRTVBxK1BoRkYxZmp6?=
 =?utf-8?B?TWpKYmJ1dUpwcUxsbFFYVWtVNFlPT2cvN1daOFdGSjMxMUFiVU5BZXhBKzEy?=
 =?utf-8?B?VU04b1VTK09UZEIyWUc5K0oxd3kxak92cWIrNVIzWjBPbkFLRFJLNE13eXFq?=
 =?utf-8?B?VGhBRUk3RGJhaEZib0grSUp4VVF6QkpCYWVNZUxNM0F0OVVIWUhvUitmOC9v?=
 =?utf-8?B?SFJ3bjNrT0ptdEFxbmNxcDVNYlFiRVhwRk5VRzFqQlF2NmdKZ1U4V3ZEOVVh?=
 =?utf-8?B?bHljWE1uZlkyTHNCTjRZQWgrWHBHSDQ2TENyN0FKZ1F4czh2VnVFRTd4bytL?=
 =?utf-8?B?TmsvYUhDM29xTXVPM2JWWGZsODV2cUQ2S2taRVJCdkpybVE3MmpRTlVWcENm?=
 =?utf-8?B?R0psTytNaytMZEUzY3V6R0FMVlUwZ0UwUm1JNVE5Szk0bkNwT296M2V0cTJW?=
 =?utf-8?B?UzBEalB2MnA5VDFVS2tpeUtaKy9ZQk95dFJKRmxCaTBubGxhOWpZbmp5K2pu?=
 =?utf-8?B?cWtoUmpOeTRKc2lVMHdqdDVHcFYwdFNHcUFHUGdUL1kxL0ZQTFgyUFhKblVv?=
 =?utf-8?Q?xq/1+d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1FNzFTb0dHSzBCWmpJbk5PUmIyaVpRdE9Hd1cvRDB5clZrb2dqSFRZeUMy?=
 =?utf-8?B?T2h1V1JPVlhxTi84QUsxREJaMTFRNVV0ZTBzL2xhbmJmeVJ0WmNzeFJ4b25z?=
 =?utf-8?B?L0Vwai9OT25SSXJCY3krZ1BFWUhLUVpoWGxMRk1HRmlBbitCQW9laW5PYVpR?=
 =?utf-8?B?SFZkY0I0TWFsZm4zTjlQNkViQXY0djIvLy9TNkZyTUUrZE5NWUI5RExTUGdr?=
 =?utf-8?B?NjgwQytyeC9XUkFhTnJPTGdwMHFvNDNXQnMzOCtmZVd2QXk3cHdTUGw1Y2E0?=
 =?utf-8?B?NUFjQ01pRXZaZkRjTnczMmcvN1FTSmw3aTlNNTBjTUkvK051RlJDWmVtOG9l?=
 =?utf-8?B?aWliNFowbEN6OXc4bVpVM3dWZXAwZkdFc29HcmR5WGRkc2NKOGcwZng0OXF5?=
 =?utf-8?B?Q3lHdnhMcGVIai9SaDgvU3ZoNldsMGhKY0diN1ZVcVZDSGVNUmNSbndORktL?=
 =?utf-8?B?c29saUZoQVIzSGF2UWJqaUY5VFRaUFBmMk1Ud0ZsbHo4Qjc0WTJ5TkNGVTZO?=
 =?utf-8?B?Y3dGdnRmNWxLS1RXeE9uNVk0N1BRSTJOTUtQcDY4Nmd6bmsydVlZcUY4QmIr?=
 =?utf-8?B?OHFOOXZ2eUlBZDZJaDJrSVlKTFYxbXFuc1ArT0hBbXFJWjhHUmpJcUtNZmto?=
 =?utf-8?B?UVltOVhuNGxZbW9rajhSVjI3dHFqVWpGSGtXVklTdnY2WjUyd0xYZHVTVWpL?=
 =?utf-8?B?QldRNmlmVTRRbjVYS251Z1RuTFFTV0xnU2x2SlNVa1NFaWFlMU9qczRpdFM2?=
 =?utf-8?B?dmx5L2pXeVJ0cmEwMXM2QmhUUHlPcjdOa2FhbDl1QlFOZnNNcFNIaG9nbWJQ?=
 =?utf-8?B?NTBTd3E0eWFYNE5HSXNYeWNWRGM0T3VYUXZ6a2c3dXkxT05tTjlBdG4wQWpX?=
 =?utf-8?B?cFJvVGRkSEhzSGo0MWNBTDRQc2w1MkpNSXVmWWhwV0F1VkJ6N050TDQ1Q0NM?=
 =?utf-8?B?WmM1WEdKN0ZJSWRjUkhwY2dtUHFudjRQdUJwbEIybHhFRDM1TkdUWkRkaWpB?=
 =?utf-8?B?SjlwaHRvcTBxaW9rYlcwbmtSWExvL1FsOVFRdUg5MHNSQlBweEpOeWsxMVls?=
 =?utf-8?B?KzkxOXRQejcxSkowblV4RWZSaFRVRnRNNm4wZiszd2N2UHRJT1R2dDNENXFM?=
 =?utf-8?B?dWROWmhkS21hVHFNZGpIVWhPeXFYSW00Z25YTDFMNTg2cVFRQTNvVnhHc2Jw?=
 =?utf-8?B?V1cxMmxlcGlialFIbi9uUjJjLzU5bEQ1VkZXQitDNlNRN2QrVmdhK1krQVNz?=
 =?utf-8?B?RmdCSWF6b3F1aHNBUUFxSHJINXlDUFNZaVNCaGNnZjZUQncwUnFuUWpLUHRk?=
 =?utf-8?B?Zks5akNlTmQyVHh2L0c1V3V4cTVCdDlkWEFhcFdtYVpJRkJKMk15K3ZMM2Ux?=
 =?utf-8?B?ckk4S2hlRHEzZytnVU0wK29lMlNYSVBVU0ZiLy9yZndVUndtNXZTREdqOHkr?=
 =?utf-8?B?eUNpbUFEdGVPa3NaUTIyZExzdkY1NFNSWEtQZkNzNXI5VnBTb1N4RVBXM0Fy?=
 =?utf-8?B?VzRtSTVDZHd6ZjJkSFdLbGNJZjhyYXcybll6c0hTQWVZc244T24ydThYTzBU?=
 =?utf-8?B?WHNzcXhjSUNXYlBmcExGSEVkekd5QzM2cEZXWm9kdU9XU0lVWVd1L0UzSitj?=
 =?utf-8?B?cVA1NXI1T1o2OEdtai8rMDFLSUJMa0x2VXRqb0NpaHJnOUJWVisvbTBkdmR1?=
 =?utf-8?B?cVErYmNndnVGQmlQUkpPMG91VDVWbklFSkdUV1ZrQVZON2xsQ3pDWWVtamVI?=
 =?utf-8?B?SnJpdld6MjRSR3NCM1B1SDBxSnUrMkhYTkRoS2JtZ2tsVXhyU2RrS1U2ZGp3?=
 =?utf-8?B?V2pSV3J4NXRvSE9FVngwUW8yR29Sa0VIWERHWm02MjdBTDg2VTJGbDNJYVFC?=
 =?utf-8?B?REt2a3pwcG5GVXZOODJNSVFhUGJhT0dud1NEaHE1dHlmSlRkT3I0Z2huekVN?=
 =?utf-8?B?MG1UcDY4VGZvTml0azNtcWNaYWNNeUpnbE1UeVNvMm53bVFaWjFycVFZSTF6?=
 =?utf-8?B?TXpibDBmUGtpYlhndzY5VXdrQTFSdUt2RGUwZWszZ2pLUEJlZGVKcmNweW1o?=
 =?utf-8?B?cjBjanIxVmZlMzVhS3hpSnJPeFpyYXBiL3ViMUM3aHdWTzN0ZG1Yb0Z2MklW?=
 =?utf-8?B?R0ZCYXR0TnEwUlg1Q1V6VlZHRGJPZDd1bXE0QURFZlVvTm5iaG00Zk1tblFM?=
 =?utf-8?B?Rm8wVURCOWhHUHdpdU5wOUFzdVJSOWtDc29YeHVjdlJNamgxQUpQc0x1WS9K?=
 =?utf-8?B?RGZrMjlHN2dvLy9wK0xodzJKSitmbXVDYnJ4cGh6bEdYQlJSL0RjVUhDVlRS?=
 =?utf-8?B?TDZOWEh0YlZEL2pDcVpsUnZ3aDM5N2MwNFlsYmpkeFdoWTV5Y3B5dW9IRUdm?=
 =?utf-8?Q?JmnnHH4Hc5j1+pdmBjGcOO1Sz9rM0LOyVp8R3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba581ba-7800-4970-00d0-08de54cd73de
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:04:12.3082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3SEDd4qc0kgU6NllWnR6i+Cf8S2+rStFIvjPO9024Ib16vnb3AztWwd8XSSpyMCYui0YUUOnhEMSm3Feo9c3ctqTa6a0o9cLL/h9uoZdhKJvXv54nDjQCtk6IQDI1H3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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

On 14.01.2026 15:29, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_basic: Enable dynamic subtest (rev4)
> URL   : https://patchwork.freedesktop.org/series/159958/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8700_full -> IGTPW_14339_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14339_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14339_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14339/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14339_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14339/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

igt@kms_ccs can't be affected by this patch. So this failure can be
ignored.

Regards,
bala
