Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB34E10FC456
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 22:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C7110E03A;
	Wed,  8 Apr 2026 22:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oVCtlPZj";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010069.outbound.protection.outlook.com
 [40.93.198.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E646510E03A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 22:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1x7NW9WAiIGDYON6I2paDvNvWS2d1gs2FCN9WZraBwnay+fIy6E7kxEaATN9RN9Si8b3+k1tUj97bnKMsHTcy5RRjyiUzYBaVVosuMAqOo+8MAQsIOpq+qxVqNf/66FEBaDymdP2LWcVIZbOqFnj+xH2TeTareicU6kDGc2R2JYd0gk6roohY2xiLAnS4ZxXk2G5QFMsPUEi+TGSt8VVsUBNf59XFNrJAGE5aVYBtuVNXzkURW6HyTe0pcU3Es/0HYJL4W92g8163NjgqPLJXrONaHfO7CE9F36JZB+jz/s/m3V8QxzxCoxCXsQX5V5sL9J2dy7qoL7NzBwc4Zbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InzXqXoMzwThCbWn6EuBH9RmIhBZ2pM/RAg1dIQ5rNI=;
 b=vQiAAlr0JIqNSrTMi/5nNUC4A59S/RKWsiBJryTfSa8PTfyuGgEbycc+1YdzuM3LgBq1V1e5XM5qhFolzIJF6Bz7isywGh72lgtNaOcQ+bMj8+7SKEgFJfWQxFkIGBSXlx9E87oqpqUjLy9oRlouOe/Bd5di8Zyz2V8aB0s37+MyHkJxd2HIcshvxjAY0IUgl5GAhjdL+4MZp49nkYIIg6eqmMV5JqxhHcbnN3gd2kAMaExSpCigqMHR+WxiScJxnclmwl+ZsgzDOEw1IF5guyZFbmpn8UTqxUHYuwvobg2uruZDFKzmChb+TSiSaEMOlQvulP7PRLyaUlVaxGxLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InzXqXoMzwThCbWn6EuBH9RmIhBZ2pM/RAg1dIQ5rNI=;
 b=oVCtlPZjzkvnhXFy1z7NqTCraboQFKdlgsn7g1xp/D7VcRX7gc320LNlEJJ8Kgj8V4vXm8z4fPgbp6nP+k8hnHkfn31eUxB9w0o07JmV2uCw5jcZIJFmst7JpB+RucBkAIOSL2NAG/6uYR2t1X/1us5OE8WxZdiC38BChkYaM/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 22:46:27 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 22:46:27 +0000
Message-ID: <a3f5f5ad-36a6-441c-b220-20dc4c7c9271@amd.com>
Date: Wed, 8 Apr 2026 18:46:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/amdgpu: add oversized invalid packet length
 error handling
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260408024821.2515174-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260408024821.2515174-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::15) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb93f96-ca42-4195-c2ac-08de95c0aae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: k09BwiSGL3Ajtizxc7GuNuL4mQILegYdwuCWTPUyRoWU/W3ug+JCMKcWccEiO+7LLqMVtg+z9ctZRny9PatnvdSr+H8dBIq9SoReA7L9lQt5BpVhb95dtfPVQCSTaIfuq5+zV8+lcCAXvMYn4l6GGDjaFz+TCAYE5GFtyZT1cEg62aa5SLr781RKs7cGuyMBRIkp0uCGktKVBb6QJbz1EVhFo/gmEG92BugFKwEMFV69cTONyF0QgzZUAcIDOSVvUlTdYC8WTkEF/1yds5qhvrfkwwiysbCOENPW17O/puttxDl+JRSzyItNJe8xgze+dUQEu/Mh9ZCgWGqn4wPeNcSBFf10cBkgDlxj1XX2F4H0JbkWrDhWSeUyTQeo5ojrvpgC5CKJxpBSmkWNunFotrOgDgsyIYQC+ZsyqtKK4pm0lu7YBl+QbgOtJfqORF1413xWnROzQQfkOUE4M5DEfthZyO0SiKna7CfbTKO07EWE2qu8w9GDVXU0TewddoFJ7zfiDrEWsL9ox6lsCGhEyvOGwG66xKFMU/YuWRhO2VgDSUV4zvKo5y2+KdKeRHXez5g99zZQ2EvdKn43x6+JnrUow7W9n+Jx0nyr4dzhu3ic3IUT2+mCnBLOvUYE2WYT14DVseGqLnpvJoge5fzzrGxvLSnRABpi5Sp9YNlxyzz/xRkdqYeQCATEIpug1Qul6dHKoS9DOY76wnP1Gpp32GMqCHMxzppUfOHqjoxZit0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVAzWU5wM2ozVDM2NFhxTjhTN1h2R0VwYnQvUE5rbmNRTDdxYk9vTTJkcENP?=
 =?utf-8?B?MCtzN2tFVUVSNFJWekVjTmNmM3hUYnUwVko2c01RMXBCbW1BaVllMHM1WnFw?=
 =?utf-8?B?ajlrZjk2dHBoNXkyNnNFTmx3QnJ6MzdlYUJtSVFHS0FWQkFYeDVKY2Vadmkv?=
 =?utf-8?B?ZWliMFlNZ0JFRkRGenp3THprZlF1bGlURng4aENLS2hVeEVuYnhsdTVTV0tM?=
 =?utf-8?B?b2RGaktVYXZCYmtXejczQUFXL0wrakNkbnBTTGY1bm5hVTJ2Tnk3cjZWcTZ2?=
 =?utf-8?B?QzFhZFVTWUpPbEx2eUlCRmJDTnB2QXVWZkR2S2VzaEtlOWdSUnRBb3VXUFhL?=
 =?utf-8?B?R2lwS1hQRFI5Z3dKRUtTdEZCZzN5RDVWeGg0VEtYYlh1ZEFEaGlYWmdGUFds?=
 =?utf-8?B?QmZGNmFTOGxoSU5BdVdxL3BqcFptZUpJRU94ZjZhVmNKSmI4cU1abnVaTmdj?=
 =?utf-8?B?WU4rdnZLd2tNUG8yaVkxUXJ5NVdGelZLNkpZTHcwaERwYW5jR1IrQXM2R0xk?=
 =?utf-8?B?TzNmd0Fmd2FwUTR1dGkvME1xZFNQZnFaRVZtSC9QL1Z6YnZEVml4dkExRXNO?=
 =?utf-8?B?d0lNUlV2VGcybU82VVR6Vyt5dzl6VXFtZmtva2labGg2YzF4ajNJSHNDUy9Q?=
 =?utf-8?B?SWdXRHVGbmgzbkk5MjlhY2s1bDE5K1RsTFVaQU5jV291QWxZZWJsdGhlTis4?=
 =?utf-8?B?SjdvSFBIN0xvYXBIaGdsRzFjWDVPS25BMGtIeUI1RXpLS2tweHVXbUovaFlr?=
 =?utf-8?B?ZFVMTksxZmdkOHFScDJUUEowMFV4enc5b3Nob3BPcnVjTU1LbFQ2b252SXUz?=
 =?utf-8?B?YlhIRVBKMkRsam8wVDM4ZHp2ZXlidDl2TTJNZzBTUFBQVmN2c01WKy9YWTZ4?=
 =?utf-8?B?T1g2eHlPWDFwRUp2MW9wb0FJSyt6ZlRSOGVnVXlFQkVOVmRyWjZjaTZySThk?=
 =?utf-8?B?eE41WU9ucGliZmY0anFIYkZEbUkwSGZXSmZUWFBROHRSaXlPV2poeUJacDds?=
 =?utf-8?B?blVqVmZXRkxFVGhmT3pwL2FLR1Npb1lCOGw0ZVIycWNSR2k0THBLUjZjMDRB?=
 =?utf-8?B?bEczRnpLL25NT2FKQ1JMcUhaRnRjeFNId21iVmZ4Q2NHNHMwbmhEb0tiMkRt?=
 =?utf-8?B?aUtmT3hzS3d3Z2haMDhKYXRyVmFzbCs0K1ZJTVlscFV1YmVjU2VmSkJiMSt6?=
 =?utf-8?B?VEhYOHIwaDBKME9kUXgrNURRWlhHOThPN2NHQVNxQU1NT0hLZ3N6d1RQd1Zi?=
 =?utf-8?B?V2RlVk1MeVZucTNVenBQdEpuQUF5Qy9lZ2hQMEpZME5TWDQzRXRKTlo5RTFj?=
 =?utf-8?B?V0hvMUhRNTduNmxuVlkrdGhqMlE2ZzRLcFlsUkdzMGhLZUs0bHJIMnpLeEVY?=
 =?utf-8?B?SWRkT0pwQ2l4MzhMTFhPRGxkOFd6VEdDTXBrYVYra0tFemJEcW42L0hmNGMv?=
 =?utf-8?B?cDFHQVJNVVRicDRIQ2lwVDNCMXlrQ0R4VE5hQ25LRkdQT0F2am85cGpZM2No?=
 =?utf-8?B?dVQ2T0UreFNWbXpjRjlSSlcyQkozdGpGQSszQW5VZnpnUGdCOStFUVJOdmJx?=
 =?utf-8?B?a0w0NFR0UExLM3dqcjNWZzZCTTV2RnJ5VS96M0J4MnNJbVJxdWFSd2JqSGRq?=
 =?utf-8?B?RDZrUG9NbExpelA2TUN4RWVzc1o4ZXVTZWNTamVBRmJKaEEreW00V095d3RO?=
 =?utf-8?B?bnErR3hWejhVTmpPZjhrYzY3UmxoR0swQkZVU0lCckkxYjlCU1hWVldOeDlv?=
 =?utf-8?B?T2Y4SXVhZHNOb1JwT3Q0R2ZDeGN1SFJ3RnNETEtaeHlXQnNTQ05CbGlmcXMr?=
 =?utf-8?B?eStxSC9NaXZnUStmaWRJUTgxVjhFN2V1ejFEcEEvMUN5YWpzdzBSSVhwQ3hJ?=
 =?utf-8?B?OVpDcGpZcDRXZjVWRkJxcGxOOWViemp5WkdhTEhBRXpYNk1VbndyLzkrd0FM?=
 =?utf-8?B?Ui9GeTVoajZEWm5meERNWW9MUDhaTGtyYWJtcytjV1VKU1dCbDZSZlMvL1hk?=
 =?utf-8?B?elZsbjg0dXpUWnpXTm4zRTBZekpLblZqUHN2UDBnZ1lBSy9kSzlyWW9ZQjBH?=
 =?utf-8?B?R29jbnBnQ0g3ODVqSVVNNWw0SjNRZ3U0VHFxaXh3RDJzY3JraVd5UkUxTi9t?=
 =?utf-8?B?dWhOUUEzQm1HWEVJL3hWRktWTThRUVFGZjNCNHAzdmNYQjU4eDlKVlVCaVdS?=
 =?utf-8?B?bmxVQjBKd1FveExEOUdETHFXTmh5QXNCcGFabFgxVGN5am56WTF3SWswa1N6?=
 =?utf-8?B?cXlKL2E2Ry9uTmttaGUwckNsZmw1NDRDQmV3eXlFSFdtVHZGWW9qZzV1QW5x?=
 =?utf-8?B?cmN1MWcyVVBhcGhFZ3JEV1hCS1ZkeTkrVlJ2TjNFM3lIcmpOb2xHZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb93f96-ca42-4195-c2ac-08de95c0aae9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 22:46:26.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piYH+kc1wM5UuHaDxDeqqYoMwfGBxESLTqsRKgcFNFOp4ZTEC+fLlZ0ZiipeuOjlyPFjL7/E+nI8ip0TxIRShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

LGTM both patches

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-04-07 22:47, Jesse Zhang wrote:
> Add a dedicated cmd error type for oversized packet length and handle
> it in gfx_ring_bad_write_linear().
>
> - add CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE to cmd_error_type
> - in gfx_ring_bad_write_linear(), map this error to:
>   stream_length = ring_context->write_length * 2
> - keep existing invalid-short-length path unchanged
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 2 ++
>  lib/amdgpu/amd_ip_blocks.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index f0376a3e7..80aa5569c 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -284,6 +284,8 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
>  	  */
>  	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
>  		stream_length = ring_context->write_length / 16;
> +	else if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE)
> +		stream_length = ring_context->write_length * 2;
>  	else
>  		stream_length = ring_context->write_length;
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 6bc8c3706..eb118c68a 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -146,6 +146,7 @@ enum  cmd_error_type {
>  	CMD_STREAM_EXEC_SUCCESS,
>  	CMD_STREAM_EXEC_INVALID_OPCODE,
>  	CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> +	CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE,
>  	CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,
>  	CMD_STREAM_TRANS_BAD_REG_ADDRESS,
>  	CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
