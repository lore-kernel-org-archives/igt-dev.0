Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAB7CCA471
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 04:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553B010E044;
	Mon,  6 Oct 2025 04:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwtGnrIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E910E044
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759724608; x=1791260608;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ga2HKhMAG6+2Yi25ey7v12hopCe4M+40sGC7rrjej3U=;
 b=RwtGnrIzO8bWdiBiYa2Bhg+uXtPyO7kBLpQAEsgnWqp8FPeEaZ66KlN2
 kaKi3rcJRTkK0ZXsEIwdlg50hSdlcad3BpJfqAfkj7syOPn7goyTaKc+d
 2uEC3xzTNZrdduGH9DEb1yPJE1EEJ1szEXciCy4NkPvd6pFAIsk+w8ttS
 h6TEEeiY+VDswraW1XpplWcWCBOkUoiUzwVwmLaIuVfZKORovsl12KT/U
 o/gFgVupmn5/WJ4RmWktt5pAUSDgLkg/ctW6rLJlhRQjmK9orm64GQydb
 OH58Szj8Z5U0bSP7ucy4hNgm8ZT7OXuezXBcnwb7FeC4MK+iFu5CZLn2q w==;
X-CSE-ConnectionGUID: R/KCuMNBQNuNI6lVHXzLUw==
X-CSE-MsgGUID: G+o1QsF9SHOgaqywZgpwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="72513028"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="72513028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 21:23:28 -0700
X-CSE-ConnectionGUID: Y9zuRWsjTKqmwLWLqyfOaA==
X-CSE-MsgGUID: AiW7g0VTRO2XKgrCarGDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="183809203"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 21:23:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 21:23:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 21:23:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 21:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/GKyIk8weczsgjerMh8ZrpBLyaP4yZZSfQ5eVK7IX8plfGG1ktk5FqrmLdkrNV4xADoRETMbZ97HaBvDs+j3/5O4iAi+G7q8tVfeslS+GNLoRQCrCQijqz+zo/dh6oQlh8zcFI8c0N1SO4BLt3HuPOMq0mb5AdLIUPfa9TlmsKQ1eJf3bhqYdKuVdqxEXdoEzi6Tu3dozs0BENdrbaZLgmkQG0a1nD7b+hHcOYZ8mZoZ40ZEbR4gv7zkBJ6PtrEIRNwSajC7ZJOa7KST2hlvdxeSAmDQpBFA2WiUORx2ckyQMDwLEYBnAU6RnjFY0cLPM9LL6A2+stGIJ26D62KFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuHg78L/mw2u9hknP5d6ymzMlBhjVKPU8xede98wvwQ=;
 b=h0ygppLWLymmQ2ixFXc4ykOxjVwO+akSFGC0BVW9pYD8W5IgjYmb1ZmiKb+O9LkmeWQOhrjjfxNekeeYsN1sAoQ9hwi9iGZI+2cGraPLhIdqZOP2qT3jmPB0tqyiV+/KW3n9Ycdc3BolsncL+3ixD3DQct5MdV3nMEcuJxaFmIaatdO/OqYzdWSVl3+0MhpQiPBCKGQjGC5JBcanVBGK44pnMMKscbrGra8NXadA6a5eT0Eikm8qvD+L6OGK8g3HwRl3wIZGIaSG7pYfLIRtcF5Vwzi/6bi9h88Dfr0D7X/vIT0IYKP1OcVxiAyNiIov512Kg0SvdKr9vf9/AFJh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.18; Mon, 6 Oct 2025 04:23:15 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 04:23:15 +0000
Message-ID: <c513db2f-0aa7-4383-bd78-d2fc8bc3227d@intel.com>
Date: Mon, 6 Oct 2025 09:53:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Govindapillai, Vinod"
 <vinod.govindapillai@intel.com>
