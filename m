Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A012C624DA
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 18:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA18610F72B;
	Thu,  3 Sep 2026 18:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TTqiC6P8";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010063.outbound.protection.outlook.com
 [40.93.198.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A45010F73F
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 18:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gR8o+M/qGpEkndHaHZwVg77BYF6DagHwsorD8r3t+qq+5+RjM6M8kmtmxqaxuEzo0ncREKOFn1OnZv2tefHEp/vtJs6AhwIHmBYwwY+vuUOGoURK8IxnphrO+JHeB6ZGeaVIYwohBSBcqLjljE2eahZzeAeFrZhy1aA6KIzt0cVLgwubuIbm3WZTQ7uVIyao9DMBV0ko/fHUVP67p37mCttR8Osj1HHgTonkgchV7/186MN+1/uBHT3XtI3QqGv5CgAALLq8VvYglu9+7N1l7OiW8ao3HuZT4+GxoJMC/kXSrlw0oh4E4Rdv3872yZX4XJHtpOixdIFh0iUQI0PlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05onDHrabMp/JKMwTkl3UWdrOjoyC7uwhWkuOs6mN1Y=;
 b=Wssrf9ontuWtXEvtL6iLS3vBRteP25zgNsqgFpCxfjHtZ6dw7KeJwZeq2/MPQvSKfrWZvNzPa+Hj2pJ09RrqyMkiW7UAJGcQaXxA55zX8Lu5YarSgtLM0+n1tvMbcx5DAaQ/LyGFukGtsubOQ5LowW20wKc4lspr0IX8SvneKdh2efOX/da+fig8e36cFH56SGEdvdfh8Zrf5JXtf6B3kBDKf6L5xlIHGNocrvOQJRTI6Zi84QZFTW1r5Z9oLd/FbHuXi4oy8QD3JULFQctIZnf131eFrzKCvAkESytenWWGpmhcpkfm721Es0uP26EKfRWUvfL1NY7u6H2J22tDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05onDHrabMp/JKMwTkl3UWdrOjoyC7uwhWkuOs6mN1Y=;
 b=TTqiC6P8yEiQVXFWN93BBqiDiCSF8mmnArSRtyChiGxBYnfiTjt3tJ9iaTDirj6ucovcHOKyv0KQqWcMHGjJIXaREDvC78TayoT6L6iE1sUkduA580ty+eYQGDmymYTiIEiQJjpEXGPQVLjQjROwVefo2Ov2PN/9hyCN+7Xe91I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:39:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 18:39:13 +0000
Message-ID: <3bff8685-3441-42a3-8586-4d6cc096a1c0@amd.com>
Date: Thu, 3 Sep 2026 12:39:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 2/2] tests/amdgpu/amd_dp_dsc: Reset link settings after
 subtest
