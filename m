Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16B4D68BE2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 06:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2FD10E6B7;
	Thu, 18 Dec 2025 06:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGj4vYnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FD110E6B7
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766040067; x=1797576067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gKSqnhBKfG2Lx7hWjp05VOYyJV6zekNRE+VffwP8vB0=;
 b=aGj4vYnbJtPSAiCvLZl6MKwCDWmBeMBx7LgPa/U6VjQP34JJNEoY1v/k
 KjvM+La7iC6rY+724MhYS+pUJVAtygeQNv2ycAnlIaCD9+R0IB4k5sxlH
 WEcaUyXtgUG1NvuaTiYggQnKb9trQV5TA0jybG3wyieWTDELReNf/VoX8
 uYKQh6Z6VqDj815YUiR5pMwwUeeaqwpFvMhGKfLO2ueCnq3tFG8npb12p
 6a4WIH6UMiTFAmqiOgmqjpEd+UvIIf7qjmbIioT8pa5p7XnWRMZcKHGOT
 Dpah618bmuJA7Lu3Xh6wjPrgVS/Ff/TN24GFMhyTjGiwul9PZ/g2pEkwu Q==;
X-CSE-ConnectionGUID: 8LabFZ/rTqWzTor8jCzMFQ==
X-CSE-MsgGUID: n/iSFPm4RGeHBg1XvA5P1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85407951"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208,217";a="85407951"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:41:06 -0800
X-CSE-ConnectionGUID: DZR75yG5TkSQRxBIXGWw2g==
X-CSE-MsgGUID: UuqyNH0JSWuwMRQRiA0w3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
 d="scan'208,217";a="198271194"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:41:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:41:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 22:41:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:41:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH74KlGWDdw4UWmcuGIqaw2KneKaUloKp7eU5J6j1cOLBcr9NVFLmFGQ4ZdnVQikukjxksfd5gDGa5TvadY7pkUKBaQQx1H5beQ5s0ENxQIjlf5ugtjGuzaMsQDiE6RhzlbFp3bZPEf6/7SKt9LWwJ+U0dqEFmwx+A7fg+sh9gDl6sXwqHw+m5g/ELq7VBe0q4YVwMHqUi/I4iJmNimBLGn9gEFXyt9DOOLkaQMedI1hAVT6k9LMDZpZHbOsubJ/Avh05l6/8xrL3kjF9gSQiFjvb8JdYIvRdGiwrGBfslLG2qip+8IkdgYIZF7nmn2+hqSrtUqEpKvnlVh9+B7YiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjj/nKBktcJ/sIz8k35e/TZMX88KzqrPWVSgEMqQBkc=;
 b=tjb7PmOjv7fH8URSH/ClhHiyAxbprI3NWQJTMd9PcNAsllvmhDh3qsHZFPbr3Y/Rh9U3xJWRLSNT9xXM/hq34lUsRtTtfTDTVSP573EXhExphV36c3kiLFkXgGfJcLYU9aUiQCeplDzblW84Awh1f7rN3wt6d+Y1kMLqXVi7f520c76jopjqog2T8gG/vNKoPdS8kh1xwMapBs9QmRmYfnHhQn+eQHoqs20SSSQ9dwM7uFsWQIGHujhqIHEJmnjzsQIB7tHApm7GVRFZ6e2txLGF1M/B82lZF/HxdlqPdLlQkl1VVWTG3cHYokv+DPhJzEa5/6FRp2CapEQNChCvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:40:57 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:40:57 +0000
Content-Type: multipart/alternative;
 boundary="------------ZZtI3UKIa9r5JWTatdJV9WP3"
