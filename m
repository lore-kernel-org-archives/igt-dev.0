Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D0BF327BD
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 08:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCFC10E831;
	Tue, 21 Apr 2026 08:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCpL1px7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52810E831
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776759364; x=1808295364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l0uCKDBnkZVLsLxPtWk1OZF37uTDGIBVjlSYvvkS+4Q=;
 b=SCpL1px7Ov/YXCrMv18HNG6uNuvd72LRo3Ped0vFHQ1N3G4s3hVFqDNg
 s8sNg9bA6LfUMWt5bOyTOphIh1wkhqAV7WY48qazfVXpkM2EfU54g0+SC
 9XCHUdBHjOxvt0mbRYugcnplYis5BiyHQzPQs3j3jZwjk5v8gu6JnWw2v
 GqH2qKO5ekJczcveYc7/nl75yAOxks9Y86TJDiRflJuIxs2pW5HML5Gbi
 KQIqobyIAz7xSeHZsx7c3bWw7j3hbO/NmgS6bg+gTe8Dn1qLzD0Bi22Lc
 PyeNHuxAsrFfJUk4VvR9oZmTTmiBd+ZmsAk0zl7DQ1c2uTsv8CXNp8PwC g==;
X-CSE-ConnectionGUID: SAwdqSe/RrOYTteXcfG/xQ==
X-CSE-MsgGUID: RZCSi7n8S6G8M3+Z/1xw9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77701371"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77701371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:16:03 -0700
X-CSE-ConnectionGUID: yyWKdbWxQ0qK11FBuaOPjQ==
X-CSE-MsgGUID: GUwqYpQCT22NTvjczZDjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229306106"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:16:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:16:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 01:16:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzmlDvVpxSFoZe8kPrIFzRw/n5hlH8Yh8XcwI4ViigXmFFpCcvdsU1kRyMd3wO6eu2OsIDAcy8sLaCFzZhPB4QwQei27JI2Yj+MlYJXxJESxAT85LSocq36ZIhLJnNM+zcqptiMGq87/E8bu51d2i8QifmmlX/NEETmV7fg0HyMOstF+UeIEJt2hVLkxwrePLuf0A39aBemVhFgdtrWxC2wbWuo/WgOuEPN4SGdUfV28RmFRbx058LldcstYNP/hcaxELGljTfNo69mWSJjVkRxfVP7BJeCvmjKR4aLuBSBoggRKxKy8//803P4OZr4V/jxUfljYp5xtDNJmK4XrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01oDuaQ2HvvCR+ZSfod90SI4EDexRKmL6pqtVMug4cw=;
 b=Gz8YfMlykj93dKHOzbcTTFuTwlFCnVNAb2pLOuklmN1/lzZ3cb1G6i70fWfN4FCEX6rawtJGW1aK+SypKowtEzeHTkrTHz/YRgXrv0XCIMrt3I7OS5t8xwuxOgSPHRcOFtYOAhgdd47GJr1YE0H73EJtMh8Qf6VnZ6YyThGOXHisKhZii3XRuQsgyxLztvq/dgvpR9K/+aEojPm/EQQj5E7c5bATi5hWC8v2M90ZVnPa6zRcilWas7wPPYHr+Zk+XPgL/Ng9TIxXG3mxBR8Id+zRCR5MpoHhbWpsW6ix12YlGIXGu/UW7YnQjZhNuhVtHLhhEfxTFlVNhIP3sJngug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:15:59 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 08:15:58 +0000
Date: Tue, 21 Apr 2026 08:15:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v4 3/4] intel-ci/hooks: Add hooks-wrapper and aux
 scripts/allowlists
