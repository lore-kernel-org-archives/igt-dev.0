Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC960C2BA18
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 03:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C7010E913;
	Fri, 21 Jun 2024 03:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IemQGMfS";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B0110E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 03:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu92H1yg89j4/z3TBX0v6KEqpp9nPntd3lDt9WrxMenv9JLK6wO51oZGiG71Z5Fh01yHsrVEPu2s6bvgw1D+2yQYixPAz7yOO9D86sbxHiawSuMP8PkgeBNDlZWDU4j/VRi7zyWKi8pVA6JJHFDuxVwlFknSPcncZ4TQTEOArDDUMDxZAGJoYa62PP1q9HJy6RpQlD68UHtn8cTmdd+l+JtdZIqeiI4O2SovYIyGMU92Z1nzSNOwZZPwjNr4oKin+R7saC1yn4Gv91+NrhARGCCfqnOq1OjdssFqWit4Df1D7hxrvMLHK3dRfg32XCzJKek1Bffj1p2wPzTy6ROmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3Anjf0qFMEMinLg8kXSKTrPG8NGlwgUslWEC4+9f3I=;
 b=DH7QipKR6rkO1T6i66GDuPeHRdPcthL0jPgg9AHO1WupCp61HMwA6u+tyCTmGx9mEDh+ViwHKqUKATwWbQJgP1+0LeX5AelrPChToZ/Yd4h4dcr4BcQuKmhEMS5/DhuJBIiqaXzsoh1q+ZTgdSUzRCD6Vc9GE/oEeJ56V4ckGXM10JxYjb7gOp6C8mAeU60cML7v6OYUeo14AvJ8+Do7euqWFUC1cFeUa+3lSanwNeeIZmBmSxlbW4SUxsZCitAshycSgSBmuXa2kGKPdzmHpmLylzSkeVxxWymYKpTOXB7JFqvHq4OC6bNSZ2Lqty7t5pFfL9gYPHdG9r8N5vVDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3Anjf0qFMEMinLg8kXSKTrPG8NGlwgUslWEC4+9f3I=;
 b=IemQGMfSpCCtzVLVkw9o48ujG5bJNn65OFl9/gdQ9Tea8g7ipS1Suz4ZAUlSw2opoKs4EUaGXGGpg9WqROKXaXQpKUXHncMZytuJbqmtmXxCu4iMv1cu7/P1Ly3FI5KfVuuoGUeYnPD5WtXMTM29MN51az3/uiCj9sCMkAJPABM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 03:05:54 +0000
