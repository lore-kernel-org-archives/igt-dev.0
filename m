Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC53C35FF1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 07:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B957610E972;
	Fri, 14 Mar 2025 07:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0ISSxgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602410E97B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741936131; x=1773472131;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=78R6H455K96m1DZS3B8bGGLbwrMIFsqD0xPVDCzjOdw=;
 b=i0ISSxgrEm1NKi2jJaDAo7DEuLKdlF6DJmsPGFViGrc8tBpa4vv0J7tt
 PLWNWHfDREDd+gUqEakAgrHaCufDK/TI8VxTQCxNUrBYdVW6TevbYIXuH
 WGN721cy2ukOquG0ck4IZZWbRmHHchgJmxjs/lIZqe6ou7gSEqGMnqpDm
 tvvg0tPzY6elBXOAAd5ARLNzg0r6NM/5Wrbxm1Ggbxy4Rp26gRPJtRLzJ
 vJ3OkYh+gU4nV4AStr4NUDD6FKX5JRllRjuK099BjljvIBH/6z6U75qcP
 TjU16S/7Lwp5GgGa2bRO6zu9mbLbvKbqGTfTiAI4FugIfbVohvMoGb7O8 g==;
X-CSE-ConnectionGUID: OaZJxHscS8SlM76nVP1cLA==
X-CSE-MsgGUID: nnD3uiXqQA2cPcB8SUsxwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43205287"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43205287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:08:50 -0700
X-CSE-ConnectionGUID: MjC1UvhiTzWFvlNcK/UVmQ==
X-CSE-MsgGUID: 8qdhVEQoRgy0VCjy2KAzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121176830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:08:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 00:08:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 00:08:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 00:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUJ607ODTS1ZD3AOOLtz8hD0X0eNtlF/lx7kGefbDk7T5VROm567f5z6qNDabz9mdcYhrZSHan+iFdZHO6iSWZGOZ+G3hA2tF3kbZHnbZyaBw/qGzKGDr1ZGP62Bk6llBFFFgNcXvDO5Zf4HnTJESoZJwMEVYD8USe4LVFyey6npc03NxeMbAZdwWI7kZYS/+j+Me9x9B2cqLjhhbNLDO/tBuBjtCnhySGQ8o51hvYWia/TSARih09hk0UnhPZwrI45Xiby5gQBdItrLvj7FDaMIRTwaJ+mfUuiVDzBiGczzsCDqU8ux00AJIfejdUsmqk7O7qS/TuEBJrLPE1n7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+46iXKxmXRfDp2h11ziI+juMG9fm4j81VYznvzmEqw=;
 b=O0UO87jI5+RX3bX489lnjnzoo/D2QqUw+S1ryjNpHZVA8glM+yjnHxFg6Lonjvddvhd+9UcCLY0eYPHOiHDx7hjovIHqouFGoo+U3btGbHh6STveoR4XdRoVEaOWuGsILUdAWZGwY+89SmqshgOR9Z//sxAkl/wW81Y7u0/sM9kbhKl8yTCH9sRnSpT84yHoKBhQwPi7hZp3q15ruQxOWw8Jc80n8gSrutOablY2aUAfY7b0XAcC8oU9SRJcYMiFoUhPy7CkYQkh3q8GEvt1B9Hp1uqPmzZGAi11cdmQUgl0D1+byyYfngLkjI7GWGZb5kRGze0Is4yTZ6JfJF3qDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 07:08:04 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:08:04 +0000
