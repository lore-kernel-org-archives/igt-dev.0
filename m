Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8203606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P7YgC0yg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cHbSDU4c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C76310E3BF;
	Mon, 16 Nov 2026 14:11:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B8710ED49
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794838251; x=1826374251;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=Ap3o1bqaBGsnH1NHWMrgav6T2o5rAO5tM2rCSQQ+myk=;
 b=P7YgC0ygpy/+c1Pwhl0mfz97S52K42DSGHwBnNC5m0FDGW2/PaMzRRsW
 huFGsUUogxre9xEeJq/ftTwLPcuqWuhrVRpV92hOhAyxzXCk3wGxAmmBE
 galS7FVZ/cKcKKdjv/d90uckbgut5FFmwdb1cOfSOZOlb0PA/GlTvPDSv
 mCHleft/d2hbuEZ2zQwHqS2gJ+r7+lj5YGHrAkBDljlLQRACWhgBf+u7s
 X9Iog6hjEbBSZTWQGbiX1UVWfhwbQeKHZcHD4Vn/HDNgeH870Axib4/2g
 WQ4oHbXkc7CDCWwJjoW5OxyEO0YDaBjfR6YyjRP28N/maZUOAwn71Rlk3 g==;
X-CSE-ConnectionGUID: yUsqmcLORGmbCHIMPdY8sA==
X-CSE-MsgGUID: B9pPOVUORm6qBYl6wDXZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3468528"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3468528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:10:50 -0800
X-CSE-ConnectionGUID: NemUN1AvQHCgmUgHDLrrtg==
X-CSE-MsgGUID: 8+1OJzI0SAG1cGZ/NZV6Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9394995"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:10:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 06:10:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 06:10:49 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 06:10:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSid/h+nQRdeGf4O5s4nIUmPYMv03OO+IGlryiwOYzOJuwQ6nNM6xtNH0SgIS5FqlnuOjsJo5aPBIVeUQFetzYl22GZ1ULjrHn4XmqAV/WiRCyucMfMkK5yo5gVwwEfjGCx3FAt2O+o+FUV2GhsfzLPUJo0GX505SLVzGx3HBLnu79uT1O7mOmOewRaxJ3CnzUFC/WhoJZwg5CZUzwS0eZcqgkCJ+YwMhbmIGb6ezkHriCh/8SRcAxzrMOe4OJsGkZIZ+pSRZiVAf7i865E6d9GJTIGsVPjprw5j8tMipnGHMm3zUCCSYDME+1G5sJcoFxSytpfMYYynJ9BEF4AfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap3o1bqaBGsnH1NHWMrgav6T2o5rAO5tM2rCSQQ+myk=;
 b=zIqoYP9Vy0p5y7LK4cilQAlifwFU6hpkdJ6kuFq5081YfiO1js2HIa7aB88hDMR6wrLU/6Kd1VXhdTii5FP2MnTl6uTtlejXVuPZrzR9BaREWx1Duq27SWPQJLZ59D6D2CHJvWjBDmwh1rYscO8GbkSFz+liYkN9cSt7wDuBrgQ6msORsjPb35Hwr1atmqboXyatfhVWVi/FxB9VpKX+srfVdvByMcvWJjId7gzKf78UBJmtGfh+T8uE+kH1zm9+9ly5hVcnv4b5RawO6tX0B1kue+gqtwfPpuqsc6FZsAD5C1u4UcIgtyI/3xTMoOa/lbLKGP9dceX3GE0Z/zhMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap3o1bqaBGsnH1NHWMrgav6T2o5rAO5tM2rCSQQ+myk=;
 b=cHbSDU4czfZyrU05saUGJmBCu/QDxlKdXkw5KmZuFlgetWtWgJ7CSQ3k2GbV5mteM9EXWvx7OWB8+KnEBB1r23lmTu0g9QvKt5tF/gIwheh3mJVgUvqxjwyO+EABXVY+t6CSjQyhyWrTysOf/2ex47leokV/dB8mEACUaOdtAQo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:08:46 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 14:08:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:08:41 +0100
