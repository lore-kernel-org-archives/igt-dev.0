Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8D2CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 03:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2361E10E297;
	Mon, 10 Nov 2025 03:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwQLXZE/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1910E297;
 Mon, 10 Nov 2025 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762744674; x=1794280674;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=IrImBopOU0cqoqAYGUdFP4QO1LExM+RPO7A3IsSF3+I=;
 b=AwQLXZE/CQZMVJ/bgWVJTjaaONAK2ia6IyhqEVtyZdUx6NOBZMqDnAgJ
 m98b6yPUQWqH0TT3fKOXsiouKiMzaotEPWCK3mf8OqcWYnDM8P9tKkMO9
 tW911kk5BuJSWGkxoCQwGrjVJdLV+hbxceS8XnzHfFiiQJ8XLUYZdIvjk
 fnpNu8vozHzOPaQzc7sRA06JDO1vDF2GfiXx2bwKHxT6HjyhAxb4JExIM
 Ds5D6SNHk/NLT/gpbleTSRNNnuiLkP/lR8u0TZZ6E0uMLPOSfqeFkvzVs
 dknlWey9/vAIahh9JY2+es6XwdJU8p3Of4XgP3h78HexWR5kGrgZPnMq2 g==;
X-CSE-ConnectionGUID: qPS31zzrRh+wdvJk2WpUMw==
X-CSE-MsgGUID: ennl5dRvSaiqi9bds2JTyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68640710"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208,217";a="68640710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 19:16:54 -0800
X-CSE-ConnectionGUID: yk89RWYaSXKoBeBxVd1s+Q==
X-CSE-MsgGUID: SPFfaB+RSICjdHvBay9HuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
 d="scan'208,217";a="193576894"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 19:16:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 19:16:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 19:16:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 19:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giCMxHCGwtcECh3yObZ75s5VkQ76HLpLhYcPfZB3XFpwd4ETcrD9Muc1AzNI5KWBzSHBnSU8hW/AVijrmfYy8EeIG6q/w7ACDhnissMG+fEz+x/l9n48SZIw4TwXaOdCHFib18/2EDxGMxgVsCcZwRqMctVSAP1AMJaidTk+Ekieck0neiqfOV0h1no2l2SpuwYmV06JKMQ1O5C6Y/F2xF0yVIxuWMkgdp35HZZZKh74n1diQMrk7htDrZBXC1lylVBgX3J+KE3YaS8HRVcLDevO5FHPFi39gju25wYSIi5M0E5YSQ/IsZNPNYQO6S4GkkbhNQ4JsiQSoxwvlxtNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJobwEi9OQg5ZEqAapwT5u2kfROd3uGjVxgJjv1q2R8=;
 b=Fe+WTZReU4rpdtNBhx8sM0itW4wboSPq8V2v66aOzZ4PqydQ1jaf/8PxRG1y86qa+9ui5h5aqp4Kmr9i0EACw3fcY8+1uuNPaTjZc7ecWGSBi5cBH10sp/C5xKJX1syZTZx3H0gRoKfaRO7rZybQ2EajmeKPV+a/0PHQg06r7XMFsMoqyo/icXtGNScpOWnmW8qLHd2FLVI21LLuCGMM/LhgNguqTFBSSLaqbyPITlpLKbWW6NhItlMUl/x+5jJWA9uT/BmwpYh4w36/5Mayg4NxsEdFNEnytyH1MTvOQ5+W59BMetv/Iju9ITNRSgGAQPTIAod3xdpLDm96vNUkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 03:16:47 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 03:16:47 +0000
Content-Type: multipart/alternative;
 boundary="------------Wtrb7oEoOR94g0Bgr5406gM7"
