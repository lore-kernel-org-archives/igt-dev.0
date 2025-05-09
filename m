Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF4C3ABBE
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 02:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820510E24A;
	Fri,  9 May 2025 02:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L0zv/AZR";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A8810E24A
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 02:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKAQUpVVETpeypFu1wm+iOHvRUlSyyaRXviI16xemqlEo5wx4h71Dg569l9CNjwSgDVXASyw6tZCTXLT6v6UAKjaUma23Q7TQidNbMYxFvruC1KxXKyoT6fWrVvG2wyHrbiCO0aA+hKHFMSm/WOHsE/nEdb5QkfJksDct5W13NosTBIbotYBqJZtWCIgCZLcRAYY14xbUTJmcfznKfkwDAbExqv0Z4r/vCRfKwe7KZuM5VRJ2+b7j69eUT7HOZBERj3tdyeG5+u4ZK86707z91/ENLcn84NnMVT2TtCckH4DibYaTNUQ2JPS52YkbfSi1WSHjkHcXEiBUdlFT04qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr1VEYRzVwdgotoDXukCM/NC1M67VcdP6Co96atp3qw=;
 b=F6MTL9z4ifztigvp2YII+QfT8foTXH1HmVRhlowGKX4fAh16MvNGu1rye/aHsqSNm06y1Mtj9P8zxTRqvQuYTsfDPa04G1OvTUuEpmBGqJPT6CuHnPR9UF9qNrVB7sPoGtoBTfDNc43z5I9KGWRQgR+Lvekzu/qmP5XMvw1/GsQjAkLjf9TWRETG/YzhBiaEISw6KmNjrlUJ0Z+VERWQANOTnKhgmDDIwSiLi4IvSmcYQMGpeWrZh/bG7dfTF6Ntkf2JrQasH7IiSOuUxinMY6+s7/lj1m/kxr0nSs6tkwTKHxEsTmMzt6uUc6ij3imJA0b+hS11zxq6ESl+Kw3hoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr1VEYRzVwdgotoDXukCM/NC1M67VcdP6Co96atp3qw=;
 b=L0zv/AZRuUowshNs3daJKgMmI/JRY3RZ8b/oXjYPfMtBz/Ca9CKf2jRBsqx+2ckyDvHE7YQ8UpkprdHQ7iIb/q7s5z2sPFuHeA2bL+oW3Rr9Rmvm7o0qsNUSF5C7U7GWClq5sn550hphL8hOCr6STyc9v3CdE2gn4pwlNcwedvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 02:33:40 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 02:33:40 +0000
