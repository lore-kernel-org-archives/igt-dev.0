Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F8C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 12:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7210EA3F;
	Thu, 11 Jul 2024 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnGmdQrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35D10EA3F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720699263; x=1752235263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cnivM0HRbayBoUbeG+7IZtxBShIKEsH2bjmV4QiKuNk=;
 b=PnGmdQrJ0I6hCgBmF/MF3dSo2SKvgDZnGky1Afrk11q42JIg3XRPVezM
 3GRRUPx1ttFmZ67VoBUdou1aLurx9Y/Ey/Crdrjewqe/+0FXiIkC7x02Y
 9vtBpKdaotaqKrisZfs2O1HYLuIuhHLEp11WirZqct21DHMGDGxaJgI9v
 97VdXX6fsCWjknBhjI01epRhNDqIzT9MIe64vG2YWfi8U6JFHG1eJd5X7
 vhm9si3xdBC1g8RgG4AspClG1Eomr12xvB8iW89zqcmqbDv7ZDkU6Gv2s
 fAqqB0Wkt1xDxthi4nnkd6mOmOuxkcCVOkeuVyOu8dqfokjm0H3epU+WO A==;
X-CSE-ConnectionGUID: O7vIoZtaSHu/qmbD3o0s3Q==
X-CSE-MsgGUID: mXHTvGA3Rjq0ZdOq690ECQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18181937"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18181937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:00:47 -0700
X-CSE-ConnectionGUID: V2Lro696S16TGTLkVSURRw==
X-CSE-MsgGUID: 6tGo7S02RSmlDehJPWkPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48978044"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 05:00:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 05:00:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 05:00:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 05:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEjVc+rb2ERHChuUexhIOxrglEhK6G0ebrRcP4Txis2S+xzydCUc/6CYpi9t5s4p3M2sHW0gWhMLd8YqgbO2x+zymcqK1eZfZ7fGaFEmkOQspMRUMZj5Ovwxui89fYRA+gmG+QiyawJDzwbZYPOQXbIVhrcz21Xs+B3uScw8Rxb/ub8AApAVYyK6/BECTwByD9uFm89D8rWs/Ymcxmx7k1uLHczdnlRUynL/iDn1ywLrMRqNBy50pEqfIeYUNoMtUwb4WsvbVlMd96BLgVrE4zdjinlmR41z0qm/swg73U1+Y/39Ye1ezcZPM3OQ/WEIOihuswQMfQf9e2l1QDAyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn2FnQkxDYBzcn7GByVUr957010hlYBN+PqohNogPUY=;
 b=F+3IpjwtojnS68saVXviHIos0PHdvtkNBul4d6+IAMcxFlHU352plItG+Xwc7z7wH77KNbRrBQk+03dyThYHyV/1hO6cvw9QUPtX2mRZBnqZGjbRTZMiFqQm0X7sHyxmFSY6cFSlQlIInmguviZw9CH63ixZmSxhQwuOD1aBvJu+OokxyqaBEER9W2WafQhA1BNyISYBNfUxPxtH8TsrbbMJuB4dtaU2HLSCLGn8U48zVFqQLBd9d7OxZaRM65gyB4wDDoD+xoAmxfvEctPgDC+u9Vs5lfD2/Lj+WlT7VcTQzi0AcD4u42vqGuFpCyyQsSaH/8Hgae38jaNnrbLGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 12:00:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 12:00:43 +0000
Date: Thu, 11 Jul 2024 07:00:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH i-g-t v2 01/10] tests/intel/xe_drm_fdinfo: Rename basic
 to basic-memory test
