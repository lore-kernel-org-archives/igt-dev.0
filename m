Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC59FF60DE
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 07:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5FD10E8CD;
	Tue, 31 Mar 2026 07:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRPYrRWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3C610E8C5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 07:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774942676; x=1806478676;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=7Fc+RDcuSBcuwI5f0RhWql7SCDuSL2B3tlyti6GRCcU=;
 b=DRPYrRWnm+pUR5E59rYLQSI5GItvofW+7fCv7Tnov3qDpZzsf5weRvxj
 d/sfAGwvFaLtUiMyaKAZeQ9Gfx/yHmOOgLS2oMMsa8stW3XyapaP8fOJU
 AxXVVE4mu2zf3gDOLfIqTyKBaPkLjDV1H5eooeP/zkvjWs2drPDHTKb/7
 gqagnZprZuyLzlDI47iEjzQe+mIJLdkEhFhvLAXXDbW4tVh4emEuQUlQS
 WAszCev/xJVvZA/dnpsQBKtL6b5dDFVTOgE3p9VdIEgLQMTFTGoGNDnIe
 MKvf/LAqJD0KV2Pk8Y3GfJoVjblB1LhndBL09Fo9OwFPKzqZ+U3mdjORI Q==;
X-CSE-ConnectionGUID: ZyfDtxXtRQ6aSS7HkDNxgg==
X-CSE-MsgGUID: oeJLUccfStuxVQZu/8DRtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79845011"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208,217";a="79845011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:37:56 -0700
X-CSE-ConnectionGUID: VCWv6PDxQziLiL4a7h83ew==
X-CSE-MsgGUID: YCSHRenzQ+GmYgo9BSZqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
 d="scan'208,217";a="225458612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:37:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:37:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 00:37:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYSUrlCQyCEd/peSrm8d9hlkAQr1kgYrH5ZqePL+o0aOE0QpjaM8/NxAoAx8vnFFzccxcwN38wgim6JG6TbzabIu+kkAv7xWXThDMeg2in8iN3mNmGDz47MmCy0FL1hPQQnqCCZXRxkb5kQdoEJtk6QDuIQwdB+nZS4Y4+azwMVL9Zz1Ze0/QXAwUC+y31CG8vJdNeaHrPBrMmn6rtk1a2g0HXp7hlOHjZnocSRPqCiGdKtfbBDrdVBOkEqHYmgrG2Z2fvDJ5ZJjB8GgzUmOm1er5F6ppzC8fbcKDPtraXQ4HujC39g9/tJpI7xxw+1OdWbdehdJFn3zVtq4WNWLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kOCrW7qnujIdwkTEdZd/OZhLd3oto1SIlwbDKSC4kA=;
 b=EwOsP943R/+pbIvgI3/S6PR+Hc9BJIzSsLgrA8cuwI2Mqc4n/ohxtkf0ih+SBSg0BJQJMf9sYe6uXTZb4SKHOiXy2RUYZOqH9krpc5JdlxnR6JKa0Vdqi0c+kM7lwBqGrkSY+Wv22+xCxRJ11SgHsEobJdSFCgXH+LzLUqLx0p8korZpGoQiKcb3/MMIRd8QoIi8haeqdrS1WNB7PY1SExM62xtIZSBjacfv1P1saHpeP6fvTkRoYSBzEbdi73WDhMHLkzmeKSTUoRPFlShgvo8ixl0HahFQ0MGvsvNGx9PQXh4DLmkDeanThxYIAHRLTMIfS+2/ZHhgGAgqDZg5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by IA3PR11MB8968.namprd11.prod.outlook.com (2603:10b6:208:57b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:37:51 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 07:37:50 +0000
Content-Type: multipart/alternative;
 boundary="------------CClDBkbGwO0Mm65H3YRrnBwa"
Message-ID: <b4232c6a-fda6-483e-b13c-b451433da96a@intel.com>
Date: Tue, 31 Mar 2026 13:07:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 4/6] tests/kms_flip: limit number of outputs wrt
 suspend
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
 <20260330075508.1003899-5-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260330075508.1003899-5-michal.grzelak@intel.com>
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|IA3PR11MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: bab7fc9c-f955-4274-e2c8-08de8ef86951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: EFOeJffPmHxfRSRgKjZ+uv0qO56veh6dEQMn+J7fBdu2/BqGVUVQUuC02EamRWWscGJXiByL+YVIqk5NhFMy3/dv7sSEebyCCSnHvNrosmcSRVBbhALbPBp1w7UaD+2RA/bG7KwrZTl5t5XQYwTCxI1QF00SGn71qCBp2c3jv5fpN8a0Q6vBHbkhGtTR3ZeQW8CchmrNFHeNpT+BtgRFAm0qH1Fg+12ZWlaCNGqoWK1BzRDOeNgmWESMLLMFOwmtdvDWi3KAGnXo2ucicWkH6BfLFHT7mU8Gp3lzIoYjfkVDcqTBQcELN7czHshPwmPMhhoZIKysFu/lfZ5rzOTCvsCgH/4xWJGt32C3iGLtFmrjDQQKpyOjVfMbIbLHW1oUdHvS4yPIylGSuuqkky7vewqAf0lTr8iT+F1pNkuakmxDnTG3DXEDZVMq/dGUGmQKWdNoaQXoAkN4Tazv5uXeWyNLi/ob0RDgZFb8f47Mq0tj7KAjfnnlEJrIbFAvc4TpKbrGdznFQOJFFgpMiWoWJ8c3/t247mCkotJ+k+yZt1Tcj1ZJ458HUDZTRWwWg/bL6ezvuykN968I7xcC4YtcoU8+C5xR1jt5eSNcIuZzTPORTuHt4gFkImnKTnWgB0O/1r5lLCN5YOgD6eIvGh6pggQFB4pgB4cnwMy7i4lq9qnrooPHgx+tWvU16YguHxLcoyAD6uMyfjpW7Jv62QcWwnevMp7DiR0GoVODlsC4mCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3FkREdlczltSVRJMG5URThWV3pLNVVsQlhnMjVVU1BjNFJ6NUk0a3BpUFpV?=
 =?utf-8?B?Y0FuNVREcGt3Rk11djZ4a0NxV2lxdjRhQy9SY2llTGdmTlRXVHZuNVJXRi9V?=
 =?utf-8?B?cHpXdE5yTXBRelBBZlhoWnVGQ1JwU2RPZ3BydCs4NGsxMTVFNkQ1K1k0R2Q5?=
 =?utf-8?B?UTJnV0pLRFdtM0lMTjJDMmRnLzZ4Z3BhMDVIY3FldytBWmtxL1pnV0JvZDQ3?=
 =?utf-8?B?WmErMm9xdnFZdk1pbGtMM1FmV0x2amMvU1g2Q2ZmZ2pGdlBqcSs1czJGcnpv?=
 =?utf-8?B?SlBSV1h4MmF2MEdVSDIzaVNPemVhMDVNZjZpWXVQNVpyWVdBdFFHY3ZDNHpT?=
 =?utf-8?B?b2VTamFtb0VveDVoZUt5ZmlLMU5sYzF4TTBrbkcyWkZmRExDdDg2dnI1eC9i?=
 =?utf-8?B?dTV6bEs4c3ViMmY4aWw4UHJQNDhsZEgwM2pSU0MxUmduWlZLblVqcE02czVK?=
 =?utf-8?B?SExDbHpFV3dCN0w4NmVSWFJVcDF0ZW9Qc3NIY2RaMXpTeWlnSzNoOGtsckds?=
 =?utf-8?B?Q2toZmFGS2Y5eVFYRXp3ajVobG95eHl4VlBwcmkzYWN2bC9FajdMeHZXZ3ox?=
 =?utf-8?B?TVA3QmJTUlVoWWtWNWNRLzJXaHoyb2pKWG5YM29Ic21iVHdJVVZrZnZGRFYx?=
 =?utf-8?B?K0IwbThmVXhSUlBvUG5QQ2J2Q2pXcU1WNXgxYk1HQkQrLzYzY1dtZzIzc01R?=
 =?utf-8?B?NEd2R0t4ZzEyT09WbUxRcUJwdkZOMXIxM1FoNDhTWFBOeU5KZTJJQzBCeDJS?=
 =?utf-8?B?UXpGT1AvVi9JNm5FT05SWjFKdWRKNXRHMGdJazRPdzMzQ2YyTnVlUXdjQnBW?=
 =?utf-8?B?R0FpNWhZeWliYUc3S0NiQytBcm41WFgzcHlzQzh4cm4rbENUbkZLcFYvaS9B?=
 =?utf-8?B?T3ZoL0ZSRGIwMWJxN1pDTTFjV1FKZHpOMHhrRGxpUU5PQTBpVE5BYjNvS0tm?=
 =?utf-8?B?MWczcVNyMitUaitWbE5ONkpFVzdDYUQ4VWdkTTBwYlI5VXhhQkRqOVVucUoy?=
 =?utf-8?B?YzBpMFExSVNXQ09XSXF6NGVMbENCdzUrU2lzakUzTUtaRE8rRmpwMnlLcExk?=
 =?utf-8?B?bVdKc0dydzNhbUwrMERER0NYc2lGdk9BcDZOR1plcHJ1dkt2bVVILy90SkJG?=
 =?utf-8?B?MGd4SUZZQ3c3V1dMbktTbWwydFkxRk5PZi9DU1NwcmJxTXEwSlhpb09EQ0tI?=
 =?utf-8?B?TFNNZ2ZjbDNXTG5CYW9ReUNUQ0djRHVZZVdvbVdRUytrdUpGZnpxdmFUSzgz?=
 =?utf-8?B?M3U0eVBoN2V4emk0NTZkZGgybFcxcXFMZlU1ZmV5V0xMWitPTXpWdkY1b3NO?=
 =?utf-8?B?bUtxM3JyVDFSSkVUd0pjZENyN0U2ZDRNVGpJcGZ0KzdvVEVwamluaUtrYXZU?=
 =?utf-8?B?VkhOcG01ZjVwTnQ4Vml6RzYyQXVkRzM4YWtXY0J6N21QSnFLczR5U3ZJQldD?=
 =?utf-8?B?VDZWdjZlSTBNaWtXaWJ5M0R2RzNuWWw2TndudWgwUEFWVWM4N1JKckhBcENv?=
 =?utf-8?B?YXIyc01rdmc5WTJCcUhGWmI3cldxRU1iMXU1TjBjN1ZiQ08yR1ZDdjlNSnZy?=
 =?utf-8?B?QlJSdEhRTk9wNUgyVDRCb2J6Wm1DKytmQmZWN2FyUmJ6TW4zV0VSOXNvdk1w?=
 =?utf-8?B?U0RMRzg3ZlBnak94WnBiUTdVTmNDRm9lUjBPZzY3VGx5aUdZSkJKNnlYbnhV?=
 =?utf-8?B?Sm8xY0UxN09ncDJjRWYyQWV1aVVHVzhmd29oUk1meDg3NkZ2SExRUjhXaHNs?=
 =?utf-8?B?VTF5MDhtSklQSHU1cTBxWU1lUlVRYy9CVU9kSTdacFp6UW9iUEhlNGl2Y2JN?=
 =?utf-8?B?SDZQdCtIV0FqQ2tEWlpCcnpZRnFIUTREMkVwcFppdHV2TDF0L3Nuek0raDFE?=
 =?utf-8?B?TTBBT1hzVHVFTXZaUFNDanUrVHF0eGhWN2JYTk9sbnAxaUVuS1hrOE1iQTlv?=
 =?utf-8?B?bDZmRncxVFZKUzNYTHA5aVJhU2FWcTVlNUFDRmRVbTExL2ZVNXZTSGJ1a0Nx?=
 =?utf-8?B?Umk4enJRNm5XdGUzVVcrM1oybk1lUHVWU2VRcGQyZHpyRGN3MjBoSHVCaTVJ?=
 =?utf-8?B?RnF3QWRIYWR2dVNPSXMrVjk3dklKNU9UR2x5UjNSNVRDR01QY2dZR0RJcjA1?=
 =?utf-8?B?L3BPL3FmNlRiZU9rUkJJNm9EVnV1SXZEanc2WWRxZjBROWlnNXhHTVlqa1h5?=
 =?utf-8?B?aG94T3RINUNud1hZRXI2aGVRekRzZVBVMW9IVFpqQVEwV1JTK29jQkI1VVBm?=
 =?utf-8?B?VG8yQjZNTVdpejVYY1UrQ0V5R1B0ZjF2b0hKWG8wQXZiRGpmZzNLYkVCT0RM?=
 =?utf-8?B?dXhkVGJ3QlltTHIwcGlNQ20xVVdPcWRvcmNWQnJyTUpkalpHcEVEcDBwRVpY?=
 =?utf-8?Q?AFTfgzTzQxlgPuFU=3D?=
