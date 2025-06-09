Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B5DC5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 22:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636F410E453;
	Mon,  9 Jun 2025 22:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9i0tvHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D57910E1FD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749508999; x=1781044999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IKb0+AXVRe/FyUz/3NVn0HcSbdObAxN7Wqne6h3FKTs=;
 b=T9i0tvHJCIaghMndQNAhvuzzTJCYOUe7HMwNHqVmd2/vuCcZsps5zVkP
 B6iPPmRIhvvJs4XZyxcCZzaCLYFUTNelmv1gmM5dekTrtVX8cDDlobTZo
 1IrU+ULie7B3yC+/netT3KbPlytcQMsZcRsn1NXddnVrmpcjXCdyVsz0f
 AsFei6hWEmMJrh3AObl4lrFHhcoAspIl7vdTa5/kmg+ZP4BhdvpXxHC2K
 rUPTIT0vk3qWJ0wh7RoYDuOyh7WEZRUsAy8KESjidJePf/e0E6VHVmjQp
 Os9j9zEr0rEZRie+cewYaprhYe7SooI8PtNVeFg2+hjmu21jHTau4QDpR w==;
X-CSE-ConnectionGUID: wufmSoAfS6yEGCMwZZTN/w==
X-CSE-MsgGUID: Py//8GDbRb63/JSORVc7xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50708484"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="50708484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:43:17 -0700
X-CSE-ConnectionGUID: QxOgsYkXS3KcPqQwCZVZcA==
X-CSE-MsgGUID: ojRbPlewTVGcpEUEw8SpRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="147599803"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:43:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 15:43:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 15:43:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 15:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVtTU3VZCJjTxOeFcfp7U/6AMykMh8igJ2bleN9PSfgkcGzrJB/qeouf7k6/MaRv7kk03GO51M+1gYhVuyQs8/3eSUP9BgBOjNMutjmEiCKFr4jl6WV5JzklQItJ/RMV86ypoxOlXxW+lf1CQSok8xzDxT5HsfwEYsMsMXAxJ3PgM3tUDCS65LzUSCrdZa+SAcqDjZ0sgru0EtpxjyEzXy85osja9d06XN5WAnh2dFg9lz5U6OtET6n4k/W6ZY7+aUnpVwDKqxuyoxjP1sAngV/QKOwSOpndZ9iZ1Go1yFfrs2WD1eVJtaAGXbLS7xGQ+8t2SX2rrNT/76IImqJ35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzq8aQhn8WROaR5VwTMAdePE5yZtsKM8RpZzpHtJH8A=;
 b=OPeyizQrwL7af7U59gsLMfrcbE5GPZORixVSIbUa1mEV5uWzlsZTacbuGEUBm4MYqEBlPMqrZ8U8XgQ8dm7Xh14utGRhNPXKq8XS9/XRYxR7Pnmmr1ouFj8hdEnYE6yl5Bu649jqU/xDVPrIw5j2feC7EJ3soqebJ0I03NlD+2/7SzXyBvz+2xFpTqYlDEPZRMyOajQbPulIeSlblHMvoBB/3afg+tvdIckBaXN79+f1QQojYxXEsGDDR8VCK5OPPuxhFinVR0/YCrqvzjv0527G6mA9vwhfUwmMlHeWWrxdZP+IIUu4riWFaloXIHtJefQ3942KWWippZBpDkqPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Mon, 9 Jun
 2025 22:42:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 22:42:58 +0000
