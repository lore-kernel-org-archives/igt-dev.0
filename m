Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F43F8D775
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F33310E10F;
	Thu, 16 Apr 2026 19:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8DWGPS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6810E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369252; x=1807905252;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=By+mUgyQAqYccLvoaZrUcLiydOLDH7BvNnmFS1e4UmI=;
 b=K8DWGPS2/NPRc9dEzGg27iS0nWEp1RSMjhoCRmauYADiylarZLAjqzYr
 J+YtscsbOmfFuI84XUH9J4FN/nYs0hTiIdP8MZidNDlGn2qi0oyFdu3m6
 pq8vnxx2Aw7oEvSNR3KBRZOby6N6/EhcHMYMtGuAilYRqpxwf4O4kM4A1
 N+jtMmlDaLrjtGnnh74t3pcNN+3xJkvnCNEFRgeqtM2qogk6yGlABKY4U
 bbq3zD+TSdO5Mpz39qITBOpRQIQEpxbs8t7bkYLrSUUQeTmK/LNfEqewZ
 PRqlpwCzWWgyfxiOGfeUsIOOR+8F245q7Bov19NlTpYZL/XCBKKrp0kXN g==;
X-CSE-ConnectionGUID: BrQUvhgTTzazunUwoA486A==
X-CSE-MsgGUID: Is+ye4t6QIaS6p4G4HXhBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100029164"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="100029164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:54:08 -0700
X-CSE-ConnectionGUID: FwhSSHCtQnK31GM80ZaUhA==
X-CSE-MsgGUID: Jq//ACxRQZy7i4u7z5D4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="227689428"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:54:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:54:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:54:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOg53bEUhPaOPKRQL3X6RrKpIj5zKpqIc5aJqtnNNWYCiNcHRzmN8+5oWZgOGELp98MYhDpF5r7UHTh4jUe41EXnPAJK8Vkpu0gscUyCANoL7zcETpGMtSn0rvkP+UrI4l2EpQDdAN5Nkuzg75NiP/1jjt1X9WC8uVSLRjgpXD9Uv1CpeiZavGWZXf5LSadPoSRMMNdr7gzCVIBIeW9n+YAbPxSVZWURQYDpgbrhBspMrZ2uTTQoTtoKW/HpgNxOPpWj3WUMt2P7Fcc9g3irOwIYulPhi2QaZGu5Dd/DGGbRWz/0ubrwNJzZkwdpwAZ1uXEd8vlH2dthDfVzhCaAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TneQrelCUUxs4Jz05z2hFVaseV0Dez0FLdiP9EaLwls=;
 b=PIlPa9iPH5XDZfMFlm84UWFtX5lyk+aAq26SPmZ+Wv9Q9KqPss3WxhBhrTCA9b876IYa1AX5zzB7O5tJ3nirWBxMNxlBMoFLYd3+2HTlCj00VwxsG5jQCjYzlZdMtEMfr/TfEh1lw6AVpiSdHf/ESXOBOk04pHl0rA34ywukf6PxuDgVT2cmvR+o14wGzoQd9ZR63Ku8Io1uX6f2PCS6Pw0jDT3RVL05LpfRrk0HeqGW3nuvEfSkOGi3QUxQSu/eNEe887Hp0h0cRYGlcmSOG6dGPR4ElUbRQjLRfgb+ahY00w10An8tUcJgqMxjpHSxpxeebgT8Q09nBzZC+b0lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:54:03 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 19:54:03 +0000
