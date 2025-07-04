Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF08C83030
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 05:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B5D10E929;
	Fri,  4 Jul 2025 05:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUi7BgGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440210E929
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 05:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751605339; x=1783141339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MhZDN4M2225ni+AN4DGeHZke/2DNh6JgeKlYh25tSTU=;
 b=JUi7BgGAhwNHZ1rU6eTr4EiBEwbBt4UwZsrcgBrDGEC4nlSZ2xOeTYGs
 W1bDogTVJdGLuvHs0HNZXIEBX9JuJaCIuGxxTy3okeJq6PxMz+k8tuVpf
 t4ZVJiNyCa1a9jjSNLnzCAy6M22fQAxAhez0XwY9PnAj53EtJuhHXwF79
 lw16lfTkUDwF0l2vDBYsaWN3YzvkzMUwJLbk5SkvzH8bbrlUj6qm+o87J
 8ooCMCIlN5ufs2raJizIgD3XXcduqqsUGYPWQupu2+iMei3cV7L3lBFNH
 pMkYoYQAvXhdVuhGFY6HU7dGaqkiwwuWpuKttnSaTlbPo6oi7r0t6eZxK A==;
X-CSE-ConnectionGUID: CG+CvPh5Rc+v9nBgaXKUjA==
X-CSE-MsgGUID: 1XDur60/Qz2MJAzDxg0JeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53658364"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53658364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:02:18 -0700
X-CSE-ConnectionGUID: 4t9VbgmwQlKc+P7nF/SmWA==
X-CSE-MsgGUID: fWaZgy+ERNinjQp0xgdqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154685924"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:02:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:02:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 22:02:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayId3IpPE3p5t6Vet/N2CBS60XxEzEbzxsEwdiA8cCnfTnINRTbeFSBc82oSN+zxF/EDJkHyPP8DxzFWoEdKAwHfBQuQ+Hd7ytMhUaJLoL33Jw3E5HD7WiFP5Xn/tYuJWnypMGFjk5bnjiQJwJgXmmFgUaKQoVlvJ2lfXTEh8t48fdIDqXoEj5H/UVlcfJNzlR3ojad/NiiSbDJdKeqciGg0k6GuvAS6eKVaWTJA6+ty08jnyNEYuAbECiNJRqCiGV1n0x5aKqzfRpsdo550rTAOi1uPvyZmb5FmqwzpTJdCMbmabFRbCB3T/k2LKaUU3OrFN9haoNfHkXSU4/qekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk3JKPF6Fmgcwg8nYVJa8cV4KSWfbvjDB4uPOsUk9HY=;
 b=VKYYG2g8OxDd7u7WHFBfkmmikW/M5g+secCmGEHwy21Psdfpi0pHSUYHuseoeD2RINFk+85nVqx78W0JQ6jszxU17Z9yu1NRc0MDvvFI+hUe6eDOawDoLFVuf3KKdeh9dOR7FDDpu7GIqzPP0PRN1cZuPMLoD8mHrneQ0wmMAe0VG8K0V7f5UN/zh2JUIdzx4bM3Awcf5Nnr1JuS4nKavuIMok28rgWNLkvH3bZ6jpkiOda7XlQxiAhO31Db3DmjQIpHw4mC+tkDT6tox91iabUzCoKyweK/t9+Ntnn0MtnS7bFFAQMNYkn8aLbA2JBHRfphmozuzfatZ4zhYN3H9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 05:01:27 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:01:26 +0000
