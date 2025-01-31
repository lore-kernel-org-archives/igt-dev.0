Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA61DC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 21:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6717510E196;
	Fri, 31 Jan 2025 21:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUXE1ebO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C801410E196
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 21:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738359663; x=1769895663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RgCCP17T59orcvJTNi+oEl21qj7+Ta6ipOMgpN+P9Gk=;
 b=BUXE1ebO+bltp2xJ1FPb4Jd6lCjyMxfNmfmXN2JFyNdBVG4Ltpi8yNmo
 6tiKe9gOqVAF1HOtwa2gCCJmSxGA+Wm5LJbPqWrAnq763SX3LjR3QdDRa
 oocBY5M+A3fZPeO53okt6dr82HJkCqUXKEvc4Nh2tTBUxqW5NnF6xo9+D
 nR6nq/yS/W+8iO4wVIMrPoZrbA4ScQkQyTVyWut5ZI1O2QyfZPQM3uS/U
 W5EqGnlCuQOrdGProOvM6bAEUwmTMseD4tI0fNrDJcFr2dnk52O5NytdT
 6YxehpZX4QP9RCE9uCrOzVG23DkJs9kMoQERItVwS8NjDj/b0AoNY+Ho3 w==;
X-CSE-ConnectionGUID: KIwc10vSTLquzGlTauwbgw==
X-CSE-MsgGUID: +0O5vtavTdOKF8WtZi7ZxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38822840"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38822840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 13:41:02 -0800
X-CSE-ConnectionGUID: ul7I4NtERyy79j482MRq9g==
X-CSE-MsgGUID: gXDfqr9tRlS7ZycsTYdPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146926207"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 13:41:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 13:41:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 13:41:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 13:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG47ahnlW5ZeAsl4IOolltap/yaSmlCpsfrhlWysnsUgtDx53+ISDVWDThMkqiLIAGbiQ0IkG0DS/DaQnxASW1Ec2yjoGlMmaFCNSCOSSgSSGHX3nce25TT3zBTtG0npDskJz5x46SHRIygII2x4Q8RdumIMYf0HIzKXwQHgIhCkxy29m9WAJxAzLRbPxUtR4A/zcz9xz/1q/h6uxxG7Z18ql0XZkRKuEKaPcaP1+gEADz4MEOCNj5fdO+RwWnRffOwkVFsiRyDstXE9S46cRb1vNFLQ1EVO/yyZ2tmzZ0EydqCFh9ku2pQhNCYpMRncx165mf405nURU1ueitgZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsB0PIBZkbydw2RIWe92NhwYhbkjWtoorsIRMN5nqh0=;
 b=ohleGmGM6T6+nCJJRNHF0Cs/efRtKl7cR1tFTuz513lY19gEdz7HxM+Ujvb0dxpML7+xNK6sXJcHvzLtQKuzH0QMnrWqvToGdj6ZLXAQ+bF0fWeY+dmF9ra9YbROg9krkuh5VzUDe12wFwM32mlGsTR0+t3MKqsGaXOUX6waNcmy6qjblB7SpjaK7EYAJlx3t3/KNp8FU/VFb9Mk7kXT0NLkjvbfVvr5pkGac7/2oJJZLqHJ6VPSlOkXKOwfeiGhCTpAyKDJxl3pV8SoDIqRIg8PjeDbLa+r3l+spj8EyDD+AYcLYUnLxY5BhXbTkE0RDzMXCPDZENtVtjcPng9J6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ2PR11MB7671.namprd11.prod.outlook.com (2603:10b6:a03:4c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Fri, 31 Jan
 2025 21:40:54 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:40:54 +0000
Date: Fri, 31 Jan 2025 13:40:51 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/xe/oa: Add observation type input to
 intel_xe_perf_ioctl and intel_xe_perf_ioctl_err
Message-ID: <Z51DY2G10o_Ba5gZ@intel.com>
References: <cover.1735637542.git.harish.chegondi@intel.com>
 <e7b0c66e339243308f6072fd44f40afe8003a3e1.1735637542.git.harish.chegondi@intel.com>
 <85v7tuen8o.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85v7tuen8o.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ2PR11MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 889f517b-5bf8-464d-1481-08dd423ff05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1hUaFJ4K0lleU81bWQ4MWNPSDVzeFU5R2lyMllVQXA2VUxzc3FsYWs0TUp3?=
 =?utf-8?B?S0dIMTgyejRTV29EcXErbHF6bTlkREJHcWVmM3lvM0VZdDFyd2ZKZHJSRkpB?=
 =?utf-8?B?b0FyaDM1Qy82UXNFR0lZdVhYc1NyVWIzOVRYTnpWd3EvMUxqWkxrNmJCU1JR?=
 =?utf-8?B?UGFvS0diTUlVSTAvamNBLzhaV0NRT2ZZbHhyOFRBa1BZTVIwdVhqWEI3cyts?=
 =?utf-8?B?aGtneFpHMjdiWmNRSmZMWW0xd3dMMXZXOHJhclRsdCtzdVEzSWlJYWttWFc1?=
 =?utf-8?B?bVNMS1FkTWRLTWpFY1NlUWVnY1VPN09KR20xNVRkVllocERvTWxWTXhNc1JB?=
 =?utf-8?B?U1I3dk53dFkwWkVxYmVOMkp5YWI4VXdOTVhNVGl5MjFoUk0zNXFYUWNTRjkr?=
 =?utf-8?B?RkppQ2FBeVNKa2xHSkNwL3FZVTlJQU5URnpNMWpVSXBqZk5LbHc1eEJtUUFv?=
 =?utf-8?B?aVV4Q21HY0FOT1FGRGQvWHBUYjlmNnRSMEU2OFRSWGt3NlFSOWhHNWtkSlVh?=
 =?utf-8?B?Mmh2N0lWSWcrSnJ4UDJmUTloc2hicTExcVdpd083bTZIQTRibTNZTTR6Nmll?=
 =?utf-8?B?WGI2UlN1a0pna3BYQjl6K1YxdDNhZFZGK25zMytmVUZYUHJWUVVKTk9MZ2hB?=
 =?utf-8?B?b3gyV0cySGZKb2JheVFXd2tBaUVuRDM2OW5LSm8xaHZRNDJ2YkZOWExRdW9k?=
 =?utf-8?B?Rm16QXVIMFQwa0krNTJNUCtwUWorNkNCNHpxUEdUc1NTZE5ZbkIzRFVYZVA1?=
 =?utf-8?B?YjZpblNINnNSeW1nSWFFS3lqS0kzdmRxUW10dEtqY01RU3h6d1BZcUpKMmxI?=
 =?utf-8?B?YkppZTlXZU9qQkdRNXF0c1F0WndEMmkrdTV6Uzdxa1ZlSkJ4UFM1R1I3RVJi?=
 =?utf-8?B?bHRVZG1vRU1BemVaT2wwY1BKZHp0dVVydFRKcUdod2xyNUNYdytZZnRqU0k5?=
 =?utf-8?B?UHhmb0VBS1NGWHdkalFScHRFLzl3dzROVkJCWWV3YXpwOWFjRERET3ZqQTBH?=
 =?utf-8?B?TFFEeUVRRmxpU1ova3VnR0xDVkgvMkJLYng1dXA2OUlLdnlPOGw4QS81WlZM?=
 =?utf-8?B?REhVaEsvcDJhdVVmN3BjUVczalpkclpFNDJOUUs1c3dHQ2ozajc1Rjg2RWRZ?=
 =?utf-8?B?S0dKT1hmQkpKV1Q3ZjRmaXYrYmhEcVU3YjF2UExna3dXak9nTDZBdGQ3alBr?=
 =?utf-8?B?Uldncmp1SHlNSlN5UDlCWllZeDRMeTJmWi9xL3lYRGZkbnpjTjcvRW1VdXNG?=
 =?utf-8?B?b21Kb3dHK1J5Zk83RGduOWdMUTcydi9KNkRLOWx2ckNsUU93NVFLb3h2WWh1?=
 =?utf-8?B?cUhTNnkwNWlDRHJCVVBaVWZ2ZkUzaDA1RnlWTy8xRExkRnYyWHIrM1BMdDZD?=
 =?utf-8?B?cTQzdjJiZTNGdXpwbHF1SnVZRmpEWFptVmxKUzRaR1IrSWtuYUpOOVZiaUhr?=
 =?utf-8?B?ZmFFRWZRTm0wSWhUS3FEeDRsaFhpd3p4NlZqQmxNR1RpRUdyTE1kOFRldmkz?=
 =?utf-8?B?VGd4QmdmQVdCS3BaNW9kNEJYVCt4eFNNMzdzM041aEE1MS9JZ2ZrMVMxZTVh?=
 =?utf-8?B?b0U4aGd3aEYzMDArY1VDaEdPeTlpZXZGeXl3dENWTEtzS216QXlxZmhNQTJG?=
 =?utf-8?B?NDQvYW5zZTVNNHJraGxWTWY2VzdVdU0wNE1EZHBpdnArMUovWGJldUJLQTlu?=
 =?utf-8?B?MXlsVXlTTjNJUnJBNG5Ic1NwUmdkSmVzNS90Ty9zWWhrV0wxVXMrbzFTVU5m?=
 =?utf-8?B?R0Z0MWd4TzJQMzkzdmJKM1UrRERDVlU0SlFzN3pxUFhRbVNkamVrcmFjMmRp?=
 =?utf-8?B?R1R4K3NzeldtbDhMVktVN3I0L0xTcXh6dWY2Y3FPRGhEUlVkTWd6QWJlTlkz?=
 =?utf-8?Q?mlScRU3yMv0f3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alE5RmJ4bWI3My9VTzdBUlhjL0IyVGs3czRQS1RORnFNL1FyS0d4UXd2ZlVv?=
 =?utf-8?B?ZXdZOFFGbmJrMkdhMWtDOStRNFRSNFdWMGNUTVdaNzRKcjZsTGJFK3RtWjl0?=
 =?utf-8?B?cW9xZEVpUXJvRG5RN245d0Vjb2IxdURNK0xxblg3S3Rzc2xSSEg4Q1ozQ2Zs?=
 =?utf-8?B?dGIxWU5hQllPTHhBMlRLUDM2bWFBRkU1UGxaYWQ5MTFuMkRwWHpuWTY4eFhY?=
 =?utf-8?B?U0pqWWFScXZZWUh2ZXRmZlRCbGM0ZTZxNXYzUDBZMklTeXZNclVFeHhma3Vk?=
 =?utf-8?B?VjNFUTMzdVhGdG4rQUhyZHZ1SUQ5N1pUUDhvdzEvdFFoUHM0Y0RxQ1p1VEZL?=
 =?utf-8?B?ZnBCZ3VCa1Q0cnVFMmhrUnU0cGd0SDZRc3pFZTRzOEFsS2hsWCtwK3lveVdw?=
 =?utf-8?B?ZzE5M2l6V21uRFNzRmxvbm1UbVowVFdxNXA2YWU4RW93OU9SNmhuVWhGVTdN?=
 =?utf-8?B?eGl1YWgwYjkrZndlODhjUXpHMVNxRWdtOFNxZnorWFdIY1VTTFhPb1ExSUtF?=
 =?utf-8?B?LzQ2a2pyanVKbnZobHFQNVhCek11ZndycnB5U0pOc3Vyc1RmSWtPT2hOeDRN?=
 =?utf-8?B?d2NJZ1JkVVRhamhoc0NBUVFGbHZGU1QvZ2YwazBMVFpxRGFONWJzSE1CdXJq?=
 =?utf-8?B?ZEVtKzQ0VmJBU015by9zMkFRVVJwd3BnYkhoUDlCd2ZpTzA3Y1A0eXZ2NVFQ?=
 =?utf-8?B?SVVGUmFSeC9ZS3J4enNYS3cwVUcyU0pTZndTK1pBL2VIOEZRbnFDQVNTbUc5?=
 =?utf-8?B?SEZHY1lGUXhScEhtb2pucFh4NHl2d1ZMamNybVlvMkxjYTViUTVNbnZQRXRn?=
 =?utf-8?B?eDlZcDBBZWFTNkp4S3FvK3BsSGxWQnY3ZW5JcVBDUGlhdE81V1RGZHRpcC83?=
 =?utf-8?B?TTdEUkh5THpkdjNHcVpoVWNFWHZlNUg1RlVGNTBzbitPRTVnNGRsbzhya09r?=
 =?utf-8?B?d2xuL1Q3S1lqZXZCb2dhYXNWeTFQS1VvRytVZ1plTlZMUUk3UVZZQWphZXZo?=
 =?utf-8?B?MW12VmNQWDJNMGd4VHZQcTl5a0swcWJOaklWOU5qYkJQWk5sYUtzMzlUUUk1?=
 =?utf-8?B?U3hKemRVQmw1VVFmMVFQRXVZTkNrclA2bk14dGNoaUVqOGpxNW1la3VuZisy?=
 =?utf-8?B?eTFqQjBMUVBWYU1uemN3NjhmV0ZnNGRaakFhZWEyQzhHSmRxSnJvVmdkTGZX?=
 =?utf-8?B?OVN6ZkpBMzdGN2Q0cnVrMm9QUlhHMTlUTXpOM2pyUk56cHRGQjM2SitoejlN?=
 =?utf-8?B?VURzQlZGaFBIdjhjRUZrQVI4WFdZQzhxYzVxWG1NZzBmU0xob1c1blU5Mi9I?=
 =?utf-8?B?NzlUNkRKREJSQW9xcmpncXdLOStCakloQU1uUXhxZkJRNCt1VE1lYk9RbE1R?=
 =?utf-8?B?aE5GMy9EYmg4a1VURmpZdFpvdlh1VUtXVnpGNGR3TUpOS0EwOTBxNEszVDhW?=
 =?utf-8?B?cW9WVll3dWdkZ3NRb2VxVFcwSm5FSkZGbmUvaHNnTGo1SDZobDREWVYzWVVE?=
 =?utf-8?B?NU93QmNtdmpHTkYzRkpjVXJNN1g1VTlUNDRac2NtOEFaYkFxWWR6a1dZWWFC?=
 =?utf-8?B?VDA5aC9DRm5VanNwTVBWeFkzMVNRUncrUjBDcVRHMnhYZWl2Wmc4YWNoVWpm?=
 =?utf-8?B?WXAySEpVNGsvKzNDTG9ZVWFkZHB4OWRzNVlzOUsxOXZuZWxSaHAyU3BLcWxk?=
 =?utf-8?B?b0UvY0ZzMUJ3NlRsQ0YwOFUrVUNwV2t4NWs5U28yWDA5bXNyRnpiNmdRUlJE?=
 =?utf-8?B?WnRaZEkrdTF3V2l5VjFXYnJKL0NpdUdGTFJSZnR4YWVkRitmTUh6aTRURVBW?=
 =?utf-8?B?aXZuRnZqSWllV2JHdnBkQVl0cEVNcXBmR3RVWVpWdC9XSE5aV1V6SDBsWXBL?=
 =?utf-8?B?OXhXL0l1aWh5RTNDbS9DcHBoK1BYcDQ3eHFIMEgzZnNJTWo5ekJWSG1xa2Ns?=
 =?utf-8?B?SUNYK0IxSGZUb2hweG5Pajd0eGpUY2tzcUJ6OGdKcC9jUVBSN0s3eCtCK25i?=
 =?utf-8?B?MW9lTWlVdHA3a1p0bVFrQlV1TVhKb2R3YUZCbS9QMnpQa3I0RGFtZ0NkWDN4?=
 =?utf-8?B?bHEyWWVKanRacng5emNxQ0dzUUZMYTB1dm9acEszRENiV2pncVQ5WkJMb0Zi?=
 =?utf-8?B?MnBRRWptZW9yUnk3RXJvVkErdGN4bkNybkk2ZjFGeGFyZjlDaVhRRUZkTXJL?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889f517b-5bf8-464d-1481-08dd423ff05f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:40:54.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6MvqgRB2pA3DBgzW7+gGLasezKeJuGc4U8Q7a3+8AHlqMtSI/10W9hctHVhU1Vxx75nfwHJGELju6zUcp4I8EvrBjGaElIfsi1WU9ccbNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7671
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

On Fri, Jan 31, 2025 at 12:34:31PM -0800, Dixit, Ashutosh wrote:
> On Tue, 31 Dec 2024 01:46:28 -0800, Harish Chegondi wrote:
> >
> > In order to reuse intel_xe_perf_ioctl() and intel_xe_perf_ioctl_err()
> > functions for EU stall sampling, add observation type as an input
> > parameter to these functions and set the input observation type to
> > observation_type in struct drm_xe_observation_param.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  lib/xe/xe_oa.c                   | 18 +++++++---
> >  lib/xe/xe_oa.h                   | 11 ++++--
> >  tests/intel/xe_oa.c              | 57 +++++++++++++++++++++-----------
> >  tools/xe-perf/xe_perf_configs.c  |  2 +-
> >  tools/xe-perf/xe_perf_recorder.c |  3 +-
> 
> Why would EU stall want to use functions from lib/xe/xe_oa.c, which is a
> library specific to OA. Why don't you just copy these functions into
> tests/intel/xe_eu_stall.c stall, rename them and use them?

Yes, I can copy the functions and rename them. I just didn't want to create
duplicate code. I hope the maintainers are okay with it.
> 
> The functions are in the library for OA because of use by other OA/perf
> tools, they are not meant for use by EU stall.
> 
> So this is a NAK on this patch.
> 
> Ashutosh

Thanks
Harish.
