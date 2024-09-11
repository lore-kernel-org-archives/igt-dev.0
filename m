Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559CFEE0211
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 07:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CCF10E804;
	Wed, 11 Sep 2024 07:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CT8jPvdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD3610E804
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726040645; x=1757576645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kiRZV280NCoj9832oIBqUE+sruP01vUn62wIQFCd5Qc=;
 b=CT8jPvdUfo86CnGvJYAsocUucQjvSeuI24CPP8cyYGnCGtHR0j3KcqD0
 lv7gWuKfhw54xGwJSCdmcL81mUOawfJ6uQGyWMyWlSyHcrnBiLkIDJVEY
 uzrCu+CiVU9/r/Ne3YKOafhy2vzd7tMi9mpp5QVzqchOnA1L4AK6K3V1f
 4sYLDcVbHPriwjT8p9qURpsKSdG6HD6KE99B44W9ONBOACRXq8ILc2Q+k
 70cN7bJ0pcNkbb0b0l5akLC9yxIPC576Zp1M6LyESTIhFyPWMPuYbKaqF
 mMSQTVB3BqncZF5pj9RnIAzCzsHeZ4ErpBpLc8O9KCcP+1nz9Z6QXBDxn A==;
X-CSE-ConnectionGUID: zRbUhWddTzaL0v5dxGGgAA==
X-CSE-MsgGUID: Mn8DgPmQT2+k7noOSGVJbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27745435"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="27745435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:44:05 -0700
X-CSE-ConnectionGUID: u1I1RDpIQMOl4wyfncsBUw==
X-CSE-MsgGUID: HUpK3MQpQn6wzarUngNSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72262482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 00:44:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 00:44:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 00:44:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 00:44:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 00:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+KYYhr1KWONMFCpfqKfiYl2s9QLboH7XvOi7oeWFulasaqjL3EPl8D217pnA+K3kvWU57G7AzLqm4XYhL0vRs4UT+jimOAUAHo8O+Z8BRazj/bobQC9MytvZveP3iGZcD0ME/T2n8yIfZ2RXeDCB1YOUoFIJxSaq/ElPMa+ECzYyrYOLHJnJV7aXMxGxsxe/gKLEioTTczRhTAP/iy3VTFj8hkD7eVaehyJ74OSE652pBt2ex/2JrlhU6SMJRHFi8WqzCpXwwaEwZ1shlaObB80BH/uC+NzkvKf+oQVbfCQnn+TW0UDJV9tHReMxCCSk38cAxHlZco4PrqFqD3GiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLigLtjkclHfDReYqzUHRdt5XNPRDlgX9KeQ3Ji0sDM=;
 b=RbB4hnLuGhBVEn3Qto5/SOiOF9GFb/ZFH5hPni0aYuYnHasDw5go2S7y3cMsEcEY2RYrcmU6IOO8dMl/WDIYIkmG88Ym4Ebta+6eLH1YZDcNb/2tcIRxLeG/zHWzqXGDxVOvrSfYu0Y4NOgyTNC3Y5EcbAJF2jAiypqz7JJ4Rwx4jcioZHUNrDYY6OWj1x3TS5Zhb1/+yJ8RX3biKE8KUuoGCnf7nlncXLKjgFaHQ+5zqeU7uxTGddKp6GdYbouU6rjJIPY0uMmglCaOzmAN8G1VfW9A7Dau58JRabzMw8Pox9SZ9EN3SBkqPDVMLF7et667iUtQh/yx3YmHh1s6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 07:44:01 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:44:01 +0000
