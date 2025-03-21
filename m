Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E42C36004
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 06:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FCE10E04A;
	Fri, 21 Mar 2025 06:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwABAxIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE5710E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742538052; x=1774074052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0CWGzdEnjrWTYEQYCDo5Go4ZPMZod8SEmMYSFW9w1JA=;
 b=bwABAxIZS3ryHbJwtYw3d06TS6cZojoiwGpp1XCQxs7QAAQNyowhzQaS
 /zXsrt1IYXx3l0+DhLZRUDH3UJHN6ZZKSPbA4lVxYUVUSqTq8CoTNxZv2
 6evVfDW9hn1u++kn+m2QqtosbFdQ7+HwSRjyt97A6tpdXCC8kaV9FdSx2
 JmaApAEn11rnxiTBD8aGxW+GiZhsHXBznjB8qczpr51yXvcjlxMASVBZk
 39KHgDhNa1otUDbZaBnyWwD6t4eL5C+UzuWRBHIDBZc4dflD+FHmRngSU
 FZk9gxP+rU6aQAy3EILQR5eH9Z0Rz+k0s7mUGaL80IVBmHL04u+z+yZDT A==;
X-CSE-ConnectionGUID: W8JVgZ8YRqCpLYkKB7NQ3g==
X-CSE-MsgGUID: 7LSN1b3gS8mSYe4rynvbSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54013921"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="54013921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 23:20:50 -0700
X-CSE-ConnectionGUID: HYeN5JDNROSmNQeOoKqL6A==
X-CSE-MsgGUID: f4IvgoOoSqGeShpe2A1R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="123333592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 23:20:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 23:20:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 23:20:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 23:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfbRYUiWQIOyXIK3zsYDg/uJj5osgf8AyFbK/MZ1gZ4QFtVhmRvMG8IYlIa/APVnxmIkfAcunX2ydRhL6qJqbuZtCQRLHi41nW8H2H6DMgGHaBNwZYudvO9CI2BK0ekgMb7mKDBzvJitJ0mK+MhU5bI5adHykka1/VZYEJP98CWqZID4eg3siTzL8X5loGJgSkwlFPilmnxm2eN2R8vA1jazGJuf43bFYEWnQx2VzouJ5Wkc6DlY4QEJWKy1cn+u1fRJuYoMGuJdjX3lIGVzGN63ujvWrjlGPfOOBmLtXy0i7BDy8MlE7RFTzfdSLtjOyknuzuw+9ytZeLuBD2Bvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWqpyEjAZ7DZuGrCBB3GK/BE7PqCM7k8DXXiX37hIQc=;
 b=CUSE2bgm5APuPjpTpHw1rephfZzCM8opLIcwL/NhEo9tF8Xc+kcgpOq6Tse+7PVGQ/uQJAs6FFtJY/AsLJz9WSAbcg/lSRv66jyPK1wKKE9G0lz7lD9o3yTV3k/EZGJUEjA56K5OVGX1lBul5LEb7Lsurmhwsh6OXCaejBVGc5PZ8QEEj+tfi4THRhYaNWN6yrtbKOqhGIoqQIQtk5HmyUNw9yddxi/Gnp0nHjbUewJDZ9PV9CIvjpXFwIf9w3M3WrDxQyGsMjPtcErsmlgwObcLwHd6saOJ30Qj5dGcEBsjiSf28jjKgpRX7o/FBSWhwcjaNIxyr2BpETsN7cdGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 06:20:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 06:20:31 +0000
