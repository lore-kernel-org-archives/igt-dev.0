Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA21CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 15:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5A510E29E;
	Tue, 12 May 2026 15:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qJbV2iyM";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013055.outbound.protection.outlook.com
 [40.93.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAD510E29E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 15:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6kZ279FHFxHJB98ckZ21ZwHjqA+f4TReHgOoYFYiLGE9j+wfqCQuR14+e8/nZDohkmCYDZ0qS1pBbBXqCDUWGMesgQzXdVMnW/9IwoRTqCv8+Iff29S/HYBIjuWhpF3KGVgBT6191nE/WnGuc6hSgdYNormWFGtXJuGDFo5WmToIiymkx62Z/sDUDvjc1/GofpZI4xBnivYyzZ1tGy1WZPdvhmPfIs6uZyQ/yBwj2KoKD6nCX0Km0hdA0nz21ek578AohQNaFC5L751ZWvnnN1s+W1QtKHN5bSAy7H9SW6D3iF82q6laW7cTd4b3S3+m0EsB/y5OlbdTNsH7Vx4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omc0jmjxSQyVGrmnjUY5cbiV3hTOHQ3qq0kpbNs9zvA=;
 b=QliODh3SqXwY087T+lJ7qTxOGTdsWuNcGhodB/gSIOA0xl415RHYwgn3Re7BvF/z5qvCNjd3dKjkekN6ifqO8QPGnqs0bq3gax8sWy9Tm7R8//eVcuFZ46ap8Q8mhzckuhvxZRMdTTfnuSMgDlhp+goo20VlFohqoePc8MV9nGefDe50GuGBW2J4p7lTK1JoC6gKqIE3Yx6zRESVV6m12i7QddCvtmoguw8NVriSwysBXz5XMQohOrwzdU6+0mawsBRf1XTnt9Ojc9Hq87cZVmwO71fRJaviZJoYyeE5WWS8YqLDMbnmY1jNehY7YaHsX1JgZhpsC6SFSE5tkxlxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omc0jmjxSQyVGrmnjUY5cbiV3hTOHQ3qq0kpbNs9zvA=;
 b=qJbV2iyM7h8Id0cbt/AtUOYmXpNiD1aT8VAuqKZJeWws5EgzeqmfIe+24qbdfm/VbxqLBs//WpchordzhlkKZH/Z+/i/rsp/WI8XCoa04M5dHpFU5o5cM5GQb49phtspRsJll4AHJOGNfRDH0ItnVc8S+o1HV1e0k/evcMqQj6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:40:05 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 15:40:05 +0000
Message-ID: <ab6fa4a7-1c27-4d35-8df7-cbbed88f30e4@amd.com>
Date: Tue, 12 May 2026 09:40:03 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/amdgpu/amd_replay: add Replay Rate
 Control IGT test
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com, chiahsuan.chung@amd.com
References: <20260512080213.3457271-1-ray.wu@amd.com>
 <20260512080213.3457271-3-ray.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260512080213.3457271-3-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:303:6b::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 287c5d91-4101-4b98-1c12-08deb03cbd27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: veSriwZVV3PacQ0K9sdiY99VlhpaZipMlr8MqWvujKRSyZFh6ZprBLW47Meq6sTtKL2dAGPfXnbSGF0vAoUyH+Bg0kS2CcrYi9vi67XiutpmU9Vdqn2UAFqXsXf1JERK63WTML591jmSSHwRPTiZJzXu2HXd9r1RHowT+q4rFv4TqwRQQ8d5fdFm/vROMlZLX5pQlAKbsDiPEXNMxs0LDn9pN4Im2nfnJbPOPKrNLf7rUK+QBc2srK5uT8eOZ/LW/EgyFR3xu78DhzHRsFCs7V+yjUsw6UHxzROCvUgBpF57OR29Cw8Ih1JGncEX/qVr7OE2egf+2htp1u6vuW69qZnFF3wZEb+oYWTCA4AdRJG3uhWMKJxTSJjjVoXIJZU9+EVH0RjUkX4kytgqrtIyU4FfkLNLJs+qElJbCAxpDaR5YUWiumdJ36fmssNIKreYAf7shwu16Lk+XDMG7ZNejc7q9pJnkKd9WBLnd+DbJvT0KgpSGBvox8bj9dr5cys5eVcHSl57eEO99HKvPgGaKJI5Ro+LqkI6Tx8XFQoh9HqYzlqL++loC/nbgvMsEax24wv9IbJ6QMv6ByrR9/dfZQvvV3khHHSVok8lizwlSQVjOrXUPFt3VRAT/i+03JJzB6JInhXsrHs37GiCo38TC0tGDuWxX/txddPgsPg01H/T15uXXc3+7LdfvrQhWi+t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWI0dXN3VlZtVHVxNi9haVZZNU5sdGlKNUllYWFtU1FndExOVUlOTjliaXFa?=
 =?utf-8?B?UnB1bjdIYko5U1MzaGU2aGVqNy9hdkRYSkNVc3N1QzU2NmFYaWlOY1BnaFo0?=
 =?utf-8?B?OTgwQkU0NG0ya3hPZUVMWXk4THhITFAycDdhMEpMbUpQaUlsZmY1SHEyNE95?=
 =?utf-8?B?dE9ZalFaWkE1V0dTOEpsZHcrQjBSajRHRWJVUFBkRG5nTHVxRVJJU2t4K1Jm?=
 =?utf-8?B?UTZHVEVya2Zac0RuUFMwRWtreXNVVVRFNlRjQ2pvaVBxaUxSeWtpTkhvb1hu?=
 =?utf-8?B?NXVjL3ZhMnJNT3RoRWpjUlFFSmhWd1ZKR2MwRlpTLzFUaDlpVjdocjBEYTlu?=
 =?utf-8?B?UzBEK3lUQnF0eEdudzdlaS8wc09KeWNhOCtUTEwxaFByeHJqSGZUa2dtdFhi?=
 =?utf-8?B?V1N0NHg0RW9MSHdUTVF0UXFKa3FUaUE0dVEvM284V0FEWmR0QWZBeFdXaHBz?=
 =?utf-8?B?NStFSVY5b1g1SnZpZlUwb25xSE5QQ2t3ZGZYcUdjRlFtdFlTcklGUEdKcW1k?=
 =?utf-8?B?bkt4clFveWg4UUNJOHNQMm9jZ013OS9NdXZWZm9id0dWa25IOWtuWmFKTTVO?=
 =?utf-8?B?T3c4ZG1acmo0WWJXREpOTCtHN3E3U0ttMXFucVV4di9JbmpRR1RzK21HV05s?=
 =?utf-8?B?VHJib0hTRnZEZWhuek1wRWdRL2dqUlpXb0IzNCsxUkRJSmxqZy9aMHpaZUJ3?=
 =?utf-8?B?UURiaWNSUGV6TXRiNjU5S1RodStuQ1pERUgva0lGcXpQZTdtNUkxZHk5L285?=
 =?utf-8?B?YWdWVE51SVRlNWpyV0k3aGg3ZWJYM0VjbXZNRzErRmRNYVp4SkVYR00wNXEz?=
 =?utf-8?B?M3owN0dES3hIelJyemg2bUNpaXVMMnc0SW9GdGt1dTNiUklqOUN3ejVRM3p1?=
 =?utf-8?B?bGRZQk95OXQrT05GYVpQeWlQU1dRdThJRWRzRnNPQVlWSWRCaGgxOXp4d1lm?=
 =?utf-8?B?S2xSVmRFMzFLNkxPck9CdElKRXBUbDhxS0RGZk9zUlRJS1owOVhvTWI0eUpM?=
 =?utf-8?B?OGdESkVjZnJuS0V5SllsODNHVEthTmZicXJXMFB1KzNIK0JSbzkyRXhNT2Zy?=
 =?utf-8?B?WHlYU1lSSkkwb1luSjdmV3dSUWlZN0VmdnBMNlAwakZHOTFnTmhPc25nSzVo?=
 =?utf-8?B?YzVrL0tkM3BNNHVEczhNaFdWYWRvaHc3dk9yWUlTMk1CWnNrV2E0TmJSU3BF?=
 =?utf-8?B?TXJoYUN4QyttL2xrNkJOUS9QL0lFdEthY2RzNUd3MmwvaG1paEhOY3NneEhK?=
 =?utf-8?B?bVhVUXQ2a3JTUGk5U3ZaTk5pNVM2dnZBeXg2RVVTREEweG4rVlJSaEdpZDJm?=
 =?utf-8?B?Z3hwNnA3L2pjMjdFWTJsYTg0eStGQWZPb0E2WTlNSG9hOVZ0dUVZNzU2VEFT?=
 =?utf-8?B?YUF3M3NXTDJWMWdjb2lOaElPWlN6TE1UekJTalhOV1VmSmc1Y1FsL0FQRFBH?=
 =?utf-8?B?TnZDY0pOaFI0TjF5WUQ1S0VuY0MyTzhFL2Vzc0ZlNHlBRFpvK1VJRGpaT29Y?=
 =?utf-8?B?UXdyU1VQRlF3NXZhdXVHZmlFeDJJV0RVQ1pab09rWWRxSGpvaVI5WC9OT1JG?=
 =?utf-8?B?WEQ1RUFMdDNNOUJZR1pPelF4dWQxVzlZaGcybm5aNGk1QmoxbTMyWFpmalJy?=
 =?utf-8?B?MGZQd3ovSlZ0elFPajRNQUF2ZjA0aHBYdTQyVU1ZenpORUpaUEk3NHVOR2da?=
 =?utf-8?B?bHIvM1NNL0FuWFhvd0swNmIwSXdnUmREWEkzRUFnYUNHQjV1TVNWZzBvSEU3?=
 =?utf-8?B?TDMwWHFPQjNXSjhkZFRPWXR2MGRQN3F6a0NwWW5EMGNBaStDQ2duN045UlVp?=
 =?utf-8?B?aHIrakQvUm9TSEwzcG4yYzhYdXpicTZBWW9zcXJUdnJRZmUyeExTeW9IYjB6?=
 =?utf-8?B?YVJsWE5jckZwOGtBQVRxbjNYWmRLYXl3S1gxdVhFbDN4V0QrQms0NzJTRHhX?=
 =?utf-8?B?TUdMdVR3ZENuRTlkcktZeHNMWndlU3pDbUxLaDdkR2hGcG9tRTRMbWg2M3Fo?=
 =?utf-8?B?OFZjYmc1dE1mNmJmVnJzZEdZU3dJVGNUdndSem9Jem5UcVYvM0dtYTA3dkZk?=
 =?utf-8?B?NHF1ai9uKzFMRjY5VnhFb3lLV29LUHpoZ3VxRSthSVZmTS9HT0U3T08wdjhy?=
 =?utf-8?B?cUp5cU8vaUV3MThvcmdFWWFQTllpNjFObkpzRXBFdUhrZjRmOExPSHIzQ3FC?=
 =?utf-8?B?c2pBcFVZYWsvNGNJcWRhWFhybUxlTzZMb2hLdVdJYWpjN21idW5IOXh1Wkpy?=
 =?utf-8?B?SEtHRG5XTWc0MUlyN0JRV1FIc216SkgxcHIzUjF3WWNkVTFteThYcVdCZlR6?=
 =?utf-8?Q?3A3iRogx1H8wr5B4Dg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287c5d91-4101-4b98-1c12-08deb03cbd27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:40:05.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9kq3yPyDNooR0c5+eImlp4pTowXB1sg0G1K15nnj7dennYyE3tduzz0PQjiBCEOo0eRtQJSP8gVEwKABAzQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401
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



On 5/12/26 01:59, Ray Wu wrote:
> [Why]
> Panel Replay rate control lowers the panel refresh rate while the
> screen is static by extending coasting vtotal, and restores it when
> the screen becomes live again. There is currently no IGT coverage for
> this behaviour.
> 
> [How]
> Add two helpers in lib/igt_amd:
> 
>    - igt_amd_replay_support_rate_control(): true when the connector's
>      replay_capability advertises "Rate control support: yes".
>    - igt_amd_read_replay_coasting_vtotal(): reads replay_coasting_vtotal;
>      returns 0 on success or -errno on failure.
> 
> Add a "replay_rate_control" subtest that engages Panel Replay via page
> flips, samples the coasting vtotal in static and live modes, and
> asserts that the static value is strictly greater than the live value.
> Skips cleanly when eDP, Panel Replay, or rate control support is
> missing.
> 
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>   lib/igt_amd.c             | 93 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_amd.h             |  3 ++
>   tests/amdgpu/amd_replay.c | 86 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 182 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index a97adad43..89474eb15 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -20,7 +20,9 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <errno.h>
>   #include <fcntl.h>
> +#include <string.h>
>   #include <sys/stat.h>
>   
>   #include "igt_amd.h"
> @@ -1082,6 +1084,40 @@ bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
>   	return strstr(buf, "Driver support: yes") && strstr(buf, "Config support: yes");
>   }
>   
> +/**
> + * igt_amd_replay_support_rate_control: check if Panel Replay rate control is supported
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + *
> + * Return:
> + *   true  - "Rate control support: yes" found in replay_capability
> + *   false - rate control not supported, field not present (older kernel),
> + *           or any read/debugfs error
> + */
> +bool igt_amd_replay_support_rate_control(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
igt_assert_f can terminate this function early and close(fd) will not be 
run. Let's move close(fd) up.

> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Rate control support: yes");
> +}
> +
>   /**
>    * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
>    * @drm_fd: DRM file descriptor
> @@ -1177,6 +1213,63 @@ enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
>   	return convert_replay_state(raw_state);
>   }
>   
> +/**
> + * @brief Read Panel Replay current coasting vtotal from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @param vtotal Out: parsed vtotal value (only valid when return value is 0)
> + *
> + * Reads /sys/kernel/debug/dri/<N>/<connector>/replay_current_coasting_vtotal,
> + * which contains a single decimal number (e.g. "4938").
> + *
> + * Return:
> + *   0       on success, *vtotal contains the parsed value
> + *  -errno   on failure. Errors from the underlying igt debugfs helpers are
> + *           passed through; -EINVAL is returned when arguments are invalid
> + *           or the file content cannot be parsed.
> + */
> +int igt_amd_read_replay_coasting_vtotal(int drm_fd, char *connector_name,
> +					uint32_t *vtotal)
> +{
> +	char buf[32] = {0};
> +	int fd, ret;
> +	unsigned long parsed;
> +	char *endp;
> +
> +	if (!vtotal)
> +		return -EINVAL;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		ret = -errno;
> +		igt_info("Couldn't open connector %s debugfs directory (%s)\n",
> +			 connector_name, strerror(-ret));
> +		return ret;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_COASTING_VTOTAL,
> +				      buf, sizeof(buf) - 1);
> +	close(fd);
> +
> +	if (ret < 1) {
> +		igt_info("Reading %s for connector %s failed (%s)\n",
> +			 DEBUGFS_EDP_REPLAY_COASTING_VTOTAL, connector_name,
> +			 ret < 0 ? strerror(-ret) : "empty");
> +		return ret < 0 ? ret : -ENODATA;
> +	}
> +
> +	parsed = strtoul(buf, &endp, 10);
> +	if (endp == buf) {
> +		igt_info("%s for connector %s: unparseable value '%s'\n",
> +			 DEBUGFS_EDP_REPLAY_COASTING_VTOTAL, connector_name,
> +			 buf);
> +		return -EINVAL;
> +	}
> +
> +	*vtotal = (uint32_t)parsed;
> +	return 0;
> +}
> +
>   /**
>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>    * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index a45122b68..7f11e1d38 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -49,6 +49,7 @@
>   #define MULTIPLIER_TO_LR 270000
>   #define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
>   #define DEBUGFS_EDP_REPLAY_STATE "replay_state"
> +#define DEBUGFS_EDP_REPLAY_COASTING_VTOTAL "replay_coasting_vtotal"
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -227,6 +228,8 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
>   bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
>   bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_rate_control(int drm_fd, char *connector_name);
> +int igt_amd_read_replay_coasting_vtotal(int drm_fd, char *connector_name, uint32_t *vtotal);
>   bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
>   enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 4b795f5ba..fd0b01f05 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -5,6 +5,7 @@
>   
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <string.h>
>   
>   #include "igt_amd.h"
>   
> @@ -397,6 +398,88 @@ static void run_check_replay_suspend(struct test_data *data)
>   	test_fini(data);
>   }
>   
> +/*
> + * Verify replay rate control: when the screen is static, coasting vtotal should be
> + * extended to lower RR; under live mode, coasting vtotal should drop back.
> + *
> + *     coasting_vtotal_in_static >= coasting_vtotal_in_live

Should this be "static_coasting_vtotal > live_coasting_vtotal"?

> + *
> + */
> +static void run_check_replay_rate_control(struct test_data *data)
> +{
> +	int edp_idx;
> +	igt_output_t *output;
> +	uint32_t static_coasting_vtotal = 0;
> +	uint32_t live_coasting_vtotal = 0;
> +	int ret;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP supports Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	igt_skip_on_f(!igt_amd_replay_support_rate_control(data->fd,
> +							   data->output->name),
> +		      "Replay rate control not supported; skip test\n");
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0,
> +				    0.6, 0.6, 0.6, &data->ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0,
> +				    0.0, 0.4, 0.14, &data->ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &data->ref_fb);
> +		igt_display_commit_atomic(&data->display,
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		data->flip_fb = &data->ref_fb;
> +
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);

