Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29283C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 22:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF010E340;
	Mon, 31 Aug 2026 22:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nsKwySa1";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DF010E340
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 22:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnDr/YJsrZme/Ml91CXimKnl/KlmA3itgCtXfnVupVSKlbTeDCDj7qafjR3Rz+PVZGb3mn0r78Eam7pXZzVX69Wjd8CPEyMAvy7BKJ3EFFwGiT0+bUbeyOtpKS6pNOqLHd7HPm2FDL+96kwcmR1OC7axgXjJMaTkn+VRlm3QpYAQeY/7V13AEXrNCzJ7UYHFp2XOJVD4rbRAi1kKgBzMWRBuGcv6qaWtB4gPwNPKCWD3LTs4gfbxb+TgX0OxgGvV4uGZAGF/V62sLhqyfJa4bpUXiGTcOmxmS7HUs4m3/Pa7h3rhE0I4qRrNMu72f25C1YxtqUzF1jAHAzEvfyu2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg7YsoGj+qrf4lo2/E1IOgArR4dK8SesNsMcGVS4QQc=;
 b=Gtqj4cgbK/AtJGrLpgudY9lrePYo7kxYn/bTPkEnzexTzamwgqB85dtNuldTFGJLxsJnVR1tP/QPokarrNeMjIp/dbePoHCASbhE0UdnDdocJOQ9J7FJ0pDPnztQ3UeRyTxGHGX+DPWEuYvJNnt6xS+ZBNg1mDQ1OLvXwtM4OVLFxySeeChzpjlmKkbCECzIEGhFYiRIoXrhZXOFUB33ypEK/GTgyuVmmupRBF6U1XG/tEgQ74A7gV/K1TdM8OnLkQ8DMrQIBWCHkmkTBY5eIgJ5Z7E5DSzOtOcm7mixfAWk1pFxOT5S3TGaw3bLfIZVcL7naYkKhFNmgi2yu5LFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg7YsoGj+qrf4lo2/E1IOgArR4dK8SesNsMcGVS4QQc=;
 b=nsKwySa1RluSDH1263jlQKr4y1Z+2Z1NYZXJnuGoVwSgTsZpNBBFt5eNqLInu/aes5bAtUftT4mPmRkV747eKWshp74LyL6E2/6rNw9bP/j/ZPsNKioEkJ5CwTSUub+QEhzf5euEmsbRaQ6b824ibhPLH1IKvJg5wQKYAIQzMSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 22:34:37 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 22:34:37 +0000
