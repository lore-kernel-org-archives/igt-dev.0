Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A733C3601A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 14:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0841810E250;
	Thu,  3 Apr 2025 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifggaRKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240B010E250
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743692033; x=1775228033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lqFIzB7AiDbTAbpXB8YtiXnwh9ZTX+s6x06qoEBEGtQ=;
 b=ifggaRKI0WsYicfNzygGpgq3llRakKOPmhbU5eWeBmg3EWC963MYRsPF
 NzM/zFej9Y3U9F5dA+ntw3qIWtqVEil0EmPPA2R5AgHm1sFRsowoir45r
 jBzVadxQCaGzfeG+kQbaZlk71B/k/QcDUzM0XV9PDuw7zefn5YYWIRmM8
 8Y4jp9IR38YpciFadUqTIhraH+fLdj5ei8UpaIUgin9Dp7Oqte6UVrZpk
 32SUcIGPjfbsBBGTM+nX3E/yuVZnxaMmXMsy4q5DxM3m3OIYTdBf/Mwnd
 /NhX/lal/KOascisZZJr1x8JQI4kI8EMW5zY/vHME291S7GFBQ4neca3/ g==;
X-CSE-ConnectionGUID: sDTHKLfrQD6P+sjHsah/WA==
X-CSE-MsgGUID: dThIR11iRkyJOsvtNMDhwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56473685"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56473685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:53:53 -0700
X-CSE-ConnectionGUID: 8d45hDeQQ1mKkMxqKcDXsQ==
X-CSE-MsgGUID: xT2c/V/HRkCfH+rJvSh9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127546546"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:53:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 07:53:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 07:53:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 07:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgMwTRz2d8TJwHCSP7QrTBLZ5QhtxrklCPJ/C7gfgzAgV+v05qPWFLqvdZq5OFp4dpmN+3i8IRl3BMztCvod6AO00PoSUQBkvgftd1QmLItoevNisUjOt3vrAe03ZIDgUMAzOZWFdd0JkbOFOR9G/1EfQrq3ro0+9D1hi8yXTfO0IDh3VmilrvjmcBJOb+irZKeseiuFwtI3IEFiiWA1bVkHjMLYOx/LUw4GHsh/9tyYqLjml5cHV76Up6o/Q3fbiCTdyKe5CSlKF1fr3bx6Kw7hVTFXan8d0RIV1oQ8ghOw8RR/wNZEgi30gWLti6Iq3WWi5cTJBXGihfDigsfyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrfVuqM4hLUtBUFJfmJlPTHOc+GCTniKx0EahyS0Lys=;
 b=kQ0OrFi2X+BRPqQevuzoOQsOcyAq08ehQ4GZKZ8Rgq940uuZTmk8xzC/+khpfdFeWK4h2WGh/bgWk6lFIKqQvMsbjc7RJkHMIpBolao6WCa4n7TpBlhwcmCxq4T3IsvST7CR1BlvZp1+jCfLCSzXz93WaRipGMdTEvy/H0EiFf12b+mVknyj2e8uLcfqn7rJ1a5BX+BQBAOmVON+oHW8m9XJEb2CgbuWOJE1Mo97T+HGEJeEYtM17S+FAJs0s6iykLjLPSM9q4P3KaoX8Whl89tBtGDJi9h+i0eKwy0nOwAcZXmiKMCQ7rlzdSx+N+zSsxNoSNvye5oGaCG+vlCAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 14:53:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 14:53:49 +0000
Date: Thu, 3 Apr 2025 09:53:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Add test for
 xe_hw_engine_class_sysfs
