Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D718BC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 21:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9F10E2CC;
	Wed, 29 Jul 2026 21:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/XBoDek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3412310E2A8
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785360227; x=1816896227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KFpb9CaBT3SjgZvF60OLNrU0xpCSMv00I+L9+IjHS9k=;
 b=f/XBoDek2RG1yJ1NJ4Fs7L+CFwP5k/jKx7IWXoSyJpqwENMJtfo82UbF
 ZgAq0JJ7pZsE9dCVZW+/T2vu4wC7rBVs5XZgYk59YYmb5gUKszixTIlCw
 yMy4jAZrrBDL8mqzlL06HUfrf1odpN/gRIbqvwZCj3lUskOrXA0aRH+I+
 An9lLkBoP8RfMjOk69GtuBZ1Njq8e15RgYan77aFSYD4CfHbFPiHHPuX1
 zDLNLl1ZkAGd1JHc+94vYLh7QPiSQPjF20d1MeITN8EQsG/kyYMun9AbW
 zGcVOL0DejN6Ck6HguDALAAVmugA5EqL9Mac79NpEFMFLWTGmPBcoHOVq w==;
X-CSE-ConnectionGUID: 2XnrGwe0Rc2IMaRFlhBz4A==
X-CSE-MsgGUID: 2je6XM0RQpSRct276zyBSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97490652"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97490652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:23:47 -0700
X-CSE-ConnectionGUID: BAQxQKxrQqi9Mne+knfnMQ==
X-CSE-MsgGUID: XjoI+mcgT9KWwjNtueTeVg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:23:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:23:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:23:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HncfKuc9y60iXLbG1C8VM8n+TD6wgMlm4viujUUat5vr99Kzbtco1Er2BLZhiFFWZiyFx2RdtYxrVXdbvqDKAkvjxz8Cw377s2oLiKRCHZ5sdFls30PJX55v5DIgyA0/09olyp+J7Pv43sKdVv7k57jZ3qqDuEFEb77Djbj/T01SVXBgQw9EcUK9fU3iPM45WEbtDZAFPJlHrZtQjYzMZ3iDI4NDvuBY2dv1FM2oKRUdYE2wPd/NAZ8GdZVVZtRbca6sFdrTK6Y5xFe54RVIpPy7h+AOgneAGpVNKEhFZocxcYZe8YrSoSdnvm1CNFoJPVfeaRjfajHbhzMfDQl/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFe1zSoQ+kHyiZLFYXrU38ThIDVxQjHr7ymm2gwWlE8=;
 b=kCSMt/nIge0W8BswNxbe86hrU0z8Ipbx5A1c62qGxnx74+eqk8SQdvc1LqSyjq8n1UF74U6IqCvjAI90W8GbiCkMV5fD4OfxiG+7LM/feeRGSTi/3znm8J+QjF57CVQmkBh90uWn6tX/ALCl8/tn4aZRElxFGqnC92nCwbzKsMA65kL9GUG+j0MrUUooIHVMHKGmgVNhdcgtH5PWP1hkSwP9JdNduPKVHZQ8D3M6YVNcsvn3R+jdW4d0hdUF24FeaWHOwtKq/9qUSUEnbQjdXBBV6hho5rK3Djqcho/3irZOcJKJ9hBrKzr76EtabgEH3qNxWYhETpcG2rKvRDZFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 21:23:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:23:34 +0000
