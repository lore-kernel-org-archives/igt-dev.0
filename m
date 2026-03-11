Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D194104BEC7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 10:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA3410E88A;
	Wed, 11 Mar 2026 10:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPsgzMts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C228B10E888
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773224114; x=1804760114;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P69HOEqXdd/VPb8kGGpUZC7t0GuPf+HfC1ExVt+kSSs=;
 b=IPsgzMtsrvGaTjaEcQTrz8oyTC99VW12ZrzUGypjlYgeTtyFO2J3NOGC
 ygQCOJxsKJirN/v9zXvCi9DvLuvYNRjqDKMPS+pPqqywXSnaDAW10wEvi
 F6aG32AIZ0I0F4sqR7SsOONglfoInuDv2PlvIw59bnO1ttthx+ayPDrdW
 dUnASRGg49b4/IuJT5WbvUOJxguQEOveOMda9gHuKFs4vqafB2Ylqf7UM
 vjGlO0psvqov7a6HKE++HDQeTAnkNqRnzJ+z6xw2eegEkvw839zBtHb0f
 b0qfP7J5xAbz0I47z5t/AgsRovoiYdwdDDBNpeiwtaxROUbQBUZp5PhlM w==;
X-CSE-ConnectionGUID: v7U0q8MPSpOgDTpi7N/VXA==
X-CSE-MsgGUID: liURx4tUS8OaPvkw57DwUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74366409"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74366409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:15:14 -0700
X-CSE-ConnectionGUID: vSK33qyfTeuLscy/opEWSQ==
X-CSE-MsgGUID: W57wDuMHQAmKipU33pF0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="222956541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:15:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:15:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 03:15:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeeTi2jeV8XzUYJ5RxVk/+Ceye3HmqmsmNFCz3Vspuh6akEznII8bIgIPWg3lenIaICWYhyWbIuc7BLokz6OP8fQAd6D5sryIpmrCyzxK8jZr+6h9e9j2hWbZE98hF3Y+kfxKRQAokbcjzjW6AGH5MfWjNVeUZXx5iFuHuJIoY80/WM+mGFWR6M9DfCsynsQAzmlYC332gyjmZ59+F/HafvUh4VcjEkFiXpu0IoKxvfrkYVYWgza1kWOasqyddvGqOO2HLCLY5dHJPZx60iLhNrQn/yrqd7lTIgK/B81rGjpdLzF1PcYCFzmUJJzEILjAIbL8xhc96e+j5XSHotYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4wuZhviSf8jZYm39eaQKeYGNdnfGwYz1QPyK36QsqU=;
 b=ny7WWzxkNKuKwFH1+hGJc6vS7DfLbZRV+pyGJN3ETiCqX+nDX/YnW2ka7eZ9FoKkHKGu+TIiLDcR+pTVkJyzjZiE7tQNG/v31EI1k18p3Q8y9hPxLvQqdkPTGM45kxj80PyjgaF86mEzDnyu7VdsOMnCQ3wQmu+BAa46Wn710qCHY6ZlbVe5AFv+GzLYYWVBzhoW4lH77n7v4iHwhy7QLNM5EH7GTLXPvadqTX8M7nkLJBgNTaRMdw42NcA5aFul0u1p95bTEoDcXRwuV7sRmle60g4d9vGVWyuDzw9TCxLw45CB1SqVrm/Fz+fcVjC2on9cwlxA02DcBkGPXc/Xbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by DS4PPFE90FA9325.namprd11.prod.outlook.com (2603:10b6:f:fc02::5c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 10:15:11 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:15:11 +0000
Message-ID: <b1e2ffb4-5b33-4fb2-86b8-cf131f87a351@intel.com>
Date: Wed, 11 Mar 2026 15:45:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
 <20260311074036.219075-2-ramanaidu.naladala@intel.com>
 <DM4PR11MB63125C52659EF3A226DFA8B69047A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB63125C52659EF3A226DFA8B69047A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|DS4PPFE90FA9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f103f69-b382-496f-8cd2-08de7f5713f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: btp3tSjLRccbh8W56sSX1K5YMvj3YrokghAs4Xe2kVXceSsyp27vPkoF+j/618u9kZ2iFc0hqPDf0148tBTf2XvZo2BD9Mqr3jw5GtYew57xOq1F18+o2hHGLoNt0/7w8PFAFOHrqASxncRtGxlNHYafS3kA5ycLUJ9uWAg+mjIBcKSE7K/aS7gM1Nr79cIFUCX15pYVj3BM9/QOiK+jc1wtQeGw4rb5JBToJl9A+CqLdCmBTBIcrPdnD3oUct26BgBV78W9SS/mc4zDMIngebKUUg2bJOjVsLs3cSOJM0Xle/Gjqnch4O13fPdbdxNtajViVCCPXDfESwiW1Ikum860kd4ls7V4uGSLBiG0K3RGX0rcgGmY8KZqWDdmOQ3rYAO3tz3Ykw2Dzvw/ntJlMOMJ75RQYn5Zq2n6qwwvqWteQ7RVGHFoPfpaXrczYaqQVqycoDy2UXDhdKMtj8DOi8KUURiE7cY6J9mAB8CLGhOYJNRegK8iQbeoNivNt15VbtgrwlAJLdj8IPWCvuBLSP2BIK1NYF4SX22V4v66Af/jyQ6I20lwoexSXj0xkPzvcERyy71oTNzxHGeemXfX2yU91i8DtTQn5rsj4DyqX1DP3w+kfSvPVa9oarbZoeW7UJq/TfYYZyK0wGZPWmEMDFjEdU4L0EHJvTCcKC/IX0j6n2wvaWsYkxxVMG6KNGnZ4AvjcNGVymZWpfRAT+KzNUtznKs+T3mzLD0Eey3HEoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhxVk5JU1hLVWsyUEh4Z2h1aTgzdUhEYXgxVXBmbFhUUHZsT3lWeTg4cXZK?=
 =?utf-8?B?YnBvYVR5a1FzUGhCSlBlUldObzRSUy9KTW5VZW5PYlNIMVUzbmZYTkpzU3dH?=
 =?utf-8?B?STcrYW43UW9EWnUvcm9mQ0dWTkd1QUx1dDdodlB3ajZ2TDBoSHZTYndRdFEz?=
 =?utf-8?B?MzlUdGJvdWVBWnBneGN5dUJsVm9JNWtUWGN3SXJlZVNvRmtaQXZpdm1LbkRh?=
 =?utf-8?B?SEg0SHNPMGh4K2d5M2lZR09wK2VXK24xSWx3cGowRkNlZVU0ZmNqSDJteHNS?=
 =?utf-8?B?R2ZUWHg5eXQ5V1F4d05McjNnTFFXbkMzMFFlaGJtRVVrQUhmOW1Jb3BxaldT?=
 =?utf-8?B?V1V4U0V4a2J4KzVrR3NtV3duR2kySjc2QmxJVGhKaktzUkRtSFYzMHB5dk9w?=
 =?utf-8?B?b2VyU3FDK2dBNnlkcUgyVXNNdFprZDg4dEFySE9iVmZaMERvNEhzSjYvNXdJ?=
 =?utf-8?B?U3FwekF2QU56NysrZW5nQzN1MkNaa0NhQitlRzFIbGxvS0JrSFIyQ2Iydmxw?=
 =?utf-8?B?WlJQaEtRS3luRUE1dS91VmhadmlVRENqVmJFeGtEcFZuTk9McEgwQXUwTDlQ?=
 =?utf-8?B?VklpT0MyeXJpUmpPMG5MTTE2VDdUNkMvbUJpdE45c3drb3M2WHBXN2F3UHk0?=
 =?utf-8?B?SkZqN2VWQm8yeXY4MnNjMURtcS9BWld3OTVHTWlHZVlQZEQ2NVVkTG5LOTFH?=
 =?utf-8?B?MGhqTmdUWWFDUERId1VTL0M1Wm5vT0RDQkRacHVCS0hRMUhlMngxWVZGZHRq?=
 =?utf-8?B?czVyUExtd2tGVzNwWkhNU2JFd0xzajQ1ZGdFYXlKdGd2U3g0SXA3VnZybmpj?=
 =?utf-8?B?alhHY2RtSFh6a1EyVThLSW01VFpzWUViVVpJU3pCNVZRRng3UUI4OHFqYlNJ?=
 =?utf-8?B?ODNEbEJzUzRSeEtMMWNSWVlLVkkxeHVqaEVQUm84cXQ0M0NkcUs2aEgrZkxW?=
 =?utf-8?B?M3BkV3NqRWtDTXVtVlRYK0djQTNBUXROTjVOclNlT0hJdFMrWnpYSUcreXNU?=
 =?utf-8?B?UzBHak52Q2xyR2tsSEtPcGxMUHNPZDR1b0xFaENMT1pOdTBLK1MyaFZZSEtz?=
 =?utf-8?B?RnNGQnBBNGVPdjc2M2ZXU1JydEhjNkt4WUUxYWt4YXZ1SjRpR1dYWkYrVklo?=
 =?utf-8?B?bE1WM0JKWGFXY25TM3pacHFiM2lKMmFVU2s0bUE3RDZPWnZKKzJzbXVZQ29x?=
 =?utf-8?B?Y0Vha1A1dTZQUzJYNXdXelJMQ3I1T2lIaXVpMUJrcldpb21iN1orY1FBbS9I?=
 =?utf-8?B?WU1NaDhKNEJOVTVHSkphYVkyZnIvY1RpRnR5WDZDWGpLS0JBVzJ6SmtPakdm?=
 =?utf-8?B?ZEV2cFBEOE8wWk5WV0ZKc2FBYW5mM2JpSlN3VTRReWtCZ1BrWVBnRXZvOE90?=
 =?utf-8?B?WkNMRHQ2aUpKRUQwOVExTGNmZUlGSFFDZWRLTEQyM2kvRFV2S1lXT1RtNDVi?=
 =?utf-8?B?bjRRZnpPMHQ1YVYvbFFLVEU4VkJGQmhLaGlZbityUU5VUmtnb0tUd0doWUtv?=
 =?utf-8?B?QW8vTkxIbTZzbGlja0pML2wrMlZXUUFwM1ZqL04vSEp4Z0VUbGx4RkV1YjhK?=
 =?utf-8?B?T1lENlI1RkpqVXJUZFVWN0U1TFdtV05MRnkrVVU2bzlDaHhZVjdzQ05mZm5K?=
 =?utf-8?B?Y2U0bG5ZZVcrOVZwUzJqTFR0MnRSQm1uOVZqMEpsWitpZndKWHB6dm9xRUhN?=
 =?utf-8?B?Q1l5ckxpUWlXUGpFQm8wbk1jbm5zYjdBQmZ0SHFmS0lRTVNaalo4SktMc1dz?=
 =?utf-8?B?VDRGQmpiRGJVUkhId3lBTjEwYzZzVzNWaldwRk5XakxwZjRsRHhpeHplcElP?=
 =?utf-8?B?NDh6OU1INGl2RGJqK0VLTy9qbW9hMmF6c1FXcmVmRDdvNEZINVRWaG94KzJt?=
 =?utf-8?B?OFlvVzYzdVBNQTNVd3ZWZUlFTzVOeUduRCthSUNqa1FTVVpmcmcwUzdHNzBa?=
 =?utf-8?B?OHlVMGRuRkoxTmVQUkZ0eGNpbmluS05NV0VERzkxUzgyOUY0TFk3MjlscUc5?=
 =?utf-8?B?Zkd2TzJaaUs4TGt4NS9HVlBzZVNHdDlKWnpwcVNKbFZQSHlURzFNMGtuVCtE?=
 =?utf-8?B?NGtjbjdUeFVPTmJDWkQ1U2tZMHNQSlZIeGlEMHhhZHhCNFM3UldZRlJ0Y2w2?=
 =?utf-8?B?QkM3VWc3cXBtNTFQZHlFc2ZOWlJwM0hPdVh4dWZISDlsV05kczFNODk0MGsy?=
 =?utf-8?B?Y0R6MWVONnNmQUNaN2gxVXkxUkloYWsvbDZvMWp1QVJ1Z3FRWCs5cG4rR2dt?=
 =?utf-8?B?TjNpeXl6cG9zZS9vZFJqU2tiejhYQm5weHZCZjlYK040cXkvR2JMOStBTEpC?=
 =?utf-8?B?SE9VZGpNYnhoVzI4N3pJTDE1VGM1dTk0cXRVZ0NvVjBJVVZ0ZGhhdDhneVhG?=
 =?utf-8?Q?ine5k3e622zjS8mk=3D?=
X-Exchange-RoutingPolicyChecked: IlqCoYJfRNSVcvXjwNfiK39lbWJgMQNqFnT7Cv2uIJ5cYr+TYRADMA7/LPSPEPGUwbeUq6TyclwIAX4XbpmqyMvm6k0AbWuM+kk5BBe1Vhvn8J2P/SEAhh92jsPia1ic/1N27IWzxm4c6RF4ePv8EeZI/pc1Z/PWnUGRgfFLJLAG56+rREfIXb9v8NLgIMIEedLVAkiChy6e7DkryHgEZkkk2xHFLL3H9ThUK+88gB2RT9MD1G5SbKZBkZTDHh4D8gBBf2P0G8gCxUM9WpWNW5WZUd1554MXZFgvPaJmKg4g9ZeDlnD3nAhK8k5Y1hZ8BkeQXYYB/cLKoZgYZ7uBBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f103f69-b382-496f-8cd2-08de7f5713f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 10:15:10.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5t4EKQaP4Y6T+eE+eNM/iBJqTPKKpngpJPB7nuK1S1jwsGkaFZnlfzCj1ux1aWHgmSboCGsOUiovbPCx3ddJRawz2A8P3AnTi+pW6Nx4KQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE90FA9325
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

Hi Jeevan,

Thanks for the review.

On 3/11/2026 3:30 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala
>> Ramanaidu
>> Sent: Wednesday, March 11, 2026 1:10 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported scaling
>> scenarios
>>
>> Skip unsupported downscale tests on Intel platforms, aligning test coverage with
>> hardware limitations and reducing CI noise.
>>
>> Bspec: 50441
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
>> ab619fb2b..60390fae8 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -533,6 +533,24 @@ const struct {
>>   	},
>>   };
>>
>> +static bool is_intel_downscale_supported(data_t *data, const char * const
>> name,
>> +					 const enum scaler_combo_test_type
>> test_type) {
>> +	if ((intel_display_ver(data->devid) >= 14) &&
>> +	    (test_type == TEST_PLANES_DOWNSCALE))
>> +		return false;
>> +
>> +	if ((intel_display_ver(data->devid) >= 14) &&
>> +	    (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) &&
>> +	    strstr(name, "planes-upscale"))
>> +		return false;
>> +
>> +	if (strstr(name, "downscale-factor-0-25"))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   static int get_width(drmModeModeInfo *mode, double scaling_factor)  {
>>   	if (scaling_factor == 0.0)
>> @@ -1373,6 +1391,11 @@ int igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   		for (int index = 0; index <
>> ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>>
>> 	igt_describe(scaler_with_pixel_format_tests[index].describe);
>>
>> 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name)
>> {
>> +				if (is_intel_device(data.drm_fd) &&
>> +				    !is_intel_downscale_supported(&data,
>> +
>> 	scaler_with_pixel_format_tests[index].name,
>> +							0))
>> +					continue;
>>   				for_each_crtc(&data.display, crtc) {
>>   					igt_dynamic_f("pipe-%s",
>> igt_crtc_name(crtc)) {
>>
>> 	for_each_valid_output_on_crtc(&data.display,
>> @@ -1404,6 +1427,11 @@ int igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   		for (int index = 0; index <
>> ARRAY_SIZE(scaler_with_rotation_tests); index++) {
>>
>> 	igt_describe(scaler_with_rotation_tests[index].describe);
>>
> I think we should avoid using continue here and instead use igt_skip_on() or igt_require().
> Since this is inside a dynamic subtest, the block should not be entered if the feature is not supported.
> We should skip the test and proceed with the next case without listing an unsupported test.
>
> Thanks
> Jeevan B
Agree. I will fix and float next rev.
>> 	igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
>> +				if (is_intel_device(data.drm_fd) &&
>> +				    !is_intel_downscale_supported(&data,
>> +
>> 	scaler_with_rotation_tests[index].name,
>> +							0))
>> +					continue;
>>   				for_each_crtc(&data.display, crtc) {
>>   					igt_dynamic_f("pipe-%s",
>> igt_crtc_name(crtc)) {
>>
>> 	for_each_valid_output_on_crtc(&data.display,
>> @@ -1435,6 +1463,11 @@ int igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   		for (int index = 0; index <
>> ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
>>
>> 	igt_describe(scaler_with_modifiers_tests[index].describe);
>>
>> 	igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
>> +				if (is_intel_device(data.drm_fd) &&
>> +				    !is_intel_downscale_supported(&data,
>> +
>> 	scaler_with_modifiers_tests[index].name,
>> +							0))
>> +					continue;
>>   				for_each_crtc(&data.display, crtc) {
>>   					igt_dynamic_f("pipe-%s",
>> igt_crtc_name(crtc)) {
>>
>> 	for_each_valid_output_on_crtc(&data.display,
>> @@ -1548,6 +1581,11 @@ int igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   		for (int index = 0; index <
>> ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
>>
>> 	igt_describe(scaler_with_2_planes_tests[index].describe);
>>
>> 	igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
>> +				if (is_intel_device(data.drm_fd) &&
>> +				    !is_intel_downscale_supported(&data,
>> +
>> 	scaler_with_2_planes_tests[index].name,
>> +
>> 	scaler_with_2_planes_tests[index].test_type))
>> +					continue;
>>   				for_each_crtc(&data.display, crtc) {
>>   					igt_dynamic_f("pipe-%s",
>> igt_crtc_name(crtc)) {
>>
>> 	for_each_valid_output_on_crtc(&data.display,
>> --
>> 2.43.0
