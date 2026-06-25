Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A6CDB466
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 06:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C5B10E502;
	Thu, 25 Jun 2026 06:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USwpdiFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852810E502
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782367922; x=1813903922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a+jA+oqc0LhLBElUZPcTJMAHDWMnLfbcaSCOE8jgaWg=;
 b=USwpdiFvlBpbzE2m8/IQfPpuAoBRSxEUkwlZgpM1tqgq3GhPBUDwYBT/
 UD5bs16suRsBpwMiRkL4YK48Iq/8x19C0Se74kC2dqWUEmst4ojfP4IRw
 l6kLqX8XVii4vVOE7cUohMqJu89m8OEvZJvMf3e3j/4EkvZnQ8a9d2sOV
 cT5cRcSIlT9xaYVREn6qCehkYpFOgpt6TmVBSyzUJ08bXF4ULace2RdAj
 zuyN0P0FFi498T+mZzCZXLcJsHm/kaHGJ3YhvuLc/TWS6mZhsaQW3ljSi
 neQri0yvWBk21bOJtNh8BdlW8U99hrJHWYTlvlSXCa2V56LiXIobZ+5xs w==;
X-CSE-ConnectionGUID: V8OxMt4vSfCE02erXNfSIw==
X-CSE-MsgGUID: leXb9c3qSOqJvSopBLB18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93496009"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93496009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 23:12:02 -0700
X-CSE-ConnectionGUID: s2xfdMg4SAe2LdVUrcoFnw==
X-CSE-MsgGUID: R4wn1RuhR1ymSZSNBnWoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="246003100"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 23:12:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 23:12:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 23:12:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 23:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKNHAP7OyJ3CnQ3cLY0LE8nISdbKYVTmlFWEjqGxWZaINNvRsYUe+aH7FRbBmfnfgEdEm+7M4SH8UrkEDlGOEgQ6jD1/Wo/zihQoEINq3tmLcFMpnrrB9ApIx52hASvP+cuYLFPWlsLczMyTwlBxMt22+PkSpT0RCue6bOlSHuY5gXZj1nhcl5WlFRjrCJma8swRxA60zGNWx8O8I/+5xWP0KbLeMU0WHClnXqt95D1D00t/BAKZM59U9f26lpQhMoen8+G7frKO8KCHOcoOY3Bh8O99TL4lOtqPVjdWTgMvOwzr1Snnma0XnuH3zyRkveeFkjFnmxV79NjHi9vN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDVBvvP3cveJs0EbhC+nmqL70yr2dNka8hb+8pKmrcI=;
 b=b45k8+2hNcq9OUxSwFfTLEMB8Y5nRuSAu+PhH/5SOpzjMKwd3EF6M3Ho0ycz/+l1Kx3OWahIIqQYzkHMrUMxxGi8o9aQ/BeSkAhoZUEK/ViTp4iSzG9iwJ9xnmbGR0BfeCpS7CckL0QNWxoOBKuQg6MlayxnAhN4uz9QEPYJZahhOblq+7diN3uen3gh4ZHLWXtfCgudWqKELgR8EqC1VoadJl6L5pNJT2mIh6j/Obz5SdQgGuFDMvQQ9jl3GH9JSWPH0oQQ5MzozT1HjMNLFgyGIzXlO2G+voUu/WX9NzLBisngweDl25zSpVyurDca7Sx4iPz0jibqih4wuVn9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Thu, 25 Jun 2026 06:11:51 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 06:11:51 +0000
Date: Thu, 25 Jun 2026 06:11:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 01/25] tools: igt_stats: drop libigt.so, link
 against minimal sub-libraries
