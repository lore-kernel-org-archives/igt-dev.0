Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE9AC41513
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E916C10EA73;
	Thu, 11 Jul 2024 13:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbJxJ3/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C210EA73
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720704852; x=1752240852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ye2bj2al2mkIQXNcEoKWzfj8/VDITaUlKsbLYLBd1RM=;
 b=YbJxJ3/MD4lJL6zcm5/RZWxCAdzJmEsvGW3YfUvxHtI+Z5xxLWQcBqJc
 wBRjUWnsmj586HJEMREizfRa4d8el9W0zBT4dHqeCG0/2fmd+S5hN2v9h
 eh/HZL9fOITm1u7LAfUyeP2+h0iHoXEGWRnvGD3Ji+uGGRlvNJfioGdic
 0V3eEtrgshc53pruErAt2kasrxEgTpr2h5Tek5WPDnavA2/OCfO0Snera
 Z3dF22X+qZKhSLNVGNoTcq6wBIEwd+J8eBBSVJkRFfeiGzKn62xnOZhdV
 ALUq1i5eb6NaP1Xm1pNZsmGuBeb9duG5yDXaZ2gG6ahHtiE+8O+Bo//iW A==;
X-CSE-ConnectionGUID: jUv3u2njTNe/nlqggs/Njw==
X-CSE-MsgGUID: On6838YBR8q3whZM2w0aag==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="43501492"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="43501492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:34:11 -0700
X-CSE-ConnectionGUID: rdaty8a/Q4GWWpzQbKdd8w==
X-CSE-MsgGUID: vkb7OUBlQqSQcAFvWBeh4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48640016"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 06:34:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:34:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:34:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 06:34:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 06:34:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGAaMHcXe7E/yUov+Z8V2QaxY0jVh1bSde+uT8XONCvYz0luYCb+lIhv3Ho5BI2aYL2StiVZdbLCekn+fttrPmApMGkhFT4lIztv5mF5kvlRj5jVARmMd+N7q2OBLfB9Q3mIvbfp34aaOD91u2ICKO5v/DFn/hKPKIXZ6sPdyHocgGEgKP3pxAPN8P3Bf1OlN+YXIF2yiJ6EGZ96bUX2gLpvzLk2uovDe+rDTCFC6g5KRra/2u062xtAei1nBkdUvURBMlqZyendFby7qAyiVSXvi7JVESp6dVc8qajp0ZORtH87WzzXszl13OkJmEnZbDr8vKjGimsn4V/VkxKpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3hFE//q81k1l8XqSJ+tWRRkBY4fpco2iqF3csvy470=;
 b=YdF5nQHpJHMDxGny2XgViAxRLFmzdzXApVCGMFlO61SXtnRdt2wwzFYOHt8jPgrgEwsOxcRw1/VMwY6Oe0sDbUKR4l4aQL7VbGBQZVr2NLDw5xI+S0PBhqtFDbC2at/ytJtuNGl6Gd8EO1QrdJfkN3HCwZOjP1JFux+iuW+MrladBQdHK1NDh+NlIHf/d5Kp8yreQsU/AnTNoYa69bxl45b3CFomeTHHh3YLXQUT/3u9HyA3nkXOFZwSdQt1qOh/RrCqZF2SAQ5yR3+6OuuY/YNXyxf7JqlCCzUvHMX3ONLET41Nab23mvZzFGu9FhULXJOyu8JpztQMnMnL4S1Bng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 13:34:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 13:34:05 +0000
Date: Thu, 11 Jul 2024 08:34:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2 07/10] tests/intel/xe_drm_fdinfo: Add an
 iterator for virtual engines
