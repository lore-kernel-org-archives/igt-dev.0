Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEA1CDB479
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 11:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4119F10E1DB;
	Thu, 25 Jun 2026 11:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTfdhlHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC9D10E1DB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782387643; x=1813923643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GiCV6FiAslF1XJsHAZrLEctvRvO7HWovVEtEFGG7WMc=;
 b=ZTfdhlHaau6KaycyL+cb4xiM3J3RmqBjKFHZiLwlzo/81Hov0kfIhY8K
 wxLMENoIBRAeyOgKHhrKuUPIVAuTYlhD1Smen9+tTvTUOR5Gle/MySQ1e
 GMO0+NxcoztqaeCVyaB2EHkxNseJttiS/sBc6tVNsvLqUJTNWUW+Kr8up
 NPjO+biRf5j/FH0NLU/15quilnzPWQRwzigwHEtCbYHBIfDT5+fFwYNLc
 gwKVrGwnpbf5GuRZ4tK9/DdBHLPAXOrIzwzVVzdVQHpO2mpxxBJdKfncB
 V0lctrLRp2TZgymq8nYutrxKSQb7Fbp2bkRxpTZB/TwpULzIiMsIdAwkZ g==;
X-CSE-ConnectionGUID: 82A627YHQiq7Hv9aYy1BhQ==
X-CSE-MsgGUID: btSEKeJVSguKtY91dJVyiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93763625"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="93763625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 04:40:42 -0700
X-CSE-ConnectionGUID: t486uHj3RGGDJN33gzyufw==
X-CSE-MsgGUID: v/jsKrloSOapvTDh0ufISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="252568120"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 04:40:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 04:40:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 04:40:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 04:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ5pW1QwT8Aw+JgmEOYGzmqUb5V4BhoOCkqEPJfH+hgRqlAji/7frRW0wIo/pHu3aW/p+LLweRSBBPwQa9YnXLjQdTZLr3WjA3EODR3344824PDrHtPG20X1kEcCLr7enSbDo7o2seDDSRejyg1fp4EKEHNPcPJ5W3jMco/JWvzRgcLjSSVYg8ALCXGW2bmfx3GEZWxebnqkFpgi0l4TDEbxnRf33VBVhw7DzoLmkSKIINeRm0zJ9X9lywy8UsHVUKk2PgiDqlRKQUHE/vJ9+aNUtx2A9FuOYbk2QdBVbj+HYCGDzcds1ndDLFEUr0O2axKXOxKoPVgqZV2NGbuIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYxHEpvgIVVUDxUp5qNYtPyJJLt+BwRHjO8EprwS/eo=;
 b=WgMsNKjYSPivlpTAIvpDxHtFMxX9IekJ4ognYE8n+HWkgInsjbHaY2Yu+uAl6y/eD2+H2OcXhAce0ZIEIf6VySWijbmY3XwFeoLp5WHJJHW6sQ4CFPBGAs1HOpC7H/VNNxn/QJO4HiI8hFYl/zIXGbuZec0ARX7s7dwZPLCGjpwfF8E4CWd2HfWkz8Zd4HqFWANp7vhAKF5p7DWuswFSKd9V7FqJ8DgXedn/dwMiqXbZzLuP0VKPFQGjjJ4ldY+i0kQq16YGarcp5ge0CjAPQ+1w4fj8WfNGx+F+q22hhKQ3eWeTIun2HZC/X0gxlV5S6/fKXfGywo8gTwXu9NyvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 11:37:30 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 11:37:30 +0000
Date: Thu, 25 Jun 2026 11:37:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 19/25] tools: intel_guc_logger: drop libigt.so,
 link against minimal sub-libraries
