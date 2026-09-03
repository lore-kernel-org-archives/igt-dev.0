Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC0C624D6
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5B10F66F;
	Thu,  3 Sep 2026 15:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TLKV+ePl";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A410E154
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 14:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/UmWMPKKoqq5zvisIA/k6Iewy/EVySg/eW3raQMlpQgkgb7ahAY4h6GVizJzbWV+j7a0KInb4v0QFQntTmb2BWkJWWHrg8Bq/MgpGQ6YUBouUMUlvyoYb9Sm73i+D50irnK3GGwuMCiIts/jwnPICrSjonw7szXHo5ptf53l7PRJCSlef/C4AlI30t95m5v3EuhDBxuqSVS2wLKaXRNOGr6Wi+9IFILFMWuG4xIBVGsGbH/hqb8yeKwR8vGRMU/DDOfH9ldURMYDpc7nZgqh5tEGjkNPHWv584omAG9MihM2ZrayZcY7i5nsAqmgFHVK3K8pc1dGsf2WBpH1J06CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYqBXvf7vLl8V2uNdsEWaf14WnxaZvYeukbzpsup8Fc=;
 b=n29CEC9M6h3fZ9x8oTaLxvCI71dNWXIvLaZJg8pSzy1Lm5FxoS/1eN2QaaBiYIM1sKwpDKBfaw795kriG2DTv0mjJdnmtgai+WrZXqrz5NDfK26svWZ5JEBB6IvAUyqG5Bm1Zak8S9KD4JWpRAu8N/B8W9oKj1Cz4VbVAVHVl6EG+l6keBRVPJTjxYlJMgnEY6+wRpGsraYFamhiWCDVl0yQTIVvJSgR1A+3wywsXmeqGPPTYr4SJnq/BikcSA4nZLmTDmiaLbAoOtwwn4CHeghe+n/7IKXVqFDavrVk/CeYia8DyNPofLhhF5G17NMA7kWEYyr6umiVLPYVU+5LvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYqBXvf7vLl8V2uNdsEWaf14WnxaZvYeukbzpsup8Fc=;
 b=TLKV+ePl46IHXdLZx3yJ1KEXDn7XBwB7stGIngH86ldmG+0S/JeH1QSkB/5tJVA4pZDRqZmijBw90/h3iVjm/7pSSJsivaoUN/SzVz3CJk/OkqL0E2OHO4Fc0JRfwv9mT/hFWrciTWHO5Fa7XERhKGHBGECHTNeindYEnOFX4vQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:59:54 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 14:59:54 +0000
