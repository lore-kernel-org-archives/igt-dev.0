Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CA5CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BCE10F3CE;
	Thu, 18 Jun 2026 18:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLU2r+MF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA6E10F3CE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781808986; x=1813344986;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H6RwmavLyFwarS/ydr8Zuv4oM2UMGLceuAfGcl/U+UA=;
 b=iLU2r+MFjZYRCuP50+BYi+RGNMAuJ3findpFQrFfJhtAGRPxkSu/DfpA
 WqimrCFm9MVYzwRCQe1FqCfWkOgwDNnhgG9zgWZuly3fo1mY6fCnafIze
 82YUJeObnHJvZkGaPcsjxRMo7N9UToWkF1tiABwH4wxW9Cg3Dwhhlf6pQ
 LhY/CEzLQ/iA+DbXkAjqZsg9njrojQ7tBKDGVqux6U73C79WuJfIrFtpw
 b0lQJkitvoNUJaL69o9RfhlBleSqatjzo+J6RRhS6QYb0WBbSafCYNhBs
 phN4NavnEff5kclo45U+8m6pGsTBOrLmqgCKxsbCiBJoravtn8mnk9SoO w==;
X-CSE-ConnectionGUID: pIJ8an5fS0GG2kCHVaUsMw==
X-CSE-MsgGUID: mVbHX8VhQxGqBBaJY6sDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81644099"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81644099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:56:26 -0700
X-CSE-ConnectionGUID: +/9Sfor1SHqLLhQsMndrEg==
X-CSE-MsgGUID: UMdCNcgBQ7O2c/5vDoj+Ww==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:56:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:56:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:56:19 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpcUFCSdKSvf3+udy2RRc0bRlEAb3+Mi03FL2CfaRS/SBFcwsqUJLx2NGJR/3sFXd6SnaIznPf15j/zm7Abu1T/9QmBSn0Ywp7melXSSQCxjqW0tL1vUqZSI0hIvlvXqknY0P4DlJsyxg6uKEtzJkrSObY2Wtop2wIwVLc4E9wZJmWTNWqfnHjUlM6af+ReJw6VyM/l5QCKWwSorIH1QZWs4gT0iT14XU6Y2Pu+TBpV5STR/Il72Tl0ORZpbFYwU7akTGDUluRp7z5J7DibshS0WcrIlj/lTj2UHgt0ROtOXQB58qKStndRNy39A/Bh+yQMsMOuStnikcgLfKYalTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYRun0rc4ul8z9N4WGdHVt4gb1rC2925LRZTq7P4m9g=;
 b=rnRtXozMuKnnMl2VnW02QfiQv1Qac4zZcYQKOLNb98Hu23AWJOjRdI4h/4VHU7+17VZw4klYfrImJW1gkRb7C38d0S8FYyo0CIU9N1TQ4TWljd82DLi4+HYGn/7uRWJ0Ve/svPgCg+ScYHhxdRxHfjSFFv5NX6gpD3BU3f9sEXdR3ZKSFHfBLCduB2AXBaz5ayW5363+vomVNH3uEkoFVISbH7z8quQJ5NKcWs9u4taUfRSxzsJs2miUKG6/VBbEQTjyZvJbQJ1ahnoleMFPMFOzkdLWq/ZeprCNDA/l33IrY5eOcBa/u0XPTD1zFVIbU9a/woOCFyBUZ7Fx8hDPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ5PPF12B0A4A9B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::811) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 18:56:16 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:56:16 +0000
