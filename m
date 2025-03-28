Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA87CC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 05:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA0C10E10E;
	Fri, 28 Mar 2025 05:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjAH2AUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C110E10E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 05:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743138262; x=1774674262;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aVST25AqTwT6t6FGOSF6fxt7nLmhsIXjl05W1u9IuN4=;
 b=FjAH2AUOSyuv8iU6/KC1ntSuv2Uq3lZ5EFwI2fyYOck7mDEC8He633F+
 00qdAaf3EZbP0Cw9BbycxnPKBLgi07TU45BFsPw9JzVFqSgxGsr+O1WGu
 YG7og7lcckX8toUwZbPoS1PAsLR48oBz0f2v1aYqpAz2danVRyCZY01iI
 EowZvbOGTxcXM4gLZRDCUGkmKZcDZkDYaErAjsCq4zX446gO7rIc/AevR
 dCkqP+QZRLaURuyOsWvl/YiioPjxHq0vU3TKlVzLngn8CRZTTfagiv2lo
 tLCVRBpRmaPCp22coDtbCydggSCstnIfEKVWn5WDSjpBaaskDb3qiVK/0 w==;
X-CSE-ConnectionGUID: hmwN5+eSTC6x4W6kg5E4CQ==
X-CSE-MsgGUID: Jk7iD9r4T2WsCwDkFSPf2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47227420"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="47227420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:04:17 -0700
X-CSE-ConnectionGUID: YxRyLXgiSem1IhsyynNtfw==
X-CSE-MsgGUID: AzBlo6YPRCaF6gWEI/3Jvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130058027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 22:04:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 22:04:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 22:04:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 22:04:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blhG3i8GUdJgt/MhASv1wLz/R5CraZ9yq0Bd+D5letS/nazgiYAzHjuNOQFgSeu6Ky+2qrI8YLymJa10G2fERy3FaUxQyxqoC60Zsq9T7O6fKe43/9Ai8AoJTszngPfTlVKP2FdKRGs0gpKahsek0XzO78yRtMW4n1+DmErXQV7Cu/uUNsWI/CtQmsTR1oz1wyCIZQUmVDRkpFGCMfn/rOyii98U/kVBTX5ZG+qWpaDEo5MiNs6LrHeobzyslxrsEuXubBBZQMXLz/U2bPhBn1HK2b15FAhQ4izNZZZEAF45ptjEkspV7SpiAFsv7PAwFcR69mJ2rXOqhnJccqeMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVOZnBiuVw9VBylSBO9/XGqhOurSsbP+uWhs9epEMTk=;
 b=buMTatvQxqGflFRDjRcSWN2tjBFoslkmirraDHDA6kEMhGOsCMnPubkn02OLVC1l06TTcWRKe5/BHuCADgYsIgpdz12x/16Dae8cmqi6mkjn5qMrjEGDrXPxmQPyFx5S4bYXXSWhiGXrtGkETKkhhM+q2B/Prd+FcXk6nAMJ0JdRggyQu/RiOKxxXskZfDQyfH26NMKRQPkKwrPfbWEPdI9SMjUsSjtsBxb0Y0jAbkW3ufTFK/SfeshvPZFq2uzj89F5BL4dtMVIbqDEp/pL0KZ/X54Km6aIdy9G3g3mfqXGKSJNrn5W95fa1kErlh9etezqc2U907V2lHILuHsPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 05:03:33 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 05:03:32 +0000
