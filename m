Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9DE9DE7A
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCE410E6E2;
	Thu,  9 Apr 2026 09:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwWKQV16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD3F10E2E9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775726492; x=1807262492;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TCDqOSE5ZYyejQs1ptNfYsHg16SoWuIY3V93FwgbhwM=;
 b=BwWKQV16pxmvye98i0yLIC2gY5JiP0jFeYxS+XRLwJM2x3LR5o7ly7eu
 KUjxdMcBCRWGAAa9wbp2ptivkHGoo+paa6Bag3LCXeOVz8uPH7cfXONML
 UGINfvotYnJbrxc2prMVoSdxDpWVgklBZi+bDCRDyyQeS2GCBSMmfKaxC
 z4br2FGULUDaZAJDChZwh9VICeMAPnxsZE09uVMAbSQBDDRyytdq1tTDM
 xrf1zZjg6dVZaUQMhFHXhL6zBqJrLKHIEgwIv8OAFG76rkRhwMK4aCopV
 l9u0D+Bz2ksPUey+0KYe3y1uZIu63tqiGvG9KCH1VPVS7WUHQiaHQvzZg g==;
X-CSE-ConnectionGUID: KNklY2wOT8mPgV4Yv+RdAg==
X-CSE-MsgGUID: aEzFeQsqTlenIVUnEDsQng==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76846304"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76846304"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:21:31 -0700
X-CSE-ConnectionGUID: K8GxzuvwQc+qDhsfBbTLcA==
X-CSE-MsgGUID: xJLlbgsSQUm7w2nSO4ihKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="225555414"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:21:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:21:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 02:21:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1eWmbcYQkouyYg4QDbuV7/Ms79YwoKvawppUlKWq6urIWiT0ANQMl0DISWG4NCcmLyyLWXG+hjvxV8bBUrrMgofw+gb3iTzb0T/c9pD1E850GAv/rvuie9vGu6UrfTMvHLRKq+gZJixhl2JFbWNUT6dZFtF5cpgm/TneEsrfKsPS7IDMwo6CqR5y/JblOiEtlsLNb3NjaifWGp33tHYf/yCGeokl+OJcKirQ+77ERUetGVMf0dVOQ4CBK5LI1dwi02WmTHpLR00ac+maE6Lx2H95abJUiGBMogYZeKlx3CRQeddqgrYFi3vm+6VxJd4LYJtIQQq5kfJPhoEDjGUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFiEnB/YYuvJU/0qkTYMyXtwl3H77OJyFAzHl5OScUU=;
 b=Fn00KeWL6V7+XudF4X9GVv2Bi/PgWCQXCHdOn9Y3Ip4J+bhnYfzWYPdhLoFMcj+p5TTikK9eXeG0h76Is/9lCwHj2aujGO4ZdswbVeihx8Td74qp8W1V60iYEcu1JsJ3SHxHv5Yy+O/chzPN8u5nMlkj5XXVb0b2ZykLGDMPEqixs1+HrRpHHCsuL6hJ4e/E8EVIGLx0CjlJQL+ds18+9kqdm/yaMfKk05NKiJHUZnOPDCrSspX6rfXIA/AePHVwsX9tatbTtMMUptnMH1Hzsk7JcZ/0JrCviqzw2PDWn3qTo81Iwimf6uTlaSl7jx4eXbAz95KA3UiwNI9XOqf0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 09:21:29 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 09:21:29 +0000
