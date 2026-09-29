Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB8CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 05:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F5710E582;
	Tue, 29 Sep 2026 05:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOReWFET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B5410E582
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790661545; x=1822197545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjG8+sZU5x9xYKcSukEZxmfu6EWQ0h22gtnnXBm6HPA=;
 b=VOReWFETmyBLMXFpRY5RpMwC+U+Aa/j0h2zVtpfPQOYGAggY5gE4AU3a
 rZV2wwefoVTj5yzpXAczOOepss+cemPJGJQk04TBgb0WqNEt1+ldzcgle
 7ouNYKCBitCYG/q/qflJPup2ODjdSYEZB8rLtDq/iUz40DWjNWC3Tftiz
 nn5/soM4J6wZBnAzOP/H7eybSsTazd0HY8/8/mi1oG0eG9wKn6lybA9Ny
 jD2hr3yrsbI8gSc6muJsSvauh0Ua33rh6NwWiZxEX06H/awjpp3Fv1hCa
 z5bXeJtoGDPPIw0C7Xue7U5D5c54GcciKzqG9N9USk8Kyvi7Amy+rnp3Q Q==;
X-CSE-ConnectionGUID: E1n1V2HVQf+dPln56SWJAQ==
X-CSE-MsgGUID: VbMMAvyoRtaxGTI3i2xhGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102743932"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102743932"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:59:05 -0700
X-CSE-ConnectionGUID: AZr+gy3rTOiLy9Id0dikyQ==
X-CSE-MsgGUID: /T0irb5bTfaSsVybe/2mvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="301555193"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:59:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:59:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:59:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIeKC68HLuhH149YTOUoH/XBNi5ZtXOs59MiAo0Qa+PfWG4GV80tfMQNxx+taTfvUOOqRP4nvVq9EG6Ushlgbh1uO3dLiXMO5LYHM9VX9zN9wtcs0oBT8BhKhgIe9JpucS7c5GDd3VllO7L4a/R0AMCoSFve62jfr3Z7aHHOGrG0Y2SIRuwP6AWS2xZ+ITRGGZ3WnmCbivfv2H3Ts5JIObFC9CfpnHJwV0F4vvRQ1XVtABb/2BZ8NcgdPEqEDtGYBki+2EsFXoP80/CULTHwMJvR7KxkBlj+ZT05OX/bz8/oMi1LUWTLAXAGlZ7CegGYPlQ5GN5kVHpMktvT2RbLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZndPAEsgbpdncP/eYeKG1oWMv5vBtl4NNIjWpMZbB8=;
 b=bj8eDZmLOlo9qmNcTAi7mvEHnXv82NeiVPOVdV93nywpS8I8jvk2hp/nO1Pmh8/dRJ3RDuOxCIzNwgegQyYdfNdhZtndxKwu9Ngah0a6KtQomOUeDrTsLxNbnjVFayW6Bnz5AMjMZYRPGzU6ROW2/rx5G5GD9FUBi79T4ppyP/sme9cCAULERsbYHUb4Nl/bQMsOGH2PeCnO2sQr+IE2OYQCRsa52V0vlRwklW0ia9DO1ZeT6TX+SITfjm5Auc2Em+MgKis82aNcnquezJpCHL0ByIkdJdBmcEE8hnrKSx+YBwvp7H+StAft2EdWls19+6H0z+l3/bZ3TrYI0pVQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:58:58 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:58:58 +0000
Date: Tue, 29 Sep 2026 05:58:49 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 6/8] tools/gputop/utils: guard ANSI macros against
 redefinition
