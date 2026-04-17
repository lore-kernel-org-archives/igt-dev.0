Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D765FF8E4A5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 05:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289910E950;
	Fri, 17 Apr 2026 05:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWKQRcRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F2610E952
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 05:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776404401; x=1807940401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8nb6MMs+pGzfc89o1aF3C8mR05aF5VrRdkRwPJYgRT0=;
 b=cWKQRcRwiKixQxIM4TuR4PccrOKh+cF2HAzTt7SX7WgKIG5v17X7XoiH
 I8Z3pv9IpdEMUJ6PKYjIt2wRKQkpaO5gDI+capyQBEfEKB9MJeJQTLAX9
 szgbRbQjgZKQl1IvU+7+C6n6SqhodjFWo7YnqmC7vibad3HGixxoVB352
 KdcR5ylH+sYWM//mw3BCHU5AW4UF/EQ7/pgLXkCnuUJKzthFU2qYdgd3I
 Ln1hl8HovHtjAX5LoWzVGxO8f1Uq3TgiSI9uLPHUyrL74tbcaN+je2VY8
 1+ZdV2TykyuCSCxUz6mffmpQ/KZdEFuJNOWQqG1yGPuIo65A+T7B04a1W Q==;
X-CSE-ConnectionGUID: vyb86hgJQnCyp6CyXEaWOA==
X-CSE-MsgGUID: bxz1oczwQPCEZ34B4MpVAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77393926"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="77393926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:40:01 -0700
X-CSE-ConnectionGUID: yO7/CJiNTrKfk8Tg3iCAsg==
X-CSE-MsgGUID: Gee8GejrQSWEiAH6L5WmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235922394"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:40:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:40:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 22:40:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFq07tOUnlERS5sbRlnYgHf9P9iOLLfGIemfoZjcNhLcRKffL3kSiO8Zy4ruG3nODtNXn3RnwgN+nKsTpi4jWYgi0LfsA7cTYtdHNB29Dt5PNXiav6ydXOt+8t8B/B+4x9bsPzWkvkCk5T+iQhiq7j34md0SpFh1vefNfYdlzupMv4IIb1Jfdp83oI/Nm0rRDAFh3iiwE78ifWC6odxkUmXoqwUt0PKp6fGfh/vhGcj82C85sLXv9eEbpDoq1EhF8aExGwAwNBa5lJjCsTV7RLMW65iFm7VmmGzg8K2CSy+FWCFlB8/GftkGeYTXxyS7cgCnBr6LPCLTw7iYcpFXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP9KzdMXfgGROiwjZyla5Ia/fwqVe5wlR593NA9RswQ=;
 b=PEu2PrEVy3FZcy8WGrwZ2XXUVlyhnrR+wVtFM+8RkcKYDZ0RSTBeYr6mNki/r9Pe1m6/WCQjj/52zBh920Gnuq3BESVQpbvaNOKFr7XSrWF2/2k09P798cUOaJCjY6sqB3GQMgwECAo0koxI7Ycbzrhf+nOzsh0p51CluwUQ7qAu+1bvFoUbXjOO0rDTD5WPnjDiDzpicQAv60ljcXjLcxHrYLDEVitywI/XnA6+/T/5DKwAMYWzw6znx6F0G8nxEHSVG4vd2bB+V5REJ5kzwDQR5f4PcRRHheNbKu1gd2Psog4ulvgXZV/oX9muIZgvrrN8Z7i7/1kDpzBVl4Vp9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 05:39:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 05:39:58 +0000