Message-ID: <f159b95b-bfa2-4919-8f89-15f542841db2@intel.com>
Date: Fri, 21 Mar 2025 11:50:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH <i-g-t> v4 3/4] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
 <20250313062154.1601701-4-soham.purkait@intel.com>
 <4f538b63-5919-4f76-afbb-523df00b3bfa@intel.com>
 <1b8ae83f-f818-4dae-98c8-fc9a8730028f@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <1b8ae83f-f818-4dae-98c8-fc9a8730028f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a04212-b1c9-4b13-86f3-08dd68407b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9CUHhWeVV2K1JSdUpQbmFXeFQybjN1SGVrRnpkd2ROREF1N0FOY0lWMGxn?=
 =?utf-8?B?TE5KV1NQOFVGQThzaFFKdjl3VFpjdXBEOFFna0RESXUxOGtJK0xmMHNSSUI2?=
 =?utf-8?B?blBmK2pCWUdvT2hVVENyVEFSeHJhSUpsQ2lDNXJ1ZTluZ2NadTg0cTd3eThV?=
 =?utf-8?B?TENhYUl1OHdZRTZHRXFxMGdTVCsvVTJFRGRLWmNWL1RVVHAzUmZ3MURGQm9w?=
 =?utf-8?B?Z0d5Z0R5dG8xWlpObmhGUjBVL0hjK3NhRDZrK0xhNThPTmdOYStMd1RKVGNF?=
 =?utf-8?B?UzJKRkZ5T01kQlRXUHFNZkFodVB1SlZtM3B2ZWJaZ3ZiVHpzcDdoWnd3RzV6?=
 =?utf-8?B?VGp3WFhGTmpLZnZkUjlnOWpqNmJ3b2p0NnlMZFRDbGtmMk1jeDNJN1ZkdWFa?=
 =?utf-8?B?aTRuZHFWK0xaK1gzM1EyQ1FlVFpqRVhodUhYbkEzNlU4T0I0MXYxTHRZTWtE?=
 =?utf-8?B?S2J4cEVJQWc5dGtWQ2tUeVN5QlRnbjhHbmdDNFlmaW5uTFVGZWwrRVY4WVpH?=
 =?utf-8?B?RW1VWFBEUW9HL2dpTmU0RlJIMVNZWjZ0aGtIejNJbGQvY0toMFhCeXZCaHBx?=
 =?utf-8?B?a2djdVZNV0svOW10dEt6WmZUZ0lGbklwYytqMjc2V1NDQUNudk51S0g0RUlC?=
 =?utf-8?B?RGNTOS9FVS8vVFNaZ3dMRmxoV0RXT3FieUtlTHNZTytZc1BOQkJEMnNIYk1B?=
 =?utf-8?B?ajVZOHBqeWFLcTlacC9RU1VVRlNDb3BjY3ovRkFhblFVM1llTVB1VkJDYVl5?=
 =?utf-8?B?R0NXM0pURGhrMzlDaDFBdXQzM1BTbjRPQmtaS0ZxMmZJWmtIZkVPTUFnMXB6?=
 =?utf-8?B?YkZiN1lIY0VmUnZKNGw5RzVybzVkOHV1OXlkNUh2QS9oU29wOHh2RE1IOUov?=
 =?utf-8?B?b3dCVnFZOGwwR2RMYkVqcGlJcjJvQUMreHU0QXpKREhuTGZXNWpLTlRlVXdk?=
 =?utf-8?B?MWdDNmRuNENqMEJJZ0VGV0ZJTjhpYWNlWWZhYWdtc3cveEZPWWdZMUhIQndH?=
 =?utf-8?B?VTJpVHVNZGFlVEVnOTVUZzA1VTFwY1JBdEVBR1EyT2taUGxadDJFVkFlNTRQ?=
 =?utf-8?B?dSt5eDNjQTN1T2NLdmhPcXhjR0tSaWR1Q0NHaTdpdWRSZWZPdU5oaGtRalJD?=
 =?utf-8?B?aFpHQ1F3UEpjelpyanRodXBydlBXL285VW44WThIUEJFdE5qWjErdHQ5cEt3?=
 =?utf-8?B?WGRUN29yeUdHdmhJcmtXOGxpTGRFQ3ppNEd1bm02SjkxREhMTVRjWkUrbXpp?=
 =?utf-8?B?c0ZHZVo2bjd4ejZ6ZEkyTEV2OHUyWStmY29ucHdZSHR6dTFMZ0hZYWNkL2pw?=
 =?utf-8?B?YTRZVmVwWm1iVGFmSXZaZFdSQjFIRE42UmZYLzhuT3NhNnBmd1Z3YUViUERI?=
 =?utf-8?B?ZTlINDBBRmNQaVpydjZqeFR6R0c3am1mRFFOMEF3dS9iWnJ6OHdFblJEZ1li?=
 =?utf-8?B?MVFCTERDeU1JSytFNmZmRkIzb0ErcU5DUDg2L1FuU1NlZ0hPRGVWTmhpdmE2?=
 =?utf-8?B?Q3lKelM0aitsWWFid1hrclFVQlBUa05GNTBENTFTSVBRV2UvSjdLVGhHcTU5?=
 =?utf-8?B?THlpYjBaV2NVMUNqM0VvZ21VU2NTR3pZcksreklpSHN6RW5sZTdFTGtuWUlv?=
 =?utf-8?B?R2xoNTVScS9Zd1VOVkJhWlFiTG1PNytGamoxK1YwWWgxcExMN1hXRUxqa3Va?=
 =?utf-8?B?TkpQbVJHdjJDUTViYnNaNHlZOUQyd1Q5SGhJdENRVWx6ZitnaDJhZGdxd3Zs?=
 =?utf-8?B?Ny9aeklucHE1eTY1bWpFZjlvcnQrQmNhS0l6V3RNSE1yRTRrbHh1bkFUeTFC?=
 =?utf-8?B?dnpFa2dFdndYVEsvUGdFcCtJUmhwdFFnM25xbFplcVBaZGl2WEFaSTRld2NN?=
 =?utf-8?Q?jqsSJYjvvsVHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0J0djk4MEVldUQ3c0xiWGdUMy8vRWNkU2I3MVNEZjdDOTdoY0VsM1JaMlFv?=
 =?utf-8?B?NkhWUGQzNUVyRDRaaElPOWhjR0MzTlBDZk5oZjJlOUh3VHE0VzVCR1hBVnE3?=
 =?utf-8?B?U0pNcDY5d3A5Sm9zVGk4YjV6elBkbit3YjRRU1lTYnJKVnlLTEVTWlNwdE5m?=
 =?utf-8?B?b0tiUGVXQkphekVDOGFmTEo5a1laZlZZZWFWQ2szZEpxV0QvU2R4eTM5S3Yz?=
 =?utf-8?B?b2tadTBZeVlZWEI0TjJGTGljaGVEV1RvRWpFaGl4amM0Nks4QTZZWEpKUzlo?=
 =?utf-8?B?VVhMbUFQNGtrT2R6Mzh1R3JjbkIvR1FSbmlpZ3N5L01hYzFMc2lOYkpPTVNK?=
 =?utf-8?B?T0t4Q014SS9VSVk1eWgra0RDdkVqSUkzWDd0cEczTE16N1ppWmNSMnhMRy8y?=
 =?utf-8?B?UU1mQTd1cmpUY2pGRHFMTGFGWkVkQjRScWdmbThPWkc0S3VISk1YaDZoVmRp?=
 =?utf-8?B?MDdjN0o5N1NmaDZlUUNBWEhaamYxUmhaMHkrbkZhaXN3MDJaYXd5cU5kVjhP?=
 =?utf-8?B?bDNaUXBiWWxYN0YzUHJJTjFBcTRLL2gzbk5BNGwvRGJETDhURXhkTi9McGRq?=
 =?utf-8?B?cmlUL0tidktwb1MrNnpFbE9ha0xKRWJTTHllT0tPamtXNzZOOGlZV3lyZXFU?=
 =?utf-8?B?czhiN3A3ekJCOWtvcmF4VTdOQTFtOG1vMDJ5LzJuYTNQLy81R1k1Y0o1LzN5?=
 =?utf-8?B?RTVRVFFUSVdtWUN0TUJLbWpzcHpDeWtHQjZPOXBKeEF2RTU1d3RPMGd2eTZN?=
 =?utf-8?B?THJWV29JMVhMVFB2U1ZLdVhra1RGbUwycVhSUGFiVDVJZ08rU1RLaDNabU01?=
 =?utf-8?B?N01JNEk3UDFmTncyRTlHOFpaMjJaSUkwSVd6aENod2xsN3hTbkJTbVh5UDJV?=
 =?utf-8?B?YjVEQUNVcXJaWE5YcnJKL2VoQ3ZVK2dNcUsyRWN5ZFVXNjJ2cWZ6SWZNVWlR?=
 =?utf-8?B?NEFPdmEvVVptVnZuZDAxTDBFQ1VpYUFpbGYxYkR4QmpJKy9PdmNoM3ZPNG1V?=
 =?utf-8?B?TFRkcEVDc0w2MkVWNHpLMzMwOVN3NFFTQWlmeWFhZ2ZDU1U2NkpSajUzRHlz?=
 =?utf-8?B?K0xqclRGS0xhdUl2WkgwL2JmQ0p3NnUxY29XNWt5eURNd2twVHhQLzE5ZXB5?=
 =?utf-8?B?U0U0QUZpbnlaY3doYUp1UjgzZ2FHa2wvUHlySGVmN1BVU1ZkdW4yTDkwbXl0?=
 =?utf-8?B?eUtaMHBER2VuSEkwdk84cGxrbXB0amRLK3c4dTNEdkhQenJ3NnlkL3Z4dXd6?=
 =?utf-8?B?b2hyY1pHZzBNRHAvTFlLZFQvQm1GaFBHRjlla2lDYU1DL1pndFVPNllZeFpw?=
 =?utf-8?B?QlVVZk0yd0l6WTRsVDByR3o0VVhZZWY2SG9GUnN1ZHBITmNWdG0rVkNhWkVi?=
 =?utf-8?B?Rk5zK1BkSzJZMngxbDUzUmJibXdKWm9yQnYzVnlPSWR5WDZybWszWWNjVzV0?=
 =?utf-8?B?djk0eU45VUNleU9mYk5SdncwZ3RIZS9NdUNWa2Y4OS9mZmZBR2V5OVp3OWZD?=
 =?utf-8?B?Nk8vNld2WEZOMVNDemJjR0YxM1hHY24vc3BOai9Wc0hjNnJvWlU3VEg0c28y?=
 =?utf-8?B?dXovT3VWYnZWYVB0bEJhMXA4dE1YbkpFRkpjWU5yQzZ1OHA5Q0h5M3FSWjJD?=
 =?utf-8?B?YjBVeHdPYlluWEZuVG5QTUZCaFhIVFlvdU84eFZCcC9rTTlCT2NUblVCSWl1?=
 =?utf-8?B?OWVYamFsYi9aR1cxZFFkdEZ6dHc4cjRIMHJWNWc4S29OMFhTVXprallOYWo2?=
 =?utf-8?B?ZWErdkphT1dFSXpZcmw0YWFzdVdXcDVMVWZuZ2EyS3VlZEhGU2pHKytLTXFm?=
 =?utf-8?B?TFZjSS9FK3g5Q3g0WG0xOGhEZTllSFhXaUxrZUJpQlgweHZvcnRkVHBJZXFV?=
 =?utf-8?B?TlpvbXJJcnJ0czhrdFVHVU9vQWI5UnhWUXc1UEExQ1F4VGF4SlRzVVlYeWxG?=
 =?utf-8?B?bGhOUzVaN0xyK041d0lhYXpIWlBFdW1JTmlIZXdjSm5oYUx0anFHb2RGZlMx?=
 =?utf-8?B?am5aWkRxcmNoZzRHYzFDMWV1MHRScG9IeGhLdE0xUUY2QVZKNFpJM2lsb0ZD?=
 =?utf-8?B?Y2M1R0IxVEthTU9RK1dqT1I1ZTMvdllvQWZqYk9keEN5MGJ5K2htS3BmYUUr?=
 =?utf-8?Q?HPvJeWhyWOR3re9zAwTkT6SQN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a04212-b1c9-4b13-86f3-08dd68407b69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 06:20:31.6720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGSMrD4PHkgY+cXvvkkpabS4cMlwWhggn8L7YofJ8/E7MHvHOeYLc3BseREhnx6EWxvdmmBmKgextmAwGsWXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

