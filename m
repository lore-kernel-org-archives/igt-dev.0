Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B1C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 10:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153C10E012;
	Wed, 31 Jul 2024 10:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnrXsT7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DAE10E012
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722422219; x=1753958219;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+qcckbINNMNvYqKwZZudqYX9LbJHs+SxDndx7ZDs0QA=;
 b=OnrXsT7fOL9ND+Xg/LJBETDbB9GcrB5NBmoSsWSYgmrAwfIsEsXdTyWo
 jJNAmrSKsYCke153BWPJ5Im4O03Fnynwlw/eLf7nD37dRe2yoAo7EIyJ8
 NZpIq/2qG1o415sbNsuXlE0/JzEPh8G3K5sS2N8Y484jmy0UvUjwMcgnz
 EMX9kum0Pz4pb6hF8o8JCqxwnrf4oMlizgn9JKSEcxse3v5bxGzATynPq
 ycMpyK1FUb1yRUsnAl6tDdtLhkiUn89v72QaLX+uNedJssuA6wAITUL1O
 5E2cJI8zFDKfw0AjZexivqgk5kjuBsxzxAij5JaRJ0zzcyMI/eraomvqF Q==;
X-CSE-ConnectionGUID: K0HjMqqsQvqg4N8KH/xi/Q==
X-CSE-MsgGUID: 2s24UJcWTyO5vLhGkuHz/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20415360"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20415360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 03:36:58 -0700
X-CSE-ConnectionGUID: 3KBavHJjSX6GB/M7BgEhRg==
X-CSE-MsgGUID: j9zG1jMRRr6QI+eoS8rgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54535305"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 03:36:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 03:36:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 03:36:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 03:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGhX/XJH1Q2glwPpm852Xgk2JeaOwloUaSDV1eFpMGld4LEBJVibfQadiS0Wgq2npGP7CdDrwVvwINsP1o3qrNDqvlDTFPNH2TI11KNYkubsuKtZimr7svEUv1+9pU7gj4Kinsdt2MzRbZwbx6ivwCLAhJ+LuLKiSZpYz+vtNUSMFHROffJcLKc+le4LvXjInWuuxNMnv1sKN5Z6UXHDR1/7ykgnSSxY7w4hlzOTexbM+bs9YRk9wkmIJrmEKUeI2LZ1I/W3lYHMznjyaEebY34qQQ2JgGGPYpC8aDvEyZvGaa4ZfjRe/ghYOksRnwvhQAx1qNKTI4Ur9wrq7i2qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEX1Unc2GNZ+5ELb++kt17WUs8/0sUEuUDYgBVP1CE0=;
 b=apNOxXUDQff9J3+kbJuL2DOVVWsXwC8PDzAQySlsO18Y9hPEvlrbEkEotiiNgfIw4znDz61SniK8qcyXLykxWjHrapp1m72Cx3Dlmf24DQvinWla4eMNJqqiSP0KPk8ETwaOA32oqm/yqPATUsSXzQL3r7ezEyEp2FaepLfNiiF7STcDJ04LLtN+DRaW3gTk8FhnLeGQbJ5qMpEnUpYHlewvXBCztz/m5e0lVey3zq2zlZ86vQB/gHiTnbqSGG+M7UkVtMHrd9HVV5bs/pmnZFRmON31qGqrThFyhW1XfzXOn6aKP+oCCJVTXGAGGd/NrXmGtILyI/SkZogRHoE1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 10:36:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 10:36:55 +0000
