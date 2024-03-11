Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B99C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 19:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468310EAB3;
	Mon, 11 Mar 2024 19:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCdCzCOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4059910EAB3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710184766; x=1741720766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y7KxJR01cChmbdGniFGKNc7/9NObr3VwhVdaBjdixRQ=;
 b=QCdCzCOgTcZyiyUD+epk7pqAQATYgS6rCmdDNv5fb9brrRIDxjxo745G
 erkTAZ67s8VGCX8t8qwVHdVyWCbAzLVfDs3NJzDOm2OoRgixhz/kvppu/
 48cBwZmhAzgSZiFeotGufeMYQkkjNe/Y9tOfAzZgRiJBVo+JNfKFn4r8N
 BN3JMx++I/wKtUpkzouYug1VDhhbkClZUrC5aGBp9IKAygNS08aOHbWII
 T2NnEv1fdgMXwkAL7WhyC5LIAdhZFuzYTiigNDgGUvQ0DQQAZb1GuhJe0
 vKkYJ/jGwrHB+0F2k9AnkLnD/r8ADWgV3WeLL87dStYzbrkotn3rm3xay A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27341015"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="27341015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11855056"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:19:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:19:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:19:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:19:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD2J+ePfhkAHJnndpHr/Apx5CYPYWznCg6HAdBt7e3Jz6aNpoTn9i4Mag4H+evY1DTNlQNeFL+tOpKWa49DUfb3HZ6fvH3B0v/D4chsW/laN4mxYwhdu7NR/3//e4PJ4RzfvjL5QyVNUhHf09MMKKAGcn2FFRxvZRVjsuTYUCaD3OYu2Kn+bLniUciPFNeQARukw28/8qkfnErzjej3DJHBfotCZGMbWN3Dv15k7HSGT6bARfvCWN2VTiQfxX9F4dxQ6f8tz/qH2HgKfo57BKvRCtnSocSQJXl481PmPhDc99mu0OFTa24c1K2Xoja2DwIrLjKW4035pRxFeh4zFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt69EEmu8rBfm26GJHIVfuFRHfuwTZVFfmyfko0tmHg=;
 b=YKGr2/AoNgBexJIDU8jU+IrOT+koKsKVENKd8nOMzgVp6hx4cQLtgN60azqlIWSEMk5LZcl83i5Yo4J/HYjoFeJ9zZRtCEC+qf+mymkdk1dTkf2uHXc0PQd3W7IyR6FJFk4lUVAU6TO7XAWtxFAdI30ltDuLxSmbBS1rdJW6mtUjEzE/KK99mCdDYU1LJdgP0uO/ge4pChSrPYLsEyee0Rm4Jer3KDiYTzsetHxRKwxGJbjiQvpmS69U/68p/fwp6FpqFuKz9ivXTs7+Kc0gKreQJVpA0wmVe6VisIwuOPYshSDHIBnhZyqCJOpRu7B/Wxh2+0o0E7tbeUFvP1eqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.16; Mon, 11 Mar 2024 19:19:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:19:22 +0000
