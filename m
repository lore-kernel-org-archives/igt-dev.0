Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5A1C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 07:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4754610E486;
	Fri, 14 Feb 2025 07:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsbGty/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6010E486
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739517783; x=1771053783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sbMd7x3V/8RhrafWoXKAAihXzUFCFP6nk/DPWT9EG7I=;
 b=WsbGty/sinVXDlr1SlFjFXjPTErn63akVjscYt/RMrT6+oEnGLmbx8yA
 fy/tZFyHI5YACLNJWG34SLpCjHk4khQ9bsTLGHVO1D2YKSlvt0WOokSAZ
 FqWUP42dZ4VHjap842UY7BHv6J/K8wBUFrpHNUmRzIFCmiOVsWFmRmtAf
 IjcGPeD5ULMGxFtv5oraI2QeWweRwutqTjy2DfmTVk1w5vHMSFvvrV4sV
 3yshdyYsa6fSKcnsqbVG9lI6+QZvLE0Dw+4li+zJb7Wn7EWqKaD0iLwpU
 n/DqLSuirt85cLqlhihZm6dabHbi+7yNZumNWjwxO2fPthsOnSBmAVmZD w==;
X-CSE-ConnectionGUID: 5Qz2bHeMRaKpfWTFi4Yv4Q==
X-CSE-MsgGUID: UwWPeWWRSmqMY3MlH3rkrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50884181"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="50884181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:23:03 -0800
X-CSE-ConnectionGUID: UOd+FXbdTLqC9le0noc+qg==
X-CSE-MsgGUID: va9B7fk8R/+bpteb/wiKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117516116"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 23:23:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 23:23:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 23:23:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4JK2mRLkZdJYTRou+aAda+BzfuntQohBUHI9My0k4EgBQOT+Fa2UnW1LlYLAl+0ThG4MHNu26RAxc/wwH8dfqWxbPOQ00wCh961G7KHk01sQe7LWIKav4MbThRB+248gtEOzCZiacjcXoTXSR5jwOhbx0+/FkVnPwHTQKcbr4Az8QaNdPyfelDiP6SYh8QbfzObHgP4ZhAM3LSfHRN/Ms7g5auOxJTJFoDg4YPxB7Mgc+McH1MTjovObklgV93lt7E2oIRGjYUC9wenyx9yQHBq5b2WD+wFYuqZRZdB8xdB+fRMz6cNCCiBmtA29K4XfzPyBkRTlvQwY/QfMrQ5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4kIr+hHDSdxGgty4ULlrgDxQYJ1tCyHcKjm+6frPxE=;
 b=SDeYNGHkr3hXl9yhuihH6B5WNHAatci3N37Tj8YgWFCTcyLdO0p4xEK8zaG9169W1WMPiGYzhZN74on97hMLWGqxDZj0Mh+d6mVLuq1Iab90jzfQrF7/Mvej8vKqliZNAHWoquio68Xm5ELdUVmCvqtEq3b2JEPCx/maSUKO1vT+y0Kv0EwiQJp20TOPXKtJ2NLR43vvvTYiryCQ8NgHCA85YJtF7b4nqeclFZn7YikMeSZ1uGXhDL0GoHWr7zuSXevoyNXoZQev25dRZ009ve1VlK6DL1PmRMpFb4GbggzNpCUOxBY4bBKSsHGpZGfmSh+x4JMp7CmyFZvsnIjsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 07:22:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:22:18 +0000
