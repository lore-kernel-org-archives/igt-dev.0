Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CCD0EE0A
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EAC10E53D;
	Tue, 25 Nov 2025 16:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nh40GEDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1310E53D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089446; x=1795625446;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ysMHBJIWGm/I3fczAv8z0TC901sTIWDUuuAy2NvLJv4=;
 b=nh40GEDmSidTblKJt+qPcYHtz7FK9RiLnqG/0vZs3cZm8XA9e8u73UUG
 bZjJYaXfFrqD8AqJBBsRmJLfMHUvd0YrY3RwiL2YgMPyMlyLU4xBVlOTN
 QG3wX+j37PET5kW1XjjBIXWLAlWLHRyStkFTPgxWxA9JesPVoFu9JjM4X
 1s00GZjwr4xR1mb+f8dEJHyXfiKSBXBCE2Dwc92x4aXBB43FRKu2We5Do
 zIEZhYuN/5pown2wwtmySP4GAWHI7fyoiBFJa3jOP4mDpawvNxgACTNJV
 0hovoJwr54YvZ6DlZvNMAIs3/dQjfcqNz17FdUGCWZg3Gnsd9j2ar7XaJ w==;
X-CSE-ConnectionGUID: nOgRL4kqRLO1WQuPmeoJtg==
X-CSE-MsgGUID: Cu4RXWPrSuevfXwR9wumJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66002499"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66002499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:45 -0800
X-CSE-ConnectionGUID: 05DEBMT7SuypW1I+BY4YYQ==
X-CSE-MsgGUID: zhtQI8IFS2+ikZYJGHis7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223657843"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:45 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVG/g+QUnRQuSasG4Y31RoPBsLL0zofYkMoQzodxGaR7T4QYfVwJJGsdkWPwoz4iQ/YuYPvToEx+qM6P0orMQPWuxEssHncslHIWuBz4YANlXzXETAI+EK3Np9VLVFDbFxiZm+fJEVsO8ESKAMcRVSzs++yQx9MgIOI70SLQeIkjAGXe5N48Tn4NExarJm9AjImVHVHZ6xZh3FzVoFRGnkYDFrc4SayE532HlYyXWbR9vHCGeeni+1CDOTgCsoF2EKSNwa1lWJbdbQZxwl+KjW88w6Dkx/ELRm643Jo5rKSlQcEKu5aEkOPx6Gq3yzsvPdVsCLR5CP1RsFzt1BGyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lig9Nc/9vBgkkb+h9zY0MuXbYZJvChrxZXVj78uoWCM=;
 b=SK1jmp2Idiy0qsaMAKVTQ/FuLwB0LjBOXCLqpPSh9oCF8uNY0RSjGk5ZbbXU/QkGmmlqZ9wOIn4mXKImctQT5yY0siWseubNyHgy9HWwU7qMlgPKX773ge7qO2tJ8hIrJOC7PP54MUTOToiiYvCv71suLw4qj6Qe3U46B7gHomd8/kP51W3HuRBkgo2/9THMz9PyfyKNhTZ6aX/l5mOW04ojq8IfObA34MVa+HDrQWv2tY46958ECTSfirEYL4v1b9zdHyJjyONN8qNUaoDgWkXlbzfz2kCoqHj4C0hzy2uME5fMdJNt5sdyVCXCBu7ONfd8qTmnddkKSTRQjQdZ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:50:42 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:42 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/5] Redesign of the xe_debugfs test
