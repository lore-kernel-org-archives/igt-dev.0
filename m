Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B9C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 08:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4FB10E318;
	Fri,  7 Feb 2025 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfiU3bYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8551A10E2D8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738916575; x=1770452575;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NsqSqnNuPap6/uLHrVstYnLS8eTS50OF/YvcLvXvZQA=;
 b=EfiU3bYy6tmhV/3rGN28p+X0DO/7uh5ObFPoqumUv1W4twaJWkNwZs6L
 vE5LAeXbbTY1Gil+ukdzWxuvK43kGQSntovNX/fNCZhPNUhvwNLLBj7+W
 m50tEk9j/tEu7VKsnThDo2IjOknfZGVllBmiKt1Ei1oA0AfpkVVyATKUK
 WYcfXGJgkxaJ8e5qDUI8aEs/mbWyMJVM7nS+/p1nFpLsFKAtWZ5DtiAy8
 AykHg5jFjdqtKxEEkShYddiKQI+725SGzFC/lyrH9yqqZsLnbWy5ckdnz
 tm7oXLBHngwQPwuAGPTWfLJny2CesZpQjXkEBua8HfqgZXxpAwHAiCZWp g==;
X-CSE-ConnectionGUID: Sz/h8Zv1R4eRmiEmezV36w==
X-CSE-MsgGUID: oGLFr8trQKu/EfmcnQbWFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39446729"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39446729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 00:22:54 -0800
X-CSE-ConnectionGUID: 7zJcx0RsQhqpxWWM8vwDXg==
X-CSE-MsgGUID: UDmPQxGfRr+aqYk3whpAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="116472201"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 00:22:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 00:22:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 00:22:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 00:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtmORS97QeKoKFD4QcdCVwkkRaaR6ZI5djzuyAPF3bvRbMYczBi4dZFqhJzZO/PRkyfkXnJ/Jei3PUOdqDk0f5Hl5nqBZNGY0hylI/H4ChKT2DPLCmiUgkBWNS1BeO8xQC8hn/3Wsgu9NcFBCgo507BzSDC5Kq9hduag2M9Y3Gx2aLwTsJdigplrncUWgjbxH1ZYPS3CNHxehzbKNXCyKmhu85vAmzMHRGjebG93ABPbU54Y4lt19b9cEBfKVfiuFKJ76CM8RHg/FijKzaaWZMPRdxBb0O7AzsdwHHs4sdXOWZ2KKn1OHUwFB/vqFQrwyGUPNN11GRQoZhIl3CaVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZG/DvGgHzW7IhcVIoCCrL9EBKB37ZsLraAcOSX6/keU=;
 b=ItMShi+5gEUESuNbIiBrqHv5nv+jpsdL4aQAzgjHLz1kG8ZkKeM3fQSHMMscJ4LtEuc7ijuSLts2Ak5tlpbQNNGqhfix+kIcRqLJ4Bw2GBZYHgAuWbpuaaymqKx5mps8Q89CP3NRFy2CflByGsQgW3xQD38/oskyepctmn+DBJVKLQLuyzC9O+ggfw+PlmVQ3titafvTqHcKZzVUV7J+MVoO5JdLadT5iQG2xMyHLJP3tNXRvRHX7o474UOMtE7htdAbLbSvy1ukznGtE5Nc3v7zFpvKekULZl1y0bBddoc7vxk5PO9fb6M0J2+pTXzvYxLx0xGiiTbdBg/W29uFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 08:22:51 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 08:22:51 +0000