Message-ID: <b94dd113-98a2-4f23-8ed3-d8c8ee58e68a@intel.com>
Date: Thu, 18 Dec 2025 12:10:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
 <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
 <df7a74a3-c375-4485-b2d6-9cd4fb2aa5e5@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <df7a74a3-c375-4485-b2d6-9cd4fb2aa5e5@intel.com>
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed1957d-bf9d-4da3-3a78-08de3e00667f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTJlenpZajBrMWkrWjNNRkVGVENnQXBFT050SnVRcUpJK1orUVVJQXJHWXh5?=
 =?utf-8?B?QmFXUGltdlpreVNQOGRZN2VJOGRuSmJiT0ZtdmxOdVdBVDE2cGhaNlA0RGE4?=
 =?utf-8?B?MlpnOUlvMFRXTExwZVFKd0p1N2dDQ0VYMk8vd1lFTXljV0h0bjlEbVA1SEkv?=
 =?utf-8?B?NUZWL0taRUJYempzcFpadUhycFhSQjJRSnVIZFh3OWU4eDJqS09jNVdvcUxm?=
 =?utf-8?B?U2YyOFJkT3UvTzZScEZNbnZQYit2c3pwNkpMekhJbzcvRnIrY09GS0lxV3VK?=
 =?utf-8?B?dERYelR4TGtsb1IzUGI3SG5pTUVFZXphZTlsNmlzaTZReE0rcXdXRzF0dVMx?=
 =?utf-8?B?QUE2K0NWYllvRklEclJyMmtneEdWQU1qMEpSVkhJU2QxbzJrVXpVdC9lUTQy?=
 =?utf-8?B?cGFHY0ZoNnp4WGJhL0VwVUFhWVVrTG5jUTIzbGRVWGhNbHhLYVRqN3NUWUQy?=
 =?utf-8?B?NEdMcCtSWnVocEJuQTlnUUJvQ3h0WGlPMUZiS081WFVWZTNhcUs5NFpQUEFs?=
 =?utf-8?B?MU9TYzlsQXQwSWVkYmkvenhQVGUzVXlnbFovOUwyQzg5YjN3MFNTT3RtL0lp?=
 =?utf-8?B?UUpnblBwZ2YzZHFsQ2pPb3ppcXI5WjVuT2hFUThmd1VGUTFERTUrWUM4Tzkv?=
 =?utf-8?B?UzhsZTM5WGJqeVVDMllUMTFXcElOOUIzQWxpcC83U2lMUHJXd2NCWTRrWGNm?=
 =?utf-8?B?UjI1VnUzeXdjMjN6cmJsQW9BRmpCUmtlcmYwUThpVGFDMmZCN1pQRXVRdkhi?=
 =?utf-8?B?a0RLaE0wZEU2M2hmRzZIUWFPVEYxeXlOSlpwVThDRlFCWXZyeHJsUnpMaXpq?=
 =?utf-8?B?V01VcTUyczhLajFrRnk3ZU5mSVorZmQ2ZlRldzEwdmhhdzQ4eFhUZzVFUWpH?=
 =?utf-8?B?dEpsT0k4N2JpOGtWWnlaMGlheHBJdUs1REc1L1NpYTZ5b0xvVVR3c0pvbWpp?=
 =?utf-8?B?cTJLZjh1MEhpcGp5UjFEU0pYYWVYL2pkZEI2RkpBLy9UaGxzd2hQT09RUmpC?=
 =?utf-8?B?ZU9QQTNjZ0JFeDVoY1NsbC9PVCtxcU5jUzNMZXZWMlE4aml0dlhSeG16Qlp5?=
 =?utf-8?B?WVkrNUVqMmRZMjQwTCtEdHVkSXczUUtRQXRHUkV2akFjeDZRUm1HeDM1dzdp?=
 =?utf-8?B?S0VYNmhWaU1LeTBJMHpvdzlNUlhxbkJsd01TT1cvVXl2RGtuK2lnMnBVRms4?=
 =?utf-8?B?MjNpTGdhcmIxdmJiUEFpYUk4RlExeHozNU1DY2s0d2xsSXBzeTJsazdQR1Fl?=
 =?utf-8?B?YlEyMlorQmFSR25BYzVzU1Y3QkJNM1F3MjUrbmlzWFBWdXZSQVJSK2wwVktX?=
 =?utf-8?B?K3dzWnZKakN4cG1MOHZYQzF4R3JIdHV2VEtGWjJFbVVkTm93M2FzRkMrQ1Vn?=
 =?utf-8?B?TlhXanR3SjcyT01reEVoZnFJNHZIZWVwa0hYT3UwNWlvSnMvQUxlSUdHQVpK?=
 =?utf-8?B?OEFySENvbTQzLzVTV1VYNHZzR1lEd1RseU00S1FEaXJoUEttbTllYXI4Z0pR?=
 =?utf-8?B?RHRHMXpBL2lmUkV1SE9nN1FMQUcrd3hJREFwOC9xK29YTHA3L29TRVMrR3Fj?=
 =?utf-8?B?WWtFbW1KNzFIRzRpS0haMXltYm1MeUxnQngxenFjN1l5UmpXM052a0N3bFVS?=
 =?utf-8?B?YXBMaTVyVjlWcXhCYTA0VDF6R05xT0twZFZOT2J0blNidzV1aWZkNVVkVDdj?=
 =?utf-8?B?UkR4cGxaTU5kTmZ0VzVFbEh6TDhSWWVVczJrWXJIS2dLV1kvTTNwaTZKc09L?=
 =?utf-8?B?T0tZTGJVR1FYdC8xWWdySEU4TTdyd016c2ZiemxOQ0hLZkZTZThZODhpeHUz?=
 =?utf-8?B?WTZlVWhONnFGcHlIVFM5aWxlRzkxcUI4R2M0SG1xaFh6RVdxT0JEUVVwM2JI?=
 =?utf-8?B?emJtVUlxeldRNVYvd2kvd0lzM096b0ZRSXlNK3B3QlV5UjZCalVNNjNUYzZT?=
 =?utf-8?Q?434M+mz07E3iAi0MZ3iXyYdwP777kwM7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nms3cDdPZWcydXlOcW1hd3gvMmJiMDhpT0J3OEZQNmViMnh6QjZQUVk2WXQ3?=
 =?utf-8?B?L3hVelpkWWl5NUNjdTRwb0dHZklUdlYzWnZ4Qm5zMU5SQ3VSSzZHdFRZd0Zl?=
 =?utf-8?B?b01aa2V2ZmV4ZnZac05xbVA0UlJmT0hiWmNOQzJraUp1WVU0QnBKZG4wNy82?=
 =?utf-8?B?UnkyQjFRNWUzRDk3aWRVNTZqQ3FMejQycDk1WnlNWkIyVFhCdlJxUlU2Q0RK?=
 =?utf-8?B?RG5jdDJ3UUszUHdTaHJTQkVvMGwxM2JMOWVuM1pDdjJ5YkxTSlBkbHBQRHRi?=
 =?utf-8?B?Rkk4MkpPUmlpZjA2azMrcXNrOENOQ2JqZnlwTkErWFM0d0c1UHRENmUyMzYy?=
 =?utf-8?B?NituVW1zVG5SdUFyK1dSNExnU0xTMjBZYktrcmYyMHpjUjFwbDFXb2x2YzN2?=
 =?utf-8?B?cjVjNGs4TitLQVlCcEY3L2x5bThvczFIeEZ4OURmeVNKMFV2MzBybjYwSER5?=
 =?utf-8?B?aHFlellvS1ZNUFdBenRSYkpYSEJCYThhbGVjWjB0ZXAyUDRTT21UZUZ5eDhI?=
 =?utf-8?B?NGJJcnArVXQyTFoyc011R1E1ZUR2cTJxUkQyYzd6SHhRUzRUbW9adXU1UTBY?=
 =?utf-8?B?NWlURHMyL3gyZ1U5RFBPbE9PdnRhMFg3MWpjdUR2VVRQb3FmbEZ1Y2prTUpU?=
 =?utf-8?B?WjNlMmNnakRrTVBKRXFkOVVYMHQ5eFBZYmZLeU5yb1Qrb0xLTDM2UTJHSTdE?=
 =?utf-8?B?eXlnRlFlanA4SUJ4RE1oeTRwbGhCZkgrUDRnVXkyTUVqRUZ3eE1hck5GVDls?=
 =?utf-8?B?MUtReDQ4UVhWTjRuWkR0cmxJOStPL0FiNVhINm5ObG9ueUhvQzhZUmN5V2o3?=
 =?utf-8?B?M21xOFRMWWlETk9XRTR5Ykc4TlRra0MwVU4vQUJBRk9YZWdmK3FlYXJjYWdR?=
 =?utf-8?B?S1JXdCtHYjR4RUx5TlJ0b3JHWkd2eFlNby9SZXpEdnBGZ3hjWFVqYThLT3V5?=
 =?utf-8?B?TkxXR2RNcXB1cWJoanRFUVFGQ3VXSVRYTTFvZkxUa0FXSldvSWo2SFl6aHc2?=
 =?utf-8?B?T2VtSkF1dG50KzJnOWVSY0tWMFlnR3BsR0F6TThqSnp6NmhkbG1UeXNZTE42?=
 =?utf-8?B?eUZuZVd3R0NiemovT1RTcGZXRmE2VDc0Y1hQWWpOMzJOdjdGVzY0ZjNMOE5Y?=
 =?utf-8?B?ZzRwZll4dmRFMzltMEdGT0NhZHVRSUVCeTg4R3c4dXV4K1dhTS9Tc05QY0Y5?=
 =?utf-8?B?STVudlVodkFpSVE2bUdveTk0ZlRqaFNkN0daUWdFZnV3WFNNdHRWd1gvVHB0?=
 =?utf-8?B?RXJ1R0liMUd2eWdGU0hNK2Z0dzgzUkR6NEhTd1lkb3NvTjBuRERienlvMVpH?=
 =?utf-8?B?eEM5QU9zdHdXYTdMZkVkdGhhM2Z1NVdVRmZQQ2VjMHB6Z21QazNocXhkYkNy?=
 =?utf-8?B?OG1MSkpVMkpvQ2tSNDVvVnovTkYyZ0dHaEdkUTRmQ1Z3dldyMWdqZlFhSXFU?=
 =?utf-8?B?eDVURXo0QWxaWHBBa2FJZG1VczZhaVlsQjMrYmJKaHFiNHVTdWwxSFUvbENP?=
 =?utf-8?B?b0JmUHdmNDUxT0pCMTZ0SVNKdlUvOWlLb0hhNEpEMitNdzZSMnRYVTN2NVMx?=
 =?utf-8?B?a2NsRmhyajBHQTBoaUM4aklVWGI3YTRqUVI3TmNjUVI5bytwdXc2cU85dmFK?=
 =?utf-8?B?Umk1cXN2djB4V0RKWE9qemFiS2d4OUxlbGNleTJUTW5JZUhSUXNlTEI5YlBP?=
 =?utf-8?B?K3dnMHNaVnhlSnVxZjU1NE1rcDFsT3NuZDUzc3hNb05mUXRLWWlJS3gvNndj?=
 =?utf-8?B?M3RnV3o4M3hjcUVBZVVJalNOc2xOUWdKY0RyRjVYbWtoN1RNVFpuMjluZkw5?=
 =?utf-8?B?TUJnL0gwdWIzc3NnMjZRWVJSVWxrR2Z2Q2hDSWdoSVVRNktnYnNDMmtLR3ZM?=
 =?utf-8?B?c0RWbzdQdFBQSG9sQWZrUEpuOFh5ejY4Mzgya0JlUXV4b2k5enoyNVZyRFF0?=
 =?utf-8?B?RWZQUnRYeTIwbXhhTDMvSllMSzQ1Y3d2akJ2OWJRRTlqNDFxYno3WFhWOWlY?=
 =?utf-8?B?dTV2UXV0a1NJRWZuTndqTjJlWmVsTXhUNTRmWWZ3WnlxdjdmSHV1UDVLWWs4?=
 =?utf-8?B?K3d3eU9PbDhNZ2pwc2EzZytCbWVQV2dZVnZNME5WRjY2eDBNbythWDJmUXVU?=
 =?utf-8?B?QzFlbzlJVnYxcFhqL2Zma0hrdlgvQXdmRDRzYWFaNktuSjd3THlLRzRkOGNY?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed1957d-bf9d-4da3-3a78-08de3e00667f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:40:57.6910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sjGQT9kEHC/y+x08nDnp5oB8875FyaSyP5yBwQuf1MwEkfGXPpWELFXbIDOF2MB62m8yJIbBzjnBEmJoW6geNLXAEl4cTOXAqTM0JE7rgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