Message-ID: <73f6bc60-6241-451f-849c-8917f880d389@amd.com>
Date: Thu, 3 Sep 2026 08:59:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/igt_amd: don't rely on NUL separators parsing
 link_settings
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623155541.32145-1-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623155541.32145-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bc17d6-e9f2-4a04-7828-08df09cc030f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 5zMHVE3M/QFqa6s0eChfMnnvkREdidVdRVyC/+v5GUmKJoCj2uC6we3wvEP/j32vrrUGyN+25jvfgfR/b46n8BMYzKmRCj+2J0E7ndP3lQP9LSJmRCdEIa3kkJzsmJQsgEpORi6ECsTVLMcDddsU1T3VYTiTEXne8IDLycflyLl3GsxY6GEYrSPivRNzhNCK5N/Sx4GfkQyklyPOT20gw5DyO1AlpzyQyHF6cNnjlUBn2uEoAEljhO8oavmAUTpXZn9UGfyo7vYva1qsUWr62hPXaR22ceuG0CGaL30tY6W2T3fCPYmwuDrlm6x9jjLB9O81EwYMS643yZQJRXXFdY5T1HbQLX965L1F2U2X4rRkVeiKExtCMSWhdu7hg1AkLufMETsSDtD5+DtflsfJn4u6wKFvtLW9+CRGVvOwtmDLNbWhkJzVhG8Y5eeh05sLdAtBPfjO8i8Itjt8jzXc/cAvwcl5NGlNDGOx5SyJP0CH19YrTT2A2WafnNNnB5XY6gyGlHeIoNunXHZ5TUlwXwvEQ2WRjWUaKsMOOVzG8kuc7NcoPa1GBT0wxAs3yNtKNSZmkPqbE4CKosQukIcELVUhuSWzawh6oyvgTneXPBSH8BDhVz7GW+JQ3RzkxP+alJuYZE8Cjn6/nW5m9SJfsbymbBB5KRyw78LggwEKCLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdCM0JCRnAwaWF3d2ZUaHk4a1NtNzZvWTdHdnk3NU45eEVTRmVUSzhiNlNk?=
 =?utf-8?B?N1FqN1pHSFhscWFtaU5IUEFidFFVRnp5NytRcXJBMDd4Qzd1S0FUSGdtNWFt?=
 =?utf-8?B?ZEYwTWlVaEdvYTJWNWJwQVFWek44SU15b2VOdFZrNVRDTW5nQzJyV2MvWlY5?=
 =?utf-8?B?azcybjFUMzdWbXBiQUtqY2lGNE9iVjlzYUpIa3liZUpobkg5ZUJMNnM0b1Bv?=
 =?utf-8?B?VFRQejZIV0hjbGFrMDU3cEZieHNxQ2UxdUEzbysrWk96aHNSUVRDWE1KUURM?=
 =?utf-8?B?bHRjTWs3WDI4ODhTSCtQOU9UWjBEQmZRTk5IbmdiR1RlSTJCb1FQRWh0MGZR?=
 =?utf-8?B?TVNtalpsN0FFTmtHblBXNDJJWkJEUXl0cWpCcWhJVU1Tc3AralF2UVVpMVY1?=
 =?utf-8?B?UytTam5xdjAvUUZOa1c4MERGOXY4cE1CalVIYWk1L0dCSDFiaGQraHJQd3VD?=
 =?utf-8?B?Mk1MMTlyeFJsNXNnYWR0V0tFb2pkbHhHMEp1bCtkNDQwVWw2SDI3NEhuVThB?=
 =?utf-8?B?YjgzdHhZUFFXRkJhdWtsVzA2TCtYOVRwaW04bGg4dlc3UjBvbkF5M3Q1TkhZ?=
 =?utf-8?B?RDlKVGZZaDhueWsxem9NaUY3UklpMWRQVUlYNGhoMmllNG5Ob0F0WGd0anVF?=
 =?utf-8?B?dmFlTzhPOFR5UG9mcXlIYjdPMDczVUZUS2VHUlFDSVNDMWRKcVBNVEM2Nm5s?=
 =?utf-8?B?aVc3K2ZZQlFXYVZUNVNNd1V3VU4wVXdmNFFnc0VvV1lCZDgxemR0cFM4WkpF?=
 =?utf-8?B?dDdDdlZIYlF0c0pidFgwU1BsWXEvalhHZHhUMUVMQ1lucnB5OTAxZmZCendv?=
 =?utf-8?B?YnRvaU1abnN6SUo1YjlUWnkvZEhjSEVoUVkwR0pZNzhiTml6U2NqQXFwa3F0?=
 =?utf-8?B?TXREYWp0TXY1WDJ1bGc0ZWdYUm1PM1pWNStlcG9RcVlUT1lETEdKVUFhajdH?=
 =?utf-8?B?RVdEa2owdWdndU93blVzRzhaUlNPbnE5MTMvNkFxVXFLb0lZa2hFOUhSWjVz?=
 =?utf-8?B?T1pTN1RmK0JqNVNXWVJ0aXpxcWE3YWFvWnZsb0hKQmo4eE91ZTJSeDBVdXkr?=
 =?utf-8?B?cFlyNE5aRHgzaitXN05jT1hudXpCeGdvQUZhbjRTRS9xSXlrRWFtSUJMRlVa?=
 =?utf-8?B?T2lyRzM3dnpCODdsQlQ5bi9aS1VsL05UN0xWRlVwbmFRU2UwZ0kxR1NxNTVR?=
 =?utf-8?B?azlsc040bWVITG9DQlBOYkQ3cUFuYWJZVmovcWhqZnZQdlY4UDFZeEdnaVhR?=
 =?utf-8?B?c0hFTHUyc0luZ2VDWDBkd1ViMDlENXk4YWhLTHVHK0xwTDRDMGUwalF0eVNY?=
 =?utf-8?B?YXdtbHpiN1lVcWxkUi9IV0pYVFljYmhiTHJ0WFI3dkMxNXdUQVFXaVlMeVh4?=
 =?utf-8?B?RnQ5UWgxZ3ZpajI1SGM2U3lMNlUxQ2hERGo2cEQrcmg2c3dCVnZLdTltc2dE?=
 =?utf-8?B?VXhkWUVPL0IvMlM2LytuL042aSt1U0JUUG0xZDlWQlBwSi9iOVFRSEZzQk9B?=
 =?utf-8?B?TWdIVE9kWkVtQm9hYjZjdGFtQU1BdVZwaUpabVluVFMwY0o3eHVIZUxwNUUy?=
 =?utf-8?B?VzNLWFNBeG1vVnpndFdsUjRTT2t2OS9MTnVHUFB2UjdhTGJ5SFdiaEt3QVFN?=
 =?utf-8?B?Z2FvTXRqUi9nZUc4RHdCVkpBQ0NZYzAxTHdNemhrVE9ONUlzUlFORzZCSkQ4?=
 =?utf-8?B?eHlFQTdWZTBlZDNBaUNHVHR1N2RaU1hPaExDU2pxNFdyZUthRnB6dXNqNzQ4?=
 =?utf-8?B?a2xNc05wSnRsUkw4YjF6MEZyZk1XVGVmWTBkOFFTUThPZ24xbzNDTTFCVlBt?=
 =?utf-8?B?UWFMTi81Z0JaMU9XYTl2UjVZR2Rydm5KZDMreEZRTmxaNVBza1JhN054bnl2?=
 =?utf-8?B?Ukx0RUFGRkQxd0s3azZGWlVLTi9Sd0l5TkhqemF6VVFYOGQ1d0oxcUFCaWYr?=
 =?utf-8?B?V0ZxZzFDOVpITW5XUDZPbTZlNENNZmNZQnRwUnFaeTVnNHZEVk9MVGQ0Njlo?=
 =?utf-8?B?c1NLbFhnZ01tZTh4a0ZlOTk5ZFZ0bU9RbzA1a2h4RDl6Y2pnVVUzWnVxVHB0?=
 =?utf-8?B?a3k4cmhTWkUveVlHeDF0bmlOTGJBdE01MjZjK3k4N2c0VDFnVW04SHJLakRq?=
 =?utf-8?B?VEJhWUJrZ3NyZXlqVGFaOE9QNHVqWS9ieGtmRWhlTXk1ZzJMbXhUUVpvTVJC?=
 =?utf-8?B?ay9kSkRnNHBsdEtDSkQyWnU2SUJObGhHR3MybVdhT092Y2pZVjdIcjNFWmJ6?=
 =?utf-8?B?dit0UWd3Y0tCeUg3T3pJdWMxUmM1UnArWDdSUnY2c2VoMXV0T0lRMEpad0R1?=
 =?utf-8?Q?8D07HT9OARteDsVFlo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bc17d6-e9f2-4a04-7828-08df09cc030f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:59:54.1528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1cKHZ323jUPbJSSKhRqKnAVju4QtfTS4eO9IluVoLlTR7SqEieaedja30AQnMYUnw8M/P5bbt/OTYQhlbQB1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089
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

