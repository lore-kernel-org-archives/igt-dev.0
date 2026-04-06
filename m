Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A36FF46C5A
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 16:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2B110E283;
	Mon,  6 Apr 2026 16:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GO3mArLg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7587B10E283
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775494138; x=1807030138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oSU1CmT37xiZ22WmIdYaFKX/19XpLwkRXqyIfcJxKAk=;
 b=GO3mArLgKSxeiNdg36xbtQCYMVfZCdPQaSE2syxgSoQLfCFkoy72bNyD
 lmxM7G3mfBBBSDpQOaSKSxYxrVvaV5+L9942nVmLIJaFMAPI2qXZI8QI6
 Iz+spv7WBi97mLOIiAfQsfbIIXmWR+UaPh6N358BTWIDZRmrsKUK5f3qT
 46vgdZPrj2nR9/+K1dg4rBwFEJ2Du9tC83CZfcdYC8/nbS/bThAGEtOFl
 96VhKQXgmjSChsWTsqSc4MTS/EOcFr3NIbmdQSd6fLC6K003dzBkdY/KT
 6jNCcYg+qP2nSL/QfoRkD/KQpgytTAfM1tVFsyYjh/E15MUpTq65ATqV2 A==;
X-CSE-ConnectionGUID: linSkrlcQye8pNP/KVugIQ==
X-CSE-MsgGUID: B6xWquPdSDWwTYGMUDUUjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80040404"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80040404"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 09:48:56 -0700
X-CSE-ConnectionGUID: 1JEZHjZ2RmOWsRa7/PaDBg==
X-CSE-MsgGUID: h3wk6fjHTZSuKr4YSsE8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225164869"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 09:48:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 09:48:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 09:48:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 09:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5tFZph9sKzOUqL2HGU2X2JgHzPU2aYwApkn7DG9M5m1fs5GgYVAEjQ1r6prpEdTv0fxANSKHI8NQoghn3yhuNgIskmCRMPrWaj4y5SPTeZAwDR/hv2OwmJU7xYRZ5fO5ryfq05TB/dj/WhGuVpRubxuiespthfbLAwK6hXaxeWyZNEyHsBUM5o0wftaciO+LQ5iegGYUeXu22WFykh80LX8aKLD4+eFUU+3nIKjGtgMVG892WBbKd0Nl+f7Filf7QIyd2UwpPHShe+mNrd2Kwpfv1GnxPy3ALVO6atdd6X6OMSnu9ZYYNeJiTSmyAiM1AnMznZ04kQNUb2I5cW7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVmo0KdEi/+cmhRIXsp1ngZDJMjkiQqO77xrmQ9P3XY=;
 b=EQD0l6/dxth/dQm9qgUydCUDnaHmIaaJ0TT9/109RYFVpOHCGsn53q99qgNQ6rnsaFypVDHfnoZ0ArlF5WSXHcogVVgzmHfh7AVjvTIUTsPfo7Fjtblo7I4VpL9KpBIAkZ2b+JyrfycJZJrSkNguGs6FRfdrnpKelPQnoRs48eEx4f3Bub87V+Z0AZFF6sQFPH+CzM1dL4KeUspCwwidjJb5ZQUpcOgsiCqETedwTRHfL7TgWfMFLoHRolYGWEFBmY+bsmUKucmHlKkegco3Hws2HZJ9uPiF9w1zoMXBY0GCLUQRDMQQYcQ1tBbuqH587hPmZL95d288rng1BifaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Mon, 6 Apr
 2026 16:48:45 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 16:48:45 +0000