Message-ID: <7o26hn2ovyoejk2gwrhow7mn7flk3d3kdyim235xjieajqfqtt@oxuy4mlrbpel>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
 <20260420085653.2587750-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260420085653.2587750-9-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1PR0502CA0017.eurprd05.prod.outlook.com
 (2603:10a6:803:1::30) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: ae69e2a1-fc8b-4905-12c4-08de9f7e37ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: GdcQObfk3mizBAHp4n/zkReLCJIJcSGjkNAzptJR2MIzzWpR4KkvNInnmZDOBzoTEE9zV3kqpLBNf77cJd4Y6KmwONGEeerrBFgMDcS9tX+KFEP+/QWgZnQUtWxkhLKmfFE0azch3IO/qfK1nPci2fgDSstRfaRD/kw1XZIw8Ug0LpKFt+Uq68Im4F8CpjF8yGXyl4VwQCocpZVGg1vo0NmDCMHh9O8OrQtUQ2YdBdifCKeAwcljqU9slSGfbkAZvCGOPdcSNzvwWyOFOjcoljHxi1Et9pmpPi1dRAjn1latOjEi//NKJKoiBms28FBoCrjBWJdFMBsHC7C8ksYd6f6ZozDNweuctlSgL2rA4krz+rWeja58QLQcUKCCepwto9CRq4S9GYCI7mW7skBcNKayD44etHte5L5FCizlyXYlsHX6SuNVIQ93vvc0P5sqqPVeU5OiPR19qihLMkIJcEtodf9mCas/oMT7/HAxjpRPyw95w+FG3Yb2VJffS/jGYNSxB3oYJU/7aJjvIupa0d3oVGWzlKzZozFMS8T5yynXm2f6keeNAGriv3Hg+rgwNSYA+pUr0+48GcPvp0yplxsJRvxLcJixm7eSFcHCePUJ8G/t4IR20bxuDktgP2oedvbhqed0K+H14FkttoS+ieKQ2W/szPLDSABJAbjUDFGNV10kxhIpwMD2RMvaDp5Rm+B10W58bdPZWSHOAGvCrZfn8VN6wHSkmSiOK/3UUdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzN4N2E0RWw0UFV2c2FPR3BJRE5EdjdSaEtBL25aeXhhK1NQeURSQkQ1SGh2?=
 =?utf-8?B?S24wdW4zSjlWZE1OTEQyZjFBQ0Nrc3IrN3hlUndZQVFyWGozYWR6UFphZ0dX?=
 =?utf-8?B?Umt2WnN4cWtqVEljekVXdVgwTEMwTit2S2Z0ZHhaNktXVmVMRlhiVjFOK1ZX?=
 =?utf-8?B?UlltMkp4OFVOK2NEMUNJQmZTeWN0N1AxZzZyZjdYaE0xV1RBZmlxTHduekJG?=
 =?utf-8?B?cTIxWnBESEFUcVpLZWtuWGZMZ2xmWkZONUJIejJwM1EyTmFueVRsdngwcEhk?=
 =?utf-8?B?c0RPSE94SGpWWmpQU1NwbXhEbVZuS2I4UmpoREo5djYxZXEwOTdWVVFsVFMz?=
 =?utf-8?B?UjJpL1lXaUkvQ1VMaDNPdlJlRExiSkdjN0FSbENnSGNHK2NzSDRMUWgxRkpj?=
 =?utf-8?B?YW9OZTN4VCszRmpZSlFYZnk1WWJRVGluMks0dkFLWWErQ3c5RXdyeFlwd2x0?=
 =?utf-8?B?WVllRTlaQWpNSllFbFdOdkFTbElwWm5pWFRZeTg1VzBJa0ZCMWkvcmpEa2pZ?=
 =?utf-8?B?QnhxZ1BybVE2NkdlT2NnNFpOR3hTZmxONGFOOSswTll4STR1Ym5UaXZ0Zm0r?=
 =?utf-8?B?bXR5MCtNdkxHZWg1SzZyTVRzcVBQZ2lzRmtsQU1QaGI5bjFlTFFiY2x4eEMw?=
 =?utf-8?B?YThXRDZHR2dlZU1HTzhjcTVBcmRYWkUwZlBsOEZiYTdqaGZOaTVBMUlnL25C?=
 =?utf-8?B?MzVSMitlMGxoREQxSTFRcHdzZW00bjYxUmtDYUVlNnVOdy9wSUd0QittVlkr?=
 =?utf-8?B?UlEvMWEvZmJMNHVmMWNlbkNmLzBIdGp6ZUlCL1JrcGZJcktsTW1WOEowNTZI?=
 =?utf-8?B?SFI3OWx5allHRUtEaHoyN0FuNWJFb0pUR0kxdUlqMHdtSGxnNUtqQ3dKZXdS?=
 =?utf-8?B?T3RRa2NvRUNlaGdQSllWUzdBSFowbmlpM1F0LzdsS1EvV3JNcEVQOFg2dUoy?=
 =?utf-8?B?T2FFNFZTZ2loVXFGUyt5ZmVobkc1ckU3c2E0MTlBZys4R2FPdGU1QXhuVFdB?=
 =?utf-8?B?ZDZ6N05DM3grNGRXRVI5SUtidE5QcVJSZ0NZKzExaHBwL1VGY3VBN3ViWTZP?=
 =?utf-8?B?ZjRqbVJGa2hSbnRJMU03V1pTN21Ic2pzN1IzREdSRVdtelNOb29MR1JjNEdM?=
 =?utf-8?B?b2ZOaDdqcWd6dkpBdWUwREx2YW1PV2RZUjhINlIydjZrYjVKaHluck9sNDlF?=
 =?utf-8?B?VlRFTUR3M2NLZnJvUHpRTHpBcFV1ZTkrOGhoVFhrREZCNzgzTUJqbzNyZTFG?=
 =?utf-8?B?dU5pUGVzc0hCQlRpQU9mSFZUQ0pxQmM2S2xBZ1VINHJwdExGcEFUTVVzVUNJ?=
 =?utf-8?B?ZmVrNjFHam53WDNkL0ZmNzl3MFdVQUEvVFpxTzZWWXQyUnVBT0ljYStuRHRK?=
 =?utf-8?B?TkVCTGx6aUdwbnhRZWlQSHZMUER0M1ZPVnAvVVhJQlZzZHdxVUM5Y1hKRnNy?=
 =?utf-8?B?bXFUUG43aGFwb3JWM0ZHVkxMZlhOVXR0YnpWbHNjengzamVnb3VrNVZSYUhv?=
 =?utf-8?B?Z0o5OG5MNzVkanZmeGRZdjlqVDZjM1pzOXNLd0hqQzJhUFFxRERxS0VBbFMr?=
 =?utf-8?B?Nlk0Q1RuaGhuS3VzUG56RUdzWElqOGZXMUd4TloyVW5qaXcvcy9FRmUwSnJW?=
 =?utf-8?B?U0sxMlVmZDkyRzdSZHFnYUlOYVRVUUh4UDQ3U3FWTm9BMFVVU3ZMcm5peGF3?=
 =?utf-8?B?WGxlYmVXckE3WUZLTENjL3Q5aldFaUxMSHZHUlZjaWJEUXRSa0QyZ3JBcjFu?=
 =?utf-8?B?cmxNZklJQ2gycHU1ak5PSVA4SWFRRzE3QkZabkYzZFpYckRYZW0vY0l3emRI?=
 =?utf-8?B?cytpQlVheXlUU3V5bmJKdy80Y1BvSnBvSVRvUWJNVjlRRUlRdEZ2ejhhL3NB?=
 =?utf-8?B?WmNOR1JmWUJSSkVHZitaMVpsNlNITE0xWm1XYUErcGdVZDA0bVNOL2F4MFNO?=
 =?utf-8?B?UStoNkcrbmFKSkJZVlRzUkFPUjIzYXFSQkhsY3FRY29sY0ZYYWZiWFlxbUQx?=
 =?utf-8?B?TnZMQTFXR1VReGx1UzNtQmRUVktDVUxRQTFJNVYzNkpIWXdhdmtUeUMwN09D?=
 =?utf-8?B?djRIK0xWTllZM0pVZmEvTkhVZk4yOWRHWFgrVzlERmV0NlduajRIVUd2SEUx?=
 =?utf-8?B?NHp1L2dEZmo5N2piTzY4R040MENyUXBnanMwc1BvSnhZb0tuQmxaUCtHY0ho?=
 =?utf-8?B?VStPNmlURzdWK1locEp1NjJNaDQ1dUo3bVNRWnBhNnA0VFJKM3RiMXA4Q0ZE?=
 =?utf-8?B?d3FTZHVLbUtsVTVWQXFCTUJrbzRlYURNd2tGRlVkdFVsaWI0YnlSaXppSGsx?=
 =?utf-8?B?V01DdzhBOE1VMEZyVXMyYmtMQUkvMU1DZkZydG85bTlWVG5NZkRISDhGajNi?=
 =?utf-8?Q?gy32ZOOC0d+9lG9M=3D?=
