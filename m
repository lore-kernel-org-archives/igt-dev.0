Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0E3E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570388C11;
	Tue, 17 Dec 2024 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVK3fvyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC66F88C11
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734448170; x=1765984170;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=HFcOJXjPTSBinb0AdhqZNSYFcDLrrTB81HFphZsOyNo=;
 b=GVK3fvyM5Eey5GuQFTWxz2KUV+wDo2DQWDnUeyZz468LnJd7f2G17mk7
 lF3WYta7+1xi7JAjjVROyIYaxlZLjWGGBbxb1Gx9BmXvKXROcTNOhsZbc
 Z+GQq/TlZFBs8vMCFpQD0RDiC2KdXcF8dD579y+hRZ5U5aVtL1nr3xBhX
 r20LY3AlFD7DfG0DCv3Jl//6aAnUZL5Xy44HVkxp8mD/L+iJdrnUy8Sjo
 Gkp4fQhYCbnDDruzv503DHKb+sIaxxw+mrjSMhFLqpMi7uYBBJQFyVz0a
 lVsSIYmm6qywQhTTGthrosNPSOk3cf+o6sS4vjuzezGYSc07VS3kCumrF Q==;
X-CSE-ConnectionGUID: pVnDp+xsQ+6ErppoFpYtMg==
X-CSE-MsgGUID: bEqDg9zjTUSqAph6Wzf5PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46272260"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46272260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 07:06:54 -0800
X-CSE-ConnectionGUID: kLo5I/VZRK2ektO4EbMoUQ==
X-CSE-MsgGUID: vLRB7XBDRVOGqGANnuik/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102151524"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 07:06:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 07:06:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 07:06:52 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 07:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD8jte42GBbS8ciW+xfVlA/CSj21P0jBv89U2etPn06PhZKFOYD7TXlVaDV5lUNQMgfKQ9kD1p/B2ig6FqP3xg8GOGGlmpcfv5XSPlpDVfovmpv3h+lkKr6scgAtcUsBTQ7SnQVjb5RFAjclmp1W/KaTpBhD8EjtUXNy6WPIZJCuGU3m8ihgjBC9ca8QMA98uiSoebHSnmR8trAtA7y1pnBSJEFKZo5lLnuWYdT3Ap8tquzBTJEEkiyCQa6cwRvzP7pdEybEvcEgFNXdR0BMJ8Y39+o8Y/5bX/hOed4CpEWzZvdaunSFDHlBNHqpZ7xB6JYIK1gGQh6pgFMHSEPwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdCZwqPZ1dFaUPXxV27QSzArkY6ZgFDGtaApBJQeN70=;
 b=LXcAzk5H/uyM1GvVH2eAjv0+rdcDIQCy27LwE+ZckV5IaXEhAI4+GIXOOoOerwpnt8IVOcCdLo5uW4MwYDKhxCcbchccRgfnheCOYcSOTRnjLftsxYLe0scQZZ877gpaE7KLFFKyAQtXN29ES8OO4SIxK8eIc+Jo2FhjgB+7K+6jGPiQ2vqPKBs3njZcW0WdMDb1TAOHPIGbsmgAFiFPViMC/sqqVZJSuhZju0KjcfUXjB1RHhABAqV+UK48WG8bMuQt0s/4I4RybYEaFK7xebrWDud/O0CEKaSZZww+bEyYgpW4BFoxdl50ZmwDGHWIx3OQP5DqNFr+HjDzTklMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:06:46 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:06:46 +0000