Message-ID: <9a3b8a4f-7dd7-4c5c-8d09-99342b77f43d@intel.com>
Date: Mon, 10 Nov 2025 08:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Introduce?=
 =?UTF-8?Q?_NVL-S_and_CRI_platforms_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
 <176263828382.33229.14016251192424322404@10055242dc62>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <176263828382.33229.14016251192424322404@10055242dc62>
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2624fc-4e13-4416-8ff8-08de20079487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXFHZmN1bytCR3ZEamhiMUFaN2wzN2kydnZkdjdwajlmbzFETzBnUGgvNW9M?=
 =?utf-8?B?bTNtVjdUZUF2T2JYdjVjS2crK084Z0k2ajFBSUhIN1AwS1lmZEtKQlN2VDFt?=
 =?utf-8?B?ZS8rcEdITGl2eUdGL0dOZEdxZzV4ajFpL1JiaEtjSTRUK2pmYjVZcko5dXhH?=
 =?utf-8?B?bDBCM2RVQWQ1RnlMNWRwVWZaa0RHeHBNbmoycnZHb2NYdGkxaWljcXFrRkVX?=
 =?utf-8?B?U2FDamdPV2kxVDE3bGdmTFpURHNEY1EwSVFiN1d2aTlIdDBEVzM0UGxhVWFC?=
 =?utf-8?B?b3QxOGZTZ0U0cUxLM0QxZUY5VzdYUDIzMkE4ODlreGwwNE9YalZrbm1OaVRo?=
 =?utf-8?B?YTQva0hvbVR1eFpmaDc5cHBIdzYxUmdORXFtRXo2cGw4M2o3OHVQellUZUwr?=
 =?utf-8?B?NnBoY0hvbmVad2dTMzZoUnFoNldsRThKWUZUaHdRNWRxc0RsZndTeXB3a0Vr?=
 =?utf-8?B?d1JnZ2c4VWRyRTYxUmQ4UGdGRzhUaXMxbXpqMVJ3aGNGczBTZXhGQVA3azc2?=
 =?utf-8?B?dk55cnV4cUhVTjdyUEJuWmdObEx1WnFqdmJtSGRKUXU5WTY4a1BSdUM3VFEv?=
 =?utf-8?B?ZFFaWDRuOXpmU2VtWGhnRy9RNFFmYlFTdjB0ZmIyVy9YWndHMXcyRE92eGZR?=
 =?utf-8?B?UWIyNnYyMGdQWmVMRUYrSU82VGNPdzZlci9WTUFpT050aVJyWjBuTGJCRDlO?=
 =?utf-8?B?TnBYRS85VTJBWXlFQWNQVUNWUS9iUE9YQncxN2VYamJ5SE93aWx5cnZPTGhO?=
 =?utf-8?B?Z210b0RxNUhhL1dBZUxubXZkQVpyYVNOanArV3BXdGFzeHJucFNlSWY0ZlBq?=
 =?utf-8?B?RDNTQWRHUlZ0aUtSZWRQazhSVkZsamM1eW5mUklGZzN0SU1aSEJUVGR3OW5M?=
 =?utf-8?B?c2JOaSs5V1EwZTVYd3dZYU9VRzhpOTNBeFVrbkZNZ09NOUZPYWpTOGRUUW9J?=
 =?utf-8?B?YW15U1Y3Q1hUWjJ4a1hsdmREVnU2bUVRM25FT3EzVEJYdHQrQUhyV0hxZ210?=
 =?utf-8?B?UW1KbUJkYkhYQnB0MHZRR1lDU2Z0Nmh5VUF6aHZVV0dQRnI2WGhuaVZGbU14?=
 =?utf-8?B?K20wSTJ3am00Q1BlSk14dlRsVklMcmJCbkVLUlpGWUcxcXN6bTY0YyswTUFY?=
 =?utf-8?B?d3M0UWxnVXpLNzVCNXRPTGtrd2FLNEE5U0t2NVkvcEVQM3U1LzE3dGVOUzJk?=
 =?utf-8?B?M3ZhTHFNTmlsZll4V2c4THJYcTJoOXNXaFBDdm0vRUpab0hiRGsrYjVwYkdQ?=
 =?utf-8?B?VnkycmE0VkcvWkZoZ3R5c2k1U1lvYW1LZDA5NFBNOXpRSmE2K3VrNVRLdGIz?=
 =?utf-8?B?a3BWcG9XMCs5NG16NG5idkNkMTR3WnNXSlZOcEdKUnVUSi9VMXBZKzZuR0Jl?=
 =?utf-8?B?LzBKRlVSazIrWElpZ1N3TlBQQ0s0eTMwazJiMURIZnBrVHZjem1mYnVxajkz?=
 =?utf-8?B?MnQ0d1duSm5LNHFqSTQwOWl6Q1lNanQyL0J2YU9aK3owZ1ZwTnM3Y2pZL28y?=
 =?utf-8?B?V3ZhaUloaWF2M1NyRlNhQWxQT0p0Tmx3NEdDYmcvWXVaMEpqeC9VcWNrY1pN?=
 =?utf-8?B?ZjVCQjF2bU0vVko2dHRYN3RseDFYM1V1VEFwb3l4MDBHdUE1dEhSMG8xeC9o?=
 =?utf-8?B?SEVsOWhJVjNtWlMwV3hOYlhUZWhpMlNJVmtPK2hZNVNFbm50L292TmhUL05M?=
 =?utf-8?B?dEwwdGltOW9ndUdnZUo2aHJZeGFPaEFEL0dyT0hmZzhQSkxSMzdsNjJYSk9n?=
 =?utf-8?B?dmJoQ0h2TkZNN2tPY0J3ZmVFZjdmRDg2Njc0S2F0dWNoSWxET3R3cmVkNm15?=
 =?utf-8?B?eUgrUFM4TU1FMUwxNUs4T1JaZ2U3dDIvRmNKVE1KREduRFUxTjhGV1ZOcW96?=
 =?utf-8?B?WThUNFFOMnBIYmZFakNTK3JQcmZTYW1EYnpPWGZJdVk3VFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3kwMGhBSjNlY3h4TGJMR3ArN09ZNzAyTy82Zlo3dWFkazYzVE1vd2JsMW9B?=
 =?utf-8?B?UFJGZWJxK1JXZWF2Sm5BTHFvVklrM0ZwUW5rU1dFMVI0Mkl4RnVWVmdGQk02?=
 =?utf-8?B?a2pRdEN2c0s4djhDcVZJVFRxTElqNWUvSlRXeTBKM0FrbHBUdlZsNTBwUklK?=
 =?utf-8?B?SFpvRG1jcXFyQjFlQ3UrdlBTTlBja2ZRM3kwTHBheWxST3kzT0d2eG9QVFJm?=
 =?utf-8?B?MFNIOXpFenJ4UkxzYUwxRmxMQ1Byc3NBZ1lRVFZaaEdqVlRtdTlPZ0Uyc3Er?=
 =?utf-8?B?WWhJWmNEV3BmSnpRZWY4dTJFK3VqajJocEgvTHBuNEVJaHZieHJxNks5c244?=
 =?utf-8?B?QTF6dlNiaURNNWNSdmNnZThRWGtoSENhcjhuOFJaZ25wdXExM00vTmZKVTBq?=
 =?utf-8?B?TFBSUFFDV1pCZDZuYTlaZzNDR1RtLzVXZ3k4QWxaRExvV09KalYxTjNJNkZq?=
 =?utf-8?B?VzFUem9tTitvNC9kUGtYREwrblFRSGlWZHl0elhWdFBvZW01ZE14NURWaEVP?=
 =?utf-8?B?TW0vaW56VUMvbmd4Wm9MWExYTHkzbE53MU1uRDVMQjVUMlBrMjh3TDZnOTJR?=
 =?utf-8?B?RGVYNndsSGhKMkFvK2grVFNYdjl4VGhiVHJmSkJyUUhERzQ2aHREdktKNFVr?=
 =?utf-8?B?dERuZWN3cHpYcjFLL1RlQnpFRjNPVS9DSk9oR2ZqSDhIODR1VnU1UGErbDBs?=
 =?utf-8?B?MDVyZWNYSXBqL3hlMkpZc1VqMzN5ampUK3ByYUJxbjNGSTFCcCs2UkZqanVW?=
 =?utf-8?B?N0JXSjloc1d4WHFMSlZoYTRTTmxrTTNQazY4NmZvam9PM2YvUUFhSXBOQ3pw?=
 =?utf-8?B?aktzTEMzbzF1VmpLYUM3RnVMWEE1UmtyS25tdjZCbzVjWnJUR2k0NEdiektp?=
 =?utf-8?B?MjR5WDVKV3dRVVNxeXY1NnpmMEgwNjF1QzkzT0Z2ZWlsR2JlZ3ViVWZlNVJE?=
 =?utf-8?B?VDNLem42K0E1THNKNWl2Q1dLYWEwQ2lIcGNCRzA0VU9yY1MzMUtCT3Aydkpw?=
 =?utf-8?B?WUp4VGg4QTFOWGVOdXRONVZlWi9Fd2hocys3cFpRMEt1OXVGUG5kdVFnNGp3?=
 =?utf-8?B?Q09aQWZKRGFMa0F5azdTZFRsOXQwQlc0aE1HY3d2dGppNlB2L3lURklON2pz?=
 =?utf-8?B?eE5rYklSSWc1bXQxV0ZpcHR1Q1BKeHpIN016V2V2STBFSG93SVZmUENxSE5Z?=
 =?utf-8?B?R2xJQ3RkQmJUWk91ckNCOHN4ZzZRMDBEQjF3dGlrZjB5Z1Vnc2l2UWJQeTBS?=
 =?utf-8?B?TEdUcEdUZ2ZpVjd2WjBLZ0Z4WHlGbmlKODFQbUNDZENjRmpnK3N4V0NMbmZ2?=
 =?utf-8?B?SkhIZ2FiZm1vcTRKaFdJSGNhSEJpSjNuOXRXMjZBOGo2UmxORkQwN1dlSDRO?=
 =?utf-8?B?K3NUWk5GWjE5RVI1TmdXYTk2NmNRWDljUGdUYzVFVWlaNVNERDIvR29BdDRO?=
 =?utf-8?B?eG1qYmFqTzZJL0Jnc3FyUnRRVWRxR25YOFdCaEtvRkZZdjBHU3BQdzdUV1cv?=
 =?utf-8?B?WHdLZjNDekhpejdVQlZzdHVpNTVBZUpLaWM4UTh5dGtMUnEwMnQ2VTlyTlNN?=
 =?utf-8?B?Y1ZLME9oR2w5Z083SVRocHVFaithdXJMSGwzd1FXZHJ2Y0ZTcE5wbnV6Y1JZ?=
 =?utf-8?B?VXR4bE0vS1kvckVYY0FJeEp5Nmc0M2JBWDlCWksrRTByUzl0UXBpc0RFdm53?=
 =?utf-8?B?RHZWMU5nWmhITzBxS0Noa1ZYL2IwZTlIOExmeDZEVzRtTjJZWnM2YU9SVmw2?=
 =?utf-8?B?WFhGckJ0TUVuQktENlRaaVl5YTBReU1SNWpOSDA4VlJ0ZUVJV0hxb0c2V0tm?=
 =?utf-8?B?d3pENGtoeU1RKzRzY0tJbHFzL3Qwa3cxRXMzdFNJTUUxanlmaUNkZVVqcUNS?=
 =?utf-8?B?Q3ZtYlpDUWgrT3VlTk9ud0JEN2pJZGJqUzd0dTh3N2lyVXozb1JMRUdPNStr?=
 =?utf-8?B?bm42a0dkeG5UbHluMUxZSXRyVHJKRDVUWGh6NDBGa2lmRi9acUZ3WmNKRjU0?=
 =?utf-8?B?RGZxQm1vUlNBUC9TSUhndHZSYTFzRTFMd2RDaDkwQVZPVExYT0hoRXZBREMr?=
 =?utf-8?B?WWVBeDF5aTJCTnVkc3FlcE1Idlp3OStBajhRb013azJYd1A1dWpzSXZRUkgy?=
 =?utf-8?B?MG9EMTBXMi9mdThzeDJ0MWVLOEwvTlYwT1lDOUNHcjd4YlhGSWZjSFNmTjJq?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2624fc-4e13-4416-8ff8-08de20079487
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 03:16:47.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBUiK9Tl7Gpu8SmZRNRxz+DACNeQ1Ah8//+epg4DvQVozww0VpDa7FZX/psVtVQgJTNWvYWBs+xpH9ftPGsmdH0DfrQVs9UbLI0CDuZnP/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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