Message-ID: <0cf3b75c-84c3-42db-acbc-0af7a212fbf9@intel.com>
Date: Fri, 7 Feb 2025 13:52:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Add support to check joiner mode
 limit
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250204182734.793645-1-jeevan.b@intel.com>
 <20250204182734.793645-3-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250204182734.793645-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6872b8-e67e-45d4-c663-08dd47509cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bER4ZVdOWmFjdXdvSUtLeHhrelNaZWFzL3RjZjhDVlhiSEhBWFRMMld3REpP?=
 =?utf-8?B?UWhNeXgxR0tWYUNBWFdaakFvV1FuT2c2MCtPc1FCeGtFb21Eb0p5ZUNQczRY?=
 =?utf-8?B?TmdFeGwxMkdKN2JyQUlUcG1wUkd0di9hTUJmcFRvdUFNQWlBKy9RWmtWTEsy?=
 =?utf-8?B?dm9iUkdadWhvMFl2d3BYVlQ4TkdiZkNtbVpvSVVXaDNYMFhVUE5sanBsaVlE?=
 =?utf-8?B?NitmMVVVYTBWTDdsenpCQ0dTbTdVaFU3Ui9FWjBhc1lDbUxuc0NjUXNvOTNv?=
 =?utf-8?B?dGJjMXZBdTZRSTBsZmI3MWRzOVJNK05KUDNkb3luQzBSTnEvUG9kM3IyeUQ5?=
 =?utf-8?B?V0pxS0QvNE0yM0lva3c5ZjhlRU5wWXFRU1NhR3RWcWFPVEhRekpZSjFUZUFa?=
 =?utf-8?B?NGdMdUd6T2k3NVB6SGt6eGZldGROcFNlYXFVenVoQyt5Z1NmbWhxQjVhN3dr?=
 =?utf-8?B?THZzRnNVRUdzOE1ydXZjcWJPR3h5aDY1VERHV3E0MzVINS9DYUxLNkI0Y1kw?=
 =?utf-8?B?RmEyV004TitGZlRObmw0TGx5KzdWTGlqV3V3RUltbUxrZWM0UWxla2dVZWxL?=
 =?utf-8?B?WnFDWVBob1VpVUJ3VWsxZWRhRnhybU1LVUp1K3Y3Qlh6aFBCZnRUMGFHcHFQ?=
 =?utf-8?B?Zll0S1VNYlhVVXduQzRvc1pFWTQ2azhCRm1xNlpTV0xKUEc3TGI1WVQzcVhK?=
 =?utf-8?B?bWhHMisveGtsTk04YjdNVG1CYWt0VEJTMGx3VzIrNDc5RktpM2JOalNZWDM3?=
 =?utf-8?B?S0V6VnZmOVRQWXArbnhreWlYVUIxeG5TMUpTWkR0cU1vSGxkSEx4Q0NyOS9G?=
 =?utf-8?B?NUw4TkI3anFGY3BKLy9LWU1xQWNGazBMOHB5OXRVazlxZFZFYXRRRVArVDIx?=
 =?utf-8?B?Y0RtbWlNckgrcWNSdmhabWtTODdZZnRaaWFuaEFtSk5XVGpLRUZONHlWSFJ4?=
 =?utf-8?B?TzJvU3BIeG04endMeEhCK3hkNDhLQlEvUUFZQUNKN1VsbVhLTUtKQisyNkV3?=
 =?utf-8?B?d3JVcDRQVll2K0RqTEptaUlxZ0tPQ1JaMCtSZmdkQmY5VFRTOVdpL1hLY2tp?=
 =?utf-8?B?YUxPdzJhM25YdlMyQnZ1TGhobGJSRGxJbzB1NmdUbkw4UGpaRUp4T01xUG5x?=
 =?utf-8?B?clI1ay9JWHNkeGx2RWhxQjFEdER2MDBRci9hUmpZSzkyL2g2T0dqY24xMzQ3?=
 =?utf-8?B?b0kvMTJHTUxNRTRoOXhoeUpQNUkraEV5dHY3S1E1eitncDdRTnFGb1ZrSXVI?=
 =?utf-8?B?ZnlGdkxjR0FRYWNDTzJWNE4zRDVjRDlnRXVJRWxMS0JydG1rMDlVYmxVMVVy?=
 =?utf-8?B?WmVmaGgzamtRWWdzbEQzVGZ3d05RTHVQYWNrd25PUHRXbGNjbVkxNGZYUUFp?=
 =?utf-8?B?c3I1bEVLNHZOOXdMUlFGa3o1OXZZTG8yYlBQaGdmR2VtYWc0UTV2U1VNWG02?=
 =?utf-8?B?TU1MRkJwSnU4ZTIwRTlQN21zcEhDRFJPZ1BnMEk2ZmZhN3h2Y3NkbGtoRTdU?=
 =?utf-8?B?MlppVFhJTVEwaGRzSTc0SXlWT2NSQitZTlFoU1Zoa2Rrcy80L0lrQzJWdDVD?=
 =?utf-8?B?K0dUUW9ySGxiQmVCbzJPSHpPVnlzdG41aEdhWkxEaFJxZEllektnSlVNTzIy?=
 =?utf-8?B?NjVMMkhPWmUvcW5QeWlJUHJCcFhWNUt4allYSGJJNVU4WCtEeDZEdlU5UTVY?=
 =?utf-8?B?QjRxTlRLamRzVmpXRmxoSXRQLzRTK0d0VVdaMXRwMG4rSDUzcVhLSW14eVV1?=
 =?utf-8?B?NDc3WTFRT25Dd3ZITjZsaWZxQW0wT3lSSnZWbUZDYkx1VC8vYWp0S0VBbjFv?=
 =?utf-8?B?Z3FaeUNocjJieWFSbjJyYm9XdWpwVVJPSk5XTnB3WlRadXZqc0VJWGhnS0JP?=
 =?utf-8?Q?ldFJpBAoPX1qP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZMV0dSWjRPazM3b0pqaW1vcXBZVTkzSFgrcDl4ejJJWHM5OTRDVGlsMEVq?=
 =?utf-8?B?eml6R3lYN3h5M0VNV1dVZVk1akNpbVR0VDBtcUdXRDBWbXZqSG5mbGRWWEk4?=
 =?utf-8?B?a0dVeUNvb3J0bWdJY3Y5akM0UDEyVjM4SXhtRDN3c04rUW13T1RuQytmUkRN?=
 =?utf-8?B?TTZaTUNaZUNXVURHcUtydVFhQWVsVXAzUW92TnZnSFE3QXVVR3h0RU13b0or?=
 =?utf-8?B?bXYxelZGY1BuTkFCalZYbmJSL0ZmK0VQeVhOaW93Y0orcUZ3ZnBXa2hEc3V0?=
 =?utf-8?B?djZFM1d5NFJsKzM1dGpYLzcrOHZrQVA0ODBSNGFiVzhNR1BwUmwyVE1kaUI2?=
 =?utf-8?B?ajRhenpwcU9NcnVrQTR0WlpIMldoVFhvL1RuQldtaUYxZ1FGaXlCM3Uvd3pN?=
 =?utf-8?B?c0VQYkZjYWtPS2Y4RHg5M1VRUjhGaGcrVWo2a21qeFBxNWZwanZRNUsxN21n?=
 =?utf-8?B?OGwwR2ZTNUk0ODB6WkZXbkdub21yZjE3c09WdnBwek1iYnpsVVBxWFJINUJu?=
 =?utf-8?B?ZUFwQld0cUZqemI1YUFsV0QvTU1NQ05qTXloWVgvL0pXVk11S1R3b1ltL3d6?=
 =?utf-8?B?eHUvdmpaM21JWC9lVDd1NUpyZExWSDAzN2phNHIrcE85NEpxZ2orOVlOTXd3?=
 =?utf-8?B?QWlJNjZvVFAvN1hKV3FncVRQNUkxSnA2aS9SM0VRMEtkWDhhYUg5dlIrcmNl?=
 =?utf-8?B?VVBqRjY2WktDM2ZVS3FwZk1TNUVyNGsvTnZsS1d3em55cjJYLzNpQkM5YWhB?=
 =?utf-8?B?M09HV1BTSmhDbnFyMGlxR2ZSbE96cXlTZU1ER093aDBvQlhMN1B0L3BHY28w?=
 =?utf-8?B?QTkvOUhTTEFwdCs3V1BtMnN0UWY4cnJJYTNEYmRsYnZlVDJxVHpOM0JPa3Fl?=
 =?utf-8?B?VVdtdTBRMWFrQ0RidW8rY1lhbWFKREFhejIzS0doVDhQR2ZEQXNtNmczZDRs?=
 =?utf-8?B?NFFHdHdDM0VaV3QwaVFmcm56dS9kVU5BLy9hQU8yTlpaa2ZpZVJGUnp1R1F5?=
 =?utf-8?B?K0hMOTdGcWNoMHNEMDk0SjBJS1kxZTVoZTFrdVhXRmRBV3ZiNEphK21HaVRh?=
 =?utf-8?B?ZkVDeW9vNjNyYzE5SS9KVDVLTUxmS01TVGxUbEViQ0hEM1BaMk51RlFjMzVs?=
 =?utf-8?B?dnZUb1V6b1dHaUd0ZEVPcFcvR3NpLzNCNVlYWEZvbXVzWGNOWlJvbEVsWC9r?=
 =?utf-8?B?bFV4NFZLUUJKem1vVkNmWlpaNi9WUWdwLzlTRnRJc2RzY3ZhRm0rSnZTL2R0?=
 =?utf-8?B?VTk1ZVMxNVgrWG9iVEU4dmE0ZUNRSDIxT0UrZlNoSytFd0R1b0pIR1J2VWl5?=
 =?utf-8?B?V1cxZ3padXJ2Zk50aXhRRDExT1BNaCsvdFk3MGFvMGFwdTdKQjdpS0hXZ2pa?=
 =?utf-8?B?K2t2VDJDQnkxMURoczY4dy9SSFhtOTBTRThwT2FlQkFITEY4bVZqUXVmSTJ0?=
 =?utf-8?B?REozeEtOODBaTk1YOXducy9SczRaRkl6ZGhQMXQvSFAvZUtISGVtc3l0dDlC?=
 =?utf-8?B?OC9EWmtoRnVIVC8xVk1UeXM3ZVY2YXFiQ2lvZHMvWnVBelRkWE81c0NzYXdP?=
 =?utf-8?B?Uk9OSkRHMnZGNzF0RXV4T09UY1FxcEw4RzZzVVZabHBFRmJuRngrT3VyN0Nw?=
 =?utf-8?B?WGRuNThlODZkQnlhd3ZPN0Fwb09ZMDFmNkV2NG84NmI3bzdFVWZUMWdJSlh3?=
 =?utf-8?B?VXV0bUpBV1lsSmNIMnBMOXp6Wm9Cbzh1ZFk4aW14RmN0Rk9pd3pUeHJTTjlI?=
 =?utf-8?B?Y0EzMFlqQTNpNDQwVzhOQjRkbjkrd1B2MGpXSHo3N3ZUL3NjYmpwTXRRYURi?=
 =?utf-8?B?cVZ4aEtHQllWUTZGU0w1OXFuZlFCQkJzWElPVGF2M2x0ajRUNXlwUkhjYkdR?=
 =?utf-8?B?eTJwa2dlZDBTRU1lY2RkMzRYN2I1V2hLcDFPNTF6cmlZMFZxb1A0U2J6ejRE?=
 =?utf-8?B?WDdHRk1TUSszbk5INU5vOWxMYXRMOWtOWnNCU3RBZTJ5TGpaNzVPbWw5SjV6?=
 =?utf-8?B?NzBmMnBXdDlCYzM0VjYwUklGVENJMzd3ckdiekRjUHRlVjI3UERSK3NBUVE5?=
 =?utf-8?B?YkZCUk9odE9MLys5UDgwWWs2Qy9xNzQ1ejZybVFURyt1NmxaREJBRmpxM0s1?=
 =?utf-8?Q?vOGjthpY3byCbkcoyFvYu86Nz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6872b8-e67e-45d4-c663-08dd47509cc9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:22:51.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgA0XT6ZIQhqSRFiZzx4JWI9RrpGQvRNKypzuTSFrln4FN/E6Ram14Hx2FZbG2HysW3gxfLJ2ONSKx68q2Kyiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
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

