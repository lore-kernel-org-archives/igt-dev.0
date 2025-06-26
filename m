Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC53C7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF610E8BB;
	Thu, 26 Jun 2025 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NV6tRlTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6EF10E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750927640; x=1782463640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8L0yKghsJm671hkq1Df4mPtfeeWKLiIDzlwTUH1KNRY=;
 b=NV6tRlTm1vKR5o5fnUakvSmoMB0zGZL1UK4iePny9inpqjhwqfhBEmKx
 GLHI+zDDo5RqEaV285j4nz+qmv2oibnE1vek8V0sguW9uFztqIjVUuFzD
 oI6KBwYMYCQYh4XM6j4r7X0yN+sddnbK6UQezVQHo2v6rPi67U73BAhDC
 62Z+zzCXQSbTZXSEMpvAiSbzOJhy5+LovpWF+VMGnRrtUqsAHp7kOyYqd
 iu0h4/b6YcMcWKr05s7lLtkzKBSfa0faDHXsjjX8AGAihuCgH3sqs7qhh
 MHAujcjb7e9WtzrVYEtEDP0HLCMPMPMqu2MJx4xqOf2uTLTZ+VDSAtP4T g==;
X-CSE-ConnectionGUID: LseUluFnSiyNn2o1EdgOuw==
X-CSE-MsgGUID: CcliPmrKRNesyVOq91RrBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55839583"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="55839583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:47:17 -0700
X-CSE-ConnectionGUID: DQUs1CKjT4WjoZ7UBJzPsg==
X-CSE-MsgGUID: YauXFYDARMGb6B/2MB3DWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152756319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:47:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:47:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:47:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILRdBpC3dnW5PQv8xhjDCdBYbutPgrFWGGSZfabulKBq14y/+N+T7VyiCS2SIZDd5KZ89hjPDPhXzw1wmrcNdcdpiJopQcoVWzWSjFotgNEQgOj+iQ3nmAsZkEqO4UQfHrH9cGS1o1k2YVSxjbKVBe088qBxX9hmMyNMSz87a+xW5aO3IkHpBLInuxYB2jagIsPxE9gfEzfk1hVttPIoeEVhTrourpFu/Bxp6MwtQuFKPuMviQXzD2M468jGXwi1MNDWlUWiiy31+4a7Kw7j02cf9FEAOGTHQ4iyYb2B2+6a1/W1gA/NRCWHIyjY/cVpCWsLjAvDGzBS5cCkRWuWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipGRxy0Rbw18IiVGFb+qYxhDW+BOX06ryfHb2u3rWYQ=;
 b=UG7nN1lhdXX04uRd7AXMsceZNgfC+bqKD1hIaYuPbgJrRN/+emFaCKG0JlH8t0PSDyY4qv7cBYDoPMygQHAh73ArWMSHfPlHWl9CCZUFoWy9hZMOXsoIAc9Dbp3sLqK5ISDIwHOjGJoZvTPh0fsi+lQKVZX1S7bpRrUh3pXjXjQFGDgyxD4mlG9J8+/tv+n73/NlJmEZ+fDm/DzfrhNU4P4x3/3mh2QDSC5htgTCFxruZHmPDnzS6yKnw02RcQbV+GD/kwwKef1OWLYRi0cfG9LAIfb/OTTC2MmOnZvUA3CPgbHYyKHHb1DMdfOQ4TfLpQ2a5nbDd6uObWRNLs94qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 08:46:47 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 08:46:47 +0000
