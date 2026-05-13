Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09FCD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1C10E2E8;
	Wed, 13 May 2026 06:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXRiAxLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98B710E2E8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778652679; x=1810188679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x6o8lwBZQJOiPph5kNNlRBHPFi30slGKbD2eAuKXqaE=;
 b=FXRiAxLN/r/TT5iiJvlcPzZUCLgw60DXb6LNhHXZO/uJlom+Amu1t59J
 GpFdRRH7Cxqh+Re5XY376RpHXLbrn+M8xRqSVn12QKMjFCg1NkwXOH/Fm
 XuHPUE7bw/1a615G9IlwieIgIRx+bPAH0ix6H7L2///m5oPz4WbTypY9e
 Q7jz1EXet5HuUJSzFv3sfh8hb7wjzGWbfwfQN0nRPzofp8KAnS1sRhdKA
 Scu+lbYWu7Pg3Lby+tJpAvDwiSPMtPscq3cBjbWrf0oiTSD/Tmns7NouN
 3d7j/FnYfgCsW8iaw3CwWNXjcF6meh3VpAY7DsNKzZ6C8/3lrX9tC5yCl g==;
X-CSE-ConnectionGUID: oSR5CDFuQI+q5QcpiE4Uaw==
X-CSE-MsgGUID: b2lgmWJ1TlaVptjwxEY2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83426133"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="83426133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:11:19 -0700
X-CSE-ConnectionGUID: ITYmpkdLTBmjYmzAhOyXDA==
X-CSE-MsgGUID: zN1CwXZ+TOi/04OqRVX1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242983043"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:11:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 23:11:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 23:11:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 23:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZMQL0VtncMRsEUH4oFVYIjSPtRa7oSe4m/EQsCsLj5IOFRCbo9Z0rKBvsKl6uPYEuYTUiSraY1s2ESqFj4URc3aqNmot+FSMT60o7MAe2fj9UvomzpMtX3aOrJufBP+E4vGbXOO3ivzgAY0+QosGYN2d2nnpT3RfbcC5/SatIy7kpMWSs+qmteAjF0Deg80K8cu8oW5mgBZV1iBi9IEBbLzUyZd/HC9dG4ZTTgoObHBU+U1N8Vsn6N6/5pbVgGlK+wjUjic7hHEiKujFKRdFNES/IbnpPSXDkzOLXeJp3yuFJql6ahk4kQDl5RMs/ox+yolMLmbZZhB6I8jvju6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEJ3jyyMwSiewSmEyA6q8vF1759odnbwYfSyPGDYK8U=;
 b=iPcYeno+Gqj/yr3U3UMD8NeD94ev+cZYR6aUXRG4cmeRYmnubp2CB6g2+sw4SwMCXEp6/KNDhz5cZJQdB5MdPGN6ySR+UIa1XWkcbG/Nrl8R/9xRoK6Kbo+MX2usFQZgYUOrsbC0pVe+KhRdUnPyny6s90YXRU77n55w7l5ey0OCwgMu3AbBvG50zewgn9c6elrMWQ0uPgWA2/K9wheWLXRoDukfwWoIsgBTFiZpqyJl5eo1AnlgmFUUGbq8iR169upv8+KjlaVfoI5sw47IBHt+NmDBBxnzHI9zwaV8B9W/xq27DIXSrib3a/ypMTA1eB4zvsTAQVXGRpSzOMYbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 06:11:09 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 06:11:08 +0000
