Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091BFEF4EB6
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992F410E18B;
	Mon,  6 Apr 2026 06:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5awIIFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B510E18B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775458764; x=1806994764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQVFBkOZtFFzg/h4md2z09x79EHlfl/QipXzNjzmauM=;
 b=Y5awIIFenHjpm8/avzp3HkqglUGbY9ehAb4r8X7BTx2u7hpxaHCbgfTS
 vaZ8u6SwA/p/MTUiLyE65+QD8qpIhY81t/ErDAqszuDssC/H5s9QpX2Ql
 EnUcEo/bCr+H/HETrRhq4Q9XvhP0suCQJM8B3QN8MKLXjGFd4v5a/vaIK
 sbxmyA3J2CIySKLL4g58aDbZ4iIshQzg43q0yILqqi/fhgqNvDpnNFYqg
 0NzDjhuzl1g+aS8uNh4dnVFE1UkojxBB8SHmnXz8oCu32DQKfQWgP5TRN
 XmxGUKNouPrQtaoagKVLWqUwz3tRYyM9sOmOV5tCMpiJtJJ3ICYFJ3HB3 Q==;
X-CSE-ConnectionGUID: sejqYBmlTl+Tm7dg5TW4Pw==
X-CSE-MsgGUID: N3tBBKHMTYGuSCIPmj4zcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76308081"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76308081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:59:24 -0700
X-CSE-ConnectionGUID: YIlfgWXwRUCSanUryYgYeg==
X-CSE-MsgGUID: fBzybWc1SW6CDymH6VL9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="223007207"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:59:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:59:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 23:59:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 23:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehbsZaX9QYePl7QWjDPsPChIUDSItQqP28hNgaE2D3IjlDY65+VGq2jeNqXxV2p/kPJCpUOGxhpR7Dh/AVlyCKnaLaYTSc+RyeJFT9RWA/J77/9kQKdY5+ItAzqc5yCRMa5czo67QxLarni1/oOI4Rp7R1uHbdbh635wyUn6vF5qFqk9UdXDLcOMFB6AAlI/GLAzLI8Adp+4X/eUZAUo+a7GIhENeWRgXnEtWYTxrnXE6O3L6LuTdMuOrIBaFodVmAi2iJGcY8dhoRj5XK2ccLdi2ZuQF6SbdcfcZ51a5hz/2FAvrikvG1EYhff+PXOJdCXIgOA1DBRANG6mDwBpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DD90GzH4cnHFWylf2uzn+3o/JVHqvNLfIIoCl+1bgU=;
 b=VgYnd1TKOCNiZZqXdVsuBf0CXrvsPUusbktVK1lV69mNm+9dWKjgetgfeHapzQzU+2+InMZFGYzmNJ8GfcTepzRhDYzBlOGdy+Hg/ZL3ref7Alg2arcia8OSFmsX43dhIZLDt9lkhK6H2PSk3MyElhvPaCdeY3YxBUg8e91GOG5dC5Wd3qABWlPc6vYyNCoK6MzCEK341NJKQHseQW8UBVVzggrQlIPXim9CiNsw+2eXWqpmo3UczFx7frgEpyyf8SSuzRe8VX7ltpmcqBhoXc/Z55UuMTuzPpEOaaY6iV5VllstpIkmgWRYPMXFaOcVjGjYAoS6s+v6ywh6VoXccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 06:59:15 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 06:59:15 +0000
