Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30AC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 21:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63210E466;
	Tue, 29 Apr 2025 21:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bLButTGr";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3020E10E466
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 21:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFkQDMdRgjKnBiI2gZaLnXEVK2aOsZ7YX3S83ocMTss1ngCPxZj3lrbBdoJVG+55aRZgPy/3GocQL6S1WtkuBHJp0+/ppYtxPwXEYcBkL2/WZfuSCNvZHJY5s0OiqlxMaRVrWRMUPBmDUKnpLtGMnSPtOafv1ihZNa2l5C2Sqr3O/Gdxbqsi0g6DBdYj0SnTzxSBlx9Z+OJw+F9fpmFkXt5mKAYLE9A/dwFKmJ08KCB98z+tWRqkSz2sDZRD+ZatH7ZoV8XdMTNZN5qV+GX6TnQWFz07FtDWpA0odNPIkWKl+mvDU4JbTdulWWu2eMYPsvEg4UvXAaLEPjaiTJ2UKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ1QQjc+DoNMV1idcqCFk+x93rN0nrEsteotB746WZM=;
 b=GlpM/UPshOuGlB3WT3+iRqLin51VB0rSvQHgF1bM0QIAIjmpcN/TTfMRcONpdNvtmfp4mxQwNkOSsU1qrAhMpZQh7GwsRNC5/U93wFdUOjyUaPJs+jGWEXXZtDD/lFVY+qjYOfyOKCTNxRI0WO6X/yQ1JkOfIWhNtOIA05ok5sftsr8YPWIZ1esrLz7QbQRAkagC20n5dLbFBqkC13UU0w/ToQsO46bJxwZbgF/xKf2OaewRdi2YVbM/ORmX43u2gYb60RmLAeg1oWZUjBsTOE+/tf1JJ9FE/3hHclw56R4ijPqB8glM7OMwpYG0vOis8RLI+fw0UKGX6MTnM/F0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ1QQjc+DoNMV1idcqCFk+x93rN0nrEsteotB746WZM=;
 b=bLButTGrguwimTYA7JLs66C925LbMkoM4E0iiiXXiUa9uVpmpGgEg5IElulJoe99p2bmQAmhCUvy2i0IklAOQ8jFRUYAsLlacq4ki6GbqZW0u4PAk446FBiVTPzFU0QkYEtT9DSyQwrVoGJCTTELHcyQhl7pkKXTYdiBtr0Q/LM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 21:59:00 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 21:59:00 +0000
Content-Type: multipart/alternative;
 boundary="------------SWLtjUQXZTZFTHKIquDIrVKE"
