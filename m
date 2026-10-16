Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E935CCA462
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 09:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD5B10E232;
	Fri, 16 Oct 2026 09:43:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2D10E232
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792143729; x=1823679729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ey6fg2MR5NVJ91BpDpEQyyJn6mUVfk9fxWF6SNrcQzM=;
 b=QoHEEZwlPSYPXcLGXC1aDADlBOxVRjMFDFh5rY/zhZKEzEFbIy3eyHD1
 tuC2BoUlqPHDMLxUCvu33WgkeJlvsqNGnlEFDn+9O6LZonQKQq5q0jo4d
 fHDxSgYo/DPDpkaNrWYipqZvrBWZPJdVuVcMr58uhMDhp8va0v4ijoJ4J
 qhFutAjoeM2KHbMAkn1494OogPovFy6zKAtuKZkCBgjreaQDMtAQHkN2w
 2t24JD1j1Ua3HehYr1vGRZ4XBEc3GAVEGhPlmHiL4GzSuBFO/sKNhA8tN
 AHnh1QaM27L3YPUdWX8ysqO1LFvwU6F4utsI20tBcwa8yxmmduKS4oY1h w==;
X-CSE-ConnectionGUID: XufCsRWgQiixGSKa6UvzaA==
X-CSE-MsgGUID: X+XD8clbQNeySMxafOIhvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="830219"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="830219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:42:09 -0700
X-CSE-ConnectionGUID: VE/AQm5PT/yvK8P/lR2nUQ==
X-CSE-MsgGUID: BsdMIRCOQXSfVC7BBAyJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1983385"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:42:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 02:42:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 02:42:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 02:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzFLnwV9x6DSBIMVGBEe8JHWsUb7y9l5URsF14mPu2WCinyv2H/T3Rdaec24/qPR3KOXzy9oIoEWlFWABtawzEs96+8yo/6uM6CXl15qwudPKYdVRYsEBsZry3VByBA1uZs78kocyOc9lhsVppC/JETye4KScJiR7NGWWcgOVQmxOmXY+x5ppRZZ01LM7ovBddMueAYpXF4G0mTggP+5a/j91dL1iEgtT1yeMOKaCoohLT0z34XyHR8o+RzOwAng0nhKx3xCjd2L5RlxWtsWWzZr72QOy4dej6KEe9PvqpPWbY7kWeQE4mrj4xREGlMCYATEE6peD+jl9OR3hco7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2Qs8QCH082YPmi1zFywE9N9RiclT1jC66dzo746s4w=;
 b=mj/Cws58zF5shau4nWxo1TBLzRYAm5XLJOLHy8jEW/vQ9lo16VowYxm53XCvFA0KajpG1PHlraN7HM2c4NykhtNpo6xsMOa1TVpMimZxkuQyFKXmcpcjVehbndb7PUJoGz5ONNz5DTQhfM1MSXBDlxePU/vSZjkSqykzhNvUpNesxFsyzuFjauF8pK1abX9b/t5JQdP9OWpCD9zUIy6TtT6OKeasIkJ4Ds/NyuY+72hq9IrYf5w/U6XvLs0KEw2u/j9DwSPJQ/r3OZTcONT6CDMiHw7Zz4WK61aG7pcciZkIfc59gENX5+JyE0BmFx4ZrrjGUEF0P7VC7s0USsY8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 09:42:06 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 09:42:05 +0000
