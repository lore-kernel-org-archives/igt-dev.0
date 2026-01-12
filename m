Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3591BD25044
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B3410E2F9;
	Mon, 12 Jan 2026 08:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOFNCwdV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3171610E0C3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768205390; x=1799741390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iuEf2e6nGds2PRe2LKMn+V1ITyvhButrK2BmqqznYyw=;
 b=EOFNCwdV2YYzeyORJY5YhW52ABFfOTS+FK5qoFqWqwiSMj37vSn2q2xF
 6ydaooOiODycFYVEDtsZOTIgPf2wj09oIUR0X/zEore9815LwNckgQ6pf
 5t9EeKGAhnOYq2YVVrMAHAUIBopDPU7Er7iHfJrxaYyOQ3z07DTRm7tqM
 P6RFJZP2Js/xXij5e/MLOLn0b00zd0+DzKCtSQn/86LW6VvKoU9UgaUSs
 tS4umMAbZP4UIXd8v5/XR8tBCmw2QFO5+KyybcloqmUYYXQAOk4H+aKAv
 tnQE3qJUvdDawyvDZqbMciXgY65Wa0dtO3RtUbFKwsQNS5B2I3GklfHrT A==;
X-CSE-ConnectionGUID: 7rnBKIyUQ428FahaHkbfGA==
X-CSE-MsgGUID: wt4PfP4UQPO133tiu1MZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69210678"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69210678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:09:49 -0800
X-CSE-ConnectionGUID: 8FvJGcUAT1iJg6CIRoFalA==
X-CSE-MsgGUID: 7qEwqs5QTnWl7B5hltZckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204046546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:09:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:09:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:09:48 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTfs5pwl30SylVSLi3Dc1c9yABtPeXlLbRlsKpvYUbxTwcRfvurzkNF9r6mxqsin33/4kYUZh3hQYyRpleqN9o3EsLCDXc8Y2eAsBEnO0B2H0Q8dn4H/4i1HliW0NY8vZ7WuqHiWe+3+ktB3obt9Wp/dnrWLfwXSw3vgKgFLgLm1T150DAbY8nm1qj4jP53nKer1QHcxfxWFGnAEl1cP/89495NfHYM4BatV8G/sayqxRGrsUvyHYrUSYotzJb7mAm6gthkH2nel6yAkYsIAKTDHNN67D99W5UNqENtmyLt1Giezka7jsWvCPNCsaF9VVlvmqGC8RK+olHg9ZPRvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3Y9ZD7QndQYIpLxNf23avI/4v7XT5bb+egF5QO+48I=;
 b=oqfjVPFOeUzMQ5G+IE/M6YiQzl7Pfo4MKn+rzkjDLjiGQnwJa49aBezwp+UthxhrJHVLufzzjSabIqpTERjT0FKf5SKf40RBNSiary8xGsP329rS0pX2Tarn50jWtAo8+FOXcwFnWdhx5ygJzbZlQDyQnLk8Kh5dbCYKJvGKz5TSafHMhPQ3gru/jwKPJQp5osnuHECRzFLQNfNUsQnRJCY6j6PPMiNSRWq2zDpdUdNV8ZrZ1WP90mds7/C7ji+8bQ+wXRA97RQQKfB0elJxijv8Vj83PRZoj9SNWyaGsUZ2JUHbWwwvxdhDCUAMUi8YWckdr5Q4oVs70/UFtdQQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:09:46 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:09:46 +0000
