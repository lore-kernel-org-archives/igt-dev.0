Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B16CA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 08:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FAD10EC31;
	Thu,  1 Oct 2026 08:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TboUzbyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5D610E40D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790841774; x=1822377774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JDYTxDuY42IcKeXzUlEzLTJRPXpslahsw6FIq0H7aBY=;
 b=TboUzbyuDVg0gWa/0Yu5y3i+EscWFA+86G6YCQOxKCsuRpVHkGnVgvww
 xDJv9gp2uPFk6Ey5QOgyQFW7atCw1f3rajibuI6M0pGfjFq1SParh6Rzj
 rRC9IM5bx9V39LNwz1k818z8o4rM73VR7qcUfjnkCVMIULyEGyC1muXIL
 J3dexFGZN2ShL/uDRuBblHOvgukUdUKFdEHwxX/x5KkhtphzK0XbkBdvv
 xeMCWN8osxLSTf+35sHgHjo6HattM+hjwtS3T+2WxmuiHMeqI2F6FtpgX
 n91zHWMVEtiHLkxpO0JW5M53Uw1JLW3u1wD8+4ykVUMO+fahgE4wW/wJu A==;
X-CSE-ConnectionGUID: xZ3bIF1/RNe8Ubggas7mfA==
X-CSE-MsgGUID: az95N9MmRwiVIhtP1gPptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113380571"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="113380571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:02:52 -0700
X-CSE-ConnectionGUID: gn3v/8M1SHKP1nAXMvtMXg==
X-CSE-MsgGUID: dtNOJQbEQ8i8RCoD8qygrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="276063219"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:02:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:02:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 01:02:50 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpaoL3T7KL2sGhhyGDROaJB3IZaT7IEEhZ8EI7B/MxG9HGv3gEqxD4chFt8+ZhwC9HhTfV/TEUVKDD7siaF/M+DWeUkgOavBlaUeXcSWPkO3LvcaQIyHg7I9+Rs0lUT1bGCmlDfngpePSuo+7YZm9w0AlXlzw+pPk4TcdJ6Y07Y0Cf0aryoPpiT6ITsZ99e+0S8HyxYKlRee0hAwxcHDDm17TXeCQ0NUORlOJ01ZF6bxBTk99t2zbuWZfdb6F/Zmokh6Dlgn/tkc3pp77COCSAIOTerEQ+e+RYS165ZUWD6gYXWiZDaCynjJ0kbjH7VGKaHHPeuejVyYrsdaULnhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn1328b+ml2kpYX25Z22Gh1ZNhfKh+kOTxiMa7zSqWc=;
 b=AawfC29kKBpHMWkkIDTOhUk9hJsw9N7LW4EFUQEZMYyqn2B+9s1/A0XZLWW9uJ3uZLasLwBywFVI1GheMu2K07fZWFjuOG6rU22IDS1rnZ33+G3ntmH3WRNgJH3vTf97DEeESU6rXNQcg/Pgd4MFY9h0I/sqYsKZTlb3t8l3NExs1D7z7JEB9cjTOMcN5IzFs2jNwF8udmo2j09ybohvnSz+B1UcKrCWXszZk2z/ARurOXOmrh8CtQSzoxQnc6CT1qaZ0yiqyo4X+NbDO0xhvZogYuBnxjcGqIGEE/DciDJqM0TjTZNnYrXHdixMQ1Jptb4a5jypWwPbZ5/fa5gAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:02:47 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 08:02:47 +0000
Content-Type: multipart/alternative;
 boundary="------------gJUyjugncP5UmuuGaaV11EcN"
Message-ID: <78a09f35-284b-43cf-ba95-a12137c7fc04@intel.com>
Date: Thu, 1 Oct 2026 13:32:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] tests/intel/xe_err_injection: Add tests for L2
 bank Corr err threshold scenarios
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com>
 <92a2a31f-c7a5-49e0-91a8-3037631b1dc4@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <92a2a31f-c7a5-49e0-91a8-3037631b1dc4@intel.com>
