Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADACFE7E0A3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 09:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABAB10E3AC;
	Mon,  9 Feb 2026 09:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7SR8k6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390510E3AC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770630413; x=1802166413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GnJO9HtJPzQBbZBPnQnL+91GDD+44lx6gRmAvb0uENI=;
 b=c7SR8k6pNP/bObyYrdOg8o0NPrMu3YcF+K+DqvRjm6fEd5qxO/Fqy4kl
 ohUZ+GTVjpl00L0K44KgbU0uQf7Pw70Nr8/Xe3DPTg5rHl0frxWiU7QTM
 tyXheXXuS1xkjs2W7X+2w9kzuai3GvZoop52RQjmsX6xm8jh7Dn5k3IU6
 oyYhUrGtFSAfgA84a+wYNoQ5lzQO65U57LS8JwsvqzJ4F3DBDKPlr/psZ
 12w69mR7FB72DWd9pK54iLeIXe620Sbgi5qv5sNhRWNHbLederYdXqjNC
 UWMrgvGNEweQimj4OSAP8qouQgTBGcwaS4yQKfAv8cqL3DnRdnHJStYGm A==;
X-CSE-ConnectionGUID: gfbwsm+ATX6B5qZAVxfWRA==
X-CSE-MsgGUID: bOQ0paj/QF2FfChlnnY/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71839840"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71839840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:46:53 -0800
X-CSE-ConnectionGUID: /thX6uR5Q9ilZHCs79DerA==
X-CSE-MsgGUID: 8LtUjtCPQ8SktM7hEY6nmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211266921"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:46:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 01:46:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 01:46:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 01:46:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSij8TPff3kfq3WIndz+iS1377WE4f7pn82bRODdZQ8+0A6BU88pdAfgxyyDEMz/MMIWkNJgGOUFGCyPdBgDkMpc/DxHfMRMuVh75Dszn7nW58g5C7fdvgGSSLUPQevS0ypitIdm/Pd93GM0APCATcDPfoJ42r9qhxpPiBP/9ZArQvzApkDLf0cfKOQS0/1UW+hiXMNgP3O3ktl4q6gqv3IdNnQYaGdrOWYtRsSies+ssPlQEt5nhoWlZ+WhiKlZoUQozL2FDZt5HTI+BD5ap+dpXOiQekoe1sIz6gkAgVJ6TIg44mMwdmrsgoxiL1MxizVCyl8hlj2CJo3xX9TsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az1Yxkoi8oBzNDY7DcX+Q66AbOBXZjfRnw6FjBh0hnc=;
 b=LvzSjSCXpcs/mssQ0MEgIwrxtQcbZlFj3GELkPhj28Xd6OoqjDTHSgaadgc6MNklhElNY0bA3mv3HfehT+OJBEPt4kkpVAfEwuHIFkGMnccHmu3MNYcauE1U52j/EvL17xEOtrqQJyeE0PdG/r1XfvE9gg5erYATWIgHvFkJD8FNhsmz1eC+0M+cSrYBdWPCx4RO/5Bq2zrrhmDfdq7pQKzMBM7HxP2oWn8ELA/5UxuDBsH5R8x1UdK8NtjKTkeAKG8eTEzXOPBScRnAXJXNrWU50vZuCf1GRTf2wJdwP4c2D8DvkbMJYQt+82ls/lNTAd6Mhg/3k3uiVoEUMXXtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Mon, 9 Feb 2026 09:46:50 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:46:50 +0000
