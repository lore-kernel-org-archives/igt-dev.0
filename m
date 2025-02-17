Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BDC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7AB10E398;
	Mon, 17 Feb 2025 08:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdWp0dmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5146310E398
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739779974; x=1771315974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sypWdMWuU7Du64A3s8GcTOoLEhNxv7mzQHJPbbdJe6g=;
 b=fdWp0dmZhEMo+hATk3y2gVy0Vj3KANqol5sDLySUZwQcpO8c/WuVFV70
 353MA1A5oRBb5lBtVx1K4gMNGivRTVK3bNoy4tTrIOGtGOK2Y3I345YV1
 WX4vrPf6H3696nOpkvPCYiwdzqclfnN2by0fv6GhK+JkwEals0L7paPzT
 fv6rIZdjz/gIfLRkA5DL011J6FwDBaaAJhByXCQa+SzzhXm/vRXW7une5
 7CirJKVUNe++ExhPeG4xCDN7rKUUDwwBm6kGj2VkSFvXqA5ZN1RRjbL72
 Uv+lJQvi4bsnVru7qEvuo50eY+1AeaTTvxWJn1NpHbC3MIiXmXgi6fHl9 A==;
X-CSE-ConnectionGUID: GPM9cT47SEGOSqFxcer7Pg==
X-CSE-MsgGUID: vQcCAFuDT0+qBFlQayFaKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="50667796"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="50667796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:12:53 -0800
X-CSE-ConnectionGUID: jr7Jly2pTW6yLV0iLKeEWQ==
X-CSE-MsgGUID: NHth0VDTSLC0agS5UTX6Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118198676"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:12:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 00:12:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:12:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM3nQFWQZYhPjVCE/ERWP8DM0t4GmjUb8WZC+tkKOKrOpehKPSr6i321c62yeByy0g2Lal3vYcO1oMBJxsRWaAYRlO8NBfPWIhfJK7akyd9l1hQXMxFwdaVAnJpTCFD0FXwQWq29WBSG19eMRcXM0o5jCSlIUoz6J2WB6paYScgC0UFMzW6wS3tJgJshDknw9ydsCFQtqek0Y3n18m1vuXZ1GZMzpaDCZMblbp6d4RjxJ37AKOYnO0EI+Y3y1LNyuz8L2HOjakqBvgrBUvDQAwxVATCrfuz9OggbfbnkpTQgIhk/NBtfo2UnuelHGPB1AHHoq+C0/yjGDMERc8mPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Fq0LwVEqYaU5P80djvt8DQtsf2Oe2vASZRmJnzVD4c=;
 b=Iz/Q3LsoPZ7qcH6CCzCYKgL/G4sW81Hzw98WPGOIUS/pKfIMcB2sbbClLBkIKvAvYki1tJkjc4NQjai4Un13skEUBoOJ88e35cE6HZZyKQO4BzlSeW/WDPvsMSgVEBvsh/lsdPAL1jx3P36AKGoVKOBRl8oTzRO25wG2JYiwaDXO81X80pdWN4wMiJOM7bH57Z4yVFfd3Hyhc1xQSDu/U3ytbwhxGMZsyAyNHjm/zT4B0wZKR/B++juruCjakRi0ux6TZNA/5k5Bi9z9iSHWl7yLA3NaoL+BgCQlkpPtWO8txQUJbWdE8dJenU/0iAoOwEcnpXhFbY+MbjixeJKPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:12:49 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 08:12:49 +0000
