Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7842CC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133110E0CB;
	Thu, 29 May 2025 17:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TT/tgCZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140210E0CB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748540189; x=1780076189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y5QR0oka7KYqzs4p6Pg/qJgCEPs1F2g7/s60yLmGnc8=;
 b=TT/tgCZe+TgL+k6dilhu/wWGJwpFt7RY3VYM5E95NHSzB609M68BZzCg
 LEjBYIfxU16hzgTXUfZH4zoP9F8ciOtFB7KzKdllLeFgZTM6CHTRLzofW
 14zN4q3J6FVQV2aSPeWfRu0bOVpkQ9LSSZypGo11Ly1Zegsgopv6jaZFJ
 GmNo4O9xhHP0Ai4MTJignpUpRHxp++qdgPy7cWvN5tx/9ug8gbqYHJ0na
 cdv1eM5TzN2l6LP/fpsdnyOT/g3RY368/V8MglBIXU2TjYpBvm0pxKx+x
 q+JNPwSX+IrCKBhcB4yRm/FIKBJRUHgKxAE/3z0j62tsuwU4QbB9KI4PN A==;
X-CSE-ConnectionGUID: Lmu1nyAbR4qcDDFNAYPgUw==
X-CSE-MsgGUID: tvoJAON0S0q1iM5RGKPyLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50669419"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50669419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:36:25 -0700
X-CSE-ConnectionGUID: DyRCBs29SB6AE6qZLmQrGA==
X-CSE-MsgGUID: UARYxOY9QM2QCPfb8sLf1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144615411"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:35:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:35:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:35:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:35:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+k/TCkzKcwJ/wBSaSKBjbibCrgI6BFITj9dEhNWxZSfd05qE9n709oyC8VJKWeaQHh7LHjXK/0q39rqfLds1EMXS7tUvmaIZEpPNKvif2dmBG+KOZjFokkj4GTLBjDWCc6YQHiaiwfPzkk2e39ExTBrODWiVmjfQOiMCNlC2HNvoKXPWtVpEMvH85zt/kF5WMeqYlHDJ7OiYAcm4rRt2a6gS9hzBc6PI8jYC1ZF9dJOfRsm8liaEIZk+cBJuZUD4VLPQ9u5dihv/CUXEmuEY6EOVT19cxsrQSYrD55Om9gCdmBohoen6AduE0XJc9FOR6uphPG4VwbQDCxOR/rYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XpoKSFT4GeDWG62rv1xiPDfIcwitzwdDE+k6hpBp1s=;
 b=K+klilxNyCfTdFcqxaIiDxRcPJm2hxF3ke9ZGkIECVkeOoqaYKy/7HMlqjgrPqpSb4Uw9VNWO8WmUMiaFMRFMh3AlDgMwQDZILhb0c4JWeo3Zn6gBj+S0uS5V+YixDmIB7r4nuNapaActlRaYhzoGoVx7Nj1EBJwUywdi+XhPrRSjdysLrskCFlwe3GxywfFyW/0dhPJxpGVMGFhYwas/JobU6jeLbvd+f9dklGfj9Z8O/T0LeOO1wLVDHdM2bDln11ayeITbb2mAyk93j5Vqs5s6a4l9AXyBSQFOqrDASdPgI7edp1V9UVQSx+jqJ4vOnFbOHlBj2nVQW6x3tgOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 17:35:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 17:35:49 +0000
Date: Thu, 29 May 2025 10:35:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 2/4] tests/intel/xe_pmu: Add tests to validate
 engine activity on render node
