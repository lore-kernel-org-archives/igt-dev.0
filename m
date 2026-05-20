Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62441CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 16:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C6910E45C;
	Wed, 20 May 2026 16:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjN6GW9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0210E40B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292807; x=1810828807;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s8y+brhNmuHfwq2nJoyVsK5UqFq+YFPtPHpLE5tvtug=;
 b=IjN6GW9Kb/VqNNUFZIQ2wyKiSGgrpqnEWNb9zk99dOSdWRxq9dsl8ziM
 4wv20WXoP+jZYTOwlRTWEnUOb63WKJ0z/zTJYxzL2KqrYYS/C9yazZ8Oy
 ryZWk8IqdTy8hGLuPijCmtfnOF95QXFzqJROG3QYexVvJM1yyOLIViNpr
 8hpeb9kJFxs7Tred9ymEDnjjRciCHkB2PrDUSO7CzGhZxnZkWoxa6UXpY
 7x1Jl/O2nVtq4zb7LLqAcQrsIKeNDAN/pjzSwEOZ32UJNLJZ/vjMpBwL6
 v293kQvxDqN5a1LtXHdrpKa3lcOer0MPAHazryDig/s7BJnGu+s+q6y2w w==;
X-CSE-ConnectionGUID: DDPOjgzHQ/2hxJ43OvdaYg==
X-CSE-MsgGUID: eZlDfFNxTHGQoxJMqj110A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80099115"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80099115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 09:00:06 -0700
X-CSE-ConnectionGUID: kNULIcWjR42r5Fms6siG2w==
X-CSE-MsgGUID: qExbbrINT7ykh3wXgT61dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237618377"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 09:00:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 09:00:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 09:00:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 09:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al9lePZKnE1F+hR7RhUpCle86kYCAVAPOvHaG2pPtUb4Q0smKykhlNZD7QYsURM92wXabWUQ9K9OXmhi6a0OxXGRXAf/9BG/dapOrjtF1RjQKfDxufTkWFQ7nq8vZ9KEmZqHqR5UmDFyornD6qhgzeIJ9s/eAdF1T/cykhaM5xgbybKIDlQidC1FjDwL8MjRL+GVn39BFcwyYTXeW/xofs3hMNdoE/07GIVboSjp/isTrEI4QrFn1N0n0Te7kpkDcFjM+lxVFh4AiFRe6TiOh3A+2w1kDOTnAaLmZYXTFyhiN6ClWVEDDhcp+PjOvGxNc8DnOneFN9qslcInXCtR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pCPmn4I2zTUUi3ABiERKW+GnlFW6RYfYFKnOflI+OE=;
 b=ND6ugDBrMutHM9a/fegcv20tbVykXNqskEkxULdiwmoRGfYlPhRAOk+fubI7auqNQ1JObrGU5mHTBG6QtedFF7KpRso4g8yocPPw4mtn5ahF50Sc6+MHaJsWnSR/nLHztNKAi/2PXGCihb5E0pjGpIjJ7uo74DE+6WnTStq1WKCxx9tOqvGjbyL87Nng0c52U6Z7XSsqR/DFztJWF1lS3eKxnOnWE0f/p5tSBchEnXS2YAEgou6cqI+X1N9MLaBIX0rJnwCOkwvVkGPB4WoaJBTiTiJTvFl5pCUwxPl6MhnJZv0sJSgAsEU7ojEmpWFgiD6nYY4zpmUmp6HftCDCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 16:00:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:00:02 +0000