Received: from BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e]) by BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e%4]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 03:05:54 +0000
Message-ID: <62a99f80-5875-4147-893e-3cad66d29e1d@amd.com>
Date: Thu, 20 Jun 2024 23:05:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/amdgpu: add gfx12 to amd_dispatch test
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240621025021.2294000-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240621025021.2294000-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::19) To BL3PR12MB6401.namprd12.prod.outlook.com
 (2603:10b6:208:3b1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6401:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b654820-7053-4c26-01e7-08dc919f10b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEQxakxFaWZvVEpxL0tpRmY1NnFwc3BQWm5zY3pSQ0c1SmdOa2tUVWVjdUV5?=
 =?utf-8?B?YkRMVDg0OGFVcnJpOWp1MW12NGVmSFhtTmZzNUtYV21GUlMxYy9xMytBaTNX?=
 =?utf-8?B?UXcwRjl2QmcrM3dpSVphdEFJejM2TFBWeU9wM1JMN2RBaHZJdUtsQklUN29x?=
 =?utf-8?B?SkFvd0JMckMrYWgrSG15b2RHT1RiWURqRk1tdkZobVc5QUJ6ZGVJOXZTd3hu?=
 =?utf-8?B?bzAzdVFwNCtMRWs0K3BYU3NQbXU1Znl0QUFZNXArL1pDQ205bUJ0UEs3dnk4?=
 =?utf-8?B?dUthNWFRVnhuVktvNjU5TWprYSs0UnlENlpQSmpzTHhCQVVMaDk0QitpZmFY?=
 =?utf-8?B?Rm90b2pGcjVON1VLc3hJUGxQSHBoL2dCT1VWUlJHSlJPNnFUcXg4amlkSlpB?=
 =?utf-8?B?S2JFdG5pdU9MSGF0TTJnM09RRlZXMzhvSFNKR3RQcWZnUnBnaW55SWJqUWdY?=
 =?utf-8?B?UU5wVHR1NXlBTE1ZS1NzTk4vZTVuczQ3TWZZdlFOdDNrR3pZMUNsU25JcG5S?=
 =?utf-8?B?bGpQM2t0N2pjMVlkYXRBMmgzYnVrRU1RV2N1WjJZOUFXKzlzZFJuV0E2L01B?=
 =?utf-8?B?N0M0Vy9XeHc2b3pFeFlDRTU5QUV4b0xJelhMczY1ZTcvUFdta0YrNEw0MlVs?=
 =?utf-8?B?SWZZOXJXN3Vpa3FqZjcwdDQwVjdOL0M1cXRTbGxmL3pHcVc0QjFYbVNaU2sz?=
 =?utf-8?B?NzIySHBWdUpxdE5IQ0k0SnBMTjB3S01yMEgrS3BVQlR1SWdQOGd1YzUxa1lR?=
 =?utf-8?B?SUVCQnRPRXlLQWhWdVhyQnNjUU9UVjcrNGFFcWdlUmV1dGJFWjIyR2dBWnoy?=
 =?utf-8?B?QTU5ZU9vbmxTYjcxak1HV21nVGRxbDgvVklxTWJzWW91NVpwcWpqNmZqSlJ6?=
 =?utf-8?B?dnRqV21tT05IbDVDSVk3dW5rd1RTWVZVUjF1VEluSVpYMXIwUWxpanNid3BE?=
 =?utf-8?B?MllRRTZuaEdOZlN4d1ZZUXJkeHNBa29VVWJobUZxRzNzQkZGTDcxMzNIQkNt?=
 =?utf-8?B?dzh4YU9CRVpSR1FXMzhmL0d6V25qVDJjVHdHUDN1TUF0SnYxWDhGWGVjSlpQ?=
 =?utf-8?B?S3RsZjNscXVUOGpFK045TFBzTlQ4NVhYQUwrTzBaUGRjSnBraWg1UFFUYlg2?=
 =?utf-8?B?b0V6cjdiNWpBSGpqbzNQNDA3RzJjek5VZittRDViS0R1S0ZHZzVoTUQ2VHhr?=
 =?utf-8?B?cXNFV1JIc1NWRUh1MEtJZ2ZhdkZ5cW1QV2JZbWJzb2xIdlJhVXMweHVpOEtE?=
 =?utf-8?B?cis4dkx3ZzM4VTdnV0hpS0RpNjVSRGVEbFJONmxPUGQvWU8zT1pCbXBYUVJB?=
 =?utf-8?B?b2dVMDc1dk9tMUdkZ1IxdW1qNHkrREVyK3BEcHU0UXkwSDQ5Z1Juc3BFYnB1?=
 =?utf-8?B?UHpPRjJFVkNORmVvZ3ZiOSs3b29aUzFZZExWYjl3bHBMNHhTZFUzZDM1OHMy?=
 =?utf-8?B?aGlTQnYxa3pubnJiSzV3d1ZMOHdLVXlwdXUraDJCN2h0SFJLZVRxcGpNNmFM?=
 =?utf-8?B?MmNVdnRseUF1bkZWbGxGa01WVU5nZGNIQUZlSFFjbG8vU09scEJwZTNLSkVs?=
 =?utf-8?B?dWltcDArZXZTNjlVL0psT3JNVDR5bTI5allxQitQeDFmVjZHTmNiYVpDNkxo?=
 =?utf-8?B?Qk9aSVBBb1duMVVpQlI4QjJTaXlxanJ2RHJpRmVSUXpDUzQ4VnZZc1dOMXpC?=
 =?utf-8?B?V2dtS0F5dDdXTURWbkUxcjhpYk5JYU9VZEhRYjZTTkV2Y0V0OUpYeHVuMTBa?=
 =?utf-8?Q?zA/niK+X1bRmXqfz++7R6oi7hbNxGfdeFYwJ/Zc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFocTlsZUY5bVJpb0h2M2h4ekV6Q2RqUGIrZEoyRnNTb3N6aHZPbEh1VFNQ?=
 =?utf-8?B?MHl0L3g0eVlmYTY3WU1zWUlGMXJ5SERzOUkwb3hzaEZpa29YbEE1QnhSRFNS?=
 =?utf-8?B?RDBCeGpOK2NiNXNTUzJqWnhubm1ZSnh0RktMSEU1anFQODVvaGQySU5Xb2RC?=
 =?utf-8?B?ZWVjUHNCQTBBaENxT2daWXplM1d1RENiZEFyVGdkOVF0YzMxYnlIMjRzSGVU?=
 =?utf-8?B?WXpzSUcyNlJxZjFocVpYTHROVkFYNUVjaEgzMGNHT081dXFyNUg1R3p3UndD?=
 =?utf-8?B?b1hONDZHeUQ3Q0p5SkhRVTEzUHMrT2g0K1VGeEdlYm5kRG1wUkdyVXMrck9n?=
 =?utf-8?B?SFRMN1UzM1VsUG8rcldzR0Y5Wk1rYnoyTjU5dFFubkV4TWRTWEFvSFhRTU50?=
 =?utf-8?B?U0RRSGJyWGoxdSt3Uld5d3VSTUc2R3dyaGlkdkVxeG9jZWVSUk9zK2JGMkg4?=
 =?utf-8?B?Sml4UnBqRlFaNnQ1VlhkSXhnMWVudGFaQ3Q4MjE1enQ1dTNtYmVNNm0rZGV6?=
 =?utf-8?B?QlRqcTVjSDh2Mkcyd1JjWm5UeEJKVk5Wb005SmtCWWIwQkU5YTNIaFB0SVNk?=
 =?utf-8?B?V1hTNjEwNlpMRHhRcTVPVnpBaHJZcXEzcUhrbFRNN3k0L0szNnB6NEYvR2Vi?=
 =?utf-8?B?TUlSYkx0QUN6OXlVZ01xenBiS2xCMlk3YStFWGc1eWc0Y1hnUHdyRC9EVXly?=
 =?utf-8?B?QUFmSkR0c0sydnIxNThjNG41Wm8xYlpFMTYyRkRBdWlKU0hxa0lKT3g5eWMv?=
 =?utf-8?B?UitRcFhxQVVWZEM0VmFIT0JXU3paTmdZaVcxYXQvMVM0MXFDWkN0NzBSc3hq?=
 =?utf-8?B?cFQwM2d1L0o2RVlKSW1xSDE4WVR4YTlmeTVGT0RKU0lpMUNnTGRUdjhNemNW?=
 =?utf-8?B?UHRPdXlpN1AvSHNpUnp3YlY3MEJ2Yzg4NTY3bEI4L3NpS29UOU0xZ1M1RmUr?=
 =?utf-8?B?ZWZKbEJYVFBFL0xhdjFvTXZhN05KZkViMEtkajg3bitZT0c3Zkk4ZE5iTGRx?=
 =?utf-8?B?QTUyUGRVS0FOWEZlVENWU29rbnQ5WHNxdVIzVXhFcHpPbVhKeDhOL1MwUWh3?=
 =?utf-8?B?RUljUGRKMWo0SjQ5ejVMcnRXQkFvaWhqZStGUVZCRCtkcHlRVklEemZjMDdx?=
 =?utf-8?B?L1NYYUZ5NjFTcDQ5emw1YWx5NjE2VHg0TEpzQ1lueGtVcUtwblAwSGtVWkh6?=
 =?utf-8?B?QjZXVDZGdDB6MTB4Z0pZeUU3Nm5nTVJjTXZOOTlxVXNsSWEzVkZQZUFEUXVl?=
 =?utf-8?B?MUpNRTNhenFMTHpXRk5KS244NXNLbjBxTUN2cEIzZzR3VzhkRGw1Qi9ybVRH?=
 =?utf-8?B?NU9ZM2pXOFhLYmlWOUlrYk1GSzZEYWx2OGI4a1BMbnk3WDVKWlJqZnpWUUR6?=
 =?utf-8?B?ZjJGd0U4TFhNQmY1U1pEeFRhVlJQd3UwOWRLeThST1ZVb3ZkdTZyZkRXdWhP?=
 =?utf-8?B?RmViWXZ0RHJzZVQzTklycVlRZDVyMGh0L3dLTE12N0dMbmRSOVN3RGNLZWt1?=
 =?utf-8?B?TWJxSndMTkxDN25aV1ZVa3o0ak9rVVFoOXlmbHZIYmswemM2cFhlMnhrMmlj?=
 =?utf-8?B?UnpUNkl3WWF2eHoyazFseHF5aVhUQXJ1Vk9KTW9ndFJDWmE3Mmx4V0NJRDly?=
 =?utf-8?B?K0xOUW4vOFNOQ0VvckRtQ0pjUHNmQkFCVXJjNHRRRWN0dU5xZVkvOEFEaUVu?=
 =?utf-8?B?VzNoL2dLL0lTMk5YVVZrdFAzbTVNcXJuL0pjUlZ3aUJ2c294bmlIVU9zNGJF?=
 =?utf-8?B?TCtFRTk4cVJjRGp3NDNqV05ZWm9ZUEFGSkVKZnUvaHlSNDNxWmQ2dFhkYkVP?=
 =?utf-8?B?Z1QrN3BXUXV1b3NSVnBsWEhQOUZOeFROait3Qzd6ZFBvVWZxNEpVSFdNb1Vk?=
 =?utf-8?B?ZVRvd3FxRE1takhPSFVxZFd3YzBrY3krcUNQNzdMTzJrVnJkaGVDcEgzam9Q?=
 =?utf-8?B?emYrZ0dnaDVvU09VcFI2Vk9OUURYTkJVUmtKZjdjN1ZpZUJSS0gxbnJnYi93?=
 =?utf-8?B?UUdHNDE1MmVwdktUZ2VPT201cTBxbkJKVzc2TUdJMmVQV1M4cExvcGI0aU9t?=
 =?utf-8?B?YkFRdmt0Q3dQY0ladVdtaTlPdUxBKzJGZWtaTlg4ZnFKdThOUm9UY3JkV2NU?=
 =?utf-8?Q?r/RKC8eJgDWnkm4rA2lJsr+FS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b654820-7053-4c26-01e7-08dc919f10b3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 03:05:54.6507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4nEtc6RXBfkjtFs/nUQmiB5K1BQznnVGC0UGfKVON6v2LJ2wbGGRNYSmIBVHGs6NLmrkrgSF0akAHLMkNTx6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
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

Looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-06-20 22:50, Jesse Zhang wrote:
> Enable gfx12 amd_dispatch test
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c         | 16 ++++++++--
>  lib/amdgpu/amd_dispatch_helpers.c |  2 +-
>  lib/amdgpu/amd_shaders.c          | 52 +++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 040381a11..b739ce64d 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -87,6 +87,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  		base_cmd->emit(base_cmd, 0x1104bfac);
>  	else if (version == 11)
>  		base_cmd->emit(base_cmd, 0x1003dfac);
> +	else if (version == 12)
> +		base_cmd->emit(base_cmd, 0x1203dfac);
>  
>  	/* Sets a range of pixel shader constants */
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> @@ -239,6 +241,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  		base_cmd->emit(base_cmd, 0x1104bfac);
>  	else if (version == 11)
>  		base_cmd->emit(base_cmd, 0x1003dfac);
> +	else if (version == 12)
> +		base_cmd->emit(base_cmd, 0x1203dfac);
>  
>  	/* Writes the UAV constant data to the SGPRs. */
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> @@ -252,6 +256,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  		base_cmd->emit(base_cmd, 0x1104bfac);
>  	else if (version == 11)
>  		base_cmd->emit(base_cmd, 0x1003dfac);
> +	else if (version == 12)
> +		base_cmd->emit(base_cmd, 0x1203dfac);
>  
>  	/* clear mmCOMPUTE_RESOURCE_LIMITS */
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> @@ -410,6 +416,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  		base_cmd->emit(base_cmd, 0x1104bfac);
>  	else if (version == 11)
>  		base_cmd->emit(base_cmd, 0x1003dfac);
> +	else if (version == 12)
> +		base_cmd->emit(base_cmd, 0x1203dfac);
>  
>  
>  	/* Writes the UAV constant data to the SGPRs. */
> @@ -422,6 +430,10 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  		base_cmd->emit(base_cmd, 0x74fac);
>  	else if (version == 10)
>  		base_cmd->emit(base_cmd, 0x1104bfac);
> +	else if (version == 11)
> +		base_cmd->emit(base_cmd, 0x1003dfac);
> +	else if (version == 12)
> +		base_cmd->emit(base_cmd, 0x1203dfac);
>  
>  
>  	/* clear mmCOMPUTE_RESOURCE_LIMITS */
> @@ -509,7 +521,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
>  	version = info.hw_ip_version_major;
> -	if (version != 9 && version != 10 && version != 11) {
> +	if (version != 9 && version != 10 && version != 11 && version != 12) {
>  		igt_info("SKIP ... unsupported gfx version %d\n", version);
>  		return;
>  	}
> @@ -536,7 +548,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  		igt_info("SKIP ... as there's no graphics ring\n");
>  
>  	version = info.hw_ip_version_major;
> -	if (version != 9 && version != 10 && version != 11) {
> +	if (version != 9 && version != 10 && version != 11 && version != 12) {
>  		igt_info("SKIP ... unsupported gfx version %d\n", version);
>  		return;
>  	}
> diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
> index 11ce8284a..1c7413922 100644
> --- a/lib/amdgpu/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/amd_dispatch_helpers.c
> @@ -138,7 +138,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
>  	base->emit(base, shader_addr >> 8);
>  	base->emit(base, shader_addr >> 40);
>  	/* write sh regs */
> -	if (version == 11) {
> +	if ((version == 11) || (version == 12)) {
>  		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
>  			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
>  			/* - Gfx11ShRegBase */
> diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
> index cbea12827..fad6dbced 100644
> --- a/lib/amdgpu/amd_shaders.c
> +++ b/lib/amdgpu/amd_shaders.c
> @@ -314,6 +314,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
>  		0xBF9F0000, 0xBF9F0000, 0xBF9F0000
>  	};
>  
> +	static const uint32_t bufferclear_cs_shader_gfx12[] =
> +	{
> +		0xB0802009, 0xBF930006, 0x360000FF, 0x000003FF,
> +		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
> +		0xD6460004, 0x04010C75, 0x7E000204, 0xC401C07C,
> +		0x80000000, 0x00000004, 0xBFB60003, 0xBFB00000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
> +	};
>  	/**
>  	 * shader main
>  	 * asic(GFX11)
> @@ -352,6 +375,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
>  		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
>  		0xBF9F0000, 0xBF9F0000
>  	};
> +	static const uint32_t buffercopy_cs_shader_gfx12[] =
> +	{
> +		0xB0802009, 0xBF930011, 0x360000FF, 0x000003FF,
> +		0xBF870001, 0xD6460002, 0x04010C75, 0xC400C07C,
> +		0x80000003, 0x00000002, 0xBFC00000, 0xC401C07C,
> +		0x80000803, 0x00000002, 0xBFB60003, 0xBFB00000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
> +		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
> +	};
>  
>  	uint32_t shader_size;
>  	const uint32_t *shader;
> @@ -367,6 +413,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
>  			} else if (version == 11) {
>  				shader = bufferclear_cs_shader_gfx11;
>  				shader_size = sizeof(bufferclear_cs_shader_gfx11);
> +			} else if (version == 12) {
> +				shader = bufferclear_cs_shader_gfx12;
> +				shader_size = sizeof(bufferclear_cs_shader_gfx12);
>  			}
>  			break;
>  		case CS_BUFFERCOPY:
> @@ -379,6 +428,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
>  			} else if (version == 11) {
>  				shader = buffercopy_cs_shader_gfx11;
>  				shader_size = sizeof(buffercopy_cs_shader_gfx11);
> +			} else if (version == 12) {
> +				shader = buffercopy_cs_shader_gfx12;
> +				shader_size = sizeof(buffercopy_cs_shader_gfx12);
>  			}
>  			break;
>  		case CS_HANG:
