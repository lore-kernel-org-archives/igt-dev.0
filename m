Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382CEC982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 14:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E68905A;
	Tue, 22 Sep 2026 14:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fmUnHQAH";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013022.outbound.protection.outlook.com
 [40.93.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722DA10E3FA
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 14:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyZ7LES4gc8MzJ7aBxoJEQRtRzdtcFrHucPBcyUwyg8cWn7CWDvnAjrBY0yo1INqih+X4QL7nz/sdWm9FLepSA/6PUNKROWeKvkrcr17sICG275kKM3A8JXwn9OKjOuYGGDMdeyiljtE/qV8gl2dONelc4uEzJFF2Q28N4j621TW4E3zJ3EeHC6VqMMjyjNj/iRne1wshuH3SHPoGGeMPg53Oj4dKlTLJ9AxSNG0FWr1cL1o00uN8n/uX8pCuuM0cckEdwOaR2D2Lk/lwFO9SzDphZLQLb/j4toNjKM6VsC4kFQy5tz/zTShFG3wXmfeUmMXZkQ2kYL8YkKHU349JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFVCH0DzfyPzwIRs4QMaoQKDwh94THtJWjvLOzrSvaQ=;
 b=qHz75szjEfPreN3juoVDbfT5HUFO1COnf3rRuNhlF2D+4IqTnvhPOO2hsKgdqUYBT6eaDKnJEzFVsXxpv8Zt5QObbG11eHD5SoQ8PBm054xxs5oKvbbVqRU97avtqi4flK5OiPai+zWsZiJAMOBa9kFWWpAK/tYfjGKyB8oePYsHfvX1zaLodkO7QEgX8SaMVecXTbAmpzXnbrZjyLl8QL64KjKYJuID0aH3L9ccyoRYgSEUcaEMd0Ns0WaCt9jYUGaVL77XypzZr/lkj1H5gJHR7m1CiTi2HZNcVulTdlANGy5Mwkfedvi/JyFn8gNfMg7U7Fv/Eb/7JvpjwEutCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFVCH0DzfyPzwIRs4QMaoQKDwh94THtJWjvLOzrSvaQ=;
 b=fmUnHQAHB96sCyPGtoQwrUhLlxcPvmbrJBIhwWXJk4HPlo/GI+MQ6ux4puK2boJ6RQeW0V9Momqgbhm+D8+SMmZT/D+2RmwZaRhjB9OXLnsos0oS3MGImwNqJIbJmgHx0YThlZZvHL/TocpSFRKiThYXyW1iR5LQaaH5Li+sJ8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PPF12253E83C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::606) by BN7PPF49208036B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:55:50 +0000
