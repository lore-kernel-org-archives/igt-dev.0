Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75BDCA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 00:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A97E10E2AA;
	Tue, 26 Aug 2025 00:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6FgPERj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457910E2AA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 00:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756169255; x=1787705255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q2avA0ruUawlfCOhUTEe2/7OhOdvwLNagx/MxHLRW70=;
 b=R6FgPERj1Tc/pfdlx+VhQjqEcvMzYaMp9jr+bgDZJd1rUzy5kXhbJKYJ
 SncF3kior8PVG6Po1k4XjR3J91xsV+YygO+OGTdQ84dsLlbs4e/Rp1aWk
 IuZIFpO1D6Xmp3UWHc+5b+2A3bsap9VsqZXW3HSTD/7B+E13/uEtDkAUX
 1Lasj6NT0sA+7wC3PU7NWSiUk4ZAF9VtP/rxTOcjrBNWbTOjZk0BKdCk7
 Hd7k4pOdtx+6YZu10emFTaV851N5+o85IseUXsBKmbd8zckkaqO7MpFDe
 IIlZLovxBbg4d4xYcAD7x7AqhU2E5K07ggnf87Mcvqxht5PyhaUKAPmNV g==;
X-CSE-ConnectionGUID: vAJZsFbFT5qn8WE0WEZqLw==
X-CSE-MsgGUID: lJolW3vTSpuny1Z29tTPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="83803030"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="83803030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:47:35 -0700
X-CSE-ConnectionGUID: Ux25Iq2uSNmRRsOfv5FuhA==
X-CSE-MsgGUID: O/MTiUKLQm27+KyBhF1BrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="193097933"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:47:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:47:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 17:47:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fO2hNj1/39mp5KAWqbiOnWSiIwPEOss0mfLaDdo1wkK19d94a8ufqgUOwTwh4ZJ3CBF6qwykqJx+dyXQc4R1joJOcgM6jUQoUJRdK9Lf5V51z54/T95NQJe3eKV9lDLInYHGkGQQ80D3yoM/vwE4XyUa/mms1H6BcYE34klzwKT4H72GJny8XHSEEfwFJE0jB9w9zrjCPqhIPh0f9LHS2YHgn1KvEqMkAjovzLQ0vxLJDFx59sIwedYGSjxlofKccg0n8JPUwHbgLUZuB20QRo1r9LqNL+xYwy89pK3nKRn6lUmtAj49hN6FkFINhnywrXw2iyVv2NvThcPgyfKHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdujLJgcaYDtMJF/dxL6T6h6YGoi6FD1nprBfrCkON0=;
 b=PsqJG6PmyOtZ2Hg6PJQlYscStXHE3Wc9rem8HWbm5h1Nqbno6wEXlTLST6m++VyLnArip1oPMMDpSdYmXWXa412X5q194CXZMFc7Bjgji9Q2wnT8/uEfQGjkHh+2UTNqL1MUp27gSb9caf5BAJ9lMY/qFCvFsGWSnUtmBzifFQoOpLoVuDQ5HXOq4rmYB9p2yYj4j0fT4oNiuzRH81h7d2MGrqi8Cy6Joh60Fymh6cCaU9j/MhAATqu/POguPJqUHq65i9h7tXFhYxJjlxOoPo7PSBrXSIlntW/DiDbQVHqdw1oCDK0XPxYBNcnxGolXH2GRHIR6nq4YRP+rvY4yPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 00:47:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 00:47:32 +0000
Date: Mon, 25 Aug 2025 17:47:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_oa: Add an option to capture
 ftrace
