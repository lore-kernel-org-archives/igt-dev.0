Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D39D2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 04:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A68F10E1E5;
	Wed, 23 Oct 2024 04:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiyOTt/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3800310E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 04:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729657497; x=1761193497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9FhFxnSvI1v7QvVHWveaCYPtWw//aJ8edAJ5fT6sumY=;
 b=SiyOTt/tArSmnTEC728vHP+uTSJmhA8fW/SNLjc8UuXuJICI/7eqHdvT
 mxLtcsvqkyOYtIfI74/6FT3wEpxuf/PpaPdTTqdY+760KPlWLX66FG7yd
 a6r/uElf1wY9eOt5pVgxsDt7mXQyWU5G+MPoMgWnPSqo83k1Scx+2Tlop
 pDuwmMG9DDRO/k7TXmRWWwJ5t9pUzMyigUIdpe9nQWswcyjV4upomIjf7
 Bu1v50J/yQn0F1z8Ay5fi2pdLV+kuEcuJuPCZcBdt4FkdQyMEtkva7K/c
 FmssOT11Mcg+Re7/H5F2Edoqh8y1imNIrJIhVkPt0UVMaylCLkkfpYLPh Q==;
X-CSE-ConnectionGUID: UZXxM5I3SVyhAeJvVVEMjw==
X-CSE-MsgGUID: /zoEIBQQSECZqDJYYlWHHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33039391"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="33039391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:24:56 -0700
X-CSE-ConnectionGUID: QJ+YZ+OdSheFs/KLgx7G5w==
X-CSE-MsgGUID: byr25auaSrSf3RC8vJRGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="84892346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 21:24:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 21:24:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 21:24:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 21:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOSSQFzsmAhfYCGz4J52araz3Bh3d5NLrpk64cSN/hFzIfNTNmsDJaJXF89i+2b3KAtgKErXhp5EFJ4Um21HqUjqqCvfYg+EHPJy0bq3IxCxhWDd+4KoucJ9JQPitstpXQaPqkQTmaR1E13HL3BAUODsbvTShillzYr7MIkwrzxULd2FP+xVeV5SKA76g5MGqSkcivGWXsXYZ5quE2x/WDyBSJ01mNnLgWgcturlhXxGnUjRyyey4n49yA/ZLldlLxTJu3a5++Z2qr0Y+3mHjBegCh3wJLP/++Egtj/wbREYtav1LmIe4Q7kXrZW8kUBnrDI1AvmraBotqto+DW/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwhnfVjxV9ra/VZ+JZADQW8gmdgGQ4ib4ouIsBfj4EU=;
 b=jSImEMjDhiIwM7oiIX9OdHl9x1DpPZl6Z2msH2AJU0afMwSX++QB3QdhNUVUpcoxIdEBnYXfCPqxcW/+4XFZ9PBtEGV269dMVSGPXly1pcll4oCWCsvd++CZxvpPDotmo7Dh6EbBbSGxDyQsQNfMa7T0ZbDXMH37hkTBqxo3V6jmz3z1GhCa2KwFHVa5s/mRQ0fcd0C3Nk9ZFQ13Fvwqjj9ofM87scKlKNT7QYMjz7tU2pVpVXy2Tz0sVbn/HzY8aVNuP77t5ibQnzxRm+CDsIJu6puFNj8yhYwOyYuZBQTR1iHlwiphuIn4YSQrfPRcqYYMAQtSwPg+xQaKdvIOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Wed, 23 Oct 2024 04:24:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 04:24:45 +0000
