Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E211CD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 03:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEB610E169;
	Mon, 15 Jun 2026 03:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkmNFxBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365110E169
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 03:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781494540; x=1813030540;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BCpQtL8w+aiAFP5jN2iNCOu1NEA73hw2CngyBO+/GJY=;
 b=fkmNFxBrJ2r3GESjrdccSZUFDDK6BG2L/wJw8yU3IODPa3y5ywB1wsos
 wiimeFj0sXq78v1/KQyR92U9Hr8WhYWQsdUbrBLHAE9DrcifmFFudTjyY
 8cx8ihmrsQnmlEG+NwqOjxTud1B3wNIPriUNAyJetjNM6CcFMTdJCCxL6
 I3L+adflRKA1jaHupFyZR7ibphYjxhRY0SgNwciZb0wdnYNuD5EyTN17O
 dWZJ4FibTYDUBK8QK/jfk0tHtmmkqx4ZFzqxyXa/HjO6VX0SweFR9RFP4
 Fxthbk68g8v/SKNv6HdeFYca2kUFWL/4TF5lDRkKp0OoLkHUcGu4REpPE g==;
X-CSE-ConnectionGUID: 6SyZ187gTmOgmKp0A9Tgqg==
X-CSE-MsgGUID: TcusygYCSmO1QhuMV7p2+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92787270"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="92787270"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 20:35:39 -0700
X-CSE-ConnectionGUID: qsLMjzdkSDOsyZPfy2cmSQ==
X-CSE-MsgGUID: h36qloBdSaumiQFLvUJXOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="251281335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 20:35:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 20:35:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 20:35:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 20:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1MIL9OdNCeP3K+W5TRJdI0Dpc910+BeCZzX8WUIpw9FmfJkRzCw91oT2dI3MQ9BN9lyqMKByQcghgNwenoO4/jWSnN9VamgU56+c4gd924Zj2tyyaFcdY8e3pg6Ve6oswUsMt/gO4Qmw4soHQMGr8JajR7zKNmvSwaxBIzmj43jlFoldsz+Hwo98sVxaO9AEZNGchFEvIpXefHL3crCuWDJWuZPgtKOG9kksrp/S3GlrSyVQOeS/7VIhOJ+YuUvCRCxXItsxBvSLL7WlDeAy18XtD7kfqjvzzz4mbbYftrGkKeUvxwXVb5iExtvOApXwYC6Bt/JWMS2SG1VMSgCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69g1ERBCx27i0yQQeUrDfY0WBY6btmPfPJ1igzN1f9E=;
 b=MHwpThrBOxiiG/DPuyBZd3FE1xVGp32U9FGfe77vij5Yv5gwMUdUE1DQqcklanuz3lvEFi9PYsTXkvzVXqwuPVGThL9yT8NUfYl21ikH/7f826V48xMDhk50gKu6bfE66IG3Q3P6PhylURLQPGft7vXRq62N8w34s1kksbCBjeuvH0jAuMj5HPfS/WFu04tH4fs6TLI2e8ljdlVc7ZWnFK/DbLA3LXMp8Mwv4NGbDA4cVCADAzbRoCt+RB4eMkor8MtM6d/lKBZd2HNzZYrP9730McpCFImZSDnO73gVOvMh6T/o3PdXpwFmr5shJwPTJP6mw6o68lrn0kLrEvnXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 03:35:36 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 03:35:35 +0000
Message-ID: <192d86f5-509e-4113-bc00-77a33084bf3b@intel.com>
Date: Mon, 15 Jun 2026 09:05:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_feature_discovery: add HDR, VRR and DSC
 discovery
