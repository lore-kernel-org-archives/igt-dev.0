Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA3AC7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 09:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4710E6AF;
	Wed,  2 Jul 2025 09:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKpNWaa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCF410E69C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751449366; x=1782985366;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cebvxQ47qGjDh7uKylocR2buNNDQseLsq8MAqK3ygx4=;
 b=WKpNWaa6L0SqqI2AKUvT5PLWF+y+0v2jnnP1ZzN5cgtMVaGbK7RjBInn
 aoDuMO8jR3ippjOp6cSSN7nBWCOEQJvVXvyo+ZtF/jNfjr5dfxWBIgHb+
 Vt2GXj0eT4uB3+9d5xlEvJpy9rMF4cSt8Gu03J2r2nwclsywsClKbuBhh
 nyI7ObIWtwcYwOkuMiMgJ9vttISZnHQJ45dFjPxJWJ9PN8tiOHYWL1Di3
 nHgmUxiyR59hhRVqY7fI9dWUbRlvCOCipIo5P4voo5Tc27IRsHMG3HopG
 aLtJy64pw48wzw03AFtcUyZlETRolGJ1mRitasDddbDUjChtQx0EkrdyY w==;
X-CSE-ConnectionGUID: rKlySxZGRky5HE9pLJ98Ug==
X-CSE-MsgGUID: JuhkfgavRei66SMoRo4MWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53853739"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53853739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:42:45 -0700
X-CSE-ConnectionGUID: lnKoBHVnR1edfKtI5t7Beg==
X-CSE-MsgGUID: ZffAjWp7Rvm4GgybSJ9/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158406189"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:42:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:42:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:42:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJ3buF1Z3ImkvwJ3ii4yqGtOymA2byGdqqNj99Rol8KAIEZmVaVZXN0Vr93zQ4LNmTVedCgontDat2UfY0GrnBM2VU8uoHorhIPSrGotbzrhGnne4RV5A88j0gQOE7o+WHxmJEjQBDchY2m8kilrBJTVNxEYgQG5SV+YoMB2ocRo08PlYbpwxriu0ocYK2Z2VpSd5++V/XeZrMHb1DV0x30apFl9M8wm6bReOMXPDrKqnIrJSIXY0nB89OVM73GaYGErNxQgRtKuBs3EFxHQpxB7ozEmTSltksjVfYOlDAow6/iqwMvFs4ElNNSq5X8r18wjw+QGmkqhd9r4L6kDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTeBc0fkoRHSq9C6HVipzvQSRud/DZf778LzVQZLMSU=;
 b=EiKWutpifwSEBaNBc0P5bjxgVZS2RG1Wg6nkr7pZ0mODaYKt/sCiNxTqujytufh2QR9vD4bhfUAQegbo8iOBx+tKfDttoRhIsC5xQNaahNoT3/R0x87bysdLMp7th9PvrV+mXBP2WPXrB6xcwj5utgFjHoV/0rld71S0OBZ5mOwHLF7depbbQOWIdkp4pG4GDm5/12RbEk8SQflEyUMDoGNOkJyfTm4NNtLg39mkBz4Ly5cM9BlIRrlsmyX7Wt3gECiJCxleGEg9znsapkD2sL1r41q2YYZQDEMj6EYxILwb2fflTh+5/zYHO7u9y6zEN8qdw9fOsOhVGYZVsXMu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Wed, 2 Jul
 2025 09:42:15 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 09:42:15 +0000
Date: Wed, 2 Jul 2025 11:42:08 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_compute: use post-sync write to detect
 command level preemption
