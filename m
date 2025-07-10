Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523EFC83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 16:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520210E932;
	Thu, 10 Jul 2025 16:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqEC++Mb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B7F10E91D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752163843; x=1783699843;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=3fmu6655h+/7nQovjAHaSLPfSdRVd4MPpIQVrazSxfc=;
 b=HqEC++MbkNLf5BD+I9WDIfP9+e9bLOMIOatzD85nN2HlDkiIHU8Y09X6
 yHA0AtPgQzs5tFa47ovkKONg8YRtl6Qqen1u2aWRAbP145amTV5BKEyRd
 1TvS+KY/AVhQ/LSh8lxIjUm50aQ972XveN9MPl2eDCixOivYkWnSfFDbr
 /ZZUE27JPEK9sZ115TkSGWJTkCmgByAfT28EuIev3mcLTgXB0uEgT3Gm0
 8BYO8RAdjGlSTTSj28YE3ibGQUrS5rOq3QM2FZIoH1fiJ+oKezChyAl7K
 uuPZZOJOHSTRN1/bdJonP7sApjXtf62HDUuItcBOEnk3Ky/ny98WvlnOS A==;
X-CSE-ConnectionGUID: RD3IwKuQQGSWfqzUhQt6Ow==
X-CSE-MsgGUID: 21nrPiALTKSCqhcVqyNQvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53671018"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208,217";a="53671018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:10:42 -0700
X-CSE-ConnectionGUID: 6UUXAhCwT0mG8meT67PxXw==
X-CSE-MsgGUID: x7UggRFBRyWoqaBIwbuw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
 d="scan'208,217";a="187134614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:10:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 09:10:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 09:10:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 09:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHiS9y4/Ryk9QKmGERap96h7zQl3MHdt5g4K8QaK3DLf657dE5mLsb0nx5alVzLvLFoZNDoRpRmgL/vQshH28I6Vu/x7SI0UFxKmuayX76Y9eycXD8BfYUJJWSesfQ1UkSZn4cHGZC8aDXLr/ZiXVSDRntVc2GyjFeWDYqlASJZc7HYkBMnDnViOf0TNJFVcv8nG2eA5OQUNRyKpG4jiXJEkOh5LdVUZ/hPmzLEJUgOgYm6rBaZrDOuWT0I5FNJNzJpVFChlcd2/S9CsNkb5p476G5HJsu4Xt9qZsTUA6FflslC6TaqhGh54C3oHqLgV0d5HXeLL0KkTxdhCUadyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x46t6IgH1HS+u/3k9Sr2Btc4lSxb6sJjn+o93z2Fo1o=;
 b=mPXpMfOvl898MlfzfEW37ZD0CSjwrGu5skRfM3luuwo4nlOvmA0WSTJY+AjT5Up4ty5LBnmVZ0X7yI6F8zPUFnMRSxkFwZh/BdUBmGEw7TaEEW3/U+bcEG76Uu3VFbPQFl7DNBly822MMKHVHstbCm5m8Tgtzo/AF9U0tpECUMoFja9LcB4tCDsRcb+3J9sd4nnjhb/IBJimdXO05vvWCv0l8lPkLXg2AMtVHlYsNLe6vbZq+QV5RH63utEVV+AJrLb9WggqStejQ3hWTz3sdYGrfy8zXXvHxDuwdzapmLoYcz7ygs1nQqPUQzWvjkCMvNn8TS1UiIxrVEee7H4+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Thu, 10 Jul
 2025 16:09:57 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 16:09:57 +0000
Content-Type: multipart/alternative;
 boundary="------------soITeRz7q69OfSUXnngL9p5R"
