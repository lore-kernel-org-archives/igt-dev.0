Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC6C3DA4B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 18:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EBB10EB3E;
	Thu, 11 Jul 2024 18:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpeH8Npn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089AD10EB37
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720722705; x=1752258705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zVHguPxkgF+dCbAr9i3KZ0Ff54YQaGcjVoMd3qi9tSI=;
 b=VpeH8NpnjFm9ET8atx56tG+oK/ma6V5YeYj/dJXT6iF8H26ItLFZXjYF
 AMjmCryUbfIZuDSdI27HXY5raEQwWAyQ5ddimwl9CT4rTXhh2Tx+5bXzM
 SgJcOPMBdNbKrsw496AgiCoEGUdIxNIU5tJnVixr27Iet5VcfyYASfrca
 YXYQ77UZWwAm24PfLcbTfhgKhbf00n9xHTsOCAWS+UGZ8d+/wVBHBEGLK
 JlUYpvUDG1TyleOWHYipCdWUK+K9LQmFz2140gZoCLcoA5kKn90ZnhSZy
 e7E27Z50Z8e37y/zBtuYhDsFit0QwFqKOx21IEfh82SXgHfF3u3e2I9DD g==;
X-CSE-ConnectionGUID: krkruc90QpuC5giaLffv8w==
X-CSE-MsgGUID: 19ZNGIfIRkmEHMh1vLswLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="40655823"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="40655823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:31:44 -0700
X-CSE-ConnectionGUID: B+uJqg8hT9uKG5Eg1rKpaw==
X-CSE-MsgGUID: DRQ+jZyuQbibDBWPqj4fow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79782447"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:31:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:31:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:31:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI4iLN8ZEF6WO1c9qrrZelvyKm20TkPHrN3Lo3FvV4b6bwy1Q6WzqStlVfNJeILUvRsCT3iQux9Ge8ATyT1Tyhu2utucKJRJ3vQC2oXrkPobckJNiC1/NbPCKcCm6xEJkEVzRbJViotBvjzHFDRSRUKwZH6K/5Ne4q+qLoqKXdAM1OROpGhTb9I3IDojqwYm28rk7t7GhAcedO22P6RFx5N+WB6pkmxhrbvXQxOlVcZviYokZD7p/ptk35Mnt6+8lik3L32dXSrgHZYGQWp1mVqvLoI9Yu0Ja4yIHiboKh3IO6H7Q61/cEmJorbnHo9bIQZvpRLcAuBy46+7gw2HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv30Qe+dXsgg33aVyqxWcAH6STkAJUVEIyweT5jlOKo=;
 b=NAeLSAXTJmUjbERc+Tchq2eYkyNnG1qjyu1QNSDEJ4As3mAz7P6O/cMh8IqkYZ2YFiesL3ZP1wYJs9zPltPwxv4qsuXSNNVA3oJB+Ju9kpa80vV4BppmyYskqYx6lfE8eSml9Oj92F5PkfEFRCsU0C/HioTdA9rlzmkhSurTogY8QSecx+VYCR90GSPzVe3Bpqj3+B/nF33he96Oz1rvrHsyNWiE+2CVkrIIAG+M2q0J+5GlYe1/g9O6ihi4zhYEpjnxZa0V9jlruQ8wVc6RDxxHwoGswiYSFLGmM+yp6mYegVSgWYobzANUhBMTt4Q9HVYw1x/2c4Bg3G2mIlNz0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 18:31:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 18:31:39 +0000
Date: Thu, 11 Jul 2024 11:31:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2 07/10] tests/intel/xe_drm_fdinfo: Add an
 iterator for virtual engines