Received: from CH1PPF12253E83C.namprd12.prod.outlook.com
 ([fe80::a53e:9981:d83c:c24]) by CH1PPF12253E83C.namprd12.prod.outlook.com
 ([fe80::a53e:9981:d83c:c24%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:55:50 +0000
Message-ID: <11938bc0-29fe-4c0d-ae26-6d63913c5c77@amd.com>
Date: Tue, 22 Sep 2026 10:55:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for
 basic-suspend
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com
References: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Ivan Lipski <ivan.lipski@amd.com>
Organization: AMD Inc.
In-Reply-To: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0045.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::18) To CH1PPF12253E83C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::606)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPF12253E83C:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b1528d-a0b3-4aa2-3521-08df18b997cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: PzRlwsLiDhaqEHQpAAe296ViEpPve1FFzwqNYK5phlTc5F7jqK547upwB1ZW82Pc8j5XZgmIo5Z5u69UCFpbRbAHU0R7ITtf6Ghh/rL9zM4gRKFKr9YT3EmOKiq650/diGO9Hl1WlCS+4dtGcwWCiPiZ01ibPrcSDFu37D/YanPkbW5rJ2u0udH7kIme301uW/Ak/8pM5p97n0BtvE/9SZ6xni3MCBcdSSEe1M5GGBIJD89jm1Rtv5o2AvRwzg3mlIkxlZ9Z//SkujmqTgRgPAaxbAZnqg9e8g+nYhR8FymIQ7xsc1z5EogLc0zzNu5gL6vp/rKFnjkQ9c9ZbX7M2quWkebOyoAxOPw1WN1fS6SkWecSHncBsxhSHs2OBxReWHvU2NyqXi09Kgu/bj6Bv1U/vEFN35ogIqomq0hKQC5tJNRLojWCm35F8dyNnsPm1+2eyj1KICvl/h7gcLhItU9YWtuRqaOf2EG0In/CDV3Vl5uajn/2/iYI2GuWw0izjbZLbBbgzJdYHmDCwIo0xHd3ASTZao4vxmjchMNEXhQln67JJ8k2Tm+JqmNg4Y622fHdjWz60C2gzwObyU25uxIrnHNbNAZ7+XP1L1AAJ2fP3JAfQ3o/GG1bJ/c+gcv1sRHGnOaLSX8xr7kgrGvJ6e0elcIGa8JlZ2gbS1UCoqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH1PPF12253E83C.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWpFaFI3WmQ4QWFxeWh0clU3QTdzMWZVTGVHZE5iMCswVmFydy9jeGpwbk5m?=
 =?utf-8?B?bVV5Zkt4VmJaeW5SR3FkWmdhOUlMUkJSTGtlTU5UaENscTh2VlUvc08veCtL?=
 =?utf-8?B?eWQzb0RPeEFwelRib0dVS1AxK2NGRlhZQlpHQ2pXZ0RZa3ZiSkpRajhvNnRX?=
 =?utf-8?B?QUZBOGF2bCtiRUNGYktudkRxOGVNQitnTGRHYVE1ejJiMlZtcitPTElOVDFF?=
 =?utf-8?B?aGRVczhhQWs5czBldXZlUHNBdXFJUlJrOTVORVhQQmQ1QzFPMEJyRHBtMFFK?=
 =?utf-8?B?Z1NWR25PL3pFTWpxc0NLVU96bUdEcFF6TGxHbE0rUG9nTUFwRjcwNFc0S1Zi?=
 =?utf-8?B?WjhBYk0zUXFnbUdSNS9QbnpjdGYyT0JGVDlHdE1qVjJDV1luVmd3bUNHampi?=
 =?utf-8?B?WGdaYUl2ZGtFb2NoaEFpSUsxaGRCSDZiZDdPaUhCcmJFUm5xY3BBMjJkZHkx?=
 =?utf-8?B?ek5WdHltdEkyU3N0ZlkwNzFzVEZ5Qi9QUWplaS80Vm9MUVFKR1MrQ1lXVHVH?=
 =?utf-8?B?RnpHc3Q3eDI2ZXl0Mng2L3g5UTVidC91dkhXTEZNYUU2RHdhMXBDQ2dSanU2?=
 =?utf-8?B?UTZJa2hFaXQ2dW4rY3RQeElmSEkvRkJhdnRpeG5XbkZkdHRXVW1wNE4rZ3lr?=
 =?utf-8?B?OEU1ZzMxYy9tRVVUVzlKWXhGdmRlNjEwNElaUTZ5Nk00VFVac2xvcGdrWjc5?=
 =?utf-8?B?V2dxSHlmM25zVUpFbGNuL1RvdCtEazRsZGxVeXBKQk9KSXBHUVpDNjI5Z2gw?=
 =?utf-8?B?V1cwMURjUFgrTG9GUHFXeXBwTFFMcU96QXFSbzhXc1B4dUtZNVRMYXduZUNx?=
 =?utf-8?B?NHkzcjcwQ1daREc3Zlk0TVJtN1o3UmxRZFE5NFVUYURwNU96TzdpeDc5N1kz?=
 =?utf-8?B?c2ppb0MvVHl0aWduZGZQS0hTNjcveElYYmZpOHZoYklOKzA5S0VUd0NxSmxU?=
 =?utf-8?B?Mml3d01QVFFjclg2NU13NlhscmRoaTFQTFFGN2FTNFJGdUhSc3Zha2UvdWpQ?=
 =?utf-8?B?djR2eDZQczhkWHNsUUR5Vi9YNVpETWk0UjZsQ3c4NVpFRjRmVDYyZVdMMllC?=
 =?utf-8?B?enpqNWJpNDZWenlXYVptbk52ZGsraDFhc1B4YnE2aGRYRE9ZL3NaZ1VEc2wr?=
 =?utf-8?B?Y3E5c2wxeXlyamxybytGVFpUL3lVeFloSENpT3FPbEdtTHBXRU0rdS8wMUoy?=
 =?utf-8?B?ano2ODVJckdxbGZhRlVtbUliU3paUk55MlQwT2dMUlhXK0I3VDZKekhIbXl2?=
 =?utf-8?B?ck10VHVwUS9LblFqaUtndk90NXozSFRBZStFWGVxQ0IxSnVUaU52VWo5NUto?=
 =?utf-8?B?T1J1NWJVUFpndVJjZjI5SDlBWllUbEV4RTJkTUFFdDNrYktuQ1E1RFdPbHdZ?=
 =?utf-8?B?MThWOVlEWGJVN3dHNEpKT0duL3hVWlU0eDRzODVFTEpqRjI1dlkyRVRScy8w?=
 =?utf-8?B?Ri9kSFR6cG1PVGNzRW1PMkIweGdhaVRUTmF0WVhPcmF5NHNZTTZydWg0cHY1?=
 =?utf-8?B?OVlBclVxTVUxMEwrSE5KOEs2T3NSZWlNN0VaYU1ZNkI0eTZPcFJmeFlpUjZU?=
 =?utf-8?B?SlppL2lDOWRzTEp5cUJOclduK0FhMHhSa1gwam1FczdkZ2psTTU3cW45UVY3?=
 =?utf-8?B?NkNsT0hHd05jYk81cjMzZkVHbWx5TlZkRVB0TXhmVm5YNE1KZ3Q2MHVMdkkw?=
 =?utf-8?B?dTVvenBiVExmcDJ1VnJ3TnJzMFI0M3dCMlRGUGV3YmlkWm9tRFMweWlMYjh1?=
 =?utf-8?B?cHVlMDVIV0JxRGl0WEpXWEhESVA1WXlkbE1jSDdaVnlVMjBoWXdjeHNTcHFj?=
 =?utf-8?B?cm44ODdMSDE2dWEvWVY0T3FNUG1JSHN5Tmt4MFRYMitkeHFhemZXdDlyU3k0?=
 =?utf-8?B?ZWhVQ2VrY0ZHa2ZBZ2k0cGJnZjV2VlliWWdmdnN1aVpnYzI3cnV2ck51V2hN?=
 =?utf-8?B?aHZPMkhrejJRR3lwem5tUGMya3hJUzJsK2JCaU1yYUtmRVk5L2w1YjRxRThW?=
 =?utf-8?B?eHNiQ3ZpWVExSDBwczBVQVZpRzZwaTF4Y0VGa29iYm1NU3p4blVVV0VQOWJ5?=
 =?utf-8?B?UHYwUnVzUDJaL1lzSEdrODVFVmgwYVJRWkxNU2FYU0tkSXNDSlRvQWxtR2hM?=
 =?utf-8?B?UHhzelZCZEFRM2k4VkUwZ1FXK2Yvc2RJWThSMUNRUDV3cm5VZFFNREdxY1Bi?=
 =?utf-8?B?cVhTK0JOVTFmalEzNWVvVDVGSEgxM1V1OWw5S2tVUkJBZ0oyK3g3Vnd0UXZP?=
 =?utf-8?B?ZDFvS0JRZjhnQXdYdjhKaVBmWkh2RTh4ME80NUthK2lkT0FQWC9hUEpDN0Nt?=
 =?utf-8?B?SndkMkw2TFYwUThuQTlNSjlPTmZFdVovK1dCejBZUnhCanZIRFRxZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b1528d-a0b3-4aa2-3521-08df18b997cb
