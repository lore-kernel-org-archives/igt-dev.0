Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C801C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6A110E8D0;
	Thu, 20 Jun 2024 23:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meWhpUf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB7610E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925847; x=1750461847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oBOzmtS5hq6RACm7qX7MYPLKLultVSRh/1nzM1VEUBE=;
 b=meWhpUf2DIah6/i/tAynH7qkhEi9pIAV0Uv9imQ87SXcrf6V7Mc+8Hp9
 VlrLQRol5PG1OzkEemNp4T4rpUtb5AKUZXYm/kJjAoBms6etXM08Joret
 kBfjvwtoPUrGj467O4lxY8XIH66UHIR0MpUjILaxi0XaFAsQaIkEZwBPx
 n9QpZ1McalhLDqeUBOfolLEQyu08UFTMeid1bdF9HskPKAPAFgyvYCSK4
 ibnGsf2M++sQawMXZVbSjhhZCJYlDF2D++mGNyidinOjIeZTsaet3fBLC
 Zc5ATMuX/041Z8hrkbv/T0yKNL9SzWjYk6x7QmUDnL1aeVE7jA5Y1CLdm g==;
X-CSE-ConnectionGUID: yUceRsEBTG2roC7zumyLng==
X-CSE-MsgGUID: 7OxMqJ8VRDCheQg9Lge/yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26535929"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="26535929"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:24:06 -0700
X-CSE-ConnectionGUID: bp9TicdtTlCjVljAUFADMA==
X-CSE-MsgGUID: MdvMR0bCTzCGOKGIrROqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42308203"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:24:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:24:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZWa0Y9oHT/4H5qGS9Mu2W+dffkCaKeaQF4U5VQyiZG1LNy+V/iXegylTd783atYXWldGpgbQ9kEbeIDthrkn4zQYd1sEWFQHzhF4NPy+YpjX/2zMAndmkaTrQ+ax1C7FzYXJ6Excz71ixtoAX1GkSK2bj5gztaeAe0tPwody6ZRgr4gu6tpRT+NsFbgcgwJL7S5XiFlFpbjg5WwLYBPec8wfCVOUoExHqG7wyfQlhpuVtTiNzga0mA3RZyjS1chV69XbR4g4KmAMhECKboT2BbW6MU3d4bvc+uRk+fSWUzpTv1p86Cub935lwhkjYeyh7UW/Uihirz5N7wj2aGuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5BbZv9OyihV62yMh0FZctOgT00UtCttDZWNNIgVLrA=;
 b=exj8X8PgMM9qeTeRX8Y4+OSkPquF0xGDZRjauv8gQHW3TQ9a8rPQeePs64rS+K7n9twAoiQShI3Q8jQCddXcXfKtJsP0nD0DBcP0jkOmMEsFhwhZxJmlSp9MoP7zsJN2yNd6pKjAUep9a+ilzV+d9/zj7M5BMPD+aDbzqSLZCvZMMxmBKGdzArYM6kREnUHnkB/pTRMJG2/EO8FY+WhL327S2qttpZvPSa3APIFEF/RPXZzxh5J9GNXpBhdMb9F/VOb8lQ4bD0bdmHSgEukBdPxdXlS69ZJb8E0uEf0VElWhORnS/QsWEiY5m7wYFQC/GD29sG6hiGU5ePaZVLYr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Thu, 20 Jun
 2024 23:24:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:24:03 +0000
Date: Thu, 20 Jun 2024 16:24:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/28] lib/xe/oa: Switch generated files to Xe
 namespace
