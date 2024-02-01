Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08669C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD3710EE4A;
	Thu,  1 Feb 2024 14:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQTJIKzX";
	dkim-atps=neutral
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 14:16:42 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537210EE4A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797003; x=1738333003;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=eNcnIhJnSwFJiC5gK6f5Qptr6NDR6keAc7wehwD5MxI=;
 b=DQTJIKzXQKSwv+X2q0X0wuQZfGMhft0dUMsN81iJr3kEJx8rJltL1Kf8
 vH64NoJ1pJ9fDdFkuuTp3/kO9vdJJR43tMoj+MOdqM67HJ/qlCuTaSkbt
 ZRujoA+gRHthxNh4vz76H1JWVUlpQY/34F+nEMjGFQLAVI+PrKJGTxYe3
 BdEXr/Kq7u5ulXMMIYOxnToSq/zrVaf2/1c5MO0gv1E7w326W9ZgdhAQQ
 1FM5U+RoWcgffIYAmJhKBep1BPsX1w8BpR/BIQGD5y33JgX017ggZSt7l
 ibsvojyOyxKAQfsL+x5WBSnPIzdloGvRWOR7vXNoVqH1gM+B8JzUcl3+0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="100071"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="100071"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912134312"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="912134312"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:09:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:09:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:09:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:09:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7DBE3sttTZ6Q7rQneds3CM81Fq1ZS/Qe8GT5ITCPxSodZ5NNMVUfkITd9QXSoWhXiHVdcOIBKHYijsQT8uX+kZDSsRghH+Rt7Crza9oChxRIV8zKsildO5VzrlC6Thunbb0HHnqGrDdukwi5HqEs6b78AJEbxcNDUuz6pdaE0lywE3keXoKjIyOgqdDdP7l79uWWrW14xvSbr5zh9uMwUYi9qifUksS5icscsB1fuvOkxsgfLzQCX6XURrmdslu9jVeG9dTSubtCGHYrfzkaPMqe5p4YVySjrEzKG3lB555nF0hgNLJIdPKix9sd4UDiLNKMJHxX+hWei2xjXur+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN7AbOq6C4h8X7pcqTt2gAQjMPI24FCNL5VB7mYfC0I=;
 b=b8eo7qZBLLqgJZGPI2j9LWEOSEs082tNbUUSysowfpgHJqyp07kvUNSz6SufWoM0XVJLWBrk5CFb9D/TDvhtAM1SdmwB+J5qXjuf74uttYvp+cTox0RtWDxmlLgh1v1d3mwL6+f764mci4SFaN4NAZchZUgyP6AmniRMyla+Cq/ubs0XbBFa6T5Ir0zK0LQDrKvhcd/l1SmoYiu0dBuoX1JlomZmiGYK7/5aZmmUlsHtV3/xAKa3pKLhCj48k1mo+ofXDoGjlagmFfRYmfFccz/BQj+2DITcIp/YuKph12L0/g4r25oQx9CCTSliSzSLMhhidfarl/RPiW3jKU5DzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 14:09:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 14:09:34 +0000
