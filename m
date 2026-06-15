Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF4DCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 04:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202A510E181;
	Mon, 15 Jun 2026 04:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcR2B74n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2988310E181
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 04:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781497083; x=1813033083;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7xwu9LqZRwAj9Tw5Sz9ouaiNug5xqZ3gq26WA3F8iLc=;
 b=bcR2B74nM+alMLk46Rc/bAzE7uX9m7LXnrmSQ/+riaqyqUhYNJj2/6hd
 caQKajInKtRCKfMuAEB+JPLhUpFj3K2OnbmCoKCmYbFy2oP08w0kkm71B
 MvArB4YvX9qE1YPK7xs4zFgxUUX82iYcMTVZDL7QZPXKkJQKZr0cuE6X+
 OemnRCXqfF3Pi8PFppUC6GedPd2wNKHsn9jkx+LCEU1Z53310EPAx93Y/
 LAI4S7+/GjHXNLvc/NzIN2OchlzMBfxoe/w0TzKYg8jNEJPuBq/qK5YAi
 O3t1l7oiEahWuvL6kfI27j6mQSiYVYTYQQf5aukQtq+WmAPTkdZfa4icX A==;
X-CSE-ConnectionGUID: wbNesvlvTQanSt7ttiDjzg==
X-CSE-MsgGUID: Vn988N9pQfaD4/zPASNxaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69775396"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="69775396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:17:49 -0700
X-CSE-ConnectionGUID: XIjcXXbsR62CcK/347jW3g==
X-CSE-MsgGUID: GYWuJZ+NSpCk0NHZvXWmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="244962647"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:17:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:17:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 21:17:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKNQldQMeZDuJNhsBYD7Io4oQfp/EVyFz/d01SWfWUW025XPtTWbFf3FQKjtrklbQHeHuwJcGCGucv+5zxcXFYRz+VKMc7C3AI/SKuW4z3ww6lBua1/bQc3/vAx1QulbbjhPU+GAl8hIbyb39k1y2kMK4PjeFUW74hgzgedA0Z3PQ3yptRkLLaNWckiV3FKJj2mIir50LBvEIRf3fstKdiEvG2KkH3CPpdf/7cRvo7L/NjPmRi1vQGbOEPAlhEEgSCH30Q+yVh+I1KmvCNUNuaQdSXz5L51DjKFumxZHkn+fMfVRddTMJ+XKL14lBuvF/jqgjbtBIKTjluRM50NeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6HRxlgm5m+hF//cF4MnY5h6uY+bfw6i6Q1Z6PNTb08=;
 b=tjgjVTswSw1w6uNm/0QYeDtGuVrrJGeg486TywF1RKBbzUrSG2j52W1CKeqON5rwPe9jSTVPvCAmmTTDr74Yg/BEdgi4sutCEbY+vRFoAGahCul6qgnJdENl4ZEnI2pTIKY1VXICo/XHoWBTeWWBm9Tr9gGAdu5wOHgoX0vMF5Xpx9ClLI3aXpWlJHXWMoOxMs73UPlxzuPyYY4YLG2QfjfBb24f8Dz7g4xZlmuiAOL7O5L9LvPN88r3ACffa8B90Da+6SYU37B9bR+ioMnRBkTnUQIqNl6n9sQr8z1F6E+/FYk7WKNJFjpbUUgKpJMljUKoOnYf3gFS8Pgceq5edQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 04:17:45 +0000
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::da8c:2ab8:2fc2:91b3]) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::da8c:2ab8:2fc2:91b3%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 04:17:45 +0000
Message-ID: <a3f97e5e-7a59-4711-ac63-abe9dbf39b18@intel.com>
Date: Mon, 15 Jun 2026 09:47:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <piotr.piorkowski@intel.com>,
 <kamil.konieczny@intel.com>, <nishit.sharma@intel.com>