Message-ID: <ff6bac66-9e5f-4168-b0e9-262549ec714c@intel.com>
Date: Fri, 16 Oct 2026 15:11:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add helper to dump GT debug state on C6 wait
 failures
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260921175206.1707165-2-sk.anirban@intel.com>
 <c258a472-5d98-4edb-873a-b37c82e2bcdf@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <c258a472-5d98-4edb-873a-b37c82e2bcdf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0351.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::9) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0012d3-412e-4efd-d9be-08df2b69bd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: O3gGPMp+xEfHO1dOff13CPw/qlbV/kwBqDNDVytUDNi0HRSGoTPPVk0Ztf8KELH58fYq4PLStnP+hZH2ifPXCf9DfoP/7t1ap32xefb4Kf0c/FUHStCXeEOdkKE8wIdq3dwOqTuxGfo/GwUE0Ou3oWuWGqoU9+OFqDhAhTQvMLuh8gnNGBdCUyseS7CoHxacInJ/1QJy1cOqzq2+0MwiR5lSjwQpxyCnqq+zUrjYs3RQ/FMY34BvZiFNsr1n9cR5eapSpO4D/2E9ulCt4Ucb2o3nBAy+goMPRXDpPQrt+mxeQnj63EzedlKIAle/ry7PlVYbP4gcuhvBe+uH89lxMfKQYRB5gLJm57RfxIry5idAlSZAIDlHBhdYrxACKuf4LTDV7BqtOhuUWlC83s2XOS9W2x5qKTiNZD7dk9bl5bYrLGXAQxj4oIfYmx1fsyyeviXcofx+Bt4D0S4Y/ZefkdersBK7huxO1vHlRRZlJRUMQcMI4w47UYZnDWuC8PgDLzsfd/BjqYwkkUvae/HBZfLfIk7MdSmBsvG2fWEQhk5ZwbM9vpIi70tfUDUCKAhgNst7jiLwGmpyg5cfofej2uqsCBi761fBqVpfRgLAyLnU9bLk6Wr2IIJMSWEsaYCEjCa4JZE7AXRHDEy24tTsIcfLbZzrhQamvbGJQ43bUfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpMcU01Y0xQSUNDS0xkUXh2TFB4N1Y1VFcxR0IydExrTU1rbVVNdDlhNjhm?=
 =?utf-8?B?WFJVQTVRRXU4YXlxQ1R1a2lwRi9aZUladHBOazduU0t2TEFiYThXRzYzODlJ?=
 =?utf-8?B?VUxBazNkOC8xWFFhSkhpLzhZMG9FUlIyMzNMV0c4dzN3QWJLbnN1am85OWNP?=
 =?utf-8?B?ZEdTWHppWGZSVzNXKzYvK2RHbDVkeUVNN2J3Q0krRWFYenZyZHpWVHZQV3R2?=
 =?utf-8?B?SDFUUTNZdU9VSE5OZkkvWDRnNkpkNFdNR0pvUUV3bEpPQzczeXdwbXN0T296?=
 =?utf-8?B?OFMyODQrR3ljMHpiMHF0MWRCYVBud29ndExJa0VZOVUwcTJ0bk1zR2cvbS9w?=
 =?utf-8?B?Qm83dm9aN3dEbHIzQTJua1draktLcFlqSUFRM2FRR25na2hyaTNDOU9yRVp4?=
 =?utf-8?B?WVBvWVQwVVZWN2l1cTVXV1NlU3psbW1ZeUZQMGY5VEt3SXA2OXUwOHp1S21k?=
 =?utf-8?B?VTQzSWJyZnVxT0h3VjlQVFFUL0YwRjF0MkxGV0FlMzZHaFZZeVM4U3YxbWZX?=
 =?utf-8?B?U3ZHMm13Nk5wYm5BeXpacmVvQjhKZi8vS2xlTUgyTTRGNXU4K0M5T1ZiSHVS?=
 =?utf-8?B?cUZrSG0rVFBHK3FJWmpFNnRKNWZvcnlxeW1wS01KN1BsVStJdmNQRk9hVFNH?=
 =?utf-8?B?bHNWYTdtKzdqaXZxNWZiWWkvaGhBYXYvempMQU5Db1F0ZjNOMWJ0SCt6eDdW?=
 =?utf-8?B?a2pjbUt5aHpGK1l5VUhiNHVuNyt6bE1UaWtwMU83S01Xa2ZISkJoYmRMUVI2?=
 =?utf-8?B?RndxVGlkSHViQWpXTWU3dEx6SjNsUno2OWZXb0NkZTlJSS9mVzBUSHZYNU5F?=
 =?utf-8?B?VllOMDI2MnBBeDkrbVUxd2E2VmpzazFrWG9Ed2ZaT2FHaWY2Y0RpRmVqRUJX?=
 =?utf-8?B?OGRMM1NSYk14SUhWWWNZWTJTV1VqcWliczRDUjFOaFhLSFA4VFlCRGNxa2NU?=
 =?utf-8?B?ZUNJalVINnprRXNNMmRFSlZyVVpiNFlTa09hNkJKLzRVRmY3L3RxVUcwczlD?=
 =?utf-8?B?bGE1WnJCVTVYb1BCNzhSbzNlOXdGdzNlRm9acHc3SWZVbWhrQ1FucXNOL3o1?=
 =?utf-8?B?ck1NeDV2eDhyOEVKK3FBZGowWlZiSFlGV2xEMERUYXlhdkZRbXlWTHdjL3pD?=
 =?utf-8?B?VFNQd2tySENoNjhadkw3UDhESDNEdWtHMHRrNE5SYStHZmZISVU2N3VraGg5?=
 =?utf-8?B?dWVBVE5VdWVzWUlhWW5SSTZzcE5LQmhKN05pSHVrOEJjZnZnMG1mNXUxQzF2?=
 =?utf-8?B?cDFTa0lKbFEwbnhqMmtzTTB4Q1M1aU5FVWFyNHArdUZNeTQvMElvdGs1M0RK?=
 =?utf-8?B?SzJEcldlVVZEdTJJRVNNREJiQlVnbnNDOFRyejJSc2hDK0NOTkcyV0NUTy9t?=
 =?utf-8?B?Vk5adFBlZnZIbUZoRVVGUi9xbWRrNDE0OTFqZU02UFFrUlNMZFlvRW1LZkc4?=
 =?utf-8?B?cG5ZRzVGNU9HRDJqMXpEU1UxU0pjcmVBalZ5SHJEakJ1YlAxQXQwbVRtY1Nm?=
 =?utf-8?B?VVpES0gzbVZTMFJoZE04YU9XNW1Cem1wQlVCTk5ycVppWFAxOXA5UFRqTDZa?=
 =?utf-8?B?MWFzbFdHcFRPeWYzQ2Nkcm9Cd1Z1RmFVenUrdzdodUdvT0J3bUtQN24veUFv?=
 =?utf-8?B?UVdkbnh2SHVHajRhZ3J6N1o5dmprN3R6eHVmc1FKVXlUWkhJait4ZnJ5aU03?=
 =?utf-8?B?QlVNTkZZeGs4dHVCL2ZpaFFNd29aVlpLYzJ6UlFIRVBrUjJDRlAwRkV6MlVX?=
 =?utf-8?B?SnJaUHdnbjk2bUlob25GbEJOdHRmdDB5Z3NuY00yamxBU29xRjFtWXlBRkVK?=
 =?utf-8?B?VHk5eGdUZkN1M1BBMXJmK0lMTFdIQ2tLcXBBY3pNTWhNWjBtL0NTNEZZUVd1?=
 =?utf-8?B?SWtJbjc2TFFzempSMDdDRmpwRTdyZW1KL3lldlRaVFdwWDVjM3d3RlRQY0Vq?=
 =?utf-8?B?NHRMYlJHKzU4amVkWHVURGFnelV2ZnVNbXlndExSRW91OUZSVUx2eTI5d1kv?=
 =?utf-8?B?TFBnVGdlS0JhSUJ5dHBYV0FnMmVtbWtOb0JUWEU1R1dVemd2aHg1LzNCT1Jh?=
 =?utf-8?B?eGxsdXRka0tIeE8xb0FuNEE3eXpId1NMWnpCR003VmR2dVNKT21Jell6SFdL?=
 =?utf-8?B?VC9TbU5ZKzVIS2QwcnlVc2l2VGMxQlp3L0ZJSVVLYWtPbHR1ck5VZzJEWXRF?=
 =?utf-8?B?MEkvdDV4NXhiKzFFTkh4aFFaUm43bjVHVTJPZlpBRXczYjJvR0VFUzVENERn?=
 =?utf-8?B?NXBEUDU3OUxpc3pldFFkd1VITnVMd01IWWxMeDZwK0JjTld1WWNXdFB0b0xD?=
 =?utf-8?B?MUdzcnNCNW1KM1RRY2l4SGtJVTA3cm0zNjVrdk83UHhzY0QzRXRqUT09?=
