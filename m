Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AC4CDE010
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 05:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6FF10E2FC;
	Fri, 26 Jun 2026 05:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VDxyRTG9";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB9E10E316
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 05:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP6hpXfQa4MhQ0pgGz0J3prRyf+khpbRTc2qOOJIMqQQyzturzy6RyxFGAKtXIrxiJEen6JUrYaYhXqEHnwbU7fCzZLWWosRDEw/anQAXRyfF1ZTLXbxM/APqk4B6DseOKPx5ZgJXxFeSNdjo5iZaXBosZecJJRMIyg7vaZmeiKJmBfhUyPpVaM5aT/fajtM2u4aw6Z7x+2Y20f+JPlnqjprdrEMxsrdD5o6mbtX7/1NMObr0T418ZmIDthyudJrcZ/1RpcQvynRn6jZdJ6Yphe3elx3PxCyt7T6Ew4i60dRKdtmEXae2L7WWHjizQf93csaGfV5XsHezRO8ABENfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tptunld3HWy6DByZuYBPX2h+MGq5pI2jW2YC31vEpc=;
 b=SFH2+n5SsKJR3YW9zN9ZFRxpEK81+Vf1nEzxEqizXjjHdw6DXBITVu1YiApbF7ysMFsSBAf7eGYIm+hGgm/L3bXrp9GPXjMn75QJReR586ZU0J7EE6WIxMIaB8uQA1SjL/+dHxLwYHlQWgY81eq2G+BE5WBfwaGDgpe8lv3fQb6dNuS3shUBQwWxfQDBL9SBAxi4VW4hNr39jYCP5pqirUwCQ79VhU0EEOfazdqsJpbzawIbOSj/q/3qrQJ7ITBtXFwOl+lFN9Kcl7bgbP73EYr+Js1bpFCNtIn0hiYCuvcYk/r968wK9Hf0vWoGAd3GjY+/pUeQVbmcJ4tbD9Bsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tptunld3HWy6DByZuYBPX2h+MGq5pI2jW2YC31vEpc=;
 b=VDxyRTG9QMUc3NmnnZzfvgLx7X9FDBWl29siSuea89NwLSTMGhB+BoI5Vrdha95La7dZRmH/fDHzKQThwLhBMmEHj0kEVxgn/3Fsu3xfqhv3PkPxno5Kzhsv0o0JUM3o2pBu0UM3tz0sNoYzrKMqV8FinUpyLRVbAl2Koj+YkQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:37:21 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 05:37:21 +0000
