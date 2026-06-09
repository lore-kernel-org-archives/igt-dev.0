Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F97BCD8CAA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93D810E33E;
	Tue,  9 Jun 2026 14:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT2QR4rZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337B310E354
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016674; x=1812552674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oCw7kgVESqJP5Qus+3x0pScCWEo4pkR/E1z7ptae+co=;
 b=IT2QR4rZcpewUb6s62ALyFg/lLbmr1o47uUntyzqsdP0/WRPbHueGZeQ
 ItHvSY+jXmOFHC/L+rskRexvRlIGIl9zGnbL8U6gwCz5hK6A9kxx2+Prj
 Fhvn3+vyB/U82rWOjqr0BH1GtUlskiLXin8rmJ8YJB/E5Lj0ViJQ1FfE5
 onAOvXB7liqgsrhJ9Bu/uEO2FW40X5Me7rHHbHDI07di3qPO13QIEmI5Q
 dA9GDACa5LkE9qG1/hE5622ZDSsUwVgE5YtcRL9anDchGFTxzPxjhkIyX
 SkwwooYQDQuSFQzQaQ05iJL68vDilg/dhBpbYNXnOQy3U5dmEvqGwoqV2 A==;
X-CSE-ConnectionGUID: a2U8NvMsTl6lzmHqcTu6pw==
X-CSE-MsgGUID: h3aSIpdmRpq4e7wf9Gf1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81632208"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81632208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:51:11 -0700
X-CSE-ConnectionGUID: 6GrwFKXjRk+b6XqM9fW/Bw==
X-CSE-MsgGUID: rqH+Nwk8QUOszRHQC+0VQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245974583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:51:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:51:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:51:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxBZvd8vaFSvfIOq2GPLOgpcFxDt4ZxOajUXnQCZZYDqITUqCbxdOg8gXvfn3zDGq56irqjS0XrBKIxjz17Dro9NIRI8YKkWVbkFqcNB0YHkCeu182oZ7XlYU43HTeZDQy8r+h0/zvyGUEWCpt6lTkRx6iGl78CeLGhVK6ZYaB7wUQpS4gm3vFaZAhjYd0cBeWenDBVsYymR0NeLOZPQODGf+YRB2K18BXxoqNnOI9BJfbpoz5jhUE/82R7odDm5ipOalw0FL9EVWu3lThhZ0TTKuN+DHl2FE0SZuGRHi32R+E2wPLXn1ntN6lifmXaTfiDQSGHp33iFqXwxvX2DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqwdb0DwITZl5a8gerYoA4HZeCyzPdvHJ5BIqDCZQDo=;
 b=JJJztqEEZK+QuqzgmQvglrT2R+6oqJbOwIaeMnt3alOd6h+0mcxiISKRL5jo6co0989h4yWTt9gG1JgQvN+xfG0wC7bvnCUxlgrAphGON4grgvLzCh4IbefmCzQN+af2P0dwsMMqJDQ3bWu9wN2p+h5Ol3dd9gseKG/hgZmPDbr7xs85wxsT1cVK1RnvofjKYT/qFFkZ1C/NHsxcnfGrDsEsdLzxiuNCjSYo9IUY8JPasz44z/qmO2JYYtICsguNjb9YRC0aBpvz57IiPFdOxYm3g/ISB3fqdIfixADlsDevHGDispH5FjNl9ORbwlBSDkOGaRcjCKakNQMdYbzEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LV0PR11MB9861.namprd11.prod.outlook.com (2603:10b6:408:384::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:51:08 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:51:08 +0000
Message-ID: <c741ea67-a5fb-430b-b62a-4fec00e1bb3b@intel.com>
Date: Tue, 9 Jun 2026 16:51:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/8] tests/intel/xe_sriov_scheduling: Add scheduling
 priority support
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LV0PR11MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: e919efcc-f86d-4301-358a-08dec63689f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 0N9b6s7wQ6F9KKMvjTq5MCIMTkTSgf3RJvmUIhgk0lytiUY8dTwBWqG3dNgbVfnUkN7aHaG9hBQGVlmjMRfYOxuHn+nMQu51yFOrfx/Lq2K8z5lrx/3qlX1DToxzeUy/BuxeGNKa4outE4VaqFEFjoigEQMA7BjUhWA6X0eETKcMOk+0gmgOEN6+tJNStyFcMLpxAHqokPtNdmyY1YFxOvC4GBuq7Gl5mb3CWOCERIiY7vV1bv0p2rWOFmxVb5PyzeOm1VC7vGU3HKSlZNpKn3s7VnOx5SfmJsfOiw4mjxwcvteVIrz6jpXZpeR1bL7bqNd01Ic+37Eyo/X+aX6FkyHIj5eda45t36kq1uPGMcF4n/12GVJYK7/0+W+npEZmtepBD99p6k+6e8xaoocQ1RQEl0vSyvCdDOA485QvxjIu8OvOc4/aARVcaV3qennY9VrWJM2kK27eMxhoV3J3uYvyKIONyYQORAeu5rG5J5kILYMaVq7XAYDY205upAsu7WX9qigQ1Jw1aLLbWmCHxHylsFk+CRIxNMg/7+WaW+sPrvxR5TK+S7KzsMOxYB2tZvCDUUFHR8nUXj5Naavl16ypkmkFE/UietgmtTH38bAPCbA+bhcPQwTJ1LNqtZGCWy20zHauK3zEmkUrIjwCrrqsVbQz/DldzVQXEb1vc5xj4+U/oORr6kv+ZhAJQRvX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWpoWkM0VXNqZWtRTlRQK0JoVUo5eEE3Sm11ZEdoenh6SThFVFd4VjcvcDJR?=
 =?utf-8?B?WnBSUTE0TmY2c2xOYzluS1cyZU54VHA1VVlzZGxlSjJ2Nlk4ZkZkcmJQSDMy?=
 =?utf-8?B?cVpHS0k0S0phODlRU2d4b2tsRG1uOW1ncDZ6eTJ6TGFDaWxaUkVuZ2N2SWRQ?=
 =?utf-8?B?ekFURlZUSUgyakxwSE9abU1zV1VPTC9WY1hmZlF2WTAzNDBMMDd6bGFJcHU0?=
 =?utf-8?B?dUFQeTZjR3ZDTnZ2M1B3U2R4N3dNQkkxV0NTQSthMjNSREZFN3pKa3l4bEtv?=
 =?utf-8?B?MnVaNjEzY0pYa1hZcllwU3hWaERhUzViWE5HUGwvUGhiU2J6YkI1R2ZITlpH?=
 =?utf-8?B?MVg5TDJaNS83UDJsbGRaOEdBZS82anE1ZEFNTW1mUnBZRlI4OHRLSDFCNDRm?=
 =?utf-8?B?emwwUUpzMk5scHI5MEJRMThwbStkbHk2UEZyTlQzS3RUMnRpSCtjVFlXMGhJ?=
 =?utf-8?B?NWlzWnc2d2xZU0Z1eEllcmVUckI3TjZPZFZJTlB2cnh4NWN6L0dITEpZenFx?=
 =?utf-8?B?dWZsNVhuWW15STFySDNva0hwYVFaNmd1RVN5cnd0TzZ6Z1N6YVlneHNNVll4?=
 =?utf-8?B?bzJsR05YdEQyM3VvSmoxT0pRdCtZRGlnZkFudDVDZVBVclRlYkdZeVdvZTNX?=
 =?utf-8?B?akRydm05eTYyeThmVHFVc2V6MFRKbUh1b0R5VDJTZEpNT2VmSG9FYmluNThK?=
 =?utf-8?B?bTJScldmbmZKc0FyYTBOYUdSTFhlVE42SDVZMzA0NjVzMjltdE1UaVJlSGh0?=
 =?utf-8?B?RW5CZUk4TW5zOTYyblBLQmVxVTNtdTE1NnRZU2VLb3BFQkl1QjR0K3diYTZj?=
 =?utf-8?B?eG9NdFd1NHQ2SXBvQS9DOWpPbnV3YjcrSlF5QmhOOHowQUNyc2ovKzdxR1Bn?=
 =?utf-8?B?NCtyTnpjSVppd1o0N3JIdnF2bkFjaGlBd1JFc2pSWjlPRmVlZkVnTGJoOTJW?=
 =?utf-8?B?dGQyNUhtbTVHTWhHMUFHQXJVSm9Kd21kN041U0VrYmtZVXZDWU1LSFhXdWR2?=
 =?utf-8?B?Y0E2L1ZTVC9ablhmdUlxMzRPR1hYZUpHNDBKM2dsLzJEMCtjLy9tNXRmSFA1?=
 =?utf-8?B?STF3VE5hWnUyeEVZR2p4aWJSNTJhcjB2OEllTDVObWNQKzV4WklkSFVTaHVD?=
 =?utf-8?B?ZnpBSFJ6dEZRN1VyMXludjMwem50MEpIZEJ1eHdzckRQWWVtS2kvcjZoWGpP?=
 =?utf-8?B?WDFJZnA2QnYxVXBFbk9hM2F4UFh5MnZiVTQ1NlEvUzlRQlNGdTNiR0wxRCtz?=
 =?utf-8?B?S05CbEhQQXQrUldycFBZQll6V2U5ZEg4c2RmMWh5cmNOdmdBb1ZPWC8zNncz?=
 =?utf-8?B?M1FxbVVHelRvOTVFQzdNeDFHS2xqUnZPN29zbE84ajdmc293VTVtSXo2UmFv?=
 =?utf-8?B?OUJQQXBLM2Z0SHRTU1BQNWdFWDlSaU45YnNmWU00d05RMzY3cHQ1STJNMjM2?=
 =?utf-8?B?TTNhKzE3anBxQlpoZTY5MkV1NlhhRm9RaCtQL2dvT29KRVNFejVvZDV4SWtQ?=
 =?utf-8?B?dzlWejBma1lUUFZETUxrSTJaSlhsc094UlhIWHovQTVwZVJYdlNWUHdKZStH?=
 =?utf-8?B?UnlHVkxpcUhodHZ4bmdrVHRPSlBCKzNFOWwzZ0VCOW1qMFRFRkZnZzhDSWdl?=
 =?utf-8?B?RGhhWGlrRXJrS3YxWGxWdHlHaXNSeHBJeURuN1kwVFJvNFFwNmZQVXBnODZ6?=
 =?utf-8?B?WG9rRTJPZmppa3hSU1gveWFUcjVncmhUZ1pWeGJNMnRwelFwSG0vN3dDQmYy?=
 =?utf-8?B?amVOOVBxbGd0cU9VN3JYUTZicWVNZThPNUJLbzBjUkZiV0E0TzJIRUNFOG5s?=
 =?utf-8?B?dWkvaWxjSWpDTFovaE5IWjZZQjlTQURjTDZHLzBtSXRvM0IvUVVyeU55QUZE?=
 =?utf-8?B?QmYvYkcxWEFXVnN6SDk1OStjZi9YNnhVOXJJR3pJM3JxVTl1Ulh2MlVWdVpN?=
 =?utf-8?B?dnRDWFd2TzlWRFJEcGpKTXhzazBqVkVmSUMvMVpWOVd0ZU4xdnhiUzcrMGZY?=
 =?utf-8?B?c2VPR1NEenYrQTUrbzFYRHRJWS9UVjlwa0UvS1FQTzhKbUFXdlROZW8rY3cr?=
 =?utf-8?B?RnlUcmNmcng0QzNUSEwzeloyR3ZsWXNtcVpFV0VPbmxZM01nTlUzbEJwYmJH?=
 =?utf-8?B?ZW5EYTBtWDhTUjROQmVaTEo3dXZrS2pRd2h5T2dObFlWV3B1ZURHVXVYRmkv?=
 =?utf-8?B?TzZtZlJoV0haajhPS2J6WUZXZEJ3QTdvZ2Zya1V6em9ISTFkZDZRS2l6Snk4?=
 =?utf-8?B?alV0YlhKY1cwdWNrY0tMcDg0V2ZPMUZOczBDMTIxYVlkc1Z4UWxxa1NUZllx?=
 =?utf-8?B?eURKZ24zS1orVDVhTkw3UUFSUDRnUVorRU1rdS8rbzl3N2tsaU8ydz09?=
