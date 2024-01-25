Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E672C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 09:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7710F8A2;
	Thu, 25 Jan 2024 09:57:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76DC10F88E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706176624; x=1737712624;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GbG9hfZGcrbHu+MN5/P6Vd8QRB90YEVMzAfFZ+324k0=;
 b=nS8nMGICglHTiJ6eReqXaMby7pTs9BRlr8FXnwFkckJuoUoID7T9vaJj
 ltCRPXRnv8lY/83UFKRrX9EhFFthovOutk2ZKK/SFUlM/+6EXb5p32blc
 TWd6FEHrLmeAI5Ba96t1umvKgtwwhM87ICA2eQKcPUmFSdlcDfKuV1ePy
 2C/hBfUIQWUtto2GYnWjzmeg3lpv0DKqu1dziisZMCLxgIsgK0jzxEmBM
 Ke2qKyQsBU1wcI6npMykQEPv4cujolM1ZjJSjRKyr0sdr7qYk0WPleNud
 hJbNTyjFVu/MCGcVPz0A8FgHo6HDxlqNkAM+gKWCG354Hn6Ip5aotgbf/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9499009"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9499009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2306690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 01:57:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:57:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:57:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:57:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 01:57:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLEOW5Ix1ktnqYauEGCVCoWo9X8LWba/AxkHpYdZ0wlA5sfK2YKdQC66s4ad0qiUflLXV1tYrzqRg+gfyLRJg2DG9fwemPAAI1H065yrvaCexcNyZ6IkzukhI+XHlZvrR5BVgkgfVMfWw4q/vKa8aiuAv2p40vDhGQewiHnGOT2HIOBRh8e1s9DcCQrHI+Qh0BKMUyozkCFmBp4dD7nD64O0JLxbbIcfaq+Sig9JJggTwoQip2MeiRDtCeiWLuBMvQi+w/wujegDzFWHDjCsxY9kygffEUiLhrTfRJGqWu6lWBaOzxV5W8TZoQgbnKPOz8nI2C/8t+k+5EHf0Ef3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgdqiKydjNKhJWzslzax6s8U0Nt3jLXjVIi9Veem5y8=;
 b=YjxHBLDWZ/q8uaOmlL2A1Bo4qZqXqarHrDhlRtGwXdI+l9UTXGUPTnNBvoInvLAyyS693Cm9pha9DgtpzhUuAGwLKklP2is58LaqFhIXmxZjkipT2FSCIHzdxGvKktHO1lPNj5PXjSGx5DNAyto1ZjnGCrb87X9ErUW41tgrOREodwcmGlGVbbAbqhHwsb+SDE44sNVFadnQ1aIDopqZPdpjjVqU8x4J3xET+MDRUvtohqcH/4dqPYKvHjo+Z87jjRhBs4pLpVljjGNJWuZ/hW0wffaPRRTgNtCpncgPXWXaEPm8u8qGJYnpi4D3kr9E7RiTlgzwCZi+shX3uosVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 09:56:55 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7228.023; Thu, 25 Jan 2024
 09:56:55 +0000
Message-ID: <694e0799-b7f6-4f9a-9410-ce577e49374b@intel.com>
Date: Thu, 25 Jan 2024 15:26:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before
 begin drrs test