Message-Id: <DMWP0I645887.2Q76X4BMEX4VP@intel.com>
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
X-Mailer: aerc 0.22.0
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
 <e78e82ea-3cc3-4b22-b5e0-f7c57abfbc0d@ursulin.net>
In-Reply-To: <e78e82ea-3cc3-4b22-b5e0-f7c57abfbc0d@ursulin.net>
X-ClientProxiedBy: VIZP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::9) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 14229819-2b6f-4581-5410-08df43eb20e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UTKpbXN1k9JNF1eoKSP6q15MRilov3Dw5GaCq/oZrTlhfPtgZgsB+xM/sHUBikg+yOi/lwXnv4rnKQ6u/v8dNcq8OuH/qeUR4XlT0Su9B2ZkTbvbVIRWKvaArYJSBspivBpoZXDvv9lGG649EIGIAv+GCn1W+Mjy+TCI28ghGkTPU19a+AyoSNsRVQAaTAHTgkR9aolYQaN0FyeQ5dVtoj6ivu1lVAiR5VKWpq2VOi80EdCE6WP5s/tLCqsLGaPBxbBum6M6txmYK6mxighS9Ep066Lo2W0UXMLQ47LMw0c9iiVjNZWTYsaCuCrCBiFFoYxT3u+GhRBNGOLfwoIr7MQ8DRbVI7GGV0OOpB245Ej66qw0m8I7vd8gHu0fRilrq5Awfu7dt+Cg6XK7m16gHqr0+zlLS8G93DGY5h1po3FPPuVx5hzY+3o2F3/Bz44xSgHM8GOWVLhQPJtbWJgBw2RX4VHvAX9vXfcOE55xFoQYXaWTiCAnMG+nARxAg+JXNYN+H25ny4wPl/pQX+xyTu39kk2Zo07FFoDSUJtu9skHuQIppzppiekjl8UODPvP0DRS/8ZoDn6eJ2LX3+AF9kv05kKFSrH5rcPe9Ptfj8bbueyDBv+X6XnVU48V8mbWKpriKw1SgFS7xh7UMUBhQFpTklPUxy5AXK24Opzo+qY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUdFNzE1TlR5U3VhQjQ2MDJSU1IyTWJXcWttMlZBK3hXeGlNYTRqN3MzdG1r?=
 =?utf-8?B?TktLc2g2Tm1xQXRuL21lNHV3K3RnamJHd1FqNXpDSnVMV3EycWQwSUVwOFBa?=
 =?utf-8?B?eGpZeDFXYWZFcUIxdm9QS1NpTldDdHREOGxxeVcvZkZudlA3akxKd1lsb1ZE?=
 =?utf-8?B?QWVJKzZ2d20vcW5uUnRWa0hLYUlnejlGbHVOUHNTanBCemFuMTBaWXRnWHl0?=
 =?utf-8?B?c2tuNjFVTnpHZ0dHRUdtWk9ZK3N0amkxZXlsM3c0SlFrQmxQWXF1WDF3ZHc3?=
 =?utf-8?B?eityU3hWSWt4dVNrZW4rNTd6YUVuOVpSVEZUcFZwSFVUejU1d05md2tFL0xK?=
 =?utf-8?B?U3ZUTThqTFV5QWg5S0RXbTB2NDdjTEY2RnpXYzlqYVhTR0NQdmYvbjdjZW9v?=
 =?utf-8?B?QkZBS1ZiNE5heUZZeEFMRjVXZkxicSt0cVNKRDU3MUQrQmlUbFBvNDI2THkw?=
 =?utf-8?B?Wk1tTUNnVlFYWVJnQ2VQUEkrb2VVL2RwRWJwQUVlb3MvQkljK3l4NG9Rd3JM?=
 =?utf-8?B?UjZ2aFlDb2E3WVlrYXpsQVUyMlA4aDRQZ1o1dHRDcWZ3VWpuNFZDKzVRVTVH?=
 =?utf-8?B?ODdDcnhJSXM0YTZVWTRaa0hCNGw0RGdrOWkrcmM0dHdBSDBnNnRDK0FLc1Y3?=
 =?utf-8?B?U3E0dlVVdEdlcUJuL0MwL0ZPZC96VDVXYnYvSUlhTnp1RkZZbk9hVVMzeVpz?=
 =?utf-8?B?dHNtcVYwbGZCZDNTZTQ3TVcyRlpVRERKdmUyaGh4bFJUcThPQlVOeVBZQ2pK?=
 =?utf-8?B?WDl0d2JiQVlCWXZaQlpqVVZwZ2dRVUczaXptQjVhM1VSYSt4NjdVZkpDV3VV?=
 =?utf-8?B?ZlRhcUgyS25FSXhjUnhGL3JjTVR3OWxyZnRha1k0QXQyT091Nk5zVHlzdWxP?=
 =?utf-8?B?OUxsVnhEcTJud0ZZREgzOFpuNlBCWjhieFZUK2lFcjljZHVydjhSNXJqcGdz?=
 =?utf-8?B?STdhanowaVJhc0Z2a2xwUU5jeXpTRkgrbkg5RnpzemtyVWxrR0hFWUxRVElJ?=
 =?utf-8?B?RWZYMDNJajF6RzhTTnRBRlJDMmxSdkk0VzVzZlhTM2lXRFY1ZDF5ZWIwZFFV?=
 =?utf-8?B?QndjaENleUFjNkQyK3pLZTlackx3TWpzd3ZLektOUVl1b1Vka04wS3hrdGJU?=
 =?utf-8?B?WEg3VHdaSFVwYjhiWnZrdXd5VDdTRXFGWFpsK1YvYm5TT1kxaHZlZ2hyb1ZB?=
 =?utf-8?B?d2ZaNVBvcXZvZjdFUFN4S21HSWIzeUhlUEFqNE15TDhSTjl2RjFLbGNDZVVo?=
 =?utf-8?B?elVzKzFCUXYrOFNtNHFpVVkwTk5HRUR4TFVJMlkyck5oUEU4R0ZWbEtpS2VE?=
 =?utf-8?B?RklNc0NaRGVxREo1d2xOWHpsZmx4Z1JnNVBwTzRqWTFoeHpkTGNxL1ErQnAz?=
 =?utf-8?B?dGNnNUNGN3FpM2ZhZ1lNUlZKR1Q4SWg5OUgwcGhvdU5tVDNXWmNLcDZNYkZa?=
 =?utf-8?B?a0l3eGdRWUQ2MGcrOS83YTVHdHBwYnIvWGR4N25GdVZOaEwrWDVtQ2xNLzFJ?=
 =?utf-8?B?UWh0VmIzZmdiMllCdjE4RmFpemRoRHQ4a2xiSzdGbXJPTEY3bnpXN3VZMURj?=
 =?utf-8?B?TkViOFFESkR2eXU0R2txenVLaHR1ZnJOWTl6SjhqUHJ5SE9QNG9hNVZVaC90?=
 =?utf-8?B?UmQ2RXZLVThOc2RxN0VVQVk2Zm9HQmFoRW9ybUpERWhoRUgyMkJ0MTdRME95?=
 =?utf-8?B?NW9rTmpCVWtWN2lIcEd5UmJLcEt6TGJabTlLTmw0V2dxb2UvZkk5OTJuUHNu?=
 =?utf-8?B?SUdIb25HTlMxZks0Z2NvcW5nZjY3Qi95NFdwVXVzOFZmeXExQlRidTgxUWdk?=
 =?utf-8?B?dUN0N1NPMk5TWWVJMGp5enQ5RHpTRUkzMG5Cdzd2b29BeHpCek5yajFXdllj?=
 =?utf-8?B?RjJIM0R0VVEyT3ovdjd3VjJ1YXVZeklUSFhKMkNaTjhTQVE5TmQ2Q0QxVEN1?=
 =?utf-8?B?SWgyaEZFZ1JGekpFZmRhUEhFNWlZbGszU1c3dzNhQXJPUUwzbjNYK2lPVXMr?=
 =?utf-8?B?M0UrQVNJeGordUN6L3dOcnpmeFJJT1M0YnJWeEczVkMyNkxCcEZQNlVPVGwz?=
 =?utf-8?B?cWsvYWdvbXcwbG02Tk9TQTREMi9DVjJCQ1N6bSs0ZnovRHhOMjYxL1BMV1o1?=
 =?utf-8?B?azk1NUlreU00bVZnQTczZnpPNWIvZ0RaTDR5bS83aXgwbzdvRGRRcTFHUmV2?=
 =?utf-8?B?alA5Vk9KTC80VlBvdk05S3dDdmZZaS9TYnEvQVpadnRqd3FLeTJhM3JjZEhZ?=
 =?utf-8?B?Ylk1bWJUb2VLbVBmemM3bVUxYzZrdlcraWNmWXNzVXpjSFBWQjJ3a0hrdE1p?=
 =?utf-8?B?U1hkQnl3cy9yemtDT3dYQnBHQUMrNWpiOVQvZnJ0dC9KTUpRMTFpZWIzVHZ5?=
 =?utf-8?Q?0/sCF7pRT4f0Cla8=3D?=
