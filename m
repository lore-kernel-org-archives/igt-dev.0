Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B7C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 22:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6982F10E07A;
	Wed, 29 Jul 2026 22:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToTVb08i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B022510E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 22:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363271; x=1816899271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BTxWDupeMISMbjW2ZemqTf1j0Vq+kX6asmbimlGAoG8=;
 b=ToTVb08ib84pLR1lmJYMyFs6yHudDLt8bDVLHCfZhPv+aFapHXrHqhpS
 ahcMMGis3RPC+CCAL1Xh4eWF3wFETL6mS6+9VoTeQI6toFuXD8TphLQF3
 N/b5r2OwgfPwLnRi5N/WdHnovtMeZvAoqI7Ivc6cmlLDaMg6ObOtSFtbF
 9BPQs4W0sJ6Wuvb6oS286cQLWw15mbwn1sobw0EllxN04fIKN8el/pbzA
 kwksdGimFWwo/JelsJbAkrzNoLUexwQPTDMPGgzAjrM2BvghaFvNivLIk
 JieoaiPhOXO4AVypPmwaHOUC6LZ9tYvbAeh0gHCo9AM4pyPUfx0dADRlR w==;
X-CSE-ConnectionGUID: HaeZkjWVQ0Ss+xxHx1IYyQ==
X-CSE-MsgGUID: oTd7996sQoWkY6WJafifmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86058415"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86058415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:14:31 -0700
X-CSE-ConnectionGUID: hC+poUXYTB2sJk2GXD0wzA==
X-CSE-MsgGUID: iY/UsE0RRQWlDFA5xtlPrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="259546684"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:14:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:14:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:14:30 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aePiZK8gQH+QGtOomJWB6EywwXSoB1uCSofhkgHrJZUkATQWs/5WNq2UploiMUOZgZLcDuBhjkUYg9IfTlA/X82u2PsQ/BAmptAOPBT6fFPXmALyZfZzhsv7VFYm5uPxu2tRWcl+gu/mCoYsZCqHn6BbyfDoUcerrC8vjjNfcPEAqCX0h9DBSY1bB/MfIRf3Ll34ZhiqtS5F7adb3kNqVSlQKrHK+gceXpUefT0C+RCbpE6purywifNOZpUFakOvASkEws6biXH9Kjf9NLDYRkv87TkviBGkHYu7R1oEQsZuBIp5QLX6TBVJm2ifDJK9GnlFam8IujNn67xw7sRXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaw5oMIpoQ4/+e8IQu8zcfrA33+qblTJqWxoQU425HY=;
 b=hMn2ULl5eR0503I/3BhOOred1fWGkvk7osMXgQncDamI3LYvVDSgN65cxSkcjc2prH5mwUsU91TRjdTZE/n8XGCt5MZSnAg9bSkT+n0ptmroWVck2m/Yv4ybNvBt7VyJotJnNWOYsyIYjTd8eIWc2AbgGYblgpeT2lC5JSUqL90rUkVJu9MRhjy0XG5VmeJ4pQ9wmszfG7AWGOwU//23kEEsVUjhWC23kbCKYtm3+LL7m/2WDTCbK1/grrMMuFin2dLYAxF4iBZTvoEgrs+OQZn4Lf6+x/YheIbVzhLbtLr6xcPrk8hv86ZYVlzvun7kSxCHkv88ay7yxwczNnoHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:14:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 22:14:26 +0000
