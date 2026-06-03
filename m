Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DE8CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 09:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BC710EF2D;
	Wed,  3 Jun 2026 09:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U47KonnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D010EF2D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780478489; x=1812014489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wpIJsr/GpaSM/YdPFUFN09hsIM6MYJy7quOKbaki+Uo=;
 b=U47KonnKLC+OmjSd4zmkPz8f8LZP96C/EKtheFl5K+nzvRhrGBCfea6p
 FP4iaZ+L/X7HcrLGvZvDW/XvYA57XtAwunRkHm/OzfFyOR4RJjENcstpn
 DuDwZdz/FLtJIRLZkcdyL0qryjzgxhwOKZq2VTO1BfLQvuCrJ8VA2ZS1z
 Ug+C3hyEyyfDAbseOnGcaEPJ0/kn0dcwtyhHr6FyDhbB2OLgwilUj/Mgt
 mWd/gyNtf4qTAc9Q9OI0w2kQWlhm+wGzIKpMGFRHV3ounY3jYGwHusNWB
 KBOWaGh5vs1M6v7rBVGVxzzn6fiRRqoQW9hY1EvCshU0iU+jANQniKBsR A==;
X-CSE-ConnectionGUID: EpEcEFaKSMuwSiYDMCZsTQ==
X-CSE-MsgGUID: 8iQJBAIRT9GZI/JDvkND3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85135183"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="85135183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:21:29 -0700
X-CSE-ConnectionGUID: MCw2kJeMT62gMZO7hNw3uA==
X-CSE-MsgGUID: ED87Zz3lQqiGrdqdSJbopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="241680530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:21:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:21:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 02:21:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnAUrR4zMcyi/ZtMN8NoxMDyHZKAfGI7oT9kaBqtxbaIiqnm6pEdkadISGomzuWD75jUyp07+wS2O3bXpHvN2Xzp2IUqaffU7maYkqkOW9EspZfuAUmHfeF9l9mAcf3Pl1n3WBTjIMNWYCz3AlVv0xrtSXDXFR88OhgDSK8zm2hLHWIGrBo88JHI/tPGOHTZe+WmjGu/WU8bZYQwcltT0d30aiexmTekHFq1iTeJTre/9yI+AfZDMXPPqMavZCk5I2fPBELBesLVqSMWZUYrVMDEQFZK5mXRXKdXVYDhiitbNzXEzbgUznVe0jqJMZZnnO0Yoffi2OuSA4BgL/aRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN+ylocxokyPzt3YAonD34z8t4XsPDw8COkQ69lhgyM=;
 b=kdr3KNArlt25TKaMLXI6cyRTy9aA+yFRE5wV4O9okYswOtEgksxjEWCxfwXC5okZP9cNL/ijp7qRVbd/ksZkb/8jL9Ow7n46eAbZk1Zb00X/lqyDtQR1XT5Q+K8gnNZ4L4Iy2eg7eztsULdkoI5Ruak9M/RTMQwlaDrtLxxZVSucYVtCw2FS3DJ0tArXDSyHMsUOKMIYmtzwESZLv+WxQ0nd6ZVA2AEFLedTsZtbjrh9Sg8GuyqEDbBLfUzGKNEasIKlNSYoiEYfeWFyak/G/ONf7BLBWsI+KV/8Tc5yWKYt0UVGftKSe6SUBPmKVnc9xmgqrjNks0KXI1awDJUr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DM6PR11MB4580.namprd11.prod.outlook.com
 (2603:10b6:5:2af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:21:15 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.21.0071.014; Wed, 3 Jun 2026
 09:21:14 +0000
Message-ID: <e45feb28-b050-4028-a16a-0ba22309d9b0@intel.com>
Date: Wed, 3 Jun 2026 11:21:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] lib/genxml: Introduce Mesa genxml infrastructure to
 IGT
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20260602223756.2543404-1-jan.maslak@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260602223756.2543404-1-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a77aa5-a678-4fd1-5f82-08dec15175bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799007|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q4qEvnzgYpEhyYAZ5b9xv6SzM4PicTRwFzbolSdS6OR7Op7PKMg8RM8XjVIkpQ8W7Mpd5ZCb8rGfTdnQqPXBNswqdaWVra443Xm0A+3D3L2IyzIZNP+iyIoZEixqpcYJNawdfNliBbdGGUacvpoDKEX89P2QFdCVgg7A/3RIZrOc31I02vSElu1phG0WZw06HbLS+Fm6RKiF+U/jbkhPR9RJa3US7JCdZeko2Bk7Rc35K2QiiAis97bL2K1Sr+ktwUzQIni4zT1pPWMKo8KwgxJTOPP6eKu1N+gAVhS+vTUJe4azStFDdNaJbG4hSqPADA9DqIgX77s0mADGFswkY8le/Bkie2dhMPIISgJI9etn058VcDzGHZHjzUY2iqFffWsTsPAmKTDBFV4VvdnDQC+Sn4KPLr/YOh6nv/TSn/xkR/wSEfBfIn/1XB/6+3vKfXOmjsudLdFRgWtiHoQdNQ5pAJTGy/P3/7vHkhTpWJ6Q8/CbNZ57kStBCgYIbaUf2AOO5PJpS9ydrT7k/VfM4KMd9x9yy0FQHk+i4lORCc78cIP32H5EHIXjAjzXfnsvbnSDY78WyaualfjCXTinHNJnvgqfoeD3TfHrMVmIN7SlcBG1MKcawR6KS9cJl5vNZaI3bgOopDn/2f3Ca1dBxfcVKrFkBsVflXGOIWchTXfA3JBoz+EveZmN6iyo2eDO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjBhK3BUN05zbkhKdXBkRklEQllxRXRYKzJiZEllUXFYblhuRitEVWo0SVRQ?=
 =?utf-8?B?YkRzT3pEWW9makIxaytCajVQVVVjRXRydnpWSzlwTW1HNjVONnNGeDgvazlF?=
 =?utf-8?B?NSsvckNwellyUUZiZUo0dXA1OVhWY0VKVTVDSytsOEp3V1NRdGtKSnNMTVV1?=
 =?utf-8?B?bjFBNmUxalNFNVcyNHBiZEpnbVhlbnFZZXpJZ3RCQXdVL0ZSM25INFRIZ29D?=
 =?utf-8?B?NTczcnV2QlVGVmdJM3QyVlVtRmNSclMvdEhUNlVzNkVCY3RlUUpwV3lrVlRv?=
 =?utf-8?B?aGRrWHhQR0h0YjRQdzNJbVVBM0pGSUhWQUFONk44TlBOZkhUMFQrMXhMVWY2?=
 =?utf-8?B?RUZidkZRR0xwNXlUMENaeU5laUZDLzdFc1JJUk5uelUxckgzaGxqYk1lYmJY?=
 =?utf-8?B?bk9qVkorZjZUYmJiVXNtQVFoTUlrR1pXdyt3elZ3V1lZakI0Um5SaTJlU0pK?=
 =?utf-8?B?YW9mTU9nb2ovaWZHT3hzRFpCV2FqdTdkRWFTTkV0cFN0Z0NMOElsQXliOVl2?=
 =?utf-8?B?ZUZLZG1NNnZkNTIzZmNxdjNRaFFNQWRiSEYzalMyeklweE45eU5Hb1RhV2tu?=
 =?utf-8?B?ZklrU0JSNTZnR21vMURtVkUzM2RvVzlTYy8zYUNlb0pKWGo1L1lzVi9mQlBX?=
 =?utf-8?B?L1o0Q0lxaGJQQ2pxU2xBRkUwOGRZOXNQd0xlRm1oMWU3Ry9uTVErUUpSMGNt?=
 =?utf-8?B?OUdLRzRwdHhGTHdFbjdpUW1ic2kxVUhXMVA2UW1rR1NPeDFWOTIwTU1VYjdm?=
 =?utf-8?B?NEduTytsSDRyQXpoQmg5RExFNmFFUWRKN2IyRlEvTTNaR0t3U3F6R095NWdL?=
 =?utf-8?B?RTlqOThMWkJpdmpvRENCRnREdDV5NFBmcmxtVHJ1a21vU2JYTCsrTy9kNlRT?=
 =?utf-8?B?Vmx5NElYaFp3bzYvRzFxRW9CWVZXR2xZZ2haTHBlVUJBMTVkaE82V21kRjly?=
 =?utf-8?B?QVFaUlZjcFJ4dHE0cGR5U2lkK3JRcVlMTHo3K3ZLcnplVFVNS3Y1WWsyQ0M5?=
 =?utf-8?B?WkNKemNHTjlCcVVEaE83MStGWHNXTmdETzM0cjNTR00xazNXQ04ycnB2bzI0?=
 =?utf-8?B?NjVZZjZKeWFKWDhESDQ2eEUvSE9LaElmSVN5MEFwQVpwYy9nbWxjUnp5OTB2?=
 =?utf-8?B?SUZ4clV2c21vRmljWGpKTlI5YllIa2RBbFBneXNiS29rT2RsbVlKZUZPVlFS?=
 =?utf-8?B?SHNOL1o3M0pydnJTbDhHSVB5RGdoSFp1di9IVzhjejJtQU95MElLQTlZaFk1?=
 =?utf-8?B?T0pVZ2wrWFQxbitsQUw4eWdNTnhjKzI5Ym8xTEhscU51QkxETGM4RVVqN0hO?=
 =?utf-8?B?SjJqNzFZazRtRm1pZng2UkN6Qk8rc2E2cmRucTRuZHR3V3d6MmZ6alJwVnBB?=
 =?utf-8?B?ekJuY3FWcFlEcWZ0eVdZZjJ4RWJ4SHlNdFRjOE1ZSk5mYmIrNmZuaEZZTUZ3?=
 =?utf-8?B?QUlFSXZCL1EvK1Jla3dTS0FwZ2ZBWWpHNG51Sk15N3JDelRZbVNFWWJ0Q3ha?=
 =?utf-8?B?TkVlVVR2L0NmREl5am84N0N3VC9MWkMzNGl5bmo5Q2tIZkVBNUtqZGZXaUhT?=
 =?utf-8?B?bE9RRzFESWloekFEWUdYL1Q2UTNPWU1TR29XeFZJWFdYbUdjdzR6RDBYR2h5?=
 =?utf-8?B?UWlJcXVrSGViK2NNL1VudXhJZWhUbU9STklwMlFDT2pzb0dTUGtQa1ByTTVs?=
 =?utf-8?B?UldrUXpDcUYvZDdzNE8xekk4bHQvS0lTdjRaWjNXYlRnaVg3VmcyOHM2V0Vo?=
 =?utf-8?B?UkUxUEc4Z1lLY2NDT1BjempEUFMzcWNWMFA0VGlFeFhId2thN2VMTWNuaEVQ?=
 =?utf-8?B?YlFyOGRqcEJ3My94Tk0zNDlxekY4THN5aDRaSFhTSlowVE0vNmg4YXpUVDM3?=
 =?utf-8?B?bjRhOUxKeWlXRkZvbDZJK2RmTi94K3pZS2NFcVNTTnY2MjJzVlM5aURuWCtn?=
 =?utf-8?B?MmZVWnVyNmo1ZG11ZURITUloUFhFQXFzeTJkTE5EdGtqb2dBMDJYWWVmalA0?=
 =?utf-8?B?cHlzbkY5UUZoWVF5dmhka0xqbVpsbnpvSytqY0Yza1M4QTdja0VIbnpMd0NY?=
 =?utf-8?B?YVBScTIxUmYzMVhpZ2NzTEo5RDNNR3RVWFZ4TTVnTFBmZHdTQWdRZCtWc3dZ?=
 =?utf-8?B?RnpDUnhmdkxKeWtFQ2dBT2oxV1NERk9NeFFGOFdGR2p3VXFNR253NHBFTFRD?=
 =?utf-8?B?emlESENGVVpQU1o5Uy9MVzJOZElWZVBYaHhkd2ovcmxJbzdzOVhab1ZOWFlC?=
 =?utf-8?B?Z3A3NlBjdk1kM3JORE0rOXNZRUF2VHYydTF0ZElIZVl6aEptUm96VnVHbWs5?=
 =?utf-8?B?WndvdVBnQlhzbk9kVmhqWnpqRWUrM08wTU9uakE1REhjWG1qVTNPQT09?=
