Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3FE77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 09:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA710E0D7;
	Thu,  9 Jan 2025 09:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grChG/bO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C783B10ED38
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736414518; x=1767950518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hBn59TjGmLvcefXYUsqbR0YQGbncgi2D8CRh3vH6ZsE=;
 b=grChG/bOjogcw0qyRxBP/zZHz+x+XG/j0YRbrZAhqvU5kXin2stDhtO3
 nXu+7MuxoON7uZKCZelf/ApP4bK89TDpPn9YqaMbNVrt2AywIuSdMTl79
 XvX/MkXenjZaPqvoasH07q06+ryBpuoWVSTWwapno9dAWiTUl4MYI4j1p
 J2QaTMHOoiZdgNI0kaOnKPs46NxvYSdNMblCvpRb0Wjb5aUcfgQPFFjgw
 v38QpR/fJRihcDXvbNYwkWXL8DdgthBt6Et5L6DvNjP5Z4N5i6U2Hgia1
 p7MJgC08GlW8y+LMJyjbf3a9OXgs1PffUvML03WOSTZMrIrPiFlM5fjbd A==;
X-CSE-ConnectionGUID: TtlnT9NpSruwM/SAdeg2qQ==
X-CSE-MsgGUID: MFwnDRN4SYWI+QDLRJ4zow==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36685803"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36685803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 01:21:57 -0800
X-CSE-ConnectionGUID: aRUqPLo9Rie55J1n2V0bpw==
X-CSE-MsgGUID: SCgbRShYQgmMo3K2h+EBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103161559"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 01:21:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 01:21:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 01:21:57 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 01:21:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEXhkpHY5BcX/V72bL4HvE7xC/LZGIFtNYzI9uxboao/ZwFenxwYRK/7Lbzeg/FdO+p6amH07kaxA6TJZOpoznl2DQxAImfiKPduGC9JECZs9mMY8xR7f9yq3iUarA6BRu8tKGYuRzfqd9xX6p6Y5S9sWYcz3VFm33UPH2BZgFqu4TSMC9jIlQ+XvYT0VbKII666Z5SOK6waaIiZiv82CyZQG1bx7uuRFbwY/DhrBfBC6s797HTjHsGZ+9aveYfpqeAExskShraFK7HyeeFOtrSIZ7/ujgnZfuM+drJTqFM5fKJGj30enut5SaMTZCi/JxwS7RNUGfMAaONZ9k1z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKhutbcH/nL6QY9gFiAz0006AnTJS1vqByLGe6fA3KE=;
 b=jnvh0lkPrhfGInAdsoFG/v4OrlqNfCAsYkVIGKEC5TMPViAO1pJ3U3a6UstCcZ0RqHG2Hnnw3k/TtmmB8EcqFhHdlmnbl4BAuzr2z3P3LQCDgRIl4Jyx5mfmfPhQmDaYqtRBZv4UIcYh4cYKWqFREM7DGcRDl+gvHWfzvJ74ILUGJxsdi6qg9cwI4a5z8X4E/c4va7wRnUqPlc72VsdidipvcBlIdcW7pVPOEcmFUuSxRe/WvOyfCb7Cvykm3k+2HY/9++T9ScI7jDLbnTwPV0OqObH2rE3bPgzumRgetY1Sj5Flzg9zjlDGfGLNxizFjhIj1GAzy12LMlJ/9Nrcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 09:21:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 09:21:46 +0000