Date: Wed, 29 Jul 2026 14:23:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
Message-ID: <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: c009227a-4688-4aa3-c744-08deedb7a59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: t6wyY48YNwCyend+rvoAYArctKwBsQQu1PhRi5DmsW5/j9qfGxEmhdUBL2fdwbp0uT/GKHXK9S+Sf/RLEbBSGZ5jlqy0SiN6/FAS4ZeWZwcub9mmlUwOrqxrNmeqwWH0vOMw52KdLPr9v8G28Nt7ZTJilMR8D3tft+KAyJKd488rK4v/wVLhHnGg7c2Obi8QFvLmat1GQkuavCLRklZG3Ajb1U4tqrcipEXGCehpg3+XORYnSAyn6n+W4O5y6CIV+YizaZiYM6xSNPq2kHNT3R3bWPM8BZeOLviKmmIQassGTFTegb/xorfRdNQxOB/zDvyCVFm9ST65ig3OfdvTe9xQlF2i92DtW+t3AeaTZVI/47jUborOPtEezkq3KGcJDDl/KOAlvDcaciHQxwyqcxmuYNteJyUal+n2M1IYgmT1EfX6egwxwpUqa0wnB23LcLmstTA3tG6+Mxkb6ShMGqUF0GaS0bnnAz/F6VjUYubyxCSNR+ARsENBDNWK80WU0JqTtQwY+WaM6HaVmLDd1N6IfeTVQusjn21j1Auq8DCkk9eFt0yxSJquw+7UGEMNjvA6duHXElTG4Tg5lx76z1LLBChLJIxHbVw5BwbOMFHCrOADc0HouWall11pFnXOjiXC3HTv3fzra3gBekScMN+eB2YpetlMZVMCDxVHxhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?92iEmTLazVbLTZcRfYYCSEaMaTk3sd592QRdknhHB7mu4px8604aVfqQLULZ?=
 =?us-ascii?Q?1VkmmcZThqZkANxqJaKNtbrgq//k4ZOEIZHvSr/yszBF5fcw8K5raUafcWLM?=
 =?us-ascii?Q?qsQxcywX2LX/R0tAwY62XykM6lfG5MsN/PdR+hKlvCx6LV2mcEyw+3J1nXFD?=
 =?us-ascii?Q?OPm6Pc/HlltODn/OrcezszBAPYw9LBwvrq3TouVYK7iL/jlcNwsMV0sk3BiW?=
 =?us-ascii?Q?D8nOxwIpVQIK9+Wfu98B/4OBYwuxAgZe5E4LsIzUDeTBmXqZ5GhIouzWMA5+?=
 =?us-ascii?Q?4BRlSrJKp8dhJp0aNK1kulVNLuIMNDtSlgMO+Kp2wyPYPA01A3zLku04Ft0O?=
 =?us-ascii?Q?1NK42jkYTuxDGIqOcaMxX6EHNpyhlZ1B66SxMGFF6u7E7IbYPqGKGuFtCaz/?=
 =?us-ascii?Q?fsAzmdBvNGA/Tyq+kd6LoREdT81SyIK8vY+JMi8u8vq89ndyKWpwvCDO93sK?=
 =?us-ascii?Q?RKc+I9f9iICuXEYsu+Fewy2X29SREQEia7S42jCAY2Tic+oJC3hDCXyGALKE?=
 =?us-ascii?Q?GljI4qYg9ynV+rLUMyaYC1geAyEQudZ6WRvLa4vDvj7wqd94slEDp/4XWSnr?=
 =?us-ascii?Q?6FnlggQKSpbp5xD7ZDuugwQL2/5JzwOsrEgv3S5U2R+WuoA6Agr6HoeWq8sm?=
 =?us-ascii?Q?FYisPKhQDepvfOeBTtMXoJe86tWfs3wUGMtDxzMLJoBUOVsb8WYWxndJp5dj?=
 =?us-ascii?Q?NERuIdJ28E1VDv+qfsWBvR6H6GRSPHc59vrlQbP/L3vkAX8lYNcEQp3uedy5?=
 =?us-ascii?Q?41uMpZJkK4kH2AclUotSHAfcmk5dDN+cO3D3MGpLXSgZI4eWu4V59tH8/ykq?=
 =?us-ascii?Q?N/5xJScJV7uqiS+g8AZk29DUC+72/EtQWQfrCY3WwOwHTQrZ2g9m/wBnQjDM?=
 =?us-ascii?Q?ede+lymjHGJlctYPw39yh+dRn1vbeZQBm/sORXXYqTg0ZN0JgU1o8StFfLoZ?=
 =?us-ascii?Q?U4mHwkfXMsryTDg6u0XQFosPYkr86EpYe0Z8LYyEmZftdC1Irz0e0sVXuw/O?=
 =?us-ascii?Q?M+nnXCLWzbcd+2W5fj2wu4frsCPl1GVtng1gaI9Y8Z1k5t3mLQhnzJe2cm9+?=
 =?us-ascii?Q?fw6wK489UwjbghQ7WJsJajfRmeYD5R/xOpxAjbOVEumhCeQBo++TtfEGR74g?=
 =?us-ascii?Q?Uo9qOObyKQVQUZN9zbCFSttGHD7VyT0ZVSKcSUh276jSJFcrsULnqQG+huPv?=
 =?us-ascii?Q?lJuJ/vZC7BSwvFAsGRF11Ob+OFK8tHcMWd+N/OxAGWHES20XVIccTuaghOuw?=
 =?us-ascii?Q?uLHKZIHcDqQzJnDvrtJjFfr4SG8a6LxxqHvuODXSnxtQDp4ZRC7Uft9a9S+1?=
 =?us-ascii?Q?CeqA1zwpz8LoiLgP/TTZoUqMawDFMNFR76t3OHmnS7ylojiiYifGUPil5o04?=
 =?us-ascii?Q?aUALsfsShqbjPyv0JScbidDoq6+SKWiGYS9tcO79pJD8mRxUK2ed9nEOEseO?=
 =?us-ascii?Q?yTO2iXcfXQsX4elPz+nT9TlVRxXrCBDema/UDmIWqWRI65/tVlj0YcCN1394?=
 =?us-ascii?Q?qrjBtaskM9kl6wJbezEhGBeTJQcIIQ89Gn0qFNXs0FsnOn/8hEvhf76GpRTa?=
 =?us-ascii?Q?AQFjSEfagyVyU0nXy7c+z7RzFXWPe5GSSuEGURQzb303XTZc51HSh6PLRQTY?=
 =?us-ascii?Q?rThGzzHENsfXdGPIVs3WsSRXW/cW+4rYf9b7F1ehnmAjUk7MzxX7KcuM18CK?=
 =?us-ascii?Q?xVsPoUQetzpiUqTg3+bI/14TizY0aDS7BSw4sST3h/vvea/5PC8fkXI7bsYX?=
 =?us-ascii?Q?WqELgR1D7iKrE8B4Zg/JIM73P8RTGhQ=3D?=