Message-ID: <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
Date: Thu, 10 Jul 2025 21:39:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,resend i-g-t 3/6] tests: Add kms_debugfs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <michal.wajdeczko@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-4-peter.senna@linux.intel.com>
 <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH8PR11MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: b44a259f-fa6b-4d70-43d0-08ddbfcc36b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RngyeTlSRmxhTXBmODdpd3ZhZmJwVTJLNmdraUpCbk83dVloSDF0VUFFa2x3?=
 =?utf-8?B?MHdvQmxIYmkzSWUwMnR2eExGQWNyOHJwZkdLMlhpVG5uazg5Y2dtZFJCSE9p?=
 =?utf-8?B?SmhEZ3BBbWNBRldoRkdKZFZmVThUZTdRRDBqVXFxZ2hXdkRXKzA3REoycnRJ?=
 =?utf-8?B?SGV2Y093V05IWUcvTlR1Ulg2dys4MXlkejFJY3JaNFJzWGlpNWxqamEzNmFU?=
 =?utf-8?B?V3N4WCtGYzVyREx1NnhQYjlCY1YvaTlaQ2lJblNuV2IvVEN2NFE1NlR0bzJS?=
 =?utf-8?B?YmxKVkFhcGhtMGdjRVdoYVpGdklVMmFqRzlReTBaU1NRR0FLaUZyN0M2YkI2?=
 =?utf-8?B?L0htZlZjb2l0UlRIeVF5NnRtT3hDc2s5TVkrb2NBemJsR0pFSFVyWTZYVGVp?=
 =?utf-8?B?L1RZTEZ1cHh0eXV1L0hUZ1M2dVlsWkpac1NxRnJTQnBlNytWUjZqZGxGYmg1?=
 =?utf-8?B?bm80cTNGSlNGYU1sNUo4L2lzUnFCcWxSSEdxTktrWnRhdlF0T2tTMG1LTW5H?=
 =?utf-8?B?QXJmOEJhdDgyODNkNDh4MkNUT3FHUUkrQlhFY3NhZThTUitkelphU2ZLRkV3?=
 =?utf-8?B?OWVKa2cxbVpQcko5VXp0ZVVOSXYyNWRZQXdaQm81T3pSRlVEZCt6a0VoMy9Y?=
 =?utf-8?B?ZVk0eGx3U3VoRjNTZW1xUVRHY2lPY0JaTmJRRmpnSy9JelU4R0NoaUdpV2ND?=
 =?utf-8?B?VkZKV01MY2M1UlUxT2hSL0dLa005c1dhSWZZL2F0YktZTnNySU5DL0JvMXp0?=
 =?utf-8?B?L0hRZXMrNkJOSlh1NlV1WkRyMklONGdLbkJ5OVdiblhCN2tRem8vb1hwQ2Ja?=
 =?utf-8?B?ZzIrU3V1VTU0eHJaTkJKMEU0UUhmOFkyTndERUNFU3NEYm4yQmRoYzRYRDln?=
 =?utf-8?B?RjE4cTRJL3hYQXNlWkNmeFpWMlNITHBNaVh1R0JRUFdHMDY3UEZlQWhiRFVv?=
 =?utf-8?B?YlNNTW1KVmpsK2FpTExwb212djNRdVdTVXNRNExPclUwb1JRZmxtL1JNeStT?=
 =?utf-8?B?ZkNmanZiajlra0luS05GM0FnOHRmVjRXb1QrK1pZWklJQ2dodDdFVjhWR0d5?=
 =?utf-8?B?NlFVSGtNSmpWdXlMNE5xaWY0UTdEZVpRN1R1SEtROEkwTTFkenFlZkIzZWQz?=
 =?utf-8?B?aTQ5Q0hWN0tSeisvbE93SzY3SzhyNENpQTgvelpCak9rQ0EvcnYvQmtPcmZK?=
 =?utf-8?B?NFpMc3NtL2NSbE9HUUltTFFTc0YxNUd4NCtrOVdRT1lqQVJBejk4L1pocDBU?=
 =?utf-8?B?REQxSm4xRzRmdjk1MFpIOUcyUzlJb0t4MER5YnREemxOMkF2REhKMXNSYWcv?=
 =?utf-8?B?S0JjZWduaHFxZzVkc3RweVM5bm1YYmlEclVGZmkvZWZPY0c4ZVVXSlhabXFK?=
 =?utf-8?B?b0k1TlhjRUo1U3dEV015Y3ovcDloUHRDNjY1VitBSEIwdnBKb0NQbXNaUU1X?=
 =?utf-8?B?V1pITEltTkZNbWF4cHI2Nk9pMVRuU0RrV29TUmVCVTU5UEF0aVpEREhoc1pq?=
 =?utf-8?B?VG5xQVJQZlNZYU5jckw5emNnbUVWTGxaZkxwWmVPRWI0RklWbStmaXJmbThV?=
 =?utf-8?B?dWR3Zmc4Vm0yOFFadnB3eUVBOVpOQjZlSzRURnovMGNEdW5CU1lHcEt4MEh5?=
 =?utf-8?B?SmNwcmpYUUJuMEJHajRhZW5NcGdia2lyMUxrN0IzbDMvQS9KVElYZzlFSTN0?=
 =?utf-8?B?R0YreFdqWnZrRjRtL2dHM0pFOFZwVzZtTWFkZVVYT20zSmlxeXVmN1IxZ1hG?=
 =?utf-8?B?eGwvVE8zZGhzNWw5MzlFTzA4RjhrSk5xVHlWVDZxVWpRbm1adnR6enZBZHd4?=
 =?utf-8?B?aHYrMXROSSsrbHdLcDNlRkpTSnNnSjlBRGszb1BpMFpyK3pWUmJ1YmxDV2t5?=
 =?utf-8?B?b21jRk43QlBVR1NUcE1BMU5kMVdMNk5yZkpoVHdUaU1kbjNTZjR2a21BZU5Z?=
 =?utf-8?Q?S8IRjI3BJu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTg2TDI4OHhvK3psR3lmKzJVaVJ6T2FDOXJzUjJKQmZpZlUzL0NaTlVzTFZt?=
 =?utf-8?B?ZUFVaGZGR2pFQjRISE14TDNYeEQ0OERkc1laQk81VDNwclBkN1Z0K01JRnFk?=
 =?utf-8?B?VHQ3TlRKcDZ6V2J5akdFcTNSSWZTMTRNL0dabWxFZ3loWUxHRmFoVGRFMGNQ?=
 =?utf-8?B?RmZRblcxVyt1Rk5hRXkyMnpGdlZpMkZGKzROdWozeDdtQVlxeGIxTGc0dmVI?=
 =?utf-8?B?dUQ4SXA2VDJ6U1dtS1JpZm9VOGppNzNmdmMzbzg0VmgvU3lLRk5oVVhjMTFn?=
 =?utf-8?B?aHpqN1lwY282NzRSNnZZTnR3SER2VGFzbFN3bk8rTGxSTlJMeVI5d3VpTVpP?=
 =?utf-8?B?WFp6Z2E3bk5COHBZQXM0eFF3aTZmbm00VFZXR2dRRDRma0lWUzVJZVVVY3FR?=
 =?utf-8?B?eng2dkJjTEt6MVVXMmpFMlJ5WVlFZytEZEpEQndibDAyV1B5dUdsN3oyT21W?=
 =?utf-8?B?TjR1WXhzVGlBNWtwVFgwQjNjOG4xVE1Qd05PelNUUEhpdldyS1RHekYrcjBy?=
 =?utf-8?B?Zm1PM3lTMUdFUnhBekxhUjV1ZmdDOWxjNVhDRm9qRlQ0RGtNdUEwMFJ3RTUw?=
 =?utf-8?B?dW1ZM1BocVdBQ1pSSEtRN2xxbjY5ME0vZVZ3SGprRGR1VXFFZjZVZS96Yjgx?=
 =?utf-8?B?ZEhxenBFbzVPbmxibm5kSzdhb1EvZkZOZUZ0QTdYenlndUdpdkxmd1hxTEpP?=
 =?utf-8?B?R0VIb2kwU2c5eVBPS016dnNhZFZuRGttcmsxaHFNdW5aUGVtTDZrSTBaSXRV?=
 =?utf-8?B?S255cEIvMzJlTWFuNmhDUXUyVWg5SGwzekVZSzYwTW0xOGthWmkrai96TmVW?=
 =?utf-8?B?dE1vNitFR3cxV1FHVkppS3JZMzNkVEpzOWYzMGNGaXVVSkJYWWNCMVVzYVVO?=
 =?utf-8?B?cS9XbklNUjQrN29wbkVxT0RIRlZUWWV1NFNxNXBULzJWZkhla2YvV3hmZnFV?=
 =?utf-8?B?T3Z2NktPNlM2NEQzajJEN2sxNTFOMXNaSlVHam54NThkOTE4cTBxYis0NXhj?=
 =?utf-8?B?YStzQUZZQWwwbS9DMnR1SjI4TWthSzNhZFg1SzcwajlwSjhNQ1FzMkNVdHNI?=
 =?utf-8?B?NVlNRmpXTzYrbHdBMUVaZnpDR0sxUlQyTUlkbXhPeEFaaHJCaXY1bGlKenFz?=
 =?utf-8?B?aXhESGpvMFZKUHZSak9ZTTlMdXZPZ05EbHdVQnU0WXRpSXVub0NqbkpBc1JE?=
 =?utf-8?B?bEVmcWFVNTVybmFhQmp4dHlidU9lMk5wRjhHakMydStaM3Jub3lMWW5Ebm9Q?=
 =?utf-8?B?cktpaDNlZVZNQzRqZk83bERpTjVKeGlCVjFwNmxveUl6ZmhhT0p2dm53NytE?=
 =?utf-8?B?N0c5clRvZmN2TWpORzV5MnVQVzExaEZmUVFqRFdYcktKN0RmMjUvOXNic3dS?=
 =?utf-8?B?Q1JudjVXVGRCaGtYeG5RZVVzSTlTYzlvSWRja0VRQmJLelRaZGgwWit2QW9i?=
 =?utf-8?B?THZLTHFxN0J2OStHQzZDNHBoVUFFWklrR09PR09lZ1YxTkdoNVFmU016OG55?=
 =?utf-8?B?NXM5cmxVbXJWSFFKMmk1QmVqd3FEOVd3TGM2eFpMYVFtTm9ESWZBMHQrT3JM?=
 =?utf-8?B?WUtvV0c1NXdHdjlsSDZvVVYrQXd5dG5CekFhQ0FPRENJcXVhTmRTOWlPYjRp?=
 =?utf-8?B?NGdKbzNGVXQxK2FHNjJTSDFMS1FlSitmM0w0a2p2SlB0bmZPZk84TzR0Ti8v?=
 =?utf-8?B?SlU0RFV1VE5NanBrNGl2OHdjby82dnF0Q2NFbGI3S0R2dXpYZC9UMkw2eGsv?=
 =?utf-8?B?Tnc2bCtCZTRTYUJiY3M1MSsxNTl6czZiTnlMSmI2RFBQTjFkY1dtRTVTYWI5?=
 =?utf-8?B?cVl0SHBPb1hjOC9YaE43MjR3UWdyMXMrZmE5UzRhaEJZTkVoMjVWTXlaU3h6?=
 =?utf-8?B?NG5LYmY5d3lWOUZ2UUNtVWUvZXNza1drOTl3djZUdHBSVGxGUDNSZFpsZlZ5?=
 =?utf-8?B?Vkc0eUttOHgvd2xEdVNRU081MnVuQnYyY216aGMwQ3hreGd4R0VJR3dSVURq?=
 =?utf-8?B?bFFBcjFINWw2bUZsNXBiRW5QdGN4K3J6dytXVkpxTThYZWJ1MGxDUkdNZ1pB?=
 =?utf-8?B?UTJNc0VNZGZxdXJnemRTNy9XRVlKbG9seHZvTUZvdzBHdDFMd0F5ZXZmU3J3?=
 =?utf-8?Q?3jGFQhNFHf095wbM3kHvohygh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b44a259f-fa6b-4d70-43d0-08ddbfcc36b4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:09:57.8297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJ0mcL0C/5eM6bTuL5TAeMSrpEc8O/YlqQSKo5ZzDGVmmwQjVYCsDpDjxf/Ntqn/WDudbXLJnC0rvsol5Za7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
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