Message-ID: <642f2bae-ec32-4071-962f-e5281f85b706@intel.com>
Date: Mon, 6 Apr 2026 12:29:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/9] lib/xe: Add purgeable memory ioctl support
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-3-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::21) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 887efcc9-5f5d-4894-17a3-08de93aa038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 2eFDPu6L3zJ8HTjMnM0dfS17De2/PS0qtQGPpYTvS69cMlK1HIp1XPrJNTfnKOppO6cJIGbRGZIVmtcqf4AnnqPEc1FfX6XXZm2jt9ukkt+InkwGBCmwzjDg+R47Iyi+teZXd4KoJ3O/RavFsO6hwAiSyY1J4RwwBRDi0kL6Jt4NSMFO3Ug6Z+auXAvCyQCTiCAjmcLI9KQJZDn1dRqWhiDM596o7imeGu1hQ94OamlxdVXCwwHmeYtbbTvZnf3OipmYCiZ4eMjs7V3uhvR+ucAv7Rey72dekSE8nbyzL/z7rzBFM438PE6iw99AARaX4IwemoCYwgvAjPCsk6a/zk2IzsEfwoL2CBdfG+cUPO9r79rEM+QW6auyxVgKej+JJgmNOwGg6DQn2/a3ZSy1ZjPWB+xnyMA959thUUq8e9kaXAi/OM5wd1AFOtSy/V7VHJfNokcgfKhkmUIF6R0dqJPUr+W2pgyCnjS5XZFHErTmBE0ON+WPx+Wt0PbqTuD2k5Oqkt8ZAacZXz8pYM+im3rPzPWnhqe9P5rc9jZlCN+5VKhEuGC35YuzUeHQXtN0HV710bJeZ6gnmSeAX+JPk/dh8hnVFKOVtwBb3rlRreCKixm9zEGYgNd7XdSRzzB5maEBogzmHT2lUXItEBm0g8NeMkzSsRJEOoxGEuhnh8l2ieUv81OosAehisVZBT93EuaXzDtpiUGiwy6Izy9n/kWbB1c3/igikImY7M8cn94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU1HVTE2MmpqSDhsdTI2QmYxYnJ2dlByUXk1NlRvNnByMmY2elRINi9VUW9H?=
 =?utf-8?B?dm5IYTZyMUt2NzYxUi9mdWd3NFFERWdaL3F2Rk91UHNHaGdob3MwcGlNR0pK?=
 =?utf-8?B?NE9lcWlsNVlCWGFlWXZKTVNCQy9rN29LRWl3d2Z6cWJXOXpTUWpxQVVBbGVL?=
 =?utf-8?B?cC9qWS9ZNU03ZXJ3Ymg1RElUajIrS0phWWxjZFEvd0hBcU9xT01VZng1cUJt?=
 =?utf-8?B?MGtqaU84M0V3NUxiZGZrRk5VRFB6RXJ6VTlVOVYvcGFZYkJ3d0R2M0ZKTFdy?=
 =?utf-8?B?Q09VUHJ4L05kWkRtc3p1RHlLMUJLQldQbXdSTlBDMVlGOHpZSHVIWjFtd0l5?=
 =?utf-8?B?ZVlNQThYcElram9xS2JaZTdHNnU5OHRYTnVEMUNOR1QrQXFNaElSSGJZNHFs?=
 =?utf-8?B?a0h3UWp1QlhKc0R0dU82UEFQa2FpbXRXek93ZjdhM2tvQm9PbTBUcjhva1Jz?=
 =?utf-8?B?R0Y1NEtDS2VBSnVMaXNpemFURW9VbFhsTEZiQXpvOFMwSnZhTkFGbGVIdzky?=
 =?utf-8?B?cGdWUGpZSVdBZE1lNUlvVmN0S2paZkhNU1VPbXNwWHc4UEZ2QmsxRlpEZDVx?=
 =?utf-8?B?RUVia2RCdWs2bk9zK0VHUkRPSk1QRlJIcFVyM0xPbFc4dWZ0YjdSUjRBQmJi?=
 =?utf-8?B?NG54M1dhMkRKY1FPSmV1dFVtL1QvMVJnQzRUOWU3TXBIemNxSDJjQnAzTFk5?=
 =?utf-8?B?ekNPRGg3V3RWalF3dFBnZXJhQjdIcmJGUWtQYUkrV0xzclRna1MzNmRveGFG?=
 =?utf-8?B?VHRyTitvSjc3ei9EQ2FrSy8xT3gwTFRRQk1aMGd1Rnp4TjVSalV0SllGSWdB?=
 =?utf-8?B?SUlMVFBaSXlFd2s0NzduOUV2bEZQU3JkclpiTG9xUWNEQmFCL1VDdWFsUFB2?=
 =?utf-8?B?OGNBNUdRUEZDRnNROGVtTWU1UlB2NUExRHc2MVdEUVlBUEJwd2FkOHBCNzNq?=
 =?utf-8?B?NFl6WHEzWnlJTEN2dzZyZlJ2Ulh6WHdOaU1rZmdZR1k1dm95ODVDRjZTVEc5?=
 =?utf-8?B?T2Y1RUFXN1kxNEdhU2dGdVVyUGk3YVo5eDlsRGl3bGhTMVpYNDlrSjRUMHd1?=
 =?utf-8?B?dzlWeUIyUlQrZG0vaHNCNlJkajkxVmFZa0k3Uk53VzZuV21CVmhlT3ZidVlq?=
 =?utf-8?B?STBkZ3JkczdNSFhGWHlydWloZEQ1Q0JaOXQ1RXp6Q3V3dnNTOVRYNCtKNWJo?=
 =?utf-8?B?L2p1dmdYYmVhUDRRQVQybmpPZ240WStWWHJVaDg0TEVPU3NNeVQreU9pZ3k4?=
 =?utf-8?B?YUFiV3pGc2huQW5seGw0dTBhK1l6QUFBbzh1Smh2Q2xNZ2EvaXdKWTY4TGRx?=
 =?utf-8?B?ZHRmbC9qY3FSai9BTHYxeS8yd3dDNVZqelArQzRyVmJwVlV1QlQrZURuNG9O?=
 =?utf-8?B?dWFQK0MvOGNEanBhZGI3Y20veGlWaG5tYUQveDZuNSswV0JROFd5YytzdmJR?=
 =?utf-8?B?YnRaSWFQN2NmMUw3YVBQY3hJUHVBMURLbzhDeFk3V3NaUm5FYU9hd3ZIb3d2?=
 =?utf-8?B?N1pjVTlkS2pPcFlVT0tHNXNNSTZIemg3clU0d21QdzYxcSs2YXM2dmhpRmph?=
 =?utf-8?B?K3JNWU5ORkZNSjNEN2o3RmxWcnVWVjJtcUFONGsyOVlUZktEdnlpV005UVBX?=
 =?utf-8?B?QW1JN2VyZHh5cmVXUUhGRklyZHBpWHk4L1o5b3pVMVlqZEltZk4ybE9QbmZq?=
 =?utf-8?B?OElxcGhlQmZmeXBQZWRSUFRHUzJmWDZBYU14ZWdraStFWmprY1I1cGFScWlv?=
 =?utf-8?B?VHV3QkZtbDNiekd1eDVHdFR2T2JpSmdVeFBxeWFEcnpuV1NrOHpIdDlkT2c4?=
 =?utf-8?B?L1ZuWjN1TDhTWmRKenV6OHpibVhvdmZQWVl0a1VmQnQwMGxvdkJob1hzWVdP?=
 =?utf-8?B?ZGIxMERvdXpjYU1DNEdORXd5bUpuUzRER2NCMkZVek9KZzJ5bDJrTFVlQ3g2?=
 =?utf-8?B?b2g2aiswSGdGQVpoWUFhUzhDTktNWjUyT3N2WGJ3c3V4NVd3ZWR2clpTNWg3?=
 =?utf-8?B?bFc1UHdCNVZpZHRCeXhjZTlDaVVhMTJxL0o2SWFsRmJZaWZTeXpHTHZTUmZr?=
 =?utf-8?B?QjBVREVwckV2T3RMWG1yYVV2YnJVZmxCclY1WW5KcE1vQ0VlbzRraTNwZnJw?=
 =?utf-8?B?cXpCem01YzZJVmplaEVxZWRFWFc1TURNQVgxekM2emRjRE5PYW9ZOE1sL05x?=
 =?utf-8?B?REJyNVpnZkxEM0xWWHFLWGtnbFFYeGNrRC9BelZRajZlZElPQXBKdnRzMk1N?=
 =?utf-8?B?b2pxT3BLNVRCc0R6QVl5MjNrUktJa2FpVFJaNlY4TVpSbG9lempqeE9vdkk3?=
 =?utf-8?B?YVAxdmV0VnpYT2daMExlbFVja0s2N2RsaTRMMkhhVlBTd01pbXlRVllKbkVR?=
 =?utf-8?Q?V1hEMr6RHT9Eyf8E=3D?=
