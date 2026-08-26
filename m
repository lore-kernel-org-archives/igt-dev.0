Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBC9C61DBE
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 23:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570F310EE4C;
	Wed, 26 Aug 2026 23:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEE1sSjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972910EE49
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787786649; x=1819322649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FjNcEXeDn4lUE4tP2/bIUWxSA58+2SDOY4cbK78dMZs=;
 b=kEE1sSjGqhWqyJBh1Upx3mn2YsDTLFo2Fd8ddygXSicEn84Pl2ZonrIo
 3BNeAKKRKS2t78VdWzlU+LY88jF96+/c4Bo6ZqCgWwdcQw6gFIhjS8Rv6
 Rz1iSaiCCcrYdW/1VxhWUlwPTmPNWV5tXyeF+Bnjs9r25tWeC22sF9NhK
 v2Gmegoj0qBt4jD14T8jXfYmJKwZ1ZosZyl8GvLjxXxY+Hjq9WZ2VLekw
 I/DLUBu7lKouhhFKQtm1VhkoKGoKEQKH+xWR46hEX2Rcl+9wGAVepnGa3
 uy85xr6Po/aHE9lpHQz9oKHvHtfZ1RLB/WiDv9jVnOsmnJyYf5LT4i6ji A==;
X-CSE-ConnectionGUID: IRrS5KvTTIqMkPhmXPanbg==
X-CSE-MsgGUID: LLIy1BzAQHu4EfNrxiHO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88142833"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88142833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 16:24:08 -0700
X-CSE-ConnectionGUID: +AtMmfeLRa+7KBlm+0hZ+g==
X-CSE-MsgGUID: +IbqaRCMQW6Rj5lt/PUAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="297593309"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 16:24:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 16:24:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 16:24:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 16:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNiIu8kXQjIs7z7OmleLiLXgSsrYuNziQfC4RNos8GRldBQkKjmjc7uxd+9l+0P0sPoTQ84kNskZbE3LmDYvMcXofTyhiW2mLYkm0ZcEt420G8GYWY3wceq3WFaG9C4hfg5C4abqpctGdLDY7cA7ztvsRKcAK4lrgOF+/Yzd1z57pLiT8lQYkn7FKjX9PEgAAt4WbzjMBJxq1iZySgpkyfJH7oQ6LMjPG7myuCuxgkLBP362sZQK7bcU6hkyjIZsRg0RA7zmpr0RVkzz5iVQ8bPRKqnDt2hpyoo1N3g6Yq5iMayaci+DE6DUzmKS2+EkDu2Mp1YSz7OOCzR+0dwZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG/VtlrC7Belq6HUo2L2i4HJRS68AQ7cp8oi/KDb8NE=;
 b=Gks6d+5RkDkBIgjJH+2hNexR/Aw5Nm+LF5/HmvILdTD2VnK7hDPI1u/3cMwcuQbEjopndkORx84LRlWcBAD2k1Br7JSpG5WUPq0SIxt69D1Oq9H0AXob/85zL5Eucqz7JG9eye3zpvUd0ybz8NA/O43inEH9yiF2vkQIP8dYKnlbFbfCEGAi1mFysR4qL/oUHO/xLwEc0d3caCP1aDv7wNtHEgQn3sLJK7OaO9Br0nbPCbWoDLj5LyG+iyrbDYP15PHU74j38dTqiAlvuaeZmJVrxUv/dB69vkDuY8c5VWkAaEq7+gDpLz4amV7Je6nWvOpG4VAllrpLPXj4NYJk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by DS4PPFEE549A404.namprd11.prod.outlook.com (2603:10b6:f:fc02::60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 23:24:01 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%2]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 23:24:00 +0000
Date: Wed, 26 Aug 2026 16:23:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_oa: Add test to ensure entire report has
 landed
Message-ID: <ao91jrbe9V73YBu6@soc-5CG1426VCC.clients.intel.com>
References: <20260821175835.1044076-2-umesh.nerlige.ramappa@intel.com>
 <87y0dvc6a5.wl-ashutosh.dixit@intel.com>
 <ao5rjuOlddVbX70E@soc-5CG1426VCC.clients.intel.com>
 <87wltcditm.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wltcditm.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|DS4PPFEE549A404:EE_