Message-ID: <e4d66e68-e317-43e1-ae60-64fb5c1cfdb4@amd.com>
Date: Thu, 8 May 2025 22:33:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/amdgpu: add timeout support for user queue
 submissions
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: f65d8730-406b-4023-b6a0-08dd8ea1e89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGFvNU5nL2QwQi9BTjhPUEd3QUxRVHBLT2xYVCtHMXY1RXA4NG56SDNzMXRI?=
 =?utf-8?B?VzdtakhqNkYya3RENS95R2FiVXdwNm43bnBtTy9GRURrTlJlckJ2VmFOTTVI?=
 =?utf-8?B?NWZGNDFKTlFVUGsranhXSXY3SXQybzB5SG1OZ3pWUTVNYytqMVVnU0VNTzJk?=
 =?utf-8?B?VFV0aTBiWGxaTjFqV1FvNGFGdDdkWnViWE4xVXRPZWZWemtsUEYydU5GUktJ?=
 =?utf-8?B?Nk5SeERLU0hKQVIwQWNyajVjSkVhTSs4a0ZaNW9DOG0vTC9uUGVVN0NjVEd0?=
 =?utf-8?B?T2hsQitKS0U2UVI5cHpsQldOaHQ3LzNhS2JBNHhZT0VmUHcyd2dwUEQ3OEpv?=
 =?utf-8?B?WHVPVUc0RjhBZThPNGJOSjZDdjJ4TFdEd2prZms5UVpRTEdmVkRReG9IcVJm?=
 =?utf-8?B?OHNTVzR5SHd2Q1ZZZ0NOaC9vYzB2cU1sdW4vN3RHWjVYZ0VMVTZGTGlxbmNN?=
 =?utf-8?B?WDlXQW9aZjJwUmk0NkpJQU81T3A3SElGSXQ1NENuOXlEZERsZHFLMHI4STh0?=
 =?utf-8?B?TTBzWlE0ZHhhZE5OUmdVRkZ6T3BFQkNRRlhVK3BvTjFVUzhidks1VzI3ZFdB?=
 =?utf-8?B?eHFKNUkrVWdYTDFsQktPL2JuaGJVRytuVmU3ZnlZeDBVcFFmYlpiRTRnTDYw?=
 =?utf-8?B?REdicDA0eFlhdWhYTnVyU21mYUxSRnhzMkdpSUtaVkptSzh5L0EvQWhTQ1hZ?=
 =?utf-8?B?R3dLZmlHSE1tbFRTeldYQVpQS3FDTGNvSmhvKzU5aDByVkw2cTFFR2owcnBC?=
 =?utf-8?B?aUZWY25DYU1WYURXY0tna0JaTDNxQUlnQ2pkOWwrS25jK29jVXlJQXFkaW9W?=
 =?utf-8?B?anQwQVZoenBpcFZWUm8xTDhFTVhHc1hIbmU3VFgySDd6K0I1cE1DVGpuSklK?=
 =?utf-8?B?UlhEMXJ6NFh1NTRmM09NbGxkYllvaUROQmNGOSt5bTkwTUo0Znl3L1ljUklN?=
 =?utf-8?B?NG9zKzU2YzgyYWZjQ0c5b0RUYWhsa1NxaWgxV3d0MWZucGZlUmVqTzczK1Vi?=
 =?utf-8?B?cDZ3K21XRHc3N3JLaUI3ZERQcHF6elZEQjhHQ29aRWp1ZGVBTW56MUhmSEhn?=
 =?utf-8?B?ZFZZaVBUYnJmZkRZNGwva0V2YVh4aXdKb1FQWHFrSmxRT3M1Qm4ydVB1ejdn?=
 =?utf-8?B?dXBsU3ErOTVobVJqb29tWGtmN0JQT245ME5lellVdGZJTFV6RTRYalk4UTdN?=
 =?utf-8?B?Z3FXZ2g4RnFmRHdQLzVLcUNkUWhSdjBvRFBieVc1dmhLTGF2cmtwYjlJK29m?=
 =?utf-8?B?RW5UZXpPOU10cVd5WUZKQ1NBK0ExaUlRSGtFZGZyMkhhRTN5dWJiRzdQelR1?=
 =?utf-8?B?bWwya1dGanc1K25rL012RG1qS0I2Q0RPZk9DMjFjbjJVTTU0bnZYbGw2Y2tl?=
 =?utf-8?B?aXhqb0t2eWtGZDQwQmVRMWlaTXJwZXowWmlqTUxVR20vTUxScWUwTU81VXl1?=
 =?utf-8?B?UlRRQUlaL3B2TTY2ait5TUxqTUUvaGFDUzBxNVNqYTE0MDRDbHBhOENBcnJj?=
 =?utf-8?B?WFZRc290SEpaV2t6QndFMEliS1hPYTVjMXBGcjFnQVZhQU1HVVU4ak5SMmFr?=
 =?utf-8?B?S2MyUXFRenR2c21sYVR5ZUdQTFNHekl3MTdPMWREZk9uY2pLU29TQVdQUXBF?=
 =?utf-8?B?aHhMN2VHYWtaVGVUVkFYOE52d3o4ajBSY0dzS21yVVp1Q2xSUlBsQnFXNTJQ?=
 =?utf-8?B?UDVnN0FUTk1FUGlJcUlwMFVYUnNXMXc5aThhVjUwdFU1TzNhajJSK3EvMkNU?=
 =?utf-8?B?Qm9VVWZxUUd2WEF5QnhTODEvWm5yWnRhc3hwbkwzSmpvZVhRK2VFMW4rYlFi?=
 =?utf-8?B?VTFraVhkeVBPMGF6ZVpvcjhadlY5NDhHZEp0UDViVVF4TmxIUm9HbUlDZmpC?=
 =?utf-8?B?WjJWWVhYbEIvQTFkYVlPZDdHQ3BHM1NweDE3Nm91clVoTWtETWpLTU90US9G?=
 =?utf-8?Q?Y8+RjSH8wBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHB5ZEVwZm15cGxzWjBHUjltQ3VBcURJU281bklMSzAxSG1xYlArL0JnWGJq?=
 =?utf-8?B?TytNSHdzbm5qak40N1phOUc3RUJBVnh2b0hvUXN1bndYTWh0anVwNHF0RDFY?=
 =?utf-8?B?cTNvN3VBZ2RTWmk5akhHekJhZ3QzRFBMQ0hMQ1YyQWc5U3BGNFFOYWEraSth?=
 =?utf-8?B?RXhjanZINXZ0Z0loaktqbnJsbTFSWUs5KzV6b1Y2czN2L1J4OUtIR1Zqa1ZJ?=
 =?utf-8?B?cC85UHFCaXJBQ0RuZmtWMjA4dUZNa3gvUDRNakJRU1RzUEN6bE85YmtuL295?=
 =?utf-8?B?S01ZYktFU2NGd3EyQ0RZUjUwRzRXcVhEUHM0WjRGVXRESzJDandtTzc4RXJP?=
 =?utf-8?B?cUo0VWR4SisyczhNRmw0STg2KzFKWHJEcW1nc3JJKzJrWngxWUF3aWpqcW1T?=
 =?utf-8?B?aEo5Si9FNXV4a1VPdENzYnRlbVdGNWdzQTAySmMxd3YzMnoyYVRFeUNrbWNN?=
 =?utf-8?B?WHJ4aHpnZFVPUVNoRHFsbXZOdUNjUElBM2k1NEhJMUZRdVgybjVCZTRORmN1?=
 =?utf-8?B?clljM28ybnJicHV2ZmVXOWV1eHdHUFp4Tzl1ckVNNDUxa2VOVkIyYzhuY09P?=
 =?utf-8?B?LzVpejlrdkdvS0hldncrNUZKeFVxUVoxVkszczA2Wit6L1VVTStkK0w4a0Js?=
 =?utf-8?B?eHBxd2gwYkZBL1I2dXNwU3E2cmlNR3drdm9pdTFDRHZxeG1qQk1IemFBYWhF?=
 =?utf-8?B?WjFueE13WWMxNEJSVUF1RzU4YThzbU0vOWtYLzlHT0FMTTlHYWRYN1J3dEpX?=
 =?utf-8?B?TXZMNit6VkNqa1gvLzZhY2c1U2I3ZXFaUWhzdHppZTZiRXI5Y2hnelBKc3Ro?=
 =?utf-8?B?YTRkZW9WVDJvVncvRVMxclZLakRGTVFKL2Z2M3poNlVURS8wa0RVUHZqdmJ0?=
 =?utf-8?B?TTdkM0tIVGc0N0pjd2FvQ05rR09Nb3VTZ3BacWw2M3BXeW5udElkTUplL2R6?=
 =?utf-8?B?cmNOdGd3UUxHdjB0V2NIQXVBSFVKQ1dvZGwwRjFDVDFvZ0E0eXlzMW8rMmZF?=
 =?utf-8?B?WjV3MGZaRlJHZUlnbTRiUnNHYmxtZXd0SkEvSEdMWDZNV0hIUERuQ2NJSWtj?=
 =?utf-8?B?N3JaNTlEamxFQTBnbmowNGhmMXdtTlFMbkRRaXltbzR4a0dabS9LOVhrcjlp?=
 =?utf-8?B?NzQ5cjhQcEVTVklIcGFocS9jTzhQSjNvZGV1Y240eEdrb0lQdEpsREdMdGtB?=
 =?utf-8?B?TTJtN0F6dHh0WE45ZXZMMWt2YTNQY2lLTlhOR1ZqNWNMMlNYUExwQlYzQ0lu?=
 =?utf-8?B?cTNVZG54SWlZL1ptWldvdlE0a3BGRndLakM3UEJkcjJUWHBzUVA3UHJneVNX?=
 =?utf-8?B?Z2N6VE1WVXl3UDJVVXVLOGtJQ3h6VjBkc1hqS0xCa0hPbzFUakxxdSt1d2o1?=
 =?utf-8?B?NGswQ3JZSmZtUm5uL0lzblQ5aDJ3SEtoM1ozelZpaWNIY3ZkTjY2aTU1OFEv?=
 =?utf-8?B?N0dudDRuRWN3emxUMnhpRGk1Q1JSNjhsN281aytRQjlpQXpObWhTL3BCVi9z?=
 =?utf-8?B?NGJJcTNYYmhyL0JhNXdITzkzMVZTNlBTMFpIWXdFQUUwU0tDUmFzcm5hU0tp?=
 =?utf-8?B?eFdXTmJUTkxIQTJnTmVOOEJOaHZrL09vMVhRL09nRTB5UjdDL0NOVUFlTEJl?=
 =?utf-8?B?dzV2RTd3NHFRajkwbDQyOUhNSmEyc3lLdmxxUE5FSlR6N0N4c21Wc0g0anl4?=
 =?utf-8?B?MUluTnlwS0ZaRWNnc0ZCTUdaQVE2T3piTXJMeUc1ZG53SWQxbVpCVEhLeHRN?=
 =?utf-8?B?MlBvcG85eVlPM1M4c1R0c0JEckhFZjJuNXlQN1UzNUNpM25pMlhpRDhuRW9F?=
 =?utf-8?B?WDgvTnE1aE5XVkRMTktWWnFZZndVYjdBcExQc0pVNnY1MzVpekR5MjBGQ1Uv?=
 =?utf-8?B?M21VSUsxdXZZQ1F4OStPUDlJWUNkOWh1VWQyNkcwZzYrSGt3eGc0aEF4OXQw?=
 =?utf-8?B?d0JMN2txZGtvdXkrZG9XQTRFQXdGMkRoV1J0VHNyMjlCTFpydmJ4SEhaRiti?=
 =?utf-8?B?aW5LTG0rbnY3Q1NQTlJwcVF4d2R2VXNGY2JYdCtrVkpnNVo1NUFLREgxN210?=
 =?utf-8?B?L1c5dGg5WE12MG9UdnovSHZ1anUzVjMzWTB4RkROcXA3dTNLYnZmbDh4VVRJ?=
 =?utf-8?Q?KT4l1rLQoRbarUmwtk8eI2mJY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65d8730-406b-4023-b6a0-08dd8ea1e89d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:33:40.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z9Nf/4Qdy/cgI2xsxWr2P9r5n5A0nHp12pK/rOpOHsoeJNI2K8AKyghcAElI5PKgpohm8BoHT9sWOw3PWaMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
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