--------------soITeRz7q69OfSUXnngL9p5R
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

On 7/10/2025 3:43 PM, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
>> Introduce kms_debugfs that is expected to work with any GPU, not limited
>> to i915 and Xe. The test powers off all available displays before
>> reading debugfs files, and then powers on all displays before reading
>> the files again.
>>
>> Cc:lucas.demarchi@intel.com
>> Cc:rodrigo.vivi@intel.com
>> Cc:kamil.konieczny@linux.intel.com
>> Cc:katarzyna.piecielska@intel.com
>> Cc:zbigniew.kempczynski@intel.com
>> Cc:michal.wajdeczko@intel.com
>> Cc:karthik.b.s@intel.com
>> Signed-off-by: Peter Senna Tschudin<peter.senna@linux.intel.com>
> +Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
>
> Vitaly, could you help us and forward this to your CI testing
> team and ask them to test this on amdgpu + display connected?
> This should pass as it is a simple debugfs reading.
>
>> ---
>> v5:
>>   - use igt_dir_process_files_simple()
>>
>> v4:
>>   - change test name to kms_debugfs
>>   - use the wrapper function igt_fit_modes_in_bw()
>>   - use igt_display_require_output() to ensure there is at least one display
>>
>> v3:
>>   - renamed the test
>>   - Removed reference to sysfs from comments  (thanks Kamil)
>>   - Updated description to match the display part (thanks Kamil)
>>   - Moved from "display" to "heads". Our CI uses "headless" to refer
>>     to a DUT without display and it is shorter
>>   - renamed subtests for shorter names (thanks Kamil)
>>   - fixed comments style (thanks Kamil)
>>   - updated CC list
>>   - changed the order to test first with all heads off then with all heads on
>>     to prevent the need from powering on the heads at the end of the test
>>     (thanks Kamil)
>>   - removed snprintf from test names (thanks Kamil)
>>   - removed subtest group (thanks Kamil)
>>   - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>
>> v2:
>>   - changed style of comparison to NULL
>>   - moved to a separate patch
>>
>>   tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build   |   1 +
>>   2 files changed, 152 insertions(+)
>>   create mode 100644 tests/kms_debugfs.c
>>
>> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
>> new file mode 100644
>> index 000000000..7e10c4bca
>> --- /dev/null
>> +++ b/tests/kms_debugfs.c
>> @@ -0,0 +1,151 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_debugfs.h"
>> +#include "igt_dir.h"
>> +
>> +/**
>> + * TEST: kms debugfs test
>> + * Description: Read entries from debugfs with all displays on and with
>> + *		all displays off.
>> + *
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: debugfs
>> + * Feature: core
>> + * Test category: uapi
>> + *
>> + * SUBTEST: display-off-read-all
>> + * Description: Read all debugfs entries with display off.
>> + *
>> + * SUBTEST: display-on-read-all
>> + * Description: Read all debugfs entries with display on.
>> + */
>> +
>> +/**
>> + * igt_display_all_on: Try to turn on all displays
>> + * @display: pointer to the igt_display structure
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_on(igt_display_t *display)
>> +{
>> +	struct igt_fb fb[IGT_MAX_PIPES];
>> +	enum pipe pipe;
>> +	int ret;
>> +
>> +	/* try to light all pipes */
>> +retry:
>> +	for_each_pipe(display, pipe) {
>> +		igt_output_t *output;
>> +
>> +		for_each_valid_output_on_pipe(display, pipe, output) {
>> +			igt_plane_t *primary;
>> +			drmModeModeInfo *mode;
>> +
>> +			if (output->pending_pipe != PIPE_NONE)
>> +				continue;
>> +
>> +			igt_output_set_pipe(output, pipe);
>> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +			mode = igt_output_get_mode(output);
>> +			igt_create_pattern_fb(display->drm_fd,
>> +						mode->hdisplay, mode->vdisplay,
> Align here.
>
>> +						DRM_FORMAT_XRGB8888,
> Same.
>
>> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> Same.
>
>> +
>> +			/* Set a valid fb as some debugfs like to
>> +			 * inspect it on a active pipe
>> +			 */
>> +			igt_plane_set_fb(primary, &fb[pipe]);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (display->is_atomic) {
>> +		bool found = igt_fit_modes_in_bw(display);
>> +
>> +		ret = found ? 0 : -1;
>> +		igt_require_f(found, "No valid mode combo found.\n");
>> +	} else
>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> Add braces for 'else' here:
> 	} else {
> 		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> 	}
>
> You could see it yourself with checkpatch.pl with options from
> CONTRIBUTING.md:
>
> 0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be used on all arms of this statement
> #99: FILE: tests/kms_debugfs.c:69:
> +       if (display->is_atomic) {
> 	[...]
> 	+       } else
> 	[...]
>
> 0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces around else statement
> #104: FILE: tests/kms_debugfs.c:74:
> 	+       } else
>
>> +
>> +	if (ret) {
>> +		igt_output_t *output;
>> +
>> +		for_each_connected_output(display, output)
>> +			igt_output_set_pipe(output, PIPE_NONE);
>> +
> Please add some counter and abort on reaching max_retry
> to prevent infinite loop here. Something like:
>
> 		++cnt_retry;
> 		igt_assert_f(cnt_retry < MAX_IGT_PIPES, "Too much retries %d\n", cnt_retry);
>
> Karthik or Swati: I am not sure if this is needed, could you comment
> on this here?

|I think we don't need a retry at all here. If there is a fail with the 
first commit just try if we're able to go ahead after using 
'igt_fit_modes_in_bw' and if it doesn't allow just skip the test here. 
That was my motivation to suggest to use the wrapper on the previous 
revision of the patch.|

|The only issue currently I see(that I just observed) is in 
'igt_fit_modes_in_bw' the try_commit we're doing is using atomic commit 
by default, although there is no reason to have this restriction. So 
ideally we would want to fix that in lib and then just have something 
like below in this test.|

|if (atomic)|

|    ret = igt_display_try_atomic_commit|

|else|

|    ret = igt_display_try_commit2(legacy)|

|if (ret)|

|    igt_require(||igt_fit_modes_in_bw(display))|

|igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : 
COMMIT_LEGACY);|

|Regards,|
|Karthik.B.S|
>
> Overall code looks good.
>
> Regards,
> Kamil
>
>> +		goto retry;
>> +	}
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +/**
>> + * igt_display_all_off: Try to turn off all displays
>> + * @display: pointer to the igt_display structure
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_off(igt_display_t *display)
>> +{
>> +	enum pipe pipe;
>> +	igt_output_t *output;
>> +	igt_plane_t *plane;
>> +
>> +	for_each_connected_output(display, output)
>> +		igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +	for_each_pipe(display, pipe)
>> +		for_each_plane_on_pipe(display, pipe, plane)
>> +			igt_plane_set_fb(plane, NULL);
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>> +
>> +igt_main
>> +{
>> +	int debugfs = -1;
>> +	igt_display_t *display;
>> +	int fd = -1;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver_master(DRIVER_ANY);
>> +		debugfs = igt_debugfs_dir(fd);
>> +		igt_require(debugfs >= 0);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		display = calloc(1, sizeof(*display));
>> +		igt_display_require(display, fd);
>> +
>> +		/* Make sure we have at least one output connected */
>> +		igt_display_require_output(display);
>> +	}
>> +
>> +	igt_subtest("display-off-read-all") {
>> +		igt_display_all_off(display);
>> +
>> +		igt_dir_process_files_simple(debugfs);
>> +	}
>> +
>> +	igt_subtest("display-on-read-all") {
>> +		/* try to light all pipes */
>> +		igt_display_all_on(display);
>> +
>> +		igt_dir_process_files_simple(debugfs);
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_display_fini(display);
>> +		close(debugfs);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 99d7d95be..1009bef2e 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -29,6 +29,7 @@ test_progs = [
>>   	'kms_cursor_crc',
>>   	'kms_cursor_edge_walk',
>>   	'kms_cursor_legacy',
>> +	'kms_debugfs',
>>   	'kms_dither',
>>   	'kms_display_modes',
>>   	'kms_dp_aux_dev',
>> -- 
>> 2.43.0
>>
--------------soITeRz7q69OfSUXnngL9p5R
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Peter,</p>
    <div class="moz-cite-prefix">On 7/10/2025 3:43 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Peter,
On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce kms_debugfs that is expected to work with any GPU, not limited
to i915 and Xe. The test powers off all available displays before
reading debugfs files, and then powers on all displays before reading
the files again.

Cc: <a class="moz-txt-link-abbreviated" href="mailto:lucas.demarchi@intel.com">lucas.demarchi@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:rodrigo.vivi@intel.com">rodrigo.vivi@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:katarzyna.piecielska@intel.com">katarzyna.piecielska@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:zbigniew.kempczynski@intel.com">zbigniew.kempczynski@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:michal.wajdeczko@intel.com">michal.wajdeczko@intel.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:karthik.b.s@intel.com">karthik.b.s@intel.com</a>
Signed-off-by: Peter Senna Tschudin <a class="moz-txt-link-rfc2396E" href="mailto:peter.senna@linux.intel.com">&lt;peter.senna@linux.intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
+Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Vitaly, could you help us and forward this to your CI testing
team and ask them to test this on amdgpu + display connected?
This should pass as it is a simple debugfs reading.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
v5:
 - use igt_dir_process_files_simple()

v4:
 - change test name to kms_debugfs
 - use the wrapper function igt_fit_modes_in_bw()
 - use igt_display_require_output() to ensure there is at least one display

v3:
 - renamed the test
 - Removed reference to sysfs from comments  (thanks Kamil)
 - Updated description to match the display part (thanks Kamil)
 - Moved from &quot;display&quot; to &quot;heads&quot;. Our CI uses &quot;headless&quot; to refer
   to a DUT without display and it is shorter
 - renamed subtests for shorter names (thanks Kamil)
 - fixed comments style (thanks Kamil)
 - updated CC list
 - changed the order to test first with all heads off then with all heads on
   to prevent the need from powering on the heads at the end of the test
   (thanks Kamil)
 - removed snprintf from test names (thanks Kamil)
 - removed subtest group (thanks Kamil)
 - deleted kms_tests() and moved the code to igt_main (thanks Kamil)

v2:
 - changed style of comparison to NULL
 - moved to a separate patch

 tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 tests/kms_debugfs.c

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
new file mode 100644
index 000000000..7e10c4bca
--- /dev/null
+++ b/tests/kms_debugfs.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include &quot;igt.h&quot;
+#include &quot;igt_debugfs.h&quot;
+#include &quot;igt_dir.h&quot;
+
+/**
+ * TEST: kms debugfs test
+ * Description: Read entries from debugfs with all displays on and with
+ *		all displays off.
+ *
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: display-off-read-all
+ * Description: Read all debugfs entries with display off.
+ *
+ * SUBTEST: display-on-read-all
+ * Description: Read all debugfs entries with display on.
+ */
+
+/**
+ * igt_display_all_on: Try to turn on all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_on(igt_display_t *display)
+{
+	struct igt_fb fb[IGT_MAX_PIPES];
+	enum pipe pipe;
+	int ret;
+
+	/* try to light all pipes */
+retry:
+	for_each_pipe(display, pipe) {
+		igt_output_t *output;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_plane_t *primary;
+			drmModeModeInfo *mode;
+
+			if (output-&gt;pending_pipe != PIPE_NONE)
+				continue;
+
+			igt_output_set_pipe(output, pipe);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output);
+			igt_create_pattern_fb(display-&gt;drm_fd,
+						mode-&gt;hdisplay, mode-&gt;vdisplay,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Align here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+						DRM_FORMAT_XRGB8888,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+						DRM_FORMAT_MOD_LINEAR, &amp;fb[pipe]);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+			/* Set a valid fb as some debugfs like to
+			 * inspect it on a active pipe
+			 */
+			igt_plane_set_fb(primary, &amp;fb[pipe]);
+			break;
+		}
+	}
+
+	if (display-&gt;is_atomic) {
+		bool found = igt_fit_modes_in_bw(display);
+
+		ret = found ? 0 : -1;
+		igt_require_f(found, &quot;No valid mode combo found.\n&quot;);
+	} else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Add braces for 'else' here:
	} else {
		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
	}

