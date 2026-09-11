Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E03C88E4C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 08:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FCF10F56D;
	Fri, 11 Sep 2026 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJhzprlr";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2026 08:21:43 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024E10F564
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789114904; x=1820650904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IJh5PnaSP25n3kKUI59MaVdyQ3GkghVKEaL/JoHxZ4w=;
 b=LJhzprlrAQP/t285ZvkqVDNALpRFPCp3mqhahyGaoxHJg6rSw5VPSCZs
 6revVDfkJCTikx2uKE1Xg4wUZEm9V3wWbljxfVsP8z6UnS1MvoWuw46Uk
 s/aEF26FEfu2E6aufPCYB41iBrvBC9p6oFAtl0R+QUR14Pdp2hTG+qhur
 a6jg+7wWZseuh3UncrosQJjRK9hQUKz5MyxG7fT/VH3XoJ1K5uwqtoBF4
 tlP5lUduIBLXBVnJ30FT5Nigil9siHJhU8tUjyT+fYkEq/WiYKkwVqsOJ
 PH8plWRi265fFO6jpAqTQp8bjuRcmxKPNHFCGrjiFHYum3PQijhnSFQ6F Q==;
X-CSE-ConnectionGUID: lbHwsRs3QWi8IBugA/2hqg==
X-CSE-MsgGUID: GBLQQfFzSgm/itdmq+UHfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="85208"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208,217";a="85208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:14:38 -0700
X-CSE-ConnectionGUID: 8W1wP4rQTEaYFyXvKy7RcQ==
X-CSE-MsgGUID: HVy62Tj9SmiUlsvxrxG91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208,217";a="301757658"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:14:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 01:14:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 01:14:36 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 01:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/C5wdMmWLLGEjQVS9Yjh9ELa8S9DC0fjhyBXdkgbBss6G0pjH0+Pcdr5RyguJuJQQM8W4n1UKKHSOX5Ov3pHP8sB4d7alJaEQAsj3BBrJnuJo5duYTd32BKkCLij/bTUcp9pkyNFeh7yoPflkMnFJjKOTDZvMposql3r8EOfcsMW9T5Nnxpv6nR/Gxdyke4HKh1UMeVk3XaqIeWratIH18O1Skanid6TU32lGHS4kuAKFacP/8JmKenfem5gfFbuxD1sj00h13OgCrbkS01Le/eFngw1kK4D7a2i11n2GfJO3jwwfJpeFXdVhIm7QmQ7GuRnsgWdDLszgHpPRJwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQxkNdqFnBCMP36/KmyreBdh0VwteeCNj+z1eISUoM4=;
 b=sEFj6mq6PxwCjrDr/aNMUuohpoWBlM8vtEkhsRuAhPwOcatnq63tzu+6atB6gFw4VEPbPZQOEYADoF4813zG5RZXlX+8WvChoDpkvyYAxwhtzUoLhvluB2JK+SnAjKe6A+3CVBA+p+f2AEXc5HQu3Kf+ZdFMHTuEQIntJk9MSO/PETTWIe69vl1ff32+6v4FWUG3zlQKfRM5O/XSCMyufbQFB8gXEy8CKfcvFIN4+3cw6n4Mrjtv08Q/qnFk/OzxasJbw6NrTYNHsrCRZyGOMB3O33BnnwWJMTgvoCGfATutQ6YYiTde0TMGOdLWoat13y/M0IssyIcHySZroQf20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) by
 CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Fri, 11 Sep 2026 08:14:32 +0000
Received: from DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868]) by DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:14:32 +0000
Content-Type: multipart/alternative;
 boundary="------------aBfpmVYbp1mFc07DLOPtg7cB"