--------------Wtrb7oEoOR94g0Bgr5406gM7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Failures seem unrelated.

-shekhar

On 11/9/2025 3:14, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Introduce NVL-S and CRI platforms (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/157121/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html
>
>
>   CI Bug Log - changes from IGT_8614_full -> IGTPW_14021_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_14021_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14021_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html
>
>
>     Participating hosts (11 -> 10)
>
> Missing (1): shard-dg2-set2
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_14021_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@panthor/panthor_gem@bo_create:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@panthor/panthor_gem@bo_create.html>
>         +3 other tests skip
>  *
>
>     igt@panthor/panthor_vm@vm_unbind:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@panthor/panthor_vm@vm_unbind.html>
>  *
>
>     igt@perf_pmu@semaphore-busy:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@perf_pmu@semaphore-busy.html>
>         +1 other test fail
>
>
>     New tests
>
> New tests have been introduced between IGT_8614_full and IGTPW_14021_full:
>
>
>       New IGT tests (42)
>
>  *
>
>     igt@gem_ctx_exec@basic-process:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@basic-write:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@busy-accuracy-2:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@busy-check-all:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@cold-reset-bound:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@connector-properties-legacy:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@cursora-vs-flipa-atomic:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@dpms-mode-unset-lpsp:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@enable-disable:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@fbc-1p-primscrn-shrfb-plflip-blt:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@fbc-psr2-sprite-render:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@fbcpsr-rgb101010-draw-mmap-cpu:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@flip-vs-dpms-on-nop-interruptible:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@flip-vs-panning:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@full:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@hw-rejects-pxp-context:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@info:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@invalid-query-illegal-handle:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@invalid-single-wait-unsubmitted:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@kms:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@lease-invalid-connector:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@missing-ccs-buffer-y-tiled-ccs:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@multi-wait-for-submit-signaled:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@object-reloc-keep-cache:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@psr-1p-primscrn-spr-indfb-move:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@query-topology-kernel-writes:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@reset-signaled:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@short-flip-after-cursor-atomic-transitions:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@system-suspend-idle:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@test_reprime:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@torture-move:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@gem_ctx_exec@ts-continuation-dpms-suspend:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rpm@etime-multi-wait-for-submit-unsubmitted:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rpm@invalid-set-no-zeromap:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rpm@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@plane-position-covered:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@psr-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@verify-pxp-stale-buf-optout-execution:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@wait-forked-busy:
>
>       o Statuses :
>       o Exec time: [None] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_14021_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>  *
>
>     igt@fbdev@eof:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@fbdev@eof.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@fbdev@eof.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582>)
>         +1 other test skip
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_ccs@suspend-resume.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_create@create-ext-set-pat.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>  *
>
>     igt@gem_ctx_exec@basic-close-race:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-mtlp-6/igt@gem_ctx_exec@basic-close-race.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@gem_ctx_exec@basic-close-race.html>
>         (i915#13562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562>)
>  *
>
>     igt@gem_ctx_isolation@preservation-s3:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@gem_ctx_persistence@hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_ctx_persistence@hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@gem_ctx_persistence@hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb4/igt@gem_ctx_persistence@hang.html>
>         (i915#1099
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html>
>         (i915#5882
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882>)
>         +7 other tests skip
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390>)
>  *
>
>     igt@gem_exec_balancer@bonded-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html>
>         (i915#4771
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-9/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@sliced:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_exec_balancer@sliced.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_fence@submit:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_exec_fence@submit.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gem_exec_fence@submit.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_flush@basic-uc-prw-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-before-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_exec_params@rsvd2-dirt.html>
>         (i915#5107
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107>)
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +8 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-wc-read-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_schedule@reorder-wide:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_suspend@basic-s3:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@gem_exec_suspend@basic-s3.html>
>         (i915#13196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196>
>         / i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_fence_thrash@bo-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@gem_fence_thrash@bo-copy.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +2 other tests skip
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-multi:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@gem_lmem_swapping@parallel-multi.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@gem_lmem_swapping@verify.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap@pf-nonblock:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_mmap@pf-nonblock.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +4 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-small-bo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +12 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-small-copy-odd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy-odd.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-write-read-distinct:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@gem_mmap_gtt@basic-write-read-distinct.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_offset@clear-via-pagefault:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@gem_mmap_offset@clear-via-pagefault.html>
>         (i915#14809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809>)
>         +1 other test abort
>  *
>
>     igt@gem_mmap_wc@read-write-distinct:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@gem_mmap_wc@read-write-distinct.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap_wc@set-cache-level:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_mmap_wc@set-cache-level.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1850
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1850>)
>  *
>
>     igt@gem_mmap_wc@write-gtt-read-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@gem_mmap_wc@write-gtt-read-wc.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_partial_pwrite_pread@reads:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_partial_pwrite_pread@reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@write-display:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pread@self:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_pread@self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +2 other tests skip
>  *
>
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_pxp@hw-rejects-pxp-context:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html>
>         (i915#13398
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398>)
>  *
>
>     igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test timeout
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +6 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         +303 other tests skip
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@writes:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_tiled_pread_pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_tiled_pread_pwrite.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_workarounds@suspend-resume:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_workarounds@suspend-resume.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@gem_workarounds@suspend-resume.html>
>         (i915#15152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152>)
>  *
>
>     igt@gen9_exec_parse@cmd-crossing-page:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gen9_exec_parse@cmd-crossing-page.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@gen9_exec_parse@cmd-crossing-page.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +3 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@all-busy-idle-check-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-idle-check-all.html>
>         (i915#14123
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123>)
>  *
>
>     igt@i915_drm_fdinfo@busy-check-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html>
>         (i915#11527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>)
>         +5 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@busy-check-all@ccs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@i915_drm_fdinfo@busy-check-all@ccs0.html>
>         (i915#11527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>)
>         +6 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@busy-check-all@vecs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@i915_drm_fdinfo@busy-check-all@vecs0.html>
>         (i915#11527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>)
>         +7 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@virtual-busy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@i915_drm_fdinfo@virtual-busy.html>
>         (i915#14118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118>)
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_rpm@system-suspend:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@i915_pm_rpm@system-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-19/igt@i915_pm_rpm@system-suspend.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +4 other tests dmesg-warn
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562>)
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-snb1/igt@i915_pm_rps@reset.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb4/igt@i915_pm_rps@reset.html>
>         (i915#13729
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729>
>         / i915#13821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@i915_pm_rps@thresholds-idle.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle-park:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-park.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@i915_suspend@basic-s3-without-i915.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>       o shard-tglu: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>
>         / i915#7443
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443>)
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@intel_hwmon@hwmon-write.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (i915#12454
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454>
>         / i915#12712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712>)
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (i915#12761
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761>)
>         +1 other test incomplete
>  *
>
>     igt@kms_async_flips@crc:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_async_flips@crc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_async_flips@crc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +49 other tests skip
>  *
>
>     igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +26 other tests dmesg-warn
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         +13 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         +52 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +36 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +124 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +64 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +14 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-3.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +12 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +164 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +24 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +43 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html>
>         (i915#13781
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +10 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +9 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_frames@vga-frame-dump:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_color@ctm-0-75:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_color@ctm-0-75.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_color@ctm-0-75.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_color@ctm-blue-to-red:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_content_protection@atomic.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_content_protection@content-type-change.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-3.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_content_protection@lic-type-1.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_content_protection@srm.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x42:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +5 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +4 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +2 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +4 other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>         +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         +6 other tests skip
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +21 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         (i915#8812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         (i915#8812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         +1 other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_feature_discovery@dp-mst.html>
>         (i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_feature_discovery@dp-mst.html>
>         (i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +9 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +6 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-interruptible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (i915#8810
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html>
>         +30 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +11 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         +61 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +27 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +6 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_invalid_mode@zero-vdisplay:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_panel_fitting@legacy.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_pipe_crc_basic@read-crc:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pipe_crc_basic@read-crc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pipe_crc_basic@read-crc.html>
>         (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-19/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>  *
>
>     igt@kms_plane@planar-pixel-format-settings:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9581
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (i915#13026
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026>)
>         +1 other test incomplete
>  *
>
>     igt@kms_plane@plane-panning-top-left:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane@plane-panning-top-left.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html>
>         (i915#12178
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178>)
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html>
>         (i915#7862
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862>)
>         +1 other test fail
>  *
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7294
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-x:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-x.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#14104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104>)
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#3361
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html>
>         (i915#14419
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>
>         / i915#6805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_properties@plane-properties-legacy:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_properties@plane-properties-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html>
>         (i915#11521
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@fbc-pr-basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_psr@fbc-pr-basic.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-move:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_psr@fbc-psr-sprite-plane-move.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +19 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_psr@fbc-psr2-sprite-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +21 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr@fbc-psr2-suspend.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-render:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@kms_psr@psr-cursor-render.html>
>         +130 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +13 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_selftest@drm_framebuffer:
>
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@kms_selftest@drm_framebuffer.html>
>         (i915#13179
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>)
>         +1 other test abort
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-downscale:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>  *
>
>     igt@kms_sharpness_filter@filter-toggle:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_sharpness_filter@filter-toggle.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#10959
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html>
>         (i915#12276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@kms_vrr@flipline.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_vrr@flipline.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_vrr@max-min.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@panthor/panthor_vm@vm_create_destroy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@panthor/panthor_vm@vm_create_destroy.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@panthor/panthor_vm@vm_unbind:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@panthor/panthor_vm@vm_unbind.html>
>         (i915#15241
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15241>)
>  *
>
>     igt@perf@blocking@0-rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@perf@blocking@0-rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@perf@blocking@0-rcs0.html>
>         (i915#10538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538>)
>         +1 other test fail
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@perf@mi-rpc.html>
>         (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>  *
>
>     igt@perf_pmu@frequency@gt0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@perf_pmu@frequency@gt0.html>
>         (i915#12549
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549>
>         / i915#6806
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806>)
>         +1 other test fail
>  *
>
>     igt@perf_pmu@most-busy-check-all:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>         +1 other test fail
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
>
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>         +10 other tests fail
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_eio@in-flight-suspend.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_eio@in-flight-suspend.html>
>         +20 other tests pass
>  *
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         +1 other test pass
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>  *
>
>     igt@i915_pm_freq_api@freq-suspend@gt0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#13820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         +1 other test pass
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-dg2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-8/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>  *
>
>     igt@i915_suspend@basic-s2idle-without-i915:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html>
>         +3 other tests pass
>  *
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html>
>  *
>
>     igt@kms_addfb_basic@addfb25-bad-modifier:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_addfb_basic@addfb25-bad-modifier.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_addfb_basic@addfb25-bad-modifier.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test pass
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#14857
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14857>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test pass
>  *
>
>     igt@kms_color@ctm-negative:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_color@ctm-negative.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_color@ctm-negative.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html>
>         +5 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html>
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@plain-flip-ts-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip@plain-flip-ts-check.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip@plain-flip-ts-check.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@basic.html>
>         +6 other tests pass
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-8/igt@kms_hdr@bpc-switch.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_hdr@bpc-switch.html>
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_invalid_mode@bad-hsync-start.html>
>         +1 other test pass
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html>
>  *
>
>     igt@kms_lease@lease-invalid-plane:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_lease@lease-invalid-plane.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_lease@lease-invalid-plane.html>
>         +47 other tests pass
>  *
>
>     igt@kms_plane@plane-panning-bottom-right:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right.html>
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7294
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-basic.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html>
>         +3 other tests pass
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html>
>         +3 other tests pass
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>  *
>
>     igt@kms_properties@crtc-properties-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html>
>         (i915#11521
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_properties@crtc-properties-legacy.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@large-ctrl-surf-copy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html>
>         (i915#13008
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html>
>         (i915#13008
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_ctx_sseu@engines.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_ctx_sseu@engines.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@parallel:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_balancer@parallel.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_exec_balancer@parallel.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture-invisible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6344
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#6344
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>  *
>
>     igt@gem_exec_reloc@basic-gtt-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +12 other tests skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_lmem_swapping@parallel-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +5 other tests skip
>  *
>
>     igt@gem_media_vme:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_media_vme.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>  *
>
>     igt@gem_pwrite@basic-self:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_pwrite@basic-self.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pwrite@basic-self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_pwrite_snooped:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pwrite_snooped.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_pwrite_snooped.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +5 other tests skip
>  *
>
>     igt@gem_pxp@create-regular-context-1:
>
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@gem_pxp@create-regular-context-1.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_pxp@create-regular-context-1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_pxp@hw-rejects-pxp-buffer:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html>
>         (i915#15138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15138>)
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +3 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-start-far:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +5 other tests skip
>  *
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#5723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +2 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +8 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cdclk@mode-transition.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +5 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +7 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-7/igt@kms_content_protection@lic-type-0.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_content_protection@lic-type-0.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_content_protection@mei-interface.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_content_protection@mei-interface.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-11/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#7162
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_content_protection@uevent.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_content_protection@uevent.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-64x21:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +6 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#11190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         +13 other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-14/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip@2x-plain-flip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_flip@2x-plain-flip.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1849
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +5 other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#12388
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#12394
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#12394
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>
>         / i915#4816
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070>
>         / i915#4816
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#12916
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_psr@psr2-sprite-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +13 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_sharpness_filter@filter-tap:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_sharpness_filter@filter-tap.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_sharpness_filter@filter-tap.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (i915#15232
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232>)
>         +2 other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (i915#12276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vrr@lobf.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@panthor/panthor_query@query:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@panthor/panthor_query@query.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@panthor/panthor_query@query.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +21 other tests skip
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@prime_vgem@basic-write.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@bind-unbind-vf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8614 -> IGTPW_14021
>
> CI-20190529: 20190529
> CI_DRM_17514: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14021: 14021
> IGT_8614: 8614
>
--------------Wtrb7oEoOR94g0Bgr5406gM7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Failures seem unrelated.</p>
    <p>-shekhar</p>
    <div class="moz-cite-prefix">On 11/9/2025 3:14, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176263828382.33229.14016251192424322404@10055242dc62">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Introduce NVL-S and CRI platforms (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/157121/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/157121/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8614_full -&gt; IGTPW_14021_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_14021_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_14021_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 10)</h2>
      <p>Missing (1): shard-dg2-set2 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_14021_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@panthor/panthor_gem@bo_create:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@panthor/panthor_gem@bo_create.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@panthor/panthor_vm@vm_unbind:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@panthor/panthor_vm@vm_unbind.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@semaphore-busy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@perf_pmu@semaphore-busy.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between IGT_8614_full and
        IGTPW_14021_full:</p>
      <h3>New IGT tests (42)</h3>
      <ul>
        <li>
          <p>igt@gem_ctx_exec@basic-process:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-write:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@busy-accuracy-2:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@busy-check-all:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@cold-reset-bound:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@connector-properties-legacy:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@cursora-vs-flipa-atomic:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@enable-disable:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@fbc-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@fbc-psr2-sprite-render:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@fbcpsr-rgb101010-draw-mmap-cpu:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@flip-vs-panning:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@full:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@hw-rejects-pxp-context:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@info:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@invalid-query-illegal-handle:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@invalid-single-wait-unsubmitted:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@kms:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@lease-invalid-connector:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@missing-ccs-buffer-y-tiled-ccs:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@multi-wait-for-submit-signaled:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@object-reloc-keep-cache:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@psr-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@query-topology-kernel-writes:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@reset-signaled:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@short-flip-after-cursor-atomic-transitions:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@system-suspend-idle:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@test_reprime:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@torture-move:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@etime-multi-wait-for-submit-unsubmitted:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@invalid-set-no-zeromap:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@plane-position-covered:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@verify-pxp-stale-buf-optout-execution:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@wait-forked-busy:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_14021_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@eof:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@fbdev@eof.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@fbdev@eof.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582" moz-do-not-send="true">i915#2582</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-process:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-threads:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_create@create-ext-set-pat.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562" moz-do-not-send="true">i915#8562</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-close-race:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-mtlp-6/igt@gem_ctx_exec@basic-close-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@gem_ctx_exec@basic-close-race.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562" moz-do-not-send="true">i915#13562</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb4/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099" moz-do-not-send="true">i915#1099</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882" moz-do-not-send="true">i915#5882</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390" moz-do-not-send="true">i915#13390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771" moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-9/igt@gem_exec_balancer@parallel-contexts.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@sliced:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_exec_balancer@sliced.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@smem0:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334" moz-do-not-send="true">i915#6334</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@submit:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_exec_fence@submit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gem_exec_fence@submit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-prw-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-before-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_exec_params@rsvd2-dirt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107" moz-do-not-send="true">i915#5107</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gem_exec_reloc@basic-write-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@reorder-wide:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s3:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@gem_exec_suspend@basic-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196" moz-do-not-send="true">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@gem_fence_thrash@bo-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +3 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-multi:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@gem_lmem_swapping@parallel-multi.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@gem_lmem_swapping@verify.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@pf-nonblock:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_mmap@pf-nonblock.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-small-bo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy-odd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@gem_mmap_gtt@basic-write-read-distinct.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_offset@clear-via-pagefault:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@gem_mmap_offset@clear-via-pagefault.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809" moz-do-not-send="true">i915#14809</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@read-write-distinct:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@gem_mmap_wc@read-write-distinct.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@set-cache-level:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_mmap_wc@set-cache-level.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1850" moz-do-not-send="true">i915#1850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@gem_mmap_wc@write-gtt-read-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@gem_partial_pwrite_pread@reads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@write-display:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-display.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@self:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_pread@self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@hw-rejects-pxp-context:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398" moz-do-not-send="true">i915#13398</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-on:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-on.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html" moz-do-not-send="true">SKIP</a> +303 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-sync:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323" moz-do-not-send="true">i915#3323</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gem_userptr_blits@dmabuf-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_workarounds@suspend-resume.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@gem_workarounds@suspend-resume.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152" moz-do-not-send="true">i915#15152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +4 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +3 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-idle-check-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123" moz-do-not-send="true">i915#14123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@busy-check-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@busy-check-all@ccs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@i915_drm_fdinfo@busy-check-all@ccs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@i915_drm_fdinfo@busy-check-all@vecs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@virtual-busy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@i915_drm_fdinfo@virtual-busy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118" moz-do-not-send="true">i915#14118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@i915_pm_rpm@system-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-19/igt@i915_pm_rpm@system-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562" moz-do-not-send="true">i915#13562</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-snb1/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb4/igt@i915_pm_rps@reset.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729" moz-do-not-send="true">i915#13729</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821" moz-do-not-send="true">i915#13821</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@i915_pm_rps@thresholds-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle-park:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@i915_pm_sseu@full-enable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387" moz-do-not-send="true">i915#4387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443" moz-do-not-send="true">i915#7443</a>)</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454" moz-do-not-send="true">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712" moz-do-not-send="true">i915#12712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761" moz-do-not-send="true">i915#12761</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_async_flips@crc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_async_flips@crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +49 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_atomic@atomic-plane-damage@pipe-a-hdmi-a-2.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +26 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +13 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> +52 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +36 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +124 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +64 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +164 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +43 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781" moz-do-not-send="true">i915#13781</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@vga-frame-dump:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-128x42:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x32:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809" moz-do-not-send="true">i915#9809</a>) +1 other test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +21 other tests
              skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707" moz-do-not-send="true">i915#13707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812" moz-do-not-send="true">i915#8812</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812" moz-do-not-send="true">i915#8812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337" moz-do-not-send="true">i915#9337</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337" moz-do-not-send="true">i915#9337</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +9 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-interruptible:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send="true">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> +30 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +11 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> +21 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> +61 other tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104" moz-do-not-send="true">i915#15104</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104" moz-do-not-send="true">i915#15104</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-vdisplay:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826" moz-do-not-send="true">i915#8826</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@read-crc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pipe_crc_basic@read-crc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pipe_crc_basic@read-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190" moz-do-not-send="true">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-19/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@planar-pixel-format-settings:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581" moz-do-not-send="true">i915#9581</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026" moz-do-not-send="true">i915#13026</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-top-left:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane@plane-panning-top-left.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825" moz-do-not-send="true">i915#8825</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178" moz-do-not-send="true">i915#12178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862" moz-do-not-send="true">i915#7862</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294" moz-do-not-send="true">i915#7294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821" moz-do-not-send="true">i915#8821</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-x:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259" moz-do-not-send="true">i915#14259</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343" moz-do-not-send="true">i915#12343</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104" moz-do-not-send="true">i915#14104</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295" moz-do-not-send="true">i915#9295</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361" moz-do-not-send="true">i915#3361</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295" moz-do-not-send="true">i915#9295</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281" moz-do-not-send="true">i915#4281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-idle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419" moz-do-not-send="true">i915#14419</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805" moz-do-not-send="true">i915#6805</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_properties@plane-properties-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521" moz-do-not-send="true">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>)</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-snb6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@kms_psr@fbc-pr-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-3/igt@kms_psr@fbc-psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-6/igt@kms_psr@fbc-psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr@fbc-psr2-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_psr@pr-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-render:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk10/igt@kms_psr@psr-cursor-render.html" moz-do-not-send="true">SKIP</a> +130 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_framebuffer:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk9/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179" moz-do-not-send="true">i915#13179</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_sharpness_filter@filter-scaler-downscale.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-toggle:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_sharpness_filter@filter-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959" moz-do-not-send="true">i915#10959</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276" moz-do-not-send="true">i915#12276</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-5/igt@kms_vrr@flipline.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808" moz-do-not-send="true">i915#8808</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_vrr@flipline.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243" moz-do-not-send="true">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-glk5/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@panthor/panthor_vm@vm_create_destroy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-7/igt@panthor/panthor_vm@vm_create_destroy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@panthor/panthor_vm@vm_unbind:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-mtlp-7/igt@panthor/panthor_vm@vm_unbind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15241" moz-do-not-send="true">i915#15241</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@blocking@0-rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@perf@blocking@0-rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@perf@blocking@0-rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538" moz-do-not-send="true">i915#10538</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@mi-rpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@perf@mi-rpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434" moz-do-not-send="true">i915#2434</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@frequency@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@perf_pmu@frequency@gt0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549" moz-do-not-send="true">i915#12549</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806" moz-do-not-send="true">i915#6806</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-check-all:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349" moz-do-not-send="true">i915#4349</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910" moz-do-not-send="true">i915#12910</a>) +10 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">PASS</a> +20 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820" moz-do-not-send="true">i915#13820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-8/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s2idle-without-i915:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_addfb_basic@addfb25-bad-modifier.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-16/igt@kms_addfb_basic@addfb25-bad-modifier.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956" moz-do-not-send="true">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14857" moz-do-not-send="true">i915#14857</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-negative:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_color@ctm-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_color@ctm-negative.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190" moz-do-not-send="true">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip@plain-flip-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip@plain-flip-ts-check.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-8/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826" moz-do-not-send="true">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_invalid_mode@bad-hsync-start.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@lease-invalid-plane:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_lease@lease-invalid-plane.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_lease@lease-invalid-plane.html" moz-do-not-send="true">PASS</a> +47 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825" moz-do-not-send="true">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294" moz-do-not-send="true">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@crtc-properties-legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521" moz-do-not-send="true">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_properties@crtc-properties-legacy.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078" moz-do-not-send="true">i915#11078</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@large-ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008" moz-do-not-send="true">i915#13008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008" moz-do-not-send="true">i915#13008</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-process:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-threads:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_ctx_sseu@engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_ctx_sseu@engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-args:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-out-fence:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334" moz-do-not-send="true">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334" moz-do-not-send="true">i915#6334</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344" moz-do-not-send="true">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344" moz-do-not-send="true">i915#6344</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gem_lmem_swapping@parallel-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_vme:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284" moz-do-not-send="true">i915#284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284" moz-do-not-send="true">i915#284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-self:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_pwrite@basic-self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gem_pwrite@basic-self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite_snooped:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@gem_pwrite_snooped.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_pwrite_snooped.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-context-1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@gem_pxp@create-regular-context-1.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_pxp@create-regular-context-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15138" moz-do-not-send="true">i915#15138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@create-destroy-unsync:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-far:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723" moz-do-not-send="true">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723" moz-do-not-send="true">i915#5723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531" moz-do-not-send="true">i915#9531</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-7/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-11/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-11/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162" moz-do-not-send="true">i915#7162</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-7/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_cursor_edge_walk@256x256-top-bottom.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190" moz-do-not-send="true">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> +13 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-14/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849" moz-do-not-send="true">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394" moz-do-not-send="true">i915#12394</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394" moz-do-not-send="true">i915#12394</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816" moz-do-not-send="true">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070" moz-do-not-send="true">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816" moz-do-not-send="true">i915#4816</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152" moz-do-not-send="true">i915#8152</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281" moz-do-not-send="true">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281" moz-do-not-send="true">i915#4281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916" moz-do-not-send="true">i915#12916</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_psr@psr2-sprite-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-tap:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_sharpness_filter@filter-tap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_sharpness_filter@filter-tap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232" moz-do-not-send="true">i915#15232</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276" moz-do-not-send="true">i915#12276</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-5/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920" moz-do-not-send="true">i915#11920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-5/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@panthor/panthor_query@query:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-7/igt@panthor/panthor_query@query.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@panthor/panthor_query@query.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-6/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-3/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@bind-unbind-vf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8614/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14021/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8614 -&gt; IGTPW_14021</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_17514: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_14021: 14021<br>
        IGT_8614: 8614</p>
    </blockquote>
  </body>
</html>

--------------Wtrb7oEoOR94g0Bgr5406gM7--
