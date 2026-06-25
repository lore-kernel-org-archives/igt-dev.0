Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D76CDE002
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 07:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F4810E4B6;
	Thu, 25 Jun 2026 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/FklZUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5A610E4B6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782374207; x=1813910207;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6mYteLKKGOFxWt7PqEHTpK7eNuj6uMif6bAv4UhOXGk=;
 b=L/FklZUZVDJr/2bKG+HaYXjDfSy+qLvFA0oXtU/2cBHKDEpPGCPTsOHI
 CcGPInLNKmCFSFSzM6SPd21iBUi4G8t8Y0hJ7Ekq5rEeCKjdzi0WxFetl
 UAMQnDMcZfuNAGB8d+ZDJnE4236l453+zwCehm4NBT7edy63UZ8z7ufNE
 7y7nZH4+FznLtODrrJoOUkdwvJxWpINKOdSr9E8B2xWLaLrwGo4dyqrgd
 x6IR1Hp2xtkIySZbLmAkX/NBsPCo0RAGn23H/f+xTYbmyaPsNXcl75ljp
 R4EwqlsoBeJGlBoVjZyCCXWKzyDLEplKZch5ZgObkgS2T60m3Vxxc1Bm4 w==;
X-CSE-ConnectionGUID: x/nHW5RzSC2+BxuWi5VHlw==
X-CSE-MsgGUID: MYJZSTK8QSeWqIGT9fXRjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93748748"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="93748748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 00:56:47 -0700
X-CSE-ConnectionGUID: DGXXlRuLTduQzTJZuRN87A==
X-CSE-MsgGUID: 1uh64MuwTVSfhUAXIHF2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249442918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 00:56:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 00:56:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 00:56:45 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 00:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPjWDV00tHnUovylUDOKy/h7Ipf7Z2Yr0XLVB7KOTP5O+HN1nXCvc1qXf96n+HCSyqhjRpwnc9knylMSF/tiLyHxlKmiQ9EzQlHQd97yo2o0Vpayya7qXKkS6AsCtsTHeB7+3rpp3MfArBKUOH24p5TiX4pzp5dqC6xXNCntbNaNBZcktSq9A1wRsWfM21gvjs/p7CSPrizD0lhr6wTyQUPSbUxHgcSZBfK9ou17r/yxmgAlVtTD2+Bnkf3NHj/GK5uq7W/MoRTeHXxXnzntMI9Sh8DHP7gUcl8VP2nvlElulnR2K83fLlawsN0wj2/fpboZaUx40oqU/HwLdWnsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGrD0hODWRj7sIviY44F7tWO1XZesWkivu5K1+EG9nA=;
 b=ueGc3qD2rPMGy+q2ebTT1JRHvWdnlL7uwxPwgzXMxh54l9929Y3mG4gl3E559qaCwkLm0TVr5G2PBiCktBGW2WqU9raqJVtbxs6jTCzC39JiLDo2CUXGwHSjzrIsRglPQ/01qFIwnsMivjVUIPQMsksYEGQ6oflytmBpZXwiL359vjozhR3FGGA1Kwxl7Hmrf223TVnq2v/WE7smkJnk2Yfx7hGobMiZB8O+j3duI0yBFFHEUq7UA9d5Il9yVo6nBqx7uz4OmcGhn0XQSds2s06zT9p0uNcml03CYmPWBw0FtSUiF5bS2X5TnZkoAFZzBSXZkE+oNL6w9MU8FhVVqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 07:56:24 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 07:56:24 +0000
Date: Thu, 25 Jun 2026 07:56:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 04/25] lib: introduce lib_igt_drm_stub for tools
 needing driver detection
