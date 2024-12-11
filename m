Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C227DE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 08:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794F810E07C;
	Wed, 11 Dec 2024 08:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VA6qBgrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F2E10E07C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733906231; x=1765442231;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+rVFrK6hZqPqD/0n9KfB0daaoEUksRHrCJ0UWeDPGik=;
 b=VA6qBgrRXFgvG7kKXu14ilY5a9aDFabyC17YgorcKwA91c851AXRZEsS
 vemJ3W4DEXKSgjlFvXXEgpW08TzgnZymYRCE/iz1r6lmUNO+RuFipI4rv
 TU8yL6qstBOcFVYOYhX0tPdulhbMljU/nywhnO0A18LJg0/WGcXePER0E
 Nz+RrZPOaEpBtY191AyRho+ubtp2Xl0wHjbtbif2+eB/h8ILwodPWrX0m
 pY6m2D/djlm97nv7z/HzrlNVlcfzq5RY7f0b/jCPRmPsYKhY7YP9TEjhQ
 YNF3FQfi9iQj21JQ5EbcJ7BxYBoL87Z2scER0fF9ryGecXcZ3YBzIgHOy w==;
X-CSE-ConnectionGUID: KJ8A0C60QaCGE4lPEu3V1g==
X-CSE-MsgGUID: loetsu9rQcWgl9gFlfC2/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38059955"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="38059955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 00:37:10 -0800
X-CSE-ConnectionGUID: bIeThyVYQxu3o6HcaP2MPQ==
X-CSE-MsgGUID: GkKU5Qj5REyOZ3Nw/VBQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95910286"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 00:37:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 00:37:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 00:37:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 00:37:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bu5CAgYkAeApYR4ii4lJPR17nKCP5GOQsXYU4+jeL7FQd8Ttq1mAlBo1UWYe1LYwiU7rOIYCUEam0XdZ9OGGU5i4HRNRh4hsPAh9WNPGs65k5uVzA3v18IDc9gRIcgyb0ExfA05VcqTVzGhQ0TK9RAn/s9Ki9FyBRacFy+KsxxV65mjCwdOb/pCVhd3J3jGLscro81S0+DKJD6FDaXmHdiJmBRLUexXduxTPMKxvvgWAAdcsh+ADfeQ40lJlBPQUYPfG/yGRwiy5QRkTZ3/nDgUnn6kPTtxluWDAyf/iKlN2Odt2x4SG03sUIjtg+Jb2S9vWC3EFZd1mJ9ub6xBeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ7NNphpx8cI/x0VQlqkRMBngBt7mIOQazImU2Lu66o=;
 b=HSgi5u8DC73PmAu2vZnHj/CRvC+VODetTWN8NiUiJY0Dh42BPCpjCYYI404nSLIdvr/+4/IAYkQ1dC9+nvJ7g6JXjF+M1MUT0YzOmzTQJUOdazUW8UpyUF9IYrhUhN+9WRqX7T0xZlW13unArMW2O3/YKiaXqfAMkzLkiYESPasRbMYFIGCMIRLUvkCpv2PammTxzApjdeyGp+lny6qWZRNI4aPr5pLia2MjN5qrhwLCH0vb1IIaOfO24FLryhWEMLokge4UKvy9f5xa4+3GRSx+ZQrRwyR2Oq7u7OqI1xtHg2VWBzq6QLYq3pDnQ3vJ9rrg4PsLjUgkkkv0cwqzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:37:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:37:07 +0000