Message-ID: <dcf429e7-ff2f-424a-aeec-4d566beb0b02@amd.com>
Date: Fri, 26 Jun 2026 13:36:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: Discover amdgpu backlight device
 dynamically instead of hardcoding amdgpu_bl0
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260626032211.38353-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260626032211.38353-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccc40c2-876b-4927-5d23-08ded344fe31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sK9zuayYL7te1aixo5uzGLMrnCwO5XI8P4Yq2SOIZxmVJs/qlqv1G6smHFq37WQu6PcCf4LoR8fETABw1m66CUorKDpwWnsFx9Fm4Rrkrer0vH7EBbDNyNaNh5Px5WOUyRJMtrj4KMIZwb+k4hh3bJzxlpqqmRX5WqMAlwHYyCVyZeWi2zeBR52TyVKeXi0+InQnUT/4H3FHpHuJgPJyc1nAso+2zumXJN/CuIZUZhqo3mZsooDos0SwAbpKRw+8S3B2+eUGaL8mcLtBtVxn/RVCDFTc7xwnq+GIIFoBut9GNDN9uYqNn+MXdbkNstWFZ8GQhg3M8QMVMwPHxT2AmAXdX/mNK7U3jlBKU4tM7AtAdMRGOBwAG36epqrr7HB9M7+v7Gv+qccmhawbtjWkoMDcZYev+cl5g/H6IKjJ91jgmzSsEy2hekX4z1rlUiHswYzoukjXMLJ79yKCTtOu6LaImOrML4hPa7sYDfrUyUA6buOfIx68VaEJW70bdyumvppK6Wh5uNw+n6eH5Hz8185W5BRmLC/0loscxVISAzE+nJZG1OLxMtlMu97b1N+iWaQvp2eIK4G+Dghp4MbvvdAQ6Tw/1qJdBokvLd4sxHJLqveJHV4d/8C3kmBbFa7zwMNGzaknpnhRPMZHYCK6yYeeSaLw6fm8DGn++umUeVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZ0M2FKM2FzeHJlVTFMSnY4UFJxSEVsK3JoOUlFbU85R0hoT2xqb2FKcUdK?=
 =?utf-8?B?M3o4ZlQvd3prVkRHMzVzZUo2ejh6L1JpWms5UnQxbXV5UUVNZUswWkhlR2Ju?=
 =?utf-8?B?bFR2RXZ4SmNSMUkrVkRrSHRvWUtKMzc2T3QzWGdzenVSRE9xZURUQ2J2dkt3?=
 =?utf-8?B?UFhZT08vejZ5UmZFdWg1RlM1clF0bEM2b1hrREwwRGR1RFRteGNSekxMMWgr?=
 =?utf-8?B?REY4RWUzcGQ4TFRMZWQ3bFZXbXduVHRrV0xGMGo3RVZ3Q01VaXZvc2s2TVZC?=
 =?utf-8?B?dGRXaFhtakg0UXorQ3hpeE5lbnd1VDBieUZRbDl6cHlYdS8rQ3FoY1RtTW5i?=
 =?utf-8?B?dk0vaXZENVJpTWtkelRxVG4vNi9zWDh5cnlvNWVPaWZyM3Vncmd0QTZ2ZldE?=
 =?utf-8?B?bGxKb1RtY3FuZHFnZ0NYVjNaWjdmQkJRSjk1VWcyS0pIZGhWTkFRSWd0M0Ey?=
 =?utf-8?B?azk1dTJBNGpCWUdpK08zbUs3Z0xqcGtVczd3Tm1DaWpZSGZkTDNuTFpyNmlp?=
 =?utf-8?B?TDlVSmRzajFodURtc2U5UjlLTEVhZWF1M2phN1J3dWt1UWVEbGcwakFzc1Ro?=
 =?utf-8?B?VU5HYkJIL1FEcVN6TW1QR2JrN0o1MkFLVXR0RW8rNnJCZjllak9tKzJkRGZr?=
 =?utf-8?B?V3BDYytpbStBL3llN0JZUTNzWExEejN5Wmk1N2pzUm9VLzdmUHAybTNnVVJS?=
 =?utf-8?B?WnEvK25rNzhGcG9YQ3d2L0gwZUtVSk15T1RNYkF0bWFLaG5MVkNFejhBZXF5?=
 =?utf-8?B?RGhYS05xZTNiOGlXeWs4bzRIdWRpK2dyL1VZUWFZdWhLcVZkdDhIQ0JNdDdZ?=
 =?utf-8?B?aEdlaHV1NU5rN0phbTB3S0VhTUM0akNSYUltQWVtWCtyRzk0bGIvb3Bzbmw0?=
 =?utf-8?B?bXNxQUdBbWYvY0pvNDdsV3FzUmR5akVpd2VFdE9YQ25iOXFRdTlUYjhDQ0VI?=
 =?utf-8?B?OGQ0UnVBUzdpSXNENks4Yzg2WmlyaE12WC90MHpwL25acTZ6akFRMVZxdURP?=
 =?utf-8?B?Tm95ZmdIMlNDYXhYWjdvZ0o0ckVtU3hDUHNRc1grZEoxT0wvcGhLK2FhQU96?=
 =?utf-8?B?bXlxZFRqSTRwaExUc0pCKzloVkZtY0YxeCsySVhrUnc4RW4yNnVEblIzVERS?=
 =?utf-8?B?ZU9XdzBzc3dHeGo3UUtuQ0F2QVpOZy9nZ21VdEpOT1lLYmR4TTlkK2I0bGV2?=
 =?utf-8?B?c2RmN3Zua2FySVIxU0w0Z290OWE2NU9ncG15NllyWU1HU0VpQXRoV0xoZ0da?=
 =?utf-8?B?eStxOXpKMlp1VlVZNVpQamM5cEVVVXF3d3NxOEVla2ZFZWRWNnQ5ZzNCQlI3?=
 =?utf-8?B?NkV2djJHaVNCb01VbTVxMUlrZGhTQUNkeURpbHBET3BPTzJrZUxxZE94aTl0?=
 =?utf-8?B?QklRblB2cXFBRGxSQ3RLQzRKam5nRDlFSTFyY1hBeFN2WGZJbWZxdWRjVEth?=
 =?utf-8?B?b2xSVk1mTmRiU1B6R0VnaVgwNXBlbGwwQzk4YjVEaTBvbHBLSExtdk5HZGkz?=
 =?utf-8?B?eUJ2UGNQNEdUcWo3K1orMUVsS0ozVG1Ec3ZkS2NYaXlzRjBQYXNpanI2Q04x?=
 =?utf-8?B?T2srdGhzL2ZWVW9Sbk9xQmpkM3pQVEhjYmJMK2paYTBFcXUwR0toZkZnRmRo?=
 =?utf-8?B?OHdkOWppUmhXcWRiSU91QlFSWmR5MkxBWDZBTWJHblNaTkZaR3hOVVdsbjBq?=
 =?utf-8?B?WTRzakNZQ1Q3NEJRcjQxQ0VGblVvMGZhWmtKMFRzMEM4cWZpUWFmZW5nbWdq?=
 =?utf-8?B?RVgvUTNJblY3Rm1ZOGxiQVpqQTV0UmdOMm5TZkFwYlRxSElKbFJrQ0pVR2cw?=
 =?utf-8?B?ckdINUJ4K0pXVXo1ZjI0TjVkeGxsdDFnNnFWRWtQYzR6c0lOQWI5Rlc1M3dw?=
 =?utf-8?B?aWR2RGl0cFJMZ1pqRHpYcGpHbUE2MGFFUUtuV3o4ZGxVUzZ6OHpiOUo0L2VX?=
 =?utf-8?B?SlVpd0EzbEZHc0MxWlJDbGZHVy82cFdaQUgvc2xldENtQmZXTHhnNnFaclZQ?=
 =?utf-8?B?ZFJxUFJHQU1nQWxEbkNLQlI3QWx5LzJ2Nm5ENER5Mlp5aTUwK0YwdTd0MjhS?=
 =?utf-8?B?ZmUxOE5yZXhFN0FUMWZmaW9KWWpReDNqRHdQdStoTE1YRi9pTVB4MlRIKzgv?=
 =?utf-8?B?VDVEZ1A1QVlHNjBjSnJJOFg3UHhzYW5DM1Q3WVdoTWZJeHJHdUw3T1o5OHZH?=
 =?utf-8?B?UTFpMTBrOW4ySFpIdDViR2ozdUxYbmtCbVJZa2pvc25LYlVwYzJOTnFvTVZm?=
 =?utf-8?B?RW4zRitrTXNVZVdKK3NERzRONlhzTzg3TFlTY0IyZmRqR3c2MXFWVWV1alFE?=
 =?utf-8?B?TUpXUTNqRzUxVVJzdU1DcTlTNElBTEpZMXZNODBLOTJ2VW9wU0tQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccc40c2-876b-4927-5d23-08ded344fe31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:37:21.1384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfB7Hf+m8ddOKOWOLCX5WiZRc5zntaL4Yv/QlAmqsMYAn8VDOcbpgP05WTMujVZ/JWolXelladLG+ce1zHJV0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
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