On 6/23/26 09:55, Harry Wentland wrote:
> igt_amd_read_link_settings() parsed the dp_link_settings debugfs node by
> replacing the NUL bytes that the kernel accidentally wrote between the
> Current/Verified/Reported/Preferred records with ';' and using those as
> strtok delimiters.
> 
> The kernel side has been fixed to emit a single, properly NUL-terminated
> string with no embedded NULs (amdgpu: fix malformed link_settings debugfs
> output). With that fix the buffer no longer contains internal separators,
> so the old parser collapsed the whole string into a single token: only the
> Current record was parsed while Verified, Reported and Preferred were left
> unset (0). amd_ilr then wrote a lane count of 0 and asserted it against the
> trained lane count, failing the ilr-link-training-configs subtest. The
> NUL-scanning while loop also walked into uninitialized stack.
> 
> Parse the node by locating each label and reading the three values that
> follow it, so it no longer depends on embedded NULs or any other record
> separator and works with the contiguous string the kernel now produces.
> 
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_amd.c | 38 ++++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 47e587e54de0..7d33ab65858c 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -833,10 +833,13 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
>   void igt_amd_read_link_settings(
>   	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
>   {
> +	static const char * const labels[] = {
> +		"Current:", "Verified:", "Reported:", "Preferred:"
> +	};
>   	int fd, ret;
>   	char buf[101];
> -	int i = 0;
> -	char *token_end, *val_token;
> +	char *ptr;
> +	int i;
>   
>   	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>   	if (fd < 0) {
> @@ -850,23 +853,22 @@ void igt_amd_read_link_settings(
>   
>   	close(fd);
>   
> -	/* Between current, verified, reported, and preferred are null terminators,
> -	 * replace them with ';' to use as the delimiter for strtok. */
> -	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
> -		buf[strlen(buf)] = ';';
> +	/* The debugfs node returns a single NUL-terminated string of the form:
> +	 *   "Current:  %d  0x%x  %d  Verified:  %d  0x%x  %d  "
> +	 *   "Reported:  %d  0x%x  %d  Preferred:  %d  0x%x  %d\n"
> +	 * Locate each label and parse the three values that follow it. Do not
> +	 * rely on embedded NUL bytes (or any other delimiter) between records,
> +	 * as the kernel emits a single contiguous string. */
> +	ptr = buf;
> +	for (i = 0; i < 4; i++) {
> +		ptr = strstr(ptr, labels[i]);
> +		if (ptr == NULL)
> +			break;
>   
> -	/* Parse values read from file. */
> -	for (char *token = strtok_r(buf, ";", &token_end);
> -	     token != NULL;
> -	     token = strtok_r(NULL, ";", &token_end))
> -	{
> -		strtok_r(token, ": ", &val_token);
> -		lane_count[i] = strtol(val_token, &val_token, 10);
> -		link_rate[i] = strtol(val_token, &val_token, 16);
> -		link_spread[i] = strtol(val_token, &val_token, 10);
> -		i++;
> -
> -		if (i > 3) return;
> +		ptr += strlen(labels[i]);
> +		lane_count[i] = strtol(ptr, &ptr, 10);
> +		link_rate[i] = strtol(ptr, &ptr, 16);
> +		link_spread[i] = strtol(ptr, &ptr, 10);
>   	}
>   }
>   