Message-ID: <d83c30d6-b3fc-4811-8f89-60548db7b535@intel.com>
Date: Wed, 11 Dec 2024 14:06:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/9] tests/kms_sharpness_filter: Add filter-tap
 subtest
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0217.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: a256fd2f-2038-4ca5-ba75-08dd19befe29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzVuTFB2Z016eUh5Q25hMWIweTc4OHFrblpPR0l0TnY1TlhwSFhBNTRWSEoy?=
 =?utf-8?B?RWxkTWhCay9LUG5wSm1NeXEvek1mMHY4R2s1VDFxZEFKb3JWTUM3bi9nbjBD?=
 =?utf-8?B?R2FSUktwZ0VtSkpXOVpkeWEwaTJ3OEdsUjRUanBnc2hocFB1d2hYc3BMVGZG?=
 =?utf-8?B?Z0g3M0V2YkNRaGk5NjRVakhGNHFBR1ZVYW0wMDBqdzI2Q1pGY1ZKN29NQUx6?=
 =?utf-8?B?NnpKbkV3TXlHUTJzRHgzZmNFbktJT0dhNlcvMnhuYzQ1RWcyZlRlMlFuOCtD?=
 =?utf-8?B?enpyclFRcDNuRTUrdXpFOXp4T2hPc3ZUSnVGZlR4eEI1aG9ZSmVVdEI4TU9E?=
 =?utf-8?B?aGRRK05RWGREZUdndXM5ZDd0djgwNE5RaWtYRG5hQUNkcXliNmdrNkgzZlBx?=
 =?utf-8?B?L2pLRXdxN3Z0TEorNUhpTW1RWjJLNjlBRHZERlNsa3hOMFhOaXJxd2ppRFpa?=
 =?utf-8?B?VUh3bVArQkhlMTB5YkRROEZkd0c0clNPKzJjeFlieTFhcW9uQTVoSXpVc3Zh?=
 =?utf-8?B?MVdFTDVlemhMWEdLMkhONmh1K2VjamRlTnBEOEdJek5BLzQySGwySk9RVTlu?=
 =?utf-8?B?eitGUDc5eHZoU2pLcU4wRkFLdHhQN210emF6RG9UUnprNnV0eHZWQVMzV0tG?=
 =?utf-8?B?YVVwanVPMU13L3dScmVRdDFkaGZKcVpBR1U5UzZ2T2JYMW9nVUEwNVpJRzdU?=
 =?utf-8?B?RHJRVGIrN1VUcWpaSk5VZ2VhelhGS3pJMG15S0hJY2ZjdkRIZ3BkT0I0a1Zr?=
 =?utf-8?B?bkM5ZFA4TGlLdHUrV1Y1UlFZRjN1OWtIcnB5QUk0YkhMaVAvSnAyYzJsOGJQ?=
 =?utf-8?B?V3ZxM1RyaGZ6MnJ3dTY2UDNmYVVRYmtpdHpBZ1hxWVJYVncvK1ljL1RyTW85?=
 =?utf-8?B?czJldUdDVFBMZ1pwZ3JUaktZVW1uNHVDZkVwdVVhaTNraUpmcnZUWHpNUlNy?=
 =?utf-8?B?ZXRwME8yTk85WWdOSXdOUVMwNVhrUmNHcDZpTEZHT3MwVDFkdzFZY1I1d0tC?=
 =?utf-8?B?TVJ4L3BtUTQreGNrNFcwZ2s5aGZvbjhmQTV5VXZRUUtqWXFMUnVNR2xzMWpL?=
 =?utf-8?B?QTNBQUdiV2VDVHVjZE15UzFEMzBGclAyemtDdFJpdTJIZWxJMkszTWVBTGw5?=
 =?utf-8?B?WG8vNVhvYUpWSHprOStKV0YxTU1IbGxXYVpNUk9tdG1CQVd5cDF6eXdSeXg3?=
 =?utf-8?B?RExrSEhuN3lHZkc0c3FXSk4xYmRiSVE3aGwvdEFZeitJMnZtSmJBWDd5ZStx?=
 =?utf-8?B?blg1akhVMktVY1VHZlBWTldkYTArcVM3NFB1cmlMd3g0NkhsMDRMaEhVWFoy?=
 =?utf-8?B?TWpaNjQ4WHRPZ0dYaEpUT1JXZEJYaWdQN3hMK1ZNbE44azhybThXOVNhWk0x?=
 =?utf-8?B?UjVZbEE2ZjRTZlhSRi8wZVpsVDhEZnk5RXNyc2xKb3VVc0dnV1l4OURCTFpP?=
 =?utf-8?B?TzBuSGlrV21Hd2ZmdENINFYrZ2hvQllZSWwyOVBVWjNXZlgwSHNPT3NOdjht?=
 =?utf-8?B?eGZTWG85aUFhYWVRckEzM3JhNGZTTU5wTXZQczJZU1ZnU3AxSWt6bm1pUXJ2?=
 =?utf-8?B?TDd4azB2VkpOZEx1cVkrUzN0WUdzblhVR1JxcTF0U08wR2l5K3RlOUxpSGF1?=
 =?utf-8?B?Q1FqZEwyWHlPVndkamhiWmFwTmttenhCcDIzWE1NeWd2T3RVWmg5cXZaSW1w?=
 =?utf-8?B?KzJTb1lMS29BWm0xcW9qN3lUM2d6ais4MWU2eUVrbjhQdEY1aE5SZHM3d0p2?=
 =?utf-8?B?SUcxMk00czZGWmJkYk1aMXFNdFV4M0YvVlpycWdWL1lQY2I4MnJaMVVHSXdy?=
 =?utf-8?B?WGJMZEZRV3JXT1lzYjB5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGoxMFJLWFpGUFo1eHNIM0NuVitjaC82dmJ0NjI0NEd2blAzK2lmMnlvZW01?=
 =?utf-8?B?SE54MjRsL3B3czEwZVVwOUVrK2tvcm9SUmxrUUpXdXN4dG5MQlNUTjNJR0hN?=
 =?utf-8?B?Y1hXVFk0WVpwSFRaT0cvemV3TEVWSS9IOVl2TWxsZXVlMC9BZTNwNk9ia3lB?=
 =?utf-8?B?R0Q4cjkvcGk0c1k3MzU2cGh1U3MxOWVnUUljeElkRzk1UjZjSWRCRVhQclpX?=
 =?utf-8?B?TVIwL3dON25FUW1tL0g3NUpMQ0ZGTHpkUjA4d0VZajNiZ2o3dE9LVkJTTm1i?=
 =?utf-8?B?Rkk0bWlTQ0xabUd0K01VbnYzODk0bTVudE82VnBpVk9BRnZ4Q0x0V3pVVzhC?=
 =?utf-8?B?K0dLSEMyR2lYN0lKU015Nm5rZnEzTWFYSnJVeG8vTzdYZW9sNGl5MUoxWnZz?=
 =?utf-8?B?elI4Mk5VQUFXTVk2N05FYW9ndE1Fb1hHSUs1Zk9FOGVoSTNrbzgvbE1EakxK?=
 =?utf-8?B?SWUvQVVpc3ZNTkNyb0NScjh3STA0Q3pSREREcE1USGQyTnFBdUpWZlBlYkN2?=
 =?utf-8?B?NHRQaU53QUl2cjlZU3E5SHd0UHJsWFVxM1dONUEyOFB6dWphMHVPT2tBSzhD?=
 =?utf-8?B?d2w1RlhadGI3VFdUK3JSaWN0U1NnM3JIWHRPaFBWWFdkWE5UZzQrUEtUeWcy?=
 =?utf-8?B?akgvaXlvRWhXczBDMzNTYk5nZUVVWWk4ekczR1ZZYURzeTZJTGU5LzJ3VTNs?=
 =?utf-8?B?MGc2ZzdhVFQ5cVY2ak5rZWdWZlhxYkNrblJybUZDUnlEdnFBbGxWakN3aE14?=
 =?utf-8?B?K05ObkZrRm9WbHVWYlhLaEdUeDRuM0lLODBQOEwwb052eDZOV3pVTEh5U0RU?=
 =?utf-8?B?cER1YmVLZUhTZU5IeXp3SUdZTHBYNFZsRjhJZmtrL2xQbms2WVJFMy9WOHVJ?=
 =?utf-8?B?TzIwckgyUDErdzVhTWJ2UlZmbGloQnFMR2ZYN1pjUHNWS1RTaFo3aHRLSHha?=
 =?utf-8?B?RWZCOTNCVHVpaGFZckJQanM2YnFYYXVpbU9kTkFWY3dPc1pYanRFTkhxY3c4?=
 =?utf-8?B?RlNqSVM3bm53WlJEQVJYUzBoWGtmS1Jnd29OTW9CS2V4Um1VMzlvT04yMjRl?=
 =?utf-8?B?clBZR1JGRnluck9LT2RDS1ZJZXBjYTdmNjc5SWZodGlwL29NdXc3TldBVCtw?=
 =?utf-8?B?MTc0STMxczdVbERoMFZGQTNmem1jZVFkeTJQbXBxMFJ5azY3MkhFUDFrYzNT?=
 =?utf-8?B?dWdZZ0htVDRNaCtlZFA1cnhSYTlyd0U1dXpybVB5OVI3aTQ4aUN6dzFzT3VI?=
 =?utf-8?B?eFFyZ09tU3BtTkZzblk3bXRGZ0w1dWgvUkFIaU9Zd2lYVlBLMGtuV1Y4ZXhO?=
 =?utf-8?B?cmViOHpqK0VlMVdsWHdiamwxemhWQ1k0RkorUUhKQjBSZWxHd1hIaGxKU2NG?=
 =?utf-8?B?VS95WVRNa0VhT281QkFRbTNrRWlIL09USmo3Mk9nenJ0bEVka25aNVc3Y3NL?=
 =?utf-8?B?WFd5NTVlL1lXSWxEYXk5V0F3aHJiRWJDc202Zm95SHlZYnlaR25GaWNndUt1?=
 =?utf-8?B?RlhCYUgwZG1jcEFDR1VuTW1oU1g2NnZPTDgzNUp5RjNjaC9tMzBvODFvUDgx?=
 =?utf-8?B?UFBIVHB6UlUwaVQzeHpqbXNPSW85TFFCT1JUWVc0RTN6REY1bEVUS2hJSHVF?=
 =?utf-8?B?QkpBMHdjN0R5RHFsZkZDODRyeWlSdUVzQWV3QWtWalBneDlxUHdyUzhvdWtu?=
 =?utf-8?B?dk9lZUkzdFFQa29BM2NjdmN3dGVHbFV1cTNPYW1NZHMxMSsxTFVDZ25iYUpx?=
 =?utf-8?B?SjJUa2lYMEh5L25pQkg1Uk1JZkduZHFReGg3QnNLK1U5bGlzbWo3bWEzd1Ay?=
 =?utf-8?B?QVNVT2pBNkFNZURtMHFaMm4ySmJOVXRQUlU4WUR5ZjdDNkJwenhHU3QrY0xD?=
 =?utf-8?B?OXA2SG1hT2pHazNLZWYzUDNlZHBWaW53b0JKelVydlY5MU1PN3NzZzBCeURO?=
 =?utf-8?B?d2EzOCtmWm40VGhwQU1QRW80YS9WWjFNeEZpKytUOUlFSE5od2lGYWY0bUVV?=
 =?utf-8?B?dE95bnhUS3YzUklaVjFFUDhxUWYwbkROYlJyY2dkTFp3ZXFOSWhWWE14Lzdw?=
 =?utf-8?B?UUFTYm9iTUo3ayt5NUI2RWZJN0diSDVLOFIrVTJmV2tCY213VHYwajZLTzJn?=
 =?utf-8?B?NEtVMjI0MGltRVNvK254UVAybVBaTzd4Y3BTWTZZU29YZ3pGbGo2TmFUUHpF?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a256fd2f-2038-4ca5-ba75-08dd19befe29
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:37:07.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUOai8aZ7aKH1MoctTZm3DrQg/FJo2rDUaAcHQqq2XxoxKM4opMF20/6XMHcj4UUZhlJyyYG9oWk8Xz6Cww/p2BLSUW7XqWn6/6kzwQNYSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Subtest is added to verify that following a resolution change,
> distinct taps are selected i.e.
>
> TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080

