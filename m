Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC20CA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 22:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BBE10EC3A;
	Fri, 29 Aug 2025 22:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+DOw15+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A585610EC3A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 22:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756506898; x=1788042898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VvWfwhx/gQ/dPdljsN7JjzSN/GdvWJDJNK6/b0fLJTA=;
 b=Z+DOw15+qdm59PJE30RlD0Timpe8QQbKTdn2QGzWB+54A38wI6ESyEUG
 jUOVO2uGJCrT8u4x1pUXvDvChv9FeV5lnDPSJliogBo+ssJhXgPK8mq9J
 A0za0nLjoYs3w79oHmIHpGhE7rd2POeWieYUtx86BsQW61wbSi61s+O4l
 ABDgxsXpsV2fO4MSQ6LHzeIVi3OOdvpSBmTExOwNtJrz3xM3zK8APNlVP
 M7HinXvWPs8HecsRlhf1oIf4bXA5FdQII/sgLIGkRHlfBCsGFjlb2oMOo
 jACdMzhQz/AElaTJLLM4EfUrMMFeBGKEgTAUKhEioIJwU/qXRVDnb9Eo6 Q==;
X-CSE-ConnectionGUID: gz9K1CUaS2yXHEFuoT7h0w==
X-CSE-MsgGUID: 2yZnVj+dQwqz//7W5vsg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58867703"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58867703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:34:58 -0700
X-CSE-ConnectionGUID: s5ttqjYQS2ysKcOsRqyAtw==
X-CSE-MsgGUID: dHAGatK3QYi/liYZQ/HUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170010485"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:34:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:34:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 15:34:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.77)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:34:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf4Rr7LxzrH2B4IfokI9MKNJSnfPs2LlSvfAiaX+Jp58oDrkYeZyU4muSMXeJZ7IjKJYy8uH26S6dpXqkxdWn4Sdtezp85ZhyGKIF9J1lHFgCgJz0Tmwll+tJwHNXTvjqihInfWOYGRDwiINMaBMb0owG9yjPkQepYfm2qFlBHBwKU5JkK190R/rBRJACB1vBSUAmU7dGfNPaQHfVlAh6xyNSCFWpcHnhgC5JBTptnz0q4KlEPEHY6mxabNbGswIugzAjTarj3PSNkhHq6Js+awyJd0jfwGjJd6k3XG+z9qA7bTGpKTRnOfN/3s/em7KHyKiOR3duJpfU5LiHWXRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvWfwhx/gQ/dPdljsN7JjzSN/GdvWJDJNK6/b0fLJTA=;
 b=kQPbVVRc6Q6ha6FrTuIeJKrB0kjWTLFqgJ0c7kuQWiyPjB/02pLPMpEU0+NtzUFQjVlB0Fs904nuskcwi05JbNL/ChHkPj7FKt/pWOvMcwIGQd9MOujOq6u42AWKLrRA0+qgJH6vtE2v/sYVWjHVfaK760M2xvlNXnYwtcoEEQs7m+e+g1YLpD6rZS13Lw7pj0tKiofw9S9GiDFi3m7On6HXvGRFbLj1Yq76smII3F1neKOC6/wjgNQzjXCJWtky+X3jzJSxEsH1G6zGvziZsYD6JHASLUi/EkXk6J9o70BXRQ4ac2ftxlKlyIorKFTJ8LT66xUlp+5sfgXYPn76FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 22:34:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 22:34:51 +0000
Date: Fri, 29 Aug 2025 15:34:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_oa: Add an option to capture
 register accesses in ftrace
