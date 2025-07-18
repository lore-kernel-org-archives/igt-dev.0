Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FBDC83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 08:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B34710E119;
	Fri, 18 Jul 2025 08:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSibtS70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424B10E119
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752828267; x=1784364267;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y51rzJ7xdF93wH8TCmaf91sPlAxz0pkw/I0b83KWNtw=;
 b=FSibtS70Sdc/auLhB0AWRUJ6TYiyf0vC/4KQZHtg2/w42Z8agXVYCnl0
 KODN3Plql0CFG2jlUc0ktJiTXJLNwp6aNFXP7iSk2YZot+lOLIHmyig60
 GG0oLMCPt1SMbw+Vbrzaylqn7/F/A/IxGDhhQfEpBNH68jIHTuPwZ/w91
 zmGKRLw2rkVtRgE5bVrqdwiSixVio2998iUaOiFv+UBLRDiPzo6aCMy1L
 c7yQsdCVT9F+ObjOnEjqCmECDmkWR1Nw2VjBLN2KpG7VjLOIVTjxx578z
 0JckDYp4Aiv+NkcOz9btYqylF8O5GH6RKxJRs2k9J2A2YUsBknlZbd/fU w==;
X-CSE-ConnectionGUID: XOLY3ZWLT9WkpYVc8h9zFw==
X-CSE-MsgGUID: Tf8tOrmJQC2zyXEf44Imww==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65808489"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="65808489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:44:26 -0700
X-CSE-ConnectionGUID: AVbV4sjdTkyZmlDVQy7uwQ==
X-CSE-MsgGUID: wj9cWZwzT3GnZhzVTvvPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="157396183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:44:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:44:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:44:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:44:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAa6G31xwI/OU2/1+M0uMdtt10HC6k1BlggYwUcRJKSz5FxGI4ZnMTLhJkR403TUk7EBTKsYt9jOVG7TDYy00MBYCUicPPkte0cqvpRbHwyZCknooAIwXQrvmPkDB3Aq4OSgS74+MiC4NuJ5Irx54sQw1NKWQhS/z35NOajmow2unN7ZCp84rh0E6MvvfY0j1R6Wn9ahbw7/ou7L0cmXzPfQBS8Nc9GMR0pnFU8RlVii5ldaui9cZwWZ/jVbbQuTI+CH/4uTXMTagmTrjy/Jv2jyNNpZw8x4IyZ2u1+prb6p+6Z07E7HBooKXfj2PME1vg0BxlOXIku1hAixWgH7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDmWM7pnmjehlGLKLLJkNG3iT+V2ohu8xE0O/KIz4XQ=;
 b=NuuFW3bUFSGgtP7CWE6KP6mNCmJ0se7rvekD7j/KkWgxRANdiM67wrd+wJbWF+tjJiqiNFvIzjNGLzkhiSF1u01VdcvTCZ4fEbBhjdq545Ol4Dq6fIGvAXea9swVXi9ygam6S3bRtXRoZwQOspiHlg5urp8W3XWh+Ktnu8RbTMrjm1fTEgNNdWamM/EqnFMBmWrqAZd8OopFKrSL2nOQW1kQHGh3v2M5bZxwn6OoYZAshBEzS6/2MmoKJJI5KlWEQHU/4Rapmaltq9vEcitSX9rvU+Cb0f03wKzLjGgpo5ee3l3w4SxhVFuNYyg/4PMyRu4rsT7nrGXl3kPchfTNgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 08:43:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 08:43:53 +0000