Message-ID: <aae3f976-72e1-4ccd-9119-4e08eb08ef8d@intel.com>
Date: Thu, 9 Jan 2025 14:51:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] RFC: tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <swati2.sharma@intel.com>
References: <20241217191657.2102779-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241217191657.2102779-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 8555a235-15ab-403f-3f84-08dd308f09e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkpXRGpRSHdaYVRkWFR6QmN4R1ZSWWhBb1U5cldLbDB1aWlhcHNxQ2s1dmV0?=
 =?utf-8?B?S0dENVpXaGhrZnplcFdPeUdTVDlSUlRtZUJqd1JHL1dOZCtUQ3NKajdiSS9q?=
 =?utf-8?B?dFhMdlNtWGZVM1ZSbXRqekRhSjF1bk9SQVJ2bjg3QzV4Y0JSTVJSUDUxY01i?=
 =?utf-8?B?UUE0ZVJVbVdyMGdaQlMwNFIzVWQ0R3ViRTFaTzIwdGdvRG4zU0JWNXh4ZEZF?=
 =?utf-8?B?NEpwMC9iNHZhZ09CTFlKeTVQVWYvbnlST240Y2RqVktlYmM0SnQzTkZvT3R4?=
 =?utf-8?B?aVhEZlYraVAxMHdaaEp0ZlhvWVgwNk41dG5HdG43VUlWRVNLR2NzeXo4MjVu?=
 =?utf-8?B?c0NJYXBtcVI2WHU2NDI2V2VCRWdqY2VQdWxUT0xvcStyVXhZSU9xN083WWJT?=
 =?utf-8?B?SDhNKzdMcnJ3c3RzWCtCVG82WGpaakprTjIwVUhTWUdla255c1pVeTlZaW4w?=
 =?utf-8?B?VUI0SExrdUhSazFsajJ5VlFmWEpOZXZmU2lTOTRJRW95bnpKOVlUR040ekwx?=
 =?utf-8?B?TXJJSXpqZEZDTE85bS81dDg5dDFSR01tNEh2QnpHU2NDZ2ZyNC9Kc3VKS1BY?=
 =?utf-8?B?ZWNNWjVieTdsWGJkVHBCU3pjVENtWkk4WTBwVnFYSDlIS3l4QkMyZW1qT3M0?=
 =?utf-8?B?dVNRbU84VGtGRTJoSVRSN0VRcXFHa0Y0OUdBSndVQmFabVJMNXFnMk5JbzdZ?=
 =?utf-8?B?VkdXM1d3MHhXaU5ORCsvZENDcDZ4WlppTlp2dU80eVpMY2kvQXNBU284Yko4?=
 =?utf-8?B?NFF1Lyt3R05rU0d3Zkxnb0M0K3FqUTZoQ1hIMzlFdHZFZmt1RTZPbnU4NlY3?=
 =?utf-8?B?N0hnM1JxZWNMVkg1Q014Z1NScU9MVUgxaFpSMW5Ec2FKNVFyVy8yTFQ0cHdG?=
 =?utf-8?B?MWMzZms1Vnkxd3dYM3VYYlk0UHczQUVJb0p4UTJiaCtrSmxKM2VJODRGM2x5?=
 =?utf-8?B?M2JiRk5hVzBhS1lKYW1WekJ3R3NBMkhuUk5LNjYxRzRZdldCZWpnbXFSVEMw?=
 =?utf-8?B?Smk1cW81MkVqRXAvbTV6amh1WnBsTjBOQTd0UEkxbHQ0VHhsdWdvQXEyalBn?=
 =?utf-8?B?SHY0TllCRHNZQ2lyOUFyWklReURXbHhURjFsMDQrMmcwWmZnL21zUk1RUWtL?=
 =?utf-8?B?bWR6czdrWHQ5ZTB6bktHYVRBSWg2L0FXRFJnelE4ZDdYSDdKaDVqWTI0czhx?=
 =?utf-8?B?QXcwRVlDdXZmWElualJJQ1R6YXZPTWcvaGFrenBYUi8yVlZibGp2Qmk1dG5v?=
 =?utf-8?B?ZjJ1U1RjR0ZVL3QvNStUcFYzRENJWlVOOVA3eTRVVkh6MmlWOTNKQUQwVFlp?=
 =?utf-8?B?UCtCM1hWMEZ5UVBucHV1V0c1MTl4aWFTeFBCNkJQK2hnR2hhRWJ3eFZ2bTRn?=
 =?utf-8?B?YjllZlRXTGFUZExDZjZKYXFPWnlWdzdCZjI1RWdocnlrSTVmemIwcFpKVHFu?=
 =?utf-8?B?TS9Hbmw0Z2lIVHNYdHgzTXQrTkhHM1lJaENQc09hd0Nsa0pabXJrR3NQbzdO?=
 =?utf-8?B?c0pHeFcycjNaN1RYZXJiNXZMQ3VtVFR5Sm5laDNtOTltdGNucWRlL1g4Y2l3?=
 =?utf-8?B?WVhTMjVkVEROdS9xNmV1aUM4MVc0b3VobGtBdGhka0hrc1Y5Q2NiT0ZNdjc4?=
 =?utf-8?B?RHBQcEYrZTlDQVVUZzRsWXlrVWpVUjN1SDhBcTFkWW5kOWQ3eDZOdXlCTGtn?=
 =?utf-8?B?NUF6ajRLOVRWL0JsRktqd1hnMGpqOXZEc2pJdXlDb0dLYmhub2orVlpFSUxO?=
 =?utf-8?B?Z2MyRTBDdUdGdnAwc01QZlBQN1hseXU3R1k0cmJPVVVMOWdJU0phRXJFeFhQ?=
 =?utf-8?B?Tzh5Z2czMFFKdkxEUy9UMzcraVFEcTF4RURzU0IxKzZ3YkdaQVptbkFYajhI?=
 =?utf-8?Q?Sn/qPNJ5DyPXz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmwyOGxCT0pmaEhOVjJMNU5aM08rd0xFTHN3NDI0bVNYNGJmUldmTGpjM1hN?=
 =?utf-8?B?RnFONmpzaStFZ1FTYzJaRHBBR1hhajNRaHllZFJKQWhZMjNwbnIxbWxZQTdN?=
 =?utf-8?B?NTY5aGJnd2l6Q295bm95Tmx6bC9pM1NSdEhNMnMwTTZ2Z2E1UWlodzlreTZ2?=
 =?utf-8?B?NXlOSXpreWRVZ0lvNEkzTExpTFAwRzlwQ1FSb2VhRUVnMnBQUnR2VDM4SElw?=
 =?utf-8?B?M1hQVXI0Q0tDSThqNTZzNDVVbkE0ZFkxRmQxVStBaDh2bU1FOU1ldjVjMkRR?=
 =?utf-8?B?U3NzYi9YQjJvdHIvZTlOUlV5U0pMeUNERVZYSnJwOUZZdllIaGFDd0l3YUp1?=
 =?utf-8?B?THpIakVCTE13STZoZ29GMjgrWkx3cWE4M2owZ0t0WjB2WEV6U2ZUaXdPdjVy?=
 =?utf-8?B?MHZadVNaKzZ6YkdkVW8vY0hRS1RZRTVEazBWcHA5akdWK3lQUjZaL0NxZTFh?=
 =?utf-8?B?RG5za1FZY0JYWGZkeUpjN0RUUGFoU2JVR2NTWUxhNHFIV0F6MHBvMXdMK3VG?=
 =?utf-8?B?QmNYZlNmVGYvVVJ2aURZcG1zT3lyRmtBeHg5R3o4RmRRak45WnRxeUpmdnh3?=
 =?utf-8?B?UElDMmFnaXJDTjF2Q0xWYXplVW90anVjaDBYWGxCeUZpN0pvN0RWL20zanVh?=
 =?utf-8?B?c0dVdXBGekRxeXJEdlZMY1Y3L3AzVzJHRm5STXZVK2VOSUZvRG5wZXd6OHBD?=
 =?utf-8?B?Vk5rMnl6VUNrWWlSbHFqV3ZhQk52K01iblM4aHNSbWhpelo5YUxSL2dzL3NN?=
 =?utf-8?B?WHo5V3FyQUZ6VjdPMHRDb2F6UDV2QVpHejlZTGhpNUlPaGtBOUxlazg5L0U0?=
 =?utf-8?B?eC8rRGJ2VW83eDZSQUNTbW96ZTdyQnBvdERxa0orZlRXeHM4L3NiRzVwOHlN?=
 =?utf-8?B?TktQTUtva2ptK0haSFF6ZjVaSW1PRmdRTlNxODhWZzJhN3FvUy9KYzVwR0Y0?=
 =?utf-8?B?M2JHd1pqaUtlejhxVWh5cng3QUU4T2YrRjR1aGhCcDNlZUZUV3dqYk9sRVR3?=
 =?utf-8?B?bU1NL2xYc0lyREdQbUROai9OZDFsLzRRSS80U0RTTkF5eTJtOUp5eTRudjBJ?=
 =?utf-8?B?UVF6UmJVK0RoT0ZZWktRbWttSTJDQ0FYT2RZUUQrRXNiK2xlSkgwUFh1bG1W?=
 =?utf-8?B?RFExVmZVdTFBWmQwN01ibm5CZ3NkYUNIWkdraHdwQTk4cTZDNytIUEdwSkdy?=
 =?utf-8?B?Ym5CN2tvR1JybUZTQXpEYS9NU2Y0bjZVN01mTzJVWmNPZUhSMHJ4dlNhZit0?=
 =?utf-8?B?aDdUSzl5eVRLRTFtbTdMY1BMdndjQVNxUXpXUmFtV2dGamhGNE4rcUpwaktv?=
 =?utf-8?B?S3p5WG0yMVY5TGtQVk95TEhHR3BRcCtHTVBYbEoyYTNGaWlrbkZpNkpYdmoz?=
 =?utf-8?B?ZkJFblJJYW1RUXdqR2ZtSEl3T3ozaXpLdmpIZUI5Z01STHRwN3BLS2RYUGVu?=
 =?utf-8?B?YUNMQUVlbVVxR29wLzkzLy9GWFdkbS90SXdLeHZ3dnFETFR4U0Q1ckpTUlVy?=
 =?utf-8?B?QUJvTjZLamE4aENTU2Naa25WcXhhc3k5UjhHTkVFTlFpOXhmcndUV29KcVVt?=
 =?utf-8?B?Y0FJUlozZ25oSHBlN214b0lhRTJxNm5Ua1dUS0ROV0VFTmFMWE9HZ1pRZWhW?=
 =?utf-8?B?QVBlVjJCd0ZZdlZ4UWlPQk5uN0o1VSt3dEdraEhHRlQyRnlpT3BOeHRpUHd6?=
 =?utf-8?B?RXdGTk1PSklUZUlZL1VwdDUxd21CRjBkU3J6dVNlUWlUZERVRmJKaTZac2tm?=
 =?utf-8?B?dFRqZHNCb1lYYnZjL09LQ0tPYTN0UXRLODJXb0lwVWZOWnVwOEY2dVFnSnBj?=
 =?utf-8?B?TFVOemVCUkZ0M1h0R1IxM0dGL2pndnJqUy9XOVZkUk0zZmZaQTVKOWkrcDRJ?=
 =?utf-8?B?eHhjQll6OGFnYVd3QjVQeUd2Wm1vQTJUYkxaM2w0KzV0bW0rY0V6RVNVTE5Q?=
 =?utf-8?B?bkxmZVN5QlJKQlF0V1dGcXR2SVI1YzRzYlVNeTM4N2IzVC95WWhaL2lBR00z?=
 =?utf-8?B?WWRXbHFEYVVMVzNpNmNjeFh4M1U5MjZaUEFoVFRPVEpKZlNtZUpWclNlMUx6?=
 =?utf-8?B?SnllakFtcTZRYS82Ym5vUkFmMitKdExYWG9Hd3BIbHBmMkp2SnJmWEJFUWJ4?=
 =?utf-8?Q?Ni1uHBt6jvRS/xZ+14BYiCvSl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8555a235-15ab-403f-3f84-08dd308f09e4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:21:46.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lg67cya8iLd7YspPQS9QOspe/T7bfH8iEYFI2O6eiLJCLKgUXmQqRBlK41Tg6bWGWERQBGX2tmfGV8VmzH4kcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
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