Message-ID: <a9fd1596-a943-4544-90fb-b8f571c5a1bb@intel.com>
Date: Fri, 4 Jul 2025 10:31:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] intel-ci: rename i915 blocklists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250703140158.136166-1-kamil.konieczny@linux.intel.com>
 <20250703140158.136166-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250703140158.136166-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a1931d-9992-4888-814f-08ddbab7d407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0l6U2hGeG51V20vTmptU3lSb0pBMlFlTTVrV3FDZ2sySjlGbTVtcFIxMndM?=
 =?utf-8?B?cHJicit2ODBrWjVTalp0bFh0dVFaOE16czVaMnVUUHd3Yk1hMWl3MzR2Zmlh?=
 =?utf-8?B?QUtZWktra0dyWk1jekVlTGo3UVl4WTBjMUc1eGVWK2pybm9wVVVOVVFYWVZI?=
 =?utf-8?B?UHArSmhpSlJCZ3VjWHliWVlaWnRKUXZKSThBWlFsbUtVWTh3TWNpY0x5OTc4?=
 =?utf-8?B?VjArZnNVZ3dLdFVodE5TbVc5SDRySktOb25LanRFc1lyU1dFMGVIZFVHM2dR?=
 =?utf-8?B?WmJCb0E0UlpYM3JncUV0NG5zZlRiaXB3WE9BWmd6bEpxemE3YXM3ZFZJbWtq?=
 =?utf-8?B?MTlSWXYyREgyVm16NEZvMmdKZk5leGVWd1NuQjduWTBQdWlFUUE0UFRLL1BS?=
 =?utf-8?B?WHUwRHAwWlJMVHUrMUpqWFBGR20xbnhlTWcrNXF3WDN2bG11MWE4L2NaOGxi?=
 =?utf-8?B?NFBDZ212S051bmcwejlVU0xvUlFBZFZ5YXlhN2JObVBRNUNLL1dxSjVFMjlM?=
 =?utf-8?B?TzRIZi94TENsTVlhaStlTStueUl4K2xFQm1IRUZwTDBsZ1hhNXJBMmtLSUNH?=
 =?utf-8?B?bkRmMG1sS1dqVDNOUlFkVytpdXNBemg0ZXRpanRHalVUK1Y5dThxTFptZDNU?=
 =?utf-8?B?YnVOSGRHT2tMMjRXN09LazBoMFpDYm5JTXBodnFHU3RybmphYVhlbkdzUE54?=
 =?utf-8?B?TFFKakxsSVhjT1IwZkpBVGl4SktLSHZ3TVN5LzBxYTRGS2F0czV4Qng5bjJL?=
 =?utf-8?B?RkdXcVRnTVZvckNwSmRIQlU1ZGFJWTA4Q0tuUTJ4TG9BVExhT0RyTmdQbzFs?=
 =?utf-8?B?bEJWbE02cFdBamVkQlBGcFdKeWdEZ3ZqQ3BPQ3o1N1dpc0tKV0xVOGszRzBn?=
 =?utf-8?B?a01kK05QVWpvS0RhRzArUmkySXVkVEszUTMxVWVNU054a20vMWI5eU9xUFdn?=
 =?utf-8?B?bVpHWHhaSHNGKzZrSzZFWFlYVzYxR3dQVUtmMlNkbUgrS2ZGK3FnU2dGTSsv?=
 =?utf-8?B?bXlGK2NOWjRxdUl1eEdjYk1pUnFXMWlVQllrLzZqY0ZYR0E0NEE5RTdsQXQz?=
 =?utf-8?B?K0ZBNWVNeGFTeVVXWUtzT1RIVU5DNkVyNmRLWDFVNlJOdGY5bXd6RytMM0Y3?=
 =?utf-8?B?MklyS0FzeTdNMEgxSGE4U2J6VXZEM3RUSE9POWxQYU95Tlo0dUFITHVDYnlh?=
 =?utf-8?B?dC95cFJwN0xZRm5VVXFHR05IVkJkMmo2RWVUZG9IeGlVQndmLzBjRjBKUDRC?=
 =?utf-8?B?ajhZa0VPWTVpek40VmtmbVlrN0hXdWwrcHRxbVlacGUxVHVsaXlGV1VtZnV0?=
 =?utf-8?B?ajlGWE1qSEVqdWtoNCtIWitmNkp5eVl0ZUltQXQ3YkI3REg3ek85UGVybDhB?=
 =?utf-8?B?bitkZnJDWkpQQWVkdnBPb3BNSWxCS1cxUHFkSHFhaGhVM1hmQkFCbUdRaFov?=
 =?utf-8?B?d3JqZGpFNjhuc3BmMExLWG1NSHNSU0RBYVh4QjBYYWNsVmF0bERGVlJXNVRU?=
 =?utf-8?B?WW1TdVBvMTBuUlBXZjYzRmkvcUdlNUd4U29vWHU3ejZ6QmlKKzdiY1htVGY1?=
 =?utf-8?B?OVRZRnlHZ1p2UFFqYmtzTFBGNHNGc1hoYXJNMVNtMVFzWDRHV3o2Q1ZWemZn?=
 =?utf-8?B?eFkzQlBCVnFja25PbWE2eTZ5ZjFiMFpNZDYzVGdoYTFCdW4waEFHb2s4UFVs?=
 =?utf-8?B?dUFIL2YwY2xINjByMmJ4OENtWmJ3NzJKbGxtelU5bEZsTDN4WGxTZWt5bDFT?=
 =?utf-8?B?bkg1WEpsK1NtZW5EODl6bE9acTdWNnFRdE05Yzd3c0Fpa0wwTHpXS1M0NExt?=
 =?utf-8?Q?gjW2Mw9T5FTeHlrR2n8vD6FiHIL6BLLYshNPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEF2YVJZbmREYnV4Ni9JeUZrQUtuTDZpSmFMVURmYkJTMm9OMi9mTEtBRTZj?=
 =?utf-8?B?L1FHRjFhR0QxaytXalVSWHlTR2FwZHBnZEdKUE8vVFZXVW1wdEd4eUZCZloy?=
 =?utf-8?B?eXEzbEFET29wVDNFQmtabkdkOFdHS0RITk1UcWo0aThsVkxhVmlYWUg1bzZH?=
 =?utf-8?B?NU9iWWdaQ2t5RGVCTkJacUZ2REdOLzEvUXhLUWdVMWFJSkRzbmlYQkRscGk0?=
 =?utf-8?B?dGhGbjB0Rnc3Vy9PTzBKVVBPMFdzTmh5ZU1zS3JPTXp1aHdMOENrMnI0VjFo?=
 =?utf-8?B?QzByaWtUZlBpbXNNTGxpb3liNFZnQ2dIWmNEcWYwSFMyeDI3cWJSZXduMVhF?=
 =?utf-8?B?ak1LS3NIdm5GSlFlUS9IT1F2dXRFUkhjVEtNanY2dklFcDNkWXU5UmxhUUV4?=
 =?utf-8?B?N3kvNkR0N3N1K2RJdGtSVWVDbnNXR0tHVnJHaktUdlBWR25ZNTlBYnRrYy9N?=
 =?utf-8?B?MmtuSXdUNlVZaVQ1bGFod1g3bE9IcTltVGNVU3NtNXI4emNFc21kYVRrTzYr?=
 =?utf-8?B?R1dBVStmYis2VGhlZmYxOU1jaXU3OVN3R29NeG5YNVp3VjVncnFkcnREMktL?=
 =?utf-8?B?M3VoTEFuZVd6VitCVG5oZEhHUTJmMDdONk9BMVBWN2tNdzdJZTY0OHZmVUt5?=
 =?utf-8?B?TDVBMzJENWZ5K2o5R2Zxb1ZpejlzR3BncnJNRWh1UXRqV3pQaUNzUFZjYnhB?=
 =?utf-8?B?a0NIOTNBSG1DRlQ1dzhnb1F4eGdTV3c3em4zTlgvQVI4c0hYaU96d1dVZ0dG?=
 =?utf-8?B?bU9JbmhwUVVjejhLZW5wVlEvQW9yN3drblNwR3hXSElqdENDOTRSMVhQeVY5?=
 =?utf-8?B?d1c5UHR0WUZtWVE1bFZwZ09jY09ZTVZkeGh1RFp1dXYyTUF3UkpnUHpHMVpu?=
 =?utf-8?B?VGdYaGZzVzMrWFVwSjBzLzREMS9raEJxdHF2WDhGYTBveUxwUUFCVXA4cEpO?=
 =?utf-8?B?QklFZzdDWWNmbnA2ZjU1YU0ycXFxNUdJOXVraGJkRHdhckhEbmdxT0E0Yzl6?=
 =?utf-8?B?eW9wTE1JVW9hVEZ1NGxNSmlFOGdYNFdLSGQ2dlJnS0twMUtSL1gzaG9odEJH?=
 =?utf-8?B?aEovMVRNdmhlSmpENEdYbEVwNlExb1AxeS8xRi8wQ25oNkVzdkRxUS9lT3hF?=
 =?utf-8?B?azRHSVZCZ3BHcmNLNTV4dkhiZWdKR3YzT3BxcVBCeDd2d0NHZHcySTNYMGRq?=
 =?utf-8?B?WmlqRDZsZGw0RnB2VThVcnFycWJBOFZHMjZLVitYeHA4c0RYUHhWMDRaZnI4?=
 =?utf-8?B?NUVGNktFcW9ndVA3MjdOWitkU1lBQmhGd3c1dTZzYk1EK0NTd0liMXdEQkU1?=
 =?utf-8?B?ZTFOVk13S0ppR3NURm93ZHB4V05zSm1weEhLcWYzTCtzd0Q4eDA3SFgxMGRI?=
 =?utf-8?B?bEVtU04xZUd6eWQ5U2IzakFYYkcxZDFtY2lBYjFsVEdObStkOVpGRmw2aG5m?=
 =?utf-8?B?V3pPQ1Zkclppb1JpUzYveEJteWY1bzE1NEtPaTdtcmxSM2hHTjI4b0Nudlpx?=
 =?utf-8?B?ZURoZU5pTkdNdVFTTXRqVUllUEt3RVZoeUhQMDRCcVdHNHVZckRJZE8zdXBT?=
 =?utf-8?B?TGM2TjhpOXpqUXFHdmQ5L3lUbUUvT1BnY0h4ajJQaGszcndyNkdWS3ZrNU5n?=
 =?utf-8?B?V2dZWDRuR1NibVlOVnhrejM5bER0QXU0YUN3MG9zMmgrZnZHakxPRitlREhE?=
 =?utf-8?B?NnZ2NFBSZ1RSZURFNllCQ1dOd2tEaGFuQzFEQTFRWUF3clZJM0FJMXJGdnhw?=
 =?utf-8?B?N0FGbHEwMDB1QkRySlpkQzRxOXVLbEZqSWFBcUE1NGhKenZsMm1mWlZFTE5k?=
 =?utf-8?B?M3ZUWEsxbUNFOUJZc0ZlOUUxNVZVamgvUTg4Smhnb0FkM25JMUZ0RFAyRU5S?=
 =?utf-8?B?YTNyN3Iwb3E1V2ZMdDZJZ3lWY2FlOGI1SGJXalFxRndPbnEwWWZKY0QvNkNQ?=
 =?utf-8?B?dHg3Y2djek1Ya0dYL0JmSy8rRkg0aThLRlFKN1FRVGdjRXB4UXpSY2wvek1Y?=
 =?utf-8?B?bi9USUlWNCtSQTQyMmJCYjhNOEZtOGpkcWF5NGkzQ2JoeXdrTUdNWWllSUlR?=
 =?utf-8?B?Q0tzdGlSeTVYVTZBajRQYmtvUmpnVS94VmRybENnRG1IUzhCNXV3cXBVVWN0?=
 =?utf-8?Q?Wpq6Qq9EkjHaf8JUO3J6X/ciF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a1931d-9992-4888-814f-08ddbab7d407
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:01:26.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuDfm8q6SHSv0T06NpByLfR0BY6bihqonGJUwv7TUz8sqe4yQrxdMYsg9bXtCbHHZzwG7ULOF9eZ20YHsNq8aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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


