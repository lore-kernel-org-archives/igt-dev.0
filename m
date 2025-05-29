Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3DC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70F10E0BC;
	Thu, 29 May 2025 17:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ba5C627l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FA210E0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748540380; x=1780076380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pAaP5iCau05+RWFkqydK+hqQxKKXDJUbqOypZ48m52k=;
 b=Ba5C627lu4pYFjuC9Bq7c9amtqpTDDhncVI8/CeWLGYrpRh0X0JtFR4w
 jGbTvdB/XdLWhNfsmhpQ8ETd0o4eVIg4no9s/Zr6mGJTUwyQxs/wwPbjC
 xApNk8ysO5AIY9r5PTp0P5R3rQVvQk6uDRXgs5GKt0ZIfP3Arkw9EjrsU
 oH4XepgA+ObSLumgoPufH1TBeYYEEqjCTOWUCFt9pBt0raJfnpmefamZ6
 Y1iQZsbwBR1mIiDnTsqwGC3ysMXCo6bl8IxQrcVYGD1/MT2vrSy8s8zz7
 n7RqRO4HWeYTm1fDiLdubAc6XuxFXLY3ftNqDUg3VALAuzIh3LEKlF79p A==;
X-CSE-ConnectionGUID: YMohO7yNQTSPboIaUlJGmw==
X-CSE-MsgGUID: fhM6jeE4QdOPFbvsplurFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76009820"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="76009820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:39:39 -0700
X-CSE-ConnectionGUID: iyzEETnYQbCHIKGFfagaHw==
X-CSE-MsgGUID: eGnu9qH/RlegoYKamCyuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148415705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:39:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:39:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:39:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPN/u8kSyLqvW6RvmOmQ4JL33Qoqj5Q6t0hMTf56DOHAqCV95sUHOlnfAB96zBIhuwYANN/EsJUuYhy4oBdp65dI+3kcewgJfQ3YJX8MUJbS8yWDtNrHF6CtxT9Kh0Z2XDw6ZumdLiXCjdEIczgVdij+Tn8K6Qm+JFJFL/J3PltY+bFBXirv+sJBBEAOMkN6amUGTxbTcXHKpX3STNDOtPyE6Du0SD37hJhZ7Tx1+gpLmZneiu34c9XNs9YFynib3Q52tATm/av1Q2B+PsHjkRsBHzvMgLzKk95fU8we/QJMwp/3CkEiaHEe4CPg3QW9VAaX/TDjflnVHwLDqMrtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XypKh4bTARUW0lykRdTDrO5ejqhCq1mJchqC/sjUUCI=;
 b=hA+5SuIV4t6LIPPysQiasvAi7QGqprGvNCSWNwwAr72Jvh1TugaXVMTGPl8w0V9rL6f1LpevwgRgGZln62qRnwixAqpZIKv68orsoOlCNol/jyjYZxAdnnfQGkIKEk6j4a7elU7b39desLKUhUhp3jXmd31laZgTfkVy8gq0s8XEFqUkKoHeiG7cv3rOxEFBRKydBuwv1NZn0mJwXIwRznSpznIY8IJUFYYTf9KmKUeHyelBDfVUtZcLEGLX6z8dbqEEtactvz/PxpZ9MrUXXNoJ9hfYZVlVDMaMRMMLtviNDlJZVSqDok0lBwB0xjszdoIUQmTeq0v/k03+uNlXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 17:39:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 17:39:32 +0000
Date: Thu, 29 May 2025 10:39:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/xe_pmu: Add a test to validate
 engine activity after starting load