Hi,

On 2/4/2025 11:57 PM, Jeevan B wrote:
> Added library changes to find the non-joiner mode by selecting
> the top threshold mode for joiner mode. This helps in determining
The first sentence seems a little confusing. Could this be simplified.
> the maximum resolution or clock frequency that does not require a
> big joiner configuration.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 35 +++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 37 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d4980d2ac..3c73f57fc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6406,6 +6406,41 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * non_joiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Non-Joiner will come in to the picture when the
> + * resolution > 5K/6K or clock < max-dot-clock.
Please fix/update this.  There is no ROI testing any random non-joiner 
mode. It should/will return the max mode that can be supported without 
joiner.
> + *
> + * Returns: True if big joiner found in connector modes
> + */
> +bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			   int max_dotclock, drmModeModeInfo *mode)
> +{
> +	bool found = false;
> +	int max_hdisplay, dev_id;
> +
> +	dev_id = intel_get_drm_devid(drm_fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +			HDISPLAY_5K_PER_PIPE;
This will be used in other places as well. Can we have a helper for this?
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		if ((current_mode->hdisplay == max_hdisplay &&
> +		    current_mode->vrefresh == 30) || current_mode->clock < max_dotclock) {

We shouldn't be having an OR for 'current_mode->clock < max_dotclock', 
as this will return any lower mode.

Also we shouldn't be hardcoding vrefresh to 30, we need to find the max 
mode which will be just less than max_dotclock.

Thanks,
Karthik.B.S
> +			*mode = connector->modes[i];
> +			found = true;
> +			break;
> +		}
> +	}
> +	return found;
> +}
> +
>   /**
>    * igt_is_joiner_enabled:
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7df53ec9c..069444667 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1250,6 +1250,8 @@ bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
> +bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			   int max_dotclock, drmModeModeInfo *mode);
>   bool is_joiner_mode(int drm_fd, igt_output_t *output);
>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
