Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F9DC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 18:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395310E05A;
	Tue, 18 Aug 2026 18:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5L4v9sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4D10EC3C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787076527; x=1818612527;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8R4jG8QGvG6+gN/dT8Rf9p2Y5Zi6298dR6lrFVCqhCE=;
 b=f5L4v9slCFGepwPGGQyBdme1LMS3lwKZjRLKlp+LDGBDi6jafovu0PiA
 eOKMnjkkB8dDdov37To5yHL36uKmEchjQnwCoz+mnMRxNV+VQC43kfSvW
 9EZw/ZfliRX8WOIwd/OM4Oh04KUCbnXsdW4zeIWPCrUFVXTe7LXvV4vB0
 sxsRLl/SWOR/QiJ1UF6yE9iqaI/oe1A9DWs7NO2w3/EzG6H67Bklw0m0/
 anTWzbMrpoOqhw4M+zZxS/XdjFZrYyfuGPGrlqJJXFEOADyKpCnKOUw13
 6bRfPh2xKVNhamjZJWlr2+na28PRydOAqus7nBFhOZDIpjipCbURxo++i Q==;
X-CSE-ConnectionGUID: 1gfkHUfFRCiKSsnXISi6OQ==
X-CSE-MsgGUID: JTQtQgUMRDG5Jq9b7PddDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105112395"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105112395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:08:47 -0700
X-CSE-ConnectionGUID: azAUut3GRGma73tBcgsGJA==
X-CSE-MsgGUID: a/RW1c/9QqKX7Gw4R52JKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="270500058"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:08:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:08:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:08:45 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgps17imUNIDGO3Vrt2GMQg6hcacM7WXky8jScOoJDsgwTSWdmJIscgBsSVmIhbSTWvWjcC68oxZhk7i3bHrjwKenPQolVjN1F2209ux8CWSKIISn7JpVDEyI9H95MP/H4/uB3id9tA7DaQmTDSxCk3SqoWY2sIjTLULnA7q1Uw82wZ2by67n7lSpeGBIJKm6NoU3IHUieFaeymlguGPXrPOZh+I4HSoyWyPfhH+NP6bxBLDJrX2i6pttGWO7ne/NyH2S8F5ginlzsvm18VaTxn7kytRAjFzjklZCa0vna6lbRa0DtLWw2F/jx++D/3Z/BOSWLGSYVk4WXmW7zCSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXwWZ7ZX0vARhLcsALmpOuSqdeLIQ+c5fQEGlCdVNbw=;
 b=nsn72alQtcwmJQ6mleSCVwr4SsxZQ3cL1GJ3FlJ9NzOO1u2nNHxjKA7ClXeZOKRFWvtY5Vid2tobZsMJ5D330Vpi3rqa3NYNxe59UHk95kwkl7qkRoeGjWEh/iDHeT6XbS57suCdZph0PZlCwQRuKXLRljoxYsfXGtKqjWocl/v/uCNQtcrpjl3LdFA63VPrfqOOOcu7droCdDnvq/nHLT1mUaBj+9M6u9NsjzCQPtPgQvVmTtYTVwS2OqrV9nP6La7RCtFLTVc2SGjpIHUx4DEaGu6AY5bZozkcFhYbLVw0LeVQ/EQOh4KwgyCXKJCUuVK/zjdBknxPQT8+6Mr1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 18:08:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Tue, 18 Aug 2026
 18:08:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
In-Reply-To: <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
 <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 18 Aug 2026 15:08:34 -0300