Message-ID: <3yq5jm3wollygjr5cj4ypqf7efhtkpwln527b7tq36h7w5cqxx@oqmzjwvdigca>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <8f9c75ad3af3e1622b6d09fa0bb482290677f410.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8f9c75ad3af3e1622b6d09fa0bb482290677f410.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: VIUP296CA0083.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::7) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 836f1dd8-3833-4628-5ea5-08df1deec0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NXvQZv1cbY73ymXu8PmqpqffmXmock7+oPuB13zcY/K+44kivpq6NqDRR+7Lg7OPsKaDmjWgG6yk946RU0KB2zEZXGohYMVmoT7rKJfE5wMN0RCDFXeBhAxteeEdNFqj5QEIzX3P264X9VVMSUZgLbhuDhEvzwGR58OJaA0oHibtp6pwGjPTBt4Hjd1Pxrrl5xvW3hd0xc08V1NXns8cZuQs5tcb5qi4pngNXQz1N7wUJAVVQohQIzBro+ZsWOZjTfHJK7QxFU03nbeZKXbB158Q4NmMHOIlMKQl/uLFD6nxbdAEZNgBSYbx3pAlBgPFyTB/PpsJALurzs0ocbsTNZ5q3nFxzpH028khzgy+u8HhhZXZgnDor55b03cEbfeCWjS6ABKqS9O29lrfIUa1gAJWDuhi1oa1kksavGBmfdTo+heEPaCYUNlCfw18SwTsUKm/Au9/V6w1sR220PtpI9AhrySOdXS/jFeNoMmKJQ9mI2GxuZGlrVywuiYusB0dBCRJgsGSi2yf9kH/IT3q+YYCjabOx1jmDM/e2zO5fbPwCiiHEvXHt0zmDGDykFtNwsLdMx8hrcgKnnKJgJig3hq9wUeb/XwQ8fQXtqop0KZGmOqMdCaWgrZGbkzpi140RZuPfUbsxPAbggq7LmcmcOtNprVoFU6I2RblU1qHHNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhXRFFxRytRaHNPYTJTaXNQUURJd0dWTGhEWktqWkxQcFZuWEQzVVdacDJD?=
 =?utf-8?B?V2tBVTJ1OFhnVjZLTDBlTHlrbWVtdkdFaHdxVGYxVnlMMjRZa2d6WkpHMVVV?=
 =?utf-8?B?S2hSc1V4RlJ3blNldGJVMGtXWGZncnF4djFOSGtRdUl6TS91dTNnQ1pibFVF?=
 =?utf-8?B?NVByaWk4QXdIRm9ydWUzTjNUcmZxRGt6L3F5VmtwdGl1bEZYVlNkMlZjS2x1?=
 =?utf-8?B?aE1EQVVUbUxYVUltRTdFdHRaRGtmcE1kVnhwTG90NmpNL2NPRDJ2NmtRVElF?=
 =?utf-8?B?N1NpaDFKU2NDamNFemZCKzFtNXNvdUZrMDJMTnE1SGFNQWMwc3VHYlBzNmxB?=
 =?utf-8?B?c2xWMXU4MGE2dnVxNTAwT2NCdHZ6RTNQWFU2NnhPWUcxYWc0aTN6ZWZzYlk2?=
 =?utf-8?B?Sjg4Sm1QZmV6eWsvZEhxRWNpZ3JLQ01aVjFkRU56ZzI3cm82Y3VkMXc0eHFP?=
 =?utf-8?B?RVQ3dG5iM3hQK0J0K3NJWGZrZWQzM2RadmttTk5ocmF1a0dCclBRZmsyWW1J?=
 =?utf-8?B?cEtSa0I1aUdIbGxDNU93ajJ3dit0TkRoMXp6NkZ4UFdoeWlrUFh1SmxmdEtN?=
 =?utf-8?B?dy9zTGd0cUI5MzJ3b051RUhRNU1lNkZtKzBZLzgwb2MrRDlrU2lsN1hDbXo2?=
 =?utf-8?B?NGVLTmhsVjZKYXFIM2hGSzdNd21RZlZyU2ZudEhFdVlrZlh3ZGUrRmd2dVoy?=
 =?utf-8?B?bjRuT1pPKzgzTU5kTUZYcjlFWmFTL1dRODRPbmVqNFhLcklkWXo0aWZqcEg3?=
 =?utf-8?B?N2hYNm1TT3dUaXp5VTBma0JIT0tlSHU3UEg5VGIrUTNiRFdYeURzYjNEZ2ND?=
 =?utf-8?B?R05jdFBqMS85cmJ1V2ovSTNBd2U4MGtPVUpVVzNCTTN3MEt6dnRJOXRraVFN?=
 =?utf-8?B?RjQ1S1VMWWlNK1ArKy9vS005djBSS2xaK0ovTzQ2UVJ5eWV1WGQwdWNLc1k5?=
 =?utf-8?B?b0ZBT0ozaTNBRjRmekdnbkNkQS8yZ3dRUlgvblE1SlF5UExWb2ZudlQ2VEpt?=
 =?utf-8?B?SGpNTFFnT0d0WndiVWZBMjVHeFZ1Mld6azRTOFFqKzk1RU1EV2xhdWlwaFJy?=
 =?utf-8?B?eWF6dTg5cytZcTJTSy9oOGphQm5iODZUNU5OTHNwTVJWdC9KeFZXWUc3S3FJ?=
 =?utf-8?B?NWJ5WS9BM0dBb0JjWDJlMkU4K3I3UTJLVzcvTC81dEhacDdnbTJSVXZzNDA5?=
 =?utf-8?B?eTBGUVpyblBjU1c5dUpLU0p5bmpQQXZ2d0Rvdys1TnA0a0NyNkpTNjhLeEVw?=
 =?utf-8?B?alBQTTIxb1pOdDh0NlNlVXBiZXc5RnR1cWdTalVZVHF3eGFPb0Z1ODEwZ2FC?=
 =?utf-8?B?OXBzTiszellKSERtK0JJejZXMGxhd0dSV2YxNVpzY2hrTG1YeUFjcXlwQXJ6?=
 =?utf-8?B?WllxMHpQUmV2Nk9UWTRiZnZwZ0tvL0xPeURlZk05aS90endlYWQ0SWlqdEgv?=
 =?utf-8?B?TU03TlM3SStNZHd6dlhETEJVNXU1ZE95OGo5R3ZWS2FUOWUyQVI1YTd3S0dP?=
 =?utf-8?B?MlFmZ1A4ZitsVzEvdWlMMm1VWlNITkZmOUg0cTFDQkZvcEpGUmVqcDgxVy8y?=
 =?utf-8?B?YkwwbnQrRVhSR1l3VDV0L0o4eVpWU0pabStFWVp6TU0xM2VLU1o1M0F0eGc1?=
 =?utf-8?B?dWxLcU1MaFQ4VHNjZXZWd2xMMGlvc2xjbjZKQ3VjSW1TTDRFbXNmbG9pUkpU?=
 =?utf-8?B?Qy83RW9EUkdSWGV1eUFKMjRMQ2g4Nm9obFpCSTJDOFJONGJOanIwS096T0xU?=
 =?utf-8?B?Rml1SE5wakx2cnJlaHdTQXZOZVIrQTJtUHBHeE5sWEJtdW82YnRtZ1h6UVg5?=
 =?utf-8?B?UnVVa2pscDhUVElUMUFzZXlWSzkzblFDQ2hjR3lTMjBXTGRxMTRoR3gxTzZS?=
 =?utf-8?B?a2J2M0tjTVBHMnFKVU4ybWg2czlxQXpCS0dqaXd2UXoweEJKMlg0d3NyM1Fp?=
 =?utf-8?B?aW9YdHo2MzAybkg3UFZ2a014ZTZ4YnhQSnVpc09JZXlZYjJmZkRUcXpEbkpm?=
 =?utf-8?B?WmhzRGF6d3BGb2ZJRzFGZFhLMU9UU242R1REV0xWang1c2dDdWVPM0NJZC9v?=
 =?utf-8?B?LzZ1Y2g4Vlc1bDlrQ3JRQThFc0pINllpTm5hYlVKY2V5b2pmQnBwK1Y1M2Jo?=
 =?utf-8?B?MGdUejVOdFFJWVdnV3hLSk5TMGFUUjJHSVRpNU55YjdZQUFyUGtzdXMySGxZ?=
 =?utf-8?B?dlJCMEsxbm96aUU1Zk1yUGdFWWdFK2xTdmszdG5PaG1IUTJBWmZueDA0ZU1m?=
 =?utf-8?B?MWR6ZituYXhzNTROd1kvYXgvTC81YnVmRjQ5YVhUZkRGL24wRzRrczRTc2hq?=
 =?utf-8?B?cGhWM2FiU1p4WVpyUDBBenIwYlZzUys0aTB5N1UvOU56SHZsdE1sQ04ydFpr?=
 =?utf-8?Q?6wDozVdkZyXN4YGo=3D?=
