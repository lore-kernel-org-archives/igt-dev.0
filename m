Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C4DC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 11:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5B210E0A4;
	Fri, 28 Mar 2025 11:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuGreJsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7A710E0A4
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743162226; x=1774698226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lqQ28zJx1WPdIEMbEpAPKapTUTKL6H9ftzY6cueVv8c=;
 b=HuGreJsHMYms6p5JXG20FU0tQBZr5aB86iQILtnBPmuEqTvvVmyMSHBD
 tKsb//6UxS1vn7qVbZviOP9nUC3qMSd6kCh/YPI+etshcY+ximFwerY2D
 jqwDfiss35mAxuGPsjptd7VaQ1L8qba8IQYrL1/YZikdNiF+ZUTXyKgBq
 KD8Kkvnb5ll6ZnJs1xpTvR00vurxZifl/hh/18hBoAM2afNPSQg/LQCud
 zb016bVl64dKRbU6lmbMnKNAg3cN6naQN90zatt/77CAPOGGUhdzsDRyI
 yEz2+iawqTz4eo6NPH6cKIxPrajUaln17SeoD63qOMERFSZzLec4HtypK w==;
X-CSE-ConnectionGUID: rR/QCFs6R5mpPB9azSUKow==
X-CSE-MsgGUID: EjMAxIe0QFqriGhPObvaGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66993289"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="66993289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:43:45 -0700
X-CSE-ConnectionGUID: HakwDNCgRuivgjNlSqdDXg==
X-CSE-MsgGUID: ZDIU5x1iQ/2LT4Qu+gXmww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125427212"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 04:43:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 04:43:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 04:43:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 04:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbPzBJkmI1gFze0vQwuR5jg/80rZE9BAlbcLl2trjtCLAa92TGHwEJ7AZEn6vlXKSPENXWLX+4mkn1W2hCg4q8b2zfUmMU4Y1XsppDC/2BbTePuJfIXurVNKwOJRtQ/V/nL6I/FDf2a1RkquOXpVFJfp+8fIul0aD0bM5RhPdjJLxQVPu4KrfrquqJHnGZWktDil+pb+ZkRGAPjH/r2geUkDh0EsNRxfjjVZqMxbQDgbxu4yZeyjOBdI+D16oeAul7j6tnOJEHYl6erid/yc1hcZzHqg5nnokpQfs/tO8CaUWt6nscTUkVAb4/3HBfB8effcRrUCvLPCfEfQcdX8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+1Q1+2bSbuHtGOfql/56g/HXJ4lWEWfpf7Q0DhUPJ0=;
 b=cwePNyvQ8a6LKWQWXLRyqmj8Wl9SgIs6d7qoUQqUYJ/qPqLkCc8xQjNppkU3SxkfSwDIHBk6PqIn5QDXKHdfvH/x2ASpyZMH4r07Rp/7pHM4Jk7WmspUFwIPVqQyKAXDpcwngWSHhCWpNY1sV+9SrpGb51nUcR+Wz+SIKFWz1mipVkZ0MpAzm3goQgGZ6lu2zulY6Md4B3CFw36uNPcFeRRl0oWdJduETZwgYeVYwAe17pZaWu3/PoOWVJW/eZoOaVZBMBaHQMo1ClAa8XEucGIMYkXwvjRJVtd2wJfFhdVS+E3xdHPHWyO6sH734mJFs60ZJ3p2cSywOPCxsKblQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 11:43:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 11:43:42 +0000