Date: Wed, 20 May 2026 17:59:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <ag3aeztTvOOxk-MF@fdugast-desk>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::27) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d944a81-d4fe-44de-a6c1-08deb688d9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|56012099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6TWpV3wtId9GLqDinE0ZmJru25mVkbvvawngiPNgcrMsEVpUQ/zXMnysETVPEg6Rwlsvef1bNNcNl62GFqMVAYY4/SNhHAF1DgWDZfxyLNMv6WUY3LKdkv1AlLbjznEH502fmz1mcNg2Tc/R2Qqq9etxd5PYeRD/wr1X3+e58oIN91xpRJMMsQkxgsaAU5Q4Y6jvwoGCnixuuhv5zKEc08DRgR0vXuBVtv0p95J7t8zAWB+Ise1dM826XRJ5vFnKwmzELAsfbQUG0O448rItWP91cZYw6ptWC7RHv7e6NzZEO96xh/0OjiEKcZVyYJExDNjXwrZ9P+aFmLDELPqeuwB4hqVA0ysuevmeYOTO9zG+1qp7Xaq1vzgsocBhpTP+yKvghzSaCeZt4gL3qLO8cbMsDc7EFq2xjg2EXqVUQstAuzy9cfQCkESDxlRV0bAjG5w3U+AqVr/UwlX55SYnHUxCydh8ScqaRHhP+/kO8ygjKVqM5XDHElGPNmtCYsOVYCS9FltmZB4meafPKtTPvejkWkwmngXPIrvFhGmqWVymfNXhsOAmKWf+yTHwApdIckgstQU/1gVOCphYM92WfdiGLf/PBVMNpDFFtN8FylniGiIxW9VDYp+oce9rnFhKQuRYYaUHZxZYsltu9MEprus5BCpQ0Bnqzr0Bf0I/Og2cvq8drXDwJCB5fHXUV17v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG02RDNnTHdldHdIMnFwMHZJSjRsbTVVRkdyT3BNZHVaVW1ZNU1lV0FUOWJL?=
 =?utf-8?B?S1Rpemh3MjYzclpUend2THdhQnlPVlBkdmZBaHRiL1pDS0hQUCtDVVdkT3c1?=
 =?utf-8?B?cjV5SVpIL0VXeTNYUEd4Z1JXZ2tHek01WjljMjNSVnJrR0VJZHRXNjUvRlFv?=
 =?utf-8?B?WmZpbm5NSEY1Vk9JZ3U1RlhFdjNBNXQ3VFlISktxSEZvb29IWXhyZDlDZDRr?=
 =?utf-8?B?cm1acDhQUVRwczE1Yk1WUlFxWmV2RmNXU3F6ZUZtNEFNY1NvOHJKeDhJUHVX?=
 =?utf-8?B?MlExc2hqeFkxeWN5VzI5Wi84dDhXajY4WmZFVko3WjFSVmlKTEFPTkJKOStB?=
 =?utf-8?B?WmNiNHA1U1ZMdll5ajJZQU1xZWU4Wk5LYUxmNSs4NC9RcUNDb1NyYWV5dU9C?=
 =?utf-8?B?WDRGVDlBay91Y2RLbWxqRXRaY25YV2pIZmV1WHV1RnNhcTJsbjZ1SGg2TkE5?=
 =?utf-8?B?OXU3ZmJJNW1qWFJVNzd4cld5R010aGw2cVEwTUNsYnVkRHVTWjZPa3dpOGNU?=
 =?utf-8?B?ZFpsM0pMaEwxNVltU1MvZHljdWFiTmZjNzRqNkdaWUpZL3N0SFIxaHNyR3BI?=
 =?utf-8?B?V3ZxcndaWFhBQ2ZpZ2I2TkhRcStVMkJ1QWdacXhDZmNndkJ5VmtFcnVqNkhK?=
 =?utf-8?B?TXdFUkhwdG94YkYwMmJOVTBrZUIxM1pKVXZIUlVBYzNDczhSN1RuT1IybVpT?=
 =?utf-8?B?dWhsem5scHhFckphT1BSYXY4dU5YWm1sNjNNK0xrT3dYSmRBaUlOT0J1Q3Q2?=
 =?utf-8?B?NnEvTDkxQVRzZS94dWl0MjNlNTdhQVVseVFZYXBSLzlhbVo1Q3hab3pHSHNC?=
 =?utf-8?B?eitLQ3JSRXJxLzBQQzJhMTJ4M3d5dnZIV3A0Z0RaaXNick11Z3NOVWFONThM?=
 =?utf-8?B?NEVpeERhajNRQkg2elRmTk12ZzNOYnlCTUgwQ3ArZDFFYWdCVEt6SVoxMmtH?=
 =?utf-8?B?UjZkTTdMQ2lHNDFKVmxTOTZHeFlTSWdHODFRYkxld3JUODBBSjNsYzJueXRu?=
 =?utf-8?B?QnB1ZncxQzFTUFVuOTNpMGoxYjRKVlRNdnNSMEJQU09TSFdJVDRZVVFGVklP?=
 =?utf-8?B?NFQzL3Y1SlBpRXl4VnBrRlBIcnpvR1dsdjlVRWMwV202Zld4Q1QyUjJUcDQ5?=
 =?utf-8?B?TXp4a01yTUFVd3k3bzFUWUxKYzlTcDNCYkNLL2pNLzhsYWgxcmJERk84Y3Fw?=
 =?utf-8?B?N0UrelRlRjl6ckhPM0xaRmo1ZjdqdjA1aHUybEJtZDZBK1FPSE5HYW1SOGkv?=
 =?utf-8?B?WHZzb3BTY1FVUld4Wm5sT0VqL0d3ZTdSc2RiazNzVVRYVGZGWDBlcnliNitD?=
 =?utf-8?B?bS9IV1BJc3gvZHlOV2Z4UjFZdVRCaXFrelU1T0hwaVdEdnNIQ3dUemo3UDY2?=
 =?utf-8?B?NUZXR3UrTC9leGk0c3BSVU4vU3hIa1hSd2FlcDhLZVlUZzVTRGlYQVRlbzVk?=
 =?utf-8?B?Umd2WThrZXprd21XVmdOb21sUWVpY2htNFQvL1BrVXZWZFROOEd3c0hxK3Zo?=
 =?utf-8?B?Mm1xdzdzM0tUMXh3Qlo3Yjk2Ly8rWWoxMGNUbWRZS2lINktWQU1vMlRySSti?=
 =?utf-8?B?eUpGcFg1U3hKdkNES2FMU1ZWNStuSXVyMzhRajNoRVNjRExUV1hVQ0UzRXJq?=
 =?utf-8?B?YXhwbmF6a3R3c3VrM0FrK09XL2oySE9vRXF3NVFKWkVEUHZpM0NJRUdhZ1BR?=
 =?utf-8?B?dVpHeVRDSU92eWZDWGNDRm9TaU5qdTJxeXpDS1c2TFhFMC9jYWNDVzkzeFE3?=
 =?utf-8?B?TGdXNjhtc1Fqb09NOGo5UTI3SDhzUTJLeDlqTzl1TUVNYjZTNzNMKzR1OGR4?=
 =?utf-8?B?ejI2dGZzM2gzSGw2aWRRUThoc3lzeXVDU1BDZm5WSXZmUjdpVS9iVFZIWUps?=
 =?utf-8?B?dmVTdzNMeGJhREozYnFON3pHNVVFcytNMmRUOU9xRXExcHdNalFhUGV4SVNL?=
 =?utf-8?B?QzFCbVMrRFVJaUdsS3FoZlJUalJjUklvNnlpR0ZCVVdGSDlUUXQ3WC9qYXhN?=
 =?utf-8?B?YXJZcDljVyt6WFhpQ2pmYUZxTEZjNXFMNlNaS3NSL2RmcnN0M2pSOWJTb1po?=
 =?utf-8?B?ajZ0ZXdCL1J3Zjg3V01XSmszcUFwMGVkNmxheXQwckloaVZBV0xMR2pRbGN1?=
 =?utf-8?B?SmdBcjhzL2NUeElYdVZlWFpwOU9VR1pLd0hDY2dyZ3Z2UzBIQWpRcU5yLy9i?=
 =?utf-8?B?cThnRVFJQjAvQVhUeTJNT09aZmp4S2xLaFI2V3JGMzlXWnBNL29laWl2R0Vr?=
 =?utf-8?B?OVhvcG9nbCtKQlg5ZnZzTUxuU2dib3FRRkU3b1dkV3IwTW9VT2lSSUNVaUMw?=
 =?utf-8?B?S0FSbFdCY21jdFRnWmhTdFB5T2s1Uk84dVREMldtQnozK1pDMUM2ZFZ3RHFp?=
 =?utf-8?Q?EygBNOI2/f8YfiMA=3D?=
