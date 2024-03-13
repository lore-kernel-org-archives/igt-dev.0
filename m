Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0AC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 12:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9190810E275;
	Wed, 13 Mar 2024 12:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keVspNNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD810E885
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710334001; x=1741870001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EW/iqRGPhc+9snpKqWsvE2JKVhJj0zASGBxGiYPLI5M=;
 b=keVspNNzq+C7Jwhe6utvUDPj3+0nXcMJ+tBp60SSM/GdJf2J7kzGfnlI
 sUwUX3o/uZbKkceClJJRTlZpicyid9st9/8E4zpVUJcg7e/j2W8OZd4E1
 rSRCzIF5ngPdkowm60BZAEs3L1YPCDoM1l8kUCTQ5nVApi/wyV5oCEhMc
 bJ1UvsiMAxS3upSxXPwj/2ob9VZrQFycG+AE6i1islUTXAjOnqrpwCFI3
 7RNK+EZojODxznvPcWJNanhitsjmzhzyjBWKeJj8WbpWy5ITBfMakv+ez
 dpCRiykGdH6ySd3xB5FUGbDQV3C8csLNAsktju95Pcmj3GpfqQygfn9j0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4959218"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208,217";a="4959218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 05:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208,217";a="16635988"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 05:46:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 05:46:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 05:46:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 05:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keQMeXhQ0ab/pWaZ68KG0xRS0n2jo7vJBrldYoDM6/lKvt7+6xMpVopqnZC+A4NPHYG0OxxRzhviBylb/SheTD97yoGGqXWyi6CGdOk7c/oPqIyrRHVUCeS6knjJweg0PSa7mCfu/eQqDl7KYr2eujKRiqGs4J5amsZ67rBQfbTIkP/RnlV6gcMq/izkNy8YndmozznQszxzwQiatYUpxGM2EaIKi0LZ8l9MA1awznr1A8Qoj55FsqhUX79ZEP4Hqgiw6Ld+6tilO9+m+kntme1zXcNknQxsNLZrQt6SeYkbIMQqQSv0tNYLtuESgT+Lu5OuyETQ3es2f5nIX1mJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU0uakdNGlyyPPGaWMmmytMFSDkY5LCBkt92ehavCk4=;
 b=AJj6AnXpkjTZsRKA70xG44CqzudRqbNjnDLhBOBKoSCMKGY4Sb+KCOPkMPxblDeZo60dGplOFOyI/JClXSCThFyoYJJ81HQVumUNj9muVRHSNomm8LXE48MJ7TG/B+34i/H1BlniugZBANARo0Vb8rKis6YAhH74wXrpyjZ2TLe2Tq37WUjzjQy1ORMaHT9iiZ8PlFIinrK+vuB5N3ekPjdO1dPHoGrPnYV/q/SkHdYYWc8OFo+8khCwatTajCtI9+Y1NXetQf49vC/aAx2IzNbYD5uK9aLuNUm00//YjhaFzIWY+0UsaND/x6yYubQUXzJ4EXDuj08DCvGGCC2hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 12:46:36 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 12:46:36 +0000
Content-Type: multipart/alternative;
 boundary="------------oblvRRkWrZKna0Z5Abd0hDW0"