Message-ID: <aGT-8ObzXV9Uhgof@fdugast-desk>
References: <20250702073242.365099-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702073242.365099-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cc9697-8b7f-476d-24ad-08ddb94cba27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU1HUGRldnpSNUNpK0ZTbW9HOGlONkI5OEw4TG9ZcHZQV1lJNDhQak1BSTIx?=
 =?utf-8?B?c2orMU1SNXl5V0tZOWtjZUtzYkJnT2dYbm5DNjk5elJmb0IrOW1FYXZLWlIr?=
 =?utf-8?B?WWRpR0h6cU5keTF3WDJlWTI2TXFoWmhqRnhvZnE1R2JYRnVmOW9DT1FwTXVU?=
 =?utf-8?B?anIzVm1oRTJlY1U1USt5Z0dxcnQ0NzI4ak5QeVZtcTNKMWtBUVhlb05jVnd2?=
 =?utf-8?B?WXZaamQwdHVrTjBiajhncy93RytJUzU3dnZPcUNUbjFJR0RtSWlLVndPSmlU?=
 =?utf-8?B?dzhkdi95Yis1TjRqSHBxSVVCT2tIQUNSZXFxU2k0QzRUWGdwVGQ0cXB5c1Yr?=
 =?utf-8?B?YSs2VGc0RGNlUG5rUkMzVnNhT2oyNk12d1JCSU5UcnJZcFBPQXpmZjVHRTNn?=
 =?utf-8?B?MXV1Slc1WjJlVU9kY3lTVzNMVUtUbHdyc3BNVEcwZWpvMEM5Z0svYmpoVzFQ?=
 =?utf-8?B?all2ZzN1TmZ4QkFGckt1V2laOTJkQjh0dEU2VGNteGlUdytKVkh0QlE5Rksy?=
 =?utf-8?B?ZmErdlQvOWlObmhBTStsN0hvbWdYc3NISzd3bGwzNHNldTJaOFJkeDBQTUJV?=
 =?utf-8?B?ajNGU2ladHp3SFJMaTFWRUxSZmNqZTR6VVVYOFR6aWdkZm9NMWRLNXNRcFRj?=
 =?utf-8?B?eG8xTy94SlIwR0QvS0ZCc3lTYjhHcXM4NThHWWxjNDZOZnF0VFFaVThXUGhW?=
 =?utf-8?B?QmJPVmdyUng1UDFJcGtPT0wvalNDazhub3dnV0s2cTZrQnYvTnkwdzlrN3pY?=
 =?utf-8?B?bTZqWFhkTG15YVpmLzVBcDZtcVVPYjdycUwzMVV1UHJsL3dDVGk5ODUzQlBQ?=
 =?utf-8?B?RG54SVBGdXdpMEtxMnBkVHVyd2x5TThTcmlJZW1EY0F4djRRUU96cW8wOERj?=
 =?utf-8?B?Y2R3emVBL01DR1pEd0NmUVhxeTlLaStmU3MwUVNWUzduamRkTytaZFlJZm9r?=
 =?utf-8?B?bzBrdXRCSVpNKzFTUXZQeS9LS3h3UU5BeWFYSFkwVEpnS0NRcnpyNEJvZ2pk?=
 =?utf-8?B?UWNaZ1BnQnhSbFZ5Y25QTG9qQ05oeFprM2xBSGhzYjI5ZFBldUh0WU54UkVO?=
 =?utf-8?B?Q1M0THVteW43d0Q3VWVwUnRjSUVUMHFUcGpSZkpSampac3NmSGErRm5tZ0Fa?=
 =?utf-8?B?bURGYytEaVE4ZGVsOWZabGQwa3JJdFV3MVBMQ21yc2k4RnhxR0xkc1ZJNXMv?=
 =?utf-8?B?Mm1xRXZOSTZnQmRKREZZT0RhK0hObjBJVWdDNkNSNGVXMDRNY2pGUnNYZXVN?=
 =?utf-8?B?MVM0blg4eEJrdHdyL28vZzhlYUhsdXdYZXkvellQL1U0MWlmQ1BPWnpQN2J5?=
 =?utf-8?B?V1p1S0ZqSFRja29aSmJheWdhT0JMa0Zra1VpVDZhMFlYaGxSc1hMd3JBbVEy?=
 =?utf-8?B?T21MRmYxNE03TTZ4TWwvUzZ3L3l2RGVIV1FWY2VGMmEzMkcrVEFkOTMxc25I?=
 =?utf-8?B?ejJhVTRxOUdzbUp0bkNQcFlqd3NqQWtCeFRLZzRmWG95Rkl4b0k5T1NVNUQ0?=
 =?utf-8?B?ZVozTjUzWjlaNytka3R6azVRaGFLS0NMWVBDN0RyOFRKejZobUIrblJPZHQx?=
 =?utf-8?B?Y2VBWStEbEpnZE1BUXpLYUM1MzNsOC9wM1JHcFhxT2hjYnFwaXA4TW9FN0li?=
 =?utf-8?B?TXVpNHpLcUJHSVJoVnVOK2tES0d4dndPQUdaemkveUJ5ZThYVkt0QmNzRHps?=
 =?utf-8?B?OUt2UlduS3RtQmY1Yy8xc0tFR01wbUxwYjF5M3BIN3Q5aXNFTkdRbjZOVTFS?=
 =?utf-8?B?WWp5ckNlZmdLZDdDTi9JcE0xYmpHVlQra1lHbXltZzNiclN1eUxlak12cHdY?=
 =?utf-8?B?NTJxeSt2VzJYQjZaRVVabWRmY1YrZU1zOVI3bkpINFY4dHBNMy92RmNxckF6?=
 =?utf-8?B?TDBnQ2hocnBuN2Z1Tlhta05jMFZiNlNualpQVyt3bFBlZXVpZWRpdTNkeTdU?=
 =?utf-8?Q?MexyqROf4eI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTVyb1VtQUNJeEpiYXRjVEUyZytGVGFuOUZEV3Iyc0VEZmoxSldSdHVOMEhJ?=
 =?utf-8?B?OHJ0SDQ2S0xFaXYvemRQeURHN1JXT0xZSGxpTXRaU0kwZmNRKzVlWkdHak10?=
 =?utf-8?B?WTVtTG56bHdNTDI5SW90MGZFRDhSVGhBUDVEeHdPWStOT2t6TU1MaVRsVExP?=
 =?utf-8?B?V216cHo2NGMyNGdMS1NlcnRLWitTa0FnaW9xZmxabE5kZ2FRalhOUE1MaTNy?=
 =?utf-8?B?VUJCMDhZSVhkN0M3L28yVDdtZnpvZHVGZTE5SmpZOFA0MjRDdEZYR3BTcUpF?=
 =?utf-8?B?Uk1ia0Z1UVEycXVYWTdtSk0zTm5ITUV2NGRoUUJlNGErTmVtaXZ3NE9YdVdm?=
 =?utf-8?B?amlYRXlkekRaeUllV0dWTVRZT0tSMkhCV1lvOWFleVdiZDd4UHlCbkY2ay9a?=
 =?utf-8?B?QjVxdFJNaEsyMk1HQ2Y4b2V5WkdWMHRYRVBvWDJtTnRiRnVNR0lWV01kNStl?=
 =?utf-8?B?V0lVRk9TcllhZWs4NmVhZkFBcjNRZDlUam1DZEhHVHpqc2o3OGd4YmwrY0da?=
 =?utf-8?B?cm9aUGFqV3A4NWlKTG9oNkJSQ3dSWEJVWVZRck52eGRmWlB1SDN3bkg1SFFB?=
 =?utf-8?B?TFQ1bDExbEZHTmRoZERRaExRS1JuSFl4UldTY2hyTUpQclJqQVliWnJaSjVl?=
 =?utf-8?B?VlhvREZodGh2d1VFTmhDRVZMUDZXc3gyNzUzVWE2VVF2MTdmY0lVMUZDUno3?=
 =?utf-8?B?U0c4d1ZMeGhSOU9NZ0E3VzREaThvSDd0WUgrMG1UQU1QbE1QbXArQ0U2SHpH?=
 =?utf-8?B?SUR4dXNJRjJSYVoveHd0VU1LOUREbzJlSXRQL2FxTk1adXBRaFNpS2VGVzRy?=
 =?utf-8?B?R3BTV0ttdXk5VjVEK0Urc2w5bWd2dXczdXYrQVZKamRZTmlXMy9RS2p5Y3Nk?=
 =?utf-8?B?RWVJWWxSdjZFUjFPYVpjRFVBQ2U0eE0xMHd0ZnhlVnRNSmZlcWRuYTBwdFJU?=
 =?utf-8?B?cEVyZUhiY05vM3RPRkJDYUU4bFRQdWZyYnJudmNDdStXVTdvclJVdlpXSWFC?=
 =?utf-8?B?dGx3cnZQOVZhYmZ2dk1jWVN0M05FWDVmbXFyb08wVCtSY2NKVjg2R2RvS2xx?=
 =?utf-8?B?VjcvWXhPMGppSEFpbW9zS3JKSWVUbVNkTWJIMVp3TEFsdm9KSE5QSVlpSTRj?=
 =?utf-8?B?dXlvY2wvR2tqazNuL0pBUmhmOVZVT3JYK3d1NVV3bFJNQ21ickVuWnNWNG1r?=
 =?utf-8?B?QjlVMThEV0pjOXZPS0RkS2JCZ1dBc2xMOTVDWEZwdmFjWFBCREQreUIxVFNm?=
 =?utf-8?B?TnFJYzJyLzRMa1NVYTRCbHFFYWVFcFVzNTVhMnNmQllYYjJLbEJrU0lpeFh0?=
 =?utf-8?B?dlRrVFVsT04vQ1o1bkdaaHNCTnRQMzEzN1QyMFJMRzU2UjJvZUNGQTRZMTBi?=
 =?utf-8?B?OFV6L2FyTVl2dEJiUFBORzhFTzk2WHJ0T3hOOVVHdjF5RzhLWnpRbDVwZFgy?=
 =?utf-8?B?SEk5WTFvQUZYa0JpWWJsUGRxV2VhT3IwWVNWenp1TW94WkIzSkhQVk1Lb3gy?=
 =?utf-8?B?d1grYzZWTjBkQitpTjFHUDlHa3NHT1dsWWgzWG1UVFZkakNWNVJOM0hjRmJj?=
 =?utf-8?B?c3UxUWh2bnpMUmNOYkVvamJqUi8vU09yZjNseVJvdnJaR3VyWVpaanZ6WFJa?=
 =?utf-8?B?ME9iemd0NTU5UXZJai85L0tZOWNzRklSY0VaNW8rQXhPcFB6akhlQmhxYy9n?=
 =?utf-8?B?bmEvWWZCYlptOGhMQXVJOGNSb3pTL3FLL2c5Q0xwbzhac3F6Q29JbmtDUlpO?=
 =?utf-8?B?L2MzZkFSQ1pnV3Bvd0JRYmE0SUZqU3FHYk1NalFDRjFSOVNLYW9lcStKdzZr?=
 =?utf-8?B?MmdmaExjUjBiU0VZdDNlcit2aUs2WXlSOE11clRnY2xhTUZKZ0crZC8zaE1Y?=
 =?utf-8?B?NXVDWUppb2RqUzJ5OVRwM2hYZmRqcCtiQ0RYVzdYWlB5c3BMTXBYU21zTkti?=
 =?utf-8?B?YzNEY3g0YjhnNTB0NTZubEg4OFNVdkxjVUdjNGwvS3gySmxVN3Z3bjZEZHNQ?=
 =?utf-8?B?RXN2K1FlejRZRlJuSzRac2I0SEhhaWF1akNCeDdkSmF4VmphR1ZJKytIUkQv?=
 =?utf-8?B?YnUzS2JZMkJUaUd5VkhnVDBueWw3VEU0SlY1SCt3M3BuMjBKc0VtZUpQTm14?=
 =?utf-8?B?UW9lRVpXK2oveWpHejNNelkyV3JVSVRGYldxdlB4U0RSbUhvbU53bExoVFRr?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cc9697-8b7f-476d-24ad-08ddb94cba27
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:42:15.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0mrwpg4SGYB30jbX++7NiZUXs+LiBMBp6A3ewqngAKBf31CUTmw7R/7JurL1/FVWTH4DxJC1PAjtDKVl/NXHaQj8/z1jY4t+m/JWwPRl6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

