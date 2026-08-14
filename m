Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC12C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 03:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90B910E52B;
	Fri, 14 Aug 2026 03:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eSc5NlGX";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5EF10E52B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 03:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdvQLfLheiAXtBOLqULkEpZhrE/IGcOktSdwX75ADRXuCdCaZ357oQxdmfptX0iwfJp7VtS5w5mxHzV5gU9e+rdDm0WHppW8RZhdaI4st69QdDIjhJKKNvKU0l5oH4zbRgoXBJr2Cqx4uDv/nPfRB7GmEbfCeyDyjeiXe61foRLZFiGBanrtA4v10VvflowPawboOdkf4d5KdsrEqVeWmmpmmyInED71uyi/CGdUiov/uzVIkHZVJa/IRUdTE1PA2gDBipfbYZm0fMhr+KKhf3owYPCq2K9dLhylqPQMpT96+UsZonC8RUeBkfd2LnRGHn8MP9Zev0s54aZxmye9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4Pd0t7jEXk813nb2BfxthPrfqLSj1HaGHbH7yxDyso=;
 b=QwISgvX4eHi45LlNewwdMro8Loh0pGY23rhcW+LBzvH8lVYeuvOVzJO9hAaknzTfyxiudP5Y2HczejT63z4w/OLF5ra4h+N8PttYC+UJp0XbW+A/0rRylkkZSY1Gn5hIQUjJgIFPL9I/wz06arizdHifzBHZozhr6YpmB37/KLfGxC1Edm4R6IAscmuTWweyhL+gQPHQqhqq6jy09sOdR9mYFsWxnywByhcLKl+MO+3NFA0T2OI5exraJL7qLDgVOgcBgC33m5YC3fzDuz71hPWnBKPgRTH7snoE2s82843SOutqtMHY/GTONZYKqqitX5h/sZej4q7zw2HjFbTuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4Pd0t7jEXk813nb2BfxthPrfqLSj1HaGHbH7yxDyso=;
 b=eSc5NlGXHL5ONBr0uNZUYn62uCBB9LFhiMjfZXHHq6ApgIY6ivlLjWduQrTV1ttal+yH0Ds0LFpUZ/Om86E4IPbi0tfDCR7Limv1kzA+a5UQmgg+M7zlrB0bohvX0BaRBaxRqSc1OGZmo/mQVObGc8kpIaOLDpVefPRx4WYNKtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 03:44:56 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 03:44:56 +0000