Message-ID: <bp2lxhznl22jvukp4yqoh6kdgrp3kjjnrw2xrkok4ovaasua6r@3capq6wes3ll>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <91cc71fbae655ac628c1934ea624d0819bf04fe7.1782288071.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <91cc71fbae655ac628c1934ea624d0819bf04fe7.1782288071.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5f51d4-ed37-4def-a8d7-08ded2ae2423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: K/HuVLCR05J4jDTV2uy5Ckk7y0P8EtEzrUjnmfANKtFQxhg61rStTIlGA/ziouNk2ZlpBN1uHKI+UkevffUv0pWmxgOAn+aggKdLp79Vyg1IklsMCqDkgJBHSaeRkO/3iKohZaQDGCbwDyk9IkEimn7n5wsfpmFIJ7AVSIHhCZ/iw72csHC22hB4zUDXe6EbP56PqQcCSUuduuGF9DF1i73vEke3cvicvsYttoQdUeywXdJwpVRsVaJcJJlfinVYQBdkgid9tN/Xt2FjM6u8PNS5NQLWCha2kfdvPwx2y+3AsfqCPivRcuYXWMj95It3vVX+9Ml7AOlS3Vyjs2DjFDbvUMacGy6tHtepLDIRyqREeFP3nK1B+enWsNjywVWNzJys1K03PzuNAxkFArBjTL0XRAm1qhx71fDsLN65JA82QGuez0eLZC3QKMRBlyRJq/CoAyLIB4egIcrkxKRbjI7zTbmxGo667Lf6FI4mcaa9lK1eZgdQn3S4k/LZlYhVC3iE/VwzLfJcVm+ttaYmRGRx8X+kXb7f+enhrjOxDpoOenV3uMs97mlucw0zXHUvfDShKJj6/P2dyEbFpZxhxIE1UhN7uzeHVibYOjKUzabLVyiF3/zsYSu4qtXaQvLhi7VosLHT17S+l89L3SMdO034vKTvx9rzfTCQdDv8I/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXRjd0c0c093b3RIU2ovZ2h3anluNC90ZGI2M3FMQ2tGU05jeUtUZjhlTENk?=
 =?utf-8?B?ZDVBL1dXbktXYVk3S0tnL3V2cU5FKys2bWZacWU3Y0MydWNnUG5zUHR1NXQy?=
 =?utf-8?B?TmtyQTBqRGVJbWtUWWkwTDVpcnBvQ0RqNEVINW51L25sUWhoREgvOTViS0hD?=
 =?utf-8?B?TForQk9OY0l6d2NNeEFwUGlXbVNZNTk5eTM5T2IweUVSaG1qYUVjWXlESEF2?=
 =?utf-8?B?R2hGZjFJVGRIWkpFeDFKV29Sa1dYVTFGZXhtRXQzdXFMckZCU1QrQXVscldw?=
 =?utf-8?B?R3gyZnY3S3dYR2U2NERkeDVQaG5MSlptSWJxUmt4a2poSEc5WkhMSTlER3U1?=
 =?utf-8?B?RGN2NzQ5eDNGbEtGSmI2T2ZTNjBSc2lnYnNpVW05WWxUUUlkWm1YMmxvYW1T?=
 =?utf-8?B?SGg1VTk5elR2enhxcnNKdlFYOEsxMXd3NVRHd1hlcWFBN0xJNVllWUg4dnlZ?=
 =?utf-8?B?SmEvZm1ZUE1maysvYVdwOHN6MlZkeWZISjF3TlhTWmQ1ZFpqWXRTN05uR2pl?=
 =?utf-8?B?bXByLzR0NXBTTDlxZEwrNjMzbm81SGNvOGxKMFpuNndxaUZ2MVFwbWJrUDRj?=
 =?utf-8?B?M21COHhvQy9uOEJYTU5CR295M2pLNEd0ZzJoOTBMTnFRaWNsME9wMGVjYzNo?=
 =?utf-8?B?YVdpdUZMd2Y4NXZjWFY3eWdhSzBGaCtHaC9BeXo4MlE4bURWSHJrV3VGdFZH?=
 =?utf-8?B?Y0V5dExYQysvc0ltMDRhdWJpT2dtOGZ4VE1VZGpza05weG1RcEhNT2cyNmhn?=
 =?utf-8?B?QkdRK3hQcG5NYldjMDlud1pwajl3S2ZGTC9vQlJPQTZETGtJTW5jRG82dW16?=
 =?utf-8?B?Sk84eHVBbjhkUG1MTm1Hc0VjNVpwUnduSzJnRFVDL25ydnllL1F6cUJmWGoz?=
 =?utf-8?B?L2VMbEorSUZUVnFIampIVUhpYVNQV1BjZ0FoYU9Pb0FVR29GN2l2N1A5MlUz?=
 =?utf-8?B?OWQ3OFJOOGdQN2VsbDhuVlVZb3ZuKzRiZW5sWUMxa0wyamp6aUJRSGRra0V0?=
 =?utf-8?B?M0FYc2U3TDVIUkRoSTRLME5MeEZvTWxIRnJEby9aaUcxZFN3Y0ppUWVKbEpP?=
 =?utf-8?B?d2R2ZTlOM0tXZ3FlOWJQNWcxZmlxaWxxenM1NFBHS1VYWEpWeHhhOEp1R1ho?=
 =?utf-8?B?Z2NJYUxlWXozWGVjMHgwQW81SlZoRXpiamNQczBXYlFNUzhESlFWUHRXWnM5?=
 =?utf-8?B?ak9CUkdsaDA2ZkJmUEMvSTJoSGJaQU8xU3ErVk90dGNhNkhNa3R1RHRkcFM2?=
 =?utf-8?B?TS9JYmdoL0EwbDhZVlVSZkR0OUwyY3JPMy9jVWVhenJwcFZSUG4xblcrREtN?=
 =?utf-8?B?cHZNcWVsck91N2NFVGtjQlVQYkZQYk5pMldHVnNhcXJlZWU3aERyU3I4Mk5E?=
 =?utf-8?B?K1crcThYTjFlbEZkaE9lNEpESkErcExlRTJmVUQ5L3Joc2prRm8va2d3Mnlr?=
 =?utf-8?B?eFdLYnNGWUJGRGJQMmVPWlAwa2pkZWh6Qis3MTlpRlJBTWVkTGZsWEZ4NWNt?=
 =?utf-8?B?ZTFCLytOL2xuNFljbDIxdVlNVHpXZHk0U3puRHN0RDVvR2s3emVHRW1icGds?=
 =?utf-8?B?bVZpTVMrRWxoMURKOStOQkhKTVV3VWJjQ1h0cTJFNzlxZSs3ZENwVmwwZCtE?=
 =?utf-8?B?N1Y1SFpLMitjNlA1TzFrOWVXYTE5ZVVEQkwyMGd1cWM2dVZYT1pKY3QrU0xz?=
 =?utf-8?B?eENibHcvWTBSaHl3SG4yOCtBajZZa1F4TEJFNzE5WWx0WE1vNkN1K3g1WVJi?=
 =?utf-8?B?a3p4Z2sxTk01a2w3TUZGdFhSTVBKSExTYlUvT1NVZWdHOFB4VllNcHFRTXlI?=
 =?utf-8?B?RnlrcUJQVkRFN3BIVTd2Nk5SYnFtbmdqTVQwdnZxWVpuSXdRYmd6QUt3TXpy?=
 =?utf-8?B?MXNlNDhYZm9kQWhDYzRyWExWTDFPamthdTZ4WkJuK0xpbzljclFvOFdONjJE?=
 =?utf-8?B?M2FLYkZscCtCNjBTZ0xzbTF1MjBlRUlKa3VvUEhORG5aWVZHRURQcFdIcVRL?=
 =?utf-8?B?RlMvTW9FNHloR0RKM3V6bkNLbWdYa0lGYVFYTjg4QnFLalM2b0thd1FlYVpF?=
 =?utf-8?B?ZXJDeEZjTUtIWE9uUU1tZ25LMG1iYWJlbVRtRmVjc3h4RVlCNVFTb1J5QWpu?=
 =?utf-8?B?eVhYTG5LRUZYSGNwd2N4WEw5NERCaEdrTFpKMWh1QzhhbFAva1Q2bCtrUDNO?=
 =?utf-8?B?MnMwWVJGMU9iQk00RVdUd1VzWS8zR0Foa2hNamFRUU5xOVVuRmtWZGtFejNv?=
 =?utf-8?B?N0dnRjJLTXUra3dCMHgrSjhIYis4akNCV2ZvVWhDS3ZQSGdyWnQwcU5KOW5v?=
 =?utf-8?B?eVBtQkdWMmhQVk5YQUlubWxkT2k1Mjh0RDdmUmZNV2xYY29xSnI4ZkVvc3Rm?=
 =?utf-8?Q?ZfLpWw8o7EQghuvY=3D?=
