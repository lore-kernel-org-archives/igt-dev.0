Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1094C19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 10:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CAD10EB25;
	Fri,  7 Mar 2025 10:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa+MXIr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78BE10EB25
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741342915; x=1772878915; h=date:from:to:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=MGDzrAWqlw1272s65hLzxJdBuE769eA31joVaxrGjHE=;
 b=Pa+MXIr5FQ3373/UGoJjCWz6WZFRTxNSnwcUSltR/DorFnI0+byZNb9t
 pW3neOTBIf/+6R184EMZvP/cUWAQdvShNj4FY8mjlAeNjHS3ek4qpCDtR
 o0TJ7T69LUdx47TY8OwbE+aEVI1t7y87zlqSFIXPiebiDDY84wuAEg096
 ie7VlD4yA9vPO2RQH1gJYBARPMQCohWinopBE4aFKbtZndCfpzHFuCnll
 oofEfXL/WAGX9DbcsTso6lfrpMTUBv5nVgro6op9BjLlnIkcYx/Cy1G3A
 a85kvWMK83eaWgdQux6v8swt84/D0ErS+1IRJ5CWjX5q466TCRUZpKV0k w==;
X-CSE-ConnectionGUID: 2V6i0jJzT229fkmW4TGXMQ==
X-CSE-MsgGUID: L58N/VPqQdqc3bmR8RhIwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42421213"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="42421213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:21:48 -0800
X-CSE-ConnectionGUID: 5EDKOX4IT9CU395Dv4wrnA==
X-CSE-MsgGUID: Ab0vuFxCTZ2xd0oyeUeQ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124506557"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:21:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 02:21:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 02:21:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 02:21:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTuUsBaPuh25DiEI7XUh8mzFgiWkqzRLSNOQqrdU8dRcbLVx/FZNvVe2h5/Ev2S7rYXcHnrQy2MQyVKUTi+qPqhebpqaFgvCw945yJq2POt1jFDNP//XqP+lPqJXKmCRKmsPW94Wl2RoIbUxMnvNuBgKWJPUagdTeYurrJZwUIH12G5cVpgXzMzYmgqtKAcqyjr7ZRubkpi2882aoq9zL0cRdePnEpKmawJgTXZZ5q82FbLlIlQTt3v4b+RjyMmgLKwVz9w+xh7f7etteyCO9OTAmozZmOtI51U3C2GTIEvwfJRQJ8lGJNZ0t4KbqUJCWe0Sy3FPh9Htzd5gx7aCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pVhvRpPmrSWt0mJWI+6Uu+1AWDyEiiwGVGDQfrl8SA=;
 b=hM7h/JFnP1kK2pgamKuXMIa2xsBsBBlx3jTg/wDp5iewPWPkEM3N49+cZrq8McuC/qF/seE1ftKHlqOj6+cLVtvyz7PjrCdhfVdyzmBCAVQ+nVvMFs/YQrwtJeZ6lVqmfPjTozyCyRP+X7zdKeP7DaMQdUO8kSX/awZ1eS4CkcDfV34bZUk2MwcOFHAwPNpk6ImA+pQ1KdHr8l1jFEk9iAKb2xU493Fzzt+uNe2P7WHfA8AlNt7Eto7krsHB5o+xnvQWKtNNiv8FWTd0Ys0vdzlSAHp5gWBbHvCnK7BQ6J7WoXCqqShhuOgwe4j24c5P1Jbs8rAWGzsY/IR4H0gnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by PH7PR11MB6795.namprd11.prod.outlook.com (2603:10b6:510:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Fri, 7 Mar
 2025 10:21:38 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%3]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 10:21:38 +0000
