Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A4CFD348
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 19:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A110E253;
	Mon, 24 Nov 2025 19:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ziz/1vsw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6674610E251
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764011550; x=1795547550;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jUCISfu7qgm+vQGIQJys9WrUcaa/SRbo9B2VrCpA38k=;
 b=Ziz/1vsw2R7EQ6n6ARMx/ml0sfOADX/VXxUFlsLl6KZshv0U8u06L08v
 /iVyiUimQvmOQA7UhmdM/zSpAogVmsPyrP6BsMOLBem3xL7Xs9yB2O49H
 7CY56ADTx4/L0jZRxyaGcqatkLcJjKGdbXVhM3M4MzI9Tf5FllEAN6abe
 yoH037x3ACAz4YP2eqlx5WUxTN9Yw8b9WELut8Dt1D2Vi03Jj3Nqg6Fdr
 awC3oF8ddjt0W/eRTh0B0j7i3/t4lOBgRU9G3rg6BWHX6EEGxr4P2hEe8
 +SNdkoH4nhhVvEMwOwAY6hHZhJitIGh0vW6n9FsPY7+cuCidGOTtqnfX3 Q==;
X-CSE-ConnectionGUID: WCy8Y5EYS22kJP7qzEjU3A==
X-CSE-MsgGUID: 7bp54Co8SxCoh5GJP8C70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65972799"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65972799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:12:29 -0800
X-CSE-ConnectionGUID: kSrwFBB1QkOQSQya3BLvpg==
X-CSE-MsgGUID: oV4vrzbxQwa/xl8jvZGSFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196584697"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:12:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 11:12:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 11:12:28 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 11:12:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugKfAnVXfKrUwh575EAWwaZuN+pGNuGC5hRm92oJ1F3MW4kUAcJY/O2NKtDsozl0ypkRhkr194ueOkAzCoBAy2n36gRWvPcmtFRtLRC6r4iRhLObrs4B7CzYjyPur3g+zHgnd26ygWW96+RkUEzrBnG2xjxN99G6q07WnMox3X04iL6dGz+4Ptdq5JJBbE6Z0KF8MCOuFHKRoCg/kOslwUujzhwNYdOMcJo6zn8gb2tpA88mPdrsgHDDjCl1QV3/2vyE6AjYrea9brsp+UVTWhKSdk7LvnuLRW3wyYTCdjpa9JPLS/FM+vCkkFuvRMj/gnGZg6nmXr8UVsnXq9AMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTqlUtn+bObowMzvFOJ2EXu56g5zFvpZcC0Xha4u40A=;
 b=OxMmcykO7Qy31MAX6iO0+YZIBB3t6YCp0tSydipncUkx//YjedaEuwUeQxs8NJVhGWx15W+OjIJ1K5Wdu+RWhHhSF97MOEfY5LLD1ZtT62IqIMjhxeJmc60vz8v0nyOV0MPwRG+qzOhEWxaPZw3y8N+mjzeX6tVdnD+7/c3i5VvfJZ4IOfLHUkFBJpXZIl/jMhOG8iqkhjlOaakXzGHnhIZzEsqZp2P4kzMq2YGDi3mcxxI11oqfYUP5oiwWPQ1abK1NxaQMMFXxAupp+dSqW6hhdX7F0DP9yWmgSy0c6OHRfi7vR1/kU79l25hwuNBHTnol+PdsVf25aYO8kL5Q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 19:12:26 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9343.009; Mon, 24 Nov 2025
 19:12:26 +0000
Message-ID: <98f4f682-a487-498a-a616-6cf89b624f8a@intel.com>
Date: Tue, 25 Nov 2025 00:42:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_scaling: Clarify skip on early
 -EINVAL
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>
References: <20251120123327.1056280-1-swati2.sharma@intel.com>
 <20251121122715.hmbvcncii26x3m5s@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251121122715.hmbvcncii26x3m5s@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW3PR11MB4665:EE_