References: <20260611094321.367638-1-sobin.thomas@intel.com>
 <20260611131442.s664iiyiecdaic4s@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <20260611131442.s664iiyiecdaic4s@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF07B018B9F:EE_|DM3PR11MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: d67a21c8-fca1-4949-43a6-08deca950cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|56012099006|3023799007|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Lalv3hIgl1L2GtFENNpN2keyPwVsUshouLf4o3PB4rZUiHjjzMLeGiGv2UJgc5pkD0hNJ+lNNUnr8HZ0Wdfq2M/CnLz+O4JobyG0US29vJ7HwvXGWGwMDXjCsD+F5t0b1iVArgk8Up7BKEnL7LqpvIQYhrLNsh9Jcqio3k6cC7opV3/YeITLiMBL6XWtaL/r8Gfpf7JHRlcI9ZKF2bV5IU+FxdNMJ2VS76KAVBT1fTxIZNv1RMwvQ6MUfAK8wtVD0ujy7mlUCpvMpL1fFqB5q/L6aoA8gGQjO/O2fw7q5xcKFIMZYrW4SoQxMKPplPkjI2YP44QsN21f3P6MbgINnO3a9PAH36uuf/MtNSpZ5/i7pZlXyVMtNXl/Y1JvZH+/xy2Y1EJt88Rpp5r+Eao6T97dAVG4lMp9O7QsZEeHFH1lm9FwGn/dN4bTbmVnOeBNsXI0sXn1aHlHPikPS+CVQIaYetH1XqPwtGVzU/x9puAHxmY8790Tu0o7BQg8H7S7WYNTP0rAMi2ZwGt0fk0C4M9xArRt0tjb6inIYNpyfqmk9uWKImzY0w+GVPWGsJCNEbEnmdPV4CEU3mIGpVOr7+lXMMFa4wFyxth7ginE3JOqVof9DL9ZPeUvplcA5FtLVyzSlI7pMscwBrvmcjOg3/lXSIhaW4TUqhiadOYy9B7mPocF04nlqnU+y7OCsSST
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF07B018B9F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElLeUdBbVVjdnJaa0cxc1drSHc2M21WdEEvRFNsR0w2MHZEamJ6TTBMeDFu?=
 =?utf-8?B?REJoWFVEd0ZHY1lCTzJlcVlQOFZ1dDdCT2pCTVFUWitsVVROVHNOY0pZYlh1?=
 =?utf-8?B?aE9lWWdORTBXazhJSnAwbHRKK1ltSlBQOE1RQVNXcmlTcXRhN3RjbTNJTXVG?=
 =?utf-8?B?QnV4OUxkVnlNZVVDVmtXK1pidld0NFRLckJGdENpdVdobDA3UEZBbHA3WnlN?=
 =?utf-8?B?MS83VTJmOTFDbVN5U0hFQ0l2dnFEVXRoblNXU0tZSW1FZmRGWTRZRWJLMi9i?=
 =?utf-8?B?VWFXUXFKdGRjTUZFa25yREVWWUZSWDdhRUsxU2tPQnFIWDhGMWZ4d3Vtazg4?=
 =?utf-8?B?NldBNHBMVFNxdTVMT1Faa2grL0x4WlZIV3pXSWxpYUlQS0pGbDdibXl0K0Vy?=
 =?utf-8?B?bDlFQXpyRXA3aWVTVjNYSzJhdHJjdlNaSTVEL1ErMWY4K1BsTWRtTUp2SnNa?=
 =?utf-8?B?eWpIcFVPVmNNL1RhSStRc043SnFkM1g1czBNTjUwN25xdWNQQ0NucXYzSTQ3?=
 =?utf-8?B?WitUa0xZek9aWDkrazREZHRkY2EvWjJ3RDJYeEQ4bnpzZHBOT2tqYk1WTlh3?=
 =?utf-8?B?NWZNWFN5bDNPVlBrVWoyVW5RYUVhZXJON09PVThNa1k3eUY5V2ltSTVCUndw?=
 =?utf-8?B?RjdsS0kvWm5sUFdOUWNRQXl0WUE0dFhIVGdsZUw0dTRuOUcyWjlYbkhjV0pv?=
 =?utf-8?B?OGkySnUyZ2ZYL0JlUWhlQktBbUg4emM2THZUQkdCd2U0OFhtOGcyeUVBUWNI?=
 =?utf-8?B?d25Gc2hkblAwZlRpZ05YV0M2K2RRaytwNmJrNXMwVC9PZXVVMGRJNGxsTFkx?=
 =?utf-8?B?N0drdFIvZGp4U3pDZVRzMU5xdUhTOUNiUlVERnVCNm4yaG9kUnhLTmszWlln?=
 =?utf-8?B?bjZraG5mVlRqR0tSS1dXWUp5aXlSRklJUEEvU3R5aG52K0RCbTIwaDNOUEln?=
 =?utf-8?B?NHQzbXFTTDU0UXZlb29CRktFK2hmcjlwNitDcVQxOVFLTktKaGhrck4zS002?=
 =?utf-8?B?bXVtaE43VmtEVHc1Q3Z4bGoyUFhCNmdzenpmT0hPT2dWK01BRkZSbjVqYmNC?=
 =?utf-8?B?M2FQZWNjZG5LcXpRZWpZN3g5TGpCM0llTnlZZTR5L3Z1Qk9GRzRNaHp4Y0Zu?=
 =?utf-8?B?MGFZUTNOVEVqWExTOWpzTUQ1Zi80WHR2SjlpbnZ6UDdUa3lFTU0vbDNPQ3lt?=
 =?utf-8?B?cFVjTDJaRFc3aWprQm1QYVJxQVpteUFxYTEzY1A5ayt3V1Q4ZUpmbUF3eU15?=
 =?utf-8?B?MjVmMGt4TTRSQXBoL2gxNU9oQjRyM01ES1M4ZTVTS3gxREE1bk5uZFhUYkxC?=
 =?utf-8?B?NzI5YkZPVjVBSG9lYVMrWjlTd0plYy93Z3dabDNXVlJGWXZ1MHlkUjI4QnBY?=
 =?utf-8?B?YjBGT0NTMjd4OWJTRFpndXNBTnp2aUVveHVLaU1LVmdHS1JmcklIVmNDNlFM?=
 =?utf-8?B?QWxOWVhDWGhPWnptcHJyRWtuMWJOVXhRVVJtTkdqN3NiVlhJdkthTmRSUmhi?=
 =?utf-8?B?OCtXNElCS2lXTzlGbExlZURrdXBuRlQ3dWNNbzhZc09UckpjWG80bjlNZkQv?=
 =?utf-8?B?M1dzZjR3WjRXdVNYbncwTVZna1FOYlhHendGZHZNTHNKbWtHTk9iV1B6UXF2?=
 =?utf-8?B?VmdNd3VQSTdVTXpaa3F6Ri9hNTFtRFBPOERmR1dldjB4dm40WldPd050c1F3?=
 =?utf-8?B?d1hhbWhWKzFvcmVIN3prYkRaSlhNOWdpY0h2OCtaZTYycVlnQlArQTRKcDI0?=
 =?utf-8?B?c3d4TkF0enZwTHp0SCtEUE1qZVN4S21LRnA3NkNEMUh5WlQwSFhvZExkWm9t?=
 =?utf-8?B?TjFpNkU2VUtsZVBRU1p6SnZVM09Uc3daSnV3aUhoeGwySnZNRlR5dkdqNGU3?=
 =?utf-8?B?cXBNa2tmKzRWYVJ6M3UvVFNKb0pQTlptU1FTbG96d3gyQyttS0U0RFdFazRX?=
 =?utf-8?B?TVN4Y0pJWGE0M0ZuUHBlMElJNUV6cGkvdHpzb2lROHJYMDNWbi91RnNBTFBX?=
 =?utf-8?B?WEpVVW4xcXRkUzdBblhjMFk2UUY2K1RvcWhIQ29tbXM0V2llaGl4RXc2VVF0?=
 =?utf-8?B?ZHN1YkVjNk92N2V1MjcrYjhyS1l6d1RUcG1IS1dUYjZlTnZPN3JuS1drOHFJ?=
 =?utf-8?B?YTdORGJ4UXB0enYxTDY1ekxONFduZzFNeWVNdFRCOHVyUDNscHJGNEtTb2w0?=
 =?utf-8?B?TUZZTnB0T1hCbHM2dHJ2UFVNcHl1MTBubDBhUS9FWSszNFVpNXpUL09oNFRj?=
 =?utf-8?B?a0hQb09JRW16VTMzUFlNMVdpdzREemY5UmJkUWxvcENRQklocGZLWklySTlo?=
 =?utf-8?B?a0UxV2NQdU83VWxDa01kUUlTZ1M4K29sUEtiY3VHbHZYSjNocEJxdz09?=