Message-ID: <ZpAlCU+y8hqTlF3e@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
 <66pm7xg62ide36jiagnsc7hb3hqo47wwadkisyqzokhtbobfsf@wsgxak5nmwzw>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <66pm7xg62ide36jiagnsc7hb3hqo47wwadkisyqzokhtbobfsf@wsgxak5nmwzw>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: ef12fa03-20b0-452b-2732-08dca1d7b46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXZIZ1BrS0RKaS9LZjFvNHhrYlVXaklESVZYcXl6WExPUnRxL2doZDkvRUVM?=
 =?utf-8?B?UnZPS1NnM0kwN09CQlhMWCtLcnpFUG5ib0Mzdy9XSlVIdkRyWkNpZGUyT1hS?=
 =?utf-8?B?ekVlelZxb1cxeEgzbVpmYnhGa3Nma1F5TkhIRVFpVHhQbDVIMW9FeHpYVjNv?=
 =?utf-8?B?NXowNWt6amM3VUs5OEp3cUpyMTR2ZEJOczlLWndwdVUxU1MxdGd6aGNvWEpQ?=
 =?utf-8?B?MVBpRExScmlNeUdPL0NMV1lmQ1g1ZkV0THJCK2hQVko0VUxEbDQzbm1VNUh6?=
 =?utf-8?B?UWZxd21WVjl2SkV4ZHVsMktVVFFnWkIySGFTRFNhUG5PRHg3YVpTem5UN2Zw?=
 =?utf-8?B?dFIwN1AxaFkzcUZPWWQxaU5xbi8wTURzUmZYVmUrNWxqOVNMRlVpR3h0OXRG?=
 =?utf-8?B?eUx6bDF6YkJtbExVNkhzUHlVYlBjVTd4R2xMQjE0djVTVisxNkFBTjRMTkZ1?=
 =?utf-8?B?MnpwNUoyMER5MGkydm1LU0RYcVNGS3lqNlJ1ZGNRUkl6SHlUSW5CSjF5UE93?=
 =?utf-8?B?VGg3bWQ5aG10Y21hSHRVd2p3TDAzU0tVS2g3SnUxN3pad243ZWlnUFNDNTlI?=
 =?utf-8?B?OC9yeEVpN1RQNVdXb080RGRyNWtadk43ZUttVVprOHRML2Z1KzNmNjROL3NY?=
 =?utf-8?B?V0R6b2tMV1dsTmxhQ3g1eHpSZzhzV29jQ3ZsMmU0d3RmaU9yYWhORjBzM25E?=
 =?utf-8?B?MUpSNnJMRnYvcVJObVpqSnhUOElZR3J1YWtvS043bHJwRXF6YmM2R0dOZFNB?=
 =?utf-8?B?RklGTWhmeWRrRmk5Q0RGRUlDSDJlY25pTVg5V2E0WkpYN3AzNGVxejlNWGVE?=
 =?utf-8?B?S0g3RDNxV2FRMTE3WlpQZlRZbTN3a21xZW1Sem11eHQ5SE5JL2xORXI0NXJZ?=
 =?utf-8?B?V2ttdHhqRzdlK080SFhGVlNQYy8rMFRxWGprRkh1QTlsOEU1Mm5kVTMwbURU?=
 =?utf-8?B?Y3FidWRQVGptZThsSzltY3M4QnEyT2JxU2ZwRHhBbS9HRVZrdXhXT0VKNEhM?=
 =?utf-8?B?TzZvRFNxU1RhR01mZGdOUTVPUTNua0l3U2FDSnJUbXRlUk5ndGRsdktkU0FL?=
 =?utf-8?B?VXpQNC9zaUMzN1JGdnNqVGtoSjFDOGRqUC9kM1lrWCtWQmEzRllLUnB6amNG?=
 =?utf-8?B?VnJvelgxeU9KTU5TUFpweVNTZEJkNlN0b2ZIUG9ZTWNqTjdIVkV5ZG81K1Zj?=
 =?utf-8?B?c21lK0ZGL3pyRGlwZitpbkhxTDNadFFSK2xBcmxtdjRORDV2WmQyRXNzbzFn?=
 =?utf-8?B?TG8xM1FPd28xcVpXUTFFQ0ppSzdnSnIrYThsTjRERnlneGxTWFBiVFJjUHk4?=
 =?utf-8?B?TndXUmpNRUhSdW5UMXFOS25xMzl4dnpJUHpQRVRoL09iR3YwQjFuMHFncThV?=
 =?utf-8?B?czR6OHY5MkdlcCtIOXYvSXBwSGZVdFQ4cXRhTy9TT0JESHE1YXRac25pS0lG?=
 =?utf-8?B?azZYVUpVT0JuQnE3WXEyRFRhMnVwTDdVREd5WFF5Um9lSFhNNzJGYUs1RlIv?=
 =?utf-8?B?aWVteVZVZkVWTC9uSzltazFpbGRnQzh2a285U3QyYzl4TTZQdmVBRi9WTFUv?=
 =?utf-8?B?ckRMYy9XOWxTUCsvSElnVDlYdFRLYkEvZk5XaFdlRkcySUswZnBFZWMxQWtt?=
 =?utf-8?B?ZmNyMXZrN21qS2dzZkljYWpvQjNMMmVhRWliY01XaGl1N3NxSjg0dUJXY20w?=
 =?utf-8?B?WGl3ek5TeEsrWWl4L2RYVmp3SzFFMWY0RHBUZlB4L2wxMlRodHZ3Zk5OdjI1?=
 =?utf-8?B?MnBGVERuSVVDb0lCUG95TGc1VkNHa2drV3o4WlhlejRleWU5TlFQUUhmNy9I?=
 =?utf-8?B?WnpzYmZQb0s3QUZ4MU1BZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3NKK0lWakd4QkxxR0VlZHVOMlgzM3U0YXc3STdJb2s4Z1IzV2E1cndHamRV?=
 =?utf-8?B?MWN6U25SMU9yQzJXVlZHQUdHNTlFaUhFNmlEVXprUVlvalB3OTZyK0ZBNytw?=
 =?utf-8?B?eENiMkJIQm1zU1lyNUk4YlFqcUN5dVQxOForaDhTRHVFQjQ0dC9MTXNIRlJK?=
 =?utf-8?B?cElheXJTWFBNdTRMd25sTjQ1dk5UaWw2enJjT04wc1lTdEhnTFdGNER4S21B?=
 =?utf-8?B?VGlXbjJIaWdwZnEzVW9qdXB0SkZLMzZnTHRtcUhlblAvS1RvNi94TnJGNURX?=
 =?utf-8?B?bXd6eDA2SXUyVysvVEJZZzE4UkVhZzZuZSs0V21vOWJ5Vmd0UTlybjBFUGZI?=
 =?utf-8?B?ZndITzhSQm9EK0g0TmZrVVlxRXNXWmpuWUdJUjdBRlVVTnkrTVlmRnU4Qy9L?=
 =?utf-8?B?ZnB3WStFRlFtQVBjdkp3N08wLzU0M3BsYmQ1ZlRIL243MXg1M3ozU0xkMUl1?=
 =?utf-8?B?cjMxK3FLeVNLNVprODFuajh3VDlpays3NEVqTWdHVllyRmd4NmwyUnVjUzdm?=
 =?utf-8?B?Qm1aVHhtR0V0UkJGdzE0czFIY1hmNVFBVEc5dlQreG1JRUNBRVR2NTRRK1gw?=
 =?utf-8?B?Vy9LclFMSWN6NGM1S2ZUc09RbWlCQUcxNVdqaUE0TWRMeDlTQytyUVpQSDMx?=
 =?utf-8?B?MnErUk1KSDN3YW5majRKcmplcmd2ZWFLS3RBeVVDWTJxUThqRi9ra2FvSkVI?=
 =?utf-8?B?LzRqdy9YSE5rTkVmaWtLdlhhV0lHTXFnT0hoYXFWWFpaU21LRFMzTWVkdTRO?=
 =?utf-8?B?Mjl4MkRjbDF2SGlBZzNid254dXd2Um1kRFFDMGhIcEZSZmRFSUFoUHJBMjAz?=
 =?utf-8?B?ZmU4SWdtUUVTRzB6QmlzdkZpL2hiUmZZcGxoRlVOUG9nQURmQjVZR2JQcDVG?=
 =?utf-8?B?NmF4OVpRV05CaUlCZWJuOGVzWUZWZXhudGJZS0ZCa1dCR29iYkhUY3YrbzFF?=
 =?utf-8?B?R2VGU0tSKzA0Q2dOM1VsVndCWGt0YUlHblFXclJ2QndKY1dvTE05UytSNkxs?=
 =?utf-8?B?Y3RRRWo5QVlvU1hqcjcxb3lla2dlRHVlbGV3NFZ6bHYyWkl0UXQzWFI0aTZ6?=
 =?utf-8?B?WHRHMDdKOUM0NjRRMHkxR2l4LzFvbFM4aklMbnJieE85RHlKaFVyY3c0c0Mz?=
 =?utf-8?B?SlFWT1Z3OVZDdGRpeXZ1RkR2SkcvTU0vNFFGMS9ySTNJcVhyK0p4VDJ3T1M5?=
 =?utf-8?B?bmV0aUY2RXZ6RWdvQnBFd0dySTZVZkhBeDdmT2dzRVFxVjBmanlaU3g2a0RE?=
 =?utf-8?B?U0krMy9EU1puRjJCb1lGTzJsVGxHU1BaeEVRaXZ1cURnTEgxV3VxWk4xM2c4?=
 =?utf-8?B?ak56bjBmWjN4VVdCeDJZckhLRGtRSGs0bXBIT3pkVzhKSVlwUjZSVVp2SW9C?=
 =?utf-8?B?alh1bnpjZnhzR3JMZmdIWjJERHlydVRrVlpJWEVJZFNoRXBuOTNpV1NTVVZZ?=
 =?utf-8?B?aXZTSytrZkhDQTV1UFJjQjRIbVg5d2NqMGJvN0J3Y0NYM2dVc1g3K1ZPQnh1?=
 =?utf-8?B?bm1aUWdTZUxmNWpHN29PVXh1dU11TmxKb1lPbmYrT2JSbVgzS2pCajJhUXRF?=
 =?utf-8?B?ME9NVTg2MmRtT2ZrNUZxbHZ2MXVJS3E3ZjEvUGZRRVprR25ZNklPbkFLQ1lX?=
 =?utf-8?B?SVpWZzRwaklHbmtpb3RVeW1hT3pGYzE1NXpER1JySytoc0xXTVRqTTU1eVNH?=
 =?utf-8?B?YjZtVEpCR2RwZWthYWJGOXMwZEN0N051azN0LzJ3UWIzeHpGMEEyQUduVjQy?=
 =?utf-8?B?ZGhVNHpiMUNzZVM4Q2pJd2dhamlnUWk5NUxxM0FQY3RNWkxYNmh1YjdEMVNm?=
 =?utf-8?B?TFJhNXRtcnlBcDlDR3ZZVXVqVFNFeURCZTBYa3J4NjFuMFhyRVBnayswRTVk?=
 =?utf-8?B?d2FpbDRaUWZMb3BaNFZGK3VNUkh4MU1sakkyR2orUDVhZzFkdnZ6bUNET3RT?=
 =?utf-8?B?c0wxNGI0dnNXS2N5Q1pXQVpSVkszeEpnQlhOSmxKVm50b3FaRThFa2o2eFBC?=
 =?utf-8?B?Ri8raGxQcUtwaDZHdEFZQ0huQ21XZW9vK291YW1VOGxaR204UjI4RnpRcURE?=
 =?utf-8?B?aUpKY21hS1dGK2VQemdvUjFrejQyVkx6Y09XYzRJcGI2Tlp1S0tEMGpIUmxw?=
 =?utf-8?B?YXlhTWdwQVdUZ1JhanN1ejl6UjB4NFFkNFh3a2p4djNEeThNNGpiQWMvcHZZ?=
 =?utf-8?Q?GkhqVuxNfCKcy5B23iShgOs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef12fa03-20b0-452b-2732-08dca1d7b46d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 18:31:39.8068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spKhh1U7dBwbX0krUq/Y531f9+50OwDnfky2BYrsFoGWOBt/eEiGcrhE6kWP5u2okuTEqh47EaIW9bISBtw+47tRk/uUYnuSz+sm9e/64Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