Message-ID: <576b21c8-d4d0-41d2-ac2e-d61fc88aab79@amd.com>
Date: Mon, 31 Aug 2026 16:34:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_amd: parse link_settings records by label
To: Roman.Li@amd.com, igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
References: <20260831205639.117351-1-Roman.Li@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260831205639.117351-1-Roman.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd17c47-8214-49a4-ffa2-08df07b009e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: vigU6ynUM/rFRdHmG8gESGCglSfYZ5OiOvqXv/Z/QL89JRGzZN7+fKRPewZSKga+5InHb7k5IJTXClo9UTCY69DUS2LRHKqJUYVAnw9jFNnFdmzudnjB/Nk6yeXA15N7mtXA5jB8wLJzXOagYVJth4m5DiOoYq04hBX70jc1ZFIQ3OLUEn3/ClNodkMin4u8E7RoZzJZpKHWkWVW+rPtNuPEsaNVgKGbPMyIR/gk5FQQGXx/kVKX8T7lVa412oY+ddQu/5IPu4taUBGjD85LIH8JO4cTAjJGEjUKSEdeca1xoN6yMHlsI1nvD1mmT/ScXCLpNNalWg6pSv+NLVqDuoVJZknEZgoIRIJ4YXsRmR+5D3kQUhFbETAsgHPgAt7gcizTB4NKiClEuII0eBS1iswHBCnoV0HYvM+3FF8D+aQaIscJ6vtgHmeERUgxH1wJBql2WdSPqf8rsD1UVBclehI5Q3PLO0+/6vTks3rZBSUYQ9XSptQdNcIPfV0CyJjcPylEJupGwng4pBwwJDXSGC+3qmDwmYVXuCo6R5r3z4Ylv5xgixmJp1S37hllZh+ZSBEMbNCQomiCY1bRGCfNOrKdpQN1Y192FFI0f/AYFTbT/+wcjCm0F1RNOSjgXdDg3zjzYCbNjh0Px72Hi9rJEJzpAEJzebhqiF+RoItHkB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0w3dmc2bWtUZWlqN2YzMzhMNVlxc0dDZ2laNEVFSFhpVHNrb3RTSkxtSFg1?=
 =?utf-8?B?VjZLS1V2N0NFaittZnFFa0wvL1F2SG1KanFWeHFETmZuVU1WY3llUUZCeVk0?=
 =?utf-8?B?RDRxVmZ6aFQrQ0ZFNUxLL1BTeHZuWklQYnJkVjZsSjdCcnZWK3AyQXlSd2FG?=
 =?utf-8?B?VnpkTWZMaVR0UGRpbUdGNUFtU1BuT2hod3pEdUpCcVBhdEE2THVxbzAyMmtR?=
 =?utf-8?B?YmpjQ1pxZ1N4aElVejEwbENqRXBtVTJMREEwcEZMcU9EVVNCbWhSM2R4SzNO?=
 =?utf-8?B?akpHZkMwMDJTU0dZTTg1blVpYTIxN2xzSEJOamE1a29BRWtSb1V4N0l1ZHZx?=
 =?utf-8?B?L2p5THFkUURhUHJ5OENVWGphaHRjZVVOQ3VYY0MvN2orTjZFZ05COUxOZGpF?=
 =?utf-8?B?SFh6UCtoVUlSdGMyc3c5MmZ0TGwyM2JGMngycU53Q2pTcHdYQklpSm9McXlJ?=
 =?utf-8?B?TWRkemtPbnN3NXFaSE41M2N1T0JNYVQ1NWNXczhOUTMxLy84eXRLUnJjeEtG?=
 =?utf-8?B?MWpUMEJzOHg0eEJpM044cUYyUWYyQi96OHNKVGtCM2QvVGxMaC9qa08rSGFD?=
 =?utf-8?B?bHRQNENaSi9ZczlZbE9wVzRYSmI3SEV0c0ZEdWNGRjlmemxnNG1hajc5N1dT?=
 =?utf-8?B?K1lIT1Nwa0lOZnAwTkJqVGxZdUQ0UFFwR25Rcm5pRk1YQk5UbXBvaDFCZmlB?=
 =?utf-8?B?ME8zYytSUVNiVllNUVM4TGgvbkE2U3NhUE1qRzNLTTRQNWdHaXkwaFhTc2R1?=
 =?utf-8?B?cmpjeE85VHhGL0JEUGM4NWtaQk1TbE1jZEtrN01IVE4vZG9KQ01uQ2xBTWgr?=
 =?utf-8?B?NURNeFBrZWxiN25OdG1Ea290K3JDQUg5KzFRNUFXY21YYmR2cXk2VUdRZkcx?=
 =?utf-8?B?SnlVQnlTc05FTWIwTWJwOVhQdUxSZ3ZnU015dGNUM2dvOCtZSjhINmdKSGMy?=
 =?utf-8?B?M3JvMGE2QUtoTGdLVDAyUXduQlpRb2JzZUQxcWxGRXZWb2x3UzcrZVIrSURE?=
 =?utf-8?B?enhEalh4KzMzSWpsdE50Rm5JYUlPd3pVajE4UGV2QjcwamNkVnZyeUtiZ2NC?=
 =?utf-8?B?VHdMU0JRV3lRa3pLWTJHVUc2TkJqMDFFUUJ1TXM0TzlWMUVFcG1Bc3E2VjRo?=
 =?utf-8?B?K2o0d0FVMzd1THBGSkdRbllXUk1qLzRpdlA5Zk9vSGdjVUlhM3lBUjBYZndX?=
 =?utf-8?B?aCtDVVptQXVvZVZQL1kvRHF0aGhFQTBibHpsSGx0YlVsRlZpMWhFVHpNNUxE?=
 =?utf-8?B?VnFhZVJMK2N0TVcxSFQ0VmJSNWcxR0tMWGhYa0QwS1UrcXJFaEp4SnhKN0NX?=
 =?utf-8?B?Z091TEFQM3o2d2dyWlBFNURKMHYyQ2haRTdZSlI3dmpFZXJRVzBmRno3NEcr?=
 =?utf-8?B?a0ZzcEZCRkE1YW9RT3VTb2tVdmRyZSt4MDk3akx4ajBsalF1UHcwbVZIcngr?=
 =?utf-8?B?RUJWeFhqRG13azVYOVdCSlJJeERnVEt3NWorbVpvOFVWWXJjUzFrS0ZwNkZB?=
 =?utf-8?B?WkgzOVJxL1RReENJMUxyZURtZ0ZiOU5hNXJ0QlNFRW5SQ0dUb2Z1c0E0NlhU?=
 =?utf-8?B?TUMvRkx6bXYyT01ROE1ER1NCOUJhQStyVElLWjEyOEd3Y1hKczZIeUlYTTZv?=
 =?utf-8?B?L29PSFNpV0FkcnE0Rmswc25iaU5WVHAyeWpSVnlLay9NYjZwT2dLbTQwUUxB?=
 =?utf-8?B?QWFPRjE1VzFReXVvNTJCV20xc1hPeWxJaWtCUERwRjNCVHRBZ1JncDVwR2Jm?=
 =?utf-8?B?cmlCbE55dW9vam9ubEVVYnhaVmVIdTdmQ2w5V2NucFlIRkVjQ2lkQWhtMFhn?=
 =?utf-8?B?Y1lYSHhHcTQwL0sxdjFra1ZkSXhxMEphSUVnd0RuWnN1WUlEL1k3NEJ4N3RW?=
 =?utf-8?B?YjgyRXVXQkZCQTBkczFzM2wrdk8rM2U0ci82ZkhXRjhUVVVtY3VrU0c2bHk3?=
 =?utf-8?B?Sk50M0xCMnVCeFpXcGZtbHFDeVlXQTRORjYwSWJ1NXg3OTFzTllxSG0zbzZQ?=
 =?utf-8?B?TWZjVUViZG8vbjRRY2Y4cjFaL0JlRDNrSnpaNTVnWlNRdVJIeUd0Z0xJYWJ3?=
 =?utf-8?B?TXpvVGVqdHNXRE1XNTFnRmllcmRJSnpXaFNXbGlRcUJQeTZvU2JjYVdlUTJi?=
 =?utf-8?B?clRLOGZ1VVpQdWNaL2JIeGh5QXZiU2d2OTQwc3NQUXlFcDVrVWRJdW1uMHN3?=
 =?utf-8?B?d0h6TU56RDAxOTVUVXlLeVZ1Mjd4M0lWTFN4RHEyeEwyVmdnMlNneUUrNTl4?=
 =?utf-8?B?TUo2K1ROYWJQS1RKYk9RZVpNazB0Tm9XYVA3dmRyZXMwYUQvWDVWWEdnWFlO?=
 =?utf-8?Q?8SjMcHd03Cdi4qRXxz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd17c47-8214-49a4-ffa2-08df07b009e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 22:34:37.4587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Le6eDtApUP7vnRMgl0+Jh/dwe8pCf+Ft1qbikza2pIuZXN4pxDiYMjCMzJ3UR9oSrs6/1DJney+ewhhgeapu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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