On Wed, Jul 02, 2025 at 09:32:43AM +0200, Zbigniew Kempczyński wrote:
> At command level when long job compute walker is finished we might
> be immediately switched to short job. This defers signalling of long
> job user-fence giving false impression this job is still ongoing.

Good catch!

> 
> Add post-sync write to compute walker to allow detect this situation
> and fail if command level preemption occurred instead TG preemption.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 9f5fc1bc59..829d3a35f9 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -14,6 +14,7 @@
>  #include "gen8_media.h"
>  #include "gen9_media.h"
>  #include "intel_compute.h"
> +#include "intel_mocs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe/xe_ioctl.h"
> @@ -52,6 +53,7 @@
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> +#define POST_SYNC_VALUE			0xabcdabcdcdefcdefull
>  #define MAGIC_LOOP_STOP			0x12341234
>  
>  #define THREADS_PER_GROUP		32
> @@ -60,6 +62,9 @@
>  #define ENQUEUED_LOCAL_SIZE_X		1024
>  #define ENQUEUED_LOCAL_SIZE_Y		1
>  #define ENQUEUED_LOCAL_SIZE_Z		1
> +#define DP_SS_CACHE_FLUSH		(1 << 12)
> +#define DP_PIPELINE_FLUSH		(1 << 2)
> +#define WRITE_IMM_DATA			(1 << 0)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -1532,7 +1537,8 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
>  }
>  
> -static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +static void xe2lpg_compute_exec_compute(int fd,
> +					uint32_t *addr_bo_buffer_batch,
>  					uint64_t addr_general_state_base,
>  					uint64_t addr_surface_state_base,
>  					uint64_t addr_dynamic_state_base,
> @@ -1544,6 +1550,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  					bool	 threadgroup_preemption,
>  					uint32_t work_size)
>  {
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
>  	int b = 0;
>  
>  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> @@ -1603,7 +1610,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
>  	addr_bo_buffer_batch[b++] = 0x001ff000;
>  
> -	if (sip_start_pointer) {
> +	if (sip_start_pointer && !threadgroup_preemption) {
>  		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
>  		addr_bo_buffer_batch[b++] = sip_start_pointer;
>  		addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1651,11 +1658,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001047;
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | WRITE_IMM_DATA;

Could we please split into 2 patches:

1. Replace the magic value 0x1047 with the new defines to make it more
   readable, not only in xe2lpg_compute_exec_compute() but in all the
   *compute_exec_compute() functions so that we remove some technical
   debt. No functional change at this point.

2. Update the compute walker to fix the issue with POST_SYNC_VALUE.

Francois

>  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1857,7 +1865,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
> -	xe2lpg_compute_exec_compute(bo_dict[8].data,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict[8].data,
>  				    ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE,
>  				    ADDR_DYNAMIC_STATE_BASE,
> @@ -2101,6 +2110,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
>  	struct bo_execenv execenv_short, execenv_long;
>  	float *input_short, *output_short, *input_long;
> +	uint64_t *post_data;
>  	unsigned int long_kernel_loop_count = 0;
>  	int64_t timeout_one_ns = 1;
>  	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
> @@ -2149,16 +2159,19 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	input_long = (float *) bo_dict_long[4].data;
>  	input_short = (float *) bo_dict_short[4].data;
>  	output_short = (float *) bo_dict_short[5].data;
> +	post_data = (uint64_t *) bo_dict_long[8].data;
>  
>  	bo_randomize(input_short, SIZE_DATA);
>  
> -	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
>  				    threadgroup_preemption, SIZE_DATA);
>  
> -	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
> @@ -2177,6 +2190,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	bo_execenv_exec(&execenv_short, ADDR_BATCH);
>  	bo_check_square(input_short, output_short, SIZE_DATA);
>  
> +	/*
> +	 * Catch command level preemption instead TG preemption. For TG and WMTP
> +	 * post sync can't be visible at this point yet.
> +	 */
> +	igt_assert_neq_u64(POST_SYNC_VALUE, *post_data);
> +
>  	/* Check that the long kernel has not completed yet */
>  	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
>  					   execenv_long.exec_queue, &timeout_one_ns));
> @@ -2187,6 +2206,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	((int *)input_long)[0] = MAGIC_LOOP_STOP;
>  
>  	bo_execenv_sync(&execenv_long);
> +	igt_assert_eq_u64(POST_SYNC_VALUE, *post_data);
>  
>  	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
>  	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
> -- 
> 2.43.0
> 