Message-ID: <1f0fac56-10bc-45ed-995a-4f9c1b655a79@intel.com>
Date: Mon, 9 Feb 2026 15:16:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add
 purgeable memory madvise tests
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260120061141.3139060-1-arvind.yadav@intel.com>
 <20260120061141.3139060-4-arvind.yadav@intel.com>
 <BL1PR11MB552559BB541FF396FCAA31B08490A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB552559BB541FF396FCAA31B08490A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bda5b8-f265-4be0-f3ab-08de67c02600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzBCV09FRU5pWU1nQTdobExvSGhEK2xKZzcweVVVUERibFJUOUVTdlhFM2xZ?=
 =?utf-8?B?OHpRQjJ4L28xdVpFZjZUdVlwZW1OOW5RUkhxaWl4VlBBQVVkd3l3S0ZWNG9X?=
 =?utf-8?B?bmovWHhjckhlNjJkdC9IL3ZiQWRWOGVzVk9FcENVTU5KYUdTRG51RENwdW1a?=
 =?utf-8?B?YmV1WmJDWnZ2b0ZXSGRJYkJSejVsVHRBQ3FwajdlUmxvNHpiSUlVcThXaXJJ?=
 =?utf-8?B?b2JKa29nYjBRZ2JSTURGMDZ3QndnSXhJQlRZN1NHcXpjTVVNbFMxYUttcXJw?=
 =?utf-8?B?ZDlFUW1lYUEzaVYwSVNDT2orZ3EwQmI2bTR4STVuYU01Nkd5d1RyejJDRW9G?=
 =?utf-8?B?MFlrUUFOcFREc3FHVExmTWE4Q1diYy9oaVUrYk9BZGM1V0ZYMGd5eFNxL3VN?=
 =?utf-8?B?emxvaXRURDNqcGZtQ1dZS3VHbVk3ZHl5bzVEYVdJdGJsSW9VWjNkU1o0SDc1?=
 =?utf-8?B?YjFQQ05OT0dyWTk3S1BxeVlvRDZaYStFbjZ5MmRwR21tQkIweVlsaW5MOW5K?=
 =?utf-8?B?a1FiSXZMN2ViYUJYWldYdmtUblhtT3dsc0NMSk9ETmtoajJLOXErVnVpRjl2?=
 =?utf-8?B?YWVPeFd0SUhXWVIvYTRnZUhlSWk1VkVObFpteHFMZ0c1b29qdUFOWVVWRHZ4?=
 =?utf-8?B?OFo4MlYyeDkwcStYQXBLa1JYTDhNY0pzN1lrN0V0YXdHUUxWbm9uTXZiMHgr?=
 =?utf-8?B?TGtjWlJwbG1Bc0J3M1BPSHdaUkhONWpseVJwcUZ4WU1PdXBOYkJzc3JaYVps?=
 =?utf-8?B?bnVrMXZSek9hYTB5ekRmbnNPWjB1WS9xUDRoTmRnV1pLNU9lY3JRRndHUFhI?=
 =?utf-8?B?RDgvRElQQjQ4T1E4Z3hmQVBNc3EwcFA4Z2hXVG4weUhIa2wzeXdsTEZRcmVT?=
 =?utf-8?B?RG40bXNqSFJ6T2dlbXNxZ1pPTE5CTGJLZFA3WFhKVnF6RCtkZlVIMGhCTkZn?=
 =?utf-8?B?VEdxOFhZS0VVcjV1Qm44M1hiWmhSS3BSdFo2NTVjbEFMZ0JmZkRlZ203SnRp?=
 =?utf-8?B?RGlqUnRyeHpoWVd1ZEU1QjQ4YTFpQnFiLzVhNS9wQWpoQVJGK1BSUjVMUjlz?=
 =?utf-8?B?SU96U1FHbWp5RUNObHYzSEhOdk9ET0RCN3FwVXJZUVBWYVFqdVhrVmpYVmtY?=
 =?utf-8?B?RWZzZHAvZi9WWld1aTNCRGZFdkpyQzFYcGFEdW1tK2IraFZGWk9WTlM3MUor?=
 =?utf-8?B?dm0wbjdWQkZLSnN1ZjFyRWZ0NnNXVmw4Y2h1aERhcDlnWkZHb1pGTEVqQXBq?=
 =?utf-8?B?RjVoYmk0S1ZYRVZsdnVIUEEvL3FkZU5tMkNpVDltVFNRck9UcGdRN0RwL2da?=
 =?utf-8?B?SiswMjl0cm5jVnhHcDBWVVFoVlI0SEl2ZURIWkZ3bGlBVmtsdHVTTE9LeGxD?=
 =?utf-8?B?ckp3YWpVQzc2TTZ1QlZyVmZGRG1CRjl5R0x0NFZEQzgra1p5QmxPMWx0QWkr?=
 =?utf-8?B?ZHoxWm1iU0xPVmJjazdGSnAweTZwd2dUV0R3RmFKQ0JOTzFUR0JtdFczaGh4?=
 =?utf-8?B?Mzg5emlmNHU2aUJuNThZQ1JkQm55dXAzWXcyQ2ZEMEpQQmxIQWR1aFVPUGlt?=
 =?utf-8?B?eGtjVVhld3Q0Vmg4Nm9KbnhwU0RkZ0d5N2tUZk4rODJWVFEyL3JGZ0RwUExo?=
 =?utf-8?B?QSthN2hYbTgrUGtrWEhoUzFjUVd3VjEzT0dNQitNeXhxZCthUWc2bnFESWxB?=
 =?utf-8?B?S1A0Sk9oR1RkZGtQZUFwZHNWU1pwOEx4UjVLNkNhdnVMRmFaR3ROL2JlSDRn?=
 =?utf-8?B?T3JlYUNTalB0LzRtd2VLd3lNOHdLVGQyUUlJUEduOThWdW5YVmhOSmpIQmk4?=
 =?utf-8?B?Z0dNOHpMbDdIb080a2ZQMGhDT0tCTEIzOWZzVWFFVHpoUkZHWlBLZGpzc09Z?=
 =?utf-8?B?cUI4Qit2U21aM3NjdlI0eStxbTdxWVphMkRteGk3Rk9tRmVwaXlSaUZ0S3lF?=
 =?utf-8?B?SCttTWdURHgzTi9aUy9KNmlpOVBCcDVHM1d2U3FxL3ZXQUtDVi8yYk1INnNl?=
 =?utf-8?B?YVJHT2c4ZGJvWEFBcjZZTmZ5cnlzczdtU2JCbS9GdG45VW9OeWpBRHBJZWhD?=
 =?utf-8?B?MzZtNkp0VitJV1Y0Zkp5bEJIdlkvV1hiazFkOHc2aW1sZXZicENiVkdSWHEz?=
 =?utf-8?Q?5Z2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajJkd1JzM2p5Tjl6dzY5SzltTGtHbkFMNG82N3hFZXlHZUtEUS9IK1prYVdl?=
 =?utf-8?B?aGN5YndUVmdWU3ZmcjNnSEVhY3JRbHhWZTN3RlNJT0pWMTc4VVdYTXM5eVJF?=
 =?utf-8?B?b1VZRGVRSGpEeXJZL1ExeVpoNkd2Qzg1VXNBWE1pMzZIVGU3RVJ5dE95cUZx?=
 =?utf-8?B?Z25waUw5OWJzMFpjSyt2VDJycHNBMWZOaVRacUxRY29qVExSQkQxTHA3TzR1?=
 =?utf-8?B?U3NhMnRxc3lnb09CRW42dE1nODNFQ21aU2dxNlovT3RZeG8zbFhqc1U3Zkdh?=
 =?utf-8?B?RWM1NUdjQjFyZkxOT3B0UlZHV2pLQWkrU3Y5Qk1KTnZJTXVsUnRxYkQ2dDA1?=
 =?utf-8?B?cEFaeXZQZGRLK3JjTGNmcnJZVDRrNzZUN01KR2x5WEthZEc1QWZIWEV6ZFI0?=
 =?utf-8?B?SFpienZaVzlSNlNyOVZHdHd4dEpFdnVDRUZJbk1UUVNVRTlZOTREUTEvWnlO?=
 =?utf-8?B?NldESHR1VHdsZTk4ZjljZzRlYTlzR0RId3NRREVZMjBZcTJCWWhZRGJHb3A2?=
 =?utf-8?B?VmI5TlhYVTJPMVFPM2I3bE13YmhRTGdPRk5FSUZZTVE4QVdialJnVDl3MFAr?=
 =?utf-8?B?QTZJNjlDYm01WDd1VzVTaUo4VktQTFcrb0gzWm82WlRwUzh3VE9vR3c3Wk8x?=
 =?utf-8?B?OVJTY0VSREFFQ0p0c3BiMXVRc1BDdDNwTG9lOFQwcGVRRkNZRXhhZzhIbUF2?=
 =?utf-8?B?RDFLZ1ZwVlFRWE5iYU5JZ0NlK0Jha09Va2YvRzF5a01tNGo0UWZwNmlCNUpj?=
 =?utf-8?B?QzF4UTRTb3R4YU5aK09VemRWQ2k5dEtBb3d0YnQ0V0hRNW96SzNzWkJnTG84?=
 =?utf-8?B?SXR5QWZjTTFxcFNmRDRnVWNJd2hRM3pBQjBOSnN2V2haUGhHNmFXQzVpV2VU?=
 =?utf-8?B?MFpFblF0L21TRDBpL3pLU2hrdWp2WmVlNUgyeldNVE1YZUpOaE95MytUMjlH?=
 =?utf-8?B?VWRPRmJ6TTZid01pUXlnYVdBTmdHb242N2NhQXdpSUIvbGUvbFZHVmFwUGlv?=
 =?utf-8?B?TlhZa0VFaEQ5YXFwMGR4ekd3NDdITVg3UkZyOUY0anV5WXFiT1ZzZUlwVFRX?=
 =?utf-8?B?VEV4eGtyL0tDUVdsTjlnSTUwdkNjUXcvT2s2dTNmaU5INmgyeGJJNFdReVo1?=
 =?utf-8?B?azZYUWJlblhhdmpQbnNYalpXM1VOWUxuYS9xdE1ZSHVsM2IvYnk1bDZYL3pk?=
 =?utf-8?B?eUFHUnh5UCs3TWVqTUZjREsycng2bkp0V0k5Sk93TUpCaU9xYngxeTVaQnA4?=
 =?utf-8?B?Ykg3VGpWblBXL04rWlZzYXNhVVdibE44QW42c2VKMVUrK1Bmb3QvVXcxck5n?=
 =?utf-8?B?WTllTlFDdllsenpteURiZzJPMmNzb2Rlc1A3MjhjeVRiekd1Y0QxZ3RiUE5t?=
 =?utf-8?B?a1ZDSE5QYkhLRUNVVUR6NFkxY3FhUUpUdXVZY2dZc0tWRFJ6aFJ1V2VLMnlU?=
 =?utf-8?B?anJBZE5mMC9HQU96MXI2MExNOWZTbm9kdk9neDBEZTlQdUtHU1BabUZLYzd0?=
 =?utf-8?B?SWtyTDVZYkNuT1VGeStqcmF3b3hkV2h5UmY3WkRxVmhndGhZZFROYU9OZUFP?=
 =?utf-8?B?VkljQ1VocVN1d2ZaamFtcDhpdG55dmVENG5zdm5NdTVjb1dYL1V4RW56ZnBw?=
 =?utf-8?B?eFM4NmtoWU13MzlHYjJMVmVrbHFQSnBkbjhyRGVsMXVoUGRsTFVkQ1k1M05n?=
 =?utf-8?B?alA2d1dEQzJJQTZmYnF3M29YRTJzbE9FN3gweVRUcnQwMVk2NnRTTTFzTzR1?=
 =?utf-8?B?Y21FWHh3SXZXNXRGRFdJck5GVVJCbUo1b015OU45WC9raEdvLzFzYkFLMUt2?=
 =?utf-8?B?WGNiV054SlFGSUQ0cWNTUGFhK2RsLzIrTjQ4czZISTJ2WW10Mmp4TjRGWEVw?=
 =?utf-8?B?TmFkOG5TblorQ21aL0JsK3UyUTRUTlJYWFZvTGNNZTRjbTlydnBkSUZuSWZO?=
 =?utf-8?B?UjdTZU5YMFJLY3h5c1pEazN2RkpNcjAvbk1HR015UTIyRHdxQ1FmanEwWU1U?=
 =?utf-8?B?a05mVG8yUWw5QktraEVITjd5dE9xcWhEcVlUVDdOTVFKMjV5MjFETFZDV3JM?=
 =?utf-8?B?SEdvbmpWRU0zVGU5bVhyWjh3WE5xMjZsN0MrQkZ3bGNnWWl1VlhNTGFEUTZF?=
 =?utf-8?B?dXVEVVREQ29VL1NmbXpmTElxQUhRajZNYVBuYXZ2emI3dHV2SkpicjUxSHpk?=
 =?utf-8?B?OGh3eU5ZK1FSeCtUNTBSTmxqOGNZTm1iN1d2V0tHczNBMXBtbVQvenVWTGhM?=
 =?utf-8?B?TzhDZEY2TkdyYldUaEx5WXBCY1ZkMElzam9uSURlR3ZBRWlPQlEwOVFMQ2o5?=
 =?utf-8?B?S2ZhcVZQd3F0bis0dkx0STdOZG92c1h3TUFyVjViRkw1Sk54Q21pQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bda5b8-f265-4be0-f3ab-08de67c02600
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:46:50.5910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ei3BNcDpEWuI3ieYjnKeRi/JxzgSyKLt1+1Va0rnaZNYgDtKQs3RbEsoVK6utlxAa8vdcdH4aEPu3lqTZbr3/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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