To: George Zhang <george.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20260902155742.990457-1-george.zhang@amd.com>
 <20260902155742.990457-2-george.zhang@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260902155742.990457-2-george.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3a8b6e-ba73-4ec3-65dc-08df09eaa651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|5023799004|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: D/WuOU0SXzug7Eo9/rOGlAVKyfgQhnR/ugo3iza97OsihT9SoRJgbtBpqp62OrD+9w+saF+kgaRJfyPIE21RnWXDk5iLPQlX+5cLRc7Ue0NfDZhgJz07JPR5Ue2Khj1OSVgKQfV+L6sxDrzLgPDgwkQz3TPa38jwtks5y9s2xEwg9D/p5LSB8Msw5bdSgFm4E97n8lQEiKY8XgfXYJZUUQaG5DIKczZ/DDXQEgQgbIOBaInokcqB5zTEg/KksfFJ8uQ9FLVCSsYAivcH0oKBpQRTQD+++rbMoVXsPlQ/831mCSJjmtxIe2/3Mai2vqiaVlsQt0Vul5qQBa1WDDtDxbgzaAXHmB9ZQf9dJhzC8hD6ZMeKRjLy5G63AOsfF69bn6GmlIYUDww3FmvpyPnmRsNKrH8BFom2Q/VI6W79qga2+E7kJiTcbbkuamReAkieuybbzFbW779mcZ/j1wzVivQhQyXVFhMW0vqY4OPB8SSnwZv+yjuGnmgVLMrXl71KqCdF2E1KKAwk4O41TNkHp6Pdz+QAbEDEDYT8UOrHUcJ0rcGBiiAPT1Nkxya5D+h1PU9SGM5yfwwa5uN4m5AiYnjI7+jbd/hSA3+XpjWrt2MLM78vzTatZKnqkCv/FDhGAvMgcOTOB5oXMswfHiaYjCL0UZCx0GepT39+ZwSRPwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhBS1Vid002bXFkdFRTMm94YUxrZnRmMzlIU2hSRU1XZU9ra29nK1AzZVBE?=
 =?utf-8?B?cjNmbnNERENadkNodFhFSGFSTjNRU2lPVGl3Z0FqekFHUEdROUxKUUVwU1Fx?=
 =?utf-8?B?bDh2K3hvZmV4YlZuK2tHczhDV1VtYXpxbC9vL3B2aG9sdGFDeFBJTkpMVVdH?=
 =?utf-8?B?eklyYVpYYVZSRFljendPa09tSTk5anVnYkFyMkpjRWw3MXltMldwQkloeXVh?=
 =?utf-8?B?VVlZNWduTkpaL04xd0tDazh0eEt3SHJvTkh4blJyZi9yakhrcmdwYW1JM1dy?=
 =?utf-8?B?cWNlM2pxb2ZhZmRTZ2QxZDRQcFBURitUd0lMRUx1NFhPZkFVU01vMVRRQTAw?=
 =?utf-8?B?RlYvc2d0RVB2bCtCVzJLV2ROZUluN0FRL3I1QTNjQ0s0ZzNvbnRpQ0NqMFdS?=
 =?utf-8?B?eFRjdFVGYUVFanMxcHQvNVdqVE9ubXhoTGdma2RwMCtQWWF6MVgybVB6RTlo?=
 =?utf-8?B?ekQ1R1ZTZ3NZWkluYmFyRVZMWjZGS3FGL2Y5WEJIZ1lPT2ZoQjFsd2N6aTFW?=
 =?utf-8?B?bkpGcjRhK29VT3lNZmhubzNia0JGQy92WWx0Wm4zbzNvNkNtdkc3TU5pdGtj?=
 =?utf-8?B?TzlUc3VJUk56YjUyUkpiVjA1aTAvamZLcHp0anNadHJMc0gwcTNCZ2tCeHhz?=
 =?utf-8?B?RG85eXUwZitHL2NoMllQTTYrN295b3BqZnE4OWIzZ0VsQ244SmZxQml1cTJa?=
 =?utf-8?B?ZEdKWlYwUGQ0QUJRbFlVUUQrWFdXYzR3SzNXcndBNnRoQkNqbkFjL3JkSzJR?=
 =?utf-8?B?SjFFQ29tZHBSTjZ1MjQxZVN5OGZGeVlxU0ZKMXZReStBQkVmYTQ3V1BkeW5l?=
 =?utf-8?B?OHFWRU9IcHJSYVM0ZndhN3VBeW5rNnJPU3RIcDdjeFZQdmgybWxoVTRYNll6?=
 =?utf-8?B?c2FrNmVIbHVZZDYxbzhKUUFvbHdtMjBUc0tiaXNaRkdFSWNlTUt5YjA0eVlK?=
 =?utf-8?B?a3JLN0FYdzlBNDlaZFRDYUZGM0IwdWRKM09SUkhpNitWMklNTkxZYXdScW9i?=
 =?utf-8?B?VzFhSmlZRTBVQ3BncC9mcnVHZzJBT3pId095a1BSYWg5MDl5OEt3QnE2Q0Fl?=
 =?utf-8?B?dG5RVUFQWTdrdUIxbmMrN3c5VDBBRlhTSGpTQkUxalJpcm9oQy95RXdPREJX?=
 =?utf-8?B?NUxPbTNyVUF0TzI0a0UwZDc3RVRMa1p0dFRicXdnL1dmajYwODVRQVpiVkJu?=
 =?utf-8?B?MGRyN05HaVlTM1NLdXhiTEVidGxkU3BzUTV1V3hFcWFwWVNRVkd4TG9yMVB0?=
 =?utf-8?B?TnNjMU1mRW9FcmZNcSs4eExJWjBSODBNRFFGWWYxS2NZMzZWcmJmZTFxN2pu?=
 =?utf-8?B?d2JSMUsyaHlSQ01pVXFPN2d3UzFaTlphVXlzVjdVNUJzdFpWT1BFakRrVVRX?=
 =?utf-8?B?Tzl6QUthblNoQ3RucWx3SjdYQUdpR2hTclQxeVZTaG5vNVpOSFZvS0FNelZ6?=
 =?utf-8?B?QmxPZ0h3VHg0SHBHQW5hcHM2bkd0M1NTZU1ienY3bkVUcVRHeUNtRE11ajNX?=
 =?utf-8?B?TE5MSW45ZXhBSTg5czBSeHQxV1I5eUJpRUJFbGxQdFdRNzBOWVRFMy8ralZo?=
 =?utf-8?B?aHgyckRjT3NuM0hiS0ZDZ0UwVUN2NmJXYS8rc2FPRGRxMkxvMGxTQ1dUTDdM?=
 =?utf-8?B?aE5sM3VUSkpUcHhuOE9sWkRpeGJ6NWN5eDAzVFhtR2RRSmJZYjA2T0NHbkZU?=
 =?utf-8?B?SkpwQVRkbFhPdGlPYmFNRFhXYmVIWnNTTVNEcVZlWnU0VkxHbU1IcW9VRDg1?=
 =?utf-8?B?OHJKM1ZnYk1TR29YSFVsTmdCUUk4b3Y1Q3R4S3I3dWQ3eDhKaWhUM3ByNkNq?=
 =?utf-8?B?dWNYb2Z5d01hYy9rdDZtZ1dXYjJNVUN1YThhMFlydEJwVnZjRVoxL0dKVHNs?=
 =?utf-8?B?R1RxeGZLN3Z4S1RqYmNFWDU5NlE2VElPdDN5dlVjcUZ6NXJBcXhScGpTV3Vu?=
 =?utf-8?B?K2JVK1VOUWpPSGNTTzBLTlhiNFQ3WDdBVGhjb1ZVekFiUXJsN3lTRFdGb1VX?=
 =?utf-8?B?N0FWN3VETGxyRFJGYVBXMGdGUnhPZzR6NHZGWkJTbFZSeTRlZVV0Mjk3QW1Z?=
 =?utf-8?B?M2t6TzJjTU9iNU0zS3l3ZTlpTVgzUnQ2VXRhaEhjYXE1TWE4M1hnTFdWK2Z1?=
 =?utf-8?B?UG83ayt6aXJPRFFVdWJFa3VjOVN0K1VxYnFWMU91eUM0L2dOQUlhOEJhM0Va?=
 =?utf-8?B?SUVoWSs3NStIbHVaV3BvaWFxcEpTTE95VGM3RE1WZTd0VEh4eURMVTFHenBK?=
 =?utf-8?B?b3hRbGJHRlBEZU4wYXNHYkw4ZlN0dFNiNVA5VjdRQzRmMlh2Wjc0OENlMUp1?=
 =?utf-8?Q?x15Fq2HE8ogmeCZw6H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3a8b6e-ba73-4ec3-65dc-08df09eaa651
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:39:12.8978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yKzSH+s44/jzRJ/yO8YlpWEf9xWZGi//VQUyZVb4gyS4dUbgnMbzrzuTdTGnlHypzpB+jeTunI5pg8LHpk5mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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



