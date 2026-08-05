Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B932C55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 13:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8E110EE79;
	Wed,  5 Aug 2026 13:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DztuDENd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2484610EE79
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785938069; x=1817474069;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=w6NXusGIg+ZlGsfey8NyIJd90UvlhXcSKVVbzodgXYE=;
 b=DztuDENd53l4+xcWsiHcnrM/dLObzve4kwDSfMKi4Qq3V8dpafJ1QMnf
 a6OgDRtr6Pr2CVbP1NbMIW7PsKuekFBBZyAI4ELjErAwoBjLaG7C+H5eN
 YJ4mW5Nm5BH5wzK/Ry28XsiQ7z1ywPrUdH2wz34tERY+v5TQPV3SAJ3nw
 BA3wqEAUSdBjWL/mEL1GnuuMbW8Ls23M+sHyAkLTTEovCPdqVXVuu7oE4
 gkxKPogw7TSP3Jj2DCMIQxJdsdZCghdSM1dWDinxP42Jn6HExQIkvbrhk
 AcqtDLG2yf+3LAIZ6hgh0uQyr342SH4uQx+GPXq1key8KLzkmoA77Gc62 Q==;
X-CSE-ConnectionGUID: JZlPPVJDQX27thKAXk+FWg==
X-CSE-MsgGUID: PaBwBn1BT2SJOyMB2KD7Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86591475"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208,217";a="86591475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 06:54:29 -0700
X-CSE-ConnectionGUID: nMuZNrZEQXiKfeVVTXQK0w==
X-CSE-MsgGUID: x5/VlfUURR6JAJfKhmJDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
 d="scan'208,217";a="266046146"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 06:54:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 06:54:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 06:54:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 06:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0rPZTE8PllZcfLERhfNGDamxLmPNjb65xjF/RTf9Zjs3vUJXYQfRFmV7uetrZBGDjqSfYeKABpUmUZ16KXXAyApxqhnr3jsumGbPABDIcnEhOLv1FIKNgRlg6t+EIN0/F0CjLfYXy90hJ62jAo2O0/n3d/mZQUGdhCoKz8gno73ITlUMuOgnfLBkhyYB7J/Hvr/uJybb+OHyE1HwveC/csH1gVBBcAiC61pvyxmP8Q4RkCjSOJx/d9Ntzb7SqZkcCTGbd9uv88aFFCvmqYMStgi2pAMsjGbpCwMIyTwOxKYJC9Cc/DXtXwr6qEhlzM97imnyt2d20QCgJ/vpDEANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY0nrou3vo6x3sn90vsJ+fCf5u4jGALMjipqu6YQqx8=;
 b=E/gYx8HV0jF/nC6a2rGyZxlfXkNTP4PmJvCjGDFs4vU80W7KZ0BSHPcpWTVEE0xmjzFrDwCO63JpL0Axptj9SfgqA2IFM8pIIQF6uJTFXAQJlmtrvSbyKbx+je1hdMUnS2fB2RPwjetBhiJghCYTfJeFVH2tsaUd6xpFFaF+kCgB3aAghN1KPoN8W7Btp9uoNYYAXp8FS52dEZrtsXRku5Psmccxc9mnhT6AtWW3DoPy7vq9csPjvjBUC8D6WTMHCcN0npZkQnxaL5gCSq0ftI7sv/g6kt4LqixV+2kluYLkp+DFzmOWzaC2kjnuO+lZDI/Fg89SlXUkGhdvgmY5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Wed, 5 Aug 2026 13:54:08 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 13:54:08 +0000
Content-Type: multipart/alternative;
 boundary="------------ksiHvg35PY0IeeSIjz3fDWsO"
Message-ID: <daf8dd4d-04c3-45c7-b77b-19b4fe01d261@intel.com>
Date: Wed, 5 Aug 2026 15:54:05 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel-?=
 =?UTF-8?Q?ci=3A_Add_expected_skips_to_VF/VM_blocklists?=
