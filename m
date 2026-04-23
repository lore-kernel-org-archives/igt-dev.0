Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E4AF9937B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 11:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937710F0D5;
	Thu, 23 Apr 2026 11:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bF9lMvwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CD10F0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776944487; x=1808480487;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Zln+FOGSb6Uim07HiGuR3+5IZAZVbRiuONNrVXjrZYM=;
 b=bF9lMvwUUKMavhLHoVpBUJfhtZC1Mif+/KdP1GesJ+ZDB82sVMtLxUpJ
 0zfVD5Bx9RvNx6HgCoxS12EEN8nJlGxOhUgib34jb22+mZHII9+gegk7Y
 JWH/e+JaBQloJe0LglYX+EWyWcbm2Uz2g/q0kiB+fegyR4XtcvfgO6+jS
 FMduB4AYpNXzLjCFqDS1AksI4zNmqfTfJH61QcOwJeeClNJ7dsqMv0qVl
 V+OS5+OxqqucEpXgguE9puqIhxs0Tk1p827uKX+GVtM3UzA7X4B60Ugnz
 EQnqXjQcN+i/DvAbTEMrw1jrpzY538FV67ZSottdY3jKXQbxU80rb5aDc Q==;
X-CSE-ConnectionGUID: b8YZvVLMRP2N2fnNR5ADTw==
X-CSE-MsgGUID: myUx3AlDS2yxX3CqBfYKZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88216094"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88216094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:41:26 -0700
X-CSE-ConnectionGUID: yJi5/flCQ9ej9T4jU1WjaQ==
X-CSE-MsgGUID: 8k6jokI2STSGAgEk+05Wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232944519"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:41:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:41:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 04:41:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtdbmiWIztBjUJH1XAE4Kz7AWruLKzYKITfwrhOn16rbom/LbBh0vQgIHz2ICwWyyhNDf6xixKhThyBXlsHlFRgo3l8J8Im49vgOalDL491GDZEgI981s2BYgRBGvXwjf2b7XWkEXOcWQG/ebp3D3Ll0+CddUXx+nGiEnzbRrSfDrycPA6AgG5E3NYvd9ffQqIj/YR6G3Kck1DSTXCVOb+Pi0m7wWnW/RVIYre84H3a2dVNJXEcQaQ/RSd1ocqqSf+/XMQHD2tEsur/jA+kw08XAdFpjLXm5nzH7uhxLfTm6Ul52UnkmsDp+yneIwcGvOrX/wphD6w+/57MxY0DM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La2PrtiUTGYY3I87uPd0iCohvz5N9TnS6IpHG8441LU=;
 b=e6t4a3lED6YsSVD+Hu3BJNlJsM0my+oOV5+/LJ5cHPj1y254By8Y0J/nJ36gvf/FRMpdx5PCraBi+B24azmYuHqRWq21wprnnCshfyAalNkm1u/CIOdZoJDY6D7IahX7IGP95PF+Kdz2bpX2Vo86lv/cFPGJeX3hrllZSltl6equ99tFijAm1D7XoZy5HBJOYcv1hQSnBUv1lGhTZqWE+mnZCIt0tKVNwA7xtTksuEekxHto2gk17xhyhGNgmux+FV6aQa8hWQGHs9TUGCxdkEyzmTENY2/XZRaIzvTV7P3XPuqZkhml+x+loPvs1f28xgZND6CeD1diiMjedTAT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA3PR11MB9446.namprd11.prod.outlook.com (2603:10b6:208:582::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 11:41:22 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 11:41:21 +0000
Date: Thu, 23 Apr 2026 11:41:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 4/4] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <rjwaaqpfsk4lkjbvdm4d367phf4zevr5wk6h4nrbkz2koghscv@dq6hc624q2o3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
 <20260423105514.175870-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423105514.175870-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1PR07CA0228.eurprd07.prod.outlook.com
 (2603:10a6:802:58::31) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA3PR11MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 536e2a2e-3339-4cd5-c2d1-08dea12d3dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6LGQd8RtbhWvFSdJAke6uGnkwyjk+/oHQPJkoX3aoZmzts8KlhYw51bPz3dpye3WwiyS7moMM+1T8O7f4jqijDoIWnT9pOyv2087tOnW6FGDUV1GC7LDuILIcMMWQdpToCyDVK7Y3XlbXw1xvglJAJCIHwZx0O9H2qFFuOIUCbMeL1XfvcrFfZwoXHY8upemXhmRYXq4rrvtjubz1u5EExYgrfGy0IwZ8UwK7zQsy5f78/goXUlig56ke8MHhl3UzjR+JIU9XmAJSD5QKLLs5WgVn/UOuV0ujNhh+t69PcLVwojnMqOcj2hzJW8HxV3LuAxg5OL9YyK2Iidncp8jS3nAvRQopAl+TZ7fVY1t8uC6CPLHPUTh3hgpbLgq2uL1QKpSpUWXLsu+PfxmJHmfzmQwulUeoxKRyZSpWComnuZ5qIMQ3vB6D0BBdb+bKPPs6oKmhPm7X5t2Vp7V+nQekwkK7tJQzMxbjzLitY/UaX/AuLM/GZmHhrltSX+PG3QeJGbAP6G6NuaT9x6+yPA1cJcYs3l0Nfzrjx8us2GpVvw8lEljsrqwoPNoNENubjfiVFeF0Meu77jdCdWoLE3m/hiPzBeaTrbP7VB2Se/lclaWqcLXJMlFml35WO65EjKEg3Uuc5weAnpc18UJJP1s1Svhb05Yh63xWYt3qkxSkyxHHmVYPqL7VcShDU5Towg1/qtN8JnHGtwYfLLO7EnIbL13cJBlGEzLI49bftvj1mE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3pta3ZLNDh6eXI1RWQramM0dmlVdDRiSWtiRFhsZ1ZpdTJpMWhjUTNvaW8v?=
 =?utf-8?B?UEU1L1BJUmluQ3FKNG9ESzZLZTVOSDQ5NVo4WmRyRTcxa1dYUFJ0bERsRjVE?=
 =?utf-8?B?MzFSaWkvRnVCTWZYYkRRQVJEblR4T2tOMnY1V3BTbnR3K3NWc3N0K2dNV0JQ?=
 =?utf-8?B?OG4rYk85WWhJN3JubUFRWkZwbjkyWHhlSmZybFVpTG0xdXJudG9LaHhIb0lr?=
 =?utf-8?B?b1FOQ3IxbVFSVzJPNFdrcEYrTm5EeFFHVlQ5ZTNpNXZFbW53T0xWS2poaEw3?=
 =?utf-8?B?T2p1NjZWNmtRZVIvaXdFRmpwQW5SR1p4dFRrNDAzSVo3cytFZjlyTFJFODRR?=
 =?utf-8?B?bUJZQ0RBSTZjODNNbFRJT0VOUEY2WlFwRmIzNXlMdnhTTmlBM2YyanhIcGRT?=
 =?utf-8?B?WE5NcTZwWHlqMHBMUXdqYnBZUFFKN1gvQitYSFRHWnUxWWdXY3ZDUWRZT2RI?=
 =?utf-8?B?Q2l6QWIrbmQ1N1ltY0prZks5cThDMk9xUk5KbFdiUUR1M05DeE1kOWNpYmkr?=
 =?utf-8?B?Z0I2SDBVc3NRaWVFRnA0M0JHelZ4Y0VpVXVocXhBeWlxVzBReDlUQjMwUVdq?=
 =?utf-8?B?VWdSbGpxTVNiYWFLNUtYeDhpY1FpMmdzYnZ4L0JzaFlKYW9Ncml3a0RkQlpu?=
 =?utf-8?B?L01lclJ3cFVKWnluR1p1RFZkWlRWWE5RY1ZRUmIxenMvZ0p1YlpxTXlHOUQ0?=
 =?utf-8?B?dUtQM0IvZ3JTUDFLMkdvQ041akl2VmIySGRoNGNRb2NvRVQyVS81WkUzcFpY?=
 =?utf-8?B?dGVDL2tSQ1Q1SDc4cEI5MEYvRmc3djhwcWRYWUREUnFVbXdJeG5iekdHSk9w?=
 =?utf-8?B?VnRHNjFTaEZNMDlTcUQ4R2JhSzJ5K0YxZUJZV2pMSENOMHFmUWI0SlBPdjAy?=
 =?utf-8?B?blJDbHpHUjd2UXU4L3l6Z25qSWFhZWE2S0ZKZEpjdTc3bkxKcHR6OEpGZ05F?=
 =?utf-8?B?emUxQ3lnZVN4b2ZvOGRvMzU5WWUzVjhneFhVWk5LZFR0bE8ySnlCbllqalQz?=
 =?utf-8?B?WWRKRE9RSjRDZ3U0ajhVZE1maHNBZWRISUtmNW9oOXFIbHV1YThPTXdCc2VG?=
 =?utf-8?B?Nkx6RnUzRFlBUVk5aEh2ZUZKT2JpVmdydnk3cUQ0MlBWNE1JdmVDNGJVVmxF?=
 =?utf-8?B?dlcraGZuNjhCaXhCbTU1cGFSa0xsRWkxczRkL2dxdlZ1UTQ5UDFGNHYvdHJ5?=
 =?utf-8?B?b2ZmS2c4bnNERGJiUVlOTi84KzF6VXM4WTJZQmkvQTRxb0lCUllQZWU2R1A4?=
 =?utf-8?B?M1ZzNWdITS94bTRZSk9qMGxYTFk4S1NjdE9HckRqR0U2cW4wdE9rb3ZlWHZC?=
 =?utf-8?B?QlB2a1ovUXlJc1Z5bU5TUFMzeEc1bDZHL0N4ZE81Z3ZmbEdIdzlVQzIzajdW?=
 =?utf-8?B?eUR5MEZ0ZFR5L1NBZHZqdXYxWm9BVUhkTGhUS25qdzNtOGNzRzIwU01MRzdD?=
 =?utf-8?B?QWZEK1lYeHFDZC85QnhsOGpwdGIxRDU3M3hWd29XQkZicmwvSWc0OFNwd3VX?=
 =?utf-8?B?R3FvWEsrdmFDMEVlTEMrNVFGU1VQOGkxTGtFdWxwcHIzN3RaM3l1aERTUDQx?=
 =?utf-8?B?d0t1Q09SaTdUTWNEKzBqVmJvdFVUMmJ6aDUyd2xmWHhFT3lOTTRPSW94bzBk?=
 =?utf-8?B?dFNUSWxDUXFjWUpPaTFLbHQrMGxNaGh6YUM4RzJrekcrQ1FpeHNNRGJYV0Fo?=
 =?utf-8?B?K0VyYkJpNm9YalJCZkNoVGVTNGFtVk0vVnlFR3RzNk9oaTgvK3g5aDg1WG1t?=
 =?utf-8?B?Z3ZzeG4vVDloamlSV1RPaFFhdDU0aHcwaGNpWG5PVW14M2R0ZjhheTYzUWRh?=
 =?utf-8?B?WnZLdVIwRllwdlVkNFVzN2swTzFYb0QxUEg4QTQ5SU5xeFcxcDBHTEhWS0NK?=
 =?utf-8?B?UXBCd21PNXk2enh2RklmeFZlTm9xQ0NJOUtNUWhNTXJPUEVzVDFpeVNXMi9u?=
 =?utf-8?B?WXJRZzRDRHM3RmM5aFB2clpQeWtITFh0VElXV09IZ1NQOWsxa1ZhNEZsbWU1?=
 =?utf-8?B?K1pMdlpsVzNNMGZEMVFzaEFWS1ppV1lsQlpwQlhnWkk1dXFuTVpwMnMyMDBx?=
 =?utf-8?B?Q3ZxTGUxdSt3bDNWWVNoVDZYR1VHT3EvbHlHVFN1R0dWbW9nc2V3KzBoSjN5?=
 =?utf-8?B?aWs3TjJQQ3RiY09YT3NpNU1vamwxbTErdHprMWVUSkNOYUZQa0VrN2dCbllY?=
 =?utf-8?B?KzViZkdBNUQ5djQvN0Z3dVI4c0hkYytsLzFxNTE1dTdBTVJ4LzFKaXJJaUhr?=
 =?utf-8?B?eWJONmQ4cU12bDAyQU9FbnBTV0ZNZDB6NnhhMUFycjQrSCtRTGRWV055NXJm?=
 =?utf-8?B?ZFBaYWdQTnhDTThCakF2aFN2ZlkwZVY2UzNWcXJSVWJpRHIzM3RkbU5YUk9K?=
 =?utf-8?Q?aIDk/XlF49efHbnM=3D?=