X-Exchange-RoutingPolicyChecked: aCjdUG8or+X+e0E/ThTrtc7TWd89kWcVSTvpkEIUPv0RxaKzB8RCuwC0k/Gj5TUxLQyuGuopaM5b/fHk0VOZ+XtzDN99lVn8Sdz7zXRZ6ZsuVmH8XS5Srqv3Hj4Y/H36asMtjUg1zuEvxwqqCnzFjflQxGA+lNH+8GFU4AJ2hcY3nVPsR4hzDiPSi3F3BdIPkGz0nDiIqI+z0jS4kjQmnEU14S92sbN7SqoUdn6jpZlzpcyi7XLrutEhETjh2VHvbrzYbHtXpQ3I6GciwqKVeVk9OrkIKdIOD+UJpNSR9qxf5n4F/sk50NXw1sdSWaupGo5spaHCVV0I8XnVGwb4RQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5f51d4-ed37-4def-a8d7-08ded2ae2423
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:37:30.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo49FezUW+uGYGW63GEm+u4XVWile6kzsQUxPpbpsSjBbspNt8M7lj2WIKa052O/iaAZrfZBzbRJKaeNOBwAvLS9nhoak6WGiDS/v93Mt88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
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

On 2026-06-24 at 10:47:26 +0200, Sebastian Brzezinka wrote:
> intel_guc_logger only needs core logging/assert helpers and debugfs access,
> not the full libigt.so stack. Replace the monolithic include with the
> minimal headers and link against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/intel_guc_logger.c | 21 ++++++++++++++++++---
>  tools/meson.build        |  6 +++++-
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
> index 629b4e660..3990aef87 100644
> --- a/tools/intel_guc_logger.c
> +++ b/tools/intel_guc_logger.c
> @@ -38,9 +38,12 @@
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
>  #include <assert.h>
> +#include <getopt.h>
>  #include <pthread.h>
>  
> -#include "igt.h"
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_debugfs.h"
>  
>  #define MB(x) ((uint64_t)(x) * 1024 * 1024)
>  #ifndef PAGE_SIZE
> @@ -367,6 +370,8 @@ static int parse_options(int opt, int opt_index, void *data)
>  		discard_oldlogs = true;
>  		igt_debug("old/boot-time logs will be discarded\n");
>  		break;
> +	default:
> +		exit(1);
Are these changes also required to complete the new dependency
chain? I have nothing against them, but please mention those
in the commit as well, so that they are visible as intentional.

