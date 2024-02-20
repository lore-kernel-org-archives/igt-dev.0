Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D250FC48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 22:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDA810E5A6;
	Tue, 20 Feb 2024 22:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="klDY1567";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469D310E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 22:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8NXOb9mevOqMsrfl2M2eHLyqQE7HU1pW5NFA96UqVab/GRElkjtuOUm3/l07VZ8dOt5Py2ahIADbBYmNVauw0eJsb/00CJbA2k0dGYZQBrZjjEf6t1XdwH+TDK6HqvVgCvLBUPa31Ajv95xiZMj582dfHJ5YxDZDl8hWfLZykCMqgMxY6hnegpFTmVRuPKol2WEebD46I8KiFxiaFcOpTncxHDxWlyHpwxUExXMvhWpt3VBo09P+S7Z/IkFBJyJVUOrvpyVvJWZBOtUr741wYg5RRdjFfugMYNovx7egxA6sp9mKxgvGky6ccOaRRAXBsk29y/zpcO0QJFOPQeCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIJkgFTZbG8cSgxYsRY2bRa0lNUOcXsE6bZlbn6jlX0=;
 b=e77wqkieV5zOPAlRgxWyGjx6p9TxSPXXrOkMNGoU1jyXKVN9yoP/q3HIHO6Fl15Jygzpl8NV8cyMy8FbrSTIl02Z3aWF5xyi1lq5YVdlIm4WkynY2tkDHo2KXgfOWI2FWnBAklrsHDAajKbOJsL4J9DkcaesFt+30fL01+Up9jRy0DARL6m+oUeNiggQ60O1fs9g4CXz3K+pq4tpveoR+QGgB32j3ro1Y6CamgpIFHRT3FdF76kOFW0s64B4xPWUcMlZfW29MDcWgmpXtFj7MfpL7dj7s4uY8xvzwdk30M+LEaEa1v8bSH7zOau2O2ZTZmFRdnwQLICboG7tZsU34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIJkgFTZbG8cSgxYsRY2bRa0lNUOcXsE6bZlbn6jlX0=;
 b=klDY15675MztFzzhg6m07PvEbAU38WGyTr8RjMcvUEaeHBhyZpf0cOSm2+5eLRmCXeWhZUIiZBRWl4/4V7gHhHwv27F28U2ipE7qMm/EUQQRGPwL/K6gL16vU5sn9QtQO2XxZWpZGQCtEn5zjQ397gNs6ci0/8nG20pyQPr9u8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 22:44:54 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 22:44:54 +0000
