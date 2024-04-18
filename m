Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1AEC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698310E4E7;
	Thu, 18 Apr 2024 22:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSNQH9X4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF3910EFC0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713480520; x=1745016520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JQ+X5JYxzxbbaQizqa/MZBzATpaK/eUlhr2f/WXZbSY=;
 b=lSNQH9X4SgXWRzkZMNqB3Nq8JSATaY505HTdyoEoqFhbCAkTB+MVkyhj
 NJ4IpJptADvOyd2mlCu7OYjBUuySUtZxKJTTq/h5x2Yiv99rH0gxz0SGX
 spIeBWTBRDbTKJ8DrAsS/UkqvlkmqQE39F5v1NM0fQpTilg8OYrXoVe7j
 otQJ5WQumK+UnSwE5Wl/41liBwFvObG5vghWuvHHmkbllh0wKUbIdBMZi
 ojUozvBr0/5XVvIaHdDv+xv6IkGVjlKfMkjKkO3UPLdhYTtNvEsIc9FNN
 3oewvny6C5nGt2igy4MpdgnP9sliJBpFhawZ13uzELT34t6jX2Hl4jQ4+ g==;
X-CSE-ConnectionGUID: f4S0G20KQfSCceuiCMPgEQ==
X-CSE-MsgGUID: GRZ9vZ16RCCs50IKGbMqug==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26574136"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26574136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:48:39 -0700
X-CSE-ConnectionGUID: Cy2HeLxYSkeGs/R5P7z9fw==
X-CSE-MsgGUID: L9Q7zENPTCGFi1jKyOQIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23208304"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:48:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:48:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:48:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:48:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRFkegF5sbY9OV8Vrnf1TA1Dr56eegjcQMi9VRErcTZBLKZLf69BmlIqjOX+7Ilc94NKxQxIqmMFwUrp7emwWUrDXR4nOoro2qP/SqN06vMlfA+v7mNt1acAdZp8CwF77nbS70EOnc0wAzHA6aj/5MG4q5SS3EXDLxsvW0/nQxDR/VjYd8/7x33m6M8Go5wQpx5VN7+5MCjVKbllscCgcN2B01I5AWgFmIvn+0sh6ZF2oi3Ow3Pm3StTaqRsjMTYh4GZdjSifSoCYUJsDJd5RFepinwqu40MpsSbekdUsZjVKCByKMK1MuCvFQwJJJt1KULEz5QxnjuhEN+Z72/EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXcZkGjuw/PtsOMcGjJ6aJtUfgV3VOwiGIHx26LeOUY=;
 b=ZYmstdMvg43rgS1+olxkf+cUMoqtpZS/m5o8W/+OxUcAbWCUxgQaSF7qkjd8bW8juY8hckr9wENvlWBShTreYjh5EG5Jnu74F7pIsc6QV7BJc8uEiQKQYwgki/XVeuJkmoW/bwzNXo13YyhPmYk20ytdjdoNGGbDzawKlcrXkKkZ/b7t1gsVPRGutzI/0JlvG85cUAQcJV4pMx/iJ/BcfbFCACTvmydvvwQqQqStaDVVh3qxhhPSgfysjGGs4dhV89nmPKu+MZpsDkRXDApgBSzxVL1fRyhuEwZi9O4vy+UilyVM3/eSTSxtPn854Gf1Y+hvKx42F936S6kt+XQU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Thu, 18 Apr
 2024 22:48:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:48:32 +0000
Date: Thu, 18 Apr 2024 15:48:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 07/12] lib/igt_drm_fdinfo: Parse unit for engine
 utilization
