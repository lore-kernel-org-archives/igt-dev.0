Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26117C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 16:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C3810F114;
	Thu, 27 Aug 2026 16:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yzRRBloD";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2767310F114
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 16:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpYfpLDDklio2guDCFXB+zt26hKGM8NmD2+GzKmDwFHXUEC+padW2gWUb+HYZU/SbAIHiy56XryrCQ56nrvD0i3F1y3XzjgMoYMC3Sojk2+SEcvCYAX63lsT4LM2ytdZatYiHLnGH1ovU094uL8SWZ3/LH7/bCOMQZV8YwCFy6JlUBcbYp530eIRw4MMJGZsu5o/VmxA+r5DHI4qWsVGN88ZmgPEBQ1EXPBLzFcf4kniQAQrbgbth+SeijM3IjDtuiXR/EBbPOmR48WLi3jy5LpEgjFCeCBSgXoZrEyU5Sx0OXs7wv71kOQNYkUZEtdJIQ18YWK39ydXZFn32FuYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA2qbTBRpcEKu8RlGLIUTYVaNwWEs9v56Uzoo4Y7uF8=;
 b=Qw/TYzrFRA/Hw6ppjp5GNsyciNayIuVK2gYDcgYLFecNwCRJfgT4hejlC6jXcHKgLSXofvRE3ffR1UkiIhGFdU9V2A/C//jhpYM9ZftT7AR+pVZ3jt75eL54VLiWejd9EzHj1WR46DYfcmGytdXUgmthy96xtsm1fdQ4k46MjcJM1Re/Sn6JWS2iCcHDRh+VwOBSMUrjSO5jBfQfPgwXCbSrJmithr65NS+7bgb507WhuOsNN4bL8lM6yjjNkleQmB2LLowdsw/sCIDIdTzy7ytCtk+3Ej4bvrie8oyRCzCYUGIbrZ7JxQo6IPgYazxytZigQh8/DY52DOyHMg0VLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA2qbTBRpcEKu8RlGLIUTYVaNwWEs9v56Uzoo4Y7uF8=;
 b=yzRRBloDuaaPQnMyJBYaOt9c+h/ue5E2cQtvy5RCk9cO/x0sYrRV7lPsFTpxt83niLyPAVP5QGDNVN9s+q9Iuoj/WWn8ati22MqS3XYVXBtKQmfshzuimOgbtesYvTtPCj+YD8tPSvaEFXOmtgFl7yCOQef9xY5/0nKoya59dSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 16:40:00 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:40:00 +0000
Message-ID: <bcfd261b-b64d-437d-8037-f04d546e467d@amd.com>
Date: Thu, 27 Aug 2026 12:39:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: add GFX1154 chips for IGT tests
To: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>,
 igt-dev@lists.freedesktop.org, Vitaly.Prosyak@amd.com,
 Christian.Koenig@amd.com, Alexander.Deucher@amd.com,
 Pratik.Vishwakarma@amd.com
References: <20260827064743.3002608-1-Kanala.RamalingeswaraReddy@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260827064743.3002608-1-Kanala.RamalingeswaraReddy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::12) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 5885a759-ad3a-4a80-e6e3-08df0459d5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: hl/FttJ8ERCYMRC94N4rQL1BX+CCswtizTiGXyaB820pqB0YJpLamAM3qCosq1ZJHCqD06XJzCiiwMv6nJWD2rjENISy1+p20Z3G1HlS2/FTwwzAKV5kUcQXpn5j99qzVx7ZS7u7fyEbVEQ2FRcwTPZSyEe1XzUceH+t2N4hS6+wrlmkDaUTlbo59gOfRzJrhldQhpDUCAYeTZJN2v7kjmJAa9AubfnniMl++t7ELifk985e2g6OEndR95KkpKmpWYgrLgRAgJUMhpe80Blz4j3fMHs85DIWJ6OiCZ0R6Mop/IWPDMyqbFtKEbIhuedNfIoh7fglpsjIst7Ph6mhVvVMe2Da+UqZgFOLDXyqJ4V+YkfYEmiyk7bERmhYbZPnpG7pWetvSd0jeLhOY39YxCbl1gt2uDl98XiKH3NmePZFXCLrM9Xz9JfM+AvS63Si3Vxjq/hT/DszXm9hBp9Vscv8gIzSfIPpos+hNJCT7EVQycIgwwM9N/sONu0/skWu3Zmj7o/K/0GSbsCmaKvk9EJxSJT1vdpogy6rj26txwaasKEkRI+OTzsMwWeoSIutQO+KhfSzdrEXcwhPXzHgELjNVnGERG2ge7aMlLSptbziZGdoiTCidA4lVr64q+Q3At3CwYt2N/EMut2lYC+0ix0jDDaBE6iVS/ePy+ZGlm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtzN1lSbVNPK1hmTm1JRDBoRTlsd1F1ODNiOTF5MDc4dnJoWExTbndVNHJs?=
 =?utf-8?B?clZCaUZieXZ0cE15WG1Lc3pMSzJTTmRteTBRbGQvRXFIV2RZUXArNDgyNTlV?=
 =?utf-8?B?ZnJxQXBUQWlUQ0o4cUxhc2Z6cFNTbnk5NFJCRmJ2dFJwdVRiRjRLRkhXdXNG?=
 =?utf-8?B?a2xnTkltM2tPRW9KT0VOZzVJSVVBNGhsd2FiZUF1RFJpYm5kY2I3NmswZGd6?=
 =?utf-8?B?dDdnK3k5RVpDc0x6empDdlFnQ3ZtbE4rRkt0VjIwN3NYaUtneFFjU04rYmtD?=
 =?utf-8?B?UUFqNWNlb1Y5d25EQW5UN1ZRVStuZXpMTW42ZnJLaE5oRE9DK21jRzVhaTBT?=
 =?utf-8?B?MXJKeWx6eWxPMDI4ZStJR0h1RG00NU9zN0E1U01sZXlxcWxVdW92SEFhYVNo?=
 =?utf-8?B?UmtWWVBVb2dQa2JkbWJCSzhraXpqU0x3alo2aklHVWFRUTFuQnlkdE5wREhh?=
 =?utf-8?B?MlBkaEtheTJiMkFXbUk4VVBpSWRjQkZXbUtqUUlYMUpBeVRtb2F6dlliK3Z6?=
 =?utf-8?B?UkZTSUNKeGJsL0NTZHFkd0NrUWoxWFRBRERLaW1GSk10VGV6NXc4YlZBczgy?=
 =?utf-8?B?NFFMc3RNMWRISlQ2TDlYRDN3TW92VThIZjh5YjBhbzVZeWE4Y21sYmdJU1B3?=
 =?utf-8?B?OVRtbVpDSmdsRTV3SXBHTnNqNmkzaWhLWFhKUDltaWlMUmh3SzJqRSt1Z1VR?=
 =?utf-8?B?a3A1TDRNdDhYb2VpTUg2S1BEQ0VpbDVkNEEwcE42dUZHWTY5L3RhMFR1aHVF?=
 =?utf-8?B?VkZMemcvSklwbzVZdkNySmhhb1JYYVkvVEVTb3ZGVS9KNlVlcThDWHFwbWJ0?=
 =?utf-8?B?MUg4d2R4OHluMTdSZ0pKMkxFR21mRDZyeEd1cUx3T3RCUjRjRVpBRytBZENX?=
 =?utf-8?B?VzRZQU10VEFxQTdBZSsxeFF5dHVpV1k4ZWJaK2l2LzF4YlVPRkgvUTJSYnI5?=
 =?utf-8?B?SjIva2hTelVmRHVCaHBJZDBPTGNPa0FqbDBobTBSV3BORk1CSi83bXNCWTYx?=
 =?utf-8?B?cEt0SHk2Y3Q3KzMyZXdUbjlMakw5Z1ZPYnA1VFhFbWZZcGZIOXV4UHdlVXVZ?=
 =?utf-8?B?dG9WYzZYZWZnak9vRVM1MFVNYVpzRG11U3dZL0NjYXA3Q3ZSRjhCYmlUanNU?=
 =?utf-8?B?dHp4aWo0MWg3TEpZVU5UTGlOWGsxL0dEWmFwM3p2YzNvWU9nK25QQ2lqRExD?=
 =?utf-8?B?K3cwTnZ3VkdOSVhpczBNRzVQVFVtT3JzSlVQWGpPQndCRG00L05JNE91SVpx?=
 =?utf-8?B?Z3VqUTI5SUY1RmtGTStOMHNMNWFra0djbys4NGNBbi9iY0tsR2NoVCt4WEFp?=
 =?utf-8?B?ZzUra091SVhvTElNUHEvSUpPZGJWOHExRXd3MmtxVDEvY0Jrb01ib1Y5b0o1?=
 =?utf-8?B?Z3drZjJtU3JYQnUrVGxvVUQ3TTFiZVRhRW55TWczc2p6N2U4TzBETWkvaFJX?=
 =?utf-8?B?MkthY3pmb0JzcXo0OEQvdjdvdEZqZXVFMnJRRG5pV3JYMkI3Y0xFRkdhN0xC?=
 =?utf-8?B?ZlEybGREMmErWThLU2MxZm1lNTV4OGVFZkZiYUYrMkN0ZCtzNHQvTHRJakZO?=
 =?utf-8?B?RTRONVMyWGJreDN5WkhRYnlMd25WOTZYOUswNjVGOWVzUGVQblVxQ0FobTZT?=
 =?utf-8?B?VGZqZVc3SmhnRjFwbzl4Nm5WWlVHYS9FME9rNE5Nc0pOVVRLTy9wcHlPR0ly?=
 =?utf-8?B?NWF5aFp1T2tINDRuWEc0UUNrOStUVW4ybjB0UStlUFhSOWpjalVzZkxtWHdw?=
 =?utf-8?B?ak1kQTcweWZ6bTFDSlJjWkMwNzNWS2wxL0pUYm5KMnUwcDlNMlRuT3FobkNx?=
 =?utf-8?B?YTh2cG5NeFB2MkdweVJvNnNpNXJxcTIwTHArbVNSQUk0cHR4T3h6ejA1Ujc5?=
 =?utf-8?B?dXBVZVFwM3AvYUR2N3JkSjdLRk1IVDJDcHAybThTeklxL2JhQTRpZzdWU1hM?=
 =?utf-8?B?Wi9WN2ptRTZNbElveTlaK3lIVGRUOVh1aGFsV2QyOGRSYUcrVGRxcnM0eGMv?=
 =?utf-8?B?aGdlVUcySk8xaDJHbkxvdEJWelFQNkhTWFBWZitPT0ttRjhNMjhaQVZ6eW1k?=
 =?utf-8?B?V3R6TEl5MXVpMjZoSGFCQ0N3cmJZQ09HcUx3cEVlWDcxb0tMSU0xOE5Qdndr?=
 =?utf-8?B?aWpvRDlqZFkxZTZnd1hRa2w5UjFvSlR3TlQ2ZmdWWGZVMGh4cjBUL2F6aCt2?=
 =?utf-8?B?VDBQbWNSR0xXdnMrakZHMFprY1NTYUFWMGRseWxIRmtpalo1cHJ3eGVwYVpO?=
 =?utf-8?B?Zm9JeWcwRllkbGZMOG1VTmpIbmsvaVZnMUlCYXlmM2lPbjJWczJ1Zm8xeHVJ?=
 =?utf-8?B?dHZ5U0F3RDRmUmtkS0tHVGduTVNOQ2RsUXovaUJtTEJaMHZXSzFCQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5885a759-ad3a-4a80-e6e3-08df0459d5bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:39:59.9324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHgtqj52QyWYb5YF+8iisapT+XVcIL4z4FBULSIpj9vVmQhLlk/9w9RXVBSv476FsKPUAt2oddxTHOUpBzIbKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942
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

LGTM, Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-08-27 02:47, Kanala Ramalingeswara Reddy wrote:
> Add new asic id for igt.
>
> Signed-off-by: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
> ---
>  lib/amdgpu/amd_family.h       | 1 +
>  lib/amdgpu/amd_ip_blocks.c    | 3 +++
>  lib/amdgpu/amdgpu_asic_addr.h | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index 4514fff2a..3b1582995 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -108,6 +108,7 @@ enum radeon_family {
>  	CHIP_GFX1151,
>  	CHIP_GFX1152,
>  	CHIP_GFX1153,
> +	CHIP_GFX1154,
>  	CHIP_GFX1200,
>  	CHIP_LAST,
>  };
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index b56fb68b8..7d31a582a 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1433,6 +1433,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		identify_chip(GFX1152);
>  		identify_chip(GFX1153);
>  		break;
> +	case FAMILY_GFX1154:
> +		identify_chip(GFX1154);
> +		break;
>  	case FAMILY_GFX1200:
>  		identify_chip(GFX1200);
>  		break;
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index e7326b0f8..8b6910751 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -30,6 +30,7 @@
>  #define FAMILY_GFX1103 0x94
>  #define FAMILY_GFX1036 0x95
>  #define FAMILY_GFX1150 0x96
> +#define FAMILY_GFX1154 0x9a
>  #define FAMILY_GFX1037 0x97
>  #define FAMILY_GFX1200 0x98
>  
> @@ -50,6 +51,7 @@
>  #define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
>  #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
>  #define FAMILY_IS_GFX1150(f) FAMILY_IS(f, GFX1150)
> +#define FAMILY_IS_GFX1154(f) FAMILY_IS(f, GFX1154)
>  #define FAMILY_IS_GFX1200(f) FAMILY_IS(f, GFX1200)
>  
>  #define AMDGPU_UNKNOWN          0xFF
> @@ -112,6 +114,7 @@
>  #define AMDGPU_GFX1151_RANGE     0xc0, 0xFF //# 192 <= x < 255
>  #define AMDGPU_GFX1152_RANGE     0x40, 0x50 //# 64 <= x < 80
>  #define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 <= x < 192
> +#define AMDGPU_GFX1154_RANGE     0x01, 0x80 //# 01 <= x < 128
>  #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
>  
>  #define AMDGPU_EXPAND_FIX(x) x
> @@ -177,6 +180,7 @@
>  #define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
>  #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
>  #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
> +#define ASICREV_IS_GFX1154(r)          ASICREV_IS(r, GFX1154)
>  #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
>  #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
>  #define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