To: <igt-dev@lists.freedesktop.org>
References: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
 <178590752647.20166.11258260214161239771@61270ab9df2a>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <178590752647.20166.11258260214161239771@61270ab9df2a>
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ab272d-be25-4050-ed72-08def2f90552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|13003099007|56012099006|5023799004|10067099003|4143699003|11063799006|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: olOG9NiVDJm0UzmJbx0xPmxnBCH4ir9pOgWK8YLeP6q/q/PA8rRQqz6KGBenjCD5lBt5v9nMET6AdzOmbApzfLlrcYGZJAdQnUDbR/H7iCVC3YiywC8hlOPRN7+hZSrhZZI7eMx9P1y2rAKzekGaesCM35KJsAyW3kh/4BZGXUCNRmUAqCiZnI0jLN373SGecQNQoxLTtK5QCbShW6avqj5vdxz4L1E8KZ++C6kaS5MNW1LJ+Qst153eNccEyX9v0dRY54J91NcQwp9wt7JebN8/DMWBJUX8+ENLHbiqVcqK1JoW2Eno7jA4efqu0O2k8HfWMSTx58QuCap9om7ECKUVUA2DtLZXboBMyxQ7ZZ6W+jchzoSzJHEDyVCXTEP5YzcUM6QeF99vzdPulzXHI9DUy9+FOrLUkfX4YgqAEsqvVXwzzt0ZhxRT7O8iB2MS5HNkCKyvplBFdrFCdMbaN+DSFY2OeTKHmE6EwVTIV+8D6LAhXhQYdmaGjSE2QWUw/jdGLPMd1hreRsV8XACjTLT7PnkaXpwxrMO+1ngucbepKHq0BjgznZ3Cpy800XXjwwG3Hlkn1KHB+FBlEvSsq7ogVrG91IJQrktn+JlKl7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(56012099006)(5023799004)(10067099003)(4143699003)(11063799006)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHd1b1lGTTVQRVBBY1FDblBtbFFzQXZoWEhhWGFSdnlPempmYTFNdjdLV0VS?=
 =?utf-8?B?bDFqOFlrdHBpWklhYW1LRkNBQWcvR1BQM2hKT0dDaFplbW9NaXlITWVqU2Jx?=
 =?utf-8?B?Rm1XdGtZdlcydW4wZ202ZGJiazRMaXRra2hvNWZkWUpCbmp4WllXS0tZemIr?=
 =?utf-8?B?bjNmRWxENnIzVHRQakkyUWRPdUc4YVhncFMxUFBJYjFueDFDUmE4bVVycGJk?=
 =?utf-8?B?NGwwSXNiLzdjM3BabGwwTnJDOGpjSC9JNUc5bHI4WUc4MU93TFNKMlBUTWRq?=
 =?utf-8?B?L0hqSHYyNVd2RUJsVEpKZmVjV1RzQ1JsWktvNjF5aU9oN0ZkdjhvM2wyNTVP?=
 =?utf-8?B?TGFRZmZFd2lCZGdsQm1CNDBsbVJvS0pGMWtHMFZRN21IaGEzRVFjb1FXVUFK?=
 =?utf-8?B?NmRuRW9vZVNZTjZMYmF0b1lzRy84L2lLSHViQU9tZ3FNVEViZ29uUXdaT0p4?=
 =?utf-8?B?c2hob3kzUjRFdXFKS1huTzBZbGIwM2pwR09USHlEN01NTExqWDl5cWYwQjdY?=
 =?utf-8?B?SVFSMmpzd2U3c0FTSDZSNERRRUxldkFQbXA5aDZJaFR2MGNYUnZ2c01KTEtB?=
 =?utf-8?B?ZUdWTG9yRUdiby9INE1UWmR1WXBkTHRjT05iODBlQmFjNGNZMjdoMjFENktW?=
 =?utf-8?B?ZGFWeEhpTU9yMm5acnVDZG4xZzhaNFowT1ZKVzA5SXM2aVY3V09uUGM1bnhB?=
 =?utf-8?B?dnYyN1pNamVYc1ZNWmRDb1BtYkJTYktDb3dWZFg4MzdOanp4MUIybU5DNW83?=
 =?utf-8?B?QkFMVFM0aTcxdkt1MTlQMUpMeU1ER1o5ektDL1RieDJCYlhydUk3T0djTVJz?=
 =?utf-8?B?L0FMck83UFNJakw1NUoyemZFeUJtbTdSMWNOM2xjUzJwaDJrTzFuYnFrbk1n?=
 =?utf-8?B?YjZzUXcrZEJRVzZEcjZGVjhFd0tlUVhmZkh6LzlHb2FNZklCaTIrUUlORi9C?=
 =?utf-8?B?NExGaW5aT3ZFM093RGYwVWFRVy85V1V1UVN2Q3RVV3BPYm5GdFowRHFsV3J3?=
 =?utf-8?B?TU44ZVBNQ0dyYjlGZWpVWEZjb0NhaVFudHVkdE1vK0dGMjlYVmNlbVJ1SFlp?=
 =?utf-8?B?WGVES0xpZnZ1aVpDQnNxZFBnUWk1emVNSldjQ0pwS04wMmw1Y052VjhsbGNp?=
 =?utf-8?B?UEYzL1gvVG1oSlJEWThnT1dlK2xwWHdwSHV1WXBHYTRzdThXMHNkZXA5WnNw?=
 =?utf-8?B?dWZKTXgrSTgyWTRxU0ZOcWNzdjBVSmZhUkhFT1JaNlVOT3BKUjU4aTZvUC9J?=
 =?utf-8?B?ejgwcERjK0FZZUFmN0NBMENoZlBhKzdFa0JHYkJnWnhRdzNkeE1ZUXNEU2tl?=
 =?utf-8?B?NFRQck9qK1BYUk45eXAvUkdWQ1VBU21UbkdlVnV6djJQOHRNNGRheTJyenpP?=
 =?utf-8?B?Rm1RdHVoVkhPL2JjSUdXUm0zNFAzR0duNUlRd3VRcUhneWF6WWtBc3pqejBL?=
 =?utf-8?B?RUg1SFVTMVBwWlhGRTlLS3YwOTlrNVVkNzMvUXo1Q2wvdDduRFlibVlUcE5D?=
 =?utf-8?B?eGxDWjJEa1I2aHQxMW1VOFNrV2gyWkZXbENOZnVmYW1lM1JVMnMwMWJIK0FQ?=
 =?utf-8?B?VTVkZWJqYTJwNW1jNlU0L0E1OVVJWk1BK05qSW85RmcwdUNvc3d6YmtzaUt2?=
 =?utf-8?B?RjNzeHdwcTlOelZsU20xbGFVK2FXU0xMaUY1YkNWUDdwYmFJZkFpaS9LYlpE?=
 =?utf-8?B?UCtvejhYOFg5ZEZvQWVTeXF5RkUvRy8yVVpBa2d3d1NZNnF4MU8yTllCeWxi?=
 =?utf-8?B?eUY1Nm9aK3RNN2ZmLy84bDVJVGhsdU9CYVhOc1JkbC9ld08wcEphSmZCVlBw?=
 =?utf-8?B?RlNtRHFPc09zaEVCRk5OeERnOHV2MUZyTTZJTk1XVzBqUjdETEVKd2VBaHVx?=
 =?utf-8?B?dTF4UmQ2MDYzeU1iSzZuY3lISlJFK0sxQ2hIbFNwa0VENWkwR1lPZlpPOHpX?=
 =?utf-8?B?YSs0U3lLcDB1Zm12VTNFZHBtUjFLVGw5Q3RQSWh0VTB4b0lQR1lweGFKMFZV?=
 =?utf-8?B?MFhWNnVxL2prL3BFcldGV3FLekh2ZW1YR0hlc1F3TG0zY2RHS1NXbGFaSlBs?=
 =?utf-8?B?ZWsxZFFkTG9hWWZ4ZnhUeU9NSTZWUU91SndsTEowMGhsdGF4R3hhRVJnZFls?=
 =?utf-8?B?bWVKYStLaWNkY0o2aStTSDljdlF0VDdzMEhSQnRBTjlCZjZubytyV0FxYkty?=
 =?utf-8?B?UHNEVXRsWXdhdnc2SkpDWXpxd0VvTGFJUTE0VG1KdU9lVEhCek0xNjdialBa?=
 =?utf-8?B?d3NaeVF1ZUkzMGJ1V04zTytDRWRBVVJxb2NaOU12SXFmT2FNMkU3VFExSW1n?=
 =?utf-8?B?cDNHdkt1R1l1YzJSb1pYZlF1UmxMWkd0MGRlKzFCL215UzBhdEFTQkc4U0tm?=
 =?utf-8?Q?yNUI4RfJzGBe+OE0=3D?=
