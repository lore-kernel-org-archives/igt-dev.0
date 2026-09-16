Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED52C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15F10E330;
	Wed, 16 Sep 2026 11:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifUeD4Jr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9799810E330
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559094; x=1821095094;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mEMIDd9WqNlELQ3LtVmOcX9ONo3jV+TDUGO1DxO9RzY=;
 b=ifUeD4JrKvO6RB7WGw2618MnmcIJY5dzBwuiYuJ0V0dmO4cCU0shX/AU
 vQwak7zXHe744C2qZsH4QgOSomwl08dbkI9R9UF4QonL4H23xLLG0hvA5
 +cLpNg/Btx+6RSGLlFQuJ/YBjZoCP5Z7m9d3aEoEwU3nI5NdxDMldKVnN
 aQ40Zw4CWr3av+cuS8A4dHAtJ7vuV7xGjrMDO/hrJCW6rX+jyrJOkxch3
 wRHavRpUQO27gR8Yap6I7vYjeJALYzs8nRGdE6l2+2HvFkoMN75BFBWO8
 0gGuyezfHZDyL6uNNxUUAvDkk2BRbHyemvOvbz5nzyiHyklIGsKct8oD1 Q==;
X-CSE-ConnectionGUID: J2YKVb+5TFWcYZY6GqzTKg==
X-CSE-MsgGUID: Pp7pD6idRp+4/8QA07/uqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89872781"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89872781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:44:53 -0700
X-CSE-ConnectionGUID: iEkBbq44QTa4Xu+oTL3oQQ==
X-CSE-MsgGUID: MsfHgMI1RTiiyATvWSpUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296808498"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:44:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:44:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:44:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4Gmlnme8OSIHb6NpM4bKmnkUh00GYmfcPXXjPBsTqUVDPSxEOTrT54Dj4QnsfQVA+cc+MYZBTjU5nvhy0zp4dpfue1LauJAoRNQy+7oKRmGoW6bfdyn1qj8NiaXWJ9XzMvoncavG2X/VcMsCtDA+C/OjmJCwOp41vSpbcHsrJ03yr8Ud6fX1c0McNjCQjzsKPw/JgESsdKLTuWxkNfAhwbgzcihFRkxnbYBOV21ShbO+retFuLPNpvdKfJTXXi6o6wFeQbJqmDDhG9UADu5iCh8hh/0W1hyvYGEtNrED8Vu5tCCBH+PiqeofZB/PonB1hJnT5UPjBmxjp8u/gPqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH9apiWAsaT79L/hGMdaIF4DHe9d3jKYWtV7jN+KQY0=;
 b=Gg8mnfrz2rhy3hfW1+wVTNlBidJLh+PQSMfEwKaAGUkyRU7+jUd6BBCvlj6AVSOSUIHS/q3O0O85dfbsPjRssPGJfKw6iQRCKIiTs0pRuXyOZm2TfpThboL74eos6+3VadSJFktEtqWYpLyFDZrTe54R24XpgRSYNnmLXbe/xoftgElVlATg1nJ2dL/qJc67AP9gVDt9JZhjhlnkapWF6uqE3sc7VtY9B62v8NrWZHcLImLScpBfL4TljbusvvYrS1/RzkUOIZc5B08EWfNtTvSuvfnvZALUQkEuWd4L2zKIvL2Tpc/6ZvKT6oRqUGi8ZxhYSVLf8Bwzp0YJHrbLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA1PR11MB7342.namprd11.prod.outlook.com
 (2603:10b6:208:425::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 11:44:48 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:44:48 +0000
Message-ID: <ee8d4d20-83b5-4bff-84b0-160cf17a1c94@intel.com>
Date: Wed, 16 Sep 2026 13:44:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] Dockerfile: remove libproc packages
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
 <20260916111902.73626-2-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260916111902.73626-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a894216-9487-4c50-7633-08df13e7e937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: i6fEcUM7/rSSv50Etm6biUNw2LEeLCVTq3bb7wu+RhqWCzW+N6QV5GgdfdO/sv9AgZqydoQkmeqi7r1beZD0hbHdXH2D/febk1a7ShN1ZQ1f+r0nKiTm2hlpCAcNujfeuTE6CcekyISuqSDwOj0JlAhwqxWx659GtBDkVTBszjqwEUsi7oFqyNFhG5Iu/NH8JGu34iIkhUciWRloEuvlNmGecVX3ojA0rxP+G6OWuZo6P1jTxl38rjv7Q1yu8Kv2H66mnsaHTnuqzXZ0r5BhJkyHPeFyFyCfJr+FSyWYV7c9XClp5YKtSKsFB6x/JrEmX+XyHnd0MpJ+Nlv36kLQW+nZCpWo1P3yQc40HdNCyfgRXDUFRCgLLMLnvNTXPx5v9I0SkBf0Zo/oy+ZoedBxvO1BXJoG2Ojo8+P8JlZn1ZmlZEgZmIvyd0hI5ys1k+Qx/zAYpsO1j/jer97LJa9Cezj+D+vIdQuqvuzwZH5MPZtdqToXVb0DHfMqO2/qMl0kfRHXWPljnM4uA7eGYT8aPVldY+JGA6QgLsOttx91xrYyZSRQZ7m23ub6BGN7FloRksxXscxORWCK+NxNsZKkjlZ84yjIKbkymZ2iPD5VTRXT2OKHm9HL+B1UNJ0n4hi+BsBDPBZbqLkwG1YCCyfEMzlw29cZgQSW/wDrZ+FBdwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBMR3ZydHlNTGU1NjZFOFpGTEx0RkRsVWs4YWV6MjFFVnF0ZHlKUi9nemhw?=
 =?utf-8?B?VGdTU1BBSCtYQTRHZTQrQzhKaXhsc0Yrc2Z4QldZVTdySkxLQnJKTHZsaFp3?=
 =?utf-8?B?SkdBd2x1R3h0RzBMNzIwYVh4NUFWME83T1V0MVRWcFpqcEo5aDBhZ3ZEL0hl?=
 =?utf-8?B?bDdra0FXWUJJc1JuelBMcHlTR0pMWlN6cGxWOGlnb3AxdklXQm9Bc2tOWGRv?=
 =?utf-8?B?ZC9EY25lN2xhdnpML3EyWWVPTXVseFdPUXpyWk05K1JqOG1HMUtYeGdOZE1i?=
 =?utf-8?B?NGx6eGpaSktLNmhTdk5VbkphWU44bVV0VVhxc0t0NUNES3JsQkVZVGIvd2J6?=
 =?utf-8?B?bmJ3U0QwU0VJQks5dzFIdm0rM24rdzFSMmcvNEh5SW4xVEVCZ3QxdERram96?=
 =?utf-8?B?ZUhOUk5QSTBSU25mN0pGVVBLL054RVhoR29DVS9OUGtobC9YaUdpd1dsNlZa?=
 =?utf-8?B?U2pJaWtNbmVvTmtoTTNiU3J5VHpsOHBaUU4rbFMvbW45N0xwUE9HRGRheDM0?=
 =?utf-8?B?bWFSSWRjekIwN0hiRWlJVWpKMXBaOUp6a25tOWlQVGJCNWliVXpLbjJQc2tx?=
 =?utf-8?B?M3ZITlcwWnljWDMwcUR5VnpzUzBiN3dCT1pGS3ZIbncvZDFyVkUxRmhKaG5N?=
 =?utf-8?B?NU9sOXBxRjZvWHcybVZoWktlOStZbDhZajd6TU4vUkRkTFVXOG14WWRscFZI?=
 =?utf-8?B?YytWclBXbWlxYmtHU05vK3kwTDlHYWdtMUMwRVFNS2lIRlhtcHJFSWxXQ0kv?=
 =?utf-8?B?cVNYcHcvRlBsTzBXa0dSMFpxS0pDWHpSVHZmWUo4QjhFWTh6RGw5L1FwenV4?=
 =?utf-8?B?YlVBeURkL0oremNScWZWN1RDK1dQLzVCNHZUKzJzLytsbTcwN2d1UlNBRE8v?=
 =?utf-8?B?S0R2R0dOZ3RsQVNoSTRwWVVYNUphSzh2MjU0TkZRTXVQc2dvUEJ3MWxEZllp?=
 =?utf-8?B?VFJ5cmNvZk5HNXJGS0VKaE51V2hJZkFpdGhVNHRIQnp0UU9VRFhHVUdQd2Y3?=
 =?utf-8?B?dGYxMHB3VTJaeUFXMjdBM0dmaE1Wd2lvcnlqUTNJVlN1WHdidm9jb29OQTg3?=
 =?utf-8?B?MG9JU1owdTM5VkluRUw5M2lxWUdwMGdKZ1FuNHNxeVBHRWd4Y0VUeGhCUFlS?=
 =?utf-8?B?ZndYZG1RMmtUN0RGaStGdms1UWYrVDhFRUVFTXFDRElQZGZoRjV2YXQ4a1da?=
 =?utf-8?B?ZXNGR1RaSGZrYW5ETWg5MTNpTWZVUWJLYnF5Z29GWHFzMmJlQ2JjdXJZSFFY?=
 =?utf-8?B?VmQ5VkVrSVBaaFRDNVFmRDh0V2RCK2tkVGI5ZUZMSWxZNlBrd3c0dTRqeDhH?=
 =?utf-8?B?VFlQWC80TWNCZW9IOVF4eGRFZkVsYWZ5ajRBQUMyY2tXaUpNS1p1YkRUMFY3?=
 =?utf-8?B?M01kL21QUmdLNlpNV1FXU1Z4d0htVUZxMDdlQkJtREVHTXp0aklITThIcG5C?=
 =?utf-8?B?QlVwL1gya1M2WnFZajhxN3k3TE9lSmY5dVNwbXUvRzZwK2hUaVlJTjNRT2tM?=
 =?utf-8?B?UGR6Vi9waUdQaDVVY2FvcU02b0Jvdm1wcTdWNTVzamF0WlM2bE5ZSEZ4YWN3?=
 =?utf-8?B?UXdVQ3dscFczc21oZzBTbW1PeW9Bb3BvTjI1K20vY3VVOEduTlZWaCswMWVi?=
 =?utf-8?B?Wm92S3Bvdmx6N0lxaVg0bXp6RVhZb202UkkyOFNEdE5NUURpbXRIV0RseFBa?=
 =?utf-8?B?aWRPOGtNbTRKblRmVnMxSWZiWXl6V2NCamR0bldDckZvdE9BM0lWYlhYbER6?=
 =?utf-8?B?b1JjOHRSU1RLb1dPejFWUFh3RXphYUJ4dUVydVBOWTRuMmpHaGFFTS84VnFB?=
 =?utf-8?B?WVo5aWkwRXNwdWFkY1F3RUpabk56bEx3eGpYVUpyMnRwWUZUdGlwbm8weWRt?=
 =?utf-8?B?MVBwYjFwUEY3MTVjaEJtcXU1SW5NbEpUQVZnNXZ6SWdseVNVUk54d0lPYk9F?=
 =?utf-8?B?UUVSbjMxbDVNbk9zejZTZXFad0FUNnQyU2d0cGRJeWM1c0syNG9NSkwzajhH?=
 =?utf-8?B?SnNQVkdvdlBkNWIxMlJtTkVXTGdqQ3dUai9wR0pSNUErY2pwaVBLdVEvS2Y0?=
 =?utf-8?B?OHZGRGhnS1Z4OTcvTGhmdHByM0FqZVRiM1VKVkVuUGtUcnRhNzZwcWVGTDVn?=
 =?utf-8?B?OUpSWXduM2hhTDdsc1BNeEhFOUd1ZmNCMGxaeVZoVFBXdURZaFVMOXUxSk5x?=
 =?utf-8?B?V0NoempSWXJhZGNWaE95SHI4VjVVd0o1TXVqR3VHMnVCRGs1V2NwYllHdGsx?=
 =?utf-8?B?QUFIUStsbDBQd0FnamEwOHNSd1l1Q05vRnZXVUE0NlltY2VPTnJPZW9zcnNY?=
 =?utf-8?B?T2IxbS9sbTNjSklOWXQ0SzVIa2FWYURtaWRkT1NCb1gzR0puMDd6Zz09?=
X-Exchange-RoutingPolicyChecked: Do2L6jqfS8UXjlpHCWEfrEksi/3cK0C812oKT97fZ8rrwaCLtR5KNWpjVSVzRkIHFwJQkWSLjGc9PnrmZpEincDAWYI4MevIzo2T6ayY110jimPTNxaJGNMpJ/UbFUyB7NsgxU0Xf0LzNWjTo5HI/1tZ7HA/Tm2XaeIxOFZMlQo+MUvt0p43bnhR/jKFj1Vys9+wwi56DwZla40WMwGGAkSHBDiCsiTR5/RCkS+6445Hi6ejJuQX+u04jwzOVEpZGZh+31jk+//n1ihqU1BQZ94ntpORuvoOrnA7ifBxuOsMM6biOd4bEBof+1mXUijQFAiWf8k19xBFoQumpA59pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a894216-9487-4c50-7633-08df13e7e937
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:44:48.5193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iBsIGX3DCRcg25BGn/3LTcrP7DSyh7V/qVSVhHEHWRzmRlpm1cdyHVLg3HKrBDUEltkFQOy9zmyVYAKwfNsjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

W dniu 16.09.2026 o 13:19, Kamil Konieczny pisze:
> Since commit 88bd72575499 ("lib: replace libprocps/libproc2
> with /proc-based process enumeration") there is no need for
> linking these libs, so remove them from dockerfiles.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