References: <20251003080206.569347-1-santhosh.reddy.guddati@intel.com>
 <DM4PR11MB631273F1D2A1D97DD1701C8890E3A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM4PR11MB631273F1D2A1D97DD1701C8890E3A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: cde5fc93-6d03-47e0-99c3-08de0490118b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXNFNWFMd25TbldXd0ZLcTg2RmREaEpiMVE5OWJjdU9iTlcyWTh6K3kwSzhZ?=
 =?utf-8?B?czc5ZHZ5Z0pEVjI5bzR0VmM2YlJKOHBNUWFlOU4wTVJRZUVJQzNBRGlQV3hT?=
 =?utf-8?B?VERFU09wb2xJVjZFRmFJZldXYUhtZzdIQmM2alhWQ2ZUWHB0b2hndG9YNTM1?=
 =?utf-8?B?TkpLUSt3S1VqN3BEeXpHL0NSVTZjZk1rR3NnSXo5T3F6cklLS2dRYWxlS0NO?=
 =?utf-8?B?U2dZd0xrcjRTN0pMSjdUaUszUDBQT0EvZ05zeW5RQVdCZDhkK3BxS3RmR0ZX?=
 =?utf-8?B?ekdTVGc5UnJHS2tnOTdiL0lrMy9vNm9tU2ZzYW5yc0hJTk4zT1JpWDd1SFJu?=
 =?utf-8?B?cUtPUjliNXpUenMrcXJYV3UrVTU4WkgzQlRMUkRRU3Y1THhub1JWSC91cE1M?=
 =?utf-8?B?bjVLUjdSNGp1MUh5ZFk0QkhjbHZNRkY2TE9jMlp4cFlKbnRaSldMcDBGSy9T?=
 =?utf-8?B?akxJUjRQWmVRU2k2MUoxa0lRd1p1OWkvWC9EeXZ1Y0lLNGZrWVhUNU56Yk5O?=
 =?utf-8?B?Z3lpcTVXM2ppTmx6NXl0TTFSVXp6UDdGMmZrUjREdHBGN1BrZE5ZdStxT3E1?=
 =?utf-8?B?R3VwQ0pRYnk3cUZ3Nm5PMjJBZit0aFM3VEgvbmMwSmRPMjlIVkM4NzAvdW9Z?=
 =?utf-8?B?dCsybktSUDJONy8wTzBma3lvc0RYRy9pNXNvaXlRQ1ErOHhwU0N5WERQRDFH?=
 =?utf-8?B?K1NrQWVXaDJIRllyRDFjVHFLVCs3SGo4MXZGYTQ4REsxN24zbWU3WkQ3MXFV?=
 =?utf-8?B?MjAxelVTM1luUXo1UDF0YkNUa1FhMnJLY0NzbUlsTkFLNFBhZW1aeStJQVVm?=
 =?utf-8?B?WkJtdk5JUlRSTmEwcFpqQ2hzQWJENCs3R2lQcmphblorMmRGcCs1bEw3czl5?=
 =?utf-8?B?RytJQkMxT1BjQmlrSWJKQkQ3ZXdBNkJ6MDV2VGJWWGFrNmFXSk9RVGJaQUNB?=
 =?utf-8?B?dnYwL0pPRFZoMU5TU3c1ZXExYU95YVVZTUU2a2VOOGJkK3ByL0Vhd3pBTWla?=
 =?utf-8?B?VVR0blhlaFdRcERyakRCWVJDbG9WdHU0MFM1d1duZWxIK0ZSeW1ZcnM1czZu?=
 =?utf-8?B?ZTFHbnB3cVgyK1FDQUdSSkZWQlpYNjhaSVd4RWNLbjFwck43SmxQL0J1TUk5?=
 =?utf-8?B?NHdqWmgzWVBDNFplcXN0bTF0Wjhhb0NNMk0vcjBuNEFxc00vVVZXeVhzRGFQ?=
 =?utf-8?B?V3JmWDZOMEJhdVJ3M1NLUkQvbkZpenJhWG9KS045NTJGbitnV3huT2p1ZFNy?=
 =?utf-8?B?VDJJbzY3UG9kR3g4RXRXMTZldkNabnRkSFlId2Q5cVdaS1FwajM2ZDk4eW83?=
 =?utf-8?B?OUgvTkVoczNnSkdmSm8rUmVhRlk1Qkk1NjNGc0pSNU1IdHNmNTV2ODJFQXl1?=
 =?utf-8?B?N2RYOWJuanE3MURJWTlJQTd5Y3dFMVovNEVaeTdWZUxpSlZDb3NwUmo5cEkw?=
 =?utf-8?B?RE5CWWJ3Qlg2cVY1T2c4Q0pXT3J1TkRybERWRlBxVVhvamtJdWMvVVpHdzFo?=
 =?utf-8?B?UkttbHkwaGhzenVCVDhSZFQzdXRISkVzbjUySFBGVG9ta1JjZXk0NG9ucUcz?=
 =?utf-8?B?WFZ1bTROTmI1dko5dHF3VW5sQkpycE12N3p4eDc4WDJsUmdQNWt4VW5FWTZj?=
 =?utf-8?B?bFBxdU9sQytFYjhWNm9WWkxZMTA2WUlxZFFtYU1HR3Bsc3Y5SWdXM2h3NS93?=
 =?utf-8?B?QTZyZ2VhRHU0WWo2YUdyYjBqd3Zzc3ZPTjdKM3Rnc3UwT3ZqOEQwYzhhWXdH?=
 =?utf-8?B?cEI4eDZEbVN5M3IvZVE1MkpPVkxxUE0vVk1JRldtL1ZsenNZQk9kWTE2Zmda?=
 =?utf-8?B?VGlqWVJQOFovbENGL0JzaVBwUlc1eTFzdStQWTZQdTR6d1lWVnhXeFpJb1JB?=
 =?utf-8?B?UUF3ZmR1NWxYVTFkaTFLWHFqOU9uVHVuYlBncFJZYS9xR3J2V2paTnVNa0tZ?=
 =?utf-8?Q?ccJ6sU16WND1OhEhu6L3FN/OantNc621?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJYQkxveWhXSHVwWmhSejF5djlaRVVZMmdIeW1NWXdIeDRaSnRiUjM1ZkVN?=
 =?utf-8?B?dkRhWFZVa2RjdFpmcmtTY0M3WnR0b01qN1R1UDErdFdwSzE2b2xYSk9TdjFH?=
 =?utf-8?B?bW9CczRDRkN4d1RZVC9PaXluZENlOUxLbG1jT1FQbFNxSGEyeHJRWFlXK2Rj?=
 =?utf-8?B?OVZDaFZlQ0Q2TDB4WmFuSS9VN04yZ3l1WWQwQTE0R1pZZDFST2t1VWc0Y0ZZ?=
 =?utf-8?B?a1FOUzg3VEFXSnB1K05Sc2ZXY0JRM1J0L3VDU1pZY3pKS2VmQTdZK01POUVD?=
 =?utf-8?B?dzdMMGVzeDc0YWM4aUtyaDFBcE95MjhxNFJDczBUL1JjT1BXc2ZPTVlnMENW?=
 =?utf-8?B?VVN5M2swU2doRDJ4Ky95Z3ZxcTF0UWVUS0hkM3lIN1JKQ3F1ZnFiVk03T1B1?=
 =?utf-8?B?Nng1c0dSWE1jc3F0VnBGSFJjNkNLS1hIM3J5aXhVRWgzK3RvL0xlVWRZZzdv?=
 =?utf-8?B?UmNGS3A4OXFlU1lrbU03cWFKY0JyWTdIR3VFeVNQV0ZwYXR1NWZKSVQ1bE00?=
 =?utf-8?B?SmZNaFo3ZnhzWTRkT3V4bHpVZU1BdzVxcDFhVm1NWTdxOUdjN1R1bElsUWJY?=
 =?utf-8?B?UnBlVkM5QTIzOUtaRUJQa2JDNkhkNUhVR3NWbmNzMk1hNllxKzI0aSsyK0k1?=
 =?utf-8?B?RWdyWTJ2aVdFNkdVNWhNYzV3bEdZOC91TnFLWDVDUVB4VUp0SkZaNGlLREZl?=
 =?utf-8?B?Vi9WRXpDVWJrTVpVTHdIc3lQU3g1TWNKYlQ3NE56N1JRWTZiVzVGQlo0anVP?=
 =?utf-8?B?SS9USExUeUVqWG5rZDczRjJYRUcyYmszWGZ2MkFPRGpTRnVocHJGZzVHVjYw?=
 =?utf-8?B?YzMrekZHQW05RS9tKzE4cU1SaFhMZzF5UWNzMEU4TmpVaERaNU5pdG9ydkNS?=
 =?utf-8?B?MU03UTh1MUNqTE9kcUxDaWVLajhhSXU3cXlHYXZJTXFSQnk0Qk9DYmZobWZZ?=
 =?utf-8?B?NVcxOTl3NHlMMGY3SHBzVG1ydDZmVWxTYVRzeGRweVNZbHdUcjNGVGd2QmFt?=
 =?utf-8?B?Q29QRFRqbkF5ZWhEUVZSQi96bHdCOHEwZDgxdm9KL1pwVDl0N2FxVzc1ajNE?=
 =?utf-8?B?WHI4WkZ5STRraFVrb1N1REpaM3RDQmFFSys0eEcyc1BEZFJJbkVmdnBkS3NR?=
 =?utf-8?B?djdGcjZBUFZhazVtZzJMcS9heXRSeDJuODZEaWJlYk1hZE5ZVlRUOHUzMGlI?=
 =?utf-8?B?WXd0eVh3SGdUN1RaVkhZbnNYYWRIYjgzNytkVnFnSUc3WHVKTlRmdFRoMTdC?=
 =?utf-8?B?eVNPTml0aER0WnhpUXJ4MnZ2VTFjaHR5QS82dXhhQjlwN3NRbGphWDkzNTFB?=
 =?utf-8?B?UjBNQ0d2aUh0MG5CVmx4R0U4TGNRRXZ3MWtlejF3NWVDaVIrVUphRndKV1RI?=
 =?utf-8?B?NGpDMDJrdzRvV3QwdmtBempHQ0FWMWJwQ01uZ2p1aFdpU1hteS93K3dNcDZh?=
 =?utf-8?B?Z2x6OU9PdjJxU2phK2xOV3VvQkRYRlkzbWJCa05yOFBzSFFpWTg1RGYvajFq?=
 =?utf-8?B?NTNSanV6WEhzcWxuY2RGajNoTEw3Q3VQRmoxajVETlpRMExLU1IvcmtKMS8x?=
 =?utf-8?B?T0VFZ3ZzMXZqRkdlNlNqQ05lc1Z3aFcwN1RxT1I0NVhjTTJMT2NyWGJHbUdp?=
 =?utf-8?B?Z1VhRUFPZFNQNjVHdlRJOUg5ZXpmOHlvRWR1N1hOTzJZU09IYUFPbU9uYW9B?=
 =?utf-8?B?T3B6Wm5hZm02TkdvSHdxTFUzWEN3Y1h1UnZKdGpiaXI4dDNuS2tEWlh2dVBy?=
 =?utf-8?B?ZzJGSUljZHlGSk5ZTjBUTE16Wm5iOU1LUENrekhNVzlnbHNMSCtqU2FsM01U?=
 =?utf-8?B?VWVrV1cydmpYYkF0VzJMUFdKTDAxcmlJQnQyUTZOM3RhMUtveFBwYkFqVUo3?=
 =?utf-8?B?NHgyZEljUGR1ZmFscDBQZnhvMUhjRGxnZEFxZHQ2VFg2TTg4cHdYNWFDc1Y1?=
 =?utf-8?B?UkNCSll4Ry80aTRRNDJId0pleWd3c0xoOXVPSVhVWVJUd1VxbERwQ0M5M3Rl?=
 =?utf-8?B?ZjJtamtERlhhdDVkSlNMZVZpRlZTMURsMlNtU1V1ZXRDd2ZybWg0ZEhZMERz?=
 =?utf-8?B?U21kMldWb0E5KzlHeVUyQzZzMzNFazhlVnhZZk9tNE5vUU01TGErdGo2S0Z1?=
 =?utf-8?B?Nk9MclRKcC9wWjYxWlRNS3hVbi9WcmdkZFVBd0ExZE93ZHNZMzREc25pRUVC?=
 =?utf-8?Q?N72g6JNx/Zp7xZOBn74fvwY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde5fc93-6d03-47e0-99c3-08de0490118b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 04:23:15.3620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TZRuohxvZZzjaKpFqHYDFhEEgmy99lGzw0yAK5bRNT6ndOlUh1/ZQORatgJXHNw210BaRHbmn5qsESFRir3Rkzx/pXtBT4EjMlB+3a8eAddaJplHgrukCWElNr41shj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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