X-Exchange-RoutingPolicyChecked: sPEsPTcpG6FcY2InsU4W62HTLVZm1tWhc3eJOUCCR2hmnIxiagxiURjBaYG4dje/Ods5x1GDPocgXI+0euaWrxW+y0Pq7VO3e2hlEPWzjrlly4eKt2Hm/MB7U8jqmHNH5IcGdTT8JosTI91adMZ40lrAA1XdsRE8fwi99MjmZYNgM+XYFA4YcDq5T0dKbvOLmWVo/gGCw8ZHt3qocrIdvQ9pTOViacCevzRaHWjQcc+1VeNWfCdmCOqRCVFsFn9yXuV7M+GhTy4IBSVdYmIg4CqOpPiGF24FQuJzwypSkue6F5dSETPqjsObQSiQgfo2tfnT56Yop8NXIAqSXAJ1kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 887efcc9-5f5d-4894-17a3-08de93aa038e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:59:14.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PViXpqbshP0l+zrfXscfv4sU9I7AXGZyoWihvyURiqOOnO4gGLA0qSsuvE9B33pesZK8EgVIcYtad6BXMo5BlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> Add xe_vm_madvise_purgeable() helper function to support purgeable
> memory management through the XE madvise ioctl. This allows applications
> to hint to the kernel about buffer object usage patterns for better
> memory management under pressure.
>
> The function provides a clean interface to:
> - Mark buffer objects as DONTNEED (purgeable)
> - Mark buffer objects as WILLNEED (not purgeable)
>
> Returns the retained value directly (1 if backing store exists, 0 if
> purged).
>
> Also update __xe_vm_madvise() to reject purgeable state operations
> and direct users to the dedicated helper.