Message-ID: <fc5e6db5-39ac-475a-bd35-02a5f5fa9280@intel.com>
Date: Wed, 13 May 2026 11:41:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/7] tests/kms_vrr: Add new test for DC3CO
 validation with LOBF
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
 <20260511171820.461666-5-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260511171820.461666-5-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ0PR11MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: cc309061-7b8c-4e7d-2423-08deb0b66c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 8vzANHelyyvqkBxiXZe+YMtRY3gvaoUfmMPbIrgEdhXUwcvU3+bw4DEJj8t6o2+M6wyW2JOOihnu3zlU9qev9VAG7yVpgwRHC31BrP5t1Alf3ZOPWjrmhhrZeq073IgLeA6dOid6UUyFMErHZuCUYUI56oTe16MGZqlwGxOMoAVIpu7Jaq9QQVIUtRT42IXszpNBaZBnPKvzapNQAUv0hDTQeYbpmHeff+GlVv3lrWK2RCoJz4dzrofbiaOVqNv+n9EFRLSi5ZOrDnFcnO/zH6k/90W+e1mE+wu9YN7EJcRAFbZT21d2Je5ed4Q411ho5L03y4UMUMNuQZwM2Y8VCueZrWghitE1euiIAde4via8FYidWg+PzIb6bkRVI4NWwVhMnuUtyX2jd0SeXSxJ3tOXGP5liSlw0FT82btbyLV0g4L2Lca2mKLvxcnVmsrnuhdO/4+E7cDX7tbuZdt00kf+DPwBwyTnXkh5A2LbM2jlQMl8YP3qFqUrssZdOUDBOfxAkinPr8M4vRGidDXGvHrtlACbw6b9rhyrSlQgha98yaB+4oAojeMWSAFEzFQyDtZwm5A4fi+53RN8aRuPRzcHEyp8uNanRW4ir3RhyvlCfl5CcmdE4MTxzwaeURTZEX/DxP+Piw1Nwt1nSO84ftVDQDFCfnfrqyQ35ZlyVQMVSWdLgHEfcum6m2oHAPtz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(22082099003)(56012099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NuVWIxcGkvU29mc1ZPREhPajVCc3BhQ2V3eVhXM2pHMFZaOFByN3JubStk?=
 =?utf-8?B?Wkt2ODQyaVY1bGh3aDJzVHgrRE16QlZZU1c1SStqNktKSmM4cEozeTVrUzNX?=
 =?utf-8?B?cE91SlFaRDdDV001NHl1SlpHeVZzcHdiSFUzM0dua0VCMjBUUXpFRzR6WFd0?=
 =?utf-8?B?QWR6WnR3NGtWMnlWeWF3ckZEaW5FVUpQck5nOHJGSUpUaXpHSjdiQUhSeGc1?=
 =?utf-8?B?cnJkYjJPa1N5UEJ3byswL01HWEFZTS94MjNDSzlhVk12NjZPVzM0ek1CTm5Z?=
 =?utf-8?B?cW1OSksybVYrUlZiQlFvWTBQdnYvc1pmRHBUajF0ME1tOTJEVGgzdHNicTVB?=
 =?utf-8?B?WUdWdGd3Zy95MDdjb1FMMVpOQlJRbjRaaGVISy9BeUxObUVZVDJQV1VaMllB?=
 =?utf-8?B?aGMrTGh1WWdCbzJZU1JZUWxaWWpiTE1Wc1l3ZW9PM1FyR2dXdTlLb1l4d1hQ?=
 =?utf-8?B?NU5TU3ZxVG42Z3JJT3RUaktwK0lQakROM0hWdW9BRkpGV0h5TWJUTVoxcDNO?=
 =?utf-8?B?clgwTVJFTFhJTGtOeUlTdk9Qc09QbUdoajdCRXhIYWFOSVRlRHhWNk9RbVZ5?=
 =?utf-8?B?ejJxdFI1RlUvaENFYXQwRDE3bVpBWnRZL3o4cG1FUVRiRjh1L0kyMHRTUi83?=
 =?utf-8?B?cFNKQVlSZGdKRW9nb3VJRHFiNFdwTWtuU2E5aDkyUjh0dlN4OEx0alR0b0ZE?=
 =?utf-8?B?bUlQVnhQbVd1djBiNzhxZkFOT0NKN01BNXR3UUJsOW9XVUtsWXYvdU0rbE1m?=
 =?utf-8?B?ZEFUd1ZIcTZybFE4YzdqRDVYY2JqYVp1ODAwbC9BUXJnRUpuUUxlQzkrNzVG?=
 =?utf-8?B?ZWJxOXBJbnRLWG5RMXN3bTFCeWpOOFB2c0ZSR3VBLzdNV1JsbUsyRko2dVVj?=
 =?utf-8?B?ZVV6ejcyKzlVSWFlRTlFRzA4T1ZvVkhFNmNZeDBObHJDTnJHaWY5RDlETmN5?=
 =?utf-8?B?OEszNEJWZzU1dXd5V2FMdk9hNzBFUzNaUGpKaVRkOWxBd1NzZWttSnN5K3h4?=
 =?utf-8?B?bjlvcFBmcGg2L0RQUXlBTjdJR0V0Q3hPYm0wNmE3WDhWa3FBRmFKSHorcXhz?=
 =?utf-8?B?bWQ0RWwxdE1wOU5Lbk10N2ExdGJvWmNuZ3g1VCswbGRRZm9GY1pWSmYvRkZF?=
 =?utf-8?B?VEc2ZUhCRVJTQmVuT2JkaTFLOTEvN2prTGt6SnNtSGhRdE1hd3hiWSt6S1BV?=
 =?utf-8?B?NE9tQ2U3SFVHcFNkV0s0c1Q1OC9pdGhrbyt1d2kvRTJaRGdnOVZKdXcvQ2d1?=
 =?utf-8?B?dURMSW1lT2c0V0N1TmdmZUZHTjlaQnZsSDM3eVd4NFJXUDNwSmhvR2pRekN5?=
 =?utf-8?B?MVdKUUN0SGt3OFVuRXMyb1RuSDc0WFZxTnkybVYzTUlNMDNTNndFckt6UFJz?=
 =?utf-8?B?QkhGaDhTcWdRazRSY2NyZkQyczkvejBjbTRsVmVGOFpMcnRFcDBVOEc5NzFq?=
 =?utf-8?B?YWZJYVJPNmtGYzlxSjNyaE10RnBHRGV0T3ZINThheGp1S2VKMExDUDRwU3JR?=
 =?utf-8?B?cXlpRTk4Y0VIdlJuM3MvRWdmODduNW9wcmtqTmF1R0ozUmQvSHozMzJzMW1D?=
 =?utf-8?B?cUdQa0pWWHpzWTZRVTBtNmZmWmtBTWpzR3g4K2ZzemFYSncyYnl2aTBUOGhQ?=
 =?utf-8?B?UC9rclFLVnFoalVybHBiQ3hxV204YW4rdHl5bmhlQ2cwYWwvUjVBTTRVV3Jw?=
 =?utf-8?B?cjhHNWZLeDQvWEZxSk5mV0RJM2lyQ1p3R0pXSFpuZEROWDdsbTFHdU5kV0Yy?=
 =?utf-8?B?U3YxdUE2SFRBWnRiWXJ6aGZSeTVtVk5od05CUFQySC9TRGE0LzJObElvVUtq?=
 =?utf-8?B?VXdBS20zdzZGTktTdFhlT09yeEczM1lwRjd0Nk1zcXZ3RjErMU9OQzJZb3dX?=
 =?utf-8?B?ODZkSlpLUUc3cnZqVXVkWUNVYzhFcmVYUXV4KzJQQ2E1VXEyZXoyQS9uU01U?=
 =?utf-8?B?YkEyUEliV0lIckFlZlpoSzg4M3o3ZDdjM0hMcTJlbEVaMmpBUVdwQ0RwUzk0?=
 =?utf-8?B?akV2TDcvdUJNK3RRWnVRR01OSEJPdzlZSWpvZlZieXBSVFlEbXArN1phQ2ZO?=
 =?utf-8?B?VlFSMUFrc1MyQ2RxZzB5cE1jSzVYYzVPei9LaVhPNEZpbWJBZWVnMC9rMXRS?=
 =?utf-8?B?aHlzNUhEVDMzelV1R2ZLTkx4WVFRakpHSlFwaFJYUjlNV29GVURxcGJsK0FJ?=
 =?utf-8?B?Y2hwcEFRcGY4NkVSb2NhSEQyQUZOWHVUNURXMUg5dkdLUzdRWnVJeWdia2lQ?=
 =?utf-8?B?Wnd0c0I1cFE4RUdXR1FZM1VnbUtHLzZNZ1BhaFc2VW9Xa25hRVpveGNNSDB3?=
 =?utf-8?B?SGhVRkJocVB4TnlYSWxXRzdUSjlER1FUbnJYU1JsMS9oU3VJODFycFVpcThH?=
 =?utf-8?Q?BEY80QNyheEOKCPw=3D?=
X-Exchange-RoutingPolicyChecked: dgi8cq9f2bjvSg61W+eWrHVZIsqz7+IElOyY6ucStf8sl6mzxpoRIcEqGkSYv8Z6KYo77bVjm8VdXXr4tqNThjpfGQ88Hc31hFbaxFeYZkJaPaAfupUui5cKCjw/tYEKFTHfsozpXRWns681+NLdrSHkWdd0idWm3LQ2QrM9IeqHk4SGhJZq2Z0OjaQeW7/NMV6hsIMkDfgpomK5IZ2+lDQo/Oni/8my/7RfMBG+CC9P6KykGMdMKW+/S4wgUvikKeW15qXvcvKuuFHGuYUAbBtVCZWH8OMFHT4Shh3Ej00NUb60BMLpSoQnY8vPNYo7C2Vvd9TuqUJgnTOaoGCn1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc309061-7b8c-4e7d-2423-08deb0b66c5e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:11:08.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRXqgBvJVb0v/SMkD9GZrM7YOHDn6Q6+/ZJbwrnDqpMCOJ8j4QPeyN1glBhKEuo0I0XWyG3l+Hq5M517Q4nQ/Dm8KFuLZRs+kuYqqLtKQTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

Hi Jeevan,

On 5/11/2026 10:48 PM, Jeevan B wrote:
> Add lobf-dc3co subtest to validate DC3CO entry during link-off
> between frames.
>
> v2: Fix the flow logic.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_vrr.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 6043d40f1..82eb8554a 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -29,6 +29,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
> @@ -76,6 +77,9 @@
>    *
>    * SUBTEST: negative-basic
>    * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
> + *
> + * SUBTEST: lobf-dc3co
> + * Description: Test DC3CO entry during LOBF.
>    */
>   
>   #define NSECS_PER_SEC (1000000000ull)
> @@ -873,6 +877,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>   }
>   
> +static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
> +			    igt_output_t *output, uint32_t flags)
> +{
> +	unsigned long dc3co_count_before, dc3co_count_after;
> +
> +	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
> +						 IGT_INTEL_CHECK_DC3CO);
> +
> +	test_lobf(data, crtc, output, flags);
> +
> +	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
> +						IGT_INTEL_CHECK_DC3CO);
> +
> +	igt_assert_f(dc3co_count_after > dc3co_count_before,
> +		     "DC3CO should be entered during link-off periods. "
> +		     "Before: %lu, After: %lu\n",
> +		     dc3co_count_before, dc3co_count_after);
> +}
> +
>   static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   {
>   	igt_crtc_set_prop_value(crtc,
> @@ -1112,6 +1135,17 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   
>   			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
>   		}
> +
> +		igt_describe("This test validates DC3CO entry during LOBF (Link-Off Between "
> +			     "Frames) periods while VRR is active and PSR is disabled.");
> +
> +		igt_subtest_with_dynamic("lobf-dc3co") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 35);
Driver already have the display version check this check not required.
         if (DISPLAY_VER(display) >= 12) {
                 i915_reg_t dc3co_reg;

                 if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
                         dc3co_reg = DG1_DMC_DEBUG3;
                         dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
                 } else {
                         dc3co_reg = TGL_DMC_DEBUG3;
                         dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
                         dc6_reg = TGL_DMC_DEBUG_DC6_COUNT;
                 }

                 seq_printf(m, "DC3CO count: %d\n",
                            intel_de_read(display, dc3co_reg));
         } else {
> +
> +			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +			run_vrr_test(&data, test_lobf_dc3co, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture() {