X-Exchange-RoutingPolicyChecked: O97dweY1Dm3Aabt7gfGKJQjM+mKdxidWHCwiERfpNFY7tqnzODS5U5czn6ldD8bT+Mm7WBVwV4xFUzqN2xmvtGf/9ROY7o50xgtyNXGwd+Mx3lvjqsjD+mPTZzLTjE8SnzNhUgrIsyd9TwwGtvX8XEZwfzWKVAvWGgTwhKgLEsfcO4nGM6YRJSKT4jR2C2l8qedWJXkoodqyqX/v+eacG2/T4UrFCtMqJ96sXRR/FzD8AKe86/ZT2tEDhQKgizmwLL9bUpSty9/W1Ib8D/SmUM3Hu3pfkgC/QrQrKR82pdUea0AosWyfeRwE15yVSnKdMaf82kxMC+PPnZWoGFxWwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d67a21c8-fca1-4949-43a6-08deca950cce
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF07B018B9F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 04:17:44.9270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnHw00eJEs5K7+W4oJaOBlgumBf49z5yb3NXXzNIUvKwUsBFoZ9RBlL2alJgAm6DxNAvUU5Zrn2JN0X+zpMhRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
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


On 6/11/2026 6:44 PM, Kamil Konieczny wrote:
> Hi Sobin,
> On 2026-06-11 at 09:43:21 +0000, Sobin Thomas wrote:
>> Extend the root-dir subtest to validate additional Xe debugfs entries:
>>
> All of below are optional, so imho write it before and do not
> repeat it at every line. Something like:
>
> Extend the root-dir subtest to validate additional optional Xe
> debugfs entries:
>
> - dgfx_pkg_residencies: Validate counter reads (non-empty)
> ... rest follows ...
>
> Please also write down what you mean by optional.
>
>> - dgfx_pkg_residencies: Validate counter reads (optional, non-empty)
>> - dgfx_pcie_link_residencies: Validate PCIE LINK string content (optional)
>> - sriov_info: Validate entry is non-empty (optional)
>> - workarounds: Validate entry is non-empty (optional)
>> - atomic_svm_timeslice_ms: Validate integer read/write (optional)
>> - poor_man_system_atomic_support: Validate boolean read/write (optional)
>> - disable_late_binding: Validate boolean read/write (optional)
>>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_debugfs.c | 198 +++++++++++++++++++++++++++++++++++----
>>   1 file changed, 180 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>> index 587e3e785..5e59424fe 100644
>> --- a/tests/intel/xe_debugfs.c
>> +++ b/tests/intel/xe_debugfs.c
>> @@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
>>   	__m && ((__i) = __builtin_ctz(__m), 1);	\
>>   	__m &= __m - 1)
>>   
>> +/* Validation types for debugfs read tests */
>> +enum debugfs_validate_type {
>> +	VALIDATE_NONE,		/* Just check file exists */
> Better name _EXIST but it could stay as is.
>
>> +	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
>> +	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
>> +	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >= 0 */
>> +	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
>> +};
>> +
>>   struct check_entry {
>>   	const char *name_fmt;
>>   	int mode;
>> -	bool (*condition)(struct xe_device *xe_dev);
>> +	bool optional;
>> +	bool (*condition)(struct xe_device *xe_dev, void *params);
>> +	void *cond_params;
>>   	unsigned int (*iter_mask)(struct xe_device *xe_dev);
>> +	enum debugfs_validate_type validate;
>> +	const char *expected_str;
>>   };
>>   
>>   static unsigned int gt_iter_mask(struct xe_device *xe_dev)
>> @@ -56,8 +69,13 @@ static unsigned int tile_iter_mask(struct xe_device *xe_dev)
>>   	return xe_dev->tile_mask;
>>   }
>>   
>> -static bool has_vram(struct xe_device *xe_dev)
>> +static bool has_vram_region(struct xe_device *xe_dev, void *params)
>>   {
>> +	uint8_t tile = (uint8_t)(uintptr_t)params;
>> +
>> +	if (!(xe_dev->tile_mask & (1u << tile)))
>> +		return false;
>> +
>>   	return xe_dev->has_vram;
>>   }
>>   
>> @@ -131,16 +149,140 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
>>   	return found_not_tested;
>>   }
>>   
>> -static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>> +/* Validate that debugfs buffer is non-empty or contains expected string */
>> +static bool validate_string(int dirfd, const char *file_name, const char *expected_str)
>> +{
>> +	char buf[4096];
>> +	int ret = 0;
>> +
>> +	ret = igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
>> +	if (ret < 0)
>> +		return false;
>> +	buf[ret] = '\0';
>> +
>> +	/* Check for empty buffer */
>> +	if (strlen(buf) == 0) {
>> +		igt_warn("Empty output from %s\n", file_name);
>> +		return false;
>> +	}
>> +
>> +	/* If expecting specific string, verify it's present */
>> +	if (expected_str && !strstr(buf, expected_str)) {
>> +		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);
>> +		return false;
>> +	}
>> +
>> +	if (expected_str)
>> +		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_str);
>> +	else
>> +		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
>> +
>> +	return true;
>> +}
>> +
>> +static const char *mode_to_str(int mode)
>> +{
>> +	switch (mode & O_ACCMODE) {
>> +	case O_RDONLY: return "RO";
>> +	case O_WRONLY: return "WO";
>> +	case O_RDWR:   return "RW";
>> +	default:       return "UNKNOWN";
>> +	}
>> +}
>> +
>> +static bool validate_bool_file(int dirfd, const char *file_name, int mode)
>> +{
>> +	int orig_val = 0, read_val = 0, test_val = 0;
>> +
>> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1 ||
>> +	    (orig_val != 0 && orig_val != 1))
>> +		return false;
>> +
>> +	if (mode == O_RDWR) {
>> +		test_val = (orig_val == 0) ? 1 : 0;
>> +
>> +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
>> +			return false;
>> +
>> +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1 || read_val != test_val)
>> +			return false;
>> +
>> +		/* Restore original value */
>> +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
>> +			igt_warn("Failed to restore original value for %s\n", file_name);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file_name);
> Note igt_info() here, see below.
> -> Agreed
>> +	return true;
>> +}
>> +
>> +static bool validate_int_file(int dirfd, const char *file_name, int mode)
>> +{
>> +	long orig_val = 0, new_val = 0, read_val = 0;
>> +
>> +	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) != 1)
>> +		return false;
>> +
>> +	if (orig_val < 0)
>> +		return false;
>> +
>> +	if (mode == O_RDWR) {
>> +		new_val = orig_val + 1;
>> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
>> +			return false;
>> +		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) != 1)
>> +			return false;
>> +		if (read_val != new_val)
>> +			return false;
>> +		/* Restore original value */
>> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
>> +			igt_warn("Failed to restore original value for %s\n", file_name);
>> +			return false;
>> +		}
>> +
>> +		igt_debug("Successfully validated %s int %s: %ld -> %ld -> %ld\n",
>> +			  mode_to_str(mode), file_name, orig_val, new_val, orig_val);
> You have igt_info() above in bool check, why debug here?
> Please be consistent, use one.
> => Done
>> +	} else {
>> +		igt_debug("Successfully validated %s int %s: %ld\n",
>> +			  mode_to_str(mode), file_name, orig_val);
> Same here. Btw why not using igt_info() in all places exept one
> warn at main function?
>
>> +	}
>> +	return true;
>> +}
>> +
>> +static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
>> +				  enum debugfs_validate_type validate, const char *expected_str)
>>   {
>> -	int fd = openat(dirfd, file_name, mode);
> Keep this line.
>
>> +	bool result = true;
>>   
>> -	if (fd >= 0) {
>> -		close(fd);
>> +	if (faccessat(dirfd, file_name, F_OK, 0) < 0) {
>> +		igt_debug("%s does not exist\n", file_name);
>> +		return false;
>> +	}
> Remove this check here.
>
>> +	if (validate == VALIDATE_NONE)
>>   		return true;
>> +
>> +	switch (validate) {
>> +	case VALIDATE_NON_EMPTY:
>> +		result = validate_string(dirfd, file_name, NULL);
>> +		break;
>> +	case VALIDATE_CONTAINS_STR:
>> +		result = validate_string(dirfd, file_name, expected_str);
>> +		break;
>> +	case VALIDATE_INT_GE_ZERO:
>> +		result = validate_int_file(dirfd, file_name, mode);
>> +		break;
>> +	case VALIDATE_BOOL:
>> +		result = validate_bool_file(dirfd, file_name, mode);
>> +		break;
>> +	default:
>> +		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
>> +		result = false;
>> +		break;
>>   	}
>>   
>> -	return false;
>> +	return result;
>>   }
>>   
>>   /*
>> @@ -160,7 +302,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>>   		unsigned int mask;
>>   		unsigned int j;
>>   
>> -		if (check->condition && !check->condition(xe_dev))
>> +		if (check->condition && !check->condition(xe_dev, check->cond_params))
>>   			continue;
>>   
>>   		if (!check->iter_mask)
>> @@ -209,10 +351,18 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>>   #pragma GCC diagnostic pop
>>   			}
>>   
>> -			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
>> -				igt_warn("Missing debugfs file: %s\n", entry->name);
>> -				missing_count++;
>> +			if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
>> +						   check->validate, check->expected_str)) {
>> +				if (check->optional) {
>> +					igt_info("Optional entry %s not found/invalid (skipped)\n",
>> +						 entry->name);
>> +				} else {
>> +					igt_warn("Missing or invalid debugfs file: %s\n",
>> +						 entry->name);
>> +					missing_count++;
>> +				}
> => Main intention was to  check only if the file is accessible  I will take care in next series for the fail count
> This seems wrong, it looks that if you have optional debugfs file
> you will ignore error here. Imho you should keep original if():
>
> 			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> 				if (check->optional) {
> 					igt_info("Optional entry %s not found (skipped)\n",
> 						 entry->name);
> 				} else {
> 					igt_info("Missing debugfs file: %s\n", entry->name);
> 					missing_count++;
> 				}
> 			} else {
> 				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> 						   check->validate, check->expected_str))
> 					fail_count++;
>   			}
>
>    		}
>
> Then at the end warn about any error:
>
> 	if (fail_count || missing_count) {
> 		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missing_count);
>
>>   
>> @@ -239,14 +389,25 @@ out:
>>   static void test_root_dir(struct xe_device *xe_dev)
>>   {
>>   	const struct check_entry expected_files[] = {
>> -		{ "clients", O_RDONLY },
>> +		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
>> +		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>>   		{ "forcewake_all", O_WRONLY },
>>   		{ "gem_names", O_RDONLY },
>> -		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
>> -		{ "gtt_mm", O_RDONLY },
>> -		{ "info", O_RDONLY },
>> -		{ "name", O_RDONLY },
>> -		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
>> +		{ "gt%u", O_RDONLY, .iter_mask = gt_iter_mask },
>> +		{ "gtt_mm", O_RDONLY, },
>> +		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
>> +		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
>> +		{ "poor_man_system_atomic_support", O_RDWR, .optional = true,
>> +		  .validate = VALIDATE_BOOL },
> Keep it on one line.
This was done to fix the check patch error.
>> +		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true,
>> +		  .validate = VALIDATE_NON_EMPTY },
> Same here.

This was done to fix the check patch error.


>> +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true,
>> +		  .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
> Same here.
>
>> +		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
>> +		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
>> +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true,
>> +		  .validate = VALIDATE_INT_GE_ZERO },
> Same here.
This was done to fix the check patch error. if we keep it in same line 
it will cause the line > 100 warning. So kept it in seperate lines.
>> +		{ "tile%u", O_RDONLY, .iter_mask = tile_iter_mask },
>>   	};
>>   	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
>>   	int missing_count;
>> @@ -276,7 +437,8 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
>>   	const struct check_entry expected_files[] = {
>>   		{ "ggtt", O_RDONLY },
>>   		{ "sa_info", O_RDONLY },
>> -		{ "vram_mm", O_RDONLY, has_vram },
>> +		{ "vram_mm", O_RDONLY, .condition = has_vram_region,
>   

> Same here.
>
> Regards,
> Kamil
>
>> +		  .cond_params = (void *)(uintptr_t)tile },
>>   	};
>>   	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
>>   	int missing_count;
>> -- 
>> 2.43.0
>>
