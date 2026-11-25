Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4422606A323
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vkNFMhrK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7238C10E8D1;
	Wed, 25 Nov 2026 13:17:06 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013059.outbound.protection.outlook.com
 [40.107.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817810E8FF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 13:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avtGggjK6ugw0Tqjtb3li3AdUWI/hUry5gPXAWTxhD5HLFs5TdL2DhonNfzVTcX6xuhydCRUVrRirWc5nZ2/8njWiyxzM6bFLTBT5hpiVmAzcQ8xEzjucq8l5opfkhm3jyYPKIjO8nlXGgzjzKq80AAPzVrD2URRmveCvYUNEMERlJVmhoDNGiUagejpJlPhCZsWfc/KyVR8A/3hLulWd9YB6KKFDghzrQHOVvA5BruhWH3LNN6meOYmyZfXqw7fMm9ZvM20OvY60MgV6G4qlBN9nHY7nxBrc76gLI8pnLszpuyBEExg8I6RqgbfUtn2Zuq8ST4lVTK0bxYfAhxX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81CwZfOOx+TvjYOOExt3zXkpDVu2VGRbh5ihCO3Rbl8=;
 b=CEcGhlVH8v2UuJovZCdtx+XlTq7hemjlCtzB87e3MLnvEOihQo8g1Vm+UquHvbeu7iFgD3rh7UHPRBmNiIuPPmclUT3d5UClyhWeU9IE7ViBv0SKOEpaqes9WsOuvyO6QYK89eLCrAB9Tu9L6YAt2CxlqRgY2rhINffw5ZlZ4Qk/nIzvHpZxwLoYF15oS70GkBLCclHBHB0Xl5oxl80DIFyuXBA4cWJG/ymASdvxhsm+qS+jX0Qfrx8ghXxqvOe/2I3TP7IZZOYAkFdv13CxqWPxZYMO/r8HzSejek/hoTDkiTH+3h2TcbRpHB7VURAP6zJn2XpfchZLVbpqGgUwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81CwZfOOx+TvjYOOExt3zXkpDVu2VGRbh5ihCO3Rbl8=;
 b=vkNFMhrKkIB1m6h9ipj4jaXSx64SyYpyxn3WDTMeZMZUEDlA4czMbE5lsi2DSSAaiPZ5MYndReNomU7eDocWEhVqFU6YKApaAtaaNR7mj2VQ3lENphTpCJ3P1SJkn0Pvtd4MfdULs3UyF3PAg94FJwWaThxKCdIniSUgvElFoWg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 13:15:49 +0000
Received: from IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::dbd3:cc22:a850:dc1e]) by IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::dbd3:cc22:a850:dc1e%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 13:15:44 +0000
Message-ID: <99ed69cc-66fe-4466-a345-75afc38ed83c@amd.com>
Date: Wed, 25 Nov 2026 18:45:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 12/12] tests/amdgpu: skip the SLTH GFX kernel
 queue tests without a GFX ring
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, pierre-eric.pelloux-prayer@amd.com,
 timur.kristof@gmail.com
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
 <20261124082819.2089694-12-Jesse.Zhang@amd.com>