Message-ID: <17cfae47-c50f-461d-b298-08d933dd3d14@intel.com>
Date: Fri, 19 Jun 2026 00:26:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] benchmarks/gem_exec_reloc: use
 hars_petruska_f54_1_random() from lib/rand
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <d4eef997aef5064ec0e797e36d7196c0dcc1f4f6.1781791747.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <d4eef997aef5064ec0e797e36d7196c0dcc1f4f6.1781791747.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c8b528-3681-4fb6-9b5e-08decd6b4692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: uKV2nV3D2TQv7AeZdr42LXEfy/iHCubb0J99tdXsRHMbpEXANJeoIBO871mSS/OFUIwxa7EE6P7wWJHULX2YtDwAiFKhsmzd+aFarfs5ut28FkXSEKSEcoNF6Q5fCBGeu0EumocpiAbYRnhpA6F/KwrLIsanzDPxcjISs/Xia2EHTSTpVNPqIhu2FdKeCCx0QQ/skrNS0/8GQWeVRZ9HZFXB/PVuLbzcGr+ltmx9gAZltib7q+wE2/3cPR6iIiFbUqlNPHWTPbStMRVHsQLE3nLAxJ+IJvRQCJDucSHcrDNQDplwN5/87aEoW75uuzryTJvQs8Mjs3FL3lxdXraFpnHzC/eTdbAVmhQJMl5Wed8kuXQJmb0u9/pWEgdgBvOwlJfjH3ZWgtDzE3eFhwJY8ogshxXeLU9kFtMMF3H2Unk+OP5BRfAkOsGnJB9K3SUFSNPkGP6Na4jt+fpqqr7mrllZYNQ56OMZ4yG7IosVpm+lFBS03ubPgKatxrtThuF/V0mFj95kQujoa1/KdVk7Ld8iJo+zIvBMm79lUG7E5bs1ZK7IabhBn3RQsSDpZtJGR5hEGCYVtz2kO1R2/qUubfk/CZzgh4XRrVMq3pDuWU42WUDxeH3SqKUWihu5ch8SrSmfVCaPZstbdlJZkBIICTbb9q1lK4p6I4jaTMKMy8Ew8pHG4Smmsd3diBd/t/+3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW85ZndUb3kxR1Z1TmZmVjFqMTU2ZW1vdVdORXk3NW02bVJsdGx0ajNxcy9D?=
 =?utf-8?B?Z3IzM1g1V3doYVNVN2VieEZRMks0OW9qeWxaMWpjNVZtM2pTWVB4RWpXblZ4?=
 =?utf-8?B?NFVzQzJjR1cwa0Fqejk5SHZ5YzlQUzY2R3NiMXhEdGt2WXJnV3A0b092NDVo?=
 =?utf-8?B?SHpDS1RWTlY2RE9GbUNYNS9mMk44YlhzVFFzdFh1QTkzcUo5UHZNbmRZTnNE?=
 =?utf-8?B?alRscFpLTVFGVm1vV2E1dXFOWFlucEZkc2ZYYWhIUkdpanpGeVRnMUpBUmhk?=
 =?utf-8?B?NzNBNXlQNjFrSFNSQ0RoWERvTHRqWHZ1SVZHQW9XQkNZSTlBb2R6SUloSzcv?=
 =?utf-8?B?OG9ndlpJU1EzOFdwWUtnT2FwbTg5WGNhdlNHeVN6Z1pIYVRRR2dZMkV6V0hD?=
 =?utf-8?B?akIxNmVFcW9mV2JuSWNaTVhWUjFSMlcySUl1UzJxV1htN1ZSMHBDVit3Tkxa?=
 =?utf-8?B?TDNMR0dDcDJ0ajdmMUJ1VTlEQjJVT3JpOHlnbDFvVnRXUjJ2c1grMWFnL0s4?=
 =?utf-8?B?eE9vR2Rsdm11RTVrR3NlaDZpbENtbkwyUWhuMzZCKzl5VFRLanZnMVg0NU51?=
 =?utf-8?B?ci9BdTU1bjNPQldWdmc0QVJnZ2VBb0NnTndNSEZWUmhsb2E3dVBMYTVsZlpa?=
 =?utf-8?B?ZnZlejNxbFIzZ2g5Rld0VzA5OXFtOGtGMHB0R1BVeXkwTEVKQ1hMSE51RVRC?=
 =?utf-8?B?d3FKMTNoWWFPSmpxNDVxaFArbnZkTWFCVjJZM2dyVHBsWk1Id2VBTjh4UGlL?=
 =?utf-8?B?MkxHdWYvbE9scm5TMGNyQzFwQ2ptZ205TDlBeEZIcWYrTEljUm80cnJxRVdp?=
 =?utf-8?B?RUJXRHVaN0d6dHdJdHBobE1vTzByN3EwbzF4U1EzZFJRVFo5dUd6ZTlMNnJJ?=
 =?utf-8?B?T2xTbCs4b1V3azBPVFZEYzVWeHRTNXdPZi92OHJFMTkyd1BMTk5MT3E5NHp4?=
 =?utf-8?B?eWJpS3dnY01wd0pUc1VURXcrYnJrY1JkUFFSdUtKNnN1YUk1NC83YVh3RE5R?=
 =?utf-8?B?ZHo2OThXck01NUx4WGdLOHJiSUZjN0tBcVIxNTlNcG90bGtwaGFhS0pHRjRz?=
 =?utf-8?B?bVZ5bHY4ZW81Ky9LMy9Sc1VXR3BETlc0NEM5aHM0cFlicGdkQTN0VjZVOTdI?=
 =?utf-8?B?NDBWUENjN2p2cHRkaTNqZHRQMVZnR1JRclZDV0VpdGNsQ2VXK3dSM3luOGdp?=
 =?utf-8?B?Vk5nenVGSWlzMW9DQTdzUUhjSU1PMjFvZDVwVW1McUJ4dklEVGtYV002andB?=
 =?utf-8?B?T3RJbWZEa0RDMVdUazhoL1ZLRHNhTS9pd2w5QndaWFl1NkFSZXNYdFl1QmxS?=
 =?utf-8?B?RDc1UHVuelo3N0F0NENVZVVsVU1SMTJWSHZJWk92SGVZeWNIUUZaRWVBamJ0?=
 =?utf-8?B?ZTJLNzQ0cXJiZWVCSW0wM294bk95OE9CWS9ieWswbmJpZS84MnVSWWpSK0t5?=
 =?utf-8?B?WTN2Z3QwaUcxeFFIZk9WRmdVc2crVU5tb3FleDlVb1cyaEpUb1lIU3ZVdnBz?=
 =?utf-8?B?dWJnNW9EWUc1ODhPYURocVpVcnZyT01CQ2JhQXd3ejd3cGpzYWNjU0FsRVQ4?=
 =?utf-8?B?K2E3ejJiNVBKUDhycDh4Ny9kT2grclExUHQyeVBlWUNVMXZDTGs1RGR4bktj?=
 =?utf-8?B?cno4bjZndkEvOFdlaHVOblpRTEhHMjNZNklzaUlzZEJVNDF0RHZTd0dyQUx5?=
 =?utf-8?B?UzFzVFR6MDJuMGxzeWRQWXhQOWltc1JrMTNjWUVQOXY3RzZWaHZSV083OHV6?=
 =?utf-8?B?aFExNmEvWXpqcW13L2FSR0V3c1l0VmdqY3hMVHAwa2F6dG1pcFF3NStJZ243?=
 =?utf-8?B?eTB2aDBTL1VtWUxzMVpYWXNEYnJCT0xRY0dUeUVqNFdlSXVlMEtzKyt4ZUFz?=
 =?utf-8?B?a1hiL0FaZllMS2VBajlrcjBWRFF1Z2ZHMkhmSjB5SEJVZk04WjgvQUpKdk9Y?=
 =?utf-8?B?STl2ditiWEZBM2dQUmxqU0E4T0N1R0lFZEJKVDVxREpodlpkL0REbXYwWlVa?=
 =?utf-8?B?YzZHZlVLOTBZVWIyWDRjYlFkaHNlb29mdFVXcSs0Um9VVHEvUUZIZUN0Zmwx?=
 =?utf-8?B?M3lseXFyTGgycWU1QnA4SThUTit0QlA1c0tZZ3p1dCtCdVI0b2hxVVdKcWhS?=
 =?utf-8?B?TndaR3V5L1VvQmhSbHlMWklUL3pCUExUclMvSm5hK09oZHQzWWk4NHBjVkJi?=
 =?utf-8?B?dk9nYTlWcEpDUWpYYmdudkFvU2ozNElXQW1QamJQTW5Oc2xrQitSSXA3Tnlu?=
 =?utf-8?B?bk93NUxyWDVBNlN3U3ZNaFdZSXFZU1kvQ1dNREhtYUtBY1dQVk1kOUdsZE8r?=
 =?utf-8?B?b092b3lNYzNRTWYvTUxKaXY2UWZRRnZYTVN0c3RqMmpqYUNrZW1vUT09?=