To: <igt-dev@lists.freedesktop.org>
References: <20260613195901.2675666-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260613195901.2675666-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 543fcd6f-b22d-4bfa-699c-08deca8f2975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|5023799004|11063799006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YRoQnObAaBUO4GZxPmHXGygP7xwYeJXgoXmdyC9SNKhAPgInBsEj0UA24hxBgao1tpisqkA1+NX//mKTZoXGklaafU9gcIdPQcDseYmDF28MntE4YrxTXXSUasqTCQ24mD+usyRvxcJxkV+7uvVyr7GDg6nc+fU79k2NSS4GowHq/rh6sz7Ma5qlfiT7yo1xC6pBsj74TIFWSrmjAEa5uVzeeQW/nkWEtSv54p7nsY7wP4EQXtIrz921tVpB306LPoG0Ys7p5GAjDpEaUwr7t2moNn3rZZBVog6/2E4WeGJbQ7tOcMaMr7MA1gjfveVm3u6UF6xwyHSFB6RgZgSA96YUfwY5tUu0E0mdebCv//+fOd+/WlJrri9K9d+uf/GdPaOL45Y4HGQ/PjLLFj7FKR4XCR8KlVRjjFlJRf4Sk9qpIbrrfCHhPXfOayxPVdnEEEmcNtrJaaIjHoOspfL9+wOc2EZOKxo2cscr1UICeRz3j7FiZbvzRrf1qywn46lPZ7DhkWyhUnG7UTBmlu8Yf42B6txP6ei8ZuU8PcO+Ndl8ekrLN/0gbqQH+rzmXDzWnwX4S3inn3Leunp9zh3LywHHRFGNfAedKQaFXkOU5kPoY8EiyZSb8K9GvfMnOmGg6rr7aC+2bXWX8AVMjIM9fBFo4jF1GHr6BOwZRdGrullcwiPfxUhl4XcvGr8iyidg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlXNjBHSFpCNFhNSWZVMStBcXkxY1NVWGQ3cURpdGVCRy9SRzlXYUx3aHhl?=
 =?utf-8?B?bFNlby9pUkRXT0Y1T21zc1RPSHc3WGhIczJiN3VSbE8yYno4UWcraU5FUzVB?=
 =?utf-8?B?ZFZPZlZFamhRQmJSaUFxUTdoenVISXhSTXV2WEhka2w3OGtsaGtYeGFLR2Nt?=
 =?utf-8?B?aWU5bXF3MzhFeGxFK1RISUlYRWlQWnBUemZSWHh6Z3VnZERpNlliUDV0WFJB?=
 =?utf-8?B?bGoyUHNzUytobTNyN2RoK2dDUHJuSU9tS1ZBeDA1Qk05T2hjZlk4SWtmaUh6?=
 =?utf-8?B?Zm9iR3dXcHBnelJtWFhUSG4rT3lYMTBKVi9HaU9nWmNZRnZIZG1QSFBEWVNw?=
 =?utf-8?B?bzZaQTlDc2t4aGVkdXc3WUNLUmgxR1QrVWdQeStacXFYMU1GWjRncmp1NU1y?=
 =?utf-8?B?WFdLbHpBVEVkaFRZN09UV2tDdWswMWhPMDRtVE9TRG5RQ3lPTmE2M2d6dStj?=
 =?utf-8?B?Nm1LcVUzNGJCMUhBS3doYktYanNnUTdMWDR3azRRd2ZmZWJGZkNlN0ZacS82?=
 =?utf-8?B?T25IWmFKOUFZeDYzL1dNVVFocmNLT1c0djV4ODFvQnQraGVpT3NKZXdmMlRw?=
 =?utf-8?B?RUdrYy8velp5SWZGNmtzWEdKRGtuaXh3YjFUSXFodWFIR0NXMlA4RXoxcmp6?=
 =?utf-8?B?eDNaQno2MnFrc1NKZGZkY0RFbEE2VStxcXlXUmpXR2lORTdkcVdhMzRsQVNY?=
 =?utf-8?B?SDF5ZDhla0xmRjdKM0pQdVpaYVFLeGwrR2RKbjdVZm9wSE40NVp3Vytob1NV?=
 =?utf-8?B?ZUlnYURSaU1wclZhRXRXMWJFS0o3VmFQdHVXUkR4b1cvZExXK3FZV0dMZ3Ew?=
 =?utf-8?B?cEdHc1dOSkpRRVNLc0tnQStDY1o1RmxVckRuYjFuNkdmbU9obHpzOUcwTjVU?=
 =?utf-8?B?N0g5M2V5c0J2eGtFcjdGNGdpZy9DOUxPM0lSMU5CL2NhcktUZ0ZjajBTaTR4?=
 =?utf-8?B?MWZMU080T045K3hmcTdjUytScFhQQXl4SmN1dEFnTnFJR1kvZVdOSHhQRWt4?=
 =?utf-8?B?aVU1RENLMUYvWW5aMVFaTXNHUTF1MCtLcWl2Y09NVWgyaXpJUlQ0a0hGanB1?=
 =?utf-8?B?SHNtM3c2aWlraWFZdWpucS8xVHVMdXUvaFFLSDBMWW5FbVNlQWRQS3JQazFu?=
 =?utf-8?B?OFJNdzhaTk5zUTUzZVArRlFrcmdFU1hiUzFUL2pKaXd1MmF2TlVPcFk5TlE1?=
 =?utf-8?B?WXBTZnkyTmpzQ25UTHg3ZU5JVWpOV3B4b0h4V3lnMXdNN2M2cXMyWXM0Szdz?=
 =?utf-8?B?RGZFN1d2TWY3R28vL2Z3aEZ0R3g4dUdvNXNyYnFsRXBHOWFJdC80MkIrK08w?=
 =?utf-8?B?ME5CbVpLYzFOMjgwbFVURWo0dTcxbTlBdUQ4RThnTFZEeTZIa0pyRm5EKzBk?=
 =?utf-8?B?L3FTOG1yeUs0UE5RY0ZlY1Yxd0NremgxcHkwSEF2L3hndEJSenJBVU5LbWNs?=
 =?utf-8?B?RmdrVWN1dmJ3dFE0RHY1UWs4VjlsbWxNZ0IrYVlSTzJBOURZQ3R2cmluRXNQ?=
 =?utf-8?B?UGsrNEV5MWx0Vk82Rnh3MklGNFRob1dXVUdlSStSL2pldUF3RnBURkM1ZDVr?=
 =?utf-8?B?TTdTNHVDTDhyektkRjhWRFZkN1BvSWFING5PR2lzM2s3Y2NQYWQyU0psQnIr?=
 =?utf-8?B?aERJaFkyMkZnaXdYdDhEZUxIa1JQUDhTKzd6VndKWjJCQVpKNnhmMVA1US9l?=
 =?utf-8?B?bEY5YnpuVFNta3EzTDhQaEV1c2oraHc1NmN0RytwNDhBdGhhQlF2VnFUR0Ji?=
 =?utf-8?B?MFhNU1VtYjN0SjArMmVsS2pScFFiQkJHTk83YzFBL0hYRzJ0a3o5RXZjek5v?=
 =?utf-8?B?c1BSdzhxcW9EK0tFWWdyclVvVTlKbjVyUWtEblQ5NURVV2JDK2ttcUc3SlV3?=
 =?utf-8?B?a0I2L2N6RDUrZHZUQ0wvRm9QbDJEcDI5NVRaa0Q1anUxYjZRNkRZZUI0anIw?=
 =?utf-8?B?Z0I2TFE3bHRaQ1NDbkpqRGFhbUxiZENlOHZjb1NDUjhKOXFCR2N0NVVkVVNW?=
 =?utf-8?B?VTE1WTZQSlhzVzA5SklnSm1uZGxsdG96Sm1pUUJvRDRqM1pYWFp0SVh2WUto?=
 =?utf-8?B?MjBkenRQWlJ1c1kxNnhMdmtNbzJLSENmNlcyQksxWmhPWWZGQzJ0cjhFWmpy?=
 =?utf-8?B?dktTQ1lINHRLcWtPeUVZTkFzcXR6Z0F3SU9QZWFqc2twV2FJaklQQVhseGti?=
 =?utf-8?B?WVFzTEhRQXpYcjJjS29mbElRWTMxQ1NpSzBMSENiYTdmTVdkK01mQUsvODhD?=
 =?utf-8?B?M3g0cnlXN2RoKzBiSmVyTzdZb2R0b3ZtUHZPUXUyZDVOTVVwWm4vc0l6eUJD?=
 =?utf-8?B?VnFIL0JxZ0xJeVl3ditSMGpKMGdleGxkVzREakdiQTRaa3pYdnRVWXI1VUNr?=
 =?utf-8?Q?I9+uq5YzAjmxz8XA=3D?=