X-Exchange-RoutingPolicyChecked: jq7NqScPT/8HmYSu3DJCnemqyOrLUQHLYDv1rxkxuRjYdTj5DTMhd30823UpWl3CB3a+I8sgaEVf+vG1hYCGZg/U6O4xlflatuzPmwgCMGF+iqgGhD45PWbpVsWMllvn+1hBqeDLGgSQ8l+KqYbxVEjim4KazW2+byqmx5TG23FTlULq8vyBj50yr0Jq+WdFs6R2WwHUDtJKFuTADla7oUXZZjOhHCorurFG38qmLrzV5Cv118O5tPWbL5SsDeVK9Q9us6J39u56d3QjSUx37/YdEg1eUua44tO/o2nrRb3jSbSN5xfD8Z+PlxKdr8t8CHhGiuD+oGo5X+wC4sW1Ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 536e2a2e-3339-4cd5-c2d1-08dea12d3dd0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:41:21.7371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4ThmCK2OeXl+Iq8L+PT2qxjjbRQWFw1EvUE38b6rNKSp4V+UFirXGSXzAQXtaRD9UuMMDldvtD9ZWl7B2LXIuLSdbVnzt+T6VY2zWN/k/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9446
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

On 2026-04-23 at 12:55:19 +0200, Zbigniew Kempczyński wrote:
> Add list of filenames which were created by hooks in attachments directory
> (like GuC log copy) to results.json for allow presenting it in CI.
> Absolute path to attachment directory was added to results.json
> as this is necessary to build full path to attachment file related to
> test/subtest name.
> 
> Due to lack of userdata pointer in nftw() implementation main json
> object is passed via temporary static variable. It shouldn't be the
> problem because results.json is created in single thread. This change
> is not too elegant but allows to minimize the code change and is
> much easier to read comparing to recursive readdir().
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: verify getcwd() doesn't fail (Krzysztof)
> ---

Thanks for considering my suggestions.
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