Message-ID: <h6ce4epe7nlp4h7o4ymgc3pacsmtqgb767cqz57j4uby6f2mdc@t2ntumzcf4pp>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <52667b0eb09ef029258fc33124a4faf74af21f90.1782288071.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <52667b0eb09ef029258fc33124a4faf74af21f90.1782288071.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU6P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: cd956f75-36a7-49d5-0956-08ded280a5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TItwyBo0dai6ctAdEHcL7uxial8t3+1JNTNzuPWdT6bNsVMktH47dp3zzjgu+28lL4KXwg3k1RC8uwMIjuwwR7C16E3V/bpOx23yZ39MhT9ddAf4EHuAVzsWqK/JJxEE8XDtJ070ToPv20qKVz45rIA6wM2tuQrPozjgwjseRSCCl1V/OBK5cu+f6yXAuUDWy5YKmqHaWOE7e3HwORH3zRqfiWHVIh41eAtMNWmfQ8/Zvm3N9ENq49Ru+TgaaQHWHmhjvYwhMd4sP/hmIHSzVkW5J0xLGEjhTmW4VfToMljhwxBcVKNvZqiDjLuGtuwFxGIUo/kHktALoO9CfzU8iFkoYFJ6yZSsfipC7YS9ZxVmc8VbISerD0H8P4+TqTmZTtgo5NhRCNDnwEQRMZmU5QpCkDZjgIEVk97+bZuLw65zwwRLY0lvEq/DjU27rOPR9OqT0me0TqnSzdogdI5vLzq8g5EtpHSmAuzC26rUt09lK21+ku/x3/k2Im02XuVDkx63sQz9V8ijrxGMSLstt4xJ1t45V3BUWLY5vmMa2srhb1+ZWIT5wAS4mh7LHc/ib242UWy8Y1kKdCtaabm7TpeUvSHib/ppd6QCWOgBznsS+mLuO4aA1vFGFf4QInyQH9UlwRvRK3T7y3PDQkjRvZ7mmJvJNmmqufu1ZD+9mnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJRaEI5T3k1OE5lN3VTYUxERmVtVzdEM1VDNEVMYUtqdTZFTlVFdUR3bkFS?=
 =?utf-8?B?VVFBY2pjajlVaG9hS0RmK2pGNTVNYWZUYmFkNGFoQmZ6NlNSbUpINXU1RW1q?=
 =?utf-8?B?TWw5TW5XOVJRMTV0cWtScG91cFN2MTh3TDdOM0QvbVByc1hFM1doWmtDakc3?=
 =?utf-8?B?eVFzS2dmYzIwUm9iV0pzVlYvTGZSam5oREtWVWo3ckZydEp0ZnJ4WFFrQnY2?=
 =?utf-8?B?QVJEUkFYODFFdktzVFhPKzhTbnhyM2szVzVrYnNsVnNxaTk2Q294dXlEN0VZ?=
 =?utf-8?B?YmVnNjZya1FDZWRpL2t0WjU2aGNjSm81Vm01d0R4aS9vVWcvWkZQVjNLVGtL?=
 =?utf-8?B?Z3pGdGUrZEZxbjloWC9GU1dyNGs3RDBuUENDMlZROHVqdWF6cUFVZ3RCUUkw?=
 =?utf-8?B?dFcxZ2xUMkJzY2lNb29lOFhtTjliSUYrZ3A5dzNqdC8wUzdJak9KeGtZUXJh?=
 =?utf-8?B?TGljY0NGM1R0KzAycnV4c2VZdFZwVFBtT2dDZlJBTEU0cXc0em16Wlp6YThx?=
 =?utf-8?B?YmZUNlJ4dXQ0OExBUUlDdU1oQllQeGhxSFdla0kwclNsbCt0L0YzNVpvYzhY?=
 =?utf-8?B?T05iYUNlaXBjTldoREJYNk9mVEN0ZnNBSzBHSlpXeWtGdmFCemRrbEVUYTlq?=
 =?utf-8?B?dldDNGhxMzhUNHUwVWhwVjJGNTM3ekFtdURGTkY4bVFhTzdocHlabHFhZEZZ?=
 =?utf-8?B?cjlrSHRyc1drTTFUTU1IZTVMVTJ3WEdwcVo1L1lodU9hMHBibGt1VWZwSm9U?=
 =?utf-8?B?Qm1YeFh6WG11a0FIL3hqWUphdVZtN3NEQnlWbnlsbjBIdElvMTNBZ0orSDJu?=
 =?utf-8?B?cGxBdzAybzJ1cWVadlZMZ3ArNjE5dUE4anI5em1XMC9pSVdGZ0xVVWtsYkNw?=
 =?utf-8?B?L0ZkSEJxcUJ2VGdtNmkzM1VrdUViZmdqeHBrK2MxQ3UyRzRydldVbjEzYngr?=
 =?utf-8?B?M0IvZE14VE96Ulp2bHY5OGpPMm52dU9aQm01Z1F3N0JabjZFUlhqTllZeW52?=
 =?utf-8?B?ZWtLVG1HOGNhbkRSeE1vTmJjWk5EaUVGbHRSbEpGTHYvQ0F5TlhLVkM5d2NQ?=
 =?utf-8?B?N1N4TlE1V2Y0ME04QTJYL2hhWDZaMmtDd25GS3J4d3E2bDBwVTRTWWpZWDYx?=
 =?utf-8?B?RFpKOVZxS3BwbFdrSEJyQVpsbGU1VEZFODk2ZGZMbmhObjRCVXNLL1BCbFZP?=
 =?utf-8?B?enF1S2xEbkgyTFNTMXkzVUVEeDhDNERGMkd4ZDRncXlod2NLNUdQVjA4Y1ND?=
 =?utf-8?B?cVBjcnBYMm5LbFh3cDV5M1BucmF4TmlvNElKdGpzK3FPR1JPRnk3c3F5ajVt?=
 =?utf-8?B?WGYzeUVwd3BzT3IybzdvYjJYUWpuMzcyRHRETkxsRlZiRHV1anJETTNUeFpR?=
 =?utf-8?B?U1lGbjBscVRQM09lYjQxNFNnL1daN1Z4NXdiVjRoWlJ1eWNrUk5WZnlsMk82?=
 =?utf-8?B?WmxQZHIza0VTSHJPZlBnNWlYWVV3MTVNZjg3aU55MllZVWVBbzV5aUlNRyta?=
 =?utf-8?B?WVd3cGsvWWsxMEpnd2VSeXkvUmprSk5Bb1dvWW04NFowTHRNU3IrTmpPNUdU?=
 =?utf-8?B?S0E2WUFzVy9RNXVhREg4Znc3NVlzejZPVlNlSjM5WC9qWlhEQ21aWlZSUXow?=
 =?utf-8?B?SjBKZlhGZElQYWFCc20vNnNZdXhFcnNpblhIamJSVTBQaS9EMHFXNmtIcHJ6?=
 =?utf-8?B?aUU2S0lPME1FL1ZZTTFQa0Jqd3ZZYy9udDYxb1d4M0d3R3crQm1WVi92YXYy?=
 =?utf-8?B?dkFMU0dnT3kyZ3RIVlk3T1RaU2VHQUR5d0tXcXN5QWQ0OTZNckJmb0J5L1FT?=
 =?utf-8?B?c0dYcHkzZGwvMXppWkliNHFSOTlKVmpYc3JmaDhNamRXcVc3RllEdE42MWRD?=
 =?utf-8?B?OEdYWHkwTXNVVWdiWlgzUjFEZ1ZwT3ZNZHA3RTVqT2poSEMzUW9vVXprUUNo?=
 =?utf-8?B?TTBKRVU3eXo1WkNaNFNFLzNlcjEyblRaODZxSzV3R3pYajhlTkw5UWgxUGNH?=
 =?utf-8?B?eWxTM29KMGZWMXE2ays3dnA1OHU5WnlNb1JicVk2TGpXRzNGdC9SRy9JUnRl?=
 =?utf-8?B?b2phNjg3SWc4cjVOZnJTWUFLSXJ3dHZ0TE1oME9Kd3dkVVdjM1Rad2RDM21V?=
 =?utf-8?B?RkdxcGs5cnloL2xwa1BnZHZUb0hSVXZHUFVBbk8wOUkrR2ZVZSt3dzdBb0tS?=
 =?utf-8?B?S09qNnFnYzVhbW40ZlJvM20xdThUVXp6OXdsL05waUVoZlBCQ0dYbTlDZ0Fu?=
 =?utf-8?B?Ky9UVUhEVEsrYnFBTm1qcExnRXJwcU1xc1ExcUZENEtRUVRVSFgrREJiQVpD?=
 =?utf-8?B?SUh5dUEwQURTSnFLVW5zSzhkZ3UwTzJ0RGo1cHVVRWRuSy9Qc25rN3ZCQzlr?=
 =?utf-8?Q?YeYjFiKD5i5qQg+M=3D?=