X-Exchange-RoutingPolicyChecked: n5VKoIBvNevJJPIU+Jq/IXOFjqXtcUAD1NeWLdWjpoh8SHFybARtGyii2y9zBvxeTVpiwO0JbKCeFgopq66R4J13hbThUSofxVL7qxCMLf3WHDEys96OiFKTD0yNszHsJMfBOKeK0KLBGxvFIB8kxEz4ckPYOrnOYL/37G1PUl9eE+L3UtltdSNKIXQy9wfOQZXZyYFB3T4duB8Xobi5whXsTw66XkFTken8b6KoJnbDnQT5mWHA8D0Cy+lBdD5Cxjcr+spZwX4p19XUEO3MQuywRr8UWe0j2prZz6Rro+R10MNmPfIu56XU0XOCHW3YscYrrBkLTvBI6k0ZSwVn9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae69e2a1-fc8b-4905-12c4-08de9f7e37ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:15:58.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6HTrvmLYVMrAlPX88pHHBkdtZRgMRwHCmYCyUOhESDf5CgQM6wOcLktIyOFT4b7L7RLSyZSyalPc4heOawLBMZykiEqL1iAFSu9UMTbuv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

Hi Zbigniew,
 
[...]

> diff --git a/tests/intel-ci/hooks/common.helper b/tests/intel-ci/hooks/common.helper
> new file mode 100755
> index 0000000000..a3f913f8e8
> --- /dev/null
> +++ b/tests/intel-ci/hooks/common.helper
> @@ -0,0 +1,47 @@
> +# Common helper for hooks executed from igt_runner
> +#
> +# Provide ALLOWLIST="..." as a default, it might be overwritten by --allowlist
Maybe instead of "Provide", which to me looks like you expect
an argument, "Set" would be better suited here?
It is just aesthetics, so I'd not block over this.

