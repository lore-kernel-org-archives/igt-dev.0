Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC18CD128A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 05:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476748826D;
	Mon,  1 Apr 2024 05:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kufUFIK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2EA10EE9C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 05:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711948639; x=1743484639;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qtLpLubjN7z2PNsDnLvlFqLQ0ilTjSZAOvIqGQdhmcg=;
 b=kufUFIK1Y+BSXYnJT9DldP3TyYgVSSuerXtj5XDP5OveOHX0tUwyS4Ry
 3P8uAO71QscoO9saj57g/LPLNSO9TqTUKx/4SwVJm1m3PZqbdaNyDCwyk
 S13lq+MbgKyuhxU5twgs23nNVMluLilZb75esDIxQIuSJz0LhP2oNt6wy
 27A/Bo5Eu2zCilqM1pvwazV5MGOo3SZ/qtEfFJPT4LBsPSQoUhvSdCrbh
 WllVOGaloOB63tcI/F+C7Zmkt2OtXIDQN8jyuhh1vd2qXyQGNGuWE3/94
 p2AENb32kD/JqR2Trs1cN075sytIpsfYFOFO8q1Nz0Ym6f+UgIKaiU+/d w==;
X-CSE-ConnectionGUID: cNtO9pQyQyOJC/sqGD+vxw==
X-CSE-MsgGUID: 9h10jFuXTcWvYHbBcwSnEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6960815"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6960815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 22:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="55071879"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2024 22:17:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 22:17:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 22:17:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Mar 2024 22:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhcGLvq46zkSbkVrv1+l51EXbod2xVG2JfdDSxnvjdW3aov7ItXTK1EhzDSzgmDUY6H8zjZhlxH/cC34aMw+flaeit9AhUL+yYeffmHWIvFzI5W8j+HT4wGsgxt+J2otrDOq469bO7kQt0LsSvj7uWCGW96xxyd1pq9ingrCEr7yEqrWbXKSeQna+bKmR97uJcwhDJY6y80zUI/10dB40RyJT4EZ36mBNLjBp5jedmZxDmIWsZTteFnU0N0rsUlgmID23rWtqpNs8zXxNLw57/HaKgns5O8wGvB6QbW5gzd+Eqgmf3Di9Wd8rZ6pd2bUw0OeIIa1EQ5QHBcOV4ZBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdoz2ApwJwwq3nvc2oQ1viSuBSzX5NQitsXt1OqktSA=;
 b=irl2+XSQx9DaK7Hd18cX0g/FL16wxsF0zRyms6qwpqYAUGSv3BI7dBKKAz84H24uFdw84bQh/XAafYj/Ti3OR86SYo8XelytghjLmsEVDjN2xdlFig3tiM9xECQ9mPZqJaVKAT09kowewTPAeVPR0fpvTeCFr6Y6LPLbAms/W8hm73cSGu7BI27TIp0fK5ppOzF9Br8OnZYokMj50+ffSk231VOKpmiDwrfeyi0Ou9+G2udQZIjL1oE0IRcdy83dbiMFdoAVY++JHrbbO5s6Di+GHtZlU3+8pMQZYTmUsRfJ+lHQNnwjrMZk8HAsl5dxjiT3cXg/fKjiaY3o7sVQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 05:17:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7452.017; Mon, 1 Apr 2024
 05:17:15 +0000
