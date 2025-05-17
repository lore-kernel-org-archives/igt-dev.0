Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43727C2D0CD
	for <igt-dev@archiver.kernel.org>; Sat, 17 May 2025 03:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5510E0F4;
	Sat, 17 May 2025 03:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jjIvSHCE";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AA810E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 17 May 2025 03:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OahbaZv8hKPIs/fl7UrcKR9GhtmH/RMqk1sPWyMal2qcu38jYwoQ8XIBUumqVLXEUycfro09vmbFs8eDCC55wA9y84kKsEEeeXnH/XvaWdqt9XRUO1OsC8OyJNpHBNfzPTgUD5uIsJ9CXJebJOWcDNyyVsDuhjDXfYz3yT51hY4ho4WDlvfXHT5k5o1VscQkxDg1kLLXaRPaT5ntirCJ3ApCAv2l9kt4WAmWfntaBMzE02vhGS3SpY9U/YUfnTVbN6MbUqYH2Tqui19SKSzpkoNTyaA7hHWoEqyOLa3oHBicvE1/UG+a7JHkfBggcjF+bH6U/umi9QTKqT37XcWR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5If/V5sV6WmSYCv4Pcx+xmaE5ee13VIDjoCLg3jXR2U=;
 b=KFgqb4fxkr9m2HSoEWzLnBlnEaa23CQjay7HvPqlq5hDYyWqIc9U3x24NIF0RlaLtWm/watGT7fgM9qXOSB7Uiirk2qR/uqK2dE9TPq52pG8arzoEzElKAz2geUkvCKccY+B5REvNRKcoOQbBgEdAe2fU3gZNqF4/SiM+wsdkJTgOHy6R0jqgMcF+jHw/7Yp5grUrquE9gemz6gvM+AjLPKqytIw4Zo1H+NPeExYRELMsSsvlU2ZsYBL14PzAJAcRJxCmGrU9piQ8mmeq5WqG+TTnddqruHrId9DSuk2PcwitB648OEoThjYSCdAjGUg2ctuify2Bpkenv8UCYnJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5If/V5sV6WmSYCv4Pcx+xmaE5ee13VIDjoCLg3jXR2U=;
 b=jjIvSHCEC+ayEDqSqOn2LUJpgZwFwjsVzDOF7SOeWMr85u5tl/FQfGEGwouMJD5VMi2YcKVgTQw3tKVKLN5RTarbbOb8K832u2/pKWiOBciHWsNc/ycTqPFs0tNjwyRXQIbrY4mHtjCBvZk49MCKtTXpAAYP7qw4OJiLyae/mqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 03:24:58 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8722.027; Sat, 17 May 2025
 03:24:57 +0000
Message-ID: <93feeb43-fbb9-464a-92bc-b81de74d3f61@amd.com>
Date: Fri, 16 May 2025 23:24:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/4] lib: fixup print/scan formatting for files
 in lib
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org,
 George Zhang <george.zhang@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Lyude Paul <lyude@redhat.com>
