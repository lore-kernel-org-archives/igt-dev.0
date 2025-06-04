Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B96C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 18:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF8310E771;
	Wed,  4 Jun 2025 18:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVoAhnwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33F310E771
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749061415; x=1780597415;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n6KmN0i8GXYykR/boP5qjN12Du5GU2NuLrTYQv0uKR8=;
 b=QVoAhnwmvNsAqCwc7rkZaSHLELgK7aBFftgsIfs6yUAMb7DWBI/PaRH5
 3BnNa2MpBv1iXbumdkRz/46/dAMTRDzqh+8lmVGDxxtaV6KViGbGTsSB4
 s9YJ/STvIMa+FBmZIn2zeU/gQJbbh2Ygnd5joWVwPkJ0yHy2Gy+Kb24OF
 XJcI9vhDBR1RsQmDMs0QuQXmdXAVdD28SwhEdB96WL5voOJcH5/T61y2y
 cXbe+HevUibSQbXGT2R/ERClFaL3p/pipmSulL+FEvBBXYRmEzn5XTkmt
 yTTPrHg1ar8ZdrQIRz58+HBBG36se4Lz3vwSMBriPxgZpFZ2VgINF4rGv g==;
X-CSE-ConnectionGUID: uwgcA/fwQra64FxTJYeFaw==
X-CSE-MsgGUID: RG+A8K2cTbKZQEx5wLBRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54957243"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="54957243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:23:34 -0700
X-CSE-ConnectionGUID: 845gR57+RieExI7v+izVFg==
X-CSE-MsgGUID: g3OZa+gSRq6CqME8cp8E7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="168432261"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:23:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 11:23:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 11:23:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.82) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 11:23:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIhLtcqGD4oFgko4sPKZdZziPQ9Uj7/eIVoQpHUJ4ojRKJqMdSK7/ndv98TGBKK8wXRLjHzK8al9M1D+ub4UNkWsy371+FHl1A5Jym+fo0sltKDmEFOCQzu7Xi442f1qwHux/QAYrwNK4pNTeNe9gjstFRNzin3i31zH+EYHvz2X72QSszzKNbuWVPp1SCro2wvW9xEiQaQ0tYn/IS7Tqy5zNI39WHMXGPtMgCUC33eSBz4rcws+hoEs+FXJ8a/dnQ99IWQg7tbfBget6q7kI97VIHDW1bYkyAEYtUt3kMwvQcGracm924L/iQYeWQ+NOOB8CkHsUqgJ9bybPBw3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf/i4xcgc+qXxoDWzctFWceg9drlQ7n+2LW4waWZgb0=;
 b=o1sn40G8e1StiCyQ/NBfCPLIgkuVMSI9N7hW3VNohBJW6+0JjihcX1GXNsxhOjZqz4EKPECX3F07nxZyiXmw3bMs9cYOCeNHcrG2NtM8BXmR+KOKJ3AaKTVyccB4ntAefy6CcnoQdqqMfTVUJtrdyHEB3BrRT4Apf7pXU8/07oew5jc4O/hksare7kBmc7p7W1ou2J6nJ+FlNlZsQHk9NPIWYWwtW5gsR9o/dVKogIFsXulbzM033OAKol5ZwOZVL0QI+X7CJ4yPS5TpMlKwypx+OrOOjSsVxnyno/edv8wiE/o0a6t3lqWxaIT4GzQt5u5hyFAK3IArTYLa58yngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 18:23:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Wed, 4 Jun 2025
 18:23:25 +0000
Date: Wed, 4 Jun 2025 11:23:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_pmu: Validate engine
 activity on gt reset and suspend