Message-ID: <92a2a31f-c7a5-49e0-91a8-3037631b1dc4@intel.com>
Date: Fri, 11 Sep 2026 13:44:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] tests/intel/xe_err_injection: Add tests for L2
 bank Corr err threshold scenarios
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5P287CA0162.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::17) To DM3PR11MB8716.namprd11.prod.outlook.com
 (2603:10b6:0:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8716:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: aad7f893-ef70-43b8-44b7-08df0fdcb544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DT60QZ4WghL9Sjzr/VBgbAkJTI6e3rhw4DkqteK2h3EvWNgvUFWcmaEOofsuYytG3vhEpQ4bxKthcm7pEyk6iQkxH7QkscFPxb+entxHHZX2ma7BwJJLcJeLe6oIg6v9N/DwXihjGYngxLM71GYBVacV0UtUb4WvQPIRARxPkGzk6xWZHVIIREVZ9htRp/v/qfE29Sctm6PReRQc6ir/PCFrJxbIavNGeO+Q5TlSr5fR5f44wivsacPQgoBQWgm2GzKJaBGcGTdRQ1Spt2PWeex5IY9thXz58K4unZfH0GDVO+TiQ4pnHEvzkKFP4ahy6bA4s47tp2DhLR+wMoJkmldiLDgcB3d6tCzwuoiS7jRCnsKhcIJqz6dqbkgBpOrTW9kmCO/xyAuX5mlsVjxLMxY1+iIzsC94oYQIvUanaMK+wgv6acTaQ2CHcKDVe7pb5gfXPL55ZAIXGj/f7CnKO0wBD7z7hyvyp5z+b0fSVOvMnZm27xil4iUtEYH+IHD5ee8o0ICnrvnl3TBviH1Jarr42RTWBHLARiNwgWy3DQrd9rDLrg2P/sVuneQh1vtusG5GqwxFRRbpDifNH7n0G51UIRJaBPPTbjktTbc22cG83ZTIGh/3rn5gtHIRujxL23wqL1Cr6m804UHJJma+L0ctfkZP3y9qSd5xJpNpMYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8716.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFKRVc1ZzQ0VTZ4ZExvTkZaVFlDZHpPYXliNjEvK3p1THBoMmtoWUdJd2U1?=
 =?utf-8?B?dUh1ZkRxdHZYWmRxMkV1anhjS2gzZXlOVklKbU00WUgyVHJkZEFQUGp0TzhJ?=
 =?utf-8?B?dXllSHBwM011S3ptbVZTTmNBelcwYkVORnZjR0E4LzJnOXRYWlRjVlJyU0tS?=
 =?utf-8?B?dTA4dGhKTTBFVC95eGp5dzM1dGFiYVo0VTdGUWVHc0dGTWhoTWZkOGtpY0NQ?=
 =?utf-8?B?cjU3Z1VoU29tc1A1bGhQREU0TjllZjkvSDRHWGJtSk1iT0VwTlErMyt4czdp?=
 =?utf-8?B?SndkU0hyV1Myb0hJQTdrM1VyMVlxOVJtcDBidk1GTlFMeUZYN1Z1NHdDK2pR?=
 =?utf-8?B?MitLSnZrRy9oSDRXWjRWcm9mcG9wSHF2VWVjV3F2Qm1XeTFNa0UxcXV5U2RV?=
 =?utf-8?B?YXVDcnpta2tNRzVCdENGa2FKQnlrTHFqR1ZONFJYQlhzY3dibGM4VlpwWktL?=
 =?utf-8?B?bGlDa2o1Q3Q1WldJVXBJZ1N4TUkxWFA5bmVJUWttNVFpUjRZcitBVmxJaGJk?=
 =?utf-8?B?eDdyLzR6TnZFQUFCRHY3eXZ6TDc2S014Q0tORndDVHFsRW9IL2hQNHpxTUtk?=
 =?utf-8?B?bVJBeWkxSE84V0thZHZPOGY5NVlmMCtWOFAvQXlNYkNFY2ppMDh1U1Y0ZkdI?=
 =?utf-8?B?V3ZMdEVkNTM3SCt3VXZvclNWTkdvOGh0NXRmTlhRNWdwbEhKNWNGMHRxSGM4?=
 =?utf-8?B?bVhFQnU3ZEUwTUoyWnFML1Fpc1hPWXNXL2pkZ1ByakZYTkYvM2FTVmNyeWw1?=
 =?utf-8?B?cDVQL1I1akVVSWVTYy9qaXA3OEJNRmx6eVVrTWdhVGwvdU0ySURvNHA5aUcv?=
 =?utf-8?B?M0NYbkw3MGpaMXlNTkZJcmhSbFVTQ1M0WjlocHRqUTRGSzVVbVE1ZVFoSFFu?=
 =?utf-8?B?SEs3clFzWXdJM2I2MVFIU2J4VFNQcVJ4RU9Idm9hTkZnWEVob3A1ZTBJUlRm?=
 =?utf-8?B?VlFnSGJxSkZVTzZ0WGZEWS9zSTdrVDlVbXAxa2gxL3VUQmFhd2VxK2lLTUE1?=
 =?utf-8?B?V0hxOWdXR2ZlSytOdGV6YUcyT1B3Rk1KSys5cnRtb0VBQ0NmRmgxc3I1TmFm?=
 =?utf-8?B?MDVYb1pMQTRrcXpKeWpaZDk5NlpDVDArUnFmcXpGTmdMSDkwOWJPbzJKK1Bj?=
 =?utf-8?B?QzFTdTV0Q0FMb3NYVG9mamYzYTNhbmdkeTNqTzFOVUtJNGR5bTA3aGtjbUxD?=
 =?utf-8?B?VnExYWFDRnNQZ0c4N1B3UHZweTdqRGtYa0dmLzhFOXIrbHVhUjdkOXJlVEdl?=
 =?utf-8?B?WnRiYzZUZkpGU0tINGxzMDNxRno5eHpRRnBrZUNHclBma3JoVkNFc09OMkRw?=
 =?utf-8?B?ZUFveFhWTThoNm5iV1p3ell3d1NQZkwxeGtCRG1PcFVIblNaazdCcXoyMloz?=
 =?utf-8?B?Qm80QUdVL0V4aWpPL212NzhJVHo2Tk9vOXBQaDhTS3BuL0ZmdXRiWHU3MGFX?=
 =?utf-8?B?TDdaSlRvQ05MOUE4enZISzY3S3ZNVEppeDh0RSt1dGlCMy9hTWFzQkNSY0I1?=
 =?utf-8?B?ZVY2WGNOcFNXNWcySVA1TEZScDJkTjI2Z1pKT0Q0WE9zS3FINVFOZWNyR3ha?=
 =?utf-8?B?REF3UFFxaDZJMDRGbXgvSFF0MElpbzc5aG9uaFcwNWVCVGM3N1d4M3B1VGk0?=
 =?utf-8?B?OW1SeVBhSnozczdGVlNIVjlMdjlTWWMxVEgxSUk0dEFQZTR1YUZsS0J5bmRo?=
 =?utf-8?B?Yk9kTExuV1VrNGtyZUpYTG51QitDeGp0ZVQ4ZzhwWDlnNzlXc21PSDR1V25R?=
 =?utf-8?B?Y2NwTDA4VnJIN0U5ZVIyeHpVMzVHSUhTK3BIRVkwNW5MeGdvcTlKMXdzRHJX?=
 =?utf-8?B?MjNxWW1jT2ZqTnRLSFZNREFqekpieXpOZkFkV1hXcFk4aDZRZGNoSFh5WFEy?=
 =?utf-8?B?R2dRaUJuV1N6dnliZTVXSWVJeTh3eWZZNUp5YVJtMlE5ekRsWFM1dVhNOXJU?=
 =?utf-8?B?Y1hWUHk5RFNOUlhGd0Z0aVNrc0p4dkRmMEpFZmVlYlFPVnJjMjNab0RrTTJN?=
 =?utf-8?B?ZzRxQ2hGdGJaSW5yeUtlVG9LU1RSN2dPSlBtRkQyaEpHMkVGR25GRkpEd1U3?=
 =?utf-8?B?NExqMkI0WXB0N21mU3ZFTnlRa0VxaldsZEdCTXl0TXJrRU5SRWVxR2o2Y1Fa?=
 =?utf-8?B?ZVJrSmVZblkzVHVpdkVwd1dmcGVhd21oQzBJSC82TzliZC9kcERkQVJNS0Jw?=
 =?utf-8?B?L2x6Z054TVNzMzFSUmdNWEU3WmNZV2t3UlZyb1ZnQUFmREVtaGI5bHFiTnVu?=
 =?utf-8?B?QW10OExad3Y0bUN3eEpBYTJ6WnRCUDhCNVpYc2hkaFlFU0dkNmlzYVRvYTIy?=
 =?utf-8?B?NDA2d1pGRFoxR0dNQkNFVTFxbUJHRXdsSWNBaHlHQmFmWnNoYUw0ZTUyK0VP?=
 =?utf-8?Q?KsRK7H2aVJUt3oBM=3D?=
X-Exchange-RoutingPolicyChecked: XpZeC/urMMchQwFiEb/mjkwQ2IHczOq51b9RyoaDGwpjytogVwStqfcFZnuW0qZvi46kBWewgICVX954Oe9IK5Zm+kYxhWoF0l/Wo2tyP+43pplUwPjJ9SwWx0Z4B36JBgf2//x6q3IWtUTQI78OBXUnvQP3Awi4iUpKqN1n33KUbE9T7nbrdnQNDvC+Rt/j2Pm7uMGNxh1CCdzmEvbWrls0vCXl2ru5L4V7cgeCbkGS716dJ8wNubQUEXio60t2GuIsXbpolpwygFekedjQTSwLzs7ZHNy7Aec7L5GOM0bBvGJZY2rtyEjPQcYaFwsIJxhsVmQLqf2vpD7NaYb2IA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aad7f893-ef70-43b8-44b7-08df0fdcb544
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8716.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:14:32.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4Q+xCffNjZFnhHSAm2+mvQ5dQ6wlGf1dgzXK7jeja6oCeaEsuTLFBeSMPoF/Yl9GvJqSAX1kFxeigm5IhJVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
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

--------------aBfpmVYbp1mFc07DLOPtg7cB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Introduced L2 bank correctable error threshold subtests:
>     - single correctable error
>     - Correctable error with threshold set to 1
>     - 16 Correctable error injections with threshold set to 0xF
>
> Add DRM RAS netlink error-notify event subscription to verify
> correctable error detection across all the above subtests.
>
> Cc: Purkait Soham<soham.purkait@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Gupta Anshuman<anshuman.gupta@intel.com>
> Cc: Jadav Raag<raag.jadav@intel.com>
> Cc: Nilawar Badal<badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh<mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi<harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Disabled multicast before arming the injection to perform an unicast
>     injection.
>     Updated the condition to verify response from wait_for_error_notify_event
>     condition from an event error value of exactly 1 to the configured error
>     threshold.
> v4:Add support for steer semaphore while disabling and enabling
>     multicast (Soham)
>     Used updated library names with igt_drm_netlink_* prefix (Nikula
>     Jani & Kamil)
>     Updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> ---
>   tests/intel/xe_err_injection.c | 292 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  11 ++
>   2 files changed, 303 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 683994d1c..cdf15f70b 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -35,6 +35,14 @@ enum {
>   	RECOVERY_TIMEOUT,
>   };
>   
> +time_t event_timeout = 10 * 1000; /* 10 seconds */
> +
> +/* Cleanup helper for injection test functions */
> +#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
> +	igt_drm_netlink_cleanup(&ctx); \
> +	release_forcewake(fw_handle); \
> +} while (0)
> +
>   static void run_xe_compute_on_all_engines(int fd, bool state)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -295,6 +303,272 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>   	gt_uc_wkr_parity_recovered = true;
>   }
>   
> +/* Inject a GT correctable error */
> +static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	/* Disable Multicast for unicast error injection */
> +	acquire_steering_semaphore(mmio);
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +
> +	/* Arm the Injection */
> +	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
> +	igt_info("Armed L2 Bank Correctable Error Injection\n");
> +
> +	/* Rollback to Multicast */
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-corr-err-threshold-1
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t current_threshold = UINT32_MAX;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_netlink_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Subscribe to error-report event */
> +	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
> +	}
> +
> +	/* get current GT Correctable error threshold */
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_netlink_get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +
> +	/* Set GT Correctable error threshold to 1 */
> +	ctx.error_threshold = 1;
> +	ret = igt_drm_netlink_set_error_threshold(&ctx);