Message-ID: <aDia89E6rojh0tMp@unerlige-desk.amr.corp.intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250529065359.915117-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0287.namprd04.prod.outlook.com
 (2603:10b6:303:89::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fda8a16-2aaf-48fd-a39d-08dd9ed74032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdhTDhmS0lJdVZjdVd1Zlh1RFpqSHBYQ0V2UW85NTFiSlNsSXRYSjdOblI3?=
 =?utf-8?B?NkRXU3RnRDNMZ3pPMGFaREErTWxyc1VrU3BzWTlxdW8zNXJ6OW9DWDR2QWpE?=
 =?utf-8?B?aWovMytXdkc2VWJFcUxpTjVDOHRqei8yOVNCNnVhMS9DQ2czRWxZRThqdHZ5?=
 =?utf-8?B?LzJPenZqMW1kRGpId3BBTjBRTkVsdHIzb2ZaY09ZK1hnaUZ4RGlBMHlUd0Jn?=
 =?utf-8?B?bVZ4VkpwYzBuY25KNC9wL2ZWU3orek02K2ZYMTBQMm5WcE5lQjFWaVVxVjF6?=
 =?utf-8?B?UEwrNDNzVWU1N1JQTmlGcUxDS1kyQlZjOUZPZTBjMjRvbDV4Y1FLck9UWGdB?=
 =?utf-8?B?Ny80VWlRYkpUdjhVZmRNM2xvd3g3aHNheWdEVXVxOG80bGpEMi9jUWIwUGtQ?=
 =?utf-8?B?QTJJaTg2aG5oK0tnSmZWcTlCVlNaRmZSTkYvYmVNUG4zajZKcHhoNW1lT2NS?=
 =?utf-8?B?YlRnWmkreGpyY0NuNVVrT2FoRDhFS0tBMVlMdnhOOFg3US90R1VqTG9aMThD?=
 =?utf-8?B?MUozN3JYaUxJRzhZMGF6ZUpCQU5UcDU2VEJGanQ3UEJTN2wrbWJqTkhTYTV0?=
 =?utf-8?B?SWRPSzhhWFpzdUpEbklwbVFtb3Fna0ZxdG02dkp1cWFJV0NYOTFncXFXd3VT?=
 =?utf-8?B?anZwRUZZTnkrWHNoNjBnaFJqdDFhNVM5YzAwd29vMStQV25qOHRKanRXZEVD?=
 =?utf-8?B?MEI5aW9PYzY0YnRwZTZSMFhvNjhUb2FKNVhiSnZSbzg5bnVpRzFObElMVVA0?=
 =?utf-8?B?N0hPejV2MElzYSsycGlCT1pUbHBsTTY0SitDU3pjRHZFSHNYMXB5SDBtOTdV?=
 =?utf-8?B?dUIzVnJKVGdtY2FTcDBXODQ2TXpXZXJzVlNCMkordllheUNZd1BjVklJVTJ5?=
 =?utf-8?B?VUY0VXBDZFEwZHVDSDVUbmJoUzMzSG1XZHdWd2xDT3lGbitHOVNuK3p4cGpj?=
 =?utf-8?B?TS9kd0x2U29rNUJ0TkluUWNiMkhxVldRQXkxb3FFNnpoSGdpeUpwbkxJUXB6?=
 =?utf-8?B?elpHMENIYUwyYnZlMGVNb1l0Q1RKdEo1SHFWWGRnZG1JNUFjbm9hMGtDcnYz?=
 =?utf-8?B?Vm15RHc1MHNNcHBpNDEzL0pMNW9FdFZid2Y2aFAxdEZFNlBFWCs1STlTSHhK?=
 =?utf-8?B?N1JMOU1GOERrZVRWMUFrVDdWYXo0czZEVXJXeG1vWWxXZnFhYVNTeDlRV1Q2?=
 =?utf-8?B?TklGU21xeGxJQlY4U1FBbDVCWldHSElPVnNFSUZRZHJZdWFGUDZ4d2hPdTRB?=
 =?utf-8?B?T3RVNnJXZlRCR3ZXZ1pVS1MzL0dHMExxcHNzejRYblYvb096aW1SZmJVUkJK?=
 =?utf-8?B?V0ZzOVYwMXhTcEJxM2R0SzJ1bXZHbjA5blY3V3ByTGg3cndWTTJMbjBtdnFi?=
 =?utf-8?B?T093bjN5b1JTanZqQVpoOGRpS2daTDgwNXBPaFBkNWRNa1hkdXlRUWV4b2Np?=
 =?utf-8?B?WU5tWjRyMXRucEM1UExFYllvVk1QSk1MbStnc2EyZFJRM3hTYTd3SSt2ek5M?=
 =?utf-8?B?NlMxR0Q4TnVSZjZaN29YNHNxNlhQYnk4dnM0ejV6VE1iWnVWSURodGd0akk2?=
 =?utf-8?B?VDBUckp3T0RtSy9KeXdkaWdUV0JOaTJUMVFETGpSR2dpaUVqdnN2QkFTNVVs?=
 =?utf-8?B?TW84aXdOVlBCZm40K05jTVlnUGtkYjJwSmJyTjBVV0swdU51V2V3eG5YU2lM?=
 =?utf-8?B?QW5WZytQanU4RmFZN2Z5VFpYaE1mQkNIcUlIV3I3dVV0YWMwVWxiYS9NUGlH?=
 =?utf-8?B?d3FFZWVibSt4czBqMXRJei8vK3RUVXR6V0NiOFVQb0JtY3QyRW1naGJWSTJ0?=
 =?utf-8?B?NFQ5MDBNSmxjb2MyYmNVdmNwc2tmOXZDZ1BpTmlwamRXbEgyK2lEWER2Y1VE?=
 =?utf-8?B?cFQrTWgyWlZKVzBWTXQ4emhWVEg1SFJDNW51bmlJaDgwbVpHc1ZxTWlrN01h?=
 =?utf-8?Q?ugD6qoIabSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1FqSXNwbGhudWM1NVRkTWZPZGFkRHJYTGgvOFFLSVhESjVCUk5QZFNLcnlp?=
 =?utf-8?B?WFNxMUZNRFpFbmpuSGgxRlJ3STRMTm43VXhUTWl5MnlISitXRTdyeE5WcDVL?=
 =?utf-8?B?ekRMaVhRNEF6TFEwaHNoUmtudExRNTFVR0M1bkxXTlRsaE15MEVXaklEa0JV?=
 =?utf-8?B?ZG00VFFrQTF3Vjg4NytBbWtKQ0d0bEMyTG1MTkxSelVqc3pXMUUzd01TTGFw?=
 =?utf-8?B?T3VUdEtiaHU3bHh6OGI4QWt0c1VvR2FwZlZlaTdIOVYzV1VRdDFiNCswVU5I?=
 =?utf-8?B?ZEFLYXpvSzlwUThFRFMxVmE0SzlyMWhUdUxUZGlweE1ENUZ3bUZKSjEyczRa?=
 =?utf-8?B?YzVaSlB3Mms1dFVLNlUrZmt2Ynd1ZGIvdkNQYkZQZmVieG9JNGRMQ0FibGIz?=
 =?utf-8?B?djhrSjAyaWgwMEhYUi8yK0NrYXJ3aHdqUStRYmExWXd3bUYyR1orcjFrSkJi?=
 =?utf-8?B?ZlR4U0tTYVlYSytUcktxdEZlWTJMQmZqdkdockI2Y09HWktJNmcvU2RoUWhJ?=
 =?utf-8?B?UzE0aG5CLzg4c3U1QjdmUERNSEdodGE4a1U0UFhSbFhPek5NQk93THJHN0Zl?=
 =?utf-8?B?SUVmUEt2Z0lvSm9zRjVFR1lFbWttY0FPN3l5WllSWU96elgwYVJlWVdjcWFJ?=
 =?utf-8?B?dDdpcHhuNVc3V1ZwUy83Rlk5emxQN2ErOWJOVEtObE01T0l1N3BSSEhWN3pr?=
 =?utf-8?B?R0xlQlQ3RVhRQzlWcmdLR1ZwcUhuaDB4WVV4dkE4SWZCQm91cXJ6a2M5SFhy?=
 =?utf-8?B?d3RLZVI2V3NQNkVGaG1nWS9OUld0bUJncUlsNWVvcUxHNU9OZWJNSnNkTnhj?=
 =?utf-8?B?TCtUYWRSWmQ3eHAxeEJZT0FHYk5jOHN4dzlzaU1SRTkvODBSanJMZmtXRk53?=
 =?utf-8?B?Q2lYNVYyRnl2UDNsNXV0Z3N2dC9LRnZWOCtoRlcyNVRoZFQ1TDdqMXgyME5T?=
 =?utf-8?B?SnZrczJFdktrQ25JbUIxL1BET1d2NEJlMVlSOWZwZU5ieEtUMVM4cmlwTEYr?=
 =?utf-8?B?cmJZS014emZBNFZDYnlHcUNmcC9vMEZkQWgyNnNiZjJSWGJqazFTM0luZmov?=
 =?utf-8?B?b2QwUTN6TzhzRTd4VnVZN2FXT1kvTDdDNFFaWW1uTVlIOHNmMWl4MTVFd2Y5?=
 =?utf-8?B?RlpKOVIwWG1kSzBHb0dEblpVdkhzekFzMEJocFdpR3dhaE8vRjUwZ0R5cE5B?=
 =?utf-8?B?eEhRZEJ5bm0yRzd1ZzRYVWNJTEZwSVhTQkVTMXFYUm13YzB3MnhlUUpTTEt2?=
 =?utf-8?B?OVlXUDhobkcyTHh1RnYrTWpNdG9FeGRQYTZkQW1zZ1FXUk9IbVBFZFVVdUR3?=
 =?utf-8?B?U1ovNmgzZEQyZ21jTkFGRU9PTHdMSDlRa1BNK1I0bG5UcXlQZDBYbUt3Wlh3?=
 =?utf-8?B?K3lqVlJNWWJmUmNOUng2d1N0dW9ReVoxRzRmTmdzc2M1L0R1cHdiMW03cUFI?=
 =?utf-8?B?WnI4S3RHUGx2NGdTRkZxQWlTYXB1cm9URGNGNXVDanJmVUxvU1RWWDNzVGxh?=
 =?utf-8?B?akR0d2NYb3NWajlpWlFHcU43UWZwNXduSnpQMFdFUW96cWlqanFLYWZNZ1lx?=
 =?utf-8?B?bERDSS9wQ3ZhdVhTMUJDdkM0VU1JMzl0bHRxTmdUU3Y5MmFTMlk3RENuUUxj?=
 =?utf-8?B?NWt2K1VkNVYxVUJkajhpUExvVkw4cFR3ekRmdjQraWNGSXRVWStpZk4zOUh1?=
 =?utf-8?B?Q25zNDFGMzk3ellONWN2aUZ3NTdTVDdVWjV4R1pzV2dDUXpNcFNPMlpkVVZ1?=
 =?utf-8?B?WEhuTE9ockZ0aGhPNDg2WFV1S0hBWjVDaEhRaXpLdTFQbWo2L3FBWFNFN2dn?=
 =?utf-8?B?UmlKYnE4eFRQc3dKVElYemxkeEduNHh5bm1HL3hiYTFLdkRoRTNYVU9sRHBD?=
 =?utf-8?B?ck40NjJZVm5CN0o2MHZFaHVtVUliZjBlbitHclFhb0ZsSjdOMFY5aTg4NXdE?=
 =?utf-8?B?Nk1pZTlnblRJS2dBakwzdGp5MmNJMkJXRC9tNlpsc1RXdVFwTktEOXJKUWdW?=
 =?utf-8?B?TFFaVjNHaCtqT2hFUkErV2RMMTFBV2d2aG4xQXZ1eGo0VGwxN051aEFxaE9Z?=
 =?utf-8?B?VUM4TlFMb3JRNHVQdXBVUGx4UnJqcmpqSitSb21HRDhDd2pHcWdyK0lZaFZy?=
 =?utf-8?B?Qzl2bWJhSlh3aDdDZWc3WTE5TlRXaW5INkZlNWk0dGgwdVROQ0xIei84SWhD?=
 =?utf-8?Q?x5zHPJKMDDdIAf3tnW+N+4E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fda8a16-2aaf-48fd-a39d-08dd9ed74032
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:35:49.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IehtYndKzt+tX7AUagPAgXoUhv5/yuZYZMwsifuoJMxjpx6konOioJe/0uDIHvUtzWzkzVrowJbN+k2UOL1/8yCPfTCyewvVySA/WEnKvbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
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

On Thu, May 29, 2025 at 12:23:57PM +0530, Riana Tauro wrote:
>Add idle, load and trailing idle tests to validate engine activity on
>render node
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 15b4b82d8..198470365 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -53,6 +53,15 @@
>  * Description: Test to validate engine activity by running workload and trailing idle on all engines
>  * 		except one
>  *
>+ * SUBTEST: engine-activity-render-node-idle
>+ * Description: Test to validate engine activity on render node shows no load when idle
>+ *
>+ * SUBTEST: engine-activity-render-node-load
>+ * Description: Test to validate engine activity on render node by running workload
>+ *
>+ * SUBTEST: engine-activity-render-node-load-idle
>+ * Description: Test to validate engine activity on render node by running workload and trailing idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -833,6 +842,30 @@ igt_main
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 	}
>
>+	igt_subtest_group {
>+		int render_fd;
>+
>+		igt_fixture {
>+			render_fd = __drm_open_driver_render(DRIVER_XE);
>+			igt_require(render_fd);
>+		}
>+
>+		igt_describe("Validate engine activity on render node when idle");
>+		test_each_engine("engine-activity-render-node-idle", fd, eci)
>+			engine_activity(fd, eci, 0);
>+
>+		igt_describe("Validate engine activity on render node when loaded");
>+		test_each_engine("engine-activity-render-node-load", fd, eci)
>+			engine_activity(fd, eci, TEST_LOAD);
>+
>+		igt_describe("Validate engine activity on render node with load and trailing idle");
>+		test_each_engine("engine-activity-render-node-load-idle", fd, eci)
>+			engine_activity(fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);

I think you need to pass render_fd in the above tests. They are still 
using fd.

>+
>+		igt_fixture
>+			drm_close_driver(render_fd);
>+	}
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