Message-ID: <2fb3e99a-cb71-4261-848d-2f088daa8447@intel.com>
Date: Fri, 14 Mar 2025 12:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_oa: Fix __for_one_render_engine
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
 <20250314002058.220854-2-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250314002058.220854-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: fafa6ea8-765a-455c-68f5-08dd62c6f6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXdQUXFpK25uYTllTGx1VXRtWmU0MDN5TURWcWNaZHB3Y2JlTHBhREhvQWwz?=
 =?utf-8?B?QlB5eEx1S25pQ3N5cHpWRSt1bEdZYjFTWGJZN0N0T3NmeGpqS0FRd1lEM3lq?=
 =?utf-8?B?YkN1cjRGcjBvRmg2UTJhU0ZhNHU5Y2hJSC9ndDFMMkZVQmRLVDA3OUJPRlhn?=
 =?utf-8?B?eW8yc3IwNThUVHVwOG42QndPZmdncEFhM0Zzemk0Z3lseDlZR1d4V2U5SVNH?=
 =?utf-8?B?S2VMczA2aHJwT2hac1NmMGRwM3c4K3JaeTl2VkRVRnF3aU1EQ0tsdGNwYnE5?=
 =?utf-8?B?ek1UVlpVVWhsZEFMRldDMjE5WHczQlBweWhIYW5CUzFlOEEyaXNqeDdOZzMw?=
 =?utf-8?B?d3ZyR1g0a096YjhRUzFPcjdIQXN6ZWJZcmw2Q1E1YVZCM3R6U2pISkx6Y3BZ?=
 =?utf-8?B?dDZnMnI1djJpM1lUSklJaTRFM2FXeE4rTHgvUTlzWkhtcDJwSUwrQ0dKTjVj?=
 =?utf-8?B?NnBqU2NtVFRPU3ZQOVo1M0Z6cFJBRDIzZFpLS3JyY0ZyL2l6Ym5tQVlyS1Bk?=
 =?utf-8?B?My9MeTNZd0JBQ0VKYnY5Sll1VTNHQTN4Slc2dkN6Q2tGcmNoaVpxeC91aWNM?=
 =?utf-8?B?M2dabXlhOUpRNGVZRS9KTUM0UlJTNXI5NFFHRS9scjFaZjJQNWNTUDkwb1lC?=
 =?utf-8?B?NlFsREUyemZ4NXlmL2Zncm9aSUdlZDhUQ1FDR29SOTZ4ZHdGVCs4RFhOUDBn?=
 =?utf-8?B?Y25ic1hyUVpkWU5GRi8zRG1rV2pvOS82NEJid2hXMkNaYzhFbHVsaFl6aEFU?=
 =?utf-8?B?R0puVnZhVU5INDZKTEhUWUQydEs5R3owYVRrRXRoVzdJSk95MDQvdmI5cEd0?=
 =?utf-8?B?MUV6cnBTbk1HQkNGalBNMDdTRm56cWoxd0prbmZzeG9BTytISmdMdEZLbVZH?=
 =?utf-8?B?WmpLM3dCclNFUkI0YXdLNE96MnRJeWxZUm03WkNwWTJlT2s0czh2WmxBUlkv?=
 =?utf-8?B?alFDeVNGUDd3WVN4L0lYOGJZOE5EdnhnNFk4MU9zRDJtSVZmZ0k4WThxTHpG?=
 =?utf-8?B?S20zbGgvenJoNWRzVm5HL25icms5cjlMNlAyS1ZodlByeHBNbGNXek9oYVBM?=
 =?utf-8?B?T3l6UjlkKzhjeDduUUhobG43UGhBN3hlN3Z3NkwzRzQxOFRmbVRGTUx6UUlC?=
 =?utf-8?B?UmU5V0lLQnFQL0xQRm50dzlvcHFselAwTnhjN1FNMURPcTJyd003cVd4Nk5h?=
 =?utf-8?B?MEtPWngrVGZTVFBkY2tzMklBYjFKM3RWdExtWW50R29KZUo1VWtpdm9IZHRt?=
 =?utf-8?B?ZC9wYVlJYTdQNHhBV21Qd3lrVlRrdjcrMVI0STJyR3NWdC9oRHZZN2ZuRW8w?=
 =?utf-8?B?a01URWhNeTRIeWU2bmxocHBBeEJtWnM1NU9SNW1rRWRYb211SmdNTEoycnJB?=
 =?utf-8?B?SEN6SW1xR3VIMHYzcTZWSS94ejBtekFHRjJIbk15enlrVlpHWkNwdkl3bFpL?=
 =?utf-8?B?YXBSOE5zc0t0YXpVdVVMTGZLQ3FwTVZyZkt6ZHRzVnZHdzlvYTVpM1ZyNHdY?=
 =?utf-8?B?RVdVaVJnRUFLUWxTakgrWEZuYTV3K1dIdVN6NGJPNlhQZ3djUVIzb1BTc3JI?=
 =?utf-8?B?bkc0ZmJnNWRQRGo1R2JVTGdIL1B4clMySUhaNmNpN2d1VitLNStSQWdhWGFV?=
 =?utf-8?B?VkwrMVhZVjJVRktZMzdpbFk4cDhHeHo1L3NWOG1SVzhSN2FyMFVZeXpkV3dt?=
 =?utf-8?B?alRUZmtNcFZjMmtiaEhCb1pGbFN5SEZ3VlZwYTZ2VndmUXlkdW1BdjZYSXNv?=
 =?utf-8?B?MUgyM3MvWjBZK3p2SUF5VmNLSHBmcnZHdnJ5cWpyMVZMaHY3S2VXLzBzemRm?=
 =?utf-8?B?TEhpUW5reFUvMUpsUnUzTkRCbU9xMEp2TVVYdWhlTDBwWGsydms2c3V3cmVa?=
 =?utf-8?Q?ElFjTt7AbvHQ/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qi9Jd1ptRzB6VVRNck1lbmJ5QkZzUUdjN0NQcVFaVC9BZ3JtWlNKMC9qYlJG?=
 =?utf-8?B?dVdSWm1WeGJlY2xOeStGV2cxeTZxcXcyb1NTUzN4R28reDM1K2lpTFJPU3d3?=
 =?utf-8?B?QUg0R0J1Y0FsdXJ2Zk96b0FPVUpkOGNwUGRIeFFzdzc2S1BWMm1JWENSWERV?=
 =?utf-8?B?ZTBnMFFKc0NKSEVXaHFuRTk4UzB1UThhMVYvVDluZHVjRmxEVmlwRGVhYUNS?=
 =?utf-8?B?TUFQOWJYUStpa3RRSytLRmNWcHFNSUQ5bmxuc2ZleU1obi9tVnlUaU9ZdEgr?=
 =?utf-8?B?Tk51YTVVVGRBR250R2tyTWZCbWdKQXBobkxjdEFTLytlVVh6RTZwU3FZTGlo?=
 =?utf-8?B?NkM4UGVCRlJxOFRIZGhqWU5Ga2NNT0FnTm1ZL0ZNNTVjamxoUEswck5iZ0FV?=
 =?utf-8?B?bFNJaDc3cDZqN28yaTFyaVFLekhNVHkrbUFsUHhrc2ZIZ1o1ek11Ukt4Mmgw?=
 =?utf-8?B?SGF6WWd0TUZZZUQvSFRYck1VaGg3aXMzZkFvZFdncmQ0NkFvSml5VUlrd3dU?=
 =?utf-8?B?azNWUVBuRHYrOGJ2aGNYcFVpeTYxV1RmbUt2T1pqSHpXblFuRndVL3d5azdx?=
 =?utf-8?B?czRYNXZCbm9DSE9ua3UycUxJRUZjVVg5NmJJWDdKNWZKK3VSM3QycElLeXZP?=
 =?utf-8?B?SitOK3ZnM2phT1cyMGVQVGVDSkZ0azNvSUFXT0NBUnhJT3d4Z290TVV3aVp2?=
 =?utf-8?B?YmxpL0Q2cEJ5TVR6OURtYjBaVGtUQ0lFWnhWTHdkR0U1dVBCTDdLbFVacXRT?=
 =?utf-8?B?dEg2VzJGRzNHSGlydWx2YzlFMzB0c2JRRjV4aEFzTGVPYVBXTFZMeEZkcVl2?=
 =?utf-8?B?bG52azlsU1NVM3MwTTc2S21ZWlluUXMzem02clN4RUlSZGtmVm55andjaXJI?=
 =?utf-8?B?OStVSE5jV2FjNkhHRDJLd3kxdnpXOG5HZittUzBYcHFJUDkvZVhnSVJja2wy?=
 =?utf-8?B?T3R1NVlNcjVkc0U1QVFLajRwemM3Wm5kejJwTDFxalBFSXNXQml2RmFhM1hj?=
 =?utf-8?B?M01KazFNTVRxL0lXVVV5aXViMWdWc1VpMzZZM2RQYzJIUWJZL000UU54UUR0?=
 =?utf-8?B?VnlScGVYQmNsczQ4TUVZc3RrZVpQSXFJV1hnMk5CaXVZNXlVYUFWaXBWT1JW?=
 =?utf-8?B?SkxEWFJHdzJCUVBiSHgxSmxZZ1pmT3MrMDQ3L0FtdFBLM284TUpQNWRxZ3do?=
 =?utf-8?B?eXMrTDNJUUtRTHhGRTZycHVJL04xZTNUdTdub2tiUklnTHBRc2J3ejNQNGI3?=
 =?utf-8?B?aTdZWVZ3R0MvdkhNMTFJRTRkUU8wLzNVeDdORDhUb2dWV0tmNURESHlORGI5?=
 =?utf-8?B?RDhrbDlMOFdFdURES3lSK2FQTEd1MGp2bmxRQzcvd3pRUldOQzByZUpHZTFT?=
 =?utf-8?B?c21kUnlVT1ZXYmgvTnlnQWsrRzBFb2NkYU1McWJXNGVXZ1J5Z2prMjAweFhI?=
 =?utf-8?B?NkRJNzBINC90MCs3aDlSY0VhRk9vLytLbkhXZ00wYVdTOVVwakRjMEJ2MUtX?=
 =?utf-8?B?aktEREJ1SkRFU2hJZXhYb3h1V1hUblZCcFpIanl3RkNtNkN4azZxQk5ZckZv?=
 =?utf-8?B?dzd1SHdndnFJeThWQ1d1bmI2NXNnSjRMSEZoaHl3aCtiQk8rMjFrVjBIMGQv?=
 =?utf-8?B?eGl1ay9UN3hPM3RPa3NudlhzeHFESlNKUjVaSG1PallUb3JTWnJXVzRvUzVW?=
 =?utf-8?B?S05rSUtrdk44SXZpNzVyaUNFYXhabFdob1JRZmxEQU5sY2F3TDJvY2dPYlFX?=
 =?utf-8?B?dFYxMjE5V0p2TWRoT2lhNVMzaHRkUzhqN1ZYOExyakQvSjJRSFc0VHY2U1pw?=
 =?utf-8?B?WkVqOHhhZGo4aVVSdm1sWGtzci9FdjIvdTNpZWZQRUNUTkdVRElHejlwRDZu?=
 =?utf-8?B?QWUvRGh3VGpVQk83T21NaDdGcmVSYUtmWmlrVEU2QmszSldiRVVPOW13RXkw?=
 =?utf-8?B?cTNISTJqb2RFQ1l5T3VaMHdNUUJ3UGFtNU1mTkpqVThWejNYVzM3cFljck4r?=
 =?utf-8?B?d2MxdlFsWHB3b1h3NlljUkdEV2k5WWVxUGczT2NJclBsSzZFc3BmK244RTRi?=
 =?utf-8?B?ZmhXenVxOFZqMU1FRURNK2k0UTRNcldObXRBNWt1UzhkV2hTWm5NTmQwdDAw?=
 =?utf-8?B?VkZ2K1RKdi9LeG40ekdEL1FMaEZOeDNKQlpGT3JrMGJKVThGczZya0pOYnEy?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fafa6ea8-765a-455c-68f5-08dd62c6f6bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:08:04.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86j0RQZ1cj2Vk32X89gDlHTHmY60GN8+T2VFDJoSym7gk7Na3TCoMKJbNqK4bT3FIzcEAParWNFqEFsl6s0VJOVT0tcdmWXR1OgCSVDF28w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

