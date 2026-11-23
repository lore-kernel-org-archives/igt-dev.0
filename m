Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2AA606A326
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PdU4/0aR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83D910E0F4;
	Mon, 23 Nov 2026 21:49:49 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013021.outbound.protection.outlook.com
 [40.107.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C2B10E0F4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 21:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui3z5aLyQ0HyLY50tmYwZo9gTYMjy5AehH/xyp1+7gWEFLlQFjMVdwUHsW7HGnGMKh/MF8XruPQ73QG2FAzSyOeH8rv3A4Tz0CAw6HLSr1Le7QoRVrzlehPNR1DEAC0Pn29Eelmb7yysnDRvhG7XFxD08tcwbdNnHLuqT13E1iSx40Mrf+y3Y+ViVxRmjx42GFjelf3XuVFYV5axiApiVvQQ5A6hWEkGmGirGUR680cmlY92JW+AQDZ2QZRgcWpNIsS0eMKos4dX0YjF3L6ME9kUOedHYU7hunmd7MVSKVYY4xPCElruPuA6Pv0NGfhE2+HF5C+3Cxoe3YXIR3Qx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxCO81qu3ZXiwJojz/THFXZ7ErTrqFUg7DWEk5DmP1M=;
 b=uXWQ4fVotfQ71g53E4c7cc5mmnG7mMLm8k3QZLM1iLM/6hZc6wn1htLs8M2F/F4TyGnHPtBvlcZrnQoA4ZAp1c8CbAhdToD409327KzXC3fw9R0wXrUQ384SDdEgAQZ6sGRgx1UtMSOz+1SP989yeoR4Ub8e3wE0iRajYirBOzz1tkQAk5ymd2gr/XohjIQHYjFH8caqG91fCSqs6rCsEOczTg2GVN9l5kCSnzJwOUdP6P1xhH0LfN4O27stjHFaSF/ShyZ3Su1gMWKDH5uzMSYYYwUIkh+MY2CnnTGfkI0SjTtsLT/1tOdcMaiFNdATmwdpaPU2lAYi6asueb2Www==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxCO81qu3ZXiwJojz/THFXZ7ErTrqFUg7DWEk5DmP1M=;
 b=PdU4/0aRJ+Itvt4X1tfrobPZh/7izBCxtUW0O1O93e2vRdFO+9ZFEw8qvoyiHjJskYYLxcOkjdaxTgkQSE8/n+2TBE0jj/Dy9KbeDwz3pf+FGwtBxP9o1V377N853HHpnsjvSFpGsO/YQDMkuP7fgizL5J5fI9TP0BWtMdYElJw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 by LV3PR12MB9141.namprd12.prod.outlook.com (2603:10b6:408:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 21:48:35 +0000
Received: from MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321]) by MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:48:34 +0000
Message-ID: <af7dc252-4341-4135-aaab-61eaf43f076d@amd.com>
Date: Mon, 23 Nov 2026 15:48:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/igt_fb: use cached copy for slow reads on amdgpu
To: Haoming.Qi@amd.com, igt-dev@lists.freedesktop.org
References: <20261123214135.3566782-1-Haoming.Qi@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261123214135.3566782-1-Haoming.Qi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To MW6PR12MB8705.namprd12.prod.outlook.com
 (2603:10b6:303:24c::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8705:EE_|LV3PR12MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 410c90ea-e5ba-45a7-622e-08df49ab85f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|261021123027099003|261021130227099003|261021133027099003|261021121427099003|261021135927099003|261022105027099003|261022113327099003|261026121527099003|261026135527099003|261102123227099003|261026140227099003|261022075727099003|261022115727099003|261026130827099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: ooXAcKTyXOa/2v+ZeGC93MH2m+BqTF3GGYpGW4LXbqbYkxS4UPv1tVqzEIqwAUhNLBXLBTqRg7kCm2OpPZkdW9l1PyFbaKVD5bk8rBasN98ZN/OOf+F6PyMHyE6jSKMGnVv/ZpMerSR90J4nAqwnC+vi7X5tVIb33S+Qw7pPNoBuXgsb+CIzEcbPwNxGY/2X9Z5ifv7nVLp72CFjvzWf0yfJGE3l2iiYn7r/q3QHNTm5PA3FZARjNZN/Q6Dg3/Ge+KqpBC9wWk6nu+k0YBLMqkWwixCAO5FI8NIq6MoA2waYp7TP6O7Fee1/oPccWxtEil9x8dpQsWmCdD2ebuPL8obMyKgUQJ1Br6c14xn+ji3cpvgXW3z3cTMsF+T+AZWW9RZRKzNqO3mIqPE/Li4AgA71rBtXVi8rWj7tKnkiRUYO35/9/ayPeLn2+ktwHK+3hdc/Z6ybgUcvLe6nAL5PfI0LOU01Y8MR8BaHvLHQ7P+exTo3R/6BNrvkfvrX40Oxw9GV2YKuxAb+jQZdiR94QWbx9tso5uc4jPAu9zWgtOwisW9ZrjmZod0Okkfw0ESndDbdNt8LgfHEgI+fryh53Q59PtcjXtWD10aTCaoXGdg2OAccb9+5Cj/2gJ8c7z/JQvi+z4NbyI72Wxr/FbOMjUvaEHA1WSiKumlLvXrRAbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021123027099003)(261021130227099003)(261021133027099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026135527099003)(261102123227099003)(261026140227099003)(261022075727099003)(261022115727099003)(261026130827099003)(261028144727099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnN5R21WK1BscWc4YldRYVhCcjNmK1VDcERsWmlJU25xd2tUbkhnYzU2RjBm?=
 =?utf-8?B?UjdpVWp4TnVPK2R6OXV1a0srczltNjBwdzF2cE1QNGM2U3dtZEtrek5lemNv?=
 =?utf-8?B?RkFMZmc2MUttUHA4L1BSVHhWRFhqNDJ6SUwxOEhENE90eGxDQjdIa20vTzZN?=
 =?utf-8?B?MVlEYmFrN3BOOVNVVWp0SmFWc1lBdFdsN1NYNFdtT1BUeDVRRm5KZSs3T2tE?=
 =?utf-8?B?bUhTRk94bmhRSXpPalptNWpsMDNlMk9qNTI4Znp1V0pSekZLSmdBY0M3U1hM?=
 =?utf-8?B?TzNkOVlKNGxDUTVVbE1rODdGcTEzcE5aVXZUQVUyc3VCeVg0VTFNSWxCajkw?=
 =?utf-8?B?UlpISE9UR1hMRGhTZ3IvSFZkclpsZ0dSd2FKSU5zOVI1TkV1czd5cElEektL?=
 =?utf-8?B?WnFMblU0VlJSMmIyREdDaEE0aGVwMnRpUWlxMUZtcWdNam8wdWt4MmU2Uld0?=
 =?utf-8?B?T0l1N0o3K0xJVUlWZ0xhRW5ScmlUcVdXMkZkVHZneHdtQlJyWFdGd1JCdUdv?=
 =?utf-8?B?ajBpaEtQamZoaXNxTTc2N2ZuUUJxWmk4c2JWZHprdndNdUcwM0g1MFRqYlht?=
 =?utf-8?B?UW9BRjJjNWxqREd5R0haRkV4WGdTVitnQm5kbVJ3Z215NjNBUXpKRDZqUm1r?=
 =?utf-8?B?ZFFhc3I5bU9maFp4Tyt0TklmOTJ5NmFmNDN6WHJkMktzRkN5RXAxd1d4MDBD?=
 =?utf-8?B?c2t3NUh6K29mV0Frd2Z5NzhiT1IvcjJIR3U4d0krV1dxa2F3bU5KSzN0R1Ba?=
 =?utf-8?B?WWVIZ2kwbVRabUJXTzBBZWQra2c5QXlxUU9Hd29sWFVQNnNRTzh5bnRNa1FT?=
 =?utf-8?B?QTVtaHJZWTF0THpxSEgzY0hGcXFqN0loRXhzWjB4T0U3ajhvTllGaFpuM0Z0?=
 =?utf-8?B?cDBMZ0dCb3k5QnBIc08yZ3FoL2RMUGt0VXpKNEc4UjJhT3hUVTdtMm01RHVl?=
 =?utf-8?B?eGlCckJBak90ejNkbEdZbXlzM0g5WHF2Sks3aG5keHNsb2ZybTBTNXU0c2VR?=
 =?utf-8?B?c0ZCUy9uYkUybVMxcGtaRnJtTEcwMHlaY3ppUnpsbDdDMFBSeDh1ZUNCY3JW?=
 =?utf-8?B?NFFpUHNmL21zSFlvOS9rNTZGT0M4KzE1ZlRKUGVQelFDK3FJb0pKUWVqNzEz?=
 =?utf-8?B?cGFoMnpWNzR2T0dFdnNJNWU4RWhGbmVEcjhYQVlHR1BMalRnU0dtMFhLOG14?=
 =?utf-8?B?eUY2cU5YSFlRTTU1MXMyMFFJUS9aRkZaWUV0ZlF4b1JWeHErU2g3WjlZZ1lE?=
 =?utf-8?B?bDBSandUV1lXQng3MUtuOUN4cnVkODhmTHNKbVlPRTBKUG5NWk9ydUVmMDR4?=
 =?utf-8?B?RXJQNmhYZG90UTJadE5rWHRSb0NSLzlwYzFDNEZWLzZoZ2Y1RHVYWVI1RUh1?=
 =?utf-8?B?T2VGU2FqRElHd2d2b1FMRXpucU1ybWllMmkzUWVta2lxTkQwSmUzSXdqN2FD?=
 =?utf-8?B?TXZVeEVDYTd2N0ZqQkNaOFJ2bmZoRE9DdHA0Y3cyWGw4OVI4UVI4NmJ5SFdr?=
 =?utf-8?B?YzhhaHpGc1JLN01zc05PNmt1ck5BTGlDMEo5QzNxRGN1TlgxZGlFTldDYjEz?=
 =?utf-8?B?eEU5OXF5aEp4cmt0MUJqR3BuT1VLeklObTlrOG1XQ0tiS21xdTJnV2dxSEJF?=
 =?utf-8?B?SmlETTcvQnN6bTdjMldYcWw2eTloaDJLbDZGVHFmNEltRERWa28yNTRVRUdK?=
 =?utf-8?B?TFMvNnl5RmZpYVZlR0ZUeDIrZzA4M2dZVW8zaHFoRmJvNzA2b3B0Vm9DUFU1?=
 =?utf-8?B?SW9QMG9QUzdqWjNwL0JvM0szOGpBeWkvV2E1K3J2UjROS1lIS3QybHlsUEVk?=
 =?utf-8?B?QjNIVXd5cXNHMStrMDFqVHhnMm03L2RUdjJ0YVJKVy8yMXlEOGtCVXllWEdP?=
 =?utf-8?B?eiswNkYxVkRLNWN0MjFUV1p0aEFjQnBsUkpQRWF6MEFEdVd6NUJBVkFEdnd1?=
 =?utf-8?B?Zm1lZWZsc3RLV2tsZEoyd1J4dFJ1cUtkMDFSb0Z6UFdHK0xnWCswb2RrR0xq?=
 =?utf-8?B?aGJoWWgrVC9TYkltY0FBcXlxd1Jpei8rN051K1k0ZlJBdXN4a2ZGeSt6eGNi?=
 =?utf-8?B?dEVGREdyWkxTMVBsSU0wdlBBMjhwakpJWkFnd2hSa3gyOFNjTFIrU0tHWkV5?=
 =?utf-8?B?Y2lmNWpQay8vTkdidWwrN1QwRllrYkUrWHNyR2FxMUVqRElVRTQ4N3Vqandu?=
 =?utf-8?B?bTdzZTZsUGRnV3BHSGNTOEp4Q1RtVGJyT2pjV2FsalZkZ055bUI4bDI1WjNs?=
 =?utf-8?B?UExBNDhFR1dycmFIL1Z1NlVDNEV3RHhTOC9TQnVkczBiSzk4NGxjQzFLL1NZ?=
 =?utf-8?Q?amR8hu2aOX/0LRnR5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c90ea-e5ba-45a7-622e-08df49ab85f4
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:48:34.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGbnfit73YTtJvWK/jT8AGb6vfPVFmvr8CZT961OqImmmx94zHyMAu1Z7TTdgIQsZCXytTw30mojxj2m/hU+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9141
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 11/23/26 15:41, Haoming.Qi@amd.com wrote:
> From: Tony Qi <Haoming.Qi@amd.com>
> 
> create_cairo_surface__convert() only sets slow_reads for Intel, so on
> amdgpu the YUV->RGB conversion reads the source framebuffer pixel by
> pixel straight from its mapping. On discrete GPUs that mapping is
> write-combined VRAM behind PCIe, where uncached reads are extremely
> slow, and they get even slower when memory runs at a low clock.
> 
> Set slow_reads for amdgpu as well, so convert_src_get() copies the BO
> into system memory with igt_memcpy_from_wc() and converts from there.
> On APUs the extra copy is cheap.
> 
> Profiling amd_plane@mpo-pan-p010 on a discrete GPU showed 97% of the
> runtime in convert_yuv16_to_float(). With this change:
> 
>    amd_plane@mpo-pan-p010:   111.3s -> 9.3s
>    amd_plane (all subtests): 7m40s  -> 51s
> 
> No change in subtest results.
> 
> Signed-off-by: Tony Qi <Haoming.Qi@amd.com>
> ---
>   lib/igt_fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 3d15f0595..e993d7d71 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4803,7 +4803,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>   		igt_assert(blit->base.linear.map);
>   
>   		/* reading via gtt mmap is slow */
> -		cvt.src.slow_reads = is_intel_device(fd);
> +		cvt.src.slow_reads = is_intel_device(fd) || is_amdgpu_device(fd);
>   	}
>   
>   	cvt.dst.ptr = blit->shadow_ptr;