On 8/31/26 14:56, Roman.Li@amd.com wrote:
> From: Roman Li <Roman.Li@amd.com>
> 
> [Why]
> igt_amd_read_link_settings() depends on an artifact of a kernel bug.
> 
> dp_link_settings_read() passes strlen() of each format string as the
> size argument to snprintf() and advances its output pointer by that
> same fixed amount, so each of the Current, Verified, Reported and
> Preferred records is truncated at a NUL written inside the buffer.
> The parser rewrites those NULs to ';' and uses them as strtok
> delimiters.
> 
> A kernel fix for that truncation is pending [1]. It makes the node
> emit a single, properly terminated string, at which point the whole
> buffer collapses into one strtok token: only Current is parsed and
> the remaining records stay zero. amd_ilr@ilr-link-training-configs
> then writes a lane count of 0 taken from the Reported record, the
> driver rejects it as invalid, the link is left at its previous
> configuration, and the trained lane count no longer matches the
> requested one:
> 
>    Write training setting - lane count:0, supported link rate idx:0
>    Actual link result - lane count:4, link rate:0x1E
>    Failed assertion: reported_lc == data->lane_count[CURRENT]
> 
> Parsing by label is correct either way, so this can land ahead of
> the kernel change.
> 
> [How]
> Locate each record by its label with memmem() over the number of
> bytes actually read, then parse it with sscanf(). Searching the raw
> buffer rather than treating it as a string keeps the parser working
> whether or not the records are separated by NUL bytes, so both old
> and fixed kernels are handled.
> 
> Tested on eDP with both kernel variants: amd_ilr passes in both
> cases.
> 
> [1] "drm/amd/display: fix malformed link_settings debugfs output"
How about using Link as below?