X-Exchange-RoutingPolicyChecked: auz6FkbkVaFkVwNsvvpw4m9TZOvYIrCVU4Qvl2v/ItrTIVla0qwnpHhFJkocHF/3xpXVyBNYDNcNYdt1pKpwC9A2awED6mgBy/69F4rXYCOLV7w6D8U9svmvlddPkKWjmFJgK1wCenMht4YE1YTeGOYM98wJT3j1OYRjMXJ4oZ2D0b+F9CocGVnChLrmccG3yy/rHk/Bt1fbc6v2OS/kDtNcm6+ex0fsT8tWEuAbio94EUUNElj2gfNhrj52NL7QjEQn16FwmbltXP4OVIidqJUYLTJXVRd6ZClbJUOMylZQPNYyeLhmeLMjcXs/WsTCiH2XfKP7rNylnm4ShCaUpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c009227a-4688-4aa3-c744-08deedb7a59d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:23:34.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YetW6fqynN2tO4b/SJVXLIfr/6eqeVC+9AMlCWtiEtJeYKLlaSE3Z+cPEAFhnYct7NyjMN5a+g3KLNM/0cRczp6rcefuiopWq+gRxB8jVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
> name is present in the debugfs dump.  Using strstr() would match the
> workaround name anywhere in the dump buffer and with that we risk
> producing unexpected results if the checked workaround name happens to
> be a substring of another workaround present in the dump.
> 
> Fix that by making sure we match the workaround name with the full
> line from the dump.

There are other parts of IGT that use regular expressions from either
POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
it be possible to use one of those here instead of opencoding a match
function?


Matt

> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index ff5daf529831..d44431e7e61f 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -13,6 +13,43 @@
>  #include "xe/xe_wa.h"
>  #include "xe/xe_query.h"
>  
> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
> +{
> +	char *a = dump;
> +
> +	while (*a) {
> +		const char *b = wa;
> +
> +		/*
> +		 * Each workaround name is indented by one tab
> +		 * character; unindented lines are used as "section
> +		 * names" identifying the type of workarounds that
> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
> +		 * etc).
> +		 */
> +		if (*a++ != '\t')
> +			goto next_line;
> +
> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
> +			a++;
> +			b++;
> +		}
> +
> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
> +			return true;
> +
> +	next_line:
> +		/* No match for this line, advance to the next one. */
> +		while (*a != '\n' && *a != '\0')
> +			a++;
> +
> +		if (*a == '\n')
> +			a++;
> +	}
> +
> +	return false;
> +}
> +
>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  			       const char *debugfs_name, const char *wa)
>  {
> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  
>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>  	if (debugfs_dump) {
> -		char *has_wa = strstr(debugfs_dump, wa);
> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
>  
>  		free(debugfs_dump);
>  
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
