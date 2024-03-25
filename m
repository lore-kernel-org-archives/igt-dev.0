Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65D3C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBDD10E6EB;
	Mon, 25 Mar 2024 09:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvGVUZhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3D110E6EB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711360641; x=1742896641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bxXYJRQnCREW2qtqgidJlsvE48AY3WQqzo8VZ0iYTcY=;
 b=cvGVUZhqNp8g40KRtA6xIAgrrbHLFdf5IahNAip2iUctv1DKuKqh9odf
 uDwplc0neHRs7cae/69NBAyb2QEleKaHcYX+54fYOc0v99paA9LkOU62R
 gct7nb1DHE71E4jKGpfR6OB8EZdGF9f3u0tyOh4lU8h5ohWGfcjfgc21W
 MV+E0OarPe3D0ztQGtsHh4NBoPBWAJ7N11nc6E4PBZMcjxWoc7NWUlQRO
 F0/MCLoVlp7qyTBBYLTyQaFLc+We8tx/4wcOFyYZFEVdJdAn3rbOzK1Zu
 vtGSVc9gM4yBHvMIZvqhG0r/puFrqDCs+m8SHnlXkMI91kSDuQWYw8HQC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6951515"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6951515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20243371"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 02:57:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 02:57:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 02:57:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 02:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6qgNo9QLK7Wo5AelkgvpME0XU48plwcms10O0HY/yupG6SaSZQAEXjP+0hdwbKMoQgIiMJ8xxWnIw2HKUypicJq9zy6kPVY4mLPPZ9LDpj736Sl+kZR89tr9jbAV/xNrRMKB9L1fg1ANVrbxrWNS3CWWf2RZPfKdBN+1k8yD5LFh7TzglL+T4kQbLnZaoBRZwGXNX4KEJWb3EC0V/Y+cKQPWt4aoKNc9bseIyIXUhdPB1jVKPccjvdeyYmWyhEULBeQG2A5Cid7bSWGLTKiI3tQ+zPY9TEeITiBc3YoKUXFHj2Le5h2oPB8ZD4jiz317iNjgGXUNBWTXWRzMzUerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpBJzJFD5OgOZu8LUpaIdjO2IVaodBalWgro3F9iiZQ=;
 b=NEpJfrQagk7q9F+MvOhaMgPxHRmyVHQYbnkQJtGyn8n8gGq65fWy7NZ8p4W8Ab2ynop035qjXfb2nX/weMFu49zF5Vs5gzZnlLIeCzhuxuiuXSK/F373+nh5fG5smc0ieVKaD/5u806h9hZlQscew8hOY1uDf+JLADqsxmqxQ7BRmL9YeUzdNL/MFfireoAR4KuMEYpZndbUBGm2FY6HUGtwOWUo1Ckemu3/wdsnKQBlag9rI2y9zgJjCaL3CrkeBNKCpsPAWUgb6JQPrOy5N/uNiVWp5MqtBVJ4MVUmiEVPY7K9d8DFNYgIHEWaY5YEBeInaD9beR/Mr4992zLomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 09:57:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:57:17 +0000