Content-Language: en-US
To: Vidya Srinivas <vidya.srinivas@intel.com>, <igt-dev@lists.freedesktop.org>
References: <0240125055825.8915-1-vidya.srinivas@intel.com>
 <20240125092957.9518-1-vidya.srinivas@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240125092957.9518-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ca35d5-efc8-4b70-9b7a-08dc1d8bf673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUXbAceMYls30iKwn/IfjuHvjC4VikN2wBg36fj9eHOOmXYXfXCnSeQhyrII4mSA3XeECaJTUzU+9i7Xk6DD+PyRljHkYGbatdVdQVHISWHlX9eWrZML9vAtBlLr0///HlUfB36xzNNuFcL2SLTGx4/Gl1mxW0BtCrnG2UKG4uEnh1l2+4uCMLcdYJBsHR71kgUwOyxhaHLSTGkjdXUeauDRgX9XlwNajtNFaLEzFp3QYzCDITzad9LjHmGXDx2MyL9iPKb6d6RjNHd/OCI8Y1dVUOoIW7zkGOe+y4ItSsnpKk6RnLNo2BJUBgKI3Ria25VyFWEnWXQPWsSJNTBKQaIvzwWYCqHyCTKpIt+PT3DuKLmwF8aOrC9ETZpWVDLhkNCC6XjAqvhRJCIV1pZSpc1EtVaEwci71TlTFNP5t1h6cN5E7YGibs9S1Ro5sGmlEbYI82wE5OvzOUGRM7AfzlSAGz/M+UfPL7dbxL3zVFUjijFiqvTfMBIQysHlz6VLE2ow2lZZIf3jvSVQkPq3WhT104dDn34KC0BEq6/M42u3HlkCnz0+3np4Zq2/hf1yYnP4mDct9JiSdt2+QsLslTZXeMs4+sIJGURc/8NLutYf1GbnjjfB7cnkCIef3fKDnCu+Lfxoqc2UhQFuIIzy3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(36756003)(38100700002)(31686004)(41300700001)(5660300002)(66946007)(316002)(66476007)(66556008)(6486002)(6666004)(6506007)(53546011)(82960400001)(83380400001)(2906002)(8936002)(2616005)(478600001)(8676002)(31696002)(6512007)(26005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtBRllRVXZHbks2OTVSNjI4dmcvNTllQkVqQktWTE9JVTJDcHR5QU9BUlU1?=
 =?utf-8?B?a1Bha0c1MEpBb2EzMFpaL1QyMzVWdUxxbUluVXZvMlduN0JrVU9Sb3hIVy9L?=
 =?utf-8?B?dzE3NW9uaVBycDVnbzFLV0tyb0d1Um5pZUt3T0RuUzFodkFYaTlKb3drUjd5?=
 =?utf-8?B?QitiKzh1WC8vcUFUN1gwczVYa0U2THZTZm1pZ0RoVEpBNGRkSEdqeUJhblJF?=
 =?utf-8?B?RGZxR2pmZVZQeTdEOW9MNlZacnpPSE83NDBsbHFpR085OXFSanJsdEJPMlZO?=
 =?utf-8?B?MjN2cExhWjJJTUVyRnoxb0ZrRDZxcTdaTFpPbzd3K1QwU0ZHOGFFRnU4Rzg4?=
 =?utf-8?B?WFhiUnF4U0I0UlRLL2RTSTZEOXdndFgrOVNabDNJUzRNK243aDE3TmVXd3Nm?=
 =?utf-8?B?dC9vcTduRkNOZVdRU3JUZ2luS0h1akRRTFN2RnkycWU1THFnRTdxTVhwOGdH?=
 =?utf-8?B?UlVmUFpDSjg1OGVhYVUzRE43d3VPUXowbTVlSElZK0xoMG84dUxBdU9oOE9F?=
 =?utf-8?B?a1dGQjdRaXAvdGhCK1hnem9TRUN0NitmelNhZTNEMXlsbVdITU1ISGZKSyth?=
 =?utf-8?B?eGJFZk9HUWJiY1ZvaTduZ0dIMTBZdXQ2UXZhTW56dHllcDBhTjZkRmdoa3F3?=
 =?utf-8?B?aE1oL09ZUHpPLzNkbVZhcElMaU1uRENuUGROcTFNcnl4VHp3VXcvWTZPNjNY?=
 =?utf-8?B?RCtmdHptRlljK2FFR29seExKRUpGdVk5b0FCSXNxSTdCT0NzSjhjUEpaK1ln?=
 =?utf-8?B?Z3BrS1NvQWVCS0M4cjJwOExMOU5pMXBpZUlMdld4WCs3WlpVUnE0NU1Dcytq?=
 =?utf-8?B?LzlMbFVDV1JoMGdBdWZxSjlnd0M4U0JoMmxjOWJHaXZ6R1NwVXB2RGVuQ1kw?=
 =?utf-8?B?MGtxb1IwWlYzb04wemdXWmcrNVNpS0dFS2pocmNYajZhMm40Q2theEtWYjJT?=
 =?utf-8?B?L2tZSXpBRk9va0I0MVhoTnJlMGUrdEFMQXZRdWcvNCt4OVJlazBkTkVwM1l1?=
 =?utf-8?B?RTArbU8wN1VPdjgxcjNkUFl4K3dGRHNLT3Zqek4xRitBTEJWLy9BbDJUMzBk?=
 =?utf-8?B?bzZDdytSQVJWaytVNVE0dURtekFzRjVKSXZyczZXU0J2b0JRRGhsT2ltZ01P?=
 =?utf-8?B?c093UU1JMlVKYnBEajhIN3dVd2hWb0hrOVd1ckFudmRiTUEwN3drREQ3UW94?=
 =?utf-8?B?emZSd0NWYUFPelJnajhPd2d4WGRWeWlsSytOVHJnN0JDc3Q4Tm5sSlRyNkpT?=
 =?utf-8?B?SGlSdk85WDVMT2VxZlFpMVM2cU1teDErUm5EWnhOSkdnV25lc3c5ekwrWUtw?=
 =?utf-8?B?ZmdBdDZvZmh6Rkt5bEhyMGNuSzNjODJ5R0wwWW9RUXZQSG9FTXhFSGhuT3By?=
 =?utf-8?B?TlMzYjZtLzAxSFNKSStNelN5TmxNN1M1Y0xXZkJTbWZ0TnhoUFRRVEpXUnk1?=
 =?utf-8?B?RkVPR2FlS1g0Z2w0WE9pWkMybjVjTkkxdVNzYjdQQ3lBYndHRFRlaUxMcjZP?=
 =?utf-8?B?NExhNGhzMDBwQjh6anIvaG9qKzU0SW94Q2RCMjZlQUk5TExXTnlsOGU5eDN5?=
 =?utf-8?B?dGNqbGhSMHRZeEh0NlpEQTZUcnZlRVV0bUJERmdUNit3K2IvN003dWhrQXo2?=
 =?utf-8?B?VVUvbjNBelpaSGtQeXFpT3R2Y3Q0UVBBbVJzeEhQM2FaNVhSNmloMXR1S1o0?=
 =?utf-8?B?amtobGkwaU5XV0psVlVxQTdVdHlxRmloL2pJL1ZUWnFoamdoM0ZBSkl3ZmRO?=
 =?utf-8?B?QWp5eGZqZFk4aXBEeS8xZlNURWQyK0JtMmNHbGpoMnpJUS9KbGFjS2pxci9Y?=
 =?utf-8?B?QmNCb202NnpLcnlzQ1diL3pIQ0hnZjczK3loLzBCNUJyZkxFZk8wRU8ySUJj?=
 =?utf-8?B?Qk9jbmhLQkZpNGlkOFVncVhpcmU4MS9GMlFGSGF0RmZ0RTlCVlVKakpFOXBD?=
 =?utf-8?B?NkRRVDBmZ2xmL1puTVkzRElDZUMzZ0JQU2xBaFVIUkozTkYrbjRvbnJOR0k3?=
 =?utf-8?B?czh4akxTR1B4ZWN1YmwySWk4QUdFeUVHd3FoNGtrRlYwcUUzMm9INjlESFF2?=
 =?utf-8?B?Yi9hQmdEaUwzV0s1ME0wVDZzZW80c0ZnWFdwZjFJdnh6QXZzeTF0ZTNBVjg5?=
 =?utf-8?B?cmxHc3F2ZnlvQ3QrTXR5UFo5ZzQ0MjcrUmtEVjJmdXRId3dKR1JvQ2hGNEJ3?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ca35d5-efc8-4b70-9b7a-08dc1d8bf673
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 09:56:55.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rIRXs8mNKcpFds15WnXCZJZGwN9u/Q3cpyEbfoWGDL/fgO6lO9nI3VwHDkqip0uHM4wLdvheNAdF807YTBuvbR7onvfzGBkIQn5J0nhYZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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

Hi Vidya,

On 25-01-2024 02:59 pm, Vidya Srinivas wrote:
> Sink with DRRS and VRR can be in downclock mode,
> so switch to High clock mode as test preparation.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_vrr.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 44bc3480d..697697b4e 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -522,6 +522,14 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   
>   	if (vrr)
>   		set_vrr_on_pipe(data, pipe, false, true);
> +	else {
> +		/*
> +		 Sink with DRRS and VRR can be in downclock mode.
> +		 so switch to High clock mode as test preparation

Please use proper commenting style:

Example:
/* This is single line comment. */

/*
  * This is multiline
  * comment.
  */

No need to float the new rev, please fix this while merging the patch.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +		*/
> +		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +	}
>   
>   	rate = vtest_ns.max;
>   	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
