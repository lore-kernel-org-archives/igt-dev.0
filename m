Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202EBC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 07:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE5A10E490;
	Mon, 21 Jul 2025 07:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cew7LKsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030710E490
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753084168; x=1784620168;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zyRHr5CV+om0DoqGd2LrRIpwPlQEF526SEPSujr+rWs=;
 b=cew7LKsSHE/YUYaT7o2TFamXCgwSbQWKSJuXhHnjJwGZ2gR42VuhPoOW
 tJEdsYMyYh87eoYiQa3VPa/ZY4rpZ4nTBNPquy/GMcAglSsz8J+EwOInI
 oQkcjaM0x1K3MVrAAowL5qVksk9gMQXDA1U3x3p34MMuEi7pB8JrNcYz6
 ycnJI1DFZeTdDikr+R1RNvGZfCsTtzyiy7f5spiojTt67TDcXONK4Onmh
 7wK9KViWUcMFN9ne/ZGUa4yG1ZvSmaXDABNYwN1A7TtfWTogsQSCvnMAb
 ixnftMDBsqbU3vKnkmPGqgFDOidBZsKZYWKFckwtVUHLQp92zOvQFB1HZ Q==;
X-CSE-ConnectionGUID: mm362IcmQSmdSzdhMAFRbg==
X-CSE-MsgGUID: ri7yxrcwTUeImvACT8uqPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59083674"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="59083674"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 00:49:27 -0700
X-CSE-ConnectionGUID: I34w1vs+T7iC9XW4vs+z1A==
X-CSE-MsgGUID: 668LGdr2QtuPWedyuXIw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="162988623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 00:49:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 00:49:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 00:49:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 00:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9DCC318qw6ub4yyeJZZydxxfasU51oQSvtuPD3M2bi3j7H+bLDsPr3JjGXKGbkOhNMazfMVWo8Miw37p4umzJQxNF8TAssE+Wt/yBMnk6u5xGRoweouPv8moFjR1v6/Qt13Lw1ruEbiwuq7QS/+buWwFQ9eqjgRyYyQcGNjL3fmlLCgWSaQzWU51HkxXhemzX/7OR3FD71SdrvOPnBU1yTK1xPpQrmQ7c2ko3AXiQ+ok2aoMC4g0ocYjmSWSS8Qiidz6zpj+Cly1l5P6jiwr7e/9TFfiHvCtdS3naWe+ImSFaD+a7UbdLE/gDI2QBbC8BgQv8mjeToR75EPDfKqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY+7vq2hOoC/4cqvYtQYAqXKIJvt5Tl3u8FMAdaDcg0=;
 b=wcgqXL0qUSLpGKHJH9GBUELEO+NvNudt1jvhKXLyvyKAS7fx/K22w+2e8qECIe8obGqRZt8wm0VFUKVJUXtQ4EO/uHMyZYIb+UuyMqSp5yB9OzjrSaX2FvEUJqmV7y1j1K+y6KhVWCNpW3Vuljwu304b/SwRzCP/60axw7KpaQ7kZh9/6M2wh2C2P67RUo2BbHFL21JWtPDZSCGKLObWDHH3ovp76Xc7qdVQ/E2d/evIeiLdLxgePbsfuXOYlHog3Dwd5ikIwSTJcbC3x36plnA8NmVCnOPKSbNXfHBx60D0g1gfHVwMp6ygJQ5hBDdW8Q4kue3GRpurKg8Wz7HCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 07:49:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 07:49:17 +0000
Message-ID: <8e4ba609-70a8-4d22-9a0d-7c6e37c22603@intel.com>
Date: Mon, 21 Jul 2025 13:19:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.blocklist: block unsupported test
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250721051353.934493-1-kunal1.joshi@intel.com>
 <3c63e271-bb4f-49e2-8704-d786862b8519@intel.com>