Message-ID: <8dcea252-c3fb-479e-aeca-42434186ef9e@intel.com>
Date: Mon, 17 Feb 2025 13:42:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/igt_kms: Add highres() and lowres() func
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
 <20250213110814.351186-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250213110814.351186-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f63e93-967b-444c-cc0a-08dd4f2addfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVpiTDc1UGx0NktaYUJwYkRaN0hadEdaSlFCN2dvc2tVUkhZcXVuZ3JUWWJF?=
 =?utf-8?B?TUhURmhGMlM2YVdqcGtYb242bEpVWjVLZi83RjZFRndrZ3NPZHNScjF2SDUw?=
 =?utf-8?B?UTZ4MjRwa2pGbXhPaGtKWVpwV0gwNmppUDBzakQwWkwrRlpMUXlvNXJEYW05?=
 =?utf-8?B?NmNVZmZZRmRrZ3J4WGR4U0xNZVIvanR0b0hyUDdLOWlmelBCM1NzckkzYnFu?=
 =?utf-8?B?YXMwcFZHUy90SGtteXJWL3BkTmxsRXpkQ2FrQ0dqNjRmeFpBd0NJL0w1dms0?=
 =?utf-8?B?eWwzMW14ZnhUOE1wZDBEcUV5UGp2cGxoVlJCSkZYaWtYZitzWmpITGZXM3Ra?=
 =?utf-8?B?MmZaOXlBanp5R2VTd3dCaCtUSU45VVlZbmY1bFQ4aGdsaSs2dU5hekNOdGE4?=
 =?utf-8?B?Ky9TdUkvcEFud1F2a3Q3azlDWk5qZ2wwcWh2cmlLMndGQ284TFZuQTlDRlRj?=
 =?utf-8?B?YjFJL3RnVnd4K1czNU5BRFh5b0N6alc4T1JIQjVyVHlHbE1qdWhxaUwrMmh0?=
 =?utf-8?B?eFozUmd1cEF6MHRtRlFHR0hZODVmQkt0a1YzUWlpQjN0dklFRkxmU20zZzVF?=
 =?utf-8?B?azVZSUhicWg2NEdjNzlqREVmQ1VPenNKV3VrV2FSRzFzSy9CbmZlRGhZa1Ru?=
 =?utf-8?B?NGRLcHQzZGFTbTR3US9SbUZXMFNRRngwSmFwU1hWZmhXQmdGN2RCVGlCNlAx?=
 =?utf-8?B?cUd4YTUrUGJ0dnZVZWFDQnd5Q1Q1RnBncWVyVTMrZ0I0L2VlQmcySWVITlpp?=
 =?utf-8?B?STJUVlhSQmJYZkdXVjdteXZIRFhudkVIZzQyZFkwMklNbkFqaXFMVXJKK1Rs?=
 =?utf-8?B?b0pKc3NJb0t0UGloRjF6aGR6NWhRTTZUdXZoTEFKRnJRM1h0eEdvZVFDZGQ2?=
 =?utf-8?B?VEw3STFaWC9zTEtWWjNGNUxDUllQYzRoUjRxWjBhemtWRENZaXhpeVd4SGZU?=
 =?utf-8?B?amd5Z2VXYVQvMUxqbHdvMWFrYmMwM0NjODRRR1pjQUpialgySTEzWXhTTU02?=
 =?utf-8?B?b0N6VU5RVUlNOGMrT21hY1lQS3BVazQ4bXRMQVB0V2hMdk1ybUROSWVMcVUz?=
 =?utf-8?B?bmI5bXllK1puUUUxOEdNa0hVVk1QeGlZYUVuMDhoaGViVnpiK3FacDVvMmpO?=
 =?utf-8?B?NnZyZlhNanpzREhFekxvc3E1WmFoYklycy9Gc3B1V1Ira0kreFNOWnc0Q241?=
 =?utf-8?B?Z0swcFNncFBaOVYwME1JWWhNSEN3eER3VlByZnBlWS9OUEdBQ0dCdzFyNUtl?=
 =?utf-8?B?aWpZcDc3NDdNNEVaSUVic3Qvdy9Ienc1UmRNNXA0SldNd1pmQTlNbUVEZXlX?=
 =?utf-8?B?ZThhTzMxVi9OY0ZsQUpsME14eE1sN3BWZTNRbDdCcXdwbldacG9iNnRVSnVK?=
 =?utf-8?B?cnB0bFd1TldkVVZ0Z29uRks5VTQwOE8wOGlCVFZydnVkM1d6NHpMcUE2RnFO?=
 =?utf-8?B?UTFWL0hsbThPOFpJRGxkMlg0blVpSWJHc0w3ZnU5c1R1VGZZRDlUcUtMU2JQ?=
 =?utf-8?B?TG1uOGdTdndVdUlyK21ieUNmbVFqeHpNKzFkY3ZLQnd6eDg0QitJSWc5a1Y0?=
 =?utf-8?B?TncvcER3QnhYck9KdDdqdVJNdXRaVEc5VncxaFl1b2xKb2h0WGpySFpJTnFs?=
 =?utf-8?B?Q1F0ZlBzSm1xa2d2UndRZjV6ZXN2TjJhRGt5VWpEdGh0QmdtelZlVHM2QVpy?=
 =?utf-8?B?RjZvbXlTQ2hRdFRCWFpjVTBYZGxqNCtTUndWcmFzT0Nab0FvRUdqdTFXZnNV?=
 =?utf-8?B?L2M1Qk9BY3ZLNHF1d2tDQjNleEV5V1czQVN4V0ttRXVkZHgwVGk4aHJTVjV5?=
 =?utf-8?B?UWw3b3U4RmdzeWhYRG5ZaW43aVVtNjlTZXoySGFOS0phNWJ3dXlBMkMwWEFD?=
 =?utf-8?Q?r40aaZfb3XE7O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHprYVlEZk4yT3RDR2VMUmVoVlNVUzl2YU9zRGoySkJiOFBHYmMxMDNncUM0?=
 =?utf-8?B?YWJCa04yNXgvVEp6YVVNc1puVjJWMGhrMnFTVFVlQVVlTWZzWWNsdE9YZGFL?=
 =?utf-8?B?L0IybmxKNVBzdFc5TEM1bXd5WS82VjA2YnR3aWpLbkZrdVlva0pKZWtRS0VW?=
 =?utf-8?B?NDdxbDF0amFIWlVnR25rV29EVUdLVHBZYjVJekJDU1V1ZW52NWZJQUIrYzB3?=
 =?utf-8?B?ZUtycFdVcHBVSWU3NWt2YjVMNEY0U2tqMTU3aW8wdlJOUWI5eEhZS2UxQ2N3?=
 =?utf-8?B?bkNXUnUxQ0Fkd3JERzh4ZFRFcEtsNnk3clBKMEttZ0lKUXduT01FN0MybWx2?=
 =?utf-8?B?RHVqTXd3YnNwQXB1WWtvSDZPTEZDS05uMjdMM2p6Y28xa2dLdGNpMGMyNFlS?=
 =?utf-8?B?Qm1lK0FENnU2cyt3bFRuZjRQSEF1OHZMaGpjZHk2aWVoQWhVVmNSUFVudUE1?=
 =?utf-8?B?Mmp0R2liUHQvMTBqck9IUCtieVFQZGEyOFM0Wnhab0hTMDJZbUI5UFJVQkZk?=
 =?utf-8?B?eERiV0F1b0lmTGo5d1lVY1hueXhEUmdzVDBlc1QyQkI0KzZDOVlxVFg2eXNE?=
 =?utf-8?B?QnFlKzZwMDd0MlZIdU1ZUWEvZWx1MjdNZG9CaXBkNFptdjRtdTFmY2VoYW9M?=
 =?utf-8?B?MFRsd1NiVlphOWRMNDFGM28vM2ZKZ0t1eURZSFRDWGtkNi9Ka0VONHN4MFo0?=
 =?utf-8?B?ZThuMWxuTWhiRzdWVjJvSVNWa283bWRhTkhaelpadFJBOGs1TCtXMUJhcjhh?=
 =?utf-8?B?NVJNcTJRMFdXT3ROc0pHUEhqbDhxc3lUSHo0clhmMy9sNmFqamg2Wk9oS2J0?=
 =?utf-8?B?SzE5UTNJMDVJZmJQd0JwU3B1bFFsMDI1ZDFvWUxickI2U0FBY1ZkcFJQM05M?=
 =?utf-8?B?RVZxdC93Zis2TjFNVzF5WDFaS0lKUmRiNjcwWkpBMHR1RzFRY2xQc016dUNF?=
 =?utf-8?B?bkU4eWVSRE83Vk16SVBmT2R2eFR3SmFLOUhFR055Zm9sYU4zME9CWGhUaUoz?=
 =?utf-8?B?bVNibklVVEZXQkZjZzdHOTJDaTJhalZQZWlXcXRPTkJGYmFmeXp1NEo5MTZi?=
 =?utf-8?B?UXpqekxPaFlZZHkzL0xnRythQTloREo0QUV1VHV6NUxIeEkwc29xRzRJWWJO?=
 =?utf-8?B?M3p6RzdBdkVOSjN2ajV6cmdwb0gzMXZGK0pFR05pNnBTalFad1gvZ3R3eW90?=
 =?utf-8?B?allVeUYwaTU3VEhRd2xDVlpwYXRvc29ZanB6U3JYZ1ZmZ2xHbElvWnoyUVZZ?=
 =?utf-8?B?RHA0OHhGTEZaWFZ4eFFjMXpORzZnbGtnU05EbHpUT0JycUxlOVpiSUJCeFZo?=
 =?utf-8?B?K3c1U1dQMU1zVEd0NVNKclNOUDFBSEhnT3g5SWdZT1RpbUU5Q1hETGVnSkxo?=
 =?utf-8?B?cHExQWhSYVBIVXRNSGRmeXNSV2NUbnpqd1ptTnhkWE5HTVdKWjN1dTNsN2tZ?=
 =?utf-8?B?OGhjcVBPczFMTW1DZHR2aUUrcmZUOE14R0tLa00wUXdiakFzU2Vaam1oUzB5?=
 =?utf-8?B?MTRIOGNZYi9vWGVqR2Q4UWJEUzNGekE1YytUeDN6VHJuRkJVcGxZZlhUcDJ0?=
 =?utf-8?B?MDZEcXFVSkhDbGd2a1V0MytYVndQdnY0UEdMQlROd3RTam9Yckhsa3l3YnNj?=
 =?utf-8?B?UStmcjRHRHU3K0VXM3ZiNEZBUHcrVEw4MXQ0bWZxZHM4bVJtTSs3ODRIL0Nv?=
 =?utf-8?B?cGFHdy9zQ3RmYWEwUzVKdXowUFJrcklES0dPdnVMeW5xcytramk5RGNBcG41?=
 =?utf-8?B?eGRhemZ4VjVGYTJBK2R1L1R2VE5TODJtd0RIMjV3M2YxWVVXY0d5dU1qNkd3?=
 =?utf-8?B?OEh6NWl3Ukg3MGJ2ZFYvMmFlMVFLODhwVkllUm5Pb1ptNWttNTEvc1NoTzVq?=
 =?utf-8?B?ZEl1dG8rN2Z2YWdwdW55NnlvTVc5Ti90U1BZcEEzenA3d3FjSVgxT1IwWFU1?=
 =?utf-8?B?V042VEQ0TVd3dXJyNGc0ayttSCtaMHIxOG1PUU9LZ1VIVnRBY0g0bGRxcTdi?=
 =?utf-8?B?ZDBkYUNwNThGc0dDUmU3NndQZzdLZUtnVzVxazg2S0lqK1hCOEhsbWIrUnNJ?=
 =?utf-8?B?ZWFnZnJQVXkwMVRNMmZoRXk3Y2Eycy9UTVBmNDBDQm1HRHNFYmg1OWR2TnQz?=
 =?utf-8?B?dW9mQ0t2N3VOYkpaeGtDNEhGNVJaOW9mU3JDUXdZWWh1MjZSZFRMMDB4MWcx?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f63e93-967b-444c-cc0a-08dd4f2addfe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:12:48.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhIoZlp6jRUE7FF0ynQK6/l84ek/4NFSwMwRujk+5vzbnG4e8BIl7vntbvZUnrAoHkUGuTM9YJdR7w1+4JuXvSKHB1BrqFczsJh89o0Pi7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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