Date: Mon, 11 Mar 2024 12:19:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 09/25] tests/intel: Introduce FDinfo subcategory
Message-ID: <Ze9ZOOuke9uLRTDs@unerlige-ril>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-10-katarzyna.piecielska@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240308083657.1092049-10-katarzyna.piecielska@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baab5bd-cc19-49ed-419f-08dc4200281b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePbbKYCPNNbSBQuVKKV0FP0yQK9U3fLjsbQl0IjzSG0MMPK8dcwNcBVYmdp/kJpXeczZhLfqOzp+vus6Vm48vBsf/qec1jHrByNjUi8CtVpD0+CIdoZArpImMVZ/ivBz1yaiZhLUKFDF3hCO6wdZXpQ8Xt7aWoDfZw4lmkm83zzkqctWbqzGMau5Q+hXbG4fmmaAJ6T69keZuXxEbmpSMs7/aqxAQO9d3PIn8dglLKwEDMQu1buYOaQhdATacixDr/DZtYMHxAPlj2NeTlfkm3u97BLMaOITrep3xR/KwbN/oRGLPn/fOju0YmlfDVtPacOuzxkZVRasiGLmitX3SrJw1l/ATTMI5+SEMzS4tK7nD42sakS9NYNjD9Xq6tgJO6VnaQ64sLe1OYrBIYHMvDpTXPmfGR1WF8lV8fLbSotsppSyYhLThxgpVK5nN8mreywfJL0iDfo2DrxsWmV1ttUEpwnOfOIhxgav2loU7A5Pv5HxwHjdu968p807GdljRKu34WDtslje6S5xd16YqnM1FkUpKu4mhFxlPzZ6GGk2/k15LeWn6npllbYDp5aRX8IEVFqg3gR1XA02Ukz4UlUJEj/yotxJG5VqPV4LGb1tViezFCRSLI+1/2CHphwwJb2bvF7Wv29mqo0iz4iR6kGuXbFBCRpD4CQSSSrxpXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnNuTlE3Znd2OTBBV0RKbHdoZ3JDWkNvNVkzblpNVlVTT3ZtS1ZuMVgyY3ZI?=
 =?utf-8?B?R1hHWjJXVkhXM3VFRFgrWk14YVZObTYyckFYd2dXSERJL1JPQ3pDdllvT01K?=
 =?utf-8?B?NTVsZHU1ODE5dlhlTFdHbS9rVjFxQjU4Rmg3eXc2NUQ3RXB6UXRFRGpvdDJv?=
 =?utf-8?B?ZU83eS9GREFVUEY3a3gvdU5DbjZCRE1GeFpvdGIvbTVkRVRTbHlwS3hUdWR5?=
 =?utf-8?B?bDF0Ui9EWnJ0MUtTRXFKNklLa1pTMm9hUW5RMVNXMnZJb3l1MFBBMmd2ZFpl?=
 =?utf-8?B?Q0hkUGFXTVFoVVA0UjdJQTU4cEh5b2VYOFpJQS85S0pBeGtGM21nb3Q2Y01C?=
 =?utf-8?B?aEhJUVhDY3BVRWtEcXpVdTN2OG54OXp1R2dNWWg3NUJ2U2s2OU9aTnpFbS9T?=
 =?utf-8?B?UC9tTFEwbitTOHhUdU50V1JabGlPZSthOGZwOTEvRU83WmcwaE9XL28zL1JL?=
 =?utf-8?B?K2NhdmxMYy9JWmZOUGxzWmJydUphNnVkVTJTaTY0K3NPUHlqRlduUU4rRGZq?=
 =?utf-8?B?NDhTTnUxR1l5WHlUTDY1TU1vSVN3MWJrWTB6TlVMZmZlUFRpWUw3Y3l0eXBy?=
 =?utf-8?B?VFBCTXY5bjdXa2tjaFRUVExsZWk2MnZpaGpVQkN1elF6VGhNNkxldzVtVlFq?=
 =?utf-8?B?NUJ6YzRINnhsa25xT0krREs2TUN5L2xXWkVGYVBFMHhvYUxLdTBZcFozZ3lS?=
 =?utf-8?B?VVhwNUhKYnBiVkp6dXJyVFdiU1hJVnZwL0RHTjhZRm9YMElWVU0zak8wYS9E?=
 =?utf-8?B?T3hxMnRLYnJKdW5BY0QrRkxBQVRteUZhS1BRelVyNlRtVHdaVVBGckVpbUZj?=
 =?utf-8?B?bmExWUQ5QkE5cWo4UlFzbjV6b1V5VnJjV2lVbElnQkdvRWVqOCtjOHp1c2Rt?=
 =?utf-8?B?SjFxNGZiL0lJaXpIb3h3Sjk1TU41U05HbU95WGJjY05QUmpicFdKdndOOTdE?=
 =?utf-8?B?cVdNNHlRQ3lLRzB0R2ZHY1VhZnVTQW0yUXEyZFFzNWl0Tm1uMklZOVNjZXow?=
 =?utf-8?B?Y0xUaThsMmZGYWtneHAxTXM0L0lBL1BaWlFZOWlZclk3NzNJK1ZQZjVmRjYz?=
 =?utf-8?B?Z0lpR0w2alVndzZQcXBZbjhBaW5EZVRIVmxJQk0wbm4wVE9leUlHZGg3M1N1?=
 =?utf-8?B?b2syTklsdHZSR0k1QUI5TUlRZkg4bklhR09nZGhaQnloZTVWY3I5aWxXc0da?=
 =?utf-8?B?VVBkR21ZbFNYOTRhNWV6S1p3NDRvMmFOTDVQa0IzcUo5WS8yUVAyeGI2a0d2?=
 =?utf-8?B?VTFEMWFXNUV5dHNlOTlUcVJheHN5M0lLbmpLaTBubmtFR0xaTy9nbWQ5YjZG?=
 =?utf-8?B?c0QzMUE5bnRFQlowODZyTWRPY21XUWVjK0pjc2JGUEFycVlvZW80NVJ0UjJK?=
 =?utf-8?B?U1B4Q1ZZbUZkMVN1KzhSNkphUHZFSGpEOXZFaTdDR2RhVmZYWlVNdGxaNXcw?=
 =?utf-8?B?QUV4S3dqZVRVL0xKTHc5Rk9OMzdtbEw2d0tpU1VjaFlVbkxnQmJOQ1ZXWi9I?=
 =?utf-8?B?L0JEMnp5SlZFT0l2RGQraWtEbnZ1ZHJhaStMbkhoM3NEMDdrb0RQU0c0NElh?=
 =?utf-8?B?dkNzSkNkcVQwOVJtT3JzSG1QTnhOa2FNMk1kNWowMnNxcUlkRTI2RnNObXAz?=
 =?utf-8?B?VEpTZThFMHVjN2F3Y2paNGNGNWJkRFJESmM1d2xZMm5uUVluUVZrYURlVm1q?=
 =?utf-8?B?czh6SGJNZXdtdFRqMXphVDlLV0FEd2VIblR6bU1ZTVJRWEh4TWpKdFpJbWlP?=
 =?utf-8?B?eXo0T3JOR2FIMEtycVpTaVB6emRYVVVLRW12b01FbFBWTnBGSG52TFBEMmxN?=
 =?utf-8?B?ZUNOYlNSYThjc2tKcVBVOUh4QXJHNkQzZ2FCRHh5cjFwVGFXMlV1aHZ5azl1?=
 =?utf-8?B?MkdmUitKR1AzU3JsdEJ5SFlIR2VGQ2U4UU11WnBTUjlHZURyVGt0YUlob3Ro?=
 =?utf-8?B?LzFveXpIK2pGd05NOGVlbnJOaUk2OXJ1ckdnNXIxdzQ2amdFWGo1cnhTVi9y?=
 =?utf-8?B?eG54VVNhYjlxbmZoM3czdGo3RUE0S2JScFZwamN2L2o1cVBQUnpNcEZwcmtB?=
 =?utf-8?B?MVhUdTZKYWdyWkZJZm5UdWZjVzlucEJ2enlZdGkzUzN1Yk5Ba055OVRtV1Bo?=
 =?utf-8?B?LzQ5U3gwSm0xK1BMVzVNdG9NbmRwWC9LYUZ4ZEd5YlVWTWRoQ290bmVoOXov?=
 =?utf-8?Q?ERdLGtdXArVzk2lJdgDk6co=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baab5bd-cc19-49ed-419f-08dc4200281b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:19:22.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7joIeHOO6sVBoTdfuhebtpdlcd5CH/GqXIcomAsiv+ZMppdK5wj7BzW0k5qdaRsGzljCPsEAzNak8sa5jwcMHqDtaj1ysCd5IL7COCAmLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Fri, Mar 08, 2024 at 08:36:41AM +0000, Katarzyna Piecielska wrote:
>Let's introduce FDinfo subcategory.
>
>Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Acked-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/drm_fdinfo.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
>index 3ced658f2..65d942330 100644
>--- a/tests/intel/drm_fdinfo.c
>+++ b/tests/intel/drm_fdinfo.c
>@@ -37,6 +37,9 @@
>  * TEST: drm fdinfo
>  * Description: Test the i915 drm fdinfo data
>  * Feature: client_busyness
>+ * Functionality: client_busyness
>+ * Sub-category: FDinfo
>+ * Category: Desktop client
>  * Run type: FULL
>  *
>  * SUBTEST: all-busy-check-all
>-- 
>2.34.1
>
