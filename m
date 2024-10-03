Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FF5CF34CA
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 22:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788910E264;
	Thu,  3 Oct 2024 22:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhEIX+IG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110010E264
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 22:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727993692; x=1759529692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rxzzv7SrHUP9iga+I6Lz4QEwoC/HtIPybxU6aLcQfbI=;
 b=VhEIX+IGuqpWDbWYQaR2GcoyIdp00xRa3p41h0xY0sxx0WYlc2WoN/fB
 nRq+VOru4uol8Rcx3xPnItnrSOUXUSUHTSCB+71956Fda4M1fUUwZBAG3
 yiY3EjfenrkhDc5ZW2+PY6LR8HG9yyKGfbSl9kA4n0Hr63FleV3jW/WF8
 7NOnSJapL/mA0z3smCvtzVLxiUTkpkmPVJSMZE4kxbUDnI0WrVKxlkCFd
 mMx1t7K9hPnLwdjVuv4FkTO/FQW8EFct61TATclQBSJ7aU+JNI8F28lKP
 3c4SHfftAte2ExRFL71mKjxcHxy7rT8vDFzK2wC9IquM8cXDRrQ6hQvYm A==;
X-CSE-ConnectionGUID: oomIHe8NSn+fSUi6n7rh6A==
X-CSE-MsgGUID: dItEh4jTQJe+fdLd8xb6UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38572057"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="38572057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 15:14:43 -0700
X-CSE-ConnectionGUID: rXGKSzW/RgeBu34sEyGhkA==
X-CSE-MsgGUID: p05eu8XmQdaL4gy4rUGMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74617578"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 15:14:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 15:14:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 15:14:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 15:14:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 15:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbgGM2EVZ2k6xFIwqlnwsN4YYYm7Ik4/LsyHMcAsO5MVnNOUBSqWMhZHXplO0IrlHlCAJa/ZfZNjyCrT7uy3Ep88ICz+n258x0FkVUvaSbCPmqLTKQI51rDnKzshud3z7D9CIlBUJTXmOwcsNKiCpOUGhgbB3ByLB45V00KfvqUBuXG2EQRqIbdsTq/Jq7XckNoXKq1hhG9Xj+FowhjywGwXGfKUN/YqkcU4J5lSFtjiqDi+FZWdExugmTtDGPAWKzAdPZQDpVp+ej218mVFrw6Xw/Zi16fh54TGKPy27Cs8wbL/glXeSyX41hSRJ1Hgwkk2UeKnx11x5cs9QimgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRYvbFD1Jg69y+jCwld/Gy//+XUN9+iCSQiuTFN+wPE=;
 b=NWMhOKZyNvWgeJcFKXXbOXh7B40KAv6c5a/IIj0E2F4MlVkk5RCsZueYcgocQa6fxKfUGtuitbU7suFLyQKAaWZpWo/QPCLT8kMQOub7kRnwI61fm2EF/ZINChTJud0m9ogW79jz8yiQuNvfgAmogui5qXLSzhCF7k50MRNi6J1vPk21M4LUWjSJUl6n+t0PvtLmuo9qeNkWdWwnyEnykgpGxT2qHoaeUe0CMC2WhZqbIBZpa/txbec9sS1W7Fo6Gx6/D1xKZZQZskW9xjmhTdy/k63rXtJAutes+555hqYM1ZORz6TE+bKIhauv2GHmlmshX8p6+qgEXwOc2vchKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 22:14:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 22:14:40 +0000