Message-ID: <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
Date: Fri, 17 Apr 2026 11:09:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6e71fe-3322-415b-898d-08de9c43c2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: hE71RN5sRKdx3z0zIJyc/gvSoMkND9CVvIRXqpPfz9Qnf/JpskrIWNFQ75U/7SunHAIR2GABtjOCwNnb6YdDVZU4qtebs5FTHc2zTdFWBDV5sNx3Yv9JtuPh2og70f5xVVlQeZ8w58ejjqkBQcEdQAbCtaUm6VH4L+2FtEcKqMWrUtZal1kSTz5PD1DR32oIL0P3eXKxadSRRp0q/8ic0TVThTNWPSRKKKOHAQu4ti7uHwo0tCRhYUvQyANp9i42Zwq8c9lfBi2IqZMBzoKJ95zc9YNiwoBKPhTZDJEmodJTWYnYfHC/5g2aJbsiLqpms7Kjej3qScCKOUDFYVquE2eaoutdatSpxzEg4brPX/X8sH8cGcSApKVCDkmrx4gwLPK2iFeNVuKA3bh/mraI+q0Wn6wkFnhz0DLb2m4pZ31qOVqR5mSjEoxQ1OiY2SXV59Z66pecqa7pDqYxMO8EH0MmRuleyaVqetj4AUt9eUBUbSOjHu3xlhMF7yMDKHPef0Ajyca39MqEDW/H1nf4ue8PuTeMGCjBype5BAqC62i/Jiu+e0SoKOt8FwnNDIKA8mhQWk98nCU479QRETdmzNUFL7HxDXuQJbU9yASPQ5YSpR0xxNkpG26HZnW0BYUfLTPBH9Ma8fgNefcIjmviHV6n3AvbdhE/1xvq3B8147OMb3ERRRmELoNfc+MNiJ5nBKES37+3zzpXXII/n2h6liw6PgypEkXVu28fsE3RoRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFzejhnZlB3L3cvbWttOWJ0TUhmT3JabE01anlVbDN2SmtiNERWOWQyTG16?=
 =?utf-8?B?TjBBcHM1Z0lLbGVIc3R2eGpnTytmLzJLaythU3paNlhuV3orMjdINER5eE5M?=
 =?utf-8?B?cFpqRWtta0l5cWxGaEhsMHVmQWNDVjFyOTYzNXlJaG5OcFRSbStzaEpXbExt?=
 =?utf-8?B?c1lnMFVHT2d0V2J6Skl0Q2dmckZwL2JGdmg0cFNVM2N5Vi9SSXBKQjBJc280?=
 =?utf-8?B?Njgra3Z6RWZNNnZ4T0R2bVEra04wVzNmcWhsSzN5QjN4dlpjNS9qSDlQMGRy?=
 =?utf-8?B?UTFDbVRUMXozWjhxVzJ0MFIzeTNrRUxJVTZmT3BnTTlTcDJyNUJuNWVvMkhz?=
 =?utf-8?B?T01aSVVVL0pHVmFvKytWQ1FNeS9TMGVDRUI5NlZReHp0eDZBZHhaRUxKcEgv?=
 =?utf-8?B?KzM1STJaZ1o1a21TU0JHVkM4TlRKYSsxL1FjYWllcUFCUDl1YTFUNzVpd01T?=
 =?utf-8?B?LzFHMmhwVFlnZjl6LzhtVUYzN3Ztd0xyckluRkJieEMyS25YTkN1WHNjZ0g3?=
 =?utf-8?B?Yy83MmJIMk1tYjB4MzNFcW9Oa2N6YnpnQXJ0TzVDOXk5N20vOG5aUGFoSy9B?=
 =?utf-8?B?b1RaZ2FuRlBMNVgxTFFURFlCUFdaMzFyM2sxV1crMFVVOFRlT0MralNPaHph?=
 =?utf-8?B?dy9SMmhlbytuNmVvaHluTWpoMHczS0YwaUFoZ2ZWekhtOW9DWWJhN1Fnbzli?=
 =?utf-8?B?a1U2R0kyZ0kzUWpjRjM0WUl2WVZCRTBlUExCSHNMeFFtc1R4dU5UajdhdWFI?=
 =?utf-8?B?azhtZWpqQ0tYRXFGZGk1Q09VaE9JZWY0ejEzd1A5T3k1b3NXRCs2QzEvVHFv?=
 =?utf-8?B?YlVXZ0JZU0tELzluZnVlQVpRcWwzdmZtaStIZ2pRLzJLYXNuQzBmSktta3NG?=
 =?utf-8?B?TFVvcnl0Z0hjWjJoY2FxcDF1bUFJbWFBNjVJbjljb0xBVk5mSjZwRnFYVmQv?=
 =?utf-8?B?ZU9QYURxZDhhM3ljU0ZqM1BYV2VadkxUajdFUGNzSkVraUlZYkdXcTFCVTJZ?=
 =?utf-8?B?MTY3NkpIUG9RT3d0YmRLWm96NnI0dkVWL2hwYVUvR2dxUkZkUldXdDdJTytj?=
 =?utf-8?B?VkxsN2hGTEptUzE2ajBncm4xN2VndGp3djRLNUErN1p0WkM3WnMwY1o4YjVU?=
 =?utf-8?B?WXR1d3ZXamE5ckJjUHpRK0ROaTVYTXdXZHNNMEtFZEt0dmJoOEt4dHpITFR0?=
 =?utf-8?B?VlFmTzg1b1FGa2hBWE43RkhxYUx0WllNalF2dlNyREdYTUIyMmtydXNJWVlt?=
 =?utf-8?B?YnNLY2lHTFYrOW9ZUXJIRjZxKzVTL0NqOVlSRzdGWjdpT1NKV3FSOE1kajha?=
 =?utf-8?B?NmRuVG51TExwWURwOGpOMlN4V3l4ZXpXWDhjVjVNMis1cmpieFpXdmMyTlEw?=
 =?utf-8?B?dHBBOHROUlk5dXBiVHQ5K0k0WVBoYzBJbENaOTJMR2pyOGxCMENpelVxc3Y0?=
 =?utf-8?B?RWZ4anNmbWhzSzdVZ1N1VnZLMXFWd3VmRHovZlVGL29kNFFqaDI4TmFFNnJZ?=
 =?utf-8?B?d25jK3BUWldsM3BlenVvbkorL0pPM29mUlFxaUJ4MjhjS285UU5MN3VSZXZQ?=
 =?utf-8?B?TzhOQzh6UTdxeVp2cTFNbk4xaUtQc21yemdWUVFEbW8xeXJRdTl5NVBCQzdt?=
 =?utf-8?B?U0NQUGZDZGdaQzh0OGNFUURFT01scG1ZMkV5NDd6bzRpd1ZhT09PR1BiNHBQ?=
 =?utf-8?B?enEzMHU3bWZKV1FUSkN0K084Nm5RdVFsVlJNc0YyOVZuWm9KdmpLOXVnR3lN?=
 =?utf-8?B?STJkTlNVa2RjakkwcUFEWE9FQWZjbW9nVmo1OE4rRkxaVi9rd2hpeG95WXJX?=
 =?utf-8?B?Z3NkTDBRa3VMZnFnQWpBNlVaWm1hK0dCLzF3RG1wR0dRa1kycmNuZnEzRHZD?=
 =?utf-8?B?dTIwN3YvZWxGYmlKWStHRm5vZGs2S0loUGZ1UkF6NUFPZEtKYUowWXdDK2w5?=
 =?utf-8?B?dE9LRGFWTW9TaW5maEI2bzFLYmp1K2d0aFc3dGdYSlJPWXdRU2hrVHJPb0pj?=
 =?utf-8?B?eUk1UFVwdGo4ZFV2ODVobElmTjNybDB1dDJWQ0E1Z2dsb2tqRGl3dGVlcjl5?=
 =?utf-8?B?MWE0VTRoT0hCNXZpakhpczRSVXhwNTRiVThCVW9sTDA3T3V1RnZ1bmt0NjND?=
 =?utf-8?B?NzhaajBiYnFqSk0rODhwbjZaYi9DTEhQbE1TOUMvRitDMzlmODRUT1pweGFa?=
 =?utf-8?B?RVpOclBzQmhUYjhhRTFxZDhZVUJ6QlU0dEVFdWZoMGZ6cEpZMTN3L2lVcjRl?=
 =?utf-8?B?N1hXcmo4QnhVMHM5ejhQSzVyU3NzZEQ5V1RPcVMwM204TU9zTmoycU9xbjl6?=
 =?utf-8?B?eGsxKzJvRGZUK0lOSUN0b29jK3BuSlhHQWZHYVVId0Y5akFYR1NrQT09?=