drmModePageFlip's return needs to be checked.

> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Do some page flips and let replay enable */
> +		page_flip_test(data, output, TEST_MODE_FLIP_ONLY,
> +			       FLIP_FRAME_BEFORE_TEST);
> +
> +		/* Panel Replay state takes time to settle on static screen */
> +		sleep(1);
> +		ret = igt_amd_read_replay_coasting_vtotal(data->fd,
> +							  output->name,
> +							  &static_coasting_vtotal);
> +		igt_assert_f(ret == 0,
> +			     "failed to read static-mode coasting vtotal: %s\n",
> +			     strerror(-ret));
> +
> +		/* Drive page flips to put replay into live mode */
> +		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, 20);
> +		ret = igt_amd_read_replay_coasting_vtotal(data->fd,
> +							  output->name,
> +							  &live_coasting_vtotal);
> +		igt_assert_f(ret == 0,
> +			     "failed to read live-mode coasting vtotal: %s\n",
> +			     strerror(-ret));
> +
> +		igt_fail_on_f(static_coasting_vtotal <= live_coasting_vtotal,
> +			      "coasting vtotal in static (%u) must be > live (%u)\n",
> +			      static_coasting_vtotal, live_coasting_vtotal);
> +
> +		igt_remove_fb(data->fd, &data->ref_fb);
> +		igt_remove_fb(data->fd, &data->ref_fb2);
> +		data->ref_fb.fb_id = 0;
> +		data->ref_fb2.fb_id = 0;
> +	}
> +
> +	test_fini(data);
> +}
> +
>   static int opt_handler(int option, int option_index, void *data)
>   {
>   	switch (option) {
> @@ -454,6 +537,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
>   	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
>   
> +	igt_describe("Test whether Panel Replay can be enabled with rate control mode");
> +	igt_subtest("replay_rate_control") run_check_replay_rate_control(&data);
> +
>   	igt_fixture()
>   	{
>   		if (opt.visual_confirm) {