Message-ID: <a0303680-5405-46d4-8cd6-32c96f9e2720@intel.com>
Date: Mon, 6 Apr 2026 22:18:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 6/9] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-7-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-7-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: f28ebb8c-f2e3-4d96-d622-08de93fc5de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Bc3U1BKDpjK2EeDG5nHnuKqN/BqCDNeb5bYo5FuPBb57RPrPVo+YT6SJVU1IHNAKxMtl+mWrt23E2frXXtxt/pM2klJiVQyGVnGgEd+m5GgLQQkHCyj2rWGbmKoNF3AxFb1jvssg/1WOu2yb7tVe8oOrxAklMvVjNx7iXHnenz7H5Pw5ViHWCvCBh1yeHbPYkMVAPnyYlu60BsruiLnQ++HZSuS8ZgN+2cVPG4wd9iLdENuSwvkk7MgzaRuMuPeDCv2pshkGvIomKIUefpkCayHgZZQ97L9Ym+1O3X1OSk/3tMQ/Gh2z+9kmaawiQwTtarpV8zbs/NBMK4Z92hOvZTZiQV/Dk9HBXumBjxuANpA5ls9qzOicf3Hw05UOxP7n6uCQldPJlip87KlxThtKM/Hvw8cGlRfeJpKdw3bBdYq8NGhTAGt52NdjKU4uXQaY10jbERZQr2GaWHibpjG57Jkpw7lpH2UuOlF/9q0O+a3j57dwJffuLzgR19dfBpNzfsgssCABE41dcJ6aIAnqWcg4XEPLCAwGZD42yagGJYvJXS+XXOX535ff8Z7Wr6F/JzVoe9U8CfhmArvcfJmci5HeMfOtEK5++kiIjw+WTBgQanq/GG/6f7Rxs/eNHHo++pLQNOCLq65U2RInS7jpwfyZiAjyvEAPegjafJETRqwMlY84kuh/DhExHQccvM5/iKryTcmUEPlzGvEovM96x5V8FvTC7sq8vdgY7osoINw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1hFVTVXREFzakl6VVNJTzM2YjJzTEU5K1Q4eHRZSUFwcE9PaDJJcld4cXBL?=
 =?utf-8?B?OExOQkJpS1BVa2Z0YzM0YStRTmlIRllkYnJPRWZBSEFBKytLNDZYSDN2WHJU?=
 =?utf-8?B?RWp6YitHREVNRDhFNWxyNHJxc2hDbWpuWm80WE52ZXdaN1lzTC9JcllsaGhu?=
 =?utf-8?B?RDZYRVBPNHNyZGYra08rVzk2THczWnF2L1A4bWhFMXdJQlRvWE1LNjlUZjZZ?=
 =?utf-8?B?bTZJelJpdjJVVTYzUGNaUTZhM1B3NzJHanNBQ0lUdEt6RGgwSFVDM0FZRmlB?=
 =?utf-8?B?VDdDM25iOHg4RU1hbDc1R3cxUFpFMGF3NjVmRkg5M2dGY3Q0OUlZcEMxVUFq?=
 =?utf-8?B?Y0JldGRwTU9ZTXBUa0FPZ3YvV3dzUm1VMlo5SG1EWkxxOGg3U1VVY1ZzL3VE?=
 =?utf-8?B?YmNHbVZLdHNmaUlTSmZoVFg5SW1hQmJuVlBBR1V1cDI1ZTJVN2VBNlU2U2hE?=
 =?utf-8?B?MUJVZUhVQ1lZMDQ2MExRYUo4SjNwWldwRlJFMVBMNU5hZTE2bk1NcWZVWkMr?=
 =?utf-8?B?aWZTMzNKbnVLTUpScVdvYndBMS9rMm9KNUhmdHhqZ01jVmQybE00eS9PdGYw?=
 =?utf-8?B?Uk8yQ0NKVWRWbG1nZENDaTJNUmE1TnhKZnd2eDJzRVMvUWc3R1A0TVlWdEpE?=
 =?utf-8?B?SGYyL215dFJhc3ptOFltRXQzVlkxRVU4VWxzUG1lbVVwNDZyOUljczhLTktX?=
 =?utf-8?B?QWV2N2ludmxrV3gzSGVrNzR4dExIdm1nQ3NDY3pKc2JYRG9CZ01XRFFoLzdi?=
 =?utf-8?B?b3UxTjFFYkxNS1BRVXRBNElXc2V1RXlTNFo2RkhUWlNPUlRrUHhISFBJZERC?=
 =?utf-8?B?K3c2cEFDelZZRVJMVVFrYndpbUpQUmJsWjIrL0pHL1VMTlBVL0hKYlpya0lx?=
 =?utf-8?B?ZS9pUTF1Y09lUjZTN2dsQllQWS9WL0VUZnIvZ284VW0yWGNaR1FPaDFRRStQ?=
 =?utf-8?B?UTRGTXRNUXpWcGVxelJ6RkFUbFE4M21WUE9va2kxUnZRTkN6QnFHMERBUmpE?=
 =?utf-8?B?Z3dwNCtuMEcweXZNQkFZRk5oQXdkSTlvWmJJRVVySmtveE4yaGt5bHdDSWFW?=
 =?utf-8?B?S0tkL3UzTkRSRlFoMkY2dC84VDBzWGFHSlpodEgyZHl6NFFEb25hMW41N0h4?=
 =?utf-8?B?YUlYV2VRUmZCOVlHdkUrL0g1ZXVsZmUwZHl1YndGeUIvK2YyQVdJMi9aOVpF?=
 =?utf-8?B?V1IyRVlRdHgrenVER09CclBGMmRzeDI5Y3k1RWo3ZHhDMnRsMWkrS3JWbHF3?=
 =?utf-8?B?ZGoyc0tvT2VjMlAzbWM2TWJsaTZEcDBtRXF6c3h4UmJETTA5Nnc4dzEybm5N?=
 =?utf-8?B?WituUHZwSkJjcERYTUFZVzRoS2ZybGdwTWo0TmVsVWkyUi9DQlF4ei9JaTcy?=
 =?utf-8?B?WTFVZVhtTWM1cXh2WnlHd25WaS9XdjNNZ01FRTJNdU5UYms3WnZBVy9sWWZG?=
 =?utf-8?B?SFN2U1pHMEU4bUtzeVBLUC9MVi9NOHJxOXJFTDNJZ2xXOUpNNVpmRHZMLzFq?=
 =?utf-8?B?QndEWHg5YXNQcS9FTGc3ZGJRVXlYZkJRbmtibkVQNUlnN0tWNWNxTUJzcHBu?=
 =?utf-8?B?UEY1T0tpaU5KYnFpejNlYkRpT2J4U2lhT0JyTTUydmFQQ0RybEZsc1czODdE?=
 =?utf-8?B?Zlg2OVYrM3o1cGZ0Nld6Rlo0NHJGa2N4ci9taktFOFkyQ3FyWktQK0FTTlBK?=
 =?utf-8?B?Mk5XVkgxY1QxajQ1Vm50dVhVaDRyS3M4Vkg0ZkliaUNNNE1WQVBiR2NxVWtI?=
 =?utf-8?B?b1JQekY0QzhUSVRDbllJMHdtUFJxcmJUZHV5cnozOUpzc0xRcUFXdXFDcTBX?=
 =?utf-8?B?cjZUZHpyNlVEUmpLQ09nZFRZODdkQzdkTHVCRHJmMWtxUlFCWHU4OXdHemFI?=
 =?utf-8?B?Y0VwRVByWmFpUEx1MzQzZGNrSTJuL0xYc0dLTVZHY2gwZmFPU0NvSGFKYy90?=
 =?utf-8?B?YWpXSkpJZzd3RXBCL3hrUFpjYzNhaG9TWUovRGJ0R1ZCZG0rdUUycWtQZTYr?=
 =?utf-8?B?Sy9YQlZpaU9GZUxYT0hTcTY0Z0VPMnN6dnhBb2d2RkpreFRrQmh6QllpaXFl?=
 =?utf-8?B?REtIOEdqcXVSeWJHejM3bEh3Q1JyUWpzbG84UEw2M3F1bFdSVzBNVnAwWm9q?=
 =?utf-8?B?R21IQXpkQktFNTMyNXNzeDVQQ0pJc1FoM3FQNVdRRzhlWEh2bE1vQ2lVL3VW?=
 =?utf-8?B?cjkyRlB5WlN5akZ0eVlwZWNKa3hVeFNUYlN2ZkVSZWtJN1RzT0ZWdTJ6L00r?=
 =?utf-8?B?Tml5ZUdnVUxHbk9PK1dDa0szUTMweWhVT3NCQ3V4and3dC9vYVBFZDA2MS9l?=
 =?utf-8?B?ajhRcDZqWXNmQWxaYVdtemlJRmw3LzBzTDFvN0lBT3hUUHhwYmVxcFhTN0s3?=
 =?utf-8?Q?Cl/QLFUvIeZ4UQK0=3D?=
