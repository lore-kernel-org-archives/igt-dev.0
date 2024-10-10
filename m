Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61713CF07A5
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 05:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61FE10E85D;
	Thu, 10 Oct 2024 05:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA4L1A4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7795E10E85C
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 05:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728537164; x=1760073164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cVifxCGE3NlnLzhcOSMQU5jqJDi2zr5ssL+NNXSXXaE=;
 b=CA4L1A4lRg/MfBuSLoN+yz66HDXCvNFcDC0BqtAq8O2y3DKqE2nW5uZR
 iImqD84t22LsHC+IwUDDbFFareXqAPe7/JtKB9RDw5ZsTG7iW/ROIBSmX
 2GCmrX4IbkCRKf/PK8qHbhdjlPKYTtEEF5TW3AXGrEoQ4Fv6qptOJsmIv
 Zz4TUWUr69EpTxHWTRMVgI0byfIB0GYqjvmRlLs9Y8Lxhtnp/1CGTEDpY
 a0p3Ft3CCnz3t+bWGTvsT/u0999kNC8BJjmbWfYLd7ReMGxeTkxuDqg65
 xEaFGDM1vkKRr0xnnNdxvcS2hAFQn3hFqj/349K2n5f7n6uTIrGUPXUd2 w==;
X-CSE-ConnectionGUID: QMr1yDnCQIaPhLDOwv99+g==
X-CSE-MsgGUID: cCzxssWTSWueigE+PTQATg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27318981"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27318981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 22:12:43 -0700
X-CSE-ConnectionGUID: y1lTXmtnTQaqntBJj9kxGQ==
X-CSE-MsgGUID: yc3DuC69Rdmc5Y978endOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="107205075"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 22:12:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 22:12:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 22:12:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 22:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNsmIhMFBukPz0SDfChEAmzcAq/2k2aTaUwnrqULpkGL2EiBQWVLjQG5Fjn+XpcipWYDY0lez328q9wP8Rkeg7XqjDUKLX7l1GLLTRzuO2YeogwZoa9GJh9NLyUQQ6mqhtTlCnh6CmOeh1irr2DYfj2FtumKo14KNvfk2kG//N0YCAzVeqEeBKl8fHxSVgrQjwvtdfeha7m4pooQGJORyuXeqZN2ka2PdT44zJFdtRTlbIZgVCtrJyXylKRiITL70B3NEROuKsIhht/SIMpsJnLgKrxNRtAwpbSUXym2QtOB6/ipaxC/uMqGYZvLYkj8QA3MPCTjhWDEnUuJzvQv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twDkgdNnnUbDfEuqI7AHdne8ONdGCQtH2FRp+YXWkSc=;
 b=zLuyQgdBv38ncUMRYrx4hHDtfzLWFH00eK7Mv40iJu2QT8MCl7pNpPZg/luEj9wztltKuqMprXckl1ldR+oLUjWhGRvK036cFa6j4ON8wkGNhd05trc8JgBHLd/JrV+Z2elPNqqnGmmZkWJ7M7S2R9tnDQb7ianTy5usmYpjbK5XyOltvD3WCxkLYUuX1oPrjLh3WpYGxZlU4lQW4MCu0YHovInfaW+Cjnv5GZz8lJH8p0Q7KqeFGqLqDPFhsvEC5aM55tdHw6ihKBFXAsXiLaPRCOt7QdUL3R0sINFptjzHRh7PCgxXGSaIKLKgCJdvThNo1ShlnrapmgH7AzZG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 05:12:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 05:12:35 +0000