Message-ID: <ZnS6Eekqq3RzLWFH@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: a86356db-efe0-48ee-4938-08dc91801285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1ppeVJTSHNzUXlsU1pHK1hQTnZhT3dVRFN1cVR3R2xYUHpFWkZnTnpodUVM?=
 =?utf-8?B?bXkvNUtOOVloSWhzakxkZC92ZEV4TTBpYUdDUmNGRksvaEhIb1lSclN4Mk5D?=
 =?utf-8?B?NDg2cm5nWEJwcWdLTUJIamNxTFg1endqcnI2UStaOU1YbTlhT1YxNTNUS0k1?=
 =?utf-8?B?T0RFcWtUSVduZStyUCt5TTIzbjVVVHpyYXpubXU5cVpuRUJXb3I0ZlphSlZG?=
 =?utf-8?B?OWdzM2xweFJnRnptazIxR2lESzFiUEZsaTNveTY5SFNRdHhSU3RpQXJpck5K?=
 =?utf-8?B?ZjFZcHZHbHQzQXA3YkF6RlUvYVp1Zlk3K2l2YkNtSFZhYmJhd1B4cm9EMWh2?=
 =?utf-8?B?b1VYaHZ6RVEraXdZN0hobWNaTG1TemJBMlJvVFpMZGU4QlhZSE9HWlVPODdy?=
 =?utf-8?B?VHJpMGNjeDlUM0hLQy81ZjlaV2t6K2xUL013MjdXRW85bUJEaUl5dXdicGxr?=
 =?utf-8?B?MUNhdkxjR282RlJDNE45cjJMWU9jQVFYZkl0eUtWejNEbDRDQ1VMcjhsZzQ5?=
 =?utf-8?B?cWVqRnd6QS9nUlRIWWZvZXV5dVYxZTZGYlBvNVNpd0RkcDdUdDFETkpQKzFv?=
 =?utf-8?B?aS96NjlaZ3VqalJTR0YwL25KNCtxSWkxOWRTbHk0SG5UeHhWM1dJaXF5cE1U?=
 =?utf-8?B?dkFwTUJseXBtdU5YRkROUzN1VENkUVVUSnFVYnlEYTFsN3ZrL2wvR2tjV1ht?=
 =?utf-8?B?VVI0QUJWb2hvZVhTOWZTcnR1OWs3MEM2aCttOFlnakV0RUdJNlZlSmxLdTc0?=
 =?utf-8?B?Y2ZVYTd1YXJWMDFaRkxJL2ZsNXVtQXpzM0lVTWxCWU9VNWVtNVYzR3dsb2c4?=
 =?utf-8?B?TEg2Q1lrMVoyRVkvMVNRdTkwTFMwT2RnS0JLL3VIVnR4NjF2cEc2U2trRi82?=
 =?utf-8?B?K2Vuek0vQ29BcnlrTFBpTzZLcGRIemFCalFwWWJaTkpkUDZ6VzZXTWdVejky?=
 =?utf-8?B?TFIveDh3Z2VyeUlSNkJmdE43UHdCSld4Zk5iMkZBN2tNUmRURzFOeDduN3dl?=
 =?utf-8?B?anZDdkMxUm90Wi82Zm1jbGVnZXE4THd4djV4NG5QWHNTK2xjaDJBdk5Sb1RX?=
 =?utf-8?B?bzUvbHhjcWlEVE9KaUpYT3I4YzlRRHpFNXpmc0x6SDRvcWl4YnMxT2lYbHVn?=
 =?utf-8?B?VWRCd0ZpbDdzYThETGFnMjFrc001UGtORmw2anQyeVpDbE5JMzJlWXJvVzd1?=
 =?utf-8?B?aXZWeiswdHVwRmxwT3NsaEZFL2J6UzZXSTZJNlN2ZnZPNFRoODRObVBpNDJS?=
 =?utf-8?B?bEpkRlJGTTZSajB0T1FHSUhwWWlSWDA4R0RONTlWTXdUSTdOQnZoUml6MEI2?=
 =?utf-8?B?UU03a2hlTmVJZEhvN3BqRTJyQzUraWR4R01aRnh0azFuTlg0bVZ4d0xQSjFG?=
 =?utf-8?B?VFh0bVBwRFFacFM4UTdIak9QZWVwNFYrVkpJc0lFTjk2eFIrMmFQb25rTHBG?=
 =?utf-8?B?RUsyNktEZzh3bUhJMWd1Y3JXS1hsT0pKcWhHVU4vWGxVc3daNytoVHA3UWxE?=
 =?utf-8?B?b0lGYWZFZVJ3YWdUWk93RlVQWkEwY2FyVVBkUWJhMmhkMXdKTzRjb2xZUElE?=
 =?utf-8?B?V05PNXBzdjVvMFloOVN0R0ROakQrL0VFd0FkWGtiaHJFbVNZbW9vZVdPaDRG?=
 =?utf-8?B?OWM5TXdzSWNSY2IrRVUxK3hEYzR4RGEwTEhBbU1tQjVSbmZweXRWb3JPUW9G?=
 =?utf-8?B?ZS9JRG5yTFAvSnkyczRlRTBJaEF5M0cwbndzOU95S21md1lISzAyRkdMSmM2?=
 =?utf-8?Q?YIDJB/Vx2zD+Pcu7sMAPT2fU3ELpk4CWNrL7i4b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0diemNHY1hRRjZmYjUvTWw0ZjBPV3JNaE1Hd01lTVUrMXMvSHdvbVAvd1R2?=
 =?utf-8?B?dHNPSnJnVGlZYVd2Y0lRM0pvZU5XWXExeWVoRUw1NGpVdVNHTEh1cXJhdTNp?=
 =?utf-8?B?VUxXT0lWbUIwMmtka2RwWjVaWjdpV0U0aC94U3B1V2YwSE80T3FteWRFSUtt?=
 =?utf-8?B?WXZraU1Hc2pEbVNjRmhxR3RrMk1vNEhRTExabVREdllmck5nZkNyVU4zYlho?=
 =?utf-8?B?Y2ZJTy9lb1J5YUxwZUJXeEJWdTU3RnhZdU5yb2h6UVJPWlgyQ0VLS1NKNS9O?=
 =?utf-8?B?b2V6OVFTMzNlMXR2Q05tVmEzTG1pUjhQemt0VHBUanNncDZLM0ZLV0xkZDhY?=
 =?utf-8?B?eG9tMk52RU1Jbzd6RnBDZjQwOFZSL0lIUXFMZm9pYm9KU1phVURDZVVRblBI?=
 =?utf-8?B?aUNtdmhpM2trSXBlU1VjME1VdHIwL1Z3UEgyWlR1OHdTSVdUNEtzN3FXdEZC?=
 =?utf-8?B?bnpkWngxbTYzNWU4YUV5QmRpK3pya3hqSWJLZTMrMzAyWWRrcEF5bkp4Q21X?=
 =?utf-8?B?NlpwMnZxSFR2Rzhla0lXMC90ZVVOVjJWRUFjajVGSHhqeHluT0x2RHlwUFhK?=
 =?utf-8?B?cXg4clM1d1k5b0xyWlkwOG52a2JVeWYrQ2lBeUhKMFpJOWY1MDA2TmtiL2dB?=
 =?utf-8?B?NHYzL0JwV003WUtuUlBwOXhkd29PTDM3SGJLT3RlNGFVZ0FTNndQTEExQTJQ?=
 =?utf-8?B?OHF0WUgvdnpQQ0NIZ0VkL3BZTVcxeWtPNlUwMDl0TVQ1R3JPTmFsV2wzYXRW?=
 =?utf-8?B?czlMV2pLYm1uTzRHbDlrRnZvNXFlWWo4bDdIaGZwU1Vpd01rWmhmWjB4bHJh?=
 =?utf-8?B?ekVCOGExZW9BWDcvdE1RL00yc3ArSzBtc210SEIyWXFJZ053NFdPbFhVeTR0?=
 =?utf-8?B?QjNSYUh1TVc2UWF3Z2VpMVM1dERKVE9oai9yRG80dXdMdkMvRUEyZWhYcnZ4?=
 =?utf-8?B?VDBIallpMEpSTUM3UFRtSzFheHozR3J3TWxBT2VCdVMwWlg3dUdYTnpnRXdH?=
 =?utf-8?B?TTV3UzFwTW1qc3pjY0tUUklUcm9GL0pCeFBqWFlqSnQwMGp6Mzl2RGNEZzRh?=
 =?utf-8?B?QTNMYVJwS29LWDArVEdpbEo1WFd5WjFZakVkVndCazNVUDljNTQ2eWx1b0xR?=
 =?utf-8?B?Qk5PT1kwK25ua2VVUFI0OHZ6RFJkZlRUN3J1NlN1VW1yWHc5dlh3T2FZWW1R?=
 =?utf-8?B?K3lwZjVqblQ2UXlXVTJUSnM3VmR5K0NIdWRsS0xVVjRPWlVqUGVQUk5RVVRK?=
 =?utf-8?B?bEF3d205R1BjRGVxZXJzdVlTMUlzV05HWUsvMTZuOUJsdXU2b0ZFYVB6b2lq?=
 =?utf-8?B?aVNQOHU3aENkR1l5Y3pDRndwRGVpc1BIZlFpS0NvbENDdzhpYUt6MWVVNTZO?=
 =?utf-8?B?WGpWUW1OUldQVEtpanBRQmp6Y2hBdFp5akYvVCtEWlk2NmJWK1ZBZFRZNjQw?=
 =?utf-8?B?U2Qyd29xci9DOEMzenFONTkvL3Q2YWdmMGhGN2kvcnJNZmc3ZXNQUFBuOFkr?=
 =?utf-8?B?N1l2dVFTUllteE1IWTVMNGk5Ti9nV1dMUFlBL2JQeEtIVWh6TnNLZ0dRREt2?=
 =?utf-8?B?bW1jNEJwZVA4eXQ0MmFSRVZhcUtPSEtLeFdlTUx2ZGZIQTk5Wm9RcmR5cXBn?=
 =?utf-8?B?STh4cTdtL1grTG9pQ25MMXZocVBheEJOcG5aSmJDc05ibTdCREx0TW01eUpx?=
 =?utf-8?B?ZFJDU0I0bkVnY1NzbW40NytjTi93M01RbHJ4dFVkQkx2QUlVZUljOTFsS3hX?=
 =?utf-8?B?cjlHMW4rMGcycWxlS2toS3VJYlFkeW1VNHBXU2d6bVkwSkdLRWdWQkQybTdr?=
 =?utf-8?B?dm9PSHpXVDNsQmZFdmxIR3RvM2xoYUx0TFBQbGUydWViSzFCcFZPYWQyZzBX?=
 =?utf-8?B?YUJTa2x0ZHdNOUxUZGFUWkF5cVB2VTRZbkFUMk1LNWd6NWh0QStldkFWM1M2?=
 =?utf-8?B?U0c1ekVQM0xvdUlBaDVQZmI4OFJkcmlpRENBdForWTVmUm9wY0NvSDBLbVNz?=
 =?utf-8?B?L211MHJPb0JtQ0V3YjA4Nlc2SGNVQ1RXc0llNVhtSUFvQk4zUUJGMjl1WUVJ?=
 =?utf-8?B?bWhPU09UbEVOTGV3NmJRbWUyelBjWWRrQzJTa3hKSWFuWGlCcDErWkZpdDk1?=
 =?utf-8?B?SThoWTAyQi9YcFhXWTNYaU9QMkF4S3YzQkl0bjdITHAycVVZVEdybEVDejln?=
 =?utf-8?Q?8LDeBxJTzyH/LlE0/eH7chQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a86356db-efe0-48ee-4938-08dc91801285
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:24:03.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPqGOf/0+jlnmsQoOyTGn/qkAx59dCSynjlLyimutYg81EF84Okuf/MhKGylLrWFK5wleqqAKUDuPSb+1HwdCCe+UnEXsP0Z2kTSSxXp0ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Thu, Jun 20, 2024 at 01:00:31PM -0700, Ashutosh Dixit wrote:
>The Xe IGT library occupies a different namespace ('intel_xe') from the
>i915 IGT library ('intel' or 'i915'). The generated files are also part of
>the Xe IGT library. Therefore make sure the functions and data structs in
>the generated files conform to Xe namespace.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/codegen.py              |  6 ++--
> lib/xe/oa-configs/oa-equations-codegen.py | 36 +++++++++++------------
> lib/xe/oa-configs/oa-metricset-codegen.py | 26 ++++++++--------
> lib/xe/oa-configs/oa-registers-codegen.py | 10 +++----
> 4 files changed, 39 insertions(+), 39 deletions(-)
>
>diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
>index 020e76ef4b..9a7d57a33e 100644
>--- a/lib/xe/oa-configs/codegen.py
>+++ b/lib/xe/oa-configs/codegen.py
>@@ -340,13 +340,13 @@ class Gen:
>             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
>         m = re.search('\$GtSlice([0-9]+)$', name)
>         if m:
>-            return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
>+            return 'intel_xe_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
>         m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>         if m:
>-            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>+            return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>         m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>         if m:
>-            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>+            return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
>         return None
>
>     def output_rpn_equation_code(self, set, counter, equation):
>diff --git a/lib/xe/oa-configs/oa-equations-codegen.py b/lib/xe/oa-configs/oa-equations-codegen.py
>index a4a00f46d9..de5a3337df 100644
>--- a/lib/xe/oa-configs/oa-equations-codegen.py
>+++ b/lib/xe/oa-configs/oa-equations-codegen.py
>@@ -46,9 +46,9 @@ def output_counter_read(gen, set, counter):
>     read_eq = counter.get('equation')
>
>     c(ret_ctype)
>-    c(counter.read_sym + "(const struct intel_perf *perf,\n")
>+    c(counter.read_sym + "(const struct intel_xe_perf *perf,\n")
>     c.indent(len(counter.read_sym) + 1)
>-    c("const struct intel_perf_metric_set *metric_set,\n")
>+    c("const struct intel_xe_perf_metric_set *metric_set,\n")
>     c("uint64_t *accumulator)\n")
>     c.outdent(len(counter.read_sym) + 1)
>
>@@ -75,9 +75,9 @@ def output_counter_read_definition(gen, set, counter):
>         read_eq = counter.get('equation')
>
>         h(ret_ctype)
>-        h(counter.read_sym + "(const struct intel_perf *perf,\n")
>+        h(counter.read_sym + "(const struct intel_xe_perf *perf,\n")
>         h.indent(len(counter.read_sym) + 1)
>-        h("const struct intel_perf_metric_set *metric_set,\n")
>+        h("const struct intel_xe_perf_metric_set *metric_set,\n")
>         h("uint64_t *accumulator);\n")
>         h.outdent(len(counter.read_sym) + 1)
>
>@@ -100,9 +100,9 @@ def output_counter_max(gen, set, counter):
>     ret_ctype = data_type_to_ctype(ret_type)
>
>     c(ret_ctype)
>-    c(counter.max_sym + "(const struct intel_perf *perf,\n")
>+    c(counter.max_sym + "(const struct intel_xe_perf *perf,\n")
>     c.indent(len(counter.max_sym) + 1)
>-    c("const struct intel_perf_metric_set *metric_set,\n")
>+    c("const struct intel_xe_perf_metric_set *metric_set,\n")
>     c("uint64_t *accumulator)\n")
>     c.outdent(len(counter.max_sym) + 1)
>
>@@ -135,9 +135,9 @@ def output_counter_max_definition(gen, set, counter):
>
>         h(ret_ctype)
>
>-        h(counter.max_sym + "(const struct intel_perf *perf,")
>+        h(counter.max_sym + "(const struct intel_xe_perf *perf,")
>         h.indent(len(counter.max_sym) + 1)
>-        h("const struct intel_perf_metric_set *metric_set,")
>+        h("const struct intel_xe_perf_metric_set *metric_set,")
>         h("uint64_t *accumulator);")
>         h.outdent(len(counter.max_sym) + 1)
>         h("\n")
>@@ -163,16 +163,16 @@ def generate_equations(args, gens):
>         #define MAX(a, b) (((a) > (b)) ? (a) : (b))
>
>         double
>-        percentage_max_callback_float(const struct intel_perf *perf,
>-                                      const struct intel_perf_metric_set *metric_set,
>+        percentage_max_callback_float(const struct intel_xe_perf *perf,
>+                                      const struct intel_xe_perf_metric_set *metric_set,
>                                       uint64_t *accumulator)
>         {
>            return 100;
>         }
>
>         uint64_t
>-        percentage_max_callback_uint64(const struct intel_perf *perf,
>-                                       const struct intel_perf_metric_set *metric_set,
>+        percentage_max_callback_uint64(const struct intel_xe_perf *perf,
>+                                       const struct intel_xe_perf_metric_set *metric_set,
>                                        uint64_t *accumulator)
>         {
>            return 100;
>@@ -196,16 +196,16 @@ def generate_equations(args, gens):
>         #include <stdint.h>
>         #include <stdbool.h>
>
>-        struct intel_perf;
>-        struct intel_perf_metric_set;
>+        struct intel_xe_perf;
>+        struct intel_xe_perf_metric_set;
>
>         double
>-        percentage_max_callback_float(const struct intel_perf *perf,
>-                                      const struct intel_perf_metric_set *metric_set,
>+        percentage_max_callback_float(const struct intel_xe_perf *perf,
>+                                      const struct intel_xe_perf_metric_set *metric_set,
>                                       uint64_t *accumulator);
>         uint64_t
>-        percentage_max_callback_uint64(const struct intel_perf *perf,
>-                                       const struct intel_perf_metric_set *metric_set,
>+        percentage_max_callback_uint64(const struct intel_xe_perf *perf,
>+                                       const struct intel_xe_perf_metric_set *metric_set,
>                                        uint64_t *accumulator);
>
>         """ % (header_define, header_define)))
>diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
>index ea0d13cc97..f4a008d690 100644
>--- a/lib/xe/oa-configs/oa-metricset-codegen.py
>+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
>@@ -28,7 +28,7 @@ def availability_func_name(set, counter):
> def output_availability_funcs(set, counter):
>     availability = counter.get('availability')
>     if availability:
>-        c("static bool " + availability_func_name(set, counter) + "(const struct intel_perf *perf) {")
>+        c("static bool " + availability_func_name(set, counter) + "(const struct intel_xe_perf *perf) {")
>         c.indent(4)
>         set.gen.output_availability(set, availability, counter.get('name'))
>         c.indent(4)
>@@ -60,9 +60,9 @@ def output_counter_report(set, counter):
>     c(".name = \"{0}\",\n".format(counter.get('name')))
>     c(".symbol_name = \"{0}\",\n".format(counter.get('symbol_name')))
>     c(".desc = \"{0}\",\n".format(counter.get('description')))
>-    c(".type = INTEL_PERF_LOGICAL_COUNTER_TYPE_{0},\n".format(semantic_type_uc))
>-    c(".storage = INTEL_PERF_LOGICAL_COUNTER_STORAGE_{0},\n".format(data_type_uc))
>-    c(".unit = INTEL_PERF_LOGICAL_COUNTER_UNIT_{0},\n".format(output_units(counter.get('units'))))
>+    c(".type = INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_{0},\n".format(semantic_type_uc))
>+    c(".storage = INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_{0},\n".format(data_type_uc))
>+    c(".unit = INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_{0},\n".format(output_units(counter.get('units'))))
>     c(".read_{0} = {1},\n".format(data_type, set.read_funcs["$" + counter.get('symbol_name')]))
>     c(".max_{0} = {1},\n".format(data_type, set.max_funcs["$" + counter.get('symbol_name')]))
>     c(".group = \"{0}\",\n".format(counter.get('mdapi_group')))
>@@ -98,18 +98,18 @@ def generate_metric_sets(args, gen):
>           output_availability_funcs(set, counter)
>
>         c("\nstatic void\n")
>-        c(gen.chipset + "_add_" + set.underscore_name + "_metric_set(struct intel_perf *perf)")
>+        c(gen.chipset + "_add_" + set.underscore_name + "_metric_set(struct intel_xe_perf *perf)")
>         c("{\n")
>         c.indent(4)
>
>-        c("struct intel_perf_metric_set *metric_set;\n")
>-        c("struct intel_perf_logical_counter *counter;\n\n")
>+        c("struct intel_xe_perf_metric_set *metric_set;\n")
>+        c("struct intel_xe_perf_logical_counter *counter;\n\n")
>
>         c("metric_set = calloc(1, sizeof(*metric_set));\n")
>         c("metric_set->name = \"" + set.name + "\";\n")
>         c("metric_set->symbol_name = \"" + set.symbol_name + "\";\n")
>         c("metric_set->hw_config_guid = \"" + set.hw_config_guid + "\";\n")
>-        c("metric_set->counters = calloc({0}, sizeof(struct intel_perf_logical_counter));\n".format(str(len(counters))))
>+        c("metric_set->counters = calloc({0}, sizeof(struct intel_xe_perf_logical_counter));\n".format(str(len(counters))))
>         c("metric_set->n_counters = 0;\n")
>         c("metric_set->perf_oa_metrics_set = 0; // determined at runtime\n")
>
>@@ -167,12 +167,12 @@ def generate_metric_sets(args, gen):
>
>         c("%s_%s_add_registers(perf, metric_set);" % (gen.chipset, set.underscore_name))
>
>-        c("intel_perf_add_metric_set(perf, metric_set);");
>+        c("intel_xe_perf_add_metric_set(perf, metric_set);");
>         c("\n")
>
>         c("{")
>         c.indent(4)
>-        c("static const struct intel_perf_logical_counter _counters[] = {")
>+        c("static const struct intel_xe_perf_logical_counter _counters[] = {")
>         c.indent(4)
>
>         for counter in counters:
>@@ -190,7 +190,7 @@ def generate_metric_sets(args, gen):
>         c("counter = &metric_set->counters[metric_set->n_counters++];")
>         c("*counter = _counters[i];")
>         c("counter->metric_set = metric_set;")
>-        c("intel_perf_add_logical_counter(perf, counter, counter->group);")
>+        c("intel_xe_perf_add_logical_counter(perf, counter, counter->group);")
>         c.outdent(4)
>         c("}")
>         c.outdent(4)
>@@ -201,7 +201,7 @@ def generate_metric_sets(args, gen):
>         c("}\n")
>
>     c("\nvoid")
>-    c("intel_perf_load_metrics_" + gen.chipset + "(struct intel_perf *perf)")
>+    c("intel_xe_perf_load_metrics_" + gen.chipset + "(struct intel_xe_perf *perf)")
>     c("{")
>     c.indent(4)
>
>@@ -256,7 +256,7 @@ def main():
>         """ % (header_define, header_define)))
>
>     # Print out all set registration functions for each generation.
>-    h("void intel_perf_load_metrics_" + gen.chipset + "(struct intel_perf *perf);\n\n")
>+    h("void intel_xe_perf_load_metrics_" + gen.chipset + "(struct intel_xe_perf *perf);\n\n")
>
>     h(textwrap.dedent("""\
>         #endif /* %s */
>diff --git a/lib/xe/oa-configs/oa-registers-codegen.py b/lib/xe/oa-configs/oa-registers-codegen.py
>index a4aa134097..08fc38a50e 100644
>--- a/lib/xe/oa-configs/oa-registers-codegen.py
>+++ b/lib/xe/oa-configs/oa-registers-codegen.py
>@@ -22,7 +22,7 @@ def generate_register_configs(set):
>         'OA': 'b_counter_regs',
>     }
>
>-    c("void %s_%s_add_registers(struct intel_perf *perf, struct intel_perf_metric_set *metric_set)" %
>+    c("void %s_%s_add_registers(struct intel_xe_perf *perf, struct intel_xe_perf_metric_set *metric_set)" %
>       (set.gen.chipset, set.underscore_name))
>     c("{")
>     c.indent(4)
>@@ -39,7 +39,7 @@ def generate_register_configs(set):
>
>         c("{")
>         c.indent(4)
>-        c("static const struct intel_perf_register_prog _%s[] = {" % t)
>+        c("static const struct intel_xe_perf_register_prog _%s[] = {" % t)
>         c.indent(4)
>         for register in register_config.findall('register'):
>             c("{ .reg = %s, .val = %s }," %
>@@ -95,11 +95,11 @@ def main():
>     h("#ifndef %s" % header_define)
>     h("#define %s" % header_define)
>     h("\n")
>-    h("struct intel_perf;")
>-    h("struct intel_perf_metric_set;")
>+    h("struct intel_xe_perf;")
>+    h("struct intel_xe_perf_metric_set;")
>     h("\n")
>     for set in gen.sets:
>-        h("void %s_%s_add_registers(struct intel_perf *perf, struct intel_perf_metric_set *metric_set);" %
>+        h("void %s_%s_add_registers(struct intel_xe_perf *perf, struct intel_xe_perf_metric_set *metric_set);" %
>           (gen.chipset, set.underscore_name))
>     h("\n")
>     h("#endif /* %s */" % header_define)
>-- 
>2.41.0
>