Message-ID: <5140da97-6891-4c71-a71c-2f5dd361a9ed@intel.com>
Date: Mon, 25 Mar 2024 15:27:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: move bigjoiner_mode_found to lib
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240321182831.1143175-1-kunal1.joshi@intel.com>
 <20240321182831.1143175-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240321182831.1143175-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cd3f84-accb-41f2-cd50-08dc4cb1f470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDBMtVpEp/9U1x6Aq527Js+V1cLoOVGmDqG8tSVP9kG9/09fC/I3QydXEUUe3nrVIt6HIMmx+DC0sypTFrBrPRBae+B95z8F0+LMub/Hn92vr1i5KoyPWcrH8Vm+ZACfn8B4w8W4bNDYrOSGMKehF0I1YCm5xgg3V1NBX5izwPe63g6Qb/Y7OCuih7Ecxdlpf6NN3ziM18mrxdmhYmU4h17FHF9hKHpoNTt+CVlD0Jqp1r+D1W+euKwferB53j7kciy6ulxwAZyC3d/J40zSBZZQJBIE335Tq4kMFqcuU7fypFIcfCYOiJAH4fLQbWpzX9j0iGPoNZJaiRzmAsHf6xEfqTe7WWDDvqqtbm6SmspYkx8odNwwqk5I18tVhpFQP9FCFtcjG39IdmxNtnz0VnFHQRHppey3dnJN9FjG5mM1Te4UkTz9GxL1IeqtNroJcjYf/0fHS8LII/XwhQua5sUCIg4NztMhoYTAW3nXoM53kJ2j6xBA05dtf7wgqzgge/hYSiiA4bH4nSgTOC3rdFS0c7QZIsNAmkYtHAizfVnFhmfDPes4t2mg1g8qYF4nAhCQZuaO8qRJ4LiM8Fv0LUyNvIVVM8rbmeXxbGIw8o9c2GFCFEvQrtNUsfD8Np5W1GkteXCC8FMxdM7z3kc+G/OUsr8VZ3b6RsBdZi/3wYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWYyQkpPOExxNUtoVG80QitpUUVMVHNrSGJSU2MrRDF2akZnclZVS21Fc3Qv?=
 =?utf-8?B?a2VERkw0YVZvSEN5ajd2dHpCcFRNL2dsNmtRekhDTG1Cck1qNXFKRWxRcTZa?=
 =?utf-8?B?cjZhSnhvNEw4TVhlZEhaVU5jdnVuNDNFdkNhUzNHSE1sUFpxSkVqcDhZSDJw?=
 =?utf-8?B?dGlGMW1zVktVSmE4QmZ3Y3c2Rmo1TFJkQkRFU1M2dC9sZGk1RWRxY3E3cWMv?=
 =?utf-8?B?ZTlweFFKd0RmbDd1UndnaCtJbEJVZ0k1S2lBQU41ekdjOCtFd3FSbHgrU2dK?=
 =?utf-8?B?TmJ2Y3JUclB1NGxuZjlXVVpyZVV4RFJkRUg5aUtzMVB4allqSS9YcFdIZWlr?=
 =?utf-8?B?L2NjVlpyK2IvNFFoNWt0MFB1VUU1cW5ucHJKYU1MRWJUVi91bm1DWXU1L0tE?=
 =?utf-8?B?RWJrR0M4c0dkREtGcmFoeHV1bFpQQThCWW5KYlBZdzN2L3RSYktOa0xhRUFH?=
 =?utf-8?B?ZEpNM3d2ZTZDUFM4Y0loTUpuYTB3UXkvWS81LzcyNHZoNllnZU04K2xIY3Zp?=
 =?utf-8?B?MkJ1eUNQcWFlTU9CdCtUdU5LenBKR2t0WlpUYzgyQVVoNy90Z0tYZDFqMXNE?=
 =?utf-8?B?bUVMV2hTQ09TNUkwOFhvek5tTm40dnBUUTJwVVpQY2RWN2JnUHJMcFc4KzIz?=
 =?utf-8?B?aWlkWEkrQi9QWFpBTnJuS0crNUJMeStJdGlXQnRjaDliSC9hUWVOb0ovRi9G?=
 =?utf-8?B?elRwUllzVCsxdmJ5ZUU0WERYeTBEWWZ0SldCV0lhS1lMWVErR2tzWVVaQ3V0?=
 =?utf-8?B?Tk9CRllMZnNod004dlBVNVVWa2xwSWFFV0JKSE1mZHphK1hsZGNzYnFTb3dJ?=
 =?utf-8?B?a2F4QzRtUzZIVlY4eDdoSlJNa2EyV1Zac3ZnQkQ2ckVLVzVleFFVTXkyOUo5?=
 =?utf-8?B?V0xyK3U0S0ErWnRzSlhEcTFvMjBiUElnRnlmVGZHVEJtUXlIMit5NDJybzZN?=
 =?utf-8?B?NklwTnc5WXFxWGtUZFg1OWd5ZW4yODhveW54MHZMaDc2KzRvWTljQjlNdWJj?=
 =?utf-8?B?b05HbWJLMnFJbDVJaVcwRmI3cExPN0dzRUFEMDBMbHFva0ZzZDJXT0xRUEll?=
 =?utf-8?B?SlFHQVVFMzQ2MWJNcGlVaGZEMm9kUVdIekZnQVh6bzZxRFlYQjJyNTlFVk43?=
 =?utf-8?B?cHpvUmpJdU5Ianp5NG51MS9keWhjU05wZTJXd1JPSG5nSDVQL2pmVFZyZGM0?=
 =?utf-8?B?aGszeTJlU01vNWYwczNSUXhZNWhHU3FPVlEzMENLbFVsYmlra0pWTzFLV2Qy?=
 =?utf-8?B?aU9tcWJhbWVZeHNZd0ZieGNCY0RrQlh3OVBmVEJtaTVDTU9BdllnZmJEWGNO?=
 =?utf-8?B?eWlzbjRaMlJlVVIvNlVOaUVBZFdYckIvZFNicFRHMTVaSzZHYmFUdnF1dlI4?=
 =?utf-8?B?aGV0dVh3S3hyZnBTQ1JkMXNoVDNXSDNNUnNmMzJjYTh4OEo0M3Z4Szh6Wk5Y?=
 =?utf-8?B?RTQ0R1hlT2gvVTkvNVc4MTd3d21ua0hnclZFOGVISlkwNFBYamM1NmgvTXJq?=
 =?utf-8?B?R1lETEZPaGRNVldQTzBlbHFiZmxuMWRKZkRQa05KRklpRUp6Y0hzVmUxRitC?=
 =?utf-8?B?ZzFJK3EzZ3hCcE8wSnpKanNvbHJHa0MwejVtOXBVdWZmODArN2FydFowMnRL?=
 =?utf-8?B?cy9LSDFPUGlBa1Q5bGNMbEwrWDNCSUxUQTdZSFhnaDNZMzRjbjk1T2RQbkVH?=
 =?utf-8?B?Z3lTZEEzZzhGT29sa3FkWE9QREF6TVVRclZNQ1VzYy9oczkwVmxhWjhtWW10?=
 =?utf-8?B?MSttZFBhSE9VdU51Z01xaGkwM1BHMVVHeDVteU5ONk9RT0svYTFjaGVlREl2?=
 =?utf-8?B?U25nenAyRStHNCtFcy9iZUJJOGl3YUtJRFppN3I3ZFVuQ3EzR1FNczhud2Vu?=
 =?utf-8?B?UXZCK1p3SUlhMFk0UjRRdHBFemRLS0FsNmtKS0RMZzlZVktsZ3lQUmU4cms4?=
 =?utf-8?B?eXNISDY3dWg4Sm5YK0JVWUwrTVVNZlpteGhzS1J3cnVNWnRKSFc1WC9KR0k0?=
 =?utf-8?B?SlROQ0FFQ09VdHFJZzhUd2hZQktjRit0VHhXQVl2aGlSZVdZNXpnVzJGV09E?=
 =?utf-8?B?U1FRTXZjeGs2QURoRXhwWmNWNDZsWjB2aWd3d1pzZDMramM1QTAyY2U1WUll?=
 =?utf-8?B?SmhpU1Q2RkpwTWtVem45dnZaV1l2aHJMdjNqeERQbXRkdTRrb0tFRThGQnZs?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cd3f84-accb-41f2-cd50-08dc4cb1f470
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:57:17.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YE9R2WNOVvs9dd67N8K/LwSz+Vi5TOTS6v21+Ooa3KsjVP17KiAQgW9RlBib00GrmsoN2iPZoVzL0wsXEojlWHBMCNJkszqWh9WZTYL7Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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


