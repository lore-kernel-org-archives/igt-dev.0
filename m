Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F2AF43828
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 14:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF1010E137;
	Wed, 15 Apr 2026 14:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfAVKn1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADAB10E137
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776264701; x=1807800701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zIlg4tAN4cgbDPbdVcUTjiVc2j0HOw16QWsDC666zmU=;
 b=cfAVKn1C2fC0P2kNSTPQYV1vOqzBN2GRTOIouoG6PdwDS4fr8Nq17JPh
 GW1jxI5VmTwiZ2FVQTuiqhDxR7NQue+UJCz2Fr/Fvg9PnSweyyFP/gCZT
 I5roztNowp8yTprFdQBa1Uy2GCb3mQ1HNh4+3nK/97F91OoJbk8cErE8L
 g+kOxcg++nS+E7NwhjenzZWuWSoX8YGrFId1RCuS5y3euKt1mhU/Qc5J4
 onjw3cbS5aOP0pyeoSXm70agB2wKHj8TPnPvXFZkUBWV8QnRCv/p+iyPG
 P/LDTzWMdDFJ0z4YdeuFKyWdCHuTFrYnfYC8HQWx8A4I7EFswStjliOPD Q==;
X-CSE-ConnectionGUID: qEyH37LOQyaQ/X5d6d/61g==
X-CSE-MsgGUID: jBOC9ShHQBOhUQ6YM7JwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88624781"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88624781"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:51:41 -0700
X-CSE-ConnectionGUID: 7QAtC1MMQ7OWAVKM+/l4Pw==
X-CSE-MsgGUID: BHDOizrNSra1VdUhw6kRCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253863218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:51:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:51:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 07:51:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU5Xd55ysL+bFxfPx8KgUyNNdOLYi5/GoO5NOhvnuHM2RUaZUc2ZPLUSUcn1PWEYgiiboOOXdCd3B1o1zVEWF9QuZL9SAAHqF0avswDIqg2lykX/vxH/RSOea+pl/MmRTqbWkZRZePplJbz1jRCQ9WmYiJE1mDydHKKOf8XG0br1UFeuw0XBUfS4p/SarX3WmsA/F9ZAQom0OR65EEfu3q5uGB5uSnBGoN1VdD15n9cfdJJ9MOstvFtXDxfoqEt5/B8hfGLXgf/CSkHqNjVDXUWrdoCEH410jBduKX1oT/1IxWNFYl1L0uWakcaSVjveONar0lnPItIJcWq0JVAodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6f37tdqm26VPZ6WBw4e+GxPr0dEmgnN09QES3mBZgI=;
 b=Jc9UnqB8JqdQrsG1QK8ojoQPBtnKPmAtSfY90ONDNDAxQ9jV2OZvaXLCR7GJ92ymCvC69HIPtZ7fM2etcnAJy/Yv9LfJz5ZhWiHZtdnGkPIzXtq9HH+IFisZMrH1Ux4UMbxRyBRIqFD7qj4MpawiazcVNtRAEMPuT4ggSIiolcrnB4oHXFhfjqs6LjebzoU4zqdv2RlfHFfPz8qizyAjRt3+pPDC2DpH2q2G/6wTwFmbEg6COF0a6Spnj91LmvxTcOK7V7tXQDaoBWH6aOtmIflksbWWB1cX/IZGXsvanmrWybfiwkSU8oClguXuvPUYVPNFOMhs3EZHR6/k9+Wmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 14:51:37 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 14:51:37 +0000
