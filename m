Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B87AC04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 09:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E038A10E809;
	Fri, 19 Apr 2024 09:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtmefU3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292C10E8B4
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713519756; x=1745055756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wYivmBhBn0wlOBxTLkv+jwsv4sg5dQvdEMP0sGO5Zng=;
 b=PtmefU3iYZ9htGFB2ennWgreZSS5Hoi/E1ASKss6uWuG5rUP4+naOop6
 8NVpt+/dvFd+8qo3sqp8LEXc0YfLY6b24kPmdjk9ecb13Fl7Fjz+Pvv6k
 TDWLTqwV4kxK7/Un9YjDBDi98BdoT3pWH/PAWKdIIgELpFqz5eQ9Meow/
 qkHUIA6WvvqAUmb3dUeXrRbC+KkMzHu2M4G+DYMRrjgMf1wjyLORxO9Nm
 +v/d9UhApIB0aaiAbncrH6tFmA/wq9Nu/1eno/n4fktpCIRWHXnDJ+Tm5
 houKNatyQZM6X1PaT/vyCLSK6jlXhGEtPI0e15B6AM4gfsbzsthUfJFFn A==;
X-CSE-ConnectionGUID: nd4s4U68TFuXX0vHBbP/yA==
X-CSE-MsgGUID: 4At0nm1jRuqc8zxi0eHsng==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20254850"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20254850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 02:42:36 -0700
X-CSE-ConnectionGUID: SyHcGHkpQLq7uuF8OeHG4Q==
X-CSE-MsgGUID: ch0gczlnR5icyzXtVbPJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23143073"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 02:42:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:42:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 02:42:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 02:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwGJR7dVN5gfl9HIsOkZd+NlvRHIU0P0lBHZ1JqmPRS+p+j0haM7lIYk4aEBfehnurBcupoBPjvo+nj7iKuPSZJ8OhH1BMseyMWpe5+G9qlj5jckxsdAQBsVnjWcPsbHdLLPx9YgxlD+N5iXWpodaDLAuFJ4Wy5oGnbQgAT0/+l94bMtOm9jD+Ire3coPR0TKH5teeOYIIeSy1i5IMyokOCNPvPyc2MZQIN1wuVPLS2pbV9h43jqddAkZRbSKizefpc0KLrUY8+9eDHjq8c/xBuoNMSN5zFXyPE+Xne+5DCpmswNcuTg+HCMN4oAMypKFhASZHwyjYD5Nv/+50wIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Q/Ncy5sH//WWRVRIZxkoVyiqM8rEVcXkxJd7vv3vM=;
 b=K8Rv8gvXTUBO1Vj5FcbQtXAufgP7d3opSs1ZSU0sOouTat/vmyoWgrl88FLrEll7s2u7RsXM4ozrmP3rkh2Nm55iJhqpd5b9xwOBcv/wqFj9ilmRJ9CumiAQb5nIq0yVCqhTSnUt9io8Z1U2lsP1/jRDfkd1eHCJUzOfQ13ED6RL+tD3TWmmHMda5Jgio20BAC1c8oQ/fGRBCcba6evJIXzMR8c6tOoVabY9ncr1GHgVVVHcWQMXw6WtGj9l4PqHnPA4LC8oD6i1HqpW/eq+6b+Znbvjw4f5ifQfaziFnNg8Bm9n7xJFYFIG0iSdB0zG0jfKQSUaiQE9km7AyWUV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 09:42:32 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 09:42:32 +0000
