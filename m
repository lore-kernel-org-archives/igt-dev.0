Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6C0CD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F99110EC22;
	Tue, 23 Jun 2026 17:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kLAVi9Dc";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012042.outbound.protection.outlook.com
 [40.107.200.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF1410EC1E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm+NPPKNIikksJbkIB9gEV0/r070qfnBr/WTKkw7Sxv8r1ko0vpvQL2ecZ7nQ4r0R93hWshRFp9OauD6aF+2GifUgPCgWp11LVfpKx5ZBioMzIOT8JUwdxIg1gzR3sf5p/IegtILuxE6/Y3b4e0xkKxLuXAAxnxFuOdK07sAOnUE8JfvCq8h6VW/SoAk7rSbBO9z0m0T/wNAvojw/faU2KYQskV97Qt1LaDu+uXZ1/x615CT0jX2B/Bsq48Oaq9bTWMsFJiAjZQB4VP/VOIJdLh1+sS+TF/0dqt9pdIvIoqJdm5s9OxdCqUhxsOJXONjJ+F5mP3MVKoHNGPRpL9g6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VfHCYUAsekR70gm4F4FX7e/kF/80FCEvwaG9oUF9kk=;
 b=V2UuDHXX5/M6zqvCgBhd6kKy+M3cEOidO0cyZf3MzeCdVMmA/qov7FQQdjD14kJk5FvWR9KFc0BKbYD+f9Vl1fB1Em2KmFFAP7nIaX7bJ8O82wgnpUNdClq6MtdMrhOX5B6w/iVLXuhgylLzuGuvFtJD/vy+vripoS3k4Gl3F92Ud5NbaoUU9GmgCTZe9TRWblwOn5cvQ5SZZXmieBSo16YZWuoCYNpSvFW7eeq/2Gd4XLdJxetJkBD6a9PNZhg2a5HXKwlj/Fezpg8OyXnbyecUZ5Y3yk04fN/6OWKyTeLNsE0LaupCn7Iu8dNLGR+CSN6KYPiWSlx2LU11RSl7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VfHCYUAsekR70gm4F4FX7e/kF/80FCEvwaG9oUF9kk=;
 b=kLAVi9DcYk9/X9waEeWQAhR03E+smCHsn1JqEGatXglxkoybhmhNlDfvVjOGMmpCAXAyhBplZ46MdSyzxSpdw4HF038kdQG4Nr/nKUbf4VPfVLN6h4LvNrRfsr8F7ePtpQ9v2G8GQUTHui+dXwrUqbwoDvbAyUGP9JaicwpjZ6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 17:18:04 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0159.012; Tue, 23 Jun 2026
 17:18:04 +0000
Message-ID: <18e2630f-dffc-4759-be3d-158ae33dee64@amd.com>
Date: Tue, 23 Jun 2026 11:18:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: Resolve DRM card index dynamically
 instead of hardcoding card0
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com, chiahsuan.chung@amd.com
References: <20260623074749.13734-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623074749.13734-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 281f9142-6eef-4445-1305-08ded14b62a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: FFSP7QUEwJ3cjF3qlrHzNSDmKyyPFUaD3FkXSnRPpitT4w1SG2Af7vV25VTEaUCIYl5EC2c/OcphQwCFG1SYRnJ9gpqH/FKP8eb4FgDSHc7EoC70XXxO1IpCnNgEUPCrdEjky+LBYnqs77un6skivdl5VkPjuX8nRM9xmHW1tVeK7Lrpw5QBAqn5nglcbMxCVlmyIdo/i+3TNmm+73ZEEnawhU3E7ZBwEWHmjXcFqVHh1FsJiwYeHGax7SJBd/Ye4zzgdzdEomWdUgmMXz2mBHSnLWZ2TOh11/iupN2LL5nhxJ1H0dWe7Rfu0GYhiY88yVUvegEt/cqQeiCWj1jwOmMMw4ILV9tG2qCGqUbf6DeWKvtU8lNu0KQRIPrgmgiOvpx5G5ImgYVCJEzlWRPl1YVpRb0/ZWojdGTPpZzGfkZRX6LwTxxYz+W1LrU8NXJFXKSXSe/OAfpm7A1KEllQW/vqxZe3pzTiCL3Z1gM0e26fSB+JQODMMee7+6ezHEBVyejrY9sdR/SNQU/0WbHt/s9cmvR4upTFjRnrEtAE/Dwu1INIFNnAIk2mTYSy3Q8kwbf6DQV9Js8BV+m9VOoNnIJqbijaak3LDTOiCcPNOxLBD5ox6M2BoXjYPEUm2j5jF2Kob5/CBdDwaut95xb4uJMdS6IKFZmc95zYWnD1WL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1NrZXBzQnluYjJoTE52RDl6QS9IVXo4NllwRzl1d1NQRTFnMWdqaC9Hem9J?=
 =?utf-8?B?MEI3bnRjb3JCSmNPbGpMTXBGQjdQQjJ4NWlCM2trRnFweFpmY0UwUUxqM0g2?=
 =?utf-8?B?b3MxOGhOY1BLLzJwZ0MzREtXSTJhbS9KYmZ4UnorZG1EVnEzejZpZ0Jta2k1?=
 =?utf-8?B?RzV2RXVhZnZML1Fndk8rTERFeDdkUVRMS3h6VUo4dEYvQ2k0OG5LZktqZkNI?=
 =?utf-8?B?U0JGU3dRdFhsQk11dk1NSWw3N082N09qTG5zbTVTam1mak8zcTUvQWFYZ2VW?=
 =?utf-8?B?dWtLaEVXRmlqakIyRU5wWlZKNkZGTHk2REs4dzJjMmxGUmZ5MVlRZFc5VXMv?=
 =?utf-8?B?QlNEQjl5UXFJVFRDZ3FhZ2UvS013ZDBtakR2L2trSjV2dG1Hck1JeE1jK09q?=
 =?utf-8?B?czhOLzdxS0ZkVDVzemlCemoraE54THh0Ti85b3JVOUhEYW5aamlOaHNLcTIx?=
 =?utf-8?B?YkRqaFV6Tk9WWjlXREtZZFBEUzgyVU9ySUFDMTNJV0hqZlNhNHhpSkZyTUFN?=
 =?utf-8?B?TGNrUDdUNFY1Q0FGclhCTGQ4TUVVUHRuSVdQY3lENEphSFJXcWo4WXBpa2lv?=
 =?utf-8?B?VnZiK1kzRld3SXVQS3VBQzRBaUtUblUvSjdnZ1lEaHNMeFVHUXY0cGZaTjNm?=
 =?utf-8?B?ZVBiaS8wNXpJK2FtczNhRTROVUMrRFJ0RUJ0bGREbCtkRFR2OVVWbTY3UmxH?=
 =?utf-8?B?NDlRMEdGZTBYalVGT3o0SlpkdDIxaDlaaDJ3OHoxbHpWZEhId1V6dVN6Ulo1?=
 =?utf-8?B?K1luZ3A2QmVvTjBkc3NvUGJsVmVxeXZNSEQ3cFlqN0htRXZRbDU2V0VJMit4?=
 =?utf-8?B?Z3g2NUxpZyswOHA3aFg5d2RLWmUra2lLaTlnQXl0TG5QaWZ4bkVLUXQzWTRX?=
 =?utf-8?B?SzhGQlhmR0RBOXRkSXd5Q1k4M1hRUTBPVGVIRmdNcTAxUGF0Q0FseS81Q0xJ?=
 =?utf-8?B?eU5jMkVYd0FVWWxPV1h2M1g1WktsVTRhZkpqSXdxVmVMaDJoS2VZajI2WnlX?=
 =?utf-8?B?SktDOFlBaytXUmZqZG9rcHZqMXk1WEljaXZoN0ZDVzFIZlh6Q1RvWk56YStQ?=
 =?utf-8?B?ckFGUDdGdHFnc21hRVlMek5rSjFWUDBFdEZQMHR4NG9OT3N3M1dwbUt3Wm5x?=
 =?utf-8?B?Z2dkR1I0QkRFdndoY1NMdkhkaW0wYTBrWUwrR0pSNWw1R0dBNnN5SlJqTmM0?=
 =?utf-8?B?U05PZ0Y4YU5LN28zbHNRNE1oNFlSUU5udUpXUHNoSjZzR0I2Q0xYTUQ1TkN4?=
 =?utf-8?B?S0tUK09NR0NyTC9oNDZQVTZUYW9VOFdmdE9aRCtRWThyb1ZwU1ZwZGFWR1FM?=
 =?utf-8?B?UFlsdmV6c2RPSG9lTGx2bjVpT1ZpNUZxTTVkOE9SUGtldDc0TmN6Z3FWOG8y?=
 =?utf-8?B?eHQ2ZGtNRFlzelRDeERnWHV2VWRkVVVsbkduc29OY3RLQXFkSTdWTXlFU3ZE?=
 =?utf-8?B?eWVUbHNhekt2TUNYTEFlVHJtOG5qcEkzaXJtcEhydnFnS0hidGIzZzZheHB1?=
 =?utf-8?B?YnZGdFNibmlqcnQ4Nm5ZdWE4eGhESXQveW9iZk1Kejg3NHUvT0ZSS0I4K1pz?=
 =?utf-8?B?WjQwdElhdExKazd3UDJwRkY5VEgrWUpHZEVPOU9RbDZ1Wmg0Ykk0MW9YN29a?=
 =?utf-8?B?T0MyeFJsb1VZYytZUzZSMzVQVnh0bDJ5RTBvWUVVbG5iQ3p3a1R5MDMzMHdz?=
 =?utf-8?B?VVp5aXo0S2UyRHZYS2Q2dGlUNGtiQ2ZaMHFxMXRyN04rcjF3S0lBSEw4Wkoy?=
 =?utf-8?B?U1JMVWpIa3Y2WWdvRlA0c1pSNHQ5UDJtVEZNUW52TzNxeWxRRWhnK1lzSXdN?=
 =?utf-8?B?T3lrb0g4ZnhnRDBna3g0L3NWUy9XckNrVjRXRXJDakFiQTZnMWMrblMxNjFK?=
 =?utf-8?B?TlF4c1Z4aDNTR2NWcGs5dGVUSDdFYzVxVW1VSnpRelVWWlZZMVliL1A3a3N6?=
 =?utf-8?B?cHRpejdMVVZLUjhrc25jMzhRWFVZcTV4bzY5K1hBcHVYUzAvRlhLMlN2V3Yy?=
 =?utf-8?B?d2VUbW5UeHlNSnBaSEVycGFnSUYvYTRCVGZXYmpoT09LeHNtdThGc2lrbUNp?=
 =?utf-8?B?ODB3YjQxQmxiUGpwYmEyRnIvM0cweUhyQVR5dXB1eWswY0JQM3dzcGxjSXB3?=
 =?utf-8?B?bFgyWi9IUXA5TmNYNEtOLzJLRWxGbHFPMkp0bGpuWklnaEhFc3JrUmZ1WlEz?=
 =?utf-8?B?UWpBU214WFNYa3p4aXNXRDNOTHNBZnA3T2RnbGk0ZUp1YXA5ODBCQjVsbUxL?=
 =?utf-8?B?VUdyU3pHTWNZZFptY2hUdUtDeXpvSHJJaWtrMlFNdGdEWFFuUHMwNHVxUVpq?=
 =?utf-8?B?d1dnL2dDRU1yck5jRDc5NXUyRGltSEhhMW9OcVAva2tqQXZmeVZmUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281f9142-6eef-4445-1305-08ded14b62a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:18:04.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtS3OuluWy4yJ6hgISW8hJZgmB9UKnCkHZ9eoRvMJI4P6YuYSBXBA03UXH5B/qfo9qtK1ucBN6iozveVgFz9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090
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

LGTM.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/23/26 01:47, James Lin wrote:
> [Why]
> amd_assr and amd_abm build connector sysfs paths assuming the amdgpu
> device is card0. On systems where simpledrm registers the boot
> framebuffer first, it takes card0 and amdgpu comes up as card1.
> Since DRM minor numbers are never reclaimed, amdgpu stays card1 even
> after simpledrm goes away, so the hardcoded "card0-<connector>" paths
> do not exist and find_aux_dev() and set_abm_level() fail, preventing
> the tests from running.
> 
> [How]
> Open the connector's sysfs directory via igt_connector_sysfs_open(),
> which derives the real DRM card index, and access the AUX device and
> panel_power_savings relative to that directory instead of building a
> card0 path by hand.
> 
> Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/amdgpu/amd_abm.c  | 27 ++++++++++++++++++---------
>   tests/amdgpu/amd_assr.c | 26 ++++++++++++++------------
>   2 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 207d075b0..ba90344d3 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -35,7 +35,7 @@
>   #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
>   #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
>   #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> -#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
> +#define PANEL_POWER_SAVINGS_ATTR "amdgpu/panel_power_savings"
>   #define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
>   
>   typedef struct data {
> @@ -252,14 +252,23 @@ static int backlight_write_brightness(int value)
>   static void set_abm_level(data_t *data, igt_output_t *output, int level)
>   {
>   	char buf[PATH_MAX];
> -	int fd;
> -
> -	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
> -			    output->name) < PATH_MAX);
> -
> -	fd = open(buf, O_WRONLY);
> -
> -	igt_skip_on_f(fd == -1, "Cannot find %s. Is it an OLED?\n", buf);
> +	int fd, conn_fd;
> +
> +	/* Open the connector's sysfs directory via the IGT helper, which
> +	 * derives the real DRM card index instead of assuming card0. On
> +	 * systems where the amdgpu device is not card0 (e.g. another DRM
> +	 * node grabbed card0), the previous hardcoded "card0-<conn>" path
> +	 * did not exist and panel_power_savings could never be found.
> +	 */
> +	conn_fd = igt_connector_sysfs_open(data->drm_fd, output->config.connector);
> +	igt_skip_on_f(conn_fd < 0, "Cannot open sysfs dir for connector %s\n",
> +		      output->name);
> +
> +	fd = openat(conn_fd, PANEL_POWER_SAVINGS_ATTR, O_WRONLY);
> +	close(conn_fd);
> +
> +	igt_skip_on_f(fd == -1, "Cannot find %s for %s. Is it an OLED?\n",
> +		      PANEL_POWER_SAVINGS_ATTR, output->name);
>   
>   	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
>   		      write(fd, buf, 1));
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index 71209e79f..ae8420183 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -63,25 +63,27 @@ static void test_fini(data_t *data)
>   static char *find_aux_dev(data_t *data, igt_output_t *output,
>   				char *aux_dev, size_t max_aux_dev_len)
>   {
> -	char sysfs_name[PATH_MAX] = { 0 };
> -	/* +7 only to get rid of snprintf_chk warning.
> -	 * Path name cannot exceed the size of PATH_MAX anyway.
> -	 */
> -	char conn_dir_name[PATH_MAX+7] = { 0 };
>   	DIR *dir;
>   	struct dirent *dirent;
> +	int conn_fd;
>   
>   	aux_dev[0] = 0;
>   
> -	if(igt_sysfs_path(data->fd, sysfs_name, sizeof(sysfs_name))) {
> -			snprintf(conn_dir_name, sizeof(conn_dir_name),
> -					"%s%scard0%s%s",
> -					sysfs_name, "/", "-", output->name);
> -	}
> +	/* Open the connector's sysfs directory via the IGT helper, which
> +	 * derives the real DRM card index instead of assuming card0. On
> +	 * systems where the amdgpu device is not card0 (e.g. another DRM
> +	 * node grabbed card0), the previous hardcoded "card0-<conn>" path
> +	 * did not exist and the AUX device could never be found.
> +	 */
> +	conn_fd = igt_connector_sysfs_open(data->fd, output->config.connector);
> +	if (conn_fd < 0)
> +		return NULL;
>   
> -	dir = opendir(conn_dir_name);
> -	if (!dir)
> +	dir = fdopendir(conn_fd);
> +	if (!dir) {
> +		close(conn_fd);
>   		return NULL;
> +	}
>   
>   	while((dirent = readdir(dir))) {
>   		if (strncmp(dirent->d_name, "drm_dp_aux", sizeof("drm_dp_aux")-1))

