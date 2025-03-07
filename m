Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF7C19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 03:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5810EABE;
	Fri,  7 Mar 2025 03:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JaplfGX5";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561B910EABE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 03:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEnlCBaZXxiF73emAd/CTCxUBEiqikutovlFb7qbAb5RUIaNmwkGa4ogR7BKV9prwSwT2f+r3Ery5TINAsdoT+8eG5qqblMnXp4ecaCLdKf4V8l001xCGtTvBjfhwDXnZCpuM6fGhmUmMIefTwiZ1vxI3t4W0OYBgUFYQhaTdP6WVhcumr7jDDGakh5hzKj1VU9bZNSy5wZymYx7VpbQ4/8nMM/iu7guUvEeVJSHQgflhEmitJtkTNwb+g/v78COAlfFS+UWlYx0JealHVAURmqX6QbgRXluSc94A6Ke8kPeaGben3Yk4+V1f7WPIhgNdbOfY4CPAJ8+Ooxa58cCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9h9VAjXdn+jyxIc9j4Af3hDkb8n3U1sGzzdzA763oU=;
 b=WO6lyYX7qjCYit2nQTJxtzrJnsKBHNxd5kQEaaS9f9f5GijMYeJR9JAOgTZFpOUjx0i5T+xRJpjpnsihwr1h4diIc2+u5HNzaoy+hAneEWQMc69Om96twpAuSFA+ZeWl+O1o0li7zObDWF0mIWeOLAGfzVDBMUgM+KPCxu/r1ZBCo9Y/h6/sZKw6BNMIGWgk/6/K4vqcQHlV11GppU/cx57DZ/LUhJYHb2sXwZaArJLqsHgLemTqeNSH+dxI9A8Yj6lIKJhZsszxESw4bu+KdDBf0NBCgGmW27B+pvitWhgIst8DLvoM4KbXHfqHrDmTzE6kozEnn77VbS4q1ROpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9h9VAjXdn+jyxIc9j4Af3hDkb8n3U1sGzzdzA763oU=;
 b=JaplfGX5ouLcazHhMBXvyFzWOAxIEw27gdA9QhMssOJpyN14y9cSvrM3REnf2OO+iBRCqmVQvOjacjD+lzLR8ztdmBMD1U++d8nEE4JLgIeIzsc578OB4laZJYhkLoKuCy7pVE9GIQ+HBT2MJ2GWnX8n31EQTnvqSsgojA2XZd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 03:59:36 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 03:59:36 +0000