Message-ID: <04c40f3f-6155-4ce0-96cf-950ad7d34b9d@intel.com>
Date: Fri, 28 Mar 2025 10:33:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Use separate
 functions
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
References: <20250325135114.747316-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250325135114.747316-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: beb0433d-1a40-462a-f873-08dd6db5e2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDFUNnh4bFU3eEg0bTBSQTZ1bEgzcHAydGt4UHllZXQ1WFRrY0pjdVZtYWRR?=
 =?utf-8?B?MFNFZlh2eUdxeE0za1hCY3R0WEZHQUJqUG5rY1VtMnAvRUFHUWhhc1MvUi9W?=
 =?utf-8?B?RlJkVEt6V2dBY3RVcE1IdVRRbTc2bnNTVmZpbnI1MmtsRjNHN0pxUFJ6Y0J4?=
 =?utf-8?B?MDdZdEk2Znh0V3MyOXQ4eFhsWFI0UW1vS3NhbUE4aGVxVGY5bE5ERGVmTUZv?=
 =?utf-8?B?YVhTM2VvL1dmL0M5R0N0S2JKWkhUQnNuKzRNMmVVWnNjZXFOZWdCUDA1Q0pF?=
 =?utf-8?B?bk1RL2VvdTdldVdiRVpQSUVFT3RKZmtaZjZ3ZWkxaGhhWDhnVXA3TnlZQWZ3?=
 =?utf-8?B?WmVtUS9zekVXMVk3Sm1NY3A3eFRLRk5ITjN5aGJOeHdCUWZCcm5jL2hUQUs3?=
 =?utf-8?B?d1NsOVpIcmE1WVNCTFZXaTZyMUdlbVFoMjVIYWI4SXpIZUFmaThjM2FuVHZj?=
 =?utf-8?B?TEw2SHU1K2hUTXRBNW1JOEJXa09XSzg0YU95dTRBSksrT1AwZzhjNWlUSjNs?=
 =?utf-8?B?ajZKeTVPT2YyRlJKK0RVV1FpZUdPQVNYNzcvYnd1cDFma28zaXJvNDRLOStQ?=
 =?utf-8?B?dnBvcmlhVXJaMGgzeENBS3U2RTBvbXZDYnA0ZXNkRlp4TEYxWGRzUzk2LytW?=
 =?utf-8?B?Q1AxZEpnME9JZk94SThVUW0reHcyTUg5VUVxT1Jsd2FTYUhwRkNDb0s3RDFp?=
 =?utf-8?B?MzJkMHRPVzd1c21STjBEMFJ5MVBabDdxc1FaQVZ3b1Q3MDVrcWQwQVo5am1W?=
 =?utf-8?B?TEx4bHVPWUZHeDRFNnFtdnc0eUhWdFdseG9Nc21rY1JqRUl4TEV3M1lsSE4y?=
 =?utf-8?B?NUl4cDJYeks5Z0t4Y2ZqcnhMSjNyQ3JxbXl0YnQwWkcrRlE3VDFROHp2LzFY?=
 =?utf-8?B?RmxaT3doL2l4S29KWk1sWDhBenQ0RTI3aWo5Rm5rUDFJa1FSOXZUUXMrUi9z?=
 =?utf-8?B?WXlhSENMd1dWUUpxa2gzaURnQ1BDcms1SGM2YVhLbkN6RmpsRGlxMWlRVG5m?=
 =?utf-8?B?TERQeGdWdWRKMHFiT2lZSmtMRUNCZlRPLzJyYTFaTGRrQ05HTzUyZXg0eFdm?=
 =?utf-8?B?aW1jRkpkRThVMGFGZVYzQUNYSHNXNFp4WCsraVo3N2FFOHRhVWdSdnlMZ3FQ?=
 =?utf-8?B?M2tiU3NqVG56bXFFcHpINGJBNEhCbVdWTWo3eDJrT2IxK25LeHdKdG12eU5P?=
 =?utf-8?B?K3F6SzNJcWdvWFZvSUR5RmlQNVFLNFJJRytFUi81aWEwTW9CeUl0SVNHbno0?=
 =?utf-8?B?ZEN1UFV6aDdxL2JkQWhnVWFRWlF3OWo3cEMyNENnNVpIeWRjdjFobXoxTUpG?=
 =?utf-8?B?eVJmd0gzNzhPa050ellLUnhzTi91cmc3a1MybG9aSTdGMU9CMjM2NTduMy9w?=
 =?utf-8?B?WTJFYitCTHU5cFpnaCsyQXYwTGp4ZVl1YjhZZjBjeVNwbkNTT3FiaWcyYVEx?=
 =?utf-8?B?cXJNNjJZTnR4Z0RKUDVkY2tHQ0xvOFZncUQ4UjQ4U2xhc0tGeCtWMXN3bm5o?=
 =?utf-8?B?enUwbHNkbkI3R0ZscGNNcUpWM3lJcktyNFE3TFZDcVN5Zmx1eEZjZGZPbi92?=
 =?utf-8?B?UUhraTlMcWJxZUxOMnd1L0JmNHpHWk5DN0dXaGZOT0pjSklvcUo3a21SS2pU?=
 =?utf-8?B?TDM3b29JTnBvVzJ6cGczNzU1SmVQbXpCd0lUYzBhajBWa3lEbmxnZjBKbjFY?=
 =?utf-8?B?am94ZWRzZjQ0K21KbitLcDVYSS81Z2ZySEg0a0U3aHpTWW9USXJTQ3FFMGp4?=
 =?utf-8?B?dnFtNnFHdVBXUGI4OTFxNnU0WkZFSkpaSEZ6MnAveGlSdFBzNThSMTlkb0ZU?=
 =?utf-8?B?L1B2TVlrUExFMkE2RUw5YUsrcEd0U0Ewa0JkdnV6UXh2eEtxWlRvVHZBZGd2?=
 =?utf-8?Q?u+WYNhiaLtxbL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3lWTVh5TUNIQjB4QVYxREdTSDhWNnFUc2RHUTJKekQ1ZG9RVmhpcGFSVU1D?=
 =?utf-8?B?dEhJTk9TYThLOVp5SXhHU0xqbGJidWhMWXlKMUZML09XdjdJc2kzdW1jcEpl?=
 =?utf-8?B?WWdQYm9SUWtxODNPdEZLd3UrT2NZeE5pMERSTVREUWJvK1VWSGoxeEpzN2cr?=
 =?utf-8?B?aTh2azlZbkpjNk92cVkrcDVYZ2h4b0FJMXNjK2dkRDJwNXlCeWlPN0wxbXh0?=
 =?utf-8?B?Tm1GRTZQUnFKV05SRCtZNUE4MVVYb1FwRVNtUGQrNXV2ZktHcmp5Znk4QWJU?=
 =?utf-8?B?ODZ3TUFOQzVaZVlrV2RjQWVIbjVtUEl1b2dUb2VCQUhDM2I4UDIxWnA1OGp5?=
 =?utf-8?B?MjlqN05rcTNBNzhaQ09aelBhUHRQeHdRYllMOTgrUndWYVkvNVk0QUFHUTY5?=
 =?utf-8?B?b2NhWjltSW1saUkwcUxqd0VkNVlKUmdVWWdWRXVKYTgxNnU1Q3RKM281YkVH?=
 =?utf-8?B?U3lvY09BS1ZTeGhlKzdJVkhJV25hc21FM2RITmw5d2dWVXBwMGFBUzVjN0hm?=
 =?utf-8?B?OTBkN1liMHZKUXQrWVhZYVZOY3czaEcweGphVTNjeFgwQ1JlbW1MSThOalVp?=
 =?utf-8?B?eFhLODE2M25TbzVWMW1ZayszbE5OOE9rWGdkRmx3WDAva0tLVGZKd0xoSmh6?=
 =?utf-8?B?NWIvTUhlMnlFWThhTG5RSi8ybmJsZUpSQVhoaGlXeDgwQjRhSG9DcVNBSkx0?=
 =?utf-8?B?K3RWOFBJWXdweTNtV0pQL0pPUjFDTHJTTEl6eFdrWlVDdHBPTnJiK1dDM25Y?=
 =?utf-8?B?blk4cVVOSlNqQThzc3JaR2R0TkVRdlg0Ty9WUWJ6QXJXUTZreXVTUmhXMzBT?=
 =?utf-8?B?R0xreUpSV25RcFY4TmZMekhrZGJ2SElFdCtUVDJkcVVWbDQ3Sy9laTZneUhp?=
 =?utf-8?B?eXU3MUl4VDQrVVVyN2d5L2d5czlheG5lNU4zWFpveHhtSjNNT3JNWWR2Zi9H?=
 =?utf-8?B?UDBBdUllTVBHMSsvT2dzREQ3YUxNMHN6Z3YycGE2QkRvS2YzTkZRNXRDdUlX?=
 =?utf-8?B?SnBYakk2azVhcmNHQ0piSDNiV0taNzN0OXllTkM2N3NieXAwcGRhUGxBRUY5?=
 =?utf-8?B?cUJwTHdQMVAyK0RyYXgwdkxUemhRaGprM3JVVXNWOWxvWjFKd3FhYWR1ckZ2?=
 =?utf-8?B?cWZ6MUt5U0VRV08wd1VCRS80V1kyVFh1OXF3cTJxdjV4SDhNMERnMWtTdFJU?=
 =?utf-8?B?NUxtMDFLWTdMQUhERFFkcTQ5R1F5MWxUcVdKYUdMR1YwY3cvMzcyRUJhN0pw?=
 =?utf-8?B?WW4zSEZaVUlzTEJzdFNCblNJQ2FpYWdCSGlPRDNIWDNrNzNZQjl6NHphMnpR?=
 =?utf-8?B?ZWhaM1RUcGZWRTNDOEhROEw4bURxU2hVTlRvUDZSaGx4UnljOFpSRm1aVVQ1?=
 =?utf-8?B?eFpYTXdaR09oRzlRSXptNk1pVmo1dTV3dWFqRWlVUWR6RGtSZCtEa1c3aUc1?=
 =?utf-8?B?cHRoSzhpYjlGU1FLbWFGMjV6ZXk5QWdjT3VGdk9EU1RhZFdaNlVDd1Nyd3lv?=
 =?utf-8?B?STB1Y0loV0dzczhPVkpUbFpIeDYwOXhkNzhibGl5M0crbjVGRVV0ZXdSZUIz?=
 =?utf-8?B?L0JHdkRJb3RlSWpLd3NPVzVKRXBKVVR0VWV5YWJQbnZHTW45YmZ6VU4vVkFL?=
 =?utf-8?B?QkR4UEkrZ25qV2JnSTlwT1F1Z3dGY0gxTVVKaTk5SHBKVXBmR2tsc3cwOUVp?=
 =?utf-8?B?YTl4bkRQK1pQNXB6UytZbnpVVTF3RXlUOG5POW1yVk5weWx4YUU1SGtmVzhG?=
 =?utf-8?B?amsyQytwYzJEYUFLbllET0dHZ3VCRFJJZHYvUHdQSGZkeS81ZEl5am1VSUYw?=
 =?utf-8?B?UEQ0RGpXdFdJT1NYZVFtSW4vclE1dCtkUng5bVhVYXlPaUVHY2NqaXdjQmF6?=
 =?utf-8?B?cG1sTlZOSy9vWXZzNkYwY3c4L0Vyd1ZyMXh0SlJPSWJhY0RLVGtWZVc4Tkpi?=
 =?utf-8?B?NWp6bnZDZ3NzS0xZWWp4NmExR1c5Z3NraUpwWmhnVGNKYjVaU0RMRVlreXh4?=
 =?utf-8?B?RVg4ajdzMDMxaFQ2ZUt1RWZLY216UktjelRuZjFjOStPNFltYm9PQ1lkam5Y?=
 =?utf-8?B?U3FFMXFqM2p1Z0RhU3Ruc1c1S1JyTlJ3aXkrZWRTTzF0WmIvMklUSW5oamZY?=
 =?utf-8?B?NzRHbVBsbDQyT05iV1BpNENJYTNGK0JQd2U1VTRLZHRKUjk1QnFWYmdHdDFu?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0433d-1a40-462a-f873-08dd6db5e2ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 05:03:32.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DO/+18cZjiO1gRIf5oDWE3jKKuouiGxEwylDoroBff1hTcSQes1nMCzd1+UzzEagncDOTmxNGVnA9fBqGACA/ToCRWGKrH+9ukvGIjgxc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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