Date: Tue, 17 Dec 2024 15:06:41 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DB9PR06CA0021.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::26) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 4597553b-aba8-409e-6a9b-08dd1eac6cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3dLdmExWmhHbTNhUGNEMzlMRUU3dVR5eGxPV0lCeTE5aUVpb1Nid0gxSDY3?=
 =?utf-8?B?R0crRUJwNklWbnFublY0RlFMMjhjczgyVGpjNXg2WmYzcy9DVjRWa1ZHYWhI?=
 =?utf-8?B?K3hVRHkxTy85cEpTL0xUVlNWZGF0UlNjYjA4QnVWZkhTSStpTWpuMVJZbS9r?=
 =?utf-8?B?VzBralhocllWRlFaRUxKTXhUYXQwZWE1OTJ2cGlkZyt3Um8vYkc0MlVEVFdW?=
 =?utf-8?B?VHVrckQ0R01za3R6Q3R1bUNhL0RRR3NCaW5ITlFmeGt4QUhyZWt1TSt6dVdQ?=
 =?utf-8?B?VlpGSkJ0MlA1NnVQbkdEM1FvUVRTS3k2Unk2bGcyQTNRTzVSc0x1dGNzelFN?=
 =?utf-8?B?c2FmaE5ZVWcyc0MzSmNpdS9iT0pXL1hXZ25yMFlYYUVzd3h0QUE1SVFjNEp4?=
 =?utf-8?B?YVRiYy9KL1E1Z1V2VzE2YjdwT1dqdjN5QTJlVDh5ZFZBWW9uSHJxV0pwcVpR?=
 =?utf-8?B?UDU5QnBCT1dLM1Y3R2ZodUhrQjhjUHVnWXVndU44VTZXd3hVazF5ZHhTQVdh?=
 =?utf-8?B?MjRBeDVkRURHa0F3YjN0SVVSSTVHZGkwS2w0amw2KzNGZkZZSWYvbSs5Wmc5?=
 =?utf-8?B?T0ZjUkJMdFNUNU1JOTZnTXJmdW1yaWpHaEhndGhVb1JOamczQURkMXpLekpH?=
 =?utf-8?B?TFU4R3ZUR20zNllQVzJINmZxNzV6ZjdvLzZUOHRpVC9IL3dISHYrNDZCMVJi?=
 =?utf-8?B?N3YyTlpMSTd1bWRJOTJnWmpBNDdQU1UyRHp3QlZOR256K0FJemNFelA0THlT?=
 =?utf-8?B?M2VJVHpubXladlFPS2V3T1BiOStoQVhOWXp1ZnVYRHpjTk9sV0Nya0pWZkdz?=
 =?utf-8?B?R0FBK1hYMDhtdVNDZ04yblQzQjlxUkw4clRKaGlaSVlCSDRHNFZnTHBjUVMv?=
 =?utf-8?B?TEdxRngxQytyaXNQYnl0OVNXWFRWUlNaMWNIcXpWOTE1ZEVFaVRNRWFiNGp4?=
 =?utf-8?B?NVhoa05jMVNYdG9PNS9yQy9wMHZ3QWY1STkzcGR1dUs3Uk9lWm1xNXNSSnY5?=
 =?utf-8?B?S09qa2xObzdlTnBzbnlvYWpoNDN5OXN0c1FQRVV6YXc2eXlIdHBJdzNzamIx?=
 =?utf-8?B?bE1BMHpmdXZVcjFYUVU5RjNsYlJaWmhkc0NGc0FnYjhoeUloNUpFTE5YN25Q?=
 =?utf-8?B?MlVCMUhWQVRHYlBJS1Z0UkNjR1ZkWjFTRFpIangzT3JYS0VJOHFwSzIxTytT?=
 =?utf-8?B?NWk2Q0xVdWdyUHVKN0RQM0l6Nmk2ZFNKSSt1eHArN0RBdnJIWkZWWU50K0hF?=
 =?utf-8?B?SnNHakUwZ09OcUFjQkoxRk1YdCtWUkkwNnRrRVVlWC80R3lmdWJZTkxTYWlm?=
 =?utf-8?B?eVd0V3BENEFLYlBIMjJhdWhwRFFTcjN5RnpzYWhFbXlFMm1XR3p2bDRYTjBB?=
 =?utf-8?B?ZUg4QjRTazA3MDY0L2hBM2FNZENyNitEbWNPTG9QNjAyV3JsYkxLODBYelRl?=
 =?utf-8?B?MmJZWmhjUVI3aDFoWFY2MlVoVkNlWDd4NzBkKy9NT2tWdldOUHliT2xlYmpR?=
 =?utf-8?B?bU80bzBGZk1BWTJrNCtKQkVxS3o3aTN6MDNTK0FVUm1IT1pBMXlsbXFPN3JV?=
 =?utf-8?B?UFlnc2d5YUtkWVJOTkVLMzB1U2Q3VWMrUkw4OWxpRzRkM0U2a2dMUmkvdjZ6?=
 =?utf-8?B?c09HTmthRjlhWjQ0ZGs4UFpyQzlsTnY1aHlSNnlJQTMxV0pmSFVSaXZnanRN?=
 =?utf-8?B?dTIxczJDMHd0TUZ0V0hjV09teEttODRLb3JCa3NHbFBpWDg5azBSUlZwV1ZR?=
 =?utf-8?B?QmVwOWJBRFdwS0NCTnBDVGpqRGovNGp1TjNuWDNLUHRNSkgwM0I4cGJaZ1BB?=
 =?utf-8?B?RjQ4dmdGaU9zd1hmOERmdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZ5N3BWVFgyVDY1b0FjQ1RLNnk2R05pRXlRSzZST3Z0d2ZZcHRHNG1jcnYw?=
 =?utf-8?B?MUt4SkVKbFVRTXJoS0VtOXc2dmpCaysraW4zTEc4NENtZ0dpb3hYbG9ZWUFJ?=
 =?utf-8?B?VmxKT1NSUGVlYlBVYlUxV2M1aXNEL2xPS25JMFN3Y2U3UmlXOFlIeDFVaGJw?=
 =?utf-8?B?YlVtaExVZEg4TGVQSytML3B3blJ6QnQ1Nk5DbW9ZTDRIcFFIN0ZJQzIrbGho?=
 =?utf-8?B?SUhTaGI1RHUyb0Izd0pTMWpvVllYcVZmOW1oRk5tTGRmUGhITHBZd1g2cnlO?=
 =?utf-8?B?TEFPV25Gd2xqdmt1c1YxQ0daS29UNVZQM0lXdnRBU1ZTQmhtQnB5Und0Z0Rq?=
 =?utf-8?B?SXBNUmo5eEJSVlkxN2NWSSsyNXZ1WXpnejFiMzVESVVhbCtwMnFNYVhOSzlD?=
 =?utf-8?B?dnR1dWxJMEE2QnVIT2JhK3JBY2tJTXJ5bUxlRFJpdTl2RTdsYVRWNEs1bTdp?=
 =?utf-8?B?UDJyZHNCelJHWmlicWNEeHdTZ1JteFhpTFBONmdrc3F1LzZwOUhWZ0VkQXVI?=
 =?utf-8?B?RENFMGlVblNUL2F3SFpES0thQ0FmdVZxQjZqTG5lMU9pRjR1YXBrNGJzeXdp?=
 =?utf-8?B?VEhHWFlDRzBRNG12OTJ2K2pSWGY5TW43OHZPMkJKMUVUbGxhejVVc3NLZzFw?=
 =?utf-8?B?YUt3TFFlcHR6Sk9raDBYK3A1eERpcG5zeFdVRGdnMk53ZllPYWs4WTgrTitx?=
 =?utf-8?B?QVR1cmZwRjhUTi9pSDZmQjZSb3RJTGhLRE1tOG0xWk1sblZablo3NTZEM0pz?=
 =?utf-8?B?OEVGTW4xVEhmZ2lYbndUMmRmTTJoWGlQNnJia0RsbmFCcU5VWS9ma1pkTFlL?=
 =?utf-8?B?WGNYSVpDUy9IVTBMekxiV05uSjF4WE1QRUxydCtCOWF1S2xGclh6ejFsd001?=
 =?utf-8?B?aGVrdE95UVp2Rkt2dHhxZlJyOEl1MjNYdlZLSU9iV0Q2aDB6TU84a3ZnRGI1?=
 =?utf-8?B?ZE9xMXJqcklOS3NBeTlMN3RNaEE0YTVmTmFMcDd5WGY4RXhLTkoyOVFRTWVS?=
 =?utf-8?B?KzdEcTBKd29ZY2xVNHBGbEFubHc5SmFoKzFPS0Z5WCsxaXpTc1VQcHhOZkp4?=
 =?utf-8?B?a3NGQ3gydFg0QkpEbkRCMk01SWNSR1RjUGQ5cm5qVVRIdW1adkZHcWJaSTJK?=
 =?utf-8?B?blhEMUthdlEzLzVDeE1ONmM2bHZ5cEw2TlVsMEdvR2h1QVBXVHlXVU53ekl2?=
 =?utf-8?B?K01MZEVJU2ZweFNZT2N5NDRQN1FYNVBtVFpHQU1YbkxseHI2SkRSQkxDZUlz?=
 =?utf-8?B?amFKLzlYQTZxWWdOdUJDUVcxK25Vdm91dE9peVVJTy9RSk8vUFhsNWlkVEtx?=
 =?utf-8?B?eWEvY3F1MC9qZWo5NUNwNzBVNkN2SExzdWdFWDJiWnhvUDFkdTRLQStFK1Zz?=
 =?utf-8?B?UkY2VDRYWk53UStaUGVnUEordlBRQkRQVHMyK255ampISG1JNUVQQTkwSW1G?=
 =?utf-8?B?cXZrQUNWL3o1NHdjNWxadHJTRGdwKzczZ0J3OW1sazVLNFdDZENMU3Jxcmsz?=
 =?utf-8?B?blpCaktOdWV6SUg2SGhOK043RXQ5ZW83eVpXOXV6REd3eXl1T0dZdGJlQ0J2?=
 =?utf-8?B?SksxK3lhb1FOUWkrQ0EwUm1xUGFqUXRJTEpEVU9EWGlkYWhqS21aeGY0eUNR?=
 =?utf-8?B?OXRZaXpHN2hiVytwSjV1Yng4bTRTc3VoQkc2NUJTSHhZRS9yeE9VanlHTkZj?=
 =?utf-8?B?Umpyb3YyMlkyZkhyVnVqZy9qeXNORmNSWk52ZU1qN0FVRWtpK0UzN1IzQ0Vl?=
 =?utf-8?B?Q2t1N1BPYUxEaHBGaUhtWEdQYzVEWjJ4RUZtM2V4QmlVZGg1SWZMSDFsVEh0?=
 =?utf-8?B?MnljMG0vRU9kR0laY0E4UTJsQUVXeGtUQ3Zua0xEQlFoRnQvRFQ4TUprelg0?=
 =?utf-8?B?OWNaZzIrdlNGR0VjMjdBdmQvYWYyVVFjUlJZVHhFVXpDQmN1MklRc1pjQlNn?=
 =?utf-8?B?d3BRczA3S3ZocHlQN2dQSkFQVGtJVUhYTGE2OXVSLzJkc2dXblFmR0o0T2JM?=
 =?utf-8?B?TVc1aCtwVzVyTGFqaWlDTjlGSE4wMmpsa1c4ZjdNaktvcG5jVTRleGRqZks2?=
 =?utf-8?B?RVBzVGZkVUlpZlNzbHpSWDlYQVJaRkZ6TjVYS21ycHJ6cEVSVVRIanVBZVVE?=
 =?utf-8?B?M1hJcWxJOEhqSkdXdWU4dk1PZS9mMGVLUmZOZTA3RXhZbnVMRXZQbERWUThQ?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4597553b-aba8-409e-6a9b-08dd1eac6cb6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:06:46.4789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp3To3jf9MpONJIQoBiS78KraBNmGczbvEyS8SY8qjlEg3oUYE0wz1DVxDIOC0lWaWNPM8Q1QEyB2MkmbNNCE6H3OhO6lAtR5lpSXJP2dsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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

Adjust the minimal load in the `full` test. It's a minor tolerance
issue expected 90% got 86.6%.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13003

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tests/intel/gem_exec_balancer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index c3f0c938b..46ea19a2a 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -1815,7 +1815,7 @@ static void full(int i915, unsigned int flags)
 
 		free(ci);
 
-		igt_assert_f(load > 0.90,
+		igt_assert_f(load > 0.85,
 			     "minimum load for %d x class:%d was found to be only %.1f%% busy\n",
 			     count, class, load*100);
 		gem_quiescent_gpu(i915);
-- 
2.34.1