On 2/13/2025 4:38 PM, Swati Sharma wrote:
> Add functions to return highest and lowest modes in lib, update
> relevant binaries.
>
> Addresses two key issues:
>
> 1. Remove strict 4K selection and choose the highest mode instead.
> Previously, the code always selected 4K, even if an 8K mode was
> available. Update this logic to align with cdclk transition requirements
> for resolutions above 4K.
>
> 2. Optimize mode selection by sorting modes once instead of iterating
> through the list multiple times, improving efficiency.
>
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c             | 34 +++++++++++++++++
>   lib/igt_kms.h             |  2 +
>   tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
>   tests/intel/kms_dsc.c     | 14 +------
>   tests/kms_display_modes.c | 14 +------
>   5 files changed, 72 insertions(+), 69 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3..8220cc0eb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4845,6 +4845,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *output)
>   		return &output->config.default_mode;
>   }
>   
> +/**
> + * igt_output_get_highres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the highest mode, NULL otherwise.
> + */
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *highest_mode = NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	highest_mode = &connector->modes[0];
> +
> +	return highest_mode;
> +}
> +
> +/**
> + * igt_output_get_lowres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the lowest mode, NULL otherwise.
> + */
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *lowest_mode = NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
> +	lowest_mode = &connector->modes[0];
> +
> +	return lowest_mode;
> +}
> +
>   /**
>    * igt_output_override_mode:
>    * @output: Output of which the mode will be overridden
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fb..5cf0b89d3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -543,6 +543,8 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
>   
>   const char *igt_output_name(igt_output_t *output);
>   drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>   void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
>   int igt_output_preferred_vrefresh(igt_output_t *output);
>   void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..e78d22e1d 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
>   	return data_rate;
>   }
>   
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeModeInfo *highest_mode = NULL;
> -	drmModeConnector *connector = output->config.connector;
> -	int j;
> -
> -	for (j = 0; j < connector->count_modes; j++) {
> -		if (connector->modes[j].vdisplay == VDISPLAY_4K &&
> -		    connector->modes[j].hdisplay == HDISPLAY_4K &&
> -		    connector->modes[j].vrefresh == VREFRESH) {
> -			highest_mode = &connector->modes[j];
> -			break;
> -		}
> -	}
> -
> -	return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
>   {
>   	drmModeModeInfo *lowest_mode = NULL;
> @@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo mode;
>   	int scaling = 50;
>   	int ret;
>   	bool test_complete = false;
> @@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   		igt_display_reset(display);
>   
>   		igt_output_set_pipe(output, pipe);
> -		mode = get_highres_mode(output);
> -		igt_require(mode != NULL);
> -		igt_output_override_mode(output, mode);
> +		mode = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode.hdisplay >= HDISPLAY_4K && mode.vdisplay >= VDISPLAY_4K &&
> +			      mode.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> +			      igt_output_name(output));
> +
> +		igt_output_override_mode(output, &mode);
>   
>   		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
>   		igt_create_color_pattern_fb(display->drm_fd,
> -					    mode->hdisplay, mode->vdisplay,
> +					    mode.hdisplay, mode.vdisplay,
>   					    DRM_FORMAT_XRGB8888,
>   					    DRM_FORMAT_MOD_LINEAR,
>   					    0.0, 0.0, 0.0, &fb);
> @@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> -	drmModeModeInfo *mode_hi, *mode_lo, *mode;
> +	drmModeModeInfo mode_hi, mode_lo, *mode;
>   
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
> -	mode_lo = get_lowres_mode(output);
> -	mode_hi = get_highres_mode(output);
> -	igt_require(mode_hi != NULL);
> +	mode_lo = *get_lowres_mode(output);
> +	mode_hi = *igt_output_get_highres_mode(output);
> +	igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> +		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> +		      igt_output_name(output));
>   
> -	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
> +	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
>   		      "Highest and lowest mode resolutions are same; no transition\n");
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   				    0.0, 0.0, 0.0, &fb);
>   
>   	/* switch to lower resolution */
> -	igt_output_override_mode(output, mode_lo);
> +	igt_output_override_mode(output, &mode_lo);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>   
>   	/* switch to higher resolution */
> -	igt_output_override_mode(output, mode_hi);
> +	igt_output_override_mode(output, &mode_hi);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	cdclk_new = get_current_cdclk_freq(debugfs_fd);
> @@ -273,7 +260,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
> -	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	drmModeModeInfo *mode, mode_hi, mode_lo;
>   	igt_output_t *output;
>   	int valid_outputs = 0;
>   	int cdclk_ref, cdclk_new;
> @@ -297,11 +284,13 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +		mode_hi = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> +			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",