Message-ID: <aK0EItFOFH6FBjD0@unerlige-desk.amr.corp.intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
 <20250823003401.109978-10-umesh.nerlige.ramappa@intel.com>
 <87qzx1yia3.wl-ashutosh.dixit@intel.com>
 <87ldn7miaz.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ldn7miaz.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: c01ce10c-01e5-4564-2454-08dde43a23ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdRZTFqYkxXcGtlaXhRcnJvM1JmZzI3blBYd2RvWlllWTNnL3Mwd2RxaW9E?=
 =?utf-8?B?QTFkNWh3Sm5pbVNFZjZPVjl4N3lld1pJVU44bExCRWdiRUI1SE4vNFlaclJJ?=
 =?utf-8?B?bWdzSnVNbGhoT1dtVSsxT1ZtOXl4Nmc5OXpvUHV4Z0MwVVlob05xQ1dUTklO?=
 =?utf-8?B?ZTdDeDZjTjQrN2dlUWNac2Y0aFNYK2o1Z1R1N3hpZDFuMCsvbkhJczhTM2dM?=
 =?utf-8?B?WWpLclRxMk1tdEg0VVkzdnpyeFIvVzhPWFgraUlrUUdwd3A1UERTaXZuZUxG?=
 =?utf-8?B?ZXlneDF6dXVBaFB2RjdrcHRJZ1h1VjJVUVNjN0YvRGM1cnFDODdnd1NhdkZs?=
 =?utf-8?B?L2xQY1B4V3h6Y0tWcDB0elUwdlBKWlVMeHpaZFEvRHNTRkY5WHUzVDRQYUVq?=
 =?utf-8?B?Z1V6V2NjWDZsMms4SlZOMjZyZkdxOURtb0phRi8rakpQdlM5ZWxBOUlhb1Rj?=
 =?utf-8?B?aFVkTTh4Q0w0bkhhSklRMXNOcTBMQ2dCVnZqMkpLRFgyODNhWkxadWI5ay9k?=
 =?utf-8?B?aGthclJtckcvdXh0Mzh0blVKR1lLdk9YTG96LzU4SHJ2NjYvNW1vQWl6TWMw?=
 =?utf-8?B?c2Q1UDhURDQ1NWdINm1UMUh5M2dQTUlrSDJjUFl1Z3k1N3BYN00xNkR1eVNB?=
 =?utf-8?B?NVpJcmd1TE83V2prNHBITEhjV0hyTSt4WTMyTGRwWkdXQytqQVVXZEdEYVpV?=
 =?utf-8?B?Uy9peUcyUUNDTkhtL24zanNhSDgrQzFqcTVXS09EWDRpWXJvYUFqZjI1TEN5?=
 =?utf-8?B?cFpPU1JrVmF3Zis1bGlPclk5Z1RVaDVrTFhhZUJTS3hYZThFVHB0QjBrNnpE?=
 =?utf-8?B?WHM2b3BzVnlERTcrTWpJSDZiaTlRZ0oydThlaGQ0WGtKTVA3TEZCRHZvb2hw?=
 =?utf-8?B?UlVCOWd0ZkF5RXBXVzV6cnBUZTZqYXl2Rnd1S3hnSGpadms2U1Q2Q3Q0RFhj?=
 =?utf-8?B?S2VMY1JLemErRTZYVko2c2UyWGNoTE1mbitLdTJzekx3MnhhRFpDeFJxSjM5?=
 =?utf-8?B?ZjZ5ZFhCWFJWajFyS0NTZWxSYzc1Njh6Q1RPUzM5TEdzMWxJTndNU3M0ZFZY?=
 =?utf-8?B?UUJoQmM2dk9GaVdqY3d6Wkt6dG1oamFPeHFSWS90WWVDQUhQRzZ6aUJqNDUy?=
 =?utf-8?B?Q0sycWdQSFdtSjNLRG82cVVQSVJQK3BCUzRxbi9kVHNuUExkUGNRYXQvbk5k?=
 =?utf-8?B?YlVMcmhLL3FGZU41ekgrVXg4ZDZNbExQUEU1bWp4RHhpaW9KbFNoaHlmTVN5?=
 =?utf-8?B?VEpuTmpUOXZnUVNiVzZTZHRLSTh4Q3ZuaS9sTVZiQ0ZxaVdTc0szVUhobGg1?=
 =?utf-8?B?SHgrdVFRaXd2bU9nWWc2WFRPV3lCMC9ab3pMSFZESXFBTmxia0dsTGJJV2xG?=
 =?utf-8?B?TFVmSXkrUW9ZRW1YU0hQSXpIdWFsbEoza3MyV1JJOWlueHBrWklJT0FJNUlE?=
 =?utf-8?B?N1Z4Sk04SktTVVJOSlRzTXBkT2s2N3JpYVg2TGFUUkJJQ2JZdXJ0RmxLMkNy?=
 =?utf-8?B?VnJCVHpuZWNqZEwrOG52bWFiRUVZOTFLWFJtcWd6YXV6V2VIeEdXeDFvMVdi?=
 =?utf-8?B?bnhiemVTc0w3ZjkxcW5pRDZVcmlJNlFJd0IwQzZ5RVZLNkdqalRoYjZLL3RL?=
 =?utf-8?B?eHo3elcxbU5mL3Qwb2YvL3lMbmt4UmFNOXAzWGkyc3dmL0UwYW5wRjhocmtv?=
 =?utf-8?B?T1NpTjRMemZVRGRJMWw2NWFqblhySVMwNjdRQk96R3A5N05wQXBocWpUUi83?=
 =?utf-8?B?b1V4TzBIU3hHWTNia2JUb1BORDlFOFphekdwWWVzc3RBb3BEc1JhNmxwZmR1?=
 =?utf-8?B?eDh3b1VkU0l0WGZZZm5sNWhMSzg1RXJvTUFreXpxSDNwSmNwK083WEhGN3pH?=
 =?utf-8?B?OVV5MlFKTHdiSXhWSHFWMUcwcmtxWW4yUHhVSFY3SHNINkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJ5ODVlSFpIaXE1TDdPUzJ5TkcwUnFrVGFJK1dKUHBwNWFXejNLR1pUQy9i?=
 =?utf-8?B?NjNzSjZmTW9ZNmRHSVAvcWZCRlJTblN2Y3hIUWZsSGNndHRmaDl4STNKemQz?=
 =?utf-8?B?bkYxUyt4UWJYUThHVlFGa1V2UGM5WWxuWUFWVFVlSUlFdWg2VlpZS1phY0xU?=
 =?utf-8?B?UXpvbkdWYmpnUW1hVHlvb2FaWDF4Vy8yMzNiaTMvREJmUzlwdy95aU05cTJZ?=
 =?utf-8?B?NVpZNk9YN0VIcHBIdmJ4ZGFSU1RSem92KzdYSE0rMTVkWW1LbmliSDRCMWxC?=
 =?utf-8?B?cUhVTkQ2cnhmUDNYNjBaL3FZRzVjcXB1b2tBV3JJYThuQWtGNkZmOVZCRjFq?=
 =?utf-8?B?T0ZxWnhNU2xFd1IrQTd1MGs2WGxHR21qWHQxRkMrQmQxc3FiM2xYQzNBUUE4?=
 =?utf-8?B?aUpjU0tlVlZob3VPaDhjckVLcnJmZjJybnpYY0JvZFU2RjRBRkdBdHRpZHJN?=
 =?utf-8?B?L1JJNUE3Qmd1WmpxRzRwa3NHL25YUHgwWlI4V3V1ZTRreGNmYXVFMTFtaERW?=
 =?utf-8?B?R2FidVdmU0NNY2pqUmN1Mm8rd3F3VnBpUWhoa0VNNHloQnFrSytmbU41WGdP?=
 =?utf-8?B?Rm1ZaldabE56d1FmcFZjazJKdDhxb1BsUkdRVEg0RHcrcmliVkNsMjMrVVVh?=
 =?utf-8?B?T0xTTElCWVVHRWpSWWpsME5mUmVaa3h4eGt2ZTVyVjZhcEJsY1h2UmtTbWNT?=
 =?utf-8?B?UndTZ2d6ZzA5Y3l6blVrNC9uangyaWpKdmhKV0hnSzVXeWwyTG1qbEJ0aUFF?=
 =?utf-8?B?NE1BdHFTYmh2ZUt4TXhFTGZRLzA3Qi9OWGRJeWZMYkk3eHZ5NVRkNDhpMjll?=
 =?utf-8?B?V0NGbis0SkFRN3lmU3JyT0crTmZBUkhicGJQS1hmU1VGWThiYWd2L1ZnbzJQ?=
 =?utf-8?B?VG9SMisxSE5hNndkM3JhV2ZhZjlIV3pjS3pMcmZjOXZBRWpRNEsvUUJ2QUIx?=
 =?utf-8?B?MTBQaG1BTk80ZjhQeDMrdDJ2UmxkemlWUE9QZS9UOHMwdHUwcmxPWXMwZ0JR?=
 =?utf-8?B?RnI4ZitKaVB5Z2FmT1VPVWEwME93ZHJVREJwaGFpWXZHaSs2UCtlVE5wM0h0?=
 =?utf-8?B?Z0dES2o1K2UrdFBrVzB4Slg2VHBqa0NtWDhMYVRweTNNSjdpK2JFOHFZRW9h?=
 =?utf-8?B?VDIweWlZaDFtOUhPSDB3U0NpcHE1QkRlZ0xabDhJaENFNGFLMlNKY3RCV0th?=
 =?utf-8?B?WUtlRnpUdEtpTjFUL1Y5QzhrclBRQ0Nsb1RyRXZYZTM0YjVoTTFQbmlUTlpr?=
 =?utf-8?B?TGF0RU5nVWRSaXFSTVhsc1FhUVQxUXVlVlRHWXRlejB0RkV4SzRzMFB4UENm?=
 =?utf-8?B?SHJHRDMzYWExcWoyRVd1dzJVL3lVR1F5bkE2cC9kT2prZ2VVa1BuSGZIVll1?=
 =?utf-8?B?M1BDTk1nb3dUaUU0V1NsUitQT2tkQWk5MW82cjFWWWxPdDJtMmpSVytjY0g2?=
 =?utf-8?B?Rkw1YndNQXc4c2ZjQXE3cGszOXNvZEVYcit4d1p5d3YyalJ6REp4TjVad21y?=
 =?utf-8?B?WHROeEtCVHREV3A2TURFTml2ODhCOXVTY2VXUzJtNUJFeElwTTBLelRpNmwr?=
 =?utf-8?B?ZWZTcTI2a3RKVTZwcDF4ZVBJclpMaWUxT2s4ZWhDSXlSdGVSSE01VnpMRkd4?=
 =?utf-8?B?aTVBdGRLakJ6RDFoYW5nUEhtKzBTaUQ4YkRWM3gvVXZOblZGVytHSXZ5Wlht?=
 =?utf-8?B?cU8yNlVWeC9COG42NnpvOEhNUGcyY0pZMjNHMXMvMzRWcU1TWlZuRXl4WFJa?=
 =?utf-8?B?c3FOSnNlNUtwNm5XMlFNVng4M3ZsbjBhMWxMZUJaRWRyWE5wdmlxU0dUcGIy?=
 =?utf-8?B?cE1KWER5VXdyZ2xmMDFZOUZhbFpsUjVkLyt5NVJzS0dtUHc0RXVrMGJiU0kx?=
 =?utf-8?B?MVU1RndUVlQ5S2xXaEhHbTlHK2NvemxEMW1scUNPZjA3aU10SWdIZW1paUw5?=
 =?utf-8?B?WmpvdC8zK09QelA1UUsxSkVieEhGcjNLWWxydHd2NTFWKzZvdTdKTURDZXht?=
 =?utf-8?B?OWM1K1NOWTc0ZVdqN2VGR0FRRkdnOE82OGZ1NDczRVkrd1hHMXVjcWtLbFdm?=
 =?utf-8?B?bGgreDJ5SDUwY0RtS2R3NmwyZSttQ1lubldJMjMxMjFlcjlCQ0dlTVU2OEtQ?=
 =?utf-8?B?WTdaLzZUQkN2ZlNoTEJkTDRBa3Z3ZjV6Y01uVWtDVEo0SVBhczB3UnVTbjNV?=
 =?utf-8?Q?/NKKkUSgscHhkOa1u7Ys0Vs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c01ce10c-01e5-4564-2454-08dde43a23ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:47:32.0262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1n4wt2r/qE0Qkmdeb4rYpRdyYPvaSX2RVYH/6MCvdeIa/ENzmlpiqppJW1EK9lNOdUrDgxtDZm5nWS+mLbUNST5pMbNiswJRaI7iJQCROmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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