X-ClientProxiedBy: MA5P287CA0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::17) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH3PPF801A91A7D:EE_
X-MS-Office365-Filtering-Correlation-Id: b29f7512-ad44-43c9-678a-08df1f92619d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|6133799003|4143699003|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xILqqmFxGZk8oKZKfU29Cr3gR+LaRNL5HnsEmh2lKK6WDf9oQAQ8brrN5Ev8lP281xCt6SWst7jMlZxuRJtaI5OwfKJluvolLdr2Py743SVhAIQfoxNXZ1k2rlnh1EXgbCqh+4XRigSiJ45gyNDfgBrMXYENm2ORNpv7WRUvKixPAYENAM3xDloZ09oe40yjgML9GC2tFSfraggFaET2U198jsjNDnhpFju985EPjZCkHi7HzOvaCv2ThGJJ+qPkt0m3qIHoPoqBpv+K1xD69fYRhB8nSQZrcbyqE19Z8LnkhLGW1o4QJqRGP8HH7nHPoQtV4gSOFbWJRGNtBMOPp2LdgnusgHicVMsr8dKtOfsQbfqpkZ/8IRIuiTvhRsy7QXDoRu3hjBbCzxOh7GQMU63273stSGRAA2wU8+odUgjS2F54SZQIsktE+Vn70IR/nQdTvDxzSIIXMHIGFfo4B9u2RzwJsSSzbF2ZIo/gL4GPVV6IIFOHoBALlJdBhogiFZjJz+dszcuocdj+W8QyRT+2RRSSTNioSaga58gEYRHhuEUxzZFnyHMzcRvZi/O1uxXzboQXbqHDwvOmhLiQLCvJzQK4oFv3048aeWw7RQd/OGzxW02OlI7OUI1GdloXAACec/0IyomKvVqTQdWRVG0piV3pCOcqUSwu4DkUk/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkN0UGVhS09kak9JL21SV00rVk0valJ6eDQ2bFppUEJOWmRzZnAwbTMzdW05?=
 =?utf-8?B?NDlHanBNM25rb1JKVzkvY1cxSUtuaFFDdUpjbUtxSHVLdTNUN05lbHJRN3Ri?=
 =?utf-8?B?b1dFSmc1YjZXSDhGRFRaeENZdlVDNWxZSUUySmZRTGhJeXVuZ2ZTREJseEdj?=
 =?utf-8?B?eEN6ZGVvbkZZLytpQVJhbDJrdHhvWWtuaVdvRmZ4UndZUmFybHlpT2Y0bnZP?=
 =?utf-8?B?alFFYW9EQXBpOVpsUzFaZnc2YktxeExqY2RlRm5TU29iMS80WXhoMTRhbFUv?=
 =?utf-8?B?U0RIMWJCR2R4czY3QzRWbGpnTXVQaW9zOWRjbzFGTk1zZ2RBUHJ3RjlIWllw?=
 =?utf-8?B?K2Nvc04rbHpkOHduYklSVVAyUXJJTy9mN0o5dU1ac3ozZzZsWHVkenYvNWxi?=
 =?utf-8?B?U1o2c3dONTNGRGdBUHYzZldFankwUmhGNmdoTUozZFNES0JoUjUvU0FiS2ps?=
 =?utf-8?B?RVRFc1NCRSsxSlhLcnJZTUtxMDRrUkcxK3dwRWV2KzNFYzdIdnZPeTJ2SWpj?=
 =?utf-8?B?MDRIMGFuTnJSeUpMYndpV1JqRjR5aDh1eWZRMXlOcTFRWmEzNTI4UThVUjRL?=
 =?utf-8?B?NFhoMjdBeUVSa0ljYXhhamViOTlOSG4vUTVVZU1aZnk1c21SdEpLQXJPelpr?=
 =?utf-8?B?empBbi9Jd3F4UHpkWmdoZkNpRnBrSXQ1R21sS2hzbGxjb1luZ0YxVjkwYWhp?=
 =?utf-8?B?Z3h4TDJ1MVlLeWtmZUtXVG9Fbkd4eGJKYVI4c1FvTFhVbE16N05SUXpDb2pk?=
 =?utf-8?B?VWtDZUtLbktrcXQwd0ZZUC9GMlBQQ1RVempjRFcyS3FMSWtuR015dWk1R2dC?=
 =?utf-8?B?U2dEUEVJZE95TXk2Nzl3Uk0zaVhnbkh1dktaY3gyN2RsZnlaWHhUMGtFajZB?=
 =?utf-8?B?QkFaUyt2Q1AxUFNWQlBOZERxNjFteFY0N0ZobnUxTWF2WDJlRzFQK3FqSDd3?=
 =?utf-8?B?YjNSNi9iTjlPUkg2WmFTSEUwVlJFdDdTQVpjZ3BXcDVDSjZ1ZFI2aE41UGtL?=
 =?utf-8?B?TCtyNnFYY1lGbVVrY3kySmJHQnJmZXFkZUJ1L1Q1cXBLdjNMYXNxY0VFSndp?=
 =?utf-8?B?T2ZBY0h6N0pha0RreHoyZUF2RVpzSVFtNDl1TzJsY2ZiUFAwc1lCTDhZbDhu?=
 =?utf-8?B?TGpCZWp5MDZzTGwrNzZRRjdCdHNISXNhbjdFaW92T1IrNFpybWdVZnU3Vm54?=
 =?utf-8?B?cW9Ba08wMEdEZkdGNFRaNEJlWldENlg3UU8zeU1hUlJJVENqc3BpNGtLNEFU?=
 =?utf-8?B?aUM0dlEvNVR0ZUVxK0hNRjhFMkpkT0l6RVNsbXhablM5czZ2TXhrTCt2L1JI?=
 =?utf-8?B?NFV0eDJKM0QvR2pGalVjNUJLd1BDam5VeG9TZ01xRHlpL1NFN1RBN29Ja0My?=
 =?utf-8?B?eUtkMzlPKzExLzVZL2R2d1dRS3lhQllYSVh5ZGpXazA4cmhGRXlVQk5tZjdp?=
 =?utf-8?B?ZEExQVRZbFRIWENIcEZTSUd3c1ZqanpKVytOeWJzZlRocTA2Ny9ubERBZ2lY?=
 =?utf-8?B?TzQyZDR3cEw0OHFjRTZPRUhYb25KS0FHalJqcnIyUy82WnljV0VBNllUdmRE?=
 =?utf-8?B?TFAwamlsTzlMdmo5c3FycUl2NTR6ZUZPQVRkRlZJK2pwTnhDZEFwYjhURTlF?=
 =?utf-8?B?YWpMRlduVit6dGF5dkM5TytFVmdvbXV4ejBXSUQrMjIrMVYyWTRpWUVqUE1x?=
 =?utf-8?B?YTBnK1NnNWNUamp2cjJ3VFRqNlRXTm5UYnJXaFFvdDJrajBlaFpFbVVWdWZ6?=
 =?utf-8?B?YjJUaDYyQ05JdVV1N0VDa0RhbXd3TE9lMzZnRjArQ3N1ZHBLTXRKM25rOTZD?=
 =?utf-8?B?K21sSkZ0V0RQbHRVbUJ4VnoyR1MweTlHK1RzTmxNZWhRbmVqaU1ZOElObjAv?=
 =?utf-8?B?Vm9mWlc1amNiMTBNYTMvL0l4WGRQTEdISDQva0thcGdkbXNTV2gwVTNGMkpH?=
 =?utf-8?B?TFF3QU5wMWhGemZ5SmVUbERBei9JQXd2TWw3QmZtbE9lZ2czUVdIYTZLcGw5?=
 =?utf-8?B?UUhCMlphcTF3SnhsalNNcExhK1VWV3JENllSZU1JNUJ2VUxBeVFEek9nSkJM?=
 =?utf-8?B?OEJ0aE93am5QQ0lVZGlDaXpsUnlyK1pZdXl1VmR4QUZrY3RndjR5R1hUZngr?=
 =?utf-8?B?S0dTdTVRSFBBbE5LdDdXS0RiNUdEQXhlTUZwaXFnM0g1NGs2V1JUNnNzc3dp?=
 =?utf-8?B?Y0tLZUZDOUFzdnMzRnlGUDB6R3lhMTlRNTJMVTl2WkVPZU9uVzRoWHU4clNJ?=
 =?utf-8?B?eEQ3NTk5K0FrZjlEaFpwMU0zU0N0RWpVZmFkcGNkbysrWWdxTDFtNTI3cDZk?=
 =?utf-8?B?Z0IrZ3FwbHQySnI2R2dWRWFPR21xOEFvdFEzZjlMd2ltNjREMm9HV0YwMHoy?=
 =?utf-8?Q?e/YwBLfPnfhH32SXPzsije+gX7zWaSiDS7PVu?=
