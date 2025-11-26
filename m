Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA6BD1118B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 17:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30D510E69E;
	Wed, 26 Nov 2025 17:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdZ+Mdee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B5610E6B0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764178977; x=1795714977;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2bLyV9C0Bt2Y2f6zt1GZVA7y6vj00OskGFIFvatQPAw=;
 b=fdZ+Mdee0PjfBQ1JVYca8o5XKM522vy3KEb6k+Fin3nK9a7K9hfaNA2H
 pBiG2YDnPzPSDB7QT5zZnMMbEQ3PcYwlpJslQHuebYxnrZiI8qlHdu2at
 W5RaN69bG347b/70dmBxvkGVa1jFikk24d4ge8/HQrpUtLcmrfmK/uDVZ
 3hI/6Jso2ffXP90DB2NuQHV0TRkgCownzXluuYTcRd1p/yYsRFqG+abAl
 WA658uKuMVpasgrx8eylc/XblDmjDso/EpkwWb6pyvVsvg3mQBS3zm/Kb
 JOoxzSGOA/q8ZE1nFjKHgusMaxFwbnXFJ+JmgufyvtPo2Pkhn2IrFlbuu g==;
X-CSE-ConnectionGUID: CHzRSTGsSu2AyMLN38gk1Q==
X-CSE-MsgGUID: 5MIkla8mSAaI1SPjNCfdRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70084958"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="70084958"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:42:56 -0800
X-CSE-ConnectionGUID: 2GugtYW2Q92ud2bXFVsjcA==
X-CSE-MsgGUID: w32xVDIkTRem+mRfm96e9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197491135"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:42:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:42:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 09:42:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:42:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO8OQiS4VT4WR4WcA9Hc6yxLKZRCHekUWZ9eoKIYPMpAbRXF9tVVtc7qe8PjkBdGj9ldA9ltrCPktUm862iwpJJzqrln4PqQOFpziR6PTpcI4IvFMnxu2wZNRoP2ZhtvYww7HDQD698ofF8ZumQGkS7BQiJyGelXM9wgLlwiH5fONYbfSiVhm7CDKaB0W4qxCgL1nvfI2ig07ur9x2ANjWCt7RcRgHGTTZR0qXQYJoBrIDqh4td1e03LSdJGQKxTSnsBeRVabnjX9UYEBakYf4MmTz37HuuWXBLRTgueafy3u8x+c2zQtRgZGETaLk+fvMtNns30i3pRYxpMVVdngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSDsl2GWPEjymzksPYHiSOvKDk+c0pEEu0gNS4R43IU=;
 b=N8hk6rnwjbN2oi2uxf7ji0ZqAnsJIIrUIOpEkFZZmAfTPq7mfqSsFZ9Q6JEd+w3XM2G2sk6gnI+8IxR42YaEf8tnXCyOEFCeSeHYIRdv7y858Iw0LJPwPURbSh/gz8e86oTU8hf6BVvjjzygRY7/Q1zwM7On8YkxFdoJFCQSpt/4KQKX+/7ipi/72VnmoV9CQGj3zLHGdTb6QTmXFKBV4SyYn/jUr6g1pC3hvDIvJMRenFH4KLrpxfqUauqMH7XnThhPkyWDBq67ZkljcJzM9L3rsueAzlruIN6A+T2SnJNccWg73GSV/KbJJo+NyMDBEdSL8wDXTQGkuJoBQiLvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 17:42:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 17:42:53 +0000
Date: Wed, 26 Nov 2025 18:42:50 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests=2Finte?=
 =?utf-8?Q?l=2Fdebugfs?= =?utf-8?Q?=3A?= Move VRAM MM checks from root to
 tile-dir validation
Message-ID: <20251126174250.3bgdtunzsmu6prbd@intel.com>
References: <20251126155545.51113-1-piotr.piorkowski@intel.com>
 <176417788273.31997.17056534028624038888@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176417788273.31997.17056534028624038888@a3b018990fe9>