Message-ID: <0a7e30d7-7190-483a-ad4c-2401dd6dc036@amd.com>
Date: Thu, 6 Mar 2025 22:59:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 i-g-t 1/3] runner/kmemleak: library to interact with
 kmemleak
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, vitaly.prosyak@amd.com
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <20250227101853.361504-2-peter.senna@linux.intel.com>
 <9290bd2c-7e90-45a6-879e-1e0f25192a43@linux.intel.com>
 <20250306123229.bmy6fhk7nojrs2wg@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250306123229.bmy6fhk7nojrs2wg@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::23) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b05d35-46d9-48bf-d1e7-08dd5d2c7a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXREcUQ1Q2o1NDE1N3BMNjV4QWhYcWhZRDBORHV5cVgzOHpKNGpHc0gyZytQ?=
 =?utf-8?B?R3Zqd3F2Q24yWk5aTktZN2c2ZDlkT1FiRk9jS3ZIbVlHMlNrbzlwTWtDNWd6?=
 =?utf-8?B?cDVRUTdLVmMyaWhUTjRQRW40K21TZVNDL0l2OG5CNDBydzNjbm1RZVVrQm9J?=
 =?utf-8?B?RHFqdnM2N0lsMkdZZWRMSVVsWktwUy9YTGx3ZFJseXFSSWZoT3V2L2ZuR3hO?=
 =?utf-8?B?MzlZcFgwdVErRkNzMDNuYjR5ckVQcUl5dG40cEo3cFFPQ21pY2luOGVPbFBy?=
 =?utf-8?B?RGgvYlZ4OGRMc2ZqVUI2eTBjRmttVnI3TCtGNTUzYTJ6ZEx0M0dWc1Q2TTZ3?=
 =?utf-8?B?UTRoc3l0cEtVckJFdmpXRlp3bFFSZHFtWE5kY0djRU00Z0NITVBKTkxNckNT?=
 =?utf-8?B?OGZIM011UC9zRlNJK0xoZGpQeGdIdXc5TElmakx5THR3UHV6aTlZOWhYclZa?=
 =?utf-8?B?dkxnSnFDcDZ2aVpLK0RrMXUrM2tmTDlUMEZGalM5cGVpT0MxeEJ2SitPd2FR?=
 =?utf-8?B?V2ZXMXBCSXRwd0N3aHFXalZodExIc3lhTzhnamlDKzh5S1lNTkFGanFQOGpD?=
 =?utf-8?B?dkYzNzNCUE1CbmZoQXBqT1pVUGdYUE11QWtRSzhzUHFJeUtjajBFL2k2MFVs?=
 =?utf-8?B?NEVrSk9xS29QVjR4NjNKd3Z5aXkyc0d3eU1UeXAxL01NTnRhaDdCb1hnTy8y?=
 =?utf-8?B?Y1VYeWdhK1NXWXN4N0Q4L09nakk1em1pdGlOMGhqYUlHYTVTeEJxTCs0Ymtm?=
 =?utf-8?B?cmZ6R1pwZEkrY2lwUHJCN0kxcGlVMWIvektrTTFxUzgrSzFKWDVDUXY1a2Y0?=
 =?utf-8?B?M3JSajYrSVpkbEZSa0xiVVhnMjVVclErbWd6SlJrVzdPYmNURlo5aG5xQm5w?=
 =?utf-8?B?azhLcGUranZTOVE1U3Rtc0FKaTU1SUdCbEZjdU1NdmpHeVBQNHg2dmxjZ0g2?=
 =?utf-8?B?Y255WDM5YzBJenYzL1ZvSUdpZHIwaDM4Wk8wa0FkdWdzck5kZ3ZkNW9Ma3pJ?=
 =?utf-8?B?QXF5YWVkVGo1YzJIVkJ4Q2V5ZkRMNWNhZi9GVkdBcG5KNFJyV0htWEdUNkVy?=
 =?utf-8?B?V282SlhFT3RrWm9ERVdnVXBFZGhvUFRFUzFVdE94UFZSWnpBOEY2YWY4NGhO?=
 =?utf-8?B?eVQraDNRSE1nL1lFa3grQmRZUFRVc3VDOERoMytPNFgzYkZKOHVrODhEbnAx?=
 =?utf-8?B?c1BGbkVSZHVHc2xYVGh2S2VlSzMzMVRxZCsrb215VkpOdUg4N1I4a1I0M1g1?=
 =?utf-8?B?T1VaRUVMUU1HS1ljUVJja0FkY1dCeXFzWDRBTFFqRDRsekViYzNEazFITmdw?=
 =?utf-8?B?TWEycUV0ZEo5SnBOMXVkL3Z1bXBScHV2S1pKTzNvL0g0THYzOFpOOTE0Ry8y?=
 =?utf-8?B?emY4WFNlaVVBNmhwaCtXZExUaCs1b05CcmJUSUU0eEROb2w3RmJpcjJ6N2dx?=
 =?utf-8?B?Zko5aEFEbGpBNXNNTW5lM3doenNsOExVeitTQ2M3N2JQaGFRNXB6UFRmb1VN?=
 =?utf-8?B?bDVuRloxRVJ2bkNXT1FtN0owSFdLR1JTMUxIbzMxQkVtcWR2aVdZbUFUT1Q0?=
 =?utf-8?B?dG45NEpwSTExeFk5T2xYNFBGVEE2SW1tWEZzZC9wVzl2VG9SMzJBTEN4bk1C?=
 =?utf-8?B?N0RxalM4MmJjM3F6NHdMSktQeHZNQTFiVmpxcEFORHFwS0NXT3NEMzkxNmxu?=
 =?utf-8?B?Nm8zZTI3VHNkU2xyMTBqQXRxUHc5VDNpaVh1eVVxL1RCUHBXZVVTcjdCcUVv?=
 =?utf-8?B?dngyMjN0ZjI2RlRhRlNEVGFrZ1B0K29lRmpCYVI3RTBFdklpalk3NzlaVUZ4?=
 =?utf-8?B?MWFEcEh5WTNvM0NGWmFEMGZMVkYveWJEeUR6c3ZTZ2dTQVE0VHNURWdZTUNR?=
 =?utf-8?B?MnhEWGt5NnRnYjlRL2lBM1VVNjFmWGRFUlZNS2JvU28xUWlZUVh3UXdUUDc0?=
 =?utf-8?Q?//1dSlh4ODLpbiN0m7T+bvi+XQWXo6Na?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlXSXltTGlPK0Npck1KU0ZlRGdhbm95UmtUM2tTSzZpZCtqOUx3S1JRT0g2?=
 =?utf-8?B?eENIempjN2p4Vkk4U0p4TkZ4V1RpOEFaMWQwOU16L1BURFJJRnZKYzFkcUFX?=
 =?utf-8?B?eXAranVHcmFxNUcvdnJ1cGxtOWJrN1dOa29lZjRLTjJSbmRNa2t1V0RKcnJQ?=
 =?utf-8?B?N3AyNDNsSThiclc4VFpWZUlJalpZTnQzMkVycGdyUXNya3dza2JuZHZZK1dx?=
 =?utf-8?B?cm9DOEJQTlpVNEpXKzY5cjM1OVphRUIwWmxhMC9CQWFkR3NFMEYxOTFvY0Yr?=
 =?utf-8?B?eUEyUTRaTHV1YzBCRG5adjVVR0VwM1I0QmVVWG9FRWpqWlNRMlUzSkZUblNL?=
 =?utf-8?B?NHVPcm9xME1mNmZjS3FIZjVPcVBYaCtpdUFJRXZNSVE5VDlYRkhTZUtwS29S?=
 =?utf-8?B?bXN4Z05sMUdJQWJ0VFVxVmlHbWxMM1dLOElETG0zcDNaSm1scHhaV2Ixc3Ax?=
 =?utf-8?B?K01rTFV5aXluSEI1UlFaTWNTeHU0S3JIWjZPSC9FdzNWVlh3d3VkRTQ2Mlhn?=
 =?utf-8?B?WnQ5SjFTZUZ6ZEtrOTdNODB3UEZGZWp5Zm9EVlRxQzNXWlpMTlVJQ1NSWWVB?=
 =?utf-8?B?SEhMemZtOU93MkJOa2JCOXMzeUNFRnJvRlAwbXRINHZRRWxwTzRiYkJiYmZK?=
 =?utf-8?B?WGQrb3cvR0ZTNjhWRFZiNHJwMFQxS01LTmxhK2U2dWpxRWw1VUI5RXV6UGFt?=
 =?utf-8?B?YkVEYitMazdnQy9Gbm9zZGJhd0NEdUdYM0xkZjYwRkN6Ny9RdkxlNDNWN0ta?=
 =?utf-8?B?amV4ZTd6RUloTHpJeWxjcjFMcloxczVaSHlDNWZYUnpSYjl0MG5IbVBqTm1F?=
 =?utf-8?B?RWdzNnJBMFgwSk9saU02a2dHZFFzLzgrTVZlaXgzVWtVVWt4eVIram9aMUpN?=
 =?utf-8?B?QW1Wa2FRb20vaVRlNzV6L3dFZ3VXbGFjcHJpQ2o5alVlelBQcWtOdXpRMjdT?=
 =?utf-8?B?OUpEV0YzQlM3MUJVSGtucWpadzFNQTYxckwxb2Vla0lnWWcxRUVWSmg2RTNS?=
 =?utf-8?B?OE1adEpNTk9XR3FmbFVReXpYdEU1UXYwaWo3azh1d01lRHRabmV3MFRLVnRL?=
 =?utf-8?B?dy9oYTFMZkFtNktzdSttSE5nck16dzB3ajZCY0ZBTTB3K0s4MjQxcjJpMlFq?=
 =?utf-8?B?eWJaQ0F6SkhnakFIYllCVWZVYkVLeXNudEE4UmRWN1Zoc1U3R3UzUDRKd1BT?=
 =?utf-8?B?UHRndHNKUCtKWVBhaTJQN21YTFRNUVZuakpPWkt3UHIvVUZpREJ1TTVBQXZo?=
 =?utf-8?B?OFFOY0RSS1ZMRDA2bDQ3Njh6THFzYlB2akR2bGlzZnhZajFkcFdTRUp3cHpK?=
 =?utf-8?B?S1Nqd3BiWWVaWGpKU2VXVkNyZDdwa2U1SEgxc2FoNHNDWGdxd1N1c0VOWmY5?=
 =?utf-8?B?NHFrV2I1ZitDVmVJckxLMEdST3RlVkZNR1h4ekhYRWkxcS9xRnE5WXV1ekNG?=
 =?utf-8?B?cGExTFh4OWxVL1ZTbmhMZVQ0Um9oUmdvTHpLa0FSREI4Z1pCNDlSU1FWY0lD?=
 =?utf-8?B?cy9MT0hqWXF6OWdJNFJXWG9GMkJSemNkSTBoaEF5R0VnS05SV3JwVVZYT2Nx?=
 =?utf-8?B?a1pVdDByUGRLRlc3YzZYS0dmSFY2MkJMeXJDd2RwVHBXOHlFYjlMeHRsVWUx?=
 =?utf-8?B?d1VWbG5sRElWV2RqWlVYWXM4RHR2cGtpRGsyYkdPc3dvVUpjM2UvV0FUWEQv?=
 =?utf-8?B?TVZjRU85dTI0bHRsMzFSWTQ4TXdkT21oVG0ybEdIR054cCtSYjdteGdRWjFx?=
 =?utf-8?B?Ui9mR2F2QVNibitNV21qR2I4ZzBrSGw1ZjJ3YlVMVytsQ3BBNm5nZ0lUWHV2?=
 =?utf-8?B?YXhrbDJCNHMrbXIvbzRYbU5DcjlsVVNSZVVNSlZ2TUpnaGd0Z0dvSEZvYldT?=
 =?utf-8?B?ekVVODdzVlZqaVdtRzl5Q1ZIcnN3ODhUZG8ydEpSWW9RTzk5a2JmVGxGZDNw?=
 =?utf-8?B?UlA4TG1xK3dGQ2NPL29ELzMveDNpRW9nMjRpTzJOZ09DNjRndEU5bVJNaHRL?=
 =?utf-8?B?RUhCeGRXMDRadFlzS2ZKeWgzcS90ZHh0Z0ZOVlN2RUlrSytaZE5KU3FTWlVG?=
 =?utf-8?B?K3JQTDVlMXMyVHlqVlFpajdCTDZTYVBjNEN1eVZGQ2czUmJHTjhWY2YrT0Vl?=
 =?utf-8?Q?NXW5Z6DOjvXiijz/U92khPYQl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b05d35-46d9-48bf-d1e7-08dd5d2c7a12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 03:59:36.6531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF4+6NFfudDETcnUsksaLC4yExdryPR6515UIp/RyT4Rv33GBmGbjyQaI2ge8heZj91ERaiIjfGzG7l7cyVq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398
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