Message-ID: <2cc4ce46-1733-4016-8bfa-aa887440d4b4@intel.com>
Date: Wed, 15 Apr 2026 20:21:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Drop cmrr subtest for redesign
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <karthik.b.s@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <ankit.k.nautiyal@intel.com>, Kamil Konieczny <kamil.konieczny@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
 <0db970cc-f4b6-4999-9571-b835ddff5bf2@intel.com>
 <e42a2961-53e0-473c-8fde-a663de6615e5@intel.com>
 <20260415132317.54evg377kg76z6bx@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260415132317.54evg377kg76z6bx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba443b5-d509-4dac-f19b-08de9afe7eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zJPmOGqahCUyTbtXC38Co6paViUrCaDC5i06k7zscx5/t6x2PQ2gSN4c11BXB0ctxUJq6LCOuWGrdrqjwSiNUOYLI612F0PS1JuCndG5WrLNyDPDKJZVdDZOyp2rPiBaqWJnuTQ9fgrcN1VDGXMg9NuQbe3TYVGRNqS1FiBJ7uplBlKCu/7JpwrtTu6v+Yk36dZughmZUXjryDGZq61FxovDqNZIGLs9O3wmtGn/iHSoAC6NnkD8opxufyWq6CtvPA/JjxC1b709jss8wk7tEUATKtELMNA15F+8sDa9ajylHKl5LvDycjxjsZlgRKs/YKe5AtlYoR3B0sogihQJfusxANTXgR8YXDWbbXXiEUC4Co7XDwcaPyv7BJtrgDmdmFVLjhyqhbBJYNX/Vtu5EEzmXlytJrdlY+IgJ2HWpj3Va50G/NddtJaZP2s7iRv4OzK9tFzpmAVFOdbFVIWSpCK6zUg5TXGSqHNHo5ndehArcRuhHWpUtdLYMWFzouNsY6aC1jMvITHWGPVvHo4jL1LjZdizxi7WVwn3MWXbeJAPZ9+taNM1zAGc43OhnYfKeDCsXmIYtocNfRaHJasQiqepnjPCeMX1xoi+yaEq1eYt/NPJ9Aysc02z7yLBQuO00wEKhGgoVtrnc0Hk5m6HimuotuLfjCUYVTHUtJx5PXGOmBhi5lNpBmqRNdkNCitFMW9T8XLfjk5JiTTrRtZyzbEWeDd7inOfu4232JtQQEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVQ0VWtLWTVMd1hmMGpyQ0liVmpBMnVSa3U3OG16YUVEZE9SdEl1c3UzdEhh?=
 =?utf-8?B?S05ZN3dhRU03dzdWTmNFeExkOGZOK2R4TGQvZm9EaWFMODZ0NkUzWjVKNmk5?=
 =?utf-8?B?R3Y4Y1Rqb2JlQWFiUFdHZ1hWKzFPemdOU1ZYL2RybGxWeXcxMjQrVEN5MHlE?=
 =?utf-8?B?L1d5MHFrWmZXanY3bms3YXhCeERTL2k3VDRiNmRPN3g4cjc4VmREcnhIN0FJ?=
 =?utf-8?B?SzVJWVVjcHhDZzRkRDNuWS9ISmY0L1dlR1lmYVBLNE50OUZqKzhjSWpEZ1RL?=
 =?utf-8?B?Vm1SVGRuNDZ3WFRQTUVlNUM5YVZMMnVkS0REZ0xZT3BNdUhvUTdJbVYvM2pn?=
 =?utf-8?B?RVVUeXpUbHRMTDlQUUkyVzY3MklmVXpGaVUrSklSRWZRTXd2UmE1aW02Rmkz?=
 =?utf-8?B?ZFhONHYzS015emxxNFVSZXV1am9ETzh6a1kyT2YzZzZZZGRXcGJyZHZGcWR1?=
 =?utf-8?B?OUZlN0pLdmJKUXlKYnAwUTl2UjFjc0d3cVdXZWh5VVZmSk9jMm9EN0JjcjN5?=
 =?utf-8?B?SW9qbVkyYlkrQ1hKMGpma1ZZeDJRNUZDQ1lkeW0xaEF4VEhaL29aSGNqVERG?=
 =?utf-8?B?YVgvZVZQNUlRZ1o4R2FVQ0VVVnRLSW9hUStHSmlkM0RWODVRSXhINXdaT2Rr?=
 =?utf-8?B?ckdFSU1LWTZRMG5neFkrbTFkczNDa09pZjhrUkhtQ0NQY0NTL3VxQTRWVVpS?=
 =?utf-8?B?MFNHcThWekVTbVpGK3p4ZS9kQTF3bkdaWW5vZjRCblBzeEIwdjFLay85cEJx?=
 =?utf-8?B?RlBKWTZCL2FUL3l1Nzc0ZUMwWW1ZYmJvdzNBQ1M2MzNDWkNMMmJUbVp5WlRn?=
 =?utf-8?B?QzJScHQyMjJZUHZoM3JBR1B4VUJkMzJicmNkMjMxdVBkWU1YdUw0NlRGQVVp?=
 =?utf-8?B?M1B1M0NXdEJydFlIUDdQUHlWSlE4Nzk2aE9pRFROSFNWKyt5SnZXNVNXaS81?=
 =?utf-8?B?N1dNazFOVTFFaTdlL1NPWUxPWE5zbDZQK1pKdnhkZmRsZnYxTHovNTNCMmpP?=
 =?utf-8?B?cFJGVmJUZUk5aHdCbk1tT3ByTjdxZzlsOFlpZkJZY0dtdytkODlZV1Q0eUkv?=
 =?utf-8?B?Sy9HWlZTZ3dneE5rZVVOQVA1Y1FOMDl2aDc3QW0rQ0JIUkV3NEc2dEdITW5I?=
 =?utf-8?B?SVY4T0h4T3hERm1sNWw4UUxzYVplRjNteWlvaEJ5Rm1qc1BYa2RBVXpSVzhy?=
 =?utf-8?B?NVNBQWhCWWFlYkpQRkU1dnpiRUt6U1NUcklqS0pZMzFwTDVqSWZkd0hIZ2dL?=
 =?utf-8?B?YzFhOHIvSGV2MjdaZksvVFU5YU8zLy8zUXVIR0pWNFZxRS9QazRadDF6MDRB?=
 =?utf-8?B?eTNuTUt0WXlQbndQNVMwa3M4S3ljdzJ6ODRKUS81c1d4NDUxdHFkTGpmZWRT?=
 =?utf-8?B?UnQ3UUsyOXZOYncrb1RFR2RteXZvc2QyTEh5aWJXeTJYOUxIc0M1WjQxdndP?=
 =?utf-8?B?V0VPRkJETlB3NDgyeXRtS3hPaXdDbGZ3YTMyMG5NSDFPeEpWa0lBMFJJTzRv?=
 =?utf-8?B?bU55c05nb1RZT2RpemdkeEdXL2F1WHQ5V2RrcGp0bGRCVXJwN2hSNWZZVFRs?=
 =?utf-8?B?Qi9DaEtGTzRKcVRTcDFRZGowMVFCb2RWUVdNT284bHp4WFdZa2pVWWUwVTVn?=
 =?utf-8?B?UU9QUFF1clAwMVRqOTBVVXEyc2FjY3lxcXc5VmwvZzNiYzdrakdmSjN3dVJi?=
 =?utf-8?B?WmNHWGFrTC9yTGFReTBNQUZyT2xpald2enhuR1M4eXRTUmE4VEZIR3haUUJB?=
 =?utf-8?B?dVFOKzlHQjVGT0pDR2pudU5qR1ZEd29Rc0xGWnFBZEZPa0k5QkxGU1MxRU5Y?=
 =?utf-8?B?RndsdUlzUVhHZGsrRnVRU0VsMEoxRmhVckltTHNSWGVVQ2hBdCsycDF3NDlO?=
 =?utf-8?B?MXJNblRUZFR5c1ZqeksvNzI0R014bDdZSVgvTXBGVkJGZitReGtmZUFEdENI?=
 =?utf-8?B?QkZRV0MwOSt3YTVsRllpNEFLeERjbDZxNlNwVGo1SUxBWFh3MG10cWI2QVNF?=
 =?utf-8?B?MWVXY0xFbkRzVjBjMG92NTNvY0xoWmx2czN0OWlIR2cwZCtEQ0tqZzlJQnU3?=
 =?utf-8?B?UXhOSmg3V2Q3RksrTXcrczluZ1Z1MFQ0d1lHUEp0Z09KcjRGc1hnMUZHWEh1?=
 =?utf-8?B?TnRNNElFYUIyU3ZQSFRmT3I3eTVjWXdnKy9zNisweXI3akJBRVJ1SE1sYWp2?=
 =?utf-8?B?M29GTHVDNzZ1NlZDWWY4OWZXbGFySkdDMzQ2TS84T0FRNjB1RVdxbkp6eU5w?=
 =?utf-8?B?NU9RYk5ld1NocHhla1cwV3VwL3dLTUxld1hFODhIc2tyV0JhTjUxNUluRGFY?=
 =?utf-8?B?UG5paVg2YjBkaHZJMXl5d1BJckpQSEx4TkQxNEFkSi9HZmk0d0hkRkFvWGRr?=
 =?utf-8?Q?kCbYd74GjiR/hzoc=3D?=
