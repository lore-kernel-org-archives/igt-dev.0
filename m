Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998ACD2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 04:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536D210E1E7;
	Wed, 23 Oct 2024 04:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1Hmi0rN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF8F10E1E7
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 04:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729658860; x=1761194860;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IHDTaC79ehaK1MgDhKR1RqDhuQWmXA6GjKDHewQY55A=;
 b=P1Hmi0rNK2AmrFBt29XmDT6431gs3LeW6rMxDXvfd72iAHNenyUose3V
 YbMuaIWXgGxjXqooGp+lzp0lQjzRUk52leXbLnQhqIhGMspekoGkYzJ2b
 SlKtuY/phx60o0zsHe+t9WBq0UB/DEBbUZcZIo9FSXy2FKZgQ3EEtykaW
 4kCBBI/ZHv2YiqoPU1IJSxPJZEmYWea48VgTIAtOWfHe1eei4tgQ0gB54
 9chS1pu1KbCQ8cNojRLp4jr03msM8+0/plD6TK58qLetQvoBgNl5sJKZf
 n4LdQeTCoHibkEDkTefMpU6tnjc9ggQ+kNxmt91w/xAh86PgGXPkLWAuw A==;
X-CSE-ConnectionGUID: fDLIkF2ATXSAk0V6aq31Gw==
X-CSE-MsgGUID: c3Bl1bp/TRalhh+/AATvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29104334"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29104334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:47:40 -0700
X-CSE-ConnectionGUID: k7EvZhQ4RsqgcLYscaqwew==
X-CSE-MsgGUID: ygyasX85QsOFwqaXpK3aFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80151030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 21:47:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 21:47:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 21:47:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 21:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUW+5Ba89bTEck9KSzaOQORoVe/tXtJhiDYy305nyw/OWS+EF14IkOxeVioSOmQ/c+GfRUobrDAkwLzIFwdAcov97jMk/seeYDrEzkVmm9cW4eCxYsdULxrwp+kjxQKH+I6aeqr/yP0Gd7OQUKls8VL0q1/+q/8zyHDnGOzGevNeUAXoutxEZNYb3UIIpsb+9ECuQVAxK/Ara0VSdDQCLfmYDqZShfpcKHh+O3+BMPRfDYxxDDpdcSd6qndi6Qeuo/M8LWecrESNrJgd8boeNzfAxPgutiZIh9Zuadl1yVfpUs7hHIWncZ63s371TwF9IzlRcuCRK6KdAn90m9oluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JddWZPnbFfxAjk+xJqOSpVXNQok19senenQjHzula7g=;
 b=Ma86/W7SCtlMuDQ2lsrIqLpaSrKypoBpfr/VCswXKLvdJuYtaKSmCXzKCrzFxU9ztRFwUcmFClkn9ToOCRFVNhHvi0cG978KrsRivbB8iavctqnk2WhCHsW/AoBhNvtaq/VsDiOJJYPT4hLNV/qgm4Y1i/Vgbh4sbziKp5kluc/836n9n0Y+l9fudu8gfqMY3I+Anh6+wRtrcOmpMgdYNRIwQ4pCaa/oCA+D3J/BpJN2Rn/uVNtPr4rpm7rR5JuELySZxLxNWZniH/JmQ08KJbLUitiRWf59DeBow0loeO/7LivAwFt6qu5RpX+sGT/Ovygo1Wv/qVj4D5mJGEnyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 04:47:36 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 04:47:36 +0000
