Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D1CC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 20:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA40112013;
	Tue,  2 Apr 2024 20:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rwG8WIpe";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2130.outbound.protection.outlook.com [40.107.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5F7112013
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 20:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLOuFuhbxfeOXXMfTr8bdox/ZNe01CmZngzcHuDduhYYPUQ9QRzP/xlLO3p+9qVqsNm0ahgEArM0CQw+JK+Bcy23UIfc2ussr36ic/n4Qqmvw1mnuwwVa+nvcQp/zr+W0Sy7L0EVdaiVxUbJwT7/Yc6ZcO1Gu1rz7fx7yuVJ2ETUOEz2TqSmStBjqvS3GzaBwGNS68lJlGsvZep9k5AzL0/LVuEIlZzgY3UnFeXzJzDIJChv8Xv2Q4PH87KpslpetyfFjL/qnJ1gH0zCAx1OWeBzjroJf9sDmGtuX7739bWIDYnEO/Ojjd28+5C1uJ8QNZLhZCaGJrFohkyNF5ZB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4HcTuaEY9M6tC1fBiKks+CdKAOKazU9J4lziARYk7A=;
 b=Ch6D/fO9gquomCWkG97Hlu0ScsKcyx/u9TTuULewfX+EbjqX1ewbEgSapMhNKQd1waslbouAc/sZsQ03PurSriOlSXAkC5Hd+l+eST70PaNlsUFCGOrYSVM/H++jp1U//ze8GmBkjIQ84/cj+Bw2H6KoJdLiRr/kIg92S8cpK32dR/bTVG4+61NC+Tfld3nfykklrbEiVv2JqyR1OOekvd+WHATvrrbKBx2uwu7Jpqc1RgOySd1jTmzSpOOwCa3l9xTm6+jTqk0ZrDG3eXwaD9kf+/OW2pi+cmbBrPBKjX3FFrmaXE2zyIq9FOYBdMF75LOtgPHMvQtrzgCnN3KocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4HcTuaEY9M6tC1fBiKks+CdKAOKazU9J4lziARYk7A=;
 b=rwG8WIpeWbxPTjODRluyrrQgGgYMtAIOxZEWD/P+ekhXNdkb0MKwDnI+ff/vgYCVbAc3MPJADb8LAiqD7FN/VHZVeNjjPJZ9OHLZ1JI70gWOBLCBc0ReJBTtc8D+mqlQUidsYSriO32V/eYgWd0ag0Xkh5+elD4CXmu6HHDBDP8=
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 20:21:11 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::a084:ca6e:2c6c:1664]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::a084:ca6e:2c6c:1664%5]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 20:21:11 +0000
Message-ID: <2f3c2441-885d-4036-8ec5-bf0292a07615@amd.com>
Date: Tue, 2 Apr 2024 16:21:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_abm: Fix ABM level setting
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20240402075208.21223-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240402075208.21223-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::12) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|CH2PR12MB4311:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bzaddkqQf3mUEtIggWUxq8Levl/xdPCI6ELFolNMF5mDS0JZme+IBmzgYN/49yt7oP9wQIr/O8YO6WWX9pIz9ha08eHyGz7Fx4iolhNRaS0lM0GVTOFJ9QXcGCPwS4HBeDCC1OXtCAaBf2QwcBk+H5Lh9iKrmkRjYaLmoROPnqHVgDeG6Ohuk2BGwl9/3lOT9i7YkuI9/rMzdSmhEi9K3dl6d8BbCe7VNbumZLy3BKn9HMVzIa24n8jpRQqzCQtUuOqWxOEN1flvxc37qX12KOtU9JwDvVeofb29jnACo/uJ9LX1XGQiE3v7qgYA6xpk67KtRnAuOFHYc21JQUDCer5uG/ELeyzDBFp5HIQwV5ymJ0PnEHmoM5yRdCfcZSOuWhyBEPOoPJBoLwXdWOrVMS+4465QUNXWW0hP2tcGSHqkhUhVo64Uc4FdktgpdZ3zdoKwpi9tcIktgZPDju8KyiXQg/ol/il2xehbpwWHcg4PAA3m2VcJ88ER9Ba/6+DZUXmU/p29363+wPHZhtclwX3wfXReTKLtvGpYBMga/uuNgDgW79VGrPX/tNK9COBYVdXfsJV4jxTpFJcQNsh0of8at9qy2yz59EfEJsSXBkggFjBqz497JLeyXTJJPs1kWDm6mOm/cEfeojxXWbD67kk4DV72mKYXEntB8kMKqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJDZGF2N3pwYmVRSnEvZFBWdjhVTVAzZlgrQlRObjIxK0tkcGRPd0YrTzlR?=
 =?utf-8?B?TkxpdmRRaEliVFpLK3VkdG81bXpGaHdyTm0wRWRIQWE4NFJCSnRpNEFRUzNB?=
 =?utf-8?B?RFdzOWl2RjJrblpjVGRpQ3dQN2d6M3czNXR4ZUxKWHFLMFlQSU9BQ3hsTkdX?=
 =?utf-8?B?Q1RMVk9KSHA5VVNteTFuK0pyaXdrMWZhYkpSU3lETDV2VXF2RlJWZzRoRzcz?=
 =?utf-8?B?SGtLcDYwQll4aWRpYkM0dlNsL2poMWJ6UmI1RmE0K2VKVUp3bGtHamxqVm5a?=
 =?utf-8?B?VEdieWdTZU5mWTNSWjNxdmtKdVprYVVRTmhCdTc1akM2TkF1WFR0V1Q2L1Nt?=
 =?utf-8?B?UmR3Um9reUVOcDVSN2Nlc0JzbHpMYTFXQUJOMlNBRlJHTTUrVGZGWDZXTklk?=
 =?utf-8?B?NGdheTJwdWNvUlNZaDJwaFArWXByVTM2Zk1zMFo4anhOaHBycElzbXRVYjRH?=
 =?utf-8?B?akp1NnprM05HK2FmWi9idTh2Qyt2NURaZjZwNTFwK3kySTJqRzZNcldCN0JF?=
 =?utf-8?B?R29ZQ0l1ZXBRc1g4Y2J6aUl1bHlEbitkbFluWHgxL2FGVU5WZExxSmtQZU5U?=
 =?utf-8?B?dTBjcmJDSElXaVlsZHdxVmlHdXdYL2M4SFpvdkhUMXQvYWFENEZIa3NTYzNI?=
 =?utf-8?B?dUNPYmNvMzZnY1ZDVnMxWUR5b2E3SllldmRQOHI2QXRFaXlibGhpaHJrTEdX?=
 =?utf-8?B?UVoxZFpQZFNWZU84Z2hodzhQdXE3a3lGbGZzR0xyUy9mcUxKbStnak1LSEFZ?=
 =?utf-8?B?azB6RFptQUpEcU1aUXU2Wno0ZnR1SVNRaHVJNUg3RllkSjNQOEQweFA5MnY0?=
 =?utf-8?B?VU9Vb2toVFEwalFTM1lPUVlnSFVwVGFieDJOZEhFbzAxdXEvYmdVd0RaeXpW?=
 =?utf-8?B?Y09ybTNveFF3NmNOL0ZlZDdIWlJ6MGlseTZTQS9CQU54cm1kblprYmVnL2Yw?=
 =?utf-8?B?Z1Q4SlVnUGR1YlNaVW5EUEFXQU9vR1hDbEVOVXk1dmQvV1l2Q0NLTkJ4emhm?=
 =?utf-8?B?dlUyWWkraE9aQWJySC9iMCtqbjZIeFBPdm5GSFhsUVVsUkorUmYvYzFLTXdL?=
 =?utf-8?B?eUdXaDRpc2hlL1o1Rmtob2lwY2I3Mm5RYkJJbittVzhadm5RUHJUbU5vMTBV?=
 =?utf-8?B?TkMrbDZROHdYaU9SV3pmT2pGRUdOeDBmSDJrdHFrZUN1Q0FvUUNITlZqVkdz?=
 =?utf-8?B?MVVkQlhQNmU5bUFlZ3BONWhBcElQODZ2a0ZWak1VU2dSRk8zUU0rODIzd09V?=
 =?utf-8?B?SC9xS1R2RzlLbkwzNkVONm5VYlpKZVhkSEZxb1ZMMjBNSjVKVW1yWjRmSEJo?=
 =?utf-8?B?ZU9qREhJOHRtWXZVNTE5d3BjS1VYelZ0TGVvRVZGbS9FZ2VNa3NSWHVBUkFH?=
 =?utf-8?B?REU1bWxLOG9vaFQ2bzFrZWZEZFJVVEJXU1ZRSml5ejVXajFUdDUyVlAwR2lj?=
 =?utf-8?B?YVRGZUEwdWMyWjM3bzVMWTdza3NmSnowNVdDeFplTnN3RkkxcW1iclE0NW51?=
 =?utf-8?B?U2RabU5XS3lSaU5iVWlteU44Rnlmd1o4aDVPd3NaSmkxcEgyaUk0RTBFM29H?=
 =?utf-8?B?U3duYVk2Z1ExYkdEelpFcWVGeENCUkUvZWRnaXlCWmlsc05EOE1ONTA4WFdH?=
 =?utf-8?B?Z0pXRGdrSllKZTZVeVdJb1hxdXFSQ3M1SWRVam9rNGYxV2dUOWpmSlc0U2pr?=
 =?utf-8?B?a0hleTRqRElLOGN5NXZxcllrU3NzSXhTbzcrSHdJWU5acDIvaFM1M0pOaFFD?=
 =?utf-8?B?djNWSWxsb0plbGY1eVJMSHVncjRhWm1FdnV0NytIVmVnRWhKWm9xTjdIcHhS?=
 =?utf-8?B?TWhQcmRvL0tta1Z3SWJEZUtBb3VpQVdRZlVQS1BkcUZES0twb3dRSk4xUllO?=
 =?utf-8?B?OTJlbHR5Z1EwcWdncWNrZytoUFpPNTB4bkcxOGJnNjVZTGJycFFRTTJaanJG?=
 =?utf-8?B?Q0tENjZRR3dFajFBaFhtZnhTdVFocllHTzVtRUtlRlQwdENpVThWMFhiOEdW?=
 =?utf-8?B?L3NjK200TEpQUzY2MGQwT3Rqc090WmxveHNvTEFrd1o2VXljMS9Rb1FEdnZB?=
 =?utf-8?B?UCtyUWM5ekl4NXo0WXdZRm1SMzZMVmVvdjZ1TzRBQXZRY2RQNUtDQlBVTkZ1?=
 =?utf-8?Q?bDD6Qq0ItUcVuRhd02OBNXF5C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cdb513-f465-47fe-f224-08dc53527037
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 20:21:11.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9dmoKKs/aZvSazjKVmboPoodjp92TcR+2HMcUfCXQTOpFlM93bvicti0es1jl1PCilJ5AZv0DKv4wga9/YXBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
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