Message-ID: <aECPFGNLVbCsAYCj@unerlige-desk.amr.corp.intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-2-riana.tauro@intel.com>
 <aDibeRsG5OZkCVem@unerlige-desk.amr.corp.intel.com>
 <a4cc689f-c5ff-4dda-b897-f4cb7f3ea670@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4cc689f-c5ff-4dda-b897-f4cb7f3ea670@intel.com>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 2555adcb-d5c6-46b4-967b-08dda394e54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1FtYzV1bWpHekJyL29GOTd1RXZCdk1XN1IrZkRXdWdhUWtRNmE4VFUrQTBv?=
 =?utf-8?B?Rjl5ZWRqZnNXSTZxM1MxTUc4QWZYdVlEUHR1TmFHTXNQdkZMSlJFY0xTRUZM?=
 =?utf-8?B?SjJrbVpwdDlzUktDL25FN0duZ2QzRnd5TnNKOUFMS09MWGQ2YXpPM1Naejdh?=
 =?utf-8?B?bFR6dzJNTG9aNUw0M0FlbmtGOUpQMjBJSUtTUHl2M1dwbWthbzNxRU5xT1pV?=
 =?utf-8?B?bnpxQkhyM0NKb2NJMnBNYlF6OE00M3BJVVFyTC9RSndvNFFxRm1SdEVOQ3dy?=
 =?utf-8?B?RWFrSGJ5a3kxeFRmVGRIV1dtcHYrblg5cC91bXdwSDN5UEJzNVFwN2pPRGcx?=
 =?utf-8?B?b2hINWs5U0dPQ0hHaUdRV1VONWhtMGNzRmZXNENBSzBGN050UUY4QXhSUEZY?=
 =?utf-8?B?VmhMUkFjMkFiYUNjSmx6TitYc0gyc3lTbnkxZ3lvd3NwMHppTGVMWUNBWnNs?=
 =?utf-8?B?U0xvR2J3c1laa2R2NzdKUHVJVnlFUU5RdDV0SGtoL0RpM1NrTmFzUy9wcHpX?=
 =?utf-8?B?cVpiNjQ2UHpDQ1prbHIvUE4rR3MrUTVHNll4YkUwblNoQVhsbUVZZC9Md2h3?=
 =?utf-8?B?ekRqWUtNWXFhVkhTUmFXTnRrSXlGT0QrZmpQRnJWejgvMHBIb0dQQnlNeDU1?=
 =?utf-8?B?RHVtTUhwclNpSEkyeUk5bGlDUzVYenhsVjQzc2VLcGdnNGhsQ2lsaytFUnN6?=
 =?utf-8?B?ekFxVDhwNlAzK3gwLytmZVd2R2RUWG5zK0hJdHpzUFRac1pNbXVYanJXTW5z?=
 =?utf-8?B?ZSszOVQ5WjhoN0ZpQzEyc1lFb3RLbEliZkcySnJYY3J5NUJyQm4yUFVGY09m?=
 =?utf-8?B?bU5DUHJQTTNvMHBTdmFkOW1ybkpDQ01mTWQrOXlodnNDVlEzUVdMUnZPTElW?=
 =?utf-8?B?K3h0RHhrNmZJMnExRmVTeXJ1UEJhbUNCV2VxbjlOektraFlUSTJFMGE2dXV3?=
 =?utf-8?B?Z2x4V3BPTXdIaCtDOElkS2Y2RkhtMDNmSjdET3ZzSnBIRWhXYzJwOEZMUkNE?=
 =?utf-8?B?Mi83UFkxU1N5cXc4K0FEWVBCcG9VVUszakRJM1I4dXhwNzByUjR3YTZ2Njgr?=
 =?utf-8?B?SHhEMDIyc1dxMTdwZ01OQUM0TlFFRndUY084bzRsemUveWF3SUlXT0R0b3Q5?=
 =?utf-8?B?ZXZnSkIwVkNvcENuTGp2aktUMG9nMzhhSWFMSWVmRWJZb09UaWZoeHpwZmkr?=
 =?utf-8?B?SkdyZUxuSUZRU2JtZ29aaHdnd1BxYjZKYmZqb0xVNkx5MzE1VEZ5ckl1dE1R?=
 =?utf-8?B?dW9WcElYQ2x3QWVONEU5MjJIVE10Y05YdVp4bFRPNm9BRTY1L3FZanZLRFZz?=
 =?utf-8?B?Y1RQRG5sL2h5SzNRZEFRek1kYVdRQ3hyWDhzbXNFYzAxaDJabjgzRkMzTGJv?=
 =?utf-8?B?YjVTTlpUZ3NzaWo5UWRFTVRKSXR3Mkhxd1dSOVJUdjBWVUg3RUtwMFBWdkRx?=
 =?utf-8?B?SjY4TXlreWtZdGJnU0RFV2EzRVdlZ0JRZXAxcUV3TFVZclUybFJGZWk0U0NC?=
 =?utf-8?B?YWVKOUlYak9CTWVZZXBObTVSek4rTG14KzZvVWJ0ZURVQ1l1eXJ6WlZZY2JM?=
 =?utf-8?B?SkVBMzBLZmRIenoraUtJOHdMUXEyZFhGMnFFUTFXNzJzOGQ3TndGUmMyeGlC?=
 =?utf-8?B?NFRtODJJVllwR2hWZWJMMWdUZG9uRkVHUjA4WUZRT1Rha2s2R2tTMlNSYlRR?=
 =?utf-8?B?d2lzdmVLQ2c5RFRoWU5IcGpEOHBpMHlMVDlDbGZ6MW9JQVVwZDRCNlY0ZHk0?=
 =?utf-8?B?TUlpYUhuaWpTbHRvRlJib3diVjNlWUJEd1BqMXZ3WGl1cGtZTmgzbitnWFEv?=
 =?utf-8?B?cFJRalNWL0dQTUtMYXRjaU1UZ0Zua09XdG0wN3RUK1N1M3UyejZqU01ETjZY?=
 =?utf-8?B?MGV5SGZHbDArQnpKYjhrNFVlMHJwOFJveVZpazlVOURIWmFoTXdMdnlnRTly?=
 =?utf-8?Q?LehDUwj4lPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGFGZkZIbjZFM3JhOEVuZ2RpVTlUUGxTeTJLVC9FVzkyeU5OOWJlRXJoYnd4?=
 =?utf-8?B?L0dmQi9rekFUODhMa0F4V1BYaXB6enRNdGsycmFpaDNBckdWbmJVblhTM0dw?=
 =?utf-8?B?SW1wc243R1hRNXpJenhyZFloSStIbFM0dXJEWXBWaFQ0ZzF3NzNmbTlnUGxh?=
 =?utf-8?B?WDVLcWRjbCtoblZBbUZsSEs4MnBobWJhL3psRUVXMXZBMU1RMHBhMjVGUnpy?=
 =?utf-8?B?THdtTWV4YldjdVlIQ1VSdk96VFZvYmxNTkVGRDFYZTV5N2ExOGhGOElRUnpp?=
 =?utf-8?B?L3FCbGxVeEtzZ2o5Mmt2aWIyK04rcEI1ekcvWnRIQVlqZDNpMFRSeGxTc2dQ?=
 =?utf-8?B?NU9KYkF4a2ZaWUJ6RzA1WC80ZktGQzRheFBxS1lScXBnM0krdWdWQjFEMTY4?=
 =?utf-8?B?SG0zOFhIS3hTc1MwdWlJVURnS2xHY0RtaGtJOHUzNTBERkljYlhPUjNxK05X?=
 =?utf-8?B?VDFJaHJHU0FaNEJXc1VzVnZUYnYrRzV5T2JkYStxdXNBZk8wdFRtLzdsV0tO?=
 =?utf-8?B?MFpuTko0SE9OUVduWnNMWU9CdUxJWFFLbmQ4cUxGTzcyWCtMNHdTalBYTjI2?=
 =?utf-8?B?QWp4Ui8wSFdhOFg2QVNBN0htWXZlVmlMcmlXRXZ0bVNURExqWHVlaHh3UzhE?=
 =?utf-8?B?TGFCemVTYWc0K2NCWjBQa2FZZmVyYU1KQlQwMHVqaVoxL2tqaVJZSEJSRWky?=
 =?utf-8?B?dXJ2VzliTEsxdXdsMThyRWRNQlVtU05Lbm9TUWQvbGQ0UEtVZUcvQ2xScGdi?=
 =?utf-8?B?YXhEQ2R6NHh0ZWtDUUF4b1liMG5HQzI4L2dWSFFmSzFyRHltd0preWpCbUgv?=
 =?utf-8?B?TksxK2FDanlrdWJMQnJIeHBpRjVTTm1VcFJLM2pmb1lrQlNkZ3NCZG9vZGNV?=
 =?utf-8?B?UW5haDZJbDYzOG02WnlSV3hHOU10TjNkMEdlM3hZc3lyZlk3RTh4dklpZXZr?=
 =?utf-8?B?NnQrN1JrdnM1TDZRNkRZL2J1TzFDUnJqYm16VVpyMlVYc0wzSUFuR1VQRUd4?=
 =?utf-8?B?L0p2dXZUMlVKdWVMMzc3R21Ja3YxQ0xQZWM1eVdTRzRQVWIxcXdMNkJLY2M4?=
 =?utf-8?B?T2d5U3NYNnJueFR6MWFXMlhVQkJGbHlWbHZuR2orWW9MMVJreWVEbElsYkl4?=
 =?utf-8?B?UkszUVE4d1NqaDdSeGkvdmg1Tnl2RGFSazdnRXF5eWpDK1o4NlRuMkcxQnJM?=
 =?utf-8?B?d0U5YklnOHVmRkx1aDNUNDBDaTNzUElIVVVmZlc0RlFXRFI2SlJlVXplTldJ?=
 =?utf-8?B?MHlaQ2pNVUw5L3B3L0lXM2krcHpyeG9OMXk0ck15ZnNVbGNBQzNOdUQ3UVU3?=
 =?utf-8?B?TEFCRHdRazY0Y1hlenoycjVmdXZobWtWc3IzZ3FDQW5QZnltK2pQMzc1ME9n?=
 =?utf-8?B?bjZzbHNUcSthS2RkTHlpVjFpUWoyeXFFTE1mQnpXRmYrb3hmNXJ4eGJKd2pF?=
 =?utf-8?B?ZnJZWkVnMFNaekVsOUtXTnVLSERLVUhBQmVvTjBEVEVpSnBIZ0EvVmVWekxk?=
 =?utf-8?B?cXFiZ2g0VE8xQStvUElxYUFJdWxjOTE1eTB2VzRVNkp2MEVaTm10K0VtN29m?=
 =?utf-8?B?VTB3ekZ6M0p1QVI5T052Q2V1Sk9FWXlMMVpQNlhQSWNvT0gyRHMzSjF0cHZB?=
 =?utf-8?B?bDlsRUpFYi9qMGZZMTl5eWJiRDh2VGRCOUYwcXIveU85Y25RMWd4SEZVbUZQ?=
 =?utf-8?B?eFo3QlNvVm1leURaZEtRNWQvY3psZlRhNlpTd2paV0lsbW9LU0diZHZPcDVi?=
 =?utf-8?B?M2VkWENoL01mOFErSjMyc2d6QjluM0V2VlZCYlB3aUNLUGE1eFcyN3FDR0hx?=
 =?utf-8?B?WjU2Z3k1OEk1SFJpUENOMzdmOUQ5Q0M5a1orWWNjMStuUWV0dUpZMDFMT2hp?=
 =?utf-8?B?T01qNXA2VkhFVlFGcU9ORTNRNHBjdzFKOHpsOEJvbHh2Zkliakxjb2MxMzdy?=
 =?utf-8?B?YW0vV3FPYU5XMGcrWDlKc013bjVVY3U2WkRpeTVmT0wwek1RQ1o5ZkhpSmJx?=
 =?utf-8?B?bTU0VXRsN0lLV2E5VHVuVXBUanhCbWFENlRmRmRGTDM3MERCQmFlbXA1N3Bz?=
 =?utf-8?B?bzhUckpXOE1JQ1BBSTBId1JXZFJtMGlOT0hKVG1ha2t3cUNNZG00VnUwOXIw?=
 =?utf-8?B?QlQ1L0dGSEY5WjBoOC9wdFdxSmRKb3BERTJOemJHVHI4amZnRXZraGxBVUVu?=
 =?utf-8?Q?M9kLOM7f9jduVel8dORr4vw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2555adcb-d5c6-46b4-967b-08dda394e54a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:23:25.7124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai2VTgIriK/MUJdSeobkDZOXctN9KkkNCjqBKsa+tRRVUGa+E9v1h/sc0AzW5R0O+aIgNguYcFejoqAdJ9a53L9uD0C6+MraqOrBZkNS0w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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