X-MS-Office365-Filtering-Correlation-Id: fca9ac45-ca0e-4659-6cc8-08de2b8d67b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aENHTDRKSTZHQ1k2TFBlZjh0RlI0UXBxcHlhQTRKcWZkRGVLWm93R3NwcklK?=
 =?utf-8?B?TERIODM0VnpZVXhMaHNMdFVJWmhDQVBhaWIxUk5SdmRCY0NvRVRxNHRQZUZu?=
 =?utf-8?B?dXlxVmU4RnVjcTAvMURyRzVPUDVsbmszYjZPZ29YQVJrcE1NMjB0d01zcjR6?=
 =?utf-8?B?UnJCbXdEb3dYMVlFNW5FU2Y3WDIvaVFjbTJlWFZZUFhBZkJQdjZCMkNKTjJD?=
 =?utf-8?B?NFBsY3V5S0p0dENUUXVaNnRXcXdNSHRvOXZ5c3Nqbk92WUt1ZXdEaGFtN1pY?=
 =?utf-8?B?MXZpZUJ2R0pHZy9JMk1iMVFRVzN6MTR5LzBNVTk1b1d1a2JjaHZTWXEveUNY?=
 =?utf-8?B?dHZZQStYWEh4VDZXZmtqWHY5OE11WW9jdGNKWnBzWkV1ZDRLUzVMRWJTM21K?=
 =?utf-8?B?M2ltQVZoRXl2NjFPRHNvNTVBNWEvbXo3bUE1SkJmc2RBZE9weTRHcDVxazJo?=
 =?utf-8?B?K3lhMW1vWkZYMTdtMUVJbjRaMDZEV1dCNnlaUTdPdld1djVOVlpXM3JDdzFp?=
 =?utf-8?B?SnFOWVVKYWNpWmp1QkRQN2VZTmUrT0QzM2ozU01XbGFCVzh5ZHZZa3hteE5V?=
 =?utf-8?B?dVRiM0hOcUpGV2F5VTRLeDZ3TEp3UWRtZjZSR0NlYVJoYW9Eaml6UEhac043?=
 =?utf-8?B?Z2ZQdno0QXVyWTFQd2V6ZU9WK2srZFBKRnZYaWxGWEpWTkpNVmwybTdJYkhU?=
 =?utf-8?B?VzBWZFE1bHJ4dHEwMXRxT2lCdmNuQXdUVHlhU2ZHWG1iQ29oUGc0QWdpUE9t?=
 =?utf-8?B?cWQrV1pXdW1sdlhmdW8xZ3ZqMXpPRmpmNEFtbm9panBNMXhWODdiblVIaTdE?=
 =?utf-8?B?bXFnQjIwZ2tVNjdlOEFkbmZudVlkZXNmVzMyY0VNTUpsdHg3NUVJUldqcTBu?=
 =?utf-8?B?KytDZGdneE9FbzNCNFQ2VGQveUw4UGFtTVRsQ0JmZFlTYTR4ZUJlSU4wS1BN?=
 =?utf-8?B?N0F4Y3R4ZUxnYm1lQm5UNDRVU1l5aUtsRDNtVERtdGxZT3BVWFBpbHM3d3ow?=
 =?utf-8?B?Y0x4c3QwMTVSR0l6enp4UkFBNVpraGpiMURzZUVnVlpwKzRJeGJiczV5SURu?=
 =?utf-8?B?QmZZNFZyWE9qNFpCMngzci9ybG11ZjVIczhkRFNzbVJhR2JsSTFBWkN5YjdV?=
 =?utf-8?B?Y3hXMjN2RkFVYmMyNUNGVlpYN2FUQUVxUy9WSUpMTmNlWW9LRS9sOEJoUkVR?=
 =?utf-8?B?S0p4dWFmRUFtS3FRSXlTaVZacUg2ZElQMVc4UjlQTjhJV2pqdDFpQUpHcFJK?=
 =?utf-8?B?Rzd5OFlTZDh1OGN0MDZNcS93SEF6c3pkZTB4eXdvR1poYmhiWEVFQ3JTMThi?=
 =?utf-8?B?WVErSmVCVFZLaUZMcTcyVVhVaUxINmdyOHIwWUE3UC9KcmdPVS9hNWhMWkhW?=
 =?utf-8?B?SG9hTXhQWURYc2tSRVNDVVl0ZXc5cEpxRkxWTG41RzdJVmdUbE5KZnRnQVRL?=
 =?utf-8?B?R1JIRldlam1XUnkydG54MVFGS09vbWsxUXFHVGxzTDlwWmo4b2g1NXIrdkty?=
 =?utf-8?B?WEsxVS9IOTRwRi8yYnVnalJZU1lEOTdsUm9vSEtmVkJCb1BQaVZaQi8xQmFM?=
 =?utf-8?B?U3lReWQvazJKOHY0WGk4ak1hUW1pYlYyd2I4MllOSXA4YnFsVmRDQll4Ynlk?=
 =?utf-8?B?cFdyOS9NeHloTEF0VHlpdVBFalV3ajBlRWpBazV6eVdZWkxjQ0NUMktYZExl?=
 =?utf-8?B?TEY0WkliL29pVkxSNDdhUjA0YmxjeEQ1enNMT0FtNVR5VDJkV0U1TUZrcDNT?=
 =?utf-8?B?Mmo0QjVwMFpLaEJjMGpkRW1kSUpCK1lHMGY0ajBYT0t0L1p3NWRUa3J0VGZl?=
 =?utf-8?B?aVowMkxKN1pkeEQ4d2k1OE9SUUhBRCtIMnE5SWVGME9pckMyeW1YNUZlQ0NX?=
 =?utf-8?B?UmJuMmErcHYvMjZFcXZEQmlmTHRnTWJobmo1blNjTUIxVWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElFYlMwZUFXcXpRM005Nm9MUkdncG10aUl2WWRoeVRTeGxJQkZGVUFqZU9F?=
 =?utf-8?B?OHNpM04wS0RDeHI3MlFjY1JIcmdpSzZHRitidFlNZVlsQ2c2bHgvZ2lFVDJs?=
 =?utf-8?B?UlBQTWRRQURtTG9SY3YzYnI4aVg0WXc5OTlTdzFHNHdxTDVoRFU4dVh4czBB?=
 =?utf-8?B?eXpoSk5EdWRwaWxMYnVYdkpWSjM3bUp4QkhCNE1ra3FKUkdRMExnT251L21y?=
 =?utf-8?B?YlQrR3RuM3YwZXVYZExPVU1GMGVTUFRXWUFjRS9YcDFsM1V6K09nKzBHa1VE?=
 =?utf-8?B?RVNFbVJyaHI3eE45eWJJZ0VLSmJoNDhSc3lkV1JHcHBVcnZqUVhGdTJ2SXVN?=
 =?utf-8?B?ZG9VTVB1Q01Ic3pOR0RUSk1PdThWeUs2ZHNxS2JTbndyb2I1ekhJSVpOYzFP?=
 =?utf-8?B?Q0tTTjBJZ0FRNUhpVDY2N1BTVkxnVVl2V3IwVjBMdUZ0ZW1uT0haci9XNDZa?=
 =?utf-8?B?VWNoUlZwUElIRk1LNUNsNS9jV1gzcTF4UndrelJIUXU4aEM3V2tYZnFKc3NQ?=
 =?utf-8?B?OUh0cFBTeEQvdWRKUFBWQ2d2KzdSTURzdU8vcHRnWFpEanJvbkhNVlFwcytT?=
 =?utf-8?B?S3ZkT1hIcTkwNWlYM2lDTUJpSTZKbEhobldNNTlxSmpoV2pUT2g4bmFrazFz?=
 =?utf-8?B?bjVJRlZoQnZ5VGxpNXVIa0p4bngzRTc3Z0dxakI4Mmo4SFBzVDhqNjlmdENz?=
 =?utf-8?B?czE3QjVDbU84M0s3TCtQUVMwSG9seC9KYW1KVDR2Qm1iNG9sU2c0N0R5U0Qx?=
 =?utf-8?B?cmlXNmZ3RlkrK2h3MzA0UFBVZVV1ZzFKLzZ3UUFaakFaSHEzZlpvYnVid2ZF?=
 =?utf-8?B?L29PVFhDN3g5MU5wcUJpUWZLdUZSanNmVFQvY1laejE0bHVDZVBCQ3hkeXpy?=
 =?utf-8?B?eittREQydVV6ZjRPOXlZZVhzU1FGS3hhK0k3QUZTalBHMytwaXd4K2lQQk9R?=
 =?utf-8?B?RG5jUmF2Zm1jaWloeFo3N01ucUQvcE4rbnozQ3N3cmtLVjhyY05Bc0lDSG9U?=
 =?utf-8?B?NUdURXdlTmR2Q1VHVyt5ZVZaZ1B2bmRhQnlreWt3eWNJMmdEa2RyNnNJTkZH?=
 =?utf-8?B?TVpWVndHWjhtSE1EUEQrbVh6UmZleUovdlpZdDErbWFkVVN5WHZOTXlDZ3Rp?=
 =?utf-8?B?OEVPQjlBZi9idVdrWnB4a09SclJsVnpTNXZObFFmQk84SC9ZbWJzMFFnN2lh?=
 =?utf-8?B?a0lCSytodk4yTmJlL0MvYWZOUTNUdzVNekdGMk5TUytoUjQyU0Vma0lEaHZP?=
 =?utf-8?B?bGVHSHoxcU5wY29Oc1FyUEtCMXdFU0EvTFljU1JWaFF1bktJcmMvdnNPamVk?=
 =?utf-8?B?MTY2TlNwTlBBTDZjYW5Xc0RHTVBoM0ZiVmJURkh4TWVVSkkzaGVzQWY5TWxO?=
 =?utf-8?B?OEdoMmg2KzE0Vm5TRVJ0NUtlL3VqcjJMVTRuaWtNRXd4SnR2aThXTDN2aUdS?=
 =?utf-8?B?Vk1mR05KeUp4WGdvRTRWQlZ5eUJNS3lEL2k2TlNXaHkwbGZHTWlVaWUyU016?=
 =?utf-8?B?TlJCQkQxMTdaQXE3d000UzQxdExpWWVUenNScTVvUTZvNVRtcktGck4xS0hk?=
 =?utf-8?B?L2RYd1ovSkhDTVpxaXJPUk1DT2xCUmljQ3BxNkpHSXZJYjVCWTdWNDRRRlo4?=
 =?utf-8?B?WWpBMk9oRWFEVVlyL1BXQ3BhQ2hKbmRzcnk2S3luY0dJSk9TbExPOTBpalgz?=
 =?utf-8?B?ZXkrU1p3Y01ZTGdDTjVHY0x2cENidzlCUFBKQzR3bEoyMUdlZEpsanc0bGZu?=
 =?utf-8?B?NTZDUE9NSXdibm50aDQwTGMzbzlwR3ZEN2JzaHNVdTQxWkMyVGJ2MXVmMm01?=
 =?utf-8?B?OENSaVhnek1QTGZBU2lXK1hFb05BQ0hLSUY2S0s4VlAvanlMZUllWjRIQmxu?=
 =?utf-8?B?K29DeUJLLzRlWW9UUVhqTWFyQ2p0WHFSMkV5YlRUZ3puU2h6RFZYOENUVkts?=
 =?utf-8?B?WENqR0NvQnZkL21yQjNRTXYvRDgrYjRCZitSTWNyNllNM2VCeXZkdkgwcGlv?=
 =?utf-8?B?bENJcFpTS0U1ZkRXVExVZVdaVHQ5OUdOQzdmMjMyWmlycEtQQS9oZXVxZ1hu?=
 =?utf-8?B?a1NuaWtiWVFzcWQyQ055dmNqSmNIS01yWlVQM0ZjYm5INmhIbHo1UWxmeE9y?=
 =?utf-8?B?dDRrcytyNE9iWUNxY0Q5S1FGSGVYQXZqTUJNUnlJMExlbVlTWm8yTEFrWXNy?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fca9ac45-ca0e-4659-6cc8-08de2b8d67b9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 19:12:26.5943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttrxR8AdH5bMe3RNtU9qc1Z2S3UL0piiG6y9jA0Y8/kuTJmwOtinRDASzFEyWJafgsSWGNtRFrbRRbbNg8Yrwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
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