Message-ID: <fb85f6e8-bb9b-4315-9fbb-84f22faa67d5@amd.com>
Date: Tue, 20 Feb 2024 15:44:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: refactor the ABM test to use the new
 sysfs interface
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240220191625.27749-1-hamza.mahfooz@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240220191625.27749-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0260.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::29) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 86911ba7-1ca2-4da6-1ecc-08dc32658e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIqecKp+ruFdGtPnXiXICSHKewhbF8DV9QEjyJVvidTNTIAeqSmy8AzPel4FU70/HCJzKnb70Tz6WGorH5o4pLtR/pRUNKzkmx3oPkfIf/dT+3EXxKtvIsjW/6x/quMBudiz+WGsIh7vrJZ98yxeoMj66JAfLB0Tl2glZEJFOO/CbHnbl1+0aBooxA+LER3eLIIZpzQLoULKxxpmlTf1SnP2Dcn7JbxoC5ALcfT8UlPbbMTirILLLU+/2TIFniAKTRZ4HVYP02Lp8/4UB6M59Z+4ftBo+hS/gdOgBVON/F295c2TBK/JrN5N7TenvOfrzCDM35c/T36xaVAThBk89ycbKqAKwlP5+gZTJ/LBSBuCl7WeI0hxr0XRaRtuIVJ0yYNECyJEmG8vyqC4IG1Rzda7aHAy2OjwI346CriLp85BwfEFdwtc5tijuQuRKrVXblQnyqn9v+CvWj3LJpDOfg0l8ozrtbNAIGxD010Z7N2BUo69dSsRZHDwrA9kVThZcd6C82zWgE8L50Y9xf1LUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFWaUFBQXpqT2FBVHdhNlBzeXFUZEgzNmFFN0JSUlpnZGJjYU10TUJOd3Ix?=
 =?utf-8?B?QVYwUEJLUGpYcGRTRGR4SlVGZXluM2NHRVFXVFY1NE9aVkZHN2E2NGdFOHR4?=
 =?utf-8?B?S0x0UG9sZHY2NG9aVlpwNkltcG8zS0hyU2srTjB5bHdUYit0WWk4WWY5N3Mv?=
 =?utf-8?B?bFQyTjhRL0xOcENrNzVtZEpPcVlCTDkvdDNnRnF4akpONjdZRkhpa25XYXox?=
 =?utf-8?B?Zm9CNkpyQ0lYVWZtdjVTcHNNMFdnL1lMWWwxSHBISkNUTU9sa3YyWVNzMkFn?=
 =?utf-8?B?eEQ1RWI4Z3ljempCSlhGQzlwS3RlSno1MUprR1BjY2xpVUFFSlR1dDE4ZXd0?=
 =?utf-8?B?YXRBMjVrZGFGZ2lqNWNlRVdocTBQUlNjcTlnM3B5bVhBZUkrdW9jbmRlSUtO?=
 =?utf-8?B?N2pzSlQ1Y1ZmYWd1aFRORGxScjVQYXdiNnFjZVVOWmYyTGVuazA3dkpuanRX?=
 =?utf-8?B?TlBsUFFLR0c1aFV0UEYxZXV0NzFIYjlBRXNadStOcDBDMm5BYm1HdysyaGtL?=
 =?utf-8?B?bVFvTjJrT2lWY0hheGdBUmFjR0h1TkdtZ0plTHE3UXZCdzRiQnIzYjZvYy9k?=
 =?utf-8?B?aVc1N3ByeW5nbXA1RkNHYzFnMC9GeXRha1F0WnNaRlptTnM2WU5BY3EyeGRT?=
 =?utf-8?B?Rll5Z1RxU2dmWlFJWmI4UXRrcTJlS2lUMzl4VkthVHNQaVVmTmZtQ1VTM2tH?=
 =?utf-8?B?b3pqM1lyV0dYZUFiZ3VJc0hmSjB1VXdUSVpSWkJQYzRGbWdZWEU3QWY0SFZw?=
 =?utf-8?B?YmFEaUc1RWRLNlc5OUwzaUNoMEZQT0JWakhGSS9hZVVsTlZ0UWFGam9sSG1q?=
 =?utf-8?B?Tk1xa1dqL1NrNmxhcmorZEFSYktJYlltY3E1Q0dueXBJbmRVT1FsZTdrNFJY?=
 =?utf-8?B?UGNyZkZYVWMxakJWcmN6VUxrTHZNcXZLTmR2bkdlOVVhQ1cxWEh5K0JYYXhK?=
 =?utf-8?B?WjNJQmE4dVV0aWt0YVV1dnBRRlZweWFBS3U3WjVIU3BCeHFtMG1pS2tNOHNR?=
 =?utf-8?B?cDhkaTlXZEpYU01hZVhsYXFJZ08zZDdiVGJwWWlmS3pnWXN3K2p6bG96N0Fj?=
 =?utf-8?B?enpiVG1BOElsU1BUMHhReDVuTkdycVRYZnNGQ2ZsVTVURjk0ZHJoMjJkcGJT?=
 =?utf-8?B?ZEVZaUR6Z1M5VDB2anoyVzFIRzJCS0dIaXRoZ0pQV1hnNnp0UWJaYTFZbEpG?=
 =?utf-8?B?cFpTMHNXVGxidzBMSGl2WXczem1SNHJrTVhZbkdabjVyUjZVUTFuc1dhR1RE?=
 =?utf-8?B?T0ZUeGRSSjZFNHdSd3U4akM2Y0cxemNqVWxvajl0NmpEb3ZpYnFJbHdaMHA2?=
 =?utf-8?B?Ylg3U2VSZkRiemsrYk5tK0lpcGl4c1QzTkxGS0U2TE5rLzJtajVRa3NxY1li?=
 =?utf-8?B?dEZPVjZNc3k5Q2JvZTM0a2pkb2l0UStCWnRjVGhRbXpMNzFkd0pVWWlWQURj?=
 =?utf-8?B?Qm96UUtzREt5dEZzQ2RHVkJuemVIeUFOdkNjUTREL2ErazRIOWlPNVdRZU4w?=
 =?utf-8?B?c2k5SzZBTGdPR2Vxdk95ZmxhNHhRUkMrb3QzOXpJMHpHTi9XYkduUG9LU0Qr?=
 =?utf-8?B?Y05QNmFRbXZJUmVnelRuYklkOU13RWhERnhwbVp0ME5MRjRINHlGVlFUSWd3?=
 =?utf-8?B?dUhpNmVJMll0MVg5ZWNtTWI3bUt0M3FSSmNmNW0rMWcvcytMQjhvQmZhdkVS?=
 =?utf-8?B?NTZibmVWcGxEa0t4bmZaTHNta3VtTTAvaXI0UUY1MFJLa2NNa2w2dkF1VURn?=
 =?utf-8?B?MW1pMzdjVHA4RTFES1c4M0tyWGl1ZjhFL0VJbVVkWkQ4MXU0Nk9qYm1UWUVk?=
 =?utf-8?B?blNtSUliNy9wTXhUd3lGUG11dWpHQlZsQmE1NGZhSEVRTThNY1RkK1AvWlU0?=
 =?utf-8?B?Ui9OMDR3VS9ESGdBYTA1RDJwUnQvWS9FZW01NFJzV2tReFdmT01FeXFRbFI4?=
 =?utf-8?B?aFlIbXZxcWRvRkR0L004VkFUblhsVGNhOVQ2Q29xRzY4WGg0MGcweXJ5bXJB?=
 =?utf-8?B?QldabWkydlRTR3NJM0xGMmoyanptZnEzRFlyMkZvTUdQSGRDMWJuc0pNbCtN?=
 =?utf-8?B?Y3JyQkxIWGtpZTVNYnRiQWhzUmZOMzJhWUtubG50V215UHZOY2ExS1NVT2hW?=
 =?utf-8?Q?aWH1YgZtL5LK+LR3aJBreu9y2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86911ba7-1ca2-4da6-1ecc-08dc32658e33
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 22:44:53.9807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pMokAEuVckDtgx6TsqHNNTHjcWXvuDKrUlt6AhiQB9OmSetdkEGb2PvL1/1H+4vPbfIKj2yz1ZyS+4kG67W6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
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