X-Exchange-RoutingPolicyChecked: Se0eyxgqS1zNtXBNy6iedkIzVwdT2kOA6d5IgZDRql0F4oJSt/73JPN2P+8O2jlsq+GWk1znlvjjpfLYiZrNUwwSnfGk8AvfaXosi2CJjcQdeU0RfEIQa5ae1IL4gtqjkIHKiRnXkY0QS4CoKzfAwtSLqj8Moaf7JWbuO7qHSZD+I24rRPQ/gVi6kk1EPUURnRyvA9z2LaacicgljUCtFpEgCjrroq1rTgTtL51iSbzotyTan6LiH60jb5sgFA+NPZ4R9+XTO+K+Xjz6DxMj1cCHM57eLhDVmhZd8k5wpIXW7mkA/q9Kzkh5KbNGEceCwexk+MRztZvDFBcwtGqK7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a77aa5-a678-4fd1-5f82-08dec15175bd
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:21:14.7956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQu9JKkbqaIjdQkevkx1sgyUFXxJaloyzIxVtAH7IjqRoxFavPxiyOT2e2Y4uYc+AxvEGASv4QUuyIFZwg2KjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

W dniu 3.06.2026 o 00:37, Jan Maslak pisze:
> Currently IGT uses raw intel_bb_out() calls for setting up the render /
> compute pipelines. Fields are set by shifting and OR-ing hand-computed
> constants, with field names and bit positions hardcoded and sometimes
> explained in comments. A lot of code has branching based on generations,
> making pipeline setup more complex as the new generations come in.
> 
> Meanwhile Mesa uses a system called genxml in which XML files describe GPU
> commands, state objects, enums, and registers - specifying the field layout
> down to individual bits. A Python generator then produces C headers with
> typed structs, pack functions, and named constants for each command/state.
> 
> By bringing genxml to IGT, we can achieve a more maintainable and less
> error-prone codebase. Instead of manually calculating bit positions and
> creating complex branching logic, we can fill out the structs generated
> from XML descriptions, and the packing functions will handle the bit
> manipulation automatically.
> 
> This series brings Mesa's hardware XML command/state definitions and
> gen_pack_header.py code generator into IGT, adds a new IGT-written
> batch buffer decoder (gen_decode_header.py), and converts rendercopy_gen9
> to use the generated pack headers.
> 
> Patches 1-4 import the generators, headers, and XML definitions.
> gen_pack_header.py is taken from Mesa with C90 compliance fixes and a
> new baseline deduplication mechanism - when a platform's command layout
> matches any older generation exactly, the item is omitted entirely.
> gen_decode_header.py is a new IGT-only file that generates per-platform
> decoders for instructions, structs, and registers. The XML files are
> imported from Mesa split by generation: gen4-gen8, gen9-gen12.5, and
> Xe2/Xe3/Xe3p.
> 
> Patch 5 adds intel_get_wb_mocs() and intel_buf_mocs() helpers that
> return the correct 7-bit genxml MOCS field value.
> 
> Patches 6-9 convert rendercopy_gen9.c to use the generated pack headers,
> replacing hand-written intel_bb_out() calls with igt_genxml_emit and
> igt_genxml_pack_state, split by functional section.
> 
> Patch 10 adds an opt-in annotated batch dump to intel_bb_dump(): when
> IGT_BB_ANNOTATE=1 is set a companion .annotated file is written alongside
> the raw hex dump, decoding each command's field names and values.
> 
> Tested on LNL and DG2 (xe_render_copy render-square, render-full;
> xe_intel_bb render) and TGL (gem_render_copy_redux; api_intel_bb).

Great work. Didn't have yet time to analyse it more thoroughly, but the 
1st impression is very positive.
Kudos for working on it.
Since it is already working in mesa I guess it will work in IGT as well.
Few questions/remarks:
0. Please use patchset versioning (eg. git format-patch -3, or b4 tool 
which will do it 'magically').
1. Mesa synchronisation - I guess this infra is changing over time,
so we need straightforward way to check/update required files.
Maybe it can be described even in commit message (as it is currently in 
patch01), but IMO better would be to split import patch to show the 
difference:
a) import only patch, with reference to mesa commit.
b) IGT fixups - this way we will see what we need (or not) to fix on 
future imports.
c) IGT additions - only once.
2. intel/genxml/xe3p.xml seems very thin and misses multiple changes in 
compute frontend - I guess some delays on up-streaming process. So more 
general question how these files are related to bspec and how should we 
handle differences.

Regards
Andrzej