Message-ID: <66pm7xg62ide36jiagnsc7hb3hqo47wwadkisyqzokhtbobfsf@wsgxak5nmwzw>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: baea7122-a891-45fe-91fb-08dca1ae2294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1VRdUiexRwg1DuGHnF+IB1ApuNYQtSfWHB0N7OERef91sGOwexGjBAUIfQEd?=
 =?us-ascii?Q?GRbAwS2X9YUvKKWl9zXBI6vAAqVCo6hoVJ9P58BGZ8YhIdi0vZla2Ek7SmGR?=
 =?us-ascii?Q?Ll/E90GNwzliKqV3t9aj9q5hd8cHWSpV3g797s0sutVmWG1/2FM1IFskdKlP?=
 =?us-ascii?Q?tVjqNI/5hpz2mzVM1wEHvPm47r7VL2NGiImijoH0yk3dF8pz80bKOOIaLOOo?=
 =?us-ascii?Q?6dctE+uxEOJ4Uo7DodS0IW326HXIT5Zfdp1tS9slpA+z/H17YZBby4Cum9a6?=
 =?us-ascii?Q?FbWVHj6cvitA2uDCJF1Dvex3nWRao0fsRpWNg1CqRmjY8EvBGGiJF70Olhh8?=
 =?us-ascii?Q?tQfnC4EAEEaTT2Q649u8+8Kub4KrUOJyZga3LLrp/MvpSzyqUPMq1dyOJayv?=
 =?us-ascii?Q?lWZd4KW8dBtWWEt3WnjEnCtG3gf647FwBRVMBUW3pfpEcbeCfwY8Zk7MMVMr?=
 =?us-ascii?Q?vBkjLusaG+yB2QHMM8vfChSg5vA9HGqTn97l8DuNsomSAN6iDZvS3W4kcnuS?=
 =?us-ascii?Q?IBuxectn3pMfIAQ/AXdr3h8zOL+xMbXGgu8sxl1tcZVm0Ncrm1BgKWA5l4GY?=
 =?us-ascii?Q?YgrKmqxkjXk4eWwfBDHScU8NZ3oBgb4H/2DXdlTBCLO28qVNbOTrVFnFn9NY?=
 =?us-ascii?Q?npm4fsZowpfOK7+/dlxi6q6uqj1fno74kfB6SQkgSssX5Zmm6791rBt3yCre?=
 =?us-ascii?Q?1zB03irW3YermEu1sWhymBE/z09rpB/SzTlqc1tgsC6NZshuT3Fx0SLoZWvo?=
 =?us-ascii?Q?RT5/Vkf27nyHNP44S8qtfP7Bz0kE4tsijqNIYcmuLmef+GJAEh7lYPZT2QML?=
 =?us-ascii?Q?MGHqL1ifwEIfgAPi0Z7k22OLCQEFrjP34NzjNk/sJM38i3iSBbhQ9V5hwPHX?=
 =?us-ascii?Q?z9j3Sj0VV0S8IgNu/HWnEhWk7wGsSQUPaC5C/LoHRhyKXuTaaIY6mAbpZg4d?=
 =?us-ascii?Q?aSXK/bqka2R9XY7NIaXPyHtxdxqGA6FZVHEBgqyZdWo2rNMXorRxbd9aS18P?=
 =?us-ascii?Q?l/S+DlQoDVxpyOT5D3hMwsS6tqvitkEvXEV8K6R0unQz0Nsf+tYmDhAd4zn0?=
 =?us-ascii?Q?iU7zlKwVxOGGq7VB+Bcid3Oan3cyBeElwQ4g6BUM4GmASO9Ofs1TDZctJ51O?=
 =?us-ascii?Q?Od9q4lm95vKDYlZSn33y7+z0ZPOTJN21mN7N1UDWHQWEaCofpea2J9YpL2tV?=
 =?us-ascii?Q?Ad4wrjNvSsAGMwaHJBmFbvY6uCkRsUs2omOtgkIi8ZsOaucr1NyMduWvI0W6?=
 =?us-ascii?Q?a3+9VJrZ+Hh+qV4x0OzSPjk68pDanVlBjISWA5HbISmH9LIfS6YJZ1c35I9B?=
 =?us-ascii?Q?nzW0gRbu9llKQ/7keOYAB0mYc3QJ5kFq0WXNSxgbSsZing=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOxidRahKYkd8GX+fvw7DzN3csydhivkGwzhFJ5yKgBiTI3FIfIC1XkylakT?=
 =?us-ascii?Q?gXSHV/lBcAVKwnyr1xS9s9voExA9lV6bkZPyWjA0VdFPGg+bRwDPVtT0GheV?=
 =?us-ascii?Q?pC28EOWk/oF/YzkLNLD+bCB816exDJwOV/ubI/CdAL5/jAzuNxmhrIF5DO4N?=
 =?us-ascii?Q?GTsojkJZEo1hJYeyrNmMcTSXMAPpCvt4OkyQizLBLwQS9+i2Bxfb0Fea67Vm?=
 =?us-ascii?Q?5l5jXBAsta6ACzHwbwdqjurNqxosMTKvc4qQhqsEsJsSHeg79dIXuUKBDyXi?=
 =?us-ascii?Q?FNyFeRBtiFyb7aUQwk0UdzJxqW9eVGI0y/xiGMVBbf2h5iF0YlHH8ticyeAR?=
 =?us-ascii?Q?9SPwvd4yL14g86sOldUiqvqSDpq1Ies+jsUP5s51fUCGGyTR7Vy2CRCUGKni?=
 =?us-ascii?Q?YidcgfTabEmNDMrutrUsz8Fl7W1ggR/qWV+7KDNT2qrBKaUBb0lSioN5tIGg?=
 =?us-ascii?Q?kjqrz2rGPD8SPOnEk4ZojWzHdBnpYeHQ0fNefEg60AIayNgFTZ0NapB9DmZV?=
 =?us-ascii?Q?v1s9ENF1zkjWIqIi3RYgN1IIQCoyJjPHELMypbqwDIPJ308sr9LKqNEVVVrj?=
 =?us-ascii?Q?ps4dNDVFZBfetXP4VIRklxzBqqK9vO2+Oi+L2XWKEgo0BzF+u1ZuqKN/y2+g?=
 =?us-ascii?Q?nrJkVREhGY6m0SjuX8gkYt67XIu2WE9dSH9sIiM0WjyA1apix3WD9RE6FIPd?=
 =?us-ascii?Q?u0+Vsn0I0uMf0AEkYoFwK5YCKMtxEsUUhjFN57iiaotUrTsaYKTRgN4/SxFW?=
 =?us-ascii?Q?oQWS8qqeep3w2YM57fwp+Lds366mHBJIilmwVCKEX0U0wP7fFksttyRFC1o+?=
 =?us-ascii?Q?lVdehgYg6fLfu7opYTHGpu5v+AMeHiKWrOslVWqg1HpHjrSCn5gPb72PB1XM?=
 =?us-ascii?Q?O83v9Xvxpv/EMJu5IasE5nlb+sUiGQtd6HZNqgk19P9idBWyIyuIzpHKWMry?=
 =?us-ascii?Q?Bzyd92hvjiopV6zFPr4AHE33XISZI8qEgyP9tcKDw8z/XLn2z1OpJ9a4FQFj?=
 =?us-ascii?Q?n8y4Qpt4eZZoXjHNsThRjUcnaeSs/2cmk+IFkjdqg2aaVMO11jK9NEW6MLXD?=
 =?us-ascii?Q?9vN/xv9IDdQELAXKghgXAJVHStwtnLwqQCyTkqXbQKM05tfnSKrMM3itkQE0?=
 =?us-ascii?Q?5EZ4eJxuczSXpVcRuh7f3gavN9YGoBOxrWHMi1g4CvRQEqEvknGV3Dbuj5Ej?=
 =?us-ascii?Q?lgW8JVg5A3YeIpxL5uXYUeUnZLvn7Au3Vwd6XM7VpxW1A0AFSddZwfrgkBI3?=
 =?us-ascii?Q?9Ei8lLmC8PhfmKQcF2oXOw2kO5uT4OheiIbG6knLL1km9lIfo7B0iTK58EIL?=
 =?us-ascii?Q?4a4j0Ot/nsvE+vi591dPEYHf01+epSGHoQ1GUgarSzQKtr7EvOJf1J3JyhTc?=
 =?us-ascii?Q?jbh8ok4yl4U6BRzD/VTxbiL5KuPpaXCpcTv3wd2zECs3PPDymshQS24M8+/K?=
 =?us-ascii?Q?7tIrnM8ztVDygGabt/+RgQX7LybprGtquAeTJq0RMcegsovw4B0+9sUr5/cM?=
 =?us-ascii?Q?E4CJG/bWXQAgEHzTEcmLt5EBNYGKY7GET1X2nhbIpYVXuFZj8vIGQFy3GYgT?=
 =?us-ascii?Q?F00HHglXpVKd2KxAjpEfwsSY2P0BS8+GNrVmAz5DA+0idNY2aY4UcHBE46SB?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baea7122-a891-45fe-91fb-08dca1ae2294
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 13:34:05.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCfOjUwlNG41F82Lfw0Q7BUTznoABf/tlOJN6cqjms81iWiAmzDJPo1VZWgPGQ/a6qE6uUwg1SC2aVcllsVyF1rNCa5VkSeAZwYkUxCaoSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