--------------ZZtI3UKIa9r5JWTatdJV9WP3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Riana,

On 17-12-2025 12:25 pm, Riana Tauro wrote:
> Hi Mallesh
>
> You can send a single patch directly, you do not need a cover letter.
>
  Sure!
> On 12/15/2025 6:51 PM, Mallesh Koujalagi wrote:
>> Add detailed error logging when writing to RPS sysfs files fails.
>> This helps diagnose issues where frequency writes are rejected by
>> the kernel, particularly after events like GPU resets or during
>> frequency transistions.
>
> This looks like a debug patch. Should this be for trybot? 

This patch providing essential error context that allows developers to 
actually investigate and resolve sysfs write failures when it occurs.

>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   tests/intel/i915_pm_rps.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
>> index f97a716be..02c807399 100644
>> --- a/tests/intel/i915_pm_rps.c
>> +++ b/tests/intel/i915_pm_rps.c
>> @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
>>       }
>>   }
>>   +static const char *get_sysfs_filename(FILE *filp, int gt_id)
>> +{
>> +    for (int i = 0; i < NUMFREQ; i++) {
>> +        if (sysfs_files[gt_id][i].filp == filp)
>> +            return sysfs_files[gt_id][i].name;
>> +    }
>> +    return "unknown";
>> +}
>
> This seems unnecessary. It's better to add a single debug log a line 
> above the writeval similar to the function "min_max_config" in the 
> same file.
>
> igt_debug("\nSet min=RPn and max=RP0...\n")
>
> If you want to add it in do_writeval, add a parameter name instead of 
> searching the name again.
>
> Thanks
> Riana
>
Sincedo_writeval is called multiple times throughout the code, a single 
generic debug message won't help identify which specific sysfs fileis 
causing an issue when a write operation fails.