X-ClientProxiedBy: DU2P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: c74fb665-e759-4899-421c-08de2d133a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anBpOVNYcWVFQytpcUJIejRLbDNlc1kvdzhZUEJZS2pjRGJ5QmhOUnI0UjFB?=
 =?utf-8?B?RnNYNFZNVzhIclhicklFSTRwK0FmVk4xeElKTWxuQTd6VFFQblVkY0RKS1Nq?=
 =?utf-8?B?T1NiMEg2cllmVS9iSzVhU2pWSUFtU2ZveDZmWE1JTVhtemZydHV0bzM2YnFT?=
 =?utf-8?B?WnFtWi92MWRha0hDck1hMVBUTmpVcWhNNDFraUtTV0hGaUxIODhtM25yTnVT?=
 =?utf-8?B?bytJTTZnSGxlamZNWnZDS2VKWUhTelhUeFprUkNRWGtPb2ZJNnBLbGxHam9N?=
 =?utf-8?B?SW9oTkxCV0oyQUpocHU5eU81M2VvMkU1UktzRm5ROUE3UEdmU2tqVXgrSG5B?=
 =?utf-8?B?aUNmanlqRXl6bGFEa0RqRkhYUnhtbnBCWjcrOStUOEl3TU1FYWkxRjFuZklN?=
 =?utf-8?B?aUFVSERiWHNJVDNHKzJjWnMvYU1Qd2VHMWlNaXFRTlVJWEpHK1I4SDZMU2c1?=
 =?utf-8?B?aDFRbU5ZcjlKcU1UckxvVW8vOWVkNjdLNU42cjA2RFNsNE9POFJQUFBTU3pt?=
 =?utf-8?B?MTh3S29iYUxXekdTYkd3T1NSMXdsOGg0c3JkenhMbUowS1dibDFXb1JmVXpx?=
 =?utf-8?B?QVF2TEs4Tloxa2xsK3pHUkRKa2ZnMzJrN2pidWMrSGRRbm9pSlBCdHVvNDR5?=
 =?utf-8?B?RjFndjJZMkRzcjV5LytnSmt5RTRqcnlXbzZPdVM0NTFpUTg0UDZHRW5VQUM2?=
 =?utf-8?B?aHlKYU5wK2hnRWtXTFFQY0xLaXpJSWJNeFdEMndEaUk2RDkvdkFxYTltZVJm?=
 =?utf-8?B?NWU3SWhMaFJFU2xSU3RvRlFmKzN2RXB6VHVMN2ZxSy9RVVFZdFM1MnhqSmJt?=
 =?utf-8?B?WUE0dk92bHlKMjhLK0RhejJqem5QRWZ4WncxSm52YzJlU1dkN2FBbXhkcHZk?=
 =?utf-8?B?ZGlUTm5GUGQyNWJ2bjVLTkhoT1dkRGNteEpJSi92ZE9qQXRBVEFVcjNxak9J?=
 =?utf-8?B?cFJmSGJYNXMrbnBqUDdaU200bnhqOW5pMG5EMkNPUUhJLzY0KzRGdytzcXVo?=
 =?utf-8?B?WkdYRU04TFR3R29WdVFTbXRFbmt3VjcxVkw0cml1bnNCbWlPT0hTNHBxOSsr?=
 =?utf-8?B?YlFCZDdDc08vSkJPSmZXaGFiRFBVRm8zWnNEVi96Ni84N1ppSDhTMjNMOGpF?=
 =?utf-8?B?RG9wTHgrSHpORnlnQVJ0TldPcEZPQWF0L0ZwbDN2NG1mVE81M2Q2TnBjK1A2?=
 =?utf-8?B?RW1KenVNVHN6VndPMlF0QndHOEg3UHhmeDFEajdiZittbTRWWnM1SStCZWF1?=
 =?utf-8?B?SFk0MTUyL3VmRENOUzJ0V0tRd1ljeWhYUGladG12YUg1VittRWFjb2hnNzlm?=
 =?utf-8?B?ejhjODRvN3FYZEI3SlFrSmtXeStkYnZYbFI2TWF4dWlVZU8zS3ZMQ3pZSTBY?=
 =?utf-8?B?TU1TQjlabWZtdExQVEdQd2NGYnpvRXdBNUYvMEVab09RbzVvT1RsakZYTy8v?=
 =?utf-8?B?clQxcVA2WVBzdDhFeWgrUG1EQjhvbVZiRjBrbUUzSEFNdWsxS0tKQUVHWnp3?=
 =?utf-8?B?a3d0L2NKN0hSeUhrMCtNY3lUYWFQU05udGIrOVF2ZzJya0cxcDlNN3doTGww?=
 =?utf-8?B?NS9nMjVOQmpqSjl2bGkrakhSZi9tSE5PeG5XREg4aE5LOEZrbUdaSythUGpY?=
 =?utf-8?B?SU1HTUxXWkdNSWNPUHZVSEdFSGIxTzRicjZjT1ZpU1IrZ0I4TFdwZFpjSWtt?=
 =?utf-8?B?aDR6VExZQXlPUlVpSXUzdDB6aHlaTHkyTUJQZCtyVm90WHZDWDNCeC9YSWNH?=
 =?utf-8?B?bXd6RDQybkg4MXpMaFNtQmg2dm9pR2o4ZTZaNlFmbHN5d2xRTzBCNS9SdnFC?=
 =?utf-8?B?dWw5N1crMnhaaE9xTkJjRmJoVnhYY0FPblo4UFBBaXd6N2pTV1JUb0xNNWQ0?=
 =?utf-8?B?THNKRUFiSGhrczJlT1c0clIra016bDBuczFNajJWcG5Ndnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWVFcnA2bFJCbGpTT1BFdVNQY1Rkem05a2phclZjZTgzT2YvREVpdGpJUWhP?=
 =?utf-8?B?dkZEQWZ0Zmh4U1V1aVcrc1NKR2ZJdWh6dVA4WFY4L25OcU42U0RkWGFIWmFS?=
 =?utf-8?B?Wnk4YXdwQk1oaEJpdkxUZERzUjF5NjJkYWhzUDRRR1RsS3pSaFNrM3l3MmIr?=
 =?utf-8?B?N09nY29CV0tpSXlzTExMQk10TlBWdUpYQXY2d3kya2I2YW1IOTNoOVQrYnhm?=
 =?utf-8?B?NGp0YktXSG5pdW5NNDRzYzNwYlRPVjh2UkRjbjZtb3dGbUd1b09KSUFMNmZu?=
 =?utf-8?B?MXFpbEV5SVo5N3Y0UVBSMDhZQ1Uwemlsb1N1ZE10cy8vRHlVaXVJWVBubWJX?=
 =?utf-8?B?ZWNTSzJ3L0hFQ00vUUtOeWh5U3VaYUkwTUlkRnVMT3dUcUYvMHUrdzZVTDNE?=
 =?utf-8?B?WDhkcWkyRVoreXBxdlc2bFpEa1JvckRGNVJYNC9lR2M1WlF6Nk1mNkxIVGV2?=
 =?utf-8?B?VmZ5OG5WN2dwWGk4aFdqdVgrd1lXL0pBREQrcVF1MXZTMTRKVk9aemYzcWZO?=
 =?utf-8?B?blYvQnNqWG5BUWFXa2QxbXI2cTc3MS9nQ2JwNlNuWHJ1S2tHd3ZTZlcrd3NX?=
 =?utf-8?B?dWVkN09PVDhwU0sxczFmc3ZadEpBT294UksxSS9kd2F3djhvcFhtbER4RHQ5?=
 =?utf-8?B?TlJVeE1nSjVnWlJnTnFLZ2V5MmJub3Z4S1RmOE43UFczZjhOb0FsWHR0dTZH?=
 =?utf-8?B?dCszL3VWSE5ZMkY5Rm5UTUVmaCtGcG1PNkNNc05jNE5sa3pQWDlkRnFoc0w4?=
 =?utf-8?B?REdNeU1CaWFvME0xcFJSUG10SnVlMG1pSkdNUUl4NUpoanAxZzhKWGU1WU5V?=
 =?utf-8?B?ZmUyb0pDUTJNenhIc21NUWcrOXBBd2lWMVBmbTZKdlVUcTEzaVBrVmNDU09C?=
 =?utf-8?B?SkZXOFRPTlNCa3pja3JTaER5cnBvbm9INFR0emY3R3FHRnZiWkJNOFUxMlVN?=
 =?utf-8?B?MjhIUkVGRHl2RzhYQjhKL0tFclVOMnduVjRxZjZGbE9YUWt6L0c0d0pFMHda?=
 =?utf-8?B?TUNsQnIrU0VNeFdSN0pacUFwY2hnUDJDQ2ZlKzNqbnBYcHZTUW9UalZadVNN?=
 =?utf-8?B?WVNoeE1xcCsxc2xWb0VFSnlIS2dHcGIrMjRWQ0wrVXNzempyRWo2cnpzWTFy?=
 =?utf-8?B?R2dmY0VlUm9EUHBiRmJ5ZjI0TTE2RjVhc3dNeDJ1WGtBaERrc2RlRUYxNXJU?=
 =?utf-8?B?OTJ0dHI2NHVVcHpzd0tqUGovdXJWUFBndjhwMEwvaXpuZWQ4dzNxQjZwYk5L?=
 =?utf-8?B?elM0VVpxbC9tcGFyeTN4VmRYQzBwbHNWY2lGN3U0cGFObG5RUjFXL09Kd2JG?=
 =?utf-8?B?WHZrcEJQa0RVM1BWM0VSbHM4SE5MdDQ0aGhrWC8xYkRjWFJtbktjMUNmVms1?=
 =?utf-8?B?dG5wV1JITHJzY1E2WE9mWUZVTGlQTGd2dWk1ckljS1l4S0Q3MnlSb1cvVDFx?=
 =?utf-8?B?ZzdvM3JZL01mc2RqRnE4Tk1LNEhFM0J2UUUvU3BJQUxxeUNKcmdScDE5YmUv?=
 =?utf-8?B?aTRFb2ROZTNWb2FtSUVxSEx0WjFFMUg2c0p4TzF6N2tJR2tZVjFqdFhWL0h1?=
 =?utf-8?B?Z2tUc0djejI5WG1SYXM0MjFEdXd6dXZWd1NoM0xrQ2NGOE8wbUR4dExvb0xI?=
 =?utf-8?B?VU9XQ1hGQ01rcTd0M2VuWkFrMzZaWXc1bG9sQ0d1SWNwaGxLWWtiMG9kZzRG?=
 =?utf-8?B?V29PTUpvcU93M1QraGczM2M4ckkydmVrc0o1cUxJb1hzR3Bld3RlMERMSjcv?=
 =?utf-8?B?YjhEQlhPVHpJQ2FqSmRqTXBXNDBWMlBKaUtKcE50cnJ1UzBIYXNLWmFQMEhT?=
 =?utf-8?B?QU4wRFFodlpvMHJVTk9qL0pKc04yVk9YbHB2VVA4WFhhY1drMXBySStUVkd3?=
 =?utf-8?B?bU5xVXV4ck94L2oraVpYdWI3dnhQWk9SQk1BMzg3Y3hxVlY3bWRjNy9YbTlr?=
 =?utf-8?B?dFowUWFPbXNWUThBaWp3TndkNCtEZ2NrQmFkY1hUVmhSc1hEZlF5N2daeFF5?=
 =?utf-8?B?eDd3Y2dzU1hOVzcyQ2RiaHF4NkpPbnZIVU9QNU8wZHozQWFWdUhWKzJHUklH?=
 =?utf-8?B?M2ordGQ1RFora1NqRUQwZFRlMmVWcmcweVRoWVJzQzN1dVp3T0tTWW40S3lo?=
 =?utf-8?B?OVg0ankrR2dTY0N1cEhzZW5GYm4zd0dISzBDaEFZQWFpazF5bmpmeGJtcnRQ?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c74fb665-e759-4899-421c-08de2d133a0f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:42:53.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2PV0rorDdMgRFG+3CON6H7OypLwO919QCzEwCTx5SaVc8mQ/1JN34WJDnUPeHzvPJTkk43pz760jVqP1RE5L2i0P3v2FMgWJNVhUaDJgHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on śro [2025-lis-26 17:24:42 +0000]:
> == Series Details ==
> 
> Series: tests/intel/debugfs: Move VRAM MM checks from root to tile-dir validation
> URL   : https://patchwork.freedesktop.org/series/158118/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8639_BAT -> XEIGTPW_14120_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (1): bat-adlp-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14120_BAT:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_debugfs@tile-dir}:
>     - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-atsm-2/igt@xe_debugfs@tile-dir.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-atsm-2/igt@xe_debugfs@tile-dir.html
> 
>   * {igt@xe_debugfs@tile-dir@tile-0}:
>     - bat-bmg-2:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-2/igt@xe_debugfs@tile-dir@tile-0.html
>     - bat-bmg-1:          [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-bmg-1/igt@xe_debugfs@tile-dir@tile-0.html
>     - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_debugfs@tile-dir@tile-0.html


This is an expected regression, because the test concerns changes
in the kernel that have not yet been pushed [1].

[1]: https://patchwork.freedesktop.org/series/158118/

Thanks,
Piotr
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14120_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][9] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][10] ([Intel XE#688])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][11] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][12] ([Intel XE#2229] / [Intel XE#5488])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_mmap@vram:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][13] ([Intel XE#1008] / [Intel XE#5591])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][14] ([Intel XE#977])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][15] ([Intel XE#2838] / [Intel XE#979])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-adlp-vm:        NOTRUN -> [SKIP][16] ([Intel XE#979])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_waitfence@abstime:
>     - bat-dg2-oem2:       [PASS][17] -> [TIMEOUT][18] ([Intel XE#6506])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@abstime.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@abstime.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [FAIL][19] ([Intel XE#6520]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8639/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
>   [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8639 -> IGTPW_14120
>   * Linux: xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b -> xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b
> 
>   IGTPW_14120: 14120
>   IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4151-542259628fbd1effba5e6ca6fe1c3522c6ddc86b: 542259628fbd1effba5e6ca6fe1c3522c6ddc86b
>   xe-4152-3736d8f8cd5565a7146345cbdf103a4dcff5e55b: 3736d8f8cd5565a7146345cbdf103a4dcff5e55b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14120/index.html

-- 