Message-ID: <9cf15121-2f87-45a2-93ec-ade00d3c1c7c@intel.com>
Date: Thu, 10 Oct 2024 10:42:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe: Add tests to validate GT coarse power
 gating status and toggle coarse power gating states
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
CC: <badal.nilawar@intel.com>
References: <20241009183115.1981713-1-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241009183115.1981713-1-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: c18a7b38-1cdc-4332-0e31-08dce8ea268f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmJTMXdmTUYyVW9zcWJ3Ry9NdjRxWnI0OUNFRFpkVFY4RStSQmw4SGd6SVQ1?=
 =?utf-8?B?TndkdWNQMCtUWFExVndtOXUreHNNbndkelF0bjR6dUFTaTJITXh5K0dwTFNj?=
 =?utf-8?B?eVdzUld1Q2NKOU05T1cvNzZSd2szWXJZN3N2bTVlZU9HbEsvOGJxVVZVb3Vv?=
 =?utf-8?B?WXJrTTdZL0M1RzQrMzJSRHFDeG10STg1VHhmRUF4bjNyaFgvYTBhbUNPZDFW?=
 =?utf-8?B?MzZ6dDV4aTZVVmFCQzRaRzhnL21QTVcrVGhQRUxNVFJXNU9PYm51dWdsVlFu?=
 =?utf-8?B?Vk1JM2xkSCtCcWNFalhvMnBXKy8rRVAveG1nUUhQUHNoaUs1U2padURSbU9N?=
 =?utf-8?B?THIvZ2pZZ1FPc3owY3N1bDJGWnYvWVZ5NDM5UkJ5UVUyTUw1ZTlBVk5TWU9X?=
 =?utf-8?B?MHNRWXdkQVZyM3pMcWhqN09LU1JDcmZOQVBpR3hjaVZSQzRlMkZ0SCt0TENo?=
 =?utf-8?B?KzIwQ0pLTkZCQXRZZjRlUFhxVmd5d0VhZDJ4Z1UxOWxNTWd1eGo0R1lCODls?=
 =?utf-8?B?L01lbUlwODZFMDFqanlQWDJyajU0UG9XTTNaYyszRCs0clo1WjV5eUk0amJ5?=
 =?utf-8?B?cVdtRU1tS0FpeC9EancrbGRrYlVJSTlrVDk1OHdJVy82VmZEdEphUjBGTUg2?=
 =?utf-8?B?RlQ2cFplbVRGem9SMVY4T1h4Rm1kK3g4cVk5ZlJJWWpxVjBueXRCZm0yUTFv?=
 =?utf-8?B?a1J6UnI3UGFxbTdKNm5DT2czU3AzZkozYTh4bEV5S01rVVpaNjIvbzMxcEQ3?=
 =?utf-8?B?TFpwRFVaanNicFFxRW9RRjNHYzk3K1U2Y00vRWwxK3h4amtjMXRiS2hvTUhq?=
 =?utf-8?B?YUFURU5kdVl6Mm1EY2lhMDgvTFF3VXRVQ2N3cjc4STZvV2RrU2ZYazZXaWw1?=
 =?utf-8?B?NThIMXl6Z0JKVXZTbVFFeGRjSU8rQnl5Y29pS1FDYU8yZ1BHSUVueHlmQ3Uy?=
 =?utf-8?B?M09GdG1YK0U2RWorckdsS2U5UlhZdDZFTzRTeHl2UDR0d2REaUttTXlrRnBR?=
 =?utf-8?B?Y3VwdHp3WkFQU1RCb0UzZW1jS2F1cSsxL3QxS0dyczBjUVNHdUt0NHZLdm9h?=
 =?utf-8?B?TjdtOVNhZGo5Um11Vlppek9YQzl1eXJmaXZlTFp5cllKbWdpY0hrblRWbUY4?=
 =?utf-8?B?c0pUVytDT052OVRqUTRvMnR6MHNqT2llNmtOMWNML1lwMlpXcmd4c3Fsdm1F?=
 =?utf-8?B?YjhPWmlabFpXMzFzZit2QU85Z29CYmN1WUt0VUw1RHBHMHFTWEIrZGEwWW1q?=
 =?utf-8?B?TXZ2N2dEUlhncWgrZTQ1OUQ5KzNUbkxJQ0taYXlqTTJMeWxBTDluaHZaNzFJ?=
 =?utf-8?B?R0Y2M2xDRU5UTzRkR1EvVmdoS1NqZHhCem81QnkvQ0cvbm84Z2p5Z1RBQTFP?=
 =?utf-8?B?aVRiK2xIdGYrcUZZVGd1dmt0NHRRY1BUWVdvM0dEajZHQzF4TGdCSGw1MjQr?=
 =?utf-8?B?bHhrZ2tSMVovOGVvYWdnb1UwUDdhZitSMVZQcitNRko0R2tnZm5VUUdkRUtG?=
 =?utf-8?B?M0JWSm9YOEFuZk1YUmdkclRwRHFzV3lIWU5RczMwWkV4OTJWTFB2VTg3Mklk?=
 =?utf-8?B?NUJFdXJYT3hGYlU1VGtLcXRIOGFjU2ZnOHI0T25MTDhvOWVoZXNOd1VtbHps?=
 =?utf-8?B?amVFVloxSTY0Y01qNmdQNERZdU15QWpCWm1WbGthRDd5SkhCR2MzZGxCSkhY?=
 =?utf-8?B?WkZxWUdPVUZScGhoYkhZSWcrV1RwTjBraHpNSUkvUjkxa2NPVVEwdEJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pPbkZwRnZsZEN5Z0oxVWI1ZDkzQUFoMk1KTzRpUWJYdm42azg1anZzRkJh?=
 =?utf-8?B?QUd0bU84Y2ZETnFvTGQ4VllxNllIQVBKc0pSUkdrZVd4aHRSQjlHSXpQeFo4?=
 =?utf-8?B?NnhBQzBGN1lZVHhDYTIyNE80dFdlaWFnby9sOFR6c2VzUEl6a2RPeXAya1Bx?=
 =?utf-8?B?QTl5bjZBYmRIRHAvNDk1ZXJ4Q250dGl6a3Z6YUw1U3dMWWg3ZnhFc3QwUGhS?=
 =?utf-8?B?NFl1eVVidzVBdXZkUVF2UytvSkdpRG9UMHkzQUprUklLVmw4c25ySWpybGs4?=
 =?utf-8?B?c1Y2d0dqVTJUMnkyM1lNOUhPa1dqdHBKdHZCVEFTK2twb2N5bVZNNk0wcVVa?=
 =?utf-8?B?MCtNTWxwZGdHMEVDVWNNeGUzN3BYdnNua2dZdEc3R0RSK2NNcnhLRkVoeFJI?=
 =?utf-8?B?RkZYZjlNWFBmMFlhNEtvejZrd0YyTTJuRSs4M2IxSVdZSm83QnhGbE9zN0Vm?=
 =?utf-8?B?WTFDNTVkdzZjM2w4T3M2MG1ORGlWWUZCWVRQNm16WHVWYXlEUWlOeWdlSzJL?=
 =?utf-8?B?MkNOSFZxU1BvcnVVSjdYYk13Y3ZMWU9WVnRPZkpwcFMrK0J3dDJTSXkwM3ht?=
 =?utf-8?B?bGVMdHJGUU0xMTlOekp4WGdFazk4UEFBbFZ4YUoyam1qamxLcnQ1WlE2ZXhr?=
 =?utf-8?B?a3FRbG9ZbHFrdldFSFJmREl5VGEyaXhHQXUwOW85UTRZa1N3YXNGMDdpaXZT?=
 =?utf-8?B?a3VsaHU4b1dsc0hQaXNHVDl5WklHVmZ5NGJmbE1UajZQd1FrK2RjVlZLdWlV?=
 =?utf-8?B?cXNHaFZFOTA1R1pSMTZIU1MwWEJoQjBoWEFRZnV5WC96bk10djJyR2JUYmlF?=
 =?utf-8?B?UGVaWUo5UG15dENVdzZHWkRZd0FxRS9YWGloUXRWdzRiK2pmdzNRNjgwWjRs?=
 =?utf-8?B?TGNHaXNSWG9CeWp3NzdwbGNRMkdXeFY3bHVQbytVa3VBcGNycElvVTRqWWY5?=
 =?utf-8?B?eE9GajVZeWQrWUZRbTlQNzNObXZEVWpuRkZ0Wjd1OGpZbjZjdThHcUpPRGx6?=
 =?utf-8?B?bHUxMmxQSlJmVG9JZml1dFdDc3Zabit2TEMvYVRQODNwWVRWUHJKU3A1MFBm?=
 =?utf-8?B?dExiZDdYUlpVR2RtNVluVjZrOGsySC9xbDZGMjN1TmNtaTI3RndLTm9YVlpa?=
 =?utf-8?B?a3pYQkRFOUNvQ1Ayb3hkWDZONzlIbkt0WGJobkpJUWw1M2RvaFYvMlQ5Qy9o?=
 =?utf-8?B?V3dzR2FmU25kMURWSFg2dXQydnZyOEcxS21zRjBwSkEwaElMWjU0LzBic0xO?=
 =?utf-8?B?eWtGeXFFVy8zWnBxaWtZSFVjOThvbWRRYVJpK1lvWGJlQU9qdzVwTFBNU0Qz?=
 =?utf-8?B?eVRNK0I5VlEwcDZOcVhzcW5KT21ma0xaWWZXYmdGOWk2ekRQc0hXMThKQ2lD?=
 =?utf-8?B?ODVaaVh4OVRGV0VkSTJUN1h1VDg1aFlzK0JQVXdxZUd5a08wUHBoalNRSlEr?=
 =?utf-8?B?azJXM2JOMGdEc09IaHVNOE1pb3BKbm1qRXZtb1I2cjEvV3dBSmZOK2l3amcz?=
 =?utf-8?B?WDgvb285bnJpTEZycVgwdFBFUExmSXFpZ3h4dzhaRkdiMnh0aFVOcE1HSVFo?=
 =?utf-8?B?OHJXSnRxdVhxUVd4TDl2VkpYNEpUTnlHUnVqdDRjSFpuWFdiQmxTQjdkaElO?=
 =?utf-8?B?T2VuMitEc1hEZGoxVkV5T280MVluamM0WnZLUWpueDF0WUM3NEJ5cWVuY3Ey?=
 =?utf-8?B?NE1PNHRpOHNqTnpvdUJNZ2dMYTdLSk5wMGJzcXR1dENtd0tYaXZPNXRRNENW?=
 =?utf-8?B?ZjEzWmxSRmprcTNOUmlIb0ZLZDd1ME1IUmZwWjJjVWhoRmJpQVNUQmJqb3FM?=
 =?utf-8?B?djdiRWU0bHBzRitqYWVTMUc5YUF1eER4OCs0US9hWEdzbytmVkVBQ2R5Wlk2?=
 =?utf-8?B?Sk93R0tiRnluUm1hQmtYOGRTU1hsWXhYYWgrNHRBekEzYmJ5Q0pHVzljbVlN?=
 =?utf-8?B?RVNZVVBSVVJ3OWZQbWphVWg1M3MraDA5VDZuOEs3S0RsS1pSazJTZlE4OVpG?=
 =?utf-8?B?K01TVVplckVjemRENEl4Nm9KM2xYemZiaW9ydDRKcU0vclREMzdERkJvZkgw?=
 =?utf-8?B?Nm56Y3J1TTZhL0N2TmhzVWkvR3FWV3l1RS9RTXlHQVdKbUZkTmR1TllsU1RH?=
 =?utf-8?Q?+YxfdxfiVjwGOChDOKTQ59IYd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c18a7b38-1cdc-4332-0e31-08dce8ea268f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 05:12:35.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wSO3AHXcoUoRNNFJLEPe5agJ8pySf5SL6CtJFDdeh5VgCSoJivTEyT2V1cyevpt+rnRaGUKxxAZoTopY2sCKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
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