X-Exchange-RoutingPolicyChecked: wq44O724XQ4NlNVrMt3ZGGyfc07eoVgKIyGX/TqVebWxrGT0heyAEyu0S2f20gzlMfv/uVy81LloSJtkBTCYhOn616hBs9nIIDEp5YgQq/MZ9oALV/eaXPed5uLAIAoUjgFXTfZ4cOfqpmLxkgnE+QIYwYsjda9SaQYVlGZ9Fvi7tehDqxqSUI3uHIkf2Z+LdQqpbC/s49oXChgA4/ljInoCwrvJ0PCLRtZXHijZsIOJDsoMm4+Pd4qnrAiqNNNRQMVd5OEm11KqBaCH3bzqweBc3NKmt1wXM0glkcjoG/P9RxBNFAUwBxC72A2D3+V2gn8BT6X/fem6bPF+0bNIDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0012d3-412e-4efd-d9be-08df2b69bd0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:42:05.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vTzak+3M3inn1Y7zDjvG99vECKXJrcmqWQGf8o0DbcOFYiwasXQ28dP9yDvp6egx9qNdOQl4kBIkk4IAFj6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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

Hi Soham,

On 09-10-2026 23:20, Purkait, Soham wrote:
> Hi Anirban,
>
> On 21-09-2026 23:22, Sk Anirban wrote:
>> GT C6 assertions currently only print GT state on failure, giving
>> no insight into what kept the GT busy.
>> Add a helper that prints both hw_engines and powergate_info whenever
>> a GT C6 check fails or is skipped.
>>
>> Assisted-by: Copilot:Claude-Sonnet-5
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   lib/xe/xe_gt.c                | 33 +++++++++++++++++++++++++++++++++
>>   lib/xe/xe_gt.h                |  1 +
>>   tests/intel/xe_gt_freq.c      | 21 ++++++++++++++-------
>>   tests/intel/xe_pm_residency.c | 13 +++++++++----
>>   tests/intel/xe_pmu.c          |  4 +++-
>>   5 files changed, 60 insertions(+), 12 deletions(-)
>>
>> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
>> index 3d8b4f68a..aa61e1ddc 100644
>> --- a/lib/xe/xe_gt.c
>> +++ b/lib/xe/xe_gt.c
>> @@ -8,6 +8,7 @@
>>   #include <sys/stat.h>
>>     #include "igt_core.h"
>> +#include "igt_debugfs.h"
>>   #include "igt_sysfs.h"
>>   #include "lib/intel_chipset.h"
>>   #include "xe_gt.h"
>> @@ -229,6 +230,38 @@ bool xe_gt_is_in_c6(int fd, int gt)
>>       return false;
>>   }
>>   +/**
>> + * xe_gt_dump_c6_debug_info:
>> + * @fd: pointer to xe drm fd
>> + * @gt: gt number
>> + *
>> + * Dumps the hw_engines and powergate_info debugfs entries for @gt via
>> + * igt_info, so they are printed unconditionally on both FAIL and 
>> SKIP paths.
>> + * Always returns false, so it can be OR'd into an igt_wait() 
>> condition to
> nit: "OR'd into an igt_wait() condition" is misleading — it could be 
> OR'd with the igt_wait() result
sure.
>> + * dump state only when the wait fails.
>> + */
>> +bool xe_gt_dump_c6_debug_info(int fd, int gt)
>
> Is this function c6‑specific ? Could it be renamed to something more 
> generic?
okay, I will rename it.
>
>> +{
>> +    char *info;
>> +    int dir;
>> +
>> +    dir = igt_debugfs_gt_dir(fd, gt);
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    info = igt_sysfs_get(dir, "hw_engines");
>
> Is null check required ?
>
I guess it's better to have that.
> Thanks,
> Soham
>> +    igt_info("GT%d hw_engines:\n%s\n", gt, info);
>> +    free(info);
>> +
>> +    info = igt_sysfs_get(dir, "powergate_info");
>> +    igt_info("GT%d powergate_info:\n%s\n", gt, info);
>> +    free(info);
>> +
>> +    close(dir);
>> +
>> +    return false;
>> +}
>> +
>>   /**
>>    * xe_gt_fill_engines_by_class:
>>    * @fd: pointer to xe drm fd
>> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
>> index 93525ea35..3f5d4ee2f 100644
>> --- a/lib/xe/xe_gt.h
>> +++ b/lib/xe/xe_gt.h
>> @@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
>>   int xe_gt_stats_get_count(int fd, int gt, const char *stat);
>>     bool xe_gt_is_in_c6(int fd, int gt);
>> +bool xe_gt_dump_c6_debug_info(int fd, int gt);
>>     int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>>                   struct drm_xe_engine_class_instance eci[static 
>> XE_MAX_ENGINE_INSTANCE]);
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index 886537862..775e622d5 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>>       char *throttle_reasons;
>>       int gt_fd;
>>   -    igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>> +    igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
>> +             xe_gt_dump_c6_debug_info(fd, gt_id),
>>                "GT %d should be in C6\n", gt_id);
>>         gt_fd = xe_sysfs_gt_open(fd, gt_id);
>> @@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, 
>> bool gt_idle)
>>         if (gt_idle) {
>>           /* Wait for GT to go in C6 as previous xe_gt_get_freq wakes 
>> up GT*/
>> -        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>> +        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
>> +                 xe_gt_dump_c6_debug_info(fd, gt_id),
>>                    "GT %d should be in C6\n", gt_id);
>>           igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>>       } else {
>> @@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, 
>> bool gt_idle)
>>       igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
>>         if (gt_idle) {
>> -        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>> +        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
>> +                 xe_gt_dump_c6_debug_info(fd, gt_id),
>>                    "GT %d should be in C6\n", gt_id);
>>           igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>>       } else {
>> @@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, 
>> bool gt_idle)
>>       igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
>>         if (gt_idle) {
>> -        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>> +        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
>> +                 xe_gt_dump_c6_debug_info(fd, gt_id),
>>                    "GT %d should be in C6\n", gt_id);
>>           igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>>       }
>> @@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, 
>> bool gt_idle)
>>       igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>>         if (gt_idle) {
>> -        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>> +        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
>> +                 xe_gt_dump_c6_debug_info(fd, gt_id),
>>                    "GT %d should be in C6\n", gt_id);
>>           igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>>       } else {
>> @@ -412,7 +417,8 @@ int igt_main()
>>         igt_subtest("freq_fixed_idle") {
>>           xe_for_each_gt(fd, gt) {
>> -            igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>> +            igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
>> +                      xe_gt_dump_c6_debug_info(fd, gt),
>>                         "GT %d should be in C6\n", gt);
>>               test_freq_fixed(fd, gt, true);
>>           }
>> @@ -430,7 +436,8 @@ int igt_main()
>>         igt_subtest("freq_range_idle") {
>>           xe_for_each_gt(fd, gt) {
>> -            igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>> +            igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
>> +                      xe_gt_dump_c6_debug_info(fd, gt),
>>                         "GT %d should be in C6\n", gt);
>>               test_freq_range(fd, gt, true);
>>           }
>> diff --git a/tests/intel/xe_pm_residency.c 
>> b/tests/intel/xe_pm_residency.c
>> index e976048a9..65f35569a 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, 
>> enum test_type flag)
>>       unsigned long elapsed_ms, residency_start, residency_end;
>>       struct timespec ts_start, ts_end;
>>   -    igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d 
>> not in C6\n", gt);
>> +    igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
>> +             xe_gt_dump_c6_debug_info(fd, gt),
>> +             "GT %d not in C6\n", gt);
>>         if (flag == TEST_S2IDLE) {
>>           clock_gettime(CLOCK_BOOTTIME, &ts_start);
>> @@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
>>           close(fw_handle);
>>           /* check if all gts are in C6 after forcewake is released */
>>           xe_for_each_gt(fd, gt)
>> -            igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
>> +            igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
>> +                     xe_gt_dump_c6_debug_info(fd, gt),
>>                        "Forcewake released, GT %d should be in C6\n", 
>> gt);
>>             if (n == NUM_REPS)
>> @@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
>>       int gt;
>>         xe_for_each_gt(fd, gt)
>> -        igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>> +        igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
>> +                xe_gt_dump_c6_debug_info(fd, gt)),
>>                     "GT %d is not in C6\n", gt);
>>         fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> @@ -581,7 +585,8 @@ int igt_main()
>>       igt_subtest_with_dynamic("gt-c6-on-idle") {
>>           xe_for_each_gt(fd, gt)
>>               igt_dynamic_f("gt%u", gt)
>> -                igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
>> +                igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 
>> 1) ||
>> +                         xe_gt_dump_c6_debug_info(fd, gt),
>>                            "GT %d not in C6\n", gt);
>>       }
>>   diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 364e643fe..a123d0d50 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -876,7 +876,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>         pmu_fd = open_pmu(xe, pmu_config);
>>   -    igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT 
>> %d should be in C6\n", gt);
>> +    igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
>> +              xe_gt_dump_c6_debug_info(xe, gt),
>> +              "GT %d should be in C6\n", gt);
>>         /* While idle check full RC6. */
>>       start = read_idle_residency(xe, gt);
