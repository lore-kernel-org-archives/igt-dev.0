Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F235CC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 19:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3BA10E07A;
	Thu,  9 Jul 2026 19:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oqn+cmLr";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23F710E07A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 19:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPTbFL8jLObX8Inhe/4lFSESiHvcu+BkgVmLQGBLxRy/zejq3ypmXveAVXiMjSufwuXG2lmDjfKrp2RVS3ggQqKPeZf1OoNRvMys3AILLZ+llSEwLNul6V/Qqxy0MwrR6CO1o5B4dkGiUGyoGTInTyWGkbVWchS6wVfxLnatumIRUtRB3utWacRwjPW96sU2VlUZz0x1NZPrloge6rU/sG2Tx6rHgA361xlYkn1Sg9LRzL/bK858YJwcUuaCSydrOlgx0rhRWNv60XDUX5qCLh9ZUdAHrJxtFmLwDRxlcTBAIAvIumQ6WBlEEjjyxPtinQIA78Ta7fiJm9VyrzGqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP9wx2sMHbUEQJKUzumSylU/qzBMXRTeCNL/IDTiS5c=;
 b=teAVI4M+1kUTp8+PEKfcch2AxgOnYHn3hYGvqh9B1DrDYMSxQ0cpqIbmjXkMt319/O+Q3ziiqZV4enznf5H8RIGz7QdUMU/YEuKkQZ+QQ3AdKK5k0IsvXd1xa9Q0gQUZPAStswetBfCzxJnjC54EdbwlspFkBpmKTfAGnZ8QFMuqMuIfBo67LoA8jD/BAQsWSGmpJU0asM68niBSu9pqJbyM4TBLaP433RXlZ9gewIAgmqVSaPxYraLvGLfElVkcemKqyYIEftbmqSrX/371mrXV61m72jFMmTQD1NYBDgHk0KeTVrWIhbYpAyszPT4XgX/bQksKOjKrOO0Esn/Ixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP9wx2sMHbUEQJKUzumSylU/qzBMXRTeCNL/IDTiS5c=;
 b=Oqn+cmLrpM7OLoAlnAX5bN06KMgi9lBLrHP+D7am/i3slm4zuYzQ5agbNSDW3x/o2g9spOjBuYMAbAovES9CWNigqvm2KJTyxCdg1Qy5TOkfdXW7i+pB/U2RM+6cBQWCzbvWSH6QoOwOI6jCknspkXYlc1wtEvJTY6IQ0XsNawI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 19:10:03 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 19:10:03 +0000