Message-ID: <7f832010-5908-4fa0-961d-2f9c7368c77f@intel.com>
Date: Fri, 18 Jul 2025 14:13:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>, <arun.r.murthy@intel.com>
References: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c7ee46-ed11-43a7-9b03-08ddc5d73971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDRSYUJMeE5qeEM5dm5HbFl4bzZnbDZlZTMvaEp3SDJDa1h4TjNNNzVNanpa?=
 =?utf-8?B?bVRDV1d6NkVjNEttNVpmY0VNSUMrSnVqbDd5NEFVQmJVNGVwOGJ2L3FnSFA5?=
 =?utf-8?B?b3RNL2xPMTNUUlc4dDJhMkI2dHdFZ2VWOW9UZEttV25JUFlOa0xodFYyUHZB?=
 =?utf-8?B?eVpTdStWeVlBSmZ2dlZEdmxKT2ZnOHQ2M21sbFByVlpSK0ZDRFF0UTVsTE9q?=
 =?utf-8?B?NUpUelRWcFp0dG1mOUlFbitOVlE4M0t4N2tMUDBuYVJHQnhJT05CS1JtaTIy?=
 =?utf-8?B?NENkNk1JV1NFTVlpWEcrVzVzU2xnU0x6YVZvbitTdU1FN2N5NXBnZkoyWGhB?=
 =?utf-8?B?N1I5OGZaQStvVW0yTjVadG84TFBMeVlBazkzY0NTR2ZkWllYR0paUFdKeVov?=
 =?utf-8?B?RFFoaFFySEYxNTQwWGw0S1Noa0VnUDFTdmt3Vy9YL09wdXBxMG9NNXI0akNr?=
 =?utf-8?B?VTg4WFVCT3E2YUk2enJZYkR2VVFnNVlaYmo1NGhCaXc0QjhsQ1g2UnRRVlJS?=
 =?utf-8?B?ZmlzU3FOR0lpOUxaZ1JhSXNtRWk3MDlJMVhiVXl4aHJueGU1ZEZXMmI0N0VI?=
 =?utf-8?B?SE01Q09kNXFwNEFhWkx6VlBlY0VEUUs2Zm00ZHo5UFU0enhUNEhsKzV6YWY0?=
 =?utf-8?B?Y1NGWVlRSDdEc0VXQTNFTGxSbjkya1BOc3JNb0tNaFJ0Q2I3STRPUi9xVWNa?=
 =?utf-8?B?L09sblN4dVNoMjk1VUViUGQ1ZHdEczM1UFE0eDJqazB4cEdFYTJ3K2VlUlha?=
 =?utf-8?B?aFE2cW5mZzFlMVVVYjU1Wk1BcHlNaThVMUFSUCtxVlFCVm9RNW5vdXMySnBG?=
 =?utf-8?B?ZjBNVnVCbVE0ak8vOGxqcFZvL29sR0hnc0FobEpPVjFBOG1yUTdvaGdmRnhm?=
 =?utf-8?B?cUxOS1R1NlJOeHA5RWhlbFcxQUlPSmlxRUIvYlRqV0xQOE5pWU01SVIxSzhn?=
 =?utf-8?B?V3AvTmFacktkT2g4bzNHdGVyK3ZpTlZRWVZaLzdFUzFrODRabFZYeTZFVnBO?=
 =?utf-8?B?bGZLY3VabjhweUxGYjg2Q090U1VRS3JsOVh4eWdSZzI0WUw0ZFdaZnhDUGRj?=
 =?utf-8?B?Sk92UDdNdEREZ3d3UVUveGtIZ2xMYmZkY0JYZ0VtTGJKRXpqM1E5SE5mVGFV?=
 =?utf-8?B?aEMyR3ErMjMrcTM5ckNmWWs4VXFwOStTNGpMMDZQV2JhbFNQbEtrUGozazY0?=
 =?utf-8?B?NklZekNES1lRZ3pzZmxqRUdSaWEzZ0ZEbEFGSjYzcDZhSHVObUZJZHlaRVQ4?=
 =?utf-8?B?aUFCNkJ3akFIWVVSdmp1REMyV1ZXUVdFY1RIYys3MjM4MGJPZWgrT3Z1dE9j?=
 =?utf-8?B?Z1I4N0Z5ZG1zMHg5SjVpRkdydDYwUVc0TXd5cDd3eGhDaURDRnlZRHl5YWhK?=
 =?utf-8?B?bmhOeWRjYnZWNDhaK1RWRUx2NkFoZVk0SHhMZ1NCZzNtQ1liOXJqQzFhcnNS?=
 =?utf-8?B?UHRzV2N2a0FvZ0JSR1RibnBOUDAraGp2ZFdCZjI3WHFWbWJBaDJXZXNTb0tU?=
 =?utf-8?B?UEhTeUxTOWVEZTk4UForTVZvTTdaVzlLOWhseUdEa3ZtVVNNbXpMKzJyQXBW?=
 =?utf-8?B?TlMwZWVMcnBqM1g5K0dIZFlHL204MzVZY2hTTGFZV3hNYXlNNlpZT1BmRkFt?=
 =?utf-8?B?QzRZTUM3ejNOaHNyNUtXS1EvNmRPRUtOdnNNbWQ5UWpNVk80MEhTQTM5c2Jv?=
 =?utf-8?B?Wncyb3VOVDdtRnkwd2FON2tndlRvU3AvSHRUN2c4eWJRTmdNbUtjekxoMzV4?=
 =?utf-8?B?WmVaUlQ5MTVZamllSWZPbVFyQWhVY2pKQXFDTXdYVVNMYk50UFpGbmo2S2JG?=
 =?utf-8?Q?SLIQ6upmS683OMQMyi/og0qFNoWJdEgv0spjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmtQTWtNL0o2d1RrMnFVQ0lBUDUyQVNUR09LWEF6MmZwZXdLUXl2eXhObVNp?=
 =?utf-8?B?VHBkTkNiQmZEaXNsNER6NlFWaXlSdVNQNzYvcjVubHhXMkxxWEpZVzcxZlVR?=
 =?utf-8?B?dVNqUnJEdmZJeUNnTkE2djZHMVVWNzFpR2ZqWkdpYXFpNldGOTN5Tm9zMGdC?=
 =?utf-8?B?NmJFUERxSnkvb2dRVE1mTHBjUTlEVFVweW1NcWxOVmR3S20vN2JqbmVMTWZa?=
 =?utf-8?B?Yy9PRWM4Zisxb3hoQmcwVUg2Ni9td1ZyOExRVzBhd0tybHhVRE1ibWZvNGNQ?=
 =?utf-8?B?cXdadjE5MzBrVXJPbnlIQ3pwVTM4WGtFTUdvcWZ1bWN6ZUIxb3JkaDY3Mkxj?=
 =?utf-8?B?MWVLMWFBRGJGOEJUd3J1Vm1DdDFudGt3NTRFSWNPUXJuNElJMmYrNDh3SjM3?=
 =?utf-8?B?L09iQ0RndWlzdCs2a0ZiV0ZLNkdRQzJtK0g1OXNPd0kvRVg3eG1rcjM0Z0VE?=
 =?utf-8?B?Z2pEOEVwTTdNTUoyOUF5MitLUUVyM24xUEZpZStzVmt6NWJwTXF5RmlWUGNo?=
 =?utf-8?B?dnk5ZStSc1U5TTY0RzNQQkxqd1RzMU9ZTU5scTNVTEtxWTZ3ajFsMWI0MTRC?=
 =?utf-8?B?OEF0NDBBdzRtZDRwTG03L3ZwTERnc1JTVnlmL0tiaWxobkd3bkZBS0QrUzNu?=
 =?utf-8?B?TytQNFppMDNpMEQwR05ObXVCV1BsK2NCVGoyczh5eFVTa0N0ZUZsZWNaL2VD?=
 =?utf-8?B?cDZEQXhKN0kxMTNIbUxkd1djTTIzN1doMzk4S1pJakVDeXdTSm9zdTJRQ0Jt?=
 =?utf-8?B?MmlXeWlzYlpoVk1rS0lkbVJhRVdzc1lwbDJreSt2TVJFTmJxN1c4aHNxNU1i?=
 =?utf-8?B?UE11aldwWmo1K3Q4NTFicnYvWEtUaTIzS1BpQXpFYjNuS2ZWN2taR1NGdVRM?=
 =?utf-8?B?QU1JcW1McVlER0RaTjJpRml6cytoWGtidXFMSzNxRVVaZHM2MzJvSElKamxT?=
 =?utf-8?B?VHdpTUp0VGNvZjFDVGJYWHk2VjgzMVFsYkpscG9TZWZvRFlsVW5qM2NKbU1T?=
 =?utf-8?B?VmR3VlYveDlLek1qUEdzQ1hITFV1STRKcm8xblREVm5ldGYwRTlEOGZzblJZ?=
 =?utf-8?B?azZMcTBWQ0JKbzRnbk5NVmt0MzFaZEhUYkk1ZEJTU3RKaW9JOHoreDdjYS83?=
 =?utf-8?B?VU9hYWs5MmlMNURoK2xUb25tRFlaSzE2QThUQ09mMStYc1o1NVZJZFQwS3JW?=
 =?utf-8?B?OTVXRllSSnNwU0Z2R3U0czhTU1p5MWhwVnRxTXZYYzA2Q1o3bUVMTDhYVkIx?=
 =?utf-8?B?Zm9rVFpTUkxMb2FQRGhsZ0pEY205YnJHZWlLVitpdHFNU1oxdnNkL3pSSEU0?=
 =?utf-8?B?SE02RnB3Y1lldm5BcXJzdE9XWlMvd1pJb2lQVm4valhDMFpxcTJZVEZ0elY3?=
 =?utf-8?B?aWFuTjYzbnY4VjA3VWpadXpsNDVNVGU5TjhkVlJLcFFPUlNLUnpvQTh1cnpu?=
 =?utf-8?B?UXcwK0RpZllMK2lOc1FpSTdWaU1KaUxJajBvRHk4TTNvT3JYYVAwU1lEYUxw?=
 =?utf-8?B?eVhGVEQwWXRZNlh4S0F0VUhZTkNITzhWeHJJbVIvcE5saGJuQzNTMmMyVHQ4?=
 =?utf-8?B?SlE0bXBSME4rUGovcGN5bTRWVFhWUUFSL3kxeW9TS0k2RWtrMWxPd056T1Rl?=
 =?utf-8?B?RnJObnlXSlFlQnFqdTJjWkR2QmFvNnV2TTV5YldzNXA4WlM4QnR2MEtWaE1q?=
 =?utf-8?B?M0JzakVKOWlZeFJGbVplOVhEVmRhM2p3aUkvSVE5V0tnY0hvWEZYVG8zSXBX?=
 =?utf-8?B?bUlxck5pSHpXOEJVamFMWWt1N1VpRStGUTErYkdPeDJ0N1lBd3k3LzN3Q2o5?=
 =?utf-8?B?ak9NZm40aGM0NENDMk1UQ0s2YWRaNHBWTFF4YktOeFdoaFBmRzZxckFybnZn?=
 =?utf-8?B?UFp0RGdabFNoMGJpL0l1OWxBNTVTQnp4MCtXU3g1WUo4ZjlCdkFnVnFuc3Zv?=
 =?utf-8?B?cFFlcDNBTzU4ZlZTM2RZV3Nha283ZGl0ZXNtOE5hODhIMDA3THpYV2pUTG5u?=
 =?utf-8?B?S29QUDl1SnRBdEMveEpiY0o4Vm5LcjR2eG1NamVkWHl5SWQxMXRIYUdIZVc1?=
 =?utf-8?B?QUhpTTRYVXBIVkFxQ3lzQkRBTDFUUE9KT0YzWjZ1d3ZOdVY4bnlYc0p2Y2dn?=
 =?utf-8?B?bHQycW1mVXpJbEphSnVnd0ZHQ3B5Z0xVQnJ5OWxLUjhXcG4vRzdOcnR6N2JW?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c7ee46-ed11-43a7-9b03-08ddc5d73971
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:43:53.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xh0PsWr2BN8fgBmr7Sf4KsolOKZDq3QPCHTexJ7a9E+220QL935PRZN++MoSyMEwIpJOvdl/OopJ8s0xszGdOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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