X-Exchange-RoutingPolicyChecked: VV6XvQNoPQH2DPlpCbEvFgjqTwXq+vSKuXl0WmqTjui59KMZAIpT9nndM5Fde+i8TXrDs7d5OGbLMgcmRmW0O4ZEtSM5lQ0lsWuIfmKE9d+Cgp92TEzlkiZORoASn3RbdEgKHaleWtD6USOJ6TIIvY91ADLSkAjKTuEaaruc1iSPCEJNWb4BTn08YMeLjUBQTQeUjWILtjowVetevuk1gdPItYThI0WbfFoGzFLm3peFX4aMskqOkItGlG3ooeUCAb9ufMCXAOXyC4f4gGzs5uJzcL8SlAzsLoAjJVeXUtGrJfw8OKLJFcrO9S70icUrh06o8Ldej13ABUg9IPwerw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 543fcd6f-b22d-4bfa-699c-08deca8f2975
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:35:35.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGLEYwdwm5z0zk2aoELFUvPVBHzSLwH0Jr1dd+yAGES/RGBA8s2CmXCLEgt1VV2UbMcgjwAWsHe9vEmBzZQk+p1jocjaS6lyHWJRRQnQIOqDnsqEt1vQhIa0HK53hZNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
X-OriginatorOrg: intel.com
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