X-Exchange-RoutingPolicyChecked: WEtz6tSIXoDM6fZyFPbSHrEKSuhNvO46uL9fK97Y9Q/pGOrHjvlXVBq4AZLJe9ILfAUgc3sVgq3qAJscEorQYmZFfMdnKFXf1OhYrSrqu8nixenaEvSXA2NNbNmoDSbDyl63jiYxulIy0HiHPUKEx87WZe+tBgGSsseynAfI6BlAgc2GJ1DtSBKqddOqmzPVXp/Pw4ahhJ/VrCR0cc+GFftsbiDqbXmnqkuic5YnKsRtCt94EZHO8nFH83O1kOO/7lBHhUJsJ4x8tsRR+vmVVXZVH4hgZfnxqwuOUJ0Pyesq0S83HpOFaMZZpGuL3oOfy5tr7ZJZ7UhKOu9WEZSOYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6e71fe-3322-415b-898d-08de9c43c2a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 05:39:58.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYgNUyPmglIWKU4zbAhmxYoc5ijPYrf4njM//k9PcQu9vr18oe8uv2GJ1sehyaqSb/YVqAvmh+WrqqZng/Ri0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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

Hi Ankit,

On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>
> Bspec:20142
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tools/intel_vbt_defs.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 6612d3a4ec49..550a9bfba868 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>   	u16 edp_dsc_disable;					/* 251+ */
>   	u16 t6_delay_support;					/* 260+ */
>   	u16 link_idle_time[16];					/* 260+ */
> +	u16 joiner_enable;					/* 261+ */

The variable name should be 'pipe_joiner_enable'. With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   } __packed;
>   
>   /*