Message-ID: <627b7ae9-73a7-4f5a-b85d-9c50f4d342cb@intel.com>
Date: Thu, 26 Jun 2025 14:16:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v15 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-6-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623110918.606014-6-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c57008-bc29-40b1-35c4-08ddb48dfc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVNnMGtkUUoyNGdTNGR2ZTJ5MkJMWjNhQXpLYmZic3g2VldKMWNrOThVK1d3?=
 =?utf-8?B?RUZweG45SC9LZENJOHVhbEVyUnc0ZEJhRnRISkVMR2pmbndQb2RuRWt1UHJB?=
 =?utf-8?B?ZEtyUWZsbXpWZjhMUzlYSWY3bndKK3kzMU5seUNzbDY3Ynk0V05LbFI2SG9w?=
 =?utf-8?B?ZVk3Rmt5bjhhUTh1Vm1qb2ZOWkRkVHltVTArMnY1MzNYdkZTbGF3QStMT1Nr?=
 =?utf-8?B?QlVaMUtUa3JZMmFhQVp1Y3VrY2ZiWXJVdEhjeHlGU3J0a0dqT3FOdVhnQWpl?=
 =?utf-8?B?Z3p1Q3MwZGJITFZaWEUxaVRFcWl2SE04djJiZXl0T2g3Q21GdzNxNXViR0RD?=
 =?utf-8?B?ak1rN3dJVkkzMmRsSkpCVmtZaks5OGJSbGQrYWFkVXRjMHZVbHA3ZU1ZUGY1?=
 =?utf-8?B?ZVZ6eFBiSVh2RzNKcmR3aTJKbTNZOEZMa1JndmczT0YrSXdjcWM4WU1NNE1D?=
 =?utf-8?B?M21mMzNWUU9SeElReG15dFNFV0RoU0JSVkpnbml6U3RPUHl2cDhkeUEzcGJj?=
 =?utf-8?B?S2dJOWROR2tnNTkvTWhKL01wcTlSOFQ1NStoWEVwNFV3c1VhZ2xxNzE0VTR1?=
 =?utf-8?B?QU91b3B3eEk0djltQ2daSzJNRUh6cmxrbWZwK0tqOXJzV0VIbkxoNEFTRHBo?=
 =?utf-8?B?bzhHWVNid0ZMRjJaQTZkQXZMWEUvK1JJblBtS1QwVTBidzl2U2pMRGkxQnk1?=
 =?utf-8?B?YWhBaXBFZVNOVzJ3K3pLd0Q5NkdncVhleTlmdFM0N1VWd2JaTjlIQnpGTUN3?=
 =?utf-8?B?SUZHVTZHeWRXVkpldm1GYjN4YU1QTXUrWjl2b3ZsUk1YaEduUFIvYkZSRk5I?=
 =?utf-8?B?aUdHS1ZSem1KT1hyb1FiTjdpNXNLREhVMFN3ZHNuMHErZDNFRmRwRE5KU3Vr?=
 =?utf-8?B?eHZWR0l4bmU4MTRWaDRQc1BDNjJrK2t2L1JTeXREd0lpMnFQaTg0dUVpMzdN?=
 =?utf-8?B?Zm9kZzZIaGtBa1lkTWhrdUZJZFV6d1A4N1RiN2h1VThKWnFvc0FHb2duSVI5?=
 =?utf-8?B?cUlsdnd5VmYwYkdvc2drbHg3SDI1ZEM1ZUpiYlZHcng5TEQ4NXZLbDh6dFlW?=
 =?utf-8?B?K1pqZmNwV29PNVBvMDdIeXI0bVY5SHBIMmwzWHh1WlZrTEYwK08vUmZDR2Ew?=
 =?utf-8?B?alc2ckJzK0haU2cxb2NDK3FmbVNraUhLY2pka3NUeHpLTi9BZ041bG5JNjVu?=
 =?utf-8?B?RGJGS2k0U3o0a0M3TWNZVGM0cWJCMVVkdlo0QlNhOEZBVGk0ZEs3aTk4QWhZ?=
 =?utf-8?B?ejEzYXJ0YVFXTS9RSVQva2ZlRVlidW51RFBhekh1UzBSVVZsL05xVGY3bXJC?=
 =?utf-8?B?aUhqTzJ0K1djQ1MrWXJGbVFSdG13Ny9aWlRLMWVWRVZEM2dhMDl2bDdLSUJF?=
 =?utf-8?B?aitHdmcxU0dpaGVvbU04ZHJPemNKM1ZtSm5RdGRlZ2kwUGxnbStVTUMrWUIw?=
 =?utf-8?B?QkJ2MXRYZFpSMzRFRTBVRWphRlpoSksvMHNYM3NXTFlXYUhPbHNZd0ljSWRS?=
 =?utf-8?B?QWkwWlNoY0k4d1BKWVRKNVdueC9zVjRoQVVRWWFoT0RERTFFOEo0UEdaeFNn?=
 =?utf-8?B?d0ZJK01tRWZsLzd5cVY5dnVtQVdKTWdyT1lZVHZ5eG1HYTVwMlByOGpXRGpG?=
 =?utf-8?B?WUVNenlxRWFxY3FKU3ltbUovMm1MMjhCL0dsakxZYk5kSUFUWFpTRlZMOXhR?=
 =?utf-8?B?d29jSXNEeTRzVmNvbkl4ZGFNMVpjUnVLMGEzWVZxS0tGWHpWVWlCYjk3VlJH?=
 =?utf-8?B?ZDI1eGRZN3lEVEM5SjZiODNXVGtHVS9kWVBlOHNGRDVlNnAyMGJZZlFhVHR6?=
 =?utf-8?B?NW1oQ3BRczVlc0hzQ0hFUHU4MURQYnZZVXdHOFR2dVk1cVFUTG5SeTMzbGgr?=
 =?utf-8?B?ODBYT1psRVA3MENDVFVLMWNOZjRXd1luUHRrenZ3MTRzTGpBeElYTy9WQVRs?=
 =?utf-8?Q?I7ALGo3rBG4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUN0bzNjY3pPQUNaWHhmWjhXM2RHRDNkcm1sVzkvTlhyU28yUjVWWnROSVh6?=
 =?utf-8?B?UkdWV3JhMG9YOTBnYWxDbkgraWNRSStBUUxLQ0p0RkNIU0VRam9iM3ZoQmVs?=
 =?utf-8?B?T0hTQThxRFhNSTBZS1F2aTFUTS9CMTR1bzFPeWw2ak85Y3RmemYwck5UUTVB?=
 =?utf-8?B?S1VxWE5DS3EyRWQ4NDF6dm9xK3hjVjZRdTVpc2ZqamVlRzM1eUZyZTlyNE9a?=
 =?utf-8?B?VlFDSit4M08yb1V5eENIQmliOXhBUDhQYVkrNWdGZlN1ZzROQzYyNFBzZkY4?=
 =?utf-8?B?enV2M1BEazNXZlpYQUpkaDhNZk9wdjJ6MDhhejdyQzRlMmhJSFZSWGlOKzJR?=
 =?utf-8?B?c0hFVHRUTzlBNnhsTjhYWEtHMmw5WjdNUTAvS0FoKy9mZWZzMHJXRmoyQStr?=
 =?utf-8?B?WWpPOUhBNkhvTGI0MWVyTjBMWFRBSEFHeEFHRldHeWYwcWErbmpIdjRaUVFV?=
 =?utf-8?B?OXFZZHdJemdESFR1M21OVkFodUcxV0NxcFl3SkhUZkE0NGhjQ1MzYTlPcTEy?=
 =?utf-8?B?c2pxLzQ0dGdNUE90M0tieVRSd0dsc09pVFp1S1RpRGZyWmRxQXYxbWh5aTRL?=
 =?utf-8?B?UXh0VEVJUlUzSDBuUWRzaTFETm1kUGFYbm42WHpHdDkxZ2JqbnBmYXdYcDdt?=
 =?utf-8?B?WW9JSjZsMkFLVTJweDFaUG02ZzN5U1ZBL1hhOE5KbTRqR2VZVFdGSG1ud1Zj?=
 =?utf-8?B?SW56c0l1S0dyc2gvRkxCRUxvcmd6WEQrMWJmTE8yYWxsUUxMNFpVcTArV3p4?=
 =?utf-8?B?OXA2UjRaWGFZUld1Vkhud1QweGc1eC9LbTlCYTJ4dzFKa0Q4d2FKSkFOSUJm?=
 =?utf-8?B?cDVuV3ErY2svRElyL1ZvekJ1U0tPNlY4MHlkU1UwUWUrdk90MXZHN1pWaHZ6?=
 =?utf-8?B?Ym5VQk5pb1NSbkJLZnRQbGxhNnZmZXV2bkV4SVNYSE45SThCYmFVRFZnNkN6?=
 =?utf-8?B?dzk4ZDUzWEl1SkJkbkJ0UGtkOGl5QXRMRkR0QUlEb1ZIeHJTZGdtaGVucHlN?=
 =?utf-8?B?VGUwSTJYWUpQUUFFekVuR2xwa1hSVkdQYUN3d1R6bzlKTC9xZEhIV0FsOThn?=
 =?utf-8?B?YlFYckUvR2ZKLzdQYzlTdklQbDVpcHRVZXdiRk13T3Jtb0I3SDN5dGd3QVQw?=
 =?utf-8?B?dkxPS0pKbzI1ck40RnRpNDRIRHgzQ1pnckg1ckE4NE9uQmg5NWRSZCsxU2VW?=
 =?utf-8?B?MlBxN2c1Zjc5T0UxZ3RSaEpocjU1LytpWnZnSFkrdkJjNXgwZkdtZ203N1Va?=
 =?utf-8?B?RkpBSEoyYzFBdU1SYndWaXZxbjh5ckNzOUs4cmRJUU51M1NIZE5PMktKcEhV?=
 =?utf-8?B?TVlIRm0wYTN1SFJhb3lYUGh4ZFI1NTFxR09MNk15S2I4ZDdiVHpXWkE2cTJY?=
 =?utf-8?B?M1kzY3JiU2xUSnExRGhtT1JnMm9aWWI2NEY5TXlzdTA5dSt5a3kzQnJrbVA5?=
 =?utf-8?B?UWhPMUIzK09OeW5SY2JLRXV4VHd1aU90V21Icmx3eHoweXNEYkdmcGMwNzVO?=
 =?utf-8?B?b3h1OU1qQndkOHo5N1RqYzdvSVF1bkZFTjB6M2ZnVEEwS1UwY2Q1a0NQWHhW?=
 =?utf-8?B?VmtBQyswRjNFRUlnQkM4dndpV2ZUcmtndWlhaUd4VUgzZm1iZnFHdG5VRlQx?=
 =?utf-8?B?WnlOZUdxcUpCcGN6Y1I4ZHZNelpjU2xka1BvdmIvbnM4ODVIY1JmditHTk4v?=
 =?utf-8?B?NXRYb05lOTdoRU5NQ3JEd0JuM3R1OGpvZXpMdGtBc2d4QW1qcTBJL0ZzcDc2?=
 =?utf-8?B?SzMrbVo2eGt4cFRKVXowN0xHckl3aTY1dEVVdklrVkZpendPT05IbzJXSnpE?=
 =?utf-8?B?QlluY3VjQnlnWEJEZHgzR0dPSFE1aXc2Q3ZVRXp3c1BCVUdjcmNLckV3bUha?=
 =?utf-8?B?SnpaZjJzbEVDVVFZeXJYaHlwRW5TRG5EVit1aUE5clV0cVFtemRqSWxGbTU2?=
 =?utf-8?B?WGhmaHFET1I4czdWY3R2WXpmNjdibWdUMXVjM2VYN2lnaHRhWkdaVnBnQUhn?=
 =?utf-8?B?Y0cvbzd4djlkMUUvcGJDVm9zM0tBVENHaFY0QWpldnRHazVZVTlTSUlnQXFx?=
 =?utf-8?B?bFdtSTd2dzVBcUZsa1FkM0NaZTlqa3o0Y3ppREFTL0huakxvcER2ODVkWFcz?=
 =?utf-8?B?eEZJUlhrSlAwVkFQNkpTQmpWNzBGbG9PdjBrY1pqT2VKZ3BFNElxdGhyS1hl?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c57008-bc29-40b1-35c4-08ddb48dfc1a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:46:47.2733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p06e1jGeEFrlejhUK7lGSyMjRpbMIOxPegH0JdAhYyNDkbm4mtUfuE8vbmM3yqJAOyz+39RX5LaKUDzWJe8KeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