On 2024-02-20 12:16, Hamza Mahfooz wrote:
> The "abm level" DRM property is being dropped in favour of a sysfs
> interface. So, change the ABM test to use the new way to set the desired
> ABM level from user space.
> 
> Link: https://lore.kernel.org/r/20240216153334.83372-1-mario.limonciello@amd.com/
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 62 ++++++++++++++++++++----------------------
>   1 file changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 082da7ed6..e56000e02 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -35,11 +35,11 @@
>   #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
>   #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
>   #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> +#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
>   
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> -	uint32_t abm_prop_id;
>   } data_t;
>   
>   
> @@ -104,14 +104,22 @@ static int backlight_write_brightness(int value)
>   	return 0;
>   }
>   
> -static void set_abm_level(int drm_fd, int level, uint32_t abm_prop_id, uint32_t output_id)
> +static void set_abm_level(char *connector_name, int level)
>   {
> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
> -	int ret;
> +	char buf[PATH_MAX];
> +	int fd;
> +
> +	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
> +			    connector_name) < PATH_MAX);
> +
> +	fd = open(buf, O_WRONLY);
> +
> +	igt_assert(fd != -1);
>   
> -	ret = drmModeObjectSetProperty(drm_fd, output_id, type,
> -				       abm_prop_id, level);
> -	igt_assert_eq(ret, 0);
> +	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
> +		      write(fd, buf, 1));
> +
> +	igt_assert_eq(close(fd), 0);
>   }
>   
>   static int backlight_read_max_brightness(int *result)
> @@ -142,31 +150,19 @@ static int backlight_read_max_brightness(int *result)
>   static void test_init(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> +	drmModeConnectorPtr conn;
>   	int i;
> -	bool abm_prop_exists;
> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
> -	uint32_t output_id;
> -
> -	for (i = 0; i < display->n_outputs; i++)
> -		if (display->outputs[i].config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			break;
> -	igt_skip_on_f(i ==  display->n_outputs, "no eDP connector found\n");
> -
> -	abm_prop_exists = false;
>   
>   	for (i = 0; i < display->n_outputs; i++) {
> -		output_id = display->outputs[i].id;
> +		conn = display->outputs[i].config.connector;
>   
> -		abm_prop_exists = kmstest_get_property(
> -			data->drm_fd, output_id, type, "abm level",
> -			&data->abm_prop_id, NULL, NULL);
> -
> -		if (abm_prop_exists)
> -			break;
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
> +		    conn->connection == DRM_MODE_CONNECTED) {
> +			return;
> +		}
>   	}
>   
> -	if (!abm_prop_exists)
> -		igt_skip("No abm level property on any connector.\n");
> +	igt_skip("No eDP connector found\n");
>   }
>   
>   
> @@ -187,7 +183,7 @@ static void backlight_dpms_cycle(data_t *data)
>   		ret = backlight_read_max_brightness(&max_brightness);
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>   		backlight_write_brightness(max_brightness / 2);
>   		usleep(100000);
>   		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -218,7 +214,7 @@ static void backlight_monotonic_basic(data_t *data)
>   
>   		brightness_step = max_brightness / 10;
>   
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>   		backlight_write_brightness(max_brightness);
>   		usleep(100000);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -252,7 +248,7 @@ static void backlight_monotonic_abm(data_t *data)
>   
>   		brightness_step = max_brightness / 10;
>   		for (i = 1; i < 5; i++) {
> -			set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +			set_abm_level(output->name, 0);
>   			backlight_write_brightness(max_brightness);
>   			usleep(100000);
>   			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -284,14 +280,14 @@ static void abm_enabled(data_t *data)
>   		ret = backlight_read_max_brightness(&max_brightness);
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>   		backlight_write_brightness(max_brightness);
>   		usleep(100000);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   		pwm_without_abm = prev_pwm;
>   
>   		for (i = 1; i < 5; i++) {
> -			set_abm_level(data->drm_fd, i, data->abm_prop_id, output->id);
> +			set_abm_level(output->name, i);
>   			usleep(100000);
>   			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   			igt_assert(pwm <= prev_pwm);
> @@ -318,7 +314,7 @@ static void abm_gradual(data_t *data)
>   
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>   		backlight_write_brightness(max_brightness);
>   
>   		sleep(convergence_delay);
> @@ -326,7 +322,7 @@ static void abm_gradual(data_t *data)
>   		curr = read_current_backlight_pwm(data->drm_fd, output->name);
>   
>   		igt_assert_eq(prev_pwm, curr);
> -		set_abm_level(data->drm_fd, 4, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 4);
>   		for (i = 0; i < 10; i++) {
>   			usleep(100000);
>   			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