Message-ID: <e9cf7cac-adf2-4769-b38c-cd6dc7e0547c@intel.com>
Date: Fri, 14 Feb 2025 12:52:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/7] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-6-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250211180542.1430676-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 386a2c5e-5dc5-4a44-b955-08dd4cc85012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUFDcHNIbHZiMW9vL3IweFNYSEVSMHMyeGtKbWIzUHptWXRSWTRzbmZjOWxZ?=
 =?utf-8?B?NVhmYWlFTkVvRXBEcWpURTVwcnJKZUFDSEhrNDRkM0k4UDBUWitWamxRY280?=
 =?utf-8?B?WGNiaWNISlRtY2RKdHlvRG1QMUNVczlQaGhLU2hBdCthbkV4Y0hwdnNOYzVR?=
 =?utf-8?B?S1lvOWI4WWZnTFhHbFRoanFKRWROYm9zVnE2Nm1rRFlEaW5oS0xDejE5ZVpi?=
 =?utf-8?B?V210ZW9DK2pBeTRIaTBWS2Zsa01lbFo3KzhEYXl1K00vTE1KZzMrcmViUFhI?=
 =?utf-8?B?VGpHTmphNlRqT0lwS21zRWNDczdSYnpuVWd6Vk5YZlJMaE05MUFPQk1ZeDZE?=
 =?utf-8?B?TTdtT0hIanNONlJQVFRwVEVCdmsrVFYvTkdMTDFPVHBHUm1VWG9jMFZOb2d3?=
 =?utf-8?B?NnBabkZOUVhPcm5BM0RSbUtHWDU4SlVtYVFqaURzOXFIMFR0WkF5TFlidEM2?=
 =?utf-8?B?aDVTWitDR1NPNCtCYjFKV3JobE5semNrbVA3c1IySmlnM3dWVmdBZldTVklT?=
 =?utf-8?B?RDBQaUVIYkx2SVNFNFRaQ0NQQzBweGZoQ2JzSmpOVEV3Q1M4MkRUK2R3Q2pV?=
 =?utf-8?B?Y2xtNHQ3bFRtUnRBTXU0bE13eVVOVkpHNmR4MHNSdm9UV1g5N3NsQ1JRUW1z?=
 =?utf-8?B?RGVIWGNvS3ZYRlNoMVJrM1Q5aTM5MkxSS2ZxU2dxc0RJQUFQemlGVmJ3ZE9N?=
 =?utf-8?B?UnZHL1hwcVhkSElQaUZ1WGYzNzlYS3E4TVJWNVpwUlNWdnRBQURJS00zOGgw?=
 =?utf-8?B?OE13enowUU1XcE1jVHAxUHhpcFhoZUdadC95Tm4rUmhUSDR5Y2wvTWI5VEtR?=
 =?utf-8?B?a1JPLytxNHN6UUhYd1pBN1hyL08wMHlLbUdaYUlTdVJqei9KYlpLamJNamJu?=
 =?utf-8?B?dFpFbGtjbFd0b2dGKzNmL1lHZ1NWTzRLbVc3RWdKcjdUdHJ6ekVNN3B5V2Jo?=
 =?utf-8?B?TjkxaGR1aTgrdElZb2JuRGs1MWU4UTJhdlFBbGpzUnhJOG5hMTNGRG5UcEtH?=
 =?utf-8?B?Q05xK1pKaGxJNTMyV0N3UXBKZVVoakFva3Fna2VOajRMRzFjc01kUUZpUW9W?=
 =?utf-8?B?UE5KQXpzQlA0b0xKQ0E0cEU0M3V1MURpWmZHeVl1eFFmai96ejVtbGxTczEz?=
 =?utf-8?B?T2QyODdnb0xMUFBBNEgrMjdrSXRRUXNXQ0pmUytnOVUrMk1wRXcyUzVRekJC?=
 =?utf-8?B?RlJFMS9DRXJ5em1xREtuckF5ZU1UeURvbnU0OXJwQTY3cjZlcnA2cWdWcFA0?=
 =?utf-8?B?ZjI5RGxjSmxyN3RxNDVkd1N6b2ZoUGJSNkg2a2ZFMlpwOVNraExoRzFCRGFI?=
 =?utf-8?B?dmdFV0syczkxeG5uUDNteGM1eG1uelRUcHN4SUpIN3o4OHdJYU5Pd2MyYkdK?=
 =?utf-8?B?K0FWRU1WaFYybHBMWUFENmx5ejdLZWFHZ0RoMGNSbmUwSXRZMHFOMFkvWHNn?=
 =?utf-8?B?NHlmMHRBSVZrY0xKbXR0NUYrUWpZWldjY3ZNaE9BSEgxLzF3N2NiYWpROWVr?=
 =?utf-8?B?S09pNzBPQlFkb3FNTGJ5U1N3di9MWnJaK3Q0d2t2QnlMa2E5NlJNajc0dmpx?=
 =?utf-8?B?eXNFRzVtSmJKZUhVeWpVcElSQXl5MVNTRXFnUUswZEFQdzRWc3B2RzNNR2FX?=
 =?utf-8?B?Mnh6SElaV0loNi9TYnEzYUtQMGxVN3dnbWxZZTUxd29iSDJyamp6cUVtS3Z0?=
 =?utf-8?B?aXU1eW1yWnd4ZkZDSHNPdHE1SGM5RjlTTmRtYlZyaGM4ZytDb3A1S25uRHp1?=
 =?utf-8?B?c3hMdjRqajdHcXZaZ3ArZmJXM3FhbU1lTDdGT0JFTHB5dkFONTZ5b3FrenlZ?=
 =?utf-8?B?Q09mMkVCZmVSK3JoZHpHbW5LWUhucUFFTjZPWjJkU0F3NUIySHBKQXRHMzU2?=
 =?utf-8?Q?Bs+KoatdbzS47?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtSOE1HQVBSeitNSFNkTVBGSzMvOHkwQkVTUDBIbkFnWnpIL2xSYzV0Q3o3?=
 =?utf-8?B?SU1oUkE1aFRWWWxUOW56c3k3T1U5bnVSTmthUmdJRHlEOTZZYUt1eitGdFk5?=
 =?utf-8?B?bXpyc1YwNy9ad2dLZWh3UmhtTld4YUZXQ3E5YkZWT0RGc0NmT2lsMXhjcnEv?=
 =?utf-8?B?eEF0cnFtbzhVVmhSa3UycTNFS2xvSGJkNzJMemhOTjdMenFEQU1EVm42aHEr?=
 =?utf-8?B?TjhQMDFCck9IM1FqM21hc3FuSnp6a2JhWjlIR09HbVI0QVpGejFOMm5FbmdQ?=
 =?utf-8?B?MjVBY3g2QU9sNU82djFEM0EyUXdrNUljMkJRMlhGc3Yya3R5cGFFUG1IcU00?=
 =?utf-8?B?MXNDUmNyK0l2Y3RURkdtaGNxTzNMYlphbEppbVUwMGV3OUdGenUwUTY3NHda?=
 =?utf-8?B?VkJlbzdtRnZJTnBkcEwwclh6V3I3UTNCODM0NEVkRExJYnFCTGZ5RDBWS1NU?=
 =?utf-8?B?cTQwdEQ0ZDEvUFJmaHBOY1ExSGExZjNYbkhpdzJwU29IMDRtdzF1MVNVRTBG?=
 =?utf-8?B?ckZDUzhSZFVWYnF1NkF3SDdEL29hQ3lqR21oSHl3LzR5KzNkWkNoYnVxdkxJ?=
 =?utf-8?B?eTlJK1F2V1dDallYQ2c2TTJUTitRNDQyemRvd1QzK3RzajYvTEVmVURMUDJw?=
 =?utf-8?B?V1pZZ1hKTEFXbnZXQ1BJTFpYZnpISjNIbFV1OWxTeWFUM1FDRWNlb1RDVVpO?=
 =?utf-8?B?L0NrVVVKcE5IR0FoNDgrcWVRbWFVaFBIdTdmQ3hpN1pEZXIzZlJkQTRnQWp3?=
 =?utf-8?B?KytZZWtHcEYzZjhVQWQ1REYwK1o1cHorSW4wZEk0aGtVRnFMeG9JZlF0Y29B?=
 =?utf-8?B?MDFUL3F5Tmo2alpEUXVvR255ZFFFK20xQUhBMThkQklCNXR1RlBrMHp0ekhk?=
 =?utf-8?B?Z0s5RzlxTU85SXBxZlVEcllzMlVqNUxUc1hxRjF0cHlSMFNKbk9BRXJhZEh1?=
 =?utf-8?B?L1E4S1dhcElzVjV3R0wwa2tRSUIzNUlYcnVxODE0bVN3QVBKMFdPZXNsclo4?=
 =?utf-8?B?VjNOajBqWDc1bkpHaXI3cmJaTXpEUXEwRzdiNzZZZDhHNGpsaUp2RXBpUGEx?=
 =?utf-8?B?b3JnY21NSEFveWJVckFNbjhlbFprQWJvZDl5MTJ4WjduL1lScnFWRE8ydFBx?=
 =?utf-8?B?R2cyL1hYUEt4bFkyY0hCU2l1cmV0YjIvdXhVamZ0ZkFoTmxja2paL242djMv?=
 =?utf-8?B?UTFSck5wNzdjWFJxRkdWd1NvWWV1LzRveU9QM0dGWGpPdkwvRHBRRW9TSmYr?=
 =?utf-8?B?dFNrNE4vMzF1bTBJdEEzQmJkVGZCQ3FMZEo5Wk9TbklCVUczK2U5SjNiaUYv?=
 =?utf-8?B?ZnZyRWdQNHhnK2hmK253UTJIK1R4Uld2b0FRK3d1bDErajUwdVdqYnFOcFpT?=
 =?utf-8?B?Z2p6WEtoTTEwOU82VVJ2WGxjK3A1YkZ0UmFiUzNhZWpaMWx0SGs4THU5TTlH?=
 =?utf-8?B?c2RwV1JySHZTa1h2M2JEQWNXMEZVOE5ZT1gxZmJhRmJJREh4WXM0SUY4SGc5?=
 =?utf-8?B?eTRQRExyWW1NaW5rSy9rRG5EQS9PeGRNMERPN2lBNlNxZ0U2M1NEREs1Zy9W?=
 =?utf-8?B?Z0cxSllUSFRSNk9QeTJ3akZUckpHcFVCdERoRWJLazFrdkJiczZmcFNRTlIv?=
 =?utf-8?B?R2RJaU83YnJhdU5pMmowNzZOSjdORUdYc05ZRW83Q3pwdFE5ZHpob01ab1JL?=
 =?utf-8?B?SlNlN1F2TmliY0E4dVJMandmNkVxckhSUzhlNGlUN3BYRDhzbGJwLzljOXNN?=
 =?utf-8?B?czhTci8xM25KZkRrTUhMOEpLalAzSzBWSGNPbkdWcnJhb3UzZSs0SEhydmtV?=
 =?utf-8?B?dmJRTXI4bnJPYkF3aEx2U2UxdGdxWHk4YUNNNnZuOXMzQjE5dEszNnlGVW5X?=
 =?utf-8?B?eVdTZE9RQ0YwMnRIekt4MUU2SDQveUVEUFRVekliVWVOZHdnUWJiOEQvMGdW?=
 =?utf-8?B?ZGZnTFdXbXJPaTlKYUpLRlhMbkxTMXdPWVBxOGJWTHNmNVNXQjdPU2FLUndy?=
 =?utf-8?B?QmJyTGhDeWVJWWxxdkQ3TUtET1hlSkt1aGJWZXhqcnhXekhMVHNVOStVQnZO?=
 =?utf-8?B?NVRRZEc5UVY5eGtnR3ZTV1BwSFljcW8vT0xpWVF6TlY3OCt3L1ppcUxuNUhp?=
 =?utf-8?B?TUxWNVR6YmcvMkl0QjVXcjdTSEpUb2QvSkt5NkJ5ZXFWOUxkZnJGUEg1b3Vx?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386a2c5e-5dc5-4a44-b955-08dd4cc85012
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:22:18.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMkOOx0Z3zwb5Wp1e1T/ruBmwo5JxPPCr7qqeK4rd9Y/ZkpRaidLupgj3t1wEELKKYKumSoySIRde2jy8MepyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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