Hi Anirban

On 10/10/2024 12:01 AM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Implement test test-cpg-basic to validate coarse power gating status
> using a suspend cycle.
> Add test toggle-gt-cpg to check if GT coarse power gating is up when
> forcewake is acquired and down when released.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 104 ++++++++++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b57..4245ea877 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -40,6 +40,7 @@ int fw_handle = -1;
>   		     (double)(ref))
>   
>   enum test_type {
> +	TEST_S3IDLE,
%s/TEST_S3IDLE/TEST_S3
>   	TEST_S2IDLE,
>   	TEST_IDLE,
>   };
> @@ -63,6 +64,12 @@ enum test_type {
>    * SUBTEST: toggle-gt-c6
>    * Description: toggles GT C states by acquiring/releasing forcewake,
>    *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
> + *
> + * SUBTEST: test-cpg-basic
remove test
> + * Description: Validate GT coarse power gating status with a suspend cycle.
> + *
> + * SUBTEST: toggle-gt-cpg
> + * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -317,6 +324,94 @@ static void toggle_gt_c6(int fd, int n)
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }
>   
> +#define RENDER_POWER_GATING "Render Power Gating Enabled: "
> +#define MEDIA_POWER_GATING "Media Power Gating Enabled: "
> +#define POWER_GATE_STATUS "Power Gate Status: "
> +
> +static void powergate_info(int fd, int gt)
> +{
> +	int dir;
> +	char *str;
> +	char *render_substr;
> +	char *media_substr;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
> +	igt_assert_f(str, "Failed to read sysfs attribute\n");
> +	render_substr = strstr(str, RENDER_POWER_GATING);
> +	if (render_substr != NULL) {
s/if (render_substr != NULL)/ if(render_substr)
For all if conditions below
> +		igt_assert_f(strncmp(render_substr + strlen(RENDER_POWER_GATING), "yes", 3) == 0,
> +		"Render Power Gating should be enabled");
Indentation. Should match open parenthesis
> +	}
> +
> +	media_substr = strstr(str, MEDIA_POWER_GATING);
> +	if (media_substr != NULL) {
> +		igt_assert_f(strncmp(media_substr + strlen(MEDIA_POWER_GATING), "yes", 3) == 0,
> +		"Media Power Gating should be enabled");
Indentation. Should match open parenthesis
> +	}
> +
> +	free(str);
> +	close(dir);
> +}
> +
> +
> +static void powergate_status(int fd, int gt, const char *expected_status)
> +{
> +	int dir;
> +	char *str;
> +	char *status_substr;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
> +	igt_assert_f(str, "Failed to read sysfs attribute\n");
> +	status_substr = strstr(str, POWER_GATE_STATUS);
> +	while (status_substr != NULL) {
> +		igt_assert_f((strncmp(status_substr + strlen(POWER_GATE_STATUS), expected_status,
> +		strlen(expected_status)) == 0), "Power Gate Status Should be %s\n %s\n",
> +		expected_status, str);
> +
> +		status_substr = strstr(status_substr + strlen(POWER_GATE_STATUS),
> +		POWER_GATE_STATUS);
> +	}
> +	close(dir);
> +}
> +
> +static void test_cpg_basic(int fd, int gt, enum test_type flag)
> +{
> +	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
not necessary
> +	if (flag == TEST_S3IDLE) {
you don't need a flag since there are no other conditions
> +		powergate_info(fd, gt);
> +		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
you have mentioned S3 but using s2idle. Use SUSPEND_STATE_S3
> +		powergate_info(fd, gt);
> +	}
> +}
> +
> +static void toggle_gt_cpg(int fd, int n)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(fd, gt) {
unnecessary parenthesis
> +		powergate_info(fd, gt);
> +	}
> +
> +	do {
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +		igt_assert_lte(0, fw_handle);
> +		xe_for_each_gt(fd, gt)
> +			powergate_status(fd, gt, "up");
Need an exit handler for this test. The forcewake will be held
if there is an assert
> +
> +		close(fw_handle);
> +		sleep(1);
> +		xe_for_each_gt(fd, gt)
> +			powergate_status(fd, gt, "down");
> +		} while (--n);
Alignment. Remove loop. Not required
Once should be enough
> +
Extra line?
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -380,6 +475,15 @@ igt_main
>   		toggle_gt_c6(fd, NUM_REPS);
>   	}
>   
> +	igt_describe("Validate Coarse power gating status during suspend cycle");
> +	igt_subtest("test-cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			test_cpg_basic(fd, gt, TEST_S3IDLE);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing forcewake");
> +	igt_subtest("toggle-gt-cpg")
> +			toggle_gt_cpg(fd, NUM_REPS);Indentation

Thanks
Riana
> +
>   	igt_fixture {
>   		close(fd);
>   	}