References: <20250516115811.135889-1-jan.sokolowski@intel.com>
 <20250516115811.135889-2-jan.sokolowski@intel.com>
 <20250516163944.ozlkn743ha2tuuze@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250516163944.ozlkn743ha2tuuze@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 07937a5b-c12a-4cc5-cb28-08dd94f26602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXZ0VkNkYlpQc3YxVHh5QndEZWNyNEpLRmlZZVhHQW1yZnAzeUJjdFZmOFRk?=
 =?utf-8?B?c0pBcEcxVnM0TXhObTZVZklMVlo3WDluNUx4bFhmYzAxZGF5R0Zpc2YrRytk?=
 =?utf-8?B?QSsvRWsvbFltUXVPdDczNTZoKzQrcDFqaWUyVzhBTnBTNkpWcnl3WUtZM3Rv?=
 =?utf-8?B?c2lIYW9kRmhpakpycmlUemhSVEtWMGNSeEdkcUdxOG9lMTNvUVJXVWR6dTFW?=
 =?utf-8?B?OXFsWXRjbXlBWmhjQTZaYVpteVlXZWd0bTkyenV5V0NNUWNVcVFCL1Z3dHR1?=
 =?utf-8?B?bUlTa3pYRE1PUnBBdzNEUDZva2g4VGNYRStyUmNIOXJvaU0yaTZqYzZlT25Q?=
 =?utf-8?B?Mks5eFdXME9IeHFmSzIwY25Gd3hlRmVSTFJsK0ZnaFp0MEtsNXM4eTlwRDZR?=
 =?utf-8?B?aVZ1WXo0UzJGYjB2MktmdjQ0d3ZjdHdiUTJ0eUlSY0JRV1J5N1VKejUrazk3?=
 =?utf-8?B?Yit6UzdKU05UYXE2OXMwVE40YStucXU3cVRJWGNka3VRT2lEa1BwSng1WURU?=
 =?utf-8?B?R204cGhZNlo1MkQxSnF5TUVITnNsaXNZeE5STFgvYTNPb0E5Uk4xWTBnNjh1?=
 =?utf-8?B?dVlWS0RTVVpJUVVOUFNsajVuenRoVEsvRjU0bnlPRndmcWxDMWZ1UjBBWkVU?=
 =?utf-8?B?WUZqQ2RtK3kyY1JSNS80QlhrUTU3d3FabnZQYWlRelgrRWx4VUVubkt1Tmgx?=
 =?utf-8?B?ZE5sWjQrWDdWei9CSmJoYVhIZktMTUhyY1A3SEsya0NkL3JqNGpObE5HM0ZC?=
 =?utf-8?B?ZGpucElRdk52NU80WTBmVmhlQ3ZmYXVLaHBZWGsrVEpKc2d3aFplN2RuazdY?=
 =?utf-8?B?MkNlUWhHZGUzZFY5aEhYOWFlWU5nMlpnVCt4WnNveXlrcHhHTU9vTXdWVjRR?=
 =?utf-8?B?eElvTFVrZk5EVWlnQmpDbnVZS0EramJiTm1nWURMdjNkUXBzZ09RYy9EUWdJ?=
 =?utf-8?B?ZzBSRGYrYzM1ZEg2ZkFWQVhnUHg4dFV3ZCtXaWcwOFArQTI5dU1uQmNqRUJ1?=
 =?utf-8?B?TVBtUS9XUkdJSDhBYUpVS0pHQXBLQmFIZHlqcWgzV04xM05HbFZFYzUzT2Ev?=
 =?utf-8?B?R0F4d210bkhXVjBhTkRFWDVHM0ppK1BXYkpRL3pBd05PdFVhRWJNL0pSVEhN?=
 =?utf-8?B?blJUSi9zcXpFMDZFeFEwU2R6dmRWVDI5UXJWZFROZXFURmIwVUpNbnlKNUxY?=
 =?utf-8?B?S2drMFFwMERWdFd3VkUxUGZDMit2STlwK0F3MFNGQ09kYjZqQUwzRDRWZ2pa?=
 =?utf-8?B?MTRWeEJ5RUJaeVFwMGJwL3IzTGZMQ2FUSDQvRVlNL3FjVkQwRHpSc3dWNFZP?=
 =?utf-8?B?bzNsdDA5SkMzSWQ0Y3ovNmVEdVNmckQwMlZ5QWxZMHhpYTBzMHc1cU0vYm5V?=
 =?utf-8?B?NW00alNpWWVyUlBaRXhUNE5ScUNuR3ZkbytZZHdvQ2xWT1BhOVRCTEJsU1hX?=
 =?utf-8?B?eGt1VmkzY1k4NGNYWTBmZGtWQ25Ja1V5MkJPV2dqS1U5TWx4eVRDNXlSaGlG?=
 =?utf-8?B?VnMvYnYxZnkyT1ZSbzVCOHY0Yjk3TEdGVllqbWlmT0NBQ29TOUVacmlXbmJm?=
 =?utf-8?B?T0YzRFo5S1U2bW5HcDlTUUQ3WGZYNUR1NFArd2QyZS9iZTd3STZtMW5FakFW?=
 =?utf-8?B?Z1AzYi8veE5iUkZmNDhudVRKOFQ1akMzbjNLNFMwSWE5NXZTcmtSVFhsQnh0?=
 =?utf-8?B?bm9USUYwQW44YUszMHpjMisrZ085b2F1RUJjckt5UlZFVXgxbjd3UXZHNnJZ?=
 =?utf-8?B?d1UxaUc0bWZBK3hSeVB1NDhtUVF3U0ZXdkNXSFltT0JtL1dWRWowNUQvaVRu?=
 =?utf-8?B?QWhQbWNMRWR4aWZhTWFnMlYxUXFMY1EwSW9mMXlOWFJHTENKbE9xYnZuUVJZ?=
 =?utf-8?B?VVJPU1BURjFKemtKc0hFUnhtaVpnTzh6MEVYWTk2V20zKytlTEhVOGR1OHVR?=
 =?utf-8?Q?L3BKlakr3gM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9Zd0orcHMzQmxNSEo3MzJUeGt1S3NQcVMvbzBWZWNMUGlMUlQ3clFHWnZq?=
 =?utf-8?B?WEVMYjRZdEc2ZkZ0bzd5U3JydFNoUlZxT1hYcUw2M1NOZTdjamlXcDdXZTVm?=
 =?utf-8?B?cmlETFU4MFFxTzVQS3ZuMmM3aEFjMGhJbjV3YlJleFJVT3E3elBPWjY0emgy?=
 =?utf-8?B?bnZzTEx1NVA3WVR0bDV2NGZvNFJhRHRNN2pqZ1ZMcnhWZGNXWXFXcVQrelp1?=
 =?utf-8?B?UmVqdmluZG1IQTQ3VGxuOWcwbmdzNklSWGlsRFVsTlpLSjQzbjdMRGNuV2Ev?=
 =?utf-8?B?VE55SjRKbFJ1azdUS2J2YThnY1BxNko4eStZait6Z01sdlNpYzZkT0VDYmlr?=
 =?utf-8?B?YjVyY29YSTY3VS9DZWdpcHRVQ2M1K3dNZ0ZWMVNxRlV0OUxKYnNVSE0xVXY4?=
 =?utf-8?B?Nzh4bFZMNXdCbWV2bUoxV3BLZEdLeElLdFBhQjJ3Q2RCazhGbHZnYUxDa2c5?=
 =?utf-8?B?d3RSV1B0MDQ3czdBMGhXLzU4SnpVa0FSQU5pM3V5ZHJmS01DR0xRcWp2dXd0?=
 =?utf-8?B?T1dXWllqWVV2NFZ5TC9QQ3BYVWdmdUhZN2lKQ3ZjTkt5eHVPN3lKNU0yeVZ1?=
 =?utf-8?B?NWh4U3NyTU1rbFN5clpmTVNTNUY2elRGWmRoaitUSXNVVnpNTFNVV09URFVP?=
 =?utf-8?B?TG54RFNHeXhVWE1GbDYvcUVTd01FUGVJS0daTnlYZUZiOEpjWmVlTU9qRTFa?=
 =?utf-8?B?YzQ0bHYxd1hmOUhtYXBVeGdEcVREQStLd1grMDZoSkdjeTFJNFpVK2xUckU2?=
 =?utf-8?B?ZW9wUDNObVBUcEEwRUNJMVFLc1UzWUROa0RoeTdvcHI3Wklrd1UzMWwxUml2?=
 =?utf-8?B?SVVOUTliTld4cE9Nd0VTRGM2N3doYk5tQ2hYcVBRalBxVUpJWHBZeXVRQVc4?=
 =?utf-8?B?ZUhQMmwwQURxaEsvRnR1SFZnZGh0WmxyTnEzVDZPQkx1YW56RlNFOXJiU0hP?=
 =?utf-8?B?bXVsRFZib2xld1dBR2wyWmdHekNQSGkwTGdPY2pFR3FjR0wwWTM1bm1UTUM3?=
 =?utf-8?B?UDVjTFRmeERBelMzaDZDM21IUENqT2YvY2lPaXphS0lGdEtNTUwwRG05QVZa?=
 =?utf-8?B?bHAybDk1S0w4QWlQWTNKN1lqb2JxTXFmRE02VFFlaHpoMlVzdjJGYXNXbmVN?=
 =?utf-8?B?bmxKOThIZGNOQXFPbjFVVDVFVnVwTFFZYjZNVmwveHlrZzl5QUJQa3FIQ1Nm?=
 =?utf-8?B?MVZDczludFg0T0ZpVTFGWnRCaVlUZ09JYXJscklDQXRUeHY5dWpZYkpLOEdk?=
 =?utf-8?B?L2dWNkp1OXJCZ0p1VFNqNXFZdWhDSDNzQXRBT2pCMUZEbDduMk5VTDN0UHRo?=
 =?utf-8?B?WVhNdkI5cHlkTnc1TnlDS2ZtRnZnL0tTN3ArN1ZCTm5wWVpzaGJGbUdlaFFj?=
 =?utf-8?B?Z0VYcGdZZEdUTTdQZGtwMEEwMUNzV2pRN3hoME1oSmp2dW0ydFdIY0trR3Rp?=
 =?utf-8?B?ejR1R2VtUU5PQVMvaDdaKzAwejF2SzNZOCtnKzR2aTVQRVU0eWZtVlFGdkx3?=
 =?utf-8?B?MWVqK1QybmVMaU4yeTkwNkgzaW1TeCtaSFo1azlGYi8raVB5RGk0MHB2UDZN?=
 =?utf-8?B?OEVCOHBNRms0QUYzbW83ODcvcDd5elYzNWY3Ym0wOXhOVHhvTmVDQzdzbzFi?=
 =?utf-8?B?TFhWbW1aVCtUQU1BN1RPZWhsMmhYTGZZVFFUYmFYNHRVVW43UGZxUW9kTWp0?=
 =?utf-8?B?c29zUUNqSG5HR3lRR2twczgxN05uTGlXM09nakcxR0xzT2c0Uzd1aFBkUXoz?=
 =?utf-8?B?QW8rWUMrL2JCU1MrMW1JaFg2cVJPQS9Ed3FpeGNEYmx3dWkxYXVzQUIxM0lh?=
 =?utf-8?B?T054aGNJVmZXZGxIRDE3K2pNc1lvRkJ6ZDhGYVg3TXZOOFRtNlhOOTVwaTdL?=
 =?utf-8?B?NWxDdVgxL2N0OGdDcHRnRll3VTdnVE5vam41OXZpbHczNHhhWUNncWhlYWRP?=
 =?utf-8?B?MDNHTy9pd1U5MzFENGd6aFd6OE5Ha1ZQRmp5aVhtNW5YMTRpZkU2NXdKRVVq?=
 =?utf-8?B?UU5WUlErTVg2UEhhSUNjcUVlR0xPN3gwcENQZHJ6K1RSZ3pVMm5hL2hJQ1gx?=
 =?utf-8?B?dHdpUUZkWXJGQmZCYmFPeThHYkNONEREMnRhc3NQbnUvSzh5bXN2dEdZWXRQ?=
 =?utf-8?Q?LYp/b3VC8/vluGlw2+YOaxjE+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07937a5b-c12a-4cc5-cb28-08dd94f26602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 03:24:57.3881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr3w7o2gvBRmeEjht7DfMh3YE9gAWxi89msEgcAS7SXyc1WeKHDBU1Ih0oRWbzK+JG968V8K//obIxyBe2laAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
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