Message-ID: <ZiGjOeB2CSO7a/wO@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1ecd49-534c-4746-b733-08dc5ff9abfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WTAl9cVB692ved7s9NO+xbYJ9H7IGirSPnfsHfTcpz8rRbu9SKh4MBNWD/xA4Dz20+yYt9tFzSJMN2ajhnLObDyCG1jVlYohVH2fPjviwUNNRxufnFziKsjw4sOwt0/UUAUQfQduKyELw5e8o+fBuSadUDTmKLNLiixrg+QKSydBR4gmC/tZT5eAcPd09taAoAQQV2+31n3zbqZq+YPKlJ7TpvY+An/cmux04eZSEWQNLlw46sT5ORyFUcHX3a9TUM25nrL/hsAQIxl9xgXaeP932sUUX3VTK+kT0Laa5KWv/bkflBnCMQJcNR7wmUX1IX/OJU3/JbkGJdMu4RdH1/oUvR3LCRHdIKl4xCKupPsU/joy1pS6x8gbWs175VdYAwprbO51SJfIad4Cd2yvUXZHknHVoii1ZMdRarbBoN9clXA66i/+UAPA+bVzQnByxeEX41/VNGifTZxWVSwkJbH3KlLGhLyggBHwAQ8omzfQ4k6ZakdLZE6oF70ULkP8567g3BP/P8MTedcz5fsYv6CzgFDjMszs573R0P99vmdfmtg8Bx79ld9tnsLAWhS4UnawZLEoIG1hcuoSe8FIVE7kKg5jRbWNNrPzF3ud0Errdh9eW+H50VpDAaxMKnxp1l6d1y5s5TJUJ5hQl9lfcp/rkn71iito0tgz7e4wau0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2V4cXhlVjA0OURsZ21JeG0zQmZPRWh4SElXY2Q4RjJpTHFBdEJ0QlN6Z3Ni?=
 =?utf-8?B?QUg5RVpWZFp5QnV5RFFhcEdwV3RyTGNUSXhYdUVxSHg0ci9QREVPTXErbE5Y?=
 =?utf-8?B?WmtRMTRwOVhOTFBsZ2dCSHBuYzFwWDhUQXdtRmRpOU5ZbkRWOTJhNGRIZlh3?=
 =?utf-8?B?RDRjUjdKa3cycUFyT3lwd3hGWkJVc1ZqT1lPVVkvdk5CKzZtNFpVWmN1TGpD?=
 =?utf-8?B?Y2hCSGoxY3ZzallMRlRGMGlLUXBvd2xobU52bEw3Q1ZvVWJPUGZSZyt4eW0z?=
 =?utf-8?B?VUMrS2M5cnJEbHprYWpraG4vOU5PMzdzV2gyMS9YTnE3WTNIV3psYmRMK1B5?=
 =?utf-8?B?VkJxQjFYUllEc2UxNkJBc3RmUEVmZUtsTS8xeGJqV0FiVU8rYnNDaGVLMmZX?=
 =?utf-8?B?UEFVWmptK2hnQ0I5c1RFekw1akhKWnU5aHBkOTNkeVVETWxRdE8razNaU1RM?=
 =?utf-8?B?ekFGc2hMbmdyNGluWUNKcG5kTTU1NXluQzlLOEtVWm5ZMCtKTFlCakkwQ2ww?=
 =?utf-8?B?bTYwc09zdkRIMnJqTGx5NnR4alJyeUdXalB6eHNFTnRrTzVZK0o3RkdEcU1K?=
 =?utf-8?B?RGdTNEdEeGlET3lWN2tpM1NSdzdOVHBTUFZ1S3dieW9IRWRNbmFoQkZjVkVn?=
 =?utf-8?B?ZVl1Vmd4SGJ6VERxZ1ZqL1V2R0h5ZHVyL1A4dkxsVFVyU0dPdnBtY080Mm5F?=
 =?utf-8?B?dDJ3bEVjemZKblVWWVBMSGZTQVFiV1dVOHlXZFFmTncvbThqMVJGOGpQbVJu?=
 =?utf-8?B?eFMxbk91REhWZEVrc1VLR2RlTlR2c29ZNmFFUFJNUUZtS3ZUMlZvcy84OU95?=
 =?utf-8?B?V0lHUFUxbDdPbm9EU1NtK0l0dGUyUGdCT1RHUDdkakNzK3lsVSt1Y1MrK3hF?=
 =?utf-8?B?MThSbWo0cGNneUZ6d0xkVllwbE9tdnVvREF0cnVjaklPbnppVmhmTlY1eWRP?=
 =?utf-8?B?NVZTUE5UelRqTER1UlJQZGtEZUJmVHAwT3ZuZHMzZVRYenJ3Y3BYMWh4eXBl?=
 =?utf-8?B?WFhZdE9rdlFiQmVockdJOWNCMmIyWmJKcFhqREZWdHJuVmlpRlpNYjlUWjhj?=
 =?utf-8?B?UGsyS2x0TWxsMWxqYlhDcSs0M0duT1YydUZVNG5KMmh3ejZBalJlQy9sUS9L?=
 =?utf-8?B?cGxVVkFwMjVTTGp6WTIxNWNrSXpianQrUGV5N1hTV0FGaDZ6NWpFQmQvSG5t?=
 =?utf-8?B?elJBSzdRaXpIbWwvMW15cFNxZC8rZURqQWNqVDR4Vy96eWJSeU9ZVVJVeDJX?=
 =?utf-8?B?MzBvRWQvNUhRZUFKd0YvM0t5cDZ6NkFZWDRFQ1Jta0xQbzJtc0VYdktwNWhI?=
 =?utf-8?B?RzZONmYrdVFLbG9mUW5CNWxTY1MvS0R4MGdqbzBPeUJHYnhDRjEzN0ovaTY3?=
 =?utf-8?B?dnl1dHU2R01TZDZhNlA3UDdVNXlEdmdrczV5VGFoMUt5Y0RIeGVVMFUxVVFG?=
 =?utf-8?B?V0FGOVo1dEZXZUdvYjVhK2V0V05LRzM3aERwUFkwRjNQTWxoZHZoU1VkcTJC?=
 =?utf-8?B?ckpJM29pTDZoRDE5eHRZV0RHMm0yQkdmak44TEVUK244WlNGclFPNjFHeWZj?=
 =?utf-8?B?c0ZCYVc1ejI4dVdPNDVka3hVZmhoK2JGaUhqOTlqb0NrU0pJdkF3U04zdUZy?=
 =?utf-8?B?Slp1a2hsOTV5eDdKZmFMUFpudnhKWEV3NzhsUXAwcUVHWU9WL29qbDJYSndk?=
 =?utf-8?B?TVpjbWtLelNWekxJSkhlQnNXemEyMDRhK3k0K0RoOHVZQmJETzJQVnNZN3cr?=
 =?utf-8?B?bGwzaUZ3Y2lnanUraGIyWGQrWVlIZ1gzek9sR202ZDBTUTlFcUxZSVhLZWF1?=
 =?utf-8?B?YkY1ZDlvUkpFWXVvbjVKekFpVVozYkUyK2hsdjAxeFFzYmJ4RlJvL2EvM05r?=
 =?utf-8?B?aFpCdmloajJmOE52T2wzQTJ0TC8vb1dna202VnNGL3h4MVVPYm5jcFc2UDVx?=
 =?utf-8?B?YUs1RXpaQjBCbk1SR2ZRSUw3UUFOa2l1ZXdnZjc4YjRkQlpvb09HbnBrWHh0?=
 =?utf-8?B?TlhVSDJwWEVFZk42MFJ2UXB3VDNRdWZoeGc2anJmWlluYllZSUt3V083THUy?=
 =?utf-8?B?eUZGS3VkUG9ycnM5WU5COXpndmNmTDVNZ1ZmOUlWcUpMcXdxNE5ZRnhQbVVm?=
 =?utf-8?B?RkhnUkdpZXpoanJkdEZLZ2lvNE1KRkZNY3ZQam9aTTlXQTNleVJrd1FrbEh1?=
 =?utf-8?Q?CDHTwm8xPQ79+/vfgR52rJk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1ecd49-534c-4746-b733-08dc5ff9abfd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:48:31.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXXuNqpPJjWIUTg/o2vvKEvo1LfbqYSHzqntY927b+oB3VBazdvtk8WUIEkRbeuyIBz9tTZvqHowxOV+hKcN6nVIGorpVeG/x1xyz9lRsus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Fri, Apr 05, 2024 at 01:00:51AM -0500, Lucas De Marchi wrote:
>Kernel adds a " ns" at the end of engine utilization. Make sure we parse
>it so we don't fail if there's another suitable unit chosen by the
>driver or another format.
>
>This prepares the ground for xe driver which will use 2 timestamps
>rather than 1 with a different unit, to make sure it's compatible with
>SR-IOV so we don't have to handle the conversion between GPU and CPU
>clock domains.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 22 +++++++++++++++-------
> 1 file changed, 15 insertions(+), 7 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 5f05f210e..1541a62c9 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -63,9 +63,10 @@ static const char *ignore_space(const char *s)
>
> static int parse_engine(const char *name, struct drm_client_fdinfo *info,
> 			const char **name_map, unsigned int map_entries,
>-			uint64_t *val)
>+			uint64_t *val, const char **unit)
> {
> 	const char *p;
>+	char *end_ptr;
> 	size_t name_len;
> 	int found = -1;
> 	unsigned int i;
>@@ -103,8 +104,15 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
> 		}
> 	}
>
>-	if (found >= 0)
>-		*val = strtoull(p, NULL, 10);
>+	if (found < 0)
>+		return found;
>+
>+	*val = strtoull(p, &end_ptr, 10);
>+	if (p == end_ptr)
>+		return -1;
>+
>+	if (unit)
>+		*unit = end_ptr;
>
> 	return found;
> }
>@@ -212,7 +220,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 	while ((l = strtok_r(_buf, "\n", &ctx))) {
> 		uint64_t val = 0;
> 		size_t keylen;
>-		const char *v;
>+		const char *v, *unit;
> 		char *end_ptr;
> 		int idx;
>
>@@ -237,15 +245,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
> 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
>-					   name_map, map_entries, &val);
>+					   name_map, map_entries, &val, NULL);
> 			if (idx >= 0) {
> 				info->capacity[idx] = val;
> 				num_capacity++;
> 			}
> 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
>-					   name_map, map_entries, &val);
>-			if (idx >= 0) {
>+					   name_map, map_entries, &val, &unit);

Should we ignore spaces in unit and then do a strcmp(unit, "ns")? OR are 
we sure that there is just one space prior to unit here?

Either ways,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>+			if (idx >= 0 && !strcmp(unit, " ns")) {
> 				if (!info->capacity[idx])
> 					info->capacity[idx] = 1;
> 				info->busy[idx] = val;
>-- 
>2.44.0
>