Content-Language: en-US
From: SRINIVASAN SHANMUGAM <srinivasan.shanmugam@amd.com>
In-Reply-To: <20261124082819.2089694-12-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To IA0PR12MB8208.namprd12.prod.outlook.com
 (2603:10b6:208:409::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8208:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: ac00d770-3af1-4b28-5458-08df4af63677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|11063799006|261021123027099003|261021121427099003|261026140227099003|261022113327099003|261022105027099003|261026121527099003|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Z0vpDhnt6AgKvuhkkAVZ99sR0w442JWmw4ipkyUrF/bZB83XrUDGwFRlSHbVgyOzfTEtnL0Cu9IloUqE+qsDFn7ehNejl5FXIJqoIN5lq/BGL9moEB3Pg2WJemOQHRMQSQghC+aAYL6+5qM4kGN9Qm7YZi0zwaaR6Phrsnij9mV85ZjnxeVslBr0aYqknJg2+OW9QJRS64tZ1wpxTEGBOMyHQ15pWPhZgF59vFcW1CtVBDRBU5K+HrjHshhAfGLjFX+982OSQyd3Q38x36P4JX3ov0pcjBv164Mz3dIjmmGABo15AX9xE5uK6xEOUs+5nkRIzwsDWw7CJVNWRSywoCDHmCyjHJ5sGPg8ZfixdJvwkrs9hevg6434rSV7zGhr0OTGV2OH8FtwUn+9pljnJCNhK4NJwxhkIapthvakRSzXOOxKyw+ejMegNoOuopcThx7V8YIUtUsAs6HjxcooxbxQ5VGv7Z7UUlQ7mU5UGO6/PxvhpnnweqB9X4oOSfsjk+jm5kIDpwiDfyNX7Xu0qtAIbPYHVs3+g+IgB1wCWzRVXzfiYT19y7S52QaOetVdzkuDoHof6lUmA5zi/XqOakpm7kLCzRQScUGeqqXI/pdoik7MvWc4SCCOMfxyVA54fw8Trrzual2Rxevf4hN/jkXaq90Nrydl0orjxQFPF8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8208.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(261021121427099003)(261026140227099003)(261022113327099003)(261022105027099003)(261026121527099003)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWkxVlFBaUxHZi9QRjl3Rjd4OFpKOWVoRDQ2Q2Y1ano0amV1bm9wcU1DTVFy?=
 =?utf-8?B?Y09Jd2E4b21sZkh0Kzc4V3ZqV1FSMkpzcmZnWlRQYXpQbkNic0ZLdjRybGRk?=
 =?utf-8?B?dk1oTlo3dEd3R2EzTGFLbmU2RTRBcWc2RVFjUVpnMXlVVTdrdDdmb0EwZGx1?=
 =?utf-8?B?enZSV1FWUGN5L2crSXVBL3RyLytNOGczaE0wUE5iVGc1bVNwUldqWWx6eGtM?=
 =?utf-8?B?dFluNHlRUUtuOHR4WVpvcjVLalRPT0pvYXZRbGV2cVZYTTlXQStIWWtNbFN5?=
 =?utf-8?B?QVdXK05WaDM2Zk8xampkNXJ4UE1qOXZ2NnJPcXZma21GYXF6WVBJTnRNSnBS?=
 =?utf-8?B?OGMybDVCSDlMUXZvN1dBdHdwcjRvVlJJMGVwQVdlUlJ4eHo3MTFjNDBueFVO?=
 =?utf-8?B?c09lbmU4RUxsdTFVZnA4L1ErM2kzMWpSUGl2V1ZidElGNGFvMzBHUUlkT1hk?=
 =?utf-8?B?UEpFeFQ2WG44RWc5dDAxM0pMSGFHU1hTWjJqRi9PazNGVVVYOURmV1dJWkp0?=
 =?utf-8?B?dm9TeksydTduWkNHSjQ5emxBK0xmREJnTWpGZjZCelIwK2ZoZkltYmVWdWZE?=
 =?utf-8?B?N202QzZPSFhuWGxzTDFocFV0WVpUaFFzN0gvbk5TOWNMV1V2TUxsVDY0c1J4?=
 =?utf-8?B?R2I0bUZuVVlDMmdGRkJnMGJHalFlcEJlRzhXcmF3Mk4yc0RHTms3MmFJYjh6?=
 =?utf-8?B?M1RUNWdmNllPNzRPT3hCRlhzSmp2cXIzU2pQTXZkaWtzNzZuWlFCVGVMR3lB?=
 =?utf-8?B?bHYvZk5OTndDcUVVSlNyWk9WdEt2WjBOb0lzUFpZdlBRWXc5RkhWL0JMZG1C?=
 =?utf-8?B?aURXbG5VTE1NaVhBR0tSbGJSWi85SFF5UGhleDNKYTFGQzNaS3ZCM0wvUFk5?=
 =?utf-8?B?ZmhzZkxKQlBhOUZOOWJlVWVLTUwrMFQvalZLaGhEY012OVowaGFvblhVREVs?=
 =?utf-8?B?T2FNMkhhQVQrcjRwSUVMMVVhSGhabnUrL3lsNHBtT1RxdFpNZ1lPc3dWT1pJ?=
 =?utf-8?B?R1ZsS3I5S0toODc4Z1dsTXE5Rm9XbnQ2VWNlYkx4aEZNZDRMbnluSDB5M3Vk?=
 =?utf-8?B?UjNXbmsrK1hNNnFRRnEwTTNidE1LNlU4N3ZGUWYwMlZoNVVXbHhBbVc5M3hI?=
 =?utf-8?B?OGRSWklFVTVRa2NGeUxvQnowbERZdmVPZXU1bmJXWmh6YU1XTXRubVFBQnNB?=
 =?utf-8?B?MEZsdzBYd3IyRmtqNHZVOTcxdllNQk5ZNG5WZzNCNnU0N1RXNjQ2d0VQajlt?=
 =?utf-8?B?aWJlUi9KWFlBcWtZUGo1Tkl1ZEt3dWNKeEQraEhhdklTeWw2Q2V4MGxvWTZS?=
 =?utf-8?B?MDhFQVB4QUNUeG5qQWpkbldVUSttVTI2aVBkWnhEVzlNNkN0bTROaWUrSnpT?=
 =?utf-8?B?SGtjSHRCeG9qRmRrUmN4WTk5S0xmZEZOV2RmYkkxdkJVQVl0aEhKWnJ3RnNM?=
 =?utf-8?B?aG16TDNUMW84dzhQZzVhNUJTUEViNktIaElhM0lUNEc1aUNQTnpFdXd6Yk9C?=
 =?utf-8?B?YlVwOG5TUHBsUEhBcVAraGFXVTdBeHFYSXIrR05tdlM3MkhIbGxOL1NmK1Zv?=
 =?utf-8?B?OC83K1FpUnhsQjNCWll3WldCeDV2TVo5Y0lmQmVxK0FybHd0R3ZTWkZKQnNl?=
 =?utf-8?B?RVVYa3NueEpHcGR3S0NOWDQwU2VRUjdyWnJZZktzUzV6Ny9aOHdHdXZua3ZO?=
 =?utf-8?B?QVAvZVRLMUJTN3VyTUJKcCtBSUJSSGlad05JbFlncFRiVkFNQVJxc1pPTVdN?=
 =?utf-8?B?VFZpZmdlNEhiNk95eHRyOVBmWGtLSWozS2R1eDVEZ09IdWlTbnM1UFJDSHAr?=
 =?utf-8?B?S25qZ3llTkxFQzY3Q29UdmhEU3FwMENrUWx3SisxOSszUGpGNDZDTlhLVzhF?=
 =?utf-8?B?b2hWZDc5a01xZG5leDB3RTZwbDVISXBycGM1ZDlaaHRheHV1OGZ1VmxKMVVV?=
 =?utf-8?B?SGt6YjdUV2VJdnFONjIweEZja2VUZGdONlhBaTVUWWU1M2hKT2ZxMjBsTTZV?=
 =?utf-8?B?b2dGMjY3MXFIcTlEMXAzZksrN0VMVTV0QlhIUjlZR3VlRGpDejNETDlhVDV1?=
 =?utf-8?B?VW1DVGxvV2ZVN3ptcEJuczFWUW0xczM4ZzJDWTZZQnhRREpocnJnNXNyT1Ji?=
 =?utf-8?B?WHRqUTJ2dkVJVXpCVFlqMzMrZnpJR0lkZmdMOVdMT2pLQXY1YTAwMGNiTkc3?=
 =?utf-8?B?VGdlNUQ4ZFJMWGVBSGlzVjFtbzVjYk9HcUgxL1F1Q2kzNWtXcVRzTEwyRi83?=
 =?utf-8?B?Z0tud2NqZURPRzJYQWpmYmpYRXlyM2VhdytPWFF4ZUpBMHBHUlYrRXluK1E0?=
 =?utf-8?B?U0lwMGpBZ2pnK3YvNVNza1NCSklBMzlzd1NsWW9Wd1JRb1pGemdJZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac00d770-3af1-4b28-5458-08df4af63677
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:15:44.7894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMAvlwpwZaYaZMVsxL43GCBqJaiO1Ed5rO09vVBC4BU5Zv1maaBy7FqqhxWO1eEadeSaLNCA8IAo/DNlZKKk1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057
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


On 11/24/2026 1:57 PM, Jesse Zhang wrote:
> Compute only GPUs like MI100 have no GFX ring, so the submission of
> slth-gfx-kq-vgpr-proof fails there. Skip it when the GFX IP reports no
> available ring.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>   tests/amdgpu/amd_slth.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
> index 4e4d72855..68cd02cbe 100644
> --- a/tests/amdgpu/amd_slth.c
> +++ b/tests/amdgpu/amd_slth.c
> @@ -263,6 +263,15 @@ static void slth_gfx_dispatch(struct amdgpu_cmd_base *base_cmd)
>   	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
>   }
>   
> +/* Compute only parts like MI100 have no GFX kernel queue */
> +static bool slth_has_gfx_kq(amdgpu_device_handle device)
> +{
> +	struct drm_amdgpu_info_hw_ip info = {0};
> +
> +	return !amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info) &&
> +	       info.available_rings;
> +}
> +
>   static uint32_t execute_slth_dispatch(
>   		amdgpu_device_handle device,
>   		uint32_t ip_type,
> @@ -1542,6 +1551,7 @@ int igt_main()
>   	struct amdgpu_gpu_info gpu_info = {0};
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
>   	bool enable_test = false;
> +	bool has_gfx_kq = false;
>   	int fd = -1;
>   	int r;
>   
> @@ -1566,6 +1576,7 @@ int igt_main()
>   		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>   		igt_assert_eq(r, 0);
>   		asic_userq_readiness(device, userq_arr_cap);
> +		has_gfx_kq = slth_has_gfx_kq(device);
>   		amd_platform_filter_init(&gpu_info);
>   
>   		slth_sa0_wa = slth_needs_sa0_wa(device);
> @@ -1577,8 +1588,10 @@ int igt_main()
>   			      "LLVM assembler unavailable\n");
>   	}
>   
> -	igt_subtest("slth-gfx-kq-vgpr-proof")
> +	igt_subtest("slth-gfx-kq-vgpr-proof") {
> +		igt_require(has_gfx_kq);
>   		slth_gfx_kq_vgpr_proof_test(device, fd);
> +	}
>   

The series adds:

- SLTH trap entry and trap return validation
- VGPR state preservation across trap return
- TMA propagation validation through the second-level trap handler
- GFX and compute kernel queue coverage
- GFX and compute user queue coverage
- CWSR save area support for compute user queues
- GFX11 SA0 workaround handling
- Platform-specific enablement and skip handling

One question on the test coverage.

Should we also consider adding a negative test to validate that
AMDGPU_VM_OP_CLEAR_L2_TRAP actually disables the second-level trap
handler?

Currently the tests validate trap installation, handler execution,
trap return, TMA propagation, and the KQ/UMQ paths, but I do not see a
check verifying that the same shader no longer observes the trap handler
effect after CLEAR_L2_TRAP.

Also, the return-proof test relies on the VGPR-proof tests to
demonstrate that trap entry actually occurred. It may be worth
mentioning that in the comments so future readers do not interpret the
return-proof test as a standalone validation of trap execution.

These are only suggestions for possible future coverage improvements and
are not blockers for this series.

Series is:
Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>