Hi Soham

On 3/21/2025 8:56 AM, Purkait, Soham wrote:
> Hi Riana,
> 
> On 14-03-2025 10:27, Riana Tauro wrote:
>> Hi Soham
>>
>> Replace busy-ticks with engine-active-ticks and total-ticks with 
>> engine-total-ticks to keep it consistent.
>>
>> Replace all occurences of busy with active in the series.
>>
>> On 3/13/2025 11:51 AM, Soham Purkait wrote:
>>>      Add gputop support for xe-specific devices. Separate
>>> driver-specific code into respective source files.
>>>
>>> v2 : fix for refactoring GPUTOP into a
>>>       vendor-agnostic tool (Lucas)
>>>
>>> v3 : Separate commit (Kamil)
>>>
>>> v4 : Headers in alphabetical order
>>>       Engines memory allocation at
>>>       the beginning all at once
>>>       Removed PMU normalization (Riana)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> ---
>>>   tools/gputop/xe_gputop.c | 372 +++++++++++++++++++++++++++++++++++++++
>>>   tools/gputop/xe_gputop.h |  73 ++++++++
>>>   2 files changed, 445 insertions(+)
>>>   create mode 100644 tools/gputop/xe_gputop.c
>>>   create mode 100644 tools/gputop/xe_gputop.h
>>>
>>> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>>> new file mode 100644
>>> index 000000000..4137bb771
>>> --- /dev/null
>>> +++ b/tools/gputop/xe_gputop.c
>>> @@ -0,0 +1,372 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_gputop.h"
>>> +
>>> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
>>> +
>>> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t 
>>> val)
>>> +{
>>> +    counter->val.prev = counter->val.cur;
>>> +    counter->val.cur = val;
>>> +}
>>> +
>>> +static void update_sample(struct xe_pmu_counter *counter, uint64_t 
>>> *val)
>>> +{
>>> +    if (counter->present)
>> presence of fd should be enough. present is not required.
>> The __update contents can be moved to same function
> In order to maintain the sanctity, I believe this approach is more 
> aligned with the IGT implementation.
Don't think igt is doing this. do you mean xe pmu igt? >>> +        
__update_sample(counter, val[counter->idx]);
>>> +}
>>> +
>>> +static const char *class_display_name(unsigned int class)
>>> +{
>>> +    switch (class) {
>>> +    case DRM_XE_ENGINE_CLASS_RENDER:
>>> +        return "Render/3D";
>>> +    case DRM_XE_ENGINE_CLASS_COPY:
>>> +        return "Blitter";
>>> +    case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>>> +        return "Video";
>>> +    case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>>> +        return "VideoEnhance";
>>> +    case DRM_XE_ENGINE_CLASS_COMPUTE:
>>> +        return "Compute";
>>> +    default:
>>> +        return "[unknown]";
>>> +    }
>>> +}
>>> +
>>> +static inline void *clean_up(void *engines)
>>> +{
>>> +    if (engines)
>>> +        free(engines);
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +static char *pmu_name(struct igt_device_card *card)
>>> +{
>>> +    int card_fd;
>>> +    char device[30];
>>> +    char *path;
>>> +
>>> +    if (strlen(card->card))
>>> +        card_fd = igt_open_card(card);
>>> +    else if (strlen(card->render))
>>> +        card_fd = igt_open_render(card);
>>> +
>>> +    if (card_fd == -1)
>>> +        return NULL;
>>> +
>>> +    xe_perf_device(card_fd, device, sizeof(device));
>>> +    path = strdup(device);
>> needs a free while cleanup
>>> +    close(card_fd);
>>> +    return path;
>>> +}
>>> +
>>> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct 
>>> xe_pmu_counter *pmu, int *fd)
>>> +{
>>> +    int fd__ = igt_perf_open_group(type, pmu->config, *fd);
>>> +
>>> +    if (fd__ >= 0) {
>>> +        if (*fd == -1)
>>> +            *fd = fd__;
>>> +        pmu->present = true;
>>> +        pmu->idx = (*cnt)++;
>>> +    }
>>> +
>>> +    return fd__;
>>> +}
>>> +
>>> +void xe_gputop_init(struct xe_gputop *obj,
>>> +            struct igt_device_card *card)
>>> +{
>>> +    obj->pmu_device = pmu_name(card);
>>> +    if (!obj->pmu_device) {
>>> +        fprintf(stderr, "%s : pmu_device path returned NULL", card- 
>>> >pci_slot_name);
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>> +    obj->card = card;
>>> +}
>>> +
>>> +static int pmu_format_shift(int xe, const char *name)
>>> +{
>>> +    uint32_t start;
>>> +    int format;
>>> +    char device[80];
>>> +
>>> +    format = perf_event_format(xe_perf_device(xe, device, 
>>> sizeof(device)),
>>> +                   name, &start);
>>> +    if (format)
>>> +        return 0;
>>> +
>>> +    return start;
>>> +}
>>> +
>>> +static int engine_cmp(const void *__a, const void *__b)
>>> +{
>>> +    const struct xe_engine *a = (struct xe_engine *)__a;
>>> +    const struct xe_engine *b = (struct xe_engine *)__b;
>>> +
>>> +    if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
>>> +        return a->drm_xe_engine.engine_class - b- 
>>> >drm_xe_engine.engine_class;
>>> +    else
>>> +        return a->drm_xe_engine.engine_instance - b- 
>>> >drm_xe_engine.engine_instance;
>>> +}
>>> +
>>> +void *xe_discover_engines(const void *obj)
>>> +{
>>> +    struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
>>> +    struct xe_engines *engines;
>>> +    int ret = 0;
>>> +    char device[30];
>>> +    struct drm_xe_engine_class_instance *hwe;
>>> +    int card_fd;
>>> +
>>> +    if (!card || !strlen(card->card) || !strlen(card->render))
>>> +        return NULL;
>>> +
>>> +    if (strlen(card->card)) {
>>> +        card_fd = igt_open_card(card);
>>> +    } else if (strlen(card->render)) {
>>> +        card_fd = igt_open_render(card);
>>> +    } else {
>>> +        fprintf(stderr, "Failed to detect device!\n");
>>> +        return clean_up(engines);
>>> +    }
>>> +    xe_device_get(card_fd);
>>> +    engines = malloc(sizeof(struct xe_engines) +
>>> +             xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> why additional? 
> While allocating xe_engines, xe_engine space also needs to get allocated.
my bad. got confused because of naming>>
>>> +    if (!engines)
>>> +        return NULL;
>>> +
>>> +    memset(engines, 0, sizeof(struct xe_engines) +
>>> +           xe_number_engines(card_fd) * sizeof(struct xe_engine));
>>> +
>>> +    engines->num_engines = 0;
>>> +    engines->device = ((struct xe_gputop *)obj)->pmu_device;
>>> +    xe_for_each_engine(card_fd, hwe) {
>>> +        uint64_t engine_class, engine_instance, gt_shift, param_config;
>>> +        struct xe_engine *engine;
>>> +
>>> +        engine = engine_ptr(engines, engines->num_engines);
>>> +        gt_shift = pmu_format_shift(card_fd, "gt");
>>> +        engine_class = pmu_format_shift(card_fd, "engine_class");
>>> +        engine_instance = pmu_format_shift(card_fd, "engine_instance");
>>> +        param_config = (uint64_t)hwe->gt_id << gt_shift | hwe- 
>>> >engine_class << engine_class
>>> +            | hwe->engine_instance << engine_instance;
>> This function does pmu specific initialization too. discover_engines 
>> is not the right name.
>> you could move pmu specific initialization to pmu_init or rename this 
>> function
> Here engine specific discoveries is being performed so the name,
This is mostly populating the engine pmu configs. querying engines is 
done in xe_query.c while
> strictly maintaining PMU specific initialization is not possible
 From your implementation i see pmu init is done just after this,
Why can't it be a single function?> due to the underline implementation 
But It could encourage other driver
> to maintain the same structure, while keeping
> it vendor agnostic.>>> +
>>> +        engine->drm_xe_engine = *hwe;
>>> +
>>> +        ret = perf_event_config(xe_perf_device(card_fd, device, 
>>> sizeof(device)),
>>> +                    "engine-active-ticks", &engine->busy_ticks.config);
>>> +        if (ret < 0)
>>> +            break;
>>> +
>>> +        engine->busy_ticks.config |= param_config;
>>> +
>>> +        ret = perf_event_config(xe_perf_device(card_fd, device, 
>>> sizeof(device)),
>>> +                    "engine-total-ticks", &engine->total_ticks.config);
>>> +        if (ret < 0)
>>> +            break;
>>> +
>>> +        engine->total_ticks.config |= param_config;
>>> +
>>> +        if (engine->busy_ticks.config == -1 || engine- 
>>> >total_ticks.config == -1) {
>>> +            ret = ENOENT;
>>> +            break;
>>> +        }
>>> +
>>> +        ret = asprintf(&engine->display_name, "%s/%u",
>>> + class_display_name(engine->drm_xe_engine.engine_class),
>>> +                   engine->drm_xe_engine.engine_instance);
>>> +
>>> +        if (ret <= 0) {
>>> +            ret = errno;
>>> +            break;
>>> +        }
>>> +        ret = asprintf(&engine->short_name, "%s/%u",
>>> + xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
>>> +                   engine->drm_xe_engine.engine_instance);
>>> +
>>> +        if (ret <= 0) {
>>> +            ret = errno;
>>> +            break;
>>> +        }
>>> +
>>> +        engines->num_engines++;
>>> +    }
>>> +
>>> +    if (!ret) {
>>> +        errno = ret;
>>> +        return clean_up(engines);
>>> +    }
>>> +
>>> +    qsort(engine_ptr(engines, 0), engines->num_engines,
>>> +          sizeof(struct xe_engine), engine_cmp);
>>> +
>>> +    ((struct xe_gputop *)obj)->eng_obj = engines;
>>> +
>>> +    return engines;
>>> +}
>>> +
>>> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>>> +{
>>> +    uint64_t buf[2 + num];
>>> +    unsigned int i;
>>> +    ssize_t len;
>>> +
>>> +    memset(buf, 0, sizeof(buf));
>>> +
>>> +    len = read(fd, buf, sizeof(buf));
>>> +    assert(len == sizeof(buf));
>>> +
>>> +    for (i = 0; i < num; i++)
>>> +        val[i] = buf[2 + i];
>>> +
>>> +    return buf[1];
>>> +}
>>> +
>>> +void xe_pmu_sample(const void *obj)
>>> +{
>>> +    struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
>>> +    const int num_val = engines->num_counters;
>> this can be num_engines * 2.
>> can remove this
>>> +    uint64_t val[2 + num_val];
>>> +    unsigned int i;
>>> +
>>> +    engines->ts.prev = engines->ts.cur;
>>> +    engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
>> This is unnecessary
>>> +
>>> +    for (i = 0; i < engines->num_engines; i++) {
>>> +        struct xe_engine *engine = engine_ptr(engines, i);
>>> +
>>> +        update_sample(&engine->busy_ticks, val);
>>> +        update_sample(&engine->total_ticks, val);
>>> +    }
>>> +}
>>> +
>>> +int xe_pmu_init(const void *obj)
>>> +{
>>> +    struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
>>> +    unsigned int i;
>>> +    int fd;
>>> +    struct xe_engine *engine;
>>> +    uint64_t type = igt_perf_type_id(engines->device);
>>> +
>>> +    engines->fd = -1;
>>> +    engines->num_counters = 0;
>> you can use a local variable here
> It is being used in xe_pmu_sample as well.>
see my comment in xe_pmu_sample
Thanks
Riana>
> Thanks,
> Soham
> 
>>> +
>> why is 0 outside, Can't it be moved in the for loop
>>> +    engine = engine_ptr(engines, 0);
>>> +    fd = _open_pmu(type, &engines->num_counters, &engine- 
>>> >busy_ticks, &engines->fd);
>>> +    if (fd < 0)
>>> +        return -1;
>>> +    fd = _open_pmu(type, &engines->num_counters, &engine- 
>>> >total_ticks, &engines->fd);
>>> +    if (fd < 0)
>>> +        return -1;
>>> +
>>> +    for (i = 1; i < engines->num_engines; i++) {
>>> +        engine = engine_ptr(engines, i);
>>> +        fd = _open_pmu(type, &engines->num_counters, &engine- 
>>> >busy_ticks, &engines->fd);
>>> +        if (fd < 0)
>>> +            return -1;
>>> +        fd = _open_pmu(type, &engines->num_counters, &engine- 
>>> >total_ticks, &engines->fd);
>>> +        if (fd < 0)
>>> +            return -1;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static double pmu_calc_total(struct xe_pmu_pair *p)
>> %s/pmu_calc_total/pmu_total_ticks
>> or calc_total_ticks
>>> +{
>>> +    double v;
>>> +
>>> +    v = p->cur - p->prev;
>>> +    return v;
>>> +}
>>> +
>>> +static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
>> %s/total tick/total ticks
>>> +{
>>> +    double bz = p->cur - p->prev;
>> use friendly names
>> active ticks
>>
>> I think you can move total ticks also here. pass two pairs and 
>> calculate in same function
>>> +    double total;
>>> +
>>> +    total = (bz * 100) / total_tick;
>>> +    return total;
>>> +}
>>> +
>>> +static int
>>> +print_device_description(const void *obj, int lines, int w, int h)
>>> +{
>>> +    char *desc;
>>> +    int len;
>>> +
>>> +    len = asprintf(&desc, "DRIVER: %s || BDF: %s",
>>> +               ((struct xe_gputop *)obj)->card->driver,
>>> +               ((struct xe_gputop *)obj)->card->pci_slot_name);
>>> +
>>> +    printf("\033[7m%s%*s\033[0m\n",
>>> +           desc,
>>> +           (int)(w - len), " ");
>>> +    lines++;
>>> +    free(desc);
>>> +    return lines;
>>> +}
>>> +
>>> +static int
>>> +print_engines_header(struct xe_engines *engines,
>>> +             int lines, int con_w, int con_h)
>>> +{
>>> +    const char *a;
>>> +
>>> +    for (unsigned int i = 0;
>>> +         i < engines->num_engines && lines < con_h;
>>> +         i++) {
>>> +        struct xe_engine *engine = engine_ptr(engines, i);
>>> +
>>> +        if (!engine->num_counters)
>>> +            continue;
>>> +
>>> +        a = "            ENGINES   BUSY  ";
>>> +
>>> +        printf("\033[7m%s%*s\033[0m\n",
>>> +               a,
>>> +               (int)(con_w - strlen(a)), " ");
>>> +        lines++;
>>> +
>>> +        break;
>>> +    }
>>> +
>>> +    return lines;
>>> +}
>>> +
>>> +static int
>>> +print_engine(struct xe_engines *engines, unsigned int i,
>>> +         int lines, int con_w, int con_h)
>>> +{
>>> +    struct xe_engine *engine = engine_ptr(engines, i);
>>> +    double total_tick = pmu_calc_total(&engine->total_ticks.val);
>>> +    double percentage = pmu_calc(&engine->busy_ticks.val, total_tick);
>>> +
>>> +    printf("%*s", (int)(strlen("            ENGINES")), engine- 
>>> >display_name);
>>> +    print_percentage_bar(percentage, con_w - strlen(" ENGINES"));
>>> +    printf("\n");
>>> +
>>> +    return ++lines;
>>> +}
>>> +
>>> +int xe_print_engines(const void *obj, int lines, int w, int h)
>>> +{
>>> +    struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
>>> +
>>> +    lines = print_device_description(obj, lines, w, h);
>>> +
>>> +    lines = print_engines_header(show, lines, w,  h);
>>> +
>>> +    for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
>>> +        lines = print_engine(show, i, lines, w, h);
>>> +
>>> +    lines = print_engines_footer(lines, w, h);
>>> +
>>> +    return lines;
>>> +}
>>> +
>>> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
>>> new file mode 100644
>>> index 000000000..1f23b2ed0
>>> --- /dev/null
>>> +++ b/tools/gputop/xe_gputop.h
>>> @@ -0,0 +1,73 @@
>>> +/* SPDX-License-Identifier: MIT
>>> + *
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __XE_GPUTOP_H__
>>> +#define __XE_GPUTOP_H__
>>> +
>>> +#include <dirent.h>
>>> +
>>> +#include "igt_device_scan.h"
>>> +#include "igt_perf.h"
>>> +#include "utils.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +struct xe_pmu_pair {
>>> +    uint64_t cur;
>>> +    uint64_t prev;
>>> +};
>>> +
>>> +struct xe_pmu_counter {
>>> +    uint64_t type;
>>> +    uint64_t config;
>>> +    unsigned int idx;
>>> +    struct xe_pmu_pair val;
>>> +    bool present;
>>> +};
>>> +
>>> +struct xe_engine {
>>> +    const char *name;
>>> +    char *display_name;
>>> +    char *short_name;
>>> +    struct drm_xe_engine_class_instance drm_xe_engine;
>>> +    unsigned int num_counters;
>> didn't find initialization. needed?
>>> +    struct xe_pmu_counter busy_ticks;
>>> +    struct xe_pmu_counter total_ticks;
>>> +};
>>> +
>>> +struct xe_engines {
>>> +    unsigned int num_engines;
>>> +    unsigned int num_classes;
>> not used
>>> +    unsigned int num_counters;
>>> +    DIR *root;
>>> +    int fd;
>>> +    struct xe_pmu_pair ts;
>> can be removed
>>> +    bool discrete;
>> not used
>>> +    char *device;
>>> +    int num_gts;
>> not used
>>> +
>>> +    /* Do not edit below this line.
>>> +     * This structure is reallocated every time a new engine is
>>> +     * found and size is increased by sizeof (engine).
>>> +     */
>> This comment can be removed
>>
>> Thanks
>> Riana
>>> +    struct xe_engine engine;
>>> +
>>> +};
>>> +
>>> +struct xe_gputop {
>>> +    char *pmu_device;
>>> +    struct igt_device_card *card;
>>> +    struct xe_engines *eng_obj;
>>> +};
>>> +
>>> +void xe_gputop_init(struct xe_gputop *obj,
>>> +            struct igt_device_card *card);
>>> +
>>> +void xe_populate_device_instances(struct gputop_device *dv);
>>> +void *xe_discover_engines(const void *obj);
>>> +void xe_pmu_sample(const void *obj);
>>> +int xe_pmu_init(const void *obj);
>>> +int xe_print_engines(const void *obj, int lines, int w, int h);
>>> +
>>> +#endif /* __XE_GPUTOP_H__ */
>>