Message-ID: <87tsorb8t9.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: e275ab1f-bbad-4fb6-d696-08defd53ba30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4ztbf4sREwUIiLJu9q5WLbDoyrMh6LwuWaaJ2yNLOldMq+vg47bgLlSOZCBBdIy+6uURFm/OfytEEoHeVL2RLbFNhItrF92HNwPco5elluiufnUSfn9/2eZyjh5oFmp9dNXqpimElPtW7lusmJY7fEyf5Wjc1yBggMVjNfRzyTP5z9ecTXKH/HgY2RbY4c6yhZxghUkFcal+L3WvkHoB5NvvYu08U/Pu6kf6wXg6d91AnaeK4RAZT9RWbL60767TLG58TFuy/XZ/RzqQ+aY6cLdirTUvvdVUbABZ/6H4QnalfqfnjFdKpTg3/Atry50HTD7lXqMWFQrdKxdSbuSdWLwlgqfIL0sMw0IQjbm4WX930OIICV2756lX9GaYclFy16bARqCKmpmDQj60N39OfiCBjzH874osijjVhITJTs6WQmm8IJBomdghpPZbX5RQLWAvZxzsRmrq8pkiUxyqqhnRYLh6XXrGnM6cDHbIXZToXtiRxgF+DNHbnDMMJ5UZJSYKdPvIUVYKlve2zrRobk018EVMCIxTnloWPRKybQC3EBas1OsH+bSVPa5iYk37YBw+2NOLIgU9cOyM22sKk7vHKHXE8yqbsJrIr4FUPS9ZY2dnT7eq2wGuT0tyX99T+fDRSjQomPtHpyY7swlIvD1K3czBOGJPiqzM5jEUJc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWD9xBSX9PBdH4yRyCOi7rRfHg+PJ+T3fnoe6MaSWx+KtHGRrlJXTADm51Lq?=
 =?us-ascii?Q?B8KR1rnX8/PdZo6IzpcCx2Kia4ShOmlTvjclMiNJKvaiERgZATmRqlPgOdxd?=
 =?us-ascii?Q?wxlGMoEVhS7/zxrehSrefjgrWDIJueWG87fKV/wJ5DJveCM0CWjPqcCCravO?=
 =?us-ascii?Q?mTcPTuG8p0FKN5tK16g9kVrUZxnrysxKjP+GJfVhGZnTYVnTXd+gwa5q7wUm?=
 =?us-ascii?Q?zIeVzceip0Dmbc9RwpTW8vRHfPNnUpaOs4i+CCGDaiQOzrSvnheaKGyLpkce?=
 =?us-ascii?Q?Wk1oP+o08eHQauV653VSUC/xiFAuBjytp29+hE2grtoQ+EWpIpNQqXRhp/gG?=
 =?us-ascii?Q?Enei6uwdGLp0TS2CPQU/IRbUfDQ09AnxS/MEhcYfjKU7ds3MBLB6tiwHwcXX?=
 =?us-ascii?Q?hu2SP0ViQO2WP7DNihxui0X57+uLSgxFHewzUR8WA+mcj0e6SVptty0O2IDF?=
 =?us-ascii?Q?UZBHzUMxL1eyh7LCQInxssCl4QRxvkCxODYXkM3sn4vhQCa5KHajg+w6EmIX?=
 =?us-ascii?Q?oqz7cj96Ic+/oUQE+IpHeZAbpcxwWAiLJ/yH2WzGPL5c8vSXSdqHpU0hibT8?=
 =?us-ascii?Q?tJrMi3FvShKf9iRvZPdyaXIKxHciDNEDQsFLrlB6K+BHIGyTd9rsxsU8EFqj?=
 =?us-ascii?Q?9LDTGJgB6gbMjosuhPD+0CrvnDdfuz1GShl7PawxYRdKxPF68l0gfvHk4/zF?=
 =?us-ascii?Q?9v1WVsSKcCoMJUlfTg5C+Uta98COWD2f28hRY+p5cmdGhLaCKaPLNsUUo/cG?=
 =?us-ascii?Q?jZFEr7L+zfdLgDNx87v2dAJdBfsw2sOSwqzoi23hJ73tsMiEthwxpqkJ7GZU?=
 =?us-ascii?Q?mLww50KuhpyJi7v+MSU89ixWJ9ajYGlX5qczGeupEV72H/cMapyDakt71Jds?=
 =?us-ascii?Q?9mo6y9AlLqwCwNVKGolftQzDuoI6wpzgu1VOeaLFh7LQGD/YUYtVf7XfVN1d?=
 =?us-ascii?Q?TZD+SxNKqJl3aGkrdrk57mhGRb2heVdgiL4oddYwWK9VQ1hqO6o9mzurMS3G?=
 =?us-ascii?Q?XKqrgQY8DBeYlXY2jyYvib7nBEhqkDSc2ogkLsVDt7ZwK9zdZ5AGyUsV6AKa?=
 =?us-ascii?Q?+DqaqUFy78ZOTQSLCrdo/mLGbZqnPiN68rZ1E9mRgCo26y6uX2Xlf+PTuA0D?=
 =?us-ascii?Q?/s1LcGR3ZKR3LcP41SQ01Fb+gN8NZPty/HGzqtz4tcvzLTLOwYw8h0arRc2U?=
 =?us-ascii?Q?yuubEtA916QSfyaesjC277Amq0lp8k7Ult6guIRzZEJCPLeBKFI0FkjKCtMu?=
 =?us-ascii?Q?7GPkQB8m695hoXLqptwQGdgEYmfx1kveDFp/2VxIFq19GqjNw/WOrVq+0avx?=
 =?us-ascii?Q?RYCoefIsxHfzDWfdvMGQLm5e7gRR+9uq1AM777M2e2+wbhCQDiWGDw4QE0rw?=
 =?us-ascii?Q?Tz+VHPA/5anRtjgHAlN6bJzbgxbuDobB4GkGYQMyxK37EOYPl1JSLA8U76fW?=
 =?us-ascii?Q?VyZBPKvJH7esVIo4wf9tHHi82g0GqDHVBmtMZXJ9URRrsiUw5ojWvKVq/UX7?=
 =?us-ascii?Q?s9ChcogE/n/5CKUzPA69U6M+lbnUxsf6mZgoVpNKlZqZydIY5gkMSDrpQYn+?=
 =?us-ascii?Q?f36FYsIGAE5RDUCu4s3JFToh+PcplsKKCPpl284UP3iWZ7LMvQ0m4QcnCe0G?=
 =?us-ascii?Q?EpMtOYGnJwQju0c78HRTgIo498NuMGXPLil4VfvrwRwWXdeTLbNUvgMXkYOW?=
 =?us-ascii?Q?vvk5OhxG0Cn8nU3T8OgqUB0/6V6HF4myJRh0BOuCWPVqImy9kBaZs1KGFcsu?=
 =?us-ascii?Q?IIyZ6jLOsQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: PTq8ha1NOI1WFS0hw/ELnECf67HA0k4f8Ewdl4pcYPedslp5lYf2wmC/udbvOa6wb0xoDRbxAt3bULucsKxp65kOHATSaO8NwF0Id6lXjtj+O1nR/vLdeSuZAhRBhWkKpzEbAhj8LsVnRTrxU7mZblPU9WldLBDYbgTe26GYGGZuRabvg4Q6BpW/elz+MkK3WKcoha7OnAZYyblPOC1ZCqrYpkJHLTtW1fBvCrDyZU7mA8tnQgk3q0D64SCof4XPH/9ARuj2+hlvrKtW3RZOpqWw0Lu6FGRGOs5pIqkR+oEtSqIXaDiwyN/WKAb5Efhjn5/kGffIdtl5pDQXs8Qryw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e275ab1f-bbad-4fb6-d696-08defd53ba30
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:08:38.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+yiWcOHCFozz4/43AQmU2tzbnaN/s41fxn6nyuDYONSJVLogmDSfqunIhUe8Oth6YnCGdAyzHJ7aZiffSbQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jul 21, 2026 at 03:59:58PM -0300, Gustavo Sousa wrote:
>> The function xe_wa() will cause a warning to be printed when an error
>> condition is found.  Since the current users of xe_wa() do not check
>> for errors, let's just convert the function to return a boolean.
>> 
>> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/xe/xe_wa.c      | 11 ++++++-----
>>  lib/xe/xe_wa.h      |  4 +++-
>>  tests/intel/xe_oa.c |  2 +-
>>  3 files changed, 10 insertions(+), 7 deletions(-)
>> 
>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> index 0f4d2edc0795..8c8f7156c21f 100644
>> --- a/lib/xe/xe_wa.c
>> +++ b/lib/xe/xe_wa.c
>> @@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>   * @fd: A drm file descriptor.
>>   * @wa: Name of the workaround to be checked.
>>   *
>> - * Returns 1 if enabled, 0 if disabled, -1 on error.
>> + * Return a boolean indicating whether the workaround is enabled.
>> + * On error, returns false and a warning is printed.
>>   */
>> -int xe_wa(int fd, const char *wa)
>> +bool xe_wa(int fd, const char *wa)
>>  {
>>  	char **dumps = xe_device_get(fd)->wa_cache;
>>  
>>  	if (igt_warn_on(!dumps))
>> -		return -1;
>> +		return false;
>
> Should we use an igt_assert() so that failures here get propagated up as
> test failures?

I'm not sure.  In the past I advocated for stuff under lib/ to avoid
causing asserts and leave that for real test code...

Cc'ing Ashutosh here, since he was involved in that discussion.

Do we have strong reasons to do an igt_assert() here?

A workaround like Wa_14026539277 will be checked in many tests and the
assert failure will cause disruptions on many unrelated platforms.

--
Gustavo Sousa

>
>
> Matt
>
>>  
>>  	for (char **dump = dumps; *dump; dump++)
>>  		if (debugfs_dump_has_wa(*dump, wa))
>> -			return 1;
>> +			return true;
>>  
>> -	return 0;
>> +	return false;
>>  }
>>  
>>  /**
>> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>> index f0a826553df8..aa1c50c0f9c9 100644
>> --- a/lib/xe/xe_wa.h
>> +++ b/lib/xe/xe_wa.h
>> @@ -6,9 +6,11 @@
>>  #ifndef XE_WA_H
>>  #define XE_WA_H
>>  
>> +#include <stdbool.h>
>> +
>>  struct xe_device;
>>  
>> -int xe_wa(int fd, const char *wa);
>> +bool xe_wa(int fd, const char *wa);
>>  
>>  void xe_wa_build_cache(struct xe_device *xe_dev);
>>  void xe_wa_free_cache(struct xe_device *xe_dev);
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index fcf1d71a167f..bdaa7141004b 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>  	 * can result in buffer overflows.
>>  	 */
>>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
>> -	    xe_wa(drm_fd, "14026633728") > 0) {
>> +	    xe_wa(drm_fd, "14026633728")) {
>>  		oa_exponent = max(oa_exponent, 8);
>>  		properties[9] = oa_exponent;
>>  	}
>> 
>> -- 
>> 2.55.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