This condition can be a separate function.

Also remove fullstop/period at the end of the message.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +			      igt_output_name(output));
>   
>   		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(output, &mode_hi);
>   		i++;
>   	}
>   	igt_require(intel_pipe_output_combo_valid(display));
> @@ -320,12 +309,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> -		mode_lo = get_lowres_mode(output);
> +		mode_lo = *get_lowres_mode(output);
>   
> -		igt_output_override_mode(output, mode_lo);
> +		igt_output_override_mode(output, &mode_lo);
>   		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
> -		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
> +		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
> +		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
>   		i++;
>   	}
>   
> @@ -343,13 +332,15 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +		mode_hi = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> +			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> +			      igt_output_name(output));
>   
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(output, &mode_hi);
>   		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
> -		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
> +		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
> +		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
>   		j++;
>   	}
>   
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 5508e7a9e..1392e1cd4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -94,18 +94,6 @@ static inline void manual(const char *expected)
>   	igt_debug_interactive_mode_check("all", expected);
>   }
>   
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeConnector *connector = output->config.connector;
> -	drmModeModeInfo *highest_mode = NULL;
> -
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -
> -	highest_mode = &connector->modes[0];
> -
> -	return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
>   {
>   	drmModeConnector *connector = output->config.connector;
> @@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
>   		    DRM_FORMAT_MOD_LINEAR));
>   
> -	mode = get_highres_mode(output);
> +	mode = igt_output_get_highres_mode(output);
>   
>   	do {
>   		if (data->output_format != DSC_FORMAT_RGB && index > 0)
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..6ea44944a 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -60,18 +60,6 @@ typedef struct {
>   	int n_pipes;
>   } data_t;
>   
> -/* Get higher mode supported by panel. */
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeConnector *connector = output->config.connector;
> -	drmModeModeInfo *highest_mode = NULL;
> -
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	highest_mode = &connector->modes[0];
> -
> -	return highest_mode;
> -}
> -
>   /* Get the 4k or less then 4k mode of connected panel. */
>   static drmModeModeInfo *get_mode(igt_output_t *output)
>   {
> @@ -344,7 +332,7 @@ igt_main
>   		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
>   
>   		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
> -		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
> +		memcpy(&data.mode_mst[1], igt_output_get_highres_mode(data.mst_output[1]),
>   				sizeof(drmModeModeInfo));
>   		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
>   			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");