Message-ID: <7dw4w7s2sxkf4axlllqtpgf2m4v7fkxpb5tfhlgswvwrvxtity@gnkyeyww3qcy>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 88630c60-e17c-47db-e9e1-08dca1a1171e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?06IENAxqTr5okVvOoRZoSVRO/qONk0E0mhKZN37TGiYriDRM9dBnDMxw01jr?=
 =?us-ascii?Q?LQjZwgvoSYjqmTI2mAn4dZ30RWl/aacAbAM90uuCpbM+qZtEz8EXByIAXSmH?=
 =?us-ascii?Q?MtCQ+X9Dbag9ryuEY202oo0RtUHysJa3MrFqfSb1YBm29HJ9Ud28g1IBFjIU?=
 =?us-ascii?Q?4kKmqs8ZF+dslHdEs8DE7/6VMhBEZ6M6rf+wOEY5yRYh2+F7uKDw7b4m3z2K?=
 =?us-ascii?Q?eyznoDAJIjsQk4GH0OUcIs00QWKJE4hAhvSnkgP2FKzMoH1kt0bqSNBCdB0l?=
 =?us-ascii?Q?caWViHmFZnY95LPLMdlKzvk4xM/zHH4/zV2+QBHcX5BSB+PZlR0GFrzGlJs8?=
 =?us-ascii?Q?VP75yEb4jtyJOy+XIhYxTUTeevcPR3Cp06t4ZmEQE+p8M+emW8409u6uVtdC?=
 =?us-ascii?Q?qSydA/UcHM6i/icFby2XcjuMpHsKr2rC9mmlJd2ykIbQtkZlH+qVzP9jI1zc?=
 =?us-ascii?Q?u87EWaECGEKAR0xK1/4K3FpjBpXj93QHNhBNv19d5rZPqrwGAhd8MO5Go4YB?=
 =?us-ascii?Q?P+6lNmO88CllxyVgyvOCzCrRxtEoJDPR1GwLNHenLptkfFgFJB70Puj8qRsl?=
 =?us-ascii?Q?3CJ1lixUkZcM6glrI2iAuxyL0tpOr76fN/ltg7dKvlxz6FzISTZMHSr9WEyX?=
 =?us-ascii?Q?P6ah7Z+mjEeMUmiyxSQo32nymRQ1m7fJMXRHTExuYgdmQn7yYJT3KQMSAuv3?=
 =?us-ascii?Q?4q7wAiF0b0tx3R4GiycB42u1vhJLHOao3/sTalTCBKPV/aQpwS0cut1qMOKR?=
 =?us-ascii?Q?yiQRuQnPti5cTUmu/ev/igsUQAI/RGjLo0i9xMKKT9JI3CefaDkK6rUJtbw8?=
 =?us-ascii?Q?M1dKSxll0N66edWavCBN51VsJ8IELjgwjpsuBYczaLkwkuaSOqi7rkoQQKoc?=
 =?us-ascii?Q?A3wcy0LHsCI1EPR+5hNpXjysIToKYV0ogxk4xyUwzxw4Pb9QBnnKZSWAIykv?=
 =?us-ascii?Q?88J8BpsAdB2CtYdviaVNrd0xD6BXeZUOFEO+Gi/HRZMJIQGcwaNEEb6RZ4TM?=
 =?us-ascii?Q?euQAdcP1lXQOTjDv+LKkUl54WF+2Kjr+hazybfHq2QKRDVFUT3FKFtL6qh0e?=
 =?us-ascii?Q?rPY5id7KBsAarcaFiSGUphPxCPHN4g8/9GagamgBnP0f/YcrBDTdoTsa8DFA?=
 =?us-ascii?Q?wwVwi+MPSCZacaZndCZRrEhfPop84Qq/fnar60f5fH0m5k/0K7v2gOV/Q04r?=
 =?us-ascii?Q?vwbWi8pg4g6Ire7bObC/3lHfaARuslJ/pAbtRkv1TEyPuIEPuoWbKtCYCuiR?=
 =?us-ascii?Q?20J1EBu2O3ooX+vxCxkqTvhGR0MQfB8t21fABBXo9O7R3R5XXx1m0Kngmp82?=
 =?us-ascii?Q?EVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUbNZ8vF1tII3zoJhmGJTt6/LpQzjQ2QK4RWMBmKr31bywN3eJK09msSUaRd?=
 =?us-ascii?Q?tEMgob9jX6FOMl7tolbvkgE523LzwkU/Sf48Qhi1EkIDV5WopyQneDpnWYId?=
 =?us-ascii?Q?sZiSyeQyiUHVVPm9+UJ3ln8b/bDUo5uvz1KUyF4VhAfQyhvRA+JqxOVhvFk0?=
 =?us-ascii?Q?P35wOP5JzHY2DSpi88caW3caBTgyGmLqqQ2qBbiWr+JQELe8gNPF7IgVaqbj?=
 =?us-ascii?Q?bcddsNXlc4FQww8L/ZtCcncWg/qnQRWTE1+Vlg3AVVGyI4AuLgy41I/hU3WF?=
 =?us-ascii?Q?EqVI9nAP7Z9BvJ9q1XIKWIs0FhfW24GNsux7HxqHCoy0wigCZBf1vqZYG/oE?=
 =?us-ascii?Q?PFTCGsBcDDt0PM68dJGIrD8Iq+ynN2I5j98im1TboKfZZX06ErrRfUcX0/zd?=
 =?us-ascii?Q?r+uB1Vi/1MFZolgYZZrN1NNoQvcsY/sU477Wqw4Yls8wLNtR0RB2MUkDSMJj?=
 =?us-ascii?Q?WzzLFukwr7z83eVwnpGkJvI6YWQpFLoPBT3DB5GhXKdluOz85A3i8b7vLC6U?=
 =?us-ascii?Q?T7uJw2CbcffIRyJzFHg6nyKZNdEdUoAtFEmOH89VgjVDdTpwVu65O7C6IAfJ?=
 =?us-ascii?Q?VquHrED6CqROsaiCVK0/271DIPYA23DjIj9xYpTOlCv8wm4EwUoPFVlucIQm?=
 =?us-ascii?Q?k6Eekb6Dxfety0dkbENWpwsh7etCtJS1bPVKWMKk5IWn1jkoy+8XjrUZxL/R?=
 =?us-ascii?Q?MlZ/sE9f33/LeRsoOnxtUiTrHNheVAOiGrUSy7irfeH486ycvT9BGcb0TgAc?=
 =?us-ascii?Q?QFjFx1QMbWGc/EbNcDwcZ08Y3R77ovaSaX03HXPL8QJ1/UMidR9KBBCaiBTu?=
 =?us-ascii?Q?MWMXQcAIXyrRSZTBaJC9lxAoGgGmWbXNnBZJq2LXmWOcMjLH7zMRVko4eoLY?=
 =?us-ascii?Q?U1ZNgvoUmenABQqhPoyYL7MopMWKj3d1t5u5vFUHBMbUveS6IVASfL7tOJHw?=
 =?us-ascii?Q?auqKc1vo1C+ffiQ62MU6DgjGgYQWHUlh4AYU1r0TynAl9cXQXs4yzebSSyiS?=
 =?us-ascii?Q?Bb7NaS3zVm8MLpB7w95GbRD1A6Idq6+jSMArbQEEhwQEH66q4/qFfghZANFi?=
 =?us-ascii?Q?/swwN5SiuFzOFUMRPkTh4tO16EurPq/Jbh5950ZG+2mAUbVOQhKbIUyhrMfC?=
 =?us-ascii?Q?5YCQeH6x7RBW1IawDstdQVpJtodRZ+tNwh8gaTw0paJX3fHe1kt1OCFv4FCN?=
 =?us-ascii?Q?R5qnBFMemiEpk69ktol8ZBwh/FqL82W6vGbwuME1lOceePrNpRwdnpoi5B5T?=
 =?us-ascii?Q?pI0qMFSWjgsZtd61g+GYbGFVXBC8JXyhkpCk5eJzcfu2QTDkZubeyby0rivV?=
 =?us-ascii?Q?e2HqBccGC1rwuxnM9N2k3/4jTAmMBlYujr/f8TUKXK9vPA0huZrOEhopsOTP?=
 =?us-ascii?Q?advO4unJkMkEEehEKU8cd/pe9Xg4U8j8TX8/B9WKeo2UAgZS98kmuiXdohfW?=
 =?us-ascii?Q?SlLULMXVpJ3HJw7WytYyeKa5HUGDNRH7GA8/EjWE1M6mTj7NuU8aro9v/736?=
 =?us-ascii?Q?E/KMDX/s9FBH7AXH5WnkQ3JmNkAKo06jw/DZEsc/StsixZ8w0l/rkWeDzpdr?=
 =?us-ascii?Q?VUjIMXNCFlP5932LyBU4tvgJemm+xIq/4jtArxVcJ4nJZsSLSmMoqlC3LoTD?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88630c60-e17c-47db-e9e1-08dca1a1171e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:00:43.2039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jbuchtIzIhrf4RnvYBao31ITPoHueKqxOaBZHY8Do+JMO2U8/uR/Wt1KAUCoOcyJXM85KimIvHg0uAU13RpyfOpAov6bdDAxk7+Im/IB/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
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