X-Exchange-RoutingPolicyChecked: ssqVIyiH3RrOvfKifffB0ZKZzIoGygkhIEItEKdG5PKOq5g+4ONl0vSpfYg/vL/DsQ8Ctvg1znYYRNbohU91o3NTsBuqrz8+WMPcZUL5RgiQTPx8N6ymkQD7jZfPGEpLPVhHq8gQm77AhGjOrm2c8943qI2eo70ymCs9W7mATRMK+Ka+vMP6UQndWNL0wp9wlYX2xWSERKaMcyC+nIw4g8PiKmGzEaymA3h6/Zha8MDYa1aO+eE0/RLcEvTtmJORYMR+lwkZsDhlxQ7AOFMWPMeIa7Ey5ALfIsNNbbyMuFhjqJJkPetEko/6Ff4OQvy9hrkmQMMtAhgqMmoySwevHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b29f7512-ad44-43c9-678a-08df1f92619d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:02:47.6790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr9tWh+V0oXRBtWUcufMSRzDobAHdx5OOU4f+GkXqvwNQqpOGdJ2JETYLNy/69wkGHeXNkcrVudnzSB3cII9ciIh7HL/wYmtEkzcl/ui1bBFAnfWZVq3DvVcgb1LnU2L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
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

--------------gJUyjugncP5UmuuGaaV11EcN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-09-2026 13:44, Purkait, Soham wrote:
>
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Introduced L2 bank correctable error threshold subtests:
>>     - single correctable error
>>     - Correctable error with threshold set to 1
>>     - 16 Correctable error injections with threshold set to 0xF
>>
>> Add DRM RAS netlink error-notify event subscription to verify
>> correctable error detection across all the above subtests.
>>
>> Cc: Purkait Soham<soham.purkait@intel.com>
>> Cc: Riana Tauro<riana.tauro@intel.com>
>> Cc: Gupta Anshuman<anshuman.gupta@intel.com>
>> Cc: Jadav Raag<raag.jadav@intel.com>
>> Cc: Nilawar Badal<badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh<mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi<harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Disabled multicast before arming the injection to perform an unicast
>>     injection.
>>     Updated the condition to verify response from wait_for_error_notify_event
>>     condition from an event error value of exactly 1 to the configured error
>>     threshold.
>> v4:Add support for steer semaphore while disabling and enabling
>>     multicast (Soham)
>>     Used updated library names with igt_drm_netlink_* prefix (Nikula
>>     Jani & Kamil)
>>     Updated error event name from error-notify to error-report to align
>>     with the latest changes in drm-uapi/drm_ras.h
>> ---
>>   tests/intel/xe_err_injection.c | 292 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  11 ++
>>   2 files changed, 303 insertions(+)
>>
>> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
>> index 683994d1c..cdf15f70b 100644
>> --- a/tests/intel/xe_err_injection.c
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -35,6 +35,14 @@ enum {
>>   	RECOVERY_TIMEOUT,
>>   };
>>   
>> +time_t event_timeout = 10 * 1000; /* 10 seconds */
>> +
>> +/* Cleanup helper for injection test functions */
>> +#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
>> +	igt_drm_netlink_cleanup(&ctx); \
>> +	release_forcewake(fw_handle); \
>> +} while (0)
>> +
>>   static void run_xe_compute_on_all_engines(int fd, bool state)
>>   {
>>   	struct drm_xe_engine_class_instance *hwe;
>> @@ -295,6 +303,272 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>>   	gt_uc_wkr_parity_recovered = true;
>>   }
>>   
>> +/* Inject a GT correctable error */
>> +static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +	/* Disable Multicast for unicast error injection */
>> +	acquire_steering_semaphore(mmio);
>> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +
>> +	/* Arm the Injection */
>> +	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
>> +	igt_info("Armed L2 Bank Correctable Error Injection\n");
>> +
>> +	/* Rollback to Multicast */
>> +	modify_reg_bit(mmio,
>> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
>> +		       true);
>> +	release_steering_semaphore(mmio);
>> +}
>> +
>> +/**
>> + * SUBTEST: test_l2-bank-corr-err-threshold-1
>> + * Description: Inject single bit error injection in SSA data array when this bit is written
>> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
>> + * Functionality: error injection
>> + */
>> +static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	int ret;
>> +	uint32_t current_threshold = UINT32_MAX;
>> +	struct app_context ctx;
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	ret = igt_drm_netlink_init(&ctx);
>> +	if (ret < 0) {
>> +		release_forcewake(fw_handle);
>> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
>> +	}
>> +
>> +	/* Subscribe to error-report event */
>> +	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
>> +	}
>> +
>> +	/* get current GT Correctable error threshold */
>> +	/** TODO
>> +	 *  Fetching node_id and error_id dynamically is pending to implement.
>> +	 *  For now, using
>> +	 *  node_id=0 (correctable_errors) and
>> +	 *  error_id=1 (core_compute)
>> +	 */
>> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
>> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
>> +	ret = igt_drm_netlink_get_error_threshold(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
>> +	}
>> +	current_threshold = ctx.error_threshold;
>> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
>> +
>> +	/* Set GT Correctable error threshold to 1 */
>> +	ctx.error_threshold = 1;
>> +	ret = igt_drm_netlink_set_error_threshold(&ctx);
>
> Instead of setting the the threshold value separately better pass it 
> through a parameter in "igt_drm_netlink_set_error_threshold" and check 
> the validity of the same.
>
> Thanks, Soham

