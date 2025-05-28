Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614DFC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 08:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864C10E5AC;
	Wed, 28 May 2025 08:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQEZ0XAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E25B10E59B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748420983; x=1779956983;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=envIIQ1P6CaXcYzLUv6F1cSEOJ/EI6i2gjlDBCYqnwY=;
 b=MQEZ0XAWIbR9m+YeG2Haz7PFlUqGLT5Cw7nghP+nrPWoBdTm2W9B2FgR
 yKnCdC53l1im95HWpyUrzc8OwohJO5WvkLaVbhDNaQv0n8FrPh16xojjh
 EziqIJkzXZDXwPPln+3f4sCr6zi1XUqjsZ5dtvsfhvg+TuCvZHCIcbCUE
 +HuKumuF1yOh2PG0pJklyu5MOgolSG2IPumamWyteJ4PTLQi898CQ9ECY
 6dmhEMYZJgQ0zbGoekAJ3dr4V9YM75K6YNWc+m3sMJ9rQz4eO7/FTQY7t
 zJdhcWkhGc55wZhFY6keqn+jYW2K2dQjIMKADzve9zodMLtyiew64hnIw Q==;
X-CSE-ConnectionGUID: 7BOiR+OcQDaRCwsNRd4USA==
X-CSE-MsgGUID: C0/plzQMSrG/vXSSkNnLyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50136097"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50136097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:29:42 -0700
X-CSE-ConnectionGUID: Y9WqIQYHTcOoQ4oZOnkvCw==
X-CSE-MsgGUID: jZap8Sr5TFSRFGowzSMnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143518926"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:29:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 01:29:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 01:29:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 01:29:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9ARjyKyoIyYgoLDf0+1zsbAXp33jlZ0bD07JK4E4pfPUkEmgJxgyfm57MUMqAGjztktz7kK1sd9T74Bd+FdYd4bef7jbq4BQpVkqielMZ5WsnhX+m3FZDelV1EASAnFPd1iOEGeDlIpWAE5rHw0BWvZGmfEBVSIgR93mAPX4FQoHTbSEZ/r7xkxXnTKK1wbujd/qYxDLfXUi/JsWWzGcaensnl90nRqC4ibdXg+mFse9PZGEMKrmYUzb4oYNLIcLmLmTMQIvvyZO2p1InUKRZQQK31BzvrCO2vliVfcBohCOMZQKB8xTTZ1gPmh3xWphG6gLNCTzYJRX6pthxYAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouIBysJkGAp3zIRsqfKm9uDOpxAxNFPkmzqz0vRsOyk=;
 b=UbHem/wnDtr1Rhflj/XLHryV09Sh/JjqAt87WjjrRReT/cbxYE7xLpXyXf+YhxymiV8qGESDUuydhgcOVTr34m5WHO86be4LBT6269cA0jI6WBYpzJel4Zb3GCrHsvh63q6aj6K0z2syqWzbpdLppvCSZW5Uz7epOrJWBozmdipYt7FVBWO0v3JaGUcv1xbWgB7OMiYs80ZSIXUgf6kerlBpo/RxMVQ1kyqzGJYHSPlOz1nnIsLU7LriGUyXwK10jukPBX965+eDK38RIbglL2zgexAqA8jUMZf4iToBTtTiNS+GKGH4WDEUzgUrV0xslUV8ZwBjV3ERM5LdngX8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:29:34 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 08:29:33 +0000