X-Exchange-RoutingPolicyChecked: ZlhWrhHToqhrKtjHw6dpi4DNePkbmxFfoQzLHIQAUFSl0U5M/8IYgtYNMPvvkFaVT18WbZ2RXakRq6UGkmP4V3EZ7KH6bbRAeXv57j8AXp9Wx8HHvIyi8JwX5ekIfUVJGLW2ODhYJ6zQOjuMOwViwczw8gdYd3yHnBZDmdWmk9REi/i6x3HMNxspQkIDKa38BfHzzS1mUaOHrd4tj7MP4KE7MQvFsARB0NWDp4QFq2CVEM/2ONuHEA/jBjeRmJL3b1Ghek8a4M7EnEqdJJn7yZwc+h+XDbA8X4kGtxKfGaClUgJX3xaSUM0rYxFKOQXlmRNQ+69t27T8efsuwH6D+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e919efcc-f86d-4301-358a-08dec63689f0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:51:07.9825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyKPK/ckZiBGKZGUiR2TTleIz41JOJgwABsYuwwrKHDePtZUaWjLgRwbD14KdQpNBgcVSkE8J1LsldIkAcanEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9861
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Extend vf_sched_params with scheduling priority and program it together
> with exec quantum and preempt timeout. Also print the selected priority
> in the test logs.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 509d6fd00..f4e674fe2 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -370,6 +370,7 @@ static void init_vf_ids(uint8_t *array, size_t n,
>   struct vf_sched_params {
>   	uint32_t exec_quantum_ms;
>   	uint32_t preempt_timeout_us;
> +	enum xe_sriov_sched_priority priority;
>   };
>   
>   static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
> @@ -389,6 +390,12 @@ static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
>   			  p->preempt_timeout_us, ret))
>   		return ret;
>   
> +	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, p->priority);
> +	if (igt_warn_on_f(ret,
> +			  "Failed to bulk set sched priority=%d: %d\n",
> +			  p->priority, ret))
> +		return ret;
> +
>   	return ret;
>   }
>   
> @@ -607,10 +614,12 @@ static unsigned int select_inflight_k(unsigned int duration_ms,
>   static struct vf_sched_params prepare_vf_sched_params(int num_threads,
>   						      int min_num_repeats,
>   						      int job_timeout_ms,
> -						      const struct subm_opts *opts)
> +						      const struct subm_opts *opts,
> +						      enum xe_sriov_sched_priority priority)
>   {
>   	struct vf_sched_params params = { MIN_EXEC_QUANTUM_MS,
> -					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS) };
> +					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
> +						  priority };

