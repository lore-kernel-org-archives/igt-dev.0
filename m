Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A7EC369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51BF10E1A6;
	Mon, 14 Apr 2025 16:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O5mHJPg/";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8B210E1A6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzi0rGFiCeJPgc31NiPA1Cd0Zg/f/cL9rdt8XT6AsjrXje49OeXADrU30SjY8x0S96pZnHNDoY1lgXeeb86A/BDKAJPasGPCJh4GGGh7Kz1duvjfg8ytCsjhmscTgHcxGPUDxckAvZ4g8TKeT5+lcEVKWOl9JvHxVqww69u0JbafcTwOOZ+NarxRSWTlDJnqWjz4B9xCDT1XLGM+i4VyOUNJPzQ+7as7S2WZj29qBTiW/tyZCeODYX+X5khY3RngMStKLGu5WbGlT6BMyEM794MOHNa2eNcZMJIxH4A9/hGtMoan8xk2jHAmOLv9KpOLVOY3BQqhzx6UTVFL2S38iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fT5X28P/YMkiYMzDTBahoX66/F3bFjneHpH5IHipFuc=;
 b=k6XuMd7ZQ+UalFC7gYOw75Fs7qteh61O0sqTMwONZheOCEG+GzivRhviyC5S6IsdNp7zkUvjpeTGDblY6/jFOn1dhh7PoAhmgQB8I5/VUWf6RoWCeGoknvmhySS9Om81U4n6Vt+GBgRm8XajpK4Z2h6O5AOkpWkjN+IP6gmNvMSTBnKSqPoZz5ksNa2Cv80LiWPY7Imh56VoLa7GhYyhA6hEl+p0xBov1O//T0O+DpJAkADI49899eioYnEWerky9eBJrOW/zQGmwAp5muWdofvnW/ZfKQdstO098qJ8fOX25o80MKGRI0h5qKwOl8y6SAqMMjLldyprVtnBjP+sUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fT5X28P/YMkiYMzDTBahoX66/F3bFjneHpH5IHipFuc=;
 b=O5mHJPg/72HmnujHkdQwpvqohI9jSQjmOlp5jcMt0mI2HuzTVsIFiXjCIir1V3K7qYVgFbWX4zpzznILmYkrFm2iE+C2JSXdM0jRDW2yE5W1bnfQlQPDWQ0QKf47456dqzmAXv1VKCBlnfr/p8pp+jQTwD3Tg6RLZahVzlLW7uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 16:26:07 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:26:07 +0000
