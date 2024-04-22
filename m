Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB80C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 10:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144AB10F545;
	Mon, 22 Apr 2024 10:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnjyGubg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD4D10F545
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713783573; x=1745319573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=APGCG1o1XlJ3Um/g+BFkEWqFFdcRqT4m6qI17+by59E=;
 b=GnjyGubgr1hpGsk5DYfwv/QqvbgNnRxRGOkZUlOUSur3uQ7XxQR1KSFD
 bAqznF/R+z74cwduByR8SrpSjf81gz5Eq6z4MaovurEl+Zd+7oiM2nxFF
 n2UGjcnMziYdMKAE3FxkUqkZr91vE2bmgmdETKSdtTRIyx5bWW3CvDjRk
 idVOY7cSSMkkxhbwOw4AuRK1dE+B8Sc9bZab33X6RI9wTOO4/En8jZWUl
 aZ9AKV4fxwKuZrzfbPgxzM54J+OxZZtF6rTvcjkNqBG2vdXavS1TQzJas
 ucxOPIbSv8M0kQrUbdG6YoW/7Ii46MpPHQkMukdS8an6/bvSERTJbzHWV A==;
X-CSE-ConnectionGUID: u3UzY59rRUSqZGFsQZxPbQ==
X-CSE-MsgGUID: d71fvtECS6mGBgUFIHPgLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9171623"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9171623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:59:32 -0700
X-CSE-ConnectionGUID: 8UUtad+GSpOkBG553jiUdw==
X-CSE-MsgGUID: kpaUN9N4RnSQKoh/MvT0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="55191616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:59:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:59:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:59:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:59:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXyIU9e/2rsh93RstImWSbdYALVz0QtYp9YDTubj7f5FpRcCuObDWwXClELrhXtDySIkXwfaZd3cfKld0QIJ+298GEvUFHuHqycbtgvb50TIJbAE1JhZIK0u6rcc62ZBApaQlam18Qr7ryvdYpn3xVWPMzEwphT3esExRv1oYM7imp4zBHCS69c1N08nJcA3PUjt0e3ozTQSzxZ03bcf+DiVKg+7/UmTupuwxQYTrm5iDH1ODRfYiU2dmHNhiF5OtbLbeEmxCsGtyP0fLxrEFMkWNJrHqnOoThFQt/dNjNRAX9afsE5JLZrboU8De2spNW+k3tYiHi2l8lvviFXOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E58k4GiWt4j/Lf+3BoT3FjlpJ23wnzknG3yjZcDRRKA=;
 b=aaaDuRW2+oza6nT/06uDeq9/87EIi4mufO+4yisShLM3D8aYm4qVgyKJQOIGhNcKDYKYpwDHkkITH+WqpddyJEUAW7yc2ZbxW6eNN3kVmw+wZNcvE9deIEq4P88yV8EzskqOJqHcuiRAsKiXkpFVPNAOVGM7AKnG7bqnBLBuKwOQOZ9chZF0f7IIIarzy396GHWzZZIk7WivfSiBCfn3GtvIjegwXv4YJ1G+1RpSsbomU0AoqOahyTnrlHYaLCQbyMUOi+hGAdECrhHfbYyj4RdHWmTCBL0/McOygtCb4Ja3mWsbDcna+lBdIRzKG06lEJfEa3EetIHBVg8Ic795gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Mon, 22 Apr
 2024 10:59:28 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:59:28 +0000