Fix indentation

>   
>   	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
>   		if (opts->exec_quantum_ms)
> @@ -638,12 +647,13 @@ static struct vf_sched_params prepare_vf_sched_params(int num_threads,
>   }
>   
>   static struct job_sched_params
> -prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts)
> +prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts,
> +			 enum xe_sriov_sched_priority priority)
>   {
>   	struct job_sched_params params = { };
>   
>   	params.sched_params = prepare_vf_sched_params(num_threads, MIN_NUM_REPEATS,
> -						      job_timeout_ms, opts);
> +							      job_timeout_ms, opts, priority);

Fix indentation

>   	params.duration_ms = calculate_job_duration_ms(params.sched_params.exec_quantum_ms);
>   	params.num_repeats = adjust_num_repeats(params.duration_ms, num_threads);
>   
> @@ -663,13 +673,15 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
>   	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
>   									    job_timeout_ms,
> -									    opts);
> +								    opts,
> +								    XE_SRIOV_SCHED_PRIORITY_LOW);

Fix indentation

With above fixed:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>   	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
>   						 opts->inflight, false);
>   
> -	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
>   		 job_sched_params.sched_params.exec_quantum_ms,
>   		 job_sched_params.sched_params.preempt_timeout_us,
> +		 xe_sriov_sched_priority_to_string(job_sched_params.sched_params.priority),
>   		 job_sched_params.duration_ms, job_sched_params.num_repeats,
>   		 k, num_vfs + 1, job_timeout_ms);
>   
> @@ -759,16 +771,19 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   {
>   	struct subm_set set_ = {}, *set = &set_;
>   	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
> +	enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
>   	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> -									 job_timeout_ms, opts);
> +									 job_timeout_ms, opts,
> +									 priority);
>   	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
>   			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
>   	int preemptible_end = 1;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
>   	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
>   
> -	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus prio=%s duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
>   		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
> +		 xe_sriov_sched_priority_to_string(vf_sched_params.priority),
>   		 duration_ms, k, num_vfs, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