Thanks Kamil for adding me.

On 2025-05-16 12:39, Kamil Konieczny wrote:
> Hi Jan,
> On 2025-05-16 at 11:58:08 +0000, Jan Sokolowski wrote:
>> Compiling on other architectures than x86-64 causes a lot
>> of print/scan formatting warnings.
>>
>> Fix formatting by using proper formatters, eg. PRIu64.
>>
>> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
>> ---
>>  lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
>>  lib/igt_nouveau.c                 |  2 +-
>>  lib/igt_perf.c                    |  3 ++-
>>  lib/xe/xe_sriov_debugfs.c         | 18 +++++++++---------
>>  lib/xe/xe_sriov_provisioning.c    |  2 +-
> Could you split it into four groups: lib/amdgpu, nouveau, perf, xe_sriov
> and also add to Cc respective developers, here:
>
> for amdgpu
> 	Cc: George Zhang <george.zhang@amd.com>
> 	Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> for nouveau:
> 	Cc: Lyude Paul <lyude@redhat.com>
> for igt_perf use: git log -- lib/igt_perf.c
> 	Cc: Riana Tauro <riana.tauro@intel.com>
> 	Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> for xe_sriov:
> 	Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> 	Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>
> or at least please add those dev to Cc when sending next version
> (if it will be needed).
>
> Regards,
> Kamil
>
>>  5 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
>> index 98251061c..1fcaa6745 100644
>> --- a/lib/amdgpu/amd_deadlock_helpers.c
>> +++ b/lib/amdgpu/amd_deadlock_helpers.c
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include <amdgpu.h>
>> +#include <inttypes.h>
>>  #include "amdgpu_drm.h"
>>  #include "amd_PM4.h"
>>  #include "amd_sdma.h"
>> @@ -249,13 +250,13 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  							0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  							0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  			r = system(cmd);
>>  			igt_assert_eq(r, 0);
>> @@ -266,7 +267,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" SCNx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}
>> @@ -523,12 +524,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  
>>  			r = system(cmd);
>> @@ -540,7 +541,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}
>> @@ -592,12 +593,12 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  
>>  			r = system(cmd);
>> @@ -609,7 +610,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" SCNx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}