This test's purpose itself is to make the threshold value to 1 and check 
the correctable error exceed threshold scenario. So setting the 
threshold value inside the test seems to be safe for me. Also, threshold 
value is being restored to the previous value at the end of the test.

Thanks,

Ravi Kishore K.

>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
>> +	}
>> +
>> +	/* Inject a GT correctable error */
>> +	l2_bank_corr_err_injection(mmio, fd);
>> +
>> +	/* wait for 10 secs */
>> +	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
>> +	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
>> +		log_status(true, "L2 Bank Correctable Error with threshold 1");
>> +		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
>> +			 "value=%u match=%d\n",
>> +			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
>> +			 ctx.event_error_value, ctx.event_received);
>> +	} else {
>> +		log_status(false, "L2 Bank Correctable Error with threshold 1");
>> +		/* restore threshold before failing */
>> +		ctx.error_threshold = current_threshold;
>> +		igt_drm_netlink_set_error_threshold(&ctx);
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
>> +	}
>> +
>> +	/* restore GT Correctable error threshold to original value */
>> +	ctx.error_threshold = current_threshold;
>> +	ret = igt_drm_netlink_set_error_threshold(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
>> +	}
>> +
>> +	CLEANUP_ON_ERROR(ctx, fw_handle);
>> +}
>> +
>> +/**
>> + * SUBTEST: test_l2-bank-corr-err-16-times
>> + * Description: Inject single bit error injection in SSA data array when this bit is written
>> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
>> + * Functionality: error injection
>> + */
>> +static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	uint32_t current_threshold = UINT32_MAX;
>> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
>> +	int ret;
>> +	struct app_context ctx;
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	ret = igt_drm_netlink_init(&ctx);
>> +	if (ret < 0) {
>> +		release_forcewake(fw_handle);
>> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
>> +	}
>> +
>> +	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
>> +	}
>> +
>> +	/* Query error counter before injection */
>> +	/** TODO
>> +	 *  Fetching node_id and error_id dynamically is pending to implement.
>> +	 *  For now, using
>> +	 *  node_id=0 (correctable_errors) and
>> +	 *  error_id=1 (core_compute)
>> +	 */
>> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
>> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
>> +	ret = igt_drm_netlink_get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "Failed to query GT correctable error counter before injection\n");
>> +	}
>> +	gt_corr_counter_before = ctx.error_value;
>> +
>> +	/* get current GT Correctable error threshold */
>> +	ret = igt_drm_netlink_get_error_threshold(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "Failed to query GT correctable error threshold before injection\n");
>> +	}
>> +	current_threshold = ctx.error_threshold;
>> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
>> +
>> +	for (int i = 0; i < 16; i++) {
>> +		igt_info("****** Injection iteration: %d ***********\n", i + 1);
>> +		/* Inject a GT correctable error */
>> +		l2_bank_corr_err_injection(mmio, fd);
>> +
>> +		/* Query error counter after injection */
>> +		ret = igt_drm_netlink_get_error_counter(&ctx);
>> +		if (ret < 0) {
>> +			CLEANUP_ON_ERROR(ctx, fw_handle);
>> +			igt_assert_f(false,
>> +				     "Failed to query GT correctable error counter:iteration %d\n",
>> +				     i + 1);
>> +		}
>> +		gt_corr_counter_current = ctx.error_value;
>> +		igt_info("GT Correctable error counter incremented by : %u "
>> +			 "since before initial injection\n",
>> +			 gt_corr_counter_current - gt_corr_counter_before);
>> +	}
>> +
>> +	/* Confirm whether error counter incremented by 16 after 16 injections */
>> +	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
>> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
>> +	} else {
>> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "GT Correctable error counter didn't increment "
>> +			     "by 16 after 16 injections\n");
>> +	}
>> +
>> +	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
>> +	if (ret == 0 && ctx.event_error_value == 1) {
>> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
>> +	} else {
>> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false, "Did not receive expected error-report event or "
>> +			     "error_value after injection\n");
>> +	}
>> +
>> +	CLEANUP_ON_ERROR(ctx, fw_handle);
>> +}
>> +
>> +/**
>> + * SUBTEST: test_l2-bank-single-corr-err
>> + * Description: Inject single bit error injection in SSA data array when this bit is written
>> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
>> + * Functionality: error injection
>> + */
>> +static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	int ret;
>> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
>> +	struct app_context ctx;
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	ret = igt_drm_netlink_init(&ctx);
>> +	if (ret < 0) {
>> +		release_forcewake(fw_handle);
>> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
>> +	}
>> +
>> +	/* Query error counter before injection */
>> +	/** TODO
>> +	 *  Fetching node_id and error_id dynamically is pending to implement.
>> +	 *  For now, using
>> +	 *  node_id=0 (correctable_errors) and
>> +	 *  error_id=1 (core_compute)
>> +	 */
>> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
>> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
>> +	ret = igt_drm_netlink_get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "Failed to query GT correctable error counter before injection\n");
>> +	}
>> +	gt_corr_counter_before = ctx.error_value;
>> +	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
>> +
>> +	/* Inject a GT correctable error */
>> +	l2_bank_corr_err_injection(mmio, fd);
>> +
>> +	/* Query error counter after injection */
>> +	ret = igt_drm_netlink_get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "Failed to query GT correctable error counter after injection\n");
>> +	}
>> +	gt_corr_counter_after = ctx.error_value;
>> +	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
>> +
>> +	if (gt_corr_counter_after > gt_corr_counter_before) {
>> +		igt_info("GT Correctable error counter incremented by %u after injection\n",
>> +			 gt_corr_counter_after - gt_corr_counter_before);
>> +		log_status(true, "L2 Bank Correctable Error");
>> +	} else {
>> +		CLEANUP_ON_ERROR(ctx, fw_handle);
>> +		igt_assert_f(false,
>> +			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
>> +	}
>> +
>> +	CLEANUP_ON_ERROR(ctx, fw_handle);
>> +}
>> +
>>   static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>>   {
>>   	igt_info("Starting Error Injection test: %s\n", injection);
>> @@ -302,6 +576,12 @@ static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>>   		wkr_cmd_parity_err_injection(mmio, fd);
>>   	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>>   		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +	else if (strcmp(injection, "test_l2-bank-corr-err-threshold-1") == 0)
>> +		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
>> +	else if (strcmp(injection, "test_l2-bank-corr-err-16-times") == 0)
>> +		test_l2_bank_corr_err_injection_16_times(mmio, fd);
>> +	else if (strcmp(injection, "test_l2-bank-single-corr-err") == 0)
>> +		test_l2_bank_single_corr_err_injection(mmio, fd);
>>   	else
>>   		igt_info("Invalid Error Injection specified\n");
>>   }
>> @@ -335,6 +615,18 @@ int igt_main()
>>   		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
>>   	}
>>   
>> +	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
>> +	igt_subtest("test_l2-bank-corr-err-threshold-1")
>> +		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
>> +
>> +	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
>> +	igt_subtest("test_l2-bank-corr-err-16-times")
>> +		inject_error("test_l2-bank-corr-err-16-times", &mmio, fd);
>> +
>> +	igt_describe("Inject a single GT correctable error and validate counter increment.");
>> +	igt_subtest("test_l2-bank-single-corr-err")
>> +		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
>> +
>>   	igt_fixture() {
>>   		xe_mmio_access_fini(&mmio);
>>   		drm_close_driver(fd);
>> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
>> index a70e6af22..a4b99711e 100644
>> --- a/tests/intel/xe_err_injection.h
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -22,10 +22,21 @@
>>   #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>>   
>>   /* Node types for error counters*/
>> +#define NODE_ID_CORRECTABLE_ERROR 0
>>   #define NODE_ID_UNCORRECTABLE_ERROR 1
>>   
>>   /* Error types for error counter */
>>   #define ERROR_ID_CORE_COMPUTE 1
>>   
>> +/* L2 Bank (LBCFLOCKMSGREG) error injection */
>> +#define L2_BANK_ERR_INJ 0xB1B4
>> +#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
>> +#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
>> +#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
>> +#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
>> +#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
>> +	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
>> +	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
>> +
>>   #endif /* XE_ERR_INJECTION_H */
>>   
--------------gJUyjugncP5UmuuGaaV11EcN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-09-2026 13:44, Purkait, Soham
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:92a2a31f-c7a5-49e0-91a8-3037631b1dc4@intel.com">
      
      <p>Hi Ravi,</p>
      <div class="moz-cite-prefix">On 03-09-2026 13:03, Ravi Kishore
        Koppuravuri wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">Introduced L2 bank correctable error threshold subtests:
   - single correctable error
   - Correctable error with threshold set to 1
   - 16 Correctable error injections with threshold set to 0xF

Add DRM RAS netlink error-notify event subscription to verify
correctable error detection across all the above subtests.

Cc: Purkait Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com" moz-do-not-send="true">&lt;soham.purkait@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com" moz-do-not-send="true">&lt;riana.tauro@intel.com&gt;</a>
Cc: Gupta Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com" moz-do-not-send="true">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Jadav Raag <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com" moz-do-not-send="true">&lt;raag.jadav@intel.com&gt;</a>
Cc: Nilawar Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Koujalagi Mallesh <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com" moz-do-not-send="true">&lt;harish.chegondi@intel.com&gt;</a>
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com" moz-do-not-send="true">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v2:Disabled multicast before arming the injection to perform an unicast
   injection.
   Updated the condition to verify response from wait_for_error_notify_event
   condition from an event error value of exactly 1 to the configured error
   threshold.
v4:Add support for steer semaphore while disabling and enabling
   multicast (Soham)
   Used updated library names with igt_drm_netlink_* prefix (Nikula
   Jani &amp; Kamil)
   Updated error event name from error-notify to error-report to align
   with the latest changes in drm-uapi/drm_ras.h
---
 tests/intel/xe_err_injection.c | 292 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  11 ++
 2 files changed, 303 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 683994d1c..cdf15f70b 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -35,6 +35,14 @@ enum {
 	RECOVERY_TIMEOUT,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	igt_drm_netlink_cleanup(&amp;ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
 static void run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -295,6 +303,272 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+	igt_info(&quot;Armed L2 Bank Correctable Error Injection\n&quot;);
+
+	/* Rollback to Multicast */
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-threshold-1
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t current_threshold = UINT32_MAX;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	/* Subscribe to error-report event */
+	ret = igt_drm_netlink_subscribe_error_report(&amp;ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to subscribe to error-report event (ret=%d)\n&quot;, ret);
+	}
+
+	/* get current GT Correctable error threshold */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to query GT correctable error threshold before injection\n&quot;);
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info(&quot;Current GT Correctable error threshold: %u\n&quot;, current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = igt_drm_netlink_set_error_threshold(&amp;ctx);</pre>
      </blockquote>
      <p>Instead of setting the the threshold value separately better
        pass it through a parameter in&nbsp;<span style="white-space: pre-wrap">&quot;igt_drm_netlink_set_error_threshold&quot; and check the validity of the same.</span></p>
      <span style="white-space: pre-wrap">Thanks,
Soham</span></blockquote>
    <p>This test's purpose itself is to make the threshold value to 1
      and check the correctable error exceed threshold scenario. So
      setting the threshold value inside the test seems to be safe for
      me. Also, threshold value is being restored to the previous value
      at the end of the test.</p>
    <p>Thanks,</p>
    <p>Ravi Kishore K.</p>
    <blockquote type="cite" cite="mid:92a2a31f-c7a5-49e0-91a8-3037631b1dc4@intel.com">
      <blockquote type="cite" cite="mid:20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to set GT correctable error threshold before injection\n&quot;);
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* wait for 10 secs */
+	ret = igt_drm_netlink_wait_for_error_report_event(&amp;ctx, event_timeout);
+	if (ret == 0 &amp;&amp; ctx.event_error_value &gt;= ctx.error_threshold) {
+		log_status(true, &quot;L2 Bank Correctable Error with threshold 1&quot;);
+		igt_info(&quot;Received error-report event Notification from %s:node_id=%u error_id=%u &quot;
+			 &quot;value=%u match=%d\n&quot;,
+			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error with threshold 1&quot;);
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		igt_drm_netlink_set_error_threshold(&amp;ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Did not receive expected RAS event or error_value after injection\n&quot;);
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = igt_drm_netlink_set_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to restore GT correctable error threshold after injection\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-16-times
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t current_threshold = UINT32_MAX;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
+	int ret;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	ret = igt_drm_netlink_subscribe_error_report(&amp;ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to subscribe to error-report event (ret=%d)\n&quot;, ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter before injection\n&quot;);
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = igt_drm_netlink_get_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error threshold before injection\n&quot;);
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info(&quot;Current GT Correctable error threshold: %u\n&quot;, current_threshold);
+
+	for (int i = 0; i &lt; 16; i++) {
+		igt_info(&quot;****** Injection iteration: %d ***********\n&quot;, i + 1);
+		/* Inject a GT correctable error */
+		l2_bank_corr_err_injection(mmio, fd);
+
+		/* Query error counter after injection */
+		ret = igt_drm_netlink_get_error_counter(&amp;ctx);
+		if (ret &lt; 0) {
+			CLEANUP_ON_ERROR(ctx, fw_handle);
+			igt_assert_f(false,
+				     &quot;Failed to query GT correctable error counter:iteration %d\n&quot;,
+				     i + 1);
+		}
+		gt_corr_counter_current = ctx.error_value;
+		igt_info(&quot;GT Correctable error counter incremented by : %u &quot;
+			 &quot;since before initial injection\n&quot;,
+			 gt_corr_counter_current - gt_corr_counter_before);
+	}
+
+	/* Confirm whether error counter incremented by 16 after 16 injections */
+	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
+		log_status(true, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;GT Correctable error counter didn't increment &quot;
+			     &quot;by 16 after 16 injections\n&quot;);
+	}
+
+	ret = igt_drm_netlink_wait_for_error_report_event(&amp;ctx, event_timeout);
+	if (ret == 0 &amp;&amp; ctx.event_error_value == 1) {
+		log_status(true, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Did not receive expected error-report event or &quot;
+			     &quot;error_value after injection\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-single-corr-err
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter before injection\n&quot;);
+	}
+	gt_corr_counter_before = ctx.error_value;
+	igt_info(&quot;GT Correctable error counter before injection: %u\n&quot;, gt_corr_counter_before);
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* Query error counter after injection */
+	ret = igt_drm_netlink_get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter after injection\n&quot;);
+	}
+	gt_corr_counter_after = ctx.error_value;
+	igt_info(&quot;GT Correctable error counter after injection: %u\n&quot;, gt_corr_counter_after);
+
+	if (gt_corr_counter_after &gt; gt_corr_counter_before) {
+		igt_info(&quot;GT Correctable error counter incremented by %u after injection\n&quot;,
+			 gt_corr_counter_after - gt_corr_counter_before);
+		log_status(true, &quot;L2 Bank Correctable Error&quot;);
+	} else {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;L2 Bank (GT) Correctable Error Injection count not incremented\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info(&quot;Starting Error Injection test: %s\n&quot;, injection);
@@ -302,6 +576,12 @@ static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 		wkr_cmd_parity_err_injection(mmio, fd);
 	else if (strcmp(injection, &quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;) == 0)
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else if (strcmp(injection, &quot;test_l2-bank-corr-err-threshold-1&quot;) == 0)
+		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
+	else if (strcmp(injection, &quot;test_l2-bank-corr-err-16-times&quot;) == 0)
+		test_l2_bank_corr_err_injection_16_times(mmio, fd);
+	else if (strcmp(injection, &quot;test_l2-bank-single-corr-err&quot;) == 0)
+		test_l2_bank_single_corr_err_injection(mmio, fd);
 	else
 		igt_info(&quot;Invalid Error Injection specified\n&quot;);
 }