Message-ID: <c0732adc-d6e2-46e2-bf65-2f51a8a75205@intel.com>
Date: Thu, 9 Apr 2026 14:51:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: tools/gputop: Fix zero output when stdout is not a terminal
To: Vidya Srinivas <vidya.srinivas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260407133940.134931-1-vidya.srinivas@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260407133940.134931-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::19) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f4ae12-dfd2-461a-9e29-08de96196197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: MxTqb6AnKdCa1bK2SBvunmt33+uI6VqHFTNbJEdj7suCH5cnueaAwPOPfxAErFdwQ7o4kcG5YZrb/PkE8y2yPFWNcYns1G5Zxc0/rHCodLQKDF/ld3H/jUDmTJ0OHDXb23vj44juECS7dYNI0S3sJWdYmN1v7/mVq4f+ft8H8xNEjX4Iezp6+YyAxf+T3deni/zfSfRMw+/LgSvkZb/MdGA/qZ2U7Oi3IR0wWYkWqzYUMVrjoc+vLLkovG51YMzO8AO0i1l8fl0NpEIFg4m1szC+bJ/bntWas5Sct1cXtRxSWE7IFfp6lemrPT5JyGtydklUavvx0sKRcecec6Ha+vr5EyxuH64yL4nybjtAVevlBqbWe9lTntYpyn8ul2f6/9UQQFfZAD2MD7fK11SIsQbkpwOGSh7oeIT90501ybHmiA30ueksE2IBtYeFGbAc/L1YKQlJ2hoR3WRM6UJtSov+3l5Xkz8KKdSWbn9YHJsTMRuqmFzAFl86EMog6FB4H58dE3zp+4q2yfUA52JXsGKDlLM7Ga0PsIxUAZa0XlnnENSLi8ReKjFlDEwIBjPQeG9rRUpL7hSsnV0AapQuJcu1CkcVDpIDDuVwc1mXpnwyR5u67umXBkQIyiHU4fNsCbawmhoZbX5WnOS0u2wiBzQ+xtUlutfwdMS6N1v8EnayNl1wJ1xdbEFjEnYVbbE3JGUja4WYvwN/nKxOzaDPyX+NMjWO4RKulYM6mdf64/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi9RbWNuWUpmNW1KUCtLSzF4Sk5jcm5kVWh1UVViK0hBRE9HeTNsUkRrc2Nl?=
 =?utf-8?B?N1h5b2x2SmhFVXJTb0dOMzl5MVpjZTJwZjN6RmZQbEdmN0NHek9wMzBpVElY?=
 =?utf-8?B?WUdSZ3FMN2RIb0o5YThKcVZKazBiMGE2SmdIeTJLTWFFb1FxMEJGak0zbHJW?=
 =?utf-8?B?RmFTelE4aDNxRXVSMktrV3AwNldLSUYzazlBMktEQmlIeW5nVnM2aXJ6bmsx?=
 =?utf-8?B?czlldFhmNFZ1TFJVVnorUWxxOHQ1N25DR2doTjBCOEc1ajZFZmtMUHdSb1pT?=
 =?utf-8?B?VFREZHJBdWZRUVkxdnJxbHlpNDZzYm1jOThzYVIyQ2ZNTWp2TEQreDNoUFkx?=
 =?utf-8?B?eFVuNjZreVhLa0s3U08zODFjQ0x6STVvemVJU093VTB5WkhCSHRpeFEwdTNy?=
 =?utf-8?B?OFZYNmgrN0ZsWEE2R3BuWlNHNFMxZWVXaXc3cW5uTkZ0R3BNZ1ZZU0puaHN0?=
 =?utf-8?B?ZW1XNkQ1VXJUeXhZNzZYK05Iblp0OWozUFdwVDlCRVQ0MkQxRzl3OVM1SGVD?=
 =?utf-8?B?WmZSK2tjYmMzRFJjUS9FRCsyc3Mzcm45ZEQveVRHVXcrdnIrK2FaenJsQ1Vm?=
 =?utf-8?B?NmU3MG5sK1dFSjdrUkZuSmlLZk1iZWVpYTB1VC9uQTdWdmcrRld1WWdtRVRh?=
 =?utf-8?B?aEtnb1Mza0s2MnMvbUl2MmlEMUJBZUJ4bGx4a0hsTHE2cXZFYzdnR0xMV3lm?=
 =?utf-8?B?Q0lxaW00VFFJL29oM09XellwL3JuMlQ0UlFocHRuZEJiZlN0b0g1OGE1Nzd4?=
 =?utf-8?B?d2NSK01OVkNQYXhoM2VJVDNINzlXeE0wVFJLUTlsaktyZ1JJNG05T3BoOThS?=
 =?utf-8?B?RnlQckk3L0VFSmZaRlFSbUlXbXR1M3NEY0VpQm16ckJFYVc0VFl1Sm1udjZC?=
 =?utf-8?B?NnZTaHY5OFZGYXFwdEpaRWVreHpRSmx6TDJJTGpoeEJFeGRkdENtSHhmYjZh?=
 =?utf-8?B?ZllRZ2ZScFBVM1Y2cmE1cktHOVlnQ1ZyRGFMT0R1bEhGM3BiMG1ZaTREbURF?=
 =?utf-8?B?UHJVL3NEYTFFL2FQcFZQMmJRN3huMGJRdDA4MldSS1lzaFE1T05pYWwyL1ds?=
 =?utf-8?B?M3BESFFZUlI3WGFXMjNrcFJxaVA4d1E5dXpCY3k4ZCt5VFNlbU9sTVZxbzdT?=
 =?utf-8?B?R3EvOVphUjFYelBISFBhdVJ0OEcyakVqa3FIMlI2ME1jcFEwWjZ3OGFJVi9G?=
 =?utf-8?B?L1o1clJTa0MzSldJdlJrTXZ2dDA3OWNOMDFORnFSNkduY04rZFdLSklpR2Za?=
 =?utf-8?B?RzAvaUlheXExOW16Q0lNdGtnMDhJVjZFQVBWS25oTXJxUXRENGxlOEljMEQ5?=
 =?utf-8?B?b25wYmUxZytZN2UxOCtXeWFVQ0NJMlh4MFExKzljM1cwRVRvQkZJQzdMencv?=
 =?utf-8?B?WHNYRW0wNTg5eTZzMlcxdFY5N2ZzWmZxK2FGZURiMlNXTms4TEZxdStlMkdo?=
 =?utf-8?B?MEQ3OGd6cWIvZ2tkeVRTakxRQTAxUE5aNVpxK29ENGRsTERoUFNvLzZkaEdp?=
 =?utf-8?B?YU9oOXVIVGUzR3ZkTStCSVJFZDlXOHVKT2tXZkRHWmVtQ0ZXY1JsYmg2c1NC?=
 =?utf-8?B?L3M3Y3NZSzh2R0JVOTZ3T2drWnVqTlE2aHQ3SDJ5SDBGZ3ZvSjdYVDlZekVP?=
 =?utf-8?B?ZTZvY2oyanFNRmVqTnRJTis4RlRUMnFCZkQrR2o3WEFiWTlsUjhQNUoxcGc2?=
 =?utf-8?B?akFVWENLaWsxVktKSVFmQi9wMy9qNDE1aVltNTNMcXhZb2JOV3dTMWlJdTU4?=
 =?utf-8?B?M3RkenZ2cVFJYjBWS3F4b1lmR29RMWtkSXUyTmN5OWx6ak12MzJqZVYrV2lJ?=
 =?utf-8?B?eklObjR2Q3daY3BwSHlPRnpYOEdJeG41cjB1RE5LeFI1cEVkWlNCajd6aFd5?=
 =?utf-8?B?emdHZlNncklOWGw2cWgzdU9FdEF6QjJNZWdmNWlxeEQyZ1dCY3REVU5wLytp?=
 =?utf-8?B?RThoZDVrTGt4VmdQakRUVUQyUC9tUHlJeXhDYS9BQm9ZWmh5UHl3dE90b3NX?=
 =?utf-8?B?cnNsWCtTMjJmVDdVTlZacWZjVDd1cStKRGZ1cGhmUCtkU2tFUk5DQllWZEN0?=
 =?utf-8?B?WnQwd1RYclV2TDIxa3RwZ3VFWFUyamZNNHB4Y3FUQzQ0L09SQXY4VlFGSTRa?=
 =?utf-8?B?dUtkSXVJbDVIS2hScVlVcHd1UDFOOFF6d0JtMWs2ZUVDYkV0UXFhU3hRNXFQ?=
 =?utf-8?B?bjVmNEhhVmpSYW80ZUs4VW93cFlydjVDWkV4QTBxNnkwSmtjbS9ycEJlN0R4?=
 =?utf-8?B?R3gwS3Q4WVNNZUszdk1odlc0bGdnM1F3QXd1VTlVVjhucGhlKzhVWGtORDdQ?=
 =?utf-8?B?Yy81Y095ODlhK3RVQ2RtQ00xWS9sZ3h3dVRrSEtxa1lZRlJ5MHlXZz09?=