X-Exchange-RoutingPolicyChecked: v38BRZpmMGH9i0xsAHzCLkn9jprJKPGhjw3dd/VdYK/cSlZh/GFikurrtZUstzdyPONwtnWRBclKCWI4CvalJfj1sV8IvbwR5wxwxuRmEDVNPeMqjKXiSLBabhy/zpZUdskMx1zotX2ut88oEyypQ2EFDe/rTF2gIi3CiiyBGPv4oGLDQyabnUOZB9JFlwUBQIIzScC0ah2DBLD57ktO8bwjCvsYPD1M1bJfdAzZ2qGw5zV3gXpVjEGWm+3fXtlgdcuuq9DXq+a/eREj22m17HZp4mZRm1z4G0xDcsPKqc3E2TZQPIQxuIhd29HfJ9ETg9Iegv/YJaOU5tSKZoL0CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bab7fc9c-f955-4274-e2c8-08de8ef86951
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:37:50.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kif952EA+CbS/YiOhymOg8LtGX/crEGHe8WlcjtwixzVYS2a+mQI1JgSAdPR2e4Hb8hVlymsKKH6MOWcHWMT4qgVXW8COsF64ZW1VECRYI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8968
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

--------------CClDBkbGwO0Mm65H3YRrnBwa
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-03-2026 01:25 pm, Michał Grzelak wrote:
> When running suspend subtests on single output, we can still hit the
> timeout by testing too much outputs. Default to testing 3 outputs. Add
> command-line parameter to run on all outputs.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_flip.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 9ea5eb0352..3b3d2d40aa 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -264,12 +264,14 @@
>   #define RUN_PAIR		2
>   
>   #define PAIR_LIMIT 		3
> +#define CONN_LIMIT 		3
>   
>   #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>   #endif
>   
>   static bool all_crtcs = false;
> +static bool all_conns = false;
>   static bool all_pairs = false;
>   
>   drmModeRes *resources;
> @@ -1826,6 +1828,7 @@ static void run_test(int duration, int flags)
>   {
>   	struct test_output o;
>   	int i, n, modes = 0;
> +	int conn_count = 0;
>   
>   	/* No tiling support in XE. */
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
> @@ -1891,6 +1894,10 @@ static void run_test(int duration, int flags)
>   			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
>   				continue;
>   
> +			/* Limit number of displays run */
> +			if ((flags & TEST_SUSPEND) && !all_conns && conn_count >= CONN_LIMIT)
> +				continue;
> +
>   			memset(&o, 0, sizeof(o));
>   			o.count = 1;
>   			o._connector[0] = resources->connectors[i];
> @@ -1899,8 +1906,15 @@ static void run_test(int duration, int flags)
>   			o.depth = 24;
>   
>   			crtc_idx = n;
> -			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> -					     resources->count_crtcs, duration);
> +
> +			connector_find_preferred_mode(o._connector[0], n, &o);
> +			if (o.mode_valid) {
> +				run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> +						     resources->count_crtcs, duration);
> +				conn_count++;
> +			} else {
> +				free_test_output(&o);
> +			}
>   		}
>   	}
>   
> @@ -2061,6 +2075,9 @@ static void test_nonblocking_read(int in)
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	switch (opt) {
> +		case 'c':
> +			all_conns = true;
> +			break;
>   		case 'e':
>   			all_crtcs = true;
>   			break;
> @@ -2075,10 +2092,11 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> +	"  -c \tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
>   	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
>   	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
>   
> -int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
>   {
>   	struct {
>   		int duration;
--------------CClDBkbGwO0Mm65H3YRrnBwa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-03-2026 01:25 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260330075508.1003899-5-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">When running suspend subtests on single output, we can still hit the
timeout by testing too much outputs. Default to testing 3 outputs. Add
command-line parameter to run on all outputs.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a></pre>
    </blockquote>
    LGTM:&nbsp;
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20260330075508.1003899-5-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/kms_flip.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 9ea5eb0352..3b3d2d40aa 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -264,12 +264,14 @@
 #define RUN_PAIR		2
 
 #define PAIR_LIMIT 		3
+#define CONN_LIMIT 		3
 
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
 static bool all_crtcs = false;
+static bool all_conns = false;
 static bool all_pairs = false;
 
 drmModeRes *resources;
@@ -1826,6 +1828,7 @@ static void run_test(int duration, int flags)
 {
 	struct test_output o;
 	int i, n, modes = 0;
+	int conn_count = 0;
 
 	/* No tiling support in XE. */
 	if (is_xe_device(drm_fd) &amp;&amp; flags &amp; TEST_FENCE_STRESS)
@@ -1891,6 +1894,10 @@ static void run_test(int duration, int flags)
 			if ((flags &amp; TEST_SUSPEND) &amp;&amp; !all_crtcs &amp;&amp; n != 0)
 				continue;
 
+			/* Limit number of displays run */
+			if ((flags &amp; TEST_SUSPEND) &amp;&amp; !all_conns &amp;&amp; conn_count &gt;= CONN_LIMIT)
+				continue;
+
 			memset(&amp;o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources-&gt;connectors[i];
@@ -1899,8 +1906,15 @@ static void run_test(int duration, int flags)
 			o.depth = 24;
 
 			crtc_idx = n;
-			run_test_on_crtc_set(&amp;o, &amp;crtc_idx, RUN_TEST,
-					     resources-&gt;count_crtcs, duration);
+
+			connector_find_preferred_mode(o._connector[0], n, &amp;o);
+			if (o.mode_valid) {
+				run_test_on_crtc_set(&amp;o, &amp;crtc_idx, RUN_TEST,
+						     resources-&gt;count_crtcs, duration);
+				conn_count++;
+			} else {
+				free_test_output(&amp;o);
+			}
 		}
 	}
 
@@ -2061,6 +2075,9 @@ static void test_nonblocking_read(int in)
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
+		case 'c':
+			all_conns = true;
+			break;
 		case 'e':
 			all_crtcs = true;
 			break;
@@ -2075,10 +2092,11 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
+	&quot;  -c \tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n&quot;
 	&quot;  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n&quot;
 	&quot;  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n&quot;;
 
-int igt_main_args(&quot;ep&quot;, NULL, help_str, opt_handler, NULL)
+int igt_main_args(&quot;cep&quot;, NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
</pre>
    </blockquote>
  </body>
</html>

--------------CClDBkbGwO0Mm65H3YRrnBwa--