Message-ID: <51756045-02c9-41dc-aa01-d48218364884@intel.com>
Date: Mon, 12 Jan 2026 13:39:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 3/7] tests/kms_plane: add test and limitations
 for odd height planar tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-4-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260107093535.70116-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4ec852-ddb8-4859-cb74-08de51b1f2df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVhBQkFobWhYSWh4WVEzbGtWeWtib1A2cXlreVhlNXF0aTNMc1g3cU9tUzhz?=
 =?utf-8?B?ZWc4bmdBeWtYSnp3dnJpdjFKa2JiWnhxOVRYczIzdGFvTmg4ci9uMEtEd2Vn?=
 =?utf-8?B?eE5FbjhWaFluUVJ6MEpidmFseDlJS0lNNlpQRnFHeW04c0JuSW15ZGRPRWgv?=
 =?utf-8?B?ZWNSZWVIeWhMT21mOTVzRUVmelpCcC9xRFNlRXRzMWRtWUZpUWYrMFF0RUl1?=
 =?utf-8?B?OEhJc24vWmVQZ0R5blFheHlRL1cvN0ZJdlhjY1o4RDEvZkNUcWMyYXVZNDM2?=
 =?utf-8?B?SWdRb0lvcXJ2SmdYUzRub3hJaHhmY0x3TkJyNitoZDJSWjg5ampIVkl3Y3RU?=
 =?utf-8?B?VXB2WUEwTU9UcnZydThxMDdiZU9mRzduTGMrSVRWeDZiQ3kwWnp1MWRaM0FE?=
 =?utf-8?B?ckxNQWN2Y2VpSWhlT25Rc0VsWG1GalhYQWpSRkhiemFETmZHQkZzUDhsVUFR?=
 =?utf-8?B?ZnV1VkNXeE5BcmRRWjFDVG5kdysrQUgvOFgyTU5iUHIzQTJ2U1E3OHViZm5X?=
 =?utf-8?B?Y3p4L1AyOGNSRTVlRjdhNTVPb2h5TUtUSzduSlhLYlU1MEMybFV2Z1JBQ0o5?=
 =?utf-8?B?MUtVdDFOS3N6czhkOTA3VXljQlpjVnJxbWpJVzJYUzYvRENhU3d5K0NoMXJ1?=
 =?utf-8?B?RVh2eEtmR0d2WGlFZWMxMCt6Ulc5V3lncEUyK3JyVS9hZlY2R1BrR3l0dVAx?=
 =?utf-8?B?ekJGQkZVSFFNMG1tQXJXaTJCdHR6MjhvRzFIVXlqeGVmYkxLSngzRjQ0NjAr?=
 =?utf-8?B?NDJsWFdtK0lMcXlSaTN5K1RnNWFmU1RKQmhmVW5xc0lMaG1DMGhjczVpeGdX?=
 =?utf-8?B?U2hxWVdGUHJqenBxT3lMbHYvV05rcThyWVJ0Wi9RdVJOM3Q3L0Z2cHZ0RDI1?=
 =?utf-8?B?bUw5YWdlcVF1VnNwM0N5SjVsTlFZM1RjYk45eWprOEZBUVZLZk5jd2QvUmtt?=
 =?utf-8?B?em51WVNXN2tWbjJJcjUrb1pnMk9BUXpLcFNhakI1ci9Fck9Ucm9wQjNTUnZ4?=
 =?utf-8?B?Q20zZUYybTQ5c0V3WTNjN1l1UWxOZUVZWnc5cTczZlNVVEdFQkdxcDYxYmZZ?=
 =?utf-8?B?VDZON003RW1VaVpabm56Ti9TZVJ4Vlc0VE1naTRBc255UTlwTGczb0VBWEY4?=
 =?utf-8?B?dmR2bkdrSnFHeUhzbW43ZHl5U2Q1TkE2MWtOM1BESFpzeEluWVBWQlJWRGJj?=
 =?utf-8?B?VU5uc1dKYkxnU1JDdGFmSVJ2YXpkL1BqNS9Wc1NYdDFlTjdXTE5ndnoxajdh?=
 =?utf-8?B?S3E1bXBYTWdiYzVxZzRoZHZGZFhlbHU1SVp0aFRhc0I0K21wZTJQSXNUbWgw?=
 =?utf-8?B?aEpid3kzcWpYOEV5ZlFoVW5iMXVmUU11dk5qN1M0S1JyYi9nWDBpL1QySFlP?=
 =?utf-8?B?NW9NNFl4dmQ0VjdENW45V2U1NWxyWU43QjRzb1Vhc1ZxTFZ0NGhFYnJ2Rzhq?=
 =?utf-8?B?VHp0eTdGSHB2V1hHN3hFcFQ1MDQ5VEZ5Vk11L3FLRG56ZHpOM0ZqQUs1NlQ0?=
 =?utf-8?B?MXlLQmROcG5rOCtXT2tIVFkyUXVQSVdReDV5NjVBQU9LeDlGRk4wMThtdzY4?=
 =?utf-8?B?VlFvYVdQV3I0RnFjL09iZ05rYTRDY0VITUZacVFKRUNqbXBodW9TRlV5OEhM?=
 =?utf-8?B?QlZkdEVibDBHK2ZKS0dCcUNLY0xZZTBjUm1SUmZ2KzY5SFJnMEtiUEJBQ05C?=
 =?utf-8?B?Q0tkMjZBcUJXK0VxUWtSaVh3aUFNY0lEdG9tdlFBRzhUemxrVmY0ZmNucTZj?=
 =?utf-8?B?dDFMQk9UZnB3YWNiQ3JSWlR3dG96a0lpMmZoV1hnTkJoejVHWkUzVDJFVEZJ?=
 =?utf-8?B?dmMrQlJQaGdKUXozdlVCQmIyNDFlT2d2VXJYWVU4Y1lNd2NBZFVNQ3F5cUZu?=
 =?utf-8?B?ak1LdzJhRTVsRURkQ05lMXJYVmJxT1ZDY2lmV2VUczZaejgrNGtEemhMMFla?=
 =?utf-8?Q?2R+g/hiWUpZ0qKaGEypVSpxBLz81e+nW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2w5VDk1TkhjaW51cFN1SjZqM2wzd3dOM29qbTkwVkdHR1RjclRtNUZzWmNn?=
 =?utf-8?B?RllFQ2J6WllzQXdOem85MG9VSjFFdXJhMkRDUUVVSm8wckxHQnlPUUhpYzJp?=
 =?utf-8?B?Y2xacTZ1bUJSTE5lODdLcXpWTndVMjdNTzNrL0JqRGxYU1pqaWhYNHA3cDJo?=
 =?utf-8?B?c0dKNWFHMTNxVEF1RGloS0J5Zno0MncwNWhDL2NCdVlpam1ZNW1GcHk3S1g0?=
 =?utf-8?B?ZWFvejk1bys4dS9uSnNCamlzK0R5eTljZjlibnNxcGtEWkkwUFlCR1M1VVBv?=
 =?utf-8?B?VktqajVRNE90YTdxUE05cTRZZXF0cnlTbm11NHphQ2VaREltUVZ2eE1tZW52?=
 =?utf-8?B?NzM4bHNCVnJxbU1PMDFTSlpUSHdYc0liZU11b2RscXZ6THhzZHNYSmpzMXh2?=
 =?utf-8?B?bGtyZkdCVldocXQyWU5UTllBaHNVYlh6V2o1NGFPbk5wUW51OVRoMTdRUWQr?=
 =?utf-8?B?UXFFK1cwREJMZnBPSnh6OHlJendFR3dXWmxaN2xLZkRyUjBmcEMwaUtoV2ta?=
 =?utf-8?B?UjQ0dlpKMXk2MEZmUGJMN1Y0VFpsMzlwZnVOd0xxTTA4TFJPSEZ0MHNJWVRS?=
 =?utf-8?B?eFI1STlHL2lFN1hOWlh2TWhFa095TThuWU5wNHlpekFEa1o5QWNkSE1DWlZk?=
 =?utf-8?B?eERNQm9SSHVYZ2piRGRrYjZqSENqdzVrbHFxYk5kUklDNDVLN1JzMzJYTi9n?=
 =?utf-8?B?K1hRbWM1akVTL0RDZlFzSXlxeHVoRjA1SVdTR1BKQ21DdHVxRGtOVWkxU1p4?=
 =?utf-8?B?cGI1aUladEIrdVN3V2ZUWTM2dk1XMjI4QW41a2x4elV1dml2UDJpd0ZGUGhQ?=
 =?utf-8?B?TkI2dEowWnFsQTNDdGFacGpNcUllaXZGRGNHT0RibnNScEIvL2ZhTXlqN3Zs?=
 =?utf-8?B?WGFhYXhhL1dyMFkrVFdldGhWOS9Ddk8rOVEzNU9OSk03dlJDVWRSZ292eXpE?=
 =?utf-8?B?UmFVV3VlSi9nUi80S0F3VzZxMGRvakNQRmVrQmxhRHRZTnFQcTRSN29KczZT?=
 =?utf-8?B?Z3NlcGZPSVdtTXd1c1BiY0pPVFBmcHdiVTVZNmNUM1VSNFNiMXFuUUFTYk1Y?=
 =?utf-8?B?eFRtNUh3WmhnV3Uyb3pGNytsUmFSdENVMkMvUU1GRVBCbEFrNlo5Tkp1QlBW?=
 =?utf-8?B?dEtrWEJsR2dPcTFKQWsxLzhzU0daVHRndUFDTkM1WXZ0eG1FTjZrTW1tYjZU?=
 =?utf-8?B?eXNaMkJneS9USkVZOUFkQzJLOE9tUThQS1A0K3JKWkEvWlo3bmJOSjhlSHlx?=
 =?utf-8?B?dEhBNWdqUGpSQ3lzMS8xaDJobk1uWEtacEpWRFFkbjBjUTdVUzgvSmhsRmo5?=
 =?utf-8?B?a2lrNHM4d0oxK2NTaUwrenlYSXYxKzJYQzE0SjJpTnJ2aElPZWNubDY4OVNi?=
 =?utf-8?B?ZEdzeXNlTVBuUFo0L05VMXcyYUlmVmhrSHUrdTdOWThtVjNLRVBub1JrWmV4?=
 =?utf-8?B?em5wRnNJWkRKYW4wN2gvVHlzdVVqTEd4UUVZM1FLY1lvZHBBbEx1aXUwWG5m?=
 =?utf-8?B?M0hHNE1IRXFwaGVYZUtveWU2QklVTzhCSHFsd1pCanJmNXBQekwvcng0Z2Zs?=
 =?utf-8?B?ZjZPcUNRMmJGTmVVRzIwZTczaTJ2VndxcUFtYzYwTWJVYmtBcmV0YVF2YUl3?=
 =?utf-8?B?VnBpaWxjL2NsN0huSkp1YnVqclR6U2t1VWxBenhSWVpYVmlBanlGZkJlY0Ja?=
 =?utf-8?B?aEkxYUZLWm0wc0plcUF6QzUwVXhIUWU5bEZUK2FWaW83NEtxNWhXVDdXVE5Q?=
 =?utf-8?B?Y1hoWnYrM0VJV0prb2NjaEMyK2NQVkhmbTRsUCsrcXZ3M0ZjQUJWdTByeWVp?=
 =?utf-8?B?c3I0ZExFcmhHV0pvbGd5Y1lHb0VjTDBRV0F1S3ZjdFI0eVNaUmovcTBoZ2lE?=
 =?utf-8?B?QUw4VFQ3NDlpcFFjTEVDeVdVY0F5d1RoM0JuR0NTZitTN2dqWFZ4M0NORTl1?=
 =?utf-8?B?UTRCRytJSGVNVVcrTFdOeldzT3g4dC9DSTgzUWJjaVBiUXZBYWRQbWdvSDZG?=
 =?utf-8?B?RkVYUjVQMFRkOEJ6dFlCWEJKdDEwYlJRZVczU0J4dTRvWkROcjIyYXhSaWhn?=
 =?utf-8?B?QTVDTnZGdjJVZ05MTVhrdStiSUFiUHdzZmwwWlQvd25FcXpOOXJhaXBQOGpu?=
 =?utf-8?B?NFQ1ZHh1WjR6R1hXeG9QNnVFSDdjcVYxbHJZOGlvN3h6Um1PMHlUUjNnODM4?=
 =?utf-8?B?VjgvQkhTQVYwWVdDU3R0aUdjdVZvSkdjNDBhaDY5SlpNQjJMcGJrMU9vNjlq?=
 =?utf-8?B?OFI3amJWVit6ZE1hUHZOSmpWaWpacXZnaGZOdlpsaWJNOWlRM1FWNWtaZngr?=
 =?utf-8?B?TjNKOG8yZG80cFVSWXZuY3V6YW5LYWkvRDdqeXlZTDgyNDAvdTdOQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4ec852-ddb8-4859-cb74-08de51b1f2df
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:09:46.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnYgxkaRUTkKVu5NSEV4TuVfGyPy+KJQBHzxHBoNHlfxEONWckuGkOMGy4mDTUIppE/xprfFRqyV+NR6J2yvWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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