Message-ID: <5b5aca68-27e4-4c45-9b6d-f7417a5f83f1@amd.com>
Date: Thu, 9 Jul 2026 15:09:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_queue_reset: Fix random hang
 during queue reset stress
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260709084324.1913977-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260709084324.1913977-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0223.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::15) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 668ed1f3-f600-4c7b-10a6-08deddedaddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: SskyDOzpscK38635pRVdzmPWfbhEBVXQU1q7vVKEcODdq0VopiFPqpSkNHNIQHq9OfpkLnDzFAQYPT/QCgY44Us9dRZsR0J28LYU+deiG9il6BUsydke9sdfZ0OXU/2Ms0zBEmv8DTC6dhDIjLgXJYS93u3jmDWOnF4t077lG8Giw9Pf1oeoXeooMuC+YaZdzLQXVOgEaonJfMb2cOLXoZHxintURyujCJEGRHch8AWy98A9/wIANYoNIWT+/8OW6cTCV5ewqb8ybZ5bVkq/c10FMzRCq4BtkaihFwvK+2avfLxtIcFMnlg0Lsph7s/VromPsCWVTkscbHucb8pc9hDSvgIm6T+f1KnVsCfQ6JtW4TDCVMe2ESvu/dBTOYQmtsawwa9VpqBEMWuxU/DPAFW4TF0+IzG4L0eWWIc33hLGJlqZc6GfLUJMS1YZ6m5UeOcE4G1YsmRKEE/X66P/lM/5aAnejYbDVK5Xbu+upGhdt0yJvj/M3OcElx0BEKCsunf6aVjsPyaWLpdYLhKwol2moCMrnGpCJFn1ZXIZ4ZcB3S92V+Q/Q9A81wUbP5V1y//m6Tdw6wqEkMQs5ZiHNqlHOkB5l6LwhucRzRELHrKTFPKlkMcS9dN6+oI3pBb0FuH/i1b/MGNYeoQco4puGSR+8RALg068wnHJBe3GMqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXYrVnk5emc3alNLM1Q2RXY4WDB6Nk5DSnhlNmhuN2Q5VW9uUUhGQ3N3NTlI?=
 =?utf-8?B?anV0R0pXRHdSNXBLYWtTZWFrNHFkck90QjExTW13ekUzZDQ3Q2srWlNMcGVp?=
 =?utf-8?B?bjBvVklIc0hZV3p1RUEwMXRVVGVKZ2d5K2YyTi9RRnJKdWxJM05QL0JmdS9s?=
 =?utf-8?B?NG9wK0FsYVArR3dyYTN5OVlsYlVGdCtDR25lWjhIQ3RpRVA0TTh2RDQyWko1?=
 =?utf-8?B?Tjc2ajNGVWpXUUE2L3lFRlhOdkplT3E0STJRZU9oei9IRVVDL2x1OUZrRVJZ?=
 =?utf-8?B?MzVmWUJnWDkvZmg5N0x6WThrRzQxbWhuWGZGSS9MK21NOVFGTlBNU0VoS2dS?=
 =?utf-8?B?ZzlDeGR2NFM5K0hBbFZzR0VLTDV0azg3TmNGT3htMTVSOWtVSHVIOXpGaEx1?=
 =?utf-8?B?Wk9ybzVXZzlkMDVNbzBTVHZIRzF6aHhhYjNMZkdoRUZadmV4VkdIbUtpbk11?=
 =?utf-8?B?RGVMT1ltZlZORkhkMXRDNUc2eUxzMHB4bjkwWlZGQWhMTDhiSFN4MVcyQ2VX?=
 =?utf-8?B?TFRrblp3dzkyWkNuSWVkdWlvbFFyL0ozSm5Nczd0ZUI4T29YaFpBMS9aU1FJ?=
 =?utf-8?B?b1ZXSlp5K3Y2aFZRSDFSU3c0WThsTk1EWnN5aUpxUlNQZzdERk5WbDlwK2ht?=
 =?utf-8?B?ZmVXbVl0cVJKVHRUcnRVQkh4QksxQjU1RXpRZDgvNVRJYkFGTExFK1VFSlVi?=
 =?utf-8?B?U3ZLdDdBSThKbDFBWi85TC8rYmZ2VkgzQ3RZeUl0bTM5UGFTTzZaUytCSUFB?=
 =?utf-8?B?UGJMQVpISWZlYkhIU2tESjQvVkJ4L2htNW1MYmpHc3pYYjZEbi9PbEVxUFFY?=
 =?utf-8?B?OGRVTFNGU0ZWc0VoanJIOHpDTk02NFEwS2lKVGlzYVJURHJSMUlKQ0ZXdUZU?=
 =?utf-8?B?dHpaQ3dMZEx3N3B5M1hYNmJQaXVoV0d0Zm5rZm1NbzV2VXY2bkh2VW1RWW8r?=
 =?utf-8?B?M3NuUk94VG0yZlNEQnI1ckhJMDNmaWVKWmNNTVcvTWRPdnQ1UDl4dk0zUFdU?=
 =?utf-8?B?MHgwbUo2ZXR6OE1oMUhwaFEzSHJHRVRqN2s3ZlpGS2VTVmhhc3VIeXNDSHZa?=
 =?utf-8?B?VzdMaWdrZXkrdEMxODh2OExHei9vQ0NrL2FiMU5BN045SmRxME9YVG4wbU5k?=
 =?utf-8?B?WHNQUVVEb0lUbUYrQUxRZmoxYjlxRFB1bU1NcnJTclhtdXo0Qm9kUjhqSUtJ?=
 =?utf-8?B?a0ttWmNnM2JwY0lydGphVUZwdmpoR3hpOFlUY1J0KzRJRWNaSGo2Yk12VlZK?=
 =?utf-8?B?dlhRdnRBenJoaFYxWWVJMGM1YVRXcGtENUpzZXNUQnpYR01wYlJkazc1SW1w?=
 =?utf-8?B?Y010a1d4MnBaQTFYMS9nQVBaYm51ZC9XakdQSTdLVTdzdkRwZFNKQlpQTVNC?=
 =?utf-8?B?RkZPbGxHaU5JWUY3dksrdEVaZHcweThVZG1kVkoxUkR0L3E4b1JJaVJ1ZFA5?=
 =?utf-8?B?V3JjNTFKay9zT1E4RmFTWlZ6eXg2dzFSdUpaTmpFZEl4NEpuZTBaeDlVV213?=
 =?utf-8?B?NVFCUG14WWUxSmVwQnk4NEEwUzI1WUVQOEFmTXg0WkhTWlgvZTBlSkxwTGk5?=
 =?utf-8?B?SkxqbU5UR0RDYkJ0WVpRSHlsaDA2R2tNU29qY1RuQmZFQ085WmdBNjlHTlM4?=
 =?utf-8?B?eDdudXpCUlh4bitoL2l1OXZkVVJlekdFYXU0aXRUbDRQSmhhelRlLzNraUZn?=
 =?utf-8?B?TTluTDZqdUhuYjFUYnI2UitQbTZYaW5nck13b1VJWU4wSzBXaVZMQkxHejZL?=
 =?utf-8?B?cDMvTEZUOTdyZ29LVGFkMHZqNW1NaXFpNlVCN0VjMnlCc1pkVEJUdkZPRlNE?=
 =?utf-8?B?Y1BNaUVES0U2LzBGRXQ2N1pqQVpwRnpVUENXTkVBcDZxTEZUOUNvVnhoNFdj?=
 =?utf-8?B?NTNFeEljM1Y2NmkrK1dJWWVNaUpxdEFpS1NQVjVqWUFJUXJkNjNVb0ZzSngr?=
 =?utf-8?B?d3hWbWJVSVlYd3A0MnVEeG9pM3MyNHhKN2pvTUU0V0VSc3lsVGpmWEN5cDlo?=
 =?utf-8?B?LzZ3U3k1VjZHRC94TXpJYWo2K1pWMUgycnhzelUydEhpVXA0MTJBSjNMdDBH?=
 =?utf-8?B?OVRqNE9RU0wvU1R1QkIvazRXMUVvLzk3UEpiRHlMVVpvZ0tWYisxQ1ltVlVX?=
 =?utf-8?B?MWE1SGxSUjFwSWZWK2JpYXhzUk03REtsb2N5TmJHQ1QxVmd2RXlqME9reTla?=
 =?utf-8?B?aUYvOUYzTGkyeU96bXdlNitROUZCWGFHSkt0NXlhMkRLa3MwbUF2QU42RVYz?=
 =?utf-8?B?TnJROHZXRmVDNkNPN244NlhRMmZOUjlCbXFUQ0t2WnpadFBWL1dudG1pa1FM?=
 =?utf-8?B?bmI5Qk5sVlQ5QmZWUmVhRmc1cXY2K3BYcllyQmd4Vy8yS0hsbGVNQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668ed1f3-f600-4c7b-10a6-08deddedaddd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 19:10:02.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sftBHzaMH6URfzAhemFAtuLfXppbGvnFw92CDxM2qk9v/bC6nbIE0Og/eC6685aW0veX1u3MCB9wsLVmdh1Kkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
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

