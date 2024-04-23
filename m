Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7801C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3397C10EC75;
	Tue, 23 Apr 2024 22:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWgmtGDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15810EC75
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910861; x=1745446861;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2XDns9+PWrnEs0QAABiJ/hBN5vgieyLp7A6BiwnXe6k=;
 b=gWgmtGDQjFvlteNgY5aaCk15DriX3Ja+NzTAHh6IfAuh0mv9x5gwKJLp
 yGhPIsRD/NdecNw+pWl/6FhG5mgUKNcBk1HhkwtfKqi0iXLD7ILuiNWT4
 b9mLzD6kkw9NSEi6AJbAKnG4Zb45GJAt6xH4DizdM3AinxrPkcKwM+sQn
 R31WzxTAwF/EF6Vvp4xgOvsxa8t4OdpfJNC04xlQYnJWoyOQUMFbGSXti
 NtA+b9JeZ1rg8xBSLV3R1rMMygtJ5qYC8MBlikJxb9UQJCEIyHHX+9Kr6
 RpL6YMHrJkH/e9vKWV33wQMjLo1pQS8pJA2NKTqLUeCmLmpiD8/wGt8Mo Q==;
X-CSE-ConnectionGUID: hcLKGtl9TKC2Wxye6gzhKA==
X-CSE-MsgGUID: hbq599EQTG+kyplujbSfDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9736923"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9736923"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:21:00 -0700
X-CSE-ConnectionGUID: VIq9fUZMSLSz1lQ14OO4cA==
X-CSE-MsgGUID: H7cKOHgaRe2QeYAzYdG68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29305932"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:21:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:20:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:20:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbGfs0Rva//7MdotztgFLNMfm7ztiNte57UUs8ILUka7xR0/q8hfcLvVd5pKCAxLEcOqNXFAoYL5mYDDqR5ZHcXlthFyt6oTTwZT4pWGxNNEiDcFAiU0g19FT5J9hwIfUAJOcglpU9g9b0W4Trjb6CDyCMLizdQ6b57qBGnL8dJZFLm+fnb6QKYjlUbqTTn7K2EAvuaKAREGG8Jba/qEjY0vSZQtw0vD3Ky/aTfOZGkyXqPv7IMP9XX5+mc21mwH48rrg85tKq1Ilk2HDUiy/SC+1YxMYYoQ57BrVlaYgDsI6Rjeoh9RZFlKx8Cf9pkdH18necEYbqgXrYs647o8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svUtQuywq2OxZLIKvyRsK+r14YE5jOZlkDy0+m27pNQ=;
 b=RGEVnX6wZ+5CytUJY26PH3n3Ld7JLjX6WcrsarmrFgoGVhXgHETakS/o2KZqOvxrK8rt+/NbwhzuBbhZLQ7MZWjH2yroRcntFemKInhIgrgJY+hvt6ACvQpJVApL4cGV2Moy5luZFWzY0tL4TJcx+t98XBXrMXAEB2CSvh4OLOD72ZYDoKVdlfcze53EfFPBR587DA+mSf0Zh7M25IYB0dMsh/rKXkVg1+urc/LcMhvqJ4w8mVcMvvTpoKpuBeVLX+ZUurLqMLO29amYkOKnAzObQMZnSE+z6o0fk1gKcrtmt7SGw1v/Xa9F3zIkM/Z4/IfkbmsdLRQtoarxUOUC0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:20:57 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:20:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Date: Tue, 23 Apr 2024 18:20:44 -0400