X-Exchange-RoutingPolicyChecked: DRFqp6N2V+9BPWX851vfBoZ3tj76IU3mArSZJ92tZF0sM+bsp7DyYehp3q1nlurYKRI4RiHsuGVvxEkCEFJifzHQ7re+eKKN4whVxSY29RKzUBbFmBpnzPfqz5g8ThdOcSR4skn4bBkLCrKA/zBSx0O3qET4jg3zu20e4xBAs+t1yAoLzfGpEZtCY8RMyLp9yfhhMgi6SEVYti7zzBv7zXpjaDY4YqLN+ljs277Duls/scGgwS/Rbf0eKIATrQz3zWeHTgzPu+8B3G6XI/N2dkaAbFAt4NsKuVYay1CH80xLXyROUFPx+oCUDHNV++u5GStTBsR3JeAoNLsfGYXj5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14229819-2b6f-4581-5410-08df43eb20e6
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:08:45.9347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQdixo71TcA+nfJhsUkySsF4w1in1pYIxdmUPuljp4Rd4FU4n7PDlR/+z7+SC8HWRgYuv5D+qdUreQ7A7oEixXgedldcu9UbekLBDLhtHg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri Oct 2, 2026 at 10:59 AM CEST, Tvrtko Ursulin wrote:
>
> On 25/09/2026 11:57, Sebastian Brzezinka wrote:
>> Add an i915 backend for gputop's PMU-based engine monitoring,
>> implementing the device_operations interface from utils.h.
>>=20
>> i915_populate_engines() opens the render node (no DRM master needed),
>> scans /sys/bus/event_source/devices/<dev>/events/ for "*-busy" entries,
>> and decodes engine class/instance from the PMU config value.
>>=20
>> i915_pmu_init() opens a perf event group via igt_perf_open_group()
>> (requires CAP_PERFMON or root) and cleans up FDs on partial failure.
>>=20
>> i915_pmu_sample() reads all counters atomically from the group leader
>> fd into a heap-allocated buffer, and tracks read success explicitly
>> so a failed/short read leaves counters and timestamps unchanged
>> instead of using garbage.
>
> Looks like a bunch of code from intel_gpu_top so instead of duplicating=20
> (be it code or functionality), and since you are making an abstraction=20
> anyway, it would be much better to make it a library both gputop and=20
> intel_gpu_top would use.
>
> Same as I added a library for fdinfo access when adding per client=20
> support to intel_gpu_top and bringing up gputop as a vendor agnostic=20
> demonstration tool. That would seem like a logical route to take and=20
> much better for maintenance to have one copy.
>
> Down the road, once feature parity is achived, intel_gpu_top can become=20
> a symlink to gputop.
>
> Regards,
>
> Tvrtko
>
Quick update: I haven't forgotten your review. I got pulled into the
Sashiko review rabbit hole, and it's taking a bit more time since it's
not high priority.

--=20
Best regards,
Sebastian