Date: Wed, 29 Jul 2026 15:14:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
Message-ID: <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: f64d98fa-6d5e-4e3e-163d-08deedbec044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|6133799003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: JpYqptu16bS0+KBI1m13ddkJ6S9gPM5kmjsne+RImTJiDB/WaE0SD57lyh6qoQKxAMcmRR+qRZ8fAR2QbWIsQiUxDdLVNJFsAnf/0tbRmJwaNR+vggENLG5Qtk0LaTsBpLAcdlg1X61fDXUpAfgzl8H5O3skmACDJWde7/WOajcGrAqS0GTgIdknxIniI92y+qSLzU3eCx/XnLfvRgLmBjFnCyyn8Qz8aI6Z5JbN19dIibYbwGAFcb0U2dyeuS2y/0PNhEmXOkyypG1Opp/uQoy3lbL+B6IArp/xv6mo8UwjajEzvF5ByQS6uaxX5460ykkH1nDxFutTE9P5OP4oHDvbaKRmJuSyim3E0csQzxAOJknZYtueo6L2GQ34FWdMVKCn/sab5BGLs17au9k2lP16k/TTOsJY0AwvJYNJMbuSxK25sjalD6D8/73dWNHFgQao+yi/Pol5HKUs6Q/pLNixQ8ExAPb2qPVkqwIQ7UN6/je8VFPUZxpxKrzX/TYwxBdwE0fGu5dTgm6jWuDgQwso+faSHrnDR5wDPIwC+D6fc4jNWXILkGWg2q9Y31fRFfF+aZsQBOBL8pqA0qufbl3kbYPs1C+VXIIY5kL83Cp8pJeR853NyzsORDu/rrBKI03bxsAszVLvugcZcOqvOInlfnZbTaYUPADRCXAkzg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NZYDkFZDYvjwu+lOeQNLAHG6PrufqQZ0Ioso7Bb1Jwu1+Gx3BMlqgE0NdIhn?=
 =?us-ascii?Q?TBEFrGMXSg87hhw5ledI1lz03eXkAfc3Gg1bUcHqYYc+whuCk/EjVh1xxrNP?=
 =?us-ascii?Q?tF/HLay0vzGYV1MHcXq9XFU9YuQFpc6J49FCfGAeCoMYI26L5MSb1vmr35pI?=
 =?us-ascii?Q?6+R7FAm4QibMtO241OtVEi/DWTAeROtHukvWy7EJDDnx6EwYtyRkC3RODIoR?=
 =?us-ascii?Q?nCyaAYzVyAvEZKwEFfgGejhc5Mw6srR24Sc/uIlTU1g+ltkZbFU2/BT+MFL7?=
 =?us-ascii?Q?zbIxGyhoU+z09v5tHKvpYkQwZ6xueai5MyUNHaIDZRSlAeE/MxyCptsAKNJN?=
 =?us-ascii?Q?4heQTNSPfIj1lUEbX18G3VDkAJKBJOXuqprukMnZUcbsP7DMVTFziDO5Om6q?=
 =?us-ascii?Q?kEM29l5sGIc3klonEYwDd/MVe835D/qTRrc8/9mDXY1Wp+GJJDUOYv/opRbk?=
 =?us-ascii?Q?oTNO7zt5um90NzTNkYP8rsAqAnKvvRsgTQ0fhgnt2hVL8XQF7Rn27/NXeZ+y?=
 =?us-ascii?Q?5p/KK30gjdQDXXphXDcurU0OK5vd4izKYp5Ganm8+KccN349ze9S9dg9HOMR?=
 =?us-ascii?Q?0EsurWabUkGkrK6gESZXqPOWhb5/JwSnlM0C5mRuVFlnMish3Gr+LD1vAPs6?=
 =?us-ascii?Q?mIel4fAxEoXo2qY/xZEAw2027xVYBA8aG03esFyZR6slnPt6CdnfJq2gWWg9?=
 =?us-ascii?Q?6OXKj988HU84gxjXnnhex0LzJIsmoOmkOindPjgqQM+M3vc16F4J8VUIklxw?=
 =?us-ascii?Q?6gwt4JK8alytWukFmlxFwn7ttOpqspq/jaLRBefsd9WpSz7xAKurH1Bq8FBA?=
 =?us-ascii?Q?NOn1jHfvfehr4q2qoJDqdLBlmW8d7TquiL7ZPiItEm7Mq+RJPtjLCdp3dp76?=
 =?us-ascii?Q?34z+5eJa4WZ5nvOrnqYUOZsyrII788CXnsGwfwgB73GmjdV9NI7ed92vl4n7?=
 =?us-ascii?Q?zB6jHknLsFhugsnF6scEM0wzi1MogZvymurdgqWA3R+aQ8kh5fhxWKIxu29a?=
 =?us-ascii?Q?kkEFx99KJIqymIbftv5tlDvis1pNiWLsLEAoOvwtZQsUz8aKDEz4RdDtm2+n?=
 =?us-ascii?Q?AqBom1zlyIuA6KW3A5olVBxcSJFUrOsxtI3QtmznLbRWORnN8gflNs2RKqSV?=
 =?us-ascii?Q?3wkM8fxk4JFtbfpZRuikNG0tpzEMbO2svmMWakf5JEC3e4FqTRZ7yEocwZwm?=
 =?us-ascii?Q?jTC3ZlBbmVme1nj1Gl18zXtL8uDirySBEemWKDUkwrGspD1lr2ZtmE6oerZ5?=
 =?us-ascii?Q?LWE/Yj3tuDD5AMgG3Lo5oWpAQXHnXUR4LA/PHr8/VldVhShqMZNNRwzm2HyO?=
 =?us-ascii?Q?dDKPIaZi0panbLC6l9Grqs1yjIW2n6itT84oHmkMa9suWdPMXinTP5Fpy6ry?=
 =?us-ascii?Q?MfLB3nzq82gHbhTQNuRk4tnb5RbuQLnVfwYKNNvEwPsaFxkVuriHqDUOOyzz?=
 =?us-ascii?Q?Z5f29oTiU4sYy58WD+bowRylolVtHifA/CiTJyOcwh2jkjP/kTty10s5krpM?=
 =?us-ascii?Q?TmUJ4JgEig+WfFagUVXvkrhf+YFRQy373eIPRRZSU5jVzdY3TuaBL5Inb1fY?=
 =?us-ascii?Q?VtluIy0Yx8iyjv4SWBGE1JCsVTUfjXOj6whRtalhv3PBonegWFy1Es3VFfhP?=
 =?us-ascii?Q?QnyYK5y/ELD3ws0knCQFPehde3eqJ3GYceAPnS7GaWdxFbADIqK9naYDXFny?=
 =?us-ascii?Q?f/iz8ncmZMO2xGRSEFXu87hYLpzsYywEE7xpeExbOAk53ufccqjE3oZW2M7o?=
 =?us-ascii?Q?rHfPt9XaQpsQdDYNX+xqtfe+VG4AtIg=3D?=