LGTM

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-07-09 04:43, Jesse Zhang wrote:
> A concurrent "good" background job can be collateral-cancelled by the queue
> reset and return an error the good-job path did not tolerate, tripping
> igt_assert_eq() and aborting the background process. Its death breaks the
> fixed NUM_CHILD_PROCESSES barrier, so the survivors block forever in
> sem_wait().
>
> Tolerate every reset-induced error on good jobs: unify the two asymmetric
> allow-lists in amdgpu_test_exec_cs_helper() and add -EHWPOISON in
> run_background(), so the process never aborts and the barrier cannot deadlock.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 14 ++++++++++----
>  tests/amdgpu/amd_queue_reset.c      | 10 +++++++++-
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index a0777e5ae..0334c2ded 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -119,8 +119,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  		if (expect_failure)
>  			igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
>  		else {
> -			/* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
> -			if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON)
> +			/* a good job may be collateral-cancelled by a concurrent
> +			 * queue reset; tolerate every reset-induced error
> +			 */
> +			if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON &&
> +			    r != -ETIME)
>  				igt_assert_eq(r, 0);
>  		}
>  
> @@ -142,8 +145,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d\n"
>  				 "expired %d PID %d\n", r, expired, getpid());
>  		} else {
> -			/* we allow ECANCELED or ENODATA for good jobs temporally */
> -			if (r != -ECANCELED && r != -ENODATA && r != -ETIME)
> +			/* a good job may be collateral-cancelled by a concurrent
> +			 * queue reset; tolerate every reset-induced error
> +			 */
> +			if (r != -ECANCELED && r != -ENODATA && r != -ETIME &&
> +			    r != -EHWPOISON)
>  				igt_assert_eq(r, 0);
>  		}
>  	}
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 546845d29..ebd7c8682 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -840,7 +840,15 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
>  				//if entire gpu reset then stop back ground jobs
>  				break;
>  			}
> -			if (r != -ECANCELED && r != -ETIME && r != -ENODATA)
> +			/*
> +			 * A "good" background job can be collateral-cancelled by
> +			 * the concurrent queue reset triggered by the bad job.
> +			 * Tolerate every reset-induced error so the helper never
> +			 * aborts this process - its death would break the
> +			 * NUM_CHILD_PROCESSES barrier and hang the whole test.
> +			 */
> +			if (r != -ECANCELED && r != -ETIME && r != -ENODATA &&
> +			    r != -EHWPOISON)
>  				igt_assert_eq(r, 0);
>  			//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
>  			counter++;