X-Exchange-RoutingPolicyChecked: NLyc1wENXsFligXq2WdqcbkT2Jo5LeOFEeByVwm88gXkrNzOT/myNIf3EAUmkvmqtxbxJQBPXTnJorYhqvAMFeqiGmOqBIOc1A5aywoyo/Sxt9NQtc/BeKtsbSYpUezVvEpTHBbuRBa6Tt9RbMMaLJ0f7PSagVKtJOm6MvOmU+w+Sqmfw2rDZbdg/lTe59pNlgfKP0CGUFLG6YL7zTIbRp69gmOoPkoMah8pgiKeI4v0deVmCuJF4YFnqyIoGxwqj2FtKpB/kckVfRyYsLJ+MGrddxpyoVv51D6t+KEpIYFjs/FYDSOV551seK/UMR1WYE6ywR1lqV7GUdxBWIgZxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ab272d-be25-4050-ed72-08def2f90552
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:54:08.5830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L79v3qBFEVFrcE3G61ql7QTsfvZ7Uedg30ucrbOvWisyAugAybh1qW0/E+LUorspFD/2F8e/aDw6ihl3sYZjel8aRKSk4QNyx0gleN0nPzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

--------------ksiHvg35PY0IeeSIjz3fDWsO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/2026 7:25 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel-ci: Add expected skips to VF/VM blocklists
> *URL:* 	https://patchwork.freedesktop.org/series/171601/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/index.html
>
>
>   CI Bug Log - changes from XEIGT_9037_BAT -> XEIGTPW_15630_BAT
>
>
>     Summary
>
> *WARNING*
>
> Minor unknown changes coming with XEIGTPW_15630_BAT need to be verified
> manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15630_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (14 -> 14)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15630_BAT:
>
>
>       IGT changes
>
>
>         Warnings
>
>  *
>
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>
>       o bat-nvls-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html>
>         (Intel XE#8740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html>
>         +30 other tests skip
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc:
>
>       o bat-nvls-2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         (Intel XE#8740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         +30 other tests skip
>
unrelated to my change
>
>  *
>
>
>     Build changes
>
>   * IGT: IGT_9037 -> IGTPW_15630
>
> IGTPW_15630: 15630
> IGT_9037: 9037
> xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: 
> c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23
>
--------------ksiHvg35PY0IeeSIjz3fDWsO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/5/2026 7:25 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178590752647.20166.11258260214161239771@61270ab9df2a">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel-ci: Add expected skips to VF/VM blocklists</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/171601/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/171601/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_9037_BAT -&gt;
        XEIGTPW_15630_BAT</h1>
      <h2>Summary</h2>
      <p><strong>WARNING</strong></p>
      <p>Minor unknown changes coming with XEIGTPW_15630_BAT need to be
        verified<br>
        manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15630_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (14 -&gt; 14)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15630_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
          <ul>
            <li>bat-nvls-1: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740" moz-do-not-send="true">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html" moz-do-not-send="true">SKIP</a> +30 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
          <ul>
            <li>bat-nvls-2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740" moz-do-not-send="true">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15630/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send="true">SKIP</a> +30 other tests skip</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    unrelated to my change
    <blockquote type="cite" cite="mid:178590752647.20166.11258260214161239771@61270ab9df2a">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_9037 -&gt; IGTPW_15630</li>
      </ul>
      <p>IGTPW_15630: 15630<br>
        IGT_9037: 9037<br>
        xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23:
        c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23</p>
    </blockquote>
  </body>
</html>

--------------ksiHvg35PY0IeeSIjz3fDWsO--