Message-ID: <limeovs35nhvd7r3vsx2xb4ebsyo5es57bowpkvkkqgas4dwur@yblucr2szvrd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <bd9ca1ae2bb6d8fc062b86c2d51df36e4d5e0740.1782288071.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd9ca1ae2bb6d8fc062b86c2d51df36e4d5e0740.1782288071.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc34c22-d0da-4eb7-b21d-08ded28f40f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: uD9rrdVk/g6p3HT+MvtuddpcXgWwMWUMZDH/uau4xiLrAq4BFK6zaE6pBVKNQYji8Vt4zwchAWixbvc2jBoPu2D4dNcjCvZOBsdqBCIMeUijrVHBl7p02Eeq0FRcr+MZ6edu2AQ0Sy6jBEkZaaoExjp+tdnTkI4NVjkarKIDoJAUJdVSQF2FV/3ORyGl8n4MoSzdB9zysftS7vlTJSttJ3L5NSfhghIG81s2+Q+e68fFeHW8pTk3Q9LBPgnY5F5mWkLyrzm967g79yzaQOa7n6iCOWok8bMF7mFjdNTNjs1LiivcgTXZzLslw4Su/ZLxYil2ImPZBdi/HlsRx5NJH1KpBWOex/H+fcuJM2xAiJa51W/W+VDPUZ6GwR+uvKfbMJRzM3tgQrfHG+opt8JkznqWRSWEO5XxStnSg7Nqos+NMFlUsCcUEYO14TXDdLrLwCmTvGQmrC8QYuw3hcDorC8zsT4NrmXtXAFFS6/hIrF4CF8Ds+AuMgH6Y51VW9TMipym2dtx2STU4N2PA2aiZj88I0VityPD0acxxcP1YPpPzVCMw+hYDrGW9QpGulEOCLkQTPil0DqY+mpOooIPtO16qnhpRM0exTxSPmpLgh9jiquyfrNA6MWLnONCsELcVHsc7aeoTA7oX1PtsHtCtbgGxq4XEY2GS7O6yf3QBxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExwOCtya2VEV3QvUTVhbkFYUTdBRzNGai9qQ1hFdytGOE9ERkZraWRFM0VR?=
 =?utf-8?B?Wlk4Tzl4OEJtdEptYXRTclRGZC84cDhtd2V5NGQ5bjFJT2hFSGVyUGdqUEdE?=
 =?utf-8?B?dGpPMWFaQlcraytVTHgwa0VEVVdNNmw4ZE0yYnB6cjNzNXhhQzZseG1XOVNt?=
 =?utf-8?B?V0xSQzhKSmZrMU1qbURydy9Ld3FWOHZUb1A0RklPRlRCR0RHRHVhaWFZYVJo?=
 =?utf-8?B?c1ZKd1ZRS09wWEx3TTU5SVdHQS8vY0l3ZlV5SDdzaS9PTTRmNEtWYUFFd0xi?=
 =?utf-8?B?NUxKdnRwanp5bFo0WlV2YXA5dUhXMTFvYzU1eSs1aFNSa21sZ01aT1BSSVhk?=
 =?utf-8?B?em5UdDFRdk5nR2hYelEyUDFMV2psVEhKWHNJNjFtdCtma3FpMHpBMXNMVVpU?=
 =?utf-8?B?QmFiOHJBbElaODh0VGlITlB3NHZwSmtheURkWlc0QnNkREkrbmJQTkN4aFRV?=
 =?utf-8?B?S0ZsT25ZWmdJY2ZubWxTTCt2THhLd1NjazEzRTF2bFc0V3NyLy9XQkFDcHkv?=
 =?utf-8?B?Nk9TOGwwOUkzZlBrQ2oxS25BMU5jNHlUc2ZXT2s1dmkydFlmRndRYkdsdzE2?=
 =?utf-8?B?OFhGZ2dpUGlJeHZqeXNFcEJEY0JEbnhZdytPMUkvalAwZlh5dnNzc1llQWlL?=
 =?utf-8?B?L00va1Q4Q0JveUt6RVVYd2s3TFBEd3MzWUQyNVMzQ3RENG5ud3dIcHlUZ0s1?=
 =?utf-8?B?KysyalNzYVc2c3N6VzJGQTZuSURrdXEwTkJ1M1JzY2ZzditDOFZNN3lwRVEv?=
 =?utf-8?B?MUN4OCtOU28vK29NMXNQMm5nT3VGUnRGOGxHTjN5by9SVnIyRmE4S3Z3SUhZ?=
 =?utf-8?B?bm5EZUlCNU9QejhoanlOVVllN1o3bE0reFN6YkJ4Y2lRdHdPcEx6K1l2aDJq?=
 =?utf-8?B?TG5kakpnTUJXaGlJNHNYc2I3U1phNGtzUFJUVGJQNVJsdkNkMm1lUG9RRk1U?=
 =?utf-8?B?eFVYV24vTFZVa2JoWW1IZHg3dXRueHhFdnl0VjFxMFNNWTkvU3cyVlRXMDZQ?=
 =?utf-8?B?a2ZRRUdTL0xGSEdaVDhYeG5BWTdhUmJ3MjBHbFErL0RSVFJIa21pek9HRC9u?=
 =?utf-8?B?VWh3U2hpQkl3RzdPT3V2YTZaU1pZZEpsQkpOTkpRcFIxSXUrSWlDRTltTkxV?=
 =?utf-8?B?OHd3UTJoNytYSmdVNGxrUVhkMUFKaHpsbnR4c1NhY1daRzNPc1BTb3Y0RmFQ?=
 =?utf-8?B?RzY2UzFzM2MrM0pjK2REc2dJblpINlMyemJ4TUg3NTRRU2svNThvMTRxWjRE?=
 =?utf-8?B?b25rRkhhQ0FidUFJckJxWDdNNzloUUJEQjB1MVE5MXF1TnNZL3hOSEpxRkVo?=
 =?utf-8?B?cldKdDlNMG5GMmkvNVZRMEpFczJQNEdheUZkTWdDOTZjRXNMR1c0alh0UFpW?=
 =?utf-8?B?TStPRU95Z2pwUTJNdUNYK05rbU5USXlGdUkxTERqQlZFQTByaUVnS2dBTzgy?=
 =?utf-8?B?emhnTXpRZUlDRVpJNU10dW10YzNtVXBNTnJVUERla2x5bDA3eWdIQmF0Syth?=
 =?utf-8?B?K3o3Z25EQzNhK1lRL240WUF2cktUU2YzdTFuNEdudVFEYzcxbzlzU2ZBRk83?=
 =?utf-8?B?SERJTEM4OHVvVWFUSmlLaVVVZndvdVZpdys2NzdjUlhvMUZGa1IrU3RNUEl6?=
 =?utf-8?B?anlwa0t3VktWQnh4R2dKRFN0RnVHNEg2eGF4UEJTUS9xOERtdWgzRXVIbGdB?=
 =?utf-8?B?cFVObnVOSXFiNThzTXdLekpTclkvSHR4VHBKRzFMTWh4VkpxanErWWZSejls?=
 =?utf-8?B?cUJpVDdLa1M0am9MSmNPT2tldHkxaml6UUQyRUR0TjNBaGFRaE5GR25sNWVT?=
 =?utf-8?B?YUJvQjhQWkJhenhLZ21kYzV0SjFMc254dlZiSitJL2FSMnpZb3VXVU1tNkZw?=
 =?utf-8?B?RWxNWFlKSlZjenUwaDdWRVRibUdYcW1Hb0VmY2c1TEpqWmxnYWFPZDBtaDVI?=
 =?utf-8?B?YndQODlMdjU5b0cwS0o1WTlHU2MxakoxNWZ4c3VBMjUwak9WNTNsS3NUYmlL?=
 =?utf-8?B?NDd5bExjM1ZTcDRuZ3FKM2txTmZBWVRZU3U5U1ZsQkJKVWkxc3Fwdlg1ZVJT?=
 =?utf-8?B?OHlSSmZWMWdxNmRzZTErNGVwWkRzQUNmNUxFbEdBRDlpVEEza0JxRlhvV0lB?=
 =?utf-8?B?MksrMHN5TXZoWWpScUs2d3gvU0g0d3pCZFpxbHMvZEVIelZUWUZXeTNFU0Za?=
 =?utf-8?B?aTJveWlabnY4V0d6bjRkYlpJbFgwUC9hb2djSmNPcTM1NWtjU2F1ZWpyYkl4?=
 =?utf-8?B?a0E2cVNJUm1GWkVRK00xMHVvelJ4d3RCQ2VTeUZTbm9CZGE3VVVDSlF6WXVq?=
 =?utf-8?B?VlAzVW5SUSt1SjVYakNFSHNVV0EzVkp3bmREUTZzUmhMQ3laeFhkZE1TVFUw?=
 =?utf-8?Q?gge9Pm33FvQOS8ec=3D?=
