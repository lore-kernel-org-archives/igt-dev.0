Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB55CD6E55
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 02:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321E112599;
	Thu,  4 Jun 2026 02:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zvtc9bKJ";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52940112599
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 02:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esBaiLvO4MwMMlHxG8t09RMqal5pr9usJNDDrbJkXsn6MAXJiAqLhDfi0wS7M8ZyWxL1wgWrLU6Fm35irHef3bK2ZkPcZTN2OY1/fj1ZwUqLtlZHEifGPKn04IOZ0YnVMw0MvUhH9U4zk1EQDWz2Ntg2OsQh9SDnCZ+RiXdQa7vDVgvPph3ia/Nwa9epAyC6FBbRy1swLZg36ZXQBMa/1XSYKitb9/YdOs6s9IC99JbLLulgaAOlf3J96ma756ruYAFcA/m9pzoVm9eO4z76kW5x/e+DaqTWO93dhj3LnDF/D1VnQ41F3tF+Y7+1kqcU4VfcEUMr1o4HVMQP7Xmhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XqJa8AH3vm8qPEvqf8CCevcmt2cKMh/Zw8bbyZnyFU=;
 b=xMPJiB9MMpwsxEY12ueudO07OMg1PZH9iHy/XcUEdxQd7BHcvGAPdjolW3+1OPOYZef1PLV/yf9PKUoVOOQWHofyrhaC1REFsO+fOwGtPrH94Ub1H34UlF0UyqWAms4NhqcdR+SKu+NAIlgplnxaFQTvBqyT3eyxNGQQp/WcelSvalERI6+ND3dys+HBOWjnYJwdw/vjVfbBdGosLwqKG8XLlK9GTqyOGyGXCAjf0SOHwVbQSaY510w8xArhxV45ApKLzPA+os8gB5DD9TwzmVmeyLOCLmnvr7h71GAplCifwUnsFIcckuESaUiqNA6A0dvgZeTzVcGoT1MOryDDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XqJa8AH3vm8qPEvqf8CCevcmt2cKMh/Zw8bbyZnyFU=;
 b=zvtc9bKJxfy2374+t8V8oXR7t7fIVacO6VB/K633uv86ly653M7cfoaI9TfSCiWIeHL+n9f+1aWatzBjQeesUDdxd2bT1eerAPv7OQKobf5zk+cLxAN2Hjq3P4LysgIFniXwHiyQHYCxP5xEH1M8WkNy2sD8prjDBzpBAueKajQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by PH0PR12MB8006.namprd12.prod.outlook.com (2603:10b6:510:28d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Thu, 4 Jun 2026
 02:31:20 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:31:20 +0000
Message-ID: <a3c33727-ec32-4874-a769-7620ce7b1fbe@amd.com>
Date: Thu, 4 Jun 2026 10:30:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_amd: add helper to disable Panel Replay
 on all eDPs
Content-Language: en-US
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260602064543.58586-1-ray.wu@amd.com>
 <20260602064543.58586-2-ray.wu@amd.com>
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260602064543.58586-2-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|PH0PR12MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 309abdb2-af94-4614-3dfb-08dec1e15c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|5023799004|3023799007|18002099003|11063799006|6133799003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: a22iVu0/kq5XclmHRh3PShoqzqMbTFYqQrmIyu7jqam5b1UNKPGkfmtucuEA/Lr4mPGayLXhWGBbGZkG0+B7k2QtQhtJ0GoXo2shJjTz3g6mD37yDFKMab4dbAx2wfKZM2bpTrZbD+6wX1rnvyFEhBp/D7BUGhVeBBnIN04Xp5U6Eh2XIvXwBnGQctOgwPAbux3MhP7gm4IY/CjRToYeR83KgK+aBqfqNvQ3jLvQycsrcM6/sDDuvdiNtaxpDSHZ1T+YZSQ+AqcH5Z8v11z/U4qsPd/serBn3pgSh9mQ9P7+SiwTDnYlYdZ7sjF5y8L/I2iRn6Fq5oOg72CEpBXN0lLw1XIX1WuhP64K5GjZntsBigCEQZzCPdwkYF1ZSPX4r3zjsEs/yCr4hvHTMESFwxkHapTwxvRhLkUBJBoYFisfP43RU+a+/TYgfD9XtxLELg4fVylSEdxNGcltwQu2bYPzzB1lX4bk44nQ87PrZJNlLPT6FILi7OjoOEgEH0Z8WBVHz6eGwybhd/t4yktiZGTIwfew+tQBVI8UfCbMHPxA6y9xSbojLqTG74XBRoRmNCRtb5m9YATcOpV7eOXNUoh+M5fOe5TBmfPo4I1C9O+m5yK6gRS3kjVDPvxvW6kn8DuaHgmH1H7gIOSljgLD87g7XEQIWvHoenkJKVQibOIyjHnbXJ8aAGjKWvRpgy1q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(5023799004)(3023799007)(18002099003)(11063799006)(6133799003)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUpsNHk0N0ZhVVcrMzA1OUpFMUxkUjh4c3R5SVNmR2JLMW1tbVFZQURVeXl2?=
 =?utf-8?B?K3dUMjZkTlcrc05vdHY0TDI2SWlOWWtoZDdCaXl2bmpiRzF0cUhPUVAxTjdx?=
 =?utf-8?B?MUJ2bFJqeDg5TFdyY2RVUnVTUUFsRWZRNlJVaFhxVzNsbW9lUXdndHJhamc5?=
 =?utf-8?B?ZGtZcTc1Y3pBMm1pQ01VWXBBeEF2Mzk0aS9jdmV4SlQwa1B4VVRacUJLRVpj?=
 =?utf-8?B?VWJOZkcxbDVIRkxXbi9DSk1FR3A3Z21nQ1NGWlo4eDBqazY4elNlTXhVbzF5?=
 =?utf-8?B?OXRZZUNWenNpM3c3OUtPanVUclpac2tsbjQyTWExTk9TeDNGeTF5a3Q0VVVE?=
 =?utf-8?B?QXZvem01aHlrd080ek0raEtKeXpPOHhJN25Pai95V2oxZFY3bHcvZVAwT2hY?=
 =?utf-8?B?RTN3MlJvUENWanNLcjdPeXJnWmhURVNSWE00R1dYMzhveFFUY21LVWswaG1x?=
 =?utf-8?B?VmFscGhFa3l1czF5djF6NlAvbllYTmpZZHRMbUl5ejhuTlFMaEVrV3NaVVpn?=
 =?utf-8?B?cVBnN3EybUlNaE1qYkhJY01sZU9IMVh5TE5zVzhFN014UmI2NzB5dVVKM0dN?=
 =?utf-8?B?RWdySmg4RXRSczk5YnZEZ3ZIUi93TElNVUhXMGlTU2RUMDJuZlllUVBhWDVP?=
 =?utf-8?B?RFFjQlIremw0aFhLRHlnRlJiZjIySGhCSVVLL0Npc3V1Qy9Pc2l5dUtKbUVQ?=
 =?utf-8?B?RlpYVGpveEY1OXAyMjNZU2dkcmtFNTFRemxDWVdmR3U0SHQrMmFQV2VYUXdm?=
 =?utf-8?B?ZmZrOUFzWFFTRkF4TC9sdndvMC94ZU1PRnZnZmdpeGtLck9qTjEwMDhzWGky?=
 =?utf-8?B?d1YvL0puc3B6bnJFSFB5RXUwekNzQmRrNVIvWjY4Y05xbkVURU5aQStCdzlM?=
 =?utf-8?B?U3o1cTZ5R09PeENlOXNNNWtsQ0dQRitLdGt5cThHZjBoRmNQbCtoUW1jbmlB?=
 =?utf-8?B?YWp4akg3SVh4NjNpcHRna1ByVGZJZm02emEyMUwyY3VIVnhXMlNNMHVwVmdi?=
 =?utf-8?B?L09ETkRmVzZza3g4RTFyMWUrd2RMa3pjVm5DandVWFJkY0ZyRys2WTllVkMv?=
 =?utf-8?B?MEc5bmdCQmgvbzRNNlNaZVdHdFVLQ2VjU0xseUt5WnBjZnZJdHFWTG5QVlNP?=
 =?utf-8?B?TUhjNFBzMXdteGl3eDg0RWJVdTBKaHcvVnZ6Mno0cHhPeFFKM1pLbVNlZTFE?=
 =?utf-8?B?K2ZNLzMxNllGRkZod24xbzdSbmljYk1va2xZU0JPdnp2MURtTkNCY3VXd3RX?=
 =?utf-8?B?TldmY0RCZFE4eDNBUDZIN2VranVxQkFYUnNUMWV6NjlaRFVPaDI0alFhSGxi?=
 =?utf-8?B?Y1ZxakZTRWR1MjVDNWtFSHpPM3AycHdWcXJiUkNUT1Jkc1JsdWoxKzBLMHZw?=
 =?utf-8?B?aHQ4STFuUGRTSVU4aFd6VFY5S3UvVjBwTC9sVFViUXpCb3dxM29xYXRzN2Fv?=
 =?utf-8?B?WCtDZVhiNEVTRkJBZXFnUVlPTnR6Y3QrNW5JaHpFenl5VThBYkVPdS9hTEpI?=
 =?utf-8?B?UWhSZGl2NW81YkNZOWxHQzY5cExza3p5UnZUdXpmWGFkV2loTkh2cGFZZDhk?=
 =?utf-8?B?UERYbGlONVQzUHprYnRiV2I4dUlNMlAzVlp0WDNjdHE1MWlpSEpKRkVaejc1?=
 =?utf-8?B?MkcvbnBhQXovRi9icTZ1T09Xc3d0MlVVVHNOSFFRSWZpTFdLMUdvUDA4VExv?=
 =?utf-8?B?NjY4MlRicm10WXVhOXMwbFFpV1NLbHh4NUtnRFl3WEZNV2VicEsxVjRLS0FQ?=
 =?utf-8?B?Ynl0dm03S1U1L3grR0R3Q1ZsKzd3K014OVA4OGdiZE1UaWRydHRmRGdpMjhy?=
 =?utf-8?B?ajE1Q3pnaTJScTVmN09uTk5pWE1DSWxMWVVTVjJyR1hKVFVydlY1eHFMS2Fj?=
 =?utf-8?B?eUFvWkRTWHRxQTFnQUIyejRmbXA2cU5lVUNzd2RxcXc2eHdzcjcxOVJPUHh3?=
 =?utf-8?B?TTZDaEN5eXNRRHZVMXkzeWtpTVNDUW1TMUJBdTlXK1dRc3ppVHlKQWxYNldt?=
 =?utf-8?B?Z2lXZjZ1UFc1Rk1VbmdSUHFJM1M3ZG5zU3FZKzNXTmo5M0NFSVpnQkxESkd4?=
 =?utf-8?B?NENDTkFwcEM3OHFIMXJud2ZIWGR2L0xITDNUWE5PTUpsU2hJcC80WG04ZlB1?=
 =?utf-8?B?THhSVDA4OXhMa0YwOVN6TXVXVUdXeWMyVThSSnJvM3RrQWpRc2dpaFF2MUdZ?=
 =?utf-8?B?NzJRRHBZTEJWUUlhQWNXV1B4RnBvT3dyZzFrOUlhUGhlbno5dXQ2c0ZqNHhw?=
 =?utf-8?B?bUcxNHo3ZDdwUUpsQ29ON2lZdC91dVRTb0w5bTc0MmM5VU43RUJMb1gyd3V6?=
 =?utf-8?B?VGxUZ2ltWS9RcnlDMVdXYm1xb2pOZW5TYSthNStZVVE3T0MvS2Jwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309abdb2-af94-4614-3dfb-08dec1e15c8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:31:20.2706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSAV7TG4jnSpefCEO5Lqye7b1YKKLRnLbt49jj+lXhLxpNCsXnbdf/ImM5E4p/RjGuCDByLBWhHfj9NFhx/nAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8006
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

On 6/2/2026 2:41 PM, Ray Wu wrote:
> [Why & How]
> Add igt_amd_disallow_replay_on_all_edp() as a batch counterpart of
> igt_amd_disallow_edp_enter_replay(). It toggles the
> disallow_edp_enter_replay debugfs flag on every connected Panel
> Replay capable eDP, wrapped in a DPMS off/on sequence, and returns
> whether anything was reconfigured.
>
> The filter matches "Sink support: yes" + "Driver support: yes" in
> replay_capability; "Config support" is intentionally skipped because
> it flips to "no" after disallow=1 and would break the restore pass.
>
> Also change igt_amd_disallow_edp_enter_replay() to log and return on
> missing debugfs instead of skipping the whole test.
>
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>   lib/igt_amd.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_amd.h |  1 +
>   2 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 004bd2fe8..47e587e54 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1395,8 +1395,11 @@ void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool en
>   	igt_assert(fd >= 0);
>   	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY, O_WRONLY);
>   	close(fd);
> -	igt_skip_on_f(ret < 0, "Skip test: Debugfs %s not supported\n",
> -		      DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
> +	if (ret < 0) {
> +		igt_info("output %s: debugfs %s not supported, skipping\n",
> +			 connector_name, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
> +		return;
> +	}
>   
>   	if (enable) {
>   		wr_len = write(ret, allow_edp_replay, strlen(allow_edp_replay));
> @@ -1409,6 +1412,52 @@ void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool en
>   	close(ret);
>   }
>   
> +/**
> + * igt_amd_disallow_replay_on_all_edp: toggle Panel Replay entry on every
> + * connected Replay-capable eDP connector on @display.
> + * @drm_fd: DRM file descriptor
> + * @display: target display (already initialised via igt_display_require)
> + * @disallow: true to disable Panel Replay entry (e.g. during a test that
> + *            cannot tolerate self-refresh), false to restore.
> + *
> + * Returns true if at least one eDP was reconfigured, so callers can cache
> + * the value and decide whether a restore call is needed later.
> + */
> +bool igt_amd_disallow_replay_on_all_edp(int drm_fd, igt_display_t *display, bool disallow)
> +{
> +	igt_output_t *output;
> +	bool changed = false;
> +
> +	if (!is_amdgpu_device(drm_fd))
> +		return false;
> +
> +	for_each_connected_output(display, output) {
> +		char buf[128];
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		if (igt_debugfs_read_connector_file(drm_fd, output->name,
> +						    DEBUGFS_EDP_REPLAY_CAP,
> +						    buf, sizeof(buf)) < 0 ||
> +		    !strstr(buf, "Sink support: yes") ||
> +		    !strstr(buf, "Driver support: yes"))
> +			continue;
> +
> +		igt_info("%s AMD Panel Replay on %s\n",
> +			 disallow ? "Disabling" : "Restoring", output->name);
> +
> +		kmstest_set_connector_dpms(drm_fd, output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		igt_amd_disallow_edp_enter_replay(drm_fd, output->name, disallow);
> +		kmstest_set_connector_dpms(drm_fd, output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +		changed = true;
> +	}
> +
> +	return changed;
> +}
> +
>   static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
>   {
>   	int ret, fd;
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 90ec45828..27a06f6f3 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -237,6 +237,7 @@ int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
>   void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
>   void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
>   void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable);
> +bool igt_amd_disallow_replay_on_all_edp(int drm_fd, igt_display_t *display, bool disallow);
>   
>   /* DM interface helpers */
>   bool igt_amd_has_visual_confirm(int drm_fd);