mode->hdisplay > 1920  and <= 3840; mode->vdisplay > 1080 and <= 2160


> TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index aa200b16a..f91c444f7 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -37,6 +37,9 @@
>    *
>    * SUBTEST: filter-toggle
>    * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify that following a resolution change, distinct taps are selected.

Hmm.. we cannot verify whether distinct taps are selected or not. What 
we can verify is that sharpness works with different resolutions 
(implicitly different taps).

>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -47,10 +50,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>    * is seen without corruption for each subtest.
>    */
>   
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
>   #define DISABLE_FILTER			0
>   #define MIN_FILTER_STRENGTH		1
>   #define MID_FILTER_STRENGTH		128
>   #define MAX_FILTER_STRENGTH		255
> +#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
>   
>   enum test_type {
> @@ -60,6 +68,7 @@ enum test_type {
>   	TEST_FILTER_FORMATS,
>   	TEST_FILTER_STRENGTH,
>   	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_TAP,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -69,6 +78,11 @@ const int filter_strength_list[] = {
>   	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
>   	MAX_FILTER_STRENGTH,
>   };
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
>   static const struct {
>   	uint64_t modifier;
>   	const char *name;
> @@ -99,6 +113,7 @@ typedef struct {
>   	igt_plane_t *plane[4];
>   	drmModeModeInfo *mode;
>   	int filter_strength;
> +	int filter_tap;
>   	uint64_t modifier;
>   	const char *modifier_name;
>   	uint32_t format;
> @@ -151,6 +166,31 @@ static void cleanup(data_t *data)
>   	cleanup_fbs(data);
>   }
>   
> +static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	int total_pixels = 0;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080

Same as above.


> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +			mode[0] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
> +		    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +			mode[1] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
> +			mode[2] = &connector->modes[i];
> +	}
> +}
> +
>   static int test_filter_toggle(data_t *data)
>   {
>   	int ret = 0;
> @@ -237,6 +277,34 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   				continue;
>   			}
>   
> +			if (type == TEST_FILTER_TAP) {
> +				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
> +				int num_taps = ARRAY_SIZE(filter_tap_list);
> +
> +				igt_assert(num_taps == 3);
> +
> +				get_modes_for_filter_taps(output, modes);
> +				for (int k = 0; k < 3; k++) {

Usually 'i' is used as iterator unless other identifier makes more sense 
or perhaps when nested loops are used.

Lets stick to the common practice. Same thing in other patches in the 
series.

Regards,

Ankit

> +					data->filter_tap = filter_tap_list[k];
> +					if (!modes[k])
> +						continue;
> +					data->mode = modes[k];
> +				        igt_info("Mode %dx%d@%d on output %s\n", data->mode->hdisplay, data->mode->vdisplay,
> +						  data->mode->vrefresh, igt_output_name(data->output));
> +					igt_output_override_mode(data->output, data->mode);
> +
> +					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data->pipe_id),
> +						       data->output->name, name)
> +						test_sharpness_filter(data, type);
> +				}
> +
> +				if (data->limited)
> +					break;
> +
> +				continue;
> +			}
> +
>   			switch (type) {
>   			case TEST_FILTER_BASIC:
>   				snprintf(name, sizeof(name), "-basic");
> @@ -379,6 +447,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
>   	}
>   
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");
> +	igt_subtest_with_dynamic("filter-tap") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