Message-ID: <af4cd241-a9d8-441b-a00f-9ce0516fd25b@intel.com>
Date: Mon, 22 Apr 2024 16:29:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/igt_kms: add support for forcing bigjoiner
 on particular connector
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
 <20240422053454.2523989-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240422053454.2523989-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: e727522f-cbea-43e6-902b-08dc62bb478e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjY5RjRLTEhweG1qL09aVjBXMGxIZUlFYUUwcE1qaWpXTWkwWDJmSko4ellT?=
 =?utf-8?B?amlWeFBWT0cyNHM5OFRXSEJnOUVlVFkyQk11T1U5dXd4M0VXaW1CLzBKVUsr?=
 =?utf-8?B?V2lyWmtXTHFmRjVEMDB3ZjRLaUxzVVB0NUFhVjAvQkZyaWtHZVQrcWRtdjJt?=
 =?utf-8?B?eXVPQis0VkcvdFpaeDBHcnhTRXYzMUdIcGtuSU1qa0pzWm9YSjMvU0M1clZu?=
 =?utf-8?B?TUpFNzl6QUI4YitmVjVWTURKdThOc3BXbFcrd0FMMDFEbFl4Vk1JTnlhNUdM?=
 =?utf-8?B?NFlZRXpBUXhVSUFVVGI5cjBwQ2xOWlU5U09Lc3M5TDFQc1FDR0V4UjZnWHRP?=
 =?utf-8?B?MVQ1UG51MVFHcUovMC80L0VGeDRCdGR3ano3V2ZVTE00U3F4UHhSbFdvc2pw?=
 =?utf-8?B?b1pJeDJiV2t2azcxdzVodW9MdkprVURHNWlFNTBBbVBiVEdJeUpTWXlvS0NU?=
 =?utf-8?B?SUpHR3hGSzEzbUdNWXk5Q2ZQTnY5ZituMmEvRWo5YW8weWw1dnlOMW9RWnJC?=
 =?utf-8?B?LzBzWVlGWENKVHBkV2V4dWwrejBmSTlMV3M0Y1RtR05qdnJXQ0hGVGNQNVpM?=
 =?utf-8?B?SGpXTUFIaVI2NmRGMnhuWmovcXJLb2VVdzNjWjRZeEZabEl1MmpEbURTYVJa?=
 =?utf-8?B?dmxTZHVYY1phaG9HK2wzYkhJMGVJU1VOcjB3S1BSU1FCTW9KZlNxM0NnbStN?=
 =?utf-8?B?QWNwYlJDdUxHSzFYc015YUkzazgyQ3lBZVQra0ZITDMxSEVHdjVERHEvWlNm?=
 =?utf-8?B?Q2VKNFVvNU4wOHNKbFRBTCsvQ1ZDQ1J0dnFNc3kzblgzSU41QzRJeHE1VEhl?=
 =?utf-8?B?TENZNXowL210RGozK3Jjemc3d2srK1JQaE43ZUVpM2dQVkNaV1BJcGwwSFVI?=
 =?utf-8?B?THpwNGl5ZHZuWUZGblhTWlpKTjhpN0VhdlhRRHpsU2pzT3pnMUdkbXpsdGQr?=
 =?utf-8?B?Ry8xeGJHRDVreEUveWNuQlFWTzU2VlBxK0ZJU1h5K0ZCSldmejJmOEY1eCsx?=
 =?utf-8?B?d1dHK3M5M3B0WDE5U1duZUxhdThmaUxscGZFYmJvRGVmN0lyNmdwZmhVdTJu?=
 =?utf-8?B?cU9qaCsrc2xCMlhFMmh4ZUxFcnFBS1hXVlVyc2VsR3Exc2d6dnFMb1NwUXpm?=
 =?utf-8?B?VTlmaTJYT0hsQWY1eXVBSjhrN3NxOGMyOGJ0NWREMURUTmU0TVlxWk53Q29C?=
 =?utf-8?B?cDlrQVJxeHRuN2dUTGM0UlQ2dHlFZlR1RnRwMkEwUE5DcWZFU1haNDJxSFBS?=
 =?utf-8?B?d2xQMnpScjF5VnN4Z3Faa2NqUE1QczMwRkt2RG90WE4rMXI5TlVRL3dHSmxp?=
 =?utf-8?B?MzhqaytzcDhsemNES2NKTHI1ZTE0czRHb3FqQVlJZG5SSGVSbVRQaHVGMDdo?=
 =?utf-8?B?UHdJbENYc0VFQVhHTnhtNFdqS3hOcGdhZTNlK3FmU1lxZHc0elUwckYvV2x4?=
 =?utf-8?B?TnNqdEJFYUJIaE0wTXlxZE04ejJmUmVDZ0duVjFxWVMzL0RPQjgzU2JtWkk3?=
 =?utf-8?B?c3o3c1o1VXB4dUgvQlY0bU50OVBucmkxWHgrUk1mbDRieWlZOW9WcFF1OXov?=
 =?utf-8?B?NG1WZWk5WjBlMTcxeEhIMVVQZXJoYkRjVm9DQW1IS0h5NHlhSkhQZjV6clJu?=
 =?utf-8?B?V0hSS2pycHFWQ01sOXV3V2dVTHJLdGVYODV5WmdybTF3TXV1YWorZkF3VEw5?=
 =?utf-8?B?cnRXa3p2RWxiVjQ0RUVxeVZvR2dTRWRoaXlJNU9pKzF6WmZ5VGJaWnlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpqTlNwSkpXYWRoRFRCVGhHS3JwMENNSG81S1UzK2pGdjFKUzJHOERKTEFa?=
 =?utf-8?B?eFhVMW1WT0NySkl4d1hvWXdZQy9uTkIwZWxFODZBeWRkOS9ieG9Jdld4dlVN?=
 =?utf-8?B?eGZEdEh5d2xaTU15dm9oY1hBQUpvZWpRKzgyeStTaEhDbHcwaEI3Wkk4Vm9M?=
 =?utf-8?B?Rml1YnFRdTVYTU9sQmE4OE5iSnAzTkh6TzdxZXlVaW9Qb3JXL2lkWjdCK21j?=
 =?utf-8?B?UzYya3VIaTJUZlMrVnZtSW5rQlF6M0k5RmpoNkx1VmFMbFVRcWJ6L3doZWJH?=
 =?utf-8?B?RWZhVUdYYVkyS1pqanNGZXdEVHYyTy9QRksrY2JTdExWOXZNNzY3MHl3M2xX?=
 =?utf-8?B?YUtIdXVGUk1PeEdOdWZLeFJ4UVcxdUZhNzBKaFBZVWFJcTRmWkc1UHpzcjNp?=
 =?utf-8?B?Mk1zMk9lMDhSM0E5N0hpbFA3Q3VKVkN5VWYxSTc5L1M1bWpNZ2N5MzhwOGFC?=
 =?utf-8?B?aEdiRDYxTFJWRE51V0RpY3F6MFZSelZEbWhsYWJkcUdJWktFckFqVVUvWVZo?=
 =?utf-8?B?Y2UzVURIRUZBaWQ2SG1oK29yckdQbWJHcXAxdERrM0ZEVXg5Q1RxcURWM05Q?=
 =?utf-8?B?L1NRVC9hT0QvMWtoWUJhZzVHZ2Z6WVpXUGRLRmtUZ21DK2l5RVg4eHVJbCtH?=
 =?utf-8?B?NlNJbllYWVZybFYxdmtKUTByTDF0a2xRUkNWQWp5WlV6Z3Q1MWoxblNBdWFS?=
 =?utf-8?B?K2FjQWE4R01YZ2JleDhEbVBtWmJCNk9DV2poeUM4ME1Ja1B5Y21WR25maThu?=
 =?utf-8?B?b250a1R6U1RKWTUrVGxVRUp6akFGMjE1YVptYXpQenIwa2VDMlJyZlpkTW14?=
 =?utf-8?B?and0amJSTmtUYnlvMzlEMmxCYjZOZW1udVRKalVBQkxOOHMxSVg5NnR3Sk1X?=
 =?utf-8?B?Q1hiT3VtdUxFNXZobTZRQWNicU9lUU5kdEtuSC9TYXIzdWxueURaV2tCdWRu?=
 =?utf-8?B?cE8zTmZMU1FrVlljcmFPMVRaYnJoa2QzTDNsKzRQMU9oZGpmNE5sdHNpYWRL?=
 =?utf-8?B?aVZkQ3RkWkNHaEV3VnQ4NUV6Y0gyTFVZNXk0YjZPZmFVWkhIeVNPNnV4WDNh?=
 =?utf-8?B?MlcvaitJQUx0RGtuNW11NFdyTEo2d3MwMEVjMlptU2M2TEpLTG5yQmNGODB0?=
 =?utf-8?B?c2h4cHI5ZnltTTZWcWRLc2pQRFJVQ1JOeEk1M0xNcGllTncvcUM2aUJvbmJG?=
 =?utf-8?B?LzZnUjdQZWt5RG1WLzloMWlHN1dwLytwZ0w4TFI4UFgyRnFxeFhGM05wODBI?=
 =?utf-8?B?T01xWGFVMUJ4dTFsV01CeFlVcVBWUmlhZytIRURGby93bEgzRUxXZEluV25j?=
 =?utf-8?B?ZmZDUGkzRzJYWFZhY1RkZS9KRjhsUEgxY2hSd3l3Q3FZRndUNk83eUpBcUQw?=
 =?utf-8?B?ZE1qajNlb3dUL1FGSWZHTjlNblFwS0R1eCtQNDNEWVczMC81QzNBbGltckVj?=
 =?utf-8?B?QU9wTVZaQWo3Y3FFQUM5QWMwSEhXQmFxMnc3YW5jWXFuZGh5dHphR3VqZDk3?=
 =?utf-8?B?YndEMXUvcXlVU1NWcC96MWl2VktwU3VqV3VTa21Jb3hKQmZsOWxUTmR6Ym9M?=
 =?utf-8?B?T3ZnWkorU0hmdlFDaEdLb3NZenhCMDdSTk1XTERmTFljc0MyS0JBNHdlbExI?=
 =?utf-8?B?WWNMYW44OEdtbnlGY29ZT1NIUXdBU2FMTVh4aXlaSmJhUUpLZHF0YUtlVFZs?=
 =?utf-8?B?ejVDSVJxTkFIMXV3VlhYdWNkZHBYSnZqK3BmN1VtRXJZcDF0SURXSHgvT2Rp?=
 =?utf-8?B?Szc3VXdxckFtaDJzOFlDNGl2bFV3V3dGdmlHaDV4MGozYWJKV3MyQTZUZkY3?=
 =?utf-8?B?eDU0NEd4T2UxblR6aFJLUzRjSG0rM2I0cUJHNUM4RGp6NVJEUGlIdThyeGVs?=
 =?utf-8?B?K3dQOFNJSm5pcURkbk11bW1qcWxwSDMxbzBlbHVwZGZDdEE2UGRHWlVxZUg2?=
 =?utf-8?B?N20rSmVlR0h3VHE0bWVINTFzd250Tk5xMlNmcEVScG5IUVhEYWJoQ1ZnNFJK?=
 =?utf-8?B?eFhWRTJnUG10T1lSQmJSK3Q1UGRIU2xDelFWQWhkdzRtV1k3VjdNck1zM3hP?=
 =?utf-8?B?MGc1cStJalRiZy9CNFFBTjdGS3duVU9PRDBlbmxXRGtudkZ1VXFJNkVWL1Ex?=
 =?utf-8?B?a0lpcWNXT1N5L1BmUEpqckJUblhmR0VTcmJ1NGt4UjMzTW4xV0FmRWtqYmFD?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e727522f-cbea-43e6-902b-08dc62bb478e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:59:28.2279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTqjmeAZbQfR0/JDG24EgHeXtjz4MEgjbRP79vDKe676yJiiAKUmabwOew+pCKmM1LPAleBFtV2rSXa5etjvvmugtiPojrvIEQ5H4gOou2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
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