X-Exchange-RoutingPolicyChecked: uOATNQnz+F1OJMr9XoziOEhD5NWj1EzWUQ4veg7frSYe1g6dZHFDi5kKi+MoH6Oejw4xl+3F+nYEq8o774Vsi6DPwpV/DkfRt85mxcmw+h6KlM3awN5z5l84jjC+Tpg5qoCkEdKySnIXb+ESirLfc7aPQI5eZ2ZvYGfzTC/fYjc1WM7G55xDGfeckeyaSRneaq14p35AQUnFNmBwfCA1YHsw93s++RdEAvFMtzo64dJAlBk78LoScXNdRwXf8/AU9ohHX3fJiaMb+/gYshhdaJU1EOBiD5c341GT6AcTJJsXSDu9SFHuYlATtRUj0xM8WmVXV1QcWP2HOkc3R2fqAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f28ebb8c-f2e3-4d96-d622-08de93fc5de4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 16:48:45.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdRU7Sr/oVDYHFtuymLdHp/gefP99Dj0zqKRqgy9ow/5hZ5jwZXNRN63ibqDeLOxyllNZI2Cdw7NzWYDoRRagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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
> This test validates GPU execution behavior when a data BO is purged
> before submission. The test creates a batch that writes to a data BO,
> purges the data BO (while keeping the batch BO valid to avoid GPU
> reset), then submits for execution. With VM_CREATE_FLAG_SCRATCH_PAGE,
> the GPU write may succeed by landing on scratch memory instead of the
> purged BO, demonstrating graceful handling of purged memory during
> GPU operations.
>
> v4:
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 148 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 9a157de1d..d126db9ed 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -27,7 +27,11 @@ static bool xe_has_purgeable_support(int fd)
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>   #define PURGEABLE_BO_SIZE	4096
> +#define PURGEABLE_FENCE_VAL	0xbeef
> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
> +#define PURGEABLE_DEAD_PATTERN	0xdead
>   
>   /**
>    * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable reclaim
> @@ -206,6 +210,62 @@ static void test_purged_mmap_blocked(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs for GPU exec
> + * @fd: DRM file descriptor
> + * @vm: Output VM handle
> + * @bind_engine: Output bind engine handle
> + * @batch_bo: Output batch BO handle
> + * @data_bo: Output data BO handle
> + * @batch: Output batch buffer pointer
> + * @data: Output data buffer pointer
> + * @batch_addr: Batch virtual address
> + * @data_addr: Data virtual address
> + * @batch_size: Batch buffer size
> + * @data_size: Data buffer size
> + *
> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
> + */
> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
> +					   uint32_t *bind_engine,
> +					   uint32_t *batch_bo,
> +					   uint32_t *data_bo,
> +					   uint32_t **batch,
> +					   uint32_t **data,
> +					   uint64_t batch_addr,
> +					   uint64_t data_addr,
> +					   size_t batch_size,
> +					   size_t data_size)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = PURGEABLE_FENCE_VAL,
> +	};
> +	uint64_t vm_sync = 0;
> +
> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
> +
> +	/* Create and bind batch BO */
> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd, 0),
> +				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr, batch_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +
> +	/* Create and bind data BO */
> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	*data = xe_bo_map(fd, *data_bo, data_size);
> +
> +	vm_sync = 0;
> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr, data_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -302,6 +362,88 @@ static void test_dontneed_after_mmap(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: dontneed-before-exec
> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU behavior with SCRATCH_PAGE
> + * Test category: functionality test
> + */
> +static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
> +	uint64_t data_addr = PURGEABLE_ADDR;
> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
> +	size_t data_size = PURGEABLE_BO_SIZE;
> +	size_t batch_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = PURGEABLE_FENCE_VAL },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t *data, *batch;
> +	uint64_t vm_sync = 0;
> +	int b, ret;
> +
> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
> +				       &bo, &batch, &data, batch_addr,
> +				       data_addr, batch_size, data_size);
> +
> +	/* Prepare batch */
> +	b = 0;
> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[b++] = data_addr;
> +	batch[b++] = data_addr >> 32;
> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +
> +	/* Phase 1: Purge data BO, batch BO still valid */
> +	if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size)) {
Same comment as in patch-4/9.
> +		munmap(data, data_size);
> +		munmap(batch, batch_size);
> +		gem_close(fd, bo);
> +		gem_close(fd, batch_bo);
> +		xe_exec_queue_destroy(fd, bind_engine);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +
> +	vm_sync = 0;
> +	sync[0].addr = to_user_pointer(&vm_sync);
> +
> +	/*
> +	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
> +	 * landing on scratch instead of the purged data BO.
> +	 */
> +	ret = __xe_exec(fd, &exec);
You can use xe_exec(fd, &exec) which is internally calling __xe_exec() 
and after use xe_wait_fence()
> +	if (ret == 0) {
> +		int64_t timeout = NSEC_PER_SEC;
> +
> +		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
> +				 exec_queue, &timeout);
> +	}
> +
> +	/*
> +	 * Don't purge the batch BO — GPU would fetch zeroed scratch
> +	 * instructions and trigger an engine reset.
> +	 */
> +
> +	munmap(data, data_size);
> +	munmap(batch, batch_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, batch_bo);
> +	xe_exec_queue_destroy(fd, bind_engine);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -332,6 +474,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("dontneed-before-exec")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_before_exec(fd, hwe);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);