On 9/2/26 09:57, George Zhang wrote:
> Currently, the link settings persist after the link settings subtest,
> and can retain a lowered link rate/lane count going into subsequent subtests.
> 
> Fix it by resetting the link settings on an igt_fixture after running
> the dsc_link_settings subtest. We can do so by setting it to lane count
> and link rate unknown and letting the driver set it to the default values.
> 
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>   tests/amdgpu/amd_dp_dsc.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index ccaf64c66..a5668a31a 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -351,6 +351,25 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   	igt_skip_on(test_conn_cnt == 0);
>   }
> 
> +static void reset_link_settings(data_t *data)
> +{
> +      igt_output_t *output;
> +      igt_crtc_t *crtc;
> +
> +      if (!data)
> +              return;
data is an array so this null check is redundant.

> +
> +      for_each_crtc(&data->display, crtc) {
> +              output = data->output[crtc->crtc_index];
> +              if (!output || !igt_output_is_connected(output) ||
> +                  !is_dsc_capable(&data->mode[crtc->crtc_index]))
Not directly related to this patch, but the above conditions repeat 
multiple times so it may make sense to refactor them to a function.

> +                      continue;
Let's add a new line here.
> +              igt_amd_write_link_settings(data->fd, output->name,
> +                                          LANE_COUNT_UNKNOWN, LINK_RATE_UNKNOWN,
> +                                          LINK_TRAINING_DEFAULT);
> +      }
> +}

Use tabs instead of spaces for indentation in reset_link_settings().

> +
>   static void test_dsc_link_settings(data_t *data)
>   {
>   	igt_output_t *output;
> @@ -604,6 +623,9 @@ int igt_main() {
>   	igt_subtest("dsc-link-settings")
>   	    test_dsc_link_settings(&data);
> 
> +	igt_fixture()
> +		reset_link_settings(&data);
> +
>   	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
>   	igt_subtest("dsc-bpc")
>   	    test_dsc_bpc(&data);
> --
> 2.55.0