Date: Mon, 9 Jun 2025 15:42:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Test engines_allowed
Message-ID: <aEdjcGxXjGZ5okbL@soc-5CG1426VCC.clients.intel.com>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
 <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 9235de62-5469-46da-5000-08dda7a6fb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0QwdVphMGVIMnpGZE4razRrV01CeWpuTDVVWWNBdUF1VnhtcHlHSjFmc3N4?=
 =?utf-8?B?ZG9tR3R3N3RzVzNqUGZRa2lNMkd2b3drRmNISzgvbFcrSTdzMXNxV3E4UVRS?=
 =?utf-8?B?QXZmalJxekF2SjdGUkZhM0o2bC8zSmhmclVjOU1jU0FWN0pwWmtkU0JURnYw?=
 =?utf-8?B?TXFJMjRhZmJIQU1HRHR3ZmNWVzJOV2NETFg1L0pxMzNEUkhpTlpZSXdHT05R?=
 =?utf-8?B?cVdCNUNyMUVoUzRBYUM1V1psWEFSTUdFZW44VllsS3hGcVF5VUJkcUVhUUpu?=
 =?utf-8?B?ak81NWRxVWMrc2RLc3YxMitBN2tzZUFlaDJoajhrdVliMlNIbDJUcXdjd2Nw?=
 =?utf-8?B?cXh0c2JKZ2YwMVBBcGF3UlB5TTlZUEVBUlZHS04xV3ZZaDJMRTlXNEc5OVB1?=
 =?utf-8?B?TXZHNWhBZGtMbTdlQkpRQVJUYktTUkphQ3l3UytKUDcvSDg1TGdnSkJyT1ls?=
 =?utf-8?B?YUN3STIxRVBNSWlTVHhpUTgydEdkR21FYkNHQnFBSUNYTkh1cnBBMEpic0p5?=
 =?utf-8?B?RzcrOG5PcnFodGd0aFNxbUhuKzRBeC9qREkzeVRlK1VOTXZ3a3puTWVDUENt?=
 =?utf-8?B?Nzl5Q05NQTBNdDJYYlhLMGZaam9lRlJEbTQrYzNoMmYrV1BQakFwYzV0RjFX?=
 =?utf-8?B?SlBHNXVoNDNjUzhtQ3owVlFqV1JML1N1NTNDK2JDWVRLZElBaDNOZTdpQVJt?=
 =?utf-8?B?cW5EVndSNnFZVHN0RFJtL1FRdjZreFNyVytyVGFoeXpWR3hGZUxlU1Evbms4?=
 =?utf-8?B?MWF0eXBOdTR4eDkwUDFxYit4RkFwWXEvOG1sc29mbEN4Yk1xSjZBMUdVNmR5?=
 =?utf-8?B?N2hKRVNHV0VrN0JaUDNVWVVQZURPYTBkWTRjT2x4SUdvdERyM0x3eXVrMXZ5?=
 =?utf-8?B?ZTB6NEZQWVlLU0Q4eVh3ZGc4bHZDa3FGOUs0Y0xyOSsyenl1cDZQWGVsNkg2?=
 =?utf-8?B?R1NSa2I0a1RROWRPbWJRaG5ZbTNZaUNIR09LTkJHVHR2VGNWUlN4Q010dVhy?=
 =?utf-8?B?V3FFUTVSQTlDNmEzM3hvTjRwdThSL0tvSlhoUS85OXZuVmdua1dCbktHTE9D?=
 =?utf-8?B?S3BPTVBJM2lBL1Q2K1lQeExodncyK3dEbEJMclY4Vk4yckVhbWQzSFhGQmQ5?=
 =?utf-8?B?VTFweHMxQnV0Ylp5a2U0VVlrUGE2SkFxOENhKzN0OTNZb3FZS20yZWplN0lq?=
 =?utf-8?B?T0hhTVVoOFI2VE5FRTlSY2p4SERLVXg4eTVMczZkcHRxNm1vcXR2VGF4YTFl?=
 =?utf-8?B?QkdUcnhtbjdvMkV5bHlRaXRmSzFBZ3cwRXBIQURMUmtONUhJNmt6QjFESTRv?=
 =?utf-8?B?Nm9ZVHAwS0JBbExjQ1RhaS8vOUtuc0VJUWpjVmVIbmJwWnpOTVozTU5LcFV5?=
 =?utf-8?B?S1dDRGhyMGVsNHFDUXo2dkQwVlk3SXdGcHpEdDBHQjdpT00wNysxWHdmTS8r?=
 =?utf-8?B?K3VsWmhJK1c2MzBXN2FaWjlZTVBPQnYzSHYyS3NzblZpbWU1T2pONEhpSEdq?=
 =?utf-8?B?U3BCME13NzZaeVdpd3JRSVhhMXhZeklxdW9sRTNFbVk0WEVIdXJDanlXOHNw?=
 =?utf-8?B?Y0c5YjQ5emE1OFJISnErNThuNW5CdFZYOTJHTHFZRldKcVpyaEs2T2N0Q3BW?=
 =?utf-8?B?UGU4eUVoUGxNRGc2b2NremZwdE5keTBvK1pQNUJjMzI1WG9YVGpqVFVLdG4v?=
 =?utf-8?B?SnE5U1ZxUnRIbUlRSmdzRHV1cmdsSm1kOEZaZTdSNXVkZjhoK1gxMWRiNEpz?=
 =?utf-8?B?dzJHSjVYVVArS2NnZFNyNkJxN2VnRnBDeFJmZ3JMaHV6dU45OUdteTE0ckRp?=
 =?utf-8?B?bUtVWkM4Z1ZpaVJXOU9wOUlXR0hiNFBFMDlCY2R5bmtoWURvTmF1WlV0d1A2?=
 =?utf-8?B?aW1hWTQwLzlwNVQ3Sm5SMDVWODArcXhac0JkZTJXcXp0YkdpdmcrenBJaEE2?=
 =?utf-8?Q?qCtcuFkG3z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBoU0hlaFdON2dXRkw1NUVFRXgwNkg1K2xlY2k2VDZNdzl5SktZQkhIY2dq?=
 =?utf-8?B?NGZZYjZGZ1NkdXc3YjlQbmdTdGdUYUFlSlh4YldDVUd0ZEMxLytGL21sbURl?=
 =?utf-8?B?RjNzVnh3aVdPbjAxZWQ3ZXZiRUUwTkphblVHZmVtVlFtY2liNnRSUkJSVWNm?=
 =?utf-8?B?SDhhRTRhVUNDRDFxbFdvZTJ6UU1NRTMxVnJtVXJJTHZqbU84K0V6ZnJCV1Fp?=
 =?utf-8?B?bWhPTjZ1cVd1UUtMZmhmb0t1cEQxdCthNWRKSnFzdWtlVDY5SWZTeVYxWnRy?=
 =?utf-8?B?eHBGSW1Sdko2QnVTSGZma0tXa0ZMZmdObTU4YzRrU0thUE9jem5GVXB6a004?=
 =?utf-8?B?OExoQTZOVzMvMEtMRDd2WmhITTg5V2lLQ0VWandpSzVXNEZlM1gyNkhWblBT?=
 =?utf-8?B?NVI4SnY3RTBseWdEZklpVmZuZ25uNkZTRERBdjBob0lJODFieFRyOUZURlFj?=
 =?utf-8?B?OW9aNkdnVFRQRWFLM0Z3aEJ0ZEJaeTRNOHFZckhsOEhHUys5OVZjdXZ3Q0ZD?=
 =?utf-8?B?YTRObjFzdktIdHZGNTR6VVJTRFpXUFN0azVhMDg1UmN1L1ZJZUVtc0F3RXJX?=
 =?utf-8?B?OXIyOWVjMy9RT3pwTWcweWt1dk1JRWg2OUNCYTF5cmlKTytSMUlnOEJrYm5I?=
 =?utf-8?B?bTlYN25ybmM1azg0c09adERFRjVhbmhrbzdKQS80ZU91K053c2hKa2JiQ3Ni?=
 =?utf-8?B?R28wWlVTczFZWWk2bEVUTElKQUxKK2NzRkxxNzBic1hzU0gzMFB2WnhnRTNi?=
 =?utf-8?B?NFQyUHhwTWdnZ3U0dWFSQjl2VDlqeXNid0paNmF6QUttWEc4SFJYQ2lWK05o?=
 =?utf-8?B?NnBrc2pmUmg1YzAwL0E0eEY3RDc3YUlYWVp1UlM1U3h3YTBiREVDWjlWOFpl?=
 =?utf-8?B?Ymx0SERHbEdsejVjdHc0RUwveVo3MmY2VzZ5VGQ4Ly9VOUltT3U3Uy9HcHA4?=
 =?utf-8?B?a2NmaEU1MXRWS1NHR0RFaC95RVFmK2luVzJ2UGVBOTNVZHVncTlxR2pEMnlK?=
 =?utf-8?B?MXZyN283MUdBOEladHJkbW00aWNubThCbzdybXBCTytyUjFBOWVDQ2MvZWxT?=
 =?utf-8?B?NWNNUzluZHVxSEJBbTg4SjdnbGlhc3graWNKM1hiYXo4b3NYZCtEaUhJTG1S?=
 =?utf-8?B?QXZCeVZvYWEzcnQ1U3VsZ1VjMzZOaThUd0NwRzFRMHgySDZlTCtpaTQ2VnAr?=
 =?utf-8?B?ZWswMnRVVllNeGFET0cwVXNicDBtbmg0SEx1cGdUOVF1eTBpdlVOTlMrQm1Q?=
 =?utf-8?B?UnhpREQzN0VIaGszOE9SRTVQenBXUDlENk5Rd1FhcFJHb0JVZ0xRMlJkQ3My?=
 =?utf-8?B?NkJ0QTV0UXR3ZDgxd2k2Ym8zN29MRWNQNHU4SzB0czA0TDBlY1lzK0R4UStF?=
 =?utf-8?B?UWVNaFNCNkdGNUtYUGVsMnRVRHJTVFlWeTVlVzFjODJiSmFnL056Z1lrZ1hD?=
 =?utf-8?B?OWNUYnpmUnEzbDVQY3hJQjJ2Qk9BNFBjY1FyWU1NOHg5SnJzU2NicVh0aUkx?=
 =?utf-8?B?a0pYSGdkNXRZazhVWVlMM0k3TkdVelczd2I2WkhvbC81ZndPU1R6d2lTUEVL?=
 =?utf-8?B?dnZyR041T0lRaStNL1V2aEVNSUhQd21FVFdqMy9GdFVJQ0hKZkMrMG1oaExt?=
 =?utf-8?B?R3pCNTNYYXVLc2g5VllvM1A0cGRtcmJHZnUyZkJuSlNPWjg5Mktsem1jVHA3?=
 =?utf-8?B?b1dDT1JKZDd0dHJLY0wvWXkxYWN0S0R1b2M4NHYzWVV4UnkzYzhua0ozd3Av?=
 =?utf-8?B?TE5FUENpK2dkUlpybXI5ZHBybTlmcmdoQjJsaDBoNjdhOWx3WmNWVVYzNHg1?=
 =?utf-8?B?d0p2aWI3eFd6Z3BFRURHd0ZtTk0wU0gxblFWa0tvaWU4R09aOWZoZGRSNHdC?=
 =?utf-8?B?VW9YMEZJY3ZvWFl1amhEODEyMWdpYjcyNEVhMHF0cm9Rc0Y1Nnl3LytzWmtk?=
 =?utf-8?B?M0V6RU03bVJHeFZVRVNrczVoN2VQcVBsSm9YUUhyeGxOellld1RlZXM0d1Z3?=
 =?utf-8?B?SVZ0MFNoQXdXNWtiWTRHTU8xZHFzWGlqbkpXdzdBV1ZKT3hFZGVNa0x1bVlF?=
 =?utf-8?B?SUF3UW5UUFZVSHBuSzV1dWhpR0liWW10ZVFJR1JkMDBiMU44UktONUI2M3BW?=
 =?utf-8?B?MlR6b2ozQmRIdXlicnFBZTdMdzU2dWZKV3h1NjNCNEZXeFFmQzI2Rm9SMjBK?=
 =?utf-8?Q?ZUS9sq+1oTHsY0HYMuF3Axw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9235de62-5469-46da-5000-08dda7a6fb74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:42:58.4455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFcelOsn9lCv2+VarmLGxLeKH4i1X5kshQ7PaUYmvF4EMq6TYccNDlYrFKDm4q26nvL++jX6yt9QQhWkk+qj7AdE8fLSwtH7ls9omNi2ch4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
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