Message-ID: <1596576a-02d9-4bce-a0d5-08922ce4f560@amd.com>
Date: Mon, 14 Apr 2025 10:26:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_vrr_range: Fix test may fail on
 non-zero card index
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250414092207.7830-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250414092207.7830-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4c3dfb-82f7-4beb-754f-08dd7b710f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnRzOUpjM3N2ZEJMZUN4VmgxNjJkcTlTZTBGUzBjRU5uSFlYa2g4L3QrQ1VR?=
 =?utf-8?B?dG8xTGFOQnQreG96UldBMXlFZEZNUm84RzEzNlN1NER5bFc1YjZsZ3ZPNDdp?=
 =?utf-8?B?TDFjTjlWM0s2Z0dTMmVDNUhWTEZ2V09BWlFnM3M1Q3h5Rm1CeTJZZFJvNGFB?=
 =?utf-8?B?TlhSZUVpeWZaNm12WWhieVYyWTMvendTMXlxYW0zQ0xOb3RKbHFkb25YUHFE?=
 =?utf-8?B?YUJsU1NvaC9Nc0wyTHR4SnJ6V081amxPdFY5YkUrSnpZZHU5ZnlwcGFLSmc3?=
 =?utf-8?B?SGdXM2ZqOVR5OUdFWnZpb0RiWXVsQ0xSdzdDdFlLWFU0MDhmNFhVVmRsY2M1?=
 =?utf-8?B?Qmt0eW5rUjFqaXdWMTdUK08reVhuUU5Uc0JlVHlWT3FTRy9RekcvQTNzMitY?=
 =?utf-8?B?TVRXOXRHcHp3NDlmcjF5dnpCVUkrZ3F5dWNVRjJ3Wjk5NlY1dmlNTXJPNHRF?=
 =?utf-8?B?Sm8wc3ViZ2lvM3hpVmZETzF6OWZlV1Nwc2E5eUpRWSsyTHJHWUk1Mk9DaUFX?=
 =?utf-8?B?dmRzUi9JeDh4ZEYvTzRGMEF6SitGdEwxNnl0Z09relBEeUZhcGoyeXh1d0Y4?=
 =?utf-8?B?UGtEem9yTWl4ZHcyL3p1UUFxMm1ocTlIWHdFZjBGcWdqU25mNUlMejJkekZ4?=
 =?utf-8?B?VTNZbEMxcEFKMWluMVptZExqZVpSL0FMeXM0UUM1QXJ5YVRncFhWaXFKckNu?=
 =?utf-8?B?dVNPVmg0dzdDaDd2T2ZjY29ZK2xDRjU3b2M0enJTTGxpQkhseDh6RzJvMUpo?=
 =?utf-8?B?Tkk5RS9aaGxMem5yS2JFc1lBaXFsUHoxZGJzNEFPMG1mY2dwVU5HQkpFd2o2?=
 =?utf-8?B?VTlhTFhRSWwxbisvN3ZEdmFCTVNKaDgrTi9sV0hubFR0K3lrb3k5QXZaWXdo?=
 =?utf-8?B?emptZ0xXTkJEZlo1c0hrL0F0YXI1eHRXVzFQTVR5TktrTFBHWXZ2UGlMZjZN?=
 =?utf-8?B?MnBGNzR1Y2U4RkFBVlBhR3VMUGhWLzVobXlJOUw3S1VvQ1RiZTJER2o1SlFl?=
 =?utf-8?B?emJWeWN2WVNkOGJpSHhrMVpHRGU1R3hPbVF4NVI4dWtxOXNBMkR0ei9mM1ps?=
 =?utf-8?B?M2YvMXdRc2dpWms5amVNemVEK1h3VTVBenZpSTBBOGVRSCsvOWd4NzhQNnQr?=
 =?utf-8?B?ZTdRem5BR1ZGc3lvb2pIWmtvSkMxbnlKblpTS3dWcjdzYlBGZXZodWY5ZmZx?=
 =?utf-8?B?Z0hEaURGa0hCemNVemdybXVqUTZ0ZTdWbTJVVkZjcExDenM3eW1KcUhlRFk2?=
 =?utf-8?B?NHdqYzNJeDZzZi9kVU5RYTZ5M0JZd0FDYlJMMFYxaHlMeEFZQzJ2ODlEM3Jk?=
 =?utf-8?B?SnNLNk1HQWF6Yko3K1ZGQ2F5NmhRejdiUDNTSzYvWXN3ckV4M1RhSkJKM3Fl?=
 =?utf-8?B?OC9ZWkcweUw2ZmlNUHRTL1NvZmpnSlgrVjROL3ptaTJZTllsdklPTDIxL0kx?=
 =?utf-8?B?enRtWnRYenJELzVRN2UyU0VKTU5raGwzTE91b3lITXlGbXVNRlVTOFpNTURH?=
 =?utf-8?B?bWJBV2hsYTFGOThDMlRuc0ViL1B4eTFxRTNxa3N4S3Z1ZVloMFJBQS9PblMy?=
 =?utf-8?B?T2p3MG13UDZNNEFvMWR5Um1RKzEvZms5OUdOWW1tWWY3ZlBBYUdtQWZ1cjVR?=
 =?utf-8?B?UC9mQks0T1Fhb1Y1SmZvVDJkNW5kdHpvbHoyRGVuS0tISzFOamtpcW03eHl5?=
 =?utf-8?B?Rk9DK1dWMkVNSWdaOWRMNlZKTWtGUGw5V0ozSjNmK1JadUZ6dWNKMm9GWXl1?=
 =?utf-8?B?SG5lMnh1cWlDdnFSY2VYOHRlMkVYWGRMOFZHZW43bG1qZm1FVzRqMHRFYjFh?=
 =?utf-8?B?dGdLSDIwdHllMXc5dHJOcHY5bzlzN3k4VkJFMGZpSEhyQTMvTGJ2RzV6dGJi?=
 =?utf-8?B?NEJMSTRIR2tZblFXQWEwRisvRHI2dDZPbG10L0RWZ1ZWcUhxZ2pQMDRDS2Zs?=
 =?utf-8?Q?DaWzO8b5qzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3BMeDBjMWkxMVUzZjN0bmJpRm9EZVpGRmI5NUltZEgwU0RGVUR6elUzKzdR?=
 =?utf-8?B?U2YzYjBZRVhBVXVnSVMxYjYrV08ra09XdEExU0dMZTVpQVlROGVGek12UW9o?=
 =?utf-8?B?WEgzZk9kaWxhdHM0c3BLTGtZYlZ5MnAycU5lZHAyOWIzekNPcXJZYW9kVUYy?=
 =?utf-8?B?TnRNVTBvOUd0VXQraDJ0TWhsS0hRSy8vR25hd1Rhdytodkl6UGxidzA3NmtP?=
 =?utf-8?B?RVNoRzFwK1ljaDJWWVRlUUp4azk1aUtpcXY3anlDTDl1SjBheXFqalpVOVo4?=
 =?utf-8?B?TjFiRjkyY05vNG16ZjFCUXI0NlhrSkdRYTRSc2ZkU1ltY2R5TnRjcnBoV3Ax?=
 =?utf-8?B?OHkrNXRiOUN3Y2NrbVV1NmlKRmdBREV1TmdEWEEyc1VTcGI5TkFENjVhV3dC?=
 =?utf-8?B?bW03TmUxVjJIdzRJMzdMcHJvOWZzVUs2VitISnVsbVMySkdOTUNpTTlUZlc5?=
 =?utf-8?B?djR4YnIvSHhmUHhIODlMd2NMRWlGZW1LTTZxcys4UE13OENRdmR3a3k2U3FY?=
 =?utf-8?B?eDNlWUVRcmM5d25JNExLNDhtRzY0Y2pLYTZKL0l0Skx1dGlzNFNNY3h2clUv?=
 =?utf-8?B?RGFIOXhsUTZGcFh5Z2xRZlpMaVhYZm42TThpZGxkOWpvU3RpU0U2TGVqampy?=
 =?utf-8?B?dmVVdlFjTlRkZ0ErazdSN0FNeUhMYkJTdmNSWENGbW9yUTlpZ2hQU2VOS0NR?=
 =?utf-8?B?VWQyZ0JZV1RSLytLLzhBQS91QXJ6Ry9GSG5aZVRvZzJZMHRFMkZjMVR0NEo3?=
 =?utf-8?B?TDZRaUFKM2NEY0hCOHdTTDJ0OEwyTzVUN1dibTRjRkNxb2h2RHc2by9JeXVa?=
 =?utf-8?B?QklBT2xtZGFmenFyNWVyeXBxZnkvakJYWURjdVRZUFJkVzFleDFUcnZXbWg5?=
 =?utf-8?B?SW4xWVNNOE92WVhGczdxV1NEVjlXL1IyOXZWM2taUzVXM09PTzZrMFRPNjkv?=
 =?utf-8?B?QlhMMldSazdZbE40bElRaTBmbWRPc3dPRWZQZTNOL1Z0RkxvYmJuUUkrTzNE?=
 =?utf-8?B?V3VJcXJUZEpqcisyb0hOZnlWZms0dWR3ME84TTJPSVNpelJQb2l2QnMxQmZW?=
 =?utf-8?B?RGQwVTNHd1BUa0pUeHdMWkp0dStaWTVySXY0SE95clFEbmlMNHhrTUViVVF1?=
 =?utf-8?B?TTNTbGpYM0FlNUo2QkhKaW5wOWlsTkljbXh1cjQzclF6VmdUY0ZaLzFGdzVE?=
 =?utf-8?B?U3pQVUUvZnZFMUc4L2lpc1pveUpBWmkxQm1Pb1VMTFdvL3JxR3FXUUo1RUVK?=
 =?utf-8?B?Yk81N0swbGQ2RFhDMHlOVXhQS0xXSTNUcDV0enFINkpjczNDSis3MHBET2N4?=
 =?utf-8?B?UjAwUXRyV2JVL2lyend1U3N0V1ZjM29aRmwyTHpRbUxVSENwcURWVDB6c01G?=
 =?utf-8?B?a1dYSVhXV2JCaXlqZEF2VE5zNVpkYjA3aU9KK2NjNE95VjB0QW1hQWZyZnBS?=
 =?utf-8?B?eSs2VnB1dDdHcGI0Z1JJYnExeFY2eWRsUStwV2N6ODVQYi83MjYzb2VWUno1?=
 =?utf-8?B?bGxTVGd1SnBnaXBrdWRCY0NtV2ZHTk43UDVOdHJ3WUc0d3FMTUNvRjV2MFpl?=
 =?utf-8?B?aUNqdlFJZGxIanlDbXdmTzN0Z2pkY2FGRmNmMjdHQTNwRFVsODIrWlVJVEs0?=
 =?utf-8?B?RGhqc3BnRnZnMWlhYzhLemliQVJGNTFSK0FQV3JSaXEwVDBRNUtsWlduY2xo?=
 =?utf-8?B?anlmOHRVWmtBczhycEZ3akVlYUJzeHU5cURxVnNrcDhUMC9HSnRXRmM0bUZp?=
 =?utf-8?B?amZhU21lY3NOR2d5U1NGSk92bUhFN1lvT3pBSWxTRUVYNG0rU2JVZUYzWFdC?=
 =?utf-8?B?OHoveVNqMGNCdVFWVmh6UC9wTUNXV25mMVl5QjFXQjN3bHdrL2NoWTBiRU4y?=
 =?utf-8?B?d01XS293WURpTk9MMEdqVUVROHNDb3JDL04rVHEySG9NMW9rRWlXRUkxTXJP?=
 =?utf-8?B?cEZBb3VqdzIvd0pDdFN4NFZ0NTZXZFFvdDQ2S2Q3azVxYmEvODZvdWtzaGtB?=
 =?utf-8?B?ejk2Sm91U1FoTHJ4bnJBN1B2V21vOHhQQ25lUWJwNlRTdUFoRCtuTWNZU29s?=
 =?utf-8?B?Q0oyZGl5UlFDaGJKUlZPakxCdVU5LytLYk1VVk1BMC9GUnJjYXlxUjlRTVRP?=
 =?utf-8?Q?6vSTKVrlSpJv8d1j+OdzxCKVZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4c3dfb-82f7-4beb-754f-08dd7b710f02
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:26:07.2277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSHG06VkXzeRXneXTd+yOkxPxYk/dYO/Qo/u/45lEoGMVdEgl4VUC+Zk5wSfCtY1xLclsqZ30SbiFdCfLYuVvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/14/25 03:21, Tom Chung wrote:
> [Why]
> Current test use hard code for card index.
> If the card index is not 0, the test will be failed.
> 
> [How]
> Get the card index dynamically during the test.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_vrr_range.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index 9d2462e5e..38ef1d27f 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -22,6 +22,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "igt_device.h"
>   #include "igt_amd.h"
>   #include <fcntl.h>
>   
> @@ -30,7 +31,7 @@ IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displa
>   /* Maximumm pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
>   #define EDID_SIZE 256
> -#define EDID_PATH "/sys/class/drm/card0-%s/edid"
> +#define EDID_PATH "/sys/class/drm/card%d-%s/edid"
>   
>   /* Common test data. */
>   struct vrr_range {
> @@ -295,7 +296,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
>   
>   	/* Get EDID */
>   	igt_assert(snprintf(edid_path, PATH_MAX, EDID_PATH,
> -			   output->name) < PATH_MAX);
> +			   igt_device_get_card_index(data->fd), output->name) < PATH_MAX);
>   
>   	fd = open(edid_path, O_RDONLY);
>   	if (fd == -1)