Hi Swati,

On 14-06-2026 01:29, Swati Sharma wrote:
> Add display feature discovery subtests for HDR, VRR and DSC.
> 
> HDR requires:
> - IGT_CONNECTOR_MAX_BPC with max bpc >= 10
> - IGT_CONNECTOR_HDR_OUTPUT_METADATA
> - EDID HDR capability via igt_is_panel_hdr()
> 
> VRR checks connector vrr_capable support.
> DSC checks sink support via igt_is_dsc_supported_by_sink().

Would it be good to consider the feature discovery check for HDCP as 
well in this patch.

Regards,
Santhosh>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_feature_discovery.c | 75 +++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 28ec89c55..07a0c5e16 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -36,6 +36,7 @@
>   #ifdef HAVE_CHAMELIUM
>   #include "igt_chamelium.h"
>   #endif
> +#include "igt_hdr.h"
>   #include "igt_kms.h"
>   #include "igt_psr.h"
>   #include "igt_sysfs.h"
> @@ -63,6 +64,18 @@
>    * SUBTEST: dp-mst
>    * Description: Make sure that we have DP-MST configuration.
>    *
> + * SUBTEST: hdr
> + * Description: Make sure that we have at least one HDR-capable panel.
> + * Mega feature: HDR
> + *
> + * SUBTEST: vrr
> + * Description: Make sure that we have at least one VRR-capable panel.
> + * Mega feature: VRR
> + *
> + * SUBTEST: dsc
> + * Description: Make sure that we have at least one DSC-capable sink.
> + * Mega feature: DSC
> + *
>    * arg[1].values: 1, 2, 3, 4
>    */
>   
> @@ -174,5 +187,67 @@ int igt_main() {
>   			}
>   			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
>   		}
> +
> +		igt_describe("Make sure that we have at least one HDR-capable panel.");
> +		igt_subtest("hdr") {
> +			igt_output_t *output;
> +			bool found = false;
> +
> +			for_each_connected_output(&display, output) {
> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
> +					continue;
> +
> +				if (igt_get_output_max_bpc(output) < 10)
> +					continue;
> +
> +				if (!igt_output_has_prop(output,
> +							 IGT_CONNECTOR_HDR_OUTPUT_METADATA))
> +					continue;
> +
> +				if (!igt_is_panel_hdr(fd, output))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found,
> +				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support.\n");
> +		}
> +
> +		igt_describe("Make sure that we have at least one VRR-capable panel.");
> +		igt_subtest("vrr") {
> +			igt_output_t *output;
> +			bool found = false;
> +
> +			for_each_connected_output(&display, output) {
> +				if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
> +					continue;
> +
> +				if (!igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found, "No VRR-capable panel found.\n");
> +		}
> +
> +		igt_describe("Make sure that we have at least one DSC-capable sink.");
> +		igt_subtest("dsc") {
> +			igt_output_t *output;
> +			bool found = false;
> +
> +			for_each_connected_output(&display, output) {
> +				if (!igt_is_dsc_supported_by_sink(fd, output->name))
> +					continue;
> +
> +				found = true;
> +				break;
> +			}
> +
> +			igt_require_f(found, "No DSC-capable sink found.\n");
> +		}
>   	}
>   }