X-Exchange-RoutingPolicyChecked: kDBmDZUQYdYF09QvyqLIkaiwbWeAYzqo0cgXcWru7s4bUXUgSZQ85lmHaHJ1cez6elofB9WU7RCAWJpZ7ybH+D0fg3HHvJ3Qfc8UqKeCeEcjKCI0t2dGcpNKbx+eYSqSuhXJOQxr7Mh2BPpDEknKw7CkxSG+4znf9828dj2/pPAHzRVJCsX6TcDlgsdusOdwPh6Idj8IciKcpmpaoKZgCPf7sPQ32BNIpTtk8rl0NAvqMEceVosL1W8f0MX8g6vbjopAmHLdo4gbEPGiCl7Fd1Lb8u4W/1MSFHFVW+BngINdSxhBfLW8WKb6MQGlx9pd+pbZs0JpbuexUit2ewmsog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba443b5-d509-4dac-f19b-08de9afe7eac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:51:37.4458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtCCVBX8dgZvypMmwB6CWwYw+sGocEweM7t441pt/oN7hAHdvDF30H3tIvV4KLq5tD4fVnlllM6XBqZclYhV01TNEPkMYRjg7ROvKjz8I/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
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

Hi Kamil,

On 4/15/2026 6:53 PM, Kamil Konieczny wrote:
> Hi Naladala,,
> On 2026-04-14 at 19:11:33 +0530, Naladala, Ramanaidu wrote:
>> Hi Swati,
>>
>> On 4/13/2026 8:51 PM, Sharma, Swati2 wrote:
>>> Hi Ramanaidu,
>>>
>>> Shouldn't we revert 7f0a262891b7888a09e4a1838eb688ad9c676324 ?
>> Recent patches caused the revert to fail, so a new patch has been submitted.
> After second thinking imho just start a revert,
> resolve conflicts with this change (overwrite a file with your
> current one), write a description why we need it and resend.
>
> So a subject whould look like:
>
> [PATCH i-g-t v1] Revert "tests/kms_vrr: New subtest for CMRR"
>
> And description will start with:
>
> This reverts commit 7f0a262891b7888a09e4a1838eb688ad9c676324.
>
> then add below a comment why it is needed.
>
> That way it will be easy to spot in git log --oneline
> that we did a revert here.
>
> Regards,
> Kamil

