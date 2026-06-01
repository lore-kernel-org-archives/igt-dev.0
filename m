Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78345CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 06:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F070112DFC;
	Mon,  1 Jun 2026 06:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPIIRbZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E97112DF8;
 Mon,  1 Jun 2026 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780293950; x=1811829950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aXMl+Y6/9V8N9GMKma9lidIwxoHQTYws0fWlvrgxVE0=;
 b=mPIIRbZfP/QhwJDgg61Gin8Vnaf6AruYIEW4qwU7kqzhTfWOZbh6A2cF
 KocdMNz7gvVNZTIeo+yGMSbxAER8HbqgFBxWnry9pikB0NtVlXs3EzrNk
 btQSm2PtVLNS1b8ERxkX+rRci5JywqIgz6zp2QJxE20ENDK/61CEXkj7V
 3wros2/V2CyIxrI4Pm8aUcBF7QYifH/LRNDvHhZHkD/Y317AAaw9aIro7
 HdHglVg8RqkvKXQh1wQVM7CWgxdlccgp/y46QwvuGoAojDMGzMC1b/H9s
 D/i8Rbwpj+6uW863qvW3cmBXm2abJr9IXfkgRxw/1vrzaad6Gx9rx8db+ w==;
X-CSE-ConnectionGUID: MVADn1BLQF2p4oSJ1/ioTg==
X-CSE-MsgGUID: QFxMEkS7TImCWf/eX2LpmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92517950"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="92517950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:05:49 -0700
X-CSE-ConnectionGUID: Sm8dUnXvRhyrLDORKNqa3w==
X-CSE-MsgGUID: VeHm9sDVTuecghv/hQUnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243314668"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:05:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:05:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 23:05:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:05:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdiSPdgZDDMy6twzIibBWQYSUjQouCQCosS3Q2IDfbAD8ZDLyeV+jXF/xKdpIrgzCItcbv97ETgAfqj5h0BUYohyUQq0Roue2WNhhVv0h/dyh6udwxCb/wx3beJL1fu+V1MPapeHHxeULRIIiwwaRLJX+tfAbE02gkLeDq9kE2XgD+AhVJY73N/l4kJ8yoA4kJn2AckcU5pgvkeIdimsQR8TKACXsUUEUsVonnPc0BrbF1PJXBCUK60KuRN6sfU8QJVDBahSEsjqQdjW5YWj6J1PuEnL+uOk7hccAFLz/MH65rNrVBGuo0uPIefY84m8ckaFgNWzfMTuSwMDSxFsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2t59KM9pnoBrQIZ03nVZg/lRuPzzi+dtT9qYvrru9g=;
 b=WSD+EkSFkR47Ni1sy3ate/U8Flfkf7kY6Ly+UDVGoqBQtIqvesyJbwcmVWnGpJzzqyak+G/Icp3I5RFARMwfbNHq/tZ+tfwVDWhJrcHWfglbbZYN+aVkfLrBHvW7KvL/8p3XoWlAN/FW92mZRUF4PI9jKvhTtZiRy4N99qKQXL5VM/lfo4GZA2HXSBMvEEx9Gh6RdCeswdwfCHiZWP+Sd2OHAki+6pMwpnFUgpB5zG3S4o3qFrz+4NB/a6EtvohEGyjQ4nKRO+GFJ/YBpq6PWHP0EECPMJTNxliAk5HXeleIW+KOj/mol/2Goo9Opnn13uzKDIk2pEIv2+CIMqtFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ5PPFD25B21260.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::856) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:05:45 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:05:45 +0000
Date: Mon, 1 Jun 2026 06:05:36 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/intel: Add current IGT PID to driver options (rev2)
Message-ID: <tazafuilaplwood4mdj4gmsi5ud4bjdkt4ytweoexgjdpj6muw@j5oqu2mpgtvv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260528055957.2876648-1-krzysztof.karas@intel.com>
 <177995357890.18859.1480501669058177395@6beec6c84f66>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177995357890.18859.1480501669058177395@6beec6c84f66>