Message-ID: <5ff7ada2-cdcc-4b72-9e48-e4c70711a8be@amd.com>
Date: Tue, 29 Apr 2025 17:58:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm-uapi/amdgpu: add UAPI query if user queues are
 supported
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
References: <20250429103653.190107-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250429103653.190107-1-sunil.khatri@amd.com>
X-ClientProxiedBy: YQBPR0101CA0225.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6004a8-7efa-42fa-631b-08dd87690c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NndJNVd4b3JhMnpuWFI3Zzc2US90bndoV3BibndlZy9HcXpqQjh2cmhoOFQ0?=
 =?utf-8?B?MHlWWWE4SHZISUZSWWk5YWFXZFZDV1pyMWdZeXpzQWpNTTNnNWcyU3NWK2Ns?=
 =?utf-8?B?MDZ4OHFVQnJQblZoZDNpOGJrN2dhZXBWanMxWEtlRUFlRThWQVBFa2x2WENi?=
 =?utf-8?B?TmJDVkFwRUJibjFwckhxSDRlYUJmMTRDUDlFZnc1K2FnQWtndnhqMUh0Y3Fl?=
 =?utf-8?B?eDl1SXpDZzdUMWt1QXA0UzEvaHk1cHFqMyszRXBWc2NHeC9oU0t0TFUyd0l4?=
 =?utf-8?B?cEpNdU1SaDIyTGoveE13cDljaHJUL2NBZDVtQ1RzOEJWQVBsK1gxaW1DWVVi?=
 =?utf-8?B?MTBCSnBHZXJHcGVJLzU3elR4VU92eEhmekVXdEZMYWlQN0JsL3o1ZGE3Z3dK?=
 =?utf-8?B?akxyVGpSVnJvem5yTHdhNkoxOE5ITm5tT3JwRnBlR09YTlJyOEdqbUpWUjBj?=
 =?utf-8?B?U1dPaUFJYjlqcHFrclVINjlUNU5HSllwVHRoNjgxd08vay9kRFBIUnlydXRD?=
 =?utf-8?B?QklDcHZzUVQ3NHVKa1FXQjh2NndVYTlDQ2I4U1VabmYwN0kybUN3bmY0dGl1?=
 =?utf-8?B?bkpNV2doNW5BN1p2WXhIckVXYlRCTG5KWGVPVmtTNnlIODFNbDBuWllCQ0Fk?=
 =?utf-8?B?ei9JTndlZHBIU09uWEJJWDJGT2tvcnhINWdaQkx0V1RQbUVWeHBqSEd5V25h?=
 =?utf-8?B?bnE5TE1VK214aENNY1FVUFBzenNIdU1PL0luNnFna2ZtMktiUW0rV0V3UGNh?=
 =?utf-8?B?blJtcmdjQ29rMUsvdXc0bnQ5SWlhaUVMYURKd1BaVFlyN2hVL3pYd3lMT2Nx?=
 =?utf-8?B?SW9mb2pTZGM1bVlYNUhzTzQ0RG1nK204V3BpTGVIeTE4bm9FTFk3cnZVQ3BQ?=
 =?utf-8?B?MzNMRWJiV1pQRnRlWEExNVV0K2pmN1N2cWNudk1RNEtFR2dXb0VIYkE4WEFG?=
 =?utf-8?B?Nkt6V0l2YXZMejJtdnBtTHdRckRjWjFtcGxVS3JHVmFvUVZ4N3VHL090R3cv?=
 =?utf-8?B?RHZJMG5qalJRckllWmRpRE40ZjlaRkpLYmtLVXIycW1YZ2JaakpuZkpWd241?=
 =?utf-8?B?UXBJZVFCS0lFb211M2JTZ3VJOHQzY1JDaXdKNHU5YVRkSXlpNVNsMURTcXZq?=
 =?utf-8?B?dU5TcVErdUlUb0hlczU4cVdPd2F6QjVDdEpZbk40UVhMYi9YQlNGUVNkd0hR?=
 =?utf-8?B?ZEJwbGRHSE5VMUIyNDFhSzRVWm1DZUlmYUJ2VWw3eVVjWmxXNVdMUFdDOEpl?=
 =?utf-8?B?N1FzWTZEMFFseGVSTGpPZFRYNnNRbXpEMUxMTytYT2NVcHVMUEp0ckluNWlW?=
 =?utf-8?B?dVR3VnhVNlNPQldINFlxeFBaMkJvNWVOT1NWQlp4K1lwcjR0b3pJM3RPTEM4?=
 =?utf-8?B?czg3dDFMOFMxaTdMaEpyWGJya3FkYzlWUElzUlRGNTF0TGZoNEtkTFh5WHlj?=
 =?utf-8?B?UWFjWmFWTlJaRGNuVWN1WnJTbUxQbXpWN2hwV0Y5QlVuZEo3L0NLUytick0w?=
 =?utf-8?B?bFJkNHZ0aFo2TEptNkpuRncrMnBPUXpwMzNoVDBnU25XTndUMzBpeW41U3N1?=
 =?utf-8?B?WFBGK0Q2eU1sbGc5dEFCdWFNL3J5blZZWEpSUXd5eWtvd0g1WDkrelBnM3Bu?=
 =?utf-8?B?NXJJcTZSQjQxc08vWnVkSjg2bFJWMUtJV2tFSFdhdFZJaE03VHpMT3MyL05G?=
 =?utf-8?B?SmdEWnBjNEJPRkZWMWUvWk1Sa3RybG5QakpiRERPM3M2RCtHWkR4RmQ2WGVN?=
 =?utf-8?B?UDc2SkQyandrNzk1cEJuR2Y5U1p2Sm9tQTQ2Qzk3am0ycDVBOVg3RVlhUUlz?=
 =?utf-8?Q?/I/oWYBz6PDoXeHm2NvVrYSzEAL/Gh7v3IDbE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzk2RDhJWmkvU3QzSmx0cXVYMjlnSEVmUlE5enJQVkNNeTJsbjFKRnkwdU5p?=
 =?utf-8?B?R0RxZFpjZXlBRzhScTRTZndmR0lhcWVaNmY4eXFCUzlIVUtZeHc2Z0Q4SHFZ?=
 =?utf-8?B?VkNCNDFpaDBrQkxNeVhkb0pNeUtrc09MU3RFbTJ6em9HYVZIenZHdVl2a2RP?=
 =?utf-8?B?cldwbmUrUVU2Mlp4cVNjMUpXZk5wcXJiVDh0UUtpOWZHK2VwZkRteFRWVE1x?=
 =?utf-8?B?ZDQrc0FSN2k3K1VSWGlSSmEzb3RmN20wdzUzdktWeU1SU214MHhkaGpWLzVN?=
 =?utf-8?B?d0hSaTBSalFBOU9XVW5oUERMQnU5Tkg3b05tRjZQT3JEYnI0WFZicmRqTldu?=
 =?utf-8?B?eFg1NUo2b1pBbGdkazMyQVVvVFZFbmJvOXFBbXBhV05abGhtL2dDa0l4TFdi?=
 =?utf-8?B?YmFlVXlQcExaOVJyeW9EeDZGVTZBNUhXbDdFSm01cHZWVFhaOWhBQVg1RTVT?=
 =?utf-8?B?L2FFbWx4aC9KbE1PYkxSNndCbkxlWTlpYjQveUN1Ukx3SFN1QXR6VEJoTkor?=
 =?utf-8?B?T29SSVhJd2xiNXErSmx6cm1FcFZaTVpJZ1lxcHJmTml0RW1vNHBVZGxPZUZ4?=
 =?utf-8?B?bnVIMGZYaVk5VzZOclpxNlI3MzFmbmZza0tvLzZRbFRYd21RU0IvVFUwazQv?=
 =?utf-8?B?QnVxSXV2amo0K2dOM3FTZjZYdVlIY3VqbU93SW52OStLUkJ5Ty9xcnVJRFlR?=
 =?utf-8?B?cnNBNTIyWXYrZzlXREZySDBvT2tpTVRtVkpFYnM1YU5uNTdYeWpmQktQcjZ4?=
 =?utf-8?B?SjFKRHFhSGlLZFlFMW5kS3pKYjJXVnhsYUpSZWtXUzFVZDg4dzlPQjdqZHZW?=
 =?utf-8?B?dDdQUG1Lb3FvaDRMNmtVU3ZHTzBNYjU0WmpjcVltTGU5YzJYdng0eUpXQjEx?=
 =?utf-8?B?UXU2MTA3RHkxQ0hPb0xxRFdUT0ZaeUtsN1VQdGZyaGhPYXJYV2x3YVFaKzly?=
 =?utf-8?B?R0hHMHFPSU5rakc0b1N4bWl4NWV5di9CWHVUWURoTy84LzBIa0hmaHJSNHZX?=
 =?utf-8?B?VjFqcUdFeERJSTk1eHNZVFZXYWVERjRtLytpMENhQWdTcUorbEovN2hzYndL?=
 =?utf-8?B?NjkxY0J4MmNEZC9NbVNleXFMMlJiZlZ1R1pqUFo3NEQ0YlNLc1NMdnZ2TlFq?=
 =?utf-8?B?aW1NLzFhYXJhNXlFdTlwOGRuc3BBNnFlc0U3ZlJxK1dIaDAwblF1U3BlTHdP?=
 =?utf-8?B?aHVSVnAvTEJxU3l4VWVLYzRiOUFmcUVjY05CYjJSYVh6QTJ5SWJvZGpDRU5D?=
 =?utf-8?B?eUtkYWVncHM3Tm9TM1RrcndoWDJ4R0ZFM0xuSldldXV4S2xqOFN0RlFobVBB?=
 =?utf-8?B?R2hia3FydkgvWUVveGkvWVVOcW9qL0ZGVVc2K2lHVzRTQ0FDQ2dpSWtVVnR1?=
 =?utf-8?B?SHIxdmI3Z1YrNkJsWnFOM3VKd0t0RFhsUVlzUnpwZldWZTl5K2RSR0tzdGhX?=
 =?utf-8?B?R09LcU16bFhOWG9FbFBHNVNGRFU3WFRkVCt3aU44czlSdFdabHRqV0QwSUo4?=
 =?utf-8?B?V3NjNXdhVXdqeTU0YjhDb2picDlqTGRzbXdLYkpBY01pcTh4eXhleDF1aHdZ?=
 =?utf-8?B?RGtxcEZvbWhWS1l4VEFnTW1lbjcrWStFcThjUnpqTTVYSUdaS2dGWThFNHJz?=
 =?utf-8?B?RjVYU3pPT00zSG95VFNsa3UrSnlFZ012TzNnQ0VCaVUwK1lJSWg1Y1R5ZC91?=
 =?utf-8?B?WmxteFJ4b2UzUWtVR0JEZkZJNmRQeTRjSVd4Y2ZEbTZwNXV6VFhtR1BOVkZ2?=
 =?utf-8?B?bnRISGhjQ0tnSGVIdXVvQS9ndlBTTVBYbTZIOWV0bm9GN1NXV2NaZ21CMnhE?=
 =?utf-8?B?QjJ3ZGorRW5JUzVETCsyaWNGMnpYdHlvTWdFdkpER3JTWkwzT1lva3JPQk55?=
 =?utf-8?B?Y09vOUdWZklDUWJGUnNZallZcXVXbFlFTnlERFdzQTNwbmMrNm9MNlkxVUdi?=
 =?utf-8?B?R3JMVjZDY3dlTEg5RkhnUlVKT3R1K0M1ME1nRzB5NW1qTnMrWDRpNGdpckxJ?=
 =?utf-8?B?SytpaEUzRWJtbkNNbnEzaWxiK3NIeTJpV1BlSXpyM1JUQ21ObnVwNUxuMjNJ?=
 =?utf-8?B?L0ttNzh5MWtUK2dnby9QU0hJVDlkN3NXeVhXL3ZlMXpoTm84Zkp1Qi9YUW54?=
 =?utf-8?Q?ckCYu9353v1uFkCyZgU6bdZ0d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6004a8-7efa-42fa-631b-08dd87690c59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:59:00.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+UXpBWRnvJy1PUtQmsWO5Tq4ILzrs5Uqe4coD9D9xmmAKOtBdTQkCLmWW/UqFnGb4vMmno4TWHd/1/I+Z7lTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885
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