Message-ID: <c757b68d-45d6-4dff-bb64-2dc8bf24472b@intel.com>
Date: Wed, 23 Oct 2024 09:54:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 1/4] lib/igt_kms: Added "sharpness strength" as
 crtc property
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
 <20241018190627.1367970-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241018190627.1367970-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::36) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM3PR11MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb5c8a1-5a23-41d7-ab23-08dcf31a9fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVNhZlNteC9TUlM1dUFkeEprOEtVazVZUGpEYnBMNlFSREM1d2hLYlB0VUZx?=
 =?utf-8?B?M0FaVUIzUDBnYW5PNlAvcUNsQXFKaTErSDl3QkV6elJSK0tBZ1lCQVdiYjh5?=
 =?utf-8?B?M2pFZk5KR29jck1MRS93SjJ6cGVsK2hBZHBVT2ovSnM5RjNydThsY2xEN2ZH?=
 =?utf-8?B?ZGdwTnJ6SmQrN2NzQTN4N3RlUXZucllBeklUNFhrNysveEo5bXV1VENDQXNp?=
 =?utf-8?B?VVVpU3NCSkkreXpkNy8renJVVEVJV1Y1cjZEYWcrTmdNYlBxNnN6QzlXS2xi?=
 =?utf-8?B?VGVoek85dzVQbGUwNWRNQ0V1OVUvOEN3b2hlN2lNeTM4T3lDNk1xZmFxNkNT?=
 =?utf-8?B?SkVka0RYODRsMmNEUnlSNkVBeUxNTGpLNmZvY1dlUzRKT3J4dzR1eCt6ZmtU?=
 =?utf-8?B?WFhHdzB0V3ZrMXZoVmpUMTBZWWNZNTlydi9iSzBxc3NIS1pEaFhYRmtiODRq?=
 =?utf-8?B?V0FpUlZhbFJVUnFndG9UaEx2RUNENVlOUThsa1hkRWtGSUR6aVF3ZnZxa0lE?=
 =?utf-8?B?eGI4OGFucUlRRHlabGRMSkhSL0l6OENJekxpWjczeWdETzN1aWVsVjlSZlB2?=
 =?utf-8?B?R0czemJTMU1Tc2F5RmFtZ3NYRUYzczFHTnJUL2pwTUNsYTZZUCtOcmdaTmg1?=
 =?utf-8?B?Nkp3TmpZb0ZGUnExekFRUmZsd1hQUGx6bDZ6dyttVGFIaWl1b1J1ejZaNm0v?=
 =?utf-8?B?TDRMeGNpcllYSUFIV1ZBUUsveitWSmlUT2xEUzFHNU9BZThNRWhBSUdNU1l3?=
 =?utf-8?B?TEwycVFTU0p3THFQTUVGTDlDUU53OWhGUG5QU2lqaldFUDRqUm5uUmVnektn?=
 =?utf-8?B?QzFYTFFGZWJ0enZyZXBrWFozK0s5MzRxbUV4T29OYktpbG9zZHMzWERIMlhK?=
 =?utf-8?B?N3dIQy9iMHRzZ1RxenRQYjZ6bWhHaGdKUGtiUkUrWE93T3lRQjd4d2V1QytZ?=
 =?utf-8?B?Tk9MSjhTUGdNL1ZEODlTQk5Tdi96ak1QTHc5c3ZodlhUMXhoZWZiVmVXTU1D?=
 =?utf-8?B?cHJxNm5NNmpiRG9WYm55amZvRTVqZWlqaFRmZk52S1dmZy8zbWc0bGo5RzhM?=
 =?utf-8?B?cmU1aTJIVlVrQ2Q4S2dEQ296Rk9VSnptbUllNlA0ajA0US92clVIV2NSNFJs?=
 =?utf-8?B?VDlkaU5GQ3RtQVFxdm9YQ0h3d3o3UktwSFlKRHVqSGJ3NnRpMmtPMVBhMDV6?=
 =?utf-8?B?bHR2RjZ6a2xyaWdNUEVsVHdCdi9pbUVZNnpIWDUxbytTTWx0bTA4cHdkSllI?=
 =?utf-8?B?T25rSXdpaDNURm5oWStsN1pUY0NPdDNJOEFRRGozeHhWTlZjRVM2STlIVjRr?=
 =?utf-8?B?L28xU3l1T3JvMlVLOThld2JMSFhpamc2Qk14em53cmhXaVhLT054eFJ3RFNx?=
 =?utf-8?B?NmdoYkVkYmZCUjJSUHVtcWRZYko2YStiYWdzcENrdjZDS1E2MDFkK092R2Mr?=
 =?utf-8?B?Q0M2RDVWdVlqaHFwQ1Z6TnFROEI1cUYrNFF1RTNoOCs2VFd3ZTNBTG5CZFN5?=
 =?utf-8?B?d20rbkZYQ2NIcTFKMGxXUUFtbGhma2Nvc3RwQ2FoTmJjaTNyQU82TXVWelZ2?=
 =?utf-8?B?cmdmWk04dnVTSkdmaGNKSlNLM3pibytoQjNISStNUVlOSEUrNjhySzNmcUJu?=
 =?utf-8?B?eFgwQzFTdVFrbDZVZWlWN0RSak1ma3poTkhraEJKZ0h3dmE3M1M1M2p5N0E4?=
 =?utf-8?B?SmhjVmRhYVZKNVNvZHZvUGsyWkQyQkRvQkVLV2d3WERBeXBPLzVGeEc1bUZ6?=
 =?utf-8?Q?OjmD+xZ6teeS6NA5g2ps5mm+ABl7r+ZWyePu+XG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUw3ak9hcHltVUlvdkUvZEloU0dLSzdPVGxEZHFCSlI4bDAwcCtaYmIrc3g0?=
 =?utf-8?B?TTJ6TzZWTGRLMkFISUF1WTd0Q3RzYmlCc0QvTEZ5NVNRMlZuSGRRbHQwOEpa?=
 =?utf-8?B?Y1pmdnpmeG5NeDF3UXNjeVNuUTh3ZkM0UTNKaFVKVUZ0S29udTNBZ01zRlow?=
 =?utf-8?B?RjRjY0tTeWM1eXZjbWVoUGEvWGRCNncvMEVLdGR6RWNGRzhzOFk4Y1JGdmlQ?=
 =?utf-8?B?eHBPM3VNYVBnSFZqcVZwdjB2diszOE9Qb0hwSVU4aDJyUTJlNHZFQlFFZW1B?=
 =?utf-8?B?RkZBSlFhMVl0a1o4TUNPQzFrL0s5OWVrTWhNcURXUXB4YzJ2V2ZHZzQyK002?=
 =?utf-8?B?dEVqMzhXdTd3UHVsa0FVd1F6OG5JdnNCNzBUM3J4TXZoN0tLYTBPM0dOc2Nr?=
 =?utf-8?B?aVJlOS9WTmxSVXJWbHUyNmlWcWRLdXNURGJkRFZueTIzS3RybEtqVVZNNWVQ?=
 =?utf-8?B?V0xFb1VVK2pwLy8zUDB6SXJQV04yS0tOUFJpbVZKRGp4M2M5YVY0UERyV25s?=
 =?utf-8?B?M3k4UWxkOGVzSFF0OVZkM09uZ1QwbU1BWm8zM3VnUWRGeExGOWQ3WS96OGoy?=
 =?utf-8?B?ZHF6eisvbGlxQmZHazBvenFYaCswWC9ndk1uY0F6TWtVd2ZBenlHWmVlZTVC?=
 =?utf-8?B?VVdpSE9CbFhZUFZyK3NhQzNRbGNvMnZsSW1mdXo3NGtqTWdGMW44UndJWjZG?=
 =?utf-8?B?bFoveEdra2phbmZtaXpnRG1KaXFoVWtkc2dQTWwwbS9tajJyTkpheTcvY0JB?=
 =?utf-8?B?Z2oxMlJmbGtsQlFlUjlyc284cW5ZTXd2YTNNcFRuYnZSU09Yb1lEQjEreVly?=
 =?utf-8?B?dzJ5U1QxKzNETms2WnZyTHBuRVVqU2w4Y0p3c2xmRHY2YnQrZGxHNDlQVk1m?=
 =?utf-8?B?d2JNVWVPK3FaZFdYTjVTZ3IyV1VBNG4zVDRKS1lkL0oxWkNVR1FOYzY5dDhM?=
 =?utf-8?B?cFppbDRLWmhnZ24rVmYwUWRJR0RITlRsSHUrTXpsdnltOVhISFFnNVAwLzFK?=
 =?utf-8?B?dkZ5bWd0ek01UFZocTNkejZqc21pdUJJblpGTjFnbXM3T3pqeDhGYVcvOTRy?=
 =?utf-8?B?MVREMExLdnNxS1kvY3gyR0hSWVZPdEtyOGZsbGZaeXJlRU5VUDNzN0J3STdI?=
 =?utf-8?B?NENoc3ZUTEdIM0xZbjBqQnliK0MyU0pnYUNZM1NXRVlscjNPMFE1SWQycjRw?=
 =?utf-8?B?Qy9ZdFhNRWJlTlpJSSt2VW9KeGFPZk51RS9NcVcwWkpmdmN0UnZEMENHUU9k?=
 =?utf-8?B?bnRtSWtVbER6NElpL1ZDcDVJMXNVRHdtSDkycmJvbXk1aU1wSzg1cm04Mmdp?=
 =?utf-8?B?NFVJWTlNNHJXK1B3VXFsejdYaVIvL1ArSEZUaWQ1TlJ2c28xRUk0ZVhqN3pY?=
 =?utf-8?B?aTg0cWlZUWtGUHVSd0IySnpTN2hQVkQxZENnM1BnRnJwTlcxSDRLeVNPMGNF?=
 =?utf-8?B?NThsZUF0YnVQM3RtNlJLWGUxL01PMm9mTGxEcWZYWUlQTVhLUDM0amw4enkr?=
 =?utf-8?B?dDRlNjdOSXYzTFFMdUY4YWFYa1F3bjY3SXhlZGdrbWIxT3pQRzVTbXF0NVo1?=
 =?utf-8?B?VDBRZVlZMG4zY3l2UmxHOGM0bGEzellsQzRxOWgvSURjZ0U2VFVWMDVTTVQv?=
 =?utf-8?B?eXFMeFV0Qi9hQUY3ZkNrYXJ4aUV2d25BQ1pJQlRFNXdvLzh2N1B5YVZMYzBG?=
 =?utf-8?B?d1RjU0hVY2ZCZ290cXV1K0xwMkF3NjhHcXIva1BGUUl3TjR0SXF6N0FiQmti?=
 =?utf-8?B?eDdYbXpOZ01WSlZhcEVJb1ZxWmNIZEFmWTN6bjlSNnlZejRhUmtNQ2ZoZElN?=
 =?utf-8?B?MmxGclpqR2ZSOTRkbTcrNGdWZEovZ21WeWhqUjE5dC9RRlVSY1pXUFc4SWFa?=
 =?utf-8?B?aU4vdHR5Yk1Xd1ZjbEVFSmNyZnk2RVFWQmlsbXVpbVJjWEpFalljV3hWQkIr?=
 =?utf-8?B?dUV2b2ZVZnpQdWhROTF1QWQ0Z2RJZkFkU2FRd3pKcEFhdndZWU5EbTJsa3p3?=
 =?utf-8?B?UDVQSzNtQStqRGpYcmh3RmNPNVAxNld2US9LT0FSMWZmNFFWTzJyM1Y1OHlM?=
 =?utf-8?B?RXg3RzZ2N1lCanh4L0luOHIydXJ5UjNsU3pRa0N0RHVJZW9QV3ZJS3duQjUr?=
 =?utf-8?B?bEtpSmUvSk0ybzJ3cFJRcjMrQS85Y3FaajFVWEhkN2Ewa0Vhc2hTVTFxZWgy?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb5c8a1-5a23-41d7-ab23-08dcf31a9fcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 04:24:45.8957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOZAnGGf4khoZuQ05Lm6eokBclgZrdVAcXX+wmQ+VIV1FVG7PvmB44mp9tz9W0Ou4anEiMDoJPIERtRFGEpFA+EYFtD0snT7m8zfOvs9qWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
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
> Added "sharpness strength" as crtc property.
>
> v2: Replace SHARPENESS_STRENGTH with SHARPNESS_STRENGTH. (Nemesa)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   lib/igt_kms.c | 4 ++++
>   lib/igt_kms.h | 1 +
>   2 files changed, 5 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b40470c02..73b024e0b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -700,6 +700,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>   	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
>   	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>   	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
> +	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
>   };
>   
>   const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> @@ -2562,6 +2563,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
>   	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
>   		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
>   
> +	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
> +		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
> +
>   	pipe->out_fence_fd = -1;
>   }
>   
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..9bba0924d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -163,6 +163,7 @@ enum igt_atomic_crtc_properties {
>          IGT_CRTC_OUT_FENCE_PTR,
>          IGT_CRTC_VRR_ENABLED,
>          IGT_CRTC_SCALING_FILTER,
> +       IGT_CRTC_SHARPNESS_STRENGTH,
>          IGT_NUM_CRTC_PROPS
>   };
>   