Date: Thu, 3 Oct 2024 15:14:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/oa: Fix oa-exponents test
Message-ID: <Zv8XTucpevzIEq9s@orsosgc001>
References: <20240926205120.3571276-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240926205120.3571276-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR08CA0034.namprd08.prod.outlook.com
 (2603:10b6:a03:100::47) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c5136b-7f0c-493f-474a-08dce3f8c691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWl3OUpYajZObmRHcnZTQW9iYWJBOWNtWnJWNk9idUF4NkkzTmxBclFwdUZs?=
 =?utf-8?B?Y1RnR1hNU2NnUVVRN3c1VlY2RklXbGlKcG1iN0RDeVhFSTFJdUJRR0hYUHEz?=
 =?utf-8?B?WjI4ZmNPUm0xdEVCMkZmQUhPZWtkQng2aDluUk1TazcvTVk1OHVZUjV4K1dT?=
 =?utf-8?B?cGJod0VNR2VhVHhjblNtcEFFUGdGOGROa3dPWDNpZ1dBem0rMzlqdCtTTTZQ?=
 =?utf-8?B?TEdIZkJDbEZtTFhuR2wySEhITnM3R2lvQnl5VkFpYUxOSjJqQk01dkp2akRY?=
 =?utf-8?B?ZXNpZUhvWkFtNlJwbzRleTNGeUxmMGpHamJob25vZmQwTzk0NmNSZkF0c3dY?=
 =?utf-8?B?NVM5ekVqM3RvQ3ZGcnpxdGxTTXFleTk1UG41SW5WVWgrMm9GVi9XRTY5TytE?=
 =?utf-8?B?b2daSHFVdnRDeXJieUtwZmNJakw4dEJMU3FxZGdIcHdWUXBTcHFhWkdwaGlD?=
 =?utf-8?B?MmtFM3VoRTIrdDU3UzVsYmY1MnBFbmdkZjJYNmhaSElOcmlNY0hHSU83Nldv?=
 =?utf-8?B?RHZEODczRTlvaTVFUGJlYTN3ZmQ2dGNIdjlZZ3FoSGpEZ0lRQ29jemZSYkRl?=
 =?utf-8?B?T2phbHhTZENLRUh4cUlmekJqR0hsRDJTZXNRMFFVVm9WOUQ1a1hLVDJvL2lJ?=
 =?utf-8?B?ZTlJcDNxNHd1SGdMMXBlZ05LV05KWU01YWxJM3RUZ1dXaGdNUGZ2aW1aREZN?=
 =?utf-8?B?QVRGTHBFaEJ4L1A5cmNReTBqM3BmWDBVNlZtOW1uU0dhWElIZjUrU0RaaDFj?=
 =?utf-8?B?S2RxMUFLaWZKMVY4QVBMdkZ4SlRYSWJCS0RYcUE5Z0NaYWlqczN4WExhL2Mw?=
 =?utf-8?B?cnFsbFAyeCtua2FhMU9ZUnhuOEhaRkFSOHBQT2ZXZ0pRcER5Tk50RDhFS1B1?=
 =?utf-8?B?Q0NHRXlJb2Uvbi9qNG9aNW5pc0czM21iamVKS2kwY2hLWXJ5dUovdCtrQjBH?=
 =?utf-8?B?VXQxeGVBL2J2VE5IaFJ3cmtQRnNpeDl5ZDBqMEdvMDIzczkyRlc2MUJPTWdn?=
 =?utf-8?B?M094eHVwWXlQQlcrWnJ6S3JqYkdoZ05QeXBBYkhMQkdHQ3NsQ0tiYVZnQy9z?=
 =?utf-8?B?QzltRi82VkJNOHhaSTNENEFOQjY1VXdPY0ZWVXJtajdiZDR2eS9wOFdBcnp2?=
 =?utf-8?B?ZmxZVmlkMkhqTmFzT2owR05LR1E3NHZhakN5eU1MRStKRlZuMGJQWGhacmlh?=
 =?utf-8?B?U1JqQ2h3aXVLc1J1d25nanVydEUyeWtLVG1YcWQrK3NrYlFIbnkzMFdlTFhi?=
 =?utf-8?B?Q1Jocll6blhILy9BdzBiN0lSeENHQ1pzSVgvY3d2UjhLR2VETHVOQ0t0WTFU?=
 =?utf-8?B?THFxL3ZFS0VXd3ZjS1JRa3hLOW5TS0VOOWUyN1hPZkE2MENud2dNY2Q2N0tu?=
 =?utf-8?B?V3U3UWx6bFdyQTR1RTBGajc2Ykp2UXNmL3dlb01udWNWVnloaDc3ZWRvRkNh?=
 =?utf-8?B?clJlTFVwaDAvMGZtU3RMazdWWlVOM2xQajVpalRYQjBQMDFXVzZrczRNbnk4?=
 =?utf-8?B?VUQyM0dsTHBoQ21YYXNZSGJhaStIa1lwR01tY2ZTMmFlZVNuM3B6cTl5LzRF?=
 =?utf-8?B?a0t1dFdyVkQ1VmVjRUF4MmJKSGdJejVNeW8wYTRXWnI3cmtvSFovZ0d2OHpK?=
 =?utf-8?Q?yj6NCoAotH0GJH45EFvAqB4OkMAB/faSW6+4KiQejgQY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RSY3NYKzhoV1R4aWdsc1FGb3NzR2RNZlA4NEoyV25XbnIrTmNodFQzNXM0?=
 =?utf-8?B?VmRzSXVTMVMwWTlvSGJtRVhQdzZOTU5TRzN4VHJVV2lzaVF4OXZPNWRZNU0z?=
 =?utf-8?B?YjBKUHUxSm0zUzlHekoyU1dsRnp4dVNzWG8wNkNIU0xKVEw3QlBhUFRuL0NU?=
 =?utf-8?B?RklFQlhlQWo0eFY5RDVqOW9YSDVSM283cFVTSWxPQVg0WUlkVk5OTUNKdlA2?=
 =?utf-8?B?RXV5aUVNZnliV0NKRkx2em9ST3ltdEZwckdUNGpJZG9VMC9BU2Q2ekRJN1V1?=
 =?utf-8?B?cDRxMTNNckN3V2ZUdlNYZW51N0ViRk9zczR5YkVQbld6ZGVhRGlCV3FVb2h0?=
 =?utf-8?B?bHFJdUlQQVN4YUZNUWFJRGRiajBqNFdQN054K1I5TDg4REd6UnpFY3RlUERz?=
 =?utf-8?B?UkM4elZTYTUxNjdkcGU3MVAyeW1odDFqcHRuS1d4eVdoSmwrQVZ4TzBTL3Rk?=
 =?utf-8?B?Sk1BMy9CaitWbUl3Tk1DbStKdjhFemorZlVDbHNFQ2N5YSt3cnczWFYzVG04?=
 =?utf-8?B?Ly9KaUxHQ3pBekVWU3BJMzYwak5HeXRpb3FJRjhzVTBQMi9MWlRtYVdzK2ps?=
 =?utf-8?B?OHRaUjVGaDN6ZEVCaWZld2xKa0ZPbk5jRHpKVjljZUc2WWZQd0RiNENKY2x0?=
 =?utf-8?B?RytTcm1ETjlnU1JmRTM1RWFIcXRseTc5TnlJZmFNZWxxWEZCTGM1S3QvU0Ri?=
 =?utf-8?B?VGZOeXlkcXdjaHhpU0g1eWFsNG5saHY3V0NmZEk1K0RDTFZwemhYZzluYk9t?=
 =?utf-8?B?bk9KMkpIV294QXhWQmVXYWhHWEtnMWtDS3ZPY0JRVXlOVjNUcDkwSkQ1K1BW?=
 =?utf-8?B?blROMzI1cmU5eFV5Q2hhRHZMRlhrRk9IOS83L1F4MGY1TFlEdmoycXF2dGpt?=
 =?utf-8?B?a3NNSEhYdEgwYmVNS1luUHFTZVBWaGlmR1JPUmh3M3FPQ3NwS1RIYXpuZTF1?=
 =?utf-8?B?Y2Z3NUtSRmRNMGNJcU43ZGJKeStUMHFnSUk4YWlYdUtNUTQrZmNiRFRoZ3ZT?=
 =?utf-8?B?djdWcUhxRXpoWjhvYVA5TWg0dXpRc0dDenpIWWFHYnUreDZSd2RYckVCVUp2?=
 =?utf-8?B?T0FZYmxYZktYenlZMlhuSFE0MER6dzNSLytWbS9zUTVwYmdDUk1qRGZXZGRE?=
 =?utf-8?B?VTk5YTlvTk9rQXkybWJFOHNkU0JFa0JxMEVtZ0dla1hISzBtc3VNU2tnMDFr?=
 =?utf-8?B?M3ZocVNtWGlvOTk3d2xEYXhkdGt4a0drV01RZHkzdFdkbURMb1E4dEZIbFVW?=
 =?utf-8?B?dGtEY2ZmRVhKUy90RGtDSFBmL2lqYVM4L0hwcnZ6UmxoUTVuWENiT1NkZyt3?=
 =?utf-8?B?YlFPTTB0dGd3c21PR21GVy9ncExLNDFZc0RtMER1WE1SOGt2b0RsREw0R25I?=
 =?utf-8?B?YlBkSzJQMG1wSHFMV2xGYmZSSzR5WkxhN244dWtZdVRHZjZxajhmdzQ1bVVz?=
 =?utf-8?B?UHIybm96WXg4eDJ6TGVjb0lOQks1SW9JWlZnb2h4dXRwT2kvTnlKYUIycW1m?=
 =?utf-8?B?RENHMnNNQVZidlpOZUY5bEZWRmZJZEZHSDYwNkptK1l6THFwZGgzak9vaFJF?=
 =?utf-8?B?VDZKMjl0MEp2dFF3a291Z2IyN2JCUDQ1OVZWT096cjBvMnZ0OWFmMi9IdmZR?=
 =?utf-8?B?VlcxTFNweTljeEoyOFM3ZmpHQ2UzdkJCN0VlOGtsVE5QNkF6clF3aDQwbVht?=
 =?utf-8?B?R0xDN0NRaEVpQ21DNS83Tk9LYTFaTjkzaVhldm1FRlNac0tSbzZuZkNWVlpt?=
 =?utf-8?B?WjVZbGU3VHJNVlB5bnZybWpXQS9QRDNrMVRWWURrcFhMYjRhT2c0aEpRbGtG?=
 =?utf-8?B?eW4wQ1FmY3VnbW5iUmRLR3J0TWNEVkdDK1hDaWxrVVNyL295akxRcWpLZkFI?=
 =?utf-8?B?eE0xNFp2aGdJa3M2T0plQ1JkZFBReVZsczZiWER6ckNicWN6bnJRWjB6OVF0?=
 =?utf-8?B?RWp2c0Q3dUtvREtYUXpvZjB4d0dsYW5BVExyU1F4d3VmVVRNcDNZdHoyRFFi?=
 =?utf-8?B?SG1GZCtURVM0UDMzVUsvK2I1eitZb2JSTzk3RUdsd1pVY2Y0SXFINUc2ejRv?=
 =?utf-8?B?dnhvaUh5NTF0VkR1Z3d1TlBDT0NWVDBZUmpWaG5YV1puSDY2TzdyZDUwWm9S?=
 =?utf-8?B?dFhGSCtnQy8yZ2Q3L2NKY2JBNk5KVUFlNElGdUtPQU4xcmxycE9CZmVXMHIz?=
 =?utf-8?Q?+X24uYuMl59epp4OLK6jNL8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c5136b-7f0c-493f-474a-08dce3f8c691
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 22:14:40.3887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M73jGD4jL24Hbb4P8rq9365Bs025QF+/OTo+M++q/dUe/wdMm1yjQSbuMLWxZZckqr1WfZEwfS+a8Om/J7CPuMCV0zdIaO6bzQ5SZ3T7ZyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
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