On 27-01-2026 16:17, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 20 January, 2026 11:42 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_system_allocator: Add
>> purgeable memory madvise tests
>>
>> Add six purgeable memory test cases for system allocator using madvise:
>>
>> - madvise-purgeable-dontneed-before-mmap: Mark BO as DONTNEED before
>> mmap,
>>    verify mmap fails on purged memory
>>
>> - madvise-purgeable-dontneed-after-mmap: Mark BO as DONTNEED after
>> mmap,
>>    verify SIGBUS/SIGSEGV on accessing purged mapping
>>
>> - madvise-purgeable-dontneed-before-exec: Mark BO as DONTNEED before
>> GPU
>>    execution, verify GPU behavior on purged memory with SCRATCH_PAGE VMs
>>
>> - madvise-purgeable-dontneed-after-exec: Mark BO as DONTNEED after GPU
>>    execution, verify previously-used memory becomes inaccessible
>>
>> - madvise-purgeable-per-vma-tracking: One BO mapped in two VMs becomes
>>    purgeable only when BOTH VMAs are marked DONTNEED
>>
>> - madvise-purgeable-per-vma-protection: One VMA marked DONTNEED
>> allows
>>    GPU execution on other VMA; both DONTNEED makes BO purgeable
>>
>> Tests use xe_vm_madvise_purgeable() for WILLNEED/DONTNEED state
>> management and trigger_memory_pressure() to simulate OOM conditions
>> forcing kernel to reclaim purgeable memory.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 638
>> +++++++++++++++++++++++++
>>   1 file changed, 638 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index 8af66d76e..338037a48 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -32,6 +32,15 @@
>>   #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>>   #define FIVE_SEC		(5LL * NSEC_PER_SEC)
>>
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_ADDR2		0x2b0000
>> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +#define PURGEABLE_FENCE_VAL	0xbeef
>> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN	0xdead
>> +
>>   struct test_exec_data {
>>   	uint32_t batch[32];
>>   	uint64_t pad;
>> @@ -2245,6 +2254,599 @@ test_compute(int fd, size_t size, unsigned int
>> flags)
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * trigger_memory_pressure - Trigger memory pressure for purgeable
>> +tests
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + *
>> + * Creates temporary BOs exceeding VRAM size (VRAM + 64MB) to trigger
>> +memory
>> + * pressure, forcing kernel to reclaim purgeable BOs in system allocator.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>> +	uint64_t vram_size;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t bo2;
>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	max_objs = vram_size / chunk + 64;
>> +	handles = calloc(max_objs, sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + (64 << 20) && n < max_objs) {
>> +		bo2 = xe_bo_create(fd, vm, chunk, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = bo2;
>> +		total += chunk;
>> +		p = xe_bo_map(fd, bo2, chunk);
>> +		memset(p, 0xCD, 4096);
>> +		munmap(p, chunk);
>> +	}
>> +
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig) {
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark BO as DONTNEED and verify
>> +purge
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Marks BO as DONTNEED, triggers memory pressure, and verifies purge.
>> + * Returns: true if BO was successfully purged, false otherwise  */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> +uint64_t addr, size_t size) {
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>> +				      uint64_t addr, size_t size, bool
>> use_scratch) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0), 0);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>> +for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm, uint32_t
>> *bind_engine,
>> +					    uint32_t *batch_bo, uint32_t
>> *data_bo,
>> +					    uint32_t **batch, uint32_t **data,
>> +					    uint64_t batch_addr, uint64_t
>> data_addr,
>> +					    size_t batch_size, size_t data_size) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = PURGEABLE_FENCE_VAL,
>> +	};
>> +	uint64_t vm_sync = 0;
>> +
>> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>> 0);
>> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +	/* Create and bind batch BO */
>> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd,
>> 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr,
>> batch_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Create and bind data BO */
>> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr,
>> data_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>> BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1,
>> uint32_t *vm2,
>> +						uint32_t *bo, uint64_t addr1,
>> uint64_t addr2,
>> +						size_t size, bool use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +	void *map;
>> +
>> +	/* Create two VMs */
>> +	*vm1 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*vm2 = xe_vm_create(fd, use_scratch ?
>> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +	/* Create shared BO */
>> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	map = xe_bo_map(fd, *bo, size);
>> +	memset(map, 0xAB, size);
>> +
>> +	/* Bind BO in VM1 */
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	/* Bind BO in VM2 */
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	return map;
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-mmap
>> + * Description: Test marking memory as DONTNEED before mmap access in
>> +system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/* Try to mmap - should fail on purged BO */
>> +	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size,
>> PROT_READ | PROT_WRITE);
>> +	igt_assert_f(map == NULL, "mmap should fail on purged BO");
>> +	igt_assert_f(errno == EINVAL || errno == EFAULT,
>> +		     "Expected EINVAL or EFAULT, got errno=%d\n", errno);
>> +
> It will be good if SIGBUS will be handled if mmap is not NULL, please refer gem_madvise.