Message-ID: <20240423222048.1285570-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 56facd6c-f6d8-4134-30ab-08dc63e3a58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FGRTk0U0VMeGE1NXZrN3U2dWVTVHIvWm5kZEk5eTlYMitrUnVjUjRuUkl6?=
 =?utf-8?B?bVpUeTZpV2p2UmRLVCtqek80Vkdia1I2Z3ZWMlgxaGlCOVA4U2pRcFBlZVBa?=
 =?utf-8?B?NXNZS0txTnpITW8xZllwTE54VDBlWXVDdFZPQzNRU1pZVnBBV040eGc4eXd2?=
 =?utf-8?B?UmQxWkd3aVNyc3cra2E0SUh2NGZiZGZ1RGViUHZrUFRubnppdTdNanZpcXBY?=
 =?utf-8?B?Syt1L0hFZFdOSVdoTHdHSkhQSENoR29ZMUk0b085a1B4a3BkS2JYdGxCU3dh?=
 =?utf-8?B?UUFhMFNFc25WMFNGNmFHSjV1amQ4WFVqeGVDdXVoaVByTWRsWStydHl1S1JI?=
 =?utf-8?B?N0pnQnBlNW4wNTJ5UTd0dkVueHhsWkoraDlnUElLTDkzYXhKbnNWVmxHd0c4?=
 =?utf-8?B?NHRiZFdYd29UVUFhTlRvNS90enlCQy9wOVpzM2JwTFNCQ1FILzlTU3RXdWhN?=
 =?utf-8?B?T3JUblZ1TEJKT09rcE9FOW9rTXpsRXVXdG1wWWxWWEloR1RicXpaOVdyYWRp?=
 =?utf-8?B?dHc2b2h0cWozblByZkQzQVNRSGxYUW9GVGo0bWpEbFBZZU1jdjBoZGFsbEw3?=
 =?utf-8?B?NW9TdXJ4Zy91YXAxelRDVWw5SGhMNnVucitqKzY2cm15QzlQczFEc1NPSUNK?=
 =?utf-8?B?RWpzNE9ZaFVHemdEb05LalF1M1d5RjhhdVBXZEpoZDJUeHd5S2k0WU9TUHFk?=
 =?utf-8?B?bytEb0lnc01obktwSTlYWWJ3YWkzd2dETTd6cWNXN0lYcEcrZWhqczNVakky?=
 =?utf-8?B?enlPVmhBWDJhWlNuSFU3Y3R4VC91VWVVcUExRnpwQWdnam9HcDREcEFiTWhv?=
 =?utf-8?B?eGVwMEFqbmF4aUZKdngxcHRlc0JWV3FKbEhKZ0FvZnlWbTVpNnZoQ0N3MlVw?=
 =?utf-8?B?eFl5UkJ3R0xUeEFrUjIvc3ExdUZpa0JpTEttQnZyRThkM3dxNXlnTzRETXdi?=
 =?utf-8?B?Vnp0V0lVbGplNStic2RDSGs3MFR6NGsrQzA1UUNpMUd2Tm9vbkFRZS9wQzBP?=
 =?utf-8?B?Z1BlMFFMZ0NYQWpDNkd2N3o2SlU1STJsbm1lQUJWYUpjL01HUHhDbjFzaENw?=
 =?utf-8?B?RnJ3a29aYU5VZnBvOHNXUmVkWUNEbEMxazJ6OElFNENZMmw5aDA1blI0SVNo?=
 =?utf-8?B?cW5ndFFVTDdRdkNBWkFDYnUvSUczNXJDYklhVUlUYlZTSjRGdmlaNFMwcmJ0?=
 =?utf-8?B?YndWemZFajJ0ZUdpTWMra3JhSzlRWG42WFlWSXBMNnFRdHpBOGlDT2lBSTFB?=
 =?utf-8?B?ZXprSFY2aDlFbTF4dnl5K0FqRllaaVcxdnZPR01YVVFDNEkrQlExV3BKdTZa?=
 =?utf-8?B?MzZHbEh4aVJ5TkpZMVVreFRWL1ZpNmQyT3NaSTFMK29wWi9BQW1ySTVIWDhx?=
 =?utf-8?B?U3RxUFRqNExrTjgwNVN3Sm9pM2hBcXlvNXRjdHFMVXQyWm5aTlA1Y2VOSGI0?=
 =?utf-8?B?NjdTeHJqcEFFbjJQazh3YlcxVFdQckFtdXRNTHFValNYVVVVQnJBNnVWV2p5?=
 =?utf-8?B?ZlhQQTJacWtaQlU4THA5U0R4bHdtbDFTazBuUCt4Y05JbEdNWHVIdW1hV1U2?=
 =?utf-8?B?TzBXN1REM1ZWbTBZTFV5SFV4VkpwQTAvdHpIMEZKeXU0NlRORjZZbmdQb05z?=
 =?utf-8?B?YkJPeDVhMDNCOXZvVzBlUVhFU3FuR3JtRUZpNUdTZCtnRDQxbkZJSHEwRGdU?=
 =?utf-8?B?MVBubnJ0bmdlWmVhZkVnMStXZXoyZFQzTTB5UUYvWk41aTY2OXNPc0lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFp0SWVRUWtxYlh4OUZkaWNhTWZvbmtyVmVwbStCbTJsM2J6TG9xc29PWkxs?=
 =?utf-8?B?OWtlQTVDd1ZZWTRnTTUyTUNJWlpWb0ZqdzNBWGwxaGs0UlZMQ1Bsb0VWUE1Y?=
 =?utf-8?B?LzUxcFVCZmxTTzZqWjlrdE83R0x5QmpFT1BLMTJIKzFQaWkwWnhNY3Z6YytT?=
 =?utf-8?B?cFd3aURnUW5TTUw5ODc4dU9YSWxwemZmaWVQV0k0aktGOElCUXp4UDdmZFBl?=
 =?utf-8?B?U2E3em5PcUF5N2RQaDhJbk8rNFErQmxoOW43MVgreFdDVXI1R3BpMmNDZk12?=
 =?utf-8?B?cUxNNW0rYXkzTnh2dFJMV2RpRTlGSVlOakpZK2pvZVBjaUhjRDFqcnY1RHV5?=
 =?utf-8?B?eVM5YXBMMHJrSDVuUXcvNEVWdUd6b2hsb1pvc1hFeGF4UkVqV1Nqa3p5SXR5?=
 =?utf-8?B?ckpHUGxha0RqRGZvY3RlSjY3YzduMWQydE1vRzMwSFh4VVkvOUJ4SnAwbVoy?=
 =?utf-8?B?Z3hUc0o1YUltK3BFL0FYajJWOXpMRVZEUU8ya2F6bWtwdlhLdmhVN085T0xj?=
 =?utf-8?B?K3JEL25RWWxkT20zSi9mTUJYRVMvNm9GLzUxd2V0Q05weCtUK3VqM1RSS1dP?=
 =?utf-8?B?Qzl3ZDhxUVpWOHR5TTZQall2OG0vNlovcVo2QmNkWkRNSi92OHBpSWRRTjZj?=
 =?utf-8?B?Ym9NVzgzMEEzRE9xRTVsVlR3eFV0Y0R4dUVMQ1Ryb0pwekxnb0t1QytTM1hJ?=
 =?utf-8?B?cWM5ekEzM2dBb1JRMGRtazhpRVRjUG9Ed0UwZ3kwSVoyNXZFc3dGd3lNSGJB?=
 =?utf-8?B?QS9iWm9xam5kd0prOTA2WVlEaDRtc2M4a083Q2UrOEdsUHdzY2F0MWVPYksy?=
 =?utf-8?B?OTQ5dEVJUlgxZzgxMnhMZVBsVWk3TmlzdUNaUG1xNlJqME9FWThPajBxMGxy?=
 =?utf-8?B?MGhGWTIzNDhFL0hTVWE4ZmptQkxWbVY0ZjhSdDM5REMrZ0VZejJhdW43ZmZR?=
 =?utf-8?B?Z0hva0xnaEdoKy84VDBQQzYxMk5BVW1EZnVRYkVPWC9ma2d5TXZXaGhjVGpX?=
 =?utf-8?B?ckNiRHNRUHFPdWdEQjdYdjFNYncyYzlkd0xqTlJ3eTZ2UVlKeHVrQTllbjc2?=
 =?utf-8?B?akVkU3pxVHI0SDlyYlZLbnd6Q2VUN09ka0p4WWhwd1BYenlEdW5TNHYxSUtq?=
 =?utf-8?B?Yi9QeHlxMmJNWFh3SHdTT1dHNzdMZW00QVBQZndoNjM4cm9paWJ3ako4OVJ0?=
 =?utf-8?B?bEhJUkVLaHFXN0NXck5pZ2FqUjZoSGVPZnBZUHFaaDd3VWtvZ3FNSXhVcDdV?=
 =?utf-8?B?amU5NmQ1VTRhbUxSUGs4VDRuT1I3elpCQmR4UkxDMjlQbUVNbW5HVUpsc0Zx?=
 =?utf-8?B?QUYzY2loVTJBZHZFTU9LbENYWHpGaEhjbUxveDVrdGxQQmwyQWd3SjBpUldP?=
 =?utf-8?B?VjdvOWgzeHpPWENqYk9mMHVmTmxhUTZjSVpKUjJXZ0dSQTgvNUFrY2YvcnlZ?=
 =?utf-8?B?eWNzUkkvRDZSdkExMWh0UnBQU3duRFIwbUVweGpudHVxR3FZbk1xRFhmY0Jz?=
 =?utf-8?B?dHN6eGVQS1pqUjZ2ZHlpQXRHVG9IUlFBMmllZUxHYmNYOElPVmNkV2lNUFJV?=
 =?utf-8?B?MGdmK3Y1RVRXQkZvcjBZcWUvamJVS3FSL1BTenplcGN0a1VweEdpUCtCVHRL?=
 =?utf-8?B?TVRUVlBNbU41ZVlaanR4UnlBbXE0UVl3bE5xMkdqblZ0b0dxNGJ0U0FXRzFy?=
 =?utf-8?B?c0FuQ29jQkYxWTRObXdoRXNZbXdDNUJJKytjb0ZVV3praEFBRi9OZ2w2dlJS?=
 =?utf-8?B?enN0dU5lZmphaGFRRnlQRUQ4SndlaGo2aTNhelkwK0dtQStJM1VYNmJTQTE2?=
 =?utf-8?B?ZUJFbnBnb3ZIbEF3Z2FoRyt5UXNTVml5Vm90V200V0xqdzN4ZGJnaDJDeEJi?=
 =?utf-8?B?akFkdk1VQUhUOVhlWWN1OHRsL3IyMGRrM2g0TjhQLzNtemYxUGIwallVbFBm?=
 =?utf-8?B?cFIrelpybGdUM1VrQ0xyQ21oN2JvZDJtVHcvN3VPOVRkM3BRaGFWTnQ1Y1RT?=
 =?utf-8?B?MUhHWnJLMk5SK0dRQVoyZUZheHhrR2w5aVVSMG4zOURjcDBHWDFhUDhtVnZB?=
 =?utf-8?B?TFgxNGIvQldDeFg2Y1p3bmJGMjgxTlpBY0gwZTFibXVEVk9uWHgzdHhGNEpS?=
 =?utf-8?B?eDZweUhwcFdTUVAvczFEWklXNG1DZGFJVGloSXhiKytSSUtHQzVrZ2RBb2da?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56facd6c-f6d8-4134-30ab-08dc63e3a58c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:20:57.1418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+M5whQ1k+/Wzsnw7eZt8AHEFIo+pZSXCJpC00sTO+7fIPJZo7SprM/MfUClsV/GrQhLIVkUtf5/f1dWcg7ERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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