Message-ID: <no5oqvai6mjtedela4muykom5dd4o4pv5xeowd3ywiezeoffon@45nafswphcqt>
References: <20250314105657.637898-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314105657.637898-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: e121ddad-566a-4e6a-88c9-08dd72bf57d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?npjtA0+n7Wpeg8hpVT+rofFdxeoMyQjxp5fSQGOtDkzwcfhu7oIw/TErZQRM?=
 =?us-ascii?Q?E2dXatA7ggLAdgknpAFDxrhH3KSJUB8M49UMiprGrMN7S4fFf+7NG2LnQhDQ?=
 =?us-ascii?Q?MZ3FBQXDQGhgk5kl6BCkf/tM5Z9h5HdBXI5hpctGvLxNm9x8rK1rqHCzrujY?=
 =?us-ascii?Q?OaNkbYBovFZliF6VuxziIXUuimFraS390ASSQAPGC1Rlv+S4in+EOaxF8dfF?=
 =?us-ascii?Q?6UrGyyeoMsFqep3RjfJbS3EU7HYOLJNO78Y1sx/YzyXE91yoNTeNxRiDrmvd?=
 =?us-ascii?Q?rGTEMjXPEiwHN4N9Ahd9Dkt2sev5uwNXWjdTbJTfazJHvQqEbJRjcxKAwUa5?=
 =?us-ascii?Q?lQ4bwPbhIokEW08PkZ5KQAsAR0p16h+95u28Y8uHVAgP+exVB+m+aSeo1CRG?=
 =?us-ascii?Q?JMKflrPAmtyDAg909XU/XrW58KqPacvs1h1GtEkm0AIyr2y+LU0fFW3FnNO/?=
 =?us-ascii?Q?yQaHlQ6WMfhl9cCdJ5X2gtClPVV3IJKPVqT/p4QLcWBSBu15I+PI65AR4g0P?=
 =?us-ascii?Q?WSQHtRUMZvDoutKCul7ifceNXw2jBydEKzCVkiTeTXSEJZwC1IrWgG3SBkqs?=
 =?us-ascii?Q?qpKhovyjdp3nOP7f5SP1nFYZ/khtXGUJ/fGC6g0BQjaFIR2KtV8rrZOmZJ1c?=
 =?us-ascii?Q?lTcNd8tYNDoyzVONH1/rkkhwsqlnWfLdaSYT0U58/DSnyWGEvY4FS12jStg3?=
 =?us-ascii?Q?wr/dMyqMRdKIWpiqsJfF4PsnfSoeJ5H4yz/IsmAJqIxiS1qNcTK9zR9is6hF?=
 =?us-ascii?Q?+d9qjQWNM8xNdqQNL3StgvoClu9/tdokzzIIZPH59Xl2MtAW3dd0JBs7iWTO?=
 =?us-ascii?Q?ox/aFOISBCGxUbkTCP4ohGBvIOHifJxaj0OKRMNczfs1ADe9czt2+K4LglQ/?=
 =?us-ascii?Q?yuHVggsC+Ay4LHijAfl/h4iROC173qzzQMrqOaNocCxmrRDfA+Y71MSVXcpW?=
 =?us-ascii?Q?ovU3dHKbD+gScHhMNY0fOK2LfghhOexOuoM8dhGvNAc/GXIV+0ydRIX660O5?=
 =?us-ascii?Q?QHYIWlX8Taf/Sny7nK60wr6J6WawiOd6irsbXfRdTcrl0UNXBvMThVRe1T0j?=
 =?us-ascii?Q?jp2pVDV20aNBMdleHSa5cxRkQnJS4iYqCRCtdp4IlgMLanEKXNSPCIBs6bWQ?=
 =?us-ascii?Q?qRejW5B+iN4be0dxH+S8qzIEBI1dkfD86zvS3dOHFVHn28AsqXuBRov2LzC4?=
 =?us-ascii?Q?/lbhmmb85lU0useT5k0a0Ll9oL2tWxXK2TzLLdN2lyR7SRNRwOWXQNZ5LAAk?=
 =?us-ascii?Q?JmBZdHYpunD7EHnFcbFfblxHF7J2oynblXcAjjQj9eFnpQnwkFfj0Ypw1ki3?=
 =?us-ascii?Q?t7jGLhniREXI02yIdZYn30EbEUiluHWQ63nHvGUUXOdTPldC4OzeYY87MnjX?=
 =?us-ascii?Q?hx5pY0xqWpNz0Uh08JAqzejBymfv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oy/Z6QVLX9riKbEe4B562jPUCT2vanfQS1LCf3dgUe4S45yVdVTGFH43kMyv?=
 =?us-ascii?Q?byso4KBShsL5cgrf+iA+eOQWsOfTEHLS7Cy86Az9tPYMOQ+THoOZFe0jH1kX?=
 =?us-ascii?Q?2udAYuVAWeP+hdqnOwgeo1xr8NLoD4CdGW09YL1dWBUzJHAIXsO7udnsabqX?=
 =?us-ascii?Q?iY7QxtOjd/w8JeT2Ss7+HjfXJ4Y8wNLSI7uXZRygFQXbH3lHWXetkaOwNFFB?=
 =?us-ascii?Q?aBcY+4hr89BVdyxY8bP04ckzS5P2Q9TSkOwIuq3z6QKbVqeu21poEr/WhbV3?=
 =?us-ascii?Q?cz7sM1sk7ow/sjihXvy8AG1sBDVvux2GNOTSIuFo265cCiOyJBO2wSJb/j1h?=
 =?us-ascii?Q?lp1K8NOY8i8mvBlZVWL6D//iUAsLBHHCac+Ukl0+2MpnlFKS/nbTX3YVrqf0?=
 =?us-ascii?Q?tHmm/0Ng1pQRA+MSWeHT44tNJUgdtJnhaCX5ncs3z8p6R1X+Q+g5rx+gdY6f?=
 =?us-ascii?Q?+CYBP2Xw9MgWUve2ezJek0v9e8InVnc1oDElFd9oyNZ53RY2CXjuPsYTK5Y4?=
 =?us-ascii?Q?fO8jvCV3uM2rW6CvT+HPccGu4Ql5Cm5f2e3X7a156khfUsUi+D4FAHmbVAf0?=
 =?us-ascii?Q?m+EWTYbooJAn7Uw9F8SQFP+enIsx25DqI0hEGLYXTOQGZCX9YZE4Gkdy58MD?=
 =?us-ascii?Q?h39zTr3ZseyJNVJBY/i0+B1XwyjozmdHV/IJ/vQPITkv3322hF9yYKlZOYqt?=
 =?us-ascii?Q?3lRJ1pmY8MFoSi+FxPi0sc+lsLdUsA1+y07Np3ZyZhMRa5ujzpq+m5Z8wSsO?=
 =?us-ascii?Q?/7sHskyq+S966rGpX2jsAAUjV3oKEaJ+GnTPywg/T5ufNgB5Xkd+8ZA9OrOs?=
 =?us-ascii?Q?EkaPom6uAitCP4Nr/xuwKq3vN0jFfLxeyfPYk6n+L0UCIlXOgWSTTWvc10/H?=
 =?us-ascii?Q?AdhCI6RfE9gkXZW2PoM870eQf28KaIFKiOjgiPJq+pnku5a2jhXXavN+4wOz?=
 =?us-ascii?Q?OwoBetj5zdRa7UCZMhTtj3Gwtz+q+iMnAMDL55ANFLkxPYu9CTn/skoiJ7ip?=
 =?us-ascii?Q?0qJ3oBJgGTPFtmui6pAONLHU/Pz5cSUYEoktnHi0DiGhG4iLdcFm0o1bCuwu?=
 =?us-ascii?Q?NfvpslcvVhixopLK/K4y83vCeyIzmwgCgtpNSM/GXkA3VupsLTmvlf+vBMHV?=
 =?us-ascii?Q?4euye/C7nQ+fbkxKgBdjW3c5TE4+/Ie+5wK4iLI4+hrdzKNE3gMsugX1iD/8?=
 =?us-ascii?Q?6foGuQZq8adwsAYp4C0bYBQXYeLsJ664E3NpDEkyqG+Ce8qJaK4u19r90JHU?=
 =?us-ascii?Q?xU0YfJF3LgWL6b0CfO92n55pG7RK9pF2Q80Ss50LZUDKD1gQx6sxijcqxPie?=
 =?us-ascii?Q?Y0FEACJ93Ci7Kwws7s5PH63n82uCOjfaunSP8cBEwwp945clxcKWyUpgMTjI?=
 =?us-ascii?Q?e5sM8KUxFywyETDSyoesHgeatKl3EF9Kc5MdnOEtmyX2TuAIsxh/4Tp0/944?=
 =?us-ascii?Q?Cq7sdaqCtgzonquRBxFpaHkIIPNUce1w+lKe1+a+/l1ekc4FIBXI4a7PKVfo?=
 =?us-ascii?Q?mRHXAPSmE0TSPz9xZrWEgqeQPyv/9+ZGofZICRYZxYnNSdpYpXbVzwD2WuJi?=
 =?us-ascii?Q?Oxcxt/RAYfuKVn9AHWcegOQsAx7R9Imju2lK6Dx/wUxxibeqcVlh7nVCXyCr?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e121ddad-566a-4e6a-88c9-08dd72bf57d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:53:49.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SODxvK4CVzF9oC+MFoHCVdBGkjmf1EVkufRVW2W1ULIxgKpQhZK3ZmHreVje8rpZ2089v51hEfclojix7HsB/IwhHN0h2O7lkednpp2+9Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
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