X-Exchange-RoutingPolicyChecked: k3bujRcqwWeTTFiITF8jskxJDT59tirrWmfQii+CjeVusfnQ9hKH8wbYU79zjydsn4W450GeJmKQfhUfZf4BzHJOpBRZVq3MEwbFGzZPDtVAPAfb1q9V1MV0ne1rbaWuAHQf+Ck5dLmipsfCxGZ1fyJ6tBWj5niv0cKX/t6kv2seEi2eFH4YP+5+LchndQ88m0/kffFWMPHC7Celbl01HMShxwDuYL9ZtVJF26vWY7B9kx2eiopKBa0IC0vFa5yQi6cV/wwN9UfSSYpZ5C5jG/v7QK7N2C/oZ71AIeRbxWOvIqKKUi4ENUy9VgHhrJcEhX1Rxe5BUvj8vzilzS9LEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 836f1dd8-3833-4628-5ea5-08df1deec0a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:58:58.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8Al6teX2G1zMavmTvhmIhxfvkzYIN/W5tIWX4I68ydcCA7XaVdcNQJWc5IErio+N5/crBEAtBF7kK1W6hMyWH9hxg+WOotOnofUiR0WwZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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

On 2026-09-25 at 12:57:46 +0200, Sebastian Brzezinka wrote:
> Wrap ANSI_HEADER and ANSI_RESET in #ifndef guards so that including
> utils.h from a translation unit that already defines these macros
> (e.g. gputop.c) does not trigger redefinition warnings.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/utils.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
> index 00befed56..d319bff09 100644
> --- a/tools/gputop/utils.h
> +++ b/tools/gputop/utils.h
> @@ -14,8 +14,12 @@
>  
>  #include "igt_device_scan.h"
>  
> +#ifndef ANSI_HEADER
>  #define ANSI_HEADER "\033[7m"
> +#endif
> +#ifndef ANSI_RESET
>  #define ANSI_RESET "\033[0m"
> +#endif
>  
>  #define PERCLIENT_ENGINE_WIDTH 8
>  
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