X-Exchange-RoutingPolicyChecked: PXijocBjILzjDeshXn1us4hYKUfSE5jTTTyMTvAdYB1u0QURG2RjoNT3B7Jx4kzNikOBVtnFUDvvwSKSV5haFqBtXgA8QMAHpo0h3G+CKWmVvvZcV3mCvWYlNKBAPZO5yhRdDTLndNEGOhL6QsG/vkcaA+rLZk8gVNi0b7r5R+frJTlLQGHq+YRTDy/A5ew1S4OV9B/2fXgk8kzJNuEqYluRukToWVs6q7ZSD5Ig7dhNJU47MKkL2qzpaXAkenMYrN5nacONjv+US/yt32YfMpFBTAx8+L3thq3xJkhLupwtDQRo26eoUh6cab6UDs5Ov1009+L82zjyo/rxtE7anw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d944a81-d4fe-44de-a6c1-08deb688d9ec
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:00:02.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFVR3J8KR6R0Vv3Zjlzh7qv8sUcfcGSwWDu52JJKqpR6ZhDc6Qn44Uk9h6ZOdBqZ/mQxnjheUA024I6CyflzatPqn1gIy/XlpcXktV3sqGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On Wed, May 20, 2026 at 11:00:37AM +0200, Zbigniew Kempczyński wrote:
> Missing STATE_COMPUTE_MODE instruction in the pipeline causes undefined
> behavior which can be observed when input/output buffers size exceeds 2M.