Date: Tue, 25 Nov 2025 17:50:23 +0100
Message-ID: <20251125165028.36533-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d50e64-b890-47aa-df8f-08de2c42c4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWtlSDNtQVNSNmVhTmQvL0dWQWlXRzNibWNsOStjUythTGJSNzhST0hSWko2?=
 =?utf-8?B?TXp4ZDgyVks4V1F5WE9RS1ArMU03cDJEcHdQM3dkYmVKeHdXekNGR09jSWcv?=
 =?utf-8?B?QlA0d2ZNMG9wVE5QdGJOSTJMNjllNG1IWUNBeDhxS2I4SE1zSVdSdkVPNXRZ?=
 =?utf-8?B?NzNpSlEzaFlObGtqYXJOVkwzWDdJQzI4Z3ovTjlaQ2xmWGRVdHplTEw1NkE5?=
 =?utf-8?B?TUQwM0t5ZkpNTmwyVkdsNGtXUnExY0NVaEZlaFlmZ3Q0azREdS9IVnluaitl?=
 =?utf-8?B?TU5wVWtacU94a3hEWTBOa1pNRXc2dGxvdFIxczBsT0R2Znp4aVhjTU5lTHpV?=
 =?utf-8?B?UnQrZm5DN0licXNJSHZla01tdkMrZnNNNXlHK3MwSlpEU1ZrYy91MmtkNTFx?=
 =?utf-8?B?WUFpSlZpSFhYOFJrdldYVDNXdzBmRGxhdFhGUGh3TVJpOEkvaExhZmI2UEZj?=
 =?utf-8?B?M3QxTC9HaUJ3Ukozd1B0eGIyNGpZL0F4NzJIcDlKUmNkZWhwTnp4U2M5dDdo?=
 =?utf-8?B?OG8zR3JJb29FWkZHV2RnSTJsNXFNU2pEL0k5UlQ3ZDVHekJhN2ROQWFXVWdJ?=
 =?utf-8?B?SUxLUXhqcjJDVVJYb3pMZHJZMlNOZUtKbDBZc1Rob0l4T2liWDBsNjAxaXdy?=
 =?utf-8?B?Tm9sZ0RTYjJMcEMzbGRsaWRRT3YxcklQOXRuQlF1Y0E3bWxyOGx0YStGTjJq?=
 =?utf-8?B?QU50VWp5emRrNTJLdlFicVkvRFB6cDRsZkN6SFNaYnBNcHFlRWJuMDMxQ0Vj?=
 =?utf-8?B?NE02T00vU0N0Z2xZMHdyZ080Ulp2eitBVE80UW5lYkIwR3k0VG9DUUZ4alht?=
 =?utf-8?B?Tis5U0RmYXVJU2NKZU1WM0dEa3BmTmZ3MlRJTEtnTm11N2wzSmhQRDhhRWRF?=
 =?utf-8?B?UXdIcWdlZFVoSWZudTZGWnRWR2lQdkpKK1ExSHJ6YVJmNUNEQ1d5VmlPa1hO?=
 =?utf-8?B?T0psMHBKamFVSEYrR0ZmOXV4STkzczI2TWFSRUVDRStXVTZsQVJaOGFoSG85?=
 =?utf-8?B?THA1NExFc0tlV3NpVEdxRmJzT3dCbXd1S2NCdXVqMlpQeGZlVkR4LzJyTDJO?=
 =?utf-8?B?TnJTb3FjSEFNSzdaMDIxZTh1dEg4Y3lpNnFJNExlV3Ird2R6emhqSmgveFVi?=
 =?utf-8?B?QjJyZnVGN1l4eXhPR0U0R2doaG4xSXdteFRqSGpvajl6SEE4TG5rZU90MEQ5?=
 =?utf-8?B?UzZrd0pEbHJqY1o0U2RWY2J2NlBEWlRVN2haanYwMFN1MFFNU3lCeFhpMmw4?=
 =?utf-8?B?ZjVIWmg2SEFRcHFiUWREdFJqbGZzRVJKb2Z6TVlwdFV3SDA0QTFUQVNzQ1dh?=
 =?utf-8?B?dkVzYUdMSXdHeEY2Zk9pSjdaa1E3ZkhjY3dnSUs1aVhyeE5LaUZVRWgvMkdH?=
 =?utf-8?B?bzFXTEF0MVZleDVwK2lZN2t0aEttUCtDYUpkY0k2c0RBdFE2dUhjY2R4TWV6?=
 =?utf-8?B?S3JFTFRSNHZ0VXkwMTdWOU0zT3RHTHc1Tm5KTnVFOGs0bWdsUXFHeGJwK2c1?=
 =?utf-8?B?WEdTY0RxWHRpTERNVDlWTEVjTXlxTWc1N3N3OW41UnB5c0JMZzJ0SUxENDVl?=
 =?utf-8?B?MUNGU0h2VFBJRlhVZDYyUFlGL3lDVVNza0R2OGFjeWtCZkY5anpqVC9rcWhl?=
 =?utf-8?B?eE5EREtUVkVGZFRHbkNVTERZOU5XRDNKLzRKSEwvK1d2VWFKSW03YVBsVjNm?=
 =?utf-8?B?RlFLbXBlSC9QaG1yNzZ3YnpsOFZDZyt4VW9oV01UZndvT2ZXYm92My85VTVT?=
 =?utf-8?B?T0xkenFJdDdsemI1QjR4RzZtdWVtcXMyNFg2VStLZURLYVY3b3hHckhRckRw?=
 =?utf-8?B?bFBCNUVkVkI2OW5oaktZSEpHMWs3S2JSYnJTS0dmRklvZ2NEU3NEZlBXeW5R?=
 =?utf-8?B?ZmNnaXltVm5NUTBUbE1SditjbUhEMklzcFpldk4ydGt6d2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlnYWJZaDJpdWVEWndFMlBkUHA0SHFPSHpjWmRYT3FZeENLNkdycEI4eDEx?=
 =?utf-8?B?TE1BSXFkQzNqSFQvQ0swY0ZPS04wcHo0VHlVdnd5TkQydUZ1UzczazJ3bk9I?=
 =?utf-8?B?SkN2UGJRTVJrS3JMN2hmc3FseFNUclhCd0J5ZWFHTEs1QURQOU1rOXZSRXpV?=
 =?utf-8?B?ayt1dVNLK1FTUzRRVnhkYkFzVUdmY2NTK1VUZkM4NmY3Zytyb1lNYlNHdnBY?=
 =?utf-8?B?RFhadnpySzFwTXJYanloNUExQk1YNXI5SFdaQ053NjdvM3dzYmppVEFaMkYw?=
 =?utf-8?B?SENSS0VqUERuVjEvaS9yd3crajdVSldFUXptTFU5LzdqZ2swTzk0cjZnZ1gz?=
 =?utf-8?B?SlhYQnd2M1I4b0I4eWFYd3hWWk1PeTdITEZvTGZMSk1UT1hRb2tTTFJVcEdo?=
 =?utf-8?B?dVM0Uk1iRnQzWXMzY2RsV1lmSy9JK3VwUG1uOWNQdmNsemZZN241ZnVsNWN3?=
 =?utf-8?B?aHdZZmxRMjIxWEdRa1RSbDdOUDBCN1A5TkFoZ3h0Z255M000eGtub1FLZW5T?=
 =?utf-8?B?ZEc5R0tKbTJ3N3BraVZaem40Q1JoSWNFSTlnZWU1dng2RlZNZUFLd2VnVlhy?=
 =?utf-8?B?RDlPY0xkV25RMWI2Qjc2V3dUVGM5QlJiR2t2K2RrQzR1M3JHRFhJOGhzUEZE?=
 =?utf-8?B?L1k3dnQ3Yk90VW5rcjF4eHVIUVp3citEdzhCOEUrdlZzVlhxaXJ6cmJBcysv?=
 =?utf-8?B?aUJtS21qSjkwZWhRZFRtazM5Q3p1UE50MEdvTG9uMVkvV2tTdExObTRTQXVz?=
 =?utf-8?B?dHp1Uk0wMldTaGdPYjdXUUxWVDd3bmVrSTVTM21BUDdacEdXWkg1cWFKVUJ0?=
 =?utf-8?B?NU93SVpsZStzMFlRc3VNaXlSVmplS25NcWZ5WHczSHRwUTFjWENCTWZMRDh3?=
 =?utf-8?B?NWdwSjB2MytBRGJia0FKalFsbjhhZFJRWE5YdFdxc1FNWVlCcEVzaWYyTWhM?=
 =?utf-8?B?ZkxWRHR5a3JoN2ZTMWJ5ODdVZ2FGUWZremdqWmttbmMvazI2dTJ3WitFNW43?=
 =?utf-8?B?YlNLZ0tXa25OWnlJSXR0QjdWNFBDeDMvQVRrTVFYTEpGY0NKMWJTR0VIR0Z6?=
 =?utf-8?B?Z2d0RElINGhNYkJqaUxDRkNTMlhva29Lb05lNXlRZ2ZqQWZ0dG04YktTbkF1?=
 =?utf-8?B?NHVJODYzWUE5RTdkMFlaOU92UFZtdW0vR1pOTDRXdkc0bm9NQmJvSUtIL2l5?=
 =?utf-8?B?dHN2d0NiK2NzS0Q0WWsxWjExM3BPWEEybG5UOWozTnlmSUN0WTN5eDk2K3lG?=
 =?utf-8?B?Q2krY2xNS09rN2xmQUJpcldLTnVKOGRZZUFZSDJ3cnpVZTRtT3VpMjVtM2d5?=
 =?utf-8?B?RmExM1VBemEwKzJyRktoUE01Qi84TzdxZ2t3cURSQjNDQWk0bHNGL1JtbCtP?=
 =?utf-8?B?bHFDSjFSUThEQzBTdTlxbHptOFZzK1VsYmt2Nm42ems3TzZWa2diODVRTzd0?=
 =?utf-8?B?cWdUdzlDK0NtOSt4aklZWlpYZEZhWDErQ0M0R0dSbUNkcS9nS1hvRmg0Tkwx?=
 =?utf-8?B?b25COU9YeTV6aTdOL0owQ2NUNlJna2FlUDdvUUwvODhNdEVQdVovVUpxcW5V?=
 =?utf-8?B?NUtBMFQ2NjBmZHl6WEs4Rk1RVFY4RzMxVjVKa1plU1hxVW9hQi9iQk1ic0Y4?=
 =?utf-8?B?VUtDaS9YQmxhamRhYlRRYXordFZ4bGlPS2ZSZVI0dGNoYStkZzRUa1RZTEt6?=
 =?utf-8?B?OG1CWWl6ZENPSFZjNldiRHFUT0hoUnp5czdMbnJCdmMvYys3NXZPYytzeTQx?=
 =?utf-8?B?MFBZRHVFaTU2WFBGd1dTdTd5MHFxejFxWVh5VzdKd2lFaG9PYllNendrUERn?=
 =?utf-8?B?NWpXU0tjL1VCTWREYW5jWVlaV3FKa29WRFNJdm4zeVRIam1odjFaK2FyT2l1?=
 =?utf-8?B?d2VGTy9od0JLMS9zT1k5UTdvTEJibXpXRFRibkhkYzNpSTFGMVdBR25iTm9E?=
 =?utf-8?B?aDZVaDhYTWRTTnd5TTE3VWNSS1pqVUp6elpBRG9xNDh4SnhKOXZWTFhDSzc1?=
 =?utf-8?B?bWFJdFFEaHMyUlVXMERkRHU2M1B0WDJDbldvNy9uZEY3cjhFZTRGQmdtWjVy?=
 =?utf-8?B?Tk9yc3dVbmljVnBDTExKZXFpMG9CakNXV3RYMFdLQzRLQUE4OFd1OXpHZnBw?=
 =?utf-8?B?Uzc1V0xMQnRnV3Jab05GSmlpV1RjUWVxdU1JdmVwbEZqRC9HbU5wV0hFNklu?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d50e64-b890-47aa-df8f-08de2c42c4f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:42.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ziec+nOH3kjkEGZRkMiNklLY+VkEyj/4eT/Ibbos3vv2sWMFedKOqkkE4aUa9otY9FPgMQdOCnHRzqM5dTL68Oh5JGMd5QFSGsroGSKEvjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As part of the work on patch [1], it became necessary to update the