Hi Kunal,

On 11-02-2025 11:35 pm, Kunal Joshi wrote:
> Add new dsc-fallback test to check whether DSC
> automatically kicks in while falling back to a
> lower rate/lane.
>
> v2: fix description (Swati)
>      fix indentation (Swati)
>      remove extra line (Swati)
>      make commit description clear (Ankit)
>      split refactor and dsc-fallback test (Ankit)
>      switch to igt_debug (Ankit)
>
> v3: use macro instead of magic number (Ankit)
>      fix test order (Ankit)
>      new line before return (Ankit)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 162 +++++++++++++++++++++++-
>   tests/meson.build                       |   4 +-
>   2 files changed, 162 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index c6e9fba53..d26e25bba 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -17,10 +17,14 @@
>   #include "igt_sysfs.h"
>   #include "igt.h"
>   #include "kms_mst_helper.h"
> +#include "kms_dsc_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
>    * Description: Test fallback on DP connectors
> + *
> + * SUBTEST: dsc-fallback
> + * Description: Test fallback to DSC when BW isn't sufficient
Please add functionality here as dsc.
>    */
>   
>   #define RETRAIN_COUNT 1
> @@ -46,7 +50,7 @@ typedef struct {
>   
>   typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
> -IGT_TEST_DESCRIPTION("Test link training fallback");
> +IGT_TEST_DESCRIPTION("Test link-training / dsc fallback");
>   
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
> @@ -424,7 +428,7 @@ static void test_fallback(data_t *data, bool is_mst)
>   	}
>   }
>   
> -static bool run_test(data_t *data)
> +static bool run_lt_fallback_test(data_t *data)
>   {
>   	bool ran = false;
>   	igt_output_t *output;
> @@ -462,6 +466,153 @@ static bool run_test(data_t *data)
>   	return ran;
>   }
>   
> +static void test_dsc_sst_fallback(data_t *data)
> +{
> +	bool non_dsc_mode_found = false;
> +	bool dsc_fallback_successful = false;
> +	int ret;
> +	struct udev_monitor *mon;
> +	drmModeModeInfo *mode_to_check;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int output_count = 0;
> +
> +	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
> +	data->pipe = PIPE_A;
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_link_params(data->drm_fd, data->output);
> +	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
> +
> +	/* Find a mode that doesn't require DSC initially */
> +	for_each_connector_mode(data->output) {
> +		data->mode = &data->output->config.connector->modes[j__];
> +		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &data->fb);
> +		igt_output_override_mode(data->output, data->mode);
> +		igt_output_set_pipe(data->output, data->pipe);
> +		data->primary = igt_output_get_plane_type(data->output,
> +						DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +
> +		ret = igt_display_try_commit_atomic(&data->display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +		if (ret != 0) {
> +			igt_debug("Skipping mode %dx%d@%d on %s\n",
> +				 data->mode->hdisplay, data->mode->vdisplay,
> +				 data->mode->vrefresh,
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		if (!igt_is_dsc_enabled(data->drm_fd,
> +					data->output->name)) {
> +			drmModeModeInfo *non_dsc_mode
> +				= igt_output_get_mode(data->output);
> +			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
> +				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
> +				 non_dsc_mode->vrefresh, non_dsc_mode->name,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			non_dsc_mode_found = true;
> +			break;
> +		}
> +	}
> +	igt_require_f(non_dsc_mode_found,
> +		      "No non-DSC mode found on %s\n",
> +		      igt_output_name(data->output));
> +
> +	/* Repeatedly force link failure until DSC is required (or link is disabled) */
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
> +		mon = igt_watch_uevents();
> +
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT, 1.0, 20.0),
> +			     "Forcing DSC fallback timed out\n");
> +
> +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						     data->output)) {
> +			igt_reset_connectors();
> +			igt_flush_uevents(mon);
> +			return;
> +		}
> +
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD for DSC\n");
> +		igt_flush_uevents(mon);
> +
> +		outputs[output_count++] = data->output;
> +		set_connector_link_status_good(data, outputs, &output_count);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		mode_to_check = igt_output_get_mode(data->output);
> +
> +		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
> +			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			igt_info("DSC fallback successful on %s\n",
> +				 igt_output_name(data->output));
> +			dsc_fallback_successful = true;
> +			break;
> +		} else {
> +			igt_info("mode %dx%d@%d still doesn't require DSC\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh);
> +		}
> +	}
> +	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
> +}
> +
> +static bool run_dsc_sst_fallaback_test(data_t *data)
> +{
> +	bool ran = false;
> +	igt_output_t *output;
> +
> +	if (!is_dsc_supported_by_source(data->drm_fd)) {
> +		igt_info("DSC not supported by source.\n");
> +		return ran;
> +	}
> +
> +	for_each_connected_output(&data->display, output) {
> +		data->output = output;
> +
> +		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
> +								 data->output)) {
> +			igt_info("Output %s doesn't support forcing link training.\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping output %s as it's not DP\n", output->name);
> +			continue;
> +		}
> +
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
> +			igt_info("Skipping output %s as DSC not supported by sink\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		ran = true;
> +		test_dsc_sst_fallback(data);
> +	}
> +
> +	return ran;
> +}
> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -486,10 +637,15 @@ igt_main
>   	}
>   
>   	igt_subtest("dp-fallback") {
> -		igt_require_f(run_test(&data),
> +		igt_require_f(run_lt_fallback_test(&data),
>   			      "Skipping test as no output found or none supports fallback\n");
>   	}
>   
> +	igt_subtest("dsc-fallback") {
> +		igt_require_f(run_dsc_sst_fallaback_test(&data),
> +			      "Skipping test: DSC fallback conditions not met.\n");
Make this skip statement as consistent to above. Remove : and full stop
Something like
"Skipping test as DSC fallback..."
> +	}
> +
>   	igt_fixture {
>   		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
> diff --git a/tests/meson.build b/tests/meson.build
> index a6f6ad560..95892762e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,7 +366,9 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> -	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
> +	'kms_dp_linktrain_fallback': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }

