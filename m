Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B3CC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 18:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7507D10E9C3;
	Tue, 13 Oct 2026 18:46:17 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624AC10F989
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 18:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnioIH2bUCgGcVcIlhr/Qb9hq+TPO9b1uviQh99a24pqgvseGkQHIv2DZVlFdFTTS1cL0wVGiK3u79T59v7sw891X7sWhhcWPaH+mmg11xDkjEPG2p+iyvdpA3cA3usHAxgVd7P57zz7sEJoadbDP0rxoRPMNKPWcZQFmtURiepCfbK6Hr68U7TduiGEHl+MfziJ+VXbBKvlqTp7gdbybPigzWiCZKl2Ymy1lRTFkzKGZSB9j0zu2Aap68B2Fxm/YE/0FqIdbN9LuGVKyB6sPD/0trQGb2d7Ub5ZQvPpAKoJPAi/ArqbIqSKIUseqzPozvoh9ABj2cBHWF2ol0qJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+02ShH9MKV0BX+v0zIhmkNnumgmxa7oX9d1Qmgxcr4=;
 b=jDBJXbmxmZVe2wgJbyk0OpHuSMT/SLKShTdCXSxtnZYK82ruXrQS4qdxztSW20BdnEM/ja4Zhoyh/JQhARrNX6KBqQu/MLXh1OEBB6Izz+VKOtbHlFVslHVIaueeZGBGpR0+/JCB8SHABcxkOBSykJNYDWGfmAtXmdSVxClS/+iM1ti/ZjhyQ+V8z6b8bbVVXW5N0Vz9cE1XIKF/RDaNSJvlxrYtS3XbGNSYLSuwO73PonmoPYPyzeEaBgyqHYmlJYIp0z8G4iAw31mazl/m0lSk3WHkv368WgYc6CcElbLUVGkEHzrqgkDtikq4ZDTmznsiEMY3wgVsc3WVnpyJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+02ShH9MKV0BX+v0zIhmkNnumgmxa7oX9d1Qmgxcr4=;
 b=KSgUvqE7zI9oHM0fQU/rFw86gDxVmqFkRwuIobRRpZBzU2MNkpWNdUK6TT2q+fHv23h8JIULSP7DwrwjqgJaeQfR9tNolcF+7CbeY3YJVqd2GEH6eYZgTHwFvkEPraEOcFiroJXZBlHMIifEUjvCs1Yaqpylsr2Dp/GvltNiELk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV2PR12MB5895.namprd12.prod.outlook.com (2603:10b6:408:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:45:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:45:18 +0000
Message-ID: <1703ecf4-2d21-4208-a09a-12028fc4c3c0@amd.com>
Date: Tue, 13 Oct 2026 12:45:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_hotplug: Check sleep statistics before
 suspend
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
Cc: Harry.Wentland@amd.com
References: <20261013180128.3128748-1-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261013180128.3128748-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV2PR12MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 4542be0f-be7a-4bf3-2934-08df295a20bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|5023799004|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: MbKupF0l8mssXACLyQYhbMnwUIbD3DqYYz2w0QbLP9gg4+Q7dLa+0V4TqvUmQDRsDVGg2K+Hk2Z9wsALra62Ikyi6D9eOHkjJp5ZB7muRC1r0bIirIot5RWl1FvcB/arrllUBMgcsDeGsi4H2D31e4DL/fxSp22AuXviYXhg9ORlrnKKN/diOTfFRpXJ8nnW0OwEhBE6e6L5UCMWxRk4xCXszj+WVIbs8B3vxnCs8G/Rm5QdGmZ/nBUc/7UV+135soaqJlWS2gAOoK535zJiqFzfCphuoL5/itBPosWnfssz9BTXiBOuLs7o7L1WXYJ4AISzv7kqzYXykk32xiCJfmqmN1iZZf/B5a9j/31spDpKoNdTm+rOci9QeqQqNu2IkiCkciFlnq1qYmleFhOP+YYuXlyzDo0ZfbosJ+1nFIlkFhp+lqIWLIle6Lh9lsoABKghi392+73gzUuv6jrEyJGexNv1FVWKZndTUNEy539Sreu4YGNlpxb6yHTAXFBFpXWh3ChPIPWoG/osAqrrQklNgYbvCd06Pmy695i1X+MDxE9tPPQ2TN6tyVeWBpI1WWWGv7ttHG00HgkdbGmjlqh9E66ZkVBH0FJbxcy/M/IXUlOU9LuRJgQD/1jpyhRbxgPUw4/KFewPZaHV/mWOm56ieUggVMOhHyCQbextUVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NkTHdPUlZXNG54QUZ5d2RQc1VQR3h0VWxZVzZZc0U5ZXB5TDRtYzVLUktu?=
 =?utf-8?B?Rkk4dHdhS2cvcXNWbjJ5MHJWTlV5cTJSenBZYWtPTGhDM1JiN1ZYUCtRYnJ0?=
 =?utf-8?B?d3drT0pVU056WWd2MStRWDE5OHJ0KzI3MEFFVExtS2Uwelg1MzZLdSs2NWR0?=
 =?utf-8?B?YjNLNWRoMjcxRDNvTG1GNG9KaDRGQzFZcW12VUZPbElMZldDZFU0dENDSDlj?=
 =?utf-8?B?aThoMVZoRlhmQ05EZEhpSkdkcnhYTWNuTWxMRUx1WTBXQld2L0ZmcXZDM3Yr?=
 =?utf-8?B?S0JLbXNSMjhxZzlESWJaMXF1eEEybFFRUm9SU0E4cXlnS1o3UG01Rk4xT1Nt?=
 =?utf-8?B?UzBWemh4M0NYQk5xbGI5REFJa0crQk5wV3pXK1BsRlZJYTViZExzOFR3SWlE?=
 =?utf-8?B?SmF0dHI0V3dHa2YxZFJtbzk3OWcrenF4M3J6aG52VUplY2xseUxjRFRwN1pl?=
 =?utf-8?B?cVFaYktEazA1ZkQ0ZWRqd3N4TGdvNnUybXBhdnY1WkQyTXFsOTB5YnBOM2dp?=
 =?utf-8?B?V3UyQ1RsdUg3NHVxS2g3cVlhVEJRTmFHUHQzRGI0Q3FPZ1BZVThPaEZoYTlQ?=
 =?utf-8?B?aFNkUUlDK0hIUW5VU2tDdTRxWldCVjROS1d6aEZTcUkwWDFYaDFoOEx3OWZ5?=
 =?utf-8?B?UE1tNEdPdXlwK25jUUh4NkFsWU1VTXFiWVBaWW53TTVwUVY0blFNWTkvbDV4?=
 =?utf-8?B?NVdZeStlcC8rMGNFNDdHbUhFdjdUY3NCL05rNXF1MmtHQ0tqVTh0aitGNUFr?=
 =?utf-8?B?aDZ0T3BCYXJaUlh6S05Ua0Eya3h2WkRBQ05tM2tDb2t2VS9IRVpEWiszU1hu?=
 =?utf-8?B?OHFiQ0FjaE5GUXNrcmk4aGcxVk5TbHFvdXhNU09rL21CNjB5NHJEMkZnbWR6?=
 =?utf-8?B?STVPaEkvcWQ4b3ZQcXg0eFJvbmJmZ1pBY3p2eC9pWVBpY29lOGZ5S2taY0dj?=
 =?utf-8?B?V0JlVG9oUWc3Z2tQYUFKZW96bnJMVloxTTByL0MwV1JpTWxFQ29NTk1xRWdB?=
 =?utf-8?B?Vk5OSStjQyt3aERtanVmKzg2LzVlK3NoNlJZY05pMURMN3RuYVd2dGdiS0dQ?=
 =?utf-8?B?SjZhRDNjakVXMm5IVVh2OWR5MXNQeCtlOFdxQlluTmRuUFVBZ05lK3BQTFRt?=
 =?utf-8?B?dEZYOXQ2TnA2bkd6d0RCMjBmVUd5d2RVREJSOW14VXpzOEhpM1NQQi83R2hI?=
 =?utf-8?B?TlYvOUY2OTR2bkd1VU1nU2JWRkZRekxJV2ozOEREaUgzYW9ZWUVTSi93aysr?=
 =?utf-8?B?c1Rxa2JpMUFYUFVXTCt1OTFwTlMvc0I5VHhVK0pOMVVId21TcHRiSkJCWFlD?=
 =?utf-8?B?SVlVTG5vZFEzUzhMWThkSE9wRlBOWXFtZDVFSXV6R0J4WWRncXoxMlpueWUy?=
 =?utf-8?B?YzVncElDaVJ0YzdmU0ZkOHlRSUpYM2dneXpZRFgwRzRqUlVzdFZPdkFLcWNC?=
 =?utf-8?B?V3B0UmlVZnpTVTdGRlRTcWdWcE5HdXVGMzZUV0xQdWtDZmg3dkJrL1NOMVU4?=
 =?utf-8?B?bXlBL2lHUDlzQWlPVkJJeFlaSmNTUlUwN3d5a3lGL1pQQVNXMUhaUnp5WURT?=
 =?utf-8?B?c2RmWFBTNmp0YW5ldDBUaDI0eU5OWUMveHdzdDQ0dFBIbmQvZ2Z5TEY1aHl6?=
 =?utf-8?B?OFVYcksydmxzSEIrRDZqVjVpUnd6TTdVcHUxUUUvTGs5ano5YThsQW9qSGQ4?=
 =?utf-8?B?ckttUGVvR1BEd2o4REJmZ1Jtd3ExZzlNcnFDSUtuM3BlZjJOTWNNYldYMWll?=
 =?utf-8?B?SXpJdVZMLzdaVnhjUDRGcFBGZ3lISk1scHVML2kvV3ZjbithT2w0NzllNSto?=
 =?utf-8?B?UTRZcEtNc2FjZkxLa1ZSTjZuWVlvbDRPVlRMTnVFclBmUDdTSEZiZlJIZDhy?=
 =?utf-8?B?dllpTzJvNTBEb0w3Uy9uQi9ZUFlOSVVTYjNwcUhBZTVwd3ByUFRmSGhuS2Jw?=
 =?utf-8?B?c3V6SmdleWttSWthbTZvUER1aFZ3NUlCZ0xVTlIrak9LeFppVVRYdG9sOS8z?=
 =?utf-8?B?ZThFdWFPRGFKdjZvdGd2WDNGZVJ1RzQ2T2IrRkpmWUxyc0xLRFNtUHByTFBX?=
 =?utf-8?B?Zmt4RzZnYjZyL0ZOakRoMmNRa21wYnhqWURXQ2NPZk9meURrVElBK0RGTHU5?=
 =?utf-8?B?cDdMSzJjdTY1NlNCSVhEbTF1U0U4UTlVaVZmRlJnYlp0eU52K21nbzd6KzNB?=
 =?utf-8?B?S2l5R3F4TzFnYXBiWHg3eVVPMktnRGhDQ0lIa0lpYkFXSWpYYXl3bHB3REwy?=
 =?utf-8?B?QXh6dlNYRlJibGNtMnBYZWtPZmdFMzU0SXlETVZoMnEyUmE0SXJZUXQ5a01j?=
 =?utf-8?Q?IQ7KbKLDqhLPaXyuhl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4542be0f-be7a-4bf3-2934-08df295a20bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:45:18.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRz+sDDEO7BPdrwOXmbHG6Fnqt022Q3fBp5Vqq2Dqj91QtKsg+WFn1Tukn7+LHIf6+616mb417pHDKtUxtzMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895
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

On 10/13/26 12:01, Aurabindo Pillai wrote:
> basic-suspend currently checks hardware sleep statistics only after resume.
> If the interface is unavailable, the test skips after programming the
> display and performing a suspend/resume cycle.
> 
> Read the statistics before test_init() for the suspend variant so a
> missing or unreadable interface causes an early skip. Accept an initial
> zero and retain the positive-duration assertion after resume.
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/amdgpu/amd_hotplug.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 509d828e6..29d0df153 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -129,6 +129,10 @@ static void test_hotplug_basic(data_t *data, bool suspend)
>   	igt_display_t *display = &data->display;
>   	igt_crtc_t *crtc;
>   
> +	/* Check reporting before setup or suspend; an initial zero is valid. */
> +	if (suspend)
> +		get_last_hw_sleep_time();
> +
>   	test_init(data);
>   
>   	/* Setup all outputs */