Hi Santhosh,

On 6/23/2025 4:39 PM, Santhosh Reddy Guddati wrote:
> Skip the linear modifier subtest on unsupported platforms
>
> V2: Remove platform check and use in_formats_async (Chaitanya)
>      Update the commit message
>
> V3: Fix crash
>
> v4: Handle the case for linear modifiers on platforms where
> IN_FORMATS_ASYNC is not supported. (Chaitanya)
>
> v5: Move the linear modifier support checks to run_test (Chaitanya)
>
> v6: Remove hard coding pipe and refactor to move checks inside run_test
> (Chaitanya)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index e176b2a28..5a7daaf07 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -799,6 +799,23 @@ static void test_crc(data_t *data)
>   	igt_assert_lt(data->frame_count * 2, data->flip_count);
>   }
>   
> +static void require_linear_modifier(data_t *data)
> +{
> +	if(!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
> +		data->modifier = DRM_FORMAT_MOD_LINEAR;
> +		return;
> +	}
> +
> +	for (int i = 0; i < data->plane->async_format_mod_count; i++) {
> +		if (data->plane->async_modifiers[i] == DRM_FORMAT_MOD_LINEAR) {
> +			data->modifier = DRM_FORMAT_MOD_LINEAR;
> +			return;
> +		}
> +	}
> +
> +	igt_skip("Linear modifier not supported for async flips\n");

Nit: 'async flips' -> 'async flips on this platform'. IMHO, this update 
would make it clear.

Either case,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Regards,
Karthik.B.S
> +}
> +
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
> @@ -814,7 +831,11 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			continue;
>   
>   		test_init(data);
> -		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
> +
> +		if (data->linear_modifier)
> +			require_linear_modifier(data);
> +		else
> +			data->modifier = default_modifier(data);
>   
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
>   			/*