Content-Language: en-US
In-Reply-To: <3c63e271-bb4f-49e2-8704-d786862b8519@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 72601e77-854f-4fb7-6db4-08ddc82b17c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEMvaDlNNU1LbGRLN0VoT3V5aGVkYVY1bjE4R0trZmZITHYwK0tvc3EyUk9x?=
 =?utf-8?B?V0ZCTnRtS1lPcVlVNERuSjkwaC9yaXpRaWt1dUgxbTNVZTZPYmxIYlE0elVS?=
 =?utf-8?B?VUxSNGcwMHZYZ3dteXJnY0ZmVm5uRUFLS044RTVncU5BUThnRnlaY3ByK3pp?=
 =?utf-8?B?M1c0eUE5U2dRelhVaWRIZkx5NEcrSU0vdndWK1k3TEhMWDZBTzIvRU13c3p1?=
 =?utf-8?B?NTg3OUtQT1ZVY3hvS1Yyc0Y5YndtMXI4cXVhVkRBVCtRdXhjRmpRWlRNYldn?=
 =?utf-8?B?QkNGT2xuc0p1U2dXZm5WbXc0TS9uaWM3b1loZDNMOE92QXBKSCtoOXVYa2Nm?=
 =?utf-8?B?dEZiT3NVa25kbWpLVkxEemtVQ3NzZkV2bXZrVjBsOWUvd1ViTDNGYndHTmtN?=
 =?utf-8?B?c0c2M2pvSjlmSzQ5cDJHQng2RGJCZXA1aWZFem1qRm8rYXdieGRQd2c2REND?=
 =?utf-8?B?MmhoYzFPaFFnMjRtNDIyTkllVktNZyt3RUxOWEF5RU1CNkJURWx2di9kUmNp?=
 =?utf-8?B?VVlYWlJrOHBZcFFsMUlVcTNhM0tTSmRHV2U3UWNlMG5xRTMva3hQWFRTZkRp?=
 =?utf-8?B?NnI2YVRxWDczN1dMZDI0dnpsSmpXZmtMcmpldVd6eG5hMnNRVWFJTDg0c1Qr?=
 =?utf-8?B?UWJtdy8rSUkyRERxREI1YTNoWXhjc1pSSzFhWitFY0h6SkpON0RzL0lySFhM?=
 =?utf-8?B?Q0kyamdxRnhwckprUS9uMFZzWmF1cUYyUEhaZjdDN2djTzdnaW9YVHhiclJP?=
 =?utf-8?B?Q1BZSlRxeHNFcE12Y0V6U0R0VmgvaW91UXBsOEFCUWN4M0xyaUl3dGlhQzFJ?=
 =?utf-8?B?NFg1eFVIOGdmcXlsVDcxTFdROXkxNi92Q2R5VWRoelhmRTMxdTRJYVNpSHp0?=
 =?utf-8?B?U0FzL2hVdFNtU205d09EcDJYMC90SmVvbXdXZnh6ZlRROVpaOW5FQzVGcW9v?=
 =?utf-8?B?ZlJOUUFOdmViQWE3Z2NsdUxLR0RLc3p1ZjhWMHNhYVRUd3MyNUxQOVU5eHJU?=
 =?utf-8?B?NXBuMFZ0YjhYc2RVRnJKY2lRZFNXT0hwUUZESEJYZ29sVThYcWl2dmpOMDZ0?=
 =?utf-8?B?QUp4eEFMV2lSaEhqR0NqQlZrRnhQRm1aK01sYUh5cUt1d2xGV0l5ZXUxSUto?=
 =?utf-8?B?ZXRXQWpKczBxWjVYZnFtbWxIYk5JU1U4aHBmRzdSVjA3bXdnUmhCcEVIeTJD?=
 =?utf-8?B?cFNRZ3hCVnlTaktGWjFxVm8rVHEwa3VZb2Z1ZVRIYUhHZW1KcWsvcXZrK3ZY?=
 =?utf-8?B?VkNzTUdHMVFlK2hXN3BsNTgxRUlKVFV5NGs2RWZZQlo0clRldW5SbEdhTVk2?=
 =?utf-8?B?QU9DQUJvMm11cTU1ajRlaHNPMWZ5RGRkU0ZadmhvYnFZN0J3a0hOUGhWZXQ0?=
 =?utf-8?B?bWQzNnNRbjlpcHpnWGxhWC9wRjh4WHI0QWNmNThNdEgvdmtNZUplb211dXdG?=
 =?utf-8?B?VXdobjhZNnRVbGYvT1BXb1cwNEY0Nis0N2FsQlhuU0V0K3VCTWdmYkpiS2xK?=
 =?utf-8?B?bmptQnB4ekxYc2prZ2RtMVl5NEE2RUNsVHUwUTdrVjFnTWZ2VEdkanhtMHhW?=
 =?utf-8?B?TUdhcFNrbnAyUVBXYktURUlWaE5yUHloSHVWNWJRZWpJMFluamJYSGxwbmtD?=
 =?utf-8?B?T1N0OGxHREpyeS91T1lzVVQvRmdEL2hQQ2kzck5STFFGMU0wQXJPa09XZDVv?=
 =?utf-8?B?UGo1MHVzdk5lR1FQS1lrNTdoWTFnVHZpREVkV25hNWdQaWRVZElicllOM1l1?=
 =?utf-8?B?ZXJSbERIV01IazdSK1dmTndWcUxDZzJSeDd3aGU3NURrQ1ZEcjUvYm1jVzRE?=
 =?utf-8?B?OTVRRVVINForaGF4bmVKWGEyd3RJektmS2thWjRXemltekNkcFNWQjBmRS9B?=
 =?utf-8?B?R1pOWWdYWHlzamkrOTFxTFRRWG9TNmxQVmU4Smh5SDQ3WDFHWENBVU1aOUNy?=
 =?utf-8?Q?/NFUyXufnkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFhQWDZRYmlhRUE3YzdqQVlRZytFcjV4aDJXRUY0aFdnMVpXWEgvTk1QcFJH?=
 =?utf-8?B?bUlaYTB5WUlybHYyMVJ4WlNHMHMwWElyZjR5dnkwS2xZaU8xZE5ZVmFyNTJn?=
 =?utf-8?B?K3BkU3lPM1k3dnpZOG9iTE00b0JFMmluMWJzUVRxNktESDhUaGRFeDhxd1R3?=
 =?utf-8?B?N3piVHYxa0ZjdUErTFdrL3d0UTFKam5Qa0ROeFZHU3hOaTN5KzlVVTB3dTVq?=
 =?utf-8?B?OGx0am11NjRyY2IreGhrNFd4alBtR09GbXZKVlQ5b2VOQlZJWWRlMXBMRjI1?=
 =?utf-8?B?aFJPMHppaGk2M20xcHZpNC8yc3l2MDRsdFU2bjNKc3ByZUE3aVA4T1JZdnZB?=
 =?utf-8?B?VS9yVS9uZmZ2ZVAySG0raHVjbk1VWDVsSVJmTmp1aEJzcUsvbnVKcXBlQ3Bm?=
 =?utf-8?B?SFpyNEZoczYvcFJnWUVTYVBsTHN3RVVMRDRSQ25TRGg4ZTM1RTZ5ZnB2NGJT?=
 =?utf-8?B?RCsyQjN2RGJlVlJ4NEROcy9BOVJXYXhJVCt1djZoNWphTEtFUnV6VjNTTDZN?=
 =?utf-8?B?aGd1ZGEvTkNUYUZmUTJaV2tNbW9ZazFBMktlNVpmUWFQdFFaTDVRNnBnZlNK?=
 =?utf-8?B?b21QQTVmbmFEbTZKeVV0TWpKc3NwNjhtV0xwaU4yRjhnQzJuVUhtZllmMmhs?=
 =?utf-8?B?MllHNDdUSFd4dCtmdDdyVDZwSE9BWXNROUV3SVlYT0doRnFjZy9lQnNPdFR0?=
 =?utf-8?B?QjIvQXA0Vyt1YVBaWEgrZ2lkaGMxbGNEVzNTeWVINVVERHc2aWJMOXArQzZi?=
 =?utf-8?B?WWtSMmkxeUFkb3ZvY1FEQWRhYTZMMWRRSVVYenBSZktFWEUzYkNZaFNLUFRH?=
 =?utf-8?B?STFHaldmdXFxVzNHclFWM0VvWnQvazlDdjcwNUdIR1g4Mko5MkloSFQwejg0?=
 =?utf-8?B?WDkwMWwvV2ZZQ2JveWtsTEpUNmROZ0NLSVNuaWNMM3NmcXpRRmV0OTdTSVB3?=
 =?utf-8?B?eWFMSnhMQXlmcFdsZ3BBYUIxMGVCTXRMOFA5T1AwUVMrQUh5WmF0NVJNVGZP?=
 =?utf-8?B?dGlDU2RSVHFhdVFVTjFoU2FzMVplSHFuRklGNGtVdGxWaFZtZXp5OGltQjZL?=
 =?utf-8?B?NHR5U1AyNTNNVCtVeHd2dUk4MDN3ZnVpTXFBa1BYR2VMRlJkSDYrdHlzQ0xi?=
 =?utf-8?B?Mk8wWjE0d3VGYk4wS1YzREFkM1RhZjlSOEZkSXN0Z091dEV4QllZRkNXcnAy?=
 =?utf-8?B?OGE1ZERZSkxmRlEyRGxIaVErV1Bibmx0b2ZpTFVzQ1RjYVNaOXZaV3pvSHhu?=
 =?utf-8?B?SE1GdFdOcENaR1dDNTVZME9ELzBvQmVPT0pqN1B0S1hwenBBRjFveENFSnRu?=
 =?utf-8?B?NlRUN1VETXBWOURxb2xxRnl2Qnk0MHFpeG9xWTZIU2t6dDhSVDBMQnVLbGw5?=
 =?utf-8?B?Q0hYUzNDYjhTTmxGcE5LZjVla0ZFa1hQRUI2cml6ZVkrVk5Ga0VzNEZ4UWRt?=
 =?utf-8?B?dFE0dzlDenZsZGh5Zzh4T2JQZVEzRkFwcStUUlg4N3JrTHpkRy9SWWo0OEhu?=
 =?utf-8?B?MGRwS3R5aTNzZXlHTEdwUWxUSjhlZ1JSQ1dDbE1zSTJKMWNaOHJoZURrR01X?=
 =?utf-8?B?SmFHQ3NDdjdxblpTQXJnRlVNOXBScnVBbEN2Wm5NclFld1BOZFVIb2NUUzVj?=
 =?utf-8?B?dVRLdElLM0xxWVhJc3dEV2pCQ3R1RTByejA2bGRQNVhUaFVDRW1DaFRGc25t?=
 =?utf-8?B?YXdYcnBFaXI4cDk0TEphY1ZyTjBwdHNNcStXRUc3d0l2eVVrVStmZDh0b2cx?=
 =?utf-8?B?aG1kdlBuU1pWV2ZGV21zdUpmRVliYy9JUjJQRjhXZGxsSGp1QUhpZ1U4WUdj?=
 =?utf-8?B?c2VZUTd1SzFobm1rbzUzR3NpeVdDZzQ4bVFVcUNNbFhLRW1rTklpZmlTSVE4?=
 =?utf-8?B?VDlRUzJWU3lLS210L2s0aVp2UHVxQ0dVempsUDlMOExuRGNxY2Q3SitrbGpG?=
 =?utf-8?B?Zk1kZU5USkRwOVA3N0IrYlRxellmTlp0Y3FhR2hKYkpCcnlHN1lZMm9PeEEr?=
 =?utf-8?B?M1FiWFMvQXBjUGR0ME4xR2ROaW9rWW50Q01CQVVZQVpaU0hHWVJWcEhsRjJU?=
 =?utf-8?B?Nk5UUXNMQllWbDJDeTZMa2llR3dOVXRncVhCQ0loSEJlKzdMdDBocGttczVI?=
 =?utf-8?B?ZGFGQmVqVFEydzVtOU5JMDZMT0xSbkFnT3hBQk5LRXZXYVhJdmZuVVBxa2N2?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72601e77-854f-4fb7-6db4-08ddc82b17c8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 07:49:17.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSWFTZdpduuWnaDLVdkFkYkv/dAb/vCOnrBHRAPPBnh6icg2oezfDifRS+vj8XoSggFTbZt5yP9Yc0xK0cvK4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
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

