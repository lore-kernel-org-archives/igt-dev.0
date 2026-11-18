Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B1606A333
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yUqhrqd+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD3110E41A;
	Wed, 18 Nov 2026 08:48:19 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013034.outbound.protection.outlook.com
 [40.107.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E7910E41A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 08:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY6Kwu9BX2IrrzPwMw0tVz5LnddHUHj9buuyDtydQ5JwgBQA2i7uvJh0bHY2XNCYp1u1U69SBopnPpQeXMn2JuwfD2qyHWJvHRzYBDg+XIeqywqUB2WTQ+N2ZBrxBXxmeb/KnTXUJ6/qXSlvZQxg+AeDAc3eq1IGPJIrXWPbPodUE6/vTVXNGqiaZikz/010FDR9a8Z10MCbaQybcecy5yzvDoThGhy5CTNOJzc/xiM4Hzw7/hCSGyp5zkNuq5QRdDPiOW7OVXn++DX0R7N7DmLtFCvMAHc5OvsP8QxnfTEhLKawcXQ+MsPCXZn8AUD8FI8kqkJclwHqEs5co0IkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeHKosuvICIYDRvVlMrYQfU478kvF+mLoinUk+t3o+o=;
 b=r290jGuAcTdycKjAjcf5LVD+d1XIWq19KczaNtkPwDW2w9ms6/Xggl7O2ntuzirPihmbsW9aCLuFb/3YW4hujjNEoFXzReMoLDFKD+UakSLK4VPfDT8lMf/ySVlxAyQCVwWGddIhADOkHXsqFithXr06DJ4ADGG0doRTSnrnHN6sf395n+h52zCcnLkVFcDxxlTaW6FoYtuj2wEsJBmO7s37KkJaFI8vH0Ap6dH9msGjeR3/PmZnz+h3zFssdKcgcl+Nx5UbEIBnNOCTawlP0yc79rzfV+8Tc3fXVG+uL+rJMBTf2G6WmClfNya8l2Cfwip82xWwConY+I/oYf90Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeHKosuvICIYDRvVlMrYQfU478kvF+mLoinUk+t3o+o=;
 b=yUqhrqd+2dvJOPKJKFp/Pdl1ryc6jy+j0MgGUc6AQcoHsqOag8F54J+4xQnMsSRC5vnH96MvFBfZYxDWAM00G7ZdUg9lBPhQ4SIbIBDGZ8COfzwqmCT6puZMs7fmds5jFF9ak5QBheMnI80wdKIQ2xxzGgv1cbFapk3tVJjb48k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by PH6PR12MB805463.namprd12.prod.outlook.com (2603:10b6:510:3fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:47:14 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:47:14 +0000
Message-ID: <c4cadaaf-c0ca-4c62-a292-4e040423420c@amd.com>
Date: Wed, 18 Nov 2026 14:17:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V2 1/8] tests/amdgpu: Add SLTH validation tests for
 trap handling and trap return.
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Lancelot Six
 <lancelot.six@amd.com>, James Zhu <james.zhu@amd.com>,
 Samuel Pitoiset <hakzsam@gmail.com>, Natalie Vock <natalie.vock@gmx.de>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 jay.cornwall@amd.com
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|PH6PR12MB805463:EE_
X-MS-Office365-Filtering-Correlation-Id: cc93638c-9dab-4634-6b04-08df45508afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|261009221227099003|261009223027099003|3023799007|56012099006|11063799006|260925021311599003|260925021911599003|260925022911599003|10067099003|261102123227099003|261021123027099003|261021133027099003|261026130827099003|261026140227099003|261026121527099003|261022075727099003|261026135527099003|261022115727099003|261021135927099003|261028144727099003|261021130227099003|261022113327099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: Latcm+el7Sj3eBrnTpxs+t5UH/90ZEHoj3vjQgtawgOLQ/4DV0DFPqOJxowWuiXh6lgs3SUNMj1S58qGM8/fKnjSUXdbL1TZUz/fhQKtMdU2ISvnQaC5vXcr2hxWW0A+8m9ZRhfHB7l1PypqYpyVyZHYA14ykyJvhAyMY7rsrDfZStek0KkcE6xCrXGssbI/I0VvztvCVMVb7sNndCbVv99gowUirTDT5niRHFGTuCpehlQA+jHmNtEXnr4bhIn6agxeZXcaqa4iQk9JVE1f6i4MkLUyjc7lBfWq9ec42lWfTUS1QYZmsoBkMLAcaDTQOxTg9JiPL6BcaPARpTlsc/LKl6btue4OGJM66xo4TZqGIuL+tB/U03bpdmRieAOTI7+AkvDqhILleHzP5Ictumq7qQmuVH7R8CbeyPv+ZzQwNYTgq2z3Xbr9AMkWWj9g/tOVSbUJ6UAuZCb0c3FWGbhNHs/18n9URAJxFIPbkQ+sZEsik36KUxAgHmzJ+MIv5wWViRa5leEJmp887ukUGb3D17N8keJ6NLnRil+T54e3bUkqBNCt4oLvxulekWGwrwQUkk+/xfSenC+zjPPphyNJDCAVAZQjcRuBXvkNV0ZAH7ciGeWWWdQ0CncX0cykyZzxfKpVZMnjpSYmqVKV2Yjtmu/wNHiwYFxVApqLxBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(261009221227099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(261102123227099003)(261021123027099003)(261021133027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261022075727099003)(261026135527099003)(261022115727099003)(261021135927099003)(261028144727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJwSHRDUExpZUxUelZVVG82cm9aODJvVTgwOXNmZGR2V1VDdFl2LzNPL1Ur?=
 =?utf-8?B?aXFLVXA0bFJ6eERmcUIwQVV2Wmd1N1d4Yzd1Q2NOaTRYUEJKSEs1NlR2aFJu?=
 =?utf-8?B?S1o4azhjeGUrL3BJbmUzSUNZOEtjdjZKVUFiaUtJZGxJQUptTnFjNGV6eEVV?=
 =?utf-8?B?bW90U2ovYytFM2FpVXJkVCt5NmdIUnJqdytzbEUzUDZTTzU3dWRDai9RRkFU?=
 =?utf-8?B?MEF6Sm9HK0lyTmFSRnpxUjVrTzkyb3RlTlZEN1JEWWN4bmk5L0lJTU1SQkp5?=
 =?utf-8?B?Q3dhQ1cxQUFiWUcxeis4eGducWFYdGJsb1V2WENGT05icERVTnUydm9mS0Zj?=
 =?utf-8?B?WW0vNW9ObDJ6K3J6cXY0Z3dJM01BYTY2WVF6VldBZ1VGRmhGc0VkZWlERUZC?=
 =?utf-8?B?VTI4alJoWWtpcXV5Smg3TFYrYzNlbWZmUUhra1l6a1FGdWI0OWZEVTQ5WGYx?=
 =?utf-8?B?NHdUNEtjN0ZYWU1FeEtESGJmYWIrUVkxSjJWZ0ZiOXdPT2Z5WkxWQStPZ1Ey?=
 =?utf-8?B?VDZYQVRjRU1RclZEM2JxRURSZThNN0oycFE1MnFQZDRnT2xjVGk3L3JRSW5J?=
 =?utf-8?B?dWFLS2JiTE04di9GN1pIUVc2a3RJdHdNT09XMnl2bmNjT3o4WG1rQy9UM3I1?=
 =?utf-8?B?bWFta2dxc2ttUFJiay8vOXlBc2VXWU4vU0xRZmZ0cjdSMzkwM0R4T2VJbE9n?=
 =?utf-8?B?MituU3V0VEVMaUhnMG1lSGxjS0RJNW9yeElNbXBid0hITEpIandvMXJNd0RR?=
 =?utf-8?B?VmlXQzErbzBjL1hDY0VoNFQ5SXNNS2lTcE1jc3o0Snh0enZ3RnZ2aHJ5Zjhk?=
 =?utf-8?B?Zkh0enVjaTV0OHhsNXcvTUpNRDNaZWh6ZHpqb0Jmci85SUk5QmV2ckkxaVd2?=
 =?utf-8?B?RkF0RFpHWFRtVkNQMU5mbEd5MStIVmFCemRkUFVDNWY2V3BBNHEvdXhYMEZP?=
 =?utf-8?B?ZnlVaTFSUWRaRGJHV2N4TmpsZ3FTVmJCMzB2ZFM1T3NZY2o1aVBGbGM0ckJq?=
 =?utf-8?B?eXlSWXVLSHdGMDI2WHl0ZE1LK20vaVRCa05Va0J6eWtqL2U0YWZ6RlBtRlFP?=
 =?utf-8?B?ejUyYkJYcGVQcmlMZmRTL1QyTjdzS3pvWEo0ZUthY0haSDg1RE8rVGJLRU1B?=
 =?utf-8?B?Ykl2UlJWSnNtWmJKdjh1WFRJRkdpVzcxMEh1dS92M3E5bCtKa0ZZcUo4bDBN?=
 =?utf-8?B?NGlUZW11amNrN1BROWJnUmVTUWZOV283UXB2OGREakw1ek1JSXNOOSt5TUVm?=
 =?utf-8?B?a29ndnJaV0J5WjVRYmRaeHd3L0VBZG1qbkxJUURIdzZxbGlqY0hvcW1TRGt6?=
 =?utf-8?B?dWtiQXJFalliaGl5a2hWN2Z4OTkxTGM0M1RYYTFDRGptOXh0YkNXTk9oeFFa?=
 =?utf-8?B?RmdzcHU2V254Ukk3TGhxQ25senhERHBkbkk0WG9kUVFpNEtMeE85YVN1ZTBp?=
 =?utf-8?B?ZVF1Y1F0OWErY0R6YWdLK1JiTkZVRXFhcmRBY3hmL3JiQXlYcjJJTm5mU1JD?=
 =?utf-8?B?SysyczdtZ0VWRERlVktReVJGTzVXSHhiRVF6cFBodzVlTHJUT29YZVR0QXhQ?=
 =?utf-8?B?aXNpUFBmbGZybFZhUTZxRGtRVkxTSXJYalVScVZCSjdxVkhrYTU3VGc3djlK?=
 =?utf-8?B?MmZWb3NNaTA0UllKUy9TQTE2M2NqbE5EdzVtYnRxSUFtWEVwYUZvTTZtOFlC?=
 =?utf-8?B?c0FzcDlEczZGejFyaWpQV3BHUlRKYW9MTW1SSzV6M24xVGp5T29XelJQTUVJ?=
 =?utf-8?B?Zk1HNFJ6UkthMmNJT2FPUEdHT3lmTjB6WFVXcVozUFFiNWhWSTF6M1N5V1hF?=
 =?utf-8?B?bEZRYUwyNEpVVS8yN2xuRkVUY2laSjBmWUdGc2dZc3VwQjJKbjlYU0Q3L1ow?=
 =?utf-8?B?NC96dXFlWlFKZUZPalh1ODRHdC90RFNwVmRTTHJyaTQ5VFVVMy9RT3RaVlRK?=
 =?utf-8?B?bFp3QUtlRkJKSmJEUU9QeWQrbXZ5RnhnSHpXeVFrd1N1cWhnVElPb0h1N09I?=
 =?utf-8?B?Mm9qSFVDQWZBRVduWDJGbDl2Q3o1R1g3cjNTNHhkRHZ0WFQyNklzT2I4NDNI?=
 =?utf-8?B?WnRkTElvTXcxclFSLzZmSzRObStmcTdmeFJjaGxqNWxuSUswT1g0U3hOcE5L?=
 =?utf-8?B?b21DUkh5VC9iNVU5ZmYzd3ZHTG9vc0VyYkE0ZUh1eVZyUlo3VmY2SmNUd2xY?=
 =?utf-8?B?R3NqUWdOZmRSSE1BbEozWnFuZmxQSHpzVGZJT2ptTTR4SHllVjJJdi9TdFhn?=
 =?utf-8?B?Q2MyY08wWmpXQ0xiWUpnd1I2SjFFTlpUNHNGTnlUVDd5a1RSTkdWd0hhZUFL?=
 =?utf-8?Q?RfrtckrwmI6C09v3OB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc93638c-9dab-4634-6b04-08df45508afd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:47:14.5847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPtu6uvmTLMys0s5PYDIw+S6RQ1SuSYOTnTldHF5FoHDiKh8LwxxfJgnBMIgBgdS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB805463
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 18-Nov-26 11:40 AM, Jesse Zhang wrote:
> From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> 
> SLTH allows a shader to trigger a trap, execute a trap
> handler, return from the trap, and continue shader
> execution.
> 

cc: Jay Cornwall

There is no expansion given for SLTH acronym. It may be expanded as 
second level trap handler somewhere in the commit message/comments.


Does it make sense to expand this test such that second level handler 
copies a known value from TMA region to vgpr instead of a hardcoded 
value? This is to check second level TMA accesses from second level handler.


Thanks,
Lijo

> This patch adds validation tests to verify that each step
> of this flow works correctly.
> 
> slth-gfx-kq-vgpr-proof
> 
>    Runs a graphics workload using a kernel queue.
>    The shader triggers an SLTH trap.
>    The trap handler changes a VGPR value from 0 to 42.
>    After returning from the trap, the shader stores the
>    VGPR value to memory.
>    The test verifies that the final value is 42.
>    This confirms that the trap handler executed and that
>    the updated VGPR value remained visible after trap
>    return.
> 
> slth-gfx-umq-vgpr-proof
> 
>    Runs the same VGPR proof test using a graphics user
>    queue.
>    The shader triggers a trap and the trap handler updates
>    a VGPR value.
>    After trap return, the shader stores the value to
>    memory.
>    The test verifies that the final value is 42.
>    This confirms correct SLTH behaviour through the UMQ
>    execution path.
> 
> slth-comp-kq-vgpr-proof
> 
>    Runs the VGPR proof test on a compute kernel queue.
>    The shader triggers a trap and the trap handler updates
>    a VGPR value.
>    The shader then resumes execution and stores the value
>    to memory.
>    The test verifies that the stored value is 42.
>    This confirms successful trap entry, trap handler
>    execution and trap return for compute workloads.
> 
> slth-comp-kq-returnproof
> 
>    Runs a compute workload that initializes a register to
>    1 and then triggers a trap.
>    After returning from the trap, the next instruction
>    changes the register value to 2.
>    The shader stores the final value to memory.
>    The test verifies that the stored value is 2.
>    This confirms that execution resumed at the instruction
>    immediately following s_trap after s_rfe_b64.
> 
> Together, these tests verify trap entry, trap handler
> execution, trap return, VGPR state preservation across
> trap return, and correct resumption of shader execution.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Lancelot Six <lancelot.six@amd.com>
> Cc: James Zhu <james.zhu@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Samuel Pitoiset <hakzsam@gmail.com>
> Cc: Natalie Vock <natalie.vock@gmx.de>
> Cc: Timur Kristóf <timur.kristof@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>   include/drm-uapi/amdgpu_drm.h         |   18 +-
>   lib/amdgpu/shaders/amd_shader_store.h |  190 +++
>   tests/amdgpu/amd_basic.c              | 1860 +++++++++++++++++++++++--
>   3 files changed, 1928 insertions(+), 140 deletions(-)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index 29009f6aa..832903e2e 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -603,10 +603,24 @@ struct drm_amdgpu_userq_wait {
>   #define AMDGPU_VM_OP_RESERVE_VMID	1
>   #define AMDGPU_VM_OP_UNRESERVE_VMID	2
>   
> +#define AMDGPU_VM_OP_SET_L2_TRAP     3
> +#define AMDGPU_VM_OP_CLEAR_L2_TRAP   4
> +
>   struct drm_amdgpu_vm_in {
>   	/** AMDGPU_VM_OP_* */
> -	__u32	op;
> -	__u32	flags;
> +	__u32 op;
> +	__u32 flags;
> +
> +	union {
> +		struct {
> +			__u64 tba_va;
> +			__u64 tma_va;
> +			__u32 tba_sz;
> +			__u32 tma_sz;
> +		} l2trap;
> +
> +		__u64 reserved[4];
> +	};
>   };
>   
>   struct drm_amdgpu_vm_out {
> diff --git a/lib/amdgpu/shaders/amd_shader_store.h b/lib/amdgpu/shaders/amd_shader_store.h
> index 6d04e79d0..a913237ed 100644
> --- a/lib/amdgpu/shaders/amd_shader_store.h
> +++ b/lib/amdgpu/shaders/amd_shader_store.h
> @@ -1327,4 +1327,194 @@ static const char * const amdgpu_test_shaders[] = {
>           NULL
>   };
>   
> +/******************************************************************************
> + * SLTH Validation Shaders
> + *
> + * These shaders are used by SLTH IGT validation tests to verify:
> + *
> + *   - SET_L2_TRAP / CLEAR_L2_TRAP UAPI
> + *   - Trap entry
> + *   - Trap handler execution
> + *   - s_rfe_b64 trap return
> + *   - VGPR state modification
> + *   - Post-trap execution
> + *   - KQ execution path
> + *   - UMQ execution path
> + *
> + * The shaders below are specific to SLTH validation and are
> + * not part of the generic AMD shader test collection above.
> + *
> + *****************************************************************************/
> +
> +/* Shader: SlthVgprProofIsa
> + * Purpose:
> + *   Trigger an SLTH trap and verify that the trap handler
> + *   modifies VGPR state visible after s_rfe_b64 returns.
> + *
> + * Expected:
> + *   TrapHandlerIsaProof updates v2 to 42.
> + *   Shader stores v2 after trap return.
> + *
> + * Proof:
> + *   output == 42
> + */
> +static const char SlthVgprProofIsa[] =
> +    SHADER_START
> +    R"(
> +	v_mov_b32 v0, s0
> +	v_mov_b32 v1, s1
> +
> +	v_mov_b32 v2, 0
> +
> +	s_trap 1
> +
> +	flat_store_dword v[0:1], v2
> +
> +	s_endpgm
> +)";
> +
> +/* Shader: SlthReturnProofIsa
> + * Purpose:
> + *   Verify that execution resumes at the instruction
> + *   immediately following s_trap after trap return.
> + *
> + * Flow:
> + *   v2 = 1
> + *   s_trap 1
> + *   v2 = 2
> + *   store(v2)
> + *
> + * Expected:
> + *   output == 2
> + *
> + * Proof:
> + *   The instruction after s_trap executed successfully.
> + *
> + * Validates:
> + *   - Trap entry
> + *   - Trap handler execution
> + *   - Trap return
> + *   - Program counter restoration
> + *   - Post-return instruction execution
> + */
> +static const char SlthReturnProofIsa[] =
> +    SHADER_START
> +    R"(
> +	v_mov_b32 v0, s0
> +	v_mov_b32 v1, s1
> +
> +	v_mov_b32 v2, 1
> +
> +	s_trap 1
> +
> +	v_mov_b32 v2, 2
> +
> +	flat_store_dword v[0:1], v2
> +
> +	s_endpgm
> +)";
> +
> +/* Shader: TrapHandlerIsaProof
> + * Purpose:
> + *   Validation-oriented SLTH trap handler used by
> + *   SLTH proof subtests.
> + *
> + * Difference from TrapHandlerIsa:
> + *   Updates VGPR v2 with a known value (42)
> + *   before returning via s_rfe_b64.
> + *
> + * Expected usage:
> + *   SlthVgprProofIsa
> + *   GFX UMQ SLTH validation
> + *   Compute SLTH proof tests
> + *
> + * Proof:
> + *   If userspace observes value 42 after shader
> + *   completion, trap entry, handler execution,
> + *   and trap return all succeeded.
> + */
> +static const char TrapHandlerIsaProof[] =
> +    SHADER_START
> +    R"(
> +	CHECK_VMFAULT:
> +	/*if trap jumped to by vmfault, restore skip m0 signalling*/
> +	.if (.amdgcn.gfx_generation_number < 12)
> +	    s_getreg_b32 ttmp14, hwreg(HW_REG_TRAPSTS)
> +	    s_and_b32 ttmp2, ttmp14, 0x800
> +	.else
> +	    s_getreg_b32 ttmp14, hwreg(HW_REG_EXCP_FLAG_PRIV)
> +	    s_and_b32 ttmp2, ttmp14, 0x10
> +	.endif
> +	s_cbranch_scc1 RESTORE_AND_EXIT
> +
> +	.if (.amdgcn.gfx_generation_number < 12)
> +	    s_and_b32 ttmp2, ttmp14, 0x7080
> +	.else
> +	    s_and_b32 ttmp2, ttmp14, 0xf
> +	.endif
> +
> +	s_cbranch_scc0 GET_DOORBELL
> +
> +	v_mov_b32 v5, v4
> +	v_mov_b32 v6, ttmp14
> +
> +	s_branch RESTORE_AND_EXIT
> +
> +	GET_DOORBELL:
> +
> +	.if .amdgcn.gfx_generation_number < 11
> +	    s_mov_b32 ttmp2, exec_lo
> +	    s_mov_b32 ttmp3, exec_hi
> +
> +	    s_mov_b32 exec_lo, 0x80000000
> +
> +	    s_sendmsg 10
> +
> +	    WAIT_SENDMSG:
> +	    s_nop 7
> +	    s_bitcmp0_b32 exec_lo, 0x1F
> +	    s_cbranch_scc0 WAIT_SENDMSG
> +
> +	    s_mov_b32 exec_hi, ttmp3
> +	    s_and_b32 exec_lo, exec_lo, 0xfff
> +	    s_mov_b32 ttmp3, exec_lo
> +	    s_mov_b32 exec_lo, ttmp2
> +	.else
> +	    s_sendmsg_rtn_b32 ttmp3, sendmsg(MSG_RTN_GET_DOORBELL)
> +	    s_waitcnt lgkmcnt(0)
> +	    s_and_b32 ttmp3, ttmp3, 0x3ff
> +	.endif
> +
> +	s_mov_b32 ttmp2, m0
> +	s_or_b32 ttmp3, ttmp3, 0x800
> +
> +	s_mov_b32 m0, ttmp3
> +	s_nop 0x0
> +	s_sendmsg sendmsg(MSG_INTERRUPT)
> +	s_waitcnt lgkmcnt(0)
> +
> +	s_mov_b32 m0, ttmp2
> +
> +	/* proof value */
> +	v_mov_b32 v2, 42
> +
> +	s_add_u32 ttmp0, ttmp0, 4
> +	s_addc_u32 ttmp1, ttmp1, 0
> +	s_and_b32 ttmp1, ttmp1, 0xffff
> +
> +	RESTORE_AND_EXIT:
> +
> +	s_lshr_b32 ttmp2, ttmp11, (26 - 15)
> +	s_and_b32 ttmp2, ttmp2, (0x8000 | 0x1F0000)
> +
> +	s_setreg_b32 hwreg(HW_REG_IB_STS), ttmp2
> +
> +	s_and_b64 exec, exec, exec
> +	s_and_b64 vcc, vcc, vcc
> +
> +	s_setreg_b32 hwreg(HW_REG_STATUS), ttmp12
> +
> +	s_rfe_b64 [ttmp0, ttmp1]
> +)";
> +
>   #endif
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 590163b7b..2fdef83fd 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -20,9 +20,28 @@
>   #include "lib/amdgpu/amdgpu_asic_addr.h"
>   #include "lib/amdgpu/amd_utils.h"
>   #include "lib/amdgpu/amd_platform.h"
> +#include "lib/amdgpu/shaders/amd_llvm_asm.h"
> +#include "lib/amdgpu/shaders/amd_shader_store.h"
>   
>   #define BUFFER_SIZE (8 * 1024)
>   
> +#define TBA_SIZE (2 * 4096)
> +#define TMA_SIZE (4096)
> +
> +struct slth_bufs {
> +	amdgpu_bo_handle tba_bo;
> +	amdgpu_bo_handle tma_bo;
> +
> +	amdgpu_va_handle tba_va_handle;
> +	amdgpu_va_handle tma_va_handle;
> +
> +	uint64_t tba_mc_addr;
> +	uint64_t tma_mc_addr;
> +
> +	void *tba_cpu;
> +	void *tma_cpu;
> +};
> +
>   /**
>    * MEM ALLOC TEST
>    * @param device
> @@ -846,172 +865,1737 @@ static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type
>   	free(ring_context);
>   }
>   
> -int igt_main()
> +static void slth_alloc_buffers(amdgpu_device_handle device,
> +			       struct slth_bufs *bufs)
>   {
> -	amdgpu_device_handle device;
> -	struct amdgpu_gpu_info gpu_info = {0};
> -	struct drm_amdgpu_info_hw_ip info = {0};
> -	int fd = -1;
>   	int r;
> -	bool arr_cap[AMD_IP_MAX] = {0};
> -	bool userq_arr_cap[AMD_IP_MAX] = {0};
> -	bool enable_test = false;
> -#ifdef AMDGPU_USERQ_ENABLED
>   
> -	enable_test = true;
> -#endif
> +	memset(bufs, 0, sizeof(*bufs));
> +
> +	r = amdgpu_bo_alloc_and_map(
> +			device,
> +			TBA_SIZE,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> +			&bufs->tba_bo,
> +			&bufs->tba_cpu,
> +			&bufs->tba_mc_addr,
> +			&bufs->tba_va_handle);
> +	igt_assert_eq(r, 0);
>   
> -	igt_fixture() {
> -		uint32_t major, minor;
> -		int err;
> +	r = amdgpu_bo_alloc_and_map(
> +			device,
> +			TMA_SIZE,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
> +			&bufs->tma_bo,
> +			&bufs->tma_cpu,
> +			&bufs->tma_mc_addr,
> +			&bufs->tma_va_handle);
> +	igt_assert_eq(r, 0);
> +}
>   
> -		log_total_time(true, igt_test_name());
> -		fd = drm_open_driver(DRIVER_AMDGPU);
> +static void slth_free_buffers(struct slth_bufs *bufs)
> +{
> +	if (bufs->tba_bo)
> +		amdgpu_bo_unmap_and_free(bufs->tba_bo,
> +					 bufs->tba_va_handle,
> +				bufs->tba_mc_addr,
> +				TBA_SIZE);
> +
> +	if (bufs->tma_bo)
> +		amdgpu_bo_unmap_and_free(bufs->tma_bo,
> +					 bufs->tma_va_handle,
> +				bufs->tma_mc_addr,
> +				TMA_SIZE);
> +}
>   
> -		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> -		igt_require(err == 0);
> +static int vm_set_l2_trap(int fd,
> +			  uint64_t tba_va,
> +		uint64_t tma_va)
> +{
> +	union drm_amdgpu_vm args = {0};
>   
> -		igt_info("Initialized amdgpu, driver version %d.%d\n",
> -			 major, minor);
> +	args.in.op = AMDGPU_VM_OP_SET_L2_TRAP;
>   
> -		r = amdgpu_query_gpu_info(device, &gpu_info);
> -		igt_assert_eq(r, 0);
> -		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> -		igt_assert_eq(r, 0);
> -		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
> -		igt_assert_eq(r, 0);
> -		asic_rings_readness(device, 1, arr_cap);
> -		asic_userq_readiness(device, userq_arr_cap);
> -		amd_platform_filter_init(&gpu_info);
> -	}
> -	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
> -	igt_subtest("memory-alloc")
> -		amdgpu_memory_alloc(device);
> +	args.in.l2trap.tba_va = tba_va;
> +	args.in.l2trap.tba_sz = TBA_SIZE;
>   
> -	igt_describe("Check-DMA-CS-works-by-setting-the-pattern-and-after-execution-compare-memory-with-the-golden-settings");
> -	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
> -		if (arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("userptr")
> -			amdgpu_userptr_test(device);
> -		}
> -	}
> +	args.in.l2trap.tma_va = tma_va;
> +	args.in.l2trap.tma_sz = TMA_SIZE;
>   
> -	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> -	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
> -		if (arr_cap[AMD_IP_GFX]) {
> -			igt_dynamic_f("cs-gfx")
> -			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, false);
> -		}
> -	}
> +	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> +}
>   
> -	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
> -	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
> -		if (arr_cap[AMD_IP_COMPUTE]) {
> -			igt_dynamic_f("cs-compute")
> -			amdgpu_command_submission_compute(device, false);
> -		}
> -	}
> +static int vm_clear_l2_trap(int fd)
> +{
> +	union drm_amdgpu_vm args = {0};
>   
> -	igt_describe("Check-GFX-CS-for-multi-fence");
> -	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
> -		if (arr_cap[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
> -			igt_dynamic_f("cs-multi-fence")
> -			amdgpu_command_submission_multi_fence(device);
> -		} else {
> -			igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
> -		}
> -	}
> +	args.in.op = AMDGPU_VM_OP_CLEAR_L2_TRAP;
>   
> -	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
> -	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
> -		if (arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("cs-sdma")
> -			amdgpu_command_submission_sdma(device, false);
> -		}
> -	}
> +	return drmIoctl(fd, DRM_IOCTL_AMDGPU_VM, &args);
> +}
>   
> -	igt_describe("Check-signal-semaphore-on-DMA-wait-on-GFX");
> -	igt_subtest_with_dynamic("semaphore-with-IP-GFX-and-IP-DMA") {
> -		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("semaphore")
> -			amdgpu_semaphore_test(device);
> -		}
> -	}
> +static void slth_prepare_tba_with_handler(
> +		amdgpu_device_handle device,
> +		struct slth_bufs *bufs,
> +		const char *handler)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +	int r;
>   
> -	igt_describe("Check-eviction-using-DMA-max-allocation-size");
> -	igt_subtest_with_dynamic("eviction-test-with-IP-DMA") {
> -		if (arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("eviction_test")
> -			amdgpu_bo_eviction_test(device);
> -		}
> -	}
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
>   
> -	igt_describe("Check-sync-dependency-using-GFX-ring");
> -	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
> -		if (arr_cap[AMD_IP_GFX]) {
> -			igt_dynamic_f("sync-dependency-test")
> -			amdgpu_sync_dependency_test(device, false);
> -		}
> -	}
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
>   
> -	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> -	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> -			igt_dynamic_f("cs-gfx-with-umq")
> -			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
> -		}
> -	}
> +	igt_info("family_id=%u mcpu=%s\n",
> +		 info.family_id,
> +			mcpu);
>   
> -	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
> -	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> -			igt_dynamic_f("cs-compute-with-umq")
> -			amdgpu_command_submission_compute(device, true);
> -		}
> -	}
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 handler,
> +			isa_bin,
> +			sizeof(isa_bin),
> +			&isa_sz);
>   
> -	igt_describe("Check-sync-dependency-using-GFX-ring");
> -	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> -			igt_dynamic_f("sync-dependency-test-with-umq")
> -			amdgpu_sync_dependency_test(device, true);
> -		}
> -	}
> +	if (r)
> +		igt_info("amdgpu_llvm_assemble failed r=%d\n", r);
>   
> -	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
> -	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("cs-sdma-with-umq")
> -			amdgpu_command_submission_sdma(device, true);
> -		}
> +	igt_assert_eq(r, 0);
> +	igt_assert(isa_sz > 0);
> +
> +	memset(bufs->tba_cpu, 0, TBA_SIZE);
> +	memcpy(bufs->tba_cpu,
> +	       isa_bin,
> +			isa_sz);
> +
> +	memset(bufs->tma_cpu, 0, TMA_SIZE);
> +
> +	igt_info("Trap handler size=%zu\n", isa_sz);
> +}
> +
> +static void slth_prepare_vgpr_proof_shader(amdgpu_device_handle device,
> +					   uint8_t *isa_bin,
> +		size_t *isa_sz)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	int r;
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
> +
> +	igt_info("===== SLTH VGPR PROOF SHADER BEGIN =====\n");
> +	igt_info("%s\n", SlthVgprProofIsa);
> +	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> +
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 SlthVgprProofIsa,
> +			isa_bin,
> +			8192,
> +			isa_sz);
> +
> +	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> +
> +	if (r) {
> +		igt_info("===== SHADER SOURCE BEGIN =====\n");
> +		igt_info("%s\n", SlthVgprProofIsa);
> +		igt_info("===== SHADER SOURCE END =====\n");
>   	}
>   
> -	igt_describe("Check-all-user-queues-for-write-operation");
> -	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> -				userq_arr_cap[AMD_IP_COMPUTE] &&
> -				userq_arr_cap[AMD_IP_DMA]) {
> -			igt_dynamic_f("all-queues-with-umq")
> -			amdgpu_test_all_queues(device, true);
> -		}
> +	igt_assert_eq(r, 0);
> +	igt_assert(*isa_sz > 0);
> +
> +	igt_info("SlthVgprProofIsa size=%zu\n", *isa_sz);
> +
> +	igt_info("SLTH VGPR PROOF ISA DUMP\n");
> +
> +	for (unsigned int i = 0; i < (*isa_sz / sizeof(uint32_t)); i++) {
> +		igt_info("ISA[%u] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
>   	}
> +}
>   
> -	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
> -	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> -			igt_dynamic_f("cs-gfx-fwm-umq")
> -				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
> -		}
> +static uint32_t execute_slth_dispatch(
> +		amdgpu_device_handle device,
> +		uint32_t ip_type,
> +		uint32_t version,
> +		const uint32_t *shader,
> +		uint32_t shader_size)
> +{
> +	const struct amdgpu_ip_block_version *gfx_ip =
> +		get_ip_block(device, AMD_IP_GFX);
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo = NULL;
> +	amdgpu_va_handle va = 0;
> +
> +	void *cpu = NULL;
> +	uint32_t *ptr_pm4 = NULL;
> +	volatile uint32_t *ptr_output = NULL;
> +
> +	uint64_t mc = 0;
> +	uint64_t shader_mc_addr;
> +	uint64_t output_mc_addr;
> +
> +	struct amdgpu_cmd_base *base_cmd;
> +	struct amdgpu_cs_request ib_req = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence = {0};
> +
> +	amdgpu_bo_list_handle bo_list = NULL;
> +
> +	amdgpu_bo_handle bos[1];
> +
> +	uint32_t expired = 0;
> +	uint32_t output_value;
> +	int r;
> +
> +	base_cmd = get_cmd_base();
> +	igt_assert(base_cmd);
> +
> +	r = amdgpu_cs_ctx_create(device, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    65536,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo,
> +			&cpu,
> +			&mc,
> +			&va);
> +	igt_assert_eq(r, 0);
> +
> +	memset(cpu, 0, 65536);
> +
> +	ptr_pm4 = (uint32_t *)cpu;
> +
> +	memcpy((uint8_t *)cpu + 0x1000,
> +	       shader,
> +			shader_size);
> +
> +	ptr_output =
> +		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> +
> +	memset((void *)ptr_output, 0, 4096);
> +
> +	shader_mc_addr = mc + 0x1000;
> +	output_mc_addr = mc + 0x2000;
> +
> +	igt_info("s0 expected address low  = 0x%08x\n",
> +		 lower_32_bits(output_mc_addr));
> +
> +	igt_info("s1 expected address high = 0x%08x\n",
> +		 upper_32_bits(output_mc_addr));
> +
> +	igt_info("========================================\n");
> +	igt_info("SLTH DISPATCH START\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("ip_type        = %u\n", ip_type);
> +	igt_info("version        = %u\n", version);
> +
> +	igt_info("base_mc_addr   = 0x%016llx\n",
> +		 (unsigned long long)mc);
> +
> +	igt_info("shader_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)shader_mc_addr);
> +
> +	igt_info("output_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)output_mc_addr);
> +
> +	igt_info("shader_end     = 0x%016llx\n",
> +		 (unsigned long long)
> +			(shader_mc_addr + shader_size));
> +
> +	igt_info("output_end     = 0x%016llx\n",
> +		 (unsigned long long)
> +			(output_mc_addr + 16384));
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_pm4,
> +			4096);
> +
> +	igt_assert(gfx_ip);
> +	igt_assert(gfx_ip->funcs);
> +	igt_assert(gfx_ip->funcs->gfx_program_compute);
> +	igt_assert(gfx_ip->funcs->gfx_dispatch_direct);
> +
> +	igt_info("========================================\n");
> +	igt_info("NATIVE GFX PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("user_data[0] = 0x%08x\n",
> +		 lower_32_bits(output_mc_addr));
> +
> +	igt_info("user_data[1] = 0x%08x\n",
> +		 upper_32_bits(output_mc_addr));
> +
> +	gfx_ip->funcs->gfx_program_compute(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			shader_mc_addr,
> +			output_mc_addr,
> +			0x002c0040,
> +			0x00000010,
> +			1,
> +			1,
> +			1);
> +
> +	igt_info("PM4 dwords after gfx_program_compute = %u\n",
> +		 base_cmd->cdw);
> +
> +	gfx_ip->funcs->gfx_dispatch_direct(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			1,
> +			1,
> +			1,
> +			0);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("PM4 dwords after dispatch = %u\n",
> +		 base_cmd->cdw);
> +
> +	bos[0] = bo;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  1,
> +			bos,
> +			NULL,
> +			&bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ib_req.ip_type = ip_type;
> +	ib_req.ring = 0;
> +	ib_req.resources = bo_list;
> +	ib_req.number_of_ibs = 1;
> +	ib_req.ibs = &ib_info;
> +
> +	igt_info("========================================\n");
> +	igt_info("PRE-DISPATCH OUTPUT BUFFER\n");
> +	igt_info("========================================\n");
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("PRE[%d] = 0x%08x\n",
> +			 i,
> +				ptr_output[i]);
>   	}
>   
> -	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
> -	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
> -		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> -			igt_dynamic_f("cs-compute-fwm-umq")
> -				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
> -		}
> +	igt_info("========================================\n");
> +	igt_info("IB SUBMIT\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("ib_mc_address = 0x%016llx\n",
> +		 (unsigned long long)ib_info.ib_mc_address);
> +
> +	igt_info("ib_size_dw    = %u\n",
> +		 ib_info.size);
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ib_req,
> +			1);
> +
> +	igt_info("cs_submit ret = %d\n", r);
> +
> +	igt_assert_eq(r, 0);
> +
> +	fence.context = context_handle;
> +	fence.ip_type = ip_type;
> +	fence.ip_instance = 0;
> +	fence.ring = 0;
> +	fence.fence = ib_req.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(&fence,
> +					 5000000000ULL,
> +			0,
> +			&expired);
> +
> +	igt_info("========================================\n");
> +	igt_info("FENCE STATUS\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("query ret = %d\n", r);
> +	igt_info("expired   = %u\n", expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	output_value = ptr_output[0];
> +
> +	igt_info("========================================\n");
> +	igt_info("OUTPUT BUFFER DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("OUT[%d] = 0x%08x\n",
> +			 i,
> +				ptr_output[i]);
>   	}
>   
> +	igt_info("========================================\n");
> +	igt_info("RESULT\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("output value = 0x%x (%u)\n",
> +		 output_value,
> +			output_value);
> +
> +	if (bo_list)
> +		amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(bo,
> +				 va,
> +			mc,
> +			65536);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("SLTH DISPATCH END\n");
> +
> +	return output_value;
> +}
> +
> +static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
> +					int fd)
> +{
> +	struct slth_bufs bufs;
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	struct amdgpu_gpu_info info = {0};
> +	uint32_t version = 12;
> +	uint32_t value;
> +
> +	int ret;
> +	int r;
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("SLTH GFX KQ VGPR PROOF\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_vgpr_proof_shader(device,
> +				       isa_bin,
> +			&isa_sz);
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	if (FAMILY_IS_GFX1200(info.family_id))
> +		version = 12;
> +	else if (FAMILY_IS_GFX1150(info.family_id) ||
> +		 FAMILY_IS_GFX1100(info.family_id) ||
> +			FAMILY_IS_GFX1036(info.family_id) ||
> +			FAMILY_IS_GFX1037(info.family_id) ||
> +			FAMILY_IS_YC(info.family_id) ||
> +			info.family_id == FAMILY_GFX1103)
> +		version = 11;
> +	else
> +		version = 10;
> +
> +	igt_info("Running SLTH VGPR proof shader\n");
> +
> +	value = execute_slth_dispatch(device,
> +				      AMDGPU_HW_IP_GFX,
> +			version,
> +			(const uint32_t *)isa_bin,
> +			(uint32_t)isa_sz);
> +
> +	igt_info("VGPR proof output value=%u\n", value);
> +
> +	if (value == 42)
> +		igt_info("SLTH trap handler updated VGPR state, shader resumed successfully\n");
> +	else
> +		igt_info("SLTH GFX KQ VGPR proof failed: expected=42 actual=%u\n",
> +			 value);
> +
> +	igt_assert_eq(value, 42);
> +
> +	ret = vm_clear_l2_trap(fd);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	igt_info("SLTH GFX KQ VGPR PROOF COMPLETE\n");
> +}
> +
> +static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
> +					 int fd)
> +{
> +	const struct amdgpu_ip_block_version *gfx_ip =
> +		get_ip_block(device, AMD_IP_GFX);
> +
> +	struct amdgpu_ring_context *ring_context;
> +
> +	amdgpu_bo_handle bo = NULL;
> +	amdgpu_va_handle va = 0;
> +
> +	void *cpu = NULL;
> +	uint32_t *ptr_pm4 = NULL;
> +	volatile uint32_t *ptr_output = NULL;
> +
> +	uint64_t mc = 0;
> +	uint64_t shader_mc_addr;
> +	uint64_t output_mc_addr;
> +
> +	struct amdgpu_cmd_base *base_cmd;
> +
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	const uint32_t *shader;
> +	uint32_t size_bytes;
> +
> +	struct slth_bufs bufs;
> +
> +	int r;
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_assert(gfx_ip);
> +	igt_assert(gfx_ip->funcs);
> +
> +	igt_info("SLTH GFX UMQ VGPR PROOF\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	igt_info("TBA=0x%016llx\n",
> +		 (unsigned long long)bufs.tba_mc_addr);
> +
> +	igt_info("TMA=0x%016llx\n",
> +		 (unsigned long long)bufs.tma_mc_addr);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	igt_info("TrapHandlerIsaProof loaded into TBA\n");
> +
> +	r = vm_set_l2_trap(fd,
> +			   bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +
> +	igt_info("SET_L2_TRAP ret=%d\n", r);
> +
> +	igt_assert_eq(r, 0);
> +
> +	slth_prepare_vgpr_proof_shader(device,
> +				       isa_bin,
> +			&isa_sz);
> +
> +	shader = (const uint32_t *)isa_bin;
> +	size_bytes = (uint32_t)isa_sz;
> +
> +	igt_assert(shader);
> +	igt_assert(size_bytes > 0);
> +
> +	igt_info("SlthVgprProofIsa size=%u\n",
> +		 size_bytes);
> +
> +	igt_info("shader=%p size=%u\n",
> +		 shader,
> +			size_bytes);
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +
> +	gfx_ip->funcs->userq_create(device,
> +			ring_context,
> +			gfx_ip->type);
> +
> +	igt_info("UMQ queue created\n");
> +
> +	igt_info("timeline=%u point=%llu\n",
> +		 ring_context->timeline_syncobj_handle,
> +			(unsigned long long)ring_context->point);
> +
> +	base_cmd = get_cmd_base();
> +	igt_assert(base_cmd);
> +
> +	r = amdgpu_bo_alloc_and_map_sync(
> +			device,
> +			65536,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +			AMDGPU_VM_MTYPE_UC,
> +			&bo,
> +			&cpu,
> +			&mc,
> +			&va,
> +			ring_context->timeline_syncobj_handle,
> +			++ring_context->point,
> +			true);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_timeline_syncobj_wait(
> +			device,
> +			ring_context->timeline_syncobj_handle,
> +			ring_context->point);
> +	igt_assert_eq(r, 0);
> +
> +	memset(cpu, 0, 65536);
> +
> +	ptr_pm4 = (uint32_t *)cpu;
> +
> +	memcpy((uint8_t *)cpu + 0x1000,
> +	       shader,
> +			size_bytes);
> +
> +	ptr_output =
> +		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
> +
> +	memset((void *)ptr_output, 0, 4096);
> +
> +	shader_mc_addr = mc + 0x1000;
> +	output_mc_addr = mc + 0x2000;
> +
> +	igt_info("shader_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)shader_mc_addr);
> +
> +	igt_info("output_mc_addr = 0x%016llx\n",
> +		 (unsigned long long)output_mc_addr);
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_pm4,
> +			4096);
> +
> +	gfx_ip->funcs->gfx_program_compute(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			shader_mc_addr,
> +			output_mc_addr,
> +			0x002c0040,
> +			0x00000010,
> +			1,
> +			1,
> +			1);
> +
> +	igt_info("PM4 dwords after gfx_program_compute = %u\n",
> +		 base_cmd->cdw);
> +
> +	gfx_ip->funcs->gfx_dispatch_direct(
> +			gfx_ip->funcs,
> +			base_cmd,
> +			1,
> +			1,
> +			1,
> +			0);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("PM4 dwords after dispatch = %u\n",
> +		 base_cmd->cdw);
> +
> +	ring_context->pm4_dw = base_cmd->cdw;
> +
> +	igt_info("UMQ pm4_dw=%u\n",
> +		 ring_context->pm4_dw);
> +
> +	igt_info("IB gpu addr=0x%016llx\n",
> +		 (unsigned long long)mc);
> +
> +	igt_info("Submitting REAL UMQ dispatch\n");
> +
> +	igt_info("=== PM4 DUMP BEGIN ===\n");
> +
> +	for (int i = 0; i < base_cmd->cdw; i++) {
> +		igt_info("PM4[%02d] = 0x%08x\n",
> +			 i,
> +				ptr_pm4[i]);
> +	}
> +
> +	igt_info("=== PM4 DUMP END ===\n");
> +
> +	igt_info("before submit point=%llu\n",
> +		 (unsigned long long)ring_context->point);
> +
> +	igt_info("pre-submit wptr=%llu rptr=%llu\n",
> +		 (unsigned long long)*ring_context->wptr_cpu,
> +			(unsigned long long)*ring_context->rptr_cpu);
> +
> +	igt_info("IB first 16 DWs:\n");
> +
> +	for (int i = 0; i < 16 && i < ring_context->pm4_dw; i++)
> +		igt_info("IB[%d]=0x%08x\n", i, ptr_pm4[i]);
> +
> +	gfx_ip->funcs->userq_submit(device,
> +			ring_context,
> +			gfx_ip->type,
> +			mc);
> +
> +	igt_info("Returned from userq_submit()\n");
> +
> +	igt_info("post-submit wptr=%llu rptr=%llu\n",
> +		 (unsigned long long)*ring_context->wptr_cpu,
> +			(unsigned long long)*ring_context->rptr_cpu);
> +
> +	usleep(100000);
> +
> +	igt_info("100ms later wptr=%llu rptr=%llu\n",
> +		 (unsigned long long)*ring_context->wptr_cpu,
> +			(unsigned long long)*ring_context->rptr_cpu);
> +
> +	igt_info("after submit point=%llu\n",
> +		 (unsigned long long)ring_context->point);
> +
> +	igt_info("timeline=%u point=%llu\n",
> +		 ring_context->timeline_syncobj_handle,
> +			(unsigned long long)ring_context->point);
> +
> +	r = amdgpu_timeline_syncobj_wait(
> +			device,
> +			ring_context->timeline_syncobj_handle,
> +			ring_context->point);
> +
> +	igt_info("timeline wait ret=%d\n", r);
> +
> +	igt_info("pm4_dw=%u\n",
> +		 ring_context->pm4_dw);
> +
> +	for (int i = 0; i < 1000; i++) {
> +		if (ptr_output[0])
> +			break;
> +
> +		usleep(1000);
> +	}
> +
> +	igt_info("final output=0x%x\n",
> +		 ptr_output[0]);
> +
> +	igt_info("Post-dispatch output dump\n");
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("OUT[%d] = 0x%08x\n",
> +			 i,
> +				ptr_output[i]);
> +	}
> +
> +	igt_info("output_value=%u (0x%x)\n",
> +		 ptr_output[0],
> +			ptr_output[0]);
> +
> +	igt_info("VGPR proof output=%u\n",
> +		 ptr_output[0]);
> +
> +	igt_assert_eq(ptr_output[0], 42);
> +
> +	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
> +
> +	amdgpu_bo_unmap_and_free(bo,
> +				 va,
> +			mc,
> +			65536);
> +
> +	free_cmd_base(base_cmd);
> +
> +	gfx_ip->funcs->userq_destroy(device,
> +			ring_context,
> +			gfx_ip->type);
> +
> +	r = vm_clear_l2_trap(fd);
> +
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", r);
> +
> +	igt_assert_eq(r, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	free(ring_context);
> +
> +	igt_info("UMQ queue destroyed\n");
> +}
> +
> +static void
> +slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
> +			     int fd)
> +{
> +	struct slth_bufs bufs;
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo_dst;
> +	amdgpu_bo_handle bo_shader;
> +	amdgpu_bo_handle bo_cmd;
> +
> +	amdgpu_bo_handle resources[3];
> +
> +	volatile uint32_t *ptr_dst;
> +
> +	void *ptr_shader;
> +	uint32_t *ptr_cmd;
> +
> +	uint64_t mc_address_dst;
> +	uint64_t mc_address_shader;
> +	uint64_t mc_address_cmd;
> +
> +	amdgpu_va_handle va_dst;
> +	amdgpu_va_handle va_shader;
> +	amdgpu_va_handle va_cmd;
> +
> +	amdgpu_bo_list_handle bo_list;
> +
> +	struct amdgpu_cs_request ibs_request = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence_status = {0};
> +
> +	struct amdgpu_cmd_base *base_cmd =
> +		get_cmd_base();
> +
> +	uint32_t expired = 0;
> +	uint32_t version = 12;
> +
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	int bo_dst_size = 16384;
> +	int bo_shader_size = 4096;
> +	int bo_cmd_size = 4096;
> +
> +	int i;
> +	int r;
> +	int ret;
> +
> +	igt_assert(base_cmd);
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("========================================\n");
> +	igt_info("COMP KQ VGPR PROOF\n");
> +	igt_info("SLTH VGPR PROOF\n");
> +	igt_info("========================================\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +
> +	igt_info("SET_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_vgpr_proof_shader(device,
> +				       isa_bin,
> +			&isa_sz);
> +
> +	igt_assert(isa_sz > 0);
> +
> +	igt_info("SlthVgprProofIsa size=%zu\n",
> +		 isa_sz);
> +
> +	igt_info("===== SLTH VGPR PROOF ISA BEGIN =====\n");
> +
> +	for (i = 0; i < isa_sz / 4; i++) {
> +		igt_info("ISA[%02d] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +
> +	igt_info("===== SLTH VGPR PROOF ISA END =====\n");
> +
> +	r = amdgpu_cs_ctx_create(device,
> +				 &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_cmd_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo_cmd,
> +			(void **)&ptr_cmd,
> +			&mc_address_cmd,
> +			&va_cmd);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_cmd, 0, bo_cmd_size);
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_cmd,
> +			bo_cmd_size);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_shader_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_shader,
> +			&ptr_shader,
> +			&mc_address_shader,
> +			&va_shader);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_shader, 0, bo_shader_size);
> +
> +	memcpy(ptr_shader,
> +	       isa_bin,
> +			isa_sz);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_dst_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_dst,
> +			(void **)&ptr_dst,
> +			&mc_address_dst,
> +			&va_dst);
> +	igt_assert_eq(r, 0);
> +
> +	memset((void *)ptr_dst,
> +	       0,
> +			bo_dst_size);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("output_lo=0x%08x\n",
> +		 lower_32_bits(mc_address_dst));
> +
> +	igt_info("output_hi=0x%08x\n",
> +		 upper_32_bits(mc_address_dst));
> +
> +	amdgpu_dispatch_init(
> +			AMDGPU_HW_IP_COMPUTE,
> +			base_cmd,
> +			version);
> +
> +	amdgpu_dispatch_write_cumask(
> +			base_cmd,
> +			version);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	amdgpu_dispatch_write2hw(
> +			base_cmd,
> +			mc_address_shader,
> +			version,
> +			0);
> +
> +	igt_info("cdw after write2hw = %u\n",
> +		 base_cmd->cdw);
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	igt_info("========================================\n");
> +	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("mc_address_dst      = 0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("dst low dword       = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("dst high dword      = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("SET_SH_REG base     = 0x240\n");
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +
> +	base_cmd->emit(base_cmd, 0x240);
> +
> +	/*
> +	 * s0:s1 = source address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +
> +	/*
> +	 * s2:s3 = destination address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +
> +	base_cmd->emit(base_cmd, 0x215);
> +	base_cmd->emit(base_cmd, 0);
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> +					3));
> +
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("Dispatch PM4 DW=%u\n",
> +		 base_cmd->cdw);
> +
> +	igt_info("========================================\n");
> +	igt_info("FINAL PM4 DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	resources[0] = bo_dst;
> +	resources[1] = bo_shader;
> +	resources[2] = bo_cmd;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  3,
> +			resources,
> +			NULL,
> +			&bo_list);
> +
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc_address_cmd;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	ibs_request.ring = 0;
> +	ibs_request.resources = bo_list;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ibs_request,
> +			1);
> +
> +	igt_info("cs_submit ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +
> +	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.context = context_handle;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(
> +			&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,
> +			0,
> +			&expired);
> +
> +	igt_info("fence ret=%d expired=%u\n",
> +		 r,
> +			expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	igt_info("===== OUTPUT DUMP =====\n");
> +
> +	for (i = 0; i < 32; i++) {
> +		igt_info("OUT[%02d]=0x%08x\n",
> +			 i,
> +				ptr_dst[i]);
> +	}
> +
> +	igt_info("output[0]=0x%x (%u)\n",
> +		 ptr_dst[0],
> +			ptr_dst[0]);
> +
> +	igt_assert_eq(ptr_dst[0], 42);
> +
> +	ret = vm_clear_l2_trap(fd);
> +
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_dst,
> +			va_dst,
> +			mc_address_dst,
> +			bo_dst_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_shader,
> +			va_shader,
> +			mc_address_shader,
> +			bo_shader_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_cmd,
> +			va_cmd,
> +			mc_address_cmd,
> +			bo_cmd_size);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("COMP KQ VGPR PROOF COMPLETE\n");
> +}
> +
> +static void
> +slth_prepare_returnproof_shader(amdgpu_device_handle device,
> +				uint8_t *isa_bin,
> +		size_t *isa_sz)
> +{
> +	struct amdgpu_gpu_info info = {0};
> +	char mcpu[32] = {};
> +	int r;
> +
> +	r = amdgpu_query_gpu_info(device, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_family_id_to_mcpu(info.family_id,
> +				     mcpu,
> +			sizeof(mcpu));
> +	igt_assert_eq(r, 0);
> +
> +	igt_info("===== RETURNPROOF SHADER SOURCE BEGIN =====\n");
> +	igt_info("%s\n", SlthReturnProofIsa);
> +	igt_info("===== RETURNPROOF SHADER SOURCE END =====\n");
> +
> +	r = amdgpu_llvm_assemble(mcpu,
> +				 SlthReturnProofIsa,
> +			isa_bin,
> +			8192,
> +			isa_sz);
> +
> +	igt_info("amdgpu_llvm_assemble returned %d\n", r);
> +
> +	if (r) {
> +		igt_info("===== SHADER SOURCE BEGIN =====\n");
> +		igt_info("%s\n", SlthReturnProofIsa);
> +		igt_info("===== SHADER SOURCE END =====\n");
> +	}
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert(*isa_sz > 0);
> +
> +	igt_info("SlthReturnProofIsa size=%zu\n",
> +		 *isa_sz);
> +
> +	igt_info("RETURNPROOF SHADER ISA DUMP\n");
> +
> +	for (unsigned int i = 0;
> +			i < (*isa_sz / sizeof(uint32_t));
> +			i++) {
> +		igt_info("ISA[%u] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +}
> +
> +static void
> +slth_comp_kq_returnproof_test(amdgpu_device_handle device,
> +			      int fd)
> +{
> +	struct slth_bufs bufs;
> +
> +	amdgpu_context_handle context_handle;
> +
> +	amdgpu_bo_handle bo_dst;
> +	amdgpu_bo_handle bo_shader;
> +	amdgpu_bo_handle bo_cmd;
> +
> +	amdgpu_bo_handle resources[3];
> +
> +	volatile uint32_t *ptr_dst;
> +
> +	void *ptr_shader;
> +	uint32_t *ptr_cmd;
> +
> +	uint64_t mc_address_dst;
> +	uint64_t mc_address_shader;
> +	uint64_t mc_address_cmd;
> +
> +	amdgpu_va_handle va_dst;
> +	amdgpu_va_handle va_shader;
> +	amdgpu_va_handle va_cmd;
> +
> +	amdgpu_bo_list_handle bo_list;
> +
> +	struct amdgpu_cs_request ibs_request = {0};
> +	struct amdgpu_cs_ib_info ib_info = {0};
> +	struct amdgpu_cs_fence fence_status = {0};
> +
> +	struct amdgpu_cmd_base *base_cmd =
> +		get_cmd_base();
> +
> +	uint32_t expired = 0;
> +	uint32_t version = 12;
> +
> +	uint8_t isa_bin[8192];
> +	size_t isa_sz = 0;
> +
> +	int bo_dst_size = 16384;
> +	int bo_shader_size = 4096;
> +	int bo_cmd_size = 4096;
> +
> +	int i;
> +	int r;
> +	int ret;
> +
> +	igt_assert(base_cmd);
> +
> +	memset(&bufs, 0, sizeof(bufs));
> +
> +	igt_info("========================================\n");
> +	igt_info("COMP KQ RETURNPROOF\n");
> +	igt_info("SLTH RETURNPROOF\n");
> +	igt_info("========================================\n");
> +
> +	slth_alloc_buffers(device, &bufs);
> +
> +	slth_prepare_tba_with_handler(device,
> +				      &bufs,
> +			TrapHandlerIsaProof);
> +
> +	ret = vm_set_l2_trap(fd,
> +			     bufs.tba_mc_addr,
> +			bufs.tma_mc_addr);
> +
> +	igt_info("SET_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_prepare_returnproof_shader(device,
> +					isa_bin,
> +			&isa_sz);
> +	igt_assert(isa_sz > 0);
> +
> +	igt_info("SlthReturnProofIsa size=%zu\n", isa_sz);
> +
> +	igt_info("===== RETURNPROOF ISA BEGIN =====\n");
> +
> +	for (i = 0; i < isa_sz / 4; i++) {
> +		igt_info("ISA[%02d] = 0x%08x\n",
> +			 i,
> +				((uint32_t *)isa_bin)[i]);
> +	}
> +
> +	igt_info("===== RETURNPROOF ISA END =====\n");
> +
> +	r = amdgpu_cs_ctx_create(device,
> +				 &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_cmd_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_GTT,
> +			0,
> +			&bo_cmd,
> +			(void **)&ptr_cmd,
> +			&mc_address_cmd,
> +			&va_cmd);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_cmd, 0, bo_cmd_size);
> +
> +	base_cmd->attach_buf(base_cmd,
> +			ptr_cmd,
> +			bo_cmd_size);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_shader_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_shader,
> +			&ptr_shader,
> +			&mc_address_shader,
> +			&va_shader);
> +	igt_assert_eq(r, 0);
> +
> +	memset(ptr_shader, 0, bo_shader_size);
> +
> +	memcpy(ptr_shader,
> +	       isa_bin,
> +			isa_sz);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	r = amdgpu_bo_alloc_and_map(device,
> +				    bo_dst_size,
> +			4096,
> +			AMDGPU_GEM_DOMAIN_VRAM,
> +			0,
> +			&bo_dst,
> +			(void **)&ptr_dst,
> +			&mc_address_dst,
> +			&va_dst);
> +	igt_assert_eq(r, 0);
> +
> +	memset((void *)ptr_dst,
> +	       0,
> +			bo_dst_size);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("output_lo=0x%08x\n",
> +		 lower_32_bits(mc_address_dst));
> +
> +	igt_info("output_hi=0x%08x\n",
> +		 upper_32_bits(mc_address_dst));
> +
> +	amdgpu_dispatch_init(
> +			AMDGPU_HW_IP_COMPUTE,
> +			base_cmd,
> +			version);
> +
> +	amdgpu_dispatch_write_cumask(
> +			base_cmd,
> +			version);
> +
> +	igt_info("shader_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_shader);
> +
> +	igt_info("output_mc_addr=0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	amdgpu_dispatch_write2hw(
> +			base_cmd,
> +			mc_address_shader,
> +			version,
> +			0);
> +
> +	igt_info("cdw after write2hw = %u\n",
> +		 base_cmd->cdw);
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PRE_USERDATA_PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	igt_info("========================================\n");
> +	igt_info("COMPUTE USER DATA PROGRAMMING\n");
> +	igt_info("========================================\n");
> +
> +	igt_info("mc_address_dst      = 0x%016llx\n",
> +		 (unsigned long long)mc_address_dst);
> +
> +	igt_info("dst low dword       = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("dst high dword      = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("SET_SH_REG base     = 0x240\n");
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +
> +	base_cmd->emit(base_cmd, 0x240);
> +
> +	/*
> +	 * s0:s1 = source address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +
> +	/*
> +	 * s2:s3 = destination address
> +	 */
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)mc_address_dst);
> +
> +	base_cmd->emit(base_cmd,
> +			(uint32_t)(mc_address_dst >> 32));
> +	igt_info("USER_DATA[0] (s0 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[1] (s1 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	igt_info("USER_DATA[2] (s2 low)  = 0x%08x\n",
> +		 (uint32_t)mc_address_dst);
> +
> +	igt_info("USER_DATA[3] (s3 high) = 0x%08x\n",
> +		 (uint32_t)(mc_address_dst >> 32));
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +
> +	base_cmd->emit(base_cmd, 0x215);
> +	base_cmd->emit(base_cmd, 0);
> +
> +	base_cmd->emit(base_cmd,
> +			PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,
> +					3));
> +
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +	base_cmd->emit(base_cmd, 1);
> +
> +	base_cmd->emit_aligned(base_cmd,
> +			7,
> +			GFX_COMPUTE_NOP);
> +
> +	igt_info("Dispatch PM4 DW=%u\n",
> +		 base_cmd->cdw);
> +
> +	igt_info("========================================\n");
> +	igt_info("FINAL PM4 DUMP\n");
> +	igt_info("========================================\n");
> +
> +	for (uint32_t j = 0; j < base_cmd->cdw; j++)
> +		igt_info("PM4[%02u] = 0x%08x\n",
> +			 j,
> +				ptr_cmd[j]);
> +
> +	resources[0] = bo_dst;
> +	resources[1] = bo_shader;
> +	resources[2] = bo_cmd;
> +
> +	r = amdgpu_bo_list_create(device,
> +				  3,
> +			resources,
> +			NULL,
> +			&bo_list);
> +
> +	igt_assert_eq(r, 0);
> +
> +	ib_info.ib_mc_address = mc_address_cmd;
> +	ib_info.size = base_cmd->cdw;
> +
> +	ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	ibs_request.ring = 0;
> +	ibs_request.resources = bo_list;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +
> +	r = amdgpu_cs_submit(context_handle,
> +			     0,
> +			&ibs_request,
> +			1);
> +
> +	igt_info("cs_submit ret=%d\n", r);
> +	igt_assert_eq(r, 0);
> +
> +	fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.context = context_handle;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(
> +			&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,
> +			0,
> +			&expired);
> +
> +	igt_info("fence ret=%d expired=%u\n",
> +		 r,
> +			expired);
> +
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(expired, 1);
> +
> +	igt_info("===== OUTPUT DUMP =====\n");
> +
> +	for (i = 0; i < 32; i++) {
> +		igt_info("OUT[%02d]=0x%08x\n",
> +			 i,
> +				ptr_dst[i]);
> +	}
> +
> +	igt_info("output[0]=0x%x (%u)\n",
> +		 ptr_dst[0],
> +			ptr_dst[0]);
> +
> +	igt_assert_eq(ptr_dst[0], 2);
> +
> +	ret = vm_clear_l2_trap(fd);
> +
> +	igt_info("CLEAR_L2_TRAP ret=%d\n", ret);
> +	igt_assert_eq(ret, 0);
> +
> +	slth_free_buffers(&bufs);
> +
> +	amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_dst,
> +			va_dst,
> +			mc_address_dst,
> +			bo_dst_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_shader,
> +			va_shader,
> +			mc_address_shader,
> +			bo_shader_size);
> +
> +	amdgpu_bo_unmap_and_free(
> +			bo_cmd,
> +			va_cmd,
> +			mc_address_cmd,
> +			bo_cmd_size);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +
> +	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
> +}
> +
> +int igt_main()
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info = {0};
> +	int fd = -1;
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
> +#ifdef AMDGPU_USERQ_ENABLED
> +
> +	enable_test = true;
> +#endif
> +
> +	igt_fixture() {
> +		uint32_t major, minor;
> +		int err;
> +
> +		log_total_time(true, igt_test_name());
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +		asic_rings_readness(device, 1, arr_cap);
> +		asic_userq_readiness(device, userq_arr_cap);
> +		amd_platform_filter_init(&gpu_info);
> +	}
> +	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
> +	igt_subtest("memory-alloc")
> +		amdgpu_memory_alloc(device);
> +
> +	igt_describe("Check-DMA-CS-works-by-setting-the-pattern-and-after-execution-compare-memory-with-the-golden-settings");
> +	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("userptr")
> +			amdgpu_userptr_test(device);
> +		}
> +	}
> +
> +	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("cs-gfx")
> +			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, false);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
> +	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("cs-compute")
> +			amdgpu_command_submission_compute(device, false);
> +		}
> +	}
> +
> +	igt_describe("Check-GFX-CS-for-multi-fence");
> +	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
> +			igt_dynamic_f("cs-multi-fence")
> +			amdgpu_command_submission_multi_fence(device);
> +		} else {
> +			igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
> +		}
> +	}
> +
> +	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
> +	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("cs-sdma")
> +			amdgpu_command_submission_sdma(device, false);
> +		}
> +	}
> +
> +	igt_describe("Check-signal-semaphore-on-DMA-wait-on-GFX");
> +	igt_subtest_with_dynamic("semaphore-with-IP-GFX-and-IP-DMA") {
> +		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("semaphore")
> +			amdgpu_semaphore_test(device);
> +		}
> +	}
> +
> +	igt_describe("Check-eviction-using-DMA-max-allocation-size");
> +	igt_subtest_with_dynamic("eviction-test-with-IP-DMA") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("eviction_test")
> +			amdgpu_bo_eviction_test(device);
> +		}
> +	}
> +
> +	igt_describe("Check-sync-dependency-using-GFX-ring");
> +	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("sync-dependency-test")
> +			amdgpu_sync_dependency_test(device, false);
> +		}
> +	}
> +
> +	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("cs-gfx-with-umq")
> +			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
> +	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("cs-compute-with-umq")
> +			amdgpu_command_submission_compute(device, true);
> +		}
> +	}
> +
> +	igt_describe("Check-sync-dependency-using-GFX-ring");
> +	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("sync-dependency-test-with-umq")
> +			amdgpu_sync_dependency_test(device, true);
> +		}
> +	}
> +
> +	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
> +	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("cs-sdma-with-umq")
> +			amdgpu_command_submission_sdma(device, true);
> +		}
> +	}
> +
> +	igt_describe("Check-all-user-queues-for-write-operation");
> +	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> +		    userq_arr_cap[AMD_IP_COMPUTE] &&
> +				userq_arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("all-queues-with-umq")
> +			amdgpu_test_all_queues(device, true);
> +		}
> +	}
> +
> +	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("cs-gfx-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("cs-compute-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
> +		}
> +	}
> +
> +	igt_subtest("slth-gfx-kq-vgpr-proof")
> +		slth_gfx_kq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-gfx-umq-vgpr-proof")
> +		slth_gfx_umq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-comp-kq-vgpr-proof")
> +		slth_comp_kq_vgpr_proof_test(device, fd);
> +
> +	igt_subtest("slth-comp-kq-returnproof")
> +		slth_comp_kq_returnproof_test(device, fd);
> +
>   	igt_fixture() {
>   		amdgpu_device_deinitialize(device);
>   		drm_close_driver(fd);