On Thu, Sep 26, 2024 at 01:51:20PM -0700, Ashutosh Dixit wrote:
>test_oa_exponents is assuming that reports is an array of report size
>elements, whereas reports is an array of u32's. The same bug exists in both
>i915 and xe IGT's.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2723
>Fixes: a5565306b277 ("tests/intel/xe_oa: Add oa exponent tests")
>Fixes: b3c80c93b544 ("i915/perf: Move OA format array from stack to heap")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Yikes!! Thanks for finding and fixing this.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/perf.c  | 19 ++++++++++++-------
> tests/intel/xe_oa.c | 19 ++++++++++++-------
> 2 files changed, 24 insertions(+), 14 deletions(-)
>
>diff --git a/tests/intel/perf.c b/tests/intel/perf.c
>index c5a103c945..a38d1b4919 100644
>--- a/tests/intel/perf.c
>+++ b/tests/intel/perf.c
>@@ -2108,6 +2108,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
> #define NUM_TIMER_REPORTS 30
> 		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
> 		uint32_t *timer_reports = reports;
>+		void *this, *prev;
>
> 		igt_debug("testing OA exponent %d,"
> 			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
>@@ -2161,21 +2162,25 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
>
> 		__perf_close(stream_fd);
>
>+		this = reports + format_size / 4;
>+		prev = reports;
>+
> 		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
>-			  oa_timestamp(&reports[0], fmt),
>-			  oa_report_get_ctx_id(&reports[0]));
>+			  oa_timestamp(prev, fmt),
>+			  oa_report_get_ctx_id(prev));
> 		for (int i = 1; i < n_timer_reports; i++) {
>-			uint64_t delta = oa_timestamp_delta(&reports[i],
>-							    &reports[i - 1],
>-							    fmt);
>+			uint64_t delta = oa_timestamp_delta(this, prev, fmt);
>
> 			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
>-				  oa_timestamp(&reports[i], fmt),
>-				  oa_report_get_ctx_id(&reports[i]),
>+				  oa_timestamp(this, fmt),
>+				  oa_report_get_ctx_id(this),
> 				  delta, expected_report_timing_delta(delta,
> 								      expected_timestamp_delta) ? "" : "******");
>
> 			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
>+
>+			this += format_size;
>+			prev += format_size;
> 		}
>
> 		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index aae9be2c40..5d7a40090b 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1692,6 +1692,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
> #define NUM_TIMER_REPORTS 30
> 		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
> 		uint32_t *timer_reports = reports;
>+		void *this, *prev;
>
> 		igt_debug("testing OA exponent %d,"
> 			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
>@@ -1741,21 +1742,25 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>
> 		__perf_close(stream_fd);
>
>+		this = reports + format_size / 4;
>+		prev = reports;
>+
> 		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
>-			  oa_timestamp(&reports[0], fmt),
>-			  oa_report_get_ctx_id(&reports[0]));
>+			  oa_timestamp(prev, fmt),
>+			  oa_report_get_ctx_id(prev));
> 		for (int i = 1; i < n_timer_reports; i++) {
>-			uint64_t delta = oa_timestamp_delta(&reports[i],
>-							    &reports[i - 1],
>-							    fmt);
>+			uint64_t delta = oa_timestamp_delta(this, prev, fmt);
>
> 			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
>-				  oa_timestamp(&reports[i], fmt),
>-				  oa_report_get_ctx_id(&reports[i]),
>+				  oa_timestamp(this, fmt),
>+				  oa_report_get_ctx_id(this),
> 				  delta, expected_report_timing_delta(delta,
> 								      expected_timestamp_delta) ? "" : "******");
>
> 			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
>+
>+			this += format_size;
>+			prev += format_size;
> 		}
>
> 		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
>-- 
>2.41.0
>