@@ -335,6 +615,18 @@ int igt_main()
 		inject_error(&quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;, &amp;mmio, fd);
 	}
 
+	igt_describe(&quot;Inject GT correctable error and validate error-report event with threshold set to 1.&quot;);
+	igt_subtest(&quot;test_l2-bank-corr-err-threshold-1&quot;)
+		inject_error(&quot;test_l2-bank-corr-err-threshold-1&quot;, &amp;mmio, fd);
+
+	igt_describe(&quot;Inject GT correctable error 16 times and validate counter/event behavior.&quot;);
+	igt_subtest(&quot;test_l2-bank-corr-err-16-times&quot;)
+		inject_error(&quot;test_l2-bank-corr-err-16-times&quot;, &amp;mmio, fd);
+
+	igt_describe(&quot;Inject a single GT correctable error and validate counter increment.&quot;);
+	igt_subtest(&quot;test_l2-bank-single-corr-err&quot;)
+		inject_error(&quot;test_l2-bank-single-corr-err&quot;, &amp;mmio, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&amp;mmio);
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
index a70e6af22..a4b99711e 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -22,10 +22,21 @@
 #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
 
 /* Node types for error counters*/
+#define NODE_ID_CORRECTABLE_ERROR 0
 #define NODE_ID_UNCORRECTABLE_ERROR 1
 
 /* Error types for error counter */
 #define ERROR_ID_CORE_COMPUTE 1
 
+/* L2 Bank (LBCFLOCKMSGREG) error injection */
+#define L2_BANK_ERR_INJ 0xB1B4
+#define DATA_1BIT_ERR_INJ_REQ (1 &lt;&lt; 3)
+#define FUSA_TEST_MODE_ERR_INJ_REQ (1 &lt;&lt; 2)
+#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 &lt;&lt; 19)
+#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 &lt;&lt; 18)
+#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
+	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
+	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
+
 #endif /* XE_ERR_INJECTION_H */
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------gJUyjugncP5UmuuGaaV11EcN--