Great finding, thanks for looking into this!

I confirm it does fix compute-square-userenv-large-buffer on ADLP.

> 
> Update pipeline, shader and data to reflect changes in arguments passing
> due to use latest version of ocloc compiler.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c            | 74 +++++++++++++++++++++-------------
>  lib/intel_compute_krn_square.h | 36 ++++++-----------
>  2 files changed, 60 insertions(+), 50 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 680675982a..40e57e68b8 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -61,6 +61,7 @@
>  #define THREADS_PER_GROUP		32
>  #define THREAD_GROUP_Y			1
>  #define THREAD_GROUP_Z			1
> +#define PREXE_ENQUEUED_LOCAL_SIZE_X	512
>  #define ENQUEUED_LOCAL_SIZE_X		1024
>  #define ENQUEUED_LOCAL_SIZE_Y		1
>  #define ENQUEUED_LOCAL_SIZE_Z		1
> @@ -513,6 +514,13 @@ static uint32_t size_thread_group_x(uint32_t work_size)
>  				   ENQUEUED_LOCAL_SIZE_Z));
>  }
>  
> +static uint32_t prexe_size_thread_group_x(uint32_t work_size)
> +{
> +	return MAX(1, work_size / (PREXE_ENQUEUED_LOCAL_SIZE_X *
> +				   ENQUEUED_LOCAL_SIZE_Y *
> +				   ENQUEUED_LOCAL_SIZE_Z));
> +}
> +
>  static size_t size_input(uint32_t work_size)
>  {
>  	return MAX(sizeof(float) * work_size, 0x10000);
> @@ -538,7 +546,6 @@ static size_t size_output(uint32_t work_size)
>  static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  				 uint64_t addr_input,
>  				 uint64_t addr_output,
> -				 uint32_t end_value,
>  				 unsigned int loop_count)
>  {
>  	uint32_t val = 0;
> @@ -547,11 +554,15 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
>  	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> @@ -564,11 +575,6 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000200;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -579,7 +585,8 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	 * Then it lefts 32 dword gap filled with zeroes. Pattern looks the
>  	 * same for tgl and dg1 (apart of number of values).
>  	 */
> -	while (val < end_value) {
> +
> +	while (val < PREXE_ENQUEUED_LOCAL_SIZE_X) {
>  		addr_bo_buffer_batch[b++] = val | ((val + 1) << 16);
>  		val += 2;
>  		if (++curr % 16 == 0)
> @@ -597,8 +604,11 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>   */
>  static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  				 uint64_t addr_input,
> -				 uint64_t addr_output)
> +				 uint64_t addr_output,
> +				 uint32_t surf_size)
>  {
> +	uint32_t w = 0x80;
> +	uint32_t h = surf_size / w;
>  	int b = 0;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -617,10 +627,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x87FD4000;
>  	addr_bo_buffer_batch[b++] = 0x04000000;
> -	addr_bo_buffer_batch[b++] = 0x001F007F;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> +	addr_bo_buffer_batch[b++] = 0x00e00000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -633,10 +644,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x87FD4000;
>  	addr_bo_buffer_batch[b++] = 0x04000000;
> -	addr_bo_buffer_batch[b++] = 0x001F007F;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> +	addr_bo_buffer_batch[b++] = 0x00e00000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -649,6 +661,7 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000040;
>  	addr_bo_buffer_batch[b++] = 0x00000080;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -706,7 +719,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  				       uint64_t addr_surface_state_base,
>  				       uint64_t addr_dynamic_state_base,
>  				       uint64_t addr_indirect_object_base,
> -				       uint64_t offset_indirect_data_start)
> +				       uint64_t offset_indirect_data_start,
> +				       uint32_t work_size)
>  {
>  	int b = 0;
>  
> @@ -714,6 +728,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00002580;
>  	addr_bo_buffer_batch[b++] = 0x00060002;
>  	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
> +	addr_bo_buffer_batch[b++] = 0x00180010;
>  	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
>  	addr_bo_buffer_batch[b++] = 0x00007034;
>  	addr_bo_buffer_batch[b++] = 0x60000321;
> @@ -735,9 +751,9 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00A70100;
> +	addr_bo_buffer_batch[b++] = 0x02FF0100;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x07820000;
> +	addr_bo_buffer_batch[b++] = 0x04000000;

What are those changes?

>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -747,7 +763,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | (16 - 2);
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00040000;
> @@ -756,7 +772,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
>  	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
>  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
> -	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
> +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32);