X-ClientProxiedBy: DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ5PPFD25B21260:EE_
X-MS-Office365-Filtering-Correlation-Id: c707f2e9-9888-49e5-8c6b-08debfa3d176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|5023799004|11063799006|56012099006|4143699003|22082099003|18002099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info: TT137LKsPf7j2aQVqE5yaX8RHmxQ0tDKWQtTtksHINlFKuMIqSb/q0mm1Q/IAMyz14PPiQEXlUxOvwjM2MOTaQ9idzq6yM3brxh3uNBV+eiwYQ4CjjBOGHLco/sJihIL8cVJlG7ne+SYjnqVLtF7v+wJUk8hLYlsHS5CssqNwr70FyqFUtpo4cTUTVfwlwFhwfTpfEjNUZs/e0Z6e3WvLe+3ZYAKdCCaJhVTdnJiU1O12Aj+JOBsaNpvf6yNU3s1opybMkD3CtzlMQuCWrnl8qV6O2Fx80F5IIINgC0jQBH0Ox+oXIpiyt52KEo0xzTXYB96DO4Of4tS1DPMVlnM1fiRIgFC3GT1WWlZhsTNI78CRXATr1jOQz5H6BAvJKZDAiB3nzm0gRzfFPpoB4Y7+ZzMogguwBS3OAdSBEjVt2t8K1iUGxEoVbTpb+pj+bgksL15Y2peHd5itKDYo8nnvqZRo7WNg1mD7xzTqTofB5Px5qLj5NC6SOqkHKGwewRwxTJj9QblkcEusbNpDtiwpKBQxbhqIX5uOHFXVhC86S0Z/rd1DYA2++vboHmarD+dPlfFxIz1e4iyz1KtSpr9mVLD43tcwGmyx15d8N+r8XeLAWcgNcUj0YoLd5fxebNkxdJREQFjCnUZVmn0qOnPFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(5023799004)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(13003099007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENSWCtxSlZRcVhEZ1Avb3pTQ0hUVk1PUjgrT2pVa255TkMxZUV3Tk11VTR4?=
 =?utf-8?B?VzM0NzJOQlVsSUpZTEtPVjVyRFhlL1VJQWd3RVBVWWI3OHRaQ3dpVW9wQXRV?=
 =?utf-8?B?ZkFRVFA2ZmtYT0xraEpXMndtd3VMMnExcjVaNEVSQThjdFRtRUVaWjZPeWt1?=
 =?utf-8?B?NGpKTEVaWWtKd1B3OUdmN1JBMDhWam5uYjAxRFdRSWZPZENPVDNYZWFjK281?=
 =?utf-8?B?eUpFSTVjd1ZCODhBbTlrQTlTTTJHYWJkUTJVTGZBTXFlTWZxR2k1R0c1blph?=
 =?utf-8?B?TTJvWEczSXVzVHFVSVJNSWl6S2gzc3VaMnhvY2RuYURiRi96Zi9FRnpNUHVt?=
 =?utf-8?B?VEcvV01oamFvZytvUlZlUG5EZkxkeTI3UkpSbGcwZWJ0Wjk1SFI1NDB6NTJD?=
 =?utf-8?B?enp6VGpubm03eWRZMTI3MUJDRGp4bTIzaGxxSStyZXp0MEoyU3Q1OUcvZWpD?=
 =?utf-8?B?Y1Y1Tll2ZDFyZms2ckJwejZHaERDaWtvQ1NUeW9zbmNOVjJWSWhmdzY3VUln?=
 =?utf-8?B?eVdVK2hjVTliN3RzK3hWNFFnVHNSREZoQUR1QUNTbHJJcGd6NEUzZStLRHl1?=
 =?utf-8?B?MEs0MHVaNHdhYjNVa1owMWpwd3pDV0NhcG1CdzRaYklpNkMyMmhrM1VLOEF5?=
 =?utf-8?B?M2R3L2diazZra2FXUDQvZzduQnN4TlNBcTYzYnpQRUloNVRnendHRnZ3YzhB?=
 =?utf-8?B?Zjl2R1UwNktncU13c3BCY1NXUlByZWMyeW55Yk0waDJMdktLdEtPZWZsQWtz?=
 =?utf-8?B?N3hoRFRGYm1MWlJ5MExNVUo2YWJpcUkzbldoNnJMczVKNS9sdmlWbEFKSm5r?=
 =?utf-8?B?UEZkWjBUWnhjRUNiRURmOWJ3MUdlYzBITjVnOTFBVWNRcEJMK1dpWUNiZVdB?=
 =?utf-8?B?dGdqS2F3OEsvUkVXZ1lNdEVXdUY3K0wrM2ltRWV1cWVkZFFXZGpRTXJjQ2I2?=
 =?utf-8?B?ais5WnFiekFvaEFDdVFuemZaQmFCc2VLZkV3dDB3MmxyQ1F6NXI1eHBLN2Vm?=
 =?utf-8?B?ME1paFJheDlSMlc2WEdIbTR1TitRcG1NKzBjVUVpVmtsSmFoUSt5dmZZSGJu?=
 =?utf-8?B?Zk5YSnhQemdIeDIyc1BUNUpCRzVwbVdxVHZ2VDFPVU0vc0ZweVFBVHRCNXNw?=
 =?utf-8?B?eE42YWF5TThyMENaOVNtNysySHZRelplRkZ0dkQxd1AxMkNBczdEL29seVZQ?=
 =?utf-8?B?QWJ5L0tORG1XbDlYTjQxejJZbzBSRDJRb3h5aGdzR2FJeHpjRW0rMEY0TmtH?=
 =?utf-8?B?a01OZUpJdnZmWklGOUozcHAxTVZhTDBYdlkrcHhrcUk4RkZLWWFJNFZCTUFk?=
 =?utf-8?B?Q1pnaG9ZaXNYdzVIb1N5dmhaYVVoSzE5Sjc1M1I5M2ppODlEZCtadmpIQklG?=
 =?utf-8?B?MTFuNGFURVVYUitJSTlaWUlrcFEwUldDajRjbmJWUmxSTTBWYVNVWnJaUkdi?=
 =?utf-8?B?Q2tDZUloZUdoT0tCMDMwRU4xVERLMlAvWEFrY0pMTFFpdTlIRExvRlB2S0J6?=
 =?utf-8?B?STZYZmJ1TVdHTVJSS2RMV3Qybjd1Zm93ZnE0ZGtIbU1aUVZ3enJoTllqTXNw?=
 =?utf-8?B?c0JqRm9VSDI5ZDFKSHRJYXNPakxmKzQ0S3RYbzdER09JM1lFNkJQSGlyUlZB?=
 =?utf-8?B?dGZxWGhDb1lpTVdvY2p0bXVzTUhKSmZDRnQ2Ylo1RjhIQ09HangzbzRoQ3Ju?=
 =?utf-8?B?T1kxSmQ2RjRBUFFlNlNWV2E2d3hmSEU0VXJmRWZ1YllndkdMRGMrdUZWVzVa?=
 =?utf-8?B?Yk90TU4wQ2dTYS9vSHZULzRFWnc2dHZHeWNIbFByK0hEelpCSEhCTzVzOW8r?=
 =?utf-8?B?SWNtZmpqd3ppdDlYZlVUZ2xkQm04cjRZaE9JdzRzN2Z6dUhzM3pjeUxnODRu?=
 =?utf-8?B?bU52M0p0bUY5b2pKdWVoYTlkYmlwR3M5WHlaSWVGYmdvU2V5clViQWVkWVF2?=
 =?utf-8?B?ZWlUcGRGTmt0TGRBL1NkZHFRaGMvK3NjeDIvZklBU0hKcitmamNoa1d2WnFK?=
 =?utf-8?B?UEVhTnM0SVZmeEVXUmEybjZ2VlNxK3ZKd0taalJmSnFJUXN5ZEVkcEhsOE9j?=
 =?utf-8?B?WDZvN1BkTUJ6RGVpTWdSbkRjMysxaFBaL0pmTXZNS0lwSUZQZm01QmMxRkZR?=
 =?utf-8?B?TTBYUCtpRWdxZ1NSc3NMSWR2NjNHS0pleFdFVytMR3VESnJuUEVBWktVM0Fs?=
 =?utf-8?B?S0xibkd0VkpnSDZ0ME41N2pyNE9BYmhpMWFCSGJaODBQaEEvWXM4UzV2Skk1?=
 =?utf-8?B?Qmo4S0JobkJZQlZnaTFhWEJXUitjc1N2bGZzd1ZuVEZqUmtiYVh5bnVKdHJT?=
 =?utf-8?B?cXdyR245dGlhSDcxcWRMRlVoZFlJOHMvTjgya2V5bkNpMUZ6cjJoUE0wNnBG?=
 =?utf-8?Q?iUiCxNgGoZQCBo5c=3D?=
X-Exchange-RoutingPolicyChecked: qGQHmfa/G+CcS5TvUsU3Wx0+3ShrzMzt7vP5WilgWl9qFxU7hpZQawcez5+Ja4pt8x753TQKqVMhU/Gp99y+sgpqVSQeUi6oYeRYg3vwrUHlAE+vGTnShZdpYJFuq733xRRIcGQkcLQa4OPSjQczJiCdLgnLtu1lcs5q1pJAECkAlu9JB7fLSD3Gd2Q2sPVN0t+0l8K2qaHGQL04vwsilum2GFOnGOkfl6/9uAVpuezhVJLKUvW/rPqTvhAcrR9aro8qcIJNGIHXSnfX96jyHshaQv5BdcKvS+oK5Z5QWbHp2vuFa6I7Dhlgkoalme9iF+tbOZS72IGvqh7W3Ly3eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c707f2e9-9888-49e5-8c6b-08debfa3d176
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:05:44.9128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4roErAKUeQgnnhrKHmZer6eM40S21UQZWr1NVQx0AgQpaPNrrDHgkF0vzfonkkvAtzZ2jd52AYzXiafctDzPiw2LAeLeFs93Ia/foWKc0c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD25B21260
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

Hi CI Infra Team,

below failures are unrelated to the patch. The changes I made
do not affect core_hotunplug test in any way.

On 2026-05-28 at 07:32:58 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel: Add current IGT PID to driver options (rev2)
> URL   : https://patchwork.freedesktop.org/series/164075/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8939 -> IGTPW_15268
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15268 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15268, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15268:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-kbl-8809g:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15268 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@dmabuf@all-tests:
>     - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#15931])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@dmabuf@all-tests.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic@basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][5] ([i915#15656])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@gem_tiled_pread_basic@basic.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][6] ([i915#7707]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#4103]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#3840])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-6:         NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#5354])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#3555])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#3291]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adls-6/igt@prime_vgem@basic-fence-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-adlp-6:         [DMESG-WARN][14] ([i915#15673]) -> [PASS][15] +78 other tests pass
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
>   [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
>   [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8939 -> IGTPW_15268
>   * Linux: CI_DRM_18562 -> CI_DRM_18564
> 
>   CI-20190529: 20190529
>   CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_18564: 835c2bc37bdaa05618c1b73792d06676d5ca3218 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15268: 692bc768a0972deecf5ca89a8168dceb2008e10e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8939: 8939
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15268/index.html

-- 
Best Regards,
Krzysztof