On 3/21/2024 11:58 PM, Kunal Joshi wrote:
> move bigjoiner_mode_found to lib
>
> v2: correct documentation (Ankit)
> 	fix usage of mode (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c                | 28 ++++++++++++++++++++++++++++
>   lib/igt_kms.h                |  2 ++
>   tests/intel/kms_big_joiner.c | 14 +-------------
>   3 files changed, 31 insertions(+), 13 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e18f6fe59..ff08b0eda 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6143,6 +6143,34 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   		mode->clock > max_dotclock);
>   }
>   
> +/**
> + * bigjoiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode

libdrm mode to be filled

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> + *
> + * Bigjoiner will come in to the picture when the
> + * resolution > 5K or clock > max-dot-clock.
> + *
> + * Returns: True if big joiner found in connector modes
> + */
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode)
> +{
> +	bool found = false;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	if (!found) {
> +		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	}
> +	if (found)
> +		*mode = connector->modes[0];
> +	return found;
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b..0fa7a2ea1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index aba2adfbe..99b1b898d 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static bool bigjoiner_mode_found(drmModeConnector *connector,
> -				 int (*sort_method)(const void *, const void*),
> -				 drmModeModeInfo *mode)
> -{
> -	igt_sort_connector_modes(connector, sort_method);
> -	*mode = connector->modes[0];
> -
> -	return igt_bigjoiner_possible(mode, max_dotclock);
> -}
> -
>   igt_main
>   {
>   	data_t data;
> @@ -235,9 +225,7 @@ igt_main
>   			 * Bigjoiner will come in to the picture when the
>   			 * resolution > 5K or clock > max-dot-clock.
>   			 */
> -			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
> -				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
> -					true : false;
> +			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
>   			if (found) {
>   				data.output[count].output_id = output->id;
