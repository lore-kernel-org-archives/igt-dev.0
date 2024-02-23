Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63717C5478C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 21:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3EF10ECD1;
	Fri, 23 Feb 2024 21:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0VqZ+OjM";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFA110ECD1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 21:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5UXlQFZBwTX4RKaq288eoGIsfEBuj8CDnWK0Wo4LzLHIOweWUsWXDyufFJsNFLpB8zWnFO2edJ5llucqUxzVn0J0neIFq7hOsIPfjek+RY1HtkV68e/68yqFvlUYm+i4bXzdbRqInbm/7PQEYEAP8UpuBAvFo3zl7pzJlkx0Q5CWjCpr96YbD/ic6kPCw7xgGBt/jIH1l0M1ZGCgXPkDf2v4Fs63jxvLBv+auOjVR31yWQfAyaCbYeG8TsLiw+C4xZyZcK7d1HtdC4cXo0ZKLiG83h/fBo100VomA5WyAUCqphaSJF6rw3fwVUg7Yabozq6sJpLgcXEpUmXk3ml6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VxI1OHRi8TAJn/j1R49mKK8MPL40IPkcCFDscmXHzc=;
 b=nEyZPtXgcJYQF+M58V2xmrKXIE8BgN12ju8cp2UEIW/16GlxVz+AjeQVJX798Uil22rsFmoQdeUt1EuhHg1KHmUrpHaAOBwoFp/0+EWKtpTZdw6vG8fhCucL88dnMkCuhGkqIy9HSpMgQnVVWkxXZ/3gsQXCsun53iG+WJOED7gCF466dpzSiOFrA8ohKpl+QyjYceFONXZKvPwG8aVb4vMulLqKFqqqJrbevDFW31Y9JbaMNEwjlmf+kl55oKlBR7v1CySQWyBH4TJH5olfwVm2ABM/P0BJYitOwre1RMpW7cv/A9BbYDdWsPidgUUub++aIg886J+oCdrkH5AOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VxI1OHRi8TAJn/j1R49mKK8MPL40IPkcCFDscmXHzc=;
 b=0VqZ+OjM02dC04ijyHYk1lW5BhjmWsSIaEZCi9seYvVx3Y2lDTCtSzkiQPDA/DDYPTt29rC2Ndk1ruj98xoqA1N6qr7tfW2iAQj2y+7ZkvIQlIZcCejl718NSjyOh4Mh03uJYCOFTfmlP853/Hp1kvfdrNGNnwOQQp3h381kwTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 21:47:06 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9%7]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 21:47:06 +0000