Message-ID: <c0f0a34d-9d43-4caa-bad5-829999eba93c@intel.com>
Date: Wed, 23 Oct 2024 10:17:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/igt_kms: Added func() to return scaling
 mode name string
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
 <20241018190627.1367970-3-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241018190627.1367970-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbd5ffe-6f53-49dc-05b9-08dcf31dd042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3dlNk9XYUlPYlhHQXgzVlAzL0MvREdIQkNwdmJhQWVKRmJpUVFWMGhlL1Q2?=
 =?utf-8?B?eWprdTdLRDlaTm1EWFkyd0RMb3UyUk1DZHNVM1VqbUsyWmhuekUvbUpMK1ZF?=
 =?utf-8?B?MklMOVo4NUloak1tdEZCV0o2dnU0Ykl1SzdTMEQ4aWlTNFlNYnRKWHEyc1Zs?=
 =?utf-8?B?SmJpdEdYQVFRWTh3RDJDanBHbW1PMzFCbEFYS21OVG1ZRnd3bU4wYUwvSUFu?=
 =?utf-8?B?RVNqWCtiOEdZazNjSW5PQlBQWlk2WWl4VTVGcXZEdUdQZU43TUhIUnhMTmc0?=
 =?utf-8?B?RG1IUi83aERiWndzUkZyMjZFQnVidkZxMG4wYkRwUEt3ekMwRXNzRzRpRysv?=
 =?utf-8?B?NHVwMzZkMzJyNS9kRDNKOE5PMS8xREliNWxuS29yNjlQZEVPclhqVkR0ZXZ3?=
 =?utf-8?B?OVFQWXVJV1RKem1qWVhMaXQycy9hQ1Z3V1YwM3JTbFdEZ3p1Z1JONXBJMHVn?=
 =?utf-8?B?eHo0Wk5OczBjOXZiSTZxL2twcURyTnlOSDkydnJqTFBrRzhOZ0wvN3ZUZ29r?=
 =?utf-8?B?dzhqcGVZR283dnB0TVRpTjBEdnBEM2pOUW8vSm9WcE92L3dBYktnMHd1VXpT?=
 =?utf-8?B?MTRHMloyM3A2Ynlaem93N0taWmxhTXNzOVc0M0o3SGZkck01S2xHREEySmlq?=
 =?utf-8?B?NWZvSlhtSHpNbzkwVnlpUC9ERUdhNXR4U2ZPcFdWb2JHdTA4c2o3SnRYT1hJ?=
 =?utf-8?B?Q1hlbUY0c2FvbEhCdkljMDlUcU00RGYyM1lkUUdsRzVoV3EyMDR3ejF0Ym5r?=
 =?utf-8?B?cEluUEp1RHh3dkxxSVZuVGd0RFNjWDZBQm80aExxeklGRVB4Y3NjZWJ0N0hr?=
 =?utf-8?B?a0dubjlRN1M3SllnTDRkOWlpL1JnWUJwUytlSWFBTmlEMk93ZlYvUTcxM1pi?=
 =?utf-8?B?ZHk3UjQwRmFpZ0tLdEhma29TZ3BZQjVtSWh5U2pybFhkdi9ndjdBSSszQjc2?=
 =?utf-8?B?WG5qUTBaZjdMc3h2NzNXS1lCSFBVM2txRXlsVWZWTEZ0djd5Skt5b085b3FP?=
 =?utf-8?B?Y0NjRkgzSkNuSlF2UnFQYU9iOE5UVGJIWVl4Zk82MmpYUm5FZzB1RTdwZ1Nz?=
 =?utf-8?B?c0hoakhLdnJ0MmJxU3hMTWFaRWtidmFIeE9ieEc3M3FLeXR3T0FTWHIxTWZH?=
 =?utf-8?B?MVBNNUpzSnZ5RHJ2MkVlK0ZPQmUxYkxJL2dyL3J4L1BnYlV5Ymd3Q3lnNGta?=
 =?utf-8?B?S2U2ZTBHUXlJcTR1RmpjZjFEaUZiV1RjSmJlYkhsaGszdkhwVEZ6ZUNHMkVv?=
 =?utf-8?B?eGUvdVZaekNhMm92dDBwZ0NydG5wZmpTcGdXV3F2OXl3Q3dRUU9INkE2YUtM?=
 =?utf-8?B?KzIwejdSNkhQeVl3SklNUFRMY0FnM24ralBaTi9OUHcvZExRSGZtN2dLQnZK?=
 =?utf-8?B?eUEyWnFVMVB0c3JGUlBUbnIybzJ4L2FhM3p1RzlmM1prbVNtZ2EzODM4Szlr?=
 =?utf-8?B?cGFjKzNYN2xpQUl2cWVrN2kyYkNTeGhlOWt1YmtCVGlqTUZ3a3IrMForVWVN?=
 =?utf-8?B?REhJRmNYYzE2UlZyRDNNSEowNThEZm5hK21KTmVNdTFwZUcwcnRMMTdVVTdN?=
 =?utf-8?B?TWlnZTk4Zk5LNTErZ2UwNzdKRlY1UmZLc1RPNzVQSWJyWEJOdEgwYmtGeFd4?=
 =?utf-8?B?RUo1YWNWV1BqL2hzMEgrTkRFcm44UTlRMkZtamFFcDFpWjRmNVEvZW13SUpJ?=
 =?utf-8?B?WXlnRVJLSnYwd1AzbjBhekV6WklPcWpwdUNiYi9CdDNERjluc3RHOVYxaHdo?=
 =?utf-8?Q?zvj2QM14lmUQIGSeS3OMJ/QiD9u3Ekz49lc3WZb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVUzRmRuU3JHTURWWU1ldHhtUkVBb1BQcTNaaUUzeFJsTXpXbDhlODBDcUVR?=
 =?utf-8?B?SENUSWlhTUZqQ0pwOHlLdkNPamtZTi9UMjFaRVlEZUpqdG9ES1Q0YTdhZjQw?=
 =?utf-8?B?ZFVjMWtzV1k4Y2NyUnhyWWdOdGZ6NVV2R202eGJ6UFhhRERzM0IzRS9Ib2Er?=
 =?utf-8?B?NVhPVjY2d3NTRUZMeG9vcWF3WVNZREVFVHo2R3FuQjgrNFRMVXJkTXh3eklI?=
 =?utf-8?B?R3prRHlqNnoyOFNReVRUZko1YS9UZTJnZjVuL1E2RVpzZmMxYlg2Wklya2Fk?=
 =?utf-8?B?OGR2NVdBeWZLNzBaVlo5U2NyRkNIS0swRUN3cFh0aVlYM2dhUTY4NTB6cjBI?=
 =?utf-8?B?eGhPOU5aR0VKREc3K0ZZTXE0SE1wdlBoWjhWRGliRGZNM0Q1Si9hSlg1VU5E?=
 =?utf-8?B?OS9BWGFwR1poQjJGRkwvRjNJSHVxSzQwcDhFSUI2ZTEzRlZ3RHJJVFZZMy9D?=
 =?utf-8?B?b3Z3ZHBHWEN6K3pWNk8ydUxmUGVBVGdBa2tJa3JHMWliMGVDTG12aEh0RDlU?=
 =?utf-8?B?cG9tZVpkYUhoN3Y1YjZ3c1dWelBabytZRUE4WnJpL0FPbndvakdvTHV3V2R0?=
 =?utf-8?B?QlZaeWZSOGNoNjFXWU5qcXg1dlByTHNCV0dhR3pkcHNkV0Vvc0ZGejgxMExX?=
 =?utf-8?B?aU9hVHZsSTBaWmJubUdvNzVLLzdzS3BoaXdJNnlEVmpQSzBOcjZSdkRyRGZ3?=
 =?utf-8?B?Z09ZZVZVVEdkVEg0dm5KaDlEVUdCM2hwYndXWlhhb01pMHJ1NkNvY3U2VnNw?=
 =?utf-8?B?ZWhtNzlpOGI4YkFPZFB2ZnQzaDdtaCt3dGlEQ1MrL2ZMeE1WOHQ4c2NoblY4?=
 =?utf-8?B?ZXIvOUdwazZpdk9NbWNDN2pmVGpuVTY3aHAzYlNoTWtMSmJQUkpOSjhJZGdw?=
 =?utf-8?B?T3FldEJIbUM2UTFOMHRmTHVxTUZiNHJCSU5tRDdydWhmTU10MlA2blNXaGEv?=
 =?utf-8?B?Z08vQ21TNFlzS2NwdmlJeEZPWTFoSThTUmtHR0FEdFNyN2FOS2xTWUxkUW5w?=
 =?utf-8?B?eElxVlovdlZMcGJkUFloMGtYTGx4aEU3VDFnaElzWkVZMVRUK05Za3JXUE1N?=
 =?utf-8?B?Z0VaZ2ZGSSt2N1lQdFJLcjQ2NUZtMXR4cVI2dm80ZkNuK0p2dElJeFZpR3RF?=
 =?utf-8?B?Sis2QmxaeDF3N0EzYTlRZ0ZlS1cwRi9uaFdpZTREdTRhdzhsZnFiaTB2NWhq?=
 =?utf-8?B?NkF5a3owaDhZWTJNLzhSckU1NUxVR2FJVEVIeTJFVGhIUG1oMXYxb2M4U3Fi?=
 =?utf-8?B?VTkreFdZRks4Y3FMalUzaUhOUDJ1Y1V2M3MvK3QwRVN1K3dWS0o2Q3B2VGpH?=
 =?utf-8?B?eisvZWo2blV1S0Z1U3B6TW5zNzJNaGtSaFl5YmJKSGF6bVJneDV4VTVDT1dM?=
 =?utf-8?B?RTM2c3llVzh3a2ZnZGdPN3doQ1FUUnVsRHg3Nmxsd1JCek4wb1FrM3U4OElZ?=
 =?utf-8?B?eHZ2dWxqeUpCQnVxelJES2FraVAvZ3ZHUDJIbXI2NE4xZXcwMVZBWXJlVEtC?=
 =?utf-8?B?ZHRtTFExRlFBWDVNbUNOYXFBRW5FcmtrZk1UMy9rZDRsZHdNaHFjYkFFQVNU?=
 =?utf-8?B?VDZKWllhanAxam55ZTA5QkpITnlZN2lRZXg5NnBmSTE5N3EwZU1TM1dyNFRU?=
 =?utf-8?B?MkM0VnB5WS9BRW83UWcvUjFoZUQ4Sy81OUpHMEFKMzc2TEJwQ011TURUaGgv?=
 =?utf-8?B?NWJXM2hOMERlYW9nb3owR3A5aGVjdlRadU0zdmlFUEgyck9zQlJKcFdzSC80?=
 =?utf-8?B?dE05bDBrdG1UOWJPSjRUM2g1MTBFTG9iUXJSMUpMUWxRTVNleXdsL0xJeUw3?=
 =?utf-8?B?cXU5Wmt5L2pVOGM4T0p2YkpiZHp4NVFzcFBxZUZQZkMyUHU0Umh1M3Zrc0l3?=
 =?utf-8?B?aGY5ekVjc0k2VStMdUw2N1hKNXE0WjRWa3RiUC9lRGppbm56SllES0FPa2I1?=
 =?utf-8?B?MWltY3ViWmZOYU83Yk0yYTBMNENRRk9ETXE0UlgrNDBtaXg4TTNXK0pQaXpF?=
 =?utf-8?B?aCtJazRZbGdBTU9lRExyMTNBR2hrNEN0TmgzZ0hRYzNOd2ZpNlZTb2t3OHRE?=
 =?utf-8?B?TnJmUHZDcjlES2VSZ2xqMEUyWThObVJpcUIwZU9GUi9yM0RGa3BDeDFOMnV5?=
 =?utf-8?B?Z25DdjMxQi9reXRsUDJPOGR0YUF3cllNVDRMdGhhdWh6RkpxOG4xV1VMUXhO?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbd5ffe-6f53-49dc-05b9-08dcf31dd042
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 04:47:36.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuxulD65PLHOhRAfzZmJ0iK5PBK9ucoXk6GIEuqRJxG6KgIcMtrffCcjcUOCCqX1kdFd38aq8Jm2V5Ojyu5PTSI5pKWu0eZWns0h31MbbYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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