Best regards,

-/Mallesh

>> +
>>   static int do_writeval(FILE *filp, int val, int lerrno, bool 
>> readback_check, int gt_id)
>>   {
>>       int ret, orig;
>> @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, int 
>> lerrno, bool readback_check, int
>>       } else {
>>           if (ret < 0) {
>>               int freqs[NUMFREQ];
>> +            const char *filename = get_sysfs_filename(filp, gt_id);
>>   +            igt_warn("GT%d: Failed to write rps_%s_freq_mhz with 
>> value %d, errno=%d (%s)\n",
>> +                 gt_id, filename, val, errno, strerror(errno));
>>               read_freqs(freqs, gt_id);
>>               dump(freqs, gt_id);
>>           }
>
--------------ZZtI3UKIa9r5JWTatdJV9WP3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class=3D"moz-cite-prefix">On 17-12-2025 12:25 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:df7a74a3-c375-4485-b2d6-9cd4fb2aa=
5e5@intel.com">Hi
      Mallesh
      <br>
      <br>
      You can send a single patch directly, you do not need a cover
      letter.&nbsp;<br>
      <br>
    </blockquote>
    &nbsp;Sure!
    <blockquote type=3D"cite" cite=3D"mid:df7a74a3-c375-4485-b2d6-9cd4fb2aa=
5e5@intel.com">On
      12/15/2025 6:51 PM, Mallesh Koujalagi wrote:
      <br>
      <blockquote type=3D"cite">Add detailed error logging when writing to
        RPS sysfs files fails.
        <br>
        This helps diagnose issues where frequency writes are rejected
        by
        <br>
        the kernel, particularly after events like GPU resets or during
        <br>
        frequency transistions.
        <br>
      </blockquote>
      <br>
      This looks like a debug patch. Should this be for trybot?&nbsp;</bloc=
kquote>
    <p><span style=3D"color: rgb(0, 0, 0); font-family: IntelOneTextNormal,=
 system-ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255,=
 255, 255); text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;"><span>This
          patch&nbsp;</span>providing essential error context&nbsp;</span><=