Hi Kamil,

Thanks for the feedback.

On 21-11-2025 05:57 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2025-11-20 at 18:03:27 +0530, Swati Sharma wrote:
>> Clarify the skip message for cases where scaler requirements
>> are not met and the test exits early with -EINVAL, avoiding
>> confusion with a driver failure.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 63d35d76b..7de1b802d 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -1386,7 +1386,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   								 igt_output_name(output));
>>   						}
>>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -							      "Unsupported scaling operation in driver with return value %s\n",
>> +							      "Unsupported scaling operation (ret = %s)\n",
>>   							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> Overall looks good but can it be one function call?
> something like:
>
> static void skip_if_erange_or_einval(int err)
> {
> 	...
> }
>
> and use it instead of copy-paste.
>
> Regards,
> Kamil

Addressed in rev#2
https://patchwork.freedesktop.org/series/157842/#rev2
>
>>   					}
>>   				}
>> @@ -1416,7 +1416,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   								 igt_output_name(output));
>>   						}
>>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -							      "Unsupported scaling operation in driver with return value %s\n",
>> +							      "Unsupported scaling operation (ret = %s)\n",
>>   							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   					}
>>   				}
>> @@ -1446,7 +1446,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   								 igt_output_name(output));
>>   						}
>>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -							      "Unsupported scaling operation in driver with return value %s\n",
>> +							      "Unsupported scaling operation (ret = %s)\n",
>>   							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   					}
>>   				}
>> @@ -1473,7 +1473,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   							 igt_output_name(output));
>>   					}
>>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -						      "Unsupported scaling operation in driver with return value %s\n",
>> +						      "Unsupported scaling operation (ret = %s)\n",
>>   						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   				}
>>   			}
>> @@ -1500,7 +1500,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   							 igt_output_name(output));
>>   					}
>>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -						      "Unsupported scaling operation in driver with return value %s\n",
>> +						      "Unsupported scaling operation (ret = %s)\n",
>>   						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   				}
>>   			}
>> @@ -1526,7 +1526,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   							 igt_output_name(output));
>>   					}
>>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -						      "Unsupported scaling operation in driver with return value %s\n",
>> +						      "Unsupported scaling operation (ret = %s)\n",
>>   						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   				}
>>   			}
>> @@ -1555,7 +1555,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   								 igt_output_name(output));
>>   						}
>>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>> -							      "Unsupported scaling operation in driver with return value %s\n",
>> +							      "Unsupported scaling operation (ret = %s)\n",
>>   							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>>   					}
>>   				}
>> -- 
>> 2.25.1
>>