Let's inject a gt_reset failure that will put Xe device in the
new wedged state, then we confirm the IOCTL is blocked and we
reload the driver to get back to a clean state for other test
execution, since wedged state in Xe is a final state that can only
be cleared with a device rebind/reprobe.

The fault injection of this test is entirely based on xe_uevent
provided by Himal.

v2: Use rebind instead of module reload (Lucas)
    And other improvements also pointed out by Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 108 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 tests/intel/xe_wedged.c

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
new file mode 100644
index 000000000..f2587cc43
--- /dev/null
+++ b/tests/intel/xe_wedged.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: cause fake gt reset failure which put Xe device in wedged state
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: wedged
+ * Test category: functionality test
+ */
+
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_ioctl.h"
+
+static void force_wedged(int fd)
+{
+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
+
+	xe_force_gt_reset(fd, 0);
+	sleep(1);
+}
+
+static int rebind_xe(int fd)
+{
+	char pci_slot[NAME_MAX];
+	int sysfs;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+
+	/*
+	 * We need to close the client for a proper release, before
+	 * binding back again.
+	 */
+	close(fd);
+
+        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+	close(sysfs);
+
+	/* Renew the client connection */
+	fd = drm_open_driver(DRIVER_XE);
+	igt_assert(fd);
+
+	return fd;
+}
+
+static int simple_ioctl(int fd)
+{
+	int ret;
+
+	struct drm_xe_vm_create create = {
+		.extensions = 0,
+		.flags = 0,
+	};
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+
+	if (ret == 0)
+		xe_vm_destroy(fd, create.vm_id);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: basic-wedged
+ * Description: Force Xe device wedged after injecting a failure in GT reset
+ */
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("basic-wedged") {
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+
+		igt_assert_eq(simple_ioctl(fd), 0);
+		force_wedged(fd);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
+	igt_fixture {
+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
+			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
+		}
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a856510fc..65b8bf23b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_wedged',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.44.0