Hi Kunal,

Sorry missed one comment. Please use either tests/intel-ci: or intel-ci:
in subject, no need to specify blocklist name.

++ Kamil

On 21-07-2025 12:28 pm, Sharma, Swati2 wrote:
> Hi Kunal,
>
>
> On 21-07-2025 10:43 am, Kunal Joshi wrote:
>> Chamelium V1 HDMI reciever can support max 4k@30
>> Test forces EDID with 4k@60 which isn't supported
>> Blocklist test untill we have newer V3 boards
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel-ci/xe.blocklist.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/intel-ci/xe.blocklist.txt 
>> b/tests/intel-ci/xe.blocklist.txt
>> index a21c8a3d3..050c89970 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -115,3 +115,8 @@ igt@xe_evict@.*-multi-vm-cm.*
>>   igt@xe_evict@.*-threads-.*
>>   # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
>> ##################################################################
>> +# Chamelium V1 HDMI reciever can support max 4k@30
>> +# Test forces EDID with 4k@60 which isn't supported
>> +# Blocklist test untill we have newer V3 boards
>> +##################################################################
>> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> Prefix with KMS
> Fix typo : s/untill/until
> Re-phrase
> /*
>  * Chamelium V1 HDMI receiver supports a maximum resolution of 4K @ 30Hz.
>  * This test enforces an EDID with 4K @ 60Hz, which exceeds the 
> capabilities
>  * of V1 hardware and results in failures.
>  * Temporarily blocklist this test until V3 Chamelium boards (which 
> support 4K @ 60Hz)
>  * are available in the test environment.
>  */
>
>