On Tue, Jul 02, 2024 at 05:25:29PM GMT, Umesh Nerlige Ramappa wrote:
>Add a helper iterator for virtual engines.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
> 1 file changed, 29 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index f2051c422..9d3d1b285 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -90,6 +90,34 @@ static const uint64_t batch_addr[] = {
> 	0x1d0000,
> 	0x1e0000,
> };
>+
>+#define MAX_GTS 2
>+#define MAX_INSTANCE 9
>+struct virtual_hwe {
>+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>+	int count;
>+} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};

there's no concept of "virtual engine". I think this is something
brought over from i915? Is it related to the width when submitting?

Please add a comment for the confused reader and it's probably worth
this abstraction to be outside this test. +Matt Brost

>+
>+static void list_virtual_engines(int fd)

list? shouldn't it be virtual_engines_init()?

Lucas De Marchi

>+{
>+	struct drm_xe_engine_class_instance *hwe;
>+
>+	xe_for_each_engine(fd, hwe) {
>+		struct virtual_hwe *v;
>+
>+		igt_assert(hwe->gt_id < MAX_GTS);
>+		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
>+		v = &vhwe[hwe->gt_id][hwe->engine_class];
>+
>+		igt_assert(v->count < MAX_INSTANCE);
>+		v->eci[v->count++] = *hwe;
>+	}
>+}
>+#define xe_for_each_multi_engine(__fd, __hwe, __count) \
>+	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
>+		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
>+			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
>+
> static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> {
> 	struct drm_client_fdinfo info = { };
>@@ -678,6 +706,7 @@ igt_main
> 		xe = drm_open_driver(DRIVER_XE);
> 		igt_require_xe(xe);
> 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>+		list_virtual_engines(xe);
> 	}
>
> 	igt_describe("Check if basic fdinfo content is present for memory");
>-- 
>2.38.1
>