On Tue, Jun 03, 2025 at 12:06:27PM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 5/29/2025 11:08 PM, Umesh Nerlige Ramappa wrote:
>>On Thu, May 29, 2025 at 12:23:56PM +0530, Riana Tauro wrote:
>>>Add tests to validate engine activity before and after gt resets
>>>and suspend
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>tests/intel/xe_pmu.c | 21 +++++++++++++++++++++
>>>1 file changed, 21 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>>index 02f23bd7d..15b4b82d8 100644
>>>--- a/tests/intel/xe_pmu.c
>>>+++ b/tests/intel/xe_pmu.c
>>>@@ -40,6 +40,12 @@
>>> * Description: Test to validate engine activity by running 
>>>workload on all engines
>>> *        simultaneously and trailing idle
>>> *
>>>+ * SUBTEST: engine-activity-gt-reset
>>>+ * Description: Test to validate engine activity on all engines 
>>>before and after gt reset
>>>+ *
>>>+ * SUBTEST: engine-activity-suspend
>>>+ * Description: Test to validate engine activity on all engines 
>>>before and after s2idle
>>>+ *
>>> * SUBTEST: engine-activity-most-load
>>> * Description: Test to validate engine activity by running 
>>>workload on all engines except one
>>> *
>>>@@ -812,6 +818,21 @@ igt_main
>>>    igt_subtest("engine-activity-all-load-idle")
>>>        engine_activity_load_all(fd, num_engines, TEST_LOAD | 
>>>TEST_TRAILING_IDLE);
>>>
>>>+    igt_describe("Validate engine activity before and after gt reset");
>>>+    igt_subtest("engine-activity-gt-reset") {
>>>+        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>>>+        xe_for_each_gt(fd, gt)
>>>+            xe_force_gt_reset_sync(fd, gt);
>>>+        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>>
>>This is also probably one of the tests that we want to run, but for 
>>gt reset and effect on PMU, I would just do the reset withing the 
>>single
>>engine activity test in the same manner as it was in i915.
>
>
>i915 test checks for idle after gt-reset. Since engine activity is 
>registered with GuC.  I wanted to check if running a spinner again 
>after gt-reset and capturing activity values works
>
>Should i add another test for idle after gt reset?

Yes, an additional test to just check for idle after gt-reset should 
help.

Thanks,
Umesh

>
>Thanks
>Riana
>
> >
>>>+    }
>>>+
>>>+    igt_describe("Validate engine activity before and after s2idle");
>>>+    igt_subtest("engine-activity-suspend") {
>>>+        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>>>+        igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, 
>>>SUSPEND_TEST_NONE);
>>>+        engine_activity_load_all(fd, num_engines, TEST_LOAD);
>>>+    }
>>>+
>>>    igt_subtest_group {
>>>        unsigned int num_fns;
>>>
>>>-- 
>>>2.47.1
>>>
>