Message-ID: <aDibzFcBCQwP7oRs@unerlige-desk.amr.corp.intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250529065359.915117-4-riana.tauro@intel.com>
X-ClientProxiedBy: ROAP284CA0436.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:147::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 5629d54e-cfa0-424a-356a-08dd9ed7c528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmY3T2F3NURWSGRnZGpRMHgzN05hZ0c3YUtsRW8rWkNYbVlaTi80VVlrVVJu?=
 =?utf-8?B?SkVSVGVFMjY0RFNEYm5ML0RIeEYyYkFWV3JTbis2SFFJenpWd2RqbDNaV2o3?=
 =?utf-8?B?SDl2Uzh1MDZOS2s0NnJ5NTFPM0hpVGowczBqYXIvRUcwU3N6bm5uNnZaQ1NP?=
 =?utf-8?B?elI2VjZLaThGVEMwYVFwMi9GcHpEVzdxV0w2aGRaTzhxQzIvbFJqc1gyRWl3?=
 =?utf-8?B?SCtUVGh4aFdBMXJOb0VMd1phYW1VUWRiQzBrUGo2TS9Zd01ndFNuV3A0aVEz?=
 =?utf-8?B?VHFBbVk3cXdhejUzNWZmbGJZbDd1UFo1SDZZaE12cklZWHVyNzF0WWdQWVI4?=
 =?utf-8?B?ajB1ci82VGpDQVAzS0ZQQ01Bdk1zaVBndU9Cckk3TlBvdE0wTkFSbmdYK3hH?=
 =?utf-8?B?b1p0RWcxNVRoUWFpYWVWWTdETHk4UzVWV1hnVTc5YzJsb051RFk5dytqN2xx?=
 =?utf-8?B?ZC81Y25rSzh5R21kMjg4Z29RQXFkdmlBa3RvWGQyNzBacmY1U1d2ZkNSclJV?=
 =?utf-8?B?b1BrcS9la3Q2Y1llTElRdUs2b2FKTm1CalFRL05HOTRiL2wwNjZPTUFCMkRT?=
 =?utf-8?B?SjYzeGxESU1DVjZxL2ZKRGtSVnJhTHNBb0YvcXhkQ2M5Z1hpa2VkTlZJNTQ3?=
 =?utf-8?B?M1hwN0c0VjhOcjRxeTV3TlFOWWFsc04vNnNKcEljQ2FIUXQwOHZwdEpCWHRv?=
 =?utf-8?B?NDNhc0VnVVJkdkozczZ1RjRzUG5TYW4vR2VBNC9qTkJvZnJ0U05sTWZBNFl0?=
 =?utf-8?B?VmdkVTJjTG95QVNRc3R1UGdoWkorOHhEYnlwOGpnRWtYc0liTElSV0JWbkxP?=
 =?utf-8?B?aVJyWFhmRlJ5LzNtVGRkVnBrSHIxRk1oRWtNZE1rTFJkRTduTWF2aU1TZXVK?=
 =?utf-8?B?amtBby9YeXpXZzNkNzhaQVpLbmswZVFBTTV5UWZndmZBaUNLNTI2YzVBMlF2?=
 =?utf-8?B?YllORzRvNXhyRTl6cjhRa0lmdWlvMnY3MHZIbGZ5ZklUT1Z3SEhDVlRYK0Nx?=
 =?utf-8?B?d0hKRjhzQ0pnOVhTMGlLSWJDSS9KaThCUE1yMVRlV2RzQ2MweHZHK01iTVpj?=
 =?utf-8?B?MkxqRkRMdzZ0VHovY2VZVE9Qd2tiLzdlTDlRU2IyTi9oc0FZemZWbkQ1UHgy?=
 =?utf-8?B?N1RvYnh0ZEVqU0RrYjZMQ0svZkZ0WXNvR2tqV3kwT3Q4ZFVGaEZ2VXU2Lyth?=
 =?utf-8?B?RG1WNkd6VGNTWEIybEk2cmc5RTdQdVZvMUs2YmpXM2J4SGY3cjh5bWZBa0kz?=
 =?utf-8?B?eEpnVWF2REt4S01nRENPQ04wRzJPV0hrZkFxZEZiWWI2b2RubHh3U2N6enV4?=
 =?utf-8?B?aFA4d292cVpyL3UxS1NHejlncXMwQnM4bTBHTGxBVmRaSXpaWnMwSzFOWFF0?=
 =?utf-8?B?MHFrUnJZSkpyTDcrRmgyMmtIT0sxOXVpYmQrSzNqREpLelo5dlo0YitYZVd2?=
 =?utf-8?B?Y3F4bVcyQjJpQWxwUnVJMmdnNS9nSTJrd0JZUTZ1MDdENzZGdzVJbnZxNFha?=
 =?utf-8?B?SXBhM0ttOVlLZUEzb08xM1V6QS9xN05wRE42eWhYc1Y0ZjlsNVFrdVRGOFFi?=
 =?utf-8?B?RWNiN0FkaFFVTC9mMm1FL0cvazltc21OMUpLeVc1d2NZR0xYTlNJVTRGRzI0?=
 =?utf-8?B?ZzdKQ2RYNTUySEsvVWQ5M1JUYnU1MkdwbE4zcDJWRjFnV2c1S3pvTVJ1QWdK?=
 =?utf-8?B?dHpVdXBPZjd0em41WjZTUXZwV3plVzBMV2dja2RMai8xTkxlbnl1enZreUxE?=
 =?utf-8?B?WFZNaDNxMHc3UnBWeFV3dk5id2s2cWg5eDJ6eTZnam1PVUhnZitzYlIyc05R?=
 =?utf-8?B?VEtUcDhkM0R5UXFnaXlCSGw1Z2RjUnBrYkkxSWxrM29BS0ZIZHQ5MTB5cmpv?=
 =?utf-8?B?dGhpbXpmUEk0ZitmRkU5bUFucEFWY3F0VExxVnIvRmdkVDhNSXJSTS91MzMr?=
 =?utf-8?Q?HhHQo5+xRr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRMMjhTcWlQOHZnaXo3cW1IZ1ZNbDAwNWNMWjdtOFBrWDJWZWNiK2cyRlFp?=
 =?utf-8?B?ZjVnbGMrcGZ3UFNFMklpYyszcjl5cmlleU5hVk5iYk9HUWUzTFhHdEwxSVh3?=
 =?utf-8?B?WHVVLzFCUnlTNG16Qi9kVGMxY2J6VGIydGZWUXRkV0RzUFRrbUpaZ3kvK3dS?=
 =?utf-8?B?N24wZ3RrNStJR2F5MUZJRkhOeitZTVYyd0wwYVlHUFdRMi9JVUY1Qi82NWpX?=
 =?utf-8?B?V3BRMUszNFBJTEFJM3YwYVFXdEFyRkNDcThiQytjQnlEOW9qa1h0TDVxMXZt?=
 =?utf-8?B?emJVTUtXWDhPTVo1Zk9UK284Rjg2RUp0SG5GcXVRSDlXOEpFV3RUS2ZsSkxW?=
 =?utf-8?B?RkdDV2duTWR6SnFCN2w4dHF5S29Bc0dmZTk3VG5XUC9iK20yd1BCdUY4WWg2?=
 =?utf-8?B?WEY2Qkp2MHhXNUs5Vm5ON2kvSy9od3JUTG1TYzAxck1MNzBHdGdiVmozWERt?=
 =?utf-8?B?QVF1bGNCc2hFbjc3NGY3UjhLT1Q3VzhvTTBNNVF3Y210UFNzYWh6ZnJGdjVE?=
 =?utf-8?B?Q1hFK1JWRk9xbFFKcnpXTkhsNUlHMWlJRXlFazl3d2k3R291Qk9DT0hCREY2?=
 =?utf-8?B?SEFtamx1WndnZzdJVDJLNDMzNU9FaVIyUU1RYlRCaGpYZUtkYTRkQnlqN0Jw?=
 =?utf-8?B?YUxwVUJEN2JVZWlLZi9hMURSSGJPTTgwUEdWS2JaZ0MwMkpwUEd3aFZzeCtP?=
 =?utf-8?B?UkR4emMyTVUybFh0MTBmOERuNXFkYmRNOGNNV3E3UG5qZDExbVE3L0htR0E4?=
 =?utf-8?B?WnZuVnBwTHI5SnpyUkxkOEhvVDhPazRlL3FIRHE3Uk5wVjhMYndrc0Fld3FY?=
 =?utf-8?B?c2laRElUbGViZlVoVHNFbDkrT0JLKzFid1BZdUlCMDJPc2d2OFQybHJQNVNJ?=
 =?utf-8?B?UWQ5S0dPdGE2LzRTSUY0d2ZONjdLZklHaTJqRzZHWUNGclpLZ2VvTUtEZ09D?=
 =?utf-8?B?V0Mra0xBVGt6QjM5R1V4UjcreW5yYUdpNm1TOVpqTDNUZ05UUFJKZUlyejNz?=
 =?utf-8?B?MExMaGUvSVBxT0t2OHJYSXRPQ2srVmpKUER5aHJrZVJQdmJ1bVlwbFU1YlMz?=
 =?utf-8?B?aFlldk9vWWlPaHp6cE5YN1RjYzYwMTNydWJWSVo1Tjkxd0k2VzRROHFNNVI2?=
 =?utf-8?B?cUFROTEvZ2ZmWmhzcytEZFJCODlFSlpjeXdLeFVQdGdVZVllWnVmRXk4OUlh?=
 =?utf-8?B?TWdTWEorOVJ3bVRJVzNuL1NYaVNNKzFsZ2xQNThjcnAxYzRwc2Q5VTNUVVJM?=
 =?utf-8?B?K2wzWUNva01MaFc3UGovazh2RUJ3VDlpbGMyS3kwYXlueFdDMGhRZnA5ay9w?=
 =?utf-8?B?Rm5lekt6QVM2anRyek9pUlEyMEFjL091cWgxQ2FQTzJLMGx6L3lsSitqc1BH?=
 =?utf-8?B?L2RUNlNXTVZhVlhNTWJWZ2syVTFSK3lwdmpmRXdTMTBaZ3oxM3owdGF2dWFq?=
 =?utf-8?B?MHBhL21pUklJYytUbk5SYmg4ZnhoVGdmQjhDdFZncU4vQWFMNXNhMFVDc3dH?=
 =?utf-8?B?cFZpK3JJeXh5OUpuOHRqNDIxd0ZBUUJKMjdhSUljTm9QUFBEU3JCTXQ0dEdz?=
 =?utf-8?B?L1IrL1k2Si9hVXhid0g1Umd0ZnkzckR2R05TZGpoYW5uWkV1R0EvMlJaK2ZM?=
 =?utf-8?B?MjQ3cnl6UW9CZFc4N0FoRUFJdnBkSFJWek1IYUt2eUVuWmszV21QYWgrdkJO?=
 =?utf-8?B?a04wZitQazlqNzgva05qL2I5OSsxa0QyMTNsNWFaMFJ4ajkweDdydS93OEc0?=
 =?utf-8?B?bmRjc0RzaFQ5cTd5UnRKNzNxSk9KTEMwTVRlMjMrSXpPempLQUNNc3VibVFu?=
 =?utf-8?B?dU13RGs4WUN0cFpMQ1crUkFqUDFMbVRzeXZTMFRiTSs2QVMvcWRDaEJQZGxz?=
 =?utf-8?B?MFVlWnhSa3ZQNDZ3ZVNybHdYdUdjbEpYTzRnYk94c0IvZzlPeElDNFFCZnRP?=
 =?utf-8?B?TFR4aWVpV1lGWUxnU2M5N0ViQlF3cWlMNDZnWFA2ZUtPN0xGY2VxcDlHSklh?=
 =?utf-8?B?NWsrUVgxWEc2eEU5b2NCcDRLKzRYTEZTVmRPaGJBb2w2VG5WcEUwWWhpTk56?=
 =?utf-8?B?STFJT1cvVkdKaHVHV1pKMHkrNGJiRjRzYTFwa0doNmZqYktPSUVCd2kzdmhU?=
 =?utf-8?B?clNrRVBBR0huMGlnSVJQQWRNVSsrS1V3eGFKbzVaQ0w3eitVWDVZMEgveGZJ?=
 =?utf-8?Q?Am3Iu4q9M/PYKNJeoj/gLlI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5629d54e-cfa0-424a-356a-08dd9ed7c528
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:39:32.1214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vtx4pfjqPI4m/3ceIxg6/LVchYhtq7J8NigcU+D3vEnHUvzdcdFusjQokyLoVyKxF/fa8yTipWV6e0dycwKW1ejdpvVO9IRn/dn7m5a0Ur0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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