The change looks good to me

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-05-08 02:07, Jesse.Zhang wrote:
> This patch adds timeout control for user queue operations in IGT's AMDGPU
> tests by:
>
> 1. Adding a time_out field to struct amdgpu_ring_context to store per-ring
>    timeout values
> 2. Modifying amdgpu_user_queue_submit() to use the specified timeout or
>    default to INT64_MAX (infinite wait) if not set
> 3. Passing the timeout value to amdgpu_cs_syncobj_wait()
>
> The changes allow tests to specify timeout values for user queue operations
> rather than always using an infinite wait. This provides better control
> over test execution and helps prevent hangs during test development and
> debugging.
>
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 3 +++
>  lib/amdgpu/amd_ip_blocks.h          | 1 +
>  lib/amdgpu/amd_userq.c              | 4 ++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 80d03a498..fcc356f8f 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -153,6 +153,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
>  	ring_context->user_queue = user_queue;
> +	ring_context->time_out = 0;
>  	igt_assert(ring_context->pm4);
>  
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
> @@ -280,6 +281,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
>  	ring_context->user_queue = user_queue;
> +	ring_context->time_out = 0;
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> @@ -374,6 +376,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 2;
>  	ring_context->user_queue = user_queue;
> +	ring_context->time_out = 0;
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 3c2ecd1ba..a6c35c171 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -175,6 +175,7 @@ struct amdgpu_ring_context {
>  	uint32_t timeline_syncobj_handle;
>  	uint64_t point;
>  	bool user_queue;
> +	uint64_t time_out;
>  
>  	struct drm_amdgpu_info_uq_fw_areas info;
>  };
> diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
> index 50d058609..f8e1a4b45 100644
> --- a/lib/amdgpu/amd_userq.c
> +++ b/lib/amdgpu/amd_userq.c
> @@ -133,7 +133,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
>  	uint32_t control = ring_context->pm4_dw;
>  	uint32_t syncarray[1];
>  	struct drm_amdgpu_userq_signal signal_data;
> -
> +	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
>  
>  	amdgpu_pkt_begin();
>  	/* Prepare the Indirect IB to submit the IB to user queue */
> @@ -179,7 +179,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
>  	r = amdgpu_userq_signal(device, &signal_data);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
> +	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
>  				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
>  	igt_assert_eq(r, 0);
>  }