Message-ID: <d6baf1bc-c82c-49a2-a122-63ea3053531f@intel.com>
Date: Fri, 17 Apr 2026 01:23:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/kms_sharpness_filter:
 restructure igt_main
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
 <20260416155421.2000-4-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260416155421.2000-4-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6cbbd6-0e9f-4a25-b06d-08de9bf1e927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Hy1qntDuUVCtpkkEWJluTVwv+3aVrsOQnJ1GpYrhgYro0FVc82SuGrIny9c3NoR+MMxTmT8jagzkVyFSyrhQFlOcRbyqQNL0jV4mQBjjveOY++sv/XeMApB5cirQCuGT4Xtsy/N1vPjBox4pk17JCErnSBIIqEMk6E7c/1DMgM5uh1WoaaNNd1g61hNEuhAwvd9LxPCPYguYNA1Eo7AEw5zhPWSiAreIbVAAeh0wrS+uCYJk0EHHTEsgDfE8wn6IgSMZsOcsMlTK1kBFBCJx+QnZ+jGkNNf9dWJm62SRpRqGg1xU9LMq7iP5Z44gCM4EG6u6U4geqrE0um1M8tMKxyg/CZUdqsav+BSwQkRkyo6R/R7iBAbZ5P7eq0n7or5PmzW9DVMjE3NbIUaW7C8L6BM8RD/+hGEAi/LgvWFkrIJTBbSv6L6h6lmMFKjqVNMZVsKcorNRJuQDtAPM+fWo0ViScv5RzkxEWAFixBHYcn0UBoqdugU1BaxPvJhGHozV6HraZJH+lir/jOUXAlZMGQhQYkNU18DJenphuMPKMFQWsr+LCBYuOC8knb1k4txFZZPLFfqx1M3erQKGnS3nIkBhonQvjPtSqBYV/aWA7nDLcjmY7EUcD5HIgl15MdGIOEZg+c6zSut+qdnSpGxgTIxyEHWRKaumU3X7IIitP3ehjfIdkrE6rgdYjEAFOjhVRzGOo0j4arfHBFc+Z+KN8NKkLgpIqw3bcwfEq7F6Y/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFKWVdSTU1SMmU1dmtLU2k2ZWlMY05hOS9jRXlmNm1MZ2lCUVdRL3lzeWdR?=
 =?utf-8?B?L1pRWFhLemErOE9mcGNVUHdZcEIrd3Q5dDNqcXdlSmYyV2JrTitYNjJvLzhE?=
 =?utf-8?B?WXNpTm9oaW1wZXBFOTNocDZJQnIzdGVXaUhVcmlxZjZ6RUJQSnZPSmNwcUwr?=
 =?utf-8?B?RjlUaVIyL04vWnFub0ZVMG1xekFlOXF6RXVKcXp1YlhlSURncVRVZU1qSTNU?=
 =?utf-8?B?ZFhPMFFCVS81RkpValJ6YytXRzQ0M3d1THllYno5Ni9BNUVVVExYOWp3ekoz?=
 =?utf-8?B?bU54RWg1V295aTluTi9oYjRwV2dUNXVrZG50SHhQSTcxRGUrMVFQb1VzaFU0?=
 =?utf-8?B?cTEzSFovRGlOQ3RHT25ZRE1qMzBPbWdrOU5LQkp0QU1CWFVTRVRFTjhwK2VI?=
 =?utf-8?B?amNPaGQvQkdqbm5hWnlPMzFUSEpBRXl2bUNhbDIwclpPQWhZWkZINXFwUlAy?=
 =?utf-8?B?N3lHUkRldU00Q0cwb1o1SDdTQjQ3YUdwaFcreVZNcTl1NVlPQysyNDhCbkhO?=
 =?utf-8?B?eHZXcEJFU0JYMWVwQXhLNjY5b0Q1RHNHWUdodE90WHQrWWNXRVMyaUU4d29j?=
 =?utf-8?B?NTcrTEhsVkIyQ1dVU20rZkVVN3BPNDdFL1FEWEh6VE8xeXdiRisyNno2eTk1?=
 =?utf-8?B?ajJCVzRVaHhuT2JFbTdSS3ZwNWw1TEppd1V5MWtDR1Qxb0F6ZmVIL1RhQ3ZT?=
 =?utf-8?B?SEhiRjkxOXlIVXEyZm5iTDVxYnF1by9sMkFiUHd0UjZrdWcrUnVyOHBGZ0Ra?=
 =?utf-8?B?NVQ0TjZpS2k2bFAwY3p2MTV0WWZRNWZmcFZJb3JEUGNFL3Q5YktlckI2ajIw?=
 =?utf-8?B?bzRiTjcraWJiZG01OVVTT2lGQVMxYzE4b1dwOXVFcDhsQ2NPbGs0SFBFOTlN?=
 =?utf-8?B?Y3cvbDd6aWQ5Ujh5a2IxMFZ6YjJmM3pGTUswazhGL0RXUThSeFFFRnpYZTE4?=
 =?utf-8?B?N2ZsL0Vnby9EOUdUQVYrYlR4MjVqaVdWZkdISFpLczdYNDlpS2tOdTl3U3ZQ?=
 =?utf-8?B?NEFkRkNJSWJnUVdGRk1yR2dPS1ZQWWs0SEJQM2JOdWpkSlhqZkRmUzJoMHhE?=
 =?utf-8?B?bW1iazZ3Y0pCTk01cmxKdHdPcytXZDBTL1NsL0Z5Q3I5dllEc3VlV01STjJL?=
 =?utf-8?B?VnQ4Tmh0ejFzNkpSdk0xYkE5Y2d4bFN6WUZ1QitHT1hlYUJ2bkhqNGEveUg4?=
 =?utf-8?B?YmE4Vm85bVdWUXpJekZtMkh3QW9jSjNaSjhiaExPVmg4OU5YMHZEdUxPVkUz?=
 =?utf-8?B?M3Y2ZFBxZDBWcmJ5VVhwcGh2TzJMR0JqVDdrWG1pYTV3YnpyeTZnZFRPYktw?=
 =?utf-8?B?RlhjdGpmQXl2WDI2dkRzMy9melBZWStFNXlsVTBTV0UvVXp0WFpmRnE5cjlY?=
 =?utf-8?B?bGRjL1N5SmExY3p2Ylh5YWxYK2lSMXNQbFQyL01oTHg1M2Nwa3hLUURNd1Bp?=
 =?utf-8?B?RmpDcEg2NFVtQ2ZqcTRnNmkwK1NVNnBWL0g3REx0ank4MkNhOEN6MVA2Zmh5?=
 =?utf-8?B?dHI2OUpMWDRMalh6ZFdib3ArZFdhcENrUGpKNFpLcUtSYVlWT29ValdXRVNr?=
 =?utf-8?B?NzNoZFhJS0VQc2RHUlYwYzk4ME9acks3cUp2UGgyajU5akt1eGRiNkQ4S1NZ?=
 =?utf-8?B?TmpsN1JTTHZSTTZycHdFdlBoWG1zL1c5R3pPM0tObkl4VUZaS3RQOWhBTmRG?=
 =?utf-8?B?NjRGSnRYcjFvUWF4cnFNRlJHMm8rVjhucy9wL29HVGlwWFlBbXBSRDFFZkhT?=
 =?utf-8?B?WEhvTENWczZUYy9Pd3ZuR3F0blMrQlcrbkpoR1VYZnViOExBR1E5V3YzVU5M?=
 =?utf-8?B?OE5lNGh5SUppOXRSWGU1MDUrMlVqbkcxdTZVK3BoNHNGdmpaZGhTcTBsamsv?=
 =?utf-8?B?T1F1aUxpV2d4Wm0zMk95UzZubjMxQ3V1cm50YTRVUTErbHNHQzJsaWVGUWNq?=
 =?utf-8?B?Nm9qdmRwc1YvZjZHVmp5bG9NTXFDYnpSM1htM1RnelNZeHFRNlhhWENDR01o?=
 =?utf-8?B?Q1BNbG9EZFdNNU9jNGZwaS9pUGpKaWNpbFJHZGU0RDJyRFhVU25pRGFKNFdz?=
 =?utf-8?B?UzN2Y1RFdUpVbk1QbGl1c2gxdmdyRENWQXlhNGxjQVNId2F2b2xTMWc0L3JQ?=
 =?utf-8?B?U0J3Wld5L3NxRi9oaFkxeVk1a3A2MHJsYTRXV2ttOS9RckpwRVVhNk91YlNY?=
 =?utf-8?B?U05qNWdpTWpEd3d6T2hrcjRveDlKaGI1YXRINmZyK3RZRm1YTWtIM0JBOEl3?=
 =?utf-8?B?OHBmMnNudTE1aDdjc3gzTDErSXVYVHJuY2hPSXZEcTRXN2o0R2xmenhlVTBL?=
 =?utf-8?B?VVYxblkvT1JtZGcrb2NRR2NrRFFsY2NDRnpkamlvNFFLV0oxV3RnQT09?=