Message-ID: <d6665d97-1d61-4e8d-adff-b49bd5611550@intel.com>
Date: Mon, 1 Apr 2024 10:47:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/5] revamp big joiner test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240328144554.1371727-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA0PR11MB4637:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQe3zYyH+za2bJoSh0jFlVOplaNBF4RUIe+eSD/6BTSE8ZPCFIKP/3spbcZjKFvZKfhLiXFL8wuGNpYaWc6Y3npwH2Cz6R43OGdxcBkPb8DSjFyZxFd9UlBreUdFF41iEvzgbCXp2Ti/AVZ7heiyvzvLcgPBaQ7IQbAWlLcK2+MMFyT5pA0e/04Efz4Bx1dBAdZX2Sh+ZU13SBLD+zkWYiwj2uzmBKwriV+0JZfE9ms+WSopP2AS2QCtEXAj4n0J8F99tmOE9icHwz6qZAlp9lCONSijodWXPvUYkIMMZvCvIcVP1ARBwuOnBHGP7MOrAnz8PXPHqkT5SKnPKBDWi+XewdI/S/QmNnFcr80Zcu8TJIAiz/ZcmYx3LrvaH4hEKseX7kd1dBFqAKM73USj1hmxsLhJIT0CJJS0V2jPK3ewJDGGer/ntKBfICq0qBGZGH5e5VH8Hz1oOZKRsCz4IErt360IQtvqywy7yHc9+fwVopgZo8fEb7UADjHGYEVjymB333TqddsDampBzL8bVxlco8RPUUDIBDxqrr1tvCz75Q+co4LRxPWxUd4u+IbWGf18+4Mw0FAhWBg1/5Ui7eOdnDMM2D5G29QCMP6JCvYxonsdH67IEcuHS6rxmbkhbyMbKEcmxWlN2aG4MrVDeGtUiSBaZwqkeJakliriTxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUc1OXRoRUNzZzJtaW1WM3NVQUpmaHhkMWp0WXdya1A0emVpcEZRNkhkWC9V?=
 =?utf-8?B?NG5yczU1cFp6UU5SazgzVGtML0xOeWx1cnRUeEREMjgwQllpa1RodXhEUmZh?=
 =?utf-8?B?RXZ4czdidEVQRVdHdEk0RnoxSXk1NkNheFJIS3AwUThkYk5rLzBESnIydDBX?=
 =?utf-8?B?dHE1eHJVY2FlcXJ1dTVGNDVDR1doZEpaTmFxSUswUk9BdXU1aHNtSy9senZu?=
 =?utf-8?B?eEFqRG5PeFRNbUNJdWxsMEd5OTFlSk1tNDArb0RxeHBJdmtNS2phOWRxOXN2?=
 =?utf-8?B?YnplamQ4R0lFQlRMcEl6NTNkZUMrQ1djekNCYW41NlJKa2V5L3RWTkpBZHZx?=
 =?utf-8?B?Vk9mZkU1dE5rbUwvOWVEcWdiVEwwazhsbkNJVFRhb2wzVmZlNlR5dFgzL3RE?=
 =?utf-8?B?M1JmOUdLcjlieHd3aVB1ZzlrTjN0QmNWTHZ2My9DT1NEMFFRUkhuOHhUVE5T?=
 =?utf-8?B?U2hLVm9uMWpzTXJ4V0xhZGlPbkJRbkl2WU9rSHNTU2hoZTRqZUJGUHRONHJW?=
 =?utf-8?B?UmRxWVlGY0oxY3lFSFRSZVhCeWQ2OHNVeXhnTlRrMkxxVTRnMVF3L0dkL1dt?=
 =?utf-8?B?UmxkVnlyQVBUTFVERkEyanRrVWtPUW8vMTdQaWJDL3NJclE3eFpmNEhjZHJQ?=
 =?utf-8?B?czRBR1VGdE5IbzFvYmo0dGtOc2RlRG9HZysybjFPSnM3YkF1eWVBaytxeCtH?=
 =?utf-8?B?ZjZQbXNMZEdZUWpGK3ltYWc5V1ZMSGFqbDRCZ25mclRpU20vMEp6bHNVbXRN?=
 =?utf-8?B?OTBmdkxOTlZqNkg4YWZsZ3RMS3o1NkJFb3NQWFdOUXdGRXYxMWROdFAwQnUr?=
 =?utf-8?B?R3liNDVlV0sxMlUwZk1idEZxbHcxYUVUWTNmRjZ0UktMN2I0b3NwNHBEY012?=
 =?utf-8?B?TFU0bXJrSndnbm56OXJ6YnJIS2pIc2NJSk9IQXIvQXIxTlBGdnM5ZXFuY2E0?=
 =?utf-8?B?U09FekllS1U4V1dFbDU0RTBncEYxdmp1ZkYrVks5ZlBTeGxFbGY1T0J1Wmpj?=
 =?utf-8?B?WjBOcEs2dUxnNXZ1RUt0dXZFVVBBKzM2eDVROUhqK1lQV1p1OGNCU0trelVt?=
 =?utf-8?B?K2duODRTeXZlRWxaSmRqZ1FIaExEakF6Y0M4VHh3S01VMGpiR3h2VWZ2WGxM?=
 =?utf-8?B?YjNHSlNJblNENDdkZHV3Wk9IaEdwL2srQTdPTmtFZTNLRDNTM2xENjdzZkFu?=
 =?utf-8?B?dmR6VVpmMUYzVkdadXdGWjh1TkQrTC82V3VUcEFVR2NhdVN5TlFXY0E0UlZR?=
 =?utf-8?B?aCt0YTFHdVlTRFIwZjIrSTJhc0xvaHdOL2YySENCcG9PMEZoV1Rma01qcE5W?=
 =?utf-8?B?djI4cklrODV6MGQzdmVtNnB5aGxjZG05UGs2L0ltRFN2VCswN3VpWmtoYTQx?=
 =?utf-8?B?dzh4MzBtMVVuSlNHaXUvV3VzREFTUjlTK1FGWU1TMVVkVWlON1I3bUd2Z1hB?=
 =?utf-8?B?bjRzZkhNKzFIajFQR2wrTDZPTllZNEU2Y1VCN0dPOVlaaVJwQUNNK2R1TXdT?=
 =?utf-8?B?N2NpODVWejh3ZWJUV0dpS0VUOHpPcmhqUmJQVkloSWx4NG4rRG9ha0UzNTRX?=
 =?utf-8?B?Q0xyd1ZiNkU3RDlHOGJGa1huVDJ5d2paTk02cWJITVFJSFNWbjFaWlhDTXM0?=
 =?utf-8?B?ZWREQkpvSGswMXJNczlKNjd3NnQ3RW10KzRCSml2a05ETk5mTC9aYTZvdXk3?=
 =?utf-8?B?cmpDRk4xdmZjc3VqNWhPbW1PSU0rMlIxYzZ0clJqdmdqNkNDTDdJMVEzQkVC?=
 =?utf-8?B?dy9RNTBwSDUvRWJHMThiMFJQWDBqNUpCT2x3TWx2ZGZnRkc0anpJVWdvZG5k?=
 =?utf-8?B?M1ZuMmdka2VmZlNweWhVaFdTUVpnUU1XTDFYeitEV0lqWlpHTFlSNU5pTXFa?=
 =?utf-8?B?U0pEM1NZSGxMQXBtdFN6S2M4QnZzQy81ZTByQXJYRTM1RHR2aGZkdHdxbVNw?=
 =?utf-8?B?UnlHZWI3NmpFaGlhc2hhWElrR0FHRmc5cUdzYlZIYUlLWUorSWZWTnRTM0Qw?=
 =?utf-8?B?dC9HdmJscUNYL2xZbnBIZFFDczNGdmVHS1FBeXd4Tk9Fa1AwKy8xa1BNL3N3?=
 =?utf-8?B?bmt1YzhITEcwWFF4VWZ4bFFuN2ZzRmhxSmdld1NjR2JZTGpBTkUxSUVFbG83?=
 =?utf-8?B?VUQ4K3RtM25hNDEreC94WjhoQjNXRWZNTXRFd1JpRTdpMGN3VGRycTFlV2Rj?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdff8fd-29ce-45db-1069-08dc520afea9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 05:17:15.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haIGF2vz0AFlXyODK8PK7ikFxxhksurBdpiWplb7Im5Nyum24A/CzDNS1bMJYazQ37wOYQMwNBnH/VSLq4kPRAYrgnDUvylL5eodolPBq1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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

Patches LGTM.

There are a few nitpicks in documentation in the last patch.

With those fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 3/28/2024 8:15 PM, Kunal Joshi wrote:
> modify test to support multiple big joiner outputs
> simultaneously, support for ignoring fused pipes and
> addition of subtests for testing force joiner support for
> which is added by below in kmd.
>
> drm/i915: Add bigjoiner force enable option to debugfs
>
> Kunal Joshi (5):
>    lib/igt_kms: move bigjoiner_mode_found to lib
>    tests/intel/kms_big_joiner: revamp bigjoiner
>    lib/igt_kms: add helper to enable/disable force joiner
>    tests/intel/kms_big_joiner: add tests for force joiner
>    HAX: tests/intel-ci/fast-feedback: do not merge
>
>   lib/igt_kms.c                         |  79 +++++
>   lib/igt_kms.h                         |   4 +
>   tests/intel-ci/fast-feedback.testlist |   4 +
>   tests/intel/kms_big_joiner.c          | 483 +++++++++++++++-----------
>   4 files changed, 369 insertions(+), 201 deletions(-)
>