On Tue, Jul 02, 2024 at 05:25:23PM GMT, Umesh Nerlige Ramappa wrote:
>Existing basic test is checking memory info in fdinfo. Rename
>accordingly.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 2ceafba24..f0aa23e2f 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c

I was also expecting a change to the testlist... but it seems we don't
really have this there.

https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=xe_drm_fdinfo
returns an empty result so it seems we are not even running these tests?

Cc'ing some people. For the changes here:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>@@ -22,8 +22,8 @@
>  * Feature: SMI, core
>  * Test category: SysMan
>  *
>- * SUBTEST: basic
>- * Description: Check if basic fdinfo content is present
>+ * SUBTEST: basic-memory
>+ * Description: Check if basic fdinfo content is present for memory
>  *
>  * SUBTEST: drm-total-resident
>  * Description: Create and compare total and resident memory consumption by client
>@@ -259,7 +259,7 @@ static void test_total_resident(int xe)
> 	xe_vm_destroy(xe, vm);
> }
>
>-static void basic(int xe)
>+static void basic_memory(int xe)
> {
> 	struct drm_xe_mem_region *memregion;
> 	uint64_t memreg = all_memory_regions(xe), region;
>@@ -299,9 +299,9 @@ igt_main
> 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
> 	}
>
>-	igt_describe("Check if basic fdinfo content is present");
>-	igt_subtest("basic")
>-		basic(xe);
>+	igt_describe("Check if basic fdinfo content is present for memory");
>+	igt_subtest("basic-memory")
>+		basic_memory(xe);
>
> 	igt_describe("Create and compare total and resident memory consumption by client");
> 	igt_subtest("drm-total-resident")
>-- 
>2.38.1
>