Message-ID: <da1aee65-0f91-4dcb-bb75-08563d40e166@amd.com>
Date: Thu, 13 Aug 2026 21:44:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/6] tests/kms_properties: don't check colorop if
 no plane color pipeline prop
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-4-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260811143558.141813-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 703a1ba1-0141-4883-f2db-08def9b6682d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|4143699003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: NatU8N1X7nLorH3RnKaHmbaoCN+uOLFWI+iPJthk9eHnIakvKJWktPAhvX0lPYlxvX5Yt+qgRPCb7I4j0jsyWY8+5DWpO0dfFcNHlSK6pmKO2BwB6VgWNlm9U8vtL5l5YTyrFHQ32zYAKHIZYZiZOC74VBicuV8O2SwdoMoUYIbHxglJagVNqtAjPEhG2FZqjQD20gS+ufHmoVdONpIn5gcnjw5RkE96prdZ7/uE9yYgCSg4iX5irbGp67AxlVyVrKVDfEWPOBgQMoFvPibt/dSEmzwwkbWbTrWb5yq0RRZoOBnmdYk9a8lNdha/tCoDinmzitQozQF2T3I4T/mnL77e6UirZE4o/AW6XzJYRzzFko4DyixdiYQ8rCTsWukj2EKEADX+bd/OOCuIzhd/OiNv1qELIiWN5QdRtMh8ntgdRcBMGWOryzo/Fqqyfh5pgIIekLFoOTGzjRwJNhtgevrRVyFF35Ok9zRiP+sVQj7pUjCEHholuTjTCb7aiCLA0kxrmNfW/5+d1i8R4Dhjgx+7ElmWpsTue3gyTNAhclW8TSJpx4OzkRCwFJKzWXWEA6+7JyKhajqg/ltsUpy/Bx2oP8fwQWPvsNdk5uuArFLJGFDJIXvX891LYxlq/gCpBesTA8QMkMM0Qh9r3O55p6+tEsujtFAthwty9IONFc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWtDV0xoeGJ5bnlkeUdlUHY4Q1pJRjgyeEhDZnkvYmxEQWJQRkhCV2gzU3Rk?=
 =?utf-8?B?UEI4OTBZNTdWL3MwVmFwcFd3a3hMcUo0L2lHbTl4bXdPNFJ1OEE0ZWI1bG16?=
 =?utf-8?B?a1g2dHdoTXVvVWJRV296TG1NN2dkWElBYkpJdEZRQnorVGxsbmVkWW1UTzJU?=
 =?utf-8?B?dVpWWmk1QUNPc3hrZXBBbkFmVm93RVZrQnhsTXg2aEUrV09FdC80Z09HZ2hr?=
 =?utf-8?B?RzZGNURlQnUzZ3p6L3lTOXluSDFSY05ERG5xZFR2YlF3c2lLMXhoOHdQWW55?=
 =?utf-8?B?V28vbHFNcFFwNzNwcndxRit0cHptY1Bub3dFZms5RDJ1SlhETDRaSmZHWFNU?=
 =?utf-8?B?eU1uajBtSWJIY3VDZEl3THVhYStETUE3blFDanF5RjFoK0c3NWZ1WFRGVG5Z?=
 =?utf-8?B?YmxGNHBHemNlVzBPSWFLRW9JQ3IreU5KSDlZU2czc1NLdGRKUzNQZjZraThX?=
 =?utf-8?B?RGhIZU81NERZRnJQdFpPTVpqVFlEZk5JS09yREw2RmNEUDUwM3ZFbEdhQXRT?=
 =?utf-8?B?MHFuN0VNL3JJc1d6bVdkUnA5eFI0NUtJUHpnSkpFS0dJZVBmZE5SV3Q2L21m?=
 =?utf-8?B?TmEyNWZEWGtjU1NNWWQvUmJJQ1hNTGxwdThhK0pLbTVSN3RuY3NwelFzSWxk?=
 =?utf-8?B?V1BQQ3ZSLzRTR2E2U3pyakp5M2pUN0cxZmpmb1RqYUFTRFdrMExUNmxlb2dI?=
 =?utf-8?B?Qm5rc3RLMS80dGh6dGNQL2ZBTVFwWkZkYVJVb3JUdFB0RnVCT0RYMlRxRUU0?=
 =?utf-8?B?Uyt3TTcrcXdDZ0pxb1NQaDhCWVh2bk9JdTVPSVhTaU9Md1pCS0xQMTM4V2pE?=
 =?utf-8?B?bnNMbEI2OE4wMXRvcHhUcS9EbENObUk2NUpwUVVqSUtxRGdubnlzOWV2dW9E?=
 =?utf-8?B?c2FOZE1KR1JqK3l1NGRUejgvN0lzM3NEZmpxcTd2U0hyTURoeURkVUg1N0hs?=
 =?utf-8?B?RWVYcHh4VDRsbE9PVEVTc24yUE1FT3NDb1c1ejhNRFplV2YzTGtveDhabDBP?=
 =?utf-8?B?VGdnYklLOWo5SUh2WFdPMGxOZ1FGeWJnQlYzOTJUd1JOWEJZS0dTN01xU1hJ?=
 =?utf-8?B?V24wbGpCVlhHSGx1UnNHVEUrM0c5MFBsWmg4VDN6ZnRCR2hyU2kvN3J4aWxi?=
 =?utf-8?B?SDI0NXY5YkhJNXp0R09QZTVHYTRGWCsyVTB6TG45UkRLYko0UHVtS0VLeHZB?=
 =?utf-8?B?aHV1SXR3bytLVHZjV1lpUVJZaC92c3BiTWd1UlJLejNOZ3M3ZUtNSlAycjVT?=
 =?utf-8?B?K1YxOWNJdzAvWVNTZUVtWGk3T040M2pDNnE5RTE2cytoRUVSRXVQelVKcVR0?=
 =?utf-8?B?WDBlRUY1aVg4Vy8xdW1vcUhMb0lGOWEwRkVsOFVSZm5qL201ZTR5TXhmSmdN?=
 =?utf-8?B?REY0b2dRYmkxaitxRm1lZG91Vks3ZHIvWmdDKysvaS9PWUhsM3pqSXVwam1U?=
 =?utf-8?B?aE5tN0greDQ4UEtQekdsUld4T2FSQkl5VDk1cHV2SERQR3RFU3ZnT3Vkb3Fw?=
 =?utf-8?B?ZUFDQ2xHN3d3OUkrQWhHM2l3VTB0djZUVG5lbUFYVjlwSlRxNUM2SVdpdkpS?=
 =?utf-8?B?SWhnM1NLWS9tVHFBVFFtZjcwZnc3czlIaEs1NStBZzQzUjcrOVVaRmdiOFpY?=
 =?utf-8?B?WGlCTjlVZUlRZWlWcEtka2p4TzY0R1lrS2tRbThXNzRGSjluRjFqeHd6QWRN?=
 =?utf-8?B?QWJvSTdpd2syY1NoK2VtRW5WM0NtNmxrd1NjYU1JS3pQVXNYeUVTNVhvZ0JL?=
 =?utf-8?B?dDdSc2swUnN1eXBpQzFuWmNsb05zRmJYcXRYQzE0ZWoxcjlqeXppN0VHWExC?=
 =?utf-8?B?RDNVbzUwbWFkT3hJUEdVeGhNZjhwcm0vL0hkbFUyb3BPQmE4YU1lcExDaDFB?=
 =?utf-8?B?cmFvT1RKaVViNUF6Mmk2clIrRW5acmhab2YxdkVKQ3hrZHR6OThKWVkxV04w?=
 =?utf-8?B?L1lMK0FZUitLbG44c0M3cGs2emhnc2Vib2Q1SEFnbVdtVEdoNXJIQkM1dVM1?=
 =?utf-8?B?dXhlYmNVQ1F4bkgxUUxiN1QxM012OVlSanVCVW9Jb3ZWWEJSRGJEdHNyRUdw?=
 =?utf-8?B?cnJpT3FsaGlyRHhKOFdTaUJmcDg2ejhKbEI1Q0JmY2tiTTQ3Y2l1VjhMTk9t?=
 =?utf-8?B?S1F5SFE3QitDOWpmVjNxRUxaRzRNMXRvQ3hFbXBBa2xmTWJUVjF2ZlR4dXQv?=
 =?utf-8?B?Mk9rQ2VQRWVPeTJRTGk1MWV5ZjZFNXJJQTFZM1YzM1RYWWpIek5BTS9MSDdK?=
 =?utf-8?B?ODlLNFBxekRhcGxNdEJ0VTU2SkNXNWNsNGc3THdpcnlJRUxUQ2hQVFN3Q1NN?=
 =?utf-8?Q?L8C+114odjg9z1LhEP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703a1ba1-0141-4883-f2db-08def9b6682d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:44:56.2524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58HVE9Va8/DWIWBqSMxkkiygAW3JBOCybsiJLPtDvwe2aQrR4CNuGzdF+dUhtPSy6+2N97KNwQ+9rPJ3xyvIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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

See typos and mistakes in commit message below; otherwise
Reviewed-by: Alex Hung <alex.hung@amd.com>

On 8/11/26 08:23, Melissa Wen wrote:
> If plane COLOR_PIPELINE property is not avaliable, the plane doesn't
"available"

> support colorop pipeline and there is no meaning in check colorop
"checking"

> properties here too. Don't check colorop properties in planes that
> doesn't support it (for example, in cursor planes of AMD driver).
"don't"

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v2:
> - detach different changes from a single commit (Chaitanya)
> ---
>   tests/kms_properties.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 93bf1ea26..292a04a2a 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -247,6 +247,10 @@ static void run_colorop_property_tests(igt_display_t *display,
>   		     &fb);
>   
>   	for_each_plane_on_crtc(crtc, plane) {
> +		/* don't check colorop in planes without support to color pipeline */
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
>   		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
>   			 igt_crtc_name(crtc), plane->index,
>   			 kmstest_plane_type_name(plane->type), output->name);