On 7/3/2025 7:31 PM, Kamil Konieczny wrote:
> Unify naming with Xe blocklists so blocklists for i915 will have
> i915 prefix in names.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/README                                | 12 ++++++------
>   ...st-pre-merge.txt => i915.blocklist-pre-merge.txt} |  5 +++--
>   tests/intel-ci/{blacklist.txt => i915.blocklist.txt} |  0
>   tests/intel-ci/meson.build                           |  4 ++--
>   tests/intel/i915_test_config.json                    |  2 +-
>   tests/intel/kms_test_config.json                     |  2 +-
>   6 files changed, 13 insertions(+), 12 deletions(-)
>   rename tests/intel-ci/{blacklist-pre-merge.txt => i915.blocklist-pre-merge.txt} (97%)
>   rename tests/intel-ci/{blacklist.txt => i915.blocklist.txt} (100%)
>
> diff --git a/tests/intel-ci/README b/tests/intel-ci/README
> index 07b32b54a..5ef2ee2d1 100644
> --- a/tests/intel-ci/README
> +++ b/tests/intel-ci/README
> @@ -30,16 +30,16 @@ considered to mean that the kernel is not obviously broken.
>   The results of CI runs on drm-tip and various other kernel trees can
>   be found in https://intel-gfx-ci.01.org/CI/
>   
> -=============
> -blacklist.txt
> -=============
> +==================
> +i915.blocklist.txt
> +==================
>   
>   This file contains regular expressions (one per line) for tests that
>   are not to be executed in full suite test rounds.
>   
> -=======================
> -blacklist-pre-merge.txt
> -=======================
> +============================
> +i915.blocklist-pre-merge.txt
> +============================
>   
>   This file contains regular expressions (one per line) for tests that
>   are not to be executed in pre-merge full suite test rounds.
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/i915.blocklist-pre-merge.txt
> similarity index 97%
> rename from tests/intel-ci/blacklist-pre-merge.txt
> rename to tests/intel-ci/i915.blocklist-pre-merge.txt
> index 0a1315aae..bee4a856f 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/i915.blocklist-pre-merge.txt
> @@ -23,7 +23,7 @@ igt@kms_pm_rpm@universal-planes(-dpms)?
>   # it is harder to predictably exercise the cache from userspace.
>   #
>   # Until these 8 tests are replaced with a kernel selftest and removed from IGT,
> -# let's blacklist them for pre-merge testing as they are responsible for a
> +# let's blocklist them for pre-merge testing as they are responsible for a
>   # significant portion of our execution time:
>   #
>   # - shard-skl: 0.1% (~15 seconds)
> @@ -96,7 +96,8 @@ igt@gem_tiled_wc
>   # This test is doing nothing more than waiting for the driver to be suspended
>   # before issueing a modeset. However, it never failed while testing for this
>   # in the past year, so we probably just want to drop the amount of rounds to
> -# reduce the runtime, but let's just blacklist it in pre-merge for now:
> +# reduce the runtime, but let's just blocklist it in pre-merge for now:
> +
>   #
>   # - shard-skl: 1% (~2.5 minute)
>   # - shard-kbl: 0.9% (~1 minute)
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915.blocklist.txt
> similarity index 100%
> rename from tests/intel-ci/blacklist.txt
> rename to tests/intel-ci/i915.blocklist.txt
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 4aacb479d..d18170402 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -2,8 +2,8 @@
>   
>   intelci_files = [
>     'README',
> -  'blacklist.txt',
> -  'blacklist-pre-merge.txt',
> +  'i915.blocklist.txt',
> +  'i915.blocklist-pre-merge.txt',
>     'chamelium-only.testlist',
>     'fast-feedback.testlist',
>     'fast-feedback-chamelium-only.testlist',
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 04bf1fa68..f77a4d46b 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -28,7 +28,7 @@
>                           { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
>                       ],
>                       "exclude": [
> -                        { "all": "../intel-ci/blacklist.txt" }
> +                        { "all": "../intel-ci/i915.blocklist.txt" }
>                       ]
>                   },
>                   "order": [
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 65d6eb07d..c13a5e0d3 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -21,7 +21,7 @@
>                           { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
>                       ],
>                       "exclude": [
> -                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
> +                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
>                               { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                       ]
>                   }