Noted,

>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-mmap
>> + * Description: Test marking memory as DONTNEED after mmap in system
>> +allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged mapping should
>> trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal %d\n", sig);
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-before-exec
>> + * Description: Test marking memory as DONTNEED before GPU exec in
>> +system allocator
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
> Uses hardcoded values instead of defined constants.


Noted,

>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +
>> +	/* Prepare batch */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
> Only the data BO is purged, not the batch BO can you cover the batch bo purge test also?


This is a negative test case; batch BO purge coverage can be added later.

>
>> +	/* Try to execute - should fail or cause GPU fault */
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	vm_sync = 0;
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +	ret = __xe_exec(fd, &exec);
> Exec on purged BO should fail. But here its returning 0 mean its success correct ?
>
yes, The exec returning 0 is expected here. The batch BO (containing the 
MI_STORE_DWORD instructions) is still valid
and not purged — only the data BO (the target of the GPU write) is purged.

>> +	if (ret == 0) {
>> +		int64_t timeout = NSEC_PER_SEC;
>> +
>> +		__xe_wait_ufence(fd, &vm_sync, 0xbeef, exec_queue,
>> &timeout);
>> +		/* Wait may succeed (NULL rebind) or fail (purged) - both
>> acceptable */
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
> can you also cover these cases.
> suggest to add dma-bufs use case also does dma-bufs can be purgeable or not?
>   that once Bo purged, BO cannot transition back to WILLNEED


These all  a negative test cases can be added later.

Thanks,
Arvind

> --Pravalika
>> +/**
>> + * SUBTEST: madvise-purgeable-dontneed-after-exec
>> + * Description: Test marking memory as DONTNEED after successful GPU
>> +exec
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_exec_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = 0x1a0000;
>> +	uint64_t batch_addr = 0x2a0000;
>> +	size_t data_size = 4096;
>> +	size_t batch_size = 4096;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = 0xbeef },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint32_t syncobj;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo, &bo,
>> +					&batch, &data, batch_addr,
>> data_addr,
>> +					batch_size, data_size);
>> +	memset(data, 0, data_size);
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +
>> +	/* Prepare batch to write to data BO */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0001;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	/* Use only syncobj for exec (not USER_FENCE) */
>> +	sync[1].handle = syncobj;
>> +	exec.num_syncs = 1;
>> +	exec.syncs = to_user_pointer(&sync[1]);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], 0xfeed0001);
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
>> +	/* Prepare second batch (different value) */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0002;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		/* Exec succeeded, but wait may fail on purged BO (both
>> behaviors valid) */
>> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-tracking
>> + * Description: Test per-VMA purgeable state tracking with multiple VMs
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm1, vm2;
>> +	uint64_t addr1 = PURGEABLE_ADDR;
>> +	uint64_t addr2 = PURGEABLE_ADDR2;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	uint32_t retained;
>> +	void *map;
>> +
>> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +							addr1, addr2,
>> bo_size, false);
>> +
>> +	/* Mark VMA1 as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Mark both VMAs as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure and verify BO was purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>> +/**
>> + * SUBTEST: madvise-purgeable-per-vma-protection
>> + * Description: Test per-VMA protection from purging with GPU workload
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection_madvise(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr1 = PURGEABLE_ADDR;
>> +	uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync[1]),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	uint32_t retained, syncobj;
>> +	int b, ret;
>> +
>> +	/* Create two VMs and bind shared data BO */
>> +	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +							 data_addr1,
>> data_addr2, data_size, true);
>> +	memset(data, 0, data_size);
>> +	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +	/* Create and bind batch BO in VM2 */
>> +	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	batch = xe_bo_map(fd, batch_bo, batch_size);
>> +
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr,
>> batch_size, sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should survive (VMA2 protects) */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* GPU workload - should succeed */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr2;
>> +	batch[b++] = data_addr2 >> 32;
>> +	batch[b++] = PURGEABLE_TEST_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +	sync[1].handle = syncobj;
>> +	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +	/* Mark both VMAs DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should be purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	/* GPU workload - should fail or succeed with NULL rebind */
>> +	batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	/* With SCRATCH_PAGE, kernel may allow exec with NULL rebind.
>> +	 * Without it, exec should fail with -EIO/-EFAULT or wait should
>> timeout.
>> +	 * Both behaviors are valid depending on kernel support.
>> +	 */
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>>   struct section {
>>   	const char *name;
>>   	unsigned long long flags;
>> @@ -2649,6 +3251,42 @@ int igt_main()
>>   			test_compute(fd, SZ_2M, s->flags);
>>   	}
>>
>> +	igt_subtest("madvise-purgeable-dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-before-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-dontneed-after-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_exec_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-tracking")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_tracking_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("madvise-purgeable-per-vma-protection")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_protection_madvise(fd, hwe);
>> +			break;
>> +		}
>> +
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