On Thu, May 29, 2025 at 12:23:58PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity by opening PMU after
>starting load
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 47 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 198470365..21b294167 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -46,6 +46,9 @@
>  * SUBTEST: engine-activity-suspend
>  * Description: Test to validate engine activity on all engines before and after s2idle
>  *
>+ * SUBTEST: engine-activity-after-load-start
>+ * Description: Validates engine activity when PMU is opened after load started
>+ *
>  * SUBTEST: engine-activity-most-load
>  * Description: Test to validate engine activity by running workload on all engines except one
>  *
>@@ -569,6 +572,46 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
> 		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
> }
>
>+static void engine_activity_load_start(int fd, struct drm_xe_engine_class_instance *eci)
>+{
>+	uint64_t ahnd, config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>+	struct xe_cork *cork = NULL;
>+	uint32_t vm;
>+	int pmu_fd[2];
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+	xe_cork_sync_start(fd, cork);
>+
>+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+	end_cork(fd, cork);
>+
>+	engine_active_ticks = after[0] - before[0];
>+	engine_total_ticks = after[1] - before[1];
>+
>+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
>+		  engine_active_ticks);
>+	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
>+		  engine_total_ticks);
>+
>+	xe_cork_destroy(fd, cork);
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+}
>+
> static void test_gt_c6_idle(int xe, unsigned int gt)
> {
> 	int pmu_fd;
>@@ -842,6 +885,10 @@ igt_main
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 	}
>
>+	igt_describe("Validate engine activity when PMU is opened after load");
>+	test_each_engine("engine-activity-after-load-start", fd, eci)
>+		engine_activity_load_start(fd, eci);
>+
> 	igt_subtest_group {
> 		int render_fd;
>
>-- 
>2.47.1
>