On 4/2/24 03:52, Tom Chung wrote:
> [Why]
> The ABM level does not take effect right after do the ABM level
> set.
> 
> [How]
> Trigger a full modeset to make new ABM level take effect right away
> by setting DPMS off -> on transition.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index e56000e02..24783fb57 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -104,13 +104,13 @@ static int backlight_write_brightness(int value)
>   	return 0;
>   }
>   
> -static void set_abm_level(char *connector_name, int level)
> +static void set_abm_level(data_t *data, igt_output_t *output, int level)
>   {
>   	char buf[PATH_MAX];
>   	int fd;
>   
>   	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
> -			    connector_name) < PATH_MAX);
> +			    output->name) < PATH_MAX);
>   
>   	fd = open(buf, O_WRONLY);
>   
> @@ -120,6 +120,15 @@ static void set_abm_level(char *connector_name, int level)
>   		      write(fd, buf, 1));
>   
>   	igt_assert_eq(close(fd), 0);
> +
> +	/**
> +	 * We need to trigger a full modeset to make new ABM level take effect.

s/make/have the

> +	 * DPMS off -> on transition is one of approaches.

s/of/of many

With that addressed:

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

> +	 */
> +	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> +			 DRM_MODE_DPMS_OFF);
> +	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> +			 DRM_MODE_DPMS_ON);
>   }
>   
>   static int backlight_read_max_brightness(int *result)
> @@ -183,7 +192,7 @@ static void backlight_dpms_cycle(data_t *data)
>   		ret = backlight_read_max_brightness(&max_brightness);
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(output->name, 0);
> +		set_abm_level(data, output, 0);
>   		backlight_write_brightness(max_brightness / 2);
>   		usleep(100000);
>   		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -214,7 +223,7 @@ static void backlight_monotonic_basic(data_t *data)
>   
>   		brightness_step = max_brightness / 10;
>   
> -		set_abm_level(output->name, 0);
> +		set_abm_level(data, output, 0);
>   		backlight_write_brightness(max_brightness);
>   		usleep(100000);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -248,7 +257,7 @@ static void backlight_monotonic_abm(data_t *data)
>   
>   		brightness_step = max_brightness / 10;
>   		for (i = 1; i < 5; i++) {
> -			set_abm_level(output->name, 0);
> +			set_abm_level(data, output, 0);
>   			backlight_write_brightness(max_brightness);
>   			usleep(100000);
>   			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -280,14 +289,14 @@ static void abm_enabled(data_t *data)
>   		ret = backlight_read_max_brightness(&max_brightness);
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(output->name, 0);
> +		set_abm_level(data, output, 0);
>   		backlight_write_brightness(max_brightness);
>   		usleep(100000);
>   		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   		pwm_without_abm = prev_pwm;
>   
>   		for (i = 1; i < 5; i++) {
> -			set_abm_level(output->name, i);
> +			set_abm_level(data, output, i);
>   			usleep(100000);
>   			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>   			igt_assert(pwm <= prev_pwm);
> @@ -314,7 +323,7 @@ static void abm_gradual(data_t *data)
>   
>   		igt_assert_eq(ret, 0);
>   
> -		set_abm_level(output->name, 0);
> +		set_abm_level(data, output, 0);
>   		backlight_write_brightness(max_brightness);
>   
>   		sleep(convergence_delay);
> @@ -322,7 +331,7 @@ static void abm_gradual(data_t *data)
>   		curr = read_current_backlight_pwm(data->drm_fd, output->name);
>   
>   		igt_assert_eq(prev_pwm, curr);
> -		set_abm_level(output->name, 4);
> +		set_abm_level(data, output, 4);
>   		for (i = 0; i < 10; i++) {
>   			usleep(100000);
>   			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
-- 
Hamza

