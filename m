Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8156BC7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 10:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FA710E25A;
	Thu, 26 Jun 2025 10:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCtjjakW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC25810E25A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750932566; x=1782468566;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xlodVEyz+D+LBZCzB/vk+21PY9WkZHJ/JyQ2lIo9+e0=;
 b=kCtjjakWloNhdR67Qb3HkBkL/w9rX1R9BXMV7zdwWQ2AjvKYcQ3aAzsx
 Ncejme7AnNCmW8nTJfGjBP1LtAEM3bamsw/R6Yo5LBggo6m0cigKcNq3j
 msF6coK5byzBfaOoSV7MxgzpoiZxunHHkvNjbEXrePNgXScEqee8ZpUwJ
 YEvR8N5CBjULhYzmoUei5QCT9lkAkIFYBX8JJWIILOvCj9EJ+mXkOSPMf
 s81PVOLpy3KX39Ee/C0zEaixLUQtwIgt87r2dnMUae+oygQ4A6mAXWg3n
 lPWJC43/DRNH/dO3e/wp0sxpw5II4sA4ZE0SmTGfWD1QYaDCQRGXpn2zh w==;
X-CSE-ConnectionGUID: xjaE00NBTMu3yBWOmkz6Zg==
X-CSE-MsgGUID: /xkeuM9CRoC61q9/KaPWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40836839"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="40836839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 03:09:26 -0700
X-CSE-ConnectionGUID: 2/jQRwf4TLamvVHvmRqnLA==
X-CSE-MsgGUID: TIiXnoIURXqq0rvyBnFTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152594195"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 03:09:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 03:09:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 03:09:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 03:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY+yyI5lXoS8/6PuNglk5P6e8tPqDMyTIMJ70lTkGwtfUA+6hrBbWtNwV2Nj7U5CvEpYs3uaMJpqBMLY1QsB5LP9c+Ix4MJtWL8Ble3WuRDVDow385fQQdZ525WpBfxUTG6U5fvSwkhhWZUK8m1PU65eXakj8Y2h9QFHD4HcDUjjSf8MnxEri15M63gn8dpFRrsMn7I+xSQ+0oJ+VvzSlB6OtJsPXXwSb3MApKQktJpBzoSh4nd0e4BskCwTGd2Q5WlXuX7rPqUUF2Ba2WvNaVTBbRSLIYLMLW6W9kKzq9KftYWBUSMU+H0QsHEGqXlgS6mAMpPKkKbLlPVxh1ttyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amXuhhL6qlhnrx5LQ3ak5IPIxthkVY4qfAN8ll3PAz0=;
 b=cC8tdQymFIpSRieIJYBgrtr0akEyNC3IIPoHzYdXcO2J4SCLEcs7YynkGJICcVwvh8ZCwR1Cx/7IiVJ9Byki+84WGxUY5eYhQ0gTHtKnvqzcxFdFegng5YgAKYwLDGGYBhOkPQmdOgF2+tH114AkRPtajNvyyTRuT5aiPmvJMn6ia3xOEcOR6NlildYvjqoW41+amF7fovFaTpPFWsQaCxOcomVSNJsgTlyGxK/mbii3A0HiQ1C35toNxHKQsqLfSAwdT4weLm6itA1JuU6coYSIatDDIIIacsHSPHZBhm1AW2lbLaEPrTA2KwNr4Kdy3sG6GCKAEX6M51+RGXvcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB8829.namprd11.prod.outlook.com (2603:10b6:208:59b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 10:09:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 10:09:22 +0000
Message-ID: <9f71cf91-1a11-4521-a891-867279d5b51b@intel.com>
Date: Thu, 26 Jun 2025 15:39:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V4] lib/igt_kms: Move get_writeback_formats_blob to lib
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alex Hung
 <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20250625174115.2536661-1-alex.hung@amd.com>
 <20250626082444.6tfhinn6asoo2udx@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250626082444.6tfhinn6asoo2udx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: b441ac1a-d309-4f74-0eca-08ddb4998550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uko1VGRPa1EvWlhsUVJuUktGR3JzazJLeU55QldCUVZKSEhQeUF6NDI3NTdS?=
 =?utf-8?B?T2ZwKzVETnBaTlEwOFo4emM2VkVwbmpIZ3VwdVRTeGt5Sk95Ri92QXovbmhl?=
 =?utf-8?B?YmNKdG02b1ZzbGpFSXllYjlQYlB3SXlsQmNIelBYcHlrbW4yLzYvenBmazRS?=
 =?utf-8?B?NUpxQVFHcy9zbnRRdmEzY3pPQWxDelFRaFZkZ3F4alZjaFlCN0lRb0d2N1Zv?=
 =?utf-8?B?QWs3dUlBaURQRTR4dTRLQnByelZvMFhsanpXOEVNSXBHL0dSM1IvNDRoSlha?=
 =?utf-8?B?bWVua3dTcGhnck5WOFdsWDdKR1lFbHlTUFFwTTRwdVpObTBLNzJyVit4VmQ2?=
 =?utf-8?B?THB2N1VWRUIyYWswTmJWQWRCWlVrVlFGaUJPbE9HYlRCRm10d1EydW1NN1F4?=
 =?utf-8?B?VUtmUE5sbjN1OGZlUm1UclhtdlBSdGVyMHVnL1c5QWw3Ukx0KzZDZEtLUmtY?=
 =?utf-8?B?K3JHWHJVYXloMW1TVW4wMWEwci9pS1k4dzVJQnBrL2R5L0wyNUY2QnRDalpt?=
 =?utf-8?B?UTArUEhBSnVZVm1RTXJ0eU9US0Y5ZHJORTRMdXRHamducFZndk9XS2VtcGhI?=
 =?utf-8?B?aUpkbS9pNzd3WTNPL0tzeDc0S21ZemdaRlBudjRCMW1nMTNLa3VvRnFlT3VQ?=
 =?utf-8?B?S3A5T0duY05ZYmdDQnA5YVduQXgxck5ISkgwaWtMbXQ4NmZDRk9VeVdsYi9x?=
 =?utf-8?B?NTcwSVNqNjBhMUg1Z0UrY25jNCt3M3V2UEEzT2IwRDgycFVDaXRqZTYyQWtv?=
 =?utf-8?B?ZVZiR0xadEFZLzBzaGcwcURrNzBpMEtnMDg2ZVllSGIzSVdodXl5Rms1R1hS?=
 =?utf-8?B?akR4RkhYL2QxQXY0b05wUGhTbnNNSWcwbTJ4eE4zVUNPVGlUWmVUWmM0L24r?=
 =?utf-8?B?ZFEramZvd2k4OUZwSVZETWpmaHVVbDNRdW5ZVno2NEhLOHZXcEJYMXJ6c0FL?=
 =?utf-8?B?NVFNdWF0b2Irc2o5T3J4SE0wbzBianlyNWI5Uzh2SzZDMm1EMEFnUnFxNFFW?=
 =?utf-8?B?c0NlbUpVNk5kUzNoUXU3Vk5RVE83Q0p2cEJCVmN1bmZYc3ZiVnl1QjJzQXJQ?=
 =?utf-8?B?Q2VIVWZQNklmYzd4NjQ2b1VLL1JGcDdIOTRrKzllT1FZNzY3RjU2K2lVVHhW?=
 =?utf-8?B?YjdkdXo0bS96OGRuSVRTeXExdmVBdTh3a3RrZ3RJOWNSQ1VLbkJEakZMREJE?=
 =?utf-8?B?T0pTaGsrN1VGRWF4Snl5d3NralBUcXArcGJ3ZlVxKzkwMFhUYjI1S2ppT21w?=
 =?utf-8?B?Q0Q4YUdmRUx1eGdkVytlb0ZaeEV0djJ2aTUrYllZNVovQjhBODNIZzVxTGxu?=
 =?utf-8?B?QlNZdmtkYUMrMG55ZWNlYkdaRW9uQnJsV3dVRHRHTFFkcDIzSktya1NpdlZI?=
 =?utf-8?B?MzNSdWl3eVhSNkpBVEdKNXNONHRoNzJpczRJN0ExZzk5NXZjLzRLMUk1bWsx?=
 =?utf-8?B?NFhtWm96THZiVnhuUklMRmhMRUR3cEw5UHcyeGpsejJKNDZaeXRKN1NYT1p4?=
 =?utf-8?B?U1BlRllQSzEwYkVpemxjeUlGblFCSmtNUXF3Y1ppQVJPdDBNZWhXaUQ5bEMy?=
 =?utf-8?B?ci9kcFRFMUJ5S0w4ZG9VTFNCclEvNmZSNkUrbFFpUExyNE5ueDV2NHd2Ujll?=
 =?utf-8?B?a01ETitBR0g3MGpSdDZSdzlrUTF2azNzUEd2NzhJM212MktUaC9KL0hQWWhT?=
 =?utf-8?B?N2ZEU29yWjllTW1pVklXaSswbmFwb2FFQTM2SS8vd0svcFdLenkwRVZaYTUx?=
 =?utf-8?B?cHNJT1VuMjczbjlwRjRpdjNyT3dBUTZ1Tk00clZYSDNIclhZcFZOYXNkZ0x0?=
 =?utf-8?B?ZDBWUTAya1RtSWtDdzZiUTFCZVJXa09aR0FWdHIra2dwdjBnUHJibWx2TUJo?=
 =?utf-8?B?TEtQUGo4SDNEY0h1UTZBdUxBU1VOVUlLQ3ZVazlmTDd0aHdTSEhhVE80QjFi?=
 =?utf-8?Q?CF7Xkft0wIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0Y0MWxRbnBUYWgwTEZ6Y1RSRythT25USGNvZnRFdWdGV2dGS3c4WDlIVWhC?=
 =?utf-8?B?cktScEh3UDFBMFJ2NndkN2ExcldmMkR4N3FoSlpBMkgzZXlpREVYajk5d2k4?=
 =?utf-8?B?Rjg3Smpua3NZeU0xVFdMU3FZR0I4U1VaQzFVWDl1elNIRkh3eHoyZFE1ajNB?=
 =?utf-8?B?R1ltRm9jR0J0djhTSHErK05MRm5jejlHMXRCOExhWTJnZkRnb3JVSG9IWTNo?=
 =?utf-8?B?MDZGMnhLRklBb084cEExODZ6WHZXczRna1FTTjRQV3U5ZVhSa2dDVnhtclhr?=
 =?utf-8?B?bzZ1RFYrc01ETUxJbVBuUlVvenBRT1N0bmtvWlg4M2NzcjhaN1ZNM013M0hR?=
 =?utf-8?B?emQzSzNmdjdiNmI1QlA5ZjlqYzkwN0hvY0RyYXhyRitqMktjUDB0Wk9Ld0Jw?=
 =?utf-8?B?S1Y5Z3c0Z0RQVUQ2bHZoRFg0bnpmVFpXVUU2ZzRYMysyWGtUcnN2TEovT1o5?=
 =?utf-8?B?MEZVVTluZXVxSURuY3RBNXowUVkyNHZ5ejVrUm1WY3I0WHRVZUNFYnNXQS9D?=
 =?utf-8?B?VXRINXlYNERoaTU5SVRvZjIwbk51S05nOStCSFFocXFEVEpkU0pSd2xMb1JY?=
 =?utf-8?B?SUVvT1RFYzlIUnlEc3R4M01PM0padlhSYUs3bjZJRWdPOU5IcWt5ZFpsb21T?=
 =?utf-8?B?cXZpZk5qQ085TVZpT0owVEkwL0Q5K0ZxcEVwWXdrZ0ZPb1pOQ3RvVEZWNDFt?=
 =?utf-8?B?NDduREhpdFVJM25ESVZ0NWl2MEVFc2k1QU5KbmtDczlYUnV5c2hoRWVHUDFi?=
 =?utf-8?B?M1N5dUNIcStWSEhlVzEzMjRtTDZ0aFhtaUMyRHB0bXI0MDk5WDdDQ09ndWs0?=
 =?utf-8?B?a2FreGs5K3VhdzlKeUUxSFR2TWtURDI1SkNyNGR0aGs2aUYzYUhDKzZPTE9v?=
 =?utf-8?B?ekl0NFJXTzR0V21yUmE5L21WYVBNMzN3VTFodWIybG9GZ1BsZVlzaGE1dkc2?=
 =?utf-8?B?ZzJadW0wVXI1NlJvVVVDZXQzcURQL21wbURhcWRlSElhdnhaaXhraHNsczg0?=
 =?utf-8?B?UmFqWGx3Yy9CNjRwK0ZKWkFqMERNeWY5TkNCT0lPRTk4WnJmNGVJMm54OVd2?=
 =?utf-8?B?L2srRFk2QS9nVzNJQUQzQkRkSU1YTTZqelArVnVTcUNLZDRNd2FoODJ1Umor?=
 =?utf-8?B?UlN0T1VCdnBOS0dzM25VeHVGNTFsemg4UjY0YkNWcnhXOUVacnFPQ1BwVXRH?=
 =?utf-8?B?L0lQdXpsVVlBc1c5MmM3OE1lYmRUSG9pS2R5WFdNYmxlWTBSTmxqeTIxMkhB?=
 =?utf-8?B?dzNRQ1ZEVTFwUWE5VmJxVkdTYnZyQTQ3MGYxQjRteFQ1VVpBRzRLMUJ1Q3Qy?=
 =?utf-8?B?MzVsRVhkVEJkbTN5cEdjMWdpRHBlT0IzdlU4cFc1UVBRZmxpK3NXbUkvZita?=
 =?utf-8?B?c1VBZDlwSGJoNUVKL2hXYUVmTi8rbGc0dVhGVllkbG1UOS9vRHorbElsZExk?=
 =?utf-8?B?NnRvV2pnL1VuWDRvUnlFbVlFaC9LSmlBVklKc0tJempWZVVWRVczTjRyYWJT?=
 =?utf-8?B?YlNvOUtlby9TUDBSMmovYXdwdi9QYmkrUC94QVFHeHFqaUJKUFRhai9QSDBs?=
 =?utf-8?B?TWU4VXRJTjkyRXRNenFDSkhzc3IrTnpxeHhMVmhCSFFTejBnU1Z4K2Y0OE1Q?=
 =?utf-8?B?VUNva0FaMVJQcENTMmJZcEZDbnJQOTBEbWRDaDcyeWM5ZzFrc0ZRSkU3VVdw?=
 =?utf-8?B?aUl3cG0vdTJ1d21PYzVXekJ3NG8zZm95YUp2SWxjMzI4Zy80UTkrREx1M05J?=
 =?utf-8?B?cktuVEQ5b3hqeDR0eW5lcWYvWkRDeTJCd1cvQkRsVVVlUTZ1QVpoZ25JZ1Qw?=
 =?utf-8?B?KzJPZjZoNUMrTXpTaGhlbGNsaVVwN2EvMFVRYWZkTlBvUUxLYjgvRUJvQkds?=
 =?utf-8?B?elZqYXFCY2QyWmIyTUVzeXExZE9Yc2R3cCtiK0FQRHVLZUNCQVZEM2xTOFkr?=
 =?utf-8?B?N095a3RMWkZJRmJ0aGVUYTVWUWhKR3dncHhOenF6Rktlblc4Y2xtNlVsTE4v?=
 =?utf-8?B?bWJLUFhqNzhzRnV2YWpDem1sMDVITlRLSGlhWlk3TmpSU0oxZ1U3VnIxcnk4?=
 =?utf-8?B?MFJiWm92NkpZN1RRK0N4Sk9qY1VzUEZxR0dtS2xycjJWeE5lRzI4K3k3U0Nm?=
 =?utf-8?Q?nyJO99cgQD7jlIUJXonQiGzmr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b441ac1a-d309-4f74-0eca-08ddb4998550
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 10:09:21.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrzUmsr1BU/O8m7JRiOE6pq7ijU/zAM5JfnSoeF9XLNIgwGSe95MgSSbKuUgkpkZdbQtO3SN7S4HXwxzthStDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8829
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