The amdgpu IGT changes looks good to me . Thanks!

    %ld → %" PRIu64 " (for ring_id)
    %lx → %" SCNx64 " (for sched_mask)
   Ensures portability across 32/64-bit systems.
   ring_id and sched_mask are uint64_t.

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

>> diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
>> index fdf6020a3..62a53c8b1 100644
>> --- a/lib/igt_nouveau.c
>> +++ b/lib/igt_nouveau.c
>> @@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
>>  		gob_height = 4;
>>  		break;
>>  	default:
>> -		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
>> +		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
>>  			      modifier);
>>  		break;
>>  	}
>> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
>> index fb2b73915..2b7170094 100644
>> --- a/lib/igt_perf.c
>> +++ b/lib/igt_perf.c
>> @@ -5,6 +5,7 @@
>>  #include <stdlib.h>
>>  #include <string.h>
>>  #include <sys/stat.h>
>> +#include <inttypes.h>
>>  #ifdef __linux__
>>  #include <sys/sysinfo.h>
>>  #include <sys/sysmacros.h>
>> @@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
>>  		return -EINVAL;
>>  
>>  	buf[bytes] = '\0';
>> -	ret = sscanf(buf, "event=0x%lx", config);
>> +	ret = sscanf(buf, "event=0x%" SCNx64, config);
>>  	if (ret != 1)
>>  		return -EINVAL;
>>  
>> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
>> index 8f30fa312..b81b3532a 100644
>> --- a/lib/xe/xe_sriov_debugfs.c
>> +++ b/lib/xe/xe_sriov_debugfs.c
>> @@ -105,18 +105,18 @@ static int parse_provisioned_range(const char *line,
>>  	switch (res) {
>>  	case XE_SRIOV_SHARED_RES_CONTEXTS:
>>  	case XE_SRIOV_SHARED_RES_DOORBELLS:
>> -		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
>> +		if (sscanf(line, "VF%u: %" SCNu64 "-%" SCNu64, &range->vf_id, &range->start, &range->end) == 3)
>>  			ret = 0;
>>  		break;
>>  	case XE_SRIOV_SHARED_RES_GGTT:
>> -		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
>> +		if (sscanf(line, "VF%u: %" SCNx64 "-%" SCNx64, &range->vf_id, &range->start, &range->end) == 3)
>>  			ret = 0;
>>  		break;
>>  	case XE_SRIOV_SHARED_RES_LMEM:
>>  		/* Convert to an inclusive range as is the case for other resources.
>>  		 * The start is always 0 and the end is the value read - 1.
>>  		 */
>> -		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
>> +		if (sscanf(line, "VF%u: %" SCNu64, &range->vf_id, &range->end) == 2)
>>  			ret = 0;
>>  		if (!range->end)
>>  			return -1;
>> @@ -232,8 +232,8 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
>>  				  nr_ranges);
>>  			for (unsigned int i = 0; i < limit; i++) {
>>  				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
>> -						  "%s:VF%u: %lx-%lx\n" :
>> -						  "%s:VF%u: %lu-%lu\n",
>> +						  "%s:VF%u: %" SCNx64 "-%" SCNx64 "\n" :
>> +						  "%s:VF%u: %" SCNx64 "-%" SCNx64 "\n",
>>  					  xe_sriov_shared_res_to_string(res),
>>  					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
>>  			}
>> @@ -504,16 +504,16 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
>>  	while (getline(&line, &n, file) >= 0) {
>>  		switch (res) {
>>  		case XE_SRIOV_SHARED_RES_CONTEXTS:
>> -			ret = sscanf(line, "GuC contexts: %lu", value);
>> +			ret = sscanf(line, "GuC contexts: %" SCNu64, value);
>>  			break;
>>  		case XE_SRIOV_SHARED_RES_DOORBELLS:
>> -			ret = sscanf(line, "GuC doorbells: %lu", value);
>> +			ret = sscanf(line, "GuC doorbells: %" SCNu64, value);
>>  			break;
>>  		case XE_SRIOV_SHARED_RES_GGTT:
>> -			ret = sscanf(line, "GGTT size: %lu", value);
>> +			ret = sscanf(line, "GGTT size: %" SCNu64, value);
>>  			break;
>>  		case XE_SRIOV_SHARED_RES_LMEM:
>> -			ret = sscanf(line, "LMEM size: %lu", value);
>> +			ret = sscanf(line, "LMEM size: %" SCNu64, value);
>>  			break;
>>  		}
>>  
>> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
>> index aa265247e..26b7ed8dd 100644
>> --- a/lib/xe/xe_sriov_provisioning.c
>> +++ b/lib/xe/xe_sriov_provisioning.c
>> @@ -75,7 +75,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>>  
>>  	*ranges = new_ranges;
>>  	if (*nr_ranges < MAX_DEBUG_ENTRIES)
>> -		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
>> +		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%" PRIu32 "\n",
>>  			  vf_id, start, end,
>>  			  (end - start + sizeof(xe_ggtt_pte_t)) /
>>  			  sizeof(xe_ggtt_pte_t));
>> -- 
>> 2.34.1
>>