X-Exchange-RoutingPolicyChecked: mm7mam0pJbKdYGum1OYD6EhPN+livFg3gBa9FLH8Sr1+aDMmdZeaq121HqiWwS1pAoXuob1vuRtwhzUnbD/im0kx1m+zytA2gOxw/cQK+QEuEzL9BBQH+ScJomXxE47/y3t6mXPuemf17sAcQCNBzpkWeG0Bl1plUhznbaX3gAvEcZb3JLDQ9bN3100R7eNt/aBNo0S2x0MorgTPEbg5BhI2cFaw+04uUK/3lZiCQI3E1MJfh+8ksYy+WXzhwT6Cxq8VPfSNmF9qu3jlh9gafvIPuQyVKhjWGBBtBFrFyrUVdCvnieqSyvEVZiOpKmk9X52UKVmg9oiqj21jJRt9lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f4ae12-dfd2-461a-9e29-08de96196197
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:21:29.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO8ULydoKnhVQG+n3EhRKuXkhfkWdS4ysDWXEI1cFTKwkyvWmkQ37Z3jMIWvx9n+wtZtnfw0wbyHAIIaRInpSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

On 07-04-2026 19:09, Vidya Srinivas wrote:
> When gputop output is redirected to a file or run via adb shell

This issue has nothing to do with its output redirection to anywhere. So 
you can remove this statement.

> (e.g., on Android), update_console_size() calls ioctl(0, TIOCGWINSZ)
> on stdin which may not be a terminal. If stdin is a pipe or
> redirected, the ioctl returns -1 and con_w/con_h remain at their
> initial value of -1.
>
> This causes the main display loop to immediately break since
> lines >= con_h evaluates to true (0 >= -1), resulting in zero
> output being produced.
>
> Fix this by initializing con_w and con_h to default values of
> 80 and 50 respectively, so that when ioctl fails the display
> loop still produces output with sensible dimensions.
>
> v2: Try stdout, stdin, and stderr for terminal size before falling
>      back to defaults (Soham Purkait)

Please remove this as it is not implemented.

Thanks & Regards,
Soham

>
> v3: Initialize defaults in main() instead of adding fallback logic
>      in update_console_size() (Soham Purkait)
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tools/gputop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 9b2e8cb6f..0ed5af456 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -609,7 +609,7 @@ int main(int argc, char **argv)
>   	unsigned int period_us;
>   	struct igt_profiled_device *profiled_devices = NULL;
>   	struct igt_drm_clients *clients = NULL;
> -	int con_w = -1, con_h = -1;
> +	int con_w = 80, con_h = 50;
>   	int ret;
>   	long n;
>   