Sure. i will update the git subject and commit message.

Thanks & Regards,
Ramanaidu N.

>>> commit 7f0a262891b7888a09e4a1838eb688ad9c676324
>>> Author: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Date:   Tue Jun 18 13:12:25 2024 +0530
>>>
>>>      tests/kms_vrr: New subtest for CMRR
>>>
>>> ++Kamil
>>>
>>> On 11-04-2026 11:29 pm, Naladala Ramanaidu wrote:
>>>> Remove the CMRR subtest due to a change in test approach requiring
>>>> a complete rewrite. The subtest will be reintroduced in a future
>>>> patch with a revised test methodology.
>>>>
>>>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>>>> ---
>>>>    tests/kms_vrr.c | 132 +-----------------------------------------------
>>>>    1 file changed, 1 insertion(+), 131 deletions(-)
>>>>
>>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>>>> index ec0692b2f..01f078d2c 100644
>>>> --- a/tests/kms_vrr.c
>>>> +++ b/tests/kms_vrr.c
>>>> @@ -36,10 +36,6 @@
>>>>    #include <signal.h>
>>>>      /**
>>>> - * SUBTEST: cmrr
>>>> - * Description: Test to validate the content rate to exactly match
>>>> with the
>>>> - *         requested rate without any frame drops.
>>>> - *
>>>>     * SUBTEST: flip-basic
>>>>     * Description: Tests that VRR is enabled and that the difference
>>>> between flip
>>>>     *              timestamps converges to the requested rate
>>>> @@ -90,9 +86,6 @@
>>>>     */
>>>>    #define TEST_DURATION_NS (5000000000ull)
>>>>    -#define CMRR_PRECISION_TOLERANCE    10
>>>> -#define VREFRESH_MODIFIER    0.1
>>>> -
>>>>    enum {
>>>>        TEST_BASIC = 1 << 0,
>>>>        TEST_DPMS = 1 << 1,
>>>> @@ -103,7 +96,6 @@ enum {
>>>>        TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>>>>        TEST_FASTSET = 1 << 7,
>>>>        TEST_MAXMIN = 1 << 8,
>>>> -    TEST_CMRR = 1 << 9,
>>>>        TEST_LINK_OFF = 1 << 10,
>>>>        TEST_NEGATIVE = 1 << 11,
>>>>        TEST_FORCE_RR = 1 << 12,
>>>> @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo
>>>> *mode, float virtual_refresh_rate)
>>>>        mode->vrefresh = virtual_refresh_rate;
>>>>    }
>>>>    -static bool
>>>> -is_cmrr_mode(drmModeModeInfoPtr mode)
>>>> -{
>>>> -    int calculated_refresh, actual_refresh, pixel_clock_per_line;
>>>> -
>>>> -    actual_refresh = mode->vrefresh * 100;
>>>> -    pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
>>>> -    calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
>>>> -
>>>> -    if ((actual_refresh - calculated_refresh) <
>>>> CMRR_PRECISION_TOLERANCE)
>>>> -        return false;
>>>> -
>>>> -    return true;
>>>> -}
>>>> -
>>>>    /* Read min and max vrr range from the connector debugfs. */
>>>>    static range_t
>>>>    get_vrr_range(data_t *data, igt_output_t *output)
>>>> @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t
>>>> *output,
>>>>        return 0;
>>>>    }
>>>>    -static uint32_t
>>>> -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
>>>> -              uint64_t duration_ns)
>>>> -{
>>>> -    uint64_t start_ns, last_event_ns, event_ns;
>>>> -    uint32_t total_flip = 0, total_pass = 0;
>>>> -    bool front = false;
>>>> -    drmModeModeInfoPtr mode = igt_output_get_mode(output);
>>>> -    uint64_t req_rate_ns =
>>>> igt_kms_frame_time_from_vrefresh(mode->vrefresh +
>>>> VREFRESH_MODIFIER);
>>>> -    uint64_t exp_rate_ns =
>>>> igt_kms_frame_time_from_vrefresh(mode->vrefresh);
>>>> -    uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1
>>>> scan line. */
>>>> -
>>>> -    igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
>>>> -         "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
>>>> -         req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
>>>> -         (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
>>>> -         (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
>>>> -         (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
>>>> -
>>>> -    do_flip(data, &data->fb[0]);
>>>> -    start_ns = last_event_ns = get_kernel_event_ns(data,
>>>> DRM_EVENT_FLIP_COMPLETE);
>>>> -    do {
>>>> -        int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
>>>> -
>>>> -        front = !front;
>>>> -        do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>>>> -
>>>> -        event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>>>> -        igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
>>>> -              event_ns - last_event_ns, (float)NSECS_PER_SEC /
>>>> (event_ns - last_event_ns));
>>>> -
>>>> -        diff_ns -= event_ns - last_event_ns;
>>>> -        if (llabs(diff_ns) <= threshold_ns)
>>>> -            total_pass += 1;
>>>> -
>>>> -        last_event_ns = event_ns;
>>>> -        total_flip += 1;
>>>> -
>>>> -        diff_ns = event_ns - start_ns;
>>>> -        wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) *
>>>> req_rate_ns;
>>>> -        wait_ns -= diff_ns;
>>>> -        target_ns = event_ns + wait_ns;
>>>> -        while (get_time_ns() < target_ns - 10);
>>>> -    } while (event_ns - start_ns <= duration_ns);
>>>> -
>>>> -    igt_info("Completed %u flips, %u vblanks were in threshold for
>>>> (%.2f Hz) %"PRIu64"ns.\n",
>>>> -         total_flip, total_pass, (mode->vrefresh +
>>>> VREFRESH_MODIFIER), req_rate_ns);
>>>> -
>>>> -    return total_flip ? ((total_pass * 100) / total_flip) : 0;
>>>> -}
>>>> -
>>>>    /* Basic VRR flip functionality test - enable, measure, disable,
>>>> measure */
>>>>    static void
>>>>    test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>>>> @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc,
>>>> igt_output_t *output,
>>>>        igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>>>>    }
>>>>    -static void
>>>> -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>>>> -      uint32_t flags)
>>>> -{
>>>> -    uint32_t result;
>>>> -    int i;
>>>> -    bool found = false;
>>>> -    drmModeConnectorPtr connector = output->config.connector;
>>>> -    drmModeModeInfo mode = *igt_output_get_mode(output);
>>>> -
>>>> -    igt_info("CMRR test execution on %s, PIPE_%s with VRR range:
>>>> (%u-%u) Hz\n",
>>>> -         output->name, igt_crtc_name(crtc), data->range.min,
>>>> -         data->range.max);
>>>> -
>>>> -    for (i = 0; i < connector->count_modes; i++) {
>>>> -        if (is_cmrr_mode(&connector->modes[i])) {
>>>> -            mode = connector->modes[i];
>>>> -
>>>> -            found = true;
>>>> -            break;
>>>> -        }
>>>> -    }
>>>> -
>>>> -    igt_info("Selected mode: ");
>>>> -    kmstest_dump_mode(&mode);
>>>> -
>>>> -    if (!found) {
>>>> -        igt_info("No CMRR mode found on %s, try to tweak the
>>>> clock.\n", output->name);
>>>> -
>>>> -        mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh +
>>>> VREFRESH_MODIFIER)) / 1000;
>>>> -
>>>> -        igt_info("Tweaked mode: ");
>>>> -        kmstest_dump_mode(&mode);
>>>> -    }
>>>> -
>>>> -    igt_output_override_mode(output, &mode);
>>>> -
>>>> -    if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>>>> -        prepare_test(data, output,
>>>> -                 crtc);
>>>> -        result = flip_and_measure_cmrr(data, output,
>>>> TEST_DURATION_NS * 2);
>>>> -        igt_assert_f(result > 75,
>>>> -                 "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
>>>> threshold not reached, result was %u%%\n",
>>>> -                 mode.vrefresh,
>>>> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
>>>> -                 result);
>>>> -    }
>>>> -}
>>>> -
>>>>    static void test_cleanup(data_t *data, igt_crtc_t *crtc,
>>>> igt_output_t *output)
>>>>    {
>>>>        igt_crtc_set_prop_value(crtc,
>>>> @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data,
>>>> igt_crtc_t *crtc, igt_output_t *output)
>>>>    static bool output_constraint(data_t *data, igt_output_t *output,
>>>> uint32_t flags)
>>>>    {
>>>>    -    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
>>>> TEST_CMRR)) &&
>>>> +    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>>>>            output->config.connector->connector_type !=
>>>> DRM_MODE_CONNECTOR_eDP) {
>>>>            igt_info("%s: Connected panel is not eDP.\n",
>>>> igt_output_name(output));
>>>>            return false;
>>>> @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts,
>>>> help_str, opt_handler, &data)
>>>>            igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>>>>                run_vrr_test(&data, test_seamless_virtual_rr_basic,
>>>> TEST_SEAMLESS_VIRTUAL_RR);
>>>>    -        igt_describe("Test to validate the content rate exactly
>>>> matches with the "
>>>> -                 "requested rate without any frame drops.");
>>>> -        igt_subtest_with_dynamic("cmrr") {
>>>> - igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=
>>>> 20);
>>>> -
>>>> -            run_vrr_test(&data, test_cmrr, TEST_CMRR);
>>>> -        }
>>>> -
>>>>            igt_describe("Test to validate the link-off between active
>>>> frames in "
>>>>                     "non-PSR operation.");
>>>>            igt_subtest_with_dynamic("lobf") {