Message-ID: <302182cf-58bd-49d6-921b-b08fc36c318d@amd.com>
Date: Fri, 23 Feb 2024 14:47:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: refactor the ABM test to use the new
 sysfs interface
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240220191625.27749-1-hamza.mahfooz@amd.com>
 <20240221091256.fvg2sjskk6lqvzkw@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240221091256.fvg2sjskk6lqvzkw@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0091.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::28) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: d998ca94-9e41-4e60-2219-08dc34b8fadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9dvhk3ix9Q44J9QIS0yP2sqa/3MhClJTsNHlzogWmPhv35J5xX/2LrrRljM+plPk9etaECgN7VlDVdfzXNfkqnF8NMSMQHf2u9hVe0bWvqZKjJoAlLSDiWiqHC8V2KkoVRfvPqLK/CNyJejjS8Er/gqDLcvegOWWpSYqWsCMpnLSM5f8upDdo4y9F2CBrz6Gj/wjoJHkRkyrMRU5P2MdZkH5BHVHmDByvhxgXU2KryN4xMHgfc5jyyGfTQncOBmv7Jh5Rw2NV5nQUtb0Fazh7ieZqfP/nWsAQjinSwsaXp8yzVEM0jgyUIJTJuAMXbvpZT49jEzQms2dG8bHHAE0/6uyLPk8P7NbZH32NU8z2loGbFtUni6XlylvL26DsZZ6NZEa2OSDWb/3n1UIMHGnYDz+Lqf2vH/N/Yg4WFD/11Gn0ML437e3VagjyMXTdKA0Eu+b2WYKcTL1qKOwfjiSi/jYHRbkGutIAndH8hrRzS342nFBfE5PQrkzw2sTCt1BJnSE3DTW7kyiirhoAqPxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2w4TExrSTdFOWhxa1hIazN4UlE0MGNCRkVaMmw2eDJyeFpCamZDYy9IejN1?=
 =?utf-8?B?YldRRjlFQlNta0VZd3N3RHowelJHVXgyVEhKQnRBWW9QYi94ZHJBMkhRRjFu?=
 =?utf-8?B?ZWJYRU16Q1g1cHJqTVA5WlNtWEdpaWZUcVUrM2RoZnJsSGo4S24xYUdvWFdy?=
 =?utf-8?B?Tm5OUVdIbEU1c1I2REs1UkZiTFoxcUpZU1daZXRjOVducTFkUXdFaWhwWGla?=
 =?utf-8?B?TkwyVTEyaU43dTlVekExYU40ckJBN3FvTXREcWhhV1R0K3FJQzliVkR4c1hL?=
 =?utf-8?B?bmZCNTUzdzZZSEpSMjI5QkYxNXRhdE1aZDNLV09adXlZQUhENWJDTnYvN1Fo?=
 =?utf-8?B?c2FYQ3hyVEpDRnZLZzFYbnU4dzZQQ0dlTCtKTU9MYWtjdVpiUUUyMVpPMWpy?=
 =?utf-8?B?T2xKdmVGcktJMXpWZ2VjOEg1aytZMk9jVU5LOW9JRmJEUVlaS1J3VnR6ZUN4?=
 =?utf-8?B?R0R4a2VxSk91cVVzejFpMWUxMnJneFRLMEhhNktqQ21EMC9JZFNnZ0tnQkZK?=
 =?utf-8?B?UGdWLzRBLyswRWR4QWNFM0o5STBDK09rajBqQ243TTFSNEZSUnMyL1RXaDVW?=
 =?utf-8?B?OEk1RG1pUVFzTlZ4RGVwNGRjdUVJWi8yVWIxcEpSbnhzcGdGT2FkZEt5RUxm?=
 =?utf-8?B?RHc4UzVnMUVORmdvaHVodWZWY3ZWV3ZCeEg1cER2dEZXQW1ETzJEdkNkT1pW?=
 =?utf-8?B?ZW5CekhndXViRVlPS0Q3VTR2bGxwSGZHbkFQWmQ1T3VYRCtNUURNMENVMDVZ?=
 =?utf-8?B?RS9hR3U0WUp4QWJkbUlVM2MrSW4rYURsL3drRTFhN0M5TGNDQXRCd0NvOWdq?=
 =?utf-8?B?a3RwV2prTzB1eHN3c1VkTnh3K0ZMZFVKcFZQRmV4QmdSOVZZbENWNW9uYUoy?=
 =?utf-8?B?Sk9HWHQ4QmUzTlVwTUZrWWNMYXdyZVduNHFRcWszbnpwV2ZVbXliNjk0MlZs?=
 =?utf-8?B?R29BUlpkdVV5a2sxWTZHRDVOTVdxYWdOOUNzcGJvLzhmSFlDUWhFQWkwZGJn?=
 =?utf-8?B?SXBUOG9YSmNaUElpVmcyZDVxRUNJZGxKTExiZXFFNjlYOUFFL2V6SFJ2NCtB?=
 =?utf-8?B?UEhqclRDUUJVd2taMXF2dTAxQWs5TXVQYi9aK3dFSlFSK2xMbHFGdmdpVktt?=
 =?utf-8?B?aVRYdnJNTUVKbXBmZHFrZ1J0SDVFa2FVWmtuYnJVQjJ4Q0p0WHdYSHM5bllR?=
 =?utf-8?B?UTBlWnZIRDVjZmMxcWQxUy9DSW1TU0piM1NqRW1SMFVxeVRLSktma2duODUy?=
 =?utf-8?B?QjJwUjBBUGJTWmxxUU1QTU44N050MGpBNTVKaEs2UUFhRWpRZnl0dlIzNDR3?=
 =?utf-8?B?cXl1YmtySXpqeW5lcjlLYVRaaTBtcThVSDRSeHdVSld5TzBnQVZWQmFWM3dD?=
 =?utf-8?B?RFg2RlpVeGwrTjlCL3dLMGt2S0dHak42alVDUDB4Y2JQSC9UY3laQjVlcWRZ?=
 =?utf-8?B?SVJoNkhCZEF3eXlOaHVtSkpxZzlGZzFlcGxWSE5wdUVoTVI1djNtdjExOFZX?=
 =?utf-8?B?OUpsMStKbk0xbHllVXZTVy90Z09acFdRWTAzMkR3bkpjbjFjRlA1Tmd0Ukhz?=
 =?utf-8?B?SEVRTkhua0JYRHMxTU82M2owQ24wTVlwNHRWYW5udWx0U1B3WmJlWmdhVmZT?=
 =?utf-8?B?U25FeTFPdXNaS3AzbGVSaTJMK3ZERENITng3Z1VyU2FSQjlic0x4QUJtSnhM?=
 =?utf-8?B?OTd4TVIzazhqai9FRHc5K0ZwRThNWWkzYWIrSVord3ZWeDI3UWgvR28yVzFY?=
 =?utf-8?B?ZEFRNERyTDdzUUtwMlIyQmx6Y1Fqa0U4SVEwSERETzkzUi94NDhQcWtyeXFF?=
 =?utf-8?B?OGJQN3F4NlJGVFNaeExEVXF1ZERYZzlQYi90bG5yanpnM3BzcEZxaUZUUkFR?=
 =?utf-8?B?aXJhM1dDSnF0OFRyR2Y0RU15blJ2NDh6Y1Y2a05NcEhBNVhMUWNpNVR3UFVl?=
 =?utf-8?B?a2xBVVlBaFVlT0xzNVl3ZjlYeklQRFhiU3NPNERPcXlJSm1GeUQ2ekhwenJQ?=
 =?utf-8?B?VkpKYW4wUUdkOEhlaHEzK2lPSjRqL2tPZkVaUXVMRjkxN0xuUnBKZzBsT240?=
 =?utf-8?B?dXRoa1BSU2hkN0Q0WHd2R05VQ1l3aWVGKzAyYmxkcDMrRVNFNXNvTmVSempQ?=
 =?utf-8?Q?UYpj/3Foxg2jzAfnXlZD1Tm/+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d998ca94-9e41-4e60-2219-08dc34b8fadc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 21:47:06.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+DmVPLn/vr2D0y3EQwty9Zt3NBI431pqf9e3doZOdEL7yHe8zLdI2AALIAE4IrJ5MwoSPMKT3vZGuBojPO36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381
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



