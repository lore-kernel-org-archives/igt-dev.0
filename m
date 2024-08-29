Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B3C87FD6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 20:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492DB10E56C;
	Thu, 29 Aug 2024 20:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bmOp8srx";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E8710E56C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 20:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8GAJGG/qVYj8tFmkRwD3X8KYF5k7hza5BUG7Gd4SokpEGzgeyByL17PfEUrP9EBNTT+nf5nK8eCDcfo3lRqyby1EKFj9D1vqhfTIGLBzHpQUZv7Is1iWLVq18zIXdHxpbBmvSOfoQByCdfGwJP4KGQP0guf6HHmtAf3LfAgNxfPG3gaMyKKPLuxbp8YE5sEQBPT628OJtR0+LYzwT16P7lawAhR0yU+0CmWL8uxQJoDbR/bSMUZ4UOEUaxFprxKhG4J8az+TlkIvTEldrptO52DY5o9Brl8PVnoS9ef/mjJx2AETJC/grfp/1OpOHirbDhZCL0RWSt1Lr9YkA12/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU09ZjbMdBqZ63pTpG8DMXZ+Fydy8S90fZjkd63ZNzk=;
 b=ToXCN/zS71ehuEtQUoqzsIJPZRm+1KcAD9sw7QxvKVJnnNsbT9V0qJb/lN03UJLrShpKUXJr8pY2plq1rVQcOj1FjvHWHxw5SaSRJ/Y/Vs7+/walb+PtwlJohYBOXIGaOTkiTeJQYQlLqbPmYrtj4KErJaPMUbOzPBwsMSYRwppYfgWPpwoPwx0Fv6ditp4EHkaoqmrSpFVPd0ndUUTKZdZYrj7/SwNIYIs8AQ0t/Wh31vXLW6KCHCTlt6ZQxestQ695ZBBHw3T3s36xpMxZeSLJiQWHvaxxLHFJXj30ESkvPrJVnBZtcXwnf6cDGqrvhlfK5tWRIIucv4K3puaR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU09ZjbMdBqZ63pTpG8DMXZ+Fydy8S90fZjkd63ZNzk=;
 b=bmOp8srxjAnlNsficpX8Y3YBAYG2b7CqYBwla66Na3NGpPPxn1HzhLyJGioK8RJj5OpjH3X8bK7TboUTaq5nxFTGD/bX21BtclNWN1i1geWvmmAmdubeXHvES9cedX7QOhauKGnOZhLg9KQWGcakCyKcZEC3XkAYrM1T4GfPuro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 20:28:06 +0000