On Fri, Mar 14, 2025 at 11:56:57AM +0100, Francois Dugast wrote:
>Test-with: https://lore.kernel.org/intel-xe/20250314105050.636983-1-francois.dugast@intel.com/
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

There's a trivial whitespace conflict to fix  though. I think it's
trivial enough to fix while applying.

Lucas De Marchi


>---
> tests/intel/xe_fault_injection.c | 28 +++++++++++++++-------------
> 1 file changed, 15 insertions(+), 13 deletions(-)
>
>diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>index 6307e0277..09b85afb4 100644
>--- a/tests/intel/xe_fault_injection.c
>+++ b/tests/intel/xe_fault_injection.c
>@@ -158,19 +158,20 @@ static void set_retval(const char function_name[], long long retval)
>  * Functionality: fault
>  *
>  * arg[1]:
>- * @wait_for_lmem_ready:	wait_for_lmem_ready
>- * @xe_device_create:		xe_device_create
>- * @xe_ggtt_init_early:		xe_ggtt_init_early
>- * @xe_guc_ads_init:		xe_guc_ads_init
>- * @xe_guc_ct_init:		xe_guc_ct_init
>- * @xe_guc_log_init:		xe_guc_log_init
>- * @xe_guc_relay_init:		xe_guc_relay_init
>- * @xe_pm_init_early:		xe_pm_init_early
>- * @xe_sriov_init:		xe_sriov_init
>- * @xe_tile_init_early:		xe_tile_init_early
>- * @xe_uc_fw_init:		xe_uc_fw_init
>- * @xe_wa_init:			xe_wa_init
>- * @xe_wopcm_init:		xe_wopcm_init
>+ * @wait_for_lmem_ready:		wait_for_lmem_ready
>+ * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
>+ * @xe_device_create:			xe_device_create
>+ * @xe_ggtt_init_early:			xe_ggtt_init_early
>+ * @xe_guc_ads_init:			xe_guc_ads_init
>+ * @xe_guc_ct_init:			xe_guc_ct_init
>+ * @xe_guc_log_init:			xe_guc_log_init
>+ * @xe_guc_relay_init:			xe_guc_relay_init
>+ * @xe_pm_init_early:			xe_pm_init_early
>+ * @xe_sriov_init:			xe_sriov_init
>+ * @xe_tile_init_early:			xe_tile_init_early
>+ * @xe_uc_fw_init:			xe_uc_fw_init
>+ * @xe_wa_init:				xe_wa_init
>+ * @xe_wopcm_init:			xe_wopcm_init
>  */
> static void
> inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>@@ -324,6 +325,7 @@ igt_main
> 		unsigned int flags;
> 	} probe_fail_functions[] = {
> 		{ "wait_for_lmem_ready" },
>+		{ "xe_add_hw_engine_class_defaults" },
> 		{ "xe_device_create" },
> 		{ "xe_ggtt_init_early" },
> 		{ "xe_guc_ads_init" },
>-- 
>2.43.0
>