On Thu, Jul 11, 2024 at 08:34:03AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:29PM GMT, Umesh Nerlige Ramappa wrote:
>>Add a helper iterator for virtual engines.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
>>1 file changed, 29 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index f2051c422..9d3d1b285 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -90,6 +90,34 @@ static const uint64_t batch_addr[] = {
>>	0x1d0000,
>>	0x1e0000,
>>};
>>+
>>+#define MAX_GTS 2
>>+#define MAX_INSTANCE 9
>>+struct virtual_hwe {
>>+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>+	int count;
>>+} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>
>there's no concept of "virtual engine". I think this is something
>brought over from i915? Is it related to the width when submitting?
>
>Please add a comment for the confused reader and it's probably worth
>this abstraction to be outside this test. +Matt Brost

width is for parallel submission and num_placements is for virtual.

>
>>+
>>+static void list_virtual_engines(int fd)
>
>list? shouldn't it be virtual_engines_init()?

Right, I will change that.

Thanks,
Umesh

>
>Lucas De Marchi
>
>>+{
>>+	struct drm_xe_engine_class_instance *hwe;
>>+
>>+	xe_for_each_engine(fd, hwe) {
>>+		struct virtual_hwe *v;
>>+
>>+		igt_assert(hwe->gt_id < MAX_GTS);
>>+		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
>>+		v = &vhwe[hwe->gt_id][hwe->engine_class];
>>+
>>+		igt_assert(v->count < MAX_INSTANCE);
>>+		v->eci[v->count++] = *hwe;
>>+	}
>>+}
>>+#define xe_for_each_multi_engine(__fd, __hwe, __count) \
>>+	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
>>+		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
>>+			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
>>+
>>static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>{
>>	struct drm_client_fdinfo info = { };
>>@@ -678,6 +706,7 @@ igt_main
>>		xe = drm_open_driver(DRIVER_XE);
>>		igt_require_xe(xe);
>>		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>>+		list_virtual_engines(xe);
>>	}
>>
>>	igt_describe("Check if basic fdinfo content is present for memory");
>>-- 
>>2.38.1
>>