Message-ID: <85455f88-5d37-4bf8-9640-691fef0659b7@intel.com>
Date: Fri, 28 Mar 2025 17:13:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tools/intel_pm_rpm: Add support for xe in
 runtime pm
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250328065553.1843028-1-soham.purkait@intel.com>
 <20250328065553.1843028-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250328065553.1843028-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8bd601-0129-4866-8370-08dd6dedc9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckd2QTdVbVVHUTk0N3lOaTIwcFVnWnFnNGRaR1VIZUNoS2tMUCs2NDhKWWFC?=
 =?utf-8?B?d241cythOXlNTytGY1RRNjQ0TVgzWE5vdmFKdGMyNnlsOEljandhb1QzNjcy?=
 =?utf-8?B?cU1mSVl2dFhDMzdBcWY3bW5EaGp1cmVVVjRVMHlvYnFiTFAwaHgwWVRkUjY3?=
 =?utf-8?B?RkdwZzZiNTBERmoxZmdYc0V3dnFzcTg5RUJLdy94S2NCd1JUQnVEUG9TWG1X?=
 =?utf-8?B?VXcxSFY1WW1XaFNBNSs0a3lDZCtvaE1KUlYzdW5jSjIvWG54LzNHaW9ZQ0Fp?=
 =?utf-8?B?ZFBHclFxRmU2Q0xHakVzSHZPNXNOMjF2ZXhIZlRBNDYvNVV4dnFWK0RzMHBU?=
 =?utf-8?B?d01NQjZ1cE5SYm9ocUFoYys0b0xkQ09mNFk5aFR3aHBTSE5IWjVuYndRR0VI?=
 =?utf-8?B?bGF1bENNWFpIS0xISUtjUEM1WmI0c09pVFlDK1BEWUhzWEJUUjV6QkR1NGRS?=
 =?utf-8?B?Z3hxMnpqZGppOW42cVFwQjkvZEN1dG4rOHZpOEZHZEJpbHVXV0RUVGs1aUQr?=
 =?utf-8?B?UjhHY25zbG81S3dSUlZvcHdGR29jZVNvVFZiT2JKNy8rakp1YWdGVzNZSnlY?=
 =?utf-8?B?dzJyR2ZuV2xxNUtnRzZhcDExeFpJZlBONXdZWmk4SzMvdi96VzZldXM2aGZm?=
 =?utf-8?B?WUhEQzhiSWh3L2lNQWZNaE5kVVFCSEtHckEvZ3YzS043WERwZGkvY3V4dGJ5?=
 =?utf-8?B?cFVtYkdKbTZ2K2Rid0tPYWswaXpLTUMvY0doR3hkbHpPdlcyQzJjU3FRWUlv?=
 =?utf-8?B?clhxN0ZUbnp4aHRKNUcxak1lR3dFOWN3VFhveGtzaGltVHd5THRBbGdBZ1lI?=
 =?utf-8?B?UFdpUXpRUmFLQUZ3ZXgrODU4ektDMDNzWUV2SktOTy9lM0dvRGZoNDM2SVh0?=
 =?utf-8?B?OWRVcHZFYU1tdmhQU1N5bGNHNFhtSmdncVpxUkJZcEJnUFg2bm84VmJzdzRZ?=
 =?utf-8?B?TUpFU3JGNVp0K3JiZzNMS3RCdmNmNXR4dXIvRmdmMWRRTkNyYXhUQnFLZFhV?=
 =?utf-8?B?a25hQVFZOHd5WldJZXFhSWZmeVVCUzFKSkxvbHJlT3ZTNm8wMldtTG1HeVUx?=
 =?utf-8?B?S2I0YWx5WlJRVFNWbThLVWxDWWxKZDhJbGRkNzN3K1FjeXVhWXh5ZG11V3Z4?=
 =?utf-8?B?MlQ0T1FoWlZaNTBzSzl1MlpRdktKSjk1Zm9vU3lUM0gwaXZWV0hxUXJNbXJD?=
 =?utf-8?B?Rk80OWc3TWVzVkJjK1RjcFduWEF6QmwwM0cyUDRzdUNKQ2s3L29DZWFucG9L?=
 =?utf-8?B?bGZNZURyc1FMb1JFT3JIWThPTzN0S3M3ZEt2OHpzN3ptRDhvVHowdHVWZlhm?=
 =?utf-8?B?emNYaVg0a0JhMzdwcHJFc21RbXRGd3JQc2dzM2daY1E4QU5qeFBENHdBTWpk?=
 =?utf-8?B?MHBQS2JQMWhGWDNjcWZ4K1RkRFZlTUlQUVpMblJjY2YvRFExMjdZbjUxVjN4?=
 =?utf-8?B?dWJLWi94Q0hNKzM3ajR1WWFvdVhxOHdQVGxFSkdyMmNaYmZ3MlMxYklhSmQr?=
 =?utf-8?B?Ym1FT2dpVEhYVlZmMjZzcHByQkZJY0k1a3JTQ0htVGlkZlpYcHUvRXBWWklC?=
 =?utf-8?B?ZUtHbURsY3BHdHdCeDNpeVBPSHd0cHl0UUMzejNkQXN1MCtOUnV3ZEE5dzRT?=
 =?utf-8?B?a05zK0dWM09EeENvSkU4aVloSWVoWHdtMmZlOE9ablhWd0lEUXBmdHZ6R2M2?=
 =?utf-8?B?bmxVTTRySWhiMEx6OFBnYnBFY2hoN1BRc25ubTdhSThnMkFGUVNCQkttVzdj?=
 =?utf-8?B?SGJWQVJ4Slh2cEdYTlNxSGZuN29DTDBoYUx6VjNSdERFTzV2WDVVOVl1SnNL?=
 =?utf-8?B?T1U5T2xvc0NQWER5bVk3N3k5cjZOSktsdVdpd2cxYVRPa0pDMHhIOS95VFFR?=
 =?utf-8?Q?r9ItWL7d7kFrV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJocFphU05xUDZrb3gyN1dnUUZQMUNzOC9IY0VNRVdrdWQwdkhjL214dXpE?=
 =?utf-8?B?RlBmUExYZDl6YUYxVzFnWFRJLzRTdmo0RWkyVE01bVRkS0loWmpvWG5QVndr?=
 =?utf-8?B?RDYwQ3VEa2VWdk5sVEhnSjk5dXFieXVvM01OV0d2OU0xM3owTm5vTnNuR0d4?=
 =?utf-8?B?ckVoUktwSmR3U25MQ3R6TzRsOUhFaFo5aC82YkdVN050MVZvSzByd1MzYXNC?=
 =?utf-8?B?aWttWXdPajR6RlZzbW90cGFYSVdqdzZpSEtWdGdVdzcvcnV0aS9FdHF2MkNm?=
 =?utf-8?B?MS9jOFZGNEthZVVCS3ZENGxQeldDSkJIR09RTURodlpnbUdnUnpFbUUrNU5B?=
 =?utf-8?B?bUhJbEpFM0dPOXFCT25saVdaTGM0TnBlODRSL25VZEN4VllJb25kSWxzbCtX?=
 =?utf-8?B?a1FYSU9sakpvckZwQmI0VXgreEV3ckFiUmRqQmJRWnU3RlJMRytiWDdtcDlG?=
 =?utf-8?B?eGg4cXlPNkFKczM2d1VNSUtqVVFRenZRZXg0UjFsZStjNnhJamloTldEeWVQ?=
 =?utf-8?B?UVdoWk12L0x1azlCM3Yxa2ZobHM4bXRvdmdZU3JwNE1FL3RKWCtaeVRtRXhS?=
 =?utf-8?B?LzIrdmszRnJSalgyS3dzL094TGJCMTM1alpRa2t4cUJJOWZncFFBd2pMc3hJ?=
 =?utf-8?B?c0o3cmM2OVhwV1F4ZW0rWkNrZWlueGFkZmF5elBuVFhiSG1vUE5TL1RSb1Rj?=
 =?utf-8?B?eHZucEo1OGdJcVRpNURWVlFaQnRRMExaS041VlR4MXBpdXREK0JEa3NRQmhs?=
 =?utf-8?B?endUVTZqWFdWK2s1SnBWSFM5NGdnSlpYczlKRkQweXRBMlowVUh1dFZ5VFVB?=
 =?utf-8?B?bCt3MDBtQU9jYnVWcmxmNUM0TG5YOHc0TzFJdnVtT3dWR1dwYm11WU9mL0Yy?=
 =?utf-8?B?RUtDQnYvSWJab0xMZUVabkVMZHA5MU5MaWxZRDNUT0RDbXVjT3ZScWwwcGQ0?=
 =?utf-8?B?K2VLb2tlQlBiK2g3YzQ0NFBSMkF3cS8rT3hsVkFmR2NudlNwVURnZ01NbnI5?=
 =?utf-8?B?Vm1aeXZ4N1psNUU0N0FJMjZIRGV2VVZONW9RUmp5NlJMaVN6ci9SZm5yRURo?=
 =?utf-8?B?eUthTVBmVnpBdlZoNUpvdXpLT3BsY3ZYbU4zWWE5L1QyRW5Ld1RvSGtYVW1u?=
 =?utf-8?B?cnJGcUJQYUV5TG03MzUzemZoYXVyeWdDcWUxYVE1K3dlUnR0NmFnZlRIQklS?=
 =?utf-8?B?VHhJTUFPVFMzTXJnSkVDZysyWXMvM21qa1M3aExLN1hqUkdDSjFIdWxIbUVv?=
 =?utf-8?B?Q3RwTytaaXovd2VkU0FoNDdIRkVNcEdlVmRlQ1JkRnM3aVEvcExadFEvSjd0?=
 =?utf-8?B?WE5oMzBnNHBsd1JReDdtZ2pUSWhFOURFRUg4eG5qUWdMZWtLdFBheHB5ZDVD?=
 =?utf-8?B?SmhmdEVFOFpNUmlPR0w0K0c1T1lta1AvZDk3a3B3ZkdacC9UNEJPQ2J1Sk01?=
 =?utf-8?B?anl3SVhLTmwrOGhHbGliTkt3Q1ZGa3dmbml0UlBBeGpnM1dFZXU0WGVsVlpx?=
 =?utf-8?B?SExkKyszZk9SUUdjTUF5MFlDejQ1S1luUHhNTzV5eTR6TjNXNStLZlNDUWd4?=
 =?utf-8?B?WjhvTUdjSGpHbnZYMVFrUGt1L3p0Ry9YOGg0WFpCaFk2YkJBdFpiK2R6MkJ6?=
 =?utf-8?B?c0hYU1FKQU5tRERBa2VxWG9YSERJbGhJNjMyMzgxWW9vVGNPRGQzQkJNd25s?=
 =?utf-8?B?RmFoLzlqK0pCRHo5cTFob1QzZ1hhZlhLd0hlQnNnQW9uNXVaREtrcllSL0pG?=
 =?utf-8?B?Mkp4Y0U1VXZaT043WElkZm54YmJqRUo3bGZhb3NVWmsyVkprUjgzdGI1T3c4?=
 =?utf-8?B?blBibEZaVWk4WmY0a1kxS05uRXJqZU5aV0twYzZKMW95R1dualI4cmdXbmhC?=
 =?utf-8?B?a3ZsSlo0a3hTVjhYTmE3Nk9hd2pSNHFWK000d0ZvMkNJYm9aQUNhNFdBeEJ6?=
 =?utf-8?B?MGJxMG1iMm1NM2xYU0pIVWtCdHRzUVBRdm5GamFRWkl6aklNcU16Q0dqamR6?=
 =?utf-8?B?R2MzUUQ1bkVyVmtNYTlsd2NvZ1ZJL2JsbVFzMzRxV0pGMG1KNG5QMkpneUoy?=
 =?utf-8?B?VVNpaHBqL3VDclpnQUNWREp4T2JHdjRkWUZvdWF4L1VQVXRrN0JPVmt3STlv?=
 =?utf-8?Q?9oWu4cxAUIY0sxMyZ6pOpC6zX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8bd601-0129-4866-8370-08dd6dedc9ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 11:43:42.2510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+i0Y2/QGxp670iaDgM4OO+ZZOqEMtEjBsRFr8WhcnrouuFv6fcGhRCFK8z+U4VssUvz/pku88wOTki+5CXbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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