On 22-04-2024 11:04 am, Kunal Joshi wrote:
> add kmstest_force_connector_bigjoiner function which
> force bigjoiner on provided connector as well as resets on exit.
> 
> v2: remove redundant function (Bhanu)
> v3: initialize idx (Bhanu)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 74 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ee8848079..c3fd7245f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1607,6 +1607,36 @@ static bool connector_attr_set_sysfs(int drm_fd,
>   	return true;
>   }
>   
> +static bool connector_attr_set_debugfs(int drm_fd,
> +				       drmModeConnector *connector,
> +				       const char *attr, const char *value,
> +				       const char *reset_value)
> +{
> +	char name[80];
> +	int idx, dir;
> +
> +	idx = igt_device_get_card_index(drm_fd);
> +	if (idx < 0 || idx > 63)
> +		return false;
> +
> +	snprintf(name, sizeof(name), "%s-%d",
> +		 kmstest_connector_type_str(connector->connector_type),
> +		 connector->connector_type_id);
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
> +	if (dir < 0)
> +		return false;
> +
> +	if (!connector_attr_set(idx, connector, dir,
> +				igt_sysfs_set, attr,
> +				value, reset_value))
> +		return false;
> +
> +	igt_info("Connector %s/%s is now %s\n", name, attr, value);
> +
> +	return true;
> +}
> +
>   static void dump_connector_attrs(void)
>   {
>   	char name[80];
> @@ -1690,6 +1720,49 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>   	return true;
>   }
>   
> +static bool force_connector_bigjoiner(int drm_fd,
> +				      drmModeConnector *connector,
> +				      const char *value)
> +{
> +	return connector_attr_set_debugfs(drm_fd, connector,
> +					  "i915_bigjoiner_force_enable",
> +					  value, "0");
> +}
> +
> +/**
> + * kmstest_force_connector_bigjoiner:
> + * @fd: drm file descriptor
> + * @connector: connector
> + *
> + * Enable force bigjoiner state on the specified connector
> + * and install exit handler for resetting
> + *
> + * Returns: True on success
> + */
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
> +{
> +	const char *value = "1";
-------------------^
Do we really need this variable?

Anyway, overall the patch LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> +	drmModeConnector *temp;
> +
> +	if (!is_intel_device(drm_fd))
> +		return false;
> +
> +	if (!force_connector_bigjoiner(drm_fd, connector, value))
> +		return false;
> +
> +	dump_connector_attrs();
> +	igt_install_exit_handler(reset_connectors_at_exit);
> +
> +	/*
> +	 * To allow callers to always use GetConnectorCurrent we need to force a
> +	 * redetection here.
> +	 */
> +	temp = drmModeGetConnector(drm_fd, connector->connector_id);
> +	drmModeFreeConnector(temp);
> +
> +	return true;
> +}
> +
>   /**
>    * kmstest_force_edid:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6d13e5851..0abf450c1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -262,6 +262,7 @@ struct edid;
>   
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>   			const struct edid *edid);
>   