Message-ID: <aLIrCXTvQBZcjQdP@unerlige-desk.amr.corp.intel.com>
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
 <20250826224256.510692-10-umesh.nerlige.ramappa@intel.com>
 <87ecsxmyj5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecsxmyj5.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f69c17-2b88-4bc0-137b-08dde74c4486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0Y3OGwwdFRQZmR3SUZNYWJCQkNkTzlTZEwvdElvM1hiendkOEFOb1lscTFs?=
 =?utf-8?B?ZkVVTjVTNEhSMGJRaEVHNmhVZFNIQjZWQ2pRRGp6SHp2OU40MElzR09pQjZX?=
 =?utf-8?B?bUVpNnN4WlBQMm5BdkFvTFZ5VVh6bGdYSGlpUzJ4QXR3a0E1bkdrblQ2YTdO?=
 =?utf-8?B?UlRqdW0wMi9vUzRnV3I1aHpHMkVINTFDUGlJOVQyYVFLaERXd0VaZ0tHYm1O?=
 =?utf-8?B?NkF4SVI3bUpHN2FSMlVzRThNNXhaa0xEVjlENmp3MVBVMURudC9mdHorYXl6?=
 =?utf-8?B?SFhCTlhsRUNDd3hXb1pzeWNuK3JlbXg2QkJIWThkV1dGOWJMMHp5Nk9HajNk?=
 =?utf-8?B?Q3ZkWnJXQnNMN1p5ZVkxcVdyQ0s5azdNM3FhMlFHdk9xeUhzVFBNWTllWWdO?=
 =?utf-8?B?bHA1bG1URjg3aUtWR25taFFrTkQxMXd2Kzd3Rmd1cWJXK3NaS1E0M2loOEoy?=
 =?utf-8?B?SXF1M2JiTkFiL04wOEJhYjRXd1lUY3VuN09lU2pvTDI5MmNBWUxWOXRJSHQ1?=
 =?utf-8?B?YXM5ZTJUamIzdGF2OG1VQnlKVm1sMU9ZdWtsTXB3N1I3Zi9QV203T1NlS1Rv?=
 =?utf-8?B?TWIwb3ZyNk1BbHJkeXJmL3ROYVp1UWFZcThNQkpvUnpiekgrd1BNdGFkWks4?=
 =?utf-8?B?S3BLWE9raGNhdTljQ2orRWZrYjRJTnluV0hjZUxXclVaRUFPeXR6MmN6anhD?=
 =?utf-8?B?TksxQWZNbjlkT1VJM2RiQlI2bEh5OFlFRnQvZVFLaWl3dDZkWDcwT3lyeDVT?=
 =?utf-8?B?clRDdGdZWDl0M3RNdndKZVQxNTNKMmhEMGdFRTRYZjVQY2t4NitFdjZTaFh6?=
 =?utf-8?B?RXNkT0p6bDJYN1dYVmJFaUs1TWdIUmh0bmlVYW93OXBiSFhVKzA5S0c0N0JK?=
 =?utf-8?B?VEZwUEttMEFhRHEzT2p0d0p0aklJWXMwY3VmUkREMlpXR0pmK3ZZU3NiVW45?=
 =?utf-8?B?a2FzYWpHL2g1cENnckFGY0hYaGtrWFRFcnVaOVR6c2p0aWxaSXNVZzVxWXE1?=
 =?utf-8?B?VFZUM0dKRDA0R3NXaTRCa1AxTExKUHIxaGxNQlpvUWx0OFdiWWFTdzJsMTRh?=
 =?utf-8?B?TjlDWVdCSTdMMEF0RmNZa0s0aHNqWDk0WTlPUEpUZU9XcDE0ZFlBeVpqTnlY?=
 =?utf-8?B?STByb1dNVHM0TXo2a3J2R0Rsbk5tWHYrcjV2eEdDRE1mVGRTVFNVQjFuUlZD?=
 =?utf-8?B?OWZCMVBaaThvT0c2eGVVYktyVThqUG1JZTEyc0dLRlZESWVMamVmZG9uVDZT?=
 =?utf-8?B?Uk1WT2pTVElYaUwza3d6bSs1aXM2ZGpabFFuaTNQVDZubjBoRkptNTZZRkxB?=
 =?utf-8?B?QU15clo2b0NwaVBSY1BRSHFxaUxHQXp2VnZrS1g4eDRxcjdJTndzRXVQakdv?=
 =?utf-8?B?NGJ2VytMWS94OUIwdGt3ejRNaDJYcGdLdUovYnY2ODg4KytCbmRsVDYxdjB6?=
 =?utf-8?B?eXBod2oxcXNRTVo5bXI0bWQ1VDdnemMwQURNaFNwYUJVek9vSTdXb3k1aTRn?=
 =?utf-8?B?L0hMWTRGQWVsOGhVZEdHSkFrTEJQeDJGQnBaYlIwUDNxcC82MXUrU2d6VXBW?=
 =?utf-8?B?S0NGWGxYZ3l5OG4xdXM2SkVtZ3BHZWl3TXUzZFVpYW1PeklOc3lmRUpwcmNY?=
 =?utf-8?B?Q0NCVGtrcS9ObGxHVnZNcjFFM1JkcmpFOEZHTHFwR01UbXBmeHV2dm5qRW9Y?=
 =?utf-8?B?TE5XeURmbFRVNjJaRFU1SXpFQ0x5eDUyZi9UenFDRks3a1hQdlk4UmpscWI3?=
 =?utf-8?B?SllPdFV1Qmc4cFFQWW9vWmMzQ0N5aU5XUDU4Qms5Vi94NEhKMzlLWXRPRE13?=
 =?utf-8?B?dTd5TFpCT1pEeHYrVUI4aGxqMnhacHR4a3FSeWMvUldzcW5JTWpOSGI2dXp6?=
 =?utf-8?B?SndhbmtmQlJVdkJSVEZEcUhVQmJLK2NkL29PL09udzlURUZ2aXllTHQ4dklN?=
 =?utf-8?Q?EiGazimsGUs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFSaU1YUDdtNHVVa3JHZmdiMVQwWHJVUExTcFNETjZUeVk5NnVVdTVtbVEy?=
 =?utf-8?B?ZkRucXVuUE5mVUliZTJ1SWswamRVK0ZLVmppQVUzY3BuR3RDVjc3aDkxejFu?=
 =?utf-8?B?THFySjFOS2h5Y29hMHNCcnVGeUdUNmNHODhWNmk4TndsQVY5MFZBaWRvSVJr?=
 =?utf-8?B?b2c2L3Z1cCtoeVBBTSsxYmtXY1V5LzRjMFZnZkNORXdZdWJLZS9panhZNFFB?=
 =?utf-8?B?enZkTGlkSWpMOXpRUXQyNitRZGtJK0ZaVFR0WUtIQVV2OHUrVFdyRkZCaWZw?=
 =?utf-8?B?NWNkZnZqekNVOTI0bkozdnVtUDRZQkxPSUg4TEprbTcvbzh4eDFMQkFvcHF6?=
 =?utf-8?B?NmZBZUp2aEU0YkVXWlQ4Z1U2TWV4ZWF5SEtrYjNFeCtST1FWcDVSVUdoNHc1?=
 =?utf-8?B?VTFmd2diVlVWcWNYMGhrKzhpZTJNMHNyOGJLL1F0R09rU3Q0OVl6c2YxV0lz?=
 =?utf-8?B?REJ3NlZQcEJ1ck05Z1dWYjNQd1VJK3NtV1VsZHhLZ1BpYlAzVFNCMjQ3L2Fm?=
 =?utf-8?B?YldraDVleldKSGdkVlRSZEFnT1k5VHhvQkhQR1ZhNHI5S1VIc3p4NHdsTGRC?=
 =?utf-8?B?bmZzWE5sRXd6dTRJYW9VSCsveHo2Y2ljVmJkTjh5dUtieXdpdFltNiswRjcy?=
 =?utf-8?B?Q2FMV2xISitLVDZlSk1QdjJ6SGlGRkx5TWFVZHIzZEo1eE5iVU5kclBUWFhO?=
 =?utf-8?B?TGtrYlZPRHlXTFA3ZUJRU2VHZFozRWJVVzlkQ0g1WXFuNTlCSFlCK3JZYi8x?=
 =?utf-8?B?M0NVLzFOTHRsSWYycjErdEswYUhObEdHNUxkdlZKcEtjb3FtZU12OFJOSWlT?=
 =?utf-8?B?Q0s5eXF3U2RCVEV2aWhrMXlucC9iNnZneWxzMzgzbFpDMTNpcjNmbEgrMGc2?=
 =?utf-8?B?b1lBUzQ4VnRwb1NuNlVKS0ROeUM4ZUZhRzdOVEd2MytaRDJ1bXdWSHpMSjZo?=
 =?utf-8?B?R2ExMERUM0VGdGZpYmUxSGNlRjRTNmI3cUQwRURlcDlNbnZ0T05OS2hkY1ZB?=
 =?utf-8?B?SllMSDlobnY4MkttT3FPcU9jeHQvWUN0ZVNaeXlOSzZqUXhKeXpTMnRHR0dF?=
 =?utf-8?B?UGRDOHBVSXV1UEplOFZxQUdBRzV5TFEvL2FqQjJhUzhpZ21PcWtKU0Zwdmxl?=
 =?utf-8?B?VjYzUHhYRllhamNKbFUwaWZneVpVYUU5MHRJTTZIL1NYa2xTV0Y1RysvVFN4?=
 =?utf-8?B?enJkRlhhMS9INk12QXIxUE54eVFFNjhObEUralpJNUx0NnRXVDIrb0JJK2cy?=
 =?utf-8?B?dXRnalJ1SXJHMm9HbmJGNENRN3lBa0pYZmk4ZzV5MUo5Z2ZPVXJqeWJRcWNU?=
 =?utf-8?B?NTBjTTRGbWNWekl1TVhoc3EyaUJRLzBianZsaThHMm1QbUR4QnlzZDIvRTho?=
 =?utf-8?B?SlpTSkpHTHpuY2drUUxld1graXEzRjk2eHZjaEhlL2F5cEN0M21zYXIzeEpI?=
 =?utf-8?B?Zlh4TGk0blduaXRhblZiNnZKekxSQ0diMnRLSjBqNVZyUGNOOGJkZnZzSXk4?=
 =?utf-8?B?alZadFk1QmliZ2RNLzcza2hKNUxGZ1c4eWREYmhFR3lvWkdqWXVsRjdLU2tG?=
 =?utf-8?B?dExBM2Z3SGdPclhoazdNTW93cEF6ZUZoa1F5eDF3K0dTazFoNTQvWXpoM01V?=
 =?utf-8?B?UE1QV1lWeEJqdUdYK2dwV0ZBUTVFalphSVpBOVdOTENzTWlENXBXWlYzRjNK?=
 =?utf-8?B?VWg3NlFUN0JxcGZPSEovSXJsSlFyZUlwNm5VNW9SOHRzV0tUYlFETmRiRFdm?=
 =?utf-8?B?Tk1KNnFxcHREYXY3aC95ZHhxSXZxN0pDMTlQQU03MkVseGlVcmM0NnY4cGt4?=
 =?utf-8?B?NjVRWXY0eTd3bXhDVzBYWVAvOXFIRWVuQUdiTEZtNkxnRTU3T1RodnVVRXk2?=
 =?utf-8?B?YkNoMHlsZFAvM1ozUlhVN2htV0RGSzZheFR6ZkR2UVlncTUrTEVpRGJFUVlN?=
 =?utf-8?B?Ym1vY3FWVkdFOU9oUUhLNXd2eDhPb1lyQjI0TEhpcWdaTThlYzUxNTBHMmJu?=
 =?utf-8?B?Mm44TXRRZ0tBRVZyb3dDdWl3aXFnQWxPZjQ5d2diNUxnOTBFWk1Yd3FueEQz?=
 =?utf-8?B?UnE1aGJhNExtM1IvRTlYcVNGUlBsM0l5YmxJOXc2RmNKRGE5NWl1elJ5SDBZ?=
 =?utf-8?B?R1ZzV1hDYThXc2FEOFBNVFpLdHZQZDNkbmYxamttZ05Bc0RuNEQrUDNLQWt6?=
 =?utf-8?Q?Pr1Rtn2/kTH3+VzhocAC10Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f69c17-2b88-4bc0-137b-08dde74c4486
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 22:34:51.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbtATO4rDyiZTfCx9VcS1iq0quU1/nK82Mlzez5o3v9HVvT9JyLK9A8tBSF79ir5tllkxpM+QfV1RaXO9Unq826ChjrTxxyF5ceeTFYiW+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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

On Tue, Aug 26, 2025 at 04:52:14PM -0700, Dixit, Ashutosh wrote:
>On Tue, 26 Aug 2025 15:43:01 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Capture ftrace with the --trace option when needed. This is not intended
>> to run as default, but more of a debug functionality when manually
>> running individual tests.
>>
>> v2: (Ashutosh)
>> - Update commit title
>> - Check ftrace buffer size sooner. Use defaults
>> - s/Mb/MB
>> - x 1024 instead of x 1000
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Pushed, Thanks
>