Patch looks good to me.

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 6/26/2026 11:21 AM, James Lin wrote:
> [Why]
> amd_abm builds the backlight sysfs path assuming the amdgpu backlight
> device is amdgpu_bl0. The amdgpu backlight device is named amdgpu_bl<N>
> where N is derived from the DRM primary node index (see
> amdgpu_dm_backlight.c). On systems where the amdgpu DRM node is not
> card0 (e.g. simpledrm takes card0 and amdgpu comes up as card1), the
> backlight device is amdgpu_bl1, not amdgpu_bl0. The hardcoded
> "/sys/class/backlight/amdgpu_bl0" path does not exist, so
> backlight_read_max_brightness() and backlight_write_brightness() fail
> before any test logic runs, preventing dpms_cycle and the other abm
> subtests from executing.
>
> [How]
> Add find_backlight_device() to scan /sys/class/backlight for the first
> entry beginning with "amdgpu_bl" and store its full path in a
> file-scope buffer. Call it from igt_fixture and route the brightness
> and max_brightness accessors through the discovered path instead of the
> hardcoded amdgpu_bl0 macro. Use igt_require_f() so a machine with no
> amdgpu backlight skips cleanly rather than asserting.
>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 39 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index ba90344d3..7992dfd87 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -31,13 +31,44 @@
>   #include <string.h>
>   #include <fcntl.h>
>   #include <time.h>
> +#include <dirent.h>
>   
>   #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
>   #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
> -#define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> +#define BACKLIGHT_DIR "/sys/class/backlight"
>   #define PANEL_POWER_SAVINGS_ATTR "amdgpu/panel_power_savings"
>   #define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
>   
> +/*
> + * The amdgpu backlight device is named amdgpu_bl<N> where N is derived from
> + * the DRM primary node index (see amdgpu_dm_backlight.c). On systems where
> + * the amdgpu DRM node is not card0 (e.g. card1), the device is amdgpu_bl1,
> + * not amdgpu_bl0. Discover it at runtime instead of hardcoding the name.
> + */
> +static char backlight_path[PATH_MAX];
> +
> +static void find_backlight_device(void)
> +{
> +	DIR *dir;
> +	struct dirent *ent;
> +
> +	dir = opendir(BACKLIGHT_DIR);
> +	igt_require_f(dir, "Cannot open %s\n", BACKLIGHT_DIR);
> +
> +	while ((ent = readdir(dir))) {
> +		if (strncmp(ent->d_name, "amdgpu_bl", 9) == 0) {
> +			snprintf(backlight_path, sizeof(backlight_path),
> +				 "%s/%s", BACKLIGHT_DIR, ent->d_name);
> +			break;
> +		}
> +	}
> +	closedir(dir);
> +
> +	igt_require_f(backlight_path[0] != '\0',
> +		      "No amdgpu_bl* backlight device found in %s\n",
> +		      BACKLIGHT_DIR);
> +}
> +
>   typedef struct data {
>   	igt_display_t display;
>   	igt_plane_t *primary;
> @@ -234,7 +265,7 @@ static int backlight_write_brightness(int value)
>   	char src[64];
>   	int len;
>   
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "brightness") < PATH_MAX);
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s", backlight_path, "brightness") < PATH_MAX);
>   	fd = open(full, O_WRONLY);
>   	if (fd == -1)
>   		return -errno;
> @@ -288,7 +319,7 @@ static int backlight_read_max_brightness(int *result)
>   	char dst[64];
>   	int r, e;
>   
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "max_brightness") < PATH_MAX);
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s", backlight_path, "max_brightness") < PATH_MAX);
>   
>   	fd = open(full, O_RDONLY);
>   	if (fd == -1)
> @@ -528,6 +559,8 @@ int igt_main()
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   
> +		find_backlight_device();
> +
>   		test_init(&data);
>   	}
>   