Message-ID: <122f5ae7-9b39-4e8b-9fe5-2ea57f72cc4f@intel.com>
Date: Wed, 31 Jul 2024 16:06:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: Add a wait after gt reset
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20240730115058.1104767-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240730115058.1104767-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d86a9d-fcce-484a-c753-08dcb14cb246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uy9Ua2x3aDRZb0dVK1R1TnMxZ1dvYjZTNFRodFFuTC9rUDNtNVFtb0pWdm4w?=
 =?utf-8?B?NFhiTlZTV0pPSXZhSGN2aVVLR1lUNW51UmFTTW94NldWUVlQV044SEtody92?=
 =?utf-8?B?QnVaeXREMU85YWlaajNkYmUyTVp6N05BR3RYbndKOUZUVFJnK1RnVFNITWlM?=
 =?utf-8?B?dHNINlJPNnhCSHF1aG8vbkdHS3FleEhjeVB3bWtRTEVKZ1lHQnhTUWhPUHd1?=
 =?utf-8?B?RC9kdzFZVDVaSFFuRUdiMjJYcWRmVWdPUmhoRFNIbWdUSE82NGRycUpCSXYy?=
 =?utf-8?B?cmo3enpsMUt4S3BQVzJnNUVJckNWOE1idm5oQU9ZTUhRaVMvMGRIMUJRT3lQ?=
 =?utf-8?B?bUdscEl3MjZWb0pVZzJzWnp3REJxSk5ybTZtY2E3elZkZHkvYXlhYXMreWdK?=
 =?utf-8?B?Wjg3ZGp5UVFLSEh4U3h3amh5Qk1aQkJWWXhpbGVEVE5jRjdEWERJb3M4Rm1W?=
 =?utf-8?B?a1RLQVU1TDl2bzROQ0IxZ3c3SFEvb0pHc3E5SDEzTkovYjg3MVpFMTJYRnBZ?=
 =?utf-8?B?QzhNMlJkSEtKanRlRUh3Qllyc3hZMDY3N2IvSFFoMTdUeFo3VzFzQ1FJSXcy?=
 =?utf-8?B?N2VPdjdxbDFEMFFIUWo1TzNvTWtQaEE5dXFlaWZPR2J4c2Z5NjBLdjVCcUUv?=
 =?utf-8?B?c2twZE5ielFwS2ViZVh4Z3E1YnNJV1k5R1NQbHJ0Mnc1QUhWYzc2V3BxWFF1?=
 =?utf-8?B?OXZObVlTYUNWU2Ryb0RaZGQxNWN2OWhrSUNtNStEN21GMlYyaGRiQlNrYi9l?=
 =?utf-8?B?OHMycHlQMlNIQXpReGpFcEVlSkppS2lqMXdHV3IyK3V2d2hyM2h3OXMwT1hl?=
 =?utf-8?B?RHBjTXZneWVEd3NnbXhyUGtFM2lSQjQ1cFRneWdZM0VsZGlrbEtHTGxnaWVk?=
 =?utf-8?B?Z2dGRGorZk9pUHlOdkczKzkzRFVxbXdOL01vOVZYUUthMVNOSUQ2c3FwT0ZP?=
 =?utf-8?B?dmRqdnZuYVZSSGp2d1AvSEF4M2xkSFo4dlNyRmpldy9zeEhYbXpmTVgxeXdq?=
 =?utf-8?B?d1ZhejVoNkdWWkdJQmFiWUlzL09xQVZXUU5NSUZKTWxLVUdBMWxwVk1ZRFRk?=
 =?utf-8?B?ckNpaGZ2S1Fxc1RNZ3UzSHYrdkFHaC9aMUdRMHVQRmVQN1ZCUUZiTnlhVFJJ?=
 =?utf-8?B?U1lPdXFkU29uR1NGVnpmd1dtakV0cGhHaEFNcjUxbS83UGtoUDloVkxZaWNN?=
 =?utf-8?B?MDNjNlNFT1JWMHI3WU9KRnVDOXdKcTZXS2dnYWxQZld6RUd3bTdpQkUrc0w0?=
 =?utf-8?B?aXpBc1RFT095cEM4b2V2ckNRNHB3R3dVMjhQZjR0a203U1hNUlBSMVVPa042?=
 =?utf-8?B?aUhJdXBMVkVwV1VhWFd5NjFSdDI0TEtyTXdjcTUzSGxDcm5pbWxxbTlwM2Jx?=
 =?utf-8?B?RFIxL0YrLzdTTEIwZ3Z0ZUk2V1M4UmJpaWdob3NmZ0s4a0pvSlhxV2FaQ25H?=
 =?utf-8?B?N3E1MGdRaHpwSjE2R2FySk9JNzVJcVlUUXRRbkhsVDEzMUMxZ1NISXFyaWJy?=
 =?utf-8?B?REtUMDhRVjhnTlVkQ2FlYXE1cEpzS1ZBUGpJWmFGdUMwQ0RySmZ5anFsVWkz?=
 =?utf-8?B?Q3pxNUcrdWRhZk90N2dTQllCVnA2WThrZHFaUzhrVUI1VGxobDhwT3RiYTVv?=
 =?utf-8?B?cUR1UTNWK1E0NTFEZkY5cjVJY3pXSTNBa2w4a29CWittOVliZ3F6cHlWZ0FU?=
 =?utf-8?B?STRVd3lKZXVVMEJlejlFR0M4ZWN5U2pBcVFraHFvdXREcGo4c1pkdkxWVnpY?=
 =?utf-8?B?UnhuTkhEbklOeVowci9yMDdPTDhIZlJ2UUdYSUIwL0pHaVBDeXo4S0s3R2Uv?=
 =?utf-8?B?T3V4WlQzTTVSWkhjLzUxdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3BXTk9Xd21heGgxTCszNWFDWUJ2dGg0RU84RVFsK1Qycm1aaDJyL3Zlemh6?=
 =?utf-8?B?cFRZb25GRzlmazUrMldjVGZkSjgwSGxOc1hNcjF5L0JML1RRdHFRajRMV2Vl?=
 =?utf-8?B?eDdxWWp2dUo3OEEvcmQrL21MTURZOC82SUxxdzZSZ3VaNWV1eXZmSjJMNDYw?=
 =?utf-8?B?aytKQTBTWUl1dXpWTUhjQ01BVE9vQWZob08vYkU4Y1lBeHNlNjZIT2VZMlRa?=
 =?utf-8?B?N2FaMGVnWXZEeGRGMnVET2ZucnNWTTVsbUtOOXhlU2dyTEJSM241Yzk5VGY5?=
 =?utf-8?B?QlUrd1RZVkVHRXpuaUZTelF6TTVzNGpuNnlra01salNhdG9aZHVVbGd2Z0ND?=
 =?utf-8?B?MUdkWms5SFNPbkFPZm5oRVI0ZktkaFNZRmw4TWZhOG5lWFQvRVhTVzZjYkJK?=
 =?utf-8?B?anVPQnhLU05iNmdwUUZDbjR6SGkxenl1TXhJTzBhb3N2d293cC95R20veDZS?=
 =?utf-8?B?RU9RcGJlRTRBMDJJVkZ4bGpsWjRZTFFjNXp0ZzVSZzc4dFpyVlZWT1kreU9w?=
 =?utf-8?B?azFkaGlwc3hpaFpSelZhTVFaalpDcFdnMnVESGp5NEZGU0VRQ3RIQjcreFlW?=
 =?utf-8?B?Z1pVay9VZzNZbTlJYWFKZm5ERzMydTF1WkxSSm05UHlheHZPd1NHRzlhaE93?=
 =?utf-8?B?K3FVVjdVOFZkSUNaT1BQeUNKUEcvWi9iSUd5bzJMSG9lOTJBYUgzdEVNZmNv?=
 =?utf-8?B?bC8rTFNqUk96QXJXWFBicExlTUJ0dnd6NDNNU2pqTk11RW05RVIrVmZLaXRz?=
 =?utf-8?B?a0NZMDhFVFJDUVZvbkJUQzRFOVp1cGdMcnRwbWRGWFJhOTZ4bnpxb1ZJNTFp?=
 =?utf-8?B?citjYm13OVkyc2xsZDU2YUVaSHErb2hiL2pENldxbFRTUk80NUJjSTQ0Y0cz?=
 =?utf-8?B?WWsyR1BsWWpJUGt4S1NFbXpCZ212SlRIUU0xYTZ1blJEUjcvdll0cDNGSktv?=
 =?utf-8?B?TVJqWFhtTTQ1NWlwTWk4NGswbEJIUzQ5d0x1YkJEY2huQ2dSZUQ5TDRHZm5I?=
 =?utf-8?B?TmdRSVNoZ2FFNEZ1d0hORjd1ck9QNlhteVFRZGdjajYrQ0dzVlR5Q015VlV0?=
 =?utf-8?B?am53ZERMS2swQ1hGM3FmL1FaOE5IUUtHMERTbkIzeXZvbzhQZFd0QjU5UzE0?=
 =?utf-8?B?bEUwTElQOER3U0wvaGdCSEY4d3ZMcFJ5TEhHamN1ZXJ2bnJUZkJSSUl2MG9j?=
 =?utf-8?B?YmFhVjU2S0JXMW1TbWN6OGp5SzhuSTlWOW5oZnAxcGhKSm5pQ1RLT0F3WENy?=
 =?utf-8?B?KzVpeFIwaU5JMi9WSGRHU3EzNCs1ejZ1eSt6U1FMUzd5eVpJSkZSU0FjK2h4?=
 =?utf-8?B?YVY3bXhXYmNzanBHR1ZIRDJtMEViUlc0azZtcVA2R2tORE5UbGp4bFdoejFz?=
 =?utf-8?B?Wk1XLytoL2lraWcybnIvQzZIQWhNK0I0TVNpRzlqWnlZazVGQ2RydDNRU2N2?=
 =?utf-8?B?dElEbXZVRjVXUmNyZmY2NlhNMTZkY2c3OUZWbnlGWW8zRXFaQ0paU240TGJ4?=
 =?utf-8?B?YXVrTi9hL3NVZ1lqazdQTHpmNnEvc21WVXByeC85bXdLQWJBeDFZMVRzMHFE?=
 =?utf-8?B?eVQ2c1o1UjMvQTd3MzhjVVhIbW4wN0QweDQ4NnBHb2V3SnprN3lCdlYxL2xz?=
 =?utf-8?B?V25oUFpwWFFlQm53TlhpcE42UUhuVERYUVpMQWp0cXFHcCtSK3Jxbm1aOXhF?=
 =?utf-8?B?cDB1K0VYeHh0SUIzZDg0T3ZmeEhyK1kvNEY4aDRSUDhFalprNXRxU1hhY0lP?=
 =?utf-8?B?MUVTL1ByL0hxZ0VKMTRRb0FLeUhGQUNkcnZTUFB5UWkzWXNLcVFxcDhyenhv?=
 =?utf-8?B?VWpZa1Z4UGxpL01yNzV2cHdDVldWZFB1Z1c1a3JDMGF5MDljMk9ROGdKZ1Rj?=
 =?utf-8?B?S3JJc1FOTHJJZmEwLzF6bDVxWE1UMk0yQSsxandyQXp0U2ZMRU9naUNJblMv?=
 =?utf-8?B?YlBGZGIrdU1kTFh3c1cxdkp0UFZzTVM3ak5YSlJpUlZGZHlyS2lUWnBLeFpV?=
 =?utf-8?B?M3FtUHhhcUEyYTl1R2JmSDVZZHZGdFI0UDVxREtzNDhxYWltbVl1bGNHREhw?=
 =?utf-8?B?SVN5N3RSSk9zb28yOXlrZTRkZ0N3MWVQcnU5YWhyeXg4aGpiQ0ZiTjJ0YmZG?=
 =?utf-8?Q?3+Ue0EoCdWsGZqQQ/M+uAvgMl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d86a9d-fcce-484a-c753-08dcb14cb246
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:36:55.0644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCvVzrnHXIT7J3lB2JjtXo/j6Wn+1WE35dSxH1t/LonJJYuujzLvXeGkqINAfulNYcn9AAT7tMslBe/SWJ4yPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

Hi Karthik

On 7/30/2024 5:20 PM, Karthik Poosa wrote:
> After reset min and max takes sometime to get set to rpn.
> So add a wait of 100ms after gt reset before reading
> min and max frequencies.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 93ebb5ed0..718f720c0 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -33,6 +33,12 @@
>    */
>   #define ACT_FREQ_LATENCY_US 100000
>   
> +/*
> + * After gt reset, min and max freq may take sometime to set to rpn.
> + * So adding a wait of 100ms after reset.
> + */
> +#define GT_RESET_FREQ_LATENCY_US 100000

Both ACT_FREQ_LATENCY_US  and  GT_RESET_FREQ_LATENCY_US  are same values.

Why not rename ACT_FREQ_LATENCY_US to LATENCY_US and use that instead?

Thanks,
Riana
> +
>   static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>   {
>   	int ret = -EAGAIN;
> @@ -318,6 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>   			     "Failed after %d good cycles\n", i);
>   
>   		xe_force_gt_reset_async(fd, gt_id);
> +		usleep(GT_RESET_FREQ_LATENCY_US);
>   
>   		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>   			     "Failed after %d good cycles\n", i);