On 12/18/2024 12:46 AM, Jeevan B wrote:
> We need to ensure that the system does not use a joiner for modes that do
> not require it. This test will validate that the correct non-joiner mode
> is selected, and then forcing a modeset and flip on the last pipe. If the
> joiner is mistakenly enabled for a non-joiner mode, the test should fail.
> otherwise, the commit should proceed as expected.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner.c | 83 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 9a353ee1b..a41f201d1 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -71,10 +71,15 @@
>    * SUBTEST: invalid-modeset-force-ultra-joiner
>    * Description: Verify if the modeset on the other pipes are rejected when
>    *              the pipe A is active with force ultra joiner modeset.
> + *
> + * SUBTEST: basic-non-joiner
> + * Description:
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   typedef struct {
>   	int drm_fd;
> @@ -82,6 +87,7 @@ typedef struct {
>   	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
>   	int non_ultra_joiner_output_count;
> +	int nonjoiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
> @@ -91,6 +97,7 @@ typedef struct {
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	igt_output_t *nonjoiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
>   } data_t;
> @@ -161,6 +168,25 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static bool nonjoiner_mode_found(int drm_fd, drmModeConnector *connector, drmModeModeInfo *mode)
> +{
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
The second sort immediately following the first, nullifies the first 
one. Please check. Also with below loop is this sorting adding any value?
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		if ((current_mode->hdisplay <= HDISPLAY_6K_PER_PIPE &&
> +		    current_mode->clock <= max_dotclock) ||
> +		    (current_mode->hdisplay <= HDISPLAY_5K_PER_PIPE)) {
Although this will give a non joiner mode, do we really want to test the 
first non-joiner mode we get. I feel this test would add value only if 
check the corner cases.
> +			*mode = *current_mode;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
> @@ -409,6 +435,49 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   	}
>   }
>   
> +static void test_single_non_joiner(data_t *data)
> +{
> +	int count;
> +	igt_output_t **outputs, *output;
> +	igt_fb_t fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode;
> +	drmModeConnector *con;
> +
> +	count = data->nonjoiner_output_count;
> +	outputs = data->nonjoiner_output;
> +
> +	for (int i = 0; i < count; i++) {
> +		igt_display_reset(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		output = outputs[i];
> +		con = output->config.connector;
> +
> +		if (nonjoiner_mode_found(data->drm_fd, con, &mode)) {
> +			igt_output_override_mode(output, &mode);
> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode.hdisplay,
> +				 mode.vdisplay, mode.vrefresh);
> +
> +			igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +
> +			igt_plane_set_fb(primary, &fb);
> +			igt_assert(igt_display_try_commit2(&data->display, COMMIT_ATOMIC));

Commit failure is not the right way to confirm if joiner is being used 
IMHO, as commit could fail for even reasons other than joiner being 
enabled. Please check if there is a better way to validate/confirm this.

Thanks,
Karthik.B.S
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
> +		}
> +		else {
> +			igt_warn("No valid non-joiner mode found for output %s\n", igt_output_name(output));
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool ultra_joiner_supported, is_dgfx;
> @@ -423,6 +492,7 @@ igt_main
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.non_ultra_joiner_output_count = 0;
> +		data.nonjoiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -441,6 +511,7 @@ igt_main
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> +			bool nonjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> @@ -451,6 +522,7 @@ igt_main
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			nonjoiner_found = nonjoiner_mode_found(data.drm_fd, connector, &mode);
>   
>   			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
>   				force_joiner_supported = true;
> @@ -465,6 +537,9 @@ igt_main
>   			else if (force_joiner_supported)
>   				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   
> +			if (nonjoiner_found)
> +				data.nonjoiner_output[data.nonjoiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -615,6 +690,14 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-non-joiner") {
> +		igt_require_f(data.n_pipes >= 1,
> +			      "Minimum of 1 pipes are required\n");
> +		igt_dynamic_f("non-joiner")
> +			test_single_non_joiner(&data);
> +        }
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