X-MS-Exchange-CrossTenant-AuthSource: CH1PPF12253E83C.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:55:50.6077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uyG9Dc/zyx9me2JtL02edHtphNPH8gBULdgXKyrvFTE41+qc03srjwDhSbnbVhTEeiJbO3fPF9nYDYArI8aAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
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

Reviewed-by: Ivan Lipski <ivan.lipski@amd.com>

On 9/22/26 10:42, Aurabindo Pillai wrote:
> basic-suspend previously skipped unless s2idle was the currently selected
> mem_sleep variant, even when s2idle was still supported. Switch to
> SUSPEND_STATE_FREEZE so the test enters s2idle regardless of the system
> default, matching other IGT s2idle tests.
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/amdgpu/amd_hotplug.c | 26 +-------------------------
>   1 file changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index c54288e90..509d828e6 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -30,7 +30,6 @@ IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
>   /* Maximum pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
>   #define LAST_HW_SLEEP_PATH "/sys/power/suspend_stats/last_hw_sleep"
> -#define MEM_SLEEP_PATH "/sys/power/mem_sleep"
>   
>   /* Common test data. */
>   typedef struct data {
> @@ -102,26 +101,6 @@ static void test_fini(data_t *data)
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   }
>   
> -/* Check if mem_sleep is s2idle */
> -static bool is_system_s2idle(void)
> -{
> -	int fd;
> -	char dst[64];
> -	int read_byte;
> -
> -	fd = open(MEM_SLEEP_PATH, O_RDONLY);
> -	if (fd == -1)
> -		igt_skip("Open %s file error\n", MEM_SLEEP_PATH);
> -
> -	read_byte = read(fd, dst, sizeof(dst));
> -	close(fd);
> -
> -	if (read_byte <= 0)
> -		igt_skip("Read %s file error\n", MEM_SLEEP_PATH);
> -
> -	return strstr(dst, "[s2idle]");
> -}
> -
>   /* Return the last hw_sleep duration time */
>   static int get_last_hw_sleep_time(void)
>   {
> @@ -180,10 +159,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
>   	}
>   
>   	if (suspend) {
> -		if (!is_system_s2idle())
> -			igt_skip("System is not configured for s2idle\n");
> -
> -		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
>   					      SUSPEND_TEST_NONE);
>   		igt_assert_f(get_last_hw_sleep_time() > 0,
>   					  "Suspend did not reach hardware sleep state\n");

-- 
Thanks,
Ivan Lipski