Message-ID: <dc9c09b5-bb86-421e-b60d-bcda9717e340@intel.com>
Date: Wed, 11 Sep 2024 13:13:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] lib/kms: Update force joiner helpers to
 accomodate Ultra joiner
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>,
 <bhanuprakash.modem@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
 <20240911072204.22825-3-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240911072204.22825-3-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|CY8PR11MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c0644-780c-49d8-298b-08dcd23580d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE52MCtjKy9CSEd3QUMvWnNRZ0ptTW4wVkJLZlZ0bzhsRWVNb21abUtvRTky?=
 =?utf-8?B?RE5tS3JMUXVacTh1TURYNEpWTE5rWEpwbVBCWk5mZGRCdHdTSy9NL0NoRzhU?=
 =?utf-8?B?TVVLdTN1VXVIMGI3QlVYbDlrNVhGSU00WURxcTZySjdPTm9CL2RMSXJzcG0r?=
 =?utf-8?B?SGJxYi95elRNMHEwRTZuRGVjTnhjYVkxTCswdjN6YXQvbFVaTTdIbUVqQzY4?=
 =?utf-8?B?Z1RldHo3Mzh2TDBpWDdQNGtINXFyb2o0UFdTeDJxWlRicmZ1OTlCWmsvak5M?=
 =?utf-8?B?MVgvelI3NTVOYytYWUZ1QU41S3lZaVE2WGlNY0F4QjJzV1J6Zmhhbkw5OHlw?=
 =?utf-8?B?ZHN5WGlwcEFJKzlkVzBsQldzRmtHVjFLZ3hWQ2dGajkxS0pXS1BmeG10VVBu?=
 =?utf-8?B?YzFLRzQ2dDZXeUpUY3oyeUE2VkYvMk9pWEowRCthWk1UN282eGpFb3M1UE13?=
 =?utf-8?B?YVNlUTlrREc0dE8vL012cWk5dlc0ZDY4eXo4WndqMThDSWJiODNkdGlydGJ4?=
 =?utf-8?B?ZTJTTzZ2MXdGdnF3aFBvbkxBZU1kMFh6bWpCM25RUm1JajdHRjdBTXhyUjFN?=
 =?utf-8?B?Y3NEMURmcGNPU0VVMkEwOTJMdmVHcDRKdXBTVnl2SjZxRWlBZ3ZaMHVMaU9k?=
 =?utf-8?B?bFJDOEUxQ2xiNkdaUklMWTg1WnVJMUwzcUVJckRSVWRZdk9jRFRqZFY3UjhU?=
 =?utf-8?B?ZmpXTmNKUDhtdWJVVWNnTGxnaHVTSXlxTWlzRXZsR21Ib0lUNGVYT1BKVzdr?=
 =?utf-8?B?Z2V5dFVSc2ppcXZxUytqRktsVmtXN0hXNXU5OVUwZXQ3QmZJdGZwU1JkUFQz?=
 =?utf-8?B?OWFndmdlTzkzZktmKytEYzV1WUZLQUk4dDNFZksxcDVVM1greU1mWGZMMjI1?=
 =?utf-8?B?TVkxTEdWZVNiNzI0VHN1dCtqd0ZuUjB0aVpZc1lmYUh3SVRiWVlTUlF1a3dv?=
 =?utf-8?B?UnR3cDFySUhveW5OWndSUWwvejhWSFJUOEhwS2FDZXEvMWtnRGhxU3R0dzR1?=
 =?utf-8?B?RFFBZTBtNFVsRW8vQWlONzFBb1BuSEJBT2lrZmdFZjNoSmZadHcvWkREblJk?=
 =?utf-8?B?U3BPbjkyYkRjQ3pnMkxLcGV3NHl0WVNlYnAzekFwNGk2QlowN285UXlsZEhx?=
 =?utf-8?B?TDJvb21GRExFVjNNL21NQkxSN1MrTmlWMUFHN0VjaUhpT2IyYWJCOWZWZHkr?=
 =?utf-8?B?dWJ3Vk9FbzVZTWIvVmNQdlNzMC90K3dvbFJLd1IxRnB6RktiZ3ZQbTBibEZn?=
 =?utf-8?B?NmhpSlZ0M3lpUU1wdzZXeWdnelJ2UHFhenRyOVFYbVlNRG1ZeGU4OVVjZmUr?=
 =?utf-8?B?b3BWU3pOLzRzd3lkbW5VUVVzMGJoaDZyMk5CZDUxTXp2SWdTeG9ycWdlWVZN?=
 =?utf-8?B?WU9oRSt0RHg5d0t2NCtvbmEzOVpHamxqY0NkQlNORWg4SFByVXl5eHF0K2Ew?=
 =?utf-8?B?d1pPOFNMN1lFSjVYdFl3aklUOVQrc0c5VjB0TWZ0dFI5L3FBenhYYmszcnIx?=
 =?utf-8?B?RlBTWGo3NWQ3cTc2MmgvSWtFNmpXa3h2NVJpa3lMaXovUmduL0JKemZHSlgx?=
 =?utf-8?B?QVZJUDIyOGEzWW9Fc09mRm1QSi9EWWd2N1Yrb3l1OUZ6Qm5WaitkamtUSXhC?=
 =?utf-8?B?cnFxT2xFSGJDR1JhOGIwRkpUYi9YMytpcW5CWjc1eGxpMGZyckI1ay8vVkZG?=
 =?utf-8?B?c3QrVDQ5R3hySmgzSlJOQmpueFlPTXpHdXhySmx2cURqN2loc3BJUWlYalhu?=
 =?utf-8?B?a1VtSXJHK01rdCtaVkRvaW5qemZyUDBybzF1LytFSlJDb2FzR2tHd044VWlJ?=
 =?utf-8?B?SzArK1Nic0Z0OURkZnY2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0c1WTdhUmh0ZkRWRlF0U2NLV3RkNFJZcGVmcEVicFFETlhDMFU0eVdpS24w?=
 =?utf-8?B?NjJLNU1vdDFwYzhPcWI0czBzd3ZxNUZQbnRCUU04eWp4QTJVQzdwVWJ2Y0N5?=
 =?utf-8?B?TjhCMCt2MU1uOUk4SmtkeW90bDJBT2ZWdHhKaDliZDMyMjQ4RGpESFdmZW1p?=
 =?utf-8?B?WWl4U1dHZUxyVFN5SU5uSEFSQ1R6MVYvZ2JWUXB1L0NCNmNkNEIzVFl2NWc4?=
 =?utf-8?B?N0REVVU0ZkMwSGg4SU9jNjdzWSs5NVFlZTdKME9TSTk1dGk4VXR3S3hTc2FJ?=
 =?utf-8?B?QTJORkxQdW56MklqMTRuVUNBVHFwdHFwS2FyRVpZT29PaTVPVTBLMTNDb2Jo?=
 =?utf-8?B?eWw4K2JBM1hkTnhnVm52N01ndmFzYXd2TXgvWEt0YWl0OFZJbEtPQ2tvNnJl?=
 =?utf-8?B?U3pUb3RCZjJXTkIxeTd6clpXaG9JY3RqNWxPM3NzMnlHQ3NPNHBYRUZXOTlR?=
 =?utf-8?B?enQ2bng4dmxNcFIrUmRhQUNEM3N0dnMzeWk4bUZQWTI2N2tvakwvUi92UkVk?=
 =?utf-8?B?V3ZkVUhvY1RrS2lLK2ErblIyTjlnQXcvL1FhMHRJMFV3V1M4MlBOTmV0Y1Jw?=
 =?utf-8?B?dyt6WlpiRkh3WlpzVytFWXNrY1Z3TkRNeUNUbm8zdm9PSWVLNmVxVHEzTm5E?=
 =?utf-8?B?RkFNTUpvZ2VxbXNYRDhDYkxGMUdBRCtpZXh5MWtIbER2M1EzTS9pME90eXM4?=
 =?utf-8?B?RFk2b01IMG1oZmhUTjdNSnNNa0FoUlpLTTdIbGdzNjFRcU9NdDAydWZsM0ZQ?=
 =?utf-8?B?MU9QQml5c3U2bWYwdm4zbWFsTllZSFhHUDMvak5SUldGb3BtelRHcU1HTFl0?=
 =?utf-8?B?SWplcWZ0TUtwb1RNR3B1UEd2bDdUakNzVjNGa3Vzemg0ZFVoNEs4aVh4QUFw?=
 =?utf-8?B?Qkp1WHVtWDRHa2dQUVFRWU5CUjdUWEVPVm1kOTdZem9tTXdxbU1NSnVrc2Rr?=
 =?utf-8?B?SG1vN2dEU3Vac3pzM0xMNFhNZ1JubWR5cXU0WDJyTXVwY0lLQlpaVzNaTEZn?=
 =?utf-8?B?SW1NeEMrS1YxN0JYRGxJbmM3TmR4amhmbnlyZXVZd3d0bnNGTlpPMnF5Vmps?=
 =?utf-8?B?S0RVRnRudXhMcDRQdXN0OFRIRGYwTVIxTGRlYis2RzlUQ2U0S2pSU0t0YUhG?=
 =?utf-8?B?OWE5YWRaY0JlMUtvWm9EZUdybVFXMjVUb1E1SXUvVU5UT3g4MTNIdVNlanlW?=
 =?utf-8?B?M3pQaFAzQ2NSVmZCcy9jOTBEWS9Jdko5cThmSDN2TktxZVcwN3RqdzY3WWFk?=
 =?utf-8?B?ZUdZTmR4UTRJNjdka3d5MkFENXBtMjBuWkM5c1Y3Qk9IWDhFTlBhbUxaUXdG?=
 =?utf-8?B?NXdoOTB2S3BiMXRCV0VZcThRNTBMVzc3NTIyWEZMOEovVFVFWnE2SThFbUVO?=
 =?utf-8?B?VlFvN1hPUktQNWo0SjZ2aVZVVm5qZ3ZoMk10RDRxRHppVXc3R1dXYXJrekpO?=
 =?utf-8?B?K3BULyszditzN2V2UDZydk5aMEl4dEdvTnpWOFJxa1JpVnRiQ0t6bjVMTlBP?=
 =?utf-8?B?WURWN1hLdlhSOTRRV1NiWGZVbjRpUFdTV2tXc1R5L2NkV0pLS3pyMUVreEVU?=
 =?utf-8?B?NXdLT1JEWDJLTGJnTzAzY1hDSTZ3N0JvODFLZmdVa2RQaDA5aHhTbUlNc1Q1?=
 =?utf-8?B?ck9JbjNkelpJelNXWkN3RjBqTWFiTStvUDFIclpsb1JKTnRZL0xJdkswYkg5?=
 =?utf-8?B?L1Zwbmo0TTZQSXNyT3FyL1RPN0MzdWhOU3hZOFh2N1grZmEzOHFQK3NsTVJB?=
 =?utf-8?B?ME9kRFFJV2JLRGI2d3QzWDBMZEg4OXNOYU1QSTNzS3R4cDBYRWNjRHJEZFRI?=
 =?utf-8?B?d2FuNloxc3hLZmwrWnRXM1ovSTN1UVp2Y0lJR2ZUL2Vacjd2YnpZaEljajZr?=
 =?utf-8?B?V2hnSGRmcDBEVHdFcmZZWjJhYzRHMVZIRzYvaEdvVW5RZFR0S3IxUDVpVjFo?=
 =?utf-8?B?SXlSME1QQ3hDUFZ2Ymc4Ykt6aGRXcHAvWElxME9JK0IvbkVJSlFrOHZ3WC9o?=
 =?utf-8?B?ekZSaDFUS1dBR0xQN3MzbytLVDNFQWg0emxyNXV6Mm9VM0pLaTQ2TXJPL2Vx?=
 =?utf-8?B?UFFlMFV5WmRBZFg0SWF5L0c1SkhSMUJHRFlxYU5CMkhIR3h2bmxiZWl0UDJN?=
 =?utf-8?B?R20rZjdEWk9wQlJ0NHJVN21WTmlhVmVsS2dwM29aMkV6am5yZkJ3bEYrTHBr?=
 =?utf-8?Q?pVzjReIwcFtpu/Jzz+0qOww=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c0644-780c-49d8-298b-08dcd23580d3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:44:01.7501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDQakguI6pU5ZqeBXzsQn/SRkRsaEtf4acfoPAsCgD8ZJEIixRgHannAYVqRnDpMVwthHxEcsiiRKJ1Ozwi3DAH0oMZyrzQ60B/7vFNTbN/oM2JJP+n+c0khrSxg/hCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
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

Hi Karthik,

Can we add an enum something like below , which can be re used at other 
places.

enum joiner_mode {
	JOINED_PIPES_NONE,
	JOINED_PIPES_1,
	JOINED_PIPES_2,
	JOINED_PIPES_3,
	JOINED_PIPES_4,
	JOINED_PIPES_MAX
};

bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector 
*connector, int joined_pipes)
{
	const char *value;
	drmModeConnector *temp;

	switch (joined_pipes) {
	case 0:  -- > case JOINED_PIPES_NONE
		value = "0";
		break;

On 11-09-2024 12:52, Karthik B S wrote:
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, 2);

 >> status = kmstest_force_connector_joiner(data->drm_fd, 
output->config.connector, JOINED_PIPES_2);