--------------SWLtjUQXZTZFTHKIquDIrVKE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The series of 5 patches looks good to me. Just a small suggestion: please combine patches 3, 4, and 5 into a single patch, since they all relate to the usage of |asic_userq_readiness| and only touch three tests.

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2025-04-29 06:36, Sunil Khatri wrote:
> Add UAPI support of userq mask of ip's supporting userqueues on a
> asic.
>
> The changes have been pulled from below kernel commit.
> https://lists.freedesktop.org/archives/amd-gfx/2025-April/122559.html
>
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index 3f4813879..ddcda5d3b 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -1446,6 +1446,9 @@ struct drm_amdgpu_info_device {
>  	__u32 csa_size;
>  	/* context save area base virtual alignment for gfx11 */
>  	__u32 csa_alignment;
> +	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
> +	__u32 userq_ip_mask;
> +	__u32 pad;
>  };
>  
>  struct drm_amdgpu_info_hw_ip {
--------------SWLtjUQXZTZFTHKIquDIrVKE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p data-start="67" data-end="278" class="">The series of 5 patches
      looks good to me. Just a small suggestion: please combine patches
      3, 4, and 5 into a single patch, since they all relate to the
      usage of <code data-start="228" data-end="250">asic_userq_readiness</code>
      and only touch three tests.</p>
    Reviewed-by Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a><br>
    <p><br>
    </p>
    <p></p>
    <div class="moz-cite-prefix">On 2025-04-29 06:36, Sunil Khatri
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250429103653.190107-1-sunil.khatri@amd.com">
      <pre class="moz-quote-pre" wrap="">Add UAPI support of userq mask of ip's supporting userqueues on a
asic.

The changes have been pulled from below kernel commit.
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/amd-gfx/2025-April/122559.html">https://lists.freedesktop.org/archives/amd-gfx/2025-April/122559.html</a>

Cc: Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>
Cc: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 include/drm-uapi/amdgpu_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 3f4813879..ddcda5d3b 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1446,6 +1446,9 @@ struct drm_amdgpu_info_device {
 	__u32 csa_size;
 	/* context save area base virtual alignment for gfx11 */
 	__u32 csa_alignment;
+	/* Userq IP mask (1 &lt;&lt; AMDGPU_HW_IP_*) */
+	__u32 userq_ip_mask;
+	__u32 pad;
 };
 
 struct drm_amdgpu_info_hw_ip {
</pre>
    </blockquote>
  </body>
</html>

--------------SWLtjUQXZTZFTHKIquDIrVKE--