Date: Wed, 28 May 2025 10:29:30 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 11/11] lib/intel_blt: add mem-copy debug facility
Message-ID: <aDbJajxE5Os5EDt_@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-12-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0066.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfb7b36-c678-45d5-f604-08dd9dc1c618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STg5OUNzLzR1dDduVWRUOW9oYUJkNnlQdFg4Uk4ya3VtVzV3M3QrN3lITmpM?=
 =?utf-8?B?SWc5blFiM1crYjhxN0J5Z240Mk5VWlM4cFB5aFg0NENpQjdiRWtHNkF5NlFJ?=
 =?utf-8?B?WFZwNHpRd3FuMis5bFREWVNZdGdrTmE3YmJpdjVQUmdmei9hRnBJODdLN3lT?=
 =?utf-8?B?WThXd0lKcHVBQ1E3NjRaUFJoNUp2QjA4d3RLUTRiQ2RtSXNBdnA1SUx6WFdM?=
 =?utf-8?B?ZGQzZXUrT2Y4SmZKaVI3RjRZNE4zL2xHUUFoUDNJei9nVFZEczZyUHJ1Z1V4?=
 =?utf-8?B?dGQvcGhrZzNnUkdQSXRLWVZwQjVYRWdsQ3dzSlp2Y01GQndvTjE4clU0d0JC?=
 =?utf-8?B?Y0xIbmJZYUtvOW01ZEJGVHNNK3dFZjJYeFh5anRmbE5Pbi9PdDFnUFlvK2ts?=
 =?utf-8?B?U00yWUpueHA4ZXNQUkppeDBlZ2t5dHgxbTQ1aHVpd2NDaXZ4Z2dJblVVcEVZ?=
 =?utf-8?B?NTAzWm5WOXlOMW9XcWRZM2dpSnAwdGtxUGJLSUwzZWsyVUhxZmNhZXErblpJ?=
 =?utf-8?B?N2MybFhRZGtvMDlac0J5dkxkL3BSU3pUUzVBWFo5b3ZoZlFpQzloZmhJL0Fn?=
 =?utf-8?B?WnJCV0dJMGVTc3ZxUk8xU3ZsME9PY24vRW9XcDhMYk9SSkp5M21scyt3d0dK?=
 =?utf-8?B?YUdRKzdtY1YyT0x0L1lJRE1PR0dSNyttdFJmRk82MVJYZTVXb01waG1oOFNC?=
 =?utf-8?B?OC8vZkl5aVYxMXNYU0tscnEzcXZxT2xMVTVvYlNldUd2cnJWVXI4VzdmdThz?=
 =?utf-8?B?RXJ4L05GSnRtSmY2djZZMzRndjI1bHlqSWdXTDUxWjFWUnkrTFZOSWZOdVBw?=
 =?utf-8?B?M0hteEFiYVBTaSs1Q3cvdDIzcGliNkg1eWJCUzNHR1cyd1VZZmYwMTNSMFUv?=
 =?utf-8?B?dG12NkQrTWUybXNpTGdRb1o1a1g3aVJKbDdablMzVGRpdTJDK28zbGwyc2tF?=
 =?utf-8?B?YUJoaUViajRMOEROQm9CakdNN0NBWXB1bGVHU3AxVEZMc1hhM05zU3A1ajJB?=
 =?utf-8?B?V2dOTUxwNThoZ0RQaVNhOXFleVV4QkZBUzJ0YlVCYklBc0RkNmF1ZC9mZGpT?=
 =?utf-8?B?ZHpDbjZrVHpyNUJiMG9mTlVRdE0xUzNkZUszTjFUYjNHTUw0cjV3YkFYWVdz?=
 =?utf-8?B?NkFmWGhwWGNwenZYMENwaUV4dXBxelZaUm9PSG9iUnhuY0hYL29pNlV5N2RX?=
 =?utf-8?B?ZURQdFIrYWNGVFlCUkREcUVTVVJnZE0wMkYyTHZ5bFZTblZXWUNpS04yYVA4?=
 =?utf-8?B?NGFoNkJYZVBtVUZIL2tlTGpsRDBHWUJxV2ZoSjc0R0xqUkdmQ3JOVXdDZ1F5?=
 =?utf-8?B?SldSbzBSZlRyeXFKRjhETWprZWl4dVAxVTNrbGRWVW10UTJ2dkdNN2hYRVRM?=
 =?utf-8?B?OVJlRlhjNHlNVFhJS1A4TGVna1hhUldOc3YvVnU1NFJrK3pYaUxFeGNxa05U?=
 =?utf-8?B?Wkw1dEJ0N3JUdmJRaGtYYjNtck4xNWQwM1g5TGNhQnd6TGNQT21PTzNzakli?=
 =?utf-8?B?STkyYVZXVExkclRkbFFjOUxLdXZrMGpRM2F3TWdBSWcwRkJ5ZGI2QnFMa1R2?=
 =?utf-8?B?ZnZUby9MWVR0eXgrTE1kQ1RhSWpiaWxDWWJrVWdlelorejA0NTUyNmk3eDFN?=
 =?utf-8?B?dmRCWTExWDI2RUhCV2Q0S2NXeE9rTm9jVDMzZXVXZVBRU3Y1Y1Fucm1Kb25I?=
 =?utf-8?B?Rkx0czN1ajVXZVRGOW00cUEzQ2dyNVRiSnBHZC9xOEJ1SU1ycGRleEJicXNq?=
 =?utf-8?B?c3V0dVlKbzBxbTI2cFFNZG5PeUtkdWlUOWZIZFd0Wk4wSnJYMVpKTGliWk9y?=
 =?utf-8?B?MjBNQVNHcEZKTEl0bThaeDR2WlZXTlA0SGU2OElhUll2WklKNlF3WmxpcW9z?=
 =?utf-8?B?WXc5S0xleVMvMlJnR1Q1OXp6L0tzQ3YxUmc4Q3hyOUFPS2hVeVE1d1RSWDVI?=
 =?utf-8?Q?IAkEioQQRaQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnYzUjRsaHpJVlpBeDBMQ0RJMTI0Sm01R0RJV1pSRGFmVWRBKzB1czY1SzNv?=
 =?utf-8?B?K2pXbG10b3lGNE4rRkl3aEhLcndsZGZEQXRGVW40aGZkSEVHR2l3MWFCQU52?=
 =?utf-8?B?V29vcVZOclE2UXk0VjFXRDQ4ekV0TExFOUJQczJLbmxlMkhFZlRqRXhsOFlP?=
 =?utf-8?B?K25lU3lFdUJwNjVHQ1RtQnJOa1d4NkdBM1A5b090K09BZGh0Zm1jTTFSVmJu?=
 =?utf-8?B?OWQ0RS90M3NSTi9XMWRPY2tjUEFqT2hwTGhhRWhKTjRuMXJQWGVmM2EyaGhu?=
 =?utf-8?B?U3VVRno1cm9GME1ObHl4dHhuMFJNRzFNdlNhei9zbTF4YWlIenNHREJ2elA0?=
 =?utf-8?B?M2duWWJRQjE1ank1OHZiSWYxaTVwdnJpMWhQSEUvR0pQSTVjbzczT2pSRHp4?=
 =?utf-8?B?ai9lbTdzNXRvL05SengvdC85M2oxcXRRZVI3Rk5nVlNiZTJhNzBFRGJYalpY?=
 =?utf-8?B?SENPNng2bzlscmtkamxtVUlsSDk2TER0OEZBOVNETVR2SDNaNHI2ZXJHVWQy?=
 =?utf-8?B?U1FiamhRUGdkRUN6RStnRmUzK2o2M25FSmx3aUJBQkFpUE5xSXpjR3JqNXhn?=
 =?utf-8?B?QUtGTHZCZTV4ekMra0FVVkg1clFra215ZkxLNEZSV0ZGU3pCRGYvZjlQVExR?=
 =?utf-8?B?MHZjMmU0Q2sycGNWR25uOVJMZDJ6R1RtejFhME5GRlZBU3llNlBabkhJejJp?=
 =?utf-8?B?ODh1cHlGQVJ5Ny9DQS8rb1JtbU9CYjhTbGpySVRpUlJSVVk0ck9TUVNwbjdG?=
 =?utf-8?B?U0ZDMWdJWnFTK3d5ZVlnVHJJaFA5cWowajFtZ2RxYkR0L2h3b1ErMURTa1BI?=
 =?utf-8?B?RXRGNHhXL0ZwRGYyanJUaERTdk1wZEEwaVp2akxPYi84UVBuTzlpMnNUMGpX?=
 =?utf-8?B?b2pJRENFaGgxMGZPRUdScmhudk9ITHp4eXNVZEFBUk9Id0VtUC9hd3VpLzZJ?=
 =?utf-8?B?RnYxVmJOOUFQeDJhRlVtVnBtSjdrWTAxTXNBczgxOTJ6Q0c5T2NUK0RSdFRy?=
 =?utf-8?B?R0JwMTkzQ3pzWEVpeDBtUUNJY2VIRUlYLzFzVUVJVWxGV29BcUtORHpQT3pV?=
 =?utf-8?B?Z1dWZFAwOXJERU5tcERUV0I3dkZpVzdHdVp5QTVJemVEajhuY01BSG0xTER2?=
 =?utf-8?B?azYrL0tYTTdZOVVscDZZeHFWbVVXdEcxMHFCa3N0NkM3M2ltajRPQWVPUm5C?=
 =?utf-8?B?MTc3U2FzaHFNT20rTUU4QjBxeDRsb0xreGlwa3ljakhTVnIxTHIxT0N3YzlT?=
 =?utf-8?B?UTJRUTY3ZVg5SUFqOWVsaS9uY2JQdGJ6L2FPMURsZHVEOFhkLzRIdlc2bGNS?=
 =?utf-8?B?RXpYeVR3aEgxTnVkSmZ6alJmajcyV1hiTm9zdWxSNS9MSXBPL0xlcWtENWFX?=
 =?utf-8?B?Y0lSbkYzbkxnRDk2eGtudGE5VmJpeGNuRUFHS1JVNDNvMFBob2RHNHByNkJO?=
 =?utf-8?B?M2ZuVTY1cHN0elJocUdiRDRiYVE0UnZDQVQ3ZDI4WklaWDNyUHZRR0JOeEVv?=
 =?utf-8?B?M0hHUFJmSCtBTmIxbDYrZURnNmZ5ZllSSjRaZ3ErWUFZY0lmcDI5ek5MQnZT?=
 =?utf-8?B?cnllNWtwRnQxQ3l4MXNMeS93aHA1L1pzVVdJNU5KVlBFdDRZWWdEbW56Y0dI?=
 =?utf-8?B?dzhSa1RMZi9Qa2poczZYZFdTMkRFSjJjUEhJSG02QXlZWitSUU40UDJnaDBO?=
 =?utf-8?B?UVZZMzJMMTFlWms5bWJLNSs4NWpYUkxrTEFmakNKY0VuL2RvamVQWWVLbk1t?=
 =?utf-8?B?NkhKblpXNDRKSmg3VU5oNERLeDduK3pNcG4zQW4wV1F0dTAwYUd4bFdXNVdV?=
 =?utf-8?B?WnlxazVkWUhubXhkK3dGSFg4Vk5xYUpwN3huV1QxQmdHVnlFR3ZPUDFhY2JY?=
 =?utf-8?B?T0xtZDBWZTJSdEFlTjJkd1hvTEJ2WTNTUmVaQkd3MXEvWTFVWEpRbzNtNnU5?=
 =?utf-8?B?Y1hYN3laUzRjTWh1bTlpQzl3RkJRd1l2QTBkS2YvTGNjNGN1SFc1bUIyeGRh?=
 =?utf-8?B?a2NHcnZNTzBCYWNoaHFEbW93cTBuQTFZTDlsb3NEVFJMV3pZL0FXemF1aHRI?=
 =?utf-8?B?d2xXZGJOMDJ6RHdUWStzSktUTWJ6M3U2blN6UDlFM25pQWEyVERnU09rL2dq?=
 =?utf-8?B?aDN1WjhvMjlYTzdxZ28vWTRJcW05TmthdHNBaHpOSngweHhyTHM0eXpuMzBs?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfb7b36-c678-45d5-f604-08dd9dc1c618
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:29:33.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1sDj5zYZOCS0ZZpY9vrt922jmKpp8BZJd7/Wfmgm3ox9tbeLaO2J+z8eHqZonbHcu4HrMJkWRtpqak3FkzPhnKzELhp6F7AQwyu4EvLyjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Fri, May 23, 2025 at 10:01:26AM +0200, Zbigniew Kempczyński wrote:
> Sometimes dumping batch with command is useful, especially during
> debugging. Basic functions in intel_blt like block-copy/fast-copy/
> surf-ctrl-copy) already have such batch dump code. Add similar
> function for mem-copy.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_blt.c             | 37 +++++++++++++++++++++++++++++++++++++
>  lib/intel_blt.h             |  1 +
>  tests/intel/xe_copy_basic.c | 28 +++++++++++++++++++++++++++-
>  3 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 77a03aff4e..8a05f482fd 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1887,6 +1887,33 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> +static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
> +{
> +	uint32_t *cmd = (uint32_t *) data;
> +
> +	igt_info("BB details:\n");
> +	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> +		 "[copy type: %d, mode: %d]\n",
> +		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
> +		 data->dw00.copy_type, data->dw00.mode);
> +	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> +		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> +						data->dw01.page_copy.width);
> +	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
> +	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
> +	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
> +	igt_info(" dw05: [%08x] src offset lo (0x%x)\n",
> +		 cmd[5], data->dw05.src_address_lo);
> +	igt_info(" dw06: [%08x] src offset hi (0x%x)\n",
> +		 cmd[6], data->dw06.src_address_hi);
> +	igt_info(" dw07: [%08x] dst offset lo (0x%x)\n",
> +		 cmd[7], data->dw07.dst_address_lo);
> +	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
> +		 cmd[8], data->dw08.dst_address_hi);
> +	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> +		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
> +}
> +
>  static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  				  const struct blt_mem_copy_data *mem,
>  				  uint64_t bb_pos, bool emit_bbe)
> @@ -1953,6 +1980,11 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
>  		memcpy(bb + bb_pos, &data, sizeof(data));
>  		bb_pos += sizeof(data);
> +
> +		if (mem->print_bb) {
> +			igt_info("[MEM COPY]\n");
> +			dump_bb_mem_copy_cmd(&data);
> +		}
>  	} else {
>  		remain = mem->src.width;
>  
> @@ -1982,6 +2014,11 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  			data.dw06.src_address_hi = src_offset >> 32;
>  			data.dw07.dst_address_lo = dst_offset;
>  			data.dw08.dst_address_hi = dst_offset >> 32;
> +
> +			if (mem->print_bb) {
> +				igt_info("[MEM COPY]\n");
> +				dump_bb_mem_copy_cmd(&data);
> +			}
>  		}
>  	}
>  
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index f2509ab175..54a096c039 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -135,6 +135,7 @@ struct blt_mem_copy_data {
>  	struct blt_mem_object src;
>  	struct blt_mem_object dst;
>  	struct blt_copy_batch bb;
> +	bool print_bb;
>  };
>  
>  struct blt_mem_set_data {
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index be400e3175..bb1a4c536c 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -19,6 +19,12 @@
>  
>  #define MEM_FILL 0x8b
>  
> +static struct param {
> +	bool print_bb;
> +} param = {
> +	.print_bb = false,
> +};
> +
>  struct rect {
>  	uint32_t pitch;
>  	uint32_t width;
> @@ -98,6 +104,8 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_copy_init(fd, &mem, mode, type);
> +	mem.print_bb = param.print_bb;
> +
>  	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
> @@ -233,7 +241,25 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
>  	free(ctx);
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		param.print_bb = true;
> +		igt_debug("Print bb: %d\n", param.print_bb);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -b\tPrint bb"
> +	;
> +
> +igt_main_args("b", NULL, help_str, opt_handler, NULL)
>  {
>  	int fd;
>  	struct igt_collection *set, *regions;
> -- 
> 2.43.0
> 