Instead of setting the the threshold value separately better pass it 
through a parameter in "igt_drm_netlink_set_error_threshold" and check 
the validity of the same.

Thanks, Soham
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
> +	}
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	/* wait for 10 secs */
> +	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
> +	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
> +		log_status(true, "L2 Bank Correctable Error with threshold 1");
> +		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
> +			 "value=%u match=%d\n",
> +			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
> +			 ctx.event_error_value, ctx.event_received);
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error with threshold 1");
> +		/* restore threshold before failing */
> +		ctx.error_threshold = current_threshold;
> +		igt_drm_netlink_set_error_threshold(&ctx);
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
> +	}
> +
> +	/* restore GT Correctable error threshold to original value */
> +	ctx.error_threshold = current_threshold;
> +	ret = igt_drm_netlink_set_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-corr-err-16-times
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t current_threshold = UINT32_MAX;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
> +	int ret;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_netlink_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
> +	}
> +
> +	/* Query error counter before injection */
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +
> +	/* get current GT Correctable error threshold */
> +	ret = igt_drm_netlink_get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("****** Injection iteration: %d ***********\n", i + 1);
> +		/* Inject a GT correctable error */
> +		l2_bank_corr_err_injection(mmio, fd);
> +
> +		/* Query error counter after injection */
> +		ret = igt_drm_netlink_get_error_counter(&ctx);
> +		if (ret < 0) {
> +			CLEANUP_ON_ERROR(ctx, fw_handle);
> +			igt_assert_f(false,
> +				     "Failed to query GT correctable error counter:iteration %d\n",
> +				     i + 1);
> +		}
> +		gt_corr_counter_current = ctx.error_value;
> +		igt_info("GT Correctable error counter incremented by : %u "
> +			 "since before initial injection\n",
> +			 gt_corr_counter_current - gt_corr_counter_before);
> +	}
> +
> +	/* Confirm whether error counter incremented by 16 after 16 injections */
> +	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "GT Correctable error counter didn't increment "
> +			     "by 16 after 16 injections\n");
> +	}
> +
> +	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
> +	if (ret == 0 && ctx.event_error_value == 1) {
> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected error-report event or "
> +			     "error_value after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-single-corr-err
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_netlink_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Query error counter before injection */
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	/* Query error counter after injection */
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter after injection\n");
> +	}
> +	gt_corr_counter_after = ctx.error_value;
> +	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
> +
> +	if (gt_corr_counter_after > gt_corr_counter_before) {
> +		igt_info("GT Correctable error counter incremented by %u after injection\n",
> +			 gt_corr_counter_after - gt_corr_counter_before);
> +		log_status(true, "L2 Bank Correctable Error");
> +	} else {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
>   static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>   {
>   	igt_info("Starting Error Injection test: %s\n", injection);
> @@ -302,6 +576,12 @@ static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>   		wkr_cmd_parity_err_injection(mmio, fd);
>   	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>   		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else if (strcmp(injection, "test_l2-bank-corr-err-threshold-1") == 0)
> +		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
> +	else if (strcmp(injection, "test_l2-bank-corr-err-16-times") == 0)
> +		test_l2_bank_corr_err_injection_16_times(mmio, fd);
> +	else if (strcmp(injection, "test_l2-bank-single-corr-err") == 0)
> +		test_l2_bank_single_corr_err_injection(mmio, fd);
>   	else
>   		igt_info("Invalid Error Injection specified\n");
>   }
> @@ -335,6 +615,18 @@ int igt_main()
>   		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
>   	}
>   
> +	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
> +	igt_subtest("test_l2-bank-corr-err-threshold-1")
> +		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
> +
> +	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
> +	igt_subtest("test_l2-bank-corr-err-16-times")
> +		inject_error("test_l2-bank-corr-err-16-times", &mmio, fd);
> +
> +	igt_describe("Inject a single GT correctable error and validate counter increment.");
> +	igt_subtest("test_l2-bank-single-corr-err")
> +		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> index a70e6af22..a4b99711e 100644
> --- a/tests/intel/xe_err_injection.h
> +++ b/tests/intel/xe_err_injection.h
> @@ -22,10 +22,21 @@
>   #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>   
>   /* Node types for error counters*/
> +#define NODE_ID_CORRECTABLE_ERROR 0
>   #define NODE_ID_UNCORRECTABLE_ERROR 1
>   
>   /* Error types for error counter */
>   #define ERROR_ID_CORE_COMPUTE 1
>   
> +/* L2 Bank (LBCFLOCKMSGREG) error injection */
> +#define L2_BANK_ERR_INJ 0xB1B4
> +#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
> +#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
> +#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
> +#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
> +#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
> +	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
> +	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
> +
>   #endif /* XE_ERR_INJECTION_H */
>   
--------------aBfpmVYbp1mFc07DLOPtg7cB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
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

Cc: Purkait Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Gupta Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Jadav Raag <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Cc: Nilawar Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Koujalagi Mallesh <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com">&lt;harish.chegondi@intel.com&gt;</a>
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
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
    <p>Instead of setting the the threshold value separately better pass
      it through a parameter in&nbsp;<span style="white-space: pre-wrap">&quot;igt_drm_netlink_set_error_threshold&quot; and check the validity of the same.</span></p>
    <span style="white-space: pre-wrap">Thanks,
Soham</span>
    <blockquote type="cite" cite="mid:20260903073335.339540-10-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (ret &lt; 0) {
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
  </body>
</html>

--------------aBfpmVYbp1mFc07DLOPtg7cB--