On Mon, Aug 25, 2025 at 10:18:12AM -0700, Dixit, Ashutosh wrote:
>On Sat, 23 Aug 2025 12:01:08 -0700, Dixit, Ashutosh wrote:
>>
>> On Fri, 22 Aug 2025 17:34:06 -0700, Umesh Nerlige Ramappa wrote:
>> >
>> > Capture ftrace with the --trace option when needed. This is not intended
>> > to run as default, but more of a debug functionality when manually
>> > running individual tests.
>>
>> Maybe mention here or in the commit title that we are capturing register
>> read/writes in ftrace.
>>
>> >
>> > In addition configure the ftrace buffer using the --trace_buf_size_mb
>> >
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> >  tests/intel/xe_oa.c | 58 ++++++++++++++++++++++++++++++++++++++++++++-
>> >  1 file changed, 57 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> > index 7381e7b9bd44..e5473a5ff70f 100644
>> > --- a/tests/intel/xe_oa.c
>> > +++ b/tests/intel/xe_oa.c
>> > @@ -307,6 +307,8 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>> >		.bc_report = 0 },
>> >  };
>> >
>> > +static bool oa_trace = false;
>> > +static uint32_t oa_trace_buf_mb = 20;
>> >  static int drm_fd = -1;
>> >  static int sysfs = -1;
>> >  static int pm_fd = -1;
>> > @@ -389,6 +391,31 @@ static u32 get_stream_status(int fd)
>> >	return status.oa_status;
>> >  }
>> >
>> > +static void enable_trace_log(void)
>> > +{
>> > +	char cmd[64] = {0};
>> > +
>> > +	if (!oa_trace || oa_trace_buf_mb > 20)
>
>Actually, why is this oa_trace_buf_mb condition there in enable/disable? If
>we don't want the trace buf to be > 20 MB, maybe return an error in
>opt_handler?

Ah, right. That's easier to do. will change that. I would still use a 
default buffer size if the user passed a bad value.

>
>Also, do we really need this oa_trace_buf_mb option? Maybe just select a
>size and hardcode it? Or we need the option because we don't know the
>hardcoded value?
>
>Since we are only tracing xe_reg_rw, maybe even the default size is ok? How
>many reg r/w's are there for an OA IGT? Maybe not that many? Since the reg
>r/w's done by batches won't be captured here anyway, just the direct mmio
>r/w's?
>
>When we generate lots of ftrace, I have previously found the default ftrace
>buffer size is not sufficient and printf's get dropped. Previously I used
>512 KB (the largest size which worked in those old kernels) and that seemed
>sufficient. But anyway even larger values are ok.
>
Didn't think much about it though. I have a default of 20MB in my script 
somewhere, so copied it over. Sometimes I am dumping OA report contents 
to ftrace and it fills up quickly, so I find it helpful if I can pass it 
in the command line.

Thanks,
Umesh

>Anyway, ok to leave as is too. Just some ideas.
>
>> > +		return;
>> > +
>> > +	snprintf(cmd, sizeof(cmd) - 1, "echo %d > /sys/kernel/debug/tracing/buffer_size_kb", oa_trace_buf_mb * 1000);
>
>Maybe * 1024 instead?
>
>> > +	system(cmd);
>> > +	system("echo 0 > /sys/kernel/debug/tracing/tracing_on");
>> > +	system("echo > /sys/kernel/debug/tracing/trace");
>> > +	system("echo 1 > /sys/kernel/debug/tracing/events/xe/enable");
>> > +	system("echo 1 > /sys/kernel/debug/tracing/events/xe/xe_reg_rw/enable");
>> > +	system("echo 1 > /sys/kernel/debug/tracing/tracing_on");
>> > +}
>> > +
>> > +static void disable_trace_log(void)
>> > +{
>> > +	if (!oa_trace || oa_trace_buf_mb > 20)
>> > +		return;
>> > +
>> > +	system("echo 0 > /sys/kernel/debug/tracing/tracing_on");
>> > +	system("cat /sys/kernel/debug/tracing/trace");
>> > +}
>> > +
>> >  static void
>> >  dump_report(const uint32_t *report, uint32_t size, const char *message) {
>> >	uint32_t i;
>> > @@ -4937,7 +4964,34 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>> >	igt_require_f(hwe, "no render engine\n"); \
>> >	igt_dynamic_f("rcs-%d", hwe->engine_instance)
>> >
>> > -igt_main
>> > +static int opt_handler(int opt, int opt_index, void *data)
>> > +{
>> > +	switch (opt) {
>> > +	case 'b':
>> > +		oa_trace_buf_mb = strtoul(optarg, NULL, 0);
>> > +		igt_debug("Trace buffer %d Mb\n", oa_trace_buf_mb);
>> > +		break;
>> > +	case 't':
>> > +		oa_trace = true;
>> > +		igt_debug("Trace enabled\n");
>> > +		break;
>> > +	default:
>> > +		return IGT_OPT_HANDLER_ERROR;
>> > +	}
>> > +
>> > +	return IGT_OPT_HANDLER_SUCCESS;
>> > +}
>> > +
>> > +static const char *help_str =  "  --trace | -t\t\tEnable ftrace\n"
>> > +			       "  --trace_buf_size_mb | -b\t\tSet ftrace buffer size in Mb (default = 0, max = 20)\n";
>
>s/Mb/MB/ ?
>
>Thanks.
>--
>Ashutosh
>
>> > +
>> > +static struct option long_options[] = {
>> > +	{"trace", 0, 0, 't'},
>> > +	{"trace_buf_size_mb", 0, 0, 'b'},
>> > +	{ NULL, 0, 0, 0 }
>> > +};
>> > +
>> > +igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>> >  {
>> >	const struct sync_section {
>> >		const char *name;
>> > @@ -4981,6 +5035,7 @@ igt_main
>> >		 */
>> >		igt_assert_eq(drm_fd, -1);
>> >
>> > +		enable_trace_log();
>> >		drm_fd = drm_open_driver(DRIVER_XE);
>> >		xe_dev = xe_device_get(drm_fd);
>> >
>> > @@ -5210,5 +5265,6 @@ igt_main
>> >			intel_xe_perf_free(intel_xe_perf);
>> >
>> >		drm_close_driver(drm_fd);
>> > +		disable_trace_log();
>>
>> Does this get disabled even if the test crashes? Anyway since it is for
>> debug and not enabled by default, this is:
>>
>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> >	}
>> >  }
>> > --
>> > 2.43.0
>> >