On 1/7/2026 3:05 PM, Swati Sharma wrote:
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>
> With NVL need to disable odd height and odd src y for semiplanar
> yuv formats. With older devices check with crc odd src y didn't
> break framebuffer on screen.
>
> Bspec: 68903
>
> v2: -initialize display_ver (JP)
>      -rebase
>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane.c | 71 +++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 66 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 2c083f4b7..cbc006d7e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1245,9 +1245,11 @@ static void test_planar_settings(data_t *data)
>   {
>   	enum pipe pipe = PIPE_A;
>   	igt_output_t *output;
> -	igt_fb_t fb;
> +	igt_fb_t fb, fb_ref;
>   	igt_plane_t *primary;
> +	igt_crc_t crc, crc_ref;
>   	int devid;
> +	int display_ver = -1;
>   	int rval;
>   
>   	/*
> @@ -1259,6 +1261,8 @@ static void test_planar_settings(data_t *data)
>   		igt_require_intel(data->drm_fd);
>   		devid = intel_get_drm_devid(data->drm_fd);
>   		igt_require(intel_display_ver(devid) >= 9);
> +		display_ver = intel_display_ver(devid);
> +		igt_require(display_ver >= 9);
>   	}
>   
>   	output = igt_get_single_output_for_pipe(&data->display, pipe);
> @@ -1276,14 +1280,15 @@ static void test_planar_settings(data_t *data)
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (intel_display_ver(devid) >= 20)
> +		if (display_ver >= 20)
>   			expected_rval = 0;
>   
>   		igt_create_fb(data->drm_fd, 257, 256,
>   			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>   		igt_plane_set_fb(primary, &fb);
>   		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +						     DRM_MODE_ATOMIC_TEST_ONLY,
>   						     NULL);
>   		igt_remove_fb(data->drm_fd, &fb);
>   		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
> @@ -1296,14 +1301,15 @@ static void test_planar_settings(data_t *data)
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> -		if (intel_display_ver(devid) >= 20)
> +		if (display_ver >= 20 && display_ver < 35)
>   			expected_rval = 0;
>   
>   		igt_create_fb(data->drm_fd, 256, 257,
>   			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>   		igt_plane_set_fb(primary, &fb);
>   		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +						     DRM_MODE_ATOMIC_TEST_ONLY,
>   						     NULL);
>   		igt_remove_fb(data->drm_fd, &fb);
>   		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
> @@ -1329,6 +1335,61 @@ static void test_planar_settings(data_t *data)
>   	} else {
>   		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>   	}
> +
> +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> +					    DRM_FORMAT_MOD_LINEAR)) {
> +		int expected_rval = -EINVAL;
> +
> +		if (display_ver >= 20 && display_ver < 35)
> +			expected_rval = 0;
> +
> +		igt_create_color_fb(data->drm_fd, 256, 260,
> +			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> +			      0.0, 0.0, 1.0,
> +			      &fb);
> +
> +		igt_plane_set_fb(primary, &fb);
> +		igt_plane_set_position(primary, 1, 1);
> +		igt_plane_set_size(primary, 256, 256);
> +
> +		/* set odd v pan and check with crc fb didn't break */
> +		igt_fb_set_position(&fb, primary, 0, 3);
> +		igt_fb_set_size(&fb, primary, 256, 256);
> +		rval = igt_display_try_commit_atomic(&data->display,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     NULL);
> +		if (rval == 0) {
> +			set_legacy_lut(data, pipe, LUT_MASK);
> +			igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
> +			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> +						IGT_PIPE_CRC_SOURCE_AUTO);
> +			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +			igt_create_color_fb(data->drm_fd, 256, 256,
> +				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				0.0, 0.0, 1.0,
> +				&fb_ref);
> +
> +			igt_plane_set_fb(primary, &fb_ref);
> +			rval = igt_display_try_commit_atomic(&data->display,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     NULL);
> +
> +			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +			set_legacy_lut(data, pipe, 0xffff);
> +
> +			igt_pipe_crc_free(data->pipe_crc);
> +			data->pipe_crc = NULL;
> +
> +			igt_remove_fb(data->drm_fd, &fb_ref);
> +			igt_assert_crc_equal(&crc_ref, &crc);
> +		}
> +
> +		igt_remove_fb(data->drm_fd, &fb);
> +		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
> +	} else {
> +		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
> +	}
>   }
>   
>   static bool is_pipe_limit_reached(int count)
