Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B6606A32A
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pv9ffDfU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39710E484;
	Wed, 11 Nov 2026 23:33:27 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316E610E487
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 23:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDMnZtxJHC64c835CF7cU9v8EmlTGEzmOWbkV4OtR0WKj9txRjWHdxG2ApSUqn9Xr2sbsZH41N29A5LvraWhryWUEEswYBH8VUqAZBTHRqrD6IGjmLtbYU0GfXCDSYUmktasaH0l2r/+1NQHFCHOttmOsJdv7t/Mxua2uIV445BX1zPWgA5SFWiuIuuR1djcWxPe6FsYNrYAkkpynfg9VnmanWYz/gOddG7tioKUIXGu5MpuD/cQl22kkkDCmEO1t4hPn8vjOI9abaI0R96//8F/0os00FnZDqVleyPyCI1n/0Q9VDUVL3CpMlYcG44ZeGC8zNPjAyO5KshcOl6TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcPTZM9z4djC32mye/qNVJVBLt3O4rfWDZpYS0WdO/M=;
 b=qaYf18Pn23TLlIOCFFCxrhVZbqrpxT4cMDY1+bvklqvMXPnBASDf8gmlM+eAKoNkqner16j4d45zgcISvBDHNTB5zhusX7/JkFehXY22+GDSNEryIvjQj/M95dr1s1G7h0vF5NqmekW6fHqGS1y/DY3T40qATxX0T0AWMV/p8JWLmarxD18aQTCQVEgqslBMP6ojwYsghCg9TOSu++Sx5ie2X8dsB2KThT/zLVA7FfSE6eY0Qv8UByEiRJ7PSZUe6CC49EB/OE4KXv4E7iCCjxgl9GuYuWAJl+jc+XFB6AR4NacM1uS5iu995bDpS86BxX0REEYKCh4BxInMgm9FNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcPTZM9z4djC32mye/qNVJVBLt3O4rfWDZpYS0WdO/M=;
 b=Pv9ffDfU3p6yi3Ths6AJMWBwgcOWF/eKZefWskO0q08dgxDfNSnrLanS4ylL84lOzF5SzQURRXRjh8rFEeWMFf4koyfeftB5n1Bx2xhPs0F3Mx55czxY+vQUyrZS/YLRn4Dn8tbWjkZl7ISyqsEgpaVVUG+flveJG0Ga0QfIUp8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by LV1PR12MB702339.namprd12.prod.outlook.com (2603:10b6:408:50e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 23:29:21 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 23:29:21 +0000
Message-ID: <631cb306-495e-4e77-8eb6-a0c6153d50c5@amd.com>
Date: Wed, 11 Nov 2026 18:29:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: program COMPUTE_PGM_RSRC3 for gfx12 dispatches
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20261111063810.3878508-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20261111063810.3878508-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To DSVPR12MB449095.namprd12.prod.outlook.com
 (2603:10b6:8:4fe::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB449095:EE_|LV1PR12MB702339:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2f081e-a31d-48ab-b30b-08df404b9d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|3023799007|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: OBkb4+uoIzUItRcQCT5gdlMGF/8p1kp2P8o52En0smF38UV5L1r0GGpxyTCkjCZRvCYkdkP1BS7r+OazysQRy1+0IONgEBuC34jOMgYlCDcOYskE43t7JJSJqE5Gd8H/wDqMtHNwROTF13S2msHiel73TwQhb5zB5JtJLwTT2G2iE8s3cF7J7sZVt1s7YQDMbg47z/GbJG8W7Sarx3LDmb46SguoiUR8LrJKkQb+uRJxDy5+bKCjrXTHdg1GdP2zql6u4Mr6Dvtpl1aurRC/N6D769Umt70LumIRJybQRO/wowVCT5THNY48BLQVtjqIq4JnNvvK2toRQVeWRgWleOQCS5E+H5mIH4cvi2RKNp6NeuTb/b8LPUwPSiyTtuvxSAdF+y2hjeMvqmBJq2NxoGgk+m81gxyZYEPRlttjnSsu5GD/kX1+WNIQjXVTYLfvWvEIsiav6Q9Qmv/2bzb9Rp0x4vfibJCopTRrJHFJlvpuvGs4cosnJnO5229S4zVJ5wriAb26Q8rT12+bNPmOQEGmw/ME2nYJMSbjJuobbK7+j6LkicwaiB6ltg7U19AhBccOWQIu6yZqYnYFcTygLgTPeaXGT+mR5uc/16eWAz5+84RbkZwC6DqG+DCZ/8X3SIAXgiSTAWzcoqtcVwewrq8UHQSanXGqXspi8eoCIp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZBbldScm1HV0c3SHRieVE4MmZvYlE3VG8yYmo4L3gxNXhpWDF1Z2hxTGFB?=
 =?utf-8?B?ODA4cmRuRmxiNDN6cEIxL3VvajFQdXl2UE8wVzNNMXVtMk9YUFFkZkFiZ1JL?=
 =?utf-8?B?aXZoK2xlVUJ1MWxOZUN2L2hIY1kzOTRoZDE5MzhQMUI5QktOaTZoYUNwblQy?=
 =?utf-8?B?dEFROGg3L3V6Ym5NY0tnMkhzWXlVZ05BMzBtY2paVmlGTjBrYlYxaElFekc2?=
 =?utf-8?B?aElaRy83VUNhVFp0NjlLMmZJekkwTEtQNDI2WTBjTkRGREFSS2NCR2h2TWZW?=
 =?utf-8?B?bXFiREc1ZTNtME9yZUFYb3I5Z1NNaUI1cWxDcTRhU0xHQWxDSkloeitGVUNr?=
 =?utf-8?B?RzFPQmg2Y1NtWm9ZWCtJVjNzVGtwblEwL3FFRFQvL1ZVRTVLMWlpKzVXaDBW?=
 =?utf-8?B?aGpWQlpQeFBCVFUxdFNnRDdtdHlGVnpYdFlrN09IeHNWR2oyclZMRnE1OXE5?=
 =?utf-8?B?WENIb29RL0VBSmdFeXRTRUZvakNOV1NKVWVaNXd4NFM3TkZ6R0RJaU9TdmpM?=
 =?utf-8?B?dVJCOVV1enVEUzBPa2xJODloYVE4TUkxaE14WXlUT2F3Rm9yNis5UDdSWFlK?=
 =?utf-8?B?RmFsVG11d0hFOGNoVm5NVXRYbU5tWmRiWUgrT0R1YndnNWpMT1hRUGxQWWtX?=
 =?utf-8?B?Y2o4WTdhNXBOZmR2MzNqQ1RMSlg2R2FuSnk5Z0cwY1RJZVd2SktoOVcreUt2?=
 =?utf-8?B?cm13ZVY1citZekF1K0N1SStpaXNwWlVLcXl2NjZhMVZQbjBKdlZqM0JVbkJN?=
 =?utf-8?B?c2NvQXlHaFFmQlh6TXZWZjRRTG9yREdrMEhSd0ZhVFIrM29NNUtDMmRpU1ht?=
 =?utf-8?B?UFIreVY4OEIrMmZDL0RYMFFlU0ErZHhhWm5CTEhpVWVRYjhoeHVaNEtKQmFD?=
 =?utf-8?B?Z3ZWWGJYcEU5T0paS29uVWM0U0NoSFVtV3FLdDJvS3NlR0tFN0NuZmF3bWF1?=
 =?utf-8?B?NXk4SWJiRUU5ZnNaVk5qZ2h0aFJoUUtrTFdBVmEzdWdOUzh3ZUx3eUdYODg3?=
 =?utf-8?B?ckNTdHRtbVg5ZmFsRklVd0VncnREOGMrUHpEWVk1akJYemJJWUkwcjB3TVFk?=
 =?utf-8?B?Yk5kR2VvUzBnaTFIdFFQY1haVmZhRGt2TFJxbWdQMkQ3T05yMnZXOUg3QUlP?=
 =?utf-8?B?ODZGdHdzWUhIRkh5MW9LTmVXOTVaR1gvaldBY3k3UUtKOHhDUzVHT1dxQTk4?=
 =?utf-8?B?RGIyNS9WMzQ2KzZDWTF2VkxoV3ZpUjVXZ21OWStiOFZtSWIzb3ZMd09WMnZY?=
 =?utf-8?B?REs0dW9iNjUxbnJWT01FWDQ2SnBMeXpsdUYycFQ3WDR4aHFMeUhNTzN4N1B6?=
 =?utf-8?B?WENubUNWeEF4N3QxdXdFUVhnRTVEQU1vcGR3ZldJdDE2MGVhMm0vemdmQXdp?=
 =?utf-8?B?MkpiNTkxY2xwOWNkaFhQRWx5bUMxcDhhT0hUMnNxUFQ1V0d1MkEzZk4vSm5M?=
 =?utf-8?B?QlVpcFZCVURGd0ZuZ3YxRW8wYk5hYVNCOXdpVTVmRnVwRUtZYVh6NThZYWRu?=
 =?utf-8?B?WFp2MXloSExITjM3cjA3YU53cC9ieElNUWQvRkpndkVvb0dEWXV3d284dm04?=
 =?utf-8?B?SmNmUU1LZG9tZlRVcExYVkxtL2pOM3pZOXZFWE1mZUlMSHg5OEdsd2FndjVQ?=
 =?utf-8?B?SzJyelRQTDFNcHM5cUt5U0ExYWF5NzdoS1BIZS9aVUZuL21uRmErZWVRemMv?=
 =?utf-8?B?RDI2T2EyWjJMdGdWOFlEUzRGQXJacXhKSnkxbm1jbmFOUXRwTis0VE1ydTNx?=
 =?utf-8?B?RVF1ZUhqOSsyRXJRbzlVczc2djVlRTdhVFFmYkZUcW5jUGVQSmZsaHdvaWN4?=
 =?utf-8?B?eXhJQU5vWnIrRDViMlc3M3JvNXRieHYrNjA3SHJnZ3J4QVJ3ek9RbGNHb0Yw?=
 =?utf-8?B?dmZQSTdETEo3ZWhEWmNZZ1I0S1crZU5NV2NaZGlhdzBWbFd0RnJONU5yQlBS?=
 =?utf-8?B?eHA1clBIV2VYQjAyUGtuR29jN1pPQlU0dFUwS3FyYmZhZXk0NzVZK3h2ZEpZ?=
 =?utf-8?B?VEVWN0ppc0thdnJHWjhmUmc1ZW1qR1p0K2k5TDFpeUQ2Y1RkaE5mU2xOYkRq?=
 =?utf-8?B?TnlZUHpJZXFlR1BJdzIydStLRTJyUktKV282alFHOEV5VFVYY3BTRTJ2dC9L?=
 =?utf-8?B?SUtRR3BWakRiSDkwZnJTSHliWkxZdy9wTWNpelZPK0xvbTFkdm1sSDdEMSto?=
 =?utf-8?B?WUFNVCtOVS9LSTV4ZkNxQ1VLZkVzeEp6bC9zVUgzWFl0eVpaMHJOckhSV0FG?=
 =?utf-8?B?dWhnaE9GWE1UNW10QVUzSGhNbUJkamZvdlZyRnlyU2Y1WHl4TE5CZnZaVHFV?=
 =?utf-8?B?Y1FjL1hBSXFCTDZWandiU1lxWTIraUZjL2lPOUkxUmJSQkZ0cWkzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2f081e-a31d-48ab-b30b-08df404b9d0e
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:29:21.2989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scYyBoWqyGuuya1lHQxJ+2rhBaX6tFqP29fpNAMrVwxOk83TOp3R+mGJ0FVbOM+1sEhWwB7cnVhdfiZhnFqbDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB702339
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

Thanks! Reviewed-by Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-11-11 01:37, Jesse Zhang wrote:
> amdgpu_dispatch_write2hw() sets COMPUTE_PGM_RSRC3 for gfx10 and gfx11
> but not for gfx12, so the dispatch runs with whatever INST_PREF_SIZE is
> left on the queue. On a navi48 gfx user queue that makes the instruction
> prefetch run past the shader BO into unmapped pages:
>
>   [gfxhub] page fault (src_id:0 ring:24 vmid:8 pasid:1199)
>     in page starting at address 0x000000010011b000 from client 10
>     Faulty UTCL2 client ID: SQC (inst) (0x9)
>
> Limit the prefetch to the 4 KiB shader BO. That gets rid of the faults,
> seen in 4 of 40 runs before and in 0 of 70 after.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch_helpers.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> index 1105bb54b..c05198d8b 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
> @@ -224,6 +224,15 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
>  		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
>  		base->emit(base, 0x228);
>  		base->emit(base, 0x3f0);
> +	} else if (version == 12) {
> +		/*
> +		 * mmCOMPUTE_PGM_RSRC3: whatever is left in INST_PREF_SIZE makes
> +		 * the instruction prefetch run past the shader, limit it to the
> +		 * 4 KiB shader BO (in 128 byte units)
> +		 */
> +		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +		base->emit(base, 0x228);
> +		base->emit(base, (4096 / 128) << 4);
>  	}
>  	return base->cdw - offset_prev;
>  }