X-Exchange-RoutingPolicyChecked: ISZRzbPq9CftRIaS5booM0y72KsUH/nPLnIxY1NorCSJ+JT0CZ8FtNTuG7DKwd4z/cLPWS3HZEvW1TFSycMyM1BPedoXJGjFdm/O6Pcc8OdwSRwpFYLxwWPjLMHkv1OU8JWSeelVKK3nzHFtN6YlSBYvf7A6eCnBeHsdIaggJEE+/ltTZXjinaKZB6AoRDyX1IHWESPZTXzJeBK9uHqI8/HiNmuaL8ypgtWfuCvevS1QRVJ/QmTR7ewZVK8+0XyT/x6fUvyvH5u0m7L+rBvE2ri6qTOZYvA2kJ6pNbJ1MQPKmEdg4ml2i2OHg6hrB/emaL2xjhTh8+CBHluzylBiQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd956f75-36a7-49d5-0956-08ded280a5e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:11:51.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHPVep98xdQ63bHzATcE8wy4z8DgrCWDMTXXLl0qhM9/bmq88zHTkM0nOzIueS30Bv5dND6ire9gE4RjqxDSmy9w9GTwF169fLWHd6wte7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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

Hi Sebastian,

The patch works as advertised, but Ashutosh had some qualms
about the series, so I'll refrain from giving my r-bs for now.
I too have some suggestions down below.

On 2026-06-24 at 10:47:08 +0200, Sebastian Brzezinka wrote:
> igt_stats only needs the statistics helpers and a small assert stub.
> Link it against lib_igt_stats and lib_igt_tools_stub instead of the
> full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/meson.build   | 14 ++++++++++++++
>  tools/meson.build |  6 +++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index f25ecd8b2..96903d06f 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -389,6 +389,20 @@ lib_igt_profiling_build = static_library('igt_profiling',
>  lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
>  				        include_directories : inc)
>  
> +lib_igt_tools_stub_build = static_library('igt_tools_stub',
> +	['igt_tools_stub.c'],
> +	include_directories : inc)
> +
> +lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> +					include_directories : inc)
> +
I think this change deserves its own patch. Stub dependency is
used accross this series, so pleade do not obscure it here, as
a part of igt_stats dedicated change.

Another thing: I'd find reading this series easier if you
bunched together all the patches using stub dependency.

-- 
Best Regards,
Krzysztof