Received: from CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4]) by CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4%3]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 20:28:06 +0000
Message-ID: <4c40e28d-a8db-40ec-bde2-0081314a7e8e@amd.com>
Date: Thu, 29 Aug 2024 14:28:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tests/kms_writeback: Add clone mode subtest
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 igt-dev@lists.freedesktop.org
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To CH0PR12MB8486.namprd12.prod.outlook.com
 (2603:10b6:610:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8486:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b44e51a-d322-4d99-f855-08dcc86916fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUYxUFQ2bis1Y09HOW5aeUg3TlpxbXR3b2xyM3FHR1FxTWtqVUVWZEpFNkVL?=
 =?utf-8?B?RzAwQVVSVUltQmEwbmM3TWF2TGY3Y3Q3c3ZleEJ2Mk5rdGQrcWpTTTIyTGlx?=
 =?utf-8?B?ZjRrTTJpcmVPUnVjb1RCVHlkKzFvU0p4ck8xK2ZxYzNUemNpMDF2U2h0cXE0?=
 =?utf-8?B?KzlveE9TcDQzMEkzcjk1UXg3c1VJRm03MnN6UHVsVy9LOEVEOXppSXFjYkFW?=
 =?utf-8?B?QTBvSmMyK0VPZ0pGZFZobkZINTl4ejZkZFlVSUtVTE5PcFZzMng2V3RWU0Jx?=
 =?utf-8?B?dWpLdXZBdVBDWkdpSmVvUnlrMTl2RFlVRlpnZlBkaDRrMUV6T2FKSVVjaExo?=
 =?utf-8?B?UDhVcWV1YVdseE1aeGE3WmtlN1NkS1JkUFgvMnhiODlpVnhOYVdpY2dIK3N6?=
 =?utf-8?B?MmJBdElPWDQvMXUwYXgrYWFQSlljenRzc29tbkVKaXAzVG9CL1hjWi8rVG44?=
 =?utf-8?B?d2pFUnhTSHkrWGVUOXlwSnhkTnFwekxIVTluL2dZMTUxTm8rNGVmamJ0c1Nm?=
 =?utf-8?B?NEJJS2h1YXhURVpOMUlzd0MxekVOUHh6WnpuSEZWbGNxZTQrZmlTNmdhU0ZM?=
 =?utf-8?B?K3YvemlreUlYa1VwK1BMOVdiMkhVWnJjMU5PRGI3K1ZVQlFRamtrT1RtY0FZ?=
 =?utf-8?B?dTRjSFROUUtmSk9UdkRXN3dIaGE1WkpjUWhRNVE3b0VaVWw4cXFMeFRqODN4?=
 =?utf-8?B?a01OTlhUREpvVXJMMi94bUJoRHBPZU1GU0pGQktHN3l5R011MCtOb1ByM0pG?=
 =?utf-8?B?K010UHhSdnVzdzFPSzRGUjcwQ0ZIL2NENndhS1NWRlhhSmNLUlBNb1ZiT0pT?=
 =?utf-8?B?dHpBY0VPTkFhemFUdFFaR0g2cWp3b0xYdWFSYjNqYW42QjIxakkyY3pKWUFN?=
 =?utf-8?B?QjdLSTFncVRYZzU5MFNUUHVhZzhZclcyc3JhajEyRlpTdGJ6ckdMODVOY0JC?=
 =?utf-8?B?ZEl0WDJRR3NiclYzZWRMUzQvSk5mTDJ3VkVxOE5jUGIzQmZwNnJKL0owK2du?=
 =?utf-8?B?WTNnY0FmRTFKbjJzeC9CS1BCMW84bmlRamU1VkY2NmVyRGFmTnV1bUNLaFFt?=
 =?utf-8?B?VzY2YVo0c0lyWTZEMG5Id29jZDRQa2xtK2hEK2lmYWxndDhGTi9rZzNYM1N3?=
 =?utf-8?B?ci8wVm0rcmI4bFNzbWxCdEdIWlZhcU13eVM5Q3BuTHlzR25XeUNKUUowSTI0?=
 =?utf-8?B?R1BwOTZSTTBoWXVsTDN4clV1dzZ5TGE0T1Y4QjE5NmVzNld0UVZGdHJXMWl1?=
 =?utf-8?B?aGl5amZPaGtSNTJvSkFTMzlDRjhtYWE5RkM1cjU1YkhHQmUrQ2RzdlcyN2d4?=
 =?utf-8?B?SzB3WmtRTGlwUG1iUUhycVJEYlFhTElGSlZhV243NWZRbGQ3K2xBM0RYcVNC?=
 =?utf-8?B?T1VnUUIzMzJCZGRmOWRNR1hGWFZKVHRCKzVybXhLVzJPdnVZbSs3ZXN3QXE2?=
 =?utf-8?B?ZWxLb2VyeHdmOHVSTm51U1BOT0FNWC9OUUlDWHRPVXl2b2ZEZXZpbk5GaFhp?=
 =?utf-8?B?UHhrd2RuN2dnNk1oZXFYOXI3ZC9uckVKcFFNYXlNM3F3MWQ2b2l4Q1hXTnhw?=
 =?utf-8?B?dG9GU3BmZjNQYUMrOUVnWHdML2ovUFBCVXoyTFNxdmZuN0VQWXN1bUtUNklK?=
 =?utf-8?B?UlJoUGFOaGt1Mi9KeU5NaVk1ejZXVm9mblZhaFV3QzFtOXo5Zk56MWhZWURC?=
 =?utf-8?B?SmpXZzN2U0hELzhHdGlJSnZBdnFjQVZVT1ZUNkJHMHNHVmM3YUlDUlpkbDYz?=
 =?utf-8?B?UXJpbDZMV0J5V3ZjblB1ZjNlQW1BQk1tUUd5Qm1EdTZWNVFNenVHc3VSOUZH?=
 =?utf-8?Q?tez971AaFKQmHScxqVCTAeWFT6jx/5Zl4m6bs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB8486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czU1UnhHSEkrU1FIZ29TWStXems2dkpDMjBuQUEyQ2ZjRjM4cDRaUkpDT1F1?=
 =?utf-8?B?UnprZ2cvOWZZRHJ5NWw1dUpyQkhad0JzNWx4SDFYZElxWEVTdCtjMUdzaGdq?=
 =?utf-8?B?Vy9NVTdzVmhVWFNER2VpOElwUGx3eFplYlcwcmVFUkdFSk5wUzYwdmlSalZ4?=
 =?utf-8?B?b3R4MmlYdzkyZWpkSGZtajRxL3lHL2dCU0JwMDVxMWhMeEU2N2lzYjF2ZWtN?=
 =?utf-8?B?VWFjaGNYcmc1c1cybURRb054Z3ZMRllmWk4vQTVZZFNMTmd4anFxdkE5Q3Fw?=
 =?utf-8?B?QWR1aC9NZWR2ZmQyVXJIamVoMnl6aHovbFZ6OFhQbWMrNWRndDlGelFoY3pS?=
 =?utf-8?B?ZUZyTzNNUFNKRGtpdHJCR0pRUTVvN0JFaXlEY3JTWnJyTjVOV21tRzYybTFR?=
 =?utf-8?B?TzBZK2NrMVNLM2lTbmFvQ0hWWllOWEFGRXpjY3pVWmlxaDNuNVdLbjlkYk4x?=
 =?utf-8?B?RU8wckhvVWNFd0tHVmIzZGptSUwzMW5WeFRHMDNtMisvMWdKR2lIUHBHQzZN?=
 =?utf-8?B?OWg2OGhKZ01MQUkwV3FJL01hdkRmM0ZEOU54b1YzajNBcWJ2QllFM1QvUVhw?=
 =?utf-8?B?ZTFwakE5NWhkRnYzWXdqR0JHaFlrOGE0ZXhKWWk1NWYxaFhFUHY0Zk1LR3RO?=
 =?utf-8?B?RzZRbnRya1JXMEVPZFEwSmZRZXphTWJ2UzkzZE9nNmxtVnNEdmVUcEdxSzVO?=
 =?utf-8?B?YTRNejkrbm5oVHFUeUlQMWFXQngxR1dJNDMzSXlaS2JwbjdyVllvVGFnbVlI?=
 =?utf-8?B?WStJMkZZTXk5QW5ObHY2SkNmNzhLZTJuZmtqS05FSXpuRnM5VE9uRE1PYVR6?=
 =?utf-8?B?eVI0MlRZYjdNc3lkUFA1RXYxUFZZVUIrNEVNc01nVnNGcnN4TGladFYvUDJ2?=
 =?utf-8?B?WEV2Z3ZrKzNRamV1OFlaaStKeVRBZXFjR3U2OXcvU0Iza0FiVlhaeGl4UVB4?=
 =?utf-8?B?SG1CZ2JTTDNOU2ZldU9PYW5IUDJiQUxzRHN0eEQ2eERyL0NqTExDWDdXNzdK?=
 =?utf-8?B?cWdwcnVkRUxYMHRlZHRuckEyOC8wdGxWWnh5VlFoMERadWN4VWJ2aUFlS1Ni?=
 =?utf-8?B?NFRJcStsWnZzQzRWT01KWWo0YW5JUm1MMEVPd0QzNUNGQ1djd3RXdUlkc295?=
 =?utf-8?B?THpXRTNlVGZCbDIyQjM4OEdrSFQ3NXJPTUhqNnZPMTdYM29BRnBXbFFrdGhF?=
 =?utf-8?B?cGpZZjFkUnphT1Zwa2dkS2xnUUx6bFpJcUFzZXBMSVpQVTl3ajQ0UFR1TGor?=
 =?utf-8?B?YlFnZXhiNlRPUGw5aW51RXg5MXJMeExvQjE5REFzMHc3UC9GVDRnakorS0d2?=
 =?utf-8?B?R0tjaVBoRlNUY1VkQU9uektjMm9heFgvQW8yekx6ZlJnNEJnVjdQakZaQ0hQ?=
 =?utf-8?B?NURTbVRZSmVpQ0NKQVFmU1RhM3g4cWxDb3plRWdhZ0lQQmlXRmtFbE1UTlpj?=
 =?utf-8?B?S1djZ3lCN2hxVjU0dU9jMlVtcytaWDdHMkpQeXNJZVZIVjNlODhWZ0NkSnBM?=
 =?utf-8?B?Y051MlZKOC9TZmU2Smd6Z2RoNWh5Y3N0bmFObWRuc2ZIRHkwTlUyY2R1WHNh?=
 =?utf-8?B?MHhaTUZpMVR4WjlzZXBwWHZzYndkeko2ejJRaWdoUitzeEFKUUVoTk11eXBx?=
 =?utf-8?B?dWc1WE1IR3F6b2JwWU91RDRkVFRWM085ZXl3bzB0cndEclJycmlJZitna2My?=
 =?utf-8?B?bnBrNy9POENldHF4dklnbVAvQmZ3QTlpSFhnQzdCTnM0U0xySzFZUU4rUlZ3?=
 =?utf-8?B?RXh1L01hd3B3YmxwUWJYRXZuKzZWT21YcWNocmZZWWNDWVYwSkxPOCtrNlV5?=
 =?utf-8?B?UWFzVTdKRnpHL2NsSVRoQ2RSL3pkMGlXdks5aTR2ZjlsdlM5QWlyVjBGWENs?=
 =?utf-8?B?Mk5WdmJFak9PTFFEeEExbHFxSCs5ZWxaejY2UXVKYzN6ano4WUs2elFUSHhP?=
 =?utf-8?B?S1h6c0ZNelhIWVFwRTZRZFJGZWY1RlFlUjViYlQxUGVyRnRKa3dYVFRpMW1X?=
 =?utf-8?B?M2o1OXFzMWhvZUJwYWJnT2JuMEZhM0cxako1TTZRdXJpbnZJUFdpTWJFZlFy?=
 =?utf-8?B?elVqTnVMbjYzUGpVaWdtM3piN1JJV2hTR0xlSjFWSmVnOFc4b3lST1BmeXh3?=
 =?utf-8?Q?+vGh0ySU83i9myUjh3XXFkl7v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b44e51a-d322-4d99-f855-08dcc86916fa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 20:28:06.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nIThMAboxIUPx4W+E7sYRgrrSQxqXYSuZ/nV8bIeByUJiGqlHRKjxfFesDXkRS7VcTPHPlnpwnHJj1sTBBzKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014
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

I ran a smoke test and Patch 4 (tests/kms_writeback: Disable all outputs 
after igt_display_require()) is causing a regression on my test platform:


Starting subtest: writeback-check-output-XRGB2101010
(kms_writeback:1973) CRITICAL: Test assertion failure function 
get_and_wait_out_fence, file ../tests/kms_writeback.c:345:
(kms_writeback:1973) CRITICAL: Failed assertion: ret == 0
(kms_writeback:1973) CRITICAL: Last errno: 38, Function not implemented
(kms_writeback:1973) CRITICAL: sync_fence_wait failed: Timer expired
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 [get_and_wait_out_fence+0x8e]
   #2 ../tests/kms_writeback.c:401 writeback_sequence()
   #3 ../tests/kms_writeback.c:424 writeback_check_output()
   #4 ../tests/kms_writeback.c:782 __igt_unique____real_main557()
   #5 ../tests/kms_writeback.c:557 main()
   #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
   #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #8 [_start+0x25]
Subtest writeback-check-output-XRGB2101010 failed.



On 2024-08-28 21:05, Jessica Zhang wrote:
> Add a subtest that will iterate through all pairs of
> non-writeback and writeback cloned outputs and dump the writeback
> framebuffer for each pair.
> 
> This series includes:
> 
> - Fixes for properly cleaning up the kms_writeback state and forcing a
>    modeset after igt_display_require() to prevent commit failures when
>    the writeback mode is the same as the primary display mode
> - Adjust the duplicate pipe check in igt_display_refresh() to allow for
>    combinations of valid clones
> - Moving the writeback dump to its own subtest
> - Adding a subtest to dump all writeback/non-writeback cloned pairs
> 
> To dump the clone mode buffer, run the following command:
> 
> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
> 	./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
> 	-dc <primary display mode>
> 
> This will output a file named <file name>-encoder<writeback encoder
> id>-encoder<primary display encoder id>
> 
> ---
> Changes in v2:
> - Corrected author email
> - Link to v1: https://lore.kernel.org/r/20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com
> 
> ---
> Jessica Zhang (5):
>        tests/kms_writeback: clear writeback properties in teardown path
>        lib/igt_kms: Add helper to get encoder index
>        lib/igt_kms: loosen duplicate check in igt_display_refresh
>        tests/kms_writeback: Disable all outputs after igt_display_require()
>        tests/kms_writeback: Add dump for valid clone mode
> 
>   lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
>   lib/igt_kms.h         |  2 ++
>   tests/kms_setmode.c   | 14 ++-------
>   tests/kms_writeback.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------
>   4 files changed, 122 insertions(+), 34 deletions(-)
> ---
> base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
> change-id: 20240827-igt-cwb-23fd81d3a7a4
> 
> Best regards,