On 10/19/2024 12:36 AM, Swati Sharma wrote:
> Added func() to print scaling mode name string.

Nitpick: use Add in commit message and the subject to maintain the 
imperative mood.

Same for previous patch.


>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 19 +++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 73b024e0b..08ad96d2d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1040,6 +1040,25 @@ const char *kmstest_scaling_filter_str(int filter)
>   	return find_type_name(scaling_filter_names, filter);
>   }
>   
> +static const struct type_name scaling_modes_names[] = {
> +	{ DRM_MODE_SCALE_FULLSCREEN, "fullscreen" },
> +	{ DRM_MODE_SCALE_CENTER, "center" },
> +	{ DRM_MODE_SCALE_ASPECT, "aspect" },
> +	{ DRM_MODE_SCALE_NONE, "none" },
> +	{}
> +};
> +
> +/**
> + * kmstest_scaling_mode_str:
> + * @mode: SCALING_MODE_* mode value
> + *
> + * Returns: A string representing the scaling mode @mode.
> + */
> +const char *kmstest_scaling_mode_str(uint32_t mode)

This can simply be int. find_type_name expects int.

Otherwise looks good to me. Perhaps we can also use this in 
kms_scaling_mode, for consistency.

With above minor things fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> +{
> +	return find_type_name(scaling_modes_names, mode);
> +}
> +
>   static const struct type_name dsc_output_format_names[] = {
>   	{ DSC_FORMAT_RGB, "RGB" },
>   	{ DSC_FORMAT_YCBCR420, "YCBCR420" },
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 9bba0924d..cc705763f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -142,6 +142,7 @@ const char *kmstest_encoder_type_str(int type);
>   const char *kmstest_connector_status_str(int status);
>   const char *kmstest_connector_type_str(int type);
>   const char *kmstest_scaling_filter_str(int filter);
> +const char *kmstest_scaling_mode_str(uint32_t mode);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