X-MS-Office365-Filtering-Correlation-Id: 5339ed0a-134a-4dd7-d9f2-08df03c91c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DV3Lhw8W6mlz/dGECuhqrQaKFQiEYvwcTyBRppmkiAY+O7qooYR4r7F4+JiLfrBN4umHr/rZSH4KA9eYIzQliZRpHh7dUbj0tGxNSYYQNW0nO5hEGqvF+1813eh9U8Msm66ndAvIgkTahvk9Nq9+6OXzoW51KFwi4dJWdU7ZrHAjuyvH07sYxKRvoObFJJWvjVF3RYhlh75nxA6cHkBEYCHMxJWMam3MfwaKsNhhgMwIugMdRMkBhFWuEpr2PxlOIYa86oD9BuGTZBtr2Ylo1YcXC3Ap1m+CVJWqg0+gpQFasl07Os3m3js/WcptbTsAgdrz6nV+GGP1UyjQssAUGiTfdtIwZKOhfX4r52D+9PVooGTI8c7drJ+hoE7p7SqL34mtFFOIG15GdGBCKSaafLz3YchDo/N7e3aMlcFwF+A99HkTw1MY/1AEzCFBQoSdJPKn0WrBj6cNsL7NHpsY6T5diYHMvY9Esr6m12AjBA5Ic/fKvrtwG1iFWZMpNWAKG5Ade+3Z+0ck48GiYl6T1lRNQHeg3hPIssR56zBgx08SRxO4EShg/eAbz7nTUaC6zbDvWLmT5dWDo5UO4NOQuyqGnAjzMBUQU+IZ/xArl/lyXq2FdonjOpdo2HnWjHmO/NGYGaH2LrxI6kV+5WgdFGkxkTkSsUZJFCPDCizYTMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJ2d2VzSXBVL05IMFRGeTFQb1V6QnYvNHkrZnBCVm14RXVwUWJDNDNzK2l2?=
 =?utf-8?B?RDJ1R2FDRkNMNmszckRTZGZjZVd2RFFCK0lxQm1GUzBvMU14SzR5bnY5RzRv?=
 =?utf-8?B?ZlErbTBiWTl3VEdWVUZrZDlKREZIbUExMFVQa0FjdEwzUmEzTTA2aEVsbi9j?=
 =?utf-8?B?OWs1V1BDTkJJRzVNMGVRb2xoMjh2U2RmYlRZeitubHdQSkNGR1F3ekl4YnVm?=
 =?utf-8?B?RDJONGZvMEFSTzFIaXlSekw4MXNkTWhLQW9Lam5USVFUQ1BITDZjemZIRkJR?=
 =?utf-8?B?QTB6blRaSWdwOFd4OWNiS3M4dDFQZWRaeGwxZ2tSa1VPQWpyYjlNMGs4Rm5a?=
 =?utf-8?B?ZUZoUmcxSVdRcm5FSkExRmhLMG1mcWJxZWwwb3VRWEZTQVNybjZRTkZiUkto?=
 =?utf-8?B?c2krZklSdDBhS25mM0FyTjEyTUFzTzl2c2lIaVpObnBJTzRoejgzTmwyQUFH?=
 =?utf-8?B?YngzTjRLUCtkZDFHNXJONGxvWVZQSTNta1JSa3JVVWwvQ0s5a1NVNzk4NUpS?=
 =?utf-8?B?dEVqdTFYQklLU0dRaUMrdWlYN0lIaWhvRXEvS3RrTk15Ry9oelowdXQxVERU?=
 =?utf-8?B?bmdpL2lLblp5VjVzb3FSRkFILzF4eXF2bHg3Ni92UGFDQTliZFlaN3FtaHNn?=
 =?utf-8?B?QVlHQld1UkUvQ2I1VUlkNWJNc0R0alMvWEU5UWVOMHhua0Z1aGdURk9TMTJl?=
 =?utf-8?B?UkJGbjczcHpoQ01PWWl0b3pZY3FTekR3TjE0TzhVY00zNTE0bWpFN1l0S3Fl?=
 =?utf-8?B?WFNpQXBaWG5IWDZla0UwRlNLSlc1dkFtOFk2WFNOVTBBSUdTa2ZzVWpKZDYr?=
 =?utf-8?B?VDVZb1J5Y0NLZ2lzUDV4MURYNERLbWI0ZDFXdDg3OEFUYlhybVdFMFZvU2lz?=
 =?utf-8?B?alFIb1NaVWxZSlN1T3pwZ3dzK2RWOHNvaXl0NHFBYU9YQVBKSjcwS3BnS29B?=
 =?utf-8?B?Z3d0bENsMHZZRkJtSjNGYThpdnduRHIzd0Nxb1VsYktFVjI0RUtEakRrZE1x?=
 =?utf-8?B?cWhVTU9NMUFxZWdVeGl5dUVGeElSenA2ZUZzZlJlanZKSENDR1hQaHh1c0xI?=
 =?utf-8?B?Ry9pYXpwTlRLZFBHVzgvU0JlRUdpcG8wVDZUK2FwQ1BLL1RSczhVd2VlOHRI?=
 =?utf-8?B?MXN6cTdSNi9nL2pGcUdIYUZodytmUmZNNmNRbXBaWUhSTmpHV0I1UklrSk80?=
 =?utf-8?B?UE5haTFpRTRReXVRbnRRRHlXQVg5YTNGSG1KSU5DVldFSDJmQVFaeVkvM2Yv?=
 =?utf-8?B?Z0I3M1VJOVdZZDI5M3lwdFZ4RnlvYWRQa3dQYThXQ0VPV21IVlUxOG9IQTBj?=
 =?utf-8?B?UWd3Nkl2Z2FLQllvVEZpRmwvSmtCRnJhdHFRaS92ZndLL0dWYXBwKzFMaUpj?=
 =?utf-8?B?VkNmSkk0SmJxVDRGT0NYenVLM3Avd3g1OGY0MDZ0Ujh1ZjBmaUtCWmUxMmti?=
 =?utf-8?B?MndkQnBncEFEMkhwUGpwbDRWdDdMWFFGOGRZR3NsZnZvUTQydXNtUjVNaStu?=
 =?utf-8?B?WEJxQUR3dVI3TzRkZ1RpanZ2ZkxDaFFzRFdHMXFaMjhSRTlOU1NRUEJMYkdl?=
 =?utf-8?B?ckUwcFJyUGgydGtBeGxEZ1IyVFo0SDhUZXMwRkpSMUpiQnpnYi9lUjZOUjFz?=
 =?utf-8?B?bi9GV2ZrZ2FnQWxmZFdPd1BhL1JxZE5YZkhEeWIyblZkWkNWS0hlOTBsNHRQ?=
 =?utf-8?B?RGFVTWJxa2NrT2ovc0tSZ2psdVZWMVdaSGwwb1NvdDQ3Wmdyd3YrTTVNalRx?=
 =?utf-8?B?L0pBamNpV2JQZzNjNlFXWVU3cUpRWndETHN2RUo1YWF3YmNpdjNDNEdSNjVn?=
 =?utf-8?B?U1M3eEw4dFUySXZ5eWNzNmlZZUVJaVlGWm9CeGNxaWFweXRDRXRWVTU1SGh0?=
 =?utf-8?B?WlZFZy8zV0pMajUyVzAra25NN1pLYSt6OXd4WWdmbmlyRGszMGkyczM0WjJs?=
 =?utf-8?B?bnBrYmtPMDdDeUZ0di9HUVB2UE1LWVRkUjA1ZnV0VzlIalZ3VS9EcWNlek01?=
 =?utf-8?B?SElIVzZXdEZZN05BOGZha1BTWGVvVzRBZHJncVdKUkRrZ0U1bG1wN0pzNE43?=
 =?utf-8?B?VGlvcXR1c2JFa0hmUXhMays5QVB4MFBHanRpdWQwZXBmSlBpbS81NEIwSldH?=
 =?utf-8?B?K3VvVHRrWGlES3FHRDhtb0NJeHBPNzVjd1V4bnVVRmJCem9LUWRqSkR4QzRi?=
 =?utf-8?B?UEVBd1FkS0FjcEt3ZVFqTks4N0F1bmQxNFkrNFJoZW1aZHJwdG02RXcvdUNU?=
 =?utf-8?B?RDdsajA1VmtHWDdzSTI3MVNxVzdsclp4QTNIWXFnS0hMOHAzZDJ0UEF4WjhZ?=
 =?utf-8?B?ZXV6WWtKRDlSY25RWEdQS2twTU9wZlVhQ3lwZUtQYWdUUTRIcHZLZkg2NG5q?=
 =?utf-8?Q?gKfCNqZaub5z3ForqzPrf0Cb/PzqDWWgPXBgh?=