Hi Alex,

On 6/26/2025 1:54 PM, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-06-25 at 11:41:15 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This function can be used by other tests that need writeback. A prefix
>> "igt_" is also added to the function name.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   lib/igt_kms.c         | 25 +++++++++++++++++++++++++
>>   lib/igt_kms.h         |  2 ++
>>   tests/kms_writeback.c | 22 ++--------------------
>>   3 files changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 9ee03e870..d71076f24 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>>   
>>   	return 0;
>>   }
>> +
>> +/**
>> + * igt_get_writeback_formats_blob:
>> + * @output: Target output
>> + *
>> + * get supported formats from the writeback connector
>> + *
>> + * Returns: pointer to the writeback formats blob or NULL if not available
>> + */
>> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
>> +{
>> +	drmModePropertyBlobRes *blob = NULL;
>> +	uint64_t blob_id;
>> +	int ret;
>> +
>> +	ret = kmstest_get_property(output->display->drm_fd,
>> +				   output->config.connector->connector_id,
>> +				   DRM_MODE_OBJECT_CONNECTOR,
>> +				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
>> +				   NULL, &blob_id, NULL);
>> +	if (ret)
>> +		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
>> +
>> +	return blob;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index a85fee515..09d7d4414 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>>   
>> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>> +
>>   #endif /* __IGT_KMS_H__ */
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 8765fda34..b4c3b1cd2 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -92,25 +92,6 @@ enum {
>>   	XRGB2101010 = 1 << 1,
>>   };
>>   
>> -static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
>> -{
>> -	drmModePropertyBlobRes *blob = NULL;
>> -	uint64_t blob_id;
>> -	int ret;
>> -
>> -	ret = kmstest_get_property(output->display->drm_fd,
>> -				   output->config.connector->connector_id,
>> -				   DRM_MODE_OBJECT_CONNECTOR,
>> -				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
>> -				   NULL, &blob_id, NULL);
>> -	if (ret)
>> -		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
>> -
>> -	igt_assert(blob);
>> -
>> -	return blob;
>> -}
>> -
>>   static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>   				    drmModeModeInfo override_mode)
>>   {
>> @@ -621,7 +602,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>   		const char *valid_chars;
>>   
>>   		igt_skip_on(data.dump_check || data.list_modes);
>> -		formats_blob = get_writeback_formats_blob(output);
>> +		formats_blob = igt_get_writeback_formats_blob(output);
>> +		igt_require_f(formats_blob, "No writeback pixel formats\n");
> Now imho it looks good but I am not KMS dev so I am not sure
> if not having pixel formats is a bug or not, e.g. if we need
> igt_assert_f here or igt_require_f is good enough.
>
> Khartik or Swati or Juha-Pekka, could you help here?

I would keep it as an igt_assert_f itself, which would also retain the 
existing test behavior.

with this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> +cc Karthik B S <karthik.b.s@intel.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
> So moving function to lib looks ok, for that part
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>>   		valid_chars = "01234568 ABCGNRUVXY";
>>   
>>   		/*
>> -- 
>> 2.43.0
>>