X-Exchange-RoutingPolicyChecked: FidZEcS8ciGsRNT+sMFDIkR/sD9jFgeHyekZIS8WWS8EJR63xRjeVJH080RUlo33XHz8Raa+zdu5+f4LHxVjRZAaA03lCVimOmFz8RvseYQrWGHBf+kYGkg/qN+4QDesm4P998LNHrP0a0kqKus/NSzkn4o3w864OYWBqdvCRXxWJuFcrZoXCKOC2uszXGVhnPscA4DE6zoIWipcxkAsTP9G+mi+ikANPR3DQxtkI4AXn0dnKQEWBpm6jHeIawkPKe3UQNxcU3eWNYdfwte7cs45hpB47vFA25aIS844vRvLX97r/3sCphibOepTL6+QKl4Ez0z91j8yWrXC3j7XzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc34c22-d0da-4eb7-b21d-08ded28f40f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 07:56:24.6493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koSxg0DJVifW1XlGhsMk7lD1praqCFqGx+rAe3qp8ByouZQSqzUCVctYROntmsyxwEcuzEtcbuYlGioiw+imyGmXxkbvaOUdHzaRJ+uruRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

On 2026-06-24 at 10:47:11 +0200, Sebastian Brzezinka wrote:
> Split drm/pciaccess-dependent stubs out of igt_tools_stub.c into a
> new igt_drm_stub.c.  This avoids pulling libdrm into tools that only
> need dep-free logging and exit stubs.
> 
> The new lib_igt_drm_stub static sub-library provides:
> igt_pci_system_init, is_i915_device, is_intel_device, xe_dev_id and
> __drm_open_driver.  It is also compiled into lib_igt_device_scan which
> already needs libdrm and pciaccess.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/igt_drm_stub.c | 129 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/meson.build    |  29 ++++++----
>  tools/meson.build  |   3 +-
>  3 files changed, 151 insertions(+), 10 deletions(-)
>  create mode 100644 lib/igt_drm_stub.c
> 
> diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
> new file mode 100644
> index 000000000..871d8bd38
> --- /dev/null
> +++ b/lib/igt_drm_stub.c
> @@ -0,0 +1,129 @@
> +/*
> + * Copyright © 2020 Intel Corporation
2026

> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/*
> + * Minimal DRM/PCI stubs for tools that need driver detection and device
> + * opening but do not link the full libigt.so.  Requires libdrm and pciaccess.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pciaccess.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <unistd.h>
> +#include <xf86drm.h>
> +
> +#include "drmtest.h"
> +
> +int igt_pci_system_init(void)
> +{
> +	return pci_system_init();
> +}
> +
> +static bool driver_name_matches(int fd, const char *name)
> +{
> +	drmVersionPtr version;
> +	bool match = false;
> +
> +	version = drmGetVersion(fd);
> +	if (!version)
> +		return false;
> +
> +	match = version->name_len > 0 && !strcmp(version->name, name);
> +	drmFreeVersion(version);
> +
> +	return match;
> +}
> +
> +bool is_i915_device(int fd)
> +{
> +	return driver_name_matches(fd, "i915");
> +}
> +
> +bool is_intel_device(int fd)
> +{
> +	return is_i915_device(fd) || driver_name_matches(fd, "xe");
> +}
> +
> +static uint16_t read_pci_device_id(int fd)
> +{
> +	char path[PATH_MAX], buf[32];
> +	struct stat st;
> +	int sysfs, len;
> +	unsigned int devid;
> +
> +	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
> +		return 0;
> +
> +	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
> +		 major(st.st_rdev), minor(st.st_rdev));
> +	sysfs = open(path, O_RDONLY);
> +	if (sysfs < 0)
> +		return 0;
> +
> +	len = read(sysfs, buf, sizeof(buf) - 1);
> +	close(sysfs);
> +	if (len <= 0)
> +		return 0;
> +
> +	buf[len] = '\0';
> +	if (sscanf(buf, "0x%x", &devid) != 1)
> +		return 0;
> +
> +	return devid;
> +}
> +
> +uint16_t xe_dev_id(int fd);
> +uint16_t xe_dev_id(int fd)
Is the prototype needed?

> +{
> +	return read_pci_device_id(fd);
> +}
> +
> +int __drm_open_driver(int chipset)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	for (int i = 0; i < 16; i++) {
> +		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> +		fd = open(path, O_RDWR | O_CLOEXEC);
> +		if (fd < 0)
> +			continue;
> +
> +		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
> +		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
> +		    (chipset == DRIVER_ANY && is_intel_device(fd)))
> +			return fd;
> +
> +		close(fd);
> +	}
> +
> +	errno = ENODEV;
> +	return -1;
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index 96903d06f..0fcbee230 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -348,24 +348,42 @@ lib_igt_perf_build = static_library('igt_perf',
>  lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
>  				  include_directories : inc)
>  
> +lib_igt_tools_stub_build = static_library('igt_tools_stub',
> +	['igt_tools_stub.c'],
> +	include_directories : inc)
> +
> +lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> +					include_directories : inc)
Instead of moving this around, please put this dependency in its
final place from the get go.

> +
> +lib_igt_drm_stub_build = static_library('igt_drm_stub',
> +	['igt_drm_stub.c'],
> +	dependencies : [libdrm, pciaccess],
> +	include_directories : inc)
> +
> +lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
> +				      dependencies : [libdrm, pciaccess],
> +				      include_directories : inc)
This, might benefit from being put in a separate patch
(or together with addition of lib_igt_tools_stub_build), so it
is not obscured.

> +
>  scan_dep = [
>  	glib,
> +	libdrm,
>  	libpci,
>  	libudev,
> +	pciaccess,
>  ]
>  
>  lib_igt_device_scan_build = static_library('igt_device_scan',
>  	['igt_device_scan.c',
>  	'igt_list.c',
>  	'igt_map.c',
> -	'igt_tools_stub.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
>  	],
> -	dependencies : scan_dep,
> +	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
>  	include_directories : inc)
>  
>  lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> +				  dependencies : [libdrm, pciaccess],
>  				  include_directories : inc)
>  
>  lib_igt_drm_clients_build = static_library('igt_drm_clients',
> @@ -389,13 +407,6 @@ lib_igt_profiling_build = static_library('igt_profiling',
>  lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
>  				        include_directories : inc)
>  
> -lib_igt_tools_stub_build = static_library('igt_tools_stub',
> -	['igt_tools_stub.c'],
> -	include_directories : inc)
> -
> -lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> -					include_directories : inc)
> -
>  lib_igt_stats_build = static_library('igt_stats_tools',
>  	['igt_stats.c'],
>  	include_directories : inc)
> diff --git a/tools/meson.build b/tools/meson.build
> index 4c67dde4f..53aa31056 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> +	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
> +	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>  
>  executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>  	   dependencies : [tool_deps],
> -- 
> 2.53.0
> 

-- 
Best Regards,
Krzysztof