Message-ID: <9a812b43-e644-4da3-9b71-5d7faee6d192@intel.com>
Date: Fri, 19 Apr 2024 15:12:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] tests/intel/kms_big_joiner: fix crash in multi
 joiner test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240419064001.2401850-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::7) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: b84b0422-53b4-404b-dda1-08dc6055091a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: FkSbgEN07wSyx6+epY9DtHMWRsfipTdeTSWqQ83LdlSMQTKWdpsKY8YYysxO89pDWut/lqvrSgpXv+q6kXlrBOMG0LHcQfXdzogFDlaUhA5/nBv2LDpCTqEOlBkdyQefPjyJscsQ1VDBGRH3oE2hxzymVxoE8x4PodHR7juXsB/ltSURzmHfUDY2/Y8seht0h/0Xm83b7GmRC+uGGX/BzPyIF7tYupnekEzCnY4aD75Wzmhydbw/9sppUdZJAfs0qOG1otjVgzkjUIdZpaFnUw1CwepfE75U1ppyn+6uK9Ep0YYa/wUksPvAFodbsy5PzVnnGkUj2SpOafIF6JHtTg/pBMvAL+LhIa8CTeAJ4sO9VgvANo42c4MKiXtyaghGx069hM2c+ouHFliFGCyzwMUtH815baOyIbSGmcuMLdneKZwzbCXZVfaJzbK5AZSqxxg0U4QlBs9nLOvIB2UfVngFewwWCYeS4x2E8OY5AQdlPK7bF4/onwGb3J18ewth9H5v9IbH+sY5arL5i4CglEKgO8tbTcSGsuH0r33e+xnCmxskdQlMd7Cr2xiKbi/Ml/p8prAb6uB1/9bfLmweFQo3JwE3h1cp3KQg2f729NEvES5SJElUdEtEIrAgnmD4BVIfiI4jfYOgx6hi4qkQRGFHsYx511XXTBnLeamk7pM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NBR3lIMVFmRk9zSE95UHplN0VhdUlTSXRUSW4zYWo1ZU1UMnJVMlVvaTlB?=
 =?utf-8?B?T2tGNGt3R2JVY0VIcWNRZWJlWXdFSjRVd3JxZkRpcGF2ZU1yNUlYcVR2b3JI?=
 =?utf-8?B?TERJZXplQ05JL1paN1Q1a0JRdWMrMmV0QkVDUm8yU0x6OEhlTXVMeXFDN3p5?=
 =?utf-8?B?emlBN0JRV0hSMHdaTkc1Z0hSMTgvZHRrMU1LZ3dua3ZidjVlOGE1TTRBcWhu?=
 =?utf-8?B?SVg0YkVVdVZFWFpnVjBtUEdGeDdPSFg5dlY0OWdNeFNpR0IxVnVuQ2JZNnhU?=
 =?utf-8?B?Z1o0RGhaL1R6Zk1UN2ZIV0g1V2ZRZEtVRTVCSHBpRXNDakl4bk4zZ3l3TnhF?=
 =?utf-8?B?L253eW1JVStXZ01PaGl3VlFpVUZRQ2JUTzVXYU9Kakw4L2lkNHJMR1duYjZF?=
 =?utf-8?B?Nk5hZmN0TnRUb0lzejd6dEptU04xUEpyZ0JMYkFOVFRkOGJGc29nSWFHcnl0?=
 =?utf-8?B?QndZMC9DdUpsVTQ4cFBVOTBsK3NVV2ZYUzgwWW5QU1pYc1dSai9Wb2tSZVhZ?=
 =?utf-8?B?ckw2azdCM05jYnp5bi9PYXlnL1J6bENEc3MzODZlc0ovNTVPQ05CWDNJQVhQ?=
 =?utf-8?B?YWErTk5rNm1FdzNscFFhSithbDYwWndQTVNxOW9LOHRiSzhDUnVtN1c4TWhL?=
 =?utf-8?B?L1N2UXphbHEwLzR5bkpvR1ZaeWl3czh0ckppTWpmekJJZjlhYUZDTzhhaVZK?=
 =?utf-8?B?YUlsU045YVNGSlhoWjdmaVkvNUh6VmI2d0VaMGwyZHM3SzNxeE5uR0RNOGlr?=
 =?utf-8?B?Rm9sbk9mZ25nbDdvZmRXbExyL2dyRFhZdHdpdUNKRnpLWXlqNGk1RlJDWEhF?=
 =?utf-8?B?L2Z0aXJHNFZoNjIvK056MEZJKzhlWjV5NmNMYWpERlNxSGFzVnAvQm9nU3By?=
 =?utf-8?B?b3VZSWR2ZTlIMUw0eGFzd21DVGJudm1KcHg2bHNJSVNLZzJoS085bFdwRjZE?=
 =?utf-8?B?VSt6ekVITTJDOTVzQi9NTHg0Vkp3cGtFWEYwQVc5TzEwdndhOXhURHFGT0do?=
 =?utf-8?B?TXZlRk1zRkt4TlZJTmRQQ2hLakJQdThjQSthMzVNMm1EaDdMczZzMWdidEJE?=
 =?utf-8?B?ZE9GVEwweG9hbmZoa2tPOTE5akZ1c1ZwS0F0TDUzdVBLY2tLeVlJYUtPV1NB?=
 =?utf-8?B?Wnd1ek1meUIwbnREWTEzaXJMa2Ywc0duVzQ3c09aaldGaXQyVythWjBFaVRC?=
 =?utf-8?B?d2lJVHhCVmhFTVM1cXpnSlZFRks1RmwrUFFUWkFuMG1BbFhiOUx5WUJMdmRm?=
 =?utf-8?B?a2RYMHJVZWIwblRuMWZmWlRxWlJRTjVxMWZVRUpzUDFaY0NVMmdlTmoySmVm?=
 =?utf-8?B?VS9IT082S2cxVU9VaTM2ZFQ0UDF2TStZNjRXTWduUjFuWS9DODh3MXpaYUxa?=
 =?utf-8?B?TG9WV0w4V3NHNDRNOEhucE5pcjlyOU1BZDI1NE5DZXJBOXpCWUc3WkUzekZM?=
 =?utf-8?B?SW9VcmsyRmF5TUk3U2p0c0V5bC90ZEV2YkFId3ZrdlRCL0x1c1d2bHlBQjZE?=
 =?utf-8?B?WWIvSE9RSHl3ZUdUZXdZdU5WTDlDQ3ZNK3RwWXU1bE1hWGlsRXp2Wk5XWDF3?=
 =?utf-8?B?dUcxWlpaVVZyNlFZTWxNL0QrWWhEMVdQTlVKUHVEOXREWFpyQVV6Rmt5TUs2?=
 =?utf-8?B?SXpISWJHY0xUMWhxNDR2ci8wZlNQWFEwOFpnUS9oa3l6MjJEY0lMQnRyUVVu?=
 =?utf-8?B?SWI0NGRzQzRUTTBrL29OdElrRzBJZnhhemFzS0RtRkpFMWtYNTFMUHVvMjEy?=
 =?utf-8?B?U0xSSnRqQzE4Y3RtdTZkWVdRWDJnWEN6Z2dUcVIweHRNVyt1S3ZRZis4aFdi?=
 =?utf-8?B?VkFXZUZKM0Z1UjBZRG5mMlNFZXFWZURFQk1ycW1oU0UrMzNhODdCeENzLytk?=
 =?utf-8?B?bWMxUW8wakRUTjZKNFcxN0J1aTNnTExuY2Z3NDJJcVN1NmlSZVZMb2VkZi9p?=
 =?utf-8?B?UTdFWkhGQjBxUDVaTXMzT3FFZWdURisrbGNvSEF4cmR3RndQc2kxV1FZOWRm?=
 =?utf-8?B?K3FFQWZ4UXJxYnFpL2p0Q1VwR2R4OTZseFVCVkZycTZVZyt5UkhHWUVPaWp3?=
 =?utf-8?B?bEFGVm02MWVkRzMzLzFxVGVKMGl4akR4MUdzemV5ZEFwY0pyNng5YXM4Z1da?=
 =?utf-8?B?WTVwZFgwa1kzbHRzbWIxZHRyTi9oNjZ5QU4xY2tDRFh5dzMwaG1sQWtvdHl3?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b84b0422-53b4-404b-dda1-08dc6055091a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 09:42:32.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll9G/fv7OieuFTzGmjTMxiczBh1NXgwYZwukZDg64RqaEXnseLXbncPg+2nZebIlr0cKYabhfLuADU9Hfw5SmUfCxzPjoQ+82tf3r1aiURs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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


On 19-04-2024 12:09 pm, Kunal Joshi wrote:
> Fix test from crashing on out of bound.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel/kms_big_joiner.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 078f76ac1..88923be6b 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -162,7 +162,7 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
>   
>   static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   {
> -	int i;
> +	int i, cleanup;
>   	uint32_t available_pipe_mask;
>   	enum pipe pipe, master_pipe;
>   	igt_output_t **outputs;
> @@ -173,6 +173,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
>   	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
> +	cleanup = 0;
>   
>   	igt_display_reset(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -183,6 +184,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
>   			if (master_pipe == PIPE_NONE)
>   				continue;
> +			cleanup++;
>   			mode = igt_output_get_mode(output);
>   			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> @@ -195,7 +197,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   		}
>   	}
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -	for (i = 0; i < output_count; i++) {
> +	for (i = 0; i < cleanup; i++) {
>   		igt_plane_set_fb(primary[i], NULL);
>   		igt_remove_fb(data->drm_fd, &fb[i]);
>   	}