Message-ID: <bda93512-dff7-470d-b7d7-a8b898bab598@intel.com>
Date: Wed, 13 Mar 2024 13:46:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] SRIOV: lib/igt_sriov_device: Cache xe device at open
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20240313115911.22870-1-marcin.bernatowicz@linux.intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240313115911.22870-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 43eb5357-6cc9-4a92-adc1-08dc435b9e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bd2hTMOLdpkBq7QgwhgN97Y7VI+rBIjO+KIn5BEJ9EeFZWL+lLqhXDxIMKOuc+sZY9JWpxfIjmoNcpMPhj5oDA1Sl0QN8nDN/QYXXk/DCaQeVI7G5HlAUknCAeml0EBfWDBjtqgJ3txwIl02FdMtRclGXMyL61JnhhOeVYCjyryhm8RN2MpwxChH3Q+j4sOhSu9KB5fap0rLigMXkeFVYfzL7jcE8tHh58Y/msYZNBzAgv1h98AlmT471yMXdr6acRRmVof08sIuK8hwpur8isH9ZpDAns8PxocxjCgayKPLgiBfpnrYZK8Pn0qGNSiCiY9uCwBB+mDBM+cOOuLtvoZvsP9pweODEBe8j9bMXZOuxggnTvGRshjVIsChAJrCTIDMB/xP4CY4xJhRof8QvQtlQUiHUrbHcVWVGrrCt9DAjP8AGiz/HYvs5JZH16QJwkzqqNUQW9C2LufKWGPOTkTuv22R1WG4prDWeHeYiclZuSmzVUHgR7Rm3JCHYj5RMduLSKGkAeftr4HM708SdBClUuF5s4tjhu+qddnRbKImj2WZdDAv01Mr3TxoyOT+Y0k0HrV8X59KuqFIekLqqIAJtxZJD654/bvmuJYKmNCdDBfGaH5qmK4fq43kW+ROzSoEHm44RKR/aK9X7VifUUfY4EJk0zXr4xifBq+0cig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJ5NEw5dWxzRlk2RUh3amlCVkdGQmNSbEwxcGthMmJ3em1sZW11ekJhcnBp?=
 =?utf-8?B?V0hOYlQ0TE9KMEZQWTAzNVZ2OE9rdjU3cTJTS3VORHBaaVdGN2R6Z21FdWVr?=
 =?utf-8?B?cWt5TE1ScCtqcHZXU1E5NmZSTGN1aU5ST1dFV01yNSs1My82L0wrMnF2d2N4?=
 =?utf-8?B?NzhDUkR6OSs4RitEUjBVTElNZnZ0YTdRK3U1TGRaN1FhWXc2WUpjMVM4YlNP?=
 =?utf-8?B?TEw2QzFLdFFSNmdHT250T0J2c0tyQW16Ums2T2d2NllrUnZDdmtEYklkY3F1?=
 =?utf-8?B?dGlVL3hlZjNVck13OHRBVmFPRE1iaDVBaCthWXo2QnlLZGhqQXMyV2I4REZC?=
 =?utf-8?B?c1VvdFZGclRKUlFKRFR1VlMrNGMyWEVwOXFZZElUKzBrWWRYdEhlZXlURndG?=
 =?utf-8?B?Y1FUR241bFVCRHhkYUdlc3c5REVlRWtpeEhiYk4wbkR6Ly9rK2lQOWJMQVNq?=
 =?utf-8?B?aHpiTktDOE9nQStWUm1CenNUWlNzQWFJbFljRnVmbjA0TG1ZQUZWQ0F6bXdu?=
 =?utf-8?B?cjBVNUtiU2pBZ29kL0NCK2pOc0Fsekc2TjNvWnRFR0hMcnUwZ29GNGFGM2hC?=
 =?utf-8?B?bXhBNVpRSFd5MmRydjhIcmJ1ZTcyUTYzV0VZRXgyZGQ1VDhnZWIyWjN2QVk1?=
 =?utf-8?B?V0tHQXZkeWxqYnlCeHdoY1A3UTJEMGpvdlF0Q05ZMUJvWkRTNzMzUENBckN4?=
 =?utf-8?B?OU1pN1A1ckRUd3NxRFJlTXhDRERzUDIvQXFYckdTMmpQMUdQN1NBS0FJSzNW?=
 =?utf-8?B?Q095SHFDQVpEbGl2YXNiRU9mVmhuUUxsVWhVcW1ZR29UU1k2NVhZREZENDhK?=
 =?utf-8?B?ZDNpemlqVDV5S3VGVy9BUWdxdmVlYU9rbDNYRFdBNXRNbDVkd1RYcTRpVCtP?=
 =?utf-8?B?Q0huMEZVSjRlLzRUWVJtdFBLK0N2bTFKVGdiSDR2YTd0QzRuZFQ2RlprUzc1?=
 =?utf-8?B?TFI5UEFWaXpYMDJiOERjNERyV2VlREViL1ZuWHZIT0VFTzVQYWRkR1ljNnVD?=
 =?utf-8?B?eEg4RGlIbTh3empzVXVZMjA2T3Zwdmtac3VWa2EzQnQvakkvMmRzeC9tL0NM?=
 =?utf-8?B?NkRPRktST040YXpFdEVFWTBSY1htVVJsdVl0K3Y4ZDJHQmsxano0dGQ1NWVW?=
 =?utf-8?B?a2xLTEJuTjlKcDdGSStyc3BvM2wvVGhFelZPM01DWUE5UTluNTVKZVdDSUVo?=
 =?utf-8?B?b0lQczlrU1BxcFNBM1dIdlBuWDYyZ0lFSGJ4VVJ3U0JGRk1vUkR1WmxVTzVD?=
 =?utf-8?B?WDV3OFhWQ0ZERjFQSVlYZ2YzQTBVeCtKR0hrR2RMK1ZDdVIrRm9TSUJYM0xM?=
 =?utf-8?B?YldtampQaURNanorQmdUWWMrcmYxTkxPKzNnQ2Y4RGJCakhzRlZ2Nm9lblRy?=
 =?utf-8?B?NGVyOHpxL05RTzVrUjdERFFvM3NyVlBOSVA2bHUrWTNKd2pNY3ZEZ0RUYTFC?=
 =?utf-8?B?SkQ5eXMzcU1IUXUvTng3M1NNcE5SNlJtTkl3ZnR6MFEwOUowU25NQUNTcFdR?=
 =?utf-8?B?aW1JR1YxM1JJaHo1Nm5IbC82YmFaS3RkaVZKT0ZMYzc4UVYyNTQrREVWTEl6?=
 =?utf-8?B?QlVEOXpCcHJham5HTE5Eekx5ZytlUjVtQlhybzg3NWdNRmdhd1Zjam5sUWtM?=
 =?utf-8?B?N25GaG1jcTdad3JYZk1zSVRUWUV2RTJYVUhpUmpXT2w1Sld0SnMrRE8rMHAx?=
 =?utf-8?B?eTVZbHhHdnVGbFl3US9PSmpoN2xRN0hZUHdyZG0rNnQzbFVtLy9ZRWxiUkhj?=
 =?utf-8?B?QjA3eEtIbGJFK0hub1dCWk9JUnUzRnVudC9zdXZ1WUZiWUJXcFFQMWN1TnJ2?=
 =?utf-8?B?S2JWbGc2MWgvU213eWd0anN5M2R4VGU0Q1NUWDJVdnNBWHBWUEJubHFKckVT?=
 =?utf-8?B?SGNxRS9qVFlnWVFYeVowNUZJenRRZjlRZHpicWJLSzJsK3hWRkJlMXdOZnpW?=
 =?utf-8?B?dkprMUhxYW81U2FoZnNKSDZoR1ZRaFlrK2d5U2dVMjZRUFRaUjc1MTRPVGZ1?=
 =?utf-8?B?dkQyRm1KUm8vQytVL3F1OVU1eHlYTVVXa09vc3Y5cHdJdXlaVmlVbFdxVWtH?=
 =?utf-8?B?aDk2eTNYYXJ0MHl6WlMzM01GMGhGRmcrMmtudG90Y0VlQ2puemtuU2ZJSVkw?=
 =?utf-8?Q?1XRAazmUzrI/KuAzlr4lZgg2H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eb5357-6cc9-4a92-adc1-08dc435b9e90
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 12:46:36.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9HfPp4Eo+oa21gXJVLIos9vLQGd5GafDsykueGucPpdbN2/nUvj2FR212aERVThe77Pic1Y6IoQZtiDu8Hspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