On 7/16/2025 9:42 PM, Santhosh Reddy Guddati wrote:
> Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifiers.
> select the 2 unique modifiers from this list to test invalid async test,
> removing the hard coded dependency across platforms.
>
> v2: Use first and last modifier from the async supported format list for
> invalid subtest.
>
> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index ddac904ce..1d4684c51 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
>   	struct igt_fb fb[2];
>   	drmModeModeInfo *mode;
>   	int flags;
> +	uint64_t mod1, mod2;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -607,10 +608,16 @@ static void test_invalid(data_t *data)
>   
>   	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
>   
> +	mod1 = data->plane->async_modifiers[0];
> +	mod2 = data->plane->async_modifiers[(data->plane->async_format_mod_count) - 1];

Please add a comment mentioning why we're using the first and last 
modifier here.

With this added,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +
> +	igt_info("using modifier1 %s and modifier2 %s\n",
> +		 igt_fb_modifier_name(mod1), igt_fb_modifier_name(mod2));
> +
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &fb[0]);
> +		      mod1, &fb[0]);
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
> +		      mod2, &fb[1]);
>   
>   	igt_plane_set_fb(data->plane, &fb[0]);
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -1113,11 +1120,6 @@ igt_main
>   		test_init_ops(&data);
>   		/* TODO: support more vendors */
>   		igt_require(is_intel_device(data.drm_fd));
> -		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> -						       I915_FORMAT_MOD_X_TILED));
> -		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> -						       I915_FORMAT_MOD_Y_TILED));
> -
>   		run_test(&data, test_invalid);
>   	}
>   