X-Exchange-RoutingPolicyChecked: DqmcKURw1x7Jn1tY+Yv1RAFlZq/3ss0u1OiN5OeiA1VJfcmadCvFiBiEvr09njmJOP1PlRkWS4GumSsXNtuWSNC16qfn28wawJ03vkzzd3Y7BgJ8Hpfbj8fv40MNHCjyE8obZ3q5bB89VAojONFlV6fMMeLpsq3IPH4Cdikp++9E/ubJv2xDBTxy03l/Gg3D0An8K97QpcjdWbZXjH0yClM2mxH4SIyFO1KqhKRU7ouhEU0KQg+yLTYd1O/hQ3hw8R3nHGydfjF84yj/GvfUWbdNnZov7NB9hMx/raqc0fkXn4RlG9MCLSKeA94xhACfL2DQg4LX/cKVc7lXX1c92A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6cbbd6-0e9f-4a25-b06d-08de9bf1e927
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:54:03.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iH7pWun2AQ/SGrLc+JQVcskjJTE6oKUkooER6fwjDYIz4p6jUkCo2WCZkEuevtijLO1nRNeewdHTE6ycFBjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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


On 16-04-2026 09:24 pm, Juha-Pekka Heikkila wrote:
> collect tests into list and call them through there
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 315 +++++++++++++++++------------
>   1 file changed, 182 insertions(+), 133 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index b1c80eecd..98eb671d1 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -19,7 +19,7 @@
>    * Description: Verify basic content adaptive sharpness filter.
>    *
>    * SUBTEST: filter-strength
> - * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + * Description: Verify that varying strength (0-255), affects the degree of sharpness applied.
>    *
>    * SUBTEST: filter-modifiers
>    * Description: Verify content adaptive sharpness filter with varying modifiers.
> @@ -88,6 +88,7 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
> +#define DEFAULT_FILTER_STRENGTH		-1
>   
>   enum test_type {
>   	TEST_FILTER_BASIC,
> @@ -142,6 +143,131 @@ static const uint32_t scaling_modes[] = {
>   	DRM_MODE_SCALE_ASPECT,
>   };
>   
> +enum subtest_iter {
> +	ITER_NONE,
> +	ITER_STRENGTH,
> +	ITER_MODIFIER,
> +	ITER_ROTATION,
> +	ITER_FORMAT,
> +	ITER_SCALING_MODE,
> +};
> +
> +static const struct subtest_entry {
> +	const char *name;
> +	const char *describe;
> +	enum test_type type;
> +	int filter_strength;
> +	uint32_t format;
> +	enum subtest_iter iter;
> +} subtests[] = {
> +	{
> +		.name     = "filter-basic",
> +		.describe = "Verify basic content adaptive sharpness filter.",
> +		.type     = TEST_FILTER_BASIC,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-strength",
> +		.describe = "Verify that varying strength (0-255) affects the degree of sharpness applied.",
> +		.type     = TEST_FILTER_STRENGTH,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.iter     = ITER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-modifiers",
> +		.describe = "Verify content adaptive sharpness filter with varying modifiers.",
> +		.type     = TEST_FILTER_MODIFIERS,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.iter     = ITER_MODIFIER,
> +	},
> +	{
> +		.name     = "filter-rotations",
> +		.describe = "Verify content adaptive sharpness filter with varying rotations.",
> +		.type     = TEST_FILTER_ROTATION,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.iter     = ITER_ROTATION,
> +	},
> +	{
> +		.name     = "filter-formats",
> +		.describe = "Verify content adaptive sharpness filter with varying formats.",
> +		.type     = TEST_FILTER_FORMATS,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.iter     = ITER_FORMAT,
> +	},
> +	{
> +		.name     = "filter-toggle",
> +		.describe = "Verify toggling between enabling and disabling content adaptive sharpness filter.",
> +		.type     = TEST_FILTER_TOGGLE,
> +		.filter_strength = MAX_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-tap",
> +		.describe = "Verify content adaptive sharpness filter with resolution change; "
> +			    "resolution change will lead to selection of distinct taps.",
> +		.type     = TEST_FILTER_TAP,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-dpms",
> +		.describe = "Verify content adaptive sharpness filter with DPMS.",
> +		.type     = TEST_FILTER_DPMS,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-suspend",
> +		.describe = "Verify content adaptive sharpness filter with suspend.",
> +		.type     = TEST_FILTER_SUSPEND,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-scaler-upscale",
> +		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.",
> +		.type     = TEST_FILTER_UPSCALE,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-scaler-downscale",
> +		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.",
> +		.type     = TEST_FILTER_DOWNSCALE,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "invalid-filter-with-scaler",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 2 plane scalers have already been enabled and "
> +			    "attempt is made to enable sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_SCALER,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "invalid-filter-with-plane",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 2 NV12 planes have already been enabled and "
> +			    "attempt is made to enable the sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_PLANE,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.format   = DRM_FORMAT_NV12,
> +	},
> +	{
> +		.name     = "invalid-plane-with-filter",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 1 NV12 plane and sharpness filter have already been enabled "
> +			    "and attempt is made to enable the second NV12 plane.",
> +		.type     = TEST_INVALID_PLANE_WITH_FILTER,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.format   = DRM_FORMAT_NV12,
> +	},
> +	{
> +		.name     = "invalid-filter-with-scaling-mode",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when scaling mode is already enabled and attempt is made "
> +			    "to enable sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_SCALING_MODE,
> +		.filter_strength = DEFAULT_FILTER_STRENGTH,
> +		.iter     = ITER_SCALING_MODE,
> +	},
> +};
> +
>   typedef struct {
>   	int drm_fd;
>   	bool limited;
> @@ -587,6 +713,48 @@ static void set_data_defaults(data_t *data)
>   	data->filter_strength = MID_FILTER_STRENGTH;
>   }
>   
> +static int iter_count(enum subtest_iter iter)
> +{
> +	switch (iter) {
> +	case ITER_STRENGTH:
> +		return ARRAY_SIZE(filter_strength_list);
> +	case ITER_MODIFIER:
> +		return ARRAY_SIZE(modifiers);
> +	case ITER_ROTATION:
> +		return ARRAY_SIZE(rotations);
> +	case ITER_FORMAT:
> +		return ARRAY_SIZE(formats);
> +	case ITER_SCALING_MODE:
> +		return ARRAY_SIZE(scaling_modes);
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static void apply_iter_param(data_t *data, const struct subtest_entry *st, int idx)
> +{
> +	switch (st->iter) {
> +	case ITER_STRENGTH:
> +		data->filter_strength = filter_strength_list[idx];
> +		break;
> +	case ITER_MODIFIER:
> +		data->modifier = modifiers[idx].modifier;
> +		data->modifier_name = modifiers[idx].name;
> +		break;
> +	case ITER_ROTATION:
> +		data->rotation = rotations[idx];
> +		break;
> +	case ITER_FORMAT:
> +		data->format = formats[idx];
> +		break;
> +	case ITER_SCALING_MODE:
> +		data->scaling_mode = scaling_modes[idx];
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -619,142 +787,23 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	igt_describe("Verify basic content adaptive sharpness filter.");
> -	igt_subtest_with_dynamic("filter-basic") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> -	}
> -
> -	igt_describe("Verify that varying strength(0-255), affects "
> -		     "the degree of sharpeness applied.");
> -	igt_subtest_with_dynamic("filter-strength") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
> -			data.filter_strength = filter_strength_list[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying modifiers.");
> -	igt_subtest_with_dynamic("filter-modifiers") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
> -			data.modifier = modifiers[i].modifier;
> -			data.modifier_name = modifiers[i].name;
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying rotations.");
> -	igt_subtest_with_dynamic("filter-rotations") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
> -			data.rotation = rotations[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying formats.");
> -	igt_subtest_with_dynamic("filter-formats") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
> -			data.format = formats[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> -		}
> -	}
> -
> -	igt_describe("Verify toggling between enabling and disabling "
> -		     "content adaptive sharpness filter.");
> -	igt_subtest_with_dynamic("filter-toggle") {
> -		set_data_defaults(&data);
> -		data.filter_strength = MAX_FILTER_STRENGTH;
> -		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> -	}
> -
> -	igt_describe("Verify that following a resolution change, "
> -		     "distict taps are selected.");
> -	igt_subtest_with_dynamic("filter-tap") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with DPMS.");
> -	igt_subtest_with_dynamic("filter-dpms") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with suspend.");
> -	igt_subtest_with_dynamic("filter-suspend") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with 1 plane scaler enabled.");
> -	igt_subtest_with_dynamic("filter-scaler-upscale") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with 1 plane scaler enabled.");
> -	igt_subtest_with_dynamic("filter-scaler-downscale") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 2 plane scalers have already been enabled and "
> -		     "attempt is made to enable sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 2 NV12 planes have already been enabled and attempt is "
> -		     "made to enable the sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> -		set_data_defaults(&data);
> -		data.format = DRM_FORMAT_NV12;
> -
> -		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 1 NV12 plane and sharpness filter have already been enabled "
> -		     "and attempt is made to enable the second NV12 plane.");
> -	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> -		set_data_defaults(&data);
> -		data.format = DRM_FORMAT_NV12;
> +	for (int s = 0; s < ARRAY_SIZE(subtests); s++) {
> +		const struct subtest_entry *p = &subtests[s];
>   
> -		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> -	}
> +		igt_describe(p->describe);
> +		igt_subtest_with_dynamic(p->name) {
> +			set_data_defaults(&data);
>   
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when scaling mode is already enabled and attempt is made "
> -		     "to enable sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> -		set_data_defaults(&data);
> +			if (p->filter_strength != DEFAULT_FILTER_STRENGTH)
> +				data.filter_strength = p->filter_strength;
>   
> -		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
> -			data.scaling_mode = scaling_modes[k];
> +			if (p->format != 0)
> +				data.format = p->format;
>   
> -			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
> +			for (int i = 0; i < iter_count(p->iter); i++) {
> +				apply_iter_param(&data, p, i);
> +				run_sharpness_filter_test(&data, p->type);
> +			}
>   		}
>   	}
>   