On 2024-02-21 02:12, Kamil Konieczny wrote:
> Hi Hamza,
> On 2024-02-20 at 14:16:25 -0500, Hamza Mahfooz wrote:
>> The "abm level" DRM property is being dropped in favour of a sysfs
>> interface. So, change the ABM test to use the new way to set the desired
>> ABM level from user space.
>>
>> Link: https://lore.kernel.org/r/20240216153334.83372-1-mario.limonciello@amd.com/
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   tests/amdgpu/amd_abm.c | 62 ++++++++++++++++++++----------------------
>>   1 file changed, 29 insertions(+), 33 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
>> index 082da7ed6..e56000e02 100644
>> --- a/tests/amdgpu/amd_abm.c
>> +++ b/tests/amdgpu/amd_abm.c
>> @@ -35,11 +35,11 @@
>>   #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
>>   #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
>>   #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
>> +#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
>>   
>>   typedef struct data {
>>   	igt_display_t display;
>>   	int drm_fd;
>> -	uint32_t abm_prop_id;
>>   } data_t;
>>   
>>   
>> @@ -104,14 +104,22 @@ static int backlight_write_brightness(int value)
>>   	return 0;
>>   }
>>   
>> -static void set_abm_level(int drm_fd, int level, uint32_t abm_prop_id, uint32_t output_id)
>> +static void set_abm_level(char *connector_name, int level)
>>   {
>> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
>> -	int ret;
>> +	char buf[PATH_MAX];
>> +	int fd;
>> +
>> +	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
>> +			    connector_name) < PATH_MAX);
>> +
>> +	fd = open(buf, O_WRONLY);
>> +
>> +	igt_assert(fd != -1);
>>   
>> -	ret = drmModeObjectSetProperty(drm_fd, output_id, type,
>> -				       abm_prop_id, level);
> 
> Keep in mind that you replaced drmMode...() call with new
> debugfs (or sysfs), imho this is not the same.
> 
> I will merge this if this is ok, Alex?


Hi Kamil,

Yes this is okay. Thanks for help.