> +
> +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
> +	attout=$(echo ${log:23} | sed -e 's/\//_/g')
> +	mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
> +	cp "$log" "${IGT_HOOK_TEST_FULLNAME}/${attout}"
> +done
> diff --git a/tests/intel-ci/hooks/hook-example.allowlist b/tests/intel-ci/hooks/hook-example.allowlist
> new file mode 100644
> index 0000000000..54cbc0a1d4
> --- /dev/null
> +++ b/tests/intel-ci/hooks/hook-example.allowlist
> @@ -0,0 +1,2 @@
> +igt@xe_exec_basic@once-basic@rcs0
> +igt@xe_exec_basic@once-basic@ccs0
> diff --git a/tests/intel-ci/hooks/hook-example.sh b/tests/intel-ci/hooks/hook-example.sh
> new file mode 100755
> index 0000000000..512e123567
> --- /dev/null
> +++ b/tests/intel-ci/hooks/hook-example.sh
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +
> +# Hook example, touch <testname>/current-date.txt in attachments dir
> +#
> +# Suggested usage with:
> +# --hook 'post-subtest:tests/intel-ci/hooks/hook-example.sh' \
> +# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hook-example.sh'
> +# or within hooks-wrapper.sh
> +
> +ALLOWLIST="hook-example.allowlist"
> +SCRIPTDIR=$(dirname "$(realpath "$0")")
> +. "${SCRIPTDIR}/common.helper"
> +
> +cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
> +
> +mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
> +date > "${IGT_HOOK_TEST_FULLNAME}/current-date.txt"
> diff --git a/tests/intel-ci/hooks/hooks-wrapper.sh b/tests/intel-ci/hooks/hooks-wrapper.sh
> new file mode 100755
> index 0000000000..263b81a8b7
> --- /dev/null
> +++ b/tests/intel-ci/hooks/hooks-wrapper.sh
> @@ -0,0 +1,12 @@
> +#!/bin/bash
> +
> +# Hooks wrapper
> +# Suggested usage with:
> +# --hook 'post-subtest:tests/intel-ci/hooks/hooks-wrapper.sh' \
> +# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hooks-wrapper.sh'
> +
> +SCRIPTDIR=$(dirname "$(realpath "$0")")
> +
> +cd "${SCRIPTDIR}"
> +./hook-example.sh
Is hook-example.sh necessary here? If it is supposed to serve as
an example, then there is no need to call it each time wrapper
executes. If it is supposed to be a sanity check, then a more
suited name would be in order (hook-sanity-check.sh or
hook-date.sh).

-- 
Best Regards,
Krzysztof