Link: 
https://lore.kernel.org/amd-gfx/20260624180829.4775-12-george.zhang@amd.com/> 

> Cc: Harry Wentland <harry.wentland@amd.com>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Roman Li <Roman.Li@amd.com>
> ---
>   lib/igt_amd.c | 46 +++++++++++++++++++++++++---------------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 47e587e54..79052979c 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -833,10 +833,11 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
>   void igt_amd_read_link_settings(
>   	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
>   {
> -	int fd, ret;
> +	static const char * const labels[] = {
> +		"Current:", "Verified:", "Reported:", "Preferred:"
> +	};
> +	int fd, ret, i;
>   	char buf[101];
> -	int i = 0;
> -	char *token_end, *val_token;
>   
>   	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>   	if (fd < 0) {
> @@ -844,29 +845,32 @@ void igt_amd_read_link_settings(
>   			 connector_name);
>   		return;
>   	}
> -	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_LINK_SETTINGS, buf, sizeof(buf));
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_LINK_SETTINGS, buf,
> +				      sizeof(buf));
This is an unnecessary modification.

>   	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
>   		     DEBUGFS_DP_LINK_SETTINGS, connector_name);
>   
>   	close(fd);
>   
> -	/* Between current, verified, reported, and preferred are null terminators,
> -	 * replace them with ';' to use as the delimiter for strtok. */
> -	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
> -		buf[strlen(buf)] = ';';
> -
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
> +	/*
> +	 * Some kernels separate the records with NUL bytes, so locate each
> +	 * one in the raw buffer rather than treating it as a single string.
> +	 */
> +	for (i = 0; i < 4; i++) {
What's hardcoded 4 here? Should it be ARRAY_SIZE(labels)?

> +		const char *label = labels[i];
> +		char *rec = memmem(buf, ret, label, strlen(label));
> +		unsigned int rate;
> +		int lanes, spread;
> +
> +		igt_assert_f(rec, "Missing %s record in %s for connector %s\n",
> +			     label, DEBUGFS_DP_LINK_SETTINGS, connector_name);
> +		igt_assert_eq(sscanf(rec + strlen(label), "%d %x %d",
> +				     &lanes, &rate, &spread), 3);
> +
> +		lane_count[i] = lanes;
> +		link_rate[i] = rate;
> +		link_spread[i] = spread;
>   	}
>   }
>   