X-Exchange-RoutingPolicyChecked: HAAxi5IUpip9qpFZPL9bzcv+CPAmIvS/A2lGVp17cwpzk/ZbUPwFHi7UnRvbNT2mkyvKOHCdOqZKh2mY/57SxwkIKPNVs4Trg42FbDEuQ4gEXGRwewA2Z9JFEs43V37pbpCwAWQb9s/Ehq29Q5eqoYFscDGQcyBJ0czfJhk8Yuxr9qdM1GTeabH9dCwvthxJISfxxtsjJzyOYX6zVux9CC/+NXaX0kz916cdTBwINOPH5AhPmk7fRFGHrV+QjcS6Xsclq4/N3teATloYJ5jp7xUmFmL0p3oeXq2VteTp8o77/Ielh0cP+ilJMeSZS/Z32eiMJlnS3e+ISArMxYck3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f64d98fa-6d5e-4e3e-163d-08deedbec044
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:14:26.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0zCamMgZE0z8EcYbUVk19Q6N6Samebo/dXxClLwFV96k9vMtIrUjk66BbY8dgp8RYk8d3UL+V9wrM0JQYEpiaj882cBCptpWUZ6ndYBQxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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

On Tue, Jul 21, 2026 at 03:59:58PM -0300, Gustavo Sousa wrote:
> The function xe_wa() will cause a warning to be printed when an error
> condition is found.  Since the current users of xe_wa() do not check
> for errors, let's just convert the function to return a boolean.
> 
> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_wa.c      | 11 ++++++-----
>  lib/xe/xe_wa.h      |  4 +++-
>  tests/intel/xe_oa.c |  2 +-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 0f4d2edc0795..8c8f7156c21f 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>   * @fd: A drm file descriptor.
>   * @wa: Name of the workaround to be checked.
>   *
> - * Returns 1 if enabled, 0 if disabled, -1 on error.
> + * Return a boolean indicating whether the workaround is enabled.
> + * On error, returns false and a warning is printed.
>   */
> -int xe_wa(int fd, const char *wa)
> +bool xe_wa(int fd, const char *wa)
>  {
>  	char **dumps = xe_device_get(fd)->wa_cache;
>  
>  	if (igt_warn_on(!dumps))
> -		return -1;
> +		return false;

Should we use an igt_assert() so that failures here get propagated up as
test failures?


Matt

>  
>  	for (char **dump = dumps; *dump; dump++)
>  		if (debugfs_dump_has_wa(*dump, wa))
> -			return 1;
> +			return true;
>  
> -	return 0;
> +	return false;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> index f0a826553df8..aa1c50c0f9c9 100644
> --- a/lib/xe/xe_wa.h
> +++ b/lib/xe/xe_wa.h
> @@ -6,9 +6,11 @@
>  #ifndef XE_WA_H
>  #define XE_WA_H
>  
> +#include <stdbool.h>
> +
>  struct xe_device;
>  
> -int xe_wa(int fd, const char *wa);
> +bool xe_wa(int fd, const char *wa);
>  
>  void xe_wa_build_cache(struct xe_device *xe_dev);
>  void xe_wa_free_cache(struct xe_device *xe_dev);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index fcf1d71a167f..bdaa7141004b 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  	 * can result in buffer overflows.
>  	 */
>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> -	    xe_wa(drm_fd, "14026633728") > 0) {
> +	    xe_wa(drm_fd, "14026633728")) {
>  		oa_exponent = max(oa_exponent, 8);
>  		properties[9] = oa_exponent;
>  	}
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