Date: Thu, 1 Feb 2024 08:09:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Message-ID: <4givrfsdv4rnga6f4ezqp27huz5dvlgxkb65wmr2j3hx5yh3vk@wbi7soq6dihy>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-2-lucas.demarchi@intel.com>
 <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5c485f-d66b-4cd8-659b-08dc232f6ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHFybu17em2xt/3A2Hhua+o4MTehYLdd+bA8ULRpsjwTVXofu+qSoXU9yewrrdhAm6xWjgCsKsWEv4EwlgdVuLnHDybv9TkHQRpK9OdMGNY/Nd9z9j5wx7fSe6UbF3oyt6+mt8g5vc437q+q54fjHAqxXg/1QM7fqWSoPgUFhIWm9k1w5Z+omVaDFsUfArf/2y6SWTEo5ch73G/0jZI9v1UJ/OwChpVmZmOTkOMs8ZxxWlsQuxBl1mTRC5MvjgHtPAE0ZG5WuNjiE/85e21TEJY0ki/NhwpAdCeYlYCNptdr/ngCv5C2DDKoEDIQ90QZd43urs/LVv1eB1YviY3O2aEMmoyfjyml0nf9CdffcRhvdUS9cfKQ8KzQG9+uZQA4ud8ge+ADxzP1j4QLja7q07yabdG/51VJyCe9E9/u9sHh8aN5tqg4krr78J/s6cL34PGJDSNB25lp8H+O6deB/wTebc0IIMVz44XXYFU7INxO74v/EKbd10Zotaoc1nRRZlyxlVtfX6nlD6bJV09CkAw4z1tUc8uUijnX0VL3in1ZZrKvtFgJZ7fmguy0TCQA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(66946007)(8936002)(2906002)(5660300002)(8676002)(86362001)(110136005)(66476007)(316002)(66556008)(38100700002)(9686003)(6506007)(478600001)(6486002)(6512007)(83380400001)(82960400001)(33716001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LPkSQAGdFuJlfVj9vGWuhy3JrF3kybCDgYV51yq6XgST9qoc4Q2+qACE7eir?=
 =?us-ascii?Q?lS8VM4uwIJ8UYVjsdc+9xfJg1Vy02z1auamH6TrSS8H9EQbw8LStpAu0wDgf?=
 =?us-ascii?Q?bCFQDlo+Zy3NwxdB3ePP37+HZpfhpnqt3SKgzLEfD4L+arwAeM9kA7FW5ryf?=
 =?us-ascii?Q?OaB2Hb31FYRTDDBFfXRJIfVkHgT23fLP6Wzma8N3uhBAdw4DkZ3f2swz28sw?=
 =?us-ascii?Q?J6uBFf0shYlg7rMK+jjODc5e73uho7HGk1UPF80pZHoXKZcyZu0JbkMDWP1k?=
 =?us-ascii?Q?QbWLRbaCYaO5eSSAlNVeEImMIzWHKd8TQdjULJPTwoezW7TVP2TJaV+pnNPM?=
 =?us-ascii?Q?4xQBLSQc4wa6j6ApfNfCNi7mbJgEVLzW8x7DyYIv6eE+MwEHUJvUxjwIesbl?=
 =?us-ascii?Q?CwHtkdvP/GMNBmiwH2sXgveUML3RIa0vk0WwgE8ojildLT7F2AHV52osT8nO?=
 =?us-ascii?Q?CF/+ghvxJJouDJxDX3PRVHcxdyb8zVbgCSh2lko8v7P5DZgghrAI7trJkOKq?=
 =?us-ascii?Q?T1xnhTnN4EWmTlO0e+Vtuoc13JT/A5TfM4QRJnCVNI5W5Xhq72B3LvVXvIJI?=
 =?us-ascii?Q?z7jGUvoeTbLhnlNaeSE6sdCoK+9o1ebyktWiSBQQs5SZ59V5bxrgvRCDsczo?=
 =?us-ascii?Q?qBnRifnP/JqF28JmaMmscQPGheMcYYB10+xnFB4f3l9ndYQMY9SCn19RdSbr?=
 =?us-ascii?Q?r+Wc5tFInj+DO3UrPS+MiKlthYpQmsb/fGd08L5PjMlcarOBP2hGktnLmBCd?=
 =?us-ascii?Q?0cuxclDkxDT0LLgCKbJlj/XAGfgLyQdQIN83FHFTzQSMFHEjnKQy6llqFIog?=
 =?us-ascii?Q?UbzSO30xGj1F/Ct4mnx9gvz4mlB0ZTsP0WSNtVQbb6LhXFs9ejTjnNI9SmMs?=
 =?us-ascii?Q?p9XVlO3TdNBX4FCcGMM1rJbEW2R6OZBbmyc/+ONLZpwLmv4tav6val2rGa6d?=
 =?us-ascii?Q?+3HynC4rDIHDXtdGIPPq69pkrNCHcEQyXh36dDVaL5TPWiL337CpHiLb9mWY?=
 =?us-ascii?Q?G1L2uWQe0zdJuCPx45qCA78id1rkIOq7Y+VT+vNkzytTQCkOiQ86BvuzbeB1?=
 =?us-ascii?Q?lqHnGCSQp48k/GCqihpyImYw3pOudcZyaqu58UXMskPIdtyfkktpnMwJalFI?=
 =?us-ascii?Q?caa73aQi1kCwwh9x+pCdEf8usgroUCO2YGpfdh2Yez2Z8Hb0mk5O+YOW6VoV?=
 =?us-ascii?Q?cn50KtCcouqbMgEX5fZnmltguOuns8ERuSBWK+cTgm984ueLGMDkL3+EBEJ7?=
 =?us-ascii?Q?p2oEKNgzPeZ2z8kRDRlT9jIMaZ5ta0En41FuVSgYaTW4MO0cNzVRBwatacl8?=
 =?us-ascii?Q?SJFV3wR6un78UNXzd9Ku0/Ys7a4IQFoyCUyfxadzxTa/CAoa7PRM/6wkUXsv?=
 =?us-ascii?Q?nVAxASREh3MLU4CqxcUO9ZNwRYZApm/jZO1dNaZnOce+aN7k/+xAq772hM54?=
 =?us-ascii?Q?pw4/ItVO+sJco4weBUQy9Nx7Pz8M56bSZqtugsdhb7T0G2w6sC0qXHQgD4SA?=
 =?us-ascii?Q?MFV5OfRvD6kyzpcHGVi82v7Mc9kk5Il+bq9yegpUBI8zVeAhK+ItFGFFbhXv?=
 =?us-ascii?Q?iwbucr1qfr/akfiN6gTICV85X7ubGckQi9kggwX4C+nE+CsK3zule2TxO8ig?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5c485f-d66b-4cd8-659b-08dc232f6ab9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:09:34.2240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDATWoubhby4FP6DhDeVNd2e/CAXTv0/2uuCyyX7O7vzts2uOXIZX+KfRj/Alk8uumj7S2qVVQbX/7XNlX2HpoyMZ9VNqpK7uSIMoc6KBok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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

On Thu, Feb 01, 2024 at 01:43:21PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-01-31 at 16:46:24 -0800, Lucas De Marchi wrote:
>> Instead of checking twice the match, just use longest match first.
>
>Nice catch, LGTM.
>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_drm_fdinfo.c | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>> index 222ccbfb1..5c0ccf624 100644
>> --- a/lib/igt_drm_fdinfo.c
>> +++ b/lib/igt_drm_fdinfo.c
>> @@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>  					 strlen("drm-client-id")))) {
>>  			info->id = atol(v);
>>  			good++;
>> -		} else if (!strncmp(l, "drm-engine-", 11) &&
>> -			   strncmp(l, "drm-engine-capacity-", 20)) {
>> +		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>
>One more thing to eventually fix is removing "20" which is exact
>len of string, with something like
>
>bool str_begins(char *src, char *pattern)
>
>One source of errors is counting letters in strings or changing
>string itself without changing corresponding len. This can be
>done in separate patch.

I had a patch for something similar. I usually use a strstartswith()
that's commonly used in other projects and also matches the python name.

However I decided to drop that for now. I may have a bigger refactor in
this function soon reworking parse_engine() and other functions: Worse
than manually counting the chars for the strncmp() is to call strlen()
in the same string just in the line below that to feed to parse_engine()
:-/. As I said, still undecided what to change here and if it's worth
it.


Lucas De Marchi

>
>Regards,
>Kamil
>
>> +			idx = parse_engine(l, info,
>> +					   strlen("drm-engine-capacity-"),
>> +					   name_map, map_entries, &val);
>> +			if (idx >= 0) {
>> +				info->capacity[idx] = val;
>> +				num_capacity++;
>> +			}
>> +		} else if (!strncmp(l, "drm-engine-", 11)) {
>>  			idx = parse_engine(l, info, strlen("drm-engine-"),
>>  					   name_map, map_entries, &val);
>>  			if (idx >= 0) {
>> @@ -251,14 +258,6 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>  				if (idx > info->last_engine_index)
>>  					info->last_engine_index = idx;
>>  			}
>> -		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>> -			idx = parse_engine(l, info,
>> -					   strlen("drm-engine-capacity-"),
>> -					   name_map, map_entries, &val);
>> -			if (idx >= 0) {
>> -				info->capacity[idx] = val;
>> -				num_capacity++;
>> -			}
>>  		} else if (!strncmp(l, "drm-total-", 10)) {
>>  			idx = parse_region(l, info, strlen("drm-total-"),
>>  					   region_map, region_entries, &val);
>> --
>> 2.43.0
>>