span style=3D"color: rgb(0, 0, 0); font-family: IntelOneTextNormal, system-=
ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 25=
5); text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial; display: inline !important; float: none;">that
        allows developers to actually investigate and resolve sysfs
        write failures when it occurs.</span></p>
    <blockquote type=3D"cite" cite=3D"mid:df7a74a3-c375-4485-b2d6-9cd4fb2aa=
5e5@intel.com">
      <blockquote type=3D"cite">
        <br>
        Signed-off-by: Mallesh Koujalagi
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mallesh.koujalagi=
@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/intel/i915_pm_rps.c | 12 ++++++++++++
        <br>
        &nbsp; 1 file changed, 12 insertions(+)
        <br>
        <br>
        diff --git a/tests/intel/i915_pm_rps.c
        b/tests/intel/i915_pm_rps.c
        <br>
        index f97a716be..02c807399 100644
        <br>
        --- a/tests/intel/i915_pm_rps.c
        <br>
        +++ b/tests/intel/i915_pm_rps.c
        <br>
        @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; +static const char *get_sysfs_filename(FILE *filp, int gt_id=
)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUMFREQ; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sysfs_files[gt_id][=
i].filp =3D=3D filp)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return sysfs_files[gt_id][i].name;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; return &quot;unknown&quot;;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This seems unnecessary. It's better to add a single debug log a
      line above the writeval similar to the function &quot;min_max_config&=