You could see it yourself with checkpatch.pl with options from
CONTRIBUTING.md:

0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be used on all arms of this statement
#99: FILE: tests/kms_debugfs.c:69:
+       if (display-&gt;is_atomic) {
	[...]
	+       } else
	[...]

0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces around else statement
#104: FILE: tests/kms_debugfs.c:74:
	+       } else

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	if (ret) {
+		igt_output_t *output;
+
+		for_each_connected_output(display, output)
+			igt_output_set_pipe(output, PIPE_NONE);
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please add some counter and abort on reaching max_retry
to prevent infinite loop here. Something like:

		++cnt_retry;
		igt_assert_f(cnt_retry &lt; MAX_IGT_PIPES, &quot;Too much retries %d\n&quot;, cnt_retry);

Karthik or Swati: I am not sure if this is needed, could you comment
on this here?</pre>
    </blockquote>
    <p><code>I think we don't need a retry at all here. If there is a
        fail with the first commit just try if we're able to go ahead
        after using 'igt_fit_modes_in_bw' and if it doesn't allow just
        skip the test here. That was my motivation to suggest to use the
        wrapper on the previous revision of the patch.</code></p>
    <p><code><span class="">The only issue currently I see(that I just
          observed) is in 'igt_fit_modes_in_bw' the try_commit we're
          doing is using atomic commit by default, although there is no
          reason to have this restriction. So ideally we would want to
          fix that in lib and then just have something like below in
          this test.</span></code></p>
    <p><code><span class="">if (atomic)</span></code></p>
    <p><code><span class="">&nbsp; &nbsp; ret = igt_display_try_atomic_commit</span></code></p>
    <p><code><span class="">else</span></code></p>
    <p><code><span class="">&nbsp; &nbsp; ret = igt_display_try_commit2(legacy)</span></code></p>
    <p><code><span class="">if (ret)</span></code></p>
    <p><code><span class="">&nbsp; &nbsp; igt_require(</span></code><code><span class="">igt_fit_modes_in_bw</span><span class="">(display))</span></code></p>
    <p><code><span class="">igt_display_commit2(display,
          display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);</span></code></p>
    <code><span class="">Regards,</span></code><br>
    <code><span class="">Karthik.B.S</span></code>
    <blockquote type="cite" cite="mid:20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Overall code looks good.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		goto retry;
+	}
+
+	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+/**
+ * igt_display_all_off: Try to turn off all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_off(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	igt_plane_t *plane;
+
+	for_each_connected_output(display, output)
+		igt_output_set_pipe(output, PIPE_NONE);
+
+	for_each_pipe(display, pipe)
+		for_each_plane_on_pipe(display, pipe, plane)
+			igt_plane_set_fb(plane, NULL);
+
+	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+IGT_TEST_DESCRIPTION(&quot;Read entries from debugfs with display on/off.&quot;);
+
+igt_main
+{
+	int debugfs = -1;
+	igt_display_t *display;
+	int fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs &gt;= 0);
+
+		kmstest_set_vt_graphics_mode();
+
+		display = calloc(1, sizeof(*display));
+		igt_display_require(display, fd);
+
+		/* Make sure we have at least one output connected */
+		igt_display_require_output(display);
+	}
+
+	igt_subtest(&quot;display-off-read-all&quot;) {
+		igt_display_all_off(display);
+
+		igt_dir_process_files_simple(debugfs);
+	}
+
+	igt_subtest(&quot;display-on-read-all&quot;) {
+		/* try to light all pipes */
+		igt_display_all_on(display);
+
+		igt_dir_process_files_simple(debugfs);
+	}
+
+	igt_fixture {
+		igt_display_fini(display);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 99d7d95be..1009bef2e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -29,6 +29,7 @@ test_progs = [
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',
+	'kms_debugfs',
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------soITeRz7q69OfSUXnngL9p5R--