Hi Kamil and Peter,

On 2025-03-06 07:32, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-02-28 at 08:04:30 +0100, Peter Senna Tschudin wrote:
>>
>> On 27.02.2025 11:18, Peter Senna Tschudin wrote:
>>> Adds a simple library for interacting with kmemleak and add
>>> unit testing for the library. There are two modes intended to
>>> integrate with igt_runner:
>>> - once: collect kmemleaks after all test completed
>>> - each: collect kmemleaks after eachb test completes
>>>
>>> To use the library include "kmemleak.h", call runner_kmemleak_init()
>>> to check if kmemleak is enabled and finally call runner_kmemleak()
>>> to collect kmemleaks. runner_kmemleak() expect the following
>>> arguments:
>>>   - const char *last_test: Name of the last lest or NULL
>>>   - int resdirfd: file descriptor of the results directory
>>>   - bool kmemleak_each: Are we scanning once or scanning after
>>>     each test?
>>>   - bool sync: sync after each write?
>>>
>>> Cc: christian.koenig@amd.com
>>> Cc: alexander.deucher@amd.com
>>> Cc: jesse.zhang@amd.com
>>> Cc: harry.wentland@amd.com
>>> Cc: zbigniew.kempczynski@intel.com
>>> Cc: kamil.konieczny@linux.intel.com
>>> Cc: ryszard.knop@intel.com
>>> Cc: lucas.demarchi@intel.com
>>> Cc: katarzyna.piecielska@intel.com
>> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

The series of three patches looks good to me. We would like to see this merged as soon as possible to validate it in our CI.

We will provide feedback as needed.

As Kamil mentioned, I’ve added the link:
https://lore.kernel.org/all/20250306123229.bmy6fhk7nojrs2wg@kamilkon-desk.igk.intel.com/

Thanks,
Vitaly

> A note to Peter for future reference: please send such r-b
> additions with at least a word or two why and from where
> it comes, give a link to lore.kernel.org or to patchwork
> so you will make my work easy and do not require from me
> to search your other mailing threads.
>
> You could also remind about it a maintainer to add this at merge
> or send new release with this added, then an explanation will
> naturally appear in release notes in cover letter.
>
> Regards,
> Kamil
>
>>> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>> ---
>>>  runner/kmemleak.c             | 273 ++++++++++++++++++++++++++++++++++
>>>  runner/kmemleak.h             |  16 ++
>>>  runner/meson.build            |  11 +-
>>>  runner/runner_kmemleak_test.c | 267 +++++++++++++++++++++++++++++++++
> [...]
>