On 14-03-2025 05:50, Ashutosh Dixit wrote:
> On platforms without render engines, __for_one_render_engine is an infinite
> loop. Fix and simplify the macro to reduce chance of such errors in the
> future.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   tests/intel/xe_oa.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 9bc62c5b9d..245481f8a3 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -430,6 +430,18 @@ static u64 oa_format_fields(u64 name)
>   }
>   #define __ff oa_format_fields
>   
> +static struct drm_xe_engine_class_instance *hwe_of_class(int fd, int class)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	for (int m = 0; m < xe_number_engines(fd); m++) {
> +		hwe = &xe_engine(drm_fd, m)->instance;
> +		if (hwe->engine_class == class)
> +			return hwe;
> +	}
> +	return NULL;
> +}
> +
>   static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
>   {
>   	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
> @@ -4645,13 +4657,10 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>   		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
>   			      hwe->engine_instance, str)
>   
> -#define __for_one_render_engine(hwe)	      \
> -	for (int m = 0, done = 0; !done; m++) \
> -		for_each_if(m < xe_number_engines(drm_fd) && \
> -			    (hwe = &xe_engine(drm_fd, m)->instance) && \
> -			    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER && \
> -			    (done = 1)) \
> -			igt_dynamic_f("rcs-%d", hwe->engine_instance)
> +#define __for_one_render_engine(hwe) \
> +	hwe = hwe_of_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER); \
> +	igt_require_f(hwe, "no render engine\n"); \
> +	igt_dynamic_f("rcs-%d", hwe->engine_instance)
>   
>   igt_main
>   {
> @@ -4895,10 +4904,10 @@ igt_main
>   		}
>   
>   		for (const struct sync_section *s = sync_sections; s->name; s++) {
> -			igt_subtest_with_dynamic_f("syncs-%s", s->name)
> +			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
>   				__for_one_render_engine(hwe)
>   					test_syncs(hwe, s->sync_type, s->flags);
> -
> +			}
>   		}
>   	}
>   