X-Exchange-RoutingPolicyChecked: XGeoqZlDHTdDyYPzykPBlmKf2oEJ750hQmYYETa9v7hDofLsz4F56SVAAh4mCAX9wuU4VqYLsLQtZqGHYmocVqcq9cX4Ul4pfvI9sytERhTcs/e5FKGDmIzlZabikx4n2lPAWfN6qqx26re2RuZXkgrJWeQ/VCuTL2bi6d50kTdeMHJnIQNnxHVoN1/rBWOICxjMXeAPVyORhDQaSXwIhnlw3TpGMUvc7i/MKsk/iSaxg+X4mpA2k336i5cflDEXGU8FLEkKEKaAMoK92z0UF6NwYY2yx4bmk3zrJ3Twz+UZ04AaKpZ0TI3BYAQTvkoE4tROFSARopu6QzGzSZfXkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c8b528-3681-4fb6-9b5e-08decd6b4692
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:56:16.5561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LgESht+X+OQaQVPgu7V491R0jBbX1lsxB6eR93Oo1QoIfaKiWhtPLyY30v2xdZ9D3fkmo7AEGepBTiuSVKE7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
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

Hi Jani

On 18-06-2026 07:39 pm, Jani Nikula wrote:
> Remove the local duplicate of hars_petruska_f54_1_random() by switching
> to use lib/rand.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   benchmarks/gem_exec_reloc.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
> index 0610308669f2..ff25a3b3b59a 100644
> --- a/benchmarks/gem_exec_reloc.c
> +++ b/benchmarks/gem_exec_reloc.c
> @@ -41,6 +41,7 @@
>   #include "i915/gem_create.h"
>   #include "i915/gem_mman.h"
>   #include "igt_debugfs.h"
> +#include "igt_rand.h"
>   #include "intel_reg.h"
>   #include "ioctl_wrappers.h"
>   
> @@ -52,15 +53,7 @@
>   #define REVERSE_OFFSET 0x40
>   #define RANDOM_OFFSET 0x80
>   
> -static uint32_t
> -hars_petruska_f54_1_random (void)
> -{
> -	static uint32_t state = 0x12345678;
> -
> -#define rol(x,k) ((x << k) | (x >> (32-k)))
> -	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
> -#undef rol
> -}
> +static uint32_t random_state = 0x12345678;
>   
>   #define ELAPSED(a,b) (1e6*((b)->tv_sec - (a)->tv_sec) + ((b)->tv_usec - (a)->tv_usec))
>   static int run(unsigned batch_size,
> @@ -106,7 +99,7 @@ static int run(unsigned batch_size,
>   			mem_reloc[n].offset = batch_size - 8 - (8*n % (batch_size - 16));
>   		else if (flags & RANDOM_OFFSET)
>   			mem_reloc[n].offset = 8 +
> -				8*hars_petruska_f54_1_random() % (batch_size - 16);
> +				8*hars_petruska_f54_1_random(&random_state) % (batch_size - 16);
>   		else
>   			mem_reloc[n].offset = 1024;
>   		mem_reloc[n].read_domains = I915_GEM_DOMAIN_RENDER;
> @@ -135,7 +128,7 @@ static int run(unsigned batch_size,
>   		execbuf.flags |= I915_EXEC_NO_RELOC;
>   
>   	for (n = 0; n < num_relocs; n++) {
> -		target[n] = hars_petruska_f54_1_random() % num_objects;
> +		target[n] = hars_petruska_f54_1_random(&random_state) % num_objects;
>   		if (flags & LUT)
>   			reloc[n].target_handle = target[n];
>   		else