xe_debugfs test to account for the new debugfs structure. However,
while reviewing the test, I concluded that a broader redesign would make
the test easier to maintain, extend, and adapt to future debugfs changes.

As part of this redesign, I propose replacing the old subtests with a new,
clearer layout. Instead of the previous subtests:
xe-base — validate debugfs root directory and check the contents of the info file
xe-forcewake — check the forcewake node
the new subtests would be:
root-dir — validate the debugfs root directory
tile-dir — validate the debugfs directory for each tile
info-read — validate the contents of the info file

The new subtests rely on a table-driven approach: all expected debugfs
nodes are defined in an array. This allows both conditional tests
(e.g., testing vram_mm only when VRAM is available) and dynamically
generated nodes (e.g., gt%u based on gt_mask, or tile%u based on
tile_mask).

[1]: https://patchwork.freedesktop.org/series/157089

Piotr Piórkowski (5):
  lib/igt_dir: Allow scanning only the current directory
  lib/debugfs: Add debugfs helpers to open tile directory
  tests/intel/debugfs: Rewrite tests to use array-based required debugfs
    file lists
  tests/intel/debugfs: Add tile-dir subtest for per-tile debugfs
    validation
  tests/intel/debugfs: Move VRAM MM checks from root to tile-dir
    validation

 lib/igt_debugfs.c        |  31 +++
 lib/igt_debugfs.h        |   1 +
 lib/igt_dir.c            |   1 -
 tests/intel/xe_debugfs.c | 414 +++++++++++++++++++++++++++++----------
 4 files changed, 345 insertions(+), 102 deletions(-)

-- 
2.34.1