Thanks for reviewing this.

On 06-10-2025 09:23, B, Jeevan wrote:
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Friday, October 3, 2025 1:32 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>> <swati2.sharma@intel.com>; Govindapillai, Vinod
>> <vinod.govindapillai@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
>> cursor check on simulation
> Need to change commit message to make it more clear.
> "Skip CRC check for FBC  cursor check on simulation" Something like this.
> 
> With this Patch LGTM. Also please report the failure is not related to your change.
> 
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

I will update the commit message while merging the changes post 
addressing failures.
> 
>>
>> Skip fbc_check_cursor_blinking on simulation as it involves CRC operations
>> which may cause hangs or false negatives during test execution.
>>
>> v2: Move the check to fbc_wait_until_update to early return (Jeevan)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/intel/kms_fbcon_fbt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c index
>> f3843cdb0..810bc5114 100644
>> --- a/tests/intel/kms_fbcon_fbt.c
>> +++ b/tests/intel/kms_fbcon_fbt.c
>> @@ -183,6 +183,13 @@ static bool fbc_wait_until_update(struct drm_info
>> *drm)
>>   	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
>>   		if (!fbc_wait_until_enabled(drm->debugfs_fd))
>>   			return false;
>> +		/*
>> +		 * Skip cursor blinking check when running in simulation
>> mode.
>> +		 * CRC operations are significantly slower in simulation,
>> +		 * so CRC checks are avoided to prevent false negatives.
>> +		 */
>> +		if (igt_run_in_simulation())
>> +			return true;
>>
>>   		return fbc_check_cursor_blinking(drm);
>>   	} else {
>> --
>> 2.34.1
> 