X-Exchange-RoutingPolicyChecked: sHa3hpG/xeR/rYBL5+Ze99ky7xSikhOxjDGWyuZi17nN+IuyLd7V0un1WI711ovPogZxwGLdl1RgFQ9ahCVsynRHyQ+fOs7VTGuvwr19fyzbC/Hk8T+2V3O69AwWXdWdFhWGz+40vQzC5crHkHvw54pDBVEagCaVLOMX7SmxyOmZN7Ab+UwnFCCVUxsh2e1HLmfxACTa+BVbGDDhCbMZXcUOeEWaZXu5aE3l3pozf/5Z8MhhxFszUwnfLQH+DZT1Yx1wvHT/ivsrF8LBWQssQa9apWMeDhEf4GTSDakaI8ksdWpmI6yBJP2UN6wu/8DH2kaMTKZbsKFwbVKsVmsk2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5339ed0a-134a-4dd7-d9f2-08df03c91c11
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 23:24:00.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPf8hh/wmv1EZItKyJYHEXlTLUB7qLeLd+uQhoZTGxQgNrvzUu1TcmuCD2IN8uKYb4BJ0aUro1DhCGdtz5+J66OQGcDlX6vtCXb+XJR5B9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEE549A404
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

On Wed, Aug 26, 2026 at 08:04:21AM -0700, Dixit, Ashutosh wrote:
>On Tue, 25 Aug 2026 21:29:02 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Mon, Aug 24, 2026 at 06:56:02PM -0700, Dixit, Ashutosh wrote:
>> > On Fri, 21 Aug 2026 10:58:36 -0700, Umesh Nerlige Ramappa wrote:
>> >>
>> >
>> > Hi Umesh,
>> >
>> >> When running the load helper with a fast oa_exponent, sometimes the OA
>> >> reports land out of order. Ensure that the kernel fix for such issues is
>> >> working by configuring all OA counters and checking validity of the full
>> >> report.
>> >>
>> >> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >> ---
>> >>  tests/intel/xe_oa.c | 211 ++++++++++++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 211 insertions(+)
>> >>
>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> >> index 9ebb18690ec7..2c3ef16e9921 100644
>> >> --- a/tests/intel/xe_oa.c
>> >> +++ b/tests/intel/xe_oa.c
>> >> @@ -336,6 +336,80 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>> >>		.bc_report = 0 },
>> >>  };
>> >>
>> >> +static u32 test_oa_full[] = {
>> >> +	/* PES L0 */
>> >> +	0x13000, 0x3e00, 0x13004, 0x0000, 0x13008, 0x3e00, 0x1300c, 0x0000,
>> >> +	0x13010, 0x3e00, 0x13014, 0x0000, 0x13018, 0x3e00, 0x1301c, 0x0000,
>> >> +	0x13020, 0x3e00, 0x13024, 0x0000, 0x13028, 0x3e00, 0x1302c, 0x0000,
>> >> +	0x13030, 0x3e00, 0x13034, 0x0000, 0x13038, 0x3e00, 0x1303c, 0x0000,
>> >> +	0x13040, 0x3e00, 0x13044, 0x0000, 0x13048, 0x3e00, 0x1304c, 0x0000,
>> >> +	0x13050, 0x3e00, 0x13054, 0x0000, 0x13058, 0x3e00, 0x1305c, 0x0000,
>> >> +	0x13060, 0x3e00, 0x13064, 0x0000, 0x13068, 0x3e00, 0x1306c, 0x0000,
>> >> +	0x13070, 0x3e00, 0x13074, 0x0000, 0x13078, 0x3e00, 0x1307c, 0x0000,
>> >> +	0x13080, 0x3e00, 0x13084, 0x0000, 0x13088, 0x3e00, 0x1308c, 0x0000,
>> >> +	0x13090, 0x3e00, 0x13094, 0x0000, 0x13098, 0x3e00, 0x1309c, 0x0000,
>> >> +	0x130a0, 0x3e00, 0x130a4, 0x0000, 0x130a8, 0x3e00, 0x130ac, 0x0000,
>> >> +	0x130b0, 0x3e00, 0x130b4, 0x0000, 0x130b8, 0x3e00, 0x130bc, 0x0000,
>> >> +	0x130c0, 0x3e00, 0x130c4, 0x0000, 0x130c8, 0x3e00, 0x130cc, 0x0000,
>> >> +	0x130d0, 0x3e00, 0x130d4, 0x0000, 0x130d8, 0x3e00, 0x130dc, 0x0000,
>> >> +	0x130e0, 0x3e00, 0x130e4, 0x0000, 0x130e8, 0x3e00, 0x130ec, 0x0000,
>> >> +	0x130f0, 0x3e00, 0x130f4, 0x0000, 0x130f8, 0x3e00, 0x130fc, 0x0000,
>> >> +	/* PES L1 */
>> >> +	0x13300, 0x7e00, 0x13304, 0x0000, 0x13308, 0x7e00, 0x1330c, 0x0000,
>> >> +	0x13310, 0x7e00, 0x13314, 0x0000, 0x13318, 0x7e00, 0x1331c, 0x0000,
>> >> +	0x13320, 0x7e00, 0x13324, 0x0000, 0x13328, 0x7e00, 0x1332c, 0x0000,
>> >> +	0x13330, 0x7e00, 0x13334, 0x0000, 0x13338, 0x7e00, 0x1333c, 0x0000,
>> >> +	0x13340, 0x7e00, 0x13344, 0x0000, 0x13348, 0x7e00, 0x1334c, 0x0000,
>> >> +	0x13350, 0x7e00, 0x13354, 0x0000, 0x13358, 0x7e00, 0x1335c, 0x0000,
>> >> +	0x13360, 0x7e00, 0x13364, 0x0000, 0x13368, 0x7e00, 0x1336c, 0x0000,
>> >> +	0x13370, 0x7e00, 0x13374, 0x0000, 0x13378, 0x7e00, 0x1337c, 0x0000,
>> >> +	0x13380, 0x7e00, 0x13384, 0x0000, 0x13388, 0x7e00, 0x1338c, 0x0000,
>> >> +	0x13390, 0x7e00, 0x13394, 0x0000, 0x13398, 0x7e00, 0x1339c, 0x0000,
>> >> +	0x133a0, 0x7e00, 0x133a4, 0x0000, 0x133a8, 0x7e00, 0x133ac, 0x0000,
>> >> +	0x133b0, 0x7e00, 0x133b4, 0x0000, 0x133b8, 0x7e00, 0x133bc, 0x0000,
>> >> +	0x133c0, 0x7e00, 0x133c4, 0x0000, 0x133c8, 0x7e00, 0x133cc, 0x0000,
>> >> +	0x133d0, 0x7e00, 0x133d4, 0x0000, 0x133d8, 0x7e00, 0x133dc, 0x0000,
>> >> +	0x133e0, 0x7e00, 0x133e4, 0x0000, 0x133e8, 0x7e00, 0x133ec, 0x0000,
>> >> +	0x133f0, 0x7e00, 0x133f4, 0x0000, 0x133f8, 0x7e00, 0x133fc, 0x0000,
>> >> +	/* PES L2 */
>> >> +	0x13500, 0x7e00, 0x13504, 0x0000, 0x13508, 0x7e00, 0x1350c, 0x0000,
>> >> +	0x13510, 0x7e00, 0x13514, 0x0000, 0x13518, 0x7e00, 0x1351c, 0x0000,
>> >> +	0x13520, 0x7e00, 0x13524, 0x0000, 0x13528, 0x7e00, 0x1352c, 0x0000,
>> >> +	0x13530, 0x7e00, 0x13534, 0x0000, 0x13538, 0x7e00, 0x1353c, 0x0000,
>> >> +	0x13540, 0x7e00, 0x13544, 0x0000, 0x13548, 0x7e00, 0x1354c, 0x0000,
>> >> +	0x13550, 0x7e00, 0x13554, 0x0000, 0x13558, 0x7e00, 0x1355c, 0x0000,
>> >> +	0x13560, 0x7e00, 0x13564, 0x0000, 0x13568, 0x7e00, 0x1356c, 0x0000,
>> >> +	0x13570, 0x7e00, 0x13574, 0x0000, 0x13578, 0x7e00, 0x1357c, 0x0000,
>> >> +	0x13580, 0x7e00, 0x13584, 0x0000, 0x13588, 0x7e00, 0x1358c, 0x0000,
>> >> +	0x13590, 0x7e00, 0x13594, 0x0000, 0x13598, 0x7e00, 0x1359c, 0x0000,
>> >> +	0x135a0, 0x7e00, 0x135a4, 0x0000, 0x135a8, 0x7e00, 0x135ac, 0x0000,
>> >> +	0x135b0, 0x7e00, 0x135b4, 0x0000, 0x135b8, 0x7e00, 0x135bc, 0x0000,
>> >> +	0x135c0, 0x7e00, 0x135c4, 0x0000, 0x135c8, 0x7e00, 0x135cc, 0x0000,
>> >> +	0x135d0, 0x7e00, 0x135d4, 0x0000, 0x135d8, 0x7e00, 0x135dc, 0x0000,
>> >> +	0x135e0, 0x7e00, 0x135e4, 0x0000, 0x135e8, 0x7e00, 0x135ec, 0x0000,
>> >> +	0x135f0, 0x7e00, 0x135f4, 0x0000, 0x135f8, 0x7e00, 0x135fc, 0x0000,
>> >> +	/* PES L3 */
>> >> +	0x13700, 0x7e00, 0x13704, 0x0000, 0x13708, 0x7e00, 0x1370c, 0x0000,
>> >> +	0x13710, 0x7e00, 0x13714, 0x0000, 0x13718, 0x7e00, 0x1371c, 0x0000,
>> >> +	0x13720, 0x7e00, 0x13724, 0x0000, 0x13728, 0x7e00, 0x1372c, 0x0000,
>> >> +	0x13730, 0x7e00, 0x13734, 0x0000, 0x13738, 0x7e00, 0x1373c, 0x0000,
>> >> +	0x13740, 0x7e00, 0x13744, 0x0000, 0x13748, 0x7e00, 0x1374c, 0x0000,
>> >> +	0x13750, 0x7e00, 0x13754, 0x0000, 0x13758, 0x7e00, 0x1375c, 0x0000,
>> >> +	0x13760, 0x7e00, 0x13764, 0x0000, 0x13768, 0x7e00, 0x1376c, 0x0000,
>> >> +	0x13770, 0x7e00, 0x13774, 0x0000, 0x13778, 0x7e00, 0x1377c, 0x0000,
>> >> +	0x13780, 0x7e00, 0x13784, 0x0000, 0x13788, 0x7e00, 0x1378c, 0x0000,
>> >> +	0x13790, 0x7e00, 0x13794, 0x0000, 0x13798, 0x7e00, 0x1379c, 0x0000,
>> >> +	0x137a0, 0x7e00, 0x137a4, 0x0000, 0x137a8, 0x7e00, 0x137ac, 0x0000,
>> >> +	0x137b0, 0x7e00, 0x137b4, 0x0000, 0x137b8, 0x7e00, 0x137bc, 0x0000,
>> >> +	0x137c0, 0x7e00, 0x137c4, 0x0000, 0x137c8, 0x7e00, 0x137cc, 0x0000,
>> >> +	0x137d0, 0x7e00, 0x137d4, 0x0000, 0x137d8, 0x7e00, 0x137dc, 0x0000,
>> >> +	0x137e0, 0x7e00, 0x137e4, 0x0000, 0x137e8, 0x7e00, 0x137ec, 0x0000,
>> >> +	0x137f0, 0x7e00, 0x137f4, 0x0000, 0x137f8, 0x7e00, 0x137fc, 0x0000,
>> >> +	/* FLEX */
>> >> +	0xe458, 0x0000, 0xe45c, 0x0000, 0xe558, 0x0000, 0xe55c, 0x0000,
>> >> +	0xe658, 0x0000, 0xe65c, 0x0000, 0xe758, 0x0000,
>> >> +};
>> >> +
>> >
>> > Need a comment above this stating what these values are. They are similar
>> > to TestOA reg/val pairs, but not exactly the same either. If these are from
>> > some XML, we can even add that XML (even the original, not the converted,
>> > XML) to the patch and merge it? And refer to the XML in the comment?
>>
>> For now only 2 events are defines.
>>
>> 3e00 is "Number of GPU (gt) clock cycles at every clock period"
>> 7e00 is "Number of GPU (gt) clock cycles at every other clock period"
>>
>> The plan is to integrate the XML into IGT somehow, but in a future patch.
>>
>> >
>> > Apparently these result in all 8 byte counter values in a report non-zero,
>> > correct?
>>
>> correct
>>
>> > Or is it at least one 8 byte bit counter value in a 64 byte
>> > cacheline?
>
>In that case, shouldn't we be checking that *all* 8-byte counters in a
>cacheline are non-zero, whereas below we are only checking if "at least
>one" 8-byte counter in cacheline is non-zero? Or am I wrong?