On Mon, Jun 02, 2025 at 09:24:45AM -0700, Lucas De Marchi wrote:
>Add tests for the parsing of engines_allowed configfs. This doesn't try
>to bind the driver and ensure only those engines are available. That's
>because the engine uapi instance doesn't necessarily match what is used
>for configfs configuration. Maybe we will need an engine map in debugfs
>for covering that.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_configfs.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 56 insertions(+)
>
>diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>index 074cd04d9..e4fffd0b9 100644
>--- a/tests/intel/xe_configfs.c
>+++ b/tests/intel/xe_configfs.c
>@@ -10,6 +10,7 @@
> #include "igt_fs.h"
> #include "igt_kmod.h"
> #include "igt_sysfs.h"
>+#include "xe/xe_query.h"
>
> /**
>  * TEST: Check configfs userspace API
>@@ -54,6 +55,49 @@ static void test_survivability_mode(int configfs_device_fd)
> 	close(fd);
> }
>
>+/**
>+ * SUBTEST: engines-allowed-invalid
>+ * Description: Validate engines_allowed attribute for invalid values
>+ */
>+static void test_engines_allowed_invalid(int configfs_device_fd)
>+{
>+	static const char *values[] = {
>+		"xcs0",
>+		"abcsdcs0",
>+		"rcs0,abcsdcs0",
>+		"rcs9",
>+		"rcs10",
>+		"rcs0asdf",
>+	};
>+
>+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>+		const char *v = values[i];
>+
>+		igt_debug("Writing '%s' to engines_allowed\n", v);
>+		igt_assert(!igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
>+	}
>+}
>+
>+/**
>+ * SUBTEST: engines-allowed
>+ * Description: Validate engines_allowed attribute
>+ */
>+static void test_engines_allowed(int configfs_device_fd)
>+{
>+	static const char *values[] = {
>+		"rcs0", "rcs*", "rcs0,bcs0", "bcs0,rcs0",
>+		"bcs0\nrcs0", "bcs0\nrcs0\n",
>+		"rcs000",
>+	};
>+
>+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>+		const char *v = values[i];
>+
>+		igt_debug("Writing '%s' to engines_allowed\n", v);
>+		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
>+	}
>+}
>+
> static int create_device_configfs_group(int configfs_fd, int fd)
> {
> 	int configfs_device_fd;
>@@ -88,6 +132,18 @@ igt_main
> 		test_survivability_mode(configfs_device_fd);
> 	}
>
>+	igt_describe("Validate engines_allowed with invalid options");
>+	igt_subtest("engines-allowed-invalid") {
>+		igt_install_exit_handler(restore);
>+		test_engines_allowed_invalid(configfs_device_fd);
>+	}
>+
>+	igt_describe("Validate engines_allowed");
>+	igt_subtest("engines-allowed") {
>+		igt_install_exit_handler(restore);
>+		test_engines_allowed(configfs_device_fd);
>+	}
>+
> 	igt_fixture {
> 		igt_fs_remove_dir(configfs_fd, bus_addr);
> 		close(configfs_device_fd);
>
>-- 
>2.49.0
>