Here you can also mention why this new ioctl when __xe_vm_madvise() 
already available.

You can mention the changes required.

>
> v2:
>    - retained must be initialized to 0(Thomas)
>
> v5:
>    - Rename retained to retained_ptr. (Jose)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   lib/xe/xe_ioctl.c | 33 +++++++++++++++++++++++++++++++++
>   lib/xe/xe_ioctl.h |  2 ++
>   2 files changed, 35 insertions(+)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ea3f2fcaa..955607f93 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -785,6 +785,9 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>   	case DRM_XE_MEM_RANGE_ATTR_PAT:
>   		madvise.pat_index.val = op_val;
>   		break;
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +		/* Purgeable state handled by xe_vm_madvise_purgeable */
> +		return -EINVAL;
>   	default:
>   		igt_warn("Unknown attribute\n");
>   		return -EINVAL;
> @@ -821,6 +824,36 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>   				      instance), 0);
>   }
>   
> +/**
> + * xe_vm_madvise_purgeable:
> + * @fd: xe device fd
> + * @vm_id: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + * @state: purgeable state (DRM_XE_VMA_PURGEABLE_STATE_WILLNEED or DONTNEED)
> + *
> + * Sets the purgeable state for a virtual memory range. This allows applications
> + * to hint to the kernel about buffer object usage patterns for better memory management.
> + *
> + * Returns: retained value (1 if backing store exists, 0 if purged)
> + */
> +uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t start,
> +				 uint64_t range, uint32_t state)
> +{
> +	uint32_t retained_val = 0;
> +	struct drm_xe_madvise madvise = {
> +		.vm_id = vm_id,
> +		.start = start,
> +		.range = range,
> +		.type = DRM_XE_VMA_ATTR_PURGEABLE_STATE,
> +		.purge_state_val.val = state,
> +		.purge_state_val.retained_ptr = (uint64_t)(uintptr_t)&retained_val,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise), 0);
> +	return retained_val;
> +}
> +
>   #define	BIND_SYNC_VAL	0x686868
>   void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>   			uint64_t addr, uint64_t size, uint32_t flags)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b62d259fd..a02d68cfe 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -108,6 +108,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
>   		    uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
>   void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
>   		   uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
> +uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t start,
> +				 uint64_t range, uint32_t state);
>   int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   		    struct drm_xe_mem_range_attr *mem_attr);

with above change in commit message LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