Date: Fri, 7 Mar 2025 11:21:25 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2] i915/gt/selftest_lrc: Disable timestamp test
Message-ID: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|PH7PR11MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b4b701-88a8-4b70-48c0-08dd5d61d87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGduTW5ZbXZFY05CNEdFeWhTTG1pRnBYSXMrY2N2M3VGaGQvMks0UzNPaVV2?=
 =?utf-8?B?c2FKMi9BUEVrc25MdjF0ZHRtWkUrZDRZcXRIMWVZa0hEdFhUMUh1ZkZBMzJm?=
 =?utf-8?B?ZXEyTlpSYXFUNDNiTFpkOXBKZTZxcWtsY0cyb0VOUnFhZkptY3lSYmxabTh3?=
 =?utf-8?B?Q212b203cFJFRUxsSC91aEtldkdXOWFwdmsyNUtLeFpyd09weVcweXJCSDI3?=
 =?utf-8?B?YUdSVWtXNTJiSHpiS3d2VW5hc2pFZnYvMzVSRXNkRVFRS2lzcUVXMW11VFMv?=
 =?utf-8?B?Y2YxNnlHQ3ZSQVFIRU5QbmJQdDhVZUpWSDR1RHpKTkpyMEVCbFI3RFVXZVJz?=
 =?utf-8?B?cTc3RmRGeHFWUWhqYzRiY25MVWtKZEg2Ynh3ZEI5ZStDNXlUOGJzRVIxenJX?=
 =?utf-8?B?d0hxNSsvVVJxL3NVQ2VlWGI5akRNTVloaEZIQWsrc2NLNlVPL3JwRUgvTFU3?=
 =?utf-8?B?ZXJnTWp5aTlIWGNCL1U4SHJnTlJ4citrUHJlcDBLQ3AxQkd4OVV6UW9JWUZK?=
 =?utf-8?B?UmJ6dkRTanRpeTd4aUNJemFkMlUrS2gyajZqbHRCSVlKcGVldmc0TU9xSzE1?=
 =?utf-8?B?QTVZMGJRSjBQeUlzNTZ2NXA4Sk9pTDNxNjFDVGdYTFVYemRhTWpHTzNUYlRm?=
 =?utf-8?B?SWs0S3FQcDdrMUdRUGkzcGRvd0VPU3RMaEZPRVdXUFFJNEdQS0FzWjBjUzRx?=
 =?utf-8?B?ZC9YbzhJR3A4WlZlVmV1UFpWQXdzWWozMDY4VTVTQUFqQVA0eC9xUmsxREdU?=
 =?utf-8?B?YWs4YlhMT3JiVDc2b0xXRm05U2Y4bTAvUjlyak5HOFpqc0ppbzErY1FLOGJV?=
 =?utf-8?B?Q3hiclNqK05ncVMwaUZlMmpONy9qaTNXRnRpU0FCZk80dDFNYndzdklTVERM?=
 =?utf-8?B?T1dmdnRwY2ZGZnRQVHovUUNoTVcxYmpyV0xzSGdsdWtCK3cxQnZvQXhpQWZX?=
 =?utf-8?B?MmxmZWcwVGtqSnF1K3N5WHRqNWFNQVBkekJCWCttdnZqa2JhUVp3bUNnWWUy?=
 =?utf-8?B?RDFJUzF5SlZ6Vm9BMDIvak9vTi9OcEhNK2hadDExY0hhWWJDSE5uZ3lYcmFa?=
 =?utf-8?B?U0FZTEd1YUJSclZ3Yy90eVZlTksrN2djcXNvUXMxaEhZOEY3WExjVzlteXht?=
 =?utf-8?B?SnJtcmorWTl3UDNiRG14dktpaWorQ0lJSkZrbzhnNE1rbSt0QWREUUwzMWFH?=
 =?utf-8?B?K3o1QUhLVGM4amdTVEtDd25MdEpCaDBlSlZTK3RqMWt1MUlSM3BKYVFERUFE?=
 =?utf-8?B?ZkJwTzdqZllGZnNqNE5uTitNR0pSeS8zOVpPeHJvN1BVZVdTeWZTMklZR3U2?=
 =?utf-8?B?TXVCOFNLdklVNFpackNXTlJSa1RYb09iUmY3NmFkaGRFRXhGMC9OK1lqWjA4?=
 =?utf-8?B?RE1EdDlYZjhpckMxbDgwdkJHQmFXSVJ1SEtaam5rRDlVUGc2VHdlTEhqV0hy?=
 =?utf-8?B?RFF1SVl6dENOWXhndG94NHVkMG1JRkRPYm52RXZMY2JRakNCTWUyZ1B0QXdk?=
 =?utf-8?B?OVlIRVZGSFBrb25yRzJWdVlYSFhVTnRrb3FmZURQeXEyTnNwYWFaWEp2dEgx?=
 =?utf-8?B?NnUwd1hnUkQraElsZ0N5Q0dnMHF6N2pOL3ZZdVRHZU9JTjdDRG9zSHg5TXpZ?=
 =?utf-8?B?cFAwall4V1NUQStUYVJUY3krSzc3L0RFUUtzSHAweE5aYzlBRzRZTnZHSXdq?=
 =?utf-8?B?OXhOTXRnZHpsVDgrTXcxTVZqQTArUVJaTFlaVGJDR1M0TWtJVFdvZWU1S0Y0?=
 =?utf-8?B?bERVZlVSelArdjQvY2hsaHBBVUJCdUpiaXRCRzlDaUNJeVY1eVhJbnRkLzhp?=
 =?utf-8?B?SmZ5dXM2WjRZWlNlSE9QZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStqYjdnQzJwb1dmNlM0dEUzQTJFYy9BcUJjYUU5WkZSYW0ySDZyaEZZU05u?=
 =?utf-8?B?V05EQXFCcGhYcDVEV0ZjMW5FaTRmeHF4WTcycXMyZ3A5eWtGcVdiZGttMC9s?=
 =?utf-8?B?RkZpcXFKOER0Nk9QTytUZGJSUnlLTzJQQ1BuMG1TZzYvZjhZeUNycFNibE5L?=
 =?utf-8?B?ZzI3bHVBaTVtTkZTU2o1aXhINFhYSHA1RmRLMjZzZEVsNHljYzdiTUpPUFV6?=
 =?utf-8?B?MC9uczR5cEtwaStwM3E4TlRCMloyQnJ4aklzM1FyWnhyVHc0bDd2YzVVd2lW?=
 =?utf-8?B?T3dCNkFwVVlaWUJGcHVYaHlpVzZtSG92Rm0xZVpqVjZsM1J3RXJ5M3plU21q?=
 =?utf-8?B?S3JuTGd5L052UVliMFBNakYrM2xUbmdxcW9lRWJnbndCS2lGZnQrTDlwdGpI?=
 =?utf-8?B?VHpkQTZMVGhyZ0tVZHFjT2NFcVBMalg3QVVTLzdRenRrajYwOVV1Yno5YjZw?=
 =?utf-8?B?bUNzUW5tVGFXZ1ltalFaWE9HejBFbGtST2VuSXNwVFlOOHdIcGJhWmhvMzM4?=
 =?utf-8?B?ZkpVWVcvZFM5cm5DcG8yUGtLSDlTNG5za2o1ZDAxKzJzN2RHcE5ZUXNYcWxJ?=
 =?utf-8?B?VkpMcU9vb3BqOHYyL2M3RjF0bkFHQUlhb3pvN1l4UkRBQWkvaVdqYXc2TlRU?=
 =?utf-8?B?M2UyZ2J0N0VEWmRMRjIzcVBONU5SelR3YTNRUjJzcWduZitnNmN3WHdhVnk5?=
 =?utf-8?B?OCtDSXJxTzNCUzVvR1hKRXEvUHJBSk5GaXlFcVJNZXV3Zm5GOWRnZE9wdDVY?=
 =?utf-8?B?eldjWjh0T0hZbDRYbGs2UEoxVVVvZnM5LzZ4blFjUmt2UXRGL1J1cTFXVFRP?=
 =?utf-8?B?ZlZOaHduaC81Z3V0ejFZcFp5Ry9nRzlPdVBXcmx3bElFeUllZUhUbXRiYis3?=
 =?utf-8?B?c0xJY1dzSzh6RDBmcVBJZGJOTk9KSERXeTBxa1hJZWp2WlZVNDdqRmZWRmpT?=
 =?utf-8?B?VmdicnpQYm8rSW1RWFRSTlhXdm1UZUJHaEwzREsxUU9nOVBvOXZwdzY4dEJU?=
 =?utf-8?B?VGg4VkIwNlVlK0M5anlwc1JVUkhYV29EblVCMVB1aTdSbnNDRU51TExYRnNQ?=
 =?utf-8?B?RTNxZ042R0dkRzBMVEU4ZWgyMjFaM2xRVE95ODZiODI5T2k3Y0ZsOXAxdUpX?=
 =?utf-8?B?b0hQZnRSY3J0ZjN6a3hIRXo1MytOS3plRGdPRUdydkp5M3EvaGFNRHUvMW9z?=
 =?utf-8?B?a0JuekUwTHBZUzFzUThUKzY3aUNBZUhHcmdkSk1jVnNpQ3k1MFdZRHFpSVg2?=
 =?utf-8?B?TS9pcWd6VGw5RzlkUnI5QXh0MWcxMTVxNlpHU2FJL2NYSzdERXByQjUrQitX?=
 =?utf-8?B?N0Fpb1kzOHU5UzlFK0hLeitVRXIra0lVdzhSRE1LOUU0RnJnZS9JdGtsSHZm?=
 =?utf-8?B?ZXJIT3dTblQwUDNTY1VSQUJlYTE4MFREajdGbGJhOEZMSnVuMUxjdHptbVY1?=
 =?utf-8?B?WDNyT3h2bTQzanhPanpKUHU5d1hmRFFKcXpFWjhuVjNVb3VhRStPWUw4NUY4?=
 =?utf-8?B?WEVuelpGdFhuS09mMnVvdSt4M2lzRnpGdTNRZ0x6SExyREc4aFN0K0hPTHZs?=
 =?utf-8?B?Q1JId21MR2JtZE1NYXR3VU9FT2NYWmNCT2tYTDNrWVB2RTZsUFlEZ3l5K2tW?=
 =?utf-8?B?WWZVdUN0REh1VUt0TlFudEFDdlF3Q2d3QlJma2Y2WFBSRmxxdWhRSC84K21Z?=
 =?utf-8?B?VUxNVWJuN2lMbFVSaEZKT20wUkRxNVIvaHZtRlIyMkc2M1VCckFBcEdoN1c3?=
 =?utf-8?B?SUY3b1NGMlU0VnBWT3p1V1pHTDlkZEs0ZTlaV2FOMDVyUWxRNFVjYnhNVjFZ?=
 =?utf-8?B?dmdiWEt2KzJHdzVLR0I3dS82Y2U1dEJlOVNGZ2VYallVeGVZNEtNbGVOKzFa?=
 =?utf-8?B?OW5vZVlvOHdmcDZsMTNNNFlyWXdqS2VmcUh4UnQxaGdneEU3YXA4cnhVZm45?=
 =?utf-8?B?UTkveHhBdUJiSE5WT3kwcFJpQXdpSFU4N0dGc240UE9xNXVBMVZFR0dEK2s4?=
 =?utf-8?B?T3NFNVB5czF5WjZIdjJHd1grUFhRYXdEWERoNitSMkpmRlZJOGVSbytaZGNj?=
 =?utf-8?B?SGVjK1FISDlqOGpWMEh3aWh4aXRhMTlRTWp0MEJnRDNoUEJKVk90ZU9MemY4?=
 =?utf-8?B?SkJ2dFBLNTNZQnlrL09ib21CRGZzTnY5NWpoYWRCVFB6cFBmVGp0VTl0TkhV?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b4b701-88a8-4b70-48c0-08dd5d61d87a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 10:21:38.2920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNAtEa1l/YOikvtoncxmAnurnXE19xNi07g5ERiQK+aFOixUoXboLVyZf8lkxtcBTv/FkRnF4YKyjp0BzodG+kcE/ofMUC9ROl/c99zGGTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6795
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

This test was supposed to show bug in tigerlake and dg2 hardware.
The bug was found and fixed in newer generations.
Since we won't support any new hardware with this driver, the test
should now be turned off in the CI to not polute it with random failures
on previous hardware.

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---

Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13697

v1 -> v2: Disabled the test instead of removing it,
					Change name from 'remove' to 'disable'

 drivers/gpu/drm/i915/gt/selftest_lrc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 22e750108c5f..419a7cd61b65 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -3,6 +3,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
+#include "linux/kconfig.h"
 #include <linux/prime_numbers.h>
 
 #include "gem/i915_gem_internal.h"
@@ -858,6 +859,16 @@ static int live_lrc_timestamp(void *arg)
 		U32_MAX,
 	};
 
+	/*
+	 * This test was created to show existence of hardware bug.
+	 * The bug was found and fixed in further generations but
+	 * now this test polutes our CI on previous generations.
+	 *
+	 * https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13697
+	 */
+	if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST_BROKEN))
+		return 0;
+
 	/*
 	 * We want to verify that the timestamp is saved and restore across
 	 * context switches and is monotonic.
-- 
2.48.1