quot;
      in the same file.
      <br>
      <br>
      igt_debug(&quot;\nSet min=3DRPn and max=3DRP0...\n&quot;)
      <br>
      <br>
      If you want to add it in do_writeval, add a parameter name instead
      of searching the name again.
      <br>
      <br>
      Thanks
      <br>
      Riana&nbsp;<br>
      <br>
    </blockquote>
    <p><span style=3D"color: rgb(0, 0, 0); font-family: IntelOneTextNormal,=
 system-ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255,=
 255, 255); text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;">Since<span>&nbsp;</span></span>do_writeval&nbsp;<span style=3D"color: r=
gb(0, 0, 0); font-family: IntelOneTextNormal, system-ui, &quot;Segoe UI&quo=
t;, Helvetica, sans-serif; font-size: 16px; font-style: normal; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transf=
orm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; wh=
ite-space: normal; background-color: rgb(255, 255, 255); text-decoration-th=
ickness: initial; text-decoration-style: initial; text-decoration-color: in=
itial; display: inline !important; float: none;">is
        called multiple times throughout the code, a single generic
        debug message won't help identify<span>&nbsp;which specific sysfs
          file</span></span><span style=3D"color: rgb(0, 0, 0); font-family=
: IntelOneTextNormal, system-ui, &quot;Segoe UI&quot;, Helvetica, sans-seri=
f; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backg=
round-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;"><span>&nbsp;</span>is
        causing an issue when a write operation fails.</span></p>
    <p>Best regards,</p>
    <p>-/Mallesh</p>
    <blockquote type=3D"cite" cite=3D"mid:df7a74a3-c375-4485-b2d6-9cd4fb2aa=
5e5@intel.com">
      <blockquote type=3D"cite">+
        <br>
        &nbsp; static int do_writeval(FILE *filp, int val, int lerrno, bool
        readback_check, int gt_id)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, orig;
        <br>
        @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val,
        int lerrno, bool readback_check, int
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt;=
 0) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; int freqs[NUMFREQ];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 const char *filename =3D get_sysfs_filename(filp,
        gt_id);
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; igt_warn(&quot;GT%d: Failed to write rps_%s_freq_mhz
        with value %d, errno=3D%d (%s)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_id, filename, val, errno, strerror(errno)=
);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; read_freqs(freqs, gt_id);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; dump(freqs, gt_id);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------ZZtI3UKIa9r5JWTatdJV9WP3--