Why, don't we need that in dg1_compute_exec_compute()?

>  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x41;
>  	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
>  	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> @@ -794,7 +810,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x8000000f;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000002;
> +	addr_bo_buffer_batch[b++] = prexe_size_thread_group_x(work_size);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
> @@ -833,7 +849,8 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  				     uint64_t addr_surface_state_base,
>  				     uint64_t addr_dynamic_state_base,
>  				     uint64_t addr_indirect_object_base,
> -				     uint64_t offset_indirect_data_start)
> +				     uint64_t offset_indirect_data_start,
> +				     uint32_t work_size)

work_size argument is unused.

Francois

>  {
>  	int b = 0;
>  
> @@ -962,9 +979,10 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr,
> +			     execenv.array_size * sizeof(float));
>  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
> +			     execenv.loop_count);
>  
>  	input_data = get_input_data(&execenv, bo_dict, entries);
>  	output_data = get_output_data(&execenv, bo_dict, entries);
> @@ -974,13 +992,15 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  					 ADDR_SURFACE_STATE_BASE,
>  					 ADDR_DYNAMIC_STATE_BASE,
>  					 ADDR_INDIRECT_OBJECT_BASE,
> -					 OFFSET_INDIRECT_DATA_START);
> +					 OFFSET_INDIRECT_DATA_START,
> +					 execenv.array_size);
>  	else
>  		tgllp_compute_exec_compute(bo_dict[6].data,
>  					   ADDR_SURFACE_STATE_BASE,
>  					   ADDR_DYNAMIC_STATE_BASE,
>  					   ADDR_INDIRECT_OBJECT_BASE,
> -					   OFFSET_INDIRECT_DATA_START);
> +					   OFFSET_INDIRECT_DATA_START,
> +					   execenv.array_size);
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index ad9f719762..9a368bdff9 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -14,23 +14,23 @@ static const unsigned char tgllp_kernel_square_bin[] = {
>  	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
>  	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
>  	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> -	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> +	0x16, 0x08, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x08, 0x11, 0x03,
>  	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
>  	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
>  	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
>  	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
>  	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> -	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> -	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> -	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> +	0x04, 0x09, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> +	0x05, 0x0e, 0x46, 0x52, 0x04, 0x09, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> +	0x50, 0x0d, 0x04, 0x01, 0x05, 0x01, 0x05, 0x1d, 0x05, 0x01, 0x05, 0x01,
>  	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
>  	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
>  	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> -	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> +	0x12, 0x10, 0x10, 0x09, 0x40, 0x02, 0x16, 0xa6, 0x12, 0x12, 0x10, 0x09,
>  	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
>  	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
>  	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> -	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> +	0x2a, 0x10, 0x10, 0x09, 0x40, 0x00, 0x12, 0xa6, 0x2a, 0x12, 0x10, 0x09,
>  	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
>  	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
>  	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> @@ -41,24 +41,14 @@ static const unsigned char tgllp_kernel_square_bin[] = {
>  	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
>  	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
>  	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> +	0x31, 0x01, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
>  	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x4a, 0x12, 0xe3,
> +	0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x2b, 0x54, 0x3c, 0x84, 0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
>  };
>  
>  static const unsigned char dg1_kernel_square_bin[] = {
> -- 
> 2.43.0
> 