On 3/28/2025 12:25 PM, Soham Purkait wrote:
> Add support for runtime power management
> for Xe driver along with existing i915
> support
> 
> v1 :  Updated references from "i915" to
>        "generic GPU driver" to include support
>        for the xe driver, ensuring clarity and
>        consistency
> 
> v2 : Add prefix in commit message (Kamil)
> 
> v3 : Add a error or warn statement (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/intel_pm_rpm.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..1647c9086 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -35,7 +35,7 @@
>   #include "igt_pm.h"
>   
>   #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
> -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
> +#define SET_AUTOSUSPEND_DELAY (1 << 1)
>   
>   typedef struct {
>   	int drm_fd;
> @@ -47,8 +47,8 @@ typedef struct {
>   const char *help_str =
>   	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
>   	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
> -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
> -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
> +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
> +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
>   	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>   static struct option long_options[] = {
>   	{"disable-display-wait", 0, 0, 'd'},
> @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
>   static void
>   setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
>   {
> -	struct pci_device *root, *i915;
> +	struct pci_device *root, *gpu_device;
>   
>   	root = igt_device_get_pci_root_port(data->drm_fd);
>   	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
>   		igt_pm_enable_pci_card_runtime_pm(root, NULL);
> -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
> -		i915 = igt_device_get_pci_device(data->drm_fd);
> -		igt_pm_enable_pci_card_runtime_pm(root, i915);
> +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
> +		gpu_device = igt_device_get_pci_device(data->drm_fd);
> +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
>   	}
>   
>   	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
> @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
>   			goto exit;
>   		}
>   	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> +		    !igt_device_find_first_xe_discrete_card(&card)) {
>   			igt_warn("No discrete gpu found\n");
>   			ret = EXIT_FAILURE;
>   			goto exit;
> @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
>   			break;
>   		case 's':
>   			if (optarg) {
> -				if (!strcmp(optarg, "i915-auto-delay")) {
> -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
> +				if (!strcmp(optarg, "auto-delay")) {
> +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
>   				} else	{
>   					usage(argv[0]);
>   					ret = EXIT_SUCCESS;
> @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   
> -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
>   		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
>   			igt_warn("dmc fw is not loaded, no runtime pm\n");
>   			ret = EXIT_FAILURE;
> @@ -215,7 +216,15 @@ int main(int argc, char *argv[])
>   		igt_setup_runtime_pm(data.drm_fd);
>   		disable_all_displays(&data);
>   		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> +			if (!strcmp("i915", card.driver))
> +				__igt_debugfs_dump(data.drm_fd,
> +						   "i915_runtime_pm_status",
> +						   IGT_LOG_INFO);
> +			else
> +				igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> +					"xe_runtime_pm_status:\n%s\n",
> +					"Timeout waiting for the "
> +					"runtime PM status.\n");
Timedout waiting for runtime suspend
Since there is no status for xe.

With the above comment fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


>   			ret = EXIT_FAILURE;
>   			goto exit;
>   		}