On 25-03-2025 19:21, Lucas De Marchi wrote:
> Do not mux everything in a _do() function, but rather use
> _add()/_remove()/_clear() functions for clarity and brevity.
> 
> The add()/remove() boilerplate is small enough to just be repeated. For
> clear(), just implement it using add().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

There is a new fault injection test added recently, 
oa-add-config-fail-*. So, this patch just needs a rebase and the same 
change applied to the new test.

Other than that, looks good.

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   tests/intel/xe_fault_injection.c | 55 +++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 1bd0f51a3..dcbe0e406 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -26,11 +26,6 @@
>   #define BO_ADDR		0x1a0000
>   #define BO_SIZE		(1024*1024)
>   
> -enum injection_list_action {
> -	INJECTION_LIST_ADD,
> -	INJECTION_LIST_REMOVE,
> -};
> -
>   static int fail_function_open(void)
>   {
>   	int debugfs_fail_function_dir_fd;
> @@ -96,27 +91,36 @@ static bool fail_function_injection_enabled(void)
>   	return true;
>   }
>   
> -static void injection_list_do(enum injection_list_action action, const char function_name[])
> +static void injection_list_add(const char function_name[])
>   {
>   	int dir;
>   
>   	dir = fail_function_open();
> +
>   	igt_assert_lte(0, dir);
> +	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
>   
> -	switch(action) {
> -	case INJECTION_LIST_ADD:
> -		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
> -		break;
> -	case INJECTION_LIST_REMOVE:
> -		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
> -		break;
> -	default:
> -		igt_assert(!"missing");
> -	}
> +	close(dir);
> +}
> +
> +static void injection_list_remove(const char function_name[])
> +{
> +	int dir;
> +
> +	dir = fail_function_open();
> +
> +	igt_assert_lte(0, dir);
> +	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
>   
>   	close(dir);
>   }
>   
> +static void injection_list_clear(void)
> +{
> +	/* If nothing specified (‘’) injection list is cleared */
> +	return injection_list_add("");
> +}
> +
>   /*
>    * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
>    */
> @@ -139,8 +143,7 @@ static void setup_injection_fault(void)
>   
>   static void cleanup_injection_fault(int sig)
>   {
> -	/* If nothing specified (‘’) injection list is cleared */
> -	injection_list_do(INJECTION_LIST_ADD, "");
> +	injection_list_clear();
>   }
>   
>   static void set_retval(const char function_name[], long long retval)
> @@ -185,11 +188,11 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>   
>   	ignore_faults_in_dmesg(function_name);
> -	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
>   	igt_assert_eq(-errno, INJECT_ERRNO);
> -	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	injection_list_remove(function_name);
>   }
>   
>   /**
> @@ -214,10 +217,10 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>   	xe_exec_queue_destroy(fd, exec_queue_id);
>   
>   	ignore_faults_in_dmesg(function_name);
> -	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> -	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	injection_list_remove(function_name);
>   
>   	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>   	xe_exec_queue_destroy(fd, exec_queue_id);
> @@ -249,10 +252,10 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
>   	igt_assert_eq(simple_vm_create(fd, flags), 0);
>   
>   	ignore_faults_in_dmesg(function_name);
> -	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_create(fd, flags) != 0);
> -	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	injection_list_remove(function_name);
>   
>   	igt_assert_eq(simple_vm_create(fd, flags), 0);
>   }
> @@ -312,10 +315,10 @@ vm_bind_fail(int fd, const char function_name[])
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   
>   	ignore_faults_in_dmesg(function_name);
> -	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_bind(fd, vm) != 0);
> -	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	injection_list_remove(function_name);
>   
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   }