Cheers,
Alex

> 
> Regards,
> Kamil
> 
>> -	igt_assert_eq(ret, 0);
>> +	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
>> +		      write(fd, buf, 1));
>> +
>> +	igt_assert_eq(close(fd), 0);
>>   }
>>   
>>   static int backlight_read_max_brightness(int *result)
>> @@ -142,31 +150,19 @@ static int backlight_read_max_brightness(int *result)
>>   static void test_init(data_t *data)
>>   {
>>   	igt_display_t *display = &data->display;
>> +	drmModeConnectorPtr conn;
>>   	int i;
>> -	bool abm_prop_exists;
>> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
>> -	uint32_t output_id;
>> -
>> -	for (i = 0; i < display->n_outputs; i++)
>> -		if (display->outputs[i].config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
>> -			break;
>> -	igt_skip_on_f(i ==  display->n_outputs, "no eDP connector found\n");
>> -
>> -	abm_prop_exists = false;
>>   
>>   	for (i = 0; i < display->n_outputs; i++) {
>> -		output_id = display->outputs[i].id;
>> +		conn = display->outputs[i].config.connector;
>>   
>> -		abm_prop_exists = kmstest_get_property(
>> -			data->drm_fd, output_id, type, "abm level",
>> -			&data->abm_prop_id, NULL, NULL);
>> -
>> -		if (abm_prop_exists)
>> -			break;
>> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
>> +		    conn->connection == DRM_MODE_CONNECTED) {
>> +			return;
>> +		}
>>   	}
>>   
>> -	if (!abm_prop_exists)
>> -		igt_skip("No abm level property on any connector.\n");
>> +	igt_skip("No eDP connector found\n");
>>   }
>>   
>>   
>> @@ -187,7 +183,7 @@ static void backlight_dpms_cycle(data_t *data)
>>   		ret = backlight_read_max_brightness(&max_brightness);
>>   		igt_assert_eq(ret, 0);
>>   
>> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
>> +		set_abm_level(output->name, 0);
>>   		backlight_write_brightness(max_brightness / 2);
>>   		usleep(100000);
>>   		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
>> @@ -218,7 +214,7 @@ static void backlight_monotonic_basic(data_t *data)
>>   
>>   		brightness_step = max_brightness / 10;
>>   
>> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
>> +		set_abm_level(output->name, 0);
>>   		backlight_write_brightness(max_brightness);
>>   		usleep(100000);
>>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>> @@ -252,7 +248,7 @@ static void backlight_monotonic_abm(data_t *data)
>>   
>>   		brightness_step = max_brightness / 10;
>>   		for (i = 1; i < 5; i++) {
>> -			set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
>> +			set_abm_level(output->name, 0);
>>   			backlight_write_brightness(max_brightness);
>>   			usleep(100000);
>>   			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>> @@ -284,14 +280,14 @@ static void abm_enabled(data_t *data)
>>   		ret = backlight_read_max_brightness(&max_brightness);
>>   		igt_assert_eq(ret, 0);
>>   
>> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
>> +		set_abm_level(output->name, 0);
>>   		backlight_write_brightness(max_brightness);
>>   		usleep(100000);
>>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>>   		pwm_without_abm = prev_pwm;
>>   
>>   		for (i = 1; i < 5; i++) {
>> -			set_abm_level(data->drm_fd, i, data->abm_prop_id, output->id);
>> +			set_abm_level(output->name, i);
>>   			usleep(100000);
>>   			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>>   			igt_assert(pwm <= prev_pwm);
>> @@ -318,7 +314,7 @@ static void abm_gradual(data_t *data)
>>   
>>   		igt_assert_eq(ret, 0);
>>   
>> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
>> +		set_abm_level(output->name, 0);
>>   		backlight_write_brightness(max_brightness);
>>   
>>   		sleep(convergence_delay);
>> @@ -326,7 +322,7 @@ static void abm_gradual(data_t *data)
>>   		curr = read_current_backlight_pwm(data->drm_fd, output->name);
>>   
>>   		igt_assert_eq(prev_pwm, curr);
>> -		set_abm_level(data->drm_fd, 4, data->abm_prop_id, output->id);
>> +		set_abm_level(output->name, 4);
>>   		for (i = 0; i < 10; i++) {
>>   			usleep(100000);
>>   			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
>> -- 
>> 2.43.0
>>