>  	}
>  
>  	return 0;
> @@ -382,10 +387,12 @@ static void process_command_line(int argc, char **argv)
>  		{"polltimeout", required_argument, 0, 'p'},
>  		{"size", required_argument, 0, 's'},
>  		{"discard", no_argument, 0, 'd'},
> +		{"help", no_argument, 0, 'h'},
>  		{ 0, 0, 0, 0 }
>  	};
>  
>  	const char *help =
> +		"Usage: intel_guc_logger [options]\n"
>  		"  -v --verbosity=level   verbosity level of GuC logging (0-3)\n"
>  		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
>  		"  -b --buffers=num       number of buffers to be maintained on logger side for storing logs\n"
> @@ -394,8 +401,16 @@ static void process_command_line(int argc, char **argv)
>  		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
>  		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
>  
> -	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
> -				   help, parse_options, NULL);
> +	int opt, opt_index = 0;
> +
> +	while ((opt = getopt_long(argc, argv, "v:o:b:t:p:s:dh",
> +				  long_options, &opt_index)) != -1) {
> +		if (opt == 'h') {
> +			printf("%s", help);
> +			exit(0);
> +		}
> +		parse_options(opt, opt_index, NULL);
> +	}
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/tools/meson.build b/tools/meson.build
> index 15bd40dec..62e4cfb69 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -19,7 +19,6 @@ tools_progs = [
>  	'intel_display_crc',
>  	'intel_display_poller',
>  	'intel_framebuffer_dump',
> -	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
>  	'intel_opregion_decode',
> @@ -112,6 +111,11 @@ executable('intel_forcewaked', 'intel_forcewaked.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_guc_logger', 'intel_guc_logger.c',
> +	   dependencies : [lib_igt_reg_tools, libdrm, pthreads],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

-- 
Best Regards,
Krzysztof