One counter being non-zero is sufficient to check that the cacheline 
landed in memory. The logic can be simplified further by just breaking 
from the inner loop on first non zero value. I can do that if needed.

Thanks,
Umesh

>
>> >
>> >>  static bool oa_trace = false;
>> >>  static uint32_t oa_trace_buf_mb = 1;
>> >>  static int drm_fd = -1;
>> >> @@ -3740,6 +3814,137 @@ test_whitelisted_registers_userspace_config(void)
>> >>	xe_oa_remove_config(drm_fd, config_id);
>> >>  }
>> >>
>> >> +static bool oa_report_valid(u64 *report, u32 report_size) {
>> >
>> > Maybe cachelines_non_zero() or such is a better function name?
>> >
>> >> +    u32 blocks = report_size / 64, i;
>> >
>> > s/blocks/num_cachelines or num_cl or such? Anyway, maybe just changing
>> > function name to give some hint of what it is doing is sufficient. But
>> > better variable naming won't hurt either.
>> >
>> > Assuming OA buffer is cacheline aligned in the kernel, what we should read
>> > here are actual cachelines. So alignment we specify in the kernel is 0,
>> > which means 4K aligned, so we're good.
>> >
>> >> +
>> >> +    for (i = 0; i < blocks; i++) {
>> >> +        u64 *block = &report[i * 8], or = 0, j;
>> >> +
>> >> +        for (j = 0; j < 8; j++)
>> >> +            or |= block[j];
>> >
>> > So checking here for at least one 8 byte bit counter value non-zero in a 64
>> > byte cacheline, correct?
>>
>> right, renaming for clarity
>>
>> s/oa_report_valid/cachelines_non_zero/
>> s/blocks/num_cachelines/
>> s/block/counter/
>>
>> >
>> >> +
>> >> +        if (!or)
>> >> +            return false;
>> >> +    }
>> >> +
>> >> +    return true;
>> >> +}
>> >> +
>> >> +static uint64_t oa_full_config(void)
>> >> +{
>> >> +	struct drm_xe_oa_config config;
>> >> +	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>> >> +	char path[512];
>> >> +	u64 config_id;
>> >> +
>> >> +	igt_require(has_xe_oa_userspace_config(drm_fd));
>> >> +
>> >> +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>> >> +	if (try_sysfs_read_u64(path, &config_id))
>> >> +		xe_oa_remove_config(drm_fd, config_id);
>> >> +
>> >> +	memset(&config, 0, sizeof(config));
>> >> +	memcpy(config.uuid, uuid, sizeof(config.uuid));
>> >> +
>> >> +	config.regs_ptr = to_user_pointer(test_oa_full);
>> >> +	config.n_regs = ARRAY_SIZE(test_oa_full) / 2;
>> >> +
>> >> +	return xe_oa_add_config(drm_fd, &config);
>> >> +}
>> >
>> > OK, this is basically following pre-existing code.
>> >
>> >> +
>> >> +/**
>> >> + * SUBTEST: non-zero-reports
>> >> + * Description: Test that the entire report landed.
>> >> + */
>> >> +static void
>> >> +test_non_zero_reports(const struct drm_xe_oa_unit *oau)
>> >> +{
>> >> +	/* ~20 micro second period */
>> >> +	int oa_exponent = max_oa_exponent_for_period_lte(20000);
>> >> +	u64 fmt = default_test_set->perf_oa_format;
>> >> +	u64 config_id = oa_full_config();
>> >> +	size_t report_size = get_oa_format(fmt).size;
>> >> +	u64 properties[] = {
>> >> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>> >> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>> >> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, config_id,
>> >> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> >> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> >> +		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> >> +	};
>> >> +	struct intel_xe_oa_open_prop param = {
>> >> +		.num_properties = ARRAY_SIZE(properties) / 2,
>> >> +		.properties_ptr = to_user_pointer(properties),
>> >> +	};
>> >> +	u32 buf_size = 2 * buffer_fill_size;
>> >> +	u32 total_len = 0;
>> >> +	u32 oa_status;
>> >
>> > Can we please move all these u32's to the same line.
>> >
>> >> +	int len;
>> >> +	u8 *buf;
>> >> +	char msg[32];
>> >> +	bool report_valid = false;
>> >> +
>> >> +	buf = malloc(buf_size);
>> >> +	igt_assert(buf);
>> >> +
>> >> +	igt_debug("Ready to read about %u bytes\n", buffer_fill_size);
>> >> +
>> >> +	stream_fd = __perf_open(drm_fd, &param, true);
>> >> +        set_fd_flags(stream_fd, O_CLOEXEC);
>> >
>> > spaces instead of tabs here...
>> >
>> >> +
>> >> +	load_helper_init();
>> >> +	load_helper_run(HIGH);
>> >> +
>> >> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >> +	while (total_len < buffer_fill_size &&
>> >
>> > Is this total_len sufficient to detect out of order cache-lines? I though
>> > we'd need a few passes through the OA buffer. E.g. does this test reliably
>> > fail if we reduce LAG_REPORTS in the kernel to a value < 32?
>>
>> It fails the first iteration itself on BMG without the KMD changes. The 3
>> buffer fills, IMO, is not needed since we rely on multiple CI runs
>> anyways. The 3 buffer fills was more of a 'catch corner cases during buffer
>> wrap' thing. That is handled in other tests.
>>
>> Thanks,
>> Umesh
>>
>> >
>> >> +	       ((len = read(stream_fd, &buf[total_len], buffer_fill_size - total_len)) > 0 ||
>> >> +		(len == -1 && (errno == EINTR || errno == EIO)))) {
>> >> +		if (len < 0 && errno == EIO) {
>> >> +			oa_status = get_stream_status(stream_fd);
>> >> +			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>> >> +		}
>> >> +		if (len > 0)
>> >> +			total_len += len;
>> >> +	}
>> >> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>> >> +
>> >> +	/*
>> >> +	 * Since we are lagging actual hw_tail, there should always be data
>> >> +	 * after we disable. We cannot risk reading in a loop since the code
>> >> +	 * will block once we have drained all the data.
>> >> +	 */
>> >> +	len = read(stream_fd, &buf[total_len], buf_size - total_len);
>> >> +	igt_assert(len);
>> >> +	total_len += len;
>> >> +
>> >> +	__perf_close(stream_fd);
>> >> +	xe_oa_remove_config(drm_fd, config_id);
>> >> +
>> >> +	load_helper_stop();
>> >> +	load_helper_fini();
>> >> +
>> >> +	igt_debug("Read %u bytes\n", total_len);
>> >> +	igt_debug("Read %u bytes after disable\n", total_len - buffer_fill_size);
>> >> +
>> >> +	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
>> >> +		const uint32_t *report = (void *) (buf + offset);
>> >> +
>> >> +		report_valid = oa_report_valid((u64 *) report, report_size);
>> >
>> > I think, no space betwen the cast and the variables in the above two lines...
>> >
>> >> +		if (report_valid)
>> >> +			continue;
>> >> +
>> >> +		if (offset)
>> >> +			dump_report(report - report_size / 4, report_size / 4, "previous");
>> >> +
>> >> +		sprintf(msg, "failed report %08x", offset / 576);
>> >
>> > s/576/report_size/ ?
>> >
>> >> +		dump_report(report, report_size / 4, msg);
>> >> +		break;
>> >> +	}
>> >> +
>> >> +	free(buf);
>> >> +	igt_assert(report_valid);
>> >> +}
>> >> +
>> >>  #define OAG_OAHEADPTR (0xdb00)
>> >>  #define OAG_MMIOTRIGGER (0xdb1c)
>> >>
>> >> @@ -5040,6 +5245,12 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>> >>			test_non_zero_reason(oau, SZ_128K);
>> >>	}
>> >>
>> >> +	igt_subtest_with_dynamic("non-zero-reports") {
>> >> +		igt_require(!igt_run_in_simulation());
>> >> +		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>> >> +			test_non_zero_reports(oau);
>> >> +	}
>> >> +
>> >>	igt_subtest("non-sampling-read-error")
>> >>		test_non_sampling_read_error();
>> >
>> > Thanks.
>> > --
>> > Ashutosh