--------------oblvRRkWrZKna0Z5Abd0hDW0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/2024 12:59, Marcin Bernatowicz wrote:
> Be consistent with other drm_open_xxx functions.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>


Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>


> ---
>   lib/igt_sriov_device.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index f20761669..f425a5ecf 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -12,6 +12,7 @@
>   #include "igt_device.h"
>   #include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * igt_sriov_is_pf - Check if device is PF
> @@ -232,6 +233,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>   	DIR *dir;
>   	struct dirent *de;
>   	bool found = false;
> +	int fd;
>   
>   	if (!vf_num)
>   		return -1;
> @@ -258,7 +260,11 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>   	if (!found)
>   		return -1;
>   
> -	return __drm_open_device(dev_name, DRIVER_ANY);
> +	fd = __drm_open_device(dev_name, DRIVER_ANY);
> +	if (fd >= 0 && is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
>   }
>   
>   /**
--------------oblvRRkWrZKna0Z5Abd0hDW0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/13/2024 12:59, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240313115911.22870-1-marcin.bernatowicz@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Be consistent with other drm_open_xxx functions.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p><span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240313115911.22870-1-marcin.bernatowicz@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 lib/igt_sriov_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index f20761669..f425a5ecf 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -12,6 +12,7 @@
 #include &quot;igt_device.h&quot;
 #include &quot;igt_sriov_device.h&quot;
 #include &quot;igt_sysfs.h&quot;
+#include &quot;xe/xe_query.h&quot;
 
 /**
  * igt_sriov_is_pf - Check if device is PF
@@ -232,6 +233,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 	DIR *dir;
 	struct dirent *de;
 	bool found = false;
+	int fd;
 
 	if (!vf_num)
 		return -1;
@@ -258,7 +260,11 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 	if (!found)
 		return -1;
 
-	return __drm_open_device(dev_name, DRIVER_ANY);
+	fd = __drm_open_device(dev_name, DRIVER_ANY);
+	if (fd &gt;= 0 &amp;&amp; is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
 }
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------oblvRRkWrZKna0Z5Abd0hDW0--
